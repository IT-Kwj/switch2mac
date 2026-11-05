#include <metal_stdlib>
#include <simd/simd.h>

using namespace metal;

struct dm_border_t { uint mask; float4 k[32]; };
static inline __attribute__((always_inline)) float4 dm_bmix(float4 r, float4 w, float4 k) { return r + (w - r) * k; }
static inline __attribute__((always_inline)) float dm_bmix(float r, float w, float4 k) { return r + (w - r) * k.x; }
template<typename V, typename T, typename... A> static inline __attribute__((always_inline)) V dm_bs(V r, constant dm_border_t* b, uint i, T t, sampler w, A... a)
{
    if (b->mask >> i & 1u) r = dm_bmix(r, t.sample(w, a...), b->k[i]);
    return r;
}

struct _10
{
    uint _m0;
    uint _m1[8];
    float4 _m2;
    float4 _m3;
    int _m4;
    float _m5[73];
    int4 _m6;
    int _m7;
};

struct _16
{
    float4 _m0[4096];
};

struct spvDescriptorSetBuffer0
{
    constant _16* fp_c4 [[id(0)]];
    constant _16* fp_c5 [[id(1)]];
    constant _16* fp_c3 [[id(2)]];
    texture2d<float> fp_t_tcb_A [[id(3)]];
    sampler fp_t_tcb_ASmplr [[id(4)]];
    texture2d<float> fp_t_tcb_8 [[id(5)]];
    sampler fp_t_tcb_8Smplr [[id(6)]];
    sampler fp_t_tcb_ASmplr_w [[id(7)]];
    sampler fp_t_tcb_8Smplr_w [[id(8)]];
    constant dm_border_t* dm_border [[id(9)]];
};

struct main0_out
{
    float4 m_38 [[color(0)]];
};

struct main0_in
{
    float4 m_35 [[user(locn0)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _45 = gl_FragCoord.w;
    float _47 = in.m_35.x;
    float _49 = gl_FragCoord.w;
    float _51 = _47 * _49;
    float _53 = in.m_35.y;
    float _55 = gl_FragCoord.w;
    float _57 = _53 * _55;
    float _59 = 1.0 / _45;
    float _61 = _59 * _51;
    float _63 = _59 * _57;
    float2 _257 = float2(_61, _63);
    float3 _67 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_257, float2(0.0), isnan(_257))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_257, float2(0.0), isnan(_257))).xyz;
    float _69 = _67.x;
    float _71 = _67.y;
    float _73 = _67.z;
    float _75 = _71 * (*spvDescriptorSet0.fp_c4)._m0[1].y;
    float _77 = _71 * (*spvDescriptorSet0.fp_c4)._m0[2].y;
    float _79 = _71 * (*spvDescriptorSet0.fp_c4)._m0[3].y;
    float _81 = fma(_69, (*spvDescriptorSet0.fp_c4)._m0[1].x, _75);
    float _83 = fma(_69, (*spvDescriptorSet0.fp_c4)._m0[2].x, _77);
    float _85 = fma(_69, (*spvDescriptorSet0.fp_c4)._m0[3].x, _79);
    float _87 = fma(_73, (*spvDescriptorSet0.fp_c4)._m0[1].z, _81);
    float _89 = fma(_73, (*spvDescriptorSet0.fp_c4)._m0[2].z, _83);
    float _91 = fma(_73, (*spvDescriptorSet0.fp_c4)._m0[3].z, _85);
    float _93 = fma(_87, -0.5, 0.5);
    float _95 = fma(_89, -0.5, 0.5);
    float _97 = fma(_91, -0.5, 0.5);
    float2 _330 = float2(_93, (*spvDescriptorSet0.fp_c5)._m0[8].x);
    float _99 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_330, float2(0.0), isnan(_330))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_330, float2(0.0), isnan(_330))).x;
    float2 _340 = float2(_95, (*spvDescriptorSet0.fp_c5)._m0[9].x);
    float _101 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_340, float2(0.0), isnan(_340))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_340, float2(0.0), isnan(_340))).x;
    float2 _350 = float2(_97, (*spvDescriptorSet0.fp_c5)._m0[10].x);
    float _103 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_350, float2(0.0), isnan(_350))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_350, float2(0.0), isnan(_350))).x;
    float _105 = abs(_73);
    float _107 = -_105;
    float _109 = _107 + 1.0;
    float _111 = _93 + _95;
    float _113 = _109 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _115 = precise::clamp(_113, 0.0, 1.0);
    float _117 = _97 + _111;
    float _119 = -(*spvDescriptorSet0.fp_c5)._m0[18].z;
    float _121 = _119 + (*spvDescriptorSet0.fp_c5)._m0[19].z;
    float _123 = abs(_115);
    float _125 = log2(_123);
    float _127 = -(*spvDescriptorSet0.fp_c5)._m0[16].x;
    float _129 = _127 + (*spvDescriptorSet0.fp_c5)._m0[17].x;
    float _131 = -(*spvDescriptorSet0.fp_c5)._m0[18].y;
    float _133 = _131 + (*spvDescriptorSet0.fp_c5)._m0[19].y;
    float _135 = abs(_99);
    float _137 = log2(_135);
    float _139 = abs(_101);
    float _141 = log2(_139);
    float _143 = abs(_103);
    float _145 = log2(_143);
    float _147 = _137 * (*spvDescriptorSet0.fp_c5)._m0[0].x;
    float _149 = -(*spvDescriptorSet0.fp_c5)._m0[16].y;
    float _151 = _149 + (*spvDescriptorSet0.fp_c5)._m0[17].y;
    float _153 = -(*spvDescriptorSet0.fp_c5)._m0[16].z;
    float _155 = _153 + (*spvDescriptorSet0.fp_c5)._m0[17].z;
    float _157 = -(*spvDescriptorSet0.fp_c5)._m0[18].x;
    float _159 = _157 + (*spvDescriptorSet0.fp_c5)._m0[19].x;
    float _161 = _141 * (*spvDescriptorSet0.fp_c5)._m0[1].x;
    float _163 = exp2(_147);
    float _165 = _145 * (*spvDescriptorSet0.fp_c5)._m0[2].x;
    float _167 = exp2(_161);
    float _169 = exp2(_165);
    float _171 = fma(_163, _151, (*spvDescriptorSet0.fp_c5)._m0[16].y);
    float _173 = _125 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
    float _175 = fma(_163, _129, (*spvDescriptorSet0.fp_c5)._m0[16].x);
    float _177 = fma(_163, _155, (*spvDescriptorSet0.fp_c5)._m0[16].z);
    float _179 = fma(_167, _159, (*spvDescriptorSet0.fp_c5)._m0[18].x);
    float _181 = fma(_167, _133, (*spvDescriptorSet0.fp_c5)._m0[18].y);
    float _183 = exp2(_173);
    float _185 = _175 + _179;
    float _187 = _171 + _181;
    float _189 = -(*spvDescriptorSet0.fp_c5)._m0[20].x;
    float _191 = _189 + (*spvDescriptorSet0.fp_c5)._m0[21].x;
    float _193 = -(*spvDescriptorSet0.fp_c5)._m0[20].y;
    float _195 = _193 + (*spvDescriptorSet0.fp_c5)._m0[21].y;
    float _197 = fma(_167, _121, (*spvDescriptorSet0.fp_c5)._m0[18].z);
    float _199 = -(*spvDescriptorSet0.fp_c5)._m0[20].z;
    float _201 = _199 + (*spvDescriptorSet0.fp_c5)._m0[21].z;
    float _203 = fma(_169, _191, (*spvDescriptorSet0.fp_c5)._m0[20].x);
    float _205 = fma(_169, _195, (*spvDescriptorSet0.fp_c5)._m0[20].y);
    float _207 = _177 + _197;
    float _209 = fma(_169, _201, (*spvDescriptorSet0.fp_c5)._m0[20].z);
    float _211 = _203 + _185;
    float _213 = _205 + _187;
    float _215 = _209 + _207;
    float _217 = fma(_183, (*spvDescriptorSet0.fp_c4)._m0[0].w, _117);
    float _219 = fma(_183, (*spvDescriptorSet0.fp_c4)._m0[0].x, _211);
    float _221 = fma(_183, (*spvDescriptorSet0.fp_c4)._m0[0].y, _213);
    float _223 = fma(_183, (*spvDescriptorSet0.fp_c4)._m0[0].z, _215);
    out.m_38.x = _219;
    out.m_38.y = _221;
    out.m_38.z = _223;
    out.m_38.w = _217;
    return out;
}

