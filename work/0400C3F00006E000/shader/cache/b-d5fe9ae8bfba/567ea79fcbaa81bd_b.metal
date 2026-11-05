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
        float _1480 = as_type<float>(_99);
        out.gl_Position.z = _1480;
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
        float _1549 = as_type<float>(_135);
        out.gl_Position.z = _1549;
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
    float _537 = sqrt(_533);
    float _539 = fma(_479, (*spvDescriptorSet0.vp_c8)._m0[25].x, _535);
    float _541 = fma(_431, (*spvDescriptorSet0.vp_c8)._m0[25].z, _539);
    float _543 = _541 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _545 = _531 + _543;
    bool _547 = _537 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _549 = _475;
    float _551 = _541;
    float _553 = _515;
    float _555 = _533;
    if (!_547)
    {
        _549 = _517;
    }
    float _557 = _549;
    float _559 = _557;
    if (!_547)
    {
        _551 = _513;
    }
    float _561 = _551;
    float _563 = _561;
    if (!_547)
    {
        _553 = _545;
    }
    float _565 = _553;
    bool _567 = !_547;
    float _569 = _565;
    if (!_567)
    {
        float _571 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _573 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _575 = _537 + _573;
        float _577 = rsqrt(_533);
        float _579 = _575 * _571;
        float _581 = _545 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _583 = _579 * 0.15915493667125701904296875;
        float _585 = _583 * 6.283185482025146484375;
        float _587 = sin(_585);
        float _589 = _583 * 6.283185482025146484375;
        float _591 = cos(_589);
        float _593 = fma(_587, _581, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _595 = _577 * _593;
        float _597 = _591 + (-1.0);
        float _599 = fma(_527, _595, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _601 = fma(_521, _595, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _603 = _597 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _605 = fma(_545, _591, _603);
        _569 = _605;
        _559 = _599;
        _563 = _601;
    }
    float _607 = _569;
    float _609 = _559;
    float _611 = _563;
    float _613 = -_531;
    float _615 = _613 + _607;
    float _617 = -_507;
    float _619 = _617 + _609;
    float _621 = -_501;
    float _623 = _621 + _611;
    float _625 = _531 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _627 = _615 * _615;
    bool _629 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _631 = isnan(0.5);
    bool _633 = _629 || _631;
    bool _635 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _637 = _633 || _635;
    float _639 = fma(_507, (*spvDescriptorSet0.vp_c8)._m0[11].x, _625);
    float _641 = fma(_619, _619, _627);
    bool _643 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _645 = isnan(0.5);
    bool _647 = _643 || _645;
    bool _649 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _651 = _647 || _649;
    float _653 = fma(_623, _623, _641);
    float _655 = fma(_501, (*spvDescriptorSet0.vp_c8)._m0[11].z, _639);
    float _657 = _531 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _659 = sqrt(_653);
    float _661 = _655 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _663 = fma(_507, (*spvDescriptorSet0.vp_c8)._m0[10].x, _657);
    float _665 = fma(_501, (*spvDescriptorSet0.vp_c8)._m0[10].z, _663);
    float _667 = 1.0 / _661;
    float _669 = _665 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _671 = _669 + _661;
    bool _673 = _659 > 0.0;
    float _675 = _671 * _667;
    float _677 = _675 * 0.5;
    bool _679 = !_673;
    float _681 = _609;
    float _683 = _611;
    float _685 = _607;
    float _687 = _661;
    float _689 = _677;
    if (!_679)
    {
        float _691 = _243 * _243;
        float _693 = fma(_195, _195, _691);
        float _695 = fma(_245, _245, _693);
        float _697 = rsqrt(_653);
        float _699 = sqrt(_695);
        float _701 = _619 * _697;
        float _703 = _623 * _697;
        bool _705 = _699 > 0.0;
        float _707 = _615 * _697;
        bool _709 = !_705;
        _555 = _703;
        _687 = _697;
        if (!_709)
        {
            float _711 = rsqrt(_695);
            float _713 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _715 = _243 * _711;
            float _717 = _195 * _711;
            float _719 = _707 * _715;
            float _721 = _245 * _711;
            float _723 = fma(_701, _717, _719);
            float _725 = _713 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _727 = fma(_703, _721, _723);
            float _729 = _727 * _725;
            float _731 = fma(_195, _729, _609);
            float _733 = fma(_243, _729, _607);
            float _735 = fma(_245, _729, _611);
            _681 = _731;
            _683 = _735;
            _685 = _733;
            _687 = _717;
        }
    }
    float _737 = _681;
    float _739 = _683;
    float _741 = _685;
    float _743 = _555;
    float _745 = _687;
    float _747 = _745;
    float _749 = _741;
    float _751 = _739;
    float _753 = _737;
    float _755 = _743;
    if (_651)
    {
        _747 = 1.0;
    }
    float _757 = _747;
    float _759 = _757;
    if (_637)
    {
        _253 = _737;
    }
    float _761 = _253;
    float _763 = _761;
    if (_637)
    {
        _255 = _739;
    }
    float _765 = _255;
    float _767 = _765;
    if (!_637)
    {
        float _769 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _771 = _531 + _769;
        float _773 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _775 = _507 + _773;
        float _777 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _779 = -_531;
        float _781 = _779 + _741;
        float _783 = _771 * _771;
        float _785 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _787 = _501 + _785;
        float _789 = -_501;
        float _791 = _789 + _739;
        float _793 = fma(_775, _775, _783);
        float _795 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _797 = fma(_787, _787, _793);
        float _799 = sqrt(_797);
        float _801 = _777 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _803 = precise::min(_799, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _805 = _803 * _795;
        float _807 = -_507;
        float _809 = _807 + _737;
        float _811 = _801 * _805;
        float _813 = fma(_809, _811, _507);
        float _815 = fma(_781, _811, _531);
        float _817 = fma(_791, _811, _501);
        _749 = _815;
        _763 = _813;
        _767 = _817;
        _751 = _791;
    }
    float _819 = _749;
    float _821 = _763;
    float _823 = _767;
    float _825 = _751;
    float _827 = _825;
    if (!_651)
    {
        float _829 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _831 = _829 * 0.15915493667125701904296875;
        float _833 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _835 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _837 = fma(_677, (*spvDescriptorSet0.vp_c8)._m0[30].w, _835);
        float _839 = _831 * 6.283185482025146484375;
        float _841 = cos(_839);
        float _843 = _833 * 0.15915493667125701904296875;
        float _845 = _831 * 6.283185482025146484375;
        float _847 = sin(_845);
        float _849 = 1.0 / _841;
        float _851 = _843 * 6.283185482025146484375;
        float _853 = cos(_851);
        float _855 = _847 * _849;
        float _857 = _843 * 6.283185482025146484375;
        float _859 = sin(_857);
        float _861 = _853 * _855;
        float _863 = 1.0 / _837;
        float _865 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _867 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _865;
        float _869 = 1.0 / _861;
        float _871 = 1.0 / _867;
        float _873 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _875 = _863 * _873;
        float _877 = _859 * _869;
        float _879 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _881 = fma(_877, _875, _879);
        float _883 = _881 * _871;
        float _885 = precise::clamp(_883, 0.0, 1.0);
        _689 = _837;
        _827 = _831;
        _759 = _885;
    }
    float _887 = _689;
    float _889 = _827;
    float _891 = _759;
    float _893 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _895 = _819 + _893;
    float _897 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _899 = _821 + _897;
    float _901 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _903 = _823 + _901;
    float _905 = _895 * _895;
    float _907 = fma(_899, _899, _905);
    float _909 = fma(_903, _903, _907);
    float _911 = rsqrt(_909);
    float _913 = _911 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _915 = _899 * _913;
    float _917 = _903 * _913;
    float _919 = _915 * _915;
    float _921 = _917 * _917;
    float _923 = _919 + _921;
    float _925 = sqrt(_923);
    bool _927 = _925 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _929 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _931 = _925 + _929;
    float _933 = _903;
    float _935 = _905;
    float _937 = _931;
    float _939 = _895;
    float _941 = _889;
    float _943 = _915;
    if (_927)
    {
        float _945 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _933 = _945;
    }
    float _947 = _933;
    if (_927)
    {
        float _949 = rsqrt(_923);
        _935 = _949;
    }
    float _951 = _935;
    float _953 = _951;
    if (_927)
    {
        float _955 = _931 * _947;
        _937 = _955;
    }
    float _957 = _937;
    if (_927)
    {
        float _959 = _957 * 0.15915493667125701904296875;
        _753 = _959;
    }
    float _961 = _753;
    float _963 = _947;
    if (_927)
    {
        float _965 = _961 * 6.283185482025146484375;
        float _967 = sin(_965);
        _963 = _967;
    }
    float _969 = _963;
    float _971 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _973 = precise::max(0.0, _971);
    float _975 = _887;
    float _977 = _973;
    if (_927)
    {
        float _979 = _961 * 6.283185482025146484375;
        float _981 = cos(_979);
        _975 = _981;
    }
    float _983 = _975;
    float _985 = -_913;
    float _987 = -_973;
    float _989 = fma(_895, _985, _987);
    if (!_927)
    {
        _939 = _917;
    }
    float _991 = _939;
    float _993 = _991;
    if (_927)
    {
        float _995 = _989 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _977 = _995;
    }
    float _997 = _977;
    float _999 = _969;
    float _1001 = _997;
    if (_927)
    {
        float _1003 = fma(_969, _997, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _941 = _1003;
    }
    float _1005 = _941;
    if (!_927)
    {
        _999 = _989;
    }
    float _1007 = _999;
    float _1009 = _1007;
    float _1011 = _983;
    if (_927)
    {
        float _1013 = _983 + (-1.0);
        _1001 = _1013;
    }
    float _1015 = _1001;
    float _1017 = _1015;
    if (_927)
    {
        float _1019 = _951 * _1005;
        _755 = _1019;
    }
    float _1021 = _755;
    float _1023 = sqrt(_909);
    if (_927)
    {
        float _1025 = _1015 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _953 = _1025;
    }
    float _1027 = _953;
    if (_927)
    {
        float _1029 = _915 * _1021;
        _943 = _1029;
    }
    float _1031 = _943;
    if (!_927)
    {
        _1017 = _919;
    }
    float _1033 = _1017;
    float _1035 = _1033;
    if (_927)
    {
        float _1037 = _917 * _1021;
        _993 = _1037;
    }
    float _1039 = _993;
    if (_927)
    {
        float _1041 = fma(_989, _983, _1027);
        _1009 = _1041;
    }
    float _1043 = _1009;
    if (_927)
    {
        float _1045 = _1031 * _1031;
        _1035 = _1045;
    }
    float _1047 = _1035;
    if (!_927)
    {
        _1011 = _921;
    }
    float _1049 = _1011;
    float _1051 = _1049;
    if (_927)
    {
        float _1053 = _1039 * _1039;
        _1051 = _1053;
    }
    float _1055 = _1051;
    float _1057 = fma(_1043, _1043, _1047);
    float _1059 = _1057 + _1055;
    float _1061 = _819 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1063 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1065 = fma(_1023, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1063);
    float _1067 = precise::clamp(_1065, 0.0, 1.0);
    float _1069 = _819 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1071 = rsqrt(_1059);
    float _1073 = fma(_821, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1061);
    float _1075 = -_1067;
    float _1077 = _1075 + 1.0;
    float _1079 = _819 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1081 = fma(_821, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1069);
    float _1083 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1085 = _819 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1087 = fma(_821, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1079);
    float _1089 = fma(_823, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1081);
    float _1091 = abs(_1077);
    float _1093 = log2(_1091);
    float _1095 = fma(_823, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1073);
    float _1097 = fma(_823, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1087);
    float _1099 = _1089 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1101 = fma(_821, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1085);
    float _1103 = _1095 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1105 = _1071 * _1031;
    float _1107 = _1097 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1109 = _1099 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1111 = _1071 * _1043;
    float _1113 = _1105 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1115 = fma(_823, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1101);
    float _1117 = fma(_1107, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1109);
    float _1119 = _1071 * _1039;
    float _1121 = -_1113;
    float _1123 = fma(_1111, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1121);
    float _1125 = _1103 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1127 = _1115 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1129 = fma(_1103, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1117);
    float _1131 = _1093 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1133 = -_1119;
    float _1135 = fma(_1133, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1123);
    float _1137 = -_1125;
    float _1139 = fma(_1137, _1083, 1.0);
    float _1141 = fma(_1127, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1129);
    float _1143 = _1099 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1145 = fma(_1135, -0.5, 0.5);
    float _1147 = exp2(_1131);
    float _1149 = _1099 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1151 = fma(_1107, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1143);
    float _1153 = fma(_1135, 0.5, 0.5);
    float _1155 = _1111 + 1.0;
    float _1157 = fma(_1107, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1149);
    float _1159 = fma(_1103, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1151);
    float _1161 = fma(_1153, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1163 = log2(_1139);
    float _1165 = fma(_1103, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1157);
    float _1167 = fma(_1127, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1159);
    float _1169 = fma(_1153, _1161, -0.212114393711090087890625);
    float _1171 = fma(_1127, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1165);
    float _1173 = fma(_1153, _1169, 1.570728778839111328125);
    float _1175 = 1.0 / _1141;
    float _1177 = -_1111;
    float _1179 = fma(_1147, _1155, _1177);
    float _1181 = fma(_1179, 0.5, 0.5);
    float _1183 = sqrt(_1145);
    float _1185 = _1163 * 0.693147182464599609375;
    float _1187 = _1185 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1189 = _1167 * _1175;
    float _1191 = _1171 * _1175;
    float _1193 = fma(_1189, 0.5, 0.5);
    float _1195 = fma(_1191, -0.5, 0.5);
    float _1197 = _1183 * 0.636619746685028076171875;
    float3 _3230 = float3(_1193, _1195, _1187);
    float _1199 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3230, float3(0.0), isnan(_3230)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3230, float3(0.0), isnan(_3230)), level(0.0)).x;
    float3 _3241 = float3(_1193, _1195, _1187);
    float4 _1202 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3241, float3(0.0), isnan(_3241)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3241, float3(0.0), isnan(_3241)), level(0.0)).xyzw;
    float _1204 = _1202.x;
    float _1206 = _1202.y;
    float _1208 = _1202.z;
    float _1210 = _1202.w;
    float _1212 = -_1173;
    float _1214 = fma(_1197, _1212, 1.0);
    float2 _3263 = float2(_1214, _1181);
    float3 _1218 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3263, float2(0.0), isnan(_3263)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3263, float2(0.0), isnan(_3263)), level(0.0)).xyz;
    float _1220 = _1218.x;
    float _1222 = _1218.y;
    float _1224 = _1218.z;
    float _1226 = in.m_49.y;
    bool _1228 = _137 > 0.5;
    float _1230 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1232 = _427 + _1230;
    float _1234 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1236 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _1234;
    float _1238 = _1099 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _1240 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1242 = _1240 != 0;
    float _1244 = 1.0 / _1236;
    int _1246 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1248 = _1246 != 0;
    float _1250 = fma(_1107, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1238);
    float _1252 = fma(_1103, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1250);
    float _1254 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1256 = fma(_1127, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1252);
    float _1258 = _891 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1260 = _1258 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1262 = _1232 * _1244;
    float _1264 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _1266 = _427 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _1268 = isnan(_427);
    bool _1270 = _1266 || _1268;
    bool _1272 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _1274 = _1270 || _1272;
    float _1276 = float(_1274);
    out.m_45.x = _1260;
    bool _1278 = _1226 > 0.5;
    float _1280 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _1282 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _1280;
    bool _1284 = _427 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _1286 = isnan(_427);
    bool _1288 = _1284 || _1286;
    bool _1290 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _1292 = _1288 || _1290;
    float _1294 = float(_1292);
    float _1296 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _1298 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _1296;
    float _1300 = -_1276;
    float _1302 = _1300 + 1.0;
    float _1304 = -_457;
    int _1306 = _1278 ? as_type<int>(_1304) : as_type<int>(_457);
    float _1308 = fma(_1282, _1262, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _1310 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _1312 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _1310;
    float _1314 = _1294 * _1302;
    bool _1316 = !_1242;
    float _1318 = _1316 ? _457 : as_type<float>(_1306);
    float _1320 = -_1294;
    float _1322 = _1320 + 1.0;
    float _1324 = -_463;
    int _1326 = _1228 ? as_type<int>(_1324) : as_type<int>(_463);
    float _1328 = _1308 * _1314;
    float _1330 = fma(_1312, _1262, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _1332 = fma(_1298, _1262, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    bool _1334 = !_1248;
    float _1336 = _1334 ? _463 : as_type<float>(_1326);
    float _1338 = fma(_1322, (*spvDescriptorSet0.vp_c9)._m0[107].x, _1328);
    float _1340 = _1093 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1342 = _1330 * _1314;
    float _1344 = _1332 * _1314;
    float _1346 = fma(_1276, (*spvDescriptorSet0.vp_c9)._m0[108].x, _1338);
    float _1348 = exp2(_1340);
    float _1350 = fma(_1322, (*spvDescriptorSet0.vp_c9)._m0[107].y, _1342);
    float _1352 = fma(_1322, (*spvDescriptorSet0.vp_c9)._m0[107].z, _1344);
    float _1354 = _1346 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1356 = _1336 + 0.5;
    float _1358 = fma(_1276, (*spvDescriptorSet0.vp_c9)._m0[108].y, _1350);
    float _1360 = fma(_1276, (*spvDescriptorSet0.vp_c9)._m0[108].z, _1352);
    float _1362 = -_1318;
    float _1364 = _1362 + 0.5;
    float _1366 = _1354 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1368 = _1358 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    bool _1370 = _891 > 0.0;
    bool _1372 = isnan(_891);
    bool _1374 = _1370 || _1372;
    bool _1376 = isnan(0.0);
    bool _1378 = _1374 || _1376;
    float _1380 = _1360 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1382 = _1368 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1384 = _1256 + _1141;
    float _1386 = -_1348;
    float _1388 = _1386 + 1.0;
    float _1390 = _1356 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1392 = _1364 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1394 = _1384 * 0.5;
    float _1396 = _1388 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.gl_Position.x = _1167;
    out.gl_Position.y = _1171;
    out.gl_Position.z = _1256;
    out.gl_Position.w = _1141;
    float _1398 = _1390 * _1254;
    float _1400 = _1392 * _1264;
    float _1402 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1404 = _1380 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_58.x = _1398;
    out.m_58.y = _1400;
    out.m_60.x = _1366;
    out.m_60.y = _1382;
    out.m_60.z = _1404;
    out.m_60.w = _1402;
    out.m_62.z = _1394;
    out.m_62.w = _1141;
    float _1406 = _1396 * _1199;
    float _1408 = -_1396;
    float _1410 = _1408 + 1.0;
    float _1412 = _1210 * _1406;
    float _1414 = _1224 * _1406;
    float _1416 = fma(_1220, _1412, _1204);
    float _1418 = fma(_1222, _1412, _1206);
    float _1420 = _1210 * _1410;
    float _1422 = fma(_1210, _1414, _1208);
    out.m_64.x = _1416;
    out.m_64.y = _1418;
    out.m_64.z = _1422;
    out.m_64.w = _1420;
    if (_1378)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_45.x = 0.0;
    float _1424 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1424;
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
        float _1480 = as_type<float>(_99);
        out.gl_Position.z = _1480;
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
        float _1549 = as_type<float>(_135);
        out.gl_Position.z = _1549;
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
    float _537 = sqrt(_533);
    float _539 = fma(_479, (*spvDescriptorSet0.vp_c8)._m0[25].x, _535);
    float _541 = fma(_431, (*spvDescriptorSet0.vp_c8)._m0[25].z, _539);
    float _543 = _541 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _545 = _531 + _543;
    bool _547 = _537 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _549 = _475;
    float _551 = _541;
    float _553 = _515;
    float _555 = _533;
    if (!_547)
    {
        _549 = _517;
    }
    float _557 = _549;
    float _559 = _557;
    if (!_547)
    {
        _551 = _513;
    }
    float _561 = _551;
    float _563 = _561;
    if (!_547)
    {
        _553 = _545;
    }
    float _565 = _553;
    bool _567 = !_547;
    float _569 = _565;
    if (!_567)
    {
        float _571 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _573 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _575 = _537 + _573;
        float _577 = rsqrt(_533);
        float _579 = _575 * _571;
        float _581 = _545 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _583 = _579 * 0.15915493667125701904296875;
        float _585 = _583 * 6.283185482025146484375;
        float _587 = sin(_585);
        float _589 = _583 * 6.283185482025146484375;
        float _591 = cos(_589);
        float _593 = fma(_587, _581, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _595 = _577 * _593;
        float _597 = _591 + (-1.0);
        float _599 = fma(_527, _595, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _601 = fma(_521, _595, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _603 = _597 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _605 = fma(_545, _591, _603);
        _569 = _605;
        _559 = _599;
        _563 = _601;
    }
    float _607 = _569;
    float _609 = _559;
    float _611 = _563;
    float _613 = -_531;
    float _615 = _613 + _607;
    float _617 = -_507;
    float _619 = _617 + _609;
    float _621 = -_501;
    float _623 = _621 + _611;
    float _625 = _531 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _627 = _615 * _615;
    bool _629 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _631 = isnan(0.5);
    bool _633 = _629 || _631;
    bool _635 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _637 = _633 || _635;
    float _639 = fma(_507, (*spvDescriptorSet0.vp_c8)._m0[11].x, _625);
    float _641 = fma(_619, _619, _627);
    bool _643 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _645 = isnan(0.5);
    bool _647 = _643 || _645;
    bool _649 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _651 = _647 || _649;
    float _653 = fma(_623, _623, _641);
    float _655 = fma(_501, (*spvDescriptorSet0.vp_c8)._m0[11].z, _639);
    float _657 = _531 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _659 = sqrt(_653);
    float _661 = _655 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _663 = fma(_507, (*spvDescriptorSet0.vp_c8)._m0[10].x, _657);
    float _665 = fma(_501, (*spvDescriptorSet0.vp_c8)._m0[10].z, _663);
    float _667 = 1.0 / _661;
    float _669 = _665 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _671 = _669 + _661;
    bool _673 = _659 > 0.0;
    float _675 = _671 * _667;
    float _677 = _675 * 0.5;
    bool _679 = !_673;
    float _681 = _609;
    float _683 = _611;
    float _685 = _607;
    float _687 = _661;
    float _689 = _677;
    if (!_679)
    {
        float _691 = _243 * _243;
        float _693 = fma(_195, _195, _691);
        float _695 = fma(_245, _245, _693);
        float _697 = rsqrt(_653);
        float _699 = sqrt(_695);
        float _701 = _619 * _697;
        float _703 = _623 * _697;
        bool _705 = _699 > 0.0;
        float _707 = _615 * _697;
        bool _709 = !_705;
        _555 = _703;
        _687 = _697;
        if (!_709)
        {
            float _711 = rsqrt(_695);
            float _713 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _715 = _243 * _711;
            float _717 = _195 * _711;
            float _719 = _707 * _715;
            float _721 = _245 * _711;
            float _723 = fma(_701, _717, _719);
            float _725 = _713 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _727 = fma(_703, _721, _723);
            float _729 = _727 * _725;
            float _731 = fma(_195, _729, _609);
            float _733 = fma(_243, _729, _607);
            float _735 = fma(_245, _729, _611);
            _681 = _731;
            _683 = _735;
            _685 = _733;
            _687 = _717;
        }
    }
    float _737 = _681;
    float _739 = _683;
    float _741 = _685;
    float _743 = _555;
    float _745 = _687;
    float _747 = _745;
    float _749 = _741;
    float _751 = _739;
    float _753 = _737;
    float _755 = _743;
    if (_651)
    {
        _747 = 1.0;
    }
    float _757 = _747;
    float _759 = _757;
    if (_637)
    {
        _253 = _737;
    }
    float _761 = _253;
    float _763 = _761;
    if (_637)
    {
        _255 = _739;
    }
    float _765 = _255;
    float _767 = _765;
    if (!_637)
    {
        float _769 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _771 = _531 + _769;
        float _773 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _775 = _507 + _773;
        float _777 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _779 = -_531;
        float _781 = _779 + _741;
        float _783 = _771 * _771;
        float _785 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _787 = _501 + _785;
        float _789 = -_501;
        float _791 = _789 + _739;
        float _793 = fma(_775, _775, _783);
        float _795 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _797 = fma(_787, _787, _793);
        float _799 = sqrt(_797);
        float _801 = _777 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _803 = precise::min(_799, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _805 = _803 * _795;
        float _807 = -_507;
        float _809 = _807 + _737;
        float _811 = _801 * _805;
        float _813 = fma(_809, _811, _507);
        float _815 = fma(_781, _811, _531);
        float _817 = fma(_791, _811, _501);
        _749 = _815;
        _763 = _813;
        _767 = _817;
        _751 = _791;
    }
    float _819 = _749;
    float _821 = _763;
    float _823 = _767;
    float _825 = _751;
    float _827 = _825;
    if (!_651)
    {
        float _829 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _831 = _829 * 0.15915493667125701904296875;
        float _833 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _835 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _837 = fma(_677, (*spvDescriptorSet0.vp_c8)._m0[30].w, _835);
        float _839 = _831 * 6.283185482025146484375;
        float _841 = cos(_839);
        float _843 = _833 * 0.15915493667125701904296875;
        float _845 = _831 * 6.283185482025146484375;
        float _847 = sin(_845);
        float _849 = 1.0 / _841;
        float _851 = _843 * 6.283185482025146484375;
        float _853 = cos(_851);
        float _855 = _847 * _849;
        float _857 = _843 * 6.283185482025146484375;
        float _859 = sin(_857);
        float _861 = _853 * _855;
        float _863 = 1.0 / _837;
        float _865 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _867 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _865;
        float _869 = 1.0 / _861;
        float _871 = 1.0 / _867;
        float _873 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _875 = _863 * _873;
        float _877 = _859 * _869;
        float _879 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _881 = fma(_877, _875, _879);
        float _883 = _881 * _871;
        float _885 = precise::clamp(_883, 0.0, 1.0);
        _689 = _837;
        _827 = _831;
        _759 = _885;
    }
    float _887 = _689;
    float _889 = _827;
    float _891 = _759;
    float _893 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _895 = _819 + _893;
    float _897 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _899 = _821 + _897;
    float _901 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _903 = _823 + _901;
    float _905 = _895 * _895;
    float _907 = fma(_899, _899, _905);
    float _909 = fma(_903, _903, _907);
    float _911 = rsqrt(_909);
    float _913 = _911 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _915 = _899 * _913;
    float _917 = _903 * _913;
    float _919 = _915 * _915;
    float _921 = _917 * _917;
    float _923 = _919 + _921;
    float _925 = sqrt(_923);
    bool _927 = _925 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _929 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _931 = _925 + _929;
    float _933 = _903;
    float _935 = _905;
    float _937 = _931;
    float _939 = _895;
    float _941 = _889;
    float _943 = _915;
    if (_927)
    {
        float _945 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _933 = _945;
    }
    float _947 = _933;
    if (_927)
    {
        float _949 = rsqrt(_923);
        _935 = _949;
    }
    float _951 = _935;
    float _953 = _951;
    if (_927)
    {
        float _955 = _931 * _947;
        _937 = _955;
    }
    float _957 = _937;
    if (_927)
    {
        float _959 = _957 * 0.15915493667125701904296875;
        _753 = _959;
    }
    float _961 = _753;
    float _963 = _947;
    if (_927)
    {
        float _965 = _961 * 6.283185482025146484375;
        float _967 = sin(_965);
        _963 = _967;
    }
    float _969 = _963;
    float _971 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _973 = precise::max(0.0, _971);
    float _975 = _887;
    float _977 = _973;
    if (_927)
    {
        float _979 = _961 * 6.283185482025146484375;
        float _981 = cos(_979);
        _975 = _981;
    }
    float _983 = _975;
    float _985 = -_913;
    float _987 = -_973;
    float _989 = fma(_895, _985, _987);
    if (!_927)
    {
        _939 = _917;
    }
    float _991 = _939;
    float _993 = _991;
    if (_927)
    {
        float _995 = _989 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _977 = _995;
    }
    float _997 = _977;
    float _999 = _969;
    float _1001 = _997;
    if (_927)
    {
        float _1003 = fma(_969, _997, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _941 = _1003;
    }
    float _1005 = _941;
    if (!_927)
    {
        _999 = _989;
    }
    float _1007 = _999;
    float _1009 = _1007;
    float _1011 = _983;
    if (_927)
    {
        float _1013 = _983 + (-1.0);
        _1001 = _1013;
    }
    float _1015 = _1001;
    float _1017 = _1015;
    if (_927)
    {
        float _1019 = _951 * _1005;
        _755 = _1019;
    }
    float _1021 = _755;
    float _1023 = sqrt(_909);
    if (_927)
    {
        float _1025 = _1015 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _953 = _1025;
    }
    float _1027 = _953;
    if (_927)
    {
        float _1029 = _915 * _1021;
        _943 = _1029;
    }
    float _1031 = _943;
    if (!_927)
    {
        _1017 = _919;
    }
    float _1033 = _1017;
    float _1035 = _1033;
    if (_927)
    {
        float _1037 = _917 * _1021;
        _993 = _1037;
    }
    float _1039 = _993;
    if (_927)
    {
        float _1041 = fma(_989, _983, _1027);
        _1009 = _1041;
    }
    float _1043 = _1009;
    if (_927)
    {
        float _1045 = _1031 * _1031;
        _1035 = _1045;
    }
    float _1047 = _1035;
    if (!_927)
    {
        _1011 = _921;
    }
    float _1049 = _1011;
    float _1051 = _1049;
    if (_927)
    {
        float _1053 = _1039 * _1039;
        _1051 = _1053;
    }
    float _1055 = _1051;
    float _1057 = fma(_1043, _1043, _1047);
    float _1059 = _1057 + _1055;
    float _1061 = _819 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1063 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1065 = fma(_1023, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1063);
    float _1067 = precise::clamp(_1065, 0.0, 1.0);
    float _1069 = _819 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1071 = rsqrt(_1059);
    float _1073 = fma(_821, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1061);
    float _1075 = -_1067;
    float _1077 = _1075 + 1.0;
    float _1079 = _819 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1081 = fma(_821, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1069);
    float _1083 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1085 = _819 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1087 = fma(_821, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1079);
    float _1089 = fma(_823, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1081);
    float _1091 = abs(_1077);
    float _1093 = log2(_1091);
    float _1095 = fma(_823, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1073);
    float _1097 = fma(_823, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1087);
    float _1099 = _1089 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1101 = fma(_821, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1085);
    float _1103 = _1095 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1105 = _1071 * _1031;
    float _1107 = _1097 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1109 = _1099 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1111 = _1071 * _1043;
    float _1113 = _1105 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1115 = fma(_823, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1101);
    float _1117 = fma(_1107, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1109);
    float _1119 = _1071 * _1039;
    float _1121 = -_1113;
    float _1123 = fma(_1111, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1121);
    float _1125 = _1103 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1127 = _1115 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1129 = fma(_1103, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1117);
    float _1131 = _1093 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1133 = -_1119;
    float _1135 = fma(_1133, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1123);
    float _1137 = -_1125;
    float _1139 = fma(_1137, _1083, 1.0);
    float _1141 = fma(_1127, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1129);
    float _1143 = _1099 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1145 = fma(_1135, -0.5, 0.5);
    float _1147 = exp2(_1131);
    float _1149 = _1099 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1151 = fma(_1107, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1143);
    float _1153 = fma(_1135, 0.5, 0.5);
    float _1155 = _1111 + 1.0;
    float _1157 = fma(_1107, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1149);
    float _1159 = fma(_1103, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1151);
    float _1161 = fma(_1153, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1163 = log2(_1139);
    float _1165 = fma(_1103, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1157);
    float _1167 = fma(_1127, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1159);
    float _1169 = fma(_1153, _1161, -0.212114393711090087890625);
    float _1171 = fma(_1127, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1165);
    float _1173 = fma(_1153, _1169, 1.570728778839111328125);
    float _1175 = 1.0 / _1141;
    float _1177 = -_1111;
    float _1179 = fma(_1147, _1155, _1177);
    float _1181 = fma(_1179, 0.5, 0.5);
    float _1183 = sqrt(_1145);
    float _1185 = _1163 * 0.693147182464599609375;
    float _1187 = _1185 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1189 = _1167 * _1175;
    float _1191 = _1171 * _1175;
    float _1193 = fma(_1189, 0.5, 0.5);
    float _1195 = fma(_1191, -0.5, 0.5);
    float _1197 = _1183 * 0.636619746685028076171875;
    float3 _3230 = float3(_1193, _1195, _1187);
    float _1199 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3230, float3(0.0), isnan(_3230)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3230, float3(0.0), isnan(_3230)), level(0.0)).x;
    float3 _3241 = float3(_1193, _1195, _1187);
    float4 _1202 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3241, float3(0.0), isnan(_3241)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3241, float3(0.0), isnan(_3241)), level(0.0)).xyzw;
    float _1204 = _1202.x;
    float _1206 = _1202.y;
    float _1208 = _1202.z;
    float _1210 = _1202.w;
    float _1212 = -_1173;
    float _1214 = fma(_1197, _1212, 1.0);
    float2 _3263 = float2(_1214, _1181);
    float3 _1218 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3263, float2(0.0), isnan(_3263)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3263, float2(0.0), isnan(_3263)), level(0.0)).xyz;
    float _1220 = _1218.x;
    float _1222 = _1218.y;
    float _1224 = _1218.z;
    float _1226 = in.m_49.y;
    bool _1228 = _137 > 0.5;
    float _1230 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1232 = _427 + _1230;
    float _1234 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1236 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _1234;
    float _1238 = _1099 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _1240 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1242 = _1240 != 0;
    float _1244 = 1.0 / _1236;
    int _1246 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1248 = _1246 != 0;
    float _1250 = fma(_1107, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1238);
    float _1252 = fma(_1103, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1250);
    float _1254 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1256 = fma(_1127, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1252);
    float _1258 = _891 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1260 = _1258 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1262 = _1232 * _1244;
    float _1264 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _1266 = _427 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _1268 = isnan(_427);
    bool _1270 = _1266 || _1268;
    bool _1272 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _1274 = _1270 || _1272;
    float _1276 = float(_1274);
    out.m_45.x = _1260;
    bool _1278 = _1226 > 0.5;
    float _1280 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _1282 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _1280;
    bool _1284 = _427 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _1286 = isnan(_427);
    bool _1288 = _1284 || _1286;
    bool _1290 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _1292 = _1288 || _1290;
    float _1294 = float(_1292);
    float _1296 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _1298 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _1296;
    float _1300 = -_1276;
    float _1302 = _1300 + 1.0;
    float _1304 = -_457;
    int _1306 = _1278 ? as_type<int>(_1304) : as_type<int>(_457);
    float _1308 = fma(_1282, _1262, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _1310 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _1312 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _1310;
    float _1314 = _1294 * _1302;
    bool _1316 = !_1242;
    float _1318 = _1316 ? _457 : as_type<float>(_1306);
    float _1320 = -_1294;
    float _1322 = _1320 + 1.0;
    float _1324 = -_463;
    int _1326 = _1228 ? as_type<int>(_1324) : as_type<int>(_463);
    float _1328 = _1308 * _1314;
    float _1330 = fma(_1312, _1262, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _1332 = fma(_1298, _1262, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    bool _1334 = !_1248;
    float _1336 = _1334 ? _463 : as_type<float>(_1326);
    float _1338 = fma(_1322, (*spvDescriptorSet0.vp_c9)._m0[107].x, _1328);
    float _1340 = _1093 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1342 = _1330 * _1314;
    float _1344 = _1332 * _1314;
    float _1346 = fma(_1276, (*spvDescriptorSet0.vp_c9)._m0[108].x, _1338);
    float _1348 = exp2(_1340);
    float _1350 = fma(_1322, (*spvDescriptorSet0.vp_c9)._m0[107].y, _1342);
    float _1352 = fma(_1322, (*spvDescriptorSet0.vp_c9)._m0[107].z, _1344);
    float _1354 = _1346 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1356 = _1336 + 0.5;
    float _1358 = fma(_1276, (*spvDescriptorSet0.vp_c9)._m0[108].y, _1350);
    float _1360 = fma(_1276, (*spvDescriptorSet0.vp_c9)._m0[108].z, _1352);
    float _1362 = -_1318;
    float _1364 = _1362 + 0.5;
    float _1366 = _1354 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1368 = _1358 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    bool _1370 = _891 > 0.0;
    bool _1372 = isnan(_891);
    bool _1374 = _1370 || _1372;
    bool _1376 = isnan(0.0);
    bool _1378 = _1374 || _1376;
    float _1380 = _1360 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1382 = _1368 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1384 = _1256 + _1141;
    float _1386 = -_1348;
    float _1388 = _1386 + 1.0;
    float _1390 = _1356 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1392 = _1364 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1394 = _1384 * 0.5;
    float _1396 = _1388 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.gl_Position.x = _1167;
    out.gl_Position.y = _1171;
    out.gl_Position.z = _1256;
    out.gl_Position.w = _1141;
    float _1398 = _1390 * _1254;
    float _1400 = _1392 * _1264;
    float _1402 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1404 = _1380 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_58.x = _1398;
    out.m_58.y = _1400;
    out.m_60.x = _1366;
    out.m_60.y = _1382;
    out.m_60.z = _1404;
    out.m_60.w = _1402;
    out.m_62.z = _1394;
    out.m_62.w = _1141;
    float _1406 = _1396 * _1199;
    float _1408 = -_1396;
    float _1410 = _1408 + 1.0;
    float _1412 = _1210 * _1406;
    float _1414 = _1224 * _1406;
    float _1416 = fma(_1220, _1412, _1204);
    float _1418 = fma(_1222, _1412, _1206);
    float _1420 = _1210 * _1410;
    float _1422 = fma(_1210, _1414, _1208);
    out.m_64.x = _1416;
    out.m_64.y = _1418;
    out.m_64.z = _1422;
    out.m_64.w = _1420;
    if (_1378)
    {
        return out;
    }
    out.m_45.x = 0.0;
    float _1424 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1424;
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
        float _1480 = as_type<float>(_99);
        out.gl_Position.z = _1480;
    }
    if (!_87)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
        float _1549 = as_type<float>(_135);
        out.gl_Position.z = _1549;
    }
    if (_125)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
    float _537 = sqrt(_533);
    float _539 = fma(_479, (*spvDescriptorSet0.vp_c8)._m0[25].x, _535);
    float _541 = fma(_431, (*spvDescriptorSet0.vp_c8)._m0[25].z, _539);
    float _543 = _541 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _545 = _531 + _543;
    bool _547 = _537 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _549 = _475;
    float _551 = _541;
    float _553 = _515;
    float _555 = _533;
    if (!_547)
    {
        _549 = _517;
    }
    float _557 = _549;
    float _559 = _557;
    if (!_547)
    {
        _551 = _513;
    }
    float _561 = _551;
    float _563 = _561;
    if (!_547)
    {
        _553 = _545;
    }
    float _565 = _553;
    bool _567 = !_547;
    float _569 = _565;
    if (!_567)
    {
        float _571 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _573 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _575 = _537 + _573;
        float _577 = rsqrt(_533);
        float _579 = _575 * _571;
        float _581 = _545 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _583 = _579 * 0.15915493667125701904296875;
        float _585 = _583 * 6.283185482025146484375;
        float _587 = sin(_585);
        float _589 = _583 * 6.283185482025146484375;
        float _591 = cos(_589);
        float _593 = fma(_587, _581, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _595 = _577 * _593;
        float _597 = _591 + (-1.0);
        float _599 = fma(_527, _595, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _601 = fma(_521, _595, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _603 = _597 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _605 = fma(_545, _591, _603);
        _569 = _605;
        _559 = _599;
        _563 = _601;
    }
    float _607 = _569;
    float _609 = _559;
    float _611 = _563;
    float _613 = -_531;
    float _615 = _613 + _607;
    float _617 = -_507;
    float _619 = _617 + _609;
    float _621 = -_501;
    float _623 = _621 + _611;
    float _625 = _531 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _627 = _615 * _615;
    bool _629 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _631 = isnan(0.5);
    bool _633 = _629 || _631;
    bool _635 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _637 = _633 || _635;
    float _639 = fma(_507, (*spvDescriptorSet0.vp_c8)._m0[11].x, _625);
    float _641 = fma(_619, _619, _627);
    bool _643 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _645 = isnan(0.5);
    bool _647 = _643 || _645;
    bool _649 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _651 = _647 || _649;
    float _653 = fma(_623, _623, _641);
    float _655 = fma(_501, (*spvDescriptorSet0.vp_c8)._m0[11].z, _639);
    float _657 = _531 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _659 = sqrt(_653);
    float _661 = _655 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _663 = fma(_507, (*spvDescriptorSet0.vp_c8)._m0[10].x, _657);
    float _665 = fma(_501, (*spvDescriptorSet0.vp_c8)._m0[10].z, _663);
    float _667 = 1.0 / _661;
    float _669 = _665 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _671 = _669 + _661;
    bool _673 = _659 > 0.0;
    float _675 = _671 * _667;
    float _677 = _675 * 0.5;
    bool _679 = !_673;
    float _681 = _609;
    float _683 = _611;
    float _685 = _607;
    float _687 = _661;
    float _689 = _677;
    if (!_679)
    {
        float _691 = _243 * _243;
        float _693 = fma(_195, _195, _691);
        float _695 = fma(_245, _245, _693);
        float _697 = rsqrt(_653);
        float _699 = sqrt(_695);
        float _701 = _619 * _697;
        float _703 = _623 * _697;
        bool _705 = _699 > 0.0;
        float _707 = _615 * _697;
        bool _709 = !_705;
        _555 = _703;
        _687 = _697;
        if (!_709)
        {
            float _711 = rsqrt(_695);
            float _713 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _715 = _243 * _711;
            float _717 = _195 * _711;
            float _719 = _707 * _715;
            float _721 = _245 * _711;
            float _723 = fma(_701, _717, _719);
            float _725 = _713 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _727 = fma(_703, _721, _723);
            float _729 = _727 * _725;
            float _731 = fma(_195, _729, _609);
            float _733 = fma(_243, _729, _607);
            float _735 = fma(_245, _729, _611);
            _681 = _731;
            _683 = _735;
            _685 = _733;
            _687 = _717;
        }
    }
    float _737 = _681;
    float _739 = _683;
    float _741 = _685;
    float _743 = _555;
    float _745 = _687;
    float _747 = _745;
    float _749 = _741;
    float _751 = _739;
    float _753 = _737;
    float _755 = _743;
    if (_651)
    {
        _747 = 1.0;
    }
    float _757 = _747;
    float _759 = _757;
    if (_637)
    {
        _253 = _737;
    }
    float _761 = _253;
    float _763 = _761;
    if (_637)
    {
        _255 = _739;
    }
    float _765 = _255;
    float _767 = _765;
    if (!_637)
    {
        float _769 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _771 = _531 + _769;
        float _773 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _775 = _507 + _773;
        float _777 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _779 = -_531;
        float _781 = _779 + _741;
        float _783 = _771 * _771;
        float _785 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _787 = _501 + _785;
        float _789 = -_501;
        float _791 = _789 + _739;
        float _793 = fma(_775, _775, _783);
        float _795 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _797 = fma(_787, _787, _793);
        float _799 = sqrt(_797);
        float _801 = _777 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _803 = precise::min(_799, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _805 = _803 * _795;
        float _807 = -_507;
        float _809 = _807 + _737;
        float _811 = _801 * _805;
        float _813 = fma(_809, _811, _507);
        float _815 = fma(_781, _811, _531);
        float _817 = fma(_791, _811, _501);
        _749 = _815;
        _763 = _813;
        _767 = _817;
        _751 = _791;
    }
    float _819 = _749;
    float _821 = _763;
    float _823 = _767;
    float _825 = _751;
    float _827 = _825;
    if (!_651)
    {
        float _829 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _831 = _829 * 0.15915493667125701904296875;
        float _833 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _835 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _837 = fma(_677, (*spvDescriptorSet0.vp_c8)._m0[30].w, _835);
        float _839 = _831 * 6.283185482025146484375;
        float _841 = cos(_839);
        float _843 = _833 * 0.15915493667125701904296875;
        float _845 = _831 * 6.283185482025146484375;
        float _847 = sin(_845);
        float _849 = 1.0 / _841;
        float _851 = _843 * 6.283185482025146484375;
        float _853 = cos(_851);
        float _855 = _847 * _849;
        float _857 = _843 * 6.283185482025146484375;
        float _859 = sin(_857);
        float _861 = _853 * _855;
        float _863 = 1.0 / _837;
        float _865 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _867 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _865;
        float _869 = 1.0 / _861;
        float _871 = 1.0 / _867;
        float _873 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _875 = _863 * _873;
        float _877 = _859 * _869;
        float _879 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _881 = fma(_877, _875, _879);
        float _883 = _881 * _871;
        float _885 = precise::clamp(_883, 0.0, 1.0);
        _689 = _837;
        _827 = _831;
        _759 = _885;
    }
    float _887 = _689;
    float _889 = _827;
    float _891 = _759;
    float _893 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _895 = _819 + _893;
    float _897 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _899 = _821 + _897;
    float _901 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _903 = _823 + _901;
    float _905 = _895 * _895;
    float _907 = fma(_899, _899, _905);
    float _909 = fma(_903, _903, _907);
    float _911 = rsqrt(_909);
    float _913 = _911 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _915 = _899 * _913;
    float _917 = _903 * _913;
    float _919 = _915 * _915;
    float _921 = _917 * _917;
    float _923 = _919 + _921;
    float _925 = sqrt(_923);
    bool _927 = _925 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _929 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _931 = _925 + _929;
    float _933 = _903;
    float _935 = _905;
    float _937 = _931;
    float _939 = _895;
    float _941 = _889;
    float _943 = _915;
    if (_927)
    {
        float _945 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _933 = _945;
    }
    float _947 = _933;
    if (_927)
    {
        float _949 = rsqrt(_923);
        _935 = _949;
    }
    float _951 = _935;
    float _953 = _951;
    if (_927)
    {
        float _955 = _931 * _947;
        _937 = _955;
    }
    float _957 = _937;
    if (_927)
    {
        float _959 = _957 * 0.15915493667125701904296875;
        _753 = _959;
    }
    float _961 = _753;
    float _963 = _947;
    if (_927)
    {
        float _965 = _961 * 6.283185482025146484375;
        float _967 = sin(_965);
        _963 = _967;
    }
    float _969 = _963;
    float _971 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _973 = precise::max(0.0, _971);
    float _975 = _887;
    float _977 = _973;
    if (_927)
    {
        float _979 = _961 * 6.283185482025146484375;
        float _981 = cos(_979);
        _975 = _981;
    }
    float _983 = _975;
    float _985 = -_913;
    float _987 = -_973;
    float _989 = fma(_895, _985, _987);
    if (!_927)
    {
        _939 = _917;
    }
    float _991 = _939;
    float _993 = _991;
    if (_927)
    {
        float _995 = _989 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _977 = _995;
    }
    float _997 = _977;
    float _999 = _969;
    float _1001 = _997;
    if (_927)
    {
        float _1003 = fma(_969, _997, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _941 = _1003;
    }
    float _1005 = _941;
    if (!_927)
    {
        _999 = _989;
    }
    float _1007 = _999;
    float _1009 = _1007;
    float _1011 = _983;
    if (_927)
    {
        float _1013 = _983 + (-1.0);
        _1001 = _1013;
    }
    float _1015 = _1001;
    float _1017 = _1015;
    if (_927)
    {
        float _1019 = _951 * _1005;
        _755 = _1019;
    }
    float _1021 = _755;
    float _1023 = sqrt(_909);
    if (_927)
    {
        float _1025 = _1015 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _953 = _1025;
    }
    float _1027 = _953;
    if (_927)
    {
        float _1029 = _915 * _1021;
        _943 = _1029;
    }
    float _1031 = _943;
    if (!_927)
    {
        _1017 = _919;
    }
    float _1033 = _1017;
    float _1035 = _1033;
    if (_927)
    {
        float _1037 = _917 * _1021;
        _993 = _1037;
    }
    float _1039 = _993;
    if (_927)
    {
        float _1041 = fma(_989, _983, _1027);
        _1009 = _1041;
    }
    float _1043 = _1009;
    if (_927)
    {
        float _1045 = _1031 * _1031;
        _1035 = _1045;
    }
    float _1047 = _1035;
    if (!_927)
    {
        _1011 = _921;
    }
    float _1049 = _1011;
    float _1051 = _1049;
    if (_927)
    {
        float _1053 = _1039 * _1039;
        _1051 = _1053;
    }
    float _1055 = _1051;
    float _1057 = fma(_1043, _1043, _1047);
    float _1059 = _1057 + _1055;
    float _1061 = _819 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1063 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1065 = fma(_1023, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1063);
    float _1067 = precise::clamp(_1065, 0.0, 1.0);
    float _1069 = _819 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1071 = rsqrt(_1059);
    float _1073 = fma(_821, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1061);
    float _1075 = -_1067;
    float _1077 = _1075 + 1.0;
    float _1079 = _819 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1081 = fma(_821, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1069);
    float _1083 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1085 = _819 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1087 = fma(_821, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1079);
    float _1089 = fma(_823, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1081);
    float _1091 = abs(_1077);
    float _1093 = log2(_1091);
    float _1095 = fma(_823, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1073);
    float _1097 = fma(_823, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1087);
    float _1099 = _1089 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1101 = fma(_821, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1085);
    float _1103 = _1095 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1105 = _1071 * _1031;
    float _1107 = _1097 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1109 = _1099 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1111 = _1071 * _1043;
    float _1113 = _1105 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1115 = fma(_823, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1101);
    float _1117 = fma(_1107, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1109);
    float _1119 = _1071 * _1039;
    float _1121 = -_1113;
    float _1123 = fma(_1111, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1121);
    float _1125 = _1103 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1127 = _1115 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1129 = fma(_1103, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1117);
    float _1131 = _1093 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1133 = -_1119;
    float _1135 = fma(_1133, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1123);
    float _1137 = -_1125;
    float _1139 = fma(_1137, _1083, 1.0);
    float _1141 = fma(_1127, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1129);
    float _1143 = _1099 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1145 = fma(_1135, -0.5, 0.5);
    float _1147 = exp2(_1131);
    float _1149 = _1099 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1151 = fma(_1107, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1143);
    float _1153 = fma(_1135, 0.5, 0.5);
    float _1155 = _1111 + 1.0;
    float _1157 = fma(_1107, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1149);
    float _1159 = fma(_1103, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1151);
    float _1161 = fma(_1153, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1163 = log2(_1139);
    float _1165 = fma(_1103, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1157);
    float _1167 = fma(_1127, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1159);
    float _1169 = fma(_1153, _1161, -0.212114393711090087890625);
    float _1171 = fma(_1127, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1165);
    float _1173 = fma(_1153, _1169, 1.570728778839111328125);
    float _1175 = 1.0 / _1141;
    float _1177 = -_1111;
    float _1179 = fma(_1147, _1155, _1177);
    float _1181 = fma(_1179, 0.5, 0.5);
    float _1183 = sqrt(_1145);
    float _1185 = _1163 * 0.693147182464599609375;
    float _1187 = _1185 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1189 = _1167 * _1175;
    float _1191 = _1171 * _1175;
    float _1193 = fma(_1189, 0.5, 0.5);
    float _1195 = fma(_1191, -0.5, 0.5);
    float _1197 = _1183 * 0.636619746685028076171875;
    float3 _3230 = float3(_1193, _1195, _1187);
    float _1199 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3230, float3(0.0), isnan(_3230)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3230, float3(0.0), isnan(_3230)), level(0.0)).x;
    float3 _3241 = float3(_1193, _1195, _1187);
    float4 _1202 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3241, float3(0.0), isnan(_3241)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3241, float3(0.0), isnan(_3241)), level(0.0)).xyzw;
    float _1204 = _1202.x;
    float _1206 = _1202.y;
    float _1208 = _1202.z;
    float _1210 = _1202.w;
    float _1212 = -_1173;
    float _1214 = fma(_1197, _1212, 1.0);
    float2 _3263 = float2(_1214, _1181);
    float3 _1218 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3263, float2(0.0), isnan(_3263)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3263, float2(0.0), isnan(_3263)), level(0.0)).xyz;
    float _1220 = _1218.x;
    float _1222 = _1218.y;
    float _1224 = _1218.z;
    float _1226 = in.m_49.y;
    bool _1228 = _137 > 0.5;
    float _1230 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1232 = _427 + _1230;
    float _1234 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1236 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _1234;
    float _1238 = _1099 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _1240 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1242 = _1240 != 0;
    float _1244 = 1.0 / _1236;
    int _1246 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1248 = _1246 != 0;
    float _1250 = fma(_1107, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1238);
    float _1252 = fma(_1103, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1250);
    float _1254 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1256 = fma(_1127, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1252);
    float _1258 = _891 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1260 = _1258 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1262 = _1232 * _1244;
    float _1264 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _1266 = _427 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _1268 = isnan(_427);
    bool _1270 = _1266 || _1268;
    bool _1272 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _1274 = _1270 || _1272;
    float _1276 = float(_1274);
    out.m_45.x = _1260;
    bool _1278 = _1226 > 0.5;
    float _1280 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _1282 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _1280;
    bool _1284 = _427 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _1286 = isnan(_427);
    bool _1288 = _1284 || _1286;
    bool _1290 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _1292 = _1288 || _1290;
    float _1294 = float(_1292);
    float _1296 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _1298 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _1296;
    float _1300 = -_1276;
    float _1302 = _1300 + 1.0;
    float _1304 = -_457;
    int _1306 = _1278 ? as_type<int>(_1304) : as_type<int>(_457);
    float _1308 = fma(_1282, _1262, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _1310 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _1312 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _1310;
    float _1314 = _1294 * _1302;
    bool _1316 = !_1242;
    float _1318 = _1316 ? _457 : as_type<float>(_1306);
    float _1320 = -_1294;
    float _1322 = _1320 + 1.0;
    float _1324 = -_463;
    int _1326 = _1228 ? as_type<int>(_1324) : as_type<int>(_463);
    float _1328 = _1308 * _1314;
    float _1330 = fma(_1312, _1262, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _1332 = fma(_1298, _1262, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    bool _1334 = !_1248;
    float _1336 = _1334 ? _463 : as_type<float>(_1326);
    float _1338 = fma(_1322, (*spvDescriptorSet0.vp_c9)._m0[107].x, _1328);
    float _1340 = _1093 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1342 = _1330 * _1314;
    float _1344 = _1332 * _1314;
    float _1346 = fma(_1276, (*spvDescriptorSet0.vp_c9)._m0[108].x, _1338);
    float _1348 = exp2(_1340);
    float _1350 = fma(_1322, (*spvDescriptorSet0.vp_c9)._m0[107].y, _1342);
    float _1352 = fma(_1322, (*spvDescriptorSet0.vp_c9)._m0[107].z, _1344);
    float _1354 = _1346 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1356 = _1336 + 0.5;
    float _1358 = fma(_1276, (*spvDescriptorSet0.vp_c9)._m0[108].y, _1350);
    float _1360 = fma(_1276, (*spvDescriptorSet0.vp_c9)._m0[108].z, _1352);
    float _1362 = -_1318;
    float _1364 = _1362 + 0.5;
    float _1366 = _1354 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1368 = _1358 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    bool _1370 = _891 > 0.0;
    bool _1372 = isnan(_891);
    bool _1374 = _1370 || _1372;
    bool _1376 = isnan(0.0);
    bool _1378 = _1374 || _1376;
    float _1380 = _1360 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1382 = _1368 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1384 = _1256 + _1141;
    float _1386 = -_1348;
    float _1388 = _1386 + 1.0;
    float _1390 = _1356 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1392 = _1364 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1394 = _1384 * 0.5;
    float _1396 = _1388 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.gl_Position.x = _1167;
    out.gl_Position.y = _1171;
    out.gl_Position.z = _1256;
    out.gl_Position.w = _1141;
    float _1398 = _1390 * _1254;
    float _1400 = _1392 * _1264;
    float _1402 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1404 = _1380 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_58.x = _1398;
    out.m_58.y = _1400;
    out.m_60.x = _1366;
    out.m_60.y = _1382;
    out.m_60.z = _1404;
    out.m_60.w = _1402;
    out.m_62.z = _1394;
    out.m_62.w = _1141;
    float _1406 = _1396 * _1199;
    float _1408 = -_1396;
    float _1410 = _1408 + 1.0;
    float _1412 = _1210 * _1406;
    float _1414 = _1224 * _1406;
    float _1416 = fma(_1220, _1412, _1204);
    float _1418 = fma(_1222, _1412, _1206);
    float _1420 = _1210 * _1410;
    float _1422 = fma(_1210, _1414, _1208);
    out.m_64.x = _1416;
    out.m_64.y = _1418;
    out.m_64.z = _1422;
    out.m_64.w = _1420;
    if (_1378)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_45.x = 0.0;
    float _1424 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1424;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

