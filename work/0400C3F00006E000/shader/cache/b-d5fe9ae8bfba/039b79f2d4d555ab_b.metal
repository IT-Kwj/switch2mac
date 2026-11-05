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
    float2 _313 = float2(_61, _63);
    float _65 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_313, float2(0.0), isnan(_313))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_313, float2(0.0), isnan(_313))).x;
    float2 _324 = float2(_61, _63);
    float _67 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_324, float2(0.0), isnan(_324))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_324, float2(0.0), isnan(_324))).x;
    float _69 = in.m_35.x;
    float _71 = gl_FragCoord.w;
    float _73 = _69 * _71;
    float _75 = in.m_35.y;
    float _77 = gl_FragCoord.w;
    float _79 = _75 * _77;
    float _81 = in.m_35.z;
    float _83 = gl_FragCoord.w;
    float _85 = _81 * _83;
    float _87 = _59 * _73;
    float _89 = _59 * _79;
    float _91 = _59 * _85;
    float _93 = -_65;
    float _95 = fma(_93, (*spvDescriptorSet0.fp_c3)._m0[6].y, (*spvDescriptorSet0.fp_c3)._m0[6].x);
    float _97 = 1.0 / _95;
    float _99 = fma(_97, (*spvDescriptorSet0.fp_c3)._m0[4].x, (*spvDescriptorSet0.fp_c3)._m0[5].x);
    float _101 = precise::clamp(_99, 0.0, 1.0);
    float _103 = precise::max(_67, _101);
    float _105 = precise::max(_103, _91);
    bool _109 = _105 != 0.0;
    bool _111 = isnan(_105);
    bool _113 = _109 || _111;
    bool _115 = isnan(0.0);
    bool _117 = _113 || _115;
    float _119 = fma(_97, (*spvDescriptorSet0.fp_c3)._m0[4].z, (*spvDescriptorSet0.fp_c3)._m0[5].z);
    float _121 = precise::clamp(_119, 0.0, 1.0);
    float _123 = fma(_97, (*spvDescriptorSet0.fp_c3)._m0[4].w, (*spvDescriptorSet0.fp_c3)._m0[5].w);
    float _125 = precise::clamp(_123, 0.0, 1.0);
    float _127 = precise::min(_121, _125);
    bool _129 = !_117;
    if (!_129)
    {
        float _131 = (-1.0) + (*spvDescriptorSet0.fp_c3)._m0[0].y;
        float _133 = fma(_105, _131, 1.0);
        float _135 = log2(_133);
        float _137 = _135 + (-1.0);
        float _139 = exp2(_137);
        float _141 = _139 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
        float _143 = fma(_141, (*spvDescriptorSet0.fp_c3)._m0[8].x, _61);
        float _145 = fma(_141, (*spvDescriptorSet0.fp_c3)._m0[8].y, _63);
        float _147 = -_141;
        float _149 = fma(_147, (*spvDescriptorSet0.fp_c3)._m0[8].x, _61);
        float _151 = -_141;
        float _153 = fma(_151, (*spvDescriptorSet0.fp_c3)._m0[8].y, _63);
        float _155 = fma(_141, (*spvDescriptorSet0.fp_c3)._m0[8].z, _61);
        float _157 = -_141;
        float _159 = fma(_157, (*spvDescriptorSet0.fp_c3)._m0[8].z, _61);
        float _161 = fma(_141, (*spvDescriptorSet0.fp_c3)._m0[8].w, _63);
        float _163 = -_141;
        float _165 = fma(_163, (*spvDescriptorSet0.fp_c3)._m0[8].w, _63);
        float2 _493 = float2(_143, _145);
        float3 _169 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_493, float2(0.0), isnan(_493)), level(_137)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_493, float2(0.0), isnan(_493)), level(_137)).xyz;
        float _171 = _169.x;
        float _173 = _169.y;
        float _175 = _169.z;
        float2 _508 = float2(_149, _153);
        float3 _177 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_508, float2(0.0), isnan(_508)), level(_137)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_508, float2(0.0), isnan(_508)), level(_137)).xyz;
        float _179 = _177.x;
        float _181 = _177.y;
        float _183 = _177.z;
        float2 _523 = float2(_155, _161);
        float3 _185 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_523, float2(0.0), isnan(_523)), level(_137)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_523, float2(0.0), isnan(_523)), level(_137)).xyz;
        float _187 = _185.x;
        float _189 = _185.y;
        float _191 = _185.z;
        float2 _538 = float2(_159, _165);
        float3 _193 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_538, float2(0.0), isnan(_538)), level(_137)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_538, float2(0.0), isnan(_538)), level(_137)).xyz;
        float _195 = _193.x;
        float _197 = _193.y;
        float _199 = _193.z;
        float _201 = _171 + _179;
        float _203 = _173 + _181;
        float _205 = _175 + _183;
        float _207 = _201 + _187;
        float _209 = _203 + _189;
        float _211 = _205 + _191;
        float _213 = _207 + _195;
        float _215 = _209 + _197;
        float _217 = _211 + _199;
        float _219 = _213 * 0.25;
        float _221 = 0.0 + _135;
        float _223 = precise::clamp(_221, 0.0, 1.0);
        float _225 = _215 * 0.25;
        float _227 = _217 * 0.25;
        float _229 = -_219;
        float _231 = fma(_219, (*spvDescriptorSet0.fp_c3)._m0[13].x, _229);
        float _233 = fma(_89, _223, _87);
        float _235 = -_225;
        float _237 = fma(_225, (*spvDescriptorSet0.fp_c3)._m0[13].y, _235);
        float _239 = -_227;
        float _241 = fma(_227, (*spvDescriptorSet0.fp_c3)._m0[13].z, _239);
        float _243 = fma(_127, _231, _219);
        float _245 = 1.0 / _233;
        float _247 = fma(_127, _237, _225);
        float _249 = fma(_127, _241, _227);
        float _251 = _223 * _243;
        float _253 = _223 * _247;
        float _255 = _223 * _249;
        float _257 = -_251;
        float _259 = _257 + (*spvDescriptorSet0.fp_c3)._m0[12].x;
        float _261 = -_253;
        float _263 = _261 + (*spvDescriptorSet0.fp_c3)._m0[12].y;
        float _265 = -_255;
        float _267 = _265 + (*spvDescriptorSet0.fp_c3)._m0[12].z;
        float _269 = fma(_87, _259, _251);
        float _271 = fma(_87, _263, _253);
        float _273 = fma(_87, _267, _255);
        float _275 = _269 * _245;
        float _277 = _271 * _245;
        float _279 = _273 * _245;
        out.m_38.x = _275;
        out.m_38.y = _277;
        out.m_38.z = _279;
        out.m_38.w = _233;
        return out;
    }
    out.m_38.x = (*spvDescriptorSet0.fp_c3)._m0[12].x;
    out.m_38.y = (*spvDescriptorSet0.fp_c3)._m0[12].y;
    out.m_38.z = (*spvDescriptorSet0.fp_c3)._m0[12].z;
    out.m_38.w = _87;
    return out;
}

