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
    constant _16* fp_c9 [[id(0)]];
    constant _16* fp_c15 [[id(1)]];
    constant _16* fp_c8 [[id(2)]];
    texture2d<float> fp_t_tcb_8 [[id(3)]];
    sampler fp_t_tcb_8Smplr [[id(4)]];
    texture2d<float> fp_t_tcb_A [[id(5)]];
    sampler fp_t_tcb_ASmplr [[id(6)]];
    texture2d<float> fp_t_tcb_34 [[id(7)]];
    sampler fp_t_tcb_34Smplr [[id(8)]];
    sampler fp_t_tcb_8Smplr_w [[id(9)]];
    sampler fp_t_tcb_ASmplr_w [[id(10)]];
    sampler fp_t_tcb_34Smplr_w [[id(11)]];
    constant dm_border_t* dm_border [[id(12)]];
};

struct main0_out
{
    float4 m_50 [[color(0)]];
};

struct main0_in
{
    float4 m_39 [[user(locn0)]];
    float4 m_43 [[user(locn1)]];
    float4 m_37 [[user(locn2)]];
    float4 m_54 [[user(locn3)]];
    float4 m_45 [[user(locn4)]];
    float4 m_41 [[user(locn5)]];
    float4 m_47 [[user(locn7)]];
    float4 m_52 [[user(locn9)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _61 = gl_FragCoord.w;
    float _63 = in.m_37.x;
    float _65 = gl_FragCoord.w;
    float _67 = _63 * _65;
    float _69 = in.m_37.z;
    float _71 = gl_FragCoord.w;
    float _73 = _69 * _71;
    float _75 = in.m_37.y;
    float _77 = gl_FragCoord.w;
    float _79 = _75 * _77;
    float _81 = in.m_37.w;
    float _83 = gl_FragCoord.w;
    float _85 = _81 * _83;
    float _87 = 1.0 / _61;
    float _89 = _87 * _67;
    float _91 = _87 * _73;
    float _93 = _87 * _79;
    float _95 = _87 * _85;
    float2 _446 = float2(_89, _93);
    float _97 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_446, float2(0.0), isnan(_446))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_446, float2(0.0), isnan(_446))).w;
    float2 _457 = float2(_91, _95);
    float _99 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_457, float2(0.0), isnan(_457))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_457, float2(0.0), isnan(_457))).w;
    float _101 = in.m_39.w;
    float _103 = gl_FragCoord.w;
    float _105 = _101 * _103;
    float _107 = in.m_41.w;
    float _109 = gl_FragCoord.w;
    float _111 = _107 * _109;
    float _113 = in.m_43.w;
    float _115 = gl_FragCoord.w;
    float _117 = _113 * _115;
    float _119 = in.m_45.x;
    float _121 = gl_FragCoord.w;
    float _123 = _119 * _121;
    float _125 = _87 * _105;
    float _127 = _87 * _111;
    float _129 = _87 * _117;
    float _131 = in.m_47.x;
    float _133 = gl_FragCoord.w;
    float _135 = _131 * _133;
    float _137 = _97 * _99;
    float _139 = _87 * _123;
    float _141 = -_125;
    float _143 = fma(_137, _127, _141);
    float _145 = _129 * _143;
    float _147 = 0.0 + _145;
    float _149 = precise::clamp(_147, 0.0, 1.0);
    float _151 = _149 * _139;
    bool _155 = _151 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _157 = isnan(_151);
    bool _159 = _155 || _157;
    bool _161 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _163 = _159 || _161;
    float _165 = in.m_47.y;
    float _167 = gl_FragCoord.w;
    float _169 = _165 * _167;
    if (!_163)
    {
        discard_fragment();
    }
    float _171 = _87 * _135;
    float _173 = _87 * _169;
    float2 _566 = float2(_171, _173);
    float3 _177 = dm_bs(spvDescriptorSet0.fp_t_tcb_34.sample(spvDescriptorSet0.fp_t_tcb_34Smplr, select(_566, float2(0.0), isnan(_566))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_34, spvDescriptorSet0.fp_t_tcb_34Smplr_w, select(_566, float2(0.0), isnan(_566))).xyz;
    float _179 = _177.x;
    float _181 = _177.y;
    float _183 = _177.z;
    float _185 = in.m_39.x;
    float _187 = gl_FragCoord.w;
    float _189 = _185 * _187;
    float _191 = in.m_43.x;
    float _193 = gl_FragCoord.w;
    float _195 = _191 * _193;
    float _197 = in.m_39.y;
    float _199 = gl_FragCoord.w;
    float _201 = _197 * _199;
    float _203 = in.m_43.y;
    float _205 = gl_FragCoord.w;
    float _207 = _203 * _205;
    float _209 = in.m_39.z;
    float _211 = gl_FragCoord.w;
    float _213 = _209 * _211;
    float _215 = in.m_43.z;
    float _217 = gl_FragCoord.w;
    float _219 = _215 * _217;
    float _221 = in.m_41.x;
    float _223 = gl_FragCoord.w;
    float _225 = _221 * _223;
    float _227 = in.m_41.y;
    float _229 = gl_FragCoord.w;
    float _231 = _227 * _229;
    float _233 = in.m_41.z;
    float _235 = gl_FragCoord.w;
    float _237 = _233 * _235;
    float _239 = _87 * _189;
    float _241 = _87 * _195;
    float _243 = _87 * _201;
    float _245 = _87 * _207;
    float _247 = _87 * _213;
    float _249 = _87 * _219;
    float _251 = -_241;
    float _253 = _239 + _251;
    float _255 = -_245;
    float _257 = _243 + _255;
    float _259 = -_249;
    float _261 = _247 + _259;
    float _263 = fma(_179, _253, _241);
    float _265 = fma(_181, _257, _245);
    float _267 = fma(_183, _261, _249);
    float _269 = _87 * _225;
    float _271 = _87 * _231;
    float _273 = _87 * _237;
    float _275 = _263 * _269;
    float _277 = _265 * _271;
    float _279 = _267 * _273;
    if (!_163)
    {
        out.m_50.x = _275;
        out.m_50.y = _277;
        out.m_50.z = _279;
        out.m_50.w = _145;
        return out;
    }
    float _281 = _277 * 0.715200006961822509765625;
    float _283 = in.m_52.w;
    float _285 = gl_FragCoord.w;
    float _287 = _283 * _285;
    float _289 = in.m_52.z;
    float _291 = gl_FragCoord.w;
    float _293 = _289 * _291;
    float _295 = in.m_52.x;
    float _297 = gl_FragCoord.w;
    float _299 = _295 * _297;
    float _301 = fma(_275, 0.2125999927520751953125, _281);
    float _303 = in.m_52.y;
    float _305 = gl_FragCoord.w;
    float _307 = _303 * _305;
    float _309 = fma(_279, 0.072200000286102294921875, _301);
    bool _311 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _313 = 1.0 / _309;
    float _315 = _313 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _317 = precise::clamp(_315, 0.0, 1.0);
    float _319 = _87 * _287;
    float _321 = fma(_317, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _323 = _87 * _293;
    float _325 = _321 * _319;
    float _327 = 0.0 + _151;
    float _329 = precise::clamp(_327, 0.0, 1.0);
    float _331 = _87 * _299;
    float _333 = _87 * _307;
    float _335 = fma(_279, _325, _323);
    float _337 = fma(_275, _325, _331);
    float _339 = fma(_277, _325, _333);
    float _341 = _323;
    if (!_311)
    {
        _341 = _329;
    }
    float _343 = _341;
    bool _345 = !_311;
    float _347 = _343;
    if (!_345)
    {
        float _349 = in.m_54.w;
        float _351 = gl_FragCoord.w;
        float _353 = _349 * _351;
        float _355 = in.m_54.z;
        float _357 = gl_FragCoord.w;
        float _359 = _355 * _357;
        float _361 = _87 * _353;
        float _363 = _87 * _359;
        float _365 = 1.0 / _361;
        float _367 = _363 * _365;
        float _369 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _371 = fma(_367, (*spvDescriptorSet0.fp_c8)._m0[30].w, _369);
        float _373 = 1.0 / _371;
        float _375 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _377 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _379 = fma(_373, _375, _377);
        float _381 = _379 * 8.0;
        float _383 = precise::clamp(_381, 0.0, 1.0);
        float _385 = _329 * _383;
        _347 = _385;
    }
    float _387 = _347;
    float _389 = 0.0 + _387;
    float _391 = precise::clamp(_389, 0.0, 1.0);
    out.m_50.x = _337;
    out.m_50.y = _339;
    out.m_50.z = _335;
    out.m_50.w = _391;
    return out;
}

