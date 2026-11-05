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
    constant _16* fp_c8 [[id(0)]];
    constant _16* fp_c9 [[id(1)]];
    constant _16* fp_c15 [[id(2)]];
    texture2d<float> fp_t_tcb_10 [[id(3)]];
    sampler fp_t_tcb_10Smplr [[id(4)]];
    texture2d<float> fp_t_tcb_8 [[id(5)]];
    sampler fp_t_tcb_8Smplr [[id(6)]];
    sampler fp_t_tcb_10Smplr_w [[id(7)]];
    sampler fp_t_tcb_8Smplr_w [[id(8)]];
    constant dm_border_t* dm_border [[id(9)]];
};

struct main0_out
{
    float4 m_52 [[color(0)]];
};

struct main0_in
{
    float4 m_47 [[user(locn0)]];
    float4 m_37 [[user(locn1)]];
    float4 m_39 [[user(locn2)]];
    float4 m_35 [[user(locn3)]];
    float4 m_49 [[user(locn4)]];
    float4 m_45 [[user(locn5)]];
    float4 m_43 [[user(locn6)]];
    float4 m_41 [[user(locn7)]];
    float4 m_54 [[user(locn8)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _61 = gl_FragCoord.w;
    float _63 = in.m_35.w;
    float _65 = gl_FragCoord.w;
    float _67 = _63 * _65;
    float _69 = in.m_35.x;
    float _71 = gl_FragCoord.w;
    float _73 = _69 * _71;
    float _75 = in.m_35.y;
    float _77 = gl_FragCoord.w;
    float _79 = _75 * _77;
    float _81 = in.m_37.x;
    float _83 = gl_FragCoord.w;
    float _85 = _81 * _83;
    float _87 = in.m_37.y;
    float _89 = gl_FragCoord.w;
    float _91 = _87 * _89;
    float _93 = 1.0 / _61;
    float _95 = _93 * _67;
    float _97 = _93 * _73;
    float _99 = _93 * _79;
    float _101 = 1.0 / _95;
    float _103 = _97 * _101;
    float _105 = _99 * _101;
    float _107 = _93 * _85;
    float _109 = _93 * _91;
    float2 _543 = float2(_103, _105);
    float _111 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_543, float2(0.0), isnan(_543))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_543, float2(0.0), isnan(_543))).x;
    float2 _554 = float2(_107, _109);
    float _113 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_554, float2(0.0), isnan(_554))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_554, float2(0.0), isnan(_554))).w;
    float _115 = in.m_39.y;
    float _117 = gl_FragCoord.w;
    float _119 = _115 * _117;
    float _121 = in.m_39.x;
    float _123 = gl_FragCoord.w;
    float _125 = _121 * _123;
    float _127 = in.m_39.z;
    float _129 = gl_FragCoord.w;
    float _131 = _127 * _129;
    float _133 = in.m_41.y;
    float _135 = gl_FragCoord.w;
    float _137 = _133 * _135;
    float _139 = in.m_41.x;
    float _141 = gl_FragCoord.w;
    float _143 = _139 * _141;
    float _145 = in.m_41.z;
    float _147 = gl_FragCoord.w;
    float _149 = _145 * _147;
    float _151 = in.m_43.y;
    float _153 = gl_FragCoord.w;
    float _155 = _151 * _153;
    float _157 = in.m_43.x;
    float _159 = gl_FragCoord.w;
    float _161 = _157 * _159;
    float _163 = _93 * _119;
    float _165 = _93 * _125;
    float _167 = _93 * _131;
    float _169 = _163 * _163;
    float _171 = fma(_165, _165, _169);
    float _173 = _93 * _137;
    float _175 = in.m_35.z;
    float _177 = gl_FragCoord.w;
    float _179 = _175 * _177;
    float _181 = fma(_167, _167, _171);
    float _183 = _93 * _143;
    float _185 = -(*spvDescriptorSet0.fp_c8)._m0[29].y;
    float _187 = _173 + _185;
    float _189 = in.m_43.z;
    float _191 = gl_FragCoord.w;
    float _193 = _189 * _191;
    float _195 = -(*spvDescriptorSet0.fp_c8)._m0[29].x;
    float _197 = _183 + _195;
    float _199 = rsqrt(_181);
    float _201 = _187 * _187;
    float _203 = _93 * _149;
    float _205 = fma(_197, _197, _201);
    float _207 = -(*spvDescriptorSet0.fp_c8)._m0[29].z;
    float _209 = _203 + _207;
    float _211 = fma(_209, _209, _205);
    float _213 = _93 * _155;
    float _215 = sqrt(_211);
    float _217 = _163 * _199;
    float _219 = _165 * _199;
    float _221 = -(*spvDescriptorSet0.fp_c9)._m0[139].z;
    float _223 = _221 + (*spvDescriptorSet0.fp_c9)._m0[139].w;
    float _225 = _167 * _199;
    float _227 = _213 * _217;
    float _229 = _93 * _161;
    float _231 = 1.0 / _223;
    float _233 = fma(_229, _219, _227);
    float _235 = _93 * _179;
    float _237 = in.m_45.w;
    float _239 = gl_FragCoord.w;
    float _241 = _237 * _239;
    float _243 = _93 * _193;
    float _245 = _235 * _101;
    float _247 = precise::max(_215, 20.0);
    float _249 = in.m_47.w;
    float _251 = gl_FragCoord.w;
    float _253 = _249 * _251;
    float _255 = precise::max(_215, 5.0);
    float _257 = fma(_243, _225, _233);
    float _259 = precise::min(_247, 120.0);
    float _261 = abs(_257);
    float _263 = -(*spvDescriptorSet0.fp_c9)._m0[139].z;
    float _265 = _261 + _263;
    float _267 = precise::min(_255, 15.0);
    float _269 = fma(_259, -0.00999999977648258209228515625, 1.2000000476837158203125);
    float _271 = _265 * _231;
    float _273 = precise::clamp(_271, 0.0, 1.0);
    float _275 = fma(_267, 0.100000001490116119384765625, -0.5);
    float _277 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _279 = fma(_245, (*spvDescriptorSet0.fp_c8)._m0[30].w, _277);
    float _281 = _269 * _275;
    float _283 = fma(_273, -2.0, 3.0);
    float _285 = _273 * _273;
    float _287 = 1.0 / _279;
    float _289 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _291 = fma(_111, (*spvDescriptorSet0.fp_c8)._m0[30].w, _289);
    float _293 = fma(_113, -2.0, 1.0);
    float _295 = precise::clamp(_293, 0.0, 1.0);
    float _297 = _283 * _285;
    float _299 = in.m_49.x;
    float _301 = gl_FragCoord.w;
    float _303 = _299 * _301;
    float _305 = 1.0 / _291;
    float _307 = fma(_295, -2.0, 3.0);
    float _309 = _295 * _295;
    float _311 = _93 * _253;
    float _313 = _307 * _309;
    float _315 = _93 * _241;
    float _317 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[142].y;
    float _319 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _321 = _287 * _319;
    float _323 = _313 * _315;
    float _325 = _323 * _281;
    float _327 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _329 = -_321;
    float _331 = fma(_305, _327, _329);
    float _333 = _311 * _325;
    float _335 = 0.0 + _333;
    float _337 = precise::clamp(_335, 0.0, 1.0);
    float _339 = _331 * _317;
    float _341 = precise::clamp(_339, 0.0, 1.0);
    float _343 = _337 * _341;
    float _345 = _93 * _303;
    float _347 = _343 * _297;
    float _349 = _347 * _345;
    bool _353 = _349 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _355 = isnan(_349);
    bool _357 = _353 || _355;
    bool _359 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _361 = _357 || _359;
    float _363 = in.m_47.y;
    float _365 = gl_FragCoord.w;
    float _367 = _363 * _365;
    float _369 = in.m_47.x;
    float _371 = gl_FragCoord.w;
    float _373 = _369 * _371;
    float _375 = in.m_47.z;
    float _377 = gl_FragCoord.w;
    float _379 = _375 * _377;
    float _381 = _321;
    if (!_361)
    {
        discard_fragment();
    }
    float _383 = _93 * _367;
    float _385 = _93 * _373;
    float _387 = _93 * _379;
    if (!_361)
    {
        out.m_52.x = _385;
        out.m_52.y = _383;
        out.m_52.z = _387;
        out.m_52.w = _333;
        return out;
    }
    float _389 = _383 * 0.715200006961822509765625;
    float _391 = in.m_54.w;
    float _393 = gl_FragCoord.w;
    float _395 = _391 * _393;
    float _397 = in.m_54.x;
    float _399 = gl_FragCoord.w;
    float _401 = _397 * _399;
    float _403 = in.m_54.y;
    float _405 = gl_FragCoord.w;
    float _407 = _403 * _405;
    float _409 = fma(_385, 0.2125999927520751953125, _389);
    float _411 = in.m_54.z;
    float _413 = gl_FragCoord.w;
    float _415 = _411 * _413;
    float _417 = fma(_387, 0.072200000286102294921875, _409);
    bool _419 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _421 = 1.0 / _417;
    float _423 = (*spvDescriptorSet0.fp_c15)._m0[2].y;
    if (_419)
    {
        float _425 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _427 = _321 + _425;
        _381 = _427;
    }
    float _429 = _381;
    float _431 = _421 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _433 = precise::clamp(_431, 0.0, 1.0);
    float _435 = fma(_433, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _437 = _93 * _395;
    if (_419)
    {
        float _439 = _429 * 8.0;
        float _441 = precise::clamp(_439, 0.0, 1.0);
        _423 = _441;
    }
    float _443 = _423;
    float _445 = _93 * _407;
    float _447 = _435 * _437;
    float _449 = 0.0 + _349;
    float _451 = precise::clamp(_449, 0.0, 1.0);
    float _453 = _93 * _401;
    float _455 = _93 * _415;
    float _457 = fma(_383, _447, _445);
    float _459 = _451;
    if (_419)
    {
        float _461 = _451 * _443;
        _459 = _461;
    }
    float _463 = _459;
    float _465 = fma(_385, _447, _453);
    float _467 = fma(_387, _447, _455);
    float _469 = 0.0 + _463;
    float _471 = precise::clamp(_469, 0.0, 1.0);
    out.m_52.x = _465;
    out.m_52.y = _457;
    out.m_52.z = _467;
    out.m_52.w = _471;
    return out;
}

