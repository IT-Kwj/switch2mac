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
    float4 m_40 [[color(1)]];
};

struct main0_in
{
    float4 m_35 [[user(locn0)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _47 = gl_FragCoord.w;
    float _49 = in.m_35.x;
    float _51 = gl_FragCoord.w;
    float _53 = _49 * _51;
    float _55 = in.m_35.y;
    float _57 = gl_FragCoord.w;
    float _59 = _55 * _57;
    float _61 = 1.0 / _47;
    float _63 = _61 * _53;
    float _65 = _61 * _59;
    float2 _243 = float2(_63, _65);
    float3 _69 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_243, float2(0.0), isnan(_243))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_243, float2(0.0), isnan(_243))).xyz;
    float _71 = _69.x;
    float _73 = _69.y;
    float _75 = _69.z;
    float _77 = _73 * (*spvDescriptorSet0.fp_c4)._m0[1].y;
    float _79 = _73 * (*spvDescriptorSet0.fp_c4)._m0[2].y;
    float _81 = fma(_71, (*spvDescriptorSet0.fp_c4)._m0[1].x, _77);
    float _83 = fma(_71, (*spvDescriptorSet0.fp_c4)._m0[2].x, _79);
    float _85 = fma(_75, (*spvDescriptorSet0.fp_c4)._m0[1].z, _81);
    float _87 = -_75;
    float _89 = fma(_87, (*spvDescriptorSet0.fp_c4)._m0[1].z, _81);
    float _91 = fma(_75, (*spvDescriptorSet0.fp_c4)._m0[2].z, _83);
    float _93 = -_75;
    float _95 = fma(_93, (*spvDescriptorSet0.fp_c4)._m0[2].z, _83);
    float _97 = fma(_85, -0.5, 0.5);
    float _99 = fma(_89, -0.5, 0.5);
    float _101 = fma(_91, -0.5, 0.5);
    float _103 = fma(_95, -0.5, 0.5);
    float2 _318 = float2(_97, (*spvDescriptorSet0.fp_c5)._m0[8].x);
    float _105 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_318, float2(0.0), isnan(_318))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_318, float2(0.0), isnan(_318))).x;
    float2 _327 = float2(_99, (*spvDescriptorSet0.fp_c5)._m0[8].x);
    float _107 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_327, float2(0.0), isnan(_327))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_327, float2(0.0), isnan(_327))).x;
    float2 _337 = float2(_101, (*spvDescriptorSet0.fp_c5)._m0[9].x);
    float _109 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_337, float2(0.0), isnan(_337))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_337, float2(0.0), isnan(_337))).x;
    float2 _346 = float2(_103, (*spvDescriptorSet0.fp_c5)._m0[9].x);
    float _111 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_346, float2(0.0), isnan(_346))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_346, float2(0.0), isnan(_346))).x;
    float _113 = abs(_75);
    float _115 = -_113;
    float _117 = _115 + 1.0;
    float _119 = _103 + _99;
    float _121 = _117 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _123 = precise::clamp(_121, 0.0, 1.0);
    float _125 = _101 + _97;
    float _127 = abs(_123);
    float _129 = log2(_127);
    float _131 = -(*spvDescriptorSet0.fp_c5)._m0[16].x;
    float _133 = _131 + (*spvDescriptorSet0.fp_c5)._m0[17].x;
    float _135 = -(*spvDescriptorSet0.fp_c5)._m0[16].y;
    float _137 = _135 + (*spvDescriptorSet0.fp_c5)._m0[17].y;
    float _139 = -(*spvDescriptorSet0.fp_c5)._m0[18].z;
    float _141 = _139 + (*spvDescriptorSet0.fp_c5)._m0[19].z;
    float _143 = -(*spvDescriptorSet0.fp_c5)._m0[16].z;
    float _145 = _143 + (*spvDescriptorSet0.fp_c5)._m0[17].z;
    float _147 = -(*spvDescriptorSet0.fp_c5)._m0[18].x;
    float _149 = _147 + (*spvDescriptorSet0.fp_c5)._m0[19].x;
    float _151 = -(*spvDescriptorSet0.fp_c5)._m0[18].y;
    float _153 = _151 + (*spvDescriptorSet0.fp_c5)._m0[19].y;
    float _155 = _129 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
    float _157 = exp2(_155);
    float _159 = fma(_157, (*spvDescriptorSet0.fp_c4)._m0[0].w, _125);
    float _161 = fma(_157, (*spvDescriptorSet0.fp_c4)._m0[0].w, _119);
    float _163 = fma(_105, _133, (*spvDescriptorSet0.fp_c5)._m0[16].x);
    float _165 = fma(_105, _137, (*spvDescriptorSet0.fp_c5)._m0[16].y);
    float _167 = fma(_105, _145, (*spvDescriptorSet0.fp_c5)._m0[16].z);
    float _169 = fma(_133, _107, (*spvDescriptorSet0.fp_c5)._m0[16].x);
    float _171 = fma(_109, _149, (*spvDescriptorSet0.fp_c5)._m0[18].x);
    float _173 = fma(_109, _153, (*spvDescriptorSet0.fp_c5)._m0[18].y);
    float _175 = fma(_109, _141, (*spvDescriptorSet0.fp_c5)._m0[18].z);
    float _177 = fma(_149, _111, (*spvDescriptorSet0.fp_c5)._m0[18].x);
    float _179 = fma(_137, _107, (*spvDescriptorSet0.fp_c5)._m0[16].y);
    float _181 = fma(_145, _107, (*spvDescriptorSet0.fp_c5)._m0[16].z);
    float _183 = fma(_153, _111, (*spvDescriptorSet0.fp_c5)._m0[18].y);
    float _185 = fma(_141, _111, (*spvDescriptorSet0.fp_c5)._m0[18].z);
    float _187 = _175 + _167;
    float _189 = _177 + _169;
    float _191 = _171 + _163;
    float _193 = _173 + _165;
    float _195 = _183 + _179;
    float _197 = _185 + _181;
    float _199 = fma(_157, (*spvDescriptorSet0.fp_c4)._m0[0].x, _191);
    float _201 = fma(_157, (*spvDescriptorSet0.fp_c4)._m0[0].y, _193);
    float _203 = fma(_157, (*spvDescriptorSet0.fp_c4)._m0[0].z, _187);
    float _205 = fma(_157, (*spvDescriptorSet0.fp_c4)._m0[0].x, _189);
    float _207 = fma(_157, (*spvDescriptorSet0.fp_c4)._m0[0].y, _195);
    float _209 = fma(_157, (*spvDescriptorSet0.fp_c4)._m0[0].z, _197);
    out.m_38.x = _199;
    out.m_38.y = _201;
    out.m_38.z = _203;
    out.m_38.w = _159;
    out.m_40.x = _205;
    out.m_40.y = _207;
    out.m_40.z = _209;
    out.m_40.w = _161;
    return out;
}

