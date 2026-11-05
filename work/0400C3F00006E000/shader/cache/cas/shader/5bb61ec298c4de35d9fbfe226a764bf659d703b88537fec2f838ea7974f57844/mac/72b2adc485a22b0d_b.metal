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
    float4 m_56 [[user(locn1)]];
    float4 m_62 [[user(locn2)]];
    float4 m_68 [[user(locn3)]];
    float4 m_45 [[user(locn4)]];
    float4 m_66 [[user(locn5)]];
    float4 m_64 [[user(locn6)]];
    float4 m_60 [[user(locn7)]];
    float4 m_70 [[user(locn9)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_42 [[attribute(2)]];
    float4 m_47 [[attribute(3)]];
    float4 m_54 [[attribute(4)]];
    float4 m_52 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    bool _611 = false;
    bool _447 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _84 = in.m_42.w;
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
        out.m_45.x = 0.0;
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
        float _2531 = as_type<float>(_105);
        out.gl_Position.z = _2531;
    }
    if (!_93)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _109 = in.m_47.w;
    bool _111 = _109 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _113 = isnan(_109);
    bool _115 = _111 || _113;
    bool _117 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _119 = _115 || _117;
    float _121 = -_109;
    float _123 = _121 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _125 = 0.0;
    if (_119)
    {
        float _127 = float(_89);
        _125 = _127;
    }
    float _129 = _125;
    bool _131 = _123 >= _129;
    bool _133 = !_119;
    bool _135 = _131 || _133;
    if (_135)
    {
        _99 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _137 = _99;
    if (_135)
    {
        out.m_45.x = 0.0;
    }
    if (_135)
    {
        float _139 = _137 * 5.0;
        _107 = as_type<int>(_139);
    }
    int _141 = _107;
    if (_135)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2599 = as_type<float>(_141);
        out.gl_Position.z = _2599;
    }
    if (_135)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _143 = as_type<float>(int(gl_VertexIndex));
    float _145 = _123 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _147 = in.m_52.w;
    bool _149 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _151 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _153 = _149 || _151;
    bool _155 = isnan(1.0);
    bool _157 = _153 || _155;
    float _159 = in.m_47.x;
    float _161 = in.m_47.y;
    float _163 = in.m_47.z;
    float _165 = in.m_42.x;
    float _167 = in.m_42.y;
    float _169 = in.m_42.z;
    float _171 = 0.0;
    float _173 = _145;
    if (!_157)
    {
        float _175 = _145 * _145;
        float _177 = _175 * 0.5;
        _171 = _177;
    }
    float _179 = _171;
    float _181 = _179;
    if (!_157)
    {
        float _183 = _179 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _181 = _183;
    }
    float _185 = _181;
    int _187 = as_type<int>(_143) & 1;
    bool _189 = _187 != 0;
    int _191 = as_type<int>(_143) & 2;
    bool _193 = _191 != 0;
    bool _195 = !_189;
    float _197 = _195 ? (-0.5) : 0.5;
    bool _199 = !_193;
    float _201 = _199 ? (-0.5) : 0.5;
    bool _203 = !_157;
    float _205 = _185;
    float _207 = 0.0;
    float _209 = 0.0;
    bool _211 = false;
    bool _213 = _193;
    if (!_203)
    {
        float _215 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _217 = log2(_215);
        float _219 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _221 = _219 + 1.0;
        float _223 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _225 = _145 * _217;
        float _227 = 1.0 / _221;
        float _229 = _223 * 0.693147182464599609375;
        float _231 = exp2(_225);
        float _233 = 1.0 / _229;
        float _235 = _231 + (-1.0);
        float _237 = -_235;
        float _239 = fma(_237, _233, _145);
        float _241 = _239 * _227;
        float _243 = _241 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _205 = _243;
        _207 = _227;
        _209 = _231;
    }
    float _245 = _205;
    float _247 = _207;
    float _249 = _209;
    bool _251 = !_157;
    float _253 = _249;
    float _255 = _247;
    float _257 = _245;
    if (!_251)
    {
        float _259 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _261 = log2(_259);
        float _263 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _265 = _263 + 1.0;
        float _267 = 1.0 / _265;
        float _269 = _145 * _261;
        float _271 = exp2(_269);
        float _273 = -_271;
        float _275 = _273 + 1.0;
        float _277 = _275 * _267;
        _173 = _277;
        _253 = _265;
    }
    float _279 = _173;
    float _281 = _253;
    float _283 = _281;
    if (!_157)
    {
        float _285 = _123 * _123;
        float _287 = _285 * 0.5;
        _255 = _287;
    }
    float _289 = _255;
    float _291 = _245 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _293 = _245 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _295 = _245 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    if (!_157)
    {
        _283 = _123;
    }
    float _297 = _283;
    float _299 = fma(_279, _159, _291);
    float _301 = fma(_279, _161, _293);
    float _303 = _297;
    if (!_157)
    {
        float _305 = _289 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _257 = _305;
    }
    float _307 = _257;
    bool _309 = !_157;
    float _311 = _307;
    if (!_309)
    {
        float _313 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _315 = log2(_313);
        float _317 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _319 = _317 + 1.0;
        float _321 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _323 = _123 * _315;
        float _325 = 1.0 / _319;
        float _327 = _321 * 0.693147182464599609375;
        float _329 = exp2(_323);
        float _331 = 1.0 / _327;
        float _333 = _329 + (-1.0);
        float _335 = -_333;
        float _337 = fma(_335, _331, _123);
        float _339 = _337 * _325;
        float _341 = _339 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _311 = _341;
    }
    float _343 = _311;
    bool _345 = !_157;
    if (!_345)
    {
        float _347 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _349 = log2(_347);
        float _351 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _353 = _351 + 1.0;
        float _355 = 1.0 / _353;
        float _357 = _123 * _349;
        float _359 = exp2(_357);
        float _361 = -_359;
        float _363 = _361 + 1.0;
        float _365 = _363 * _355;
        _303 = _365;
    }
    float _367 = _303;
    float _369 = _343 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _371 = _343 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    bool _373 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _375 = _343 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _377 = fma(_367, _161, _369);
    float _379 = fma(_367, _159, _371);
    float _381 = fma(_279, _163, _295);
    float _383 = fma(_367, _163, _375);
    float _385 = -_377;
    float _387 = _301 + _385;
    float _389 = fma(_299, _147, _165);
    float _391 = -_379;
    float _393 = _299 + _391;
    float _395 = -_383;
    float _397 = _381 + _395;
    float _399 = _387 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _401 = _387 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _403 = _387 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _405 = fma(_301, _147, _167);
    float _407 = fma(_393, (*spvDescriptorSet0.vp_c10)._m0[4].x, _399);
    float _409 = fma(_393, (*spvDescriptorSet0.vp_c10)._m0[5].x, _401);
    float _411 = fma(_393, (*spvDescriptorSet0.vp_c10)._m0[6].x, _403);
    float _413 = fma(_381, _147, _169);
    float _415 = fma(_397, (*spvDescriptorSet0.vp_c10)._m0[4].z, _407);
    float _417 = fma(_397, (*spvDescriptorSet0.vp_c10)._m0[5].z, _409);
    float _419 = fma(_397, (*spvDescriptorSet0.vp_c10)._m0[6].z, _411);
    bool _421 = !_373;
    float _423 = _417;
    float _425 = _415;
    float _427 = _419;
    float _445;
    if (!_421)
    {
        float _429 = in.m_54.x;
        float _431 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _433 = _429 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _435 = fma(_433, (*spvDescriptorSet0.vp_c9)._m0[12].x, _123);
        float _437 = _435 * _431;
        float _439 = floor(_437);
        float _441 = -_439;
        float _443 = _437 + _441;
        _445 = _443;
        _447 = true;
    }
    else
    {
        float _449 = float(_89);
        float _451 = 1.0 / _449;
        float _453 = _123 * _451;
        _445 = _453;
    }
    _447 = false;
    float _455 = _445;
    float _457 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _459 = _455 + _457;
    bool _461 = _455 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _463 = isnan(_455);
    bool _465 = _461 || _463;
    bool _467 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _469 = _465 || _467;
    float _471 = float(_469);
    float _473 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _475 = _455 + _473;
    bool _477 = _455 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _479 = isnan(_455);
    bool _481 = _477 || _479;
    bool _483 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _485 = _481 || _483;
    float _487 = float(_485);
    float _489 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _491 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _489;
    float _493 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _495 = _493 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _497 = -_471;
    float _499 = _497 + 1.0;
    float _501 = 1.0 / _495;
    bool _503 = _455 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _505 = isnan(_455);
    bool _507 = _503 || _505;
    bool _509 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _511 = _507 || _509;
    float _513 = float(_511);
    float _515 = _487 * _499;
    float _517 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _519 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _517;
    float _521 = -_487;
    float _523 = _521 + 1.0;
    bool _525 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _527 = 1.0 / _491;
    float _529 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _531 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _529;
    float _533 = _475 * _501;
    float _535 = _513 * _523;
    float _537 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _539 = _537 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _541 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _543 = _541 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _545 = -_513;
    float _547 = _545 + 1.0;
    float _549 = fma(_539, _533, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _551 = fma(_543, _533, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _553 = _459 * _527;
    float _555 = in.m_52.x;
    float _557 = in.m_52.y;
    float _559 = fma(_519, _553, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _561 = fma(_531, _553, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _563 = _559 * _535;
    float _565 = _561 * _535;
    float _567 = fma(_547, (*spvDescriptorSet0.vp_c9)._m0[143].x, _563);
    float _569 = fma(_547, (*spvDescriptorSet0.vp_c9)._m0[143].y, _565);
    float _571 = fma(_551, _515, _567);
    float _573 = fma(_549, _515, _569);
    float _575 = fma(_471, (*spvDescriptorSet0.vp_c9)._m0[145].x, _571);
    float _577 = fma(_471, (*spvDescriptorSet0.vp_c9)._m0[145].y, _573);
    float _579 = _575 * _555;
    float _581 = _577 * _557;
    bool _583 = !_525;
    float _607;
    float _609;
    if (!_583)
    {
        float _585 = in.m_54.x;
        float _587 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _589 = float(_89);
        float _591 = 1.0 / _589;
        float _593 = _585 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _595 = _123 * _591;
        float _597 = fma(_593, (*spvDescriptorSet0.vp_c9)._m0[11].y, _123);
        float _599 = _597 * _587;
        float _601 = floor(_599);
        float _603 = -_601;
        float _605 = _599 + _603;
        _607 = _595;
        _609 = _605;
        _611 = true;
    }
    else
    {
        float _613 = float(_89);
        float _615 = 1.0 / _613;
        float _617 = _123 * _615;
        _607 = _617;
        _609 = _617;
    }
    _611 = false;
    float _619 = _607;
    float _621 = _609;
    float _623 = _405 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _625 = _579 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _627 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _629 = _627 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    int _631 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _633 = _631 != 0;
    float _635 = _405 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _637 = _405 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _639 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _197);
    float _641 = 1.0 / _629;
    float _643 = fma(_389, (*spvDescriptorSet0.vp_c10)._m0[6].x, _637);
    float _645 = fma(_389, (*spvDescriptorSet0.vp_c10)._m0[4].x, _635);
    float _647 = _581 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _649 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _201);
    float _651 = fma(_389, (*spvDescriptorSet0.vp_c10)._m0[5].x, _623);
    float _653 = _625 * _639;
    float _655 = fma(_413, (*spvDescriptorSet0.vp_c10)._m0[4].z, _645);
    float _657 = _647 * _649;
    float _659 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _661 = _659 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _663 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _665 = _663 + (*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _667 = fma(_413, (*spvDescriptorSet0.vp_c10)._m0[5].z, _651);
    float _669 = fma(_413, (*spvDescriptorSet0.vp_c10)._m0[6].z, _643);
    float _671 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _673 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _675 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _677 = 1.0 / _661;
    float _679 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _681 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _679;
    float _683 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _685 = _683 + (*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _687 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _689 = _687 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _691 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _693 = 1.0 / _665;
    float _695 = _671 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _697 = _673 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _699 = _675 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _701 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _703 = _701 + (*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _705 = _689 * _641;
    float _707 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _709 = _707 + (*spvDescriptorSet0.vp_c9)._m0[158].w;
    float _711 = 1.0 / _685;
    float _713 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _715 = _713 + (*spvDescriptorSet0.vp_c9)._m0[154].w;
    out.m_56.x = _695;
    out.m_56.y = _697;
    out.m_56.z = _699;
    out.m_56.w = _691;
    float _717 = -(*spvDescriptorSet0.vp_c9)._m0[151].x;
    float _719 = (*spvDescriptorSet0.vp_c9)._m0[152].x + _717;
    float _721 = _681 * _677;
    float _723 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _725 = _723 + (*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _727 = 1.0 / _703;
    float _729 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _731 = _729 + (*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _733 = _657 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _735 = _619 >= (*spvDescriptorSet0.vp_c9)._m0[152].w;
    bool _737 = isnan(_619);
    bool _739 = _735 || _737;
    bool _741 = isnan((*spvDescriptorSet0.vp_c9)._m0[152].w);
    bool _743 = _739 || _741;
    float _745 = float(_743);
    float _747 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _749 = _619 + _747;
    int _751 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _753 = _751 != 0;
    float _755 = 1.0 / _715;
    float _757 = -(*spvDescriptorSet0.vp_c9)._m0[152].x;
    float _759 = _757 + (*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _761 = fma(_653, (*spvDescriptorSet0.vp_c8)._m0[24].x, _733);
    float _763 = _759 * _693;
    int _765 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _767 = _765 != 0;
    float _769 = -(*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _771 = (*spvDescriptorSet0.vp_c9)._m0[156].x + _769;
    float _773 = 1.0 / _709;
    float _775 = -(*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _777 = (*spvDescriptorSet0.vp_c9)._m0[154].x + _775;
    float _779 = -(*spvDescriptorSet0.vp_c9)._m0[154].x;
    float _781 = _779 + (*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _783 = _771 * _711;
    float _785 = -(*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _787 = (*spvDescriptorSet0.vp_c9)._m0[158].x + _785;
    float _789 = _657 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _791 = _781 * _727;
    float _793 = _657 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _795 = 1.0 / _725;
    float _797 = -(*spvDescriptorSet0.vp_c9)._m0[156].x;
    float _799 = _797 + (*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _801 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _803 = _621 + _801;
    float _805 = _777 * _755;
    float _807 = fma(_653, (*spvDescriptorSet0.vp_c8)._m0[25].x, _793);
    float _809 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _811 = _621 + _809;
    float _813 = fma(_653, (*spvDescriptorSet0.vp_c8)._m0[26].x, _789);
    float _815 = fma(_721, _803, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _817 = 1.0 / _731;
    float _819 = _787 * _773;
    float _821 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _823 = _619 + _821;
    float _825 = in.m_54.w;
    float _827 = fma(_705, _811, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _829 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _831 = _619 + _829;
    float _833 = fma(_805, _823, (*spvDescriptorSet0.vp_c9)._m0[153].x);
    bool _835 = _619 >= (*spvDescriptorSet0.vp_c9)._m0[158].w;
    bool _837 = isnan(_619);
    bool _839 = _835 || _837;
    bool _841 = isnan((*spvDescriptorSet0.vp_c9)._m0[158].w);
    bool _843 = _839 || _841;
    float _845 = float(_843);
    float _847 = _799 * _795;
    float _849 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _851 = _619 + _849;
    float _853 = _795;
    float _855 = _619;
    if (_753)
    {
        float _857 = in.m_54.x;
        _853 = _857;
    }
    float _859 = _853;
    float _861 = fma(_763, _831, (*spvDescriptorSet0.vp_c9)._m0[152].x);
    bool _863 = _619 >= (*spvDescriptorSet0.vp_c9)._m0[157].w;
    bool _865 = isnan(_619);
    bool _867 = _863 || _865;
    bool _869 = isnan((*spvDescriptorSet0.vp_c9)._m0[157].w);
    bool _871 = _867 || _869;
    float _873 = float(_871);
    float _875 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _877 = _619 + _875;
    float _879 = fma(_847, _851, (*spvDescriptorSet0.vp_c9)._m0[156].x);
    float _881 = -_845;
    float _883 = _881 + 1.0;
    float _885 = _719 * _817;
    bool _887 = _619 >= (*spvDescriptorSet0.vp_c9)._m0[156].w;
    bool _889 = isnan(_619);
    bool _891 = _887 || _889;
    bool _893 = isnan((*spvDescriptorSet0.vp_c9)._m0[156].w);
    bool _895 = _891 || _893;
    float _897 = float(_895);
    float _899 = -_873;
    float _901 = _899 + 1.0;
    float _903 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _905 = _619 + _903;
    float _907 = fma(_885, _877, (*spvDescriptorSet0.vp_c9)._m0[151].x);
    float _909 = _873 * _883;
    bool _911 = _619 >= (*spvDescriptorSet0.vp_c9)._m0[155].w;
    bool _913 = isnan(_619);
    bool _915 = _911 || _913;
    bool _917 = isnan((*spvDescriptorSet0.vp_c9)._m0[155].w);
    bool _919 = _915 || _917;
    float _921 = float(_919);
    float _923 = -_897;
    float _925 = _923 + 1.0;
    float _927 = _897 * _901;
    bool _929 = _619 >= (*spvDescriptorSet0.vp_c9)._m0[154].w;
    bool _931 = isnan(_619);
    bool _933 = _929 || _931;
    bool _935 = isnan((*spvDescriptorSet0.vp_c9)._m0[154].w);
    bool _937 = _933 || _935;
    float _939 = float(_937);
    float _941 = fma(_791, _905, (*spvDescriptorSet0.vp_c9)._m0[154].x);
    float _943 = _883;
    float _945 = _901;
    float _947 = _825;
    if (_767)
    {
        float _949 = _825 * 3.1415927410125732421875;
        _943 = _949;
    }
    float _951 = _943;
    float _953 = _921 * _925;
    float _955 = -_921;
    float _957 = _955 + 1.0;
    bool _959 = _621 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _961 = isnan(_621);
    bool _963 = _959 || _961;
    bool _965 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _967 = _963 || _965;
    float _969 = float(_967);
    float _971 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _973 = _619 + _971;
    bool _975 = _619 >= (*spvDescriptorSet0.vp_c9)._m0[153].w;
    bool _977 = isnan(_619);
    bool _979 = _975 || _977;
    bool _981 = isnan((*spvDescriptorSet0.vp_c9)._m0[153].w);
    bool _983 = _979 || _981;
    float _985 = float(_983);
    if (_767)
    {
        float _987 = _951 * 0.15915493667125701904296875;
        _945 = _987;
    }
    float _989 = _945;
    float _991 = -_939;
    float _993 = _991 + 1.0;
    bool _995 = _825 > 0.5;
    if (_753)
    {
        float _997 = _859 * 3.1415927410125732421875;
        _947 = _997;
    }
    float _999 = _947;
    bool _1001 = _621 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1003 = isnan(_621);
    bool _1005 = _1001 || _1003;
    bool _1007 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1009 = _1005 || _1007;
    float _1011 = float(_1009);
    float _1013 = fma(_783, _973, (*spvDescriptorSet0.vp_c9)._m0[155].x);
    float _1015 = -_969;
    float _1017 = _1015 + 1.0;
    float _1019 = -_985;
    float _1021 = _1019 + 1.0;
    bool _1023 = _621 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1025 = isnan(_621);
    bool _1027 = _1023 || _1025;
    bool _1029 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1031 = _1027 || _1029;
    float _1033 = float(_1031);
    float _1035 = _939 * _957;
    float _1037 = _985 * _993;
    bool _1039 = _619 >= (*spvDescriptorSet0.vp_c9)._m0[151].w;
    bool _1041 = isnan(_619);
    bool _1043 = _1039 || _1041;
    bool _1045 = isnan((*spvDescriptorSet0.vp_c9)._m0[151].w);
    bool _1047 = _1043 || _1045;
    float _1049 = float(_1047);
    float _1051 = _985;
    float _1053 = _939;
    if (_633)
    {
        float _1055 = in.m_54.x;
        float _1057 = in.m_54.y;
        _1051 = _1055;
        _1053 = _1057;
    }
    float _1059 = _1051;
    float _1061 = _1053;
    if (_753)
    {
        float _1063 = _999 * 0.15915493667125701904296875;
        _855 = _1063;
    }
    float _1065 = _855;
    float _1067 = _1011 * _1017;
    float _1069 = -_1011;
    float _1071 = _1069 + 1.0;
    float _1073 = _745 * _1021;
    float _1075 = _989;
    if (_767)
    {
        float _1077 = _989 * 6.283185482025146484375;
        float _1079 = sin(_1077);
        _1075 = _1079;
    }
    float _1081 = _1075;
    float _1083 = in.m_54.z;
    float _1085 = fma(_819, _749, (*spvDescriptorSet0.vp_c9)._m0[157].x);
    float _1087 = -_745;
    float _1089 = _1087 + 1.0;
    float _1091 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1093 = _1033 * _1071;
    int _1095 = int(_767);
    int _1097 = _193 ? 2 : 0;
    int _1099 = _1095 | _1097;
    int _1101 = _995 ? 4 : 0;
    int _1103 = _1099 | _1101;
    int _1105 = _157 ? 8 : 0;
    int _1107 = _1103 | _1105;
    int _1109 = _753 ? 16 : 0;
    int _1111 = _1107 | _1109;
    int _1113 = false ? 32 : 0;
    int _1115 = _1111 | _1113;
    int _1117 = _633 ? 64 : 0;
    int _1119 = _1115 | _1117;
    int _1121 = _1119 & 8;
    float _1123 = _1049 * _1089;
    float _1125 = _1065;
    float _1127 = _1089;
    float _1129 = _1123;
    if (_753)
    {
        float _1131 = _1065 * 6.283185482025146484375;
        float _1133 = sin(_1131);
        _1125 = _1133;
    }
    float _1135 = _1125;
    float _1137 = fma(_1091, (*spvDescriptorSet0.vp_c8)._m0[24].z, _761);
    float _1139 = fma(_1091, (*spvDescriptorSet0.vp_c8)._m0[25].z, _807);
    float _1141 = fma(_1091, (*spvDescriptorSet0.vp_c8)._m0[26].z, _813);
    float _1143 = _815 * _1093;
    float _1145 = _907 * _1123;
    float _1147 = -_201;
    int _1149 = _995 ? as_type<int>(_1147) : as_type<int>(_201);
    float _1151 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1153 = _1081;
    if (_767)
    {
        bool _1155 = _1081 > 0.5;
        _211 = _1155;
    }
    bool _1157 = _211;
    float _1159 = -_1033;
    float _1161 = _1159 + 1.0;
    int _1163 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1165 = _1163 != 0;
    if (!_767)
    {
        _1153 = _197;
    }
    float _1167 = _1153;
    float _1169 = _1135;
    float _1171 = _1167;
    if (_753)
    {
        bool _1173 = _1135 > 0.5;
        _213 = _1173;
    }
    bool _1175 = _213;
    if (!_753)
    {
        _1169 = _201;
    }
    float _1177 = _1169;
    int _1179 = 0;
    float _1181 = _1177;
    if (_633)
    {
        _1179 = 0;
    }
    int _1183 = _1179;
    float _1185 = _1061;
    float _1187 = _1059;
    int _1189 = _1183;
    if (_633)
    {
        _1127 = _1059;
    }
    float _1191 = _1127;
    float _1193 = _1191;
    if (_633)
    {
        _1129 = _1061;
    }
    float _1195 = _1129;
    bool _1197 = _1121 != 0;
    float _1199 = _1195;
    if (!_633)
    {
        float _1201 = in.m_54.x;
        float _1203 = in.m_54.y;
        float _1205 = _1201 * 3.1415927410125732421875;
        float _1207 = _1205 * 0.15915493667125701904296875;
        float _1209 = _1203 * 3.1415927410125732421875;
        float _1211 = _1209 * 0.15915493667125701904296875;
        float _1213 = _1207 * 6.283185482025146484375;
        float _1215 = sin(_1213);
        float _1217 = _1211 * 6.283185482025146484375;
        float _1219 = sin(_1217);
        _1185 = _1203;
        _1187 = _1201;
        _1189 = 2;
        _1193 = _1215;
        _1199 = _1219;
    }
    float _1221 = _1185;
    float _1223 = _1187;
    int _1225 = _1189;
    float _1227 = _1193;
    float _1229 = _1199;
    if (_767)
    {
        float _1231 = -_197;
        float _1233 = _1157 ? _1231 : _197;
        _1171 = _1233;
    }
    float _1235 = _1171;
    float _1237 = -_1049;
    float _1239 = _1237 + 1.0;
    bool _1241 = _1221 > 0.5;
    float _1243 = fma(_1161, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1143);
    if (_753)
    {
        float _1245 = -_201;
        float _1247 = _1175 ? _1245 : _201;
        _1181 = _1247;
    }
    float _1249 = _1181;
    float _1251 = fma(_1239, (*spvDescriptorSet0.vp_c9)._m0[151].x, _1145);
    int _1253 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1255 = _1253 != 0;
    float _1257 = _669 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _1259 = _1223 > 0.5;
    float _1261 = fma(_861, _1073, _1251);
    float _1263 = -_201;
    int _1265 = _1241 ? as_type<int>(_1263) : as_type<int>(_201);
    float _1267 = _655 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _1269 = _1083 > 0.5;
    float _1271 = fma(_833, _1037, _1261);
    bool _1273 = !_1165;
    float _1275 = _1273 ? _201 : as_type<float>(_1149);
    float _1277 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    float _1279 = -_197;
    int _1281 = _1259 ? as_type<int>(_1279) : as_type<int>(_197);
    float _1283 = _1249 + (-0.5);
    bool _1285 = !_1255;
    float _1287 = _1285 ? _201 : as_type<float>(_1265);
    float _1289 = _1151 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _1291 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1293 = _1291 != 0;
    int _1295 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1297 = _1295 != 0;
    int _1299 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1301 = _1299 != 0;
    float _1303 = _1139 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1305 = -_201;
    int _1307 = _1269 ? as_type<int>(_1305) : as_type<int>(_201);
    float _1309 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _1311 = !_1301;
    float _1313 = _1311 ? _201 : as_type<float>(_1307);
    float _1315 = fma(_827, _1067, _1243);
    bool _1317 = _1225 != 2;
    float _1319 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    float _1321 = _1227 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    float _1323 = fma(_1229, (*spvDescriptorSet0.vp_c9)._m0[93].w, _1319);
    float _1325 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    float _1327 = _1229 * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    float _1329 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    float _1331 = fma(_1227, (*spvDescriptorSet0.vp_c9)._m0[93].z, _1325);
    float _1333 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1335 = fma(_1327, -2.0, _1329);
    float _1337 = _1223 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1339 = _1221 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _1341 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1343 = _1341 != 0;
    float _1345 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1347 = _1327;
    if (_1317)
    {
        _1347 = _1223;
    }
    float _1349 = _1347;
    float _1351 = fma(_1339, -2.0, _1333);
    float _1353 = _1349;
    if (!_1317)
    {
        _1353 = _1083;
    }
    float _1355 = _1353;
    float _1357 = fma(_969, (*spvDescriptorSet0.vp_c9)._m0[117].x, _1315);
    float _1359 = -_1345;
    float _1361 = fma(_1337, 2.0, _1359);
    float _1363 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    float _1365 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1367 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1369 = -_197;
    int _1371 = _1269 ? as_type<int>(_1369) : as_type<int>(_197);
    float _1373 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1375 = -_197;
    int _1377 = _1241 ? as_type<int>(_1375) : as_type<int>(_197);
    float _1379 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1381 = fma(_1221, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1367);
    bool _1383 = !_1293;
    float _1385 = _1383 ? _197 : as_type<float>(_1371);
    float _1387 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[91].y, _1335);
    bool _1389 = !_1343;
    float _1391 = _1389 ? _197 : as_type<float>(_1281);
    float _1393 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    bool _1395 = !_1297;
    float _1397 = _1395 ? _197 : as_type<float>(_1377);
    float _1399 = fma(_1221, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1365);
    float _1401 = _1141 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1403 = _1367;
    if (_1317)
    {
        _1403 = _1221;
    }
    float _1405 = _1403;
    float _1407 = fma(_1223, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1373);
    float _1409 = fma(_1223, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1379);
    float _1411 = _1405;
    if (!_1317)
    {
        _1411 = _1223;
    }
    float _1413 = _1411;
    float _1415 = _1137 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1417 = _1257 + _1401;
    float _1419 = -_1393;
    float _1421 = fma(_1321, 2.0, _1419);
    float _1423 = _1277 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    float _1425 = _1267 + _1415;
    float _1427 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1429 = _1417 + _1427;
    float _1431 = _1363 * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    float _1433 = -_123;
    float _1435 = fma(_1433, (*spvDescriptorSet0.vp_c9)._m0[91].x, _1421);
    float _1437 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1439 = _1425 + _1437;
    float _1441 = _1429 * _1429;
    float _1443 = fma(_941, _1035, _1271);
    float _1445 = -_1431;
    float _1447 = -_1387;
    float _1449 = fma(_1445, _1283, _1447);
    float _1451 = _1235 + 0.5;
    float _1453 = fma(_1439, _1439, _1441);
    float _1455 = fma(_1013, _953, _1443);
    float _1457 = -_123;
    float _1459 = fma(_1457, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1361);
    float _1461 = _1391 + 0.5;
    float _1463 = sqrt(_1453);
    float _1465 = fma(_1423, _1451, _1435);
    float _1467 = fma(_1289, _1461, _1459);
    float _1469 = _1355 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1471 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1473 = _1413 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1475 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1477 = fma(_879, _927, _1455);
    float _1479 = -_1471;
    float _1481 = fma(_1469, 2.0, _1479);
    float _1483 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1485 = _1309 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1487 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1351);
    float _1489 = _1287 + (-0.5);
    float _1491 = fma(_1473, -2.0, _1483);
    float _1493 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    bool _1495 = _1463 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1497 = fma(_1085, _909, _1477);
    float _1499 = -_1485;
    float _1501 = -_1487;
    float _1503 = fma(_1499, _1489, _1501);
    float _1505 = _667 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1507 = _1397 + 0.5;
    float _1509 = -_123;
    float _1511 = fma(_1509, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1481);
    float _1513 = _1313 + (-0.5);
    float _1515 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1517 = _1475 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1519 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1491);
    float _1521 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[92].z, _1331);
    float _1523 = _1505 + _1303;
    float _1525 = fma(_1517, _1507, _1511);
    float _1527 = -_1521;
    float _1529 = _1527 + 1.0;
    float _1531 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1533 = _1493 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1535 = -_1533;
    float _1537 = -_1519;
    float _1539 = fma(_1535, _1513, _1537);
    bool _1541 = !_1495;
    float _1543 = _1523;
    float _1545 = _1425;
    float _1547 = _1417;
    if (!_1541)
    {
        float _1549 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1551 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1553 = _1463 + _1551;
        float _1555 = _1523 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1557 = rsqrt(_1453);
        float _1559 = _1553 * _1549;
        float _1561 = _1559 * 0.15915493667125701904296875;
        float _1563 = _1561 * 6.283185482025146484375;
        float _1565 = cos(_1563);
        float _1567 = _1561 * 6.283185482025146484375;
        float _1569 = sin(_1567);
        float _1571 = _1565 + (-1.0);
        float _1573 = fma(_1569, _1555, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1575 = _1571 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1577 = _1557 * _1573;
        float _1579 = fma(_1523, _1565, _1575);
        float _1581 = fma(_1439, _1577, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1583 = fma(_1429, _1577, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1543 = _1579;
        _1545 = _1581;
        _1547 = _1583;
    }
    float _1585 = _1543;
    float _1587 = _1545;
    float _1589 = _1547;
    float _1591 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[92].w, _1323);
    float _1593 = -_1275;
    float _1595 = _1593 + 0.5;
    float _1597 = -_1529;
    float _1599 = fma(_1597, _1235, _1465);
    float _1601 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1409);
    float _1603 = -_1591;
    float _1605 = _1603 + 1.0;
    float _1607 = -_1505;
    float _1609 = _1607 + _1585;
    float _1611 = _1595 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1613 = _1385 + 0.5;
    float _1615 = -_1601;
    float _1617 = _1615 + 1.0;
    float _1619 = fma(_1605, _1249, _1449);
    float _1621 = -_1267;
    float _1623 = _1621 + _1587;
    float _1625 = _1609 * _1609;
    float _1627 = _1611 * _1531;
    float _1629 = _1613 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1631 = -_1617;
    float _1633 = fma(_1397, _1631, _1525);
    float _1635 = -_1257;
    float _1637 = _1635 + _1589;
    float _1639 = fma(_1623, _1623, _1625);
    float _1641 = _1629 * _1515;
    float _1643 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1645 = fma(_1637, _1637, _1639);
    float _1647 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1407);
    float _1649 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1381);
    float _1651 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1399);
    float _1653 = sqrt(_1645);
    float _1655 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1657 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1659 = -_1647;
    float _1661 = _1659 + 1.0;
    float _1663 = -_1649;
    float _1665 = _1663 + 1.0;
    float _1667 = -_1651;
    float _1669 = _1667 + 1.0;
    float _1671 = _1655 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1673 = _1657 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1675 = _1643 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1677 = _1357 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1679 = -_1661;
    float _1681 = fma(_1391, _1679, _1467);
    float _1683 = fma(_1287, _1665, _1503);
    float _1685 = fma(_1313, _1669, _1539);
    float _1687 = fma(_845, (*spvDescriptorSet0.vp_c9)._m0[158].x, _1497);
    out.m_58.x = _1671;
    out.m_58.y = _1673;
    out.m_58.z = _1675;
    out.m_58.w = _1677;
    bool _1689 = _1653 > 0.0;
    out.m_60.x = _1599;
    out.m_60.y = _1619;
    out.m_62.x = _1681;
    out.m_62.y = _1683;
    out.m_62.z = _1641;
    out.m_62.w = _1627;
    out.m_64.x = _1633;
    out.m_64.y = _1685;
    out.m_66.x = _1687;
    bool _1691 = !_1689;
    float _1693 = _1671;
    float _1695 = _1677;
    float _1697 = _1585;
    float _1699 = _1587;
    float _1701 = _1589;
    float _1703 = _1677;
    if (!_1691)
    {
        bool _1705 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _1707 = _1673;
        if (_1705)
        {
            float _1709 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _1707 = _1709;
        }
        float _1711 = _1707;
        float _1713 = _1711;
        if (_1705)
        {
            float _1715 = _415 * _1711;
            _1693 = _1715;
        }
        float _1717 = _1693;
        float _1719 = _1717;
        float _1721 = _1717;
        if (_1705)
        {
            float _1723 = _417 * _1711;
            _1695 = _1723;
        }
        float _1725 = _1695;
        float _1727 = _1725;
        if (_1705)
        {
            float _1729 = _419 * _1711;
            _1713 = _1729;
        }
        float _1731 = _1713;
        float _1733 = _1731;
        if (!_1705)
        {
            float _1735 = _123 + 1.0;
            float _1737 = _1735;
            if (!_1197)
            {
                float _1739 = _1735 * _1735;
                float _1741 = _1739 * 0.5;
                _1719 = _1741;
            }
            float _1743 = _1719;
            float _1745 = _1743;
            if (!_1197)
            {
                float _1747 = _1743 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _1745 = _1747;
            }
            float _1749 = _1745;
            bool _1751 = !_1197;
            float _1753 = _1749;
            if (!_1751)
            {
                float _1755 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1757 = log2(_1755);
                float _1759 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _1761 = _1759 + 1.0;
                float _1763 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1765 = _1757 * _1735;
                float _1767 = 1.0 / _1761;
                float _1769 = _1763 * 0.693147182464599609375;
                float _1771 = exp2(_1765);
                float _1773 = 1.0 / _1769;
                float _1775 = _1771 + (-1.0);
                float _1777 = -_1775;
                float _1779 = fma(_1777, _1773, _1735);
                float _1781 = _1779 * _1767;
                float _1783 = _1781 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _1753 = _1783;
            }
            float _1785 = _1753;
            float _1787 = _1785 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _1789 = _1785 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            bool _1791 = !_1197;
            if (!_1791)
            {
                float _1793 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1795 = log2(_1793);
                float _1797 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _1799 = _1797 + 1.0;
                float _1801 = 1.0 / _1799;
                float _1803 = _1795 * _1735;
                float _1805 = exp2(_1803);
                float _1807 = -_1805;
                float _1809 = _1807 + 1.0;
                float _1811 = _1809 * _1801;
                _1737 = _1811;
            }
            float _1813 = _1737;
            float _1815 = fma(_1813, _161, _1789);
            float _1817 = _1785 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _1819 = fma(_1813, _159, _1787);
            float _1821 = -_377;
            float _1823 = _1821 + _1815;
            float _1825 = fma(_1813, _163, _1817);
            float _1827 = -_379;
            float _1829 = _1827 + _1819;
            float _1831 = _1823 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _1833 = _1823 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _1835 = _1823 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _1837 = -_383;
            float _1839 = _1837 + _1825;
            float _1841 = fma(_1829, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1831);
            float _1843 = fma(_1829, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1833);
            float _1845 = fma(_1829, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1835);
            float _1847 = fma(_1839, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1841);
            float _1849 = fma(_1839, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1843);
            float _1851 = fma(_1839, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1845);
            _423 = _1849;
            _425 = _1847;
            _427 = _1851;
            _1721 = _1847;
            _1727 = _1849;
            _1733 = _1851;
        }
        float _1853 = _423;
        float _1855 = _425;
        float _1857 = _427;
        float _1859 = _1721;
        float _1861 = _1727;
        float _1863 = _1733;
        float _1865 = _1853 * _1853;
        float _1867 = fma(_1855, _1855, _1865);
        float _1869 = fma(_1857, _1857, _1867);
        float _1871 = rsqrt(_1645);
        float _1873 = sqrt(_1869);
        float _1875 = _1623 * _1871;
        float _1877 = _1609 * _1871;
        float _1879 = _1637 * _1871;
        bool _1881 = _1873 > 0.0;
        bool _1883 = !_1881;
        _1703 = _1861;
        if (!_1883)
        {
            float _1885 = rsqrt(_1869);
            float _1887 = _1885 * _1853;
            float _1889 = _1885 * _1855;
            float _1891 = _1885 * _1857;
            float _1893 = _1877 * _1887;
            float _1895 = fma(_1875, _1889, _1893);
            float _1897 = fma(_1879, _1891, _1895);
            float _1899 = _1897 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1901 = fma(_1859, _1899, _1587);
            float _1903 = fma(_1861, _1899, _1585);
            float _1905 = fma(_1863, _1899, _1589);
            _1697 = _1903;
            _1699 = _1901;
            _1701 = _1905;
        }
    }
    float _1907 = _1697;
    float _1909 = _1699;
    float _1911 = _1701;
    float _1913 = _1703;
    float _1915 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1917 = _1907 + _1915;
    float _1919 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1921 = _1909 + _1919;
    float _1923 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1925 = _1911 + _1923;
    float _1927 = _1917 * _1917;
    float _1929 = fma(_1921, _1921, _1927);
    float _1931 = fma(_1925, _1925, _1929);
    float _1933 = rsqrt(_1931);
    float _1935 = sqrt(_1931);
    float _1937 = _1933 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1939 = _1921 * _1937;
    float _1941 = _1925 * _1937;
    float _1943 = _1939 * _1939;
    float _1945 = _1941 * _1941;
    float _1947 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1949 = fma(_1935, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1947);
    float _1951 = precise::clamp(_1949, 0.0, 1.0);
    float _1953 = _1943 + _1945;
    float _1955 = -_1951;
    float _1957 = _1955 + 1.0;
    float _1959 = sqrt(_1953);
    float _1961 = abs(_1957);
    float _1963 = log2(_1961);
    bool _1965 = _1959 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1967 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1969 = _1959 + _1967;
    float _1971 = _1913;
    float _1973 = _1953;
    float _1975 = _1969;
    float _1977 = _1917;
    float _1979 = _1939;
    if (_1965)
    {
        float _1981 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1971 = _1981;
    }
    float _1983 = _1971;
    if (_1965)
    {
        float _1985 = rsqrt(_1953);
        _1973 = _1985;
    }
    float _1987 = _1973;
    float _1989 = _1983;
    if (_1965)
    {
        float _1991 = _1969 * _1983;
        _1975 = _1991;
    }
    float _1993 = _1975;
    if (_1965)
    {
        float _1995 = _1993 * 0.15915493667125701904296875;
        _1989 = _1995;
    }
    float _1997 = _1989;
    float _1999 = _1933;
    float _2001 = _1997;
    if (_1965)
    {
        float _2003 = _1997 * 6.283185482025146484375;
        float _2005 = sin(_2003);
        _1999 = _2005;
    }
    float _2007 = _1999;
    float _2009 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2011 = precise::max(0.0, _2009);
    float _2013 = _1925;
    float _2015 = _2011;
    if (_1965)
    {
        float _2017 = _1997 * 6.283185482025146484375;
        float _2019 = cos(_2017);
        _2013 = _2019;
    }
    float _2021 = _2013;
    float _2023 = -_1937;
    float _2025 = -_2011;
    float _2027 = fma(_1917, _2023, _2025);
    if (_1965)
    {
        float _2029 = _2027 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1977 = _2029;
    }
    float _2031 = _1977;
    float _2033 = _2031;
    float _2035 = _2007;
    if (_1965)
    {
        float _2037 = fma(_2007, _2031, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2033 = _2037;
    }
    float _2039 = _2033;
    float _2041 = _2039;
    float _2043 = _2021;
    if (_1965)
    {
        float _2045 = _2021 + (-1.0);
        _2015 = _2045;
    }
    float _2047 = _2015;
    float _2049 = _2047;
    if (_1965)
    {
        float _2051 = _1987 * _2039;
        _2035 = _2051;
    }
    float _2053 = _2035;
    float _2055 = _2053;
    if (!_1965)
    {
        _2041 = _2027;
    }
    float _2057 = _2041;
    float _2059 = _1907 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2061 = _2057;
    if (_1965)
    {
        float _2063 = _2047 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2001 = _2063;
    }
    float _2065 = _2001;
    if (_1965)
    {
        float _2067 = _1939 * _2053;
        _1979 = _2067;
    }
    float _2069 = _1979;
    if (!_1965)
    {
        _2049 = _1941;
    }
    float _2071 = _2049;
    float _2073 = _2071;
    if (_1965)
    {
        float _2075 = _1941 * _2053;
        _2073 = _2075;
    }
    float _2077 = _2073;
    if (_1965)
    {
        float _2079 = fma(_2027, _2021, _2065);
        _2061 = _2079;
    }
    float _2081 = _2061;
    if (!_1965)
    {
        _2043 = _1943;
    }
    float _2083 = _2043;
    float _2085 = _2083;
    if (_1965)
    {
        float _2087 = _2069 * _2069;
        _2085 = _2087;
    }
    float _2089 = _2085;
    float _2091 = _1907 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (!_1965)
    {
        _2055 = _1945;
    }
    float _2093 = _2055;
    float _2095 = _2093;
    if (_1965)
    {
        float _2097 = _2077 * _2077;
        _2095 = _2097;
    }
    float _2099 = _2095;
    float _2101 = fma(_2081, _2081, _2089);
    float _2103 = _1907 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2105 = fma(_1909, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2091);
    float _2107 = fma(_1909, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2059);
    float _2109 = _2101 + _2099;
    float _2111 = fma(_1909, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2103);
    float _2113 = fma(_1911, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2105);
    float _2115 = _1907 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2117 = fma(_1911, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2107);
    float _2119 = fma(_1911, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2111);
    float _2121 = rsqrt(_2109);
    float _2123 = _2113 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2125 = _2119 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2127 = fma(_1909, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2115);
    float _2129 = _2117 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2131 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2133 = _2125 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2135 = _2123 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2137 = fma(_1911, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2127);
    float _2139 = fma(_2129, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2133);
    float _2141 = -_2135;
    float _2143 = fma(_2141, _2131, 1.0);
    float _2145 = _2137 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2147 = fma(_2123, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2139);
    float _2149 = _2121 * _2069;
    float _2151 = _2121 * _2077;
    float _2153 = log2(_2143);
    float _2155 = fma(_2145, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2147);
    float _2157 = _2121 * _2081;
    float _2159 = _2149 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2161 = _1963 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2163 = _2125 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2165 = -_2159;
    float _2167 = fma(_2157, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2165);
    float _2169 = exp2(_2161);
    float _2171 = fma(_2129, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2163);
    float _2173 = -_2151;
    float _2175 = fma(_2173, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2167);
    float _2177 = _2125 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2179 = fma(_2123, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2171);
    float _2181 = fma(_2175, -0.5, 0.5);
    float _2183 = 1.0 / _2155;
    float _2185 = fma(_2175, 0.5, 0.5);
    float _2187 = fma(_2129, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2177);
    float _2189 = _2157 + 1.0;
    float _2191 = fma(_2145, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2179);
    float _2193 = fma(_2185, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2195 = fma(_2123, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2187);
    float _2197 = _2153 * 0.693147182464599609375;
    float _2199 = sqrt(_2181);
    float _2201 = fma(_2185, _2193, -0.212114393711090087890625);
    float _2203 = fma(_2145, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2195);
    float _2205 = -_2157;
    float _2207 = fma(_2169, _2189, _2205);
    float _2209 = _2197 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2211 = fma(_2185, _2201, 1.570728778839111328125);
    float _2213 = fma(_2207, 0.5, 0.5);
    float _2215 = _2191 * _2183;
    float _2217 = _2203 * _2183;
    float _2219 = fma(_2215, 0.5, 0.5);
    float _2221 = fma(_2217, -0.5, 0.5);
    float _2223 = _2199 * 0.636619746685028076171875;
    float _2225 = -_2211;
    float _2227 = fma(_2223, _2225, 1.0);
    float3 _5923 = float3(_2219, _2221, _2209);
    float _2229 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5923, float3(0.0), isnan(_5923)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5923, float3(0.0), isnan(_5923)), level(0.0)).x;
    float3 _5934 = float3(_2219, _2221, _2209);
    float4 _2232 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5934, float3(0.0), isnan(_5934)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5934, float3(0.0), isnan(_5934)), level(0.0)).xyzw;
    float _2234 = _2232.x;
    float _2236 = _2232.y;
    float _2238 = _2232.z;
    float _2240 = _2232.w;
    float2 _5951 = float2(_2227, _2213);
    float3 _2244 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5951, float2(0.0), isnan(_5951)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5951, float2(0.0), isnan(_5951)), level(0.0)).xyz;
    float _2246 = _2244.x;
    float _2248 = _2244.y;
    float _2250 = _2244.z;
    float _2252 = _1505 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2254 = _1963 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _2256 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2258 = isnan(0.5);
    bool _2260 = _2256 || _2258;
    bool _2262 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2264 = _2260 || _2262;
    float _2266 = fma(_1267, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2252);
    float _2268 = fma(_1257, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2266);
    float _2270 = _1505 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2272 = _2268 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2274 = fma(_1267, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2270);
    float _2276 = 1.0 / _2272;
    float _2278 = fma(_1257, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2274);
    float _2280 = _2278 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2282 = _2280 + _2272;
    float _2284 = _2282 * _2276;
    float _2286 = _2284 * 0.5;
    float _2288 = exp2(_2254);
    float _2290 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2292 = fma(_2286, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2290);
    float _2294 = _2125 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2296 = fma(_2129, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2294);
    float _2298 = 1.0 / _2292;
    float _2300 = fma(_2123, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2296);
    float _2302 = _2296;
    float _2304 = _2123;
    if (_2264)
    {
        _2302 = 1.0;
    }
    float _2306 = _2302;
    float _2308 = _2306;
    if (_2264)
    {
        _2304 = 1.0;
    }
    float _2310 = _2304;
    float _2312 = fma(_2145, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2300);
    float _2314 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2316 = _2298 * _2314;
    float _2318 = _2310;
    if (!_2264)
    {
        float _2320 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2322 = _2320 * 0.15915493667125701904296875;
        float _2324 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2326 = _2322 * 6.283185482025146484375;
        float _2328 = cos(_2326);
        float _2330 = _2324 * 0.15915493667125701904296875;
        float _2332 = _2322 * 6.283185482025146484375;
        float _2334 = sin(_2332);
        float _2336 = 1.0 / _2328;
        float _2338 = _2330 * 6.283185482025146484375;
        float _2340 = cos(_2338);
        float _2342 = _2334 * _2336;
        float _2344 = _2330 * 6.283185482025146484375;
        float _2346 = sin(_2344);
        float _2348 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2350 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2348;
        float _2352 = _2340 * _2342;
        float _2354 = 1.0 / _2350;
        float _2356 = 1.0 / _2352;
        float _2358 = _2346 * _2356;
        float _2360 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2362 = fma(_2316, _2358, _2360);
        float _2364 = _2362 * _2354;
        float _2366 = precise::clamp(_2364, 0.0, 1.0);
        _2308 = _2366;
    }
    float _2368 = _2308;
    if (!_2264)
    {
        float _2370 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2372 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2374 = _2370 * 0.15915493667125701904296875;
        float _2376 = _2372 * 0.15915493667125701904296875;
        float _2378 = _2374 * 6.283185482025146484375;
        float _2380 = cos(_2378);
        float _2382 = _2374 * 6.283185482025146484375;
        float _2384 = sin(_2382);
        float _2386 = 1.0 / _2380;
        float _2388 = _2376 * 6.283185482025146484375;
        float _2390 = cos(_2388);
        float _2392 = _2384 * _2386;
        float _2394 = _2376 * 6.283185482025146484375;
        float _2396 = sin(_2394);
        float _2398 = _2390 * _2392;
        float _2400 = 1.0 / _2398;
        float _2402 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2404 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2402;
        float _2406 = 1.0 / _2404;
        float _2408 = _2396 * _2400;
        float _2410 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2412 = fma(_2316, _2408, _2410);
        float _2414 = _2412 * _2406;
        float _2416 = precise::clamp(_2414, 0.0, 1.0);
        float _2418 = -_2416;
        float _2420 = _2418 + 1.0;
        _2318 = _2420;
    }
    float _2422 = _2318;
    float _2424 = _2368 * _2422;
    float _2426 = -_2288;
    float _2428 = _2426 + 1.0;
    bool _2430 = _2368 > 0.0;
    bool _2432 = isnan(_2368);
    bool _2434 = _2430 || _2432;
    bool _2436 = isnan(0.0);
    bool _2438 = _2434 || _2436;
    float _2440 = _2312 + _2155;
    float _2442 = _2424 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2444 = _2428 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    bool _2446 = _2422 <= 0.0;
    bool _2448 = !_2438;
    bool _2450 = _2446 || _2448;
    float _2452 = _2440 * 0.5;
    float _2454 = _2444 * _2229;
    float _2456 = -_2444;
    float _2458 = _2456 + 1.0;
    out.gl_Position.x = _2191;
    out.gl_Position.y = _2203;
    out.gl_Position.z = _2312;
    out.gl_Position.w = _2155;
    float _2460 = _2442 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2462 = _2240 * _2454;
    float _2464 = _2250 * _2454;
    out.m_68.z = _2452;
    out.m_68.w = _2155;
    float _2466 = fma(_2246, _2462, _2234);
    float _2468 = fma(_2248, _2462, _2236);
    float _2470 = _2240 * _2458;
    float _2472 = fma(_2240, _2464, _2238);
    out.m_45.x = _2460;
    out.m_70.x = _2466;
    out.m_70.y = _2468;
    out.m_70.z = _2472;
    out.m_70.w = _2470;
    if (!_2450)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_45.x = 0.0;
    float _2474 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2474;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    bool _611 = false;
    bool _447 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _84 = in.m_42.w;
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
        out.m_45.x = 0.0;
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
        float _2531 = as_type<float>(_105);
        out.gl_Position.z = _2531;
    }
    if (!_93)
    {
        return out;
    }
    float _109 = in.m_47.w;
    bool _111 = _109 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _113 = isnan(_109);
    bool _115 = _111 || _113;
    bool _117 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _119 = _115 || _117;
    float _121 = -_109;
    float _123 = _121 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _125 = 0.0;
    if (_119)
    {
        float _127 = float(_89);
        _125 = _127;
    }
    float _129 = _125;
    bool _131 = _123 >= _129;
    bool _133 = !_119;
    bool _135 = _131 || _133;
    if (_135)
    {
        _99 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _137 = _99;
    if (_135)
    {
        out.m_45.x = 0.0;
    }
    if (_135)
    {
        float _139 = _137 * 5.0;
        _107 = as_type<int>(_139);
    }
    int _141 = _107;
    if (_135)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2599 = as_type<float>(_141);
        out.gl_Position.z = _2599;
    }
    if (_135)
    {
        return out;
    }
    float _143 = as_type<float>(int(gl_VertexIndex));
    float _145 = _123 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _147 = in.m_52.w;
    bool _149 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _151 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _153 = _149 || _151;
    bool _155 = isnan(1.0);
    bool _157 = _153 || _155;
    float _159 = in.m_47.x;
    float _161 = in.m_47.y;
    float _163 = in.m_47.z;
    float _165 = in.m_42.x;
    float _167 = in.m_42.y;
    float _169 = in.m_42.z;
    float _171 = 0.0;
    float _173 = _145;
    if (!_157)
    {
        float _175 = _145 * _145;
        float _177 = _175 * 0.5;
        _171 = _177;
    }
    float _179 = _171;
    float _181 = _179;
    if (!_157)
    {
        float _183 = _179 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _181 = _183;
    }
    float _185 = _181;
    int _187 = as_type<int>(_143) & 1;
    bool _189 = _187 != 0;
    int _191 = as_type<int>(_143) & 2;
    bool _193 = _191 != 0;
    bool _195 = !_189;
    float _197 = _195 ? (-0.5) : 0.5;
    bool _199 = !_193;
    float _201 = _199 ? (-0.5) : 0.5;
    bool _203 = !_157;
    float _205 = _185;
    float _207 = 0.0;
    float _209 = 0.0;
    bool _211 = false;
    bool _213 = _193;
    if (!_203)
    {
        float _215 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _217 = log2(_215);
        float _219 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _221 = _219 + 1.0;
        float _223 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _225 = _145 * _217;
        float _227 = 1.0 / _221;
        float _229 = _223 * 0.693147182464599609375;
        float _231 = exp2(_225);
        float _233 = 1.0 / _229;
        float _235 = _231 + (-1.0);
        float _237 = -_235;
        float _239 = fma(_237, _233, _145);
        float _241 = _239 * _227;
        float _243 = _241 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _205 = _243;
        _207 = _227;
        _209 = _231;
    }
    float _245 = _205;
    float _247 = _207;
    float _249 = _209;
    bool _251 = !_157;
    float _253 = _249;
    float _255 = _247;
    float _257 = _245;
    if (!_251)
    {
        float _259 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _261 = log2(_259);
        float _263 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _265 = _263 + 1.0;
        float _267 = 1.0 / _265;
        float _269 = _145 * _261;
        float _271 = exp2(_269);
        float _273 = -_271;
        float _275 = _273 + 1.0;
        float _277 = _275 * _267;
        _173 = _277;
        _253 = _265;
    }
    float _279 = _173;
    float _281 = _253;
    float _283 = _281;
    if (!_157)
    {
        float _285 = _123 * _123;
        float _287 = _285 * 0.5;
        _255 = _287;
    }
    float _289 = _255;
    float _291 = _245 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _293 = _245 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _295 = _245 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    if (!_157)
    {
        _283 = _123;
    }
    float _297 = _283;
    float _299 = fma(_279, _159, _291);
    float _301 = fma(_279, _161, _293);
    float _303 = _297;
    if (!_157)
    {
        float _305 = _289 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _257 = _305;
    }
    float _307 = _257;
    bool _309 = !_157;
    float _311 = _307;
    if (!_309)
    {
        float _313 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _315 = log2(_313);
        float _317 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _319 = _317 + 1.0;
        float _321 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _323 = _123 * _315;
        float _325 = 1.0 / _319;
        float _327 = _321 * 0.693147182464599609375;
        float _329 = exp2(_323);
        float _331 = 1.0 / _327;
        float _333 = _329 + (-1.0);
        float _335 = -_333;
        float _337 = fma(_335, _331, _123);
        float _339 = _337 * _325;
        float _341 = _339 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _311 = _341;
    }
    float _343 = _311;
    bool _345 = !_157;
    if (!_345)
    {
        float _347 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _349 = log2(_347);
        float _351 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _353 = _351 + 1.0;
        float _355 = 1.0 / _353;
        float _357 = _123 * _349;
        float _359 = exp2(_357);
        float _361 = -_359;
        float _363 = _361 + 1.0;
        float _365 = _363 * _355;
        _303 = _365;
    }
    float _367 = _303;
    float _369 = _343 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _371 = _343 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    bool _373 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _375 = _343 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _377 = fma(_367, _161, _369);
    float _379 = fma(_367, _159, _371);
    float _381 = fma(_279, _163, _295);
    float _383 = fma(_367, _163, _375);
    float _385 = -_377;
    float _387 = _301 + _385;
    float _389 = fma(_299, _147, _165);
    float _391 = -_379;
    float _393 = _299 + _391;
    float _395 = -_383;
    float _397 = _381 + _395;
    float _399 = _387 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _401 = _387 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _403 = _387 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _405 = fma(_301, _147, _167);
    float _407 = fma(_393, (*spvDescriptorSet0.vp_c10)._m0[4].x, _399);
    float _409 = fma(_393, (*spvDescriptorSet0.vp_c10)._m0[5].x, _401);
    float _411 = fma(_393, (*spvDescriptorSet0.vp_c10)._m0[6].x, _403);
    float _413 = fma(_381, _147, _169);
    float _415 = fma(_397, (*spvDescriptorSet0.vp_c10)._m0[4].z, _407);
    float _417 = fma(_397, (*spvDescriptorSet0.vp_c10)._m0[5].z, _409);
    float _419 = fma(_397, (*spvDescriptorSet0.vp_c10)._m0[6].z, _411);
    bool _421 = !_373;
    float _423 = _417;
    float _425 = _415;
    float _427 = _419;
    float _445;
    if (!_421)
    {
        float _429 = in.m_54.x;
        float _431 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _433 = _429 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _435 = fma(_433, (*spvDescriptorSet0.vp_c9)._m0[12].x, _123);
        float _437 = _435 * _431;
        float _439 = floor(_437);
        float _441 = -_439;
        float _443 = _437 + _441;
        _445 = _443;
        _447 = true;
    }
    else
    {
        float _449 = float(_89);
        float _451 = 1.0 / _449;
        float _453 = _123 * _451;
        _445 = _453;
    }
    _447 = false;
    float _455 = _445;
    float _457 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _459 = _455 + _457;
    bool _461 = _455 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _463 = isnan(_455);
    bool _465 = _461 || _463;
    bool _467 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _469 = _465 || _467;
    float _471 = float(_469);
    float _473 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _475 = _455 + _473;
    bool _477 = _455 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _479 = isnan(_455);
    bool _481 = _477 || _479;
    bool _483 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _485 = _481 || _483;
    float _487 = float(_485);
    float _489 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _491 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _489;
    float _493 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _495 = _493 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _497 = -_471;
    float _499 = _497 + 1.0;
    float _501 = 1.0 / _495;
    bool _503 = _455 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _505 = isnan(_455);
    bool _507 = _503 || _505;
    bool _509 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _511 = _507 || _509;
    float _513 = float(_511);
    float _515 = _487 * _499;
    float _517 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _519 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _517;
    float _521 = -_487;
    float _523 = _521 + 1.0;
    bool _525 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _527 = 1.0 / _491;
    float _529 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _531 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _529;
    float _533 = _475 * _501;
    float _535 = _513 * _523;
    float _537 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _539 = _537 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _541 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _543 = _541 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _545 = -_513;
    float _547 = _545 + 1.0;
    float _549 = fma(_539, _533, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _551 = fma(_543, _533, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _553 = _459 * _527;
    float _555 = in.m_52.x;
    float _557 = in.m_52.y;
    float _559 = fma(_519, _553, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _561 = fma(_531, _553, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _563 = _559 * _535;
    float _565 = _561 * _535;
    float _567 = fma(_547, (*spvDescriptorSet0.vp_c9)._m0[143].x, _563);
    float _569 = fma(_547, (*spvDescriptorSet0.vp_c9)._m0[143].y, _565);
    float _571 = fma(_551, _515, _567);
    float _573 = fma(_549, _515, _569);
    float _575 = fma(_471, (*spvDescriptorSet0.vp_c9)._m0[145].x, _571);
    float _577 = fma(_471, (*spvDescriptorSet0.vp_c9)._m0[145].y, _573);
    float _579 = _575 * _555;
    float _581 = _577 * _557;
    bool _583 = !_525;
    float _607;
    float _609;
    if (!_583)
    {
        float _585 = in.m_54.x;
        float _587 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _589 = float(_89);
        float _591 = 1.0 / _589;
        float _593 = _585 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _595 = _123 * _591;
        float _597 = fma(_593, (*spvDescriptorSet0.vp_c9)._m0[11].y, _123);
        float _599 = _597 * _587;
        float _601 = floor(_599);
        float _603 = -_601;
        float _605 = _599 + _603;
        _607 = _595;
        _609 = _605;
        _611 = true;
    }
    else
    {
        float _613 = float(_89);
        float _615 = 1.0 / _613;
        float _617 = _123 * _615;
        _607 = _617;
        _609 = _617;
    }
    _611 = false;
    float _619 = _607;
    float _621 = _609;
    float _623 = _405 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _625 = _579 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _627 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _629 = _627 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    int _631 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _633 = _631 != 0;
    float _635 = _405 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _637 = _405 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _639 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _197);
    float _641 = 1.0 / _629;
    float _643 = fma(_389, (*spvDescriptorSet0.vp_c10)._m0[6].x, _637);
    float _645 = fma(_389, (*spvDescriptorSet0.vp_c10)._m0[4].x, _635);
    float _647 = _581 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _649 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _201);
    float _651 = fma(_389, (*spvDescriptorSet0.vp_c10)._m0[5].x, _623);
    float _653 = _625 * _639;
    float _655 = fma(_413, (*spvDescriptorSet0.vp_c10)._m0[4].z, _645);
    float _657 = _647 * _649;
    float _659 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _661 = _659 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _663 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _665 = _663 + (*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _667 = fma(_413, (*spvDescriptorSet0.vp_c10)._m0[5].z, _651);
    float _669 = fma(_413, (*spvDescriptorSet0.vp_c10)._m0[6].z, _643);
    float _671 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _673 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _675 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _677 = 1.0 / _661;
    float _679 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _681 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _679;
    float _683 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _685 = _683 + (*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _687 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _689 = _687 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _691 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _693 = 1.0 / _665;
    float _695 = _671 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _697 = _673 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _699 = _675 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _701 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _703 = _701 + (*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _705 = _689 * _641;
    float _707 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _709 = _707 + (*spvDescriptorSet0.vp_c9)._m0[158].w;
    float _711 = 1.0 / _685;
    float _713 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _715 = _713 + (*spvDescriptorSet0.vp_c9)._m0[154].w;
    out.m_56.x = _695;
    out.m_56.y = _697;
    out.m_56.z = _699;
    out.m_56.w = _691;
    float _717 = -(*spvDescriptorSet0.vp_c9)._m0[151].x;
    float _719 = (*spvDescriptorSet0.vp_c9)._m0[152].x + _717;
    float _721 = _681 * _677;
    float _723 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _725 = _723 + (*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _727 = 1.0 / _703;
    float _729 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _731 = _729 + (*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _733 = _657 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _735 = _619 >= (*spvDescriptorSet0.vp_c9)._m0[152].w;
    bool _737 = isnan(_619);
    bool _739 = _735 || _737;
    bool _741 = isnan((*spvDescriptorSet0.vp_c9)._m0[152].w);
    bool _743 = _739 || _741;
    float _745 = float(_743);
    float _747 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _749 = _619 + _747;
    int _751 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _753 = _751 != 0;
    float _755 = 1.0 / _715;
    float _757 = -(*spvDescriptorSet0.vp_c9)._m0[152].x;
    float _759 = _757 + (*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _761 = fma(_653, (*spvDescriptorSet0.vp_c8)._m0[24].x, _733);
    float _763 = _759 * _693;
    int _765 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _767 = _765 != 0;
    float _769 = -(*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _771 = (*spvDescriptorSet0.vp_c9)._m0[156].x + _769;
    float _773 = 1.0 / _709;
    float _775 = -(*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _777 = (*spvDescriptorSet0.vp_c9)._m0[154].x + _775;
    float _779 = -(*spvDescriptorSet0.vp_c9)._m0[154].x;
    float _781 = _779 + (*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _783 = _771 * _711;
    float _785 = -(*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _787 = (*spvDescriptorSet0.vp_c9)._m0[158].x + _785;
    float _789 = _657 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _791 = _781 * _727;
    float _793 = _657 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _795 = 1.0 / _725;
    float _797 = -(*spvDescriptorSet0.vp_c9)._m0[156].x;
    float _799 = _797 + (*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _801 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _803 = _621 + _801;
    float _805 = _777 * _755;
    float _807 = fma(_653, (*spvDescriptorSet0.vp_c8)._m0[25].x, _793);
    float _809 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _811 = _621 + _809;
    float _813 = fma(_653, (*spvDescriptorSet0.vp_c8)._m0[26].x, _789);
    float _815 = fma(_721, _803, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _817 = 1.0 / _731;
    float _819 = _787 * _773;
    float _821 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _823 = _619 + _821;
    float _825 = in.m_54.w;
    float _827 = fma(_705, _811, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _829 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _831 = _619 + _829;
    float _833 = fma(_805, _823, (*spvDescriptorSet0.vp_c9)._m0[153].x);
    bool _835 = _619 >= (*spvDescriptorSet0.vp_c9)._m0[158].w;
    bool _837 = isnan(_619);
    bool _839 = _835 || _837;
    bool _841 = isnan((*spvDescriptorSet0.vp_c9)._m0[158].w);
    bool _843 = _839 || _841;
    float _845 = float(_843);
    float _847 = _799 * _795;
    float _849 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _851 = _619 + _849;
    float _853 = _795;
    float _855 = _619;
    if (_753)
    {
        float _857 = in.m_54.x;
        _853 = _857;
    }
    float _859 = _853;
    float _861 = fma(_763, _831, (*spvDescriptorSet0.vp_c9)._m0[152].x);
    bool _863 = _619 >= (*spvDescriptorSet0.vp_c9)._m0[157].w;
    bool _865 = isnan(_619);
    bool _867 = _863 || _865;
    bool _869 = isnan((*spvDescriptorSet0.vp_c9)._m0[157].w);
    bool _871 = _867 || _869;
    float _873 = float(_871);
    float _875 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _877 = _619 + _875;
    float _879 = fma(_847, _851, (*spvDescriptorSet0.vp_c9)._m0[156].x);
    float _881 = -_845;
    float _883 = _881 + 1.0;
    float _885 = _719 * _817;
    bool _887 = _619 >= (*spvDescriptorSet0.vp_c9)._m0[156].w;
    bool _889 = isnan(_619);
    bool _891 = _887 || _889;
    bool _893 = isnan((*spvDescriptorSet0.vp_c9)._m0[156].w);
    bool _895 = _891 || _893;
    float _897 = float(_895);
    float _899 = -_873;
    float _901 = _899 + 1.0;
    float _903 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _905 = _619 + _903;
    float _907 = fma(_885, _877, (*spvDescriptorSet0.vp_c9)._m0[151].x);
    float _909 = _873 * _883;
    bool _911 = _619 >= (*spvDescriptorSet0.vp_c9)._m0[155].w;
    bool _913 = isnan(_619);
    bool _915 = _911 || _913;
    bool _917 = isnan((*spvDescriptorSet0.vp_c9)._m0[155].w);
    bool _919 = _915 || _917;
    float _921 = float(_919);
    float _923 = -_897;
    float _925 = _923 + 1.0;
    float _927 = _897 * _901;
    bool _929 = _619 >= (*spvDescriptorSet0.vp_c9)._m0[154].w;
    bool _931 = isnan(_619);
    bool _933 = _929 || _931;
    bool _935 = isnan((*spvDescriptorSet0.vp_c9)._m0[154].w);
    bool _937 = _933 || _935;
    float _939 = float(_937);
    float _941 = fma(_791, _905, (*spvDescriptorSet0.vp_c9)._m0[154].x);
    float _943 = _883;
    float _945 = _901;
    float _947 = _825;
    if (_767)
    {
        float _949 = _825 * 3.1415927410125732421875;
        _943 = _949;
    }
    float _951 = _943;
    float _953 = _921 * _925;
    float _955 = -_921;
    float _957 = _955 + 1.0;
    bool _959 = _621 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _961 = isnan(_621);
    bool _963 = _959 || _961;
    bool _965 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _967 = _963 || _965;
    float _969 = float(_967);
    float _971 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _973 = _619 + _971;
    bool _975 = _619 >= (*spvDescriptorSet0.vp_c9)._m0[153].w;
    bool _977 = isnan(_619);
    bool _979 = _975 || _977;
    bool _981 = isnan((*spvDescriptorSet0.vp_c9)._m0[153].w);
    bool _983 = _979 || _981;
    float _985 = float(_983);
    if (_767)
    {
        float _987 = _951 * 0.15915493667125701904296875;
        _945 = _987;
    }
    float _989 = _945;
    float _991 = -_939;
    float _993 = _991 + 1.0;
    bool _995 = _825 > 0.5;
    if (_753)
    {
        float _997 = _859 * 3.1415927410125732421875;
        _947 = _997;
    }
    float _999 = _947;
    bool _1001 = _621 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1003 = isnan(_621);
    bool _1005 = _1001 || _1003;
    bool _1007 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1009 = _1005 || _1007;
    float _1011 = float(_1009);
    float _1013 = fma(_783, _973, (*spvDescriptorSet0.vp_c9)._m0[155].x);
    float _1015 = -_969;
    float _1017 = _1015 + 1.0;
    float _1019 = -_985;
    float _1021 = _1019 + 1.0;
    bool _1023 = _621 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1025 = isnan(_621);
    bool _1027 = _1023 || _1025;
    bool _1029 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1031 = _1027 || _1029;
    float _1033 = float(_1031);
    float _1035 = _939 * _957;
    float _1037 = _985 * _993;
    bool _1039 = _619 >= (*spvDescriptorSet0.vp_c9)._m0[151].w;
    bool _1041 = isnan(_619);
    bool _1043 = _1039 || _1041;
    bool _1045 = isnan((*spvDescriptorSet0.vp_c9)._m0[151].w);
    bool _1047 = _1043 || _1045;
    float _1049 = float(_1047);
    float _1051 = _985;
    float _1053 = _939;
    if (_633)
    {
        float _1055 = in.m_54.x;
        float _1057 = in.m_54.y;
        _1051 = _1055;
        _1053 = _1057;
    }
    float _1059 = _1051;
    float _1061 = _1053;
    if (_753)
    {
        float _1063 = _999 * 0.15915493667125701904296875;
        _855 = _1063;
    }
    float _1065 = _855;
    float _1067 = _1011 * _1017;
    float _1069 = -_1011;
    float _1071 = _1069 + 1.0;
    float _1073 = _745 * _1021;
    float _1075 = _989;
    if (_767)
    {
        float _1077 = _989 * 6.283185482025146484375;
        float _1079 = sin(_1077);
        _1075 = _1079;
    }
    float _1081 = _1075;
    float _1083 = in.m_54.z;
    float _1085 = fma(_819, _749, (*spvDescriptorSet0.vp_c9)._m0[157].x);
    float _1087 = -_745;
    float _1089 = _1087 + 1.0;
    float _1091 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1093 = _1033 * _1071;
    int _1095 = int(_767);
    int _1097 = _193 ? 2 : 0;
    int _1099 = _1095 | _1097;
    int _1101 = _995 ? 4 : 0;
    int _1103 = _1099 | _1101;
    int _1105 = _157 ? 8 : 0;
    int _1107 = _1103 | _1105;
    int _1109 = _753 ? 16 : 0;
    int _1111 = _1107 | _1109;
    int _1113 = false ? 32 : 0;
    int _1115 = _1111 | _1113;
    int _1117 = _633 ? 64 : 0;
    int _1119 = _1115 | _1117;
    int _1121 = _1119 & 8;
    float _1123 = _1049 * _1089;
    float _1125 = _1065;
    float _1127 = _1089;
    float _1129 = _1123;
    if (_753)
    {
        float _1131 = _1065 * 6.283185482025146484375;
        float _1133 = sin(_1131);
        _1125 = _1133;
    }
    float _1135 = _1125;
    float _1137 = fma(_1091, (*spvDescriptorSet0.vp_c8)._m0[24].z, _761);
    float _1139 = fma(_1091, (*spvDescriptorSet0.vp_c8)._m0[25].z, _807);
    float _1141 = fma(_1091, (*spvDescriptorSet0.vp_c8)._m0[26].z, _813);
    float _1143 = _815 * _1093;
    float _1145 = _907 * _1123;
    float _1147 = -_201;
    int _1149 = _995 ? as_type<int>(_1147) : as_type<int>(_201);
    float _1151 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1153 = _1081;
    if (_767)
    {
        bool _1155 = _1081 > 0.5;
        _211 = _1155;
    }
    bool _1157 = _211;
    float _1159 = -_1033;
    float _1161 = _1159 + 1.0;
    int _1163 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1165 = _1163 != 0;
    if (!_767)
    {
        _1153 = _197;
    }
    float _1167 = _1153;
    float _1169 = _1135;
    float _1171 = _1167;
    if (_753)
    {
        bool _1173 = _1135 > 0.5;
        _213 = _1173;
    }
    bool _1175 = _213;
    if (!_753)
    {
        _1169 = _201;
    }
    float _1177 = _1169;
    int _1179 = 0;
    float _1181 = _1177;
    if (_633)
    {
        _1179 = 0;
    }
    int _1183 = _1179;
    float _1185 = _1061;
    float _1187 = _1059;
    int _1189 = _1183;
    if (_633)
    {
        _1127 = _1059;
    }
    float _1191 = _1127;
    float _1193 = _1191;
    if (_633)
    {
        _1129 = _1061;
    }
    float _1195 = _1129;
    bool _1197 = _1121 != 0;
    float _1199 = _1195;
    if (!_633)
    {
        float _1201 = in.m_54.x;
        float _1203 = in.m_54.y;
        float _1205 = _1201 * 3.1415927410125732421875;
        float _1207 = _1205 * 0.15915493667125701904296875;
        float _1209 = _1203 * 3.1415927410125732421875;
        float _1211 = _1209 * 0.15915493667125701904296875;
        float _1213 = _1207 * 6.283185482025146484375;
        float _1215 = sin(_1213);
        float _1217 = _1211 * 6.283185482025146484375;
        float _1219 = sin(_1217);
        _1185 = _1203;
        _1187 = _1201;
        _1189 = 2;
        _1193 = _1215;
        _1199 = _1219;
    }
    float _1221 = _1185;
    float _1223 = _1187;
    int _1225 = _1189;
    float _1227 = _1193;
    float _1229 = _1199;
    if (_767)
    {
        float _1231 = -_197;
        float _1233 = _1157 ? _1231 : _197;
        _1171 = _1233;
    }
    float _1235 = _1171;
    float _1237 = -_1049;
    float _1239 = _1237 + 1.0;
    bool _1241 = _1221 > 0.5;
    float _1243 = fma(_1161, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1143);
    if (_753)
    {
        float _1245 = -_201;
        float _1247 = _1175 ? _1245 : _201;
        _1181 = _1247;
    }
    float _1249 = _1181;
    float _1251 = fma(_1239, (*spvDescriptorSet0.vp_c9)._m0[151].x, _1145);
    int _1253 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1255 = _1253 != 0;
    float _1257 = _669 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _1259 = _1223 > 0.5;
    float _1261 = fma(_861, _1073, _1251);
    float _1263 = -_201;
    int _1265 = _1241 ? as_type<int>(_1263) : as_type<int>(_201);
    float _1267 = _655 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _1269 = _1083 > 0.5;
    float _1271 = fma(_833, _1037, _1261);
    bool _1273 = !_1165;
    float _1275 = _1273 ? _201 : as_type<float>(_1149);
    float _1277 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    float _1279 = -_197;
    int _1281 = _1259 ? as_type<int>(_1279) : as_type<int>(_197);
    float _1283 = _1249 + (-0.5);
    bool _1285 = !_1255;
    float _1287 = _1285 ? _201 : as_type<float>(_1265);
    float _1289 = _1151 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _1291 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1293 = _1291 != 0;
    int _1295 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1297 = _1295 != 0;
    int _1299 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1301 = _1299 != 0;
    float _1303 = _1139 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1305 = -_201;
    int _1307 = _1269 ? as_type<int>(_1305) : as_type<int>(_201);
    float _1309 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _1311 = !_1301;
    float _1313 = _1311 ? _201 : as_type<float>(_1307);
    float _1315 = fma(_827, _1067, _1243);
    bool _1317 = _1225 != 2;
    float _1319 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    float _1321 = _1227 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    float _1323 = fma(_1229, (*spvDescriptorSet0.vp_c9)._m0[93].w, _1319);
    float _1325 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    float _1327 = _1229 * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    float _1329 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    float _1331 = fma(_1227, (*spvDescriptorSet0.vp_c9)._m0[93].z, _1325);
    float _1333 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1335 = fma(_1327, -2.0, _1329);
    float _1337 = _1223 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1339 = _1221 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _1341 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1343 = _1341 != 0;
    float _1345 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1347 = _1327;
    if (_1317)
    {
        _1347 = _1223;
    }
    float _1349 = _1347;
    float _1351 = fma(_1339, -2.0, _1333);
    float _1353 = _1349;
    if (!_1317)
    {
        _1353 = _1083;
    }
    float _1355 = _1353;
    float _1357 = fma(_969, (*spvDescriptorSet0.vp_c9)._m0[117].x, _1315);
    float _1359 = -_1345;
    float _1361 = fma(_1337, 2.0, _1359);
    float _1363 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    float _1365 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1367 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1369 = -_197;
    int _1371 = _1269 ? as_type<int>(_1369) : as_type<int>(_197);
    float _1373 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1375 = -_197;
    int _1377 = _1241 ? as_type<int>(_1375) : as_type<int>(_197);
    float _1379 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1381 = fma(_1221, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1367);
    bool _1383 = !_1293;
    float _1385 = _1383 ? _197 : as_type<float>(_1371);
    float _1387 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[91].y, _1335);
    bool _1389 = !_1343;
    float _1391 = _1389 ? _197 : as_type<float>(_1281);
    float _1393 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    bool _1395 = !_1297;
    float _1397 = _1395 ? _197 : as_type<float>(_1377);
    float _1399 = fma(_1221, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1365);
    float _1401 = _1141 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1403 = _1367;
    if (_1317)
    {
        _1403 = _1221;
    }
    float _1405 = _1403;
    float _1407 = fma(_1223, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1373);
    float _1409 = fma(_1223, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1379);
    float _1411 = _1405;
    if (!_1317)
    {
        _1411 = _1223;
    }
    float _1413 = _1411;
    float _1415 = _1137 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1417 = _1257 + _1401;
    float _1419 = -_1393;
    float _1421 = fma(_1321, 2.0, _1419);
    float _1423 = _1277 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    float _1425 = _1267 + _1415;
    float _1427 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1429 = _1417 + _1427;
    float _1431 = _1363 * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    float _1433 = -_123;
    float _1435 = fma(_1433, (*spvDescriptorSet0.vp_c9)._m0[91].x, _1421);
    float _1437 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1439 = _1425 + _1437;
    float _1441 = _1429 * _1429;
    float _1443 = fma(_941, _1035, _1271);
    float _1445 = -_1431;
    float _1447 = -_1387;
    float _1449 = fma(_1445, _1283, _1447);
    float _1451 = _1235 + 0.5;
    float _1453 = fma(_1439, _1439, _1441);
    float _1455 = fma(_1013, _953, _1443);
    float _1457 = -_123;
    float _1459 = fma(_1457, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1361);
    float _1461 = _1391 + 0.5;
    float _1463 = sqrt(_1453);
    float _1465 = fma(_1423, _1451, _1435);
    float _1467 = fma(_1289, _1461, _1459);
    float _1469 = _1355 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1471 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1473 = _1413 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1475 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1477 = fma(_879, _927, _1455);
    float _1479 = -_1471;
    float _1481 = fma(_1469, 2.0, _1479);
    float _1483 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1485 = _1309 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1487 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1351);
    float _1489 = _1287 + (-0.5);
    float _1491 = fma(_1473, -2.0, _1483);
    float _1493 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    bool _1495 = _1463 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1497 = fma(_1085, _909, _1477);
    float _1499 = -_1485;
    float _1501 = -_1487;
    float _1503 = fma(_1499, _1489, _1501);
    float _1505 = _667 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1507 = _1397 + 0.5;
    float _1509 = -_123;
    float _1511 = fma(_1509, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1481);
    float _1513 = _1313 + (-0.5);
    float _1515 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1517 = _1475 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1519 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1491);
    float _1521 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[92].z, _1331);
    float _1523 = _1505 + _1303;
    float _1525 = fma(_1517, _1507, _1511);
    float _1527 = -_1521;
    float _1529 = _1527 + 1.0;
    float _1531 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1533 = _1493 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1535 = -_1533;
    float _1537 = -_1519;
    float _1539 = fma(_1535, _1513, _1537);
    bool _1541 = !_1495;
    float _1543 = _1523;
    float _1545 = _1425;
    float _1547 = _1417;
    if (!_1541)
    {
        float _1549 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1551 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1553 = _1463 + _1551;
        float _1555 = _1523 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1557 = rsqrt(_1453);
        float _1559 = _1553 * _1549;
        float _1561 = _1559 * 0.15915493667125701904296875;
        float _1563 = _1561 * 6.283185482025146484375;
        float _1565 = cos(_1563);
        float _1567 = _1561 * 6.283185482025146484375;
        float _1569 = sin(_1567);
        float _1571 = _1565 + (-1.0);
        float _1573 = fma(_1569, _1555, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1575 = _1571 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1577 = _1557 * _1573;
        float _1579 = fma(_1523, _1565, _1575);
        float _1581 = fma(_1439, _1577, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1583 = fma(_1429, _1577, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1543 = _1579;
        _1545 = _1581;
        _1547 = _1583;
    }
    float _1585 = _1543;
    float _1587 = _1545;
    float _1589 = _1547;
    float _1591 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[92].w, _1323);
    float _1593 = -_1275;
    float _1595 = _1593 + 0.5;
    float _1597 = -_1529;
    float _1599 = fma(_1597, _1235, _1465);
    float _1601 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1409);
    float _1603 = -_1591;
    float _1605 = _1603 + 1.0;
    float _1607 = -_1505;
    float _1609 = _1607 + _1585;
    float _1611 = _1595 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1613 = _1385 + 0.5;
    float _1615 = -_1601;
    float _1617 = _1615 + 1.0;
    float _1619 = fma(_1605, _1249, _1449);
    float _1621 = -_1267;
    float _1623 = _1621 + _1587;
    float _1625 = _1609 * _1609;
    float _1627 = _1611 * _1531;
    float _1629 = _1613 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1631 = -_1617;
    float _1633 = fma(_1397, _1631, _1525);
    float _1635 = -_1257;
    float _1637 = _1635 + _1589;
    float _1639 = fma(_1623, _1623, _1625);
    float _1641 = _1629 * _1515;
    float _1643 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1645 = fma(_1637, _1637, _1639);
    float _1647 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1407);
    float _1649 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1381);
    float _1651 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1399);
    float _1653 = sqrt(_1645);
    float _1655 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1657 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1659 = -_1647;
    float _1661 = _1659 + 1.0;
    float _1663 = -_1649;
    float _1665 = _1663 + 1.0;
    float _1667 = -_1651;
    float _1669 = _1667 + 1.0;
    float _1671 = _1655 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1673 = _1657 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1675 = _1643 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1677 = _1357 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1679 = -_1661;
    float _1681 = fma(_1391, _1679, _1467);
    float _1683 = fma(_1287, _1665, _1503);
    float _1685 = fma(_1313, _1669, _1539);
    float _1687 = fma(_845, (*spvDescriptorSet0.vp_c9)._m0[158].x, _1497);
    out.m_58.x = _1671;
    out.m_58.y = _1673;
    out.m_58.z = _1675;
    out.m_58.w = _1677;
    bool _1689 = _1653 > 0.0;
    out.m_60.x = _1599;
    out.m_60.y = _1619;
    out.m_62.x = _1681;
    out.m_62.y = _1683;
    out.m_62.z = _1641;
    out.m_62.w = _1627;
    out.m_64.x = _1633;
    out.m_64.y = _1685;
    out.m_66.x = _1687;
    bool _1691 = !_1689;
    float _1693 = _1671;
    float _1695 = _1677;
    float _1697 = _1585;
    float _1699 = _1587;
    float _1701 = _1589;
    float _1703 = _1677;
    if (!_1691)
    {
        bool _1705 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _1707 = _1673;
        if (_1705)
        {
            float _1709 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _1707 = _1709;
        }
        float _1711 = _1707;
        float _1713 = _1711;
        if (_1705)
        {
            float _1715 = _415 * _1711;
            _1693 = _1715;
        }
        float _1717 = _1693;
        float _1719 = _1717;
        float _1721 = _1717;
        if (_1705)
        {
            float _1723 = _417 * _1711;
            _1695 = _1723;
        }
        float _1725 = _1695;
        float _1727 = _1725;
        if (_1705)
        {
            float _1729 = _419 * _1711;
            _1713 = _1729;
        }
        float _1731 = _1713;
        float _1733 = _1731;
        if (!_1705)
        {
            float _1735 = _123 + 1.0;
            float _1737 = _1735;
            if (!_1197)
            {
                float _1739 = _1735 * _1735;
                float _1741 = _1739 * 0.5;
                _1719 = _1741;
            }
            float _1743 = _1719;
            float _1745 = _1743;
            if (!_1197)
            {
                float _1747 = _1743 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _1745 = _1747;
            }
            float _1749 = _1745;
            bool _1751 = !_1197;
            float _1753 = _1749;
            if (!_1751)
            {
                float _1755 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1757 = log2(_1755);
                float _1759 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _1761 = _1759 + 1.0;
                float _1763 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1765 = _1757 * _1735;
                float _1767 = 1.0 / _1761;
                float _1769 = _1763 * 0.693147182464599609375;
                float _1771 = exp2(_1765);
                float _1773 = 1.0 / _1769;
                float _1775 = _1771 + (-1.0);
                float _1777 = -_1775;
                float _1779 = fma(_1777, _1773, _1735);
                float _1781 = _1779 * _1767;
                float _1783 = _1781 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _1753 = _1783;
            }
            float _1785 = _1753;
            float _1787 = _1785 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _1789 = _1785 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            bool _1791 = !_1197;
            if (!_1791)
            {
                float _1793 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1795 = log2(_1793);
                float _1797 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _1799 = _1797 + 1.0;
                float _1801 = 1.0 / _1799;
                float _1803 = _1795 * _1735;
                float _1805 = exp2(_1803);
                float _1807 = -_1805;
                float _1809 = _1807 + 1.0;
                float _1811 = _1809 * _1801;
                _1737 = _1811;
            }
            float _1813 = _1737;
            float _1815 = fma(_1813, _161, _1789);
            float _1817 = _1785 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _1819 = fma(_1813, _159, _1787);
            float _1821 = -_377;
            float _1823 = _1821 + _1815;
            float _1825 = fma(_1813, _163, _1817);
            float _1827 = -_379;
            float _1829 = _1827 + _1819;
            float _1831 = _1823 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _1833 = _1823 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _1835 = _1823 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _1837 = -_383;
            float _1839 = _1837 + _1825;
            float _1841 = fma(_1829, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1831);
            float _1843 = fma(_1829, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1833);
            float _1845 = fma(_1829, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1835);
            float _1847 = fma(_1839, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1841);
            float _1849 = fma(_1839, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1843);
            float _1851 = fma(_1839, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1845);
            _423 = _1849;
            _425 = _1847;
            _427 = _1851;
            _1721 = _1847;
            _1727 = _1849;
            _1733 = _1851;
        }
        float _1853 = _423;
        float _1855 = _425;
        float _1857 = _427;
        float _1859 = _1721;
        float _1861 = _1727;
        float _1863 = _1733;
        float _1865 = _1853 * _1853;
        float _1867 = fma(_1855, _1855, _1865);
        float _1869 = fma(_1857, _1857, _1867);
        float _1871 = rsqrt(_1645);
        float _1873 = sqrt(_1869);
        float _1875 = _1623 * _1871;
        float _1877 = _1609 * _1871;
        float _1879 = _1637 * _1871;
        bool _1881 = _1873 > 0.0;
        bool _1883 = !_1881;
        _1703 = _1861;
        if (!_1883)
        {
            float _1885 = rsqrt(_1869);
            float _1887 = _1885 * _1853;
            float _1889 = _1885 * _1855;
            float _1891 = _1885 * _1857;
            float _1893 = _1877 * _1887;
            float _1895 = fma(_1875, _1889, _1893);
            float _1897 = fma(_1879, _1891, _1895);
            float _1899 = _1897 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1901 = fma(_1859, _1899, _1587);
            float _1903 = fma(_1861, _1899, _1585);
            float _1905 = fma(_1863, _1899, _1589);
            _1697 = _1903;
            _1699 = _1901;
            _1701 = _1905;
        }
    }
    float _1907 = _1697;
    float _1909 = _1699;
    float _1911 = _1701;
    float _1913 = _1703;
    float _1915 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1917 = _1907 + _1915;
    float _1919 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1921 = _1909 + _1919;
    float _1923 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1925 = _1911 + _1923;
    float _1927 = _1917 * _1917;
    float _1929 = fma(_1921, _1921, _1927);
    float _1931 = fma(_1925, _1925, _1929);
    float _1933 = rsqrt(_1931);
    float _1935 = sqrt(_1931);
    float _1937 = _1933 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1939 = _1921 * _1937;
    float _1941 = _1925 * _1937;
    float _1943 = _1939 * _1939;
    float _1945 = _1941 * _1941;
    float _1947 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1949 = fma(_1935, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1947);
    float _1951 = precise::clamp(_1949, 0.0, 1.0);
    float _1953 = _1943 + _1945;
    float _1955 = -_1951;
    float _1957 = _1955 + 1.0;
    float _1959 = sqrt(_1953);
    float _1961 = abs(_1957);
    float _1963 = log2(_1961);
    bool _1965 = _1959 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1967 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1969 = _1959 + _1967;
    float _1971 = _1913;
    float _1973 = _1953;
    float _1975 = _1969;
    float _1977 = _1917;
    float _1979 = _1939;
    if (_1965)
    {
        float _1981 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1971 = _1981;
    }
    float _1983 = _1971;
    if (_1965)
    {
        float _1985 = rsqrt(_1953);
        _1973 = _1985;
    }
    float _1987 = _1973;
    float _1989 = _1983;
    if (_1965)
    {
        float _1991 = _1969 * _1983;
        _1975 = _1991;
    }
    float _1993 = _1975;
    if (_1965)
    {
        float _1995 = _1993 * 0.15915493667125701904296875;
        _1989 = _1995;
    }
    float _1997 = _1989;
    float _1999 = _1933;
    float _2001 = _1997;
    if (_1965)
    {
        float _2003 = _1997 * 6.283185482025146484375;
        float _2005 = sin(_2003);
        _1999 = _2005;
    }
    float _2007 = _1999;
    float _2009 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2011 = precise::max(0.0, _2009);
    float _2013 = _1925;
    float _2015 = _2011;
    if (_1965)
    {
        float _2017 = _1997 * 6.283185482025146484375;
        float _2019 = cos(_2017);
        _2013 = _2019;
    }
    float _2021 = _2013;
    float _2023 = -_1937;
    float _2025 = -_2011;
    float _2027 = fma(_1917, _2023, _2025);
    if (_1965)
    {
        float _2029 = _2027 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1977 = _2029;
    }
    float _2031 = _1977;
    float _2033 = _2031;
    float _2035 = _2007;
    if (_1965)
    {
        float _2037 = fma(_2007, _2031, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2033 = _2037;
    }
    float _2039 = _2033;
    float _2041 = _2039;
    float _2043 = _2021;
    if (_1965)
    {
        float _2045 = _2021 + (-1.0);
        _2015 = _2045;
    }
    float _2047 = _2015;
    float _2049 = _2047;
    if (_1965)
    {
        float _2051 = _1987 * _2039;
        _2035 = _2051;
    }
    float _2053 = _2035;
    float _2055 = _2053;
    if (!_1965)
    {
        _2041 = _2027;
    }
    float _2057 = _2041;
    float _2059 = _1907 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2061 = _2057;
    if (_1965)
    {
        float _2063 = _2047 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2001 = _2063;
    }
    float _2065 = _2001;
    if (_1965)
    {
        float _2067 = _1939 * _2053;
        _1979 = _2067;
    }
    float _2069 = _1979;
    if (!_1965)
    {
        _2049 = _1941;
    }
    float _2071 = _2049;
    float _2073 = _2071;
    if (_1965)
    {
        float _2075 = _1941 * _2053;
        _2073 = _2075;
    }
    float _2077 = _2073;
    if (_1965)
    {
        float _2079 = fma(_2027, _2021, _2065);
        _2061 = _2079;
    }
    float _2081 = _2061;
    if (!_1965)
    {
        _2043 = _1943;
    }
    float _2083 = _2043;
    float _2085 = _2083;
    if (_1965)
    {
        float _2087 = _2069 * _2069;
        _2085 = _2087;
    }
    float _2089 = _2085;
    float _2091 = _1907 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (!_1965)
    {
        _2055 = _1945;
    }
    float _2093 = _2055;
    float _2095 = _2093;
    if (_1965)
    {
        float _2097 = _2077 * _2077;
        _2095 = _2097;
    }
    float _2099 = _2095;
    float _2101 = fma(_2081, _2081, _2089);
    float _2103 = _1907 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2105 = fma(_1909, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2091);
    float _2107 = fma(_1909, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2059);
    float _2109 = _2101 + _2099;
    float _2111 = fma(_1909, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2103);
    float _2113 = fma(_1911, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2105);
    float _2115 = _1907 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2117 = fma(_1911, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2107);
    float _2119 = fma(_1911, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2111);
    float _2121 = rsqrt(_2109);
    float _2123 = _2113 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2125 = _2119 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2127 = fma(_1909, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2115);
    float _2129 = _2117 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2131 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2133 = _2125 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2135 = _2123 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2137 = fma(_1911, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2127);
    float _2139 = fma(_2129, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2133);
    float _2141 = -_2135;
    float _2143 = fma(_2141, _2131, 1.0);
    float _2145 = _2137 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2147 = fma(_2123, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2139);
    float _2149 = _2121 * _2069;
    float _2151 = _2121 * _2077;
    float _2153 = log2(_2143);
    float _2155 = fma(_2145, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2147);
    float _2157 = _2121 * _2081;
    float _2159 = _2149 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2161 = _1963 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2163 = _2125 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2165 = -_2159;
    float _2167 = fma(_2157, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2165);
    float _2169 = exp2(_2161);
    float _2171 = fma(_2129, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2163);
    float _2173 = -_2151;
    float _2175 = fma(_2173, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2167);
    float _2177 = _2125 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2179 = fma(_2123, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2171);
    float _2181 = fma(_2175, -0.5, 0.5);
    float _2183 = 1.0 / _2155;
    float _2185 = fma(_2175, 0.5, 0.5);
    float _2187 = fma(_2129, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2177);
    float _2189 = _2157 + 1.0;
    float _2191 = fma(_2145, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2179);
    float _2193 = fma(_2185, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2195 = fma(_2123, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2187);
    float _2197 = _2153 * 0.693147182464599609375;
    float _2199 = sqrt(_2181);
    float _2201 = fma(_2185, _2193, -0.212114393711090087890625);
    float _2203 = fma(_2145, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2195);
    float _2205 = -_2157;
    float _2207 = fma(_2169, _2189, _2205);
    float _2209 = _2197 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2211 = fma(_2185, _2201, 1.570728778839111328125);
    float _2213 = fma(_2207, 0.5, 0.5);
    float _2215 = _2191 * _2183;
    float _2217 = _2203 * _2183;
    float _2219 = fma(_2215, 0.5, 0.5);
    float _2221 = fma(_2217, -0.5, 0.5);
    float _2223 = _2199 * 0.636619746685028076171875;
    float _2225 = -_2211;
    float _2227 = fma(_2223, _2225, 1.0);
    float3 _5923 = float3(_2219, _2221, _2209);
    float _2229 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5923, float3(0.0), isnan(_5923)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5923, float3(0.0), isnan(_5923)), level(0.0)).x;
    float3 _5934 = float3(_2219, _2221, _2209);
    float4 _2232 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5934, float3(0.0), isnan(_5934)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5934, float3(0.0), isnan(_5934)), level(0.0)).xyzw;
    float _2234 = _2232.x;
    float _2236 = _2232.y;
    float _2238 = _2232.z;
    float _2240 = _2232.w;
    float2 _5951 = float2(_2227, _2213);
    float3 _2244 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5951, float2(0.0), isnan(_5951)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5951, float2(0.0), isnan(_5951)), level(0.0)).xyz;
    float _2246 = _2244.x;
    float _2248 = _2244.y;
    float _2250 = _2244.z;
    float _2252 = _1505 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2254 = _1963 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _2256 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2258 = isnan(0.5);
    bool _2260 = _2256 || _2258;
    bool _2262 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2264 = _2260 || _2262;
    float _2266 = fma(_1267, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2252);
    float _2268 = fma(_1257, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2266);
    float _2270 = _1505 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2272 = _2268 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2274 = fma(_1267, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2270);
    float _2276 = 1.0 / _2272;
    float _2278 = fma(_1257, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2274);
    float _2280 = _2278 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2282 = _2280 + _2272;
    float _2284 = _2282 * _2276;
    float _2286 = _2284 * 0.5;
    float _2288 = exp2(_2254);
    float _2290 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2292 = fma(_2286, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2290);
    float _2294 = _2125 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2296 = fma(_2129, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2294);
    float _2298 = 1.0 / _2292;
    float _2300 = fma(_2123, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2296);
    float _2302 = _2296;
    float _2304 = _2123;
    if (_2264)
    {
        _2302 = 1.0;
    }
    float _2306 = _2302;
    float _2308 = _2306;
    if (_2264)
    {
        _2304 = 1.0;
    }
    float _2310 = _2304;
    float _2312 = fma(_2145, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2300);
    float _2314 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2316 = _2298 * _2314;
    float _2318 = _2310;
    if (!_2264)
    {
        float _2320 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2322 = _2320 * 0.15915493667125701904296875;
        float _2324 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2326 = _2322 * 6.283185482025146484375;
        float _2328 = cos(_2326);
        float _2330 = _2324 * 0.15915493667125701904296875;
        float _2332 = _2322 * 6.283185482025146484375;
        float _2334 = sin(_2332);
        float _2336 = 1.0 / _2328;
        float _2338 = _2330 * 6.283185482025146484375;
        float _2340 = cos(_2338);
        float _2342 = _2334 * _2336;
        float _2344 = _2330 * 6.283185482025146484375;
        float _2346 = sin(_2344);
        float _2348 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2350 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2348;
        float _2352 = _2340 * _2342;
        float _2354 = 1.0 / _2350;
        float _2356 = 1.0 / _2352;
        float _2358 = _2346 * _2356;
        float _2360 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2362 = fma(_2316, _2358, _2360);
        float _2364 = _2362 * _2354;
        float _2366 = precise::clamp(_2364, 0.0, 1.0);
        _2308 = _2366;
    }
    float _2368 = _2308;
    if (!_2264)
    {
        float _2370 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2372 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2374 = _2370 * 0.15915493667125701904296875;
        float _2376 = _2372 * 0.15915493667125701904296875;
        float _2378 = _2374 * 6.283185482025146484375;
        float _2380 = cos(_2378);
        float _2382 = _2374 * 6.283185482025146484375;
        float _2384 = sin(_2382);
        float _2386 = 1.0 / _2380;
        float _2388 = _2376 * 6.283185482025146484375;
        float _2390 = cos(_2388);
        float _2392 = _2384 * _2386;
        float _2394 = _2376 * 6.283185482025146484375;
        float _2396 = sin(_2394);
        float _2398 = _2390 * _2392;
        float _2400 = 1.0 / _2398;
        float _2402 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2404 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2402;
        float _2406 = 1.0 / _2404;
        float _2408 = _2396 * _2400;
        float _2410 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2412 = fma(_2316, _2408, _2410);
        float _2414 = _2412 * _2406;
        float _2416 = precise::clamp(_2414, 0.0, 1.0);
        float _2418 = -_2416;
        float _2420 = _2418 + 1.0;
        _2318 = _2420;
    }
    float _2422 = _2318;
    float _2424 = _2368 * _2422;
    float _2426 = -_2288;
    float _2428 = _2426 + 1.0;
    bool _2430 = _2368 > 0.0;
    bool _2432 = isnan(_2368);
    bool _2434 = _2430 || _2432;
    bool _2436 = isnan(0.0);
    bool _2438 = _2434 || _2436;
    float _2440 = _2312 + _2155;
    float _2442 = _2424 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2444 = _2428 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    bool _2446 = _2422 <= 0.0;
    bool _2448 = !_2438;
    bool _2450 = _2446 || _2448;
    float _2452 = _2440 * 0.5;
    float _2454 = _2444 * _2229;
    float _2456 = -_2444;
    float _2458 = _2456 + 1.0;
    out.gl_Position.x = _2191;
    out.gl_Position.y = _2203;
    out.gl_Position.z = _2312;
    out.gl_Position.w = _2155;
    float _2460 = _2442 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2462 = _2240 * _2454;
    float _2464 = _2250 * _2454;
    out.m_68.z = _2452;
    out.m_68.w = _2155;
    float _2466 = fma(_2246, _2462, _2234);
    float _2468 = fma(_2248, _2462, _2236);
    float _2470 = _2240 * _2458;
    float _2472 = fma(_2240, _2464, _2238);
    out.m_45.x = _2460;
    out.m_70.x = _2466;
    out.m_70.y = _2468;
    out.m_70.z = _2472;
    out.m_70.w = _2470;
    if (!_2450)
    {
        return out;
    }
    out.m_45.x = 0.0;
    float _2474 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2474;
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
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    bool _611 = false;
    bool _447 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _84 = in.m_42.w;
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
        out.m_45.x = 0.0;
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
        float _2531 = as_type<float>(_105);
        out.gl_Position.z = _2531;
    }
    if (!_93)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _109 = in.m_47.w;
    bool _111 = _109 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _113 = isnan(_109);
    bool _115 = _111 || _113;
    bool _117 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _119 = _115 || _117;
    float _121 = -_109;
    float _123 = _121 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _125 = 0.0;
    if (_119)
    {
        float _127 = float(_89);
        _125 = _127;
    }
    float _129 = _125;
    bool _131 = _123 >= _129;
    bool _133 = !_119;
    bool _135 = _131 || _133;
    if (_135)
    {
        _99 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _137 = _99;
    if (_135)
    {
        out.m_45.x = 0.0;
    }
    if (_135)
    {
        float _139 = _137 * 5.0;
        _107 = as_type<int>(_139);
    }
    int _141 = _107;
    if (_135)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2599 = as_type<float>(_141);
        out.gl_Position.z = _2599;
    }
    if (_135)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _143 = as_type<float>(int(gl_VertexIndex));
    float _145 = _123 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _147 = in.m_52.w;
    bool _149 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _151 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _153 = _149 || _151;
    bool _155 = isnan(1.0);
    bool _157 = _153 || _155;
    float _159 = in.m_47.x;
    float _161 = in.m_47.y;
    float _163 = in.m_47.z;
    float _165 = in.m_42.x;
    float _167 = in.m_42.y;
    float _169 = in.m_42.z;
    float _171 = 0.0;
    float _173 = _145;
    if (!_157)
    {
        float _175 = _145 * _145;
        float _177 = _175 * 0.5;
        _171 = _177;
    }
    float _179 = _171;
    float _181 = _179;
    if (!_157)
    {
        float _183 = _179 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _181 = _183;
    }
    float _185 = _181;
    int _187 = as_type<int>(_143) & 1;
    bool _189 = _187 != 0;
    int _191 = as_type<int>(_143) & 2;
    bool _193 = _191 != 0;
    bool _195 = !_189;
    float _197 = _195 ? (-0.5) : 0.5;
    bool _199 = !_193;
    float _201 = _199 ? (-0.5) : 0.5;
    bool _203 = !_157;
    float _205 = _185;
    float _207 = 0.0;
    float _209 = 0.0;
    bool _211 = false;
    bool _213 = _193;
    if (!_203)
    {
        float _215 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _217 = log2(_215);
        float _219 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _221 = _219 + 1.0;
        float _223 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _225 = _145 * _217;
        float _227 = 1.0 / _221;
        float _229 = _223 * 0.693147182464599609375;
        float _231 = exp2(_225);
        float _233 = 1.0 / _229;
        float _235 = _231 + (-1.0);
        float _237 = -_235;
        float _239 = fma(_237, _233, _145);
        float _241 = _239 * _227;
        float _243 = _241 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _205 = _243;
        _207 = _227;
        _209 = _231;
    }
    float _245 = _205;
    float _247 = _207;
    float _249 = _209;
    bool _251 = !_157;
    float _253 = _249;
    float _255 = _247;
    float _257 = _245;
    if (!_251)
    {
        float _259 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _261 = log2(_259);
        float _263 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _265 = _263 + 1.0;
        float _267 = 1.0 / _265;
        float _269 = _145 * _261;
        float _271 = exp2(_269);
        float _273 = -_271;
        float _275 = _273 + 1.0;
        float _277 = _275 * _267;
        _173 = _277;
        _253 = _265;
    }
    float _279 = _173;
    float _281 = _253;
    float _283 = _281;
    if (!_157)
    {
        float _285 = _123 * _123;
        float _287 = _285 * 0.5;
        _255 = _287;
    }
    float _289 = _255;
    float _291 = _245 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _293 = _245 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _295 = _245 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    if (!_157)
    {
        _283 = _123;
    }
    float _297 = _283;
    float _299 = fma(_279, _159, _291);
    float _301 = fma(_279, _161, _293);
    float _303 = _297;
    if (!_157)
    {
        float _305 = _289 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _257 = _305;
    }
    float _307 = _257;
    bool _309 = !_157;
    float _311 = _307;
    if (!_309)
    {
        float _313 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _315 = log2(_313);
        float _317 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _319 = _317 + 1.0;
        float _321 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _323 = _123 * _315;
        float _325 = 1.0 / _319;
        float _327 = _321 * 0.693147182464599609375;
        float _329 = exp2(_323);
        float _331 = 1.0 / _327;
        float _333 = _329 + (-1.0);
        float _335 = -_333;
        float _337 = fma(_335, _331, _123);
        float _339 = _337 * _325;
        float _341 = _339 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _311 = _341;
    }
    float _343 = _311;
    bool _345 = !_157;
    if (!_345)
    {
        float _347 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _349 = log2(_347);
        float _351 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _353 = _351 + 1.0;
        float _355 = 1.0 / _353;
        float _357 = _123 * _349;
        float _359 = exp2(_357);
        float _361 = -_359;
        float _363 = _361 + 1.0;
        float _365 = _363 * _355;
        _303 = _365;
    }
    float _367 = _303;
    float _369 = _343 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _371 = _343 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    bool _373 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _375 = _343 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _377 = fma(_367, _161, _369);
    float _379 = fma(_367, _159, _371);
    float _381 = fma(_279, _163, _295);
    float _383 = fma(_367, _163, _375);
    float _385 = -_377;
    float _387 = _301 + _385;
    float _389 = fma(_299, _147, _165);
    float _391 = -_379;
    float _393 = _299 + _391;
    float _395 = -_383;
    float _397 = _381 + _395;
    float _399 = _387 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _401 = _387 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _403 = _387 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _405 = fma(_301, _147, _167);
    float _407 = fma(_393, (*spvDescriptorSet0.vp_c10)._m0[4].x, _399);
    float _409 = fma(_393, (*spvDescriptorSet0.vp_c10)._m0[5].x, _401);
    float _411 = fma(_393, (*spvDescriptorSet0.vp_c10)._m0[6].x, _403);
    float _413 = fma(_381, _147, _169);
    float _415 = fma(_397, (*spvDescriptorSet0.vp_c10)._m0[4].z, _407);
    float _417 = fma(_397, (*spvDescriptorSet0.vp_c10)._m0[5].z, _409);
    float _419 = fma(_397, (*spvDescriptorSet0.vp_c10)._m0[6].z, _411);
    bool _421 = !_373;
    float _423 = _417;
    float _425 = _415;
    float _427 = _419;
    float _445;
    if (!_421)
    {
        float _429 = in.m_54.x;
        float _431 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _433 = _429 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _435 = fma(_433, (*spvDescriptorSet0.vp_c9)._m0[12].x, _123);
        float _437 = _435 * _431;
        float _439 = floor(_437);
        float _441 = -_439;
        float _443 = _437 + _441;
        _445 = _443;
        _447 = true;
    }
    else
    {
        float _449 = float(_89);
        float _451 = 1.0 / _449;
        float _453 = _123 * _451;
        _445 = _453;
    }
    _447 = false;
    float _455 = _445;
    float _457 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _459 = _455 + _457;
    bool _461 = _455 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _463 = isnan(_455);
    bool _465 = _461 || _463;
    bool _467 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _469 = _465 || _467;
    float _471 = float(_469);
    float _473 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _475 = _455 + _473;
    bool _477 = _455 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _479 = isnan(_455);
    bool _481 = _477 || _479;
    bool _483 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _485 = _481 || _483;
    float _487 = float(_485);
    float _489 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _491 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _489;
    float _493 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _495 = _493 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _497 = -_471;
    float _499 = _497 + 1.0;
    float _501 = 1.0 / _495;
    bool _503 = _455 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _505 = isnan(_455);
    bool _507 = _503 || _505;
    bool _509 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _511 = _507 || _509;
    float _513 = float(_511);
    float _515 = _487 * _499;
    float _517 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _519 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _517;
    float _521 = -_487;
    float _523 = _521 + 1.0;
    bool _525 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _527 = 1.0 / _491;
    float _529 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _531 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _529;
    float _533 = _475 * _501;
    float _535 = _513 * _523;
    float _537 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _539 = _537 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _541 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _543 = _541 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _545 = -_513;
    float _547 = _545 + 1.0;
    float _549 = fma(_539, _533, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _551 = fma(_543, _533, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _553 = _459 * _527;
    float _555 = in.m_52.x;
    float _557 = in.m_52.y;
    float _559 = fma(_519, _553, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _561 = fma(_531, _553, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _563 = _559 * _535;
    float _565 = _561 * _535;
    float _567 = fma(_547, (*spvDescriptorSet0.vp_c9)._m0[143].x, _563);
    float _569 = fma(_547, (*spvDescriptorSet0.vp_c9)._m0[143].y, _565);
    float _571 = fma(_551, _515, _567);
    float _573 = fma(_549, _515, _569);
    float _575 = fma(_471, (*spvDescriptorSet0.vp_c9)._m0[145].x, _571);
    float _577 = fma(_471, (*spvDescriptorSet0.vp_c9)._m0[145].y, _573);
    float _579 = _575 * _555;
    float _581 = _577 * _557;
    bool _583 = !_525;
    float _607;
    float _609;
    if (!_583)
    {
        float _585 = in.m_54.x;
        float _587 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _589 = float(_89);
        float _591 = 1.0 / _589;
        float _593 = _585 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _595 = _123 * _591;
        float _597 = fma(_593, (*spvDescriptorSet0.vp_c9)._m0[11].y, _123);
        float _599 = _597 * _587;
        float _601 = floor(_599);
        float _603 = -_601;
        float _605 = _599 + _603;
        _607 = _595;
        _609 = _605;
        _611 = true;
    }
    else
    {
        float _613 = float(_89);
        float _615 = 1.0 / _613;
        float _617 = _123 * _615;
        _607 = _617;
        _609 = _617;
    }
    _611 = false;
    float _619 = _607;
    float _621 = _609;
    float _623 = _405 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _625 = _579 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _627 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _629 = _627 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    int _631 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _633 = _631 != 0;
    float _635 = _405 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _637 = _405 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _639 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _197);
    float _641 = 1.0 / _629;
    float _643 = fma(_389, (*spvDescriptorSet0.vp_c10)._m0[6].x, _637);
    float _645 = fma(_389, (*spvDescriptorSet0.vp_c10)._m0[4].x, _635);
    float _647 = _581 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _649 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _201);
    float _651 = fma(_389, (*spvDescriptorSet0.vp_c10)._m0[5].x, _623);
    float _653 = _625 * _639;
    float _655 = fma(_413, (*spvDescriptorSet0.vp_c10)._m0[4].z, _645);
    float _657 = _647 * _649;
    float _659 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _661 = _659 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _663 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _665 = _663 + (*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _667 = fma(_413, (*spvDescriptorSet0.vp_c10)._m0[5].z, _651);
    float _669 = fma(_413, (*spvDescriptorSet0.vp_c10)._m0[6].z, _643);
    float _671 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _673 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _675 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _677 = 1.0 / _661;
    float _679 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _681 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _679;
    float _683 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _685 = _683 + (*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _687 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _689 = _687 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _691 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _693 = 1.0 / _665;
    float _695 = _671 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _697 = _673 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _699 = _675 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _701 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _703 = _701 + (*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _705 = _689 * _641;
    float _707 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _709 = _707 + (*spvDescriptorSet0.vp_c9)._m0[158].w;
    float _711 = 1.0 / _685;
    float _713 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _715 = _713 + (*spvDescriptorSet0.vp_c9)._m0[154].w;
    out.m_56.x = _695;
    out.m_56.y = _697;
    out.m_56.z = _699;
    out.m_56.w = _691;
    float _717 = -(*spvDescriptorSet0.vp_c9)._m0[151].x;
    float _719 = (*spvDescriptorSet0.vp_c9)._m0[152].x + _717;
    float _721 = _681 * _677;
    float _723 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _725 = _723 + (*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _727 = 1.0 / _703;
    float _729 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _731 = _729 + (*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _733 = _657 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _735 = _619 >= (*spvDescriptorSet0.vp_c9)._m0[152].w;
    bool _737 = isnan(_619);
    bool _739 = _735 || _737;
    bool _741 = isnan((*spvDescriptorSet0.vp_c9)._m0[152].w);
    bool _743 = _739 || _741;
    float _745 = float(_743);
    float _747 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _749 = _619 + _747;
    int _751 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _753 = _751 != 0;
    float _755 = 1.0 / _715;
    float _757 = -(*spvDescriptorSet0.vp_c9)._m0[152].x;
    float _759 = _757 + (*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _761 = fma(_653, (*spvDescriptorSet0.vp_c8)._m0[24].x, _733);
    float _763 = _759 * _693;
    int _765 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _767 = _765 != 0;
    float _769 = -(*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _771 = (*spvDescriptorSet0.vp_c9)._m0[156].x + _769;
    float _773 = 1.0 / _709;
    float _775 = -(*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _777 = (*spvDescriptorSet0.vp_c9)._m0[154].x + _775;
    float _779 = -(*spvDescriptorSet0.vp_c9)._m0[154].x;
    float _781 = _779 + (*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _783 = _771 * _711;
    float _785 = -(*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _787 = (*spvDescriptorSet0.vp_c9)._m0[158].x + _785;
    float _789 = _657 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _791 = _781 * _727;
    float _793 = _657 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _795 = 1.0 / _725;
    float _797 = -(*spvDescriptorSet0.vp_c9)._m0[156].x;
    float _799 = _797 + (*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _801 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _803 = _621 + _801;
    float _805 = _777 * _755;
    float _807 = fma(_653, (*spvDescriptorSet0.vp_c8)._m0[25].x, _793);
    float _809 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _811 = _621 + _809;
    float _813 = fma(_653, (*spvDescriptorSet0.vp_c8)._m0[26].x, _789);
    float _815 = fma(_721, _803, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _817 = 1.0 / _731;
    float _819 = _787 * _773;
    float _821 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _823 = _619 + _821;
    float _825 = in.m_54.w;
    float _827 = fma(_705, _811, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _829 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _831 = _619 + _829;
    float _833 = fma(_805, _823, (*spvDescriptorSet0.vp_c9)._m0[153].x);
    bool _835 = _619 >= (*spvDescriptorSet0.vp_c9)._m0[158].w;
    bool _837 = isnan(_619);
    bool _839 = _835 || _837;
    bool _841 = isnan((*spvDescriptorSet0.vp_c9)._m0[158].w);
    bool _843 = _839 || _841;
    float _845 = float(_843);
    float _847 = _799 * _795;
    float _849 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _851 = _619 + _849;
    float _853 = _795;
    float _855 = _619;
    if (_753)
    {
        float _857 = in.m_54.x;
        _853 = _857;
    }
    float _859 = _853;
    float _861 = fma(_763, _831, (*spvDescriptorSet0.vp_c9)._m0[152].x);
    bool _863 = _619 >= (*spvDescriptorSet0.vp_c9)._m0[157].w;
    bool _865 = isnan(_619);
    bool _867 = _863 || _865;
    bool _869 = isnan((*spvDescriptorSet0.vp_c9)._m0[157].w);
    bool _871 = _867 || _869;
    float _873 = float(_871);
    float _875 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _877 = _619 + _875;
    float _879 = fma(_847, _851, (*spvDescriptorSet0.vp_c9)._m0[156].x);
    float _881 = -_845;
    float _883 = _881 + 1.0;
    float _885 = _719 * _817;
    bool _887 = _619 >= (*spvDescriptorSet0.vp_c9)._m0[156].w;
    bool _889 = isnan(_619);
    bool _891 = _887 || _889;
    bool _893 = isnan((*spvDescriptorSet0.vp_c9)._m0[156].w);
    bool _895 = _891 || _893;
    float _897 = float(_895);
    float _899 = -_873;
    float _901 = _899 + 1.0;
    float _903 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _905 = _619 + _903;
    float _907 = fma(_885, _877, (*spvDescriptorSet0.vp_c9)._m0[151].x);
    float _909 = _873 * _883;
    bool _911 = _619 >= (*spvDescriptorSet0.vp_c9)._m0[155].w;
    bool _913 = isnan(_619);
    bool _915 = _911 || _913;
    bool _917 = isnan((*spvDescriptorSet0.vp_c9)._m0[155].w);
    bool _919 = _915 || _917;
    float _921 = float(_919);
    float _923 = -_897;
    float _925 = _923 + 1.0;
    float _927 = _897 * _901;
    bool _929 = _619 >= (*spvDescriptorSet0.vp_c9)._m0[154].w;
    bool _931 = isnan(_619);
    bool _933 = _929 || _931;
    bool _935 = isnan((*spvDescriptorSet0.vp_c9)._m0[154].w);
    bool _937 = _933 || _935;
    float _939 = float(_937);
    float _941 = fma(_791, _905, (*spvDescriptorSet0.vp_c9)._m0[154].x);
    float _943 = _883;
    float _945 = _901;
    float _947 = _825;
    if (_767)
    {
        float _949 = _825 * 3.1415927410125732421875;
        _943 = _949;
    }
    float _951 = _943;
    float _953 = _921 * _925;
    float _955 = -_921;
    float _957 = _955 + 1.0;
    bool _959 = _621 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _961 = isnan(_621);
    bool _963 = _959 || _961;
    bool _965 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _967 = _963 || _965;
    float _969 = float(_967);
    float _971 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _973 = _619 + _971;
    bool _975 = _619 >= (*spvDescriptorSet0.vp_c9)._m0[153].w;
    bool _977 = isnan(_619);
    bool _979 = _975 || _977;
    bool _981 = isnan((*spvDescriptorSet0.vp_c9)._m0[153].w);
    bool _983 = _979 || _981;
    float _985 = float(_983);
    if (_767)
    {
        float _987 = _951 * 0.15915493667125701904296875;
        _945 = _987;
    }
    float _989 = _945;
    float _991 = -_939;
    float _993 = _991 + 1.0;
    bool _995 = _825 > 0.5;
    if (_753)
    {
        float _997 = _859 * 3.1415927410125732421875;
        _947 = _997;
    }
    float _999 = _947;
    bool _1001 = _621 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1003 = isnan(_621);
    bool _1005 = _1001 || _1003;
    bool _1007 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1009 = _1005 || _1007;
    float _1011 = float(_1009);
    float _1013 = fma(_783, _973, (*spvDescriptorSet0.vp_c9)._m0[155].x);
    float _1015 = -_969;
    float _1017 = _1015 + 1.0;
    float _1019 = -_985;
    float _1021 = _1019 + 1.0;
    bool _1023 = _621 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1025 = isnan(_621);
    bool _1027 = _1023 || _1025;
    bool _1029 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1031 = _1027 || _1029;
    float _1033 = float(_1031);
    float _1035 = _939 * _957;
    float _1037 = _985 * _993;
    bool _1039 = _619 >= (*spvDescriptorSet0.vp_c9)._m0[151].w;
    bool _1041 = isnan(_619);
    bool _1043 = _1039 || _1041;
    bool _1045 = isnan((*spvDescriptorSet0.vp_c9)._m0[151].w);
    bool _1047 = _1043 || _1045;
    float _1049 = float(_1047);
    float _1051 = _985;
    float _1053 = _939;
    if (_633)
    {
        float _1055 = in.m_54.x;
        float _1057 = in.m_54.y;
        _1051 = _1055;
        _1053 = _1057;
    }
    float _1059 = _1051;
    float _1061 = _1053;
    if (_753)
    {
        float _1063 = _999 * 0.15915493667125701904296875;
        _855 = _1063;
    }
    float _1065 = _855;
    float _1067 = _1011 * _1017;
    float _1069 = -_1011;
    float _1071 = _1069 + 1.0;
    float _1073 = _745 * _1021;
    float _1075 = _989;
    if (_767)
    {
        float _1077 = _989 * 6.283185482025146484375;
        float _1079 = sin(_1077);
        _1075 = _1079;
    }
    float _1081 = _1075;
    float _1083 = in.m_54.z;
    float _1085 = fma(_819, _749, (*spvDescriptorSet0.vp_c9)._m0[157].x);
    float _1087 = -_745;
    float _1089 = _1087 + 1.0;
    float _1091 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1093 = _1033 * _1071;
    int _1095 = int(_767);
    int _1097 = _193 ? 2 : 0;
    int _1099 = _1095 | _1097;
    int _1101 = _995 ? 4 : 0;
    int _1103 = _1099 | _1101;
    int _1105 = _157 ? 8 : 0;
    int _1107 = _1103 | _1105;
    int _1109 = _753 ? 16 : 0;
    int _1111 = _1107 | _1109;
    int _1113 = false ? 32 : 0;
    int _1115 = _1111 | _1113;
    int _1117 = _633 ? 64 : 0;
    int _1119 = _1115 | _1117;
    int _1121 = _1119 & 8;
    float _1123 = _1049 * _1089;
    float _1125 = _1065;
    float _1127 = _1089;
    float _1129 = _1123;
    if (_753)
    {
        float _1131 = _1065 * 6.283185482025146484375;
        float _1133 = sin(_1131);
        _1125 = _1133;
    }
    float _1135 = _1125;
    float _1137 = fma(_1091, (*spvDescriptorSet0.vp_c8)._m0[24].z, _761);
    float _1139 = fma(_1091, (*spvDescriptorSet0.vp_c8)._m0[25].z, _807);
    float _1141 = fma(_1091, (*spvDescriptorSet0.vp_c8)._m0[26].z, _813);
    float _1143 = _815 * _1093;
    float _1145 = _907 * _1123;
    float _1147 = -_201;
    int _1149 = _995 ? as_type<int>(_1147) : as_type<int>(_201);
    float _1151 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1153 = _1081;
    if (_767)
    {
        bool _1155 = _1081 > 0.5;
        _211 = _1155;
    }
    bool _1157 = _211;
    float _1159 = -_1033;
    float _1161 = _1159 + 1.0;
    int _1163 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1165 = _1163 != 0;
    if (!_767)
    {
        _1153 = _197;
    }
    float _1167 = _1153;
    float _1169 = _1135;
    float _1171 = _1167;
    if (_753)
    {
        bool _1173 = _1135 > 0.5;
        _213 = _1173;
    }
    bool _1175 = _213;
    if (!_753)
    {
        _1169 = _201;
    }
    float _1177 = _1169;
    int _1179 = 0;
    float _1181 = _1177;
    if (_633)
    {
        _1179 = 0;
    }
    int _1183 = _1179;
    float _1185 = _1061;
    float _1187 = _1059;
    int _1189 = _1183;
    if (_633)
    {
        _1127 = _1059;
    }
    float _1191 = _1127;
    float _1193 = _1191;
    if (_633)
    {
        _1129 = _1061;
    }
    float _1195 = _1129;
    bool _1197 = _1121 != 0;
    float _1199 = _1195;
    if (!_633)
    {
        float _1201 = in.m_54.x;
        float _1203 = in.m_54.y;
        float _1205 = _1201 * 3.1415927410125732421875;
        float _1207 = _1205 * 0.15915493667125701904296875;
        float _1209 = _1203 * 3.1415927410125732421875;
        float _1211 = _1209 * 0.15915493667125701904296875;
        float _1213 = _1207 * 6.283185482025146484375;
        float _1215 = sin(_1213);
        float _1217 = _1211 * 6.283185482025146484375;
        float _1219 = sin(_1217);
        _1185 = _1203;
        _1187 = _1201;
        _1189 = 2;
        _1193 = _1215;
        _1199 = _1219;
    }
    float _1221 = _1185;
    float _1223 = _1187;
    int _1225 = _1189;
    float _1227 = _1193;
    float _1229 = _1199;
    if (_767)
    {
        float _1231 = -_197;
        float _1233 = _1157 ? _1231 : _197;
        _1171 = _1233;
    }
    float _1235 = _1171;
    float _1237 = -_1049;
    float _1239 = _1237 + 1.0;
    bool _1241 = _1221 > 0.5;
    float _1243 = fma(_1161, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1143);
    if (_753)
    {
        float _1245 = -_201;
        float _1247 = _1175 ? _1245 : _201;
        _1181 = _1247;
    }
    float _1249 = _1181;
    float _1251 = fma(_1239, (*spvDescriptorSet0.vp_c9)._m0[151].x, _1145);
    int _1253 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1255 = _1253 != 0;
    float _1257 = _669 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _1259 = _1223 > 0.5;
    float _1261 = fma(_861, _1073, _1251);
    float _1263 = -_201;
    int _1265 = _1241 ? as_type<int>(_1263) : as_type<int>(_201);
    float _1267 = _655 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _1269 = _1083 > 0.5;
    float _1271 = fma(_833, _1037, _1261);
    bool _1273 = !_1165;
    float _1275 = _1273 ? _201 : as_type<float>(_1149);
    float _1277 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    float _1279 = -_197;
    int _1281 = _1259 ? as_type<int>(_1279) : as_type<int>(_197);
    float _1283 = _1249 + (-0.5);
    bool _1285 = !_1255;
    float _1287 = _1285 ? _201 : as_type<float>(_1265);
    float _1289 = _1151 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _1291 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1293 = _1291 != 0;
    int _1295 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1297 = _1295 != 0;
    int _1299 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1301 = _1299 != 0;
    float _1303 = _1139 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1305 = -_201;
    int _1307 = _1269 ? as_type<int>(_1305) : as_type<int>(_201);
    float _1309 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _1311 = !_1301;
    float _1313 = _1311 ? _201 : as_type<float>(_1307);
    float _1315 = fma(_827, _1067, _1243);
    bool _1317 = _1225 != 2;
    float _1319 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    float _1321 = _1227 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    float _1323 = fma(_1229, (*spvDescriptorSet0.vp_c9)._m0[93].w, _1319);
    float _1325 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    float _1327 = _1229 * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    float _1329 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    float _1331 = fma(_1227, (*spvDescriptorSet0.vp_c9)._m0[93].z, _1325);
    float _1333 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1335 = fma(_1327, -2.0, _1329);
    float _1337 = _1223 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1339 = _1221 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _1341 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1343 = _1341 != 0;
    float _1345 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1347 = _1327;
    if (_1317)
    {
        _1347 = _1223;
    }
    float _1349 = _1347;
    float _1351 = fma(_1339, -2.0, _1333);
    float _1353 = _1349;
    if (!_1317)
    {
        _1353 = _1083;
    }
    float _1355 = _1353;
    float _1357 = fma(_969, (*spvDescriptorSet0.vp_c9)._m0[117].x, _1315);
    float _1359 = -_1345;
    float _1361 = fma(_1337, 2.0, _1359);
    float _1363 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    float _1365 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1367 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1369 = -_197;
    int _1371 = _1269 ? as_type<int>(_1369) : as_type<int>(_197);
    float _1373 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1375 = -_197;
    int _1377 = _1241 ? as_type<int>(_1375) : as_type<int>(_197);
    float _1379 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1381 = fma(_1221, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1367);
    bool _1383 = !_1293;
    float _1385 = _1383 ? _197 : as_type<float>(_1371);
    float _1387 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[91].y, _1335);
    bool _1389 = !_1343;
    float _1391 = _1389 ? _197 : as_type<float>(_1281);
    float _1393 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    bool _1395 = !_1297;
    float _1397 = _1395 ? _197 : as_type<float>(_1377);
    float _1399 = fma(_1221, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1365);
    float _1401 = _1141 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1403 = _1367;
    if (_1317)
    {
        _1403 = _1221;
    }
    float _1405 = _1403;
    float _1407 = fma(_1223, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1373);
    float _1409 = fma(_1223, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1379);
    float _1411 = _1405;
    if (!_1317)
    {
        _1411 = _1223;
    }
    float _1413 = _1411;
    float _1415 = _1137 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1417 = _1257 + _1401;
    float _1419 = -_1393;
    float _1421 = fma(_1321, 2.0, _1419);
    float _1423 = _1277 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    float _1425 = _1267 + _1415;
    float _1427 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1429 = _1417 + _1427;
    float _1431 = _1363 * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    float _1433 = -_123;
    float _1435 = fma(_1433, (*spvDescriptorSet0.vp_c9)._m0[91].x, _1421);
    float _1437 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1439 = _1425 + _1437;
    float _1441 = _1429 * _1429;
    float _1443 = fma(_941, _1035, _1271);
    float _1445 = -_1431;
    float _1447 = -_1387;
    float _1449 = fma(_1445, _1283, _1447);
    float _1451 = _1235 + 0.5;
    float _1453 = fma(_1439, _1439, _1441);
    float _1455 = fma(_1013, _953, _1443);
    float _1457 = -_123;
    float _1459 = fma(_1457, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1361);
    float _1461 = _1391 + 0.5;
    float _1463 = sqrt(_1453);
    float _1465 = fma(_1423, _1451, _1435);
    float _1467 = fma(_1289, _1461, _1459);
    float _1469 = _1355 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1471 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1473 = _1413 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1475 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1477 = fma(_879, _927, _1455);
    float _1479 = -_1471;
    float _1481 = fma(_1469, 2.0, _1479);
    float _1483 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1485 = _1309 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1487 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1351);
    float _1489 = _1287 + (-0.5);
    float _1491 = fma(_1473, -2.0, _1483);
    float _1493 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    bool _1495 = _1463 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1497 = fma(_1085, _909, _1477);
    float _1499 = -_1485;
    float _1501 = -_1487;
    float _1503 = fma(_1499, _1489, _1501);
    float _1505 = _667 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1507 = _1397 + 0.5;
    float _1509 = -_123;
    float _1511 = fma(_1509, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1481);
    float _1513 = _1313 + (-0.5);
    float _1515 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1517 = _1475 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1519 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1491);
    float _1521 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[92].z, _1331);
    float _1523 = _1505 + _1303;
    float _1525 = fma(_1517, _1507, _1511);
    float _1527 = -_1521;
    float _1529 = _1527 + 1.0;
    float _1531 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1533 = _1493 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1535 = -_1533;
    float _1537 = -_1519;
    float _1539 = fma(_1535, _1513, _1537);
    bool _1541 = !_1495;
    float _1543 = _1523;
    float _1545 = _1425;
    float _1547 = _1417;
    if (!_1541)
    {
        float _1549 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1551 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1553 = _1463 + _1551;
        float _1555 = _1523 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1557 = rsqrt(_1453);
        float _1559 = _1553 * _1549;
        float _1561 = _1559 * 0.15915493667125701904296875;
        float _1563 = _1561 * 6.283185482025146484375;
        float _1565 = cos(_1563);
        float _1567 = _1561 * 6.283185482025146484375;
        float _1569 = sin(_1567);
        float _1571 = _1565 + (-1.0);
        float _1573 = fma(_1569, _1555, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1575 = _1571 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1577 = _1557 * _1573;
        float _1579 = fma(_1523, _1565, _1575);
        float _1581 = fma(_1439, _1577, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1583 = fma(_1429, _1577, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1543 = _1579;
        _1545 = _1581;
        _1547 = _1583;
    }
    float _1585 = _1543;
    float _1587 = _1545;
    float _1589 = _1547;
    float _1591 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[92].w, _1323);
    float _1593 = -_1275;
    float _1595 = _1593 + 0.5;
    float _1597 = -_1529;
    float _1599 = fma(_1597, _1235, _1465);
    float _1601 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1409);
    float _1603 = -_1591;
    float _1605 = _1603 + 1.0;
    float _1607 = -_1505;
    float _1609 = _1607 + _1585;
    float _1611 = _1595 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1613 = _1385 + 0.5;
    float _1615 = -_1601;
    float _1617 = _1615 + 1.0;
    float _1619 = fma(_1605, _1249, _1449);
    float _1621 = -_1267;
    float _1623 = _1621 + _1587;
    float _1625 = _1609 * _1609;
    float _1627 = _1611 * _1531;
    float _1629 = _1613 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1631 = -_1617;
    float _1633 = fma(_1397, _1631, _1525);
    float _1635 = -_1257;
    float _1637 = _1635 + _1589;
    float _1639 = fma(_1623, _1623, _1625);
    float _1641 = _1629 * _1515;
    float _1643 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1645 = fma(_1637, _1637, _1639);
    float _1647 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1407);
    float _1649 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1381);
    float _1651 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1399);
    float _1653 = sqrt(_1645);
    float _1655 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1657 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1659 = -_1647;
    float _1661 = _1659 + 1.0;
    float _1663 = -_1649;
    float _1665 = _1663 + 1.0;
    float _1667 = -_1651;
    float _1669 = _1667 + 1.0;
    float _1671 = _1655 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1673 = _1657 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1675 = _1643 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1677 = _1357 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1679 = -_1661;
    float _1681 = fma(_1391, _1679, _1467);
    float _1683 = fma(_1287, _1665, _1503);
    float _1685 = fma(_1313, _1669, _1539);
    float _1687 = fma(_845, (*spvDescriptorSet0.vp_c9)._m0[158].x, _1497);
    out.m_58.x = _1671;
    out.m_58.y = _1673;
    out.m_58.z = _1675;
    out.m_58.w = _1677;
    bool _1689 = _1653 > 0.0;
    out.m_60.x = _1599;
    out.m_60.y = _1619;
    out.m_62.x = _1681;
    out.m_62.y = _1683;
    out.m_62.z = _1641;
    out.m_62.w = _1627;
    out.m_64.x = _1633;
    out.m_64.y = _1685;
    out.m_66.x = _1687;
    bool _1691 = !_1689;
    float _1693 = _1671;
    float _1695 = _1677;
    float _1697 = _1585;
    float _1699 = _1587;
    float _1701 = _1589;
    float _1703 = _1677;
    if (!_1691)
    {
        bool _1705 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _1707 = _1673;
        if (_1705)
        {
            float _1709 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _1707 = _1709;
        }
        float _1711 = _1707;
        float _1713 = _1711;
        if (_1705)
        {
            float _1715 = _415 * _1711;
            _1693 = _1715;
        }
        float _1717 = _1693;
        float _1719 = _1717;
        float _1721 = _1717;
        if (_1705)
        {
            float _1723 = _417 * _1711;
            _1695 = _1723;
        }
        float _1725 = _1695;
        float _1727 = _1725;
        if (_1705)
        {
            float _1729 = _419 * _1711;
            _1713 = _1729;
        }
        float _1731 = _1713;
        float _1733 = _1731;
        if (!_1705)
        {
            float _1735 = _123 + 1.0;
            float _1737 = _1735;
            if (!_1197)
            {
                float _1739 = _1735 * _1735;
                float _1741 = _1739 * 0.5;
                _1719 = _1741;
            }
            float _1743 = _1719;
            float _1745 = _1743;
            if (!_1197)
            {
                float _1747 = _1743 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _1745 = _1747;
            }
            float _1749 = _1745;
            bool _1751 = !_1197;
            float _1753 = _1749;
            if (!_1751)
            {
                float _1755 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1757 = log2(_1755);
                float _1759 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _1761 = _1759 + 1.0;
                float _1763 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1765 = _1757 * _1735;
                float _1767 = 1.0 / _1761;
                float _1769 = _1763 * 0.693147182464599609375;
                float _1771 = exp2(_1765);
                float _1773 = 1.0 / _1769;
                float _1775 = _1771 + (-1.0);
                float _1777 = -_1775;
                float _1779 = fma(_1777, _1773, _1735);
                float _1781 = _1779 * _1767;
                float _1783 = _1781 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _1753 = _1783;
            }
            float _1785 = _1753;
            float _1787 = _1785 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _1789 = _1785 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            bool _1791 = !_1197;
            if (!_1791)
            {
                float _1793 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1795 = log2(_1793);
                float _1797 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _1799 = _1797 + 1.0;
                float _1801 = 1.0 / _1799;
                float _1803 = _1795 * _1735;
                float _1805 = exp2(_1803);
                float _1807 = -_1805;
                float _1809 = _1807 + 1.0;
                float _1811 = _1809 * _1801;
                _1737 = _1811;
            }
            float _1813 = _1737;
            float _1815 = fma(_1813, _161, _1789);
            float _1817 = _1785 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _1819 = fma(_1813, _159, _1787);
            float _1821 = -_377;
            float _1823 = _1821 + _1815;
            float _1825 = fma(_1813, _163, _1817);
            float _1827 = -_379;
            float _1829 = _1827 + _1819;
            float _1831 = _1823 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _1833 = _1823 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _1835 = _1823 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _1837 = -_383;
            float _1839 = _1837 + _1825;
            float _1841 = fma(_1829, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1831);
            float _1843 = fma(_1829, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1833);
            float _1845 = fma(_1829, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1835);
            float _1847 = fma(_1839, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1841);
            float _1849 = fma(_1839, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1843);
            float _1851 = fma(_1839, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1845);
            _423 = _1849;
            _425 = _1847;
            _427 = _1851;
            _1721 = _1847;
            _1727 = _1849;
            _1733 = _1851;
        }
        float _1853 = _423;
        float _1855 = _425;
        float _1857 = _427;
        float _1859 = _1721;
        float _1861 = _1727;
        float _1863 = _1733;
        float _1865 = _1853 * _1853;
        float _1867 = fma(_1855, _1855, _1865);
        float _1869 = fma(_1857, _1857, _1867);
        float _1871 = rsqrt(_1645);
        float _1873 = sqrt(_1869);
        float _1875 = _1623 * _1871;
        float _1877 = _1609 * _1871;
        float _1879 = _1637 * _1871;
        bool _1881 = _1873 > 0.0;
        bool _1883 = !_1881;
        _1703 = _1861;
        if (!_1883)
        {
            float _1885 = rsqrt(_1869);
            float _1887 = _1885 * _1853;
            float _1889 = _1885 * _1855;
            float _1891 = _1885 * _1857;
            float _1893 = _1877 * _1887;
            float _1895 = fma(_1875, _1889, _1893);
            float _1897 = fma(_1879, _1891, _1895);
            float _1899 = _1897 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1901 = fma(_1859, _1899, _1587);
            float _1903 = fma(_1861, _1899, _1585);
            float _1905 = fma(_1863, _1899, _1589);
            _1697 = _1903;
            _1699 = _1901;
            _1701 = _1905;
        }
    }
    float _1907 = _1697;
    float _1909 = _1699;
    float _1911 = _1701;
    float _1913 = _1703;
    float _1915 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1917 = _1907 + _1915;
    float _1919 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1921 = _1909 + _1919;
    float _1923 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1925 = _1911 + _1923;
    float _1927 = _1917 * _1917;
    float _1929 = fma(_1921, _1921, _1927);
    float _1931 = fma(_1925, _1925, _1929);
    float _1933 = rsqrt(_1931);
    float _1935 = sqrt(_1931);
    float _1937 = _1933 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1939 = _1921 * _1937;
    float _1941 = _1925 * _1937;
    float _1943 = _1939 * _1939;
    float _1945 = _1941 * _1941;
    float _1947 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1949 = fma(_1935, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1947);
    float _1951 = precise::clamp(_1949, 0.0, 1.0);
    float _1953 = _1943 + _1945;
    float _1955 = -_1951;
    float _1957 = _1955 + 1.0;
    float _1959 = sqrt(_1953);
    float _1961 = abs(_1957);
    float _1963 = log2(_1961);
    bool _1965 = _1959 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1967 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1969 = _1959 + _1967;
    float _1971 = _1913;
    float _1973 = _1953;
    float _1975 = _1969;
    float _1977 = _1917;
    float _1979 = _1939;
    if (_1965)
    {
        float _1981 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1971 = _1981;
    }
    float _1983 = _1971;
    if (_1965)
    {
        float _1985 = rsqrt(_1953);
        _1973 = _1985;
    }
    float _1987 = _1973;
    float _1989 = _1983;
    if (_1965)
    {
        float _1991 = _1969 * _1983;
        _1975 = _1991;
    }
    float _1993 = _1975;
    if (_1965)
    {
        float _1995 = _1993 * 0.15915493667125701904296875;
        _1989 = _1995;
    }
    float _1997 = _1989;
    float _1999 = _1933;
    float _2001 = _1997;
    if (_1965)
    {
        float _2003 = _1997 * 6.283185482025146484375;
        float _2005 = sin(_2003);
        _1999 = _2005;
    }
    float _2007 = _1999;
    float _2009 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2011 = precise::max(0.0, _2009);
    float _2013 = _1925;
    float _2015 = _2011;
    if (_1965)
    {
        float _2017 = _1997 * 6.283185482025146484375;
        float _2019 = cos(_2017);
        _2013 = _2019;
    }
    float _2021 = _2013;
    float _2023 = -_1937;
    float _2025 = -_2011;
    float _2027 = fma(_1917, _2023, _2025);
    if (_1965)
    {
        float _2029 = _2027 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1977 = _2029;
    }
    float _2031 = _1977;
    float _2033 = _2031;
    float _2035 = _2007;
    if (_1965)
    {
        float _2037 = fma(_2007, _2031, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2033 = _2037;
    }
    float _2039 = _2033;
    float _2041 = _2039;
    float _2043 = _2021;
    if (_1965)
    {
        float _2045 = _2021 + (-1.0);
        _2015 = _2045;
    }
    float _2047 = _2015;
    float _2049 = _2047;
    if (_1965)
    {
        float _2051 = _1987 * _2039;
        _2035 = _2051;
    }
    float _2053 = _2035;
    float _2055 = _2053;
    if (!_1965)
    {
        _2041 = _2027;
    }
    float _2057 = _2041;
    float _2059 = _1907 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2061 = _2057;
    if (_1965)
    {
        float _2063 = _2047 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2001 = _2063;
    }
    float _2065 = _2001;
    if (_1965)
    {
        float _2067 = _1939 * _2053;
        _1979 = _2067;
    }
    float _2069 = _1979;
    if (!_1965)
    {
        _2049 = _1941;
    }
    float _2071 = _2049;
    float _2073 = _2071;
    if (_1965)
    {
        float _2075 = _1941 * _2053;
        _2073 = _2075;
    }
    float _2077 = _2073;
    if (_1965)
    {
        float _2079 = fma(_2027, _2021, _2065);
        _2061 = _2079;
    }
    float _2081 = _2061;
    if (!_1965)
    {
        _2043 = _1943;
    }
    float _2083 = _2043;
    float _2085 = _2083;
    if (_1965)
    {
        float _2087 = _2069 * _2069;
        _2085 = _2087;
    }
    float _2089 = _2085;
    float _2091 = _1907 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (!_1965)
    {
        _2055 = _1945;
    }
    float _2093 = _2055;
    float _2095 = _2093;
    if (_1965)
    {
        float _2097 = _2077 * _2077;
        _2095 = _2097;
    }
    float _2099 = _2095;
    float _2101 = fma(_2081, _2081, _2089);
    float _2103 = _1907 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2105 = fma(_1909, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2091);
    float _2107 = fma(_1909, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2059);
    float _2109 = _2101 + _2099;
    float _2111 = fma(_1909, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2103);
    float _2113 = fma(_1911, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2105);
    float _2115 = _1907 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2117 = fma(_1911, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2107);
    float _2119 = fma(_1911, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2111);
    float _2121 = rsqrt(_2109);
    float _2123 = _2113 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2125 = _2119 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2127 = fma(_1909, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2115);
    float _2129 = _2117 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2131 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2133 = _2125 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2135 = _2123 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2137 = fma(_1911, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2127);
    float _2139 = fma(_2129, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2133);
    float _2141 = -_2135;
    float _2143 = fma(_2141, _2131, 1.0);
    float _2145 = _2137 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2147 = fma(_2123, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2139);
    float _2149 = _2121 * _2069;
    float _2151 = _2121 * _2077;
    float _2153 = log2(_2143);
    float _2155 = fma(_2145, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2147);
    float _2157 = _2121 * _2081;
    float _2159 = _2149 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2161 = _1963 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2163 = _2125 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2165 = -_2159;
    float _2167 = fma(_2157, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2165);
    float _2169 = exp2(_2161);
    float _2171 = fma(_2129, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2163);
    float _2173 = -_2151;
    float _2175 = fma(_2173, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2167);
    float _2177 = _2125 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2179 = fma(_2123, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2171);
    float _2181 = fma(_2175, -0.5, 0.5);
    float _2183 = 1.0 / _2155;
    float _2185 = fma(_2175, 0.5, 0.5);
    float _2187 = fma(_2129, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2177);
    float _2189 = _2157 + 1.0;
    float _2191 = fma(_2145, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2179);
    float _2193 = fma(_2185, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2195 = fma(_2123, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2187);
    float _2197 = _2153 * 0.693147182464599609375;
    float _2199 = sqrt(_2181);
    float _2201 = fma(_2185, _2193, -0.212114393711090087890625);
    float _2203 = fma(_2145, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2195);
    float _2205 = -_2157;
    float _2207 = fma(_2169, _2189, _2205);
    float _2209 = _2197 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2211 = fma(_2185, _2201, 1.570728778839111328125);
    float _2213 = fma(_2207, 0.5, 0.5);
    float _2215 = _2191 * _2183;
    float _2217 = _2203 * _2183;
    float _2219 = fma(_2215, 0.5, 0.5);
    float _2221 = fma(_2217, -0.5, 0.5);
    float _2223 = _2199 * 0.636619746685028076171875;
    float _2225 = -_2211;
    float _2227 = fma(_2223, _2225, 1.0);
    float3 _5923 = float3(_2219, _2221, _2209);
    float _2229 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5923, float3(0.0), isnan(_5923)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5923, float3(0.0), isnan(_5923)), level(0.0)).x;
    float3 _5934 = float3(_2219, _2221, _2209);
    float4 _2232 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5934, float3(0.0), isnan(_5934)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5934, float3(0.0), isnan(_5934)), level(0.0)).xyzw;
    float _2234 = _2232.x;
    float _2236 = _2232.y;
    float _2238 = _2232.z;
    float _2240 = _2232.w;
    float2 _5951 = float2(_2227, _2213);
    float3 _2244 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5951, float2(0.0), isnan(_5951)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5951, float2(0.0), isnan(_5951)), level(0.0)).xyz;
    float _2246 = _2244.x;
    float _2248 = _2244.y;
    float _2250 = _2244.z;
    float _2252 = _1505 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2254 = _1963 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _2256 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2258 = isnan(0.5);
    bool _2260 = _2256 || _2258;
    bool _2262 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2264 = _2260 || _2262;
    float _2266 = fma(_1267, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2252);
    float _2268 = fma(_1257, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2266);
    float _2270 = _1505 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2272 = _2268 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2274 = fma(_1267, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2270);
    float _2276 = 1.0 / _2272;
    float _2278 = fma(_1257, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2274);
    float _2280 = _2278 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2282 = _2280 + _2272;
    float _2284 = _2282 * _2276;
    float _2286 = _2284 * 0.5;
    float _2288 = exp2(_2254);
    float _2290 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2292 = fma(_2286, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2290);
    float _2294 = _2125 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2296 = fma(_2129, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2294);
    float _2298 = 1.0 / _2292;
    float _2300 = fma(_2123, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2296);
    float _2302 = _2296;
    float _2304 = _2123;
    if (_2264)
    {
        _2302 = 1.0;
    }
    float _2306 = _2302;
    float _2308 = _2306;
    if (_2264)
    {
        _2304 = 1.0;
    }
    float _2310 = _2304;
    float _2312 = fma(_2145, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2300);
    float _2314 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2316 = _2298 * _2314;
    float _2318 = _2310;
    if (!_2264)
    {
        float _2320 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2322 = _2320 * 0.15915493667125701904296875;
        float _2324 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2326 = _2322 * 6.283185482025146484375;
        float _2328 = cos(_2326);
        float _2330 = _2324 * 0.15915493667125701904296875;
        float _2332 = _2322 * 6.283185482025146484375;
        float _2334 = sin(_2332);
        float _2336 = 1.0 / _2328;
        float _2338 = _2330 * 6.283185482025146484375;
        float _2340 = cos(_2338);
        float _2342 = _2334 * _2336;
        float _2344 = _2330 * 6.283185482025146484375;
        float _2346 = sin(_2344);
        float _2348 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2350 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2348;
        float _2352 = _2340 * _2342;
        float _2354 = 1.0 / _2350;
        float _2356 = 1.0 / _2352;
        float _2358 = _2346 * _2356;
        float _2360 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2362 = fma(_2316, _2358, _2360);
        float _2364 = _2362 * _2354;
        float _2366 = precise::clamp(_2364, 0.0, 1.0);
        _2308 = _2366;
    }
    float _2368 = _2308;
    if (!_2264)
    {
        float _2370 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2372 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2374 = _2370 * 0.15915493667125701904296875;
        float _2376 = _2372 * 0.15915493667125701904296875;
        float _2378 = _2374 * 6.283185482025146484375;
        float _2380 = cos(_2378);
        float _2382 = _2374 * 6.283185482025146484375;
        float _2384 = sin(_2382);
        float _2386 = 1.0 / _2380;
        float _2388 = _2376 * 6.283185482025146484375;
        float _2390 = cos(_2388);
        float _2392 = _2384 * _2386;
        float _2394 = _2376 * 6.283185482025146484375;
        float _2396 = sin(_2394);
        float _2398 = _2390 * _2392;
        float _2400 = 1.0 / _2398;
        float _2402 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2404 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2402;
        float _2406 = 1.0 / _2404;
        float _2408 = _2396 * _2400;
        float _2410 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2412 = fma(_2316, _2408, _2410);
        float _2414 = _2412 * _2406;
        float _2416 = precise::clamp(_2414, 0.0, 1.0);
        float _2418 = -_2416;
        float _2420 = _2418 + 1.0;
        _2318 = _2420;
    }
    float _2422 = _2318;
    float _2424 = _2368 * _2422;
    float _2426 = -_2288;
    float _2428 = _2426 + 1.0;
    bool _2430 = _2368 > 0.0;
    bool _2432 = isnan(_2368);
    bool _2434 = _2430 || _2432;
    bool _2436 = isnan(0.0);
    bool _2438 = _2434 || _2436;
    float _2440 = _2312 + _2155;
    float _2442 = _2424 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2444 = _2428 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    bool _2446 = _2422 <= 0.0;
    bool _2448 = !_2438;
    bool _2450 = _2446 || _2448;
    float _2452 = _2440 * 0.5;
    float _2454 = _2444 * _2229;
    float _2456 = -_2444;
    float _2458 = _2456 + 1.0;
    out.gl_Position.x = _2191;
    out.gl_Position.y = _2203;
    out.gl_Position.z = _2312;
    out.gl_Position.w = _2155;
    float _2460 = _2442 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2462 = _2240 * _2454;
    float _2464 = _2250 * _2454;
    out.m_68.z = _2452;
    out.m_68.w = _2155;
    float _2466 = fma(_2246, _2462, _2234);
    float _2468 = fma(_2248, _2462, _2236);
    float _2470 = _2240 * _2458;
    float _2472 = fma(_2240, _2464, _2238);
    out.m_45.x = _2460;
    out.m_70.x = _2466;
    out.m_70.y = _2468;
    out.m_70.z = _2472;
    out.m_70.w = _2470;
    if (!_2450)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_45.x = 0.0;
    float _2474 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2474;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

