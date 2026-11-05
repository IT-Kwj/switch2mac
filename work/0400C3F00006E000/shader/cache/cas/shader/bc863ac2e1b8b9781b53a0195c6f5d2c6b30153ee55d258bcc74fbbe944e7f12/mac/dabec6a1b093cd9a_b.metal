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
    float2 _233 = float2(_61, _63);
    float3 _67 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_233, float2(0.0), isnan(_233))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_233, float2(0.0), isnan(_233))).xyz;
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
    float2 _306 = float2(_93, (*spvDescriptorSet0.fp_c5)._m0[8].x);
    float _99 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_306, float2(0.0), isnan(_306))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_306, float2(0.0), isnan(_306))).x;
    float2 _316 = float2(_95, (*spvDescriptorSet0.fp_c5)._m0[9].x);
    float _101 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_316, float2(0.0), isnan(_316))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_316, float2(0.0), isnan(_316))).x;
    float2 _326 = float2(_97, (*spvDescriptorSet0.fp_c5)._m0[10].x);
    float _103 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_326, float2(0.0), isnan(_326))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_326, float2(0.0), isnan(_326))).x;
    float _105 = abs(_73);
    float _107 = -_105;
    float _109 = _107 + 1.0;
    float _111 = _93 + _95;
    float _113 = _109 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _115 = precise::clamp(_113, 0.0, 1.0);
    float _117 = _97 + _111;
    float _119 = abs(_115);
    float _121 = log2(_119);
    float _123 = -(*spvDescriptorSet0.fp_c5)._m0[16].x;
    float _125 = _123 + (*spvDescriptorSet0.fp_c5)._m0[17].x;
    float _127 = -(*spvDescriptorSet0.fp_c5)._m0[16].z;
    float _129 = _127 + (*spvDescriptorSet0.fp_c5)._m0[17].z;
    float _131 = -(*spvDescriptorSet0.fp_c5)._m0[16].y;
    float _133 = _131 + (*spvDescriptorSet0.fp_c5)._m0[17].y;
    float _135 = -(*spvDescriptorSet0.fp_c5)._m0[18].y;
    float _137 = _135 + (*spvDescriptorSet0.fp_c5)._m0[19].y;
    float _139 = -(*spvDescriptorSet0.fp_c5)._m0[18].z;
    float _141 = _139 + (*spvDescriptorSet0.fp_c5)._m0[19].z;
    float _143 = _121 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
    float _145 = fma(_99, _129, (*spvDescriptorSet0.fp_c5)._m0[16].z);
    float _147 = -(*spvDescriptorSet0.fp_c5)._m0[18].x;
    float _149 = _147 + (*spvDescriptorSet0.fp_c5)._m0[19].x;
    float _151 = fma(_99, _125, (*spvDescriptorSet0.fp_c5)._m0[16].x);
    float _153 = fma(_101, _137, (*spvDescriptorSet0.fp_c5)._m0[18].y);
    float _155 = fma(_101, _141, (*spvDescriptorSet0.fp_c5)._m0[18].z);
    float _157 = fma(_101, _149, (*spvDescriptorSet0.fp_c5)._m0[18].x);
    float _159 = fma(_99, _133, (*spvDescriptorSet0.fp_c5)._m0[16].y);
    float _161 = exp2(_143);
    float _163 = _151 + _157;
    float _165 = _159 + _153;
    float _167 = -(*spvDescriptorSet0.fp_c5)._m0[20].x;
    float _169 = _167 + (*spvDescriptorSet0.fp_c5)._m0[21].x;
    float _171 = -(*spvDescriptorSet0.fp_c5)._m0[20].y;
    float _173 = _171 + (*spvDescriptorSet0.fp_c5)._m0[21].y;
    float _175 = -(*spvDescriptorSet0.fp_c5)._m0[20].z;
    float _177 = _175 + (*spvDescriptorSet0.fp_c5)._m0[21].z;
    float _179 = _145 + _155;
    float _181 = fma(_103, _169, (*spvDescriptorSet0.fp_c5)._m0[20].x);
    float _183 = fma(_103, _173, (*spvDescriptorSet0.fp_c5)._m0[20].y);
    float _185 = fma(_103, _177, (*spvDescriptorSet0.fp_c5)._m0[20].z);
    float _187 = _181 + _163;
    float _189 = _183 + _165;
    float _191 = _185 + _179;
    float _193 = fma(_161, (*spvDescriptorSet0.fp_c4)._m0[0].w, _117);
    float _195 = fma(_161, (*spvDescriptorSet0.fp_c4)._m0[0].x, _187);
    float _197 = fma(_161, (*spvDescriptorSet0.fp_c4)._m0[0].y, _189);
    float _199 = fma(_161, (*spvDescriptorSet0.fp_c4)._m0[0].z, _191);
    out.m_38.x = _195;
    out.m_38.y = _197;
    out.m_38.z = _199;
    out.m_38.w = _193;
    return out;
}

