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
    bool _419 = false;
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
    if (!_87)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1568 = as_type<float>(_99);
        out.gl_Position.z = _1568;
    }
    if (!_87)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _101 = in.m_47.w;
    bool _103 = _101 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _105 = isnan(_101);
    bool _107 = _103 || _105;
    bool _109 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _111 = _107 || _109;
    float _113 = -_101;
    float _115 = _113 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_111)
    {
        float _117 = float(_83);
        _93 = _117;
    }
    float _119 = _93;
    bool _121 = _115 >= _119;
    bool _123 = !_111;
    bool _125 = _121 || _123;
    float _127 = _119;
    if (_125)
    {
        _127 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _129 = _127;
    if (_125)
    {
        out.m_45.x = 0.0;
    }
    int _131 = 0;
    if (_125)
    {
        float _133 = _129 * 5.0;
        _131 = as_type<int>(_133);
    }
    int _135 = _131;
    if (_125)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1637 = as_type<float>(_135);
        out.gl_Position.z = _1637;
    }
    if (_125)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _137 = in.m_49.x;
    float _139 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _141 = _115 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
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
    bool _183 = !_167;
    int _185 = _183 ? 0 : 1;
    float _187 = fma(_143, (*spvDescriptorSet0.vp_c10)._m0[5].x, _171);
    float _189 = _173 * 6.283185482025146484375;
    float _191 = cos(_189);
    float _193 = fma(_143, (*spvDescriptorSet0.vp_c10)._m0[6].x, _175);
    float _195 = fma(_147, (*spvDescriptorSet0.vp_c10)._m0[4].z, _181);
    int _197 = abs(_185);
    float _199 = -_157;
    float _201 = _155 + _199;
    int _203 = abs(_179);
    bool _205 = !_153;
    int _207 = _205 ? 0 : 1;
    float _209 = -_201;
    float _211 = fma(_209, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _213 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _215 = abs(_207);
    float _217 = float(_203);
    float _219 = fma(_191, 0.5, 0.5);
    bool _221 = _201 < 0.5;
    float _223 = float(_221);
    float _225 = abs(_211);
    float _227 = _217 * _225;
    float _229 = -_219;
    float _231 = fma(_229, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _233 = float(_215);
    float _235 = -_223;
    float _237 = fma(_235, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _239 = float(_197);
    float _241 = fma(_233, _231, _227);
    float _243 = fma(_147, (*spvDescriptorSet0.vp_c10)._m0[5].z, _187);
    float _245 = fma(_147, (*spvDescriptorSet0.vp_c10)._m0[6].z, _193);
    float _247 = abs(_237);
    float _249 = fma(_239, _247, _241);
    bool _251 = !_213;
    float _253 = _243;
    float _255 = _195;
    float _271;
    if (!_251)
    {
        float _257 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _259 = _137 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _261 = fma(_259, (*spvDescriptorSet0.vp_c9)._m0[12].x, _115);
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
        float _279 = _115 * _277;
        _271 = _279;
    }
    _273 = false;
    float _281 = _271;
    float _283 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _285 = _281 + _283;
    bool _287 = _281 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _289 = isnan(_281);
    bool _291 = _287 || _289;
    bool _293 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _295 = _291 || _293;
    float _297 = float(_295);
    bool _299 = _281 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _301 = isnan(_281);
    bool _303 = _299 || _301;
    bool _305 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _307 = _303 || _305;
    float _309 = float(_307);
    float _311 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _313 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _311;
    float _315 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _317 = _315 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _319 = -_297;
    float _321 = _319 + 1.0;
    float _323 = 1.0 / _313;
    bool _325 = _281 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _327 = isnan(_281);
    bool _329 = _325 || _327;
    bool _331 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _333 = _329 || _331;
    float _335 = float(_333);
    float _337 = _309 * _321;
    float _339 = -_309;
    float _341 = _339 + 1.0;
    bool _343 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _345 = _335 * _341;
    float _347 = 1.0 / _317;
    float _349 = -_335;
    float _351 = _349 + 1.0;
    float _353 = _285 * _323;
    float _355 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _357 = _281 + _355;
    float _359 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _361 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _359;
    float _363 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _365 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _363;
    float _367 = fma(_361, _353, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _369 = fma(_365, _353, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _371 = _357 * _347;
    float _373 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _375 = _373 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _377 = _367 * _345;
    float _379 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _381 = _379 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _383 = _369 * _345;
    float _385 = fma(_375, _371, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _387 = fma(_351, (*spvDescriptorSet0.vp_c9)._m0[143].x, _377);
    float _389 = fma(_381, _371, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _391 = fma(_351, (*spvDescriptorSet0.vp_c9)._m0[143].y, _383);
    float _393 = fma(_385, _337, _387);
    float _395 = fma(_389, _337, _391);
    float _397 = fma(_297, (*spvDescriptorSet0.vp_c9)._m0[145].x, _393);
    float _399 = fma(_297, (*spvDescriptorSet0.vp_c9)._m0[145].y, _395);
    bool _401 = !_343;
    float _417;
    if (!_401)
    {
        float _403 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _405 = _137 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _407 = fma(_405, (*spvDescriptorSet0.vp_c9)._m0[11].x, _115);
        float _409 = _407 * _403;
        float _411 = floor(_409);
        float _413 = -_411;
        float _415 = _409 + _413;
        _417 = _415;
        _419 = true;
    }
    else
    {
        float _421 = float(_83);
        float _423 = 1.0 / _421;
        float _425 = _115 * _423;
        _417 = _425;
    }
    _419 = false;
    float _427 = _417;
    float _429 = as_type<float>(int(gl_VertexIndex));
    float _431 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _433 = in.m_56.x;
    float _435 = in.m_56.y;
    float _437 = in.m_42.x;
    float _439 = in.m_42.y;
    float _441 = in.m_42.z;
    int _443 = as_type<int>(_429) & 1;
    bool _445 = _443 != 0;
    int _447 = as_type<int>(_429) & 2;
    bool _449 = _447 != 0;
    float _451 = _399 * _435;
    float _453 = _397 * _433;
    bool _455 = !_449;
    float _457 = _455 ? (-0.5) : 0.5;
    float _459 = _249 * _451;
    bool _461 = !_445;
    float _463 = _461 ? (-0.5) : 0.5;
    float _465 = _249 * _453;
    float _467 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _457);
    float _469 = _459 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _471 = _465 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _473 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _463);
    float _475 = _469 * _467;
    float _477 = _439 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _479 = _471 * _473;
    float _481 = _475 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _483 = _439 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _485 = fma(_437, (*spvDescriptorSet0.vp_c10)._m0[6].x, _477);
    float _487 = _475 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _489 = fma(_479, (*spvDescriptorSet0.vp_c8)._m0[26].x, _481);
    float _491 = fma(_437, (*spvDescriptorSet0.vp_c10)._m0[4].x, _483);
    float _493 = fma(_441, (*spvDescriptorSet0.vp_c10)._m0[6].z, _485);
    float _495 = fma(_479, (*spvDescriptorSet0.vp_c8)._m0[24].x, _487);
    float _497 = fma(_431, (*spvDescriptorSet0.vp_c8)._m0[26].z, _489);
    float _499 = fma(_441, (*spvDescriptorSet0.vp_c10)._m0[4].z, _491);
    float _501 = _493 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _503 = fma(_431, (*spvDescriptorSet0.vp_c8)._m0[24].z, _495);
    float _505 = _497 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _507 = _499 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _509 = _439 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _511 = _503 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _513 = _501 + _505;
    float _515 = fma(_437, (*spvDescriptorSet0.vp_c10)._m0[5].x, _509);
    float _517 = _507 + _511;
    float _519 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _521 = _513 + _519;
    float _523 = fma(_441, (*spvDescriptorSet0.vp_c10)._m0[5].z, _515);
    float _525 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _527 = _517 + _525;
    float _529 = _521 * _521;
    float _531 = _523 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _533 = fma(_527, _527, _529);
    float _535 = _475 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _537 = _531 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _539 = sqrt(_533);
    float _541 = fma(_479, (*spvDescriptorSet0.vp_c8)._m0[25].x, _535);
    float _543 = fma(_507, (*spvDescriptorSet0.vp_c8)._m0[11].x, _537);
    float _545 = fma(_431, (*spvDescriptorSet0.vp_c8)._m0[25].z, _541);
    float _547 = fma(_501, (*spvDescriptorSet0.vp_c8)._m0[11].z, _543);
    float _549 = _545 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _551 = _531 + _549;
    bool _553 = _539 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _555 = _545;
    float _557 = _543;
    float _559 = _515;
    if (!_553)
    {
        _555 = _517;
    }
    float _561 = _555;
    float _563 = _561;
    if (!_553)
    {
        _557 = _513;
    }
    float _565 = _557;
    float _567 = _565;
    if (!_553)
    {
        _559 = _551;
    }
    float _569 = _559;
    bool _571 = !_553;
    float _573 = _569;
    if (!_571)
    {
        float _575 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _577 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _579 = _539 + _577;
        float _581 = rsqrt(_533);
        float _583 = _579 * _575;
        float _585 = _551 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _587 = _583 * 0.15915493667125701904296875;
        float _589 = _587 * 6.283185482025146484375;
        float _591 = cos(_589);
        float _593 = _587 * 6.283185482025146484375;
        float _595 = sin(_593);
        float _597 = _591 + (-1.0);
        float _599 = fma(_595, _585, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _601 = _597 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _603 = _581 * _599;
        float _605 = fma(_551, _591, _601);
        float _607 = fma(_527, _603, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _609 = fma(_521, _603, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _573 = _605;
        _563 = _607;
        _567 = _609;
    }
    float _611 = _573;
    float _613 = _563;
    float _615 = _567;
    float _617 = -_531;
    float _619 = _617 + _611;
    float _621 = -_507;
    float _623 = _621 + _613;
    float _625 = _547 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _627 = _531 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _629 = _619 * _619;
    float _631 = -_501;
    float _633 = _631 + _615;
    float _635 = 1.0 / _625;
    float _637 = fma(_507, (*spvDescriptorSet0.vp_c8)._m0[10].x, _627);
    float _639 = fma(_623, _623, _629);
    float _641 = fma(_501, (*spvDescriptorSet0.vp_c8)._m0[10].z, _637);
    float _643 = fma(_633, _633, _639);
    bool _645 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _647 = isnan(0.5);
    bool _649 = _645 || _647;
    bool _651 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _653 = _649 || _651;
    float _655 = _641 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _657 = sqrt(_643);
    bool _659 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _661 = isnan(0.5);
    bool _663 = _659 || _661;
    bool _665 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _667 = _663 || _665;
    float _669 = _655 + _625;
    float _671 = _669 * _635;
    float _673 = _671 * 0.5;
    float _675 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _677 = fma(_673, (*spvDescriptorSet0.vp_c8)._m0[30].w, _675);
    float _679 = 1.0 / _677;
    bool _681 = _657 > 0.0;
    bool _683 = !_681;
    float _685 = _613;
    float _687 = _615;
    float _689 = _611;
    float _691 = _657;
    float _693 = _635;
    float _695 = _677;
    if (!_683)
    {
        float _697 = _243 * _243;
        float _699 = fma(_195, _195, _697);
        float _701 = fma(_245, _245, _699);
        float _703 = rsqrt(_643);
        float _705 = sqrt(_701);
        float _707 = _623 * _703;
        float _709 = _619 * _703;
        float _711 = _633 * _703;
        bool _713 = _705 > 0.0;
        bool _715 = !_713;
        _691 = _703;
        _695 = _705;
        if (!_715)
        {
            float _717 = rsqrt(_701);
            float _719 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _721 = _243 * _717;
            float _723 = _195 * _717;
            float _725 = _709 * _721;
            float _727 = _245 * _717;
            float _729 = fma(_707, _723, _725);
            float _731 = _719 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _733 = fma(_711, _727, _729);
            float _735 = _733 * _731;
            float _737 = fma(_195, _735, _613);
            float _739 = fma(_243, _735, _611);
            float _741 = fma(_245, _735, _615);
            _685 = _737;
            _687 = _741;
            _689 = _739;
            _691 = _735;
            _693 = _719;
            _695 = _727;
        }
    }
    float _743 = _685;
    float _745 = _687;
    float _747 = _689;
    float _749 = _691;
    float _751 = _693;
    float _753 = _695;
    float _755 = _749;
    float _757 = _747;
    float _759 = _751;
    float _761 = _745;
    float _763 = _753;
    float _765 = _743;
    if (_667)
    {
        _755 = 1.0;
    }
    float _767 = _755;
    float _769 = _767;
    if (_653)
    {
        _253 = _743;
    }
    float _771 = _253;
    float _773 = _771;
    if (_653)
    {
        _255 = _745;
    }
    float _775 = _255;
    float _777 = _775;
    if (!_653)
    {
        float _779 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _781 = _531 + _779;
        float _783 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _785 = _507 + _783;
        float _787 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _789 = -_531;
        float _791 = _789 + _747;
        float _793 = _781 * _781;
        float _795 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _797 = _501 + _795;
        float _799 = -_501;
        float _801 = _799 + _745;
        float _803 = fma(_785, _785, _793);
        float _805 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _807 = fma(_797, _797, _803);
        float _809 = sqrt(_807);
        float _811 = _787 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _813 = precise::min(_809, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _815 = _813 * _805;
        float _817 = -_507;
        float _819 = _817 + _743;
        float _821 = _811 * _815;
        float _823 = fma(_819, _821, _507);
        float _825 = fma(_791, _821, _531);
        float _827 = fma(_801, _821, _501);
        _757 = _825;
        _773 = _823;
        _777 = _827;
        _759 = _805;
        _761 = _801;
    }
    float _829 = _757;
    float _831 = _773;
    float _833 = _777;
    float _835 = _759;
    float _837 = _761;
    float _839 = _837;
    float _841 = _835;
    if (_667)
    {
        _763 = 1.0;
    }
    float _843 = _763;
    float _845 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _847 = _679 * _845;
    float _849 = _843;
    if (!_667)
    {
        float _851 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _853 = _851 * 0.15915493667125701904296875;
        float _855 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _857 = _853 * 6.283185482025146484375;
        float _859 = cos(_857);
        float _861 = _855 * 0.15915493667125701904296875;
        float _863 = _853 * 6.283185482025146484375;
        float _865 = sin(_863);
        float _867 = 1.0 / _859;
        float _869 = _861 * 6.283185482025146484375;
        float _871 = cos(_869);
        float _873 = _865 * _867;
        float _875 = _861 * 6.283185482025146484375;
        float _877 = sin(_875);
        float _879 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _881 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _879;
        float _883 = _871 * _873;
        float _885 = 1.0 / _881;
        float _887 = 1.0 / _883;
        float _889 = _877 * _887;
        float _891 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _893 = fma(_847, _889, _891);
        float _895 = _893 * _885;
        float _897 = precise::clamp(_895, 0.0, 1.0);
        _765 = _885;
        _839 = _887;
        _769 = _897;
    }
    float _899 = _765;
    float _901 = _839;
    float _903 = _769;
    float _905 = _901;
    float _907 = _899;
    if (!_667)
    {
        float _909 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _911 = _909 * 0.15915493667125701904296875;
        float _913 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _915 = _911 * 6.283185482025146484375;
        float _917 = cos(_915);
        float _919 = _913 * 0.15915493667125701904296875;
        float _921 = _911 * 6.283185482025146484375;
        float _923 = sin(_921);
        float _925 = 1.0 / _917;
        float _927 = _919 * 6.283185482025146484375;
        float _929 = cos(_927);
        float _931 = _923 * _925;
        float _933 = _919 * 6.283185482025146484375;
        float _935 = sin(_933);
        float _937 = _929 * _931;
        float _939 = 1.0 / _937;
        float _941 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _943 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _941;
        float _945 = 1.0 / _943;
        float _947 = _935 * _939;
        float _949 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _951 = fma(_847, _947, _949);
        float _953 = _951 * _945;
        float _955 = precise::clamp(_953, 0.0, 1.0);
        float _957 = -_955;
        float _959 = _957 + 1.0;
        _841 = _947;
        _905 = _911;
        _907 = _925;
        _849 = _959;
    }
    float _961 = _841;
    float _963 = _905;
    float _965 = _907;
    float _967 = _849;
    float _969 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _971 = _829 + _969;
    float _973 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _975 = _831 + _973;
    float _977 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _979 = _833 + _977;
    float _981 = _971 * _971;
    float _983 = fma(_975, _975, _981);
    float _985 = fma(_979, _979, _983);
    float _987 = rsqrt(_985);
    float _989 = _987 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _991 = _975 * _989;
    float _993 = _979 * _989;
    float _995 = _991 * _991;
    float _997 = _993 * _993;
    float _999 = _995 + _997;
    float _1001 = sqrt(_999);
    bool _1003 = _1001 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1005 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1007 = _1001 + _1005;
    float _1009 = _979;
    float _1011 = _981;
    float _1013 = _1007;
    float _1015 = _961;
    float _1017 = _971;
    float _1019 = _965;
    float _1021 = _991;
    if (_1003)
    {
        float _1023 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1009 = _1023;
    }
    float _1025 = _1009;
    if (_1003)
    {
        float _1027 = rsqrt(_999);
        _1011 = _1027;
    }
    float _1029 = _1011;
    float _1031 = _1029;
    if (_1003)
    {
        float _1033 = _1007 * _1025;
        _1013 = _1033;
    }
    float _1035 = _1013;
    if (_1003)
    {
        float _1037 = _1035 * 0.15915493667125701904296875;
        _1015 = _1037;
    }
    float _1039 = _1015;
    float _1041 = _1025;
    if (_1003)
    {
        float _1043 = _1039 * 6.283185482025146484375;
        float _1045 = sin(_1043);
        _1041 = _1045;
    }
    float _1047 = _1041;
    float _1049 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1051 = precise::max(0.0, _1049);
    float _1053 = _963;
    float _1055 = _1051;
    if (_1003)
    {
        float _1057 = _1039 * 6.283185482025146484375;
        float _1059 = cos(_1057);
        _1053 = _1059;
    }
    float _1061 = _1053;
    float _1063 = -_989;
    float _1065 = -_1051;
    float _1067 = fma(_971, _1063, _1065);
    if (!_1003)
    {
        _1017 = _993;
    }
    float _1069 = _1017;
    float _1071 = _1069;
    if (_1003)
    {
        float _1073 = _1067 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1055 = _1073;
    }
    float _1075 = _1055;
    float _1077 = _1047;
    float _1079 = _1075;
    if (_1003)
    {
        float _1081 = fma(_1047, _1075, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1019 = _1081;
    }
    float _1083 = _1019;
    if (!_1003)
    {
        _1077 = _1067;
    }
    float _1085 = _1077;
    float _1087 = _1085;
    float _1089 = _1061;
    if (_1003)
    {
        float _1091 = _1061 + (-1.0);
        _1079 = _1091;
    }
    float _1093 = _1079;
    float _1095 = 0.0;
    float _1097 = _1093;
    if (_1003)
    {
        float _1099 = _1029 * _1083;
        _1095 = _1099;
    }
    float _1101 = _1095;
    float _1103 = sqrt(_985);
    if (_1003)
    {
        float _1105 = _1093 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1031 = _1105;
    }
    float _1107 = _1031;
    if (_1003)
    {
        float _1109 = _991 * _1101;
        _1021 = _1109;
    }
    float _1111 = _1021;
    if (!_1003)
    {
        _1097 = _995;
    }
    float _1113 = _1097;
    float _1115 = _1113;
    if (_1003)
    {
        float _1117 = _993 * _1101;
        _1071 = _1117;
    }
    float _1119 = _1071;
    if (_1003)
    {
        float _1121 = fma(_1067, _1061, _1107);
        _1087 = _1121;
    }
    float _1123 = _1087;
    if (_1003)
    {
        float _1125 = _1111 * _1111;
        _1115 = _1125;
    }
    float _1127 = _1115;
    if (!_1003)
    {
        _1089 = _997;
    }
    float _1129 = _1089;
    float _1131 = _1129;
    if (_1003)
    {
        float _1133 = _1119 * _1119;
        _1131 = _1133;
    }
    float _1135 = _1131;
    float _1137 = fma(_1123, _1123, _1127);
    float _1139 = _1137 + _1135;
    float _1141 = _829 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1143 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1145 = fma(_1103, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1143);
    float _1147 = precise::clamp(_1145, 0.0, 1.0);
    float _1149 = _829 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1151 = rsqrt(_1139);
    float _1153 = fma(_831, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1141);
    float _1155 = _829 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1157 = _829 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1159 = -_1147;
    float _1161 = _1159 + 1.0;
    float _1163 = fma(_833, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1153);
    float _1165 = fma(_831, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1149);
    float _1167 = fma(_831, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1155);
    float _1169 = fma(_831, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1157);
    float _1171 = _1163 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1173 = fma(_833, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1165);
    float _1175 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1177 = fma(_833, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1169);
    float _1179 = _1171 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1181 = fma(_833, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1167);
    float _1183 = _1173 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1185 = _1151 * _1111;
    float _1187 = -_1179;
    float _1189 = fma(_1187, _1175, 1.0);
    float _1191 = _1177 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1193 = abs(_1161);
    float _1195 = log2(_1193);
    float _1197 = _1151 * _1123;
    float _1199 = _1181 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1201 = _1183 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1203 = _1185 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1205 = _1151 * _1119;
    float _1207 = _1197 + 1.0;
    float _1209 = fma(_1199, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1201);
    float _1211 = -_1203;
    float _1213 = fma(_1197, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1211);
    float _1215 = log2(_1189);
    float _1217 = fma(_1171, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1209);
    float _1219 = -_1205;
    float _1221 = fma(_1219, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1213);
    float _1223 = _1183 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1225 = fma(_1191, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1217);
    float _1227 = fma(_1221, -0.5, 0.5);
    float _1229 = _1195 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1231 = _1183 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1233 = 1.0 / _1225;
    float _1235 = fma(_1221, 0.5, 0.5);
    float _1237 = fma(_1199, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1223);
    float _1239 = fma(_1199, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1231);
    float _1241 = fma(_1171, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1237);
    float _1243 = fma(_1171, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1239);
    float _1245 = sqrt(_1227);
    float _1247 = _1215 * 0.693147182464599609375;
    float _1249 = fma(_1191, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1243);
    float _1251 = fma(_1191, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1241);
    float _1253 = _1247 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1255 = exp2(_1229);
    float _1257 = _1249 * _1233;
    float _1259 = _1245 * 0.636619746685028076171875;
    float _1261 = fma(_1235, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1263 = fma(_1257, 0.5, 0.5);
    float _1265 = fma(_1235, _1261, -0.212114393711090087890625);
    float _1267 = -_1197;
    float _1269 = fma(_1255, _1207, _1267);
    float _1271 = fma(_1235, _1265, 1.570728778839111328125);
    float _1273 = _1251 * _1233;
    float _1275 = fma(_1269, 0.5, 0.5);
    float _1277 = -_1271;
    float _1279 = fma(_1259, _1277, 1.0);
    float _1281 = fma(_1273, -0.5, 0.5);
    float3 _3414 = float3(_1263, _1281, _1253);
    float _1283 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3414, float3(0.0), isnan(_3414)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3414, float3(0.0), isnan(_3414)), level(0.0)).x;
    float3 _3425 = float3(_1263, _1281, _1253);
    float4 _1286 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3425, float3(0.0), isnan(_3425)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3425, float3(0.0), isnan(_3425)), level(0.0)).xyzw;
    float _1288 = _1286.x;
    float _1290 = _1286.y;
    float _1292 = _1286.z;
    float _1294 = _1286.w;
    float2 _3442 = float2(_1279, _1275);
    float3 _1298 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3442, float2(0.0), isnan(_3442)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3442, float2(0.0), isnan(_3442)), level(0.0)).xyz;
    float _1300 = _1298.x;
    float _1302 = _1298.y;
    float _1304 = _1298.z;
    float _1306 = in.m_49.y;
    bool _1308 = _137 > 0.5;
    float _1310 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1312 = _427 + _1310;
    float _1314 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1316 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _1314;
    float _1318 = _1183 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _1320 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1322 = _1320 != 0;
    float _1324 = 1.0 / _1316;
    int _1326 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1328 = _1326 != 0;
    float _1330 = fma(_1199, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1318);
    float _1332 = _1195 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1334 = fma(_1171, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1330);
    float _1336 = -_463;
    int _1338 = _1308 ? as_type<int>(_1336) : as_type<int>(_463);
    float _1340 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1342 = _903 > 0.0;
    bool _1344 = isnan(_903);
    bool _1346 = _1342 || _1344;
    bool _1348 = isnan(0.0);
    bool _1350 = _1346 || _1348;
    float _1352 = fma(_1191, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1334);
    bool _1354 = !_1322;
    float _1356 = _1354 ? _463 : as_type<float>(_1338);
    bool _1358 = _967 <= 0.0;
    bool _1360 = !_1350;
    bool _1362 = _1358 || _1360;
    float _1364 = _1312 * _1324;
    bool _1366 = _1306 > 0.5;
    float _1368 = exp2(_1332);
    float _1370 = _1356 + 0.5;
    bool _1372 = _427 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _1374 = isnan(_427);
    bool _1376 = _1372 || _1374;
    bool _1378 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _1380 = _1376 || _1378;
    float _1382 = float(_1380);
    bool _1384 = _427 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _1386 = isnan(_427);
    bool _1388 = _1384 || _1386;
    bool _1390 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _1392 = _1388 || _1390;
    float _1394 = float(_1392);
    float _1396 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _1398 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _1396;
    float _1400 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _1402 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _1400;
    float _1404 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _1406 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _1404;
    float _1408 = -_1382;
    float _1410 = _1408 + 1.0;
    float _1412 = fma(_1398, _1364, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _1414 = -_457;
    int _1416 = _1366 ? as_type<int>(_1414) : as_type<int>(_457);
    float _1418 = fma(_1406, _1364, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _1420 = _1394 * _1410;
    float _1422 = -_1394;
    float _1424 = _1422 + 1.0;
    float _1426 = fma(_1402, _1364, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    bool _1428 = !_1328;
    float _1430 = _1428 ? _457 : as_type<float>(_1416);
    float _1432 = _1418 * _1420;
    float _1434 = _1412 * _1420;
    float _1436 = _1426 * _1420;
    float _1438 = -_1368;
    float _1440 = _1438 + 1.0;
    float _1442 = fma(_1424, (*spvDescriptorSet0.vp_c9)._m0[107].y, _1432);
    float _1444 = fma(_1424, (*spvDescriptorSet0.vp_c9)._m0[107].x, _1434);
    float _1446 = fma(_1424, (*spvDescriptorSet0.vp_c9)._m0[107].z, _1436);
    float _1448 = fma(_1382, (*spvDescriptorSet0.vp_c9)._m0[108].y, _1442);
    float _1450 = fma(_1382, (*spvDescriptorSet0.vp_c9)._m0[108].x, _1444);
    float _1452 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1454 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1456 = _1448 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1458 = _903 * _967;
    float _1460 = _1450 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1462 = fma(_1382, (*spvDescriptorSet0.vp_c9)._m0[108].z, _1446);
    float _1464 = _1456 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1466 = _1458 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1468 = _1440 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1470 = _1462 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1472 = _1466 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1474 = _1352 + _1225;
    float _1476 = -_1430;
    float _1478 = _1476 + 0.5;
    float _1480 = _1460 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1482 = _1470 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1484 = _1474 * 0.5;
    float _1486 = _1370 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1488 = _1478 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1490 = -_1468;
    float _1492 = _1490 + 1.0;
    out.m_58.x = _1480;
    out.m_58.y = _1464;
    out.m_58.z = _1482;
    out.m_58.w = _1454;
    float _1494 = _1486 * _1340;
    float _1496 = _1488 * _1452;
    out.m_45.x = _1472;
    out.m_60.x = _1494;
    out.m_60.y = _1496;
    out.gl_Position.x = _1249;
    out.gl_Position.y = _1251;
    out.gl_Position.z = _1352;
    out.gl_Position.w = _1225;
    out.m_62.z = _1484;
    out.m_62.w = _1225;
    float _1498 = _1468 * _1283;
    float _1500 = _1294 * _1492;
    float _1502 = _1294 * _1498;
    float _1504 = _1304 * _1498;
    float _1506 = fma(_1300, _1502, _1288);
    float _1508 = fma(_1302, _1502, _1290);
    float _1510 = fma(_1294, _1504, _1292);
    out.m_64.x = _1506;
    out.m_64.y = _1508;
    out.m_64.z = _1510;
    out.m_64.w = _1500;
    if (!_1362)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_45.x = 0.0;
    float _1512 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1512;
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
    bool _419 = false;
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
    if (!_87)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1568 = as_type<float>(_99);
        out.gl_Position.z = _1568;
    }
    if (!_87)
    {
        return out;
    }
    float _101 = in.m_47.w;
    bool _103 = _101 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _105 = isnan(_101);
    bool _107 = _103 || _105;
    bool _109 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _111 = _107 || _109;
    float _113 = -_101;
    float _115 = _113 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_111)
    {
        float _117 = float(_83);
        _93 = _117;
    }
    float _119 = _93;
    bool _121 = _115 >= _119;
    bool _123 = !_111;
    bool _125 = _121 || _123;
    float _127 = _119;
    if (_125)
    {
        _127 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _129 = _127;
    if (_125)
    {
        out.m_45.x = 0.0;
    }
    int _131 = 0;
    if (_125)
    {
        float _133 = _129 * 5.0;
        _131 = as_type<int>(_133);
    }
    int _135 = _131;
    if (_125)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1637 = as_type<float>(_135);
        out.gl_Position.z = _1637;
    }
    if (_125)
    {
        return out;
    }
    float _137 = in.m_49.x;
    float _139 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _141 = _115 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
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
    bool _183 = !_167;
    int _185 = _183 ? 0 : 1;
    float _187 = fma(_143, (*spvDescriptorSet0.vp_c10)._m0[5].x, _171);
    float _189 = _173 * 6.283185482025146484375;
    float _191 = cos(_189);
    float _193 = fma(_143, (*spvDescriptorSet0.vp_c10)._m0[6].x, _175);
    float _195 = fma(_147, (*spvDescriptorSet0.vp_c10)._m0[4].z, _181);
    int _197 = abs(_185);
    float _199 = -_157;
    float _201 = _155 + _199;
    int _203 = abs(_179);
    bool _205 = !_153;
    int _207 = _205 ? 0 : 1;
    float _209 = -_201;
    float _211 = fma(_209, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _213 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _215 = abs(_207);
    float _217 = float(_203);
    float _219 = fma(_191, 0.5, 0.5);
    bool _221 = _201 < 0.5;
    float _223 = float(_221);
    float _225 = abs(_211);
    float _227 = _217 * _225;
    float _229 = -_219;
    float _231 = fma(_229, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _233 = float(_215);
    float _235 = -_223;
    float _237 = fma(_235, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _239 = float(_197);
    float _241 = fma(_233, _231, _227);
    float _243 = fma(_147, (*spvDescriptorSet0.vp_c10)._m0[5].z, _187);
    float _245 = fma(_147, (*spvDescriptorSet0.vp_c10)._m0[6].z, _193);
    float _247 = abs(_237);
    float _249 = fma(_239, _247, _241);
    bool _251 = !_213;
    float _253 = _243;
    float _255 = _195;
    float _271;
    if (!_251)
    {
        float _257 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _259 = _137 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _261 = fma(_259, (*spvDescriptorSet0.vp_c9)._m0[12].x, _115);
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
        float _279 = _115 * _277;
        _271 = _279;
    }
    _273 = false;
    float _281 = _271;
    float _283 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _285 = _281 + _283;
    bool _287 = _281 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _289 = isnan(_281);
    bool _291 = _287 || _289;
    bool _293 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _295 = _291 || _293;
    float _297 = float(_295);
    bool _299 = _281 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _301 = isnan(_281);
    bool _303 = _299 || _301;
    bool _305 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _307 = _303 || _305;
    float _309 = float(_307);
    float _311 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _313 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _311;
    float _315 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _317 = _315 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _319 = -_297;
    float _321 = _319 + 1.0;
    float _323 = 1.0 / _313;
    bool _325 = _281 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _327 = isnan(_281);
    bool _329 = _325 || _327;
    bool _331 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _333 = _329 || _331;
    float _335 = float(_333);
    float _337 = _309 * _321;
    float _339 = -_309;
    float _341 = _339 + 1.0;
    bool _343 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _345 = _335 * _341;
    float _347 = 1.0 / _317;
    float _349 = -_335;
    float _351 = _349 + 1.0;
    float _353 = _285 * _323;
    float _355 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _357 = _281 + _355;
    float _359 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _361 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _359;
    float _363 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _365 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _363;
    float _367 = fma(_361, _353, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _369 = fma(_365, _353, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _371 = _357 * _347;
    float _373 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _375 = _373 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _377 = _367 * _345;
    float _379 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _381 = _379 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _383 = _369 * _345;
    float _385 = fma(_375, _371, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _387 = fma(_351, (*spvDescriptorSet0.vp_c9)._m0[143].x, _377);
    float _389 = fma(_381, _371, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _391 = fma(_351, (*spvDescriptorSet0.vp_c9)._m0[143].y, _383);
    float _393 = fma(_385, _337, _387);
    float _395 = fma(_389, _337, _391);
    float _397 = fma(_297, (*spvDescriptorSet0.vp_c9)._m0[145].x, _393);
    float _399 = fma(_297, (*spvDescriptorSet0.vp_c9)._m0[145].y, _395);
    bool _401 = !_343;
    float _417;
    if (!_401)
    {
        float _403 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _405 = _137 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _407 = fma(_405, (*spvDescriptorSet0.vp_c9)._m0[11].x, _115);
        float _409 = _407 * _403;
        float _411 = floor(_409);
        float _413 = -_411;
        float _415 = _409 + _413;
        _417 = _415;
        _419 = true;
    }
    else
    {
        float _421 = float(_83);
        float _423 = 1.0 / _421;
        float _425 = _115 * _423;
        _417 = _425;
    }
    _419 = false;
    float _427 = _417;
    float _429 = as_type<float>(int(gl_VertexIndex));
    float _431 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _433 = in.m_56.x;
    float _435 = in.m_56.y;
    float _437 = in.m_42.x;
    float _439 = in.m_42.y;
    float _441 = in.m_42.z;
    int _443 = as_type<int>(_429) & 1;
    bool _445 = _443 != 0;
    int _447 = as_type<int>(_429) & 2;
    bool _449 = _447 != 0;
    float _451 = _399 * _435;
    float _453 = _397 * _433;
    bool _455 = !_449;
    float _457 = _455 ? (-0.5) : 0.5;
    float _459 = _249 * _451;
    bool _461 = !_445;
    float _463 = _461 ? (-0.5) : 0.5;
    float _465 = _249 * _453;
    float _467 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _457);
    float _469 = _459 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _471 = _465 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _473 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _463);
    float _475 = _469 * _467;
    float _477 = _439 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _479 = _471 * _473;
    float _481 = _475 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _483 = _439 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _485 = fma(_437, (*spvDescriptorSet0.vp_c10)._m0[6].x, _477);
    float _487 = _475 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _489 = fma(_479, (*spvDescriptorSet0.vp_c8)._m0[26].x, _481);
    float _491 = fma(_437, (*spvDescriptorSet0.vp_c10)._m0[4].x, _483);
    float _493 = fma(_441, (*spvDescriptorSet0.vp_c10)._m0[6].z, _485);
    float _495 = fma(_479, (*spvDescriptorSet0.vp_c8)._m0[24].x, _487);
    float _497 = fma(_431, (*spvDescriptorSet0.vp_c8)._m0[26].z, _489);
    float _499 = fma(_441, (*spvDescriptorSet0.vp_c10)._m0[4].z, _491);
    float _501 = _493 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _503 = fma(_431, (*spvDescriptorSet0.vp_c8)._m0[24].z, _495);
    float _505 = _497 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _507 = _499 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _509 = _439 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _511 = _503 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _513 = _501 + _505;
    float _515 = fma(_437, (*spvDescriptorSet0.vp_c10)._m0[5].x, _509);
    float _517 = _507 + _511;
    float _519 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _521 = _513 + _519;
    float _523 = fma(_441, (*spvDescriptorSet0.vp_c10)._m0[5].z, _515);
    float _525 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _527 = _517 + _525;
    float _529 = _521 * _521;
    float _531 = _523 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _533 = fma(_527, _527, _529);
    float _535 = _475 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _537 = _531 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _539 = sqrt(_533);
    float _541 = fma(_479, (*spvDescriptorSet0.vp_c8)._m0[25].x, _535);
    float _543 = fma(_507, (*spvDescriptorSet0.vp_c8)._m0[11].x, _537);
    float _545 = fma(_431, (*spvDescriptorSet0.vp_c8)._m0[25].z, _541);
    float _547 = fma(_501, (*spvDescriptorSet0.vp_c8)._m0[11].z, _543);
    float _549 = _545 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _551 = _531 + _549;
    bool _553 = _539 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _555 = _545;
    float _557 = _543;
    float _559 = _515;
    if (!_553)
    {
        _555 = _517;
    }
    float _561 = _555;
    float _563 = _561;
    if (!_553)
    {
        _557 = _513;
    }
    float _565 = _557;
    float _567 = _565;
    if (!_553)
    {
        _559 = _551;
    }
    float _569 = _559;
    bool _571 = !_553;
    float _573 = _569;
    if (!_571)
    {
        float _575 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _577 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _579 = _539 + _577;
        float _581 = rsqrt(_533);
        float _583 = _579 * _575;
        float _585 = _551 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _587 = _583 * 0.15915493667125701904296875;
        float _589 = _587 * 6.283185482025146484375;
        float _591 = cos(_589);
        float _593 = _587 * 6.283185482025146484375;
        float _595 = sin(_593);
        float _597 = _591 + (-1.0);
        float _599 = fma(_595, _585, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _601 = _597 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _603 = _581 * _599;
        float _605 = fma(_551, _591, _601);
        float _607 = fma(_527, _603, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _609 = fma(_521, _603, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _573 = _605;
        _563 = _607;
        _567 = _609;
    }
    float _611 = _573;
    float _613 = _563;
    float _615 = _567;
    float _617 = -_531;
    float _619 = _617 + _611;
    float _621 = -_507;
    float _623 = _621 + _613;
    float _625 = _547 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _627 = _531 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _629 = _619 * _619;
    float _631 = -_501;
    float _633 = _631 + _615;
    float _635 = 1.0 / _625;
    float _637 = fma(_507, (*spvDescriptorSet0.vp_c8)._m0[10].x, _627);
    float _639 = fma(_623, _623, _629);
    float _641 = fma(_501, (*spvDescriptorSet0.vp_c8)._m0[10].z, _637);
    float _643 = fma(_633, _633, _639);
    bool _645 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _647 = isnan(0.5);
    bool _649 = _645 || _647;
    bool _651 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _653 = _649 || _651;
    float _655 = _641 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _657 = sqrt(_643);
    bool _659 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _661 = isnan(0.5);
    bool _663 = _659 || _661;
    bool _665 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _667 = _663 || _665;
    float _669 = _655 + _625;
    float _671 = _669 * _635;
    float _673 = _671 * 0.5;
    float _675 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _677 = fma(_673, (*spvDescriptorSet0.vp_c8)._m0[30].w, _675);
    float _679 = 1.0 / _677;
    bool _681 = _657 > 0.0;
    bool _683 = !_681;
    float _685 = _613;
    float _687 = _615;
    float _689 = _611;
    float _691 = _657;
    float _693 = _635;
    float _695 = _677;
    if (!_683)
    {
        float _697 = _243 * _243;
        float _699 = fma(_195, _195, _697);
        float _701 = fma(_245, _245, _699);
        float _703 = rsqrt(_643);
        float _705 = sqrt(_701);
        float _707 = _623 * _703;
        float _709 = _619 * _703;
        float _711 = _633 * _703;
        bool _713 = _705 > 0.0;
        bool _715 = !_713;
        _691 = _703;
        _695 = _705;
        if (!_715)
        {
            float _717 = rsqrt(_701);
            float _719 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _721 = _243 * _717;
            float _723 = _195 * _717;
            float _725 = _709 * _721;
            float _727 = _245 * _717;
            float _729 = fma(_707, _723, _725);
            float _731 = _719 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _733 = fma(_711, _727, _729);
            float _735 = _733 * _731;
            float _737 = fma(_195, _735, _613);
            float _739 = fma(_243, _735, _611);
            float _741 = fma(_245, _735, _615);
            _685 = _737;
            _687 = _741;
            _689 = _739;
            _691 = _735;
            _693 = _719;
            _695 = _727;
        }
    }
    float _743 = _685;
    float _745 = _687;
    float _747 = _689;
    float _749 = _691;
    float _751 = _693;
    float _753 = _695;
    float _755 = _749;
    float _757 = _747;
    float _759 = _751;
    float _761 = _745;
    float _763 = _753;
    float _765 = _743;
    if (_667)
    {
        _755 = 1.0;
    }
    float _767 = _755;
    float _769 = _767;
    if (_653)
    {
        _253 = _743;
    }
    float _771 = _253;
    float _773 = _771;
    if (_653)
    {
        _255 = _745;
    }
    float _775 = _255;
    float _777 = _775;
    if (!_653)
    {
        float _779 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _781 = _531 + _779;
        float _783 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _785 = _507 + _783;
        float _787 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _789 = -_531;
        float _791 = _789 + _747;
        float _793 = _781 * _781;
        float _795 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _797 = _501 + _795;
        float _799 = -_501;
        float _801 = _799 + _745;
        float _803 = fma(_785, _785, _793);
        float _805 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _807 = fma(_797, _797, _803);
        float _809 = sqrt(_807);
        float _811 = _787 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _813 = precise::min(_809, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _815 = _813 * _805;
        float _817 = -_507;
        float _819 = _817 + _743;
        float _821 = _811 * _815;
        float _823 = fma(_819, _821, _507);
        float _825 = fma(_791, _821, _531);
        float _827 = fma(_801, _821, _501);
        _757 = _825;
        _773 = _823;
        _777 = _827;
        _759 = _805;
        _761 = _801;
    }
    float _829 = _757;
    float _831 = _773;
    float _833 = _777;
    float _835 = _759;
    float _837 = _761;
    float _839 = _837;
    float _841 = _835;
    if (_667)
    {
        _763 = 1.0;
    }
    float _843 = _763;
    float _845 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _847 = _679 * _845;
    float _849 = _843;
    if (!_667)
    {
        float _851 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _853 = _851 * 0.15915493667125701904296875;
        float _855 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _857 = _853 * 6.283185482025146484375;
        float _859 = cos(_857);
        float _861 = _855 * 0.15915493667125701904296875;
        float _863 = _853 * 6.283185482025146484375;
        float _865 = sin(_863);
        float _867 = 1.0 / _859;
        float _869 = _861 * 6.283185482025146484375;
        float _871 = cos(_869);
        float _873 = _865 * _867;
        float _875 = _861 * 6.283185482025146484375;
        float _877 = sin(_875);
        float _879 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _881 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _879;
        float _883 = _871 * _873;
        float _885 = 1.0 / _881;
        float _887 = 1.0 / _883;
        float _889 = _877 * _887;
        float _891 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _893 = fma(_847, _889, _891);
        float _895 = _893 * _885;
        float _897 = precise::clamp(_895, 0.0, 1.0);
        _765 = _885;
        _839 = _887;
        _769 = _897;
    }
    float _899 = _765;
    float _901 = _839;
    float _903 = _769;
    float _905 = _901;
    float _907 = _899;
    if (!_667)
    {
        float _909 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _911 = _909 * 0.15915493667125701904296875;
        float _913 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _915 = _911 * 6.283185482025146484375;
        float _917 = cos(_915);
        float _919 = _913 * 0.15915493667125701904296875;
        float _921 = _911 * 6.283185482025146484375;
        float _923 = sin(_921);
        float _925 = 1.0 / _917;
        float _927 = _919 * 6.283185482025146484375;
        float _929 = cos(_927);
        float _931 = _923 * _925;
        float _933 = _919 * 6.283185482025146484375;
        float _935 = sin(_933);
        float _937 = _929 * _931;
        float _939 = 1.0 / _937;
        float _941 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _943 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _941;
        float _945 = 1.0 / _943;
        float _947 = _935 * _939;
        float _949 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _951 = fma(_847, _947, _949);
        float _953 = _951 * _945;
        float _955 = precise::clamp(_953, 0.0, 1.0);
        float _957 = -_955;
        float _959 = _957 + 1.0;
        _841 = _947;
        _905 = _911;
        _907 = _925;
        _849 = _959;
    }
    float _961 = _841;
    float _963 = _905;
    float _965 = _907;
    float _967 = _849;
    float _969 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _971 = _829 + _969;
    float _973 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _975 = _831 + _973;
    float _977 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _979 = _833 + _977;
    float _981 = _971 * _971;
    float _983 = fma(_975, _975, _981);
    float _985 = fma(_979, _979, _983);
    float _987 = rsqrt(_985);
    float _989 = _987 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _991 = _975 * _989;
    float _993 = _979 * _989;
    float _995 = _991 * _991;
    float _997 = _993 * _993;
    float _999 = _995 + _997;
    float _1001 = sqrt(_999);
    bool _1003 = _1001 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1005 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1007 = _1001 + _1005;
    float _1009 = _979;
    float _1011 = _981;
    float _1013 = _1007;
    float _1015 = _961;
    float _1017 = _971;
    float _1019 = _965;
    float _1021 = _991;
    if (_1003)
    {
        float _1023 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1009 = _1023;
    }
    float _1025 = _1009;
    if (_1003)
    {
        float _1027 = rsqrt(_999);
        _1011 = _1027;
    }
    float _1029 = _1011;
    float _1031 = _1029;
    if (_1003)
    {
        float _1033 = _1007 * _1025;
        _1013 = _1033;
    }
    float _1035 = _1013;
    if (_1003)
    {
        float _1037 = _1035 * 0.15915493667125701904296875;
        _1015 = _1037;
    }
    float _1039 = _1015;
    float _1041 = _1025;
    if (_1003)
    {
        float _1043 = _1039 * 6.283185482025146484375;
        float _1045 = sin(_1043);
        _1041 = _1045;
    }
    float _1047 = _1041;
    float _1049 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1051 = precise::max(0.0, _1049);
    float _1053 = _963;
    float _1055 = _1051;
    if (_1003)
    {
        float _1057 = _1039 * 6.283185482025146484375;
        float _1059 = cos(_1057);
        _1053 = _1059;
    }
    float _1061 = _1053;
    float _1063 = -_989;
    float _1065 = -_1051;
    float _1067 = fma(_971, _1063, _1065);
    if (!_1003)
    {
        _1017 = _993;
    }
    float _1069 = _1017;
    float _1071 = _1069;
    if (_1003)
    {
        float _1073 = _1067 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1055 = _1073;
    }
    float _1075 = _1055;
    float _1077 = _1047;
    float _1079 = _1075;
    if (_1003)
    {
        float _1081 = fma(_1047, _1075, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1019 = _1081;
    }
    float _1083 = _1019;
    if (!_1003)
    {
        _1077 = _1067;
    }
    float _1085 = _1077;
    float _1087 = _1085;
    float _1089 = _1061;
    if (_1003)
    {
        float _1091 = _1061 + (-1.0);
        _1079 = _1091;
    }
    float _1093 = _1079;
    float _1095 = 0.0;
    float _1097 = _1093;
    if (_1003)
    {
        float _1099 = _1029 * _1083;
        _1095 = _1099;
    }
    float _1101 = _1095;
    float _1103 = sqrt(_985);
    if (_1003)
    {
        float _1105 = _1093 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1031 = _1105;
    }
    float _1107 = _1031;
    if (_1003)
    {
        float _1109 = _991 * _1101;
        _1021 = _1109;
    }
    float _1111 = _1021;
    if (!_1003)
    {
        _1097 = _995;
    }
    float _1113 = _1097;
    float _1115 = _1113;
    if (_1003)
    {
        float _1117 = _993 * _1101;
        _1071 = _1117;
    }
    float _1119 = _1071;
    if (_1003)
    {
        float _1121 = fma(_1067, _1061, _1107);
        _1087 = _1121;
    }
    float _1123 = _1087;
    if (_1003)
    {
        float _1125 = _1111 * _1111;
        _1115 = _1125;
    }
    float _1127 = _1115;
    if (!_1003)
    {
        _1089 = _997;
    }
    float _1129 = _1089;
    float _1131 = _1129;
    if (_1003)
    {
        float _1133 = _1119 * _1119;
        _1131 = _1133;
    }
    float _1135 = _1131;
    float _1137 = fma(_1123, _1123, _1127);
    float _1139 = _1137 + _1135;
    float _1141 = _829 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1143 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1145 = fma(_1103, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1143);
    float _1147 = precise::clamp(_1145, 0.0, 1.0);
    float _1149 = _829 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1151 = rsqrt(_1139);
    float _1153 = fma(_831, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1141);
    float _1155 = _829 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1157 = _829 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1159 = -_1147;
    float _1161 = _1159 + 1.0;
    float _1163 = fma(_833, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1153);
    float _1165 = fma(_831, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1149);
    float _1167 = fma(_831, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1155);
    float _1169 = fma(_831, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1157);
    float _1171 = _1163 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1173 = fma(_833, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1165);
    float _1175 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1177 = fma(_833, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1169);
    float _1179 = _1171 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1181 = fma(_833, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1167);
    float _1183 = _1173 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1185 = _1151 * _1111;
    float _1187 = -_1179;
    float _1189 = fma(_1187, _1175, 1.0);
    float _1191 = _1177 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1193 = abs(_1161);
    float _1195 = log2(_1193);
    float _1197 = _1151 * _1123;
    float _1199 = _1181 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1201 = _1183 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1203 = _1185 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1205 = _1151 * _1119;
    float _1207 = _1197 + 1.0;
    float _1209 = fma(_1199, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1201);
    float _1211 = -_1203;
    float _1213 = fma(_1197, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1211);
    float _1215 = log2(_1189);
    float _1217 = fma(_1171, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1209);
    float _1219 = -_1205;
    float _1221 = fma(_1219, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1213);
    float _1223 = _1183 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1225 = fma(_1191, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1217);
    float _1227 = fma(_1221, -0.5, 0.5);
    float _1229 = _1195 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1231 = _1183 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1233 = 1.0 / _1225;
    float _1235 = fma(_1221, 0.5, 0.5);
    float _1237 = fma(_1199, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1223);
    float _1239 = fma(_1199, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1231);
    float _1241 = fma(_1171, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1237);
    float _1243 = fma(_1171, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1239);
    float _1245 = sqrt(_1227);
    float _1247 = _1215 * 0.693147182464599609375;
    float _1249 = fma(_1191, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1243);
    float _1251 = fma(_1191, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1241);
    float _1253 = _1247 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1255 = exp2(_1229);
    float _1257 = _1249 * _1233;
    float _1259 = _1245 * 0.636619746685028076171875;
    float _1261 = fma(_1235, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1263 = fma(_1257, 0.5, 0.5);
    float _1265 = fma(_1235, _1261, -0.212114393711090087890625);
    float _1267 = -_1197;
    float _1269 = fma(_1255, _1207, _1267);
    float _1271 = fma(_1235, _1265, 1.570728778839111328125);
    float _1273 = _1251 * _1233;
    float _1275 = fma(_1269, 0.5, 0.5);
    float _1277 = -_1271;
    float _1279 = fma(_1259, _1277, 1.0);
    float _1281 = fma(_1273, -0.5, 0.5);
    float3 _3414 = float3(_1263, _1281, _1253);
    float _1283 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3414, float3(0.0), isnan(_3414)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3414, float3(0.0), isnan(_3414)), level(0.0)).x;
    float3 _3425 = float3(_1263, _1281, _1253);
    float4 _1286 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3425, float3(0.0), isnan(_3425)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3425, float3(0.0), isnan(_3425)), level(0.0)).xyzw;
    float _1288 = _1286.x;
    float _1290 = _1286.y;
    float _1292 = _1286.z;
    float _1294 = _1286.w;
    float2 _3442 = float2(_1279, _1275);
    float3 _1298 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3442, float2(0.0), isnan(_3442)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3442, float2(0.0), isnan(_3442)), level(0.0)).xyz;
    float _1300 = _1298.x;
    float _1302 = _1298.y;
    float _1304 = _1298.z;
    float _1306 = in.m_49.y;
    bool _1308 = _137 > 0.5;
    float _1310 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1312 = _427 + _1310;
    float _1314 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1316 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _1314;
    float _1318 = _1183 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _1320 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1322 = _1320 != 0;
    float _1324 = 1.0 / _1316;
    int _1326 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1328 = _1326 != 0;
    float _1330 = fma(_1199, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1318);
    float _1332 = _1195 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1334 = fma(_1171, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1330);
    float _1336 = -_463;
    int _1338 = _1308 ? as_type<int>(_1336) : as_type<int>(_463);
    float _1340 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1342 = _903 > 0.0;
    bool _1344 = isnan(_903);
    bool _1346 = _1342 || _1344;
    bool _1348 = isnan(0.0);
    bool _1350 = _1346 || _1348;
    float _1352 = fma(_1191, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1334);
    bool _1354 = !_1322;
    float _1356 = _1354 ? _463 : as_type<float>(_1338);
    bool _1358 = _967 <= 0.0;
    bool _1360 = !_1350;
    bool _1362 = _1358 || _1360;
    float _1364 = _1312 * _1324;
    bool _1366 = _1306 > 0.5;
    float _1368 = exp2(_1332);
    float _1370 = _1356 + 0.5;
    bool _1372 = _427 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _1374 = isnan(_427);
    bool _1376 = _1372 || _1374;
    bool _1378 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _1380 = _1376 || _1378;
    float _1382 = float(_1380);
    bool _1384 = _427 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _1386 = isnan(_427);
    bool _1388 = _1384 || _1386;
    bool _1390 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _1392 = _1388 || _1390;
    float _1394 = float(_1392);
    float _1396 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _1398 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _1396;
    float _1400 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _1402 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _1400;
    float _1404 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _1406 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _1404;
    float _1408 = -_1382;
    float _1410 = _1408 + 1.0;
    float _1412 = fma(_1398, _1364, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _1414 = -_457;
    int _1416 = _1366 ? as_type<int>(_1414) : as_type<int>(_457);
    float _1418 = fma(_1406, _1364, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _1420 = _1394 * _1410;
    float _1422 = -_1394;
    float _1424 = _1422 + 1.0;
    float _1426 = fma(_1402, _1364, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    bool _1428 = !_1328;
    float _1430 = _1428 ? _457 : as_type<float>(_1416);
    float _1432 = _1418 * _1420;
    float _1434 = _1412 * _1420;
    float _1436 = _1426 * _1420;
    float _1438 = -_1368;
    float _1440 = _1438 + 1.0;
    float _1442 = fma(_1424, (*spvDescriptorSet0.vp_c9)._m0[107].y, _1432);
    float _1444 = fma(_1424, (*spvDescriptorSet0.vp_c9)._m0[107].x, _1434);
    float _1446 = fma(_1424, (*spvDescriptorSet0.vp_c9)._m0[107].z, _1436);
    float _1448 = fma(_1382, (*spvDescriptorSet0.vp_c9)._m0[108].y, _1442);
    float _1450 = fma(_1382, (*spvDescriptorSet0.vp_c9)._m0[108].x, _1444);
    float _1452 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1454 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1456 = _1448 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1458 = _903 * _967;
    float _1460 = _1450 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1462 = fma(_1382, (*spvDescriptorSet0.vp_c9)._m0[108].z, _1446);
    float _1464 = _1456 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1466 = _1458 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1468 = _1440 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1470 = _1462 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1472 = _1466 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1474 = _1352 + _1225;
    float _1476 = -_1430;
    float _1478 = _1476 + 0.5;
    float _1480 = _1460 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1482 = _1470 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1484 = _1474 * 0.5;
    float _1486 = _1370 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1488 = _1478 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1490 = -_1468;
    float _1492 = _1490 + 1.0;
    out.m_58.x = _1480;
    out.m_58.y = _1464;
    out.m_58.z = _1482;
    out.m_58.w = _1454;
    float _1494 = _1486 * _1340;
    float _1496 = _1488 * _1452;
    out.m_45.x = _1472;
    out.m_60.x = _1494;
    out.m_60.y = _1496;
    out.gl_Position.x = _1249;
    out.gl_Position.y = _1251;
    out.gl_Position.z = _1352;
    out.gl_Position.w = _1225;
    out.m_62.z = _1484;
    out.m_62.w = _1225;
    float _1498 = _1468 * _1283;
    float _1500 = _1294 * _1492;
    float _1502 = _1294 * _1498;
    float _1504 = _1304 * _1498;
    float _1506 = fma(_1300, _1502, _1288);
    float _1508 = fma(_1302, _1502, _1290);
    float _1510 = fma(_1294, _1504, _1292);
    out.m_64.x = _1506;
    out.m_64.y = _1508;
    out.m_64.z = _1510;
    out.m_64.w = _1500;
    if (!_1362)
    {
        return out;
    }
    out.m_45.x = 0.0;
    float _1512 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1512;
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
    bool _419 = false;
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
    if (!_87)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1568 = as_type<float>(_99);
        out.gl_Position.z = _1568;
    }
    if (!_87)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _101 = in.m_47.w;
    bool _103 = _101 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _105 = isnan(_101);
    bool _107 = _103 || _105;
    bool _109 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _111 = _107 || _109;
    float _113 = -_101;
    float _115 = _113 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_111)
    {
        float _117 = float(_83);
        _93 = _117;
    }
    float _119 = _93;
    bool _121 = _115 >= _119;
    bool _123 = !_111;
    bool _125 = _121 || _123;
    float _127 = _119;
    if (_125)
    {
        _127 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _129 = _127;
    if (_125)
    {
        out.m_45.x = 0.0;
    }
    int _131 = 0;
    if (_125)
    {
        float _133 = _129 * 5.0;
        _131 = as_type<int>(_133);
    }
    int _135 = _131;
    if (_125)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1637 = as_type<float>(_135);
        out.gl_Position.z = _1637;
    }
    if (_125)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _137 = in.m_49.x;
    float _139 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _141 = _115 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
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
    bool _183 = !_167;
    int _185 = _183 ? 0 : 1;
    float _187 = fma(_143, (*spvDescriptorSet0.vp_c10)._m0[5].x, _171);
    float _189 = _173 * 6.283185482025146484375;
    float _191 = cos(_189);
    float _193 = fma(_143, (*spvDescriptorSet0.vp_c10)._m0[6].x, _175);
    float _195 = fma(_147, (*spvDescriptorSet0.vp_c10)._m0[4].z, _181);
    int _197 = abs(_185);
    float _199 = -_157;
    float _201 = _155 + _199;
    int _203 = abs(_179);
    bool _205 = !_153;
    int _207 = _205 ? 0 : 1;
    float _209 = -_201;
    float _211 = fma(_209, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _213 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _215 = abs(_207);
    float _217 = float(_203);
    float _219 = fma(_191, 0.5, 0.5);
    bool _221 = _201 < 0.5;
    float _223 = float(_221);
    float _225 = abs(_211);
    float _227 = _217 * _225;
    float _229 = -_219;
    float _231 = fma(_229, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _233 = float(_215);
    float _235 = -_223;
    float _237 = fma(_235, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _239 = float(_197);
    float _241 = fma(_233, _231, _227);
    float _243 = fma(_147, (*spvDescriptorSet0.vp_c10)._m0[5].z, _187);
    float _245 = fma(_147, (*spvDescriptorSet0.vp_c10)._m0[6].z, _193);
    float _247 = abs(_237);
    float _249 = fma(_239, _247, _241);
    bool _251 = !_213;
    float _253 = _243;
    float _255 = _195;
    float _271;
    if (!_251)
    {
        float _257 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _259 = _137 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _261 = fma(_259, (*spvDescriptorSet0.vp_c9)._m0[12].x, _115);
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
        float _279 = _115 * _277;
        _271 = _279;
    }
    _273 = false;
    float _281 = _271;
    float _283 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _285 = _281 + _283;
    bool _287 = _281 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _289 = isnan(_281);
    bool _291 = _287 || _289;
    bool _293 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _295 = _291 || _293;
    float _297 = float(_295);
    bool _299 = _281 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _301 = isnan(_281);
    bool _303 = _299 || _301;
    bool _305 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _307 = _303 || _305;
    float _309 = float(_307);
    float _311 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _313 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _311;
    float _315 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _317 = _315 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _319 = -_297;
    float _321 = _319 + 1.0;
    float _323 = 1.0 / _313;
    bool _325 = _281 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _327 = isnan(_281);
    bool _329 = _325 || _327;
    bool _331 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _333 = _329 || _331;
    float _335 = float(_333);
    float _337 = _309 * _321;
    float _339 = -_309;
    float _341 = _339 + 1.0;
    bool _343 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _345 = _335 * _341;
    float _347 = 1.0 / _317;
    float _349 = -_335;
    float _351 = _349 + 1.0;
    float _353 = _285 * _323;
    float _355 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _357 = _281 + _355;
    float _359 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _361 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _359;
    float _363 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _365 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _363;
    float _367 = fma(_361, _353, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _369 = fma(_365, _353, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _371 = _357 * _347;
    float _373 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _375 = _373 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _377 = _367 * _345;
    float _379 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _381 = _379 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _383 = _369 * _345;
    float _385 = fma(_375, _371, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _387 = fma(_351, (*spvDescriptorSet0.vp_c9)._m0[143].x, _377);
    float _389 = fma(_381, _371, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _391 = fma(_351, (*spvDescriptorSet0.vp_c9)._m0[143].y, _383);
    float _393 = fma(_385, _337, _387);
    float _395 = fma(_389, _337, _391);
    float _397 = fma(_297, (*spvDescriptorSet0.vp_c9)._m0[145].x, _393);
    float _399 = fma(_297, (*spvDescriptorSet0.vp_c9)._m0[145].y, _395);
    bool _401 = !_343;
    float _417;
    if (!_401)
    {
        float _403 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _405 = _137 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _407 = fma(_405, (*spvDescriptorSet0.vp_c9)._m0[11].x, _115);
        float _409 = _407 * _403;
        float _411 = floor(_409);
        float _413 = -_411;
        float _415 = _409 + _413;
        _417 = _415;
        _419 = true;
    }
    else
    {
        float _421 = float(_83);
        float _423 = 1.0 / _421;
        float _425 = _115 * _423;
        _417 = _425;
    }
    _419 = false;
    float _427 = _417;
    float _429 = as_type<float>(int(gl_VertexIndex));
    float _431 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _433 = in.m_56.x;
    float _435 = in.m_56.y;
    float _437 = in.m_42.x;
    float _439 = in.m_42.y;
    float _441 = in.m_42.z;
    int _443 = as_type<int>(_429) & 1;
    bool _445 = _443 != 0;
    int _447 = as_type<int>(_429) & 2;
    bool _449 = _447 != 0;
    float _451 = _399 * _435;
    float _453 = _397 * _433;
    bool _455 = !_449;
    float _457 = _455 ? (-0.5) : 0.5;
    float _459 = _249 * _451;
    bool _461 = !_445;
    float _463 = _461 ? (-0.5) : 0.5;
    float _465 = _249 * _453;
    float _467 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _457);
    float _469 = _459 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _471 = _465 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _473 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _463);
    float _475 = _469 * _467;
    float _477 = _439 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _479 = _471 * _473;
    float _481 = _475 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _483 = _439 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _485 = fma(_437, (*spvDescriptorSet0.vp_c10)._m0[6].x, _477);
    float _487 = _475 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _489 = fma(_479, (*spvDescriptorSet0.vp_c8)._m0[26].x, _481);
    float _491 = fma(_437, (*spvDescriptorSet0.vp_c10)._m0[4].x, _483);
    float _493 = fma(_441, (*spvDescriptorSet0.vp_c10)._m0[6].z, _485);
    float _495 = fma(_479, (*spvDescriptorSet0.vp_c8)._m0[24].x, _487);
    float _497 = fma(_431, (*spvDescriptorSet0.vp_c8)._m0[26].z, _489);
    float _499 = fma(_441, (*spvDescriptorSet0.vp_c10)._m0[4].z, _491);
    float _501 = _493 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _503 = fma(_431, (*spvDescriptorSet0.vp_c8)._m0[24].z, _495);
    float _505 = _497 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _507 = _499 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _509 = _439 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _511 = _503 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _513 = _501 + _505;
    float _515 = fma(_437, (*spvDescriptorSet0.vp_c10)._m0[5].x, _509);
    float _517 = _507 + _511;
    float _519 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _521 = _513 + _519;
    float _523 = fma(_441, (*spvDescriptorSet0.vp_c10)._m0[5].z, _515);
    float _525 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _527 = _517 + _525;
    float _529 = _521 * _521;
    float _531 = _523 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _533 = fma(_527, _527, _529);
    float _535 = _475 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _537 = _531 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _539 = sqrt(_533);
    float _541 = fma(_479, (*spvDescriptorSet0.vp_c8)._m0[25].x, _535);
    float _543 = fma(_507, (*spvDescriptorSet0.vp_c8)._m0[11].x, _537);
    float _545 = fma(_431, (*spvDescriptorSet0.vp_c8)._m0[25].z, _541);
    float _547 = fma(_501, (*spvDescriptorSet0.vp_c8)._m0[11].z, _543);
    float _549 = _545 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _551 = _531 + _549;
    bool _553 = _539 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _555 = _545;
    float _557 = _543;
    float _559 = _515;
    if (!_553)
    {
        _555 = _517;
    }
    float _561 = _555;
    float _563 = _561;
    if (!_553)
    {
        _557 = _513;
    }
    float _565 = _557;
    float _567 = _565;
    if (!_553)
    {
        _559 = _551;
    }
    float _569 = _559;
    bool _571 = !_553;
    float _573 = _569;
    if (!_571)
    {
        float _575 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _577 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _579 = _539 + _577;
        float _581 = rsqrt(_533);
        float _583 = _579 * _575;
        float _585 = _551 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _587 = _583 * 0.15915493667125701904296875;
        float _589 = _587 * 6.283185482025146484375;
        float _591 = cos(_589);
        float _593 = _587 * 6.283185482025146484375;
        float _595 = sin(_593);
        float _597 = _591 + (-1.0);
        float _599 = fma(_595, _585, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _601 = _597 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _603 = _581 * _599;
        float _605 = fma(_551, _591, _601);
        float _607 = fma(_527, _603, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _609 = fma(_521, _603, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _573 = _605;
        _563 = _607;
        _567 = _609;
    }
    float _611 = _573;
    float _613 = _563;
    float _615 = _567;
    float _617 = -_531;
    float _619 = _617 + _611;
    float _621 = -_507;
    float _623 = _621 + _613;
    float _625 = _547 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _627 = _531 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _629 = _619 * _619;
    float _631 = -_501;
    float _633 = _631 + _615;
    float _635 = 1.0 / _625;
    float _637 = fma(_507, (*spvDescriptorSet0.vp_c8)._m0[10].x, _627);
    float _639 = fma(_623, _623, _629);
    float _641 = fma(_501, (*spvDescriptorSet0.vp_c8)._m0[10].z, _637);
    float _643 = fma(_633, _633, _639);
    bool _645 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _647 = isnan(0.5);
    bool _649 = _645 || _647;
    bool _651 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _653 = _649 || _651;
    float _655 = _641 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _657 = sqrt(_643);
    bool _659 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _661 = isnan(0.5);
    bool _663 = _659 || _661;
    bool _665 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _667 = _663 || _665;
    float _669 = _655 + _625;
    float _671 = _669 * _635;
    float _673 = _671 * 0.5;
    float _675 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _677 = fma(_673, (*spvDescriptorSet0.vp_c8)._m0[30].w, _675);
    float _679 = 1.0 / _677;
    bool _681 = _657 > 0.0;
    bool _683 = !_681;
    float _685 = _613;
    float _687 = _615;
    float _689 = _611;
    float _691 = _657;
    float _693 = _635;
    float _695 = _677;
    if (!_683)
    {
        float _697 = _243 * _243;
        float _699 = fma(_195, _195, _697);
        float _701 = fma(_245, _245, _699);
        float _703 = rsqrt(_643);
        float _705 = sqrt(_701);
        float _707 = _623 * _703;
        float _709 = _619 * _703;
        float _711 = _633 * _703;
        bool _713 = _705 > 0.0;
        bool _715 = !_713;
        _691 = _703;
        _695 = _705;
        if (!_715)
        {
            float _717 = rsqrt(_701);
            float _719 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _721 = _243 * _717;
            float _723 = _195 * _717;
            float _725 = _709 * _721;
            float _727 = _245 * _717;
            float _729 = fma(_707, _723, _725);
            float _731 = _719 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _733 = fma(_711, _727, _729);
            float _735 = _733 * _731;
            float _737 = fma(_195, _735, _613);
            float _739 = fma(_243, _735, _611);
            float _741 = fma(_245, _735, _615);
            _685 = _737;
            _687 = _741;
            _689 = _739;
            _691 = _735;
            _693 = _719;
            _695 = _727;
        }
    }
    float _743 = _685;
    float _745 = _687;
    float _747 = _689;
    float _749 = _691;
    float _751 = _693;
    float _753 = _695;
    float _755 = _749;
    float _757 = _747;
    float _759 = _751;
    float _761 = _745;
    float _763 = _753;
    float _765 = _743;
    if (_667)
    {
        _755 = 1.0;
    }
    float _767 = _755;
    float _769 = _767;
    if (_653)
    {
        _253 = _743;
    }
    float _771 = _253;
    float _773 = _771;
    if (_653)
    {
        _255 = _745;
    }
    float _775 = _255;
    float _777 = _775;
    if (!_653)
    {
        float _779 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _781 = _531 + _779;
        float _783 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _785 = _507 + _783;
        float _787 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _789 = -_531;
        float _791 = _789 + _747;
        float _793 = _781 * _781;
        float _795 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _797 = _501 + _795;
        float _799 = -_501;
        float _801 = _799 + _745;
        float _803 = fma(_785, _785, _793);
        float _805 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _807 = fma(_797, _797, _803);
        float _809 = sqrt(_807);
        float _811 = _787 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _813 = precise::min(_809, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _815 = _813 * _805;
        float _817 = -_507;
        float _819 = _817 + _743;
        float _821 = _811 * _815;
        float _823 = fma(_819, _821, _507);
        float _825 = fma(_791, _821, _531);
        float _827 = fma(_801, _821, _501);
        _757 = _825;
        _773 = _823;
        _777 = _827;
        _759 = _805;
        _761 = _801;
    }
    float _829 = _757;
    float _831 = _773;
    float _833 = _777;
    float _835 = _759;
    float _837 = _761;
    float _839 = _837;
    float _841 = _835;
    if (_667)
    {
        _763 = 1.0;
    }
    float _843 = _763;
    float _845 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _847 = _679 * _845;
    float _849 = _843;
    if (!_667)
    {
        float _851 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _853 = _851 * 0.15915493667125701904296875;
        float _855 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _857 = _853 * 6.283185482025146484375;
        float _859 = cos(_857);
        float _861 = _855 * 0.15915493667125701904296875;
        float _863 = _853 * 6.283185482025146484375;
        float _865 = sin(_863);
        float _867 = 1.0 / _859;
        float _869 = _861 * 6.283185482025146484375;
        float _871 = cos(_869);
        float _873 = _865 * _867;
        float _875 = _861 * 6.283185482025146484375;
        float _877 = sin(_875);
        float _879 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _881 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _879;
        float _883 = _871 * _873;
        float _885 = 1.0 / _881;
        float _887 = 1.0 / _883;
        float _889 = _877 * _887;
        float _891 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _893 = fma(_847, _889, _891);
        float _895 = _893 * _885;
        float _897 = precise::clamp(_895, 0.0, 1.0);
        _765 = _885;
        _839 = _887;
        _769 = _897;
    }
    float _899 = _765;
    float _901 = _839;
    float _903 = _769;
    float _905 = _901;
    float _907 = _899;
    if (!_667)
    {
        float _909 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _911 = _909 * 0.15915493667125701904296875;
        float _913 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _915 = _911 * 6.283185482025146484375;
        float _917 = cos(_915);
        float _919 = _913 * 0.15915493667125701904296875;
        float _921 = _911 * 6.283185482025146484375;
        float _923 = sin(_921);
        float _925 = 1.0 / _917;
        float _927 = _919 * 6.283185482025146484375;
        float _929 = cos(_927);
        float _931 = _923 * _925;
        float _933 = _919 * 6.283185482025146484375;
        float _935 = sin(_933);
        float _937 = _929 * _931;
        float _939 = 1.0 / _937;
        float _941 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _943 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _941;
        float _945 = 1.0 / _943;
        float _947 = _935 * _939;
        float _949 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _951 = fma(_847, _947, _949);
        float _953 = _951 * _945;
        float _955 = precise::clamp(_953, 0.0, 1.0);
        float _957 = -_955;
        float _959 = _957 + 1.0;
        _841 = _947;
        _905 = _911;
        _907 = _925;
        _849 = _959;
    }
    float _961 = _841;
    float _963 = _905;
    float _965 = _907;
    float _967 = _849;
    float _969 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _971 = _829 + _969;
    float _973 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _975 = _831 + _973;
    float _977 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _979 = _833 + _977;
    float _981 = _971 * _971;
    float _983 = fma(_975, _975, _981);
    float _985 = fma(_979, _979, _983);
    float _987 = rsqrt(_985);
    float _989 = _987 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _991 = _975 * _989;
    float _993 = _979 * _989;
    float _995 = _991 * _991;
    float _997 = _993 * _993;
    float _999 = _995 + _997;
    float _1001 = sqrt(_999);
    bool _1003 = _1001 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1005 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1007 = _1001 + _1005;
    float _1009 = _979;
    float _1011 = _981;
    float _1013 = _1007;
    float _1015 = _961;
    float _1017 = _971;
    float _1019 = _965;
    float _1021 = _991;
    if (_1003)
    {
        float _1023 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1009 = _1023;
    }
    float _1025 = _1009;
    if (_1003)
    {
        float _1027 = rsqrt(_999);
        _1011 = _1027;
    }
    float _1029 = _1011;
    float _1031 = _1029;
    if (_1003)
    {
        float _1033 = _1007 * _1025;
        _1013 = _1033;
    }
    float _1035 = _1013;
    if (_1003)
    {
        float _1037 = _1035 * 0.15915493667125701904296875;
        _1015 = _1037;
    }
    float _1039 = _1015;
    float _1041 = _1025;
    if (_1003)
    {
        float _1043 = _1039 * 6.283185482025146484375;
        float _1045 = sin(_1043);
        _1041 = _1045;
    }
    float _1047 = _1041;
    float _1049 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1051 = precise::max(0.0, _1049);
    float _1053 = _963;
    float _1055 = _1051;
    if (_1003)
    {
        float _1057 = _1039 * 6.283185482025146484375;
        float _1059 = cos(_1057);
        _1053 = _1059;
    }
    float _1061 = _1053;
    float _1063 = -_989;
    float _1065 = -_1051;
    float _1067 = fma(_971, _1063, _1065);
    if (!_1003)
    {
        _1017 = _993;
    }
    float _1069 = _1017;
    float _1071 = _1069;
    if (_1003)
    {
        float _1073 = _1067 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1055 = _1073;
    }
    float _1075 = _1055;
    float _1077 = _1047;
    float _1079 = _1075;
    if (_1003)
    {
        float _1081 = fma(_1047, _1075, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1019 = _1081;
    }
    float _1083 = _1019;
    if (!_1003)
    {
        _1077 = _1067;
    }
    float _1085 = _1077;
    float _1087 = _1085;
    float _1089 = _1061;
    if (_1003)
    {
        float _1091 = _1061 + (-1.0);
        _1079 = _1091;
    }
    float _1093 = _1079;
    float _1095 = 0.0;
    float _1097 = _1093;
    if (_1003)
    {
        float _1099 = _1029 * _1083;
        _1095 = _1099;
    }
    float _1101 = _1095;
    float _1103 = sqrt(_985);
    if (_1003)
    {
        float _1105 = _1093 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1031 = _1105;
    }
    float _1107 = _1031;
    if (_1003)
    {
        float _1109 = _991 * _1101;
        _1021 = _1109;
    }
    float _1111 = _1021;
    if (!_1003)
    {
        _1097 = _995;
    }
    float _1113 = _1097;
    float _1115 = _1113;
    if (_1003)
    {
        float _1117 = _993 * _1101;
        _1071 = _1117;
    }
    float _1119 = _1071;
    if (_1003)
    {
        float _1121 = fma(_1067, _1061, _1107);
        _1087 = _1121;
    }
    float _1123 = _1087;
    if (_1003)
    {
        float _1125 = _1111 * _1111;
        _1115 = _1125;
    }
    float _1127 = _1115;
    if (!_1003)
    {
        _1089 = _997;
    }
    float _1129 = _1089;
    float _1131 = _1129;
    if (_1003)
    {
        float _1133 = _1119 * _1119;
        _1131 = _1133;
    }
    float _1135 = _1131;
    float _1137 = fma(_1123, _1123, _1127);
    float _1139 = _1137 + _1135;
    float _1141 = _829 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1143 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1145 = fma(_1103, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1143);
    float _1147 = precise::clamp(_1145, 0.0, 1.0);
    float _1149 = _829 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1151 = rsqrt(_1139);
    float _1153 = fma(_831, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1141);
    float _1155 = _829 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1157 = _829 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1159 = -_1147;
    float _1161 = _1159 + 1.0;
    float _1163 = fma(_833, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1153);
    float _1165 = fma(_831, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1149);
    float _1167 = fma(_831, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1155);
    float _1169 = fma(_831, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1157);
    float _1171 = _1163 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1173 = fma(_833, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1165);
    float _1175 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1177 = fma(_833, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1169);
    float _1179 = _1171 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1181 = fma(_833, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1167);
    float _1183 = _1173 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1185 = _1151 * _1111;
    float _1187 = -_1179;
    float _1189 = fma(_1187, _1175, 1.0);
    float _1191 = _1177 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1193 = abs(_1161);
    float _1195 = log2(_1193);
    float _1197 = _1151 * _1123;
    float _1199 = _1181 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1201 = _1183 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1203 = _1185 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1205 = _1151 * _1119;
    float _1207 = _1197 + 1.0;
    float _1209 = fma(_1199, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1201);
    float _1211 = -_1203;
    float _1213 = fma(_1197, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1211);
    float _1215 = log2(_1189);
    float _1217 = fma(_1171, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1209);
    float _1219 = -_1205;
    float _1221 = fma(_1219, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1213);
    float _1223 = _1183 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1225 = fma(_1191, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1217);
    float _1227 = fma(_1221, -0.5, 0.5);
    float _1229 = _1195 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1231 = _1183 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1233 = 1.0 / _1225;
    float _1235 = fma(_1221, 0.5, 0.5);
    float _1237 = fma(_1199, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1223);
    float _1239 = fma(_1199, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1231);
    float _1241 = fma(_1171, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1237);
    float _1243 = fma(_1171, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1239);
    float _1245 = sqrt(_1227);
    float _1247 = _1215 * 0.693147182464599609375;
    float _1249 = fma(_1191, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1243);
    float _1251 = fma(_1191, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1241);
    float _1253 = _1247 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1255 = exp2(_1229);
    float _1257 = _1249 * _1233;
    float _1259 = _1245 * 0.636619746685028076171875;
    float _1261 = fma(_1235, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1263 = fma(_1257, 0.5, 0.5);
    float _1265 = fma(_1235, _1261, -0.212114393711090087890625);
    float _1267 = -_1197;
    float _1269 = fma(_1255, _1207, _1267);
    float _1271 = fma(_1235, _1265, 1.570728778839111328125);
    float _1273 = _1251 * _1233;
    float _1275 = fma(_1269, 0.5, 0.5);
    float _1277 = -_1271;
    float _1279 = fma(_1259, _1277, 1.0);
    float _1281 = fma(_1273, -0.5, 0.5);
    float3 _3414 = float3(_1263, _1281, _1253);
    float _1283 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3414, float3(0.0), isnan(_3414)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3414, float3(0.0), isnan(_3414)), level(0.0)).x;
    float3 _3425 = float3(_1263, _1281, _1253);
    float4 _1286 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3425, float3(0.0), isnan(_3425)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3425, float3(0.0), isnan(_3425)), level(0.0)).xyzw;
    float _1288 = _1286.x;
    float _1290 = _1286.y;
    float _1292 = _1286.z;
    float _1294 = _1286.w;
    float2 _3442 = float2(_1279, _1275);
    float3 _1298 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3442, float2(0.0), isnan(_3442)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3442, float2(0.0), isnan(_3442)), level(0.0)).xyz;
    float _1300 = _1298.x;
    float _1302 = _1298.y;
    float _1304 = _1298.z;
    float _1306 = in.m_49.y;
    bool _1308 = _137 > 0.5;
    float _1310 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1312 = _427 + _1310;
    float _1314 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1316 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _1314;
    float _1318 = _1183 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _1320 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1322 = _1320 != 0;
    float _1324 = 1.0 / _1316;
    int _1326 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1328 = _1326 != 0;
    float _1330 = fma(_1199, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1318);
    float _1332 = _1195 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1334 = fma(_1171, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1330);
    float _1336 = -_463;
    int _1338 = _1308 ? as_type<int>(_1336) : as_type<int>(_463);
    float _1340 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1342 = _903 > 0.0;
    bool _1344 = isnan(_903);
    bool _1346 = _1342 || _1344;
    bool _1348 = isnan(0.0);
    bool _1350 = _1346 || _1348;
    float _1352 = fma(_1191, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1334);
    bool _1354 = !_1322;
    float _1356 = _1354 ? _463 : as_type<float>(_1338);
    bool _1358 = _967 <= 0.0;
    bool _1360 = !_1350;
    bool _1362 = _1358 || _1360;
    float _1364 = _1312 * _1324;
    bool _1366 = _1306 > 0.5;
    float _1368 = exp2(_1332);
    float _1370 = _1356 + 0.5;
    bool _1372 = _427 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _1374 = isnan(_427);
    bool _1376 = _1372 || _1374;
    bool _1378 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _1380 = _1376 || _1378;
    float _1382 = float(_1380);
    bool _1384 = _427 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _1386 = isnan(_427);
    bool _1388 = _1384 || _1386;
    bool _1390 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _1392 = _1388 || _1390;
    float _1394 = float(_1392);
    float _1396 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _1398 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _1396;
    float _1400 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _1402 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _1400;
    float _1404 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _1406 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _1404;
    float _1408 = -_1382;
    float _1410 = _1408 + 1.0;
    float _1412 = fma(_1398, _1364, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _1414 = -_457;
    int _1416 = _1366 ? as_type<int>(_1414) : as_type<int>(_457);
    float _1418 = fma(_1406, _1364, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _1420 = _1394 * _1410;
    float _1422 = -_1394;
    float _1424 = _1422 + 1.0;
    float _1426 = fma(_1402, _1364, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    bool _1428 = !_1328;
    float _1430 = _1428 ? _457 : as_type<float>(_1416);
    float _1432 = _1418 * _1420;
    float _1434 = _1412 * _1420;
    float _1436 = _1426 * _1420;
    float _1438 = -_1368;
    float _1440 = _1438 + 1.0;
    float _1442 = fma(_1424, (*spvDescriptorSet0.vp_c9)._m0[107].y, _1432);
    float _1444 = fma(_1424, (*spvDescriptorSet0.vp_c9)._m0[107].x, _1434);
    float _1446 = fma(_1424, (*spvDescriptorSet0.vp_c9)._m0[107].z, _1436);
    float _1448 = fma(_1382, (*spvDescriptorSet0.vp_c9)._m0[108].y, _1442);
    float _1450 = fma(_1382, (*spvDescriptorSet0.vp_c9)._m0[108].x, _1444);
    float _1452 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1454 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1456 = _1448 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1458 = _903 * _967;
    float _1460 = _1450 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1462 = fma(_1382, (*spvDescriptorSet0.vp_c9)._m0[108].z, _1446);
    float _1464 = _1456 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1466 = _1458 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1468 = _1440 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1470 = _1462 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1472 = _1466 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1474 = _1352 + _1225;
    float _1476 = -_1430;
    float _1478 = _1476 + 0.5;
    float _1480 = _1460 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1482 = _1470 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1484 = _1474 * 0.5;
    float _1486 = _1370 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1488 = _1478 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1490 = -_1468;
    float _1492 = _1490 + 1.0;
    out.m_58.x = _1480;
    out.m_58.y = _1464;
    out.m_58.z = _1482;
    out.m_58.w = _1454;
    float _1494 = _1486 * _1340;
    float _1496 = _1488 * _1452;
    out.m_45.x = _1472;
    out.m_60.x = _1494;
    out.m_60.y = _1496;
    out.gl_Position.x = _1249;
    out.gl_Position.y = _1251;
    out.gl_Position.z = _1352;
    out.gl_Position.w = _1225;
    out.m_62.z = _1484;
    out.m_62.w = _1225;
    float _1498 = _1468 * _1283;
    float _1500 = _1294 * _1492;
    float _1502 = _1294 * _1498;
    float _1504 = _1304 * _1498;
    float _1506 = fma(_1300, _1502, _1288);
    float _1508 = fma(_1302, _1502, _1290);
    float _1510 = fma(_1294, _1504, _1292);
    out.m_64.x = _1506;
    out.m_64.y = _1508;
    out.m_64.z = _1510;
    out.m_64.w = _1500;
    if (!_1362)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_45.x = 0.0;
    float _1512 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1512;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

