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
    sampler fp_t_tcb_8Smplr_w [[id(5)]];
    constant dm_border_t* dm_border [[id(6)]];
};

struct main0_out
{
    float4 m_50 [[color(0)]];
};

struct main0_in
{
    float4 m_43 [[user(locn0)]];
    float4 m_45 [[user(locn1)]];
    float4 m_39 [[user(locn2)]];
    float4 m_52 [[user(locn3)]];
    float4 m_47 [[user(locn4)]];
    float4 m_33 [[user(locn5)]];
    float4 m_35 [[user(locn6), flat]];
    float4 m_37 [[user(locn7), flat]];
    float4 m_41 [[user(locn8)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _59 = gl_FragCoord.w;
    float _61 = in.m_33.y;
    float _63 = gl_FragCoord.w;
    float _65 = _61 * _63;
    float _67 = in.m_35.x;
    float _69 = in.m_37.x;
    float _71 = in.m_33.x;
    float _73 = gl_FragCoord.w;
    float _75 = _71 * _73;
    float _77 = 1.0 / _59;
    float _79 = -_67;
    float _81 = _79 + _69;
    float _83 = 1.0 / _81;
    float _85 = _77 * _65;
    float _87 = -_85;
    float _89 = _87 + 1.0;
    float _91 = precise::max(_67, _89);
    float _93 = _77 * _75;
    float _95 = precise::min(_69, _91);
    float _97 = -_67;
    float _99 = _97 + _95;
    float _101 = _99 * _83;
    float _103 = _101 * _101;
    float _105 = precise::clamp(_103, 0.0, 1.0);
    float2 _484;
    _484.x = spvDescriptorSet0.fp_t_tcb_8.calculate_clamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_93, _105));
    _484.y = spvDescriptorSet0.fp_t_tcb_8.calculate_unclamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_93, _105));
    float _107 = _484.x;
    float _109 = _107 * 256.0;
    int _112 = int(_109);
    float _114 = float(uint(_112));
    float _116 = _114 * 0.00390625;
    float _118 = precise::min(_116, 2.0);
    float2 _503 = float2(_93, _105);
    float4 _121 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_503, float2(0.0), isnan(_503)), level(_118)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_503, float2(0.0), isnan(_503)), level(_118)).xyzw;
    float _123 = _121.x;
    float _125 = _121.y;
    float _127 = _121.z;
    float _129 = _121.w;
    float _131 = in.m_39.y;
    float _133 = gl_FragCoord.w;
    float _135 = _131 * _133;
    float _137 = in.m_39.x;
    float _139 = gl_FragCoord.w;
    float _141 = _137 * _139;
    float _143 = in.m_39.z;
    float _145 = gl_FragCoord.w;
    float _147 = _143 * _145;
    float _149 = in.m_41.y;
    float _151 = gl_FragCoord.w;
    float _153 = _149 * _151;
    float _155 = in.m_41.x;
    float _157 = gl_FragCoord.w;
    float _159 = _155 * _157;
    float _161 = in.m_41.z;
    float _163 = gl_FragCoord.w;
    float _165 = _161 * _163;
    float _167 = in.m_43.w;
    float _169 = gl_FragCoord.w;
    float _171 = _167 * _169;
    float _173 = _77 * _135;
    float _175 = _77 * _141;
    float _177 = _77 * _147;
    float _179 = _173 * _173;
    float _181 = fma(_175, _175, _179);
    float _183 = fma(_177, _177, _181);
    float _185 = rsqrt(_183);
    float _187 = _77 * _153;
    float _189 = in.m_45.w;
    float _191 = gl_FragCoord.w;
    float _193 = _189 * _191;
    float _195 = _173 * _185;
    float _197 = -(*spvDescriptorSet0.fp_c9)._m0[139].z;
    float _199 = _197 + (*spvDescriptorSet0.fp_c9)._m0[139].w;
    float _201 = _175 * _185;
    float _203 = _177 * _185;
    float _205 = _187 * _195;
    float _207 = _77 * _159;
    float _209 = 1.0 / _199;
    float _211 = fma(_207, _201, _205);
    float _213 = _77 * _165;
    float _215 = in.m_47.x;
    float _217 = gl_FragCoord.w;
    float _219 = _215 * _217;
    float _221 = fma(_213, _203, _211);
    float _223 = abs(_221);
    float _225 = -(*spvDescriptorSet0.fp_c9)._m0[139].z;
    float _227 = _223 + _225;
    float _229 = _227 * _209;
    float _231 = precise::clamp(_229, 0.0, 1.0);
    float _233 = fma(_231, -2.0, 3.0);
    float _235 = _231 * _231;
    float _237 = _77 * _171;
    float _239 = _233 * _235;
    float _241 = _77 * _219;
    float _243 = in.m_43.x;
    float _245 = gl_FragCoord.w;
    float _247 = _243 * _245;
    float _249 = in.m_43.y;
    float _251 = gl_FragCoord.w;
    float _253 = _249 * _251;
    float _255 = in.m_43.z;
    float _257 = gl_FragCoord.w;
    float _259 = _255 * _257;
    float _261 = _77 * _259;
    float _263 = -_237;
    float _265 = _263 + _129;
    float _267 = _77 * _193;
    float _269 = _267 * _265;
    float _271 = 0.0 + _269;
    float _273 = precise::clamp(_271, 0.0, 1.0);
    float _275 = _273 * _239;
    float _277 = _275 * _241;
    bool _281 = _277 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _283 = isnan(_277);
    bool _285 = _281 || _283;
    bool _287 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _289 = _285 || _287;
    float _291 = in.m_45.x;
    float _293 = gl_FragCoord.w;
    float _295 = _291 * _293;
    float _297 = in.m_45.y;
    float _299 = gl_FragCoord.w;
    float _301 = _297 * _299;
    float _303 = in.m_45.z;
    float _305 = gl_FragCoord.w;
    float _307 = _303 * _305;
    if (!_289)
    {
        discard_fragment();
    }
    float _309 = _77 * _247;
    float _311 = _77 * _253;
    float _313 = _77 * _295;
    float _315 = _77 * _301;
    float _317 = _77 * _307;
    float _319 = -_313;
    float _321 = _319 + _309;
    float _323 = -_315;
    float _325 = _323 + _311;
    float _327 = -_317;
    float _329 = _327 + _261;
    float _331 = fma(_123, _321, _313);
    float _333 = fma(_125, _325, _315);
    float _335 = fma(_127, _329, _317);
    if (!_289)
    {
        out.m_50.x = _331;
        out.m_50.y = _333;
        out.m_50.z = _335;
        out.m_50.w = _269;
        return out;
    }
    float _337 = _333 * 0.715200006961822509765625;
    float _339 = 0.0 + _277;
    float _341 = precise::clamp(_339, 0.0, 1.0);
    float _343 = fma(_331, 0.2125999927520751953125, _337);
    bool _345 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _347 = fma(_335, 0.072200000286102294921875, _343);
    float _349 = 1.0 / _347;
    float _351 = _349 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _353 = precise::clamp(_351, 0.0, 1.0);
    float _355 = fma(_353, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _357 = _331 * _355;
    float _359 = _333 * _355;
    float _361 = _335 * _355;
    float _363 = _355;
    if (!_345)
    {
        _363 = _341;
    }
    float _365 = _363;
    bool _367 = !_345;
    float _369 = _365;
    if (!_367)
    {
        float _371 = in.m_52.w;
        float _373 = gl_FragCoord.w;
        float _375 = _371 * _373;
        float _377 = in.m_52.z;
        float _379 = gl_FragCoord.w;
        float _381 = _377 * _379;
        float _383 = _77 * _375;
        float _385 = _77 * _381;
        float _387 = 1.0 / _383;
        float _389 = _385 * _387;
        float _391 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _393 = fma(_389, (*spvDescriptorSet0.fp_c8)._m0[30].w, _391);
        float _395 = 1.0 / _393;
        float _397 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _399 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _401 = fma(_395, _397, _399);
        float _403 = _401 * 8.0;
        float _405 = precise::clamp(_403, 0.0, 1.0);
        float _407 = _341 * _405;
        _369 = _407;
    }
    float _409 = _369;
    float _411 = 0.0 + _409;
    float _413 = precise::clamp(_411, 0.0, 1.0);
    out.m_50.x = _357;
    out.m_50.y = _359;
    out.m_50.z = _361;
    out.m_50.w = _413;
    return out;
}

