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
    constant _16* fp_c8 [[id(1)]];
    constant _16* fp_c15 [[id(2)]];
    texture2d<float> fp_t_tcb_8 [[id(3)]];
    sampler fp_t_tcb_8Smplr [[id(4)]];
    texture2d<float> fp_t_tcb_10 [[id(5)]];
    sampler fp_t_tcb_10Smplr [[id(6)]];
    texture2d<float> fp_t_tcb_C [[id(7)]];
    sampler fp_t_tcb_CSmplr [[id(8)]];
    texture2d<float> fp_t_tcb_A [[id(9)]];
    sampler fp_t_tcb_ASmplr [[id(10)]];
    sampler fp_t_tcb_8Smplr_w [[id(11)]];
    sampler fp_t_tcb_10Smplr_w [[id(12)]];
    sampler fp_t_tcb_CSmplr_w [[id(13)]];
    sampler fp_t_tcb_ASmplr_w [[id(14)]];
    constant dm_border_t* dm_border [[id(15)]];
};

struct main0_out
{
    float4 m_58 [[color(0)]];
};

struct main0_in
{
    float4 m_55 [[user(locn0)]];
    float4 m_51 [[user(locn1)]];
    float4 m_41 [[user(locn2)]];
    float4 m_53 [[user(locn3)]];
    float4 m_39 [[user(locn4)]];
    float4 m_49 [[user(locn5), flat]];
    float4 m_43 [[user(locn6)]];
    float4 m_47 [[user(locn7)]];
    float4 m_45 [[user(locn8)]];
    float4 m_60 [[user(locn9)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _67 = gl_FragCoord.w;
    float _69 = in.m_39.x;
    float _71 = gl_FragCoord.w;
    float _73 = _69 * _71;
    float _75 = in.m_39.y;
    float _77 = gl_FragCoord.w;
    float _79 = _75 * _77;
    float _81 = in.m_41.w;
    float _83 = gl_FragCoord.w;
    float _85 = _81 * _83;
    float _87 = in.m_41.y;
    float _89 = gl_FragCoord.w;
    float _91 = _87 * _89;
    float _93 = in.m_41.x;
    float _95 = gl_FragCoord.w;
    float _97 = _93 * _95;
    float _99 = in.m_43.x;
    float _101 = gl_FragCoord.w;
    float _103 = _99 * _101;
    float _105 = in.m_43.y;
    float _107 = gl_FragCoord.w;
    float _109 = _105 * _107;
    float _111 = 1.0 / _67;
    float _113 = _111 * _73;
    float _115 = _111 * _79;
    float _117 = _111 * _85;
    float _119 = _111 * _91;
    float _121 = _111 * _97;
    float _123 = _111 * _103;
    float2 _654 = float2(_113, _115);
    float _125 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_654, float2(0.0), isnan(_654))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_654, float2(0.0), isnan(_654))).w;
    float _127 = _111 * _109;
    float _129 = 1.0 / _117;
    float _131 = _119 * _129;
    float _133 = _121 * _129;
    float2 _676 = float2(_133, _131);
    float _135 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_676, float2(0.0), isnan(_676))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_676, float2(0.0), isnan(_676))).x;
    float2 _684 = float2(_123, _127);
    float _137 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_684, float2(0.0), isnan(_684))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_684, float2(0.0), isnan(_684))).w;
    float _139 = in.m_39.w;
    float _141 = gl_FragCoord.w;
    float _143 = _139 * _141;
    float _145 = in.m_39.z;
    float _147 = gl_FragCoord.w;
    float _149 = _145 * _147;
    float _151 = _111 * _143;
    float _153 = fma(_125, (*spvDescriptorSet0.fp_c9)._m0[191].w, _151);
    float _155 = _111 * _149;
    float2 _721 = float2(_155, _153);
    float _157 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_721, float2(0.0), isnan(_721))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_721, float2(0.0), isnan(_721))).w;
    float _159 = in.m_45.x;
    float _161 = gl_FragCoord.w;
    float _163 = _159 * _161;
    float _165 = in.m_47.y;
    float _167 = gl_FragCoord.w;
    float _169 = _165 * _167;
    float _171 = in.m_45.y;
    float _173 = gl_FragCoord.w;
    float _175 = _171 * _173;
    float _177 = in.m_47.x;
    float _179 = gl_FragCoord.w;
    float _181 = _177 * _179;
    float _183 = in.m_45.z;
    float _185 = gl_FragCoord.w;
    float _187 = _183 * _185;
    float _189 = in.m_47.z;
    float _191 = gl_FragCoord.w;
    float _193 = _189 * _191;
    float _195 = _111 * _163;
    float _197 = _111 * _169;
    float _199 = _111 * _175;
    float _201 = _111 * _181;
    float _203 = _111 * _187;
    float _205 = _197 * _197;
    float _207 = -(*spvDescriptorSet0.fp_c8)._m0[29].y;
    float _209 = _199 + _207;
    float _211 = -(*spvDescriptorSet0.fp_c8)._m0[29].x;
    float _213 = _195 + _211;
    float _215 = -(*spvDescriptorSet0.fp_c8)._m0[29].z;
    float _217 = _203 + _215;
    float _219 = fma(_201, _201, _205);
    float _221 = _209 * _209;
    float _223 = _111 * _193;
    float _225 = in.m_41.z;
    float _227 = gl_FragCoord.w;
    float _229 = _225 * _227;
    float _231 = precise::max(_137, (*spvDescriptorSet0.fp_c9)._m0[191].y);
    float _233 = fma(_213, _213, _221);
    float _235 = fma(_223, _223, _219);
    float _237 = precise::min(_231, (*spvDescriptorSet0.fp_c9)._m0[191].z);
    float _239 = fma(_217, _217, _233);
    float _241 = rsqrt(_235);
    float _243 = -(*spvDescriptorSet0.fp_c9)._m0[191].y;
    float _245 = _237 + _243;
    float _247 = rsqrt(_239);
    float _249 = in.m_49.x;
    float _251 = _197 * _241;
    float _253 = _201 * _241;
    float _255 = _223 * _241;
    float _257 = _251 * _251;
    float _259 = _209 * _247;
    float _261 = _213 * _247;
    float _263 = _217 * _247;
    float _265 = fma(_253, _253, _257);
    float _267 = _259 * _259;
    float _269 = fma(_255, _255, _265);
    float _271 = fma(_261, _261, _267);
    float _273 = rsqrt(_269);
    float _275 = fma(_263, _263, _271);
    float _277 = rsqrt(_275);
    float _279 = in.m_51.w;
    float _281 = gl_FragCoord.w;
    float _283 = _279 * _281;
    float _285 = _251 * _273;
    float _287 = _253 * _273;
    float _289 = _255 * _273;
    float _291 = _259 * _277;
    float _293 = _263 * _277;
    float _295 = _285 * _291;
    float _297 = _261 * _277;
    float _299 = -_249;
    float _301 = 1.0 / _299;
    float _303 = fma(_287, _297, _295);
    float _305 = _111 * _229;
    float _307 = fma(_289, _293, _303);
    float _309 = _305 * _129;
    float _311 = -_249;
    float _313 = abs(_307);
    float _315 = _311 + _313;
    float _317 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _319 = fma(_309, (*spvDescriptorSet0.fp_c8)._m0[30].w, _317);
    float _321 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _323 = fma(_135, (*spvDescriptorSet0.fp_c8)._m0[30].w, _321);
    float _325 = in.m_53.x;
    float _327 = gl_FragCoord.w;
    float _329 = _325 * _327;
    float _331 = _315 * _301;
    float _333 = precise::clamp(_331, 0.0, 1.0);
    float _335 = 1.0 / _319;
    float _337 = in.m_55.w;
    float _339 = gl_FragCoord.w;
    float _341 = _337 * _339;
    float _343 = -(*spvDescriptorSet0.fp_c9)._m0[191].y;
    float _345 = (*spvDescriptorSet0.fp_c9)._m0[191].z + _343;
    float _347 = fma(_333, -2.0, 3.0);
    float _349 = _333 * _333;
    float _351 = 1.0 / _323;
    float _353 = _347 * _349;
    float _355 = _111 * _283;
    float _357 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _359 = _335 * _357;
    float _361 = 1.0 / _345;
    float _363 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _365 = -_359;
    float _367 = fma(_351, _363, _365);
    float _369 = _355 * _367;
    float _371 = precise::clamp(_369, 0.0, 1.0);
    float _373 = -_371;
    float _375 = _373 + 1.0;
    float _377 = _245 * _361;
    float _379 = _111 * _341;
    float _381 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[191].x;
    float _383 = in.m_55.x;
    float _385 = gl_FragCoord.w;
    float _387 = _383 * _385;
    float _389 = in.m_55.y;
    float _391 = gl_FragCoord.w;
    float _393 = _389 * _391;
    float _395 = _111 * _387;
    float _397 = _111 * _393;
    float _399 = _157 * _353;
    float _401 = fma(_157, _375, _399);
    float _403 = _401 * _377;
    float _405 = _379 + (*spvDescriptorSet0.fp_c9)._m0[191].x;
    float _407 = precise::max(_379, _403);
    float _409 = precise::min(_405, _407);
    float _411 = -_379;
    float _413 = _411 + _409;
    float _415 = _413 * _381;
    float _417 = _111 * _329;
    float _419 = 0.0 + _415;
    float _421 = precise::clamp(_419, 0.0, 1.0);
    float _423 = _421 * _417;
    bool _427 = _423 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _429 = isnan(_423);
    bool _431 = _427 || _429;
    bool _433 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _435 = _431 || _433;
    float _437 = in.m_51.x;
    float _439 = gl_FragCoord.w;
    float _441 = _437 * _439;
    float _443 = in.m_51.y;
    float _445 = gl_FragCoord.w;
    float _447 = _443 * _445;
    float _449 = in.m_51.z;
    float _451 = gl_FragCoord.w;
    float _453 = _449 * _451;
    float _455 = in.m_55.z;
    float _457 = gl_FragCoord.w;
    float _459 = _455 * _457;
    float _461 = _359;
    if (!_435)
    {
        discard_fragment();
    }
    float _463 = _111 * _441;
    float _465 = _111 * _447;
    float _467 = _111 * _453;
    float _469 = _111 * _459;
    float _471 = -_463;
    float _473 = _471 + _395;
    float _475 = _157 * _157;
    float _477 = -_465;
    float _479 = _477 + _397;
    float _481 = -_467;
    float _483 = _481 + _469;
    float _485 = fma(_475, _473, _463);
    float _487 = fma(_475, _479, _465);
    float _489 = fma(_475, _483, _467);
    if (!_435)
    {
        out.m_58.x = _485;
        out.m_58.y = _487;
        out.m_58.z = _489;
        out.m_58.w = _415;
        return out;
    }
    float _491 = _487 * 0.715200006961822509765625;
    float _493 = in.m_60.w;
    float _495 = gl_FragCoord.w;
    float _497 = _493 * _495;
    float _499 = in.m_60.x;
    float _501 = gl_FragCoord.w;
    float _503 = _499 * _501;
    float _505 = in.m_60.y;
    float _507 = gl_FragCoord.w;
    float _509 = _505 * _507;
    float _511 = fma(_485, 0.2125999927520751953125, _491);
    float _513 = in.m_60.z;
    float _515 = gl_FragCoord.w;
    float _517 = _513 * _515;
    float _519 = fma(_489, 0.072200000286102294921875, _511);
    bool _521 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _523 = 1.0 / _519;
    float _525 = (*spvDescriptorSet0.fp_c15)._m0[2].y;
    if (_521)
    {
        float _527 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _529 = _359 + _527;
        _461 = _529;
    }
    float _531 = _461;
    float _533 = _523 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _535 = precise::clamp(_533, 0.0, 1.0);
    float _537 = fma(_535, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _539 = _111 * _497;
    if (_521)
    {
        float _541 = _531 * 8.0;
        float _543 = precise::clamp(_541, 0.0, 1.0);
        _525 = _543;
    }
    float _545 = _525;
    float _547 = _111 * _509;
    float _549 = _537 * _539;
    float _551 = 0.0 + _423;
    float _553 = precise::clamp(_551, 0.0, 1.0);
    float _555 = _111 * _503;
    float _557 = _111 * _517;
    float _559 = fma(_487, _549, _547);
    float _561 = _553;
    if (_521)
    {
        float _563 = _553 * _545;
        _561 = _563;
    }
    float _565 = _561;
    float _567 = fma(_485, _549, _555);
    float _569 = fma(_489, _549, _557);
    float _571 = 0.0 + _565;
    float _573 = precise::clamp(_571, 0.0, 1.0);
    out.m_58.x = _567;
    out.m_58.y = _559;
    out.m_58.z = _569;
    out.m_58.w = _573;
    return out;
}

