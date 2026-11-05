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
    constant _16* vp_c9 [[id(0)]];
    constant _16* vp_c10 [[id(1)]];
    constant _16* vp_c8 [[id(2)]];
    constant _16* vp_c15 [[id(3)]];
    constant _16* vp_c16 [[id(4)]];
    constant _16* vp_c13 [[id(5)]];
    constant _16* vp_c7 [[id(6)]];
    texture2d<float> vp_t_tcb_24 [[id(7)]];
    sampler vp_t_tcb_24Smplr [[id(8)]];
    texture3d<float> vp_t_tcb_32 [[id(9)]];
    sampler vp_t_tcb_32Smplr [[id(10)]];
    texture3d<float> vp_t_tcb_30 [[id(11)]];
    sampler vp_t_tcb_30Smplr [[id(12)]];
    texture2d<float> vp_t_tcb_1C [[id(13)]];
    sampler vp_t_tcb_1CSmplr [[id(14)]];
    sampler vp_t_tcb_24Smplr_w [[id(15)]];
    sampler vp_t_tcb_32Smplr_w [[id(16)]];
    sampler vp_t_tcb_30Smplr_w [[id(17)]];
    sampler vp_t_tcb_1CSmplr_w [[id(18)]];
    constant dm_border_t* dm_border [[id(19)]];
};

struct main0_out
{
    float4 m_66 [[user(locn0)]];
    float4 m_68 [[user(locn1)]];
    float4 m_55 [[user(locn2)]];
    float4 m_98 [[user(locn3)]];
    float4 m_53 [[user(locn4)]];
    float4 m_74 [[user(locn5)]];
    float4 m_90 [[user(locn6)]];
    float4 m_72 [[user(locn7)]];
    float4 m_80 [[user(locn8)]];
    float4 m_70 [[user(locn9)]];
    float4 m_78 [[user(locn10)]];
    float4 m_84 [[user(locn11)]];
    float4 m_86 [[user(locn12)]];
    float4 m_82 [[user(locn13)]];
    float4 m_96 [[user(locn14)]];
    float4 m_92 [[user(locn15)]];
    float4 m_94 [[user(locn16)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_88 [[attribute(0)]];
    float4 m_76 [[attribute(1)]];
    float4 m_57 [[attribute(2)]];
    float4 m_48 [[attribute(3)]];
    float4 m_50 [[attribute(4)]];
    float4 m_62 [[attribute(5)]];
    float4 m_64 [[attribute(6)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    bool _4963 = false;
    bool _4016 = false;
    bool _507 = false;
    bool _409 = false;
    bool _305 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _112 = in.m_48.w;
    float _114 = in.m_50.w;
    float _116 = trunc(_112);
    int _119 = int(_116);
    float _121 = -_114;
    float _123 = _121 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_53.y = _123;
    bool _127 = _119 >= 1;
    float _129 = 0.0;
    float _131 = _114;
    float _133 = _123;
    if (!_127)
    {
        _129 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _135 = _129;
    if (!_127)
    {
        out.m_55.x = 0.0;
    }
    int _137 = 0;
    if (!_127)
    {
        float _139 = _135 * 5.0;
        _137 = as_type<int>(_139);
    }
    int _141 = _137;
    if (!_127)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5226 = as_type<float>(_141);
        out.gl_Position.z = _5226;
    }
    if (!_127)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _143 = _114 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _145 = isnan(_114);
    bool _147 = _143 || _145;
    bool _149 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _151 = _147 || _149;
    float _153 = float(_119);
    bool _155 = _123 >= _153;
    bool _157 = !_151;
    bool _159 = _155 || _157;
    float _161 = 1.0 / _153;
    if (_159)
    {
        _131 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _163 = _131;
    if (_159)
    {
        out.m_55.x = 0.0;
    }
    float _165 = _123 * _161;
    int _167 = 0;
    float _169 = _165;
    if (_159)
    {
        float _171 = _163 * 5.0;
        _167 = as_type<int>(_171);
    }
    int _173 = _167;
    out.m_53.x = _165;
    if (_159)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5289 = as_type<float>(_173);
        out.gl_Position.z = _5289;
    }
    if (_159)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _175 = in.m_57.x;
    float _177 = in.m_57.y;
    float _179 = in.m_57.z;
    float _181 = (*spvDescriptorSet0.vp_c10)._m0[18].y * (*spvDescriptorSet0.vp_c10)._m0[18].y;
    float _183 = as_type<float>(int(gl_VertexIndex));
    float _185 = fma((*spvDescriptorSet0.vp_c10)._m0[18].x, (*spvDescriptorSet0.vp_c10)._m0[18].x, _181);
    float _187 = (*spvDescriptorSet0.vp_c10)._m0[19].y * (*spvDescriptorSet0.vp_c10)._m0[19].y;
    float _189 = fma((*spvDescriptorSet0.vp_c10)._m0[19].x, (*spvDescriptorSet0.vp_c10)._m0[19].x, _187);
    float _191 = fma((*spvDescriptorSet0.vp_c10)._m0[18].z, (*spvDescriptorSet0.vp_c10)._m0[18].z, _185);
    float _193 = (*spvDescriptorSet0.vp_c10)._m0[20].y * (*spvDescriptorSet0.vp_c10)._m0[20].y;
    float _195 = fma((*spvDescriptorSet0.vp_c10)._m0[19].z, (*spvDescriptorSet0.vp_c10)._m0[19].z, _189);
    float _197 = sqrt(_191);
    float _199 = fma((*spvDescriptorSet0.vp_c10)._m0[20].x, (*spvDescriptorSet0.vp_c10)._m0[20].x, _193);
    float _201 = fma((*spvDescriptorSet0.vp_c10)._m0[20].z, (*spvDescriptorSet0.vp_c10)._m0[20].z, _199);
    float _203 = _177 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
    float _205 = _177 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
    float _207 = sqrt(_195);
    float _209 = _177 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
    float _211 = fma(_175, (*spvDescriptorSet0.vp_c10)._m0[14].y, _203);
    float _213 = fma(_175, (*spvDescriptorSet0.vp_c10)._m0[14].x, _205);
    float _215 = _177 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
    float _217 = fma(_175, (*spvDescriptorSet0.vp_c10)._m0[14].z, _209);
    float _219 = fma(_179, (*spvDescriptorSet0.vp_c10)._m0[16].y, _211);
    float _221 = fma(_179, (*spvDescriptorSet0.vp_c10)._m0[16].x, _213);
    float _223 = sqrt(_201);
    int _225 = as_type<int>(_183) & 1;
    bool _227 = _225 != 0;
    int _229 = as_type<int>(_183) & 2;
    bool _231 = _229 != 0;
    float _233 = fma(_175, (*spvDescriptorSet0.vp_c10)._m0[14].w, _215);
    bool _235 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _237 = fma(_179, (*spvDescriptorSet0.vp_c10)._m0[16].z, _217);
    float _239 = _197 * _221;
    float _241 = fma(_179, (*spvDescriptorSet0.vp_c10)._m0[16].w, _233);
    bool _243 = !_227;
    float _245 = _243 ? (-0.5) : 0.5;
    float _247 = _207 * _219;
    bool _249 = !_231;
    float _251 = _249 ? (-0.5) : 0.5;
    float _253 = _247 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _255 = _247 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _257 = _247 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _259 = _223 * _237;
    float _261 = fma(_239, (*spvDescriptorSet0.vp_c8)._m0[24].x, _253);
    float _263 = fma(_239, (*spvDescriptorSet0.vp_c8)._m0[25].x, _255);
    float _265 = fma(_239, (*spvDescriptorSet0.vp_c8)._m0[26].x, _257);
    float _267 = fma(_259, (*spvDescriptorSet0.vp_c8)._m0[24].z, _261);
    float _269 = fma(_259, (*spvDescriptorSet0.vp_c8)._m0[25].z, _263);
    float _271 = fma(_259, (*spvDescriptorSet0.vp_c8)._m0[26].z, _265);
    float _273 = fma(_241, (*spvDescriptorSet0.vp_c8)._m0[24].w, _267);
    float _275 = fma(_241, (*spvDescriptorSet0.vp_c8)._m0[25].w, _269);
    float _277 = fma(_241, (*spvDescriptorSet0.vp_c8)._m0[26].w, _271);
    bool _279 = !_235;
    bool _281 = _235;
    float _283 = _273;
    float _285 = _277;
    float _303;
    if (!_279)
    {
        float _287 = in.m_62.x;
        float _289 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _291 = _287 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _293 = fma(_291, (*spvDescriptorSet0.vp_c9)._m0[12].x, _123);
        float _295 = _293 * _289;
        float _297 = floor(_295);
        float _299 = -_297;
        float _301 = _295 + _299;
        _303 = _301;
        _305 = true;
    }
    else
    {
        _303 = _165;
    }
    _305 = false;
    float _307 = _303;
    float _309 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _311 = _307 + _309;
    float _313 = in.m_64.x;
    float _315 = in.m_64.y;
    bool _317 = _307 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _319 = isnan(_307);
    bool _321 = _317 || _319;
    bool _323 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _325 = _321 || _323;
    float _327 = float(_325);
    float _329 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _331 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _329;
    bool _333 = _307 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _335 = isnan(_307);
    bool _337 = _333 || _335;
    bool _339 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _341 = _337 || _339;
    float _343 = float(_341);
    float _345 = -_327;
    float _347 = _345 + 1.0;
    float _349 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _351 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _349;
    float _353 = 1.0 / _331;
    bool _355 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _357 = _343 * _347;
    float _359 = -_343;
    float _361 = _359 + 1.0;
    float _363 = _311 * _353;
    float _365 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _367 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _365;
    float _369 = fma(_351, _363, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _371 = fma(_367, _363, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _373 = _369 * _357;
    float _375 = _371 * _357;
    float _377 = fma(_361, (*spvDescriptorSet0.vp_c9)._m0[143].x, _373);
    float _379 = fma(_361, (*spvDescriptorSet0.vp_c9)._m0[143].y, _375);
    float _381 = fma(_327, (*spvDescriptorSet0.vp_c9)._m0[144].x, _377);
    float _383 = fma(_327, (*spvDescriptorSet0.vp_c9)._m0[144].y, _379);
    float _385 = _381 * _313;
    float _387 = _383 * _315;
    bool _389 = !_355;
    float _407;
    if (!_389)
    {
        float _391 = in.m_62.x;
        float _393 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _395 = _391 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _397 = fma(_395, (*spvDescriptorSet0.vp_c9)._m0[11].y, _123);
        float _399 = _397 * _393;
        float _401 = floor(_399);
        float _403 = -_401;
        float _405 = _399 + _403;
        _407 = _405;
        _409 = true;
    }
    else
    {
        _407 = _165;
    }
    _409 = false;
    float _411 = _407;
    bool _413 = _411 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _415 = isnan(_411);
    bool _417 = _413 || _415;
    bool _419 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _421 = _417 || _419;
    float _423 = float(_421);
    float _425 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _427 = _425 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _429 = _411 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _431 = isnan(_411);
    bool _433 = _429 || _431;
    bool _435 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _437 = _433 || _435;
    float _439 = float(_437);
    float _441 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _443 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _441;
    float _445 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _447 = _411 + _445;
    float _449 = -_423;
    float _451 = _449 + 1.0;
    bool _453 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _455 = 1.0 / _427;
    float _457 = _439 * _451;
    float _459 = -_439;
    float _461 = _459 + 1.0;
    float _463 = _443 * _455;
    float _465 = fma(_463, _447, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _467 = _465 * _457;
    float _469 = fma(_461, (*spvDescriptorSet0.vp_c9)._m0[115].x, _467);
    float _471 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _473 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _475 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _477 = fma(_423, (*spvDescriptorSet0.vp_c9)._m0[116].x, _469);
    float _479 = _471 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _481 = _473 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _483 = _475 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _485 = _477 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_66.x = _479;
    out.m_66.y = _481;
    out.m_66.z = _483;
    out.m_66.w = _485;
    bool _487 = !_453;
    float _505;
    if (!_487)
    {
        float _489 = in.m_62.x;
        float _491 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _493 = _489 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _495 = fma(_493, (*spvDescriptorSet0.vp_c9)._m0[11].w, _123);
        float _497 = _495 * _491;
        float _499 = floor(_497);
        float _501 = -_499;
        float _503 = _497 + _501;
        _505 = _503;
        _507 = true;
    }
    else
    {
        _505 = _165;
    }
    _507 = false;
    float _509 = _505;
    float _511 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _513 = _509 + _511;
    float _515 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _517 = _515 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _519 = _509 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _521 = isnan(_509);
    bool _523 = _519 || _521;
    bool _525 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _527 = _523 || _525;
    float _529 = float(_527);
    float _531 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _533 = _531 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _535 = _509 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _537 = isnan(_509);
    bool _539 = _535 || _537;
    bool _541 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _543 = _539 || _541;
    float _545 = float(_543);
    float _547 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _549 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _547;
    bool _551 = _509 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _553 = isnan(_509);
    bool _555 = _551 || _553;
    bool _557 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _559 = _555 || _557;
    float _561 = float(_559);
    float _563 = 1.0 / _517;
    float _565 = -_529;
    float _567 = _565 + 1.0;
    bool _569 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _571 = _545 * _567;
    float _573 = -_545;
    float _575 = _573 + 1.0;
    float _577 = 1.0 / _533;
    float _579 = _549 * _563;
    float _581 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _583 = _581 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _585 = fma(_579, _513, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _587 = _583 * _577;
    float _589 = _585 * _571;
    float _591 = -_561;
    float _593 = _591 + 1.0;
    float _595 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _597 = _509 + _595;
    float _599 = fma(_575, (*spvDescriptorSet0.vp_c9)._m0[131].x, _589);
    float _601 = _529 * _593;
    float _603 = fma(_587, _597, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _605 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _607 = fma(_603, _601, _599);
    float _609 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _611 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _613 = fma(_561, (*spvDescriptorSet0.vp_c9)._m0[133].x, _607);
    float _615 = _605 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _617 = _609 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _619 = _611 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _621 = _613 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_68.x = _615;
    out.m_68.y = _617;
    out.m_68.z = _619;
    out.m_68.w = _621;
    bool _623 = !_569;
    int _625 = as_type<int>(_613);
    if (!_623)
    {
        float _627 = in.m_62.x;
        float _629 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _631 = _627 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _633 = fma(_631, (*spvDescriptorSet0.vp_c9)._m0[14].x, _123);
        float _635 = _633 * _629;
        float _637 = floor(_635);
        float _639 = -_637;
        float _641 = _635 + _639;
        _169 = _641;
    }
    float _643 = _169;
    float _645 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _647 = int(_645);
    int _649 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _651 = _649 != 0;
    float _653 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].y);
    int _655 = int(_653);
    float _657 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _659 = int(_657);
    float _661 = float(_647);
    float _663 = _621;
    if (_651)
    {
        float _665 = in.m_62.w;
        _663 = _665;
    }
    float _667 = _663;
    float _669 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _671 = int(_669);
    float _673 = float(_655);
    float _675 = 1.0 / _661;
    float _677 = float(_659);
    float _679 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _681 = int(_679);
    float _683 = float(uint(_671));
    float _685 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].x);
    int _687 = int(_685);
    float _689 = _675 * _123;
    int _691 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _693 = _691 != 0;
    float _695 = (*spvDescriptorSet0.vp_c9)._m0[7].z;
    if (_651)
    {
        float _697 = _667 * 3.1415927410125732421875;
        _695 = _697;
    }
    float _699 = _695;
    float _701 = 1.0 / _677;
    float _703 = float(uint(_681));
    float _705 = 0.0;
    if (_651)
    {
        float _707 = _699 * 0.15915493667125701904296875;
        _705 = _707;
    }
    float _709 = _705;
    float _711 = 1.0 / _673;
    float _713 = float(uint(_687));
    float _715 = _699;
    float _717 = _677;
    if (_693)
    {
        float _719 = in.m_62.x;
        float _721 = in.m_62.y;
        _715 = _719;
        _717 = _721;
    }
    float _723 = _715;
    float _725 = _717;
    float _727 = 0.0;
    if (_693)
    {
        _727 = 1.0;
    }
    float _729 = _727;
    float _731 = 0.0;
    float _733 = _729;
    if (_693)
    {
        _731 = 1.0;
    }
    float _735 = _731;
    float _737 = 1.0 / _683;
    float _739 = _701 * _123;
    int _741 = 0;
    float _743 = _735;
    if (_693)
    {
        _741 = 0;
    }
    int _745 = _741;
    int _747 = _745;
    if (_693)
    {
        _625 = 0;
    }
    int _749 = _625;
    float _751 = trunc(_689);
    int _753 = int(_751);
    float _755 = _711 * _123;
    float _757 = 1.0 / _703;
    int _759 = as_type<int>(_737) + (-2);
    float _761 = 1.0 / _713;
    float _763 = float(uint(_753));
    float _765 = as_type<float>(_759) * _763;
    float _767 = trunc(_739);
    int _769 = int(_767);
    int _771 = as_type<int>(_757) + (-2);
    float _773 = trunc(_755);
    int _775 = int(_773);
    int _777 = as_type<int>(_761) + (-2);
    float _779 = float(uint(_769));
    float _781 = _709;
    float _783 = _779;
    float _785 = _737;
    float _787 = _765;
    int _789 = _749;
    float _791 = as_type<float>(_759);
    if (_651)
    {
        float _793 = _709 * 6.283185482025146484375;
        float _795 = sin(_793);
        _781 = _795;
    }
    float _797 = _781;
    float _799 = as_type<float>(_771) * _779;
    float _801 = _723;
    float _803 = _725;
    if (_693)
    {
        _783 = _725;
    }
    float _805 = _783;
    float _807 = float(uint(_775));
    float _809 = trunc(_799);
    float _811 = precise::max(_809, 0.0);
    uint _814 = uint(_811);
    float _816 = as_type<float>(_777) * _807;
    float _818 = _807;
    float _820 = _805;
    if (_693)
    {
        _818 = _723;
    }
    float _822 = _818;
    float _824 = trunc(_816);
    float _826 = precise::max(_824, 0.0);
    uint _828 = uint(_826);
    float _830 = _822;
    if (_693)
    {
        _785 = _822;
    }
    float _832 = _785;
    float _834 = trunc(_765);
    float _836 = precise::max(_834, 0.0);
    uint _838 = uint(_836);
    float _840 = _832;
    if (_693)
    {
        _787 = _822;
    }
    float _842 = _787;
    float _844 = _842;
    if (!_693)
    {
        float _846 = in.m_62.x;
        float _848 = in.m_62.y;
        float _850 = in.m_62.z;
        float _852 = _846 * 3.1415927410125732421875;
        float _854 = _852 * 0.15915493667125701904296875;
        float _856 = _848 * 3.1415927410125732421875;
        float _858 = _856 * 0.15915493667125701904296875;
        float _860 = _854 * 6.283185482025146484375;
        float _862 = sin(_860);
        float _864 = _858 * 6.283185482025146484375;
        float _866 = sin(_864);
        _733 = 7.345489978790283203125;
        _801 = _846;
        _830 = _848;
        _743 = 5.839270114898681640625;
        _844 = _850;
        _803 = _848;
        _840 = _862;
        _820 = _866;
        _747 = 1;
        _789 = 2;
    }
    float _868 = _733;
    float _870 = _801;
    float _872 = _830;
    float _874 = _743;
    float _876 = _844;
    float _878 = _803;
    float _880 = _840;
    float _882 = _820;
    int _884 = _747;
    int _886 = _789;
    int _888 = ~_671;
    int _890 = _888 + 1;
    float _892 = _868 * _870;
    float _894 = _868 * _872;
    int _896 = ~_681;
    int _898 = _896 + 1;
    float _900 = in.m_62.z;
    float _902 = in.m_62.w;
    int _904 = _890 * int(_838);
    int _906 = _904 + _753;
    float _908 = floor(_894);
    int _910 = ~_687;
    int _912 = _910 + 1;
    int _914 = _898 * int(_814);
    int _916 = _914 + _769;
    float _918 = _874 * _876;
    float _920 = float(uint(_906));
    float _922 = _878 * 2.0;
    float _924 = as_type<float>(_884);
    if (_651)
    {
        bool _926 = _797 > 0.5;
        _281 = _926;
    }
    bool _928 = _281;
    float _930 = float(uint(_916));
    float _932 = as_type<float>(_759) * _920;
    float _934 = floor(_918);
    int _936 = _912 * int(_828);
    int _938 = _936 + _775;
    int _940 = ~_671;
    int _942 = _940 + 1;
    float _944 = as_type<float>(_771) * _930;
    float _946 = float(_681);
    float _948 = float(uint(_938));
    float _950 = -_908;
    float _952 = _894 + _950;
    float _954 = trunc(_932);
    float _956 = precise::max(_954, 0.0);
    uint _958 = uint(_956);
    float _960 = float(_671);
    float _962 = as_type<float>(_777) * _948;
    bool _964 = _902 > 0.5;
    float _966 = float(_687);
    float _968 = floor(_892);
    float _970 = -_934;
    float _972 = _918 + _970;
    float _974 = float(_753);
    float _976 = _952 * _966;
    float _978 = 0.0;
    if (!_651)
    {
        _978 = _245;
    }
    float _980 = _978;
    bool _982 = _974 >= _960;
    bool _984 = isnan(_974);
    bool _986 = _982 || _984;
    bool _988 = isnan(_960);
    bool _990 = _986 || _988;
    float _992 = float(_990);
    float _994 = trunc(_944);
    float _996 = precise::max(_994, 0.0);
    uint _998 = uint(_996);
    int _1000 = int(_838) + int(_958);
    float _1002 = _161 * _123;
    float _1004 = float(_775);
    float _1006 = _980;
    if (_651)
    {
        float _1008 = -_245;
        float _1010 = _928 ? _1008 : _245;
        _1006 = _1010;
    }
    float _1012 = _1006;
    float _1014 = _960 * _1002;
    int _1016 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1018 = _1016 != 0;
    float _1020 = trunc(_962);
    float _1022 = precise::max(_1020, 0.0);
    uint _1024 = uint(_1022);
    float _1026 = -_968;
    float _1028 = _892 + _1026;
    float _1030 = float(_769);
    float _1032 = _966 * _1002;
    bool _1034 = _900 > 0.5;
    float _1036 = _1028 * _960;
    int _1038 = _942 * _1000;
    int _1040 = _1038 + _753;
    bool _1042 = _878 > 0.5;
    float _1044 = _972 * _946;
    bool _1046 = _1030 >= _946;
    bool _1048 = isnan(_1030);
    bool _1050 = _1046 || _1048;
    bool _1052 = isnan(_946);
    bool _1054 = _1050 || _1052;
    float _1056 = float(_1054);
    float _1058 = _946 * _1002;
    bool _1060 = uint(_1040) >= uint(_671);
    float _1062 = trunc(_992);
    int _1064 = int(_1062);
    bool _1066 = _1004 >= _966;
    bool _1068 = isnan(_1004);
    bool _1070 = _1066 || _1068;
    bool _1072 = isnan(_966);
    bool _1074 = _1070 || _1072;
    float _1076 = float(_1074);
    int _1078 = int(_814) + int(_998);
    int _1080 = ~_681;
    int _1082 = _1080 + 1;
    float _1084 = -_251;
    int _1086 = _964 ? as_type<int>(_1084) : as_type<int>(_251);
    float _1088 = trunc(_1056);
    int _1090 = int(_1088);
    int _1092 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1094 = _1092 != 0;
    int _1096 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1098 = _1096 != 0;
    int _1100 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1102 = _1100 != 0;
    int _1104 = _1082 * _1078;
    int _1106 = _1104 + _769;
    int _1108 = int(_828) + int(_1024);
    float _1110 = -_251;
    int _1112 = _1034 ? as_type<int>(_1110) : as_type<int>(_251);
    float _1114 = -_245;
    int _1116 = _1042 ? as_type<int>(_1114) : as_type<int>(_245);
    float _1118 = trunc(_1076);
    int _1120 = int(_1118);
    int _1122 = ~_687;
    int _1124 = _1122 + 1;
    bool _1126 = !_1094;
    float _1128 = _1126 ? _251 : as_type<float>(_1086);
    int _1130 = int(_1060);
    int _1132 = _1018 ? 2 : 0;
    int _1134 = _1130 | _1132;
    int _1136 = _1034 ? 4 : 0;
    int _1138 = _1134 | _1136;
    int _1140 = _1094 ? 8 : 0;
    int _1142 = _1138 | _1140;
    int _1144 = _1098 ? 16 : 0;
    int _1146 = _1142 | _1144;
    int _1148 = _1102 ? 32 : 0;
    int _1150 = _1146 | _1148;
    int _1152 = _1042 ? 64 : 0;
    int _1154 = _1150 | _1152;
    int _1156 = _1154 & 64;
    float _1158 = trunc(_1036);
    int _1160 = int(_1158);
    bool _1162 = !_1102;
    float _1164 = _1162 ? _251 : as_type<float>(_1112);
    bool _1166 = !_1098;
    float _1168 = _1166 ? _245 : as_type<float>(_1116);
    int _1170 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1172 = _1170 != 0;
    int _1174 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1176 = _1174 != 0;
    int _1178 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1180 = _1178 != 0;
    float _1182 = trunc(_1014);
    int _1184 = int(_1182);
    bool _1186 = !_1018;
    int _1188 = _1186 ? 0 : 1;
    int _1190 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1192 = _1190 != 0;
    int _1194 = _1124 * _1108;
    int _1196 = _1194 + _775;
    bool _1198 = uint(_1106) >= uint(_681);
    bool _1200 = !_1060;
    int _1202 = _1200 ? 0 : (-1);
    float _1204 = trunc(_1058);
    int _1206 = int(_1204);
    bool _1208 = !_1176;
    int _1210 = _1208 ? 0 : 1;
    bool _1212 = !_1172;
    int _1214 = _1212 ? 0 : 1;
    bool _1216 = !_1180;
    int _1218 = _1216 ? 0 : 1;
    bool _1220 = !_1192;
    int _1222 = _1220 ? 0 : 1;
    float _1224 = trunc(_1032);
    int _1226 = int(_1224);
    int _1228 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _1230 = _1228 != 0;
    int _1232 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _1234 = _1232 != 0;
    int _1236 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _1238 = _1236 != 0;
    int _1240 = ~_1000;
    int _1242 = _1240 + _1202;
    int _1244 = _1242 + 1;
    int _1246 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _1248 = _1246 != 0;
    bool _1250 = uint(_1196) >= uint(_687);
    int _1252 = _671 * _1244;
    int _1254 = _1252 + _753;
    int _1256 = abs(_1188);
    float _1258 = trunc(_1044);
    int _1260 = int(_1258);
    bool _1262 = !_1248;
    int _1264 = _1262 ? 0 : 1;
    bool _1266 = !_1234;
    int _1268 = _1266 ? 0 : 1;
    int _1270 = _1160 * _1256;
    int _1272 = _1270 + _753;
    int _1274 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _1276 = _1274 != 0;
    int _1278 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32768;
    bool _1280 = _1278 != 0;
    float _1282 = floor(_922);
    bool _1284 = _671 == 0;
    bool _1286 = !_1198;
    int _1288 = _1286 ? 0 : (-1);
    bool _1290 = !_1250;
    int _1292 = _1290 ? 0 : (-1);
    bool _1294 = !_1276;
    int _1296 = _1294 ? 0 : 1;
    bool _1298 = !_1280;
    int _1300 = _1298 ? 0 : 1;
    int _1302 = ~_1064;
    int _1304 = _1302 + 1;
    int _1306 = _1304 + 1;
    bool _1308 = !_1284;
    int _1310 = _1308 ? _1254 : (-1);
    int _1312 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 65536;
    bool _1314 = _1312 != 0;
    int _1316 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 131072;
    bool _1318 = _1316 != 0;
    int _1320 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 262144;
    bool _1322 = _1320 != 0;
    int _1324 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 524288;
    bool _1326 = _1324 != 0;
    int _1328 = ~_1078;
    int _1330 = _1328 + _1288;
    int _1332 = _1330 + 1;
    int _1334 = _1310 * _1306;
    int _1336 = ~_1108;
    int _1338 = _1336 + _1292;
    int _1340 = _1338 + 1;
    bool _1342 = !_1318;
    int _1344 = _1342 ? 0 : 1;
    int _1346 = _681 * _1332;
    int _1348 = _1346 + _769;
    bool _1350 = _681 == 0;
    int _1352 = _687 * _1340;
    int _1354 = _1352 + _775;
    bool _1356 = !_1314;
    int _1358 = _1356 ? 0 : 1;
    bool _1360 = _687 == 0;
    int _1362 = _671 + (-1);
    int _1364 = abs(_1264);
    int _1366 = abs(_1210);
    int _1368 = _1064 * _1362;
    int _1370 = _1368 + _1334;
    int _1372 = ~_1090;
    int _1374 = _1372 + 1;
    int _1376 = _1374 + 1;
    int _1378 = _1260 * _1364;
    int _1380 = _1378 + _769;
    bool _1382 = !_1350;
    int _1384 = _1382 ? _1348 : (-1);
    int _1386 = _1370 * _1366;
    int _1388 = ~_1120;
    int _1390 = _1388 + 1;
    int _1392 = _1390 + 1;
    float _1394 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1396 = log2(_1394);
    bool _1398 = !_1360;
    int _1400 = _1398 ? _1354 : (-1);
    int _1402 = _1384 * _1376;
    int _1404 = abs(_1214);
    float _1406 = _878 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _1408 = _681 + (-1);
    int _1410 = _1400 * _1392;
    int _1412 = abs(_1268);
    float _1414 = trunc(_976);
    int _1416 = int(_1414);
    int _1418 = abs(_1218);
    int _1420 = _1090 * _1408;
    int _1422 = _1420 + _1402;
    int _1424 = _687 + (-1);
    int _1426 = _1184 * _1404;
    int _1428 = _1426 + _1386;
    bool _1430 = !_1230;
    int _1432 = _1430 ? 0 : 1;
    int _1434 = _1120 * _1424;
    int _1436 = _1434 + _1410;
    int _1438 = _1272 * _1418;
    int _1440 = _1438 + _1428;
    int _1442 = abs(_1222);
    float _1444 = _1396 * _123;
    int _1446 = abs(_1344);
    int _1448 = _1422 * _1412;
    int _1450 = abs(_1432);
    int _1452 = _1160 * _1442;
    int _1454 = _1452 + _1440;
    int _1456 = abs(_1358);
    int _1458 = _1436 * _1446;
    bool _1460 = !_1238;
    int _1462 = _1460 ? 0 : 1;
    int _1464 = _1206 * _1450;
    int _1466 = _1464 + _1448;
    int _1468 = abs(_1296);
    int _1470 = _1226 * _1456;
    int _1472 = _1470 + _1458;
    float _1474 = float(uint(_1454));
    float _1476 = exp2(_1444);
    bool _1478 = !_1322;
    int _1480 = _1478 ? 0 : 1;
    int _1482 = abs(_1462);
    float _1484 = as_type<float>(_759) * _1474;
    int _1486 = abs(_1480);
    int _1488 = abs(_1300);
    bool _1490 = !_1326;
    int _1492 = _1490 ? 0 : 1;
    float _1494 = trunc(_1484);
    float _1496 = precise::max(_1494, 0.0);
    uint _1498 = uint(_1496);
    int _1500 = _1416 * _1488;
    int _1502 = _1500 + _775;
    int _1504 = abs(_1492);
    int _1506 = _1380 * _1482;
    int _1508 = _1506 + _1466;
    int _1510 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _1512 = _1510 != 0;
    int _1514 = _1502 * _1486;
    int _1516 = _1514 + _1472;
    int _1518 = _1260 * _1468;
    int _1520 = _1518 + _1508;
    int _1522 = ~_671;
    int _1524 = _1522 + 1;
    int _1526 = ~_681;
    int _1528 = _1526 + 1;
    int _1530 = _1416 * _1504;
    int _1532 = _1530 + _1516;
    float _1534 = float(uint(_1520));
    int _1536 = ~_671;
    int _1538 = _1536 + 1;
    float _1540 = float(uint(_1532));
    float _1542 = as_type<float>(_771) * _1534;
    int _1544 = _1524 * int(_1498);
    int _1546 = _1544 + _1454;
    float _1548 = as_type<float>(_1486);
    float _1550 = as_type<float>(_1546);
    bool _1552 = _1230;
    float _1554 = as_type<float>(_1354);
    float _1556 = as_type<float>(_1418);
    float _1558 = as_type<float>(_1412);
    if (_1512)
    {
        float _1560 = in.m_62.x;
        _1548 = _1560;
    }
    float _1562 = _1548;
    bool _1564 = _900 > 0.5;
    float _1566 = as_type<float>(_777) * _1540;
    float _1568 = trunc(_1542);
    float _1570 = precise::max(_1568, 0.0);
    uint _1572 = uint(_1570);
    float _1574 = float(uint(_1546));
    float _1576 = as_type<float>(_759) * _1574;
    float _1578 = trunc(_1566);
    float _1580 = precise::max(_1578, 0.0);
    uint _1582 = uint(_1580);
    float _1584 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    float _1586 = fma(_880, (*spvDescriptorSet0.vp_c9)._m0[93].z, _1584);
    float _1588 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1590 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1592 = trunc(_1576);
    float _1594 = precise::max(_1592, 0.0);
    uint _1596 = uint(_1594);
    int _1598 = ~_687;
    int _1600 = _1598 + 1;
    int _1602 = _1528 * int(_1572);
    int _1604 = _1602 + _1520;
    float _1606 = fma(_1406, -2.0, _1588);
    float _1608 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    if (_1512)
    {
        float _1610 = _1562 * 3.1415927410125732421875;
        _1550 = _1610;
    }
    float _1612 = _1550;
    float _1614 = float(uint(_1272));
    float _1616 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[92].z, _1586);
    int _1618 = _1600 * int(_1582);
    int _1620 = _1618 + _1532;
    float _1622 = float(uint(_1604));
    float _1624 = _1612;
    if (_1512)
    {
        float _1626 = _1612 * 0.15915493667125701904296875;
        _1624 = _1626;
    }
    float _1628 = _1624;
    float _1630 = as_type<float>(_759) * _1614;
    float _1632 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1606);
    float _1634 = as_type<float>(_771) * _1622;
    float _1636 = trunc(_1630);
    float _1638 = precise::max(_1636, 0.0);
    uint _1640 = uint(_1638);
    int _1642 = int(_1498) + int(_1596);
    float _1644 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    float _1646 = float(uint(_1620));
    float _1648 = fma(_882, (*spvDescriptorSet0.vp_c9)._m0[93].w, _1644);
    float _1650 = as_type<float>(_777) * _1646;
    int _1652 = _1538 * _1642;
    int _1654 = _1652 + _1454;
    float _1656 = trunc(_1634);
    float _1658 = precise::max(_1656, 0.0);
    uint _1660 = uint(_1658);
    int _1662 = ~_671;
    int _1664 = _1662 + 1;
    float _1666 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    float _1668 = _882 * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    bool _1670 = uint(_1654) >= uint(_671);
    int _1672 = _1664 * int(_1640);
    int _1674 = _1672 + _1272;
    float _1676 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1678 = _1628;
    if (_1512)
    {
        float _1680 = _1628 * 6.283185482025146484375;
        float _1682 = sin(_1680);
        _1678 = _1682;
    }
    float _1684 = _1678;
    bool _1686 = !_1670;
    int _1688 = _1686 ? 0 : (-1);
    float _1690 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1692 = float(uint(_1674));
    float _1694 = fma(_1668, -2.0, _1666);
    int _1696 = ~_1642;
    int _1698 = _1696 + _1688;
    int _1700 = _1698 + 1;
    float _1702 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[92].w, _1648);
    float _1704 = float(uint(_1380));
    float _1706 = trunc(_1650);
    float _1708 = precise::max(_1706, 0.0);
    uint _1710 = uint(_1708);
    int _1712 = int(_1572) + int(_1660);
    int _1714 = _671 * _1700;
    int _1716 = _1714 + _1454;
    int _1718 = ~_681;
    int _1720 = _1718 + 1;
    float _1722 = as_type<float>(_771) * _1704;
    float _1724 = as_type<float>(_759) * _1692;
    int _1726 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1728 = _1726 != 0;
    float _1730 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[91].y, _1694);
    float _1732 = trunc(_1722);
    float _1734 = precise::max(_1732, 0.0);
    uint _1736 = uint(_1734);
    if (_1512)
    {
        bool _1738 = _1684 > 0.5;
        _1552 = _1738;
    }
    bool _1740 = _1552;
    float _1742 = -_1702;
    float _1744 = _1742 + 1.0;
    bool _1746 = !_1284;
    int _1748 = _1746 ? _1716 : (-1);
    int _1750 = _1720 * _1712;
    int _1752 = _1750 + _1520;
    float _1754 = -_245;
    int _1756 = _1564 ? as_type<int>(_1754) : as_type<int>(_245);
    if (!_1512)
    {
        _791 = _251;
    }
    float _1758 = _791;
    float _1760 = trunc(_1724);
    float _1762 = precise::max(_1760, 0.0);
    uint _1764 = uint(_1762);
    float _1766 = _1758;
    if (_1512)
    {
        float _1768 = -_251;
        float _1770 = _1740 ? _1768 : _251;
        _1766 = _1770;
    }
    float _1772 = _1766;
    bool _1774 = !_1728;
    float _1776 = _1774 ? _245 : as_type<float>(_1756);
    int _1778 = _1748 & 3;
    bool _1780 = _1778 != 0;
    bool _1782 = uint(_1752) >= uint(_681);
    int _1784 = int(_1582) + int(_1710);
    int _1786 = ~_687;
    int _1788 = _1786 + 1;
    bool _1790 = uint(_1778) > 1u;
    bool _1792 = !_1782;
    int _1794 = _1792 ? 0 : (-1);
    int _1796 = _1788 * _1784;
    int _1798 = _1796 + _1532;
    int _1800 = _1748 & 3;
    bool _1802 = _1800 != 0;
    int _1804 = ~_1712;
    int _1806 = _1804 + _1794;
    int _1808 = _1806 + 1;
    int _1810 = _1720 * int(_1736);
    int _1812 = _1810 + _1380;
    int _1814 = _1802 ? 0 : 1;
    bool _1816 = uint(_1798) >= uint(_687);
    int _1818 = int(_1640) + int(_1764);
    float _1820 = float(uint(_1812));
    int _1822 = ~_671;
    int _1824 = _1822 + 1;
    int _1826 = ~_1814;
    int _1828 = _1826 + 1;
    int _1830 = _1828 + 1;
    float _1832 = as_type<float>(_771) * _1820;
    int _1834 = _1830;
    if (!_1790)
    {
        int _1836 = ~_1814;
        int _1838 = _1836 + 1;
        _1834 = _1838;
    }
    int _1840 = _1834;
    int _1842 = _1824 * _1818;
    int _1844 = _1842 + _1272;
    bool _1846 = _1778 != 3;
    int _1848 = _681 * _1808;
    int _1850 = _1848 + _1520;
    bool _1852 = uint(_1778) >= 2u;
    bool _1854 = _1156 != 0;
    float _1856 = _870 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _1858 = _1852 ? 0 : 1;
    float _1860 = -_251;
    int _1862 = _1854 ? as_type<int>(_1860) : as_type<int>(_251);
    int _1864 = 2 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1866 = _1864 != 0;
    bool _1868 = !_1816;
    int _1870 = _1868 ? 0 : (-1);
    float _1872 = trunc(_1832);
    float _1874 = precise::max(_1872, 0.0);
    uint _1876 = uint(_1874);
    bool _1878 = uint(_1844) >= uint(_671);
    bool _1880 = !_1350;
    int _1882 = _1880 ? _1850 : (-1);
    float _1884 = float(uint(_1502));
    bool _1886 = !_1866;
    float _1888 = _1886 ? _251 : as_type<float>(_1862);
    int _1890 = _1882 & 3;
    bool _1892 = _1890 != 0;
    int _1894 = ~_1858;
    int _1896 = _1894 + 1;
    int _1898 = _1896 + 1;
    int _1900 = ~_1784;
    int _1902 = _1900 + _1870;
    int _1904 = _1902 + 1;
    float _1906 = as_type<float>(_777) * _1884;
    int _1908 = _1898;
    if (_1846)
    {
        int _1910 = ~_1858;
        int _1912 = _1910 + 1;
        _1908 = _1912;
    }
    int _1914 = _1908;
    int _1916 = _1882 & 3;
    bool _1918 = _1916 != 0;
    int _1920 = _687 * _1904;
    int _1922 = _1920 + _1532;
    bool _1924 = !_1878;
    int _1926 = _1924 ? 0 : (-1);
    float _1928 = trunc(_1906);
    float _1930 = precise::max(_1928, 0.0);
    uint _1932 = uint(_1930);
    bool _1934 = uint(_1890) >= 2u;
    int _1936 = _1918 ? 0 : 1;
    bool _1938 = uint(_1890) > 1u;
    int _1940 = _1934 ? 0 : 1;
    int _1942 = ~_681;
    int _1944 = _1942 + 1;
    bool _1946 = _1890 != 3;
    int _1948 = int(_1736) + int(_1876);
    int _1950 = ~_687;
    int _1952 = _1950 + 1;
    int _1954 = ~_1936;
    int _1956 = _1954 + 1;
    int _1958 = _1956 + 1;
    int _1960 = _1944 * _1948;
    int _1962 = _1960 + _1380;
    int _1964 = ~_1940;
    int _1966 = _1964 + 1;
    int _1968 = _1966 + 1;
    int _1970 = _1958;
    int _1972 = _1968;
    if (!_1938)
    {
        int _1974 = ~_1936;
        int _1976 = _1974 + 1;
        _1970 = _1976;
    }
    int _1978 = _1970;
    int _1980 = _1952 * int(_1932);
    int _1982 = _1980 + _1502;
    int _1984 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _1986 = _1984 != 0;
    float _1988 = as_type<float>(_1932);
    if (_1946)
    {
        int _1990 = ~_1940;
        int _1992 = _1990 + 1;
        _1972 = _1992;
    }
    int _1994 = _1972;
    bool _1996 = uint(_1962) >= uint(_681);
    bool _1998 = !_1360;
    int _2000 = _1998 ? _1922 : (-1);
    bool _2002 = !_1986;
    int _2004 = _2002 ? 0 : 1;
    bool _2006 = !_1996;
    int _2008 = _2006 ? 0 : (-1);
    int _2010 = _2000 & 3;
    bool _2012 = _2010 != 0;
    int _2014 = _2000 & 3;
    bool _2016 = _2014 != 0;
    float _2018 = float(uint(_1982));
    int _2020 = _2012 ? 0 : 1;
    bool _2022 = uint(_2014) > 1u;
    float _2024 = as_type<float>(_777) * _2018;
    int _2026 = ~_2020;
    int _2028 = _2026 + 1;
    int _2030 = _2028 + 1;
    float _2032 = trunc(_2024);
    float _2034 = precise::max(_2032, 0.0);
    uint _2036 = uint(_2034);
    float _2038 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _2040 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    int _2042 = _2030;
    float _2044 = _2024;
    if (!_2022)
    {
        int _2046 = ~_2020;
        int _2048 = _2046 + 1;
        _2042 = _2048;
    }
    int _2050 = _2042;
    float _2052 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2054 = _2052 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _2056 = uint(_2014) >= 2u;
    float _2058 = fma(_878, (*spvDescriptorSet0.vp_c9)._m0[88].w, _2040);
    float _2060 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2062 = _2060 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    int _2064 = _2056 ? 0 : 1;
    float _2066 = 1.0 / _2054;
    bool _2068 = _2014 != 3;
    float _2070 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2072 = _2070 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    int _2074 = int(_1932) + int(_2036);
    int _2076 = ~_2064;
    int _2078 = _2076 + 1;
    int _2080 = _2078 + 1;
    int _2082 = _1952 * _2074;
    int _2084 = _2082 + _1502;
    float _2086 = 1.0 / _2062;
    bool _2088 = _643 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _2090 = isnan(_643);
    bool _2092 = _2088 || _2090;
    bool _2094 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _2096 = _2092 || _2094;
    float _2098 = float(_2096);
    int _2100 = abs(_1994);
    int _2102 = _2080;
    if (_2068)
    {
        int _2104 = ~_2064;
        int _2106 = _2104 + 1;
        _2102 = _2106;
    }
    int _2108 = _2102;
    bool _2110 = uint(_2084) >= uint(_687);
    float _2112 = 1.0 / _2072;
    int _2114 = ~_2100;
    int _2116 = _2114 + 1;
    int _2118 = _2116 + 1;
    bool _2120 = !_2110;
    int _2122 = _2120 ? 0 : (-1);
    bool _2124 = _870 > 0.5;
    int _2126 = ~_1818;
    int _2128 = _2126 + _1926;
    int _2130 = _2128 + 1;
    float _2132 = -_245;
    int _2134 = _2124 ? as_type<int>(_2132) : as_type<int>(_245);
    bool _2136 = _884 != 1;
    int _2138 = _671 * _2130;
    int _2140 = _2138 + _1272;
    int _2142 = abs(_2050);
    int _2144 = ~_2074;
    int _2146 = _2144 + _2122;
    int _2148 = _2146 + 1;
    int _2150 = ~_2142;
    int _2152 = _2150 + 1;
    int _2154 = _2152 + 1;
    int _2156 = abs(_1914);
    int _2158 = _687 * _2148;
    int _2160 = _2158 + _1502;
    float _2162 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    if (!_2136)
    {
        _2044 = _878;
    }
    float _2164 = _2044;
    float _2166 = _2164;
    if (!_2136)
    {
        _1554 = _878;
    }
    float _2168 = _1554;
    float _2170 = _2168;
    if (!_2136)
    {
        _924 = _900;
    }
    float _2172 = _924;
    float _2174 = _2172;
    if (!_2136)
    {
        _1556 = _900;
    }
    float _2176 = _1556;
    float _2178 = _2176;
    if (_2136)
    {
        _2166 = _870;
    }
    float _2180 = _2166;
    if (_2136)
    {
        _2170 = _870;
    }
    float _2182 = _2170;
    if (_2136)
    {
        _2174 = _878;
    }
    float _2184 = _2174;
    float _2186 = _2180 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    if (_2136)
    {
        _2178 = _878;
    }
    float _2188 = _2178;
    bool _2190 = _886 != 2;
    float _2192 = -_1676;
    float _2194 = fma(_2186, 2.0, _2192);
    float _2196 = fma(_2188, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2038);
    float _2198 = -_123;
    float _2200 = fma(_2198, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2194);
    float _2202 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _2204 = !_1360;
    int _2206 = _2204 ? _2160 : (-1);
    float _2208 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _2210 = -_2202;
    float _2212 = fma(_1856, 2.0, _2210);
    float _2214 = _880 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    float _2216 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    if (_2190)
    {
        _1988 = _878;
    }
    float _2218 = _1988;
    float _2220 = fma(_870, (*spvDescriptorSet0.vp_c9)._m0[88].z, _2208);
    float _2222 = _2218;
    if (!_2190)
    {
        _2222 = _870;
    }
    float _2224 = _2222;
    float _2226 = fma(_2182, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2216);
    if (_2190)
    {
        _1558 = _870;
    }
    float _2228 = _1558;
    float _2230 = _2184 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _2232 = _2228;
    if (!_2190)
    {
        _2232 = _900;
    }
    float _2234 = _2232;
    float _2236 = _2224 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    int _2238 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2240 = _2238 != 0;
    float _2242 = fma(_2230, -2.0, _1590);
    float _2244 = -_1476;
    float _2246 = _2244 + 1.0;
    float _2248 = fma(_2236, -2.0, _1608);
    bool _2250 = !_2240;
    float _2252 = _2250 ? _245 : as_type<float>(_2134);
    float _2254 = _2234 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    bool _2256 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2258 = isnan(0.0);
    bool _2260 = _2256 || _2258;
    bool _2262 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2264 = _2260 || _2262;
    float _2266 = _870 * 2.0;
    float _2268 = -_1690;
    float _2270 = fma(_2254, 2.0, _2268);
    float _2272 = _2264 ? _2246 : 0.0;
    float _2274 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[87].z, _2220);
    bool _2276 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2278 = isnan(1.0);
    bool _2280 = _2276 || _2278;
    bool _2282 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2284 = _2280 || _2282;
    float _2286 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _2288 = 1.0 + _2286;
    float _2290 = floor(_2266);
    float _2292 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2226);
    float _2294 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    float _2296 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _2298 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _2300 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _2298;
    float _2302 = 1.0 / _2288;
    float _2304 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _2306 = -_2294;
    float _2308 = fma(_2214, 2.0, _2306);
    float _2310 = fma(_878, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2296);
    float _2312 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2196);
    float _2314 = fma(_870, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2304);
    float _2316 = -_123;
    float _2318 = fma(_2316, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2212);
    float _2320 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2310);
    float _2322 = -_123;
    float _2324 = fma(_2322, (*spvDescriptorSet0.vp_c9)._m0[91].x, _2308);
    float _2326 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2314);
    float _2328 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[87].w, _2058);
    float _2330 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2242);
    float _2332 = -_123;
    float _2334 = fma(_2332, (*spvDescriptorSet0.vp_c9)._m0[86].x, _2270);
    float _2336 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[86].y, _2248);
    float _2338 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2340 = _2338 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    if (_2284)
    {
        float _2342 = _2272 * _2302;
        _133 = _2342;
    }
    float _2344 = _133;
    bool _2346 = _2290 >= 0.0;
    bool _2348 = isnan(_2290);
    bool _2350 = _2346 || _2348;
    bool _2352 = isnan(0.0);
    bool _2354 = _2350 || _2352;
    float _2356 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _2358 = _2356 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2360 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2362 = _2360 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2364 = 1.0 / _2340;
    int _2366 = _2354 ? 0 : 1;
    float _2368 = _2358 * _2066;
    bool _2370 = _2290 > 0.0;
    float _2372 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2374 = _2372 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    int _2376 = ~_1948;
    int _2378 = _2376 + _2008;
    int _2380 = _2378 + 1;
    float _2382 = _2300 * _2112;
    float _2384 = in.m_48.x;
    float _2386 = in.m_48.y;
    float _2388 = in.m_48.z;
    int _2390 = ~_2366;
    int _2392 = _2390 + 1;
    int _2394 = _2392 + 1;
    float _2396 = 1.0 / _2362;
    int _2398 = _681 * _2380;
    int _2400 = _2398 + _1380;
    bool _2402 = !_1780;
    int _2404 = _2402 ? 0 : 1;
    float _2406 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2408 = _643 + _2406;
    int _2410 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16777216;
    bool _2412 = _2410 != 0;
    float _2414 = -_2326;
    float _2416 = _2414 + 1.0;
    bool _2418 = !_1350;
    int _2420 = _2418 ? _2400 : (-1);
    float _2422 = fma(_2382, _2408, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    int _2424 = _2394;
    if (!_2370)
    {
        int _2426 = ~_2366;
        int _2428 = _2426 + 1;
        _2424 = _2428;
    }
    int _2430 = _2424;
    float _2432 = 1.0 / _2374;
    bool _2434 = _1282 >= 0.0;
    bool _2436 = isnan(_1282);
    bool _2438 = _2434 || _2436;
    bool _2440 = isnan(0.0);
    bool _2442 = _2438 || _2440;
    float _2444 = -_2312;
    float _2446 = _2444 + 1.0;
    float _2448 = -_2292;
    float _2450 = _2448 + 1.0;
    int _2452 = _2442 ? 0 : 1;
    float _2454 = -_2274;
    float _2456 = _2454 + 1.0;
    bool _2458 = _1282 > 0.0;
    float _2460 = _900 * 2.0;
    int _2462 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2464 = _2462 != 0;
    float _2466 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2468 = _2466 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _2470 = _2386 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
    float _2472 = _2386 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
    float _2474 = _2386 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
    float _2476 = _2386 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
    float _2478 = floor(_2460);
    float _2480 = fma(_2384, (*spvDescriptorSet0.vp_c10)._m0[14].x, _2470);
    float _2482 = fma(_2384, (*spvDescriptorSet0.vp_c10)._m0[14].y, _2472);
    float _2484 = fma(_2384, (*spvDescriptorSet0.vp_c10)._m0[14].z, _2474);
    float _2486 = fma(_2384, (*spvDescriptorSet0.vp_c10)._m0[14].w, _2476);
    float _2488 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2490 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _2488;
    float _2492 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _2494 = _2492 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    int _2496 = ~_2452;
    int _2498 = _2496 + 1;
    int _2500 = _2498 + 1;
    float _2502 = 1.0 / _2468;
    int _2504 = _2500;
    if (!_2458)
    {
        int _2506 = ~_2452;
        int _2508 = _2506 + 1;
        _2504 = _2508;
    }
    int _2510 = _2504;
    float _2512 = _2490 * _2396;
    bool _2514 = !_2016;
    int _2516 = _2514 ? 0 : 1;
    float _2518 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2520 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _2518;
    bool _2522 = _1890 != 3;
    float _2524 = _2494 * _2086;
    float _2526 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _2528 = _2526 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    bool _2530 = !_1892;
    int _2532 = _2530 ? 0 : 1;
    float _2534 = _2520 * _2364;
    bool _2536 = _1778 != 3;
    float _2538 = _2528 * _2432;
    float _2540 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2542 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _2540;
    bool _2544 = _643 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _2546 = isnan(_643);
    bool _2548 = _2544 || _2546;
    bool _2550 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _2552 = _2548 || _2550;
    float _2554 = float(_2552);
    float _2556 = fma(_2388, (*spvDescriptorSet0.vp_c10)._m0[16].z, _2484);
    bool _2558 = !_2536;
    int _2560 = _2558 ? 0 : (-1);
    float _2562 = _2542 * _2502;
    bool _2564 = !_2522;
    int _2566 = _2564 ? 0 : (-1);
    float _2568 = -_2554;
    float _2570 = _2568 + 1.0;
    int _2572 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _2574 = _2572 != 0;
    int _2576 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _2578 = _2576 != 0;
    int _2580 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _2582 = _2580 != 0;
    float _2584 = fma(_2388, (*spvDescriptorSet0.vp_c10)._m0[16].x, _2480);
    bool _2586 = _2478 >= 0.0;
    bool _2588 = isnan(_2478);
    bool _2590 = _2586 || _2588;
    bool _2592 = isnan(0.0);
    bool _2594 = _2590 || _2592;
    float _2596 = fma(_2388, (*spvDescriptorSet0.vp_c10)._m0[16].y, _2482);
    bool _2598 = _643 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _2600 = isnan(_643);
    bool _2602 = _2598 || _2600;
    bool _2604 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _2606 = _2602 || _2604;
    float _2608 = float(_2606);
    float _2610 = _2556 + (*spvDescriptorSet0.vp_c10)._m0[17].z;
    int _2612 = _2594 ? 0 : 1;
    float _2614 = _2584 + (*spvDescriptorSet0.vp_c10)._m0[17].x;
    bool _2616 = _2478 > 0.0;
    float _2618 = _2608 * _2570;
    bool _2620 = _643 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _2622 = isnan(_643);
    bool _2624 = _2620 || _2622;
    bool _2626 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _2628 = _2624 || _2626;
    float _2630 = float(_2628);
    float _2632 = -_2608;
    float _2634 = _2632 + 1.0;
    bool _2636 = _643 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _2638 = isnan(_643);
    bool _2640 = _2636 || _2638;
    bool _2642 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _2644 = _2640 || _2642;
    float _2646 = float(_2644);
    float _2648 = fma(_2388, (*spvDescriptorSet0.vp_c10)._m0[16].w, _2486);
    float _2650 = _223 * _2610;
    float _2652 = _2630 * _2634;
    float _2654 = -_2630;
    float _2656 = _2654 + 1.0;
    float _2658 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2660 = _643 + _2658;
    float _2662 = -_2646;
    float _2664 = _2662 + 1.0;
    bool _2666 = _643 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _2668 = isnan(_643);
    bool _2670 = _2666 || _2668;
    bool _2672 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _2674 = _2670 || _2672;
    float _2676 = float(_2674);
    float _2678 = _2646 * _2656;
    float _2680 = fma(_2368, _2660, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _2682 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2684 = _643 + _2682;
    float _2686 = _2098 * _2664;
    float _2688 = -_2098;
    float _2690 = _2688 + 1.0;
    bool _2692 = _643 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _2694 = isnan(_643);
    bool _2696 = _2692 || _2694;
    bool _2698 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _2700 = _2696 || _2698;
    float _2702 = float(_2700);
    float _2704 = fma(_2512, _2684, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _2706 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2708 = _643 + _2706;
    float _2710 = _2676 * _2690;
    float _2712 = -_2676;
    float _2714 = _2712 + 1.0;
    float _2716 = -_2702;
    float _2718 = _2716 + 1.0;
    float _2720 = fma(_2524, _2708, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _2722 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2724 = _643 + _2722;
    float _2726 = _2702 * _2714;
    bool _2728 = _643 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _2730 = isnan(_643);
    bool _2732 = _2728 || _2730;
    bool _2734 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _2736 = _2732 || _2734;
    float _2738 = float(_2736);
    float _2740 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2742 = _643 + _2740;
    float _2744 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2746 = _643 + _2744;
    float _2748 = _197 * _2614;
    float _2750 = fma(_2534, _2724, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _2752 = _2738 * _2718;
    float _2754 = fma(_2562, _2746, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _2756 = _2596 + (*spvDescriptorSet0.vp_c10)._m0[17].y;
    float _2758 = -_2738;
    float _2760 = _2758 + 1.0;
    float _2762 = _2422 * _2752;
    float _2764 = fma(_2538, _2742, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _2766 = _207 * _2756;
    float _2768 = _878 + _870;
    float _2770 = fma(_2760, (*spvDescriptorSet0.vp_c9)._m0[159].x, _2762);
    float _2772 = _870 + _900;
    float _2774 = _2766 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2776 = _2766 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2778 = _2766 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2780 = fma(_2680, _2726, _2770);
    float _2782 = fma(_2748, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2774);
    float _2784 = _878 + _900;
    float _2786 = fma(_2748, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2778);
    float _2788 = _878 + (-0.5);
    int _2790 = _1882 >> 31;
    float _2792 = fma(_2704, _2710, _2780);
    float _2794 = fma(_2748, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2776);
    float _2796 = _870 + (-0.5);
    int _2798 = _2790 & 3;
    float _2800 = fma(_2720, _2686, _2792);
    float _2802 = fma(_2650, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2794);
    float _2804 = _2648 + (*spvDescriptorSet0.vp_c10)._m0[17].w;
    int _2806 = _1882 + _2798;
    float _2808 = fma(_2650, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2782);
    float _2810 = fma(_2650, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2786);
    float _2812 = fma(_2804, (*spvDescriptorSet0.vp_c8)._m0[25].w, _2802);
    float _2814 = _2768 + (-1.0);
    int _2816 = _2806 >> 2;
    float _2818 = _1012 + 0.5;
    float _2820 = fma(_2804, (*spvDescriptorSet0.vp_c8)._m0[24].w, _2808);
    float _2822 = fma(_2804, (*spvDescriptorSet0.vp_c8)._m0[26].w, _2810);
    int _2824 = _2816 << 4;
    int _2826 = _2824 + 656;
    float _2828 = fma(_2814, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _2830 = fma(_2750, _2678, _2800);
    float _2832 = _1772 + (-0.5);
    float _2834 = fma(_2818, (*spvDescriptorSet0.vp_c9)._m0[95].x, _2324);
    float _2836 = _2252 + 0.5;
    uint _2838 = uint(int(uint(_2826) >> uint(2)));
    uint _2840 = uint(int(uint(int(_2838)) >> uint(2)));
    int _2842 = int(_2838) & 3;
    float _2844 = (*spvDescriptorSet0.vp_c9)._m0[int(_2840)][_2842];
    int _2846 = int(_2838) + 1;
    uint _2848 = uint(int(uint(_2846) >> uint(2)));
    int _2850 = _2846 & 3;
    float _2852 = (*spvDescriptorSet0.vp_c9)._m0[int(_2848)][_2850];
    float _2854 = -_2832;
    float _2856 = -_1730;
    float _2858 = fma(_2854, (*spvDescriptorSet0.vp_c9)._m0[95].y, _2856);
    float _2860 = _1888 + (-0.5);
    float _2862 = fma(_2764, _2652, _2830);
    float _2864 = fma(_2836, (*spvDescriptorSet0.vp_c9)._m0[80].x, _2318);
    float _2866 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2868 = -_2860;
    float _2870 = -_1632;
    float _2872 = fma(_2868, (*spvDescriptorSet0.vp_c9)._m0[80].y, _2870);
    float _2874 = _2812 + (*spvDescriptorSet0.vp_c10)._m0[21].y;
    float _2876 = fma(_1744, _1772, _2858);
    float _2878 = -_1616;
    float _2880 = _2878 + 1.0;
    int _2882 = _2826 + 8;
    uint _2884 = uint(int(uint(_2882) >> uint(2)));
    uint _2886 = uint(int(uint(int(_2884)) >> uint(2)));
    int _2888 = int(_2884) & 3;
    float _2890 = (*spvDescriptorSet0.vp_c9)._m0[int(_2886)][_2888];
    int _2892 = int(_2884) + 1;
    uint _2894 = uint(int(uint(_2892) >> uint(2)));
    int _2896 = _2892 & 3;
    float _2898 = (*spvDescriptorSet0.vp_c9)._m0[int(_2894)][_2896];
    float _2900 = _2820 + (*spvDescriptorSet0.vp_c10)._m0[21].x;
    float _2902 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2904 = _2874 + _2902;
    float _2906 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2908 = fma(_2754, _2618, _2862);
    float _2910 = -_2880;
    float _2912 = fma(_2910, _1012, _2834);
    float _2914 = _2822 + (*spvDescriptorSet0.vp_c10)._m0[21].z;
    float _2916 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2918 = _2900 + _2916;
    float _2920 = _2904 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2922 = fma(_2554, (*spvDescriptorSet0.vp_c9)._m0[166].x, _2908);
    float _2924 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2926 = _2914 + _2924;
    out.m_70.x = _2912;
    out.m_70.y = _2876;
    float _2928 = fma(_2918, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2920);
    float _2930 = _2866 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2932 = _1128 + (-0.5);
    int _2934 = abs(_1978);
    float _2936 = fma(_2926, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2928);
    int _2938 = ~_2612;
    int _2940 = _2938 + 1;
    int _2942 = _2940 + 1;
    float _2944 = -_2930;
    float _2946 = -_2330;
    float _2948 = fma(_2944, _2932, _2946);
    float _2950 = _2906 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    int _2952 = _2942;
    if (!_2616)
    {
        int _2954 = ~_2612;
        int _2956 = _2954 + 1;
        _2952 = _2956;
    }
    int _2958 = _2952;
    float _2960 = -_2320;
    float _2962 = _2960 + 1.0;
    float _2964 = -_2416;
    float _2966 = fma(_2252, _2964, _2864);
    float _2968 = trunc((*spvDescriptorSet0.vp_c9)._m0[90].z);
    int _2970 = int(_2968);
    float _2972 = _1776 + 0.5;
    int _2974 = abs(_2532);
    float _2976 = fma(_1128, _2446, _2948);
    bool _2978 = _2936 >= 0.0;
    float _2980 = fma(_2950, _2972, _2200);
    int _2982 = ~_2934;
    int _2984 = _2982 + 1;
    int _2986 = _2984 + 1;
    float _2988 = fma(_1888, _2962, _2872);
    float _2990 = -_2450;
    float _2992 = fma(_1776, _2990, _2980);
    bool _2994 = !_2574;
    int _2996 = _2994 ? 0 : 1;
    out.m_72.x = _2922;
    float _2998 = float(_2958);
    float _3000 = float(_2430);
    int _3002 = _2986 * as_type<int>(_2852);
    int _3004 = ~_2974;
    int _3006 = _3004 + 1;
    int _3008 = _3006 + 1;
    out.m_74.x = _2966;
    out.m_74.y = _2988;
    out.m_74.z = _2992;
    out.m_74.w = _2976;
    float _3010 = as_type<float>(_2974);
    if (_2978)
    {
        _3010 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3012 = _3010;
    int _3014 = ~_2970;
    int _3016 = _3014 + 1;
    int _3018 = _3008 * as_type<int>(_2844);
    int _3020 = _3018 + _3002;
    int _3022 = abs(_2004);
    int _3024 = as_type<int>(_3012);
    if (_2978)
    {
        float _3026 = _3012 * 5.0;
        _3024 = as_type<int>(_3026);
    }
    int _3028 = _3024;
    int _3030 = abs(_2404);
    int _3032 = _2118 * as_type<int>(_2890);
    int _3034 = _3032 + _3020;
    int _3036 = abs(_2516);
    if (_2978)
    {
        out.m_55.x = 0.0;
    }
    bool _3038 = _671 == 0;
    int _3040 = abs(_2970);
    if (_2978)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _9560 = as_type<float>(_3028);
        out.gl_Position.z = _9560;
    }
    float _3042 = float(uint(_2970));
    int _3044 = abs(_2566);
    float _3046 = 1.0 / _3042;
    int _3048 = abs(_2996);
    float _3050 = float(uint(_3040));
    bool _3052 = !_3038;
    int _3054 = _3052 ? _2140 : (-1);
    float _3056 = float(_3048);
    int _3058 = ~_3044;
    int _3060 = _3058 + 1;
    int _3062 = _3060 + 1;
    float _3064 = 1.0 / _3050;
    int _3066 = _1748 >> 31;
    float _3068 = _3056 * _2998;
    int _3070 = ~_3022;
    int _3072 = _3070 + 1;
    int _3074 = _3072 + 1;
    int _3076 = _3062 * as_type<int>(_2898);
    int _3078 = _3076 + _3034;
    int _3080 = _2000 >> 31;
    int _3082 = _3066 & 3;
    int _3084 = _3078 * _3074;
    int _3086 = _3080 & 3;
    float _3088 = _2904 * _2904;
    int _3090 = _1748 + _3082;
    int _3092 = _2420 * _3022;
    int _3094 = _3092 + _3084;
    int _3096 = _2000 + _3086;
    float _3098 = fma(_2918, _2918, _3088);
    int _3100 = _3090 >> 2;
    float _3102 = in.m_76.x;
    float _3104 = in.m_76.y;
    float _3106 = in.m_76.z;
    int _3108 = as_type<int>(_3046) + (-2);
    float _3110 = fma(_2926, _2926, _3098);
    int _3112 = _3096 >> 2;
    int _3114 = _3100 << 4;
    int _3116 = _3114 + 368;
    float _3118 = float(uint(_3094));
    float _3120 = rsqrt(_3110);
    int _3122 = _3112 << 4;
    int _3124 = _3122 + 800;
    uint _3126 = uint(int(uint(_3116) >> uint(2)));
    uint _3128 = uint(int(uint(int(_3126)) >> uint(2)));
    int _3130 = int(_3126) & 3;
    float _3132 = (*spvDescriptorSet0.vp_c9)._m0[int(_3128)][_3130];
    int _3134 = int(_3126) + 1;
    uint _3136 = uint(int(uint(_3134) >> uint(2)));
    int _3138 = _3134 & 3;
    float _3140 = (*spvDescriptorSet0.vp_c9)._m0[int(_3136)][_3138];
    int _3142 = abs(_3094);
    float _3144 = as_type<float>(_3108) * _3118;
    int _3146 = as_type<int>(_3064) + (-2);
    float _3148 = float(uint(_3142));
    bool _3150 = !_2578;
    int _3152 = _3150 ? 0 : 1;
    uint _3154 = uint(int(uint(_3124) >> uint(2)));
    uint _3156 = uint(int(uint(int(_3154)) >> uint(2)));
    int _3158 = int(_3154) & 3;
    float _3160 = (*spvDescriptorSet0.vp_c9)._m0[int(_3156)][_3158];
    int _3162 = int(_3154) + 1;
    uint _3164 = uint(int(uint(_3162) >> uint(2)));
    int _3166 = _3162 & 3;
    float _3168 = (*spvDescriptorSet0.vp_c9)._m0[int(_3164)][_3166];
    float _3170 = trunc(_3144);
    float _3172 = precise::max(_3170, 0.0);
    uint _3174 = uint(_3172);
    float _3176 = as_type<float>(_3146) * _3148;
    int _3178 = abs(_3152);
    int _3180 = ~_3040;
    int _3182 = _3180 + 1;
    float _3184 = _2904 * _3120;
    float _3186 = float(_3178);
    int _3188 = _3116 + 8;
    uint _3190 = uint(int(uint(_3188) >> uint(2)));
    uint _3192 = uint(int(uint(int(_3190)) >> uint(2)));
    int _3194 = int(_3190) & 3;
    float _3196 = (*spvDescriptorSet0.vp_c9)._m0[int(_3192)][_3194];
    int _3198 = int(_3190) + 1;
    uint _3200 = uint(int(uint(_3198) >> uint(2)));
    int _3202 = _3198 & 3;
    float _3204 = (*spvDescriptorSet0.vp_c9)._m0[int(_3200)][_3202];
    float _3206 = trunc(_3176);
    float _3208 = precise::max(_3206, 0.0);
    uint _3210 = uint(_3208);
    float _3212 = _2918 * _3120;
    float _3214 = -_3184;
    float _3216 = fma(_3214, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2904);
    float _3218 = _3068 * (-2.0);
    float _3220 = _3186 * _3000;
    float _3222 = -_3212;
    float _3224 = fma(_3222, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2918);
    float _3226 = _3216 * _3216;
    int _3228 = _3016 * int(_3174);
    int _3230 = _3228 + _3094;
    float _3232 = fma(_2828, _3218, _2828);
    float _3234 = fma(_3224, _3224, _3226);
    float _3236 = fma(_3218, _3102, _3102);
    int _3238 = abs(_1840);
    int _3240 = _3124 + 8;
    uint _3242 = uint(int(uint(_3240) >> uint(2)));
    uint _3244 = uint(int(uint(int(_3242)) >> uint(2)));
    int _3246 = int(_3242) & 3;
    float _3248 = (*spvDescriptorSet0.vp_c9)._m0[int(_3244)][_3246];
    int _3250 = int(_3242) + 1;
    uint _3252 = uint(int(uint(_3250) >> uint(2)));
    int _3254 = _3250 & 3;
    float _3256 = (*spvDescriptorSet0.vp_c9)._m0[int(_3252)][_3254];
    float _3258 = float(uint(_3230));
    float _3260 = fma(_2796, (*spvDescriptorSet0.vp_c9)._m0[196].x, _3236);
    int _3262 = _3182 * int(_3210);
    int _3264 = _3262 + _3142;
    float _3266 = as_type<float>(_3108) * _3258;
    int _3268 = ~_3238;
    int _3270 = _3268 + 1;
    int _3272 = _3270 + 1;
    float _3274 = fma(_3232, _2344, _3260);
    float _3276 = float(uint(_3264));
    int _3278 = ~_3030;
    int _3280 = _3278 + 1;
    int _3282 = _3280 + 1;
    float _3284 = trunc(_3266);
    float _3286 = precise::max(_3284, 0.0);
    uint _3288 = uint(_3286);
    float _3290 = as_type<float>(_3146) * _3276;
    int _3292 = _3272 * as_type<int>(_3140);
    int _3294 = ~_3036;
    int _3296 = _3294 + 1;
    int _3298 = _3296 + 1;
    float _3300 = trunc(_3290);
    float _3302 = precise::max(_3300, 0.0);
    uint _3304 = uint(_3302);
    int _3306 = _3282 * as_type<int>(_3132);
    int _3308 = _3306 + _3292;
    int _3310 = ~_2970;
    int _3312 = _3310 + 1;
    int _3314 = _2154 * as_type<int>(_3168);
    int _3316 = ~_2156;
    int _3318 = _3316 + 1;
    int _3320 = _3318 + 1;
    int _3322 = int(_3174) + int(_3288);
    int _3324 = _3298 * as_type<int>(_3160);
    int _3326 = _3324 + _3314;
    int _3328 = abs(_2560);
    int _3330 = _3320 * as_type<int>(_3196);
    int _3332 = _3330 + _3308;
    int _3334 = ~_3040;
    int _3336 = _3334 + 1;
    int _3338 = _3312 * _3322;
    int _3340 = _3338 + _3094;
    int _3342 = int(_3210) + int(_3304);
    bool _3344 = !_2464;
    int _3346 = _3344 ? 0 : 1;
    int _3348 = ~_3328;
    int _3350 = _3348 + 1;
    int _3352 = _3350 + 1;
    int _3354 = _3336 * _3342;
    int _3356 = _3354 + _3142;
    bool _3358 = uint(_3340) >= uint(_2970);
    int _3360 = abs(_2108);
    int _3362 = _3352 * as_type<int>(_3204);
    int _3364 = _3362 + _3332;
    bool _3366 = !_3358;
    int _3368 = _3366 ? 0 : (-1);
    bool _3370 = _2014 != 3;
    bool _3372 = !_2412;
    int _3374 = _3372 ? 0 : 1;
    bool _3376 = uint(_3356) >= uint(_3040);
    int _3378 = ~_3360;
    int _3380 = _3378 + 1;
    int _3382 = _3380 + 1;
    int _3384 = _3094 ^ _2970;
    bool _3386 = !_3370;
    int _3388 = _3386 ? 0 : (-1);
    int _3390 = _3382 * as_type<int>(_3248);
    int _3392 = _3390 + _3326;
    int _3394 = ~_3322;
    int _3396 = _3394 + _3368;
    int _3398 = _3396 + 1;
    bool _3400 = !_3376;
    int _3402 = _3400 ? 0 : (-1);
    uint _3404 = uint(int(uint(_3384) >> uint(31)));
    int _3406 = abs(_3388);
    int _3408 = abs(_3346);
    bool _3410 = _2970 == 0;
    bool _3412 = _2970 == 0;
    int _3414 = _2970 * _3398;
    int _3416 = _3414 + _3094;
    int _3418 = ~_3402;
    int _3420 = _3342 + _3418;
    int _3422 = _3420 + 1;
    float _3424 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    int _3426 = ~int(_3404);
    int _3428 = _3426 + 1;
    int _3430 = abs(_3374);
    int _3432 = ~_3408;
    int _3434 = _3432 + 1;
    int _3436 = _3434 + 1;
    int _3438 = _3422 ^ _3428;
    int _3440 = ~_3406;
    int _3442 = _3440 + 1;
    int _3444 = _3442 + 1;
    int _3446 = _3364 * _3436;
    int _3448 = ~_3428;
    int _3450 = _3448 + _3438;
    int _3452 = _3450 + 1;
    int _3454 = ~_3430;
    int _3456 = _3454 + 1;
    int _3458 = _3456 + 1;
    int _3460 = _3444 * as_type<int>(_3256);
    int _3462 = _3460 + _3392;
    bool _3464 = !_3410;
    int _3466 = _3464 ? _3416 : (-1);
    int _3468 = _3054 * _3408;
    int _3470 = _3468 + _3446;
    bool _3472 = !_3412;
    int _3474 = _3472 ? _3452 : (-1);
    int _3476 = _3462 * _3458;
    float _3478 = float(_3466);
    float _3480 = _2162 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _3482 = float(_3474);
    float _3484 = _3424 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _3486 = _1164 + (-0.5);
    float _3488 = fma(_3480, _3478, _2334);
    float _3490 = _1168 + 0.5;
    float _3492 = -_2336;
    float _3494 = fma(_3484, _3482, _3492);
    int _3496 = _2206 * _3430;
    int _3498 = _3496 + _3476;
    float _3500 = -_2328;
    float _3502 = _3500 + 1.0;
    float _3504 = fma(_3480, _3490, _3488);
    float _3506 = -_3484;
    float _3508 = fma(_3506, _3486, _3494);
    float _3510 = _2926 * _3120;
    float _3512 = float(_3470);
    float _3514 = -_2456;
    float _3516 = fma(_1168, _3514, _3504);
    float _3518 = float(_3498);
    float _3520 = fma(_1164, _3502, _3508);
    float _3522 = -_3510;
    float _3524 = fma(_3522, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2926);
    out.m_78.x = _3512;
    float _3526 = fma(_3524, _3524, _3234);
    out.m_78.w = _3518;
    bool _3528 = !_2582;
    int _3530 = _3528 ? 0 : 1;
    out.m_80.x = _3516;
    out.m_80.y = _3520;
    float _3532 = _3106;
    if (_2978)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _3534 = -_3184;
    float _3536 = fma(_3534, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2874);
    float _3538 = -_3212;
    float _3540 = fma(_3538, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2900);
    float _3542 = -_3510;
    float _3544 = fma(_3542, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2914);
    int _3546 = abs(_3530);
    float _3548 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3550 = _3536 + _3548;
    float _3552 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3554 = _3540 + _3552;
    float _3556 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3558 = _3544 + _3556;
    float _3560 = _2784 + (-1.0);
    float _3562 = _3550 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _3564 = _3220 * (-2.0);
    float _3566 = float(_2510);
    float _3568 = fma(_3560, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _3570 = fma(_3554, (*spvDescriptorSet0.vp_c8)._m0[28].x, _3562);
    float _3572 = float(_3546);
    float _3574 = _2772 + (-1.0);
    float _3576 = _3274 * 0.15915493667125701904296875;
    float _3578 = fma(_3558, (*spvDescriptorSet0.vp_c8)._m0[28].z, _3570);
    float _3580 = fma(_3564, _3104, _3104);
    float _3582 = fma(_3568, _3564, _3568);
    float _3584 = _3572 * _3566;
    float _3586 = sqrt(_3526);
    bool _3588 = _3578 >= 0.0;
    float _3590 = fma(_2788, (*spvDescriptorSet0.vp_c9)._m0[196].y, _3580);
    float _3592 = _3584 * (-2.0);
    float _3594 = _900 + (-0.5);
    float _3596 = fma(_3582, _2344, _3590);
    float _3598 = fma(_3574, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _3600 = fma(_3592, _3106, _3106);
    float _3602 = _3596 * 0.15915493667125701904296875;
    float _3604 = _3576 * 6.283185482025146484375;
    float _3606 = sin(_3604);
    float _3608 = fma(_3598, _3592, _3598);
    float _3610 = fma(_3594, (*spvDescriptorSet0.vp_c9)._m0[196].z, _3600);
    float _3612 = _3536;
    if (_3588)
    {
        _3532 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3614 = _3532;
    int _3616 = as_type<int>(_3614);
    if (_3588)
    {
        out.m_55.x = 0.0;
    }
    float _3618 = fma(_3608, _2344, _3610);
    float _3620 = _3576 * 6.283185482025146484375;
    float _3622 = cos(_3620);
    if (_3588)
    {
        float _3624 = _3614 * 5.0;
        _3616 = as_type<int>(_3624);
    }
    int _3626 = _3616;
    float _3628 = _3618 * 0.15915493667125701904296875;
    if (_3588)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _10414 = as_type<float>(_3626);
        out.gl_Position.z = _10414;
    }
    float _3630 = _3602 * 6.283185482025146484375;
    float _3632 = sin(_3630);
    float _3634 = _3602 * 6.283185482025146484375;
    float _3636 = cos(_3634);
    if (_3588)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _3638 = _3628 * 6.283185482025146484375;
    float _3640 = cos(_3638);
    float _3642 = _3120 * _3586;
    float _3644 = _387 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _3646 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _251);
    float _3648 = _3622 * _3636;
    float _3650 = _3622 * _3632;
    float _3652 = _3642 * _3644;
    float _3654 = _3606 * _3636;
    float _3656 = _3628 * 6.283185482025146484375;
    float _3658 = sin(_3656);
    float _3660 = _251 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3662 = _3646 * _3652;
    float _3664 = _385 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _3666 = _3606 * _3632;
    float _3668 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _245);
    float _3670 = _3642 * _3664;
    float _3672 = _3622 * _3640;
    float _3674 = _3606 * _3640;
    float _3676 = _3636 * _3640;
    float _3678 = _3668 * _3670;
    float _3680 = _3672 * _3662;
    float _3682 = _3642 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _3684 = _3682 * 0.5;
    float _3686 = _3632 * _3640;
    float _3688 = fma(_3658, _3648, _3666);
    float _3690 = -_3654;
    float _3692 = fma(_3658, _3650, _3690);
    float _3694 = -_3662;
    float _3696 = _3658 * _3694;
    float _3698 = -_3650;
    float _3700 = fma(_3658, _3654, _3698);
    float _3702 = fma(_3688, _3678, _3680);
    float _3704 = _3674 * _3662;
    float _3706 = fma(_3676, _3678, _3696);
    float _3708 = fma(_3658, _3666, _3648);
    float _3710 = fma(_3692, _3684, _3702);
    float _3712 = fma(_3700, _3678, _3704);
    float _3714 = fma(_3686, _3684, _3706);
    float _3716 = _3692 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3718 = _3710 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3720 = _3710 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3722 = fma(_3708, _3684, _3712);
    float _3724 = _3710 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3726 = fma(_3714, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3718);
    float _3728 = fma(_3714, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3720);
    float _3730 = _3688 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3732 = fma(_3714, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3724);
    float _3734 = fma(_3722, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3726);
    float _3736 = fma(_3722, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3728);
    float _3738 = fma(_3660, _3660, 1.0);
    float _3740 = fma(_3676, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3730);
    float _3742 = _3734 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _3744 = _3736 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _3746 = fma(_3686, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3716);
    float _3748 = _2900 + _3742;
    float _3750 = _2914 + _3744;
    float _3752 = _3688 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3754 = _3688 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3756 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _3758 = _3748 + _3756;
    float _3760 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _3762 = _3750 + _3760;
    float _3764 = fma(_3676, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3752);
    float _3766 = _3672 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3768 = _3758 * _3758;
    float _3770 = _3762 * _3762;
    float _3772 = fma(_3676, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3754);
    float _3774 = -_3658;
    float _3776 = fma(_3774, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3766);
    float _3778 = fma(_3722, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3732);
    float _3780 = _3768 + _3770;
    float _3782 = rsqrt(_3738);
    float _3784 = _3672 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3786 = _3778 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _3788 = _3672 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3790 = _3692 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3792 = -_3658;
    float _3794 = fma(_3792, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3784);
    float _3796 = _3692 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3798 = _2874 + _3786;
    float _3800 = sqrt(_3780);
    float _3802 = -_3658;
    float _3804 = fma(_3802, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3788);
    float _3806 = fma(_3686, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3796);
    float _3808 = fma(_3686, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3790);
    bool _3810 = _3800 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3812 = _3686;
    float _3814 = _3778;
    float _3816 = _3788;
    float _3818 = _3796;
    float _3820 = _3754;
    if (!_3810)
    {
        _3812 = _3770;
    }
    float _3822 = _3812;
    float _3824 = _3822;
    if (!_3810)
    {
        _3814 = _3768;
    }
    float _3826 = _3814;
    float _3828 = _3826;
    if (!_3810)
    {
        _3816 = _3748;
    }
    float _3830 = _3816;
    float _3832 = _3830;
    if (!_3810)
    {
        _3818 = _3750;
    }
    float _3834 = _3818;
    float _3836 = _3834;
    if (!_3810)
    {
        _3820 = _3798;
    }
    float _3838 = _3820;
    bool _3840 = !_3810;
    float _3842 = _3838;
    if (!_3840)
    {
        float _3844 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3846 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _3848 = _3800 + _3846;
        float _3850 = rsqrt(_3780);
        float _3852 = _3848 * _3844;
        float _3854 = _3798 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3856 = _3852 * 0.15915493667125701904296875;
        float _3858 = _3856 * 6.283185482025146484375;
        float _3860 = sin(_3858);
        float _3862 = _3856 * 6.283185482025146484375;
        float _3864 = cos(_3862);
        float _3866 = fma(_3860, _3854, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _3868 = _3850 * _3866;
        float _3870 = _3864 + (-1.0);
        float _3872 = fma(_3758, _3868, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _3874 = fma(_3762, _3868, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _3876 = _3870 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3878 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _3880 = _3872 + _3878;
        float _3882 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _3884 = _3874 + _3882;
        float _3886 = fma(_3798, _3864, _3876);
        float _3888 = _3880 * _3880;
        float _3890 = _3884 * _3884;
        _3842 = _3886;
        _3828 = _3888;
        _3824 = _3890;
        _3832 = _3872;
        _3836 = _3874;
    }
    float _3892 = _3842;
    float _3894 = _3828;
    float _3896 = _3824;
    float _3898 = _3832;
    float _3900 = _3836;
    float _3902 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _3904 = _3892 + _3902;
    float _3906 = fma(_3674, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3776);
    float _3908 = fma(_3674, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3794);
    float _3910 = fma(_3674, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3804);
    float _3912 = fma(_3904, _3904, _3894);
    float _3914 = fma(_3708, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3806);
    float _3916 = fma(_3708, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3808);
    float _3918 = fma(_3708, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3746);
    float _3920 = _3912 + _3896;
    float _3922 = _3660 * _3782;
    float _3924 = fma(_3700, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3764);
    float _3926 = fma(_3700, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3772);
    float _3928 = _245 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3930 = _3660 * _3906;
    float _3932 = _3660 * _3908;
    float _3934 = fma(_3700, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3740);
    float _3936 = _3660 * _3910;
    float _3938 = -_3914;
    float _3940 = _3922 * _3938;
    float _3942 = -_3916;
    float _3944 = _3922 * _3942;
    float _3946 = -_3918;
    float _3948 = _3922 * _3946;
    float _3950 = sqrt(_3920);
    float _3952 = fma(_3928, _3924, _3930);
    float _3954 = fma(_3928, _3926, _3932);
    float _3956 = fma(_3928, _3934, _3936);
    float _3958 = fma(_3782, _3906, _3940);
    float _3960 = fma(_3782, _3908, _3944);
    float _3962 = fma(_3782, _3910, _3948);
    float _3964 = _3914 + _3952;
    float _3966 = _3916 + _3954;
    float _3968 = _3918 + _3956;
    out.m_82.x = _3924;
    out.m_82.y = _3926;
    out.m_82.z = _3934;
    out.m_84.x = _3958;
    out.m_84.y = _3960;
    out.m_84.z = _3962;
    bool _3970 = _3950 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _3972 = isnan(_3950);
    bool _3974 = _3970 || _3972;
    bool _3976 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _3978 = _3974 || _3976;
    out.m_86.x = _3964;
    out.m_86.y = _3966;
    out.m_86.z = _3968;
    float _3980 = _3954;
    if (!_3978)
    {
        _3980 = 1.0;
    }
    float _3982 = _3980;
    bool _3984 = !_3978;
    float _3986 = _3982;
    if (!_3984)
    {
        bool _3988 = _3950 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _3990 = isnan(_3950);
        bool _3992 = _3988 || _3990;
        bool _3994 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _3996 = _3992 || _3994;
        if (!_3996)
        {
            float _3998 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _4000 = _3950 + _3998;
            float _4002 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _4004 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _4002;
            float _4006 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _4008 = _4006 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _4010 = 1.0 / _4004;
            float _4012 = _4000 * _4010;
            float _4014 = fma(_4012, _4008, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _3986 = _4014;
            _4016 = true;
        }
        else
        {
            bool _4018 = _3950 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _4020 = isnan(_3950);
            bool _4022 = _4018 || _4020;
            bool _4024 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _4026 = _4022 || _4024;
            if (!_4026)
            {
                float _4028 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _4030 = _3950 + _4028;
                float _4032 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _4034 = _4032 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _4036 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _4038 = _4036 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _4040 = 1.0 / _4034;
                float _4042 = _4030 * _4040;
                float _4044 = fma(_4042, _4038, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _3986 = _4044;
                _4016 = true;
            }
            else
            {
                _3986 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _4016 = false;
    float _4046 = _3986;
    float _4048 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _4050 = _3892 + _4048;
    float _4052 = _3536 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _4054 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _4056 = _3898 + _4054;
    float _4058 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _4060 = _3900 + _4058;
    float _4062 = fma(_4050, _4046, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _4064 = fma(_3540, (*spvDescriptorSet0.vp_c8)._m0[11].x, _4052);
    float _4066 = fma(_4056, _4046, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _4068 = fma(_4060, _4046, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _4070 = -_2874;
    float _4072 = _4070 + _4062;
    float _4074 = fma(_3544, (*spvDescriptorSet0.vp_c8)._m0[11].z, _4064);
    float _4076 = -_2900;
    float _4078 = _4076 + _4066;
    float _4080 = _3536 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _4082 = _4072 * _4072;
    float _4084 = _4074 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _4086 = -_2914;
    float _4088 = _4086 + _4068;
    float _4090 = fma(_3540, (*spvDescriptorSet0.vp_c8)._m0[10].x, _4080);
    float _4092 = fma(_4078, _4078, _4082);
    float _4094 = 1.0 / _4084;
    float _4096 = fma(_3544, (*spvDescriptorSet0.vp_c8)._m0[10].z, _4090);
    float _4098 = fma(_4088, _4088, _4092);
    float _4100 = _4096 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _4102 = sqrt(_4098);
    float _4104 = _4100 + _4084;
    bool _4106 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _4108 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _4110 = _4106 || _4108;
    bool _4112 = isnan(0.5);
    bool _4114 = _4110 || _4112;
    float _4116 = _4104 * _4094;
    float _4118 = _4116 * 0.5;
    float _4120 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _4122 = fma(_4118, (*spvDescriptorSet0.vp_c8)._m0[30].w, _4120);
    bool _4124 = _4102 > 0.0;
    float _4126 = 1.0 / _4122;
    bool _4128 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _4130 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _4132 = _4128 || _4130;
    bool _4134 = isnan(0.5);
    bool _4136 = _4132 || _4134;
    float _4138 = _4118;
    float _4140 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    float _4142 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _4144 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    float _4146 = _4078;
    if (!_4124)
    {
        _4138 = _4066;
    }
    float _4148 = _4138;
    float _4150 = _4148;
    float _4152 = _4148;
    if (!_4124)
    {
        _4140 = _4062;
    }
    float _4154 = _4140;
    float _4156 = _4154;
    if (!_4124)
    {
        _4142 = _4068;
    }
    float _4158 = _4142;
    bool _4160 = !_4124;
    float _4162 = _4158;
    float _4164 = _4126;
    if (!_4160)
    {
        float _4166 = _275 * _275;
        float _4168 = fma(_273, _273, _4166);
        float _4170 = fma(_277, _277, _4168);
        float _4172 = rsqrt(_4098);
        float _4174 = sqrt(_4170);
        float _4176 = _4078 * _4172;
        float _4178 = _4072 * _4172;
        float _4180 = _4088 * _4172;
        bool _4182 = _4174 > 0.0;
        float _4184 = _4172;
        float _4186 = _4174;
        _4146 = _4176;
        if (!_4182)
        {
            _4150 = _4066;
        }
        float _4188 = _4150;
        _4152 = _4188;
        if (!_4182)
        {
            _4184 = _4062;
        }
        float _4190 = _4184;
        _4156 = _4190;
        if (!_4182)
        {
            _4186 = _4068;
        }
        float _4192 = _4186;
        bool _4194 = !_4182;
        _4162 = _4192;
        if (!_4194)
        {
            float _4196 = rsqrt(_4170);
            float _4198 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _4200 = _275 * _4196;
            float _4202 = _273 * _4196;
            float _4204 = _277 * _4196;
            float _4206 = _4178 * _4200;
            float _4208 = fma(_4176, _4202, _4206);
            float _4210 = _4198 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _4212 = fma(_4180, _4204, _4208);
            float _4214 = _4212 * _4210;
            float _4216 = fma(_273, _4214, _4066);
            float _4218 = fma(_275, _4214, _4062);
            float _4220 = fma(_277, _4214, _4068);
            _4152 = _4216;
            _4156 = _4218;
            _4162 = _4220;
            _4144 = _4214;
        }
    }
    float _4222 = _4152;
    float _4224 = _4156;
    float _4226 = _4162;
    float _4228 = _4144;
    float _4230 = _4146;
    float _4232 = -_3212;
    float _4234 = fma(_4232, (*spvDescriptorSet0.vp_c9)._m0[18].w, _4222);
    float _4236 = -_3184;
    float _4238 = fma(_4236, (*spvDescriptorSet0.vp_c9)._m0[18].w, _4224);
    float _4240 = -_3510;
    float _4242 = fma(_4240, (*spvDescriptorSet0.vp_c9)._m0[18].w, _4226);
    float _4244 = _4238;
    float _4246 = _4234;
    float _4248 = _4242;
    float _4250 = _4228;
    float _4252 = _4230;
    if (_4114)
    {
        _283 = 1.0;
    }
    float _4254 = _283;
    float _4256 = _4254;
    if (!_4136)
    {
        float _4258 = _3550 * _3550;
        float _4260 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _4262 = -_2914;
        float _4264 = _4262 + _4226;
        float _4266 = -_2900;
        float _4268 = _4266 + _4222;
        float _4270 = fma(_3554, _3554, _4258);
        float _4272 = fma(_3558, _3558, _4270);
        float _4274 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _4276 = sqrt(_4272);
        float _4278 = 1.0 / _3642;
        float _4280 = _4274 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _4282 = precise::min(_4276, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _4284 = _4282 * _4260;
        float _4286 = _4284 * _4278;
        float _4288 = -_2874;
        float _4290 = _4288 + _4224;
        float _4292 = _4280 * _4286;
        float _4294 = _4264 * _4286;
        float _4296 = fma(_4290, _4292, _3536);
        float _4298 = fma(_4268, _4292, _3540);
        float _4300 = fma(_4280, _4294, _3544);
        _4244 = _4296;
        _4246 = _4298;
        _4248 = _4300;
    }
    float _4302 = _4244;
    float _4304 = _4246;
    float _4306 = _4248;
    if (_4114)
    {
        _3612 = 1.0;
    }
    float _4308 = _3612;
    float _4310 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _4312 = _4126 * _4310;
    float _4314 = _4308;
    if (!_4114)
    {
        float _4316 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _4318 = _4316 * 0.15915493667125701904296875;
        float _4320 = _4318 * 6.283185482025146484375;
        float _4322 = cos(_4320);
        float _4324 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _4326 = _4324 * 0.15915493667125701904296875;
        float _4328 = _4318 * 6.283185482025146484375;
        float _4330 = sin(_4328);
        float _4332 = 1.0 / _4322;
        float _4334 = _4326 * 6.283185482025146484375;
        float _4336 = cos(_4334);
        float _4338 = _4330 * _4332;
        float _4340 = _4326 * 6.283185482025146484375;
        float _4342 = sin(_4340);
        float _4344 = _4336 * _4338;
        float _4346 = 1.0 / _4344;
        float _4348 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _4350 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _4348;
        float _4352 = 1.0 / _4350;
        float _4354 = _4342 * _4346;
        float _4356 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _4358 = fma(_4312, _4354, _4356);
        float _4360 = _4358 * _4352;
        float _4362 = precise::clamp(_4360, 0.0, 1.0);
        _285 = _4326;
        _4256 = _4362;
    }
    float _4364 = _285;
    float _4366 = _4256;
    float _4368 = _4364;
    if (!_4114)
    {
        float _4370 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _4372 = _4370 * 0.15915493667125701904296875;
        float _4374 = _4372 * 6.283185482025146484375;
        float _4376 = cos(_4374);
        float _4378 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _4380 = _4378 * 0.15915493667125701904296875;
        float _4382 = _4372 * 6.283185482025146484375;
        float _4384 = sin(_4382);
        float _4386 = 1.0 / _4376;
        float _4388 = _4380 * 6.283185482025146484375;
        float _4390 = cos(_4388);
        float _4392 = _4384 * _4386;
        float _4394 = _4380 * 6.283185482025146484375;
        float _4396 = sin(_4394);
        float _4398 = _4390 * _4392;
        float _4400 = 1.0 / _4398;
        float _4402 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _4404 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _4402;
        float _4406 = 1.0 / _4404;
        float _4408 = _4396 * _4400;
        float _4410 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _4412 = fma(_4312, _4408, _4410);
        float _4414 = _4412 * _4406;
        float _4416 = precise::clamp(_4414, 0.0, 1.0);
        float _4418 = -_4416;
        float _4420 = _4418 + 1.0;
        _4368 = _4400;
        _4314 = _4420;
    }
    float _4422 = _4368;
    float _4424 = _4314;
    float _4426 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _4428 = _4302 + _4426;
    float _4430 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _4432 = _4304 + _4430;
    float _4434 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _4436 = _4306 + _4434;
    float _4438 = _4428 * _4428;
    float _4440 = fma(_4432, _4432, _4438);
    float _4442 = fma(_4436, _4436, _4440);
    float _4444 = rsqrt(_4442);
    float _4446 = sqrt(_4442);
    float _4448 = _4444 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _4450 = _4432 * _4448;
    float _4452 = _4436 * _4448;
    float _4454 = _4450 * _4450;
    float _4456 = _4452 * _4452;
    float _4458 = _4454 + _4456;
    float _4460 = sqrt(_4458);
    bool _4462 = _4460 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4464 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4466 = _4460 + _4464;
    float _4468 = _4422;
    float _4470 = _4466;
    float _4472 = _4428;
    float _4474 = _4450;
    if (_4462)
    {
        float _4476 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4468 = _4476;
    }
    float _4478 = _4468;
    if (_4462)
    {
        float _4480 = rsqrt(_4458);
        _4164 = _4480;
    }
    float _4482 = _4164;
    float _4484 = _4482;
    if (_4462)
    {
        float _4486 = _4466 * _4478;
        _4470 = _4486;
    }
    float _4488 = _4470;
    if (_4462)
    {
        float _4490 = _4488 * 0.15915493667125701904296875;
        _4250 = _4490;
    }
    float _4492 = _4250;
    float _4494 = _4436;
    if (_4462)
    {
        float _4496 = _4492 * 6.283185482025146484375;
        float _4498 = sin(_4496);
        _4494 = _4498;
    }
    float _4500 = _4494;
    float _4502 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _4504 = precise::max(0.0, _4502);
    float _4506 = _4478;
    float _4508 = _4504;
    if (_4462)
    {
        float _4510 = _4492 * 6.283185482025146484375;
        float _4512 = cos(_4510);
        _4506 = _4512;
    }
    float _4514 = _4506;
    float _4516 = -_4448;
    float _4518 = -_4504;
    float _4520 = fma(_4428, _4516, _4518);
    if (_4462)
    {
        float _4522 = _4520 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4472 = _4522;
    }
    float _4524 = _4472;
    float _4526 = _4302 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _4528 = _4524;
    float _4530 = _4500;
    if (_4462)
    {
        float _4532 = fma(_4500, _4524, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _4528 = _4532;
    }
    float _4534 = _4528;
    float _4536 = _4534;
    if (!_4462)
    {
        _4530 = _4454;
    }
    float _4538 = _4530;
    float _4540 = fma(_4304, (*spvDescriptorSet0.vp_c8)._m0[2].x, _4526);
    float _4542 = _4538;
    float _4544 = _4514;
    if (_4462)
    {
        float _4546 = _4514 + (-1.0);
        _4508 = _4546;
    }
    float _4548 = _4508;
    float _4550 = _4548;
    if (_4462)
    {
        float _4552 = _4482 * _4534;
        _4252 = _4552;
    }
    float _4554 = _4252;
    if (!_4462)
    {
        _4536 = _4520;
    }
    float _4556 = _4536;
    float _4558 = fma(_4306, (*spvDescriptorSet0.vp_c8)._m0[2].z, _4540);
    float _4560 = _4556;
    if (_4462)
    {
        float _4562 = _4548 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4484 = _4562;
    }
    float _4564 = _4484;
    if (_4462)
    {
        float _4566 = _4450 * _4554;
        _4474 = _4566;
    }
    float _4568 = _4474;
    if (!_4462)
    {
        _4550 = _4452;
    }
    float _4570 = _4550;
    float _4572 = _4570;
    if (_4462)
    {
        float _4574 = _4452 * _4554;
        _4572 = _4574;
    }
    float _4576 = _4572;
    if (_4462)
    {
        float _4578 = fma(_4520, _4514, _4564);
        _4560 = _4578;
    }
    float _4580 = _4560;
    if (_4462)
    {
        float _4582 = _4568 * _4568;
        _4542 = _4582;
    }
    float _4584 = _4542;
    if (!_4462)
    {
        _4544 = _4456;
    }
    float _4586 = _4544;
    float _4588 = _4586;
    if (_4462)
    {
        float _4590 = _4576 * _4576;
        _4588 = _4590;
    }
    float _4592 = _4588;
    float _4594 = _4302 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _4596 = fma(_4580, _4580, _4584);
    float _4598 = _4558 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _4600 = _4596 + _4592;
    float _4602 = _4302 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _4604 = fma(_4304, (*spvDescriptorSet0.vp_c8)._m0[3].x, _4594);
    float _4606 = fma(_3540, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _4608 = rsqrt(_4600);
    float _4610 = _4302 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _4612 = fma(_4304, (*spvDescriptorSet0.vp_c8)._m0[1].x, _4602);
    float _4614 = fma(_4306, (*spvDescriptorSet0.vp_c8)._m0[3].z, _4604);
    float _4616 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _4618 = fma(_4446, (*spvDescriptorSet0.vp_c15)._m0[23].w, _4616);
    float _4620 = precise::clamp(_4618, 0.0, 1.0);
    float _4622 = fma(_4304, (*spvDescriptorSet0.vp_c8)._m0[0].x, _4610);
    float _4624 = fma(_4306, (*spvDescriptorSet0.vp_c8)._m0[1].z, _4612);
    float _4626 = -_4620;
    float _4628 = _4626 + 1.0;
    float _4630 = fma(_3544, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _4632 = _4614 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _4634 = fma(_4306, (*spvDescriptorSet0.vp_c8)._m0[0].z, _4622);
    float _4636 = _4624 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _4638 = floor(_4606);
    float _4640 = _4634 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _4642 = _4608 * _4568;
    float _4644 = _4608 * _4580;
    float _4646 = _4636 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _4648 = _4608 * _4576;
    float _4650 = _4642 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _4652 = abs(_4628);
    float _4654 = log2(_4652);
    float _4656 = fma(_4640, (*spvDescriptorSet0.vp_c8)._m0[7].x, _4646);
    float _4658 = -_4650;
    float _4660 = fma(_4644, (*spvDescriptorSet0.vp_c15)._m0[21].y, _4658);
    float _4662 = fma(_4598, (*spvDescriptorSet0.vp_c8)._m0[7].z, _4656);
    float _4664 = -_4648;
    float _4666 = fma(_4664, (*spvDescriptorSet0.vp_c15)._m0[21].z, _4660);
    float _4668 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _4670 = _4598 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _4672 = floor(_4630);
    float _4674 = fma(_4666, -0.5, 0.5);
    float _4676 = fma(_4632, (*spvDescriptorSet0.vp_c8)._m0[7].w, _4662);
    float _4678 = -_4670;
    float _4680 = fma(_4678, _4668, 1.0);
    float _4682 = fma(_4666, 0.5, 0.5);
    float _4684 = -_4638;
    float _4686 = _4606 + _4684;
    float _4688 = _4654 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _4690 = _4636 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _4692 = sqrt(_4674);
    float _4694 = fma(_4682, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _4696 = fma(_4640, (*spvDescriptorSet0.vp_c8)._m0[4].x, _4690);
    float _4698 = fma(_4682, _4694, -0.212114393711090087890625);
    float _4700 = fma(_4598, (*spvDescriptorSet0.vp_c8)._m0[4].z, _4696);
    float _4702 = exp2(_4688);
    float _4704 = -_4672;
    float _4706 = _4630 + _4704;
    float _4708 = fma(_4682, _4698, 1.570728778839111328125);
    float _4710 = _4644 + 1.0;
    float _4712 = fma(_4632, (*spvDescriptorSet0.vp_c8)._m0[4].w, _4700);
    float _4714 = 1.0 / _4676;
    float _4716 = _4636 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _4718 = _4692 * 0.636619746685028076171875;
    float _4720 = fma(_4640, (*spvDescriptorSet0.vp_c8)._m0[5].x, _4716);
    float _4722 = -_4708;
    float _4724 = fma(_4718, _4722, 1.0);
    float _4726 = log2(_4680);
    float _4728 = fma(_4598, (*spvDescriptorSet0.vp_c8)._m0[5].z, _4720);
    float _4730 = -_4644;
    float _4732 = fma(_4702, _4710, _4730);
    float2 _12218 = float2(_4686, _4706);
    float _4734 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_12218, float2(0.0), isnan(_12218)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_12218, float2(0.0), isnan(_12218)), level(0.0)).x;
    float _4736 = fma(_4732, 0.5, 0.5);
    float _4738 = _4712 * _4714;
    float _4740 = fma(_4632, (*spvDescriptorSet0.vp_c8)._m0[5].w, _4728);
    float _4742 = fma(_4738, 0.5, 0.5);
    float _4744 = _4740 * _4714;
    float _4746 = _4726 * 0.693147182464599609375;
    float _4748 = fma(_4744, -0.5, 0.5);
    float _4750 = _4746 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float3 _12253 = float3(_4742, _4748, _4750);
    float _4752 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_12253, float3(0.0), isnan(_12253)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_12253, float3(0.0), isnan(_12253)), level(0.0)).x;
    float3 _12264 = float3(_4742, _4748, _4750);
    float4 _4755 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_12264, float3(0.0), isnan(_12264)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_12264, float3(0.0), isnan(_12264)), level(0.0)).xyzw;
    float _4757 = _4755.x;
    float _4759 = _4755.y;
    float _4761 = _4755.z;
    float _4763 = _4755.w;
    float2 _12280 = float2(_4724, _4736);
    float3 _4767 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_12280, float2(0.0), isnan(_12280)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_12280, float2(0.0), isnan(_12280)), level(0.0)).xyz;
    float _4769 = _4767.x;
    float _4771 = _4767.y;
    float _4773 = _4767.z;
    float _4775 = abs(_4312);
    float _4777 = log2(_4775);
    bool _4779 = _4446 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _4781 = isnan(_4446);
    bool _4783 = _4779 || _4781;
    bool _4785 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _4787 = _4783 || _4785;
    bool _4789 = _4312 <= 8000.0;
    bool _4791 = isnan(_4312);
    bool _4793 = _4789 || _4791;
    bool _4795 = isnan(8000.0);
    bool _4797 = _4793 || _4795;
    float _4799 = float(_4797);
    float _4801 = _4777 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _4803 = exp2(_4801);
    float _4805 = fma(_4803, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _4807 = precise::clamp(_4805, 0.0, 1.0);
    float _4809 = fma(_4807, -2.0, 3.0);
    float _4811 = _4807 * _4807;
    float _4813 = _4636 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _4815 = _4811 * _4809;
    float _4817 = fma(_4640, (*spvDescriptorSet0.vp_c8)._m0[6].x, _4813);
    float _4819 = _4654 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _4821 = in.m_88.x;
    float _4823 = -_4815;
    float _4825 = _4823 + 1.0;
    float _4827 = fma(_4598, (*spvDescriptorSet0.vp_c8)._m0[6].z, _4817);
    float _4829 = exp2(_4819);
    float _4831 = fma(_4825, (*spvDescriptorSet0.vp_c15)._m0[654].w, _4815);
    float _4833 = fma(_4632, (*spvDescriptorSet0.vp_c8)._m0[6].w, _4827);
    float _4835 = _4676 * 0.5;
    float _4837 = _4712 + _4676;
    float _4839 = _4799 * _4831;
    float _4841 = _4833 + _4676;
    float _4843 = fma(_4740, -0.5, _4835);
    float _4845 = _4839 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _4847 = _4837 * 0.5;
    out.gl_Position.x = _4712;
    out.gl_Position.y = _4740;
    out.gl_Position.z = _4833;
    out.gl_Position.w = _4676;
    float _4849 = _4841 * 0.5;
    float _4851 = -_4829;
    float _4853 = _4851 + 1.0;
    out.m_90.x = _4847;
    out.m_90.y = _4843;
    out.m_90.z = _4849;
    out.m_90.w = _4676;
    float _4855 = _4853 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _4857 = -_4855;
    float _4859 = _4857 + 1.0;
    float _4861 = _4833;
    float _4863 = _4740;
    if (!_4787)
    {
        _4861 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _4865 = _4861;
    float _4867 = _4865;
    float _4869 = _4865;
    if (!_4787)
    {
        _4863 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _4871 = _4863;
    float _4873 = -_4734;
    float _4875 = _4873 + 1.0;
    float _4877 = _4875 * _4845;
    float _4879 = precise::clamp(_4877, 0.0, 1.0);
    float _4881 = -_4879;
    float _4883 = fma(_4881, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _4885 = _4883 * _4821;
    float _4887 = _4885 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _4889 = _4855 * _4752;
    out.m_92.x = _4887;
    float _4891 = _4763 * _4889;
    float _4893 = _4773 * _4889;
    float _4895 = fma(_4769, _4891, _4757);
    float _4897 = fma(_4771, _4891, _4759);
    float _4899 = _4763 * _4859;
    float _4901 = fma(_4763, _4893, _4761);
    float _4903 = _4366 * _4424;
    out.m_94.x = _4895;
    out.m_94.y = _4897;
    out.m_94.z = _4901;
    out.m_94.w = _4899;
    float _4905 = _4903 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _4907 = _4903;
    float _4909 = _4871;
    float _4911 = _4871;
    if (!_4787)
    {
        _4907 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _4913 = _4907;
    bool _4915 = !_4787;
    float _4917 = _4913;
    float _4919 = _4913;
    if (!_4915)
    {
        bool _4921 = _4446 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _4923 = isnan(_4446);
        bool _4925 = _4921 || _4923;
        bool _4927 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _4929 = _4925 || _4927;
        if (!_4929)
        {
            float _4931 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4933 = _4446 + _4931;
            float _4935 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4937 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _4935;
            float _4939 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _4941 = _4939 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _4943 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _4945 = _4943 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _4947 = 1.0 / _4937;
            float _4949 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _4951 = _4949 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _4953 = _4933 * _4947;
            float _4955 = precise::clamp(_4953, 0.0, 1.0);
            float _4957 = fma(_4955, _4941, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _4959 = fma(_4955, _4945, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _4961 = fma(_4955, _4951, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            _4911 = _4959;
            _4869 = _4957;
            _4919 = _4961;
            _4963 = true;
        }
        else
        {
            bool _4965 = _4446 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _4967 = isnan(_4446);
            bool _4969 = _4965 || _4967;
            bool _4971 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _4973 = _4969 || _4971;
            if (!_4973)
            {
                _4867 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _4975 = _4867;
            _4869 = _4975;
            if (!_4973)
            {
                _4909 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _4977 = _4909;
            _4911 = _4977;
            if (!_4973)
            {
                _4917 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _4979 = _4917;
            bool _4981 = !_4973;
            _4919 = _4979;
            if (!_4981)
            {
                bool _4983 = _4446 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _4985 = isnan(_4446);
                bool _4987 = _4983 || _4985;
                bool _4989 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _4991 = _4987 || _4989;
                if (!_4991)
                {
                    float _4993 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4995 = _4446 + _4993;
                    float _4997 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4999 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _4997;
                    float _5001 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _5003 = _5001 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _5005 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _5007 = _5005 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _5009 = 1.0 / _4999;
                    float _5011 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _5013 = _5011 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _5015 = _4995 * _5009;
                    float _5017 = precise::clamp(_5015, 0.0, 1.0);
                    float _5019 = fma(_5017, _5003, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _5021 = fma(_5017, _5007, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _5023 = fma(_5017, _5013, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    _4911 = _5021;
                    _4869 = _5019;
                    _4919 = _5023;
                    _4963 = true;
                }
                else
                {
                    _4911 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _4869 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _4919 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                }
            }
        }
    }
    _4963 = false;
    float _5025 = _4911;
    float _5027 = _4869;
    float _5029 = _4919;
    float _5031 = _4905 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_96.x = 0.0;
    float _5033 = _5025 * 0.586610972881317138671875;
    bool _5035 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    out.m_55.x = _5031;
    float _5037 = fma(_5027, 0.298911988735198974609375, _5033);
    bool _5039 = _4366 > 0.0;
    bool _5041 = isnan(_4366);
    bool _5043 = _5039 || _5041;
    bool _5045 = isnan(0.0);
    bool _5047 = _5043 || _5045;
    float _5049 = fma(_5029, 0.114477999508380889892578125, _5037);
    bool _5051 = _4424 <= 0.0;
    bool _5053 = !_5047;
    bool _5055 = _5051 || _5053;
    float _5057 = -_5049;
    float _5059 = _5057 + _5027;
    float _5061 = -_5049;
    float _5063 = _5061 + _5025;
    float _5065 = -_5049;
    float _5067 = _5065 + _5029;
    float _5069 = fma(_5059, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5049);
    float _5071 = fma(_5063, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5049);
    float _5073 = fma(_5067, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5049);
    bool _5075 = !_5035;
    if (!_5075)
    {
        float _5077 = -_4302;
        float _5079 = _5077 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _5081 = -_4304;
        float _5083 = _5081 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _5085 = -_4306;
        float _5087 = _5085 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _5089 = _5079 * _5079;
        float _5091 = fma(_5083, _5083, _5089);
        float _5093 = fma(_5087, _5087, _5091);
        float _5095 = sqrt(_5093);
        float _5097 = rsqrt(_5093);
        float _5099 = -_5095;
        float _5101 = _5099 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _5103 = _5101 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _5105 = precise::clamp(_5103, 0.0, 1.0);
        float _5107 = _5083 * _5097;
        float _5109 = _5079 * _5097;
        float _5111 = abs(_5105);
        float _5113 = log2(_5111);
        float _5115 = _5087 * _5097;
        float _5117 = _5107 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _5119 = _3966 * _5109;
        float _5121 = -_5109;
        float _5123 = -_5117;
        float _5125 = fma(_5121, (*spvDescriptorSet0.vp_c15)._m0[656].y, _5123);
        float _5127 = fma(_3964, _5107, _5119);
        float _5129 = -_5115;
        float _5131 = fma(_5129, (*spvDescriptorSet0.vp_c15)._m0[656].z, _5125);
        float _5133 = fma(_3968, _5115, _5127);
        float _5135 = precise::clamp(_5133, 0.0, 1.0);
        float _5137 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _5139 = _5131 + _5137;
        float _5141 = _5113 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _5143 = _5139 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _5145 = precise::clamp(_5143, 0.0, 1.0);
        float _5147 = exp2(_5141);
        float _5149 = _5147 * _5145;
        float _5151 = _5135 * _5149;
        float _5153 = _5151 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _5155 = _5151 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _5157 = _5151 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_96.x = _5153;
        out.m_96.y = _5155;
        out.m_96.z = _5157;
    }
    out.m_98.x = _5069;
    out.m_98.y = _5071;
    out.m_98.z = _5073;
    if (!_5055)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_55.x = 0.0;
    float _5159 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _5159;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    bool _4963 = false;
    bool _4016 = false;
    bool _507 = false;
    bool _409 = false;
    bool _305 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _112 = in.m_48.w;
    float _114 = in.m_50.w;
    float _116 = trunc(_112);
    int _119 = int(_116);
    float _121 = -_114;
    float _123 = _121 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_53.y = _123;
    bool _127 = _119 >= 1;
    float _129 = 0.0;
    float _131 = _114;
    float _133 = _123;
    if (!_127)
    {
        _129 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _135 = _129;
    if (!_127)
    {
        out.m_55.x = 0.0;
    }
    int _137 = 0;
    if (!_127)
    {
        float _139 = _135 * 5.0;
        _137 = as_type<int>(_139);
    }
    int _141 = _137;
    if (!_127)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5226 = as_type<float>(_141);
        out.gl_Position.z = _5226;
    }
    if (!_127)
    {
        return out;
    }
    bool _143 = _114 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _145 = isnan(_114);
    bool _147 = _143 || _145;
    bool _149 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _151 = _147 || _149;
    float _153 = float(_119);
    bool _155 = _123 >= _153;
    bool _157 = !_151;
    bool _159 = _155 || _157;
    float _161 = 1.0 / _153;
    if (_159)
    {
        _131 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _163 = _131;
    if (_159)
    {
        out.m_55.x = 0.0;
    }
    float _165 = _123 * _161;
    int _167 = 0;
    float _169 = _165;
    if (_159)
    {
        float _171 = _163 * 5.0;
        _167 = as_type<int>(_171);
    }
    int _173 = _167;
    out.m_53.x = _165;
    if (_159)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5289 = as_type<float>(_173);
        out.gl_Position.z = _5289;
    }
    if (_159)
    {
        return out;
    }
    float _175 = in.m_57.x;
    float _177 = in.m_57.y;
    float _179 = in.m_57.z;
    float _181 = (*spvDescriptorSet0.vp_c10)._m0[18].y * (*spvDescriptorSet0.vp_c10)._m0[18].y;
    float _183 = as_type<float>(int(gl_VertexIndex));
    float _185 = fma((*spvDescriptorSet0.vp_c10)._m0[18].x, (*spvDescriptorSet0.vp_c10)._m0[18].x, _181);
    float _187 = (*spvDescriptorSet0.vp_c10)._m0[19].y * (*spvDescriptorSet0.vp_c10)._m0[19].y;
    float _189 = fma((*spvDescriptorSet0.vp_c10)._m0[19].x, (*spvDescriptorSet0.vp_c10)._m0[19].x, _187);
    float _191 = fma((*spvDescriptorSet0.vp_c10)._m0[18].z, (*spvDescriptorSet0.vp_c10)._m0[18].z, _185);
    float _193 = (*spvDescriptorSet0.vp_c10)._m0[20].y * (*spvDescriptorSet0.vp_c10)._m0[20].y;
    float _195 = fma((*spvDescriptorSet0.vp_c10)._m0[19].z, (*spvDescriptorSet0.vp_c10)._m0[19].z, _189);
    float _197 = sqrt(_191);
    float _199 = fma((*spvDescriptorSet0.vp_c10)._m0[20].x, (*spvDescriptorSet0.vp_c10)._m0[20].x, _193);
    float _201 = fma((*spvDescriptorSet0.vp_c10)._m0[20].z, (*spvDescriptorSet0.vp_c10)._m0[20].z, _199);
    float _203 = _177 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
    float _205 = _177 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
    float _207 = sqrt(_195);
    float _209 = _177 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
    float _211 = fma(_175, (*spvDescriptorSet0.vp_c10)._m0[14].y, _203);
    float _213 = fma(_175, (*spvDescriptorSet0.vp_c10)._m0[14].x, _205);
    float _215 = _177 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
    float _217 = fma(_175, (*spvDescriptorSet0.vp_c10)._m0[14].z, _209);
    float _219 = fma(_179, (*spvDescriptorSet0.vp_c10)._m0[16].y, _211);
    float _221 = fma(_179, (*spvDescriptorSet0.vp_c10)._m0[16].x, _213);
    float _223 = sqrt(_201);
    int _225 = as_type<int>(_183) & 1;
    bool _227 = _225 != 0;
    int _229 = as_type<int>(_183) & 2;
    bool _231 = _229 != 0;
    float _233 = fma(_175, (*spvDescriptorSet0.vp_c10)._m0[14].w, _215);
    bool _235 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _237 = fma(_179, (*spvDescriptorSet0.vp_c10)._m0[16].z, _217);
    float _239 = _197 * _221;
    float _241 = fma(_179, (*spvDescriptorSet0.vp_c10)._m0[16].w, _233);
    bool _243 = !_227;
    float _245 = _243 ? (-0.5) : 0.5;
    float _247 = _207 * _219;
    bool _249 = !_231;
    float _251 = _249 ? (-0.5) : 0.5;
    float _253 = _247 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _255 = _247 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _257 = _247 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _259 = _223 * _237;
    float _261 = fma(_239, (*spvDescriptorSet0.vp_c8)._m0[24].x, _253);
    float _263 = fma(_239, (*spvDescriptorSet0.vp_c8)._m0[25].x, _255);
    float _265 = fma(_239, (*spvDescriptorSet0.vp_c8)._m0[26].x, _257);
    float _267 = fma(_259, (*spvDescriptorSet0.vp_c8)._m0[24].z, _261);
    float _269 = fma(_259, (*spvDescriptorSet0.vp_c8)._m0[25].z, _263);
    float _271 = fma(_259, (*spvDescriptorSet0.vp_c8)._m0[26].z, _265);
    float _273 = fma(_241, (*spvDescriptorSet0.vp_c8)._m0[24].w, _267);
    float _275 = fma(_241, (*spvDescriptorSet0.vp_c8)._m0[25].w, _269);
    float _277 = fma(_241, (*spvDescriptorSet0.vp_c8)._m0[26].w, _271);
    bool _279 = !_235;
    bool _281 = _235;
    float _283 = _273;
    float _285 = _277;
    float _303;
    if (!_279)
    {
        float _287 = in.m_62.x;
        float _289 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _291 = _287 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _293 = fma(_291, (*spvDescriptorSet0.vp_c9)._m0[12].x, _123);
        float _295 = _293 * _289;
        float _297 = floor(_295);
        float _299 = -_297;
        float _301 = _295 + _299;
        _303 = _301;
        _305 = true;
    }
    else
    {
        _303 = _165;
    }
    _305 = false;
    float _307 = _303;
    float _309 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _311 = _307 + _309;
    float _313 = in.m_64.x;
    float _315 = in.m_64.y;
    bool _317 = _307 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _319 = isnan(_307);
    bool _321 = _317 || _319;
    bool _323 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _325 = _321 || _323;
    float _327 = float(_325);
    float _329 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _331 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _329;
    bool _333 = _307 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _335 = isnan(_307);
    bool _337 = _333 || _335;
    bool _339 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _341 = _337 || _339;
    float _343 = float(_341);
    float _345 = -_327;
    float _347 = _345 + 1.0;
    float _349 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _351 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _349;
    float _353 = 1.0 / _331;
    bool _355 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _357 = _343 * _347;
    float _359 = -_343;
    float _361 = _359 + 1.0;
    float _363 = _311 * _353;
    float _365 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _367 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _365;
    float _369 = fma(_351, _363, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _371 = fma(_367, _363, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _373 = _369 * _357;
    float _375 = _371 * _357;
    float _377 = fma(_361, (*spvDescriptorSet0.vp_c9)._m0[143].x, _373);
    float _379 = fma(_361, (*spvDescriptorSet0.vp_c9)._m0[143].y, _375);
    float _381 = fma(_327, (*spvDescriptorSet0.vp_c9)._m0[144].x, _377);
    float _383 = fma(_327, (*spvDescriptorSet0.vp_c9)._m0[144].y, _379);
    float _385 = _381 * _313;
    float _387 = _383 * _315;
    bool _389 = !_355;
    float _407;
    if (!_389)
    {
        float _391 = in.m_62.x;
        float _393 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _395 = _391 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _397 = fma(_395, (*spvDescriptorSet0.vp_c9)._m0[11].y, _123);
        float _399 = _397 * _393;
        float _401 = floor(_399);
        float _403 = -_401;
        float _405 = _399 + _403;
        _407 = _405;
        _409 = true;
    }
    else
    {
        _407 = _165;
    }
    _409 = false;
    float _411 = _407;
    bool _413 = _411 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _415 = isnan(_411);
    bool _417 = _413 || _415;
    bool _419 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _421 = _417 || _419;
    float _423 = float(_421);
    float _425 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _427 = _425 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _429 = _411 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _431 = isnan(_411);
    bool _433 = _429 || _431;
    bool _435 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _437 = _433 || _435;
    float _439 = float(_437);
    float _441 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _443 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _441;
    float _445 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _447 = _411 + _445;
    float _449 = -_423;
    float _451 = _449 + 1.0;
    bool _453 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _455 = 1.0 / _427;
    float _457 = _439 * _451;
    float _459 = -_439;
    float _461 = _459 + 1.0;
    float _463 = _443 * _455;
    float _465 = fma(_463, _447, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _467 = _465 * _457;
    float _469 = fma(_461, (*spvDescriptorSet0.vp_c9)._m0[115].x, _467);
    float _471 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _473 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _475 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _477 = fma(_423, (*spvDescriptorSet0.vp_c9)._m0[116].x, _469);
    float _479 = _471 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _481 = _473 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _483 = _475 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _485 = _477 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_66.x = _479;
    out.m_66.y = _481;
    out.m_66.z = _483;
    out.m_66.w = _485;
    bool _487 = !_453;
    float _505;
    if (!_487)
    {
        float _489 = in.m_62.x;
        float _491 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _493 = _489 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _495 = fma(_493, (*spvDescriptorSet0.vp_c9)._m0[11].w, _123);
        float _497 = _495 * _491;
        float _499 = floor(_497);
        float _501 = -_499;
        float _503 = _497 + _501;
        _505 = _503;
        _507 = true;
    }
    else
    {
        _505 = _165;
    }
    _507 = false;
    float _509 = _505;
    float _511 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _513 = _509 + _511;
    float _515 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _517 = _515 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _519 = _509 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _521 = isnan(_509);
    bool _523 = _519 || _521;
    bool _525 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _527 = _523 || _525;
    float _529 = float(_527);
    float _531 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _533 = _531 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _535 = _509 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _537 = isnan(_509);
    bool _539 = _535 || _537;
    bool _541 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _543 = _539 || _541;
    float _545 = float(_543);
    float _547 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _549 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _547;
    bool _551 = _509 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _553 = isnan(_509);
    bool _555 = _551 || _553;
    bool _557 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _559 = _555 || _557;
    float _561 = float(_559);
    float _563 = 1.0 / _517;
    float _565 = -_529;
    float _567 = _565 + 1.0;
    bool _569 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _571 = _545 * _567;
    float _573 = -_545;
    float _575 = _573 + 1.0;
    float _577 = 1.0 / _533;
    float _579 = _549 * _563;
    float _581 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _583 = _581 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _585 = fma(_579, _513, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _587 = _583 * _577;
    float _589 = _585 * _571;
    float _591 = -_561;
    float _593 = _591 + 1.0;
    float _595 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _597 = _509 + _595;
    float _599 = fma(_575, (*spvDescriptorSet0.vp_c9)._m0[131].x, _589);
    float _601 = _529 * _593;
    float _603 = fma(_587, _597, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _605 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _607 = fma(_603, _601, _599);
    float _609 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _611 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _613 = fma(_561, (*spvDescriptorSet0.vp_c9)._m0[133].x, _607);
    float _615 = _605 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _617 = _609 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _619 = _611 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _621 = _613 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_68.x = _615;
    out.m_68.y = _617;
    out.m_68.z = _619;
    out.m_68.w = _621;
    bool _623 = !_569;
    int _625 = as_type<int>(_613);
    if (!_623)
    {
        float _627 = in.m_62.x;
        float _629 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _631 = _627 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _633 = fma(_631, (*spvDescriptorSet0.vp_c9)._m0[14].x, _123);
        float _635 = _633 * _629;
        float _637 = floor(_635);
        float _639 = -_637;
        float _641 = _635 + _639;
        _169 = _641;
    }
    float _643 = _169;
    float _645 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _647 = int(_645);
    int _649 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _651 = _649 != 0;
    float _653 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].y);
    int _655 = int(_653);
    float _657 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _659 = int(_657);
    float _661 = float(_647);
    float _663 = _621;
    if (_651)
    {
        float _665 = in.m_62.w;
        _663 = _665;
    }
    float _667 = _663;
    float _669 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _671 = int(_669);
    float _673 = float(_655);
    float _675 = 1.0 / _661;
    float _677 = float(_659);
    float _679 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _681 = int(_679);
    float _683 = float(uint(_671));
    float _685 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].x);
    int _687 = int(_685);
    float _689 = _675 * _123;
    int _691 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _693 = _691 != 0;
    float _695 = (*spvDescriptorSet0.vp_c9)._m0[7].z;
    if (_651)
    {
        float _697 = _667 * 3.1415927410125732421875;
        _695 = _697;
    }
    float _699 = _695;
    float _701 = 1.0 / _677;
    float _703 = float(uint(_681));
    float _705 = 0.0;
    if (_651)
    {
        float _707 = _699 * 0.15915493667125701904296875;
        _705 = _707;
    }
    float _709 = _705;
    float _711 = 1.0 / _673;
    float _713 = float(uint(_687));
    float _715 = _699;
    float _717 = _677;
    if (_693)
    {
        float _719 = in.m_62.x;
        float _721 = in.m_62.y;
        _715 = _719;
        _717 = _721;
    }
    float _723 = _715;
    float _725 = _717;
    float _727 = 0.0;
    if (_693)
    {
        _727 = 1.0;
    }
    float _729 = _727;
    float _731 = 0.0;
    float _733 = _729;
    if (_693)
    {
        _731 = 1.0;
    }
    float _735 = _731;
    float _737 = 1.0 / _683;
    float _739 = _701 * _123;
    int _741 = 0;
    float _743 = _735;
    if (_693)
    {
        _741 = 0;
    }
    int _745 = _741;
    int _747 = _745;
    if (_693)
    {
        _625 = 0;
    }
    int _749 = _625;
    float _751 = trunc(_689);
    int _753 = int(_751);
    float _755 = _711 * _123;
    float _757 = 1.0 / _703;
    int _759 = as_type<int>(_737) + (-2);
    float _761 = 1.0 / _713;
    float _763 = float(uint(_753));
    float _765 = as_type<float>(_759) * _763;
    float _767 = trunc(_739);
    int _769 = int(_767);
    int _771 = as_type<int>(_757) + (-2);
    float _773 = trunc(_755);
    int _775 = int(_773);
    int _777 = as_type<int>(_761) + (-2);
    float _779 = float(uint(_769));
    float _781 = _709;
    float _783 = _779;
    float _785 = _737;
    float _787 = _765;
    int _789 = _749;
    float _791 = as_type<float>(_759);
    if (_651)
    {
        float _793 = _709 * 6.283185482025146484375;
        float _795 = sin(_793);
        _781 = _795;
    }
    float _797 = _781;
    float _799 = as_type<float>(_771) * _779;
    float _801 = _723;
    float _803 = _725;
    if (_693)
    {
        _783 = _725;
    }
    float _805 = _783;
    float _807 = float(uint(_775));
    float _809 = trunc(_799);
    float _811 = precise::max(_809, 0.0);
    uint _814 = uint(_811);
    float _816 = as_type<float>(_777) * _807;
    float _818 = _807;
    float _820 = _805;
    if (_693)
    {
        _818 = _723;
    }
    float _822 = _818;
    float _824 = trunc(_816);
    float _826 = precise::max(_824, 0.0);
    uint _828 = uint(_826);
    float _830 = _822;
    if (_693)
    {
        _785 = _822;
    }
    float _832 = _785;
    float _834 = trunc(_765);
    float _836 = precise::max(_834, 0.0);
    uint _838 = uint(_836);
    float _840 = _832;
    if (_693)
    {
        _787 = _822;
    }
    float _842 = _787;
    float _844 = _842;
    if (!_693)
    {
        float _846 = in.m_62.x;
        float _848 = in.m_62.y;
        float _850 = in.m_62.z;
        float _852 = _846 * 3.1415927410125732421875;
        float _854 = _852 * 0.15915493667125701904296875;
        float _856 = _848 * 3.1415927410125732421875;
        float _858 = _856 * 0.15915493667125701904296875;
        float _860 = _854 * 6.283185482025146484375;
        float _862 = sin(_860);
        float _864 = _858 * 6.283185482025146484375;
        float _866 = sin(_864);
        _733 = 7.345489978790283203125;
        _801 = _846;
        _830 = _848;
        _743 = 5.839270114898681640625;
        _844 = _850;
        _803 = _848;
        _840 = _862;
        _820 = _866;
        _747 = 1;
        _789 = 2;
    }
    float _868 = _733;
    float _870 = _801;
    float _872 = _830;
    float _874 = _743;
    float _876 = _844;
    float _878 = _803;
    float _880 = _840;
    float _882 = _820;
    int _884 = _747;
    int _886 = _789;
    int _888 = ~_671;
    int _890 = _888 + 1;
    float _892 = _868 * _870;
    float _894 = _868 * _872;
    int _896 = ~_681;
    int _898 = _896 + 1;
    float _900 = in.m_62.z;
    float _902 = in.m_62.w;
    int _904 = _890 * int(_838);
    int _906 = _904 + _753;
    float _908 = floor(_894);
    int _910 = ~_687;
    int _912 = _910 + 1;
    int _914 = _898 * int(_814);
    int _916 = _914 + _769;
    float _918 = _874 * _876;
    float _920 = float(uint(_906));
    float _922 = _878 * 2.0;
    float _924 = as_type<float>(_884);
    if (_651)
    {
        bool _926 = _797 > 0.5;
        _281 = _926;
    }
    bool _928 = _281;
    float _930 = float(uint(_916));
    float _932 = as_type<float>(_759) * _920;
    float _934 = floor(_918);
    int _936 = _912 * int(_828);
    int _938 = _936 + _775;
    int _940 = ~_671;
    int _942 = _940 + 1;
    float _944 = as_type<float>(_771) * _930;
    float _946 = float(_681);
    float _948 = float(uint(_938));
    float _950 = -_908;
    float _952 = _894 + _950;
    float _954 = trunc(_932);
    float _956 = precise::max(_954, 0.0);
    uint _958 = uint(_956);
    float _960 = float(_671);
    float _962 = as_type<float>(_777) * _948;
    bool _964 = _902 > 0.5;
    float _966 = float(_687);
    float _968 = floor(_892);
    float _970 = -_934;
    float _972 = _918 + _970;
    float _974 = float(_753);
    float _976 = _952 * _966;
    float _978 = 0.0;
    if (!_651)
    {
        _978 = _245;
    }
    float _980 = _978;
    bool _982 = _974 >= _960;
    bool _984 = isnan(_974);
    bool _986 = _982 || _984;
    bool _988 = isnan(_960);
    bool _990 = _986 || _988;
    float _992 = float(_990);
    float _994 = trunc(_944);
    float _996 = precise::max(_994, 0.0);
    uint _998 = uint(_996);
    int _1000 = int(_838) + int(_958);
    float _1002 = _161 * _123;
    float _1004 = float(_775);
    float _1006 = _980;
    if (_651)
    {
        float _1008 = -_245;
        float _1010 = _928 ? _1008 : _245;
        _1006 = _1010;
    }
    float _1012 = _1006;
    float _1014 = _960 * _1002;
    int _1016 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1018 = _1016 != 0;
    float _1020 = trunc(_962);
    float _1022 = precise::max(_1020, 0.0);
    uint _1024 = uint(_1022);
    float _1026 = -_968;
    float _1028 = _892 + _1026;
    float _1030 = float(_769);
    float _1032 = _966 * _1002;
    bool _1034 = _900 > 0.5;
    float _1036 = _1028 * _960;
    int _1038 = _942 * _1000;
    int _1040 = _1038 + _753;
    bool _1042 = _878 > 0.5;
    float _1044 = _972 * _946;
    bool _1046 = _1030 >= _946;
    bool _1048 = isnan(_1030);
    bool _1050 = _1046 || _1048;
    bool _1052 = isnan(_946);
    bool _1054 = _1050 || _1052;
    float _1056 = float(_1054);
    float _1058 = _946 * _1002;
    bool _1060 = uint(_1040) >= uint(_671);
    float _1062 = trunc(_992);
    int _1064 = int(_1062);
    bool _1066 = _1004 >= _966;
    bool _1068 = isnan(_1004);
    bool _1070 = _1066 || _1068;
    bool _1072 = isnan(_966);
    bool _1074 = _1070 || _1072;
    float _1076 = float(_1074);
    int _1078 = int(_814) + int(_998);
    int _1080 = ~_681;
    int _1082 = _1080 + 1;
    float _1084 = -_251;
    int _1086 = _964 ? as_type<int>(_1084) : as_type<int>(_251);
    float _1088 = trunc(_1056);
    int _1090 = int(_1088);
    int _1092 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1094 = _1092 != 0;
    int _1096 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1098 = _1096 != 0;
    int _1100 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1102 = _1100 != 0;
    int _1104 = _1082 * _1078;
    int _1106 = _1104 + _769;
    int _1108 = int(_828) + int(_1024);
    float _1110 = -_251;
    int _1112 = _1034 ? as_type<int>(_1110) : as_type<int>(_251);
    float _1114 = -_245;
    int _1116 = _1042 ? as_type<int>(_1114) : as_type<int>(_245);
    float _1118 = trunc(_1076);
    int _1120 = int(_1118);
    int _1122 = ~_687;
    int _1124 = _1122 + 1;
    bool _1126 = !_1094;
    float _1128 = _1126 ? _251 : as_type<float>(_1086);
    int _1130 = int(_1060);
    int _1132 = _1018 ? 2 : 0;
    int _1134 = _1130 | _1132;
    int _1136 = _1034 ? 4 : 0;
    int _1138 = _1134 | _1136;
    int _1140 = _1094 ? 8 : 0;
    int _1142 = _1138 | _1140;
    int _1144 = _1098 ? 16 : 0;
    int _1146 = _1142 | _1144;
    int _1148 = _1102 ? 32 : 0;
    int _1150 = _1146 | _1148;
    int _1152 = _1042 ? 64 : 0;
    int _1154 = _1150 | _1152;
    int _1156 = _1154 & 64;
    float _1158 = trunc(_1036);
    int _1160 = int(_1158);
    bool _1162 = !_1102;
    float _1164 = _1162 ? _251 : as_type<float>(_1112);
    bool _1166 = !_1098;
    float _1168 = _1166 ? _245 : as_type<float>(_1116);
    int _1170 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1172 = _1170 != 0;
    int _1174 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1176 = _1174 != 0;
    int _1178 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1180 = _1178 != 0;
    float _1182 = trunc(_1014);
    int _1184 = int(_1182);
    bool _1186 = !_1018;
    int _1188 = _1186 ? 0 : 1;
    int _1190 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1192 = _1190 != 0;
    int _1194 = _1124 * _1108;
    int _1196 = _1194 + _775;
    bool _1198 = uint(_1106) >= uint(_681);
    bool _1200 = !_1060;
    int _1202 = _1200 ? 0 : (-1);
    float _1204 = trunc(_1058);
    int _1206 = int(_1204);
    bool _1208 = !_1176;
    int _1210 = _1208 ? 0 : 1;
    bool _1212 = !_1172;
    int _1214 = _1212 ? 0 : 1;
    bool _1216 = !_1180;
    int _1218 = _1216 ? 0 : 1;
    bool _1220 = !_1192;
    int _1222 = _1220 ? 0 : 1;
    float _1224 = trunc(_1032);
    int _1226 = int(_1224);
    int _1228 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _1230 = _1228 != 0;
    int _1232 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _1234 = _1232 != 0;
    int _1236 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _1238 = _1236 != 0;
    int _1240 = ~_1000;
    int _1242 = _1240 + _1202;
    int _1244 = _1242 + 1;
    int _1246 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _1248 = _1246 != 0;
    bool _1250 = uint(_1196) >= uint(_687);
    int _1252 = _671 * _1244;
    int _1254 = _1252 + _753;
    int _1256 = abs(_1188);
    float _1258 = trunc(_1044);
    int _1260 = int(_1258);
    bool _1262 = !_1248;
    int _1264 = _1262 ? 0 : 1;
    bool _1266 = !_1234;
    int _1268 = _1266 ? 0 : 1;
    int _1270 = _1160 * _1256;
    int _1272 = _1270 + _753;
    int _1274 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _1276 = _1274 != 0;
    int _1278 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32768;
    bool _1280 = _1278 != 0;
    float _1282 = floor(_922);
    bool _1284 = _671 == 0;
    bool _1286 = !_1198;
    int _1288 = _1286 ? 0 : (-1);
    bool _1290 = !_1250;
    int _1292 = _1290 ? 0 : (-1);
    bool _1294 = !_1276;
    int _1296 = _1294 ? 0 : 1;
    bool _1298 = !_1280;
    int _1300 = _1298 ? 0 : 1;
    int _1302 = ~_1064;
    int _1304 = _1302 + 1;
    int _1306 = _1304 + 1;
    bool _1308 = !_1284;
    int _1310 = _1308 ? _1254 : (-1);
    int _1312 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 65536;
    bool _1314 = _1312 != 0;
    int _1316 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 131072;
    bool _1318 = _1316 != 0;
    int _1320 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 262144;
    bool _1322 = _1320 != 0;
    int _1324 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 524288;
    bool _1326 = _1324 != 0;
    int _1328 = ~_1078;
    int _1330 = _1328 + _1288;
    int _1332 = _1330 + 1;
    int _1334 = _1310 * _1306;
    int _1336 = ~_1108;
    int _1338 = _1336 + _1292;
    int _1340 = _1338 + 1;
    bool _1342 = !_1318;
    int _1344 = _1342 ? 0 : 1;
    int _1346 = _681 * _1332;
    int _1348 = _1346 + _769;
    bool _1350 = _681 == 0;
    int _1352 = _687 * _1340;
    int _1354 = _1352 + _775;
    bool _1356 = !_1314;
    int _1358 = _1356 ? 0 : 1;
    bool _1360 = _687 == 0;
    int _1362 = _671 + (-1);
    int _1364 = abs(_1264);
    int _1366 = abs(_1210);
    int _1368 = _1064 * _1362;
    int _1370 = _1368 + _1334;
    int _1372 = ~_1090;
    int _1374 = _1372 + 1;
    int _1376 = _1374 + 1;
    int _1378 = _1260 * _1364;
    int _1380 = _1378 + _769;
    bool _1382 = !_1350;
    int _1384 = _1382 ? _1348 : (-1);
    int _1386 = _1370 * _1366;
    int _1388 = ~_1120;
    int _1390 = _1388 + 1;
    int _1392 = _1390 + 1;
    float _1394 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1396 = log2(_1394);
    bool _1398 = !_1360;
    int _1400 = _1398 ? _1354 : (-1);
    int _1402 = _1384 * _1376;
    int _1404 = abs(_1214);
    float _1406 = _878 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _1408 = _681 + (-1);
    int _1410 = _1400 * _1392;
    int _1412 = abs(_1268);
    float _1414 = trunc(_976);
    int _1416 = int(_1414);
    int _1418 = abs(_1218);
    int _1420 = _1090 * _1408;
    int _1422 = _1420 + _1402;
    int _1424 = _687 + (-1);
    int _1426 = _1184 * _1404;
    int _1428 = _1426 + _1386;
    bool _1430 = !_1230;
    int _1432 = _1430 ? 0 : 1;
    int _1434 = _1120 * _1424;
    int _1436 = _1434 + _1410;
    int _1438 = _1272 * _1418;
    int _1440 = _1438 + _1428;
    int _1442 = abs(_1222);
    float _1444 = _1396 * _123;
    int _1446 = abs(_1344);
    int _1448 = _1422 * _1412;
    int _1450 = abs(_1432);
    int _1452 = _1160 * _1442;
    int _1454 = _1452 + _1440;
    int _1456 = abs(_1358);
    int _1458 = _1436 * _1446;
    bool _1460 = !_1238;
    int _1462 = _1460 ? 0 : 1;
    int _1464 = _1206 * _1450;
    int _1466 = _1464 + _1448;
    int _1468 = abs(_1296);
    int _1470 = _1226 * _1456;
    int _1472 = _1470 + _1458;
    float _1474 = float(uint(_1454));
    float _1476 = exp2(_1444);
    bool _1478 = !_1322;
    int _1480 = _1478 ? 0 : 1;
    int _1482 = abs(_1462);
    float _1484 = as_type<float>(_759) * _1474;
    int _1486 = abs(_1480);
    int _1488 = abs(_1300);
    bool _1490 = !_1326;
    int _1492 = _1490 ? 0 : 1;
    float _1494 = trunc(_1484);
    float _1496 = precise::max(_1494, 0.0);
    uint _1498 = uint(_1496);
    int _1500 = _1416 * _1488;
    int _1502 = _1500 + _775;
    int _1504 = abs(_1492);
    int _1506 = _1380 * _1482;
    int _1508 = _1506 + _1466;
    int _1510 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _1512 = _1510 != 0;
    int _1514 = _1502 * _1486;
    int _1516 = _1514 + _1472;
    int _1518 = _1260 * _1468;
    int _1520 = _1518 + _1508;
    int _1522 = ~_671;
    int _1524 = _1522 + 1;
    int _1526 = ~_681;
    int _1528 = _1526 + 1;
    int _1530 = _1416 * _1504;
    int _1532 = _1530 + _1516;
    float _1534 = float(uint(_1520));
    int _1536 = ~_671;
    int _1538 = _1536 + 1;
    float _1540 = float(uint(_1532));
    float _1542 = as_type<float>(_771) * _1534;
    int _1544 = _1524 * int(_1498);
    int _1546 = _1544 + _1454;
    float _1548 = as_type<float>(_1486);
    float _1550 = as_type<float>(_1546);
    bool _1552 = _1230;
    float _1554 = as_type<float>(_1354);
    float _1556 = as_type<float>(_1418);
    float _1558 = as_type<float>(_1412);
    if (_1512)
    {
        float _1560 = in.m_62.x;
        _1548 = _1560;
    }
    float _1562 = _1548;
    bool _1564 = _900 > 0.5;
    float _1566 = as_type<float>(_777) * _1540;
    float _1568 = trunc(_1542);
    float _1570 = precise::max(_1568, 0.0);
    uint _1572 = uint(_1570);
    float _1574 = float(uint(_1546));
    float _1576 = as_type<float>(_759) * _1574;
    float _1578 = trunc(_1566);
    float _1580 = precise::max(_1578, 0.0);
    uint _1582 = uint(_1580);
    float _1584 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    float _1586 = fma(_880, (*spvDescriptorSet0.vp_c9)._m0[93].z, _1584);
    float _1588 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1590 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1592 = trunc(_1576);
    float _1594 = precise::max(_1592, 0.0);
    uint _1596 = uint(_1594);
    int _1598 = ~_687;
    int _1600 = _1598 + 1;
    int _1602 = _1528 * int(_1572);
    int _1604 = _1602 + _1520;
    float _1606 = fma(_1406, -2.0, _1588);
    float _1608 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    if (_1512)
    {
        float _1610 = _1562 * 3.1415927410125732421875;
        _1550 = _1610;
    }
    float _1612 = _1550;
    float _1614 = float(uint(_1272));
    float _1616 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[92].z, _1586);
    int _1618 = _1600 * int(_1582);
    int _1620 = _1618 + _1532;
    float _1622 = float(uint(_1604));
    float _1624 = _1612;
    if (_1512)
    {
        float _1626 = _1612 * 0.15915493667125701904296875;
        _1624 = _1626;
    }
    float _1628 = _1624;
    float _1630 = as_type<float>(_759) * _1614;
    float _1632 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1606);
    float _1634 = as_type<float>(_771) * _1622;
    float _1636 = trunc(_1630);
    float _1638 = precise::max(_1636, 0.0);
    uint _1640 = uint(_1638);
    int _1642 = int(_1498) + int(_1596);
    float _1644 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    float _1646 = float(uint(_1620));
    float _1648 = fma(_882, (*spvDescriptorSet0.vp_c9)._m0[93].w, _1644);
    float _1650 = as_type<float>(_777) * _1646;
    int _1652 = _1538 * _1642;
    int _1654 = _1652 + _1454;
    float _1656 = trunc(_1634);
    float _1658 = precise::max(_1656, 0.0);
    uint _1660 = uint(_1658);
    int _1662 = ~_671;
    int _1664 = _1662 + 1;
    float _1666 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    float _1668 = _882 * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    bool _1670 = uint(_1654) >= uint(_671);
    int _1672 = _1664 * int(_1640);
    int _1674 = _1672 + _1272;
    float _1676 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1678 = _1628;
    if (_1512)
    {
        float _1680 = _1628 * 6.283185482025146484375;
        float _1682 = sin(_1680);
        _1678 = _1682;
    }
    float _1684 = _1678;
    bool _1686 = !_1670;
    int _1688 = _1686 ? 0 : (-1);
    float _1690 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1692 = float(uint(_1674));
    float _1694 = fma(_1668, -2.0, _1666);
    int _1696 = ~_1642;
    int _1698 = _1696 + _1688;
    int _1700 = _1698 + 1;
    float _1702 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[92].w, _1648);
    float _1704 = float(uint(_1380));
    float _1706 = trunc(_1650);
    float _1708 = precise::max(_1706, 0.0);
    uint _1710 = uint(_1708);
    int _1712 = int(_1572) + int(_1660);
    int _1714 = _671 * _1700;
    int _1716 = _1714 + _1454;
    int _1718 = ~_681;
    int _1720 = _1718 + 1;
    float _1722 = as_type<float>(_771) * _1704;
    float _1724 = as_type<float>(_759) * _1692;
    int _1726 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1728 = _1726 != 0;
    float _1730 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[91].y, _1694);
    float _1732 = trunc(_1722);
    float _1734 = precise::max(_1732, 0.0);
    uint _1736 = uint(_1734);
    if (_1512)
    {
        bool _1738 = _1684 > 0.5;
        _1552 = _1738;
    }
    bool _1740 = _1552;
    float _1742 = -_1702;
    float _1744 = _1742 + 1.0;
    bool _1746 = !_1284;
    int _1748 = _1746 ? _1716 : (-1);
    int _1750 = _1720 * _1712;
    int _1752 = _1750 + _1520;
    float _1754 = -_245;
    int _1756 = _1564 ? as_type<int>(_1754) : as_type<int>(_245);
    if (!_1512)
    {
        _791 = _251;
    }
    float _1758 = _791;
    float _1760 = trunc(_1724);
    float _1762 = precise::max(_1760, 0.0);
    uint _1764 = uint(_1762);
    float _1766 = _1758;
    if (_1512)
    {
        float _1768 = -_251;
        float _1770 = _1740 ? _1768 : _251;
        _1766 = _1770;
    }
    float _1772 = _1766;
    bool _1774 = !_1728;
    float _1776 = _1774 ? _245 : as_type<float>(_1756);
    int _1778 = _1748 & 3;
    bool _1780 = _1778 != 0;
    bool _1782 = uint(_1752) >= uint(_681);
    int _1784 = int(_1582) + int(_1710);
    int _1786 = ~_687;
    int _1788 = _1786 + 1;
    bool _1790 = uint(_1778) > 1u;
    bool _1792 = !_1782;
    int _1794 = _1792 ? 0 : (-1);
    int _1796 = _1788 * _1784;
    int _1798 = _1796 + _1532;
    int _1800 = _1748 & 3;
    bool _1802 = _1800 != 0;
    int _1804 = ~_1712;
    int _1806 = _1804 + _1794;
    int _1808 = _1806 + 1;
    int _1810 = _1720 * int(_1736);
    int _1812 = _1810 + _1380;
    int _1814 = _1802 ? 0 : 1;
    bool _1816 = uint(_1798) >= uint(_687);
    int _1818 = int(_1640) + int(_1764);
    float _1820 = float(uint(_1812));
    int _1822 = ~_671;
    int _1824 = _1822 + 1;
    int _1826 = ~_1814;
    int _1828 = _1826 + 1;
    int _1830 = _1828 + 1;
    float _1832 = as_type<float>(_771) * _1820;
    int _1834 = _1830;
    if (!_1790)
    {
        int _1836 = ~_1814;
        int _1838 = _1836 + 1;
        _1834 = _1838;
    }
    int _1840 = _1834;
    int _1842 = _1824 * _1818;
    int _1844 = _1842 + _1272;
    bool _1846 = _1778 != 3;
    int _1848 = _681 * _1808;
    int _1850 = _1848 + _1520;
    bool _1852 = uint(_1778) >= 2u;
    bool _1854 = _1156 != 0;
    float _1856 = _870 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _1858 = _1852 ? 0 : 1;
    float _1860 = -_251;
    int _1862 = _1854 ? as_type<int>(_1860) : as_type<int>(_251);
    int _1864 = 2 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1866 = _1864 != 0;
    bool _1868 = !_1816;
    int _1870 = _1868 ? 0 : (-1);
    float _1872 = trunc(_1832);
    float _1874 = precise::max(_1872, 0.0);
    uint _1876 = uint(_1874);
    bool _1878 = uint(_1844) >= uint(_671);
    bool _1880 = !_1350;
    int _1882 = _1880 ? _1850 : (-1);
    float _1884 = float(uint(_1502));
    bool _1886 = !_1866;
    float _1888 = _1886 ? _251 : as_type<float>(_1862);
    int _1890 = _1882 & 3;
    bool _1892 = _1890 != 0;
    int _1894 = ~_1858;
    int _1896 = _1894 + 1;
    int _1898 = _1896 + 1;
    int _1900 = ~_1784;
    int _1902 = _1900 + _1870;
    int _1904 = _1902 + 1;
    float _1906 = as_type<float>(_777) * _1884;
    int _1908 = _1898;
    if (_1846)
    {
        int _1910 = ~_1858;
        int _1912 = _1910 + 1;
        _1908 = _1912;
    }
    int _1914 = _1908;
    int _1916 = _1882 & 3;
    bool _1918 = _1916 != 0;
    int _1920 = _687 * _1904;
    int _1922 = _1920 + _1532;
    bool _1924 = !_1878;
    int _1926 = _1924 ? 0 : (-1);
    float _1928 = trunc(_1906);
    float _1930 = precise::max(_1928, 0.0);
    uint _1932 = uint(_1930);
    bool _1934 = uint(_1890) >= 2u;
    int _1936 = _1918 ? 0 : 1;
    bool _1938 = uint(_1890) > 1u;
    int _1940 = _1934 ? 0 : 1;
    int _1942 = ~_681;
    int _1944 = _1942 + 1;
    bool _1946 = _1890 != 3;
    int _1948 = int(_1736) + int(_1876);
    int _1950 = ~_687;
    int _1952 = _1950 + 1;
    int _1954 = ~_1936;
    int _1956 = _1954 + 1;
    int _1958 = _1956 + 1;
    int _1960 = _1944 * _1948;
    int _1962 = _1960 + _1380;
    int _1964 = ~_1940;
    int _1966 = _1964 + 1;
    int _1968 = _1966 + 1;
    int _1970 = _1958;
    int _1972 = _1968;
    if (!_1938)
    {
        int _1974 = ~_1936;
        int _1976 = _1974 + 1;
        _1970 = _1976;
    }
    int _1978 = _1970;
    int _1980 = _1952 * int(_1932);
    int _1982 = _1980 + _1502;
    int _1984 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _1986 = _1984 != 0;
    float _1988 = as_type<float>(_1932);
    if (_1946)
    {
        int _1990 = ~_1940;
        int _1992 = _1990 + 1;
        _1972 = _1992;
    }
    int _1994 = _1972;
    bool _1996 = uint(_1962) >= uint(_681);
    bool _1998 = !_1360;
    int _2000 = _1998 ? _1922 : (-1);
    bool _2002 = !_1986;
    int _2004 = _2002 ? 0 : 1;
    bool _2006 = !_1996;
    int _2008 = _2006 ? 0 : (-1);
    int _2010 = _2000 & 3;
    bool _2012 = _2010 != 0;
    int _2014 = _2000 & 3;
    bool _2016 = _2014 != 0;
    float _2018 = float(uint(_1982));
    int _2020 = _2012 ? 0 : 1;
    bool _2022 = uint(_2014) > 1u;
    float _2024 = as_type<float>(_777) * _2018;
    int _2026 = ~_2020;
    int _2028 = _2026 + 1;
    int _2030 = _2028 + 1;
    float _2032 = trunc(_2024);
    float _2034 = precise::max(_2032, 0.0);
    uint _2036 = uint(_2034);
    float _2038 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _2040 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    int _2042 = _2030;
    float _2044 = _2024;
    if (!_2022)
    {
        int _2046 = ~_2020;
        int _2048 = _2046 + 1;
        _2042 = _2048;
    }
    int _2050 = _2042;
    float _2052 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2054 = _2052 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _2056 = uint(_2014) >= 2u;
    float _2058 = fma(_878, (*spvDescriptorSet0.vp_c9)._m0[88].w, _2040);
    float _2060 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2062 = _2060 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    int _2064 = _2056 ? 0 : 1;
    float _2066 = 1.0 / _2054;
    bool _2068 = _2014 != 3;
    float _2070 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2072 = _2070 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    int _2074 = int(_1932) + int(_2036);
    int _2076 = ~_2064;
    int _2078 = _2076 + 1;
    int _2080 = _2078 + 1;
    int _2082 = _1952 * _2074;
    int _2084 = _2082 + _1502;
    float _2086 = 1.0 / _2062;
    bool _2088 = _643 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _2090 = isnan(_643);
    bool _2092 = _2088 || _2090;
    bool _2094 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _2096 = _2092 || _2094;
    float _2098 = float(_2096);
    int _2100 = abs(_1994);
    int _2102 = _2080;
    if (_2068)
    {
        int _2104 = ~_2064;
        int _2106 = _2104 + 1;
        _2102 = _2106;
    }
    int _2108 = _2102;
    bool _2110 = uint(_2084) >= uint(_687);
    float _2112 = 1.0 / _2072;
    int _2114 = ~_2100;
    int _2116 = _2114 + 1;
    int _2118 = _2116 + 1;
    bool _2120 = !_2110;
    int _2122 = _2120 ? 0 : (-1);
    bool _2124 = _870 > 0.5;
    int _2126 = ~_1818;
    int _2128 = _2126 + _1926;
    int _2130 = _2128 + 1;
    float _2132 = -_245;
    int _2134 = _2124 ? as_type<int>(_2132) : as_type<int>(_245);
    bool _2136 = _884 != 1;
    int _2138 = _671 * _2130;
    int _2140 = _2138 + _1272;
    int _2142 = abs(_2050);
    int _2144 = ~_2074;
    int _2146 = _2144 + _2122;
    int _2148 = _2146 + 1;
    int _2150 = ~_2142;
    int _2152 = _2150 + 1;
    int _2154 = _2152 + 1;
    int _2156 = abs(_1914);
    int _2158 = _687 * _2148;
    int _2160 = _2158 + _1502;
    float _2162 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    if (!_2136)
    {
        _2044 = _878;
    }
    float _2164 = _2044;
    float _2166 = _2164;
    if (!_2136)
    {
        _1554 = _878;
    }
    float _2168 = _1554;
    float _2170 = _2168;
    if (!_2136)
    {
        _924 = _900;
    }
    float _2172 = _924;
    float _2174 = _2172;
    if (!_2136)
    {
        _1556 = _900;
    }
    float _2176 = _1556;
    float _2178 = _2176;
    if (_2136)
    {
        _2166 = _870;
    }
    float _2180 = _2166;
    if (_2136)
    {
        _2170 = _870;
    }
    float _2182 = _2170;
    if (_2136)
    {
        _2174 = _878;
    }
    float _2184 = _2174;
    float _2186 = _2180 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    if (_2136)
    {
        _2178 = _878;
    }
    float _2188 = _2178;
    bool _2190 = _886 != 2;
    float _2192 = -_1676;
    float _2194 = fma(_2186, 2.0, _2192);
    float _2196 = fma(_2188, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2038);
    float _2198 = -_123;
    float _2200 = fma(_2198, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2194);
    float _2202 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _2204 = !_1360;
    int _2206 = _2204 ? _2160 : (-1);
    float _2208 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _2210 = -_2202;
    float _2212 = fma(_1856, 2.0, _2210);
    float _2214 = _880 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    float _2216 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    if (_2190)
    {
        _1988 = _878;
    }
    float _2218 = _1988;
    float _2220 = fma(_870, (*spvDescriptorSet0.vp_c9)._m0[88].z, _2208);
    float _2222 = _2218;
    if (!_2190)
    {
        _2222 = _870;
    }
    float _2224 = _2222;
    float _2226 = fma(_2182, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2216);
    if (_2190)
    {
        _1558 = _870;
    }
    float _2228 = _1558;
    float _2230 = _2184 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _2232 = _2228;
    if (!_2190)
    {
        _2232 = _900;
    }
    float _2234 = _2232;
    float _2236 = _2224 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    int _2238 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2240 = _2238 != 0;
    float _2242 = fma(_2230, -2.0, _1590);
    float _2244 = -_1476;
    float _2246 = _2244 + 1.0;
    float _2248 = fma(_2236, -2.0, _1608);
    bool _2250 = !_2240;
    float _2252 = _2250 ? _245 : as_type<float>(_2134);
    float _2254 = _2234 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    bool _2256 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2258 = isnan(0.0);
    bool _2260 = _2256 || _2258;
    bool _2262 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2264 = _2260 || _2262;
    float _2266 = _870 * 2.0;
    float _2268 = -_1690;
    float _2270 = fma(_2254, 2.0, _2268);
    float _2272 = _2264 ? _2246 : 0.0;
    float _2274 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[87].z, _2220);
    bool _2276 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2278 = isnan(1.0);
    bool _2280 = _2276 || _2278;
    bool _2282 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2284 = _2280 || _2282;
    float _2286 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _2288 = 1.0 + _2286;
    float _2290 = floor(_2266);
    float _2292 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2226);
    float _2294 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    float _2296 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _2298 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _2300 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _2298;
    float _2302 = 1.0 / _2288;
    float _2304 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _2306 = -_2294;
    float _2308 = fma(_2214, 2.0, _2306);
    float _2310 = fma(_878, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2296);
    float _2312 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2196);
    float _2314 = fma(_870, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2304);
    float _2316 = -_123;
    float _2318 = fma(_2316, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2212);
    float _2320 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2310);
    float _2322 = -_123;
    float _2324 = fma(_2322, (*spvDescriptorSet0.vp_c9)._m0[91].x, _2308);
    float _2326 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2314);
    float _2328 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[87].w, _2058);
    float _2330 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2242);
    float _2332 = -_123;
    float _2334 = fma(_2332, (*spvDescriptorSet0.vp_c9)._m0[86].x, _2270);
    float _2336 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[86].y, _2248);
    float _2338 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2340 = _2338 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    if (_2284)
    {
        float _2342 = _2272 * _2302;
        _133 = _2342;
    }
    float _2344 = _133;
    bool _2346 = _2290 >= 0.0;
    bool _2348 = isnan(_2290);
    bool _2350 = _2346 || _2348;
    bool _2352 = isnan(0.0);
    bool _2354 = _2350 || _2352;
    float _2356 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _2358 = _2356 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2360 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2362 = _2360 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2364 = 1.0 / _2340;
    int _2366 = _2354 ? 0 : 1;
    float _2368 = _2358 * _2066;
    bool _2370 = _2290 > 0.0;
    float _2372 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2374 = _2372 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    int _2376 = ~_1948;
    int _2378 = _2376 + _2008;
    int _2380 = _2378 + 1;
    float _2382 = _2300 * _2112;
    float _2384 = in.m_48.x;
    float _2386 = in.m_48.y;
    float _2388 = in.m_48.z;
    int _2390 = ~_2366;
    int _2392 = _2390 + 1;
    int _2394 = _2392 + 1;
    float _2396 = 1.0 / _2362;
    int _2398 = _681 * _2380;
    int _2400 = _2398 + _1380;
    bool _2402 = !_1780;
    int _2404 = _2402 ? 0 : 1;
    float _2406 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2408 = _643 + _2406;
    int _2410 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16777216;
    bool _2412 = _2410 != 0;
    float _2414 = -_2326;
    float _2416 = _2414 + 1.0;
    bool _2418 = !_1350;
    int _2420 = _2418 ? _2400 : (-1);
    float _2422 = fma(_2382, _2408, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    int _2424 = _2394;
    if (!_2370)
    {
        int _2426 = ~_2366;
        int _2428 = _2426 + 1;
        _2424 = _2428;
    }
    int _2430 = _2424;
    float _2432 = 1.0 / _2374;
    bool _2434 = _1282 >= 0.0;
    bool _2436 = isnan(_1282);
    bool _2438 = _2434 || _2436;
    bool _2440 = isnan(0.0);
    bool _2442 = _2438 || _2440;
    float _2444 = -_2312;
    float _2446 = _2444 + 1.0;
    float _2448 = -_2292;
    float _2450 = _2448 + 1.0;
    int _2452 = _2442 ? 0 : 1;
    float _2454 = -_2274;
    float _2456 = _2454 + 1.0;
    bool _2458 = _1282 > 0.0;
    float _2460 = _900 * 2.0;
    int _2462 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2464 = _2462 != 0;
    float _2466 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2468 = _2466 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _2470 = _2386 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
    float _2472 = _2386 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
    float _2474 = _2386 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
    float _2476 = _2386 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
    float _2478 = floor(_2460);
    float _2480 = fma(_2384, (*spvDescriptorSet0.vp_c10)._m0[14].x, _2470);
    float _2482 = fma(_2384, (*spvDescriptorSet0.vp_c10)._m0[14].y, _2472);
    float _2484 = fma(_2384, (*spvDescriptorSet0.vp_c10)._m0[14].z, _2474);
    float _2486 = fma(_2384, (*spvDescriptorSet0.vp_c10)._m0[14].w, _2476);
    float _2488 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2490 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _2488;
    float _2492 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _2494 = _2492 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    int _2496 = ~_2452;
    int _2498 = _2496 + 1;
    int _2500 = _2498 + 1;
    float _2502 = 1.0 / _2468;
    int _2504 = _2500;
    if (!_2458)
    {
        int _2506 = ~_2452;
        int _2508 = _2506 + 1;
        _2504 = _2508;
    }
    int _2510 = _2504;
    float _2512 = _2490 * _2396;
    bool _2514 = !_2016;
    int _2516 = _2514 ? 0 : 1;
    float _2518 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2520 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _2518;
    bool _2522 = _1890 != 3;
    float _2524 = _2494 * _2086;
    float _2526 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _2528 = _2526 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    bool _2530 = !_1892;
    int _2532 = _2530 ? 0 : 1;
    float _2534 = _2520 * _2364;
    bool _2536 = _1778 != 3;
    float _2538 = _2528 * _2432;
    float _2540 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2542 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _2540;
    bool _2544 = _643 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _2546 = isnan(_643);
    bool _2548 = _2544 || _2546;
    bool _2550 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _2552 = _2548 || _2550;
    float _2554 = float(_2552);
    float _2556 = fma(_2388, (*spvDescriptorSet0.vp_c10)._m0[16].z, _2484);
    bool _2558 = !_2536;
    int _2560 = _2558 ? 0 : (-1);
    float _2562 = _2542 * _2502;
    bool _2564 = !_2522;
    int _2566 = _2564 ? 0 : (-1);
    float _2568 = -_2554;
    float _2570 = _2568 + 1.0;
    int _2572 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _2574 = _2572 != 0;
    int _2576 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _2578 = _2576 != 0;
    int _2580 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _2582 = _2580 != 0;
    float _2584 = fma(_2388, (*spvDescriptorSet0.vp_c10)._m0[16].x, _2480);
    bool _2586 = _2478 >= 0.0;
    bool _2588 = isnan(_2478);
    bool _2590 = _2586 || _2588;
    bool _2592 = isnan(0.0);
    bool _2594 = _2590 || _2592;
    float _2596 = fma(_2388, (*spvDescriptorSet0.vp_c10)._m0[16].y, _2482);
    bool _2598 = _643 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _2600 = isnan(_643);
    bool _2602 = _2598 || _2600;
    bool _2604 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _2606 = _2602 || _2604;
    float _2608 = float(_2606);
    float _2610 = _2556 + (*spvDescriptorSet0.vp_c10)._m0[17].z;
    int _2612 = _2594 ? 0 : 1;
    float _2614 = _2584 + (*spvDescriptorSet0.vp_c10)._m0[17].x;
    bool _2616 = _2478 > 0.0;
    float _2618 = _2608 * _2570;
    bool _2620 = _643 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _2622 = isnan(_643);
    bool _2624 = _2620 || _2622;
    bool _2626 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _2628 = _2624 || _2626;
    float _2630 = float(_2628);
    float _2632 = -_2608;
    float _2634 = _2632 + 1.0;
    bool _2636 = _643 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _2638 = isnan(_643);
    bool _2640 = _2636 || _2638;
    bool _2642 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _2644 = _2640 || _2642;
    float _2646 = float(_2644);
    float _2648 = fma(_2388, (*spvDescriptorSet0.vp_c10)._m0[16].w, _2486);
    float _2650 = _223 * _2610;
    float _2652 = _2630 * _2634;
    float _2654 = -_2630;
    float _2656 = _2654 + 1.0;
    float _2658 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2660 = _643 + _2658;
    float _2662 = -_2646;
    float _2664 = _2662 + 1.0;
    bool _2666 = _643 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _2668 = isnan(_643);
    bool _2670 = _2666 || _2668;
    bool _2672 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _2674 = _2670 || _2672;
    float _2676 = float(_2674);
    float _2678 = _2646 * _2656;
    float _2680 = fma(_2368, _2660, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _2682 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2684 = _643 + _2682;
    float _2686 = _2098 * _2664;
    float _2688 = -_2098;
    float _2690 = _2688 + 1.0;
    bool _2692 = _643 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _2694 = isnan(_643);
    bool _2696 = _2692 || _2694;
    bool _2698 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _2700 = _2696 || _2698;
    float _2702 = float(_2700);
    float _2704 = fma(_2512, _2684, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _2706 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2708 = _643 + _2706;
    float _2710 = _2676 * _2690;
    float _2712 = -_2676;
    float _2714 = _2712 + 1.0;
    float _2716 = -_2702;
    float _2718 = _2716 + 1.0;
    float _2720 = fma(_2524, _2708, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _2722 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2724 = _643 + _2722;
    float _2726 = _2702 * _2714;
    bool _2728 = _643 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _2730 = isnan(_643);
    bool _2732 = _2728 || _2730;
    bool _2734 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _2736 = _2732 || _2734;
    float _2738 = float(_2736);
    float _2740 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2742 = _643 + _2740;
    float _2744 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2746 = _643 + _2744;
    float _2748 = _197 * _2614;
    float _2750 = fma(_2534, _2724, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _2752 = _2738 * _2718;
    float _2754 = fma(_2562, _2746, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _2756 = _2596 + (*spvDescriptorSet0.vp_c10)._m0[17].y;
    float _2758 = -_2738;
    float _2760 = _2758 + 1.0;
    float _2762 = _2422 * _2752;
    float _2764 = fma(_2538, _2742, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _2766 = _207 * _2756;
    float _2768 = _878 + _870;
    float _2770 = fma(_2760, (*spvDescriptorSet0.vp_c9)._m0[159].x, _2762);
    float _2772 = _870 + _900;
    float _2774 = _2766 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2776 = _2766 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2778 = _2766 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2780 = fma(_2680, _2726, _2770);
    float _2782 = fma(_2748, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2774);
    float _2784 = _878 + _900;
    float _2786 = fma(_2748, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2778);
    float _2788 = _878 + (-0.5);
    int _2790 = _1882 >> 31;
    float _2792 = fma(_2704, _2710, _2780);
    float _2794 = fma(_2748, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2776);
    float _2796 = _870 + (-0.5);
    int _2798 = _2790 & 3;
    float _2800 = fma(_2720, _2686, _2792);
    float _2802 = fma(_2650, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2794);
    float _2804 = _2648 + (*spvDescriptorSet0.vp_c10)._m0[17].w;
    int _2806 = _1882 + _2798;
    float _2808 = fma(_2650, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2782);
    float _2810 = fma(_2650, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2786);
    float _2812 = fma(_2804, (*spvDescriptorSet0.vp_c8)._m0[25].w, _2802);
    float _2814 = _2768 + (-1.0);
    int _2816 = _2806 >> 2;
    float _2818 = _1012 + 0.5;
    float _2820 = fma(_2804, (*spvDescriptorSet0.vp_c8)._m0[24].w, _2808);
    float _2822 = fma(_2804, (*spvDescriptorSet0.vp_c8)._m0[26].w, _2810);
    int _2824 = _2816 << 4;
    int _2826 = _2824 + 656;
    float _2828 = fma(_2814, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _2830 = fma(_2750, _2678, _2800);
    float _2832 = _1772 + (-0.5);
    float _2834 = fma(_2818, (*spvDescriptorSet0.vp_c9)._m0[95].x, _2324);
    float _2836 = _2252 + 0.5;
    uint _2838 = uint(int(uint(_2826) >> uint(2)));
    uint _2840 = uint(int(uint(int(_2838)) >> uint(2)));
    int _2842 = int(_2838) & 3;
    float _2844 = (*spvDescriptorSet0.vp_c9)._m0[int(_2840)][_2842];
    int _2846 = int(_2838) + 1;
    uint _2848 = uint(int(uint(_2846) >> uint(2)));
    int _2850 = _2846 & 3;
    float _2852 = (*spvDescriptorSet0.vp_c9)._m0[int(_2848)][_2850];
    float _2854 = -_2832;
    float _2856 = -_1730;
    float _2858 = fma(_2854, (*spvDescriptorSet0.vp_c9)._m0[95].y, _2856);
    float _2860 = _1888 + (-0.5);
    float _2862 = fma(_2764, _2652, _2830);
    float _2864 = fma(_2836, (*spvDescriptorSet0.vp_c9)._m0[80].x, _2318);
    float _2866 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2868 = -_2860;
    float _2870 = -_1632;
    float _2872 = fma(_2868, (*spvDescriptorSet0.vp_c9)._m0[80].y, _2870);
    float _2874 = _2812 + (*spvDescriptorSet0.vp_c10)._m0[21].y;
    float _2876 = fma(_1744, _1772, _2858);
    float _2878 = -_1616;
    float _2880 = _2878 + 1.0;
    int _2882 = _2826 + 8;
    uint _2884 = uint(int(uint(_2882) >> uint(2)));
    uint _2886 = uint(int(uint(int(_2884)) >> uint(2)));
    int _2888 = int(_2884) & 3;
    float _2890 = (*spvDescriptorSet0.vp_c9)._m0[int(_2886)][_2888];
    int _2892 = int(_2884) + 1;
    uint _2894 = uint(int(uint(_2892) >> uint(2)));
    int _2896 = _2892 & 3;
    float _2898 = (*spvDescriptorSet0.vp_c9)._m0[int(_2894)][_2896];
    float _2900 = _2820 + (*spvDescriptorSet0.vp_c10)._m0[21].x;
    float _2902 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2904 = _2874 + _2902;
    float _2906 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2908 = fma(_2754, _2618, _2862);
    float _2910 = -_2880;
    float _2912 = fma(_2910, _1012, _2834);
    float _2914 = _2822 + (*spvDescriptorSet0.vp_c10)._m0[21].z;
    float _2916 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2918 = _2900 + _2916;
    float _2920 = _2904 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2922 = fma(_2554, (*spvDescriptorSet0.vp_c9)._m0[166].x, _2908);
    float _2924 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2926 = _2914 + _2924;
    out.m_70.x = _2912;
    out.m_70.y = _2876;
    float _2928 = fma(_2918, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2920);
    float _2930 = _2866 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2932 = _1128 + (-0.5);
    int _2934 = abs(_1978);
    float _2936 = fma(_2926, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2928);
    int _2938 = ~_2612;
    int _2940 = _2938 + 1;
    int _2942 = _2940 + 1;
    float _2944 = -_2930;
    float _2946 = -_2330;
    float _2948 = fma(_2944, _2932, _2946);
    float _2950 = _2906 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    int _2952 = _2942;
    if (!_2616)
    {
        int _2954 = ~_2612;
        int _2956 = _2954 + 1;
        _2952 = _2956;
    }
    int _2958 = _2952;
    float _2960 = -_2320;
    float _2962 = _2960 + 1.0;
    float _2964 = -_2416;
    float _2966 = fma(_2252, _2964, _2864);
    float _2968 = trunc((*spvDescriptorSet0.vp_c9)._m0[90].z);
    int _2970 = int(_2968);
    float _2972 = _1776 + 0.5;
    int _2974 = abs(_2532);
    float _2976 = fma(_1128, _2446, _2948);
    bool _2978 = _2936 >= 0.0;
    float _2980 = fma(_2950, _2972, _2200);
    int _2982 = ~_2934;
    int _2984 = _2982 + 1;
    int _2986 = _2984 + 1;
    float _2988 = fma(_1888, _2962, _2872);
    float _2990 = -_2450;
    float _2992 = fma(_1776, _2990, _2980);
    bool _2994 = !_2574;
    int _2996 = _2994 ? 0 : 1;
    out.m_72.x = _2922;
    float _2998 = float(_2958);
    float _3000 = float(_2430);
    int _3002 = _2986 * as_type<int>(_2852);
    int _3004 = ~_2974;
    int _3006 = _3004 + 1;
    int _3008 = _3006 + 1;
    out.m_74.x = _2966;
    out.m_74.y = _2988;
    out.m_74.z = _2992;
    out.m_74.w = _2976;
    float _3010 = as_type<float>(_2974);
    if (_2978)
    {
        _3010 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3012 = _3010;
    int _3014 = ~_2970;
    int _3016 = _3014 + 1;
    int _3018 = _3008 * as_type<int>(_2844);
    int _3020 = _3018 + _3002;
    int _3022 = abs(_2004);
    int _3024 = as_type<int>(_3012);
    if (_2978)
    {
        float _3026 = _3012 * 5.0;
        _3024 = as_type<int>(_3026);
    }
    int _3028 = _3024;
    int _3030 = abs(_2404);
    int _3032 = _2118 * as_type<int>(_2890);
    int _3034 = _3032 + _3020;
    int _3036 = abs(_2516);
    if (_2978)
    {
        out.m_55.x = 0.0;
    }
    bool _3038 = _671 == 0;
    int _3040 = abs(_2970);
    if (_2978)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _9560 = as_type<float>(_3028);
        out.gl_Position.z = _9560;
    }
    float _3042 = float(uint(_2970));
    int _3044 = abs(_2566);
    float _3046 = 1.0 / _3042;
    int _3048 = abs(_2996);
    float _3050 = float(uint(_3040));
    bool _3052 = !_3038;
    int _3054 = _3052 ? _2140 : (-1);
    float _3056 = float(_3048);
    int _3058 = ~_3044;
    int _3060 = _3058 + 1;
    int _3062 = _3060 + 1;
    float _3064 = 1.0 / _3050;
    int _3066 = _1748 >> 31;
    float _3068 = _3056 * _2998;
    int _3070 = ~_3022;
    int _3072 = _3070 + 1;
    int _3074 = _3072 + 1;
    int _3076 = _3062 * as_type<int>(_2898);
    int _3078 = _3076 + _3034;
    int _3080 = _2000 >> 31;
    int _3082 = _3066 & 3;
    int _3084 = _3078 * _3074;
    int _3086 = _3080 & 3;
    float _3088 = _2904 * _2904;
    int _3090 = _1748 + _3082;
    int _3092 = _2420 * _3022;
    int _3094 = _3092 + _3084;
    int _3096 = _2000 + _3086;
    float _3098 = fma(_2918, _2918, _3088);
    int _3100 = _3090 >> 2;
    float _3102 = in.m_76.x;
    float _3104 = in.m_76.y;
    float _3106 = in.m_76.z;
    int _3108 = as_type<int>(_3046) + (-2);
    float _3110 = fma(_2926, _2926, _3098);
    int _3112 = _3096 >> 2;
    int _3114 = _3100 << 4;
    int _3116 = _3114 + 368;
    float _3118 = float(uint(_3094));
    float _3120 = rsqrt(_3110);
    int _3122 = _3112 << 4;
    int _3124 = _3122 + 800;
    uint _3126 = uint(int(uint(_3116) >> uint(2)));
    uint _3128 = uint(int(uint(int(_3126)) >> uint(2)));
    int _3130 = int(_3126) & 3;
    float _3132 = (*spvDescriptorSet0.vp_c9)._m0[int(_3128)][_3130];
    int _3134 = int(_3126) + 1;
    uint _3136 = uint(int(uint(_3134) >> uint(2)));
    int _3138 = _3134 & 3;
    float _3140 = (*spvDescriptorSet0.vp_c9)._m0[int(_3136)][_3138];
    int _3142 = abs(_3094);
    float _3144 = as_type<float>(_3108) * _3118;
    int _3146 = as_type<int>(_3064) + (-2);
    float _3148 = float(uint(_3142));
    bool _3150 = !_2578;
    int _3152 = _3150 ? 0 : 1;
    uint _3154 = uint(int(uint(_3124) >> uint(2)));
    uint _3156 = uint(int(uint(int(_3154)) >> uint(2)));
    int _3158 = int(_3154) & 3;
    float _3160 = (*spvDescriptorSet0.vp_c9)._m0[int(_3156)][_3158];
    int _3162 = int(_3154) + 1;
    uint _3164 = uint(int(uint(_3162) >> uint(2)));
    int _3166 = _3162 & 3;
    float _3168 = (*spvDescriptorSet0.vp_c9)._m0[int(_3164)][_3166];
    float _3170 = trunc(_3144);
    float _3172 = precise::max(_3170, 0.0);
    uint _3174 = uint(_3172);
    float _3176 = as_type<float>(_3146) * _3148;
    int _3178 = abs(_3152);
    int _3180 = ~_3040;
    int _3182 = _3180 + 1;
    float _3184 = _2904 * _3120;
    float _3186 = float(_3178);
    int _3188 = _3116 + 8;
    uint _3190 = uint(int(uint(_3188) >> uint(2)));
    uint _3192 = uint(int(uint(int(_3190)) >> uint(2)));
    int _3194 = int(_3190) & 3;
    float _3196 = (*spvDescriptorSet0.vp_c9)._m0[int(_3192)][_3194];
    int _3198 = int(_3190) + 1;
    uint _3200 = uint(int(uint(_3198) >> uint(2)));
    int _3202 = _3198 & 3;
    float _3204 = (*spvDescriptorSet0.vp_c9)._m0[int(_3200)][_3202];
    float _3206 = trunc(_3176);
    float _3208 = precise::max(_3206, 0.0);
    uint _3210 = uint(_3208);
    float _3212 = _2918 * _3120;
    float _3214 = -_3184;
    float _3216 = fma(_3214, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2904);
    float _3218 = _3068 * (-2.0);
    float _3220 = _3186 * _3000;
    float _3222 = -_3212;
    float _3224 = fma(_3222, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2918);
    float _3226 = _3216 * _3216;
    int _3228 = _3016 * int(_3174);
    int _3230 = _3228 + _3094;
    float _3232 = fma(_2828, _3218, _2828);
    float _3234 = fma(_3224, _3224, _3226);
    float _3236 = fma(_3218, _3102, _3102);
    int _3238 = abs(_1840);
    int _3240 = _3124 + 8;
    uint _3242 = uint(int(uint(_3240) >> uint(2)));
    uint _3244 = uint(int(uint(int(_3242)) >> uint(2)));
    int _3246 = int(_3242) & 3;
    float _3248 = (*spvDescriptorSet0.vp_c9)._m0[int(_3244)][_3246];
    int _3250 = int(_3242) + 1;
    uint _3252 = uint(int(uint(_3250) >> uint(2)));
    int _3254 = _3250 & 3;
    float _3256 = (*spvDescriptorSet0.vp_c9)._m0[int(_3252)][_3254];
    float _3258 = float(uint(_3230));
    float _3260 = fma(_2796, (*spvDescriptorSet0.vp_c9)._m0[196].x, _3236);
    int _3262 = _3182 * int(_3210);
    int _3264 = _3262 + _3142;
    float _3266 = as_type<float>(_3108) * _3258;
    int _3268 = ~_3238;
    int _3270 = _3268 + 1;
    int _3272 = _3270 + 1;
    float _3274 = fma(_3232, _2344, _3260);
    float _3276 = float(uint(_3264));
    int _3278 = ~_3030;
    int _3280 = _3278 + 1;
    int _3282 = _3280 + 1;
    float _3284 = trunc(_3266);
    float _3286 = precise::max(_3284, 0.0);
    uint _3288 = uint(_3286);
    float _3290 = as_type<float>(_3146) * _3276;
    int _3292 = _3272 * as_type<int>(_3140);
    int _3294 = ~_3036;
    int _3296 = _3294 + 1;
    int _3298 = _3296 + 1;
    float _3300 = trunc(_3290);
    float _3302 = precise::max(_3300, 0.0);
    uint _3304 = uint(_3302);
    int _3306 = _3282 * as_type<int>(_3132);
    int _3308 = _3306 + _3292;
    int _3310 = ~_2970;
    int _3312 = _3310 + 1;
    int _3314 = _2154 * as_type<int>(_3168);
    int _3316 = ~_2156;
    int _3318 = _3316 + 1;
    int _3320 = _3318 + 1;
    int _3322 = int(_3174) + int(_3288);
    int _3324 = _3298 * as_type<int>(_3160);
    int _3326 = _3324 + _3314;
    int _3328 = abs(_2560);
    int _3330 = _3320 * as_type<int>(_3196);
    int _3332 = _3330 + _3308;
    int _3334 = ~_3040;
    int _3336 = _3334 + 1;
    int _3338 = _3312 * _3322;
    int _3340 = _3338 + _3094;
    int _3342 = int(_3210) + int(_3304);
    bool _3344 = !_2464;
    int _3346 = _3344 ? 0 : 1;
    int _3348 = ~_3328;
    int _3350 = _3348 + 1;
    int _3352 = _3350 + 1;
    int _3354 = _3336 * _3342;
    int _3356 = _3354 + _3142;
    bool _3358 = uint(_3340) >= uint(_2970);
    int _3360 = abs(_2108);
    int _3362 = _3352 * as_type<int>(_3204);
    int _3364 = _3362 + _3332;
    bool _3366 = !_3358;
    int _3368 = _3366 ? 0 : (-1);
    bool _3370 = _2014 != 3;
    bool _3372 = !_2412;
    int _3374 = _3372 ? 0 : 1;
    bool _3376 = uint(_3356) >= uint(_3040);
    int _3378 = ~_3360;
    int _3380 = _3378 + 1;
    int _3382 = _3380 + 1;
    int _3384 = _3094 ^ _2970;
    bool _3386 = !_3370;
    int _3388 = _3386 ? 0 : (-1);
    int _3390 = _3382 * as_type<int>(_3248);
    int _3392 = _3390 + _3326;
    int _3394 = ~_3322;
    int _3396 = _3394 + _3368;
    int _3398 = _3396 + 1;
    bool _3400 = !_3376;
    int _3402 = _3400 ? 0 : (-1);
    uint _3404 = uint(int(uint(_3384) >> uint(31)));
    int _3406 = abs(_3388);
    int _3408 = abs(_3346);
    bool _3410 = _2970 == 0;
    bool _3412 = _2970 == 0;
    int _3414 = _2970 * _3398;
    int _3416 = _3414 + _3094;
    int _3418 = ~_3402;
    int _3420 = _3342 + _3418;
    int _3422 = _3420 + 1;
    float _3424 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    int _3426 = ~int(_3404);
    int _3428 = _3426 + 1;
    int _3430 = abs(_3374);
    int _3432 = ~_3408;
    int _3434 = _3432 + 1;
    int _3436 = _3434 + 1;
    int _3438 = _3422 ^ _3428;
    int _3440 = ~_3406;
    int _3442 = _3440 + 1;
    int _3444 = _3442 + 1;
    int _3446 = _3364 * _3436;
    int _3448 = ~_3428;
    int _3450 = _3448 + _3438;
    int _3452 = _3450 + 1;
    int _3454 = ~_3430;
    int _3456 = _3454 + 1;
    int _3458 = _3456 + 1;
    int _3460 = _3444 * as_type<int>(_3256);
    int _3462 = _3460 + _3392;
    bool _3464 = !_3410;
    int _3466 = _3464 ? _3416 : (-1);
    int _3468 = _3054 * _3408;
    int _3470 = _3468 + _3446;
    bool _3472 = !_3412;
    int _3474 = _3472 ? _3452 : (-1);
    int _3476 = _3462 * _3458;
    float _3478 = float(_3466);
    float _3480 = _2162 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _3482 = float(_3474);
    float _3484 = _3424 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _3486 = _1164 + (-0.5);
    float _3488 = fma(_3480, _3478, _2334);
    float _3490 = _1168 + 0.5;
    float _3492 = -_2336;
    float _3494 = fma(_3484, _3482, _3492);
    int _3496 = _2206 * _3430;
    int _3498 = _3496 + _3476;
    float _3500 = -_2328;
    float _3502 = _3500 + 1.0;
    float _3504 = fma(_3480, _3490, _3488);
    float _3506 = -_3484;
    float _3508 = fma(_3506, _3486, _3494);
    float _3510 = _2926 * _3120;
    float _3512 = float(_3470);
    float _3514 = -_2456;
    float _3516 = fma(_1168, _3514, _3504);
    float _3518 = float(_3498);
    float _3520 = fma(_1164, _3502, _3508);
    float _3522 = -_3510;
    float _3524 = fma(_3522, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2926);
    out.m_78.x = _3512;
    float _3526 = fma(_3524, _3524, _3234);
    out.m_78.w = _3518;
    bool _3528 = !_2582;
    int _3530 = _3528 ? 0 : 1;
    out.m_80.x = _3516;
    out.m_80.y = _3520;
    float _3532 = _3106;
    if (_2978)
    {
        return out;
    }
    float _3534 = -_3184;
    float _3536 = fma(_3534, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2874);
    float _3538 = -_3212;
    float _3540 = fma(_3538, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2900);
    float _3542 = -_3510;
    float _3544 = fma(_3542, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2914);
    int _3546 = abs(_3530);
    float _3548 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3550 = _3536 + _3548;
    float _3552 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3554 = _3540 + _3552;
    float _3556 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3558 = _3544 + _3556;
    float _3560 = _2784 + (-1.0);
    float _3562 = _3550 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _3564 = _3220 * (-2.0);
    float _3566 = float(_2510);
    float _3568 = fma(_3560, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _3570 = fma(_3554, (*spvDescriptorSet0.vp_c8)._m0[28].x, _3562);
    float _3572 = float(_3546);
    float _3574 = _2772 + (-1.0);
    float _3576 = _3274 * 0.15915493667125701904296875;
    float _3578 = fma(_3558, (*spvDescriptorSet0.vp_c8)._m0[28].z, _3570);
    float _3580 = fma(_3564, _3104, _3104);
    float _3582 = fma(_3568, _3564, _3568);
    float _3584 = _3572 * _3566;
    float _3586 = sqrt(_3526);
    bool _3588 = _3578 >= 0.0;
    float _3590 = fma(_2788, (*spvDescriptorSet0.vp_c9)._m0[196].y, _3580);
    float _3592 = _3584 * (-2.0);
    float _3594 = _900 + (-0.5);
    float _3596 = fma(_3582, _2344, _3590);
    float _3598 = fma(_3574, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _3600 = fma(_3592, _3106, _3106);
    float _3602 = _3596 * 0.15915493667125701904296875;
    float _3604 = _3576 * 6.283185482025146484375;
    float _3606 = sin(_3604);
    float _3608 = fma(_3598, _3592, _3598);
    float _3610 = fma(_3594, (*spvDescriptorSet0.vp_c9)._m0[196].z, _3600);
    float _3612 = _3536;
    if (_3588)
    {
        _3532 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3614 = _3532;
    int _3616 = as_type<int>(_3614);
    if (_3588)
    {
        out.m_55.x = 0.0;
    }
    float _3618 = fma(_3608, _2344, _3610);
    float _3620 = _3576 * 6.283185482025146484375;
    float _3622 = cos(_3620);
    if (_3588)
    {
        float _3624 = _3614 * 5.0;
        _3616 = as_type<int>(_3624);
    }
    int _3626 = _3616;
    float _3628 = _3618 * 0.15915493667125701904296875;
    if (_3588)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _10414 = as_type<float>(_3626);
        out.gl_Position.z = _10414;
    }
    float _3630 = _3602 * 6.283185482025146484375;
    float _3632 = sin(_3630);
    float _3634 = _3602 * 6.283185482025146484375;
    float _3636 = cos(_3634);
    if (_3588)
    {
        return out;
    }
    float _3638 = _3628 * 6.283185482025146484375;
    float _3640 = cos(_3638);
    float _3642 = _3120 * _3586;
    float _3644 = _387 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _3646 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _251);
    float _3648 = _3622 * _3636;
    float _3650 = _3622 * _3632;
    float _3652 = _3642 * _3644;
    float _3654 = _3606 * _3636;
    float _3656 = _3628 * 6.283185482025146484375;
    float _3658 = sin(_3656);
    float _3660 = _251 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3662 = _3646 * _3652;
    float _3664 = _385 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _3666 = _3606 * _3632;
    float _3668 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _245);
    float _3670 = _3642 * _3664;
    float _3672 = _3622 * _3640;
    float _3674 = _3606 * _3640;
    float _3676 = _3636 * _3640;
    float _3678 = _3668 * _3670;
    float _3680 = _3672 * _3662;
    float _3682 = _3642 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _3684 = _3682 * 0.5;
    float _3686 = _3632 * _3640;
    float _3688 = fma(_3658, _3648, _3666);
    float _3690 = -_3654;
    float _3692 = fma(_3658, _3650, _3690);
    float _3694 = -_3662;
    float _3696 = _3658 * _3694;
    float _3698 = -_3650;
    float _3700 = fma(_3658, _3654, _3698);
    float _3702 = fma(_3688, _3678, _3680);
    float _3704 = _3674 * _3662;
    float _3706 = fma(_3676, _3678, _3696);
    float _3708 = fma(_3658, _3666, _3648);
    float _3710 = fma(_3692, _3684, _3702);
    float _3712 = fma(_3700, _3678, _3704);
    float _3714 = fma(_3686, _3684, _3706);
    float _3716 = _3692 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3718 = _3710 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3720 = _3710 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3722 = fma(_3708, _3684, _3712);
    float _3724 = _3710 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3726 = fma(_3714, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3718);
    float _3728 = fma(_3714, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3720);
    float _3730 = _3688 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3732 = fma(_3714, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3724);
    float _3734 = fma(_3722, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3726);
    float _3736 = fma(_3722, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3728);
    float _3738 = fma(_3660, _3660, 1.0);
    float _3740 = fma(_3676, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3730);
    float _3742 = _3734 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _3744 = _3736 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _3746 = fma(_3686, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3716);
    float _3748 = _2900 + _3742;
    float _3750 = _2914 + _3744;
    float _3752 = _3688 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3754 = _3688 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3756 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _3758 = _3748 + _3756;
    float _3760 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _3762 = _3750 + _3760;
    float _3764 = fma(_3676, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3752);
    float _3766 = _3672 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3768 = _3758 * _3758;
    float _3770 = _3762 * _3762;
    float _3772 = fma(_3676, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3754);
    float _3774 = -_3658;
    float _3776 = fma(_3774, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3766);
    float _3778 = fma(_3722, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3732);
    float _3780 = _3768 + _3770;
    float _3782 = rsqrt(_3738);
    float _3784 = _3672 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3786 = _3778 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _3788 = _3672 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3790 = _3692 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3792 = -_3658;
    float _3794 = fma(_3792, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3784);
    float _3796 = _3692 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3798 = _2874 + _3786;
    float _3800 = sqrt(_3780);
    float _3802 = -_3658;
    float _3804 = fma(_3802, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3788);
    float _3806 = fma(_3686, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3796);
    float _3808 = fma(_3686, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3790);
    bool _3810 = _3800 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3812 = _3686;
    float _3814 = _3778;
    float _3816 = _3788;
    float _3818 = _3796;
    float _3820 = _3754;
    if (!_3810)
    {
        _3812 = _3770;
    }
    float _3822 = _3812;
    float _3824 = _3822;
    if (!_3810)
    {
        _3814 = _3768;
    }
    float _3826 = _3814;
    float _3828 = _3826;
    if (!_3810)
    {
        _3816 = _3748;
    }
    float _3830 = _3816;
    float _3832 = _3830;
    if (!_3810)
    {
        _3818 = _3750;
    }
    float _3834 = _3818;
    float _3836 = _3834;
    if (!_3810)
    {
        _3820 = _3798;
    }
    float _3838 = _3820;
    bool _3840 = !_3810;
    float _3842 = _3838;
    if (!_3840)
    {
        float _3844 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3846 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _3848 = _3800 + _3846;
        float _3850 = rsqrt(_3780);
        float _3852 = _3848 * _3844;
        float _3854 = _3798 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3856 = _3852 * 0.15915493667125701904296875;
        float _3858 = _3856 * 6.283185482025146484375;
        float _3860 = sin(_3858);
        float _3862 = _3856 * 6.283185482025146484375;
        float _3864 = cos(_3862);
        float _3866 = fma(_3860, _3854, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _3868 = _3850 * _3866;
        float _3870 = _3864 + (-1.0);
        float _3872 = fma(_3758, _3868, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _3874 = fma(_3762, _3868, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _3876 = _3870 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3878 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _3880 = _3872 + _3878;
        float _3882 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _3884 = _3874 + _3882;
        float _3886 = fma(_3798, _3864, _3876);
        float _3888 = _3880 * _3880;
        float _3890 = _3884 * _3884;
        _3842 = _3886;
        _3828 = _3888;
        _3824 = _3890;
        _3832 = _3872;
        _3836 = _3874;
    }
    float _3892 = _3842;
    float _3894 = _3828;
    float _3896 = _3824;
    float _3898 = _3832;
    float _3900 = _3836;
    float _3902 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _3904 = _3892 + _3902;
    float _3906 = fma(_3674, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3776);
    float _3908 = fma(_3674, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3794);
    float _3910 = fma(_3674, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3804);
    float _3912 = fma(_3904, _3904, _3894);
    float _3914 = fma(_3708, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3806);
    float _3916 = fma(_3708, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3808);
    float _3918 = fma(_3708, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3746);
    float _3920 = _3912 + _3896;
    float _3922 = _3660 * _3782;
    float _3924 = fma(_3700, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3764);
    float _3926 = fma(_3700, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3772);
    float _3928 = _245 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3930 = _3660 * _3906;
    float _3932 = _3660 * _3908;
    float _3934 = fma(_3700, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3740);
    float _3936 = _3660 * _3910;
    float _3938 = -_3914;
    float _3940 = _3922 * _3938;
    float _3942 = -_3916;
    float _3944 = _3922 * _3942;
    float _3946 = -_3918;
    float _3948 = _3922 * _3946;
    float _3950 = sqrt(_3920);
    float _3952 = fma(_3928, _3924, _3930);
    float _3954 = fma(_3928, _3926, _3932);
    float _3956 = fma(_3928, _3934, _3936);
    float _3958 = fma(_3782, _3906, _3940);
    float _3960 = fma(_3782, _3908, _3944);
    float _3962 = fma(_3782, _3910, _3948);
    float _3964 = _3914 + _3952;
    float _3966 = _3916 + _3954;
    float _3968 = _3918 + _3956;
    out.m_82.x = _3924;
    out.m_82.y = _3926;
    out.m_82.z = _3934;
    out.m_84.x = _3958;
    out.m_84.y = _3960;
    out.m_84.z = _3962;
    bool _3970 = _3950 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _3972 = isnan(_3950);
    bool _3974 = _3970 || _3972;
    bool _3976 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _3978 = _3974 || _3976;
    out.m_86.x = _3964;
    out.m_86.y = _3966;
    out.m_86.z = _3968;
    float _3980 = _3954;
    if (!_3978)
    {
        _3980 = 1.0;
    }
    float _3982 = _3980;
    bool _3984 = !_3978;
    float _3986 = _3982;
    if (!_3984)
    {
        bool _3988 = _3950 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _3990 = isnan(_3950);
        bool _3992 = _3988 || _3990;
        bool _3994 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _3996 = _3992 || _3994;
        if (!_3996)
        {
            float _3998 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _4000 = _3950 + _3998;
            float _4002 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _4004 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _4002;
            float _4006 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _4008 = _4006 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _4010 = 1.0 / _4004;
            float _4012 = _4000 * _4010;
            float _4014 = fma(_4012, _4008, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _3986 = _4014;
            _4016 = true;
        }
        else
        {
            bool _4018 = _3950 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _4020 = isnan(_3950);
            bool _4022 = _4018 || _4020;
            bool _4024 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _4026 = _4022 || _4024;
            if (!_4026)
            {
                float _4028 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _4030 = _3950 + _4028;
                float _4032 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _4034 = _4032 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _4036 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _4038 = _4036 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _4040 = 1.0 / _4034;
                float _4042 = _4030 * _4040;
                float _4044 = fma(_4042, _4038, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _3986 = _4044;
                _4016 = true;
            }
            else
            {
                _3986 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _4016 = false;
    float _4046 = _3986;
    float _4048 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _4050 = _3892 + _4048;
    float _4052 = _3536 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _4054 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _4056 = _3898 + _4054;
    float _4058 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _4060 = _3900 + _4058;
    float _4062 = fma(_4050, _4046, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _4064 = fma(_3540, (*spvDescriptorSet0.vp_c8)._m0[11].x, _4052);
    float _4066 = fma(_4056, _4046, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _4068 = fma(_4060, _4046, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _4070 = -_2874;
    float _4072 = _4070 + _4062;
    float _4074 = fma(_3544, (*spvDescriptorSet0.vp_c8)._m0[11].z, _4064);
    float _4076 = -_2900;
    float _4078 = _4076 + _4066;
    float _4080 = _3536 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _4082 = _4072 * _4072;
    float _4084 = _4074 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _4086 = -_2914;
    float _4088 = _4086 + _4068;
    float _4090 = fma(_3540, (*spvDescriptorSet0.vp_c8)._m0[10].x, _4080);
    float _4092 = fma(_4078, _4078, _4082);
    float _4094 = 1.0 / _4084;
    float _4096 = fma(_3544, (*spvDescriptorSet0.vp_c8)._m0[10].z, _4090);
    float _4098 = fma(_4088, _4088, _4092);
    float _4100 = _4096 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _4102 = sqrt(_4098);
    float _4104 = _4100 + _4084;
    bool _4106 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _4108 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _4110 = _4106 || _4108;
    bool _4112 = isnan(0.5);
    bool _4114 = _4110 || _4112;
    float _4116 = _4104 * _4094;
    float _4118 = _4116 * 0.5;
    float _4120 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _4122 = fma(_4118, (*spvDescriptorSet0.vp_c8)._m0[30].w, _4120);
    bool _4124 = _4102 > 0.0;
    float _4126 = 1.0 / _4122;
    bool _4128 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _4130 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _4132 = _4128 || _4130;
    bool _4134 = isnan(0.5);
    bool _4136 = _4132 || _4134;
    float _4138 = _4118;
    float _4140 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    float _4142 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _4144 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    float _4146 = _4078;
    if (!_4124)
    {
        _4138 = _4066;
    }
    float _4148 = _4138;
    float _4150 = _4148;
    float _4152 = _4148;
    if (!_4124)
    {
        _4140 = _4062;
    }
    float _4154 = _4140;
    float _4156 = _4154;
    if (!_4124)
    {
        _4142 = _4068;
    }
    float _4158 = _4142;
    bool _4160 = !_4124;
    float _4162 = _4158;
    float _4164 = _4126;
    if (!_4160)
    {
        float _4166 = _275 * _275;
        float _4168 = fma(_273, _273, _4166);
        float _4170 = fma(_277, _277, _4168);
        float _4172 = rsqrt(_4098);
        float _4174 = sqrt(_4170);
        float _4176 = _4078 * _4172;
        float _4178 = _4072 * _4172;
        float _4180 = _4088 * _4172;
        bool _4182 = _4174 > 0.0;
        float _4184 = _4172;
        float _4186 = _4174;
        _4146 = _4176;
        if (!_4182)
        {
            _4150 = _4066;
        }
        float _4188 = _4150;
        _4152 = _4188;
        if (!_4182)
        {
            _4184 = _4062;
        }
        float _4190 = _4184;
        _4156 = _4190;
        if (!_4182)
        {
            _4186 = _4068;
        }
        float _4192 = _4186;
        bool _4194 = !_4182;
        _4162 = _4192;
        if (!_4194)
        {
            float _4196 = rsqrt(_4170);
            float _4198 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _4200 = _275 * _4196;
            float _4202 = _273 * _4196;
            float _4204 = _277 * _4196;
            float _4206 = _4178 * _4200;
            float _4208 = fma(_4176, _4202, _4206);
            float _4210 = _4198 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _4212 = fma(_4180, _4204, _4208);
            float _4214 = _4212 * _4210;
            float _4216 = fma(_273, _4214, _4066);
            float _4218 = fma(_275, _4214, _4062);
            float _4220 = fma(_277, _4214, _4068);
            _4152 = _4216;
            _4156 = _4218;
            _4162 = _4220;
            _4144 = _4214;
        }
    }
    float _4222 = _4152;
    float _4224 = _4156;
    float _4226 = _4162;
    float _4228 = _4144;
    float _4230 = _4146;
    float _4232 = -_3212;
    float _4234 = fma(_4232, (*spvDescriptorSet0.vp_c9)._m0[18].w, _4222);
    float _4236 = -_3184;
    float _4238 = fma(_4236, (*spvDescriptorSet0.vp_c9)._m0[18].w, _4224);
    float _4240 = -_3510;
    float _4242 = fma(_4240, (*spvDescriptorSet0.vp_c9)._m0[18].w, _4226);
    float _4244 = _4238;
    float _4246 = _4234;
    float _4248 = _4242;
    float _4250 = _4228;
    float _4252 = _4230;
    if (_4114)
    {
        _283 = 1.0;
    }
    float _4254 = _283;
    float _4256 = _4254;
    if (!_4136)
    {
        float _4258 = _3550 * _3550;
        float _4260 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _4262 = -_2914;
        float _4264 = _4262 + _4226;
        float _4266 = -_2900;
        float _4268 = _4266 + _4222;
        float _4270 = fma(_3554, _3554, _4258);
        float _4272 = fma(_3558, _3558, _4270);
        float _4274 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _4276 = sqrt(_4272);
        float _4278 = 1.0 / _3642;
        float _4280 = _4274 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _4282 = precise::min(_4276, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _4284 = _4282 * _4260;
        float _4286 = _4284 * _4278;
        float _4288 = -_2874;
        float _4290 = _4288 + _4224;
        float _4292 = _4280 * _4286;
        float _4294 = _4264 * _4286;
        float _4296 = fma(_4290, _4292, _3536);
        float _4298 = fma(_4268, _4292, _3540);
        float _4300 = fma(_4280, _4294, _3544);
        _4244 = _4296;
        _4246 = _4298;
        _4248 = _4300;
    }
    float _4302 = _4244;
    float _4304 = _4246;
    float _4306 = _4248;
    if (_4114)
    {
        _3612 = 1.0;
    }
    float _4308 = _3612;
    float _4310 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _4312 = _4126 * _4310;
    float _4314 = _4308;
    if (!_4114)
    {
        float _4316 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _4318 = _4316 * 0.15915493667125701904296875;
        float _4320 = _4318 * 6.283185482025146484375;
        float _4322 = cos(_4320);
        float _4324 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _4326 = _4324 * 0.15915493667125701904296875;
        float _4328 = _4318 * 6.283185482025146484375;
        float _4330 = sin(_4328);
        float _4332 = 1.0 / _4322;
        float _4334 = _4326 * 6.283185482025146484375;
        float _4336 = cos(_4334);
        float _4338 = _4330 * _4332;
        float _4340 = _4326 * 6.283185482025146484375;
        float _4342 = sin(_4340);
        float _4344 = _4336 * _4338;
        float _4346 = 1.0 / _4344;
        float _4348 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _4350 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _4348;
        float _4352 = 1.0 / _4350;
        float _4354 = _4342 * _4346;
        float _4356 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _4358 = fma(_4312, _4354, _4356);
        float _4360 = _4358 * _4352;
        float _4362 = precise::clamp(_4360, 0.0, 1.0);
        _285 = _4326;
        _4256 = _4362;
    }
    float _4364 = _285;
    float _4366 = _4256;
    float _4368 = _4364;
    if (!_4114)
    {
        float _4370 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _4372 = _4370 * 0.15915493667125701904296875;
        float _4374 = _4372 * 6.283185482025146484375;
        float _4376 = cos(_4374);
        float _4378 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _4380 = _4378 * 0.15915493667125701904296875;
        float _4382 = _4372 * 6.283185482025146484375;
        float _4384 = sin(_4382);
        float _4386 = 1.0 / _4376;
        float _4388 = _4380 * 6.283185482025146484375;
        float _4390 = cos(_4388);
        float _4392 = _4384 * _4386;
        float _4394 = _4380 * 6.283185482025146484375;
        float _4396 = sin(_4394);
        float _4398 = _4390 * _4392;
        float _4400 = 1.0 / _4398;
        float _4402 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _4404 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _4402;
        float _4406 = 1.0 / _4404;
        float _4408 = _4396 * _4400;
        float _4410 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _4412 = fma(_4312, _4408, _4410);
        float _4414 = _4412 * _4406;
        float _4416 = precise::clamp(_4414, 0.0, 1.0);
        float _4418 = -_4416;
        float _4420 = _4418 + 1.0;
        _4368 = _4400;
        _4314 = _4420;
    }
    float _4422 = _4368;
    float _4424 = _4314;
    float _4426 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _4428 = _4302 + _4426;
    float _4430 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _4432 = _4304 + _4430;
    float _4434 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _4436 = _4306 + _4434;
    float _4438 = _4428 * _4428;
    float _4440 = fma(_4432, _4432, _4438);
    float _4442 = fma(_4436, _4436, _4440);
    float _4444 = rsqrt(_4442);
    float _4446 = sqrt(_4442);
    float _4448 = _4444 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _4450 = _4432 * _4448;
    float _4452 = _4436 * _4448;
    float _4454 = _4450 * _4450;
    float _4456 = _4452 * _4452;
    float _4458 = _4454 + _4456;
    float _4460 = sqrt(_4458);
    bool _4462 = _4460 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4464 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4466 = _4460 + _4464;
    float _4468 = _4422;
    float _4470 = _4466;
    float _4472 = _4428;
    float _4474 = _4450;
    if (_4462)
    {
        float _4476 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4468 = _4476;
    }
    float _4478 = _4468;
    if (_4462)
    {
        float _4480 = rsqrt(_4458);
        _4164 = _4480;
    }
    float _4482 = _4164;
    float _4484 = _4482;
    if (_4462)
    {
        float _4486 = _4466 * _4478;
        _4470 = _4486;
    }
    float _4488 = _4470;
    if (_4462)
    {
        float _4490 = _4488 * 0.15915493667125701904296875;
        _4250 = _4490;
    }
    float _4492 = _4250;
    float _4494 = _4436;
    if (_4462)
    {
        float _4496 = _4492 * 6.283185482025146484375;
        float _4498 = sin(_4496);
        _4494 = _4498;
    }
    float _4500 = _4494;
    float _4502 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _4504 = precise::max(0.0, _4502);
    float _4506 = _4478;
    float _4508 = _4504;
    if (_4462)
    {
        float _4510 = _4492 * 6.283185482025146484375;
        float _4512 = cos(_4510);
        _4506 = _4512;
    }
    float _4514 = _4506;
    float _4516 = -_4448;
    float _4518 = -_4504;
    float _4520 = fma(_4428, _4516, _4518);
    if (_4462)
    {
        float _4522 = _4520 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4472 = _4522;
    }
    float _4524 = _4472;
    float _4526 = _4302 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _4528 = _4524;
    float _4530 = _4500;
    if (_4462)
    {
        float _4532 = fma(_4500, _4524, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _4528 = _4532;
    }
    float _4534 = _4528;
    float _4536 = _4534;
    if (!_4462)
    {
        _4530 = _4454;
    }
    float _4538 = _4530;
    float _4540 = fma(_4304, (*spvDescriptorSet0.vp_c8)._m0[2].x, _4526);
    float _4542 = _4538;
    float _4544 = _4514;
    if (_4462)
    {
        float _4546 = _4514 + (-1.0);
        _4508 = _4546;
    }
    float _4548 = _4508;
    float _4550 = _4548;
    if (_4462)
    {
        float _4552 = _4482 * _4534;
        _4252 = _4552;
    }
    float _4554 = _4252;
    if (!_4462)
    {
        _4536 = _4520;
    }
    float _4556 = _4536;
    float _4558 = fma(_4306, (*spvDescriptorSet0.vp_c8)._m0[2].z, _4540);
    float _4560 = _4556;
    if (_4462)
    {
        float _4562 = _4548 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4484 = _4562;
    }
    float _4564 = _4484;
    if (_4462)
    {
        float _4566 = _4450 * _4554;
        _4474 = _4566;
    }
    float _4568 = _4474;
    if (!_4462)
    {
        _4550 = _4452;
    }
    float _4570 = _4550;
    float _4572 = _4570;
    if (_4462)
    {
        float _4574 = _4452 * _4554;
        _4572 = _4574;
    }
    float _4576 = _4572;
    if (_4462)
    {
        float _4578 = fma(_4520, _4514, _4564);
        _4560 = _4578;
    }
    float _4580 = _4560;
    if (_4462)
    {
        float _4582 = _4568 * _4568;
        _4542 = _4582;
    }
    float _4584 = _4542;
    if (!_4462)
    {
        _4544 = _4456;
    }
    float _4586 = _4544;
    float _4588 = _4586;
    if (_4462)
    {
        float _4590 = _4576 * _4576;
        _4588 = _4590;
    }
    float _4592 = _4588;
    float _4594 = _4302 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _4596 = fma(_4580, _4580, _4584);
    float _4598 = _4558 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _4600 = _4596 + _4592;
    float _4602 = _4302 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _4604 = fma(_4304, (*spvDescriptorSet0.vp_c8)._m0[3].x, _4594);
    float _4606 = fma(_3540, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _4608 = rsqrt(_4600);
    float _4610 = _4302 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _4612 = fma(_4304, (*spvDescriptorSet0.vp_c8)._m0[1].x, _4602);
    float _4614 = fma(_4306, (*spvDescriptorSet0.vp_c8)._m0[3].z, _4604);
    float _4616 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _4618 = fma(_4446, (*spvDescriptorSet0.vp_c15)._m0[23].w, _4616);
    float _4620 = precise::clamp(_4618, 0.0, 1.0);
    float _4622 = fma(_4304, (*spvDescriptorSet0.vp_c8)._m0[0].x, _4610);
    float _4624 = fma(_4306, (*spvDescriptorSet0.vp_c8)._m0[1].z, _4612);
    float _4626 = -_4620;
    float _4628 = _4626 + 1.0;
    float _4630 = fma(_3544, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _4632 = _4614 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _4634 = fma(_4306, (*spvDescriptorSet0.vp_c8)._m0[0].z, _4622);
    float _4636 = _4624 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _4638 = floor(_4606);
    float _4640 = _4634 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _4642 = _4608 * _4568;
    float _4644 = _4608 * _4580;
    float _4646 = _4636 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _4648 = _4608 * _4576;
    float _4650 = _4642 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _4652 = abs(_4628);
    float _4654 = log2(_4652);
    float _4656 = fma(_4640, (*spvDescriptorSet0.vp_c8)._m0[7].x, _4646);
    float _4658 = -_4650;
    float _4660 = fma(_4644, (*spvDescriptorSet0.vp_c15)._m0[21].y, _4658);
    float _4662 = fma(_4598, (*spvDescriptorSet0.vp_c8)._m0[7].z, _4656);
    float _4664 = -_4648;
    float _4666 = fma(_4664, (*spvDescriptorSet0.vp_c15)._m0[21].z, _4660);
    float _4668 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _4670 = _4598 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _4672 = floor(_4630);
    float _4674 = fma(_4666, -0.5, 0.5);
    float _4676 = fma(_4632, (*spvDescriptorSet0.vp_c8)._m0[7].w, _4662);
    float _4678 = -_4670;
    float _4680 = fma(_4678, _4668, 1.0);
    float _4682 = fma(_4666, 0.5, 0.5);
    float _4684 = -_4638;
    float _4686 = _4606 + _4684;
    float _4688 = _4654 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _4690 = _4636 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _4692 = sqrt(_4674);
    float _4694 = fma(_4682, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _4696 = fma(_4640, (*spvDescriptorSet0.vp_c8)._m0[4].x, _4690);
    float _4698 = fma(_4682, _4694, -0.212114393711090087890625);
    float _4700 = fma(_4598, (*spvDescriptorSet0.vp_c8)._m0[4].z, _4696);
    float _4702 = exp2(_4688);
    float _4704 = -_4672;
    float _4706 = _4630 + _4704;
    float _4708 = fma(_4682, _4698, 1.570728778839111328125);
    float _4710 = _4644 + 1.0;
    float _4712 = fma(_4632, (*spvDescriptorSet0.vp_c8)._m0[4].w, _4700);
    float _4714 = 1.0 / _4676;
    float _4716 = _4636 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _4718 = _4692 * 0.636619746685028076171875;
    float _4720 = fma(_4640, (*spvDescriptorSet0.vp_c8)._m0[5].x, _4716);
    float _4722 = -_4708;
    float _4724 = fma(_4718, _4722, 1.0);
    float _4726 = log2(_4680);
    float _4728 = fma(_4598, (*spvDescriptorSet0.vp_c8)._m0[5].z, _4720);
    float _4730 = -_4644;
    float _4732 = fma(_4702, _4710, _4730);
    float2 _12218 = float2(_4686, _4706);
    float _4734 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_12218, float2(0.0), isnan(_12218)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_12218, float2(0.0), isnan(_12218)), level(0.0)).x;
    float _4736 = fma(_4732, 0.5, 0.5);
    float _4738 = _4712 * _4714;
    float _4740 = fma(_4632, (*spvDescriptorSet0.vp_c8)._m0[5].w, _4728);
    float _4742 = fma(_4738, 0.5, 0.5);
    float _4744 = _4740 * _4714;
    float _4746 = _4726 * 0.693147182464599609375;
    float _4748 = fma(_4744, -0.5, 0.5);
    float _4750 = _4746 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float3 _12253 = float3(_4742, _4748, _4750);
    float _4752 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_12253, float3(0.0), isnan(_12253)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_12253, float3(0.0), isnan(_12253)), level(0.0)).x;
    float3 _12264 = float3(_4742, _4748, _4750);
    float4 _4755 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_12264, float3(0.0), isnan(_12264)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_12264, float3(0.0), isnan(_12264)), level(0.0)).xyzw;
    float _4757 = _4755.x;
    float _4759 = _4755.y;
    float _4761 = _4755.z;
    float _4763 = _4755.w;
    float2 _12280 = float2(_4724, _4736);
    float3 _4767 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_12280, float2(0.0), isnan(_12280)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_12280, float2(0.0), isnan(_12280)), level(0.0)).xyz;
    float _4769 = _4767.x;
    float _4771 = _4767.y;
    float _4773 = _4767.z;
    float _4775 = abs(_4312);
    float _4777 = log2(_4775);
    bool _4779 = _4446 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _4781 = isnan(_4446);
    bool _4783 = _4779 || _4781;
    bool _4785 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _4787 = _4783 || _4785;
    bool _4789 = _4312 <= 8000.0;
    bool _4791 = isnan(_4312);
    bool _4793 = _4789 || _4791;
    bool _4795 = isnan(8000.0);
    bool _4797 = _4793 || _4795;
    float _4799 = float(_4797);
    float _4801 = _4777 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _4803 = exp2(_4801);
    float _4805 = fma(_4803, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _4807 = precise::clamp(_4805, 0.0, 1.0);
    float _4809 = fma(_4807, -2.0, 3.0);
    float _4811 = _4807 * _4807;
    float _4813 = _4636 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _4815 = _4811 * _4809;
    float _4817 = fma(_4640, (*spvDescriptorSet0.vp_c8)._m0[6].x, _4813);
    float _4819 = _4654 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _4821 = in.m_88.x;
    float _4823 = -_4815;
    float _4825 = _4823 + 1.0;
    float _4827 = fma(_4598, (*spvDescriptorSet0.vp_c8)._m0[6].z, _4817);
    float _4829 = exp2(_4819);
    float _4831 = fma(_4825, (*spvDescriptorSet0.vp_c15)._m0[654].w, _4815);
    float _4833 = fma(_4632, (*spvDescriptorSet0.vp_c8)._m0[6].w, _4827);
    float _4835 = _4676 * 0.5;
    float _4837 = _4712 + _4676;
    float _4839 = _4799 * _4831;
    float _4841 = _4833 + _4676;
    float _4843 = fma(_4740, -0.5, _4835);
    float _4845 = _4839 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _4847 = _4837 * 0.5;
    out.gl_Position.x = _4712;
    out.gl_Position.y = _4740;
    out.gl_Position.z = _4833;
    out.gl_Position.w = _4676;
    float _4849 = _4841 * 0.5;
    float _4851 = -_4829;
    float _4853 = _4851 + 1.0;
    out.m_90.x = _4847;
    out.m_90.y = _4843;
    out.m_90.z = _4849;
    out.m_90.w = _4676;
    float _4855 = _4853 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _4857 = -_4855;
    float _4859 = _4857 + 1.0;
    float _4861 = _4833;
    float _4863 = _4740;
    if (!_4787)
    {
        _4861 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _4865 = _4861;
    float _4867 = _4865;
    float _4869 = _4865;
    if (!_4787)
    {
        _4863 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _4871 = _4863;
    float _4873 = -_4734;
    float _4875 = _4873 + 1.0;
    float _4877 = _4875 * _4845;
    float _4879 = precise::clamp(_4877, 0.0, 1.0);
    float _4881 = -_4879;
    float _4883 = fma(_4881, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _4885 = _4883 * _4821;
    float _4887 = _4885 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _4889 = _4855 * _4752;
    out.m_92.x = _4887;
    float _4891 = _4763 * _4889;
    float _4893 = _4773 * _4889;
    float _4895 = fma(_4769, _4891, _4757);
    float _4897 = fma(_4771, _4891, _4759);
    float _4899 = _4763 * _4859;
    float _4901 = fma(_4763, _4893, _4761);
    float _4903 = _4366 * _4424;
    out.m_94.x = _4895;
    out.m_94.y = _4897;
    out.m_94.z = _4901;
    out.m_94.w = _4899;
    float _4905 = _4903 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _4907 = _4903;
    float _4909 = _4871;
    float _4911 = _4871;
    if (!_4787)
    {
        _4907 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _4913 = _4907;
    bool _4915 = !_4787;
    float _4917 = _4913;
    float _4919 = _4913;
    if (!_4915)
    {
        bool _4921 = _4446 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _4923 = isnan(_4446);
        bool _4925 = _4921 || _4923;
        bool _4927 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _4929 = _4925 || _4927;
        if (!_4929)
        {
            float _4931 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4933 = _4446 + _4931;
            float _4935 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4937 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _4935;
            float _4939 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _4941 = _4939 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _4943 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _4945 = _4943 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _4947 = 1.0 / _4937;
            float _4949 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _4951 = _4949 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _4953 = _4933 * _4947;
            float _4955 = precise::clamp(_4953, 0.0, 1.0);
            float _4957 = fma(_4955, _4941, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _4959 = fma(_4955, _4945, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _4961 = fma(_4955, _4951, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            _4911 = _4959;
            _4869 = _4957;
            _4919 = _4961;
            _4963 = true;
        }
        else
        {
            bool _4965 = _4446 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _4967 = isnan(_4446);
            bool _4969 = _4965 || _4967;
            bool _4971 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _4973 = _4969 || _4971;
            if (!_4973)
            {
                _4867 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _4975 = _4867;
            _4869 = _4975;
            if (!_4973)
            {
                _4909 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _4977 = _4909;
            _4911 = _4977;
            if (!_4973)
            {
                _4917 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _4979 = _4917;
            bool _4981 = !_4973;
            _4919 = _4979;
            if (!_4981)
            {
                bool _4983 = _4446 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _4985 = isnan(_4446);
                bool _4987 = _4983 || _4985;
                bool _4989 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _4991 = _4987 || _4989;
                if (!_4991)
                {
                    float _4993 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4995 = _4446 + _4993;
                    float _4997 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4999 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _4997;
                    float _5001 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _5003 = _5001 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _5005 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _5007 = _5005 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _5009 = 1.0 / _4999;
                    float _5011 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _5013 = _5011 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _5015 = _4995 * _5009;
                    float _5017 = precise::clamp(_5015, 0.0, 1.0);
                    float _5019 = fma(_5017, _5003, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _5021 = fma(_5017, _5007, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _5023 = fma(_5017, _5013, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    _4911 = _5021;
                    _4869 = _5019;
                    _4919 = _5023;
                    _4963 = true;
                }
                else
                {
                    _4911 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _4869 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _4919 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                }
            }
        }
    }
    _4963 = false;
    float _5025 = _4911;
    float _5027 = _4869;
    float _5029 = _4919;
    float _5031 = _4905 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_96.x = 0.0;
    float _5033 = _5025 * 0.586610972881317138671875;
    bool _5035 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    out.m_55.x = _5031;
    float _5037 = fma(_5027, 0.298911988735198974609375, _5033);
    bool _5039 = _4366 > 0.0;
    bool _5041 = isnan(_4366);
    bool _5043 = _5039 || _5041;
    bool _5045 = isnan(0.0);
    bool _5047 = _5043 || _5045;
    float _5049 = fma(_5029, 0.114477999508380889892578125, _5037);
    bool _5051 = _4424 <= 0.0;
    bool _5053 = !_5047;
    bool _5055 = _5051 || _5053;
    float _5057 = -_5049;
    float _5059 = _5057 + _5027;
    float _5061 = -_5049;
    float _5063 = _5061 + _5025;
    float _5065 = -_5049;
    float _5067 = _5065 + _5029;
    float _5069 = fma(_5059, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5049);
    float _5071 = fma(_5063, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5049);
    float _5073 = fma(_5067, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5049);
    bool _5075 = !_5035;
    if (!_5075)
    {
        float _5077 = -_4302;
        float _5079 = _5077 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _5081 = -_4304;
        float _5083 = _5081 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _5085 = -_4306;
        float _5087 = _5085 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _5089 = _5079 * _5079;
        float _5091 = fma(_5083, _5083, _5089);
        float _5093 = fma(_5087, _5087, _5091);
        float _5095 = sqrt(_5093);
        float _5097 = rsqrt(_5093);
        float _5099 = -_5095;
        float _5101 = _5099 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _5103 = _5101 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _5105 = precise::clamp(_5103, 0.0, 1.0);
        float _5107 = _5083 * _5097;
        float _5109 = _5079 * _5097;
        float _5111 = abs(_5105);
        float _5113 = log2(_5111);
        float _5115 = _5087 * _5097;
        float _5117 = _5107 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _5119 = _3966 * _5109;
        float _5121 = -_5109;
        float _5123 = -_5117;
        float _5125 = fma(_5121, (*spvDescriptorSet0.vp_c15)._m0[656].y, _5123);
        float _5127 = fma(_3964, _5107, _5119);
        float _5129 = -_5115;
        float _5131 = fma(_5129, (*spvDescriptorSet0.vp_c15)._m0[656].z, _5125);
        float _5133 = fma(_3968, _5115, _5127);
        float _5135 = precise::clamp(_5133, 0.0, 1.0);
        float _5137 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _5139 = _5131 + _5137;
        float _5141 = _5113 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _5143 = _5139 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _5145 = precise::clamp(_5143, 0.0, 1.0);
        float _5147 = exp2(_5141);
        float _5149 = _5147 * _5145;
        float _5151 = _5135 * _5149;
        float _5153 = _5151 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _5155 = _5151 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _5157 = _5151 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_96.x = _5153;
        out.m_96.y = _5155;
        out.m_96.z = _5157;
    }
    out.m_98.x = _5069;
    out.m_98.y = _5071;
    out.m_98.z = _5073;
    if (!_5055)
    {
        return out;
    }
    out.m_55.x = 0.0;
    float _5159 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _5159;
    return out;
}


struct dm_geometry_capture { device uint* dst; uint4 info; uint stride; short slot[144]; };
static inline void dm_cw(constant dm_geometry_capture& g, device uint* p, uint k, uint v) { short s = g.slot[k]; if (s >= 0) p[s] = v; }
vertex void main0_gs(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]], uint dm_iid [[instance_id]], constant dm_geometry_capture& dm_gs [[buffer(13)]])
{
    uint dm_vid = gl_VertexIndex;
    uint4 dm_ci = dm_gs.info; device uint* dm_capture = dm_gs.dst;
    if (dm_vid - dm_ci.x >= dm_ci.y || dm_iid - dm_ci.z >= dm_ci.w) return;
    device uint* dm_p = dm_capture + ((ulong(dm_iid - dm_ci.z) * dm_ci.y + dm_vid - dm_ci.x) * dm_gs.stride);

    main0_out out = {};
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    bool _4963 = false;
    bool _4016 = false;
    bool _507 = false;
    bool _409 = false;
    bool _305 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _112 = in.m_48.w;
    float _114 = in.m_50.w;
    float _116 = trunc(_112);
    int _119 = int(_116);
    float _121 = -_114;
    float _123 = _121 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_53.y = _123;
    bool _127 = _119 >= 1;
    float _129 = 0.0;
    float _131 = _114;
    float _133 = _123;
    if (!_127)
    {
        _129 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _135 = _129;
    if (!_127)
    {
        out.m_55.x = 0.0;
    }
    int _137 = 0;
    if (!_127)
    {
        float _139 = _135 * 5.0;
        _137 = as_type<int>(_139);
    }
    int _141 = _137;
    if (!_127)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5226 = as_type<float>(_141);
        out.gl_Position.z = _5226;
    }
    if (!_127)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _143 = _114 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _145 = isnan(_114);
    bool _147 = _143 || _145;
    bool _149 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _151 = _147 || _149;
    float _153 = float(_119);
    bool _155 = _123 >= _153;
    bool _157 = !_151;
    bool _159 = _155 || _157;
    float _161 = 1.0 / _153;
    if (_159)
    {
        _131 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _163 = _131;
    if (_159)
    {
        out.m_55.x = 0.0;
    }
    float _165 = _123 * _161;
    int _167 = 0;
    float _169 = _165;
    if (_159)
    {
        float _171 = _163 * 5.0;
        _167 = as_type<int>(_171);
    }
    int _173 = _167;
    out.m_53.x = _165;
    if (_159)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5289 = as_type<float>(_173);
        out.gl_Position.z = _5289;
    }
    if (_159)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _175 = in.m_57.x;
    float _177 = in.m_57.y;
    float _179 = in.m_57.z;
    float _181 = (*spvDescriptorSet0.vp_c10)._m0[18].y * (*spvDescriptorSet0.vp_c10)._m0[18].y;
    float _183 = as_type<float>(int(gl_VertexIndex));
    float _185 = fma((*spvDescriptorSet0.vp_c10)._m0[18].x, (*spvDescriptorSet0.vp_c10)._m0[18].x, _181);
    float _187 = (*spvDescriptorSet0.vp_c10)._m0[19].y * (*spvDescriptorSet0.vp_c10)._m0[19].y;
    float _189 = fma((*spvDescriptorSet0.vp_c10)._m0[19].x, (*spvDescriptorSet0.vp_c10)._m0[19].x, _187);
    float _191 = fma((*spvDescriptorSet0.vp_c10)._m0[18].z, (*spvDescriptorSet0.vp_c10)._m0[18].z, _185);
    float _193 = (*spvDescriptorSet0.vp_c10)._m0[20].y * (*spvDescriptorSet0.vp_c10)._m0[20].y;
    float _195 = fma((*spvDescriptorSet0.vp_c10)._m0[19].z, (*spvDescriptorSet0.vp_c10)._m0[19].z, _189);
    float _197 = sqrt(_191);
    float _199 = fma((*spvDescriptorSet0.vp_c10)._m0[20].x, (*spvDescriptorSet0.vp_c10)._m0[20].x, _193);
    float _201 = fma((*spvDescriptorSet0.vp_c10)._m0[20].z, (*spvDescriptorSet0.vp_c10)._m0[20].z, _199);
    float _203 = _177 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
    float _205 = _177 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
    float _207 = sqrt(_195);
    float _209 = _177 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
    float _211 = fma(_175, (*spvDescriptorSet0.vp_c10)._m0[14].y, _203);
    float _213 = fma(_175, (*spvDescriptorSet0.vp_c10)._m0[14].x, _205);
    float _215 = _177 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
    float _217 = fma(_175, (*spvDescriptorSet0.vp_c10)._m0[14].z, _209);
    float _219 = fma(_179, (*spvDescriptorSet0.vp_c10)._m0[16].y, _211);
    float _221 = fma(_179, (*spvDescriptorSet0.vp_c10)._m0[16].x, _213);
    float _223 = sqrt(_201);
    int _225 = as_type<int>(_183) & 1;
    bool _227 = _225 != 0;
    int _229 = as_type<int>(_183) & 2;
    bool _231 = _229 != 0;
    float _233 = fma(_175, (*spvDescriptorSet0.vp_c10)._m0[14].w, _215);
    bool _235 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _237 = fma(_179, (*spvDescriptorSet0.vp_c10)._m0[16].z, _217);
    float _239 = _197 * _221;
    float _241 = fma(_179, (*spvDescriptorSet0.vp_c10)._m0[16].w, _233);
    bool _243 = !_227;
    float _245 = _243 ? (-0.5) : 0.5;
    float _247 = _207 * _219;
    bool _249 = !_231;
    float _251 = _249 ? (-0.5) : 0.5;
    float _253 = _247 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _255 = _247 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _257 = _247 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _259 = _223 * _237;
    float _261 = fma(_239, (*spvDescriptorSet0.vp_c8)._m0[24].x, _253);
    float _263 = fma(_239, (*spvDescriptorSet0.vp_c8)._m0[25].x, _255);
    float _265 = fma(_239, (*spvDescriptorSet0.vp_c8)._m0[26].x, _257);
    float _267 = fma(_259, (*spvDescriptorSet0.vp_c8)._m0[24].z, _261);
    float _269 = fma(_259, (*spvDescriptorSet0.vp_c8)._m0[25].z, _263);
    float _271 = fma(_259, (*spvDescriptorSet0.vp_c8)._m0[26].z, _265);
    float _273 = fma(_241, (*spvDescriptorSet0.vp_c8)._m0[24].w, _267);
    float _275 = fma(_241, (*spvDescriptorSet0.vp_c8)._m0[25].w, _269);
    float _277 = fma(_241, (*spvDescriptorSet0.vp_c8)._m0[26].w, _271);
    bool _279 = !_235;
    bool _281 = _235;
    float _283 = _273;
    float _285 = _277;
    float _303;
    if (!_279)
    {
        float _287 = in.m_62.x;
        float _289 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _291 = _287 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _293 = fma(_291, (*spvDescriptorSet0.vp_c9)._m0[12].x, _123);
        float _295 = _293 * _289;
        float _297 = floor(_295);
        float _299 = -_297;
        float _301 = _295 + _299;
        _303 = _301;
        _305 = true;
    }
    else
    {
        _303 = _165;
    }
    _305 = false;
    float _307 = _303;
    float _309 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _311 = _307 + _309;
    float _313 = in.m_64.x;
    float _315 = in.m_64.y;
    bool _317 = _307 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _319 = isnan(_307);
    bool _321 = _317 || _319;
    bool _323 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _325 = _321 || _323;
    float _327 = float(_325);
    float _329 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _331 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _329;
    bool _333 = _307 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _335 = isnan(_307);
    bool _337 = _333 || _335;
    bool _339 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _341 = _337 || _339;
    float _343 = float(_341);
    float _345 = -_327;
    float _347 = _345 + 1.0;
    float _349 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _351 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _349;
    float _353 = 1.0 / _331;
    bool _355 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _357 = _343 * _347;
    float _359 = -_343;
    float _361 = _359 + 1.0;
    float _363 = _311 * _353;
    float _365 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _367 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _365;
    float _369 = fma(_351, _363, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _371 = fma(_367, _363, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _373 = _369 * _357;
    float _375 = _371 * _357;
    float _377 = fma(_361, (*spvDescriptorSet0.vp_c9)._m0[143].x, _373);
    float _379 = fma(_361, (*spvDescriptorSet0.vp_c9)._m0[143].y, _375);
    float _381 = fma(_327, (*spvDescriptorSet0.vp_c9)._m0[144].x, _377);
    float _383 = fma(_327, (*spvDescriptorSet0.vp_c9)._m0[144].y, _379);
    float _385 = _381 * _313;
    float _387 = _383 * _315;
    bool _389 = !_355;
    float _407;
    if (!_389)
    {
        float _391 = in.m_62.x;
        float _393 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _395 = _391 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _397 = fma(_395, (*spvDescriptorSet0.vp_c9)._m0[11].y, _123);
        float _399 = _397 * _393;
        float _401 = floor(_399);
        float _403 = -_401;
        float _405 = _399 + _403;
        _407 = _405;
        _409 = true;
    }
    else
    {
        _407 = _165;
    }
    _409 = false;
    float _411 = _407;
    bool _413 = _411 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _415 = isnan(_411);
    bool _417 = _413 || _415;
    bool _419 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _421 = _417 || _419;
    float _423 = float(_421);
    float _425 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _427 = _425 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _429 = _411 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _431 = isnan(_411);
    bool _433 = _429 || _431;
    bool _435 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _437 = _433 || _435;
    float _439 = float(_437);
    float _441 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _443 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _441;
    float _445 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _447 = _411 + _445;
    float _449 = -_423;
    float _451 = _449 + 1.0;
    bool _453 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _455 = 1.0 / _427;
    float _457 = _439 * _451;
    float _459 = -_439;
    float _461 = _459 + 1.0;
    float _463 = _443 * _455;
    float _465 = fma(_463, _447, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _467 = _465 * _457;
    float _469 = fma(_461, (*spvDescriptorSet0.vp_c9)._m0[115].x, _467);
    float _471 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _473 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _475 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _477 = fma(_423, (*spvDescriptorSet0.vp_c9)._m0[116].x, _469);
    float _479 = _471 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _481 = _473 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _483 = _475 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _485 = _477 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_66.x = _479;
    out.m_66.y = _481;
    out.m_66.z = _483;
    out.m_66.w = _485;
    bool _487 = !_453;
    float _505;
    if (!_487)
    {
        float _489 = in.m_62.x;
        float _491 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _493 = _489 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _495 = fma(_493, (*spvDescriptorSet0.vp_c9)._m0[11].w, _123);
        float _497 = _495 * _491;
        float _499 = floor(_497);
        float _501 = -_499;
        float _503 = _497 + _501;
        _505 = _503;
        _507 = true;
    }
    else
    {
        _505 = _165;
    }
    _507 = false;
    float _509 = _505;
    float _511 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _513 = _509 + _511;
    float _515 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _517 = _515 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _519 = _509 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _521 = isnan(_509);
    bool _523 = _519 || _521;
    bool _525 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _527 = _523 || _525;
    float _529 = float(_527);
    float _531 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _533 = _531 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _535 = _509 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _537 = isnan(_509);
    bool _539 = _535 || _537;
    bool _541 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _543 = _539 || _541;
    float _545 = float(_543);
    float _547 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _549 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _547;
    bool _551 = _509 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _553 = isnan(_509);
    bool _555 = _551 || _553;
    bool _557 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _559 = _555 || _557;
    float _561 = float(_559);
    float _563 = 1.0 / _517;
    float _565 = -_529;
    float _567 = _565 + 1.0;
    bool _569 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _571 = _545 * _567;
    float _573 = -_545;
    float _575 = _573 + 1.0;
    float _577 = 1.0 / _533;
    float _579 = _549 * _563;
    float _581 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _583 = _581 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _585 = fma(_579, _513, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _587 = _583 * _577;
    float _589 = _585 * _571;
    float _591 = -_561;
    float _593 = _591 + 1.0;
    float _595 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _597 = _509 + _595;
    float _599 = fma(_575, (*spvDescriptorSet0.vp_c9)._m0[131].x, _589);
    float _601 = _529 * _593;
    float _603 = fma(_587, _597, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _605 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _607 = fma(_603, _601, _599);
    float _609 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _611 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _613 = fma(_561, (*spvDescriptorSet0.vp_c9)._m0[133].x, _607);
    float _615 = _605 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _617 = _609 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _619 = _611 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _621 = _613 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_68.x = _615;
    out.m_68.y = _617;
    out.m_68.z = _619;
    out.m_68.w = _621;
    bool _623 = !_569;
    int _625 = as_type<int>(_613);
    if (!_623)
    {
        float _627 = in.m_62.x;
        float _629 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _631 = _627 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _633 = fma(_631, (*spvDescriptorSet0.vp_c9)._m0[14].x, _123);
        float _635 = _633 * _629;
        float _637 = floor(_635);
        float _639 = -_637;
        float _641 = _635 + _639;
        _169 = _641;
    }
    float _643 = _169;
    float _645 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _647 = int(_645);
    int _649 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _651 = _649 != 0;
    float _653 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].y);
    int _655 = int(_653);
    float _657 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _659 = int(_657);
    float _661 = float(_647);
    float _663 = _621;
    if (_651)
    {
        float _665 = in.m_62.w;
        _663 = _665;
    }
    float _667 = _663;
    float _669 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _671 = int(_669);
    float _673 = float(_655);
    float _675 = 1.0 / _661;
    float _677 = float(_659);
    float _679 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _681 = int(_679);
    float _683 = float(uint(_671));
    float _685 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].x);
    int _687 = int(_685);
    float _689 = _675 * _123;
    int _691 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _693 = _691 != 0;
    float _695 = (*spvDescriptorSet0.vp_c9)._m0[7].z;
    if (_651)
    {
        float _697 = _667 * 3.1415927410125732421875;
        _695 = _697;
    }
    float _699 = _695;
    float _701 = 1.0 / _677;
    float _703 = float(uint(_681));
    float _705 = 0.0;
    if (_651)
    {
        float _707 = _699 * 0.15915493667125701904296875;
        _705 = _707;
    }
    float _709 = _705;
    float _711 = 1.0 / _673;
    float _713 = float(uint(_687));
    float _715 = _699;
    float _717 = _677;
    if (_693)
    {
        float _719 = in.m_62.x;
        float _721 = in.m_62.y;
        _715 = _719;
        _717 = _721;
    }
    float _723 = _715;
    float _725 = _717;
    float _727 = 0.0;
    if (_693)
    {
        _727 = 1.0;
    }
    float _729 = _727;
    float _731 = 0.0;
    float _733 = _729;
    if (_693)
    {
        _731 = 1.0;
    }
    float _735 = _731;
    float _737 = 1.0 / _683;
    float _739 = _701 * _123;
    int _741 = 0;
    float _743 = _735;
    if (_693)
    {
        _741 = 0;
    }
    int _745 = _741;
    int _747 = _745;
    if (_693)
    {
        _625 = 0;
    }
    int _749 = _625;
    float _751 = trunc(_689);
    int _753 = int(_751);
    float _755 = _711 * _123;
    float _757 = 1.0 / _703;
    int _759 = as_type<int>(_737) + (-2);
    float _761 = 1.0 / _713;
    float _763 = float(uint(_753));
    float _765 = as_type<float>(_759) * _763;
    float _767 = trunc(_739);
    int _769 = int(_767);
    int _771 = as_type<int>(_757) + (-2);
    float _773 = trunc(_755);
    int _775 = int(_773);
    int _777 = as_type<int>(_761) + (-2);
    float _779 = float(uint(_769));
    float _781 = _709;
    float _783 = _779;
    float _785 = _737;
    float _787 = _765;
    int _789 = _749;
    float _791 = as_type<float>(_759);
    if (_651)
    {
        float _793 = _709 * 6.283185482025146484375;
        float _795 = sin(_793);
        _781 = _795;
    }
    float _797 = _781;
    float _799 = as_type<float>(_771) * _779;
    float _801 = _723;
    float _803 = _725;
    if (_693)
    {
        _783 = _725;
    }
    float _805 = _783;
    float _807 = float(uint(_775));
    float _809 = trunc(_799);
    float _811 = precise::max(_809, 0.0);
    uint _814 = uint(_811);
    float _816 = as_type<float>(_777) * _807;
    float _818 = _807;
    float _820 = _805;
    if (_693)
    {
        _818 = _723;
    }
    float _822 = _818;
    float _824 = trunc(_816);
    float _826 = precise::max(_824, 0.0);
    uint _828 = uint(_826);
    float _830 = _822;
    if (_693)
    {
        _785 = _822;
    }
    float _832 = _785;
    float _834 = trunc(_765);
    float _836 = precise::max(_834, 0.0);
    uint _838 = uint(_836);
    float _840 = _832;
    if (_693)
    {
        _787 = _822;
    }
    float _842 = _787;
    float _844 = _842;
    if (!_693)
    {
        float _846 = in.m_62.x;
        float _848 = in.m_62.y;
        float _850 = in.m_62.z;
        float _852 = _846 * 3.1415927410125732421875;
        float _854 = _852 * 0.15915493667125701904296875;
        float _856 = _848 * 3.1415927410125732421875;
        float _858 = _856 * 0.15915493667125701904296875;
        float _860 = _854 * 6.283185482025146484375;
        float _862 = sin(_860);
        float _864 = _858 * 6.283185482025146484375;
        float _866 = sin(_864);
        _733 = 7.345489978790283203125;
        _801 = _846;
        _830 = _848;
        _743 = 5.839270114898681640625;
        _844 = _850;
        _803 = _848;
        _840 = _862;
        _820 = _866;
        _747 = 1;
        _789 = 2;
    }
    float _868 = _733;
    float _870 = _801;
    float _872 = _830;
    float _874 = _743;
    float _876 = _844;
    float _878 = _803;
    float _880 = _840;
    float _882 = _820;
    int _884 = _747;
    int _886 = _789;
    int _888 = ~_671;
    int _890 = _888 + 1;
    float _892 = _868 * _870;
    float _894 = _868 * _872;
    int _896 = ~_681;
    int _898 = _896 + 1;
    float _900 = in.m_62.z;
    float _902 = in.m_62.w;
    int _904 = _890 * int(_838);
    int _906 = _904 + _753;
    float _908 = floor(_894);
    int _910 = ~_687;
    int _912 = _910 + 1;
    int _914 = _898 * int(_814);
    int _916 = _914 + _769;
    float _918 = _874 * _876;
    float _920 = float(uint(_906));
    float _922 = _878 * 2.0;
    float _924 = as_type<float>(_884);
    if (_651)
    {
        bool _926 = _797 > 0.5;
        _281 = _926;
    }
    bool _928 = _281;
    float _930 = float(uint(_916));
    float _932 = as_type<float>(_759) * _920;
    float _934 = floor(_918);
    int _936 = _912 * int(_828);
    int _938 = _936 + _775;
    int _940 = ~_671;
    int _942 = _940 + 1;
    float _944 = as_type<float>(_771) * _930;
    float _946 = float(_681);
    float _948 = float(uint(_938));
    float _950 = -_908;
    float _952 = _894 + _950;
    float _954 = trunc(_932);
    float _956 = precise::max(_954, 0.0);
    uint _958 = uint(_956);
    float _960 = float(_671);
    float _962 = as_type<float>(_777) * _948;
    bool _964 = _902 > 0.5;
    float _966 = float(_687);
    float _968 = floor(_892);
    float _970 = -_934;
    float _972 = _918 + _970;
    float _974 = float(_753);
    float _976 = _952 * _966;
    float _978 = 0.0;
    if (!_651)
    {
        _978 = _245;
    }
    float _980 = _978;
    bool _982 = _974 >= _960;
    bool _984 = isnan(_974);
    bool _986 = _982 || _984;
    bool _988 = isnan(_960);
    bool _990 = _986 || _988;
    float _992 = float(_990);
    float _994 = trunc(_944);
    float _996 = precise::max(_994, 0.0);
    uint _998 = uint(_996);
    int _1000 = int(_838) + int(_958);
    float _1002 = _161 * _123;
    float _1004 = float(_775);
    float _1006 = _980;
    if (_651)
    {
        float _1008 = -_245;
        float _1010 = _928 ? _1008 : _245;
        _1006 = _1010;
    }
    float _1012 = _1006;
    float _1014 = _960 * _1002;
    int _1016 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1018 = _1016 != 0;
    float _1020 = trunc(_962);
    float _1022 = precise::max(_1020, 0.0);
    uint _1024 = uint(_1022);
    float _1026 = -_968;
    float _1028 = _892 + _1026;
    float _1030 = float(_769);
    float _1032 = _966 * _1002;
    bool _1034 = _900 > 0.5;
    float _1036 = _1028 * _960;
    int _1038 = _942 * _1000;
    int _1040 = _1038 + _753;
    bool _1042 = _878 > 0.5;
    float _1044 = _972 * _946;
    bool _1046 = _1030 >= _946;
    bool _1048 = isnan(_1030);
    bool _1050 = _1046 || _1048;
    bool _1052 = isnan(_946);
    bool _1054 = _1050 || _1052;
    float _1056 = float(_1054);
    float _1058 = _946 * _1002;
    bool _1060 = uint(_1040) >= uint(_671);
    float _1062 = trunc(_992);
    int _1064 = int(_1062);
    bool _1066 = _1004 >= _966;
    bool _1068 = isnan(_1004);
    bool _1070 = _1066 || _1068;
    bool _1072 = isnan(_966);
    bool _1074 = _1070 || _1072;
    float _1076 = float(_1074);
    int _1078 = int(_814) + int(_998);
    int _1080 = ~_681;
    int _1082 = _1080 + 1;
    float _1084 = -_251;
    int _1086 = _964 ? as_type<int>(_1084) : as_type<int>(_251);
    float _1088 = trunc(_1056);
    int _1090 = int(_1088);
    int _1092 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1094 = _1092 != 0;
    int _1096 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1098 = _1096 != 0;
    int _1100 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1102 = _1100 != 0;
    int _1104 = _1082 * _1078;
    int _1106 = _1104 + _769;
    int _1108 = int(_828) + int(_1024);
    float _1110 = -_251;
    int _1112 = _1034 ? as_type<int>(_1110) : as_type<int>(_251);
    float _1114 = -_245;
    int _1116 = _1042 ? as_type<int>(_1114) : as_type<int>(_245);
    float _1118 = trunc(_1076);
    int _1120 = int(_1118);
    int _1122 = ~_687;
    int _1124 = _1122 + 1;
    bool _1126 = !_1094;
    float _1128 = _1126 ? _251 : as_type<float>(_1086);
    int _1130 = int(_1060);
    int _1132 = _1018 ? 2 : 0;
    int _1134 = _1130 | _1132;
    int _1136 = _1034 ? 4 : 0;
    int _1138 = _1134 | _1136;
    int _1140 = _1094 ? 8 : 0;
    int _1142 = _1138 | _1140;
    int _1144 = _1098 ? 16 : 0;
    int _1146 = _1142 | _1144;
    int _1148 = _1102 ? 32 : 0;
    int _1150 = _1146 | _1148;
    int _1152 = _1042 ? 64 : 0;
    int _1154 = _1150 | _1152;
    int _1156 = _1154 & 64;
    float _1158 = trunc(_1036);
    int _1160 = int(_1158);
    bool _1162 = !_1102;
    float _1164 = _1162 ? _251 : as_type<float>(_1112);
    bool _1166 = !_1098;
    float _1168 = _1166 ? _245 : as_type<float>(_1116);
    int _1170 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1172 = _1170 != 0;
    int _1174 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1176 = _1174 != 0;
    int _1178 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1180 = _1178 != 0;
    float _1182 = trunc(_1014);
    int _1184 = int(_1182);
    bool _1186 = !_1018;
    int _1188 = _1186 ? 0 : 1;
    int _1190 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1192 = _1190 != 0;
    int _1194 = _1124 * _1108;
    int _1196 = _1194 + _775;
    bool _1198 = uint(_1106) >= uint(_681);
    bool _1200 = !_1060;
    int _1202 = _1200 ? 0 : (-1);
    float _1204 = trunc(_1058);
    int _1206 = int(_1204);
    bool _1208 = !_1176;
    int _1210 = _1208 ? 0 : 1;
    bool _1212 = !_1172;
    int _1214 = _1212 ? 0 : 1;
    bool _1216 = !_1180;
    int _1218 = _1216 ? 0 : 1;
    bool _1220 = !_1192;
    int _1222 = _1220 ? 0 : 1;
    float _1224 = trunc(_1032);
    int _1226 = int(_1224);
    int _1228 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _1230 = _1228 != 0;
    int _1232 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _1234 = _1232 != 0;
    int _1236 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _1238 = _1236 != 0;
    int _1240 = ~_1000;
    int _1242 = _1240 + _1202;
    int _1244 = _1242 + 1;
    int _1246 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _1248 = _1246 != 0;
    bool _1250 = uint(_1196) >= uint(_687);
    int _1252 = _671 * _1244;
    int _1254 = _1252 + _753;
    int _1256 = abs(_1188);
    float _1258 = trunc(_1044);
    int _1260 = int(_1258);
    bool _1262 = !_1248;
    int _1264 = _1262 ? 0 : 1;
    bool _1266 = !_1234;
    int _1268 = _1266 ? 0 : 1;
    int _1270 = _1160 * _1256;
    int _1272 = _1270 + _753;
    int _1274 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _1276 = _1274 != 0;
    int _1278 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32768;
    bool _1280 = _1278 != 0;
    float _1282 = floor(_922);
    bool _1284 = _671 == 0;
    bool _1286 = !_1198;
    int _1288 = _1286 ? 0 : (-1);
    bool _1290 = !_1250;
    int _1292 = _1290 ? 0 : (-1);
    bool _1294 = !_1276;
    int _1296 = _1294 ? 0 : 1;
    bool _1298 = !_1280;
    int _1300 = _1298 ? 0 : 1;
    int _1302 = ~_1064;
    int _1304 = _1302 + 1;
    int _1306 = _1304 + 1;
    bool _1308 = !_1284;
    int _1310 = _1308 ? _1254 : (-1);
    int _1312 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 65536;
    bool _1314 = _1312 != 0;
    int _1316 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 131072;
    bool _1318 = _1316 != 0;
    int _1320 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 262144;
    bool _1322 = _1320 != 0;
    int _1324 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 524288;
    bool _1326 = _1324 != 0;
    int _1328 = ~_1078;
    int _1330 = _1328 + _1288;
    int _1332 = _1330 + 1;
    int _1334 = _1310 * _1306;
    int _1336 = ~_1108;
    int _1338 = _1336 + _1292;
    int _1340 = _1338 + 1;
    bool _1342 = !_1318;
    int _1344 = _1342 ? 0 : 1;
    int _1346 = _681 * _1332;
    int _1348 = _1346 + _769;
    bool _1350 = _681 == 0;
    int _1352 = _687 * _1340;
    int _1354 = _1352 + _775;
    bool _1356 = !_1314;
    int _1358 = _1356 ? 0 : 1;
    bool _1360 = _687 == 0;
    int _1362 = _671 + (-1);
    int _1364 = abs(_1264);
    int _1366 = abs(_1210);
    int _1368 = _1064 * _1362;
    int _1370 = _1368 + _1334;
    int _1372 = ~_1090;
    int _1374 = _1372 + 1;
    int _1376 = _1374 + 1;
    int _1378 = _1260 * _1364;
    int _1380 = _1378 + _769;
    bool _1382 = !_1350;
    int _1384 = _1382 ? _1348 : (-1);
    int _1386 = _1370 * _1366;
    int _1388 = ~_1120;
    int _1390 = _1388 + 1;
    int _1392 = _1390 + 1;
    float _1394 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1396 = log2(_1394);
    bool _1398 = !_1360;
    int _1400 = _1398 ? _1354 : (-1);
    int _1402 = _1384 * _1376;
    int _1404 = abs(_1214);
    float _1406 = _878 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _1408 = _681 + (-1);
    int _1410 = _1400 * _1392;
    int _1412 = abs(_1268);
    float _1414 = trunc(_976);
    int _1416 = int(_1414);
    int _1418 = abs(_1218);
    int _1420 = _1090 * _1408;
    int _1422 = _1420 + _1402;
    int _1424 = _687 + (-1);
    int _1426 = _1184 * _1404;
    int _1428 = _1426 + _1386;
    bool _1430 = !_1230;
    int _1432 = _1430 ? 0 : 1;
    int _1434 = _1120 * _1424;
    int _1436 = _1434 + _1410;
    int _1438 = _1272 * _1418;
    int _1440 = _1438 + _1428;
    int _1442 = abs(_1222);
    float _1444 = _1396 * _123;
    int _1446 = abs(_1344);
    int _1448 = _1422 * _1412;
    int _1450 = abs(_1432);
    int _1452 = _1160 * _1442;
    int _1454 = _1452 + _1440;
    int _1456 = abs(_1358);
    int _1458 = _1436 * _1446;
    bool _1460 = !_1238;
    int _1462 = _1460 ? 0 : 1;
    int _1464 = _1206 * _1450;
    int _1466 = _1464 + _1448;
    int _1468 = abs(_1296);
    int _1470 = _1226 * _1456;
    int _1472 = _1470 + _1458;
    float _1474 = float(uint(_1454));
    float _1476 = exp2(_1444);
    bool _1478 = !_1322;
    int _1480 = _1478 ? 0 : 1;
    int _1482 = abs(_1462);
    float _1484 = as_type<float>(_759) * _1474;
    int _1486 = abs(_1480);
    int _1488 = abs(_1300);
    bool _1490 = !_1326;
    int _1492 = _1490 ? 0 : 1;
    float _1494 = trunc(_1484);
    float _1496 = precise::max(_1494, 0.0);
    uint _1498 = uint(_1496);
    int _1500 = _1416 * _1488;
    int _1502 = _1500 + _775;
    int _1504 = abs(_1492);
    int _1506 = _1380 * _1482;
    int _1508 = _1506 + _1466;
    int _1510 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _1512 = _1510 != 0;
    int _1514 = _1502 * _1486;
    int _1516 = _1514 + _1472;
    int _1518 = _1260 * _1468;
    int _1520 = _1518 + _1508;
    int _1522 = ~_671;
    int _1524 = _1522 + 1;
    int _1526 = ~_681;
    int _1528 = _1526 + 1;
    int _1530 = _1416 * _1504;
    int _1532 = _1530 + _1516;
    float _1534 = float(uint(_1520));
    int _1536 = ~_671;
    int _1538 = _1536 + 1;
    float _1540 = float(uint(_1532));
    float _1542 = as_type<float>(_771) * _1534;
    int _1544 = _1524 * int(_1498);
    int _1546 = _1544 + _1454;
    float _1548 = as_type<float>(_1486);
    float _1550 = as_type<float>(_1546);
    bool _1552 = _1230;
    float _1554 = as_type<float>(_1354);
    float _1556 = as_type<float>(_1418);
    float _1558 = as_type<float>(_1412);
    if (_1512)
    {
        float _1560 = in.m_62.x;
        _1548 = _1560;
    }
    float _1562 = _1548;
    bool _1564 = _900 > 0.5;
    float _1566 = as_type<float>(_777) * _1540;
    float _1568 = trunc(_1542);
    float _1570 = precise::max(_1568, 0.0);
    uint _1572 = uint(_1570);
    float _1574 = float(uint(_1546));
    float _1576 = as_type<float>(_759) * _1574;
    float _1578 = trunc(_1566);
    float _1580 = precise::max(_1578, 0.0);
    uint _1582 = uint(_1580);
    float _1584 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    float _1586 = fma(_880, (*spvDescriptorSet0.vp_c9)._m0[93].z, _1584);
    float _1588 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1590 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1592 = trunc(_1576);
    float _1594 = precise::max(_1592, 0.0);
    uint _1596 = uint(_1594);
    int _1598 = ~_687;
    int _1600 = _1598 + 1;
    int _1602 = _1528 * int(_1572);
    int _1604 = _1602 + _1520;
    float _1606 = fma(_1406, -2.0, _1588);
    float _1608 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    if (_1512)
    {
        float _1610 = _1562 * 3.1415927410125732421875;
        _1550 = _1610;
    }
    float _1612 = _1550;
    float _1614 = float(uint(_1272));
    float _1616 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[92].z, _1586);
    int _1618 = _1600 * int(_1582);
    int _1620 = _1618 + _1532;
    float _1622 = float(uint(_1604));
    float _1624 = _1612;
    if (_1512)
    {
        float _1626 = _1612 * 0.15915493667125701904296875;
        _1624 = _1626;
    }
    float _1628 = _1624;
    float _1630 = as_type<float>(_759) * _1614;
    float _1632 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1606);
    float _1634 = as_type<float>(_771) * _1622;
    float _1636 = trunc(_1630);
    float _1638 = precise::max(_1636, 0.0);
    uint _1640 = uint(_1638);
    int _1642 = int(_1498) + int(_1596);
    float _1644 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    float _1646 = float(uint(_1620));
    float _1648 = fma(_882, (*spvDescriptorSet0.vp_c9)._m0[93].w, _1644);
    float _1650 = as_type<float>(_777) * _1646;
    int _1652 = _1538 * _1642;
    int _1654 = _1652 + _1454;
    float _1656 = trunc(_1634);
    float _1658 = precise::max(_1656, 0.0);
    uint _1660 = uint(_1658);
    int _1662 = ~_671;
    int _1664 = _1662 + 1;
    float _1666 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    float _1668 = _882 * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    bool _1670 = uint(_1654) >= uint(_671);
    int _1672 = _1664 * int(_1640);
    int _1674 = _1672 + _1272;
    float _1676 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1678 = _1628;
    if (_1512)
    {
        float _1680 = _1628 * 6.283185482025146484375;
        float _1682 = sin(_1680);
        _1678 = _1682;
    }
    float _1684 = _1678;
    bool _1686 = !_1670;
    int _1688 = _1686 ? 0 : (-1);
    float _1690 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1692 = float(uint(_1674));
    float _1694 = fma(_1668, -2.0, _1666);
    int _1696 = ~_1642;
    int _1698 = _1696 + _1688;
    int _1700 = _1698 + 1;
    float _1702 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[92].w, _1648);
    float _1704 = float(uint(_1380));
    float _1706 = trunc(_1650);
    float _1708 = precise::max(_1706, 0.0);
    uint _1710 = uint(_1708);
    int _1712 = int(_1572) + int(_1660);
    int _1714 = _671 * _1700;
    int _1716 = _1714 + _1454;
    int _1718 = ~_681;
    int _1720 = _1718 + 1;
    float _1722 = as_type<float>(_771) * _1704;
    float _1724 = as_type<float>(_759) * _1692;
    int _1726 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1728 = _1726 != 0;
    float _1730 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[91].y, _1694);
    float _1732 = trunc(_1722);
    float _1734 = precise::max(_1732, 0.0);
    uint _1736 = uint(_1734);
    if (_1512)
    {
        bool _1738 = _1684 > 0.5;
        _1552 = _1738;
    }
    bool _1740 = _1552;
    float _1742 = -_1702;
    float _1744 = _1742 + 1.0;
    bool _1746 = !_1284;
    int _1748 = _1746 ? _1716 : (-1);
    int _1750 = _1720 * _1712;
    int _1752 = _1750 + _1520;
    float _1754 = -_245;
    int _1756 = _1564 ? as_type<int>(_1754) : as_type<int>(_245);
    if (!_1512)
    {
        _791 = _251;
    }
    float _1758 = _791;
    float _1760 = trunc(_1724);
    float _1762 = precise::max(_1760, 0.0);
    uint _1764 = uint(_1762);
    float _1766 = _1758;
    if (_1512)
    {
        float _1768 = -_251;
        float _1770 = _1740 ? _1768 : _251;
        _1766 = _1770;
    }
    float _1772 = _1766;
    bool _1774 = !_1728;
    float _1776 = _1774 ? _245 : as_type<float>(_1756);
    int _1778 = _1748 & 3;
    bool _1780 = _1778 != 0;
    bool _1782 = uint(_1752) >= uint(_681);
    int _1784 = int(_1582) + int(_1710);
    int _1786 = ~_687;
    int _1788 = _1786 + 1;
    bool _1790 = uint(_1778) > 1u;
    bool _1792 = !_1782;
    int _1794 = _1792 ? 0 : (-1);
    int _1796 = _1788 * _1784;
    int _1798 = _1796 + _1532;
    int _1800 = _1748 & 3;
    bool _1802 = _1800 != 0;
    int _1804 = ~_1712;
    int _1806 = _1804 + _1794;
    int _1808 = _1806 + 1;
    int _1810 = _1720 * int(_1736);
    int _1812 = _1810 + _1380;
    int _1814 = _1802 ? 0 : 1;
    bool _1816 = uint(_1798) >= uint(_687);
    int _1818 = int(_1640) + int(_1764);
    float _1820 = float(uint(_1812));
    int _1822 = ~_671;
    int _1824 = _1822 + 1;
    int _1826 = ~_1814;
    int _1828 = _1826 + 1;
    int _1830 = _1828 + 1;
    float _1832 = as_type<float>(_771) * _1820;
    int _1834 = _1830;
    if (!_1790)
    {
        int _1836 = ~_1814;
        int _1838 = _1836 + 1;
        _1834 = _1838;
    }
    int _1840 = _1834;
    int _1842 = _1824 * _1818;
    int _1844 = _1842 + _1272;
    bool _1846 = _1778 != 3;
    int _1848 = _681 * _1808;
    int _1850 = _1848 + _1520;
    bool _1852 = uint(_1778) >= 2u;
    bool _1854 = _1156 != 0;
    float _1856 = _870 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _1858 = _1852 ? 0 : 1;
    float _1860 = -_251;
    int _1862 = _1854 ? as_type<int>(_1860) : as_type<int>(_251);
    int _1864 = 2 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1866 = _1864 != 0;
    bool _1868 = !_1816;
    int _1870 = _1868 ? 0 : (-1);
    float _1872 = trunc(_1832);
    float _1874 = precise::max(_1872, 0.0);
    uint _1876 = uint(_1874);
    bool _1878 = uint(_1844) >= uint(_671);
    bool _1880 = !_1350;
    int _1882 = _1880 ? _1850 : (-1);
    float _1884 = float(uint(_1502));
    bool _1886 = !_1866;
    float _1888 = _1886 ? _251 : as_type<float>(_1862);
    int _1890 = _1882 & 3;
    bool _1892 = _1890 != 0;
    int _1894 = ~_1858;
    int _1896 = _1894 + 1;
    int _1898 = _1896 + 1;
    int _1900 = ~_1784;
    int _1902 = _1900 + _1870;
    int _1904 = _1902 + 1;
    float _1906 = as_type<float>(_777) * _1884;
    int _1908 = _1898;
    if (_1846)
    {
        int _1910 = ~_1858;
        int _1912 = _1910 + 1;
        _1908 = _1912;
    }
    int _1914 = _1908;
    int _1916 = _1882 & 3;
    bool _1918 = _1916 != 0;
    int _1920 = _687 * _1904;
    int _1922 = _1920 + _1532;
    bool _1924 = !_1878;
    int _1926 = _1924 ? 0 : (-1);
    float _1928 = trunc(_1906);
    float _1930 = precise::max(_1928, 0.0);
    uint _1932 = uint(_1930);
    bool _1934 = uint(_1890) >= 2u;
    int _1936 = _1918 ? 0 : 1;
    bool _1938 = uint(_1890) > 1u;
    int _1940 = _1934 ? 0 : 1;
    int _1942 = ~_681;
    int _1944 = _1942 + 1;
    bool _1946 = _1890 != 3;
    int _1948 = int(_1736) + int(_1876);
    int _1950 = ~_687;
    int _1952 = _1950 + 1;
    int _1954 = ~_1936;
    int _1956 = _1954 + 1;
    int _1958 = _1956 + 1;
    int _1960 = _1944 * _1948;
    int _1962 = _1960 + _1380;
    int _1964 = ~_1940;
    int _1966 = _1964 + 1;
    int _1968 = _1966 + 1;
    int _1970 = _1958;
    int _1972 = _1968;
    if (!_1938)
    {
        int _1974 = ~_1936;
        int _1976 = _1974 + 1;
        _1970 = _1976;
    }
    int _1978 = _1970;
    int _1980 = _1952 * int(_1932);
    int _1982 = _1980 + _1502;
    int _1984 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _1986 = _1984 != 0;
    float _1988 = as_type<float>(_1932);
    if (_1946)
    {
        int _1990 = ~_1940;
        int _1992 = _1990 + 1;
        _1972 = _1992;
    }
    int _1994 = _1972;
    bool _1996 = uint(_1962) >= uint(_681);
    bool _1998 = !_1360;
    int _2000 = _1998 ? _1922 : (-1);
    bool _2002 = !_1986;
    int _2004 = _2002 ? 0 : 1;
    bool _2006 = !_1996;
    int _2008 = _2006 ? 0 : (-1);
    int _2010 = _2000 & 3;
    bool _2012 = _2010 != 0;
    int _2014 = _2000 & 3;
    bool _2016 = _2014 != 0;
    float _2018 = float(uint(_1982));
    int _2020 = _2012 ? 0 : 1;
    bool _2022 = uint(_2014) > 1u;
    float _2024 = as_type<float>(_777) * _2018;
    int _2026 = ~_2020;
    int _2028 = _2026 + 1;
    int _2030 = _2028 + 1;
    float _2032 = trunc(_2024);
    float _2034 = precise::max(_2032, 0.0);
    uint _2036 = uint(_2034);
    float _2038 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _2040 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    int _2042 = _2030;
    float _2044 = _2024;
    if (!_2022)
    {
        int _2046 = ~_2020;
        int _2048 = _2046 + 1;
        _2042 = _2048;
    }
    int _2050 = _2042;
    float _2052 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2054 = _2052 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _2056 = uint(_2014) >= 2u;
    float _2058 = fma(_878, (*spvDescriptorSet0.vp_c9)._m0[88].w, _2040);
    float _2060 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2062 = _2060 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    int _2064 = _2056 ? 0 : 1;
    float _2066 = 1.0 / _2054;
    bool _2068 = _2014 != 3;
    float _2070 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2072 = _2070 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    int _2074 = int(_1932) + int(_2036);
    int _2076 = ~_2064;
    int _2078 = _2076 + 1;
    int _2080 = _2078 + 1;
    int _2082 = _1952 * _2074;
    int _2084 = _2082 + _1502;
    float _2086 = 1.0 / _2062;
    bool _2088 = _643 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _2090 = isnan(_643);
    bool _2092 = _2088 || _2090;
    bool _2094 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _2096 = _2092 || _2094;
    float _2098 = float(_2096);
    int _2100 = abs(_1994);
    int _2102 = _2080;
    if (_2068)
    {
        int _2104 = ~_2064;
        int _2106 = _2104 + 1;
        _2102 = _2106;
    }
    int _2108 = _2102;
    bool _2110 = uint(_2084) >= uint(_687);
    float _2112 = 1.0 / _2072;
    int _2114 = ~_2100;
    int _2116 = _2114 + 1;
    int _2118 = _2116 + 1;
    bool _2120 = !_2110;
    int _2122 = _2120 ? 0 : (-1);
    bool _2124 = _870 > 0.5;
    int _2126 = ~_1818;
    int _2128 = _2126 + _1926;
    int _2130 = _2128 + 1;
    float _2132 = -_245;
    int _2134 = _2124 ? as_type<int>(_2132) : as_type<int>(_245);
    bool _2136 = _884 != 1;
    int _2138 = _671 * _2130;
    int _2140 = _2138 + _1272;
    int _2142 = abs(_2050);
    int _2144 = ~_2074;
    int _2146 = _2144 + _2122;
    int _2148 = _2146 + 1;
    int _2150 = ~_2142;
    int _2152 = _2150 + 1;
    int _2154 = _2152 + 1;
    int _2156 = abs(_1914);
    int _2158 = _687 * _2148;
    int _2160 = _2158 + _1502;
    float _2162 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    if (!_2136)
    {
        _2044 = _878;
    }
    float _2164 = _2044;
    float _2166 = _2164;
    if (!_2136)
    {
        _1554 = _878;
    }
    float _2168 = _1554;
    float _2170 = _2168;
    if (!_2136)
    {
        _924 = _900;
    }
    float _2172 = _924;
    float _2174 = _2172;
    if (!_2136)
    {
        _1556 = _900;
    }
    float _2176 = _1556;
    float _2178 = _2176;
    if (_2136)
    {
        _2166 = _870;
    }
    float _2180 = _2166;
    if (_2136)
    {
        _2170 = _870;
    }
    float _2182 = _2170;
    if (_2136)
    {
        _2174 = _878;
    }
    float _2184 = _2174;
    float _2186 = _2180 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    if (_2136)
    {
        _2178 = _878;
    }
    float _2188 = _2178;
    bool _2190 = _886 != 2;
    float _2192 = -_1676;
    float _2194 = fma(_2186, 2.0, _2192);
    float _2196 = fma(_2188, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2038);
    float _2198 = -_123;
    float _2200 = fma(_2198, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2194);
    float _2202 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _2204 = !_1360;
    int _2206 = _2204 ? _2160 : (-1);
    float _2208 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _2210 = -_2202;
    float _2212 = fma(_1856, 2.0, _2210);
    float _2214 = _880 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    float _2216 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    if (_2190)
    {
        _1988 = _878;
    }
    float _2218 = _1988;
    float _2220 = fma(_870, (*spvDescriptorSet0.vp_c9)._m0[88].z, _2208);
    float _2222 = _2218;
    if (!_2190)
    {
        _2222 = _870;
    }
    float _2224 = _2222;
    float _2226 = fma(_2182, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2216);
    if (_2190)
    {
        _1558 = _870;
    }
    float _2228 = _1558;
    float _2230 = _2184 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _2232 = _2228;
    if (!_2190)
    {
        _2232 = _900;
    }
    float _2234 = _2232;
    float _2236 = _2224 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    int _2238 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2240 = _2238 != 0;
    float _2242 = fma(_2230, -2.0, _1590);
    float _2244 = -_1476;
    float _2246 = _2244 + 1.0;
    float _2248 = fma(_2236, -2.0, _1608);
    bool _2250 = !_2240;
    float _2252 = _2250 ? _245 : as_type<float>(_2134);
    float _2254 = _2234 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    bool _2256 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2258 = isnan(0.0);
    bool _2260 = _2256 || _2258;
    bool _2262 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2264 = _2260 || _2262;
    float _2266 = _870 * 2.0;
    float _2268 = -_1690;
    float _2270 = fma(_2254, 2.0, _2268);
    float _2272 = _2264 ? _2246 : 0.0;
    float _2274 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[87].z, _2220);
    bool _2276 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2278 = isnan(1.0);
    bool _2280 = _2276 || _2278;
    bool _2282 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2284 = _2280 || _2282;
    float _2286 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _2288 = 1.0 + _2286;
    float _2290 = floor(_2266);
    float _2292 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2226);
    float _2294 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    float _2296 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _2298 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _2300 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _2298;
    float _2302 = 1.0 / _2288;
    float _2304 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _2306 = -_2294;
    float _2308 = fma(_2214, 2.0, _2306);
    float _2310 = fma(_878, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2296);
    float _2312 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2196);
    float _2314 = fma(_870, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2304);
    float _2316 = -_123;
    float _2318 = fma(_2316, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2212);
    float _2320 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2310);
    float _2322 = -_123;
    float _2324 = fma(_2322, (*spvDescriptorSet0.vp_c9)._m0[91].x, _2308);
    float _2326 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2314);
    float _2328 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[87].w, _2058);
    float _2330 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2242);
    float _2332 = -_123;
    float _2334 = fma(_2332, (*spvDescriptorSet0.vp_c9)._m0[86].x, _2270);
    float _2336 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[86].y, _2248);
    float _2338 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2340 = _2338 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    if (_2284)
    {
        float _2342 = _2272 * _2302;
        _133 = _2342;
    }
    float _2344 = _133;
    bool _2346 = _2290 >= 0.0;
    bool _2348 = isnan(_2290);
    bool _2350 = _2346 || _2348;
    bool _2352 = isnan(0.0);
    bool _2354 = _2350 || _2352;
    float _2356 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _2358 = _2356 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2360 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2362 = _2360 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2364 = 1.0 / _2340;
    int _2366 = _2354 ? 0 : 1;
    float _2368 = _2358 * _2066;
    bool _2370 = _2290 > 0.0;
    float _2372 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2374 = _2372 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    int _2376 = ~_1948;
    int _2378 = _2376 + _2008;
    int _2380 = _2378 + 1;
    float _2382 = _2300 * _2112;
    float _2384 = in.m_48.x;
    float _2386 = in.m_48.y;
    float _2388 = in.m_48.z;
    int _2390 = ~_2366;
    int _2392 = _2390 + 1;
    int _2394 = _2392 + 1;
    float _2396 = 1.0 / _2362;
    int _2398 = _681 * _2380;
    int _2400 = _2398 + _1380;
    bool _2402 = !_1780;
    int _2404 = _2402 ? 0 : 1;
    float _2406 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2408 = _643 + _2406;
    int _2410 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16777216;
    bool _2412 = _2410 != 0;
    float _2414 = -_2326;
    float _2416 = _2414 + 1.0;
    bool _2418 = !_1350;
    int _2420 = _2418 ? _2400 : (-1);
    float _2422 = fma(_2382, _2408, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    int _2424 = _2394;
    if (!_2370)
    {
        int _2426 = ~_2366;
        int _2428 = _2426 + 1;
        _2424 = _2428;
    }
    int _2430 = _2424;
    float _2432 = 1.0 / _2374;
    bool _2434 = _1282 >= 0.0;
    bool _2436 = isnan(_1282);
    bool _2438 = _2434 || _2436;
    bool _2440 = isnan(0.0);
    bool _2442 = _2438 || _2440;
    float _2444 = -_2312;
    float _2446 = _2444 + 1.0;
    float _2448 = -_2292;
    float _2450 = _2448 + 1.0;
    int _2452 = _2442 ? 0 : 1;
    float _2454 = -_2274;
    float _2456 = _2454 + 1.0;
    bool _2458 = _1282 > 0.0;
    float _2460 = _900 * 2.0;
    int _2462 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2464 = _2462 != 0;
    float _2466 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2468 = _2466 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _2470 = _2386 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
    float _2472 = _2386 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
    float _2474 = _2386 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
    float _2476 = _2386 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
    float _2478 = floor(_2460);
    float _2480 = fma(_2384, (*spvDescriptorSet0.vp_c10)._m0[14].x, _2470);
    float _2482 = fma(_2384, (*spvDescriptorSet0.vp_c10)._m0[14].y, _2472);
    float _2484 = fma(_2384, (*spvDescriptorSet0.vp_c10)._m0[14].z, _2474);
    float _2486 = fma(_2384, (*spvDescriptorSet0.vp_c10)._m0[14].w, _2476);
    float _2488 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2490 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _2488;
    float _2492 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _2494 = _2492 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    int _2496 = ~_2452;
    int _2498 = _2496 + 1;
    int _2500 = _2498 + 1;
    float _2502 = 1.0 / _2468;
    int _2504 = _2500;
    if (!_2458)
    {
        int _2506 = ~_2452;
        int _2508 = _2506 + 1;
        _2504 = _2508;
    }
    int _2510 = _2504;
    float _2512 = _2490 * _2396;
    bool _2514 = !_2016;
    int _2516 = _2514 ? 0 : 1;
    float _2518 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2520 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _2518;
    bool _2522 = _1890 != 3;
    float _2524 = _2494 * _2086;
    float _2526 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _2528 = _2526 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    bool _2530 = !_1892;
    int _2532 = _2530 ? 0 : 1;
    float _2534 = _2520 * _2364;
    bool _2536 = _1778 != 3;
    float _2538 = _2528 * _2432;
    float _2540 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2542 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _2540;
    bool _2544 = _643 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _2546 = isnan(_643);
    bool _2548 = _2544 || _2546;
    bool _2550 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _2552 = _2548 || _2550;
    float _2554 = float(_2552);
    float _2556 = fma(_2388, (*spvDescriptorSet0.vp_c10)._m0[16].z, _2484);
    bool _2558 = !_2536;
    int _2560 = _2558 ? 0 : (-1);
    float _2562 = _2542 * _2502;
    bool _2564 = !_2522;
    int _2566 = _2564 ? 0 : (-1);
    float _2568 = -_2554;
    float _2570 = _2568 + 1.0;
    int _2572 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _2574 = _2572 != 0;
    int _2576 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _2578 = _2576 != 0;
    int _2580 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _2582 = _2580 != 0;
    float _2584 = fma(_2388, (*spvDescriptorSet0.vp_c10)._m0[16].x, _2480);
    bool _2586 = _2478 >= 0.0;
    bool _2588 = isnan(_2478);
    bool _2590 = _2586 || _2588;
    bool _2592 = isnan(0.0);
    bool _2594 = _2590 || _2592;
    float _2596 = fma(_2388, (*spvDescriptorSet0.vp_c10)._m0[16].y, _2482);
    bool _2598 = _643 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _2600 = isnan(_643);
    bool _2602 = _2598 || _2600;
    bool _2604 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _2606 = _2602 || _2604;
    float _2608 = float(_2606);
    float _2610 = _2556 + (*spvDescriptorSet0.vp_c10)._m0[17].z;
    int _2612 = _2594 ? 0 : 1;
    float _2614 = _2584 + (*spvDescriptorSet0.vp_c10)._m0[17].x;
    bool _2616 = _2478 > 0.0;
    float _2618 = _2608 * _2570;
    bool _2620 = _643 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _2622 = isnan(_643);
    bool _2624 = _2620 || _2622;
    bool _2626 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _2628 = _2624 || _2626;
    float _2630 = float(_2628);
    float _2632 = -_2608;
    float _2634 = _2632 + 1.0;
    bool _2636 = _643 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _2638 = isnan(_643);
    bool _2640 = _2636 || _2638;
    bool _2642 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _2644 = _2640 || _2642;
    float _2646 = float(_2644);
    float _2648 = fma(_2388, (*spvDescriptorSet0.vp_c10)._m0[16].w, _2486);
    float _2650 = _223 * _2610;
    float _2652 = _2630 * _2634;
    float _2654 = -_2630;
    float _2656 = _2654 + 1.0;
    float _2658 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2660 = _643 + _2658;
    float _2662 = -_2646;
    float _2664 = _2662 + 1.0;
    bool _2666 = _643 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _2668 = isnan(_643);
    bool _2670 = _2666 || _2668;
    bool _2672 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _2674 = _2670 || _2672;
    float _2676 = float(_2674);
    float _2678 = _2646 * _2656;
    float _2680 = fma(_2368, _2660, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _2682 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2684 = _643 + _2682;
    float _2686 = _2098 * _2664;
    float _2688 = -_2098;
    float _2690 = _2688 + 1.0;
    bool _2692 = _643 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _2694 = isnan(_643);
    bool _2696 = _2692 || _2694;
    bool _2698 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _2700 = _2696 || _2698;
    float _2702 = float(_2700);
    float _2704 = fma(_2512, _2684, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _2706 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2708 = _643 + _2706;
    float _2710 = _2676 * _2690;
    float _2712 = -_2676;
    float _2714 = _2712 + 1.0;
    float _2716 = -_2702;
    float _2718 = _2716 + 1.0;
    float _2720 = fma(_2524, _2708, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _2722 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2724 = _643 + _2722;
    float _2726 = _2702 * _2714;
    bool _2728 = _643 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _2730 = isnan(_643);
    bool _2732 = _2728 || _2730;
    bool _2734 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _2736 = _2732 || _2734;
    float _2738 = float(_2736);
    float _2740 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2742 = _643 + _2740;
    float _2744 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2746 = _643 + _2744;
    float _2748 = _197 * _2614;
    float _2750 = fma(_2534, _2724, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _2752 = _2738 * _2718;
    float _2754 = fma(_2562, _2746, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _2756 = _2596 + (*spvDescriptorSet0.vp_c10)._m0[17].y;
    float _2758 = -_2738;
    float _2760 = _2758 + 1.0;
    float _2762 = _2422 * _2752;
    float _2764 = fma(_2538, _2742, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _2766 = _207 * _2756;
    float _2768 = _878 + _870;
    float _2770 = fma(_2760, (*spvDescriptorSet0.vp_c9)._m0[159].x, _2762);
    float _2772 = _870 + _900;
    float _2774 = _2766 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2776 = _2766 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2778 = _2766 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2780 = fma(_2680, _2726, _2770);
    float _2782 = fma(_2748, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2774);
    float _2784 = _878 + _900;
    float _2786 = fma(_2748, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2778);
    float _2788 = _878 + (-0.5);
    int _2790 = _1882 >> 31;
    float _2792 = fma(_2704, _2710, _2780);
    float _2794 = fma(_2748, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2776);
    float _2796 = _870 + (-0.5);
    int _2798 = _2790 & 3;
    float _2800 = fma(_2720, _2686, _2792);
    float _2802 = fma(_2650, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2794);
    float _2804 = _2648 + (*spvDescriptorSet0.vp_c10)._m0[17].w;
    int _2806 = _1882 + _2798;
    float _2808 = fma(_2650, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2782);
    float _2810 = fma(_2650, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2786);
    float _2812 = fma(_2804, (*spvDescriptorSet0.vp_c8)._m0[25].w, _2802);
    float _2814 = _2768 + (-1.0);
    int _2816 = _2806 >> 2;
    float _2818 = _1012 + 0.5;
    float _2820 = fma(_2804, (*spvDescriptorSet0.vp_c8)._m0[24].w, _2808);
    float _2822 = fma(_2804, (*spvDescriptorSet0.vp_c8)._m0[26].w, _2810);
    int _2824 = _2816 << 4;
    int _2826 = _2824 + 656;
    float _2828 = fma(_2814, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _2830 = fma(_2750, _2678, _2800);
    float _2832 = _1772 + (-0.5);
    float _2834 = fma(_2818, (*spvDescriptorSet0.vp_c9)._m0[95].x, _2324);
    float _2836 = _2252 + 0.5;
    uint _2838 = uint(int(uint(_2826) >> uint(2)));
    uint _2840 = uint(int(uint(int(_2838)) >> uint(2)));
    int _2842 = int(_2838) & 3;
    float _2844 = (*spvDescriptorSet0.vp_c9)._m0[int(_2840)][_2842];
    int _2846 = int(_2838) + 1;
    uint _2848 = uint(int(uint(_2846) >> uint(2)));
    int _2850 = _2846 & 3;
    float _2852 = (*spvDescriptorSet0.vp_c9)._m0[int(_2848)][_2850];
    float _2854 = -_2832;
    float _2856 = -_1730;
    float _2858 = fma(_2854, (*spvDescriptorSet0.vp_c9)._m0[95].y, _2856);
    float _2860 = _1888 + (-0.5);
    float _2862 = fma(_2764, _2652, _2830);
    float _2864 = fma(_2836, (*spvDescriptorSet0.vp_c9)._m0[80].x, _2318);
    float _2866 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2868 = -_2860;
    float _2870 = -_1632;
    float _2872 = fma(_2868, (*spvDescriptorSet0.vp_c9)._m0[80].y, _2870);
    float _2874 = _2812 + (*spvDescriptorSet0.vp_c10)._m0[21].y;
    float _2876 = fma(_1744, _1772, _2858);
    float _2878 = -_1616;
    float _2880 = _2878 + 1.0;
    int _2882 = _2826 + 8;
    uint _2884 = uint(int(uint(_2882) >> uint(2)));
    uint _2886 = uint(int(uint(int(_2884)) >> uint(2)));
    int _2888 = int(_2884) & 3;
    float _2890 = (*spvDescriptorSet0.vp_c9)._m0[int(_2886)][_2888];
    int _2892 = int(_2884) + 1;
    uint _2894 = uint(int(uint(_2892) >> uint(2)));
    int _2896 = _2892 & 3;
    float _2898 = (*spvDescriptorSet0.vp_c9)._m0[int(_2894)][_2896];
    float _2900 = _2820 + (*spvDescriptorSet0.vp_c10)._m0[21].x;
    float _2902 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2904 = _2874 + _2902;
    float _2906 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2908 = fma(_2754, _2618, _2862);
    float _2910 = -_2880;
    float _2912 = fma(_2910, _1012, _2834);
    float _2914 = _2822 + (*spvDescriptorSet0.vp_c10)._m0[21].z;
    float _2916 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2918 = _2900 + _2916;
    float _2920 = _2904 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2922 = fma(_2554, (*spvDescriptorSet0.vp_c9)._m0[166].x, _2908);
    float _2924 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2926 = _2914 + _2924;
    out.m_70.x = _2912;
    out.m_70.y = _2876;
    float _2928 = fma(_2918, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2920);
    float _2930 = _2866 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2932 = _1128 + (-0.5);
    int _2934 = abs(_1978);
    float _2936 = fma(_2926, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2928);
    int _2938 = ~_2612;
    int _2940 = _2938 + 1;
    int _2942 = _2940 + 1;
    float _2944 = -_2930;
    float _2946 = -_2330;
    float _2948 = fma(_2944, _2932, _2946);
    float _2950 = _2906 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    int _2952 = _2942;
    if (!_2616)
    {
        int _2954 = ~_2612;
        int _2956 = _2954 + 1;
        _2952 = _2956;
    }
    int _2958 = _2952;
    float _2960 = -_2320;
    float _2962 = _2960 + 1.0;
    float _2964 = -_2416;
    float _2966 = fma(_2252, _2964, _2864);
    float _2968 = trunc((*spvDescriptorSet0.vp_c9)._m0[90].z);
    int _2970 = int(_2968);
    float _2972 = _1776 + 0.5;
    int _2974 = abs(_2532);
    float _2976 = fma(_1128, _2446, _2948);
    bool _2978 = _2936 >= 0.0;
    float _2980 = fma(_2950, _2972, _2200);
    int _2982 = ~_2934;
    int _2984 = _2982 + 1;
    int _2986 = _2984 + 1;
    float _2988 = fma(_1888, _2962, _2872);
    float _2990 = -_2450;
    float _2992 = fma(_1776, _2990, _2980);
    bool _2994 = !_2574;
    int _2996 = _2994 ? 0 : 1;
    out.m_72.x = _2922;
    float _2998 = float(_2958);
    float _3000 = float(_2430);
    int _3002 = _2986 * as_type<int>(_2852);
    int _3004 = ~_2974;
    int _3006 = _3004 + 1;
    int _3008 = _3006 + 1;
    out.m_74.x = _2966;
    out.m_74.y = _2988;
    out.m_74.z = _2992;
    out.m_74.w = _2976;
    float _3010 = as_type<float>(_2974);
    if (_2978)
    {
        _3010 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3012 = _3010;
    int _3014 = ~_2970;
    int _3016 = _3014 + 1;
    int _3018 = _3008 * as_type<int>(_2844);
    int _3020 = _3018 + _3002;
    int _3022 = abs(_2004);
    int _3024 = as_type<int>(_3012);
    if (_2978)
    {
        float _3026 = _3012 * 5.0;
        _3024 = as_type<int>(_3026);
    }
    int _3028 = _3024;
    int _3030 = abs(_2404);
    int _3032 = _2118 * as_type<int>(_2890);
    int _3034 = _3032 + _3020;
    int _3036 = abs(_2516);
    if (_2978)
    {
        out.m_55.x = 0.0;
    }
    bool _3038 = _671 == 0;
    int _3040 = abs(_2970);
    if (_2978)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _9560 = as_type<float>(_3028);
        out.gl_Position.z = _9560;
    }
    float _3042 = float(uint(_2970));
    int _3044 = abs(_2566);
    float _3046 = 1.0 / _3042;
    int _3048 = abs(_2996);
    float _3050 = float(uint(_3040));
    bool _3052 = !_3038;
    int _3054 = _3052 ? _2140 : (-1);
    float _3056 = float(_3048);
    int _3058 = ~_3044;
    int _3060 = _3058 + 1;
    int _3062 = _3060 + 1;
    float _3064 = 1.0 / _3050;
    int _3066 = _1748 >> 31;
    float _3068 = _3056 * _2998;
    int _3070 = ~_3022;
    int _3072 = _3070 + 1;
    int _3074 = _3072 + 1;
    int _3076 = _3062 * as_type<int>(_2898);
    int _3078 = _3076 + _3034;
    int _3080 = _2000 >> 31;
    int _3082 = _3066 & 3;
    int _3084 = _3078 * _3074;
    int _3086 = _3080 & 3;
    float _3088 = _2904 * _2904;
    int _3090 = _1748 + _3082;
    int _3092 = _2420 * _3022;
    int _3094 = _3092 + _3084;
    int _3096 = _2000 + _3086;
    float _3098 = fma(_2918, _2918, _3088);
    int _3100 = _3090 >> 2;
    float _3102 = in.m_76.x;
    float _3104 = in.m_76.y;
    float _3106 = in.m_76.z;
    int _3108 = as_type<int>(_3046) + (-2);
    float _3110 = fma(_2926, _2926, _3098);
    int _3112 = _3096 >> 2;
    int _3114 = _3100 << 4;
    int _3116 = _3114 + 368;
    float _3118 = float(uint(_3094));
    float _3120 = rsqrt(_3110);
    int _3122 = _3112 << 4;
    int _3124 = _3122 + 800;
    uint _3126 = uint(int(uint(_3116) >> uint(2)));
    uint _3128 = uint(int(uint(int(_3126)) >> uint(2)));
    int _3130 = int(_3126) & 3;
    float _3132 = (*spvDescriptorSet0.vp_c9)._m0[int(_3128)][_3130];
    int _3134 = int(_3126) + 1;
    uint _3136 = uint(int(uint(_3134) >> uint(2)));
    int _3138 = _3134 & 3;
    float _3140 = (*spvDescriptorSet0.vp_c9)._m0[int(_3136)][_3138];
    int _3142 = abs(_3094);
    float _3144 = as_type<float>(_3108) * _3118;
    int _3146 = as_type<int>(_3064) + (-2);
    float _3148 = float(uint(_3142));
    bool _3150 = !_2578;
    int _3152 = _3150 ? 0 : 1;
    uint _3154 = uint(int(uint(_3124) >> uint(2)));
    uint _3156 = uint(int(uint(int(_3154)) >> uint(2)));
    int _3158 = int(_3154) & 3;
    float _3160 = (*spvDescriptorSet0.vp_c9)._m0[int(_3156)][_3158];
    int _3162 = int(_3154) + 1;
    uint _3164 = uint(int(uint(_3162) >> uint(2)));
    int _3166 = _3162 & 3;
    float _3168 = (*spvDescriptorSet0.vp_c9)._m0[int(_3164)][_3166];
    float _3170 = trunc(_3144);
    float _3172 = precise::max(_3170, 0.0);
    uint _3174 = uint(_3172);
    float _3176 = as_type<float>(_3146) * _3148;
    int _3178 = abs(_3152);
    int _3180 = ~_3040;
    int _3182 = _3180 + 1;
    float _3184 = _2904 * _3120;
    float _3186 = float(_3178);
    int _3188 = _3116 + 8;
    uint _3190 = uint(int(uint(_3188) >> uint(2)));
    uint _3192 = uint(int(uint(int(_3190)) >> uint(2)));
    int _3194 = int(_3190) & 3;
    float _3196 = (*spvDescriptorSet0.vp_c9)._m0[int(_3192)][_3194];
    int _3198 = int(_3190) + 1;
    uint _3200 = uint(int(uint(_3198) >> uint(2)));
    int _3202 = _3198 & 3;
    float _3204 = (*spvDescriptorSet0.vp_c9)._m0[int(_3200)][_3202];
    float _3206 = trunc(_3176);
    float _3208 = precise::max(_3206, 0.0);
    uint _3210 = uint(_3208);
    float _3212 = _2918 * _3120;
    float _3214 = -_3184;
    float _3216 = fma(_3214, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2904);
    float _3218 = _3068 * (-2.0);
    float _3220 = _3186 * _3000;
    float _3222 = -_3212;
    float _3224 = fma(_3222, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2918);
    float _3226 = _3216 * _3216;
    int _3228 = _3016 * int(_3174);
    int _3230 = _3228 + _3094;
    float _3232 = fma(_2828, _3218, _2828);
    float _3234 = fma(_3224, _3224, _3226);
    float _3236 = fma(_3218, _3102, _3102);
    int _3238 = abs(_1840);
    int _3240 = _3124 + 8;
    uint _3242 = uint(int(uint(_3240) >> uint(2)));
    uint _3244 = uint(int(uint(int(_3242)) >> uint(2)));
    int _3246 = int(_3242) & 3;
    float _3248 = (*spvDescriptorSet0.vp_c9)._m0[int(_3244)][_3246];
    int _3250 = int(_3242) + 1;
    uint _3252 = uint(int(uint(_3250) >> uint(2)));
    int _3254 = _3250 & 3;
    float _3256 = (*spvDescriptorSet0.vp_c9)._m0[int(_3252)][_3254];
    float _3258 = float(uint(_3230));
    float _3260 = fma(_2796, (*spvDescriptorSet0.vp_c9)._m0[196].x, _3236);
    int _3262 = _3182 * int(_3210);
    int _3264 = _3262 + _3142;
    float _3266 = as_type<float>(_3108) * _3258;
    int _3268 = ~_3238;
    int _3270 = _3268 + 1;
    int _3272 = _3270 + 1;
    float _3274 = fma(_3232, _2344, _3260);
    float _3276 = float(uint(_3264));
    int _3278 = ~_3030;
    int _3280 = _3278 + 1;
    int _3282 = _3280 + 1;
    float _3284 = trunc(_3266);
    float _3286 = precise::max(_3284, 0.0);
    uint _3288 = uint(_3286);
    float _3290 = as_type<float>(_3146) * _3276;
    int _3292 = _3272 * as_type<int>(_3140);
    int _3294 = ~_3036;
    int _3296 = _3294 + 1;
    int _3298 = _3296 + 1;
    float _3300 = trunc(_3290);
    float _3302 = precise::max(_3300, 0.0);
    uint _3304 = uint(_3302);
    int _3306 = _3282 * as_type<int>(_3132);
    int _3308 = _3306 + _3292;
    int _3310 = ~_2970;
    int _3312 = _3310 + 1;
    int _3314 = _2154 * as_type<int>(_3168);
    int _3316 = ~_2156;
    int _3318 = _3316 + 1;
    int _3320 = _3318 + 1;
    int _3322 = int(_3174) + int(_3288);
    int _3324 = _3298 * as_type<int>(_3160);
    int _3326 = _3324 + _3314;
    int _3328 = abs(_2560);
    int _3330 = _3320 * as_type<int>(_3196);
    int _3332 = _3330 + _3308;
    int _3334 = ~_3040;
    int _3336 = _3334 + 1;
    int _3338 = _3312 * _3322;
    int _3340 = _3338 + _3094;
    int _3342 = int(_3210) + int(_3304);
    bool _3344 = !_2464;
    int _3346 = _3344 ? 0 : 1;
    int _3348 = ~_3328;
    int _3350 = _3348 + 1;
    int _3352 = _3350 + 1;
    int _3354 = _3336 * _3342;
    int _3356 = _3354 + _3142;
    bool _3358 = uint(_3340) >= uint(_2970);
    int _3360 = abs(_2108);
    int _3362 = _3352 * as_type<int>(_3204);
    int _3364 = _3362 + _3332;
    bool _3366 = !_3358;
    int _3368 = _3366 ? 0 : (-1);
    bool _3370 = _2014 != 3;
    bool _3372 = !_2412;
    int _3374 = _3372 ? 0 : 1;
    bool _3376 = uint(_3356) >= uint(_3040);
    int _3378 = ~_3360;
    int _3380 = _3378 + 1;
    int _3382 = _3380 + 1;
    int _3384 = _3094 ^ _2970;
    bool _3386 = !_3370;
    int _3388 = _3386 ? 0 : (-1);
    int _3390 = _3382 * as_type<int>(_3248);
    int _3392 = _3390 + _3326;
    int _3394 = ~_3322;
    int _3396 = _3394 + _3368;
    int _3398 = _3396 + 1;
    bool _3400 = !_3376;
    int _3402 = _3400 ? 0 : (-1);
    uint _3404 = uint(int(uint(_3384) >> uint(31)));
    int _3406 = abs(_3388);
    int _3408 = abs(_3346);
    bool _3410 = _2970 == 0;
    bool _3412 = _2970 == 0;
    int _3414 = _2970 * _3398;
    int _3416 = _3414 + _3094;
    int _3418 = ~_3402;
    int _3420 = _3342 + _3418;
    int _3422 = _3420 + 1;
    float _3424 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    int _3426 = ~int(_3404);
    int _3428 = _3426 + 1;
    int _3430 = abs(_3374);
    int _3432 = ~_3408;
    int _3434 = _3432 + 1;
    int _3436 = _3434 + 1;
    int _3438 = _3422 ^ _3428;
    int _3440 = ~_3406;
    int _3442 = _3440 + 1;
    int _3444 = _3442 + 1;
    int _3446 = _3364 * _3436;
    int _3448 = ~_3428;
    int _3450 = _3448 + _3438;
    int _3452 = _3450 + 1;
    int _3454 = ~_3430;
    int _3456 = _3454 + 1;
    int _3458 = _3456 + 1;
    int _3460 = _3444 * as_type<int>(_3256);
    int _3462 = _3460 + _3392;
    bool _3464 = !_3410;
    int _3466 = _3464 ? _3416 : (-1);
    int _3468 = _3054 * _3408;
    int _3470 = _3468 + _3446;
    bool _3472 = !_3412;
    int _3474 = _3472 ? _3452 : (-1);
    int _3476 = _3462 * _3458;
    float _3478 = float(_3466);
    float _3480 = _2162 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _3482 = float(_3474);
    float _3484 = _3424 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _3486 = _1164 + (-0.5);
    float _3488 = fma(_3480, _3478, _2334);
    float _3490 = _1168 + 0.5;
    float _3492 = -_2336;
    float _3494 = fma(_3484, _3482, _3492);
    int _3496 = _2206 * _3430;
    int _3498 = _3496 + _3476;
    float _3500 = -_2328;
    float _3502 = _3500 + 1.0;
    float _3504 = fma(_3480, _3490, _3488);
    float _3506 = -_3484;
    float _3508 = fma(_3506, _3486, _3494);
    float _3510 = _2926 * _3120;
    float _3512 = float(_3470);
    float _3514 = -_2456;
    float _3516 = fma(_1168, _3514, _3504);
    float _3518 = float(_3498);
    float _3520 = fma(_1164, _3502, _3508);
    float _3522 = -_3510;
    float _3524 = fma(_3522, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2926);
    out.m_78.x = _3512;
    float _3526 = fma(_3524, _3524, _3234);
    out.m_78.w = _3518;
    bool _3528 = !_2582;
    int _3530 = _3528 ? 0 : 1;
    out.m_80.x = _3516;
    out.m_80.y = _3520;
    float _3532 = _3106;
    if (_2978)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _3534 = -_3184;
    float _3536 = fma(_3534, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2874);
    float _3538 = -_3212;
    float _3540 = fma(_3538, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2900);
    float _3542 = -_3510;
    float _3544 = fma(_3542, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2914);
    int _3546 = abs(_3530);
    float _3548 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3550 = _3536 + _3548;
    float _3552 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3554 = _3540 + _3552;
    float _3556 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3558 = _3544 + _3556;
    float _3560 = _2784 + (-1.0);
    float _3562 = _3550 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _3564 = _3220 * (-2.0);
    float _3566 = float(_2510);
    float _3568 = fma(_3560, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _3570 = fma(_3554, (*spvDescriptorSet0.vp_c8)._m0[28].x, _3562);
    float _3572 = float(_3546);
    float _3574 = _2772 + (-1.0);
    float _3576 = _3274 * 0.15915493667125701904296875;
    float _3578 = fma(_3558, (*spvDescriptorSet0.vp_c8)._m0[28].z, _3570);
    float _3580 = fma(_3564, _3104, _3104);
    float _3582 = fma(_3568, _3564, _3568);
    float _3584 = _3572 * _3566;
    float _3586 = sqrt(_3526);
    bool _3588 = _3578 >= 0.0;
    float _3590 = fma(_2788, (*spvDescriptorSet0.vp_c9)._m0[196].y, _3580);
    float _3592 = _3584 * (-2.0);
    float _3594 = _900 + (-0.5);
    float _3596 = fma(_3582, _2344, _3590);
    float _3598 = fma(_3574, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _3600 = fma(_3592, _3106, _3106);
    float _3602 = _3596 * 0.15915493667125701904296875;
    float _3604 = _3576 * 6.283185482025146484375;
    float _3606 = sin(_3604);
    float _3608 = fma(_3598, _3592, _3598);
    float _3610 = fma(_3594, (*spvDescriptorSet0.vp_c9)._m0[196].z, _3600);
    float _3612 = _3536;
    if (_3588)
    {
        _3532 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3614 = _3532;
    int _3616 = as_type<int>(_3614);
    if (_3588)
    {
        out.m_55.x = 0.0;
    }
    float _3618 = fma(_3608, _2344, _3610);
    float _3620 = _3576 * 6.283185482025146484375;
    float _3622 = cos(_3620);
    if (_3588)
    {
        float _3624 = _3614 * 5.0;
        _3616 = as_type<int>(_3624);
    }
    int _3626 = _3616;
    float _3628 = _3618 * 0.15915493667125701904296875;
    if (_3588)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _10414 = as_type<float>(_3626);
        out.gl_Position.z = _10414;
    }
    float _3630 = _3602 * 6.283185482025146484375;
    float _3632 = sin(_3630);
    float _3634 = _3602 * 6.283185482025146484375;
    float _3636 = cos(_3634);
    if (_3588)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _3638 = _3628 * 6.283185482025146484375;
    float _3640 = cos(_3638);
    float _3642 = _3120 * _3586;
    float _3644 = _387 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _3646 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _251);
    float _3648 = _3622 * _3636;
    float _3650 = _3622 * _3632;
    float _3652 = _3642 * _3644;
    float _3654 = _3606 * _3636;
    float _3656 = _3628 * 6.283185482025146484375;
    float _3658 = sin(_3656);
    float _3660 = _251 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3662 = _3646 * _3652;
    float _3664 = _385 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _3666 = _3606 * _3632;
    float _3668 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _245);
    float _3670 = _3642 * _3664;
    float _3672 = _3622 * _3640;
    float _3674 = _3606 * _3640;
    float _3676 = _3636 * _3640;
    float _3678 = _3668 * _3670;
    float _3680 = _3672 * _3662;
    float _3682 = _3642 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _3684 = _3682 * 0.5;
    float _3686 = _3632 * _3640;
    float _3688 = fma(_3658, _3648, _3666);
    float _3690 = -_3654;
    float _3692 = fma(_3658, _3650, _3690);
    float _3694 = -_3662;
    float _3696 = _3658 * _3694;
    float _3698 = -_3650;
    float _3700 = fma(_3658, _3654, _3698);
    float _3702 = fma(_3688, _3678, _3680);
    float _3704 = _3674 * _3662;
    float _3706 = fma(_3676, _3678, _3696);
    float _3708 = fma(_3658, _3666, _3648);
    float _3710 = fma(_3692, _3684, _3702);
    float _3712 = fma(_3700, _3678, _3704);
    float _3714 = fma(_3686, _3684, _3706);
    float _3716 = _3692 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3718 = _3710 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3720 = _3710 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3722 = fma(_3708, _3684, _3712);
    float _3724 = _3710 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3726 = fma(_3714, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3718);
    float _3728 = fma(_3714, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3720);
    float _3730 = _3688 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3732 = fma(_3714, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3724);
    float _3734 = fma(_3722, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3726);
    float _3736 = fma(_3722, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3728);
    float _3738 = fma(_3660, _3660, 1.0);
    float _3740 = fma(_3676, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3730);
    float _3742 = _3734 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _3744 = _3736 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _3746 = fma(_3686, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3716);
    float _3748 = _2900 + _3742;
    float _3750 = _2914 + _3744;
    float _3752 = _3688 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3754 = _3688 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3756 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _3758 = _3748 + _3756;
    float _3760 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _3762 = _3750 + _3760;
    float _3764 = fma(_3676, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3752);
    float _3766 = _3672 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3768 = _3758 * _3758;
    float _3770 = _3762 * _3762;
    float _3772 = fma(_3676, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3754);
    float _3774 = -_3658;
    float _3776 = fma(_3774, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3766);
    float _3778 = fma(_3722, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3732);
    float _3780 = _3768 + _3770;
    float _3782 = rsqrt(_3738);
    float _3784 = _3672 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3786 = _3778 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _3788 = _3672 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3790 = _3692 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3792 = -_3658;
    float _3794 = fma(_3792, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3784);
    float _3796 = _3692 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3798 = _2874 + _3786;
    float _3800 = sqrt(_3780);
    float _3802 = -_3658;
    float _3804 = fma(_3802, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3788);
    float _3806 = fma(_3686, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3796);
    float _3808 = fma(_3686, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3790);
    bool _3810 = _3800 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3812 = _3686;
    float _3814 = _3778;
    float _3816 = _3788;
    float _3818 = _3796;
    float _3820 = _3754;
    if (!_3810)
    {
        _3812 = _3770;
    }
    float _3822 = _3812;
    float _3824 = _3822;
    if (!_3810)
    {
        _3814 = _3768;
    }
    float _3826 = _3814;
    float _3828 = _3826;
    if (!_3810)
    {
        _3816 = _3748;
    }
    float _3830 = _3816;
    float _3832 = _3830;
    if (!_3810)
    {
        _3818 = _3750;
    }
    float _3834 = _3818;
    float _3836 = _3834;
    if (!_3810)
    {
        _3820 = _3798;
    }
    float _3838 = _3820;
    bool _3840 = !_3810;
    float _3842 = _3838;
    if (!_3840)
    {
        float _3844 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3846 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _3848 = _3800 + _3846;
        float _3850 = rsqrt(_3780);
        float _3852 = _3848 * _3844;
        float _3854 = _3798 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3856 = _3852 * 0.15915493667125701904296875;
        float _3858 = _3856 * 6.283185482025146484375;
        float _3860 = sin(_3858);
        float _3862 = _3856 * 6.283185482025146484375;
        float _3864 = cos(_3862);
        float _3866 = fma(_3860, _3854, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _3868 = _3850 * _3866;
        float _3870 = _3864 + (-1.0);
        float _3872 = fma(_3758, _3868, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _3874 = fma(_3762, _3868, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _3876 = _3870 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3878 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _3880 = _3872 + _3878;
        float _3882 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _3884 = _3874 + _3882;
        float _3886 = fma(_3798, _3864, _3876);
        float _3888 = _3880 * _3880;
        float _3890 = _3884 * _3884;
        _3842 = _3886;
        _3828 = _3888;
        _3824 = _3890;
        _3832 = _3872;
        _3836 = _3874;
    }
    float _3892 = _3842;
    float _3894 = _3828;
    float _3896 = _3824;
    float _3898 = _3832;
    float _3900 = _3836;
    float _3902 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _3904 = _3892 + _3902;
    float _3906 = fma(_3674, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3776);
    float _3908 = fma(_3674, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3794);
    float _3910 = fma(_3674, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3804);
    float _3912 = fma(_3904, _3904, _3894);
    float _3914 = fma(_3708, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3806);
    float _3916 = fma(_3708, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3808);
    float _3918 = fma(_3708, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3746);
    float _3920 = _3912 + _3896;
    float _3922 = _3660 * _3782;
    float _3924 = fma(_3700, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3764);
    float _3926 = fma(_3700, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3772);
    float _3928 = _245 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3930 = _3660 * _3906;
    float _3932 = _3660 * _3908;
    float _3934 = fma(_3700, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3740);
    float _3936 = _3660 * _3910;
    float _3938 = -_3914;
    float _3940 = _3922 * _3938;
    float _3942 = -_3916;
    float _3944 = _3922 * _3942;
    float _3946 = -_3918;
    float _3948 = _3922 * _3946;
    float _3950 = sqrt(_3920);
    float _3952 = fma(_3928, _3924, _3930);
    float _3954 = fma(_3928, _3926, _3932);
    float _3956 = fma(_3928, _3934, _3936);
    float _3958 = fma(_3782, _3906, _3940);
    float _3960 = fma(_3782, _3908, _3944);
    float _3962 = fma(_3782, _3910, _3948);
    float _3964 = _3914 + _3952;
    float _3966 = _3916 + _3954;
    float _3968 = _3918 + _3956;
    out.m_82.x = _3924;
    out.m_82.y = _3926;
    out.m_82.z = _3934;
    out.m_84.x = _3958;
    out.m_84.y = _3960;
    out.m_84.z = _3962;
    bool _3970 = _3950 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _3972 = isnan(_3950);
    bool _3974 = _3970 || _3972;
    bool _3976 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _3978 = _3974 || _3976;
    out.m_86.x = _3964;
    out.m_86.y = _3966;
    out.m_86.z = _3968;
    float _3980 = _3954;
    if (!_3978)
    {
        _3980 = 1.0;
    }
    float _3982 = _3980;
    bool _3984 = !_3978;
    float _3986 = _3982;
    if (!_3984)
    {
        bool _3988 = _3950 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _3990 = isnan(_3950);
        bool _3992 = _3988 || _3990;
        bool _3994 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _3996 = _3992 || _3994;
        if (!_3996)
        {
            float _3998 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _4000 = _3950 + _3998;
            float _4002 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _4004 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _4002;
            float _4006 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _4008 = _4006 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _4010 = 1.0 / _4004;
            float _4012 = _4000 * _4010;
            float _4014 = fma(_4012, _4008, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _3986 = _4014;
            _4016 = true;
        }
        else
        {
            bool _4018 = _3950 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _4020 = isnan(_3950);
            bool _4022 = _4018 || _4020;
            bool _4024 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _4026 = _4022 || _4024;
            if (!_4026)
            {
                float _4028 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _4030 = _3950 + _4028;
                float _4032 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _4034 = _4032 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _4036 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _4038 = _4036 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _4040 = 1.0 / _4034;
                float _4042 = _4030 * _4040;
                float _4044 = fma(_4042, _4038, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _3986 = _4044;
                _4016 = true;
            }
            else
            {
                _3986 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _4016 = false;
    float _4046 = _3986;
    float _4048 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _4050 = _3892 + _4048;
    float _4052 = _3536 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _4054 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _4056 = _3898 + _4054;
    float _4058 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _4060 = _3900 + _4058;
    float _4062 = fma(_4050, _4046, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _4064 = fma(_3540, (*spvDescriptorSet0.vp_c8)._m0[11].x, _4052);
    float _4066 = fma(_4056, _4046, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _4068 = fma(_4060, _4046, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _4070 = -_2874;
    float _4072 = _4070 + _4062;
    float _4074 = fma(_3544, (*spvDescriptorSet0.vp_c8)._m0[11].z, _4064);
    float _4076 = -_2900;
    float _4078 = _4076 + _4066;
    float _4080 = _3536 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _4082 = _4072 * _4072;
    float _4084 = _4074 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _4086 = -_2914;
    float _4088 = _4086 + _4068;
    float _4090 = fma(_3540, (*spvDescriptorSet0.vp_c8)._m0[10].x, _4080);
    float _4092 = fma(_4078, _4078, _4082);
    float _4094 = 1.0 / _4084;
    float _4096 = fma(_3544, (*spvDescriptorSet0.vp_c8)._m0[10].z, _4090);
    float _4098 = fma(_4088, _4088, _4092);
    float _4100 = _4096 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _4102 = sqrt(_4098);
    float _4104 = _4100 + _4084;
    bool _4106 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _4108 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _4110 = _4106 || _4108;
    bool _4112 = isnan(0.5);
    bool _4114 = _4110 || _4112;
    float _4116 = _4104 * _4094;
    float _4118 = _4116 * 0.5;
    float _4120 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _4122 = fma(_4118, (*spvDescriptorSet0.vp_c8)._m0[30].w, _4120);
    bool _4124 = _4102 > 0.0;
    float _4126 = 1.0 / _4122;
    bool _4128 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _4130 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _4132 = _4128 || _4130;
    bool _4134 = isnan(0.5);
    bool _4136 = _4132 || _4134;
    float _4138 = _4118;
    float _4140 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    float _4142 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _4144 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    float _4146 = _4078;
    if (!_4124)
    {
        _4138 = _4066;
    }
    float _4148 = _4138;
    float _4150 = _4148;
    float _4152 = _4148;
    if (!_4124)
    {
        _4140 = _4062;
    }
    float _4154 = _4140;
    float _4156 = _4154;
    if (!_4124)
    {
        _4142 = _4068;
    }
    float _4158 = _4142;
    bool _4160 = !_4124;
    float _4162 = _4158;
    float _4164 = _4126;
    if (!_4160)
    {
        float _4166 = _275 * _275;
        float _4168 = fma(_273, _273, _4166);
        float _4170 = fma(_277, _277, _4168);
        float _4172 = rsqrt(_4098);
        float _4174 = sqrt(_4170);
        float _4176 = _4078 * _4172;
        float _4178 = _4072 * _4172;
        float _4180 = _4088 * _4172;
        bool _4182 = _4174 > 0.0;
        float _4184 = _4172;
        float _4186 = _4174;
        _4146 = _4176;
        if (!_4182)
        {
            _4150 = _4066;
        }
        float _4188 = _4150;
        _4152 = _4188;
        if (!_4182)
        {
            _4184 = _4062;
        }
        float _4190 = _4184;
        _4156 = _4190;
        if (!_4182)
        {
            _4186 = _4068;
        }
        float _4192 = _4186;
        bool _4194 = !_4182;
        _4162 = _4192;
        if (!_4194)
        {
            float _4196 = rsqrt(_4170);
            float _4198 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _4200 = _275 * _4196;
            float _4202 = _273 * _4196;
            float _4204 = _277 * _4196;
            float _4206 = _4178 * _4200;
            float _4208 = fma(_4176, _4202, _4206);
            float _4210 = _4198 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _4212 = fma(_4180, _4204, _4208);
            float _4214 = _4212 * _4210;
            float _4216 = fma(_273, _4214, _4066);
            float _4218 = fma(_275, _4214, _4062);
            float _4220 = fma(_277, _4214, _4068);
            _4152 = _4216;
            _4156 = _4218;
            _4162 = _4220;
            _4144 = _4214;
        }
    }
    float _4222 = _4152;
    float _4224 = _4156;
    float _4226 = _4162;
    float _4228 = _4144;
    float _4230 = _4146;
    float _4232 = -_3212;
    float _4234 = fma(_4232, (*spvDescriptorSet0.vp_c9)._m0[18].w, _4222);
    float _4236 = -_3184;
    float _4238 = fma(_4236, (*spvDescriptorSet0.vp_c9)._m0[18].w, _4224);
    float _4240 = -_3510;
    float _4242 = fma(_4240, (*spvDescriptorSet0.vp_c9)._m0[18].w, _4226);
    float _4244 = _4238;
    float _4246 = _4234;
    float _4248 = _4242;
    float _4250 = _4228;
    float _4252 = _4230;
    if (_4114)
    {
        _283 = 1.0;
    }
    float _4254 = _283;
    float _4256 = _4254;
    if (!_4136)
    {
        float _4258 = _3550 * _3550;
        float _4260 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _4262 = -_2914;
        float _4264 = _4262 + _4226;
        float _4266 = -_2900;
        float _4268 = _4266 + _4222;
        float _4270 = fma(_3554, _3554, _4258);
        float _4272 = fma(_3558, _3558, _4270);
        float _4274 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _4276 = sqrt(_4272);
        float _4278 = 1.0 / _3642;
        float _4280 = _4274 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _4282 = precise::min(_4276, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _4284 = _4282 * _4260;
        float _4286 = _4284 * _4278;
        float _4288 = -_2874;
        float _4290 = _4288 + _4224;
        float _4292 = _4280 * _4286;
        float _4294 = _4264 * _4286;
        float _4296 = fma(_4290, _4292, _3536);
        float _4298 = fma(_4268, _4292, _3540);
        float _4300 = fma(_4280, _4294, _3544);
        _4244 = _4296;
        _4246 = _4298;
        _4248 = _4300;
    }
    float _4302 = _4244;
    float _4304 = _4246;
    float _4306 = _4248;
    if (_4114)
    {
        _3612 = 1.0;
    }
    float _4308 = _3612;
    float _4310 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _4312 = _4126 * _4310;
    float _4314 = _4308;
    if (!_4114)
    {
        float _4316 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _4318 = _4316 * 0.15915493667125701904296875;
        float _4320 = _4318 * 6.283185482025146484375;
        float _4322 = cos(_4320);
        float _4324 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _4326 = _4324 * 0.15915493667125701904296875;
        float _4328 = _4318 * 6.283185482025146484375;
        float _4330 = sin(_4328);
        float _4332 = 1.0 / _4322;
        float _4334 = _4326 * 6.283185482025146484375;
        float _4336 = cos(_4334);
        float _4338 = _4330 * _4332;
        float _4340 = _4326 * 6.283185482025146484375;
        float _4342 = sin(_4340);
        float _4344 = _4336 * _4338;
        float _4346 = 1.0 / _4344;
        float _4348 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _4350 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _4348;
        float _4352 = 1.0 / _4350;
        float _4354 = _4342 * _4346;
        float _4356 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _4358 = fma(_4312, _4354, _4356);
        float _4360 = _4358 * _4352;
        float _4362 = precise::clamp(_4360, 0.0, 1.0);
        _285 = _4326;
        _4256 = _4362;
    }
    float _4364 = _285;
    float _4366 = _4256;
    float _4368 = _4364;
    if (!_4114)
    {
        float _4370 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _4372 = _4370 * 0.15915493667125701904296875;
        float _4374 = _4372 * 6.283185482025146484375;
        float _4376 = cos(_4374);
        float _4378 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _4380 = _4378 * 0.15915493667125701904296875;
        float _4382 = _4372 * 6.283185482025146484375;
        float _4384 = sin(_4382);
        float _4386 = 1.0 / _4376;
        float _4388 = _4380 * 6.283185482025146484375;
        float _4390 = cos(_4388);
        float _4392 = _4384 * _4386;
        float _4394 = _4380 * 6.283185482025146484375;
        float _4396 = sin(_4394);
        float _4398 = _4390 * _4392;
        float _4400 = 1.0 / _4398;
        float _4402 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _4404 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _4402;
        float _4406 = 1.0 / _4404;
        float _4408 = _4396 * _4400;
        float _4410 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _4412 = fma(_4312, _4408, _4410);
        float _4414 = _4412 * _4406;
        float _4416 = precise::clamp(_4414, 0.0, 1.0);
        float _4418 = -_4416;
        float _4420 = _4418 + 1.0;
        _4368 = _4400;
        _4314 = _4420;
    }
    float _4422 = _4368;
    float _4424 = _4314;
    float _4426 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _4428 = _4302 + _4426;
    float _4430 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _4432 = _4304 + _4430;
    float _4434 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _4436 = _4306 + _4434;
    float _4438 = _4428 * _4428;
    float _4440 = fma(_4432, _4432, _4438);
    float _4442 = fma(_4436, _4436, _4440);
    float _4444 = rsqrt(_4442);
    float _4446 = sqrt(_4442);
    float _4448 = _4444 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _4450 = _4432 * _4448;
    float _4452 = _4436 * _4448;
    float _4454 = _4450 * _4450;
    float _4456 = _4452 * _4452;
    float _4458 = _4454 + _4456;
    float _4460 = sqrt(_4458);
    bool _4462 = _4460 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4464 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4466 = _4460 + _4464;
    float _4468 = _4422;
    float _4470 = _4466;
    float _4472 = _4428;
    float _4474 = _4450;
    if (_4462)
    {
        float _4476 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4468 = _4476;
    }
    float _4478 = _4468;
    if (_4462)
    {
        float _4480 = rsqrt(_4458);
        _4164 = _4480;
    }
    float _4482 = _4164;
    float _4484 = _4482;
    if (_4462)
    {
        float _4486 = _4466 * _4478;
        _4470 = _4486;
    }
    float _4488 = _4470;
    if (_4462)
    {
        float _4490 = _4488 * 0.15915493667125701904296875;
        _4250 = _4490;
    }
    float _4492 = _4250;
    float _4494 = _4436;
    if (_4462)
    {
        float _4496 = _4492 * 6.283185482025146484375;
        float _4498 = sin(_4496);
        _4494 = _4498;
    }
    float _4500 = _4494;
    float _4502 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _4504 = precise::max(0.0, _4502);
    float _4506 = _4478;
    float _4508 = _4504;
    if (_4462)
    {
        float _4510 = _4492 * 6.283185482025146484375;
        float _4512 = cos(_4510);
        _4506 = _4512;
    }
    float _4514 = _4506;
    float _4516 = -_4448;
    float _4518 = -_4504;
    float _4520 = fma(_4428, _4516, _4518);
    if (_4462)
    {
        float _4522 = _4520 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4472 = _4522;
    }
    float _4524 = _4472;
    float _4526 = _4302 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _4528 = _4524;
    float _4530 = _4500;
    if (_4462)
    {
        float _4532 = fma(_4500, _4524, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _4528 = _4532;
    }
    float _4534 = _4528;
    float _4536 = _4534;
    if (!_4462)
    {
        _4530 = _4454;
    }
    float _4538 = _4530;
    float _4540 = fma(_4304, (*spvDescriptorSet0.vp_c8)._m0[2].x, _4526);
    float _4542 = _4538;
    float _4544 = _4514;
    if (_4462)
    {
        float _4546 = _4514 + (-1.0);
        _4508 = _4546;
    }
    float _4548 = _4508;
    float _4550 = _4548;
    if (_4462)
    {
        float _4552 = _4482 * _4534;
        _4252 = _4552;
    }
    float _4554 = _4252;
    if (!_4462)
    {
        _4536 = _4520;
    }
    float _4556 = _4536;
    float _4558 = fma(_4306, (*spvDescriptorSet0.vp_c8)._m0[2].z, _4540);
    float _4560 = _4556;
    if (_4462)
    {
        float _4562 = _4548 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4484 = _4562;
    }
    float _4564 = _4484;
    if (_4462)
    {
        float _4566 = _4450 * _4554;
        _4474 = _4566;
    }
    float _4568 = _4474;
    if (!_4462)
    {
        _4550 = _4452;
    }
    float _4570 = _4550;
    float _4572 = _4570;
    if (_4462)
    {
        float _4574 = _4452 * _4554;
        _4572 = _4574;
    }
    float _4576 = _4572;
    if (_4462)
    {
        float _4578 = fma(_4520, _4514, _4564);
        _4560 = _4578;
    }
    float _4580 = _4560;
    if (_4462)
    {
        float _4582 = _4568 * _4568;
        _4542 = _4582;
    }
    float _4584 = _4542;
    if (!_4462)
    {
        _4544 = _4456;
    }
    float _4586 = _4544;
    float _4588 = _4586;
    if (_4462)
    {
        float _4590 = _4576 * _4576;
        _4588 = _4590;
    }
    float _4592 = _4588;
    float _4594 = _4302 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _4596 = fma(_4580, _4580, _4584);
    float _4598 = _4558 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _4600 = _4596 + _4592;
    float _4602 = _4302 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _4604 = fma(_4304, (*spvDescriptorSet0.vp_c8)._m0[3].x, _4594);
    float _4606 = fma(_3540, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _4608 = rsqrt(_4600);
    float _4610 = _4302 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _4612 = fma(_4304, (*spvDescriptorSet0.vp_c8)._m0[1].x, _4602);
    float _4614 = fma(_4306, (*spvDescriptorSet0.vp_c8)._m0[3].z, _4604);
    float _4616 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _4618 = fma(_4446, (*spvDescriptorSet0.vp_c15)._m0[23].w, _4616);
    float _4620 = precise::clamp(_4618, 0.0, 1.0);
    float _4622 = fma(_4304, (*spvDescriptorSet0.vp_c8)._m0[0].x, _4610);
    float _4624 = fma(_4306, (*spvDescriptorSet0.vp_c8)._m0[1].z, _4612);
    float _4626 = -_4620;
    float _4628 = _4626 + 1.0;
    float _4630 = fma(_3544, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _4632 = _4614 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _4634 = fma(_4306, (*spvDescriptorSet0.vp_c8)._m0[0].z, _4622);
    float _4636 = _4624 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _4638 = floor(_4606);
    float _4640 = _4634 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _4642 = _4608 * _4568;
    float _4644 = _4608 * _4580;
    float _4646 = _4636 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _4648 = _4608 * _4576;
    float _4650 = _4642 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _4652 = abs(_4628);
    float _4654 = log2(_4652);
    float _4656 = fma(_4640, (*spvDescriptorSet0.vp_c8)._m0[7].x, _4646);
    float _4658 = -_4650;
    float _4660 = fma(_4644, (*spvDescriptorSet0.vp_c15)._m0[21].y, _4658);
    float _4662 = fma(_4598, (*spvDescriptorSet0.vp_c8)._m0[7].z, _4656);
    float _4664 = -_4648;
    float _4666 = fma(_4664, (*spvDescriptorSet0.vp_c15)._m0[21].z, _4660);
    float _4668 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _4670 = _4598 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _4672 = floor(_4630);
    float _4674 = fma(_4666, -0.5, 0.5);
    float _4676 = fma(_4632, (*spvDescriptorSet0.vp_c8)._m0[7].w, _4662);
    float _4678 = -_4670;
    float _4680 = fma(_4678, _4668, 1.0);
    float _4682 = fma(_4666, 0.5, 0.5);
    float _4684 = -_4638;
    float _4686 = _4606 + _4684;
    float _4688 = _4654 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _4690 = _4636 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _4692 = sqrt(_4674);
    float _4694 = fma(_4682, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _4696 = fma(_4640, (*spvDescriptorSet0.vp_c8)._m0[4].x, _4690);
    float _4698 = fma(_4682, _4694, -0.212114393711090087890625);
    float _4700 = fma(_4598, (*spvDescriptorSet0.vp_c8)._m0[4].z, _4696);
    float _4702 = exp2(_4688);
    float _4704 = -_4672;
    float _4706 = _4630 + _4704;
    float _4708 = fma(_4682, _4698, 1.570728778839111328125);
    float _4710 = _4644 + 1.0;
    float _4712 = fma(_4632, (*spvDescriptorSet0.vp_c8)._m0[4].w, _4700);
    float _4714 = 1.0 / _4676;
    float _4716 = _4636 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _4718 = _4692 * 0.636619746685028076171875;
    float _4720 = fma(_4640, (*spvDescriptorSet0.vp_c8)._m0[5].x, _4716);
    float _4722 = -_4708;
    float _4724 = fma(_4718, _4722, 1.0);
    float _4726 = log2(_4680);
    float _4728 = fma(_4598, (*spvDescriptorSet0.vp_c8)._m0[5].z, _4720);
    float _4730 = -_4644;
    float _4732 = fma(_4702, _4710, _4730);
    float2 _12218 = float2(_4686, _4706);
    float _4734 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_12218, float2(0.0), isnan(_12218)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_12218, float2(0.0), isnan(_12218)), level(0.0)).x;
    float _4736 = fma(_4732, 0.5, 0.5);
    float _4738 = _4712 * _4714;
    float _4740 = fma(_4632, (*spvDescriptorSet0.vp_c8)._m0[5].w, _4728);
    float _4742 = fma(_4738, 0.5, 0.5);
    float _4744 = _4740 * _4714;
    float _4746 = _4726 * 0.693147182464599609375;
    float _4748 = fma(_4744, -0.5, 0.5);
    float _4750 = _4746 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float3 _12253 = float3(_4742, _4748, _4750);
    float _4752 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_12253, float3(0.0), isnan(_12253)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_12253, float3(0.0), isnan(_12253)), level(0.0)).x;
    float3 _12264 = float3(_4742, _4748, _4750);
    float4 _4755 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_12264, float3(0.0), isnan(_12264)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_12264, float3(0.0), isnan(_12264)), level(0.0)).xyzw;
    float _4757 = _4755.x;
    float _4759 = _4755.y;
    float _4761 = _4755.z;
    float _4763 = _4755.w;
    float2 _12280 = float2(_4724, _4736);
    float3 _4767 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_12280, float2(0.0), isnan(_12280)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_12280, float2(0.0), isnan(_12280)), level(0.0)).xyz;
    float _4769 = _4767.x;
    float _4771 = _4767.y;
    float _4773 = _4767.z;
    float _4775 = abs(_4312);
    float _4777 = log2(_4775);
    bool _4779 = _4446 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _4781 = isnan(_4446);
    bool _4783 = _4779 || _4781;
    bool _4785 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _4787 = _4783 || _4785;
    bool _4789 = _4312 <= 8000.0;
    bool _4791 = isnan(_4312);
    bool _4793 = _4789 || _4791;
    bool _4795 = isnan(8000.0);
    bool _4797 = _4793 || _4795;
    float _4799 = float(_4797);
    float _4801 = _4777 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _4803 = exp2(_4801);
    float _4805 = fma(_4803, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _4807 = precise::clamp(_4805, 0.0, 1.0);
    float _4809 = fma(_4807, -2.0, 3.0);
    float _4811 = _4807 * _4807;
    float _4813 = _4636 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _4815 = _4811 * _4809;
    float _4817 = fma(_4640, (*spvDescriptorSet0.vp_c8)._m0[6].x, _4813);
    float _4819 = _4654 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _4821 = in.m_88.x;
    float _4823 = -_4815;
    float _4825 = _4823 + 1.0;
    float _4827 = fma(_4598, (*spvDescriptorSet0.vp_c8)._m0[6].z, _4817);
    float _4829 = exp2(_4819);
    float _4831 = fma(_4825, (*spvDescriptorSet0.vp_c15)._m0[654].w, _4815);
    float _4833 = fma(_4632, (*spvDescriptorSet0.vp_c8)._m0[6].w, _4827);
    float _4835 = _4676 * 0.5;
    float _4837 = _4712 + _4676;
    float _4839 = _4799 * _4831;
    float _4841 = _4833 + _4676;
    float _4843 = fma(_4740, -0.5, _4835);
    float _4845 = _4839 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _4847 = _4837 * 0.5;
    out.gl_Position.x = _4712;
    out.gl_Position.y = _4740;
    out.gl_Position.z = _4833;
    out.gl_Position.w = _4676;
    float _4849 = _4841 * 0.5;
    float _4851 = -_4829;
    float _4853 = _4851 + 1.0;
    out.m_90.x = _4847;
    out.m_90.y = _4843;
    out.m_90.z = _4849;
    out.m_90.w = _4676;
    float _4855 = _4853 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _4857 = -_4855;
    float _4859 = _4857 + 1.0;
    float _4861 = _4833;
    float _4863 = _4740;
    if (!_4787)
    {
        _4861 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _4865 = _4861;
    float _4867 = _4865;
    float _4869 = _4865;
    if (!_4787)
    {
        _4863 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _4871 = _4863;
    float _4873 = -_4734;
    float _4875 = _4873 + 1.0;
    float _4877 = _4875 * _4845;
    float _4879 = precise::clamp(_4877, 0.0, 1.0);
    float _4881 = -_4879;
    float _4883 = fma(_4881, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _4885 = _4883 * _4821;
    float _4887 = _4885 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _4889 = _4855 * _4752;
    out.m_92.x = _4887;
    float _4891 = _4763 * _4889;
    float _4893 = _4773 * _4889;
    float _4895 = fma(_4769, _4891, _4757);
    float _4897 = fma(_4771, _4891, _4759);
    float _4899 = _4763 * _4859;
    float _4901 = fma(_4763, _4893, _4761);
    float _4903 = _4366 * _4424;
    out.m_94.x = _4895;
    out.m_94.y = _4897;
    out.m_94.z = _4901;
    out.m_94.w = _4899;
    float _4905 = _4903 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _4907 = _4903;
    float _4909 = _4871;
    float _4911 = _4871;
    if (!_4787)
    {
        _4907 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _4913 = _4907;
    bool _4915 = !_4787;
    float _4917 = _4913;
    float _4919 = _4913;
    if (!_4915)
    {
        bool _4921 = _4446 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _4923 = isnan(_4446);
        bool _4925 = _4921 || _4923;
        bool _4927 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _4929 = _4925 || _4927;
        if (!_4929)
        {
            float _4931 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4933 = _4446 + _4931;
            float _4935 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4937 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _4935;
            float _4939 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _4941 = _4939 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _4943 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _4945 = _4943 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _4947 = 1.0 / _4937;
            float _4949 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _4951 = _4949 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _4953 = _4933 * _4947;
            float _4955 = precise::clamp(_4953, 0.0, 1.0);
            float _4957 = fma(_4955, _4941, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _4959 = fma(_4955, _4945, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _4961 = fma(_4955, _4951, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            _4911 = _4959;
            _4869 = _4957;
            _4919 = _4961;
            _4963 = true;
        }
        else
        {
            bool _4965 = _4446 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _4967 = isnan(_4446);
            bool _4969 = _4965 || _4967;
            bool _4971 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _4973 = _4969 || _4971;
            if (!_4973)
            {
                _4867 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _4975 = _4867;
            _4869 = _4975;
            if (!_4973)
            {
                _4909 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _4977 = _4909;
            _4911 = _4977;
            if (!_4973)
            {
                _4917 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _4979 = _4917;
            bool _4981 = !_4973;
            _4919 = _4979;
            if (!_4981)
            {
                bool _4983 = _4446 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _4985 = isnan(_4446);
                bool _4987 = _4983 || _4985;
                bool _4989 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _4991 = _4987 || _4989;
                if (!_4991)
                {
                    float _4993 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4995 = _4446 + _4993;
                    float _4997 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4999 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _4997;
                    float _5001 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _5003 = _5001 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _5005 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _5007 = _5005 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _5009 = 1.0 / _4999;
                    float _5011 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _5013 = _5011 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _5015 = _4995 * _5009;
                    float _5017 = precise::clamp(_5015, 0.0, 1.0);
                    float _5019 = fma(_5017, _5003, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _5021 = fma(_5017, _5007, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _5023 = fma(_5017, _5013, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    _4911 = _5021;
                    _4869 = _5019;
                    _4919 = _5023;
                    _4963 = true;
                }
                else
                {
                    _4911 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _4869 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _4919 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                }
            }
        }
    }
    _4963 = false;
    float _5025 = _4911;
    float _5027 = _4869;
    float _5029 = _4919;
    float _5031 = _4905 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_96.x = 0.0;
    float _5033 = _5025 * 0.586610972881317138671875;
    bool _5035 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    out.m_55.x = _5031;
    float _5037 = fma(_5027, 0.298911988735198974609375, _5033);
    bool _5039 = _4366 > 0.0;
    bool _5041 = isnan(_4366);
    bool _5043 = _5039 || _5041;
    bool _5045 = isnan(0.0);
    bool _5047 = _5043 || _5045;
    float _5049 = fma(_5029, 0.114477999508380889892578125, _5037);
    bool _5051 = _4424 <= 0.0;
    bool _5053 = !_5047;
    bool _5055 = _5051 || _5053;
    float _5057 = -_5049;
    float _5059 = _5057 + _5027;
    float _5061 = -_5049;
    float _5063 = _5061 + _5025;
    float _5065 = -_5049;
    float _5067 = _5065 + _5029;
    float _5069 = fma(_5059, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5049);
    float _5071 = fma(_5063, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5049);
    float _5073 = fma(_5067, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5049);
    bool _5075 = !_5035;
    if (!_5075)
    {
        float _5077 = -_4302;
        float _5079 = _5077 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _5081 = -_4304;
        float _5083 = _5081 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _5085 = -_4306;
        float _5087 = _5085 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _5089 = _5079 * _5079;
        float _5091 = fma(_5083, _5083, _5089);
        float _5093 = fma(_5087, _5087, _5091);
        float _5095 = sqrt(_5093);
        float _5097 = rsqrt(_5093);
        float _5099 = -_5095;
        float _5101 = _5099 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _5103 = _5101 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _5105 = precise::clamp(_5103, 0.0, 1.0);
        float _5107 = _5083 * _5097;
        float _5109 = _5079 * _5097;
        float _5111 = abs(_5105);
        float _5113 = log2(_5111);
        float _5115 = _5087 * _5097;
        float _5117 = _5107 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _5119 = _3966 * _5109;
        float _5121 = -_5109;
        float _5123 = -_5117;
        float _5125 = fma(_5121, (*spvDescriptorSet0.vp_c15)._m0[656].y, _5123);
        float _5127 = fma(_3964, _5107, _5119);
        float _5129 = -_5115;
        float _5131 = fma(_5129, (*spvDescriptorSet0.vp_c15)._m0[656].z, _5125);
        float _5133 = fma(_3968, _5115, _5127);
        float _5135 = precise::clamp(_5133, 0.0, 1.0);
        float _5137 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _5139 = _5131 + _5137;
        float _5141 = _5113 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _5143 = _5139 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _5145 = precise::clamp(_5143, 0.0, 1.0);
        float _5147 = exp2(_5141);
        float _5149 = _5147 * _5145;
        float _5151 = _5135 * _5149;
        float _5153 = _5151 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _5155 = _5151 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _5157 = _5151 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_96.x = _5153;
        out.m_96.y = _5155;
        out.m_96.z = _5157;
    }
    out.m_98.x = _5069;
    out.m_98.y = _5071;
    out.m_98.z = _5073;
    if (!_5055)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_55.x = 0.0;
    float _5159 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _5159;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

