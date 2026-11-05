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
    constant _16* vp_c8 [[id(1)]];
    constant _16* vp_c10 [[id(2)]];
    constant _16* vp_c15 [[id(3)]];
    constant _16* vp_c16 [[id(4)]];
    constant _16* vp_c7 [[id(5)]];
    texture3d<float> vp_t_tcb_32 [[id(6)]];
    sampler vp_t_tcb_32Smplr [[id(7)]];
    texture3d<float> vp_t_tcb_30 [[id(8)]];
    sampler vp_t_tcb_30Smplr [[id(9)]];
    texture2d<float> vp_t_tcb_1C [[id(10)]];
    sampler vp_t_tcb_1CSmplr [[id(11)]];
    sampler vp_t_tcb_32Smplr_w [[id(12)]];
    sampler vp_t_tcb_30Smplr_w [[id(13)]];
    sampler vp_t_tcb_1CSmplr_w [[id(14)]];
    constant dm_border_t* dm_border [[id(15)]];
};

struct main0_out
{
    float4 m_57 [[user(locn0)]];
    float4 m_64 [[user(locn1)]];
    float4 m_68 [[user(locn2)]];
    float4 m_47 [[user(locn3)]];
    float4 m_66 [[user(locn4)]];
    float4 m_70 [[user(locn6)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_62 [[attribute(1)]];
    float4 m_53 [[attribute(2)]];
    float4 m_44 [[attribute(3)]];
    float4 m_49 [[attribute(4)]];
    float4 m_51 [[attribute(5)]];
    float4 m_55 [[attribute(6)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2450 = false;
    bool _1021 = false;
    bool _797 = false;
    bool _695 = false;
    bool _521 = false;
    bool _329 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _84 = in.m_44.w;
    float _86 = trunc(_84);
    int _89 = int(_86);
    bool _93 = _89 >= 1;
    float _95 = 0.0;
    if (!_93)
    {
        _95 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _97 = _95;
    float _99 = _97;
    if (!_93)
    {
        out.m_47.x = 0.0;
    }
    int _101 = 0;
    if (!_93)
    {
        float _103 = _97 * 5.0;
        _101 = as_type<int>(_103);
    }
    int _105 = _101;
    int _107 = _105;
    if (!_93)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3226 = as_type<float>(_105);
        out.gl_Position.z = _3226;
    }
    if (!_93)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _109 = in.m_49.w;
    bool _111 = _109 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _113 = isnan(_109);
    bool _115 = _111 || _113;
    bool _117 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _119 = _115 || _117;
    float _121 = -_109;
    float _123 = _121 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _125 = 0.0;
    float _127 = _123;
    if (_119)
    {
        float _129 = float(_89);
        _125 = _129;
    }
    float _131 = _125;
    bool _133 = _123 >= _131;
    bool _135 = !_119;
    bool _137 = _133 || _135;
    if (_137)
    {
        _99 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _139 = _99;
    if (_137)
    {
        out.m_47.x = 0.0;
    }
    if (_137)
    {
        float _141 = _139 * 5.0;
        _107 = as_type<int>(_141);
    }
    int _143 = _107;
    if (_137)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3295 = as_type<float>(_143);
        out.gl_Position.z = _3295;
    }
    if (_137)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _145 = in.m_51.x;
    float _147 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _149 = _123 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _151 = in.m_53.x;
    float _153 = in.m_53.y;
    float _155 = in.m_53.z;
    float _157 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].w;
    float _159 = _149 * _147;
    float _161 = _123 + (*spvDescriptorSet0.vp_c9)._m0[20].w;
    float _163 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[20].x, _159);
    float _165 = _161 * _157;
    float _167 = floor(_163);
    float _169 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[20].y, _165);
    float _171 = _163 * 6.283185482025146484375;
    float _173 = _153 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _175 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _177 = _175 != 0;
    float _179 = _153 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _181 = floor(_169);
    float _183 = _171 * 0.15915493667125701904296875;
    float _185 = _153 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _187 = fma(_151, (*spvDescriptorSet0.vp_c10)._m0[4].x, _179);
    float _189 = _169 * 6.283185482025146484375;
    int _191 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _193 = _191 != 0;
    int _195 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _197 = _195 != 0;
    float _199 = fma(_151, (*spvDescriptorSet0.vp_c10)._m0[5].x, _173);
    float _201 = fma(_151, (*spvDescriptorSet0.vp_c10)._m0[6].x, _185);
    float _203 = _183 * 6.283185482025146484375;
    float _205 = cos(_203);
    float _207 = -_167;
    float _209 = _163 + _207;
    bool _211 = !_193;
    int _213 = _211 ? 0 : 1;
    float _215 = fma(_155, (*spvDescriptorSet0.vp_c10)._m0[4].z, _187);
    int _217 = abs(_213);
    float _219 = -_181;
    float _221 = _169 + _219;
    float _223 = _189 * 0.15915493667125701904296875;
    bool _225 = !_177;
    int _227 = _225 ? 0 : 1;
    float _229 = -_209;
    float _231 = fma(_229, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _233 = -_221;
    float _235 = fma(_233, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    int _237 = abs(_227);
    float _239 = _223 * 6.283185482025146484375;
    float _241 = cos(_239);
    float _243 = float(_217);
    float _245 = fma(_205, 0.5, 0.5);
    bool _247 = _209 < 0.5;
    float _249 = float(_247);
    bool _251 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _253 = abs(_231);
    float _255 = _243 * _253;
    bool _257 = !_197;
    int _259 = _257 ? 0 : 1;
    float _261 = abs(_235);
    float _263 = _243 * _261;
    float _265 = float(_237);
    float _267 = -_249;
    float _269 = fma(_267, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _271 = abs(_259);
    float _273 = -_245;
    float _275 = fma(_273, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _277 = _221 < 0.5;
    float _279 = float(_277);
    float _281 = float(_271);
    float _283 = fma(_241, 0.5, 0.5);
    float _285 = fma(_265, _275, _255);
    float _287 = -_279;
    float _289 = fma(_287, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    float _291 = fma(_155, (*spvDescriptorSet0.vp_c10)._m0[6].z, _201);
    float _293 = -_283;
    float _295 = fma(_293, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    float _297 = abs(_269);
    float _299 = fma(_281, _297, _285);
    float _301 = fma(_155, (*spvDescriptorSet0.vp_c10)._m0[5].z, _199);
    float _303 = fma(_265, _295, _263);
    float _305 = abs(_289);
    float _307 = fma(_281, _305, _303);
    bool _309 = !_251;
    float _311 = _215;
    float _327;
    if (!_309)
    {
        float _313 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _315 = _145 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _317 = fma(_315, (*spvDescriptorSet0.vp_c9)._m0[12].x, _123);
        float _319 = _317 * _313;
        float _321 = floor(_319);
        float _323 = -_321;
        float _325 = _319 + _323;
        _327 = _325;
        _329 = true;
    }
    else
    {
        float _331 = float(_89);
        float _333 = 1.0 / _331;
        float _335 = _123 * _333;
        _327 = _335;
    }
    _329 = false;
    float _337 = _327;
    float _339 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _341 = _337 + _339;
    float _343 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _345 = _337 + _343;
    bool _347 = _337 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _349 = isnan(_337);
    bool _351 = _347 || _349;
    bool _353 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _355 = _351 || _353;
    float _357 = float(_355);
    float _359 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _361 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _359;
    float _363 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _365 = _363 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _367 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _369 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _367;
    float _371 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _373 = _337 + _371;
    bool _375 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _377 = 1.0 / _365;
    float _379 = 1.0 / _361;
    float _381 = 1.0 / _369;
    float _383 = _373 * _377;
    bool _385 = _337 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _387 = isnan(_337);
    bool _389 = _385 || _387;
    bool _391 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _393 = _389 || _391;
    float _395 = float(_393);
    float _397 = _341 * _379;
    bool _399 = _337 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _401 = isnan(_337);
    bool _403 = _399 || _401;
    bool _405 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _407 = _403 || _405;
    float _409 = float(_407);
    float _411 = -_357;
    float _413 = _411 + 1.0;
    bool _415 = _337 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _417 = isnan(_337);
    bool _419 = _415 || _417;
    bool _421 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _423 = _419 || _421;
    float _425 = float(_423);
    float _427 = _409 * _413;
    float _429 = _345 * _381;
    float _431 = -_409;
    float _433 = _431 + 1.0;
    float _435 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _437 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _435;
    float _439 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _441 = _439 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _443 = _425 * _433;
    float _445 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _447 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _445;
    float _449 = -_425;
    float _451 = _449 + 1.0;
    float _453 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _455 = _453 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _457 = fma(_437, _397, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _459 = fma(_447, _397, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _461 = _395 * _451;
    float _463 = fma(_455, _383, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _465 = fma(_441, _383, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _467 = -_395;
    float _469 = _467 + 1.0;
    float _471 = _459 * _461;
    float _473 = _457 * _461;
    float _475 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _477 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _475;
    float _479 = fma(_469, (*spvDescriptorSet0.vp_c9)._m0[143].x, _471);
    float _481 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _483 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _481;
    float _485 = fma(_469, (*spvDescriptorSet0.vp_c9)._m0[143].y, _473);
    float _487 = fma(_477, _429, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _489 = fma(_463, _443, _479);
    float _491 = fma(_483, _429, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _493 = fma(_465, _443, _485);
    float _495 = fma(_487, _427, _489);
    float _497 = fma(_491, _427, _493);
    float _499 = fma(_357, (*spvDescriptorSet0.vp_c9)._m0[146].x, _495);
    float _501 = fma(_357, (*spvDescriptorSet0.vp_c9)._m0[146].y, _497);
    bool _503 = !_375;
    float _519;
    if (!_503)
    {
        float _505 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _507 = _145 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _509 = fma(_507, (*spvDescriptorSet0.vp_c9)._m0[11].x, _123);
        float _511 = _509 * _505;
        float _513 = floor(_511);
        float _515 = -_513;
        float _517 = _511 + _515;
        _519 = _517;
        _521 = true;
    }
    else
    {
        float _523 = float(_89);
        float _525 = 1.0 / _523;
        float _527 = _123 * _525;
        _519 = _527;
    }
    _521 = false;
    float _529 = _519;
    float _531 = in.m_55.x;
    float _533 = in.m_55.y;
    float _535 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _537 = _529 + _535;
    bool _539 = _529 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _541 = isnan(_529);
    bool _543 = _539 || _541;
    bool _545 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _547 = _543 || _545;
    float _549 = float(_547);
    float _551 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _553 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _551;
    float _555 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _557 = _555 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _559 = -_549;
    float _561 = _559 + 1.0;
    float _563 = 1.0 / _553;
    bool _565 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _567 = 1.0 / _557;
    float _569 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _571 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _569;
    float _573 = _501 * _533;
    float _575 = _537 * _563;
    float _577 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _579 = _529 + _577;
    bool _581 = _529 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _583 = isnan(_529);
    bool _585 = _581 || _583;
    bool _587 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _589 = _585 || _587;
    float _591 = float(_589);
    float _593 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _595 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _593;
    bool _597 = _529 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _599 = isnan(_529);
    bool _601 = _597 || _599;
    bool _603 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _605 = _601 || _603;
    float _607 = float(_605);
    float _609 = fma(_571, _575, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _611 = _499 * _531;
    float _613 = fma(_595, _575, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _615 = _579 * _567;
    float _617 = _607 * _561;
    float _619 = -_607;
    float _621 = _619 + 1.0;
    float _623 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _625 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _623;
    float _627 = _591 * _621;
    float _629 = fma(_625, _575, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _631 = -_591;
    float _633 = _631 + 1.0;
    float _635 = _609 * _627;
    float _637 = _629 * _627;
    float _639 = _613 * _627;
    float _641 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _643 = _641 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _645 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _647 = _645 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _649 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _651 = _649 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _653 = fma(_633, (*spvDescriptorSet0.vp_c9)._m0[107].x, _637);
    float _655 = fma(_633, (*spvDescriptorSet0.vp_c9)._m0[107].y, _635);
    float _657 = fma(_643, _615, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _659 = fma(_647, _615, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _661 = fma(_651, _615, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _663 = fma(_633, (*spvDescriptorSet0.vp_c9)._m0[107].z, _639);
    float _665 = fma(_657, _617, _653);
    float _667 = fma(_659, _617, _655);
    float _669 = fma(_661, _617, _663);
    float _671 = fma(_549, (*spvDescriptorSet0.vp_c9)._m0[109].x, _665);
    float _673 = fma(_549, (*spvDescriptorSet0.vp_c9)._m0[109].y, _667);
    float _675 = fma(_549, (*spvDescriptorSet0.vp_c9)._m0[109].z, _669);
    bool _677 = !_565;
    float _693;
    if (!_677)
    {
        float _679 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _681 = _145 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _683 = fma(_681, (*spvDescriptorSet0.vp_c9)._m0[11].y, _123);
        float _685 = _683 * _679;
        float _687 = floor(_685);
        float _689 = -_687;
        float _691 = _685 + _689;
        _693 = _691;
        _695 = true;
    }
    else
    {
        float _697 = float(_89);
        float _699 = 1.0 / _697;
        float _701 = _123 * _699;
        _693 = _701;
    }
    _695 = false;
    float _703 = _693;
    float _705 = _671 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _707 = _673 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    bool _709 = _703 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _711 = isnan(_703);
    bool _713 = _709 || _711;
    bool _715 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _717 = _713 || _715;
    float _719 = float(_717);
    float _721 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _723 = _721 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _725 = _703 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _727 = isnan(_703);
    bool _729 = _725 || _727;
    bool _731 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _733 = _729 || _731;
    float _735 = float(_733);
    float _737 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _739 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _737;
    float _741 = _675 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _743 = 1.0 / _723;
    float _745 = -_719;
    float _747 = _745 + 1.0;
    float _749 = _705 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _751 = _707 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _753 = _741 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _755 = _735 * _747;
    float _757 = -_735;
    float _759 = _757 + 1.0;
    bool _761 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _763 = _739 * _743;
    float _765 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _767 = _703 + _765;
    float _769 = fma(_763, _767, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _771 = _769 * _755;
    float _773 = fma(_759, (*spvDescriptorSet0.vp_c9)._m0[115].x, _771);
    float _775 = fma(_719, (*spvDescriptorSet0.vp_c9)._m0[116].x, _773);
    float _777 = _775 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_57.x = _749;
    out.m_57.y = _751;
    out.m_57.z = _753;
    out.m_57.w = _777;
    bool _779 = !_761;
    float _795;
    if (!_779)
    {
        float _781 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _783 = _145 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _785 = fma(_783, (*spvDescriptorSet0.vp_c9)._m0[11].z, _123);
        float _787 = _785 * _781;
        float _789 = floor(_787);
        float _791 = -_789;
        float _793 = _787 + _791;
        _795 = _793;
        _797 = true;
    }
    else
    {
        float _799 = float(_89);
        float _801 = 1.0 / _799;
        float _803 = _123 * _801;
        _795 = _803;
    }
    _797 = false;
    float _805 = _795;
    float _807 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _809 = _805 + _807;
    float _811 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _813 = _805 + _811;
    float _815 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _817 = _805 + _815;
    float _819 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _821 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _819;
    float _823 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _825 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _823;
    float _827 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _829 = _827 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _831 = 1.0 / _821;
    bool _833 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _835 = 1.0 / _825;
    float _837 = 1.0 / _829;
    float _839 = _809 * _831;
    bool _841 = _805 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _843 = isnan(_805);
    bool _845 = _841 || _843;
    bool _847 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _849 = _845 || _847;
    float _851 = float(_849);
    float _853 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _855 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _853;
    bool _857 = _805 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _859 = isnan(_805);
    bool _861 = _857 || _859;
    bool _863 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _865 = _861 || _863;
    float _867 = float(_865);
    float _869 = _813 * _835;
    float _871 = -_851;
    float _873 = _871 + 1.0;
    float _875 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _877 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _875;
    float _879 = fma(_855, _869, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _881 = _867 * _873;
    bool _883 = _805 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _885 = isnan(_805);
    bool _887 = _883 || _885;
    bool _889 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _891 = _887 || _889;
    float _893 = float(_891);
    float _895 = -_867;
    float _897 = _895 + 1.0;
    float _899 = _817 * _837;
    bool _901 = _805 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _903 = isnan(_805);
    bool _905 = _901 || _903;
    bool _907 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _909 = _905 || _907;
    float _911 = float(_909);
    float _913 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _915 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _913;
    float _917 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _919 = _917 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _921 = fma(_877, _869, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _923 = -_911;
    float _925 = _923 + 1.0;
    float _927 = fma(_915, _869, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _929 = _911 * _897;
    float _931 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _933 = _931 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _935 = _893 * _925;
    float _937 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _939 = _937 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _941 = -_893;
    float _943 = _941 + 1.0;
    float _945 = _879 * _935;
    float _947 = _921 * _935;
    float _949 = _927 * _935;
    float _951 = fma(_943, (*spvDescriptorSet0.vp_c9)._m0[123].x, _945);
    float _953 = fma(_943, (*spvDescriptorSet0.vp_c9)._m0[123].y, _947);
    float _955 = fma(_919, _899, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _957 = fma(_933, _899, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _959 = fma(_943, (*spvDescriptorSet0.vp_c9)._m0[123].z, _949);
    float _961 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _963 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _961;
    float _965 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _967 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _965;
    float _969 = fma(_939, _899, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _971 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _973 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _971;
    float _975 = fma(_955, _929, _951);
    float _977 = fma(_963, _839, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _979 = fma(_967, _839, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _981 = fma(_957, _929, _953);
    float _983 = fma(_973, _839, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _985 = fma(_969, _929, _959);
    float _987 = fma(_977, _881, _975);
    float _989 = fma(_979, _881, _981);
    float _991 = fma(_983, _881, _985);
    float _993 = fma(_851, (*spvDescriptorSet0.vp_c9)._m0[126].x, _987);
    float _995 = fma(_851, (*spvDescriptorSet0.vp_c9)._m0[126].y, _989);
    float _997 = fma(_851, (*spvDescriptorSet0.vp_c9)._m0[126].z, _991);
    bool _999 = !_833;
    float _1017;
    float _1019;
    if (!_999)
    {
        float _1001 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _1003 = _145 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _1005 = float(_89);
        float _1007 = fma(_1003, (*spvDescriptorSet0.vp_c9)._m0[11].w, _123);
        float _1009 = _1007 * _1001;
        float _1011 = floor(_1009);
        float _1013 = -_1011;
        float _1015 = _1009 + _1013;
        _1017 = _1005;
        _1019 = _1015;
        _1021 = true;
    }
    else
    {
        float _1023 = float(_89);
        float _1025 = 1.0 / _1023;
        float _1027 = _123 * _1025;
        _1017 = _1023;
        _1019 = _1027;
    }
    _1021 = false;
    float _1029 = _1017;
    float _1031 = _1019;
    float _1033 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1035 = int(_1033);
    float _1037 = in.m_51.y;
    float _1039 = _299 * _611;
    float _1041 = _307 * _573;
    float _1043 = in.m_51.z;
    float _1045 = _1041 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1047 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1049 = int(_1047);
    float _1051 = as_type<float>(int(gl_VertexIndex));
    float _1053 = float(_1035);
    float _1055 = 1.0 / _1029;
    float _1057 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1059 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1057);
    float _1061 = float(uint(_1049));
    float _1063 = 1.0 / _1053;
    int _1065 = ~_1049;
    int _1067 = _1065 + 1;
    bool _1069 = _1049 == 0;
    float _1071 = 1.0 / _1061;
    float _1073 = _1063 * _123;
    float _1075 = trunc(_1073);
    int _1077 = int(_1075);
    int _1079 = as_type<int>(_1071) + (-2);
    float _1081 = float(uint(_1077));
    float _1083 = as_type<float>(_1079) * _1081;
    float _1085 = trunc(_1083);
    float _1087 = precise::max(_1085, 0.0);
    uint _1090 = uint(_1087);
    int _1092 = ~_1049;
    int _1094 = _1092 + 1;
    int _1096 = _1067 * int(_1090);
    int _1098 = _1096 + _1077;
    float _1100 = float(uint(_1098));
    float _1102 = as_type<float>(_1079) * _1100;
    int _1104 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1106 = _1104 != 0;
    float _1108 = trunc(_1102);
    float _1110 = precise::max(_1108, 0.0);
    uint _1112 = uint(_1110);
    bool _1114 = !_1106;
    float _1116 = _1114 ? 7.345489978790283203125 : 1.0;
    float _1118 = _1116 * _145;
    float _1120 = floor(_1118);
    int _1122 = int(_1090) + int(_1112);
    float _1124 = float(_1049);
    float _1126 = float(_1077);
    int _1128 = _1094 * _1122;
    int _1130 = _1128 + _1077;
    bool _1132 = _1126 >= _1124;
    bool _1134 = isnan(_1126);
    bool _1136 = _1132 || _1134;
    bool _1138 = isnan(_1124);
    bool _1140 = _1136 || _1138;
    float _1142 = float(_1140);
    bool _1144 = uint(_1130) >= uint(_1049);
    float _1146 = -_1120;
    float _1148 = _1118 + _1146;
    float _1150 = trunc(_1142);
    int _1152 = int(_1150);
    bool _1154 = !_1144;
    int _1156 = _1154 ? 0 : (-1);
    float _1158 = _1148 * _1124;
    float _1160 = _1124 * _123;
    int _1162 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1164 = _1162 != 0;
    int _1166 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1168 = _1166 != 0;
    int _1170 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1172 = _1170 != 0;
    int _1174 = ~_1122;
    int _1176 = _1174 + _1156;
    int _1178 = _1176 + 1;
    float _1180 = _1160 * _1055;
    float _1182 = trunc(_1158);
    int _1184 = int(_1182);
    int _1186 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1188 = _1186 != 0;
    int _1190 = _1049 * _1178;
    int _1192 = _1190 + _1077;
    bool _1194 = !_1168;
    int _1196 = _1194 ? 0 : 1;
    bool _1198 = !_1164;
    int _1200 = _1198 ? 0 : 1;
    int _1202 = ~_1152;
    int _1204 = _1202 + 1;
    int _1206 = _1204 + 1;
    float _1208 = trunc(_1180);
    int _1210 = int(_1208);
    bool _1212 = !_1069;
    int _1214 = _1212 ? _1192 : (-1);
    int _1216 = abs(_1200);
    int _1218 = _1214 * _1206;
    int _1220 = _1049 + (-1);
    int _1222 = _1152 * _1220;
    int _1224 = _1222 + _1218;
    bool _1226 = !_1188;
    int _1228 = _1226 ? 0 : 1;
    int _1230 = abs(_1196);
    int _1232 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1234 = _1232 != 0;
    bool _1236 = !_1172;
    int _1238 = _1236 ? 0 : 1;
    int _1240 = _1224 * _1230;
    int _1242 = abs(_1228);
    bool _1244 = !_1234;
    int _1246 = _1244 ? 0 : 1;
    int _1248 = abs(_1238);
    int _1250 = _1184 * _1242;
    int _1252 = _1250 + _1077;
    int _1254 = abs(_1246);
    int _1256 = _1210 * _1216;
    int _1258 = _1256 + _1240;
    int _1260 = ~_1049;
    int _1262 = _1260 + 1;
    int _1264 = _1252 * _1248;
    int _1266 = _1264 + _1258;
    int _1268 = ~_1049;
    int _1270 = _1268 + 1;
    int _1272 = _1184 * _1254;
    int _1274 = _1272 + _1266;
    float _1276 = float(uint(_1274));
    float _1278 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1280 = as_type<float>(_1079) * _1276;
    float _1282 = trunc(_1280);
    float _1284 = precise::max(_1282, 0.0);
    uint _1286 = uint(_1284);
    int _1288 = _1262 * int(_1286);
    int _1290 = _1288 + _1274;
    float _1292 = float(uint(_1290));
    float _1294 = as_type<float>(_1079) * _1292;
    float _1296 = trunc(_1294);
    float _1298 = precise::max(_1296, 0.0);
    uint _1300 = uint(_1298);
    int _1302 = ~_1049;
    int _1304 = _1302 + 1;
    int _1306 = int(_1286) + int(_1300);
    float _1308 = float(uint(_1252));
    int _1310 = _1270 * _1306;
    int _1312 = _1310 + _1274;
    float _1314 = as_type<float>(_1079) * _1308;
    bool _1316 = uint(_1312) >= uint(_1049);
    float _1318 = trunc(_1314);
    float _1320 = precise::max(_1318, 0.0);
    uint _1322 = uint(_1320);
    float _1324 = _145 * 2.0;
    bool _1326 = !_1316;
    int _1328 = _1326 ? 0 : (-1);
    int _1330 = ~_1306;
    int _1332 = _1330 + _1328;
    int _1334 = _1332 + 1;
    float _1336 = floor(_1324);
    int _1338 = _1049 * _1334;
    int _1340 = _1338 + _1274;
    float _1342 = _1037 * 2.0;
    float _1344 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _1346 = _1304 * int(_1322);
    int _1348 = _1346 + _1252;
    bool _1350 = !_1069;
    int _1352 = _1350 ? _1340 : (-1);
    float _1354 = floor(_1342);
    int _1356 = _1352 & 3;
    bool _1358 = _1356 != 0;
    float _1360 = float(uint(_1348));
    bool _1362 = uint(_1356) > 1u;
    int _1364 = _1352 & 3;
    bool _1366 = _1364 != 0;
    float _1368 = as_type<float>(_1079) * _1360;
    bool _1370 = _1336 > 0.0;
    bool _1372 = _1336 >= 0.0;
    bool _1374 = isnan(_1336);
    bool _1376 = _1372 || _1374;
    bool _1378 = isnan(0.0);
    bool _1380 = _1376 || _1378;
    int _1382 = _1366 ? 0 : 1;
    float _1384 = trunc(_1368);
    float _1386 = precise::max(_1384, 0.0);
    uint _1388 = uint(_1386);
    bool _1390 = _1354 > 0.0;
    int _1392 = _1380 ? 0 : 1;
    bool _1394 = _1354 >= 0.0;
    bool _1396 = isnan(_1354);
    bool _1398 = _1394 || _1396;
    bool _1400 = isnan(0.0);
    bool _1402 = _1398 || _1400;
    int _1404 = ~_1382;
    int _1406 = _1404 + 1;
    int _1408 = _1406 + 1;
    int _1410 = _1408;
    if (!_1362)
    {
        int _1412 = ~_1382;
        int _1414 = _1412 + 1;
        _1410 = _1414;
    }
    int _1416 = _1410;
    int _1418 = ~_1392;
    int _1420 = _1418 + 1;
    int _1422 = _1420 + 1;
    bool _1424 = _1356 != 3;
    int _1426 = _1402 ? 0 : 1;
    int _1428 = _1422;
    if (!_1370)
    {
        int _1430 = ~_1392;
        int _1432 = _1430 + 1;
        _1428 = _1432;
    }
    int _1434 = _1428;
    float _1436 = in.m_44.x;
    float _1438 = in.m_44.y;
    float _1440 = in.m_44.z;
    bool _1442 = uint(_1356) >= 2u;
    int _1444 = ~_1426;
    int _1446 = _1444 + 1;
    int _1448 = _1446 + 1;
    int _1450 = _1448;
    if (!_1390)
    {
        int _1452 = ~_1426;
        int _1454 = _1452 + 1;
        _1450 = _1454;
    }
    int _1456 = _1450;
    float _1458 = _1043 * 2.0;
    int _1460 = _1442 ? 0 : 1;
    int _1462 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1464 = _1462 != 0;
    int _1466 = int(_1322) + int(_1388);
    float _1468 = floor(_1458);
    int _1470 = ~_1049;
    int _1472 = _1470 + 1;
    int _1474 = ~_1460;
    int _1476 = _1474 + 1;
    int _1478 = _1476 + 1;
    int _1480 = _1478;
    if (_1424)
    {
        int _1482 = ~_1460;
        int _1484 = _1482 + 1;
        _1480 = _1484;
    }
    int _1486 = _1480;
    bool _1488 = !_1464;
    int _1490 = _1488 ? 0 : 1;
    float _1492 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1494 = log2(_1492);
    int _1496 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1498 = _1496 != 0;
    int _1500 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1502 = _1500 != 0;
    int _1504 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1506 = _1504 != 0;
    int _1508 = _1472 * _1466;
    int _1510 = _1508 + _1252;
    float _1512 = _1037 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1514 = _1438 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1516 = _1438 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _1518 = !_1502;
    int _1520 = _1518 ? 0 : 1;
    float _1522 = fma(_1512, -2.0, _1278);
    bool _1524 = uint(_1510) >= uint(_1049);
    float _1526 = _145 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1528 = fma(_1436, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1514);
    float _1530 = fma(_1436, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1516);
    bool _1532 = !_1524;
    int _1534 = _1532 ? 0 : (-1);
    float _1536 = -_1344;
    float _1538 = fma(_1526, 2.0, _1536);
    int _1540 = as_type<int>(_1051) & 1;
    bool _1542 = _1540 != 0;
    int _1544 = as_type<int>(_1051) & 2;
    bool _1546 = _1544 != 0;
    float _1548 = _1438 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    bool _1550 = !_1498;
    int _1552 = _1550 ? 0 : 1;
    float _1554 = _145 + _1037;
    bool _1556 = _1468 >= 0.0;
    bool _1558 = isnan(_1468);
    bool _1560 = _1556 || _1558;
    bool _1562 = isnan(0.0);
    bool _1564 = _1560 || _1562;
    float _1566 = _1494 * _123;
    float _1568 = fma(_1436, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1548);
    float _1570 = _1554 + (-1.0);
    int _1572 = _1564 ? 0 : 1;
    float _1574 = exp2(_1566);
    bool _1576 = _1468 > 0.0;
    float _1578 = fma(_1570, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1580 = _145 + _1043;
    int _1582 = _1352 >> 31;
    float _1584 = _1037 + _1043;
    bool _1586 = !_1506;
    int _1588 = _1586 ? 0 : 1;
    float _1590 = _1580 + (-1.0);
    int _1592 = _1582 & 3;
    float _1594 = _1584 + (-1.0);
    float _1596 = fma(_1590, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    int _1598 = ~_1572;
    int _1600 = _1598 + 1;
    int _1602 = _1600 + 1;
    float _1604 = fma(_1594, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _1606 = _1602;
    if (!_1576)
    {
        int _1608 = ~_1572;
        int _1610 = _1608 + 1;
        _1606 = _1610;
    }
    int _1612 = _1606;
    float _1614 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1616 = 1.0 + _1614;
    int _1618 = _1352 + _1592;
    float _1620 = -_1574;
    float _1622 = _1620 + 1.0;
    float _1624 = in.m_62.x;
    float _1626 = in.m_62.y;
    float _1628 = in.m_62.z;
    bool _1630 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1632 = isnan(0.0);
    bool _1634 = _1630 || _1632;
    bool _1636 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1638 = _1634 || _1636;
    float _1640 = 1.0 / _1616;
    int _1642 = abs(_1520);
    float _1644 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1646 = _1638 ? _1622 : 0.0;
    float _1648 = -_123;
    float _1650 = fma(_1648, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1538);
    bool _1652 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1654 = isnan(1.0);
    bool _1656 = _1652 || _1654;
    bool _1658 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1660 = _1656 || _1658;
    float _1662 = fma(_1037, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1644);
    int _1664 = _1618 >> 2;
    float _1666 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1059);
    int _1668 = abs(_1588);
    float _1670 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1662);
    int _1672 = abs(_1552);
    float _1674 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1522);
    float _1676 = fma(_1440, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1568);
    int _1678 = _1664 << 4;
    int _1680 = _1678 + 368;
    float _1682 = fma(_1440, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1528);
    float _1684 = float(_1434);
    if (_1660)
    {
        float _1686 = _1646 * _1640;
        _127 = _1686;
    }
    float _1688 = _127;
    float _1690 = float(_1456);
    float _1692 = fma(_1440, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1530);
    float _1694 = float(_1672);
    float _1696 = float(_1612);
    uint _1698 = uint(int(uint(_1680) >> uint(2)));
    uint _1700 = uint(int(uint(int(_1698)) >> uint(2)));
    int _1702 = int(_1698) & 3;
    float _1704 = (*spvDescriptorSet0.vp_c9)._m0[int(_1700)][_1702];
    int _1706 = int(_1698) + 1;
    uint _1708 = uint(int(uint(_1706) >> uint(2)));
    int _1710 = _1706 & 3;
    float _1712 = (*spvDescriptorSet0.vp_c9)._m0[int(_1708)][_1710];
    float _1714 = float(_1668);
    float _1716 = float(_1642);
    bool _1718 = _1037 > 0.5;
    float _1720 = _1714 * _1690;
    float _1722 = _1694 * _1696;
    float _1724 = _1716 * _1684;
    int _1726 = _1680 + 8;
    uint _1728 = uint(int(uint(_1726) >> uint(2)));
    uint _1730 = uint(int(uint(int(_1728)) >> uint(2)));
    int _1732 = int(_1728) & 3;
    float _1734 = (*spvDescriptorSet0.vp_c9)._m0[int(_1730)][_1732];
    int _1736 = int(_1728) + 1;
    uint _1738 = uint(int(uint(_1736) >> uint(2)));
    int _1740 = _1736 & 3;
    float _1742 = (*spvDescriptorSet0.vp_c9)._m0[int(_1738)][_1740];
    float _1744 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _1746 = int(_1744);
    float _1748 = _1722 * (-2.0);
    float _1750 = _1724 * (-2.0);
    float _1752 = _1037 + (-0.5);
    float _1754 = _1720 * (-2.0);
    float _1756 = fma(_1578, _1748, _1578);
    float _1758 = fma(_1604, _1750, _1604);
    float _1760 = fma(_1750, _1626, _1626);
    float _1762 = fma(_1748, _1624, _1624);
    int _1764 = abs(_1416);
    float _1766 = _145 + (-0.5);
    float _1768 = fma(_1752, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1760);
    float _1770 = fma(_1596, _1754, _1596);
    float _1772 = fma(_1754, _1628, _1628);
    float _1774 = _1043 + (-0.5);
    bool _1776 = !_1358;
    int _1778 = _1776 ? 0 : 1;
    float _1780 = fma(_1766, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1762);
    int _1782 = abs(_1746);
    float _1784 = fma(_1774, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1772);
    float _1786 = fma(_1756, _1688, _1780);
    float _1788 = float(uint(_1782));
    float _1790 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1792 = _1790 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1794 = _1356 != 3;
    float _1796 = fma(_1758, _1688, _1768);
    float _1798 = 1.0 / _1788;
    int _1800 = abs(_1778);
    float _1802 = fma(_1770, _1688, _1784);
    bool _1804 = !_1794;
    int _1806 = _1804 ? 0 : (-1);
    float _1808 = _1796 * 0.15915493667125701904296875;
    int _1810 = ~_1800;
    int _1812 = _1810 + 1;
    int _1814 = _1812 + 1;
    float _1816 = _1786 * 0.15915493667125701904296875;
    int _1818 = abs(_1806);
    float _1820 = 1.0 / _1792;
    int _1822 = abs(_1486);
    float _1824 = _1802 * 0.15915493667125701904296875;
    int _1826 = ~_1764;
    int _1828 = _1826 + 1;
    int _1830 = _1828 + 1;
    int _1832 = ~_1466;
    int _1834 = _1832 + _1534;
    int _1836 = _1834 + 1;
    int _1838 = abs(_1490);
    int _1840 = _1830 * as_type<int>(_1712);
    int _1842 = ~_1822;
    int _1844 = _1842 + 1;
    int _1846 = _1844 + 1;
    int _1848 = _1049 * _1836;
    int _1850 = _1848 + _1252;
    int _1852 = _1814 * as_type<int>(_1704);
    int _1854 = _1852 + _1840;
    float _1856 = float(uint(_1746));
    float _1858 = _1808 * 6.283185482025146484375;
    float _1860 = sin(_1858);
    int _1862 = _1846 * as_type<int>(_1734);
    int _1864 = _1862 + _1854;
    int _1866 = ~_1818;
    int _1868 = _1866 + 1;
    int _1870 = _1868 + 1;
    bool _1872 = _145 > 0.5;
    float _1874 = 1.0 / _1856;
    int _1876 = ~_1838;
    int _1878 = _1876 + 1;
    int _1880 = _1878 + 1;
    int _1882 = _1870 * as_type<int>(_1742);
    int _1884 = _1882 + _1864;
    bool _1886 = !_1069;
    int _1888 = _1886 ? _1850 : (-1);
    float _1890 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1892 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1890;
    bool _1894 = !_1542;
    float _1896 = _1894 ? (-0.5) : 0.5;
    int _1898 = _1884 * _1880;
    int _1900 = as_type<int>(_1798) + (-2);
    float _1902 = _1892 * _1820;
    float _1904 = _1816 * 6.283185482025146484375;
    float _1906 = cos(_1904);
    int _1908 = _1888 * _1838;
    int _1910 = _1908 + _1898;
    float _1912 = _1039 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1914 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1896);
    bool _1916 = !_1546;
    float _1918 = _1916 ? (-0.5) : 0.5;
    int _1920 = abs(_1910);
    float _1922 = _1912 * _1914;
    float _1924 = _1808 * 6.283185482025146484375;
    float _1926 = cos(_1924);
    int _1928 = as_type<int>(_1874) + (-2);
    float _1930 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1918);
    float _1932 = float(uint(_1910));
    float _1934 = float(uint(_1920));
    float _1936 = _1045 * _1930;
    int _1938 = ~_1782;
    int _1940 = _1938 + 1;
    float _1942 = _1816 * 6.283185482025146484375;
    float _1944 = sin(_1942);
    float _1946 = as_type<float>(_1928) * _1932;
    float _1948 = _1906 * _1860;
    float _1950 = as_type<float>(_1900) * _1934;
    int _1952 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1954 = _1952 != 0;
    int _1956 = ~_1782;
    int _1958 = _1956 + 1;
    float _1960 = _1824 * 6.283185482025146484375;
    float _1962 = sin(_1960);
    float _1964 = _1824 * 6.283185482025146484375;
    float _1966 = cos(_1964);
    float _1968 = _1944 * _1926;
    float _1970 = _1944 * _1860;
    float _1972 = trunc(_1946);
    float _1974 = precise::max(_1972, 0.0);
    uint _1976 = uint(_1974);
    float _1978 = -_1948;
    float _1980 = fma(_1962, _1968, _1978);
    float _1982 = -_1968;
    float _1984 = fma(_1962, _1948, _1982);
    int _1986 = ~_1746;
    int _1988 = _1986 + 1;
    float _1990 = trunc(_1950);
    float _1992 = precise::max(_1990, 0.0);
    uint _1994 = uint(_1992);
    float _1996 = _1860 * _1966;
    float _1998 = _1906 * _1926;
    float _2000 = _1926 * _1966;
    float _2002 = _1966 * _1936;
    float _2004 = -_1936;
    float _2006 = _1962 * _2004;
    float _2008 = fma(_1962, _1998, _1970);
    float _2010 = fma(_1962, _1970, _1998);
    int _2012 = _1988 * int(_1976);
    int _2014 = _2012 + _1910;
    float _2016 = _1906 * _2002;
    float _2018 = fma(_2000, _1922, _2006);
    float _2020 = _1944 * _2002;
    float _2022 = float(uint(_2014));
    float _2024 = fma(_2008, _1922, _2016);
    float _2026 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    int _2028 = _1940 * int(_1994);
    int _2030 = _2028 + _1920;
    float _2032 = fma(_1980, _1922, _2020);
    float _2034 = as_type<float>(_1928) * _2022;
    float _2036 = fma(_1984, _2026, _2024);
    float _2038 = fma(_1996, _2026, _2018);
    float _2040 = float(uint(_2030));
    float _2042 = trunc(_2034);
    float _2044 = precise::max(_2042, 0.0);
    uint _2046 = uint(_2044);
    float _2048 = fma(_2010, _2026, _2032);
    float _2050 = _2036 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2052 = _1676 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _2054 = as_type<float>(_1900) * _2040;
    float _2056 = _2036 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2058 = fma(_2038, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2050);
    float _2060 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2062 = _1031 + _2060;
    int _2064 = ~_1746;
    int _2066 = _2064 + 1;
    float _2068 = fma(_2038, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2056);
    float _2070 = trunc(_2054);
    float _2072 = precise::max(_2070, 0.0);
    uint _2074 = uint(_2072);
    float _2076 = fma(_2048, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2058);
    float _2078 = _1692 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _2080 = fma(_2048, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2068);
    float _2082 = fma(_1902, _2062, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _2084 = _2076 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    int _2086 = int(_1976) + int(_2046);
    float _2088 = _2080 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2090 = -_1896;
    int _2092 = _1872 ? as_type<int>(_2090) : as_type<int>(_1896);
    float _2094 = _2052 + _2084;
    float _2096 = _2036 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2098 = _2078 + _2088;
    bool _2100 = !_1954;
    float _2102 = _2100 ? _1896 : as_type<float>(_2092);
    float _2104 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2106 = _2094 + _2104;
    bool _2108 = _1031 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2110 = isnan(_1031);
    bool _2112 = _2108 || _2110;
    bool _2114 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2116 = _2112 || _2114;
    float _2118 = float(_2116);
    float _2120 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2122 = _2098 + _2120;
    int _2124 = int(_1994) + int(_2074);
    float _2126 = _2106 * _2106;
    bool _2128 = _1031 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2130 = isnan(_1031);
    bool _2132 = _2128 || _2130;
    bool _2134 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2136 = _2132 || _2134;
    float _2138 = float(_2136);
    float _2140 = _2122 * _2122;
    float _2142 = -_2118;
    float _2144 = _2142 + 1.0;
    int _2146 = _2066 * _2086;
    int _2148 = _2146 + _1910;
    float _2150 = fma(_2038, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2096);
    float _2152 = _2126 + _2140;
    int _2154 = _1958 * _2124;
    int _2156 = _2154 + _1920;
    float _2158 = _2138 * _2144;
    bool _2160 = uint(_2148) >= uint(_1746);
    float _2162 = sqrt(_2152);
    int _2164 = _1910 ^ _1746;
    float _2166 = _2082 * _2158;
    bool _2168 = uint(_2156) >= uint(_1782);
    float _2170 = fma(_2048, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2150);
    bool _2172 = !_2160;
    int _2174 = _2172 ? 0 : (-1);
    bool _2176 = !_2168;
    int _2178 = _2176 ? 0 : (-1);
    float _2180 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    uint _2182 = uint(int(uint(_2164) >> uint(31)));
    float _2184 = _2170 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    int _2186 = ~_2086;
    int _2188 = _2186 + _2174;
    int _2190 = _2188 + 1;
    int _2192 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2194 = _2192 != 0;
    int _2196 = ~_2178;
    int _2198 = _2124 + _2196;
    int _2200 = _2198 + 1;
    float _2202 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _2204 = _2162 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _2206 = _1746 * _2190;
    int _2208 = _2206 + _1910;
    int _2210 = ~int(_2182);
    int _2212 = _2210 + 1;
    float _2214 = _1682 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _2216 = _1746 == 0;
    bool _2218 = _1746 == 0;
    float _2220 = _2214 + _2184;
    int _2222 = _2200 ^ _2212;
    float _2224 = _2180 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2226 = -_1918;
    int _2228 = _1718 ? as_type<int>(_2226) : as_type<int>(_1918);
    bool _2230 = !_2216;
    int _2232 = _2230 ? _2208 : (-1);
    int _2234 = ~_2212;
    int _2236 = _2234 + _2222;
    int _2238 = _2236 + 1;
    float _2240 = as_type<float>(_2212);
    float _2242 = as_type<float>(_1910);
    float _2244 = _2094;
    float _2246 = _2126;
    float _2248 = _2140;
    float _2250 = _2102;
    float _2252 = _2078;
    if (!_2204)
    {
        _2240 = _2094;
    }
    float _2254 = _2240;
    bool _2256 = !_2194;
    float _2258 = _2256 ? _1918 : as_type<float>(_2228);
    float _2260 = _2254;
    float _2262 = _2258;
    if (!_2204)
    {
        _2242 = _2098;
    }
    float _2264 = _2242;
    float _2266 = float(_2232);
    float _2268 = _2264;
    if (!_2204)
    {
        _2244 = _2220;
    }
    float _2270 = _2244;
    bool _2272 = !_2204;
    float _2274 = _2270;
    if (!_2272)
    {
        float _2276 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2278 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2280 = _2162 + _2278;
        float _2282 = rsqrt(_2152);
        float _2284 = _2280 * _2276;
        float _2286 = _2220 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2288 = _2284 * 0.15915493667125701904296875;
        float _2290 = _2288 * 6.283185482025146484375;
        float _2292 = sin(_2290);
        float _2294 = _2288 * 6.283185482025146484375;
        float _2296 = cos(_2294);
        float _2298 = fma(_2292, _2286, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2300 = _2282 * _2298;
        float _2302 = fma(_2106, _2300, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2304 = _2296 + (-1.0);
        float _2306 = fma(_2122, _2300, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2308 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _2310 = _2302 + _2308;
        float _2312 = _2304 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2314 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _2316 = _2306 + _2314;
        float _2318 = _2310 * _2310;
        float _2320 = fma(_2220, _2296, _2312);
        float _2322 = _2316 * _2316;
        _2274 = _2320;
        _2246 = _2318;
        _2248 = _2322;
        _2260 = _2302;
        _2268 = _2306;
    }
    float _2324 = _2274;
    float _2326 = _2246;
    float _2328 = _2248;
    float _2330 = _2260;
    float _2332 = _2268;
    float _2334 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _2336 = _2324 + _2334;
    bool _2338 = !_2218;
    int _2340 = _2338 ? _2238 : (-1);
    float _2342 = -_2138;
    float _2344 = _2342 + 1.0;
    float _2346 = fma(_2224, _2266, _1650);
    float _2348 = fma(_2336, _2336, _2326);
    float _2350 = _2102 + 0.5;
    float _2352 = float(_2340);
    float _2354 = _2202 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2356 = _2348 + _2328;
    float _2358 = fma(_2344, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2166);
    float _2360 = fma(_2224, _2350, _2346);
    float _2362 = -_1666;
    float _2364 = _2362 + 1.0;
    float _2366 = -_1674;
    float _2368 = fma(_2354, _2352, _2366);
    float _2370 = _2258 + (-0.5);
    float _2372 = fma(_2118, (*spvDescriptorSet0.vp_c9)._m0[132].x, _2358);
    float _2374 = _993 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2376 = sqrt(_2356);
    float _2378 = -_2364;
    float _2380 = fma(_2102, _2378, _2360);
    float _2382 = _995 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2384 = -_2354;
    float _2386 = fma(_2384, _2370, _2368);
    float _2388 = _997 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2390 = -_1670;
    float _2392 = _2390 + 1.0;
    float _2394 = _2374 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2396 = _2382 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2398 = _2388 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2400 = _2372 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2402 = fma(_2258, _2392, _2386);
    out.m_64.x = _2394;
    out.m_64.y = _2396;
    out.m_64.z = _2398;
    out.m_64.w = _2400;
    bool _2404 = _2376 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2406 = isnan(_2376);
    bool _2408 = _2404 || _2406;
    bool _2410 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2412 = _2408 || _2410;
    out.m_66.x = _2380;
    out.m_66.y = _2402;
    float _2414 = _2380;
    if (!_2412)
    {
        _2250 = 1.0;
    }
    float _2416 = _2250;
    bool _2418 = !_2412;
    float _2420 = _2416;
    if (!_2418)
    {
        bool _2422 = _2376 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2424 = isnan(_2376);
        bool _2426 = _2422 || _2424;
        bool _2428 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2430 = _2426 || _2428;
        if (!_2430)
        {
            float _2432 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2434 = _2376 + _2432;
            float _2436 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2438 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2436;
            float _2440 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2442 = _2440 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2444 = 1.0 / _2438;
            float _2446 = _2434 * _2444;
            float _2448 = fma(_2446, _2442, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2420 = _2448;
            _2262 = _2438;
            _2450 = true;
        }
        else
        {
            bool _2452 = _2376 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2454 = isnan(_2376);
            bool _2456 = _2452 || _2454;
            bool _2458 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2460 = _2456 || _2458;
            if (!_2460)
            {
                float _2462 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2464 = _2376 + _2462;
                float _2466 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2468 = _2466 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2470 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2472 = _2470 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2474 = 1.0 / _2468;
                float _2476 = _2464 * _2474;
                float _2478 = fma(_2476, _2472, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2420 = _2478;
                _2262 = _2468;
                _2450 = true;
            }
            else
            {
                _2420 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2450 = false;
    float _2480 = _2420;
    float _2482 = _2262;
    float _2484 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2486 = _2324 + _2484;
    float _2488 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2490 = _2330 + _2488;
    float _2492 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2494 = _2332 + _2492;
    float _2496 = fma(_2486, _2480, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2498 = fma(_2490, _2480, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2500 = fma(_2494, _2480, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2502 = -_2214;
    float _2504 = _2502 + _2496;
    float _2506 = -_2052;
    float _2508 = _2506 + _2498;
    float _2510 = -_2078;
    float _2512 = _2510 + _2500;
    float _2514 = _2504 * _2504;
    float _2516 = fma(_2508, _2508, _2514);
    float _2518 = fma(_2512, _2512, _2516);
    float _2520 = sqrt(_2518);
    bool _2522 = _2520 > 0.0;
    bool _2524 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2526 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2528 = _2524 || _2526;
    bool _2530 = isnan(0.5);
    bool _2532 = _2528 || _2530;
    float _2534 = _2490;
    float _2536 = _2482;
    float _2538 = _2494;
    float _2540 = _2498;
    float _2542 = _2496;
    if (!_2522)
    {
        _2534 = _2498;
    }
    float _2544 = _2534;
    float _2546 = _2544;
    float _2548 = _2544;
    if (!_2522)
    {
        _2536 = _2496;
    }
    float _2550 = _2536;
    float _2552 = _2550;
    float _2554 = _2550;
    if (!_2522)
    {
        _2538 = _2500;
    }
    float _2556 = _2538;
    bool _2558 = !_2522;
    float _2560 = _2556;
    if (!_2558)
    {
        float _2562 = _301 * _301;
        float _2564 = fma(_215, _215, _2562);
        float _2566 = fma(_291, _291, _2564);
        float _2568 = rsqrt(_2518);
        float _2570 = sqrt(_2566);
        float _2572 = _2508 * _2568;
        float _2574 = _2504 * _2568;
        float _2576 = _2512 * _2568;
        bool _2578 = _2570 > 0.0;
        float _2580 = _2570;
        if (!_2578)
        {
            _2546 = _2498;
        }
        float _2582 = _2546;
        _2548 = _2582;
        if (!_2578)
        {
            _2552 = _2496;
        }
        float _2584 = _2552;
        _2554 = _2584;
        if (!_2578)
        {
            _2580 = _2500;
        }
        float _2586 = _2580;
        bool _2588 = !_2578;
        _2560 = _2586;
        if (!_2588)
        {
            float _2590 = rsqrt(_2566);
            float _2592 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _2594 = _301 * _2590;
            float _2596 = _215 * _2590;
            float _2598 = _2574 * _2594;
            float _2600 = _291 * _2590;
            float _2602 = fma(_2572, _2596, _2598);
            float _2604 = _2592 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2606 = fma(_2576, _2600, _2602);
            float _2608 = _2606 * _2604;
            float _2610 = fma(_215, _2608, _2498);
            float _2612 = fma(_301, _2608, _2496);
            float _2614 = fma(_291, _2608, _2500);
            _2548 = _2610;
            _2554 = _2612;
            _2560 = _2614;
        }
    }
    float _2616 = _2548;
    float _2618 = _2554;
    float _2620 = _2560;
    float _2622 = _2618;
    float _2624 = _2620;
    if (_2532)
    {
        _311 = _2616;
    }
    float _2626 = _311;
    float _2628 = _2626;
    if (!_2532)
    {
        float _2630 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2632 = _2214 + _2630;
        float _2634 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2636 = _2052 + _2634;
        float _2638 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2640 = _2632 * _2632;
        float _2642 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2644 = _2078 + _2642;
        float _2646 = fma(_2636, _2636, _2640);
        float _2648 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2650 = fma(_2644, _2644, _2646);
        float _2652 = sqrt(_2650);
        float _2654 = _2638 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2656 = precise::min(_2652, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2658 = _2656 * _2648;
        float _2660 = -_2052;
        float _2662 = _2660 + _2616;
        float _2664 = -_2214;
        float _2666 = _2664 + _2618;
        float _2668 = _2654 * _2658;
        float _2670 = -_2078;
        float _2672 = _2670 + _2620;
        float _2674 = fma(_2662, _2668, _2052);
        float _2676 = fma(_2666, _2668, _2214);
        float _2678 = fma(_2672, _2668, _2078);
        _2622 = _2676;
        _2628 = _2674;
        _2624 = _2678;
        _2540 = _2648;
    }
    float _2680 = _2622;
    float _2682 = _2628;
    float _2684 = _2624;
    float _2686 = _2540;
    float _2688 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2690 = _2680 + _2688;
    float _2692 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2694 = _2682 + _2692;
    float _2696 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2698 = _2684 + _2696;
    float _2700 = _2690 * _2690;
    float _2702 = fma(_2694, _2694, _2700);
    float _2704 = fma(_2698, _2698, _2702);
    float _2706 = rsqrt(_2704);
    float _2708 = sqrt(_2704);
    float _2710 = _2706 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2712 = _2694 * _2710;
    float _2714 = _2698 * _2710;
    float _2716 = _2712 * _2712;
    float _2718 = _2714 * _2714;
    float _2720 = _2716 + _2718;
    float _2722 = sqrt(_2720);
    bool _2724 = _2722 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2726 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2728 = _2722 + _2726;
    float _2730 = _2698;
    float _2732 = _2700;
    float _2734 = _2728;
    float _2736 = _2710;
    if (_2724)
    {
        float _2738 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2730 = _2738;
    }
    float _2740 = _2730;
    if (_2724)
    {
        float _2742 = rsqrt(_2720);
        _2732 = _2742;
    }
    float _2744 = _2732;
    float _2746 = _2744;
    if (_2724)
    {
        float _2748 = _2728 * _2740;
        _2734 = _2748;
    }
    float _2750 = _2734;
    if (_2724)
    {
        float _2752 = _2750 * 0.15915493667125701904296875;
        _2542 = _2752;
    }
    float _2754 = _2542;
    float _2756 = _2706;
    float _2758 = _2754;
    if (_2724)
    {
        float _2760 = _2754 * 6.283185482025146484375;
        float _2762 = sin(_2760);
        _2756 = _2762;
    }
    float _2764 = _2756;
    float _2766 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2768 = precise::max(0.0, _2766);
    float _2770 = _2686;
    float _2772 = _2768;
    float _2774 = _2766;
    if (_2724)
    {
        float _2776 = _2754 * 6.283185482025146484375;
        float _2778 = cos(_2776);
        _2770 = _2778;
    }
    float _2780 = _2770;
    float _2782 = -_2710;
    float _2784 = -_2768;
    float _2786 = fma(_2690, _2782, _2784);
    if (_2724)
    {
        float _2788 = _2786 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2772 = _2788;
    }
    float _2790 = _2772;
    float _2792 = _2790;
    if (!_2724)
    {
        _2758 = _2716;
    }
    float _2794 = _2758;
    float _2796 = _2764;
    float _2798 = _2794;
    if (_2724)
    {
        float _2800 = fma(_2764, _2790, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2796 = _2800;
    }
    float _2802 = _2796;
    float _2804 = _2802;
    if (!_2724)
    {
        _2792 = _2714;
    }
    float _2806 = _2792;
    float _2808 = _2806;
    if (_2724)
    {
        float _2810 = _2780 + (-1.0);
        _2774 = _2810;
    }
    float _2812 = _2774;
    float _2814 = _2812;
    if (_2724)
    {
        float _2816 = _2744 * _2802;
        _2414 = _2816;
    }
    float _2818 = _2414;
    if (!_2724)
    {
        _2746 = _2712;
    }
    float _2820 = _2746;
    float _2822 = _2820;
    if (_2724)
    {
        float _2824 = _2812 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2736 = _2824;
    }
    float _2826 = _2736;
    if (_2724)
    {
        float _2828 = _2712 * _2818;
        _2822 = _2828;
    }
    float _2830 = _2822;
    if (!_2724)
    {
        _2804 = _2786;
    }
    float _2832 = _2804;
    float _2834 = _2832;
    if (_2724)
    {
        float _2836 = _2714 * _2818;
        _2808 = _2836;
    }
    float _2838 = _2808;
    if (_2724)
    {
        float _2840 = fma(_2786, _2780, _2826);
        _2834 = _2840;
    }
    float _2842 = _2834;
    if (_2724)
    {
        float _2844 = _2830 * _2830;
        _2798 = _2844;
    }
    float _2846 = _2798;
    if (!_2724)
    {
        _2814 = _2718;
    }
    float _2848 = _2814;
    float _2850 = _2848;
    if (_2724)
    {
        float _2852 = _2838 * _2838;
        _2850 = _2852;
    }
    float _2854 = _2850;
    float _2856 = _2680 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2858 = fma(_2842, _2842, _2846);
    float _2860 = _2680 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2862 = fma(_2682, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2856);
    float _2864 = _2858 + _2854;
    float _2866 = _2680 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2868 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2870 = fma(_2708, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2868);
    float _2872 = precise::clamp(_2870, 0.0, 1.0);
    float _2874 = fma(_2684, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2862);
    float _2876 = rsqrt(_2864);
    float _2878 = _2680 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2880 = -_2872;
    float _2882 = _2880 + 1.0;
    float _2884 = fma(_2682, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2866);
    float _2886 = _2874 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2888 = fma(_2682, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2860);
    float _2890 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2892 = fma(_2684, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2884);
    float _2894 = abs(_2882);
    float _2896 = log2(_2894);
    float _2898 = _2886 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2900 = fma(_2682, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2878);
    float _2902 = fma(_2684, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2888);
    float _2904 = _2892 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2906 = -_2898;
    float _2908 = fma(_2906, _2890, 1.0);
    float _2910 = fma(_2684, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2900);
    float _2912 = _2902 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2914 = _2876 * _2830;
    float _2916 = _2904 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2918 = _2876 * _2842;
    float _2920 = _2876 * _2838;
    float _2922 = _2914 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2924 = fma(_2912, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2916);
    float _2926 = _2910 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2928 = log2(_2908);
    float _2930 = _2896 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2932 = -_2922;
    float _2934 = fma(_2918, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2932);
    float _2936 = fma(_2886, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2924);
    float _2938 = _2904 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2940 = -_2920;
    float _2942 = fma(_2940, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2934);
    float _2944 = fma(_2926, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2936);
    float _2946 = exp2(_2930);
    float _2948 = _2904 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2950 = fma(_2942, -0.5, 0.5);
    float _2952 = fma(_2912, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2938);
    float _2954 = fma(_2942, 0.5, 0.5);
    float _2956 = fma(_2912, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2948);
    float _2958 = _2918 + 1.0;
    float _2960 = fma(_2886, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2952);
    float _2962 = 1.0 / _2944;
    float _2964 = fma(_2954, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2966 = fma(_2886, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2956);
    float _2968 = _2928 * 0.693147182464599609375;
    float _2970 = fma(_2954, _2964, -0.212114393711090087890625);
    float _2972 = fma(_2926, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2966);
    float _2974 = _2968 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2976 = sqrt(_2950);
    float _2978 = -_2918;
    float _2980 = fma(_2946, _2958, _2978);
    float _2982 = fma(_2926, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2960);
    float _2984 = fma(_2954, _2970, 1.570728778839111328125);
    float _2986 = fma(_2980, 0.5, 0.5);
    float _2988 = _2982 * _2962;
    float _2990 = _2972 * _2962;
    float _2992 = fma(_2988, 0.5, 0.5);
    float _2994 = fma(_2990, -0.5, 0.5);
    float _2996 = _2976 * 0.636619746685028076171875;
    float3 _7647 = float3(_2992, _2994, _2974);
    float _2998 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7647, float3(0.0), isnan(_7647)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7647, float3(0.0), isnan(_7647)), level(0.0)).x;
    float3 _7658 = float3(_2992, _2994, _2974);
    float4 _3001 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7658, float3(0.0), isnan(_7658)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7658, float3(0.0), isnan(_7658)), level(0.0)).xyzw;
    float _3003 = _3001.x;
    float _3005 = _3001.y;
    float _3007 = _3001.z;
    float _3009 = _3001.w;
    float _3011 = -_2984;
    float _3013 = fma(_2996, _3011, 1.0);
    float2 _7680 = float2(_3013, _2986);
    float3 _3017 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7680, float2(0.0), isnan(_7680)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7680, float2(0.0), isnan(_7680)), level(0.0)).xyz;
    float _3019 = _3017.x;
    float _3021 = _3017.y;
    float _3023 = _3017.z;
    float _3025 = _2214 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _3027 = fma(_2052, (*spvDescriptorSet0.vp_c8)._m0[11].x, _3025);
    float _3029 = _2214 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _3031 = fma(_2078, (*spvDescriptorSet0.vp_c8)._m0[11].z, _3027);
    float _3033 = fma(_2052, (*spvDescriptorSet0.vp_c8)._m0[10].x, _3029);
    bool _3035 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _3037 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _3039 = _3035 || _3037;
    bool _3041 = isnan(0.5);
    bool _3043 = _3039 || _3041;
    float _3045 = _3031 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _3047 = fma(_2078, (*spvDescriptorSet0.vp_c8)._m0[10].z, _3033);
    float _3049 = 1.0 / _3045;
    float _3051 = _3047 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _3053 = _3051 + _3045;
    float _3055 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _3057 = _3031;
    if (!_3043)
    {
        _2252 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    }
    float _3059 = _2252;
    float _3061 = _2896 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3063 = exp2(_3061);
    float _3065 = _3053 * _3049;
    float _3067 = _3065 * 0.5;
    float _3069 = _3049;
    float _3071 = _3067;
    if (!_3043)
    {
        _3069 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _3073 = _3069;
    float _3075 = _3073;
    if (!_3043)
    {
        float _3077 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _3079 = fma(_3067, _3059, _3077);
        _3055 = _3079;
    }
    float _3081 = _3055;
    float _3083 = _2904 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    if (!_3043)
    {
        float _3085 = -_3073;
        float _3087 = _3085 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _3057 = _3087;
    }
    float _3089 = _3057;
    if (_3043)
    {
        _3071 = 1.0;
    }
    float _3091 = _3071;
    float _3093 = fma(_2912, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3083);
    float _3095 = _3081;
    float _3097 = _3091;
    if (!_3043)
    {
        float _3099 = 1.0 / _3081;
        _3095 = _3099;
    }
    float _3101 = _3095;
    float _3103 = fma(_2886, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3093);
    float _3105 = -_3063;
    float _3107 = _3105 + 1.0;
    float _3109 = fma(_2926, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3103);
    float _3111 = _3089;
    if (!_3043)
    {
        float _3113 = 1.0 / _3089;
        _3111 = _3113;
    }
    float _3115 = _3111;
    float _3117 = _3107 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3119 = _3109 + _2944;
    out.gl_Position.x = _2982;
    out.gl_Position.y = _2972;
    out.gl_Position.z = _3109;
    out.gl_Position.w = _2944;
    if (!_3043)
    {
        float _3121 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _3123 = -_3073;
        float _3125 = fma(_3101, _3121, _3123);
        _3075 = _3125;
    }
    float _3127 = _3075;
    float _3129 = _3119 * 0.5;
    if (!_3043)
    {
        float _3131 = _3127 * _3115;
        float _3133 = precise::clamp(_3131, 0.0, 1.0);
        _3097 = _3133;
    }
    float _3135 = _3097;
    float _3137 = _3135 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _3139 = _3135 > 0.0;
    bool _3141 = isnan(_3135);
    bool _3143 = _3139 || _3141;
    bool _3145 = isnan(0.0);
    bool _3147 = _3143 || _3145;
    out.m_68.z = _3129;
    out.m_68.w = _2944;
    float _3149 = _3137 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_47.x = _3149;
    float _3151 = _3117 * _2998;
    float _3153 = -_3117;
    float _3155 = _3153 + 1.0;
    float _3157 = _3009 * _3151;
    float _3159 = _3023 * _3151;
    float _3161 = fma(_3019, _3157, _3003);
    float _3163 = fma(_3021, _3157, _3005);
    float _3165 = _3009 * _3155;
    float _3167 = fma(_3009, _3159, _3007);
    out.m_70.x = _3161;
    out.m_70.y = _3163;
    out.m_70.z = _3167;
    out.m_70.w = _3165;
    if (_3147)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_47.x = 0.0;
    float _3169 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3169;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2450 = false;
    bool _1021 = false;
    bool _797 = false;
    bool _695 = false;
    bool _521 = false;
    bool _329 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _84 = in.m_44.w;
    float _86 = trunc(_84);
    int _89 = int(_86);
    bool _93 = _89 >= 1;
    float _95 = 0.0;
    if (!_93)
    {
        _95 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _97 = _95;
    float _99 = _97;
    if (!_93)
    {
        out.m_47.x = 0.0;
    }
    int _101 = 0;
    if (!_93)
    {
        float _103 = _97 * 5.0;
        _101 = as_type<int>(_103);
    }
    int _105 = _101;
    int _107 = _105;
    if (!_93)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3226 = as_type<float>(_105);
        out.gl_Position.z = _3226;
    }
    if (!_93)
    {
        return out;
    }
    float _109 = in.m_49.w;
    bool _111 = _109 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _113 = isnan(_109);
    bool _115 = _111 || _113;
    bool _117 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _119 = _115 || _117;
    float _121 = -_109;
    float _123 = _121 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _125 = 0.0;
    float _127 = _123;
    if (_119)
    {
        float _129 = float(_89);
        _125 = _129;
    }
    float _131 = _125;
    bool _133 = _123 >= _131;
    bool _135 = !_119;
    bool _137 = _133 || _135;
    if (_137)
    {
        _99 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _139 = _99;
    if (_137)
    {
        out.m_47.x = 0.0;
    }
    if (_137)
    {
        float _141 = _139 * 5.0;
        _107 = as_type<int>(_141);
    }
    int _143 = _107;
    if (_137)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3295 = as_type<float>(_143);
        out.gl_Position.z = _3295;
    }
    if (_137)
    {
        return out;
    }
    float _145 = in.m_51.x;
    float _147 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _149 = _123 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _151 = in.m_53.x;
    float _153 = in.m_53.y;
    float _155 = in.m_53.z;
    float _157 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].w;
    float _159 = _149 * _147;
    float _161 = _123 + (*spvDescriptorSet0.vp_c9)._m0[20].w;
    float _163 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[20].x, _159);
    float _165 = _161 * _157;
    float _167 = floor(_163);
    float _169 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[20].y, _165);
    float _171 = _163 * 6.283185482025146484375;
    float _173 = _153 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _175 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _177 = _175 != 0;
    float _179 = _153 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _181 = floor(_169);
    float _183 = _171 * 0.15915493667125701904296875;
    float _185 = _153 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _187 = fma(_151, (*spvDescriptorSet0.vp_c10)._m0[4].x, _179);
    float _189 = _169 * 6.283185482025146484375;
    int _191 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _193 = _191 != 0;
    int _195 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _197 = _195 != 0;
    float _199 = fma(_151, (*spvDescriptorSet0.vp_c10)._m0[5].x, _173);
    float _201 = fma(_151, (*spvDescriptorSet0.vp_c10)._m0[6].x, _185);
    float _203 = _183 * 6.283185482025146484375;
    float _205 = cos(_203);
    float _207 = -_167;
    float _209 = _163 + _207;
    bool _211 = !_193;
    int _213 = _211 ? 0 : 1;
    float _215 = fma(_155, (*spvDescriptorSet0.vp_c10)._m0[4].z, _187);
    int _217 = abs(_213);
    float _219 = -_181;
    float _221 = _169 + _219;
    float _223 = _189 * 0.15915493667125701904296875;
    bool _225 = !_177;
    int _227 = _225 ? 0 : 1;
    float _229 = -_209;
    float _231 = fma(_229, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _233 = -_221;
    float _235 = fma(_233, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    int _237 = abs(_227);
    float _239 = _223 * 6.283185482025146484375;
    float _241 = cos(_239);
    float _243 = float(_217);
    float _245 = fma(_205, 0.5, 0.5);
    bool _247 = _209 < 0.5;
    float _249 = float(_247);
    bool _251 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _253 = abs(_231);
    float _255 = _243 * _253;
    bool _257 = !_197;
    int _259 = _257 ? 0 : 1;
    float _261 = abs(_235);
    float _263 = _243 * _261;
    float _265 = float(_237);
    float _267 = -_249;
    float _269 = fma(_267, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _271 = abs(_259);
    float _273 = -_245;
    float _275 = fma(_273, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _277 = _221 < 0.5;
    float _279 = float(_277);
    float _281 = float(_271);
    float _283 = fma(_241, 0.5, 0.5);
    float _285 = fma(_265, _275, _255);
    float _287 = -_279;
    float _289 = fma(_287, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    float _291 = fma(_155, (*spvDescriptorSet0.vp_c10)._m0[6].z, _201);
    float _293 = -_283;
    float _295 = fma(_293, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    float _297 = abs(_269);
    float _299 = fma(_281, _297, _285);
    float _301 = fma(_155, (*spvDescriptorSet0.vp_c10)._m0[5].z, _199);
    float _303 = fma(_265, _295, _263);
    float _305 = abs(_289);
    float _307 = fma(_281, _305, _303);
    bool _309 = !_251;
    float _311 = _215;
    float _327;
    if (!_309)
    {
        float _313 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _315 = _145 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _317 = fma(_315, (*spvDescriptorSet0.vp_c9)._m0[12].x, _123);
        float _319 = _317 * _313;
        float _321 = floor(_319);
        float _323 = -_321;
        float _325 = _319 + _323;
        _327 = _325;
        _329 = true;
    }
    else
    {
        float _331 = float(_89);
        float _333 = 1.0 / _331;
        float _335 = _123 * _333;
        _327 = _335;
    }
    _329 = false;
    float _337 = _327;
    float _339 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _341 = _337 + _339;
    float _343 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _345 = _337 + _343;
    bool _347 = _337 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _349 = isnan(_337);
    bool _351 = _347 || _349;
    bool _353 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _355 = _351 || _353;
    float _357 = float(_355);
    float _359 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _361 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _359;
    float _363 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _365 = _363 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _367 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _369 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _367;
    float _371 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _373 = _337 + _371;
    bool _375 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _377 = 1.0 / _365;
    float _379 = 1.0 / _361;
    float _381 = 1.0 / _369;
    float _383 = _373 * _377;
    bool _385 = _337 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _387 = isnan(_337);
    bool _389 = _385 || _387;
    bool _391 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _393 = _389 || _391;
    float _395 = float(_393);
    float _397 = _341 * _379;
    bool _399 = _337 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _401 = isnan(_337);
    bool _403 = _399 || _401;
    bool _405 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _407 = _403 || _405;
    float _409 = float(_407);
    float _411 = -_357;
    float _413 = _411 + 1.0;
    bool _415 = _337 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _417 = isnan(_337);
    bool _419 = _415 || _417;
    bool _421 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _423 = _419 || _421;
    float _425 = float(_423);
    float _427 = _409 * _413;
    float _429 = _345 * _381;
    float _431 = -_409;
    float _433 = _431 + 1.0;
    float _435 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _437 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _435;
    float _439 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _441 = _439 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _443 = _425 * _433;
    float _445 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _447 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _445;
    float _449 = -_425;
    float _451 = _449 + 1.0;
    float _453 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _455 = _453 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _457 = fma(_437, _397, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _459 = fma(_447, _397, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _461 = _395 * _451;
    float _463 = fma(_455, _383, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _465 = fma(_441, _383, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _467 = -_395;
    float _469 = _467 + 1.0;
    float _471 = _459 * _461;
    float _473 = _457 * _461;
    float _475 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _477 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _475;
    float _479 = fma(_469, (*spvDescriptorSet0.vp_c9)._m0[143].x, _471);
    float _481 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _483 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _481;
    float _485 = fma(_469, (*spvDescriptorSet0.vp_c9)._m0[143].y, _473);
    float _487 = fma(_477, _429, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _489 = fma(_463, _443, _479);
    float _491 = fma(_483, _429, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _493 = fma(_465, _443, _485);
    float _495 = fma(_487, _427, _489);
    float _497 = fma(_491, _427, _493);
    float _499 = fma(_357, (*spvDescriptorSet0.vp_c9)._m0[146].x, _495);
    float _501 = fma(_357, (*spvDescriptorSet0.vp_c9)._m0[146].y, _497);
    bool _503 = !_375;
    float _519;
    if (!_503)
    {
        float _505 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _507 = _145 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _509 = fma(_507, (*spvDescriptorSet0.vp_c9)._m0[11].x, _123);
        float _511 = _509 * _505;
        float _513 = floor(_511);
        float _515 = -_513;
        float _517 = _511 + _515;
        _519 = _517;
        _521 = true;
    }
    else
    {
        float _523 = float(_89);
        float _525 = 1.0 / _523;
        float _527 = _123 * _525;
        _519 = _527;
    }
    _521 = false;
    float _529 = _519;
    float _531 = in.m_55.x;
    float _533 = in.m_55.y;
    float _535 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _537 = _529 + _535;
    bool _539 = _529 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _541 = isnan(_529);
    bool _543 = _539 || _541;
    bool _545 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _547 = _543 || _545;
    float _549 = float(_547);
    float _551 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _553 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _551;
    float _555 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _557 = _555 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _559 = -_549;
    float _561 = _559 + 1.0;
    float _563 = 1.0 / _553;
    bool _565 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _567 = 1.0 / _557;
    float _569 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _571 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _569;
    float _573 = _501 * _533;
    float _575 = _537 * _563;
    float _577 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _579 = _529 + _577;
    bool _581 = _529 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _583 = isnan(_529);
    bool _585 = _581 || _583;
    bool _587 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _589 = _585 || _587;
    float _591 = float(_589);
    float _593 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _595 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _593;
    bool _597 = _529 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _599 = isnan(_529);
    bool _601 = _597 || _599;
    bool _603 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _605 = _601 || _603;
    float _607 = float(_605);
    float _609 = fma(_571, _575, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _611 = _499 * _531;
    float _613 = fma(_595, _575, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _615 = _579 * _567;
    float _617 = _607 * _561;
    float _619 = -_607;
    float _621 = _619 + 1.0;
    float _623 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _625 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _623;
    float _627 = _591 * _621;
    float _629 = fma(_625, _575, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _631 = -_591;
    float _633 = _631 + 1.0;
    float _635 = _609 * _627;
    float _637 = _629 * _627;
    float _639 = _613 * _627;
    float _641 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _643 = _641 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _645 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _647 = _645 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _649 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _651 = _649 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _653 = fma(_633, (*spvDescriptorSet0.vp_c9)._m0[107].x, _637);
    float _655 = fma(_633, (*spvDescriptorSet0.vp_c9)._m0[107].y, _635);
    float _657 = fma(_643, _615, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _659 = fma(_647, _615, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _661 = fma(_651, _615, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _663 = fma(_633, (*spvDescriptorSet0.vp_c9)._m0[107].z, _639);
    float _665 = fma(_657, _617, _653);
    float _667 = fma(_659, _617, _655);
    float _669 = fma(_661, _617, _663);
    float _671 = fma(_549, (*spvDescriptorSet0.vp_c9)._m0[109].x, _665);
    float _673 = fma(_549, (*spvDescriptorSet0.vp_c9)._m0[109].y, _667);
    float _675 = fma(_549, (*spvDescriptorSet0.vp_c9)._m0[109].z, _669);
    bool _677 = !_565;
    float _693;
    if (!_677)
    {
        float _679 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _681 = _145 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _683 = fma(_681, (*spvDescriptorSet0.vp_c9)._m0[11].y, _123);
        float _685 = _683 * _679;
        float _687 = floor(_685);
        float _689 = -_687;
        float _691 = _685 + _689;
        _693 = _691;
        _695 = true;
    }
    else
    {
        float _697 = float(_89);
        float _699 = 1.0 / _697;
        float _701 = _123 * _699;
        _693 = _701;
    }
    _695 = false;
    float _703 = _693;
    float _705 = _671 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _707 = _673 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    bool _709 = _703 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _711 = isnan(_703);
    bool _713 = _709 || _711;
    bool _715 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _717 = _713 || _715;
    float _719 = float(_717);
    float _721 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _723 = _721 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _725 = _703 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _727 = isnan(_703);
    bool _729 = _725 || _727;
    bool _731 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _733 = _729 || _731;
    float _735 = float(_733);
    float _737 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _739 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _737;
    float _741 = _675 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _743 = 1.0 / _723;
    float _745 = -_719;
    float _747 = _745 + 1.0;
    float _749 = _705 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _751 = _707 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _753 = _741 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _755 = _735 * _747;
    float _757 = -_735;
    float _759 = _757 + 1.0;
    bool _761 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _763 = _739 * _743;
    float _765 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _767 = _703 + _765;
    float _769 = fma(_763, _767, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _771 = _769 * _755;
    float _773 = fma(_759, (*spvDescriptorSet0.vp_c9)._m0[115].x, _771);
    float _775 = fma(_719, (*spvDescriptorSet0.vp_c9)._m0[116].x, _773);
    float _777 = _775 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_57.x = _749;
    out.m_57.y = _751;
    out.m_57.z = _753;
    out.m_57.w = _777;
    bool _779 = !_761;
    float _795;
    if (!_779)
    {
        float _781 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _783 = _145 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _785 = fma(_783, (*spvDescriptorSet0.vp_c9)._m0[11].z, _123);
        float _787 = _785 * _781;
        float _789 = floor(_787);
        float _791 = -_789;
        float _793 = _787 + _791;
        _795 = _793;
        _797 = true;
    }
    else
    {
        float _799 = float(_89);
        float _801 = 1.0 / _799;
        float _803 = _123 * _801;
        _795 = _803;
    }
    _797 = false;
    float _805 = _795;
    float _807 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _809 = _805 + _807;
    float _811 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _813 = _805 + _811;
    float _815 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _817 = _805 + _815;
    float _819 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _821 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _819;
    float _823 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _825 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _823;
    float _827 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _829 = _827 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _831 = 1.0 / _821;
    bool _833 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _835 = 1.0 / _825;
    float _837 = 1.0 / _829;
    float _839 = _809 * _831;
    bool _841 = _805 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _843 = isnan(_805);
    bool _845 = _841 || _843;
    bool _847 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _849 = _845 || _847;
    float _851 = float(_849);
    float _853 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _855 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _853;
    bool _857 = _805 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _859 = isnan(_805);
    bool _861 = _857 || _859;
    bool _863 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _865 = _861 || _863;
    float _867 = float(_865);
    float _869 = _813 * _835;
    float _871 = -_851;
    float _873 = _871 + 1.0;
    float _875 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _877 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _875;
    float _879 = fma(_855, _869, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _881 = _867 * _873;
    bool _883 = _805 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _885 = isnan(_805);
    bool _887 = _883 || _885;
    bool _889 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _891 = _887 || _889;
    float _893 = float(_891);
    float _895 = -_867;
    float _897 = _895 + 1.0;
    float _899 = _817 * _837;
    bool _901 = _805 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _903 = isnan(_805);
    bool _905 = _901 || _903;
    bool _907 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _909 = _905 || _907;
    float _911 = float(_909);
    float _913 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _915 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _913;
    float _917 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _919 = _917 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _921 = fma(_877, _869, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _923 = -_911;
    float _925 = _923 + 1.0;
    float _927 = fma(_915, _869, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _929 = _911 * _897;
    float _931 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _933 = _931 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _935 = _893 * _925;
    float _937 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _939 = _937 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _941 = -_893;
    float _943 = _941 + 1.0;
    float _945 = _879 * _935;
    float _947 = _921 * _935;
    float _949 = _927 * _935;
    float _951 = fma(_943, (*spvDescriptorSet0.vp_c9)._m0[123].x, _945);
    float _953 = fma(_943, (*spvDescriptorSet0.vp_c9)._m0[123].y, _947);
    float _955 = fma(_919, _899, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _957 = fma(_933, _899, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _959 = fma(_943, (*spvDescriptorSet0.vp_c9)._m0[123].z, _949);
    float _961 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _963 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _961;
    float _965 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _967 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _965;
    float _969 = fma(_939, _899, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _971 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _973 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _971;
    float _975 = fma(_955, _929, _951);
    float _977 = fma(_963, _839, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _979 = fma(_967, _839, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _981 = fma(_957, _929, _953);
    float _983 = fma(_973, _839, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _985 = fma(_969, _929, _959);
    float _987 = fma(_977, _881, _975);
    float _989 = fma(_979, _881, _981);
    float _991 = fma(_983, _881, _985);
    float _993 = fma(_851, (*spvDescriptorSet0.vp_c9)._m0[126].x, _987);
    float _995 = fma(_851, (*spvDescriptorSet0.vp_c9)._m0[126].y, _989);
    float _997 = fma(_851, (*spvDescriptorSet0.vp_c9)._m0[126].z, _991);
    bool _999 = !_833;
    float _1017;
    float _1019;
    if (!_999)
    {
        float _1001 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _1003 = _145 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _1005 = float(_89);
        float _1007 = fma(_1003, (*spvDescriptorSet0.vp_c9)._m0[11].w, _123);
        float _1009 = _1007 * _1001;
        float _1011 = floor(_1009);
        float _1013 = -_1011;
        float _1015 = _1009 + _1013;
        _1017 = _1005;
        _1019 = _1015;
        _1021 = true;
    }
    else
    {
        float _1023 = float(_89);
        float _1025 = 1.0 / _1023;
        float _1027 = _123 * _1025;
        _1017 = _1023;
        _1019 = _1027;
    }
    _1021 = false;
    float _1029 = _1017;
    float _1031 = _1019;
    float _1033 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1035 = int(_1033);
    float _1037 = in.m_51.y;
    float _1039 = _299 * _611;
    float _1041 = _307 * _573;
    float _1043 = in.m_51.z;
    float _1045 = _1041 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1047 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1049 = int(_1047);
    float _1051 = as_type<float>(int(gl_VertexIndex));
    float _1053 = float(_1035);
    float _1055 = 1.0 / _1029;
    float _1057 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1059 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1057);
    float _1061 = float(uint(_1049));
    float _1063 = 1.0 / _1053;
    int _1065 = ~_1049;
    int _1067 = _1065 + 1;
    bool _1069 = _1049 == 0;
    float _1071 = 1.0 / _1061;
    float _1073 = _1063 * _123;
    float _1075 = trunc(_1073);
    int _1077 = int(_1075);
    int _1079 = as_type<int>(_1071) + (-2);
    float _1081 = float(uint(_1077));
    float _1083 = as_type<float>(_1079) * _1081;
    float _1085 = trunc(_1083);
    float _1087 = precise::max(_1085, 0.0);
    uint _1090 = uint(_1087);
    int _1092 = ~_1049;
    int _1094 = _1092 + 1;
    int _1096 = _1067 * int(_1090);
    int _1098 = _1096 + _1077;
    float _1100 = float(uint(_1098));
    float _1102 = as_type<float>(_1079) * _1100;
    int _1104 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1106 = _1104 != 0;
    float _1108 = trunc(_1102);
    float _1110 = precise::max(_1108, 0.0);
    uint _1112 = uint(_1110);
    bool _1114 = !_1106;
    float _1116 = _1114 ? 7.345489978790283203125 : 1.0;
    float _1118 = _1116 * _145;
    float _1120 = floor(_1118);
    int _1122 = int(_1090) + int(_1112);
    float _1124 = float(_1049);
    float _1126 = float(_1077);
    int _1128 = _1094 * _1122;
    int _1130 = _1128 + _1077;
    bool _1132 = _1126 >= _1124;
    bool _1134 = isnan(_1126);
    bool _1136 = _1132 || _1134;
    bool _1138 = isnan(_1124);
    bool _1140 = _1136 || _1138;
    float _1142 = float(_1140);
    bool _1144 = uint(_1130) >= uint(_1049);
    float _1146 = -_1120;
    float _1148 = _1118 + _1146;
    float _1150 = trunc(_1142);
    int _1152 = int(_1150);
    bool _1154 = !_1144;
    int _1156 = _1154 ? 0 : (-1);
    float _1158 = _1148 * _1124;
    float _1160 = _1124 * _123;
    int _1162 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1164 = _1162 != 0;
    int _1166 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1168 = _1166 != 0;
    int _1170 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1172 = _1170 != 0;
    int _1174 = ~_1122;
    int _1176 = _1174 + _1156;
    int _1178 = _1176 + 1;
    float _1180 = _1160 * _1055;
    float _1182 = trunc(_1158);
    int _1184 = int(_1182);
    int _1186 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1188 = _1186 != 0;
    int _1190 = _1049 * _1178;
    int _1192 = _1190 + _1077;
    bool _1194 = !_1168;
    int _1196 = _1194 ? 0 : 1;
    bool _1198 = !_1164;
    int _1200 = _1198 ? 0 : 1;
    int _1202 = ~_1152;
    int _1204 = _1202 + 1;
    int _1206 = _1204 + 1;
    float _1208 = trunc(_1180);
    int _1210 = int(_1208);
    bool _1212 = !_1069;
    int _1214 = _1212 ? _1192 : (-1);
    int _1216 = abs(_1200);
    int _1218 = _1214 * _1206;
    int _1220 = _1049 + (-1);
    int _1222 = _1152 * _1220;
    int _1224 = _1222 + _1218;
    bool _1226 = !_1188;
    int _1228 = _1226 ? 0 : 1;
    int _1230 = abs(_1196);
    int _1232 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1234 = _1232 != 0;
    bool _1236 = !_1172;
    int _1238 = _1236 ? 0 : 1;
    int _1240 = _1224 * _1230;
    int _1242 = abs(_1228);
    bool _1244 = !_1234;
    int _1246 = _1244 ? 0 : 1;
    int _1248 = abs(_1238);
    int _1250 = _1184 * _1242;
    int _1252 = _1250 + _1077;
    int _1254 = abs(_1246);
    int _1256 = _1210 * _1216;
    int _1258 = _1256 + _1240;
    int _1260 = ~_1049;
    int _1262 = _1260 + 1;
    int _1264 = _1252 * _1248;
    int _1266 = _1264 + _1258;
    int _1268 = ~_1049;
    int _1270 = _1268 + 1;
    int _1272 = _1184 * _1254;
    int _1274 = _1272 + _1266;
    float _1276 = float(uint(_1274));
    float _1278 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1280 = as_type<float>(_1079) * _1276;
    float _1282 = trunc(_1280);
    float _1284 = precise::max(_1282, 0.0);
    uint _1286 = uint(_1284);
    int _1288 = _1262 * int(_1286);
    int _1290 = _1288 + _1274;
    float _1292 = float(uint(_1290));
    float _1294 = as_type<float>(_1079) * _1292;
    float _1296 = trunc(_1294);
    float _1298 = precise::max(_1296, 0.0);
    uint _1300 = uint(_1298);
    int _1302 = ~_1049;
    int _1304 = _1302 + 1;
    int _1306 = int(_1286) + int(_1300);
    float _1308 = float(uint(_1252));
    int _1310 = _1270 * _1306;
    int _1312 = _1310 + _1274;
    float _1314 = as_type<float>(_1079) * _1308;
    bool _1316 = uint(_1312) >= uint(_1049);
    float _1318 = trunc(_1314);
    float _1320 = precise::max(_1318, 0.0);
    uint _1322 = uint(_1320);
    float _1324 = _145 * 2.0;
    bool _1326 = !_1316;
    int _1328 = _1326 ? 0 : (-1);
    int _1330 = ~_1306;
    int _1332 = _1330 + _1328;
    int _1334 = _1332 + 1;
    float _1336 = floor(_1324);
    int _1338 = _1049 * _1334;
    int _1340 = _1338 + _1274;
    float _1342 = _1037 * 2.0;
    float _1344 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _1346 = _1304 * int(_1322);
    int _1348 = _1346 + _1252;
    bool _1350 = !_1069;
    int _1352 = _1350 ? _1340 : (-1);
    float _1354 = floor(_1342);
    int _1356 = _1352 & 3;
    bool _1358 = _1356 != 0;
    float _1360 = float(uint(_1348));
    bool _1362 = uint(_1356) > 1u;
    int _1364 = _1352 & 3;
    bool _1366 = _1364 != 0;
    float _1368 = as_type<float>(_1079) * _1360;
    bool _1370 = _1336 > 0.0;
    bool _1372 = _1336 >= 0.0;
    bool _1374 = isnan(_1336);
    bool _1376 = _1372 || _1374;
    bool _1378 = isnan(0.0);
    bool _1380 = _1376 || _1378;
    int _1382 = _1366 ? 0 : 1;
    float _1384 = trunc(_1368);
    float _1386 = precise::max(_1384, 0.0);
    uint _1388 = uint(_1386);
    bool _1390 = _1354 > 0.0;
    int _1392 = _1380 ? 0 : 1;
    bool _1394 = _1354 >= 0.0;
    bool _1396 = isnan(_1354);
    bool _1398 = _1394 || _1396;
    bool _1400 = isnan(0.0);
    bool _1402 = _1398 || _1400;
    int _1404 = ~_1382;
    int _1406 = _1404 + 1;
    int _1408 = _1406 + 1;
    int _1410 = _1408;
    if (!_1362)
    {
        int _1412 = ~_1382;
        int _1414 = _1412 + 1;
        _1410 = _1414;
    }
    int _1416 = _1410;
    int _1418 = ~_1392;
    int _1420 = _1418 + 1;
    int _1422 = _1420 + 1;
    bool _1424 = _1356 != 3;
    int _1426 = _1402 ? 0 : 1;
    int _1428 = _1422;
    if (!_1370)
    {
        int _1430 = ~_1392;
        int _1432 = _1430 + 1;
        _1428 = _1432;
    }
    int _1434 = _1428;
    float _1436 = in.m_44.x;
    float _1438 = in.m_44.y;
    float _1440 = in.m_44.z;
    bool _1442 = uint(_1356) >= 2u;
    int _1444 = ~_1426;
    int _1446 = _1444 + 1;
    int _1448 = _1446 + 1;
    int _1450 = _1448;
    if (!_1390)
    {
        int _1452 = ~_1426;
        int _1454 = _1452 + 1;
        _1450 = _1454;
    }
    int _1456 = _1450;
    float _1458 = _1043 * 2.0;
    int _1460 = _1442 ? 0 : 1;
    int _1462 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1464 = _1462 != 0;
    int _1466 = int(_1322) + int(_1388);
    float _1468 = floor(_1458);
    int _1470 = ~_1049;
    int _1472 = _1470 + 1;
    int _1474 = ~_1460;
    int _1476 = _1474 + 1;
    int _1478 = _1476 + 1;
    int _1480 = _1478;
    if (_1424)
    {
        int _1482 = ~_1460;
        int _1484 = _1482 + 1;
        _1480 = _1484;
    }
    int _1486 = _1480;
    bool _1488 = !_1464;
    int _1490 = _1488 ? 0 : 1;
    float _1492 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1494 = log2(_1492);
    int _1496 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1498 = _1496 != 0;
    int _1500 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1502 = _1500 != 0;
    int _1504 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1506 = _1504 != 0;
    int _1508 = _1472 * _1466;
    int _1510 = _1508 + _1252;
    float _1512 = _1037 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1514 = _1438 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1516 = _1438 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _1518 = !_1502;
    int _1520 = _1518 ? 0 : 1;
    float _1522 = fma(_1512, -2.0, _1278);
    bool _1524 = uint(_1510) >= uint(_1049);
    float _1526 = _145 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1528 = fma(_1436, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1514);
    float _1530 = fma(_1436, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1516);
    bool _1532 = !_1524;
    int _1534 = _1532 ? 0 : (-1);
    float _1536 = -_1344;
    float _1538 = fma(_1526, 2.0, _1536);
    int _1540 = as_type<int>(_1051) & 1;
    bool _1542 = _1540 != 0;
    int _1544 = as_type<int>(_1051) & 2;
    bool _1546 = _1544 != 0;
    float _1548 = _1438 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    bool _1550 = !_1498;
    int _1552 = _1550 ? 0 : 1;
    float _1554 = _145 + _1037;
    bool _1556 = _1468 >= 0.0;
    bool _1558 = isnan(_1468);
    bool _1560 = _1556 || _1558;
    bool _1562 = isnan(0.0);
    bool _1564 = _1560 || _1562;
    float _1566 = _1494 * _123;
    float _1568 = fma(_1436, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1548);
    float _1570 = _1554 + (-1.0);
    int _1572 = _1564 ? 0 : 1;
    float _1574 = exp2(_1566);
    bool _1576 = _1468 > 0.0;
    float _1578 = fma(_1570, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1580 = _145 + _1043;
    int _1582 = _1352 >> 31;
    float _1584 = _1037 + _1043;
    bool _1586 = !_1506;
    int _1588 = _1586 ? 0 : 1;
    float _1590 = _1580 + (-1.0);
    int _1592 = _1582 & 3;
    float _1594 = _1584 + (-1.0);
    float _1596 = fma(_1590, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    int _1598 = ~_1572;
    int _1600 = _1598 + 1;
    int _1602 = _1600 + 1;
    float _1604 = fma(_1594, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _1606 = _1602;
    if (!_1576)
    {
        int _1608 = ~_1572;
        int _1610 = _1608 + 1;
        _1606 = _1610;
    }
    int _1612 = _1606;
    float _1614 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1616 = 1.0 + _1614;
    int _1618 = _1352 + _1592;
    float _1620 = -_1574;
    float _1622 = _1620 + 1.0;
    float _1624 = in.m_62.x;
    float _1626 = in.m_62.y;
    float _1628 = in.m_62.z;
    bool _1630 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1632 = isnan(0.0);
    bool _1634 = _1630 || _1632;
    bool _1636 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1638 = _1634 || _1636;
    float _1640 = 1.0 / _1616;
    int _1642 = abs(_1520);
    float _1644 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1646 = _1638 ? _1622 : 0.0;
    float _1648 = -_123;
    float _1650 = fma(_1648, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1538);
    bool _1652 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1654 = isnan(1.0);
    bool _1656 = _1652 || _1654;
    bool _1658 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1660 = _1656 || _1658;
    float _1662 = fma(_1037, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1644);
    int _1664 = _1618 >> 2;
    float _1666 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1059);
    int _1668 = abs(_1588);
    float _1670 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1662);
    int _1672 = abs(_1552);
    float _1674 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1522);
    float _1676 = fma(_1440, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1568);
    int _1678 = _1664 << 4;
    int _1680 = _1678 + 368;
    float _1682 = fma(_1440, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1528);
    float _1684 = float(_1434);
    if (_1660)
    {
        float _1686 = _1646 * _1640;
        _127 = _1686;
    }
    float _1688 = _127;
    float _1690 = float(_1456);
    float _1692 = fma(_1440, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1530);
    float _1694 = float(_1672);
    float _1696 = float(_1612);
    uint _1698 = uint(int(uint(_1680) >> uint(2)));
    uint _1700 = uint(int(uint(int(_1698)) >> uint(2)));
    int _1702 = int(_1698) & 3;
    float _1704 = (*spvDescriptorSet0.vp_c9)._m0[int(_1700)][_1702];
    int _1706 = int(_1698) + 1;
    uint _1708 = uint(int(uint(_1706) >> uint(2)));
    int _1710 = _1706 & 3;
    float _1712 = (*spvDescriptorSet0.vp_c9)._m0[int(_1708)][_1710];
    float _1714 = float(_1668);
    float _1716 = float(_1642);
    bool _1718 = _1037 > 0.5;
    float _1720 = _1714 * _1690;
    float _1722 = _1694 * _1696;
    float _1724 = _1716 * _1684;
    int _1726 = _1680 + 8;
    uint _1728 = uint(int(uint(_1726) >> uint(2)));
    uint _1730 = uint(int(uint(int(_1728)) >> uint(2)));
    int _1732 = int(_1728) & 3;
    float _1734 = (*spvDescriptorSet0.vp_c9)._m0[int(_1730)][_1732];
    int _1736 = int(_1728) + 1;
    uint _1738 = uint(int(uint(_1736) >> uint(2)));
    int _1740 = _1736 & 3;
    float _1742 = (*spvDescriptorSet0.vp_c9)._m0[int(_1738)][_1740];
    float _1744 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _1746 = int(_1744);
    float _1748 = _1722 * (-2.0);
    float _1750 = _1724 * (-2.0);
    float _1752 = _1037 + (-0.5);
    float _1754 = _1720 * (-2.0);
    float _1756 = fma(_1578, _1748, _1578);
    float _1758 = fma(_1604, _1750, _1604);
    float _1760 = fma(_1750, _1626, _1626);
    float _1762 = fma(_1748, _1624, _1624);
    int _1764 = abs(_1416);
    float _1766 = _145 + (-0.5);
    float _1768 = fma(_1752, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1760);
    float _1770 = fma(_1596, _1754, _1596);
    float _1772 = fma(_1754, _1628, _1628);
    float _1774 = _1043 + (-0.5);
    bool _1776 = !_1358;
    int _1778 = _1776 ? 0 : 1;
    float _1780 = fma(_1766, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1762);
    int _1782 = abs(_1746);
    float _1784 = fma(_1774, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1772);
    float _1786 = fma(_1756, _1688, _1780);
    float _1788 = float(uint(_1782));
    float _1790 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1792 = _1790 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1794 = _1356 != 3;
    float _1796 = fma(_1758, _1688, _1768);
    float _1798 = 1.0 / _1788;
    int _1800 = abs(_1778);
    float _1802 = fma(_1770, _1688, _1784);
    bool _1804 = !_1794;
    int _1806 = _1804 ? 0 : (-1);
    float _1808 = _1796 * 0.15915493667125701904296875;
    int _1810 = ~_1800;
    int _1812 = _1810 + 1;
    int _1814 = _1812 + 1;
    float _1816 = _1786 * 0.15915493667125701904296875;
    int _1818 = abs(_1806);
    float _1820 = 1.0 / _1792;
    int _1822 = abs(_1486);
    float _1824 = _1802 * 0.15915493667125701904296875;
    int _1826 = ~_1764;
    int _1828 = _1826 + 1;
    int _1830 = _1828 + 1;
    int _1832 = ~_1466;
    int _1834 = _1832 + _1534;
    int _1836 = _1834 + 1;
    int _1838 = abs(_1490);
    int _1840 = _1830 * as_type<int>(_1712);
    int _1842 = ~_1822;
    int _1844 = _1842 + 1;
    int _1846 = _1844 + 1;
    int _1848 = _1049 * _1836;
    int _1850 = _1848 + _1252;
    int _1852 = _1814 * as_type<int>(_1704);
    int _1854 = _1852 + _1840;
    float _1856 = float(uint(_1746));
    float _1858 = _1808 * 6.283185482025146484375;
    float _1860 = sin(_1858);
    int _1862 = _1846 * as_type<int>(_1734);
    int _1864 = _1862 + _1854;
    int _1866 = ~_1818;
    int _1868 = _1866 + 1;
    int _1870 = _1868 + 1;
    bool _1872 = _145 > 0.5;
    float _1874 = 1.0 / _1856;
    int _1876 = ~_1838;
    int _1878 = _1876 + 1;
    int _1880 = _1878 + 1;
    int _1882 = _1870 * as_type<int>(_1742);
    int _1884 = _1882 + _1864;
    bool _1886 = !_1069;
    int _1888 = _1886 ? _1850 : (-1);
    float _1890 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1892 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1890;
    bool _1894 = !_1542;
    float _1896 = _1894 ? (-0.5) : 0.5;
    int _1898 = _1884 * _1880;
    int _1900 = as_type<int>(_1798) + (-2);
    float _1902 = _1892 * _1820;
    float _1904 = _1816 * 6.283185482025146484375;
    float _1906 = cos(_1904);
    int _1908 = _1888 * _1838;
    int _1910 = _1908 + _1898;
    float _1912 = _1039 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1914 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1896);
    bool _1916 = !_1546;
    float _1918 = _1916 ? (-0.5) : 0.5;
    int _1920 = abs(_1910);
    float _1922 = _1912 * _1914;
    float _1924 = _1808 * 6.283185482025146484375;
    float _1926 = cos(_1924);
    int _1928 = as_type<int>(_1874) + (-2);
    float _1930 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1918);
    float _1932 = float(uint(_1910));
    float _1934 = float(uint(_1920));
    float _1936 = _1045 * _1930;
    int _1938 = ~_1782;
    int _1940 = _1938 + 1;
    float _1942 = _1816 * 6.283185482025146484375;
    float _1944 = sin(_1942);
    float _1946 = as_type<float>(_1928) * _1932;
    float _1948 = _1906 * _1860;
    float _1950 = as_type<float>(_1900) * _1934;
    int _1952 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1954 = _1952 != 0;
    int _1956 = ~_1782;
    int _1958 = _1956 + 1;
    float _1960 = _1824 * 6.283185482025146484375;
    float _1962 = sin(_1960);
    float _1964 = _1824 * 6.283185482025146484375;
    float _1966 = cos(_1964);
    float _1968 = _1944 * _1926;
    float _1970 = _1944 * _1860;
    float _1972 = trunc(_1946);
    float _1974 = precise::max(_1972, 0.0);
    uint _1976 = uint(_1974);
    float _1978 = -_1948;
    float _1980 = fma(_1962, _1968, _1978);
    float _1982 = -_1968;
    float _1984 = fma(_1962, _1948, _1982);
    int _1986 = ~_1746;
    int _1988 = _1986 + 1;
    float _1990 = trunc(_1950);
    float _1992 = precise::max(_1990, 0.0);
    uint _1994 = uint(_1992);
    float _1996 = _1860 * _1966;
    float _1998 = _1906 * _1926;
    float _2000 = _1926 * _1966;
    float _2002 = _1966 * _1936;
    float _2004 = -_1936;
    float _2006 = _1962 * _2004;
    float _2008 = fma(_1962, _1998, _1970);
    float _2010 = fma(_1962, _1970, _1998);
    int _2012 = _1988 * int(_1976);
    int _2014 = _2012 + _1910;
    float _2016 = _1906 * _2002;
    float _2018 = fma(_2000, _1922, _2006);
    float _2020 = _1944 * _2002;
    float _2022 = float(uint(_2014));
    float _2024 = fma(_2008, _1922, _2016);
    float _2026 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    int _2028 = _1940 * int(_1994);
    int _2030 = _2028 + _1920;
    float _2032 = fma(_1980, _1922, _2020);
    float _2034 = as_type<float>(_1928) * _2022;
    float _2036 = fma(_1984, _2026, _2024);
    float _2038 = fma(_1996, _2026, _2018);
    float _2040 = float(uint(_2030));
    float _2042 = trunc(_2034);
    float _2044 = precise::max(_2042, 0.0);
    uint _2046 = uint(_2044);
    float _2048 = fma(_2010, _2026, _2032);
    float _2050 = _2036 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2052 = _1676 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _2054 = as_type<float>(_1900) * _2040;
    float _2056 = _2036 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2058 = fma(_2038, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2050);
    float _2060 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2062 = _1031 + _2060;
    int _2064 = ~_1746;
    int _2066 = _2064 + 1;
    float _2068 = fma(_2038, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2056);
    float _2070 = trunc(_2054);
    float _2072 = precise::max(_2070, 0.0);
    uint _2074 = uint(_2072);
    float _2076 = fma(_2048, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2058);
    float _2078 = _1692 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _2080 = fma(_2048, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2068);
    float _2082 = fma(_1902, _2062, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _2084 = _2076 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    int _2086 = int(_1976) + int(_2046);
    float _2088 = _2080 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2090 = -_1896;
    int _2092 = _1872 ? as_type<int>(_2090) : as_type<int>(_1896);
    float _2094 = _2052 + _2084;
    float _2096 = _2036 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2098 = _2078 + _2088;
    bool _2100 = !_1954;
    float _2102 = _2100 ? _1896 : as_type<float>(_2092);
    float _2104 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2106 = _2094 + _2104;
    bool _2108 = _1031 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2110 = isnan(_1031);
    bool _2112 = _2108 || _2110;
    bool _2114 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2116 = _2112 || _2114;
    float _2118 = float(_2116);
    float _2120 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2122 = _2098 + _2120;
    int _2124 = int(_1994) + int(_2074);
    float _2126 = _2106 * _2106;
    bool _2128 = _1031 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2130 = isnan(_1031);
    bool _2132 = _2128 || _2130;
    bool _2134 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2136 = _2132 || _2134;
    float _2138 = float(_2136);
    float _2140 = _2122 * _2122;
    float _2142 = -_2118;
    float _2144 = _2142 + 1.0;
    int _2146 = _2066 * _2086;
    int _2148 = _2146 + _1910;
    float _2150 = fma(_2038, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2096);
    float _2152 = _2126 + _2140;
    int _2154 = _1958 * _2124;
    int _2156 = _2154 + _1920;
    float _2158 = _2138 * _2144;
    bool _2160 = uint(_2148) >= uint(_1746);
    float _2162 = sqrt(_2152);
    int _2164 = _1910 ^ _1746;
    float _2166 = _2082 * _2158;
    bool _2168 = uint(_2156) >= uint(_1782);
    float _2170 = fma(_2048, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2150);
    bool _2172 = !_2160;
    int _2174 = _2172 ? 0 : (-1);
    bool _2176 = !_2168;
    int _2178 = _2176 ? 0 : (-1);
    float _2180 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    uint _2182 = uint(int(uint(_2164) >> uint(31)));
    float _2184 = _2170 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    int _2186 = ~_2086;
    int _2188 = _2186 + _2174;
    int _2190 = _2188 + 1;
    int _2192 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2194 = _2192 != 0;
    int _2196 = ~_2178;
    int _2198 = _2124 + _2196;
    int _2200 = _2198 + 1;
    float _2202 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _2204 = _2162 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _2206 = _1746 * _2190;
    int _2208 = _2206 + _1910;
    int _2210 = ~int(_2182);
    int _2212 = _2210 + 1;
    float _2214 = _1682 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _2216 = _1746 == 0;
    bool _2218 = _1746 == 0;
    float _2220 = _2214 + _2184;
    int _2222 = _2200 ^ _2212;
    float _2224 = _2180 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2226 = -_1918;
    int _2228 = _1718 ? as_type<int>(_2226) : as_type<int>(_1918);
    bool _2230 = !_2216;
    int _2232 = _2230 ? _2208 : (-1);
    int _2234 = ~_2212;
    int _2236 = _2234 + _2222;
    int _2238 = _2236 + 1;
    float _2240 = as_type<float>(_2212);
    float _2242 = as_type<float>(_1910);
    float _2244 = _2094;
    float _2246 = _2126;
    float _2248 = _2140;
    float _2250 = _2102;
    float _2252 = _2078;
    if (!_2204)
    {
        _2240 = _2094;
    }
    float _2254 = _2240;
    bool _2256 = !_2194;
    float _2258 = _2256 ? _1918 : as_type<float>(_2228);
    float _2260 = _2254;
    float _2262 = _2258;
    if (!_2204)
    {
        _2242 = _2098;
    }
    float _2264 = _2242;
    float _2266 = float(_2232);
    float _2268 = _2264;
    if (!_2204)
    {
        _2244 = _2220;
    }
    float _2270 = _2244;
    bool _2272 = !_2204;
    float _2274 = _2270;
    if (!_2272)
    {
        float _2276 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2278 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2280 = _2162 + _2278;
        float _2282 = rsqrt(_2152);
        float _2284 = _2280 * _2276;
        float _2286 = _2220 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2288 = _2284 * 0.15915493667125701904296875;
        float _2290 = _2288 * 6.283185482025146484375;
        float _2292 = sin(_2290);
        float _2294 = _2288 * 6.283185482025146484375;
        float _2296 = cos(_2294);
        float _2298 = fma(_2292, _2286, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2300 = _2282 * _2298;
        float _2302 = fma(_2106, _2300, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2304 = _2296 + (-1.0);
        float _2306 = fma(_2122, _2300, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2308 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _2310 = _2302 + _2308;
        float _2312 = _2304 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2314 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _2316 = _2306 + _2314;
        float _2318 = _2310 * _2310;
        float _2320 = fma(_2220, _2296, _2312);
        float _2322 = _2316 * _2316;
        _2274 = _2320;
        _2246 = _2318;
        _2248 = _2322;
        _2260 = _2302;
        _2268 = _2306;
    }
    float _2324 = _2274;
    float _2326 = _2246;
    float _2328 = _2248;
    float _2330 = _2260;
    float _2332 = _2268;
    float _2334 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _2336 = _2324 + _2334;
    bool _2338 = !_2218;
    int _2340 = _2338 ? _2238 : (-1);
    float _2342 = -_2138;
    float _2344 = _2342 + 1.0;
    float _2346 = fma(_2224, _2266, _1650);
    float _2348 = fma(_2336, _2336, _2326);
    float _2350 = _2102 + 0.5;
    float _2352 = float(_2340);
    float _2354 = _2202 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2356 = _2348 + _2328;
    float _2358 = fma(_2344, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2166);
    float _2360 = fma(_2224, _2350, _2346);
    float _2362 = -_1666;
    float _2364 = _2362 + 1.0;
    float _2366 = -_1674;
    float _2368 = fma(_2354, _2352, _2366);
    float _2370 = _2258 + (-0.5);
    float _2372 = fma(_2118, (*spvDescriptorSet0.vp_c9)._m0[132].x, _2358);
    float _2374 = _993 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2376 = sqrt(_2356);
    float _2378 = -_2364;
    float _2380 = fma(_2102, _2378, _2360);
    float _2382 = _995 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2384 = -_2354;
    float _2386 = fma(_2384, _2370, _2368);
    float _2388 = _997 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2390 = -_1670;
    float _2392 = _2390 + 1.0;
    float _2394 = _2374 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2396 = _2382 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2398 = _2388 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2400 = _2372 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2402 = fma(_2258, _2392, _2386);
    out.m_64.x = _2394;
    out.m_64.y = _2396;
    out.m_64.z = _2398;
    out.m_64.w = _2400;
    bool _2404 = _2376 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2406 = isnan(_2376);
    bool _2408 = _2404 || _2406;
    bool _2410 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2412 = _2408 || _2410;
    out.m_66.x = _2380;
    out.m_66.y = _2402;
    float _2414 = _2380;
    if (!_2412)
    {
        _2250 = 1.0;
    }
    float _2416 = _2250;
    bool _2418 = !_2412;
    float _2420 = _2416;
    if (!_2418)
    {
        bool _2422 = _2376 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2424 = isnan(_2376);
        bool _2426 = _2422 || _2424;
        bool _2428 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2430 = _2426 || _2428;
        if (!_2430)
        {
            float _2432 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2434 = _2376 + _2432;
            float _2436 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2438 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2436;
            float _2440 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2442 = _2440 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2444 = 1.0 / _2438;
            float _2446 = _2434 * _2444;
            float _2448 = fma(_2446, _2442, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2420 = _2448;
            _2262 = _2438;
            _2450 = true;
        }
        else
        {
            bool _2452 = _2376 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2454 = isnan(_2376);
            bool _2456 = _2452 || _2454;
            bool _2458 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2460 = _2456 || _2458;
            if (!_2460)
            {
                float _2462 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2464 = _2376 + _2462;
                float _2466 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2468 = _2466 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2470 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2472 = _2470 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2474 = 1.0 / _2468;
                float _2476 = _2464 * _2474;
                float _2478 = fma(_2476, _2472, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2420 = _2478;
                _2262 = _2468;
                _2450 = true;
            }
            else
            {
                _2420 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2450 = false;
    float _2480 = _2420;
    float _2482 = _2262;
    float _2484 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2486 = _2324 + _2484;
    float _2488 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2490 = _2330 + _2488;
    float _2492 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2494 = _2332 + _2492;
    float _2496 = fma(_2486, _2480, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2498 = fma(_2490, _2480, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2500 = fma(_2494, _2480, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2502 = -_2214;
    float _2504 = _2502 + _2496;
    float _2506 = -_2052;
    float _2508 = _2506 + _2498;
    float _2510 = -_2078;
    float _2512 = _2510 + _2500;
    float _2514 = _2504 * _2504;
    float _2516 = fma(_2508, _2508, _2514);
    float _2518 = fma(_2512, _2512, _2516);
    float _2520 = sqrt(_2518);
    bool _2522 = _2520 > 0.0;
    bool _2524 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2526 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2528 = _2524 || _2526;
    bool _2530 = isnan(0.5);
    bool _2532 = _2528 || _2530;
    float _2534 = _2490;
    float _2536 = _2482;
    float _2538 = _2494;
    float _2540 = _2498;
    float _2542 = _2496;
    if (!_2522)
    {
        _2534 = _2498;
    }
    float _2544 = _2534;
    float _2546 = _2544;
    float _2548 = _2544;
    if (!_2522)
    {
        _2536 = _2496;
    }
    float _2550 = _2536;
    float _2552 = _2550;
    float _2554 = _2550;
    if (!_2522)
    {
        _2538 = _2500;
    }
    float _2556 = _2538;
    bool _2558 = !_2522;
    float _2560 = _2556;
    if (!_2558)
    {
        float _2562 = _301 * _301;
        float _2564 = fma(_215, _215, _2562);
        float _2566 = fma(_291, _291, _2564);
        float _2568 = rsqrt(_2518);
        float _2570 = sqrt(_2566);
        float _2572 = _2508 * _2568;
        float _2574 = _2504 * _2568;
        float _2576 = _2512 * _2568;
        bool _2578 = _2570 > 0.0;
        float _2580 = _2570;
        if (!_2578)
        {
            _2546 = _2498;
        }
        float _2582 = _2546;
        _2548 = _2582;
        if (!_2578)
        {
            _2552 = _2496;
        }
        float _2584 = _2552;
        _2554 = _2584;
        if (!_2578)
        {
            _2580 = _2500;
        }
        float _2586 = _2580;
        bool _2588 = !_2578;
        _2560 = _2586;
        if (!_2588)
        {
            float _2590 = rsqrt(_2566);
            float _2592 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _2594 = _301 * _2590;
            float _2596 = _215 * _2590;
            float _2598 = _2574 * _2594;
            float _2600 = _291 * _2590;
            float _2602 = fma(_2572, _2596, _2598);
            float _2604 = _2592 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2606 = fma(_2576, _2600, _2602);
            float _2608 = _2606 * _2604;
            float _2610 = fma(_215, _2608, _2498);
            float _2612 = fma(_301, _2608, _2496);
            float _2614 = fma(_291, _2608, _2500);
            _2548 = _2610;
            _2554 = _2612;
            _2560 = _2614;
        }
    }
    float _2616 = _2548;
    float _2618 = _2554;
    float _2620 = _2560;
    float _2622 = _2618;
    float _2624 = _2620;
    if (_2532)
    {
        _311 = _2616;
    }
    float _2626 = _311;
    float _2628 = _2626;
    if (!_2532)
    {
        float _2630 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2632 = _2214 + _2630;
        float _2634 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2636 = _2052 + _2634;
        float _2638 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2640 = _2632 * _2632;
        float _2642 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2644 = _2078 + _2642;
        float _2646 = fma(_2636, _2636, _2640);
        float _2648 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2650 = fma(_2644, _2644, _2646);
        float _2652 = sqrt(_2650);
        float _2654 = _2638 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2656 = precise::min(_2652, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2658 = _2656 * _2648;
        float _2660 = -_2052;
        float _2662 = _2660 + _2616;
        float _2664 = -_2214;
        float _2666 = _2664 + _2618;
        float _2668 = _2654 * _2658;
        float _2670 = -_2078;
        float _2672 = _2670 + _2620;
        float _2674 = fma(_2662, _2668, _2052);
        float _2676 = fma(_2666, _2668, _2214);
        float _2678 = fma(_2672, _2668, _2078);
        _2622 = _2676;
        _2628 = _2674;
        _2624 = _2678;
        _2540 = _2648;
    }
    float _2680 = _2622;
    float _2682 = _2628;
    float _2684 = _2624;
    float _2686 = _2540;
    float _2688 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2690 = _2680 + _2688;
    float _2692 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2694 = _2682 + _2692;
    float _2696 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2698 = _2684 + _2696;
    float _2700 = _2690 * _2690;
    float _2702 = fma(_2694, _2694, _2700);
    float _2704 = fma(_2698, _2698, _2702);
    float _2706 = rsqrt(_2704);
    float _2708 = sqrt(_2704);
    float _2710 = _2706 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2712 = _2694 * _2710;
    float _2714 = _2698 * _2710;
    float _2716 = _2712 * _2712;
    float _2718 = _2714 * _2714;
    float _2720 = _2716 + _2718;
    float _2722 = sqrt(_2720);
    bool _2724 = _2722 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2726 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2728 = _2722 + _2726;
    float _2730 = _2698;
    float _2732 = _2700;
    float _2734 = _2728;
    float _2736 = _2710;
    if (_2724)
    {
        float _2738 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2730 = _2738;
    }
    float _2740 = _2730;
    if (_2724)
    {
        float _2742 = rsqrt(_2720);
        _2732 = _2742;
    }
    float _2744 = _2732;
    float _2746 = _2744;
    if (_2724)
    {
        float _2748 = _2728 * _2740;
        _2734 = _2748;
    }
    float _2750 = _2734;
    if (_2724)
    {
        float _2752 = _2750 * 0.15915493667125701904296875;
        _2542 = _2752;
    }
    float _2754 = _2542;
    float _2756 = _2706;
    float _2758 = _2754;
    if (_2724)
    {
        float _2760 = _2754 * 6.283185482025146484375;
        float _2762 = sin(_2760);
        _2756 = _2762;
    }
    float _2764 = _2756;
    float _2766 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2768 = precise::max(0.0, _2766);
    float _2770 = _2686;
    float _2772 = _2768;
    float _2774 = _2766;
    if (_2724)
    {
        float _2776 = _2754 * 6.283185482025146484375;
        float _2778 = cos(_2776);
        _2770 = _2778;
    }
    float _2780 = _2770;
    float _2782 = -_2710;
    float _2784 = -_2768;
    float _2786 = fma(_2690, _2782, _2784);
    if (_2724)
    {
        float _2788 = _2786 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2772 = _2788;
    }
    float _2790 = _2772;
    float _2792 = _2790;
    if (!_2724)
    {
        _2758 = _2716;
    }
    float _2794 = _2758;
    float _2796 = _2764;
    float _2798 = _2794;
    if (_2724)
    {
        float _2800 = fma(_2764, _2790, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2796 = _2800;
    }
    float _2802 = _2796;
    float _2804 = _2802;
    if (!_2724)
    {
        _2792 = _2714;
    }
    float _2806 = _2792;
    float _2808 = _2806;
    if (_2724)
    {
        float _2810 = _2780 + (-1.0);
        _2774 = _2810;
    }
    float _2812 = _2774;
    float _2814 = _2812;
    if (_2724)
    {
        float _2816 = _2744 * _2802;
        _2414 = _2816;
    }
    float _2818 = _2414;
    if (!_2724)
    {
        _2746 = _2712;
    }
    float _2820 = _2746;
    float _2822 = _2820;
    if (_2724)
    {
        float _2824 = _2812 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2736 = _2824;
    }
    float _2826 = _2736;
    if (_2724)
    {
        float _2828 = _2712 * _2818;
        _2822 = _2828;
    }
    float _2830 = _2822;
    if (!_2724)
    {
        _2804 = _2786;
    }
    float _2832 = _2804;
    float _2834 = _2832;
    if (_2724)
    {
        float _2836 = _2714 * _2818;
        _2808 = _2836;
    }
    float _2838 = _2808;
    if (_2724)
    {
        float _2840 = fma(_2786, _2780, _2826);
        _2834 = _2840;
    }
    float _2842 = _2834;
    if (_2724)
    {
        float _2844 = _2830 * _2830;
        _2798 = _2844;
    }
    float _2846 = _2798;
    if (!_2724)
    {
        _2814 = _2718;
    }
    float _2848 = _2814;
    float _2850 = _2848;
    if (_2724)
    {
        float _2852 = _2838 * _2838;
        _2850 = _2852;
    }
    float _2854 = _2850;
    float _2856 = _2680 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2858 = fma(_2842, _2842, _2846);
    float _2860 = _2680 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2862 = fma(_2682, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2856);
    float _2864 = _2858 + _2854;
    float _2866 = _2680 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2868 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2870 = fma(_2708, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2868);
    float _2872 = precise::clamp(_2870, 0.0, 1.0);
    float _2874 = fma(_2684, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2862);
    float _2876 = rsqrt(_2864);
    float _2878 = _2680 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2880 = -_2872;
    float _2882 = _2880 + 1.0;
    float _2884 = fma(_2682, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2866);
    float _2886 = _2874 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2888 = fma(_2682, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2860);
    float _2890 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2892 = fma(_2684, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2884);
    float _2894 = abs(_2882);
    float _2896 = log2(_2894);
    float _2898 = _2886 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2900 = fma(_2682, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2878);
    float _2902 = fma(_2684, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2888);
    float _2904 = _2892 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2906 = -_2898;
    float _2908 = fma(_2906, _2890, 1.0);
    float _2910 = fma(_2684, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2900);
    float _2912 = _2902 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2914 = _2876 * _2830;
    float _2916 = _2904 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2918 = _2876 * _2842;
    float _2920 = _2876 * _2838;
    float _2922 = _2914 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2924 = fma(_2912, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2916);
    float _2926 = _2910 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2928 = log2(_2908);
    float _2930 = _2896 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2932 = -_2922;
    float _2934 = fma(_2918, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2932);
    float _2936 = fma(_2886, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2924);
    float _2938 = _2904 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2940 = -_2920;
    float _2942 = fma(_2940, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2934);
    float _2944 = fma(_2926, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2936);
    float _2946 = exp2(_2930);
    float _2948 = _2904 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2950 = fma(_2942, -0.5, 0.5);
    float _2952 = fma(_2912, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2938);
    float _2954 = fma(_2942, 0.5, 0.5);
    float _2956 = fma(_2912, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2948);
    float _2958 = _2918 + 1.0;
    float _2960 = fma(_2886, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2952);
    float _2962 = 1.0 / _2944;
    float _2964 = fma(_2954, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2966 = fma(_2886, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2956);
    float _2968 = _2928 * 0.693147182464599609375;
    float _2970 = fma(_2954, _2964, -0.212114393711090087890625);
    float _2972 = fma(_2926, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2966);
    float _2974 = _2968 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2976 = sqrt(_2950);
    float _2978 = -_2918;
    float _2980 = fma(_2946, _2958, _2978);
    float _2982 = fma(_2926, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2960);
    float _2984 = fma(_2954, _2970, 1.570728778839111328125);
    float _2986 = fma(_2980, 0.5, 0.5);
    float _2988 = _2982 * _2962;
    float _2990 = _2972 * _2962;
    float _2992 = fma(_2988, 0.5, 0.5);
    float _2994 = fma(_2990, -0.5, 0.5);
    float _2996 = _2976 * 0.636619746685028076171875;
    float3 _7647 = float3(_2992, _2994, _2974);
    float _2998 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7647, float3(0.0), isnan(_7647)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7647, float3(0.0), isnan(_7647)), level(0.0)).x;
    float3 _7658 = float3(_2992, _2994, _2974);
    float4 _3001 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7658, float3(0.0), isnan(_7658)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7658, float3(0.0), isnan(_7658)), level(0.0)).xyzw;
    float _3003 = _3001.x;
    float _3005 = _3001.y;
    float _3007 = _3001.z;
    float _3009 = _3001.w;
    float _3011 = -_2984;
    float _3013 = fma(_2996, _3011, 1.0);
    float2 _7680 = float2(_3013, _2986);
    float3 _3017 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7680, float2(0.0), isnan(_7680)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7680, float2(0.0), isnan(_7680)), level(0.0)).xyz;
    float _3019 = _3017.x;
    float _3021 = _3017.y;
    float _3023 = _3017.z;
    float _3025 = _2214 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _3027 = fma(_2052, (*spvDescriptorSet0.vp_c8)._m0[11].x, _3025);
    float _3029 = _2214 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _3031 = fma(_2078, (*spvDescriptorSet0.vp_c8)._m0[11].z, _3027);
    float _3033 = fma(_2052, (*spvDescriptorSet0.vp_c8)._m0[10].x, _3029);
    bool _3035 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _3037 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _3039 = _3035 || _3037;
    bool _3041 = isnan(0.5);
    bool _3043 = _3039 || _3041;
    float _3045 = _3031 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _3047 = fma(_2078, (*spvDescriptorSet0.vp_c8)._m0[10].z, _3033);
    float _3049 = 1.0 / _3045;
    float _3051 = _3047 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _3053 = _3051 + _3045;
    float _3055 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _3057 = _3031;
    if (!_3043)
    {
        _2252 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    }
    float _3059 = _2252;
    float _3061 = _2896 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3063 = exp2(_3061);
    float _3065 = _3053 * _3049;
    float _3067 = _3065 * 0.5;
    float _3069 = _3049;
    float _3071 = _3067;
    if (!_3043)
    {
        _3069 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _3073 = _3069;
    float _3075 = _3073;
    if (!_3043)
    {
        float _3077 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _3079 = fma(_3067, _3059, _3077);
        _3055 = _3079;
    }
    float _3081 = _3055;
    float _3083 = _2904 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    if (!_3043)
    {
        float _3085 = -_3073;
        float _3087 = _3085 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _3057 = _3087;
    }
    float _3089 = _3057;
    if (_3043)
    {
        _3071 = 1.0;
    }
    float _3091 = _3071;
    float _3093 = fma(_2912, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3083);
    float _3095 = _3081;
    float _3097 = _3091;
    if (!_3043)
    {
        float _3099 = 1.0 / _3081;
        _3095 = _3099;
    }
    float _3101 = _3095;
    float _3103 = fma(_2886, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3093);
    float _3105 = -_3063;
    float _3107 = _3105 + 1.0;
    float _3109 = fma(_2926, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3103);
    float _3111 = _3089;
    if (!_3043)
    {
        float _3113 = 1.0 / _3089;
        _3111 = _3113;
    }
    float _3115 = _3111;
    float _3117 = _3107 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3119 = _3109 + _2944;
    out.gl_Position.x = _2982;
    out.gl_Position.y = _2972;
    out.gl_Position.z = _3109;
    out.gl_Position.w = _2944;
    if (!_3043)
    {
        float _3121 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _3123 = -_3073;
        float _3125 = fma(_3101, _3121, _3123);
        _3075 = _3125;
    }
    float _3127 = _3075;
    float _3129 = _3119 * 0.5;
    if (!_3043)
    {
        float _3131 = _3127 * _3115;
        float _3133 = precise::clamp(_3131, 0.0, 1.0);
        _3097 = _3133;
    }
    float _3135 = _3097;
    float _3137 = _3135 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _3139 = _3135 > 0.0;
    bool _3141 = isnan(_3135);
    bool _3143 = _3139 || _3141;
    bool _3145 = isnan(0.0);
    bool _3147 = _3143 || _3145;
    out.m_68.z = _3129;
    out.m_68.w = _2944;
    float _3149 = _3137 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_47.x = _3149;
    float _3151 = _3117 * _2998;
    float _3153 = -_3117;
    float _3155 = _3153 + 1.0;
    float _3157 = _3009 * _3151;
    float _3159 = _3023 * _3151;
    float _3161 = fma(_3019, _3157, _3003);
    float _3163 = fma(_3021, _3157, _3005);
    float _3165 = _3009 * _3155;
    float _3167 = fma(_3009, _3159, _3007);
    out.m_70.x = _3161;
    out.m_70.y = _3163;
    out.m_70.z = _3167;
    out.m_70.w = _3165;
    if (_3147)
    {
        return out;
    }
    out.m_47.x = 0.0;
    float _3169 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3169;
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
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2450 = false;
    bool _1021 = false;
    bool _797 = false;
    bool _695 = false;
    bool _521 = false;
    bool _329 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _84 = in.m_44.w;
    float _86 = trunc(_84);
    int _89 = int(_86);
    bool _93 = _89 >= 1;
    float _95 = 0.0;
    if (!_93)
    {
        _95 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _97 = _95;
    float _99 = _97;
    if (!_93)
    {
        out.m_47.x = 0.0;
    }
    int _101 = 0;
    if (!_93)
    {
        float _103 = _97 * 5.0;
        _101 = as_type<int>(_103);
    }
    int _105 = _101;
    int _107 = _105;
    if (!_93)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3226 = as_type<float>(_105);
        out.gl_Position.z = _3226;
    }
    if (!_93)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _109 = in.m_49.w;
    bool _111 = _109 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _113 = isnan(_109);
    bool _115 = _111 || _113;
    bool _117 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _119 = _115 || _117;
    float _121 = -_109;
    float _123 = _121 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _125 = 0.0;
    float _127 = _123;
    if (_119)
    {
        float _129 = float(_89);
        _125 = _129;
    }
    float _131 = _125;
    bool _133 = _123 >= _131;
    bool _135 = !_119;
    bool _137 = _133 || _135;
    if (_137)
    {
        _99 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _139 = _99;
    if (_137)
    {
        out.m_47.x = 0.0;
    }
    if (_137)
    {
        float _141 = _139 * 5.0;
        _107 = as_type<int>(_141);
    }
    int _143 = _107;
    if (_137)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3295 = as_type<float>(_143);
        out.gl_Position.z = _3295;
    }
    if (_137)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _145 = in.m_51.x;
    float _147 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _149 = _123 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _151 = in.m_53.x;
    float _153 = in.m_53.y;
    float _155 = in.m_53.z;
    float _157 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].w;
    float _159 = _149 * _147;
    float _161 = _123 + (*spvDescriptorSet0.vp_c9)._m0[20].w;
    float _163 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[20].x, _159);
    float _165 = _161 * _157;
    float _167 = floor(_163);
    float _169 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[20].y, _165);
    float _171 = _163 * 6.283185482025146484375;
    float _173 = _153 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _175 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _177 = _175 != 0;
    float _179 = _153 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _181 = floor(_169);
    float _183 = _171 * 0.15915493667125701904296875;
    float _185 = _153 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _187 = fma(_151, (*spvDescriptorSet0.vp_c10)._m0[4].x, _179);
    float _189 = _169 * 6.283185482025146484375;
    int _191 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _193 = _191 != 0;
    int _195 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _197 = _195 != 0;
    float _199 = fma(_151, (*spvDescriptorSet0.vp_c10)._m0[5].x, _173);
    float _201 = fma(_151, (*spvDescriptorSet0.vp_c10)._m0[6].x, _185);
    float _203 = _183 * 6.283185482025146484375;
    float _205 = cos(_203);
    float _207 = -_167;
    float _209 = _163 + _207;
    bool _211 = !_193;
    int _213 = _211 ? 0 : 1;
    float _215 = fma(_155, (*spvDescriptorSet0.vp_c10)._m0[4].z, _187);
    int _217 = abs(_213);
    float _219 = -_181;
    float _221 = _169 + _219;
    float _223 = _189 * 0.15915493667125701904296875;
    bool _225 = !_177;
    int _227 = _225 ? 0 : 1;
    float _229 = -_209;
    float _231 = fma(_229, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _233 = -_221;
    float _235 = fma(_233, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    int _237 = abs(_227);
    float _239 = _223 * 6.283185482025146484375;
    float _241 = cos(_239);
    float _243 = float(_217);
    float _245 = fma(_205, 0.5, 0.5);
    bool _247 = _209 < 0.5;
    float _249 = float(_247);
    bool _251 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _253 = abs(_231);
    float _255 = _243 * _253;
    bool _257 = !_197;
    int _259 = _257 ? 0 : 1;
    float _261 = abs(_235);
    float _263 = _243 * _261;
    float _265 = float(_237);
    float _267 = -_249;
    float _269 = fma(_267, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _271 = abs(_259);
    float _273 = -_245;
    float _275 = fma(_273, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _277 = _221 < 0.5;
    float _279 = float(_277);
    float _281 = float(_271);
    float _283 = fma(_241, 0.5, 0.5);
    float _285 = fma(_265, _275, _255);
    float _287 = -_279;
    float _289 = fma(_287, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    float _291 = fma(_155, (*spvDescriptorSet0.vp_c10)._m0[6].z, _201);
    float _293 = -_283;
    float _295 = fma(_293, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    float _297 = abs(_269);
    float _299 = fma(_281, _297, _285);
    float _301 = fma(_155, (*spvDescriptorSet0.vp_c10)._m0[5].z, _199);
    float _303 = fma(_265, _295, _263);
    float _305 = abs(_289);
    float _307 = fma(_281, _305, _303);
    bool _309 = !_251;
    float _311 = _215;
    float _327;
    if (!_309)
    {
        float _313 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _315 = _145 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _317 = fma(_315, (*spvDescriptorSet0.vp_c9)._m0[12].x, _123);
        float _319 = _317 * _313;
        float _321 = floor(_319);
        float _323 = -_321;
        float _325 = _319 + _323;
        _327 = _325;
        _329 = true;
    }
    else
    {
        float _331 = float(_89);
        float _333 = 1.0 / _331;
        float _335 = _123 * _333;
        _327 = _335;
    }
    _329 = false;
    float _337 = _327;
    float _339 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _341 = _337 + _339;
    float _343 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _345 = _337 + _343;
    bool _347 = _337 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _349 = isnan(_337);
    bool _351 = _347 || _349;
    bool _353 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _355 = _351 || _353;
    float _357 = float(_355);
    float _359 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _361 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _359;
    float _363 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _365 = _363 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _367 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _369 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _367;
    float _371 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _373 = _337 + _371;
    bool _375 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _377 = 1.0 / _365;
    float _379 = 1.0 / _361;
    float _381 = 1.0 / _369;
    float _383 = _373 * _377;
    bool _385 = _337 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _387 = isnan(_337);
    bool _389 = _385 || _387;
    bool _391 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _393 = _389 || _391;
    float _395 = float(_393);
    float _397 = _341 * _379;
    bool _399 = _337 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _401 = isnan(_337);
    bool _403 = _399 || _401;
    bool _405 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _407 = _403 || _405;
    float _409 = float(_407);
    float _411 = -_357;
    float _413 = _411 + 1.0;
    bool _415 = _337 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _417 = isnan(_337);
    bool _419 = _415 || _417;
    bool _421 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _423 = _419 || _421;
    float _425 = float(_423);
    float _427 = _409 * _413;
    float _429 = _345 * _381;
    float _431 = -_409;
    float _433 = _431 + 1.0;
    float _435 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _437 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _435;
    float _439 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _441 = _439 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _443 = _425 * _433;
    float _445 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _447 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _445;
    float _449 = -_425;
    float _451 = _449 + 1.0;
    float _453 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _455 = _453 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _457 = fma(_437, _397, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _459 = fma(_447, _397, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _461 = _395 * _451;
    float _463 = fma(_455, _383, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _465 = fma(_441, _383, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _467 = -_395;
    float _469 = _467 + 1.0;
    float _471 = _459 * _461;
    float _473 = _457 * _461;
    float _475 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _477 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _475;
    float _479 = fma(_469, (*spvDescriptorSet0.vp_c9)._m0[143].x, _471);
    float _481 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _483 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _481;
    float _485 = fma(_469, (*spvDescriptorSet0.vp_c9)._m0[143].y, _473);
    float _487 = fma(_477, _429, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _489 = fma(_463, _443, _479);
    float _491 = fma(_483, _429, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _493 = fma(_465, _443, _485);
    float _495 = fma(_487, _427, _489);
    float _497 = fma(_491, _427, _493);
    float _499 = fma(_357, (*spvDescriptorSet0.vp_c9)._m0[146].x, _495);
    float _501 = fma(_357, (*spvDescriptorSet0.vp_c9)._m0[146].y, _497);
    bool _503 = !_375;
    float _519;
    if (!_503)
    {
        float _505 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _507 = _145 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _509 = fma(_507, (*spvDescriptorSet0.vp_c9)._m0[11].x, _123);
        float _511 = _509 * _505;
        float _513 = floor(_511);
        float _515 = -_513;
        float _517 = _511 + _515;
        _519 = _517;
        _521 = true;
    }
    else
    {
        float _523 = float(_89);
        float _525 = 1.0 / _523;
        float _527 = _123 * _525;
        _519 = _527;
    }
    _521 = false;
    float _529 = _519;
    float _531 = in.m_55.x;
    float _533 = in.m_55.y;
    float _535 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _537 = _529 + _535;
    bool _539 = _529 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _541 = isnan(_529);
    bool _543 = _539 || _541;
    bool _545 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _547 = _543 || _545;
    float _549 = float(_547);
    float _551 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _553 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _551;
    float _555 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _557 = _555 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _559 = -_549;
    float _561 = _559 + 1.0;
    float _563 = 1.0 / _553;
    bool _565 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _567 = 1.0 / _557;
    float _569 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _571 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _569;
    float _573 = _501 * _533;
    float _575 = _537 * _563;
    float _577 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _579 = _529 + _577;
    bool _581 = _529 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _583 = isnan(_529);
    bool _585 = _581 || _583;
    bool _587 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _589 = _585 || _587;
    float _591 = float(_589);
    float _593 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _595 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _593;
    bool _597 = _529 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _599 = isnan(_529);
    bool _601 = _597 || _599;
    bool _603 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _605 = _601 || _603;
    float _607 = float(_605);
    float _609 = fma(_571, _575, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _611 = _499 * _531;
    float _613 = fma(_595, _575, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _615 = _579 * _567;
    float _617 = _607 * _561;
    float _619 = -_607;
    float _621 = _619 + 1.0;
    float _623 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _625 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _623;
    float _627 = _591 * _621;
    float _629 = fma(_625, _575, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _631 = -_591;
    float _633 = _631 + 1.0;
    float _635 = _609 * _627;
    float _637 = _629 * _627;
    float _639 = _613 * _627;
    float _641 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _643 = _641 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _645 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _647 = _645 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _649 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _651 = _649 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _653 = fma(_633, (*spvDescriptorSet0.vp_c9)._m0[107].x, _637);
    float _655 = fma(_633, (*spvDescriptorSet0.vp_c9)._m0[107].y, _635);
    float _657 = fma(_643, _615, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _659 = fma(_647, _615, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _661 = fma(_651, _615, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _663 = fma(_633, (*spvDescriptorSet0.vp_c9)._m0[107].z, _639);
    float _665 = fma(_657, _617, _653);
    float _667 = fma(_659, _617, _655);
    float _669 = fma(_661, _617, _663);
    float _671 = fma(_549, (*spvDescriptorSet0.vp_c9)._m0[109].x, _665);
    float _673 = fma(_549, (*spvDescriptorSet0.vp_c9)._m0[109].y, _667);
    float _675 = fma(_549, (*spvDescriptorSet0.vp_c9)._m0[109].z, _669);
    bool _677 = !_565;
    float _693;
    if (!_677)
    {
        float _679 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _681 = _145 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _683 = fma(_681, (*spvDescriptorSet0.vp_c9)._m0[11].y, _123);
        float _685 = _683 * _679;
        float _687 = floor(_685);
        float _689 = -_687;
        float _691 = _685 + _689;
        _693 = _691;
        _695 = true;
    }
    else
    {
        float _697 = float(_89);
        float _699 = 1.0 / _697;
        float _701 = _123 * _699;
        _693 = _701;
    }
    _695 = false;
    float _703 = _693;
    float _705 = _671 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _707 = _673 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    bool _709 = _703 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _711 = isnan(_703);
    bool _713 = _709 || _711;
    bool _715 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _717 = _713 || _715;
    float _719 = float(_717);
    float _721 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _723 = _721 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _725 = _703 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _727 = isnan(_703);
    bool _729 = _725 || _727;
    bool _731 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _733 = _729 || _731;
    float _735 = float(_733);
    float _737 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _739 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _737;
    float _741 = _675 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _743 = 1.0 / _723;
    float _745 = -_719;
    float _747 = _745 + 1.0;
    float _749 = _705 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _751 = _707 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _753 = _741 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _755 = _735 * _747;
    float _757 = -_735;
    float _759 = _757 + 1.0;
    bool _761 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _763 = _739 * _743;
    float _765 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _767 = _703 + _765;
    float _769 = fma(_763, _767, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _771 = _769 * _755;
    float _773 = fma(_759, (*spvDescriptorSet0.vp_c9)._m0[115].x, _771);
    float _775 = fma(_719, (*spvDescriptorSet0.vp_c9)._m0[116].x, _773);
    float _777 = _775 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_57.x = _749;
    out.m_57.y = _751;
    out.m_57.z = _753;
    out.m_57.w = _777;
    bool _779 = !_761;
    float _795;
    if (!_779)
    {
        float _781 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _783 = _145 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _785 = fma(_783, (*spvDescriptorSet0.vp_c9)._m0[11].z, _123);
        float _787 = _785 * _781;
        float _789 = floor(_787);
        float _791 = -_789;
        float _793 = _787 + _791;
        _795 = _793;
        _797 = true;
    }
    else
    {
        float _799 = float(_89);
        float _801 = 1.0 / _799;
        float _803 = _123 * _801;
        _795 = _803;
    }
    _797 = false;
    float _805 = _795;
    float _807 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _809 = _805 + _807;
    float _811 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _813 = _805 + _811;
    float _815 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _817 = _805 + _815;
    float _819 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _821 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _819;
    float _823 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _825 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _823;
    float _827 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _829 = _827 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _831 = 1.0 / _821;
    bool _833 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _835 = 1.0 / _825;
    float _837 = 1.0 / _829;
    float _839 = _809 * _831;
    bool _841 = _805 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _843 = isnan(_805);
    bool _845 = _841 || _843;
    bool _847 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _849 = _845 || _847;
    float _851 = float(_849);
    float _853 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _855 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _853;
    bool _857 = _805 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _859 = isnan(_805);
    bool _861 = _857 || _859;
    bool _863 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _865 = _861 || _863;
    float _867 = float(_865);
    float _869 = _813 * _835;
    float _871 = -_851;
    float _873 = _871 + 1.0;
    float _875 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _877 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _875;
    float _879 = fma(_855, _869, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _881 = _867 * _873;
    bool _883 = _805 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _885 = isnan(_805);
    bool _887 = _883 || _885;
    bool _889 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _891 = _887 || _889;
    float _893 = float(_891);
    float _895 = -_867;
    float _897 = _895 + 1.0;
    float _899 = _817 * _837;
    bool _901 = _805 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _903 = isnan(_805);
    bool _905 = _901 || _903;
    bool _907 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _909 = _905 || _907;
    float _911 = float(_909);
    float _913 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _915 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _913;
    float _917 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _919 = _917 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _921 = fma(_877, _869, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _923 = -_911;
    float _925 = _923 + 1.0;
    float _927 = fma(_915, _869, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _929 = _911 * _897;
    float _931 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _933 = _931 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _935 = _893 * _925;
    float _937 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _939 = _937 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _941 = -_893;
    float _943 = _941 + 1.0;
    float _945 = _879 * _935;
    float _947 = _921 * _935;
    float _949 = _927 * _935;
    float _951 = fma(_943, (*spvDescriptorSet0.vp_c9)._m0[123].x, _945);
    float _953 = fma(_943, (*spvDescriptorSet0.vp_c9)._m0[123].y, _947);
    float _955 = fma(_919, _899, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _957 = fma(_933, _899, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _959 = fma(_943, (*spvDescriptorSet0.vp_c9)._m0[123].z, _949);
    float _961 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _963 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _961;
    float _965 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _967 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _965;
    float _969 = fma(_939, _899, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _971 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _973 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _971;
    float _975 = fma(_955, _929, _951);
    float _977 = fma(_963, _839, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _979 = fma(_967, _839, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _981 = fma(_957, _929, _953);
    float _983 = fma(_973, _839, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _985 = fma(_969, _929, _959);
    float _987 = fma(_977, _881, _975);
    float _989 = fma(_979, _881, _981);
    float _991 = fma(_983, _881, _985);
    float _993 = fma(_851, (*spvDescriptorSet0.vp_c9)._m0[126].x, _987);
    float _995 = fma(_851, (*spvDescriptorSet0.vp_c9)._m0[126].y, _989);
    float _997 = fma(_851, (*spvDescriptorSet0.vp_c9)._m0[126].z, _991);
    bool _999 = !_833;
    float _1017;
    float _1019;
    if (!_999)
    {
        float _1001 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _1003 = _145 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _1005 = float(_89);
        float _1007 = fma(_1003, (*spvDescriptorSet0.vp_c9)._m0[11].w, _123);
        float _1009 = _1007 * _1001;
        float _1011 = floor(_1009);
        float _1013 = -_1011;
        float _1015 = _1009 + _1013;
        _1017 = _1005;
        _1019 = _1015;
        _1021 = true;
    }
    else
    {
        float _1023 = float(_89);
        float _1025 = 1.0 / _1023;
        float _1027 = _123 * _1025;
        _1017 = _1023;
        _1019 = _1027;
    }
    _1021 = false;
    float _1029 = _1017;
    float _1031 = _1019;
    float _1033 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1035 = int(_1033);
    float _1037 = in.m_51.y;
    float _1039 = _299 * _611;
    float _1041 = _307 * _573;
    float _1043 = in.m_51.z;
    float _1045 = _1041 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1047 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1049 = int(_1047);
    float _1051 = as_type<float>(int(gl_VertexIndex));
    float _1053 = float(_1035);
    float _1055 = 1.0 / _1029;
    float _1057 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1059 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1057);
    float _1061 = float(uint(_1049));
    float _1063 = 1.0 / _1053;
    int _1065 = ~_1049;
    int _1067 = _1065 + 1;
    bool _1069 = _1049 == 0;
    float _1071 = 1.0 / _1061;
    float _1073 = _1063 * _123;
    float _1075 = trunc(_1073);
    int _1077 = int(_1075);
    int _1079 = as_type<int>(_1071) + (-2);
    float _1081 = float(uint(_1077));
    float _1083 = as_type<float>(_1079) * _1081;
    float _1085 = trunc(_1083);
    float _1087 = precise::max(_1085, 0.0);
    uint _1090 = uint(_1087);
    int _1092 = ~_1049;
    int _1094 = _1092 + 1;
    int _1096 = _1067 * int(_1090);
    int _1098 = _1096 + _1077;
    float _1100 = float(uint(_1098));
    float _1102 = as_type<float>(_1079) * _1100;
    int _1104 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1106 = _1104 != 0;
    float _1108 = trunc(_1102);
    float _1110 = precise::max(_1108, 0.0);
    uint _1112 = uint(_1110);
    bool _1114 = !_1106;
    float _1116 = _1114 ? 7.345489978790283203125 : 1.0;
    float _1118 = _1116 * _145;
    float _1120 = floor(_1118);
    int _1122 = int(_1090) + int(_1112);
    float _1124 = float(_1049);
    float _1126 = float(_1077);
    int _1128 = _1094 * _1122;
    int _1130 = _1128 + _1077;
    bool _1132 = _1126 >= _1124;
    bool _1134 = isnan(_1126);
    bool _1136 = _1132 || _1134;
    bool _1138 = isnan(_1124);
    bool _1140 = _1136 || _1138;
    float _1142 = float(_1140);
    bool _1144 = uint(_1130) >= uint(_1049);
    float _1146 = -_1120;
    float _1148 = _1118 + _1146;
    float _1150 = trunc(_1142);
    int _1152 = int(_1150);
    bool _1154 = !_1144;
    int _1156 = _1154 ? 0 : (-1);
    float _1158 = _1148 * _1124;
    float _1160 = _1124 * _123;
    int _1162 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1164 = _1162 != 0;
    int _1166 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1168 = _1166 != 0;
    int _1170 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1172 = _1170 != 0;
    int _1174 = ~_1122;
    int _1176 = _1174 + _1156;
    int _1178 = _1176 + 1;
    float _1180 = _1160 * _1055;
    float _1182 = trunc(_1158);
    int _1184 = int(_1182);
    int _1186 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1188 = _1186 != 0;
    int _1190 = _1049 * _1178;
    int _1192 = _1190 + _1077;
    bool _1194 = !_1168;
    int _1196 = _1194 ? 0 : 1;
    bool _1198 = !_1164;
    int _1200 = _1198 ? 0 : 1;
    int _1202 = ~_1152;
    int _1204 = _1202 + 1;
    int _1206 = _1204 + 1;
    float _1208 = trunc(_1180);
    int _1210 = int(_1208);
    bool _1212 = !_1069;
    int _1214 = _1212 ? _1192 : (-1);
    int _1216 = abs(_1200);
    int _1218 = _1214 * _1206;
    int _1220 = _1049 + (-1);
    int _1222 = _1152 * _1220;
    int _1224 = _1222 + _1218;
    bool _1226 = !_1188;
    int _1228 = _1226 ? 0 : 1;
    int _1230 = abs(_1196);
    int _1232 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1234 = _1232 != 0;
    bool _1236 = !_1172;
    int _1238 = _1236 ? 0 : 1;
    int _1240 = _1224 * _1230;
    int _1242 = abs(_1228);
    bool _1244 = !_1234;
    int _1246 = _1244 ? 0 : 1;
    int _1248 = abs(_1238);
    int _1250 = _1184 * _1242;
    int _1252 = _1250 + _1077;
    int _1254 = abs(_1246);
    int _1256 = _1210 * _1216;
    int _1258 = _1256 + _1240;
    int _1260 = ~_1049;
    int _1262 = _1260 + 1;
    int _1264 = _1252 * _1248;
    int _1266 = _1264 + _1258;
    int _1268 = ~_1049;
    int _1270 = _1268 + 1;
    int _1272 = _1184 * _1254;
    int _1274 = _1272 + _1266;
    float _1276 = float(uint(_1274));
    float _1278 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1280 = as_type<float>(_1079) * _1276;
    float _1282 = trunc(_1280);
    float _1284 = precise::max(_1282, 0.0);
    uint _1286 = uint(_1284);
    int _1288 = _1262 * int(_1286);
    int _1290 = _1288 + _1274;
    float _1292 = float(uint(_1290));
    float _1294 = as_type<float>(_1079) * _1292;
    float _1296 = trunc(_1294);
    float _1298 = precise::max(_1296, 0.0);
    uint _1300 = uint(_1298);
    int _1302 = ~_1049;
    int _1304 = _1302 + 1;
    int _1306 = int(_1286) + int(_1300);
    float _1308 = float(uint(_1252));
    int _1310 = _1270 * _1306;
    int _1312 = _1310 + _1274;
    float _1314 = as_type<float>(_1079) * _1308;
    bool _1316 = uint(_1312) >= uint(_1049);
    float _1318 = trunc(_1314);
    float _1320 = precise::max(_1318, 0.0);
    uint _1322 = uint(_1320);
    float _1324 = _145 * 2.0;
    bool _1326 = !_1316;
    int _1328 = _1326 ? 0 : (-1);
    int _1330 = ~_1306;
    int _1332 = _1330 + _1328;
    int _1334 = _1332 + 1;
    float _1336 = floor(_1324);
    int _1338 = _1049 * _1334;
    int _1340 = _1338 + _1274;
    float _1342 = _1037 * 2.0;
    float _1344 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _1346 = _1304 * int(_1322);
    int _1348 = _1346 + _1252;
    bool _1350 = !_1069;
    int _1352 = _1350 ? _1340 : (-1);
    float _1354 = floor(_1342);
    int _1356 = _1352 & 3;
    bool _1358 = _1356 != 0;
    float _1360 = float(uint(_1348));
    bool _1362 = uint(_1356) > 1u;
    int _1364 = _1352 & 3;
    bool _1366 = _1364 != 0;
    float _1368 = as_type<float>(_1079) * _1360;
    bool _1370 = _1336 > 0.0;
    bool _1372 = _1336 >= 0.0;
    bool _1374 = isnan(_1336);
    bool _1376 = _1372 || _1374;
    bool _1378 = isnan(0.0);
    bool _1380 = _1376 || _1378;
    int _1382 = _1366 ? 0 : 1;
    float _1384 = trunc(_1368);
    float _1386 = precise::max(_1384, 0.0);
    uint _1388 = uint(_1386);
    bool _1390 = _1354 > 0.0;
    int _1392 = _1380 ? 0 : 1;
    bool _1394 = _1354 >= 0.0;
    bool _1396 = isnan(_1354);
    bool _1398 = _1394 || _1396;
    bool _1400 = isnan(0.0);
    bool _1402 = _1398 || _1400;
    int _1404 = ~_1382;
    int _1406 = _1404 + 1;
    int _1408 = _1406 + 1;
    int _1410 = _1408;
    if (!_1362)
    {
        int _1412 = ~_1382;
        int _1414 = _1412 + 1;
        _1410 = _1414;
    }
    int _1416 = _1410;
    int _1418 = ~_1392;
    int _1420 = _1418 + 1;
    int _1422 = _1420 + 1;
    bool _1424 = _1356 != 3;
    int _1426 = _1402 ? 0 : 1;
    int _1428 = _1422;
    if (!_1370)
    {
        int _1430 = ~_1392;
        int _1432 = _1430 + 1;
        _1428 = _1432;
    }
    int _1434 = _1428;
    float _1436 = in.m_44.x;
    float _1438 = in.m_44.y;
    float _1440 = in.m_44.z;
    bool _1442 = uint(_1356) >= 2u;
    int _1444 = ~_1426;
    int _1446 = _1444 + 1;
    int _1448 = _1446 + 1;
    int _1450 = _1448;
    if (!_1390)
    {
        int _1452 = ~_1426;
        int _1454 = _1452 + 1;
        _1450 = _1454;
    }
    int _1456 = _1450;
    float _1458 = _1043 * 2.0;
    int _1460 = _1442 ? 0 : 1;
    int _1462 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1464 = _1462 != 0;
    int _1466 = int(_1322) + int(_1388);
    float _1468 = floor(_1458);
    int _1470 = ~_1049;
    int _1472 = _1470 + 1;
    int _1474 = ~_1460;
    int _1476 = _1474 + 1;
    int _1478 = _1476 + 1;
    int _1480 = _1478;
    if (_1424)
    {
        int _1482 = ~_1460;
        int _1484 = _1482 + 1;
        _1480 = _1484;
    }
    int _1486 = _1480;
    bool _1488 = !_1464;
    int _1490 = _1488 ? 0 : 1;
    float _1492 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1494 = log2(_1492);
    int _1496 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1498 = _1496 != 0;
    int _1500 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1502 = _1500 != 0;
    int _1504 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1506 = _1504 != 0;
    int _1508 = _1472 * _1466;
    int _1510 = _1508 + _1252;
    float _1512 = _1037 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1514 = _1438 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1516 = _1438 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _1518 = !_1502;
    int _1520 = _1518 ? 0 : 1;
    float _1522 = fma(_1512, -2.0, _1278);
    bool _1524 = uint(_1510) >= uint(_1049);
    float _1526 = _145 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1528 = fma(_1436, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1514);
    float _1530 = fma(_1436, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1516);
    bool _1532 = !_1524;
    int _1534 = _1532 ? 0 : (-1);
    float _1536 = -_1344;
    float _1538 = fma(_1526, 2.0, _1536);
    int _1540 = as_type<int>(_1051) & 1;
    bool _1542 = _1540 != 0;
    int _1544 = as_type<int>(_1051) & 2;
    bool _1546 = _1544 != 0;
    float _1548 = _1438 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    bool _1550 = !_1498;
    int _1552 = _1550 ? 0 : 1;
    float _1554 = _145 + _1037;
    bool _1556 = _1468 >= 0.0;
    bool _1558 = isnan(_1468);
    bool _1560 = _1556 || _1558;
    bool _1562 = isnan(0.0);
    bool _1564 = _1560 || _1562;
    float _1566 = _1494 * _123;
    float _1568 = fma(_1436, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1548);
    float _1570 = _1554 + (-1.0);
    int _1572 = _1564 ? 0 : 1;
    float _1574 = exp2(_1566);
    bool _1576 = _1468 > 0.0;
    float _1578 = fma(_1570, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1580 = _145 + _1043;
    int _1582 = _1352 >> 31;
    float _1584 = _1037 + _1043;
    bool _1586 = !_1506;
    int _1588 = _1586 ? 0 : 1;
    float _1590 = _1580 + (-1.0);
    int _1592 = _1582 & 3;
    float _1594 = _1584 + (-1.0);
    float _1596 = fma(_1590, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    int _1598 = ~_1572;
    int _1600 = _1598 + 1;
    int _1602 = _1600 + 1;
    float _1604 = fma(_1594, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _1606 = _1602;
    if (!_1576)
    {
        int _1608 = ~_1572;
        int _1610 = _1608 + 1;
        _1606 = _1610;
    }
    int _1612 = _1606;
    float _1614 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1616 = 1.0 + _1614;
    int _1618 = _1352 + _1592;
    float _1620 = -_1574;
    float _1622 = _1620 + 1.0;
    float _1624 = in.m_62.x;
    float _1626 = in.m_62.y;
    float _1628 = in.m_62.z;
    bool _1630 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1632 = isnan(0.0);
    bool _1634 = _1630 || _1632;
    bool _1636 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1638 = _1634 || _1636;
    float _1640 = 1.0 / _1616;
    int _1642 = abs(_1520);
    float _1644 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1646 = _1638 ? _1622 : 0.0;
    float _1648 = -_123;
    float _1650 = fma(_1648, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1538);
    bool _1652 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1654 = isnan(1.0);
    bool _1656 = _1652 || _1654;
    bool _1658 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1660 = _1656 || _1658;
    float _1662 = fma(_1037, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1644);
    int _1664 = _1618 >> 2;
    float _1666 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1059);
    int _1668 = abs(_1588);
    float _1670 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1662);
    int _1672 = abs(_1552);
    float _1674 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1522);
    float _1676 = fma(_1440, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1568);
    int _1678 = _1664 << 4;
    int _1680 = _1678 + 368;
    float _1682 = fma(_1440, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1528);
    float _1684 = float(_1434);
    if (_1660)
    {
        float _1686 = _1646 * _1640;
        _127 = _1686;
    }
    float _1688 = _127;
    float _1690 = float(_1456);
    float _1692 = fma(_1440, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1530);
    float _1694 = float(_1672);
    float _1696 = float(_1612);
    uint _1698 = uint(int(uint(_1680) >> uint(2)));
    uint _1700 = uint(int(uint(int(_1698)) >> uint(2)));
    int _1702 = int(_1698) & 3;
    float _1704 = (*spvDescriptorSet0.vp_c9)._m0[int(_1700)][_1702];
    int _1706 = int(_1698) + 1;
    uint _1708 = uint(int(uint(_1706) >> uint(2)));
    int _1710 = _1706 & 3;
    float _1712 = (*spvDescriptorSet0.vp_c9)._m0[int(_1708)][_1710];
    float _1714 = float(_1668);
    float _1716 = float(_1642);
    bool _1718 = _1037 > 0.5;
    float _1720 = _1714 * _1690;
    float _1722 = _1694 * _1696;
    float _1724 = _1716 * _1684;
    int _1726 = _1680 + 8;
    uint _1728 = uint(int(uint(_1726) >> uint(2)));
    uint _1730 = uint(int(uint(int(_1728)) >> uint(2)));
    int _1732 = int(_1728) & 3;
    float _1734 = (*spvDescriptorSet0.vp_c9)._m0[int(_1730)][_1732];
    int _1736 = int(_1728) + 1;
    uint _1738 = uint(int(uint(_1736) >> uint(2)));
    int _1740 = _1736 & 3;
    float _1742 = (*spvDescriptorSet0.vp_c9)._m0[int(_1738)][_1740];
    float _1744 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _1746 = int(_1744);
    float _1748 = _1722 * (-2.0);
    float _1750 = _1724 * (-2.0);
    float _1752 = _1037 + (-0.5);
    float _1754 = _1720 * (-2.0);
    float _1756 = fma(_1578, _1748, _1578);
    float _1758 = fma(_1604, _1750, _1604);
    float _1760 = fma(_1750, _1626, _1626);
    float _1762 = fma(_1748, _1624, _1624);
    int _1764 = abs(_1416);
    float _1766 = _145 + (-0.5);
    float _1768 = fma(_1752, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1760);
    float _1770 = fma(_1596, _1754, _1596);
    float _1772 = fma(_1754, _1628, _1628);
    float _1774 = _1043 + (-0.5);
    bool _1776 = !_1358;
    int _1778 = _1776 ? 0 : 1;
    float _1780 = fma(_1766, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1762);
    int _1782 = abs(_1746);
    float _1784 = fma(_1774, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1772);
    float _1786 = fma(_1756, _1688, _1780);
    float _1788 = float(uint(_1782));
    float _1790 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1792 = _1790 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1794 = _1356 != 3;
    float _1796 = fma(_1758, _1688, _1768);
    float _1798 = 1.0 / _1788;
    int _1800 = abs(_1778);
    float _1802 = fma(_1770, _1688, _1784);
    bool _1804 = !_1794;
    int _1806 = _1804 ? 0 : (-1);
    float _1808 = _1796 * 0.15915493667125701904296875;
    int _1810 = ~_1800;
    int _1812 = _1810 + 1;
    int _1814 = _1812 + 1;
    float _1816 = _1786 * 0.15915493667125701904296875;
    int _1818 = abs(_1806);
    float _1820 = 1.0 / _1792;
    int _1822 = abs(_1486);
    float _1824 = _1802 * 0.15915493667125701904296875;
    int _1826 = ~_1764;
    int _1828 = _1826 + 1;
    int _1830 = _1828 + 1;
    int _1832 = ~_1466;
    int _1834 = _1832 + _1534;
    int _1836 = _1834 + 1;
    int _1838 = abs(_1490);
    int _1840 = _1830 * as_type<int>(_1712);
    int _1842 = ~_1822;
    int _1844 = _1842 + 1;
    int _1846 = _1844 + 1;
    int _1848 = _1049 * _1836;
    int _1850 = _1848 + _1252;
    int _1852 = _1814 * as_type<int>(_1704);
    int _1854 = _1852 + _1840;
    float _1856 = float(uint(_1746));
    float _1858 = _1808 * 6.283185482025146484375;
    float _1860 = sin(_1858);
    int _1862 = _1846 * as_type<int>(_1734);
    int _1864 = _1862 + _1854;
    int _1866 = ~_1818;
    int _1868 = _1866 + 1;
    int _1870 = _1868 + 1;
    bool _1872 = _145 > 0.5;
    float _1874 = 1.0 / _1856;
    int _1876 = ~_1838;
    int _1878 = _1876 + 1;
    int _1880 = _1878 + 1;
    int _1882 = _1870 * as_type<int>(_1742);
    int _1884 = _1882 + _1864;
    bool _1886 = !_1069;
    int _1888 = _1886 ? _1850 : (-1);
    float _1890 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1892 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1890;
    bool _1894 = !_1542;
    float _1896 = _1894 ? (-0.5) : 0.5;
    int _1898 = _1884 * _1880;
    int _1900 = as_type<int>(_1798) + (-2);
    float _1902 = _1892 * _1820;
    float _1904 = _1816 * 6.283185482025146484375;
    float _1906 = cos(_1904);
    int _1908 = _1888 * _1838;
    int _1910 = _1908 + _1898;
    float _1912 = _1039 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1914 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1896);
    bool _1916 = !_1546;
    float _1918 = _1916 ? (-0.5) : 0.5;
    int _1920 = abs(_1910);
    float _1922 = _1912 * _1914;
    float _1924 = _1808 * 6.283185482025146484375;
    float _1926 = cos(_1924);
    int _1928 = as_type<int>(_1874) + (-2);
    float _1930 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1918);
    float _1932 = float(uint(_1910));
    float _1934 = float(uint(_1920));
    float _1936 = _1045 * _1930;
    int _1938 = ~_1782;
    int _1940 = _1938 + 1;
    float _1942 = _1816 * 6.283185482025146484375;
    float _1944 = sin(_1942);
    float _1946 = as_type<float>(_1928) * _1932;
    float _1948 = _1906 * _1860;
    float _1950 = as_type<float>(_1900) * _1934;
    int _1952 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1954 = _1952 != 0;
    int _1956 = ~_1782;
    int _1958 = _1956 + 1;
    float _1960 = _1824 * 6.283185482025146484375;
    float _1962 = sin(_1960);
    float _1964 = _1824 * 6.283185482025146484375;
    float _1966 = cos(_1964);
    float _1968 = _1944 * _1926;
    float _1970 = _1944 * _1860;
    float _1972 = trunc(_1946);
    float _1974 = precise::max(_1972, 0.0);
    uint _1976 = uint(_1974);
    float _1978 = -_1948;
    float _1980 = fma(_1962, _1968, _1978);
    float _1982 = -_1968;
    float _1984 = fma(_1962, _1948, _1982);
    int _1986 = ~_1746;
    int _1988 = _1986 + 1;
    float _1990 = trunc(_1950);
    float _1992 = precise::max(_1990, 0.0);
    uint _1994 = uint(_1992);
    float _1996 = _1860 * _1966;
    float _1998 = _1906 * _1926;
    float _2000 = _1926 * _1966;
    float _2002 = _1966 * _1936;
    float _2004 = -_1936;
    float _2006 = _1962 * _2004;
    float _2008 = fma(_1962, _1998, _1970);
    float _2010 = fma(_1962, _1970, _1998);
    int _2012 = _1988 * int(_1976);
    int _2014 = _2012 + _1910;
    float _2016 = _1906 * _2002;
    float _2018 = fma(_2000, _1922, _2006);
    float _2020 = _1944 * _2002;
    float _2022 = float(uint(_2014));
    float _2024 = fma(_2008, _1922, _2016);
    float _2026 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    int _2028 = _1940 * int(_1994);
    int _2030 = _2028 + _1920;
    float _2032 = fma(_1980, _1922, _2020);
    float _2034 = as_type<float>(_1928) * _2022;
    float _2036 = fma(_1984, _2026, _2024);
    float _2038 = fma(_1996, _2026, _2018);
    float _2040 = float(uint(_2030));
    float _2042 = trunc(_2034);
    float _2044 = precise::max(_2042, 0.0);
    uint _2046 = uint(_2044);
    float _2048 = fma(_2010, _2026, _2032);
    float _2050 = _2036 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2052 = _1676 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _2054 = as_type<float>(_1900) * _2040;
    float _2056 = _2036 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2058 = fma(_2038, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2050);
    float _2060 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2062 = _1031 + _2060;
    int _2064 = ~_1746;
    int _2066 = _2064 + 1;
    float _2068 = fma(_2038, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2056);
    float _2070 = trunc(_2054);
    float _2072 = precise::max(_2070, 0.0);
    uint _2074 = uint(_2072);
    float _2076 = fma(_2048, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2058);
    float _2078 = _1692 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _2080 = fma(_2048, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2068);
    float _2082 = fma(_1902, _2062, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _2084 = _2076 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    int _2086 = int(_1976) + int(_2046);
    float _2088 = _2080 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2090 = -_1896;
    int _2092 = _1872 ? as_type<int>(_2090) : as_type<int>(_1896);
    float _2094 = _2052 + _2084;
    float _2096 = _2036 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2098 = _2078 + _2088;
    bool _2100 = !_1954;
    float _2102 = _2100 ? _1896 : as_type<float>(_2092);
    float _2104 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2106 = _2094 + _2104;
    bool _2108 = _1031 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2110 = isnan(_1031);
    bool _2112 = _2108 || _2110;
    bool _2114 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2116 = _2112 || _2114;
    float _2118 = float(_2116);
    float _2120 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2122 = _2098 + _2120;
    int _2124 = int(_1994) + int(_2074);
    float _2126 = _2106 * _2106;
    bool _2128 = _1031 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2130 = isnan(_1031);
    bool _2132 = _2128 || _2130;
    bool _2134 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2136 = _2132 || _2134;
    float _2138 = float(_2136);
    float _2140 = _2122 * _2122;
    float _2142 = -_2118;
    float _2144 = _2142 + 1.0;
    int _2146 = _2066 * _2086;
    int _2148 = _2146 + _1910;
    float _2150 = fma(_2038, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2096);
    float _2152 = _2126 + _2140;
    int _2154 = _1958 * _2124;
    int _2156 = _2154 + _1920;
    float _2158 = _2138 * _2144;
    bool _2160 = uint(_2148) >= uint(_1746);
    float _2162 = sqrt(_2152);
    int _2164 = _1910 ^ _1746;
    float _2166 = _2082 * _2158;
    bool _2168 = uint(_2156) >= uint(_1782);
    float _2170 = fma(_2048, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2150);
    bool _2172 = !_2160;
    int _2174 = _2172 ? 0 : (-1);
    bool _2176 = !_2168;
    int _2178 = _2176 ? 0 : (-1);
    float _2180 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    uint _2182 = uint(int(uint(_2164) >> uint(31)));
    float _2184 = _2170 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    int _2186 = ~_2086;
    int _2188 = _2186 + _2174;
    int _2190 = _2188 + 1;
    int _2192 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2194 = _2192 != 0;
    int _2196 = ~_2178;
    int _2198 = _2124 + _2196;
    int _2200 = _2198 + 1;
    float _2202 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _2204 = _2162 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _2206 = _1746 * _2190;
    int _2208 = _2206 + _1910;
    int _2210 = ~int(_2182);
    int _2212 = _2210 + 1;
    float _2214 = _1682 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _2216 = _1746 == 0;
    bool _2218 = _1746 == 0;
    float _2220 = _2214 + _2184;
    int _2222 = _2200 ^ _2212;
    float _2224 = _2180 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2226 = -_1918;
    int _2228 = _1718 ? as_type<int>(_2226) : as_type<int>(_1918);
    bool _2230 = !_2216;
    int _2232 = _2230 ? _2208 : (-1);
    int _2234 = ~_2212;
    int _2236 = _2234 + _2222;
    int _2238 = _2236 + 1;
    float _2240 = as_type<float>(_2212);
    float _2242 = as_type<float>(_1910);
    float _2244 = _2094;
    float _2246 = _2126;
    float _2248 = _2140;
    float _2250 = _2102;
    float _2252 = _2078;
    if (!_2204)
    {
        _2240 = _2094;
    }
    float _2254 = _2240;
    bool _2256 = !_2194;
    float _2258 = _2256 ? _1918 : as_type<float>(_2228);
    float _2260 = _2254;
    float _2262 = _2258;
    if (!_2204)
    {
        _2242 = _2098;
    }
    float _2264 = _2242;
    float _2266 = float(_2232);
    float _2268 = _2264;
    if (!_2204)
    {
        _2244 = _2220;
    }
    float _2270 = _2244;
    bool _2272 = !_2204;
    float _2274 = _2270;
    if (!_2272)
    {
        float _2276 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2278 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2280 = _2162 + _2278;
        float _2282 = rsqrt(_2152);
        float _2284 = _2280 * _2276;
        float _2286 = _2220 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2288 = _2284 * 0.15915493667125701904296875;
        float _2290 = _2288 * 6.283185482025146484375;
        float _2292 = sin(_2290);
        float _2294 = _2288 * 6.283185482025146484375;
        float _2296 = cos(_2294);
        float _2298 = fma(_2292, _2286, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2300 = _2282 * _2298;
        float _2302 = fma(_2106, _2300, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2304 = _2296 + (-1.0);
        float _2306 = fma(_2122, _2300, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2308 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _2310 = _2302 + _2308;
        float _2312 = _2304 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2314 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _2316 = _2306 + _2314;
        float _2318 = _2310 * _2310;
        float _2320 = fma(_2220, _2296, _2312);
        float _2322 = _2316 * _2316;
        _2274 = _2320;
        _2246 = _2318;
        _2248 = _2322;
        _2260 = _2302;
        _2268 = _2306;
    }
    float _2324 = _2274;
    float _2326 = _2246;
    float _2328 = _2248;
    float _2330 = _2260;
    float _2332 = _2268;
    float _2334 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _2336 = _2324 + _2334;
    bool _2338 = !_2218;
    int _2340 = _2338 ? _2238 : (-1);
    float _2342 = -_2138;
    float _2344 = _2342 + 1.0;
    float _2346 = fma(_2224, _2266, _1650);
    float _2348 = fma(_2336, _2336, _2326);
    float _2350 = _2102 + 0.5;
    float _2352 = float(_2340);
    float _2354 = _2202 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2356 = _2348 + _2328;
    float _2358 = fma(_2344, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2166);
    float _2360 = fma(_2224, _2350, _2346);
    float _2362 = -_1666;
    float _2364 = _2362 + 1.0;
    float _2366 = -_1674;
    float _2368 = fma(_2354, _2352, _2366);
    float _2370 = _2258 + (-0.5);
    float _2372 = fma(_2118, (*spvDescriptorSet0.vp_c9)._m0[132].x, _2358);
    float _2374 = _993 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2376 = sqrt(_2356);
    float _2378 = -_2364;
    float _2380 = fma(_2102, _2378, _2360);
    float _2382 = _995 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2384 = -_2354;
    float _2386 = fma(_2384, _2370, _2368);
    float _2388 = _997 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2390 = -_1670;
    float _2392 = _2390 + 1.0;
    float _2394 = _2374 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2396 = _2382 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2398 = _2388 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2400 = _2372 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2402 = fma(_2258, _2392, _2386);
    out.m_64.x = _2394;
    out.m_64.y = _2396;
    out.m_64.z = _2398;
    out.m_64.w = _2400;
    bool _2404 = _2376 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2406 = isnan(_2376);
    bool _2408 = _2404 || _2406;
    bool _2410 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2412 = _2408 || _2410;
    out.m_66.x = _2380;
    out.m_66.y = _2402;
    float _2414 = _2380;
    if (!_2412)
    {
        _2250 = 1.0;
    }
    float _2416 = _2250;
    bool _2418 = !_2412;
    float _2420 = _2416;
    if (!_2418)
    {
        bool _2422 = _2376 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2424 = isnan(_2376);
        bool _2426 = _2422 || _2424;
        bool _2428 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2430 = _2426 || _2428;
        if (!_2430)
        {
            float _2432 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2434 = _2376 + _2432;
            float _2436 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2438 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2436;
            float _2440 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2442 = _2440 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2444 = 1.0 / _2438;
            float _2446 = _2434 * _2444;
            float _2448 = fma(_2446, _2442, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2420 = _2448;
            _2262 = _2438;
            _2450 = true;
        }
        else
        {
            bool _2452 = _2376 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2454 = isnan(_2376);
            bool _2456 = _2452 || _2454;
            bool _2458 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2460 = _2456 || _2458;
            if (!_2460)
            {
                float _2462 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2464 = _2376 + _2462;
                float _2466 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2468 = _2466 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2470 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2472 = _2470 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2474 = 1.0 / _2468;
                float _2476 = _2464 * _2474;
                float _2478 = fma(_2476, _2472, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2420 = _2478;
                _2262 = _2468;
                _2450 = true;
            }
            else
            {
                _2420 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2450 = false;
    float _2480 = _2420;
    float _2482 = _2262;
    float _2484 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2486 = _2324 + _2484;
    float _2488 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2490 = _2330 + _2488;
    float _2492 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2494 = _2332 + _2492;
    float _2496 = fma(_2486, _2480, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2498 = fma(_2490, _2480, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2500 = fma(_2494, _2480, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2502 = -_2214;
    float _2504 = _2502 + _2496;
    float _2506 = -_2052;
    float _2508 = _2506 + _2498;
    float _2510 = -_2078;
    float _2512 = _2510 + _2500;
    float _2514 = _2504 * _2504;
    float _2516 = fma(_2508, _2508, _2514);
    float _2518 = fma(_2512, _2512, _2516);
    float _2520 = sqrt(_2518);
    bool _2522 = _2520 > 0.0;
    bool _2524 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2526 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2528 = _2524 || _2526;
    bool _2530 = isnan(0.5);
    bool _2532 = _2528 || _2530;
    float _2534 = _2490;
    float _2536 = _2482;
    float _2538 = _2494;
    float _2540 = _2498;
    float _2542 = _2496;
    if (!_2522)
    {
        _2534 = _2498;
    }
    float _2544 = _2534;
    float _2546 = _2544;
    float _2548 = _2544;
    if (!_2522)
    {
        _2536 = _2496;
    }
    float _2550 = _2536;
    float _2552 = _2550;
    float _2554 = _2550;
    if (!_2522)
    {
        _2538 = _2500;
    }
    float _2556 = _2538;
    bool _2558 = !_2522;
    float _2560 = _2556;
    if (!_2558)
    {
        float _2562 = _301 * _301;
        float _2564 = fma(_215, _215, _2562);
        float _2566 = fma(_291, _291, _2564);
        float _2568 = rsqrt(_2518);
        float _2570 = sqrt(_2566);
        float _2572 = _2508 * _2568;
        float _2574 = _2504 * _2568;
        float _2576 = _2512 * _2568;
        bool _2578 = _2570 > 0.0;
        float _2580 = _2570;
        if (!_2578)
        {
            _2546 = _2498;
        }
        float _2582 = _2546;
        _2548 = _2582;
        if (!_2578)
        {
            _2552 = _2496;
        }
        float _2584 = _2552;
        _2554 = _2584;
        if (!_2578)
        {
            _2580 = _2500;
        }
        float _2586 = _2580;
        bool _2588 = !_2578;
        _2560 = _2586;
        if (!_2588)
        {
            float _2590 = rsqrt(_2566);
            float _2592 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _2594 = _301 * _2590;
            float _2596 = _215 * _2590;
            float _2598 = _2574 * _2594;
            float _2600 = _291 * _2590;
            float _2602 = fma(_2572, _2596, _2598);
            float _2604 = _2592 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2606 = fma(_2576, _2600, _2602);
            float _2608 = _2606 * _2604;
            float _2610 = fma(_215, _2608, _2498);
            float _2612 = fma(_301, _2608, _2496);
            float _2614 = fma(_291, _2608, _2500);
            _2548 = _2610;
            _2554 = _2612;
            _2560 = _2614;
        }
    }
    float _2616 = _2548;
    float _2618 = _2554;
    float _2620 = _2560;
    float _2622 = _2618;
    float _2624 = _2620;
    if (_2532)
    {
        _311 = _2616;
    }
    float _2626 = _311;
    float _2628 = _2626;
    if (!_2532)
    {
        float _2630 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2632 = _2214 + _2630;
        float _2634 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2636 = _2052 + _2634;
        float _2638 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2640 = _2632 * _2632;
        float _2642 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2644 = _2078 + _2642;
        float _2646 = fma(_2636, _2636, _2640);
        float _2648 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2650 = fma(_2644, _2644, _2646);
        float _2652 = sqrt(_2650);
        float _2654 = _2638 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2656 = precise::min(_2652, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2658 = _2656 * _2648;
        float _2660 = -_2052;
        float _2662 = _2660 + _2616;
        float _2664 = -_2214;
        float _2666 = _2664 + _2618;
        float _2668 = _2654 * _2658;
        float _2670 = -_2078;
        float _2672 = _2670 + _2620;
        float _2674 = fma(_2662, _2668, _2052);
        float _2676 = fma(_2666, _2668, _2214);
        float _2678 = fma(_2672, _2668, _2078);
        _2622 = _2676;
        _2628 = _2674;
        _2624 = _2678;
        _2540 = _2648;
    }
    float _2680 = _2622;
    float _2682 = _2628;
    float _2684 = _2624;
    float _2686 = _2540;
    float _2688 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2690 = _2680 + _2688;
    float _2692 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2694 = _2682 + _2692;
    float _2696 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2698 = _2684 + _2696;
    float _2700 = _2690 * _2690;
    float _2702 = fma(_2694, _2694, _2700);
    float _2704 = fma(_2698, _2698, _2702);
    float _2706 = rsqrt(_2704);
    float _2708 = sqrt(_2704);
    float _2710 = _2706 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2712 = _2694 * _2710;
    float _2714 = _2698 * _2710;
    float _2716 = _2712 * _2712;
    float _2718 = _2714 * _2714;
    float _2720 = _2716 + _2718;
    float _2722 = sqrt(_2720);
    bool _2724 = _2722 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2726 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2728 = _2722 + _2726;
    float _2730 = _2698;
    float _2732 = _2700;
    float _2734 = _2728;
    float _2736 = _2710;
    if (_2724)
    {
        float _2738 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2730 = _2738;
    }
    float _2740 = _2730;
    if (_2724)
    {
        float _2742 = rsqrt(_2720);
        _2732 = _2742;
    }
    float _2744 = _2732;
    float _2746 = _2744;
    if (_2724)
    {
        float _2748 = _2728 * _2740;
        _2734 = _2748;
    }
    float _2750 = _2734;
    if (_2724)
    {
        float _2752 = _2750 * 0.15915493667125701904296875;
        _2542 = _2752;
    }
    float _2754 = _2542;
    float _2756 = _2706;
    float _2758 = _2754;
    if (_2724)
    {
        float _2760 = _2754 * 6.283185482025146484375;
        float _2762 = sin(_2760);
        _2756 = _2762;
    }
    float _2764 = _2756;
    float _2766 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2768 = precise::max(0.0, _2766);
    float _2770 = _2686;
    float _2772 = _2768;
    float _2774 = _2766;
    if (_2724)
    {
        float _2776 = _2754 * 6.283185482025146484375;
        float _2778 = cos(_2776);
        _2770 = _2778;
    }
    float _2780 = _2770;
    float _2782 = -_2710;
    float _2784 = -_2768;
    float _2786 = fma(_2690, _2782, _2784);
    if (_2724)
    {
        float _2788 = _2786 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2772 = _2788;
    }
    float _2790 = _2772;
    float _2792 = _2790;
    if (!_2724)
    {
        _2758 = _2716;
    }
    float _2794 = _2758;
    float _2796 = _2764;
    float _2798 = _2794;
    if (_2724)
    {
        float _2800 = fma(_2764, _2790, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2796 = _2800;
    }
    float _2802 = _2796;
    float _2804 = _2802;
    if (!_2724)
    {
        _2792 = _2714;
    }
    float _2806 = _2792;
    float _2808 = _2806;
    if (_2724)
    {
        float _2810 = _2780 + (-1.0);
        _2774 = _2810;
    }
    float _2812 = _2774;
    float _2814 = _2812;
    if (_2724)
    {
        float _2816 = _2744 * _2802;
        _2414 = _2816;
    }
    float _2818 = _2414;
    if (!_2724)
    {
        _2746 = _2712;
    }
    float _2820 = _2746;
    float _2822 = _2820;
    if (_2724)
    {
        float _2824 = _2812 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2736 = _2824;
    }
    float _2826 = _2736;
    if (_2724)
    {
        float _2828 = _2712 * _2818;
        _2822 = _2828;
    }
    float _2830 = _2822;
    if (!_2724)
    {
        _2804 = _2786;
    }
    float _2832 = _2804;
    float _2834 = _2832;
    if (_2724)
    {
        float _2836 = _2714 * _2818;
        _2808 = _2836;
    }
    float _2838 = _2808;
    if (_2724)
    {
        float _2840 = fma(_2786, _2780, _2826);
        _2834 = _2840;
    }
    float _2842 = _2834;
    if (_2724)
    {
        float _2844 = _2830 * _2830;
        _2798 = _2844;
    }
    float _2846 = _2798;
    if (!_2724)
    {
        _2814 = _2718;
    }
    float _2848 = _2814;
    float _2850 = _2848;
    if (_2724)
    {
        float _2852 = _2838 * _2838;
        _2850 = _2852;
    }
    float _2854 = _2850;
    float _2856 = _2680 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2858 = fma(_2842, _2842, _2846);
    float _2860 = _2680 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2862 = fma(_2682, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2856);
    float _2864 = _2858 + _2854;
    float _2866 = _2680 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2868 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2870 = fma(_2708, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2868);
    float _2872 = precise::clamp(_2870, 0.0, 1.0);
    float _2874 = fma(_2684, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2862);
    float _2876 = rsqrt(_2864);
    float _2878 = _2680 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2880 = -_2872;
    float _2882 = _2880 + 1.0;
    float _2884 = fma(_2682, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2866);
    float _2886 = _2874 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2888 = fma(_2682, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2860);
    float _2890 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2892 = fma(_2684, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2884);
    float _2894 = abs(_2882);
    float _2896 = log2(_2894);
    float _2898 = _2886 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2900 = fma(_2682, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2878);
    float _2902 = fma(_2684, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2888);
    float _2904 = _2892 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2906 = -_2898;
    float _2908 = fma(_2906, _2890, 1.0);
    float _2910 = fma(_2684, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2900);
    float _2912 = _2902 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2914 = _2876 * _2830;
    float _2916 = _2904 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2918 = _2876 * _2842;
    float _2920 = _2876 * _2838;
    float _2922 = _2914 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2924 = fma(_2912, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2916);
    float _2926 = _2910 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2928 = log2(_2908);
    float _2930 = _2896 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2932 = -_2922;
    float _2934 = fma(_2918, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2932);
    float _2936 = fma(_2886, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2924);
    float _2938 = _2904 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2940 = -_2920;
    float _2942 = fma(_2940, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2934);
    float _2944 = fma(_2926, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2936);
    float _2946 = exp2(_2930);
    float _2948 = _2904 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2950 = fma(_2942, -0.5, 0.5);
    float _2952 = fma(_2912, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2938);
    float _2954 = fma(_2942, 0.5, 0.5);
    float _2956 = fma(_2912, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2948);
    float _2958 = _2918 + 1.0;
    float _2960 = fma(_2886, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2952);
    float _2962 = 1.0 / _2944;
    float _2964 = fma(_2954, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2966 = fma(_2886, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2956);
    float _2968 = _2928 * 0.693147182464599609375;
    float _2970 = fma(_2954, _2964, -0.212114393711090087890625);
    float _2972 = fma(_2926, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2966);
    float _2974 = _2968 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2976 = sqrt(_2950);
    float _2978 = -_2918;
    float _2980 = fma(_2946, _2958, _2978);
    float _2982 = fma(_2926, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2960);
    float _2984 = fma(_2954, _2970, 1.570728778839111328125);
    float _2986 = fma(_2980, 0.5, 0.5);
    float _2988 = _2982 * _2962;
    float _2990 = _2972 * _2962;
    float _2992 = fma(_2988, 0.5, 0.5);
    float _2994 = fma(_2990, -0.5, 0.5);
    float _2996 = _2976 * 0.636619746685028076171875;
    float3 _7647 = float3(_2992, _2994, _2974);
    float _2998 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7647, float3(0.0), isnan(_7647)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7647, float3(0.0), isnan(_7647)), level(0.0)).x;
    float3 _7658 = float3(_2992, _2994, _2974);
    float4 _3001 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7658, float3(0.0), isnan(_7658)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7658, float3(0.0), isnan(_7658)), level(0.0)).xyzw;
    float _3003 = _3001.x;
    float _3005 = _3001.y;
    float _3007 = _3001.z;
    float _3009 = _3001.w;
    float _3011 = -_2984;
    float _3013 = fma(_2996, _3011, 1.0);
    float2 _7680 = float2(_3013, _2986);
    float3 _3017 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7680, float2(0.0), isnan(_7680)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7680, float2(0.0), isnan(_7680)), level(0.0)).xyz;
    float _3019 = _3017.x;
    float _3021 = _3017.y;
    float _3023 = _3017.z;
    float _3025 = _2214 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _3027 = fma(_2052, (*spvDescriptorSet0.vp_c8)._m0[11].x, _3025);
    float _3029 = _2214 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _3031 = fma(_2078, (*spvDescriptorSet0.vp_c8)._m0[11].z, _3027);
    float _3033 = fma(_2052, (*spvDescriptorSet0.vp_c8)._m0[10].x, _3029);
    bool _3035 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _3037 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _3039 = _3035 || _3037;
    bool _3041 = isnan(0.5);
    bool _3043 = _3039 || _3041;
    float _3045 = _3031 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _3047 = fma(_2078, (*spvDescriptorSet0.vp_c8)._m0[10].z, _3033);
    float _3049 = 1.0 / _3045;
    float _3051 = _3047 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _3053 = _3051 + _3045;
    float _3055 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _3057 = _3031;
    if (!_3043)
    {
        _2252 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    }
    float _3059 = _2252;
    float _3061 = _2896 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3063 = exp2(_3061);
    float _3065 = _3053 * _3049;
    float _3067 = _3065 * 0.5;
    float _3069 = _3049;
    float _3071 = _3067;
    if (!_3043)
    {
        _3069 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _3073 = _3069;
    float _3075 = _3073;
    if (!_3043)
    {
        float _3077 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _3079 = fma(_3067, _3059, _3077);
        _3055 = _3079;
    }
    float _3081 = _3055;
    float _3083 = _2904 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    if (!_3043)
    {
        float _3085 = -_3073;
        float _3087 = _3085 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _3057 = _3087;
    }
    float _3089 = _3057;
    if (_3043)
    {
        _3071 = 1.0;
    }
    float _3091 = _3071;
    float _3093 = fma(_2912, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3083);
    float _3095 = _3081;
    float _3097 = _3091;
    if (!_3043)
    {
        float _3099 = 1.0 / _3081;
        _3095 = _3099;
    }
    float _3101 = _3095;
    float _3103 = fma(_2886, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3093);
    float _3105 = -_3063;
    float _3107 = _3105 + 1.0;
    float _3109 = fma(_2926, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3103);
    float _3111 = _3089;
    if (!_3043)
    {
        float _3113 = 1.0 / _3089;
        _3111 = _3113;
    }
    float _3115 = _3111;
    float _3117 = _3107 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3119 = _3109 + _2944;
    out.gl_Position.x = _2982;
    out.gl_Position.y = _2972;
    out.gl_Position.z = _3109;
    out.gl_Position.w = _2944;
    if (!_3043)
    {
        float _3121 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _3123 = -_3073;
        float _3125 = fma(_3101, _3121, _3123);
        _3075 = _3125;
    }
    float _3127 = _3075;
    float _3129 = _3119 * 0.5;
    if (!_3043)
    {
        float _3131 = _3127 * _3115;
        float _3133 = precise::clamp(_3131, 0.0, 1.0);
        _3097 = _3133;
    }
    float _3135 = _3097;
    float _3137 = _3135 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _3139 = _3135 > 0.0;
    bool _3141 = isnan(_3135);
    bool _3143 = _3139 || _3141;
    bool _3145 = isnan(0.0);
    bool _3147 = _3143 || _3145;
    out.m_68.z = _3129;
    out.m_68.w = _2944;
    float _3149 = _3137 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_47.x = _3149;
    float _3151 = _3117 * _2998;
    float _3153 = -_3117;
    float _3155 = _3153 + 1.0;
    float _3157 = _3009 * _3151;
    float _3159 = _3023 * _3151;
    float _3161 = fma(_3019, _3157, _3003);
    float _3163 = fma(_3021, _3157, _3005);
    float _3165 = _3009 * _3155;
    float _3167 = fma(_3009, _3159, _3007);
    out.m_70.x = _3161;
    out.m_70.y = _3163;
    out.m_70.z = _3167;
    out.m_70.w = _3165;
    if (_3147)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_47.x = 0.0;
    float _3169 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3169;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

