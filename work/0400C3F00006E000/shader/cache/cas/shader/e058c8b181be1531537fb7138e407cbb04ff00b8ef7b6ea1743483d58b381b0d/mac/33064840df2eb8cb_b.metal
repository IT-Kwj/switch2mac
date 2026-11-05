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
    float2 _321 = float2(_59, _61);
    float _63 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_321, float2(0.0), isnan(_321))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_321, float2(0.0), isnan(_321))).x;
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
    float _103 = fma(_93, (*spvDescriptorSet0.fp_c3)._m0[4].z, (*spvDescriptorSet0.fp_c3)._m0[5].z);
    float _105 = precise::clamp(_103, 0.0, 1.0);
    float _107 = precise::max(_97, _101);
    float _109 = fma(_93, (*spvDescriptorSet0.fp_c3)._m0[4].w, (*spvDescriptorSet0.fp_c3)._m0[5].w);
    float _111 = precise::clamp(_109, 0.0, 1.0);
    float _113 = precise::max(_107, _87);
    float _115 = precise::min(_105, _111);
    bool _119 = _113 != 0.0;
    bool _121 = isnan(_113);
    bool _123 = _119 || _121;
    bool _125 = isnan(0.0);
    bool _127 = _123 || _125;
    bool _129 = !_127;
    if (!_129)
    {
        float _131 = (-1.0) + (*spvDescriptorSet0.fp_c3)._m0[0].y;
        float _133 = fma(_113, _131, 1.0);
        float _135 = log2(_133);
        float _137 = _135 + (-1.0);
        float _139 = exp2(_137);
        float _141 = _139 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
        float _143 = fma(_141, (*spvDescriptorSet0.fp_c3)._m0[8].x, _59);
        float _145 = fma(_141, (*spvDescriptorSet0.fp_c3)._m0[8].y, _61);
        float _147 = -_141;
        float _149 = fma(_147, (*spvDescriptorSet0.fp_c3)._m0[8].x, _59);
        float _151 = -_141;
        float _153 = fma(_151, (*spvDescriptorSet0.fp_c3)._m0[8].y, _61);
        float _155 = fma(_141, (*spvDescriptorSet0.fp_c3)._m0[8].z, _59);
        float _157 = -_141;
        float _159 = fma(_157, (*spvDescriptorSet0.fp_c3)._m0[8].z, _59);
        float _161 = fma(_141, (*spvDescriptorSet0.fp_c3)._m0[8].w, _61);
        float _163 = -_141;
        float _165 = fma(_163, (*spvDescriptorSet0.fp_c3)._m0[8].w, _61);
        float2 _501 = float2(_143, _145);
        float3 _169 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_501, float2(0.0), isnan(_501)), level(_137)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_501, float2(0.0), isnan(_501)), level(_137)).xyz;
        float _171 = _169.x;
        float _173 = _169.y;
        float _175 = _169.z;
        float2 _516 = float2(_149, _153);
        float3 _177 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_516, float2(0.0), isnan(_516)), level(_137)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_516, float2(0.0), isnan(_516)), level(_137)).xyz;
        float _179 = _177.x;
        float _181 = _177.y;
        float _183 = _177.z;
        float2 _531 = float2(_155, _161);
        float3 _185 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_531, float2(0.0), isnan(_531)), level(_137)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_531, float2(0.0), isnan(_531)), level(_137)).xyz;
        float _187 = _185.x;
        float _189 = _185.y;
        float _191 = _185.z;
        float2 _546 = float2(_159, _165);
        float3 _193 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_546, float2(0.0), isnan(_546)), level(_137)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_546, float2(0.0), isnan(_546)), level(_137)).xyz;
        float _195 = _193.x;
        float _197 = _193.y;
        float _199 = _193.z;
        float _201 = _173 + _181;
        float _203 = _171 + _179;
        float _205 = _175 + _183;
        float _207 = _115 * (*spvDescriptorSet0.fp_c3)._m0[0].w;
        float _209 = _201 + _189;
        float _211 = _203 + _187;
        float _213 = _205 + _191;
        float _215 = 0.0 + _135;
        float _217 = precise::clamp(_215, 0.0, 1.0);
        float _219 = _209 + _197;
        float _221 = _211 + _195;
        float _223 = _213 + _199;
        float _225 = fma(_85, _217, _83);
        float _227 = _219 * 0.14665000140666961669921875;
        float _229 = _221 * 0.25;
        float _231 = _223 * 0.25;
        float _233 = _217 * _85;
        float _235 = fma(_221, 0.0747250020503997802734375, _227);
        float _237 = 1.0 / _225;
        float _239 = _219 * 0.25;
        float _241 = fma(_223, 0.028599999845027923583984375, _235);
        float _243 = -_231;
        float _245 = _243 + _241;
        float _247 = -_229;
        float _249 = _247 + _241;
        float _251 = -_239;
        float _253 = _251 + _241;
        float _255 = fma(_207, _245, _231);
        float _257 = fma(_207, _249, _229);
        float _259 = fma(_207, _253, _239);
        float _261 = -_255;
        float _263 = fma(_255, (*spvDescriptorSet0.fp_c3)._m0[13].z, _261);
        float _265 = -_257;
        float _267 = fma(_257, (*spvDescriptorSet0.fp_c3)._m0[13].x, _265);
        float _269 = -_259;
        float _271 = fma(_259, (*spvDescriptorSet0.fp_c3)._m0[13].y, _269);
        float _273 = fma(_115, _263, _255);
        float _275 = fma(_115, _267, _257);
        float _277 = _237 * _233;
        float _279 = fma(_115, _271, _259);
        float _281 = _273 * _233;
        float _283 = _275 * _277;
        float _285 = _279 * _277;
        float _287 = _281 * _237;
        out.m_36.x = _283;
        out.m_36.y = _285;
        out.m_36.z = _287;
        out.m_36.w = _225;
        return out;
    }
    out.m_36.x = 0.0;
    out.m_36.y = 0.0;
    out.m_36.z = 0.0;
    out.m_36.w = _83;
    return out;
}

