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
    float4 m_58 [[user(locn0)]];
    float4 m_62 [[user(locn1)]];
    float4 m_64 [[user(locn2)]];
    float4 m_47 [[user(locn3)]];
    float4 m_60 [[user(locn4)]];
    float4 m_66 [[user(locn6)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_44 [[attribute(2)]];
    float4 m_49 [[attribute(3)]];
    float4 m_51 [[attribute(4)]];
    float4 m_53 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    bool _844 = false;
    bool _369 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _80 = in.m_44.w;
    float _82 = trunc(_80);
    int _85 = int(_82);
    bool _89 = _85 >= 1;
    float _91 = 0.0;
    if (!_89)
    {
        _91 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _93 = _91;
    float _95 = _93;
    if (!_89)
    {
        out.m_47.x = 0.0;
    }
    int _97 = 0;
    if (!_89)
    {
        float _99 = _93 * 5.0;
        _97 = as_type<int>(_99);
    }
    int _101 = _97;
    int _103 = _101;
    if (!_89)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1584 = as_type<float>(_101);
        out.gl_Position.z = _1584;
    }
    if (!_89)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _105 = in.m_49.w;
    bool _107 = _105 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _109 = isnan(_105);
    bool _111 = _107 || _109;
    bool _113 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _115 = _111 || _113;
    float _117 = -_105;
    float _119 = _117 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _121 = 0.0;
    if (_115)
    {
        float _123 = float(_85);
        _121 = _123;
    }
    float _125 = _121;
    bool _127 = _119 >= _125;
    bool _129 = !_115;
    bool _131 = _127 || _129;
    if (_131)
    {
        _95 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _133 = _95;
    if (_131)
    {
        out.m_47.x = 0.0;
    }
    if (_131)
    {
        float _135 = _133 * 5.0;
        _103 = as_type<int>(_135);
    }
    int _137 = _103;
    if (_131)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1652 = as_type<float>(_137);
        out.gl_Position.z = _1652;
    }
    if (_131)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _139 = in.m_51.x;
    float _141 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _143 = _119 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _145 = _119 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _147 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _149 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _151 = _147 || _149;
    bool _153 = isnan(1.0);
    bool _155 = _151 || _153;
    int _157 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _159 = _157 != 0;
    float _161 = _143 * _141;
    float _163 = 0.0;
    float _165 = _145;
    if (!_155)
    {
        float _167 = _145 * _145;
        float _169 = _167 * 0.5;
        _163 = _169;
    }
    float _171 = _163;
    float _173 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[20].x, _161);
    float _175 = _171;
    if (!_155)
    {
        float _177 = _171 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _175 = _177;
    }
    float _179 = _175;
    float _181 = in.m_49.x;
    float _183 = in.m_49.y;
    float _185 = in.m_49.z;
    float _187 = _173 * 6.283185482025146484375;
    float _189 = floor(_173);
    float _191 = _187 * 0.15915493667125701904296875;
    float _193 = _191 * 6.283185482025146484375;
    float _195 = cos(_193);
    float _197 = -_189;
    float _199 = _173 + _197;
    bool _201 = !_155;
    float _203 = _179;
    if (!_201)
    {
        float _205 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _207 = log2(_205);
        float _209 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _211 = _209 + 1.0;
        float _213 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _215 = _145 * _207;
        float _217 = 1.0 / _211;
        float _219 = _213 * 0.693147182464599609375;
        float _221 = exp2(_215);
        float _223 = 1.0 / _219;
        float _225 = _221 + (-1.0);
        float _227 = -_225;
        float _229 = fma(_227, _223, _145);
        float _231 = _229 * _217;
        float _233 = _231 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _203 = _233;
    }
    float _235 = _203;
    bool _237 = !_155;
    if (!_237)
    {
        float _239 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _241 = log2(_239);
        float _243 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _245 = _243 + 1.0;
        float _247 = 1.0 / _245;
        float _249 = _145 * _241;
        float _251 = exp2(_249);
        float _253 = -_251;
        float _255 = _253 + 1.0;
        float _257 = _255 * _247;
        _165 = _257;
    }
    float _259 = _165;
    float _261 = in.m_53.w;
    int _263 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _265 = _263 != 0;
    int _267 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _269 = _267 != 0;
    float _271 = -_199;
    float _273 = fma(_271, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _275 = _199 < 0.5;
    float _277 = float(_275);
    float _279 = fma(_195, 0.5, 0.5);
    float _281 = in.m_44.x;
    float _283 = in.m_44.y;
    float _285 = in.m_44.z;
    bool _287 = !_265;
    int _289 = _287 ? 0 : 1;
    float _291 = _235 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _293 = -_277;
    float _295 = fma(_293, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _297 = -_279;
    float _299 = fma(_297, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _301 = abs(_289);
    float _303 = fma(_259, _181, _291);
    bool _305 = !_159;
    int _307 = _305 ? 0 : 1;
    float _309 = _235 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _311 = !_269;
    int _313 = _311 ? 0 : 1;
    float _315 = _235 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    bool _317 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _319 = fma(_259, _183, _309);
    int _321 = abs(_307);
    float _323 = fma(_259, _185, _315);
    int _325 = abs(_313);
    float _327 = float(_301);
    float _329 = float(_321);
    float _331 = abs(_273);
    float _333 = _327 * _331;
    float _335 = fma(_303, _261, _281);
    float _337 = float(_325);
    float _339 = fma(_329, _299, _333);
    float _341 = fma(_319, _261, _283);
    float _343 = fma(_323, _261, _285);
    float _345 = abs(_295);
    float _347 = fma(_337, _345, _339);
    bool _349 = !_317;
    float _351 = _335;
    float _367;
    if (!_349)
    {
        float _353 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _355 = _139 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _357 = fma(_355, (*spvDescriptorSet0.vp_c9)._m0[12].x, _119);
        float _359 = _357 * _353;
        float _361 = floor(_359);
        float _363 = -_361;
        float _365 = _359 + _363;
        _367 = _365;
        _369 = true;
    }
    else
    {
        float _371 = float(_85);
        float _373 = 1.0 / _371;
        float _375 = _119 * _373;
        _367 = _375;
    }
    _369 = false;
    float _377 = _367;
    float _379 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _381 = _377 + _379;
    float _383 = as_type<float>(int(gl_VertexIndex));
    bool _385 = _377 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _387 = isnan(_377);
    bool _389 = _385 || _387;
    bool _391 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _393 = _389 || _391;
    float _395 = float(_393);
    float _397 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _399 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _397;
    bool _401 = _377 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _403 = isnan(_377);
    bool _405 = _401 || _403;
    bool _407 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _409 = _405 || _407;
    float _411 = float(_409);
    float _413 = 1.0 / _399;
    float _415 = -_395;
    float _417 = _415 + 1.0;
    float _419 = -(*spvDescriptorSet0.vp_c9)._m0[192].y;
    float _421 = (*spvDescriptorSet0.vp_c10)._m0[8].w + _419;
    float _423 = -_421;
    float _425 = _423 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _427 = -(*spvDescriptorSet0.vp_c9)._m0[192].z;
    float _429 = (*spvDescriptorSet0.vp_c10)._m0[9].w + _427;
    float _431 = in.m_53.x;
    float _433 = in.m_53.y;
    float _435 = -_429;
    float _437 = _435 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _439 = _381 * _413;
    float _441 = _437 * _437;
    int _443 = as_type<int>(_383) & 1;
    bool _445 = _443 != 0;
    int _447 = as_type<int>(_383) & 2;
    bool _449 = _447 != 0;
    float _451 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _453 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _451;
    float _455 = fma(_425, _425, _441);
    float _457 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _459 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _457;
    float _461 = fma(_453, _439, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _463 = -(*spvDescriptorSet0.vp_c9)._m0[192].w;
    float _465 = (*spvDescriptorSet0.vp_c10)._m0[10].w + _463;
    float _467 = fma(_459, _439, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _469 = _411 * _417;
    float _471 = -_411;
    float _473 = _471 + 1.0;
    float _475 = -_465;
    float _477 = _475 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _479 = _467 * _469;
    float _481 = _461 * _469;
    float _483 = fma(_477, _477, _455);
    float _485 = fma(_473, (*spvDescriptorSet0.vp_c9)._m0[143].x, _479);
    float _487 = fma(_473, (*spvDescriptorSet0.vp_c9)._m0[143].y, _481);
    float _489 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _491 = fma(_395, (*spvDescriptorSet0.vp_c9)._m0[144].x, _485);
    float _493 = fma(_395, (*spvDescriptorSet0.vp_c9)._m0[144].y, _487);
    float _495 = sqrt(_483);
    float _497 = _489 * _139;
    float _499 = _491 * _431;
    float _501 = _493 * _433;
    bool _503 = !_449;
    float _505 = _503 ? (-0.5) : 0.5;
    bool _507 = !_445;
    float _509 = _507 ? (-0.5) : 0.5;
    float _511 = _347 * _501;
    float _513 = _347 * _499;
    float _515 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _505);
    float _517 = trunc(_497);
    int _519 = int(_517);
    float _521 = _511 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _523 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _509);
    float _525 = _513 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _527 = _521 * _515;
    float _529 = fma(_495, 0.0068421051837503910064697265625, 0.3157894611358642578125);
    float _531 = _525 * _523;
    float _533 = _341 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _535 = _341 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _537 = _527 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _539 = _527 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _541 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _543 = fma(_335, (*spvDescriptorSet0.vp_c10)._m0[4].x, _533);
    float _545 = fma(_335, (*spvDescriptorSet0.vp_c10)._m0[6].x, _535);
    float _547 = fma(_531, (*spvDescriptorSet0.vp_c8)._m0[24].x, _537);
    float _549 = fma(_531, (*spvDescriptorSet0.vp_c8)._m0[26].x, _539);
    float _551 = fma(_343, (*spvDescriptorSet0.vp_c10)._m0[4].z, _543);
    float _553 = fma(_343, (*spvDescriptorSet0.vp_c10)._m0[6].z, _545);
    float _555 = fma(_541, (*spvDescriptorSet0.vp_c8)._m0[24].z, _547);
    float _557 = fma(_541, (*spvDescriptorSet0.vp_c8)._m0[26].z, _549);
    float _559 = _551 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _561 = _553 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _563 = _555 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _565 = _557 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _567 = precise::max(_529, 0.3499999940395355224609375);
    float _569 = _341 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _571 = _559 + _563;
    float _573 = _561 + _565;
    float _575 = precise::min(_567, 1.0);
    float _577 = _527 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _579 = -_421;
    float _581 = _571 + _579;
    float _583 = -_465;
    float _585 = _573 + _583;
    int _587 = _519 << 4;
    int _589 = _587 + 1968;
    float _591 = fma(_335, (*spvDescriptorSet0.vp_c10)._m0[5].x, _569);
    float _593 = fma(_581, _575, _421);
    float _595 = fma(_585, _575, _465);
    int _597 = _589 + 8;
    uint _600 = uint(int(uint(_597) >> uint(2)));
    uint _602 = uint(int(uint(int(_600)) >> uint(2)));
    int _604 = int(_600) & 3;
    float _606 = (*spvDescriptorSet0.vp_c9)._m0[int(_602)][_604];
    float _608 = fma(_531, (*spvDescriptorSet0.vp_c8)._m0[25].x, _577);
    float _610 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _612 = _593 + _610;
    float _614 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _616 = _595 + _614;
    float _618 = fma(_343, (*spvDescriptorSet0.vp_c10)._m0[5].z, _591);
    float _620 = fma(_541, (*spvDescriptorSet0.vp_c8)._m0[25].z, _608);
    float _622 = _612 * _612;
    float _624 = _616 * _616;
    uint _626 = uint(int(uint(_589) >> uint(2)));
    uint _628 = uint(int(uint(int(_626)) >> uint(2)));
    int _630 = int(_626) & 3;
    float _632 = (*spvDescriptorSet0.vp_c9)._m0[int(_628)][_630];
    int _634 = int(_626) + 1;
    uint _636 = uint(int(uint(_634) >> uint(2)));
    int _638 = _634 & 3;
    float _640 = (*spvDescriptorSet0.vp_c9)._m0[int(_636)][_638];
    float _642 = _618 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _644 = _620 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _646 = _622 + _624;
    float _648 = _642 + _644;
    float _650 = sqrt(_646);
    float _652 = -_429;
    float _654 = _648 + _652;
    float _656 = fma(_654, _575, _429);
    bool _658 = _650 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _660 = _654;
    float _662 = _618;
    float _664 = _429;
    float _666 = _593;
    float _668 = _505;
    float _670 = _559;
    if (!_658)
    {
        _660 = _593;
    }
    float _672 = _660;
    float _674 = _672;
    if (!_658)
    {
        _662 = _624;
    }
    float _676 = _662;
    float _678 = _676;
    if (!_658)
    {
        _351 = _622;
    }
    float _680 = _351;
    float _682 = _680;
    if (!_658)
    {
        _664 = _595;
    }
    float _684 = _664;
    float _686 = _684;
    if (!_658)
    {
        _666 = _656;
    }
    float _688 = _666;
    bool _690 = !_658;
    float _692 = _688;
    if (!_690)
    {
        float _694 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _696 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _698 = _650 + _696;
        float _700 = _656 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _702 = rsqrt(_646);
        float _704 = _698 * _694;
        float _706 = _704 * 0.15915493667125701904296875;
        float _708 = _706 * 6.283185482025146484375;
        float _710 = sin(_708);
        float _712 = _706 * 6.283185482025146484375;
        float _714 = cos(_712);
        float _716 = fma(_710, _700, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _718 = _702 * _716;
        float _720 = _714 + (-1.0);
        float _722 = fma(_612, _718, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _724 = fma(_616, _718, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _726 = _720 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _728 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _730 = _722 + _728;
        float _732 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _734 = _724 + _732;
        float _736 = fma(_656, _714, _726);
        float _738 = _730 * _730;
        float _740 = _734 * _734;
        _692 = _736;
        _682 = _738;
        _678 = _740;
        _674 = _722;
        _686 = _724;
    }
    float _742 = _692;
    float _744 = _682;
    float _746 = _678;
    float _748 = _674;
    float _750 = _686;
    float _752 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _754 = _742 + _752;
    float _756 = _509 + 0.5;
    float _758 = fma(_754, _754, _744);
    float _760 = _632 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _762 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _764 = _758 + _746;
    float _766 = _640 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _768 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _770 = _606 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _772 = sqrt(_764);
    float _774 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _776 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _778 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _780 = _768 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _782 = _774 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _784 = _762 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _786 = -_505;
    float _788 = _786 + 0.5;
    float _790 = _760 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _792 = _766 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _794 = _770 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_58.x = _780;
    out.m_58.y = _782;
    out.m_58.z = _784;
    out.m_58.w = _776;
    out.m_60.x = _756;
    out.m_60.y = _788;
    bool _796 = _772 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _798 = isnan(_772);
    bool _800 = _796 || _798;
    bool _802 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _804 = _800 || _802;
    out.m_62.x = _790;
    out.m_62.y = _792;
    out.m_62.z = _794;
    out.m_62.w = _778;
    float _806 = _750;
    float _808 = _756;
    if (!_804)
    {
        _668 = 1.0;
    }
    float _810 = _668;
    bool _812 = !_804;
    float _814 = _810;
    if (!_812)
    {
        bool _816 = _772 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _818 = isnan(_772);
        bool _820 = _816 || _818;
        bool _822 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _824 = _820 || _822;
        if (!_824)
        {
            float _826 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _828 = _772 + _826;
            float _830 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _832 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _830;
            float _834 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _836 = _834 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _838 = 1.0 / _832;
            float _840 = _828 * _838;
            float _842 = fma(_840, _836, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _814 = _842;
            _844 = true;
        }
        else
        {
            bool _846 = _772 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _848 = isnan(_772);
            bool _850 = _846 || _848;
            bool _852 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _854 = _850 || _852;
            if (!_854)
            {
                float _856 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _858 = _772 + _856;
                float _860 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _862 = _860 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _864 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _866 = _864 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _868 = 1.0 / _862;
                float _870 = _858 * _868;
                float _872 = fma(_870, _866, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _814 = _872;
                _844 = true;
            }
            else
            {
                _814 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _844 = false;
    float _874 = _814;
    float _876 = _642 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _878 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _880 = _748 + _878;
    float _882 = fma(_559, (*spvDescriptorSet0.vp_c8)._m0[11].x, _876);
    float _884 = fma(_880, _874, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    bool _886 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _888 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _890 = _886 || _888;
    bool _892 = isnan(0.5);
    bool _894 = _890 || _892;
    float _896 = fma(_561, (*spvDescriptorSet0.vp_c8)._m0[11].z, _882);
    float _898 = _642 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _900 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _902 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _904 = _900 || _902;
    bool _906 = isnan(0.5);
    bool _908 = _904 || _906;
    float _910 = _896 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _912 = fma(_559, (*spvDescriptorSet0.vp_c8)._m0[10].x, _898);
    float _914 = 1.0 / _910;
    float _916 = fma(_561, (*spvDescriptorSet0.vp_c8)._m0[10].z, _912);
    float _918 = _916 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _920 = _918 + _910;
    float _922 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _924 = _742 + _922;
    float _926 = _920 * _914;
    float _928 = _926 * 0.5;
    float _930 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _932 = _750 + _930;
    float _934 = _928;
    float _936 = _924;
    float _938 = _874;
    if (_908)
    {
        _806 = 1.0;
    }
    float _940 = _806;
    float _942 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _944 = fma(_928, (*spvDescriptorSet0.vp_c8)._m0[30].w, _942);
    float _946 = fma(_924, _874, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _948 = fma(_932, _874, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _950 = _940;
    if (_894)
    {
        _934 = _884;
    }
    float _952 = _934;
    float _954 = 1.0 / _944;
    float _956 = _952;
    if (_894)
    {
        _936 = _946;
    }
    float _958 = _936;
    float _960 = _958;
    if (_894)
    {
        _938 = _948;
    }
    float _962 = _938;
    float _964 = _962;
    if (!_894)
    {
        float _966 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _968 = _642 + _966;
        float _970 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _972 = _559 + _970;
        float _974 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _976 = _968 * _968;
        float _978 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _980 = _561 + _978;
        float _982 = fma(_972, _972, _976);
        float _984 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _986 = fma(_980, _980, _982);
        float _988 = sqrt(_986);
        float _990 = _974 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _992 = precise::min(_988, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _994 = _992 * _984;
        float _996 = -_559;
        float _998 = _996 + _884;
        float _1000 = _990 * _994;
        float _1002 = -_642;
        float _1004 = _1002 + _946;
        float _1006 = -_561;
        float _1008 = _1006 + _948;
        float _1010 = fma(_998, _1000, _559);
        float _1012 = fma(_1004, _1000, _642);
        float _1014 = fma(_1008, _1000, _561);
        _960 = _1012;
        _956 = _1010;
        _964 = _1014;
    }
    float _1016 = _960;
    float _1018 = _956;
    float _1020 = _964;
    if (_908)
    {
        _670 = 1.0;
    }
    float _1022 = _670;
    float _1024 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1026 = _954 * _1024;
    float _1028 = _1022;
    float _1030 = _1026;
    if (!_908)
    {
        float _1032 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1034 = _1032 * 0.15915493667125701904296875;
        float _1036 = _1034 * 6.283185482025146484375;
        float _1038 = cos(_1036);
        float _1040 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1042 = _1040 * 0.15915493667125701904296875;
        float _1044 = _1034 * 6.283185482025146484375;
        float _1046 = sin(_1044);
        float _1048 = 1.0 / _1038;
        float _1050 = _1042 * 6.283185482025146484375;
        float _1052 = cos(_1050);
        float _1054 = _1046 * _1048;
        float _1056 = _1042 * 6.283185482025146484375;
        float _1058 = sin(_1056);
        float _1060 = _1052 * _1054;
        float _1062 = 1.0 / _1060;
        float _1064 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1066 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1064;
        float _1068 = 1.0 / _1066;
        float _1070 = _1058 * _1062;
        float _1072 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1074 = fma(_1026, _1070, _1072);
        float _1076 = _1074 * _1068;
        float _1078 = precise::clamp(_1076, 0.0, 1.0);
        _950 = _1078;
    }
    float _1080 = _950;
    if (!_908)
    {
        float _1082 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1084 = _1082 * 0.15915493667125701904296875;
        float _1086 = _1084 * 6.283185482025146484375;
        float _1088 = cos(_1086);
        float _1090 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1092 = _1090 * 0.15915493667125701904296875;
        float _1094 = _1084 * 6.283185482025146484375;
        float _1096 = sin(_1094);
        float _1098 = 1.0 / _1088;
        float _1100 = _1092 * 6.283185482025146484375;
        float _1102 = cos(_1100);
        float _1104 = _1096 * _1098;
        float _1106 = _1092 * 6.283185482025146484375;
        float _1108 = sin(_1106);
        float _1110 = _1102 * _1104;
        float _1112 = 1.0 / _1110;
        float _1114 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1116 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1114;
        float _1118 = 1.0 / _1116;
        float _1120 = _1108 * _1112;
        float _1122 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1124 = fma(_1026, _1120, _1122);
        float _1126 = _1124 * _1118;
        float _1128 = precise::clamp(_1126, 0.0, 1.0);
        float _1130 = -_1128;
        float _1132 = _1130 + 1.0;
        _1028 = _1132;
    }
    float _1134 = _1028;
    float _1136 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1138 = _1016 + _1136;
    float _1140 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1142 = _1018 + _1140;
    float _1144 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1146 = _1020 + _1144;
    float _1148 = _1138 * _1138;
    float _1150 = fma(_1142, _1142, _1148);
    float _1152 = fma(_1146, _1146, _1150);
    float _1154 = rsqrt(_1152);
    float _1156 = _1154 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1158 = _1142 * _1156;
    float _1160 = _1146 * _1156;
    float _1162 = _1158 * _1158;
    float _1164 = _1160 * _1160;
    float _1166 = _1162 + _1164;
    float _1168 = sqrt(_1166);
    bool _1170 = _1168 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1172 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1174 = _1168 + _1172;
    float _1176 = _1154;
    float _1178 = _1166;
    float _1180 = _1174;
    float _1182 = _1138;
    float _1184 = _1158;
    if (_1170)
    {
        float _1186 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1176 = _1186;
    }
    float _1188 = _1176;
    if (_1170)
    {
        float _1190 = rsqrt(_1166);
        _1178 = _1190;
    }
    float _1192 = _1178;
    if (_1170)
    {
        float _1194 = _1174 * _1188;
        _1180 = _1194;
    }
    float _1196 = _1180;
    if (_1170)
    {
        float _1198 = _1196 * 0.15915493667125701904296875;
        _1030 = _1198;
    }
    float _1200 = _1030;
    float _1202 = _1188;
    if (_1170)
    {
        float _1204 = _1200 * 6.283185482025146484375;
        float _1206 = sin(_1204);
        _1202 = _1206;
    }
    float _1208 = _1202;
    float _1210 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1212 = precise::max(0.0, _1210);
    float _1214 = _1146;
    float _1216 = _1212;
    if (_1170)
    {
        float _1218 = _1200 * 6.283185482025146484375;
        float _1220 = cos(_1218);
        _1214 = _1220;
    }
    float _1222 = _1214;
    float _1224 = -_1156;
    float _1226 = -_1212;
    float _1228 = fma(_1138, _1224, _1226);
    float _1230 = _1228;
    if (!_1170)
    {
        _1182 = _1160;
    }
    float _1232 = _1182;
    float _1234 = _1232;
    if (_1170)
    {
        float _1236 = _1228 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1216 = _1236;
    }
    float _1238 = _1216;
    float _1240 = sqrt(_1152);
    float _1242 = _1208;
    float _1244 = _1238;
    if (_1170)
    {
        float _1246 = fma(_1208, _1238, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1242 = _1246;
    }
    float _1248 = _1242;
    float _1250 = _1248;
    float _1252 = _1222;
    if (_1170)
    {
        float _1254 = _1222 + (-1.0);
        _1244 = _1254;
    }
    float _1256 = _1244;
    float _1258 = _1256;
    if (_1170)
    {
        float _1260 = _1192 * _1248;
        _808 = _1260;
    }
    float _1262 = _808;
    if (_1170)
    {
        float _1264 = _1256 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1250 = _1264;
    }
    float _1266 = _1250;
    if (_1170)
    {
        float _1268 = _1158 * _1262;
        _1184 = _1268;
    }
    float _1270 = _1184;
    if (!_1170)
    {
        _1258 = _1162;
    }
    float _1272 = _1258;
    float _1274 = _1272;
    if (_1170)
    {
        float _1276 = _1160 * _1262;
        _1234 = _1276;
    }
    float _1278 = _1234;
    if (_1170)
    {
        float _1280 = fma(_1228, _1222, _1266);
        _1230 = _1280;
    }
    float _1282 = _1230;
    if (_1170)
    {
        float _1284 = _1270 * _1270;
        _1274 = _1284;
    }
    float _1286 = _1274;
    if (!_1170)
    {
        _1252 = _1164;
    }
    float _1288 = _1252;
    float _1290 = _1288;
    if (_1170)
    {
        float _1292 = _1278 * _1278;
        _1290 = _1292;
    }
    float _1294 = _1290;
    float _1296 = fma(_1282, _1282, _1286);
    float _1298 = _1296 + _1294;
    float _1300 = _1016 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1302 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1304 = fma(_1240, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1302);
    float _1306 = precise::clamp(_1304, 0.0, 1.0);
    float _1308 = _1016 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1310 = rsqrt(_1298);
    float _1312 = fma(_1018, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1300);
    float _1314 = -_1306;
    float _1316 = _1314 + 1.0;
    float _1318 = fma(_1018, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1308);
    float _1320 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1322 = fma(_1020, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1312);
    float _1324 = _1016 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1326 = _1016 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1328 = fma(_1020, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1318);
    float _1330 = _1322 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1332 = fma(_1018, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1324);
    float _1334 = fma(_1018, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1326);
    float _1336 = _1328 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1338 = _1330 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1340 = fma(_1020, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1332);
    float _1342 = fma(_1020, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1334);
    float _1344 = abs(_1316);
    float _1346 = log2(_1344);
    float _1348 = _1310 * _1270;
    float _1350 = -_1338;
    float _1352 = fma(_1350, _1320, 1.0);
    float _1354 = _1340 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1356 = _1336 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1358 = _1342 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1360 = _1310 * _1282;
    float _1362 = _1348 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1364 = fma(_1354, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1356);
    float _1366 = _1310 * _1278;
    float _1368 = log2(_1352);
    float _1370 = -_1362;
    float _1372 = fma(_1360, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1370);
    float _1374 = fma(_1330, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1364);
    float _1376 = _1336 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1378 = _1360 + 1.0;
    float _1380 = -_1366;
    float _1382 = fma(_1380, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1372);
    float _1384 = fma(_1358, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1374);
    float _1386 = _1346 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1388 = _1336 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1390 = fma(_1382, -0.5, 0.5);
    float _1392 = 1.0 / _1384;
    float _1394 = fma(_1382, 0.5, 0.5);
    float _1396 = fma(_1354, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1388);
    float _1398 = fma(_1354, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1376);
    float _1400 = fma(_1330, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1396);
    float _1402 = fma(_1394, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1404 = exp2(_1386);
    float _1406 = fma(_1330, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1398);
    float _1408 = fma(_1358, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1400);
    float _1410 = fma(_1394, _1402, -0.212114393711090087890625);
    float _1412 = _1368 * 0.693147182464599609375;
    float _1414 = fma(_1358, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1406);
    float _1416 = fma(_1394, _1410, 1.570728778839111328125);
    float _1418 = sqrt(_1390);
    float _1420 = _1408 * _1392;
    float _1422 = _1414 * _1392;
    float _1424 = _1412 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1426 = fma(_1420, 0.5, 0.5);
    float _1428 = fma(_1422, -0.5, 0.5);
    float _1430 = -_1360;
    float _1432 = fma(_1404, _1378, _1430);
    float3 _3730 = float3(_1426, _1428, _1424);
    float _1434 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3730, float3(0.0), isnan(_3730)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3730, float3(0.0), isnan(_3730)), level(0.0)).x;
    float _1436 = fma(_1432, 0.5, 0.5);
    float _1438 = _1418 * 0.636619746685028076171875;
    float _1440 = -_1416;
    float _1442 = fma(_1438, _1440, 1.0);
    float3 _3751 = float3(_1426, _1428, _1424);
    float4 _1445 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3751, float3(0.0), isnan(_3751)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3751, float3(0.0), isnan(_3751)), level(0.0)).xyzw;
    float _1447 = _1445.x;
    float _1449 = _1445.y;
    float _1451 = _1445.z;
    float _1453 = _1445.w;
    float2 _3768 = float2(_1442, _1436);
    float3 _1457 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3768, float2(0.0), isnan(_3768)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3768, float2(0.0), isnan(_3768)), level(0.0)).xyz;
    float _1459 = _1457.x;
    float _1461 = _1457.y;
    float _1463 = _1457.z;
    float _1465 = _1346 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1467 = _1336 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _1469 = _1080 > 0.0;
    bool _1471 = isnan(_1080);
    bool _1473 = _1469 || _1471;
    bool _1475 = isnan(0.0);
    bool _1477 = _1473 || _1475;
    float _1479 = _1080 * _1134;
    float _1481 = fma(_1354, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1467);
    float _1483 = exp2(_1465);
    bool _1485 = _1134 <= 0.0;
    bool _1487 = !_1477;
    bool _1489 = _1485 || _1487;
    float _1491 = fma(_1330, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1481);
    float _1493 = _1479 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1495 = fma(_1358, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1491);
    float _1497 = _1493 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1499 = _1495 + _1384;
    out.gl_Position.x = _1408;
    out.gl_Position.y = _1414;
    out.gl_Position.z = _1495;
    out.gl_Position.w = _1384;
    float _1501 = _1499 * 0.5;
    float _1503 = -_1483;
    float _1505 = _1503 + 1.0;
    out.m_47.x = _1497;
    float _1507 = _1505 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_64.z = _1501;
    out.m_64.w = _1384;
    float _1509 = _1507 * _1434;
    float _1511 = -_1507;
    float _1513 = _1511 + 1.0;
    float _1515 = _1453 * _1509;
    float _1517 = _1463 * _1509;
    float _1519 = fma(_1459, _1515, _1447);
    float _1521 = fma(_1461, _1515, _1449);
    float _1523 = _1453 * _1513;
    float _1525 = fma(_1453, _1517, _1451);
    out.m_66.x = _1519;
    out.m_66.y = _1521;
    out.m_66.z = _1525;
    out.m_66.w = _1523;
    if (!_1489)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_47.x = 0.0;
    float _1527 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1527;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    bool _844 = false;
    bool _369 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _80 = in.m_44.w;
    float _82 = trunc(_80);
    int _85 = int(_82);
    bool _89 = _85 >= 1;
    float _91 = 0.0;
    if (!_89)
    {
        _91 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _93 = _91;
    float _95 = _93;
    if (!_89)
    {
        out.m_47.x = 0.0;
    }
    int _97 = 0;
    if (!_89)
    {
        float _99 = _93 * 5.0;
        _97 = as_type<int>(_99);
    }
    int _101 = _97;
    int _103 = _101;
    if (!_89)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1584 = as_type<float>(_101);
        out.gl_Position.z = _1584;
    }
    if (!_89)
    {
        return out;
    }
    float _105 = in.m_49.w;
    bool _107 = _105 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _109 = isnan(_105);
    bool _111 = _107 || _109;
    bool _113 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _115 = _111 || _113;
    float _117 = -_105;
    float _119 = _117 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _121 = 0.0;
    if (_115)
    {
        float _123 = float(_85);
        _121 = _123;
    }
    float _125 = _121;
    bool _127 = _119 >= _125;
    bool _129 = !_115;
    bool _131 = _127 || _129;
    if (_131)
    {
        _95 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _133 = _95;
    if (_131)
    {
        out.m_47.x = 0.0;
    }
    if (_131)
    {
        float _135 = _133 * 5.0;
        _103 = as_type<int>(_135);
    }
    int _137 = _103;
    if (_131)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1652 = as_type<float>(_137);
        out.gl_Position.z = _1652;
    }
    if (_131)
    {
        return out;
    }
    float _139 = in.m_51.x;
    float _141 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _143 = _119 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _145 = _119 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _147 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _149 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _151 = _147 || _149;
    bool _153 = isnan(1.0);
    bool _155 = _151 || _153;
    int _157 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _159 = _157 != 0;
    float _161 = _143 * _141;
    float _163 = 0.0;
    float _165 = _145;
    if (!_155)
    {
        float _167 = _145 * _145;
        float _169 = _167 * 0.5;
        _163 = _169;
    }
    float _171 = _163;
    float _173 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[20].x, _161);
    float _175 = _171;
    if (!_155)
    {
        float _177 = _171 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _175 = _177;
    }
    float _179 = _175;
    float _181 = in.m_49.x;
    float _183 = in.m_49.y;
    float _185 = in.m_49.z;
    float _187 = _173 * 6.283185482025146484375;
    float _189 = floor(_173);
    float _191 = _187 * 0.15915493667125701904296875;
    float _193 = _191 * 6.283185482025146484375;
    float _195 = cos(_193);
    float _197 = -_189;
    float _199 = _173 + _197;
    bool _201 = !_155;
    float _203 = _179;
    if (!_201)
    {
        float _205 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _207 = log2(_205);
        float _209 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _211 = _209 + 1.0;
        float _213 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _215 = _145 * _207;
        float _217 = 1.0 / _211;
        float _219 = _213 * 0.693147182464599609375;
        float _221 = exp2(_215);
        float _223 = 1.0 / _219;
        float _225 = _221 + (-1.0);
        float _227 = -_225;
        float _229 = fma(_227, _223, _145);
        float _231 = _229 * _217;
        float _233 = _231 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _203 = _233;
    }
    float _235 = _203;
    bool _237 = !_155;
    if (!_237)
    {
        float _239 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _241 = log2(_239);
        float _243 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _245 = _243 + 1.0;
        float _247 = 1.0 / _245;
        float _249 = _145 * _241;
        float _251 = exp2(_249);
        float _253 = -_251;
        float _255 = _253 + 1.0;
        float _257 = _255 * _247;
        _165 = _257;
    }
    float _259 = _165;
    float _261 = in.m_53.w;
    int _263 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _265 = _263 != 0;
    int _267 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _269 = _267 != 0;
    float _271 = -_199;
    float _273 = fma(_271, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _275 = _199 < 0.5;
    float _277 = float(_275);
    float _279 = fma(_195, 0.5, 0.5);
    float _281 = in.m_44.x;
    float _283 = in.m_44.y;
    float _285 = in.m_44.z;
    bool _287 = !_265;
    int _289 = _287 ? 0 : 1;
    float _291 = _235 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _293 = -_277;
    float _295 = fma(_293, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _297 = -_279;
    float _299 = fma(_297, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _301 = abs(_289);
    float _303 = fma(_259, _181, _291);
    bool _305 = !_159;
    int _307 = _305 ? 0 : 1;
    float _309 = _235 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _311 = !_269;
    int _313 = _311 ? 0 : 1;
    float _315 = _235 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    bool _317 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _319 = fma(_259, _183, _309);
    int _321 = abs(_307);
    float _323 = fma(_259, _185, _315);
    int _325 = abs(_313);
    float _327 = float(_301);
    float _329 = float(_321);
    float _331 = abs(_273);
    float _333 = _327 * _331;
    float _335 = fma(_303, _261, _281);
    float _337 = float(_325);
    float _339 = fma(_329, _299, _333);
    float _341 = fma(_319, _261, _283);
    float _343 = fma(_323, _261, _285);
    float _345 = abs(_295);
    float _347 = fma(_337, _345, _339);
    bool _349 = !_317;
    float _351 = _335;
    float _367;
    if (!_349)
    {
        float _353 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _355 = _139 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _357 = fma(_355, (*spvDescriptorSet0.vp_c9)._m0[12].x, _119);
        float _359 = _357 * _353;
        float _361 = floor(_359);
        float _363 = -_361;
        float _365 = _359 + _363;
        _367 = _365;
        _369 = true;
    }
    else
    {
        float _371 = float(_85);
        float _373 = 1.0 / _371;
        float _375 = _119 * _373;
        _367 = _375;
    }
    _369 = false;
    float _377 = _367;
    float _379 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _381 = _377 + _379;
    float _383 = as_type<float>(int(gl_VertexIndex));
    bool _385 = _377 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _387 = isnan(_377);
    bool _389 = _385 || _387;
    bool _391 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _393 = _389 || _391;
    float _395 = float(_393);
    float _397 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _399 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _397;
    bool _401 = _377 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _403 = isnan(_377);
    bool _405 = _401 || _403;
    bool _407 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _409 = _405 || _407;
    float _411 = float(_409);
    float _413 = 1.0 / _399;
    float _415 = -_395;
    float _417 = _415 + 1.0;
    float _419 = -(*spvDescriptorSet0.vp_c9)._m0[192].y;
    float _421 = (*spvDescriptorSet0.vp_c10)._m0[8].w + _419;
    float _423 = -_421;
    float _425 = _423 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _427 = -(*spvDescriptorSet0.vp_c9)._m0[192].z;
    float _429 = (*spvDescriptorSet0.vp_c10)._m0[9].w + _427;
    float _431 = in.m_53.x;
    float _433 = in.m_53.y;
    float _435 = -_429;
    float _437 = _435 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _439 = _381 * _413;
    float _441 = _437 * _437;
    int _443 = as_type<int>(_383) & 1;
    bool _445 = _443 != 0;
    int _447 = as_type<int>(_383) & 2;
    bool _449 = _447 != 0;
    float _451 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _453 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _451;
    float _455 = fma(_425, _425, _441);
    float _457 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _459 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _457;
    float _461 = fma(_453, _439, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _463 = -(*spvDescriptorSet0.vp_c9)._m0[192].w;
    float _465 = (*spvDescriptorSet0.vp_c10)._m0[10].w + _463;
    float _467 = fma(_459, _439, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _469 = _411 * _417;
    float _471 = -_411;
    float _473 = _471 + 1.0;
    float _475 = -_465;
    float _477 = _475 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _479 = _467 * _469;
    float _481 = _461 * _469;
    float _483 = fma(_477, _477, _455);
    float _485 = fma(_473, (*spvDescriptorSet0.vp_c9)._m0[143].x, _479);
    float _487 = fma(_473, (*spvDescriptorSet0.vp_c9)._m0[143].y, _481);
    float _489 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _491 = fma(_395, (*spvDescriptorSet0.vp_c9)._m0[144].x, _485);
    float _493 = fma(_395, (*spvDescriptorSet0.vp_c9)._m0[144].y, _487);
    float _495 = sqrt(_483);
    float _497 = _489 * _139;
    float _499 = _491 * _431;
    float _501 = _493 * _433;
    bool _503 = !_449;
    float _505 = _503 ? (-0.5) : 0.5;
    bool _507 = !_445;
    float _509 = _507 ? (-0.5) : 0.5;
    float _511 = _347 * _501;
    float _513 = _347 * _499;
    float _515 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _505);
    float _517 = trunc(_497);
    int _519 = int(_517);
    float _521 = _511 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _523 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _509);
    float _525 = _513 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _527 = _521 * _515;
    float _529 = fma(_495, 0.0068421051837503910064697265625, 0.3157894611358642578125);
    float _531 = _525 * _523;
    float _533 = _341 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _535 = _341 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _537 = _527 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _539 = _527 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _541 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _543 = fma(_335, (*spvDescriptorSet0.vp_c10)._m0[4].x, _533);
    float _545 = fma(_335, (*spvDescriptorSet0.vp_c10)._m0[6].x, _535);
    float _547 = fma(_531, (*spvDescriptorSet0.vp_c8)._m0[24].x, _537);
    float _549 = fma(_531, (*spvDescriptorSet0.vp_c8)._m0[26].x, _539);
    float _551 = fma(_343, (*spvDescriptorSet0.vp_c10)._m0[4].z, _543);
    float _553 = fma(_343, (*spvDescriptorSet0.vp_c10)._m0[6].z, _545);
    float _555 = fma(_541, (*spvDescriptorSet0.vp_c8)._m0[24].z, _547);
    float _557 = fma(_541, (*spvDescriptorSet0.vp_c8)._m0[26].z, _549);
    float _559 = _551 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _561 = _553 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _563 = _555 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _565 = _557 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _567 = precise::max(_529, 0.3499999940395355224609375);
    float _569 = _341 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _571 = _559 + _563;
    float _573 = _561 + _565;
    float _575 = precise::min(_567, 1.0);
    float _577 = _527 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _579 = -_421;
    float _581 = _571 + _579;
    float _583 = -_465;
    float _585 = _573 + _583;
    int _587 = _519 << 4;
    int _589 = _587 + 1968;
    float _591 = fma(_335, (*spvDescriptorSet0.vp_c10)._m0[5].x, _569);
    float _593 = fma(_581, _575, _421);
    float _595 = fma(_585, _575, _465);
    int _597 = _589 + 8;
    uint _600 = uint(int(uint(_597) >> uint(2)));
    uint _602 = uint(int(uint(int(_600)) >> uint(2)));
    int _604 = int(_600) & 3;
    float _606 = (*spvDescriptorSet0.vp_c9)._m0[int(_602)][_604];
    float _608 = fma(_531, (*spvDescriptorSet0.vp_c8)._m0[25].x, _577);
    float _610 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _612 = _593 + _610;
    float _614 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _616 = _595 + _614;
    float _618 = fma(_343, (*spvDescriptorSet0.vp_c10)._m0[5].z, _591);
    float _620 = fma(_541, (*spvDescriptorSet0.vp_c8)._m0[25].z, _608);
    float _622 = _612 * _612;
    float _624 = _616 * _616;
    uint _626 = uint(int(uint(_589) >> uint(2)));
    uint _628 = uint(int(uint(int(_626)) >> uint(2)));
    int _630 = int(_626) & 3;
    float _632 = (*spvDescriptorSet0.vp_c9)._m0[int(_628)][_630];
    int _634 = int(_626) + 1;
    uint _636 = uint(int(uint(_634) >> uint(2)));
    int _638 = _634 & 3;
    float _640 = (*spvDescriptorSet0.vp_c9)._m0[int(_636)][_638];
    float _642 = _618 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _644 = _620 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _646 = _622 + _624;
    float _648 = _642 + _644;
    float _650 = sqrt(_646);
    float _652 = -_429;
    float _654 = _648 + _652;
    float _656 = fma(_654, _575, _429);
    bool _658 = _650 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _660 = _654;
    float _662 = _618;
    float _664 = _429;
    float _666 = _593;
    float _668 = _505;
    float _670 = _559;
    if (!_658)
    {
        _660 = _593;
    }
    float _672 = _660;
    float _674 = _672;
    if (!_658)
    {
        _662 = _624;
    }
    float _676 = _662;
    float _678 = _676;
    if (!_658)
    {
        _351 = _622;
    }
    float _680 = _351;
    float _682 = _680;
    if (!_658)
    {
        _664 = _595;
    }
    float _684 = _664;
    float _686 = _684;
    if (!_658)
    {
        _666 = _656;
    }
    float _688 = _666;
    bool _690 = !_658;
    float _692 = _688;
    if (!_690)
    {
        float _694 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _696 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _698 = _650 + _696;
        float _700 = _656 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _702 = rsqrt(_646);
        float _704 = _698 * _694;
        float _706 = _704 * 0.15915493667125701904296875;
        float _708 = _706 * 6.283185482025146484375;
        float _710 = sin(_708);
        float _712 = _706 * 6.283185482025146484375;
        float _714 = cos(_712);
        float _716 = fma(_710, _700, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _718 = _702 * _716;
        float _720 = _714 + (-1.0);
        float _722 = fma(_612, _718, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _724 = fma(_616, _718, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _726 = _720 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _728 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _730 = _722 + _728;
        float _732 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _734 = _724 + _732;
        float _736 = fma(_656, _714, _726);
        float _738 = _730 * _730;
        float _740 = _734 * _734;
        _692 = _736;
        _682 = _738;
        _678 = _740;
        _674 = _722;
        _686 = _724;
    }
    float _742 = _692;
    float _744 = _682;
    float _746 = _678;
    float _748 = _674;
    float _750 = _686;
    float _752 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _754 = _742 + _752;
    float _756 = _509 + 0.5;
    float _758 = fma(_754, _754, _744);
    float _760 = _632 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _762 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _764 = _758 + _746;
    float _766 = _640 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _768 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _770 = _606 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _772 = sqrt(_764);
    float _774 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _776 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _778 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _780 = _768 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _782 = _774 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _784 = _762 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _786 = -_505;
    float _788 = _786 + 0.5;
    float _790 = _760 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _792 = _766 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _794 = _770 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_58.x = _780;
    out.m_58.y = _782;
    out.m_58.z = _784;
    out.m_58.w = _776;
    out.m_60.x = _756;
    out.m_60.y = _788;
    bool _796 = _772 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _798 = isnan(_772);
    bool _800 = _796 || _798;
    bool _802 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _804 = _800 || _802;
    out.m_62.x = _790;
    out.m_62.y = _792;
    out.m_62.z = _794;
    out.m_62.w = _778;
    float _806 = _750;
    float _808 = _756;
    if (!_804)
    {
        _668 = 1.0;
    }
    float _810 = _668;
    bool _812 = !_804;
    float _814 = _810;
    if (!_812)
    {
        bool _816 = _772 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _818 = isnan(_772);
        bool _820 = _816 || _818;
        bool _822 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _824 = _820 || _822;
        if (!_824)
        {
            float _826 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _828 = _772 + _826;
            float _830 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _832 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _830;
            float _834 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _836 = _834 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _838 = 1.0 / _832;
            float _840 = _828 * _838;
            float _842 = fma(_840, _836, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _814 = _842;
            _844 = true;
        }
        else
        {
            bool _846 = _772 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _848 = isnan(_772);
            bool _850 = _846 || _848;
            bool _852 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _854 = _850 || _852;
            if (!_854)
            {
                float _856 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _858 = _772 + _856;
                float _860 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _862 = _860 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _864 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _866 = _864 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _868 = 1.0 / _862;
                float _870 = _858 * _868;
                float _872 = fma(_870, _866, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _814 = _872;
                _844 = true;
            }
            else
            {
                _814 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _844 = false;
    float _874 = _814;
    float _876 = _642 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _878 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _880 = _748 + _878;
    float _882 = fma(_559, (*spvDescriptorSet0.vp_c8)._m0[11].x, _876);
    float _884 = fma(_880, _874, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    bool _886 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _888 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _890 = _886 || _888;
    bool _892 = isnan(0.5);
    bool _894 = _890 || _892;
    float _896 = fma(_561, (*spvDescriptorSet0.vp_c8)._m0[11].z, _882);
    float _898 = _642 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _900 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _902 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _904 = _900 || _902;
    bool _906 = isnan(0.5);
    bool _908 = _904 || _906;
    float _910 = _896 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _912 = fma(_559, (*spvDescriptorSet0.vp_c8)._m0[10].x, _898);
    float _914 = 1.0 / _910;
    float _916 = fma(_561, (*spvDescriptorSet0.vp_c8)._m0[10].z, _912);
    float _918 = _916 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _920 = _918 + _910;
    float _922 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _924 = _742 + _922;
    float _926 = _920 * _914;
    float _928 = _926 * 0.5;
    float _930 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _932 = _750 + _930;
    float _934 = _928;
    float _936 = _924;
    float _938 = _874;
    if (_908)
    {
        _806 = 1.0;
    }
    float _940 = _806;
    float _942 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _944 = fma(_928, (*spvDescriptorSet0.vp_c8)._m0[30].w, _942);
    float _946 = fma(_924, _874, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _948 = fma(_932, _874, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _950 = _940;
    if (_894)
    {
        _934 = _884;
    }
    float _952 = _934;
    float _954 = 1.0 / _944;
    float _956 = _952;
    if (_894)
    {
        _936 = _946;
    }
    float _958 = _936;
    float _960 = _958;
    if (_894)
    {
        _938 = _948;
    }
    float _962 = _938;
    float _964 = _962;
    if (!_894)
    {
        float _966 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _968 = _642 + _966;
        float _970 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _972 = _559 + _970;
        float _974 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _976 = _968 * _968;
        float _978 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _980 = _561 + _978;
        float _982 = fma(_972, _972, _976);
        float _984 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _986 = fma(_980, _980, _982);
        float _988 = sqrt(_986);
        float _990 = _974 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _992 = precise::min(_988, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _994 = _992 * _984;
        float _996 = -_559;
        float _998 = _996 + _884;
        float _1000 = _990 * _994;
        float _1002 = -_642;
        float _1004 = _1002 + _946;
        float _1006 = -_561;
        float _1008 = _1006 + _948;
        float _1010 = fma(_998, _1000, _559);
        float _1012 = fma(_1004, _1000, _642);
        float _1014 = fma(_1008, _1000, _561);
        _960 = _1012;
        _956 = _1010;
        _964 = _1014;
    }
    float _1016 = _960;
    float _1018 = _956;
    float _1020 = _964;
    if (_908)
    {
        _670 = 1.0;
    }
    float _1022 = _670;
    float _1024 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1026 = _954 * _1024;
    float _1028 = _1022;
    float _1030 = _1026;
    if (!_908)
    {
        float _1032 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1034 = _1032 * 0.15915493667125701904296875;
        float _1036 = _1034 * 6.283185482025146484375;
        float _1038 = cos(_1036);
        float _1040 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1042 = _1040 * 0.15915493667125701904296875;
        float _1044 = _1034 * 6.283185482025146484375;
        float _1046 = sin(_1044);
        float _1048 = 1.0 / _1038;
        float _1050 = _1042 * 6.283185482025146484375;
        float _1052 = cos(_1050);
        float _1054 = _1046 * _1048;
        float _1056 = _1042 * 6.283185482025146484375;
        float _1058 = sin(_1056);
        float _1060 = _1052 * _1054;
        float _1062 = 1.0 / _1060;
        float _1064 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1066 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1064;
        float _1068 = 1.0 / _1066;
        float _1070 = _1058 * _1062;
        float _1072 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1074 = fma(_1026, _1070, _1072);
        float _1076 = _1074 * _1068;
        float _1078 = precise::clamp(_1076, 0.0, 1.0);
        _950 = _1078;
    }
    float _1080 = _950;
    if (!_908)
    {
        float _1082 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1084 = _1082 * 0.15915493667125701904296875;
        float _1086 = _1084 * 6.283185482025146484375;
        float _1088 = cos(_1086);
        float _1090 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1092 = _1090 * 0.15915493667125701904296875;
        float _1094 = _1084 * 6.283185482025146484375;
        float _1096 = sin(_1094);
        float _1098 = 1.0 / _1088;
        float _1100 = _1092 * 6.283185482025146484375;
        float _1102 = cos(_1100);
        float _1104 = _1096 * _1098;
        float _1106 = _1092 * 6.283185482025146484375;
        float _1108 = sin(_1106);
        float _1110 = _1102 * _1104;
        float _1112 = 1.0 / _1110;
        float _1114 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1116 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1114;
        float _1118 = 1.0 / _1116;
        float _1120 = _1108 * _1112;
        float _1122 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1124 = fma(_1026, _1120, _1122);
        float _1126 = _1124 * _1118;
        float _1128 = precise::clamp(_1126, 0.0, 1.0);
        float _1130 = -_1128;
        float _1132 = _1130 + 1.0;
        _1028 = _1132;
    }
    float _1134 = _1028;
    float _1136 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1138 = _1016 + _1136;
    float _1140 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1142 = _1018 + _1140;
    float _1144 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1146 = _1020 + _1144;
    float _1148 = _1138 * _1138;
    float _1150 = fma(_1142, _1142, _1148);
    float _1152 = fma(_1146, _1146, _1150);
    float _1154 = rsqrt(_1152);
    float _1156 = _1154 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1158 = _1142 * _1156;
    float _1160 = _1146 * _1156;
    float _1162 = _1158 * _1158;
    float _1164 = _1160 * _1160;
    float _1166 = _1162 + _1164;
    float _1168 = sqrt(_1166);
    bool _1170 = _1168 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1172 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1174 = _1168 + _1172;
    float _1176 = _1154;
    float _1178 = _1166;
    float _1180 = _1174;
    float _1182 = _1138;
    float _1184 = _1158;
    if (_1170)
    {
        float _1186 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1176 = _1186;
    }
    float _1188 = _1176;
    if (_1170)
    {
        float _1190 = rsqrt(_1166);
        _1178 = _1190;
    }
    float _1192 = _1178;
    if (_1170)
    {
        float _1194 = _1174 * _1188;
        _1180 = _1194;
    }
    float _1196 = _1180;
    if (_1170)
    {
        float _1198 = _1196 * 0.15915493667125701904296875;
        _1030 = _1198;
    }
    float _1200 = _1030;
    float _1202 = _1188;
    if (_1170)
    {
        float _1204 = _1200 * 6.283185482025146484375;
        float _1206 = sin(_1204);
        _1202 = _1206;
    }
    float _1208 = _1202;
    float _1210 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1212 = precise::max(0.0, _1210);
    float _1214 = _1146;
    float _1216 = _1212;
    if (_1170)
    {
        float _1218 = _1200 * 6.283185482025146484375;
        float _1220 = cos(_1218);
        _1214 = _1220;
    }
    float _1222 = _1214;
    float _1224 = -_1156;
    float _1226 = -_1212;
    float _1228 = fma(_1138, _1224, _1226);
    float _1230 = _1228;
    if (!_1170)
    {
        _1182 = _1160;
    }
    float _1232 = _1182;
    float _1234 = _1232;
    if (_1170)
    {
        float _1236 = _1228 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1216 = _1236;
    }
    float _1238 = _1216;
    float _1240 = sqrt(_1152);
    float _1242 = _1208;
    float _1244 = _1238;
    if (_1170)
    {
        float _1246 = fma(_1208, _1238, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1242 = _1246;
    }
    float _1248 = _1242;
    float _1250 = _1248;
    float _1252 = _1222;
    if (_1170)
    {
        float _1254 = _1222 + (-1.0);
        _1244 = _1254;
    }
    float _1256 = _1244;
    float _1258 = _1256;
    if (_1170)
    {
        float _1260 = _1192 * _1248;
        _808 = _1260;
    }
    float _1262 = _808;
    if (_1170)
    {
        float _1264 = _1256 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1250 = _1264;
    }
    float _1266 = _1250;
    if (_1170)
    {
        float _1268 = _1158 * _1262;
        _1184 = _1268;
    }
    float _1270 = _1184;
    if (!_1170)
    {
        _1258 = _1162;
    }
    float _1272 = _1258;
    float _1274 = _1272;
    if (_1170)
    {
        float _1276 = _1160 * _1262;
        _1234 = _1276;
    }
    float _1278 = _1234;
    if (_1170)
    {
        float _1280 = fma(_1228, _1222, _1266);
        _1230 = _1280;
    }
    float _1282 = _1230;
    if (_1170)
    {
        float _1284 = _1270 * _1270;
        _1274 = _1284;
    }
    float _1286 = _1274;
    if (!_1170)
    {
        _1252 = _1164;
    }
    float _1288 = _1252;
    float _1290 = _1288;
    if (_1170)
    {
        float _1292 = _1278 * _1278;
        _1290 = _1292;
    }
    float _1294 = _1290;
    float _1296 = fma(_1282, _1282, _1286);
    float _1298 = _1296 + _1294;
    float _1300 = _1016 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1302 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1304 = fma(_1240, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1302);
    float _1306 = precise::clamp(_1304, 0.0, 1.0);
    float _1308 = _1016 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1310 = rsqrt(_1298);
    float _1312 = fma(_1018, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1300);
    float _1314 = -_1306;
    float _1316 = _1314 + 1.0;
    float _1318 = fma(_1018, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1308);
    float _1320 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1322 = fma(_1020, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1312);
    float _1324 = _1016 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1326 = _1016 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1328 = fma(_1020, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1318);
    float _1330 = _1322 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1332 = fma(_1018, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1324);
    float _1334 = fma(_1018, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1326);
    float _1336 = _1328 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1338 = _1330 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1340 = fma(_1020, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1332);
    float _1342 = fma(_1020, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1334);
    float _1344 = abs(_1316);
    float _1346 = log2(_1344);
    float _1348 = _1310 * _1270;
    float _1350 = -_1338;
    float _1352 = fma(_1350, _1320, 1.0);
    float _1354 = _1340 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1356 = _1336 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1358 = _1342 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1360 = _1310 * _1282;
    float _1362 = _1348 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1364 = fma(_1354, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1356);
    float _1366 = _1310 * _1278;
    float _1368 = log2(_1352);
    float _1370 = -_1362;
    float _1372 = fma(_1360, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1370);
    float _1374 = fma(_1330, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1364);
    float _1376 = _1336 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1378 = _1360 + 1.0;
    float _1380 = -_1366;
    float _1382 = fma(_1380, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1372);
    float _1384 = fma(_1358, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1374);
    float _1386 = _1346 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1388 = _1336 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1390 = fma(_1382, -0.5, 0.5);
    float _1392 = 1.0 / _1384;
    float _1394 = fma(_1382, 0.5, 0.5);
    float _1396 = fma(_1354, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1388);
    float _1398 = fma(_1354, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1376);
    float _1400 = fma(_1330, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1396);
    float _1402 = fma(_1394, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1404 = exp2(_1386);
    float _1406 = fma(_1330, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1398);
    float _1408 = fma(_1358, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1400);
    float _1410 = fma(_1394, _1402, -0.212114393711090087890625);
    float _1412 = _1368 * 0.693147182464599609375;
    float _1414 = fma(_1358, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1406);
    float _1416 = fma(_1394, _1410, 1.570728778839111328125);
    float _1418 = sqrt(_1390);
    float _1420 = _1408 * _1392;
    float _1422 = _1414 * _1392;
    float _1424 = _1412 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1426 = fma(_1420, 0.5, 0.5);
    float _1428 = fma(_1422, -0.5, 0.5);
    float _1430 = -_1360;
    float _1432 = fma(_1404, _1378, _1430);
    float3 _3730 = float3(_1426, _1428, _1424);
    float _1434 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3730, float3(0.0), isnan(_3730)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3730, float3(0.0), isnan(_3730)), level(0.0)).x;
    float _1436 = fma(_1432, 0.5, 0.5);
    float _1438 = _1418 * 0.636619746685028076171875;
    float _1440 = -_1416;
    float _1442 = fma(_1438, _1440, 1.0);
    float3 _3751 = float3(_1426, _1428, _1424);
    float4 _1445 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3751, float3(0.0), isnan(_3751)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3751, float3(0.0), isnan(_3751)), level(0.0)).xyzw;
    float _1447 = _1445.x;
    float _1449 = _1445.y;
    float _1451 = _1445.z;
    float _1453 = _1445.w;
    float2 _3768 = float2(_1442, _1436);
    float3 _1457 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3768, float2(0.0), isnan(_3768)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3768, float2(0.0), isnan(_3768)), level(0.0)).xyz;
    float _1459 = _1457.x;
    float _1461 = _1457.y;
    float _1463 = _1457.z;
    float _1465 = _1346 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1467 = _1336 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _1469 = _1080 > 0.0;
    bool _1471 = isnan(_1080);
    bool _1473 = _1469 || _1471;
    bool _1475 = isnan(0.0);
    bool _1477 = _1473 || _1475;
    float _1479 = _1080 * _1134;
    float _1481 = fma(_1354, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1467);
    float _1483 = exp2(_1465);
    bool _1485 = _1134 <= 0.0;
    bool _1487 = !_1477;
    bool _1489 = _1485 || _1487;
    float _1491 = fma(_1330, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1481);
    float _1493 = _1479 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1495 = fma(_1358, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1491);
    float _1497 = _1493 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1499 = _1495 + _1384;
    out.gl_Position.x = _1408;
    out.gl_Position.y = _1414;
    out.gl_Position.z = _1495;
    out.gl_Position.w = _1384;
    float _1501 = _1499 * 0.5;
    float _1503 = -_1483;
    float _1505 = _1503 + 1.0;
    out.m_47.x = _1497;
    float _1507 = _1505 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_64.z = _1501;
    out.m_64.w = _1384;
    float _1509 = _1507 * _1434;
    float _1511 = -_1507;
    float _1513 = _1511 + 1.0;
    float _1515 = _1453 * _1509;
    float _1517 = _1463 * _1509;
    float _1519 = fma(_1459, _1515, _1447);
    float _1521 = fma(_1461, _1515, _1449);
    float _1523 = _1453 * _1513;
    float _1525 = fma(_1453, _1517, _1451);
    out.m_66.x = _1519;
    out.m_66.y = _1521;
    out.m_66.z = _1525;
    out.m_66.w = _1523;
    if (!_1489)
    {
        return out;
    }
    out.m_47.x = 0.0;
    float _1527 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1527;
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
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    bool _844 = false;
    bool _369 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _80 = in.m_44.w;
    float _82 = trunc(_80);
    int _85 = int(_82);
    bool _89 = _85 >= 1;
    float _91 = 0.0;
    if (!_89)
    {
        _91 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _93 = _91;
    float _95 = _93;
    if (!_89)
    {
        out.m_47.x = 0.0;
    }
    int _97 = 0;
    if (!_89)
    {
        float _99 = _93 * 5.0;
        _97 = as_type<int>(_99);
    }
    int _101 = _97;
    int _103 = _101;
    if (!_89)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1584 = as_type<float>(_101);
        out.gl_Position.z = _1584;
    }
    if (!_89)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _105 = in.m_49.w;
    bool _107 = _105 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _109 = isnan(_105);
    bool _111 = _107 || _109;
    bool _113 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _115 = _111 || _113;
    float _117 = -_105;
    float _119 = _117 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _121 = 0.0;
    if (_115)
    {
        float _123 = float(_85);
        _121 = _123;
    }
    float _125 = _121;
    bool _127 = _119 >= _125;
    bool _129 = !_115;
    bool _131 = _127 || _129;
    if (_131)
    {
        _95 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _133 = _95;
    if (_131)
    {
        out.m_47.x = 0.0;
    }
    if (_131)
    {
        float _135 = _133 * 5.0;
        _103 = as_type<int>(_135);
    }
    int _137 = _103;
    if (_131)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1652 = as_type<float>(_137);
        out.gl_Position.z = _1652;
    }
    if (_131)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _139 = in.m_51.x;
    float _141 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _143 = _119 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _145 = _119 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _147 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _149 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _151 = _147 || _149;
    bool _153 = isnan(1.0);
    bool _155 = _151 || _153;
    int _157 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _159 = _157 != 0;
    float _161 = _143 * _141;
    float _163 = 0.0;
    float _165 = _145;
    if (!_155)
    {
        float _167 = _145 * _145;
        float _169 = _167 * 0.5;
        _163 = _169;
    }
    float _171 = _163;
    float _173 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[20].x, _161);
    float _175 = _171;
    if (!_155)
    {
        float _177 = _171 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _175 = _177;
    }
    float _179 = _175;
    float _181 = in.m_49.x;
    float _183 = in.m_49.y;
    float _185 = in.m_49.z;
    float _187 = _173 * 6.283185482025146484375;
    float _189 = floor(_173);
    float _191 = _187 * 0.15915493667125701904296875;
    float _193 = _191 * 6.283185482025146484375;
    float _195 = cos(_193);
    float _197 = -_189;
    float _199 = _173 + _197;
    bool _201 = !_155;
    float _203 = _179;
    if (!_201)
    {
        float _205 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _207 = log2(_205);
        float _209 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _211 = _209 + 1.0;
        float _213 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _215 = _145 * _207;
        float _217 = 1.0 / _211;
        float _219 = _213 * 0.693147182464599609375;
        float _221 = exp2(_215);
        float _223 = 1.0 / _219;
        float _225 = _221 + (-1.0);
        float _227 = -_225;
        float _229 = fma(_227, _223, _145);
        float _231 = _229 * _217;
        float _233 = _231 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _203 = _233;
    }
    float _235 = _203;
    bool _237 = !_155;
    if (!_237)
    {
        float _239 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _241 = log2(_239);
        float _243 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _245 = _243 + 1.0;
        float _247 = 1.0 / _245;
        float _249 = _145 * _241;
        float _251 = exp2(_249);
        float _253 = -_251;
        float _255 = _253 + 1.0;
        float _257 = _255 * _247;
        _165 = _257;
    }
    float _259 = _165;
    float _261 = in.m_53.w;
    int _263 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _265 = _263 != 0;
    int _267 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _269 = _267 != 0;
    float _271 = -_199;
    float _273 = fma(_271, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _275 = _199 < 0.5;
    float _277 = float(_275);
    float _279 = fma(_195, 0.5, 0.5);
    float _281 = in.m_44.x;
    float _283 = in.m_44.y;
    float _285 = in.m_44.z;
    bool _287 = !_265;
    int _289 = _287 ? 0 : 1;
    float _291 = _235 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _293 = -_277;
    float _295 = fma(_293, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _297 = -_279;
    float _299 = fma(_297, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _301 = abs(_289);
    float _303 = fma(_259, _181, _291);
    bool _305 = !_159;
    int _307 = _305 ? 0 : 1;
    float _309 = _235 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _311 = !_269;
    int _313 = _311 ? 0 : 1;
    float _315 = _235 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    bool _317 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _319 = fma(_259, _183, _309);
    int _321 = abs(_307);
    float _323 = fma(_259, _185, _315);
    int _325 = abs(_313);
    float _327 = float(_301);
    float _329 = float(_321);
    float _331 = abs(_273);
    float _333 = _327 * _331;
    float _335 = fma(_303, _261, _281);
    float _337 = float(_325);
    float _339 = fma(_329, _299, _333);
    float _341 = fma(_319, _261, _283);
    float _343 = fma(_323, _261, _285);
    float _345 = abs(_295);
    float _347 = fma(_337, _345, _339);
    bool _349 = !_317;
    float _351 = _335;
    float _367;
    if (!_349)
    {
        float _353 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _355 = _139 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _357 = fma(_355, (*spvDescriptorSet0.vp_c9)._m0[12].x, _119);
        float _359 = _357 * _353;
        float _361 = floor(_359);
        float _363 = -_361;
        float _365 = _359 + _363;
        _367 = _365;
        _369 = true;
    }
    else
    {
        float _371 = float(_85);
        float _373 = 1.0 / _371;
        float _375 = _119 * _373;
        _367 = _375;
    }
    _369 = false;
    float _377 = _367;
    float _379 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _381 = _377 + _379;
    float _383 = as_type<float>(int(gl_VertexIndex));
    bool _385 = _377 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _387 = isnan(_377);
    bool _389 = _385 || _387;
    bool _391 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _393 = _389 || _391;
    float _395 = float(_393);
    float _397 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _399 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _397;
    bool _401 = _377 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _403 = isnan(_377);
    bool _405 = _401 || _403;
    bool _407 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _409 = _405 || _407;
    float _411 = float(_409);
    float _413 = 1.0 / _399;
    float _415 = -_395;
    float _417 = _415 + 1.0;
    float _419 = -(*spvDescriptorSet0.vp_c9)._m0[192].y;
    float _421 = (*spvDescriptorSet0.vp_c10)._m0[8].w + _419;
    float _423 = -_421;
    float _425 = _423 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _427 = -(*spvDescriptorSet0.vp_c9)._m0[192].z;
    float _429 = (*spvDescriptorSet0.vp_c10)._m0[9].w + _427;
    float _431 = in.m_53.x;
    float _433 = in.m_53.y;
    float _435 = -_429;
    float _437 = _435 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _439 = _381 * _413;
    float _441 = _437 * _437;
    int _443 = as_type<int>(_383) & 1;
    bool _445 = _443 != 0;
    int _447 = as_type<int>(_383) & 2;
    bool _449 = _447 != 0;
    float _451 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _453 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _451;
    float _455 = fma(_425, _425, _441);
    float _457 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _459 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _457;
    float _461 = fma(_453, _439, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _463 = -(*spvDescriptorSet0.vp_c9)._m0[192].w;
    float _465 = (*spvDescriptorSet0.vp_c10)._m0[10].w + _463;
    float _467 = fma(_459, _439, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _469 = _411 * _417;
    float _471 = -_411;
    float _473 = _471 + 1.0;
    float _475 = -_465;
    float _477 = _475 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _479 = _467 * _469;
    float _481 = _461 * _469;
    float _483 = fma(_477, _477, _455);
    float _485 = fma(_473, (*spvDescriptorSet0.vp_c9)._m0[143].x, _479);
    float _487 = fma(_473, (*spvDescriptorSet0.vp_c9)._m0[143].y, _481);
    float _489 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _491 = fma(_395, (*spvDescriptorSet0.vp_c9)._m0[144].x, _485);
    float _493 = fma(_395, (*spvDescriptorSet0.vp_c9)._m0[144].y, _487);
    float _495 = sqrt(_483);
    float _497 = _489 * _139;
    float _499 = _491 * _431;
    float _501 = _493 * _433;
    bool _503 = !_449;
    float _505 = _503 ? (-0.5) : 0.5;
    bool _507 = !_445;
    float _509 = _507 ? (-0.5) : 0.5;
    float _511 = _347 * _501;
    float _513 = _347 * _499;
    float _515 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _505);
    float _517 = trunc(_497);
    int _519 = int(_517);
    float _521 = _511 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _523 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _509);
    float _525 = _513 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _527 = _521 * _515;
    float _529 = fma(_495, 0.0068421051837503910064697265625, 0.3157894611358642578125);
    float _531 = _525 * _523;
    float _533 = _341 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _535 = _341 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _537 = _527 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _539 = _527 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _541 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _543 = fma(_335, (*spvDescriptorSet0.vp_c10)._m0[4].x, _533);
    float _545 = fma(_335, (*spvDescriptorSet0.vp_c10)._m0[6].x, _535);
    float _547 = fma(_531, (*spvDescriptorSet0.vp_c8)._m0[24].x, _537);
    float _549 = fma(_531, (*spvDescriptorSet0.vp_c8)._m0[26].x, _539);
    float _551 = fma(_343, (*spvDescriptorSet0.vp_c10)._m0[4].z, _543);
    float _553 = fma(_343, (*spvDescriptorSet0.vp_c10)._m0[6].z, _545);
    float _555 = fma(_541, (*spvDescriptorSet0.vp_c8)._m0[24].z, _547);
    float _557 = fma(_541, (*spvDescriptorSet0.vp_c8)._m0[26].z, _549);
    float _559 = _551 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _561 = _553 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _563 = _555 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _565 = _557 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _567 = precise::max(_529, 0.3499999940395355224609375);
    float _569 = _341 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _571 = _559 + _563;
    float _573 = _561 + _565;
    float _575 = precise::min(_567, 1.0);
    float _577 = _527 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _579 = -_421;
    float _581 = _571 + _579;
    float _583 = -_465;
    float _585 = _573 + _583;
    int _587 = _519 << 4;
    int _589 = _587 + 1968;
    float _591 = fma(_335, (*spvDescriptorSet0.vp_c10)._m0[5].x, _569);
    float _593 = fma(_581, _575, _421);
    float _595 = fma(_585, _575, _465);
    int _597 = _589 + 8;
    uint _600 = uint(int(uint(_597) >> uint(2)));
    uint _602 = uint(int(uint(int(_600)) >> uint(2)));
    int _604 = int(_600) & 3;
    float _606 = (*spvDescriptorSet0.vp_c9)._m0[int(_602)][_604];
    float _608 = fma(_531, (*spvDescriptorSet0.vp_c8)._m0[25].x, _577);
    float _610 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _612 = _593 + _610;
    float _614 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _616 = _595 + _614;
    float _618 = fma(_343, (*spvDescriptorSet0.vp_c10)._m0[5].z, _591);
    float _620 = fma(_541, (*spvDescriptorSet0.vp_c8)._m0[25].z, _608);
    float _622 = _612 * _612;
    float _624 = _616 * _616;
    uint _626 = uint(int(uint(_589) >> uint(2)));
    uint _628 = uint(int(uint(int(_626)) >> uint(2)));
    int _630 = int(_626) & 3;
    float _632 = (*spvDescriptorSet0.vp_c9)._m0[int(_628)][_630];
    int _634 = int(_626) + 1;
    uint _636 = uint(int(uint(_634) >> uint(2)));
    int _638 = _634 & 3;
    float _640 = (*spvDescriptorSet0.vp_c9)._m0[int(_636)][_638];
    float _642 = _618 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _644 = _620 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _646 = _622 + _624;
    float _648 = _642 + _644;
    float _650 = sqrt(_646);
    float _652 = -_429;
    float _654 = _648 + _652;
    float _656 = fma(_654, _575, _429);
    bool _658 = _650 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _660 = _654;
    float _662 = _618;
    float _664 = _429;
    float _666 = _593;
    float _668 = _505;
    float _670 = _559;
    if (!_658)
    {
        _660 = _593;
    }
    float _672 = _660;
    float _674 = _672;
    if (!_658)
    {
        _662 = _624;
    }
    float _676 = _662;
    float _678 = _676;
    if (!_658)
    {
        _351 = _622;
    }
    float _680 = _351;
    float _682 = _680;
    if (!_658)
    {
        _664 = _595;
    }
    float _684 = _664;
    float _686 = _684;
    if (!_658)
    {
        _666 = _656;
    }
    float _688 = _666;
    bool _690 = !_658;
    float _692 = _688;
    if (!_690)
    {
        float _694 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _696 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _698 = _650 + _696;
        float _700 = _656 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _702 = rsqrt(_646);
        float _704 = _698 * _694;
        float _706 = _704 * 0.15915493667125701904296875;
        float _708 = _706 * 6.283185482025146484375;
        float _710 = sin(_708);
        float _712 = _706 * 6.283185482025146484375;
        float _714 = cos(_712);
        float _716 = fma(_710, _700, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _718 = _702 * _716;
        float _720 = _714 + (-1.0);
        float _722 = fma(_612, _718, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _724 = fma(_616, _718, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _726 = _720 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _728 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _730 = _722 + _728;
        float _732 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _734 = _724 + _732;
        float _736 = fma(_656, _714, _726);
        float _738 = _730 * _730;
        float _740 = _734 * _734;
        _692 = _736;
        _682 = _738;
        _678 = _740;
        _674 = _722;
        _686 = _724;
    }
    float _742 = _692;
    float _744 = _682;
    float _746 = _678;
    float _748 = _674;
    float _750 = _686;
    float _752 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _754 = _742 + _752;
    float _756 = _509 + 0.5;
    float _758 = fma(_754, _754, _744);
    float _760 = _632 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _762 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _764 = _758 + _746;
    float _766 = _640 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _768 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _770 = _606 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _772 = sqrt(_764);
    float _774 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _776 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _778 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _780 = _768 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _782 = _774 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _784 = _762 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _786 = -_505;
    float _788 = _786 + 0.5;
    float _790 = _760 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _792 = _766 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _794 = _770 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_58.x = _780;
    out.m_58.y = _782;
    out.m_58.z = _784;
    out.m_58.w = _776;
    out.m_60.x = _756;
    out.m_60.y = _788;
    bool _796 = _772 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _798 = isnan(_772);
    bool _800 = _796 || _798;
    bool _802 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _804 = _800 || _802;
    out.m_62.x = _790;
    out.m_62.y = _792;
    out.m_62.z = _794;
    out.m_62.w = _778;
    float _806 = _750;
    float _808 = _756;
    if (!_804)
    {
        _668 = 1.0;
    }
    float _810 = _668;
    bool _812 = !_804;
    float _814 = _810;
    if (!_812)
    {
        bool _816 = _772 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _818 = isnan(_772);
        bool _820 = _816 || _818;
        bool _822 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _824 = _820 || _822;
        if (!_824)
        {
            float _826 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _828 = _772 + _826;
            float _830 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _832 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _830;
            float _834 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _836 = _834 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _838 = 1.0 / _832;
            float _840 = _828 * _838;
            float _842 = fma(_840, _836, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _814 = _842;
            _844 = true;
        }
        else
        {
            bool _846 = _772 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _848 = isnan(_772);
            bool _850 = _846 || _848;
            bool _852 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _854 = _850 || _852;
            if (!_854)
            {
                float _856 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _858 = _772 + _856;
                float _860 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _862 = _860 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _864 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _866 = _864 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _868 = 1.0 / _862;
                float _870 = _858 * _868;
                float _872 = fma(_870, _866, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _814 = _872;
                _844 = true;
            }
            else
            {
                _814 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _844 = false;
    float _874 = _814;
    float _876 = _642 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _878 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _880 = _748 + _878;
    float _882 = fma(_559, (*spvDescriptorSet0.vp_c8)._m0[11].x, _876);
    float _884 = fma(_880, _874, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    bool _886 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _888 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _890 = _886 || _888;
    bool _892 = isnan(0.5);
    bool _894 = _890 || _892;
    float _896 = fma(_561, (*spvDescriptorSet0.vp_c8)._m0[11].z, _882);
    float _898 = _642 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _900 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _902 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _904 = _900 || _902;
    bool _906 = isnan(0.5);
    bool _908 = _904 || _906;
    float _910 = _896 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _912 = fma(_559, (*spvDescriptorSet0.vp_c8)._m0[10].x, _898);
    float _914 = 1.0 / _910;
    float _916 = fma(_561, (*spvDescriptorSet0.vp_c8)._m0[10].z, _912);
    float _918 = _916 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _920 = _918 + _910;
    float _922 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _924 = _742 + _922;
    float _926 = _920 * _914;
    float _928 = _926 * 0.5;
    float _930 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _932 = _750 + _930;
    float _934 = _928;
    float _936 = _924;
    float _938 = _874;
    if (_908)
    {
        _806 = 1.0;
    }
    float _940 = _806;
    float _942 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _944 = fma(_928, (*spvDescriptorSet0.vp_c8)._m0[30].w, _942);
    float _946 = fma(_924, _874, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _948 = fma(_932, _874, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _950 = _940;
    if (_894)
    {
        _934 = _884;
    }
    float _952 = _934;
    float _954 = 1.0 / _944;
    float _956 = _952;
    if (_894)
    {
        _936 = _946;
    }
    float _958 = _936;
    float _960 = _958;
    if (_894)
    {
        _938 = _948;
    }
    float _962 = _938;
    float _964 = _962;
    if (!_894)
    {
        float _966 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _968 = _642 + _966;
        float _970 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _972 = _559 + _970;
        float _974 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _976 = _968 * _968;
        float _978 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _980 = _561 + _978;
        float _982 = fma(_972, _972, _976);
        float _984 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _986 = fma(_980, _980, _982);
        float _988 = sqrt(_986);
        float _990 = _974 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _992 = precise::min(_988, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _994 = _992 * _984;
        float _996 = -_559;
        float _998 = _996 + _884;
        float _1000 = _990 * _994;
        float _1002 = -_642;
        float _1004 = _1002 + _946;
        float _1006 = -_561;
        float _1008 = _1006 + _948;
        float _1010 = fma(_998, _1000, _559);
        float _1012 = fma(_1004, _1000, _642);
        float _1014 = fma(_1008, _1000, _561);
        _960 = _1012;
        _956 = _1010;
        _964 = _1014;
    }
    float _1016 = _960;
    float _1018 = _956;
    float _1020 = _964;
    if (_908)
    {
        _670 = 1.0;
    }
    float _1022 = _670;
    float _1024 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1026 = _954 * _1024;
    float _1028 = _1022;
    float _1030 = _1026;
    if (!_908)
    {
        float _1032 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1034 = _1032 * 0.15915493667125701904296875;
        float _1036 = _1034 * 6.283185482025146484375;
        float _1038 = cos(_1036);
        float _1040 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1042 = _1040 * 0.15915493667125701904296875;
        float _1044 = _1034 * 6.283185482025146484375;
        float _1046 = sin(_1044);
        float _1048 = 1.0 / _1038;
        float _1050 = _1042 * 6.283185482025146484375;
        float _1052 = cos(_1050);
        float _1054 = _1046 * _1048;
        float _1056 = _1042 * 6.283185482025146484375;
        float _1058 = sin(_1056);
        float _1060 = _1052 * _1054;
        float _1062 = 1.0 / _1060;
        float _1064 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1066 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1064;
        float _1068 = 1.0 / _1066;
        float _1070 = _1058 * _1062;
        float _1072 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1074 = fma(_1026, _1070, _1072);
        float _1076 = _1074 * _1068;
        float _1078 = precise::clamp(_1076, 0.0, 1.0);
        _950 = _1078;
    }
    float _1080 = _950;
    if (!_908)
    {
        float _1082 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1084 = _1082 * 0.15915493667125701904296875;
        float _1086 = _1084 * 6.283185482025146484375;
        float _1088 = cos(_1086);
        float _1090 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1092 = _1090 * 0.15915493667125701904296875;
        float _1094 = _1084 * 6.283185482025146484375;
        float _1096 = sin(_1094);
        float _1098 = 1.0 / _1088;
        float _1100 = _1092 * 6.283185482025146484375;
        float _1102 = cos(_1100);
        float _1104 = _1096 * _1098;
        float _1106 = _1092 * 6.283185482025146484375;
        float _1108 = sin(_1106);
        float _1110 = _1102 * _1104;
        float _1112 = 1.0 / _1110;
        float _1114 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1116 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1114;
        float _1118 = 1.0 / _1116;
        float _1120 = _1108 * _1112;
        float _1122 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1124 = fma(_1026, _1120, _1122);
        float _1126 = _1124 * _1118;
        float _1128 = precise::clamp(_1126, 0.0, 1.0);
        float _1130 = -_1128;
        float _1132 = _1130 + 1.0;
        _1028 = _1132;
    }
    float _1134 = _1028;
    float _1136 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1138 = _1016 + _1136;
    float _1140 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1142 = _1018 + _1140;
    float _1144 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1146 = _1020 + _1144;
    float _1148 = _1138 * _1138;
    float _1150 = fma(_1142, _1142, _1148);
    float _1152 = fma(_1146, _1146, _1150);
    float _1154 = rsqrt(_1152);
    float _1156 = _1154 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1158 = _1142 * _1156;
    float _1160 = _1146 * _1156;
    float _1162 = _1158 * _1158;
    float _1164 = _1160 * _1160;
    float _1166 = _1162 + _1164;
    float _1168 = sqrt(_1166);
    bool _1170 = _1168 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1172 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1174 = _1168 + _1172;
    float _1176 = _1154;
    float _1178 = _1166;
    float _1180 = _1174;
    float _1182 = _1138;
    float _1184 = _1158;
    if (_1170)
    {
        float _1186 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1176 = _1186;
    }
    float _1188 = _1176;
    if (_1170)
    {
        float _1190 = rsqrt(_1166);
        _1178 = _1190;
    }
    float _1192 = _1178;
    if (_1170)
    {
        float _1194 = _1174 * _1188;
        _1180 = _1194;
    }
    float _1196 = _1180;
    if (_1170)
    {
        float _1198 = _1196 * 0.15915493667125701904296875;
        _1030 = _1198;
    }
    float _1200 = _1030;
    float _1202 = _1188;
    if (_1170)
    {
        float _1204 = _1200 * 6.283185482025146484375;
        float _1206 = sin(_1204);
        _1202 = _1206;
    }
    float _1208 = _1202;
    float _1210 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1212 = precise::max(0.0, _1210);
    float _1214 = _1146;
    float _1216 = _1212;
    if (_1170)
    {
        float _1218 = _1200 * 6.283185482025146484375;
        float _1220 = cos(_1218);
        _1214 = _1220;
    }
    float _1222 = _1214;
    float _1224 = -_1156;
    float _1226 = -_1212;
    float _1228 = fma(_1138, _1224, _1226);
    float _1230 = _1228;
    if (!_1170)
    {
        _1182 = _1160;
    }
    float _1232 = _1182;
    float _1234 = _1232;
    if (_1170)
    {
        float _1236 = _1228 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1216 = _1236;
    }
    float _1238 = _1216;
    float _1240 = sqrt(_1152);
    float _1242 = _1208;
    float _1244 = _1238;
    if (_1170)
    {
        float _1246 = fma(_1208, _1238, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1242 = _1246;
    }
    float _1248 = _1242;
    float _1250 = _1248;
    float _1252 = _1222;
    if (_1170)
    {
        float _1254 = _1222 + (-1.0);
        _1244 = _1254;
    }
    float _1256 = _1244;
    float _1258 = _1256;
    if (_1170)
    {
        float _1260 = _1192 * _1248;
        _808 = _1260;
    }
    float _1262 = _808;
    if (_1170)
    {
        float _1264 = _1256 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1250 = _1264;
    }
    float _1266 = _1250;
    if (_1170)
    {
        float _1268 = _1158 * _1262;
        _1184 = _1268;
    }
    float _1270 = _1184;
    if (!_1170)
    {
        _1258 = _1162;
    }
    float _1272 = _1258;
    float _1274 = _1272;
    if (_1170)
    {
        float _1276 = _1160 * _1262;
        _1234 = _1276;
    }
    float _1278 = _1234;
    if (_1170)
    {
        float _1280 = fma(_1228, _1222, _1266);
        _1230 = _1280;
    }
    float _1282 = _1230;
    if (_1170)
    {
        float _1284 = _1270 * _1270;
        _1274 = _1284;
    }
    float _1286 = _1274;
    if (!_1170)
    {
        _1252 = _1164;
    }
    float _1288 = _1252;
    float _1290 = _1288;
    if (_1170)
    {
        float _1292 = _1278 * _1278;
        _1290 = _1292;
    }
    float _1294 = _1290;
    float _1296 = fma(_1282, _1282, _1286);
    float _1298 = _1296 + _1294;
    float _1300 = _1016 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1302 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1304 = fma(_1240, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1302);
    float _1306 = precise::clamp(_1304, 0.0, 1.0);
    float _1308 = _1016 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1310 = rsqrt(_1298);
    float _1312 = fma(_1018, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1300);
    float _1314 = -_1306;
    float _1316 = _1314 + 1.0;
    float _1318 = fma(_1018, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1308);
    float _1320 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1322 = fma(_1020, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1312);
    float _1324 = _1016 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1326 = _1016 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1328 = fma(_1020, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1318);
    float _1330 = _1322 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1332 = fma(_1018, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1324);
    float _1334 = fma(_1018, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1326);
    float _1336 = _1328 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1338 = _1330 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1340 = fma(_1020, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1332);
    float _1342 = fma(_1020, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1334);
    float _1344 = abs(_1316);
    float _1346 = log2(_1344);
    float _1348 = _1310 * _1270;
    float _1350 = -_1338;
    float _1352 = fma(_1350, _1320, 1.0);
    float _1354 = _1340 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1356 = _1336 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1358 = _1342 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1360 = _1310 * _1282;
    float _1362 = _1348 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1364 = fma(_1354, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1356);
    float _1366 = _1310 * _1278;
    float _1368 = log2(_1352);
    float _1370 = -_1362;
    float _1372 = fma(_1360, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1370);
    float _1374 = fma(_1330, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1364);
    float _1376 = _1336 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1378 = _1360 + 1.0;
    float _1380 = -_1366;
    float _1382 = fma(_1380, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1372);
    float _1384 = fma(_1358, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1374);
    float _1386 = _1346 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1388 = _1336 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1390 = fma(_1382, -0.5, 0.5);
    float _1392 = 1.0 / _1384;
    float _1394 = fma(_1382, 0.5, 0.5);
    float _1396 = fma(_1354, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1388);
    float _1398 = fma(_1354, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1376);
    float _1400 = fma(_1330, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1396);
    float _1402 = fma(_1394, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1404 = exp2(_1386);
    float _1406 = fma(_1330, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1398);
    float _1408 = fma(_1358, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1400);
    float _1410 = fma(_1394, _1402, -0.212114393711090087890625);
    float _1412 = _1368 * 0.693147182464599609375;
    float _1414 = fma(_1358, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1406);
    float _1416 = fma(_1394, _1410, 1.570728778839111328125);
    float _1418 = sqrt(_1390);
    float _1420 = _1408 * _1392;
    float _1422 = _1414 * _1392;
    float _1424 = _1412 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1426 = fma(_1420, 0.5, 0.5);
    float _1428 = fma(_1422, -0.5, 0.5);
    float _1430 = -_1360;
    float _1432 = fma(_1404, _1378, _1430);
    float3 _3730 = float3(_1426, _1428, _1424);
    float _1434 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3730, float3(0.0), isnan(_3730)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3730, float3(0.0), isnan(_3730)), level(0.0)).x;
    float _1436 = fma(_1432, 0.5, 0.5);
    float _1438 = _1418 * 0.636619746685028076171875;
    float _1440 = -_1416;
    float _1442 = fma(_1438, _1440, 1.0);
    float3 _3751 = float3(_1426, _1428, _1424);
    float4 _1445 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3751, float3(0.0), isnan(_3751)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3751, float3(0.0), isnan(_3751)), level(0.0)).xyzw;
    float _1447 = _1445.x;
    float _1449 = _1445.y;
    float _1451 = _1445.z;
    float _1453 = _1445.w;
    float2 _3768 = float2(_1442, _1436);
    float3 _1457 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3768, float2(0.0), isnan(_3768)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3768, float2(0.0), isnan(_3768)), level(0.0)).xyz;
    float _1459 = _1457.x;
    float _1461 = _1457.y;
    float _1463 = _1457.z;
    float _1465 = _1346 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1467 = _1336 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _1469 = _1080 > 0.0;
    bool _1471 = isnan(_1080);
    bool _1473 = _1469 || _1471;
    bool _1475 = isnan(0.0);
    bool _1477 = _1473 || _1475;
    float _1479 = _1080 * _1134;
    float _1481 = fma(_1354, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1467);
    float _1483 = exp2(_1465);
    bool _1485 = _1134 <= 0.0;
    bool _1487 = !_1477;
    bool _1489 = _1485 || _1487;
    float _1491 = fma(_1330, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1481);
    float _1493 = _1479 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1495 = fma(_1358, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1491);
    float _1497 = _1493 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1499 = _1495 + _1384;
    out.gl_Position.x = _1408;
    out.gl_Position.y = _1414;
    out.gl_Position.z = _1495;
    out.gl_Position.w = _1384;
    float _1501 = _1499 * 0.5;
    float _1503 = -_1483;
    float _1505 = _1503 + 1.0;
    out.m_47.x = _1497;
    float _1507 = _1505 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_64.z = _1501;
    out.m_64.w = _1384;
    float _1509 = _1507 * _1434;
    float _1511 = -_1507;
    float _1513 = _1511 + 1.0;
    float _1515 = _1453 * _1509;
    float _1517 = _1463 * _1509;
    float _1519 = fma(_1459, _1515, _1447);
    float _1521 = fma(_1461, _1515, _1449);
    float _1523 = _1453 * _1513;
    float _1525 = fma(_1453, _1517, _1451);
    out.m_66.x = _1519;
    out.m_66.y = _1521;
    out.m_66.z = _1525;
    out.m_66.w = _1523;
    if (!_1489)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_47.x = 0.0;
    float _1527 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1527;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

