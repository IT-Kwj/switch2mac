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
    constant _16* vp_c8 [[id(0)]];
    constant _16* vp_c10 [[id(1)]];
    constant _16* vp_c9 [[id(2)]];
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
    float4 m_72 [[user(locn1)]];
    float4 m_51 [[user(locn2)]];
    float4 m_88 [[user(locn3)]];
    float4 m_55 [[user(locn4)]];
    float4 m_74 [[user(locn5)]];
    float4 m_80 [[user(locn6)]];
    float4 m_70 [[user(locn7)]];
    float4 m_76 [[user(locn8)]];
    float4 m_86 [[user(locn9)]];
    float4 m_82 [[user(locn10)]];
    float4 m_84 [[user(locn11)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_78 [[attribute(0)]];
    float4 m_68 [[attribute(1)]];
    float4 m_60 [[attribute(2)]];
    float4 m_48 [[attribute(3)]];
    float4 m_53 [[attribute(4)]];
    float4 m_62 [[attribute(5)]];
    float4 m_64 [[attribute(6)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2486 = false;
    bool _1499 = false;
    bool _527 = false;
    bool _421 = false;
    bool _233 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _102 = in.m_48.w;
    float _104 = trunc(_102);
    int _107 = int(_104);
    bool _111 = _107 >= 1;
    float _113 = 0.0;
    if (!_111)
    {
        _113 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _115 = _113;
    if (!_111)
    {
        out.m_51.x = 0.0;
    }
    int _117 = 0;
    if (!_111)
    {
        float _119 = _115 * 5.0;
        _117 = as_type<int>(_119);
    }
    int _121 = _117;
    int _123 = _121;
    if (!_111)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2790 = as_type<float>(_121);
        out.gl_Position.z = _2790;
    }
    if (!_111)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _125 = in.m_53.w;
    float _127 = float(_107);
    float _129 = 1.0 / _127;
    float _131 = -_125;
    float _133 = _131 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _135 = _125 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _137 = isnan(_125);
    bool _139 = _135 || _137;
    bool _141 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _143 = _139 || _141;
    float _145 = _133 * _129;
    bool _147 = _133 >= _127;
    bool _149 = !_143;
    bool _151 = _147 || _149;
    out.m_55.x = _145;
    float _153 = _125;
    float _155 = _133;
    if (_151)
    {
        _153 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _157 = _153;
    if (_151)
    {
        out.m_51.x = 0.0;
    }
    if (_151)
    {
        float _159 = _157 * 5.0;
        _123 = as_type<int>(_159);
    }
    int _161 = _123;
    if (_151)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2862 = as_type<float>(_161);
        out.gl_Position.z = _2862;
    }
    if (_151)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _163 = as_type<float>(int(gl_VertexIndex));
    float _165 = in.m_60.x;
    float _167 = in.m_60.y;
    float _169 = in.m_60.z;
    int _171 = as_type<int>(_163) & 1;
    bool _173 = _171 != 0;
    int _175 = as_type<int>(_163) & 2;
    bool _177 = _175 != 0;
    bool _179 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _181 = _167 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _183 = _167 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _185 = _167 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _187 = !_173;
    float _189 = _187 ? (-0.5) : 0.5;
    float _191 = fma(_165, (*spvDescriptorSet0.vp_c10)._m0[4].x, _181);
    float _193 = fma(_165, (*spvDescriptorSet0.vp_c10)._m0[5].x, _183);
    float _195 = fma(_165, (*spvDescriptorSet0.vp_c10)._m0[6].x, _185);
    bool _197 = !_177;
    float _199 = _197 ? (-0.5) : 0.5;
    float _201 = fma(_169, (*spvDescriptorSet0.vp_c10)._m0[4].z, _191);
    float _203 = fma(_169, (*spvDescriptorSet0.vp_c10)._m0[5].z, _193);
    float _205 = fma(_169, (*spvDescriptorSet0.vp_c10)._m0[6].z, _195);
    bool _207 = !_179;
    float _209 = _205;
    float _211 = _203;
    float _213 = _201;
    float _231;
    if (!_207)
    {
        float _215 = in.m_62.x;
        float _217 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _219 = _215 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _221 = fma(_219, (*spvDescriptorSet0.vp_c9)._m0[12].x, _133);
        float _223 = _221 * _217;
        float _225 = floor(_223);
        float _227 = -_225;
        float _229 = _223 + _227;
        _231 = _229;
        _233 = true;
    }
    else
    {
        _231 = _145;
    }
    _233 = false;
    float _235 = _231;
    float _237 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _239 = _235 + _237;
    float _241 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _243 = _235 + _241;
    float _245 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _247 = _235 + _245;
    float _249 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _251 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _249;
    float _253 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _255 = _253 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _257 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _259 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _257;
    bool _261 = _235 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _263 = isnan(_235);
    bool _265 = _261 || _263;
    bool _267 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _269 = _265 || _267;
    float _271 = float(_269);
    float _273 = 1.0 / _251;
    bool _275 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _277 = 1.0 / _259;
    float _279 = 1.0 / _255;
    float _281 = _239 * _273;
    bool _283 = _235 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _285 = isnan(_235);
    bool _287 = _283 || _285;
    bool _289 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _291 = _287 || _289;
    float _293 = float(_291);
    float _295 = -_271;
    float _297 = _295 + 1.0;
    float _299 = _293 * _297;
    float _301 = _243 * _277;
    bool _303 = _235 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _305 = isnan(_235);
    bool _307 = _303 || _305;
    bool _309 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _311 = _307 || _309;
    float _313 = float(_311);
    float _315 = -_293;
    float _317 = _315 + 1.0;
    float _319 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _321 = _319 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _323 = _313 * _317;
    float _325 = -_313;
    float _327 = _325 + 1.0;
    float _329 = _247 * _279;
    bool _331 = _235 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _333 = isnan(_235);
    bool _335 = _331 || _333;
    bool _337 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _339 = _335 || _337;
    float _341 = float(_339);
    float _343 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _345 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _343;
    float _347 = fma(_321, _329, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _349 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _351 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _349;
    float _353 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _355 = _353 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _357 = fma(_345, _281, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _359 = _341 * _327;
    float _361 = fma(_351, _281, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _363 = fma(_355, _329, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _365 = -_341;
    float _367 = _365 + 1.0;
    float _369 = _357 * _359;
    float _371 = _361 * _359;
    float _373 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _375 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _373;
    float _377 = fma(_367, (*spvDescriptorSet0.vp_c9)._m0[143].x, _369);
    float _379 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _381 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _379;
    float _383 = fma(_367, (*spvDescriptorSet0.vp_c9)._m0[143].y, _371);
    float _385 = fma(_375, _301, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _387 = fma(_347, _323, _377);
    float _389 = fma(_381, _301, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _391 = fma(_363, _323, _383);
    float _393 = fma(_385, _299, _387);
    float _395 = fma(_389, _299, _391);
    float _397 = fma(_271, (*spvDescriptorSet0.vp_c9)._m0[146].x, _393);
    float _399 = fma(_271, (*spvDescriptorSet0.vp_c9)._m0[146].y, _395);
    bool _401 = !_275;
    float _419;
    if (!_401)
    {
        float _403 = in.m_62.x;
        float _405 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _407 = _403 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _409 = fma(_407, (*spvDescriptorSet0.vp_c9)._m0[11].y, _133);
        float _411 = _409 * _405;
        float _413 = floor(_411);
        float _415 = -_413;
        float _417 = _411 + _415;
        _419 = _417;
        _421 = true;
    }
    else
    {
        _419 = _145;
    }
    _421 = false;
    float _423 = _419;
    float _425 = in.m_64.x;
    float _427 = in.m_64.y;
    bool _429 = _423 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _431 = isnan(_423);
    bool _433 = _429 || _431;
    bool _435 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _437 = _433 || _435;
    float _439 = float(_437);
    float _441 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _443 = _441 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _445 = _423 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _447 = isnan(_423);
    bool _449 = _445 || _447;
    bool _451 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _453 = _449 || _451;
    float _455 = float(_453);
    float _457 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _459 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _457;
    float _461 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _463 = _423 + _461;
    float _465 = -_439;
    float _467 = _465 + 1.0;
    bool _469 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _471 = 1.0 / _443;
    float _473 = _455 * _467;
    float _475 = -_455;
    float _477 = _475 + 1.0;
    float _479 = _399 * _427;
    float _481 = _397 * _425;
    float _483 = _459 * _471;
    float _485 = fma(_483, _463, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _487 = _485 * _473;
    float _489 = fma(_477, (*spvDescriptorSet0.vp_c9)._m0[115].x, _487);
    float _491 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _493 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _495 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _497 = fma(_439, (*spvDescriptorSet0.vp_c9)._m0[116].x, _489);
    float _499 = _491 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _501 = _493 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _503 = _495 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _505 = _497 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_66.x = _499;
    out.m_66.y = _501;
    out.m_66.z = _503;
    out.m_66.w = _505;
    bool _507 = !_469;
    float _525;
    if (!_507)
    {
        float _509 = in.m_62.x;
        float _511 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _513 = _509 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _515 = fma(_513, (*spvDescriptorSet0.vp_c9)._m0[11].w, _133);
        float _517 = _515 * _511;
        float _519 = floor(_517);
        float _521 = -_519;
        float _523 = _517 + _521;
        _525 = _523;
        _527 = true;
    }
    else
    {
        _525 = _145;
    }
    _527 = false;
    float _529 = _525;
    float _531 = in.m_62.x;
    float _533 = in.m_62.y;
    float _535 = in.m_62.z;
    float _537 = in.m_62.w;
    float _539 = _479 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _541 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _199);
    int _543 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _545 = _543 != 0;
    float _547 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _549 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _551 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _553 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _555 = _535 * 2.0;
    bool _557 = _537 > 0.5;
    float _559 = _531 * 2.0;
    float _561 = _533 * 2.0;
    float _563 = _533 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _565 = _533 + _531;
    float _567 = floor(_555);
    bool _569 = _533 > 0.5;
    float _571 = fma(_563, -2.0, _549);
    float _573 = _565 + (-1.0);
    float _575 = _531 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _577 = -_189;
    int _579 = _569 ? as_type<int>(_577) : as_type<int>(_189);
    float _581 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[76].y, _571);
    float _583 = fma(_573, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _585 = floor(_559);
    float _587 = -_553;
    float _589 = fma(_575, 2.0, _587);
    float _591 = -_133;
    float _593 = fma(_591, (*spvDescriptorSet0.vp_c9)._m0[76].x, _589);
    float _595 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _597 = _567 > 0.0;
    float _599 = floor(_561);
    bool _601 = _567 >= 0.0;
    bool _603 = isnan(_567);
    bool _605 = _601 || _603;
    bool _607 = isnan(0.0);
    bool _609 = _605 || _607;
    int _611 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _613 = _611 != 0;
    int _615 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _617 = _615 != 0;
    float _619 = _609 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _621 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _623 = log2(_621);
    bool _625 = _585 >= 0.0;
    bool _627 = isnan(_585);
    bool _629 = _625 || _627;
    bool _631 = isnan(0.0);
    bool _633 = _629 || _631;
    int _635 = ~as_type<int>(_619);
    int _637 = _635 + 1;
    int _639 = _637 + 1;
    bool _641 = !_613;
    float _643 = _641 ? _189 : as_type<float>(_579);
    bool _645 = _585 > 0.0;
    int _647 = _639;
    float _649 = _619;
    float _651 = _595;
    if (!_597)
    {
        int _653 = ~as_type<int>(_619);
        int _655 = _653 + 1;
        _647 = _655;
    }
    int _657 = _647;
    bool _659 = _535 > 0.5;
    int _661 = _633 ? 0 : 1;
    bool _663 = _599 > 0.0;
    float _665 = _623 * _133;
    float _667 = -_199;
    int _669 = _659 ? as_type<int>(_667) : as_type<int>(_199);
    if (!_545)
    {
        _649 = _535;
    }
    float _671 = _649;
    bool _673 = !_617;
    float _675 = _673 ? _199 : as_type<float>(_669);
    float _677 = exp2(_665);
    bool _679 = _599 >= 0.0;
    bool _681 = isnan(_599);
    bool _683 = _679 || _681;
    bool _685 = isnan(0.0);
    bool _687 = _683 || _685;
    float _689 = _671;
    if (_545)
    {
        _689 = _533;
    }
    float _691 = _689;
    int _693 = ~_661;
    int _695 = _693 + 1;
    int _697 = _695 + 1;
    int _699 = _697;
    float _701 = _691;
    if (!_645)
    {
        int _703 = ~_661;
        int _705 = _703 + 1;
        _699 = _705;
    }
    int _707 = _699;
    float _709 = fma(_691, (*spvDescriptorSet0.vp_c9)._m0[83].w, _595);
    bool _711 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _713 = isnan(0.0);
    bool _715 = _711 || _713;
    bool _717 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _719 = _715 || _717;
    int _721 = _687 ? 0 : 1;
    if (!_545)
    {
        _651 = _533;
    }
    float _723 = _651;
    float _725 = _723;
    if (!_545)
    {
        _701 = _535;
    }
    float _727 = _701;
    float _729 = -_677;
    float _731 = _729 + 1.0;
    float _733 = _727;
    if (_545)
    {
        _725 = _531;
    }
    float _735 = _725;
    if (_545)
    {
        _733 = _533;
    }
    float _737 = _733;
    float _739 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _741 = _719 ? _731 : 0.0;
    int _743 = ~_721;
    int _745 = _743 + 1;
    int _747 = _745 + 1;
    float _749 = fma(_735, (*spvDescriptorSet0.vp_c9)._m0[83].z, _739);
    int _751 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _753 = _751 != 0;
    int _755 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _757 = _755 != 0;
    int _759 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _761 = _759 != 0;
    float _763 = _735 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _765 = _747;
    if (!_663)
    {
        int _767 = ~_721;
        int _769 = _767 + 1;
        _765 = _769;
    }
    int _771 = _765;
    float _773 = _737 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _775 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _777 = isnan(1.0);
    bool _779 = _775 || _777;
    bool _781 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _783 = _779 || _781;
    float _785 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _787 = 1.0 + _785;
    float _789 = 1.0 / _787;
    float _791 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _793 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _795 = !_753;
    int _797 = _795 ? 0 : 1;
    float _799 = -_791;
    float _801 = fma(_763, 2.0, _799);
    float _803 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _805 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _807 = abs(_797);
    float _809 = fma(_533, (*spvDescriptorSet0.vp_c9)._m0[78].w, _793);
    float _811 = fma(_773, -2.0, _803);
    float _813 = fma(_531, (*spvDescriptorSet0.vp_c9)._m0[78].z, _805);
    float _815 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[82].z, _749);
    float _817 = float(_657);
    float _819 = in.m_68.x;
    float _821 = in.m_68.y;
    float _823 = in.m_68.z;
    float _825 = float(_807);
    float _827 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[77].w, _809);
    float _829 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[82].w, _709);
    float _831 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[77].z, _813);
    float _833 = -_133;
    float _835 = fma(_833, (*spvDescriptorSet0.vp_c9)._m0[81].x, _801);
    float _837 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[81].y, _811);
    float _839 = _829;
    if (_783)
    {
        float _841 = _741 * _789;
        _155 = _841;
    }
    float _843 = _155;
    float _845 = _533 + _535;
    float _847 = _825 * _817;
    float _849 = _533 + (-0.5);
    float _851 = _845 + (-1.0);
    float _853 = _847 * (-2.0);
    bool _855 = !_757;
    int _857 = _855 ? 0 : 1;
    float _859 = _539 * _541;
    bool _861 = _531 > 0.5;
    float _863 = fma(_851, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _865 = !_761;
    int _867 = _865 ? 0 : 1;
    float _869 = fma(_583, _853, _583);
    int _871 = abs(_857);
    float _873 = _531 + (-0.5);
    float _875 = -_189;
    int _877 = _861 ? as_type<int>(_875) : as_type<int>(_189);
    float _879 = _535 + _531;
    int _881 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _883 = _881 != 0;
    float _885 = fma(_853, _819, _819);
    int _887 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _889 = _887 != 0;
    float _891 = _879 + (-1.0);
    int _893 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _895 = _893 != 0;
    float _897 = fma(_873, (*spvDescriptorSet0.vp_c9)._m0[196].x, _885);
    int _899 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _901 = _899 != 0;
    float _903 = _535 + (-0.5);
    int _905 = abs(_867);
    float _907 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _909 = float(_707);
    float _911 = fma(_869, _843, _897);
    float _913 = float(_871);
    float _915 = float(_771);
    float _917 = _911 * 0.15915493667125701904296875;
    float _919 = float(_905);
    float _921 = _913 * _909;
    float _923 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _925 = _921 * (-2.0);
    float _927 = _919 * _915;
    float _929 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _931 = _929 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _933 = in.m_48.x;
    float _935 = in.m_48.y;
    float _937 = in.m_48.z;
    float _939 = fma(_925, _821, _821);
    float _941 = fma(_863, _925, _863);
    float _943 = 1.0 / _931;
    float _945 = fma(_891, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _947 = fma(_849, (*spvDescriptorSet0.vp_c9)._m0[196].y, _939);
    float _949 = _927 * (-2.0);
    float _951 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _189);
    float _953 = fma(_941, _843, _947);
    float _955 = fma(_945, _949, _945);
    float _957 = fma(_949, _823, _823);
    float _959 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _961 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _959;
    float _963 = _953 * 0.15915493667125701904296875;
    float _965 = _481 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _967 = fma(_903, (*spvDescriptorSet0.vp_c9)._m0[196].z, _957);
    float _969 = _917 * 6.283185482025146484375;
    float _971 = sin(_969);
    float _973 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _975 = _529 + _973;
    float _977 = _965 * _951;
    float _979 = fma(_955, _843, _967);
    float _981 = _961 * _943;
    bool _983 = _529 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _985 = isnan(_529);
    bool _987 = _983 || _985;
    bool _989 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _991 = _987 || _989;
    float _993 = float(_991);
    float _995 = _979 * 0.15915493667125701904296875;
    float _997 = _935 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _999 = _935 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1001 = _935 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1003 = _917 * 6.283185482025146484375;
    float _1005 = cos(_1003);
    float _1007 = fma(_933, (*spvDescriptorSet0.vp_c10)._m0[4].x, _997);
    float _1009 = fma(_933, (*spvDescriptorSet0.vp_c10)._m0[5].x, _999);
    float _1011 = fma(_933, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1001);
    float _1013 = -_199;
    int _1015 = _569 ? as_type<int>(_1013) : as_type<int>(_199);
    float _1017 = _907 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1019 = fma(_981, _975, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _1021 = _529 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1023 = isnan(_529);
    bool _1025 = _1021 || _1023;
    bool _1027 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1029 = _1025 || _1027;
    float _1031 = float(_1029);
    float _1033 = _963 * 6.283185482025146484375;
    float _1035 = sin(_1033);
    float _1037 = _923 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1039 = -_993;
    float _1041 = _1039 + 1.0;
    bool _1043 = !_883;
    float _1045 = _1043 ? _189 : as_type<float>(_877);
    float _1047 = fma(_937, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1009);
    bool _1049 = !_889;
    float _1051 = _1049 ? _199 : as_type<float>(_1015);
    float _1053 = _1031 * _1041;
    float _1055 = fma(_937, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1007);
    float _1057 = _963 * 6.283185482025146484375;
    float _1059 = cos(_1057);
    float _1061 = _1045 + 0.5;
    float _1063 = _1051 + (-0.5);
    float _1065 = fma(_937, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1011);
    float _1067 = _1019 * _1053;
    float _1069 = fma(_1017, _1061, _593);
    float _1071 = -_1037;
    float _1073 = -_581;
    float _1075 = fma(_1071, _1063, _1073);
    float _1077 = -_1031;
    float _1079 = _1077 + 1.0;
    float _1081 = _995 * 6.283185482025146484375;
    float _1083 = cos(_1081);
    float _1085 = _971 * _1035;
    float _1087 = _1005 * _1035;
    float _1089 = fma(_1079, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1067);
    float _1091 = _1055 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1093 = _1065 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1095 = _551 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1097 = fma(_993, (*spvDescriptorSet0.vp_c9)._m0[132].x, _1089);
    float _1099 = _995 * 6.283185482025146484375;
    float _1101 = sin(_1099);
    float _1103 = _1005 * _1059;
    float _1105 = _971 * _1059;
    float _1107 = _1047 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1109 = _1005 * _1083;
    float _1111 = _971 * _1083;
    float _1113 = _1059 * _1083;
    float _1115 = _1035 * _1083;
    float _1117 = _1109 * _859;
    float _1119 = _1111 * _859;
    float _1121 = _1109 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1123 = _1109 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1125 = fma(_1101, _1103, _1085);
    float _1127 = -_1087;
    float _1129 = fma(_1101, _1105, _1127);
    float _1131 = -_1105;
    float _1133 = fma(_1101, _1087, _1131);
    float _1135 = fma(_1101, _1085, _1103);
    float _1137 = -_859;
    float _1139 = _1101 * _1137;
    float _1141 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1143 = fma(_1125, _977, _1117);
    float _1145 = fma(_1129, _977, _1119);
    float _1147 = fma(_1113, _977, _1139);
    float _1149 = -_199;
    int _1151 = _557 ? as_type<int>(_1149) : as_type<int>(_199);
    float _1153 = fma(_1133, _1141, _1143);
    float _1155 = _547 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1157 = fma(_1115, _1141, _1147);
    float _1159 = -_189;
    int _1161 = _659 ? as_type<int>(_1159) : as_type<int>(_189);
    float _1163 = _1153 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1165 = _1153 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1167 = fma(_1135, _1141, _1145);
    bool _1169 = !_901;
    float _1171 = _1169 ? _189 : as_type<float>(_1161);
    float _1173 = fma(_1157, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1163);
    float _1175 = fma(_1157, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1165);
    bool _1177 = !_895;
    float _1179 = _1177 ? _199 : as_type<float>(_1151);
    float _1181 = _1109 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1183 = fma(_1167, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1173);
    float _1185 = fma(_1167, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1175);
    float _1187 = _1171 + 0.5;
    float _1189 = -_1101;
    float _1191 = fma(_1189, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1121);
    float _1193 = _1183 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1195 = _1185 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1197 = _1179 + (-0.5);
    float _1199 = fma(_1155, _1187, _835);
    float _1201 = _1091 + _1193;
    float _1203 = _1093 + _1195;
    float _1205 = -_1095;
    float _1207 = -_837;
    float _1209 = fma(_1205, _1197, _1207);
    float _1211 = -_1101;
    float _1213 = fma(_1211, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1123);
    float _1215 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1217 = _1201 + _1215;
    float _1219 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1221 = _1203 + _1219;
    float _1223 = -_1101;
    float _1225 = fma(_1223, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1181);
    float _1227 = fma(_1111, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1191);
    float _1229 = _1217 * _1217;
    float _1231 = _1221 * _1221;
    float _1233 = fma(_1111, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1213);
    float _1235 = fma(_1111, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1225);
    float _1237 = _1125 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1239 = _1229 + _1231;
    float _1241 = _1125 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1243 = _1153 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1245 = fma(_1113, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1237);
    float _1247 = sqrt(_1239);
    float _1249 = _1125 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1251 = fma(_1113, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1241);
    float _1253 = fma(_1157, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1243);
    float _1255 = _1133 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1257 = _1133 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1259 = _199 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1261 = _1133 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1263 = fma(_1113, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1249);
    float _1265 = fma(_1115, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1255);
    float _1267 = fma(_1115, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1257);
    float _1269 = fma(_1115, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1261);
    float _1271 = fma(_1167, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1253);
    float _1273 = _1259 * _1227;
    float _1275 = _1259 * _1233;
    float _1277 = _1259 * _1235;
    bool _1279 = _1247 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1281 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1283 = _1271 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1285 = fma(_1129, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1251);
    float _1287 = fma(_1129, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1245);
    float _1289 = fma(_1129, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1263);
    float _1291 = _1107 + _1283;
    float _1293 = _1129;
    float _1295 = _1229;
    float _1297 = _1231;
    float _1299 = _1201;
    float _1301 = _1203;
    if (!_1279)
    {
        _1293 = _1291;
    }
    float _1303 = _1293;
    bool _1305 = !_1279;
    float _1307 = _1303;
    if (!_1305)
    {
        float _1309 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1311 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1313 = _1247 + _1311;
        float _1315 = rsqrt(_1239);
        float _1317 = _1313 * _1309;
        float _1319 = _1291 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1321 = _1317 * 0.15915493667125701904296875;
        float _1323 = _1321 * 6.283185482025146484375;
        float _1325 = sin(_1323);
        float _1327 = _1321 * 6.283185482025146484375;
        float _1329 = cos(_1327);
        float _1331 = fma(_1325, _1319, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1333 = _1315 * _1331;
        float _1335 = _1329 + (-1.0);
        float _1337 = fma(_1217, _1333, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1339 = fma(_1221, _1333, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1341 = _1335 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1343 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1345 = _1337 + _1343;
        float _1347 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1349 = _1339 + _1347;
        float _1351 = fma(_1291, _1329, _1341);
        float _1353 = _1345 * _1345;
        float _1355 = _1349 * _1349;
        _1307 = _1351;
        _1295 = _1353;
        _1297 = _1355;
        _1299 = _1337;
        _1301 = _1339;
    }
    float _1357 = _1307;
    float _1359 = _1295;
    float _1361 = _1297;
    float _1363 = _1299;
    float _1365 = _1301;
    float _1367 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1369 = _189 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1371 = fma(_1135, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1267);
    float _1373 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1375 = _1357 + _1373;
    float _1377 = _643 + 0.5;
    float _1379 = -_675;
    float _1381 = _1379 + 0.5;
    float _1383 = -_831;
    float _1385 = _1383 + 1.0;
    float _1387 = fma(_1375, _1375, _1359);
    float _1389 = _1377 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1391 = _1381 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1393 = fma(_1369, _1285, _1273);
    float _1395 = fma(_1369, _1287, _1275);
    float _1397 = fma(_1369, _1289, _1277);
    float _1399 = _1387 + _1361;
    float _1401 = -_827;
    float _1403 = _1401 + 1.0;
    float _1405 = _1389 * _1281;
    float _1407 = _1391 * _1367;
    float _1409 = -_1385;
    float _1411 = fma(_1045, _1409, _1069);
    float _1413 = fma(_1051, _1403, _1075);
    float _1415 = -_815;
    float _1417 = _1415 + 1.0;
    float _1419 = sqrt(_1399);
    float _1421 = fma(_1135, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1265);
    float _1423 = -_829;
    float _1425 = _1423 + 1.0;
    float _1427 = fma(_1135, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1269);
    float _1429 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1431 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1433 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1435 = fma(_1179, _1425, _1209);
    float _1437 = _1097 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1439 = -_1417;
    float _1441 = fma(_1171, _1439, _1199);
    float _1443 = _1421 + _1393;
    float _1445 = _1429 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1447 = _1431 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1449 = _1433 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1451 = _1371 + _1395;
    float _1453 = _1427 + _1397;
    out.m_70.x = _1405;
    out.m_70.y = _1407;
    bool _1455 = _1419 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1457 = isnan(_1419);
    bool _1459 = _1455 || _1457;
    bool _1461 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1463 = _1459 || _1461;
    out.m_72.x = _1445;
    out.m_72.y = _1447;
    out.m_72.z = _1449;
    out.m_72.w = _1437;
    out.m_74.x = _1411;
    out.m_74.y = _1413;
    out.m_74.z = _1441;
    out.m_74.w = _1435;
    out.m_76.x = _1443;
    out.m_76.y = _1451;
    out.m_76.z = _1453;
    if (!_1463)
    {
        _839 = 1.0;
    }
    float _1465 = _839;
    bool _1467 = !_1463;
    float _1469 = _1465;
    if (!_1467)
    {
        bool _1471 = _1419 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1473 = isnan(_1419);
        bool _1475 = _1471 || _1473;
        bool _1477 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1479 = _1475 || _1477;
        if (!_1479)
        {
            float _1481 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1483 = _1419 + _1481;
            float _1485 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1487 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1485;
            float _1489 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1491 = _1489 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1493 = 1.0 / _1487;
            float _1495 = _1483 * _1493;
            float _1497 = fma(_1495, _1491, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1469 = _1497;
            _1499 = true;
        }
        else
        {
            bool _1501 = _1419 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1503 = isnan(_1419);
            bool _1505 = _1501 || _1503;
            bool _1507 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1509 = _1505 || _1507;
            if (!_1509)
            {
                float _1511 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1513 = _1419 + _1511;
                float _1515 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1517 = _1515 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1519 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1521 = _1519 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1523 = 1.0 / _1517;
                float _1525 = _1513 * _1523;
                float _1527 = fma(_1525, _1521, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1469 = _1527;
                _1499 = true;
            }
            else
            {
                _1469 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1499 = false;
    float _1529 = _1469;
    float _1531 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1533 = _1357 + _1531;
    float _1535 = _1107 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1537 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1539 = _1363 + _1537;
    float _1541 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1543 = _1365 + _1541;
    float _1545 = fma(_1533, _1529, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1547 = fma(_1091, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1535);
    float _1549 = fma(_1539, _1529, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1551 = fma(_1543, _1529, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1553 = -_1107;
    float _1555 = _1553 + _1545;
    float _1557 = fma(_1093, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1547);
    float _1559 = -_1091;
    float _1561 = _1559 + _1549;
    float _1563 = _1107 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1565 = _1555 * _1555;
    float _1567 = _1557 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1569 = -_1093;
    float _1571 = _1569 + _1551;
    float _1573 = fma(_1091, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1563);
    float _1575 = fma(_1561, _1561, _1565);
    float _1577 = 1.0 / _1567;
    float _1579 = fma(_1093, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1573);
    float _1581 = fma(_1571, _1571, _1575);
    float _1583 = _1579 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1585 = sqrt(_1581);
    float _1587 = _1583 + _1567;
    float _1589 = _1587 * _1577;
    float _1591 = _1589 * 0.5;
    float _1593 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1595 = fma(_1591, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1593);
    bool _1597 = _1585 > 0.0;
    float _1599 = 1.0 / _1595;
    bool _1601 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1603 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1605 = _1601 || _1603;
    bool _1607 = isnan(0.5);
    bool _1609 = _1605 || _1607;
    bool _1611 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1613 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1615 = _1611 || _1613;
    bool _1617 = isnan(0.5);
    bool _1619 = _1615 || _1617;
    float _1621 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _1623 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    float _1625 = _1545;
    float _1627 = _1577;
    float _1629 = _1581;
    float _1631 = _1549;
    if (!_1597)
    {
        _1621 = _1549;
    }
    float _1633 = _1621;
    float _1635 = _1633;
    if (!_1597)
    {
        _1623 = _1551;
    }
    float _1637 = _1623;
    bool _1639 = !_1597;
    float _1641 = _1637;
    if (!_1639)
    {
        float _1643 = _203 * _203;
        float _1645 = fma(_201, _201, _1643);
        float _1647 = fma(_205, _205, _1645);
        float _1649 = rsqrt(_1581);
        float _1651 = sqrt(_1647);
        float _1653 = _1561 * _1649;
        float _1655 = _1555 * _1649;
        float _1657 = _1571 * _1649;
        bool _1659 = _1651 > 0.0;
        float _1661 = _1651;
        float _1663 = _1649;
        if (!_1659)
        {
            _1661 = _1549;
        }
        float _1665 = _1661;
        _1635 = _1665;
        if (!_1659)
        {
            _1663 = _1551;
        }
        float _1667 = _1663;
        bool _1669 = !_1659;
        _1641 = _1667;
        if (!_1669)
        {
            float _1671 = rsqrt(_1647);
            float _1673 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1675 = _203 * _1671;
            float _1677 = _201 * _1671;
            float _1679 = _1655 * _1675;
            float _1681 = _205 * _1671;
            float _1683 = fma(_1653, _1677, _1679);
            float _1685 = _1673 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1687 = fma(_1657, _1681, _1683);
            float _1689 = _1687 * _1685;
            float _1691 = fma(_201, _1689, _1549);
            float _1693 = fma(_203, _1689, _1545);
            float _1695 = fma(_205, _1689, _1551);
            _1635 = _1691;
            _1641 = _1695;
            _1625 = _1693;
            _1627 = _1685;
        }
    }
    float _1697 = _1635;
    float _1699 = _1641;
    float _1701 = _1625;
    float _1703 = _1627;
    float _1705 = _1703;
    float _1707 = _1701;
    if (_1609)
    {
        _1705 = 1.0;
    }
    float _1709 = _1705;
    float _1711 = _1709;
    if (_1619)
    {
        _209 = _1697;
    }
    float _1713 = _209;
    float _1715 = _1713;
    if (_1619)
    {
        _211 = _1699;
    }
    float _1717 = _211;
    float _1719 = _1717;
    if (!_1619)
    {
        float _1721 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1723 = _1107 + _1721;
        float _1725 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1727 = _1091 + _1725;
        float _1729 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1731 = -_1107;
        float _1733 = _1731 + _1701;
        float _1735 = _1723 * _1723;
        float _1737 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1739 = _1093 + _1737;
        float _1741 = -_1091;
        float _1743 = _1741 + _1697;
        float _1745 = -_1093;
        float _1747 = _1745 + _1699;
        float _1749 = fma(_1727, _1727, _1735);
        float _1751 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1753 = fma(_1739, _1739, _1749);
        float _1755 = sqrt(_1753);
        float _1757 = _1729 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1759 = precise::min(_1755, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1761 = _1759 * _1751;
        float _1763 = _1757 * _1761;
        float _1765 = fma(_1733, _1763, _1107);
        float _1767 = fma(_1743, _1763, _1091);
        float _1769 = fma(_1747, _1763, _1093);
        _1707 = _1765;
        _1715 = _1767;
        _1719 = _1769;
        _213 = _1761;
    }
    float _1771 = _1707;
    float _1773 = _1715;
    float _1775 = _1719;
    float _1777 = _213;
    float _1779 = _1777;
    if (_1609)
    {
        _1779 = 1.0;
    }
    float _1781 = _1779;
    float _1783 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1785 = _1599 * _1783;
    float _1787 = _1781;
    if (!_1609)
    {
        float _1789 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1791 = _1789 * 0.15915493667125701904296875;
        float _1793 = _1791 * 6.283185482025146484375;
        float _1795 = cos(_1793);
        float _1797 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1799 = _1797 * 0.15915493667125701904296875;
        float _1801 = _1791 * 6.283185482025146484375;
        float _1803 = sin(_1801);
        float _1805 = 1.0 / _1795;
        float _1807 = _1799 * 6.283185482025146484375;
        float _1809 = cos(_1807);
        float _1811 = _1803 * _1805;
        float _1813 = _1799 * 6.283185482025146484375;
        float _1815 = sin(_1813);
        float _1817 = _1809 * _1811;
        float _1819 = 1.0 / _1817;
        float _1821 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1823 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1821;
        float _1825 = 1.0 / _1823;
        float _1827 = _1815 * _1819;
        float _1829 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1831 = fma(_1785, _1827, _1829);
        float _1833 = _1831 * _1825;
        float _1835 = precise::clamp(_1833, 0.0, 1.0);
        _1629 = _1799;
        _1711 = _1835;
    }
    float _1837 = _1629;
    float _1839 = _1711;
    float _1841 = _1837;
    if (!_1609)
    {
        float _1843 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1845 = _1843 * 0.15915493667125701904296875;
        float _1847 = _1845 * 6.283185482025146484375;
        float _1849 = cos(_1847);
        float _1851 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1853 = _1851 * 0.15915493667125701904296875;
        float _1855 = _1845 * 6.283185482025146484375;
        float _1857 = sin(_1855);
        float _1859 = 1.0 / _1849;
        float _1861 = _1853 * 6.283185482025146484375;
        float _1863 = cos(_1861);
        float _1865 = _1857 * _1859;
        float _1867 = _1853 * 6.283185482025146484375;
        float _1869 = sin(_1867);
        float _1871 = _1863 * _1865;
        float _1873 = 1.0 / _1871;
        float _1875 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1877 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1875;
        float _1879 = 1.0 / _1877;
        float _1881 = _1869 * _1873;
        float _1883 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1885 = fma(_1785, _1881, _1883);
        float _1887 = _1885 * _1879;
        float _1889 = precise::clamp(_1887, 0.0, 1.0);
        float _1891 = -_1889;
        float _1893 = _1891 + 1.0;
        _1631 = _1873;
        _1841 = _1849;
        _1787 = _1893;
    }
    float _1895 = _1631;
    float _1897 = _1841;
    float _1899 = _1787;
    float _1901 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1903 = _1771 + _1901;
    float _1905 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1907 = _1773 + _1905;
    float _1909 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1911 = _1775 + _1909;
    float _1913 = _1903 * _1903;
    float _1915 = fma(_1907, _1907, _1913);
    float _1917 = fma(_1911, _1911, _1915);
    float _1919 = rsqrt(_1917);
    float _1921 = _1919 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1923 = _1907 * _1921;
    float _1925 = _1911 * _1921;
    float _1927 = _1923 * _1923;
    float _1929 = _1925 * _1925;
    float _1931 = _1927 + _1929;
    float _1933 = sqrt(_1931);
    bool _1935 = _1933 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1937 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1939 = _1933 + _1937;
    float _1941 = _1895;
    float _1943 = _1931;
    float _1945 = _1939;
    float _1947 = _1903;
    float _1949 = _1923;
    if (_1935)
    {
        float _1951 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1941 = _1951;
    }
    float _1953 = _1941;
    if (_1935)
    {
        float _1955 = rsqrt(_1931);
        _1943 = _1955;
    }
    float _1957 = _1943;
    float _1959 = _1953;
    float _1961 = _1957;
    if (_1935)
    {
        float _1963 = _1939 * _1953;
        _1945 = _1963;
    }
    float _1965 = _1945;
    if (_1935)
    {
        float _1967 = _1965 * 0.15915493667125701904296875;
        _1959 = _1967;
    }
    float _1969 = _1959;
    float _1971 = _1911;
    float _1973 = _1969;
    if (_1935)
    {
        float _1975 = _1969 * 6.283185482025146484375;
        float _1977 = sin(_1975);
        _1971 = _1977;
    }
    float _1979 = _1971;
    float _1981 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1983 = precise::max(0.0, _1981);
    float _1985 = _1897;
    if (_1935)
    {
        float _1987 = _1969 * 6.283185482025146484375;
        float _1989 = cos(_1987);
        _1985 = _1989;
    }
    float _1991 = _1985;
    float _1993 = -_1921;
    float _1995 = -_1983;
    float _1997 = fma(_1903, _1993, _1995);
    float _1999 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_1935)
    {
        float _2001 = _1997 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1947 = _2001;
    }
    float _2003 = _1947;
    float _2005 = _2003;
    if (!_1935)
    {
        _1973 = _1997;
    }
    float _2007 = _1973;
    float _2009 = fma(_1091, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2011 = _1979;
    float _2013 = _2007;
    if (_1935)
    {
        float _2015 = fma(_1979, _2003, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2011 = _2015;
    }
    float _2017 = _2011;
    float _2019 = sqrt(_1917);
    float _2021 = _2017;
    float _2023 = _1991;
    if (_1935)
    {
        float _2025 = _1991 + (-1.0);
        _2005 = _2025;
    }
    float _2027 = _2005;
    float _2029 = _2027;
    if (_1935)
    {
        float _2031 = _1957 * _2017;
        _1999 = _2031;
    }
    float _2033 = _1999;
    if (!_1935)
    {
        _2021 = _1927;
    }
    float _2035 = _2021;
    float _2037 = _2035;
    if (_1935)
    {
        float _2039 = _2027 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2029 = _2039;
    }
    float _2041 = _2029;
    if (_1935)
    {
        float _2043 = _1923 * _2033;
        _1949 = _2043;
    }
    float _2045 = _1949;
    if (!_1935)
    {
        _1961 = _1925;
    }
    float _2047 = _1961;
    float _2049 = _2047;
    if (_1935)
    {
        float _2051 = _1925 * _2033;
        _2049 = _2051;
    }
    float _2053 = _2049;
    if (_1935)
    {
        float _2055 = fma(_1997, _1991, _2041);
        _2013 = _2055;
    }
    float _2057 = _2013;
    if (_1935)
    {
        float _2059 = _2045 * _2045;
        _2037 = _2059;
    }
    float _2061 = _2037;
    if (!_1935)
    {
        _2023 = _1929;
    }
    float _2063 = _2023;
    float _2065 = _2063;
    if (_1935)
    {
        float _2067 = _2053 * _2053;
        _2065 = _2067;
    }
    float _2069 = _2065;
    float _2071 = fma(_2057, _2057, _2061);
    float _2073 = _1771 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2075 = floor(_2009);
    float _2077 = _2071 + _2069;
    float _2079 = fma(_1773, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2073);
    float _2081 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2083 = fma(_2019, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2081);
    float _2085 = precise::clamp(_2083, 0.0, 1.0);
    float _2087 = fma(_1093, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2089 = fma(_1775, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2079);
    float _2091 = -_2085;
    float _2093 = _2091 + 1.0;
    float _2095 = rsqrt(_2077);
    float _2097 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2099 = _2089 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2101 = _1771 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2103 = _2099 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2105 = fma(_1773, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2101);
    float _2107 = abs(_2093);
    float _2109 = log2(_2107);
    float _2111 = _1771 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2113 = -_2103;
    float _2115 = fma(_2113, _2097, 1.0);
    float _2117 = _1771 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2119 = fma(_1773, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2111);
    float _2121 = fma(_1773, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2117);
    float _2123 = _2095 * _2045;
    float _2125 = fma(_1775, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2119);
    float _2127 = _2095 * _2057;
    float _2129 = fma(_1775, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2121);
    float _2131 = _2123 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2133 = _2125 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2135 = _2095 * _2053;
    float _2137 = _2129 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2139 = -_2131;
    float _2141 = fma(_2127, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2139);
    float _2143 = _2133 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2145 = floor(_2087);
    float _2147 = _2109 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2149 = -_2135;
    float _2151 = fma(_2149, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2141);
    float _2153 = fma(_1775, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2105);
    float _2155 = fma(_2137, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2143);
    float _2157 = -_2075;
    float _2159 = _2009 + _2157;
    float _2161 = fma(_2151, -0.5, 0.5);
    float _2163 = _2153 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2165 = fma(_2099, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2155);
    float _2167 = exp2(_2147);
    float _2169 = _2133 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2171 = _2133 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2173 = fma(_2163, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2165);
    float _2175 = fma(_2151, 0.5, 0.5);
    float _2177 = fma(_2137, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2169);
    float _2179 = _2127 + 1.0;
    float _2181 = -_2145;
    float _2183 = _2087 + _2181;
    float _2185 = log2(_2115);
    float _2187 = fma(_2137, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2171);
    float _2189 = fma(_2099, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2177);
    float _2191 = fma(_2175, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2193 = fma(_2099, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2187);
    float _2195 = fma(_2175, _2191, -0.212114393711090087890625);
    float _2197 = 1.0 / _2173;
    float _2199 = -_2127;
    float _2201 = fma(_2167, _2179, _2199);
    float _2203 = fma(_2163, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2189);
    float _2205 = fma(_2163, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2193);
    float _2207 = sqrt(_2161);
    float _2209 = _2185 * 0.693147182464599609375;
    float2 _6183 = float2(_2159, _2183);
    float _2211 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6183, float2(0.0), isnan(_6183)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6183, float2(0.0), isnan(_6183)), level(0.0)).x;
    float _2213 = fma(_2175, _2195, 1.570728778839111328125);
    float _2215 = _2209 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2217 = _2203 * _2197;
    float _2219 = _2205 * _2197;
    float _2221 = fma(_2217, 0.5, 0.5);
    float _2223 = fma(_2219, -0.5, 0.5);
    float _2225 = _2207 * 0.636619746685028076171875;
    float3 _6215 = float3(_2221, _2223, _2215);
    float _2227 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6215, float3(0.0), isnan(_6215)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6215, float3(0.0), isnan(_6215)), level(0.0)).x;
    float _2229 = -_2213;
    float _2231 = fma(_2225, _2229, 1.0);
    float _2233 = fma(_2201, 0.5, 0.5);
    float3 _6233 = float3(_2221, _2223, _2215);
    float4 _2236 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6233, float3(0.0), isnan(_6233)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6233, float3(0.0), isnan(_6233)), level(0.0)).xyzw;
    float _2238 = _2236.x;
    float _2240 = _2236.y;
    float _2242 = _2236.z;
    float _2244 = _2236.w;
    float2 _6249 = float2(_2231, _2233);
    float3 _2248 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6249, float2(0.0), isnan(_6249)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6249, float2(0.0), isnan(_6249)), level(0.0)).xyz;
    float _2250 = _2248.x;
    float _2252 = _2248.y;
    float _2254 = _2248.z;
    float _2256 = abs(_1785);
    float _2258 = log2(_2256);
    float _2260 = _2133 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _2262 = _2019 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2264 = isnan(_2019);
    bool _2266 = _2262 || _2264;
    bool _2268 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2270 = _2266 || _2268;
    float _2272 = fma(_2137, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2260);
    bool _2274 = _1785 <= 8000.0;
    bool _2276 = isnan(_1785);
    bool _2278 = _2274 || _2276;
    bool _2280 = isnan(8000.0);
    bool _2282 = _2278 || _2280;
    float _2284 = float(_2282);
    float _2286 = _2173 * 0.5;
    float _2288 = fma(_2099, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2272);
    float _2290 = _2203 + _2173;
    float _2292 = _2258 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2294 = _2290 * 0.5;
    float _2296 = exp2(_2292);
    float _2298 = fma(_2296, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2300 = precise::clamp(_2298, 0.0, 1.0);
    float _2302 = fma(_2300, -2.0, 3.0);
    float _2304 = _2300 * _2300;
    float _2306 = _2304 * _2302;
    float _2308 = _2109 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2310 = fma(_2163, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2288);
    float _2312 = fma(_2205, -0.5, _2286);
    float _2314 = -_2306;
    float _2316 = _2314 + 1.0;
    float _2318 = _2310 + _2173;
    float _2320 = exp2(_2308);
    float _2322 = fma(_2316, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2306);
    out.gl_Position.x = _2203;
    out.gl_Position.y = _2205;
    out.gl_Position.z = _2310;
    out.gl_Position.w = _2173;
    float _2324 = _2318 * 0.5;
    float _2326 = _2284 * _2322;
    float _2328 = in.m_78.x;
    float _2330 = _2326 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.m_80.x = _2294;
    out.m_80.y = _2312;
    out.m_80.z = _2324;
    out.m_80.w = _2173;
    float _2332 = -_2320;
    float _2334 = _2332 + 1.0;
    float _2336 = _1839 * _1899;
    float _2338 = _2173;
    float _2340 = _2310;
    float _2342 = _2205;
    float _2344 = _2294;
    float _2346 = _2336;
    if (!_2270)
    {
        _2338 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2348 = _2338;
    float _2350 = _2334 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2352 = _2348;
    float _2354 = _2348;
    if (!_2270)
    {
        _2340 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2356 = _2340;
    float _2358 = _2356;
    float _2360 = _2356;
    if (!_2270)
    {
        _2342 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2362 = _2342;
    float _2364 = _2336 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2366 = _2362;
    float _2368 = _2362;
    if (!_2270)
    {
        _2344 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2370 = _2344;
    float _2372 = _2370;
    float _2374 = _2370;
    if (!_2270)
    {
        _2346 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2376 = _2346;
    float _2378 = -_2211;
    float _2380 = _2378 + 1.0;
    float _2382 = _2380 * _2330;
    float _2384 = precise::clamp(_2382, 0.0, 1.0);
    float _2386 = -_2384;
    float _2388 = fma(_2386, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2390 = _2388 * _2328;
    float _2392 = _2328;
    float _2394 = _2376;
    float _2396 = _2376;
    if (!_2270)
    {
        _2392 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2398 = _2392;
    float _2400 = _2350 * _2227;
    float _2402 = -_2350;
    float _2404 = _2402 + 1.0;
    float _2406 = _2390 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2408 = _2244 * _2400;
    out.m_82.x = _2406;
    float _2410 = _2254 * _2400;
    float _2412 = fma(_2250, _2408, _2238);
    float _2414 = fma(_2252, _2408, _2240);
    float _2416 = _2244 * _2404;
    float _2418 = fma(_2244, _2410, _2242);
    out.m_84.x = _2412;
    out.m_84.y = _2414;
    out.m_84.z = _2418;
    out.m_84.w = _2416;
    bool _2420 = !_2270;
    float _2422 = _2398;
    float _2424 = _2398;
    if (!_2420)
    {
        bool _2426 = _2019 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2428 = isnan(_2019);
        bool _2430 = _2426 || _2428;
        bool _2432 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2434 = _2430 || _2432;
        if (!_2434)
        {
            float _2436 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2438 = _2019 + _2436;
            float _2440 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2442 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2440;
            float _2444 = 1.0 / _2442;
            float _2446 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2448 = _2446 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2450 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2452 = _2450 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2454 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2456 = _2454 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2458 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2460 = _2458 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2462 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2464 = _2462 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2466 = _2438 * _2444;
            float _2468 = precise::clamp(_2466, 0.0, 1.0);
            float _2470 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2472 = _2470 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2474 = fma(_2468, _2448, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2476 = fma(_2468, _2472, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2478 = fma(_2468, _2452, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2480 = fma(_2468, _2456, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2482 = fma(_2468, _2460, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2484 = fma(_2468, _2464, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2374 = _2476;
            _2368 = _2482;
            _2424 = _2474;
            _2360 = _2480;
            _2354 = _2478;
            _2396 = _2484;
            _2486 = true;
        }
        else
        {
            bool _2488 = _2019 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2490 = isnan(_2019);
            bool _2492 = _2488 || _2490;
            bool _2494 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2496 = _2492 || _2494;
            if (!_2496)
            {
                _2422 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2498 = _2422;
            _2424 = _2498;
            if (!_2496)
            {
                _2372 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2500 = _2372;
            _2374 = _2500;
            if (!_2496)
            {
                _2352 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2502 = _2352;
            _2354 = _2502;
            if (!_2496)
            {
                _2358 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2504 = _2358;
            _2360 = _2504;
            if (!_2496)
            {
                _2366 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2506 = _2366;
            _2368 = _2506;
            if (!_2496)
            {
                _2394 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2508 = _2394;
            bool _2510 = !_2496;
            _2396 = _2508;
            if (!_2510)
            {
                bool _2512 = _2019 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2514 = isnan(_2019);
                bool _2516 = _2512 || _2514;
                bool _2518 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2520 = _2516 || _2518;
                if (!_2520)
                {
                    float _2522 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2524 = _2019 + _2522;
                    float _2526 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2528 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2526;
                    float _2530 = 1.0 / _2528;
                    float _2532 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2534 = _2532 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2536 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2538 = _2536 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2540 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2542 = _2540 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2544 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2546 = _2544 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2548 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2550 = _2548 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2552 = _2524 * _2530;
                    float _2554 = precise::clamp(_2552, 0.0, 1.0);
                    float _2556 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2558 = _2556 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2560 = fma(_2554, _2534, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2562 = fma(_2554, _2558, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2564 = fma(_2554, _2538, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2566 = fma(_2554, _2542, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2568 = fma(_2554, _2546, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2570 = fma(_2554, _2550, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2374 = _2562;
                    _2368 = _2568;
                    _2424 = _2560;
                    _2360 = _2566;
                    _2354 = _2564;
                    _2396 = _2570;
                    _2486 = true;
                }
                else
                {
                    _2374 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2368 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2424 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2360 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2354 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2396 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2486 = false;
    float _2572 = _2374;
    float _2574 = _2368;
    float _2576 = _2424;
    float _2578 = _2360;
    float _2580 = _2354;
    float _2582 = _2396;
    float _2584 = fma(_1451, -0.5, 0.5);
    float _2586 = precise::clamp(_2584, 0.0, 1.0);
    float _2588 = -_2572;
    float _2590 = _2588 + _2574;
    float _2592 = -_2576;
    float _2594 = _2592 + _2578;
    out.m_86.x = 0.0;
    float _2596 = fma(_2586, _2590, _2572);
    float _2598 = -_2580;
    float _2600 = _2598 + _2582;
    float _2602 = fma(_2586, _2594, _2576);
    float _2604 = _2596 * 0.586610972881317138671875;
    bool _2606 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2608 = fma(_2586, _2600, _2580);
    float _2610 = _2364 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2612 = fma(_2602, 0.298911988735198974609375, _2604);
    bool _2614 = _1839 > 0.0;
    bool _2616 = isnan(_1839);
    bool _2618 = _2614 || _2616;
    bool _2620 = isnan(0.0);
    bool _2622 = _2618 || _2620;
    float _2624 = fma(_2608, 0.114477999508380889892578125, _2612);
    out.m_51.x = _2610;
    bool _2626 = _1899 <= 0.0;
    bool _2628 = !_2622;
    bool _2630 = _2626 || _2628;
    float _2632 = -_2624;
    float _2634 = _2602 + _2632;
    float _2636 = -_2624;
    float _2638 = _2608 + _2636;
    float _2640 = fma(_2634, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2624);
    float _2642 = -_2624;
    float _2644 = _2596 + _2642;
    float _2646 = fma(_2638, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2624);
    float _2648 = fma(_2644, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2624);
    bool _2650 = !_2606;
    if (!_2650)
    {
        float _2652 = -_1771;
        float _2654 = _2652 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2656 = -_1773;
        float _2658 = _2656 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2660 = -_1775;
        float _2662 = _2660 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2664 = _2654 * _2654;
        float _2666 = fma(_2658, _2658, _2664);
        float _2668 = fma(_2662, _2662, _2666);
        float _2670 = sqrt(_2668);
        float _2672 = rsqrt(_2668);
        float _2674 = -_2670;
        float _2676 = _2674 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2678 = _2676 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2680 = precise::clamp(_2678, 0.0, 1.0);
        float _2682 = _2658 * _2672;
        float _2684 = _2654 * _2672;
        float _2686 = abs(_2680);
        float _2688 = log2(_2686);
        float _2690 = _2662 * _2672;
        float _2692 = _2682 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2694 = _1451 * _2684;
        float _2696 = -_2684;
        float _2698 = -_2692;
        float _2700 = fma(_2696, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2698);
        float _2702 = fma(_1443, _2682, _2694);
        float _2704 = -_2690;
        float _2706 = fma(_2704, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2700);
        float _2708 = fma(_1453, _2690, _2702);
        float _2710 = precise::clamp(_2708, 0.0, 1.0);
        float _2712 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2714 = _2706 + _2712;
        float _2716 = _2688 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2718 = _2714 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2720 = precise::clamp(_2718, 0.0, 1.0);
        float _2722 = exp2(_2716);
        float _2724 = _2722 * _2720;
        float _2726 = _2710 * _2724;
        float _2728 = _2726 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2730 = _2726 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2732 = _2726 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_86.x = _2728;
        out.m_86.y = _2730;
        out.m_86.z = _2732;
    }
    out.m_88.x = _2640;
    out.m_88.y = _2648;
    out.m_88.z = _2646;
    if (!_2630)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_51.x = 0.0;
    float _2734 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2734;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2486 = false;
    bool _1499 = false;
    bool _527 = false;
    bool _421 = false;
    bool _233 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _102 = in.m_48.w;
    float _104 = trunc(_102);
    int _107 = int(_104);
    bool _111 = _107 >= 1;
    float _113 = 0.0;
    if (!_111)
    {
        _113 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _115 = _113;
    if (!_111)
    {
        out.m_51.x = 0.0;
    }
    int _117 = 0;
    if (!_111)
    {
        float _119 = _115 * 5.0;
        _117 = as_type<int>(_119);
    }
    int _121 = _117;
    int _123 = _121;
    if (!_111)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2790 = as_type<float>(_121);
        out.gl_Position.z = _2790;
    }
    if (!_111)
    {
        return out;
    }
    float _125 = in.m_53.w;
    float _127 = float(_107);
    float _129 = 1.0 / _127;
    float _131 = -_125;
    float _133 = _131 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _135 = _125 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _137 = isnan(_125);
    bool _139 = _135 || _137;
    bool _141 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _143 = _139 || _141;
    float _145 = _133 * _129;
    bool _147 = _133 >= _127;
    bool _149 = !_143;
    bool _151 = _147 || _149;
    out.m_55.x = _145;
    float _153 = _125;
    float _155 = _133;
    if (_151)
    {
        _153 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _157 = _153;
    if (_151)
    {
        out.m_51.x = 0.0;
    }
    if (_151)
    {
        float _159 = _157 * 5.0;
        _123 = as_type<int>(_159);
    }
    int _161 = _123;
    if (_151)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2862 = as_type<float>(_161);
        out.gl_Position.z = _2862;
    }
    if (_151)
    {
        return out;
    }
    float _163 = as_type<float>(int(gl_VertexIndex));
    float _165 = in.m_60.x;
    float _167 = in.m_60.y;
    float _169 = in.m_60.z;
    int _171 = as_type<int>(_163) & 1;
    bool _173 = _171 != 0;
    int _175 = as_type<int>(_163) & 2;
    bool _177 = _175 != 0;
    bool _179 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _181 = _167 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _183 = _167 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _185 = _167 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _187 = !_173;
    float _189 = _187 ? (-0.5) : 0.5;
    float _191 = fma(_165, (*spvDescriptorSet0.vp_c10)._m0[4].x, _181);
    float _193 = fma(_165, (*spvDescriptorSet0.vp_c10)._m0[5].x, _183);
    float _195 = fma(_165, (*spvDescriptorSet0.vp_c10)._m0[6].x, _185);
    bool _197 = !_177;
    float _199 = _197 ? (-0.5) : 0.5;
    float _201 = fma(_169, (*spvDescriptorSet0.vp_c10)._m0[4].z, _191);
    float _203 = fma(_169, (*spvDescriptorSet0.vp_c10)._m0[5].z, _193);
    float _205 = fma(_169, (*spvDescriptorSet0.vp_c10)._m0[6].z, _195);
    bool _207 = !_179;
    float _209 = _205;
    float _211 = _203;
    float _213 = _201;
    float _231;
    if (!_207)
    {
        float _215 = in.m_62.x;
        float _217 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _219 = _215 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _221 = fma(_219, (*spvDescriptorSet0.vp_c9)._m0[12].x, _133);
        float _223 = _221 * _217;
        float _225 = floor(_223);
        float _227 = -_225;
        float _229 = _223 + _227;
        _231 = _229;
        _233 = true;
    }
    else
    {
        _231 = _145;
    }
    _233 = false;
    float _235 = _231;
    float _237 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _239 = _235 + _237;
    float _241 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _243 = _235 + _241;
    float _245 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _247 = _235 + _245;
    float _249 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _251 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _249;
    float _253 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _255 = _253 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _257 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _259 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _257;
    bool _261 = _235 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _263 = isnan(_235);
    bool _265 = _261 || _263;
    bool _267 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _269 = _265 || _267;
    float _271 = float(_269);
    float _273 = 1.0 / _251;
    bool _275 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _277 = 1.0 / _259;
    float _279 = 1.0 / _255;
    float _281 = _239 * _273;
    bool _283 = _235 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _285 = isnan(_235);
    bool _287 = _283 || _285;
    bool _289 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _291 = _287 || _289;
    float _293 = float(_291);
    float _295 = -_271;
    float _297 = _295 + 1.0;
    float _299 = _293 * _297;
    float _301 = _243 * _277;
    bool _303 = _235 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _305 = isnan(_235);
    bool _307 = _303 || _305;
    bool _309 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _311 = _307 || _309;
    float _313 = float(_311);
    float _315 = -_293;
    float _317 = _315 + 1.0;
    float _319 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _321 = _319 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _323 = _313 * _317;
    float _325 = -_313;
    float _327 = _325 + 1.0;
    float _329 = _247 * _279;
    bool _331 = _235 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _333 = isnan(_235);
    bool _335 = _331 || _333;
    bool _337 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _339 = _335 || _337;
    float _341 = float(_339);
    float _343 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _345 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _343;
    float _347 = fma(_321, _329, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _349 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _351 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _349;
    float _353 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _355 = _353 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _357 = fma(_345, _281, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _359 = _341 * _327;
    float _361 = fma(_351, _281, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _363 = fma(_355, _329, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _365 = -_341;
    float _367 = _365 + 1.0;
    float _369 = _357 * _359;
    float _371 = _361 * _359;
    float _373 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _375 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _373;
    float _377 = fma(_367, (*spvDescriptorSet0.vp_c9)._m0[143].x, _369);
    float _379 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _381 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _379;
    float _383 = fma(_367, (*spvDescriptorSet0.vp_c9)._m0[143].y, _371);
    float _385 = fma(_375, _301, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _387 = fma(_347, _323, _377);
    float _389 = fma(_381, _301, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _391 = fma(_363, _323, _383);
    float _393 = fma(_385, _299, _387);
    float _395 = fma(_389, _299, _391);
    float _397 = fma(_271, (*spvDescriptorSet0.vp_c9)._m0[146].x, _393);
    float _399 = fma(_271, (*spvDescriptorSet0.vp_c9)._m0[146].y, _395);
    bool _401 = !_275;
    float _419;
    if (!_401)
    {
        float _403 = in.m_62.x;
        float _405 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _407 = _403 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _409 = fma(_407, (*spvDescriptorSet0.vp_c9)._m0[11].y, _133);
        float _411 = _409 * _405;
        float _413 = floor(_411);
        float _415 = -_413;
        float _417 = _411 + _415;
        _419 = _417;
        _421 = true;
    }
    else
    {
        _419 = _145;
    }
    _421 = false;
    float _423 = _419;
    float _425 = in.m_64.x;
    float _427 = in.m_64.y;
    bool _429 = _423 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _431 = isnan(_423);
    bool _433 = _429 || _431;
    bool _435 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _437 = _433 || _435;
    float _439 = float(_437);
    float _441 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _443 = _441 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _445 = _423 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _447 = isnan(_423);
    bool _449 = _445 || _447;
    bool _451 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _453 = _449 || _451;
    float _455 = float(_453);
    float _457 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _459 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _457;
    float _461 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _463 = _423 + _461;
    float _465 = -_439;
    float _467 = _465 + 1.0;
    bool _469 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _471 = 1.0 / _443;
    float _473 = _455 * _467;
    float _475 = -_455;
    float _477 = _475 + 1.0;
    float _479 = _399 * _427;
    float _481 = _397 * _425;
    float _483 = _459 * _471;
    float _485 = fma(_483, _463, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _487 = _485 * _473;
    float _489 = fma(_477, (*spvDescriptorSet0.vp_c9)._m0[115].x, _487);
    float _491 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _493 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _495 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _497 = fma(_439, (*spvDescriptorSet0.vp_c9)._m0[116].x, _489);
    float _499 = _491 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _501 = _493 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _503 = _495 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _505 = _497 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_66.x = _499;
    out.m_66.y = _501;
    out.m_66.z = _503;
    out.m_66.w = _505;
    bool _507 = !_469;
    float _525;
    if (!_507)
    {
        float _509 = in.m_62.x;
        float _511 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _513 = _509 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _515 = fma(_513, (*spvDescriptorSet0.vp_c9)._m0[11].w, _133);
        float _517 = _515 * _511;
        float _519 = floor(_517);
        float _521 = -_519;
        float _523 = _517 + _521;
        _525 = _523;
        _527 = true;
    }
    else
    {
        _525 = _145;
    }
    _527 = false;
    float _529 = _525;
    float _531 = in.m_62.x;
    float _533 = in.m_62.y;
    float _535 = in.m_62.z;
    float _537 = in.m_62.w;
    float _539 = _479 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _541 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _199);
    int _543 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _545 = _543 != 0;
    float _547 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _549 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _551 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _553 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _555 = _535 * 2.0;
    bool _557 = _537 > 0.5;
    float _559 = _531 * 2.0;
    float _561 = _533 * 2.0;
    float _563 = _533 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _565 = _533 + _531;
    float _567 = floor(_555);
    bool _569 = _533 > 0.5;
    float _571 = fma(_563, -2.0, _549);
    float _573 = _565 + (-1.0);
    float _575 = _531 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _577 = -_189;
    int _579 = _569 ? as_type<int>(_577) : as_type<int>(_189);
    float _581 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[76].y, _571);
    float _583 = fma(_573, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _585 = floor(_559);
    float _587 = -_553;
    float _589 = fma(_575, 2.0, _587);
    float _591 = -_133;
    float _593 = fma(_591, (*spvDescriptorSet0.vp_c9)._m0[76].x, _589);
    float _595 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _597 = _567 > 0.0;
    float _599 = floor(_561);
    bool _601 = _567 >= 0.0;
    bool _603 = isnan(_567);
    bool _605 = _601 || _603;
    bool _607 = isnan(0.0);
    bool _609 = _605 || _607;
    int _611 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _613 = _611 != 0;
    int _615 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _617 = _615 != 0;
    float _619 = _609 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _621 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _623 = log2(_621);
    bool _625 = _585 >= 0.0;
    bool _627 = isnan(_585);
    bool _629 = _625 || _627;
    bool _631 = isnan(0.0);
    bool _633 = _629 || _631;
    int _635 = ~as_type<int>(_619);
    int _637 = _635 + 1;
    int _639 = _637 + 1;
    bool _641 = !_613;
    float _643 = _641 ? _189 : as_type<float>(_579);
    bool _645 = _585 > 0.0;
    int _647 = _639;
    float _649 = _619;
    float _651 = _595;
    if (!_597)
    {
        int _653 = ~as_type<int>(_619);
        int _655 = _653 + 1;
        _647 = _655;
    }
    int _657 = _647;
    bool _659 = _535 > 0.5;
    int _661 = _633 ? 0 : 1;
    bool _663 = _599 > 0.0;
    float _665 = _623 * _133;
    float _667 = -_199;
    int _669 = _659 ? as_type<int>(_667) : as_type<int>(_199);
    if (!_545)
    {
        _649 = _535;
    }
    float _671 = _649;
    bool _673 = !_617;
    float _675 = _673 ? _199 : as_type<float>(_669);
    float _677 = exp2(_665);
    bool _679 = _599 >= 0.0;
    bool _681 = isnan(_599);
    bool _683 = _679 || _681;
    bool _685 = isnan(0.0);
    bool _687 = _683 || _685;
    float _689 = _671;
    if (_545)
    {
        _689 = _533;
    }
    float _691 = _689;
    int _693 = ~_661;
    int _695 = _693 + 1;
    int _697 = _695 + 1;
    int _699 = _697;
    float _701 = _691;
    if (!_645)
    {
        int _703 = ~_661;
        int _705 = _703 + 1;
        _699 = _705;
    }
    int _707 = _699;
    float _709 = fma(_691, (*spvDescriptorSet0.vp_c9)._m0[83].w, _595);
    bool _711 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _713 = isnan(0.0);
    bool _715 = _711 || _713;
    bool _717 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _719 = _715 || _717;
    int _721 = _687 ? 0 : 1;
    if (!_545)
    {
        _651 = _533;
    }
    float _723 = _651;
    float _725 = _723;
    if (!_545)
    {
        _701 = _535;
    }
    float _727 = _701;
    float _729 = -_677;
    float _731 = _729 + 1.0;
    float _733 = _727;
    if (_545)
    {
        _725 = _531;
    }
    float _735 = _725;
    if (_545)
    {
        _733 = _533;
    }
    float _737 = _733;
    float _739 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _741 = _719 ? _731 : 0.0;
    int _743 = ~_721;
    int _745 = _743 + 1;
    int _747 = _745 + 1;
    float _749 = fma(_735, (*spvDescriptorSet0.vp_c9)._m0[83].z, _739);
    int _751 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _753 = _751 != 0;
    int _755 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _757 = _755 != 0;
    int _759 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _761 = _759 != 0;
    float _763 = _735 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _765 = _747;
    if (!_663)
    {
        int _767 = ~_721;
        int _769 = _767 + 1;
        _765 = _769;
    }
    int _771 = _765;
    float _773 = _737 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _775 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _777 = isnan(1.0);
    bool _779 = _775 || _777;
    bool _781 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _783 = _779 || _781;
    float _785 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _787 = 1.0 + _785;
    float _789 = 1.0 / _787;
    float _791 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _793 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _795 = !_753;
    int _797 = _795 ? 0 : 1;
    float _799 = -_791;
    float _801 = fma(_763, 2.0, _799);
    float _803 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _805 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _807 = abs(_797);
    float _809 = fma(_533, (*spvDescriptorSet0.vp_c9)._m0[78].w, _793);
    float _811 = fma(_773, -2.0, _803);
    float _813 = fma(_531, (*spvDescriptorSet0.vp_c9)._m0[78].z, _805);
    float _815 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[82].z, _749);
    float _817 = float(_657);
    float _819 = in.m_68.x;
    float _821 = in.m_68.y;
    float _823 = in.m_68.z;
    float _825 = float(_807);
    float _827 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[77].w, _809);
    float _829 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[82].w, _709);
    float _831 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[77].z, _813);
    float _833 = -_133;
    float _835 = fma(_833, (*spvDescriptorSet0.vp_c9)._m0[81].x, _801);
    float _837 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[81].y, _811);
    float _839 = _829;
    if (_783)
    {
        float _841 = _741 * _789;
        _155 = _841;
    }
    float _843 = _155;
    float _845 = _533 + _535;
    float _847 = _825 * _817;
    float _849 = _533 + (-0.5);
    float _851 = _845 + (-1.0);
    float _853 = _847 * (-2.0);
    bool _855 = !_757;
    int _857 = _855 ? 0 : 1;
    float _859 = _539 * _541;
    bool _861 = _531 > 0.5;
    float _863 = fma(_851, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _865 = !_761;
    int _867 = _865 ? 0 : 1;
    float _869 = fma(_583, _853, _583);
    int _871 = abs(_857);
    float _873 = _531 + (-0.5);
    float _875 = -_189;
    int _877 = _861 ? as_type<int>(_875) : as_type<int>(_189);
    float _879 = _535 + _531;
    int _881 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _883 = _881 != 0;
    float _885 = fma(_853, _819, _819);
    int _887 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _889 = _887 != 0;
    float _891 = _879 + (-1.0);
    int _893 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _895 = _893 != 0;
    float _897 = fma(_873, (*spvDescriptorSet0.vp_c9)._m0[196].x, _885);
    int _899 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _901 = _899 != 0;
    float _903 = _535 + (-0.5);
    int _905 = abs(_867);
    float _907 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _909 = float(_707);
    float _911 = fma(_869, _843, _897);
    float _913 = float(_871);
    float _915 = float(_771);
    float _917 = _911 * 0.15915493667125701904296875;
    float _919 = float(_905);
    float _921 = _913 * _909;
    float _923 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _925 = _921 * (-2.0);
    float _927 = _919 * _915;
    float _929 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _931 = _929 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _933 = in.m_48.x;
    float _935 = in.m_48.y;
    float _937 = in.m_48.z;
    float _939 = fma(_925, _821, _821);
    float _941 = fma(_863, _925, _863);
    float _943 = 1.0 / _931;
    float _945 = fma(_891, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _947 = fma(_849, (*spvDescriptorSet0.vp_c9)._m0[196].y, _939);
    float _949 = _927 * (-2.0);
    float _951 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _189);
    float _953 = fma(_941, _843, _947);
    float _955 = fma(_945, _949, _945);
    float _957 = fma(_949, _823, _823);
    float _959 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _961 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _959;
    float _963 = _953 * 0.15915493667125701904296875;
    float _965 = _481 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _967 = fma(_903, (*spvDescriptorSet0.vp_c9)._m0[196].z, _957);
    float _969 = _917 * 6.283185482025146484375;
    float _971 = sin(_969);
    float _973 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _975 = _529 + _973;
    float _977 = _965 * _951;
    float _979 = fma(_955, _843, _967);
    float _981 = _961 * _943;
    bool _983 = _529 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _985 = isnan(_529);
    bool _987 = _983 || _985;
    bool _989 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _991 = _987 || _989;
    float _993 = float(_991);
    float _995 = _979 * 0.15915493667125701904296875;
    float _997 = _935 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _999 = _935 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1001 = _935 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1003 = _917 * 6.283185482025146484375;
    float _1005 = cos(_1003);
    float _1007 = fma(_933, (*spvDescriptorSet0.vp_c10)._m0[4].x, _997);
    float _1009 = fma(_933, (*spvDescriptorSet0.vp_c10)._m0[5].x, _999);
    float _1011 = fma(_933, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1001);
    float _1013 = -_199;
    int _1015 = _569 ? as_type<int>(_1013) : as_type<int>(_199);
    float _1017 = _907 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1019 = fma(_981, _975, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _1021 = _529 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1023 = isnan(_529);
    bool _1025 = _1021 || _1023;
    bool _1027 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1029 = _1025 || _1027;
    float _1031 = float(_1029);
    float _1033 = _963 * 6.283185482025146484375;
    float _1035 = sin(_1033);
    float _1037 = _923 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1039 = -_993;
    float _1041 = _1039 + 1.0;
    bool _1043 = !_883;
    float _1045 = _1043 ? _189 : as_type<float>(_877);
    float _1047 = fma(_937, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1009);
    bool _1049 = !_889;
    float _1051 = _1049 ? _199 : as_type<float>(_1015);
    float _1053 = _1031 * _1041;
    float _1055 = fma(_937, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1007);
    float _1057 = _963 * 6.283185482025146484375;
    float _1059 = cos(_1057);
    float _1061 = _1045 + 0.5;
    float _1063 = _1051 + (-0.5);
    float _1065 = fma(_937, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1011);
    float _1067 = _1019 * _1053;
    float _1069 = fma(_1017, _1061, _593);
    float _1071 = -_1037;
    float _1073 = -_581;
    float _1075 = fma(_1071, _1063, _1073);
    float _1077 = -_1031;
    float _1079 = _1077 + 1.0;
    float _1081 = _995 * 6.283185482025146484375;
    float _1083 = cos(_1081);
    float _1085 = _971 * _1035;
    float _1087 = _1005 * _1035;
    float _1089 = fma(_1079, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1067);
    float _1091 = _1055 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1093 = _1065 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1095 = _551 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1097 = fma(_993, (*spvDescriptorSet0.vp_c9)._m0[132].x, _1089);
    float _1099 = _995 * 6.283185482025146484375;
    float _1101 = sin(_1099);
    float _1103 = _1005 * _1059;
    float _1105 = _971 * _1059;
    float _1107 = _1047 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1109 = _1005 * _1083;
    float _1111 = _971 * _1083;
    float _1113 = _1059 * _1083;
    float _1115 = _1035 * _1083;
    float _1117 = _1109 * _859;
    float _1119 = _1111 * _859;
    float _1121 = _1109 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1123 = _1109 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1125 = fma(_1101, _1103, _1085);
    float _1127 = -_1087;
    float _1129 = fma(_1101, _1105, _1127);
    float _1131 = -_1105;
    float _1133 = fma(_1101, _1087, _1131);
    float _1135 = fma(_1101, _1085, _1103);
    float _1137 = -_859;
    float _1139 = _1101 * _1137;
    float _1141 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1143 = fma(_1125, _977, _1117);
    float _1145 = fma(_1129, _977, _1119);
    float _1147 = fma(_1113, _977, _1139);
    float _1149 = -_199;
    int _1151 = _557 ? as_type<int>(_1149) : as_type<int>(_199);
    float _1153 = fma(_1133, _1141, _1143);
    float _1155 = _547 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1157 = fma(_1115, _1141, _1147);
    float _1159 = -_189;
    int _1161 = _659 ? as_type<int>(_1159) : as_type<int>(_189);
    float _1163 = _1153 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1165 = _1153 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1167 = fma(_1135, _1141, _1145);
    bool _1169 = !_901;
    float _1171 = _1169 ? _189 : as_type<float>(_1161);
    float _1173 = fma(_1157, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1163);
    float _1175 = fma(_1157, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1165);
    bool _1177 = !_895;
    float _1179 = _1177 ? _199 : as_type<float>(_1151);
    float _1181 = _1109 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1183 = fma(_1167, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1173);
    float _1185 = fma(_1167, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1175);
    float _1187 = _1171 + 0.5;
    float _1189 = -_1101;
    float _1191 = fma(_1189, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1121);
    float _1193 = _1183 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1195 = _1185 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1197 = _1179 + (-0.5);
    float _1199 = fma(_1155, _1187, _835);
    float _1201 = _1091 + _1193;
    float _1203 = _1093 + _1195;
    float _1205 = -_1095;
    float _1207 = -_837;
    float _1209 = fma(_1205, _1197, _1207);
    float _1211 = -_1101;
    float _1213 = fma(_1211, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1123);
    float _1215 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1217 = _1201 + _1215;
    float _1219 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1221 = _1203 + _1219;
    float _1223 = -_1101;
    float _1225 = fma(_1223, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1181);
    float _1227 = fma(_1111, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1191);
    float _1229 = _1217 * _1217;
    float _1231 = _1221 * _1221;
    float _1233 = fma(_1111, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1213);
    float _1235 = fma(_1111, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1225);
    float _1237 = _1125 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1239 = _1229 + _1231;
    float _1241 = _1125 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1243 = _1153 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1245 = fma(_1113, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1237);
    float _1247 = sqrt(_1239);
    float _1249 = _1125 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1251 = fma(_1113, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1241);
    float _1253 = fma(_1157, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1243);
    float _1255 = _1133 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1257 = _1133 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1259 = _199 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1261 = _1133 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1263 = fma(_1113, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1249);
    float _1265 = fma(_1115, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1255);
    float _1267 = fma(_1115, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1257);
    float _1269 = fma(_1115, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1261);
    float _1271 = fma(_1167, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1253);
    float _1273 = _1259 * _1227;
    float _1275 = _1259 * _1233;
    float _1277 = _1259 * _1235;
    bool _1279 = _1247 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1281 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1283 = _1271 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1285 = fma(_1129, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1251);
    float _1287 = fma(_1129, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1245);
    float _1289 = fma(_1129, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1263);
    float _1291 = _1107 + _1283;
    float _1293 = _1129;
    float _1295 = _1229;
    float _1297 = _1231;
    float _1299 = _1201;
    float _1301 = _1203;
    if (!_1279)
    {
        _1293 = _1291;
    }
    float _1303 = _1293;
    bool _1305 = !_1279;
    float _1307 = _1303;
    if (!_1305)
    {
        float _1309 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1311 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1313 = _1247 + _1311;
        float _1315 = rsqrt(_1239);
        float _1317 = _1313 * _1309;
        float _1319 = _1291 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1321 = _1317 * 0.15915493667125701904296875;
        float _1323 = _1321 * 6.283185482025146484375;
        float _1325 = sin(_1323);
        float _1327 = _1321 * 6.283185482025146484375;
        float _1329 = cos(_1327);
        float _1331 = fma(_1325, _1319, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1333 = _1315 * _1331;
        float _1335 = _1329 + (-1.0);
        float _1337 = fma(_1217, _1333, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1339 = fma(_1221, _1333, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1341 = _1335 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1343 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1345 = _1337 + _1343;
        float _1347 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1349 = _1339 + _1347;
        float _1351 = fma(_1291, _1329, _1341);
        float _1353 = _1345 * _1345;
        float _1355 = _1349 * _1349;
        _1307 = _1351;
        _1295 = _1353;
        _1297 = _1355;
        _1299 = _1337;
        _1301 = _1339;
    }
    float _1357 = _1307;
    float _1359 = _1295;
    float _1361 = _1297;
    float _1363 = _1299;
    float _1365 = _1301;
    float _1367 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1369 = _189 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1371 = fma(_1135, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1267);
    float _1373 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1375 = _1357 + _1373;
    float _1377 = _643 + 0.5;
    float _1379 = -_675;
    float _1381 = _1379 + 0.5;
    float _1383 = -_831;
    float _1385 = _1383 + 1.0;
    float _1387 = fma(_1375, _1375, _1359);
    float _1389 = _1377 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1391 = _1381 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1393 = fma(_1369, _1285, _1273);
    float _1395 = fma(_1369, _1287, _1275);
    float _1397 = fma(_1369, _1289, _1277);
    float _1399 = _1387 + _1361;
    float _1401 = -_827;
    float _1403 = _1401 + 1.0;
    float _1405 = _1389 * _1281;
    float _1407 = _1391 * _1367;
    float _1409 = -_1385;
    float _1411 = fma(_1045, _1409, _1069);
    float _1413 = fma(_1051, _1403, _1075);
    float _1415 = -_815;
    float _1417 = _1415 + 1.0;
    float _1419 = sqrt(_1399);
    float _1421 = fma(_1135, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1265);
    float _1423 = -_829;
    float _1425 = _1423 + 1.0;
    float _1427 = fma(_1135, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1269);
    float _1429 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1431 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1433 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1435 = fma(_1179, _1425, _1209);
    float _1437 = _1097 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1439 = -_1417;
    float _1441 = fma(_1171, _1439, _1199);
    float _1443 = _1421 + _1393;
    float _1445 = _1429 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1447 = _1431 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1449 = _1433 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1451 = _1371 + _1395;
    float _1453 = _1427 + _1397;
    out.m_70.x = _1405;
    out.m_70.y = _1407;
    bool _1455 = _1419 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1457 = isnan(_1419);
    bool _1459 = _1455 || _1457;
    bool _1461 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1463 = _1459 || _1461;
    out.m_72.x = _1445;
    out.m_72.y = _1447;
    out.m_72.z = _1449;
    out.m_72.w = _1437;
    out.m_74.x = _1411;
    out.m_74.y = _1413;
    out.m_74.z = _1441;
    out.m_74.w = _1435;
    out.m_76.x = _1443;
    out.m_76.y = _1451;
    out.m_76.z = _1453;
    if (!_1463)
    {
        _839 = 1.0;
    }
    float _1465 = _839;
    bool _1467 = !_1463;
    float _1469 = _1465;
    if (!_1467)
    {
        bool _1471 = _1419 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1473 = isnan(_1419);
        bool _1475 = _1471 || _1473;
        bool _1477 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1479 = _1475 || _1477;
        if (!_1479)
        {
            float _1481 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1483 = _1419 + _1481;
            float _1485 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1487 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1485;
            float _1489 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1491 = _1489 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1493 = 1.0 / _1487;
            float _1495 = _1483 * _1493;
            float _1497 = fma(_1495, _1491, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1469 = _1497;
            _1499 = true;
        }
        else
        {
            bool _1501 = _1419 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1503 = isnan(_1419);
            bool _1505 = _1501 || _1503;
            bool _1507 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1509 = _1505 || _1507;
            if (!_1509)
            {
                float _1511 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1513 = _1419 + _1511;
                float _1515 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1517 = _1515 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1519 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1521 = _1519 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1523 = 1.0 / _1517;
                float _1525 = _1513 * _1523;
                float _1527 = fma(_1525, _1521, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1469 = _1527;
                _1499 = true;
            }
            else
            {
                _1469 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1499 = false;
    float _1529 = _1469;
    float _1531 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1533 = _1357 + _1531;
    float _1535 = _1107 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1537 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1539 = _1363 + _1537;
    float _1541 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1543 = _1365 + _1541;
    float _1545 = fma(_1533, _1529, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1547 = fma(_1091, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1535);
    float _1549 = fma(_1539, _1529, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1551 = fma(_1543, _1529, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1553 = -_1107;
    float _1555 = _1553 + _1545;
    float _1557 = fma(_1093, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1547);
    float _1559 = -_1091;
    float _1561 = _1559 + _1549;
    float _1563 = _1107 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1565 = _1555 * _1555;
    float _1567 = _1557 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1569 = -_1093;
    float _1571 = _1569 + _1551;
    float _1573 = fma(_1091, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1563);
    float _1575 = fma(_1561, _1561, _1565);
    float _1577 = 1.0 / _1567;
    float _1579 = fma(_1093, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1573);
    float _1581 = fma(_1571, _1571, _1575);
    float _1583 = _1579 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1585 = sqrt(_1581);
    float _1587 = _1583 + _1567;
    float _1589 = _1587 * _1577;
    float _1591 = _1589 * 0.5;
    float _1593 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1595 = fma(_1591, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1593);
    bool _1597 = _1585 > 0.0;
    float _1599 = 1.0 / _1595;
    bool _1601 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1603 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1605 = _1601 || _1603;
    bool _1607 = isnan(0.5);
    bool _1609 = _1605 || _1607;
    bool _1611 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1613 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1615 = _1611 || _1613;
    bool _1617 = isnan(0.5);
    bool _1619 = _1615 || _1617;
    float _1621 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _1623 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    float _1625 = _1545;
    float _1627 = _1577;
    float _1629 = _1581;
    float _1631 = _1549;
    if (!_1597)
    {
        _1621 = _1549;
    }
    float _1633 = _1621;
    float _1635 = _1633;
    if (!_1597)
    {
        _1623 = _1551;
    }
    float _1637 = _1623;
    bool _1639 = !_1597;
    float _1641 = _1637;
    if (!_1639)
    {
        float _1643 = _203 * _203;
        float _1645 = fma(_201, _201, _1643);
        float _1647 = fma(_205, _205, _1645);
        float _1649 = rsqrt(_1581);
        float _1651 = sqrt(_1647);
        float _1653 = _1561 * _1649;
        float _1655 = _1555 * _1649;
        float _1657 = _1571 * _1649;
        bool _1659 = _1651 > 0.0;
        float _1661 = _1651;
        float _1663 = _1649;
        if (!_1659)
        {
            _1661 = _1549;
        }
        float _1665 = _1661;
        _1635 = _1665;
        if (!_1659)
        {
            _1663 = _1551;
        }
        float _1667 = _1663;
        bool _1669 = !_1659;
        _1641 = _1667;
        if (!_1669)
        {
            float _1671 = rsqrt(_1647);
            float _1673 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1675 = _203 * _1671;
            float _1677 = _201 * _1671;
            float _1679 = _1655 * _1675;
            float _1681 = _205 * _1671;
            float _1683 = fma(_1653, _1677, _1679);
            float _1685 = _1673 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1687 = fma(_1657, _1681, _1683);
            float _1689 = _1687 * _1685;
            float _1691 = fma(_201, _1689, _1549);
            float _1693 = fma(_203, _1689, _1545);
            float _1695 = fma(_205, _1689, _1551);
            _1635 = _1691;
            _1641 = _1695;
            _1625 = _1693;
            _1627 = _1685;
        }
    }
    float _1697 = _1635;
    float _1699 = _1641;
    float _1701 = _1625;
    float _1703 = _1627;
    float _1705 = _1703;
    float _1707 = _1701;
    if (_1609)
    {
        _1705 = 1.0;
    }
    float _1709 = _1705;
    float _1711 = _1709;
    if (_1619)
    {
        _209 = _1697;
    }
    float _1713 = _209;
    float _1715 = _1713;
    if (_1619)
    {
        _211 = _1699;
    }
    float _1717 = _211;
    float _1719 = _1717;
    if (!_1619)
    {
        float _1721 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1723 = _1107 + _1721;
        float _1725 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1727 = _1091 + _1725;
        float _1729 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1731 = -_1107;
        float _1733 = _1731 + _1701;
        float _1735 = _1723 * _1723;
        float _1737 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1739 = _1093 + _1737;
        float _1741 = -_1091;
        float _1743 = _1741 + _1697;
        float _1745 = -_1093;
        float _1747 = _1745 + _1699;
        float _1749 = fma(_1727, _1727, _1735);
        float _1751 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1753 = fma(_1739, _1739, _1749);
        float _1755 = sqrt(_1753);
        float _1757 = _1729 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1759 = precise::min(_1755, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1761 = _1759 * _1751;
        float _1763 = _1757 * _1761;
        float _1765 = fma(_1733, _1763, _1107);
        float _1767 = fma(_1743, _1763, _1091);
        float _1769 = fma(_1747, _1763, _1093);
        _1707 = _1765;
        _1715 = _1767;
        _1719 = _1769;
        _213 = _1761;
    }
    float _1771 = _1707;
    float _1773 = _1715;
    float _1775 = _1719;
    float _1777 = _213;
    float _1779 = _1777;
    if (_1609)
    {
        _1779 = 1.0;
    }
    float _1781 = _1779;
    float _1783 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1785 = _1599 * _1783;
    float _1787 = _1781;
    if (!_1609)
    {
        float _1789 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1791 = _1789 * 0.15915493667125701904296875;
        float _1793 = _1791 * 6.283185482025146484375;
        float _1795 = cos(_1793);
        float _1797 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1799 = _1797 * 0.15915493667125701904296875;
        float _1801 = _1791 * 6.283185482025146484375;
        float _1803 = sin(_1801);
        float _1805 = 1.0 / _1795;
        float _1807 = _1799 * 6.283185482025146484375;
        float _1809 = cos(_1807);
        float _1811 = _1803 * _1805;
        float _1813 = _1799 * 6.283185482025146484375;
        float _1815 = sin(_1813);
        float _1817 = _1809 * _1811;
        float _1819 = 1.0 / _1817;
        float _1821 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1823 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1821;
        float _1825 = 1.0 / _1823;
        float _1827 = _1815 * _1819;
        float _1829 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1831 = fma(_1785, _1827, _1829);
        float _1833 = _1831 * _1825;
        float _1835 = precise::clamp(_1833, 0.0, 1.0);
        _1629 = _1799;
        _1711 = _1835;
    }
    float _1837 = _1629;
    float _1839 = _1711;
    float _1841 = _1837;
    if (!_1609)
    {
        float _1843 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1845 = _1843 * 0.15915493667125701904296875;
        float _1847 = _1845 * 6.283185482025146484375;
        float _1849 = cos(_1847);
        float _1851 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1853 = _1851 * 0.15915493667125701904296875;
        float _1855 = _1845 * 6.283185482025146484375;
        float _1857 = sin(_1855);
        float _1859 = 1.0 / _1849;
        float _1861 = _1853 * 6.283185482025146484375;
        float _1863 = cos(_1861);
        float _1865 = _1857 * _1859;
        float _1867 = _1853 * 6.283185482025146484375;
        float _1869 = sin(_1867);
        float _1871 = _1863 * _1865;
        float _1873 = 1.0 / _1871;
        float _1875 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1877 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1875;
        float _1879 = 1.0 / _1877;
        float _1881 = _1869 * _1873;
        float _1883 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1885 = fma(_1785, _1881, _1883);
        float _1887 = _1885 * _1879;
        float _1889 = precise::clamp(_1887, 0.0, 1.0);
        float _1891 = -_1889;
        float _1893 = _1891 + 1.0;
        _1631 = _1873;
        _1841 = _1849;
        _1787 = _1893;
    }
    float _1895 = _1631;
    float _1897 = _1841;
    float _1899 = _1787;
    float _1901 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1903 = _1771 + _1901;
    float _1905 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1907 = _1773 + _1905;
    float _1909 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1911 = _1775 + _1909;
    float _1913 = _1903 * _1903;
    float _1915 = fma(_1907, _1907, _1913);
    float _1917 = fma(_1911, _1911, _1915);
    float _1919 = rsqrt(_1917);
    float _1921 = _1919 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1923 = _1907 * _1921;
    float _1925 = _1911 * _1921;
    float _1927 = _1923 * _1923;
    float _1929 = _1925 * _1925;
    float _1931 = _1927 + _1929;
    float _1933 = sqrt(_1931);
    bool _1935 = _1933 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1937 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1939 = _1933 + _1937;
    float _1941 = _1895;
    float _1943 = _1931;
    float _1945 = _1939;
    float _1947 = _1903;
    float _1949 = _1923;
    if (_1935)
    {
        float _1951 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1941 = _1951;
    }
    float _1953 = _1941;
    if (_1935)
    {
        float _1955 = rsqrt(_1931);
        _1943 = _1955;
    }
    float _1957 = _1943;
    float _1959 = _1953;
    float _1961 = _1957;
    if (_1935)
    {
        float _1963 = _1939 * _1953;
        _1945 = _1963;
    }
    float _1965 = _1945;
    if (_1935)
    {
        float _1967 = _1965 * 0.15915493667125701904296875;
        _1959 = _1967;
    }
    float _1969 = _1959;
    float _1971 = _1911;
    float _1973 = _1969;
    if (_1935)
    {
        float _1975 = _1969 * 6.283185482025146484375;
        float _1977 = sin(_1975);
        _1971 = _1977;
    }
    float _1979 = _1971;
    float _1981 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1983 = precise::max(0.0, _1981);
    float _1985 = _1897;
    if (_1935)
    {
        float _1987 = _1969 * 6.283185482025146484375;
        float _1989 = cos(_1987);
        _1985 = _1989;
    }
    float _1991 = _1985;
    float _1993 = -_1921;
    float _1995 = -_1983;
    float _1997 = fma(_1903, _1993, _1995);
    float _1999 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_1935)
    {
        float _2001 = _1997 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1947 = _2001;
    }
    float _2003 = _1947;
    float _2005 = _2003;
    if (!_1935)
    {
        _1973 = _1997;
    }
    float _2007 = _1973;
    float _2009 = fma(_1091, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2011 = _1979;
    float _2013 = _2007;
    if (_1935)
    {
        float _2015 = fma(_1979, _2003, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2011 = _2015;
    }
    float _2017 = _2011;
    float _2019 = sqrt(_1917);
    float _2021 = _2017;
    float _2023 = _1991;
    if (_1935)
    {
        float _2025 = _1991 + (-1.0);
        _2005 = _2025;
    }
    float _2027 = _2005;
    float _2029 = _2027;
    if (_1935)
    {
        float _2031 = _1957 * _2017;
        _1999 = _2031;
    }
    float _2033 = _1999;
    if (!_1935)
    {
        _2021 = _1927;
    }
    float _2035 = _2021;
    float _2037 = _2035;
    if (_1935)
    {
        float _2039 = _2027 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2029 = _2039;
    }
    float _2041 = _2029;
    if (_1935)
    {
        float _2043 = _1923 * _2033;
        _1949 = _2043;
    }
    float _2045 = _1949;
    if (!_1935)
    {
        _1961 = _1925;
    }
    float _2047 = _1961;
    float _2049 = _2047;
    if (_1935)
    {
        float _2051 = _1925 * _2033;
        _2049 = _2051;
    }
    float _2053 = _2049;
    if (_1935)
    {
        float _2055 = fma(_1997, _1991, _2041);
        _2013 = _2055;
    }
    float _2057 = _2013;
    if (_1935)
    {
        float _2059 = _2045 * _2045;
        _2037 = _2059;
    }
    float _2061 = _2037;
    if (!_1935)
    {
        _2023 = _1929;
    }
    float _2063 = _2023;
    float _2065 = _2063;
    if (_1935)
    {
        float _2067 = _2053 * _2053;
        _2065 = _2067;
    }
    float _2069 = _2065;
    float _2071 = fma(_2057, _2057, _2061);
    float _2073 = _1771 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2075 = floor(_2009);
    float _2077 = _2071 + _2069;
    float _2079 = fma(_1773, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2073);
    float _2081 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2083 = fma(_2019, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2081);
    float _2085 = precise::clamp(_2083, 0.0, 1.0);
    float _2087 = fma(_1093, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2089 = fma(_1775, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2079);
    float _2091 = -_2085;
    float _2093 = _2091 + 1.0;
    float _2095 = rsqrt(_2077);
    float _2097 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2099 = _2089 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2101 = _1771 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2103 = _2099 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2105 = fma(_1773, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2101);
    float _2107 = abs(_2093);
    float _2109 = log2(_2107);
    float _2111 = _1771 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2113 = -_2103;
    float _2115 = fma(_2113, _2097, 1.0);
    float _2117 = _1771 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2119 = fma(_1773, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2111);
    float _2121 = fma(_1773, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2117);
    float _2123 = _2095 * _2045;
    float _2125 = fma(_1775, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2119);
    float _2127 = _2095 * _2057;
    float _2129 = fma(_1775, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2121);
    float _2131 = _2123 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2133 = _2125 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2135 = _2095 * _2053;
    float _2137 = _2129 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2139 = -_2131;
    float _2141 = fma(_2127, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2139);
    float _2143 = _2133 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2145 = floor(_2087);
    float _2147 = _2109 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2149 = -_2135;
    float _2151 = fma(_2149, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2141);
    float _2153 = fma(_1775, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2105);
    float _2155 = fma(_2137, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2143);
    float _2157 = -_2075;
    float _2159 = _2009 + _2157;
    float _2161 = fma(_2151, -0.5, 0.5);
    float _2163 = _2153 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2165 = fma(_2099, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2155);
    float _2167 = exp2(_2147);
    float _2169 = _2133 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2171 = _2133 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2173 = fma(_2163, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2165);
    float _2175 = fma(_2151, 0.5, 0.5);
    float _2177 = fma(_2137, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2169);
    float _2179 = _2127 + 1.0;
    float _2181 = -_2145;
    float _2183 = _2087 + _2181;
    float _2185 = log2(_2115);
    float _2187 = fma(_2137, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2171);
    float _2189 = fma(_2099, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2177);
    float _2191 = fma(_2175, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2193 = fma(_2099, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2187);
    float _2195 = fma(_2175, _2191, -0.212114393711090087890625);
    float _2197 = 1.0 / _2173;
    float _2199 = -_2127;
    float _2201 = fma(_2167, _2179, _2199);
    float _2203 = fma(_2163, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2189);
    float _2205 = fma(_2163, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2193);
    float _2207 = sqrt(_2161);
    float _2209 = _2185 * 0.693147182464599609375;
    float2 _6183 = float2(_2159, _2183);
    float _2211 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6183, float2(0.0), isnan(_6183)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6183, float2(0.0), isnan(_6183)), level(0.0)).x;
    float _2213 = fma(_2175, _2195, 1.570728778839111328125);
    float _2215 = _2209 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2217 = _2203 * _2197;
    float _2219 = _2205 * _2197;
    float _2221 = fma(_2217, 0.5, 0.5);
    float _2223 = fma(_2219, -0.5, 0.5);
    float _2225 = _2207 * 0.636619746685028076171875;
    float3 _6215 = float3(_2221, _2223, _2215);
    float _2227 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6215, float3(0.0), isnan(_6215)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6215, float3(0.0), isnan(_6215)), level(0.0)).x;
    float _2229 = -_2213;
    float _2231 = fma(_2225, _2229, 1.0);
    float _2233 = fma(_2201, 0.5, 0.5);
    float3 _6233 = float3(_2221, _2223, _2215);
    float4 _2236 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6233, float3(0.0), isnan(_6233)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6233, float3(0.0), isnan(_6233)), level(0.0)).xyzw;
    float _2238 = _2236.x;
    float _2240 = _2236.y;
    float _2242 = _2236.z;
    float _2244 = _2236.w;
    float2 _6249 = float2(_2231, _2233);
    float3 _2248 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6249, float2(0.0), isnan(_6249)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6249, float2(0.0), isnan(_6249)), level(0.0)).xyz;
    float _2250 = _2248.x;
    float _2252 = _2248.y;
    float _2254 = _2248.z;
    float _2256 = abs(_1785);
    float _2258 = log2(_2256);
    float _2260 = _2133 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _2262 = _2019 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2264 = isnan(_2019);
    bool _2266 = _2262 || _2264;
    bool _2268 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2270 = _2266 || _2268;
    float _2272 = fma(_2137, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2260);
    bool _2274 = _1785 <= 8000.0;
    bool _2276 = isnan(_1785);
    bool _2278 = _2274 || _2276;
    bool _2280 = isnan(8000.0);
    bool _2282 = _2278 || _2280;
    float _2284 = float(_2282);
    float _2286 = _2173 * 0.5;
    float _2288 = fma(_2099, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2272);
    float _2290 = _2203 + _2173;
    float _2292 = _2258 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2294 = _2290 * 0.5;
    float _2296 = exp2(_2292);
    float _2298 = fma(_2296, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2300 = precise::clamp(_2298, 0.0, 1.0);
    float _2302 = fma(_2300, -2.0, 3.0);
    float _2304 = _2300 * _2300;
    float _2306 = _2304 * _2302;
    float _2308 = _2109 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2310 = fma(_2163, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2288);
    float _2312 = fma(_2205, -0.5, _2286);
    float _2314 = -_2306;
    float _2316 = _2314 + 1.0;
    float _2318 = _2310 + _2173;
    float _2320 = exp2(_2308);
    float _2322 = fma(_2316, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2306);
    out.gl_Position.x = _2203;
    out.gl_Position.y = _2205;
    out.gl_Position.z = _2310;
    out.gl_Position.w = _2173;
    float _2324 = _2318 * 0.5;
    float _2326 = _2284 * _2322;
    float _2328 = in.m_78.x;
    float _2330 = _2326 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.m_80.x = _2294;
    out.m_80.y = _2312;
    out.m_80.z = _2324;
    out.m_80.w = _2173;
    float _2332 = -_2320;
    float _2334 = _2332 + 1.0;
    float _2336 = _1839 * _1899;
    float _2338 = _2173;
    float _2340 = _2310;
    float _2342 = _2205;
    float _2344 = _2294;
    float _2346 = _2336;
    if (!_2270)
    {
        _2338 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2348 = _2338;
    float _2350 = _2334 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2352 = _2348;
    float _2354 = _2348;
    if (!_2270)
    {
        _2340 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2356 = _2340;
    float _2358 = _2356;
    float _2360 = _2356;
    if (!_2270)
    {
        _2342 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2362 = _2342;
    float _2364 = _2336 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2366 = _2362;
    float _2368 = _2362;
    if (!_2270)
    {
        _2344 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2370 = _2344;
    float _2372 = _2370;
    float _2374 = _2370;
    if (!_2270)
    {
        _2346 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2376 = _2346;
    float _2378 = -_2211;
    float _2380 = _2378 + 1.0;
    float _2382 = _2380 * _2330;
    float _2384 = precise::clamp(_2382, 0.0, 1.0);
    float _2386 = -_2384;
    float _2388 = fma(_2386, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2390 = _2388 * _2328;
    float _2392 = _2328;
    float _2394 = _2376;
    float _2396 = _2376;
    if (!_2270)
    {
        _2392 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2398 = _2392;
    float _2400 = _2350 * _2227;
    float _2402 = -_2350;
    float _2404 = _2402 + 1.0;
    float _2406 = _2390 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2408 = _2244 * _2400;
    out.m_82.x = _2406;
    float _2410 = _2254 * _2400;
    float _2412 = fma(_2250, _2408, _2238);
    float _2414 = fma(_2252, _2408, _2240);
    float _2416 = _2244 * _2404;
    float _2418 = fma(_2244, _2410, _2242);
    out.m_84.x = _2412;
    out.m_84.y = _2414;
    out.m_84.z = _2418;
    out.m_84.w = _2416;
    bool _2420 = !_2270;
    float _2422 = _2398;
    float _2424 = _2398;
    if (!_2420)
    {
        bool _2426 = _2019 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2428 = isnan(_2019);
        bool _2430 = _2426 || _2428;
        bool _2432 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2434 = _2430 || _2432;
        if (!_2434)
        {
            float _2436 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2438 = _2019 + _2436;
            float _2440 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2442 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2440;
            float _2444 = 1.0 / _2442;
            float _2446 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2448 = _2446 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2450 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2452 = _2450 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2454 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2456 = _2454 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2458 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2460 = _2458 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2462 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2464 = _2462 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2466 = _2438 * _2444;
            float _2468 = precise::clamp(_2466, 0.0, 1.0);
            float _2470 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2472 = _2470 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2474 = fma(_2468, _2448, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2476 = fma(_2468, _2472, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2478 = fma(_2468, _2452, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2480 = fma(_2468, _2456, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2482 = fma(_2468, _2460, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2484 = fma(_2468, _2464, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2374 = _2476;
            _2368 = _2482;
            _2424 = _2474;
            _2360 = _2480;
            _2354 = _2478;
            _2396 = _2484;
            _2486 = true;
        }
        else
        {
            bool _2488 = _2019 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2490 = isnan(_2019);
            bool _2492 = _2488 || _2490;
            bool _2494 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2496 = _2492 || _2494;
            if (!_2496)
            {
                _2422 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2498 = _2422;
            _2424 = _2498;
            if (!_2496)
            {
                _2372 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2500 = _2372;
            _2374 = _2500;
            if (!_2496)
            {
                _2352 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2502 = _2352;
            _2354 = _2502;
            if (!_2496)
            {
                _2358 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2504 = _2358;
            _2360 = _2504;
            if (!_2496)
            {
                _2366 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2506 = _2366;
            _2368 = _2506;
            if (!_2496)
            {
                _2394 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2508 = _2394;
            bool _2510 = !_2496;
            _2396 = _2508;
            if (!_2510)
            {
                bool _2512 = _2019 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2514 = isnan(_2019);
                bool _2516 = _2512 || _2514;
                bool _2518 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2520 = _2516 || _2518;
                if (!_2520)
                {
                    float _2522 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2524 = _2019 + _2522;
                    float _2526 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2528 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2526;
                    float _2530 = 1.0 / _2528;
                    float _2532 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2534 = _2532 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2536 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2538 = _2536 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2540 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2542 = _2540 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2544 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2546 = _2544 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2548 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2550 = _2548 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2552 = _2524 * _2530;
                    float _2554 = precise::clamp(_2552, 0.0, 1.0);
                    float _2556 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2558 = _2556 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2560 = fma(_2554, _2534, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2562 = fma(_2554, _2558, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2564 = fma(_2554, _2538, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2566 = fma(_2554, _2542, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2568 = fma(_2554, _2546, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2570 = fma(_2554, _2550, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2374 = _2562;
                    _2368 = _2568;
                    _2424 = _2560;
                    _2360 = _2566;
                    _2354 = _2564;
                    _2396 = _2570;
                    _2486 = true;
                }
                else
                {
                    _2374 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2368 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2424 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2360 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2354 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2396 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2486 = false;
    float _2572 = _2374;
    float _2574 = _2368;
    float _2576 = _2424;
    float _2578 = _2360;
    float _2580 = _2354;
    float _2582 = _2396;
    float _2584 = fma(_1451, -0.5, 0.5);
    float _2586 = precise::clamp(_2584, 0.0, 1.0);
    float _2588 = -_2572;
    float _2590 = _2588 + _2574;
    float _2592 = -_2576;
    float _2594 = _2592 + _2578;
    out.m_86.x = 0.0;
    float _2596 = fma(_2586, _2590, _2572);
    float _2598 = -_2580;
    float _2600 = _2598 + _2582;
    float _2602 = fma(_2586, _2594, _2576);
    float _2604 = _2596 * 0.586610972881317138671875;
    bool _2606 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2608 = fma(_2586, _2600, _2580);
    float _2610 = _2364 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2612 = fma(_2602, 0.298911988735198974609375, _2604);
    bool _2614 = _1839 > 0.0;
    bool _2616 = isnan(_1839);
    bool _2618 = _2614 || _2616;
    bool _2620 = isnan(0.0);
    bool _2622 = _2618 || _2620;
    float _2624 = fma(_2608, 0.114477999508380889892578125, _2612);
    out.m_51.x = _2610;
    bool _2626 = _1899 <= 0.0;
    bool _2628 = !_2622;
    bool _2630 = _2626 || _2628;
    float _2632 = -_2624;
    float _2634 = _2602 + _2632;
    float _2636 = -_2624;
    float _2638 = _2608 + _2636;
    float _2640 = fma(_2634, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2624);
    float _2642 = -_2624;
    float _2644 = _2596 + _2642;
    float _2646 = fma(_2638, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2624);
    float _2648 = fma(_2644, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2624);
    bool _2650 = !_2606;
    if (!_2650)
    {
        float _2652 = -_1771;
        float _2654 = _2652 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2656 = -_1773;
        float _2658 = _2656 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2660 = -_1775;
        float _2662 = _2660 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2664 = _2654 * _2654;
        float _2666 = fma(_2658, _2658, _2664);
        float _2668 = fma(_2662, _2662, _2666);
        float _2670 = sqrt(_2668);
        float _2672 = rsqrt(_2668);
        float _2674 = -_2670;
        float _2676 = _2674 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2678 = _2676 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2680 = precise::clamp(_2678, 0.0, 1.0);
        float _2682 = _2658 * _2672;
        float _2684 = _2654 * _2672;
        float _2686 = abs(_2680);
        float _2688 = log2(_2686);
        float _2690 = _2662 * _2672;
        float _2692 = _2682 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2694 = _1451 * _2684;
        float _2696 = -_2684;
        float _2698 = -_2692;
        float _2700 = fma(_2696, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2698);
        float _2702 = fma(_1443, _2682, _2694);
        float _2704 = -_2690;
        float _2706 = fma(_2704, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2700);
        float _2708 = fma(_1453, _2690, _2702);
        float _2710 = precise::clamp(_2708, 0.0, 1.0);
        float _2712 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2714 = _2706 + _2712;
        float _2716 = _2688 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2718 = _2714 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2720 = precise::clamp(_2718, 0.0, 1.0);
        float _2722 = exp2(_2716);
        float _2724 = _2722 * _2720;
        float _2726 = _2710 * _2724;
        float _2728 = _2726 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2730 = _2726 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2732 = _2726 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_86.x = _2728;
        out.m_86.y = _2730;
        out.m_86.z = _2732;
    }
    out.m_88.x = _2640;
    out.m_88.y = _2648;
    out.m_88.z = _2646;
    if (!_2630)
    {
        return out;
    }
    out.m_51.x = 0.0;
    float _2734 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2734;
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
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2486 = false;
    bool _1499 = false;
    bool _527 = false;
    bool _421 = false;
    bool _233 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _102 = in.m_48.w;
    float _104 = trunc(_102);
    int _107 = int(_104);
    bool _111 = _107 >= 1;
    float _113 = 0.0;
    if (!_111)
    {
        _113 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _115 = _113;
    if (!_111)
    {
        out.m_51.x = 0.0;
    }
    int _117 = 0;
    if (!_111)
    {
        float _119 = _115 * 5.0;
        _117 = as_type<int>(_119);
    }
    int _121 = _117;
    int _123 = _121;
    if (!_111)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2790 = as_type<float>(_121);
        out.gl_Position.z = _2790;
    }
    if (!_111)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _125 = in.m_53.w;
    float _127 = float(_107);
    float _129 = 1.0 / _127;
    float _131 = -_125;
    float _133 = _131 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _135 = _125 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _137 = isnan(_125);
    bool _139 = _135 || _137;
    bool _141 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _143 = _139 || _141;
    float _145 = _133 * _129;
    bool _147 = _133 >= _127;
    bool _149 = !_143;
    bool _151 = _147 || _149;
    out.m_55.x = _145;
    float _153 = _125;
    float _155 = _133;
    if (_151)
    {
        _153 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _157 = _153;
    if (_151)
    {
        out.m_51.x = 0.0;
    }
    if (_151)
    {
        float _159 = _157 * 5.0;
        _123 = as_type<int>(_159);
    }
    int _161 = _123;
    if (_151)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2862 = as_type<float>(_161);
        out.gl_Position.z = _2862;
    }
    if (_151)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _163 = as_type<float>(int(gl_VertexIndex));
    float _165 = in.m_60.x;
    float _167 = in.m_60.y;
    float _169 = in.m_60.z;
    int _171 = as_type<int>(_163) & 1;
    bool _173 = _171 != 0;
    int _175 = as_type<int>(_163) & 2;
    bool _177 = _175 != 0;
    bool _179 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _181 = _167 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _183 = _167 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _185 = _167 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _187 = !_173;
    float _189 = _187 ? (-0.5) : 0.5;
    float _191 = fma(_165, (*spvDescriptorSet0.vp_c10)._m0[4].x, _181);
    float _193 = fma(_165, (*spvDescriptorSet0.vp_c10)._m0[5].x, _183);
    float _195 = fma(_165, (*spvDescriptorSet0.vp_c10)._m0[6].x, _185);
    bool _197 = !_177;
    float _199 = _197 ? (-0.5) : 0.5;
    float _201 = fma(_169, (*spvDescriptorSet0.vp_c10)._m0[4].z, _191);
    float _203 = fma(_169, (*spvDescriptorSet0.vp_c10)._m0[5].z, _193);
    float _205 = fma(_169, (*spvDescriptorSet0.vp_c10)._m0[6].z, _195);
    bool _207 = !_179;
    float _209 = _205;
    float _211 = _203;
    float _213 = _201;
    float _231;
    if (!_207)
    {
        float _215 = in.m_62.x;
        float _217 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _219 = _215 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _221 = fma(_219, (*spvDescriptorSet0.vp_c9)._m0[12].x, _133);
        float _223 = _221 * _217;
        float _225 = floor(_223);
        float _227 = -_225;
        float _229 = _223 + _227;
        _231 = _229;
        _233 = true;
    }
    else
    {
        _231 = _145;
    }
    _233 = false;
    float _235 = _231;
    float _237 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _239 = _235 + _237;
    float _241 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _243 = _235 + _241;
    float _245 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _247 = _235 + _245;
    float _249 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _251 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _249;
    float _253 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _255 = _253 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _257 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _259 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _257;
    bool _261 = _235 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _263 = isnan(_235);
    bool _265 = _261 || _263;
    bool _267 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _269 = _265 || _267;
    float _271 = float(_269);
    float _273 = 1.0 / _251;
    bool _275 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _277 = 1.0 / _259;
    float _279 = 1.0 / _255;
    float _281 = _239 * _273;
    bool _283 = _235 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _285 = isnan(_235);
    bool _287 = _283 || _285;
    bool _289 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _291 = _287 || _289;
    float _293 = float(_291);
    float _295 = -_271;
    float _297 = _295 + 1.0;
    float _299 = _293 * _297;
    float _301 = _243 * _277;
    bool _303 = _235 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _305 = isnan(_235);
    bool _307 = _303 || _305;
    bool _309 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _311 = _307 || _309;
    float _313 = float(_311);
    float _315 = -_293;
    float _317 = _315 + 1.0;
    float _319 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _321 = _319 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _323 = _313 * _317;
    float _325 = -_313;
    float _327 = _325 + 1.0;
    float _329 = _247 * _279;
    bool _331 = _235 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _333 = isnan(_235);
    bool _335 = _331 || _333;
    bool _337 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _339 = _335 || _337;
    float _341 = float(_339);
    float _343 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _345 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _343;
    float _347 = fma(_321, _329, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _349 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _351 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _349;
    float _353 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _355 = _353 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _357 = fma(_345, _281, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _359 = _341 * _327;
    float _361 = fma(_351, _281, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _363 = fma(_355, _329, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _365 = -_341;
    float _367 = _365 + 1.0;
    float _369 = _357 * _359;
    float _371 = _361 * _359;
    float _373 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _375 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _373;
    float _377 = fma(_367, (*spvDescriptorSet0.vp_c9)._m0[143].x, _369);
    float _379 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _381 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _379;
    float _383 = fma(_367, (*spvDescriptorSet0.vp_c9)._m0[143].y, _371);
    float _385 = fma(_375, _301, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _387 = fma(_347, _323, _377);
    float _389 = fma(_381, _301, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _391 = fma(_363, _323, _383);
    float _393 = fma(_385, _299, _387);
    float _395 = fma(_389, _299, _391);
    float _397 = fma(_271, (*spvDescriptorSet0.vp_c9)._m0[146].x, _393);
    float _399 = fma(_271, (*spvDescriptorSet0.vp_c9)._m0[146].y, _395);
    bool _401 = !_275;
    float _419;
    if (!_401)
    {
        float _403 = in.m_62.x;
        float _405 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _407 = _403 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _409 = fma(_407, (*spvDescriptorSet0.vp_c9)._m0[11].y, _133);
        float _411 = _409 * _405;
        float _413 = floor(_411);
        float _415 = -_413;
        float _417 = _411 + _415;
        _419 = _417;
        _421 = true;
    }
    else
    {
        _419 = _145;
    }
    _421 = false;
    float _423 = _419;
    float _425 = in.m_64.x;
    float _427 = in.m_64.y;
    bool _429 = _423 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _431 = isnan(_423);
    bool _433 = _429 || _431;
    bool _435 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _437 = _433 || _435;
    float _439 = float(_437);
    float _441 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _443 = _441 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _445 = _423 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _447 = isnan(_423);
    bool _449 = _445 || _447;
    bool _451 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _453 = _449 || _451;
    float _455 = float(_453);
    float _457 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _459 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _457;
    float _461 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _463 = _423 + _461;
    float _465 = -_439;
    float _467 = _465 + 1.0;
    bool _469 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _471 = 1.0 / _443;
    float _473 = _455 * _467;
    float _475 = -_455;
    float _477 = _475 + 1.0;
    float _479 = _399 * _427;
    float _481 = _397 * _425;
    float _483 = _459 * _471;
    float _485 = fma(_483, _463, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _487 = _485 * _473;
    float _489 = fma(_477, (*spvDescriptorSet0.vp_c9)._m0[115].x, _487);
    float _491 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _493 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _495 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _497 = fma(_439, (*spvDescriptorSet0.vp_c9)._m0[116].x, _489);
    float _499 = _491 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _501 = _493 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _503 = _495 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _505 = _497 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_66.x = _499;
    out.m_66.y = _501;
    out.m_66.z = _503;
    out.m_66.w = _505;
    bool _507 = !_469;
    float _525;
    if (!_507)
    {
        float _509 = in.m_62.x;
        float _511 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _513 = _509 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _515 = fma(_513, (*spvDescriptorSet0.vp_c9)._m0[11].w, _133);
        float _517 = _515 * _511;
        float _519 = floor(_517);
        float _521 = -_519;
        float _523 = _517 + _521;
        _525 = _523;
        _527 = true;
    }
    else
    {
        _525 = _145;
    }
    _527 = false;
    float _529 = _525;
    float _531 = in.m_62.x;
    float _533 = in.m_62.y;
    float _535 = in.m_62.z;
    float _537 = in.m_62.w;
    float _539 = _479 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _541 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _199);
    int _543 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _545 = _543 != 0;
    float _547 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _549 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _551 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _553 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _555 = _535 * 2.0;
    bool _557 = _537 > 0.5;
    float _559 = _531 * 2.0;
    float _561 = _533 * 2.0;
    float _563 = _533 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _565 = _533 + _531;
    float _567 = floor(_555);
    bool _569 = _533 > 0.5;
    float _571 = fma(_563, -2.0, _549);
    float _573 = _565 + (-1.0);
    float _575 = _531 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _577 = -_189;
    int _579 = _569 ? as_type<int>(_577) : as_type<int>(_189);
    float _581 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[76].y, _571);
    float _583 = fma(_573, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _585 = floor(_559);
    float _587 = -_553;
    float _589 = fma(_575, 2.0, _587);
    float _591 = -_133;
    float _593 = fma(_591, (*spvDescriptorSet0.vp_c9)._m0[76].x, _589);
    float _595 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _597 = _567 > 0.0;
    float _599 = floor(_561);
    bool _601 = _567 >= 0.0;
    bool _603 = isnan(_567);
    bool _605 = _601 || _603;
    bool _607 = isnan(0.0);
    bool _609 = _605 || _607;
    int _611 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _613 = _611 != 0;
    int _615 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _617 = _615 != 0;
    float _619 = _609 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _621 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _623 = log2(_621);
    bool _625 = _585 >= 0.0;
    bool _627 = isnan(_585);
    bool _629 = _625 || _627;
    bool _631 = isnan(0.0);
    bool _633 = _629 || _631;
    int _635 = ~as_type<int>(_619);
    int _637 = _635 + 1;
    int _639 = _637 + 1;
    bool _641 = !_613;
    float _643 = _641 ? _189 : as_type<float>(_579);
    bool _645 = _585 > 0.0;
    int _647 = _639;
    float _649 = _619;
    float _651 = _595;
    if (!_597)
    {
        int _653 = ~as_type<int>(_619);
        int _655 = _653 + 1;
        _647 = _655;
    }
    int _657 = _647;
    bool _659 = _535 > 0.5;
    int _661 = _633 ? 0 : 1;
    bool _663 = _599 > 0.0;
    float _665 = _623 * _133;
    float _667 = -_199;
    int _669 = _659 ? as_type<int>(_667) : as_type<int>(_199);
    if (!_545)
    {
        _649 = _535;
    }
    float _671 = _649;
    bool _673 = !_617;
    float _675 = _673 ? _199 : as_type<float>(_669);
    float _677 = exp2(_665);
    bool _679 = _599 >= 0.0;
    bool _681 = isnan(_599);
    bool _683 = _679 || _681;
    bool _685 = isnan(0.0);
    bool _687 = _683 || _685;
    float _689 = _671;
    if (_545)
    {
        _689 = _533;
    }
    float _691 = _689;
    int _693 = ~_661;
    int _695 = _693 + 1;
    int _697 = _695 + 1;
    int _699 = _697;
    float _701 = _691;
    if (!_645)
    {
        int _703 = ~_661;
        int _705 = _703 + 1;
        _699 = _705;
    }
    int _707 = _699;
    float _709 = fma(_691, (*spvDescriptorSet0.vp_c9)._m0[83].w, _595);
    bool _711 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _713 = isnan(0.0);
    bool _715 = _711 || _713;
    bool _717 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _719 = _715 || _717;
    int _721 = _687 ? 0 : 1;
    if (!_545)
    {
        _651 = _533;
    }
    float _723 = _651;
    float _725 = _723;
    if (!_545)
    {
        _701 = _535;
    }
    float _727 = _701;
    float _729 = -_677;
    float _731 = _729 + 1.0;
    float _733 = _727;
    if (_545)
    {
        _725 = _531;
    }
    float _735 = _725;
    if (_545)
    {
        _733 = _533;
    }
    float _737 = _733;
    float _739 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _741 = _719 ? _731 : 0.0;
    int _743 = ~_721;
    int _745 = _743 + 1;
    int _747 = _745 + 1;
    float _749 = fma(_735, (*spvDescriptorSet0.vp_c9)._m0[83].z, _739);
    int _751 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _753 = _751 != 0;
    int _755 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _757 = _755 != 0;
    int _759 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _761 = _759 != 0;
    float _763 = _735 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _765 = _747;
    if (!_663)
    {
        int _767 = ~_721;
        int _769 = _767 + 1;
        _765 = _769;
    }
    int _771 = _765;
    float _773 = _737 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _775 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _777 = isnan(1.0);
    bool _779 = _775 || _777;
    bool _781 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _783 = _779 || _781;
    float _785 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _787 = 1.0 + _785;
    float _789 = 1.0 / _787;
    float _791 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _793 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _795 = !_753;
    int _797 = _795 ? 0 : 1;
    float _799 = -_791;
    float _801 = fma(_763, 2.0, _799);
    float _803 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _805 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _807 = abs(_797);
    float _809 = fma(_533, (*spvDescriptorSet0.vp_c9)._m0[78].w, _793);
    float _811 = fma(_773, -2.0, _803);
    float _813 = fma(_531, (*spvDescriptorSet0.vp_c9)._m0[78].z, _805);
    float _815 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[82].z, _749);
    float _817 = float(_657);
    float _819 = in.m_68.x;
    float _821 = in.m_68.y;
    float _823 = in.m_68.z;
    float _825 = float(_807);
    float _827 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[77].w, _809);
    float _829 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[82].w, _709);
    float _831 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[77].z, _813);
    float _833 = -_133;
    float _835 = fma(_833, (*spvDescriptorSet0.vp_c9)._m0[81].x, _801);
    float _837 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[81].y, _811);
    float _839 = _829;
    if (_783)
    {
        float _841 = _741 * _789;
        _155 = _841;
    }
    float _843 = _155;
    float _845 = _533 + _535;
    float _847 = _825 * _817;
    float _849 = _533 + (-0.5);
    float _851 = _845 + (-1.0);
    float _853 = _847 * (-2.0);
    bool _855 = !_757;
    int _857 = _855 ? 0 : 1;
    float _859 = _539 * _541;
    bool _861 = _531 > 0.5;
    float _863 = fma(_851, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _865 = !_761;
    int _867 = _865 ? 0 : 1;
    float _869 = fma(_583, _853, _583);
    int _871 = abs(_857);
    float _873 = _531 + (-0.5);
    float _875 = -_189;
    int _877 = _861 ? as_type<int>(_875) : as_type<int>(_189);
    float _879 = _535 + _531;
    int _881 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _883 = _881 != 0;
    float _885 = fma(_853, _819, _819);
    int _887 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _889 = _887 != 0;
    float _891 = _879 + (-1.0);
    int _893 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _895 = _893 != 0;
    float _897 = fma(_873, (*spvDescriptorSet0.vp_c9)._m0[196].x, _885);
    int _899 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _901 = _899 != 0;
    float _903 = _535 + (-0.5);
    int _905 = abs(_867);
    float _907 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _909 = float(_707);
    float _911 = fma(_869, _843, _897);
    float _913 = float(_871);
    float _915 = float(_771);
    float _917 = _911 * 0.15915493667125701904296875;
    float _919 = float(_905);
    float _921 = _913 * _909;
    float _923 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _925 = _921 * (-2.0);
    float _927 = _919 * _915;
    float _929 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _931 = _929 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _933 = in.m_48.x;
    float _935 = in.m_48.y;
    float _937 = in.m_48.z;
    float _939 = fma(_925, _821, _821);
    float _941 = fma(_863, _925, _863);
    float _943 = 1.0 / _931;
    float _945 = fma(_891, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _947 = fma(_849, (*spvDescriptorSet0.vp_c9)._m0[196].y, _939);
    float _949 = _927 * (-2.0);
    float _951 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _189);
    float _953 = fma(_941, _843, _947);
    float _955 = fma(_945, _949, _945);
    float _957 = fma(_949, _823, _823);
    float _959 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _961 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _959;
    float _963 = _953 * 0.15915493667125701904296875;
    float _965 = _481 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _967 = fma(_903, (*spvDescriptorSet0.vp_c9)._m0[196].z, _957);
    float _969 = _917 * 6.283185482025146484375;
    float _971 = sin(_969);
    float _973 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _975 = _529 + _973;
    float _977 = _965 * _951;
    float _979 = fma(_955, _843, _967);
    float _981 = _961 * _943;
    bool _983 = _529 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _985 = isnan(_529);
    bool _987 = _983 || _985;
    bool _989 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _991 = _987 || _989;
    float _993 = float(_991);
    float _995 = _979 * 0.15915493667125701904296875;
    float _997 = _935 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _999 = _935 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1001 = _935 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1003 = _917 * 6.283185482025146484375;
    float _1005 = cos(_1003);
    float _1007 = fma(_933, (*spvDescriptorSet0.vp_c10)._m0[4].x, _997);
    float _1009 = fma(_933, (*spvDescriptorSet0.vp_c10)._m0[5].x, _999);
    float _1011 = fma(_933, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1001);
    float _1013 = -_199;
    int _1015 = _569 ? as_type<int>(_1013) : as_type<int>(_199);
    float _1017 = _907 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1019 = fma(_981, _975, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _1021 = _529 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1023 = isnan(_529);
    bool _1025 = _1021 || _1023;
    bool _1027 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1029 = _1025 || _1027;
    float _1031 = float(_1029);
    float _1033 = _963 * 6.283185482025146484375;
    float _1035 = sin(_1033);
    float _1037 = _923 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1039 = -_993;
    float _1041 = _1039 + 1.0;
    bool _1043 = !_883;
    float _1045 = _1043 ? _189 : as_type<float>(_877);
    float _1047 = fma(_937, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1009);
    bool _1049 = !_889;
    float _1051 = _1049 ? _199 : as_type<float>(_1015);
    float _1053 = _1031 * _1041;
    float _1055 = fma(_937, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1007);
    float _1057 = _963 * 6.283185482025146484375;
    float _1059 = cos(_1057);
    float _1061 = _1045 + 0.5;
    float _1063 = _1051 + (-0.5);
    float _1065 = fma(_937, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1011);
    float _1067 = _1019 * _1053;
    float _1069 = fma(_1017, _1061, _593);
    float _1071 = -_1037;
    float _1073 = -_581;
    float _1075 = fma(_1071, _1063, _1073);
    float _1077 = -_1031;
    float _1079 = _1077 + 1.0;
    float _1081 = _995 * 6.283185482025146484375;
    float _1083 = cos(_1081);
    float _1085 = _971 * _1035;
    float _1087 = _1005 * _1035;
    float _1089 = fma(_1079, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1067);
    float _1091 = _1055 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1093 = _1065 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1095 = _551 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1097 = fma(_993, (*spvDescriptorSet0.vp_c9)._m0[132].x, _1089);
    float _1099 = _995 * 6.283185482025146484375;
    float _1101 = sin(_1099);
    float _1103 = _1005 * _1059;
    float _1105 = _971 * _1059;
    float _1107 = _1047 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1109 = _1005 * _1083;
    float _1111 = _971 * _1083;
    float _1113 = _1059 * _1083;
    float _1115 = _1035 * _1083;
    float _1117 = _1109 * _859;
    float _1119 = _1111 * _859;
    float _1121 = _1109 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1123 = _1109 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1125 = fma(_1101, _1103, _1085);
    float _1127 = -_1087;
    float _1129 = fma(_1101, _1105, _1127);
    float _1131 = -_1105;
    float _1133 = fma(_1101, _1087, _1131);
    float _1135 = fma(_1101, _1085, _1103);
    float _1137 = -_859;
    float _1139 = _1101 * _1137;
    float _1141 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1143 = fma(_1125, _977, _1117);
    float _1145 = fma(_1129, _977, _1119);
    float _1147 = fma(_1113, _977, _1139);
    float _1149 = -_199;
    int _1151 = _557 ? as_type<int>(_1149) : as_type<int>(_199);
    float _1153 = fma(_1133, _1141, _1143);
    float _1155 = _547 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1157 = fma(_1115, _1141, _1147);
    float _1159 = -_189;
    int _1161 = _659 ? as_type<int>(_1159) : as_type<int>(_189);
    float _1163 = _1153 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1165 = _1153 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1167 = fma(_1135, _1141, _1145);
    bool _1169 = !_901;
    float _1171 = _1169 ? _189 : as_type<float>(_1161);
    float _1173 = fma(_1157, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1163);
    float _1175 = fma(_1157, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1165);
    bool _1177 = !_895;
    float _1179 = _1177 ? _199 : as_type<float>(_1151);
    float _1181 = _1109 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1183 = fma(_1167, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1173);
    float _1185 = fma(_1167, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1175);
    float _1187 = _1171 + 0.5;
    float _1189 = -_1101;
    float _1191 = fma(_1189, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1121);
    float _1193 = _1183 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1195 = _1185 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1197 = _1179 + (-0.5);
    float _1199 = fma(_1155, _1187, _835);
    float _1201 = _1091 + _1193;
    float _1203 = _1093 + _1195;
    float _1205 = -_1095;
    float _1207 = -_837;
    float _1209 = fma(_1205, _1197, _1207);
    float _1211 = -_1101;
    float _1213 = fma(_1211, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1123);
    float _1215 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1217 = _1201 + _1215;
    float _1219 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1221 = _1203 + _1219;
    float _1223 = -_1101;
    float _1225 = fma(_1223, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1181);
    float _1227 = fma(_1111, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1191);
    float _1229 = _1217 * _1217;
    float _1231 = _1221 * _1221;
    float _1233 = fma(_1111, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1213);
    float _1235 = fma(_1111, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1225);
    float _1237 = _1125 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1239 = _1229 + _1231;
    float _1241 = _1125 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1243 = _1153 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1245 = fma(_1113, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1237);
    float _1247 = sqrt(_1239);
    float _1249 = _1125 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1251 = fma(_1113, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1241);
    float _1253 = fma(_1157, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1243);
    float _1255 = _1133 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1257 = _1133 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1259 = _199 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1261 = _1133 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1263 = fma(_1113, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1249);
    float _1265 = fma(_1115, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1255);
    float _1267 = fma(_1115, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1257);
    float _1269 = fma(_1115, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1261);
    float _1271 = fma(_1167, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1253);
    float _1273 = _1259 * _1227;
    float _1275 = _1259 * _1233;
    float _1277 = _1259 * _1235;
    bool _1279 = _1247 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1281 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1283 = _1271 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1285 = fma(_1129, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1251);
    float _1287 = fma(_1129, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1245);
    float _1289 = fma(_1129, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1263);
    float _1291 = _1107 + _1283;
    float _1293 = _1129;
    float _1295 = _1229;
    float _1297 = _1231;
    float _1299 = _1201;
    float _1301 = _1203;
    if (!_1279)
    {
        _1293 = _1291;
    }
    float _1303 = _1293;
    bool _1305 = !_1279;
    float _1307 = _1303;
    if (!_1305)
    {
        float _1309 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1311 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1313 = _1247 + _1311;
        float _1315 = rsqrt(_1239);
        float _1317 = _1313 * _1309;
        float _1319 = _1291 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1321 = _1317 * 0.15915493667125701904296875;
        float _1323 = _1321 * 6.283185482025146484375;
        float _1325 = sin(_1323);
        float _1327 = _1321 * 6.283185482025146484375;
        float _1329 = cos(_1327);
        float _1331 = fma(_1325, _1319, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1333 = _1315 * _1331;
        float _1335 = _1329 + (-1.0);
        float _1337 = fma(_1217, _1333, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1339 = fma(_1221, _1333, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1341 = _1335 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1343 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1345 = _1337 + _1343;
        float _1347 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1349 = _1339 + _1347;
        float _1351 = fma(_1291, _1329, _1341);
        float _1353 = _1345 * _1345;
        float _1355 = _1349 * _1349;
        _1307 = _1351;
        _1295 = _1353;
        _1297 = _1355;
        _1299 = _1337;
        _1301 = _1339;
    }
    float _1357 = _1307;
    float _1359 = _1295;
    float _1361 = _1297;
    float _1363 = _1299;
    float _1365 = _1301;
    float _1367 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1369 = _189 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1371 = fma(_1135, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1267);
    float _1373 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1375 = _1357 + _1373;
    float _1377 = _643 + 0.5;
    float _1379 = -_675;
    float _1381 = _1379 + 0.5;
    float _1383 = -_831;
    float _1385 = _1383 + 1.0;
    float _1387 = fma(_1375, _1375, _1359);
    float _1389 = _1377 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1391 = _1381 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1393 = fma(_1369, _1285, _1273);
    float _1395 = fma(_1369, _1287, _1275);
    float _1397 = fma(_1369, _1289, _1277);
    float _1399 = _1387 + _1361;
    float _1401 = -_827;
    float _1403 = _1401 + 1.0;
    float _1405 = _1389 * _1281;
    float _1407 = _1391 * _1367;
    float _1409 = -_1385;
    float _1411 = fma(_1045, _1409, _1069);
    float _1413 = fma(_1051, _1403, _1075);
    float _1415 = -_815;
    float _1417 = _1415 + 1.0;
    float _1419 = sqrt(_1399);
    float _1421 = fma(_1135, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1265);
    float _1423 = -_829;
    float _1425 = _1423 + 1.0;
    float _1427 = fma(_1135, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1269);
    float _1429 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1431 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1433 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1435 = fma(_1179, _1425, _1209);
    float _1437 = _1097 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1439 = -_1417;
    float _1441 = fma(_1171, _1439, _1199);
    float _1443 = _1421 + _1393;
    float _1445 = _1429 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1447 = _1431 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1449 = _1433 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1451 = _1371 + _1395;
    float _1453 = _1427 + _1397;
    out.m_70.x = _1405;
    out.m_70.y = _1407;
    bool _1455 = _1419 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1457 = isnan(_1419);
    bool _1459 = _1455 || _1457;
    bool _1461 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1463 = _1459 || _1461;
    out.m_72.x = _1445;
    out.m_72.y = _1447;
    out.m_72.z = _1449;
    out.m_72.w = _1437;
    out.m_74.x = _1411;
    out.m_74.y = _1413;
    out.m_74.z = _1441;
    out.m_74.w = _1435;
    out.m_76.x = _1443;
    out.m_76.y = _1451;
    out.m_76.z = _1453;
    if (!_1463)
    {
        _839 = 1.0;
    }
    float _1465 = _839;
    bool _1467 = !_1463;
    float _1469 = _1465;
    if (!_1467)
    {
        bool _1471 = _1419 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1473 = isnan(_1419);
        bool _1475 = _1471 || _1473;
        bool _1477 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1479 = _1475 || _1477;
        if (!_1479)
        {
            float _1481 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1483 = _1419 + _1481;
            float _1485 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1487 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1485;
            float _1489 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1491 = _1489 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1493 = 1.0 / _1487;
            float _1495 = _1483 * _1493;
            float _1497 = fma(_1495, _1491, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1469 = _1497;
            _1499 = true;
        }
        else
        {
            bool _1501 = _1419 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1503 = isnan(_1419);
            bool _1505 = _1501 || _1503;
            bool _1507 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1509 = _1505 || _1507;
            if (!_1509)
            {
                float _1511 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1513 = _1419 + _1511;
                float _1515 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1517 = _1515 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1519 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1521 = _1519 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1523 = 1.0 / _1517;
                float _1525 = _1513 * _1523;
                float _1527 = fma(_1525, _1521, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1469 = _1527;
                _1499 = true;
            }
            else
            {
                _1469 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1499 = false;
    float _1529 = _1469;
    float _1531 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1533 = _1357 + _1531;
    float _1535 = _1107 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1537 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1539 = _1363 + _1537;
    float _1541 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1543 = _1365 + _1541;
    float _1545 = fma(_1533, _1529, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1547 = fma(_1091, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1535);
    float _1549 = fma(_1539, _1529, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1551 = fma(_1543, _1529, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1553 = -_1107;
    float _1555 = _1553 + _1545;
    float _1557 = fma(_1093, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1547);
    float _1559 = -_1091;
    float _1561 = _1559 + _1549;
    float _1563 = _1107 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1565 = _1555 * _1555;
    float _1567 = _1557 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1569 = -_1093;
    float _1571 = _1569 + _1551;
    float _1573 = fma(_1091, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1563);
    float _1575 = fma(_1561, _1561, _1565);
    float _1577 = 1.0 / _1567;
    float _1579 = fma(_1093, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1573);
    float _1581 = fma(_1571, _1571, _1575);
    float _1583 = _1579 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1585 = sqrt(_1581);
    float _1587 = _1583 + _1567;
    float _1589 = _1587 * _1577;
    float _1591 = _1589 * 0.5;
    float _1593 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1595 = fma(_1591, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1593);
    bool _1597 = _1585 > 0.0;
    float _1599 = 1.0 / _1595;
    bool _1601 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1603 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1605 = _1601 || _1603;
    bool _1607 = isnan(0.5);
    bool _1609 = _1605 || _1607;
    bool _1611 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1613 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1615 = _1611 || _1613;
    bool _1617 = isnan(0.5);
    bool _1619 = _1615 || _1617;
    float _1621 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _1623 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    float _1625 = _1545;
    float _1627 = _1577;
    float _1629 = _1581;
    float _1631 = _1549;
    if (!_1597)
    {
        _1621 = _1549;
    }
    float _1633 = _1621;
    float _1635 = _1633;
    if (!_1597)
    {
        _1623 = _1551;
    }
    float _1637 = _1623;
    bool _1639 = !_1597;
    float _1641 = _1637;
    if (!_1639)
    {
        float _1643 = _203 * _203;
        float _1645 = fma(_201, _201, _1643);
        float _1647 = fma(_205, _205, _1645);
        float _1649 = rsqrt(_1581);
        float _1651 = sqrt(_1647);
        float _1653 = _1561 * _1649;
        float _1655 = _1555 * _1649;
        float _1657 = _1571 * _1649;
        bool _1659 = _1651 > 0.0;
        float _1661 = _1651;
        float _1663 = _1649;
        if (!_1659)
        {
            _1661 = _1549;
        }
        float _1665 = _1661;
        _1635 = _1665;
        if (!_1659)
        {
            _1663 = _1551;
        }
        float _1667 = _1663;
        bool _1669 = !_1659;
        _1641 = _1667;
        if (!_1669)
        {
            float _1671 = rsqrt(_1647);
            float _1673 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1675 = _203 * _1671;
            float _1677 = _201 * _1671;
            float _1679 = _1655 * _1675;
            float _1681 = _205 * _1671;
            float _1683 = fma(_1653, _1677, _1679);
            float _1685 = _1673 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1687 = fma(_1657, _1681, _1683);
            float _1689 = _1687 * _1685;
            float _1691 = fma(_201, _1689, _1549);
            float _1693 = fma(_203, _1689, _1545);
            float _1695 = fma(_205, _1689, _1551);
            _1635 = _1691;
            _1641 = _1695;
            _1625 = _1693;
            _1627 = _1685;
        }
    }
    float _1697 = _1635;
    float _1699 = _1641;
    float _1701 = _1625;
    float _1703 = _1627;
    float _1705 = _1703;
    float _1707 = _1701;
    if (_1609)
    {
        _1705 = 1.0;
    }
    float _1709 = _1705;
    float _1711 = _1709;
    if (_1619)
    {
        _209 = _1697;
    }
    float _1713 = _209;
    float _1715 = _1713;
    if (_1619)
    {
        _211 = _1699;
    }
    float _1717 = _211;
    float _1719 = _1717;
    if (!_1619)
    {
        float _1721 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1723 = _1107 + _1721;
        float _1725 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1727 = _1091 + _1725;
        float _1729 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1731 = -_1107;
        float _1733 = _1731 + _1701;
        float _1735 = _1723 * _1723;
        float _1737 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1739 = _1093 + _1737;
        float _1741 = -_1091;
        float _1743 = _1741 + _1697;
        float _1745 = -_1093;
        float _1747 = _1745 + _1699;
        float _1749 = fma(_1727, _1727, _1735);
        float _1751 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1753 = fma(_1739, _1739, _1749);
        float _1755 = sqrt(_1753);
        float _1757 = _1729 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1759 = precise::min(_1755, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1761 = _1759 * _1751;
        float _1763 = _1757 * _1761;
        float _1765 = fma(_1733, _1763, _1107);
        float _1767 = fma(_1743, _1763, _1091);
        float _1769 = fma(_1747, _1763, _1093);
        _1707 = _1765;
        _1715 = _1767;
        _1719 = _1769;
        _213 = _1761;
    }
    float _1771 = _1707;
    float _1773 = _1715;
    float _1775 = _1719;
    float _1777 = _213;
    float _1779 = _1777;
    if (_1609)
    {
        _1779 = 1.0;
    }
    float _1781 = _1779;
    float _1783 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1785 = _1599 * _1783;
    float _1787 = _1781;
    if (!_1609)
    {
        float _1789 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1791 = _1789 * 0.15915493667125701904296875;
        float _1793 = _1791 * 6.283185482025146484375;
        float _1795 = cos(_1793);
        float _1797 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1799 = _1797 * 0.15915493667125701904296875;
        float _1801 = _1791 * 6.283185482025146484375;
        float _1803 = sin(_1801);
        float _1805 = 1.0 / _1795;
        float _1807 = _1799 * 6.283185482025146484375;
        float _1809 = cos(_1807);
        float _1811 = _1803 * _1805;
        float _1813 = _1799 * 6.283185482025146484375;
        float _1815 = sin(_1813);
        float _1817 = _1809 * _1811;
        float _1819 = 1.0 / _1817;
        float _1821 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1823 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1821;
        float _1825 = 1.0 / _1823;
        float _1827 = _1815 * _1819;
        float _1829 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1831 = fma(_1785, _1827, _1829);
        float _1833 = _1831 * _1825;
        float _1835 = precise::clamp(_1833, 0.0, 1.0);
        _1629 = _1799;
        _1711 = _1835;
    }
    float _1837 = _1629;
    float _1839 = _1711;
    float _1841 = _1837;
    if (!_1609)
    {
        float _1843 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1845 = _1843 * 0.15915493667125701904296875;
        float _1847 = _1845 * 6.283185482025146484375;
        float _1849 = cos(_1847);
        float _1851 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1853 = _1851 * 0.15915493667125701904296875;
        float _1855 = _1845 * 6.283185482025146484375;
        float _1857 = sin(_1855);
        float _1859 = 1.0 / _1849;
        float _1861 = _1853 * 6.283185482025146484375;
        float _1863 = cos(_1861);
        float _1865 = _1857 * _1859;
        float _1867 = _1853 * 6.283185482025146484375;
        float _1869 = sin(_1867);
        float _1871 = _1863 * _1865;
        float _1873 = 1.0 / _1871;
        float _1875 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1877 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1875;
        float _1879 = 1.0 / _1877;
        float _1881 = _1869 * _1873;
        float _1883 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1885 = fma(_1785, _1881, _1883);
        float _1887 = _1885 * _1879;
        float _1889 = precise::clamp(_1887, 0.0, 1.0);
        float _1891 = -_1889;
        float _1893 = _1891 + 1.0;
        _1631 = _1873;
        _1841 = _1849;
        _1787 = _1893;
    }
    float _1895 = _1631;
    float _1897 = _1841;
    float _1899 = _1787;
    float _1901 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1903 = _1771 + _1901;
    float _1905 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1907 = _1773 + _1905;
    float _1909 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1911 = _1775 + _1909;
    float _1913 = _1903 * _1903;
    float _1915 = fma(_1907, _1907, _1913);
    float _1917 = fma(_1911, _1911, _1915);
    float _1919 = rsqrt(_1917);
    float _1921 = _1919 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1923 = _1907 * _1921;
    float _1925 = _1911 * _1921;
    float _1927 = _1923 * _1923;
    float _1929 = _1925 * _1925;
    float _1931 = _1927 + _1929;
    float _1933 = sqrt(_1931);
    bool _1935 = _1933 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1937 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1939 = _1933 + _1937;
    float _1941 = _1895;
    float _1943 = _1931;
    float _1945 = _1939;
    float _1947 = _1903;
    float _1949 = _1923;
    if (_1935)
    {
        float _1951 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1941 = _1951;
    }
    float _1953 = _1941;
    if (_1935)
    {
        float _1955 = rsqrt(_1931);
        _1943 = _1955;
    }
    float _1957 = _1943;
    float _1959 = _1953;
    float _1961 = _1957;
    if (_1935)
    {
        float _1963 = _1939 * _1953;
        _1945 = _1963;
    }
    float _1965 = _1945;
    if (_1935)
    {
        float _1967 = _1965 * 0.15915493667125701904296875;
        _1959 = _1967;
    }
    float _1969 = _1959;
    float _1971 = _1911;
    float _1973 = _1969;
    if (_1935)
    {
        float _1975 = _1969 * 6.283185482025146484375;
        float _1977 = sin(_1975);
        _1971 = _1977;
    }
    float _1979 = _1971;
    float _1981 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1983 = precise::max(0.0, _1981);
    float _1985 = _1897;
    if (_1935)
    {
        float _1987 = _1969 * 6.283185482025146484375;
        float _1989 = cos(_1987);
        _1985 = _1989;
    }
    float _1991 = _1985;
    float _1993 = -_1921;
    float _1995 = -_1983;
    float _1997 = fma(_1903, _1993, _1995);
    float _1999 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_1935)
    {
        float _2001 = _1997 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1947 = _2001;
    }
    float _2003 = _1947;
    float _2005 = _2003;
    if (!_1935)
    {
        _1973 = _1997;
    }
    float _2007 = _1973;
    float _2009 = fma(_1091, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2011 = _1979;
    float _2013 = _2007;
    if (_1935)
    {
        float _2015 = fma(_1979, _2003, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2011 = _2015;
    }
    float _2017 = _2011;
    float _2019 = sqrt(_1917);
    float _2021 = _2017;
    float _2023 = _1991;
    if (_1935)
    {
        float _2025 = _1991 + (-1.0);
        _2005 = _2025;
    }
    float _2027 = _2005;
    float _2029 = _2027;
    if (_1935)
    {
        float _2031 = _1957 * _2017;
        _1999 = _2031;
    }
    float _2033 = _1999;
    if (!_1935)
    {
        _2021 = _1927;
    }
    float _2035 = _2021;
    float _2037 = _2035;
    if (_1935)
    {
        float _2039 = _2027 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2029 = _2039;
    }
    float _2041 = _2029;
    if (_1935)
    {
        float _2043 = _1923 * _2033;
        _1949 = _2043;
    }
    float _2045 = _1949;
    if (!_1935)
    {
        _1961 = _1925;
    }
    float _2047 = _1961;
    float _2049 = _2047;
    if (_1935)
    {
        float _2051 = _1925 * _2033;
        _2049 = _2051;
    }
    float _2053 = _2049;
    if (_1935)
    {
        float _2055 = fma(_1997, _1991, _2041);
        _2013 = _2055;
    }
    float _2057 = _2013;
    if (_1935)
    {
        float _2059 = _2045 * _2045;
        _2037 = _2059;
    }
    float _2061 = _2037;
    if (!_1935)
    {
        _2023 = _1929;
    }
    float _2063 = _2023;
    float _2065 = _2063;
    if (_1935)
    {
        float _2067 = _2053 * _2053;
        _2065 = _2067;
    }
    float _2069 = _2065;
    float _2071 = fma(_2057, _2057, _2061);
    float _2073 = _1771 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2075 = floor(_2009);
    float _2077 = _2071 + _2069;
    float _2079 = fma(_1773, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2073);
    float _2081 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2083 = fma(_2019, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2081);
    float _2085 = precise::clamp(_2083, 0.0, 1.0);
    float _2087 = fma(_1093, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2089 = fma(_1775, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2079);
    float _2091 = -_2085;
    float _2093 = _2091 + 1.0;
    float _2095 = rsqrt(_2077);
    float _2097 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2099 = _2089 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2101 = _1771 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2103 = _2099 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2105 = fma(_1773, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2101);
    float _2107 = abs(_2093);
    float _2109 = log2(_2107);
    float _2111 = _1771 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2113 = -_2103;
    float _2115 = fma(_2113, _2097, 1.0);
    float _2117 = _1771 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2119 = fma(_1773, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2111);
    float _2121 = fma(_1773, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2117);
    float _2123 = _2095 * _2045;
    float _2125 = fma(_1775, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2119);
    float _2127 = _2095 * _2057;
    float _2129 = fma(_1775, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2121);
    float _2131 = _2123 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2133 = _2125 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2135 = _2095 * _2053;
    float _2137 = _2129 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2139 = -_2131;
    float _2141 = fma(_2127, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2139);
    float _2143 = _2133 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2145 = floor(_2087);
    float _2147 = _2109 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2149 = -_2135;
    float _2151 = fma(_2149, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2141);
    float _2153 = fma(_1775, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2105);
    float _2155 = fma(_2137, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2143);
    float _2157 = -_2075;
    float _2159 = _2009 + _2157;
    float _2161 = fma(_2151, -0.5, 0.5);
    float _2163 = _2153 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2165 = fma(_2099, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2155);
    float _2167 = exp2(_2147);
    float _2169 = _2133 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2171 = _2133 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2173 = fma(_2163, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2165);
    float _2175 = fma(_2151, 0.5, 0.5);
    float _2177 = fma(_2137, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2169);
    float _2179 = _2127 + 1.0;
    float _2181 = -_2145;
    float _2183 = _2087 + _2181;
    float _2185 = log2(_2115);
    float _2187 = fma(_2137, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2171);
    float _2189 = fma(_2099, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2177);
    float _2191 = fma(_2175, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2193 = fma(_2099, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2187);
    float _2195 = fma(_2175, _2191, -0.212114393711090087890625);
    float _2197 = 1.0 / _2173;
    float _2199 = -_2127;
    float _2201 = fma(_2167, _2179, _2199);
    float _2203 = fma(_2163, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2189);
    float _2205 = fma(_2163, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2193);
    float _2207 = sqrt(_2161);
    float _2209 = _2185 * 0.693147182464599609375;
    float2 _6183 = float2(_2159, _2183);
    float _2211 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6183, float2(0.0), isnan(_6183)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6183, float2(0.0), isnan(_6183)), level(0.0)).x;
    float _2213 = fma(_2175, _2195, 1.570728778839111328125);
    float _2215 = _2209 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2217 = _2203 * _2197;
    float _2219 = _2205 * _2197;
    float _2221 = fma(_2217, 0.5, 0.5);
    float _2223 = fma(_2219, -0.5, 0.5);
    float _2225 = _2207 * 0.636619746685028076171875;
    float3 _6215 = float3(_2221, _2223, _2215);
    float _2227 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6215, float3(0.0), isnan(_6215)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6215, float3(0.0), isnan(_6215)), level(0.0)).x;
    float _2229 = -_2213;
    float _2231 = fma(_2225, _2229, 1.0);
    float _2233 = fma(_2201, 0.5, 0.5);
    float3 _6233 = float3(_2221, _2223, _2215);
    float4 _2236 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6233, float3(0.0), isnan(_6233)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6233, float3(0.0), isnan(_6233)), level(0.0)).xyzw;
    float _2238 = _2236.x;
    float _2240 = _2236.y;
    float _2242 = _2236.z;
    float _2244 = _2236.w;
    float2 _6249 = float2(_2231, _2233);
    float3 _2248 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6249, float2(0.0), isnan(_6249)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6249, float2(0.0), isnan(_6249)), level(0.0)).xyz;
    float _2250 = _2248.x;
    float _2252 = _2248.y;
    float _2254 = _2248.z;
    float _2256 = abs(_1785);
    float _2258 = log2(_2256);
    float _2260 = _2133 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _2262 = _2019 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2264 = isnan(_2019);
    bool _2266 = _2262 || _2264;
    bool _2268 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2270 = _2266 || _2268;
    float _2272 = fma(_2137, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2260);
    bool _2274 = _1785 <= 8000.0;
    bool _2276 = isnan(_1785);
    bool _2278 = _2274 || _2276;
    bool _2280 = isnan(8000.0);
    bool _2282 = _2278 || _2280;
    float _2284 = float(_2282);
    float _2286 = _2173 * 0.5;
    float _2288 = fma(_2099, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2272);
    float _2290 = _2203 + _2173;
    float _2292 = _2258 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2294 = _2290 * 0.5;
    float _2296 = exp2(_2292);
    float _2298 = fma(_2296, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2300 = precise::clamp(_2298, 0.0, 1.0);
    float _2302 = fma(_2300, -2.0, 3.0);
    float _2304 = _2300 * _2300;
    float _2306 = _2304 * _2302;
    float _2308 = _2109 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2310 = fma(_2163, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2288);
    float _2312 = fma(_2205, -0.5, _2286);
    float _2314 = -_2306;
    float _2316 = _2314 + 1.0;
    float _2318 = _2310 + _2173;
    float _2320 = exp2(_2308);
    float _2322 = fma(_2316, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2306);
    out.gl_Position.x = _2203;
    out.gl_Position.y = _2205;
    out.gl_Position.z = _2310;
    out.gl_Position.w = _2173;
    float _2324 = _2318 * 0.5;
    float _2326 = _2284 * _2322;
    float _2328 = in.m_78.x;
    float _2330 = _2326 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.m_80.x = _2294;
    out.m_80.y = _2312;
    out.m_80.z = _2324;
    out.m_80.w = _2173;
    float _2332 = -_2320;
    float _2334 = _2332 + 1.0;
    float _2336 = _1839 * _1899;
    float _2338 = _2173;
    float _2340 = _2310;
    float _2342 = _2205;
    float _2344 = _2294;
    float _2346 = _2336;
    if (!_2270)
    {
        _2338 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2348 = _2338;
    float _2350 = _2334 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2352 = _2348;
    float _2354 = _2348;
    if (!_2270)
    {
        _2340 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2356 = _2340;
    float _2358 = _2356;
    float _2360 = _2356;
    if (!_2270)
    {
        _2342 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2362 = _2342;
    float _2364 = _2336 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2366 = _2362;
    float _2368 = _2362;
    if (!_2270)
    {
        _2344 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2370 = _2344;
    float _2372 = _2370;
    float _2374 = _2370;
    if (!_2270)
    {
        _2346 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2376 = _2346;
    float _2378 = -_2211;
    float _2380 = _2378 + 1.0;
    float _2382 = _2380 * _2330;
    float _2384 = precise::clamp(_2382, 0.0, 1.0);
    float _2386 = -_2384;
    float _2388 = fma(_2386, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2390 = _2388 * _2328;
    float _2392 = _2328;
    float _2394 = _2376;
    float _2396 = _2376;
    if (!_2270)
    {
        _2392 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2398 = _2392;
    float _2400 = _2350 * _2227;
    float _2402 = -_2350;
    float _2404 = _2402 + 1.0;
    float _2406 = _2390 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2408 = _2244 * _2400;
    out.m_82.x = _2406;
    float _2410 = _2254 * _2400;
    float _2412 = fma(_2250, _2408, _2238);
    float _2414 = fma(_2252, _2408, _2240);
    float _2416 = _2244 * _2404;
    float _2418 = fma(_2244, _2410, _2242);
    out.m_84.x = _2412;
    out.m_84.y = _2414;
    out.m_84.z = _2418;
    out.m_84.w = _2416;
    bool _2420 = !_2270;
    float _2422 = _2398;
    float _2424 = _2398;
    if (!_2420)
    {
        bool _2426 = _2019 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2428 = isnan(_2019);
        bool _2430 = _2426 || _2428;
        bool _2432 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2434 = _2430 || _2432;
        if (!_2434)
        {
            float _2436 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2438 = _2019 + _2436;
            float _2440 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2442 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2440;
            float _2444 = 1.0 / _2442;
            float _2446 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2448 = _2446 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2450 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2452 = _2450 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2454 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2456 = _2454 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2458 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2460 = _2458 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2462 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2464 = _2462 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2466 = _2438 * _2444;
            float _2468 = precise::clamp(_2466, 0.0, 1.0);
            float _2470 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2472 = _2470 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2474 = fma(_2468, _2448, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2476 = fma(_2468, _2472, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2478 = fma(_2468, _2452, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2480 = fma(_2468, _2456, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2482 = fma(_2468, _2460, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2484 = fma(_2468, _2464, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2374 = _2476;
            _2368 = _2482;
            _2424 = _2474;
            _2360 = _2480;
            _2354 = _2478;
            _2396 = _2484;
            _2486 = true;
        }
        else
        {
            bool _2488 = _2019 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2490 = isnan(_2019);
            bool _2492 = _2488 || _2490;
            bool _2494 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2496 = _2492 || _2494;
            if (!_2496)
            {
                _2422 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2498 = _2422;
            _2424 = _2498;
            if (!_2496)
            {
                _2372 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2500 = _2372;
            _2374 = _2500;
            if (!_2496)
            {
                _2352 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2502 = _2352;
            _2354 = _2502;
            if (!_2496)
            {
                _2358 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2504 = _2358;
            _2360 = _2504;
            if (!_2496)
            {
                _2366 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2506 = _2366;
            _2368 = _2506;
            if (!_2496)
            {
                _2394 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2508 = _2394;
            bool _2510 = !_2496;
            _2396 = _2508;
            if (!_2510)
            {
                bool _2512 = _2019 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2514 = isnan(_2019);
                bool _2516 = _2512 || _2514;
                bool _2518 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2520 = _2516 || _2518;
                if (!_2520)
                {
                    float _2522 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2524 = _2019 + _2522;
                    float _2526 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2528 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2526;
                    float _2530 = 1.0 / _2528;
                    float _2532 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2534 = _2532 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2536 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2538 = _2536 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2540 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2542 = _2540 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2544 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2546 = _2544 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2548 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2550 = _2548 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2552 = _2524 * _2530;
                    float _2554 = precise::clamp(_2552, 0.0, 1.0);
                    float _2556 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2558 = _2556 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2560 = fma(_2554, _2534, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2562 = fma(_2554, _2558, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2564 = fma(_2554, _2538, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2566 = fma(_2554, _2542, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2568 = fma(_2554, _2546, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2570 = fma(_2554, _2550, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2374 = _2562;
                    _2368 = _2568;
                    _2424 = _2560;
                    _2360 = _2566;
                    _2354 = _2564;
                    _2396 = _2570;
                    _2486 = true;
                }
                else
                {
                    _2374 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2368 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2424 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2360 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2354 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2396 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2486 = false;
    float _2572 = _2374;
    float _2574 = _2368;
    float _2576 = _2424;
    float _2578 = _2360;
    float _2580 = _2354;
    float _2582 = _2396;
    float _2584 = fma(_1451, -0.5, 0.5);
    float _2586 = precise::clamp(_2584, 0.0, 1.0);
    float _2588 = -_2572;
    float _2590 = _2588 + _2574;
    float _2592 = -_2576;
    float _2594 = _2592 + _2578;
    out.m_86.x = 0.0;
    float _2596 = fma(_2586, _2590, _2572);
    float _2598 = -_2580;
    float _2600 = _2598 + _2582;
    float _2602 = fma(_2586, _2594, _2576);
    float _2604 = _2596 * 0.586610972881317138671875;
    bool _2606 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2608 = fma(_2586, _2600, _2580);
    float _2610 = _2364 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2612 = fma(_2602, 0.298911988735198974609375, _2604);
    bool _2614 = _1839 > 0.0;
    bool _2616 = isnan(_1839);
    bool _2618 = _2614 || _2616;
    bool _2620 = isnan(0.0);
    bool _2622 = _2618 || _2620;
    float _2624 = fma(_2608, 0.114477999508380889892578125, _2612);
    out.m_51.x = _2610;
    bool _2626 = _1899 <= 0.0;
    bool _2628 = !_2622;
    bool _2630 = _2626 || _2628;
    float _2632 = -_2624;
    float _2634 = _2602 + _2632;
    float _2636 = -_2624;
    float _2638 = _2608 + _2636;
    float _2640 = fma(_2634, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2624);
    float _2642 = -_2624;
    float _2644 = _2596 + _2642;
    float _2646 = fma(_2638, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2624);
    float _2648 = fma(_2644, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2624);
    bool _2650 = !_2606;
    if (!_2650)
    {
        float _2652 = -_1771;
        float _2654 = _2652 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2656 = -_1773;
        float _2658 = _2656 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2660 = -_1775;
        float _2662 = _2660 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2664 = _2654 * _2654;
        float _2666 = fma(_2658, _2658, _2664);
        float _2668 = fma(_2662, _2662, _2666);
        float _2670 = sqrt(_2668);
        float _2672 = rsqrt(_2668);
        float _2674 = -_2670;
        float _2676 = _2674 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2678 = _2676 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2680 = precise::clamp(_2678, 0.0, 1.0);
        float _2682 = _2658 * _2672;
        float _2684 = _2654 * _2672;
        float _2686 = abs(_2680);
        float _2688 = log2(_2686);
        float _2690 = _2662 * _2672;
        float _2692 = _2682 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2694 = _1451 * _2684;
        float _2696 = -_2684;
        float _2698 = -_2692;
        float _2700 = fma(_2696, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2698);
        float _2702 = fma(_1443, _2682, _2694);
        float _2704 = -_2690;
        float _2706 = fma(_2704, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2700);
        float _2708 = fma(_1453, _2690, _2702);
        float _2710 = precise::clamp(_2708, 0.0, 1.0);
        float _2712 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2714 = _2706 + _2712;
        float _2716 = _2688 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2718 = _2714 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2720 = precise::clamp(_2718, 0.0, 1.0);
        float _2722 = exp2(_2716);
        float _2724 = _2722 * _2720;
        float _2726 = _2710 * _2724;
        float _2728 = _2726 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2730 = _2726 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2732 = _2726 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_86.x = _2728;
        out.m_86.y = _2730;
        out.m_86.z = _2732;
    }
    out.m_88.x = _2640;
    out.m_88.y = _2648;
    out.m_88.z = _2646;
    if (!_2630)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_51.x = 0.0;
    float _2734 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2734;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

