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
    float4 m_51 [[attribute(2)]];
    float4 m_42 [[attribute(3)]];
    float4 m_47 [[attribute(4)]];
    float4 m_49 [[attribute(5)]];
    float4 m_56 [[attribute(6)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    bool _373 = false;
    bool _273 = false;
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
        float _1439 = as_type<float>(_99);
        out.gl_Position.z = _1439;
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
    if (_113)
    {
        float _121 = float(_83);
        _119 = _121;
    }
    float _123 = _119;
    bool _125 = _117 >= _123;
    bool _127 = !_113;
    bool _129 = _125 || _127;
    if (_129)
    {
        _93 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _131 = _93;
    if (_129)
    {
        out.m_45.x = 0.0;
    }
    if (_129)
    {
        float _133 = _131 * 5.0;
        _101 = as_type<int>(_133);
    }
    int _135 = _101;
    if (_129)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1507 = as_type<float>(_135);
        out.gl_Position.z = _1507;
    }
    if (_129)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _137 = in.m_49.x;
    float _139 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _141 = _117 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _143 = in.m_51.x;
    float _145 = in.m_51.y;
    float _147 = in.m_51.z;
    float _149 = _141 * _139;
    int _151 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _153 = _151 != 0;
    float _155 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[20].x, _149);
    float _157 = floor(_155);
    float _159 = _155 * 6.283185482025146484375;
    int _161 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _163 = _161 != 0;
    int _165 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _167 = _165 != 0;
    float _169 = _145 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _171 = _145 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _173 = _159 * 0.15915493667125701904296875;
    float _175 = _145 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _177 = !_163;
    int _179 = _177 ? 0 : 1;
    float _181 = fma(_143, (*spvDescriptorSet0.vp_c10)._m0[4].x, _169);
    float _183 = fma(_143, (*spvDescriptorSet0.vp_c10)._m0[5].x, _171);
    bool _185 = !_167;
    int _187 = _185 ? 0 : 1;
    float _189 = _173 * 6.283185482025146484375;
    float _191 = cos(_189);
    float _193 = fma(_143, (*spvDescriptorSet0.vp_c10)._m0[6].x, _175);
    float _195 = fma(_147, (*spvDescriptorSet0.vp_c10)._m0[4].z, _181);
    int _197 = abs(_187);
    float _199 = -_157;
    float _201 = _155 + _199;
    int _203 = abs(_179);
    float _205 = fma(_147, (*spvDescriptorSet0.vp_c10)._m0[5].z, _183);
    bool _207 = !_153;
    int _209 = _207 ? 0 : 1;
    float _211 = -_201;
    float _213 = fma(_211, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _215 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _217 = fma(_147, (*spvDescriptorSet0.vp_c10)._m0[6].z, _193);
    int _219 = abs(_209);
    float _221 = float(_203);
    float _223 = fma(_191, 0.5, 0.5);
    bool _225 = _201 < 0.5;
    float _227 = float(_225);
    float _229 = abs(_213);
    float _231 = _221 * _229;
    float _233 = -_223;
    float _235 = fma(_233, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _237 = float(_219);
    float _239 = -_227;
    float _241 = fma(_239, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _243 = float(_197);
    float _245 = fma(_237, _235, _231);
    float _247 = abs(_241);
    float _249 = fma(_243, _247, _245);
    bool _251 = !_215;
    float _253 = _205;
    float _255 = _195;
    float _271;
    if (!_251)
    {
        float _257 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _259 = _137 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _261 = fma(_259, (*spvDescriptorSet0.vp_c9)._m0[12].x, _117);
        float _263 = _261 * _257;
        float _265 = floor(_263);
        float _267 = -_265;
        float _269 = _263 + _267;
        _271 = _269;
        _273 = true;
    }
    else
    {
        float _275 = float(_83);
        float _277 = 1.0 / _275;
        float _279 = _117 * _277;
        _271 = _279;
    }
    _273 = false;
    float _281 = _271;
    float _283 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _285 = _281 + _283;
    bool _287 = _281 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _289 = isnan(_281);
    bool _291 = _287 || _289;
    bool _293 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _295 = _291 || _293;
    float _297 = float(_295);
    float _299 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _301 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _299;
    float _303 = -_297;
    float _305 = _303 + 1.0;
    bool _307 = _281 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _309 = isnan(_281);
    bool _311 = _307 || _309;
    bool _313 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _315 = _311 || _313;
    float _317 = float(_315);
    float _319 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _321 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _319;
    bool _323 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _325 = 1.0 / _301;
    float _327 = _317 * _305;
    float _329 = -_317;
    float _331 = _329 + 1.0;
    float _333 = _285 * _325;
    float _335 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _337 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _335;
    float _339 = fma(_321, _333, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _341 = fma(_337, _333, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _343 = _339 * _327;
    float _345 = _341 * _327;
    float _347 = fma(_331, (*spvDescriptorSet0.vp_c9)._m0[143].x, _343);
    float _349 = fma(_331, (*spvDescriptorSet0.vp_c9)._m0[143].y, _345);
    float _351 = fma(_297, (*spvDescriptorSet0.vp_c9)._m0[144].x, _347);
    float _353 = fma(_297, (*spvDescriptorSet0.vp_c9)._m0[144].y, _349);
    bool _355 = !_323;
    float _371;
    if (!_355)
    {
        float _357 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _359 = _137 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _361 = fma(_359, (*spvDescriptorSet0.vp_c9)._m0[11].x, _117);
        float _363 = _361 * _357;
        float _365 = floor(_363);
        float _367 = -_365;
        float _369 = _363 + _367;
        _371 = _369;
        _373 = true;
    }
    else
    {
        float _375 = float(_83);
        float _377 = 1.0 / _375;
        float _379 = _117 * _377;
        _371 = _379;
    }
    _373 = false;
    float _381 = _371;
    float _383 = as_type<float>(int(gl_VertexIndex));
    float _385 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _387 = in.m_56.x;
    float _389 = in.m_56.y;
    float _391 = in.m_42.x;
    float _393 = in.m_42.y;
    float _395 = in.m_42.z;
    int _397 = as_type<int>(_383) & 1;
    bool _399 = _397 != 0;
    int _401 = as_type<int>(_383) & 2;
    bool _403 = _401 != 0;
    float _405 = _353 * _389;
    float _407 = _351 * _387;
    bool _409 = !_403;
    float _411 = _409 ? (-0.5) : 0.5;
    float _413 = _249 * _405;
    float _415 = _249 * _407;
    bool _417 = !_399;
    float _419 = _417 ? (-0.5) : 0.5;
    float _421 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _411);
    float _423 = _413 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _425 = _415 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _427 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _419);
    float _429 = _423 * _421;
    float _431 = _393 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _433 = _425 * _427;
    float _435 = _429 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _437 = _393 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _439 = fma(_391, (*spvDescriptorSet0.vp_c10)._m0[6].x, _431);
    float _441 = _429 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _443 = fma(_433, (*spvDescriptorSet0.vp_c8)._m0[26].x, _435);
    float _445 = fma(_391, (*spvDescriptorSet0.vp_c10)._m0[4].x, _437);
    float _447 = fma(_395, (*spvDescriptorSet0.vp_c10)._m0[6].z, _439);
    float _449 = fma(_433, (*spvDescriptorSet0.vp_c8)._m0[24].x, _441);
    float _451 = fma(_385, (*spvDescriptorSet0.vp_c8)._m0[26].z, _443);
    float _453 = fma(_395, (*spvDescriptorSet0.vp_c10)._m0[4].z, _445);
    float _455 = _447 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _457 = fma(_385, (*spvDescriptorSet0.vp_c8)._m0[24].z, _449);
    float _459 = _451 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _461 = _453 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _463 = _393 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _465 = _457 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _467 = _455 + _459;
    float _469 = fma(_391, (*spvDescriptorSet0.vp_c10)._m0[5].x, _463);
    float _471 = _461 + _465;
    float _473 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _475 = _467 + _473;
    float _477 = fma(_395, (*spvDescriptorSet0.vp_c10)._m0[5].z, _469);
    float _479 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _481 = _471 + _479;
    float _483 = _475 * _475;
    float _485 = _477 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _487 = fma(_481, _481, _483);
    float _489 = _429 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _491 = sqrt(_487);
    float _493 = fma(_433, (*spvDescriptorSet0.vp_c8)._m0[25].x, _489);
    float _495 = fma(_385, (*spvDescriptorSet0.vp_c8)._m0[25].z, _493);
    float _497 = _495 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _499 = _485 + _497;
    bool _501 = _491 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _503 = _495;
    float _505 = _385;
    float _507 = _469;
    float _509 = _487;
    if (!_501)
    {
        _503 = _471;
    }
    float _511 = _503;
    float _513 = _511;
    if (!_501)
    {
        _505 = _467;
    }
    float _515 = _505;
    float _517 = _515;
    if (!_501)
    {
        _507 = _499;
    }
    float _519 = _507;
    bool _521 = !_501;
    float _523 = _519;
    if (!_521)
    {
        float _525 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _527 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _529 = _491 + _527;
        float _531 = rsqrt(_487);
        float _533 = _529 * _525;
        float _535 = _499 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _537 = _533 * 0.15915493667125701904296875;
        float _539 = _537 * 6.283185482025146484375;
        float _541 = cos(_539);
        float _543 = _537 * 6.283185482025146484375;
        float _545 = sin(_543);
        float _547 = _541 + (-1.0);
        float _549 = fma(_545, _535, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _551 = _547 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _553 = _531 * _549;
        float _555 = fma(_499, _541, _551);
        float _557 = fma(_481, _553, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _559 = fma(_475, _553, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _523 = _555;
        _513 = _557;
        _517 = _559;
    }
    float _561 = _523;
    float _563 = _513;
    float _565 = _517;
    float _567 = -_485;
    float _569 = _567 + _561;
    float _571 = -_461;
    float _573 = _571 + _563;
    float _575 = -_455;
    float _577 = _575 + _565;
    float _579 = _485 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _581 = _569 * _569;
    bool _583 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _585 = isnan(0.5);
    bool _587 = _583 || _585;
    bool _589 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _591 = _587 || _589;
    float _593 = fma(_573, _573, _581);
    bool _595 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _597 = isnan(0.5);
    bool _599 = _595 || _597;
    bool _601 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _603 = _599 || _601;
    float _605 = fma(_577, _577, _593);
    float _607 = fma(_461, (*spvDescriptorSet0.vp_c8)._m0[11].x, _579);
    float _609 = _485 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _611 = sqrt(_605);
    float _613 = fma(_455, (*spvDescriptorSet0.vp_c8)._m0[11].z, _607);
    float _615 = _613 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _617 = fma(_461, (*spvDescriptorSet0.vp_c8)._m0[10].x, _609);
    float _619 = 1.0 / _615;
    float _621 = fma(_455, (*spvDescriptorSet0.vp_c8)._m0[10].z, _617);
    float _623 = _621 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _625 = _611 > 0.0;
    float _627 = _623 + _615;
    float _629 = _627 * _619;
    float _631 = _629 * 0.5;
    bool _633 = !_625;
    float _635 = _563;
    float _637 = _565;
    float _639 = _561;
    float _641 = _627;
    float _643 = _631;
    if (!_633)
    {
        float _645 = _205 * _205;
        float _647 = fma(_195, _195, _645);
        float _649 = fma(_217, _217, _647);
        float _651 = rsqrt(_605);
        float _653 = sqrt(_649);
        float _655 = _573 * _651;
        float _657 = _569 * _651;
        float _659 = _577 * _651;
        bool _661 = _653 > 0.0;
        bool _663 = !_661;
        _641 = _651;
        _509 = _659;
        if (!_663)
        {
            float _665 = rsqrt(_649);
            float _667 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _669 = _205 * _665;
            float _671 = _195 * _665;
            float _673 = _657 * _669;
            float _675 = _217 * _665;
            float _677 = fma(_655, _671, _673);
            float _679 = _667 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _681 = fma(_659, _675, _677);
            float _683 = _681 * _679;
            float _685 = fma(_195, _683, _563);
            float _687 = fma(_205, _683, _561);
            float _689 = fma(_217, _683, _565);
            _635 = _685;
            _637 = _689;
            _639 = _687;
            _641 = _671;
        }
    }
    float _691 = _635;
    float _693 = _637;
    float _695 = _639;
    float _697 = _641;
    float _699 = _509;
    float _701 = _697;
    float _703 = _695;
    float _705 = _691;
    float _707 = _699;
    if (_603)
    {
        _701 = 1.0;
    }
    float _709 = _701;
    float _711 = _709;
    if (_591)
    {
        _253 = _691;
    }
    float _713 = _253;
    float _715 = _713;
    if (_591)
    {
        _255 = _693;
    }
    float _717 = _255;
    float _719 = _717;
    if (!_591)
    {
        float _721 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _723 = _485 + _721;
        float _725 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _727 = _461 + _725;
        float _729 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _731 = -_461;
        float _733 = _731 + _691;
        float _735 = _723 * _723;
        float _737 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _739 = _455 + _737;
        float _741 = -_485;
        float _743 = _741 + _695;
        float _745 = -_455;
        float _747 = _745 + _693;
        float _749 = fma(_727, _727, _735);
        float _751 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _753 = fma(_739, _739, _749);
        float _755 = sqrt(_753);
        float _757 = _729 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _759 = precise::min(_755, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _761 = _759 * _751;
        float _763 = _757 * _761;
        float _765 = fma(_733, _763, _461);
        float _767 = fma(_743, _763, _485);
        float _769 = fma(_747, _763, _455);
        _703 = _767;
        _715 = _765;
        _719 = _769;
        _705 = _733;
    }
    float _771 = _703;
    float _773 = _715;
    float _775 = _719;
    float _777 = _705;
    float _779 = _777;
    if (!_603)
    {
        float _781 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _783 = _781 * 0.15915493667125701904296875;
        float _785 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _787 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _789 = fma(_631, (*spvDescriptorSet0.vp_c8)._m0[30].w, _787);
        float _791 = _783 * 6.283185482025146484375;
        float _793 = cos(_791);
        float _795 = _785 * 0.15915493667125701904296875;
        float _797 = _783 * 6.283185482025146484375;
        float _799 = sin(_797);
        float _801 = 1.0 / _793;
        float _803 = _795 * 6.283185482025146484375;
        float _805 = cos(_803);
        float _807 = _799 * _801;
        float _809 = _795 * 6.283185482025146484375;
        float _811 = sin(_809);
        float _813 = _805 * _807;
        float _815 = 1.0 / _789;
        float _817 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _819 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _817;
        float _821 = 1.0 / _813;
        float _823 = 1.0 / _819;
        float _825 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _827 = _815 * _825;
        float _829 = _811 * _821;
        float _831 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _833 = fma(_829, _827, _831);
        float _835 = _833 * _823;
        float _837 = precise::clamp(_835, 0.0, 1.0);
        _779 = _795;
        _643 = _815;
        _711 = _837;
    }
    float _839 = _779;
    float _841 = _643;
    float _843 = _711;
    float _845 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _847 = _771 + _845;
    float _849 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _851 = _773 + _849;
    float _853 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _855 = _775 + _853;
    float _857 = _847 * _847;
    float _859 = fma(_851, _851, _857);
    float _861 = fma(_855, _855, _859);
    float _863 = rsqrt(_861);
    float _865 = _863 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _867 = _851 * _865;
    float _869 = _855 * _865;
    float _871 = _867 * _867;
    float _873 = _869 * _869;
    float _875 = _871 + _873;
    float _877 = sqrt(_875);
    bool _879 = _877 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _881 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _883 = _877 + _881;
    float _885 = _855;
    float _887 = _857;
    float _889 = _883;
    float _891 = _839;
    float _893 = _847;
    if (_879)
    {
        float _895 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _885 = _895;
    }
    float _897 = _885;
    if (_879)
    {
        float _899 = rsqrt(_875);
        _887 = _899;
    }
    float _901 = _887;
    float _903 = _901;
    if (_879)
    {
        float _905 = _883 * _897;
        _889 = _905;
    }
    float _907 = _889;
    if (_879)
    {
        float _909 = _907 * 0.15915493667125701904296875;
        _891 = _909;
    }
    float _911 = _891;
    float _913 = _863;
    if (_879)
    {
        float _915 = _911 * 6.283185482025146484375;
        float _917 = sin(_915);
        _913 = _917;
    }
    float _919 = _913;
    float _921 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _923 = precise::max(0.0, _921);
    float _925 = _841;
    float _927 = _923;
    float _929 = _921;
    if (_879)
    {
        float _931 = _911 * 6.283185482025146484375;
        float _933 = cos(_931);
        _925 = _933;
    }
    float _935 = _925;
    float _937 = -_865;
    float _939 = -_923;
    float _941 = fma(_847, _937, _939);
    if (_879)
    {
        float _943 = _941 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _927 = _943;
    }
    float _945 = _927;
    float _947 = sqrt(_861);
    float _949 = _919;
    float _951 = _945;
    if (_879)
    {
        float _953 = fma(_919, _945, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _893 = _953;
    }
    float _955 = _893;
    float _957 = _955;
    if (!_879)
    {
        _949 = _867;
    }
    float _959 = _949;
    float _961 = _959;
    if (!_879)
    {
        _951 = _941;
    }
    float _963 = _951;
    float _965 = _963;
    float _967 = _935;
    if (_879)
    {
        float _969 = _935 + (-1.0);
        _929 = _969;
    }
    float _971 = _929;
    float _973 = _971;
    if (_879)
    {
        float _975 = _901 * _955;
        _707 = _975;
    }
    float _977 = _707;
    if (!_879)
    {
        _957 = _869;
    }
    float _979 = _957;
    float _981 = _979;
    if (_879)
    {
        float _983 = _971 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _903 = _983;
    }
    float _985 = _903;
    if (_879)
    {
        float _987 = _867 * _977;
        _961 = _987;
    }
    float _989 = _961;
    if (!_879)
    {
        _973 = _871;
    }
    float _991 = _973;
    float _993 = _991;
    if (_879)
    {
        float _995 = _869 * _977;
        _981 = _995;
    }
    float _997 = _981;
    if (_879)
    {
        float _999 = fma(_941, _935, _985);
        _965 = _999;
    }
    float _1001 = _965;
    if (_879)
    {
        float _1003 = _989 * _989;
        _993 = _1003;
    }
    float _1005 = _993;
    if (!_879)
    {
        _967 = _873;
    }
    float _1007 = _967;
    float _1009 = _1007;
    if (_879)
    {
        float _1011 = _997 * _997;
        _1009 = _1011;
    }
    float _1013 = _1009;
    float _1015 = fma(_1001, _1001, _1005);
    float _1017 = _771 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1019 = _771 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1021 = _1015 + _1013;
    float _1023 = fma(_773, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1017);
    float _1025 = _771 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1027 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1029 = fma(_947, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1027);
    float _1031 = precise::clamp(_1029, 0.0, 1.0);
    float _1033 = fma(_773, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1019);
    float _1035 = fma(_775, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1023);
    float _1037 = rsqrt(_1021);
    float _1039 = _771 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1041 = fma(_773, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1025);
    float _1043 = -_1031;
    float _1045 = _1043 + 1.0;
    float _1047 = _1035 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1049 = fma(_773, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1039);
    float _1051 = fma(_775, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1041);
    float _1053 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1055 = _1047 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1057 = fma(_775, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1049);
    float _1059 = _1051 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1061 = abs(_1045);
    float _1063 = log2(_1061);
    float _1065 = fma(_775, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1033);
    float _1067 = _1057 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1069 = _1059 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1071 = -_1055;
    float _1073 = fma(_1071, _1053, 1.0);
    float _1075 = _1037 * _989;
    float _1077 = _1037 * _997;
    float _1079 = fma(_1067, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1069);
    float _1081 = _1037 * _1001;
    float _1083 = _1075 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1085 = _1065 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1087 = fma(_1047, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1079);
    float _1089 = log2(_1073);
    float _1091 = -_1083;
    float _1093 = fma(_1081, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1091);
    float _1095 = _1059 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1097 = fma(_1085, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1087);
    float _1099 = _1063 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1101 = -_1077;
    float _1103 = fma(_1101, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1093);
    float _1105 = _1059 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1107 = 1.0 / _1097;
    float _1109 = fma(_1103, -0.5, 0.5);
    float _1111 = fma(_1067, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1105);
    float _1113 = fma(_1103, 0.5, 0.5);
    float _1115 = fma(_1067, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1095);
    float _1117 = _1081 + 1.0;
    float _1119 = fma(_1047, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1111);
    float _1121 = fma(_1113, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1123 = exp2(_1099);
    float _1125 = fma(_1047, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1115);
    float _1127 = fma(_1085, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1119);
    float _1129 = fma(_1113, _1121, -0.212114393711090087890625);
    float _1131 = fma(_1085, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1125);
    float _1133 = fma(_1113, _1129, 1.570728778839111328125);
    float _1135 = sqrt(_1109);
    float _1137 = _1127 * _1107;
    float _1139 = fma(_1137, 0.5, 0.5);
    float _1141 = -_1081;
    float _1143 = fma(_1123, _1117, _1141);
    float _1145 = _1089 * 0.693147182464599609375;
    float _1147 = _1131 * _1107;
    float _1149 = fma(_1143, 0.5, 0.5);
    float _1151 = _1145 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1153 = fma(_1147, -0.5, 0.5);
    float _1155 = _1135 * 0.636619746685028076171875;
    float _1157 = -_1133;
    float _1159 = fma(_1155, _1157, 1.0);
    float3 _3125 = float3(_1139, _1153, _1151);
    float _1161 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3125, float3(0.0), isnan(_3125)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3125, float3(0.0), isnan(_3125)), level(0.0)).x;
    float3 _3136 = float3(_1139, _1153, _1151);
    float4 _1164 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3136, float3(0.0), isnan(_3136)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3136, float3(0.0), isnan(_3136)), level(0.0)).xyzw;
    float _1166 = _1164.x;
    float _1168 = _1164.y;
    float _1170 = _1164.z;
    float _1172 = _1164.w;
    float2 _3153 = float2(_1159, _1149);
    float3 _1176 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3153, float2(0.0), isnan(_3153)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3153, float2(0.0), isnan(_3153)), level(0.0)).xyz;
    float _1178 = _1176.x;
    float _1180 = _1176.y;
    float _1182 = _1176.z;
    float _1184 = in.m_49.y;
    bool _1186 = _137 > 0.5;
    float _1188 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1190 = _381 + _1188;
    float _1192 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1194 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _1192;
    float _1196 = _1059 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1198 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _1200 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1202 = _1200 != 0;
    float _1204 = fma(_1067, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1196);
    int _1206 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1208 = _1206 != 0;
    float _1210 = 1.0 / _1194;
    float _1212 = fma(_1047, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1204);
    float _1214 = fma(_1085, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1212);
    float _1216 = _843 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1218 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1220 = _1184 > 0.5;
    float _1222 = _1216 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    bool _1224 = _381 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _1226 = isnan(_381);
    bool _1228 = _1224 || _1226;
    bool _1230 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _1232 = _1228 || _1230;
    float _1234 = float(_1232);
    float _1236 = -_411;
    int _1238 = _1220 ? as_type<int>(_1236) : as_type<int>(_411);
    float _1240 = _1190 * _1210;
    out.m_45.x = _1222;
    bool _1242 = _381 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _1244 = isnan(_381);
    bool _1246 = _1242 || _1244;
    bool _1248 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _1250 = _1246 || _1248;
    float _1252 = float(_1250);
    float _1254 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _1256 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _1254;
    bool _1258 = !_1202;
    float _1260 = _1258 ? _411 : as_type<float>(_1238);
    float _1262 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _1264 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _1262;
    float _1266 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _1268 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _1266;
    float _1270 = -_1252;
    float _1272 = _1270 + 1.0;
    float _1274 = -_419;
    int _1276 = _1186 ? as_type<int>(_1274) : as_type<int>(_419);
    float _1278 = fma(_1264, _1240, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _1280 = fma(_1268, _1240, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _1282 = _1234 * _1272;
    float _1284 = -_1234;
    float _1286 = _1284 + 1.0;
    bool _1288 = !_1208;
    float _1290 = _1288 ? _419 : as_type<float>(_1276);
    float _1292 = fma(_1256, _1240, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _1294 = _1278 * _1282;
    float _1296 = _1280 * _1282;
    float _1298 = -_1260;
    float _1300 = _1298 + 0.5;
    float _1302 = _1292 * _1282;
    float _1304 = fma(_1286, (*spvDescriptorSet0.vp_c9)._m0[107].x, _1294);
    float _1306 = _1063 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1308 = fma(_1286, (*spvDescriptorSet0.vp_c9)._m0[107].y, _1296);
    float _1310 = fma(_1286, (*spvDescriptorSet0.vp_c9)._m0[107].z, _1302);
    float _1312 = fma(_1252, (*spvDescriptorSet0.vp_c9)._m0[108].x, _1304);
    float _1314 = exp2(_1306);
    float _1316 = fma(_1252, (*spvDescriptorSet0.vp_c9)._m0[108].y, _1308);
    float _1318 = fma(_1252, (*spvDescriptorSet0.vp_c9)._m0[108].z, _1310);
    float _1320 = _1312 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1322 = _1290 + 0.5;
    float _1324 = _1316 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    bool _1326 = _843 > 0.0;
    bool _1328 = isnan(_843);
    bool _1330 = _1326 || _1328;
    bool _1332 = isnan(0.0);
    bool _1334 = _1330 || _1332;
    float _1336 = _1320 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1338 = _1318 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1340 = _1324 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1342 = _1214 + _1097;
    float _1344 = _1322 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1346 = _1300 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1348 = _1342 * 0.5;
    float _1350 = -_1314;
    float _1352 = _1350 + 1.0;
    out.gl_Position.x = _1127;
    out.gl_Position.y = _1131;
    out.gl_Position.z = _1214;
    out.gl_Position.w = _1097;
    float _1354 = _1344 * _1218;
    float _1356 = _1346 * _1198;
    float _1358 = _1352 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1360 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1362 = _1338 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_58.x = _1354;
    out.m_58.y = _1356;
    out.m_60.x = _1336;
    out.m_60.y = _1340;
    out.m_60.z = _1362;
    out.m_60.w = _1360;
    out.m_62.z = _1348;
    out.m_62.w = _1097;
    float _1364 = _1358 * _1161;
    float _1366 = -_1358;
    float _1368 = _1366 + 1.0;
    float _1370 = _1172 * _1364;
    float _1372 = _1182 * _1364;
    float _1374 = fma(_1178, _1370, _1166);
    float _1376 = fma(_1180, _1370, _1168);
    float _1378 = _1172 * _1368;
    float _1380 = fma(_1172, _1372, _1170);
    out.m_64.x = _1374;
    out.m_64.y = _1376;
    out.m_64.z = _1380;
    out.m_64.w = _1378;
    if (_1334)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_45.x = 0.0;
    float _1382 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1382;
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
    bool _373 = false;
    bool _273 = false;
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
        float _1439 = as_type<float>(_99);
        out.gl_Position.z = _1439;
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
    if (_113)
    {
        float _121 = float(_83);
        _119 = _121;
    }
    float _123 = _119;
    bool _125 = _117 >= _123;
    bool _127 = !_113;
    bool _129 = _125 || _127;
    if (_129)
    {
        _93 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _131 = _93;
    if (_129)
    {
        out.m_45.x = 0.0;
    }
    if (_129)
    {
        float _133 = _131 * 5.0;
        _101 = as_type<int>(_133);
    }
    int _135 = _101;
    if (_129)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1507 = as_type<float>(_135);
        out.gl_Position.z = _1507;
    }
    if (_129)
    {
        return out;
    }
    float _137 = in.m_49.x;
    float _139 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _141 = _117 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _143 = in.m_51.x;
    float _145 = in.m_51.y;
    float _147 = in.m_51.z;
    float _149 = _141 * _139;
    int _151 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _153 = _151 != 0;
    float _155 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[20].x, _149);
    float _157 = floor(_155);
    float _159 = _155 * 6.283185482025146484375;
    int _161 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _163 = _161 != 0;
    int _165 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _167 = _165 != 0;
    float _169 = _145 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _171 = _145 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _173 = _159 * 0.15915493667125701904296875;
    float _175 = _145 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _177 = !_163;
    int _179 = _177 ? 0 : 1;
    float _181 = fma(_143, (*spvDescriptorSet0.vp_c10)._m0[4].x, _169);
    float _183 = fma(_143, (*spvDescriptorSet0.vp_c10)._m0[5].x, _171);
    bool _185 = !_167;
    int _187 = _185 ? 0 : 1;
    float _189 = _173 * 6.283185482025146484375;
    float _191 = cos(_189);
    float _193 = fma(_143, (*spvDescriptorSet0.vp_c10)._m0[6].x, _175);
    float _195 = fma(_147, (*spvDescriptorSet0.vp_c10)._m0[4].z, _181);
    int _197 = abs(_187);
    float _199 = -_157;
    float _201 = _155 + _199;
    int _203 = abs(_179);
    float _205 = fma(_147, (*spvDescriptorSet0.vp_c10)._m0[5].z, _183);
    bool _207 = !_153;
    int _209 = _207 ? 0 : 1;
    float _211 = -_201;
    float _213 = fma(_211, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _215 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _217 = fma(_147, (*spvDescriptorSet0.vp_c10)._m0[6].z, _193);
    int _219 = abs(_209);
    float _221 = float(_203);
    float _223 = fma(_191, 0.5, 0.5);
    bool _225 = _201 < 0.5;
    float _227 = float(_225);
    float _229 = abs(_213);
    float _231 = _221 * _229;
    float _233 = -_223;
    float _235 = fma(_233, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _237 = float(_219);
    float _239 = -_227;
    float _241 = fma(_239, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _243 = float(_197);
    float _245 = fma(_237, _235, _231);
    float _247 = abs(_241);
    float _249 = fma(_243, _247, _245);
    bool _251 = !_215;
    float _253 = _205;
    float _255 = _195;
    float _271;
    if (!_251)
    {
        float _257 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _259 = _137 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _261 = fma(_259, (*spvDescriptorSet0.vp_c9)._m0[12].x, _117);
        float _263 = _261 * _257;
        float _265 = floor(_263);
        float _267 = -_265;
        float _269 = _263 + _267;
        _271 = _269;
        _273 = true;
    }
    else
    {
        float _275 = float(_83);
        float _277 = 1.0 / _275;
        float _279 = _117 * _277;
        _271 = _279;
    }
    _273 = false;
    float _281 = _271;
    float _283 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _285 = _281 + _283;
    bool _287 = _281 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _289 = isnan(_281);
    bool _291 = _287 || _289;
    bool _293 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _295 = _291 || _293;
    float _297 = float(_295);
    float _299 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _301 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _299;
    float _303 = -_297;
    float _305 = _303 + 1.0;
    bool _307 = _281 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _309 = isnan(_281);
    bool _311 = _307 || _309;
    bool _313 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _315 = _311 || _313;
    float _317 = float(_315);
    float _319 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _321 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _319;
    bool _323 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _325 = 1.0 / _301;
    float _327 = _317 * _305;
    float _329 = -_317;
    float _331 = _329 + 1.0;
    float _333 = _285 * _325;
    float _335 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _337 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _335;
    float _339 = fma(_321, _333, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _341 = fma(_337, _333, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _343 = _339 * _327;
    float _345 = _341 * _327;
    float _347 = fma(_331, (*spvDescriptorSet0.vp_c9)._m0[143].x, _343);
    float _349 = fma(_331, (*spvDescriptorSet0.vp_c9)._m0[143].y, _345);
    float _351 = fma(_297, (*spvDescriptorSet0.vp_c9)._m0[144].x, _347);
    float _353 = fma(_297, (*spvDescriptorSet0.vp_c9)._m0[144].y, _349);
    bool _355 = !_323;
    float _371;
    if (!_355)
    {
        float _357 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _359 = _137 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _361 = fma(_359, (*spvDescriptorSet0.vp_c9)._m0[11].x, _117);
        float _363 = _361 * _357;
        float _365 = floor(_363);
        float _367 = -_365;
        float _369 = _363 + _367;
        _371 = _369;
        _373 = true;
    }
    else
    {
        float _375 = float(_83);
        float _377 = 1.0 / _375;
        float _379 = _117 * _377;
        _371 = _379;
    }
    _373 = false;
    float _381 = _371;
    float _383 = as_type<float>(int(gl_VertexIndex));
    float _385 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _387 = in.m_56.x;
    float _389 = in.m_56.y;
    float _391 = in.m_42.x;
    float _393 = in.m_42.y;
    float _395 = in.m_42.z;
    int _397 = as_type<int>(_383) & 1;
    bool _399 = _397 != 0;
    int _401 = as_type<int>(_383) & 2;
    bool _403 = _401 != 0;
    float _405 = _353 * _389;
    float _407 = _351 * _387;
    bool _409 = !_403;
    float _411 = _409 ? (-0.5) : 0.5;
    float _413 = _249 * _405;
    float _415 = _249 * _407;
    bool _417 = !_399;
    float _419 = _417 ? (-0.5) : 0.5;
    float _421 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _411);
    float _423 = _413 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _425 = _415 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _427 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _419);
    float _429 = _423 * _421;
    float _431 = _393 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _433 = _425 * _427;
    float _435 = _429 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _437 = _393 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _439 = fma(_391, (*spvDescriptorSet0.vp_c10)._m0[6].x, _431);
    float _441 = _429 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _443 = fma(_433, (*spvDescriptorSet0.vp_c8)._m0[26].x, _435);
    float _445 = fma(_391, (*spvDescriptorSet0.vp_c10)._m0[4].x, _437);
    float _447 = fma(_395, (*spvDescriptorSet0.vp_c10)._m0[6].z, _439);
    float _449 = fma(_433, (*spvDescriptorSet0.vp_c8)._m0[24].x, _441);
    float _451 = fma(_385, (*spvDescriptorSet0.vp_c8)._m0[26].z, _443);
    float _453 = fma(_395, (*spvDescriptorSet0.vp_c10)._m0[4].z, _445);
    float _455 = _447 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _457 = fma(_385, (*spvDescriptorSet0.vp_c8)._m0[24].z, _449);
    float _459 = _451 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _461 = _453 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _463 = _393 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _465 = _457 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _467 = _455 + _459;
    float _469 = fma(_391, (*spvDescriptorSet0.vp_c10)._m0[5].x, _463);
    float _471 = _461 + _465;
    float _473 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _475 = _467 + _473;
    float _477 = fma(_395, (*spvDescriptorSet0.vp_c10)._m0[5].z, _469);
    float _479 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _481 = _471 + _479;
    float _483 = _475 * _475;
    float _485 = _477 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _487 = fma(_481, _481, _483);
    float _489 = _429 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _491 = sqrt(_487);
    float _493 = fma(_433, (*spvDescriptorSet0.vp_c8)._m0[25].x, _489);
    float _495 = fma(_385, (*spvDescriptorSet0.vp_c8)._m0[25].z, _493);
    float _497 = _495 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _499 = _485 + _497;
    bool _501 = _491 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _503 = _495;
    float _505 = _385;
    float _507 = _469;
    float _509 = _487;
    if (!_501)
    {
        _503 = _471;
    }
    float _511 = _503;
    float _513 = _511;
    if (!_501)
    {
        _505 = _467;
    }
    float _515 = _505;
    float _517 = _515;
    if (!_501)
    {
        _507 = _499;
    }
    float _519 = _507;
    bool _521 = !_501;
    float _523 = _519;
    if (!_521)
    {
        float _525 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _527 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _529 = _491 + _527;
        float _531 = rsqrt(_487);
        float _533 = _529 * _525;
        float _535 = _499 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _537 = _533 * 0.15915493667125701904296875;
        float _539 = _537 * 6.283185482025146484375;
        float _541 = cos(_539);
        float _543 = _537 * 6.283185482025146484375;
        float _545 = sin(_543);
        float _547 = _541 + (-1.0);
        float _549 = fma(_545, _535, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _551 = _547 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _553 = _531 * _549;
        float _555 = fma(_499, _541, _551);
        float _557 = fma(_481, _553, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _559 = fma(_475, _553, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _523 = _555;
        _513 = _557;
        _517 = _559;
    }
    float _561 = _523;
    float _563 = _513;
    float _565 = _517;
    float _567 = -_485;
    float _569 = _567 + _561;
    float _571 = -_461;
    float _573 = _571 + _563;
    float _575 = -_455;
    float _577 = _575 + _565;
    float _579 = _485 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _581 = _569 * _569;
    bool _583 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _585 = isnan(0.5);
    bool _587 = _583 || _585;
    bool _589 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _591 = _587 || _589;
    float _593 = fma(_573, _573, _581);
    bool _595 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _597 = isnan(0.5);
    bool _599 = _595 || _597;
    bool _601 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _603 = _599 || _601;
    float _605 = fma(_577, _577, _593);
    float _607 = fma(_461, (*spvDescriptorSet0.vp_c8)._m0[11].x, _579);
    float _609 = _485 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _611 = sqrt(_605);
    float _613 = fma(_455, (*spvDescriptorSet0.vp_c8)._m0[11].z, _607);
    float _615 = _613 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _617 = fma(_461, (*spvDescriptorSet0.vp_c8)._m0[10].x, _609);
    float _619 = 1.0 / _615;
    float _621 = fma(_455, (*spvDescriptorSet0.vp_c8)._m0[10].z, _617);
    float _623 = _621 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _625 = _611 > 0.0;
    float _627 = _623 + _615;
    float _629 = _627 * _619;
    float _631 = _629 * 0.5;
    bool _633 = !_625;
    float _635 = _563;
    float _637 = _565;
    float _639 = _561;
    float _641 = _627;
    float _643 = _631;
    if (!_633)
    {
        float _645 = _205 * _205;
        float _647 = fma(_195, _195, _645);
        float _649 = fma(_217, _217, _647);
        float _651 = rsqrt(_605);
        float _653 = sqrt(_649);
        float _655 = _573 * _651;
        float _657 = _569 * _651;
        float _659 = _577 * _651;
        bool _661 = _653 > 0.0;
        bool _663 = !_661;
        _641 = _651;
        _509 = _659;
        if (!_663)
        {
            float _665 = rsqrt(_649);
            float _667 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _669 = _205 * _665;
            float _671 = _195 * _665;
            float _673 = _657 * _669;
            float _675 = _217 * _665;
            float _677 = fma(_655, _671, _673);
            float _679 = _667 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _681 = fma(_659, _675, _677);
            float _683 = _681 * _679;
            float _685 = fma(_195, _683, _563);
            float _687 = fma(_205, _683, _561);
            float _689 = fma(_217, _683, _565);
            _635 = _685;
            _637 = _689;
            _639 = _687;
            _641 = _671;
        }
    }
    float _691 = _635;
    float _693 = _637;
    float _695 = _639;
    float _697 = _641;
    float _699 = _509;
    float _701 = _697;
    float _703 = _695;
    float _705 = _691;
    float _707 = _699;
    if (_603)
    {
        _701 = 1.0;
    }
    float _709 = _701;
    float _711 = _709;
    if (_591)
    {
        _253 = _691;
    }
    float _713 = _253;
    float _715 = _713;
    if (_591)
    {
        _255 = _693;
    }
    float _717 = _255;
    float _719 = _717;
    if (!_591)
    {
        float _721 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _723 = _485 + _721;
        float _725 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _727 = _461 + _725;
        float _729 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _731 = -_461;
        float _733 = _731 + _691;
        float _735 = _723 * _723;
        float _737 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _739 = _455 + _737;
        float _741 = -_485;
        float _743 = _741 + _695;
        float _745 = -_455;
        float _747 = _745 + _693;
        float _749 = fma(_727, _727, _735);
        float _751 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _753 = fma(_739, _739, _749);
        float _755 = sqrt(_753);
        float _757 = _729 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _759 = precise::min(_755, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _761 = _759 * _751;
        float _763 = _757 * _761;
        float _765 = fma(_733, _763, _461);
        float _767 = fma(_743, _763, _485);
        float _769 = fma(_747, _763, _455);
        _703 = _767;
        _715 = _765;
        _719 = _769;
        _705 = _733;
    }
    float _771 = _703;
    float _773 = _715;
    float _775 = _719;
    float _777 = _705;
    float _779 = _777;
    if (!_603)
    {
        float _781 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _783 = _781 * 0.15915493667125701904296875;
        float _785 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _787 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _789 = fma(_631, (*spvDescriptorSet0.vp_c8)._m0[30].w, _787);
        float _791 = _783 * 6.283185482025146484375;
        float _793 = cos(_791);
        float _795 = _785 * 0.15915493667125701904296875;
        float _797 = _783 * 6.283185482025146484375;
        float _799 = sin(_797);
        float _801 = 1.0 / _793;
        float _803 = _795 * 6.283185482025146484375;
        float _805 = cos(_803);
        float _807 = _799 * _801;
        float _809 = _795 * 6.283185482025146484375;
        float _811 = sin(_809);
        float _813 = _805 * _807;
        float _815 = 1.0 / _789;
        float _817 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _819 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _817;
        float _821 = 1.0 / _813;
        float _823 = 1.0 / _819;
        float _825 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _827 = _815 * _825;
        float _829 = _811 * _821;
        float _831 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _833 = fma(_829, _827, _831);
        float _835 = _833 * _823;
        float _837 = precise::clamp(_835, 0.0, 1.0);
        _779 = _795;
        _643 = _815;
        _711 = _837;
    }
    float _839 = _779;
    float _841 = _643;
    float _843 = _711;
    float _845 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _847 = _771 + _845;
    float _849 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _851 = _773 + _849;
    float _853 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _855 = _775 + _853;
    float _857 = _847 * _847;
    float _859 = fma(_851, _851, _857);
    float _861 = fma(_855, _855, _859);
    float _863 = rsqrt(_861);
    float _865 = _863 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _867 = _851 * _865;
    float _869 = _855 * _865;
    float _871 = _867 * _867;
    float _873 = _869 * _869;
    float _875 = _871 + _873;
    float _877 = sqrt(_875);
    bool _879 = _877 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _881 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _883 = _877 + _881;
    float _885 = _855;
    float _887 = _857;
    float _889 = _883;
    float _891 = _839;
    float _893 = _847;
    if (_879)
    {
        float _895 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _885 = _895;
    }
    float _897 = _885;
    if (_879)
    {
        float _899 = rsqrt(_875);
        _887 = _899;
    }
    float _901 = _887;
    float _903 = _901;
    if (_879)
    {
        float _905 = _883 * _897;
        _889 = _905;
    }
    float _907 = _889;
    if (_879)
    {
        float _909 = _907 * 0.15915493667125701904296875;
        _891 = _909;
    }
    float _911 = _891;
    float _913 = _863;
    if (_879)
    {
        float _915 = _911 * 6.283185482025146484375;
        float _917 = sin(_915);
        _913 = _917;
    }
    float _919 = _913;
    float _921 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _923 = precise::max(0.0, _921);
    float _925 = _841;
    float _927 = _923;
    float _929 = _921;
    if (_879)
    {
        float _931 = _911 * 6.283185482025146484375;
        float _933 = cos(_931);
        _925 = _933;
    }
    float _935 = _925;
    float _937 = -_865;
    float _939 = -_923;
    float _941 = fma(_847, _937, _939);
    if (_879)
    {
        float _943 = _941 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _927 = _943;
    }
    float _945 = _927;
    float _947 = sqrt(_861);
    float _949 = _919;
    float _951 = _945;
    if (_879)
    {
        float _953 = fma(_919, _945, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _893 = _953;
    }
    float _955 = _893;
    float _957 = _955;
    if (!_879)
    {
        _949 = _867;
    }
    float _959 = _949;
    float _961 = _959;
    if (!_879)
    {
        _951 = _941;
    }
    float _963 = _951;
    float _965 = _963;
    float _967 = _935;
    if (_879)
    {
        float _969 = _935 + (-1.0);
        _929 = _969;
    }
    float _971 = _929;
    float _973 = _971;
    if (_879)
    {
        float _975 = _901 * _955;
        _707 = _975;
    }
    float _977 = _707;
    if (!_879)
    {
        _957 = _869;
    }
    float _979 = _957;
    float _981 = _979;
    if (_879)
    {
        float _983 = _971 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _903 = _983;
    }
    float _985 = _903;
    if (_879)
    {
        float _987 = _867 * _977;
        _961 = _987;
    }
    float _989 = _961;
    if (!_879)
    {
        _973 = _871;
    }
    float _991 = _973;
    float _993 = _991;
    if (_879)
    {
        float _995 = _869 * _977;
        _981 = _995;
    }
    float _997 = _981;
    if (_879)
    {
        float _999 = fma(_941, _935, _985);
        _965 = _999;
    }
    float _1001 = _965;
    if (_879)
    {
        float _1003 = _989 * _989;
        _993 = _1003;
    }
    float _1005 = _993;
    if (!_879)
    {
        _967 = _873;
    }
    float _1007 = _967;
    float _1009 = _1007;
    if (_879)
    {
        float _1011 = _997 * _997;
        _1009 = _1011;
    }
    float _1013 = _1009;
    float _1015 = fma(_1001, _1001, _1005);
    float _1017 = _771 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1019 = _771 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1021 = _1015 + _1013;
    float _1023 = fma(_773, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1017);
    float _1025 = _771 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1027 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1029 = fma(_947, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1027);
    float _1031 = precise::clamp(_1029, 0.0, 1.0);
    float _1033 = fma(_773, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1019);
    float _1035 = fma(_775, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1023);
    float _1037 = rsqrt(_1021);
    float _1039 = _771 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1041 = fma(_773, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1025);
    float _1043 = -_1031;
    float _1045 = _1043 + 1.0;
    float _1047 = _1035 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1049 = fma(_773, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1039);
    float _1051 = fma(_775, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1041);
    float _1053 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1055 = _1047 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1057 = fma(_775, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1049);
    float _1059 = _1051 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1061 = abs(_1045);
    float _1063 = log2(_1061);
    float _1065 = fma(_775, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1033);
    float _1067 = _1057 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1069 = _1059 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1071 = -_1055;
    float _1073 = fma(_1071, _1053, 1.0);
    float _1075 = _1037 * _989;
    float _1077 = _1037 * _997;
    float _1079 = fma(_1067, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1069);
    float _1081 = _1037 * _1001;
    float _1083 = _1075 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1085 = _1065 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1087 = fma(_1047, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1079);
    float _1089 = log2(_1073);
    float _1091 = -_1083;
    float _1093 = fma(_1081, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1091);
    float _1095 = _1059 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1097 = fma(_1085, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1087);
    float _1099 = _1063 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1101 = -_1077;
    float _1103 = fma(_1101, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1093);
    float _1105 = _1059 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1107 = 1.0 / _1097;
    float _1109 = fma(_1103, -0.5, 0.5);
    float _1111 = fma(_1067, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1105);
    float _1113 = fma(_1103, 0.5, 0.5);
    float _1115 = fma(_1067, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1095);
    float _1117 = _1081 + 1.0;
    float _1119 = fma(_1047, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1111);
    float _1121 = fma(_1113, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1123 = exp2(_1099);
    float _1125 = fma(_1047, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1115);
    float _1127 = fma(_1085, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1119);
    float _1129 = fma(_1113, _1121, -0.212114393711090087890625);
    float _1131 = fma(_1085, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1125);
    float _1133 = fma(_1113, _1129, 1.570728778839111328125);
    float _1135 = sqrt(_1109);
    float _1137 = _1127 * _1107;
    float _1139 = fma(_1137, 0.5, 0.5);
    float _1141 = -_1081;
    float _1143 = fma(_1123, _1117, _1141);
    float _1145 = _1089 * 0.693147182464599609375;
    float _1147 = _1131 * _1107;
    float _1149 = fma(_1143, 0.5, 0.5);
    float _1151 = _1145 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1153 = fma(_1147, -0.5, 0.5);
    float _1155 = _1135 * 0.636619746685028076171875;
    float _1157 = -_1133;
    float _1159 = fma(_1155, _1157, 1.0);
    float3 _3125 = float3(_1139, _1153, _1151);
    float _1161 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3125, float3(0.0), isnan(_3125)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3125, float3(0.0), isnan(_3125)), level(0.0)).x;
    float3 _3136 = float3(_1139, _1153, _1151);
    float4 _1164 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3136, float3(0.0), isnan(_3136)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3136, float3(0.0), isnan(_3136)), level(0.0)).xyzw;
    float _1166 = _1164.x;
    float _1168 = _1164.y;
    float _1170 = _1164.z;
    float _1172 = _1164.w;
    float2 _3153 = float2(_1159, _1149);
    float3 _1176 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3153, float2(0.0), isnan(_3153)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3153, float2(0.0), isnan(_3153)), level(0.0)).xyz;
    float _1178 = _1176.x;
    float _1180 = _1176.y;
    float _1182 = _1176.z;
    float _1184 = in.m_49.y;
    bool _1186 = _137 > 0.5;
    float _1188 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1190 = _381 + _1188;
    float _1192 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1194 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _1192;
    float _1196 = _1059 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1198 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _1200 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1202 = _1200 != 0;
    float _1204 = fma(_1067, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1196);
    int _1206 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1208 = _1206 != 0;
    float _1210 = 1.0 / _1194;
    float _1212 = fma(_1047, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1204);
    float _1214 = fma(_1085, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1212);
    float _1216 = _843 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1218 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1220 = _1184 > 0.5;
    float _1222 = _1216 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    bool _1224 = _381 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _1226 = isnan(_381);
    bool _1228 = _1224 || _1226;
    bool _1230 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _1232 = _1228 || _1230;
    float _1234 = float(_1232);
    float _1236 = -_411;
    int _1238 = _1220 ? as_type<int>(_1236) : as_type<int>(_411);
    float _1240 = _1190 * _1210;
    out.m_45.x = _1222;
    bool _1242 = _381 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _1244 = isnan(_381);
    bool _1246 = _1242 || _1244;
    bool _1248 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _1250 = _1246 || _1248;
    float _1252 = float(_1250);
    float _1254 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _1256 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _1254;
    bool _1258 = !_1202;
    float _1260 = _1258 ? _411 : as_type<float>(_1238);
    float _1262 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _1264 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _1262;
    float _1266 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _1268 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _1266;
    float _1270 = -_1252;
    float _1272 = _1270 + 1.0;
    float _1274 = -_419;
    int _1276 = _1186 ? as_type<int>(_1274) : as_type<int>(_419);
    float _1278 = fma(_1264, _1240, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _1280 = fma(_1268, _1240, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _1282 = _1234 * _1272;
    float _1284 = -_1234;
    float _1286 = _1284 + 1.0;
    bool _1288 = !_1208;
    float _1290 = _1288 ? _419 : as_type<float>(_1276);
    float _1292 = fma(_1256, _1240, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _1294 = _1278 * _1282;
    float _1296 = _1280 * _1282;
    float _1298 = -_1260;
    float _1300 = _1298 + 0.5;
    float _1302 = _1292 * _1282;
    float _1304 = fma(_1286, (*spvDescriptorSet0.vp_c9)._m0[107].x, _1294);
    float _1306 = _1063 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1308 = fma(_1286, (*spvDescriptorSet0.vp_c9)._m0[107].y, _1296);
    float _1310 = fma(_1286, (*spvDescriptorSet0.vp_c9)._m0[107].z, _1302);
    float _1312 = fma(_1252, (*spvDescriptorSet0.vp_c9)._m0[108].x, _1304);
    float _1314 = exp2(_1306);
    float _1316 = fma(_1252, (*spvDescriptorSet0.vp_c9)._m0[108].y, _1308);
    float _1318 = fma(_1252, (*spvDescriptorSet0.vp_c9)._m0[108].z, _1310);
    float _1320 = _1312 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1322 = _1290 + 0.5;
    float _1324 = _1316 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    bool _1326 = _843 > 0.0;
    bool _1328 = isnan(_843);
    bool _1330 = _1326 || _1328;
    bool _1332 = isnan(0.0);
    bool _1334 = _1330 || _1332;
    float _1336 = _1320 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1338 = _1318 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1340 = _1324 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1342 = _1214 + _1097;
    float _1344 = _1322 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1346 = _1300 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1348 = _1342 * 0.5;
    float _1350 = -_1314;
    float _1352 = _1350 + 1.0;
    out.gl_Position.x = _1127;
    out.gl_Position.y = _1131;
    out.gl_Position.z = _1214;
    out.gl_Position.w = _1097;
    float _1354 = _1344 * _1218;
    float _1356 = _1346 * _1198;
    float _1358 = _1352 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1360 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1362 = _1338 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_58.x = _1354;
    out.m_58.y = _1356;
    out.m_60.x = _1336;
    out.m_60.y = _1340;
    out.m_60.z = _1362;
    out.m_60.w = _1360;
    out.m_62.z = _1348;
    out.m_62.w = _1097;
    float _1364 = _1358 * _1161;
    float _1366 = -_1358;
    float _1368 = _1366 + 1.0;
    float _1370 = _1172 * _1364;
    float _1372 = _1182 * _1364;
    float _1374 = fma(_1178, _1370, _1166);
    float _1376 = fma(_1180, _1370, _1168);
    float _1378 = _1172 * _1368;
    float _1380 = fma(_1172, _1372, _1170);
    out.m_64.x = _1374;
    out.m_64.y = _1376;
    out.m_64.z = _1380;
    out.m_64.w = _1378;
    if (_1334)
    {
        return out;
    }
    out.m_45.x = 0.0;
    float _1382 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1382;
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
    bool _373 = false;
    bool _273 = false;
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
        float _1439 = as_type<float>(_99);
        out.gl_Position.z = _1439;
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
    if (_113)
    {
        float _121 = float(_83);
        _119 = _121;
    }
    float _123 = _119;
    bool _125 = _117 >= _123;
    bool _127 = !_113;
    bool _129 = _125 || _127;
    if (_129)
    {
        _93 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _131 = _93;
    if (_129)
    {
        out.m_45.x = 0.0;
    }
    if (_129)
    {
        float _133 = _131 * 5.0;
        _101 = as_type<int>(_133);
    }
    int _135 = _101;
    if (_129)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1507 = as_type<float>(_135);
        out.gl_Position.z = _1507;
    }
    if (_129)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _137 = in.m_49.x;
    float _139 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _141 = _117 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _143 = in.m_51.x;
    float _145 = in.m_51.y;
    float _147 = in.m_51.z;
    float _149 = _141 * _139;
    int _151 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _153 = _151 != 0;
    float _155 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[20].x, _149);
    float _157 = floor(_155);
    float _159 = _155 * 6.283185482025146484375;
    int _161 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _163 = _161 != 0;
    int _165 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _167 = _165 != 0;
    float _169 = _145 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _171 = _145 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _173 = _159 * 0.15915493667125701904296875;
    float _175 = _145 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _177 = !_163;
    int _179 = _177 ? 0 : 1;
    float _181 = fma(_143, (*spvDescriptorSet0.vp_c10)._m0[4].x, _169);
    float _183 = fma(_143, (*spvDescriptorSet0.vp_c10)._m0[5].x, _171);
    bool _185 = !_167;
    int _187 = _185 ? 0 : 1;
    float _189 = _173 * 6.283185482025146484375;
    float _191 = cos(_189);
    float _193 = fma(_143, (*spvDescriptorSet0.vp_c10)._m0[6].x, _175);
    float _195 = fma(_147, (*spvDescriptorSet0.vp_c10)._m0[4].z, _181);
    int _197 = abs(_187);
    float _199 = -_157;
    float _201 = _155 + _199;
    int _203 = abs(_179);
    float _205 = fma(_147, (*spvDescriptorSet0.vp_c10)._m0[5].z, _183);
    bool _207 = !_153;
    int _209 = _207 ? 0 : 1;
    float _211 = -_201;
    float _213 = fma(_211, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _215 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _217 = fma(_147, (*spvDescriptorSet0.vp_c10)._m0[6].z, _193);
    int _219 = abs(_209);
    float _221 = float(_203);
    float _223 = fma(_191, 0.5, 0.5);
    bool _225 = _201 < 0.5;
    float _227 = float(_225);
    float _229 = abs(_213);
    float _231 = _221 * _229;
    float _233 = -_223;
    float _235 = fma(_233, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _237 = float(_219);
    float _239 = -_227;
    float _241 = fma(_239, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _243 = float(_197);
    float _245 = fma(_237, _235, _231);
    float _247 = abs(_241);
    float _249 = fma(_243, _247, _245);
    bool _251 = !_215;
    float _253 = _205;
    float _255 = _195;
    float _271;
    if (!_251)
    {
        float _257 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _259 = _137 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _261 = fma(_259, (*spvDescriptorSet0.vp_c9)._m0[12].x, _117);
        float _263 = _261 * _257;
        float _265 = floor(_263);
        float _267 = -_265;
        float _269 = _263 + _267;
        _271 = _269;
        _273 = true;
    }
    else
    {
        float _275 = float(_83);
        float _277 = 1.0 / _275;
        float _279 = _117 * _277;
        _271 = _279;
    }
    _273 = false;
    float _281 = _271;
    float _283 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _285 = _281 + _283;
    bool _287 = _281 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _289 = isnan(_281);
    bool _291 = _287 || _289;
    bool _293 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _295 = _291 || _293;
    float _297 = float(_295);
    float _299 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _301 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _299;
    float _303 = -_297;
    float _305 = _303 + 1.0;
    bool _307 = _281 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _309 = isnan(_281);
    bool _311 = _307 || _309;
    bool _313 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _315 = _311 || _313;
    float _317 = float(_315);
    float _319 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _321 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _319;
    bool _323 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _325 = 1.0 / _301;
    float _327 = _317 * _305;
    float _329 = -_317;
    float _331 = _329 + 1.0;
    float _333 = _285 * _325;
    float _335 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _337 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _335;
    float _339 = fma(_321, _333, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _341 = fma(_337, _333, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _343 = _339 * _327;
    float _345 = _341 * _327;
    float _347 = fma(_331, (*spvDescriptorSet0.vp_c9)._m0[143].x, _343);
    float _349 = fma(_331, (*spvDescriptorSet0.vp_c9)._m0[143].y, _345);
    float _351 = fma(_297, (*spvDescriptorSet0.vp_c9)._m0[144].x, _347);
    float _353 = fma(_297, (*spvDescriptorSet0.vp_c9)._m0[144].y, _349);
    bool _355 = !_323;
    float _371;
    if (!_355)
    {
        float _357 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _359 = _137 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _361 = fma(_359, (*spvDescriptorSet0.vp_c9)._m0[11].x, _117);
        float _363 = _361 * _357;
        float _365 = floor(_363);
        float _367 = -_365;
        float _369 = _363 + _367;
        _371 = _369;
        _373 = true;
    }
    else
    {
        float _375 = float(_83);
        float _377 = 1.0 / _375;
        float _379 = _117 * _377;
        _371 = _379;
    }
    _373 = false;
    float _381 = _371;
    float _383 = as_type<float>(int(gl_VertexIndex));
    float _385 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _387 = in.m_56.x;
    float _389 = in.m_56.y;
    float _391 = in.m_42.x;
    float _393 = in.m_42.y;
    float _395 = in.m_42.z;
    int _397 = as_type<int>(_383) & 1;
    bool _399 = _397 != 0;
    int _401 = as_type<int>(_383) & 2;
    bool _403 = _401 != 0;
    float _405 = _353 * _389;
    float _407 = _351 * _387;
    bool _409 = !_403;
    float _411 = _409 ? (-0.5) : 0.5;
    float _413 = _249 * _405;
    float _415 = _249 * _407;
    bool _417 = !_399;
    float _419 = _417 ? (-0.5) : 0.5;
    float _421 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _411);
    float _423 = _413 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _425 = _415 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _427 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _419);
    float _429 = _423 * _421;
    float _431 = _393 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _433 = _425 * _427;
    float _435 = _429 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _437 = _393 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _439 = fma(_391, (*spvDescriptorSet0.vp_c10)._m0[6].x, _431);
    float _441 = _429 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _443 = fma(_433, (*spvDescriptorSet0.vp_c8)._m0[26].x, _435);
    float _445 = fma(_391, (*spvDescriptorSet0.vp_c10)._m0[4].x, _437);
    float _447 = fma(_395, (*spvDescriptorSet0.vp_c10)._m0[6].z, _439);
    float _449 = fma(_433, (*spvDescriptorSet0.vp_c8)._m0[24].x, _441);
    float _451 = fma(_385, (*spvDescriptorSet0.vp_c8)._m0[26].z, _443);
    float _453 = fma(_395, (*spvDescriptorSet0.vp_c10)._m0[4].z, _445);
    float _455 = _447 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _457 = fma(_385, (*spvDescriptorSet0.vp_c8)._m0[24].z, _449);
    float _459 = _451 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _461 = _453 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _463 = _393 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _465 = _457 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _467 = _455 + _459;
    float _469 = fma(_391, (*spvDescriptorSet0.vp_c10)._m0[5].x, _463);
    float _471 = _461 + _465;
    float _473 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _475 = _467 + _473;
    float _477 = fma(_395, (*spvDescriptorSet0.vp_c10)._m0[5].z, _469);
    float _479 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _481 = _471 + _479;
    float _483 = _475 * _475;
    float _485 = _477 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _487 = fma(_481, _481, _483);
    float _489 = _429 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _491 = sqrt(_487);
    float _493 = fma(_433, (*spvDescriptorSet0.vp_c8)._m0[25].x, _489);
    float _495 = fma(_385, (*spvDescriptorSet0.vp_c8)._m0[25].z, _493);
    float _497 = _495 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _499 = _485 + _497;
    bool _501 = _491 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _503 = _495;
    float _505 = _385;
    float _507 = _469;
    float _509 = _487;
    if (!_501)
    {
        _503 = _471;
    }
    float _511 = _503;
    float _513 = _511;
    if (!_501)
    {
        _505 = _467;
    }
    float _515 = _505;
    float _517 = _515;
    if (!_501)
    {
        _507 = _499;
    }
    float _519 = _507;
    bool _521 = !_501;
    float _523 = _519;
    if (!_521)
    {
        float _525 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _527 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _529 = _491 + _527;
        float _531 = rsqrt(_487);
        float _533 = _529 * _525;
        float _535 = _499 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _537 = _533 * 0.15915493667125701904296875;
        float _539 = _537 * 6.283185482025146484375;
        float _541 = cos(_539);
        float _543 = _537 * 6.283185482025146484375;
        float _545 = sin(_543);
        float _547 = _541 + (-1.0);
        float _549 = fma(_545, _535, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _551 = _547 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _553 = _531 * _549;
        float _555 = fma(_499, _541, _551);
        float _557 = fma(_481, _553, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _559 = fma(_475, _553, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _523 = _555;
        _513 = _557;
        _517 = _559;
    }
    float _561 = _523;
    float _563 = _513;
    float _565 = _517;
    float _567 = -_485;
    float _569 = _567 + _561;
    float _571 = -_461;
    float _573 = _571 + _563;
    float _575 = -_455;
    float _577 = _575 + _565;
    float _579 = _485 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _581 = _569 * _569;
    bool _583 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _585 = isnan(0.5);
    bool _587 = _583 || _585;
    bool _589 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _591 = _587 || _589;
    float _593 = fma(_573, _573, _581);
    bool _595 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _597 = isnan(0.5);
    bool _599 = _595 || _597;
    bool _601 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _603 = _599 || _601;
    float _605 = fma(_577, _577, _593);
    float _607 = fma(_461, (*spvDescriptorSet0.vp_c8)._m0[11].x, _579);
    float _609 = _485 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _611 = sqrt(_605);
    float _613 = fma(_455, (*spvDescriptorSet0.vp_c8)._m0[11].z, _607);
    float _615 = _613 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _617 = fma(_461, (*spvDescriptorSet0.vp_c8)._m0[10].x, _609);
    float _619 = 1.0 / _615;
    float _621 = fma(_455, (*spvDescriptorSet0.vp_c8)._m0[10].z, _617);
    float _623 = _621 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _625 = _611 > 0.0;
    float _627 = _623 + _615;
    float _629 = _627 * _619;
    float _631 = _629 * 0.5;
    bool _633 = !_625;
    float _635 = _563;
    float _637 = _565;
    float _639 = _561;
    float _641 = _627;
    float _643 = _631;
    if (!_633)
    {
        float _645 = _205 * _205;
        float _647 = fma(_195, _195, _645);
        float _649 = fma(_217, _217, _647);
        float _651 = rsqrt(_605);
        float _653 = sqrt(_649);
        float _655 = _573 * _651;
        float _657 = _569 * _651;
        float _659 = _577 * _651;
        bool _661 = _653 > 0.0;
        bool _663 = !_661;
        _641 = _651;
        _509 = _659;
        if (!_663)
        {
            float _665 = rsqrt(_649);
            float _667 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _669 = _205 * _665;
            float _671 = _195 * _665;
            float _673 = _657 * _669;
            float _675 = _217 * _665;
            float _677 = fma(_655, _671, _673);
            float _679 = _667 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _681 = fma(_659, _675, _677);
            float _683 = _681 * _679;
            float _685 = fma(_195, _683, _563);
            float _687 = fma(_205, _683, _561);
            float _689 = fma(_217, _683, _565);
            _635 = _685;
            _637 = _689;
            _639 = _687;
            _641 = _671;
        }
    }
    float _691 = _635;
    float _693 = _637;
    float _695 = _639;
    float _697 = _641;
    float _699 = _509;
    float _701 = _697;
    float _703 = _695;
    float _705 = _691;
    float _707 = _699;
    if (_603)
    {
        _701 = 1.0;
    }
    float _709 = _701;
    float _711 = _709;
    if (_591)
    {
        _253 = _691;
    }
    float _713 = _253;
    float _715 = _713;
    if (_591)
    {
        _255 = _693;
    }
    float _717 = _255;
    float _719 = _717;
    if (!_591)
    {
        float _721 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _723 = _485 + _721;
        float _725 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _727 = _461 + _725;
        float _729 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _731 = -_461;
        float _733 = _731 + _691;
        float _735 = _723 * _723;
        float _737 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _739 = _455 + _737;
        float _741 = -_485;
        float _743 = _741 + _695;
        float _745 = -_455;
        float _747 = _745 + _693;
        float _749 = fma(_727, _727, _735);
        float _751 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _753 = fma(_739, _739, _749);
        float _755 = sqrt(_753);
        float _757 = _729 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _759 = precise::min(_755, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _761 = _759 * _751;
        float _763 = _757 * _761;
        float _765 = fma(_733, _763, _461);
        float _767 = fma(_743, _763, _485);
        float _769 = fma(_747, _763, _455);
        _703 = _767;
        _715 = _765;
        _719 = _769;
        _705 = _733;
    }
    float _771 = _703;
    float _773 = _715;
    float _775 = _719;
    float _777 = _705;
    float _779 = _777;
    if (!_603)
    {
        float _781 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _783 = _781 * 0.15915493667125701904296875;
        float _785 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _787 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _789 = fma(_631, (*spvDescriptorSet0.vp_c8)._m0[30].w, _787);
        float _791 = _783 * 6.283185482025146484375;
        float _793 = cos(_791);
        float _795 = _785 * 0.15915493667125701904296875;
        float _797 = _783 * 6.283185482025146484375;
        float _799 = sin(_797);
        float _801 = 1.0 / _793;
        float _803 = _795 * 6.283185482025146484375;
        float _805 = cos(_803);
        float _807 = _799 * _801;
        float _809 = _795 * 6.283185482025146484375;
        float _811 = sin(_809);
        float _813 = _805 * _807;
        float _815 = 1.0 / _789;
        float _817 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _819 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _817;
        float _821 = 1.0 / _813;
        float _823 = 1.0 / _819;
        float _825 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _827 = _815 * _825;
        float _829 = _811 * _821;
        float _831 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _833 = fma(_829, _827, _831);
        float _835 = _833 * _823;
        float _837 = precise::clamp(_835, 0.0, 1.0);
        _779 = _795;
        _643 = _815;
        _711 = _837;
    }
    float _839 = _779;
    float _841 = _643;
    float _843 = _711;
    float _845 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _847 = _771 + _845;
    float _849 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _851 = _773 + _849;
    float _853 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _855 = _775 + _853;
    float _857 = _847 * _847;
    float _859 = fma(_851, _851, _857);
    float _861 = fma(_855, _855, _859);
    float _863 = rsqrt(_861);
    float _865 = _863 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _867 = _851 * _865;
    float _869 = _855 * _865;
    float _871 = _867 * _867;
    float _873 = _869 * _869;
    float _875 = _871 + _873;
    float _877 = sqrt(_875);
    bool _879 = _877 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _881 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _883 = _877 + _881;
    float _885 = _855;
    float _887 = _857;
    float _889 = _883;
    float _891 = _839;
    float _893 = _847;
    if (_879)
    {
        float _895 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _885 = _895;
    }
    float _897 = _885;
    if (_879)
    {
        float _899 = rsqrt(_875);
        _887 = _899;
    }
    float _901 = _887;
    float _903 = _901;
    if (_879)
    {
        float _905 = _883 * _897;
        _889 = _905;
    }
    float _907 = _889;
    if (_879)
    {
        float _909 = _907 * 0.15915493667125701904296875;
        _891 = _909;
    }
    float _911 = _891;
    float _913 = _863;
    if (_879)
    {
        float _915 = _911 * 6.283185482025146484375;
        float _917 = sin(_915);
        _913 = _917;
    }
    float _919 = _913;
    float _921 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _923 = precise::max(0.0, _921);
    float _925 = _841;
    float _927 = _923;
    float _929 = _921;
    if (_879)
    {
        float _931 = _911 * 6.283185482025146484375;
        float _933 = cos(_931);
        _925 = _933;
    }
    float _935 = _925;
    float _937 = -_865;
    float _939 = -_923;
    float _941 = fma(_847, _937, _939);
    if (_879)
    {
        float _943 = _941 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _927 = _943;
    }
    float _945 = _927;
    float _947 = sqrt(_861);
    float _949 = _919;
    float _951 = _945;
    if (_879)
    {
        float _953 = fma(_919, _945, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _893 = _953;
    }
    float _955 = _893;
    float _957 = _955;
    if (!_879)
    {
        _949 = _867;
    }
    float _959 = _949;
    float _961 = _959;
    if (!_879)
    {
        _951 = _941;
    }
    float _963 = _951;
    float _965 = _963;
    float _967 = _935;
    if (_879)
    {
        float _969 = _935 + (-1.0);
        _929 = _969;
    }
    float _971 = _929;
    float _973 = _971;
    if (_879)
    {
        float _975 = _901 * _955;
        _707 = _975;
    }
    float _977 = _707;
    if (!_879)
    {
        _957 = _869;
    }
    float _979 = _957;
    float _981 = _979;
    if (_879)
    {
        float _983 = _971 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _903 = _983;
    }
    float _985 = _903;
    if (_879)
    {
        float _987 = _867 * _977;
        _961 = _987;
    }
    float _989 = _961;
    if (!_879)
    {
        _973 = _871;
    }
    float _991 = _973;
    float _993 = _991;
    if (_879)
    {
        float _995 = _869 * _977;
        _981 = _995;
    }
    float _997 = _981;
    if (_879)
    {
        float _999 = fma(_941, _935, _985);
        _965 = _999;
    }
    float _1001 = _965;
    if (_879)
    {
        float _1003 = _989 * _989;
        _993 = _1003;
    }
    float _1005 = _993;
    if (!_879)
    {
        _967 = _873;
    }
    float _1007 = _967;
    float _1009 = _1007;
    if (_879)
    {
        float _1011 = _997 * _997;
        _1009 = _1011;
    }
    float _1013 = _1009;
    float _1015 = fma(_1001, _1001, _1005);
    float _1017 = _771 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1019 = _771 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1021 = _1015 + _1013;
    float _1023 = fma(_773, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1017);
    float _1025 = _771 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1027 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1029 = fma(_947, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1027);
    float _1031 = precise::clamp(_1029, 0.0, 1.0);
    float _1033 = fma(_773, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1019);
    float _1035 = fma(_775, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1023);
    float _1037 = rsqrt(_1021);
    float _1039 = _771 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1041 = fma(_773, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1025);
    float _1043 = -_1031;
    float _1045 = _1043 + 1.0;
    float _1047 = _1035 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1049 = fma(_773, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1039);
    float _1051 = fma(_775, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1041);
    float _1053 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1055 = _1047 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1057 = fma(_775, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1049);
    float _1059 = _1051 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1061 = abs(_1045);
    float _1063 = log2(_1061);
    float _1065 = fma(_775, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1033);
    float _1067 = _1057 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1069 = _1059 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1071 = -_1055;
    float _1073 = fma(_1071, _1053, 1.0);
    float _1075 = _1037 * _989;
    float _1077 = _1037 * _997;
    float _1079 = fma(_1067, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1069);
    float _1081 = _1037 * _1001;
    float _1083 = _1075 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1085 = _1065 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1087 = fma(_1047, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1079);
    float _1089 = log2(_1073);
    float _1091 = -_1083;
    float _1093 = fma(_1081, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1091);
    float _1095 = _1059 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1097 = fma(_1085, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1087);
    float _1099 = _1063 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1101 = -_1077;
    float _1103 = fma(_1101, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1093);
    float _1105 = _1059 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1107 = 1.0 / _1097;
    float _1109 = fma(_1103, -0.5, 0.5);
    float _1111 = fma(_1067, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1105);
    float _1113 = fma(_1103, 0.5, 0.5);
    float _1115 = fma(_1067, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1095);
    float _1117 = _1081 + 1.0;
    float _1119 = fma(_1047, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1111);
    float _1121 = fma(_1113, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1123 = exp2(_1099);
    float _1125 = fma(_1047, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1115);
    float _1127 = fma(_1085, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1119);
    float _1129 = fma(_1113, _1121, -0.212114393711090087890625);
    float _1131 = fma(_1085, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1125);
    float _1133 = fma(_1113, _1129, 1.570728778839111328125);
    float _1135 = sqrt(_1109);
    float _1137 = _1127 * _1107;
    float _1139 = fma(_1137, 0.5, 0.5);
    float _1141 = -_1081;
    float _1143 = fma(_1123, _1117, _1141);
    float _1145 = _1089 * 0.693147182464599609375;
    float _1147 = _1131 * _1107;
    float _1149 = fma(_1143, 0.5, 0.5);
    float _1151 = _1145 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1153 = fma(_1147, -0.5, 0.5);
    float _1155 = _1135 * 0.636619746685028076171875;
    float _1157 = -_1133;
    float _1159 = fma(_1155, _1157, 1.0);
    float3 _3125 = float3(_1139, _1153, _1151);
    float _1161 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3125, float3(0.0), isnan(_3125)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3125, float3(0.0), isnan(_3125)), level(0.0)).x;
    float3 _3136 = float3(_1139, _1153, _1151);
    float4 _1164 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3136, float3(0.0), isnan(_3136)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3136, float3(0.0), isnan(_3136)), level(0.0)).xyzw;
    float _1166 = _1164.x;
    float _1168 = _1164.y;
    float _1170 = _1164.z;
    float _1172 = _1164.w;
    float2 _3153 = float2(_1159, _1149);
    float3 _1176 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3153, float2(0.0), isnan(_3153)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3153, float2(0.0), isnan(_3153)), level(0.0)).xyz;
    float _1178 = _1176.x;
    float _1180 = _1176.y;
    float _1182 = _1176.z;
    float _1184 = in.m_49.y;
    bool _1186 = _137 > 0.5;
    float _1188 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1190 = _381 + _1188;
    float _1192 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1194 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _1192;
    float _1196 = _1059 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1198 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _1200 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1202 = _1200 != 0;
    float _1204 = fma(_1067, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1196);
    int _1206 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1208 = _1206 != 0;
    float _1210 = 1.0 / _1194;
    float _1212 = fma(_1047, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1204);
    float _1214 = fma(_1085, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1212);
    float _1216 = _843 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1218 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1220 = _1184 > 0.5;
    float _1222 = _1216 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    bool _1224 = _381 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _1226 = isnan(_381);
    bool _1228 = _1224 || _1226;
    bool _1230 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _1232 = _1228 || _1230;
    float _1234 = float(_1232);
    float _1236 = -_411;
    int _1238 = _1220 ? as_type<int>(_1236) : as_type<int>(_411);
    float _1240 = _1190 * _1210;
    out.m_45.x = _1222;
    bool _1242 = _381 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _1244 = isnan(_381);
    bool _1246 = _1242 || _1244;
    bool _1248 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _1250 = _1246 || _1248;
    float _1252 = float(_1250);
    float _1254 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _1256 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _1254;
    bool _1258 = !_1202;
    float _1260 = _1258 ? _411 : as_type<float>(_1238);
    float _1262 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _1264 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _1262;
    float _1266 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _1268 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _1266;
    float _1270 = -_1252;
    float _1272 = _1270 + 1.0;
    float _1274 = -_419;
    int _1276 = _1186 ? as_type<int>(_1274) : as_type<int>(_419);
    float _1278 = fma(_1264, _1240, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _1280 = fma(_1268, _1240, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _1282 = _1234 * _1272;
    float _1284 = -_1234;
    float _1286 = _1284 + 1.0;
    bool _1288 = !_1208;
    float _1290 = _1288 ? _419 : as_type<float>(_1276);
    float _1292 = fma(_1256, _1240, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _1294 = _1278 * _1282;
    float _1296 = _1280 * _1282;
    float _1298 = -_1260;
    float _1300 = _1298 + 0.5;
    float _1302 = _1292 * _1282;
    float _1304 = fma(_1286, (*spvDescriptorSet0.vp_c9)._m0[107].x, _1294);
    float _1306 = _1063 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1308 = fma(_1286, (*spvDescriptorSet0.vp_c9)._m0[107].y, _1296);
    float _1310 = fma(_1286, (*spvDescriptorSet0.vp_c9)._m0[107].z, _1302);
    float _1312 = fma(_1252, (*spvDescriptorSet0.vp_c9)._m0[108].x, _1304);
    float _1314 = exp2(_1306);
    float _1316 = fma(_1252, (*spvDescriptorSet0.vp_c9)._m0[108].y, _1308);
    float _1318 = fma(_1252, (*spvDescriptorSet0.vp_c9)._m0[108].z, _1310);
    float _1320 = _1312 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1322 = _1290 + 0.5;
    float _1324 = _1316 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    bool _1326 = _843 > 0.0;
    bool _1328 = isnan(_843);
    bool _1330 = _1326 || _1328;
    bool _1332 = isnan(0.0);
    bool _1334 = _1330 || _1332;
    float _1336 = _1320 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1338 = _1318 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1340 = _1324 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1342 = _1214 + _1097;
    float _1344 = _1322 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1346 = _1300 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1348 = _1342 * 0.5;
    float _1350 = -_1314;
    float _1352 = _1350 + 1.0;
    out.gl_Position.x = _1127;
    out.gl_Position.y = _1131;
    out.gl_Position.z = _1214;
    out.gl_Position.w = _1097;
    float _1354 = _1344 * _1218;
    float _1356 = _1346 * _1198;
    float _1358 = _1352 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1360 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1362 = _1338 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_58.x = _1354;
    out.m_58.y = _1356;
    out.m_60.x = _1336;
    out.m_60.y = _1340;
    out.m_60.z = _1362;
    out.m_60.w = _1360;
    out.m_62.z = _1348;
    out.m_62.w = _1097;
    float _1364 = _1358 * _1161;
    float _1366 = -_1358;
    float _1368 = _1366 + 1.0;
    float _1370 = _1172 * _1364;
    float _1372 = _1182 * _1364;
    float _1374 = fma(_1178, _1370, _1166);
    float _1376 = fma(_1180, _1370, _1168);
    float _1378 = _1172 * _1368;
    float _1380 = fma(_1172, _1372, _1170);
    out.m_64.x = _1374;
    out.m_64.y = _1376;
    out.m_64.z = _1380;
    out.m_64.w = _1378;
    if (_1334)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_45.x = 0.0;
    float _1382 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1382;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

