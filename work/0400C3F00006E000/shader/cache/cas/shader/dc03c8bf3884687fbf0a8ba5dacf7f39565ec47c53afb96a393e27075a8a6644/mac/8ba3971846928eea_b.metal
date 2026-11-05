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
    float4 m_66 [[user(locn2)]];
    float4 m_47 [[user(locn3)]];
    float4 m_62 [[user(locn4)]];
    float4 m_68 [[user(locn6)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
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
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1589 = false;
    bool _921 = false;
    bool _517 = false;
    bool _279 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _82 = in.m_44.w;
    float _84 = trunc(_82);
    int _87 = int(_84);
    bool _91 = _87 >= 1;
    float _93 = 0.0;
    if (!_91)
    {
        _93 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _95 = _93;
    float _97 = _95;
    if (!_91)
    {
        out.m_47.x = 0.0;
    }
    int _99 = 0;
    if (!_91)
    {
        float _101 = _95 * 5.0;
        _99 = as_type<int>(_101);
    }
    int _103 = _99;
    int _105 = _103;
    if (!_91)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2377 = as_type<float>(_103);
        out.gl_Position.z = _2377;
    }
    if (!_91)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _107 = in.m_49.w;
    bool _109 = _107 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _111 = isnan(_107);
    bool _113 = _109 || _111;
    bool _115 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _117 = _113 || _115;
    float _119 = -_107;
    float _121 = _119 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_117)
    {
        float _123 = float(_87);
        _97 = _123;
    }
    float _125 = _97;
    bool _127 = _121 >= _125;
    bool _129 = !_117;
    bool _131 = _127 || _129;
    float _133 = _125;
    if (_131)
    {
        _133 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _135 = _133;
    if (_131)
    {
        out.m_47.x = 0.0;
    }
    if (_131)
    {
        float _137 = _135 * 5.0;
        _105 = as_type<int>(_137);
    }
    int _139 = _105;
    if (_131)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2446 = as_type<float>(_139);
        out.gl_Position.z = _2446;
    }
    if (_131)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _141 = in.m_51.x;
    float _143 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _145 = _121 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _147 = in.m_53.x;
    float _149 = in.m_53.y;
    float _151 = in.m_53.z;
    float _153 = _145 * _143;
    float _155 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[20].x, _153);
    float _157 = floor(_155);
    int _159 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _161 = _159 != 0;
    float _163 = _155 * 6.283185482025146484375;
    float _165 = _149 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _167 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _169 = _167 != 0;
    int _171 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _173 = _171 != 0;
    float _175 = _163 * 0.15915493667125701904296875;
    float _177 = _149 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _179 = _149 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _181 = fma(_147, (*spvDescriptorSet0.vp_c10)._m0[5].x, _165);
    bool _183 = !_169;
    int _185 = _183 ? 0 : 1;
    float _187 = fma(_147, (*spvDescriptorSet0.vp_c10)._m0[4].x, _177);
    float _189 = _175 * 6.283185482025146484375;
    float _191 = cos(_189);
    float _193 = fma(_147, (*spvDescriptorSet0.vp_c10)._m0[6].x, _179);
    int _195 = abs(_185);
    float _197 = fma(_151, (*spvDescriptorSet0.vp_c10)._m0[4].z, _187);
    bool _199 = !_161;
    int _201 = _199 ? 0 : 1;
    float _203 = -_157;
    float _205 = _155 + _203;
    bool _207 = !_173;
    int _209 = _207 ? 0 : 1;
    float _211 = -_205;
    float _213 = fma(_211, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _215 = abs(_201);
    float _217 = float(_195);
    bool _219 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _221 = abs(_209);
    float _223 = fma(_191, 0.5, 0.5);
    float _225 = abs(_213);
    float _227 = _217 * _225;
    bool _229 = _205 < 0.5;
    float _231 = float(_229);
    float _233 = -_223;
    float _235 = fma(_233, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _237 = float(_215);
    float _239 = -_231;
    float _241 = fma(_239, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _243 = float(_221);
    float _245 = fma(_237, _235, _227);
    float _247 = fma(_151, (*spvDescriptorSet0.vp_c10)._m0[5].z, _181);
    float _249 = fma(_151, (*spvDescriptorSet0.vp_c10)._m0[6].z, _193);
    float _251 = abs(_241);
    float _253 = fma(_243, _251, _245);
    bool _255 = !_219;
    float _257 = _197;
    float _259 = _249;
    float _261 = _247;
    float _277;
    if (!_255)
    {
        float _263 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _265 = _141 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _267 = fma(_265, (*spvDescriptorSet0.vp_c9)._m0[12].x, _121);
        float _269 = _267 * _263;
        float _271 = floor(_269);
        float _273 = -_271;
        float _275 = _269 + _273;
        _277 = _275;
        _279 = true;
    }
    else
    {
        float _281 = float(_87);
        float _283 = 1.0 / _281;
        float _285 = _121 * _283;
        _277 = _285;
    }
    _279 = false;
    float _287 = _277;
    float _289 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _291 = _287 + _289;
    float _293 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _295 = _287 + _293;
    float _297 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _299 = _287 + _297;
    float _301 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _303 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _301;
    float _305 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _307 = _305 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _309 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _311 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _309;
    float _313 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _315 = _313 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _317 = 1.0 / _303;
    bool _319 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _321 = 1.0 / _311;
    float _323 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _325 = _287 + _323;
    float _327 = 1.0 / _307;
    float _329 = _299 * _317;
    float _331 = 1.0 / _315;
    float _333 = _291 * _321;
    bool _335 = _287 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _337 = isnan(_287);
    bool _339 = _335 || _337;
    bool _341 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _343 = _339 || _341;
    float _345 = float(_343);
    float _347 = -_345;
    float _349 = _347 + 1.0;
    float _351 = _295 * _327;
    bool _353 = _287 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _355 = isnan(_287);
    bool _357 = _353 || _355;
    bool _359 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _361 = _357 || _359;
    float _363 = float(_361);
    bool _365 = _287 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _367 = isnan(_287);
    bool _369 = _365 || _367;
    bool _371 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _373 = _369 || _371;
    float _375 = float(_373);
    float _377 = -_363;
    float _379 = _377 + 1.0;
    float _381 = _363 * _349;
    float _383 = _325 * _331;
    float _385 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _387 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _385;
    bool _389 = _287 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _391 = isnan(_287);
    bool _393 = _389 || _391;
    bool _395 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _397 = _393 || _395;
    float _399 = float(_397);
    float _401 = _375 * _379;
    float _403 = -_375;
    float _405 = _403 + 1.0;
    float _407 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _409 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _407;
    float _411 = fma(_387, _329, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _413 = _287 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _415 = isnan(_287);
    bool _417 = _413 || _415;
    bool _419 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _421 = _417 || _419;
    float _423 = float(_421);
    float _425 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _427 = _425 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _429 = fma(_409, _329, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _431 = _399 * _405;
    float _433 = -_399;
    float _435 = _433 + 1.0;
    float _437 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _439 = _437 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _441 = -_423;
    float _443 = _441 + 1.0;
    float _445 = fma(_427, _351, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _447 = _423 * _435;
    float _449 = fma(_439, _351, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _451 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _453 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _451;
    float _455 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _457 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _455;
    float _459 = _411 * _447;
    float _461 = _429 * _447;
    float _463 = fma(_453, _333, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _465 = fma(_457, _333, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _467 = fma(_443, (*spvDescriptorSet0.vp_c9)._m0[143].x, _459);
    float _469 = fma(_443, (*spvDescriptorSet0.vp_c9)._m0[143].y, _461);
    float _471 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _473 = _471 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _475 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _477 = _475 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _479 = fma(_445, _431, _467);
    float _481 = fma(_449, _431, _469);
    float _483 = fma(_473, _383, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _485 = fma(_477, _383, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _487 = fma(_463, _401, _479);
    float _489 = fma(_465, _401, _481);
    float _491 = fma(_483, _381, _487);
    float _493 = fma(_485, _381, _489);
    float _495 = fma(_345, (*spvDescriptorSet0.vp_c9)._m0[147].x, _491);
    float _497 = fma(_345, (*spvDescriptorSet0.vp_c9)._m0[147].y, _493);
    bool _499 = !_319;
    float _515;
    if (!_499)
    {
        float _501 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _503 = _141 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _505 = fma(_503, (*spvDescriptorSet0.vp_c9)._m0[11].x, _121);
        float _507 = _505 * _501;
        float _509 = floor(_507);
        float _511 = -_509;
        float _513 = _507 + _511;
        _515 = _513;
        _517 = true;
    }
    else
    {
        float _519 = float(_87);
        float _521 = 1.0 / _519;
        float _523 = _121 * _521;
        _515 = _523;
    }
    _517 = false;
    float _525 = _515;
    float _527 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _529 = _525 + _527;
    float _531 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _533 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _531;
    float _535 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _537 = _535 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _539 = -(*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _541 = (*spvDescriptorSet0.vp_c9)._m0[112].w + _539;
    float _543 = -(*spvDescriptorSet0.vp_c9)._m0[112].w;
    float _545 = _543 + (*spvDescriptorSet0.vp_c9)._m0[113].w;
    float _547 = 1.0 / _533;
    float _549 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _551 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _549;
    float _553 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _555 = _553 + (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _557 = _525 >= (*spvDescriptorSet0.vp_c9)._m0[112].w;
    bool _559 = isnan(_525);
    bool _561 = _557 || _559;
    bool _563 = isnan((*spvDescriptorSet0.vp_c9)._m0[112].w);
    bool _565 = _561 || _563;
    float _567 = float(_565);
    float _569 = 1.0 / _541;
    float _571 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _573 = _525 + _571;
    bool _575 = _525 >= (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _577 = isnan(_525);
    bool _579 = _575 || _577;
    bool _581 = isnan((*spvDescriptorSet0.vp_c9)._m0[111].w);
    bool _583 = _579 || _581;
    float _585 = float(_583);
    bool _587 = _525 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _589 = isnan(_525);
    bool _591 = _587 || _589;
    bool _593 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _595 = _591 || _593;
    float _597 = float(_595);
    float _599 = -_585;
    float _601 = _599 + 1.0;
    float _603 = 1.0 / _537;
    float _605 = _573 * _547;
    float _607 = -(*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _609 = _525 + _607;
    float _611 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _613 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _611;
    bool _615 = _525 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _617 = isnan(_525);
    bool _619 = _615 || _617;
    bool _621 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _623 = _619 || _621;
    float _625 = float(_623);
    float _627 = fma(_613, _605, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _629 = 1.0 / _555;
    float _631 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _633 = _525 + _631;
    float _635 = _609 * _569;
    bool _637 = _525 >= (*spvDescriptorSet0.vp_c9)._m0[113].w;
    bool _639 = isnan(_525);
    bool _641 = _637 || _639;
    bool _643 = isnan((*spvDescriptorSet0.vp_c9)._m0[113].w);
    bool _645 = _641 || _643;
    float _647 = float(_645);
    float _649 = -_567;
    float _651 = _649 + 1.0;
    float _653 = 1.0 / _545;
    float _655 = _633 * _603;
    float _657 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _659 = _525 + _657;
    float _661 = -_647;
    float _663 = _661 + 1.0;
    bool _665 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _667 = _567 * _663;
    float _669 = 1.0 / _551;
    float _671 = _659 * _629;
    float _673 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _675 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _673;
    float _677 = fma(_675, _605, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _679 = _585 * _651;
    float _681 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _683 = _681 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _685 = -(*spvDescriptorSet0.vp_c9)._m0[112].w;
    float _687 = _525 + _685;
    float _689 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _691 = _689 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _693 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _695 = _693 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _697 = fma(_683, _655, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _699 = _687 * _653;
    float _701 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _703 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _701;
    float _705 = -_597;
    float _707 = _705 + 1.0;
    float _709 = _529 * _669;
    float _711 = fma(_691, _655, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _713 = fma(_703, _605, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _715 = _597 * _601;
    bool _717 = _525 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _719 = isnan(_525);
    bool _721 = _717 || _719;
    bool _723 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _725 = _721 || _723;
    float _727 = float(_725);
    float _729 = fma(_695, _655, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    bool _731 = _525 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _733 = isnan(_525);
    bool _735 = _731 || _733;
    bool _737 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _739 = _735 || _737;
    float _741 = float(_739);
    float _743 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _745 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _743;
    float _747 = -_727;
    float _749 = _747 + 1.0;
    float _751 = _741 * _707;
    float _753 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _755 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _753;
    float _757 = _625 * _749;
    float _759 = -_741;
    float _761 = _759 + 1.0;
    float _763 = fma(_755, _709, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _765 = _677 * _757;
    float _767 = _713 * _757;
    float _769 = _627 * _757;
    float _771 = -(*spvDescriptorSet0.vp_c9)._m0[110].x;
    float _773 = _771 + (*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _775 = _727 * _761;
    float _777 = -_625;
    float _779 = _777 + 1.0;
    float _781 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _783 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _781;
    float _785 = fma(_773, _671, (*spvDescriptorSet0.vp_c9)._m0[110].x);
    float _787 = -(*spvDescriptorSet0.vp_c9)._m0[110].y;
    float _789 = _787 + (*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _791 = fma(_779, (*spvDescriptorSet0.vp_c9)._m0[107].x, _765);
    float _793 = fma(_783, _709, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _795 = -(*spvDescriptorSet0.vp_c9)._m0[110].z;
    float _797 = _795 + (*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _799 = fma(_779, (*spvDescriptorSet0.vp_c9)._m0[107].y, _767);
    float _801 = fma(_779, (*spvDescriptorSet0.vp_c9)._m0[107].z, _769);
    float _803 = fma(_711, _775, _791);
    float _805 = fma(_789, _671, (*spvDescriptorSet0.vp_c9)._m0[110].y);
    float _807 = fma(_797, _671, (*spvDescriptorSet0.vp_c9)._m0[110].z);
    float _809 = fma(_745, _709, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _811 = fma(_697, _775, _799);
    float _813 = fma(_729, _775, _801);
    float _815 = fma(_793, _751, _803);
    float _817 = -(*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _819 = (*spvDescriptorSet0.vp_c9)._m0[112].x + _817;
    float _821 = -(*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _823 = (*spvDescriptorSet0.vp_c9)._m0[112].y + _821;
    float _825 = -(*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _827 = (*spvDescriptorSet0.vp_c9)._m0[112].z + _825;
    float _829 = fma(_763, _751, _811);
    float _831 = fma(_809, _751, _813);
    float _833 = fma(_819, _635, (*spvDescriptorSet0.vp_c9)._m0[111].x);
    float _835 = fma(_823, _635, (*spvDescriptorSet0.vp_c9)._m0[111].y);
    float _837 = -(*spvDescriptorSet0.vp_c9)._m0[112].x;
    float _839 = _837 + (*spvDescriptorSet0.vp_c9)._m0[113].x;
    float _841 = -(*spvDescriptorSet0.vp_c9)._m0[112].y;
    float _843 = _841 + (*spvDescriptorSet0.vp_c9)._m0[113].y;
    float _845 = fma(_827, _635, (*spvDescriptorSet0.vp_c9)._m0[111].z);
    float _847 = fma(_785, _715, _815);
    float _849 = fma(_805, _715, _829);
    float _851 = -(*spvDescriptorSet0.vp_c9)._m0[112].z;
    float _853 = _851 + (*spvDescriptorSet0.vp_c9)._m0[113].z;
    float _855 = fma(_807, _715, _831);
    float _857 = fma(_839, _699, (*spvDescriptorSet0.vp_c9)._m0[112].x);
    float _859 = fma(_843, _699, (*spvDescriptorSet0.vp_c9)._m0[112].y);
    float _861 = fma(_853, _699, (*spvDescriptorSet0.vp_c9)._m0[112].z);
    float _863 = fma(_833, _679, _847);
    float _865 = fma(_835, _679, _849);
    float _867 = fma(_845, _679, _855);
    float _869 = fma(_857, _667, _863);
    float _871 = fma(_859, _667, _865);
    float _873 = fma(_861, _667, _867);
    float _875 = fma(_647, (*spvDescriptorSet0.vp_c9)._m0[113].x, _869);
    float _877 = fma(_647, (*spvDescriptorSet0.vp_c9)._m0[113].y, _871);
    float _879 = fma(_647, (*spvDescriptorSet0.vp_c9)._m0[113].z, _873);
    float _881 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _883 = _875 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _885 = _877 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _887 = _879 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _889 = in.m_55.x;
    float _891 = in.m_55.y;
    float _893 = _883 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _895 = _885 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _897 = _887 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_57.x = _893;
    out.m_57.y = _895;
    out.m_57.z = _897;
    out.m_57.w = _881;
    float _899 = _497 * _891;
    float _901 = _495 * _889;
    bool _903 = !_665;
    float _919;
    if (!_903)
    {
        float _905 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _907 = _141 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _909 = fma(_907, (*spvDescriptorSet0.vp_c9)._m0[11].z, _121);
        float _911 = _909 * _905;
        float _913 = floor(_911);
        float _915 = -_913;
        float _917 = _911 + _915;
        _919 = _917;
        _921 = true;
    }
    else
    {
        float _923 = float(_87);
        float _925 = 1.0 / _923;
        float _927 = _121 * _925;
        _919 = _927;
    }
    _921 = false;
    float _929 = _919;
    float _931 = as_type<float>(int(gl_VertexIndex));
    float _933 = _253 * _899;
    float _935 = in.m_44.x;
    float _937 = in.m_44.y;
    float _939 = in.m_44.z;
    float _941 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _943 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _941;
    float _945 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _947 = _945 + (*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _949 = in.m_51.y;
    float _951 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _953 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _951;
    float _955 = 1.0 / _943;
    float _957 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _959 = _957 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _961 = _141 > 0.5;
    float _963 = _253 * _901;
    float _965 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _967 = _929 + _965;
    float _969 = 1.0 / _953;
    float _971 = -(*spvDescriptorSet0.vp_c9)._m0[128].w;
    float _973 = _971 + (*spvDescriptorSet0.vp_c9)._m0[129].w;
    int _975 = as_type<int>(_931) & 1;
    bool _977 = _975 != 0;
    int _979 = as_type<int>(_931) & 2;
    bool _981 = _979 != 0;
    float _983 = 1.0 / _959;
    float _985 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _987 = (*spvDescriptorSet0.vp_c9)._m0[128].w + _985;
    float _989 = _937 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _991 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _993 = _991 != 0;
    int _995 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _997 = _995 != 0;
    bool _999 = _949 > 0.5;
    float _1001 = 1.0 / _987;
    float _1003 = fma(_935, (*spvDescriptorSet0.vp_c10)._m0[5].x, _989);
    float _1005 = _967 * _969;
    float _1007 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _1009 = _929 + _1007;
    float _1011 = -(*spvDescriptorSet0.vp_c9)._m0[128].w;
    float _1013 = _929 + _1011;
    float _1015 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1017 = _929 + _1015;
    float _1019 = 1.0 / _973;
    float _1021 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1023 = _929 + _1021;
    float _1025 = _1017 * _955;
    float _1027 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1029 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1027;
    float _1031 = _1023 * _983;
    float _1033 = 1.0 / _947;
    float _1035 = _1009 * _1001;
    float _1037 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1039 = _1037 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1041 = fma(_1039, _1031, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    bool _1043 = !_981;
    float _1045 = _1043 ? (-0.5) : 0.5;
    float _1047 = _1013 * _1019;
    float _1049 = _937 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1051 = _937 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1053 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1055 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1053;
    float _1057 = fma(_935, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1049);
    float _1059 = fma(_935, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1051);
    float _1061 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _1063 = _929 + _1061;
    float _1065 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1067 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1065;
    float _1069 = fma(_939, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1057);
    float _1071 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1073 = _1071 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1075 = _1063 * _1033;
    float _1077 = fma(_939, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1003);
    float _1079 = fma(_939, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1059);
    float _1081 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1083 = _1081 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1085 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1087 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _1085;
    float _1089 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1091 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _1089;
    float _1093 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1095 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _1093;
    float _1097 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _1099 = _1097 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1101 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _1103 = _1101 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1105 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _1107 = _1105 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1109 = fma(_1087, _1025, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _1111 = fma(_1091, _1025, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _1113 = fma(_1095, _1025, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _1115 = fma(_1067, _1005, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1117 = fma(_1029, _1005, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1119 = fma(_1055, _1005, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1121 = -(*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1123 = (*spvDescriptorSet0.vp_c9)._m0[128].x + _1121;
    float _1125 = -(*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1127 = (*spvDescriptorSet0.vp_c9)._m0[128].y + _1125;
    bool _1129 = !_977;
    float _1131 = _1129 ? (-0.5) : 0.5;
    float _1133 = -(*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1135 = (*spvDescriptorSet0.vp_c9)._m0[128].z + _1133;
    float _1137 = fma(_1073, _1031, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1139 = fma(_1083, _1031, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1141 = fma(_1099, _1075, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    float _1143 = fma(_1103, _1075, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    float _1145 = fma(_1107, _1075, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    float _1147 = _963 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1149 = fma(_1123, _1035, (*spvDescriptorSet0.vp_c9)._m0[127].x);
    float _1151 = fma(_1127, _1035, (*spvDescriptorSet0.vp_c9)._m0[127].y);
    bool _1153 = _929 >= (*spvDescriptorSet0.vp_c9)._m0[129].w;
    bool _1155 = isnan(_929);
    bool _1157 = _1153 || _1155;
    bool _1159 = isnan((*spvDescriptorSet0.vp_c9)._m0[129].w);
    bool _1161 = _1157 || _1159;
    float _1163 = float(_1161);
    float _1165 = fma(_1135, _1035, (*spvDescriptorSet0.vp_c9)._m0[127].z);
    float _1167 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1131);
    float _1169 = _933 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1171 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1045);
    bool _1173 = _929 >= (*spvDescriptorSet0.vp_c9)._m0[128].w;
    bool _1175 = isnan(_929);
    bool _1177 = _1173 || _1175;
    bool _1179 = isnan((*spvDescriptorSet0.vp_c9)._m0[128].w);
    bool _1181 = _1177 || _1179;
    float _1183 = float(_1181);
    float _1185 = _1147 * _1167;
    float _1187 = -_1163;
    float _1189 = _1187 + 1.0;
    float _1191 = _1169 * _1171;
    bool _1193 = _929 >= (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _1195 = isnan(_929);
    bool _1197 = _1193 || _1195;
    bool _1199 = isnan((*spvDescriptorSet0.vp_c9)._m0[127].w);
    bool _1201 = _1197 || _1199;
    float _1203 = float(_1201);
    float _1205 = _1069 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1207 = _1183 * _1189;
    float _1209 = _1191 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1211 = _1191 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1213 = -_1183;
    float _1215 = _1213 + 1.0;
    bool _1217 = _929 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _1219 = isnan(_929);
    bool _1221 = _1217 || _1219;
    bool _1223 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _1225 = _1221 || _1223;
    float _1227 = float(_1225);
    float _1229 = -_1203;
    float _1231 = _1229 + 1.0;
    float _1233 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1235 = fma(_1185, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1209);
    float _1237 = fma(_1185, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1211);
    float _1239 = _1203 * _1215;
    bool _1241 = _929 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1243 = isnan(_929);
    bool _1245 = _1241 || _1243;
    bool _1247 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1249 = _1245 || _1247;
    float _1251 = float(_1249);
    float _1253 = _1227 * _1231;
    float _1255 = -_1227;
    float _1257 = _1255 + 1.0;
    float _1259 = fma(_1233, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1235);
    float _1261 = fma(_1233, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1237);
    float _1263 = _1079 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1265 = _1251 * _1257;
    float _1267 = _1259 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1269 = _1261 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1271 = -_1251;
    float _1273 = _1271 + 1.0;
    float _1275 = -(*spvDescriptorSet0.vp_c9)._m0[128].x;
    float _1277 = _1275 + (*spvDescriptorSet0.vp_c9)._m0[129].x;
    float _1279 = _1205 + _1267;
    float _1281 = _1263 + _1269;
    float _1283 = -(*spvDescriptorSet0.vp_c9)._m0[128].y;
    float _1285 = _1283 + (*spvDescriptorSet0.vp_c9)._m0[129].y;
    float _1287 = -(*spvDescriptorSet0.vp_c9)._m0[128].z;
    float _1289 = _1287 + (*spvDescriptorSet0.vp_c9)._m0[129].z;
    float _1291 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1293 = _1279 + _1291;
    float _1295 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1297 = _1281 + _1295;
    float _1299 = fma(_1277, _1047, (*spvDescriptorSet0.vp_c9)._m0[128].x);
    bool _1301 = _929 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1303 = isnan(_929);
    bool _1305 = _1301 || _1303;
    bool _1307 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1309 = _1305 || _1307;
    float _1311 = float(_1309);
    float _1313 = _1293 * _1293;
    float _1315 = _1297 * _1297;
    float _1317 = fma(_1285, _1047, (*spvDescriptorSet0.vp_c9)._m0[128].y);
    bool _1319 = _929 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1321 = isnan(_929);
    bool _1323 = _1319 || _1321;
    bool _1325 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1327 = _1323 || _1325;
    float _1329 = float(_1327);
    float _1331 = _1311 * _1273;
    float _1333 = _1313 + _1315;
    float _1335 = -_1311;
    float _1337 = _1335 + 1.0;
    float _1339 = _1191 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1341 = _1077 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1343 = sqrt(_1333);
    float _1345 = _1329 * _1337;
    float _1347 = -_1329;
    float _1349 = _1347 + 1.0;
    float _1351 = fma(_1185, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1339);
    float _1353 = fma(_1289, _1047, (*spvDescriptorSet0.vp_c9)._m0[128].z);
    float _1355 = _1115 * _1345;
    float _1357 = _1117 * _1345;
    float _1359 = _1119 * _1345;
    float _1361 = fma(_1233, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1351);
    float _1363 = fma(_1349, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1355);
    float _1365 = fma(_1349, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1357);
    float _1367 = fma(_1349, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1359);
    float _1369 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1371 = fma(_1137, _1331, _1363);
    float _1373 = fma(_1139, _1331, _1365);
    float _1375 = _1361 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    bool _1377 = _1343 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1379 = fma(_1109, _1265, _1371);
    float _1381 = fma(_1041, _1331, _1367);
    float _1383 = fma(_1111, _1265, _1373);
    float _1385 = _1341 + _1375;
    float _1387 = fma(_1141, _1253, _1379);
    float _1389 = -_1131;
    int _1391 = _961 ? as_type<int>(_1389) : as_type<int>(_1131);
    float _1393 = fma(_1113, _1265, _1381);
    float _1395 = -_1045;
    int _1397 = _999 ? as_type<int>(_1395) : as_type<int>(_1045);
    float _1399 = fma(_1149, _1239, _1387);
    bool _1401 = !_993;
    float _1403 = _1401 ? _1131 : as_type<float>(_1391);
    float _1405 = fma(_1143, _1253, _1383);
    bool _1407 = !_997;
    float _1409 = _1407 ? _1045 : as_type<float>(_1397);
    float _1411 = fma(_1145, _1253, _1393);
    float _1413 = _1387;
    float _1415 = _1313;
    float _1417 = _1315;
    float _1419 = _1279;
    float _1421 = _1281;
    float _1423 = _1163;
    if (!_1377)
    {
        _1413 = _1385;
    }
    float _1425 = _1413;
    bool _1427 = !_1377;
    float _1429 = _1425;
    if (!_1427)
    {
        float _1431 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1433 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1435 = _1343 + _1433;
        float _1437 = _1385 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1439 = rsqrt(_1333);
        float _1441 = _1435 * _1431;
        float _1443 = _1441 * 0.15915493667125701904296875;
        float _1445 = _1443 * 6.283185482025146484375;
        float _1447 = sin(_1445);
        float _1449 = _1443 * 6.283185482025146484375;
        float _1451 = cos(_1449);
        float _1453 = fma(_1447, _1437, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1455 = _1439 * _1453;
        float _1457 = _1451 + (-1.0);
        float _1459 = fma(_1293, _1455, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1461 = fma(_1297, _1455, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1463 = _1457 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1465 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1467 = _1459 + _1465;
        float _1469 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1471 = _1461 + _1469;
        float _1473 = fma(_1385, _1451, _1463);
        float _1475 = _1467 * _1467;
        float _1477 = _1471 * _1471;
        _1429 = _1473;
        _1415 = _1475;
        _1417 = _1477;
        _1419 = _1459;
        _1421 = _1461;
    }
    float _1479 = _1429;
    float _1481 = _1415;
    float _1483 = _1417;
    float _1485 = _1419;
    float _1487 = _1421;
    float _1489 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1491 = _1479 + _1489;
    float _1493 = fma(_1151, _1239, _1405);
    float _1495 = fma(_1165, _1239, _1411);
    float _1497 = fma(_1299, _1207, _1399);
    float _1499 = fma(_1491, _1491, _1481);
    float _1501 = fma(_1317, _1207, _1493);
    float _1503 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1505 = fma(_1353, _1207, _1495);
    float _1507 = _1499 + _1483;
    float _1509 = _1403 + 0.5;
    float _1511 = -_1409;
    float _1513 = _1511 + 0.5;
    float _1515 = fma(_1163, (*spvDescriptorSet0.vp_c9)._m0[129].x, _1497);
    float _1517 = fma(_1163, (*spvDescriptorSet0.vp_c9)._m0[129].y, _1501);
    float _1519 = fma(_1163, (*spvDescriptorSet0.vp_c9)._m0[129].z, _1505);
    float _1521 = sqrt(_1507);
    float _1523 = _1509 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1525 = _1513 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1527 = _1515 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1529 = _1517 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1531 = _1519 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1533 = _1523 * _1369;
    float _1535 = _1527 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1537 = _1525 * _1503;
    float _1539 = _1529 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1541 = _1531 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_62.x = _1533;
    out.m_62.y = _1537;
    bool _1543 = _1521 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1545 = isnan(_1521);
    bool _1547 = _1543 || _1545;
    bool _1549 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1551 = _1547 || _1549;
    out.m_64.x = _1535;
    out.m_64.y = _1539;
    out.m_64.z = _1541;
    float _1553 = _1535;
    if (!_1551)
    {
        _1423 = 1.0;
    }
    float _1555 = _1423;
    bool _1557 = !_1551;
    float _1559 = _1555;
    if (!_1557)
    {
        bool _1561 = _1521 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1563 = isnan(_1521);
        bool _1565 = _1561 || _1563;
        bool _1567 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1569 = _1565 || _1567;
        if (!_1569)
        {
            float _1571 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1573 = _1521 + _1571;
            float _1575 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1577 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1575;
            float _1579 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1581 = _1579 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1583 = 1.0 / _1577;
            float _1585 = _1573 * _1583;
            float _1587 = fma(_1585, _1581, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1559 = _1587;
            _1589 = true;
        }
        else
        {
            bool _1591 = _1521 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1593 = isnan(_1521);
            bool _1595 = _1591 || _1593;
            bool _1597 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1599 = _1595 || _1597;
            if (!_1599)
            {
                float _1601 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1603 = _1521 + _1601;
                float _1605 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1607 = _1605 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1609 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1611 = _1609 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1613 = 1.0 / _1607;
                float _1615 = _1603 * _1613;
                float _1617 = fma(_1615, _1611, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1559 = _1617;
                _1589 = true;
            }
            else
            {
                _1559 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1589 = false;
    float _1619 = _1559;
    float _1621 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1623 = _1479 + _1621;
    float _1625 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1627 = _1485 + _1625;
    float _1629 = fma(_1623, _1619, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1631 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1633 = _1487 + _1631;
    float _1635 = fma(_1627, _1619, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1637 = _1341 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1639 = -_1341;
    float _1641 = _1639 + _1629;
    float _1643 = fma(_1633, _1619, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1645 = -_1205;
    float _1647 = _1645 + _1635;
    bool _1649 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1651 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1653 = _1649 || _1651;
    bool _1655 = isnan(0.5);
    bool _1657 = _1653 || _1655;
    float _1659 = _1641 * _1641;
    float _1661 = -_1263;
    float _1663 = _1661 + _1643;
    float _1665 = fma(_1647, _1647, _1659);
    float _1667 = fma(_1663, _1663, _1665);
    float _1669 = fma(_1205, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1637);
    float _1671 = _1341 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1673 = sqrt(_1667);
    float _1675 = fma(_1263, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1669);
    float _1677 = _1675 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1679 = fma(_1205, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1671);
    float _1681 = 1.0 / _1677;
    float _1683 = fma(_1263, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1679);
    float _1685 = _1683 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _1687 = _1673 > 0.0;
    float _1689 = _1685 + _1677;
    bool _1691 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1693 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1695 = _1691 || _1693;
    bool _1697 = isnan(0.5);
    bool _1699 = _1695 || _1697;
    float _1701 = _1689 * _1681;
    float _1703 = _1701 * 0.5;
    float _1705 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _1707 = _1677;
    float _1709 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    float _1711 = _1689;
    float _1713 = _1667;
    if (!_1687)
    {
        _1705 = _1635;
    }
    float _1715 = _1705;
    float _1717 = _1715;
    float _1719 = _1715;
    if (!_1687)
    {
        _1707 = _1629;
    }
    float _1721 = _1707;
    float _1723 = _1721;
    if (!_1687)
    {
        _1709 = _1643;
    }
    float _1725 = _1709;
    bool _1727 = !_1687;
    float _1729 = _1725;
    float _1731 = _1725;
    if (!_1727)
    {
        float _1733 = _247 * _247;
        float _1735 = fma(_197, _197, _1733);
        float _1737 = fma(_249, _249, _1735);
        float _1739 = rsqrt(_1667);
        float _1741 = sqrt(_1737);
        float _1743 = _1647 * _1739;
        float _1745 = _1641 * _1739;
        float _1747 = _1663 * _1739;
        bool _1749 = _1741 > 0.0;
        float _1751 = _1741;
        _1553 = _1737;
        _1711 = _1739;
        if (!_1749)
        {
            _1717 = _1635;
        }
        float _1753 = _1717;
        _1719 = _1753;
        if (!_1749)
        {
            _1751 = _1629;
        }
        float _1755 = _1751;
        _1723 = _1755;
        if (!_1749)
        {
            _1729 = _1643;
        }
        float _1757 = _1729;
        bool _1759 = !_1749;
        _1731 = _1757;
        if (!_1759)
        {
            float _1761 = rsqrt(_1737);
            float _1763 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1765 = _247 * _1761;
            float _1767 = _197 * _1761;
            float _1769 = _1745 * _1765;
            float _1771 = _249 * _1761;
            float _1773 = fma(_1743, _1767, _1769);
            float _1775 = _1763 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1777 = fma(_1747, _1771, _1773);
            float _1779 = _1777 * _1775;
            float _1781 = fma(_197, _1779, _1635);
            float _1783 = fma(_247, _1779, _1629);
            float _1785 = fma(_249, _1779, _1643);
            _1719 = _1781;
            _1723 = _1783;
            _1731 = _1785;
            _1553 = _1761;
            _1711 = _1779;
        }
    }
    float _1787 = _1719;
    float _1789 = _1723;
    float _1791 = _1731;
    float _1793 = _1553;
    float _1795 = _1711;
    float _1797 = _1795;
    float _1799 = _1793;
    if (_1657)
    {
        _1797 = 1.0;
    }
    float _1801 = _1797;
    float _1803 = _1801;
    if (_1699)
    {
        _257 = _1787;
    }
    float _1805 = _257;
    float _1807 = _1805;
    if (_1699)
    {
        _259 = _1789;
    }
    float _1809 = _259;
    float _1811 = _1809;
    if (_1699)
    {
        _261 = _1791;
    }
    float _1813 = _261;
    float _1815 = _1813;
    if (!_1699)
    {
        float _1817 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1819 = _1341 + _1817;
        float _1821 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1823 = _1205 + _1821;
        float _1825 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1827 = -_1263;
        float _1829 = _1827 + _1791;
        float _1831 = _1819 * _1819;
        float _1833 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1835 = _1263 + _1833;
        float _1837 = fma(_1823, _1823, _1831);
        float _1839 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1841 = fma(_1835, _1835, _1837);
        float _1843 = sqrt(_1841);
        float _1845 = _1825 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1847 = precise::min(_1843, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1849 = _1847 * _1839;
        float _1851 = -_1205;
        float _1853 = _1851 + _1787;
        float _1855 = _1845 * _1849;
        float _1857 = -_1341;
        float _1859 = _1857 + _1789;
        float _1861 = fma(_1853, _1855, _1205);
        float _1863 = fma(_1859, _1855, _1341);
        float _1865 = fma(_1829, _1855, _1263);
        _1811 = _1863;
        _1807 = _1861;
        _1815 = _1865;
        _1799 = _1855;
    }
    float _1867 = _1811;
    float _1869 = _1807;
    float _1871 = _1815;
    float _1873 = _1799;
    float _1875 = _1873;
    if (!_1657)
    {
        float _1877 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1879 = _1877 * 0.15915493667125701904296875;
        float _1881 = _1879 * 6.283185482025146484375;
        float _1883 = cos(_1881);
        float _1885 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1887 = _1885 * 0.15915493667125701904296875;
        float _1889 = _1879 * 6.283185482025146484375;
        float _1891 = sin(_1889);
        float _1893 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1895 = fma(_1703, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1893);
        float _1897 = 1.0 / _1883;
        float _1899 = _1887 * 6.283185482025146484375;
        float _1901 = cos(_1899);
        float _1903 = _1891 * _1897;
        float _1905 = 1.0 / _1895;
        float _1907 = _1901 * _1903;
        float _1909 = _1887 * 6.283185482025146484375;
        float _1911 = sin(_1909);
        float _1913 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1915 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1913;
        float _1917 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1919 = _1905 * _1917;
        float _1921 = 1.0 / _1907;
        float _1923 = 1.0 / _1915;
        float _1925 = _1911 * _1921;
        float _1927 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1929 = fma(_1925, _1919, _1927);
        float _1931 = _1929 * _1923;
        float _1933 = precise::clamp(_1931, 0.0, 1.0);
        _1803 = _1933;
    }
    float _1935 = _1803;
    float _1937 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1939 = _1867 + _1937;
    float _1941 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1943 = _1869 + _1941;
    float _1945 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1947 = _1871 + _1945;
    float _1949 = _1939 * _1939;
    float _1951 = fma(_1943, _1943, _1949);
    float _1953 = fma(_1947, _1947, _1951);
    float _1955 = rsqrt(_1953);
    float _1957 = _1955 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1959 = _1943 * _1957;
    float _1961 = _1947 * _1957;
    float _1963 = _1959 * _1959;
    float _1965 = _1961 * _1961;
    float _1967 = _1963 + _1965;
    float _1969 = sqrt(_1967);
    bool _1971 = _1969 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1973 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1975 = _1969 + _1973;
    float _1977 = _1947;
    float _1979 = _1949;
    float _1981 = _1975;
    float _1983 = _1939;
    float _1985 = _1959;
    if (_1971)
    {
        float _1987 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1977 = _1987;
    }
    float _1989 = _1977;
    if (_1971)
    {
        float _1991 = rsqrt(_1967);
        _1979 = _1991;
    }
    float _1993 = _1979;
    float _1995 = _1993;
    if (_1971)
    {
        float _1997 = _1975 * _1989;
        _1981 = _1997;
    }
    float _1999 = _1981;
    if (_1971)
    {
        float _2001 = _1999 * 0.15915493667125701904296875;
        _1875 = _2001;
    }
    float _2003 = _1875;
    float _2005 = _1955;
    if (_1971)
    {
        float _2007 = _2003 * 6.283185482025146484375;
        float _2009 = sin(_2007);
        _2005 = _2009;
    }
    float _2011 = _2005;
    float _2013 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2015 = precise::max(0.0, _2013);
    float _2017 = _1989;
    float _2019 = _2015;
    if (_1971)
    {
        float _2021 = _2003 * 6.283185482025146484375;
        float _2023 = cos(_2021);
        _2017 = _2023;
    }
    float _2025 = _2017;
    float _2027 = -_1957;
    float _2029 = -_2015;
    float _2031 = fma(_1939, _2027, _2029);
    float _2033 = _2031;
    if (_1971)
    {
        float _2035 = _2031 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1983 = _2035;
    }
    float _2037 = _1983;
    float _2039 = _1867 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2041 = _2011;
    float _2043 = _2037;
    if (_1971)
    {
        float _2045 = fma(_2011, _2037, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2041 = _2045;
    }
    float _2047 = _2041;
    if (!_1971)
    {
        _2043 = _1963;
    }
    float _2049 = _2043;
    float _2051 = _2049;
    if (_1971)
    {
        float _2053 = _2025 + (-1.0);
        _2019 = _2053;
    }
    float _2055 = _2019;
    float _2057 = _2055;
    if (_1971)
    {
        float _2059 = _1993 * _2047;
        _1713 = _2059;
    }
    float _2061 = _1713;
    if (!_1971)
    {
        _1995 = _1961;
    }
    float _2063 = _1995;
    float _2065 = sqrt(_1953);
    float _2067 = _2063;
    if (_1971)
    {
        float _2069 = _2055 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2057 = _2069;
    }
    float _2071 = _2057;
    float _2073 = _2071;
    if (_1971)
    {
        float _2075 = _1959 * _2061;
        _1985 = _2075;
    }
    float _2077 = _1985;
    if (_1971)
    {
        float _2079 = _1961 * _2061;
        _2067 = _2079;
    }
    float _2081 = _2067;
    if (_1971)
    {
        float _2083 = fma(_2031, _2025, _2071);
        _2033 = _2083;
    }
    float _2085 = _2033;
    if (_1971)
    {
        float _2087 = _2077 * _2077;
        _2051 = _2087;
    }
    float _2089 = _2051;
    if (!_1971)
    {
        _2073 = _1965;
    }
    float _2091 = _2073;
    float _2093 = _2091;
    if (_1971)
    {
        float _2095 = _2081 * _2081;
        _2093 = _2095;
    }
    float _2097 = _2093;
    float _2099 = fma(_2085, _2085, _2089);
    float _2101 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2103 = _2099 + _2097;
    float _2105 = _1867 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2107 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2109 = fma(_2065, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2107);
    float _2111 = precise::clamp(_2109, 0.0, 1.0);
    float _2113 = fma(_1869, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2105);
    float _2115 = rsqrt(_2103);
    float _2117 = _1867 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2119 = -_2111;
    float _2121 = _2119 + 1.0;
    float _2123 = fma(_1871, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2113);
    float _2125 = _1867 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2127 = fma(_1869, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2117);
    float _2129 = _2123 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2131 = fma(_1869, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2125);
    float _2133 = fma(_1871, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2127);
    float _2135 = abs(_2121);
    float _2137 = log2(_2135);
    float _2139 = fma(_1869, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2039);
    float _2141 = fma(_1871, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2131);
    float _2143 = _2133 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2145 = _2129 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2147 = fma(_1871, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2139);
    float _2149 = _2115 * _2077;
    float _2151 = _2141 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2153 = _2143 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2155 = _2115 * _2085;
    float _2157 = _2149 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2159 = _2115 * _2081;
    float _2161 = fma(_2151, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2153);
    float _2163 = -_2145;
    float _2165 = fma(_2163, _2101, 1.0);
    float _2167 = -_2157;
    float _2169 = fma(_2155, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2167);
    float _2171 = _2147 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2173 = fma(_2129, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2161);
    float _2175 = _2137 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2177 = -_2159;
    float _2179 = fma(_2177, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2169);
    float _2181 = _2143 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2183 = fma(_2171, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2173);
    float _2185 = log2(_2165);
    float _2187 = fma(_2179, -0.5, 0.5);
    float _2189 = _2143 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2191 = fma(_2151, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2181);
    float _2193 = fma(_2179, 0.5, 0.5);
    float _2195 = _2155 + 1.0;
    float _2197 = fma(_2151, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2189);
    float _2199 = fma(_2129, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2191);
    float _2201 = exp2(_2175);
    float _2203 = fma(_2193, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2205 = fma(_2129, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2197);
    float _2207 = fma(_2171, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2199);
    float _2209 = fma(_2193, _2203, -0.212114393711090087890625);
    float _2211 = fma(_2171, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2205);
    float _2213 = 1.0 / _2183;
    float _2215 = _2185 * 0.693147182464599609375;
    float _2217 = fma(_2193, _2209, 1.570728778839111328125);
    float _2219 = _2215 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2221 = sqrt(_2187);
    float _2223 = -_2155;
    float _2225 = fma(_2201, _2195, _2223);
    float _2227 = fma(_2225, 0.5, 0.5);
    float _2229 = _2207 * _2213;
    float _2231 = _2211 * _2213;
    float _2233 = fma(_2229, 0.5, 0.5);
    float _2235 = fma(_2231, -0.5, 0.5);
    float _2237 = _2221 * 0.636619746685028076171875;
    float3 _5891 = float3(_2233, _2235, _2219);
    float _2239 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5891, float3(0.0), isnan(_5891)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5891, float3(0.0), isnan(_5891)), level(0.0)).x;
    float3 _5902 = float3(_2233, _2235, _2219);
    float4 _2242 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5902, float3(0.0), isnan(_5902)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5902, float3(0.0), isnan(_5902)), level(0.0)).xyzw;
    float _2244 = _2242.x;
    float _2246 = _2242.y;
    float _2248 = _2242.z;
    float _2250 = _2242.w;
    float _2252 = -_2217;
    float _2254 = fma(_2237, _2252, 1.0);
    float2 _5924 = float2(_2254, _2227);
    float3 _2258 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5924, float2(0.0), isnan(_5924)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5924, float2(0.0), isnan(_5924)), level(0.0)).xyz;
    float _2260 = _2258.x;
    float _2262 = _2258.y;
    float _2264 = _2258.z;
    float _2266 = _2137 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2268 = _2143 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _2270 = _1935 > 0.0;
    bool _2272 = isnan(_1935);
    bool _2274 = _2270 || _2272;
    bool _2276 = isnan(0.0);
    bool _2278 = _2274 || _2276;
    float _2280 = fma(_2151, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2268);
    float _2282 = exp2(_2266);
    float _2284 = fma(_2129, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2280);
    float _2286 = fma(_2171, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2284);
    float _2288 = _1935 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2290 = _2286 + _2183;
    out.gl_Position.x = _2207;
    out.gl_Position.y = _2211;
    out.gl_Position.z = _2286;
    out.gl_Position.w = _2183;
    float _2292 = _2288 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2294 = _2290 * 0.5;
    float _2296 = -_2282;
    float _2298 = _2296 + 1.0;
    out.m_47.x = _2292;
    float _2300 = _2298 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_66.z = _2294;
    out.m_66.w = _2183;
    float _2302 = -_2300;
    float _2304 = _2302 + 1.0;
    float _2306 = _2300 * _2239;
    float _2308 = _2250 * _2306;
    float _2310 = _2264 * _2306;
    float _2312 = fma(_2260, _2308, _2244);
    float _2314 = fma(_2262, _2308, _2246);
    float _2316 = _2250 * _2304;
    float _2318 = fma(_2250, _2310, _2248);
    out.m_68.x = _2312;
    out.m_68.y = _2314;
    out.m_68.z = _2318;
    out.m_68.w = _2316;
    if (_2278)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_47.x = 0.0;
    float _2320 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2320;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1589 = false;
    bool _921 = false;
    bool _517 = false;
    bool _279 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _82 = in.m_44.w;
    float _84 = trunc(_82);
    int _87 = int(_84);
    bool _91 = _87 >= 1;
    float _93 = 0.0;
    if (!_91)
    {
        _93 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _95 = _93;
    float _97 = _95;
    if (!_91)
    {
        out.m_47.x = 0.0;
    }
    int _99 = 0;
    if (!_91)
    {
        float _101 = _95 * 5.0;
        _99 = as_type<int>(_101);
    }
    int _103 = _99;
    int _105 = _103;
    if (!_91)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2377 = as_type<float>(_103);
        out.gl_Position.z = _2377;
    }
    if (!_91)
    {
        return out;
    }
    float _107 = in.m_49.w;
    bool _109 = _107 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _111 = isnan(_107);
    bool _113 = _109 || _111;
    bool _115 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _117 = _113 || _115;
    float _119 = -_107;
    float _121 = _119 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_117)
    {
        float _123 = float(_87);
        _97 = _123;
    }
    float _125 = _97;
    bool _127 = _121 >= _125;
    bool _129 = !_117;
    bool _131 = _127 || _129;
    float _133 = _125;
    if (_131)
    {
        _133 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _135 = _133;
    if (_131)
    {
        out.m_47.x = 0.0;
    }
    if (_131)
    {
        float _137 = _135 * 5.0;
        _105 = as_type<int>(_137);
    }
    int _139 = _105;
    if (_131)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2446 = as_type<float>(_139);
        out.gl_Position.z = _2446;
    }
    if (_131)
    {
        return out;
    }
    float _141 = in.m_51.x;
    float _143 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _145 = _121 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _147 = in.m_53.x;
    float _149 = in.m_53.y;
    float _151 = in.m_53.z;
    float _153 = _145 * _143;
    float _155 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[20].x, _153);
    float _157 = floor(_155);
    int _159 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _161 = _159 != 0;
    float _163 = _155 * 6.283185482025146484375;
    float _165 = _149 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _167 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _169 = _167 != 0;
    int _171 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _173 = _171 != 0;
    float _175 = _163 * 0.15915493667125701904296875;
    float _177 = _149 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _179 = _149 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _181 = fma(_147, (*spvDescriptorSet0.vp_c10)._m0[5].x, _165);
    bool _183 = !_169;
    int _185 = _183 ? 0 : 1;
    float _187 = fma(_147, (*spvDescriptorSet0.vp_c10)._m0[4].x, _177);
    float _189 = _175 * 6.283185482025146484375;
    float _191 = cos(_189);
    float _193 = fma(_147, (*spvDescriptorSet0.vp_c10)._m0[6].x, _179);
    int _195 = abs(_185);
    float _197 = fma(_151, (*spvDescriptorSet0.vp_c10)._m0[4].z, _187);
    bool _199 = !_161;
    int _201 = _199 ? 0 : 1;
    float _203 = -_157;
    float _205 = _155 + _203;
    bool _207 = !_173;
    int _209 = _207 ? 0 : 1;
    float _211 = -_205;
    float _213 = fma(_211, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _215 = abs(_201);
    float _217 = float(_195);
    bool _219 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _221 = abs(_209);
    float _223 = fma(_191, 0.5, 0.5);
    float _225 = abs(_213);
    float _227 = _217 * _225;
    bool _229 = _205 < 0.5;
    float _231 = float(_229);
    float _233 = -_223;
    float _235 = fma(_233, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _237 = float(_215);
    float _239 = -_231;
    float _241 = fma(_239, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _243 = float(_221);
    float _245 = fma(_237, _235, _227);
    float _247 = fma(_151, (*spvDescriptorSet0.vp_c10)._m0[5].z, _181);
    float _249 = fma(_151, (*spvDescriptorSet0.vp_c10)._m0[6].z, _193);
    float _251 = abs(_241);
    float _253 = fma(_243, _251, _245);
    bool _255 = !_219;
    float _257 = _197;
    float _259 = _249;
    float _261 = _247;
    float _277;
    if (!_255)
    {
        float _263 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _265 = _141 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _267 = fma(_265, (*spvDescriptorSet0.vp_c9)._m0[12].x, _121);
        float _269 = _267 * _263;
        float _271 = floor(_269);
        float _273 = -_271;
        float _275 = _269 + _273;
        _277 = _275;
        _279 = true;
    }
    else
    {
        float _281 = float(_87);
        float _283 = 1.0 / _281;
        float _285 = _121 * _283;
        _277 = _285;
    }
    _279 = false;
    float _287 = _277;
    float _289 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _291 = _287 + _289;
    float _293 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _295 = _287 + _293;
    float _297 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _299 = _287 + _297;
    float _301 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _303 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _301;
    float _305 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _307 = _305 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _309 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _311 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _309;
    float _313 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _315 = _313 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _317 = 1.0 / _303;
    bool _319 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _321 = 1.0 / _311;
    float _323 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _325 = _287 + _323;
    float _327 = 1.0 / _307;
    float _329 = _299 * _317;
    float _331 = 1.0 / _315;
    float _333 = _291 * _321;
    bool _335 = _287 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _337 = isnan(_287);
    bool _339 = _335 || _337;
    bool _341 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _343 = _339 || _341;
    float _345 = float(_343);
    float _347 = -_345;
    float _349 = _347 + 1.0;
    float _351 = _295 * _327;
    bool _353 = _287 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _355 = isnan(_287);
    bool _357 = _353 || _355;
    bool _359 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _361 = _357 || _359;
    float _363 = float(_361);
    bool _365 = _287 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _367 = isnan(_287);
    bool _369 = _365 || _367;
    bool _371 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _373 = _369 || _371;
    float _375 = float(_373);
    float _377 = -_363;
    float _379 = _377 + 1.0;
    float _381 = _363 * _349;
    float _383 = _325 * _331;
    float _385 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _387 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _385;
    bool _389 = _287 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _391 = isnan(_287);
    bool _393 = _389 || _391;
    bool _395 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _397 = _393 || _395;
    float _399 = float(_397);
    float _401 = _375 * _379;
    float _403 = -_375;
    float _405 = _403 + 1.0;
    float _407 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _409 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _407;
    float _411 = fma(_387, _329, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _413 = _287 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _415 = isnan(_287);
    bool _417 = _413 || _415;
    bool _419 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _421 = _417 || _419;
    float _423 = float(_421);
    float _425 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _427 = _425 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _429 = fma(_409, _329, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _431 = _399 * _405;
    float _433 = -_399;
    float _435 = _433 + 1.0;
    float _437 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _439 = _437 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _441 = -_423;
    float _443 = _441 + 1.0;
    float _445 = fma(_427, _351, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _447 = _423 * _435;
    float _449 = fma(_439, _351, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _451 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _453 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _451;
    float _455 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _457 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _455;
    float _459 = _411 * _447;
    float _461 = _429 * _447;
    float _463 = fma(_453, _333, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _465 = fma(_457, _333, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _467 = fma(_443, (*spvDescriptorSet0.vp_c9)._m0[143].x, _459);
    float _469 = fma(_443, (*spvDescriptorSet0.vp_c9)._m0[143].y, _461);
    float _471 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _473 = _471 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _475 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _477 = _475 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _479 = fma(_445, _431, _467);
    float _481 = fma(_449, _431, _469);
    float _483 = fma(_473, _383, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _485 = fma(_477, _383, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _487 = fma(_463, _401, _479);
    float _489 = fma(_465, _401, _481);
    float _491 = fma(_483, _381, _487);
    float _493 = fma(_485, _381, _489);
    float _495 = fma(_345, (*spvDescriptorSet0.vp_c9)._m0[147].x, _491);
    float _497 = fma(_345, (*spvDescriptorSet0.vp_c9)._m0[147].y, _493);
    bool _499 = !_319;
    float _515;
    if (!_499)
    {
        float _501 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _503 = _141 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _505 = fma(_503, (*spvDescriptorSet0.vp_c9)._m0[11].x, _121);
        float _507 = _505 * _501;
        float _509 = floor(_507);
        float _511 = -_509;
        float _513 = _507 + _511;
        _515 = _513;
        _517 = true;
    }
    else
    {
        float _519 = float(_87);
        float _521 = 1.0 / _519;
        float _523 = _121 * _521;
        _515 = _523;
    }
    _517 = false;
    float _525 = _515;
    float _527 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _529 = _525 + _527;
    float _531 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _533 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _531;
    float _535 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _537 = _535 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _539 = -(*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _541 = (*spvDescriptorSet0.vp_c9)._m0[112].w + _539;
    float _543 = -(*spvDescriptorSet0.vp_c9)._m0[112].w;
    float _545 = _543 + (*spvDescriptorSet0.vp_c9)._m0[113].w;
    float _547 = 1.0 / _533;
    float _549 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _551 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _549;
    float _553 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _555 = _553 + (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _557 = _525 >= (*spvDescriptorSet0.vp_c9)._m0[112].w;
    bool _559 = isnan(_525);
    bool _561 = _557 || _559;
    bool _563 = isnan((*spvDescriptorSet0.vp_c9)._m0[112].w);
    bool _565 = _561 || _563;
    float _567 = float(_565);
    float _569 = 1.0 / _541;
    float _571 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _573 = _525 + _571;
    bool _575 = _525 >= (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _577 = isnan(_525);
    bool _579 = _575 || _577;
    bool _581 = isnan((*spvDescriptorSet0.vp_c9)._m0[111].w);
    bool _583 = _579 || _581;
    float _585 = float(_583);
    bool _587 = _525 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _589 = isnan(_525);
    bool _591 = _587 || _589;
    bool _593 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _595 = _591 || _593;
    float _597 = float(_595);
    float _599 = -_585;
    float _601 = _599 + 1.0;
    float _603 = 1.0 / _537;
    float _605 = _573 * _547;
    float _607 = -(*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _609 = _525 + _607;
    float _611 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _613 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _611;
    bool _615 = _525 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _617 = isnan(_525);
    bool _619 = _615 || _617;
    bool _621 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _623 = _619 || _621;
    float _625 = float(_623);
    float _627 = fma(_613, _605, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _629 = 1.0 / _555;
    float _631 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _633 = _525 + _631;
    float _635 = _609 * _569;
    bool _637 = _525 >= (*spvDescriptorSet0.vp_c9)._m0[113].w;
    bool _639 = isnan(_525);
    bool _641 = _637 || _639;
    bool _643 = isnan((*spvDescriptorSet0.vp_c9)._m0[113].w);
    bool _645 = _641 || _643;
    float _647 = float(_645);
    float _649 = -_567;
    float _651 = _649 + 1.0;
    float _653 = 1.0 / _545;
    float _655 = _633 * _603;
    float _657 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _659 = _525 + _657;
    float _661 = -_647;
    float _663 = _661 + 1.0;
    bool _665 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _667 = _567 * _663;
    float _669 = 1.0 / _551;
    float _671 = _659 * _629;
    float _673 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _675 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _673;
    float _677 = fma(_675, _605, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _679 = _585 * _651;
    float _681 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _683 = _681 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _685 = -(*spvDescriptorSet0.vp_c9)._m0[112].w;
    float _687 = _525 + _685;
    float _689 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _691 = _689 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _693 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _695 = _693 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _697 = fma(_683, _655, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _699 = _687 * _653;
    float _701 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _703 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _701;
    float _705 = -_597;
    float _707 = _705 + 1.0;
    float _709 = _529 * _669;
    float _711 = fma(_691, _655, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _713 = fma(_703, _605, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _715 = _597 * _601;
    bool _717 = _525 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _719 = isnan(_525);
    bool _721 = _717 || _719;
    bool _723 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _725 = _721 || _723;
    float _727 = float(_725);
    float _729 = fma(_695, _655, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    bool _731 = _525 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _733 = isnan(_525);
    bool _735 = _731 || _733;
    bool _737 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _739 = _735 || _737;
    float _741 = float(_739);
    float _743 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _745 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _743;
    float _747 = -_727;
    float _749 = _747 + 1.0;
    float _751 = _741 * _707;
    float _753 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _755 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _753;
    float _757 = _625 * _749;
    float _759 = -_741;
    float _761 = _759 + 1.0;
    float _763 = fma(_755, _709, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _765 = _677 * _757;
    float _767 = _713 * _757;
    float _769 = _627 * _757;
    float _771 = -(*spvDescriptorSet0.vp_c9)._m0[110].x;
    float _773 = _771 + (*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _775 = _727 * _761;
    float _777 = -_625;
    float _779 = _777 + 1.0;
    float _781 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _783 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _781;
    float _785 = fma(_773, _671, (*spvDescriptorSet0.vp_c9)._m0[110].x);
    float _787 = -(*spvDescriptorSet0.vp_c9)._m0[110].y;
    float _789 = _787 + (*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _791 = fma(_779, (*spvDescriptorSet0.vp_c9)._m0[107].x, _765);
    float _793 = fma(_783, _709, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _795 = -(*spvDescriptorSet0.vp_c9)._m0[110].z;
    float _797 = _795 + (*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _799 = fma(_779, (*spvDescriptorSet0.vp_c9)._m0[107].y, _767);
    float _801 = fma(_779, (*spvDescriptorSet0.vp_c9)._m0[107].z, _769);
    float _803 = fma(_711, _775, _791);
    float _805 = fma(_789, _671, (*spvDescriptorSet0.vp_c9)._m0[110].y);
    float _807 = fma(_797, _671, (*spvDescriptorSet0.vp_c9)._m0[110].z);
    float _809 = fma(_745, _709, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _811 = fma(_697, _775, _799);
    float _813 = fma(_729, _775, _801);
    float _815 = fma(_793, _751, _803);
    float _817 = -(*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _819 = (*spvDescriptorSet0.vp_c9)._m0[112].x + _817;
    float _821 = -(*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _823 = (*spvDescriptorSet0.vp_c9)._m0[112].y + _821;
    float _825 = -(*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _827 = (*spvDescriptorSet0.vp_c9)._m0[112].z + _825;
    float _829 = fma(_763, _751, _811);
    float _831 = fma(_809, _751, _813);
    float _833 = fma(_819, _635, (*spvDescriptorSet0.vp_c9)._m0[111].x);
    float _835 = fma(_823, _635, (*spvDescriptorSet0.vp_c9)._m0[111].y);
    float _837 = -(*spvDescriptorSet0.vp_c9)._m0[112].x;
    float _839 = _837 + (*spvDescriptorSet0.vp_c9)._m0[113].x;
    float _841 = -(*spvDescriptorSet0.vp_c9)._m0[112].y;
    float _843 = _841 + (*spvDescriptorSet0.vp_c9)._m0[113].y;
    float _845 = fma(_827, _635, (*spvDescriptorSet0.vp_c9)._m0[111].z);
    float _847 = fma(_785, _715, _815);
    float _849 = fma(_805, _715, _829);
    float _851 = -(*spvDescriptorSet0.vp_c9)._m0[112].z;
    float _853 = _851 + (*spvDescriptorSet0.vp_c9)._m0[113].z;
    float _855 = fma(_807, _715, _831);
    float _857 = fma(_839, _699, (*spvDescriptorSet0.vp_c9)._m0[112].x);
    float _859 = fma(_843, _699, (*spvDescriptorSet0.vp_c9)._m0[112].y);
    float _861 = fma(_853, _699, (*spvDescriptorSet0.vp_c9)._m0[112].z);
    float _863 = fma(_833, _679, _847);
    float _865 = fma(_835, _679, _849);
    float _867 = fma(_845, _679, _855);
    float _869 = fma(_857, _667, _863);
    float _871 = fma(_859, _667, _865);
    float _873 = fma(_861, _667, _867);
    float _875 = fma(_647, (*spvDescriptorSet0.vp_c9)._m0[113].x, _869);
    float _877 = fma(_647, (*spvDescriptorSet0.vp_c9)._m0[113].y, _871);
    float _879 = fma(_647, (*spvDescriptorSet0.vp_c9)._m0[113].z, _873);
    float _881 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _883 = _875 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _885 = _877 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _887 = _879 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _889 = in.m_55.x;
    float _891 = in.m_55.y;
    float _893 = _883 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _895 = _885 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _897 = _887 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_57.x = _893;
    out.m_57.y = _895;
    out.m_57.z = _897;
    out.m_57.w = _881;
    float _899 = _497 * _891;
    float _901 = _495 * _889;
    bool _903 = !_665;
    float _919;
    if (!_903)
    {
        float _905 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _907 = _141 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _909 = fma(_907, (*spvDescriptorSet0.vp_c9)._m0[11].z, _121);
        float _911 = _909 * _905;
        float _913 = floor(_911);
        float _915 = -_913;
        float _917 = _911 + _915;
        _919 = _917;
        _921 = true;
    }
    else
    {
        float _923 = float(_87);
        float _925 = 1.0 / _923;
        float _927 = _121 * _925;
        _919 = _927;
    }
    _921 = false;
    float _929 = _919;
    float _931 = as_type<float>(int(gl_VertexIndex));
    float _933 = _253 * _899;
    float _935 = in.m_44.x;
    float _937 = in.m_44.y;
    float _939 = in.m_44.z;
    float _941 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _943 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _941;
    float _945 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _947 = _945 + (*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _949 = in.m_51.y;
    float _951 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _953 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _951;
    float _955 = 1.0 / _943;
    float _957 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _959 = _957 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _961 = _141 > 0.5;
    float _963 = _253 * _901;
    float _965 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _967 = _929 + _965;
    float _969 = 1.0 / _953;
    float _971 = -(*spvDescriptorSet0.vp_c9)._m0[128].w;
    float _973 = _971 + (*spvDescriptorSet0.vp_c9)._m0[129].w;
    int _975 = as_type<int>(_931) & 1;
    bool _977 = _975 != 0;
    int _979 = as_type<int>(_931) & 2;
    bool _981 = _979 != 0;
    float _983 = 1.0 / _959;
    float _985 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _987 = (*spvDescriptorSet0.vp_c9)._m0[128].w + _985;
    float _989 = _937 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _991 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _993 = _991 != 0;
    int _995 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _997 = _995 != 0;
    bool _999 = _949 > 0.5;
    float _1001 = 1.0 / _987;
    float _1003 = fma(_935, (*spvDescriptorSet0.vp_c10)._m0[5].x, _989);
    float _1005 = _967 * _969;
    float _1007 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _1009 = _929 + _1007;
    float _1011 = -(*spvDescriptorSet0.vp_c9)._m0[128].w;
    float _1013 = _929 + _1011;
    float _1015 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1017 = _929 + _1015;
    float _1019 = 1.0 / _973;
    float _1021 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1023 = _929 + _1021;
    float _1025 = _1017 * _955;
    float _1027 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1029 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1027;
    float _1031 = _1023 * _983;
    float _1033 = 1.0 / _947;
    float _1035 = _1009 * _1001;
    float _1037 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1039 = _1037 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1041 = fma(_1039, _1031, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    bool _1043 = !_981;
    float _1045 = _1043 ? (-0.5) : 0.5;
    float _1047 = _1013 * _1019;
    float _1049 = _937 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1051 = _937 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1053 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1055 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1053;
    float _1057 = fma(_935, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1049);
    float _1059 = fma(_935, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1051);
    float _1061 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _1063 = _929 + _1061;
    float _1065 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1067 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1065;
    float _1069 = fma(_939, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1057);
    float _1071 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1073 = _1071 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1075 = _1063 * _1033;
    float _1077 = fma(_939, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1003);
    float _1079 = fma(_939, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1059);
    float _1081 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1083 = _1081 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1085 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1087 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _1085;
    float _1089 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1091 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _1089;
    float _1093 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1095 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _1093;
    float _1097 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _1099 = _1097 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1101 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _1103 = _1101 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1105 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _1107 = _1105 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1109 = fma(_1087, _1025, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _1111 = fma(_1091, _1025, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _1113 = fma(_1095, _1025, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _1115 = fma(_1067, _1005, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1117 = fma(_1029, _1005, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1119 = fma(_1055, _1005, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1121 = -(*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1123 = (*spvDescriptorSet0.vp_c9)._m0[128].x + _1121;
    float _1125 = -(*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1127 = (*spvDescriptorSet0.vp_c9)._m0[128].y + _1125;
    bool _1129 = !_977;
    float _1131 = _1129 ? (-0.5) : 0.5;
    float _1133 = -(*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1135 = (*spvDescriptorSet0.vp_c9)._m0[128].z + _1133;
    float _1137 = fma(_1073, _1031, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1139 = fma(_1083, _1031, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1141 = fma(_1099, _1075, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    float _1143 = fma(_1103, _1075, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    float _1145 = fma(_1107, _1075, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    float _1147 = _963 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1149 = fma(_1123, _1035, (*spvDescriptorSet0.vp_c9)._m0[127].x);
    float _1151 = fma(_1127, _1035, (*spvDescriptorSet0.vp_c9)._m0[127].y);
    bool _1153 = _929 >= (*spvDescriptorSet0.vp_c9)._m0[129].w;
    bool _1155 = isnan(_929);
    bool _1157 = _1153 || _1155;
    bool _1159 = isnan((*spvDescriptorSet0.vp_c9)._m0[129].w);
    bool _1161 = _1157 || _1159;
    float _1163 = float(_1161);
    float _1165 = fma(_1135, _1035, (*spvDescriptorSet0.vp_c9)._m0[127].z);
    float _1167 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1131);
    float _1169 = _933 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1171 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1045);
    bool _1173 = _929 >= (*spvDescriptorSet0.vp_c9)._m0[128].w;
    bool _1175 = isnan(_929);
    bool _1177 = _1173 || _1175;
    bool _1179 = isnan((*spvDescriptorSet0.vp_c9)._m0[128].w);
    bool _1181 = _1177 || _1179;
    float _1183 = float(_1181);
    float _1185 = _1147 * _1167;
    float _1187 = -_1163;
    float _1189 = _1187 + 1.0;
    float _1191 = _1169 * _1171;
    bool _1193 = _929 >= (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _1195 = isnan(_929);
    bool _1197 = _1193 || _1195;
    bool _1199 = isnan((*spvDescriptorSet0.vp_c9)._m0[127].w);
    bool _1201 = _1197 || _1199;
    float _1203 = float(_1201);
    float _1205 = _1069 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1207 = _1183 * _1189;
    float _1209 = _1191 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1211 = _1191 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1213 = -_1183;
    float _1215 = _1213 + 1.0;
    bool _1217 = _929 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _1219 = isnan(_929);
    bool _1221 = _1217 || _1219;
    bool _1223 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _1225 = _1221 || _1223;
    float _1227 = float(_1225);
    float _1229 = -_1203;
    float _1231 = _1229 + 1.0;
    float _1233 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1235 = fma(_1185, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1209);
    float _1237 = fma(_1185, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1211);
    float _1239 = _1203 * _1215;
    bool _1241 = _929 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1243 = isnan(_929);
    bool _1245 = _1241 || _1243;
    bool _1247 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1249 = _1245 || _1247;
    float _1251 = float(_1249);
    float _1253 = _1227 * _1231;
    float _1255 = -_1227;
    float _1257 = _1255 + 1.0;
    float _1259 = fma(_1233, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1235);
    float _1261 = fma(_1233, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1237);
    float _1263 = _1079 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1265 = _1251 * _1257;
    float _1267 = _1259 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1269 = _1261 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1271 = -_1251;
    float _1273 = _1271 + 1.0;
    float _1275 = -(*spvDescriptorSet0.vp_c9)._m0[128].x;
    float _1277 = _1275 + (*spvDescriptorSet0.vp_c9)._m0[129].x;
    float _1279 = _1205 + _1267;
    float _1281 = _1263 + _1269;
    float _1283 = -(*spvDescriptorSet0.vp_c9)._m0[128].y;
    float _1285 = _1283 + (*spvDescriptorSet0.vp_c9)._m0[129].y;
    float _1287 = -(*spvDescriptorSet0.vp_c9)._m0[128].z;
    float _1289 = _1287 + (*spvDescriptorSet0.vp_c9)._m0[129].z;
    float _1291 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1293 = _1279 + _1291;
    float _1295 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1297 = _1281 + _1295;
    float _1299 = fma(_1277, _1047, (*spvDescriptorSet0.vp_c9)._m0[128].x);
    bool _1301 = _929 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1303 = isnan(_929);
    bool _1305 = _1301 || _1303;
    bool _1307 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1309 = _1305 || _1307;
    float _1311 = float(_1309);
    float _1313 = _1293 * _1293;
    float _1315 = _1297 * _1297;
    float _1317 = fma(_1285, _1047, (*spvDescriptorSet0.vp_c9)._m0[128].y);
    bool _1319 = _929 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1321 = isnan(_929);
    bool _1323 = _1319 || _1321;
    bool _1325 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1327 = _1323 || _1325;
    float _1329 = float(_1327);
    float _1331 = _1311 * _1273;
    float _1333 = _1313 + _1315;
    float _1335 = -_1311;
    float _1337 = _1335 + 1.0;
    float _1339 = _1191 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1341 = _1077 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1343 = sqrt(_1333);
    float _1345 = _1329 * _1337;
    float _1347 = -_1329;
    float _1349 = _1347 + 1.0;
    float _1351 = fma(_1185, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1339);
    float _1353 = fma(_1289, _1047, (*spvDescriptorSet0.vp_c9)._m0[128].z);
    float _1355 = _1115 * _1345;
    float _1357 = _1117 * _1345;
    float _1359 = _1119 * _1345;
    float _1361 = fma(_1233, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1351);
    float _1363 = fma(_1349, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1355);
    float _1365 = fma(_1349, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1357);
    float _1367 = fma(_1349, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1359);
    float _1369 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1371 = fma(_1137, _1331, _1363);
    float _1373 = fma(_1139, _1331, _1365);
    float _1375 = _1361 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    bool _1377 = _1343 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1379 = fma(_1109, _1265, _1371);
    float _1381 = fma(_1041, _1331, _1367);
    float _1383 = fma(_1111, _1265, _1373);
    float _1385 = _1341 + _1375;
    float _1387 = fma(_1141, _1253, _1379);
    float _1389 = -_1131;
    int _1391 = _961 ? as_type<int>(_1389) : as_type<int>(_1131);
    float _1393 = fma(_1113, _1265, _1381);
    float _1395 = -_1045;
    int _1397 = _999 ? as_type<int>(_1395) : as_type<int>(_1045);
    float _1399 = fma(_1149, _1239, _1387);
    bool _1401 = !_993;
    float _1403 = _1401 ? _1131 : as_type<float>(_1391);
    float _1405 = fma(_1143, _1253, _1383);
    bool _1407 = !_997;
    float _1409 = _1407 ? _1045 : as_type<float>(_1397);
    float _1411 = fma(_1145, _1253, _1393);
    float _1413 = _1387;
    float _1415 = _1313;
    float _1417 = _1315;
    float _1419 = _1279;
    float _1421 = _1281;
    float _1423 = _1163;
    if (!_1377)
    {
        _1413 = _1385;
    }
    float _1425 = _1413;
    bool _1427 = !_1377;
    float _1429 = _1425;
    if (!_1427)
    {
        float _1431 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1433 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1435 = _1343 + _1433;
        float _1437 = _1385 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1439 = rsqrt(_1333);
        float _1441 = _1435 * _1431;
        float _1443 = _1441 * 0.15915493667125701904296875;
        float _1445 = _1443 * 6.283185482025146484375;
        float _1447 = sin(_1445);
        float _1449 = _1443 * 6.283185482025146484375;
        float _1451 = cos(_1449);
        float _1453 = fma(_1447, _1437, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1455 = _1439 * _1453;
        float _1457 = _1451 + (-1.0);
        float _1459 = fma(_1293, _1455, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1461 = fma(_1297, _1455, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1463 = _1457 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1465 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1467 = _1459 + _1465;
        float _1469 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1471 = _1461 + _1469;
        float _1473 = fma(_1385, _1451, _1463);
        float _1475 = _1467 * _1467;
        float _1477 = _1471 * _1471;
        _1429 = _1473;
        _1415 = _1475;
        _1417 = _1477;
        _1419 = _1459;
        _1421 = _1461;
    }
    float _1479 = _1429;
    float _1481 = _1415;
    float _1483 = _1417;
    float _1485 = _1419;
    float _1487 = _1421;
    float _1489 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1491 = _1479 + _1489;
    float _1493 = fma(_1151, _1239, _1405);
    float _1495 = fma(_1165, _1239, _1411);
    float _1497 = fma(_1299, _1207, _1399);
    float _1499 = fma(_1491, _1491, _1481);
    float _1501 = fma(_1317, _1207, _1493);
    float _1503 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1505 = fma(_1353, _1207, _1495);
    float _1507 = _1499 + _1483;
    float _1509 = _1403 + 0.5;
    float _1511 = -_1409;
    float _1513 = _1511 + 0.5;
    float _1515 = fma(_1163, (*spvDescriptorSet0.vp_c9)._m0[129].x, _1497);
    float _1517 = fma(_1163, (*spvDescriptorSet0.vp_c9)._m0[129].y, _1501);
    float _1519 = fma(_1163, (*spvDescriptorSet0.vp_c9)._m0[129].z, _1505);
    float _1521 = sqrt(_1507);
    float _1523 = _1509 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1525 = _1513 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1527 = _1515 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1529 = _1517 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1531 = _1519 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1533 = _1523 * _1369;
    float _1535 = _1527 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1537 = _1525 * _1503;
    float _1539 = _1529 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1541 = _1531 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_62.x = _1533;
    out.m_62.y = _1537;
    bool _1543 = _1521 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1545 = isnan(_1521);
    bool _1547 = _1543 || _1545;
    bool _1549 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1551 = _1547 || _1549;
    out.m_64.x = _1535;
    out.m_64.y = _1539;
    out.m_64.z = _1541;
    float _1553 = _1535;
    if (!_1551)
    {
        _1423 = 1.0;
    }
    float _1555 = _1423;
    bool _1557 = !_1551;
    float _1559 = _1555;
    if (!_1557)
    {
        bool _1561 = _1521 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1563 = isnan(_1521);
        bool _1565 = _1561 || _1563;
        bool _1567 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1569 = _1565 || _1567;
        if (!_1569)
        {
            float _1571 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1573 = _1521 + _1571;
            float _1575 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1577 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1575;
            float _1579 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1581 = _1579 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1583 = 1.0 / _1577;
            float _1585 = _1573 * _1583;
            float _1587 = fma(_1585, _1581, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1559 = _1587;
            _1589 = true;
        }
        else
        {
            bool _1591 = _1521 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1593 = isnan(_1521);
            bool _1595 = _1591 || _1593;
            bool _1597 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1599 = _1595 || _1597;
            if (!_1599)
            {
                float _1601 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1603 = _1521 + _1601;
                float _1605 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1607 = _1605 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1609 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1611 = _1609 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1613 = 1.0 / _1607;
                float _1615 = _1603 * _1613;
                float _1617 = fma(_1615, _1611, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1559 = _1617;
                _1589 = true;
            }
            else
            {
                _1559 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1589 = false;
    float _1619 = _1559;
    float _1621 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1623 = _1479 + _1621;
    float _1625 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1627 = _1485 + _1625;
    float _1629 = fma(_1623, _1619, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1631 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1633 = _1487 + _1631;
    float _1635 = fma(_1627, _1619, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1637 = _1341 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1639 = -_1341;
    float _1641 = _1639 + _1629;
    float _1643 = fma(_1633, _1619, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1645 = -_1205;
    float _1647 = _1645 + _1635;
    bool _1649 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1651 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1653 = _1649 || _1651;
    bool _1655 = isnan(0.5);
    bool _1657 = _1653 || _1655;
    float _1659 = _1641 * _1641;
    float _1661 = -_1263;
    float _1663 = _1661 + _1643;
    float _1665 = fma(_1647, _1647, _1659);
    float _1667 = fma(_1663, _1663, _1665);
    float _1669 = fma(_1205, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1637);
    float _1671 = _1341 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1673 = sqrt(_1667);
    float _1675 = fma(_1263, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1669);
    float _1677 = _1675 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1679 = fma(_1205, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1671);
    float _1681 = 1.0 / _1677;
    float _1683 = fma(_1263, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1679);
    float _1685 = _1683 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _1687 = _1673 > 0.0;
    float _1689 = _1685 + _1677;
    bool _1691 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1693 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1695 = _1691 || _1693;
    bool _1697 = isnan(0.5);
    bool _1699 = _1695 || _1697;
    float _1701 = _1689 * _1681;
    float _1703 = _1701 * 0.5;
    float _1705 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _1707 = _1677;
    float _1709 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    float _1711 = _1689;
    float _1713 = _1667;
    if (!_1687)
    {
        _1705 = _1635;
    }
    float _1715 = _1705;
    float _1717 = _1715;
    float _1719 = _1715;
    if (!_1687)
    {
        _1707 = _1629;
    }
    float _1721 = _1707;
    float _1723 = _1721;
    if (!_1687)
    {
        _1709 = _1643;
    }
    float _1725 = _1709;
    bool _1727 = !_1687;
    float _1729 = _1725;
    float _1731 = _1725;
    if (!_1727)
    {
        float _1733 = _247 * _247;
        float _1735 = fma(_197, _197, _1733);
        float _1737 = fma(_249, _249, _1735);
        float _1739 = rsqrt(_1667);
        float _1741 = sqrt(_1737);
        float _1743 = _1647 * _1739;
        float _1745 = _1641 * _1739;
        float _1747 = _1663 * _1739;
        bool _1749 = _1741 > 0.0;
        float _1751 = _1741;
        _1553 = _1737;
        _1711 = _1739;
        if (!_1749)
        {
            _1717 = _1635;
        }
        float _1753 = _1717;
        _1719 = _1753;
        if (!_1749)
        {
            _1751 = _1629;
        }
        float _1755 = _1751;
        _1723 = _1755;
        if (!_1749)
        {
            _1729 = _1643;
        }
        float _1757 = _1729;
        bool _1759 = !_1749;
        _1731 = _1757;
        if (!_1759)
        {
            float _1761 = rsqrt(_1737);
            float _1763 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1765 = _247 * _1761;
            float _1767 = _197 * _1761;
            float _1769 = _1745 * _1765;
            float _1771 = _249 * _1761;
            float _1773 = fma(_1743, _1767, _1769);
            float _1775 = _1763 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1777 = fma(_1747, _1771, _1773);
            float _1779 = _1777 * _1775;
            float _1781 = fma(_197, _1779, _1635);
            float _1783 = fma(_247, _1779, _1629);
            float _1785 = fma(_249, _1779, _1643);
            _1719 = _1781;
            _1723 = _1783;
            _1731 = _1785;
            _1553 = _1761;
            _1711 = _1779;
        }
    }
    float _1787 = _1719;
    float _1789 = _1723;
    float _1791 = _1731;
    float _1793 = _1553;
    float _1795 = _1711;
    float _1797 = _1795;
    float _1799 = _1793;
    if (_1657)
    {
        _1797 = 1.0;
    }
    float _1801 = _1797;
    float _1803 = _1801;
    if (_1699)
    {
        _257 = _1787;
    }
    float _1805 = _257;
    float _1807 = _1805;
    if (_1699)
    {
        _259 = _1789;
    }
    float _1809 = _259;
    float _1811 = _1809;
    if (_1699)
    {
        _261 = _1791;
    }
    float _1813 = _261;
    float _1815 = _1813;
    if (!_1699)
    {
        float _1817 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1819 = _1341 + _1817;
        float _1821 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1823 = _1205 + _1821;
        float _1825 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1827 = -_1263;
        float _1829 = _1827 + _1791;
        float _1831 = _1819 * _1819;
        float _1833 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1835 = _1263 + _1833;
        float _1837 = fma(_1823, _1823, _1831);
        float _1839 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1841 = fma(_1835, _1835, _1837);
        float _1843 = sqrt(_1841);
        float _1845 = _1825 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1847 = precise::min(_1843, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1849 = _1847 * _1839;
        float _1851 = -_1205;
        float _1853 = _1851 + _1787;
        float _1855 = _1845 * _1849;
        float _1857 = -_1341;
        float _1859 = _1857 + _1789;
        float _1861 = fma(_1853, _1855, _1205);
        float _1863 = fma(_1859, _1855, _1341);
        float _1865 = fma(_1829, _1855, _1263);
        _1811 = _1863;
        _1807 = _1861;
        _1815 = _1865;
        _1799 = _1855;
    }
    float _1867 = _1811;
    float _1869 = _1807;
    float _1871 = _1815;
    float _1873 = _1799;
    float _1875 = _1873;
    if (!_1657)
    {
        float _1877 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1879 = _1877 * 0.15915493667125701904296875;
        float _1881 = _1879 * 6.283185482025146484375;
        float _1883 = cos(_1881);
        float _1885 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1887 = _1885 * 0.15915493667125701904296875;
        float _1889 = _1879 * 6.283185482025146484375;
        float _1891 = sin(_1889);
        float _1893 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1895 = fma(_1703, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1893);
        float _1897 = 1.0 / _1883;
        float _1899 = _1887 * 6.283185482025146484375;
        float _1901 = cos(_1899);
        float _1903 = _1891 * _1897;
        float _1905 = 1.0 / _1895;
        float _1907 = _1901 * _1903;
        float _1909 = _1887 * 6.283185482025146484375;
        float _1911 = sin(_1909);
        float _1913 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1915 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1913;
        float _1917 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1919 = _1905 * _1917;
        float _1921 = 1.0 / _1907;
        float _1923 = 1.0 / _1915;
        float _1925 = _1911 * _1921;
        float _1927 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1929 = fma(_1925, _1919, _1927);
        float _1931 = _1929 * _1923;
        float _1933 = precise::clamp(_1931, 0.0, 1.0);
        _1803 = _1933;
    }
    float _1935 = _1803;
    float _1937 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1939 = _1867 + _1937;
    float _1941 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1943 = _1869 + _1941;
    float _1945 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1947 = _1871 + _1945;
    float _1949 = _1939 * _1939;
    float _1951 = fma(_1943, _1943, _1949);
    float _1953 = fma(_1947, _1947, _1951);
    float _1955 = rsqrt(_1953);
    float _1957 = _1955 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1959 = _1943 * _1957;
    float _1961 = _1947 * _1957;
    float _1963 = _1959 * _1959;
    float _1965 = _1961 * _1961;
    float _1967 = _1963 + _1965;
    float _1969 = sqrt(_1967);
    bool _1971 = _1969 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1973 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1975 = _1969 + _1973;
    float _1977 = _1947;
    float _1979 = _1949;
    float _1981 = _1975;
    float _1983 = _1939;
    float _1985 = _1959;
    if (_1971)
    {
        float _1987 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1977 = _1987;
    }
    float _1989 = _1977;
    if (_1971)
    {
        float _1991 = rsqrt(_1967);
        _1979 = _1991;
    }
    float _1993 = _1979;
    float _1995 = _1993;
    if (_1971)
    {
        float _1997 = _1975 * _1989;
        _1981 = _1997;
    }
    float _1999 = _1981;
    if (_1971)
    {
        float _2001 = _1999 * 0.15915493667125701904296875;
        _1875 = _2001;
    }
    float _2003 = _1875;
    float _2005 = _1955;
    if (_1971)
    {
        float _2007 = _2003 * 6.283185482025146484375;
        float _2009 = sin(_2007);
        _2005 = _2009;
    }
    float _2011 = _2005;
    float _2013 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2015 = precise::max(0.0, _2013);
    float _2017 = _1989;
    float _2019 = _2015;
    if (_1971)
    {
        float _2021 = _2003 * 6.283185482025146484375;
        float _2023 = cos(_2021);
        _2017 = _2023;
    }
    float _2025 = _2017;
    float _2027 = -_1957;
    float _2029 = -_2015;
    float _2031 = fma(_1939, _2027, _2029);
    float _2033 = _2031;
    if (_1971)
    {
        float _2035 = _2031 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1983 = _2035;
    }
    float _2037 = _1983;
    float _2039 = _1867 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2041 = _2011;
    float _2043 = _2037;
    if (_1971)
    {
        float _2045 = fma(_2011, _2037, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2041 = _2045;
    }
    float _2047 = _2041;
    if (!_1971)
    {
        _2043 = _1963;
    }
    float _2049 = _2043;
    float _2051 = _2049;
    if (_1971)
    {
        float _2053 = _2025 + (-1.0);
        _2019 = _2053;
    }
    float _2055 = _2019;
    float _2057 = _2055;
    if (_1971)
    {
        float _2059 = _1993 * _2047;
        _1713 = _2059;
    }
    float _2061 = _1713;
    if (!_1971)
    {
        _1995 = _1961;
    }
    float _2063 = _1995;
    float _2065 = sqrt(_1953);
    float _2067 = _2063;
    if (_1971)
    {
        float _2069 = _2055 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2057 = _2069;
    }
    float _2071 = _2057;
    float _2073 = _2071;
    if (_1971)
    {
        float _2075 = _1959 * _2061;
        _1985 = _2075;
    }
    float _2077 = _1985;
    if (_1971)
    {
        float _2079 = _1961 * _2061;
        _2067 = _2079;
    }
    float _2081 = _2067;
    if (_1971)
    {
        float _2083 = fma(_2031, _2025, _2071);
        _2033 = _2083;
    }
    float _2085 = _2033;
    if (_1971)
    {
        float _2087 = _2077 * _2077;
        _2051 = _2087;
    }
    float _2089 = _2051;
    if (!_1971)
    {
        _2073 = _1965;
    }
    float _2091 = _2073;
    float _2093 = _2091;
    if (_1971)
    {
        float _2095 = _2081 * _2081;
        _2093 = _2095;
    }
    float _2097 = _2093;
    float _2099 = fma(_2085, _2085, _2089);
    float _2101 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2103 = _2099 + _2097;
    float _2105 = _1867 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2107 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2109 = fma(_2065, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2107);
    float _2111 = precise::clamp(_2109, 0.0, 1.0);
    float _2113 = fma(_1869, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2105);
    float _2115 = rsqrt(_2103);
    float _2117 = _1867 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2119 = -_2111;
    float _2121 = _2119 + 1.0;
    float _2123 = fma(_1871, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2113);
    float _2125 = _1867 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2127 = fma(_1869, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2117);
    float _2129 = _2123 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2131 = fma(_1869, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2125);
    float _2133 = fma(_1871, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2127);
    float _2135 = abs(_2121);
    float _2137 = log2(_2135);
    float _2139 = fma(_1869, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2039);
    float _2141 = fma(_1871, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2131);
    float _2143 = _2133 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2145 = _2129 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2147 = fma(_1871, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2139);
    float _2149 = _2115 * _2077;
    float _2151 = _2141 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2153 = _2143 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2155 = _2115 * _2085;
    float _2157 = _2149 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2159 = _2115 * _2081;
    float _2161 = fma(_2151, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2153);
    float _2163 = -_2145;
    float _2165 = fma(_2163, _2101, 1.0);
    float _2167 = -_2157;
    float _2169 = fma(_2155, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2167);
    float _2171 = _2147 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2173 = fma(_2129, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2161);
    float _2175 = _2137 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2177 = -_2159;
    float _2179 = fma(_2177, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2169);
    float _2181 = _2143 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2183 = fma(_2171, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2173);
    float _2185 = log2(_2165);
    float _2187 = fma(_2179, -0.5, 0.5);
    float _2189 = _2143 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2191 = fma(_2151, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2181);
    float _2193 = fma(_2179, 0.5, 0.5);
    float _2195 = _2155 + 1.0;
    float _2197 = fma(_2151, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2189);
    float _2199 = fma(_2129, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2191);
    float _2201 = exp2(_2175);
    float _2203 = fma(_2193, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2205 = fma(_2129, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2197);
    float _2207 = fma(_2171, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2199);
    float _2209 = fma(_2193, _2203, -0.212114393711090087890625);
    float _2211 = fma(_2171, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2205);
    float _2213 = 1.0 / _2183;
    float _2215 = _2185 * 0.693147182464599609375;
    float _2217 = fma(_2193, _2209, 1.570728778839111328125);
    float _2219 = _2215 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2221 = sqrt(_2187);
    float _2223 = -_2155;
    float _2225 = fma(_2201, _2195, _2223);
    float _2227 = fma(_2225, 0.5, 0.5);
    float _2229 = _2207 * _2213;
    float _2231 = _2211 * _2213;
    float _2233 = fma(_2229, 0.5, 0.5);
    float _2235 = fma(_2231, -0.5, 0.5);
    float _2237 = _2221 * 0.636619746685028076171875;
    float3 _5891 = float3(_2233, _2235, _2219);
    float _2239 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5891, float3(0.0), isnan(_5891)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5891, float3(0.0), isnan(_5891)), level(0.0)).x;
    float3 _5902 = float3(_2233, _2235, _2219);
    float4 _2242 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5902, float3(0.0), isnan(_5902)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5902, float3(0.0), isnan(_5902)), level(0.0)).xyzw;
    float _2244 = _2242.x;
    float _2246 = _2242.y;
    float _2248 = _2242.z;
    float _2250 = _2242.w;
    float _2252 = -_2217;
    float _2254 = fma(_2237, _2252, 1.0);
    float2 _5924 = float2(_2254, _2227);
    float3 _2258 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5924, float2(0.0), isnan(_5924)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5924, float2(0.0), isnan(_5924)), level(0.0)).xyz;
    float _2260 = _2258.x;
    float _2262 = _2258.y;
    float _2264 = _2258.z;
    float _2266 = _2137 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2268 = _2143 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _2270 = _1935 > 0.0;
    bool _2272 = isnan(_1935);
    bool _2274 = _2270 || _2272;
    bool _2276 = isnan(0.0);
    bool _2278 = _2274 || _2276;
    float _2280 = fma(_2151, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2268);
    float _2282 = exp2(_2266);
    float _2284 = fma(_2129, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2280);
    float _2286 = fma(_2171, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2284);
    float _2288 = _1935 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2290 = _2286 + _2183;
    out.gl_Position.x = _2207;
    out.gl_Position.y = _2211;
    out.gl_Position.z = _2286;
    out.gl_Position.w = _2183;
    float _2292 = _2288 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2294 = _2290 * 0.5;
    float _2296 = -_2282;
    float _2298 = _2296 + 1.0;
    out.m_47.x = _2292;
    float _2300 = _2298 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_66.z = _2294;
    out.m_66.w = _2183;
    float _2302 = -_2300;
    float _2304 = _2302 + 1.0;
    float _2306 = _2300 * _2239;
    float _2308 = _2250 * _2306;
    float _2310 = _2264 * _2306;
    float _2312 = fma(_2260, _2308, _2244);
    float _2314 = fma(_2262, _2308, _2246);
    float _2316 = _2250 * _2304;
    float _2318 = fma(_2250, _2310, _2248);
    out.m_68.x = _2312;
    out.m_68.y = _2314;
    out.m_68.z = _2318;
    out.m_68.w = _2316;
    if (_2278)
    {
        return out;
    }
    out.m_47.x = 0.0;
    float _2320 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2320;
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
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1589 = false;
    bool _921 = false;
    bool _517 = false;
    bool _279 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _82 = in.m_44.w;
    float _84 = trunc(_82);
    int _87 = int(_84);
    bool _91 = _87 >= 1;
    float _93 = 0.0;
    if (!_91)
    {
        _93 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _95 = _93;
    float _97 = _95;
    if (!_91)
    {
        out.m_47.x = 0.0;
    }
    int _99 = 0;
    if (!_91)
    {
        float _101 = _95 * 5.0;
        _99 = as_type<int>(_101);
    }
    int _103 = _99;
    int _105 = _103;
    if (!_91)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2377 = as_type<float>(_103);
        out.gl_Position.z = _2377;
    }
    if (!_91)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _107 = in.m_49.w;
    bool _109 = _107 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _111 = isnan(_107);
    bool _113 = _109 || _111;
    bool _115 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _117 = _113 || _115;
    float _119 = -_107;
    float _121 = _119 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_117)
    {
        float _123 = float(_87);
        _97 = _123;
    }
    float _125 = _97;
    bool _127 = _121 >= _125;
    bool _129 = !_117;
    bool _131 = _127 || _129;
    float _133 = _125;
    if (_131)
    {
        _133 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _135 = _133;
    if (_131)
    {
        out.m_47.x = 0.0;
    }
    if (_131)
    {
        float _137 = _135 * 5.0;
        _105 = as_type<int>(_137);
    }
    int _139 = _105;
    if (_131)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2446 = as_type<float>(_139);
        out.gl_Position.z = _2446;
    }
    if (_131)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _141 = in.m_51.x;
    float _143 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _145 = _121 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _147 = in.m_53.x;
    float _149 = in.m_53.y;
    float _151 = in.m_53.z;
    float _153 = _145 * _143;
    float _155 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[20].x, _153);
    float _157 = floor(_155);
    int _159 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _161 = _159 != 0;
    float _163 = _155 * 6.283185482025146484375;
    float _165 = _149 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _167 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _169 = _167 != 0;
    int _171 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _173 = _171 != 0;
    float _175 = _163 * 0.15915493667125701904296875;
    float _177 = _149 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _179 = _149 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _181 = fma(_147, (*spvDescriptorSet0.vp_c10)._m0[5].x, _165);
    bool _183 = !_169;
    int _185 = _183 ? 0 : 1;
    float _187 = fma(_147, (*spvDescriptorSet0.vp_c10)._m0[4].x, _177);
    float _189 = _175 * 6.283185482025146484375;
    float _191 = cos(_189);
    float _193 = fma(_147, (*spvDescriptorSet0.vp_c10)._m0[6].x, _179);
    int _195 = abs(_185);
    float _197 = fma(_151, (*spvDescriptorSet0.vp_c10)._m0[4].z, _187);
    bool _199 = !_161;
    int _201 = _199 ? 0 : 1;
    float _203 = -_157;
    float _205 = _155 + _203;
    bool _207 = !_173;
    int _209 = _207 ? 0 : 1;
    float _211 = -_205;
    float _213 = fma(_211, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _215 = abs(_201);
    float _217 = float(_195);
    bool _219 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _221 = abs(_209);
    float _223 = fma(_191, 0.5, 0.5);
    float _225 = abs(_213);
    float _227 = _217 * _225;
    bool _229 = _205 < 0.5;
    float _231 = float(_229);
    float _233 = -_223;
    float _235 = fma(_233, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _237 = float(_215);
    float _239 = -_231;
    float _241 = fma(_239, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _243 = float(_221);
    float _245 = fma(_237, _235, _227);
    float _247 = fma(_151, (*spvDescriptorSet0.vp_c10)._m0[5].z, _181);
    float _249 = fma(_151, (*spvDescriptorSet0.vp_c10)._m0[6].z, _193);
    float _251 = abs(_241);
    float _253 = fma(_243, _251, _245);
    bool _255 = !_219;
    float _257 = _197;
    float _259 = _249;
    float _261 = _247;
    float _277;
    if (!_255)
    {
        float _263 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _265 = _141 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _267 = fma(_265, (*spvDescriptorSet0.vp_c9)._m0[12].x, _121);
        float _269 = _267 * _263;
        float _271 = floor(_269);
        float _273 = -_271;
        float _275 = _269 + _273;
        _277 = _275;
        _279 = true;
    }
    else
    {
        float _281 = float(_87);
        float _283 = 1.0 / _281;
        float _285 = _121 * _283;
        _277 = _285;
    }
    _279 = false;
    float _287 = _277;
    float _289 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _291 = _287 + _289;
    float _293 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _295 = _287 + _293;
    float _297 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _299 = _287 + _297;
    float _301 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _303 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _301;
    float _305 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _307 = _305 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _309 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _311 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _309;
    float _313 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _315 = _313 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _317 = 1.0 / _303;
    bool _319 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _321 = 1.0 / _311;
    float _323 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _325 = _287 + _323;
    float _327 = 1.0 / _307;
    float _329 = _299 * _317;
    float _331 = 1.0 / _315;
    float _333 = _291 * _321;
    bool _335 = _287 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _337 = isnan(_287);
    bool _339 = _335 || _337;
    bool _341 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _343 = _339 || _341;
    float _345 = float(_343);
    float _347 = -_345;
    float _349 = _347 + 1.0;
    float _351 = _295 * _327;
    bool _353 = _287 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _355 = isnan(_287);
    bool _357 = _353 || _355;
    bool _359 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _361 = _357 || _359;
    float _363 = float(_361);
    bool _365 = _287 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _367 = isnan(_287);
    bool _369 = _365 || _367;
    bool _371 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _373 = _369 || _371;
    float _375 = float(_373);
    float _377 = -_363;
    float _379 = _377 + 1.0;
    float _381 = _363 * _349;
    float _383 = _325 * _331;
    float _385 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _387 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _385;
    bool _389 = _287 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _391 = isnan(_287);
    bool _393 = _389 || _391;
    bool _395 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _397 = _393 || _395;
    float _399 = float(_397);
    float _401 = _375 * _379;
    float _403 = -_375;
    float _405 = _403 + 1.0;
    float _407 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _409 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _407;
    float _411 = fma(_387, _329, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _413 = _287 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _415 = isnan(_287);
    bool _417 = _413 || _415;
    bool _419 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _421 = _417 || _419;
    float _423 = float(_421);
    float _425 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _427 = _425 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _429 = fma(_409, _329, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _431 = _399 * _405;
    float _433 = -_399;
    float _435 = _433 + 1.0;
    float _437 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _439 = _437 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _441 = -_423;
    float _443 = _441 + 1.0;
    float _445 = fma(_427, _351, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _447 = _423 * _435;
    float _449 = fma(_439, _351, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _451 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _453 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _451;
    float _455 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _457 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _455;
    float _459 = _411 * _447;
    float _461 = _429 * _447;
    float _463 = fma(_453, _333, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _465 = fma(_457, _333, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _467 = fma(_443, (*spvDescriptorSet0.vp_c9)._m0[143].x, _459);
    float _469 = fma(_443, (*spvDescriptorSet0.vp_c9)._m0[143].y, _461);
    float _471 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _473 = _471 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _475 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _477 = _475 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _479 = fma(_445, _431, _467);
    float _481 = fma(_449, _431, _469);
    float _483 = fma(_473, _383, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _485 = fma(_477, _383, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _487 = fma(_463, _401, _479);
    float _489 = fma(_465, _401, _481);
    float _491 = fma(_483, _381, _487);
    float _493 = fma(_485, _381, _489);
    float _495 = fma(_345, (*spvDescriptorSet0.vp_c9)._m0[147].x, _491);
    float _497 = fma(_345, (*spvDescriptorSet0.vp_c9)._m0[147].y, _493);
    bool _499 = !_319;
    float _515;
    if (!_499)
    {
        float _501 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _503 = _141 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _505 = fma(_503, (*spvDescriptorSet0.vp_c9)._m0[11].x, _121);
        float _507 = _505 * _501;
        float _509 = floor(_507);
        float _511 = -_509;
        float _513 = _507 + _511;
        _515 = _513;
        _517 = true;
    }
    else
    {
        float _519 = float(_87);
        float _521 = 1.0 / _519;
        float _523 = _121 * _521;
        _515 = _523;
    }
    _517 = false;
    float _525 = _515;
    float _527 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _529 = _525 + _527;
    float _531 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _533 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _531;
    float _535 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _537 = _535 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _539 = -(*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _541 = (*spvDescriptorSet0.vp_c9)._m0[112].w + _539;
    float _543 = -(*spvDescriptorSet0.vp_c9)._m0[112].w;
    float _545 = _543 + (*spvDescriptorSet0.vp_c9)._m0[113].w;
    float _547 = 1.0 / _533;
    float _549 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _551 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _549;
    float _553 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _555 = _553 + (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _557 = _525 >= (*spvDescriptorSet0.vp_c9)._m0[112].w;
    bool _559 = isnan(_525);
    bool _561 = _557 || _559;
    bool _563 = isnan((*spvDescriptorSet0.vp_c9)._m0[112].w);
    bool _565 = _561 || _563;
    float _567 = float(_565);
    float _569 = 1.0 / _541;
    float _571 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _573 = _525 + _571;
    bool _575 = _525 >= (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _577 = isnan(_525);
    bool _579 = _575 || _577;
    bool _581 = isnan((*spvDescriptorSet0.vp_c9)._m0[111].w);
    bool _583 = _579 || _581;
    float _585 = float(_583);
    bool _587 = _525 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _589 = isnan(_525);
    bool _591 = _587 || _589;
    bool _593 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _595 = _591 || _593;
    float _597 = float(_595);
    float _599 = -_585;
    float _601 = _599 + 1.0;
    float _603 = 1.0 / _537;
    float _605 = _573 * _547;
    float _607 = -(*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _609 = _525 + _607;
    float _611 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _613 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _611;
    bool _615 = _525 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _617 = isnan(_525);
    bool _619 = _615 || _617;
    bool _621 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _623 = _619 || _621;
    float _625 = float(_623);
    float _627 = fma(_613, _605, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _629 = 1.0 / _555;
    float _631 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _633 = _525 + _631;
    float _635 = _609 * _569;
    bool _637 = _525 >= (*spvDescriptorSet0.vp_c9)._m0[113].w;
    bool _639 = isnan(_525);
    bool _641 = _637 || _639;
    bool _643 = isnan((*spvDescriptorSet0.vp_c9)._m0[113].w);
    bool _645 = _641 || _643;
    float _647 = float(_645);
    float _649 = -_567;
    float _651 = _649 + 1.0;
    float _653 = 1.0 / _545;
    float _655 = _633 * _603;
    float _657 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _659 = _525 + _657;
    float _661 = -_647;
    float _663 = _661 + 1.0;
    bool _665 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _667 = _567 * _663;
    float _669 = 1.0 / _551;
    float _671 = _659 * _629;
    float _673 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _675 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _673;
    float _677 = fma(_675, _605, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _679 = _585 * _651;
    float _681 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _683 = _681 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _685 = -(*spvDescriptorSet0.vp_c9)._m0[112].w;
    float _687 = _525 + _685;
    float _689 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _691 = _689 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _693 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _695 = _693 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _697 = fma(_683, _655, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _699 = _687 * _653;
    float _701 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _703 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _701;
    float _705 = -_597;
    float _707 = _705 + 1.0;
    float _709 = _529 * _669;
    float _711 = fma(_691, _655, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _713 = fma(_703, _605, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _715 = _597 * _601;
    bool _717 = _525 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _719 = isnan(_525);
    bool _721 = _717 || _719;
    bool _723 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _725 = _721 || _723;
    float _727 = float(_725);
    float _729 = fma(_695, _655, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    bool _731 = _525 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _733 = isnan(_525);
    bool _735 = _731 || _733;
    bool _737 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _739 = _735 || _737;
    float _741 = float(_739);
    float _743 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _745 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _743;
    float _747 = -_727;
    float _749 = _747 + 1.0;
    float _751 = _741 * _707;
    float _753 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _755 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _753;
    float _757 = _625 * _749;
    float _759 = -_741;
    float _761 = _759 + 1.0;
    float _763 = fma(_755, _709, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _765 = _677 * _757;
    float _767 = _713 * _757;
    float _769 = _627 * _757;
    float _771 = -(*spvDescriptorSet0.vp_c9)._m0[110].x;
    float _773 = _771 + (*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _775 = _727 * _761;
    float _777 = -_625;
    float _779 = _777 + 1.0;
    float _781 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _783 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _781;
    float _785 = fma(_773, _671, (*spvDescriptorSet0.vp_c9)._m0[110].x);
    float _787 = -(*spvDescriptorSet0.vp_c9)._m0[110].y;
    float _789 = _787 + (*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _791 = fma(_779, (*spvDescriptorSet0.vp_c9)._m0[107].x, _765);
    float _793 = fma(_783, _709, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _795 = -(*spvDescriptorSet0.vp_c9)._m0[110].z;
    float _797 = _795 + (*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _799 = fma(_779, (*spvDescriptorSet0.vp_c9)._m0[107].y, _767);
    float _801 = fma(_779, (*spvDescriptorSet0.vp_c9)._m0[107].z, _769);
    float _803 = fma(_711, _775, _791);
    float _805 = fma(_789, _671, (*spvDescriptorSet0.vp_c9)._m0[110].y);
    float _807 = fma(_797, _671, (*spvDescriptorSet0.vp_c9)._m0[110].z);
    float _809 = fma(_745, _709, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _811 = fma(_697, _775, _799);
    float _813 = fma(_729, _775, _801);
    float _815 = fma(_793, _751, _803);
    float _817 = -(*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _819 = (*spvDescriptorSet0.vp_c9)._m0[112].x + _817;
    float _821 = -(*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _823 = (*spvDescriptorSet0.vp_c9)._m0[112].y + _821;
    float _825 = -(*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _827 = (*spvDescriptorSet0.vp_c9)._m0[112].z + _825;
    float _829 = fma(_763, _751, _811);
    float _831 = fma(_809, _751, _813);
    float _833 = fma(_819, _635, (*spvDescriptorSet0.vp_c9)._m0[111].x);
    float _835 = fma(_823, _635, (*spvDescriptorSet0.vp_c9)._m0[111].y);
    float _837 = -(*spvDescriptorSet0.vp_c9)._m0[112].x;
    float _839 = _837 + (*spvDescriptorSet0.vp_c9)._m0[113].x;
    float _841 = -(*spvDescriptorSet0.vp_c9)._m0[112].y;
    float _843 = _841 + (*spvDescriptorSet0.vp_c9)._m0[113].y;
    float _845 = fma(_827, _635, (*spvDescriptorSet0.vp_c9)._m0[111].z);
    float _847 = fma(_785, _715, _815);
    float _849 = fma(_805, _715, _829);
    float _851 = -(*spvDescriptorSet0.vp_c9)._m0[112].z;
    float _853 = _851 + (*spvDescriptorSet0.vp_c9)._m0[113].z;
    float _855 = fma(_807, _715, _831);
    float _857 = fma(_839, _699, (*spvDescriptorSet0.vp_c9)._m0[112].x);
    float _859 = fma(_843, _699, (*spvDescriptorSet0.vp_c9)._m0[112].y);
    float _861 = fma(_853, _699, (*spvDescriptorSet0.vp_c9)._m0[112].z);
    float _863 = fma(_833, _679, _847);
    float _865 = fma(_835, _679, _849);
    float _867 = fma(_845, _679, _855);
    float _869 = fma(_857, _667, _863);
    float _871 = fma(_859, _667, _865);
    float _873 = fma(_861, _667, _867);
    float _875 = fma(_647, (*spvDescriptorSet0.vp_c9)._m0[113].x, _869);
    float _877 = fma(_647, (*spvDescriptorSet0.vp_c9)._m0[113].y, _871);
    float _879 = fma(_647, (*spvDescriptorSet0.vp_c9)._m0[113].z, _873);
    float _881 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _883 = _875 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _885 = _877 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _887 = _879 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _889 = in.m_55.x;
    float _891 = in.m_55.y;
    float _893 = _883 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _895 = _885 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _897 = _887 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_57.x = _893;
    out.m_57.y = _895;
    out.m_57.z = _897;
    out.m_57.w = _881;
    float _899 = _497 * _891;
    float _901 = _495 * _889;
    bool _903 = !_665;
    float _919;
    if (!_903)
    {
        float _905 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _907 = _141 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _909 = fma(_907, (*spvDescriptorSet0.vp_c9)._m0[11].z, _121);
        float _911 = _909 * _905;
        float _913 = floor(_911);
        float _915 = -_913;
        float _917 = _911 + _915;
        _919 = _917;
        _921 = true;
    }
    else
    {
        float _923 = float(_87);
        float _925 = 1.0 / _923;
        float _927 = _121 * _925;
        _919 = _927;
    }
    _921 = false;
    float _929 = _919;
    float _931 = as_type<float>(int(gl_VertexIndex));
    float _933 = _253 * _899;
    float _935 = in.m_44.x;
    float _937 = in.m_44.y;
    float _939 = in.m_44.z;
    float _941 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _943 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _941;
    float _945 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _947 = _945 + (*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _949 = in.m_51.y;
    float _951 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _953 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _951;
    float _955 = 1.0 / _943;
    float _957 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _959 = _957 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _961 = _141 > 0.5;
    float _963 = _253 * _901;
    float _965 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _967 = _929 + _965;
    float _969 = 1.0 / _953;
    float _971 = -(*spvDescriptorSet0.vp_c9)._m0[128].w;
    float _973 = _971 + (*spvDescriptorSet0.vp_c9)._m0[129].w;
    int _975 = as_type<int>(_931) & 1;
    bool _977 = _975 != 0;
    int _979 = as_type<int>(_931) & 2;
    bool _981 = _979 != 0;
    float _983 = 1.0 / _959;
    float _985 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _987 = (*spvDescriptorSet0.vp_c9)._m0[128].w + _985;
    float _989 = _937 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _991 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _993 = _991 != 0;
    int _995 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _997 = _995 != 0;
    bool _999 = _949 > 0.5;
    float _1001 = 1.0 / _987;
    float _1003 = fma(_935, (*spvDescriptorSet0.vp_c10)._m0[5].x, _989);
    float _1005 = _967 * _969;
    float _1007 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _1009 = _929 + _1007;
    float _1011 = -(*spvDescriptorSet0.vp_c9)._m0[128].w;
    float _1013 = _929 + _1011;
    float _1015 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1017 = _929 + _1015;
    float _1019 = 1.0 / _973;
    float _1021 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1023 = _929 + _1021;
    float _1025 = _1017 * _955;
    float _1027 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1029 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1027;
    float _1031 = _1023 * _983;
    float _1033 = 1.0 / _947;
    float _1035 = _1009 * _1001;
    float _1037 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1039 = _1037 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1041 = fma(_1039, _1031, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    bool _1043 = !_981;
    float _1045 = _1043 ? (-0.5) : 0.5;
    float _1047 = _1013 * _1019;
    float _1049 = _937 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1051 = _937 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1053 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1055 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1053;
    float _1057 = fma(_935, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1049);
    float _1059 = fma(_935, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1051);
    float _1061 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _1063 = _929 + _1061;
    float _1065 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1067 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1065;
    float _1069 = fma(_939, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1057);
    float _1071 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1073 = _1071 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1075 = _1063 * _1033;
    float _1077 = fma(_939, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1003);
    float _1079 = fma(_939, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1059);
    float _1081 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1083 = _1081 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1085 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1087 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _1085;
    float _1089 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1091 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _1089;
    float _1093 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1095 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _1093;
    float _1097 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _1099 = _1097 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1101 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _1103 = _1101 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1105 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _1107 = _1105 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1109 = fma(_1087, _1025, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _1111 = fma(_1091, _1025, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _1113 = fma(_1095, _1025, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _1115 = fma(_1067, _1005, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1117 = fma(_1029, _1005, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1119 = fma(_1055, _1005, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1121 = -(*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1123 = (*spvDescriptorSet0.vp_c9)._m0[128].x + _1121;
    float _1125 = -(*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1127 = (*spvDescriptorSet0.vp_c9)._m0[128].y + _1125;
    bool _1129 = !_977;
    float _1131 = _1129 ? (-0.5) : 0.5;
    float _1133 = -(*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1135 = (*spvDescriptorSet0.vp_c9)._m0[128].z + _1133;
    float _1137 = fma(_1073, _1031, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1139 = fma(_1083, _1031, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1141 = fma(_1099, _1075, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    float _1143 = fma(_1103, _1075, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    float _1145 = fma(_1107, _1075, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    float _1147 = _963 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1149 = fma(_1123, _1035, (*spvDescriptorSet0.vp_c9)._m0[127].x);
    float _1151 = fma(_1127, _1035, (*spvDescriptorSet0.vp_c9)._m0[127].y);
    bool _1153 = _929 >= (*spvDescriptorSet0.vp_c9)._m0[129].w;
    bool _1155 = isnan(_929);
    bool _1157 = _1153 || _1155;
    bool _1159 = isnan((*spvDescriptorSet0.vp_c9)._m0[129].w);
    bool _1161 = _1157 || _1159;
    float _1163 = float(_1161);
    float _1165 = fma(_1135, _1035, (*spvDescriptorSet0.vp_c9)._m0[127].z);
    float _1167 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1131);
    float _1169 = _933 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1171 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1045);
    bool _1173 = _929 >= (*spvDescriptorSet0.vp_c9)._m0[128].w;
    bool _1175 = isnan(_929);
    bool _1177 = _1173 || _1175;
    bool _1179 = isnan((*spvDescriptorSet0.vp_c9)._m0[128].w);
    bool _1181 = _1177 || _1179;
    float _1183 = float(_1181);
    float _1185 = _1147 * _1167;
    float _1187 = -_1163;
    float _1189 = _1187 + 1.0;
    float _1191 = _1169 * _1171;
    bool _1193 = _929 >= (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _1195 = isnan(_929);
    bool _1197 = _1193 || _1195;
    bool _1199 = isnan((*spvDescriptorSet0.vp_c9)._m0[127].w);
    bool _1201 = _1197 || _1199;
    float _1203 = float(_1201);
    float _1205 = _1069 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1207 = _1183 * _1189;
    float _1209 = _1191 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1211 = _1191 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1213 = -_1183;
    float _1215 = _1213 + 1.0;
    bool _1217 = _929 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _1219 = isnan(_929);
    bool _1221 = _1217 || _1219;
    bool _1223 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _1225 = _1221 || _1223;
    float _1227 = float(_1225);
    float _1229 = -_1203;
    float _1231 = _1229 + 1.0;
    float _1233 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1235 = fma(_1185, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1209);
    float _1237 = fma(_1185, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1211);
    float _1239 = _1203 * _1215;
    bool _1241 = _929 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1243 = isnan(_929);
    bool _1245 = _1241 || _1243;
    bool _1247 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1249 = _1245 || _1247;
    float _1251 = float(_1249);
    float _1253 = _1227 * _1231;
    float _1255 = -_1227;
    float _1257 = _1255 + 1.0;
    float _1259 = fma(_1233, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1235);
    float _1261 = fma(_1233, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1237);
    float _1263 = _1079 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1265 = _1251 * _1257;
    float _1267 = _1259 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1269 = _1261 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1271 = -_1251;
    float _1273 = _1271 + 1.0;
    float _1275 = -(*spvDescriptorSet0.vp_c9)._m0[128].x;
    float _1277 = _1275 + (*spvDescriptorSet0.vp_c9)._m0[129].x;
    float _1279 = _1205 + _1267;
    float _1281 = _1263 + _1269;
    float _1283 = -(*spvDescriptorSet0.vp_c9)._m0[128].y;
    float _1285 = _1283 + (*spvDescriptorSet0.vp_c9)._m0[129].y;
    float _1287 = -(*spvDescriptorSet0.vp_c9)._m0[128].z;
    float _1289 = _1287 + (*spvDescriptorSet0.vp_c9)._m0[129].z;
    float _1291 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1293 = _1279 + _1291;
    float _1295 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1297 = _1281 + _1295;
    float _1299 = fma(_1277, _1047, (*spvDescriptorSet0.vp_c9)._m0[128].x);
    bool _1301 = _929 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1303 = isnan(_929);
    bool _1305 = _1301 || _1303;
    bool _1307 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1309 = _1305 || _1307;
    float _1311 = float(_1309);
    float _1313 = _1293 * _1293;
    float _1315 = _1297 * _1297;
    float _1317 = fma(_1285, _1047, (*spvDescriptorSet0.vp_c9)._m0[128].y);
    bool _1319 = _929 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1321 = isnan(_929);
    bool _1323 = _1319 || _1321;
    bool _1325 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1327 = _1323 || _1325;
    float _1329 = float(_1327);
    float _1331 = _1311 * _1273;
    float _1333 = _1313 + _1315;
    float _1335 = -_1311;
    float _1337 = _1335 + 1.0;
    float _1339 = _1191 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1341 = _1077 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1343 = sqrt(_1333);
    float _1345 = _1329 * _1337;
    float _1347 = -_1329;
    float _1349 = _1347 + 1.0;
    float _1351 = fma(_1185, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1339);
    float _1353 = fma(_1289, _1047, (*spvDescriptorSet0.vp_c9)._m0[128].z);
    float _1355 = _1115 * _1345;
    float _1357 = _1117 * _1345;
    float _1359 = _1119 * _1345;
    float _1361 = fma(_1233, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1351);
    float _1363 = fma(_1349, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1355);
    float _1365 = fma(_1349, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1357);
    float _1367 = fma(_1349, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1359);
    float _1369 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1371 = fma(_1137, _1331, _1363);
    float _1373 = fma(_1139, _1331, _1365);
    float _1375 = _1361 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    bool _1377 = _1343 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1379 = fma(_1109, _1265, _1371);
    float _1381 = fma(_1041, _1331, _1367);
    float _1383 = fma(_1111, _1265, _1373);
    float _1385 = _1341 + _1375;
    float _1387 = fma(_1141, _1253, _1379);
    float _1389 = -_1131;
    int _1391 = _961 ? as_type<int>(_1389) : as_type<int>(_1131);
    float _1393 = fma(_1113, _1265, _1381);
    float _1395 = -_1045;
    int _1397 = _999 ? as_type<int>(_1395) : as_type<int>(_1045);
    float _1399 = fma(_1149, _1239, _1387);
    bool _1401 = !_993;
    float _1403 = _1401 ? _1131 : as_type<float>(_1391);
    float _1405 = fma(_1143, _1253, _1383);
    bool _1407 = !_997;
    float _1409 = _1407 ? _1045 : as_type<float>(_1397);
    float _1411 = fma(_1145, _1253, _1393);
    float _1413 = _1387;
    float _1415 = _1313;
    float _1417 = _1315;
    float _1419 = _1279;
    float _1421 = _1281;
    float _1423 = _1163;
    if (!_1377)
    {
        _1413 = _1385;
    }
    float _1425 = _1413;
    bool _1427 = !_1377;
    float _1429 = _1425;
    if (!_1427)
    {
        float _1431 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1433 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1435 = _1343 + _1433;
        float _1437 = _1385 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1439 = rsqrt(_1333);
        float _1441 = _1435 * _1431;
        float _1443 = _1441 * 0.15915493667125701904296875;
        float _1445 = _1443 * 6.283185482025146484375;
        float _1447 = sin(_1445);
        float _1449 = _1443 * 6.283185482025146484375;
        float _1451 = cos(_1449);
        float _1453 = fma(_1447, _1437, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1455 = _1439 * _1453;
        float _1457 = _1451 + (-1.0);
        float _1459 = fma(_1293, _1455, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1461 = fma(_1297, _1455, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1463 = _1457 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1465 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1467 = _1459 + _1465;
        float _1469 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1471 = _1461 + _1469;
        float _1473 = fma(_1385, _1451, _1463);
        float _1475 = _1467 * _1467;
        float _1477 = _1471 * _1471;
        _1429 = _1473;
        _1415 = _1475;
        _1417 = _1477;
        _1419 = _1459;
        _1421 = _1461;
    }
    float _1479 = _1429;
    float _1481 = _1415;
    float _1483 = _1417;
    float _1485 = _1419;
    float _1487 = _1421;
    float _1489 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1491 = _1479 + _1489;
    float _1493 = fma(_1151, _1239, _1405);
    float _1495 = fma(_1165, _1239, _1411);
    float _1497 = fma(_1299, _1207, _1399);
    float _1499 = fma(_1491, _1491, _1481);
    float _1501 = fma(_1317, _1207, _1493);
    float _1503 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1505 = fma(_1353, _1207, _1495);
    float _1507 = _1499 + _1483;
    float _1509 = _1403 + 0.5;
    float _1511 = -_1409;
    float _1513 = _1511 + 0.5;
    float _1515 = fma(_1163, (*spvDescriptorSet0.vp_c9)._m0[129].x, _1497);
    float _1517 = fma(_1163, (*spvDescriptorSet0.vp_c9)._m0[129].y, _1501);
    float _1519 = fma(_1163, (*spvDescriptorSet0.vp_c9)._m0[129].z, _1505);
    float _1521 = sqrt(_1507);
    float _1523 = _1509 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1525 = _1513 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1527 = _1515 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1529 = _1517 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1531 = _1519 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1533 = _1523 * _1369;
    float _1535 = _1527 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1537 = _1525 * _1503;
    float _1539 = _1529 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1541 = _1531 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_62.x = _1533;
    out.m_62.y = _1537;
    bool _1543 = _1521 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1545 = isnan(_1521);
    bool _1547 = _1543 || _1545;
    bool _1549 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1551 = _1547 || _1549;
    out.m_64.x = _1535;
    out.m_64.y = _1539;
    out.m_64.z = _1541;
    float _1553 = _1535;
    if (!_1551)
    {
        _1423 = 1.0;
    }
    float _1555 = _1423;
    bool _1557 = !_1551;
    float _1559 = _1555;
    if (!_1557)
    {
        bool _1561 = _1521 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1563 = isnan(_1521);
        bool _1565 = _1561 || _1563;
        bool _1567 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1569 = _1565 || _1567;
        if (!_1569)
        {
            float _1571 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1573 = _1521 + _1571;
            float _1575 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1577 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1575;
            float _1579 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1581 = _1579 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1583 = 1.0 / _1577;
            float _1585 = _1573 * _1583;
            float _1587 = fma(_1585, _1581, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1559 = _1587;
            _1589 = true;
        }
        else
        {
            bool _1591 = _1521 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1593 = isnan(_1521);
            bool _1595 = _1591 || _1593;
            bool _1597 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1599 = _1595 || _1597;
            if (!_1599)
            {
                float _1601 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1603 = _1521 + _1601;
                float _1605 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1607 = _1605 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1609 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1611 = _1609 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1613 = 1.0 / _1607;
                float _1615 = _1603 * _1613;
                float _1617 = fma(_1615, _1611, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1559 = _1617;
                _1589 = true;
            }
            else
            {
                _1559 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1589 = false;
    float _1619 = _1559;
    float _1621 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1623 = _1479 + _1621;
    float _1625 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1627 = _1485 + _1625;
    float _1629 = fma(_1623, _1619, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1631 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1633 = _1487 + _1631;
    float _1635 = fma(_1627, _1619, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1637 = _1341 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1639 = -_1341;
    float _1641 = _1639 + _1629;
    float _1643 = fma(_1633, _1619, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1645 = -_1205;
    float _1647 = _1645 + _1635;
    bool _1649 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1651 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1653 = _1649 || _1651;
    bool _1655 = isnan(0.5);
    bool _1657 = _1653 || _1655;
    float _1659 = _1641 * _1641;
    float _1661 = -_1263;
    float _1663 = _1661 + _1643;
    float _1665 = fma(_1647, _1647, _1659);
    float _1667 = fma(_1663, _1663, _1665);
    float _1669 = fma(_1205, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1637);
    float _1671 = _1341 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1673 = sqrt(_1667);
    float _1675 = fma(_1263, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1669);
    float _1677 = _1675 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1679 = fma(_1205, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1671);
    float _1681 = 1.0 / _1677;
    float _1683 = fma(_1263, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1679);
    float _1685 = _1683 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _1687 = _1673 > 0.0;
    float _1689 = _1685 + _1677;
    bool _1691 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1693 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1695 = _1691 || _1693;
    bool _1697 = isnan(0.5);
    bool _1699 = _1695 || _1697;
    float _1701 = _1689 * _1681;
    float _1703 = _1701 * 0.5;
    float _1705 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _1707 = _1677;
    float _1709 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    float _1711 = _1689;
    float _1713 = _1667;
    if (!_1687)
    {
        _1705 = _1635;
    }
    float _1715 = _1705;
    float _1717 = _1715;
    float _1719 = _1715;
    if (!_1687)
    {
        _1707 = _1629;
    }
    float _1721 = _1707;
    float _1723 = _1721;
    if (!_1687)
    {
        _1709 = _1643;
    }
    float _1725 = _1709;
    bool _1727 = !_1687;
    float _1729 = _1725;
    float _1731 = _1725;
    if (!_1727)
    {
        float _1733 = _247 * _247;
        float _1735 = fma(_197, _197, _1733);
        float _1737 = fma(_249, _249, _1735);
        float _1739 = rsqrt(_1667);
        float _1741 = sqrt(_1737);
        float _1743 = _1647 * _1739;
        float _1745 = _1641 * _1739;
        float _1747 = _1663 * _1739;
        bool _1749 = _1741 > 0.0;
        float _1751 = _1741;
        _1553 = _1737;
        _1711 = _1739;
        if (!_1749)
        {
            _1717 = _1635;
        }
        float _1753 = _1717;
        _1719 = _1753;
        if (!_1749)
        {
            _1751 = _1629;
        }
        float _1755 = _1751;
        _1723 = _1755;
        if (!_1749)
        {
            _1729 = _1643;
        }
        float _1757 = _1729;
        bool _1759 = !_1749;
        _1731 = _1757;
        if (!_1759)
        {
            float _1761 = rsqrt(_1737);
            float _1763 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1765 = _247 * _1761;
            float _1767 = _197 * _1761;
            float _1769 = _1745 * _1765;
            float _1771 = _249 * _1761;
            float _1773 = fma(_1743, _1767, _1769);
            float _1775 = _1763 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1777 = fma(_1747, _1771, _1773);
            float _1779 = _1777 * _1775;
            float _1781 = fma(_197, _1779, _1635);
            float _1783 = fma(_247, _1779, _1629);
            float _1785 = fma(_249, _1779, _1643);
            _1719 = _1781;
            _1723 = _1783;
            _1731 = _1785;
            _1553 = _1761;
            _1711 = _1779;
        }
    }
    float _1787 = _1719;
    float _1789 = _1723;
    float _1791 = _1731;
    float _1793 = _1553;
    float _1795 = _1711;
    float _1797 = _1795;
    float _1799 = _1793;
    if (_1657)
    {
        _1797 = 1.0;
    }
    float _1801 = _1797;
    float _1803 = _1801;
    if (_1699)
    {
        _257 = _1787;
    }
    float _1805 = _257;
    float _1807 = _1805;
    if (_1699)
    {
        _259 = _1789;
    }
    float _1809 = _259;
    float _1811 = _1809;
    if (_1699)
    {
        _261 = _1791;
    }
    float _1813 = _261;
    float _1815 = _1813;
    if (!_1699)
    {
        float _1817 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1819 = _1341 + _1817;
        float _1821 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1823 = _1205 + _1821;
        float _1825 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1827 = -_1263;
        float _1829 = _1827 + _1791;
        float _1831 = _1819 * _1819;
        float _1833 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1835 = _1263 + _1833;
        float _1837 = fma(_1823, _1823, _1831);
        float _1839 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1841 = fma(_1835, _1835, _1837);
        float _1843 = sqrt(_1841);
        float _1845 = _1825 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1847 = precise::min(_1843, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1849 = _1847 * _1839;
        float _1851 = -_1205;
        float _1853 = _1851 + _1787;
        float _1855 = _1845 * _1849;
        float _1857 = -_1341;
        float _1859 = _1857 + _1789;
        float _1861 = fma(_1853, _1855, _1205);
        float _1863 = fma(_1859, _1855, _1341);
        float _1865 = fma(_1829, _1855, _1263);
        _1811 = _1863;
        _1807 = _1861;
        _1815 = _1865;
        _1799 = _1855;
    }
    float _1867 = _1811;
    float _1869 = _1807;
    float _1871 = _1815;
    float _1873 = _1799;
    float _1875 = _1873;
    if (!_1657)
    {
        float _1877 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1879 = _1877 * 0.15915493667125701904296875;
        float _1881 = _1879 * 6.283185482025146484375;
        float _1883 = cos(_1881);
        float _1885 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1887 = _1885 * 0.15915493667125701904296875;
        float _1889 = _1879 * 6.283185482025146484375;
        float _1891 = sin(_1889);
        float _1893 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1895 = fma(_1703, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1893);
        float _1897 = 1.0 / _1883;
        float _1899 = _1887 * 6.283185482025146484375;
        float _1901 = cos(_1899);
        float _1903 = _1891 * _1897;
        float _1905 = 1.0 / _1895;
        float _1907 = _1901 * _1903;
        float _1909 = _1887 * 6.283185482025146484375;
        float _1911 = sin(_1909);
        float _1913 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1915 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1913;
        float _1917 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1919 = _1905 * _1917;
        float _1921 = 1.0 / _1907;
        float _1923 = 1.0 / _1915;
        float _1925 = _1911 * _1921;
        float _1927 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1929 = fma(_1925, _1919, _1927);
        float _1931 = _1929 * _1923;
        float _1933 = precise::clamp(_1931, 0.0, 1.0);
        _1803 = _1933;
    }
    float _1935 = _1803;
    float _1937 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1939 = _1867 + _1937;
    float _1941 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1943 = _1869 + _1941;
    float _1945 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1947 = _1871 + _1945;
    float _1949 = _1939 * _1939;
    float _1951 = fma(_1943, _1943, _1949);
    float _1953 = fma(_1947, _1947, _1951);
    float _1955 = rsqrt(_1953);
    float _1957 = _1955 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1959 = _1943 * _1957;
    float _1961 = _1947 * _1957;
    float _1963 = _1959 * _1959;
    float _1965 = _1961 * _1961;
    float _1967 = _1963 + _1965;
    float _1969 = sqrt(_1967);
    bool _1971 = _1969 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1973 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1975 = _1969 + _1973;
    float _1977 = _1947;
    float _1979 = _1949;
    float _1981 = _1975;
    float _1983 = _1939;
    float _1985 = _1959;
    if (_1971)
    {
        float _1987 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1977 = _1987;
    }
    float _1989 = _1977;
    if (_1971)
    {
        float _1991 = rsqrt(_1967);
        _1979 = _1991;
    }
    float _1993 = _1979;
    float _1995 = _1993;
    if (_1971)
    {
        float _1997 = _1975 * _1989;
        _1981 = _1997;
    }
    float _1999 = _1981;
    if (_1971)
    {
        float _2001 = _1999 * 0.15915493667125701904296875;
        _1875 = _2001;
    }
    float _2003 = _1875;
    float _2005 = _1955;
    if (_1971)
    {
        float _2007 = _2003 * 6.283185482025146484375;
        float _2009 = sin(_2007);
        _2005 = _2009;
    }
    float _2011 = _2005;
    float _2013 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2015 = precise::max(0.0, _2013);
    float _2017 = _1989;
    float _2019 = _2015;
    if (_1971)
    {
        float _2021 = _2003 * 6.283185482025146484375;
        float _2023 = cos(_2021);
        _2017 = _2023;
    }
    float _2025 = _2017;
    float _2027 = -_1957;
    float _2029 = -_2015;
    float _2031 = fma(_1939, _2027, _2029);
    float _2033 = _2031;
    if (_1971)
    {
        float _2035 = _2031 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1983 = _2035;
    }
    float _2037 = _1983;
    float _2039 = _1867 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2041 = _2011;
    float _2043 = _2037;
    if (_1971)
    {
        float _2045 = fma(_2011, _2037, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2041 = _2045;
    }
    float _2047 = _2041;
    if (!_1971)
    {
        _2043 = _1963;
    }
    float _2049 = _2043;
    float _2051 = _2049;
    if (_1971)
    {
        float _2053 = _2025 + (-1.0);
        _2019 = _2053;
    }
    float _2055 = _2019;
    float _2057 = _2055;
    if (_1971)
    {
        float _2059 = _1993 * _2047;
        _1713 = _2059;
    }
    float _2061 = _1713;
    if (!_1971)
    {
        _1995 = _1961;
    }
    float _2063 = _1995;
    float _2065 = sqrt(_1953);
    float _2067 = _2063;
    if (_1971)
    {
        float _2069 = _2055 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2057 = _2069;
    }
    float _2071 = _2057;
    float _2073 = _2071;
    if (_1971)
    {
        float _2075 = _1959 * _2061;
        _1985 = _2075;
    }
    float _2077 = _1985;
    if (_1971)
    {
        float _2079 = _1961 * _2061;
        _2067 = _2079;
    }
    float _2081 = _2067;
    if (_1971)
    {
        float _2083 = fma(_2031, _2025, _2071);
        _2033 = _2083;
    }
    float _2085 = _2033;
    if (_1971)
    {
        float _2087 = _2077 * _2077;
        _2051 = _2087;
    }
    float _2089 = _2051;
    if (!_1971)
    {
        _2073 = _1965;
    }
    float _2091 = _2073;
    float _2093 = _2091;
    if (_1971)
    {
        float _2095 = _2081 * _2081;
        _2093 = _2095;
    }
    float _2097 = _2093;
    float _2099 = fma(_2085, _2085, _2089);
    float _2101 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2103 = _2099 + _2097;
    float _2105 = _1867 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2107 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2109 = fma(_2065, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2107);
    float _2111 = precise::clamp(_2109, 0.0, 1.0);
    float _2113 = fma(_1869, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2105);
    float _2115 = rsqrt(_2103);
    float _2117 = _1867 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2119 = -_2111;
    float _2121 = _2119 + 1.0;
    float _2123 = fma(_1871, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2113);
    float _2125 = _1867 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2127 = fma(_1869, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2117);
    float _2129 = _2123 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2131 = fma(_1869, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2125);
    float _2133 = fma(_1871, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2127);
    float _2135 = abs(_2121);
    float _2137 = log2(_2135);
    float _2139 = fma(_1869, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2039);
    float _2141 = fma(_1871, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2131);
    float _2143 = _2133 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2145 = _2129 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2147 = fma(_1871, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2139);
    float _2149 = _2115 * _2077;
    float _2151 = _2141 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2153 = _2143 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2155 = _2115 * _2085;
    float _2157 = _2149 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2159 = _2115 * _2081;
    float _2161 = fma(_2151, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2153);
    float _2163 = -_2145;
    float _2165 = fma(_2163, _2101, 1.0);
    float _2167 = -_2157;
    float _2169 = fma(_2155, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2167);
    float _2171 = _2147 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2173 = fma(_2129, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2161);
    float _2175 = _2137 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2177 = -_2159;
    float _2179 = fma(_2177, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2169);
    float _2181 = _2143 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2183 = fma(_2171, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2173);
    float _2185 = log2(_2165);
    float _2187 = fma(_2179, -0.5, 0.5);
    float _2189 = _2143 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2191 = fma(_2151, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2181);
    float _2193 = fma(_2179, 0.5, 0.5);
    float _2195 = _2155 + 1.0;
    float _2197 = fma(_2151, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2189);
    float _2199 = fma(_2129, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2191);
    float _2201 = exp2(_2175);
    float _2203 = fma(_2193, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2205 = fma(_2129, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2197);
    float _2207 = fma(_2171, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2199);
    float _2209 = fma(_2193, _2203, -0.212114393711090087890625);
    float _2211 = fma(_2171, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2205);
    float _2213 = 1.0 / _2183;
    float _2215 = _2185 * 0.693147182464599609375;
    float _2217 = fma(_2193, _2209, 1.570728778839111328125);
    float _2219 = _2215 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2221 = sqrt(_2187);
    float _2223 = -_2155;
    float _2225 = fma(_2201, _2195, _2223);
    float _2227 = fma(_2225, 0.5, 0.5);
    float _2229 = _2207 * _2213;
    float _2231 = _2211 * _2213;
    float _2233 = fma(_2229, 0.5, 0.5);
    float _2235 = fma(_2231, -0.5, 0.5);
    float _2237 = _2221 * 0.636619746685028076171875;
    float3 _5891 = float3(_2233, _2235, _2219);
    float _2239 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5891, float3(0.0), isnan(_5891)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5891, float3(0.0), isnan(_5891)), level(0.0)).x;
    float3 _5902 = float3(_2233, _2235, _2219);
    float4 _2242 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5902, float3(0.0), isnan(_5902)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5902, float3(0.0), isnan(_5902)), level(0.0)).xyzw;
    float _2244 = _2242.x;
    float _2246 = _2242.y;
    float _2248 = _2242.z;
    float _2250 = _2242.w;
    float _2252 = -_2217;
    float _2254 = fma(_2237, _2252, 1.0);
    float2 _5924 = float2(_2254, _2227);
    float3 _2258 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5924, float2(0.0), isnan(_5924)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5924, float2(0.0), isnan(_5924)), level(0.0)).xyz;
    float _2260 = _2258.x;
    float _2262 = _2258.y;
    float _2264 = _2258.z;
    float _2266 = _2137 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2268 = _2143 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _2270 = _1935 > 0.0;
    bool _2272 = isnan(_1935);
    bool _2274 = _2270 || _2272;
    bool _2276 = isnan(0.0);
    bool _2278 = _2274 || _2276;
    float _2280 = fma(_2151, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2268);
    float _2282 = exp2(_2266);
    float _2284 = fma(_2129, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2280);
    float _2286 = fma(_2171, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2284);
    float _2288 = _1935 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2290 = _2286 + _2183;
    out.gl_Position.x = _2207;
    out.gl_Position.y = _2211;
    out.gl_Position.z = _2286;
    out.gl_Position.w = _2183;
    float _2292 = _2288 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2294 = _2290 * 0.5;
    float _2296 = -_2282;
    float _2298 = _2296 + 1.0;
    out.m_47.x = _2292;
    float _2300 = _2298 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_66.z = _2294;
    out.m_66.w = _2183;
    float _2302 = -_2300;
    float _2304 = _2302 + 1.0;
    float _2306 = _2300 * _2239;
    float _2308 = _2250 * _2306;
    float _2310 = _2264 * _2306;
    float _2312 = fma(_2260, _2308, _2244);
    float _2314 = fma(_2262, _2308, _2246);
    float _2316 = _2250 * _2304;
    float _2318 = fma(_2250, _2310, _2248);
    out.m_68.x = _2312;
    out.m_68.y = _2314;
    out.m_68.z = _2318;
    out.m_68.w = _2316;
    if (_2278)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_47.x = 0.0;
    float _2320 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2320;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

