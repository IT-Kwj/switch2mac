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
    constant _16* vp_c13 [[id(4)]];
    constant _16* vp_c7 [[id(5)]];
    texture2d<float> vp_t_tcb_24 [[id(6)]];
    sampler vp_t_tcb_24Smplr [[id(7)]];
    texture3d<float> vp_t_tcb_32 [[id(8)]];
    sampler vp_t_tcb_32Smplr [[id(9)]];
    texture3d<float> vp_t_tcb_30 [[id(10)]];
    sampler vp_t_tcb_30Smplr [[id(11)]];
    texture2d<float> vp_t_tcb_1C [[id(12)]];
    sampler vp_t_tcb_1CSmplr [[id(13)]];
    sampler vp_t_tcb_24Smplr_w [[id(14)]];
    sampler vp_t_tcb_32Smplr_w [[id(15)]];
    sampler vp_t_tcb_30Smplr_w [[id(16)]];
    sampler vp_t_tcb_1CSmplr_w [[id(17)]];
    constant dm_border_t* dm_border [[id(18)]];
};

struct main0_out
{
    float4 m_64 [[user(locn0)]];
    float4 m_74 [[user(locn1)]];
    float4 m_51 [[user(locn2)]];
    float4 m_78 [[user(locn3)]];
    float4 m_86 [[user(locn4)]];
    float4 m_53 [[user(locn5)]];
    float4 m_57 [[user(locn6)]];
    float4 m_72 [[user(locn7)]];
    float4 m_98 [[user(locn8)]];
    float4 m_80 [[user(locn9)]];
    float4 m_88 [[user(locn10)]];
    float4 m_90 [[user(locn11)]];
    float4 m_82 [[user(locn12)]];
    float4 m_96 [[user(locn13)]];
    float4 m_92 [[user(locn14)]];
    float4 m_94 [[user(locn15)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_84 [[attribute(0)]];
    float4 m_70 [[attribute(1)]];
    float4 m_68 [[attribute(2)]];
    float4 m_66 [[attribute(3)]];
    float4 m_76 [[attribute(4)]];
    float4 m_46 [[attribute(5)]];
    float4 m_48 [[attribute(6)]];
    float4 m_55 [[attribute(7)]];
    float4 m_62 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3261 = false;
    bool _409 = false;
    bool _215 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _112 = in.m_46.w;
    float _114 = in.m_48.w;
    float _116 = trunc(_112);
    int _119 = int(_116);
    float _121 = -_114;
    float _123 = _121 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_51.y = _123;
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
        out.m_53.x = 0.0;
    }
    int _137 = 0;
    if (!_127)
    {
        float _139 = _135 * 5.0;
        _137 = as_type<int>(_139);
    }
    int _141 = _137;
    int _143 = _141;
    if (!_127)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3571 = as_type<float>(_141);
        out.gl_Position.z = _3571;
    }
    if (!_127)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _145 = _114 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _147 = isnan(_114);
    bool _149 = _145 || _147;
    bool _151 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _153 = _149 || _151;
    float _155 = in.m_55.x;
    float _157 = float(_119);
    bool _159 = _123 >= _157;
    bool _161 = !_153;
    bool _163 = _159 || _161;
    float _165 = 1.0 / _157;
    if (_163)
    {
        _131 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _167 = _131;
    if (_163)
    {
        out.m_53.x = 0.0;
    }
    if (_163)
    {
        float _169 = _167 * 5.0;
        _143 = as_type<int>(_169);
    }
    int _171 = _143;
    float _173 = _123 * _165;
    out.m_57.x = _155;
    float _175 = _173;
    if (_163)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3636 = as_type<float>(_171);
        out.gl_Position.z = _3636;
    }
    out.m_51.x = _173;
    if (_163)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _177 = as_type<float>(int(gl_VertexIndex));
    bool _179 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _181 = as_type<int>(_177) & 1;
    bool _183 = _181 != 0;
    int _185 = as_type<int>(_177) & 2;
    bool _187 = _185 != 0;
    bool _189 = !_183;
    float _191 = _189 ? (-0.5) : 0.5;
    bool _193 = !_187;
    float _195 = _193 ? (-0.5) : 0.5;
    bool _197 = !_179;
    float _213;
    if (!_197)
    {
        float _199 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _201 = _155 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _203 = fma(_201, (*spvDescriptorSet0.vp_c9)._m0[12].x, _123);
        float _205 = _203 * _199;
        float _207 = floor(_205);
        float _209 = -_207;
        float _211 = _205 + _209;
        _213 = _211;
        _215 = true;
    }
    else
    {
        _213 = _173;
    }
    _215 = false;
    float _217 = _213;
    float _219 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _221 = _217 + _219;
    float _223 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _225 = _217 + _223;
    float _227 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _229 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _227;
    float _231 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _233 = _231 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _235 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _237 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _235;
    bool _239 = _217 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _241 = isnan(_217);
    bool _243 = _239 || _241;
    bool _245 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _247 = _243 || _245;
    float _249 = float(_247);
    float _251 = 1.0 / _229;
    float _253 = -_249;
    float _255 = _253 + 1.0;
    bool _257 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _259 = 1.0 / _233;
    float _261 = 1.0 / _237;
    float _263 = _221 * _251;
    float _265 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _267 = _217 + _265;
    float _269 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _271 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _269;
    float _273 = fma(_271, _263, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _275 = _267 * _259;
    float _277 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _279 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _277;
    bool _281 = _217 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _283 = isnan(_217);
    bool _285 = _281 || _283;
    bool _287 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _289 = _285 || _287;
    float _291 = float(_289);
    float _293 = fma(_279, _263, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _295 = _291 * _255;
    float _297 = _225 * _261;
    bool _299 = _217 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _301 = isnan(_217);
    bool _303 = _299 || _301;
    bool _305 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _307 = _303 || _305;
    float _309 = float(_307);
    float _311 = -_291;
    float _313 = _311 + 1.0;
    bool _315 = _217 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _317 = isnan(_217);
    bool _319 = _315 || _317;
    bool _321 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _323 = _319 || _321;
    float _325 = float(_323);
    float _327 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _329 = _327 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _331 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _333 = _331 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _335 = -_309;
    float _337 = _335 + 1.0;
    float _339 = _309 * _313;
    float _341 = fma(_329, _275, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _343 = fma(_333, _275, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _345 = _325 * _337;
    float _347 = in.m_62.x;
    float _349 = in.m_62.y;
    float _351 = -_325;
    float _353 = _351 + 1.0;
    float _355 = _273 * _345;
    float _357 = _293 * _345;
    float _359 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _361 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _359;
    float _363 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _365 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _363;
    float _367 = fma(_353, (*spvDescriptorSet0.vp_c9)._m0[143].x, _355);
    float _369 = fma(_353, (*spvDescriptorSet0.vp_c9)._m0[143].y, _357);
    float _371 = fma(_361, _297, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _373 = fma(_365, _297, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _375 = fma(_343, _339, _367);
    float _377 = fma(_341, _339, _369);
    float _379 = fma(_371, _295, _375);
    float _381 = fma(_373, _295, _377);
    float _383 = fma(_249, (*spvDescriptorSet0.vp_c9)._m0[146].x, _379);
    float _385 = fma(_249, (*spvDescriptorSet0.vp_c9)._m0[146].y, _381);
    float _387 = _383 * _347;
    float _389 = _385 * _349;
    bool _391 = !_257;
    float _407;
    if (!_391)
    {
        float _393 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _395 = _155 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
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
        _407 = _173;
    }
    _409 = false;
    float _411 = _407;
    float _413 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _415 = _413 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _417 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _419 = _417 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _421 = _411 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _423 = isnan(_411);
    bool _425 = _421 || _423;
    bool _427 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _429 = _425 || _427;
    float _431 = float(_429);
    float _433 = 1.0 / _415;
    float _435 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _437 = _435 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _439 = _411 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _441 = isnan(_411);
    bool _443 = _439 || _441;
    bool _445 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _447 = _443 || _445;
    float _449 = float(_447);
    float _451 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _453 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _451;
    float _455 = -_431;
    float _457 = _455 + 1.0;
    bool _459 = _411 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _461 = isnan(_411);
    bool _463 = _459 || _461;
    bool _465 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _467 = _463 || _465;
    float _469 = float(_467);
    bool _471 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _473 = 1.0 / _419;
    float _475 = _449 * _457;
    float _477 = -_449;
    float _479 = _477 + 1.0;
    float _481 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _483 = _481 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _485 = _469 * _479;
    float _487 = -_469;
    float _489 = _487 + 1.0;
    float _491 = 1.0 / _437;
    float _493 = _453 * _433;
    float _495 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _497 = _411 + _495;
    float _499 = fma(_493, _497, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _501 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _503 = _411 + _501;
    float _505 = _483 * _473;
    bool _507 = _411 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _509 = isnan(_411);
    bool _511 = _507 || _509;
    bool _513 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _515 = _511 || _513;
    float _517 = float(_515);
    float _519 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _521 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _519;
    float _523 = _499 * _485;
    float _525 = fma(_505, _503, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _527 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _529 = _411 + _527;
    float _531 = -_517;
    float _533 = _531 + 1.0;
    float _535 = fma(_489, (*spvDescriptorSet0.vp_c9)._m0[115].x, _523);
    float _537 = _521 * _491;
    float _539 = _431 * _533;
    float _541 = fma(_525, _475, _535);
    float _543 = fma(_537, _529, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _545 = fma(_543, _539, _541);
    float _547 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _549 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _551 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _553 = fma(_517, (*spvDescriptorSet0.vp_c9)._m0[118].x, _545);
    float _555 = _547 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _557 = _549 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _559 = _551 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _561 = _553 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_64.x = _555;
    out.m_64.y = _557;
    out.m_64.z = _559;
    out.m_64.w = _561;
    bool _563 = !_471;
    if (!_563)
    {
        float _565 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _567 = _155 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _569 = fma(_567, (*spvDescriptorSet0.vp_c9)._m0[11].w, _123);
        float _571 = _569 * _565;
        float _573 = floor(_571);
        float _575 = -_573;
        float _577 = _571 + _575;
        _175 = _577;
    }
    float _579 = _175;
    float _581 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _583 = int(_581);
    float _585 = in.m_55.z;
    float _587 = _155 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _589 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _591 = _589 != 0;
    float _593 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _595 = int(_593);
    float _597 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _599 = float(_583);
    float _601 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _603 = int(_601);
    float _605 = float(_595);
    float _607 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _609 = int(_607);
    float _611 = 1.0 / _605;
    float _613 = float(uint(_603));
    int _615 = ~_603;
    int _617 = _615 + 1;
    float _619 = 1.0 / _599;
    float _621 = float(uint(_609));
    int _623 = ~_609;
    int _625 = _623 + 1;
    int _627 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _629 = _627 != 0;
    float _631 = _611 * _123;
    float _633 = 1.0 / _613;
    int _635 = ~_609;
    int _637 = _635 + 1;
    float _639 = _619 * _123;
    float _641 = trunc(_631);
    int _643 = int(_641);
    float _645 = 1.0 / _621;
    int _647 = as_type<int>(_633) + (-2);
    float _649 = trunc(_639);
    int _651 = int(_649);
    float _653 = float(uint(_643));
    float _655 = as_type<float>(_647) * _653;
    float _657 = _653;
    if (_629)
    {
        _657 = _155;
    }
    float _659 = _657;
    float _661 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _663 = log2(_661);
    int _665 = as_type<int>(_645) + (-2);
    float _667 = _645;
    float _669 = _659;
    if (_629)
    {
        _667 = 1.0;
    }
    float _671 = _667;
    float _673 = _671;
    if (!_629)
    {
        _673 = 5.839270114898681640625;
    }
    float _675 = _673;
    if (!_629)
    {
        _669 = _585;
    }
    float _677 = _669;
    float _679 = trunc(_655);
    float _681 = precise::max(_679, 0.0);
    uint _684 = uint(_681);
    float _686 = float(uint(_651));
    float _688 = _675 * _677;
    float _690 = as_type<float>(_665) * _686;
    float _692 = _686;
    if (_629)
    {
        _692 = 1.0;
    }
    float _694 = _692;
    float _696 = floor(_688);
    float _698 = _694;
    if (!_629)
    {
        _698 = 7.345489978790283203125;
    }
    float _700 = _698;
    int _702 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _704 = _702 != 0;
    float _706 = _700 * _155;
    float _708 = trunc(_690);
    float _710 = precise::max(_708, 0.0);
    uint _712 = uint(_710);
    int _714 = _617 * int(_684);
    int _716 = _714 + _643;
    float _718 = float(uint(_716));
    float _720 = floor(_706);
    float _722 = as_type<float>(_647) * _718;
    int _724 = _625 * int(_712);
    int _726 = _724 + _651;
    float _728 = trunc(_722);
    float _730 = precise::max(_728, 0.0);
    uint _732 = uint(_730);
    float _734 = float(uint(_726));
    float _736 = -_720;
    float _738 = _706 + _736;
    float _740 = _165 * _123;
    float _742 = as_type<float>(_665) * _734;
    float _744 = -_696;
    float _746 = _688 + _744;
    float _748 = float(_603);
    float _750 = trunc(_742);
    float _752 = precise::max(_750, 0.0);
    uint _754 = uint(_752);
    float _756 = float(_643);
    int _758 = int(_684) + int(_732);
    float _760 = _738 * _748;
    float _762 = float(_609);
    float _764 = _748 * _740;
    bool _766 = _756 >= _748;
    bool _768 = isnan(_756);
    bool _770 = _766 || _768;
    bool _772 = isnan(_748);
    bool _774 = _770 || _772;
    float _776 = float(_774);
    float _778 = _746 * _762;
    float _780 = trunc(_776);
    int _782 = int(_780);
    float _784 = float(_651);
    float _786 = _762 * _740;
    int _788 = int(_712) + int(_754);
    int _790 = ~_603;
    int _792 = _790 + 1;
    float _794 = trunc(_760);
    int _796 = int(_794);
    int _798 = ~_609;
    int _800 = _798 + 1;
    bool _802 = _784 >= _762;
    bool _804 = isnan(_784);
    bool _806 = _802 || _804;
    bool _808 = isnan(_762);
    bool _810 = _806 || _808;
    float _812 = float(_810);
    int _814 = _792 * _758;
    int _816 = _814 + _643;
    bool _818 = !_704;
    int _820 = _818 ? 0 : 1;
    int _822 = _800 * _788;
    int _824 = _822 + _651;
    float _826 = trunc(_778);
    int _828 = int(_826);
    bool _830 = uint(_816) >= uint(_603);
    bool _832 = uint(_824) >= uint(_609);
    bool _834 = !_830;
    int _836 = _834 ? 0 : (-1);
    int _838 = abs(_820);
    float _840 = trunc(_764);
    int _842 = int(_840);
    int _844 = ~_758;
    int _846 = _844 + _836;
    int _848 = _846 + 1;
    bool _850 = !_832;
    int _852 = _850 ? 0 : (-1);
    int _854 = _796 * _838;
    int _856 = _854 + _643;
    int _858 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _860 = _858 != 0;
    int _862 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _864 = _862 != 0;
    int _866 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _868 = _866 != 0;
    int _870 = _603 * _848;
    int _872 = _870 + _643;
    bool _874 = !_591;
    int _876 = _874 ? 0 : 1;
    float _878 = trunc(_812);
    int _880 = int(_878);
    bool _882 = _603 == 0;
    int _884 = abs(_876);
    int _886 = ~_788;
    int _888 = _886 + _852;
    int _890 = _888 + 1;
    bool _892 = !_882;
    int _894 = _892 ? _872 : (-1);
    int _896 = _828 * _884;
    int _898 = _896 + _651;
    int _900 = ~_782;
    int _902 = _900 + 1;
    int _904 = _902 + 1;
    int _906 = _609 * _890;
    int _908 = _906 + _651;
    bool _910 = _609 == 0;
    bool _912 = !_864;
    int _914 = _912 ? 0 : 1;
    int _916 = _894 * _904;
    int _918 = _603 + (-1);
    bool _920 = !_860;
    int _922 = _920 ? 0 : 1;
    bool _924 = !_868;
    int _926 = _924 ? 0 : 1;
    int _928 = _782 * _918;
    int _930 = _928 + _916;
    int _932 = ~_880;
    int _934 = _932 + 1;
    int _936 = _934 + 1;
    float _938 = trunc(_786);
    int _940 = int(_938);
    bool _942 = !_910;
    int _944 = _942 ? _908 : (-1);
    int _946 = abs(_914);
    int _948 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _950 = _948 != 0;
    int _952 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _954 = _952 != 0;
    int _956 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _958 = _956 != 0;
    int _960 = _944 * _936;
    int _962 = abs(_922);
    int _964 = _930 * _946;
    int _966 = _609 + (-1);
    bool _968 = !_954;
    int _970 = _968 ? 0 : 1;
    int _972 = _842 * _962;
    int _974 = _972 + _964;
    bool _976 = !_950;
    int _978 = _976 ? 0 : 1;
    int _980 = _880 * _966;
    int _982 = _980 + _960;
    int _984 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _986 = _984 != 0;
    int _988 = abs(_970);
    int _990 = abs(_978);
    int _992 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _994 = _992 != 0;
    int _996 = _982 * _988;
    bool _998 = !_958;
    int _1000 = _998 ? 0 : 1;
    bool _1002 = !_986;
    int _1004 = _1002 ? 0 : 1;
    int _1006 = abs(_926);
    bool _1008 = !_994;
    int _1010 = _1008 ? 0 : 1;
    int _1012 = abs(_1000);
    int _1014 = _940 * _990;
    int _1016 = _1014 + _996;
    int _1018 = abs(_1004);
    int _1020 = abs(_1010);
    int _1022 = _856 * _1006;
    int _1024 = _1022 + _974;
    int _1026 = _898 * _1012;
    int _1028 = _1026 + _1016;
    int _1030 = ~_609;
    int _1032 = _1030 + 1;
    int _1034 = _796 * _1018;
    int _1036 = _1034 + _1024;
    int _1038 = ~_603;
    int _1040 = _1038 + 1;
    int _1042 = _828 * _1020;
    int _1044 = _1042 + _1028;
    int _1046 = ~_609;
    int _1048 = _1046 + 1;
    float _1050 = float(uint(_1036));
    float _1052 = float(uint(_1044));
    int _1054 = ~_603;
    int _1056 = _1054 + 1;
    float _1058 = as_type<float>(_647) * _1050;
    float _1060 = float(uint(_898));
    float _1062 = as_type<float>(_665) * _1052;
    int _1064 = ~_603;
    int _1066 = _1064 + 1;
    float _1068 = trunc(_1058);
    float _1070 = precise::max(_1068, 0.0);
    uint _1072 = uint(_1070);
    float _1074 = trunc(_1062);
    float _1076 = precise::max(_1074, 0.0);
    uint _1078 = uint(_1076);
    float _1080 = float(uint(_856));
    int _1082 = _1066 * int(_1072);
    int _1084 = _1082 + _1036;
    float _1086 = as_type<float>(_647) * _1080;
    float _1088 = float(uint(_1084));
    float _1090 = trunc(_1086);
    float _1092 = precise::max(_1090, 0.0);
    uint _1094 = uint(_1092);
    int _1096 = _1032 * int(_1078);
    int _1098 = _1096 + _1044;
    float _1100 = as_type<float>(_647) * _1088;
    float _1102 = float(uint(_1098));
    float _1104 = trunc(_1100);
    float _1106 = precise::max(_1104, 0.0);
    uint _1108 = uint(_1106);
    float _1110 = as_type<float>(_665) * _1102;
    float _1112 = trunc(_1110);
    float _1114 = precise::max(_1112, 0.0);
    uint _1116 = uint(_1114);
    int _1118 = int(_1072) + int(_1108);
    int _1120 = ~_603;
    int _1122 = _1120 + 1;
    int _1124 = _1040 * _1118;
    int _1126 = _1124 + _1036;
    int _1128 = _1122 * int(_1094);
    int _1130 = _1128 + _856;
    int _1132 = int(_1078) + int(_1116);
    bool _1134 = uint(_1126) >= uint(_603);
    float _1136 = in.m_66.x;
    float _1138 = in.m_66.y;
    float _1140 = in.m_66.z;
    float _1142 = in.m_66.w;
    float _1144 = float(uint(_1130));
    int _1146 = _1048 * _1132;
    int _1148 = _1146 + _1044;
    bool _1150 = !_1134;
    int _1152 = _1150 ? 0 : (-1);
    float _1154 = as_type<float>(_647) * _1144;
    bool _1156 = uint(_1148) >= uint(_609);
    int _1158 = ~_1118;
    int _1160 = _1158 + _1152;
    int _1162 = _1160 + 1;
    bool _1164 = !_1156;
    int _1166 = _1164 ? 0 : (-1);
    float _1168 = trunc(_1154);
    float _1170 = precise::max(_1168, 0.0);
    uint _1172 = uint(_1170);
    int _1174 = _603 * _1162;
    int _1176 = _1174 + _1036;
    int _1178 = ~_1132;
    int _1180 = _1178 + _1166;
    int _1182 = _1180 + 1;
    bool _1184 = !_882;
    int _1186 = _1184 ? _1176 : (-1);
    int _1188 = _609 * _1182;
    int _1190 = _1188 + _1044;
    int _1192 = _1186 & 3;
    bool _1194 = _1192 != 0;
    bool _1196 = !_910;
    int _1198 = _1196 ? _1190 : (-1);
    int _1200 = _1186 & 3;
    bool _1202 = _1200 != 0;
    float _1204 = in.m_68.x;
    float _1206 = in.m_68.y;
    float _1208 = in.m_68.z;
    float _1210 = in.m_68.w;
    int _1212 = _1198 & 3;
    bool _1214 = _1212 != 0;
    bool _1216 = uint(_1192) > 1u;
    bool _1218 = uint(_1212) > 1u;
    int _1220 = _1202 ? 0 : 1;
    int _1222 = _1198 & 3;
    bool _1224 = _1222 != 0;
    int _1226 = ~_1220;
    int _1228 = _1226 + 1;
    int _1230 = _1228 + 1;
    int _1232 = _1224 ? 0 : 1;
    int _1234 = int(_1094) + int(_1172);
    int _1236 = ~_1232;
    int _1238 = _1236 + 1;
    int _1240 = _1238 + 1;
    float _1242 = in.m_70.x;
    float _1244 = in.m_70.y;
    float _1246 = in.m_70.z;
    float _1248 = in.m_70.w;
    int _1250 = _1230;
    int _1252 = _1240;
    if (!_1216)
    {
        int _1254 = ~_1220;
        int _1256 = _1254 + 1;
        _1250 = _1256;
    }
    int _1258 = _1250;
    int _1260 = _1056 * _1234;
    int _1262 = _1260 + _856;
    if (!_1218)
    {
        int _1264 = ~_1232;
        int _1266 = _1264 + 1;
        _1252 = _1266;
    }
    int _1268 = _1252;
    bool _1270 = _1192 != 3;
    float _1272 = in.m_46.x;
    float _1274 = in.m_46.y;
    float _1276 = in.m_46.z;
    bool _1278 = uint(_1192) >= 2u;
    bool _1280 = uint(_1212) >= 2u;
    int _1282 = _1278 ? 0 : 1;
    bool _1284 = _1212 != 3;
    int _1286 = ~_1282;
    int _1288 = _1286 + 1;
    int _1290 = _1288 + 1;
    int _1292 = _1280 ? 0 : 1;
    int _1294 = _1290;
    if (_1270)
    {
        int _1296 = ~_1282;
        int _1298 = _1296 + 1;
        _1294 = _1298;
    }
    int _1300 = _1294;
    bool _1302 = uint(_1262) >= uint(_603);
    float _1304 = in.m_55.y;
    int _1306 = ~_1292;
    int _1308 = _1306 + 1;
    int _1310 = _1308 + 1;
    int _1312 = _1310;
    if (_1284)
    {
        int _1314 = ~_1292;
        int _1316 = _1314 + 1;
        _1312 = _1316;
    }
    int _1318 = _1312;
    float _1320 = as_type<float>(_665) * _1060;
    int _1322 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1324 = _1322 != 0;
    int _1326 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1328 = _1326 != 0;
    float _1330 = _1274 * _1206;
    bool _1332 = !_1324;
    int _1334 = _1332 ? 0 : 1;
    float _1336 = trunc(_1320);
    float _1338 = precise::max(_1336, 0.0);
    uint _1340 = uint(_1338);
    bool _1342 = _155 > 0.5;
    float _1344 = _663 * _123;
    float _1346 = _1274 * _1244;
    float _1348 = _1274 * _1138;
    float _1350 = -_191;
    int _1352 = _1342 ? as_type<int>(_1350) : as_type<int>(_191);
    float _1354 = fma(_1272, _1204, _1330);
    bool _1356 = !_1302;
    int _1358 = _1356 ? 0 : (-1);
    float _1360 = exp2(_1344);
    bool _1362 = !_1328;
    float _1364 = _1362 ? _191 : as_type<float>(_1352);
    float _1366 = fma(_1276, _1208, _1354);
    float _1368 = _1304 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _1370 = _1304 > 0.5;
    int _1372 = _637 * int(_1340);
    int _1374 = _1372 + _898;
    int _1376 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _1378 = _1376 != 0;
    float _1380 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _1382 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1384 = _1382 != 0;
    float _1386 = _155 * 2.0;
    float _1388 = -_195;
    int _1390 = _1370 ? as_type<int>(_1388) : as_type<int>(_195);
    float _1392 = -_1380;
    float _1394 = fma(_587, 2.0, _1392);
    bool _1396 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1398 = isnan(1.0);
    bool _1400 = _1396 || _1398;
    bool _1402 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1404 = _1400 || _1402;
    float _1406 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1408 = 1.0 + _1406;
    float _1410 = float(uint(_1374));
    float _1412 = floor(_1386);
    float _1414 = fma(_1368, -2.0, _597);
    float _1416 = _1304 * 2.0;
    float _1418 = fma(_1272, _1242, _1346);
    float _1420 = as_type<float>(_665) * _1410;
    float _1422 = -_1360;
    float _1424 = _1422 + 1.0;
    float _1426 = 1.0 / _1408;
    bool _1428 = !_1384;
    float _1430 = _1428 ? _195 : as_type<float>(_1390);
    float _1432 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _1434 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1436 = isnan(0.0);
    bool _1438 = _1434 || _1436;
    bool _1440 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1442 = _1438 || _1440;
    float _1444 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1446 = -_123;
    float _1448 = fma(_1446, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1394);
    float _1450 = fma(_155, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1432);
    float _1452 = _1442 ? _1424 : 0.0;
    float _1454 = floor(_1416);
    float _1456 = fma(_1304, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1444);
    bool _1458 = _1412 >= 0.0;
    bool _1460 = isnan(_1412);
    bool _1462 = _1458 || _1460;
    bool _1464 = isnan(0.0);
    bool _1466 = _1462 || _1464;
    float _1468 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1450);
    float _1470 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1456);
    float _1472 = fma(_1276, _1246, _1418);
    float _1474 = trunc(_1420);
    float _1476 = precise::max(_1474, 0.0);
    uint _1478 = uint(_1476);
    float _1480 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1414);
    if (_1404)
    {
        float _1482 = _1452 * _1426;
        _133 = _1482;
    }
    float _1484 = _133;
    int _1486 = _1466 ? 0 : 1;
    float _1488 = fma(_1272, _1136, _1348);
    bool _1490 = _1412 > 0.0;
    float _1492 = _585 * 2.0;
    int _1494 = ~_609;
    int _1496 = _1494 + 1;
    float _1498 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1500 = _1498 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1502 = _1454 >= 0.0;
    bool _1504 = isnan(_1454);
    bool _1506 = _1502 || _1504;
    bool _1508 = isnan(0.0);
    bool _1510 = _1506 || _1508;
    float _1512 = _155 + _1304;
    float _1514 = fma(_1276, _1140, _1488);
    float _1516 = floor(_1492);
    int _1518 = _1510 ? 0 : 1;
    float _1520 = _1512 + (-1.0);
    bool _1522 = _1454 > 0.0;
    float _1524 = _1364 + 0.5;
    int _1526 = int(_1340) + int(_1478);
    float _1528 = fma(_1520, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1530 = 1.0 / _1500;
    int _1532 = ~_1486;
    int _1534 = _1532 + 1;
    int _1536 = _1534 + 1;
    float _1538 = _1514 + _1142;
    int _1540 = _1536;
    float _1542 = _1538;
    if (!_1490)
    {
        int _1544 = ~_1486;
        int _1546 = _1544 + 1;
        _1540 = _1546;
    }
    int _1548 = _1540;
    int _1550 = _1496 * _1526;
    int _1552 = _1550 + _898;
    int _1554 = ~_1518;
    int _1556 = _1554 + 1;
    int _1558 = _1556 + 1;
    float _1560 = _1430 + (-0.5);
    bool _1562 = !_1194;
    int _1564 = _1562 ? 0 : 1;
    float _1566 = -_1470;
    float _1568 = _1566 + 1.0;
    bool _1570 = uint(_1552) >= uint(_609);
    float _1572 = -_1468;
    float _1574 = _1572 + 1.0;
    int _1576 = _1558;
    if (!_1522)
    {
        int _1578 = ~_1518;
        int _1580 = _1578 + 1;
        _1576 = _1580;
    }
    int _1582 = _1576;
    bool _1584 = !_1570;
    int _1586 = _1584 ? 0 : (-1);
    int _1588 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1590 = _1588 != 0;
    int _1592 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1594 = _1592 != 0;
    int _1596 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1598 = _1596 != 0;
    float _1600 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1602 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1600;
    float _1604 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1606 = _579 + _1604;
    bool _1608 = _579 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1610 = isnan(_579);
    bool _1612 = _1608 || _1610;
    bool _1614 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1616 = _1612 || _1614;
    float _1618 = float(_1616);
    bool _1620 = !_1590;
    int _1622 = _1620 ? 0 : 1;
    float _1624 = _1602 * _1530;
    bool _1626 = _1516 >= 0.0;
    bool _1628 = isnan(_1516);
    bool _1630 = _1626 || _1628;
    bool _1632 = isnan(0.0);
    bool _1634 = _1630 || _1632;
    float _1636 = -_1618;
    float _1638 = _1636 + 1.0;
    bool _1640 = _579 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1642 = isnan(_579);
    bool _1644 = _1640 || _1642;
    bool _1646 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1648 = _1644 || _1646;
    float _1650 = float(_1648);
    float _1652 = _1472 + _1248;
    int _1654 = _1634 ? 0 : 1;
    bool _1656 = _1516 > 0.0;
    float _1658 = fma(_1624, _1606, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1660 = _1366 + _1210;
    float _1662 = fma(_1524, (*spvDescriptorSet0.vp_c9)._m0[80].x, _1448);
    float _1664 = _1650 * _1638;
    float _1666 = -_1560;
    float _1668 = -_1480;
    float _1670 = fma(_1666, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1668);
    float _1672 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1674 = _1660 + _1672;
    float _1676 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1678 = _1652 + _1676;
    float _1680 = _1658 * _1664;
    int _1682 = _1186 >> 31;
    float _1684 = _1674 * _1674;
    float _1686 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1688 = _1538 + _1686;
    int _1690 = _1198 >> 31;
    float _1692 = -_1650;
    float _1694 = _1692 + 1.0;
    float _1696 = fma(_1678, _1678, _1684);
    int _1698 = _1682 & 3;
    float _1700 = fma(_1430, _1568, _1670);
    int _1702 = _1690 & 3;
    float _1704 = fma(_1688, _1688, _1696);
    int _1706 = _1186 + _1698;
    float _1708 = fma(_1694, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1680);
    int _1710 = _1198 + _1702;
    float _1712 = rsqrt(_1704);
    float _1714 = _387 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _1716 = _1706 >> 2;
    float _1718 = -_1574;
    float _1720 = fma(_1364, _1718, _1662);
    int _1722 = _1710 >> 2;
    float _1724 = _1714 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    int _1726 = _1716 << 4;
    int _1728 = _1726 + 368;
    float _1730 = _1674 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _1732 = ~_1654;
    int _1734 = _1732 + 1;
    int _1736 = _1734 + 1;
    out.m_72.x = _1720;
    out.m_72.y = _1700;
    int _1738 = _1736;
    if (!_1656)
    {
        int _1740 = ~_1654;
        int _1742 = _1740 + 1;
        _1738 = _1742;
    }
    int _1744 = _1738;
    float _1746 = fma(_1618, (*spvDescriptorSet0.vp_c9)._m0[132].x, _1708);
    uint _1748 = uint(int(uint(_1728) >> uint(2)));
    uint _1750 = uint(int(uint(int(_1748)) >> uint(2)));
    int _1752 = int(_1748) & 3;
    float _1754 = (*spvDescriptorSet0.vp_c9)._m0[int(_1750)][_1752];
    int _1756 = int(_1748) + 1;
    uint _1758 = uint(int(uint(_1756) >> uint(2)));
    int _1760 = _1756 & 3;
    float _1762 = (*spvDescriptorSet0.vp_c9)._m0[int(_1758)][_1760];
    int _1764 = _1722 << 4;
    int _1766 = _1764 + 656;
    float _1768 = _1746 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1770 = _1724 * _1712;
    float _1772 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1774 = fma(_1678, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1730);
    float _1776 = _1674 * _1770;
    uint _1778 = uint(int(uint(_1766) >> uint(2)));
    uint _1780 = uint(int(uint(int(_1778)) >> uint(2)));
    int _1782 = int(_1778) & 3;
    float _1784 = (*spvDescriptorSet0.vp_c9)._m0[int(_1780)][_1782];
    int _1786 = int(_1778) + 1;
    uint _1788 = uint(int(uint(_1786) >> uint(2)));
    int _1790 = _1786 & 3;
    float _1792 = (*spvDescriptorSet0.vp_c9)._m0[int(_1788)][_1790];
    float _1794 = _1678 * _1770;
    float _1796 = -_1776;
    float _1798 = _1674 + _1796;
    float _1800 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1802 = -_1794;
    float _1804 = _1678 + _1802;
    float _1806 = _1772 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1808 = _1798 * _1798;
    float _1810 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    int _1812 = _1728 + 8;
    uint _1814 = uint(int(uint(_1812) >> uint(2)));
    uint _1816 = uint(int(uint(int(_1814)) >> uint(2)));
    int _1818 = int(_1814) & 3;
    float _1820 = (*spvDescriptorSet0.vp_c9)._m0[int(_1816)][_1818];
    int _1822 = int(_1814) + 1;
    uint _1824 = uint(int(uint(_1822) >> uint(2)));
    int _1826 = _1822 & 3;
    float _1828 = (*spvDescriptorSet0.vp_c9)._m0[int(_1824)][_1826];
    float _1830 = _1800 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1832 = fma(_1804, _1804, _1808);
    bool _1834 = !_1214;
    int _1836 = _1834 ? 0 : 1;
    float _1838 = _1810 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1840 = _1192 != 3;
    float _1842 = _1688 * _1770;
    int _1844 = abs(_1622);
    float _1846 = fma(_1688, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1774);
    int _1848 = _1766 + 8;
    uint _1850 = uint(int(uint(_1848) >> uint(2)));
    uint _1852 = uint(int(uint(int(_1850)) >> uint(2)));
    int _1854 = int(_1850) & 3;
    float _1856 = (*spvDescriptorSet0.vp_c9)._m0[int(_1852)][_1854];
    int _1858 = int(_1850) + 1;
    uint _1860 = uint(int(uint(_1858) >> uint(2)));
    int _1862 = _1858 & 3;
    float _1864 = (*spvDescriptorSet0.vp_c9)._m0[int(_1860)][_1862];
    out.m_74.x = _1830;
    out.m_74.y = _1838;
    out.m_74.z = _1806;
    out.m_74.w = _1768;
    int _1866 = ~_1234;
    int _1868 = _1866 + _1358;
    int _1870 = _1868 + 1;
    int _1872 = ~_1526;
    int _1874 = _1872 + _1586;
    int _1876 = _1874 + 1;
    int _1878 = abs(_1300);
    int _1880 = _603 * _1870;
    int _1882 = _1880 + _856;
    int _1884 = abs(_1268);
    int _1886 = _609 * _1876;
    int _1888 = _1886 + _898;
    int _1890 = abs(_1836);
    int _1892 = ~_1884;
    int _1894 = _1892 + 1;
    int _1896 = _1894 + 1;
    float _1898 = float(_1744);
    float _1900 = float(_1844);
    float _1902 = -_1842;
    float _1904 = _1688 + _1902;
    int _1906 = abs(_1564);
    bool _1908 = !_1840;
    int _1910 = _1908 ? 0 : (-1);
    float _1912 = _1900 * _1898;
    int _1914 = abs(_1258);
    float _1916 = fma(_1904, _1904, _1832);
    bool _1918 = _1212 != 3;
    int _1920 = ~_1914;
    int _1922 = _1920 + 1;
    int _1924 = _1922 + 1;
    int _1926 = _1896 * as_type<int>(_1792);
    int _1928 = ~_1906;
    int _1930 = _1928 + 1;
    int _1932 = _1930 + 1;
    float _1934 = sqrt(_1916);
    int _1936 = _1924 * as_type<int>(_1762);
    int _1938 = ~_1890;
    int _1940 = _1938 + 1;
    int _1942 = _1940 + 1;
    int _1944 = abs(_1318);
    int _1946 = _1932 * as_type<int>(_1754);
    int _1948 = _1946 + _1936;
    int _1950 = _1942 * as_type<int>(_1784);
    int _1952 = _1950 + _1926;
    bool _1954 = !_1918;
    int _1956 = _1954 ? 0 : (-1);
    int _1958 = ~_1878;
    int _1960 = _1958 + 1;
    int _1962 = _1960 + 1;
    int _1964 = abs(_1956);
    int _1966 = ~_1944;
    int _1968 = _1966 + 1;
    int _1970 = _1968 + 1;
    int _1972 = _1962 * as_type<int>(_1820);
    int _1974 = _1972 + _1948;
    int _1976 = abs(_1910);
    float _1978 = in.m_76.x;
    float _1980 = in.m_76.y;
    float _1982 = in.m_76.z;
    bool _1984 = !_1378;
    int _1986 = _1984 ? 0 : 1;
    int _1988 = _1970 * as_type<int>(_1856);
    int _1990 = _1988 + _1952;
    int _1992 = ~_1964;
    int _1994 = _1992 + 1;
    int _1996 = _1994 + 1;
    float _1998 = _1712 * _1934;
    int _2000 = abs(_1334);
    int _2002 = _1996 * as_type<int>(_1864);
    int _2004 = _2002 + _1990;
    int _2006 = abs(_1986);
    float _2008 = _1714 * _1998;
    bool _2010 = _1846 >= 0.0;
    int _2012 = ~_1976;
    int _2014 = _2012 + 1;
    int _2016 = _2014 + 1;
    out.m_78.x = _2008;
    int _2018 = ~_2000;
    int _2020 = _2018 + 1;
    int _2022 = _2020 + 1;
    int _2024 = _2016 * as_type<int>(_1828);
    int _2026 = _2024 + _1974;
    int _2028 = ~_2006;
    int _2030 = _2028 + 1;
    int _2032 = _2030 + 1;
    bool _2034 = !_882;
    int _2036 = _2034 ? _1882 : (-1);
    int _2038 = _2026 * _2022;
    bool _2040 = !_910;
    int _2042 = _2040 ? _1888 : (-1);
    int _2044 = _2004 * _2032;
    float _2046 = as_type<float>(_1974);
    if (_2010)
    {
        _2046 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2048 = _2046;
    float _2050 = _1912 * (-2.0);
    int _2052 = _2036 * _2000;
    int _2054 = _2052 + _2038;
    float _2056 = _155 + (-0.5);
    int _2058 = _2042 * _2006;
    int _2060 = _2058 + _2044;
    float _2062 = fma(_2050, _1978, _1978);
    int _2064 = as_type<int>(_2048);
    if (_2010)
    {
        float _2066 = _2048 * 5.0;
        _2064 = as_type<int>(_2066);
    }
    int _2068 = _2064;
    float _2070 = float(_2054);
    float _2072 = fma(_1528, _2050, _1528);
    float _2074 = float(_2060);
    float _2076 = fma(_2056, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2062);
    float _2078 = _1304 + _585;
    bool _2080 = !_1594;
    int _2082 = _2080 ? 0 : 1;
    if (_2010)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6384 = as_type<float>(_2068);
        out.gl_Position.z = _6384;
    }
    float _2084 = _2078 + (-1.0);
    float _2086 = float(_1548);
    out.m_80.x = _2070;
    int _2088 = abs(_2082);
    out.m_80.z = _2074;
    if (_2010)
    {
        out.m_53.x = 0.0;
    }
    bool _2090 = !_1598;
    int _2092 = _2090 ? 0 : 1;
    if (_2010)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2094 = -_1776;
    float _2096 = _1660 + _2094;
    int _2098 = abs(_2092);
    float _2100 = -_1794;
    float _2102 = _1652 + _2100;
    float _2104 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2106 = _2096 + _2104;
    float _2108 = -_1842;
    float _2110 = _1538 + _2108;
    float _2112 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2114 = _2102 + _2112;
    float _2116 = float(_2088);
    float _2118 = _2106 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2120 = float(_1582);
    float _2122 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2124 = _2110 + _2122;
    float _2126 = float(_2098);
    float _2128 = _2116 * _2086;
    float _2130 = fma(_2114, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2118);
    float _2132 = fma(_2084, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _2134 = _155 + _585;
    float _2136 = _2128 * (-2.0);
    float _2138 = fma(_2124, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2130);
    float _2140 = _2126 * _2120;
    float _2142 = _1304 + (-0.5);
    float _2144 = fma(_2136, _1980, _1980);
    float _2146 = fma(_2132, _2136, _2132);
    bool _2148 = _2138 >= 0.0;
    float _2150 = _2140 * (-2.0);
    float _2152 = _2134 + (-1.0);
    float _2154 = fma(_2142, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2144);
    float _2156 = fma(_2150, _1982, _1982);
    float _2158 = _585 + (-0.5);
    float _2160 = fma(_2152, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2162 = fma(_2072, _1484, _2076);
    float _2164 = fma(_2146, _1484, _2154);
    float _2166 = fma(_2158, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2156);
    float _2168 = fma(_2160, _2150, _2160);
    float _2170 = _2162 * 0.15915493667125701904296875;
    float _2172 = _2164 * 0.15915493667125701904296875;
    float _2174 = _2150;
    int _2176 = as_type<int>(_2156);
    float _2178 = _2102;
    if (_2148)
    {
        _2174 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2180 = _2174;
    float _2182 = fma(_2168, _1484, _2166);
    float _2184 = _2170 * 6.283185482025146484375;
    float _2186 = sin(_2184);
    if (_2148)
    {
        out.m_53.x = 0.0;
    }
    if (_2148)
    {
        float _2188 = _2180 * 5.0;
        _2176 = as_type<int>(_2188);
    }
    int _2190 = _2176;
    float _2192 = _2182 * 0.15915493667125701904296875;
    float _2194 = _2170 * 6.283185482025146484375;
    float _2196 = cos(_2194);
    if (_2148)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6577 = as_type<float>(_2190);
        out.gl_Position.z = _6577;
    }
    float _2198 = _2172 * 6.283185482025146484375;
    float _2200 = sin(_2198);
    float _2202 = _2172 * 6.283185482025146484375;
    float _2204 = cos(_2202);
    if (_2148)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2206 = _2192 * 6.283185482025146484375;
    float _2208 = cos(_2206);
    float _2210 = _389 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2212 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _195);
    float _2214 = _2186 * _2200;
    float _2216 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _191);
    float _2218 = _2210 * _1998;
    float _2220 = _2196 * _2200;
    float _2222 = _2192 * 6.283185482025146484375;
    float _2224 = sin(_2222);
    float _2226 = _2218 * _2212;
    float _2228 = _2196 * _2204;
    float _2230 = _2186 * _2204;
    float _2232 = _2008 * _2216;
    float _2234 = _1998 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2236 = _2234 * 0.5;
    bool _2238 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2240 = isnan(0.5);
    bool _2242 = _2238 || _2240;
    bool _2244 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2246 = _2242 || _2244;
    float _2248 = _2196 * _2208;
    float _2250 = _2204 * _2208;
    float _2252 = _2186 * _2208;
    float _2254 = _2200 * _2208;
    float _2256 = _2248 * _2226;
    bool _2258 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2260 = isnan(0.5);
    bool _2262 = _2258 || _2260;
    bool _2264 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2266 = _2262 || _2264;
    float _2268 = fma(_2224, _2228, _2214);
    float _2270 = -_2230;
    float _2272 = fma(_2224, _2220, _2270);
    float _2274 = -_2226;
    float _2276 = _2224 * _2274;
    float _2278 = -_2220;
    float _2280 = fma(_2224, _2230, _2278);
    float _2282 = fma(_2268, _2232, _2256);
    float _2284 = _2252 * _2226;
    float _2286 = fma(_2250, _2232, _2276);
    float _2288 = fma(_2224, _2214, _2228);
    float _2290 = fma(_2272, _2236, _2282);
    float _2292 = fma(_2280, _2232, _2284);
    float _2294 = fma(_2254, _2236, _2286);
    float _2296 = _2290 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2298 = fma(_2288, _2236, _2292);
    float _2300 = _2290 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2302 = _2096 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2304 = fma(_2294, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2296);
    float _2306 = fma(_2294, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2300);
    float _2308 = fma(_2102, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2302);
    float _2310 = fma(_2298, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2304);
    float _2312 = fma(_2298, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2306);
    float _2314 = fma(_2110, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2308);
    float _2316 = _2310 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2318 = _2096 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2320 = _2312 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2322 = _2314 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2324 = _1538 + _2316;
    float _2326 = fma(_2102, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2318);
    float _2328 = _1652 + _2320;
    float _2330 = 1.0 / _2322;
    float _2332 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2334 = _2324 + _2332;
    float _2336 = fma(_2110, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2326);
    float _2338 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2340 = _2328 + _2338;
    float _2342 = _2290 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2344 = _2334 * _2334;
    float _2346 = _2336 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2348 = fma(_2294, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2342);
    float _2350 = fma(_2340, _2340, _2344);
    float _2352 = _2346 + _2322;
    float _2354 = fma(_2298, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2348);
    float _2356 = sqrt(_2350);
    float _2358 = _2352 * _2330;
    float _2360 = _2358 * 0.5;
    float _2362 = _2354 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2364 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2366 = fma(_2360, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2364);
    float _2368 = _1660 + _2362;
    float _2370 = 1.0 / _2366;
    bool _2372 = _2356 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2374 = _2294;
    float _2376 = _2322;
    float _2378 = _2328;
    float _2380 = _2354;
    if (!_2372)
    {
        _2374 = _2324;
    }
    float _2382 = _2374;
    float _2384 = _2382;
    if (!_2372)
    {
        _2376 = _2368;
    }
    float _2386 = _2376;
    bool _2388 = !_2372;
    float _2390 = _2386;
    if (!_2388)
    {
        float _2392 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2394 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2396 = _2356 + _2394;
        float _2398 = rsqrt(_2350);
        float _2400 = _2396 * _2392;
        float _2402 = _2368 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2404 = _2400 * 0.15915493667125701904296875;
        float _2406 = _2404 * 6.283185482025146484375;
        float _2408 = cos(_2406);
        float _2410 = _2404 * 6.283185482025146484375;
        float _2412 = sin(_2410);
        float _2414 = _2408 + (-1.0);
        float _2416 = _2414 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2418 = fma(_2412, _2402, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2420 = fma(_2368, _2408, _2416);
        float _2422 = _2398 * _2418;
        float _2424 = fma(_2340, _2422, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2426 = fma(_2334, _2422, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2378 = _2424;
        _2390 = _2420;
        _2384 = _2426;
        _2380 = _2422;
    }
    float _2428 = _2378;
    float _2430 = _2390;
    float _2432 = _2384;
    float _2434 = _2380;
    float _2436 = -_1794;
    float _2438 = _2436 + _2428;
    float _2440 = -_1776;
    float _2442 = _2440 + _2430;
    float _2444 = -_1842;
    float _2446 = _2444 + _2432;
    float _2448 = _2434;
    float _2450 = _2442;
    float _2452 = _2438;
    float _2454 = _2446;
    float _2456 = _2430;
    float _2458 = _2432;
    if (_2266)
    {
        _2448 = 1.0;
    }
    float _2460 = _2448;
    float _2462 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2464 = _2370 * _2462;
    float _2466 = _2460;
    if (!_2246)
    {
        float _2468 = _2106 * _2106;
        float _2470 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2472 = -_1538;
        float _2474 = _2472 + _2432;
        float _2476 = -_1652;
        float _2478 = _2476 + _2428;
        float _2480 = fma(_2114, _2114, _2468);
        float _2482 = fma(_2124, _2124, _2480);
        float _2484 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2486 = sqrt(_2482);
        float _2488 = 1.0 / _1998;
        float _2490 = _2484 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2492 = precise::min(_2486, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2494 = _2492 * _2470;
        float _2496 = _2494 * _2488;
        float _2498 = -_1660;
        float _2500 = _2498 + _2430;
        float _2502 = _2490 * _2496;
        float _2504 = _2474 * _2496;
        float _2506 = fma(_2500, _2502, _2096);
        float _2508 = fma(_2478, _2502, _2102);
        float _2510 = fma(_2490, _2504, _2110);
        _2450 = _2506;
        _2452 = _2508;
        _2454 = _2510;
        _1542 = _2504;
    }
    float _2512 = _2450;
    float _2514 = _2452;
    float _2516 = _2454;
    float _2518 = _1542;
    float _2520 = _2518;
    if (!_2266)
    {
        float _2522 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2524 = _2522 * 0.15915493667125701904296875;
        float _2526 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2528 = _2524 * 6.283185482025146484375;
        float _2530 = cos(_2528);
        float _2532 = _2526 * 0.15915493667125701904296875;
        float _2534 = _2524 * 6.283185482025146484375;
        float _2536 = sin(_2534);
        float _2538 = 1.0 / _2530;
        float _2540 = _2532 * 6.283185482025146484375;
        float _2542 = cos(_2540);
        float _2544 = _2536 * _2538;
        float _2546 = _2532 * 6.283185482025146484375;
        float _2548 = sin(_2546);
        float _2550 = _2542 * _2544;
        float _2552 = 1.0 / _2550;
        float _2554 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2556 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2554;
        float _2558 = 1.0 / _2556;
        float _2560 = _2548 * _2552;
        float _2562 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2564 = fma(_2464, _2560, _2562);
        float _2566 = _2564 * _2558;
        float _2568 = precise::clamp(_2566, 0.0, 1.0);
        _2520 = _2532;
        _2466 = _2568;
    }
    float _2570 = _2520;
    float _2572 = _2466;
    float _2574 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2576 = _2512 + _2574;
    float _2578 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2580 = _2514 + _2578;
    float _2582 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2584 = _2516 + _2582;
    float _2586 = _2576 * _2576;
    float _2588 = fma(_2580, _2580, _2586);
    float _2590 = fma(_2584, _2584, _2588);
    float _2592 = rsqrt(_2590);
    float _2594 = sqrt(_2590);
    float _2596 = _2592 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2598 = _2580 * _2596;
    float _2600 = _2584 * _2596;
    float _2602 = _2598 * _2598;
    float _2604 = _2600 * _2600;
    float _2606 = _2602 + _2604;
    float _2608 = sqrt(_2606);
    bool _2610 = _2608 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2612 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2614 = _2608 + _2612;
    float _2616 = _2592;
    float _2618 = _2570;
    float _2620 = _2614;
    float _2622 = _2596;
    if (_2610)
    {
        float _2624 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2616 = _2624;
    }
    float _2626 = _2616;
    if (_2610)
    {
        float _2628 = rsqrt(_2606);
        _2618 = _2628;
    }
    float _2630 = _2618;
    float _2632 = _2630;
    if (_2610)
    {
        float _2634 = _2614 * _2626;
        _2620 = _2634;
    }
    float _2636 = _2620;
    if (_2610)
    {
        float _2638 = _2636 * 0.15915493667125701904296875;
        _2456 = _2638;
    }
    float _2640 = _2456;
    float _2642 = _2626;
    if (_2610)
    {
        float _2644 = _2640 * 6.283185482025146484375;
        float _2646 = sin(_2644);
        _2642 = _2646;
    }
    float _2648 = _2642;
    float _2650 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2652 = precise::max(0.0, _2650);
    float _2654 = _2584;
    float _2656 = _2652;
    if (_2610)
    {
        float _2658 = _2640 * 6.283185482025146484375;
        float _2660 = cos(_2658);
        _2654 = _2660;
    }
    float _2662 = _2654;
    float _2664 = -_2596;
    float _2666 = -_2652;
    float _2668 = fma(_2576, _2664, _2666);
    float _2670 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_2610)
    {
        float _2672 = _2668 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2656 = _2672;
    }
    float _2674 = _2656;
    float _2676 = _2648;
    if (_2610)
    {
        float _2678 = fma(_2648, _2674, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2458 = _2678;
    }
    float _2680 = _2458;
    float _2682 = fma(_2102, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2684 = _2680;
    if (!_2610)
    {
        _2178 = _2600;
    }
    float _2686 = _2178;
    float _2688 = _2686;
    float _2690 = _2662;
    if (_2610)
    {
        float _2692 = _2662 + (-1.0);
        _2670 = _2692;
    }
    float _2694 = _2670;
    float _2696 = _2694;
    if (_2610)
    {
        float _2698 = _2630 * _2680;
        _2622 = _2698;
    }
    float _2700 = _2622;
    if (!_2610)
    {
        _2632 = _2598;
    }
    float _2702 = _2632;
    float _2704 = _2702;
    if (_2610)
    {
        float _2706 = _2694 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2696 = _2706;
    }
    float _2708 = _2696;
    if (_2610)
    {
        float _2710 = _2598 * _2700;
        _2704 = _2710;
    }
    float _2712 = _2704;
    if (!_2610)
    {
        _2684 = _2668;
    }
    float _2714 = _2684;
    float _2716 = _2714;
    if (_2610)
    {
        float _2718 = _2600 * _2700;
        _2688 = _2718;
    }
    float _2720 = _2688;
    if (!_2610)
    {
        _2676 = _2602;
    }
    float _2722 = _2676;
    float _2724 = _2722;
    if (_2610)
    {
        float _2726 = fma(_2668, _2662, _2708);
        _2716 = _2726;
    }
    float _2728 = _2716;
    if (_2610)
    {
        float _2730 = _2712 * _2712;
        _2724 = _2730;
    }
    float _2732 = _2724;
    if (!_2610)
    {
        _2690 = _2604;
    }
    float _2734 = _2690;
    float _2736 = _2734;
    if (_2610)
    {
        float _2738 = _2720 * _2720;
        _2736 = _2738;
    }
    float _2740 = _2736;
    float _2742 = fma(_2728, _2728, _2732);
    float _2744 = _2512 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2746 = _2512 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2748 = _2742 + _2740;
    float _2750 = fma(_2514, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2744);
    float _2752 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2754 = fma(_2594, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2752);
    float _2756 = precise::clamp(_2754, 0.0, 1.0);
    float _2758 = rsqrt(_2748);
    float _2760 = fma(_2516, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2750);
    float _2762 = -_2756;
    float _2764 = _2762 + 1.0;
    float _2766 = fma(_2110, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2768 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2770 = _2760 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2772 = _2512 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2774 = fma(_2514, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2746);
    float _2776 = abs(_2764);
    float _2778 = log2(_2776);
    float _2780 = _2770 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2782 = -_2780;
    float _2784 = fma(_2782, _2768, 1.0);
    float _2786 = _2512 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2788 = _2758 * _2712;
    float _2790 = _2758 * _2728;
    float _2792 = fma(_2514, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2786);
    float _2794 = _2758 * _2720;
    float _2796 = fma(_2514, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2772);
    float _2798 = _2788 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2800 = fma(_2516, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2792);
    float _2802 = floor(_2682);
    float _2804 = fma(_2516, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2796);
    float _2806 = -_2798;
    float _2808 = fma(_2790, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2806);
    float _2810 = _2800 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2812 = _2778 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2814 = _2804 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2816 = fma(_2516, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2774);
    float _2818 = _2810 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2820 = floor(_2766);
    float _2822 = -_2794;
    float _2824 = fma(_2822, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2808);
    float _2826 = _2816 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2828 = fma(_2814, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2818);
    float _2830 = _2810 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2832 = fma(_2824, -0.5, 0.5);
    float _2834 = fma(_2770, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2828);
    float _2836 = exp2(_2812);
    float _2838 = fma(_2824, 0.5, 0.5);
    float _2840 = fma(_2826, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2834);
    float _2842 = log2(_2784);
    float _2844 = -_2820;
    float _2846 = _2766 + _2844;
    float _2848 = fma(_2814, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2830);
    float _2850 = fma(_2838, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2852 = fma(_2770, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2848);
    float _2854 = fma(_2838, _2850, -0.212114393711090087890625);
    float _2856 = 1.0 / _2840;
    float _2858 = -_2802;
    float _2860 = _2682 + _2858;
    float _2862 = _2810 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2864 = fma(_2838, _2854, 1.570728778839111328125);
    float _2866 = fma(_2814, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2862);
    float _2868 = _2790 + 1.0;
    float _2870 = sqrt(_2832);
    float _2872 = _2842 * 0.693147182464599609375;
    float _2874 = fma(_2770, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2866);
    float _2876 = -_2790;
    float _2878 = fma(_2836, _2868, _2876);
    float2 _7670 = float2(_2860, _2846);
    float _2880 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_7670, float2(0.0), isnan(_7670)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_7670, float2(0.0), isnan(_7670)), level(0.0)).x;
    float _2882 = _2872 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2884 = fma(_2826, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2874);
    float _2886 = fma(_2826, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2852);
    float _2888 = _2884 * _2856;
    float _2890 = _2886 * _2856;
    float _2892 = fma(_2888, 0.5, 0.5);
    float _2894 = fma(_2890, -0.5, 0.5);
    float _2896 = _2870 * 0.636619746685028076171875;
    float _2898 = -_2864;
    float _2900 = fma(_2896, _2898, 1.0);
    float _2902 = fma(_2878, 0.5, 0.5);
    float3 _7715 = float3(_2892, _2894, _2882);
    float _2904 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7715, float3(0.0), isnan(_7715)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7715, float3(0.0), isnan(_7715)), level(0.0)).x;
    float3 _7726 = float3(_2892, _2894, _2882);
    float4 _2907 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7726, float3(0.0), isnan(_7726)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7726, float3(0.0), isnan(_7726)), level(0.0)).xyzw;
    float _2909 = _2907.x;
    float _2911 = _2907.y;
    float _2913 = _2907.z;
    float _2915 = _2907.w;
    float2 _7742 = float2(_2900, _2902);
    float3 _2919 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7742, float2(0.0), isnan(_7742)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7742, float2(0.0), isnan(_7742)), level(0.0)).xyz;
    float _2921 = _2919.x;
    float _2923 = _2919.y;
    float _2925 = _2919.z;
    float _2927 = abs(_2464);
    float _2929 = log2(_2927);
    float _2931 = _2268 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2933 = _2268 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2935 = _2268 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2937 = _2248 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2939 = fma(_2250, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2931);
    float _2941 = fma(_2250, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2933);
    float _2943 = fma(_2250, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2935);
    float _2945 = _2248 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2947 = _2248 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2949 = _195 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2951 = -_2224;
    float _2953 = fma(_2951, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2937);
    float _2955 = -_2224;
    float _2957 = fma(_2955, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2945);
    float _2959 = -_2224;
    float _2961 = fma(_2959, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2947);
    bool _2963 = _2594 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2965 = isnan(_2594);
    bool _2967 = _2963 || _2965;
    bool _2969 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2971 = _2967 || _2969;
    float _2973 = _2929 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2975 = fma(_2949, _2949, 1.0);
    float _2977 = _2272 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2979 = _2272 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2981 = _2272 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2983 = fma(_2252, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2961);
    float _2985 = exp2(_2973);
    float _2987 = fma(_2254, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2977);
    float _2989 = fma(_2254, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2979);
    float _2991 = fma(_2254, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2981);
    float _2993 = fma(_2252, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2957);
    float _2995 = fma(_2252, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2953);
    float _2997 = rsqrt(_2975);
    float _2999 = fma(_2280, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2939);
    float _3001 = _191 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3003 = fma(_2288, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2987);
    float _3005 = fma(_2288, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2989);
    float _3007 = fma(_2288, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2991);
    float _3009 = _2949 * _2995;
    float _3011 = fma(_2985, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3013 = precise::clamp(_3011, 0.0, 1.0);
    float _3015 = fma(_2280, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2941);
    float _3017 = fma(_2280, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2943);
    float _3019 = fma(_3013, -2.0, 3.0);
    float _3021 = _3013 * _3013;
    float _3023 = _2949 * _2993;
    out.m_82.x = _2999;
    out.m_82.y = _3015;
    out.m_82.z = _3017;
    float _3025 = _3021 * _3019;
    float _3027 = fma(_3001, _2999, _3023);
    float _3029 = _2949 * _2997;
    float _3031 = _2810 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3033 = fma(_3001, _3015, _3009);
    float _3035 = -_3025;
    float _3037 = _3035 + 1.0;
    float _3039 = -_3003;
    float _3041 = _3029 * _3039;
    float _3043 = fma(_2814, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3031);
    float _3045 = -_3005;
    float _3047 = _3029 * _3045;
    float _3049 = fma(_3037, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3025);
    float _3051 = _2949 * _2983;
    float _3053 = _2778 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3055 = -_3007;
    float _3057 = _3029 * _3055;
    float _3059 = fma(_2997, _2995, _3047);
    float _3061 = fma(_2770, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3043);
    float _3063 = in.m_84.x;
    float _3065 = fma(_2997, _2983, _3057);
    float _3067 = exp2(_3053);
    bool _3069 = _2464 <= 8000.0;
    bool _3071 = isnan(_2464);
    bool _3073 = _3069 || _3071;
    bool _3075 = isnan(8000.0);
    bool _3077 = _3073 || _3075;
    float _3079 = float(_3077);
    float _3081 = fma(_2997, _2993, _3041);
    float _3083 = fma(_2826, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3061);
    float _3085 = _2884 + _2840;
    float _3087 = _2840 * 0.5;
    float _3089 = _3079 * _3049;
    float _3091 = _3083 + _2840;
    float _3093 = _3005 + _3033;
    float _3095 = _3089 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3097 = _3091 * 0.5;
    float _3099 = _3085 * 0.5;
    float _3101 = fma(_2886, -0.5, _3087);
    out.gl_Position.x = _2884;
    out.gl_Position.y = _2886;
    out.gl_Position.z = _3083;
    out.gl_Position.w = _2840;
    float _3103 = -_3067;
    float _3105 = _3103 + 1.0;
    float _3107 = fma(_3001, _3017, _3051);
    float _3109 = _3003 + _3027;
    out.m_86.x = _3099;
    out.m_86.y = _3101;
    out.m_86.z = _3097;
    out.m_86.w = _2840;
    float _3111 = _3105 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3113 = _3007 + _3107;
    out.m_88.x = _3081;
    out.m_88.y = _3059;
    out.m_88.z = _3065;
    out.m_90.x = _3109;
    out.m_90.y = _3093;
    out.m_90.z = _3113;
    float _3115 = -_3111;
    float _3117 = _3115 + 1.0;
    float _3119 = _2840;
    float _3121 = _3083;
    float _3123 = _2886;
    float _3125 = _3059;
    float _3127 = _3081;
    float _3129 = _3117;
    if (!_2971)
    {
        _3119 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3131 = _3119;
    float _3133 = _3131;
    float _3135 = _3131;
    if (!_2971)
    {
        _3121 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3137 = _3121;
    float _3139 = _3137;
    float _3141 = _3137;
    if (!_2971)
    {
        _3123 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3143 = _3123;
    float _3145 = _2572 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3147 = _3143;
    float _3149 = _3143;
    if (!_2971)
    {
        _3125 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3151 = _3125;
    float _3153 = _3151;
    float _3155 = _3151;
    if (!_2971)
    {
        _3127 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3157 = _3127;
    float _3159 = -_2880;
    float _3161 = _3159 + 1.0;
    float _3163 = _3161 * _3095;
    float _3165 = precise::clamp(_3163, 0.0, 1.0);
    float _3167 = -_3165;
    float _3169 = fma(_3167, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3171 = _3169 * _3063;
    float _3173 = _3171 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3175 = _3111 * _2904;
    float _3177 = _2915 * _3117;
    float _3179 = _3157;
    float _3181 = _3157;
    if (!_2971)
    {
        _3129 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3183 = _3129;
    out.m_92.x = _3173;
    float _3185 = _2915 * _3175;
    float _3187 = _2925 * _3175;
    float _3189 = fma(_2921, _3185, _2909);
    float _3191 = fma(_2923, _3185, _2911);
    float _3193 = fma(_2915, _3187, _2913);
    out.m_94.x = _3189;
    out.m_94.y = _3191;
    out.m_94.z = _3193;
    out.m_94.w = _3177;
    bool _3195 = !_2971;
    float _3197 = _3183;
    float _3199 = _3183;
    if (!_3195)
    {
        bool _3201 = _2594 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3203 = isnan(_2594);
        bool _3205 = _3201 || _3203;
        bool _3207 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3209 = _3205 || _3207;
        if (!_3209)
        {
            float _3211 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3213 = _2594 + _3211;
            float _3215 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3217 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3215;
            float _3219 = 1.0 / _3217;
            float _3221 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3223 = _3221 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3225 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3227 = _3225 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3229 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3231 = _3229 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3233 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3235 = _3233 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3237 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3239 = _3237 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3241 = _3213 * _3219;
            float _3243 = precise::clamp(_3241, 0.0, 1.0);
            float _3245 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3247 = _3245 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3249 = fma(_3243, _3223, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3251 = fma(_3243, _3247, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3253 = fma(_3243, _3227, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3255 = fma(_3243, _3231, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3257 = fma(_3243, _3235, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3259 = fma(_3243, _3239, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3181 = _3251;
            _3149 = _3257;
            _3155 = _3249;
            _3141 = _3255;
            _3135 = _3253;
            _3199 = _3259;
            _3261 = true;
        }
        else
        {
            bool _3263 = _2594 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3265 = isnan(_2594);
            bool _3267 = _3263 || _3265;
            bool _3269 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3271 = _3267 || _3269;
            if (!_3271)
            {
                _3153 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3273 = _3153;
            _3155 = _3273;
            if (!_3271)
            {
                _3179 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3275 = _3179;
            _3181 = _3275;
            if (!_3271)
            {
                _3133 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3277 = _3133;
            _3135 = _3277;
            if (!_3271)
            {
                _3139 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3279 = _3139;
            _3141 = _3279;
            if (!_3271)
            {
                _3147 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3281 = _3147;
            _3149 = _3281;
            if (!_3271)
            {
                _3197 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3283 = _3197;
            bool _3285 = !_3271;
            _3199 = _3283;
            if (!_3285)
            {
                bool _3287 = _2594 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3289 = isnan(_2594);
                bool _3291 = _3287 || _3289;
                bool _3293 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3295 = _3291 || _3293;
                if (!_3295)
                {
                    float _3297 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3299 = _2594 + _3297;
                    float _3301 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3303 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3301;
                    float _3305 = 1.0 / _3303;
                    float _3307 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3309 = _3307 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3311 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3313 = _3311 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3315 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3317 = _3315 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3319 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3321 = _3319 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3323 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3325 = _3323 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3327 = _3299 * _3305;
                    float _3329 = precise::clamp(_3327, 0.0, 1.0);
                    float _3331 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3333 = _3331 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3335 = fma(_3329, _3309, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3337 = fma(_3329, _3333, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3339 = fma(_3329, _3313, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3341 = fma(_3329, _3317, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3343 = fma(_3329, _3321, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3345 = fma(_3329, _3325, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3181 = _3337;
                    _3149 = _3343;
                    _3155 = _3335;
                    _3141 = _3341;
                    _3135 = _3339;
                    _3199 = _3345;
                    _3261 = true;
                }
                else
                {
                    _3181 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3149 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3155 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3141 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3135 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3199 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3261 = false;
    float _3347 = _3181;
    float _3349 = _3149;
    float _3351 = _3155;
    float _3353 = _3141;
    float _3355 = _3135;
    float _3357 = _3199;
    float _3359 = fma(_3093, -0.5, 0.5);
    float _3361 = precise::clamp(_3359, 0.0, 1.0);
    float _3363 = -_3347;
    float _3365 = _3363 + _3349;
    float _3367 = -_3351;
    float _3369 = _3367 + _3353;
    out.m_96.x = 0.0;
    float _3371 = fma(_3361, _3365, _3347);
    float _3373 = -_3355;
    float _3375 = _3373 + _3357;
    float _3377 = fma(_3361, _3369, _3351);
    float _3379 = _3371 * 0.586610972881317138671875;
    bool _3381 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3383 = fma(_3361, _3375, _3355);
    float _3385 = _3145 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3387 = fma(_3377, 0.298911988735198974609375, _3379);
    bool _3389 = _2572 > 0.0;
    bool _3391 = isnan(_2572);
    bool _3393 = _3389 || _3391;
    bool _3395 = isnan(0.0);
    bool _3397 = _3393 || _3395;
    float _3399 = fma(_3383, 0.114477999508380889892578125, _3387);
    out.m_53.x = _3385;
    float _3401 = -_3399;
    float _3403 = _3377 + _3401;
    float _3405 = -_3399;
    float _3407 = _3371 + _3405;
    float _3409 = -_3399;
    float _3411 = _3383 + _3409;
    float _3413 = fma(_3403, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3399);
    float _3415 = fma(_3407, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3399);
    float _3417 = fma(_3411, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3399);
    bool _3419 = !_3381;
    if (!_3419)
    {
        float _3421 = -_2512;
        float _3423 = _3421 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3425 = -_2514;
        float _3427 = _3425 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3429 = -_2516;
        float _3431 = _3429 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3433 = _3423 * _3423;
        float _3435 = fma(_3427, _3427, _3433);
        float _3437 = fma(_3431, _3431, _3435);
        float _3439 = sqrt(_3437);
        float _3441 = rsqrt(_3437);
        float _3443 = -_3439;
        float _3445 = _3443 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3447 = _3445 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3449 = precise::clamp(_3447, 0.0, 1.0);
        float _3451 = _3427 * _3441;
        float _3453 = _3423 * _3441;
        float _3455 = abs(_3449);
        float _3457 = log2(_3455);
        float _3459 = _3431 * _3441;
        float _3461 = _3451 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3463 = _3093 * _3453;
        float _3465 = -_3453;
        float _3467 = -_3461;
        float _3469 = fma(_3465, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3467);
        float _3471 = fma(_3109, _3451, _3463);
        float _3473 = -_3459;
        float _3475 = fma(_3473, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3469);
        float _3477 = fma(_3113, _3459, _3471);
        float _3479 = precise::clamp(_3477, 0.0, 1.0);
        float _3481 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3483 = _3475 + _3481;
        float _3485 = _3457 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3487 = _3483 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3489 = precise::clamp(_3487, 0.0, 1.0);
        float _3491 = exp2(_3485);
        float _3493 = _3491 * _3489;
        float _3495 = _3479 * _3493;
        float _3497 = _3495 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3499 = _3495 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3501 = _3495 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_96.x = _3497;
        out.m_96.y = _3499;
        out.m_96.z = _3501;
    }
    out.m_98.x = _3413;
    out.m_98.y = _3415;
    out.m_98.z = _3417;
    if (_3397)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _3503 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_53.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3503;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3261 = false;
    bool _409 = false;
    bool _215 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _112 = in.m_46.w;
    float _114 = in.m_48.w;
    float _116 = trunc(_112);
    int _119 = int(_116);
    float _121 = -_114;
    float _123 = _121 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_51.y = _123;
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
        out.m_53.x = 0.0;
    }
    int _137 = 0;
    if (!_127)
    {
        float _139 = _135 * 5.0;
        _137 = as_type<int>(_139);
    }
    int _141 = _137;
    int _143 = _141;
    if (!_127)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3571 = as_type<float>(_141);
        out.gl_Position.z = _3571;
    }
    if (!_127)
    {
        return out;
    }
    bool _145 = _114 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _147 = isnan(_114);
    bool _149 = _145 || _147;
    bool _151 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _153 = _149 || _151;
    float _155 = in.m_55.x;
    float _157 = float(_119);
    bool _159 = _123 >= _157;
    bool _161 = !_153;
    bool _163 = _159 || _161;
    float _165 = 1.0 / _157;
    if (_163)
    {
        _131 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _167 = _131;
    if (_163)
    {
        out.m_53.x = 0.0;
    }
    if (_163)
    {
        float _169 = _167 * 5.0;
        _143 = as_type<int>(_169);
    }
    int _171 = _143;
    float _173 = _123 * _165;
    out.m_57.x = _155;
    float _175 = _173;
    if (_163)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3636 = as_type<float>(_171);
        out.gl_Position.z = _3636;
    }
    out.m_51.x = _173;
    if (_163)
    {
        return out;
    }
    float _177 = as_type<float>(int(gl_VertexIndex));
    bool _179 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _181 = as_type<int>(_177) & 1;
    bool _183 = _181 != 0;
    int _185 = as_type<int>(_177) & 2;
    bool _187 = _185 != 0;
    bool _189 = !_183;
    float _191 = _189 ? (-0.5) : 0.5;
    bool _193 = !_187;
    float _195 = _193 ? (-0.5) : 0.5;
    bool _197 = !_179;
    float _213;
    if (!_197)
    {
        float _199 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _201 = _155 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _203 = fma(_201, (*spvDescriptorSet0.vp_c9)._m0[12].x, _123);
        float _205 = _203 * _199;
        float _207 = floor(_205);
        float _209 = -_207;
        float _211 = _205 + _209;
        _213 = _211;
        _215 = true;
    }
    else
    {
        _213 = _173;
    }
    _215 = false;
    float _217 = _213;
    float _219 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _221 = _217 + _219;
    float _223 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _225 = _217 + _223;
    float _227 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _229 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _227;
    float _231 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _233 = _231 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _235 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _237 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _235;
    bool _239 = _217 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _241 = isnan(_217);
    bool _243 = _239 || _241;
    bool _245 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _247 = _243 || _245;
    float _249 = float(_247);
    float _251 = 1.0 / _229;
    float _253 = -_249;
    float _255 = _253 + 1.0;
    bool _257 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _259 = 1.0 / _233;
    float _261 = 1.0 / _237;
    float _263 = _221 * _251;
    float _265 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _267 = _217 + _265;
    float _269 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _271 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _269;
    float _273 = fma(_271, _263, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _275 = _267 * _259;
    float _277 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _279 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _277;
    bool _281 = _217 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _283 = isnan(_217);
    bool _285 = _281 || _283;
    bool _287 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _289 = _285 || _287;
    float _291 = float(_289);
    float _293 = fma(_279, _263, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _295 = _291 * _255;
    float _297 = _225 * _261;
    bool _299 = _217 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _301 = isnan(_217);
    bool _303 = _299 || _301;
    bool _305 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _307 = _303 || _305;
    float _309 = float(_307);
    float _311 = -_291;
    float _313 = _311 + 1.0;
    bool _315 = _217 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _317 = isnan(_217);
    bool _319 = _315 || _317;
    bool _321 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _323 = _319 || _321;
    float _325 = float(_323);
    float _327 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _329 = _327 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _331 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _333 = _331 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _335 = -_309;
    float _337 = _335 + 1.0;
    float _339 = _309 * _313;
    float _341 = fma(_329, _275, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _343 = fma(_333, _275, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _345 = _325 * _337;
    float _347 = in.m_62.x;
    float _349 = in.m_62.y;
    float _351 = -_325;
    float _353 = _351 + 1.0;
    float _355 = _273 * _345;
    float _357 = _293 * _345;
    float _359 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _361 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _359;
    float _363 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _365 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _363;
    float _367 = fma(_353, (*spvDescriptorSet0.vp_c9)._m0[143].x, _355);
    float _369 = fma(_353, (*spvDescriptorSet0.vp_c9)._m0[143].y, _357);
    float _371 = fma(_361, _297, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _373 = fma(_365, _297, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _375 = fma(_343, _339, _367);
    float _377 = fma(_341, _339, _369);
    float _379 = fma(_371, _295, _375);
    float _381 = fma(_373, _295, _377);
    float _383 = fma(_249, (*spvDescriptorSet0.vp_c9)._m0[146].x, _379);
    float _385 = fma(_249, (*spvDescriptorSet0.vp_c9)._m0[146].y, _381);
    float _387 = _383 * _347;
    float _389 = _385 * _349;
    bool _391 = !_257;
    float _407;
    if (!_391)
    {
        float _393 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _395 = _155 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
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
        _407 = _173;
    }
    _409 = false;
    float _411 = _407;
    float _413 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _415 = _413 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _417 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _419 = _417 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _421 = _411 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _423 = isnan(_411);
    bool _425 = _421 || _423;
    bool _427 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _429 = _425 || _427;
    float _431 = float(_429);
    float _433 = 1.0 / _415;
    float _435 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _437 = _435 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _439 = _411 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _441 = isnan(_411);
    bool _443 = _439 || _441;
    bool _445 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _447 = _443 || _445;
    float _449 = float(_447);
    float _451 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _453 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _451;
    float _455 = -_431;
    float _457 = _455 + 1.0;
    bool _459 = _411 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _461 = isnan(_411);
    bool _463 = _459 || _461;
    bool _465 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _467 = _463 || _465;
    float _469 = float(_467);
    bool _471 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _473 = 1.0 / _419;
    float _475 = _449 * _457;
    float _477 = -_449;
    float _479 = _477 + 1.0;
    float _481 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _483 = _481 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _485 = _469 * _479;
    float _487 = -_469;
    float _489 = _487 + 1.0;
    float _491 = 1.0 / _437;
    float _493 = _453 * _433;
    float _495 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _497 = _411 + _495;
    float _499 = fma(_493, _497, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _501 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _503 = _411 + _501;
    float _505 = _483 * _473;
    bool _507 = _411 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _509 = isnan(_411);
    bool _511 = _507 || _509;
    bool _513 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _515 = _511 || _513;
    float _517 = float(_515);
    float _519 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _521 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _519;
    float _523 = _499 * _485;
    float _525 = fma(_505, _503, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _527 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _529 = _411 + _527;
    float _531 = -_517;
    float _533 = _531 + 1.0;
    float _535 = fma(_489, (*spvDescriptorSet0.vp_c9)._m0[115].x, _523);
    float _537 = _521 * _491;
    float _539 = _431 * _533;
    float _541 = fma(_525, _475, _535);
    float _543 = fma(_537, _529, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _545 = fma(_543, _539, _541);
    float _547 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _549 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _551 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _553 = fma(_517, (*spvDescriptorSet0.vp_c9)._m0[118].x, _545);
    float _555 = _547 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _557 = _549 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _559 = _551 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _561 = _553 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_64.x = _555;
    out.m_64.y = _557;
    out.m_64.z = _559;
    out.m_64.w = _561;
    bool _563 = !_471;
    if (!_563)
    {
        float _565 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _567 = _155 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _569 = fma(_567, (*spvDescriptorSet0.vp_c9)._m0[11].w, _123);
        float _571 = _569 * _565;
        float _573 = floor(_571);
        float _575 = -_573;
        float _577 = _571 + _575;
        _175 = _577;
    }
    float _579 = _175;
    float _581 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _583 = int(_581);
    float _585 = in.m_55.z;
    float _587 = _155 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _589 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _591 = _589 != 0;
    float _593 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _595 = int(_593);
    float _597 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _599 = float(_583);
    float _601 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _603 = int(_601);
    float _605 = float(_595);
    float _607 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _609 = int(_607);
    float _611 = 1.0 / _605;
    float _613 = float(uint(_603));
    int _615 = ~_603;
    int _617 = _615 + 1;
    float _619 = 1.0 / _599;
    float _621 = float(uint(_609));
    int _623 = ~_609;
    int _625 = _623 + 1;
    int _627 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _629 = _627 != 0;
    float _631 = _611 * _123;
    float _633 = 1.0 / _613;
    int _635 = ~_609;
    int _637 = _635 + 1;
    float _639 = _619 * _123;
    float _641 = trunc(_631);
    int _643 = int(_641);
    float _645 = 1.0 / _621;
    int _647 = as_type<int>(_633) + (-2);
    float _649 = trunc(_639);
    int _651 = int(_649);
    float _653 = float(uint(_643));
    float _655 = as_type<float>(_647) * _653;
    float _657 = _653;
    if (_629)
    {
        _657 = _155;
    }
    float _659 = _657;
    float _661 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _663 = log2(_661);
    int _665 = as_type<int>(_645) + (-2);
    float _667 = _645;
    float _669 = _659;
    if (_629)
    {
        _667 = 1.0;
    }
    float _671 = _667;
    float _673 = _671;
    if (!_629)
    {
        _673 = 5.839270114898681640625;
    }
    float _675 = _673;
    if (!_629)
    {
        _669 = _585;
    }
    float _677 = _669;
    float _679 = trunc(_655);
    float _681 = precise::max(_679, 0.0);
    uint _684 = uint(_681);
    float _686 = float(uint(_651));
    float _688 = _675 * _677;
    float _690 = as_type<float>(_665) * _686;
    float _692 = _686;
    if (_629)
    {
        _692 = 1.0;
    }
    float _694 = _692;
    float _696 = floor(_688);
    float _698 = _694;
    if (!_629)
    {
        _698 = 7.345489978790283203125;
    }
    float _700 = _698;
    int _702 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _704 = _702 != 0;
    float _706 = _700 * _155;
    float _708 = trunc(_690);
    float _710 = precise::max(_708, 0.0);
    uint _712 = uint(_710);
    int _714 = _617 * int(_684);
    int _716 = _714 + _643;
    float _718 = float(uint(_716));
    float _720 = floor(_706);
    float _722 = as_type<float>(_647) * _718;
    int _724 = _625 * int(_712);
    int _726 = _724 + _651;
    float _728 = trunc(_722);
    float _730 = precise::max(_728, 0.0);
    uint _732 = uint(_730);
    float _734 = float(uint(_726));
    float _736 = -_720;
    float _738 = _706 + _736;
    float _740 = _165 * _123;
    float _742 = as_type<float>(_665) * _734;
    float _744 = -_696;
    float _746 = _688 + _744;
    float _748 = float(_603);
    float _750 = trunc(_742);
    float _752 = precise::max(_750, 0.0);
    uint _754 = uint(_752);
    float _756 = float(_643);
    int _758 = int(_684) + int(_732);
    float _760 = _738 * _748;
    float _762 = float(_609);
    float _764 = _748 * _740;
    bool _766 = _756 >= _748;
    bool _768 = isnan(_756);
    bool _770 = _766 || _768;
    bool _772 = isnan(_748);
    bool _774 = _770 || _772;
    float _776 = float(_774);
    float _778 = _746 * _762;
    float _780 = trunc(_776);
    int _782 = int(_780);
    float _784 = float(_651);
    float _786 = _762 * _740;
    int _788 = int(_712) + int(_754);
    int _790 = ~_603;
    int _792 = _790 + 1;
    float _794 = trunc(_760);
    int _796 = int(_794);
    int _798 = ~_609;
    int _800 = _798 + 1;
    bool _802 = _784 >= _762;
    bool _804 = isnan(_784);
    bool _806 = _802 || _804;
    bool _808 = isnan(_762);
    bool _810 = _806 || _808;
    float _812 = float(_810);
    int _814 = _792 * _758;
    int _816 = _814 + _643;
    bool _818 = !_704;
    int _820 = _818 ? 0 : 1;
    int _822 = _800 * _788;
    int _824 = _822 + _651;
    float _826 = trunc(_778);
    int _828 = int(_826);
    bool _830 = uint(_816) >= uint(_603);
    bool _832 = uint(_824) >= uint(_609);
    bool _834 = !_830;
    int _836 = _834 ? 0 : (-1);
    int _838 = abs(_820);
    float _840 = trunc(_764);
    int _842 = int(_840);
    int _844 = ~_758;
    int _846 = _844 + _836;
    int _848 = _846 + 1;
    bool _850 = !_832;
    int _852 = _850 ? 0 : (-1);
    int _854 = _796 * _838;
    int _856 = _854 + _643;
    int _858 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _860 = _858 != 0;
    int _862 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _864 = _862 != 0;
    int _866 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _868 = _866 != 0;
    int _870 = _603 * _848;
    int _872 = _870 + _643;
    bool _874 = !_591;
    int _876 = _874 ? 0 : 1;
    float _878 = trunc(_812);
    int _880 = int(_878);
    bool _882 = _603 == 0;
    int _884 = abs(_876);
    int _886 = ~_788;
    int _888 = _886 + _852;
    int _890 = _888 + 1;
    bool _892 = !_882;
    int _894 = _892 ? _872 : (-1);
    int _896 = _828 * _884;
    int _898 = _896 + _651;
    int _900 = ~_782;
    int _902 = _900 + 1;
    int _904 = _902 + 1;
    int _906 = _609 * _890;
    int _908 = _906 + _651;
    bool _910 = _609 == 0;
    bool _912 = !_864;
    int _914 = _912 ? 0 : 1;
    int _916 = _894 * _904;
    int _918 = _603 + (-1);
    bool _920 = !_860;
    int _922 = _920 ? 0 : 1;
    bool _924 = !_868;
    int _926 = _924 ? 0 : 1;
    int _928 = _782 * _918;
    int _930 = _928 + _916;
    int _932 = ~_880;
    int _934 = _932 + 1;
    int _936 = _934 + 1;
    float _938 = trunc(_786);
    int _940 = int(_938);
    bool _942 = !_910;
    int _944 = _942 ? _908 : (-1);
    int _946 = abs(_914);
    int _948 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _950 = _948 != 0;
    int _952 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _954 = _952 != 0;
    int _956 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _958 = _956 != 0;
    int _960 = _944 * _936;
    int _962 = abs(_922);
    int _964 = _930 * _946;
    int _966 = _609 + (-1);
    bool _968 = !_954;
    int _970 = _968 ? 0 : 1;
    int _972 = _842 * _962;
    int _974 = _972 + _964;
    bool _976 = !_950;
    int _978 = _976 ? 0 : 1;
    int _980 = _880 * _966;
    int _982 = _980 + _960;
    int _984 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _986 = _984 != 0;
    int _988 = abs(_970);
    int _990 = abs(_978);
    int _992 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _994 = _992 != 0;
    int _996 = _982 * _988;
    bool _998 = !_958;
    int _1000 = _998 ? 0 : 1;
    bool _1002 = !_986;
    int _1004 = _1002 ? 0 : 1;
    int _1006 = abs(_926);
    bool _1008 = !_994;
    int _1010 = _1008 ? 0 : 1;
    int _1012 = abs(_1000);
    int _1014 = _940 * _990;
    int _1016 = _1014 + _996;
    int _1018 = abs(_1004);
    int _1020 = abs(_1010);
    int _1022 = _856 * _1006;
    int _1024 = _1022 + _974;
    int _1026 = _898 * _1012;
    int _1028 = _1026 + _1016;
    int _1030 = ~_609;
    int _1032 = _1030 + 1;
    int _1034 = _796 * _1018;
    int _1036 = _1034 + _1024;
    int _1038 = ~_603;
    int _1040 = _1038 + 1;
    int _1042 = _828 * _1020;
    int _1044 = _1042 + _1028;
    int _1046 = ~_609;
    int _1048 = _1046 + 1;
    float _1050 = float(uint(_1036));
    float _1052 = float(uint(_1044));
    int _1054 = ~_603;
    int _1056 = _1054 + 1;
    float _1058 = as_type<float>(_647) * _1050;
    float _1060 = float(uint(_898));
    float _1062 = as_type<float>(_665) * _1052;
    int _1064 = ~_603;
    int _1066 = _1064 + 1;
    float _1068 = trunc(_1058);
    float _1070 = precise::max(_1068, 0.0);
    uint _1072 = uint(_1070);
    float _1074 = trunc(_1062);
    float _1076 = precise::max(_1074, 0.0);
    uint _1078 = uint(_1076);
    float _1080 = float(uint(_856));
    int _1082 = _1066 * int(_1072);
    int _1084 = _1082 + _1036;
    float _1086 = as_type<float>(_647) * _1080;
    float _1088 = float(uint(_1084));
    float _1090 = trunc(_1086);
    float _1092 = precise::max(_1090, 0.0);
    uint _1094 = uint(_1092);
    int _1096 = _1032 * int(_1078);
    int _1098 = _1096 + _1044;
    float _1100 = as_type<float>(_647) * _1088;
    float _1102 = float(uint(_1098));
    float _1104 = trunc(_1100);
    float _1106 = precise::max(_1104, 0.0);
    uint _1108 = uint(_1106);
    float _1110 = as_type<float>(_665) * _1102;
    float _1112 = trunc(_1110);
    float _1114 = precise::max(_1112, 0.0);
    uint _1116 = uint(_1114);
    int _1118 = int(_1072) + int(_1108);
    int _1120 = ~_603;
    int _1122 = _1120 + 1;
    int _1124 = _1040 * _1118;
    int _1126 = _1124 + _1036;
    int _1128 = _1122 * int(_1094);
    int _1130 = _1128 + _856;
    int _1132 = int(_1078) + int(_1116);
    bool _1134 = uint(_1126) >= uint(_603);
    float _1136 = in.m_66.x;
    float _1138 = in.m_66.y;
    float _1140 = in.m_66.z;
    float _1142 = in.m_66.w;
    float _1144 = float(uint(_1130));
    int _1146 = _1048 * _1132;
    int _1148 = _1146 + _1044;
    bool _1150 = !_1134;
    int _1152 = _1150 ? 0 : (-1);
    float _1154 = as_type<float>(_647) * _1144;
    bool _1156 = uint(_1148) >= uint(_609);
    int _1158 = ~_1118;
    int _1160 = _1158 + _1152;
    int _1162 = _1160 + 1;
    bool _1164 = !_1156;
    int _1166 = _1164 ? 0 : (-1);
    float _1168 = trunc(_1154);
    float _1170 = precise::max(_1168, 0.0);
    uint _1172 = uint(_1170);
    int _1174 = _603 * _1162;
    int _1176 = _1174 + _1036;
    int _1178 = ~_1132;
    int _1180 = _1178 + _1166;
    int _1182 = _1180 + 1;
    bool _1184 = !_882;
    int _1186 = _1184 ? _1176 : (-1);
    int _1188 = _609 * _1182;
    int _1190 = _1188 + _1044;
    int _1192 = _1186 & 3;
    bool _1194 = _1192 != 0;
    bool _1196 = !_910;
    int _1198 = _1196 ? _1190 : (-1);
    int _1200 = _1186 & 3;
    bool _1202 = _1200 != 0;
    float _1204 = in.m_68.x;
    float _1206 = in.m_68.y;
    float _1208 = in.m_68.z;
    float _1210 = in.m_68.w;
    int _1212 = _1198 & 3;
    bool _1214 = _1212 != 0;
    bool _1216 = uint(_1192) > 1u;
    bool _1218 = uint(_1212) > 1u;
    int _1220 = _1202 ? 0 : 1;
    int _1222 = _1198 & 3;
    bool _1224 = _1222 != 0;
    int _1226 = ~_1220;
    int _1228 = _1226 + 1;
    int _1230 = _1228 + 1;
    int _1232 = _1224 ? 0 : 1;
    int _1234 = int(_1094) + int(_1172);
    int _1236 = ~_1232;
    int _1238 = _1236 + 1;
    int _1240 = _1238 + 1;
    float _1242 = in.m_70.x;
    float _1244 = in.m_70.y;
    float _1246 = in.m_70.z;
    float _1248 = in.m_70.w;
    int _1250 = _1230;
    int _1252 = _1240;
    if (!_1216)
    {
        int _1254 = ~_1220;
        int _1256 = _1254 + 1;
        _1250 = _1256;
    }
    int _1258 = _1250;
    int _1260 = _1056 * _1234;
    int _1262 = _1260 + _856;
    if (!_1218)
    {
        int _1264 = ~_1232;
        int _1266 = _1264 + 1;
        _1252 = _1266;
    }
    int _1268 = _1252;
    bool _1270 = _1192 != 3;
    float _1272 = in.m_46.x;
    float _1274 = in.m_46.y;
    float _1276 = in.m_46.z;
    bool _1278 = uint(_1192) >= 2u;
    bool _1280 = uint(_1212) >= 2u;
    int _1282 = _1278 ? 0 : 1;
    bool _1284 = _1212 != 3;
    int _1286 = ~_1282;
    int _1288 = _1286 + 1;
    int _1290 = _1288 + 1;
    int _1292 = _1280 ? 0 : 1;
    int _1294 = _1290;
    if (_1270)
    {
        int _1296 = ~_1282;
        int _1298 = _1296 + 1;
        _1294 = _1298;
    }
    int _1300 = _1294;
    bool _1302 = uint(_1262) >= uint(_603);
    float _1304 = in.m_55.y;
    int _1306 = ~_1292;
    int _1308 = _1306 + 1;
    int _1310 = _1308 + 1;
    int _1312 = _1310;
    if (_1284)
    {
        int _1314 = ~_1292;
        int _1316 = _1314 + 1;
        _1312 = _1316;
    }
    int _1318 = _1312;
    float _1320 = as_type<float>(_665) * _1060;
    int _1322 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1324 = _1322 != 0;
    int _1326 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1328 = _1326 != 0;
    float _1330 = _1274 * _1206;
    bool _1332 = !_1324;
    int _1334 = _1332 ? 0 : 1;
    float _1336 = trunc(_1320);
    float _1338 = precise::max(_1336, 0.0);
    uint _1340 = uint(_1338);
    bool _1342 = _155 > 0.5;
    float _1344 = _663 * _123;
    float _1346 = _1274 * _1244;
    float _1348 = _1274 * _1138;
    float _1350 = -_191;
    int _1352 = _1342 ? as_type<int>(_1350) : as_type<int>(_191);
    float _1354 = fma(_1272, _1204, _1330);
    bool _1356 = !_1302;
    int _1358 = _1356 ? 0 : (-1);
    float _1360 = exp2(_1344);
    bool _1362 = !_1328;
    float _1364 = _1362 ? _191 : as_type<float>(_1352);
    float _1366 = fma(_1276, _1208, _1354);
    float _1368 = _1304 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _1370 = _1304 > 0.5;
    int _1372 = _637 * int(_1340);
    int _1374 = _1372 + _898;
    int _1376 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _1378 = _1376 != 0;
    float _1380 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _1382 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1384 = _1382 != 0;
    float _1386 = _155 * 2.0;
    float _1388 = -_195;
    int _1390 = _1370 ? as_type<int>(_1388) : as_type<int>(_195);
    float _1392 = -_1380;
    float _1394 = fma(_587, 2.0, _1392);
    bool _1396 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1398 = isnan(1.0);
    bool _1400 = _1396 || _1398;
    bool _1402 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1404 = _1400 || _1402;
    float _1406 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1408 = 1.0 + _1406;
    float _1410 = float(uint(_1374));
    float _1412 = floor(_1386);
    float _1414 = fma(_1368, -2.0, _597);
    float _1416 = _1304 * 2.0;
    float _1418 = fma(_1272, _1242, _1346);
    float _1420 = as_type<float>(_665) * _1410;
    float _1422 = -_1360;
    float _1424 = _1422 + 1.0;
    float _1426 = 1.0 / _1408;
    bool _1428 = !_1384;
    float _1430 = _1428 ? _195 : as_type<float>(_1390);
    float _1432 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _1434 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1436 = isnan(0.0);
    bool _1438 = _1434 || _1436;
    bool _1440 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1442 = _1438 || _1440;
    float _1444 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1446 = -_123;
    float _1448 = fma(_1446, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1394);
    float _1450 = fma(_155, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1432);
    float _1452 = _1442 ? _1424 : 0.0;
    float _1454 = floor(_1416);
    float _1456 = fma(_1304, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1444);
    bool _1458 = _1412 >= 0.0;
    bool _1460 = isnan(_1412);
    bool _1462 = _1458 || _1460;
    bool _1464 = isnan(0.0);
    bool _1466 = _1462 || _1464;
    float _1468 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1450);
    float _1470 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1456);
    float _1472 = fma(_1276, _1246, _1418);
    float _1474 = trunc(_1420);
    float _1476 = precise::max(_1474, 0.0);
    uint _1478 = uint(_1476);
    float _1480 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1414);
    if (_1404)
    {
        float _1482 = _1452 * _1426;
        _133 = _1482;
    }
    float _1484 = _133;
    int _1486 = _1466 ? 0 : 1;
    float _1488 = fma(_1272, _1136, _1348);
    bool _1490 = _1412 > 0.0;
    float _1492 = _585 * 2.0;
    int _1494 = ~_609;
    int _1496 = _1494 + 1;
    float _1498 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1500 = _1498 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1502 = _1454 >= 0.0;
    bool _1504 = isnan(_1454);
    bool _1506 = _1502 || _1504;
    bool _1508 = isnan(0.0);
    bool _1510 = _1506 || _1508;
    float _1512 = _155 + _1304;
    float _1514 = fma(_1276, _1140, _1488);
    float _1516 = floor(_1492);
    int _1518 = _1510 ? 0 : 1;
    float _1520 = _1512 + (-1.0);
    bool _1522 = _1454 > 0.0;
    float _1524 = _1364 + 0.5;
    int _1526 = int(_1340) + int(_1478);
    float _1528 = fma(_1520, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1530 = 1.0 / _1500;
    int _1532 = ~_1486;
    int _1534 = _1532 + 1;
    int _1536 = _1534 + 1;
    float _1538 = _1514 + _1142;
    int _1540 = _1536;
    float _1542 = _1538;
    if (!_1490)
    {
        int _1544 = ~_1486;
        int _1546 = _1544 + 1;
        _1540 = _1546;
    }
    int _1548 = _1540;
    int _1550 = _1496 * _1526;
    int _1552 = _1550 + _898;
    int _1554 = ~_1518;
    int _1556 = _1554 + 1;
    int _1558 = _1556 + 1;
    float _1560 = _1430 + (-0.5);
    bool _1562 = !_1194;
    int _1564 = _1562 ? 0 : 1;
    float _1566 = -_1470;
    float _1568 = _1566 + 1.0;
    bool _1570 = uint(_1552) >= uint(_609);
    float _1572 = -_1468;
    float _1574 = _1572 + 1.0;
    int _1576 = _1558;
    if (!_1522)
    {
        int _1578 = ~_1518;
        int _1580 = _1578 + 1;
        _1576 = _1580;
    }
    int _1582 = _1576;
    bool _1584 = !_1570;
    int _1586 = _1584 ? 0 : (-1);
    int _1588 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1590 = _1588 != 0;
    int _1592 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1594 = _1592 != 0;
    int _1596 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1598 = _1596 != 0;
    float _1600 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1602 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1600;
    float _1604 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1606 = _579 + _1604;
    bool _1608 = _579 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1610 = isnan(_579);
    bool _1612 = _1608 || _1610;
    bool _1614 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1616 = _1612 || _1614;
    float _1618 = float(_1616);
    bool _1620 = !_1590;
    int _1622 = _1620 ? 0 : 1;
    float _1624 = _1602 * _1530;
    bool _1626 = _1516 >= 0.0;
    bool _1628 = isnan(_1516);
    bool _1630 = _1626 || _1628;
    bool _1632 = isnan(0.0);
    bool _1634 = _1630 || _1632;
    float _1636 = -_1618;
    float _1638 = _1636 + 1.0;
    bool _1640 = _579 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1642 = isnan(_579);
    bool _1644 = _1640 || _1642;
    bool _1646 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1648 = _1644 || _1646;
    float _1650 = float(_1648);
    float _1652 = _1472 + _1248;
    int _1654 = _1634 ? 0 : 1;
    bool _1656 = _1516 > 0.0;
    float _1658 = fma(_1624, _1606, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1660 = _1366 + _1210;
    float _1662 = fma(_1524, (*spvDescriptorSet0.vp_c9)._m0[80].x, _1448);
    float _1664 = _1650 * _1638;
    float _1666 = -_1560;
    float _1668 = -_1480;
    float _1670 = fma(_1666, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1668);
    float _1672 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1674 = _1660 + _1672;
    float _1676 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1678 = _1652 + _1676;
    float _1680 = _1658 * _1664;
    int _1682 = _1186 >> 31;
    float _1684 = _1674 * _1674;
    float _1686 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1688 = _1538 + _1686;
    int _1690 = _1198 >> 31;
    float _1692 = -_1650;
    float _1694 = _1692 + 1.0;
    float _1696 = fma(_1678, _1678, _1684);
    int _1698 = _1682 & 3;
    float _1700 = fma(_1430, _1568, _1670);
    int _1702 = _1690 & 3;
    float _1704 = fma(_1688, _1688, _1696);
    int _1706 = _1186 + _1698;
    float _1708 = fma(_1694, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1680);
    int _1710 = _1198 + _1702;
    float _1712 = rsqrt(_1704);
    float _1714 = _387 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _1716 = _1706 >> 2;
    float _1718 = -_1574;
    float _1720 = fma(_1364, _1718, _1662);
    int _1722 = _1710 >> 2;
    float _1724 = _1714 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    int _1726 = _1716 << 4;
    int _1728 = _1726 + 368;
    float _1730 = _1674 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _1732 = ~_1654;
    int _1734 = _1732 + 1;
    int _1736 = _1734 + 1;
    out.m_72.x = _1720;
    out.m_72.y = _1700;
    int _1738 = _1736;
    if (!_1656)
    {
        int _1740 = ~_1654;
        int _1742 = _1740 + 1;
        _1738 = _1742;
    }
    int _1744 = _1738;
    float _1746 = fma(_1618, (*spvDescriptorSet0.vp_c9)._m0[132].x, _1708);
    uint _1748 = uint(int(uint(_1728) >> uint(2)));
    uint _1750 = uint(int(uint(int(_1748)) >> uint(2)));
    int _1752 = int(_1748) & 3;
    float _1754 = (*spvDescriptorSet0.vp_c9)._m0[int(_1750)][_1752];
    int _1756 = int(_1748) + 1;
    uint _1758 = uint(int(uint(_1756) >> uint(2)));
    int _1760 = _1756 & 3;
    float _1762 = (*spvDescriptorSet0.vp_c9)._m0[int(_1758)][_1760];
    int _1764 = _1722 << 4;
    int _1766 = _1764 + 656;
    float _1768 = _1746 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1770 = _1724 * _1712;
    float _1772 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1774 = fma(_1678, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1730);
    float _1776 = _1674 * _1770;
    uint _1778 = uint(int(uint(_1766) >> uint(2)));
    uint _1780 = uint(int(uint(int(_1778)) >> uint(2)));
    int _1782 = int(_1778) & 3;
    float _1784 = (*spvDescriptorSet0.vp_c9)._m0[int(_1780)][_1782];
    int _1786 = int(_1778) + 1;
    uint _1788 = uint(int(uint(_1786) >> uint(2)));
    int _1790 = _1786 & 3;
    float _1792 = (*spvDescriptorSet0.vp_c9)._m0[int(_1788)][_1790];
    float _1794 = _1678 * _1770;
    float _1796 = -_1776;
    float _1798 = _1674 + _1796;
    float _1800 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1802 = -_1794;
    float _1804 = _1678 + _1802;
    float _1806 = _1772 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1808 = _1798 * _1798;
    float _1810 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    int _1812 = _1728 + 8;
    uint _1814 = uint(int(uint(_1812) >> uint(2)));
    uint _1816 = uint(int(uint(int(_1814)) >> uint(2)));
    int _1818 = int(_1814) & 3;
    float _1820 = (*spvDescriptorSet0.vp_c9)._m0[int(_1816)][_1818];
    int _1822 = int(_1814) + 1;
    uint _1824 = uint(int(uint(_1822) >> uint(2)));
    int _1826 = _1822 & 3;
    float _1828 = (*spvDescriptorSet0.vp_c9)._m0[int(_1824)][_1826];
    float _1830 = _1800 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1832 = fma(_1804, _1804, _1808);
    bool _1834 = !_1214;
    int _1836 = _1834 ? 0 : 1;
    float _1838 = _1810 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1840 = _1192 != 3;
    float _1842 = _1688 * _1770;
    int _1844 = abs(_1622);
    float _1846 = fma(_1688, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1774);
    int _1848 = _1766 + 8;
    uint _1850 = uint(int(uint(_1848) >> uint(2)));
    uint _1852 = uint(int(uint(int(_1850)) >> uint(2)));
    int _1854 = int(_1850) & 3;
    float _1856 = (*spvDescriptorSet0.vp_c9)._m0[int(_1852)][_1854];
    int _1858 = int(_1850) + 1;
    uint _1860 = uint(int(uint(_1858) >> uint(2)));
    int _1862 = _1858 & 3;
    float _1864 = (*spvDescriptorSet0.vp_c9)._m0[int(_1860)][_1862];
    out.m_74.x = _1830;
    out.m_74.y = _1838;
    out.m_74.z = _1806;
    out.m_74.w = _1768;
    int _1866 = ~_1234;
    int _1868 = _1866 + _1358;
    int _1870 = _1868 + 1;
    int _1872 = ~_1526;
    int _1874 = _1872 + _1586;
    int _1876 = _1874 + 1;
    int _1878 = abs(_1300);
    int _1880 = _603 * _1870;
    int _1882 = _1880 + _856;
    int _1884 = abs(_1268);
    int _1886 = _609 * _1876;
    int _1888 = _1886 + _898;
    int _1890 = abs(_1836);
    int _1892 = ~_1884;
    int _1894 = _1892 + 1;
    int _1896 = _1894 + 1;
    float _1898 = float(_1744);
    float _1900 = float(_1844);
    float _1902 = -_1842;
    float _1904 = _1688 + _1902;
    int _1906 = abs(_1564);
    bool _1908 = !_1840;
    int _1910 = _1908 ? 0 : (-1);
    float _1912 = _1900 * _1898;
    int _1914 = abs(_1258);
    float _1916 = fma(_1904, _1904, _1832);
    bool _1918 = _1212 != 3;
    int _1920 = ~_1914;
    int _1922 = _1920 + 1;
    int _1924 = _1922 + 1;
    int _1926 = _1896 * as_type<int>(_1792);
    int _1928 = ~_1906;
    int _1930 = _1928 + 1;
    int _1932 = _1930 + 1;
    float _1934 = sqrt(_1916);
    int _1936 = _1924 * as_type<int>(_1762);
    int _1938 = ~_1890;
    int _1940 = _1938 + 1;
    int _1942 = _1940 + 1;
    int _1944 = abs(_1318);
    int _1946 = _1932 * as_type<int>(_1754);
    int _1948 = _1946 + _1936;
    int _1950 = _1942 * as_type<int>(_1784);
    int _1952 = _1950 + _1926;
    bool _1954 = !_1918;
    int _1956 = _1954 ? 0 : (-1);
    int _1958 = ~_1878;
    int _1960 = _1958 + 1;
    int _1962 = _1960 + 1;
    int _1964 = abs(_1956);
    int _1966 = ~_1944;
    int _1968 = _1966 + 1;
    int _1970 = _1968 + 1;
    int _1972 = _1962 * as_type<int>(_1820);
    int _1974 = _1972 + _1948;
    int _1976 = abs(_1910);
    float _1978 = in.m_76.x;
    float _1980 = in.m_76.y;
    float _1982 = in.m_76.z;
    bool _1984 = !_1378;
    int _1986 = _1984 ? 0 : 1;
    int _1988 = _1970 * as_type<int>(_1856);
    int _1990 = _1988 + _1952;
    int _1992 = ~_1964;
    int _1994 = _1992 + 1;
    int _1996 = _1994 + 1;
    float _1998 = _1712 * _1934;
    int _2000 = abs(_1334);
    int _2002 = _1996 * as_type<int>(_1864);
    int _2004 = _2002 + _1990;
    int _2006 = abs(_1986);
    float _2008 = _1714 * _1998;
    bool _2010 = _1846 >= 0.0;
    int _2012 = ~_1976;
    int _2014 = _2012 + 1;
    int _2016 = _2014 + 1;
    out.m_78.x = _2008;
    int _2018 = ~_2000;
    int _2020 = _2018 + 1;
    int _2022 = _2020 + 1;
    int _2024 = _2016 * as_type<int>(_1828);
    int _2026 = _2024 + _1974;
    int _2028 = ~_2006;
    int _2030 = _2028 + 1;
    int _2032 = _2030 + 1;
    bool _2034 = !_882;
    int _2036 = _2034 ? _1882 : (-1);
    int _2038 = _2026 * _2022;
    bool _2040 = !_910;
    int _2042 = _2040 ? _1888 : (-1);
    int _2044 = _2004 * _2032;
    float _2046 = as_type<float>(_1974);
    if (_2010)
    {
        _2046 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2048 = _2046;
    float _2050 = _1912 * (-2.0);
    int _2052 = _2036 * _2000;
    int _2054 = _2052 + _2038;
    float _2056 = _155 + (-0.5);
    int _2058 = _2042 * _2006;
    int _2060 = _2058 + _2044;
    float _2062 = fma(_2050, _1978, _1978);
    int _2064 = as_type<int>(_2048);
    if (_2010)
    {
        float _2066 = _2048 * 5.0;
        _2064 = as_type<int>(_2066);
    }
    int _2068 = _2064;
    float _2070 = float(_2054);
    float _2072 = fma(_1528, _2050, _1528);
    float _2074 = float(_2060);
    float _2076 = fma(_2056, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2062);
    float _2078 = _1304 + _585;
    bool _2080 = !_1594;
    int _2082 = _2080 ? 0 : 1;
    if (_2010)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6384 = as_type<float>(_2068);
        out.gl_Position.z = _6384;
    }
    float _2084 = _2078 + (-1.0);
    float _2086 = float(_1548);
    out.m_80.x = _2070;
    int _2088 = abs(_2082);
    out.m_80.z = _2074;
    if (_2010)
    {
        out.m_53.x = 0.0;
    }
    bool _2090 = !_1598;
    int _2092 = _2090 ? 0 : 1;
    if (_2010)
    {
        return out;
    }
    float _2094 = -_1776;
    float _2096 = _1660 + _2094;
    int _2098 = abs(_2092);
    float _2100 = -_1794;
    float _2102 = _1652 + _2100;
    float _2104 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2106 = _2096 + _2104;
    float _2108 = -_1842;
    float _2110 = _1538 + _2108;
    float _2112 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2114 = _2102 + _2112;
    float _2116 = float(_2088);
    float _2118 = _2106 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2120 = float(_1582);
    float _2122 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2124 = _2110 + _2122;
    float _2126 = float(_2098);
    float _2128 = _2116 * _2086;
    float _2130 = fma(_2114, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2118);
    float _2132 = fma(_2084, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _2134 = _155 + _585;
    float _2136 = _2128 * (-2.0);
    float _2138 = fma(_2124, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2130);
    float _2140 = _2126 * _2120;
    float _2142 = _1304 + (-0.5);
    float _2144 = fma(_2136, _1980, _1980);
    float _2146 = fma(_2132, _2136, _2132);
    bool _2148 = _2138 >= 0.0;
    float _2150 = _2140 * (-2.0);
    float _2152 = _2134 + (-1.0);
    float _2154 = fma(_2142, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2144);
    float _2156 = fma(_2150, _1982, _1982);
    float _2158 = _585 + (-0.5);
    float _2160 = fma(_2152, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2162 = fma(_2072, _1484, _2076);
    float _2164 = fma(_2146, _1484, _2154);
    float _2166 = fma(_2158, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2156);
    float _2168 = fma(_2160, _2150, _2160);
    float _2170 = _2162 * 0.15915493667125701904296875;
    float _2172 = _2164 * 0.15915493667125701904296875;
    float _2174 = _2150;
    int _2176 = as_type<int>(_2156);
    float _2178 = _2102;
    if (_2148)
    {
        _2174 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2180 = _2174;
    float _2182 = fma(_2168, _1484, _2166);
    float _2184 = _2170 * 6.283185482025146484375;
    float _2186 = sin(_2184);
    if (_2148)
    {
        out.m_53.x = 0.0;
    }
    if (_2148)
    {
        float _2188 = _2180 * 5.0;
        _2176 = as_type<int>(_2188);
    }
    int _2190 = _2176;
    float _2192 = _2182 * 0.15915493667125701904296875;
    float _2194 = _2170 * 6.283185482025146484375;
    float _2196 = cos(_2194);
    if (_2148)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6577 = as_type<float>(_2190);
        out.gl_Position.z = _6577;
    }
    float _2198 = _2172 * 6.283185482025146484375;
    float _2200 = sin(_2198);
    float _2202 = _2172 * 6.283185482025146484375;
    float _2204 = cos(_2202);
    if (_2148)
    {
        return out;
    }
    float _2206 = _2192 * 6.283185482025146484375;
    float _2208 = cos(_2206);
    float _2210 = _389 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2212 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _195);
    float _2214 = _2186 * _2200;
    float _2216 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _191);
    float _2218 = _2210 * _1998;
    float _2220 = _2196 * _2200;
    float _2222 = _2192 * 6.283185482025146484375;
    float _2224 = sin(_2222);
    float _2226 = _2218 * _2212;
    float _2228 = _2196 * _2204;
    float _2230 = _2186 * _2204;
    float _2232 = _2008 * _2216;
    float _2234 = _1998 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2236 = _2234 * 0.5;
    bool _2238 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2240 = isnan(0.5);
    bool _2242 = _2238 || _2240;
    bool _2244 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2246 = _2242 || _2244;
    float _2248 = _2196 * _2208;
    float _2250 = _2204 * _2208;
    float _2252 = _2186 * _2208;
    float _2254 = _2200 * _2208;
    float _2256 = _2248 * _2226;
    bool _2258 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2260 = isnan(0.5);
    bool _2262 = _2258 || _2260;
    bool _2264 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2266 = _2262 || _2264;
    float _2268 = fma(_2224, _2228, _2214);
    float _2270 = -_2230;
    float _2272 = fma(_2224, _2220, _2270);
    float _2274 = -_2226;
    float _2276 = _2224 * _2274;
    float _2278 = -_2220;
    float _2280 = fma(_2224, _2230, _2278);
    float _2282 = fma(_2268, _2232, _2256);
    float _2284 = _2252 * _2226;
    float _2286 = fma(_2250, _2232, _2276);
    float _2288 = fma(_2224, _2214, _2228);
    float _2290 = fma(_2272, _2236, _2282);
    float _2292 = fma(_2280, _2232, _2284);
    float _2294 = fma(_2254, _2236, _2286);
    float _2296 = _2290 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2298 = fma(_2288, _2236, _2292);
    float _2300 = _2290 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2302 = _2096 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2304 = fma(_2294, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2296);
    float _2306 = fma(_2294, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2300);
    float _2308 = fma(_2102, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2302);
    float _2310 = fma(_2298, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2304);
    float _2312 = fma(_2298, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2306);
    float _2314 = fma(_2110, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2308);
    float _2316 = _2310 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2318 = _2096 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2320 = _2312 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2322 = _2314 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2324 = _1538 + _2316;
    float _2326 = fma(_2102, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2318);
    float _2328 = _1652 + _2320;
    float _2330 = 1.0 / _2322;
    float _2332 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2334 = _2324 + _2332;
    float _2336 = fma(_2110, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2326);
    float _2338 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2340 = _2328 + _2338;
    float _2342 = _2290 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2344 = _2334 * _2334;
    float _2346 = _2336 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2348 = fma(_2294, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2342);
    float _2350 = fma(_2340, _2340, _2344);
    float _2352 = _2346 + _2322;
    float _2354 = fma(_2298, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2348);
    float _2356 = sqrt(_2350);
    float _2358 = _2352 * _2330;
    float _2360 = _2358 * 0.5;
    float _2362 = _2354 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2364 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2366 = fma(_2360, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2364);
    float _2368 = _1660 + _2362;
    float _2370 = 1.0 / _2366;
    bool _2372 = _2356 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2374 = _2294;
    float _2376 = _2322;
    float _2378 = _2328;
    float _2380 = _2354;
    if (!_2372)
    {
        _2374 = _2324;
    }
    float _2382 = _2374;
    float _2384 = _2382;
    if (!_2372)
    {
        _2376 = _2368;
    }
    float _2386 = _2376;
    bool _2388 = !_2372;
    float _2390 = _2386;
    if (!_2388)
    {
        float _2392 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2394 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2396 = _2356 + _2394;
        float _2398 = rsqrt(_2350);
        float _2400 = _2396 * _2392;
        float _2402 = _2368 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2404 = _2400 * 0.15915493667125701904296875;
        float _2406 = _2404 * 6.283185482025146484375;
        float _2408 = cos(_2406);
        float _2410 = _2404 * 6.283185482025146484375;
        float _2412 = sin(_2410);
        float _2414 = _2408 + (-1.0);
        float _2416 = _2414 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2418 = fma(_2412, _2402, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2420 = fma(_2368, _2408, _2416);
        float _2422 = _2398 * _2418;
        float _2424 = fma(_2340, _2422, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2426 = fma(_2334, _2422, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2378 = _2424;
        _2390 = _2420;
        _2384 = _2426;
        _2380 = _2422;
    }
    float _2428 = _2378;
    float _2430 = _2390;
    float _2432 = _2384;
    float _2434 = _2380;
    float _2436 = -_1794;
    float _2438 = _2436 + _2428;
    float _2440 = -_1776;
    float _2442 = _2440 + _2430;
    float _2444 = -_1842;
    float _2446 = _2444 + _2432;
    float _2448 = _2434;
    float _2450 = _2442;
    float _2452 = _2438;
    float _2454 = _2446;
    float _2456 = _2430;
    float _2458 = _2432;
    if (_2266)
    {
        _2448 = 1.0;
    }
    float _2460 = _2448;
    float _2462 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2464 = _2370 * _2462;
    float _2466 = _2460;
    if (!_2246)
    {
        float _2468 = _2106 * _2106;
        float _2470 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2472 = -_1538;
        float _2474 = _2472 + _2432;
        float _2476 = -_1652;
        float _2478 = _2476 + _2428;
        float _2480 = fma(_2114, _2114, _2468);
        float _2482 = fma(_2124, _2124, _2480);
        float _2484 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2486 = sqrt(_2482);
        float _2488 = 1.0 / _1998;
        float _2490 = _2484 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2492 = precise::min(_2486, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2494 = _2492 * _2470;
        float _2496 = _2494 * _2488;
        float _2498 = -_1660;
        float _2500 = _2498 + _2430;
        float _2502 = _2490 * _2496;
        float _2504 = _2474 * _2496;
        float _2506 = fma(_2500, _2502, _2096);
        float _2508 = fma(_2478, _2502, _2102);
        float _2510 = fma(_2490, _2504, _2110);
        _2450 = _2506;
        _2452 = _2508;
        _2454 = _2510;
        _1542 = _2504;
    }
    float _2512 = _2450;
    float _2514 = _2452;
    float _2516 = _2454;
    float _2518 = _1542;
    float _2520 = _2518;
    if (!_2266)
    {
        float _2522 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2524 = _2522 * 0.15915493667125701904296875;
        float _2526 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2528 = _2524 * 6.283185482025146484375;
        float _2530 = cos(_2528);
        float _2532 = _2526 * 0.15915493667125701904296875;
        float _2534 = _2524 * 6.283185482025146484375;
        float _2536 = sin(_2534);
        float _2538 = 1.0 / _2530;
        float _2540 = _2532 * 6.283185482025146484375;
        float _2542 = cos(_2540);
        float _2544 = _2536 * _2538;
        float _2546 = _2532 * 6.283185482025146484375;
        float _2548 = sin(_2546);
        float _2550 = _2542 * _2544;
        float _2552 = 1.0 / _2550;
        float _2554 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2556 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2554;
        float _2558 = 1.0 / _2556;
        float _2560 = _2548 * _2552;
        float _2562 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2564 = fma(_2464, _2560, _2562);
        float _2566 = _2564 * _2558;
        float _2568 = precise::clamp(_2566, 0.0, 1.0);
        _2520 = _2532;
        _2466 = _2568;
    }
    float _2570 = _2520;
    float _2572 = _2466;
    float _2574 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2576 = _2512 + _2574;
    float _2578 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2580 = _2514 + _2578;
    float _2582 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2584 = _2516 + _2582;
    float _2586 = _2576 * _2576;
    float _2588 = fma(_2580, _2580, _2586);
    float _2590 = fma(_2584, _2584, _2588);
    float _2592 = rsqrt(_2590);
    float _2594 = sqrt(_2590);
    float _2596 = _2592 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2598 = _2580 * _2596;
    float _2600 = _2584 * _2596;
    float _2602 = _2598 * _2598;
    float _2604 = _2600 * _2600;
    float _2606 = _2602 + _2604;
    float _2608 = sqrt(_2606);
    bool _2610 = _2608 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2612 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2614 = _2608 + _2612;
    float _2616 = _2592;
    float _2618 = _2570;
    float _2620 = _2614;
    float _2622 = _2596;
    if (_2610)
    {
        float _2624 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2616 = _2624;
    }
    float _2626 = _2616;
    if (_2610)
    {
        float _2628 = rsqrt(_2606);
        _2618 = _2628;
    }
    float _2630 = _2618;
    float _2632 = _2630;
    if (_2610)
    {
        float _2634 = _2614 * _2626;
        _2620 = _2634;
    }
    float _2636 = _2620;
    if (_2610)
    {
        float _2638 = _2636 * 0.15915493667125701904296875;
        _2456 = _2638;
    }
    float _2640 = _2456;
    float _2642 = _2626;
    if (_2610)
    {
        float _2644 = _2640 * 6.283185482025146484375;
        float _2646 = sin(_2644);
        _2642 = _2646;
    }
    float _2648 = _2642;
    float _2650 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2652 = precise::max(0.0, _2650);
    float _2654 = _2584;
    float _2656 = _2652;
    if (_2610)
    {
        float _2658 = _2640 * 6.283185482025146484375;
        float _2660 = cos(_2658);
        _2654 = _2660;
    }
    float _2662 = _2654;
    float _2664 = -_2596;
    float _2666 = -_2652;
    float _2668 = fma(_2576, _2664, _2666);
    float _2670 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_2610)
    {
        float _2672 = _2668 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2656 = _2672;
    }
    float _2674 = _2656;
    float _2676 = _2648;
    if (_2610)
    {
        float _2678 = fma(_2648, _2674, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2458 = _2678;
    }
    float _2680 = _2458;
    float _2682 = fma(_2102, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2684 = _2680;
    if (!_2610)
    {
        _2178 = _2600;
    }
    float _2686 = _2178;
    float _2688 = _2686;
    float _2690 = _2662;
    if (_2610)
    {
        float _2692 = _2662 + (-1.0);
        _2670 = _2692;
    }
    float _2694 = _2670;
    float _2696 = _2694;
    if (_2610)
    {
        float _2698 = _2630 * _2680;
        _2622 = _2698;
    }
    float _2700 = _2622;
    if (!_2610)
    {
        _2632 = _2598;
    }
    float _2702 = _2632;
    float _2704 = _2702;
    if (_2610)
    {
        float _2706 = _2694 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2696 = _2706;
    }
    float _2708 = _2696;
    if (_2610)
    {
        float _2710 = _2598 * _2700;
        _2704 = _2710;
    }
    float _2712 = _2704;
    if (!_2610)
    {
        _2684 = _2668;
    }
    float _2714 = _2684;
    float _2716 = _2714;
    if (_2610)
    {
        float _2718 = _2600 * _2700;
        _2688 = _2718;
    }
    float _2720 = _2688;
    if (!_2610)
    {
        _2676 = _2602;
    }
    float _2722 = _2676;
    float _2724 = _2722;
    if (_2610)
    {
        float _2726 = fma(_2668, _2662, _2708);
        _2716 = _2726;
    }
    float _2728 = _2716;
    if (_2610)
    {
        float _2730 = _2712 * _2712;
        _2724 = _2730;
    }
    float _2732 = _2724;
    if (!_2610)
    {
        _2690 = _2604;
    }
    float _2734 = _2690;
    float _2736 = _2734;
    if (_2610)
    {
        float _2738 = _2720 * _2720;
        _2736 = _2738;
    }
    float _2740 = _2736;
    float _2742 = fma(_2728, _2728, _2732);
    float _2744 = _2512 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2746 = _2512 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2748 = _2742 + _2740;
    float _2750 = fma(_2514, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2744);
    float _2752 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2754 = fma(_2594, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2752);
    float _2756 = precise::clamp(_2754, 0.0, 1.0);
    float _2758 = rsqrt(_2748);
    float _2760 = fma(_2516, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2750);
    float _2762 = -_2756;
    float _2764 = _2762 + 1.0;
    float _2766 = fma(_2110, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2768 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2770 = _2760 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2772 = _2512 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2774 = fma(_2514, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2746);
    float _2776 = abs(_2764);
    float _2778 = log2(_2776);
    float _2780 = _2770 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2782 = -_2780;
    float _2784 = fma(_2782, _2768, 1.0);
    float _2786 = _2512 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2788 = _2758 * _2712;
    float _2790 = _2758 * _2728;
    float _2792 = fma(_2514, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2786);
    float _2794 = _2758 * _2720;
    float _2796 = fma(_2514, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2772);
    float _2798 = _2788 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2800 = fma(_2516, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2792);
    float _2802 = floor(_2682);
    float _2804 = fma(_2516, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2796);
    float _2806 = -_2798;
    float _2808 = fma(_2790, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2806);
    float _2810 = _2800 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2812 = _2778 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2814 = _2804 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2816 = fma(_2516, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2774);
    float _2818 = _2810 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2820 = floor(_2766);
    float _2822 = -_2794;
    float _2824 = fma(_2822, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2808);
    float _2826 = _2816 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2828 = fma(_2814, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2818);
    float _2830 = _2810 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2832 = fma(_2824, -0.5, 0.5);
    float _2834 = fma(_2770, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2828);
    float _2836 = exp2(_2812);
    float _2838 = fma(_2824, 0.5, 0.5);
    float _2840 = fma(_2826, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2834);
    float _2842 = log2(_2784);
    float _2844 = -_2820;
    float _2846 = _2766 + _2844;
    float _2848 = fma(_2814, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2830);
    float _2850 = fma(_2838, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2852 = fma(_2770, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2848);
    float _2854 = fma(_2838, _2850, -0.212114393711090087890625);
    float _2856 = 1.0 / _2840;
    float _2858 = -_2802;
    float _2860 = _2682 + _2858;
    float _2862 = _2810 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2864 = fma(_2838, _2854, 1.570728778839111328125);
    float _2866 = fma(_2814, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2862);
    float _2868 = _2790 + 1.0;
    float _2870 = sqrt(_2832);
    float _2872 = _2842 * 0.693147182464599609375;
    float _2874 = fma(_2770, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2866);
    float _2876 = -_2790;
    float _2878 = fma(_2836, _2868, _2876);
    float2 _7670 = float2(_2860, _2846);
    float _2880 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_7670, float2(0.0), isnan(_7670)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_7670, float2(0.0), isnan(_7670)), level(0.0)).x;
    float _2882 = _2872 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2884 = fma(_2826, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2874);
    float _2886 = fma(_2826, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2852);
    float _2888 = _2884 * _2856;
    float _2890 = _2886 * _2856;
    float _2892 = fma(_2888, 0.5, 0.5);
    float _2894 = fma(_2890, -0.5, 0.5);
    float _2896 = _2870 * 0.636619746685028076171875;
    float _2898 = -_2864;
    float _2900 = fma(_2896, _2898, 1.0);
    float _2902 = fma(_2878, 0.5, 0.5);
    float3 _7715 = float3(_2892, _2894, _2882);
    float _2904 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7715, float3(0.0), isnan(_7715)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7715, float3(0.0), isnan(_7715)), level(0.0)).x;
    float3 _7726 = float3(_2892, _2894, _2882);
    float4 _2907 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7726, float3(0.0), isnan(_7726)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7726, float3(0.0), isnan(_7726)), level(0.0)).xyzw;
    float _2909 = _2907.x;
    float _2911 = _2907.y;
    float _2913 = _2907.z;
    float _2915 = _2907.w;
    float2 _7742 = float2(_2900, _2902);
    float3 _2919 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7742, float2(0.0), isnan(_7742)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7742, float2(0.0), isnan(_7742)), level(0.0)).xyz;
    float _2921 = _2919.x;
    float _2923 = _2919.y;
    float _2925 = _2919.z;
    float _2927 = abs(_2464);
    float _2929 = log2(_2927);
    float _2931 = _2268 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2933 = _2268 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2935 = _2268 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2937 = _2248 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2939 = fma(_2250, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2931);
    float _2941 = fma(_2250, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2933);
    float _2943 = fma(_2250, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2935);
    float _2945 = _2248 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2947 = _2248 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2949 = _195 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2951 = -_2224;
    float _2953 = fma(_2951, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2937);
    float _2955 = -_2224;
    float _2957 = fma(_2955, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2945);
    float _2959 = -_2224;
    float _2961 = fma(_2959, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2947);
    bool _2963 = _2594 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2965 = isnan(_2594);
    bool _2967 = _2963 || _2965;
    bool _2969 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2971 = _2967 || _2969;
    float _2973 = _2929 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2975 = fma(_2949, _2949, 1.0);
    float _2977 = _2272 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2979 = _2272 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2981 = _2272 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2983 = fma(_2252, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2961);
    float _2985 = exp2(_2973);
    float _2987 = fma(_2254, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2977);
    float _2989 = fma(_2254, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2979);
    float _2991 = fma(_2254, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2981);
    float _2993 = fma(_2252, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2957);
    float _2995 = fma(_2252, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2953);
    float _2997 = rsqrt(_2975);
    float _2999 = fma(_2280, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2939);
    float _3001 = _191 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3003 = fma(_2288, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2987);
    float _3005 = fma(_2288, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2989);
    float _3007 = fma(_2288, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2991);
    float _3009 = _2949 * _2995;
    float _3011 = fma(_2985, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3013 = precise::clamp(_3011, 0.0, 1.0);
    float _3015 = fma(_2280, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2941);
    float _3017 = fma(_2280, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2943);
    float _3019 = fma(_3013, -2.0, 3.0);
    float _3021 = _3013 * _3013;
    float _3023 = _2949 * _2993;
    out.m_82.x = _2999;
    out.m_82.y = _3015;
    out.m_82.z = _3017;
    float _3025 = _3021 * _3019;
    float _3027 = fma(_3001, _2999, _3023);
    float _3029 = _2949 * _2997;
    float _3031 = _2810 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3033 = fma(_3001, _3015, _3009);
    float _3035 = -_3025;
    float _3037 = _3035 + 1.0;
    float _3039 = -_3003;
    float _3041 = _3029 * _3039;
    float _3043 = fma(_2814, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3031);
    float _3045 = -_3005;
    float _3047 = _3029 * _3045;
    float _3049 = fma(_3037, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3025);
    float _3051 = _2949 * _2983;
    float _3053 = _2778 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3055 = -_3007;
    float _3057 = _3029 * _3055;
    float _3059 = fma(_2997, _2995, _3047);
    float _3061 = fma(_2770, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3043);
    float _3063 = in.m_84.x;
    float _3065 = fma(_2997, _2983, _3057);
    float _3067 = exp2(_3053);
    bool _3069 = _2464 <= 8000.0;
    bool _3071 = isnan(_2464);
    bool _3073 = _3069 || _3071;
    bool _3075 = isnan(8000.0);
    bool _3077 = _3073 || _3075;
    float _3079 = float(_3077);
    float _3081 = fma(_2997, _2993, _3041);
    float _3083 = fma(_2826, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3061);
    float _3085 = _2884 + _2840;
    float _3087 = _2840 * 0.5;
    float _3089 = _3079 * _3049;
    float _3091 = _3083 + _2840;
    float _3093 = _3005 + _3033;
    float _3095 = _3089 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3097 = _3091 * 0.5;
    float _3099 = _3085 * 0.5;
    float _3101 = fma(_2886, -0.5, _3087);
    out.gl_Position.x = _2884;
    out.gl_Position.y = _2886;
    out.gl_Position.z = _3083;
    out.gl_Position.w = _2840;
    float _3103 = -_3067;
    float _3105 = _3103 + 1.0;
    float _3107 = fma(_3001, _3017, _3051);
    float _3109 = _3003 + _3027;
    out.m_86.x = _3099;
    out.m_86.y = _3101;
    out.m_86.z = _3097;
    out.m_86.w = _2840;
    float _3111 = _3105 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3113 = _3007 + _3107;
    out.m_88.x = _3081;
    out.m_88.y = _3059;
    out.m_88.z = _3065;
    out.m_90.x = _3109;
    out.m_90.y = _3093;
    out.m_90.z = _3113;
    float _3115 = -_3111;
    float _3117 = _3115 + 1.0;
    float _3119 = _2840;
    float _3121 = _3083;
    float _3123 = _2886;
    float _3125 = _3059;
    float _3127 = _3081;
    float _3129 = _3117;
    if (!_2971)
    {
        _3119 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3131 = _3119;
    float _3133 = _3131;
    float _3135 = _3131;
    if (!_2971)
    {
        _3121 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3137 = _3121;
    float _3139 = _3137;
    float _3141 = _3137;
    if (!_2971)
    {
        _3123 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3143 = _3123;
    float _3145 = _2572 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3147 = _3143;
    float _3149 = _3143;
    if (!_2971)
    {
        _3125 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3151 = _3125;
    float _3153 = _3151;
    float _3155 = _3151;
    if (!_2971)
    {
        _3127 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3157 = _3127;
    float _3159 = -_2880;
    float _3161 = _3159 + 1.0;
    float _3163 = _3161 * _3095;
    float _3165 = precise::clamp(_3163, 0.0, 1.0);
    float _3167 = -_3165;
    float _3169 = fma(_3167, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3171 = _3169 * _3063;
    float _3173 = _3171 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3175 = _3111 * _2904;
    float _3177 = _2915 * _3117;
    float _3179 = _3157;
    float _3181 = _3157;
    if (!_2971)
    {
        _3129 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3183 = _3129;
    out.m_92.x = _3173;
    float _3185 = _2915 * _3175;
    float _3187 = _2925 * _3175;
    float _3189 = fma(_2921, _3185, _2909);
    float _3191 = fma(_2923, _3185, _2911);
    float _3193 = fma(_2915, _3187, _2913);
    out.m_94.x = _3189;
    out.m_94.y = _3191;
    out.m_94.z = _3193;
    out.m_94.w = _3177;
    bool _3195 = !_2971;
    float _3197 = _3183;
    float _3199 = _3183;
    if (!_3195)
    {
        bool _3201 = _2594 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3203 = isnan(_2594);
        bool _3205 = _3201 || _3203;
        bool _3207 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3209 = _3205 || _3207;
        if (!_3209)
        {
            float _3211 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3213 = _2594 + _3211;
            float _3215 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3217 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3215;
            float _3219 = 1.0 / _3217;
            float _3221 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3223 = _3221 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3225 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3227 = _3225 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3229 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3231 = _3229 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3233 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3235 = _3233 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3237 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3239 = _3237 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3241 = _3213 * _3219;
            float _3243 = precise::clamp(_3241, 0.0, 1.0);
            float _3245 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3247 = _3245 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3249 = fma(_3243, _3223, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3251 = fma(_3243, _3247, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3253 = fma(_3243, _3227, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3255 = fma(_3243, _3231, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3257 = fma(_3243, _3235, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3259 = fma(_3243, _3239, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3181 = _3251;
            _3149 = _3257;
            _3155 = _3249;
            _3141 = _3255;
            _3135 = _3253;
            _3199 = _3259;
            _3261 = true;
        }
        else
        {
            bool _3263 = _2594 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3265 = isnan(_2594);
            bool _3267 = _3263 || _3265;
            bool _3269 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3271 = _3267 || _3269;
            if (!_3271)
            {
                _3153 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3273 = _3153;
            _3155 = _3273;
            if (!_3271)
            {
                _3179 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3275 = _3179;
            _3181 = _3275;
            if (!_3271)
            {
                _3133 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3277 = _3133;
            _3135 = _3277;
            if (!_3271)
            {
                _3139 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3279 = _3139;
            _3141 = _3279;
            if (!_3271)
            {
                _3147 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3281 = _3147;
            _3149 = _3281;
            if (!_3271)
            {
                _3197 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3283 = _3197;
            bool _3285 = !_3271;
            _3199 = _3283;
            if (!_3285)
            {
                bool _3287 = _2594 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3289 = isnan(_2594);
                bool _3291 = _3287 || _3289;
                bool _3293 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3295 = _3291 || _3293;
                if (!_3295)
                {
                    float _3297 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3299 = _2594 + _3297;
                    float _3301 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3303 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3301;
                    float _3305 = 1.0 / _3303;
                    float _3307 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3309 = _3307 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3311 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3313 = _3311 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3315 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3317 = _3315 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3319 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3321 = _3319 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3323 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3325 = _3323 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3327 = _3299 * _3305;
                    float _3329 = precise::clamp(_3327, 0.0, 1.0);
                    float _3331 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3333 = _3331 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3335 = fma(_3329, _3309, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3337 = fma(_3329, _3333, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3339 = fma(_3329, _3313, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3341 = fma(_3329, _3317, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3343 = fma(_3329, _3321, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3345 = fma(_3329, _3325, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3181 = _3337;
                    _3149 = _3343;
                    _3155 = _3335;
                    _3141 = _3341;
                    _3135 = _3339;
                    _3199 = _3345;
                    _3261 = true;
                }
                else
                {
                    _3181 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3149 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3155 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3141 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3135 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3199 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3261 = false;
    float _3347 = _3181;
    float _3349 = _3149;
    float _3351 = _3155;
    float _3353 = _3141;
    float _3355 = _3135;
    float _3357 = _3199;
    float _3359 = fma(_3093, -0.5, 0.5);
    float _3361 = precise::clamp(_3359, 0.0, 1.0);
    float _3363 = -_3347;
    float _3365 = _3363 + _3349;
    float _3367 = -_3351;
    float _3369 = _3367 + _3353;
    out.m_96.x = 0.0;
    float _3371 = fma(_3361, _3365, _3347);
    float _3373 = -_3355;
    float _3375 = _3373 + _3357;
    float _3377 = fma(_3361, _3369, _3351);
    float _3379 = _3371 * 0.586610972881317138671875;
    bool _3381 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3383 = fma(_3361, _3375, _3355);
    float _3385 = _3145 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3387 = fma(_3377, 0.298911988735198974609375, _3379);
    bool _3389 = _2572 > 0.0;
    bool _3391 = isnan(_2572);
    bool _3393 = _3389 || _3391;
    bool _3395 = isnan(0.0);
    bool _3397 = _3393 || _3395;
    float _3399 = fma(_3383, 0.114477999508380889892578125, _3387);
    out.m_53.x = _3385;
    float _3401 = -_3399;
    float _3403 = _3377 + _3401;
    float _3405 = -_3399;
    float _3407 = _3371 + _3405;
    float _3409 = -_3399;
    float _3411 = _3383 + _3409;
    float _3413 = fma(_3403, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3399);
    float _3415 = fma(_3407, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3399);
    float _3417 = fma(_3411, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3399);
    bool _3419 = !_3381;
    if (!_3419)
    {
        float _3421 = -_2512;
        float _3423 = _3421 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3425 = -_2514;
        float _3427 = _3425 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3429 = -_2516;
        float _3431 = _3429 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3433 = _3423 * _3423;
        float _3435 = fma(_3427, _3427, _3433);
        float _3437 = fma(_3431, _3431, _3435);
        float _3439 = sqrt(_3437);
        float _3441 = rsqrt(_3437);
        float _3443 = -_3439;
        float _3445 = _3443 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3447 = _3445 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3449 = precise::clamp(_3447, 0.0, 1.0);
        float _3451 = _3427 * _3441;
        float _3453 = _3423 * _3441;
        float _3455 = abs(_3449);
        float _3457 = log2(_3455);
        float _3459 = _3431 * _3441;
        float _3461 = _3451 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3463 = _3093 * _3453;
        float _3465 = -_3453;
        float _3467 = -_3461;
        float _3469 = fma(_3465, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3467);
        float _3471 = fma(_3109, _3451, _3463);
        float _3473 = -_3459;
        float _3475 = fma(_3473, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3469);
        float _3477 = fma(_3113, _3459, _3471);
        float _3479 = precise::clamp(_3477, 0.0, 1.0);
        float _3481 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3483 = _3475 + _3481;
        float _3485 = _3457 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3487 = _3483 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3489 = precise::clamp(_3487, 0.0, 1.0);
        float _3491 = exp2(_3485);
        float _3493 = _3491 * _3489;
        float _3495 = _3479 * _3493;
        float _3497 = _3495 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3499 = _3495 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3501 = _3495 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_96.x = _3497;
        out.m_96.y = _3499;
        out.m_96.z = _3501;
    }
    out.m_98.x = _3413;
    out.m_98.y = _3415;
    out.m_98.z = _3417;
    if (_3397)
    {
        return out;
    }
    float _3503 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_53.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3503;
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
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3261 = false;
    bool _409 = false;
    bool _215 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _112 = in.m_46.w;
    float _114 = in.m_48.w;
    float _116 = trunc(_112);
    int _119 = int(_116);
    float _121 = -_114;
    float _123 = _121 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_51.y = _123;
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
        out.m_53.x = 0.0;
    }
    int _137 = 0;
    if (!_127)
    {
        float _139 = _135 * 5.0;
        _137 = as_type<int>(_139);
    }
    int _141 = _137;
    int _143 = _141;
    if (!_127)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3571 = as_type<float>(_141);
        out.gl_Position.z = _3571;
    }
    if (!_127)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _145 = _114 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _147 = isnan(_114);
    bool _149 = _145 || _147;
    bool _151 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _153 = _149 || _151;
    float _155 = in.m_55.x;
    float _157 = float(_119);
    bool _159 = _123 >= _157;
    bool _161 = !_153;
    bool _163 = _159 || _161;
    float _165 = 1.0 / _157;
    if (_163)
    {
        _131 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _167 = _131;
    if (_163)
    {
        out.m_53.x = 0.0;
    }
    if (_163)
    {
        float _169 = _167 * 5.0;
        _143 = as_type<int>(_169);
    }
    int _171 = _143;
    float _173 = _123 * _165;
    out.m_57.x = _155;
    float _175 = _173;
    if (_163)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3636 = as_type<float>(_171);
        out.gl_Position.z = _3636;
    }
    out.m_51.x = _173;
    if (_163)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _177 = as_type<float>(int(gl_VertexIndex));
    bool _179 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _181 = as_type<int>(_177) & 1;
    bool _183 = _181 != 0;
    int _185 = as_type<int>(_177) & 2;
    bool _187 = _185 != 0;
    bool _189 = !_183;
    float _191 = _189 ? (-0.5) : 0.5;
    bool _193 = !_187;
    float _195 = _193 ? (-0.5) : 0.5;
    bool _197 = !_179;
    float _213;
    if (!_197)
    {
        float _199 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _201 = _155 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _203 = fma(_201, (*spvDescriptorSet0.vp_c9)._m0[12].x, _123);
        float _205 = _203 * _199;
        float _207 = floor(_205);
        float _209 = -_207;
        float _211 = _205 + _209;
        _213 = _211;
        _215 = true;
    }
    else
    {
        _213 = _173;
    }
    _215 = false;
    float _217 = _213;
    float _219 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _221 = _217 + _219;
    float _223 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _225 = _217 + _223;
    float _227 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _229 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _227;
    float _231 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _233 = _231 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _235 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _237 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _235;
    bool _239 = _217 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _241 = isnan(_217);
    bool _243 = _239 || _241;
    bool _245 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _247 = _243 || _245;
    float _249 = float(_247);
    float _251 = 1.0 / _229;
    float _253 = -_249;
    float _255 = _253 + 1.0;
    bool _257 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _259 = 1.0 / _233;
    float _261 = 1.0 / _237;
    float _263 = _221 * _251;
    float _265 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _267 = _217 + _265;
    float _269 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _271 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _269;
    float _273 = fma(_271, _263, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _275 = _267 * _259;
    float _277 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _279 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _277;
    bool _281 = _217 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _283 = isnan(_217);
    bool _285 = _281 || _283;
    bool _287 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _289 = _285 || _287;
    float _291 = float(_289);
    float _293 = fma(_279, _263, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _295 = _291 * _255;
    float _297 = _225 * _261;
    bool _299 = _217 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _301 = isnan(_217);
    bool _303 = _299 || _301;
    bool _305 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _307 = _303 || _305;
    float _309 = float(_307);
    float _311 = -_291;
    float _313 = _311 + 1.0;
    bool _315 = _217 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _317 = isnan(_217);
    bool _319 = _315 || _317;
    bool _321 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _323 = _319 || _321;
    float _325 = float(_323);
    float _327 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _329 = _327 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _331 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _333 = _331 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _335 = -_309;
    float _337 = _335 + 1.0;
    float _339 = _309 * _313;
    float _341 = fma(_329, _275, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _343 = fma(_333, _275, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _345 = _325 * _337;
    float _347 = in.m_62.x;
    float _349 = in.m_62.y;
    float _351 = -_325;
    float _353 = _351 + 1.0;
    float _355 = _273 * _345;
    float _357 = _293 * _345;
    float _359 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _361 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _359;
    float _363 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _365 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _363;
    float _367 = fma(_353, (*spvDescriptorSet0.vp_c9)._m0[143].x, _355);
    float _369 = fma(_353, (*spvDescriptorSet0.vp_c9)._m0[143].y, _357);
    float _371 = fma(_361, _297, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _373 = fma(_365, _297, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _375 = fma(_343, _339, _367);
    float _377 = fma(_341, _339, _369);
    float _379 = fma(_371, _295, _375);
    float _381 = fma(_373, _295, _377);
    float _383 = fma(_249, (*spvDescriptorSet0.vp_c9)._m0[146].x, _379);
    float _385 = fma(_249, (*spvDescriptorSet0.vp_c9)._m0[146].y, _381);
    float _387 = _383 * _347;
    float _389 = _385 * _349;
    bool _391 = !_257;
    float _407;
    if (!_391)
    {
        float _393 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _395 = _155 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
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
        _407 = _173;
    }
    _409 = false;
    float _411 = _407;
    float _413 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _415 = _413 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _417 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _419 = _417 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _421 = _411 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _423 = isnan(_411);
    bool _425 = _421 || _423;
    bool _427 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _429 = _425 || _427;
    float _431 = float(_429);
    float _433 = 1.0 / _415;
    float _435 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _437 = _435 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _439 = _411 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _441 = isnan(_411);
    bool _443 = _439 || _441;
    bool _445 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _447 = _443 || _445;
    float _449 = float(_447);
    float _451 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _453 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _451;
    float _455 = -_431;
    float _457 = _455 + 1.0;
    bool _459 = _411 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _461 = isnan(_411);
    bool _463 = _459 || _461;
    bool _465 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _467 = _463 || _465;
    float _469 = float(_467);
    bool _471 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _473 = 1.0 / _419;
    float _475 = _449 * _457;
    float _477 = -_449;
    float _479 = _477 + 1.0;
    float _481 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _483 = _481 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _485 = _469 * _479;
    float _487 = -_469;
    float _489 = _487 + 1.0;
    float _491 = 1.0 / _437;
    float _493 = _453 * _433;
    float _495 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _497 = _411 + _495;
    float _499 = fma(_493, _497, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _501 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _503 = _411 + _501;
    float _505 = _483 * _473;
    bool _507 = _411 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _509 = isnan(_411);
    bool _511 = _507 || _509;
    bool _513 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _515 = _511 || _513;
    float _517 = float(_515);
    float _519 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _521 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _519;
    float _523 = _499 * _485;
    float _525 = fma(_505, _503, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _527 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _529 = _411 + _527;
    float _531 = -_517;
    float _533 = _531 + 1.0;
    float _535 = fma(_489, (*spvDescriptorSet0.vp_c9)._m0[115].x, _523);
    float _537 = _521 * _491;
    float _539 = _431 * _533;
    float _541 = fma(_525, _475, _535);
    float _543 = fma(_537, _529, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _545 = fma(_543, _539, _541);
    float _547 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _549 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _551 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _553 = fma(_517, (*spvDescriptorSet0.vp_c9)._m0[118].x, _545);
    float _555 = _547 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _557 = _549 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _559 = _551 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _561 = _553 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_64.x = _555;
    out.m_64.y = _557;
    out.m_64.z = _559;
    out.m_64.w = _561;
    bool _563 = !_471;
    if (!_563)
    {
        float _565 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _567 = _155 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _569 = fma(_567, (*spvDescriptorSet0.vp_c9)._m0[11].w, _123);
        float _571 = _569 * _565;
        float _573 = floor(_571);
        float _575 = -_573;
        float _577 = _571 + _575;
        _175 = _577;
    }
    float _579 = _175;
    float _581 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _583 = int(_581);
    float _585 = in.m_55.z;
    float _587 = _155 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _589 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _591 = _589 != 0;
    float _593 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _595 = int(_593);
    float _597 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _599 = float(_583);
    float _601 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _603 = int(_601);
    float _605 = float(_595);
    float _607 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _609 = int(_607);
    float _611 = 1.0 / _605;
    float _613 = float(uint(_603));
    int _615 = ~_603;
    int _617 = _615 + 1;
    float _619 = 1.0 / _599;
    float _621 = float(uint(_609));
    int _623 = ~_609;
    int _625 = _623 + 1;
    int _627 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _629 = _627 != 0;
    float _631 = _611 * _123;
    float _633 = 1.0 / _613;
    int _635 = ~_609;
    int _637 = _635 + 1;
    float _639 = _619 * _123;
    float _641 = trunc(_631);
    int _643 = int(_641);
    float _645 = 1.0 / _621;
    int _647 = as_type<int>(_633) + (-2);
    float _649 = trunc(_639);
    int _651 = int(_649);
    float _653 = float(uint(_643));
    float _655 = as_type<float>(_647) * _653;
    float _657 = _653;
    if (_629)
    {
        _657 = _155;
    }
    float _659 = _657;
    float _661 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _663 = log2(_661);
    int _665 = as_type<int>(_645) + (-2);
    float _667 = _645;
    float _669 = _659;
    if (_629)
    {
        _667 = 1.0;
    }
    float _671 = _667;
    float _673 = _671;
    if (!_629)
    {
        _673 = 5.839270114898681640625;
    }
    float _675 = _673;
    if (!_629)
    {
        _669 = _585;
    }
    float _677 = _669;
    float _679 = trunc(_655);
    float _681 = precise::max(_679, 0.0);
    uint _684 = uint(_681);
    float _686 = float(uint(_651));
    float _688 = _675 * _677;
    float _690 = as_type<float>(_665) * _686;
    float _692 = _686;
    if (_629)
    {
        _692 = 1.0;
    }
    float _694 = _692;
    float _696 = floor(_688);
    float _698 = _694;
    if (!_629)
    {
        _698 = 7.345489978790283203125;
    }
    float _700 = _698;
    int _702 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _704 = _702 != 0;
    float _706 = _700 * _155;
    float _708 = trunc(_690);
    float _710 = precise::max(_708, 0.0);
    uint _712 = uint(_710);
    int _714 = _617 * int(_684);
    int _716 = _714 + _643;
    float _718 = float(uint(_716));
    float _720 = floor(_706);
    float _722 = as_type<float>(_647) * _718;
    int _724 = _625 * int(_712);
    int _726 = _724 + _651;
    float _728 = trunc(_722);
    float _730 = precise::max(_728, 0.0);
    uint _732 = uint(_730);
    float _734 = float(uint(_726));
    float _736 = -_720;
    float _738 = _706 + _736;
    float _740 = _165 * _123;
    float _742 = as_type<float>(_665) * _734;
    float _744 = -_696;
    float _746 = _688 + _744;
    float _748 = float(_603);
    float _750 = trunc(_742);
    float _752 = precise::max(_750, 0.0);
    uint _754 = uint(_752);
    float _756 = float(_643);
    int _758 = int(_684) + int(_732);
    float _760 = _738 * _748;
    float _762 = float(_609);
    float _764 = _748 * _740;
    bool _766 = _756 >= _748;
    bool _768 = isnan(_756);
    bool _770 = _766 || _768;
    bool _772 = isnan(_748);
    bool _774 = _770 || _772;
    float _776 = float(_774);
    float _778 = _746 * _762;
    float _780 = trunc(_776);
    int _782 = int(_780);
    float _784 = float(_651);
    float _786 = _762 * _740;
    int _788 = int(_712) + int(_754);
    int _790 = ~_603;
    int _792 = _790 + 1;
    float _794 = trunc(_760);
    int _796 = int(_794);
    int _798 = ~_609;
    int _800 = _798 + 1;
    bool _802 = _784 >= _762;
    bool _804 = isnan(_784);
    bool _806 = _802 || _804;
    bool _808 = isnan(_762);
    bool _810 = _806 || _808;
    float _812 = float(_810);
    int _814 = _792 * _758;
    int _816 = _814 + _643;
    bool _818 = !_704;
    int _820 = _818 ? 0 : 1;
    int _822 = _800 * _788;
    int _824 = _822 + _651;
    float _826 = trunc(_778);
    int _828 = int(_826);
    bool _830 = uint(_816) >= uint(_603);
    bool _832 = uint(_824) >= uint(_609);
    bool _834 = !_830;
    int _836 = _834 ? 0 : (-1);
    int _838 = abs(_820);
    float _840 = trunc(_764);
    int _842 = int(_840);
    int _844 = ~_758;
    int _846 = _844 + _836;
    int _848 = _846 + 1;
    bool _850 = !_832;
    int _852 = _850 ? 0 : (-1);
    int _854 = _796 * _838;
    int _856 = _854 + _643;
    int _858 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _860 = _858 != 0;
    int _862 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _864 = _862 != 0;
    int _866 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _868 = _866 != 0;
    int _870 = _603 * _848;
    int _872 = _870 + _643;
    bool _874 = !_591;
    int _876 = _874 ? 0 : 1;
    float _878 = trunc(_812);
    int _880 = int(_878);
    bool _882 = _603 == 0;
    int _884 = abs(_876);
    int _886 = ~_788;
    int _888 = _886 + _852;
    int _890 = _888 + 1;
    bool _892 = !_882;
    int _894 = _892 ? _872 : (-1);
    int _896 = _828 * _884;
    int _898 = _896 + _651;
    int _900 = ~_782;
    int _902 = _900 + 1;
    int _904 = _902 + 1;
    int _906 = _609 * _890;
    int _908 = _906 + _651;
    bool _910 = _609 == 0;
    bool _912 = !_864;
    int _914 = _912 ? 0 : 1;
    int _916 = _894 * _904;
    int _918 = _603 + (-1);
    bool _920 = !_860;
    int _922 = _920 ? 0 : 1;
    bool _924 = !_868;
    int _926 = _924 ? 0 : 1;
    int _928 = _782 * _918;
    int _930 = _928 + _916;
    int _932 = ~_880;
    int _934 = _932 + 1;
    int _936 = _934 + 1;
    float _938 = trunc(_786);
    int _940 = int(_938);
    bool _942 = !_910;
    int _944 = _942 ? _908 : (-1);
    int _946 = abs(_914);
    int _948 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _950 = _948 != 0;
    int _952 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _954 = _952 != 0;
    int _956 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _958 = _956 != 0;
    int _960 = _944 * _936;
    int _962 = abs(_922);
    int _964 = _930 * _946;
    int _966 = _609 + (-1);
    bool _968 = !_954;
    int _970 = _968 ? 0 : 1;
    int _972 = _842 * _962;
    int _974 = _972 + _964;
    bool _976 = !_950;
    int _978 = _976 ? 0 : 1;
    int _980 = _880 * _966;
    int _982 = _980 + _960;
    int _984 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _986 = _984 != 0;
    int _988 = abs(_970);
    int _990 = abs(_978);
    int _992 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _994 = _992 != 0;
    int _996 = _982 * _988;
    bool _998 = !_958;
    int _1000 = _998 ? 0 : 1;
    bool _1002 = !_986;
    int _1004 = _1002 ? 0 : 1;
    int _1006 = abs(_926);
    bool _1008 = !_994;
    int _1010 = _1008 ? 0 : 1;
    int _1012 = abs(_1000);
    int _1014 = _940 * _990;
    int _1016 = _1014 + _996;
    int _1018 = abs(_1004);
    int _1020 = abs(_1010);
    int _1022 = _856 * _1006;
    int _1024 = _1022 + _974;
    int _1026 = _898 * _1012;
    int _1028 = _1026 + _1016;
    int _1030 = ~_609;
    int _1032 = _1030 + 1;
    int _1034 = _796 * _1018;
    int _1036 = _1034 + _1024;
    int _1038 = ~_603;
    int _1040 = _1038 + 1;
    int _1042 = _828 * _1020;
    int _1044 = _1042 + _1028;
    int _1046 = ~_609;
    int _1048 = _1046 + 1;
    float _1050 = float(uint(_1036));
    float _1052 = float(uint(_1044));
    int _1054 = ~_603;
    int _1056 = _1054 + 1;
    float _1058 = as_type<float>(_647) * _1050;
    float _1060 = float(uint(_898));
    float _1062 = as_type<float>(_665) * _1052;
    int _1064 = ~_603;
    int _1066 = _1064 + 1;
    float _1068 = trunc(_1058);
    float _1070 = precise::max(_1068, 0.0);
    uint _1072 = uint(_1070);
    float _1074 = trunc(_1062);
    float _1076 = precise::max(_1074, 0.0);
    uint _1078 = uint(_1076);
    float _1080 = float(uint(_856));
    int _1082 = _1066 * int(_1072);
    int _1084 = _1082 + _1036;
    float _1086 = as_type<float>(_647) * _1080;
    float _1088 = float(uint(_1084));
    float _1090 = trunc(_1086);
    float _1092 = precise::max(_1090, 0.0);
    uint _1094 = uint(_1092);
    int _1096 = _1032 * int(_1078);
    int _1098 = _1096 + _1044;
    float _1100 = as_type<float>(_647) * _1088;
    float _1102 = float(uint(_1098));
    float _1104 = trunc(_1100);
    float _1106 = precise::max(_1104, 0.0);
    uint _1108 = uint(_1106);
    float _1110 = as_type<float>(_665) * _1102;
    float _1112 = trunc(_1110);
    float _1114 = precise::max(_1112, 0.0);
    uint _1116 = uint(_1114);
    int _1118 = int(_1072) + int(_1108);
    int _1120 = ~_603;
    int _1122 = _1120 + 1;
    int _1124 = _1040 * _1118;
    int _1126 = _1124 + _1036;
    int _1128 = _1122 * int(_1094);
    int _1130 = _1128 + _856;
    int _1132 = int(_1078) + int(_1116);
    bool _1134 = uint(_1126) >= uint(_603);
    float _1136 = in.m_66.x;
    float _1138 = in.m_66.y;
    float _1140 = in.m_66.z;
    float _1142 = in.m_66.w;
    float _1144 = float(uint(_1130));
    int _1146 = _1048 * _1132;
    int _1148 = _1146 + _1044;
    bool _1150 = !_1134;
    int _1152 = _1150 ? 0 : (-1);
    float _1154 = as_type<float>(_647) * _1144;
    bool _1156 = uint(_1148) >= uint(_609);
    int _1158 = ~_1118;
    int _1160 = _1158 + _1152;
    int _1162 = _1160 + 1;
    bool _1164 = !_1156;
    int _1166 = _1164 ? 0 : (-1);
    float _1168 = trunc(_1154);
    float _1170 = precise::max(_1168, 0.0);
    uint _1172 = uint(_1170);
    int _1174 = _603 * _1162;
    int _1176 = _1174 + _1036;
    int _1178 = ~_1132;
    int _1180 = _1178 + _1166;
    int _1182 = _1180 + 1;
    bool _1184 = !_882;
    int _1186 = _1184 ? _1176 : (-1);
    int _1188 = _609 * _1182;
    int _1190 = _1188 + _1044;
    int _1192 = _1186 & 3;
    bool _1194 = _1192 != 0;
    bool _1196 = !_910;
    int _1198 = _1196 ? _1190 : (-1);
    int _1200 = _1186 & 3;
    bool _1202 = _1200 != 0;
    float _1204 = in.m_68.x;
    float _1206 = in.m_68.y;
    float _1208 = in.m_68.z;
    float _1210 = in.m_68.w;
    int _1212 = _1198 & 3;
    bool _1214 = _1212 != 0;
    bool _1216 = uint(_1192) > 1u;
    bool _1218 = uint(_1212) > 1u;
    int _1220 = _1202 ? 0 : 1;
    int _1222 = _1198 & 3;
    bool _1224 = _1222 != 0;
    int _1226 = ~_1220;
    int _1228 = _1226 + 1;
    int _1230 = _1228 + 1;
    int _1232 = _1224 ? 0 : 1;
    int _1234 = int(_1094) + int(_1172);
    int _1236 = ~_1232;
    int _1238 = _1236 + 1;
    int _1240 = _1238 + 1;
    float _1242 = in.m_70.x;
    float _1244 = in.m_70.y;
    float _1246 = in.m_70.z;
    float _1248 = in.m_70.w;
    int _1250 = _1230;
    int _1252 = _1240;
    if (!_1216)
    {
        int _1254 = ~_1220;
        int _1256 = _1254 + 1;
        _1250 = _1256;
    }
    int _1258 = _1250;
    int _1260 = _1056 * _1234;
    int _1262 = _1260 + _856;
    if (!_1218)
    {
        int _1264 = ~_1232;
        int _1266 = _1264 + 1;
        _1252 = _1266;
    }
    int _1268 = _1252;
    bool _1270 = _1192 != 3;
    float _1272 = in.m_46.x;
    float _1274 = in.m_46.y;
    float _1276 = in.m_46.z;
    bool _1278 = uint(_1192) >= 2u;
    bool _1280 = uint(_1212) >= 2u;
    int _1282 = _1278 ? 0 : 1;
    bool _1284 = _1212 != 3;
    int _1286 = ~_1282;
    int _1288 = _1286 + 1;
    int _1290 = _1288 + 1;
    int _1292 = _1280 ? 0 : 1;
    int _1294 = _1290;
    if (_1270)
    {
        int _1296 = ~_1282;
        int _1298 = _1296 + 1;
        _1294 = _1298;
    }
    int _1300 = _1294;
    bool _1302 = uint(_1262) >= uint(_603);
    float _1304 = in.m_55.y;
    int _1306 = ~_1292;
    int _1308 = _1306 + 1;
    int _1310 = _1308 + 1;
    int _1312 = _1310;
    if (_1284)
    {
        int _1314 = ~_1292;
        int _1316 = _1314 + 1;
        _1312 = _1316;
    }
    int _1318 = _1312;
    float _1320 = as_type<float>(_665) * _1060;
    int _1322 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1324 = _1322 != 0;
    int _1326 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1328 = _1326 != 0;
    float _1330 = _1274 * _1206;
    bool _1332 = !_1324;
    int _1334 = _1332 ? 0 : 1;
    float _1336 = trunc(_1320);
    float _1338 = precise::max(_1336, 0.0);
    uint _1340 = uint(_1338);
    bool _1342 = _155 > 0.5;
    float _1344 = _663 * _123;
    float _1346 = _1274 * _1244;
    float _1348 = _1274 * _1138;
    float _1350 = -_191;
    int _1352 = _1342 ? as_type<int>(_1350) : as_type<int>(_191);
    float _1354 = fma(_1272, _1204, _1330);
    bool _1356 = !_1302;
    int _1358 = _1356 ? 0 : (-1);
    float _1360 = exp2(_1344);
    bool _1362 = !_1328;
    float _1364 = _1362 ? _191 : as_type<float>(_1352);
    float _1366 = fma(_1276, _1208, _1354);
    float _1368 = _1304 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _1370 = _1304 > 0.5;
    int _1372 = _637 * int(_1340);
    int _1374 = _1372 + _898;
    int _1376 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _1378 = _1376 != 0;
    float _1380 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _1382 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1384 = _1382 != 0;
    float _1386 = _155 * 2.0;
    float _1388 = -_195;
    int _1390 = _1370 ? as_type<int>(_1388) : as_type<int>(_195);
    float _1392 = -_1380;
    float _1394 = fma(_587, 2.0, _1392);
    bool _1396 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1398 = isnan(1.0);
    bool _1400 = _1396 || _1398;
    bool _1402 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1404 = _1400 || _1402;
    float _1406 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1408 = 1.0 + _1406;
    float _1410 = float(uint(_1374));
    float _1412 = floor(_1386);
    float _1414 = fma(_1368, -2.0, _597);
    float _1416 = _1304 * 2.0;
    float _1418 = fma(_1272, _1242, _1346);
    float _1420 = as_type<float>(_665) * _1410;
    float _1422 = -_1360;
    float _1424 = _1422 + 1.0;
    float _1426 = 1.0 / _1408;
    bool _1428 = !_1384;
    float _1430 = _1428 ? _195 : as_type<float>(_1390);
    float _1432 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _1434 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1436 = isnan(0.0);
    bool _1438 = _1434 || _1436;
    bool _1440 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1442 = _1438 || _1440;
    float _1444 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1446 = -_123;
    float _1448 = fma(_1446, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1394);
    float _1450 = fma(_155, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1432);
    float _1452 = _1442 ? _1424 : 0.0;
    float _1454 = floor(_1416);
    float _1456 = fma(_1304, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1444);
    bool _1458 = _1412 >= 0.0;
    bool _1460 = isnan(_1412);
    bool _1462 = _1458 || _1460;
    bool _1464 = isnan(0.0);
    bool _1466 = _1462 || _1464;
    float _1468 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1450);
    float _1470 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1456);
    float _1472 = fma(_1276, _1246, _1418);
    float _1474 = trunc(_1420);
    float _1476 = precise::max(_1474, 0.0);
    uint _1478 = uint(_1476);
    float _1480 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1414);
    if (_1404)
    {
        float _1482 = _1452 * _1426;
        _133 = _1482;
    }
    float _1484 = _133;
    int _1486 = _1466 ? 0 : 1;
    float _1488 = fma(_1272, _1136, _1348);
    bool _1490 = _1412 > 0.0;
    float _1492 = _585 * 2.0;
    int _1494 = ~_609;
    int _1496 = _1494 + 1;
    float _1498 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1500 = _1498 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1502 = _1454 >= 0.0;
    bool _1504 = isnan(_1454);
    bool _1506 = _1502 || _1504;
    bool _1508 = isnan(0.0);
    bool _1510 = _1506 || _1508;
    float _1512 = _155 + _1304;
    float _1514 = fma(_1276, _1140, _1488);
    float _1516 = floor(_1492);
    int _1518 = _1510 ? 0 : 1;
    float _1520 = _1512 + (-1.0);
    bool _1522 = _1454 > 0.0;
    float _1524 = _1364 + 0.5;
    int _1526 = int(_1340) + int(_1478);
    float _1528 = fma(_1520, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1530 = 1.0 / _1500;
    int _1532 = ~_1486;
    int _1534 = _1532 + 1;
    int _1536 = _1534 + 1;
    float _1538 = _1514 + _1142;
    int _1540 = _1536;
    float _1542 = _1538;
    if (!_1490)
    {
        int _1544 = ~_1486;
        int _1546 = _1544 + 1;
        _1540 = _1546;
    }
    int _1548 = _1540;
    int _1550 = _1496 * _1526;
    int _1552 = _1550 + _898;
    int _1554 = ~_1518;
    int _1556 = _1554 + 1;
    int _1558 = _1556 + 1;
    float _1560 = _1430 + (-0.5);
    bool _1562 = !_1194;
    int _1564 = _1562 ? 0 : 1;
    float _1566 = -_1470;
    float _1568 = _1566 + 1.0;
    bool _1570 = uint(_1552) >= uint(_609);
    float _1572 = -_1468;
    float _1574 = _1572 + 1.0;
    int _1576 = _1558;
    if (!_1522)
    {
        int _1578 = ~_1518;
        int _1580 = _1578 + 1;
        _1576 = _1580;
    }
    int _1582 = _1576;
    bool _1584 = !_1570;
    int _1586 = _1584 ? 0 : (-1);
    int _1588 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1590 = _1588 != 0;
    int _1592 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1594 = _1592 != 0;
    int _1596 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1598 = _1596 != 0;
    float _1600 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1602 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1600;
    float _1604 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1606 = _579 + _1604;
    bool _1608 = _579 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1610 = isnan(_579);
    bool _1612 = _1608 || _1610;
    bool _1614 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1616 = _1612 || _1614;
    float _1618 = float(_1616);
    bool _1620 = !_1590;
    int _1622 = _1620 ? 0 : 1;
    float _1624 = _1602 * _1530;
    bool _1626 = _1516 >= 0.0;
    bool _1628 = isnan(_1516);
    bool _1630 = _1626 || _1628;
    bool _1632 = isnan(0.0);
    bool _1634 = _1630 || _1632;
    float _1636 = -_1618;
    float _1638 = _1636 + 1.0;
    bool _1640 = _579 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1642 = isnan(_579);
    bool _1644 = _1640 || _1642;
    bool _1646 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1648 = _1644 || _1646;
    float _1650 = float(_1648);
    float _1652 = _1472 + _1248;
    int _1654 = _1634 ? 0 : 1;
    bool _1656 = _1516 > 0.0;
    float _1658 = fma(_1624, _1606, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1660 = _1366 + _1210;
    float _1662 = fma(_1524, (*spvDescriptorSet0.vp_c9)._m0[80].x, _1448);
    float _1664 = _1650 * _1638;
    float _1666 = -_1560;
    float _1668 = -_1480;
    float _1670 = fma(_1666, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1668);
    float _1672 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1674 = _1660 + _1672;
    float _1676 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1678 = _1652 + _1676;
    float _1680 = _1658 * _1664;
    int _1682 = _1186 >> 31;
    float _1684 = _1674 * _1674;
    float _1686 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1688 = _1538 + _1686;
    int _1690 = _1198 >> 31;
    float _1692 = -_1650;
    float _1694 = _1692 + 1.0;
    float _1696 = fma(_1678, _1678, _1684);
    int _1698 = _1682 & 3;
    float _1700 = fma(_1430, _1568, _1670);
    int _1702 = _1690 & 3;
    float _1704 = fma(_1688, _1688, _1696);
    int _1706 = _1186 + _1698;
    float _1708 = fma(_1694, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1680);
    int _1710 = _1198 + _1702;
    float _1712 = rsqrt(_1704);
    float _1714 = _387 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _1716 = _1706 >> 2;
    float _1718 = -_1574;
    float _1720 = fma(_1364, _1718, _1662);
    int _1722 = _1710 >> 2;
    float _1724 = _1714 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    int _1726 = _1716 << 4;
    int _1728 = _1726 + 368;
    float _1730 = _1674 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _1732 = ~_1654;
    int _1734 = _1732 + 1;
    int _1736 = _1734 + 1;
    out.m_72.x = _1720;
    out.m_72.y = _1700;
    int _1738 = _1736;
    if (!_1656)
    {
        int _1740 = ~_1654;
        int _1742 = _1740 + 1;
        _1738 = _1742;
    }
    int _1744 = _1738;
    float _1746 = fma(_1618, (*spvDescriptorSet0.vp_c9)._m0[132].x, _1708);
    uint _1748 = uint(int(uint(_1728) >> uint(2)));
    uint _1750 = uint(int(uint(int(_1748)) >> uint(2)));
    int _1752 = int(_1748) & 3;
    float _1754 = (*spvDescriptorSet0.vp_c9)._m0[int(_1750)][_1752];
    int _1756 = int(_1748) + 1;
    uint _1758 = uint(int(uint(_1756) >> uint(2)));
    int _1760 = _1756 & 3;
    float _1762 = (*spvDescriptorSet0.vp_c9)._m0[int(_1758)][_1760];
    int _1764 = _1722 << 4;
    int _1766 = _1764 + 656;
    float _1768 = _1746 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1770 = _1724 * _1712;
    float _1772 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1774 = fma(_1678, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1730);
    float _1776 = _1674 * _1770;
    uint _1778 = uint(int(uint(_1766) >> uint(2)));
    uint _1780 = uint(int(uint(int(_1778)) >> uint(2)));
    int _1782 = int(_1778) & 3;
    float _1784 = (*spvDescriptorSet0.vp_c9)._m0[int(_1780)][_1782];
    int _1786 = int(_1778) + 1;
    uint _1788 = uint(int(uint(_1786) >> uint(2)));
    int _1790 = _1786 & 3;
    float _1792 = (*spvDescriptorSet0.vp_c9)._m0[int(_1788)][_1790];
    float _1794 = _1678 * _1770;
    float _1796 = -_1776;
    float _1798 = _1674 + _1796;
    float _1800 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1802 = -_1794;
    float _1804 = _1678 + _1802;
    float _1806 = _1772 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1808 = _1798 * _1798;
    float _1810 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    int _1812 = _1728 + 8;
    uint _1814 = uint(int(uint(_1812) >> uint(2)));
    uint _1816 = uint(int(uint(int(_1814)) >> uint(2)));
    int _1818 = int(_1814) & 3;
    float _1820 = (*spvDescriptorSet0.vp_c9)._m0[int(_1816)][_1818];
    int _1822 = int(_1814) + 1;
    uint _1824 = uint(int(uint(_1822) >> uint(2)));
    int _1826 = _1822 & 3;
    float _1828 = (*spvDescriptorSet0.vp_c9)._m0[int(_1824)][_1826];
    float _1830 = _1800 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1832 = fma(_1804, _1804, _1808);
    bool _1834 = !_1214;
    int _1836 = _1834 ? 0 : 1;
    float _1838 = _1810 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1840 = _1192 != 3;
    float _1842 = _1688 * _1770;
    int _1844 = abs(_1622);
    float _1846 = fma(_1688, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1774);
    int _1848 = _1766 + 8;
    uint _1850 = uint(int(uint(_1848) >> uint(2)));
    uint _1852 = uint(int(uint(int(_1850)) >> uint(2)));
    int _1854 = int(_1850) & 3;
    float _1856 = (*spvDescriptorSet0.vp_c9)._m0[int(_1852)][_1854];
    int _1858 = int(_1850) + 1;
    uint _1860 = uint(int(uint(_1858) >> uint(2)));
    int _1862 = _1858 & 3;
    float _1864 = (*spvDescriptorSet0.vp_c9)._m0[int(_1860)][_1862];
    out.m_74.x = _1830;
    out.m_74.y = _1838;
    out.m_74.z = _1806;
    out.m_74.w = _1768;
    int _1866 = ~_1234;
    int _1868 = _1866 + _1358;
    int _1870 = _1868 + 1;
    int _1872 = ~_1526;
    int _1874 = _1872 + _1586;
    int _1876 = _1874 + 1;
    int _1878 = abs(_1300);
    int _1880 = _603 * _1870;
    int _1882 = _1880 + _856;
    int _1884 = abs(_1268);
    int _1886 = _609 * _1876;
    int _1888 = _1886 + _898;
    int _1890 = abs(_1836);
    int _1892 = ~_1884;
    int _1894 = _1892 + 1;
    int _1896 = _1894 + 1;
    float _1898 = float(_1744);
    float _1900 = float(_1844);
    float _1902 = -_1842;
    float _1904 = _1688 + _1902;
    int _1906 = abs(_1564);
    bool _1908 = !_1840;
    int _1910 = _1908 ? 0 : (-1);
    float _1912 = _1900 * _1898;
    int _1914 = abs(_1258);
    float _1916 = fma(_1904, _1904, _1832);
    bool _1918 = _1212 != 3;
    int _1920 = ~_1914;
    int _1922 = _1920 + 1;
    int _1924 = _1922 + 1;
    int _1926 = _1896 * as_type<int>(_1792);
    int _1928 = ~_1906;
    int _1930 = _1928 + 1;
    int _1932 = _1930 + 1;
    float _1934 = sqrt(_1916);
    int _1936 = _1924 * as_type<int>(_1762);
    int _1938 = ~_1890;
    int _1940 = _1938 + 1;
    int _1942 = _1940 + 1;
    int _1944 = abs(_1318);
    int _1946 = _1932 * as_type<int>(_1754);
    int _1948 = _1946 + _1936;
    int _1950 = _1942 * as_type<int>(_1784);
    int _1952 = _1950 + _1926;
    bool _1954 = !_1918;
    int _1956 = _1954 ? 0 : (-1);
    int _1958 = ~_1878;
    int _1960 = _1958 + 1;
    int _1962 = _1960 + 1;
    int _1964 = abs(_1956);
    int _1966 = ~_1944;
    int _1968 = _1966 + 1;
    int _1970 = _1968 + 1;
    int _1972 = _1962 * as_type<int>(_1820);
    int _1974 = _1972 + _1948;
    int _1976 = abs(_1910);
    float _1978 = in.m_76.x;
    float _1980 = in.m_76.y;
    float _1982 = in.m_76.z;
    bool _1984 = !_1378;
    int _1986 = _1984 ? 0 : 1;
    int _1988 = _1970 * as_type<int>(_1856);
    int _1990 = _1988 + _1952;
    int _1992 = ~_1964;
    int _1994 = _1992 + 1;
    int _1996 = _1994 + 1;
    float _1998 = _1712 * _1934;
    int _2000 = abs(_1334);
    int _2002 = _1996 * as_type<int>(_1864);
    int _2004 = _2002 + _1990;
    int _2006 = abs(_1986);
    float _2008 = _1714 * _1998;
    bool _2010 = _1846 >= 0.0;
    int _2012 = ~_1976;
    int _2014 = _2012 + 1;
    int _2016 = _2014 + 1;
    out.m_78.x = _2008;
    int _2018 = ~_2000;
    int _2020 = _2018 + 1;
    int _2022 = _2020 + 1;
    int _2024 = _2016 * as_type<int>(_1828);
    int _2026 = _2024 + _1974;
    int _2028 = ~_2006;
    int _2030 = _2028 + 1;
    int _2032 = _2030 + 1;
    bool _2034 = !_882;
    int _2036 = _2034 ? _1882 : (-1);
    int _2038 = _2026 * _2022;
    bool _2040 = !_910;
    int _2042 = _2040 ? _1888 : (-1);
    int _2044 = _2004 * _2032;
    float _2046 = as_type<float>(_1974);
    if (_2010)
    {
        _2046 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2048 = _2046;
    float _2050 = _1912 * (-2.0);
    int _2052 = _2036 * _2000;
    int _2054 = _2052 + _2038;
    float _2056 = _155 + (-0.5);
    int _2058 = _2042 * _2006;
    int _2060 = _2058 + _2044;
    float _2062 = fma(_2050, _1978, _1978);
    int _2064 = as_type<int>(_2048);
    if (_2010)
    {
        float _2066 = _2048 * 5.0;
        _2064 = as_type<int>(_2066);
    }
    int _2068 = _2064;
    float _2070 = float(_2054);
    float _2072 = fma(_1528, _2050, _1528);
    float _2074 = float(_2060);
    float _2076 = fma(_2056, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2062);
    float _2078 = _1304 + _585;
    bool _2080 = !_1594;
    int _2082 = _2080 ? 0 : 1;
    if (_2010)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6384 = as_type<float>(_2068);
        out.gl_Position.z = _6384;
    }
    float _2084 = _2078 + (-1.0);
    float _2086 = float(_1548);
    out.m_80.x = _2070;
    int _2088 = abs(_2082);
    out.m_80.z = _2074;
    if (_2010)
    {
        out.m_53.x = 0.0;
    }
    bool _2090 = !_1598;
    int _2092 = _2090 ? 0 : 1;
    if (_2010)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2094 = -_1776;
    float _2096 = _1660 + _2094;
    int _2098 = abs(_2092);
    float _2100 = -_1794;
    float _2102 = _1652 + _2100;
    float _2104 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2106 = _2096 + _2104;
    float _2108 = -_1842;
    float _2110 = _1538 + _2108;
    float _2112 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2114 = _2102 + _2112;
    float _2116 = float(_2088);
    float _2118 = _2106 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2120 = float(_1582);
    float _2122 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2124 = _2110 + _2122;
    float _2126 = float(_2098);
    float _2128 = _2116 * _2086;
    float _2130 = fma(_2114, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2118);
    float _2132 = fma(_2084, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _2134 = _155 + _585;
    float _2136 = _2128 * (-2.0);
    float _2138 = fma(_2124, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2130);
    float _2140 = _2126 * _2120;
    float _2142 = _1304 + (-0.5);
    float _2144 = fma(_2136, _1980, _1980);
    float _2146 = fma(_2132, _2136, _2132);
    bool _2148 = _2138 >= 0.0;
    float _2150 = _2140 * (-2.0);
    float _2152 = _2134 + (-1.0);
    float _2154 = fma(_2142, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2144);
    float _2156 = fma(_2150, _1982, _1982);
    float _2158 = _585 + (-0.5);
    float _2160 = fma(_2152, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2162 = fma(_2072, _1484, _2076);
    float _2164 = fma(_2146, _1484, _2154);
    float _2166 = fma(_2158, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2156);
    float _2168 = fma(_2160, _2150, _2160);
    float _2170 = _2162 * 0.15915493667125701904296875;
    float _2172 = _2164 * 0.15915493667125701904296875;
    float _2174 = _2150;
    int _2176 = as_type<int>(_2156);
    float _2178 = _2102;
    if (_2148)
    {
        _2174 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2180 = _2174;
    float _2182 = fma(_2168, _1484, _2166);
    float _2184 = _2170 * 6.283185482025146484375;
    float _2186 = sin(_2184);
    if (_2148)
    {
        out.m_53.x = 0.0;
    }
    if (_2148)
    {
        float _2188 = _2180 * 5.0;
        _2176 = as_type<int>(_2188);
    }
    int _2190 = _2176;
    float _2192 = _2182 * 0.15915493667125701904296875;
    float _2194 = _2170 * 6.283185482025146484375;
    float _2196 = cos(_2194);
    if (_2148)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6577 = as_type<float>(_2190);
        out.gl_Position.z = _6577;
    }
    float _2198 = _2172 * 6.283185482025146484375;
    float _2200 = sin(_2198);
    float _2202 = _2172 * 6.283185482025146484375;
    float _2204 = cos(_2202);
    if (_2148)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2206 = _2192 * 6.283185482025146484375;
    float _2208 = cos(_2206);
    float _2210 = _389 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2212 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _195);
    float _2214 = _2186 * _2200;
    float _2216 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _191);
    float _2218 = _2210 * _1998;
    float _2220 = _2196 * _2200;
    float _2222 = _2192 * 6.283185482025146484375;
    float _2224 = sin(_2222);
    float _2226 = _2218 * _2212;
    float _2228 = _2196 * _2204;
    float _2230 = _2186 * _2204;
    float _2232 = _2008 * _2216;
    float _2234 = _1998 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2236 = _2234 * 0.5;
    bool _2238 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2240 = isnan(0.5);
    bool _2242 = _2238 || _2240;
    bool _2244 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2246 = _2242 || _2244;
    float _2248 = _2196 * _2208;
    float _2250 = _2204 * _2208;
    float _2252 = _2186 * _2208;
    float _2254 = _2200 * _2208;
    float _2256 = _2248 * _2226;
    bool _2258 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2260 = isnan(0.5);
    bool _2262 = _2258 || _2260;
    bool _2264 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2266 = _2262 || _2264;
    float _2268 = fma(_2224, _2228, _2214);
    float _2270 = -_2230;
    float _2272 = fma(_2224, _2220, _2270);
    float _2274 = -_2226;
    float _2276 = _2224 * _2274;
    float _2278 = -_2220;
    float _2280 = fma(_2224, _2230, _2278);
    float _2282 = fma(_2268, _2232, _2256);
    float _2284 = _2252 * _2226;
    float _2286 = fma(_2250, _2232, _2276);
    float _2288 = fma(_2224, _2214, _2228);
    float _2290 = fma(_2272, _2236, _2282);
    float _2292 = fma(_2280, _2232, _2284);
    float _2294 = fma(_2254, _2236, _2286);
    float _2296 = _2290 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2298 = fma(_2288, _2236, _2292);
    float _2300 = _2290 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2302 = _2096 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2304 = fma(_2294, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2296);
    float _2306 = fma(_2294, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2300);
    float _2308 = fma(_2102, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2302);
    float _2310 = fma(_2298, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2304);
    float _2312 = fma(_2298, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2306);
    float _2314 = fma(_2110, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2308);
    float _2316 = _2310 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2318 = _2096 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2320 = _2312 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2322 = _2314 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2324 = _1538 + _2316;
    float _2326 = fma(_2102, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2318);
    float _2328 = _1652 + _2320;
    float _2330 = 1.0 / _2322;
    float _2332 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2334 = _2324 + _2332;
    float _2336 = fma(_2110, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2326);
    float _2338 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2340 = _2328 + _2338;
    float _2342 = _2290 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2344 = _2334 * _2334;
    float _2346 = _2336 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2348 = fma(_2294, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2342);
    float _2350 = fma(_2340, _2340, _2344);
    float _2352 = _2346 + _2322;
    float _2354 = fma(_2298, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2348);
    float _2356 = sqrt(_2350);
    float _2358 = _2352 * _2330;
    float _2360 = _2358 * 0.5;
    float _2362 = _2354 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2364 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2366 = fma(_2360, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2364);
    float _2368 = _1660 + _2362;
    float _2370 = 1.0 / _2366;
    bool _2372 = _2356 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2374 = _2294;
    float _2376 = _2322;
    float _2378 = _2328;
    float _2380 = _2354;
    if (!_2372)
    {
        _2374 = _2324;
    }
    float _2382 = _2374;
    float _2384 = _2382;
    if (!_2372)
    {
        _2376 = _2368;
    }
    float _2386 = _2376;
    bool _2388 = !_2372;
    float _2390 = _2386;
    if (!_2388)
    {
        float _2392 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2394 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2396 = _2356 + _2394;
        float _2398 = rsqrt(_2350);
        float _2400 = _2396 * _2392;
        float _2402 = _2368 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2404 = _2400 * 0.15915493667125701904296875;
        float _2406 = _2404 * 6.283185482025146484375;
        float _2408 = cos(_2406);
        float _2410 = _2404 * 6.283185482025146484375;
        float _2412 = sin(_2410);
        float _2414 = _2408 + (-1.0);
        float _2416 = _2414 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2418 = fma(_2412, _2402, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2420 = fma(_2368, _2408, _2416);
        float _2422 = _2398 * _2418;
        float _2424 = fma(_2340, _2422, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2426 = fma(_2334, _2422, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2378 = _2424;
        _2390 = _2420;
        _2384 = _2426;
        _2380 = _2422;
    }
    float _2428 = _2378;
    float _2430 = _2390;
    float _2432 = _2384;
    float _2434 = _2380;
    float _2436 = -_1794;
    float _2438 = _2436 + _2428;
    float _2440 = -_1776;
    float _2442 = _2440 + _2430;
    float _2444 = -_1842;
    float _2446 = _2444 + _2432;
    float _2448 = _2434;
    float _2450 = _2442;
    float _2452 = _2438;
    float _2454 = _2446;
    float _2456 = _2430;
    float _2458 = _2432;
    if (_2266)
    {
        _2448 = 1.0;
    }
    float _2460 = _2448;
    float _2462 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2464 = _2370 * _2462;
    float _2466 = _2460;
    if (!_2246)
    {
        float _2468 = _2106 * _2106;
        float _2470 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2472 = -_1538;
        float _2474 = _2472 + _2432;
        float _2476 = -_1652;
        float _2478 = _2476 + _2428;
        float _2480 = fma(_2114, _2114, _2468);
        float _2482 = fma(_2124, _2124, _2480);
        float _2484 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2486 = sqrt(_2482);
        float _2488 = 1.0 / _1998;
        float _2490 = _2484 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2492 = precise::min(_2486, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2494 = _2492 * _2470;
        float _2496 = _2494 * _2488;
        float _2498 = -_1660;
        float _2500 = _2498 + _2430;
        float _2502 = _2490 * _2496;
        float _2504 = _2474 * _2496;
        float _2506 = fma(_2500, _2502, _2096);
        float _2508 = fma(_2478, _2502, _2102);
        float _2510 = fma(_2490, _2504, _2110);
        _2450 = _2506;
        _2452 = _2508;
        _2454 = _2510;
        _1542 = _2504;
    }
    float _2512 = _2450;
    float _2514 = _2452;
    float _2516 = _2454;
    float _2518 = _1542;
    float _2520 = _2518;
    if (!_2266)
    {
        float _2522 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2524 = _2522 * 0.15915493667125701904296875;
        float _2526 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2528 = _2524 * 6.283185482025146484375;
        float _2530 = cos(_2528);
        float _2532 = _2526 * 0.15915493667125701904296875;
        float _2534 = _2524 * 6.283185482025146484375;
        float _2536 = sin(_2534);
        float _2538 = 1.0 / _2530;
        float _2540 = _2532 * 6.283185482025146484375;
        float _2542 = cos(_2540);
        float _2544 = _2536 * _2538;
        float _2546 = _2532 * 6.283185482025146484375;
        float _2548 = sin(_2546);
        float _2550 = _2542 * _2544;
        float _2552 = 1.0 / _2550;
        float _2554 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2556 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2554;
        float _2558 = 1.0 / _2556;
        float _2560 = _2548 * _2552;
        float _2562 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2564 = fma(_2464, _2560, _2562);
        float _2566 = _2564 * _2558;
        float _2568 = precise::clamp(_2566, 0.0, 1.0);
        _2520 = _2532;
        _2466 = _2568;
    }
    float _2570 = _2520;
    float _2572 = _2466;
    float _2574 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2576 = _2512 + _2574;
    float _2578 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2580 = _2514 + _2578;
    float _2582 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2584 = _2516 + _2582;
    float _2586 = _2576 * _2576;
    float _2588 = fma(_2580, _2580, _2586);
    float _2590 = fma(_2584, _2584, _2588);
    float _2592 = rsqrt(_2590);
    float _2594 = sqrt(_2590);
    float _2596 = _2592 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2598 = _2580 * _2596;
    float _2600 = _2584 * _2596;
    float _2602 = _2598 * _2598;
    float _2604 = _2600 * _2600;
    float _2606 = _2602 + _2604;
    float _2608 = sqrt(_2606);
    bool _2610 = _2608 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2612 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2614 = _2608 + _2612;
    float _2616 = _2592;
    float _2618 = _2570;
    float _2620 = _2614;
    float _2622 = _2596;
    if (_2610)
    {
        float _2624 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2616 = _2624;
    }
    float _2626 = _2616;
    if (_2610)
    {
        float _2628 = rsqrt(_2606);
        _2618 = _2628;
    }
    float _2630 = _2618;
    float _2632 = _2630;
    if (_2610)
    {
        float _2634 = _2614 * _2626;
        _2620 = _2634;
    }
    float _2636 = _2620;
    if (_2610)
    {
        float _2638 = _2636 * 0.15915493667125701904296875;
        _2456 = _2638;
    }
    float _2640 = _2456;
    float _2642 = _2626;
    if (_2610)
    {
        float _2644 = _2640 * 6.283185482025146484375;
        float _2646 = sin(_2644);
        _2642 = _2646;
    }
    float _2648 = _2642;
    float _2650 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2652 = precise::max(0.0, _2650);
    float _2654 = _2584;
    float _2656 = _2652;
    if (_2610)
    {
        float _2658 = _2640 * 6.283185482025146484375;
        float _2660 = cos(_2658);
        _2654 = _2660;
    }
    float _2662 = _2654;
    float _2664 = -_2596;
    float _2666 = -_2652;
    float _2668 = fma(_2576, _2664, _2666);
    float _2670 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_2610)
    {
        float _2672 = _2668 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2656 = _2672;
    }
    float _2674 = _2656;
    float _2676 = _2648;
    if (_2610)
    {
        float _2678 = fma(_2648, _2674, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2458 = _2678;
    }
    float _2680 = _2458;
    float _2682 = fma(_2102, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2684 = _2680;
    if (!_2610)
    {
        _2178 = _2600;
    }
    float _2686 = _2178;
    float _2688 = _2686;
    float _2690 = _2662;
    if (_2610)
    {
        float _2692 = _2662 + (-1.0);
        _2670 = _2692;
    }
    float _2694 = _2670;
    float _2696 = _2694;
    if (_2610)
    {
        float _2698 = _2630 * _2680;
        _2622 = _2698;
    }
    float _2700 = _2622;
    if (!_2610)
    {
        _2632 = _2598;
    }
    float _2702 = _2632;
    float _2704 = _2702;
    if (_2610)
    {
        float _2706 = _2694 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2696 = _2706;
    }
    float _2708 = _2696;
    if (_2610)
    {
        float _2710 = _2598 * _2700;
        _2704 = _2710;
    }
    float _2712 = _2704;
    if (!_2610)
    {
        _2684 = _2668;
    }
    float _2714 = _2684;
    float _2716 = _2714;
    if (_2610)
    {
        float _2718 = _2600 * _2700;
        _2688 = _2718;
    }
    float _2720 = _2688;
    if (!_2610)
    {
        _2676 = _2602;
    }
    float _2722 = _2676;
    float _2724 = _2722;
    if (_2610)
    {
        float _2726 = fma(_2668, _2662, _2708);
        _2716 = _2726;
    }
    float _2728 = _2716;
    if (_2610)
    {
        float _2730 = _2712 * _2712;
        _2724 = _2730;
    }
    float _2732 = _2724;
    if (!_2610)
    {
        _2690 = _2604;
    }
    float _2734 = _2690;
    float _2736 = _2734;
    if (_2610)
    {
        float _2738 = _2720 * _2720;
        _2736 = _2738;
    }
    float _2740 = _2736;
    float _2742 = fma(_2728, _2728, _2732);
    float _2744 = _2512 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2746 = _2512 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2748 = _2742 + _2740;
    float _2750 = fma(_2514, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2744);
    float _2752 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2754 = fma(_2594, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2752);
    float _2756 = precise::clamp(_2754, 0.0, 1.0);
    float _2758 = rsqrt(_2748);
    float _2760 = fma(_2516, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2750);
    float _2762 = -_2756;
    float _2764 = _2762 + 1.0;
    float _2766 = fma(_2110, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2768 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2770 = _2760 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2772 = _2512 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2774 = fma(_2514, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2746);
    float _2776 = abs(_2764);
    float _2778 = log2(_2776);
    float _2780 = _2770 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2782 = -_2780;
    float _2784 = fma(_2782, _2768, 1.0);
    float _2786 = _2512 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2788 = _2758 * _2712;
    float _2790 = _2758 * _2728;
    float _2792 = fma(_2514, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2786);
    float _2794 = _2758 * _2720;
    float _2796 = fma(_2514, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2772);
    float _2798 = _2788 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2800 = fma(_2516, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2792);
    float _2802 = floor(_2682);
    float _2804 = fma(_2516, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2796);
    float _2806 = -_2798;
    float _2808 = fma(_2790, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2806);
    float _2810 = _2800 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2812 = _2778 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2814 = _2804 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2816 = fma(_2516, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2774);
    float _2818 = _2810 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2820 = floor(_2766);
    float _2822 = -_2794;
    float _2824 = fma(_2822, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2808);
    float _2826 = _2816 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2828 = fma(_2814, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2818);
    float _2830 = _2810 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2832 = fma(_2824, -0.5, 0.5);
    float _2834 = fma(_2770, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2828);
    float _2836 = exp2(_2812);
    float _2838 = fma(_2824, 0.5, 0.5);
    float _2840 = fma(_2826, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2834);
    float _2842 = log2(_2784);
    float _2844 = -_2820;
    float _2846 = _2766 + _2844;
    float _2848 = fma(_2814, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2830);
    float _2850 = fma(_2838, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2852 = fma(_2770, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2848);
    float _2854 = fma(_2838, _2850, -0.212114393711090087890625);
    float _2856 = 1.0 / _2840;
    float _2858 = -_2802;
    float _2860 = _2682 + _2858;
    float _2862 = _2810 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2864 = fma(_2838, _2854, 1.570728778839111328125);
    float _2866 = fma(_2814, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2862);
    float _2868 = _2790 + 1.0;
    float _2870 = sqrt(_2832);
    float _2872 = _2842 * 0.693147182464599609375;
    float _2874 = fma(_2770, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2866);
    float _2876 = -_2790;
    float _2878 = fma(_2836, _2868, _2876);
    float2 _7670 = float2(_2860, _2846);
    float _2880 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_7670, float2(0.0), isnan(_7670)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_7670, float2(0.0), isnan(_7670)), level(0.0)).x;
    float _2882 = _2872 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2884 = fma(_2826, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2874);
    float _2886 = fma(_2826, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2852);
    float _2888 = _2884 * _2856;
    float _2890 = _2886 * _2856;
    float _2892 = fma(_2888, 0.5, 0.5);
    float _2894 = fma(_2890, -0.5, 0.5);
    float _2896 = _2870 * 0.636619746685028076171875;
    float _2898 = -_2864;
    float _2900 = fma(_2896, _2898, 1.0);
    float _2902 = fma(_2878, 0.5, 0.5);
    float3 _7715 = float3(_2892, _2894, _2882);
    float _2904 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7715, float3(0.0), isnan(_7715)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7715, float3(0.0), isnan(_7715)), level(0.0)).x;
    float3 _7726 = float3(_2892, _2894, _2882);
    float4 _2907 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7726, float3(0.0), isnan(_7726)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7726, float3(0.0), isnan(_7726)), level(0.0)).xyzw;
    float _2909 = _2907.x;
    float _2911 = _2907.y;
    float _2913 = _2907.z;
    float _2915 = _2907.w;
    float2 _7742 = float2(_2900, _2902);
    float3 _2919 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7742, float2(0.0), isnan(_7742)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7742, float2(0.0), isnan(_7742)), level(0.0)).xyz;
    float _2921 = _2919.x;
    float _2923 = _2919.y;
    float _2925 = _2919.z;
    float _2927 = abs(_2464);
    float _2929 = log2(_2927);
    float _2931 = _2268 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2933 = _2268 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2935 = _2268 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2937 = _2248 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2939 = fma(_2250, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2931);
    float _2941 = fma(_2250, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2933);
    float _2943 = fma(_2250, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2935);
    float _2945 = _2248 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2947 = _2248 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2949 = _195 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2951 = -_2224;
    float _2953 = fma(_2951, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2937);
    float _2955 = -_2224;
    float _2957 = fma(_2955, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2945);
    float _2959 = -_2224;
    float _2961 = fma(_2959, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2947);
    bool _2963 = _2594 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2965 = isnan(_2594);
    bool _2967 = _2963 || _2965;
    bool _2969 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2971 = _2967 || _2969;
    float _2973 = _2929 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2975 = fma(_2949, _2949, 1.0);
    float _2977 = _2272 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2979 = _2272 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2981 = _2272 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2983 = fma(_2252, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2961);
    float _2985 = exp2(_2973);
    float _2987 = fma(_2254, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2977);
    float _2989 = fma(_2254, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2979);
    float _2991 = fma(_2254, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2981);
    float _2993 = fma(_2252, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2957);
    float _2995 = fma(_2252, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2953);
    float _2997 = rsqrt(_2975);
    float _2999 = fma(_2280, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2939);
    float _3001 = _191 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3003 = fma(_2288, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2987);
    float _3005 = fma(_2288, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2989);
    float _3007 = fma(_2288, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2991);
    float _3009 = _2949 * _2995;
    float _3011 = fma(_2985, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3013 = precise::clamp(_3011, 0.0, 1.0);
    float _3015 = fma(_2280, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2941);
    float _3017 = fma(_2280, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2943);
    float _3019 = fma(_3013, -2.0, 3.0);
    float _3021 = _3013 * _3013;
    float _3023 = _2949 * _2993;
    out.m_82.x = _2999;
    out.m_82.y = _3015;
    out.m_82.z = _3017;
    float _3025 = _3021 * _3019;
    float _3027 = fma(_3001, _2999, _3023);
    float _3029 = _2949 * _2997;
    float _3031 = _2810 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3033 = fma(_3001, _3015, _3009);
    float _3035 = -_3025;
    float _3037 = _3035 + 1.0;
    float _3039 = -_3003;
    float _3041 = _3029 * _3039;
    float _3043 = fma(_2814, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3031);
    float _3045 = -_3005;
    float _3047 = _3029 * _3045;
    float _3049 = fma(_3037, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3025);
    float _3051 = _2949 * _2983;
    float _3053 = _2778 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3055 = -_3007;
    float _3057 = _3029 * _3055;
    float _3059 = fma(_2997, _2995, _3047);
    float _3061 = fma(_2770, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3043);
    float _3063 = in.m_84.x;
    float _3065 = fma(_2997, _2983, _3057);
    float _3067 = exp2(_3053);
    bool _3069 = _2464 <= 8000.0;
    bool _3071 = isnan(_2464);
    bool _3073 = _3069 || _3071;
    bool _3075 = isnan(8000.0);
    bool _3077 = _3073 || _3075;
    float _3079 = float(_3077);
    float _3081 = fma(_2997, _2993, _3041);
    float _3083 = fma(_2826, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3061);
    float _3085 = _2884 + _2840;
    float _3087 = _2840 * 0.5;
    float _3089 = _3079 * _3049;
    float _3091 = _3083 + _2840;
    float _3093 = _3005 + _3033;
    float _3095 = _3089 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3097 = _3091 * 0.5;
    float _3099 = _3085 * 0.5;
    float _3101 = fma(_2886, -0.5, _3087);
    out.gl_Position.x = _2884;
    out.gl_Position.y = _2886;
    out.gl_Position.z = _3083;
    out.gl_Position.w = _2840;
    float _3103 = -_3067;
    float _3105 = _3103 + 1.0;
    float _3107 = fma(_3001, _3017, _3051);
    float _3109 = _3003 + _3027;
    out.m_86.x = _3099;
    out.m_86.y = _3101;
    out.m_86.z = _3097;
    out.m_86.w = _2840;
    float _3111 = _3105 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3113 = _3007 + _3107;
    out.m_88.x = _3081;
    out.m_88.y = _3059;
    out.m_88.z = _3065;
    out.m_90.x = _3109;
    out.m_90.y = _3093;
    out.m_90.z = _3113;
    float _3115 = -_3111;
    float _3117 = _3115 + 1.0;
    float _3119 = _2840;
    float _3121 = _3083;
    float _3123 = _2886;
    float _3125 = _3059;
    float _3127 = _3081;
    float _3129 = _3117;
    if (!_2971)
    {
        _3119 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3131 = _3119;
    float _3133 = _3131;
    float _3135 = _3131;
    if (!_2971)
    {
        _3121 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3137 = _3121;
    float _3139 = _3137;
    float _3141 = _3137;
    if (!_2971)
    {
        _3123 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3143 = _3123;
    float _3145 = _2572 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3147 = _3143;
    float _3149 = _3143;
    if (!_2971)
    {
        _3125 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3151 = _3125;
    float _3153 = _3151;
    float _3155 = _3151;
    if (!_2971)
    {
        _3127 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3157 = _3127;
    float _3159 = -_2880;
    float _3161 = _3159 + 1.0;
    float _3163 = _3161 * _3095;
    float _3165 = precise::clamp(_3163, 0.0, 1.0);
    float _3167 = -_3165;
    float _3169 = fma(_3167, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3171 = _3169 * _3063;
    float _3173 = _3171 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3175 = _3111 * _2904;
    float _3177 = _2915 * _3117;
    float _3179 = _3157;
    float _3181 = _3157;
    if (!_2971)
    {
        _3129 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3183 = _3129;
    out.m_92.x = _3173;
    float _3185 = _2915 * _3175;
    float _3187 = _2925 * _3175;
    float _3189 = fma(_2921, _3185, _2909);
    float _3191 = fma(_2923, _3185, _2911);
    float _3193 = fma(_2915, _3187, _2913);
    out.m_94.x = _3189;
    out.m_94.y = _3191;
    out.m_94.z = _3193;
    out.m_94.w = _3177;
    bool _3195 = !_2971;
    float _3197 = _3183;
    float _3199 = _3183;
    if (!_3195)
    {
        bool _3201 = _2594 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3203 = isnan(_2594);
        bool _3205 = _3201 || _3203;
        bool _3207 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3209 = _3205 || _3207;
        if (!_3209)
        {
            float _3211 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3213 = _2594 + _3211;
            float _3215 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3217 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3215;
            float _3219 = 1.0 / _3217;
            float _3221 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3223 = _3221 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3225 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3227 = _3225 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3229 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3231 = _3229 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3233 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3235 = _3233 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3237 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3239 = _3237 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3241 = _3213 * _3219;
            float _3243 = precise::clamp(_3241, 0.0, 1.0);
            float _3245 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3247 = _3245 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3249 = fma(_3243, _3223, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3251 = fma(_3243, _3247, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3253 = fma(_3243, _3227, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3255 = fma(_3243, _3231, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3257 = fma(_3243, _3235, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3259 = fma(_3243, _3239, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3181 = _3251;
            _3149 = _3257;
            _3155 = _3249;
            _3141 = _3255;
            _3135 = _3253;
            _3199 = _3259;
            _3261 = true;
        }
        else
        {
            bool _3263 = _2594 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3265 = isnan(_2594);
            bool _3267 = _3263 || _3265;
            bool _3269 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3271 = _3267 || _3269;
            if (!_3271)
            {
                _3153 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3273 = _3153;
            _3155 = _3273;
            if (!_3271)
            {
                _3179 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3275 = _3179;
            _3181 = _3275;
            if (!_3271)
            {
                _3133 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3277 = _3133;
            _3135 = _3277;
            if (!_3271)
            {
                _3139 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3279 = _3139;
            _3141 = _3279;
            if (!_3271)
            {
                _3147 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3281 = _3147;
            _3149 = _3281;
            if (!_3271)
            {
                _3197 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3283 = _3197;
            bool _3285 = !_3271;
            _3199 = _3283;
            if (!_3285)
            {
                bool _3287 = _2594 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3289 = isnan(_2594);
                bool _3291 = _3287 || _3289;
                bool _3293 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3295 = _3291 || _3293;
                if (!_3295)
                {
                    float _3297 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3299 = _2594 + _3297;
                    float _3301 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3303 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3301;
                    float _3305 = 1.0 / _3303;
                    float _3307 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3309 = _3307 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3311 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3313 = _3311 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3315 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3317 = _3315 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3319 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3321 = _3319 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3323 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3325 = _3323 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3327 = _3299 * _3305;
                    float _3329 = precise::clamp(_3327, 0.0, 1.0);
                    float _3331 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3333 = _3331 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3335 = fma(_3329, _3309, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3337 = fma(_3329, _3333, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3339 = fma(_3329, _3313, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3341 = fma(_3329, _3317, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3343 = fma(_3329, _3321, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3345 = fma(_3329, _3325, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3181 = _3337;
                    _3149 = _3343;
                    _3155 = _3335;
                    _3141 = _3341;
                    _3135 = _3339;
                    _3199 = _3345;
                    _3261 = true;
                }
                else
                {
                    _3181 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3149 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3155 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3141 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3135 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3199 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3261 = false;
    float _3347 = _3181;
    float _3349 = _3149;
    float _3351 = _3155;
    float _3353 = _3141;
    float _3355 = _3135;
    float _3357 = _3199;
    float _3359 = fma(_3093, -0.5, 0.5);
    float _3361 = precise::clamp(_3359, 0.0, 1.0);
    float _3363 = -_3347;
    float _3365 = _3363 + _3349;
    float _3367 = -_3351;
    float _3369 = _3367 + _3353;
    out.m_96.x = 0.0;
    float _3371 = fma(_3361, _3365, _3347);
    float _3373 = -_3355;
    float _3375 = _3373 + _3357;
    float _3377 = fma(_3361, _3369, _3351);
    float _3379 = _3371 * 0.586610972881317138671875;
    bool _3381 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3383 = fma(_3361, _3375, _3355);
    float _3385 = _3145 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3387 = fma(_3377, 0.298911988735198974609375, _3379);
    bool _3389 = _2572 > 0.0;
    bool _3391 = isnan(_2572);
    bool _3393 = _3389 || _3391;
    bool _3395 = isnan(0.0);
    bool _3397 = _3393 || _3395;
    float _3399 = fma(_3383, 0.114477999508380889892578125, _3387);
    out.m_53.x = _3385;
    float _3401 = -_3399;
    float _3403 = _3377 + _3401;
    float _3405 = -_3399;
    float _3407 = _3371 + _3405;
    float _3409 = -_3399;
    float _3411 = _3383 + _3409;
    float _3413 = fma(_3403, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3399);
    float _3415 = fma(_3407, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3399);
    float _3417 = fma(_3411, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3399);
    bool _3419 = !_3381;
    if (!_3419)
    {
        float _3421 = -_2512;
        float _3423 = _3421 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3425 = -_2514;
        float _3427 = _3425 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3429 = -_2516;
        float _3431 = _3429 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3433 = _3423 * _3423;
        float _3435 = fma(_3427, _3427, _3433);
        float _3437 = fma(_3431, _3431, _3435);
        float _3439 = sqrt(_3437);
        float _3441 = rsqrt(_3437);
        float _3443 = -_3439;
        float _3445 = _3443 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3447 = _3445 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3449 = precise::clamp(_3447, 0.0, 1.0);
        float _3451 = _3427 * _3441;
        float _3453 = _3423 * _3441;
        float _3455 = abs(_3449);
        float _3457 = log2(_3455);
        float _3459 = _3431 * _3441;
        float _3461 = _3451 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3463 = _3093 * _3453;
        float _3465 = -_3453;
        float _3467 = -_3461;
        float _3469 = fma(_3465, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3467);
        float _3471 = fma(_3109, _3451, _3463);
        float _3473 = -_3459;
        float _3475 = fma(_3473, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3469);
        float _3477 = fma(_3113, _3459, _3471);
        float _3479 = precise::clamp(_3477, 0.0, 1.0);
        float _3481 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3483 = _3475 + _3481;
        float _3485 = _3457 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3487 = _3483 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3489 = precise::clamp(_3487, 0.0, 1.0);
        float _3491 = exp2(_3485);
        float _3493 = _3491 * _3489;
        float _3495 = _3479 * _3493;
        float _3497 = _3495 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3499 = _3495 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3501 = _3495 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_96.x = _3497;
        out.m_96.y = _3499;
        out.m_96.z = _3501;
    }
    out.m_98.x = _3413;
    out.m_98.y = _3415;
    out.m_98.z = _3417;
    if (_3397)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _3503 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_53.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3503;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

