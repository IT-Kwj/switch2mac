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
    texture2d<float> fp_t_tcb_C [[id(3)]];
    sampler fp_t_tcb_CSmplr [[id(4)]];
    texture2d<float> fp_t_tcb_A [[id(5)]];
    sampler fp_t_tcb_ASmplr [[id(6)]];
    sampler fp_t_tcb_8Smplr_w [[id(7)]];
    sampler fp_t_tcb_CSmplr_w [[id(8)]];
    sampler fp_t_tcb_ASmplr_w [[id(9)]];
    constant dm_border_t* dm_border [[id(10)]];
};

struct main0_out
{
    float4 m_38 [[color(0)]];
};

struct main0_in
{
    float4 m_33 [[user(locn0)]];
    float4 m_35 [[user(locn1)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _45 = gl_FragCoord.w;
    float _47 = in.m_33.x;
    float _49 = gl_FragCoord.w;
    float _51 = _47 * _49;
    float _53 = in.m_33.y;
    float _55 = gl_FragCoord.w;
    float _57 = _53 * _55;
    float _59 = 1.0 / _45;
    float _61 = _59 * _51;
    float _63 = _59 * _57;
    float2 _285 = float2(_61, _63);
    float _65 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_285, float2(0.0), isnan(_285))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_285, float2(0.0), isnan(_285))).x;
    float2 _296 = float2(_61, _63);
    float _67 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_296, float2(0.0), isnan(_296))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_296, float2(0.0), isnan(_296))).x;
    float _69 = in.m_35.z;
    float _71 = gl_FragCoord.w;
    float _73 = _69 * _71;
    float _75 = in.m_35.x;
    float _77 = gl_FragCoord.w;
    float _79 = _75 * _77;
    float _81 = in.m_35.y;
    float _83 = gl_FragCoord.w;
    float _85 = _81 * _83;
    float _87 = _59 * _73;
    float _89 = -_65;
    float _91 = fma(_89, (*spvDescriptorSet0.fp_c3)._m0[6].y, (*spvDescriptorSet0.fp_c3)._m0[6].x);
    float _93 = 1.0 / _91;
    float _95 = fma(_93, (*spvDescriptorSet0.fp_c3)._m0[4].x, (*spvDescriptorSet0.fp_c3)._m0[5].x);
    float _97 = precise::clamp(_95, 0.0, 1.0);
    float _99 = precise::max(_67, _97);
    float _101 = _59 * _85;
    float _103 = precise::max(_99, _87);
    float _105 = _59 * _79;
    bool _109 = _103 != 0.0;
    bool _111 = isnan(_103);
    bool _113 = _109 || _111;
    bool _115 = isnan(0.0);
    bool _117 = _113 || _115;
    bool _119 = !_117;
    if (!_119)
    {
        float _121 = (-1.0) + (*spvDescriptorSet0.fp_c3)._m0[0].y;
        float _123 = fma(_103, _121, 1.0);
        float _125 = log2(_123);
        float _127 = _125 + (-1.0);
        float _129 = exp2(_127);
        float _131 = _129 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
        float _133 = fma(_131, (*spvDescriptorSet0.fp_c3)._m0[8].x, _61);
        float _135 = fma(_131, (*spvDescriptorSet0.fp_c3)._m0[8].y, _63);
        float _137 = -_131;
        float _139 = fma(_137, (*spvDescriptorSet0.fp_c3)._m0[8].x, _61);
        float _141 = -_131;
        float _143 = fma(_141, (*spvDescriptorSet0.fp_c3)._m0[8].y, _63);
        float _145 = fma(_131, (*spvDescriptorSet0.fp_c3)._m0[8].z, _61);
        float _147 = fma(_131, (*spvDescriptorSet0.fp_c3)._m0[8].w, _63);
        float _149 = -_131;
        float _151 = fma(_149, (*spvDescriptorSet0.fp_c3)._m0[8].z, _61);
        float _153 = -_131;
        float _155 = fma(_153, (*spvDescriptorSet0.fp_c3)._m0[8].w, _63);
        float2 _446 = float2(_133, _135);
        float3 _159 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_446, float2(0.0), isnan(_446)), level(_127)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_446, float2(0.0), isnan(_446)), level(_127)).xyz;
        float _161 = _159.x;
        float _163 = _159.y;
        float _165 = _159.z;
        float2 _461 = float2(_139, _143);
        float3 _167 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_461, float2(0.0), isnan(_461)), level(_127)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_461, float2(0.0), isnan(_461)), level(_127)).xyz;
        float _169 = _167.x;
        float _171 = _167.y;
        float _173 = _167.z;
        float2 _476 = float2(_145, _147);
        float3 _175 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_476, float2(0.0), isnan(_476)), level(_127)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_476, float2(0.0), isnan(_476)), level(_127)).xyz;
        float _177 = _175.x;
        float _179 = _175.y;
        float _181 = _175.z;
        float2 _491 = float2(_151, _155);
        float3 _183 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_491, float2(0.0), isnan(_491)), level(_127)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_491, float2(0.0), isnan(_491)), level(_127)).xyz;
        float _185 = _183.x;
        float _187 = _183.y;
        float _189 = _183.z;
        float _191 = 0.0 + _125;
        float _193 = precise::clamp(_191, 0.0, 1.0);
        float _195 = fma(_101, _193, _105);
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
        float _241 = fma(_105, _231, _219);
        float _243 = fma(_105, _235, _223);
        float _245 = fma(_105, _239, _227);
        float _247 = _241 * _209;
        float _249 = _243 * _209;
        float _251 = _245 * _209;
        out.m_38.x = _247;
        out.m_38.y = _249;
        out.m_38.z = _251;
        out.m_38.w = _195;
        return out;
    }
    out.m_38.x = (*spvDescriptorSet0.fp_c3)._m0[12].x;
    out.m_38.y = (*spvDescriptorSet0.fp_c3)._m0[12].y;
    out.m_38.z = (*spvDescriptorSet0.fp_c3)._m0[12].z;
    out.m_38.w = _105;
    return out;
}

