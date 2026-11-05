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
    constant _16* vp_c7 [[id(4)]];
    texture3d<float> vp_t_tcb_32 [[id(5)]];
    sampler vp_t_tcb_32Smplr [[id(6)]];
    texture3d<float> vp_t_tcb_30 [[id(7)]];
    sampler vp_t_tcb_30Smplr [[id(8)]];
    texture2d<float> vp_t_tcb_1C [[id(9)]];
    sampler vp_t_tcb_1CSmplr [[id(10)]];
    sampler vp_t_tcb_32Smplr_w [[id(11)]];
    sampler vp_t_tcb_30Smplr_w [[id(12)]];
    sampler vp_t_tcb_1CSmplr_w [[id(13)]];
    constant dm_border_t* dm_border [[id(14)]];
};

struct main0_out
{
    float4 m_60 [[user(locn0)]];
    float4 m_62 [[user(locn2)]];
    float4 m_45 [[user(locn3)]];
    float4 m_58 [[user(locn4)]];
    float4 m_64 [[user(locn6)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_53 [[attribute(1)]];
    float4 m_42 [[attribute(2)]];
    float4 m_47 [[attribute(3)]];
    float4 m_49 [[attribute(4)]];
    float4 m_51 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    bool _567 = false;
    bool _393 = false;
    bool _247 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _78 = in.m_42.w;
    float _80 = trunc(_78);
    int _83 = int(_80);
    bool _87 = _83 >= 1;
    float _89 = 0.0;
    if (!_87)
    {
        _89 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _91 = _89;
    float _93 = _91;
    if (!_87)
    {
        out.m_45.x = 0.0;
    }
    int _95 = 0;
    if (!_87)
    {
        float _97 = _91 * 5.0;
        _95 = as_type<int>(_97);
    }
    int _99 = _95;
    int _101 = _99;
    if (!_87)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1927 = as_type<float>(_99);
        out.gl_Position.z = _1927;
    }
    if (!_87)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _103 = in.m_47.w;
    bool _105 = _103 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _107 = isnan(_103);
    bool _109 = _105 || _107;
    bool _111 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _113 = _109 || _111;
    float _115 = -_103;
    float _117 = _115 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _119 = 0.0;
    float _121 = _117;
    if (_113)
    {
        float _123 = float(_83);
        _119 = _123;
    }
    float _125 = _119;
    bool _127 = _117 >= _125;
    bool _129 = !_113;
    bool _131 = _127 || _129;
    if (_131)
    {
        _93 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _133 = _93;
    if (_131)
    {
        out.m_45.x = 0.0;
    }
    if (_131)
    {
        float _135 = _133 * 5.0;
        _101 = as_type<int>(_135);
    }
    int _137 = _101;
    if (_131)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1996 = as_type<float>(_137);
        out.gl_Position.z = _1996;
    }
    if (_131)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _139 = in.m_49.x;
    float _141 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _143 = _117 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _145 = _143 * _141;
    float _147 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[20].x, _145);
    float _149 = _147 * 6.283185482025146484375;
    float _151 = floor(_147);
    int _153 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _155 = _153 != 0;
    int _157 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _159 = _157 != 0;
    float _161 = _149 * 0.15915493667125701904296875;
    int _163 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _165 = _163 != 0;
    bool _167 = !_155;
    int _169 = _167 ? 0 : 1;
    float _171 = _161 * 6.283185482025146484375;
    float _173 = cos(_171);
    int _175 = abs(_169);
    bool _177 = !_165;
    int _179 = _177 ? 0 : 1;
    bool _181 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _183 = -_151;
    float _185 = _147 + _183;
    bool _187 = !_159;
    int _189 = _187 ? 0 : 1;
    int _191 = abs(_179);
    float _193 = float(_175);
    float _195 = -_185;
    float _197 = fma(_195, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _199 = abs(_189);
    float _201 = fma(_173, 0.5, 0.5);
    bool _203 = _185 < 0.5;
    float _205 = float(_203);
    float _207 = abs(_197);
    float _209 = _193 * _207;
    float _211 = float(_191);
    float _213 = -_201;
    float _215 = fma(_213, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _217 = -_205;
    float _219 = fma(_217, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _221 = float(_199);
    float _223 = fma(_211, _215, _209);
    float _225 = abs(_219);
    float _227 = fma(_221, _225, _223);
    bool _229 = !_181;
    float _245;
    if (!_229)
    {
        float _231 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _233 = _139 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _235 = fma(_233, (*spvDescriptorSet0.vp_c9)._m0[12].x, _117);
        float _237 = _235 * _231;
        float _239 = floor(_237);
        float _241 = -_239;
        float _243 = _237 + _241;
        _245 = _243;
        _247 = true;
    }
    else
    {
        float _249 = float(_83);
        float _251 = 1.0 / _249;
        float _253 = _117 * _251;
        _245 = _253;
    }
    _247 = false;
    float _255 = _245;
    float _257 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _259 = _255 + _257;
    bool _261 = _255 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _263 = isnan(_255);
    bool _265 = _261 || _263;
    bool _267 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _269 = _265 || _267;
    float _271 = float(_269);
    bool _273 = _255 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _275 = isnan(_255);
    bool _277 = _273 || _275;
    bool _279 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _281 = _277 || _279;
    float _283 = float(_281);
    float _285 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _287 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _285;
    float _289 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _291 = _289 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _293 = -_271;
    float _295 = _293 + 1.0;
    float _297 = 1.0 / _287;
    bool _299 = _255 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _301 = isnan(_255);
    bool _303 = _299 || _301;
    bool _305 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _307 = _303 || _305;
    float _309 = float(_307);
    float _311 = _283 * _295;
    float _313 = -_283;
    float _315 = _313 + 1.0;
    bool _317 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _319 = _309 * _315;
    float _321 = 1.0 / _291;
    float _323 = -_309;
    float _325 = _323 + 1.0;
    float _327 = _259 * _297;
    float _329 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _331 = _255 + _329;
    float _333 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _335 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _333;
    float _337 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _339 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _337;
    float _341 = fma(_335, _327, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _343 = fma(_339, _327, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _345 = _331 * _321;
    float _347 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _349 = _347 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _351 = _341 * _319;
    float _353 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _355 = _353 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _357 = _343 * _319;
    float _359 = fma(_349, _345, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _361 = fma(_325, (*spvDescriptorSet0.vp_c9)._m0[143].x, _351);
    float _363 = fma(_355, _345, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _365 = fma(_325, (*spvDescriptorSet0.vp_c9)._m0[143].y, _357);
    float _367 = fma(_359, _311, _361);
    float _369 = fma(_363, _311, _365);
    float _371 = fma(_271, (*spvDescriptorSet0.vp_c9)._m0[145].x, _367);
    float _373 = fma(_271, (*spvDescriptorSet0.vp_c9)._m0[145].y, _369);
    bool _375 = !_317;
    float _391;
    if (!_375)
    {
        float _377 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _379 = _139 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _381 = fma(_379, (*spvDescriptorSet0.vp_c9)._m0[11].x, _117);
        float _383 = _381 * _377;
        float _385 = floor(_383);
        float _387 = -_385;
        float _389 = _383 + _387;
        _391 = _389;
        _393 = true;
    }
    else
    {
        float _395 = float(_83);
        float _397 = 1.0 / _395;
        float _399 = _117 * _397;
        _391 = _399;
    }
    _393 = false;
    float _401 = _391;
    float _403 = in.m_51.x;
    float _405 = in.m_51.y;
    float _407 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _409 = _401 + _407;
    bool _411 = _401 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _413 = isnan(_401);
    bool _415 = _411 || _413;
    bool _417 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _419 = _415 || _417;
    float _421 = float(_419);
    float _423 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _425 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _423;
    float _427 = -_421;
    float _429 = _427 + 1.0;
    bool _431 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _433 = 1.0 / _425;
    float _435 = _373 * _405;
    float _437 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _439 = _437 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _441 = _401 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _443 = isnan(_401);
    bool _445 = _441 || _443;
    bool _447 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _449 = _445 || _447;
    float _451 = float(_449);
    float _453 = _409 * _433;
    float _455 = 1.0 / _439;
    float _457 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _459 = _401 + _457;
    bool _461 = _401 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _463 = isnan(_401);
    bool _465 = _461 || _463;
    bool _467 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _469 = _465 || _467;
    float _471 = float(_469);
    float _473 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _475 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _473;
    float _477 = _471 * _429;
    float _479 = -_471;
    float _481 = _479 + 1.0;
    float _483 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _485 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _483;
    float _487 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _489 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _487;
    float _491 = fma(_475, _453, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _493 = _451 * _481;
    float _495 = fma(_485, _453, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _497 = fma(_489, _453, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _499 = -_451;
    float _501 = _499 + 1.0;
    float _503 = _459 * _455;
    float _505 = _495 * _493;
    float _507 = _491 * _493;
    float _509 = _497 * _493;
    float _511 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _513 = _511 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _515 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _517 = _515 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _519 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _521 = _519 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _523 = fma(_501, (*spvDescriptorSet0.vp_c9)._m0[107].x, _505);
    float _525 = fma(_513, _503, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _527 = fma(_517, _503, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _529 = fma(_521, _503, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _531 = fma(_501, (*spvDescriptorSet0.vp_c9)._m0[107].y, _507);
    float _533 = fma(_501, (*spvDescriptorSet0.vp_c9)._m0[107].z, _509);
    float _535 = fma(_525, _477, _523);
    float _537 = _371 * _403;
    float _539 = fma(_527, _477, _531);
    float _541 = fma(_529, _477, _533);
    float _543 = fma(_421, (*spvDescriptorSet0.vp_c9)._m0[109].x, _535);
    float _545 = fma(_421, (*spvDescriptorSet0.vp_c9)._m0[109].y, _539);
    float _547 = fma(_421, (*spvDescriptorSet0.vp_c9)._m0[109].z, _541);
    bool _549 = !_431;
    float _565;
    if (!_549)
    {
        float _551 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _553 = _139 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _555 = fma(_553, (*spvDescriptorSet0.vp_c9)._m0[11].y, _117);
        float _557 = _555 * _551;
        float _559 = floor(_557);
        float _561 = -_559;
        float _563 = _557 + _561;
        _565 = _563;
        _567 = true;
    }
    else
    {
        float _569 = float(_83);
        float _571 = 1.0 / _569;
        float _573 = _117 * _571;
        _565 = _573;
    }
    _567 = false;
    float _575 = _565;
    float _577 = in.m_49.z;
    float _579 = _139 * 2.0;
    float _581 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _583 = log2(_581);
    int _585 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _587 = _585 != 0;
    int _589 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _591 = _589 != 0;
    int _593 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _595 = _593 != 0;
    float _597 = in.m_49.y;
    float _599 = _227 * _537;
    float _601 = _227 * _435;
    float _603 = floor(_579);
    float _605 = _599 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _607 = _601 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _609 = _577 * 2.0;
    bool _611 = _603 > 0.0;
    float _613 = floor(_609);
    float _615 = _597 * 2.0;
    float _617 = _139 + _597;
    float _619 = _597 + _577;
    bool _621 = _603 >= 0.0;
    bool _623 = isnan(_603);
    bool _625 = _621 || _623;
    bool _627 = isnan(0.0);
    bool _629 = _625 || _627;
    float _631 = _617 + (-1.0);
    float _633 = _619 + (-1.0);
    float _635 = floor(_615);
    float _637 = fma(_631, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _639 = _583 * _117;
    float _641 = fma(_633, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _643 = _629 ? 0 : 1;
    bool _645 = _613 > 0.0;
    float _647 = exp2(_639);
    bool _649 = _613 >= 0.0;
    bool _651 = isnan(_613);
    bool _653 = _649 || _651;
    bool _655 = isnan(0.0);
    bool _657 = _653 || _655;
    int _659 = ~_643;
    int _661 = _659 + 1;
    int _663 = _661 + 1;
    int _665 = _657 ? 0 : 1;
    bool _667 = _635 > 0.0;
    int _669 = ~_665;
    int _671 = _669 + 1;
    int _673 = _671 + 1;
    bool _675 = _635 >= 0.0;
    bool _677 = isnan(_635);
    bool _679 = _675 || _677;
    bool _681 = isnan(0.0);
    bool _683 = _679 || _681;
    int _685 = _673;
    int _687 = _663;
    if (!_645)
    {
        int _689 = ~_665;
        int _691 = _689 + 1;
        _685 = _691;
    }
    int _693 = _685;
    bool _695 = !_591;
    int _697 = _695 ? 0 : 1;
    float _699 = -_647;
    float _701 = _699 + 1.0;
    bool _703 = !_587;
    int _705 = _703 ? 0 : 1;
    int _707 = abs(_697);
    float _709 = in.m_53.x;
    float _711 = in.m_53.y;
    float _713 = in.m_53.z;
    if (!_611)
    {
        int _715 = ~_643;
        int _717 = _715 + 1;
        _687 = _717;
    }
    int _719 = _687;
    float _721 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _723 = 1.0 + _721;
    int _725 = abs(_705);
    float _727 = 1.0 / _723;
    bool _729 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _731 = isnan(1.0);
    bool _733 = _729 || _731;
    bool _735 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _737 = _733 || _735;
    float _739 = float(_707);
    float _741 = float(_719);
    bool _743 = !_595;
    int _745 = _743 ? 0 : 1;
    float _747 = float(_725);
    float _749 = _739 * _741;
    float _751 = float(_693);
    int _753 = _683 ? 0 : 1;
    bool _755 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _757 = isnan(0.0);
    bool _759 = _755 || _757;
    bool _761 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _763 = _759 || _761;
    float _765 = _747 * _751;
    int _767 = abs(_745);
    float _769 = _597 + (-0.5);
    int _771 = ~_753;
    int _773 = _771 + 1;
    int _775 = _773 + 1;
    float _777 = _763 ? _701 : 0.0;
    int _779 = _775;
    if (!_667)
    {
        int _781 = ~_753;
        int _783 = _781 + 1;
        _779 = _783;
    }
    int _785 = _779;
    float _787 = _749 * (-2.0);
    float _789 = _765 * (-2.0);
    if (_737)
    {
        float _791 = _777 * _727;
        _121 = _791;
    }
    float _793 = _121;
    float _795 = fma(_787, _711, _711);
    float _797 = _139 + (-0.5);
    float _799 = fma(_789, _709, _709);
    float _801 = float(_767);
    float _803 = fma(_637, _789, _637);
    float _805 = float(_785);
    float _807 = fma(_797, (*spvDescriptorSet0.vp_c9)._m0[196].x, _799);
    float _809 = _139 + _577;
    float _811 = fma(_769, (*spvDescriptorSet0.vp_c9)._m0[196].y, _795);
    float _813 = fma(_641, _787, _641);
    float _815 = _801 * _805;
    float _817 = as_type<float>(int(gl_VertexIndex));
    float _819 = fma(_803, _793, _807);
    float _821 = _809 + (-1.0);
    float _823 = _815 * (-2.0);
    float _825 = fma(_813, _793, _811);
    float _827 = _577 + (-0.5);
    float _829 = fma(_821, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _831 = fma(_823, _713, _713);
    float _833 = _825 * 0.15915493667125701904296875;
    float _835 = _819 * 0.15915493667125701904296875;
    float _837 = fma(_829, _823, _829);
    float _839 = fma(_827, (*spvDescriptorSet0.vp_c9)._m0[196].z, _831);
    float _841 = in.m_42.x;
    float _843 = in.m_42.y;
    float _845 = in.m_42.z;
    float _847 = _835 * 6.283185482025146484375;
    float _849 = sin(_847);
    float _851 = fma(_837, _793, _839);
    float _853 = _851 * 0.15915493667125701904296875;
    float _855 = _835 * 6.283185482025146484375;
    float _857 = cos(_855);
    int _859 = as_type<int>(_817) & 1;
    bool _861 = _859 != 0;
    int _863 = as_type<int>(_817) & 2;
    bool _865 = _863 != 0;
    bool _867 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _869 = isnan(0.5);
    bool _871 = _867 || _869;
    bool _873 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _875 = _871 || _873;
    bool _877 = !_861;
    float _879 = _877 ? (-0.5) : 0.5;
    float _881 = _853 * 6.283185482025146484375;
    float _883 = sin(_881);
    bool _885 = !_865;
    float _887 = _885 ? (-0.5) : 0.5;
    bool _889 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _891 = isnan(0.5);
    bool _893 = _889 || _891;
    bool _895 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _897 = _893 || _895;
    float _899 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _879);
    float _901 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _887);
    float _903 = _843 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _905 = _853 * 6.283185482025146484375;
    float _907 = cos(_905);
    float _909 = _843 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _911 = _843 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _913 = _605 * _899;
    float _915 = _607 * _901;
    float _917 = fma(_841, (*spvDescriptorSet0.vp_c10)._m0[4].x, _903);
    float _919 = fma(_841, (*spvDescriptorSet0.vp_c10)._m0[5].x, _909);
    float _921 = _833 * 6.283185482025146484375;
    float _923 = cos(_921);
    float _925 = _849 * _883;
    float _927 = fma(_841, (*spvDescriptorSet0.vp_c10)._m0[6].x, _911);
    float _929 = _857 * _883;
    float _931 = _833 * 6.283185482025146484375;
    float _933 = sin(_931);
    float _935 = _857 * _907;
    float _937 = _849 * _907;
    float _939 = _857 * _923;
    float _941 = _849 * _923;
    float _943 = _923 * _913;
    float _945 = _941 * _915;
    float _947 = fma(_933, _925, _935);
    float _949 = -_929;
    float _951 = fma(_933, _937, _949);
    float _953 = -_937;
    float _955 = fma(_933, _929, _953);
    float _957 = fma(_933, _935, _925);
    float _959 = _947 * _915;
    float _961 = _951 * _915;
    float _963 = -_933;
    float _965 = fma(_963, _913, _945);
    float _967 = fma(_883, _943, _959);
    float _969 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _971 = fma(_907, _943, _961);
    float _973 = fma(_955, _969, _967);
    float _975 = fma(_845, (*spvDescriptorSet0.vp_c10)._m0[5].z, _919);
    float _977 = fma(_957, _969, _971);
    float _979 = fma(_845, (*spvDescriptorSet0.vp_c10)._m0[4].z, _917);
    float _981 = _973 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _983 = _975 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _985 = fma(_939, _969, _965);
    float _987 = _973 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _989 = fma(_977, (*spvDescriptorSet0.vp_c8)._m0[26].x, _981);
    float _991 = fma(_845, (*spvDescriptorSet0.vp_c10)._m0[6].z, _927);
    float _993 = _979 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _995 = _983 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _997 = fma(_977, (*spvDescriptorSet0.vp_c8)._m0[24].x, _987);
    float _999 = fma(_985, (*spvDescriptorSet0.vp_c8)._m0[26].z, _989);
    float _1001 = _991 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1003 = fma(_993, (*spvDescriptorSet0.vp_c8)._m0[11].x, _995);
    float _1005 = fma(_985, (*spvDescriptorSet0.vp_c8)._m0[24].z, _997);
    float _1007 = _999 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1009 = _973 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1011 = fma(_1001, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1003);
    float _1013 = _1005 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1015 = _1001 + _1007;
    float _1017 = fma(_977, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1009);
    float _1019 = _1011 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1021 = _993 + _1013;
    float _1023 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1025 = _1015 + _1023;
    float _1027 = _983 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1029 = 1.0 / _1019;
    float _1031 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1033 = _1021 + _1031;
    float _1035 = _1025 * _1025;
    float _1037 = fma(_985, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1017);
    float _1039 = fma(_1033, _1033, _1035);
    float _1041 = fma(_993, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1027);
    float _1043 = _1037 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1045 = sqrt(_1039);
    float _1047 = fma(_1001, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1041);
    float _1049 = _1047 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1051 = _1049 + _1019;
    float _1053 = _983 + _1043;
    float _1055 = _1051 * _1029;
    float _1057 = _1055 * 0.5;
    bool _1059 = _1045 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1061 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1063 = fma(_1057, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1061);
    float _1065 = 1.0 / _1063;
    float _1067 = _1043;
    float _1069 = _1057;
    float _1071 = _1009;
    float _1073 = _1021;
    float _1075 = _1063;
    float _1077 = _1053;
    float _1079 = _1015;
    if (!_1059)
    {
        _1067 = _1021;
    }
    float _1081 = _1067;
    float _1083 = _1081;
    if (!_1059)
    {
        _1069 = _1015;
    }
    float _1085 = _1069;
    float _1087 = _1085;
    if (!_1059)
    {
        _1071 = _1053;
    }
    float _1089 = _1071;
    bool _1091 = !_1059;
    float _1093 = _1089;
    if (!_1091)
    {
        float _1095 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1097 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1099 = _1045 + _1097;
        float _1101 = _1053 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1103 = rsqrt(_1039);
        float _1105 = _1099 * _1095;
        float _1107 = _1105 * 0.15915493667125701904296875;
        float _1109 = _1107 * 6.283185482025146484375;
        float _1111 = cos(_1109);
        float _1113 = _1107 * 6.283185482025146484375;
        float _1115 = sin(_1113);
        float _1117 = _1111 + (-1.0);
        float _1119 = _1117 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1121 = fma(_1115, _1101, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1123 = fma(_1053, _1111, _1119);
        float _1125 = _1103 * _1121;
        float _1127 = fma(_1033, _1125, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1129 = fma(_1025, _1125, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1073 = _1107;
        _1087 = _1129;
        _1083 = _1127;
        _1093 = _1123;
        _1075 = _1121;
    }
    float _1131 = _1073;
    float _1133 = _1087;
    float _1135 = _1083;
    float _1137 = _1093;
    float _1139 = _1075;
    float _1141 = _1139;
    float _1143 = _1137;
    float _1145 = _1135;
    float _1147 = _1133;
    float _1149 = _1131;
    if (_875)
    {
        _1077 = 1.0;
    }
    float _1151 = _1077;
    float _1153 = _1151;
    if (!_897)
    {
        float _1155 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1157 = _983 + _1155;
        float _1159 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1161 = _993 + _1159;
        float _1163 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1165 = -_1001;
        float _1167 = _1165 + _1133;
        float _1169 = _1157 * _1157;
        float _1171 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1173 = _1001 + _1171;
        float _1175 = fma(_1161, _1161, _1169);
        float _1177 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1179 = fma(_1173, _1173, _1175);
        float _1181 = sqrt(_1179);
        float _1183 = _1163 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1185 = precise::min(_1181, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1187 = _1185 * _1177;
        float _1189 = -_993;
        float _1191 = _1189 + _1135;
        float _1193 = _1183 * _1187;
        float _1195 = -_983;
        float _1197 = _1195 + _1137;
        float _1199 = fma(_1191, _1193, _993);
        float _1201 = fma(_1197, _1193, _983);
        float _1203 = fma(_1167, _1193, _1001);
        _1141 = _1191;
        _1079 = _1177;
        _1143 = _1201;
        _1145 = _1199;
        _1147 = _1203;
        _1149 = _1197;
    }
    float _1205 = _1141;
    float _1207 = _1079;
    float _1209 = _1143;
    float _1211 = _1145;
    float _1213 = _1147;
    float _1215 = _1149;
    float _1217 = _1207;
    float _1219 = _1215;
    float _1221 = _1205;
    if (_875)
    {
        _1217 = 1.0;
    }
    float _1223 = _1217;
    float _1225 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1227 = _1065 * _1225;
    float _1229 = _1223;
    if (!_875)
    {
        float _1231 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1233 = _1231 * 0.15915493667125701904296875;
        float _1235 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1237 = _1233 * 6.283185482025146484375;
        float _1239 = cos(_1237);
        float _1241 = _1235 * 0.15915493667125701904296875;
        float _1243 = _1233 * 6.283185482025146484375;
        float _1245 = sin(_1243);
        float _1247 = 1.0 / _1239;
        float _1249 = _1241 * 6.283185482025146484375;
        float _1251 = cos(_1249);
        float _1253 = _1245 * _1247;
        float _1255 = _1241 * 6.283185482025146484375;
        float _1257 = sin(_1255);
        float _1259 = _1251 * _1253;
        float _1261 = 1.0 / _1259;
        float _1263 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1265 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1263;
        float _1267 = 1.0 / _1265;
        float _1269 = _1257 * _1261;
        float _1271 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1273 = fma(_1227, _1269, _1271);
        float _1275 = _1273 * _1267;
        float _1277 = precise::clamp(_1275, 0.0, 1.0);
        _1219 = _1241;
        _1221 = _1247;
        _1153 = _1277;
    }
    float _1279 = _1219;
    float _1281 = _1221;
    float _1283 = _1153;
    float _1285 = _1279;
    float _1287 = _1281;
    if (!_875)
    {
        float _1289 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1291 = _1289 * 0.15915493667125701904296875;
        float _1293 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1295 = _1291 * 6.283185482025146484375;
        float _1297 = cos(_1295);
        float _1299 = _1293 * 0.15915493667125701904296875;
        float _1301 = _1291 * 6.283185482025146484375;
        float _1303 = sin(_1301);
        float _1305 = 1.0 / _1297;
        float _1307 = _1299 * 6.283185482025146484375;
        float _1309 = cos(_1307);
        float _1311 = _1303 * _1305;
        float _1313 = _1299 * 6.283185482025146484375;
        float _1315 = sin(_1313);
        float _1317 = _1309 * _1311;
        float _1319 = 1.0 / _1317;
        float _1321 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1323 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1321;
        float _1325 = 1.0 / _1323;
        float _1327 = _1315 * _1319;
        float _1329 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1331 = fma(_1227, _1327, _1329);
        float _1333 = _1331 * _1325;
        float _1335 = precise::clamp(_1333, 0.0, 1.0);
        float _1337 = -_1335;
        float _1339 = _1337 + 1.0;
        _1285 = _1303;
        _1287 = _1291;
        _1229 = _1339;
    }
    float _1341 = _1285;
    float _1343 = _1287;
    float _1345 = _1229;
    float _1347 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1349 = _1209 + _1347;
    float _1351 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1353 = _1211 + _1351;
    float _1355 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1357 = _1213 + _1355;
    float _1359 = _1349 * _1349;
    float _1361 = fma(_1353, _1353, _1359);
    float _1363 = fma(_1357, _1357, _1361);
    float _1365 = rsqrt(_1363);
    float _1367 = sqrt(_1363);
    float _1369 = _1365 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1371 = _1353 * _1369;
    float _1373 = _1357 * _1369;
    float _1375 = _1371 * _1371;
    float _1377 = _1373 * _1373;
    float _1379 = _1375 + _1377;
    float _1381 = sqrt(_1379);
    bool _1383 = _1381 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1385 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1387 = _1381 + _1385;
    float _1389 = _1365;
    float _1391 = _1343;
    float _1393 = _1387;
    float _1395 = _1341;
    float _1397 = _1349;
    float _1399 = _1369;
    if (_1383)
    {
        float _1401 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1389 = _1401;
    }
    float _1403 = _1389;
    if (_1383)
    {
        float _1405 = rsqrt(_1379);
        _1391 = _1405;
    }
    float _1407 = _1391;
    float _1409 = _1407;
    if (_1383)
    {
        float _1411 = _1387 * _1403;
        _1393 = _1411;
    }
    float _1413 = _1393;
    if (_1383)
    {
        float _1415 = _1413 * 0.15915493667125701904296875;
        _1395 = _1415;
    }
    float _1417 = _1395;
    float _1419 = _1403;
    float _1421 = _1417;
    if (_1383)
    {
        float _1423 = _1417 * 6.283185482025146484375;
        float _1425 = sin(_1423);
        _1419 = _1425;
    }
    float _1427 = _1419;
    float _1429 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1431 = precise::max(0.0, _1429);
    float _1433 = _1357;
    float _1435 = _1431;
    if (_1383)
    {
        float _1437 = _1417 * 6.283185482025146484375;
        float _1439 = cos(_1437);
        _1433 = _1439;
    }
    float _1441 = _1433;
    float _1443 = -_1369;
    float _1445 = -_1431;
    float _1447 = fma(_1349, _1443, _1445);
    if (!_1383)
    {
        _1397 = _1373;
    }
    float _1449 = _1397;
    float _1451 = _1449;
    if (_1383)
    {
        float _1453 = _1447 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1435 = _1453;
    }
    float _1455 = _1435;
    float _1457 = _1427;
    float _1459 = _1455;
    if (_1383)
    {
        float _1461 = fma(_1427, _1455, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1457 = _1461;
    }
    float _1463 = _1457;
    float _1465 = _1463;
    float _1467 = _1441;
    if (_1383)
    {
        float _1469 = _1441 + (-1.0);
        _1459 = _1469;
    }
    float _1471 = _1459;
    float _1473 = _1471;
    if (_1383)
    {
        float _1475 = _1407 * _1463;
        _1399 = _1475;
    }
    float _1477 = _1399;
    if (!_1383)
    {
        _1409 = _1371;
    }
    float _1479 = _1409;
    float _1481 = _1479;
    if (_1383)
    {
        float _1483 = _1471 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1421 = _1483;
    }
    float _1485 = _1421;
    if (_1383)
    {
        float _1487 = _1371 * _1477;
        _1481 = _1487;
    }
    float _1489 = _1481;
    if (!_1383)
    {
        _1465 = _1447;
    }
    float _1491 = _1465;
    float _1493 = _1491;
    if (_1383)
    {
        float _1495 = _1373 * _1477;
        _1451 = _1495;
    }
    float _1497 = _1451;
    if (!_1383)
    {
        _1473 = _1375;
    }
    float _1499 = _1473;
    float _1501 = _1499;
    if (_1383)
    {
        float _1503 = fma(_1447, _1441, _1485);
        _1493 = _1503;
    }
    float _1505 = _1493;
    if (_1383)
    {
        float _1507 = _1489 * _1489;
        _1501 = _1507;
    }
    float _1509 = _1501;
    if (!_1383)
    {
        _1467 = _1377;
    }
    float _1511 = _1467;
    float _1513 = _1511;
    if (_1383)
    {
        float _1515 = _1497 * _1497;
        _1513 = _1515;
    }
    float _1517 = _1513;
    float _1519 = fma(_1505, _1505, _1509);
    float _1521 = _1209 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1523 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1525 = _1209 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1527 = _1519 + _1517;
    float _1529 = fma(_1211, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1521);
    float _1531 = _1209 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1533 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1535 = fma(_1367, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1533);
    float _1537 = precise::clamp(_1535, 0.0, 1.0);
    float _1539 = rsqrt(_1527);
    float _1541 = fma(_1211, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1525);
    float _1543 = fma(_1211, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1531);
    float _1545 = fma(_1213, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1529);
    float _1547 = -_1537;
    float _1549 = _1547 + 1.0;
    float _1551 = _1209 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1553 = fma(_1213, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1543);
    float _1555 = fma(_1213, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1541);
    float _1557 = _1545 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1559 = fma(_1211, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1551);
    float _1561 = _1553 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1563 = abs(_1549);
    float _1565 = log2(_1563);
    float _1567 = _1555 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1569 = fma(_1213, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1559);
    float _1571 = _1561 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1573 = _1557 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1575 = _1539 * _1489;
    float _1577 = _1539 * _1505;
    float _1579 = fma(_1567, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1571);
    float _1581 = _1539 * _1497;
    float _1583 = _1575 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1585 = _1569 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1587 = fma(_1557, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1579);
    float _1589 = -_1573;
    float _1591 = fma(_1589, _1523, 1.0);
    float _1593 = -_1583;
    float _1595 = fma(_1577, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1593);
    float _1597 = _1561 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1599 = fma(_1585, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1587);
    float _1601 = _1565 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1603 = -_1581;
    float _1605 = fma(_1603, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1595);
    float _1607 = log2(_1591);
    float _1609 = _1561 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1611 = fma(_1605, -0.5, 0.5);
    float _1613 = fma(_1605, 0.5, 0.5);
    float _1615 = fma(_1567, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1609);
    float _1617 = _1577 + 1.0;
    float _1619 = 1.0 / _1599;
    float _1621 = fma(_1557, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1615);
    float _1623 = fma(_1613, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1625 = fma(_1585, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1621);
    float _1627 = fma(_1613, _1623, -0.212114393711090087890625);
    float _1629 = exp2(_1601);
    float _1631 = _1607 * 0.693147182464599609375;
    float _1633 = fma(_1613, _1627, 1.570728778839111328125);
    float _1635 = sqrt(_1611);
    float _1637 = fma(_1567, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1597);
    float _1639 = _1625 * _1619;
    float _1641 = fma(_1557, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1637);
    float _1643 = fma(_1639, 0.5, 0.5);
    float _1645 = -_1577;
    float _1647 = fma(_1629, _1617, _1645);
    float _1649 = fma(_1585, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1641);
    float _1651 = fma(_1647, 0.5, 0.5);
    float _1653 = _1649 * _1619;
    float _1655 = _1631 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1657 = _1635 * 0.636619746685028076171875;
    float _1659 = fma(_1653, -0.5, 0.5);
    float _1661 = -_1633;
    float _1663 = fma(_1657, _1661, 1.0);
    float3 _4310 = float3(_1643, _1659, _1655);
    float _1665 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4310, float3(0.0), isnan(_4310)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4310, float3(0.0), isnan(_4310)), level(0.0)).x;
    float3 _4321 = float3(_1643, _1659, _1655);
    float4 _1668 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4321, float3(0.0), isnan(_4321)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4321, float3(0.0), isnan(_4321)), level(0.0)).xyzw;
    float _1670 = _1668.x;
    float _1672 = _1668.y;
    float _1674 = _1668.z;
    float _1676 = _1668.w;
    float2 _4338 = float2(_1663, _1651);
    float3 _1680 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4338, float2(0.0), isnan(_4338)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4338, float2(0.0), isnan(_4338)), level(0.0)).xyz;
    float _1682 = _1680.x;
    float _1684 = _1680.y;
    float _1686 = _1680.z;
    float _1688 = _1561 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1690 = _547 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    bool _1692 = _597 > 0.5;
    float _1694 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1696 = _1694 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    int _1698 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1700 = _1698 != 0;
    float _1702 = fma(_1567, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1688);
    int _1704 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1706 = _1704 != 0;
    float _1708 = _545 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1710 = -_887;
    int _1712 = _1692 ? as_type<int>(_1710) : as_type<int>(_887);
    float _1714 = 1.0 / _1696;
    float _1716 = _543 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    bool _1718 = !_1706;
    float _1720 = _1718 ? _887 : as_type<float>(_1712);
    float _1722 = _1565 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _1724 = _139 > 0.5;
    float _1726 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1728 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1726;
    bool _1730 = _575 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1732 = isnan(_575);
    bool _1734 = _1730 || _1732;
    bool _1736 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1738 = _1734 || _1736;
    float _1740 = float(_1738);
    float _1742 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1744 = -_879;
    int _1746 = _1724 ? as_type<int>(_1744) : as_type<int>(_879);
    float _1748 = -_1720;
    float _1750 = _1748 + 0.5;
    float _1752 = fma(_1557, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1702);
    bool _1754 = _1283 > 0.0;
    bool _1756 = isnan(_1283);
    bool _1758 = _1754 || _1756;
    bool _1760 = isnan(0.0);
    bool _1762 = _1758 || _1760;
    bool _1764 = !_1700;
    float _1766 = _1764 ? _879 : as_type<float>(_1746);
    float _1768 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1770 = _575 + _1768;
    float _1772 = exp2(_1722);
    float _1774 = _1728 * _1714;
    bool _1776 = _575 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1778 = isnan(_575);
    bool _1780 = _1776 || _1778;
    bool _1782 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1784 = _1780 || _1782;
    float _1786 = float(_1784);
    float _1788 = -_1740;
    float _1790 = _1788 + 1.0;
    float _1792 = _1766 + 0.5;
    float _1794 = fma(_1774, _1770, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1796 = _1750 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1798 = _1786 * _1790;
    float _1800 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1802 = -_1786;
    float _1804 = _1802 + 1.0;
    float _1806 = _1792 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1808 = _1794 * _1798;
    float _1810 = _1283 * _1345;
    float _1812 = _1796 * _1742;
    float _1814 = _1690 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1816 = fma(_1804, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1808);
    float _1818 = -_1772;
    float _1820 = _1818 + 1.0;
    float _1822 = _1810 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1824 = fma(_1585, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1752);
    bool _1826 = _1345 <= 0.0;
    bool _1828 = !_1762;
    bool _1830 = _1826 || _1828;
    float _1832 = _1820 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1834 = _227 * _1822;
    float _1836 = _1824 + _1599;
    float _1838 = fma(_1740, (*spvDescriptorSet0.vp_c9)._m0[116].x, _1816);
    float _1840 = _1806 * _1800;
    float _1842 = _1708 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1844 = _1716 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1846 = _1838 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_58.x = _1840;
    out.m_58.y = _1812;
    out.m_60.x = _1844;
    out.m_60.y = _1842;
    out.m_60.z = _1814;
    out.m_60.w = _1846;
    out.gl_Position.x = _1625;
    out.gl_Position.y = _1649;
    out.gl_Position.z = _1824;
    out.gl_Position.w = _1599;
    float _1848 = _1834 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1850 = _1836 * 0.5;
    float _1852 = -_1832;
    float _1854 = _1852 + 1.0;
    out.m_45.x = _1848;
    out.m_62.z = _1850;
    out.m_62.w = _1599;
    float _1856 = _1832 * _1665;
    float _1858 = _1676 * _1856;
    float _1860 = _1686 * _1856;
    float _1862 = fma(_1682, _1858, _1670);
    float _1864 = fma(_1684, _1858, _1672);
    float _1866 = _1676 * _1854;
    float _1868 = fma(_1676, _1860, _1674);
    out.m_64.x = _1862;
    out.m_64.y = _1864;
    out.m_64.z = _1868;
    out.m_64.w = _1866;
    if (!_1830)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_45.x = 0.0;
    float _1870 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1870;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    bool _567 = false;
    bool _393 = false;
    bool _247 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _78 = in.m_42.w;
    float _80 = trunc(_78);
    int _83 = int(_80);
    bool _87 = _83 >= 1;
    float _89 = 0.0;
    if (!_87)
    {
        _89 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _91 = _89;
    float _93 = _91;
    if (!_87)
    {
        out.m_45.x = 0.0;
    }
    int _95 = 0;
    if (!_87)
    {
        float _97 = _91 * 5.0;
        _95 = as_type<int>(_97);
    }
    int _99 = _95;
    int _101 = _99;
    if (!_87)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1927 = as_type<float>(_99);
        out.gl_Position.z = _1927;
    }
    if (!_87)
    {
        return out;
    }
    float _103 = in.m_47.w;
    bool _105 = _103 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _107 = isnan(_103);
    bool _109 = _105 || _107;
    bool _111 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _113 = _109 || _111;
    float _115 = -_103;
    float _117 = _115 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _119 = 0.0;
    float _121 = _117;
    if (_113)
    {
        float _123 = float(_83);
        _119 = _123;
    }
    float _125 = _119;
    bool _127 = _117 >= _125;
    bool _129 = !_113;
    bool _131 = _127 || _129;
    if (_131)
    {
        _93 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _133 = _93;
    if (_131)
    {
        out.m_45.x = 0.0;
    }
    if (_131)
    {
        float _135 = _133 * 5.0;
        _101 = as_type<int>(_135);
    }
    int _137 = _101;
    if (_131)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1996 = as_type<float>(_137);
        out.gl_Position.z = _1996;
    }
    if (_131)
    {
        return out;
    }
    float _139 = in.m_49.x;
    float _141 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _143 = _117 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _145 = _143 * _141;
    float _147 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[20].x, _145);
    float _149 = _147 * 6.283185482025146484375;
    float _151 = floor(_147);
    int _153 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _155 = _153 != 0;
    int _157 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _159 = _157 != 0;
    float _161 = _149 * 0.15915493667125701904296875;
    int _163 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _165 = _163 != 0;
    bool _167 = !_155;
    int _169 = _167 ? 0 : 1;
    float _171 = _161 * 6.283185482025146484375;
    float _173 = cos(_171);
    int _175 = abs(_169);
    bool _177 = !_165;
    int _179 = _177 ? 0 : 1;
    bool _181 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _183 = -_151;
    float _185 = _147 + _183;
    bool _187 = !_159;
    int _189 = _187 ? 0 : 1;
    int _191 = abs(_179);
    float _193 = float(_175);
    float _195 = -_185;
    float _197 = fma(_195, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _199 = abs(_189);
    float _201 = fma(_173, 0.5, 0.5);
    bool _203 = _185 < 0.5;
    float _205 = float(_203);
    float _207 = abs(_197);
    float _209 = _193 * _207;
    float _211 = float(_191);
    float _213 = -_201;
    float _215 = fma(_213, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _217 = -_205;
    float _219 = fma(_217, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _221 = float(_199);
    float _223 = fma(_211, _215, _209);
    float _225 = abs(_219);
    float _227 = fma(_221, _225, _223);
    bool _229 = !_181;
    float _245;
    if (!_229)
    {
        float _231 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _233 = _139 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _235 = fma(_233, (*spvDescriptorSet0.vp_c9)._m0[12].x, _117);
        float _237 = _235 * _231;
        float _239 = floor(_237);
        float _241 = -_239;
        float _243 = _237 + _241;
        _245 = _243;
        _247 = true;
    }
    else
    {
        float _249 = float(_83);
        float _251 = 1.0 / _249;
        float _253 = _117 * _251;
        _245 = _253;
    }
    _247 = false;
    float _255 = _245;
    float _257 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _259 = _255 + _257;
    bool _261 = _255 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _263 = isnan(_255);
    bool _265 = _261 || _263;
    bool _267 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _269 = _265 || _267;
    float _271 = float(_269);
    bool _273 = _255 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _275 = isnan(_255);
    bool _277 = _273 || _275;
    bool _279 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _281 = _277 || _279;
    float _283 = float(_281);
    float _285 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _287 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _285;
    float _289 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _291 = _289 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _293 = -_271;
    float _295 = _293 + 1.0;
    float _297 = 1.0 / _287;
    bool _299 = _255 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _301 = isnan(_255);
    bool _303 = _299 || _301;
    bool _305 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _307 = _303 || _305;
    float _309 = float(_307);
    float _311 = _283 * _295;
    float _313 = -_283;
    float _315 = _313 + 1.0;
    bool _317 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _319 = _309 * _315;
    float _321 = 1.0 / _291;
    float _323 = -_309;
    float _325 = _323 + 1.0;
    float _327 = _259 * _297;
    float _329 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _331 = _255 + _329;
    float _333 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _335 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _333;
    float _337 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _339 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _337;
    float _341 = fma(_335, _327, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _343 = fma(_339, _327, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _345 = _331 * _321;
    float _347 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _349 = _347 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _351 = _341 * _319;
    float _353 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _355 = _353 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _357 = _343 * _319;
    float _359 = fma(_349, _345, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _361 = fma(_325, (*spvDescriptorSet0.vp_c9)._m0[143].x, _351);
    float _363 = fma(_355, _345, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _365 = fma(_325, (*spvDescriptorSet0.vp_c9)._m0[143].y, _357);
    float _367 = fma(_359, _311, _361);
    float _369 = fma(_363, _311, _365);
    float _371 = fma(_271, (*spvDescriptorSet0.vp_c9)._m0[145].x, _367);
    float _373 = fma(_271, (*spvDescriptorSet0.vp_c9)._m0[145].y, _369);
    bool _375 = !_317;
    float _391;
    if (!_375)
    {
        float _377 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _379 = _139 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _381 = fma(_379, (*spvDescriptorSet0.vp_c9)._m0[11].x, _117);
        float _383 = _381 * _377;
        float _385 = floor(_383);
        float _387 = -_385;
        float _389 = _383 + _387;
        _391 = _389;
        _393 = true;
    }
    else
    {
        float _395 = float(_83);
        float _397 = 1.0 / _395;
        float _399 = _117 * _397;
        _391 = _399;
    }
    _393 = false;
    float _401 = _391;
    float _403 = in.m_51.x;
    float _405 = in.m_51.y;
    float _407 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _409 = _401 + _407;
    bool _411 = _401 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _413 = isnan(_401);
    bool _415 = _411 || _413;
    bool _417 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _419 = _415 || _417;
    float _421 = float(_419);
    float _423 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _425 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _423;
    float _427 = -_421;
    float _429 = _427 + 1.0;
    bool _431 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _433 = 1.0 / _425;
    float _435 = _373 * _405;
    float _437 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _439 = _437 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _441 = _401 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _443 = isnan(_401);
    bool _445 = _441 || _443;
    bool _447 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _449 = _445 || _447;
    float _451 = float(_449);
    float _453 = _409 * _433;
    float _455 = 1.0 / _439;
    float _457 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _459 = _401 + _457;
    bool _461 = _401 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _463 = isnan(_401);
    bool _465 = _461 || _463;
    bool _467 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _469 = _465 || _467;
    float _471 = float(_469);
    float _473 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _475 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _473;
    float _477 = _471 * _429;
    float _479 = -_471;
    float _481 = _479 + 1.0;
    float _483 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _485 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _483;
    float _487 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _489 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _487;
    float _491 = fma(_475, _453, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _493 = _451 * _481;
    float _495 = fma(_485, _453, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _497 = fma(_489, _453, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _499 = -_451;
    float _501 = _499 + 1.0;
    float _503 = _459 * _455;
    float _505 = _495 * _493;
    float _507 = _491 * _493;
    float _509 = _497 * _493;
    float _511 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _513 = _511 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _515 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _517 = _515 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _519 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _521 = _519 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _523 = fma(_501, (*spvDescriptorSet0.vp_c9)._m0[107].x, _505);
    float _525 = fma(_513, _503, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _527 = fma(_517, _503, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _529 = fma(_521, _503, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _531 = fma(_501, (*spvDescriptorSet0.vp_c9)._m0[107].y, _507);
    float _533 = fma(_501, (*spvDescriptorSet0.vp_c9)._m0[107].z, _509);
    float _535 = fma(_525, _477, _523);
    float _537 = _371 * _403;
    float _539 = fma(_527, _477, _531);
    float _541 = fma(_529, _477, _533);
    float _543 = fma(_421, (*spvDescriptorSet0.vp_c9)._m0[109].x, _535);
    float _545 = fma(_421, (*spvDescriptorSet0.vp_c9)._m0[109].y, _539);
    float _547 = fma(_421, (*spvDescriptorSet0.vp_c9)._m0[109].z, _541);
    bool _549 = !_431;
    float _565;
    if (!_549)
    {
        float _551 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _553 = _139 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _555 = fma(_553, (*spvDescriptorSet0.vp_c9)._m0[11].y, _117);
        float _557 = _555 * _551;
        float _559 = floor(_557);
        float _561 = -_559;
        float _563 = _557 + _561;
        _565 = _563;
        _567 = true;
    }
    else
    {
        float _569 = float(_83);
        float _571 = 1.0 / _569;
        float _573 = _117 * _571;
        _565 = _573;
    }
    _567 = false;
    float _575 = _565;
    float _577 = in.m_49.z;
    float _579 = _139 * 2.0;
    float _581 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _583 = log2(_581);
    int _585 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _587 = _585 != 0;
    int _589 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _591 = _589 != 0;
    int _593 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _595 = _593 != 0;
    float _597 = in.m_49.y;
    float _599 = _227 * _537;
    float _601 = _227 * _435;
    float _603 = floor(_579);
    float _605 = _599 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _607 = _601 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _609 = _577 * 2.0;
    bool _611 = _603 > 0.0;
    float _613 = floor(_609);
    float _615 = _597 * 2.0;
    float _617 = _139 + _597;
    float _619 = _597 + _577;
    bool _621 = _603 >= 0.0;
    bool _623 = isnan(_603);
    bool _625 = _621 || _623;
    bool _627 = isnan(0.0);
    bool _629 = _625 || _627;
    float _631 = _617 + (-1.0);
    float _633 = _619 + (-1.0);
    float _635 = floor(_615);
    float _637 = fma(_631, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _639 = _583 * _117;
    float _641 = fma(_633, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _643 = _629 ? 0 : 1;
    bool _645 = _613 > 0.0;
    float _647 = exp2(_639);
    bool _649 = _613 >= 0.0;
    bool _651 = isnan(_613);
    bool _653 = _649 || _651;
    bool _655 = isnan(0.0);
    bool _657 = _653 || _655;
    int _659 = ~_643;
    int _661 = _659 + 1;
    int _663 = _661 + 1;
    int _665 = _657 ? 0 : 1;
    bool _667 = _635 > 0.0;
    int _669 = ~_665;
    int _671 = _669 + 1;
    int _673 = _671 + 1;
    bool _675 = _635 >= 0.0;
    bool _677 = isnan(_635);
    bool _679 = _675 || _677;
    bool _681 = isnan(0.0);
    bool _683 = _679 || _681;
    int _685 = _673;
    int _687 = _663;
    if (!_645)
    {
        int _689 = ~_665;
        int _691 = _689 + 1;
        _685 = _691;
    }
    int _693 = _685;
    bool _695 = !_591;
    int _697 = _695 ? 0 : 1;
    float _699 = -_647;
    float _701 = _699 + 1.0;
    bool _703 = !_587;
    int _705 = _703 ? 0 : 1;
    int _707 = abs(_697);
    float _709 = in.m_53.x;
    float _711 = in.m_53.y;
    float _713 = in.m_53.z;
    if (!_611)
    {
        int _715 = ~_643;
        int _717 = _715 + 1;
        _687 = _717;
    }
    int _719 = _687;
    float _721 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _723 = 1.0 + _721;
    int _725 = abs(_705);
    float _727 = 1.0 / _723;
    bool _729 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _731 = isnan(1.0);
    bool _733 = _729 || _731;
    bool _735 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _737 = _733 || _735;
    float _739 = float(_707);
    float _741 = float(_719);
    bool _743 = !_595;
    int _745 = _743 ? 0 : 1;
    float _747 = float(_725);
    float _749 = _739 * _741;
    float _751 = float(_693);
    int _753 = _683 ? 0 : 1;
    bool _755 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _757 = isnan(0.0);
    bool _759 = _755 || _757;
    bool _761 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _763 = _759 || _761;
    float _765 = _747 * _751;
    int _767 = abs(_745);
    float _769 = _597 + (-0.5);
    int _771 = ~_753;
    int _773 = _771 + 1;
    int _775 = _773 + 1;
    float _777 = _763 ? _701 : 0.0;
    int _779 = _775;
    if (!_667)
    {
        int _781 = ~_753;
        int _783 = _781 + 1;
        _779 = _783;
    }
    int _785 = _779;
    float _787 = _749 * (-2.0);
    float _789 = _765 * (-2.0);
    if (_737)
    {
        float _791 = _777 * _727;
        _121 = _791;
    }
    float _793 = _121;
    float _795 = fma(_787, _711, _711);
    float _797 = _139 + (-0.5);
    float _799 = fma(_789, _709, _709);
    float _801 = float(_767);
    float _803 = fma(_637, _789, _637);
    float _805 = float(_785);
    float _807 = fma(_797, (*spvDescriptorSet0.vp_c9)._m0[196].x, _799);
    float _809 = _139 + _577;
    float _811 = fma(_769, (*spvDescriptorSet0.vp_c9)._m0[196].y, _795);
    float _813 = fma(_641, _787, _641);
    float _815 = _801 * _805;
    float _817 = as_type<float>(int(gl_VertexIndex));
    float _819 = fma(_803, _793, _807);
    float _821 = _809 + (-1.0);
    float _823 = _815 * (-2.0);
    float _825 = fma(_813, _793, _811);
    float _827 = _577 + (-0.5);
    float _829 = fma(_821, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _831 = fma(_823, _713, _713);
    float _833 = _825 * 0.15915493667125701904296875;
    float _835 = _819 * 0.15915493667125701904296875;
    float _837 = fma(_829, _823, _829);
    float _839 = fma(_827, (*spvDescriptorSet0.vp_c9)._m0[196].z, _831);
    float _841 = in.m_42.x;
    float _843 = in.m_42.y;
    float _845 = in.m_42.z;
    float _847 = _835 * 6.283185482025146484375;
    float _849 = sin(_847);
    float _851 = fma(_837, _793, _839);
    float _853 = _851 * 0.15915493667125701904296875;
    float _855 = _835 * 6.283185482025146484375;
    float _857 = cos(_855);
    int _859 = as_type<int>(_817) & 1;
    bool _861 = _859 != 0;
    int _863 = as_type<int>(_817) & 2;
    bool _865 = _863 != 0;
    bool _867 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _869 = isnan(0.5);
    bool _871 = _867 || _869;
    bool _873 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _875 = _871 || _873;
    bool _877 = !_861;
    float _879 = _877 ? (-0.5) : 0.5;
    float _881 = _853 * 6.283185482025146484375;
    float _883 = sin(_881);
    bool _885 = !_865;
    float _887 = _885 ? (-0.5) : 0.5;
    bool _889 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _891 = isnan(0.5);
    bool _893 = _889 || _891;
    bool _895 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _897 = _893 || _895;
    float _899 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _879);
    float _901 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _887);
    float _903 = _843 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _905 = _853 * 6.283185482025146484375;
    float _907 = cos(_905);
    float _909 = _843 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _911 = _843 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _913 = _605 * _899;
    float _915 = _607 * _901;
    float _917 = fma(_841, (*spvDescriptorSet0.vp_c10)._m0[4].x, _903);
    float _919 = fma(_841, (*spvDescriptorSet0.vp_c10)._m0[5].x, _909);
    float _921 = _833 * 6.283185482025146484375;
    float _923 = cos(_921);
    float _925 = _849 * _883;
    float _927 = fma(_841, (*spvDescriptorSet0.vp_c10)._m0[6].x, _911);
    float _929 = _857 * _883;
    float _931 = _833 * 6.283185482025146484375;
    float _933 = sin(_931);
    float _935 = _857 * _907;
    float _937 = _849 * _907;
    float _939 = _857 * _923;
    float _941 = _849 * _923;
    float _943 = _923 * _913;
    float _945 = _941 * _915;
    float _947 = fma(_933, _925, _935);
    float _949 = -_929;
    float _951 = fma(_933, _937, _949);
    float _953 = -_937;
    float _955 = fma(_933, _929, _953);
    float _957 = fma(_933, _935, _925);
    float _959 = _947 * _915;
    float _961 = _951 * _915;
    float _963 = -_933;
    float _965 = fma(_963, _913, _945);
    float _967 = fma(_883, _943, _959);
    float _969 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _971 = fma(_907, _943, _961);
    float _973 = fma(_955, _969, _967);
    float _975 = fma(_845, (*spvDescriptorSet0.vp_c10)._m0[5].z, _919);
    float _977 = fma(_957, _969, _971);
    float _979 = fma(_845, (*spvDescriptorSet0.vp_c10)._m0[4].z, _917);
    float _981 = _973 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _983 = _975 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _985 = fma(_939, _969, _965);
    float _987 = _973 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _989 = fma(_977, (*spvDescriptorSet0.vp_c8)._m0[26].x, _981);
    float _991 = fma(_845, (*spvDescriptorSet0.vp_c10)._m0[6].z, _927);
    float _993 = _979 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _995 = _983 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _997 = fma(_977, (*spvDescriptorSet0.vp_c8)._m0[24].x, _987);
    float _999 = fma(_985, (*spvDescriptorSet0.vp_c8)._m0[26].z, _989);
    float _1001 = _991 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1003 = fma(_993, (*spvDescriptorSet0.vp_c8)._m0[11].x, _995);
    float _1005 = fma(_985, (*spvDescriptorSet0.vp_c8)._m0[24].z, _997);
    float _1007 = _999 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1009 = _973 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1011 = fma(_1001, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1003);
    float _1013 = _1005 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1015 = _1001 + _1007;
    float _1017 = fma(_977, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1009);
    float _1019 = _1011 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1021 = _993 + _1013;
    float _1023 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1025 = _1015 + _1023;
    float _1027 = _983 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1029 = 1.0 / _1019;
    float _1031 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1033 = _1021 + _1031;
    float _1035 = _1025 * _1025;
    float _1037 = fma(_985, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1017);
    float _1039 = fma(_1033, _1033, _1035);
    float _1041 = fma(_993, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1027);
    float _1043 = _1037 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1045 = sqrt(_1039);
    float _1047 = fma(_1001, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1041);
    float _1049 = _1047 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1051 = _1049 + _1019;
    float _1053 = _983 + _1043;
    float _1055 = _1051 * _1029;
    float _1057 = _1055 * 0.5;
    bool _1059 = _1045 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1061 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1063 = fma(_1057, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1061);
    float _1065 = 1.0 / _1063;
    float _1067 = _1043;
    float _1069 = _1057;
    float _1071 = _1009;
    float _1073 = _1021;
    float _1075 = _1063;
    float _1077 = _1053;
    float _1079 = _1015;
    if (!_1059)
    {
        _1067 = _1021;
    }
    float _1081 = _1067;
    float _1083 = _1081;
    if (!_1059)
    {
        _1069 = _1015;
    }
    float _1085 = _1069;
    float _1087 = _1085;
    if (!_1059)
    {
        _1071 = _1053;
    }
    float _1089 = _1071;
    bool _1091 = !_1059;
    float _1093 = _1089;
    if (!_1091)
    {
        float _1095 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1097 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1099 = _1045 + _1097;
        float _1101 = _1053 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1103 = rsqrt(_1039);
        float _1105 = _1099 * _1095;
        float _1107 = _1105 * 0.15915493667125701904296875;
        float _1109 = _1107 * 6.283185482025146484375;
        float _1111 = cos(_1109);
        float _1113 = _1107 * 6.283185482025146484375;
        float _1115 = sin(_1113);
        float _1117 = _1111 + (-1.0);
        float _1119 = _1117 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1121 = fma(_1115, _1101, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1123 = fma(_1053, _1111, _1119);
        float _1125 = _1103 * _1121;
        float _1127 = fma(_1033, _1125, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1129 = fma(_1025, _1125, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1073 = _1107;
        _1087 = _1129;
        _1083 = _1127;
        _1093 = _1123;
        _1075 = _1121;
    }
    float _1131 = _1073;
    float _1133 = _1087;
    float _1135 = _1083;
    float _1137 = _1093;
    float _1139 = _1075;
    float _1141 = _1139;
    float _1143 = _1137;
    float _1145 = _1135;
    float _1147 = _1133;
    float _1149 = _1131;
    if (_875)
    {
        _1077 = 1.0;
    }
    float _1151 = _1077;
    float _1153 = _1151;
    if (!_897)
    {
        float _1155 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1157 = _983 + _1155;
        float _1159 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1161 = _993 + _1159;
        float _1163 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1165 = -_1001;
        float _1167 = _1165 + _1133;
        float _1169 = _1157 * _1157;
        float _1171 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1173 = _1001 + _1171;
        float _1175 = fma(_1161, _1161, _1169);
        float _1177 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1179 = fma(_1173, _1173, _1175);
        float _1181 = sqrt(_1179);
        float _1183 = _1163 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1185 = precise::min(_1181, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1187 = _1185 * _1177;
        float _1189 = -_993;
        float _1191 = _1189 + _1135;
        float _1193 = _1183 * _1187;
        float _1195 = -_983;
        float _1197 = _1195 + _1137;
        float _1199 = fma(_1191, _1193, _993);
        float _1201 = fma(_1197, _1193, _983);
        float _1203 = fma(_1167, _1193, _1001);
        _1141 = _1191;
        _1079 = _1177;
        _1143 = _1201;
        _1145 = _1199;
        _1147 = _1203;
        _1149 = _1197;
    }
    float _1205 = _1141;
    float _1207 = _1079;
    float _1209 = _1143;
    float _1211 = _1145;
    float _1213 = _1147;
    float _1215 = _1149;
    float _1217 = _1207;
    float _1219 = _1215;
    float _1221 = _1205;
    if (_875)
    {
        _1217 = 1.0;
    }
    float _1223 = _1217;
    float _1225 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1227 = _1065 * _1225;
    float _1229 = _1223;
    if (!_875)
    {
        float _1231 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1233 = _1231 * 0.15915493667125701904296875;
        float _1235 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1237 = _1233 * 6.283185482025146484375;
        float _1239 = cos(_1237);
        float _1241 = _1235 * 0.15915493667125701904296875;
        float _1243 = _1233 * 6.283185482025146484375;
        float _1245 = sin(_1243);
        float _1247 = 1.0 / _1239;
        float _1249 = _1241 * 6.283185482025146484375;
        float _1251 = cos(_1249);
        float _1253 = _1245 * _1247;
        float _1255 = _1241 * 6.283185482025146484375;
        float _1257 = sin(_1255);
        float _1259 = _1251 * _1253;
        float _1261 = 1.0 / _1259;
        float _1263 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1265 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1263;
        float _1267 = 1.0 / _1265;
        float _1269 = _1257 * _1261;
        float _1271 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1273 = fma(_1227, _1269, _1271);
        float _1275 = _1273 * _1267;
        float _1277 = precise::clamp(_1275, 0.0, 1.0);
        _1219 = _1241;
        _1221 = _1247;
        _1153 = _1277;
    }
    float _1279 = _1219;
    float _1281 = _1221;
    float _1283 = _1153;
    float _1285 = _1279;
    float _1287 = _1281;
    if (!_875)
    {
        float _1289 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1291 = _1289 * 0.15915493667125701904296875;
        float _1293 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1295 = _1291 * 6.283185482025146484375;
        float _1297 = cos(_1295);
        float _1299 = _1293 * 0.15915493667125701904296875;
        float _1301 = _1291 * 6.283185482025146484375;
        float _1303 = sin(_1301);
        float _1305 = 1.0 / _1297;
        float _1307 = _1299 * 6.283185482025146484375;
        float _1309 = cos(_1307);
        float _1311 = _1303 * _1305;
        float _1313 = _1299 * 6.283185482025146484375;
        float _1315 = sin(_1313);
        float _1317 = _1309 * _1311;
        float _1319 = 1.0 / _1317;
        float _1321 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1323 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1321;
        float _1325 = 1.0 / _1323;
        float _1327 = _1315 * _1319;
        float _1329 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1331 = fma(_1227, _1327, _1329);
        float _1333 = _1331 * _1325;
        float _1335 = precise::clamp(_1333, 0.0, 1.0);
        float _1337 = -_1335;
        float _1339 = _1337 + 1.0;
        _1285 = _1303;
        _1287 = _1291;
        _1229 = _1339;
    }
    float _1341 = _1285;
    float _1343 = _1287;
    float _1345 = _1229;
    float _1347 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1349 = _1209 + _1347;
    float _1351 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1353 = _1211 + _1351;
    float _1355 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1357 = _1213 + _1355;
    float _1359 = _1349 * _1349;
    float _1361 = fma(_1353, _1353, _1359);
    float _1363 = fma(_1357, _1357, _1361);
    float _1365 = rsqrt(_1363);
    float _1367 = sqrt(_1363);
    float _1369 = _1365 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1371 = _1353 * _1369;
    float _1373 = _1357 * _1369;
    float _1375 = _1371 * _1371;
    float _1377 = _1373 * _1373;
    float _1379 = _1375 + _1377;
    float _1381 = sqrt(_1379);
    bool _1383 = _1381 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1385 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1387 = _1381 + _1385;
    float _1389 = _1365;
    float _1391 = _1343;
    float _1393 = _1387;
    float _1395 = _1341;
    float _1397 = _1349;
    float _1399 = _1369;
    if (_1383)
    {
        float _1401 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1389 = _1401;
    }
    float _1403 = _1389;
    if (_1383)
    {
        float _1405 = rsqrt(_1379);
        _1391 = _1405;
    }
    float _1407 = _1391;
    float _1409 = _1407;
    if (_1383)
    {
        float _1411 = _1387 * _1403;
        _1393 = _1411;
    }
    float _1413 = _1393;
    if (_1383)
    {
        float _1415 = _1413 * 0.15915493667125701904296875;
        _1395 = _1415;
    }
    float _1417 = _1395;
    float _1419 = _1403;
    float _1421 = _1417;
    if (_1383)
    {
        float _1423 = _1417 * 6.283185482025146484375;
        float _1425 = sin(_1423);
        _1419 = _1425;
    }
    float _1427 = _1419;
    float _1429 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1431 = precise::max(0.0, _1429);
    float _1433 = _1357;
    float _1435 = _1431;
    if (_1383)
    {
        float _1437 = _1417 * 6.283185482025146484375;
        float _1439 = cos(_1437);
        _1433 = _1439;
    }
    float _1441 = _1433;
    float _1443 = -_1369;
    float _1445 = -_1431;
    float _1447 = fma(_1349, _1443, _1445);
    if (!_1383)
    {
        _1397 = _1373;
    }
    float _1449 = _1397;
    float _1451 = _1449;
    if (_1383)
    {
        float _1453 = _1447 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1435 = _1453;
    }
    float _1455 = _1435;
    float _1457 = _1427;
    float _1459 = _1455;
    if (_1383)
    {
        float _1461 = fma(_1427, _1455, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1457 = _1461;
    }
    float _1463 = _1457;
    float _1465 = _1463;
    float _1467 = _1441;
    if (_1383)
    {
        float _1469 = _1441 + (-1.0);
        _1459 = _1469;
    }
    float _1471 = _1459;
    float _1473 = _1471;
    if (_1383)
    {
        float _1475 = _1407 * _1463;
        _1399 = _1475;
    }
    float _1477 = _1399;
    if (!_1383)
    {
        _1409 = _1371;
    }
    float _1479 = _1409;
    float _1481 = _1479;
    if (_1383)
    {
        float _1483 = _1471 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1421 = _1483;
    }
    float _1485 = _1421;
    if (_1383)
    {
        float _1487 = _1371 * _1477;
        _1481 = _1487;
    }
    float _1489 = _1481;
    if (!_1383)
    {
        _1465 = _1447;
    }
    float _1491 = _1465;
    float _1493 = _1491;
    if (_1383)
    {
        float _1495 = _1373 * _1477;
        _1451 = _1495;
    }
    float _1497 = _1451;
    if (!_1383)
    {
        _1473 = _1375;
    }
    float _1499 = _1473;
    float _1501 = _1499;
    if (_1383)
    {
        float _1503 = fma(_1447, _1441, _1485);
        _1493 = _1503;
    }
    float _1505 = _1493;
    if (_1383)
    {
        float _1507 = _1489 * _1489;
        _1501 = _1507;
    }
    float _1509 = _1501;
    if (!_1383)
    {
        _1467 = _1377;
    }
    float _1511 = _1467;
    float _1513 = _1511;
    if (_1383)
    {
        float _1515 = _1497 * _1497;
        _1513 = _1515;
    }
    float _1517 = _1513;
    float _1519 = fma(_1505, _1505, _1509);
    float _1521 = _1209 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1523 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1525 = _1209 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1527 = _1519 + _1517;
    float _1529 = fma(_1211, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1521);
    float _1531 = _1209 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1533 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1535 = fma(_1367, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1533);
    float _1537 = precise::clamp(_1535, 0.0, 1.0);
    float _1539 = rsqrt(_1527);
    float _1541 = fma(_1211, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1525);
    float _1543 = fma(_1211, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1531);
    float _1545 = fma(_1213, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1529);
    float _1547 = -_1537;
    float _1549 = _1547 + 1.0;
    float _1551 = _1209 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1553 = fma(_1213, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1543);
    float _1555 = fma(_1213, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1541);
    float _1557 = _1545 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1559 = fma(_1211, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1551);
    float _1561 = _1553 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1563 = abs(_1549);
    float _1565 = log2(_1563);
    float _1567 = _1555 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1569 = fma(_1213, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1559);
    float _1571 = _1561 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1573 = _1557 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1575 = _1539 * _1489;
    float _1577 = _1539 * _1505;
    float _1579 = fma(_1567, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1571);
    float _1581 = _1539 * _1497;
    float _1583 = _1575 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1585 = _1569 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1587 = fma(_1557, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1579);
    float _1589 = -_1573;
    float _1591 = fma(_1589, _1523, 1.0);
    float _1593 = -_1583;
    float _1595 = fma(_1577, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1593);
    float _1597 = _1561 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1599 = fma(_1585, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1587);
    float _1601 = _1565 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1603 = -_1581;
    float _1605 = fma(_1603, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1595);
    float _1607 = log2(_1591);
    float _1609 = _1561 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1611 = fma(_1605, -0.5, 0.5);
    float _1613 = fma(_1605, 0.5, 0.5);
    float _1615 = fma(_1567, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1609);
    float _1617 = _1577 + 1.0;
    float _1619 = 1.0 / _1599;
    float _1621 = fma(_1557, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1615);
    float _1623 = fma(_1613, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1625 = fma(_1585, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1621);
    float _1627 = fma(_1613, _1623, -0.212114393711090087890625);
    float _1629 = exp2(_1601);
    float _1631 = _1607 * 0.693147182464599609375;
    float _1633 = fma(_1613, _1627, 1.570728778839111328125);
    float _1635 = sqrt(_1611);
    float _1637 = fma(_1567, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1597);
    float _1639 = _1625 * _1619;
    float _1641 = fma(_1557, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1637);
    float _1643 = fma(_1639, 0.5, 0.5);
    float _1645 = -_1577;
    float _1647 = fma(_1629, _1617, _1645);
    float _1649 = fma(_1585, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1641);
    float _1651 = fma(_1647, 0.5, 0.5);
    float _1653 = _1649 * _1619;
    float _1655 = _1631 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1657 = _1635 * 0.636619746685028076171875;
    float _1659 = fma(_1653, -0.5, 0.5);
    float _1661 = -_1633;
    float _1663 = fma(_1657, _1661, 1.0);
    float3 _4310 = float3(_1643, _1659, _1655);
    float _1665 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4310, float3(0.0), isnan(_4310)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4310, float3(0.0), isnan(_4310)), level(0.0)).x;
    float3 _4321 = float3(_1643, _1659, _1655);
    float4 _1668 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4321, float3(0.0), isnan(_4321)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4321, float3(0.0), isnan(_4321)), level(0.0)).xyzw;
    float _1670 = _1668.x;
    float _1672 = _1668.y;
    float _1674 = _1668.z;
    float _1676 = _1668.w;
    float2 _4338 = float2(_1663, _1651);
    float3 _1680 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4338, float2(0.0), isnan(_4338)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4338, float2(0.0), isnan(_4338)), level(0.0)).xyz;
    float _1682 = _1680.x;
    float _1684 = _1680.y;
    float _1686 = _1680.z;
    float _1688 = _1561 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1690 = _547 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    bool _1692 = _597 > 0.5;
    float _1694 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1696 = _1694 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    int _1698 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1700 = _1698 != 0;
    float _1702 = fma(_1567, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1688);
    int _1704 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1706 = _1704 != 0;
    float _1708 = _545 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1710 = -_887;
    int _1712 = _1692 ? as_type<int>(_1710) : as_type<int>(_887);
    float _1714 = 1.0 / _1696;
    float _1716 = _543 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    bool _1718 = !_1706;
    float _1720 = _1718 ? _887 : as_type<float>(_1712);
    float _1722 = _1565 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _1724 = _139 > 0.5;
    float _1726 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1728 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1726;
    bool _1730 = _575 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1732 = isnan(_575);
    bool _1734 = _1730 || _1732;
    bool _1736 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1738 = _1734 || _1736;
    float _1740 = float(_1738);
    float _1742 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1744 = -_879;
    int _1746 = _1724 ? as_type<int>(_1744) : as_type<int>(_879);
    float _1748 = -_1720;
    float _1750 = _1748 + 0.5;
    float _1752 = fma(_1557, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1702);
    bool _1754 = _1283 > 0.0;
    bool _1756 = isnan(_1283);
    bool _1758 = _1754 || _1756;
    bool _1760 = isnan(0.0);
    bool _1762 = _1758 || _1760;
    bool _1764 = !_1700;
    float _1766 = _1764 ? _879 : as_type<float>(_1746);
    float _1768 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1770 = _575 + _1768;
    float _1772 = exp2(_1722);
    float _1774 = _1728 * _1714;
    bool _1776 = _575 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1778 = isnan(_575);
    bool _1780 = _1776 || _1778;
    bool _1782 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1784 = _1780 || _1782;
    float _1786 = float(_1784);
    float _1788 = -_1740;
    float _1790 = _1788 + 1.0;
    float _1792 = _1766 + 0.5;
    float _1794 = fma(_1774, _1770, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1796 = _1750 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1798 = _1786 * _1790;
    float _1800 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1802 = -_1786;
    float _1804 = _1802 + 1.0;
    float _1806 = _1792 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1808 = _1794 * _1798;
    float _1810 = _1283 * _1345;
    float _1812 = _1796 * _1742;
    float _1814 = _1690 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1816 = fma(_1804, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1808);
    float _1818 = -_1772;
    float _1820 = _1818 + 1.0;
    float _1822 = _1810 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1824 = fma(_1585, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1752);
    bool _1826 = _1345 <= 0.0;
    bool _1828 = !_1762;
    bool _1830 = _1826 || _1828;
    float _1832 = _1820 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1834 = _227 * _1822;
    float _1836 = _1824 + _1599;
    float _1838 = fma(_1740, (*spvDescriptorSet0.vp_c9)._m0[116].x, _1816);
    float _1840 = _1806 * _1800;
    float _1842 = _1708 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1844 = _1716 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1846 = _1838 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_58.x = _1840;
    out.m_58.y = _1812;
    out.m_60.x = _1844;
    out.m_60.y = _1842;
    out.m_60.z = _1814;
    out.m_60.w = _1846;
    out.gl_Position.x = _1625;
    out.gl_Position.y = _1649;
    out.gl_Position.z = _1824;
    out.gl_Position.w = _1599;
    float _1848 = _1834 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1850 = _1836 * 0.5;
    float _1852 = -_1832;
    float _1854 = _1852 + 1.0;
    out.m_45.x = _1848;
    out.m_62.z = _1850;
    out.m_62.w = _1599;
    float _1856 = _1832 * _1665;
    float _1858 = _1676 * _1856;
    float _1860 = _1686 * _1856;
    float _1862 = fma(_1682, _1858, _1670);
    float _1864 = fma(_1684, _1858, _1672);
    float _1866 = _1676 * _1854;
    float _1868 = fma(_1676, _1860, _1674);
    out.m_64.x = _1862;
    out.m_64.y = _1864;
    out.m_64.z = _1868;
    out.m_64.w = _1866;
    if (!_1830)
    {
        return out;
    }
    out.m_45.x = 0.0;
    float _1870 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1870;
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
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    bool _567 = false;
    bool _393 = false;
    bool _247 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _78 = in.m_42.w;
    float _80 = trunc(_78);
    int _83 = int(_80);
    bool _87 = _83 >= 1;
    float _89 = 0.0;
    if (!_87)
    {
        _89 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _91 = _89;
    float _93 = _91;
    if (!_87)
    {
        out.m_45.x = 0.0;
    }
    int _95 = 0;
    if (!_87)
    {
        float _97 = _91 * 5.0;
        _95 = as_type<int>(_97);
    }
    int _99 = _95;
    int _101 = _99;
    if (!_87)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1927 = as_type<float>(_99);
        out.gl_Position.z = _1927;
    }
    if (!_87)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _103 = in.m_47.w;
    bool _105 = _103 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _107 = isnan(_103);
    bool _109 = _105 || _107;
    bool _111 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _113 = _109 || _111;
    float _115 = -_103;
    float _117 = _115 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _119 = 0.0;
    float _121 = _117;
    if (_113)
    {
        float _123 = float(_83);
        _119 = _123;
    }
    float _125 = _119;
    bool _127 = _117 >= _125;
    bool _129 = !_113;
    bool _131 = _127 || _129;
    if (_131)
    {
        _93 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _133 = _93;
    if (_131)
    {
        out.m_45.x = 0.0;
    }
    if (_131)
    {
        float _135 = _133 * 5.0;
        _101 = as_type<int>(_135);
    }
    int _137 = _101;
    if (_131)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1996 = as_type<float>(_137);
        out.gl_Position.z = _1996;
    }
    if (_131)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _139 = in.m_49.x;
    float _141 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _143 = _117 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _145 = _143 * _141;
    float _147 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[20].x, _145);
    float _149 = _147 * 6.283185482025146484375;
    float _151 = floor(_147);
    int _153 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _155 = _153 != 0;
    int _157 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _159 = _157 != 0;
    float _161 = _149 * 0.15915493667125701904296875;
    int _163 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _165 = _163 != 0;
    bool _167 = !_155;
    int _169 = _167 ? 0 : 1;
    float _171 = _161 * 6.283185482025146484375;
    float _173 = cos(_171);
    int _175 = abs(_169);
    bool _177 = !_165;
    int _179 = _177 ? 0 : 1;
    bool _181 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _183 = -_151;
    float _185 = _147 + _183;
    bool _187 = !_159;
    int _189 = _187 ? 0 : 1;
    int _191 = abs(_179);
    float _193 = float(_175);
    float _195 = -_185;
    float _197 = fma(_195, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _199 = abs(_189);
    float _201 = fma(_173, 0.5, 0.5);
    bool _203 = _185 < 0.5;
    float _205 = float(_203);
    float _207 = abs(_197);
    float _209 = _193 * _207;
    float _211 = float(_191);
    float _213 = -_201;
    float _215 = fma(_213, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _217 = -_205;
    float _219 = fma(_217, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _221 = float(_199);
    float _223 = fma(_211, _215, _209);
    float _225 = abs(_219);
    float _227 = fma(_221, _225, _223);
    bool _229 = !_181;
    float _245;
    if (!_229)
    {
        float _231 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _233 = _139 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _235 = fma(_233, (*spvDescriptorSet0.vp_c9)._m0[12].x, _117);
        float _237 = _235 * _231;
        float _239 = floor(_237);
        float _241 = -_239;
        float _243 = _237 + _241;
        _245 = _243;
        _247 = true;
    }
    else
    {
        float _249 = float(_83);
        float _251 = 1.0 / _249;
        float _253 = _117 * _251;
        _245 = _253;
    }
    _247 = false;
    float _255 = _245;
    float _257 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _259 = _255 + _257;
    bool _261 = _255 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _263 = isnan(_255);
    bool _265 = _261 || _263;
    bool _267 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _269 = _265 || _267;
    float _271 = float(_269);
    bool _273 = _255 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _275 = isnan(_255);
    bool _277 = _273 || _275;
    bool _279 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _281 = _277 || _279;
    float _283 = float(_281);
    float _285 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _287 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _285;
    float _289 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _291 = _289 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _293 = -_271;
    float _295 = _293 + 1.0;
    float _297 = 1.0 / _287;
    bool _299 = _255 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _301 = isnan(_255);
    bool _303 = _299 || _301;
    bool _305 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _307 = _303 || _305;
    float _309 = float(_307);
    float _311 = _283 * _295;
    float _313 = -_283;
    float _315 = _313 + 1.0;
    bool _317 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _319 = _309 * _315;
    float _321 = 1.0 / _291;
    float _323 = -_309;
    float _325 = _323 + 1.0;
    float _327 = _259 * _297;
    float _329 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _331 = _255 + _329;
    float _333 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _335 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _333;
    float _337 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _339 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _337;
    float _341 = fma(_335, _327, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _343 = fma(_339, _327, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _345 = _331 * _321;
    float _347 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _349 = _347 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _351 = _341 * _319;
    float _353 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _355 = _353 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _357 = _343 * _319;
    float _359 = fma(_349, _345, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _361 = fma(_325, (*spvDescriptorSet0.vp_c9)._m0[143].x, _351);
    float _363 = fma(_355, _345, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _365 = fma(_325, (*spvDescriptorSet0.vp_c9)._m0[143].y, _357);
    float _367 = fma(_359, _311, _361);
    float _369 = fma(_363, _311, _365);
    float _371 = fma(_271, (*spvDescriptorSet0.vp_c9)._m0[145].x, _367);
    float _373 = fma(_271, (*spvDescriptorSet0.vp_c9)._m0[145].y, _369);
    bool _375 = !_317;
    float _391;
    if (!_375)
    {
        float _377 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _379 = _139 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _381 = fma(_379, (*spvDescriptorSet0.vp_c9)._m0[11].x, _117);
        float _383 = _381 * _377;
        float _385 = floor(_383);
        float _387 = -_385;
        float _389 = _383 + _387;
        _391 = _389;
        _393 = true;
    }
    else
    {
        float _395 = float(_83);
        float _397 = 1.0 / _395;
        float _399 = _117 * _397;
        _391 = _399;
    }
    _393 = false;
    float _401 = _391;
    float _403 = in.m_51.x;
    float _405 = in.m_51.y;
    float _407 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _409 = _401 + _407;
    bool _411 = _401 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _413 = isnan(_401);
    bool _415 = _411 || _413;
    bool _417 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _419 = _415 || _417;
    float _421 = float(_419);
    float _423 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _425 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _423;
    float _427 = -_421;
    float _429 = _427 + 1.0;
    bool _431 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _433 = 1.0 / _425;
    float _435 = _373 * _405;
    float _437 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _439 = _437 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _441 = _401 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _443 = isnan(_401);
    bool _445 = _441 || _443;
    bool _447 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _449 = _445 || _447;
    float _451 = float(_449);
    float _453 = _409 * _433;
    float _455 = 1.0 / _439;
    float _457 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _459 = _401 + _457;
    bool _461 = _401 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _463 = isnan(_401);
    bool _465 = _461 || _463;
    bool _467 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _469 = _465 || _467;
    float _471 = float(_469);
    float _473 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _475 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _473;
    float _477 = _471 * _429;
    float _479 = -_471;
    float _481 = _479 + 1.0;
    float _483 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _485 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _483;
    float _487 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _489 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _487;
    float _491 = fma(_475, _453, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _493 = _451 * _481;
    float _495 = fma(_485, _453, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _497 = fma(_489, _453, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _499 = -_451;
    float _501 = _499 + 1.0;
    float _503 = _459 * _455;
    float _505 = _495 * _493;
    float _507 = _491 * _493;
    float _509 = _497 * _493;
    float _511 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _513 = _511 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _515 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _517 = _515 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _519 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _521 = _519 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _523 = fma(_501, (*spvDescriptorSet0.vp_c9)._m0[107].x, _505);
    float _525 = fma(_513, _503, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _527 = fma(_517, _503, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _529 = fma(_521, _503, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _531 = fma(_501, (*spvDescriptorSet0.vp_c9)._m0[107].y, _507);
    float _533 = fma(_501, (*spvDescriptorSet0.vp_c9)._m0[107].z, _509);
    float _535 = fma(_525, _477, _523);
    float _537 = _371 * _403;
    float _539 = fma(_527, _477, _531);
    float _541 = fma(_529, _477, _533);
    float _543 = fma(_421, (*spvDescriptorSet0.vp_c9)._m0[109].x, _535);
    float _545 = fma(_421, (*spvDescriptorSet0.vp_c9)._m0[109].y, _539);
    float _547 = fma(_421, (*spvDescriptorSet0.vp_c9)._m0[109].z, _541);
    bool _549 = !_431;
    float _565;
    if (!_549)
    {
        float _551 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _553 = _139 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _555 = fma(_553, (*spvDescriptorSet0.vp_c9)._m0[11].y, _117);
        float _557 = _555 * _551;
        float _559 = floor(_557);
        float _561 = -_559;
        float _563 = _557 + _561;
        _565 = _563;
        _567 = true;
    }
    else
    {
        float _569 = float(_83);
        float _571 = 1.0 / _569;
        float _573 = _117 * _571;
        _565 = _573;
    }
    _567 = false;
    float _575 = _565;
    float _577 = in.m_49.z;
    float _579 = _139 * 2.0;
    float _581 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _583 = log2(_581);
    int _585 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _587 = _585 != 0;
    int _589 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _591 = _589 != 0;
    int _593 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _595 = _593 != 0;
    float _597 = in.m_49.y;
    float _599 = _227 * _537;
    float _601 = _227 * _435;
    float _603 = floor(_579);
    float _605 = _599 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _607 = _601 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _609 = _577 * 2.0;
    bool _611 = _603 > 0.0;
    float _613 = floor(_609);
    float _615 = _597 * 2.0;
    float _617 = _139 + _597;
    float _619 = _597 + _577;
    bool _621 = _603 >= 0.0;
    bool _623 = isnan(_603);
    bool _625 = _621 || _623;
    bool _627 = isnan(0.0);
    bool _629 = _625 || _627;
    float _631 = _617 + (-1.0);
    float _633 = _619 + (-1.0);
    float _635 = floor(_615);
    float _637 = fma(_631, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _639 = _583 * _117;
    float _641 = fma(_633, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _643 = _629 ? 0 : 1;
    bool _645 = _613 > 0.0;
    float _647 = exp2(_639);
    bool _649 = _613 >= 0.0;
    bool _651 = isnan(_613);
    bool _653 = _649 || _651;
    bool _655 = isnan(0.0);
    bool _657 = _653 || _655;
    int _659 = ~_643;
    int _661 = _659 + 1;
    int _663 = _661 + 1;
    int _665 = _657 ? 0 : 1;
    bool _667 = _635 > 0.0;
    int _669 = ~_665;
    int _671 = _669 + 1;
    int _673 = _671 + 1;
    bool _675 = _635 >= 0.0;
    bool _677 = isnan(_635);
    bool _679 = _675 || _677;
    bool _681 = isnan(0.0);
    bool _683 = _679 || _681;
    int _685 = _673;
    int _687 = _663;
    if (!_645)
    {
        int _689 = ~_665;
        int _691 = _689 + 1;
        _685 = _691;
    }
    int _693 = _685;
    bool _695 = !_591;
    int _697 = _695 ? 0 : 1;
    float _699 = -_647;
    float _701 = _699 + 1.0;
    bool _703 = !_587;
    int _705 = _703 ? 0 : 1;
    int _707 = abs(_697);
    float _709 = in.m_53.x;
    float _711 = in.m_53.y;
    float _713 = in.m_53.z;
    if (!_611)
    {
        int _715 = ~_643;
        int _717 = _715 + 1;
        _687 = _717;
    }
    int _719 = _687;
    float _721 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _723 = 1.0 + _721;
    int _725 = abs(_705);
    float _727 = 1.0 / _723;
    bool _729 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _731 = isnan(1.0);
    bool _733 = _729 || _731;
    bool _735 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _737 = _733 || _735;
    float _739 = float(_707);
    float _741 = float(_719);
    bool _743 = !_595;
    int _745 = _743 ? 0 : 1;
    float _747 = float(_725);
    float _749 = _739 * _741;
    float _751 = float(_693);
    int _753 = _683 ? 0 : 1;
    bool _755 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _757 = isnan(0.0);
    bool _759 = _755 || _757;
    bool _761 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _763 = _759 || _761;
    float _765 = _747 * _751;
    int _767 = abs(_745);
    float _769 = _597 + (-0.5);
    int _771 = ~_753;
    int _773 = _771 + 1;
    int _775 = _773 + 1;
    float _777 = _763 ? _701 : 0.0;
    int _779 = _775;
    if (!_667)
    {
        int _781 = ~_753;
        int _783 = _781 + 1;
        _779 = _783;
    }
    int _785 = _779;
    float _787 = _749 * (-2.0);
    float _789 = _765 * (-2.0);
    if (_737)
    {
        float _791 = _777 * _727;
        _121 = _791;
    }
    float _793 = _121;
    float _795 = fma(_787, _711, _711);
    float _797 = _139 + (-0.5);
    float _799 = fma(_789, _709, _709);
    float _801 = float(_767);
    float _803 = fma(_637, _789, _637);
    float _805 = float(_785);
    float _807 = fma(_797, (*spvDescriptorSet0.vp_c9)._m0[196].x, _799);
    float _809 = _139 + _577;
    float _811 = fma(_769, (*spvDescriptorSet0.vp_c9)._m0[196].y, _795);
    float _813 = fma(_641, _787, _641);
    float _815 = _801 * _805;
    float _817 = as_type<float>(int(gl_VertexIndex));
    float _819 = fma(_803, _793, _807);
    float _821 = _809 + (-1.0);
    float _823 = _815 * (-2.0);
    float _825 = fma(_813, _793, _811);
    float _827 = _577 + (-0.5);
    float _829 = fma(_821, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _831 = fma(_823, _713, _713);
    float _833 = _825 * 0.15915493667125701904296875;
    float _835 = _819 * 0.15915493667125701904296875;
    float _837 = fma(_829, _823, _829);
    float _839 = fma(_827, (*spvDescriptorSet0.vp_c9)._m0[196].z, _831);
    float _841 = in.m_42.x;
    float _843 = in.m_42.y;
    float _845 = in.m_42.z;
    float _847 = _835 * 6.283185482025146484375;
    float _849 = sin(_847);
    float _851 = fma(_837, _793, _839);
    float _853 = _851 * 0.15915493667125701904296875;
    float _855 = _835 * 6.283185482025146484375;
    float _857 = cos(_855);
    int _859 = as_type<int>(_817) & 1;
    bool _861 = _859 != 0;
    int _863 = as_type<int>(_817) & 2;
    bool _865 = _863 != 0;
    bool _867 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _869 = isnan(0.5);
    bool _871 = _867 || _869;
    bool _873 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _875 = _871 || _873;
    bool _877 = !_861;
    float _879 = _877 ? (-0.5) : 0.5;
    float _881 = _853 * 6.283185482025146484375;
    float _883 = sin(_881);
    bool _885 = !_865;
    float _887 = _885 ? (-0.5) : 0.5;
    bool _889 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _891 = isnan(0.5);
    bool _893 = _889 || _891;
    bool _895 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _897 = _893 || _895;
    float _899 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _879);
    float _901 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _887);
    float _903 = _843 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _905 = _853 * 6.283185482025146484375;
    float _907 = cos(_905);
    float _909 = _843 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _911 = _843 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _913 = _605 * _899;
    float _915 = _607 * _901;
    float _917 = fma(_841, (*spvDescriptorSet0.vp_c10)._m0[4].x, _903);
    float _919 = fma(_841, (*spvDescriptorSet0.vp_c10)._m0[5].x, _909);
    float _921 = _833 * 6.283185482025146484375;
    float _923 = cos(_921);
    float _925 = _849 * _883;
    float _927 = fma(_841, (*spvDescriptorSet0.vp_c10)._m0[6].x, _911);
    float _929 = _857 * _883;
    float _931 = _833 * 6.283185482025146484375;
    float _933 = sin(_931);
    float _935 = _857 * _907;
    float _937 = _849 * _907;
    float _939 = _857 * _923;
    float _941 = _849 * _923;
    float _943 = _923 * _913;
    float _945 = _941 * _915;
    float _947 = fma(_933, _925, _935);
    float _949 = -_929;
    float _951 = fma(_933, _937, _949);
    float _953 = -_937;
    float _955 = fma(_933, _929, _953);
    float _957 = fma(_933, _935, _925);
    float _959 = _947 * _915;
    float _961 = _951 * _915;
    float _963 = -_933;
    float _965 = fma(_963, _913, _945);
    float _967 = fma(_883, _943, _959);
    float _969 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _971 = fma(_907, _943, _961);
    float _973 = fma(_955, _969, _967);
    float _975 = fma(_845, (*spvDescriptorSet0.vp_c10)._m0[5].z, _919);
    float _977 = fma(_957, _969, _971);
    float _979 = fma(_845, (*spvDescriptorSet0.vp_c10)._m0[4].z, _917);
    float _981 = _973 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _983 = _975 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _985 = fma(_939, _969, _965);
    float _987 = _973 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _989 = fma(_977, (*spvDescriptorSet0.vp_c8)._m0[26].x, _981);
    float _991 = fma(_845, (*spvDescriptorSet0.vp_c10)._m0[6].z, _927);
    float _993 = _979 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _995 = _983 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _997 = fma(_977, (*spvDescriptorSet0.vp_c8)._m0[24].x, _987);
    float _999 = fma(_985, (*spvDescriptorSet0.vp_c8)._m0[26].z, _989);
    float _1001 = _991 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1003 = fma(_993, (*spvDescriptorSet0.vp_c8)._m0[11].x, _995);
    float _1005 = fma(_985, (*spvDescriptorSet0.vp_c8)._m0[24].z, _997);
    float _1007 = _999 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1009 = _973 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1011 = fma(_1001, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1003);
    float _1013 = _1005 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1015 = _1001 + _1007;
    float _1017 = fma(_977, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1009);
    float _1019 = _1011 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1021 = _993 + _1013;
    float _1023 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1025 = _1015 + _1023;
    float _1027 = _983 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1029 = 1.0 / _1019;
    float _1031 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1033 = _1021 + _1031;
    float _1035 = _1025 * _1025;
    float _1037 = fma(_985, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1017);
    float _1039 = fma(_1033, _1033, _1035);
    float _1041 = fma(_993, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1027);
    float _1043 = _1037 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1045 = sqrt(_1039);
    float _1047 = fma(_1001, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1041);
    float _1049 = _1047 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1051 = _1049 + _1019;
    float _1053 = _983 + _1043;
    float _1055 = _1051 * _1029;
    float _1057 = _1055 * 0.5;
    bool _1059 = _1045 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1061 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1063 = fma(_1057, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1061);
    float _1065 = 1.0 / _1063;
    float _1067 = _1043;
    float _1069 = _1057;
    float _1071 = _1009;
    float _1073 = _1021;
    float _1075 = _1063;
    float _1077 = _1053;
    float _1079 = _1015;
    if (!_1059)
    {
        _1067 = _1021;
    }
    float _1081 = _1067;
    float _1083 = _1081;
    if (!_1059)
    {
        _1069 = _1015;
    }
    float _1085 = _1069;
    float _1087 = _1085;
    if (!_1059)
    {
        _1071 = _1053;
    }
    float _1089 = _1071;
    bool _1091 = !_1059;
    float _1093 = _1089;
    if (!_1091)
    {
        float _1095 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1097 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1099 = _1045 + _1097;
        float _1101 = _1053 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1103 = rsqrt(_1039);
        float _1105 = _1099 * _1095;
        float _1107 = _1105 * 0.15915493667125701904296875;
        float _1109 = _1107 * 6.283185482025146484375;
        float _1111 = cos(_1109);
        float _1113 = _1107 * 6.283185482025146484375;
        float _1115 = sin(_1113);
        float _1117 = _1111 + (-1.0);
        float _1119 = _1117 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1121 = fma(_1115, _1101, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1123 = fma(_1053, _1111, _1119);
        float _1125 = _1103 * _1121;
        float _1127 = fma(_1033, _1125, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1129 = fma(_1025, _1125, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1073 = _1107;
        _1087 = _1129;
        _1083 = _1127;
        _1093 = _1123;
        _1075 = _1121;
    }
    float _1131 = _1073;
    float _1133 = _1087;
    float _1135 = _1083;
    float _1137 = _1093;
    float _1139 = _1075;
    float _1141 = _1139;
    float _1143 = _1137;
    float _1145 = _1135;
    float _1147 = _1133;
    float _1149 = _1131;
    if (_875)
    {
        _1077 = 1.0;
    }
    float _1151 = _1077;
    float _1153 = _1151;
    if (!_897)
    {
        float _1155 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1157 = _983 + _1155;
        float _1159 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1161 = _993 + _1159;
        float _1163 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1165 = -_1001;
        float _1167 = _1165 + _1133;
        float _1169 = _1157 * _1157;
        float _1171 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1173 = _1001 + _1171;
        float _1175 = fma(_1161, _1161, _1169);
        float _1177 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1179 = fma(_1173, _1173, _1175);
        float _1181 = sqrt(_1179);
        float _1183 = _1163 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1185 = precise::min(_1181, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1187 = _1185 * _1177;
        float _1189 = -_993;
        float _1191 = _1189 + _1135;
        float _1193 = _1183 * _1187;
        float _1195 = -_983;
        float _1197 = _1195 + _1137;
        float _1199 = fma(_1191, _1193, _993);
        float _1201 = fma(_1197, _1193, _983);
        float _1203 = fma(_1167, _1193, _1001);
        _1141 = _1191;
        _1079 = _1177;
        _1143 = _1201;
        _1145 = _1199;
        _1147 = _1203;
        _1149 = _1197;
    }
    float _1205 = _1141;
    float _1207 = _1079;
    float _1209 = _1143;
    float _1211 = _1145;
    float _1213 = _1147;
    float _1215 = _1149;
    float _1217 = _1207;
    float _1219 = _1215;
    float _1221 = _1205;
    if (_875)
    {
        _1217 = 1.0;
    }
    float _1223 = _1217;
    float _1225 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1227 = _1065 * _1225;
    float _1229 = _1223;
    if (!_875)
    {
        float _1231 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1233 = _1231 * 0.15915493667125701904296875;
        float _1235 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1237 = _1233 * 6.283185482025146484375;
        float _1239 = cos(_1237);
        float _1241 = _1235 * 0.15915493667125701904296875;
        float _1243 = _1233 * 6.283185482025146484375;
        float _1245 = sin(_1243);
        float _1247 = 1.0 / _1239;
        float _1249 = _1241 * 6.283185482025146484375;
        float _1251 = cos(_1249);
        float _1253 = _1245 * _1247;
        float _1255 = _1241 * 6.283185482025146484375;
        float _1257 = sin(_1255);
        float _1259 = _1251 * _1253;
        float _1261 = 1.0 / _1259;
        float _1263 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1265 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1263;
        float _1267 = 1.0 / _1265;
        float _1269 = _1257 * _1261;
        float _1271 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1273 = fma(_1227, _1269, _1271);
        float _1275 = _1273 * _1267;
        float _1277 = precise::clamp(_1275, 0.0, 1.0);
        _1219 = _1241;
        _1221 = _1247;
        _1153 = _1277;
    }
    float _1279 = _1219;
    float _1281 = _1221;
    float _1283 = _1153;
    float _1285 = _1279;
    float _1287 = _1281;
    if (!_875)
    {
        float _1289 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1291 = _1289 * 0.15915493667125701904296875;
        float _1293 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1295 = _1291 * 6.283185482025146484375;
        float _1297 = cos(_1295);
        float _1299 = _1293 * 0.15915493667125701904296875;
        float _1301 = _1291 * 6.283185482025146484375;
        float _1303 = sin(_1301);
        float _1305 = 1.0 / _1297;
        float _1307 = _1299 * 6.283185482025146484375;
        float _1309 = cos(_1307);
        float _1311 = _1303 * _1305;
        float _1313 = _1299 * 6.283185482025146484375;
        float _1315 = sin(_1313);
        float _1317 = _1309 * _1311;
        float _1319 = 1.0 / _1317;
        float _1321 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1323 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1321;
        float _1325 = 1.0 / _1323;
        float _1327 = _1315 * _1319;
        float _1329 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1331 = fma(_1227, _1327, _1329);
        float _1333 = _1331 * _1325;
        float _1335 = precise::clamp(_1333, 0.0, 1.0);
        float _1337 = -_1335;
        float _1339 = _1337 + 1.0;
        _1285 = _1303;
        _1287 = _1291;
        _1229 = _1339;
    }
    float _1341 = _1285;
    float _1343 = _1287;
    float _1345 = _1229;
    float _1347 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1349 = _1209 + _1347;
    float _1351 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1353 = _1211 + _1351;
    float _1355 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1357 = _1213 + _1355;
    float _1359 = _1349 * _1349;
    float _1361 = fma(_1353, _1353, _1359);
    float _1363 = fma(_1357, _1357, _1361);
    float _1365 = rsqrt(_1363);
    float _1367 = sqrt(_1363);
    float _1369 = _1365 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1371 = _1353 * _1369;
    float _1373 = _1357 * _1369;
    float _1375 = _1371 * _1371;
    float _1377 = _1373 * _1373;
    float _1379 = _1375 + _1377;
    float _1381 = sqrt(_1379);
    bool _1383 = _1381 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1385 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1387 = _1381 + _1385;
    float _1389 = _1365;
    float _1391 = _1343;
    float _1393 = _1387;
    float _1395 = _1341;
    float _1397 = _1349;
    float _1399 = _1369;
    if (_1383)
    {
        float _1401 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1389 = _1401;
    }
    float _1403 = _1389;
    if (_1383)
    {
        float _1405 = rsqrt(_1379);
        _1391 = _1405;
    }
    float _1407 = _1391;
    float _1409 = _1407;
    if (_1383)
    {
        float _1411 = _1387 * _1403;
        _1393 = _1411;
    }
    float _1413 = _1393;
    if (_1383)
    {
        float _1415 = _1413 * 0.15915493667125701904296875;
        _1395 = _1415;
    }
    float _1417 = _1395;
    float _1419 = _1403;
    float _1421 = _1417;
    if (_1383)
    {
        float _1423 = _1417 * 6.283185482025146484375;
        float _1425 = sin(_1423);
        _1419 = _1425;
    }
    float _1427 = _1419;
    float _1429 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1431 = precise::max(0.0, _1429);
    float _1433 = _1357;
    float _1435 = _1431;
    if (_1383)
    {
        float _1437 = _1417 * 6.283185482025146484375;
        float _1439 = cos(_1437);
        _1433 = _1439;
    }
    float _1441 = _1433;
    float _1443 = -_1369;
    float _1445 = -_1431;
    float _1447 = fma(_1349, _1443, _1445);
    if (!_1383)
    {
        _1397 = _1373;
    }
    float _1449 = _1397;
    float _1451 = _1449;
    if (_1383)
    {
        float _1453 = _1447 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1435 = _1453;
    }
    float _1455 = _1435;
    float _1457 = _1427;
    float _1459 = _1455;
    if (_1383)
    {
        float _1461 = fma(_1427, _1455, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1457 = _1461;
    }
    float _1463 = _1457;
    float _1465 = _1463;
    float _1467 = _1441;
    if (_1383)
    {
        float _1469 = _1441 + (-1.0);
        _1459 = _1469;
    }
    float _1471 = _1459;
    float _1473 = _1471;
    if (_1383)
    {
        float _1475 = _1407 * _1463;
        _1399 = _1475;
    }
    float _1477 = _1399;
    if (!_1383)
    {
        _1409 = _1371;
    }
    float _1479 = _1409;
    float _1481 = _1479;
    if (_1383)
    {
        float _1483 = _1471 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1421 = _1483;
    }
    float _1485 = _1421;
    if (_1383)
    {
        float _1487 = _1371 * _1477;
        _1481 = _1487;
    }
    float _1489 = _1481;
    if (!_1383)
    {
        _1465 = _1447;
    }
    float _1491 = _1465;
    float _1493 = _1491;
    if (_1383)
    {
        float _1495 = _1373 * _1477;
        _1451 = _1495;
    }
    float _1497 = _1451;
    if (!_1383)
    {
        _1473 = _1375;
    }
    float _1499 = _1473;
    float _1501 = _1499;
    if (_1383)
    {
        float _1503 = fma(_1447, _1441, _1485);
        _1493 = _1503;
    }
    float _1505 = _1493;
    if (_1383)
    {
        float _1507 = _1489 * _1489;
        _1501 = _1507;
    }
    float _1509 = _1501;
    if (!_1383)
    {
        _1467 = _1377;
    }
    float _1511 = _1467;
    float _1513 = _1511;
    if (_1383)
    {
        float _1515 = _1497 * _1497;
        _1513 = _1515;
    }
    float _1517 = _1513;
    float _1519 = fma(_1505, _1505, _1509);
    float _1521 = _1209 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1523 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1525 = _1209 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1527 = _1519 + _1517;
    float _1529 = fma(_1211, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1521);
    float _1531 = _1209 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1533 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1535 = fma(_1367, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1533);
    float _1537 = precise::clamp(_1535, 0.0, 1.0);
    float _1539 = rsqrt(_1527);
    float _1541 = fma(_1211, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1525);
    float _1543 = fma(_1211, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1531);
    float _1545 = fma(_1213, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1529);
    float _1547 = -_1537;
    float _1549 = _1547 + 1.0;
    float _1551 = _1209 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1553 = fma(_1213, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1543);
    float _1555 = fma(_1213, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1541);
    float _1557 = _1545 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1559 = fma(_1211, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1551);
    float _1561 = _1553 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1563 = abs(_1549);
    float _1565 = log2(_1563);
    float _1567 = _1555 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1569 = fma(_1213, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1559);
    float _1571 = _1561 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1573 = _1557 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1575 = _1539 * _1489;
    float _1577 = _1539 * _1505;
    float _1579 = fma(_1567, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1571);
    float _1581 = _1539 * _1497;
    float _1583 = _1575 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1585 = _1569 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1587 = fma(_1557, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1579);
    float _1589 = -_1573;
    float _1591 = fma(_1589, _1523, 1.0);
    float _1593 = -_1583;
    float _1595 = fma(_1577, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1593);
    float _1597 = _1561 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1599 = fma(_1585, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1587);
    float _1601 = _1565 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1603 = -_1581;
    float _1605 = fma(_1603, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1595);
    float _1607 = log2(_1591);
    float _1609 = _1561 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1611 = fma(_1605, -0.5, 0.5);
    float _1613 = fma(_1605, 0.5, 0.5);
    float _1615 = fma(_1567, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1609);
    float _1617 = _1577 + 1.0;
    float _1619 = 1.0 / _1599;
    float _1621 = fma(_1557, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1615);
    float _1623 = fma(_1613, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1625 = fma(_1585, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1621);
    float _1627 = fma(_1613, _1623, -0.212114393711090087890625);
    float _1629 = exp2(_1601);
    float _1631 = _1607 * 0.693147182464599609375;
    float _1633 = fma(_1613, _1627, 1.570728778839111328125);
    float _1635 = sqrt(_1611);
    float _1637 = fma(_1567, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1597);
    float _1639 = _1625 * _1619;
    float _1641 = fma(_1557, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1637);
    float _1643 = fma(_1639, 0.5, 0.5);
    float _1645 = -_1577;
    float _1647 = fma(_1629, _1617, _1645);
    float _1649 = fma(_1585, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1641);
    float _1651 = fma(_1647, 0.5, 0.5);
    float _1653 = _1649 * _1619;
    float _1655 = _1631 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1657 = _1635 * 0.636619746685028076171875;
    float _1659 = fma(_1653, -0.5, 0.5);
    float _1661 = -_1633;
    float _1663 = fma(_1657, _1661, 1.0);
    float3 _4310 = float3(_1643, _1659, _1655);
    float _1665 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4310, float3(0.0), isnan(_4310)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4310, float3(0.0), isnan(_4310)), level(0.0)).x;
    float3 _4321 = float3(_1643, _1659, _1655);
    float4 _1668 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4321, float3(0.0), isnan(_4321)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4321, float3(0.0), isnan(_4321)), level(0.0)).xyzw;
    float _1670 = _1668.x;
    float _1672 = _1668.y;
    float _1674 = _1668.z;
    float _1676 = _1668.w;
    float2 _4338 = float2(_1663, _1651);
    float3 _1680 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4338, float2(0.0), isnan(_4338)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4338, float2(0.0), isnan(_4338)), level(0.0)).xyz;
    float _1682 = _1680.x;
    float _1684 = _1680.y;
    float _1686 = _1680.z;
    float _1688 = _1561 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1690 = _547 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    bool _1692 = _597 > 0.5;
    float _1694 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1696 = _1694 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    int _1698 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1700 = _1698 != 0;
    float _1702 = fma(_1567, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1688);
    int _1704 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1706 = _1704 != 0;
    float _1708 = _545 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1710 = -_887;
    int _1712 = _1692 ? as_type<int>(_1710) : as_type<int>(_887);
    float _1714 = 1.0 / _1696;
    float _1716 = _543 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    bool _1718 = !_1706;
    float _1720 = _1718 ? _887 : as_type<float>(_1712);
    float _1722 = _1565 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _1724 = _139 > 0.5;
    float _1726 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1728 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1726;
    bool _1730 = _575 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1732 = isnan(_575);
    bool _1734 = _1730 || _1732;
    bool _1736 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1738 = _1734 || _1736;
    float _1740 = float(_1738);
    float _1742 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1744 = -_879;
    int _1746 = _1724 ? as_type<int>(_1744) : as_type<int>(_879);
    float _1748 = -_1720;
    float _1750 = _1748 + 0.5;
    float _1752 = fma(_1557, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1702);
    bool _1754 = _1283 > 0.0;
    bool _1756 = isnan(_1283);
    bool _1758 = _1754 || _1756;
    bool _1760 = isnan(0.0);
    bool _1762 = _1758 || _1760;
    bool _1764 = !_1700;
    float _1766 = _1764 ? _879 : as_type<float>(_1746);
    float _1768 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1770 = _575 + _1768;
    float _1772 = exp2(_1722);
    float _1774 = _1728 * _1714;
    bool _1776 = _575 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1778 = isnan(_575);
    bool _1780 = _1776 || _1778;
    bool _1782 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1784 = _1780 || _1782;
    float _1786 = float(_1784);
    float _1788 = -_1740;
    float _1790 = _1788 + 1.0;
    float _1792 = _1766 + 0.5;
    float _1794 = fma(_1774, _1770, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1796 = _1750 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1798 = _1786 * _1790;
    float _1800 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1802 = -_1786;
    float _1804 = _1802 + 1.0;
    float _1806 = _1792 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1808 = _1794 * _1798;
    float _1810 = _1283 * _1345;
    float _1812 = _1796 * _1742;
    float _1814 = _1690 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1816 = fma(_1804, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1808);
    float _1818 = -_1772;
    float _1820 = _1818 + 1.0;
    float _1822 = _1810 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1824 = fma(_1585, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1752);
    bool _1826 = _1345 <= 0.0;
    bool _1828 = !_1762;
    bool _1830 = _1826 || _1828;
    float _1832 = _1820 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1834 = _227 * _1822;
    float _1836 = _1824 + _1599;
    float _1838 = fma(_1740, (*spvDescriptorSet0.vp_c9)._m0[116].x, _1816);
    float _1840 = _1806 * _1800;
    float _1842 = _1708 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1844 = _1716 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1846 = _1838 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_58.x = _1840;
    out.m_58.y = _1812;
    out.m_60.x = _1844;
    out.m_60.y = _1842;
    out.m_60.z = _1814;
    out.m_60.w = _1846;
    out.gl_Position.x = _1625;
    out.gl_Position.y = _1649;
    out.gl_Position.z = _1824;
    out.gl_Position.w = _1599;
    float _1848 = _1834 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1850 = _1836 * 0.5;
    float _1852 = -_1832;
    float _1854 = _1852 + 1.0;
    out.m_45.x = _1848;
    out.m_62.z = _1850;
    out.m_62.w = _1599;
    float _1856 = _1832 * _1665;
    float _1858 = _1676 * _1856;
    float _1860 = _1686 * _1856;
    float _1862 = fma(_1682, _1858, _1670);
    float _1864 = fma(_1684, _1858, _1672);
    float _1866 = _1676 * _1854;
    float _1868 = fma(_1676, _1860, _1674);
    out.m_64.x = _1862;
    out.m_64.y = _1864;
    out.m_64.z = _1868;
    out.m_64.w = _1866;
    if (!_1830)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_45.x = 0.0;
    float _1870 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1870;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

