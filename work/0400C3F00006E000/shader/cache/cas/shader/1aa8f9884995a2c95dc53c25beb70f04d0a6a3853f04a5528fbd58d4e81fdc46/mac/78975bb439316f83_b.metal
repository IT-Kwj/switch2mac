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
    float4 m_78 [[user(locn0)]];
    float4 m_76 [[user(locn1)]];
    float4 m_51 [[user(locn2)]];
    float4 m_72 [[user(locn3)]];
    float4 m_88 [[user(locn4)]];
    float4 m_53 [[user(locn5)]];
    float4 m_57 [[user(locn6)]];
    float4 m_74 [[user(locn7)]];
    float4 m_98 [[user(locn8)]];
    float4 m_86 [[user(locn9)]];
    float4 m_84 [[user(locn10)]];
    float4 m_92 [[user(locn11)]];
    float4 m_80 [[user(locn12)]];
    float4 m_96 [[user(locn13)]];
    float4 m_94 [[user(locn14)]];
    float4 m_90 [[user(locn15)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_82 [[attribute(0)]];
    float4 m_66 [[attribute(1)]];
    float4 m_68 [[attribute(2)]];
    float4 m_70 [[attribute(3)]];
    float4 m_64 [[attribute(4)]];
    float4 m_46 [[attribute(5)]];
    float4 m_48 [[attribute(6)]];
    float4 m_55 [[attribute(7)]];
    float4 m_62 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3047 = false;
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
        float _3357 = as_type<float>(_141);
        out.gl_Position.z = _3357;
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
    float _169 = _123 * _165;
    float _171 = _169;
    if (_163)
    {
        float _173 = _167 * 5.0;
        _143 = as_type<int>(_173);
    }
    int _175 = _143;
    out.m_57.x = _155;
    if (_163)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3422 = as_type<float>(_175);
        out.gl_Position.z = _3422;
    }
    out.m_51.x = _169;
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
        _213 = _169;
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
    float _239 = 1.0 / _233;
    bool _241 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _243 = 1.0 / _229;
    bool _245 = _217 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _247 = isnan(_217);
    bool _249 = _245 || _247;
    bool _251 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _253 = _249 || _251;
    float _255 = float(_253);
    float _257 = 1.0 / _237;
    float _259 = _221 * _243;
    float _261 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _263 = _217 + _261;
    float _265 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _267 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _265;
    float _269 = _263 * _239;
    bool _271 = _217 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _273 = isnan(_217);
    bool _275 = _271 || _273;
    bool _277 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _279 = _275 || _277;
    float _281 = float(_279);
    float _283 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _285 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _283;
    float _287 = _225 * _257;
    float _289 = fma(_267, _259, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _291 = _217 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _293 = isnan(_217);
    bool _295 = _291 || _293;
    bool _297 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _299 = _295 || _297;
    float _301 = float(_299);
    float _303 = -_281;
    float _305 = _303 + 1.0;
    float _307 = fma(_285, _259, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _309 = -_255;
    float _311 = _309 + 1.0;
    float _313 = _255 * _305;
    float _315 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _317 = _315 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    bool _319 = _217 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _321 = isnan(_217);
    bool _323 = _319 || _321;
    bool _325 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _327 = _323 || _325;
    float _329 = float(_327);
    float _331 = _301 * _311;
    float _333 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _335 = _333 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _337 = -_301;
    float _339 = _337 + 1.0;
    float _341 = fma(_317, _269, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _343 = fma(_335, _269, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _345 = _329 * _339;
    float _347 = in.m_62.x;
    float _349 = in.m_62.y;
    float _351 = -_329;
    float _353 = _351 + 1.0;
    float _355 = _289 * _345;
    float _357 = _307 * _345;
    float _359 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _361 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _359;
    float _363 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _365 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _363;
    float _367 = fma(_353, (*spvDescriptorSet0.vp_c9)._m0[143].x, _355);
    float _369 = fma(_353, (*spvDescriptorSet0.vp_c9)._m0[143].y, _357);
    float _371 = fma(_361, _287, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _373 = fma(_365, _287, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _375 = fma(_343, _331, _367);
    float _377 = fma(_341, _331, _369);
    float _379 = fma(_371, _313, _375);
    float _381 = fma(_373, _313, _377);
    float _383 = fma(_281, (*spvDescriptorSet0.vp_c9)._m0[146].x, _379);
    float _385 = fma(_281, (*spvDescriptorSet0.vp_c9)._m0[146].y, _381);
    float _387 = _383 * _347;
    float _389 = _385 * _349;
    bool _391 = !_241;
    float _393 = _387;
    if (!_391)
    {
        float _395 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _397 = _155 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _399 = fma(_397, (*spvDescriptorSet0.vp_c9)._m0[11].y, _123);
        float _401 = _399 * _395;
        float _403 = floor(_401);
        float _405 = -_403;
        float _407 = _401 + _405;
        _171 = _407;
    }
    float _409 = _171;
    float _411 = in.m_55.z;
    float _413 = _155 * 2.0;
    float _415 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _417 = int(_415);
    float _419 = in.m_55.y;
    float _421 = _155 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _423 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _425 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _427 = _425 != 0;
    int _429 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _431 = _429 != 0;
    int _433 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _435 = _433 != 0;
    float _437 = in.m_64.x;
    float _439 = in.m_64.y;
    float _441 = in.m_64.z;
    float _443 = floor(_413);
    float _445 = -_423;
    float _447 = fma(_421, 2.0, _445);
    float _449 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    bool _451 = !_431;
    int _453 = _451 ? 0 : 1;
    float _455 = _165 * _123;
    bool _457 = !_427;
    int _459 = _457 ? 0 : 1;
    float _461 = -_123;
    float _463 = fma(_461, (*spvDescriptorSet0.vp_c9)._m0[76].x, _447);
    bool _465 = !_435;
    int _467 = _465 ? 0 : 1;
    float _469 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _471 = int(_469);
    float _473 = _389 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _475 = _411 * 2.0;
    bool _477 = _443 > 0.0;
    float _479 = floor(_475);
    bool _481 = _443 >= 0.0;
    bool _483 = isnan(_443);
    bool _485 = _481 || _483;
    bool _487 = isnan(0.0);
    bool _489 = _485 || _487;
    float _491 = _419 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _493 = _155 + _419;
    float _495 = _419 * 2.0;
    int _497 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _499 = _497 != 0;
    int _501 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _503 = _501 != 0;
    int _505 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _507 = _505 != 0;
    float _509 = fma(_491, -2.0, _449);
    float _511 = _493 + (-1.0);
    float _513 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _515 = log2(_513);
    bool _517 = !_503;
    int _519 = _517 ? 0 : 1;
    float _521 = _419 + _411;
    bool _523 = !_499;
    int _525 = _523 ? 0 : 1;
    float _527 = fma(_511, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _529 = !_507;
    int _531 = _529 ? 0 : 1;
    float _533 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[76].y, _509);
    bool _535 = _479 > 0.0;
    float _537 = floor(_495);
    bool _539 = _479 >= 0.0;
    bool _541 = isnan(_479);
    bool _543 = _539 || _541;
    bool _545 = isnan(0.0);
    bool _547 = _543 || _545;
    float _549 = float(_417);
    float _551 = _521 + (-1.0);
    int _553 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _555 = _553 != 0;
    int _557 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _559 = _557 != 0;
    int _561 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _563 = _561 != 0;
    int _565 = _547 ? 0 : 1;
    float _567 = fma(_551, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _569 = 1.0 / _549;
    bool _571 = !_555;
    int _573 = _571 ? 0 : 1;
    float _575 = _515 * _123;
    int _577 = ~_565;
    int _579 = _577 + 1;
    int _581 = _579 + 1;
    int _583 = abs(_573);
    int _585 = _581;
    if (!_535)
    {
        int _587 = ~_565;
        int _589 = _587 + 1;
        _585 = _589;
    }
    int _591 = _585;
    float _593 = float(_471);
    float _595 = exp2(_575);
    float _597 = float(_591);
    float _599 = float(_583);
    int _601 = _489 ? 0 : 1;
    float _603 = _569 * _123;
    bool _605 = _537 > 0.0;
    float _607 = _599 * _597;
    float _609 = 1.0 / _593;
    int _611 = ~_601;
    int _613 = _611 + 1;
    int _615 = _613 + 1;
    float _617 = _607 * (-2.0);
    bool _619 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _621 = isnan(1.0);
    bool _623 = _619 || _621;
    bool _625 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _627 = _623 || _625;
    float _629 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _631 = 1.0 + _629;
    int _633 = _615;
    if (!_477)
    {
        int _635 = ~_601;
        int _637 = _635 + 1;
        _633 = _637;
    }
    int _639 = _633;
    float _641 = -_595;
    float _643 = _641 + 1.0;
    float _645 = 1.0 / _631;
    bool _647 = _537 >= 0.0;
    bool _649 = isnan(_537);
    bool _651 = _647 || _649;
    bool _653 = isnan(0.0);
    bool _655 = _651 || _653;
    float _657 = fma(_527, _617, _527);
    bool _659 = !_559;
    int _661 = _659 ? 0 : 1;
    float _663 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _665 = _609 * _123;
    int _667 = abs(_661);
    float _669 = fma(_155, (*spvDescriptorSet0.vp_c9)._m0[78].z, _663);
    bool _671 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _673 = isnan(0.0);
    bool _675 = _671 || _673;
    bool _677 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _679 = _675 || _677;
    float _681 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _683 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[77].z, _669);
    float _685 = _679 ? _643 : 0.0;
    float _687 = fma(_419, (*spvDescriptorSet0.vp_c9)._m0[78].w, _681);
    float _689 = float(_639);
    float _691 = _419 + (-0.5);
    float _693 = float(_667);
    float _695 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[77].w, _687);
    if (_627)
    {
        float _697 = _685 * _645;
        _133 = _697;
    }
    float _699 = _133;
    int _701 = _655 ? 0 : 1;
    float _703 = fma(_617, _437, _437);
    float _705 = _693 * _689;
    float _707 = _155 + (-0.5);
    bool _709 = !_563;
    int _711 = _709 ? 0 : 1;
    float _713 = _155 + _411;
    int _715 = ~_701;
    int _717 = _715 + 1;
    int _719 = _717 + 1;
    float _721 = fma(_707, (*spvDescriptorSet0.vp_c9)._m0[196].x, _703);
    int _723 = abs(_711);
    float _725 = _705 * (-2.0);
    int _727 = _719;
    if (!_605)
    {
        int _729 = ~_701;
        int _731 = _729 + 1;
        _727 = _731;
    }
    int _733 = _727;
    float _735 = fma(_657, _699, _721);
    float _737 = float(_723);
    float _739 = fma(_725, _439, _439);
    float _741 = float(_733);
    float _743 = fma(_567, _725, _567);
    float _745 = fma(_691, (*spvDescriptorSet0.vp_c9)._m0[196].y, _739);
    float _747 = _713 + (-1.0);
    float _749 = _737 * _741;
    float _751 = _735 * 0.15915493667125701904296875;
    float _753 = fma(_743, _699, _745);
    float _755 = in.m_66.x;
    float _757 = in.m_66.y;
    float _759 = in.m_66.z;
    float _761 = in.m_66.w;
    float _763 = _749 * (-2.0);
    float _765 = fma(_747, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _767 = _411 + (-0.5);
    float _769 = in.m_46.x;
    float _771 = in.m_46.y;
    float _773 = in.m_46.z;
    float _775 = fma(_763, _441, _441);
    float _777 = fma(_765, _763, _765);
    float _779 = _753 * 0.15915493667125701904296875;
    float _781 = in.m_68.x;
    float _783 = in.m_68.y;
    float _785 = in.m_68.z;
    float _787 = in.m_68.w;
    float _789 = fma(_767, (*spvDescriptorSet0.vp_c9)._m0[196].z, _775);
    float _791 = _751 * 6.283185482025146484375;
    float _793 = sin(_791);
    float _795 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _195);
    float _797 = in.m_70.x;
    float _799 = in.m_70.y;
    float _801 = in.m_70.z;
    float _803 = in.m_70.w;
    float _805 = fma(_777, _699, _789);
    bool _807 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _809 = isnan(0.5);
    bool _811 = _807 || _809;
    bool _813 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _815 = _811 || _813;
    float _817 = _473 * _795;
    bool _819 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _821 = isnan(0.5);
    bool _823 = _819 || _821;
    bool _825 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _827 = _823 || _825;
    float _829 = _805 * 0.15915493667125701904296875;
    float _831 = _751 * 6.283185482025146484375;
    float _833 = cos(_831);
    float _835 = _779 * 6.283185482025146484375;
    float _837 = sin(_835);
    float _839 = _771 * _757;
    float _841 = _771 * _783;
    float _843 = fma(_769, _755, _839);
    float _845 = _779 * 6.283185482025146484375;
    float _847 = cos(_845);
    float _849 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _851 = _771 * _799;
    float _853 = fma(_769, _781, _841);
    float _855 = fma(_769, _797, _851);
    float _857 = fma(_773, _759, _843);
    float _859 = _829 * 6.283185482025146484375;
    float _861 = cos(_859);
    float _863 = fma(_773, _785, _853);
    float _865 = _387 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _867 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _191);
    float _869 = _793 * _837;
    float _871 = fma(_773, _801, _855);
    float _873 = _833 * _837;
    float _875 = _865 * _867;
    float _877 = _829 * 6.283185482025146484375;
    float _879 = sin(_877);
    float _881 = _833 * _847;
    float _883 = _793 * _847;
    float _885 = _863 + _787;
    float _887 = _857 + _761;
    float _889 = _871 + _803;
    float _891 = _885 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _893 = _833 * _861;
    float _895 = _793 * _861;
    float _897 = _847 * _861;
    float _899 = _837 * _861;
    float _901 = _893 * _817;
    float _903 = fma(_887, (*spvDescriptorSet0.vp_c8)._m0[11].x, _891);
    float _905 = fma(_879, _881, _869);
    float _907 = -_817;
    float _909 = _879 * _907;
    float _911 = -_883;
    float _913 = fma(_879, _873, _911);
    float _915 = -_873;
    float _917 = fma(_879, _883, _915);
    float _919 = fma(_905, _875, _901);
    float _921 = _895 * _817;
    float _923 = fma(_897, _875, _909);
    float _925 = fma(_879, _869, _881);
    float _927 = fma(_913, _849, _919);
    float _929 = fma(_917, _875, _921);
    float _931 = fma(_899, _849, _923);
    float _933 = _927 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _935 = fma(_925, _849, _929);
    float _937 = _927 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _939 = _927 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _941 = fma(_931, (*spvDescriptorSet0.vp_c8)._m0[26].x, _933);
    float _943 = fma(_931, (*spvDescriptorSet0.vp_c8)._m0[24].x, _937);
    float _945 = fma(_931, (*spvDescriptorSet0.vp_c8)._m0[25].x, _939);
    float _947 = fma(_935, (*spvDescriptorSet0.vp_c8)._m0[26].z, _941);
    float _949 = fma(_935, (*spvDescriptorSet0.vp_c8)._m0[24].z, _943);
    float _951 = fma(_935, (*spvDescriptorSet0.vp_c8)._m0[25].z, _945);
    float _953 = _947 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _955 = fma(_889, (*spvDescriptorSet0.vp_c8)._m0[11].z, _903);
    float _957 = _949 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _959 = _889 + _953;
    float _961 = _955 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _963 = _887 + _957;
    float _965 = _885 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _967 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _969 = _959 + _967;
    float _971 = 1.0 / _961;
    float _973 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _975 = _963 + _973;
    float _977 = fma(_887, (*spvDescriptorSet0.vp_c8)._m0[10].x, _965);
    float _979 = _969 * _969;
    float _981 = fma(_889, (*spvDescriptorSet0.vp_c8)._m0[10].z, _977);
    float _983 = fma(_975, _975, _979);
    float _985 = _951 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _987 = _981 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _989 = sqrt(_983);
    float _991 = _987 + _961;
    float _993 = _991 * _971;
    float _995 = _993 * 0.5;
    float _997 = _885 + _985;
    float _999 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1001 = fma(_995, (*spvDescriptorSet0.vp_c8)._m0[30].w, _999);
    float _1003 = 1.0 / _1001;
    bool _1005 = _989 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1007 = _963;
    float _1009 = _959;
    float _1011 = _921;
    float _1013 = _935;
    if (!_1005)
    {
        _393 = _997;
    }
    float _1015 = _393;
    bool _1017 = !_1005;
    float _1019 = _1015;
    if (!_1017)
    {
        float _1021 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1023 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1025 = _989 + _1023;
        float _1027 = _997 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1029 = rsqrt(_983);
        float _1031 = _1025 * _1021;
        float _1033 = _1031 * 0.15915493667125701904296875;
        float _1035 = _1033 * 6.283185482025146484375;
        float _1037 = cos(_1035);
        float _1039 = _1033 * 6.283185482025146484375;
        float _1041 = sin(_1039);
        float _1043 = _1037 + (-1.0);
        float _1045 = fma(_1041, _1027, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1047 = _1043 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1049 = _1029 * _1045;
        float _1051 = fma(_997, _1037, _1047);
        float _1053 = fma(_975, _1049, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1055 = fma(_969, _1049, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1007 = _1053;
        _1009 = _1055;
        _1019 = _1051;
    }
    float _1057 = _1007;
    float _1059 = _1009;
    float _1061 = _1019;
    float _1063 = _1061;
    float _1065 = _1057;
    float _1067 = _1059;
    if (_827)
    {
        _1011 = 1.0;
    }
    float _1069 = _1011;
    float _1071 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1073 = _1003 * _1071;
    float _1075 = _1069;
    if (!_815)
    {
        float _1077 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1079 = _885 + _1077;
        float _1081 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1083 = _887 + _1081;
        float _1085 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1087 = -_887;
        float _1089 = _1087 + _1057;
        float _1091 = _1079 * _1079;
        float _1093 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1095 = _889 + _1093;
        float _1097 = -_889;
        float _1099 = _1097 + _1059;
        float _1101 = fma(_1083, _1083, _1091);
        float _1103 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1105 = fma(_1095, _1095, _1101);
        float _1107 = sqrt(_1105);
        float _1109 = _1085 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1111 = -_885;
        float _1113 = _1111 + _1061;
        float _1115 = precise::min(_1107, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1117 = _1115 * _1103;
        float _1119 = _1109 * _1117;
        float _1121 = fma(_1113, _1119, _885);
        float _1123 = fma(_1089, _1119, _887);
        float _1125 = fma(_1099, _1119, _889);
        _1063 = _1121;
        _1065 = _1123;
        _1067 = _1125;
        _1013 = _1117;
    }
    float _1127 = _1063;
    float _1129 = _1065;
    float _1131 = _1067;
    float _1133 = _1013;
    float _1135 = _1133;
    if (!_827)
    {
        float _1137 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1139 = _1137 * 0.15915493667125701904296875;
        float _1141 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1143 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1145 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1143;
        float _1147 = _1139 * 6.283185482025146484375;
        float _1149 = cos(_1147);
        float _1151 = _1141 * 0.15915493667125701904296875;
        float _1153 = _1139 * 6.283185482025146484375;
        float _1155 = sin(_1153);
        float _1157 = 1.0 / _1149;
        float _1159 = _1151 * 6.283185482025146484375;
        float _1161 = cos(_1159);
        float _1163 = _1155 * _1157;
        float _1165 = _1151 * 6.283185482025146484375;
        float _1167 = sin(_1165);
        float _1169 = _1161 * _1163;
        float _1171 = 1.0 / _1145;
        float _1173 = 1.0 / _1169;
        float _1175 = _1167 * _1173;
        float _1177 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1179 = fma(_1073, _1175, _1177);
        float _1181 = _1179 * _1171;
        float _1183 = precise::clamp(_1181, 0.0, 1.0);
        _1135 = _1171;
        _1075 = _1183;
    }
    float _1185 = _1135;
    float _1187 = _1075;
    float _1189 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1191 = _1127 + _1189;
    float _1193 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1195 = _1129 + _1193;
    float _1197 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1199 = _1131 + _1197;
    float _1201 = _1191 * _1191;
    float _1203 = fma(_1195, _1195, _1201);
    float _1205 = fma(_887, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1207 = fma(_1199, _1199, _1203);
    float _1209 = rsqrt(_1207);
    float _1211 = sqrt(_1207);
    float _1213 = _1209 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1215 = _1195 * _1213;
    float _1217 = _1199 * _1213;
    float _1219 = _1215 * _1215;
    float _1221 = _1217 * _1217;
    float _1223 = _1219 + _1221;
    float _1225 = sqrt(_1223);
    bool _1227 = _1225 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1229 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1231 = _1225 + _1229;
    float _1233 = _1199;
    float _1235 = _1209;
    float _1237 = _1231;
    float _1239 = _1201;
    float _1241 = _1191;
    float _1243 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    float _1245 = _1223;
    if (_1227)
    {
        float _1247 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1233 = _1247;
    }
    float _1249 = _1233;
    if (_1227)
    {
        float _1251 = rsqrt(_1223);
        _1235 = _1251;
    }
    float _1253 = _1235;
    float _1255 = _1253;
    if (_1227)
    {
        float _1257 = _1231 * _1249;
        _1237 = _1257;
    }
    float _1259 = _1237;
    if (_1227)
    {
        float _1261 = _1259 * 0.15915493667125701904296875;
        _1239 = _1261;
    }
    float _1263 = _1239;
    float _1265 = _1249;
    float _1267 = _1263;
    if (_1227)
    {
        float _1269 = _1263 * 6.283185482025146484375;
        float _1271 = sin(_1269);
        _1265 = _1271;
    }
    float _1273 = _1265;
    float _1275 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1277 = precise::max(0.0, _1275);
    float _1279 = _1185;
    float _1281 = _1277;
    if (_1227)
    {
        float _1283 = _1263 * 6.283185482025146484375;
        float _1285 = cos(_1283);
        _1279 = _1285;
    }
    float _1287 = _1279;
    float _1289 = -_1213;
    float _1291 = -_1277;
    float _1293 = fma(_1191, _1289, _1291);
    if (_1227)
    {
        float _1295 = _1293 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1281 = _1295;
    }
    float _1297 = _1281;
    if (!_1227)
    {
        _1267 = _1219;
    }
    float _1299 = _1267;
    float _1301 = _1127 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1303 = _1273;
    float _1305 = _1299;
    if (_1227)
    {
        float _1307 = fma(_1273, _1297, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1303 = _1307;
    }
    float _1309 = _1303;
    float _1311 = fma(_1129, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1301);
    float _1313 = floor(_1205);
    float _1315 = _1309;
    float _1317 = _1287;
    if (_1227)
    {
        float _1319 = _1287 + (-1.0);
        _1241 = _1319;
    }
    float _1321 = _1241;
    float _1323 = _1321;
    if (_1227)
    {
        float _1325 = _1253 * _1309;
        _1243 = _1325;
    }
    float _1327 = _1243;
    if (!_1227)
    {
        _1315 = _1215;
    }
    float _1329 = _1315;
    float _1331 = fma(_1131, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1311);
    float _1333 = _1329;
    if (_1227)
    {
        float _1335 = _1321 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1245 = _1335;
    }
    float _1337 = _1245;
    if (_1227)
    {
        float _1339 = _1215 * _1327;
        _1333 = _1339;
    }
    float _1341 = _1333;
    if (!_1227)
    {
        _1323 = _1217;
    }
    float _1343 = _1323;
    float _1345 = _1343;
    if (_1227)
    {
        float _1347 = _1217 * _1327;
        _1345 = _1347;
    }
    float _1349 = _1345;
    if (!_1227)
    {
        _1255 = _1293;
    }
    float _1351 = _1255;
    float _1353 = _1351;
    if (_1227)
    {
        float _1355 = fma(_1293, _1287, _1337);
        _1353 = _1355;
    }
    float _1357 = _1353;
    if (_1227)
    {
        float _1359 = _1341 * _1341;
        _1305 = _1359;
    }
    float _1361 = _1305;
    float _1363 = _1127 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (!_1227)
    {
        _1317 = _1221;
    }
    float _1365 = _1317;
    float _1367 = _1365;
    if (_1227)
    {
        float _1369 = _1349 * _1349;
        _1367 = _1369;
    }
    float _1371 = _1367;
    float _1373 = fma(_1357, _1357, _1361);
    float _1375 = fma(_889, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1377 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1379 = _1127 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1381 = _1373 + _1371;
    float _1383 = _1127 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1385 = fma(_1129, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1363);
    float _1387 = fma(_1129, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1379);
    float _1389 = fma(_1129, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1383);
    float _1391 = rsqrt(_1381);
    float _1393 = fma(_1131, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1387);
    float _1395 = fma(_1131, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1385);
    float _1397 = fma(_1131, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1389);
    float _1399 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1401 = fma(_1211, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1399);
    float _1403 = precise::clamp(_1401, 0.0, 1.0);
    float _1405 = _1393 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1407 = _1395 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1409 = _1397 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1411 = -_1403;
    float _1413 = _1411 + 1.0;
    float _1415 = _1405 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1417 = _1407 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1419 = _1331 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1421 = abs(_1413);
    float _1423 = log2(_1421);
    float _1425 = fma(_1409, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1415);
    float _1427 = -_1417;
    float _1429 = fma(_1427, _1377, 1.0);
    float _1431 = -_1313;
    float _1433 = _1205 + _1431;
    float _1435 = _1391 * _1341;
    float _1437 = fma(_1407, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1425);
    float _1439 = _1391 * _1349;
    float _1441 = _1405 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1443 = _1435 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1445 = fma(_1419, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1437);
    float _1447 = _1391 * _1357;
    float _1449 = floor(_1375);
    float _1451 = fma(_1409, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1441);
    float _1453 = -_1443;
    float _1455 = fma(_1447, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1453);
    float _1457 = _1423 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1459 = -_1439;
    float _1461 = fma(_1459, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1455);
    float _1463 = log2(_1429);
    float _1465 = _1405 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1467 = fma(_1461, -0.5, 0.5);
    float _1469 = fma(_1461, 0.5, 0.5);
    float _1471 = fma(_1409, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1465);
    float _1473 = 1.0 / _1445;
    float _1475 = -_1449;
    float _1477 = _1375 + _1475;
    float _1479 = fma(_1469, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1481 = fma(_1407, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1471);
    float _1483 = fma(_1407, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1451);
    float _1485 = _1447 + 1.0;
    float _1487 = fma(_1469, _1479, -0.212114393711090087890625);
    float _1489 = fma(_1419, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1481);
    float _1491 = sqrt(_1467);
    float _1493 = fma(_1419, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1483);
    float _1495 = _1463 * 0.693147182464599609375;
    float _1497 = fma(_1469, _1487, 1.570728778839111328125);
    float _1499 = _1495 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1501 = exp2(_1457);
    float _1503 = _1489 * _1473;
    float _1505 = _1493 * _1473;
    float _1507 = fma(_1503, 0.5, 0.5);
    float _1509 = fma(_1505, -0.5, 0.5);
    float _1511 = _1491 * 0.636619746685028076171875;
    float2 _5489 = float2(_1433, _1477);
    float _1513 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5489, float2(0.0), isnan(_5489)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5489, float2(0.0), isnan(_5489)), level(0.0)).x;
    float3 _5500 = float3(_1507, _1509, _1499);
    float _1515 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5500, float3(0.0), isnan(_5500)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5500, float3(0.0), isnan(_5500)), level(0.0)).x;
    float _1517 = -_1447;
    float _1519 = fma(_1501, _1485, _1517);
    float _1521 = -_1497;
    float _1523 = fma(_1511, _1521, 1.0);
    float _1525 = fma(_1519, 0.5, 0.5);
    float3 _5524 = float3(_1507, _1509, _1499);
    float4 _1528 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5524, float3(0.0), isnan(_5524)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5524, float3(0.0), isnan(_5524)), level(0.0)).xyzw;
    float _1530 = _1528.x;
    float _1532 = _1528.y;
    float _1534 = _1528.z;
    float _1536 = _1528.w;
    float2 _5540 = float2(_1523, _1525);
    float3 _1540 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5540, float2(0.0), isnan(_5540)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5540, float2(0.0), isnan(_5540)), level(0.0)).xyz;
    float _1542 = _1540.x;
    float _1544 = _1540.y;
    float _1546 = _1540.z;
    float _1548 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1550 = int(_1548);
    out.m_72.x = _865;
    bool _1552 = _155 > 0.5;
    float _1554 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1556 = _409 + _1554;
    int _1558 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1560 = _1558 != 0;
    float _1562 = -_695;
    float _1564 = _1562 + 1.0;
    float _1566 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _1568 = int(_1566);
    float _1570 = _1423 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1572 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1574 = _1572 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    int _1576 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1578 = _1576 != 0;
    float _1580 = _1405 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _1582 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1584 = _1582 != 0;
    float _1586 = trunc(_603);
    int _1588 = int(_1586);
    float _1590 = float(uint(_1550));
    float _1592 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1594 = _1592 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1596 = _1507;
    float _1598 = _1477;
    float _1600 = (*spvDescriptorSet0.vp_c9)._m0[7].z;
    float _1602 = _1445;
    if (_1560)
    {
        _1596 = _155;
    }
    float _1604 = _1596;
    float _1606 = fma(_1409, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1580);
    float _1608 = _1604;
    if (!_1560)
    {
        _1608 = _411;
    }
    float _1610 = _1608;
    if (_1560)
    {
        _1598 = 1.0;
    }
    float _1612 = _1598;
    float _1614 = 1.0 / _1590;
    float _1616 = float(uint(_1568));
    float _1618 = _1612;
    if (_1560)
    {
        _1600 = 1.0;
    }
    float _1620 = _1600;
    float _1622 = _1620;
    if (!_1560)
    {
        _1618 = 7.345489978790283203125;
    }
    float _1624 = _1618;
    if (!_1560)
    {
        _1622 = 5.839270114898681640625;
    }
    float _1626 = _1622;
    float _1628 = 1.0 / _1616;
    float _1630 = float(uint(_1588));
    int _1632 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1634 = _1632 != 0;
    float _1636 = _1626 * _1610;
    int _1638 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _1640 = _1638 != 0;
    int _1642 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1644 = _1642 != 0;
    float _1646 = trunc(_665);
    int _1648 = int(_1646);
    float _1650 = -_191;
    int _1652 = _1552 ? as_type<int>(_1650) : as_type<int>(_191);
    bool _1654 = _419 > 0.5;
    bool _1656 = !_1578;
    float _1658 = _1656 ? _191 : as_type<float>(_1652);
    float _1660 = _191 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1662 = -_195;
    int _1664 = _1654 ? as_type<int>(_1662) : as_type<int>(_195);
    float _1666 = 1.0 / _1574;
    int _1668 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1670 = _1668 != 0;
    int _1672 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _1674 = _1672 != 0;
    int _1676 = as_type<int>(_1614) + (-2);
    float _1678 = 1.0 / _1594;
    int _1680 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _1682 = _1680 != 0;
    float _1684 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1686 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1684;
    float _1688 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1690 = _1688 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1692 = as_type<float>(_1676) * _1630;
    int _1694 = as_type<int>(_1628) + (-2);
    float _1696 = float(uint(_1648));
    float _1698 = _1686 * _1666;
    float _1700 = trunc(_1692);
    float _1702 = precise::max(_1700, 0.0);
    uint _1705 = uint(_1702);
    float _1707 = as_type<float>(_1694) * _1696;
    int _1709 = ~_1550;
    int _1711 = _1709 + 1;
    float _1713 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1715 = _1713 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1717 = fma(_1698, _1556, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1719 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1721 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _1719;
    float _1723 = _1624 * _155;
    float _1725 = trunc(_1707);
    float _1727 = precise::max(_1725, 0.0);
    uint _1729 = uint(_1727);
    int _1731 = ~_1568;
    int _1733 = _1731 + 1;
    float _1735 = _1721 * _1678;
    bool _1737 = _409 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1739 = isnan(_409);
    bool _1741 = _1737 || _1739;
    bool _1743 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1745 = _1741 || _1743;
    float _1747 = float(_1745);
    bool _1749 = _409 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1751 = isnan(_409);
    bool _1753 = _1749 || _1751;
    bool _1755 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1757 = _1753 || _1755;
    float _1759 = float(_1757);
    float _1761 = 1.0 / _1715;
    int _1763 = _1711 * int(_1705);
    int _1765 = _1763 + _1588;
    int _1767 = ~_1568;
    int _1769 = _1767 + 1;
    float _1771 = float(_1588);
    float _1773 = float(uint(_1765));
    int _1775 = _1733 * int(_1729);
    int _1777 = _1775 + _1648;
    bool _1779 = _409 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1781 = isnan(_409);
    bool _1783 = _1779 || _1781;
    bool _1785 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1787 = _1783 || _1785;
    float _1789 = float(_1787);
    float _1791 = floor(_1723);
    float _1793 = as_type<float>(_1676) * _1773;
    float _1795 = -_1759;
    float _1797 = _1795 + 1.0;
    float _1799 = float(uint(_1777));
    int _1801 = abs(_519);
    float _1803 = _1690 * _1761;
    float _1805 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1807 = _409 + _1805;
    float _1809 = as_type<float>(_1694) * _1799;
    float _1811 = trunc(_1793);
    float _1813 = precise::max(_1811, 0.0);
    uint _1815 = uint(_1813);
    float _1817 = float(_1648);
    float _1819 = fma(_1803, _1807, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1821 = -_1747;
    float _1823 = _1821 + 1.0;
    bool _1825 = _409 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1827 = isnan(_409);
    bool _1829 = _1825 || _1827;
    bool _1831 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1833 = _1829 || _1831;
    float _1835 = float(_1833);
    float _1837 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1839 = _409 + _1837;
    int _1841 = abs(_525);
    float _1843 = _1759 * _1823;
    float _1845 = trunc(_1809);
    float _1847 = precise::max(_1845, 0.0);
    uint _1849 = uint(_1847);
    float _1851 = _1789 * _1797;
    float _1853 = -_1789;
    float _1855 = _1853 + 1.0;
    bool _1857 = !_1644;
    float _1859 = _1857 ? _195 : as_type<float>(_1664);
    float _1861 = fma(_1735, _1839, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _1863 = _1658 + 0.5;
    float _1865 = _1835 * _1855;
    int _1867 = ~_1550;
    int _1869 = _1867 + 1;
    float _1871 = _1859 + (-0.5);
    int _1873 = int(_1705) + int(_1815);
    float _1875 = fma(_1863, (*spvDescriptorSet0.vp_c9)._m0[80].x, _463);
    float _1877 = -_1871;
    float _1879 = -_533;
    float _1881 = fma(_1877, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1879);
    float _1883 = floor(_1636);
    float _1885 = float(_1550);
    float _1887 = _1717 * _1865;
    int _1889 = int(_1729) + int(_1849);
    int _1891 = _1869 * _1873;
    int _1893 = _1891 + _1588;
    float _1895 = -_1791;
    float _1897 = _1723 + _1895;
    float _1899 = -_1835;
    float _1901 = _1899 + 1.0;
    bool _1903 = _1771 >= _1885;
    bool _1905 = isnan(_1771);
    bool _1907 = _1903 || _1905;
    bool _1909 = isnan(_1885);
    bool _1911 = _1907 || _1909;
    float _1913 = float(_1911);
    float _1915 = fma(_1859, _1564, _1881);
    bool _1917 = uint(_1893) >= uint(_1550);
    int _1919 = _1769 * _1889;
    int _1921 = _1919 + _1648;
    float _1923 = fma(_1901, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1887);
    float _1925 = _1897 * _1885;
    bool _1927 = !_1917;
    int _1929 = _1927 ? 0 : (-1);
    float _1931 = trunc(_1913);
    int _1933 = int(_1931);
    bool _1935 = uint(_1921) >= uint(_1568);
    float _1937 = fma(_1819, _1851, _1923);
    float _1939 = float(_1568);
    float _1941 = -_1883;
    float _1943 = _1636 + _1941;
    bool _1945 = !_1935;
    int _1947 = _1945 ? 0 : (-1);
    float _1949 = _1885 * _455;
    int _1951 = ~_1873;
    int _1953 = _1951 + _1929;
    int _1955 = _1953 + 1;
    float _1957 = trunc(_1925);
    int _1959 = int(_1957);
    int _1961 = ~_1889;
    int _1963 = _1961 + _1947;
    int _1965 = _1963 + 1;
    float _1967 = _1939 * _455;
    bool _1969 = !_1584;
    int _1971 = _1969 ? 0 : 1;
    float _1973 = _1943 * _1939;
    bool _1975 = _1817 >= _1939;
    bool _1977 = isnan(_1817);
    bool _1979 = _1975 || _1977;
    bool _1981 = isnan(_1939);
    bool _1983 = _1979 || _1981;
    float _1985 = float(_1983);
    float _1987 = fma(_1861, _1843, _1937);
    int _1989 = abs(_1971);
    int _1991 = _1550 * _1955;
    int _1993 = _1991 + _1588;
    bool _1995 = !_1682;
    int _1997 = _1995 ? 0 : 1;
    float _1999 = trunc(_1985);
    int _2001 = int(_1999);
    bool _2003 = _1550 == 0;
    int _2005 = _1568 * _1965;
    int _2007 = _2005 + _1648;
    int _2009 = abs(_1997);
    float _2011 = fma(_1747, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1987);
    int _2013 = ~_1933;
    int _2015 = _2013 + 1;
    int _2017 = _2015 + 1;
    bool _2019 = !_2003;
    int _2021 = _2019 ? _1993 : (-1);
    float _2023 = trunc(_1973);
    int _2025 = int(_2023);
    int _2027 = _1550 + (-1);
    bool _2029 = _1568 == 0;
    int _2031 = _2021 * _2017;
    int _2033 = _1959 * _1989;
    int _2035 = _2033 + _1588;
    bool _2037 = !_2029;
    int _2039 = _2037 ? _2007 : (-1);
    float _2041 = trunc(_1949);
    int _2043 = int(_2041);
    int _2045 = _1933 * _2027;
    int _2047 = _2045 + _2031;
    int _2049 = abs(_453);
    int _2051 = ~_2001;
    int _2053 = _2051 + 1;
    int _2055 = _2053 + 1;
    float _2057 = float(uint(_2035));
    int _2059 = _2047 * _2049;
    int _2061 = abs(_459);
    int _2063 = _2025 * _2009;
    int _2065 = _2063 + _1648;
    float _2067 = trunc(_1967);
    int _2069 = int(_2067);
    int _2071 = _1568 + (-1);
    int _2073 = _2039 * _2055;
    float _2075 = as_type<float>(_1676) * _2057;
    int _2077 = _2043 * _2061;
    int _2079 = _2077 + _2059;
    float _2081 = float(uint(_2065));
    int _2083 = _2001 * _2071;
    int _2085 = _2083 + _2073;
    float _2087 = exp2(_1570);
    int _2089 = _2085 * _1801;
    float _2091 = as_type<float>(_1694) * _2081;
    int _2093 = abs(_467);
    float _2095 = trunc(_2075);
    float _2097 = precise::max(_2095, 0.0);
    uint _2099 = uint(_2097);
    int _2101 = ~_1550;
    int _2103 = _2101 + 1;
    int _2105 = _2069 * _1841;
    int _2107 = _2105 + _2089;
    bool _2109 = !_1670;
    int _2111 = _2109 ? 0 : 1;
    int _2113 = _2035 * _2093;
    int _2115 = _2113 + _2079;
    int _2117 = abs(_531);
    float _2119 = trunc(_2091);
    float _2121 = precise::max(_2119, 0.0);
    uint _2123 = uint(_2121);
    int _2125 = abs(_2111);
    float _2127 = -_2087;
    float _2129 = _2127 + 1.0;
    int _2131 = ~_1568;
    int _2133 = _2131 + 1;
    int _2135 = _2065 * _2117;
    int _2137 = _2135 + _2107;
    bool _2139 = !_1674;
    int _2141 = _2139 ? 0 : 1;
    int _2143 = _1959 * _2125;
    int _2145 = _2143 + _2115;
    int _2147 = _2103 * int(_2099);
    int _2149 = _2147 + _2035;
    int _2151 = ~_1550;
    int _2153 = _2151 + 1;
    float _2155 = _2129 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2157 = float(uint(_2145));
    float _2159 = float(uint(_2149));
    int _2161 = abs(_2141);
    float _2163 = -_683;
    float _2165 = _2163 + 1.0;
    int _2167 = _2133 * int(_2123);
    int _2169 = _2167 + _2065;
    float _2171 = as_type<float>(_1676) * _2159;
    int _2173 = _2025 * _2161;
    int _2175 = _2173 + _2137;
    float _2177 = as_type<float>(_1676) * _2157;
    float _2179 = -_2165;
    float _2181 = fma(_1658, _2179, _1875);
    float _2183 = float(uint(_2169));
    float _2185 = trunc(_2171);
    float _2187 = precise::max(_2185, 0.0);
    uint _2189 = uint(_2187);
    float _2191 = as_type<float>(_1694) * _2183;
    float _2193 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    out.m_74.x = _2181;
    out.m_74.y = _1915;
    float _2195 = trunc(_2177);
    float _2197 = precise::max(_2195, 0.0);
    uint _2199 = uint(_2197);
    float _2201 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2203 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2205 = _2193 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2207 = _2201 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2209 = _2203 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2211 = trunc(_2191);
    float _2213 = precise::max(_2211, 0.0);
    uint _2215 = uint(_2213);
    float _2217 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2219 = float(uint(_2175));
    int _2221 = ~_1568;
    int _2223 = _2221 + 1;
    int _2225 = int(_2099) + int(_2189);
    out.m_76.x = _2205;
    out.m_76.y = _2207;
    out.m_76.z = _2209;
    out.m_76.w = _2217;
    float _2227 = abs(_1073);
    float _2229 = log2(_2227);
    int _2231 = _2153 * int(_2199);
    int _2233 = _2231 + _2145;
    float _2235 = as_type<float>(_1694) * _2219;
    float _2237 = float(uint(_2233));
    int _2239 = int(_2123) + int(_2215);
    float _2241 = trunc(_2235);
    float _2243 = precise::max(_2241, 0.0);
    uint _2245 = uint(_2243);
    float _2247 = as_type<float>(_1676) * _2237;
    float _2249 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    int _2251 = ~_1550;
    int _2253 = _2251 + 1;
    float _2255 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2257 = _2229 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2259 = trunc(_2247);
    float _2261 = precise::max(_2259, 0.0);
    uint _2263 = uint(_2261);
    int _2265 = _2253 * _2225;
    int _2267 = _2265 + _2035;
    float _2269 = _2249 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2271 = _2255 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2273 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2275 = _2011 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    bool _2277 = uint(_2267) >= uint(_1550);
    int _2279 = _2223 * int(_2245);
    int _2281 = _2279 + _2175;
    float _2283 = exp2(_2257);
    float _2285 = _2273 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2287 = -_1513;
    float _2289 = _2287 + 1.0;
    float _2291 = float(uint(_2281));
    float _2293 = _2155 * _1515;
    out.m_78.x = _2269;
    out.m_78.y = _2271;
    out.m_78.z = _2285;
    out.m_78.w = _2275;
    int _2295 = int(_2199) + int(_2263);
    float _2297 = _893 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2299 = as_type<float>(_1694) * _2291;
    int _2301 = ~_1568;
    int _2303 = _2301 + 1;
    float _2305 = trunc(_2299);
    float _2307 = precise::max(_2305, 0.0);
    uint _2309 = uint(_2307);
    int _2311 = _2303 * _2239;
    int _2313 = _2311 + _2065;
    float _2315 = fma(_2283, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2317 = precise::clamp(_2315, 0.0, 1.0);
    int _2319 = ~_1550;
    int _2321 = _2319 + 1;
    float _2323 = _893 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2325 = _893 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2327 = -_879;
    float _2329 = fma(_2327, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2297);
    int _2331 = ~_1568;
    int _2333 = _2331 + 1;
    float _2335 = -_879;
    float _2337 = fma(_2335, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2323);
    int _2339 = _2321 * _2295;
    int _2341 = _2339 + _2145;
    float _2343 = -_879;
    float _2345 = fma(_2343, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2325);
    bool _2347 = uint(_2313) >= uint(_1568);
    float _2349 = fma(_2317, -2.0, 3.0);
    int _2351 = int(_2245) + int(_2309);
    float _2353 = _2317 * _2317;
    bool _2355 = uint(_2341) >= uint(_1550);
    float _2357 = fma(_895, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2345);
    float _2359 = _905 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2361 = _2333 * _2351;
    int _2363 = _2361 + _2175;
    bool _2365 = !_2355;
    int _2367 = _2365 ? 0 : (-1);
    float _2369 = fma(_895, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2337);
    float _2371 = _905 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2373 = _913 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    bool _2375 = uint(_2363) >= uint(_1568);
    float _2377 = fma(_897, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2359);
    int _2379 = ~_2295;
    int _2381 = _2379 + _2367;
    int _2383 = _2381 + 1;
    float _2385 = fma(_897, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2371);
    bool _2387 = !_2375;
    int _2389 = _2387 ? 0 : (-1);
    float _2391 = _2353 * _2349;
    float _2393 = fma(_899, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2373);
    int _2395 = _1550 * _2383;
    int _2397 = _2395 + _2145;
    int _2399 = ~_2351;
    int _2401 = _2399 + _2389;
    int _2403 = _2401 + 1;
    float _2405 = _913 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _2407 = !_2347;
    int _2409 = _2407 ? 0 : (-1);
    float _2411 = -_2391;
    float _2413 = _2411 + 1.0;
    float _2415 = _913 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2417 = _1568 * _2403;
    int _2419 = _2417 + _2175;
    bool _2421 = !_2003;
    int _2423 = _2421 ? _2397 : (-1);
    float _2425 = fma(_899, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2405);
    int _2427 = ~_2239;
    int _2429 = _2427 + _2409;
    int _2431 = _2429 + 1;
    float _2433 = fma(_925, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2393);
    bool _2435 = !_2029;
    int _2437 = _2435 ? _2419 : (-1);
    float _2439 = fma(_2413, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2391);
    bool _2441 = !_2277;
    int _2443 = _2441 ? 0 : (-1);
    float _2445 = _905 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2447 = _2423 >> 31;
    float _2449 = fma(_899, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2415);
    int _2451 = _2437 >> 31;
    float _2453 = fma(_895, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2329);
    int _2455 = ~_2225;
    int _2457 = _2455 + _2443;
    int _2459 = _2457 + 1;
    float _2461 = _195 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _2463 = _2447 & 3;
    float _2465 = fma(_897, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2445);
    int _2467 = _2451 & 3;
    int _2469 = _1550 * _2459;
    int _2471 = _2469 + _2035;
    int _2473 = _2423 + _2463;
    int _2475 = _1568 * _2431;
    int _2477 = _2475 + _2065;
    int _2479 = _2437 + _2467;
    float _2481 = _2461 * _2369;
    int _2483 = _2423 & 3;
    bool _2485 = _2483 != 0;
    float _2487 = fma(_925, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2425);
    int _2489 = _2473 >> 2;
    float _2491 = fma(_925, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2449);
    int _2493 = _2423 & 3;
    bool _2495 = _2493 != 0;
    float _2497 = fma(_917, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2377);
    int _2499 = _2479 >> 2;
    int _2501 = _2489 << 4;
    int _2503 = _2501 + 368;
    float _2505 = fma(_917, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2385);
    bool _2507 = uint(_2493) >= 2u;
    int _2509 = _2499 << 4;
    int _2511 = _2509 + 656;
    uint _2513 = uint(int(uint(_2503) >> uint(2)));
    uint _2515 = uint(int(uint(int(_2513)) >> uint(2)));
    int _2517 = int(_2513) & 3;
    float _2519 = (*spvDescriptorSet0.vp_c9)._m0[int(_2515)][_2517];
    int _2521 = int(_2513) + 1;
    uint _2523 = uint(int(uint(_2521) >> uint(2)));
    int _2525 = _2521 & 3;
    float _2527 = (*spvDescriptorSet0.vp_c9)._m0[int(_2523)][_2525];
    int _2529 = _2507 ? 0 : 1;
    float _2531 = fma(_1660, _2505, _2481);
    int _2533 = _2485 ? 0 : 1;
    float _2535 = fma(_917, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2465);
    bool _2537 = _2493 != 3;
    bool _2539 = uint(_2493) > 1u;
    uint _2541 = uint(int(uint(_2511) >> uint(2)));
    uint _2543 = uint(int(uint(int(_2541)) >> uint(2)));
    int _2545 = int(_2541) & 3;
    float _2547 = (*spvDescriptorSet0.vp_c9)._m0[int(_2543)][_2545];
    int _2549 = int(_2541) + 1;
    uint _2551 = uint(int(uint(_2549) >> uint(2)));
    int _2553 = _2549 & 3;
    float _2555 = (*spvDescriptorSet0.vp_c9)._m0[int(_2551)][_2553];
    int _2557 = ~_2529;
    int _2559 = _2557 + 1;
    int _2561 = _2559 + 1;
    out.m_80.x = _2505;
    out.m_80.y = _2497;
    out.m_80.z = _2535;
    int _2563 = ~_2533;
    int _2565 = _2563 + 1;
    int _2567 = _2565 + 1;
    bool _2569 = !_2495;
    int _2571 = _2569 ? 0 : 1;
    bool _2573 = _1073 <= 8000.0;
    bool _2575 = isnan(_1073);
    bool _2577 = _2573 || _2575;
    bool _2579 = isnan(8000.0);
    bool _2581 = _2577 || _2579;
    float _2583 = float(_2581);
    int _2585 = _2503 + 8;
    uint _2587 = uint(int(uint(_2585) >> uint(2)));
    uint _2589 = uint(int(uint(int(_2587)) >> uint(2)));
    int _2591 = int(_2587) & 3;
    float _2593 = (*spvDescriptorSet0.vp_c9)._m0[int(_2589)][_2591];
    int _2595 = int(_2587) + 1;
    uint _2597 = uint(int(uint(_2595) >> uint(2)));
    int _2599 = _2595 & 3;
    float _2601 = (*spvDescriptorSet0.vp_c9)._m0[int(_2597)][_2599];
    bool _2603 = !_2029;
    int _2605 = _2603 ? _2477 : (-1);
    int _2607 = _2561;
    int _2609 = _2567;
    if (_2537)
    {
        int _2611 = ~_2529;
        int _2613 = _2611 + 1;
        _2607 = _2613;
    }
    int _2615 = _2607;
    float _2617 = _2461 * _2453;
    if (!_2539)
    {
        int _2619 = ~_2533;
        int _2621 = _2619 + 1;
        _2609 = _2621;
    }
    int _2623 = _2609;
    float _2625 = _2583 * _2439;
    int _2627 = _2437 & 3;
    bool _2629 = _2627 != 0;
    int _2631 = _2437 & 3;
    bool _2633 = _2631 != 0;
    float _2635 = _2461 * _2357;
    bool _2637 = uint(_2627) > 1u;
    float _2639 = _2625 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    int _2641 = _2633 ? 0 : 1;
    float _2643 = fma(_1660, _2497, _2635);
    bool _2645 = !_2629;
    int _2647 = _2645 ? 0 : 1;
    int _2649 = _2511 + 8;
    uint _2651 = uint(int(uint(_2649) >> uint(2)));
    uint _2653 = uint(int(uint(int(_2651)) >> uint(2)));
    int _2655 = int(_2651) & 3;
    float _2657 = (*spvDescriptorSet0.vp_c9)._m0[int(_2653)][_2655];
    int _2659 = int(_2651) + 1;
    uint _2661 = uint(int(uint(_2659) >> uint(2)));
    int _2663 = _2659 & 3;
    float _2665 = (*spvDescriptorSet0.vp_c9)._m0[int(_2661)][_2663];
    float _2667 = fma(_1660, _2535, _2617);
    bool _2669 = uint(_2627) >= 2u;
    float _2671 = _2289 * _2639;
    float _2673 = precise::clamp(_2671, 0.0, 1.0);
    int _2675 = ~_2641;
    int _2677 = _2675 + 1;
    int _2679 = _2677 + 1;
    int _2681 = abs(_2623);
    int _2683 = _2679;
    if (!_2637)
    {
        int _2685 = ~_2641;
        int _2687 = _2685 + 1;
        _2683 = _2687;
    }
    int _2689 = _2683;
    int _2691 = _2669 ? 0 : 1;
    bool _2693 = _2493 != 3;
    int _2695 = abs(_2689);
    int _2697 = abs(_2571);
    bool _2699 = _2627 != 3;
    int _2701 = ~_2681;
    int _2703 = _2701 + 1;
    int _2705 = _2703 + 1;
    int _2707 = ~_2695;
    int _2709 = _2707 + 1;
    int _2711 = _2709 + 1;
    int _2713 = abs(_2647);
    int _2715 = _2705 * as_type<int>(_2527);
    int _2717 = abs(_2615);
    int _2719 = _2711 * as_type<int>(_2555);
    int _2721 = ~_2697;
    int _2723 = _2721 + 1;
    int _2725 = _2723 + 1;
    int _2727 = ~_2717;
    int _2729 = _2727 + 1;
    int _2731 = _2729 + 1;
    int _2733 = _2725 * as_type<int>(_2519);
    int _2735 = _2733 + _2715;
    int _2737 = ~_2691;
    int _2739 = _2737 + 1;
    int _2741 = _2739 + 1;
    float _2743 = fma(_2461, _2461, 1.0);
    int _2745 = _2741;
    if (_2699)
    {
        int _2747 = ~_2691;
        int _2749 = _2747 + 1;
        _2745 = _2749;
    }
    int _2751 = _2745;
    int _2753 = _2731 * as_type<int>(_2593);
    int _2755 = _2753 + _2735;
    int _2757 = ~_2713;
    int _2759 = _2757 + 1;
    int _2761 = _2759 + 1;
    float _2763 = fma(_1407, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1606);
    bool _2765 = !_2693;
    int _2767 = _2765 ? 0 : (-1);
    float _2769 = rsqrt(_2743);
    bool _2771 = _2627 != 3;
    int _2773 = _2761 * as_type<int>(_2547);
    int _2775 = _2773 + _2719;
    int _2777 = abs(_2751);
    float _2779 = fma(_1419, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2763);
    bool _2781 = !_1634;
    int _2783 = _2781 ? 0 : 1;
    int _2785 = abs(_2767);
    bool _2787 = !_2771;
    int _2789 = _2787 ? 0 : (-1);
    out.gl_Position.x = _1489;
    out.gl_Position.y = _1493;
    out.gl_Position.z = _2779;
    out.gl_Position.w = _1445;
    bool _2791 = !_1640;
    int _2793 = _2791 ? 0 : 1;
    int _2795 = abs(_2783);
    int _2797 = abs(_2789);
    int _2799 = ~_2777;
    int _2801 = _2799 + 1;
    int _2803 = _2801 + 1;
    int _2805 = abs(_2793);
    int _2807 = ~_2785;
    int _2809 = _2807 + 1;
    int _2811 = _2809 + 1;
    int _2813 = _2803 * as_type<int>(_2657);
    int _2815 = _2813 + _2775;
    int _2817 = ~_2797;
    int _2819 = _2817 + 1;
    int _2821 = _2819 + 1;
    float _2823 = _2461 * _2769;
    int _2825 = _2811 * as_type<int>(_2601);
    int _2827 = _2825 + _2755;
    int _2829 = _2821 * as_type<int>(_2665);
    int _2831 = _2829 + _2815;
    int _2833 = ~_2795;
    int _2835 = _2833 + 1;
    int _2837 = _2835 + 1;
    float _2839 = -_2491;
    float _2841 = _2823 * _2839;
    int _2843 = ~_2805;
    int _2845 = _2843 + 1;
    int _2847 = _2845 + 1;
    float _2849 = _2779 + _1445;
    bool _2851 = !_2003;
    int _2853 = _2851 ? _2471 : (-1);
    int _2855 = _2827 * _2837;
    float _2857 = -_2433;
    float _2859 = _2823 * _2857;
    int _2861 = _2831 * _2847;
    float _2863 = -_2487;
    float _2865 = _2823 * _2863;
    int _2867 = _2853 * _2795;
    int _2869 = _2867 + _2855;
    float _2871 = _1489 + _1445;
    int _2873 = _2605 * _2805;
    int _2875 = _2873 + _2861;
    float _2877 = fma(_2769, _2369, _2865);
    float _2879 = fma(_2769, _2357, _2859);
    float _2881 = in.m_82.x;
    float _2883 = fma(_2769, _2453, _2841);
    float _2885 = _1445 * 0.5;
    float _2887 = float(_2869);
    float _2889 = _1546 * _2293;
    float _2891 = -_2155;
    float _2893 = _2891 + 1.0;
    out.m_84.x = _2877;
    out.m_84.y = _2879;
    out.m_84.z = _2883;
    float _2895 = fma(_1493, -0.5, _2885);
    float _2897 = _1536 * _2293;
    out.m_86.x = _2887;
    float _2899 = _2849 * 0.5;
    float _2901 = _2871 * 0.5;
    float _2903 = float(_2875);
    float _2905 = _2487 + _2531;
    float _2907 = _2433 + _2643;
    float _2909 = _2491 + _2667;
    float _2911 = fma(_1542, _2897, _1530);
    float _2913 = fma(_1544, _2897, _1532);
    float _2915 = _1536 * _2893;
    float _2917 = fma(_1536, _2889, _1534);
    out.m_88.x = _2901;
    out.m_88.y = _2895;
    out.m_88.z = _2899;
    out.m_88.w = _1445;
    float _2919 = -_2673;
    float _2921 = fma(_2919, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    bool _2923 = _1211 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2925 = isnan(_1211);
    bool _2927 = _2923 || _2925;
    bool _2929 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2931 = _2927 || _2929;
    float _2933 = _1187 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_86.z = _2903;
    float _2935 = _2921 * _2881;
    out.m_90.x = _2911;
    out.m_90.y = _2913;
    out.m_90.z = _2917;
    out.m_90.w = _2915;
    float _2937 = _2935 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_92.x = _2905;
    out.m_92.y = _2907;
    out.m_92.z = _2909;
    float _2939 = _2879;
    float _2941 = (*spvDescriptorSet0.vp_c15)._m0[653].y;
    float _2943 = _2779;
    float _2945 = _2897;
    float _2947 = _2893;
    if (!_2931)
    {
        _2939 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2949 = _2939;
    out.m_94.x = _2937;
    float _2951 = _2949;
    float _2953 = _2949;
    if (!_2931)
    {
        _2941 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2955 = _2941;
    float _2957 = _2955;
    float _2959 = _2955;
    if (!_2931)
    {
        _1602 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2961 = _1602;
    float _2963 = _2961;
    float _2965 = _2961;
    if (!_2931)
    {
        _2943 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2967 = _2943;
    float _2969 = _2967;
    float _2971 = _2967;
    if (!_2931)
    {
        _2945 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2973 = _2945;
    float _2975 = _2973;
    float _2977 = _2973;
    if (!_2931)
    {
        _2947 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2979 = _2947;
    bool _2981 = !_2931;
    float _2983 = _2979;
    float _2985 = _2979;
    if (!_2981)
    {
        bool _2987 = _1211 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2989 = isnan(_1211);
        bool _2991 = _2987 || _2989;
        bool _2993 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2995 = _2991 || _2993;
        if (!_2995)
        {
            float _2997 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2999 = _1211 + _2997;
            float _3001 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3003 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3001;
            float _3005 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3007 = _3005 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3009 = 1.0 / _3003;
            float _3011 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3013 = _3011 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3015 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3017 = _3015 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3019 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3021 = _3019 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3023 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3025 = _3023 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3027 = _2999 * _3009;
            float _3029 = precise::clamp(_3027, 0.0, 1.0);
            float _3031 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3033 = _3031 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3035 = fma(_3029, _3007, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3037 = fma(_3029, _3033, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3039 = fma(_3029, _3013, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3041 = fma(_3029, _3017, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3043 = fma(_3029, _3021, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3045 = fma(_3029, _3025, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2959 = _3039;
            _2977 = _3043;
            _2953 = _3035;
            _2971 = _3041;
            _2965 = _3037;
            _2985 = _3045;
            _3047 = true;
        }
        else
        {
            bool _3049 = _1211 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3051 = isnan(_1211);
            bool _3053 = _3049 || _3051;
            bool _3055 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3057 = _3053 || _3055;
            if (!_3057)
            {
                _2951 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3059 = _2951;
            _2953 = _3059;
            if (!_3057)
            {
                _2957 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3061 = _2957;
            _2959 = _3061;
            if (!_3057)
            {
                _2963 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3063 = _2963;
            _2965 = _3063;
            if (!_3057)
            {
                _2969 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3065 = _2969;
            _2971 = _3065;
            if (!_3057)
            {
                _2975 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3067 = _2975;
            _2977 = _3067;
            if (!_3057)
            {
                _2983 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3069 = _2983;
            bool _3071 = !_3057;
            _2985 = _3069;
            if (!_3071)
            {
                bool _3073 = _1211 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3075 = isnan(_1211);
                bool _3077 = _3073 || _3075;
                bool _3079 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3081 = _3077 || _3079;
                if (!_3081)
                {
                    float _3083 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3085 = _1211 + _3083;
                    float _3087 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3089 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3087;
                    float _3091 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3093 = _3091 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3095 = 1.0 / _3089;
                    float _3097 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3099 = _3097 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3101 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3103 = _3101 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3105 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3107 = _3105 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3109 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3111 = _3109 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3113 = _3085 * _3095;
                    float _3115 = precise::clamp(_3113, 0.0, 1.0);
                    float _3117 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3119 = _3117 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3121 = fma(_3115, _3093, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3123 = fma(_3115, _3119, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3125 = fma(_3115, _3099, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3127 = fma(_3115, _3103, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3129 = fma(_3115, _3107, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3131 = fma(_3115, _3111, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2959 = _3125;
                    _2977 = _3129;
                    _2953 = _3121;
                    _2971 = _3127;
                    _2965 = _3123;
                    _2985 = _3131;
                    _3047 = true;
                }
                else
                {
                    _2959 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2977 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2953 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2971 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2965 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2985 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3047 = false;
    float _3133 = _2959;
    float _3135 = _2977;
    float _3137 = _2953;
    float _3139 = _2971;
    float _3141 = _2965;
    float _3143 = _2985;
    float _3145 = _2933 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3147 = fma(_2907, -0.5, 0.5);
    float _3149 = precise::clamp(_3147, 0.0, 1.0);
    float _3151 = -_3133;
    float _3153 = _3151 + _3135;
    float _3155 = -_3137;
    float _3157 = _3155 + _3139;
    out.m_96.x = 0.0;
    float _3159 = fma(_3149, _3153, _3133);
    float _3161 = -_3141;
    float _3163 = _3161 + _3143;
    float _3165 = fma(_3149, _3157, _3137);
    float _3167 = _3159 * 0.586610972881317138671875;
    bool _3169 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3171 = fma(_3149, _3163, _3141);
    out.m_53.x = _3145;
    float _3173 = fma(_3165, 0.298911988735198974609375, _3167);
    bool _3175 = _1187 > 0.0;
    bool _3177 = isnan(_1187);
    bool _3179 = _3175 || _3177;
    bool _3181 = isnan(0.0);
    bool _3183 = _3179 || _3181;
    float _3185 = fma(_3171, 0.114477999508380889892578125, _3173);
    float _3187 = -_3185;
    float _3189 = _3165 + _3187;
    float _3191 = -_3185;
    float _3193 = _3159 + _3191;
    float _3195 = -_3185;
    float _3197 = _3171 + _3195;
    float _3199 = fma(_3189, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3185);
    float _3201 = fma(_3193, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3185);
    float _3203 = fma(_3197, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3185);
    bool _3205 = !_3169;
    if (!_3205)
    {
        float _3207 = -_1127;
        float _3209 = _3207 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3211 = -_1129;
        float _3213 = _3211 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3215 = -_1131;
        float _3217 = _3215 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3219 = _3209 * _3209;
        float _3221 = fma(_3213, _3213, _3219);
        float _3223 = fma(_3217, _3217, _3221);
        float _3225 = sqrt(_3223);
        float _3227 = rsqrt(_3223);
        float _3229 = -_3225;
        float _3231 = _3229 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3233 = _3231 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3235 = precise::clamp(_3233, 0.0, 1.0);
        float _3237 = _3213 * _3227;
        float _3239 = _3209 * _3227;
        float _3241 = abs(_3235);
        float _3243 = log2(_3241);
        float _3245 = _3217 * _3227;
        float _3247 = _3237 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3249 = _2907 * _3239;
        float _3251 = -_3239;
        float _3253 = -_3247;
        float _3255 = fma(_3251, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3253);
        float _3257 = fma(_2905, _3237, _3249);
        float _3259 = -_3245;
        float _3261 = fma(_3259, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3255);
        float _3263 = fma(_2909, _3245, _3257);
        float _3265 = precise::clamp(_3263, 0.0, 1.0);
        float _3267 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3269 = _3261 + _3267;
        float _3271 = _3243 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3273 = _3269 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3275 = precise::clamp(_3273, 0.0, 1.0);
        float _3277 = exp2(_3271);
        float _3279 = _3277 * _3275;
        float _3281 = _3265 * _3279;
        float _3283 = _3281 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3285 = _3281 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3287 = _3281 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_96.x = _3283;
        out.m_96.y = _3285;
        out.m_96.z = _3287;
    }
    out.m_98.x = _3199;
    out.m_98.y = _3201;
    out.m_98.z = _3203;
    if (_3183)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_53.x = 0.0;
    float _3289 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3289;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3047 = false;
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
        float _3357 = as_type<float>(_141);
        out.gl_Position.z = _3357;
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
    float _169 = _123 * _165;
    float _171 = _169;
    if (_163)
    {
        float _173 = _167 * 5.0;
        _143 = as_type<int>(_173);
    }
    int _175 = _143;
    out.m_57.x = _155;
    if (_163)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3422 = as_type<float>(_175);
        out.gl_Position.z = _3422;
    }
    out.m_51.x = _169;
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
        _213 = _169;
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
    float _239 = 1.0 / _233;
    bool _241 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _243 = 1.0 / _229;
    bool _245 = _217 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _247 = isnan(_217);
    bool _249 = _245 || _247;
    bool _251 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _253 = _249 || _251;
    float _255 = float(_253);
    float _257 = 1.0 / _237;
    float _259 = _221 * _243;
    float _261 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _263 = _217 + _261;
    float _265 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _267 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _265;
    float _269 = _263 * _239;
    bool _271 = _217 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _273 = isnan(_217);
    bool _275 = _271 || _273;
    bool _277 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _279 = _275 || _277;
    float _281 = float(_279);
    float _283 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _285 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _283;
    float _287 = _225 * _257;
    float _289 = fma(_267, _259, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _291 = _217 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _293 = isnan(_217);
    bool _295 = _291 || _293;
    bool _297 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _299 = _295 || _297;
    float _301 = float(_299);
    float _303 = -_281;
    float _305 = _303 + 1.0;
    float _307 = fma(_285, _259, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _309 = -_255;
    float _311 = _309 + 1.0;
    float _313 = _255 * _305;
    float _315 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _317 = _315 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    bool _319 = _217 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _321 = isnan(_217);
    bool _323 = _319 || _321;
    bool _325 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _327 = _323 || _325;
    float _329 = float(_327);
    float _331 = _301 * _311;
    float _333 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _335 = _333 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _337 = -_301;
    float _339 = _337 + 1.0;
    float _341 = fma(_317, _269, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _343 = fma(_335, _269, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _345 = _329 * _339;
    float _347 = in.m_62.x;
    float _349 = in.m_62.y;
    float _351 = -_329;
    float _353 = _351 + 1.0;
    float _355 = _289 * _345;
    float _357 = _307 * _345;
    float _359 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _361 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _359;
    float _363 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _365 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _363;
    float _367 = fma(_353, (*spvDescriptorSet0.vp_c9)._m0[143].x, _355);
    float _369 = fma(_353, (*spvDescriptorSet0.vp_c9)._m0[143].y, _357);
    float _371 = fma(_361, _287, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _373 = fma(_365, _287, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _375 = fma(_343, _331, _367);
    float _377 = fma(_341, _331, _369);
    float _379 = fma(_371, _313, _375);
    float _381 = fma(_373, _313, _377);
    float _383 = fma(_281, (*spvDescriptorSet0.vp_c9)._m0[146].x, _379);
    float _385 = fma(_281, (*spvDescriptorSet0.vp_c9)._m0[146].y, _381);
    float _387 = _383 * _347;
    float _389 = _385 * _349;
    bool _391 = !_241;
    float _393 = _387;
    if (!_391)
    {
        float _395 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _397 = _155 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _399 = fma(_397, (*spvDescriptorSet0.vp_c9)._m0[11].y, _123);
        float _401 = _399 * _395;
        float _403 = floor(_401);
        float _405 = -_403;
        float _407 = _401 + _405;
        _171 = _407;
    }
    float _409 = _171;
    float _411 = in.m_55.z;
    float _413 = _155 * 2.0;
    float _415 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _417 = int(_415);
    float _419 = in.m_55.y;
    float _421 = _155 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _423 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _425 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _427 = _425 != 0;
    int _429 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _431 = _429 != 0;
    int _433 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _435 = _433 != 0;
    float _437 = in.m_64.x;
    float _439 = in.m_64.y;
    float _441 = in.m_64.z;
    float _443 = floor(_413);
    float _445 = -_423;
    float _447 = fma(_421, 2.0, _445);
    float _449 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    bool _451 = !_431;
    int _453 = _451 ? 0 : 1;
    float _455 = _165 * _123;
    bool _457 = !_427;
    int _459 = _457 ? 0 : 1;
    float _461 = -_123;
    float _463 = fma(_461, (*spvDescriptorSet0.vp_c9)._m0[76].x, _447);
    bool _465 = !_435;
    int _467 = _465 ? 0 : 1;
    float _469 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _471 = int(_469);
    float _473 = _389 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _475 = _411 * 2.0;
    bool _477 = _443 > 0.0;
    float _479 = floor(_475);
    bool _481 = _443 >= 0.0;
    bool _483 = isnan(_443);
    bool _485 = _481 || _483;
    bool _487 = isnan(0.0);
    bool _489 = _485 || _487;
    float _491 = _419 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _493 = _155 + _419;
    float _495 = _419 * 2.0;
    int _497 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _499 = _497 != 0;
    int _501 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _503 = _501 != 0;
    int _505 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _507 = _505 != 0;
    float _509 = fma(_491, -2.0, _449);
    float _511 = _493 + (-1.0);
    float _513 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _515 = log2(_513);
    bool _517 = !_503;
    int _519 = _517 ? 0 : 1;
    float _521 = _419 + _411;
    bool _523 = !_499;
    int _525 = _523 ? 0 : 1;
    float _527 = fma(_511, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _529 = !_507;
    int _531 = _529 ? 0 : 1;
    float _533 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[76].y, _509);
    bool _535 = _479 > 0.0;
    float _537 = floor(_495);
    bool _539 = _479 >= 0.0;
    bool _541 = isnan(_479);
    bool _543 = _539 || _541;
    bool _545 = isnan(0.0);
    bool _547 = _543 || _545;
    float _549 = float(_417);
    float _551 = _521 + (-1.0);
    int _553 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _555 = _553 != 0;
    int _557 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _559 = _557 != 0;
    int _561 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _563 = _561 != 0;
    int _565 = _547 ? 0 : 1;
    float _567 = fma(_551, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _569 = 1.0 / _549;
    bool _571 = !_555;
    int _573 = _571 ? 0 : 1;
    float _575 = _515 * _123;
    int _577 = ~_565;
    int _579 = _577 + 1;
    int _581 = _579 + 1;
    int _583 = abs(_573);
    int _585 = _581;
    if (!_535)
    {
        int _587 = ~_565;
        int _589 = _587 + 1;
        _585 = _589;
    }
    int _591 = _585;
    float _593 = float(_471);
    float _595 = exp2(_575);
    float _597 = float(_591);
    float _599 = float(_583);
    int _601 = _489 ? 0 : 1;
    float _603 = _569 * _123;
    bool _605 = _537 > 0.0;
    float _607 = _599 * _597;
    float _609 = 1.0 / _593;
    int _611 = ~_601;
    int _613 = _611 + 1;
    int _615 = _613 + 1;
    float _617 = _607 * (-2.0);
    bool _619 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _621 = isnan(1.0);
    bool _623 = _619 || _621;
    bool _625 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _627 = _623 || _625;
    float _629 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _631 = 1.0 + _629;
    int _633 = _615;
    if (!_477)
    {
        int _635 = ~_601;
        int _637 = _635 + 1;
        _633 = _637;
    }
    int _639 = _633;
    float _641 = -_595;
    float _643 = _641 + 1.0;
    float _645 = 1.0 / _631;
    bool _647 = _537 >= 0.0;
    bool _649 = isnan(_537);
    bool _651 = _647 || _649;
    bool _653 = isnan(0.0);
    bool _655 = _651 || _653;
    float _657 = fma(_527, _617, _527);
    bool _659 = !_559;
    int _661 = _659 ? 0 : 1;
    float _663 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _665 = _609 * _123;
    int _667 = abs(_661);
    float _669 = fma(_155, (*spvDescriptorSet0.vp_c9)._m0[78].z, _663);
    bool _671 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _673 = isnan(0.0);
    bool _675 = _671 || _673;
    bool _677 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _679 = _675 || _677;
    float _681 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _683 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[77].z, _669);
    float _685 = _679 ? _643 : 0.0;
    float _687 = fma(_419, (*spvDescriptorSet0.vp_c9)._m0[78].w, _681);
    float _689 = float(_639);
    float _691 = _419 + (-0.5);
    float _693 = float(_667);
    float _695 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[77].w, _687);
    if (_627)
    {
        float _697 = _685 * _645;
        _133 = _697;
    }
    float _699 = _133;
    int _701 = _655 ? 0 : 1;
    float _703 = fma(_617, _437, _437);
    float _705 = _693 * _689;
    float _707 = _155 + (-0.5);
    bool _709 = !_563;
    int _711 = _709 ? 0 : 1;
    float _713 = _155 + _411;
    int _715 = ~_701;
    int _717 = _715 + 1;
    int _719 = _717 + 1;
    float _721 = fma(_707, (*spvDescriptorSet0.vp_c9)._m0[196].x, _703);
    int _723 = abs(_711);
    float _725 = _705 * (-2.0);
    int _727 = _719;
    if (!_605)
    {
        int _729 = ~_701;
        int _731 = _729 + 1;
        _727 = _731;
    }
    int _733 = _727;
    float _735 = fma(_657, _699, _721);
    float _737 = float(_723);
    float _739 = fma(_725, _439, _439);
    float _741 = float(_733);
    float _743 = fma(_567, _725, _567);
    float _745 = fma(_691, (*spvDescriptorSet0.vp_c9)._m0[196].y, _739);
    float _747 = _713 + (-1.0);
    float _749 = _737 * _741;
    float _751 = _735 * 0.15915493667125701904296875;
    float _753 = fma(_743, _699, _745);
    float _755 = in.m_66.x;
    float _757 = in.m_66.y;
    float _759 = in.m_66.z;
    float _761 = in.m_66.w;
    float _763 = _749 * (-2.0);
    float _765 = fma(_747, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _767 = _411 + (-0.5);
    float _769 = in.m_46.x;
    float _771 = in.m_46.y;
    float _773 = in.m_46.z;
    float _775 = fma(_763, _441, _441);
    float _777 = fma(_765, _763, _765);
    float _779 = _753 * 0.15915493667125701904296875;
    float _781 = in.m_68.x;
    float _783 = in.m_68.y;
    float _785 = in.m_68.z;
    float _787 = in.m_68.w;
    float _789 = fma(_767, (*spvDescriptorSet0.vp_c9)._m0[196].z, _775);
    float _791 = _751 * 6.283185482025146484375;
    float _793 = sin(_791);
    float _795 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _195);
    float _797 = in.m_70.x;
    float _799 = in.m_70.y;
    float _801 = in.m_70.z;
    float _803 = in.m_70.w;
    float _805 = fma(_777, _699, _789);
    bool _807 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _809 = isnan(0.5);
    bool _811 = _807 || _809;
    bool _813 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _815 = _811 || _813;
    float _817 = _473 * _795;
    bool _819 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _821 = isnan(0.5);
    bool _823 = _819 || _821;
    bool _825 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _827 = _823 || _825;
    float _829 = _805 * 0.15915493667125701904296875;
    float _831 = _751 * 6.283185482025146484375;
    float _833 = cos(_831);
    float _835 = _779 * 6.283185482025146484375;
    float _837 = sin(_835);
    float _839 = _771 * _757;
    float _841 = _771 * _783;
    float _843 = fma(_769, _755, _839);
    float _845 = _779 * 6.283185482025146484375;
    float _847 = cos(_845);
    float _849 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _851 = _771 * _799;
    float _853 = fma(_769, _781, _841);
    float _855 = fma(_769, _797, _851);
    float _857 = fma(_773, _759, _843);
    float _859 = _829 * 6.283185482025146484375;
    float _861 = cos(_859);
    float _863 = fma(_773, _785, _853);
    float _865 = _387 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _867 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _191);
    float _869 = _793 * _837;
    float _871 = fma(_773, _801, _855);
    float _873 = _833 * _837;
    float _875 = _865 * _867;
    float _877 = _829 * 6.283185482025146484375;
    float _879 = sin(_877);
    float _881 = _833 * _847;
    float _883 = _793 * _847;
    float _885 = _863 + _787;
    float _887 = _857 + _761;
    float _889 = _871 + _803;
    float _891 = _885 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _893 = _833 * _861;
    float _895 = _793 * _861;
    float _897 = _847 * _861;
    float _899 = _837 * _861;
    float _901 = _893 * _817;
    float _903 = fma(_887, (*spvDescriptorSet0.vp_c8)._m0[11].x, _891);
    float _905 = fma(_879, _881, _869);
    float _907 = -_817;
    float _909 = _879 * _907;
    float _911 = -_883;
    float _913 = fma(_879, _873, _911);
    float _915 = -_873;
    float _917 = fma(_879, _883, _915);
    float _919 = fma(_905, _875, _901);
    float _921 = _895 * _817;
    float _923 = fma(_897, _875, _909);
    float _925 = fma(_879, _869, _881);
    float _927 = fma(_913, _849, _919);
    float _929 = fma(_917, _875, _921);
    float _931 = fma(_899, _849, _923);
    float _933 = _927 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _935 = fma(_925, _849, _929);
    float _937 = _927 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _939 = _927 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _941 = fma(_931, (*spvDescriptorSet0.vp_c8)._m0[26].x, _933);
    float _943 = fma(_931, (*spvDescriptorSet0.vp_c8)._m0[24].x, _937);
    float _945 = fma(_931, (*spvDescriptorSet0.vp_c8)._m0[25].x, _939);
    float _947 = fma(_935, (*spvDescriptorSet0.vp_c8)._m0[26].z, _941);
    float _949 = fma(_935, (*spvDescriptorSet0.vp_c8)._m0[24].z, _943);
    float _951 = fma(_935, (*spvDescriptorSet0.vp_c8)._m0[25].z, _945);
    float _953 = _947 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _955 = fma(_889, (*spvDescriptorSet0.vp_c8)._m0[11].z, _903);
    float _957 = _949 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _959 = _889 + _953;
    float _961 = _955 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _963 = _887 + _957;
    float _965 = _885 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _967 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _969 = _959 + _967;
    float _971 = 1.0 / _961;
    float _973 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _975 = _963 + _973;
    float _977 = fma(_887, (*spvDescriptorSet0.vp_c8)._m0[10].x, _965);
    float _979 = _969 * _969;
    float _981 = fma(_889, (*spvDescriptorSet0.vp_c8)._m0[10].z, _977);
    float _983 = fma(_975, _975, _979);
    float _985 = _951 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _987 = _981 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _989 = sqrt(_983);
    float _991 = _987 + _961;
    float _993 = _991 * _971;
    float _995 = _993 * 0.5;
    float _997 = _885 + _985;
    float _999 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1001 = fma(_995, (*spvDescriptorSet0.vp_c8)._m0[30].w, _999);
    float _1003 = 1.0 / _1001;
    bool _1005 = _989 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1007 = _963;
    float _1009 = _959;
    float _1011 = _921;
    float _1013 = _935;
    if (!_1005)
    {
        _393 = _997;
    }
    float _1015 = _393;
    bool _1017 = !_1005;
    float _1019 = _1015;
    if (!_1017)
    {
        float _1021 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1023 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1025 = _989 + _1023;
        float _1027 = _997 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1029 = rsqrt(_983);
        float _1031 = _1025 * _1021;
        float _1033 = _1031 * 0.15915493667125701904296875;
        float _1035 = _1033 * 6.283185482025146484375;
        float _1037 = cos(_1035);
        float _1039 = _1033 * 6.283185482025146484375;
        float _1041 = sin(_1039);
        float _1043 = _1037 + (-1.0);
        float _1045 = fma(_1041, _1027, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1047 = _1043 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1049 = _1029 * _1045;
        float _1051 = fma(_997, _1037, _1047);
        float _1053 = fma(_975, _1049, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1055 = fma(_969, _1049, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1007 = _1053;
        _1009 = _1055;
        _1019 = _1051;
    }
    float _1057 = _1007;
    float _1059 = _1009;
    float _1061 = _1019;
    float _1063 = _1061;
    float _1065 = _1057;
    float _1067 = _1059;
    if (_827)
    {
        _1011 = 1.0;
    }
    float _1069 = _1011;
    float _1071 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1073 = _1003 * _1071;
    float _1075 = _1069;
    if (!_815)
    {
        float _1077 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1079 = _885 + _1077;
        float _1081 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1083 = _887 + _1081;
        float _1085 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1087 = -_887;
        float _1089 = _1087 + _1057;
        float _1091 = _1079 * _1079;
        float _1093 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1095 = _889 + _1093;
        float _1097 = -_889;
        float _1099 = _1097 + _1059;
        float _1101 = fma(_1083, _1083, _1091);
        float _1103 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1105 = fma(_1095, _1095, _1101);
        float _1107 = sqrt(_1105);
        float _1109 = _1085 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1111 = -_885;
        float _1113 = _1111 + _1061;
        float _1115 = precise::min(_1107, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1117 = _1115 * _1103;
        float _1119 = _1109 * _1117;
        float _1121 = fma(_1113, _1119, _885);
        float _1123 = fma(_1089, _1119, _887);
        float _1125 = fma(_1099, _1119, _889);
        _1063 = _1121;
        _1065 = _1123;
        _1067 = _1125;
        _1013 = _1117;
    }
    float _1127 = _1063;
    float _1129 = _1065;
    float _1131 = _1067;
    float _1133 = _1013;
    float _1135 = _1133;
    if (!_827)
    {
        float _1137 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1139 = _1137 * 0.15915493667125701904296875;
        float _1141 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1143 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1145 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1143;
        float _1147 = _1139 * 6.283185482025146484375;
        float _1149 = cos(_1147);
        float _1151 = _1141 * 0.15915493667125701904296875;
        float _1153 = _1139 * 6.283185482025146484375;
        float _1155 = sin(_1153);
        float _1157 = 1.0 / _1149;
        float _1159 = _1151 * 6.283185482025146484375;
        float _1161 = cos(_1159);
        float _1163 = _1155 * _1157;
        float _1165 = _1151 * 6.283185482025146484375;
        float _1167 = sin(_1165);
        float _1169 = _1161 * _1163;
        float _1171 = 1.0 / _1145;
        float _1173 = 1.0 / _1169;
        float _1175 = _1167 * _1173;
        float _1177 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1179 = fma(_1073, _1175, _1177);
        float _1181 = _1179 * _1171;
        float _1183 = precise::clamp(_1181, 0.0, 1.0);
        _1135 = _1171;
        _1075 = _1183;
    }
    float _1185 = _1135;
    float _1187 = _1075;
    float _1189 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1191 = _1127 + _1189;
    float _1193 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1195 = _1129 + _1193;
    float _1197 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1199 = _1131 + _1197;
    float _1201 = _1191 * _1191;
    float _1203 = fma(_1195, _1195, _1201);
    float _1205 = fma(_887, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1207 = fma(_1199, _1199, _1203);
    float _1209 = rsqrt(_1207);
    float _1211 = sqrt(_1207);
    float _1213 = _1209 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1215 = _1195 * _1213;
    float _1217 = _1199 * _1213;
    float _1219 = _1215 * _1215;
    float _1221 = _1217 * _1217;
    float _1223 = _1219 + _1221;
    float _1225 = sqrt(_1223);
    bool _1227 = _1225 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1229 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1231 = _1225 + _1229;
    float _1233 = _1199;
    float _1235 = _1209;
    float _1237 = _1231;
    float _1239 = _1201;
    float _1241 = _1191;
    float _1243 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    float _1245 = _1223;
    if (_1227)
    {
        float _1247 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1233 = _1247;
    }
    float _1249 = _1233;
    if (_1227)
    {
        float _1251 = rsqrt(_1223);
        _1235 = _1251;
    }
    float _1253 = _1235;
    float _1255 = _1253;
    if (_1227)
    {
        float _1257 = _1231 * _1249;
        _1237 = _1257;
    }
    float _1259 = _1237;
    if (_1227)
    {
        float _1261 = _1259 * 0.15915493667125701904296875;
        _1239 = _1261;
    }
    float _1263 = _1239;
    float _1265 = _1249;
    float _1267 = _1263;
    if (_1227)
    {
        float _1269 = _1263 * 6.283185482025146484375;
        float _1271 = sin(_1269);
        _1265 = _1271;
    }
    float _1273 = _1265;
    float _1275 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1277 = precise::max(0.0, _1275);
    float _1279 = _1185;
    float _1281 = _1277;
    if (_1227)
    {
        float _1283 = _1263 * 6.283185482025146484375;
        float _1285 = cos(_1283);
        _1279 = _1285;
    }
    float _1287 = _1279;
    float _1289 = -_1213;
    float _1291 = -_1277;
    float _1293 = fma(_1191, _1289, _1291);
    if (_1227)
    {
        float _1295 = _1293 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1281 = _1295;
    }
    float _1297 = _1281;
    if (!_1227)
    {
        _1267 = _1219;
    }
    float _1299 = _1267;
    float _1301 = _1127 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1303 = _1273;
    float _1305 = _1299;
    if (_1227)
    {
        float _1307 = fma(_1273, _1297, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1303 = _1307;
    }
    float _1309 = _1303;
    float _1311 = fma(_1129, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1301);
    float _1313 = floor(_1205);
    float _1315 = _1309;
    float _1317 = _1287;
    if (_1227)
    {
        float _1319 = _1287 + (-1.0);
        _1241 = _1319;
    }
    float _1321 = _1241;
    float _1323 = _1321;
    if (_1227)
    {
        float _1325 = _1253 * _1309;
        _1243 = _1325;
    }
    float _1327 = _1243;
    if (!_1227)
    {
        _1315 = _1215;
    }
    float _1329 = _1315;
    float _1331 = fma(_1131, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1311);
    float _1333 = _1329;
    if (_1227)
    {
        float _1335 = _1321 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1245 = _1335;
    }
    float _1337 = _1245;
    if (_1227)
    {
        float _1339 = _1215 * _1327;
        _1333 = _1339;
    }
    float _1341 = _1333;
    if (!_1227)
    {
        _1323 = _1217;
    }
    float _1343 = _1323;
    float _1345 = _1343;
    if (_1227)
    {
        float _1347 = _1217 * _1327;
        _1345 = _1347;
    }
    float _1349 = _1345;
    if (!_1227)
    {
        _1255 = _1293;
    }
    float _1351 = _1255;
    float _1353 = _1351;
    if (_1227)
    {
        float _1355 = fma(_1293, _1287, _1337);
        _1353 = _1355;
    }
    float _1357 = _1353;
    if (_1227)
    {
        float _1359 = _1341 * _1341;
        _1305 = _1359;
    }
    float _1361 = _1305;
    float _1363 = _1127 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (!_1227)
    {
        _1317 = _1221;
    }
    float _1365 = _1317;
    float _1367 = _1365;
    if (_1227)
    {
        float _1369 = _1349 * _1349;
        _1367 = _1369;
    }
    float _1371 = _1367;
    float _1373 = fma(_1357, _1357, _1361);
    float _1375 = fma(_889, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1377 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1379 = _1127 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1381 = _1373 + _1371;
    float _1383 = _1127 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1385 = fma(_1129, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1363);
    float _1387 = fma(_1129, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1379);
    float _1389 = fma(_1129, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1383);
    float _1391 = rsqrt(_1381);
    float _1393 = fma(_1131, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1387);
    float _1395 = fma(_1131, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1385);
    float _1397 = fma(_1131, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1389);
    float _1399 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1401 = fma(_1211, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1399);
    float _1403 = precise::clamp(_1401, 0.0, 1.0);
    float _1405 = _1393 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1407 = _1395 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1409 = _1397 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1411 = -_1403;
    float _1413 = _1411 + 1.0;
    float _1415 = _1405 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1417 = _1407 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1419 = _1331 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1421 = abs(_1413);
    float _1423 = log2(_1421);
    float _1425 = fma(_1409, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1415);
    float _1427 = -_1417;
    float _1429 = fma(_1427, _1377, 1.0);
    float _1431 = -_1313;
    float _1433 = _1205 + _1431;
    float _1435 = _1391 * _1341;
    float _1437 = fma(_1407, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1425);
    float _1439 = _1391 * _1349;
    float _1441 = _1405 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1443 = _1435 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1445 = fma(_1419, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1437);
    float _1447 = _1391 * _1357;
    float _1449 = floor(_1375);
    float _1451 = fma(_1409, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1441);
    float _1453 = -_1443;
    float _1455 = fma(_1447, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1453);
    float _1457 = _1423 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1459 = -_1439;
    float _1461 = fma(_1459, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1455);
    float _1463 = log2(_1429);
    float _1465 = _1405 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1467 = fma(_1461, -0.5, 0.5);
    float _1469 = fma(_1461, 0.5, 0.5);
    float _1471 = fma(_1409, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1465);
    float _1473 = 1.0 / _1445;
    float _1475 = -_1449;
    float _1477 = _1375 + _1475;
    float _1479 = fma(_1469, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1481 = fma(_1407, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1471);
    float _1483 = fma(_1407, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1451);
    float _1485 = _1447 + 1.0;
    float _1487 = fma(_1469, _1479, -0.212114393711090087890625);
    float _1489 = fma(_1419, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1481);
    float _1491 = sqrt(_1467);
    float _1493 = fma(_1419, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1483);
    float _1495 = _1463 * 0.693147182464599609375;
    float _1497 = fma(_1469, _1487, 1.570728778839111328125);
    float _1499 = _1495 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1501 = exp2(_1457);
    float _1503 = _1489 * _1473;
    float _1505 = _1493 * _1473;
    float _1507 = fma(_1503, 0.5, 0.5);
    float _1509 = fma(_1505, -0.5, 0.5);
    float _1511 = _1491 * 0.636619746685028076171875;
    float2 _5489 = float2(_1433, _1477);
    float _1513 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5489, float2(0.0), isnan(_5489)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5489, float2(0.0), isnan(_5489)), level(0.0)).x;
    float3 _5500 = float3(_1507, _1509, _1499);
    float _1515 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5500, float3(0.0), isnan(_5500)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5500, float3(0.0), isnan(_5500)), level(0.0)).x;
    float _1517 = -_1447;
    float _1519 = fma(_1501, _1485, _1517);
    float _1521 = -_1497;
    float _1523 = fma(_1511, _1521, 1.0);
    float _1525 = fma(_1519, 0.5, 0.5);
    float3 _5524 = float3(_1507, _1509, _1499);
    float4 _1528 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5524, float3(0.0), isnan(_5524)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5524, float3(0.0), isnan(_5524)), level(0.0)).xyzw;
    float _1530 = _1528.x;
    float _1532 = _1528.y;
    float _1534 = _1528.z;
    float _1536 = _1528.w;
    float2 _5540 = float2(_1523, _1525);
    float3 _1540 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5540, float2(0.0), isnan(_5540)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5540, float2(0.0), isnan(_5540)), level(0.0)).xyz;
    float _1542 = _1540.x;
    float _1544 = _1540.y;
    float _1546 = _1540.z;
    float _1548 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1550 = int(_1548);
    out.m_72.x = _865;
    bool _1552 = _155 > 0.5;
    float _1554 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1556 = _409 + _1554;
    int _1558 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1560 = _1558 != 0;
    float _1562 = -_695;
    float _1564 = _1562 + 1.0;
    float _1566 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _1568 = int(_1566);
    float _1570 = _1423 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1572 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1574 = _1572 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    int _1576 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1578 = _1576 != 0;
    float _1580 = _1405 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _1582 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1584 = _1582 != 0;
    float _1586 = trunc(_603);
    int _1588 = int(_1586);
    float _1590 = float(uint(_1550));
    float _1592 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1594 = _1592 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1596 = _1507;
    float _1598 = _1477;
    float _1600 = (*spvDescriptorSet0.vp_c9)._m0[7].z;
    float _1602 = _1445;
    if (_1560)
    {
        _1596 = _155;
    }
    float _1604 = _1596;
    float _1606 = fma(_1409, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1580);
    float _1608 = _1604;
    if (!_1560)
    {
        _1608 = _411;
    }
    float _1610 = _1608;
    if (_1560)
    {
        _1598 = 1.0;
    }
    float _1612 = _1598;
    float _1614 = 1.0 / _1590;
    float _1616 = float(uint(_1568));
    float _1618 = _1612;
    if (_1560)
    {
        _1600 = 1.0;
    }
    float _1620 = _1600;
    float _1622 = _1620;
    if (!_1560)
    {
        _1618 = 7.345489978790283203125;
    }
    float _1624 = _1618;
    if (!_1560)
    {
        _1622 = 5.839270114898681640625;
    }
    float _1626 = _1622;
    float _1628 = 1.0 / _1616;
    float _1630 = float(uint(_1588));
    int _1632 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1634 = _1632 != 0;
    float _1636 = _1626 * _1610;
    int _1638 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _1640 = _1638 != 0;
    int _1642 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1644 = _1642 != 0;
    float _1646 = trunc(_665);
    int _1648 = int(_1646);
    float _1650 = -_191;
    int _1652 = _1552 ? as_type<int>(_1650) : as_type<int>(_191);
    bool _1654 = _419 > 0.5;
    bool _1656 = !_1578;
    float _1658 = _1656 ? _191 : as_type<float>(_1652);
    float _1660 = _191 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1662 = -_195;
    int _1664 = _1654 ? as_type<int>(_1662) : as_type<int>(_195);
    float _1666 = 1.0 / _1574;
    int _1668 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1670 = _1668 != 0;
    int _1672 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _1674 = _1672 != 0;
    int _1676 = as_type<int>(_1614) + (-2);
    float _1678 = 1.0 / _1594;
    int _1680 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _1682 = _1680 != 0;
    float _1684 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1686 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1684;
    float _1688 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1690 = _1688 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1692 = as_type<float>(_1676) * _1630;
    int _1694 = as_type<int>(_1628) + (-2);
    float _1696 = float(uint(_1648));
    float _1698 = _1686 * _1666;
    float _1700 = trunc(_1692);
    float _1702 = precise::max(_1700, 0.0);
    uint _1705 = uint(_1702);
    float _1707 = as_type<float>(_1694) * _1696;
    int _1709 = ~_1550;
    int _1711 = _1709 + 1;
    float _1713 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1715 = _1713 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1717 = fma(_1698, _1556, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1719 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1721 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _1719;
    float _1723 = _1624 * _155;
    float _1725 = trunc(_1707);
    float _1727 = precise::max(_1725, 0.0);
    uint _1729 = uint(_1727);
    int _1731 = ~_1568;
    int _1733 = _1731 + 1;
    float _1735 = _1721 * _1678;
    bool _1737 = _409 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1739 = isnan(_409);
    bool _1741 = _1737 || _1739;
    bool _1743 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1745 = _1741 || _1743;
    float _1747 = float(_1745);
    bool _1749 = _409 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1751 = isnan(_409);
    bool _1753 = _1749 || _1751;
    bool _1755 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1757 = _1753 || _1755;
    float _1759 = float(_1757);
    float _1761 = 1.0 / _1715;
    int _1763 = _1711 * int(_1705);
    int _1765 = _1763 + _1588;
    int _1767 = ~_1568;
    int _1769 = _1767 + 1;
    float _1771 = float(_1588);
    float _1773 = float(uint(_1765));
    int _1775 = _1733 * int(_1729);
    int _1777 = _1775 + _1648;
    bool _1779 = _409 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1781 = isnan(_409);
    bool _1783 = _1779 || _1781;
    bool _1785 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1787 = _1783 || _1785;
    float _1789 = float(_1787);
    float _1791 = floor(_1723);
    float _1793 = as_type<float>(_1676) * _1773;
    float _1795 = -_1759;
    float _1797 = _1795 + 1.0;
    float _1799 = float(uint(_1777));
    int _1801 = abs(_519);
    float _1803 = _1690 * _1761;
    float _1805 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1807 = _409 + _1805;
    float _1809 = as_type<float>(_1694) * _1799;
    float _1811 = trunc(_1793);
    float _1813 = precise::max(_1811, 0.0);
    uint _1815 = uint(_1813);
    float _1817 = float(_1648);
    float _1819 = fma(_1803, _1807, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1821 = -_1747;
    float _1823 = _1821 + 1.0;
    bool _1825 = _409 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1827 = isnan(_409);
    bool _1829 = _1825 || _1827;
    bool _1831 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1833 = _1829 || _1831;
    float _1835 = float(_1833);
    float _1837 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1839 = _409 + _1837;
    int _1841 = abs(_525);
    float _1843 = _1759 * _1823;
    float _1845 = trunc(_1809);
    float _1847 = precise::max(_1845, 0.0);
    uint _1849 = uint(_1847);
    float _1851 = _1789 * _1797;
    float _1853 = -_1789;
    float _1855 = _1853 + 1.0;
    bool _1857 = !_1644;
    float _1859 = _1857 ? _195 : as_type<float>(_1664);
    float _1861 = fma(_1735, _1839, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _1863 = _1658 + 0.5;
    float _1865 = _1835 * _1855;
    int _1867 = ~_1550;
    int _1869 = _1867 + 1;
    float _1871 = _1859 + (-0.5);
    int _1873 = int(_1705) + int(_1815);
    float _1875 = fma(_1863, (*spvDescriptorSet0.vp_c9)._m0[80].x, _463);
    float _1877 = -_1871;
    float _1879 = -_533;
    float _1881 = fma(_1877, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1879);
    float _1883 = floor(_1636);
    float _1885 = float(_1550);
    float _1887 = _1717 * _1865;
    int _1889 = int(_1729) + int(_1849);
    int _1891 = _1869 * _1873;
    int _1893 = _1891 + _1588;
    float _1895 = -_1791;
    float _1897 = _1723 + _1895;
    float _1899 = -_1835;
    float _1901 = _1899 + 1.0;
    bool _1903 = _1771 >= _1885;
    bool _1905 = isnan(_1771);
    bool _1907 = _1903 || _1905;
    bool _1909 = isnan(_1885);
    bool _1911 = _1907 || _1909;
    float _1913 = float(_1911);
    float _1915 = fma(_1859, _1564, _1881);
    bool _1917 = uint(_1893) >= uint(_1550);
    int _1919 = _1769 * _1889;
    int _1921 = _1919 + _1648;
    float _1923 = fma(_1901, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1887);
    float _1925 = _1897 * _1885;
    bool _1927 = !_1917;
    int _1929 = _1927 ? 0 : (-1);
    float _1931 = trunc(_1913);
    int _1933 = int(_1931);
    bool _1935 = uint(_1921) >= uint(_1568);
    float _1937 = fma(_1819, _1851, _1923);
    float _1939 = float(_1568);
    float _1941 = -_1883;
    float _1943 = _1636 + _1941;
    bool _1945 = !_1935;
    int _1947 = _1945 ? 0 : (-1);
    float _1949 = _1885 * _455;
    int _1951 = ~_1873;
    int _1953 = _1951 + _1929;
    int _1955 = _1953 + 1;
    float _1957 = trunc(_1925);
    int _1959 = int(_1957);
    int _1961 = ~_1889;
    int _1963 = _1961 + _1947;
    int _1965 = _1963 + 1;
    float _1967 = _1939 * _455;
    bool _1969 = !_1584;
    int _1971 = _1969 ? 0 : 1;
    float _1973 = _1943 * _1939;
    bool _1975 = _1817 >= _1939;
    bool _1977 = isnan(_1817);
    bool _1979 = _1975 || _1977;
    bool _1981 = isnan(_1939);
    bool _1983 = _1979 || _1981;
    float _1985 = float(_1983);
    float _1987 = fma(_1861, _1843, _1937);
    int _1989 = abs(_1971);
    int _1991 = _1550 * _1955;
    int _1993 = _1991 + _1588;
    bool _1995 = !_1682;
    int _1997 = _1995 ? 0 : 1;
    float _1999 = trunc(_1985);
    int _2001 = int(_1999);
    bool _2003 = _1550 == 0;
    int _2005 = _1568 * _1965;
    int _2007 = _2005 + _1648;
    int _2009 = abs(_1997);
    float _2011 = fma(_1747, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1987);
    int _2013 = ~_1933;
    int _2015 = _2013 + 1;
    int _2017 = _2015 + 1;
    bool _2019 = !_2003;
    int _2021 = _2019 ? _1993 : (-1);
    float _2023 = trunc(_1973);
    int _2025 = int(_2023);
    int _2027 = _1550 + (-1);
    bool _2029 = _1568 == 0;
    int _2031 = _2021 * _2017;
    int _2033 = _1959 * _1989;
    int _2035 = _2033 + _1588;
    bool _2037 = !_2029;
    int _2039 = _2037 ? _2007 : (-1);
    float _2041 = trunc(_1949);
    int _2043 = int(_2041);
    int _2045 = _1933 * _2027;
    int _2047 = _2045 + _2031;
    int _2049 = abs(_453);
    int _2051 = ~_2001;
    int _2053 = _2051 + 1;
    int _2055 = _2053 + 1;
    float _2057 = float(uint(_2035));
    int _2059 = _2047 * _2049;
    int _2061 = abs(_459);
    int _2063 = _2025 * _2009;
    int _2065 = _2063 + _1648;
    float _2067 = trunc(_1967);
    int _2069 = int(_2067);
    int _2071 = _1568 + (-1);
    int _2073 = _2039 * _2055;
    float _2075 = as_type<float>(_1676) * _2057;
    int _2077 = _2043 * _2061;
    int _2079 = _2077 + _2059;
    float _2081 = float(uint(_2065));
    int _2083 = _2001 * _2071;
    int _2085 = _2083 + _2073;
    float _2087 = exp2(_1570);
    int _2089 = _2085 * _1801;
    float _2091 = as_type<float>(_1694) * _2081;
    int _2093 = abs(_467);
    float _2095 = trunc(_2075);
    float _2097 = precise::max(_2095, 0.0);
    uint _2099 = uint(_2097);
    int _2101 = ~_1550;
    int _2103 = _2101 + 1;
    int _2105 = _2069 * _1841;
    int _2107 = _2105 + _2089;
    bool _2109 = !_1670;
    int _2111 = _2109 ? 0 : 1;
    int _2113 = _2035 * _2093;
    int _2115 = _2113 + _2079;
    int _2117 = abs(_531);
    float _2119 = trunc(_2091);
    float _2121 = precise::max(_2119, 0.0);
    uint _2123 = uint(_2121);
    int _2125 = abs(_2111);
    float _2127 = -_2087;
    float _2129 = _2127 + 1.0;
    int _2131 = ~_1568;
    int _2133 = _2131 + 1;
    int _2135 = _2065 * _2117;
    int _2137 = _2135 + _2107;
    bool _2139 = !_1674;
    int _2141 = _2139 ? 0 : 1;
    int _2143 = _1959 * _2125;
    int _2145 = _2143 + _2115;
    int _2147 = _2103 * int(_2099);
    int _2149 = _2147 + _2035;
    int _2151 = ~_1550;
    int _2153 = _2151 + 1;
    float _2155 = _2129 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2157 = float(uint(_2145));
    float _2159 = float(uint(_2149));
    int _2161 = abs(_2141);
    float _2163 = -_683;
    float _2165 = _2163 + 1.0;
    int _2167 = _2133 * int(_2123);
    int _2169 = _2167 + _2065;
    float _2171 = as_type<float>(_1676) * _2159;
    int _2173 = _2025 * _2161;
    int _2175 = _2173 + _2137;
    float _2177 = as_type<float>(_1676) * _2157;
    float _2179 = -_2165;
    float _2181 = fma(_1658, _2179, _1875);
    float _2183 = float(uint(_2169));
    float _2185 = trunc(_2171);
    float _2187 = precise::max(_2185, 0.0);
    uint _2189 = uint(_2187);
    float _2191 = as_type<float>(_1694) * _2183;
    float _2193 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    out.m_74.x = _2181;
    out.m_74.y = _1915;
    float _2195 = trunc(_2177);
    float _2197 = precise::max(_2195, 0.0);
    uint _2199 = uint(_2197);
    float _2201 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2203 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2205 = _2193 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2207 = _2201 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2209 = _2203 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2211 = trunc(_2191);
    float _2213 = precise::max(_2211, 0.0);
    uint _2215 = uint(_2213);
    float _2217 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2219 = float(uint(_2175));
    int _2221 = ~_1568;
    int _2223 = _2221 + 1;
    int _2225 = int(_2099) + int(_2189);
    out.m_76.x = _2205;
    out.m_76.y = _2207;
    out.m_76.z = _2209;
    out.m_76.w = _2217;
    float _2227 = abs(_1073);
    float _2229 = log2(_2227);
    int _2231 = _2153 * int(_2199);
    int _2233 = _2231 + _2145;
    float _2235 = as_type<float>(_1694) * _2219;
    float _2237 = float(uint(_2233));
    int _2239 = int(_2123) + int(_2215);
    float _2241 = trunc(_2235);
    float _2243 = precise::max(_2241, 0.0);
    uint _2245 = uint(_2243);
    float _2247 = as_type<float>(_1676) * _2237;
    float _2249 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    int _2251 = ~_1550;
    int _2253 = _2251 + 1;
    float _2255 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2257 = _2229 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2259 = trunc(_2247);
    float _2261 = precise::max(_2259, 0.0);
    uint _2263 = uint(_2261);
    int _2265 = _2253 * _2225;
    int _2267 = _2265 + _2035;
    float _2269 = _2249 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2271 = _2255 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2273 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2275 = _2011 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    bool _2277 = uint(_2267) >= uint(_1550);
    int _2279 = _2223 * int(_2245);
    int _2281 = _2279 + _2175;
    float _2283 = exp2(_2257);
    float _2285 = _2273 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2287 = -_1513;
    float _2289 = _2287 + 1.0;
    float _2291 = float(uint(_2281));
    float _2293 = _2155 * _1515;
    out.m_78.x = _2269;
    out.m_78.y = _2271;
    out.m_78.z = _2285;
    out.m_78.w = _2275;
    int _2295 = int(_2199) + int(_2263);
    float _2297 = _893 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2299 = as_type<float>(_1694) * _2291;
    int _2301 = ~_1568;
    int _2303 = _2301 + 1;
    float _2305 = trunc(_2299);
    float _2307 = precise::max(_2305, 0.0);
    uint _2309 = uint(_2307);
    int _2311 = _2303 * _2239;
    int _2313 = _2311 + _2065;
    float _2315 = fma(_2283, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2317 = precise::clamp(_2315, 0.0, 1.0);
    int _2319 = ~_1550;
    int _2321 = _2319 + 1;
    float _2323 = _893 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2325 = _893 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2327 = -_879;
    float _2329 = fma(_2327, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2297);
    int _2331 = ~_1568;
    int _2333 = _2331 + 1;
    float _2335 = -_879;
    float _2337 = fma(_2335, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2323);
    int _2339 = _2321 * _2295;
    int _2341 = _2339 + _2145;
    float _2343 = -_879;
    float _2345 = fma(_2343, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2325);
    bool _2347 = uint(_2313) >= uint(_1568);
    float _2349 = fma(_2317, -2.0, 3.0);
    int _2351 = int(_2245) + int(_2309);
    float _2353 = _2317 * _2317;
    bool _2355 = uint(_2341) >= uint(_1550);
    float _2357 = fma(_895, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2345);
    float _2359 = _905 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2361 = _2333 * _2351;
    int _2363 = _2361 + _2175;
    bool _2365 = !_2355;
    int _2367 = _2365 ? 0 : (-1);
    float _2369 = fma(_895, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2337);
    float _2371 = _905 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2373 = _913 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    bool _2375 = uint(_2363) >= uint(_1568);
    float _2377 = fma(_897, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2359);
    int _2379 = ~_2295;
    int _2381 = _2379 + _2367;
    int _2383 = _2381 + 1;
    float _2385 = fma(_897, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2371);
    bool _2387 = !_2375;
    int _2389 = _2387 ? 0 : (-1);
    float _2391 = _2353 * _2349;
    float _2393 = fma(_899, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2373);
    int _2395 = _1550 * _2383;
    int _2397 = _2395 + _2145;
    int _2399 = ~_2351;
    int _2401 = _2399 + _2389;
    int _2403 = _2401 + 1;
    float _2405 = _913 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _2407 = !_2347;
    int _2409 = _2407 ? 0 : (-1);
    float _2411 = -_2391;
    float _2413 = _2411 + 1.0;
    float _2415 = _913 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2417 = _1568 * _2403;
    int _2419 = _2417 + _2175;
    bool _2421 = !_2003;
    int _2423 = _2421 ? _2397 : (-1);
    float _2425 = fma(_899, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2405);
    int _2427 = ~_2239;
    int _2429 = _2427 + _2409;
    int _2431 = _2429 + 1;
    float _2433 = fma(_925, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2393);
    bool _2435 = !_2029;
    int _2437 = _2435 ? _2419 : (-1);
    float _2439 = fma(_2413, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2391);
    bool _2441 = !_2277;
    int _2443 = _2441 ? 0 : (-1);
    float _2445 = _905 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2447 = _2423 >> 31;
    float _2449 = fma(_899, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2415);
    int _2451 = _2437 >> 31;
    float _2453 = fma(_895, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2329);
    int _2455 = ~_2225;
    int _2457 = _2455 + _2443;
    int _2459 = _2457 + 1;
    float _2461 = _195 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _2463 = _2447 & 3;
    float _2465 = fma(_897, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2445);
    int _2467 = _2451 & 3;
    int _2469 = _1550 * _2459;
    int _2471 = _2469 + _2035;
    int _2473 = _2423 + _2463;
    int _2475 = _1568 * _2431;
    int _2477 = _2475 + _2065;
    int _2479 = _2437 + _2467;
    float _2481 = _2461 * _2369;
    int _2483 = _2423 & 3;
    bool _2485 = _2483 != 0;
    float _2487 = fma(_925, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2425);
    int _2489 = _2473 >> 2;
    float _2491 = fma(_925, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2449);
    int _2493 = _2423 & 3;
    bool _2495 = _2493 != 0;
    float _2497 = fma(_917, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2377);
    int _2499 = _2479 >> 2;
    int _2501 = _2489 << 4;
    int _2503 = _2501 + 368;
    float _2505 = fma(_917, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2385);
    bool _2507 = uint(_2493) >= 2u;
    int _2509 = _2499 << 4;
    int _2511 = _2509 + 656;
    uint _2513 = uint(int(uint(_2503) >> uint(2)));
    uint _2515 = uint(int(uint(int(_2513)) >> uint(2)));
    int _2517 = int(_2513) & 3;
    float _2519 = (*spvDescriptorSet0.vp_c9)._m0[int(_2515)][_2517];
    int _2521 = int(_2513) + 1;
    uint _2523 = uint(int(uint(_2521) >> uint(2)));
    int _2525 = _2521 & 3;
    float _2527 = (*spvDescriptorSet0.vp_c9)._m0[int(_2523)][_2525];
    int _2529 = _2507 ? 0 : 1;
    float _2531 = fma(_1660, _2505, _2481);
    int _2533 = _2485 ? 0 : 1;
    float _2535 = fma(_917, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2465);
    bool _2537 = _2493 != 3;
    bool _2539 = uint(_2493) > 1u;
    uint _2541 = uint(int(uint(_2511) >> uint(2)));
    uint _2543 = uint(int(uint(int(_2541)) >> uint(2)));
    int _2545 = int(_2541) & 3;
    float _2547 = (*spvDescriptorSet0.vp_c9)._m0[int(_2543)][_2545];
    int _2549 = int(_2541) + 1;
    uint _2551 = uint(int(uint(_2549) >> uint(2)));
    int _2553 = _2549 & 3;
    float _2555 = (*spvDescriptorSet0.vp_c9)._m0[int(_2551)][_2553];
    int _2557 = ~_2529;
    int _2559 = _2557 + 1;
    int _2561 = _2559 + 1;
    out.m_80.x = _2505;
    out.m_80.y = _2497;
    out.m_80.z = _2535;
    int _2563 = ~_2533;
    int _2565 = _2563 + 1;
    int _2567 = _2565 + 1;
    bool _2569 = !_2495;
    int _2571 = _2569 ? 0 : 1;
    bool _2573 = _1073 <= 8000.0;
    bool _2575 = isnan(_1073);
    bool _2577 = _2573 || _2575;
    bool _2579 = isnan(8000.0);
    bool _2581 = _2577 || _2579;
    float _2583 = float(_2581);
    int _2585 = _2503 + 8;
    uint _2587 = uint(int(uint(_2585) >> uint(2)));
    uint _2589 = uint(int(uint(int(_2587)) >> uint(2)));
    int _2591 = int(_2587) & 3;
    float _2593 = (*spvDescriptorSet0.vp_c9)._m0[int(_2589)][_2591];
    int _2595 = int(_2587) + 1;
    uint _2597 = uint(int(uint(_2595) >> uint(2)));
    int _2599 = _2595 & 3;
    float _2601 = (*spvDescriptorSet0.vp_c9)._m0[int(_2597)][_2599];
    bool _2603 = !_2029;
    int _2605 = _2603 ? _2477 : (-1);
    int _2607 = _2561;
    int _2609 = _2567;
    if (_2537)
    {
        int _2611 = ~_2529;
        int _2613 = _2611 + 1;
        _2607 = _2613;
    }
    int _2615 = _2607;
    float _2617 = _2461 * _2453;
    if (!_2539)
    {
        int _2619 = ~_2533;
        int _2621 = _2619 + 1;
        _2609 = _2621;
    }
    int _2623 = _2609;
    float _2625 = _2583 * _2439;
    int _2627 = _2437 & 3;
    bool _2629 = _2627 != 0;
    int _2631 = _2437 & 3;
    bool _2633 = _2631 != 0;
    float _2635 = _2461 * _2357;
    bool _2637 = uint(_2627) > 1u;
    float _2639 = _2625 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    int _2641 = _2633 ? 0 : 1;
    float _2643 = fma(_1660, _2497, _2635);
    bool _2645 = !_2629;
    int _2647 = _2645 ? 0 : 1;
    int _2649 = _2511 + 8;
    uint _2651 = uint(int(uint(_2649) >> uint(2)));
    uint _2653 = uint(int(uint(int(_2651)) >> uint(2)));
    int _2655 = int(_2651) & 3;
    float _2657 = (*spvDescriptorSet0.vp_c9)._m0[int(_2653)][_2655];
    int _2659 = int(_2651) + 1;
    uint _2661 = uint(int(uint(_2659) >> uint(2)));
    int _2663 = _2659 & 3;
    float _2665 = (*spvDescriptorSet0.vp_c9)._m0[int(_2661)][_2663];
    float _2667 = fma(_1660, _2535, _2617);
    bool _2669 = uint(_2627) >= 2u;
    float _2671 = _2289 * _2639;
    float _2673 = precise::clamp(_2671, 0.0, 1.0);
    int _2675 = ~_2641;
    int _2677 = _2675 + 1;
    int _2679 = _2677 + 1;
    int _2681 = abs(_2623);
    int _2683 = _2679;
    if (!_2637)
    {
        int _2685 = ~_2641;
        int _2687 = _2685 + 1;
        _2683 = _2687;
    }
    int _2689 = _2683;
    int _2691 = _2669 ? 0 : 1;
    bool _2693 = _2493 != 3;
    int _2695 = abs(_2689);
    int _2697 = abs(_2571);
    bool _2699 = _2627 != 3;
    int _2701 = ~_2681;
    int _2703 = _2701 + 1;
    int _2705 = _2703 + 1;
    int _2707 = ~_2695;
    int _2709 = _2707 + 1;
    int _2711 = _2709 + 1;
    int _2713 = abs(_2647);
    int _2715 = _2705 * as_type<int>(_2527);
    int _2717 = abs(_2615);
    int _2719 = _2711 * as_type<int>(_2555);
    int _2721 = ~_2697;
    int _2723 = _2721 + 1;
    int _2725 = _2723 + 1;
    int _2727 = ~_2717;
    int _2729 = _2727 + 1;
    int _2731 = _2729 + 1;
    int _2733 = _2725 * as_type<int>(_2519);
    int _2735 = _2733 + _2715;
    int _2737 = ~_2691;
    int _2739 = _2737 + 1;
    int _2741 = _2739 + 1;
    float _2743 = fma(_2461, _2461, 1.0);
    int _2745 = _2741;
    if (_2699)
    {
        int _2747 = ~_2691;
        int _2749 = _2747 + 1;
        _2745 = _2749;
    }
    int _2751 = _2745;
    int _2753 = _2731 * as_type<int>(_2593);
    int _2755 = _2753 + _2735;
    int _2757 = ~_2713;
    int _2759 = _2757 + 1;
    int _2761 = _2759 + 1;
    float _2763 = fma(_1407, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1606);
    bool _2765 = !_2693;
    int _2767 = _2765 ? 0 : (-1);
    float _2769 = rsqrt(_2743);
    bool _2771 = _2627 != 3;
    int _2773 = _2761 * as_type<int>(_2547);
    int _2775 = _2773 + _2719;
    int _2777 = abs(_2751);
    float _2779 = fma(_1419, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2763);
    bool _2781 = !_1634;
    int _2783 = _2781 ? 0 : 1;
    int _2785 = abs(_2767);
    bool _2787 = !_2771;
    int _2789 = _2787 ? 0 : (-1);
    out.gl_Position.x = _1489;
    out.gl_Position.y = _1493;
    out.gl_Position.z = _2779;
    out.gl_Position.w = _1445;
    bool _2791 = !_1640;
    int _2793 = _2791 ? 0 : 1;
    int _2795 = abs(_2783);
    int _2797 = abs(_2789);
    int _2799 = ~_2777;
    int _2801 = _2799 + 1;
    int _2803 = _2801 + 1;
    int _2805 = abs(_2793);
    int _2807 = ~_2785;
    int _2809 = _2807 + 1;
    int _2811 = _2809 + 1;
    int _2813 = _2803 * as_type<int>(_2657);
    int _2815 = _2813 + _2775;
    int _2817 = ~_2797;
    int _2819 = _2817 + 1;
    int _2821 = _2819 + 1;
    float _2823 = _2461 * _2769;
    int _2825 = _2811 * as_type<int>(_2601);
    int _2827 = _2825 + _2755;
    int _2829 = _2821 * as_type<int>(_2665);
    int _2831 = _2829 + _2815;
    int _2833 = ~_2795;
    int _2835 = _2833 + 1;
    int _2837 = _2835 + 1;
    float _2839 = -_2491;
    float _2841 = _2823 * _2839;
    int _2843 = ~_2805;
    int _2845 = _2843 + 1;
    int _2847 = _2845 + 1;
    float _2849 = _2779 + _1445;
    bool _2851 = !_2003;
    int _2853 = _2851 ? _2471 : (-1);
    int _2855 = _2827 * _2837;
    float _2857 = -_2433;
    float _2859 = _2823 * _2857;
    int _2861 = _2831 * _2847;
    float _2863 = -_2487;
    float _2865 = _2823 * _2863;
    int _2867 = _2853 * _2795;
    int _2869 = _2867 + _2855;
    float _2871 = _1489 + _1445;
    int _2873 = _2605 * _2805;
    int _2875 = _2873 + _2861;
    float _2877 = fma(_2769, _2369, _2865);
    float _2879 = fma(_2769, _2357, _2859);
    float _2881 = in.m_82.x;
    float _2883 = fma(_2769, _2453, _2841);
    float _2885 = _1445 * 0.5;
    float _2887 = float(_2869);
    float _2889 = _1546 * _2293;
    float _2891 = -_2155;
    float _2893 = _2891 + 1.0;
    out.m_84.x = _2877;
    out.m_84.y = _2879;
    out.m_84.z = _2883;
    float _2895 = fma(_1493, -0.5, _2885);
    float _2897 = _1536 * _2293;
    out.m_86.x = _2887;
    float _2899 = _2849 * 0.5;
    float _2901 = _2871 * 0.5;
    float _2903 = float(_2875);
    float _2905 = _2487 + _2531;
    float _2907 = _2433 + _2643;
    float _2909 = _2491 + _2667;
    float _2911 = fma(_1542, _2897, _1530);
    float _2913 = fma(_1544, _2897, _1532);
    float _2915 = _1536 * _2893;
    float _2917 = fma(_1536, _2889, _1534);
    out.m_88.x = _2901;
    out.m_88.y = _2895;
    out.m_88.z = _2899;
    out.m_88.w = _1445;
    float _2919 = -_2673;
    float _2921 = fma(_2919, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    bool _2923 = _1211 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2925 = isnan(_1211);
    bool _2927 = _2923 || _2925;
    bool _2929 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2931 = _2927 || _2929;
    float _2933 = _1187 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_86.z = _2903;
    float _2935 = _2921 * _2881;
    out.m_90.x = _2911;
    out.m_90.y = _2913;
    out.m_90.z = _2917;
    out.m_90.w = _2915;
    float _2937 = _2935 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_92.x = _2905;
    out.m_92.y = _2907;
    out.m_92.z = _2909;
    float _2939 = _2879;
    float _2941 = (*spvDescriptorSet0.vp_c15)._m0[653].y;
    float _2943 = _2779;
    float _2945 = _2897;
    float _2947 = _2893;
    if (!_2931)
    {
        _2939 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2949 = _2939;
    out.m_94.x = _2937;
    float _2951 = _2949;
    float _2953 = _2949;
    if (!_2931)
    {
        _2941 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2955 = _2941;
    float _2957 = _2955;
    float _2959 = _2955;
    if (!_2931)
    {
        _1602 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2961 = _1602;
    float _2963 = _2961;
    float _2965 = _2961;
    if (!_2931)
    {
        _2943 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2967 = _2943;
    float _2969 = _2967;
    float _2971 = _2967;
    if (!_2931)
    {
        _2945 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2973 = _2945;
    float _2975 = _2973;
    float _2977 = _2973;
    if (!_2931)
    {
        _2947 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2979 = _2947;
    bool _2981 = !_2931;
    float _2983 = _2979;
    float _2985 = _2979;
    if (!_2981)
    {
        bool _2987 = _1211 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2989 = isnan(_1211);
        bool _2991 = _2987 || _2989;
        bool _2993 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2995 = _2991 || _2993;
        if (!_2995)
        {
            float _2997 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2999 = _1211 + _2997;
            float _3001 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3003 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3001;
            float _3005 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3007 = _3005 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3009 = 1.0 / _3003;
            float _3011 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3013 = _3011 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3015 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3017 = _3015 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3019 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3021 = _3019 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3023 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3025 = _3023 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3027 = _2999 * _3009;
            float _3029 = precise::clamp(_3027, 0.0, 1.0);
            float _3031 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3033 = _3031 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3035 = fma(_3029, _3007, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3037 = fma(_3029, _3033, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3039 = fma(_3029, _3013, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3041 = fma(_3029, _3017, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3043 = fma(_3029, _3021, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3045 = fma(_3029, _3025, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2959 = _3039;
            _2977 = _3043;
            _2953 = _3035;
            _2971 = _3041;
            _2965 = _3037;
            _2985 = _3045;
            _3047 = true;
        }
        else
        {
            bool _3049 = _1211 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3051 = isnan(_1211);
            bool _3053 = _3049 || _3051;
            bool _3055 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3057 = _3053 || _3055;
            if (!_3057)
            {
                _2951 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3059 = _2951;
            _2953 = _3059;
            if (!_3057)
            {
                _2957 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3061 = _2957;
            _2959 = _3061;
            if (!_3057)
            {
                _2963 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3063 = _2963;
            _2965 = _3063;
            if (!_3057)
            {
                _2969 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3065 = _2969;
            _2971 = _3065;
            if (!_3057)
            {
                _2975 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3067 = _2975;
            _2977 = _3067;
            if (!_3057)
            {
                _2983 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3069 = _2983;
            bool _3071 = !_3057;
            _2985 = _3069;
            if (!_3071)
            {
                bool _3073 = _1211 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3075 = isnan(_1211);
                bool _3077 = _3073 || _3075;
                bool _3079 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3081 = _3077 || _3079;
                if (!_3081)
                {
                    float _3083 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3085 = _1211 + _3083;
                    float _3087 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3089 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3087;
                    float _3091 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3093 = _3091 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3095 = 1.0 / _3089;
                    float _3097 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3099 = _3097 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3101 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3103 = _3101 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3105 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3107 = _3105 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3109 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3111 = _3109 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3113 = _3085 * _3095;
                    float _3115 = precise::clamp(_3113, 0.0, 1.0);
                    float _3117 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3119 = _3117 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3121 = fma(_3115, _3093, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3123 = fma(_3115, _3119, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3125 = fma(_3115, _3099, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3127 = fma(_3115, _3103, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3129 = fma(_3115, _3107, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3131 = fma(_3115, _3111, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2959 = _3125;
                    _2977 = _3129;
                    _2953 = _3121;
                    _2971 = _3127;
                    _2965 = _3123;
                    _2985 = _3131;
                    _3047 = true;
                }
                else
                {
                    _2959 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2977 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2953 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2971 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2965 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2985 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3047 = false;
    float _3133 = _2959;
    float _3135 = _2977;
    float _3137 = _2953;
    float _3139 = _2971;
    float _3141 = _2965;
    float _3143 = _2985;
    float _3145 = _2933 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3147 = fma(_2907, -0.5, 0.5);
    float _3149 = precise::clamp(_3147, 0.0, 1.0);
    float _3151 = -_3133;
    float _3153 = _3151 + _3135;
    float _3155 = -_3137;
    float _3157 = _3155 + _3139;
    out.m_96.x = 0.0;
    float _3159 = fma(_3149, _3153, _3133);
    float _3161 = -_3141;
    float _3163 = _3161 + _3143;
    float _3165 = fma(_3149, _3157, _3137);
    float _3167 = _3159 * 0.586610972881317138671875;
    bool _3169 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3171 = fma(_3149, _3163, _3141);
    out.m_53.x = _3145;
    float _3173 = fma(_3165, 0.298911988735198974609375, _3167);
    bool _3175 = _1187 > 0.0;
    bool _3177 = isnan(_1187);
    bool _3179 = _3175 || _3177;
    bool _3181 = isnan(0.0);
    bool _3183 = _3179 || _3181;
    float _3185 = fma(_3171, 0.114477999508380889892578125, _3173);
    float _3187 = -_3185;
    float _3189 = _3165 + _3187;
    float _3191 = -_3185;
    float _3193 = _3159 + _3191;
    float _3195 = -_3185;
    float _3197 = _3171 + _3195;
    float _3199 = fma(_3189, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3185);
    float _3201 = fma(_3193, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3185);
    float _3203 = fma(_3197, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3185);
    bool _3205 = !_3169;
    if (!_3205)
    {
        float _3207 = -_1127;
        float _3209 = _3207 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3211 = -_1129;
        float _3213 = _3211 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3215 = -_1131;
        float _3217 = _3215 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3219 = _3209 * _3209;
        float _3221 = fma(_3213, _3213, _3219);
        float _3223 = fma(_3217, _3217, _3221);
        float _3225 = sqrt(_3223);
        float _3227 = rsqrt(_3223);
        float _3229 = -_3225;
        float _3231 = _3229 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3233 = _3231 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3235 = precise::clamp(_3233, 0.0, 1.0);
        float _3237 = _3213 * _3227;
        float _3239 = _3209 * _3227;
        float _3241 = abs(_3235);
        float _3243 = log2(_3241);
        float _3245 = _3217 * _3227;
        float _3247 = _3237 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3249 = _2907 * _3239;
        float _3251 = -_3239;
        float _3253 = -_3247;
        float _3255 = fma(_3251, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3253);
        float _3257 = fma(_2905, _3237, _3249);
        float _3259 = -_3245;
        float _3261 = fma(_3259, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3255);
        float _3263 = fma(_2909, _3245, _3257);
        float _3265 = precise::clamp(_3263, 0.0, 1.0);
        float _3267 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3269 = _3261 + _3267;
        float _3271 = _3243 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3273 = _3269 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3275 = precise::clamp(_3273, 0.0, 1.0);
        float _3277 = exp2(_3271);
        float _3279 = _3277 * _3275;
        float _3281 = _3265 * _3279;
        float _3283 = _3281 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3285 = _3281 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3287 = _3281 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_96.x = _3283;
        out.m_96.y = _3285;
        out.m_96.z = _3287;
    }
    out.m_98.x = _3199;
    out.m_98.y = _3201;
    out.m_98.z = _3203;
    if (_3183)
    {
        return out;
    }
    out.m_53.x = 0.0;
    float _3289 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3289;
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
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3047 = false;
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
        float _3357 = as_type<float>(_141);
        out.gl_Position.z = _3357;
    }
    if (!_127)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
    float _169 = _123 * _165;
    float _171 = _169;
    if (_163)
    {
        float _173 = _167 * 5.0;
        _143 = as_type<int>(_173);
    }
    int _175 = _143;
    out.m_57.x = _155;
    if (_163)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3422 = as_type<float>(_175);
        out.gl_Position.z = _3422;
    }
    out.m_51.x = _169;
    if (_163)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
        _213 = _169;
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
    float _239 = 1.0 / _233;
    bool _241 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _243 = 1.0 / _229;
    bool _245 = _217 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _247 = isnan(_217);
    bool _249 = _245 || _247;
    bool _251 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _253 = _249 || _251;
    float _255 = float(_253);
    float _257 = 1.0 / _237;
    float _259 = _221 * _243;
    float _261 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _263 = _217 + _261;
    float _265 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _267 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _265;
    float _269 = _263 * _239;
    bool _271 = _217 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _273 = isnan(_217);
    bool _275 = _271 || _273;
    bool _277 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _279 = _275 || _277;
    float _281 = float(_279);
    float _283 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _285 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _283;
    float _287 = _225 * _257;
    float _289 = fma(_267, _259, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _291 = _217 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _293 = isnan(_217);
    bool _295 = _291 || _293;
    bool _297 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _299 = _295 || _297;
    float _301 = float(_299);
    float _303 = -_281;
    float _305 = _303 + 1.0;
    float _307 = fma(_285, _259, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _309 = -_255;
    float _311 = _309 + 1.0;
    float _313 = _255 * _305;
    float _315 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _317 = _315 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    bool _319 = _217 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _321 = isnan(_217);
    bool _323 = _319 || _321;
    bool _325 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _327 = _323 || _325;
    float _329 = float(_327);
    float _331 = _301 * _311;
    float _333 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _335 = _333 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _337 = -_301;
    float _339 = _337 + 1.0;
    float _341 = fma(_317, _269, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _343 = fma(_335, _269, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _345 = _329 * _339;
    float _347 = in.m_62.x;
    float _349 = in.m_62.y;
    float _351 = -_329;
    float _353 = _351 + 1.0;
    float _355 = _289 * _345;
    float _357 = _307 * _345;
    float _359 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _361 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _359;
    float _363 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _365 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _363;
    float _367 = fma(_353, (*spvDescriptorSet0.vp_c9)._m0[143].x, _355);
    float _369 = fma(_353, (*spvDescriptorSet0.vp_c9)._m0[143].y, _357);
    float _371 = fma(_361, _287, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _373 = fma(_365, _287, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _375 = fma(_343, _331, _367);
    float _377 = fma(_341, _331, _369);
    float _379 = fma(_371, _313, _375);
    float _381 = fma(_373, _313, _377);
    float _383 = fma(_281, (*spvDescriptorSet0.vp_c9)._m0[146].x, _379);
    float _385 = fma(_281, (*spvDescriptorSet0.vp_c9)._m0[146].y, _381);
    float _387 = _383 * _347;
    float _389 = _385 * _349;
    bool _391 = !_241;
    float _393 = _387;
    if (!_391)
    {
        float _395 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _397 = _155 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _399 = fma(_397, (*spvDescriptorSet0.vp_c9)._m0[11].y, _123);
        float _401 = _399 * _395;
        float _403 = floor(_401);
        float _405 = -_403;
        float _407 = _401 + _405;
        _171 = _407;
    }
    float _409 = _171;
    float _411 = in.m_55.z;
    float _413 = _155 * 2.0;
    float _415 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _417 = int(_415);
    float _419 = in.m_55.y;
    float _421 = _155 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _423 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _425 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _427 = _425 != 0;
    int _429 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _431 = _429 != 0;
    int _433 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _435 = _433 != 0;
    float _437 = in.m_64.x;
    float _439 = in.m_64.y;
    float _441 = in.m_64.z;
    float _443 = floor(_413);
    float _445 = -_423;
    float _447 = fma(_421, 2.0, _445);
    float _449 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    bool _451 = !_431;
    int _453 = _451 ? 0 : 1;
    float _455 = _165 * _123;
    bool _457 = !_427;
    int _459 = _457 ? 0 : 1;
    float _461 = -_123;
    float _463 = fma(_461, (*spvDescriptorSet0.vp_c9)._m0[76].x, _447);
    bool _465 = !_435;
    int _467 = _465 ? 0 : 1;
    float _469 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _471 = int(_469);
    float _473 = _389 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _475 = _411 * 2.0;
    bool _477 = _443 > 0.0;
    float _479 = floor(_475);
    bool _481 = _443 >= 0.0;
    bool _483 = isnan(_443);
    bool _485 = _481 || _483;
    bool _487 = isnan(0.0);
    bool _489 = _485 || _487;
    float _491 = _419 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _493 = _155 + _419;
    float _495 = _419 * 2.0;
    int _497 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _499 = _497 != 0;
    int _501 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _503 = _501 != 0;
    int _505 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _507 = _505 != 0;
    float _509 = fma(_491, -2.0, _449);
    float _511 = _493 + (-1.0);
    float _513 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _515 = log2(_513);
    bool _517 = !_503;
    int _519 = _517 ? 0 : 1;
    float _521 = _419 + _411;
    bool _523 = !_499;
    int _525 = _523 ? 0 : 1;
    float _527 = fma(_511, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _529 = !_507;
    int _531 = _529 ? 0 : 1;
    float _533 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[76].y, _509);
    bool _535 = _479 > 0.0;
    float _537 = floor(_495);
    bool _539 = _479 >= 0.0;
    bool _541 = isnan(_479);
    bool _543 = _539 || _541;
    bool _545 = isnan(0.0);
    bool _547 = _543 || _545;
    float _549 = float(_417);
    float _551 = _521 + (-1.0);
    int _553 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _555 = _553 != 0;
    int _557 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _559 = _557 != 0;
    int _561 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _563 = _561 != 0;
    int _565 = _547 ? 0 : 1;
    float _567 = fma(_551, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _569 = 1.0 / _549;
    bool _571 = !_555;
    int _573 = _571 ? 0 : 1;
    float _575 = _515 * _123;
    int _577 = ~_565;
    int _579 = _577 + 1;
    int _581 = _579 + 1;
    int _583 = abs(_573);
    int _585 = _581;
    if (!_535)
    {
        int _587 = ~_565;
        int _589 = _587 + 1;
        _585 = _589;
    }
    int _591 = _585;
    float _593 = float(_471);
    float _595 = exp2(_575);
    float _597 = float(_591);
    float _599 = float(_583);
    int _601 = _489 ? 0 : 1;
    float _603 = _569 * _123;
    bool _605 = _537 > 0.0;
    float _607 = _599 * _597;
    float _609 = 1.0 / _593;
    int _611 = ~_601;
    int _613 = _611 + 1;
    int _615 = _613 + 1;
    float _617 = _607 * (-2.0);
    bool _619 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _621 = isnan(1.0);
    bool _623 = _619 || _621;
    bool _625 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _627 = _623 || _625;
    float _629 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _631 = 1.0 + _629;
    int _633 = _615;
    if (!_477)
    {
        int _635 = ~_601;
        int _637 = _635 + 1;
        _633 = _637;
    }
    int _639 = _633;
    float _641 = -_595;
    float _643 = _641 + 1.0;
    float _645 = 1.0 / _631;
    bool _647 = _537 >= 0.0;
    bool _649 = isnan(_537);
    bool _651 = _647 || _649;
    bool _653 = isnan(0.0);
    bool _655 = _651 || _653;
    float _657 = fma(_527, _617, _527);
    bool _659 = !_559;
    int _661 = _659 ? 0 : 1;
    float _663 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _665 = _609 * _123;
    int _667 = abs(_661);
    float _669 = fma(_155, (*spvDescriptorSet0.vp_c9)._m0[78].z, _663);
    bool _671 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _673 = isnan(0.0);
    bool _675 = _671 || _673;
    bool _677 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _679 = _675 || _677;
    float _681 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _683 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[77].z, _669);
    float _685 = _679 ? _643 : 0.0;
    float _687 = fma(_419, (*spvDescriptorSet0.vp_c9)._m0[78].w, _681);
    float _689 = float(_639);
    float _691 = _419 + (-0.5);
    float _693 = float(_667);
    float _695 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[77].w, _687);
    if (_627)
    {
        float _697 = _685 * _645;
        _133 = _697;
    }
    float _699 = _133;
    int _701 = _655 ? 0 : 1;
    float _703 = fma(_617, _437, _437);
    float _705 = _693 * _689;
    float _707 = _155 + (-0.5);
    bool _709 = !_563;
    int _711 = _709 ? 0 : 1;
    float _713 = _155 + _411;
    int _715 = ~_701;
    int _717 = _715 + 1;
    int _719 = _717 + 1;
    float _721 = fma(_707, (*spvDescriptorSet0.vp_c9)._m0[196].x, _703);
    int _723 = abs(_711);
    float _725 = _705 * (-2.0);
    int _727 = _719;
    if (!_605)
    {
        int _729 = ~_701;
        int _731 = _729 + 1;
        _727 = _731;
    }
    int _733 = _727;
    float _735 = fma(_657, _699, _721);
    float _737 = float(_723);
    float _739 = fma(_725, _439, _439);
    float _741 = float(_733);
    float _743 = fma(_567, _725, _567);
    float _745 = fma(_691, (*spvDescriptorSet0.vp_c9)._m0[196].y, _739);
    float _747 = _713 + (-1.0);
    float _749 = _737 * _741;
    float _751 = _735 * 0.15915493667125701904296875;
    float _753 = fma(_743, _699, _745);
    float _755 = in.m_66.x;
    float _757 = in.m_66.y;
    float _759 = in.m_66.z;
    float _761 = in.m_66.w;
    float _763 = _749 * (-2.0);
    float _765 = fma(_747, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _767 = _411 + (-0.5);
    float _769 = in.m_46.x;
    float _771 = in.m_46.y;
    float _773 = in.m_46.z;
    float _775 = fma(_763, _441, _441);
    float _777 = fma(_765, _763, _765);
    float _779 = _753 * 0.15915493667125701904296875;
    float _781 = in.m_68.x;
    float _783 = in.m_68.y;
    float _785 = in.m_68.z;
    float _787 = in.m_68.w;
    float _789 = fma(_767, (*spvDescriptorSet0.vp_c9)._m0[196].z, _775);
    float _791 = _751 * 6.283185482025146484375;
    float _793 = sin(_791);
    float _795 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _195);
    float _797 = in.m_70.x;
    float _799 = in.m_70.y;
    float _801 = in.m_70.z;
    float _803 = in.m_70.w;
    float _805 = fma(_777, _699, _789);
    bool _807 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _809 = isnan(0.5);
    bool _811 = _807 || _809;
    bool _813 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _815 = _811 || _813;
    float _817 = _473 * _795;
    bool _819 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _821 = isnan(0.5);
    bool _823 = _819 || _821;
    bool _825 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _827 = _823 || _825;
    float _829 = _805 * 0.15915493667125701904296875;
    float _831 = _751 * 6.283185482025146484375;
    float _833 = cos(_831);
    float _835 = _779 * 6.283185482025146484375;
    float _837 = sin(_835);
    float _839 = _771 * _757;
    float _841 = _771 * _783;
    float _843 = fma(_769, _755, _839);
    float _845 = _779 * 6.283185482025146484375;
    float _847 = cos(_845);
    float _849 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _851 = _771 * _799;
    float _853 = fma(_769, _781, _841);
    float _855 = fma(_769, _797, _851);
    float _857 = fma(_773, _759, _843);
    float _859 = _829 * 6.283185482025146484375;
    float _861 = cos(_859);
    float _863 = fma(_773, _785, _853);
    float _865 = _387 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _867 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _191);
    float _869 = _793 * _837;
    float _871 = fma(_773, _801, _855);
    float _873 = _833 * _837;
    float _875 = _865 * _867;
    float _877 = _829 * 6.283185482025146484375;
    float _879 = sin(_877);
    float _881 = _833 * _847;
    float _883 = _793 * _847;
    float _885 = _863 + _787;
    float _887 = _857 + _761;
    float _889 = _871 + _803;
    float _891 = _885 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _893 = _833 * _861;
    float _895 = _793 * _861;
    float _897 = _847 * _861;
    float _899 = _837 * _861;
    float _901 = _893 * _817;
    float _903 = fma(_887, (*spvDescriptorSet0.vp_c8)._m0[11].x, _891);
    float _905 = fma(_879, _881, _869);
    float _907 = -_817;
    float _909 = _879 * _907;
    float _911 = -_883;
    float _913 = fma(_879, _873, _911);
    float _915 = -_873;
    float _917 = fma(_879, _883, _915);
    float _919 = fma(_905, _875, _901);
    float _921 = _895 * _817;
    float _923 = fma(_897, _875, _909);
    float _925 = fma(_879, _869, _881);
    float _927 = fma(_913, _849, _919);
    float _929 = fma(_917, _875, _921);
    float _931 = fma(_899, _849, _923);
    float _933 = _927 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _935 = fma(_925, _849, _929);
    float _937 = _927 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _939 = _927 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _941 = fma(_931, (*spvDescriptorSet0.vp_c8)._m0[26].x, _933);
    float _943 = fma(_931, (*spvDescriptorSet0.vp_c8)._m0[24].x, _937);
    float _945 = fma(_931, (*spvDescriptorSet0.vp_c8)._m0[25].x, _939);
    float _947 = fma(_935, (*spvDescriptorSet0.vp_c8)._m0[26].z, _941);
    float _949 = fma(_935, (*spvDescriptorSet0.vp_c8)._m0[24].z, _943);
    float _951 = fma(_935, (*spvDescriptorSet0.vp_c8)._m0[25].z, _945);
    float _953 = _947 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _955 = fma(_889, (*spvDescriptorSet0.vp_c8)._m0[11].z, _903);
    float _957 = _949 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _959 = _889 + _953;
    float _961 = _955 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _963 = _887 + _957;
    float _965 = _885 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _967 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _969 = _959 + _967;
    float _971 = 1.0 / _961;
    float _973 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _975 = _963 + _973;
    float _977 = fma(_887, (*spvDescriptorSet0.vp_c8)._m0[10].x, _965);
    float _979 = _969 * _969;
    float _981 = fma(_889, (*spvDescriptorSet0.vp_c8)._m0[10].z, _977);
    float _983 = fma(_975, _975, _979);
    float _985 = _951 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _987 = _981 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _989 = sqrt(_983);
    float _991 = _987 + _961;
    float _993 = _991 * _971;
    float _995 = _993 * 0.5;
    float _997 = _885 + _985;
    float _999 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1001 = fma(_995, (*spvDescriptorSet0.vp_c8)._m0[30].w, _999);
    float _1003 = 1.0 / _1001;
    bool _1005 = _989 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1007 = _963;
    float _1009 = _959;
    float _1011 = _921;
    float _1013 = _935;
    if (!_1005)
    {
        _393 = _997;
    }
    float _1015 = _393;
    bool _1017 = !_1005;
    float _1019 = _1015;
    if (!_1017)
    {
        float _1021 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1023 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1025 = _989 + _1023;
        float _1027 = _997 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1029 = rsqrt(_983);
        float _1031 = _1025 * _1021;
        float _1033 = _1031 * 0.15915493667125701904296875;
        float _1035 = _1033 * 6.283185482025146484375;
        float _1037 = cos(_1035);
        float _1039 = _1033 * 6.283185482025146484375;
        float _1041 = sin(_1039);
        float _1043 = _1037 + (-1.0);
        float _1045 = fma(_1041, _1027, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1047 = _1043 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1049 = _1029 * _1045;
        float _1051 = fma(_997, _1037, _1047);
        float _1053 = fma(_975, _1049, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1055 = fma(_969, _1049, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1007 = _1053;
        _1009 = _1055;
        _1019 = _1051;
    }
    float _1057 = _1007;
    float _1059 = _1009;
    float _1061 = _1019;
    float _1063 = _1061;
    float _1065 = _1057;
    float _1067 = _1059;
    if (_827)
    {
        _1011 = 1.0;
    }
    float _1069 = _1011;
    float _1071 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1073 = _1003 * _1071;
    float _1075 = _1069;
    if (!_815)
    {
        float _1077 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1079 = _885 + _1077;
        float _1081 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1083 = _887 + _1081;
        float _1085 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1087 = -_887;
        float _1089 = _1087 + _1057;
        float _1091 = _1079 * _1079;
        float _1093 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1095 = _889 + _1093;
        float _1097 = -_889;
        float _1099 = _1097 + _1059;
        float _1101 = fma(_1083, _1083, _1091);
        float _1103 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1105 = fma(_1095, _1095, _1101);
        float _1107 = sqrt(_1105);
        float _1109 = _1085 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1111 = -_885;
        float _1113 = _1111 + _1061;
        float _1115 = precise::min(_1107, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1117 = _1115 * _1103;
        float _1119 = _1109 * _1117;
        float _1121 = fma(_1113, _1119, _885);
        float _1123 = fma(_1089, _1119, _887);
        float _1125 = fma(_1099, _1119, _889);
        _1063 = _1121;
        _1065 = _1123;
        _1067 = _1125;
        _1013 = _1117;
    }
    float _1127 = _1063;
    float _1129 = _1065;
    float _1131 = _1067;
    float _1133 = _1013;
    float _1135 = _1133;
    if (!_827)
    {
        float _1137 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1139 = _1137 * 0.15915493667125701904296875;
        float _1141 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1143 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1145 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1143;
        float _1147 = _1139 * 6.283185482025146484375;
        float _1149 = cos(_1147);
        float _1151 = _1141 * 0.15915493667125701904296875;
        float _1153 = _1139 * 6.283185482025146484375;
        float _1155 = sin(_1153);
        float _1157 = 1.0 / _1149;
        float _1159 = _1151 * 6.283185482025146484375;
        float _1161 = cos(_1159);
        float _1163 = _1155 * _1157;
        float _1165 = _1151 * 6.283185482025146484375;
        float _1167 = sin(_1165);
        float _1169 = _1161 * _1163;
        float _1171 = 1.0 / _1145;
        float _1173 = 1.0 / _1169;
        float _1175 = _1167 * _1173;
        float _1177 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1179 = fma(_1073, _1175, _1177);
        float _1181 = _1179 * _1171;
        float _1183 = precise::clamp(_1181, 0.0, 1.0);
        _1135 = _1171;
        _1075 = _1183;
    }
    float _1185 = _1135;
    float _1187 = _1075;
    float _1189 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1191 = _1127 + _1189;
    float _1193 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1195 = _1129 + _1193;
    float _1197 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1199 = _1131 + _1197;
    float _1201 = _1191 * _1191;
    float _1203 = fma(_1195, _1195, _1201);
    float _1205 = fma(_887, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1207 = fma(_1199, _1199, _1203);
    float _1209 = rsqrt(_1207);
    float _1211 = sqrt(_1207);
    float _1213 = _1209 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1215 = _1195 * _1213;
    float _1217 = _1199 * _1213;
    float _1219 = _1215 * _1215;
    float _1221 = _1217 * _1217;
    float _1223 = _1219 + _1221;
    float _1225 = sqrt(_1223);
    bool _1227 = _1225 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1229 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1231 = _1225 + _1229;
    float _1233 = _1199;
    float _1235 = _1209;
    float _1237 = _1231;
    float _1239 = _1201;
    float _1241 = _1191;
    float _1243 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    float _1245 = _1223;
    if (_1227)
    {
        float _1247 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1233 = _1247;
    }
    float _1249 = _1233;
    if (_1227)
    {
        float _1251 = rsqrt(_1223);
        _1235 = _1251;
    }
    float _1253 = _1235;
    float _1255 = _1253;
    if (_1227)
    {
        float _1257 = _1231 * _1249;
        _1237 = _1257;
    }
    float _1259 = _1237;
    if (_1227)
    {
        float _1261 = _1259 * 0.15915493667125701904296875;
        _1239 = _1261;
    }
    float _1263 = _1239;
    float _1265 = _1249;
    float _1267 = _1263;
    if (_1227)
    {
        float _1269 = _1263 * 6.283185482025146484375;
        float _1271 = sin(_1269);
        _1265 = _1271;
    }
    float _1273 = _1265;
    float _1275 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1277 = precise::max(0.0, _1275);
    float _1279 = _1185;
    float _1281 = _1277;
    if (_1227)
    {
        float _1283 = _1263 * 6.283185482025146484375;
        float _1285 = cos(_1283);
        _1279 = _1285;
    }
    float _1287 = _1279;
    float _1289 = -_1213;
    float _1291 = -_1277;
    float _1293 = fma(_1191, _1289, _1291);
    if (_1227)
    {
        float _1295 = _1293 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1281 = _1295;
    }
    float _1297 = _1281;
    if (!_1227)
    {
        _1267 = _1219;
    }
    float _1299 = _1267;
    float _1301 = _1127 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1303 = _1273;
    float _1305 = _1299;
    if (_1227)
    {
        float _1307 = fma(_1273, _1297, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1303 = _1307;
    }
    float _1309 = _1303;
    float _1311 = fma(_1129, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1301);
    float _1313 = floor(_1205);
    float _1315 = _1309;
    float _1317 = _1287;
    if (_1227)
    {
        float _1319 = _1287 + (-1.0);
        _1241 = _1319;
    }
    float _1321 = _1241;
    float _1323 = _1321;
    if (_1227)
    {
        float _1325 = _1253 * _1309;
        _1243 = _1325;
    }
    float _1327 = _1243;
    if (!_1227)
    {
        _1315 = _1215;
    }
    float _1329 = _1315;
    float _1331 = fma(_1131, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1311);
    float _1333 = _1329;
    if (_1227)
    {
        float _1335 = _1321 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1245 = _1335;
    }
    float _1337 = _1245;
    if (_1227)
    {
        float _1339 = _1215 * _1327;
        _1333 = _1339;
    }
    float _1341 = _1333;
    if (!_1227)
    {
        _1323 = _1217;
    }
    float _1343 = _1323;
    float _1345 = _1343;
    if (_1227)
    {
        float _1347 = _1217 * _1327;
        _1345 = _1347;
    }
    float _1349 = _1345;
    if (!_1227)
    {
        _1255 = _1293;
    }
    float _1351 = _1255;
    float _1353 = _1351;
    if (_1227)
    {
        float _1355 = fma(_1293, _1287, _1337);
        _1353 = _1355;
    }
    float _1357 = _1353;
    if (_1227)
    {
        float _1359 = _1341 * _1341;
        _1305 = _1359;
    }
    float _1361 = _1305;
    float _1363 = _1127 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (!_1227)
    {
        _1317 = _1221;
    }
    float _1365 = _1317;
    float _1367 = _1365;
    if (_1227)
    {
        float _1369 = _1349 * _1349;
        _1367 = _1369;
    }
    float _1371 = _1367;
    float _1373 = fma(_1357, _1357, _1361);
    float _1375 = fma(_889, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1377 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1379 = _1127 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1381 = _1373 + _1371;
    float _1383 = _1127 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1385 = fma(_1129, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1363);
    float _1387 = fma(_1129, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1379);
    float _1389 = fma(_1129, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1383);
    float _1391 = rsqrt(_1381);
    float _1393 = fma(_1131, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1387);
    float _1395 = fma(_1131, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1385);
    float _1397 = fma(_1131, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1389);
    float _1399 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1401 = fma(_1211, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1399);
    float _1403 = precise::clamp(_1401, 0.0, 1.0);
    float _1405 = _1393 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1407 = _1395 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1409 = _1397 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1411 = -_1403;
    float _1413 = _1411 + 1.0;
    float _1415 = _1405 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1417 = _1407 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1419 = _1331 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1421 = abs(_1413);
    float _1423 = log2(_1421);
    float _1425 = fma(_1409, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1415);
    float _1427 = -_1417;
    float _1429 = fma(_1427, _1377, 1.0);
    float _1431 = -_1313;
    float _1433 = _1205 + _1431;
    float _1435 = _1391 * _1341;
    float _1437 = fma(_1407, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1425);
    float _1439 = _1391 * _1349;
    float _1441 = _1405 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1443 = _1435 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1445 = fma(_1419, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1437);
    float _1447 = _1391 * _1357;
    float _1449 = floor(_1375);
    float _1451 = fma(_1409, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1441);
    float _1453 = -_1443;
    float _1455 = fma(_1447, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1453);
    float _1457 = _1423 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1459 = -_1439;
    float _1461 = fma(_1459, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1455);
    float _1463 = log2(_1429);
    float _1465 = _1405 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1467 = fma(_1461, -0.5, 0.5);
    float _1469 = fma(_1461, 0.5, 0.5);
    float _1471 = fma(_1409, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1465);
    float _1473 = 1.0 / _1445;
    float _1475 = -_1449;
    float _1477 = _1375 + _1475;
    float _1479 = fma(_1469, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1481 = fma(_1407, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1471);
    float _1483 = fma(_1407, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1451);
    float _1485 = _1447 + 1.0;
    float _1487 = fma(_1469, _1479, -0.212114393711090087890625);
    float _1489 = fma(_1419, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1481);
    float _1491 = sqrt(_1467);
    float _1493 = fma(_1419, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1483);
    float _1495 = _1463 * 0.693147182464599609375;
    float _1497 = fma(_1469, _1487, 1.570728778839111328125);
    float _1499 = _1495 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1501 = exp2(_1457);
    float _1503 = _1489 * _1473;
    float _1505 = _1493 * _1473;
    float _1507 = fma(_1503, 0.5, 0.5);
    float _1509 = fma(_1505, -0.5, 0.5);
    float _1511 = _1491 * 0.636619746685028076171875;
    float2 _5489 = float2(_1433, _1477);
    float _1513 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5489, float2(0.0), isnan(_5489)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5489, float2(0.0), isnan(_5489)), level(0.0)).x;
    float3 _5500 = float3(_1507, _1509, _1499);
    float _1515 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5500, float3(0.0), isnan(_5500)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5500, float3(0.0), isnan(_5500)), level(0.0)).x;
    float _1517 = -_1447;
    float _1519 = fma(_1501, _1485, _1517);
    float _1521 = -_1497;
    float _1523 = fma(_1511, _1521, 1.0);
    float _1525 = fma(_1519, 0.5, 0.5);
    float3 _5524 = float3(_1507, _1509, _1499);
    float4 _1528 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5524, float3(0.0), isnan(_5524)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5524, float3(0.0), isnan(_5524)), level(0.0)).xyzw;
    float _1530 = _1528.x;
    float _1532 = _1528.y;
    float _1534 = _1528.z;
    float _1536 = _1528.w;
    float2 _5540 = float2(_1523, _1525);
    float3 _1540 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5540, float2(0.0), isnan(_5540)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5540, float2(0.0), isnan(_5540)), level(0.0)).xyz;
    float _1542 = _1540.x;
    float _1544 = _1540.y;
    float _1546 = _1540.z;
    float _1548 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1550 = int(_1548);
    out.m_72.x = _865;
    bool _1552 = _155 > 0.5;
    float _1554 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1556 = _409 + _1554;
    int _1558 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1560 = _1558 != 0;
    float _1562 = -_695;
    float _1564 = _1562 + 1.0;
    float _1566 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _1568 = int(_1566);
    float _1570 = _1423 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1572 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1574 = _1572 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    int _1576 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1578 = _1576 != 0;
    float _1580 = _1405 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _1582 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1584 = _1582 != 0;
    float _1586 = trunc(_603);
    int _1588 = int(_1586);
    float _1590 = float(uint(_1550));
    float _1592 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1594 = _1592 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1596 = _1507;
    float _1598 = _1477;
    float _1600 = (*spvDescriptorSet0.vp_c9)._m0[7].z;
    float _1602 = _1445;
    if (_1560)
    {
        _1596 = _155;
    }
    float _1604 = _1596;
    float _1606 = fma(_1409, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1580);
    float _1608 = _1604;
    if (!_1560)
    {
        _1608 = _411;
    }
    float _1610 = _1608;
    if (_1560)
    {
        _1598 = 1.0;
    }
    float _1612 = _1598;
    float _1614 = 1.0 / _1590;
    float _1616 = float(uint(_1568));
    float _1618 = _1612;
    if (_1560)
    {
        _1600 = 1.0;
    }
    float _1620 = _1600;
    float _1622 = _1620;
    if (!_1560)
    {
        _1618 = 7.345489978790283203125;
    }
    float _1624 = _1618;
    if (!_1560)
    {
        _1622 = 5.839270114898681640625;
    }
    float _1626 = _1622;
    float _1628 = 1.0 / _1616;
    float _1630 = float(uint(_1588));
    int _1632 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1634 = _1632 != 0;
    float _1636 = _1626 * _1610;
    int _1638 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _1640 = _1638 != 0;
    int _1642 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1644 = _1642 != 0;
    float _1646 = trunc(_665);
    int _1648 = int(_1646);
    float _1650 = -_191;
    int _1652 = _1552 ? as_type<int>(_1650) : as_type<int>(_191);
    bool _1654 = _419 > 0.5;
    bool _1656 = !_1578;
    float _1658 = _1656 ? _191 : as_type<float>(_1652);
    float _1660 = _191 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1662 = -_195;
    int _1664 = _1654 ? as_type<int>(_1662) : as_type<int>(_195);
    float _1666 = 1.0 / _1574;
    int _1668 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1670 = _1668 != 0;
    int _1672 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _1674 = _1672 != 0;
    int _1676 = as_type<int>(_1614) + (-2);
    float _1678 = 1.0 / _1594;
    int _1680 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _1682 = _1680 != 0;
    float _1684 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1686 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1684;
    float _1688 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1690 = _1688 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1692 = as_type<float>(_1676) * _1630;
    int _1694 = as_type<int>(_1628) + (-2);
    float _1696 = float(uint(_1648));
    float _1698 = _1686 * _1666;
    float _1700 = trunc(_1692);
    float _1702 = precise::max(_1700, 0.0);
    uint _1705 = uint(_1702);
    float _1707 = as_type<float>(_1694) * _1696;
    int _1709 = ~_1550;
    int _1711 = _1709 + 1;
    float _1713 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1715 = _1713 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1717 = fma(_1698, _1556, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1719 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1721 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _1719;
    float _1723 = _1624 * _155;
    float _1725 = trunc(_1707);
    float _1727 = precise::max(_1725, 0.0);
    uint _1729 = uint(_1727);
    int _1731 = ~_1568;
    int _1733 = _1731 + 1;
    float _1735 = _1721 * _1678;
    bool _1737 = _409 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1739 = isnan(_409);
    bool _1741 = _1737 || _1739;
    bool _1743 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1745 = _1741 || _1743;
    float _1747 = float(_1745);
    bool _1749 = _409 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1751 = isnan(_409);
    bool _1753 = _1749 || _1751;
    bool _1755 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1757 = _1753 || _1755;
    float _1759 = float(_1757);
    float _1761 = 1.0 / _1715;
    int _1763 = _1711 * int(_1705);
    int _1765 = _1763 + _1588;
    int _1767 = ~_1568;
    int _1769 = _1767 + 1;
    float _1771 = float(_1588);
    float _1773 = float(uint(_1765));
    int _1775 = _1733 * int(_1729);
    int _1777 = _1775 + _1648;
    bool _1779 = _409 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1781 = isnan(_409);
    bool _1783 = _1779 || _1781;
    bool _1785 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1787 = _1783 || _1785;
    float _1789 = float(_1787);
    float _1791 = floor(_1723);
    float _1793 = as_type<float>(_1676) * _1773;
    float _1795 = -_1759;
    float _1797 = _1795 + 1.0;
    float _1799 = float(uint(_1777));
    int _1801 = abs(_519);
    float _1803 = _1690 * _1761;
    float _1805 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1807 = _409 + _1805;
    float _1809 = as_type<float>(_1694) * _1799;
    float _1811 = trunc(_1793);
    float _1813 = precise::max(_1811, 0.0);
    uint _1815 = uint(_1813);
    float _1817 = float(_1648);
    float _1819 = fma(_1803, _1807, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1821 = -_1747;
    float _1823 = _1821 + 1.0;
    bool _1825 = _409 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1827 = isnan(_409);
    bool _1829 = _1825 || _1827;
    bool _1831 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1833 = _1829 || _1831;
    float _1835 = float(_1833);
    float _1837 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1839 = _409 + _1837;
    int _1841 = abs(_525);
    float _1843 = _1759 * _1823;
    float _1845 = trunc(_1809);
    float _1847 = precise::max(_1845, 0.0);
    uint _1849 = uint(_1847);
    float _1851 = _1789 * _1797;
    float _1853 = -_1789;
    float _1855 = _1853 + 1.0;
    bool _1857 = !_1644;
    float _1859 = _1857 ? _195 : as_type<float>(_1664);
    float _1861 = fma(_1735, _1839, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _1863 = _1658 + 0.5;
    float _1865 = _1835 * _1855;
    int _1867 = ~_1550;
    int _1869 = _1867 + 1;
    float _1871 = _1859 + (-0.5);
    int _1873 = int(_1705) + int(_1815);
    float _1875 = fma(_1863, (*spvDescriptorSet0.vp_c9)._m0[80].x, _463);
    float _1877 = -_1871;
    float _1879 = -_533;
    float _1881 = fma(_1877, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1879);
    float _1883 = floor(_1636);
    float _1885 = float(_1550);
    float _1887 = _1717 * _1865;
    int _1889 = int(_1729) + int(_1849);
    int _1891 = _1869 * _1873;
    int _1893 = _1891 + _1588;
    float _1895 = -_1791;
    float _1897 = _1723 + _1895;
    float _1899 = -_1835;
    float _1901 = _1899 + 1.0;
    bool _1903 = _1771 >= _1885;
    bool _1905 = isnan(_1771);
    bool _1907 = _1903 || _1905;
    bool _1909 = isnan(_1885);
    bool _1911 = _1907 || _1909;
    float _1913 = float(_1911);
    float _1915 = fma(_1859, _1564, _1881);
    bool _1917 = uint(_1893) >= uint(_1550);
    int _1919 = _1769 * _1889;
    int _1921 = _1919 + _1648;
    float _1923 = fma(_1901, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1887);
    float _1925 = _1897 * _1885;
    bool _1927 = !_1917;
    int _1929 = _1927 ? 0 : (-1);
    float _1931 = trunc(_1913);
    int _1933 = int(_1931);
    bool _1935 = uint(_1921) >= uint(_1568);
    float _1937 = fma(_1819, _1851, _1923);
    float _1939 = float(_1568);
    float _1941 = -_1883;
    float _1943 = _1636 + _1941;
    bool _1945 = !_1935;
    int _1947 = _1945 ? 0 : (-1);
    float _1949 = _1885 * _455;
    int _1951 = ~_1873;
    int _1953 = _1951 + _1929;
    int _1955 = _1953 + 1;
    float _1957 = trunc(_1925);
    int _1959 = int(_1957);
    int _1961 = ~_1889;
    int _1963 = _1961 + _1947;
    int _1965 = _1963 + 1;
    float _1967 = _1939 * _455;
    bool _1969 = !_1584;
    int _1971 = _1969 ? 0 : 1;
    float _1973 = _1943 * _1939;
    bool _1975 = _1817 >= _1939;
    bool _1977 = isnan(_1817);
    bool _1979 = _1975 || _1977;
    bool _1981 = isnan(_1939);
    bool _1983 = _1979 || _1981;
    float _1985 = float(_1983);
    float _1987 = fma(_1861, _1843, _1937);
    int _1989 = abs(_1971);
    int _1991 = _1550 * _1955;
    int _1993 = _1991 + _1588;
    bool _1995 = !_1682;
    int _1997 = _1995 ? 0 : 1;
    float _1999 = trunc(_1985);
    int _2001 = int(_1999);
    bool _2003 = _1550 == 0;
    int _2005 = _1568 * _1965;
    int _2007 = _2005 + _1648;
    int _2009 = abs(_1997);
    float _2011 = fma(_1747, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1987);
    int _2013 = ~_1933;
    int _2015 = _2013 + 1;
    int _2017 = _2015 + 1;
    bool _2019 = !_2003;
    int _2021 = _2019 ? _1993 : (-1);
    float _2023 = trunc(_1973);
    int _2025 = int(_2023);
    int _2027 = _1550 + (-1);
    bool _2029 = _1568 == 0;
    int _2031 = _2021 * _2017;
    int _2033 = _1959 * _1989;
    int _2035 = _2033 + _1588;
    bool _2037 = !_2029;
    int _2039 = _2037 ? _2007 : (-1);
    float _2041 = trunc(_1949);
    int _2043 = int(_2041);
    int _2045 = _1933 * _2027;
    int _2047 = _2045 + _2031;
    int _2049 = abs(_453);
    int _2051 = ~_2001;
    int _2053 = _2051 + 1;
    int _2055 = _2053 + 1;
    float _2057 = float(uint(_2035));
    int _2059 = _2047 * _2049;
    int _2061 = abs(_459);
    int _2063 = _2025 * _2009;
    int _2065 = _2063 + _1648;
    float _2067 = trunc(_1967);
    int _2069 = int(_2067);
    int _2071 = _1568 + (-1);
    int _2073 = _2039 * _2055;
    float _2075 = as_type<float>(_1676) * _2057;
    int _2077 = _2043 * _2061;
    int _2079 = _2077 + _2059;
    float _2081 = float(uint(_2065));
    int _2083 = _2001 * _2071;
    int _2085 = _2083 + _2073;
    float _2087 = exp2(_1570);
    int _2089 = _2085 * _1801;
    float _2091 = as_type<float>(_1694) * _2081;
    int _2093 = abs(_467);
    float _2095 = trunc(_2075);
    float _2097 = precise::max(_2095, 0.0);
    uint _2099 = uint(_2097);
    int _2101 = ~_1550;
    int _2103 = _2101 + 1;
    int _2105 = _2069 * _1841;
    int _2107 = _2105 + _2089;
    bool _2109 = !_1670;
    int _2111 = _2109 ? 0 : 1;
    int _2113 = _2035 * _2093;
    int _2115 = _2113 + _2079;
    int _2117 = abs(_531);
    float _2119 = trunc(_2091);
    float _2121 = precise::max(_2119, 0.0);
    uint _2123 = uint(_2121);
    int _2125 = abs(_2111);
    float _2127 = -_2087;
    float _2129 = _2127 + 1.0;
    int _2131 = ~_1568;
    int _2133 = _2131 + 1;
    int _2135 = _2065 * _2117;
    int _2137 = _2135 + _2107;
    bool _2139 = !_1674;
    int _2141 = _2139 ? 0 : 1;
    int _2143 = _1959 * _2125;
    int _2145 = _2143 + _2115;
    int _2147 = _2103 * int(_2099);
    int _2149 = _2147 + _2035;
    int _2151 = ~_1550;
    int _2153 = _2151 + 1;
    float _2155 = _2129 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2157 = float(uint(_2145));
    float _2159 = float(uint(_2149));
    int _2161 = abs(_2141);
    float _2163 = -_683;
    float _2165 = _2163 + 1.0;
    int _2167 = _2133 * int(_2123);
    int _2169 = _2167 + _2065;
    float _2171 = as_type<float>(_1676) * _2159;
    int _2173 = _2025 * _2161;
    int _2175 = _2173 + _2137;
    float _2177 = as_type<float>(_1676) * _2157;
    float _2179 = -_2165;
    float _2181 = fma(_1658, _2179, _1875);
    float _2183 = float(uint(_2169));
    float _2185 = trunc(_2171);
    float _2187 = precise::max(_2185, 0.0);
    uint _2189 = uint(_2187);
    float _2191 = as_type<float>(_1694) * _2183;
    float _2193 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    out.m_74.x = _2181;
    out.m_74.y = _1915;
    float _2195 = trunc(_2177);
    float _2197 = precise::max(_2195, 0.0);
    uint _2199 = uint(_2197);
    float _2201 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2203 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2205 = _2193 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2207 = _2201 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2209 = _2203 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2211 = trunc(_2191);
    float _2213 = precise::max(_2211, 0.0);
    uint _2215 = uint(_2213);
    float _2217 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2219 = float(uint(_2175));
    int _2221 = ~_1568;
    int _2223 = _2221 + 1;
    int _2225 = int(_2099) + int(_2189);
    out.m_76.x = _2205;
    out.m_76.y = _2207;
    out.m_76.z = _2209;
    out.m_76.w = _2217;
    float _2227 = abs(_1073);
    float _2229 = log2(_2227);
    int _2231 = _2153 * int(_2199);
    int _2233 = _2231 + _2145;
    float _2235 = as_type<float>(_1694) * _2219;
    float _2237 = float(uint(_2233));
    int _2239 = int(_2123) + int(_2215);
    float _2241 = trunc(_2235);
    float _2243 = precise::max(_2241, 0.0);
    uint _2245 = uint(_2243);
    float _2247 = as_type<float>(_1676) * _2237;
    float _2249 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    int _2251 = ~_1550;
    int _2253 = _2251 + 1;
    float _2255 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2257 = _2229 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2259 = trunc(_2247);
    float _2261 = precise::max(_2259, 0.0);
    uint _2263 = uint(_2261);
    int _2265 = _2253 * _2225;
    int _2267 = _2265 + _2035;
    float _2269 = _2249 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2271 = _2255 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2273 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2275 = _2011 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    bool _2277 = uint(_2267) >= uint(_1550);
    int _2279 = _2223 * int(_2245);
    int _2281 = _2279 + _2175;
    float _2283 = exp2(_2257);
    float _2285 = _2273 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2287 = -_1513;
    float _2289 = _2287 + 1.0;
    float _2291 = float(uint(_2281));
    float _2293 = _2155 * _1515;
    out.m_78.x = _2269;
    out.m_78.y = _2271;
    out.m_78.z = _2285;
    out.m_78.w = _2275;
    int _2295 = int(_2199) + int(_2263);
    float _2297 = _893 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2299 = as_type<float>(_1694) * _2291;
    int _2301 = ~_1568;
    int _2303 = _2301 + 1;
    float _2305 = trunc(_2299);
    float _2307 = precise::max(_2305, 0.0);
    uint _2309 = uint(_2307);
    int _2311 = _2303 * _2239;
    int _2313 = _2311 + _2065;
    float _2315 = fma(_2283, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2317 = precise::clamp(_2315, 0.0, 1.0);
    int _2319 = ~_1550;
    int _2321 = _2319 + 1;
    float _2323 = _893 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2325 = _893 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2327 = -_879;
    float _2329 = fma(_2327, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2297);
    int _2331 = ~_1568;
    int _2333 = _2331 + 1;
    float _2335 = -_879;
    float _2337 = fma(_2335, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2323);
    int _2339 = _2321 * _2295;
    int _2341 = _2339 + _2145;
    float _2343 = -_879;
    float _2345 = fma(_2343, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2325);
    bool _2347 = uint(_2313) >= uint(_1568);
    float _2349 = fma(_2317, -2.0, 3.0);
    int _2351 = int(_2245) + int(_2309);
    float _2353 = _2317 * _2317;
    bool _2355 = uint(_2341) >= uint(_1550);
    float _2357 = fma(_895, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2345);
    float _2359 = _905 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2361 = _2333 * _2351;
    int _2363 = _2361 + _2175;
    bool _2365 = !_2355;
    int _2367 = _2365 ? 0 : (-1);
    float _2369 = fma(_895, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2337);
    float _2371 = _905 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2373 = _913 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    bool _2375 = uint(_2363) >= uint(_1568);
    float _2377 = fma(_897, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2359);
    int _2379 = ~_2295;
    int _2381 = _2379 + _2367;
    int _2383 = _2381 + 1;
    float _2385 = fma(_897, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2371);
    bool _2387 = !_2375;
    int _2389 = _2387 ? 0 : (-1);
    float _2391 = _2353 * _2349;
    float _2393 = fma(_899, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2373);
    int _2395 = _1550 * _2383;
    int _2397 = _2395 + _2145;
    int _2399 = ~_2351;
    int _2401 = _2399 + _2389;
    int _2403 = _2401 + 1;
    float _2405 = _913 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _2407 = !_2347;
    int _2409 = _2407 ? 0 : (-1);
    float _2411 = -_2391;
    float _2413 = _2411 + 1.0;
    float _2415 = _913 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2417 = _1568 * _2403;
    int _2419 = _2417 + _2175;
    bool _2421 = !_2003;
    int _2423 = _2421 ? _2397 : (-1);
    float _2425 = fma(_899, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2405);
    int _2427 = ~_2239;
    int _2429 = _2427 + _2409;
    int _2431 = _2429 + 1;
    float _2433 = fma(_925, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2393);
    bool _2435 = !_2029;
    int _2437 = _2435 ? _2419 : (-1);
    float _2439 = fma(_2413, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2391);
    bool _2441 = !_2277;
    int _2443 = _2441 ? 0 : (-1);
    float _2445 = _905 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2447 = _2423 >> 31;
    float _2449 = fma(_899, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2415);
    int _2451 = _2437 >> 31;
    float _2453 = fma(_895, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2329);
    int _2455 = ~_2225;
    int _2457 = _2455 + _2443;
    int _2459 = _2457 + 1;
    float _2461 = _195 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _2463 = _2447 & 3;
    float _2465 = fma(_897, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2445);
    int _2467 = _2451 & 3;
    int _2469 = _1550 * _2459;
    int _2471 = _2469 + _2035;
    int _2473 = _2423 + _2463;
    int _2475 = _1568 * _2431;
    int _2477 = _2475 + _2065;
    int _2479 = _2437 + _2467;
    float _2481 = _2461 * _2369;
    int _2483 = _2423 & 3;
    bool _2485 = _2483 != 0;
    float _2487 = fma(_925, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2425);
    int _2489 = _2473 >> 2;
    float _2491 = fma(_925, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2449);
    int _2493 = _2423 & 3;
    bool _2495 = _2493 != 0;
    float _2497 = fma(_917, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2377);
    int _2499 = _2479 >> 2;
    int _2501 = _2489 << 4;
    int _2503 = _2501 + 368;
    float _2505 = fma(_917, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2385);
    bool _2507 = uint(_2493) >= 2u;
    int _2509 = _2499 << 4;
    int _2511 = _2509 + 656;
    uint _2513 = uint(int(uint(_2503) >> uint(2)));
    uint _2515 = uint(int(uint(int(_2513)) >> uint(2)));
    int _2517 = int(_2513) & 3;
    float _2519 = (*spvDescriptorSet0.vp_c9)._m0[int(_2515)][_2517];
    int _2521 = int(_2513) + 1;
    uint _2523 = uint(int(uint(_2521) >> uint(2)));
    int _2525 = _2521 & 3;
    float _2527 = (*spvDescriptorSet0.vp_c9)._m0[int(_2523)][_2525];
    int _2529 = _2507 ? 0 : 1;
    float _2531 = fma(_1660, _2505, _2481);
    int _2533 = _2485 ? 0 : 1;
    float _2535 = fma(_917, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2465);
    bool _2537 = _2493 != 3;
    bool _2539 = uint(_2493) > 1u;
    uint _2541 = uint(int(uint(_2511) >> uint(2)));
    uint _2543 = uint(int(uint(int(_2541)) >> uint(2)));
    int _2545 = int(_2541) & 3;
    float _2547 = (*spvDescriptorSet0.vp_c9)._m0[int(_2543)][_2545];
    int _2549 = int(_2541) + 1;
    uint _2551 = uint(int(uint(_2549) >> uint(2)));
    int _2553 = _2549 & 3;
    float _2555 = (*spvDescriptorSet0.vp_c9)._m0[int(_2551)][_2553];
    int _2557 = ~_2529;
    int _2559 = _2557 + 1;
    int _2561 = _2559 + 1;
    out.m_80.x = _2505;
    out.m_80.y = _2497;
    out.m_80.z = _2535;
    int _2563 = ~_2533;
    int _2565 = _2563 + 1;
    int _2567 = _2565 + 1;
    bool _2569 = !_2495;
    int _2571 = _2569 ? 0 : 1;
    bool _2573 = _1073 <= 8000.0;
    bool _2575 = isnan(_1073);
    bool _2577 = _2573 || _2575;
    bool _2579 = isnan(8000.0);
    bool _2581 = _2577 || _2579;
    float _2583 = float(_2581);
    int _2585 = _2503 + 8;
    uint _2587 = uint(int(uint(_2585) >> uint(2)));
    uint _2589 = uint(int(uint(int(_2587)) >> uint(2)));
    int _2591 = int(_2587) & 3;
    float _2593 = (*spvDescriptorSet0.vp_c9)._m0[int(_2589)][_2591];
    int _2595 = int(_2587) + 1;
    uint _2597 = uint(int(uint(_2595) >> uint(2)));
    int _2599 = _2595 & 3;
    float _2601 = (*spvDescriptorSet0.vp_c9)._m0[int(_2597)][_2599];
    bool _2603 = !_2029;
    int _2605 = _2603 ? _2477 : (-1);
    int _2607 = _2561;
    int _2609 = _2567;
    if (_2537)
    {
        int _2611 = ~_2529;
        int _2613 = _2611 + 1;
        _2607 = _2613;
    }
    int _2615 = _2607;
    float _2617 = _2461 * _2453;
    if (!_2539)
    {
        int _2619 = ~_2533;
        int _2621 = _2619 + 1;
        _2609 = _2621;
    }
    int _2623 = _2609;
    float _2625 = _2583 * _2439;
    int _2627 = _2437 & 3;
    bool _2629 = _2627 != 0;
    int _2631 = _2437 & 3;
    bool _2633 = _2631 != 0;
    float _2635 = _2461 * _2357;
    bool _2637 = uint(_2627) > 1u;
    float _2639 = _2625 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    int _2641 = _2633 ? 0 : 1;
    float _2643 = fma(_1660, _2497, _2635);
    bool _2645 = !_2629;
    int _2647 = _2645 ? 0 : 1;
    int _2649 = _2511 + 8;
    uint _2651 = uint(int(uint(_2649) >> uint(2)));
    uint _2653 = uint(int(uint(int(_2651)) >> uint(2)));
    int _2655 = int(_2651) & 3;
    float _2657 = (*spvDescriptorSet0.vp_c9)._m0[int(_2653)][_2655];
    int _2659 = int(_2651) + 1;
    uint _2661 = uint(int(uint(_2659) >> uint(2)));
    int _2663 = _2659 & 3;
    float _2665 = (*spvDescriptorSet0.vp_c9)._m0[int(_2661)][_2663];
    float _2667 = fma(_1660, _2535, _2617);
    bool _2669 = uint(_2627) >= 2u;
    float _2671 = _2289 * _2639;
    float _2673 = precise::clamp(_2671, 0.0, 1.0);
    int _2675 = ~_2641;
    int _2677 = _2675 + 1;
    int _2679 = _2677 + 1;
    int _2681 = abs(_2623);
    int _2683 = _2679;
    if (!_2637)
    {
        int _2685 = ~_2641;
        int _2687 = _2685 + 1;
        _2683 = _2687;
    }
    int _2689 = _2683;
    int _2691 = _2669 ? 0 : 1;
    bool _2693 = _2493 != 3;
    int _2695 = abs(_2689);
    int _2697 = abs(_2571);
    bool _2699 = _2627 != 3;
    int _2701 = ~_2681;
    int _2703 = _2701 + 1;
    int _2705 = _2703 + 1;
    int _2707 = ~_2695;
    int _2709 = _2707 + 1;
    int _2711 = _2709 + 1;
    int _2713 = abs(_2647);
    int _2715 = _2705 * as_type<int>(_2527);
    int _2717 = abs(_2615);
    int _2719 = _2711 * as_type<int>(_2555);
    int _2721 = ~_2697;
    int _2723 = _2721 + 1;
    int _2725 = _2723 + 1;
    int _2727 = ~_2717;
    int _2729 = _2727 + 1;
    int _2731 = _2729 + 1;
    int _2733 = _2725 * as_type<int>(_2519);
    int _2735 = _2733 + _2715;
    int _2737 = ~_2691;
    int _2739 = _2737 + 1;
    int _2741 = _2739 + 1;
    float _2743 = fma(_2461, _2461, 1.0);
    int _2745 = _2741;
    if (_2699)
    {
        int _2747 = ~_2691;
        int _2749 = _2747 + 1;
        _2745 = _2749;
    }
    int _2751 = _2745;
    int _2753 = _2731 * as_type<int>(_2593);
    int _2755 = _2753 + _2735;
    int _2757 = ~_2713;
    int _2759 = _2757 + 1;
    int _2761 = _2759 + 1;
    float _2763 = fma(_1407, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1606);
    bool _2765 = !_2693;
    int _2767 = _2765 ? 0 : (-1);
    float _2769 = rsqrt(_2743);
    bool _2771 = _2627 != 3;
    int _2773 = _2761 * as_type<int>(_2547);
    int _2775 = _2773 + _2719;
    int _2777 = abs(_2751);
    float _2779 = fma(_1419, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2763);
    bool _2781 = !_1634;
    int _2783 = _2781 ? 0 : 1;
    int _2785 = abs(_2767);
    bool _2787 = !_2771;
    int _2789 = _2787 ? 0 : (-1);
    out.gl_Position.x = _1489;
    out.gl_Position.y = _1493;
    out.gl_Position.z = _2779;
    out.gl_Position.w = _1445;
    bool _2791 = !_1640;
    int _2793 = _2791 ? 0 : 1;
    int _2795 = abs(_2783);
    int _2797 = abs(_2789);
    int _2799 = ~_2777;
    int _2801 = _2799 + 1;
    int _2803 = _2801 + 1;
    int _2805 = abs(_2793);
    int _2807 = ~_2785;
    int _2809 = _2807 + 1;
    int _2811 = _2809 + 1;
    int _2813 = _2803 * as_type<int>(_2657);
    int _2815 = _2813 + _2775;
    int _2817 = ~_2797;
    int _2819 = _2817 + 1;
    int _2821 = _2819 + 1;
    float _2823 = _2461 * _2769;
    int _2825 = _2811 * as_type<int>(_2601);
    int _2827 = _2825 + _2755;
    int _2829 = _2821 * as_type<int>(_2665);
    int _2831 = _2829 + _2815;
    int _2833 = ~_2795;
    int _2835 = _2833 + 1;
    int _2837 = _2835 + 1;
    float _2839 = -_2491;
    float _2841 = _2823 * _2839;
    int _2843 = ~_2805;
    int _2845 = _2843 + 1;
    int _2847 = _2845 + 1;
    float _2849 = _2779 + _1445;
    bool _2851 = !_2003;
    int _2853 = _2851 ? _2471 : (-1);
    int _2855 = _2827 * _2837;
    float _2857 = -_2433;
    float _2859 = _2823 * _2857;
    int _2861 = _2831 * _2847;
    float _2863 = -_2487;
    float _2865 = _2823 * _2863;
    int _2867 = _2853 * _2795;
    int _2869 = _2867 + _2855;
    float _2871 = _1489 + _1445;
    int _2873 = _2605 * _2805;
    int _2875 = _2873 + _2861;
    float _2877 = fma(_2769, _2369, _2865);
    float _2879 = fma(_2769, _2357, _2859);
    float _2881 = in.m_82.x;
    float _2883 = fma(_2769, _2453, _2841);
    float _2885 = _1445 * 0.5;
    float _2887 = float(_2869);
    float _2889 = _1546 * _2293;
    float _2891 = -_2155;
    float _2893 = _2891 + 1.0;
    out.m_84.x = _2877;
    out.m_84.y = _2879;
    out.m_84.z = _2883;
    float _2895 = fma(_1493, -0.5, _2885);
    float _2897 = _1536 * _2293;
    out.m_86.x = _2887;
    float _2899 = _2849 * 0.5;
    float _2901 = _2871 * 0.5;
    float _2903 = float(_2875);
    float _2905 = _2487 + _2531;
    float _2907 = _2433 + _2643;
    float _2909 = _2491 + _2667;
    float _2911 = fma(_1542, _2897, _1530);
    float _2913 = fma(_1544, _2897, _1532);
    float _2915 = _1536 * _2893;
    float _2917 = fma(_1536, _2889, _1534);
    out.m_88.x = _2901;
    out.m_88.y = _2895;
    out.m_88.z = _2899;
    out.m_88.w = _1445;
    float _2919 = -_2673;
    float _2921 = fma(_2919, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    bool _2923 = _1211 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2925 = isnan(_1211);
    bool _2927 = _2923 || _2925;
    bool _2929 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2931 = _2927 || _2929;
    float _2933 = _1187 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_86.z = _2903;
    float _2935 = _2921 * _2881;
    out.m_90.x = _2911;
    out.m_90.y = _2913;
    out.m_90.z = _2917;
    out.m_90.w = _2915;
    float _2937 = _2935 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_92.x = _2905;
    out.m_92.y = _2907;
    out.m_92.z = _2909;
    float _2939 = _2879;
    float _2941 = (*spvDescriptorSet0.vp_c15)._m0[653].y;
    float _2943 = _2779;
    float _2945 = _2897;
    float _2947 = _2893;
    if (!_2931)
    {
        _2939 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2949 = _2939;
    out.m_94.x = _2937;
    float _2951 = _2949;
    float _2953 = _2949;
    if (!_2931)
    {
        _2941 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2955 = _2941;
    float _2957 = _2955;
    float _2959 = _2955;
    if (!_2931)
    {
        _1602 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2961 = _1602;
    float _2963 = _2961;
    float _2965 = _2961;
    if (!_2931)
    {
        _2943 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2967 = _2943;
    float _2969 = _2967;
    float _2971 = _2967;
    if (!_2931)
    {
        _2945 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2973 = _2945;
    float _2975 = _2973;
    float _2977 = _2973;
    if (!_2931)
    {
        _2947 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2979 = _2947;
    bool _2981 = !_2931;
    float _2983 = _2979;
    float _2985 = _2979;
    if (!_2981)
    {
        bool _2987 = _1211 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2989 = isnan(_1211);
        bool _2991 = _2987 || _2989;
        bool _2993 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2995 = _2991 || _2993;
        if (!_2995)
        {
            float _2997 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2999 = _1211 + _2997;
            float _3001 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3003 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3001;
            float _3005 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3007 = _3005 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3009 = 1.0 / _3003;
            float _3011 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3013 = _3011 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3015 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3017 = _3015 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3019 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3021 = _3019 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3023 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3025 = _3023 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3027 = _2999 * _3009;
            float _3029 = precise::clamp(_3027, 0.0, 1.0);
            float _3031 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3033 = _3031 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3035 = fma(_3029, _3007, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3037 = fma(_3029, _3033, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3039 = fma(_3029, _3013, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3041 = fma(_3029, _3017, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3043 = fma(_3029, _3021, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3045 = fma(_3029, _3025, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2959 = _3039;
            _2977 = _3043;
            _2953 = _3035;
            _2971 = _3041;
            _2965 = _3037;
            _2985 = _3045;
            _3047 = true;
        }
        else
        {
            bool _3049 = _1211 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3051 = isnan(_1211);
            bool _3053 = _3049 || _3051;
            bool _3055 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3057 = _3053 || _3055;
            if (!_3057)
            {
                _2951 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3059 = _2951;
            _2953 = _3059;
            if (!_3057)
            {
                _2957 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3061 = _2957;
            _2959 = _3061;
            if (!_3057)
            {
                _2963 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3063 = _2963;
            _2965 = _3063;
            if (!_3057)
            {
                _2969 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3065 = _2969;
            _2971 = _3065;
            if (!_3057)
            {
                _2975 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3067 = _2975;
            _2977 = _3067;
            if (!_3057)
            {
                _2983 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3069 = _2983;
            bool _3071 = !_3057;
            _2985 = _3069;
            if (!_3071)
            {
                bool _3073 = _1211 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3075 = isnan(_1211);
                bool _3077 = _3073 || _3075;
                bool _3079 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3081 = _3077 || _3079;
                if (!_3081)
                {
                    float _3083 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3085 = _1211 + _3083;
                    float _3087 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3089 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3087;
                    float _3091 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3093 = _3091 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3095 = 1.0 / _3089;
                    float _3097 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3099 = _3097 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3101 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3103 = _3101 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3105 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3107 = _3105 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3109 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3111 = _3109 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3113 = _3085 * _3095;
                    float _3115 = precise::clamp(_3113, 0.0, 1.0);
                    float _3117 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3119 = _3117 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3121 = fma(_3115, _3093, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3123 = fma(_3115, _3119, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3125 = fma(_3115, _3099, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3127 = fma(_3115, _3103, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3129 = fma(_3115, _3107, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3131 = fma(_3115, _3111, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2959 = _3125;
                    _2977 = _3129;
                    _2953 = _3121;
                    _2971 = _3127;
                    _2965 = _3123;
                    _2985 = _3131;
                    _3047 = true;
                }
                else
                {
                    _2959 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2977 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2953 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2971 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2965 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2985 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3047 = false;
    float _3133 = _2959;
    float _3135 = _2977;
    float _3137 = _2953;
    float _3139 = _2971;
    float _3141 = _2965;
    float _3143 = _2985;
    float _3145 = _2933 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3147 = fma(_2907, -0.5, 0.5);
    float _3149 = precise::clamp(_3147, 0.0, 1.0);
    float _3151 = -_3133;
    float _3153 = _3151 + _3135;
    float _3155 = -_3137;
    float _3157 = _3155 + _3139;
    out.m_96.x = 0.0;
    float _3159 = fma(_3149, _3153, _3133);
    float _3161 = -_3141;
    float _3163 = _3161 + _3143;
    float _3165 = fma(_3149, _3157, _3137);
    float _3167 = _3159 * 0.586610972881317138671875;
    bool _3169 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3171 = fma(_3149, _3163, _3141);
    out.m_53.x = _3145;
    float _3173 = fma(_3165, 0.298911988735198974609375, _3167);
    bool _3175 = _1187 > 0.0;
    bool _3177 = isnan(_1187);
    bool _3179 = _3175 || _3177;
    bool _3181 = isnan(0.0);
    bool _3183 = _3179 || _3181;
    float _3185 = fma(_3171, 0.114477999508380889892578125, _3173);
    float _3187 = -_3185;
    float _3189 = _3165 + _3187;
    float _3191 = -_3185;
    float _3193 = _3159 + _3191;
    float _3195 = -_3185;
    float _3197 = _3171 + _3195;
    float _3199 = fma(_3189, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3185);
    float _3201 = fma(_3193, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3185);
    float _3203 = fma(_3197, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3185);
    bool _3205 = !_3169;
    if (!_3205)
    {
        float _3207 = -_1127;
        float _3209 = _3207 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3211 = -_1129;
        float _3213 = _3211 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3215 = -_1131;
        float _3217 = _3215 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3219 = _3209 * _3209;
        float _3221 = fma(_3213, _3213, _3219);
        float _3223 = fma(_3217, _3217, _3221);
        float _3225 = sqrt(_3223);
        float _3227 = rsqrt(_3223);
        float _3229 = -_3225;
        float _3231 = _3229 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3233 = _3231 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3235 = precise::clamp(_3233, 0.0, 1.0);
        float _3237 = _3213 * _3227;
        float _3239 = _3209 * _3227;
        float _3241 = abs(_3235);
        float _3243 = log2(_3241);
        float _3245 = _3217 * _3227;
        float _3247 = _3237 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3249 = _2907 * _3239;
        float _3251 = -_3239;
        float _3253 = -_3247;
        float _3255 = fma(_3251, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3253);
        float _3257 = fma(_2905, _3237, _3249);
        float _3259 = -_3245;
        float _3261 = fma(_3259, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3255);
        float _3263 = fma(_2909, _3245, _3257);
        float _3265 = precise::clamp(_3263, 0.0, 1.0);
        float _3267 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3269 = _3261 + _3267;
        float _3271 = _3243 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3273 = _3269 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3275 = precise::clamp(_3273, 0.0, 1.0);
        float _3277 = exp2(_3271);
        float _3279 = _3277 * _3275;
        float _3281 = _3265 * _3279;
        float _3283 = _3281 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3285 = _3281 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3287 = _3281 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_96.x = _3283;
        out.m_96.y = _3285;
        out.m_96.z = _3287;
    }
    out.m_98.x = _3199;
    out.m_98.y = _3201;
    out.m_98.z = _3203;
    if (_3183)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_53.x = 0.0;
    float _3289 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3289;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

