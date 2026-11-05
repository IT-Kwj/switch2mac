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
    float4 m_62 [[user(locn1)]];
    float4 m_56 [[user(locn2)]];
    float4 m_45 [[user(locn3)]];
    float4 m_58 [[user(locn4)]];
    float4 m_64 [[user(locn6)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
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
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    bool _383 = false;
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
        float _1482 = as_type<float>(_99);
        out.gl_Position.z = _1482;
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
    if (_113)
    {
        float _119 = float(_83);
        _93 = _119;
    }
    float _121 = _93;
    bool _123 = _117 >= _121;
    bool _125 = !_113;
    bool _127 = _123 || _125;
    float _129 = _121;
    if (_127)
    {
        _129 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _131 = _129;
    if (_127)
    {
        out.m_45.x = 0.0;
    }
    if (_127)
    {
        float _133 = _131 * 5.0;
        _101 = as_type<int>(_133);
    }
    int _135 = _101;
    if (_127)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1551 = as_type<float>(_135);
        out.gl_Position.z = _1551;
    }
    if (_127)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _137 = in.m_49.x;
    float _139 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _141 = _117 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    bool _143 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _145 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _147 = _143 || _145;
    bool _149 = isnan(1.0);
    bool _151 = _147 || _149;
    float _153 = _141 * _139;
    int _155 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _157 = _155 != 0;
    float _159 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[20].x, _153);
    float _161 = _159 * 6.283185482025146484375;
    float _163 = floor(_159);
    float _165 = _161 * 0.15915493667125701904296875;
    float _167 = _117 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _169 = 0.0;
    float _171 = _167;
    if (!_151)
    {
        float _173 = _167 * _167;
        float _175 = _173 * 0.5;
        _169 = _175;
    }
    float _177 = _169;
    float _179 = _165 * 6.283185482025146484375;
    float _181 = cos(_179);
    float _183 = _177;
    if (!_151)
    {
        float _185 = _177 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _183 = _185;
    }
    float _187 = _183;
    float _189 = -_163;
    float _191 = _159 + _189;
    bool _193 = _191 < 0.5;
    float _195 = float(_193);
    bool _197 = !_151;
    float _199 = _187;
    if (!_197)
    {
        float _201 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _203 = log2(_201);
        float _205 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _207 = _205 + 1.0;
        float _209 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _211 = _167 * _203;
        float _213 = 1.0 / _207;
        float _215 = _209 * 0.693147182464599609375;
        float _217 = exp2(_211);
        float _219 = 1.0 / _215;
        float _221 = _217 + (-1.0);
        float _223 = -_221;
        float _225 = fma(_223, _219, _167);
        float _227 = _225 * _213;
        float _229 = _227 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _199 = _229;
    }
    float _231 = _199;
    bool _233 = !_151;
    if (!_233)
    {
        float _235 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _237 = log2(_235);
        float _239 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _241 = _239 + 1.0;
        float _243 = 1.0 / _241;
        float _245 = _167 * _237;
        float _247 = exp2(_245);
        float _249 = -_247;
        float _251 = _249 + 1.0;
        float _253 = _251 * _243;
        _171 = _253;
    }
    float _255 = _171;
    float _257 = fma(_181, 0.5, 0.5);
    float _259 = -_191;
    float _261 = fma(_259, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _263 = _231 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _265 = -_257;
    float _267 = fma(_265, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _269 = -_195;
    float _271 = fma(_269, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _273 = in.m_47.x;
    float _275 = in.m_47.y;
    float _277 = in.m_47.z;
    int _279 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _281 = _279 != 0;
    int _283 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _285 = _283 != 0;
    float _287 = _231 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _289 = _263 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _291 = in.m_51.w;
    float _293 = _263 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _295 = _263 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _297 = fma(_287, (*spvDescriptorSet0.vp_c10)._m0[8].x, _289);
    float _299 = in.m_42.x;
    float _301 = in.m_42.y;
    float _303 = in.m_42.z;
    bool _305 = !_157;
    int _307 = _305 ? 0 : 1;
    float _309 = _231 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    bool _311 = !_281;
    int _313 = _311 ? 0 : 1;
    float _315 = fma(_287, (*spvDescriptorSet0.vp_c10)._m0[8].y, _293);
    float _317 = fma(_287, (*spvDescriptorSet0.vp_c10)._m0[8].z, _295);
    int _319 = abs(_307);
    float _321 = fma(_309, (*spvDescriptorSet0.vp_c10)._m0[10].x, _297);
    int _323 = abs(_313);
    float _325 = fma(_309, (*spvDescriptorSet0.vp_c10)._m0[10].y, _315);
    bool _327 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _329 = fma(_309, (*spvDescriptorSet0.vp_c10)._m0[10].z, _317);
    bool _331 = !_285;
    int _333 = _331 ? 0 : 1;
    float _335 = float(_323);
    float _337 = fma(_255, _273, _321);
    float _339 = fma(_255, _275, _325);
    int _341 = abs(_333);
    float _343 = fma(_255, _277, _329);
    float _345 = float(_319);
    float _347 = abs(_261);
    float _349 = _335 * _347;
    float _351 = float(_341);
    float _353 = fma(_343, _291, _303);
    float _355 = fma(_337, _291, _299);
    float _357 = fma(_345, _267, _349);
    float _359 = fma(_339, _291, _301);
    float _361 = abs(_271);
    float _363 = fma(_351, _361, _357);
    bool _365 = !_327;
    float _381;
    if (!_365)
    {
        float _367 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _369 = _137 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _371 = fma(_369, (*spvDescriptorSet0.vp_c9)._m0[12].x, _117);
        float _373 = _371 * _367;
        float _375 = floor(_373);
        float _377 = -_375;
        float _379 = _373 + _377;
        _381 = _379;
        _383 = true;
    }
    else
    {
        float _385 = float(_83);
        float _387 = 1.0 / _385;
        float _389 = _117 * _387;
        _381 = _389;
    }
    _383 = false;
    float _391 = _381;
    float _393 = _359 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _395 = _359 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _397 = _359 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _399 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _401 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _399;
    float _403 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _405 = _403 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _407 = fma(_355, (*spvDescriptorSet0.vp_c10)._m0[5].x, _393);
    float _409 = fma(_355, (*spvDescriptorSet0.vp_c10)._m0[4].x, _395);
    float _411 = 1.0 / _401;
    float _413 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _415 = _391 + _413;
    float _417 = fma(_355, (*spvDescriptorSet0.vp_c10)._m0[6].x, _397);
    float _419 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _421 = _391 + _419;
    float _423 = fma(_353, (*spvDescriptorSet0.vp_c10)._m0[4].z, _409);
    bool _425 = _391 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _427 = isnan(_391);
    bool _429 = _425 || _427;
    bool _431 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _433 = _429 || _431;
    float _435 = float(_433);
    float _437 = 1.0 / _405;
    float _439 = fma(_353, (*spvDescriptorSet0.vp_c10)._m0[5].z, _407);
    bool _441 = _391 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _443 = isnan(_391);
    bool _445 = _441 || _443;
    bool _447 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _449 = _445 || _447;
    float _451 = float(_449);
    float _453 = _439 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _455 = _421 * _411;
    float _457 = fma(_353, (*spvDescriptorSet0.vp_c10)._m0[6].z, _417);
    float _459 = _423 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _461 = -_453;
    float _463 = _461 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    bool _465 = _391 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _467 = isnan(_391);
    bool _469 = _465 || _467;
    bool _471 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _473 = _469 || _471;
    float _475 = float(_473);
    float _477 = _457 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _479 = -_459;
    float _481 = _479 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _483 = _463 * _463;
    float _485 = _415 * _437;
    float _487 = -_435;
    float _489 = _487 + 1.0;
    float _491 = -_477;
    float _493 = _491 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _495 = fma(_481, _481, _483);
    bool _497 = _391 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _499 = isnan(_391);
    bool _501 = _497 || _499;
    bool _503 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _505 = _501 || _503;
    float _507 = float(_505);
    float _509 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _511 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _509;
    float _513 = _475 * _489;
    float _515 = fma(_493, _493, _495);
    float _517 = -_475;
    float _519 = _517 + 1.0;
    float _521 = 1.0 / _511;
    float _523 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _525 = _391 + _523;
    float _527 = _451 * _519;
    float _529 = -_451;
    float _531 = _529 + 1.0;
    float _533 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _535 = _533 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _537 = rsqrt(_515);
    float _539 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _541 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _539;
    float _543 = _507 * _531;
    float _545 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _547 = _545 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _549 = fma(_535, _485, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _551 = fma(_541, _455, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _553 = _525 * _521;
    float _555 = -_507;
    float _557 = _555 + 1.0;
    float _559 = _551 * _543;
    float _561 = fma(_547, _485, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _563 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _565 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _563;
    float _567 = as_type<float>(int(gl_VertexIndex));
    float _569 = fma(_557, (*spvDescriptorSet0.vp_c9)._m0[143].y, _559);
    float _571 = _481 * _537;
    float _573 = _493 * _537;
    float _575 = fma(_549, _527, _569);
    float _577 = _463 * _537;
    float _579 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _581 = _571 * _579;
    float _583 = fma(_565, _455, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _585 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _587 = _573 * _585;
    float _589 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _591 = -_581;
    float _593 = fma(_573, _589, _591);
    float _595 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _597 = _577 * _595;
    float _599 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _601 = -_587;
    float _603 = fma(_577, _599, _601);
    float _605 = _583 * _543;
    float _607 = _593 * _593;
    float _609 = in.m_51.x;
    float _611 = in.m_51.y;
    float _613 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _615 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _613;
    float _617 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _619 = -_597;
    float _621 = fma(_571, _617, _619);
    float _623 = fma(_603, _603, _607);
    float _625 = fma(_615, _553, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _627 = fma(_557, (*spvDescriptorSet0.vp_c9)._m0[143].x, _605);
    float _629 = fma(_621, _621, _623);
    int _631 = as_type<int>(_567) & 1;
    bool _633 = _631 != 0;
    int _635 = as_type<int>(_567) & 2;
    bool _637 = _635 != 0;
    float _639 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _641 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _639;
    float _643 = fma(_625, _513, _575);
    float _645 = fma(_561, _527, _627);
    float _647 = rsqrt(_629);
    float _649 = fma(_641, _553, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _651 = fma(_435, (*spvDescriptorSet0.vp_c9)._m0[146].y, _643);
    float _653 = fma(_649, _513, _645);
    bool _655 = !_637;
    float _657 = _655 ? (-0.5) : 0.5;
    bool _659 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _661 = isnan(0.5);
    bool _663 = _659 || _661;
    bool _665 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _667 = _663 || _665;
    float _669 = fma(_435, (*spvDescriptorSet0.vp_c9)._m0[146].x, _653);
    float _671 = _651 * _611;
    float _673 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _657);
    float _675 = _669 * _609;
    bool _677 = !_633;
    float _679 = _677 ? (-0.5) : 0.5;
    float _681 = _363 * _671;
    float _683 = _603 * _647;
    float _685 = _593 * _647;
    float _687 = _363 * _675;
    float _689 = _681 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _691 = _577 * _683;
    float _693 = _621 * _647;
    float _695 = _573 * _685;
    float _697 = _689 * _673;
    float _699 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _679);
    float _701 = _687 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _703 = -_691;
    float _705 = fma(_571, _685, _703);
    float _707 = -_695;
    float _709 = fma(_577, _693, _707);
    float _711 = _701 * _699;
    float _713 = _697 * _705;
    float _715 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _717 = _697 * _709;
    float _719 = fma(_711, _693, _713);
    float _721 = fma(_711, _683, _717);
    float _723 = fma(_715, _573, _719);
    float _725 = fma(_715, _571, _721);
    float _727 = _571 * _693;
    float _729 = _477 + _723;
    float _731 = _459 + _725;
    float _733 = -_727;
    float _735 = fma(_573, _683, _733);
    float _737 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _739 = _729 + _737;
    float _741 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _743 = _731 + _741;
    float _745 = _697 * _735;
    float _747 = _739 * _739;
    float _749 = fma(_711, _685, _745);
    float _751 = fma(_743, _743, _747);
    float _753 = fma(_715, _577, _749);
    float _755 = sqrt(_751);
    float _757 = _453 + _753;
    bool _759 = _755 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _761 = _753;
    float _763 = _715;
    float _765 = _745;
    float _767 = _577;
    float _769 = _757;
    float _771 = _743;
    if (!_759)
    {
        _761 = _731;
    }
    float _773 = _761;
    float _775 = _773;
    if (!_759)
    {
        _763 = _729;
    }
    float _777 = _763;
    float _779 = _777;
    if (!_759)
    {
        _765 = _757;
    }
    float _781 = _765;
    bool _783 = !_759;
    float _785 = _781;
    if (!_783)
    {
        float _787 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _789 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _791 = _755 + _789;
        float _793 = _757 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _795 = rsqrt(_751);
        float _797 = _791 * _787;
        float _799 = _797 * 0.15915493667125701904296875;
        float _801 = _799 * 6.283185482025146484375;
        float _803 = cos(_801);
        float _805 = _799 * 6.283185482025146484375;
        float _807 = sin(_805);
        float _809 = _803 + (-1.0);
        float _811 = _809 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _813 = fma(_807, _793, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _815 = fma(_757, _803, _811);
        float _817 = _795 * _813;
        float _819 = fma(_743, _817, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _821 = fma(_739, _817, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _779 = _821;
        _775 = _819;
        _785 = _815;
        _767 = _799;
    }
    float _823 = _779;
    float _825 = _775;
    float _827 = _785;
    float _829 = _767;
    float _831 = _827;
    float _833 = _825;
    float _835 = _823;
    float _837 = _829;
    if (!_667)
    {
        float _839 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _841 = _453 + _839;
        float _843 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _845 = _459 + _843;
        float _847 = -_477;
        float _849 = _847 + _823;
        float _851 = _841 * _841;
        float _853 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _855 = _477 + _853;
        float _857 = fma(_845, _845, _851);
        float _859 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _861 = fma(_855, _855, _857);
        float _863 = -_459;
        float _865 = _863 + _825;
        float _867 = sqrt(_861);
        float _869 = precise::min(_867, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _871 = _869 * _859;
        float _873 = -_453;
        float _875 = _873 + _827;
        float _877 = fma(_865, _871, _459);
        float _879 = fma(_875, _871, _453);
        float _881 = fma(_849, _871, _477);
        _831 = _879;
        _833 = _877;
        _835 = _881;
        _837 = _875;
        _769 = _859;
    }
    float _883 = _831;
    float _885 = _833;
    float _887 = _835;
    float _889 = _837;
    float _891 = _769;
    float _893 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _895 = _883 + _893;
    float _897 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _899 = _885 + _897;
    float _901 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _903 = _887 + _901;
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
    float _933 = _911;
    float _935 = _923;
    float _937 = _931;
    float _939 = _889;
    float _941 = _895;
    float _943 = _891;
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
        _939 = _959;
    }
    float _961 = _939;
    float _963 = _903;
    if (_927)
    {
        float _965 = _961 * 6.283185482025146484375;
        float _967 = sin(_965);
        _963 = _967;
    }
    float _969 = _963;
    float _971 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _973 = precise::max(0.0, _971);
    float _975 = _947;
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
    if (_927)
    {
        float _991 = _989 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _941 = _991;
    }
    float _993 = _941;
    float _995 = sqrt(_909);
    float _997 = _993;
    float _999 = _969;
    if (_927)
    {
        float _1001 = fma(_969, _993, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _997 = _1001;
    }
    float _1003 = _997;
    float _1005 = _1003;
    if (!_927)
    {
        _999 = _915;
    }
    float _1007 = _999;
    float _1009 = _1007;
    float _1011 = _983;
    if (_927)
    {
        float _1013 = _983 + (-1.0);
        _977 = _1013;
    }
    float _1015 = _977;
    float _1017 = _1015;
    if (_927)
    {
        float _1019 = _951 * _1003;
        _771 = _1019;
    }
    float _1021 = _771;
    if (!_927)
    {
        _1005 = _989;
    }
    float _1023 = _1005;
    float _1025 = _1023;
    if (_927)
    {
        float _1027 = _1015 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _943 = _1027;
    }
    float _1029 = _943;
    if (_927)
    {
        float _1031 = _915 * _1021;
        _1009 = _1031;
    }
    float _1033 = _1009;
    if (!_927)
    {
        _1017 = _917;
    }
    float _1035 = _1017;
    float _1037 = _1035;
    if (_927)
    {
        float _1039 = _917 * _1021;
        _1037 = _1039;
    }
    float _1041 = _1037;
    if (!_927)
    {
        _953 = _919;
    }
    float _1043 = _953;
    float _1045 = _1043;
    if (_927)
    {
        float _1047 = fma(_989, _983, _1029);
        _1025 = _1047;
    }
    float _1049 = _1025;
    if (_927)
    {
        float _1051 = _1033 * _1033;
        _1045 = _1051;
    }
    float _1053 = _1045;
    if (!_927)
    {
        _1011 = _921;
    }
    float _1055 = _1011;
    float _1057 = _1055;
    if (_927)
    {
        float _1059 = _1041 * _1041;
        _1057 = _1059;
    }
    float _1061 = _1057;
    float _1063 = fma(_1049, _1049, _1053);
    float _1065 = _1063 + _1061;
    float _1067 = _883 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1069 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1071 = fma(_995, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1069);
    float _1073 = precise::clamp(_1071, 0.0, 1.0);
    float _1075 = _883 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1077 = rsqrt(_1065);
    float _1079 = fma(_885, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1067);
    float _1081 = -_1073;
    float _1083 = _1081 + 1.0;
    float _1085 = _883 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1087 = fma(_885, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1075);
    float _1089 = fma(_887, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1079);
    float _1091 = _883 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1093 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1095 = fma(_887, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1087);
    float _1097 = _1089 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1099 = fma(_885, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1085);
    float _1101 = abs(_1083);
    float _1103 = log2(_1101);
    float _1105 = _1095 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1107 = fma(_885, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1091);
    float _1109 = fma(_887, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1099);
    float _1111 = _1097 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1113 = _1077 * _1033;
    float _1115 = _1077 * _1049;
    float _1117 = _1109 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1119 = _1105 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1121 = _1113 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1123 = fma(_887, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1107);
    float _1125 = _1077 * _1041;
    float _1127 = fma(_1117, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1119);
    float _1129 = -_1121;
    float _1131 = fma(_1115, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1129);
    float _1133 = _1123 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1135 = -_1111;
    float _1137 = fma(_1135, _1093, 1.0);
    float _1139 = fma(_1097, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1127);
    float _1141 = _1103 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1143 = -_1125;
    float _1145 = fma(_1143, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1131);
    float _1147 = _1105 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1149 = fma(_1133, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1139);
    float _1151 = log2(_1137);
    float _1153 = fma(_1145, -0.5, 0.5);
    float _1155 = _1105 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1157 = fma(_1117, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1147);
    float _1159 = fma(_1145, 0.5, 0.5);
    float _1161 = _1115 + 1.0;
    float _1163 = fma(_1117, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1155);
    float _1165 = fma(_1097, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1157);
    float _1167 = exp2(_1141);
    float _1169 = fma(_1159, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1171 = fma(_1097, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1163);
    float _1173 = fma(_1133, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1165);
    float _1175 = fma(_1159, _1169, -0.212114393711090087890625);
    float _1177 = fma(_1133, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1171);
    float _1179 = 1.0 / _1149;
    float _1181 = _1151 * 0.693147182464599609375;
    float _1183 = fma(_1159, _1175, 1.570728778839111328125);
    float _1185 = _1181 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1187 = sqrt(_1153);
    float _1189 = -_1115;
    float _1191 = fma(_1167, _1161, _1189);
    float _1193 = fma(_1191, 0.5, 0.5);
    float _1195 = _1173 * _1179;
    float _1197 = _1177 * _1179;
    float _1199 = fma(_1195, 0.5, 0.5);
    float _1201 = fma(_1197, -0.5, 0.5);
    float _1203 = _1187 * 0.636619746685028076171875;
    float3 _3243 = float3(_1199, _1201, _1185);
    float _1205 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3243, float3(0.0), isnan(_3243)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3243, float3(0.0), isnan(_3243)), level(0.0)).x;
    float3 _3254 = float3(_1199, _1201, _1185);
    float4 _1208 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3254, float3(0.0), isnan(_3254)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3254, float3(0.0), isnan(_3254)), level(0.0)).xyzw;
    float _1210 = _1208.x;
    float _1212 = _1208.y;
    float _1214 = _1208.z;
    float _1216 = _1208.w;
    float _1218 = -_1183;
    float _1220 = fma(_1203, _1218, 1.0);
    float2 _3276 = float2(_1220, _1193);
    float3 _1224 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3276, float2(0.0), isnan(_3276)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3276, float2(0.0), isnan(_3276)), level(0.0)).xyz;
    float _1226 = _1224.x;
    float _1228 = _1224.y;
    float _1230 = _1224.z;
    float _1232 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _1234 = in.m_49.y;
    float _1236 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _1238 = _1103 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1240 = _1232 * _137;
    bool _1242 = _137 > 0.5;
    float _1244 = _1236 * _137;
    int _1246 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1248 = _1246 != 0;
    float _1250 = _1105 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1252 = -_679;
    int _1254 = _1242 ? as_type<int>(_1252) : as_type<int>(_679);
    float _1256 = trunc(_1240);
    int _1258 = int(_1256);
    int _1260 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1262 = _1260 != 0;
    float _1264 = fma(_1117, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1250);
    bool _1266 = !_1248;
    float _1268 = _1266 ? _679 : as_type<float>(_1254);
    float _1270 = trunc(_1244);
    int _1272 = int(_1270);
    float _1274 = _1268 + 0.5;
    float _1276 = _1274 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _1278 = _1234 > 0.5;
    int _1280 = _1258 << 4;
    int _1282 = _1280 + 1712;
    float _1284 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1286 = -_657;
    int _1288 = _1278 ? as_type<int>(_1286) : as_type<int>(_657);
    uint _1291 = uint(int(uint(_1282) >> uint(2)));
    uint _1293 = uint(int(uint(int(_1291)) >> uint(2)));
    int _1295 = int(_1291) & 3;
    float _1297 = (*spvDescriptorSet0.vp_c9)._m0[int(_1293)][_1295];
    int _1299 = int(_1291) + 1;
    uint _1301 = uint(int(uint(_1299) >> uint(2)));
    int _1303 = _1299 & 3;
    float _1305 = (*spvDescriptorSet0.vp_c9)._m0[int(_1301)][_1303];
    bool _1307 = !_1262;
    float _1309 = _1307 ? _657 : as_type<float>(_1288);
    int _1311 = _1272 << 4;
    int _1313 = _1311 + 1968;
    float _1315 = fma(_1097, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1264);
    float _1317 = -_1309;
    float _1319 = _1317 + 0.5;
    int _1321 = _1282 + 8;
    uint _1323 = uint(int(uint(_1321) >> uint(2)));
    uint _1325 = uint(int(uint(int(_1323)) >> uint(2)));
    int _1327 = int(_1323) & 3;
    float _1329 = (*spvDescriptorSet0.vp_c9)._m0[int(_1325)][_1327];
    float _1331 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1333 = _1319 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1335 = fma(_1133, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1315);
    uint _1337 = uint(int(uint(_1313) >> uint(2)));
    uint _1339 = uint(int(uint(int(_1337)) >> uint(2)));
    int _1341 = int(_1337) & 3;
    float _1343 = (*spvDescriptorSet0.vp_c9)._m0[int(_1339)][_1341];
    int _1345 = int(_1337) + 1;
    uint _1347 = uint(int(uint(_1345) >> uint(2)));
    int _1349 = _1345 & 3;
    float _1351 = (*spvDescriptorSet0.vp_c9)._m0[int(_1347)][_1349];
    float _1353 = exp2(_1238);
    float _1355 = _1335 + _1149;
    int _1357 = _1313 + 8;
    uint _1359 = uint(int(uint(_1357) >> uint(2)));
    uint _1361 = uint(int(uint(int(_1359)) >> uint(2)));
    int _1363 = int(_1359) & 3;
    float _1365 = (*spvDescriptorSet0.vp_c9)._m0[int(_1361)][_1363];
    float _1367 = _1276 * _1284;
    float _1369 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1371 = -_1353;
    float _1373 = _1371 + 1.0;
    float _1375 = _1355 * 0.5;
    out.gl_Position.x = _1173;
    out.gl_Position.y = _1177;
    out.gl_Position.z = _1335;
    out.gl_Position.w = _1149;
    float _1377 = _1373 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_56.z = _1375;
    out.m_56.w = _1149;
    float _1379 = _1297 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1381 = _1305 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1383 = _1333 * _1369;
    float _1385 = _1379 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1387 = _1381 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_58.x = _1367;
    out.m_58.y = _1383;
    float _1389 = _1329 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1391 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1393 = _1389 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1395 = _1343 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    out.m_60.x = _1385;
    out.m_60.y = _1387;
    out.m_60.z = _1393;
    out.m_60.w = _1331;
    float _1397 = _1351 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1399 = _1395 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1401 = _1397 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1403 = _1365 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1405 = _1403 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1407 = -_1377;
    float _1409 = _1407 + 1.0;
    out.m_62.x = _1399;
    out.m_62.y = _1401;
    out.m_62.z = _1405;
    out.m_62.w = _1391;
    float _1411 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_45.x = _1411;
    float _1413 = _1377 * _1205;
    float _1415 = _1216 * _1409;
    float _1417 = _1216 * _1413;
    float _1419 = _1230 * _1413;
    float _1421 = fma(_1226, _1417, _1210);
    float _1423 = fma(_1228, _1417, _1212);
    float _1425 = fma(_1216, _1419, _1214);
    out.m_64.x = _1421;
    out.m_64.y = _1423;
    out.m_64.z = _1425;
    out.m_64.w = _1415;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    bool _383 = false;
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
        float _1482 = as_type<float>(_99);
        out.gl_Position.z = _1482;
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
    if (_113)
    {
        float _119 = float(_83);
        _93 = _119;
    }
    float _121 = _93;
    bool _123 = _117 >= _121;
    bool _125 = !_113;
    bool _127 = _123 || _125;
    float _129 = _121;
    if (_127)
    {
        _129 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _131 = _129;
    if (_127)
    {
        out.m_45.x = 0.0;
    }
    if (_127)
    {
        float _133 = _131 * 5.0;
        _101 = as_type<int>(_133);
    }
    int _135 = _101;
    if (_127)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1551 = as_type<float>(_135);
        out.gl_Position.z = _1551;
    }
    if (_127)
    {
        return out;
    }
    float _137 = in.m_49.x;
    float _139 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _141 = _117 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    bool _143 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _145 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _147 = _143 || _145;
    bool _149 = isnan(1.0);
    bool _151 = _147 || _149;
    float _153 = _141 * _139;
    int _155 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _157 = _155 != 0;
    float _159 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[20].x, _153);
    float _161 = _159 * 6.283185482025146484375;
    float _163 = floor(_159);
    float _165 = _161 * 0.15915493667125701904296875;
    float _167 = _117 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _169 = 0.0;
    float _171 = _167;
    if (!_151)
    {
        float _173 = _167 * _167;
        float _175 = _173 * 0.5;
        _169 = _175;
    }
    float _177 = _169;
    float _179 = _165 * 6.283185482025146484375;
    float _181 = cos(_179);
    float _183 = _177;
    if (!_151)
    {
        float _185 = _177 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _183 = _185;
    }
    float _187 = _183;
    float _189 = -_163;
    float _191 = _159 + _189;
    bool _193 = _191 < 0.5;
    float _195 = float(_193);
    bool _197 = !_151;
    float _199 = _187;
    if (!_197)
    {
        float _201 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _203 = log2(_201);
        float _205 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _207 = _205 + 1.0;
        float _209 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _211 = _167 * _203;
        float _213 = 1.0 / _207;
        float _215 = _209 * 0.693147182464599609375;
        float _217 = exp2(_211);
        float _219 = 1.0 / _215;
        float _221 = _217 + (-1.0);
        float _223 = -_221;
        float _225 = fma(_223, _219, _167);
        float _227 = _225 * _213;
        float _229 = _227 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _199 = _229;
    }
    float _231 = _199;
    bool _233 = !_151;
    if (!_233)
    {
        float _235 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _237 = log2(_235);
        float _239 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _241 = _239 + 1.0;
        float _243 = 1.0 / _241;
        float _245 = _167 * _237;
        float _247 = exp2(_245);
        float _249 = -_247;
        float _251 = _249 + 1.0;
        float _253 = _251 * _243;
        _171 = _253;
    }
    float _255 = _171;
    float _257 = fma(_181, 0.5, 0.5);
    float _259 = -_191;
    float _261 = fma(_259, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _263 = _231 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _265 = -_257;
    float _267 = fma(_265, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _269 = -_195;
    float _271 = fma(_269, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _273 = in.m_47.x;
    float _275 = in.m_47.y;
    float _277 = in.m_47.z;
    int _279 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _281 = _279 != 0;
    int _283 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _285 = _283 != 0;
    float _287 = _231 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _289 = _263 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _291 = in.m_51.w;
    float _293 = _263 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _295 = _263 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _297 = fma(_287, (*spvDescriptorSet0.vp_c10)._m0[8].x, _289);
    float _299 = in.m_42.x;
    float _301 = in.m_42.y;
    float _303 = in.m_42.z;
    bool _305 = !_157;
    int _307 = _305 ? 0 : 1;
    float _309 = _231 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    bool _311 = !_281;
    int _313 = _311 ? 0 : 1;
    float _315 = fma(_287, (*spvDescriptorSet0.vp_c10)._m0[8].y, _293);
    float _317 = fma(_287, (*spvDescriptorSet0.vp_c10)._m0[8].z, _295);
    int _319 = abs(_307);
    float _321 = fma(_309, (*spvDescriptorSet0.vp_c10)._m0[10].x, _297);
    int _323 = abs(_313);
    float _325 = fma(_309, (*spvDescriptorSet0.vp_c10)._m0[10].y, _315);
    bool _327 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _329 = fma(_309, (*spvDescriptorSet0.vp_c10)._m0[10].z, _317);
    bool _331 = !_285;
    int _333 = _331 ? 0 : 1;
    float _335 = float(_323);
    float _337 = fma(_255, _273, _321);
    float _339 = fma(_255, _275, _325);
    int _341 = abs(_333);
    float _343 = fma(_255, _277, _329);
    float _345 = float(_319);
    float _347 = abs(_261);
    float _349 = _335 * _347;
    float _351 = float(_341);
    float _353 = fma(_343, _291, _303);
    float _355 = fma(_337, _291, _299);
    float _357 = fma(_345, _267, _349);
    float _359 = fma(_339, _291, _301);
    float _361 = abs(_271);
    float _363 = fma(_351, _361, _357);
    bool _365 = !_327;
    float _381;
    if (!_365)
    {
        float _367 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _369 = _137 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _371 = fma(_369, (*spvDescriptorSet0.vp_c9)._m0[12].x, _117);
        float _373 = _371 * _367;
        float _375 = floor(_373);
        float _377 = -_375;
        float _379 = _373 + _377;
        _381 = _379;
        _383 = true;
    }
    else
    {
        float _385 = float(_83);
        float _387 = 1.0 / _385;
        float _389 = _117 * _387;
        _381 = _389;
    }
    _383 = false;
    float _391 = _381;
    float _393 = _359 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _395 = _359 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _397 = _359 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _399 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _401 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _399;
    float _403 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _405 = _403 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _407 = fma(_355, (*spvDescriptorSet0.vp_c10)._m0[5].x, _393);
    float _409 = fma(_355, (*spvDescriptorSet0.vp_c10)._m0[4].x, _395);
    float _411 = 1.0 / _401;
    float _413 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _415 = _391 + _413;
    float _417 = fma(_355, (*spvDescriptorSet0.vp_c10)._m0[6].x, _397);
    float _419 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _421 = _391 + _419;
    float _423 = fma(_353, (*spvDescriptorSet0.vp_c10)._m0[4].z, _409);
    bool _425 = _391 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _427 = isnan(_391);
    bool _429 = _425 || _427;
    bool _431 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _433 = _429 || _431;
    float _435 = float(_433);
    float _437 = 1.0 / _405;
    float _439 = fma(_353, (*spvDescriptorSet0.vp_c10)._m0[5].z, _407);
    bool _441 = _391 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _443 = isnan(_391);
    bool _445 = _441 || _443;
    bool _447 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _449 = _445 || _447;
    float _451 = float(_449);
    float _453 = _439 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _455 = _421 * _411;
    float _457 = fma(_353, (*spvDescriptorSet0.vp_c10)._m0[6].z, _417);
    float _459 = _423 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _461 = -_453;
    float _463 = _461 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    bool _465 = _391 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _467 = isnan(_391);
    bool _469 = _465 || _467;
    bool _471 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _473 = _469 || _471;
    float _475 = float(_473);
    float _477 = _457 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _479 = -_459;
    float _481 = _479 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _483 = _463 * _463;
    float _485 = _415 * _437;
    float _487 = -_435;
    float _489 = _487 + 1.0;
    float _491 = -_477;
    float _493 = _491 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _495 = fma(_481, _481, _483);
    bool _497 = _391 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _499 = isnan(_391);
    bool _501 = _497 || _499;
    bool _503 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _505 = _501 || _503;
    float _507 = float(_505);
    float _509 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _511 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _509;
    float _513 = _475 * _489;
    float _515 = fma(_493, _493, _495);
    float _517 = -_475;
    float _519 = _517 + 1.0;
    float _521 = 1.0 / _511;
    float _523 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _525 = _391 + _523;
    float _527 = _451 * _519;
    float _529 = -_451;
    float _531 = _529 + 1.0;
    float _533 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _535 = _533 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _537 = rsqrt(_515);
    float _539 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _541 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _539;
    float _543 = _507 * _531;
    float _545 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _547 = _545 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _549 = fma(_535, _485, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _551 = fma(_541, _455, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _553 = _525 * _521;
    float _555 = -_507;
    float _557 = _555 + 1.0;
    float _559 = _551 * _543;
    float _561 = fma(_547, _485, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _563 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _565 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _563;
    float _567 = as_type<float>(int(gl_VertexIndex));
    float _569 = fma(_557, (*spvDescriptorSet0.vp_c9)._m0[143].y, _559);
    float _571 = _481 * _537;
    float _573 = _493 * _537;
    float _575 = fma(_549, _527, _569);
    float _577 = _463 * _537;
    float _579 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _581 = _571 * _579;
    float _583 = fma(_565, _455, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _585 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _587 = _573 * _585;
    float _589 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _591 = -_581;
    float _593 = fma(_573, _589, _591);
    float _595 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _597 = _577 * _595;
    float _599 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _601 = -_587;
    float _603 = fma(_577, _599, _601);
    float _605 = _583 * _543;
    float _607 = _593 * _593;
    float _609 = in.m_51.x;
    float _611 = in.m_51.y;
    float _613 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _615 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _613;
    float _617 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _619 = -_597;
    float _621 = fma(_571, _617, _619);
    float _623 = fma(_603, _603, _607);
    float _625 = fma(_615, _553, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _627 = fma(_557, (*spvDescriptorSet0.vp_c9)._m0[143].x, _605);
    float _629 = fma(_621, _621, _623);
    int _631 = as_type<int>(_567) & 1;
    bool _633 = _631 != 0;
    int _635 = as_type<int>(_567) & 2;
    bool _637 = _635 != 0;
    float _639 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _641 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _639;
    float _643 = fma(_625, _513, _575);
    float _645 = fma(_561, _527, _627);
    float _647 = rsqrt(_629);
    float _649 = fma(_641, _553, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _651 = fma(_435, (*spvDescriptorSet0.vp_c9)._m0[146].y, _643);
    float _653 = fma(_649, _513, _645);
    bool _655 = !_637;
    float _657 = _655 ? (-0.5) : 0.5;
    bool _659 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _661 = isnan(0.5);
    bool _663 = _659 || _661;
    bool _665 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _667 = _663 || _665;
    float _669 = fma(_435, (*spvDescriptorSet0.vp_c9)._m0[146].x, _653);
    float _671 = _651 * _611;
    float _673 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _657);
    float _675 = _669 * _609;
    bool _677 = !_633;
    float _679 = _677 ? (-0.5) : 0.5;
    float _681 = _363 * _671;
    float _683 = _603 * _647;
    float _685 = _593 * _647;
    float _687 = _363 * _675;
    float _689 = _681 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _691 = _577 * _683;
    float _693 = _621 * _647;
    float _695 = _573 * _685;
    float _697 = _689 * _673;
    float _699 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _679);
    float _701 = _687 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _703 = -_691;
    float _705 = fma(_571, _685, _703);
    float _707 = -_695;
    float _709 = fma(_577, _693, _707);
    float _711 = _701 * _699;
    float _713 = _697 * _705;
    float _715 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _717 = _697 * _709;
    float _719 = fma(_711, _693, _713);
    float _721 = fma(_711, _683, _717);
    float _723 = fma(_715, _573, _719);
    float _725 = fma(_715, _571, _721);
    float _727 = _571 * _693;
    float _729 = _477 + _723;
    float _731 = _459 + _725;
    float _733 = -_727;
    float _735 = fma(_573, _683, _733);
    float _737 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _739 = _729 + _737;
    float _741 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _743 = _731 + _741;
    float _745 = _697 * _735;
    float _747 = _739 * _739;
    float _749 = fma(_711, _685, _745);
    float _751 = fma(_743, _743, _747);
    float _753 = fma(_715, _577, _749);
    float _755 = sqrt(_751);
    float _757 = _453 + _753;
    bool _759 = _755 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _761 = _753;
    float _763 = _715;
    float _765 = _745;
    float _767 = _577;
    float _769 = _757;
    float _771 = _743;
    if (!_759)
    {
        _761 = _731;
    }
    float _773 = _761;
    float _775 = _773;
    if (!_759)
    {
        _763 = _729;
    }
    float _777 = _763;
    float _779 = _777;
    if (!_759)
    {
        _765 = _757;
    }
    float _781 = _765;
    bool _783 = !_759;
    float _785 = _781;
    if (!_783)
    {
        float _787 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _789 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _791 = _755 + _789;
        float _793 = _757 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _795 = rsqrt(_751);
        float _797 = _791 * _787;
        float _799 = _797 * 0.15915493667125701904296875;
        float _801 = _799 * 6.283185482025146484375;
        float _803 = cos(_801);
        float _805 = _799 * 6.283185482025146484375;
        float _807 = sin(_805);
        float _809 = _803 + (-1.0);
        float _811 = _809 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _813 = fma(_807, _793, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _815 = fma(_757, _803, _811);
        float _817 = _795 * _813;
        float _819 = fma(_743, _817, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _821 = fma(_739, _817, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _779 = _821;
        _775 = _819;
        _785 = _815;
        _767 = _799;
    }
    float _823 = _779;
    float _825 = _775;
    float _827 = _785;
    float _829 = _767;
    float _831 = _827;
    float _833 = _825;
    float _835 = _823;
    float _837 = _829;
    if (!_667)
    {
        float _839 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _841 = _453 + _839;
        float _843 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _845 = _459 + _843;
        float _847 = -_477;
        float _849 = _847 + _823;
        float _851 = _841 * _841;
        float _853 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _855 = _477 + _853;
        float _857 = fma(_845, _845, _851);
        float _859 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _861 = fma(_855, _855, _857);
        float _863 = -_459;
        float _865 = _863 + _825;
        float _867 = sqrt(_861);
        float _869 = precise::min(_867, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _871 = _869 * _859;
        float _873 = -_453;
        float _875 = _873 + _827;
        float _877 = fma(_865, _871, _459);
        float _879 = fma(_875, _871, _453);
        float _881 = fma(_849, _871, _477);
        _831 = _879;
        _833 = _877;
        _835 = _881;
        _837 = _875;
        _769 = _859;
    }
    float _883 = _831;
    float _885 = _833;
    float _887 = _835;
    float _889 = _837;
    float _891 = _769;
    float _893 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _895 = _883 + _893;
    float _897 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _899 = _885 + _897;
    float _901 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _903 = _887 + _901;
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
    float _933 = _911;
    float _935 = _923;
    float _937 = _931;
    float _939 = _889;
    float _941 = _895;
    float _943 = _891;
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
        _939 = _959;
    }
    float _961 = _939;
    float _963 = _903;
    if (_927)
    {
        float _965 = _961 * 6.283185482025146484375;
        float _967 = sin(_965);
        _963 = _967;
    }
    float _969 = _963;
    float _971 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _973 = precise::max(0.0, _971);
    float _975 = _947;
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
    if (_927)
    {
        float _991 = _989 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _941 = _991;
    }
    float _993 = _941;
    float _995 = sqrt(_909);
    float _997 = _993;
    float _999 = _969;
    if (_927)
    {
        float _1001 = fma(_969, _993, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _997 = _1001;
    }
    float _1003 = _997;
    float _1005 = _1003;
    if (!_927)
    {
        _999 = _915;
    }
    float _1007 = _999;
    float _1009 = _1007;
    float _1011 = _983;
    if (_927)
    {
        float _1013 = _983 + (-1.0);
        _977 = _1013;
    }
    float _1015 = _977;
    float _1017 = _1015;
    if (_927)
    {
        float _1019 = _951 * _1003;
        _771 = _1019;
    }
    float _1021 = _771;
    if (!_927)
    {
        _1005 = _989;
    }
    float _1023 = _1005;
    float _1025 = _1023;
    if (_927)
    {
        float _1027 = _1015 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _943 = _1027;
    }
    float _1029 = _943;
    if (_927)
    {
        float _1031 = _915 * _1021;
        _1009 = _1031;
    }
    float _1033 = _1009;
    if (!_927)
    {
        _1017 = _917;
    }
    float _1035 = _1017;
    float _1037 = _1035;
    if (_927)
    {
        float _1039 = _917 * _1021;
        _1037 = _1039;
    }
    float _1041 = _1037;
    if (!_927)
    {
        _953 = _919;
    }
    float _1043 = _953;
    float _1045 = _1043;
    if (_927)
    {
        float _1047 = fma(_989, _983, _1029);
        _1025 = _1047;
    }
    float _1049 = _1025;
    if (_927)
    {
        float _1051 = _1033 * _1033;
        _1045 = _1051;
    }
    float _1053 = _1045;
    if (!_927)
    {
        _1011 = _921;
    }
    float _1055 = _1011;
    float _1057 = _1055;
    if (_927)
    {
        float _1059 = _1041 * _1041;
        _1057 = _1059;
    }
    float _1061 = _1057;
    float _1063 = fma(_1049, _1049, _1053);
    float _1065 = _1063 + _1061;
    float _1067 = _883 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1069 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1071 = fma(_995, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1069);
    float _1073 = precise::clamp(_1071, 0.0, 1.0);
    float _1075 = _883 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1077 = rsqrt(_1065);
    float _1079 = fma(_885, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1067);
    float _1081 = -_1073;
    float _1083 = _1081 + 1.0;
    float _1085 = _883 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1087 = fma(_885, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1075);
    float _1089 = fma(_887, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1079);
    float _1091 = _883 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1093 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1095 = fma(_887, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1087);
    float _1097 = _1089 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1099 = fma(_885, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1085);
    float _1101 = abs(_1083);
    float _1103 = log2(_1101);
    float _1105 = _1095 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1107 = fma(_885, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1091);
    float _1109 = fma(_887, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1099);
    float _1111 = _1097 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1113 = _1077 * _1033;
    float _1115 = _1077 * _1049;
    float _1117 = _1109 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1119 = _1105 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1121 = _1113 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1123 = fma(_887, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1107);
    float _1125 = _1077 * _1041;
    float _1127 = fma(_1117, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1119);
    float _1129 = -_1121;
    float _1131 = fma(_1115, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1129);
    float _1133 = _1123 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1135 = -_1111;
    float _1137 = fma(_1135, _1093, 1.0);
    float _1139 = fma(_1097, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1127);
    float _1141 = _1103 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1143 = -_1125;
    float _1145 = fma(_1143, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1131);
    float _1147 = _1105 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1149 = fma(_1133, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1139);
    float _1151 = log2(_1137);
    float _1153 = fma(_1145, -0.5, 0.5);
    float _1155 = _1105 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1157 = fma(_1117, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1147);
    float _1159 = fma(_1145, 0.5, 0.5);
    float _1161 = _1115 + 1.0;
    float _1163 = fma(_1117, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1155);
    float _1165 = fma(_1097, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1157);
    float _1167 = exp2(_1141);
    float _1169 = fma(_1159, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1171 = fma(_1097, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1163);
    float _1173 = fma(_1133, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1165);
    float _1175 = fma(_1159, _1169, -0.212114393711090087890625);
    float _1177 = fma(_1133, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1171);
    float _1179 = 1.0 / _1149;
    float _1181 = _1151 * 0.693147182464599609375;
    float _1183 = fma(_1159, _1175, 1.570728778839111328125);
    float _1185 = _1181 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1187 = sqrt(_1153);
    float _1189 = -_1115;
    float _1191 = fma(_1167, _1161, _1189);
    float _1193 = fma(_1191, 0.5, 0.5);
    float _1195 = _1173 * _1179;
    float _1197 = _1177 * _1179;
    float _1199 = fma(_1195, 0.5, 0.5);
    float _1201 = fma(_1197, -0.5, 0.5);
    float _1203 = _1187 * 0.636619746685028076171875;
    float3 _3243 = float3(_1199, _1201, _1185);
    float _1205 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3243, float3(0.0), isnan(_3243)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3243, float3(0.0), isnan(_3243)), level(0.0)).x;
    float3 _3254 = float3(_1199, _1201, _1185);
    float4 _1208 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3254, float3(0.0), isnan(_3254)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3254, float3(0.0), isnan(_3254)), level(0.0)).xyzw;
    float _1210 = _1208.x;
    float _1212 = _1208.y;
    float _1214 = _1208.z;
    float _1216 = _1208.w;
    float _1218 = -_1183;
    float _1220 = fma(_1203, _1218, 1.0);
    float2 _3276 = float2(_1220, _1193);
    float3 _1224 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3276, float2(0.0), isnan(_3276)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3276, float2(0.0), isnan(_3276)), level(0.0)).xyz;
    float _1226 = _1224.x;
    float _1228 = _1224.y;
    float _1230 = _1224.z;
    float _1232 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _1234 = in.m_49.y;
    float _1236 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _1238 = _1103 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1240 = _1232 * _137;
    bool _1242 = _137 > 0.5;
    float _1244 = _1236 * _137;
    int _1246 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1248 = _1246 != 0;
    float _1250 = _1105 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1252 = -_679;
    int _1254 = _1242 ? as_type<int>(_1252) : as_type<int>(_679);
    float _1256 = trunc(_1240);
    int _1258 = int(_1256);
    int _1260 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1262 = _1260 != 0;
    float _1264 = fma(_1117, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1250);
    bool _1266 = !_1248;
    float _1268 = _1266 ? _679 : as_type<float>(_1254);
    float _1270 = trunc(_1244);
    int _1272 = int(_1270);
    float _1274 = _1268 + 0.5;
    float _1276 = _1274 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _1278 = _1234 > 0.5;
    int _1280 = _1258 << 4;
    int _1282 = _1280 + 1712;
    float _1284 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1286 = -_657;
    int _1288 = _1278 ? as_type<int>(_1286) : as_type<int>(_657);
    uint _1291 = uint(int(uint(_1282) >> uint(2)));
    uint _1293 = uint(int(uint(int(_1291)) >> uint(2)));
    int _1295 = int(_1291) & 3;
    float _1297 = (*spvDescriptorSet0.vp_c9)._m0[int(_1293)][_1295];
    int _1299 = int(_1291) + 1;
    uint _1301 = uint(int(uint(_1299) >> uint(2)));
    int _1303 = _1299 & 3;
    float _1305 = (*spvDescriptorSet0.vp_c9)._m0[int(_1301)][_1303];
    bool _1307 = !_1262;
    float _1309 = _1307 ? _657 : as_type<float>(_1288);
    int _1311 = _1272 << 4;
    int _1313 = _1311 + 1968;
    float _1315 = fma(_1097, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1264);
    float _1317 = -_1309;
    float _1319 = _1317 + 0.5;
    int _1321 = _1282 + 8;
    uint _1323 = uint(int(uint(_1321) >> uint(2)));
    uint _1325 = uint(int(uint(int(_1323)) >> uint(2)));
    int _1327 = int(_1323) & 3;
    float _1329 = (*spvDescriptorSet0.vp_c9)._m0[int(_1325)][_1327];
    float _1331 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1333 = _1319 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1335 = fma(_1133, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1315);
    uint _1337 = uint(int(uint(_1313) >> uint(2)));
    uint _1339 = uint(int(uint(int(_1337)) >> uint(2)));
    int _1341 = int(_1337) & 3;
    float _1343 = (*spvDescriptorSet0.vp_c9)._m0[int(_1339)][_1341];
    int _1345 = int(_1337) + 1;
    uint _1347 = uint(int(uint(_1345) >> uint(2)));
    int _1349 = _1345 & 3;
    float _1351 = (*spvDescriptorSet0.vp_c9)._m0[int(_1347)][_1349];
    float _1353 = exp2(_1238);
    float _1355 = _1335 + _1149;
    int _1357 = _1313 + 8;
    uint _1359 = uint(int(uint(_1357) >> uint(2)));
    uint _1361 = uint(int(uint(int(_1359)) >> uint(2)));
    int _1363 = int(_1359) & 3;
    float _1365 = (*spvDescriptorSet0.vp_c9)._m0[int(_1361)][_1363];
    float _1367 = _1276 * _1284;
    float _1369 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1371 = -_1353;
    float _1373 = _1371 + 1.0;
    float _1375 = _1355 * 0.5;
    out.gl_Position.x = _1173;
    out.gl_Position.y = _1177;
    out.gl_Position.z = _1335;
    out.gl_Position.w = _1149;
    float _1377 = _1373 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_56.z = _1375;
    out.m_56.w = _1149;
    float _1379 = _1297 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1381 = _1305 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1383 = _1333 * _1369;
    float _1385 = _1379 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1387 = _1381 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_58.x = _1367;
    out.m_58.y = _1383;
    float _1389 = _1329 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1391 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1393 = _1389 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1395 = _1343 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    out.m_60.x = _1385;
    out.m_60.y = _1387;
    out.m_60.z = _1393;
    out.m_60.w = _1331;
    float _1397 = _1351 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1399 = _1395 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1401 = _1397 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1403 = _1365 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1405 = _1403 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1407 = -_1377;
    float _1409 = _1407 + 1.0;
    out.m_62.x = _1399;
    out.m_62.y = _1401;
    out.m_62.z = _1405;
    out.m_62.w = _1391;
    float _1411 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_45.x = _1411;
    float _1413 = _1377 * _1205;
    float _1415 = _1216 * _1409;
    float _1417 = _1216 * _1413;
    float _1419 = _1230 * _1413;
    float _1421 = fma(_1226, _1417, _1210);
    float _1423 = fma(_1228, _1417, _1212);
    float _1425 = fma(_1216, _1419, _1214);
    out.m_64.x = _1421;
    out.m_64.y = _1423;
    out.m_64.z = _1425;
    out.m_64.w = _1415;
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
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    bool _383 = false;
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
        float _1482 = as_type<float>(_99);
        out.gl_Position.z = _1482;
    }
    if (!_87)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _103 = in.m_47.w;
    bool _105 = _103 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _107 = isnan(_103);
    bool _109 = _105 || _107;
    bool _111 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _113 = _109 || _111;
    float _115 = -_103;
    float _117 = _115 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_113)
    {
        float _119 = float(_83);
        _93 = _119;
    }
    float _121 = _93;
    bool _123 = _117 >= _121;
    bool _125 = !_113;
    bool _127 = _123 || _125;
    float _129 = _121;
    if (_127)
    {
        _129 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _131 = _129;
    if (_127)
    {
        out.m_45.x = 0.0;
    }
    if (_127)
    {
        float _133 = _131 * 5.0;
        _101 = as_type<int>(_133);
    }
    int _135 = _101;
    if (_127)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1551 = as_type<float>(_135);
        out.gl_Position.z = _1551;
    }
    if (_127)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _137 = in.m_49.x;
    float _139 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _141 = _117 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    bool _143 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _145 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _147 = _143 || _145;
    bool _149 = isnan(1.0);
    bool _151 = _147 || _149;
    float _153 = _141 * _139;
    int _155 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _157 = _155 != 0;
    float _159 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[20].x, _153);
    float _161 = _159 * 6.283185482025146484375;
    float _163 = floor(_159);
    float _165 = _161 * 0.15915493667125701904296875;
    float _167 = _117 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _169 = 0.0;
    float _171 = _167;
    if (!_151)
    {
        float _173 = _167 * _167;
        float _175 = _173 * 0.5;
        _169 = _175;
    }
    float _177 = _169;
    float _179 = _165 * 6.283185482025146484375;
    float _181 = cos(_179);
    float _183 = _177;
    if (!_151)
    {
        float _185 = _177 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _183 = _185;
    }
    float _187 = _183;
    float _189 = -_163;
    float _191 = _159 + _189;
    bool _193 = _191 < 0.5;
    float _195 = float(_193);
    bool _197 = !_151;
    float _199 = _187;
    if (!_197)
    {
        float _201 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _203 = log2(_201);
        float _205 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _207 = _205 + 1.0;
        float _209 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _211 = _167 * _203;
        float _213 = 1.0 / _207;
        float _215 = _209 * 0.693147182464599609375;
        float _217 = exp2(_211);
        float _219 = 1.0 / _215;
        float _221 = _217 + (-1.0);
        float _223 = -_221;
        float _225 = fma(_223, _219, _167);
        float _227 = _225 * _213;
        float _229 = _227 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _199 = _229;
    }
    float _231 = _199;
    bool _233 = !_151;
    if (!_233)
    {
        float _235 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _237 = log2(_235);
        float _239 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _241 = _239 + 1.0;
        float _243 = 1.0 / _241;
        float _245 = _167 * _237;
        float _247 = exp2(_245);
        float _249 = -_247;
        float _251 = _249 + 1.0;
        float _253 = _251 * _243;
        _171 = _253;
    }
    float _255 = _171;
    float _257 = fma(_181, 0.5, 0.5);
    float _259 = -_191;
    float _261 = fma(_259, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _263 = _231 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _265 = -_257;
    float _267 = fma(_265, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _269 = -_195;
    float _271 = fma(_269, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _273 = in.m_47.x;
    float _275 = in.m_47.y;
    float _277 = in.m_47.z;
    int _279 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _281 = _279 != 0;
    int _283 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _285 = _283 != 0;
    float _287 = _231 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _289 = _263 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _291 = in.m_51.w;
    float _293 = _263 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _295 = _263 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _297 = fma(_287, (*spvDescriptorSet0.vp_c10)._m0[8].x, _289);
    float _299 = in.m_42.x;
    float _301 = in.m_42.y;
    float _303 = in.m_42.z;
    bool _305 = !_157;
    int _307 = _305 ? 0 : 1;
    float _309 = _231 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    bool _311 = !_281;
    int _313 = _311 ? 0 : 1;
    float _315 = fma(_287, (*spvDescriptorSet0.vp_c10)._m0[8].y, _293);
    float _317 = fma(_287, (*spvDescriptorSet0.vp_c10)._m0[8].z, _295);
    int _319 = abs(_307);
    float _321 = fma(_309, (*spvDescriptorSet0.vp_c10)._m0[10].x, _297);
    int _323 = abs(_313);
    float _325 = fma(_309, (*spvDescriptorSet0.vp_c10)._m0[10].y, _315);
    bool _327 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _329 = fma(_309, (*spvDescriptorSet0.vp_c10)._m0[10].z, _317);
    bool _331 = !_285;
    int _333 = _331 ? 0 : 1;
    float _335 = float(_323);
    float _337 = fma(_255, _273, _321);
    float _339 = fma(_255, _275, _325);
    int _341 = abs(_333);
    float _343 = fma(_255, _277, _329);
    float _345 = float(_319);
    float _347 = abs(_261);
    float _349 = _335 * _347;
    float _351 = float(_341);
    float _353 = fma(_343, _291, _303);
    float _355 = fma(_337, _291, _299);
    float _357 = fma(_345, _267, _349);
    float _359 = fma(_339, _291, _301);
    float _361 = abs(_271);
    float _363 = fma(_351, _361, _357);
    bool _365 = !_327;
    float _381;
    if (!_365)
    {
        float _367 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _369 = _137 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _371 = fma(_369, (*spvDescriptorSet0.vp_c9)._m0[12].x, _117);
        float _373 = _371 * _367;
        float _375 = floor(_373);
        float _377 = -_375;
        float _379 = _373 + _377;
        _381 = _379;
        _383 = true;
    }
    else
    {
        float _385 = float(_83);
        float _387 = 1.0 / _385;
        float _389 = _117 * _387;
        _381 = _389;
    }
    _383 = false;
    float _391 = _381;
    float _393 = _359 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _395 = _359 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _397 = _359 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _399 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _401 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _399;
    float _403 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _405 = _403 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _407 = fma(_355, (*spvDescriptorSet0.vp_c10)._m0[5].x, _393);
    float _409 = fma(_355, (*spvDescriptorSet0.vp_c10)._m0[4].x, _395);
    float _411 = 1.0 / _401;
    float _413 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _415 = _391 + _413;
    float _417 = fma(_355, (*spvDescriptorSet0.vp_c10)._m0[6].x, _397);
    float _419 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _421 = _391 + _419;
    float _423 = fma(_353, (*spvDescriptorSet0.vp_c10)._m0[4].z, _409);
    bool _425 = _391 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _427 = isnan(_391);
    bool _429 = _425 || _427;
    bool _431 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _433 = _429 || _431;
    float _435 = float(_433);
    float _437 = 1.0 / _405;
    float _439 = fma(_353, (*spvDescriptorSet0.vp_c10)._m0[5].z, _407);
    bool _441 = _391 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _443 = isnan(_391);
    bool _445 = _441 || _443;
    bool _447 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _449 = _445 || _447;
    float _451 = float(_449);
    float _453 = _439 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _455 = _421 * _411;
    float _457 = fma(_353, (*spvDescriptorSet0.vp_c10)._m0[6].z, _417);
    float _459 = _423 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _461 = -_453;
    float _463 = _461 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    bool _465 = _391 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _467 = isnan(_391);
    bool _469 = _465 || _467;
    bool _471 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _473 = _469 || _471;
    float _475 = float(_473);
    float _477 = _457 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _479 = -_459;
    float _481 = _479 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _483 = _463 * _463;
    float _485 = _415 * _437;
    float _487 = -_435;
    float _489 = _487 + 1.0;
    float _491 = -_477;
    float _493 = _491 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _495 = fma(_481, _481, _483);
    bool _497 = _391 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _499 = isnan(_391);
    bool _501 = _497 || _499;
    bool _503 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _505 = _501 || _503;
    float _507 = float(_505);
    float _509 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _511 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _509;
    float _513 = _475 * _489;
    float _515 = fma(_493, _493, _495);
    float _517 = -_475;
    float _519 = _517 + 1.0;
    float _521 = 1.0 / _511;
    float _523 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _525 = _391 + _523;
    float _527 = _451 * _519;
    float _529 = -_451;
    float _531 = _529 + 1.0;
    float _533 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _535 = _533 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _537 = rsqrt(_515);
    float _539 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _541 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _539;
    float _543 = _507 * _531;
    float _545 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _547 = _545 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _549 = fma(_535, _485, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _551 = fma(_541, _455, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _553 = _525 * _521;
    float _555 = -_507;
    float _557 = _555 + 1.0;
    float _559 = _551 * _543;
    float _561 = fma(_547, _485, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _563 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _565 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _563;
    float _567 = as_type<float>(int(gl_VertexIndex));
    float _569 = fma(_557, (*spvDescriptorSet0.vp_c9)._m0[143].y, _559);
    float _571 = _481 * _537;
    float _573 = _493 * _537;
    float _575 = fma(_549, _527, _569);
    float _577 = _463 * _537;
    float _579 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _581 = _571 * _579;
    float _583 = fma(_565, _455, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _585 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _587 = _573 * _585;
    float _589 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _591 = -_581;
    float _593 = fma(_573, _589, _591);
    float _595 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _597 = _577 * _595;
    float _599 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _601 = -_587;
    float _603 = fma(_577, _599, _601);
    float _605 = _583 * _543;
    float _607 = _593 * _593;
    float _609 = in.m_51.x;
    float _611 = in.m_51.y;
    float _613 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _615 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _613;
    float _617 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _619 = -_597;
    float _621 = fma(_571, _617, _619);
    float _623 = fma(_603, _603, _607);
    float _625 = fma(_615, _553, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _627 = fma(_557, (*spvDescriptorSet0.vp_c9)._m0[143].x, _605);
    float _629 = fma(_621, _621, _623);
    int _631 = as_type<int>(_567) & 1;
    bool _633 = _631 != 0;
    int _635 = as_type<int>(_567) & 2;
    bool _637 = _635 != 0;
    float _639 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _641 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _639;
    float _643 = fma(_625, _513, _575);
    float _645 = fma(_561, _527, _627);
    float _647 = rsqrt(_629);
    float _649 = fma(_641, _553, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _651 = fma(_435, (*spvDescriptorSet0.vp_c9)._m0[146].y, _643);
    float _653 = fma(_649, _513, _645);
    bool _655 = !_637;
    float _657 = _655 ? (-0.5) : 0.5;
    bool _659 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _661 = isnan(0.5);
    bool _663 = _659 || _661;
    bool _665 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _667 = _663 || _665;
    float _669 = fma(_435, (*spvDescriptorSet0.vp_c9)._m0[146].x, _653);
    float _671 = _651 * _611;
    float _673 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _657);
    float _675 = _669 * _609;
    bool _677 = !_633;
    float _679 = _677 ? (-0.5) : 0.5;
    float _681 = _363 * _671;
    float _683 = _603 * _647;
    float _685 = _593 * _647;
    float _687 = _363 * _675;
    float _689 = _681 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _691 = _577 * _683;
    float _693 = _621 * _647;
    float _695 = _573 * _685;
    float _697 = _689 * _673;
    float _699 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _679);
    float _701 = _687 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _703 = -_691;
    float _705 = fma(_571, _685, _703);
    float _707 = -_695;
    float _709 = fma(_577, _693, _707);
    float _711 = _701 * _699;
    float _713 = _697 * _705;
    float _715 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _717 = _697 * _709;
    float _719 = fma(_711, _693, _713);
    float _721 = fma(_711, _683, _717);
    float _723 = fma(_715, _573, _719);
    float _725 = fma(_715, _571, _721);
    float _727 = _571 * _693;
    float _729 = _477 + _723;
    float _731 = _459 + _725;
    float _733 = -_727;
    float _735 = fma(_573, _683, _733);
    float _737 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _739 = _729 + _737;
    float _741 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _743 = _731 + _741;
    float _745 = _697 * _735;
    float _747 = _739 * _739;
    float _749 = fma(_711, _685, _745);
    float _751 = fma(_743, _743, _747);
    float _753 = fma(_715, _577, _749);
    float _755 = sqrt(_751);
    float _757 = _453 + _753;
    bool _759 = _755 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _761 = _753;
    float _763 = _715;
    float _765 = _745;
    float _767 = _577;
    float _769 = _757;
    float _771 = _743;
    if (!_759)
    {
        _761 = _731;
    }
    float _773 = _761;
    float _775 = _773;
    if (!_759)
    {
        _763 = _729;
    }
    float _777 = _763;
    float _779 = _777;
    if (!_759)
    {
        _765 = _757;
    }
    float _781 = _765;
    bool _783 = !_759;
    float _785 = _781;
    if (!_783)
    {
        float _787 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _789 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _791 = _755 + _789;
        float _793 = _757 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _795 = rsqrt(_751);
        float _797 = _791 * _787;
        float _799 = _797 * 0.15915493667125701904296875;
        float _801 = _799 * 6.283185482025146484375;
        float _803 = cos(_801);
        float _805 = _799 * 6.283185482025146484375;
        float _807 = sin(_805);
        float _809 = _803 + (-1.0);
        float _811 = _809 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _813 = fma(_807, _793, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _815 = fma(_757, _803, _811);
        float _817 = _795 * _813;
        float _819 = fma(_743, _817, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _821 = fma(_739, _817, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _779 = _821;
        _775 = _819;
        _785 = _815;
        _767 = _799;
    }
    float _823 = _779;
    float _825 = _775;
    float _827 = _785;
    float _829 = _767;
    float _831 = _827;
    float _833 = _825;
    float _835 = _823;
    float _837 = _829;
    if (!_667)
    {
        float _839 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _841 = _453 + _839;
        float _843 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _845 = _459 + _843;
        float _847 = -_477;
        float _849 = _847 + _823;
        float _851 = _841 * _841;
        float _853 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _855 = _477 + _853;
        float _857 = fma(_845, _845, _851);
        float _859 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _861 = fma(_855, _855, _857);
        float _863 = -_459;
        float _865 = _863 + _825;
        float _867 = sqrt(_861);
        float _869 = precise::min(_867, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _871 = _869 * _859;
        float _873 = -_453;
        float _875 = _873 + _827;
        float _877 = fma(_865, _871, _459);
        float _879 = fma(_875, _871, _453);
        float _881 = fma(_849, _871, _477);
        _831 = _879;
        _833 = _877;
        _835 = _881;
        _837 = _875;
        _769 = _859;
    }
    float _883 = _831;
    float _885 = _833;
    float _887 = _835;
    float _889 = _837;
    float _891 = _769;
    float _893 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _895 = _883 + _893;
    float _897 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _899 = _885 + _897;
    float _901 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _903 = _887 + _901;
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
    float _933 = _911;
    float _935 = _923;
    float _937 = _931;
    float _939 = _889;
    float _941 = _895;
    float _943 = _891;
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
        _939 = _959;
    }
    float _961 = _939;
    float _963 = _903;
    if (_927)
    {
        float _965 = _961 * 6.283185482025146484375;
        float _967 = sin(_965);
        _963 = _967;
    }
    float _969 = _963;
    float _971 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _973 = precise::max(0.0, _971);
    float _975 = _947;
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
    if (_927)
    {
        float _991 = _989 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _941 = _991;
    }
    float _993 = _941;
    float _995 = sqrt(_909);
    float _997 = _993;
    float _999 = _969;
    if (_927)
    {
        float _1001 = fma(_969, _993, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _997 = _1001;
    }
    float _1003 = _997;
    float _1005 = _1003;
    if (!_927)
    {
        _999 = _915;
    }
    float _1007 = _999;
    float _1009 = _1007;
    float _1011 = _983;
    if (_927)
    {
        float _1013 = _983 + (-1.0);
        _977 = _1013;
    }
    float _1015 = _977;
    float _1017 = _1015;
    if (_927)
    {
        float _1019 = _951 * _1003;
        _771 = _1019;
    }
    float _1021 = _771;
    if (!_927)
    {
        _1005 = _989;
    }
    float _1023 = _1005;
    float _1025 = _1023;
    if (_927)
    {
        float _1027 = _1015 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _943 = _1027;
    }
    float _1029 = _943;
    if (_927)
    {
        float _1031 = _915 * _1021;
        _1009 = _1031;
    }
    float _1033 = _1009;
    if (!_927)
    {
        _1017 = _917;
    }
    float _1035 = _1017;
    float _1037 = _1035;
    if (_927)
    {
        float _1039 = _917 * _1021;
        _1037 = _1039;
    }
    float _1041 = _1037;
    if (!_927)
    {
        _953 = _919;
    }
    float _1043 = _953;
    float _1045 = _1043;
    if (_927)
    {
        float _1047 = fma(_989, _983, _1029);
        _1025 = _1047;
    }
    float _1049 = _1025;
    if (_927)
    {
        float _1051 = _1033 * _1033;
        _1045 = _1051;
    }
    float _1053 = _1045;
    if (!_927)
    {
        _1011 = _921;
    }
    float _1055 = _1011;
    float _1057 = _1055;
    if (_927)
    {
        float _1059 = _1041 * _1041;
        _1057 = _1059;
    }
    float _1061 = _1057;
    float _1063 = fma(_1049, _1049, _1053);
    float _1065 = _1063 + _1061;
    float _1067 = _883 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1069 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1071 = fma(_995, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1069);
    float _1073 = precise::clamp(_1071, 0.0, 1.0);
    float _1075 = _883 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1077 = rsqrt(_1065);
    float _1079 = fma(_885, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1067);
    float _1081 = -_1073;
    float _1083 = _1081 + 1.0;
    float _1085 = _883 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1087 = fma(_885, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1075);
    float _1089 = fma(_887, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1079);
    float _1091 = _883 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1093 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1095 = fma(_887, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1087);
    float _1097 = _1089 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1099 = fma(_885, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1085);
    float _1101 = abs(_1083);
    float _1103 = log2(_1101);
    float _1105 = _1095 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1107 = fma(_885, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1091);
    float _1109 = fma(_887, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1099);
    float _1111 = _1097 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1113 = _1077 * _1033;
    float _1115 = _1077 * _1049;
    float _1117 = _1109 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1119 = _1105 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1121 = _1113 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1123 = fma(_887, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1107);
    float _1125 = _1077 * _1041;
    float _1127 = fma(_1117, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1119);
    float _1129 = -_1121;
    float _1131 = fma(_1115, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1129);
    float _1133 = _1123 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1135 = -_1111;
    float _1137 = fma(_1135, _1093, 1.0);
    float _1139 = fma(_1097, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1127);
    float _1141 = _1103 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1143 = -_1125;
    float _1145 = fma(_1143, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1131);
    float _1147 = _1105 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1149 = fma(_1133, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1139);
    float _1151 = log2(_1137);
    float _1153 = fma(_1145, -0.5, 0.5);
    float _1155 = _1105 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1157 = fma(_1117, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1147);
    float _1159 = fma(_1145, 0.5, 0.5);
    float _1161 = _1115 + 1.0;
    float _1163 = fma(_1117, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1155);
    float _1165 = fma(_1097, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1157);
    float _1167 = exp2(_1141);
    float _1169 = fma(_1159, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1171 = fma(_1097, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1163);
    float _1173 = fma(_1133, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1165);
    float _1175 = fma(_1159, _1169, -0.212114393711090087890625);
    float _1177 = fma(_1133, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1171);
    float _1179 = 1.0 / _1149;
    float _1181 = _1151 * 0.693147182464599609375;
    float _1183 = fma(_1159, _1175, 1.570728778839111328125);
    float _1185 = _1181 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1187 = sqrt(_1153);
    float _1189 = -_1115;
    float _1191 = fma(_1167, _1161, _1189);
    float _1193 = fma(_1191, 0.5, 0.5);
    float _1195 = _1173 * _1179;
    float _1197 = _1177 * _1179;
    float _1199 = fma(_1195, 0.5, 0.5);
    float _1201 = fma(_1197, -0.5, 0.5);
    float _1203 = _1187 * 0.636619746685028076171875;
    float3 _3243 = float3(_1199, _1201, _1185);
    float _1205 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3243, float3(0.0), isnan(_3243)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3243, float3(0.0), isnan(_3243)), level(0.0)).x;
    float3 _3254 = float3(_1199, _1201, _1185);
    float4 _1208 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3254, float3(0.0), isnan(_3254)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3254, float3(0.0), isnan(_3254)), level(0.0)).xyzw;
    float _1210 = _1208.x;
    float _1212 = _1208.y;
    float _1214 = _1208.z;
    float _1216 = _1208.w;
    float _1218 = -_1183;
    float _1220 = fma(_1203, _1218, 1.0);
    float2 _3276 = float2(_1220, _1193);
    float3 _1224 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3276, float2(0.0), isnan(_3276)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3276, float2(0.0), isnan(_3276)), level(0.0)).xyz;
    float _1226 = _1224.x;
    float _1228 = _1224.y;
    float _1230 = _1224.z;
    float _1232 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _1234 = in.m_49.y;
    float _1236 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _1238 = _1103 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1240 = _1232 * _137;
    bool _1242 = _137 > 0.5;
    float _1244 = _1236 * _137;
    int _1246 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1248 = _1246 != 0;
    float _1250 = _1105 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1252 = -_679;
    int _1254 = _1242 ? as_type<int>(_1252) : as_type<int>(_679);
    float _1256 = trunc(_1240);
    int _1258 = int(_1256);
    int _1260 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1262 = _1260 != 0;
    float _1264 = fma(_1117, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1250);
    bool _1266 = !_1248;
    float _1268 = _1266 ? _679 : as_type<float>(_1254);
    float _1270 = trunc(_1244);
    int _1272 = int(_1270);
    float _1274 = _1268 + 0.5;
    float _1276 = _1274 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _1278 = _1234 > 0.5;
    int _1280 = _1258 << 4;
    int _1282 = _1280 + 1712;
    float _1284 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1286 = -_657;
    int _1288 = _1278 ? as_type<int>(_1286) : as_type<int>(_657);
    uint _1291 = uint(int(uint(_1282) >> uint(2)));
    uint _1293 = uint(int(uint(int(_1291)) >> uint(2)));
    int _1295 = int(_1291) & 3;
    float _1297 = (*spvDescriptorSet0.vp_c9)._m0[int(_1293)][_1295];
    int _1299 = int(_1291) + 1;
    uint _1301 = uint(int(uint(_1299) >> uint(2)));
    int _1303 = _1299 & 3;
    float _1305 = (*spvDescriptorSet0.vp_c9)._m0[int(_1301)][_1303];
    bool _1307 = !_1262;
    float _1309 = _1307 ? _657 : as_type<float>(_1288);
    int _1311 = _1272 << 4;
    int _1313 = _1311 + 1968;
    float _1315 = fma(_1097, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1264);
    float _1317 = -_1309;
    float _1319 = _1317 + 0.5;
    int _1321 = _1282 + 8;
    uint _1323 = uint(int(uint(_1321) >> uint(2)));
    uint _1325 = uint(int(uint(int(_1323)) >> uint(2)));
    int _1327 = int(_1323) & 3;
    float _1329 = (*spvDescriptorSet0.vp_c9)._m0[int(_1325)][_1327];
    float _1331 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1333 = _1319 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1335 = fma(_1133, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1315);
    uint _1337 = uint(int(uint(_1313) >> uint(2)));
    uint _1339 = uint(int(uint(int(_1337)) >> uint(2)));
    int _1341 = int(_1337) & 3;
    float _1343 = (*spvDescriptorSet0.vp_c9)._m0[int(_1339)][_1341];
    int _1345 = int(_1337) + 1;
    uint _1347 = uint(int(uint(_1345) >> uint(2)));
    int _1349 = _1345 & 3;
    float _1351 = (*spvDescriptorSet0.vp_c9)._m0[int(_1347)][_1349];
    float _1353 = exp2(_1238);
    float _1355 = _1335 + _1149;
    int _1357 = _1313 + 8;
    uint _1359 = uint(int(uint(_1357) >> uint(2)));
    uint _1361 = uint(int(uint(int(_1359)) >> uint(2)));
    int _1363 = int(_1359) & 3;
    float _1365 = (*spvDescriptorSet0.vp_c9)._m0[int(_1361)][_1363];
    float _1367 = _1276 * _1284;
    float _1369 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1371 = -_1353;
    float _1373 = _1371 + 1.0;
    float _1375 = _1355 * 0.5;
    out.gl_Position.x = _1173;
    out.gl_Position.y = _1177;
    out.gl_Position.z = _1335;
    out.gl_Position.w = _1149;
    float _1377 = _1373 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_56.z = _1375;
    out.m_56.w = _1149;
    float _1379 = _1297 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1381 = _1305 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1383 = _1333 * _1369;
    float _1385 = _1379 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1387 = _1381 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_58.x = _1367;
    out.m_58.y = _1383;
    float _1389 = _1329 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1391 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1393 = _1389 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1395 = _1343 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    out.m_60.x = _1385;
    out.m_60.y = _1387;
    out.m_60.z = _1393;
    out.m_60.w = _1331;
    float _1397 = _1351 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1399 = _1395 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1401 = _1397 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1403 = _1365 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1405 = _1403 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1407 = -_1377;
    float _1409 = _1407 + 1.0;
    out.m_62.x = _1399;
    out.m_62.y = _1401;
    out.m_62.z = _1405;
    out.m_62.w = _1391;
    float _1411 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_45.x = _1411;
    float _1413 = _1377 * _1205;
    float _1415 = _1216 * _1409;
    float _1417 = _1216 * _1413;
    float _1419 = _1230 * _1413;
    float _1421 = fma(_1226, _1417, _1210);
    float _1423 = fma(_1228, _1417, _1212);
    float _1425 = fma(_1216, _1419, _1214);
    out.m_64.x = _1421;
    out.m_64.y = _1423;
    out.m_64.z = _1425;
    out.m_64.w = _1415;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

