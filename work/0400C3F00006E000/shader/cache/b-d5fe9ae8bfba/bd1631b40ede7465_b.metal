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
    float4 m_36 [[color(0)]];
};

struct main0_in
{
    float4 m_33 [[user(locn0)]];
    float4 m_38 [[user(locn1)]];
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
    float2 _309 = float2(_61, _63);
    float _65 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_309, float2(0.0), isnan(_309))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_309, float2(0.0), isnan(_309))).x;
    float _67 = -_65;
    float _69 = fma(_67, (*spvDescriptorSet0.fp_c3)._m0[6].y, (*spvDescriptorSet0.fp_c3)._m0[6].x);
    float _71 = 1.0 / _69;
    bool _75 = _71 >= (*spvDescriptorSet0.fp_c3)._m0[0].z;
    if (_75)
    {
        discard_fragment();
    }
    float2 _341 = float2(_61, _63);
    float _77 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_341, float2(0.0), isnan(_341))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_341, float2(0.0), isnan(_341))).x;
    if (_75)
    {
        out.m_36.x = 0.0;
        out.m_36.y = 0.0;
        out.m_36.z = 0.0;
        out.m_36.w = 0.0;
        return out;
    }
    float _79 = in.m_38.z;
    float _81 = gl_FragCoord.w;
    float _83 = _79 * _81;
    float _85 = in.m_38.x;
    float _87 = gl_FragCoord.w;
    float _89 = _85 * _87;
    float _91 = in.m_38.y;
    float _93 = gl_FragCoord.w;
    float _95 = _91 * _93;
    float _97 = fma(_71, (*spvDescriptorSet0.fp_c3)._m0[4].x, (*spvDescriptorSet0.fp_c3)._m0[5].x);
    float _99 = precise::clamp(_97, 0.0, 1.0);
    float _101 = precise::max(_77, _99);
    float _103 = fma(_71, (*spvDescriptorSet0.fp_c3)._m0[4].z, (*spvDescriptorSet0.fp_c3)._m0[5].z);
    float _105 = precise::clamp(_103, 0.0, 1.0);
    float _107 = _59 * _83;
    float _109 = _59 * _95;
    float _111 = precise::max(_101, _107);
    bool _113 = _111 != 0.0;
    bool _115 = isnan(_111);
    bool _117 = _113 || _115;
    bool _119 = isnan(0.0);
    bool _121 = _117 || _119;
    float _123 = fma(_71, (*spvDescriptorSet0.fp_c3)._m0[4].w, (*spvDescriptorSet0.fp_c3)._m0[5].w);
    float _125 = precise::clamp(_123, 0.0, 1.0);
    float _127 = _59 * _89;
    float _129 = precise::min(_105, _125);
    bool _131 = !_121;
    if (!_131)
    {
        float _133 = (-1.0) + (*spvDescriptorSet0.fp_c3)._m0[0].y;
        float _135 = fma(_111, _133, 1.0);
        float _137 = log2(_135);
        float _139 = _137 + (-1.0);
        float _141 = exp2(_139);
        float _143 = _141 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
        float _145 = fma(_143, (*spvDescriptorSet0.fp_c3)._m0[8].x, _61);
        float _147 = fma(_143, (*spvDescriptorSet0.fp_c3)._m0[8].y, _63);
        float _149 = -_143;
        float _151 = fma(_149, (*spvDescriptorSet0.fp_c3)._m0[8].x, _61);
        float _153 = -_143;
        float _155 = fma(_153, (*spvDescriptorSet0.fp_c3)._m0[8].y, _63);
        float _157 = fma(_143, (*spvDescriptorSet0.fp_c3)._m0[8].z, _61);
        float _159 = fma(_143, (*spvDescriptorSet0.fp_c3)._m0[8].w, _63);
        float _161 = -_143;
        float _163 = fma(_161, (*spvDescriptorSet0.fp_c3)._m0[8].z, _61);
        float2 _497 = float2(_145, _147);
        float3 _167 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_497, float2(0.0), isnan(_497)), level(_139)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_497, float2(0.0), isnan(_497)), level(_139)).xyz;
        float _169 = _167.x;
        float _171 = _167.y;
        float _173 = _167.z;
        float _175 = -_143;
        float _177 = fma(_175, (*spvDescriptorSet0.fp_c3)._m0[8].w, _63);
        float2 _519 = float2(_151, _155);
        float3 _179 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_519, float2(0.0), isnan(_519)), level(_139)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_519, float2(0.0), isnan(_519)), level(_139)).xyz;
        float _181 = _179.x;
        float _183 = _179.y;
        float _185 = _179.z;
        float2 _534 = float2(_157, _159);
        float3 _187 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_534, float2(0.0), isnan(_534)), level(_139)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_534, float2(0.0), isnan(_534)), level(_139)).xyz;
        float _189 = _187.x;
        float _191 = _187.y;
        float _193 = _187.z;
        float2 _549 = float2(_163, _177);
        float3 _195 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_549, float2(0.0), isnan(_549)), level(_139)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_549, float2(0.0), isnan(_549)), level(_139)).xyz;
        float _197 = _195.x;
        float _199 = _195.y;
        float _201 = _195.z;
        float _203 = 0.0 + _137;
        float _205 = precise::clamp(_203, 0.0, 1.0);
        float _207 = fma(_109, _205, _127);
        float _209 = _129 * (*spvDescriptorSet0.fp_c3)._m0[0].w;
        float _211 = _171 + _183;
        float _213 = _169 + _181;
        float _215 = _173 + _185;
        float _217 = _211 + _191;
        float _219 = _213 + _189;
        float _221 = _215 + _193;
        float _223 = _217 + _199;
        float _225 = _219 + _197;
        float _227 = _221 + _201;
        float _229 = _223 * 0.14665000140666961669921875;
        float _231 = _223 * 0.25;
        float _233 = _227 * 0.25;
        float _235 = fma(_225, 0.0747250020503997802734375, _229);
        float _237 = _225 * 0.25;
        float _239 = fma(_227, 0.028599999845027923583984375, _235);
        float _241 = -_237;
        float _243 = _241 + _239;
        float _245 = -_231;
        float _247 = _245 + _239;
        float _249 = -_233;
        float _251 = _249 + _239;
        float _253 = fma(_209, _243, _237);
        float _255 = fma(_209, _247, _231);
        float _257 = fma(_209, _251, _233);
        float _259 = -_253;
        float _261 = fma(_253, (*spvDescriptorSet0.fp_c3)._m0[13].x, _259);
        float _263 = -_255;
        float _265 = fma(_255, (*spvDescriptorSet0.fp_c3)._m0[13].y, _263);
        float _267 = -_257;
        float _269 = fma(_257, (*spvDescriptorSet0.fp_c3)._m0[13].z, _267);
        float _271 = fma(_129, _261, _253);
        float _273 = fma(_129, _265, _255);
        float _275 = fma(_129, _269, _257);
        out.m_36.x = _271;
        out.m_36.y = _273;
        out.m_36.z = _275;
        out.m_36.w = _207;
        return out;
    }
    discard_fragment();
    return out;
}

