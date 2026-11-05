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
    float4 m_58 [[user(locn0)]];
    float4 m_62 [[user(locn2)]];
    float4 m_45 [[user(locn3)]];
    float4 m_60 [[user(locn4)]];
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
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
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
        float _1527 = as_type<float>(_99);
        out.gl_Position.z = _1527;
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
        float _1595 = as_type<float>(_135);
        out.gl_Position.z = _1595;
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
    float _491 = _485 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _493 = sqrt(_487);
    float _495 = fma(_433, (*spvDescriptorSet0.vp_c8)._m0[25].x, _489);
    float _497 = fma(_461, (*spvDescriptorSet0.vp_c8)._m0[11].x, _491);
    float _499 = fma(_385, (*spvDescriptorSet0.vp_c8)._m0[25].z, _495);
    float _501 = _499 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _503 = fma(_455, (*spvDescriptorSet0.vp_c8)._m0[11].z, _497);
    float _505 = _485 + _501;
    bool _507 = _493 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _509 = _491;
    float _511 = _385;
    float _513 = _497;
    if (!_507)
    {
        _509 = _471;
    }
    float _515 = _509;
    float _517 = _515;
    if (!_507)
    {
        _511 = _467;
    }
    float _519 = _511;
    float _521 = _519;
    if (!_507)
    {
        _513 = _505;
    }
    float _523 = _513;
    bool _525 = !_507;
    float _527 = _523;
    if (!_525)
    {
        float _529 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _531 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _533 = _493 + _531;
        float _535 = rsqrt(_487);
        float _537 = _533 * _529;
        float _539 = _505 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _541 = _537 * 0.15915493667125701904296875;
        float _543 = _541 * 6.283185482025146484375;
        float _545 = cos(_543);
        float _547 = _541 * 6.283185482025146484375;
        float _549 = sin(_547);
        float _551 = _545 + (-1.0);
        float _553 = fma(_549, _539, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _555 = _551 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _557 = _535 * _553;
        float _559 = fma(_505, _545, _555);
        float _561 = fma(_481, _557, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _563 = fma(_475, _557, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _527 = _559;
        _517 = _561;
        _521 = _563;
    }
    float _565 = _527;
    float _567 = _517;
    float _569 = _521;
    float _571 = -_485;
    float _573 = _571 + _565;
    float _575 = -_461;
    float _577 = _575 + _567;
    float _579 = _503 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _581 = _485 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _583 = _573 * _573;
    float _585 = -_455;
    float _587 = _585 + _569;
    float _589 = 1.0 / _579;
    float _591 = fma(_461, (*spvDescriptorSet0.vp_c8)._m0[10].x, _581);
    float _593 = fma(_577, _577, _583);
    float _595 = fma(_455, (*spvDescriptorSet0.vp_c8)._m0[10].z, _591);
    float _597 = fma(_587, _587, _593);
    bool _599 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _601 = isnan(0.5);
    bool _603 = _599 || _601;
    bool _605 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _607 = _603 || _605;
    float _609 = _595 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _611 = sqrt(_597);
    bool _613 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _615 = isnan(0.5);
    bool _617 = _613 || _615;
    bool _619 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _621 = _617 || _619;
    float _623 = _609 + _579;
    float _625 = _623 * _589;
    float _627 = _625 * 0.5;
    float _629 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _631 = fma(_627, (*spvDescriptorSet0.vp_c8)._m0[30].w, _629);
    float _633 = 1.0 / _631;
    bool _635 = _611 > 0.0;
    bool _637 = !_635;
    float _639 = _567;
    float _641 = _569;
    float _643 = _579;
    float _645 = _565;
    float _647 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    float _649 = _587;
    float _651 = _611;
    if (!_637)
    {
        float _653 = _205 * _205;
        float _655 = fma(_195, _195, _653);
        float _657 = fma(_217, _217, _655);
        float _659 = rsqrt(_597);
        float _661 = sqrt(_657);
        float _663 = _577 * _659;
        float _665 = _573 * _659;
        float _667 = _587 * _659;
        bool _669 = _661 > 0.0;
        bool _671 = !_669;
        _643 = _661;
        _647 = _657;
        _649 = _667;
        _651 = _659;
        if (!_671)
        {
            float _673 = rsqrt(_657);
            float _675 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _677 = _205 * _673;
            float _679 = _195 * _673;
            float _681 = _665 * _677;
            float _683 = _217 * _673;
            float _685 = fma(_663, _679, _681);
            float _687 = _675 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _689 = fma(_667, _683, _685);
            float _691 = _689 * _687;
            float _693 = fma(_195, _691, _567);
            float _695 = fma(_205, _691, _565);
            float _697 = fma(_217, _691, _569);
            _639 = _693;
            _641 = _697;
            _643 = _683;
            _645 = _695;
            _647 = _673;
            _651 = _689;
        }
    }
    float _699 = _639;
    float _701 = _641;
    float _703 = _643;
    float _705 = _645;
    float _707 = _647;
    float _709 = _649;
    float _711 = _651;
    float _713 = _711;
    float _715 = _707;
    float _717 = _705;
    float _719 = _699;
    float _721 = _703;
    float _723 = _709;
    if (_621)
    {
        _713 = 1.0;
    }
    float _725 = _713;
    float _727 = _725;
    if (_607)
    {
        _253 = _699;
    }
    float _729 = _253;
    float _731 = _729;
    if (_607)
    {
        _255 = _701;
    }
    float _733 = _255;
    float _735 = _733;
    if (!_607)
    {
        float _737 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _739 = _485 + _737;
        float _741 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _743 = _461 + _741;
        float _745 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _747 = -_461;
        float _749 = _747 + _699;
        float _751 = _739 * _739;
        float _753 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _755 = _455 + _753;
        float _757 = -_485;
        float _759 = _757 + _705;
        float _761 = -_455;
        float _763 = _761 + _701;
        float _765 = fma(_743, _743, _751);
        float _767 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _769 = fma(_755, _755, _765);
        float _771 = sqrt(_769);
        float _773 = _745 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _775 = precise::min(_771, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _777 = _775 * _767;
        float _779 = _773 * _777;
        float _781 = fma(_749, _779, _461);
        float _783 = fma(_759, _779, _485);
        float _785 = fma(_763, _779, _455);
        _715 = _767;
        _717 = _783;
        _731 = _781;
        _735 = _785;
        _719 = _749;
        _721 = _745;
    }
    float _787 = _715;
    float _789 = _717;
    float _791 = _731;
    float _793 = _735;
    float _795 = _719;
    float _797 = _721;
    float _799 = _797;
    float _801 = _795;
    float _803 = _787;
    if (_621)
    {
        _799 = 1.0;
    }
    float _805 = _799;
    float _807 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _809 = _633 * _807;
    float _811 = _805;
    if (!_621)
    {
        float _813 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _815 = _813 * 0.15915493667125701904296875;
        float _817 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _819 = _815 * 6.283185482025146484375;
        float _821 = cos(_819);
        float _823 = _817 * 0.15915493667125701904296875;
        float _825 = _815 * 6.283185482025146484375;
        float _827 = sin(_825);
        float _829 = 1.0 / _821;
        float _831 = _823 * 6.283185482025146484375;
        float _833 = cos(_831);
        float _835 = _827 * _829;
        float _837 = _823 * 6.283185482025146484375;
        float _839 = sin(_837);
        float _841 = _833 * _835;
        float _843 = 1.0 / _841;
        float _845 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _847 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _845;
        float _849 = 1.0 / _847;
        float _851 = _839 * _843;
        float _853 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _855 = fma(_809, _851, _853);
        float _857 = _855 * _849;
        float _859 = precise::clamp(_857, 0.0, 1.0);
        _801 = _849;
        _727 = _859;
    }
    float _861 = _801;
    float _863 = _727;
    float _865 = _861;
    if (!_621)
    {
        float _867 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _869 = _867 * 0.15915493667125701904296875;
        float _871 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _873 = _869 * 6.283185482025146484375;
        float _875 = cos(_873);
        float _877 = _871 * 0.15915493667125701904296875;
        float _879 = _869 * 6.283185482025146484375;
        float _881 = sin(_879);
        float _883 = 1.0 / _875;
        float _885 = _877 * 6.283185482025146484375;
        float _887 = cos(_885);
        float _889 = _881 * _883;
        float _891 = _877 * 6.283185482025146484375;
        float _893 = sin(_891);
        float _895 = _887 * _889;
        float _897 = 1.0 / _895;
        float _899 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _901 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _899;
        float _903 = 1.0 / _901;
        float _905 = _893 * _897;
        float _907 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _909 = fma(_809, _905, _907);
        float _911 = _909 * _903;
        float _913 = precise::clamp(_911, 0.0, 1.0);
        float _915 = -_913;
        float _917 = _915 + 1.0;
        _803 = _883;
        _865 = _893;
        _811 = _917;
    }
    float _919 = _803;
    float _921 = _865;
    float _923 = _811;
    float _925 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _927 = _789 + _925;
    float _929 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _931 = _791 + _929;
    float _933 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _935 = _793 + _933;
    float _937 = _927 * _927;
    float _939 = fma(_931, _931, _937);
    float _941 = fma(_935, _935, _939);
    float _943 = rsqrt(_941);
    float _945 = _943 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _947 = _931 * _945;
    float _949 = _935 * _945;
    float _951 = _947 * _947;
    float _953 = _949 * _949;
    float _955 = _951 + _953;
    float _957 = sqrt(_955);
    bool _959 = _957 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _961 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _963 = _957 + _961;
    float _965 = _935;
    float _967 = _937;
    float _969 = _963;
    float _971 = _919;
    float _973 = _927;
    if (_959)
    {
        float _975 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _965 = _975;
    }
    float _977 = _965;
    if (_959)
    {
        float _979 = rsqrt(_955);
        _967 = _979;
    }
    float _981 = _967;
    float _983 = _981;
    if (_959)
    {
        float _985 = _963 * _977;
        _969 = _985;
    }
    float _987 = _969;
    if (_959)
    {
        float _989 = _987 * 0.15915493667125701904296875;
        _971 = _989;
    }
    float _991 = _971;
    float _993 = _943;
    if (_959)
    {
        float _995 = _991 * 6.283185482025146484375;
        float _997 = sin(_995);
        _993 = _997;
    }
    float _999 = _993;
    float _1001 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1003 = precise::max(0.0, _1001);
    float _1005 = _921;
    float _1007 = _1003;
    float _1009 = _1001;
    if (_959)
    {
        float _1011 = _991 * 6.283185482025146484375;
        float _1013 = cos(_1011);
        _1005 = _1013;
    }
    float _1015 = _1005;
    float _1017 = -_945;
    float _1019 = -_1003;
    float _1021 = fma(_927, _1017, _1019);
    if (_959)
    {
        float _1023 = _1021 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1007 = _1023;
    }
    float _1025 = _1007;
    float _1027 = sqrt(_941);
    float _1029 = _999;
    float _1031 = _1025;
    if (_959)
    {
        float _1033 = fma(_999, _1025, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _973 = _1033;
    }
    float _1035 = _973;
    float _1037 = _1035;
    if (!_959)
    {
        _1029 = _947;
    }
    float _1039 = _1029;
    float _1041 = _1039;
    if (!_959)
    {
        _1031 = _1021;
    }
    float _1043 = _1031;
    float _1045 = _1043;
    float _1047 = _1015;
    if (_959)
    {
        float _1049 = _1015 + (-1.0);
        _1009 = _1049;
    }
    float _1051 = _1009;
    float _1053 = _1051;
    if (_959)
    {
        float _1055 = _981 * _1035;
        _723 = _1055;
    }
    float _1057 = _723;
    if (!_959)
    {
        _1037 = _949;
    }
    float _1059 = _1037;
    float _1061 = _1059;
    if (_959)
    {
        float _1063 = _1051 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _983 = _1063;
    }
    float _1065 = _983;
    if (_959)
    {
        float _1067 = _947 * _1057;
        _1041 = _1067;
    }
    float _1069 = _1041;
    if (!_959)
    {
        _1053 = _951;
    }
    float _1071 = _1053;
    float _1073 = _1071;
    if (_959)
    {
        float _1075 = _949 * _1057;
        _1061 = _1075;
    }
    float _1077 = _1061;
    if (_959)
    {
        float _1079 = fma(_1021, _1015, _1065);
        _1045 = _1079;
    }
    float _1081 = _1045;
    if (_959)
    {
        float _1083 = _1069 * _1069;
        _1073 = _1083;
    }
    float _1085 = _1073;
    if (!_959)
    {
        _1047 = _953;
    }
    float _1087 = _1047;
    float _1089 = _1087;
    if (_959)
    {
        float _1091 = _1077 * _1077;
        _1089 = _1091;
    }
    float _1093 = _1089;
    float _1095 = fma(_1081, _1081, _1085);
    float _1097 = _789 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1099 = _789 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1101 = _1095 + _1093;
    float _1103 = fma(_791, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1097);
    float _1105 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1107 = fma(_1027, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1105);
    float _1109 = precise::clamp(_1107, 0.0, 1.0);
    float _1111 = _789 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1113 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1115 = fma(_793, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1103);
    float _1117 = rsqrt(_1101);
    float _1119 = -_1109;
    float _1121 = _1119 + 1.0;
    float _1123 = _789 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1125 = fma(_791, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1111);
    float _1127 = _1115 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1129 = fma(_791, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1099);
    float _1131 = fma(_791, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1123);
    float _1133 = fma(_793, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1125);
    float _1135 = abs(_1121);
    float _1137 = log2(_1135);
    float _1139 = _1127 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1141 = fma(_793, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1131);
    float _1143 = _1133 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1145 = fma(_793, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1129);
    float _1147 = -_1139;
    float _1149 = fma(_1147, _1113, 1.0);
    float _1151 = _1141 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1153 = _1143 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1155 = _1117 * _1069;
    float _1157 = _1117 * _1081;
    float _1159 = _1117 * _1077;
    float _1161 = fma(_1151, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1153);
    float _1163 = _1155 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1165 = _1145 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1167 = log2(_1149);
    float _1169 = fma(_1127, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1161);
    float _1171 = -_1163;
    float _1173 = fma(_1157, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1171);
    float _1175 = _1137 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1177 = fma(_1165, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1169);
    float _1179 = -_1159;
    float _1181 = fma(_1179, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1173);
    float _1183 = _1143 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1185 = _1143 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1187 = exp2(_1175);
    float _1189 = fma(_1181, -0.5, 0.5);
    float _1191 = fma(_1151, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1183);
    float _1193 = fma(_1151, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1185);
    float _1195 = fma(_1181, 0.5, 0.5);
    float _1197 = _1157 + 1.0;
    float _1199 = fma(_1127, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1191);
    float _1201 = fma(_1127, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1193);
    float _1203 = 1.0 / _1177;
    float _1205 = fma(_1195, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1207 = fma(_1165, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1199);
    float _1209 = fma(_1165, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1201);
    float _1211 = fma(_1195, _1205, -0.212114393711090087890625);
    float _1213 = sqrt(_1189);
    float _1215 = -_1157;
    float _1217 = fma(_1187, _1197, _1215);
    float _1219 = _1167 * 0.693147182464599609375;
    float _1221 = fma(_1195, _1211, 1.570728778839111328125);
    float _1223 = fma(_1217, 0.5, 0.5);
    float _1225 = _1219 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1227 = _1207 * _1203;
    float _1229 = _1209 * _1203;
    float _1231 = fma(_1227, 0.5, 0.5);
    float _1233 = fma(_1229, -0.5, 0.5);
    float _1235 = _1213 * 0.636619746685028076171875;
    float3 _3302 = float3(_1231, _1233, _1225);
    float _1237 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3302, float3(0.0), isnan(_3302)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3302, float3(0.0), isnan(_3302)), level(0.0)).x;
    float _1239 = -_1221;
    float _1241 = fma(_1235, _1239, 1.0);
    float3 _3318 = float3(_1231, _1233, _1225);
    float4 _1244 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3318, float3(0.0), isnan(_3318)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3318, float3(0.0), isnan(_3318)), level(0.0)).xyzw;
    float _1246 = _1244.x;
    float _1248 = _1244.y;
    float _1250 = _1244.z;
    float _1252 = _1244.w;
    float2 _3335 = float2(_1241, _1223);
    float3 _1256 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3335, float2(0.0), isnan(_3335)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3335, float2(0.0), isnan(_3335)), level(0.0)).xyz;
    float _1258 = _1256.x;
    float _1260 = _1256.y;
    float _1262 = _1256.z;
    float _1264 = in.m_49.y;
    bool _1266 = _137 > 0.5;
    float _1268 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1270 = _381 + _1268;
    float _1272 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1274 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _1272;
    float _1276 = _1143 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _1278 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1280 = _1278 != 0;
    float _1282 = 1.0 / _1274;
    int _1284 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1286 = _1284 != 0;
    float _1288 = fma(_1151, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1276);
    float _1290 = _1137 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1292 = fma(_1127, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1288);
    float _1294 = -_419;
    int _1296 = _1266 ? as_type<int>(_1294) : as_type<int>(_419);
    float _1298 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1300 = _863 > 0.0;
    bool _1302 = isnan(_863);
    bool _1304 = _1300 || _1302;
    bool _1306 = isnan(0.0);
    bool _1308 = _1304 || _1306;
    float _1310 = fma(_1165, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1292);
    bool _1312 = !_1280;
    float _1314 = _1312 ? _419 : as_type<float>(_1296);
    bool _1316 = _923 <= 0.0;
    bool _1318 = !_1308;
    bool _1320 = _1316 || _1318;
    float _1322 = _1270 * _1282;
    bool _1324 = _1264 > 0.5;
    float _1326 = exp2(_1290);
    float _1328 = _1314 + 0.5;
    bool _1330 = _381 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _1332 = isnan(_381);
    bool _1334 = _1330 || _1332;
    bool _1336 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _1338 = _1334 || _1336;
    float _1340 = float(_1338);
    bool _1342 = _381 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _1344 = isnan(_381);
    bool _1346 = _1342 || _1344;
    bool _1348 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _1350 = _1346 || _1348;
    float _1352 = float(_1350);
    float _1354 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _1356 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _1354;
    float _1358 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _1360 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _1358;
    float _1362 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _1364 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _1362;
    float _1366 = -_1340;
    float _1368 = _1366 + 1.0;
    float _1370 = fma(_1356, _1322, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _1372 = -_411;
    int _1374 = _1324 ? as_type<int>(_1372) : as_type<int>(_411);
    float _1376 = fma(_1364, _1322, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _1378 = _1352 * _1368;
    float _1380 = -_1352;
    float _1382 = _1380 + 1.0;
    float _1384 = fma(_1360, _1322, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    bool _1386 = !_1286;
    float _1388 = _1386 ? _411 : as_type<float>(_1374);
    float _1390 = _1376 * _1378;
    float _1392 = _1370 * _1378;
    float _1394 = _1384 * _1378;
    float _1396 = -_1326;
    float _1398 = _1396 + 1.0;
    float _1400 = fma(_1382, (*spvDescriptorSet0.vp_c9)._m0[107].y, _1390);
    float _1402 = fma(_1382, (*spvDescriptorSet0.vp_c9)._m0[107].x, _1392);
    float _1404 = fma(_1382, (*spvDescriptorSet0.vp_c9)._m0[107].z, _1394);
    float _1406 = fma(_1340, (*spvDescriptorSet0.vp_c9)._m0[108].y, _1400);
    float _1408 = fma(_1340, (*spvDescriptorSet0.vp_c9)._m0[108].x, _1402);
    float _1410 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1412 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1414 = _1406 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1416 = _863 * _923;
    float _1418 = _1408 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1420 = fma(_1340, (*spvDescriptorSet0.vp_c9)._m0[108].z, _1404);
    float _1422 = _1414 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1424 = _1416 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1426 = _1398 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1428 = _1420 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1430 = _1424 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1432 = _1310 + _1177;
    float _1434 = -_1388;
    float _1436 = _1434 + 0.5;
    float _1438 = _1418 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1440 = _1428 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1442 = _1432 * 0.5;
    float _1444 = _1328 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1446 = _1436 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1448 = -_1426;
    float _1450 = _1448 + 1.0;
    out.m_58.x = _1438;
    out.m_58.y = _1422;
    out.m_58.z = _1440;
    out.m_58.w = _1412;
    float _1452 = _1444 * _1298;
    float _1454 = _1446 * _1410;
    out.m_45.x = _1430;
    out.m_60.x = _1452;
    out.m_60.y = _1454;
    out.gl_Position.x = _1207;
    out.gl_Position.y = _1209;
    out.gl_Position.z = _1310;
    out.gl_Position.w = _1177;
    out.m_62.z = _1442;
    out.m_62.w = _1177;
    float _1456 = _1426 * _1237;
    float _1458 = _1252 * _1456;
    float _1460 = _1252 * _1450;
    float _1462 = _1262 * _1456;
    float _1464 = fma(_1258, _1458, _1246);
    float _1466 = fma(_1260, _1458, _1248);
    float _1468 = fma(_1252, _1462, _1250);
    out.m_64.x = _1464;
    out.m_64.y = _1466;
    out.m_64.z = _1468;
    out.m_64.w = _1460;
    if (!_1320)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_45.x = 0.0;
    float _1470 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1470;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
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
        float _1527 = as_type<float>(_99);
        out.gl_Position.z = _1527;
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
        float _1595 = as_type<float>(_135);
        out.gl_Position.z = _1595;
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
    float _491 = _485 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _493 = sqrt(_487);
    float _495 = fma(_433, (*spvDescriptorSet0.vp_c8)._m0[25].x, _489);
    float _497 = fma(_461, (*spvDescriptorSet0.vp_c8)._m0[11].x, _491);
    float _499 = fma(_385, (*spvDescriptorSet0.vp_c8)._m0[25].z, _495);
    float _501 = _499 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _503 = fma(_455, (*spvDescriptorSet0.vp_c8)._m0[11].z, _497);
    float _505 = _485 + _501;
    bool _507 = _493 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _509 = _491;
    float _511 = _385;
    float _513 = _497;
    if (!_507)
    {
        _509 = _471;
    }
    float _515 = _509;
    float _517 = _515;
    if (!_507)
    {
        _511 = _467;
    }
    float _519 = _511;
    float _521 = _519;
    if (!_507)
    {
        _513 = _505;
    }
    float _523 = _513;
    bool _525 = !_507;
    float _527 = _523;
    if (!_525)
    {
        float _529 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _531 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _533 = _493 + _531;
        float _535 = rsqrt(_487);
        float _537 = _533 * _529;
        float _539 = _505 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _541 = _537 * 0.15915493667125701904296875;
        float _543 = _541 * 6.283185482025146484375;
        float _545 = cos(_543);
        float _547 = _541 * 6.283185482025146484375;
        float _549 = sin(_547);
        float _551 = _545 + (-1.0);
        float _553 = fma(_549, _539, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _555 = _551 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _557 = _535 * _553;
        float _559 = fma(_505, _545, _555);
        float _561 = fma(_481, _557, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _563 = fma(_475, _557, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _527 = _559;
        _517 = _561;
        _521 = _563;
    }
    float _565 = _527;
    float _567 = _517;
    float _569 = _521;
    float _571 = -_485;
    float _573 = _571 + _565;
    float _575 = -_461;
    float _577 = _575 + _567;
    float _579 = _503 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _581 = _485 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _583 = _573 * _573;
    float _585 = -_455;
    float _587 = _585 + _569;
    float _589 = 1.0 / _579;
    float _591 = fma(_461, (*spvDescriptorSet0.vp_c8)._m0[10].x, _581);
    float _593 = fma(_577, _577, _583);
    float _595 = fma(_455, (*spvDescriptorSet0.vp_c8)._m0[10].z, _591);
    float _597 = fma(_587, _587, _593);
    bool _599 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _601 = isnan(0.5);
    bool _603 = _599 || _601;
    bool _605 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _607 = _603 || _605;
    float _609 = _595 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _611 = sqrt(_597);
    bool _613 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _615 = isnan(0.5);
    bool _617 = _613 || _615;
    bool _619 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _621 = _617 || _619;
    float _623 = _609 + _579;
    float _625 = _623 * _589;
    float _627 = _625 * 0.5;
    float _629 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _631 = fma(_627, (*spvDescriptorSet0.vp_c8)._m0[30].w, _629);
    float _633 = 1.0 / _631;
    bool _635 = _611 > 0.0;
    bool _637 = !_635;
    float _639 = _567;
    float _641 = _569;
    float _643 = _579;
    float _645 = _565;
    float _647 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    float _649 = _587;
    float _651 = _611;
    if (!_637)
    {
        float _653 = _205 * _205;
        float _655 = fma(_195, _195, _653);
        float _657 = fma(_217, _217, _655);
        float _659 = rsqrt(_597);
        float _661 = sqrt(_657);
        float _663 = _577 * _659;
        float _665 = _573 * _659;
        float _667 = _587 * _659;
        bool _669 = _661 > 0.0;
        bool _671 = !_669;
        _643 = _661;
        _647 = _657;
        _649 = _667;
        _651 = _659;
        if (!_671)
        {
            float _673 = rsqrt(_657);
            float _675 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _677 = _205 * _673;
            float _679 = _195 * _673;
            float _681 = _665 * _677;
            float _683 = _217 * _673;
            float _685 = fma(_663, _679, _681);
            float _687 = _675 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _689 = fma(_667, _683, _685);
            float _691 = _689 * _687;
            float _693 = fma(_195, _691, _567);
            float _695 = fma(_205, _691, _565);
            float _697 = fma(_217, _691, _569);
            _639 = _693;
            _641 = _697;
            _643 = _683;
            _645 = _695;
            _647 = _673;
            _651 = _689;
        }
    }
    float _699 = _639;
    float _701 = _641;
    float _703 = _643;
    float _705 = _645;
    float _707 = _647;
    float _709 = _649;
    float _711 = _651;
    float _713 = _711;
    float _715 = _707;
    float _717 = _705;
    float _719 = _699;
    float _721 = _703;
    float _723 = _709;
    if (_621)
    {
        _713 = 1.0;
    }
    float _725 = _713;
    float _727 = _725;
    if (_607)
    {
        _253 = _699;
    }
    float _729 = _253;
    float _731 = _729;
    if (_607)
    {
        _255 = _701;
    }
    float _733 = _255;
    float _735 = _733;
    if (!_607)
    {
        float _737 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _739 = _485 + _737;
        float _741 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _743 = _461 + _741;
        float _745 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _747 = -_461;
        float _749 = _747 + _699;
        float _751 = _739 * _739;
        float _753 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _755 = _455 + _753;
        float _757 = -_485;
        float _759 = _757 + _705;
        float _761 = -_455;
        float _763 = _761 + _701;
        float _765 = fma(_743, _743, _751);
        float _767 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _769 = fma(_755, _755, _765);
        float _771 = sqrt(_769);
        float _773 = _745 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _775 = precise::min(_771, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _777 = _775 * _767;
        float _779 = _773 * _777;
        float _781 = fma(_749, _779, _461);
        float _783 = fma(_759, _779, _485);
        float _785 = fma(_763, _779, _455);
        _715 = _767;
        _717 = _783;
        _731 = _781;
        _735 = _785;
        _719 = _749;
        _721 = _745;
    }
    float _787 = _715;
    float _789 = _717;
    float _791 = _731;
    float _793 = _735;
    float _795 = _719;
    float _797 = _721;
    float _799 = _797;
    float _801 = _795;
    float _803 = _787;
    if (_621)
    {
        _799 = 1.0;
    }
    float _805 = _799;
    float _807 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _809 = _633 * _807;
    float _811 = _805;
    if (!_621)
    {
        float _813 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _815 = _813 * 0.15915493667125701904296875;
        float _817 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _819 = _815 * 6.283185482025146484375;
        float _821 = cos(_819);
        float _823 = _817 * 0.15915493667125701904296875;
        float _825 = _815 * 6.283185482025146484375;
        float _827 = sin(_825);
        float _829 = 1.0 / _821;
        float _831 = _823 * 6.283185482025146484375;
        float _833 = cos(_831);
        float _835 = _827 * _829;
        float _837 = _823 * 6.283185482025146484375;
        float _839 = sin(_837);
        float _841 = _833 * _835;
        float _843 = 1.0 / _841;
        float _845 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _847 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _845;
        float _849 = 1.0 / _847;
        float _851 = _839 * _843;
        float _853 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _855 = fma(_809, _851, _853);
        float _857 = _855 * _849;
        float _859 = precise::clamp(_857, 0.0, 1.0);
        _801 = _849;
        _727 = _859;
    }
    float _861 = _801;
    float _863 = _727;
    float _865 = _861;
    if (!_621)
    {
        float _867 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _869 = _867 * 0.15915493667125701904296875;
        float _871 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _873 = _869 * 6.283185482025146484375;
        float _875 = cos(_873);
        float _877 = _871 * 0.15915493667125701904296875;
        float _879 = _869 * 6.283185482025146484375;
        float _881 = sin(_879);
        float _883 = 1.0 / _875;
        float _885 = _877 * 6.283185482025146484375;
        float _887 = cos(_885);
        float _889 = _881 * _883;
        float _891 = _877 * 6.283185482025146484375;
        float _893 = sin(_891);
        float _895 = _887 * _889;
        float _897 = 1.0 / _895;
        float _899 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _901 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _899;
        float _903 = 1.0 / _901;
        float _905 = _893 * _897;
        float _907 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _909 = fma(_809, _905, _907);
        float _911 = _909 * _903;
        float _913 = precise::clamp(_911, 0.0, 1.0);
        float _915 = -_913;
        float _917 = _915 + 1.0;
        _803 = _883;
        _865 = _893;
        _811 = _917;
    }
    float _919 = _803;
    float _921 = _865;
    float _923 = _811;
    float _925 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _927 = _789 + _925;
    float _929 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _931 = _791 + _929;
    float _933 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _935 = _793 + _933;
    float _937 = _927 * _927;
    float _939 = fma(_931, _931, _937);
    float _941 = fma(_935, _935, _939);
    float _943 = rsqrt(_941);
    float _945 = _943 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _947 = _931 * _945;
    float _949 = _935 * _945;
    float _951 = _947 * _947;
    float _953 = _949 * _949;
    float _955 = _951 + _953;
    float _957 = sqrt(_955);
    bool _959 = _957 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _961 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _963 = _957 + _961;
    float _965 = _935;
    float _967 = _937;
    float _969 = _963;
    float _971 = _919;
    float _973 = _927;
    if (_959)
    {
        float _975 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _965 = _975;
    }
    float _977 = _965;
    if (_959)
    {
        float _979 = rsqrt(_955);
        _967 = _979;
    }
    float _981 = _967;
    float _983 = _981;
    if (_959)
    {
        float _985 = _963 * _977;
        _969 = _985;
    }
    float _987 = _969;
    if (_959)
    {
        float _989 = _987 * 0.15915493667125701904296875;
        _971 = _989;
    }
    float _991 = _971;
    float _993 = _943;
    if (_959)
    {
        float _995 = _991 * 6.283185482025146484375;
        float _997 = sin(_995);
        _993 = _997;
    }
    float _999 = _993;
    float _1001 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1003 = precise::max(0.0, _1001);
    float _1005 = _921;
    float _1007 = _1003;
    float _1009 = _1001;
    if (_959)
    {
        float _1011 = _991 * 6.283185482025146484375;
        float _1013 = cos(_1011);
        _1005 = _1013;
    }
    float _1015 = _1005;
    float _1017 = -_945;
    float _1019 = -_1003;
    float _1021 = fma(_927, _1017, _1019);
    if (_959)
    {
        float _1023 = _1021 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1007 = _1023;
    }
    float _1025 = _1007;
    float _1027 = sqrt(_941);
    float _1029 = _999;
    float _1031 = _1025;
    if (_959)
    {
        float _1033 = fma(_999, _1025, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _973 = _1033;
    }
    float _1035 = _973;
    float _1037 = _1035;
    if (!_959)
    {
        _1029 = _947;
    }
    float _1039 = _1029;
    float _1041 = _1039;
    if (!_959)
    {
        _1031 = _1021;
    }
    float _1043 = _1031;
    float _1045 = _1043;
    float _1047 = _1015;
    if (_959)
    {
        float _1049 = _1015 + (-1.0);
        _1009 = _1049;
    }
    float _1051 = _1009;
    float _1053 = _1051;
    if (_959)
    {
        float _1055 = _981 * _1035;
        _723 = _1055;
    }
    float _1057 = _723;
    if (!_959)
    {
        _1037 = _949;
    }
    float _1059 = _1037;
    float _1061 = _1059;
    if (_959)
    {
        float _1063 = _1051 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _983 = _1063;
    }
    float _1065 = _983;
    if (_959)
    {
        float _1067 = _947 * _1057;
        _1041 = _1067;
    }
    float _1069 = _1041;
    if (!_959)
    {
        _1053 = _951;
    }
    float _1071 = _1053;
    float _1073 = _1071;
    if (_959)
    {
        float _1075 = _949 * _1057;
        _1061 = _1075;
    }
    float _1077 = _1061;
    if (_959)
    {
        float _1079 = fma(_1021, _1015, _1065);
        _1045 = _1079;
    }
    float _1081 = _1045;
    if (_959)
    {
        float _1083 = _1069 * _1069;
        _1073 = _1083;
    }
    float _1085 = _1073;
    if (!_959)
    {
        _1047 = _953;
    }
    float _1087 = _1047;
    float _1089 = _1087;
    if (_959)
    {
        float _1091 = _1077 * _1077;
        _1089 = _1091;
    }
    float _1093 = _1089;
    float _1095 = fma(_1081, _1081, _1085);
    float _1097 = _789 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1099 = _789 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1101 = _1095 + _1093;
    float _1103 = fma(_791, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1097);
    float _1105 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1107 = fma(_1027, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1105);
    float _1109 = precise::clamp(_1107, 0.0, 1.0);
    float _1111 = _789 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1113 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1115 = fma(_793, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1103);
    float _1117 = rsqrt(_1101);
    float _1119 = -_1109;
    float _1121 = _1119 + 1.0;
    float _1123 = _789 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1125 = fma(_791, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1111);
    float _1127 = _1115 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1129 = fma(_791, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1099);
    float _1131 = fma(_791, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1123);
    float _1133 = fma(_793, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1125);
    float _1135 = abs(_1121);
    float _1137 = log2(_1135);
    float _1139 = _1127 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1141 = fma(_793, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1131);
    float _1143 = _1133 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1145 = fma(_793, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1129);
    float _1147 = -_1139;
    float _1149 = fma(_1147, _1113, 1.0);
    float _1151 = _1141 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1153 = _1143 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1155 = _1117 * _1069;
    float _1157 = _1117 * _1081;
    float _1159 = _1117 * _1077;
    float _1161 = fma(_1151, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1153);
    float _1163 = _1155 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1165 = _1145 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1167 = log2(_1149);
    float _1169 = fma(_1127, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1161);
    float _1171 = -_1163;
    float _1173 = fma(_1157, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1171);
    float _1175 = _1137 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1177 = fma(_1165, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1169);
    float _1179 = -_1159;
    float _1181 = fma(_1179, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1173);
    float _1183 = _1143 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1185 = _1143 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1187 = exp2(_1175);
    float _1189 = fma(_1181, -0.5, 0.5);
    float _1191 = fma(_1151, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1183);
    float _1193 = fma(_1151, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1185);
    float _1195 = fma(_1181, 0.5, 0.5);
    float _1197 = _1157 + 1.0;
    float _1199 = fma(_1127, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1191);
    float _1201 = fma(_1127, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1193);
    float _1203 = 1.0 / _1177;
    float _1205 = fma(_1195, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1207 = fma(_1165, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1199);
    float _1209 = fma(_1165, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1201);
    float _1211 = fma(_1195, _1205, -0.212114393711090087890625);
    float _1213 = sqrt(_1189);
    float _1215 = -_1157;
    float _1217 = fma(_1187, _1197, _1215);
    float _1219 = _1167 * 0.693147182464599609375;
    float _1221 = fma(_1195, _1211, 1.570728778839111328125);
    float _1223 = fma(_1217, 0.5, 0.5);
    float _1225 = _1219 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1227 = _1207 * _1203;
    float _1229 = _1209 * _1203;
    float _1231 = fma(_1227, 0.5, 0.5);
    float _1233 = fma(_1229, -0.5, 0.5);
    float _1235 = _1213 * 0.636619746685028076171875;
    float3 _3302 = float3(_1231, _1233, _1225);
    float _1237 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3302, float3(0.0), isnan(_3302)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3302, float3(0.0), isnan(_3302)), level(0.0)).x;
    float _1239 = -_1221;
    float _1241 = fma(_1235, _1239, 1.0);
    float3 _3318 = float3(_1231, _1233, _1225);
    float4 _1244 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3318, float3(0.0), isnan(_3318)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3318, float3(0.0), isnan(_3318)), level(0.0)).xyzw;
    float _1246 = _1244.x;
    float _1248 = _1244.y;
    float _1250 = _1244.z;
    float _1252 = _1244.w;
    float2 _3335 = float2(_1241, _1223);
    float3 _1256 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3335, float2(0.0), isnan(_3335)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3335, float2(0.0), isnan(_3335)), level(0.0)).xyz;
    float _1258 = _1256.x;
    float _1260 = _1256.y;
    float _1262 = _1256.z;
    float _1264 = in.m_49.y;
    bool _1266 = _137 > 0.5;
    float _1268 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1270 = _381 + _1268;
    float _1272 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1274 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _1272;
    float _1276 = _1143 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _1278 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1280 = _1278 != 0;
    float _1282 = 1.0 / _1274;
    int _1284 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1286 = _1284 != 0;
    float _1288 = fma(_1151, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1276);
    float _1290 = _1137 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1292 = fma(_1127, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1288);
    float _1294 = -_419;
    int _1296 = _1266 ? as_type<int>(_1294) : as_type<int>(_419);
    float _1298 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1300 = _863 > 0.0;
    bool _1302 = isnan(_863);
    bool _1304 = _1300 || _1302;
    bool _1306 = isnan(0.0);
    bool _1308 = _1304 || _1306;
    float _1310 = fma(_1165, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1292);
    bool _1312 = !_1280;
    float _1314 = _1312 ? _419 : as_type<float>(_1296);
    bool _1316 = _923 <= 0.0;
    bool _1318 = !_1308;
    bool _1320 = _1316 || _1318;
    float _1322 = _1270 * _1282;
    bool _1324 = _1264 > 0.5;
    float _1326 = exp2(_1290);
    float _1328 = _1314 + 0.5;
    bool _1330 = _381 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _1332 = isnan(_381);
    bool _1334 = _1330 || _1332;
    bool _1336 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _1338 = _1334 || _1336;
    float _1340 = float(_1338);
    bool _1342 = _381 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _1344 = isnan(_381);
    bool _1346 = _1342 || _1344;
    bool _1348 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _1350 = _1346 || _1348;
    float _1352 = float(_1350);
    float _1354 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _1356 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _1354;
    float _1358 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _1360 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _1358;
    float _1362 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _1364 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _1362;
    float _1366 = -_1340;
    float _1368 = _1366 + 1.0;
    float _1370 = fma(_1356, _1322, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _1372 = -_411;
    int _1374 = _1324 ? as_type<int>(_1372) : as_type<int>(_411);
    float _1376 = fma(_1364, _1322, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _1378 = _1352 * _1368;
    float _1380 = -_1352;
    float _1382 = _1380 + 1.0;
    float _1384 = fma(_1360, _1322, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    bool _1386 = !_1286;
    float _1388 = _1386 ? _411 : as_type<float>(_1374);
    float _1390 = _1376 * _1378;
    float _1392 = _1370 * _1378;
    float _1394 = _1384 * _1378;
    float _1396 = -_1326;
    float _1398 = _1396 + 1.0;
    float _1400 = fma(_1382, (*spvDescriptorSet0.vp_c9)._m0[107].y, _1390);
    float _1402 = fma(_1382, (*spvDescriptorSet0.vp_c9)._m0[107].x, _1392);
    float _1404 = fma(_1382, (*spvDescriptorSet0.vp_c9)._m0[107].z, _1394);
    float _1406 = fma(_1340, (*spvDescriptorSet0.vp_c9)._m0[108].y, _1400);
    float _1408 = fma(_1340, (*spvDescriptorSet0.vp_c9)._m0[108].x, _1402);
    float _1410 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1412 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1414 = _1406 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1416 = _863 * _923;
    float _1418 = _1408 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1420 = fma(_1340, (*spvDescriptorSet0.vp_c9)._m0[108].z, _1404);
    float _1422 = _1414 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1424 = _1416 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1426 = _1398 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1428 = _1420 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1430 = _1424 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1432 = _1310 + _1177;
    float _1434 = -_1388;
    float _1436 = _1434 + 0.5;
    float _1438 = _1418 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1440 = _1428 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1442 = _1432 * 0.5;
    float _1444 = _1328 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1446 = _1436 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1448 = -_1426;
    float _1450 = _1448 + 1.0;
    out.m_58.x = _1438;
    out.m_58.y = _1422;
    out.m_58.z = _1440;
    out.m_58.w = _1412;
    float _1452 = _1444 * _1298;
    float _1454 = _1446 * _1410;
    out.m_45.x = _1430;
    out.m_60.x = _1452;
    out.m_60.y = _1454;
    out.gl_Position.x = _1207;
    out.gl_Position.y = _1209;
    out.gl_Position.z = _1310;
    out.gl_Position.w = _1177;
    out.m_62.z = _1442;
    out.m_62.w = _1177;
    float _1456 = _1426 * _1237;
    float _1458 = _1252 * _1456;
    float _1460 = _1252 * _1450;
    float _1462 = _1262 * _1456;
    float _1464 = fma(_1258, _1458, _1246);
    float _1466 = fma(_1260, _1458, _1248);
    float _1468 = fma(_1252, _1462, _1250);
    out.m_64.x = _1464;
    out.m_64.y = _1466;
    out.m_64.z = _1468;
    out.m_64.w = _1460;
    if (!_1320)
    {
        return out;
    }
    out.m_45.x = 0.0;
    float _1470 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1470;
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
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
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
        float _1527 = as_type<float>(_99);
        out.gl_Position.z = _1527;
    }
    if (!_87)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
        float _1595 = as_type<float>(_135);
        out.gl_Position.z = _1595;
    }
    if (_129)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
    float _491 = _485 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _493 = sqrt(_487);
    float _495 = fma(_433, (*spvDescriptorSet0.vp_c8)._m0[25].x, _489);
    float _497 = fma(_461, (*spvDescriptorSet0.vp_c8)._m0[11].x, _491);
    float _499 = fma(_385, (*spvDescriptorSet0.vp_c8)._m0[25].z, _495);
    float _501 = _499 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _503 = fma(_455, (*spvDescriptorSet0.vp_c8)._m0[11].z, _497);
    float _505 = _485 + _501;
    bool _507 = _493 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _509 = _491;
    float _511 = _385;
    float _513 = _497;
    if (!_507)
    {
        _509 = _471;
    }
    float _515 = _509;
    float _517 = _515;
    if (!_507)
    {
        _511 = _467;
    }
    float _519 = _511;
    float _521 = _519;
    if (!_507)
    {
        _513 = _505;
    }
    float _523 = _513;
    bool _525 = !_507;
    float _527 = _523;
    if (!_525)
    {
        float _529 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _531 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _533 = _493 + _531;
        float _535 = rsqrt(_487);
        float _537 = _533 * _529;
        float _539 = _505 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _541 = _537 * 0.15915493667125701904296875;
        float _543 = _541 * 6.283185482025146484375;
        float _545 = cos(_543);
        float _547 = _541 * 6.283185482025146484375;
        float _549 = sin(_547);
        float _551 = _545 + (-1.0);
        float _553 = fma(_549, _539, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _555 = _551 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _557 = _535 * _553;
        float _559 = fma(_505, _545, _555);
        float _561 = fma(_481, _557, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _563 = fma(_475, _557, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _527 = _559;
        _517 = _561;
        _521 = _563;
    }
    float _565 = _527;
    float _567 = _517;
    float _569 = _521;
    float _571 = -_485;
    float _573 = _571 + _565;
    float _575 = -_461;
    float _577 = _575 + _567;
    float _579 = _503 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _581 = _485 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _583 = _573 * _573;
    float _585 = -_455;
    float _587 = _585 + _569;
    float _589 = 1.0 / _579;
    float _591 = fma(_461, (*spvDescriptorSet0.vp_c8)._m0[10].x, _581);
    float _593 = fma(_577, _577, _583);
    float _595 = fma(_455, (*spvDescriptorSet0.vp_c8)._m0[10].z, _591);
    float _597 = fma(_587, _587, _593);
    bool _599 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _601 = isnan(0.5);
    bool _603 = _599 || _601;
    bool _605 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _607 = _603 || _605;
    float _609 = _595 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _611 = sqrt(_597);
    bool _613 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _615 = isnan(0.5);
    bool _617 = _613 || _615;
    bool _619 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _621 = _617 || _619;
    float _623 = _609 + _579;
    float _625 = _623 * _589;
    float _627 = _625 * 0.5;
    float _629 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _631 = fma(_627, (*spvDescriptorSet0.vp_c8)._m0[30].w, _629);
    float _633 = 1.0 / _631;
    bool _635 = _611 > 0.0;
    bool _637 = !_635;
    float _639 = _567;
    float _641 = _569;
    float _643 = _579;
    float _645 = _565;
    float _647 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    float _649 = _587;
    float _651 = _611;
    if (!_637)
    {
        float _653 = _205 * _205;
        float _655 = fma(_195, _195, _653);
        float _657 = fma(_217, _217, _655);
        float _659 = rsqrt(_597);
        float _661 = sqrt(_657);
        float _663 = _577 * _659;
        float _665 = _573 * _659;
        float _667 = _587 * _659;
        bool _669 = _661 > 0.0;
        bool _671 = !_669;
        _643 = _661;
        _647 = _657;
        _649 = _667;
        _651 = _659;
        if (!_671)
        {
            float _673 = rsqrt(_657);
            float _675 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _677 = _205 * _673;
            float _679 = _195 * _673;
            float _681 = _665 * _677;
            float _683 = _217 * _673;
            float _685 = fma(_663, _679, _681);
            float _687 = _675 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _689 = fma(_667, _683, _685);
            float _691 = _689 * _687;
            float _693 = fma(_195, _691, _567);
            float _695 = fma(_205, _691, _565);
            float _697 = fma(_217, _691, _569);
            _639 = _693;
            _641 = _697;
            _643 = _683;
            _645 = _695;
            _647 = _673;
            _651 = _689;
        }
    }
    float _699 = _639;
    float _701 = _641;
    float _703 = _643;
    float _705 = _645;
    float _707 = _647;
    float _709 = _649;
    float _711 = _651;
    float _713 = _711;
    float _715 = _707;
    float _717 = _705;
    float _719 = _699;
    float _721 = _703;
    float _723 = _709;
    if (_621)
    {
        _713 = 1.0;
    }
    float _725 = _713;
    float _727 = _725;
    if (_607)
    {
        _253 = _699;
    }
    float _729 = _253;
    float _731 = _729;
    if (_607)
    {
        _255 = _701;
    }
    float _733 = _255;
    float _735 = _733;
    if (!_607)
    {
        float _737 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _739 = _485 + _737;
        float _741 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _743 = _461 + _741;
        float _745 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _747 = -_461;
        float _749 = _747 + _699;
        float _751 = _739 * _739;
        float _753 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _755 = _455 + _753;
        float _757 = -_485;
        float _759 = _757 + _705;
        float _761 = -_455;
        float _763 = _761 + _701;
        float _765 = fma(_743, _743, _751);
        float _767 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _769 = fma(_755, _755, _765);
        float _771 = sqrt(_769);
        float _773 = _745 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _775 = precise::min(_771, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _777 = _775 * _767;
        float _779 = _773 * _777;
        float _781 = fma(_749, _779, _461);
        float _783 = fma(_759, _779, _485);
        float _785 = fma(_763, _779, _455);
        _715 = _767;
        _717 = _783;
        _731 = _781;
        _735 = _785;
        _719 = _749;
        _721 = _745;
    }
    float _787 = _715;
    float _789 = _717;
    float _791 = _731;
    float _793 = _735;
    float _795 = _719;
    float _797 = _721;
    float _799 = _797;
    float _801 = _795;
    float _803 = _787;
    if (_621)
    {
        _799 = 1.0;
    }
    float _805 = _799;
    float _807 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _809 = _633 * _807;
    float _811 = _805;
    if (!_621)
    {
        float _813 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _815 = _813 * 0.15915493667125701904296875;
        float _817 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _819 = _815 * 6.283185482025146484375;
        float _821 = cos(_819);
        float _823 = _817 * 0.15915493667125701904296875;
        float _825 = _815 * 6.283185482025146484375;
        float _827 = sin(_825);
        float _829 = 1.0 / _821;
        float _831 = _823 * 6.283185482025146484375;
        float _833 = cos(_831);
        float _835 = _827 * _829;
        float _837 = _823 * 6.283185482025146484375;
        float _839 = sin(_837);
        float _841 = _833 * _835;
        float _843 = 1.0 / _841;
        float _845 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _847 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _845;
        float _849 = 1.0 / _847;
        float _851 = _839 * _843;
        float _853 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _855 = fma(_809, _851, _853);
        float _857 = _855 * _849;
        float _859 = precise::clamp(_857, 0.0, 1.0);
        _801 = _849;
        _727 = _859;
    }
    float _861 = _801;
    float _863 = _727;
    float _865 = _861;
    if (!_621)
    {
        float _867 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _869 = _867 * 0.15915493667125701904296875;
        float _871 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _873 = _869 * 6.283185482025146484375;
        float _875 = cos(_873);
        float _877 = _871 * 0.15915493667125701904296875;
        float _879 = _869 * 6.283185482025146484375;
        float _881 = sin(_879);
        float _883 = 1.0 / _875;
        float _885 = _877 * 6.283185482025146484375;
        float _887 = cos(_885);
        float _889 = _881 * _883;
        float _891 = _877 * 6.283185482025146484375;
        float _893 = sin(_891);
        float _895 = _887 * _889;
        float _897 = 1.0 / _895;
        float _899 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _901 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _899;
        float _903 = 1.0 / _901;
        float _905 = _893 * _897;
        float _907 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _909 = fma(_809, _905, _907);
        float _911 = _909 * _903;
        float _913 = precise::clamp(_911, 0.0, 1.0);
        float _915 = -_913;
        float _917 = _915 + 1.0;
        _803 = _883;
        _865 = _893;
        _811 = _917;
    }
    float _919 = _803;
    float _921 = _865;
    float _923 = _811;
    float _925 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _927 = _789 + _925;
    float _929 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _931 = _791 + _929;
    float _933 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _935 = _793 + _933;
    float _937 = _927 * _927;
    float _939 = fma(_931, _931, _937);
    float _941 = fma(_935, _935, _939);
    float _943 = rsqrt(_941);
    float _945 = _943 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _947 = _931 * _945;
    float _949 = _935 * _945;
    float _951 = _947 * _947;
    float _953 = _949 * _949;
    float _955 = _951 + _953;
    float _957 = sqrt(_955);
    bool _959 = _957 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _961 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _963 = _957 + _961;
    float _965 = _935;
    float _967 = _937;
    float _969 = _963;
    float _971 = _919;
    float _973 = _927;
    if (_959)
    {
        float _975 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _965 = _975;
    }
    float _977 = _965;
    if (_959)
    {
        float _979 = rsqrt(_955);
        _967 = _979;
    }
    float _981 = _967;
    float _983 = _981;
    if (_959)
    {
        float _985 = _963 * _977;
        _969 = _985;
    }
    float _987 = _969;
    if (_959)
    {
        float _989 = _987 * 0.15915493667125701904296875;
        _971 = _989;
    }
    float _991 = _971;
    float _993 = _943;
    if (_959)
    {
        float _995 = _991 * 6.283185482025146484375;
        float _997 = sin(_995);
        _993 = _997;
    }
    float _999 = _993;
    float _1001 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1003 = precise::max(0.0, _1001);
    float _1005 = _921;
    float _1007 = _1003;
    float _1009 = _1001;
    if (_959)
    {
        float _1011 = _991 * 6.283185482025146484375;
        float _1013 = cos(_1011);
        _1005 = _1013;
    }
    float _1015 = _1005;
    float _1017 = -_945;
    float _1019 = -_1003;
    float _1021 = fma(_927, _1017, _1019);
    if (_959)
    {
        float _1023 = _1021 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1007 = _1023;
    }
    float _1025 = _1007;
    float _1027 = sqrt(_941);
    float _1029 = _999;
    float _1031 = _1025;
    if (_959)
    {
        float _1033 = fma(_999, _1025, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _973 = _1033;
    }
    float _1035 = _973;
    float _1037 = _1035;
    if (!_959)
    {
        _1029 = _947;
    }
    float _1039 = _1029;
    float _1041 = _1039;
    if (!_959)
    {
        _1031 = _1021;
    }
    float _1043 = _1031;
    float _1045 = _1043;
    float _1047 = _1015;
    if (_959)
    {
        float _1049 = _1015 + (-1.0);
        _1009 = _1049;
    }
    float _1051 = _1009;
    float _1053 = _1051;
    if (_959)
    {
        float _1055 = _981 * _1035;
        _723 = _1055;
    }
    float _1057 = _723;
    if (!_959)
    {
        _1037 = _949;
    }
    float _1059 = _1037;
    float _1061 = _1059;
    if (_959)
    {
        float _1063 = _1051 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _983 = _1063;
    }
    float _1065 = _983;
    if (_959)
    {
        float _1067 = _947 * _1057;
        _1041 = _1067;
    }
    float _1069 = _1041;
    if (!_959)
    {
        _1053 = _951;
    }
    float _1071 = _1053;
    float _1073 = _1071;
    if (_959)
    {
        float _1075 = _949 * _1057;
        _1061 = _1075;
    }
    float _1077 = _1061;
    if (_959)
    {
        float _1079 = fma(_1021, _1015, _1065);
        _1045 = _1079;
    }
    float _1081 = _1045;
    if (_959)
    {
        float _1083 = _1069 * _1069;
        _1073 = _1083;
    }
    float _1085 = _1073;
    if (!_959)
    {
        _1047 = _953;
    }
    float _1087 = _1047;
    float _1089 = _1087;
    if (_959)
    {
        float _1091 = _1077 * _1077;
        _1089 = _1091;
    }
    float _1093 = _1089;
    float _1095 = fma(_1081, _1081, _1085);
    float _1097 = _789 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1099 = _789 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1101 = _1095 + _1093;
    float _1103 = fma(_791, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1097);
    float _1105 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1107 = fma(_1027, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1105);
    float _1109 = precise::clamp(_1107, 0.0, 1.0);
    float _1111 = _789 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1113 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1115 = fma(_793, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1103);
    float _1117 = rsqrt(_1101);
    float _1119 = -_1109;
    float _1121 = _1119 + 1.0;
    float _1123 = _789 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1125 = fma(_791, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1111);
    float _1127 = _1115 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1129 = fma(_791, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1099);
    float _1131 = fma(_791, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1123);
    float _1133 = fma(_793, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1125);
    float _1135 = abs(_1121);
    float _1137 = log2(_1135);
    float _1139 = _1127 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1141 = fma(_793, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1131);
    float _1143 = _1133 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1145 = fma(_793, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1129);
    float _1147 = -_1139;
    float _1149 = fma(_1147, _1113, 1.0);
    float _1151 = _1141 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1153 = _1143 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1155 = _1117 * _1069;
    float _1157 = _1117 * _1081;
    float _1159 = _1117 * _1077;
    float _1161 = fma(_1151, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1153);
    float _1163 = _1155 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1165 = _1145 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1167 = log2(_1149);
    float _1169 = fma(_1127, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1161);
    float _1171 = -_1163;
    float _1173 = fma(_1157, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1171);
    float _1175 = _1137 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1177 = fma(_1165, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1169);
    float _1179 = -_1159;
    float _1181 = fma(_1179, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1173);
    float _1183 = _1143 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1185 = _1143 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1187 = exp2(_1175);
    float _1189 = fma(_1181, -0.5, 0.5);
    float _1191 = fma(_1151, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1183);
    float _1193 = fma(_1151, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1185);
    float _1195 = fma(_1181, 0.5, 0.5);
    float _1197 = _1157 + 1.0;
    float _1199 = fma(_1127, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1191);
    float _1201 = fma(_1127, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1193);
    float _1203 = 1.0 / _1177;
    float _1205 = fma(_1195, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1207 = fma(_1165, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1199);
    float _1209 = fma(_1165, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1201);
    float _1211 = fma(_1195, _1205, -0.212114393711090087890625);
    float _1213 = sqrt(_1189);
    float _1215 = -_1157;
    float _1217 = fma(_1187, _1197, _1215);
    float _1219 = _1167 * 0.693147182464599609375;
    float _1221 = fma(_1195, _1211, 1.570728778839111328125);
    float _1223 = fma(_1217, 0.5, 0.5);
    float _1225 = _1219 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1227 = _1207 * _1203;
    float _1229 = _1209 * _1203;
    float _1231 = fma(_1227, 0.5, 0.5);
    float _1233 = fma(_1229, -0.5, 0.5);
    float _1235 = _1213 * 0.636619746685028076171875;
    float3 _3302 = float3(_1231, _1233, _1225);
    float _1237 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3302, float3(0.0), isnan(_3302)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3302, float3(0.0), isnan(_3302)), level(0.0)).x;
    float _1239 = -_1221;
    float _1241 = fma(_1235, _1239, 1.0);
    float3 _3318 = float3(_1231, _1233, _1225);
    float4 _1244 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3318, float3(0.0), isnan(_3318)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3318, float3(0.0), isnan(_3318)), level(0.0)).xyzw;
    float _1246 = _1244.x;
    float _1248 = _1244.y;
    float _1250 = _1244.z;
    float _1252 = _1244.w;
    float2 _3335 = float2(_1241, _1223);
    float3 _1256 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3335, float2(0.0), isnan(_3335)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3335, float2(0.0), isnan(_3335)), level(0.0)).xyz;
    float _1258 = _1256.x;
    float _1260 = _1256.y;
    float _1262 = _1256.z;
    float _1264 = in.m_49.y;
    bool _1266 = _137 > 0.5;
    float _1268 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1270 = _381 + _1268;
    float _1272 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1274 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _1272;
    float _1276 = _1143 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _1278 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1280 = _1278 != 0;
    float _1282 = 1.0 / _1274;
    int _1284 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1286 = _1284 != 0;
    float _1288 = fma(_1151, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1276);
    float _1290 = _1137 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1292 = fma(_1127, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1288);
    float _1294 = -_419;
    int _1296 = _1266 ? as_type<int>(_1294) : as_type<int>(_419);
    float _1298 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1300 = _863 > 0.0;
    bool _1302 = isnan(_863);
    bool _1304 = _1300 || _1302;
    bool _1306 = isnan(0.0);
    bool _1308 = _1304 || _1306;
    float _1310 = fma(_1165, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1292);
    bool _1312 = !_1280;
    float _1314 = _1312 ? _419 : as_type<float>(_1296);
    bool _1316 = _923 <= 0.0;
    bool _1318 = !_1308;
    bool _1320 = _1316 || _1318;
    float _1322 = _1270 * _1282;
    bool _1324 = _1264 > 0.5;
    float _1326 = exp2(_1290);
    float _1328 = _1314 + 0.5;
    bool _1330 = _381 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _1332 = isnan(_381);
    bool _1334 = _1330 || _1332;
    bool _1336 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _1338 = _1334 || _1336;
    float _1340 = float(_1338);
    bool _1342 = _381 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _1344 = isnan(_381);
    bool _1346 = _1342 || _1344;
    bool _1348 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _1350 = _1346 || _1348;
    float _1352 = float(_1350);
    float _1354 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _1356 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _1354;
    float _1358 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _1360 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _1358;
    float _1362 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _1364 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _1362;
    float _1366 = -_1340;
    float _1368 = _1366 + 1.0;
    float _1370 = fma(_1356, _1322, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _1372 = -_411;
    int _1374 = _1324 ? as_type<int>(_1372) : as_type<int>(_411);
    float _1376 = fma(_1364, _1322, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _1378 = _1352 * _1368;
    float _1380 = -_1352;
    float _1382 = _1380 + 1.0;
    float _1384 = fma(_1360, _1322, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    bool _1386 = !_1286;
    float _1388 = _1386 ? _411 : as_type<float>(_1374);
    float _1390 = _1376 * _1378;
    float _1392 = _1370 * _1378;
    float _1394 = _1384 * _1378;
    float _1396 = -_1326;
    float _1398 = _1396 + 1.0;
    float _1400 = fma(_1382, (*spvDescriptorSet0.vp_c9)._m0[107].y, _1390);
    float _1402 = fma(_1382, (*spvDescriptorSet0.vp_c9)._m0[107].x, _1392);
    float _1404 = fma(_1382, (*spvDescriptorSet0.vp_c9)._m0[107].z, _1394);
    float _1406 = fma(_1340, (*spvDescriptorSet0.vp_c9)._m0[108].y, _1400);
    float _1408 = fma(_1340, (*spvDescriptorSet0.vp_c9)._m0[108].x, _1402);
    float _1410 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1412 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1414 = _1406 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1416 = _863 * _923;
    float _1418 = _1408 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1420 = fma(_1340, (*spvDescriptorSet0.vp_c9)._m0[108].z, _1404);
    float _1422 = _1414 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1424 = _1416 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1426 = _1398 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1428 = _1420 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1430 = _1424 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1432 = _1310 + _1177;
    float _1434 = -_1388;
    float _1436 = _1434 + 0.5;
    float _1438 = _1418 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1440 = _1428 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1442 = _1432 * 0.5;
    float _1444 = _1328 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1446 = _1436 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1448 = -_1426;
    float _1450 = _1448 + 1.0;
    out.m_58.x = _1438;
    out.m_58.y = _1422;
    out.m_58.z = _1440;
    out.m_58.w = _1412;
    float _1452 = _1444 * _1298;
    float _1454 = _1446 * _1410;
    out.m_45.x = _1430;
    out.m_60.x = _1452;
    out.m_60.y = _1454;
    out.gl_Position.x = _1207;
    out.gl_Position.y = _1209;
    out.gl_Position.z = _1310;
    out.gl_Position.w = _1177;
    out.m_62.z = _1442;
    out.m_62.w = _1177;
    float _1456 = _1426 * _1237;
    float _1458 = _1252 * _1456;
    float _1460 = _1252 * _1450;
    float _1462 = _1262 * _1456;
    float _1464 = fma(_1258, _1458, _1246);
    float _1466 = fma(_1260, _1458, _1248);
    float _1468 = fma(_1252, _1462, _1250);
    out.m_64.x = _1464;
    out.m_64.y = _1466;
    out.m_64.z = _1468;
    out.m_64.w = _1460;
    if (!_1320)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_45.x = 0.0;
    float _1470 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1470;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

