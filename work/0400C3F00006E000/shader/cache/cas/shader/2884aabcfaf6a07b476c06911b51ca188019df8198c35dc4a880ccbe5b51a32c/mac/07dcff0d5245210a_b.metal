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
    constant _16* fp_c3 [[id(0)]];
    texture2d<float> fp_t_tcb_8 [[id(1)]];
    sampler fp_t_tcb_8Smplr [[id(2)]];
    texture2d<float> fp_t_tcb_A [[id(3)]];
    sampler fp_t_tcb_ASmplr [[id(4)]];
    sampler fp_t_tcb_8Smplr_w [[id(5)]];
    sampler fp_t_tcb_ASmplr_w [[id(6)]];
    constant dm_border_t* dm_border [[id(7)]];
};

struct main0_out
{
    float4 m_36 [[color(0)]];
};

struct main0_in
{
    float4 m_31 [[user(locn0)]];
    float4 m_33 [[user(locn1)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _43 = gl_FragCoord.w;
    float _45 = in.m_31.x;
    float _47 = gl_FragCoord.w;
    float _49 = _45 * _47;
    float _51 = in.m_31.y;
    float _53 = gl_FragCoord.w;
    float _55 = _51 * _53;
    float _57 = 1.0 / _43;
    float _59 = _57 * _49;
    float _61 = _57 * _55;
    float2 _285 = float2(_59, _61);
    float _63 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_285, float2(0.0), isnan(_285))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_285, float2(0.0), isnan(_285))).x;
    float _65 = in.m_33.x;
    float _67 = gl_FragCoord.w;
    float _69 = _65 * _67;
    float _71 = in.m_33.y;
    float _73 = gl_FragCoord.w;
    float _75 = _71 * _73;
    float _77 = in.m_33.z;
    float _79 = gl_FragCoord.w;
    float _81 = _77 * _79;
    float _83 = _57 * _69;
    float _85 = _57 * _75;
    float _87 = _57 * _81;
    float _89 = -_63;
    float _91 = fma(_89, (*spvDescriptorSet0.fp_c3)._m0[6].y, (*spvDescriptorSet0.fp_c3)._m0[6].x);
    float _93 = 1.0 / _91;
    float _95 = fma(_93, (*spvDescriptorSet0.fp_c3)._m0[4].x, (*spvDescriptorSet0.fp_c3)._m0[5].x);
    float _97 = precise::clamp(_95, 0.0, 1.0);
    float _99 = fma(_93, (*spvDescriptorSet0.fp_c3)._m0[4].y, (*spvDescriptorSet0.fp_c3)._m0[5].y);
    float _101 = precise::clamp(_99, 0.0, 1.0);
    float _103 = precise::max(_97, _101);
    float _105 = precise::max(_103, _87);
    bool _109 = _105 != 0.0;
    bool _111 = isnan(_105);
    bool _113 = _109 || _111;
    bool _115 = isnan(0.0);
    bool _117 = _113 || _115;
    bool _119 = !_117;
    if (!_119)
    {
        float _121 = (-1.0) + (*spvDescriptorSet0.fp_c3)._m0[0].y;
        float _123 = fma(_105, _121, 1.0);
        float _125 = log2(_123);
        float _127 = _125 + (-1.0);
        float _129 = exp2(_127);
        float _131 = _129 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
        float _133 = fma(_131, (*spvDescriptorSet0.fp_c3)._m0[8].x, _59);
        float _135 = fma(_131, (*spvDescriptorSet0.fp_c3)._m0[8].y, _61);
        float _137 = -_131;
        float _139 = fma(_137, (*spvDescriptorSet0.fp_c3)._m0[8].x, _59);
        float _141 = -_131;
        float _143 = fma(_141, (*spvDescriptorSet0.fp_c3)._m0[8].y, _61);
        float _145 = fma(_131, (*spvDescriptorSet0.fp_c3)._m0[8].z, _59);
        float _147 = fma(_131, (*spvDescriptorSet0.fp_c3)._m0[8].w, _61);
        float _149 = -_131;
        float _151 = fma(_149, (*spvDescriptorSet0.fp_c3)._m0[8].z, _59);
        float _153 = -_131;
        float _155 = fma(_153, (*spvDescriptorSet0.fp_c3)._m0[8].w, _61);
        float2 _446 = float2(_133, _135);
        float3 _159 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_446, float2(0.0), isnan(_446)), level(_127)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_446, float2(0.0), isnan(_446)), level(_127)).xyz;
        float _161 = _159.x;
        float _163 = _159.y;
        float _165 = _159.z;
        float2 _461 = float2(_139, _143);
        float3 _167 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_461, float2(0.0), isnan(_461)), level(_127)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_461, float2(0.0), isnan(_461)), level(_127)).xyz;
        float _169 = _167.x;
        float _171 = _167.y;
        float _173 = _167.z;
        float2 _476 = float2(_145, _147);
        float3 _175 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_476, float2(0.0), isnan(_476)), level(_127)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_476, float2(0.0), isnan(_476)), level(_127)).xyz;
        float _177 = _175.x;
        float _179 = _175.y;
        float _181 = _175.z;
        float2 _491 = float2(_151, _155);
        float3 _183 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_491, float2(0.0), isnan(_491)), level(_127)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_491, float2(0.0), isnan(_491)), level(_127)).xyz;
        float _185 = _183.x;
        float _187 = _183.y;
        float _189 = _183.z;
        float _191 = 0.0 + _125;
        float _193 = precise::clamp(_191, 0.0, 1.0);
        float _195 = fma(_85, _193, _83);
        float _197 = _161 + _169;
        float _199 = _163 + _171;
        float _201 = _165 + _173;
        float _203 = _197 + _177;
        float _205 = _199 + _179;
        float _207 = _201 + _181;
        float _209 = 1.0 / _195;
        float _211 = _203 + _185;
        float _213 = _205 + _187;
        float _215 = _207 + _189;
        float _217 = _193 * _211;
        float _219 = _217 * 0.25;
        float _221 = _193 * _213;
        float _223 = _221 * 0.25;
        float _225 = _193 * _215;
        float _227 = _225 * 0.25;
        float _229 = -_219;
        float _231 = _229 + (*spvDescriptorSet0.fp_c3)._m0[12].x;
        float _233 = -_223;
        float _235 = _233 + (*spvDescriptorSet0.fp_c3)._m0[12].y;
        float _237 = -_227;
        float _239 = _237 + (*spvDescriptorSet0.fp_c3)._m0[12].z;
        float _241 = fma(_83, _231, _219);
        float _243 = fma(_83, _235, _223);
        float _245 = fma(_83, _239, _227);
        float _247 = _241 * _209;
        float _249 = _243 * _209;
        float _251 = _245 * _209;
        out.m_36.x = _247;
        out.m_36.y = _249;
        out.m_36.z = _251;
        out.m_36.w = _195;
        return out;
    }
    out.m_36.x = (*spvDescriptorSet0.fp_c3)._m0[12].x;
    out.m_36.y = (*spvDescriptorSet0.fp_c3)._m0[12].y;
    out.m_36.z = (*spvDescriptorSet0.fp_c3)._m0[12].z;
    out.m_36.w = _83;
    return out;
}

