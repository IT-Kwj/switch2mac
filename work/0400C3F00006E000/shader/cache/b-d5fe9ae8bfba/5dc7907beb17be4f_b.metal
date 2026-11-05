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
        float _2643 = as_type<float>(_105);
        out.gl_Position.z = _2643;
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
    if (_119)
    {
        float _125 = float(_89);
        _99 = _125;
    }
    float _127 = _99;
    bool _129 = _123 >= _127;
    bool _131 = !_119;
    bool _133 = _129 || _131;
    float _135 = _127;
    if (_133)
    {
        _135 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _137 = _135;
    if (_133)
    {
        out.m_45.x = 0.0;
    }
    if (_133)
    {
        float _139 = _137 * 5.0;
        _107 = as_type<int>(_139);
    }
    int _141 = _107;
    if (_133)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2712 = as_type<float>(_141);
        out.gl_Position.z = _2712;
    }
    if (_133)
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
    int _171 = as_type<int>(_143) & 1;
    bool _173 = _171 != 0;
    int _175 = as_type<int>(_143) & 2;
    bool _177 = _175 != 0;
    float _179 = _143;
    float _181 = _145;
    bool _183 = false;
    bool _185 = false;
    if (!_157)
    {
        float _187 = _145 * _145;
        float _189 = _187 * 0.5;
        _179 = _189;
    }
    float _191 = _179;
    bool _193 = !_173;
    float _195 = _193 ? (-0.5) : 0.5;
    float _197 = _191;
    if (!_157)
    {
        float _199 = _191 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _197 = _199;
    }
    float _201 = _197;
    bool _203 = !_177;
    float _205 = _203 ? (-0.5) : 0.5;
    bool _207 = !_157;
    float _209 = _201;
    float _211 = 0.0;
    float _213 = 0.0;
    if (!_207)
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
        _209 = _243;
        _211 = _227;
        _213 = _231;
    }
    float _245 = _209;
    float _247 = _211;
    float _249 = _213;
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
        _181 = _277;
        _253 = _265;
    }
    float _279 = _181;
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
    float _389 = -_379;
    float _391 = _299 + _389;
    float _393 = fma(_299, _147, _165);
    float _395 = -_383;
    float _397 = _381 + _395;
    float _399 = _387 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _401 = _387 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _403 = _387 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _405 = fma(_301, _147, _167);
    float _407 = fma(_391, (*spvDescriptorSet0.vp_c10)._m0[4].x, _399);
    float _409 = fma(_391, (*spvDescriptorSet0.vp_c10)._m0[5].x, _401);
    float _411 = fma(_391, (*spvDescriptorSet0.vp_c10)._m0[6].x, _403);
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
    float _477 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _479 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _477;
    float _481 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _483 = _481 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _485 = -_471;
    float _487 = _485 + 1.0;
    float _489 = in.m_52.x;
    float _491 = in.m_52.y;
    bool _493 = _455 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _495 = isnan(_455);
    bool _497 = _493 || _495;
    bool _499 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _501 = _497 || _499;
    float _503 = float(_501);
    float _505 = 1.0 / _479;
    bool _507 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _509 = 1.0 / _483;
    float _511 = _459 * _505;
    bool _513 = _455 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _515 = isnan(_455);
    bool _517 = _513 || _515;
    bool _519 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _521 = _517 || _519;
    float _523 = float(_521);
    float _525 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _527 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _525;
    float _529 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _531 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _529;
    float _533 = _523 * _487;
    float _535 = -_523;
    float _537 = _535 + 1.0;
    float _539 = _475 * _509;
    float _541 = fma(_527, _511, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _543 = fma(_531, _511, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _545 = _503 * _537;
    float _547 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _549 = _547 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _551 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _553 = _551 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _555 = -_503;
    float _557 = _555 + 1.0;
    float _559 = _541 * _545;
    float _561 = _543 * _545;
    float _563 = fma(_549, _539, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _565 = fma(_553, _539, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _567 = fma(_557, (*spvDescriptorSet0.vp_c9)._m0[143].x, _559);
    float _569 = fma(_557, (*spvDescriptorSet0.vp_c9)._m0[143].y, _561);
    float _571 = fma(_563, _533, _567);
    float _573 = fma(_565, _533, _569);
    float _575 = fma(_471, (*spvDescriptorSet0.vp_c9)._m0[145].x, _571);
    float _577 = fma(_471, (*spvDescriptorSet0.vp_c9)._m0[145].y, _573);
    float _579 = _575 * _489;
    float _581 = _577 * _491;
    bool _583 = !_507;
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
    float _623 = _405 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _625 = _405 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _627 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _629 = _627 + (*spvDescriptorSet0.vp_c9)._m0[156].w;
    int _631 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _633 = _631 != 0;
    float _635 = _405 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _637 = 1.0 / _629;
    float _639 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _641 = _639 + (*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _643 = fma(_393, (*spvDescriptorSet0.vp_c10)._m0[5].x, _625);
    float _645 = fma(_393, (*spvDescriptorSet0.vp_c10)._m0[4].x, _623);
    float _647 = fma(_393, (*spvDescriptorSet0.vp_c10)._m0[6].x, _635);
    float _649 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _651 = _649 + (*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _653 = 1.0 / _641;
    float _655 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _657 = _655 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _659 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _661 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _663 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _665 = fma(_413, (*spvDescriptorSet0.vp_c10)._m0[4].z, _645);
    float _667 = fma(_413, (*spvDescriptorSet0.vp_c10)._m0[5].z, _643);
    float _669 = -(*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _671 = (*spvDescriptorSet0.vp_c9)._m0[156].x + _669;
    float _673 = 1.0 / _651;
    float _675 = fma(_413, (*spvDescriptorSet0.vp_c10)._m0[6].z, _647);
    float _677 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _679 = _677 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _681 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _683 = _681 + (*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _685 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _687 = _659 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _689 = _661 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _691 = _663 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _693 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _695 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _693;
    float _697 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _699 = _697 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _701 = 1.0 / _657;
    float _703 = _671 * _637;
    float _705 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _707 = _705 + (*spvDescriptorSet0.vp_c9)._m0[153].w;
    out.m_56.x = _687;
    out.m_56.y = _689;
    out.m_56.z = _691;
    out.m_56.w = _685;
    float _709 = -(*spvDescriptorSet0.vp_c9)._m0[156].x;
    float _711 = _709 + (*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _713 = 1.0 / _679;
    int _715 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _717 = _715 != 0;
    float _719 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _721 = _619 + _719;
    int _723 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _725 = _723 != 0;
    float _727 = 1.0 / _683;
    float _729 = _695 * _701;
    float _731 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _733 = _731 + (*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _735 = -(*spvDescriptorSet0.vp_c9)._m0[151].x;
    float _737 = (*spvDescriptorSet0.vp_c9)._m0[152].x + _735;
    float _739 = -(*spvDescriptorSet0.vp_c9)._m0[152].x;
    float _741 = _739 + (*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _743 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _745 = _619 + _743;
    float _747 = (*spvDescriptorSet0.vp_c9)._m0[152].x;
    if (_717)
    {
        float _749 = in.m_54.x;
        _747 = _749;
    }
    float _751 = _747;
    float _753 = _737 * _653;
    float _755 = 1.0 / _707;
    float _757 = -(*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _759 = (*spvDescriptorSet0.vp_c9)._m0[154].x + _757;
    float _761 = -(*spvDescriptorSet0.vp_c9)._m0[154].x;
    float _763 = _761 + (*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _765 = _699 * _713;
    float _767 = _759 * _673;
    float _769 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _771 = _769 + (*spvDescriptorSet0.vp_c9)._m0[158].w;
    float _773 = -(*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _775 = (*spvDescriptorSet0.vp_c9)._m0[158].x + _773;
    float _777 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _779 = _621 + _777;
    float _781 = _763 * _727;
    float _783 = 1.0 / _733;
    float _785 = in.m_54.w;
    float _787 = fma(_729, _779, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _789 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _791 = _621 + _789;
    float _793 = _741 * _755;
    float _795 = fma(_765, _791, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _797 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _799 = _619 + _797;
    float _801 = fma(_753, _745, (*spvDescriptorSet0.vp_c9)._m0[151].x);
    float _803 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _805 = _619 + _803;
    bool _807 = _619 >= (*spvDescriptorSet0.vp_c9)._m0[157].w;
    bool _809 = isnan(_619);
    bool _811 = _807 || _809;
    bool _813 = isnan((*spvDescriptorSet0.vp_c9)._m0[157].w);
    bool _815 = _811 || _813;
    float _817 = float(_815);
    float _819 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _821 = _619 + _819;
    float _823 = fma(_767, _799, (*spvDescriptorSet0.vp_c9)._m0[153].x);
    float _825 = fma(_793, _805, (*spvDescriptorSet0.vp_c9)._m0[152].x);
    bool _827 = _619 >= (*spvDescriptorSet0.vp_c9)._m0[156].w;
    bool _829 = isnan(_619);
    bool _831 = _827 || _829;
    bool _833 = isnan((*spvDescriptorSet0.vp_c9)._m0[156].w);
    bool _835 = _831 || _833;
    float _837 = float(_835);
    float _839 = fma(_781, _821, (*spvDescriptorSet0.vp_c9)._m0[154].x);
    float _841 = -_817;
    float _843 = _841 + 1.0;
    bool _845 = _619 >= (*spvDescriptorSet0.vp_c9)._m0[155].w;
    bool _847 = isnan(_619);
    bool _849 = _845 || _847;
    bool _851 = isnan((*spvDescriptorSet0.vp_c9)._m0[155].w);
    bool _853 = _849 || _851;
    float _855 = float(_853);
    float _857 = 1.0 / _771;
    float _859 = -_837;
    float _861 = _859 + 1.0;
    float _863 = _837 * _843;
    bool _865 = _619 >= (*spvDescriptorSet0.vp_c9)._m0[154].w;
    bool _867 = isnan(_619);
    bool _869 = _865 || _867;
    bool _871 = isnan((*spvDescriptorSet0.vp_c9)._m0[154].w);
    bool _873 = _869 || _871;
    float _875 = float(_873);
    float _877 = -_855;
    float _879 = _877 + 1.0;
    float _881 = _855 * _861;
    bool _883 = _619 >= (*spvDescriptorSet0.vp_c9)._m0[153].w;
    bool _885 = isnan(_619);
    bool _887 = _883 || _885;
    bool _889 = isnan((*spvDescriptorSet0.vp_c9)._m0[153].w);
    bool _891 = _887 || _889;
    float _893 = float(_891);
    float _895 = _711 * _783;
    float _897 = _875 * _879;
    bool _899 = _619 >= (*spvDescriptorSet0.vp_c9)._m0[158].w;
    bool _901 = isnan(_619);
    bool _903 = _899 || _901;
    bool _905 = isnan((*spvDescriptorSet0.vp_c9)._m0[158].w);
    bool _907 = _903 || _905;
    float _909 = float(_907);
    float _911 = -_875;
    float _913 = _911 + 1.0;
    float _915 = _875;
    if (_717)
    {
        float _917 = _751 * 3.1415927410125732421875;
        _915 = _917;
    }
    float _919 = _915;
    bool _921 = _785 > 0.5;
    float _923 = _785;
    if (_725)
    {
        float _925 = _785 * 3.1415927410125732421875;
        _923 = _925;
    }
    float _927 = _923;
    float _929 = -_909;
    float _931 = _929 + 1.0;
    float _933 = _893 * _913;
    float _935 = 0.0;
    float _937 = _927;
    if (_717)
    {
        float _939 = _919 * 0.15915493667125701904296875;
        _935 = _939;
    }
    float _941 = _935;
    float _943 = -_893;
    float _945 = _943 + 1.0;
    float _947 = _817 * _931;
    float _949 = _893;
    float _951 = _919;
    if (_633)
    {
        float _953 = in.m_54.x;
        float _955 = in.m_54.y;
        _949 = _953;
        _951 = _955;
    }
    float _957 = _949;
    float _959 = _951;
    bool _961 = _621 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _963 = isnan(_621);
    bool _965 = _961 || _963;
    bool _967 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _969 = _965 || _967;
    float _971 = float(_969);
    if (_725)
    {
        float _973 = _927 * 0.15915493667125701904296875;
        _937 = _973;
    }
    float _975 = _937;
    float _977 = _775 * _857;
    bool _979 = _621 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _981 = isnan(_621);
    bool _983 = _979 || _981;
    bool _985 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _987 = _983 || _985;
    float _989 = float(_987);
    float _991 = _941;
    if (_717)
    {
        float _993 = _941 * 6.283185482025146484375;
        float _995 = sin(_993);
        _991 = _995;
    }
    float _997 = _991;
    bool _999 = _619 >= (*spvDescriptorSet0.vp_c9)._m0[152].w;
    bool _1001 = isnan(_619);
    bool _1003 = _999 || _1001;
    bool _1005 = isnan((*spvDescriptorSet0.vp_c9)._m0[152].w);
    bool _1007 = _1003 || _1005;
    float _1009 = float(_1007);
    float _1011 = -_971;
    float _1013 = _1011 + 1.0;
    bool _1015 = _621 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1017 = isnan(_621);
    bool _1019 = _1015 || _1017;
    bool _1021 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1023 = _1019 || _1021;
    float _1025 = float(_1023);
    float _1027 = fma(_895, _721, (*spvDescriptorSet0.vp_c9)._m0[156].x);
    bool _1029 = _619 >= (*spvDescriptorSet0.vp_c9)._m0[151].w;
    bool _1031 = isnan(_619);
    bool _1033 = _1029 || _1031;
    bool _1035 = isnan((*spvDescriptorSet0.vp_c9)._m0[151].w);
    bool _1037 = _1033 || _1035;
    float _1039 = float(_1037);
    float _1041 = _989 * _1013;
    float _1043 = -_989;
    float _1045 = _1043 + 1.0;
    float _1047 = _975;
    float _1049 = _1045;
    if (_725)
    {
        float _1051 = _975 * 6.283185482025146484375;
        float _1053 = sin(_1051);
        _1047 = _1053;
    }
    float _1055 = _1047;
    float _1057 = -_1009;
    float _1059 = _1057 + 1.0;
    float _1061 = _1009 * _945;
    float _1063 = _1025 * _1045;
    float _1065 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1067 = _619 + _1065;
    float _1069 = _1039 * _1059;
    float _1071 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1073 = _619 + _1071;
    float _1075 = _787 * _1063;
    float _1077 = -_1025;
    float _1079 = _1077 + 1.0;
    float _1081 = _801 * _1069;
    float _1083 = -_1039;
    float _1085 = _1083 + 1.0;
    float _1087 = _1079;
    int _1089 = as_type<int>(_1073);
    float _1091 = _1081;
    float _1093 = _1075;
    if (_717)
    {
        bool _1095 = _997 > 0.5;
        _183 = _1095;
    }
    bool _1097 = _183;
    float _1099 = fma(_977, _1073, (*spvDescriptorSet0.vp_c9)._m0[157].x);
    float _1101 = fma(_1079, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1075);
    float _1103 = fma(_1085, (*spvDescriptorSet0.vp_c9)._m0[151].x, _1081);
    float _1105 = fma(_703, _1067, (*spvDescriptorSet0.vp_c9)._m0[155].x);
    if (_725)
    {
        bool _1107 = _1055 > 0.5;
        _185 = _1107;
    }
    bool _1109 = _185;
    if (!_725)
    {
        _1087 = _195;
    }
    float _1111 = _1087;
    float _1113 = _1111;
    if (_633)
    {
        _1089 = 0;
    }
    int _1115 = _1089;
    float _1117 = _957;
    float _1119 = _959;
    int _1121 = _1115;
    if (_633)
    {
        _1049 = _957;
    }
    float _1123 = _1049;
    float _1125 = _1123;
    if (_633)
    {
        _1091 = _959;
    }
    float _1127 = _1091;
    float _1129 = _1127;
    if (!_633)
    {
        float _1131 = in.m_54.x;
        float _1133 = in.m_54.y;
        float _1135 = _1131 * 3.1415927410125732421875;
        float _1137 = _1135 * 0.15915493667125701904296875;
        float _1139 = _1133 * 3.1415927410125732421875;
        float _1141 = _1139 * 0.15915493667125701904296875;
        float _1143 = _1137 * 6.283185482025146484375;
        float _1145 = sin(_1143);
        float _1147 = _1141 * 6.283185482025146484375;
        float _1149 = sin(_1147);
        _1117 = _1131;
        _1119 = _1133;
        _1121 = 2;
        _1129 = _1149;
        _1125 = _1145;
    }
    float _1151 = _1117;
    float _1153 = _1119;
    int _1155 = _1121;
    float _1157 = _1129;
    float _1159 = _1125;
    float _1161 = fma(_825, _1061, _1103);
    float _1163 = _1161;
    if (_725)
    {
        float _1165 = -_195;
        float _1167 = _1109 ? _1165 : _195;
        _1113 = _1167;
    }
    float _1169 = _1113;
    float _1171 = in.m_54.z;
    bool _1173 = _1151 > 0.5;
    float _1175 = fma(_795, _1041, _1101);
    bool _1177 = _1153 > 0.5;
    float _1179 = _1153 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    if (!_717)
    {
        _1093 = _205;
    }
    float _1181 = _1093;
    float _1183 = _667 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1185 = fma(_971, (*spvDescriptorSet0.vp_c9)._m0[117].x, _1175);
    float _1187 = _1181;
    if (_717)
    {
        float _1189 = -_205;
        float _1191 = _1097 ? _1189 : _205;
        _1187 = _1191;
    }
    float _1193 = _1187;
    float _1195 = _665 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _1197 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1199 = _1197 != 0;
    float _1201 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    float _1203 = -_195;
    int _1205 = _1173 ? as_type<int>(_1203) : as_type<int>(_195);
    float _1207 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1209 = _1183 + _1207;
    bool _1211 = _1155 != 2;
    float _1213 = fma(_1157, (*spvDescriptorSet0.vp_c9)._m0[93].w, _1201);
    int _1215 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1217 = _1215 != 0;
    float _1219 = _1157 * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    float _1221 = -_205;
    int _1223 = _1177 ? as_type<int>(_1221) : as_type<int>(_205);
    float _1225 = fma(_823, _933, _1161);
    int _1227 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1229 = _1227 != 0;
    float _1231 = _675 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1233 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1235 = _1195 + _1233;
    bool _1237 = !_1199;
    float _1239 = _1237 ? _195 : as_type<float>(_1205);
    float _1241 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1243 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1245 = -_195;
    int _1247 = _1177 ? as_type<int>(_1245) : as_type<int>(_195);
    float _1249 = fma(_839, _897, _1225);
    bool _1251 = !_1217;
    float _1253 = _1251 ? _205 : as_type<float>(_1223);
    float _1255 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    int _1257 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1259 = _1257 != 0;
    int _1261 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1263 = _1261 != 0;
    int _1265 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1267 = _1265 != 0;
    float _1269 = fma(_1179, -2.0, _1243);
    float _1271 = fma(_1219, -2.0, _1255);
    float _1273 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    bool _1275 = !_1263;
    float _1277 = _1275 ? _195 : as_type<float>(_1247);
    float _1279 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    float _1281 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1283 = fma(_1159, (*spvDescriptorSet0.vp_c9)._m0[93].z, _1279);
    float _1285 = _1151 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1287 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1289 = _1285;
    if (_1211)
    {
        _1163 = _1151;
    }
    float _1291 = _1163;
    float _1293 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _1295 = _1171 > 0.5;
    float _1297 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1299 = _1291;
    if (!_1211)
    {
        _1299 = _1171;
    }
    float _1301 = _1299;
    float _1303 = _1209 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1305 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1307 = _1159 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    float _1309 = -_1281;
    float _1311 = fma(_1285, 2.0, _1309);
    float _1313 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1315 = _1231 + _1313;
    float _1317 = fma(_1235, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1303);
    if (_1211)
    {
        _1289 = _1153;
    }
    float _1319 = _1289;
    float _1321 = fma(_1151, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1287);
    float _1323 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    float _1325 = fma(_1153, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1293);
    float _1327 = fma(_1153, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1305);
    float _1329 = fma(_1151, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1297);
    float _1331 = _1319;
    if (!_1211)
    {
        _1331 = _1151;
    }
    float _1333 = _1331;
    float _1335 = fma(_1315, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1317);
    float _1337 = -_1323;
    float _1339 = fma(_1307, 2.0, _1337);
    float _1341 = _1273 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    float _1343 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    bool _1345 = _1335 >= 0.0;
    float _1347 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1349 = _1169 + 0.5;
    float _1351 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1353 = -_123;
    float _1355 = fma(_1353, (*spvDescriptorSet0.vp_c9)._m0[91].x, _1339);
    float _1357 = _1343 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1359 = _1347 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1361 = _1351 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1363 = _1185 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1365 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1367 = fma(_1105, _881, _1249);
    float _1369 = fma(_1341, _1349, _1355);
    float _1371 = _1241 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1373 = -_123;
    float _1375 = fma(_1373, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1311);
    float _1377 = _1239 + 0.5;
    out.m_58.x = _1357;
    out.m_58.y = _1359;
    out.m_58.z = _1361;
    out.m_58.w = _1363;
    float _1379 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    float _1381 = _1301 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1383 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1385 = fma(_1027, _863, _1367);
    float _1387 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[91].y, _1271);
    float _1389 = _1193 + (-0.5);
    float _1391 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1393 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1395 = _1365 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1397 = fma(_1099, _947, _1385);
    float _1399 = -_1391;
    float _1401 = fma(_1381, 2.0, _1399);
    float _1403 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[92].w, _1213);
    float _1405 = fma(_1371, _1377, _1375);
    float _1407 = -_205;
    int _1409 = _1295 ? as_type<int>(_1407) : as_type<int>(_205);
    float _1411 = _1333 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1413 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1415 = _1379 * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    bool _1417 = !_1267;
    float _1419 = _1417 ? _205 : as_type<float>(_1409);
    float _1421 = fma(_1411, -2.0, _1383);
    float _1423 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1269);
    float _1425 = _1253 + (-0.5);
    float _1427 = -_205;
    int _1429 = _921 ? as_type<int>(_1427) : as_type<int>(_205);
    float _1431 = _1419 + (-0.5);
    float _1433 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1421);
    float _1435 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1437 = _1393 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1439 = -_1415;
    float _1441 = -_1387;
    float _1443 = fma(_1439, _1389, _1441);
    float _1445 = -_1395;
    float _1447 = -_1433;
    float _1449 = fma(_1445, _1431, _1447);
    float _1451 = -_195;
    int _1453 = _1295 ? as_type<int>(_1451) : as_type<int>(_195);
    float _1455 = _1277 + 0.5;
    float _1457 = -_123;
    float _1459 = fma(_1457, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1401);
    float _1461 = _1413 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    bool _1463 = !_1259;
    float _1465 = _1463 ? _195 : as_type<float>(_1453);
    float _1467 = -_1403;
    float _1469 = _1467 + 1.0;
    float _1471 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1329);
    float _1473 = -_1437;
    float _1475 = -_1423;
    float _1477 = fma(_1473, _1425, _1475);
    bool _1479 = !_1229;
    float _1481 = _1479 ? _205 : as_type<float>(_1429);
    float _1483 = fma(_1461, _1455, _1459);
    float _1485 = fma(_1469, _1193, _1443);
    float _1487 = _1465 + 0.5;
    float _1489 = -_1471;
    float _1491 = _1489 + 1.0;
    float _1493 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1495 = _1209 * _1209;
    float _1497 = _1487 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1499 = -_1491;
    float _1501 = fma(_1277, _1499, _1483);
    float _1503 = -_1481;
    float _1505 = _1503 + 0.5;
    float _1507 = fma(_1235, _1235, _1495);
    float _1509 = _1497 * _1435;
    float _1511 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[92].z, _1283);
    float _1513 = _1505 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1515 = fma(_1315, _1315, _1507);
    float _1517 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1321);
    float _1519 = -_1511;
    float _1521 = _1519 + 1.0;
    float _1523 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1325);
    float _1525 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1327);
    float _1527 = -_1517;
    float _1529 = _1527 + 1.0;
    float _1531 = rsqrt(_1515);
    float _1533 = _1513 * _1493;
    float _1535 = -_1521;
    float _1537 = fma(_1535, _1169, _1369);
    float _1539 = _1513;
    if (_1345)
    {
        _1539 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1541 = _1539;
    float _1543 = -_1523;
    float _1545 = _1543 + 1.0;
    float _1547 = -_1525;
    float _1549 = _1547 + 1.0;
    float _1551 = -_1529;
    float _1553 = fma(_1239, _1551, _1405);
    int _1555 = as_type<int>(_1541);
    if (_1345)
    {
        float _1557 = _1541 * 5.0;
        _1555 = as_type<int>(_1557);
    }
    int _1559 = _1555;
    float _1561 = fma(_1253, _1545, _1477);
    float _1563 = fma(_1419, _1549, _1449);
    float _1565 = fma(_909, (*spvDescriptorSet0.vp_c9)._m0[158].x, _1397);
    out.m_60.x = _1537;
    out.m_60.y = _1485;
    if (_1345)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4989 = as_type<float>(_1559);
        out.gl_Position.z = _4989;
    }
    float _1567 = _1209 * _1531;
    float _1569 = _1235 * _1531;
    out.m_62.x = _1553;
    out.m_62.y = _1561;
    out.m_62.z = _1509;
    out.m_62.w = _1533;
    out.m_64.x = _1501;
    out.m_64.y = _1563;
    out.m_66.x = _1565;
    if (_1345)
    {
        out.m_45.x = 0.0;
    }
    if (_1345)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1571 = -_1567;
    float _1573 = fma(_1571, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1183);
    float _1575 = _1315 * _1531;
    float _1577 = -_1569;
    float _1579 = fma(_1577, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1195);
    float _1581 = -_1567;
    float _1583 = fma(_1581, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1209);
    float _1585 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1587 = _1573 + _1585;
    float _1589 = -_1575;
    float _1591 = fma(_1589, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1231);
    float _1593 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1595 = _1579 + _1593;
    float _1597 = -_1569;
    float _1599 = fma(_1597, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1235);
    float _1601 = _1587 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1603 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1605 = _1591 + _1603;
    float _1607 = _1583 * _1583;
    float _1609 = -_1575;
    float _1611 = fma(_1609, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1315);
    float _1613 = fma(_1595, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1601);
    float _1615 = fma(_1599, _1599, _1607);
    float _1617 = fma(_1605, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1613);
    float _1619 = fma(_1611, _1611, _1615);
    bool _1621 = _1617 >= 0.0;
    float _1623 = sqrt(_1619);
    float _1625 = _1605;
    if (_1621)
    {
        _1625 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1627 = _1625;
    int _1629 = as_type<int>(_1627);
    if (_1621)
    {
        out.m_45.x = 0.0;
    }
    float _1631 = _1531 * _1623;
    if (_1621)
    {
        float _1633 = _1627 * 5.0;
        _1629 = as_type<int>(_1633);
    }
    int _1635 = _1629;
    if (_1621)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5141 = as_type<float>(_1635);
        out.gl_Position.z = _5141;
    }
    if (_1621)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1637 = _581 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1639 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _205);
    float _1641 = _579 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1643 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _195);
    float _1645 = _1631 * _1637;
    float _1647 = _1631 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1649 = _1647 * 0.5;
    float _1651 = _1631 * _1641;
    float _1653 = _1639 * _1645;
    float _1655 = _1643 * _1651;
    float _1657 = _1653 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1659 = _1653 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1661 = _1653 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1663 = fma(_1655, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1657);
    float _1665 = fma(_1655, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1659);
    float _1667 = fma(_1655, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1661);
    float _1669 = fma(_1649, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1663);
    float _1671 = fma(_1649, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1665);
    float _1673 = fma(_1649, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1667);
    float _1675 = _1669 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1677 = _1671 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1679 = _1673 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1681 = _1231 + _1675;
    float _1683 = _1195 + _1677;
    float _1685 = _1183 + _1679;
    float _1687 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1689 = _1681 + _1687;
    float _1691 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1693 = _1683 + _1691;
    float _1695 = _1689 * _1689;
    float _1697 = fma(_1693, _1693, _1695);
    float _1699 = sqrt(_1697);
    bool _1701 = _1699 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1703 = _1649;
    float _1705 = _1679;
    float _1707 = _1671;
    float _1709 = _1681;
    if (!_1701)
    {
        _1703 = _1683;
    }
    float _1711 = _1703;
    float _1713 = _1711;
    if (!_1701)
    {
        _1705 = _1681;
    }
    float _1715 = _1705;
    float _1717 = _1715;
    if (!_1701)
    {
        _1707 = _1685;
    }
    float _1719 = _1707;
    bool _1721 = !_1701;
    float _1723 = _1719;
    if (!_1721)
    {
        float _1725 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1727 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1729 = _1699 + _1727;
        float _1731 = rsqrt(_1697);
        float _1733 = _1729 * _1725;
        float _1735 = _1685 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1737 = _1733 * 0.15915493667125701904296875;
        float _1739 = _1737 * 6.283185482025146484375;
        float _1741 = sin(_1739);
        float _1743 = _1737 * 6.283185482025146484375;
        float _1745 = cos(_1743);
        float _1747 = fma(_1741, _1735, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1749 = _1731 * _1747;
        float _1751 = _1745 + (-1.0);
        float _1753 = fma(_1693, _1749, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1755 = fma(_1689, _1749, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1757 = _1751 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1759 = fma(_1685, _1745, _1757);
        _1723 = _1759;
        _1713 = _1753;
        _1717 = _1755;
        _1709 = _1737;
    }
    float _1761 = _1723;
    float _1763 = _1713;
    float _1765 = _1717;
    float _1767 = _1709;
    float _1769 = -_1183;
    float _1771 = _1769 + _1761;
    float _1773 = -_1195;
    float _1775 = _1773 + _1763;
    float _1777 = -_1231;
    float _1779 = _1777 + _1765;
    float _1781 = _1771 * _1771;
    float _1783 = fma(_1775, _1775, _1781);
    float _1785 = fma(_1779, _1779, _1783);
    float _1787 = sqrt(_1785);
    bool _1789 = _1787 > 0.0;
    bool _1791 = !_1789;
    float _1793 = _1783;
    float _1795 = _1767;
    float _1797 = _1761;
    float _1799 = _1763;
    float _1801 = _1765;
    if (!_1791)
    {
        bool _1803 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _1805 = _1787;
        if (_1803)
        {
            float _1807 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _1805 = _1807;
        }
        float _1809 = _1805;
        float _1811 = _1809;
        if (_1803)
        {
            float _1813 = _415 * _1809;
            _1793 = _1813;
        }
        float _1815 = _1793;
        float _1817 = _1815;
        if (_1803)
        {
            float _1819 = _417 * _1809;
            _1795 = _1819;
        }
        float _1821 = _1795;
        float _1823 = _1821;
        if (_1803)
        {
            float _1825 = _419 * _1809;
            _1811 = _1825;
        }
        float _1827 = _1811;
        float _1829 = _1827;
        float _1831 = _1827;
        if (!_1803)
        {
            float _1833 = _123 + 1.0;
            float _1835 = _1833;
            if (!_157)
            {
                float _1837 = _1833 * _1833;
                float _1839 = _1837 * 0.5;
                _1829 = _1839;
            }
            float _1841 = _1829;
            float _1843 = _1841;
            if (!_157)
            {
                float _1845 = _1841 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _1843 = _1845;
            }
            float _1847 = _1843;
            bool _1849 = !_157;
            float _1851 = _1847;
            if (!_1849)
            {
                float _1853 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1855 = log2(_1853);
                float _1857 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _1859 = _1857 + 1.0;
                float _1861 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1863 = _1855 * _1833;
                float _1865 = 1.0 / _1859;
                float _1867 = _1861 * 0.693147182464599609375;
                float _1869 = exp2(_1863);
                float _1871 = 1.0 / _1867;
                float _1873 = _1869 + (-1.0);
                float _1875 = -_1873;
                float _1877 = fma(_1875, _1871, _1833);
                float _1879 = _1877 * _1865;
                float _1881 = _1879 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _1851 = _1881;
            }
            float _1883 = _1851;
            float _1885 = _1883 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _1887 = _1883 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            bool _1889 = !_157;
            if (!_1889)
            {
                float _1891 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1893 = log2(_1891);
                float _1895 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _1897 = _1895 + 1.0;
                float _1899 = 1.0 / _1897;
                float _1901 = _1893 * _1833;
                float _1903 = exp2(_1901);
                float _1905 = -_1903;
                float _1907 = _1905 + 1.0;
                float _1909 = _1907 * _1899;
                _1835 = _1909;
            }
            float _1911 = _1835;
            float _1913 = fma(_1911, _161, _1887);
            float _1915 = _1883 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _1917 = fma(_1911, _159, _1885);
            float _1919 = -_377;
            float _1921 = _1919 + _1913;
            float _1923 = fma(_1911, _163, _1915);
            float _1925 = -_379;
            float _1927 = _1925 + _1917;
            float _1929 = _1921 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _1931 = _1921 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _1933 = _1921 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _1935 = -_383;
            float _1937 = _1935 + _1923;
            float _1939 = fma(_1927, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1929);
            float _1941 = fma(_1927, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1931);
            float _1943 = fma(_1927, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1933);
            float _1945 = fma(_1937, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1939);
            float _1947 = fma(_1937, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1941);
            float _1949 = fma(_1937, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1943);
            _423 = _1947;
            _425 = _1945;
            _427 = _1949;
            _1817 = _1945;
            _1823 = _1947;
            _1831 = _1949;
        }
        float _1951 = _423;
        float _1953 = _425;
        float _1955 = _427;
        float _1957 = _1817;
        float _1959 = _1823;
        float _1961 = _1831;
        float _1963 = _1951 * _1951;
        float _1965 = rsqrt(_1785);
        float _1967 = fma(_1953, _1953, _1963);
        float _1969 = fma(_1955, _1955, _1967);
        float _1971 = sqrt(_1969);
        float _1973 = _1775 * _1965;
        float _1975 = _1771 * _1965;
        float _1977 = _1779 * _1965;
        bool _1979 = _1971 > 0.0;
        bool _1981 = !_1979;
        if (!_1981)
        {
            float _1983 = rsqrt(_1969);
            float _1985 = _1983 * _1951;
            float _1987 = _1983 * _1953;
            float _1989 = _1983 * _1955;
            float _1991 = _1975 * _1985;
            float _1993 = fma(_1973, _1987, _1991);
            float _1995 = fma(_1977, _1989, _1993);
            float _1997 = _1995 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1999 = fma(_1957, _1997, _1763);
            float _2001 = fma(_1959, _1997, _1761);
            float _2003 = fma(_1961, _1997, _1765);
            _1797 = _2001;
            _1799 = _1999;
            _1801 = _2003;
        }
    }
    float _2005 = _1797;
    float _2007 = _1799;
    float _2009 = _1801;
    float _2011 = -_1567;
    float _2013 = fma(_2011, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2005);
    float _2015 = -_1569;
    float _2017 = fma(_2015, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2007);
    float _2019 = -_1575;
    float _2021 = fma(_2019, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2009);
    float _2023 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2025 = _2013 + _2023;
    float _2027 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2029 = _2017 + _2027;
    float _2031 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2033 = _2021 + _2031;
    float _2035 = _2025 * _2025;
    float _2037 = fma(_2029, _2029, _2035);
    float _2039 = fma(_2033, _2033, _2037);
    float _2041 = rsqrt(_2039);
    float _2043 = sqrt(_2039);
    float _2045 = _2041 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2047 = _2029 * _2045;
    float _2049 = _2033 * _2045;
    float _2051 = _2047 * _2047;
    float _2053 = _2049 * _2049;
    float _2055 = _2051 + _2053;
    float _2057 = sqrt(_2055);
    bool _2059 = _2057 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2061 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2063 = _2057 + _2061;
    float _2065 = _2041;
    float _2067 = _2007;
    float _2069 = _2063;
    float _2071 = _2009;
    float _2073 = _2025;
    float _2075 = _2045;
    if (_2059)
    {
        float _2077 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2065 = _2077;
    }
    float _2079 = _2065;
    if (_2059)
    {
        float _2081 = rsqrt(_2055);
        _2067 = _2081;
    }
    float _2083 = _2067;
    float _2085 = _2083;
    if (_2059)
    {
        float _2087 = _2063 * _2079;
        _2069 = _2087;
    }
    float _2089 = _2069;
    if (_2059)
    {
        float _2091 = _2089 * 0.15915493667125701904296875;
        _2071 = _2091;
    }
    float _2093 = _2071;
    float _2095 = _2079;
    float _2097 = _2093;
    if (_2059)
    {
        float _2099 = _2093 * 6.283185482025146484375;
        float _2101 = sin(_2099);
        _2095 = _2101;
    }
    float _2103 = _2095;
    float _2105 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2107 = precise::max(0.0, _2105);
    float _2109 = _2033;
    float _2111 = _2107;
    if (_2059)
    {
        float _2113 = _2093 * 6.283185482025146484375;
        float _2115 = cos(_2113);
        _2109 = _2115;
    }
    float _2117 = _2109;
    float _2119 = -_2045;
    float _2121 = -_2107;
    float _2123 = fma(_2025, _2119, _2121);
    if (_2059)
    {
        float _2125 = _2123 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2111 = _2125;
    }
    float _2127 = _2111;
    float _2129 = _2103;
    float _2131 = _2127;
    if (_2059)
    {
        float _2133 = fma(_2103, _2127, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2073 = _2133;
    }
    float _2135 = _2073;
    float _2137 = _2135;
    if (!_2059)
    {
        _2129 = _2047;
    }
    float _2139 = _2129;
    float _2141 = _2139;
    if (_2059)
    {
        float _2143 = _2117 + (-1.0);
        _2131 = _2143;
    }
    float _2145 = _2131;
    float _2147 = _2145;
    if (_2059)
    {
        float _2149 = _2083 * _2135;
        _2075 = _2149;
    }
    float _2151 = _2075;
    if (!_2059)
    {
        _2085 = _2123;
    }
    float _2153 = _2085;
    float _2155 = _2153;
    if (_2059)
    {
        float _2157 = _2145 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2097 = _2157;
    }
    float _2159 = _2097;
    float _2161 = _2159;
    if (_2059)
    {
        float _2163 = _2047 * _2151;
        _2141 = _2163;
    }
    float _2165 = _2141;
    if (!_2059)
    {
        _2137 = _2049;
    }
    float _2167 = _2137;
    float _2169 = _2167;
    if (_2059)
    {
        float _2171 = _2049 * _2151;
        _2169 = _2171;
    }
    float _2173 = _2169;
    if (_2059)
    {
        float _2175 = fma(_2123, _2117, _2159);
        _2155 = _2175;
    }
    float _2177 = _2155;
    if (!_2059)
    {
        _2161 = _2051;
    }
    float _2179 = _2161;
    float _2181 = _2179;
    if (_2059)
    {
        float _2183 = _2165 * _2165;
        _2181 = _2183;
    }
    float _2185 = _2181;
    float _2187 = _2013 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2189 = _2013 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2191 = _2013 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (!_2059)
    {
        _2147 = _2053;
    }
    float _2193 = _2147;
    float _2195 = _2013 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2197 = _2193;
    if (_2059)
    {
        float _2199 = _2173 * _2173;
        _2197 = _2199;
    }
    float _2201 = _2197;
    float _2203 = fma(_2177, _2177, _2185);
    float _2205 = fma(_2017, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2187);
    float _2207 = fma(_2017, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2189);
    float _2209 = fma(_2017, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2191);
    float _2211 = fma(_2017, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2195);
    float _2213 = _2203 + _2201;
    float _2215 = fma(_2021, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2207);
    float _2217 = fma(_2021, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2209);
    float _2219 = rsqrt(_2213);
    float _2221 = fma(_2021, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2205);
    float _2223 = _2215 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2225 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2227 = fma(_2043, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2225);
    float _2229 = precise::clamp(_2227, 0.0, 1.0);
    float _2231 = _2217 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2233 = _2221 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2235 = _2223 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2237 = -_2229;
    float _2239 = _2237 + 1.0;
    float _2241 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2243 = _2231 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2245 = fma(_2021, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2211);
    float _2247 = fma(_2233, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2235);
    float _2249 = -_2243;
    float _2251 = fma(_2249, _2241, 1.0);
    float _2253 = abs(_2239);
    float _2255 = log2(_2253);
    float _2257 = _2245 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2259 = fma(_2231, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2247);
    float _2261 = _2219 * _2165;
    float _2263 = _2219 * _2173;
    float _2265 = fma(_2257, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2259);
    float _2267 = _2219 * _2177;
    float _2269 = _2261 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2271 = log2(_2251);
    float _2273 = _2267 + 1.0;
    float _2275 = -_2269;
    float _2277 = fma(_2267, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2275);
    float _2279 = _2223 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2281 = -_2263;
    float _2283 = fma(_2281, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2277);
    float _2285 = _2255 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2287 = 1.0 / _2265;
    float _2289 = _2223 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2291 = fma(_2283, -0.5, 0.5);
    float _2293 = fma(_2283, 0.5, 0.5);
    float _2295 = fma(_2233, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2279);
    float _2297 = fma(_2233, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2289);
    float _2299 = fma(_2293, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2301 = exp2(_2285);
    float _2303 = fma(_2231, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2297);
    float _2305 = fma(_2231, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2295);
    float _2307 = fma(_2293, _2299, -0.212114393711090087890625);
    float _2309 = _2271 * 0.693147182464599609375;
    float _2311 = fma(_2257, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2303);
    float _2313 = fma(_2257, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2305);
    float _2315 = fma(_2293, _2307, 1.570728778839111328125);
    float _2317 = sqrt(_2291);
    float _2319 = _2311 * _2287;
    float _2321 = _2309 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2323 = fma(_2319, 0.5, 0.5);
    float _2325 = -_2267;
    float _2327 = fma(_2301, _2273, _2325);
    float _2329 = _2313 * _2287;
    float _2331 = fma(_2327, 0.5, 0.5);
    float _2333 = fma(_2329, -0.5, 0.5);
    float _2335 = _2317 * 0.636619746685028076171875;
    float _2337 = -_2315;
    float _2339 = fma(_2335, _2337, 1.0);
    float3 _6274 = float3(_2323, _2333, _2321);
    float _2341 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6274, float3(0.0), isnan(_6274)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6274, float3(0.0), isnan(_6274)), level(0.0)).x;
    float3 _6285 = float3(_2323, _2333, _2321);
    float4 _2344 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6285, float3(0.0), isnan(_6285)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6285, float3(0.0), isnan(_6285)), level(0.0)).xyzw;
    float _2346 = _2344.x;
    float _2348 = _2344.y;
    float _2350 = _2344.z;
    float _2352 = _2344.w;
    float2 _6302 = float2(_2339, _2331);
    float3 _2356 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6302, float2(0.0), isnan(_6302)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6302, float2(0.0), isnan(_6302)), level(0.0)).xyz;
    float _2358 = _2356.x;
    float _2360 = _2356.y;
    float _2362 = _2356.z;
    float _2364 = _1573 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2366 = _1573 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2368 = _2255 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _2370 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2372 = isnan(0.5);
    bool _2374 = _2370 || _2372;
    bool _2376 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2378 = _2374 || _2376;
    float _2380 = fma(_1579, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2364);
    float _2382 = fma(_1579, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2366);
    float _2384 = fma(_1591, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2380);
    float _2386 = fma(_1591, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2382);
    float _2388 = _2384 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2390 = _2386 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2392 = 1.0 / _2388;
    float _2394 = _2390 + _2388;
    float _2396 = _2394 * _2392;
    float _2398 = _2396 * 0.5;
    float _2400 = _2223 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2402 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2404 = fma(_2398, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2402);
    float _2406 = fma(_2233, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2400);
    float _2408 = _2398;
    float _2410 = _2406;
    if (_2378)
    {
        _2408 = 1.0;
    }
    float _2412 = _2408;
    float _2414 = exp2(_2368);
    float _2416 = fma(_2231, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2406);
    float _2418 = _2412;
    if (_2378)
    {
        _2410 = 1.0;
    }
    float _2420 = _2410;
    float _2422 = fma(_2257, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2416);
    float _2424 = 1.0 / _2404;
    float _2426 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2428 = _2424 * _2426;
    float _2430 = _2420;
    if (!_2378)
    {
        float _2432 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2434 = _2432 * 0.15915493667125701904296875;
        float _2436 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2438 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2440 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2438;
        float _2442 = _2434 * 6.283185482025146484375;
        float _2444 = cos(_2442);
        float _2446 = _2436 * 0.15915493667125701904296875;
        float _2448 = _2434 * 6.283185482025146484375;
        float _2450 = sin(_2448);
        float _2452 = 1.0 / _2444;
        float _2454 = _2446 * 6.283185482025146484375;
        float _2456 = cos(_2454);
        float _2458 = _2450 * _2452;
        float _2460 = _2446 * 6.283185482025146484375;
        float _2462 = sin(_2460);
        float _2464 = _2456 * _2458;
        float _2466 = 1.0 / _2440;
        float _2468 = 1.0 / _2464;
        float _2470 = _2462 * _2468;
        float _2472 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2474 = fma(_2428, _2470, _2472);
        float _2476 = _2474 * _2466;
        float _2478 = precise::clamp(_2476, 0.0, 1.0);
        _2430 = _2478;
    }
    float _2480 = _2430;
    if (!_2378)
    {
        float _2482 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2484 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2486 = _2482 * 0.15915493667125701904296875;
        float _2488 = _2484 * 0.15915493667125701904296875;
        float _2490 = _2486 * 6.283185482025146484375;
        float _2492 = cos(_2490);
        float _2494 = _2486 * 6.283185482025146484375;
        float _2496 = sin(_2494);
        float _2498 = 1.0 / _2492;
        float _2500 = _2488 * 6.283185482025146484375;
        float _2502 = cos(_2500);
        float _2504 = _2496 * _2498;
        float _2506 = _2488 * 6.283185482025146484375;
        float _2508 = sin(_2506);
        float _2510 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2512 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2510;
        float _2514 = _2502 * _2504;
        float _2516 = 1.0 / _2512;
        float _2518 = 1.0 / _2514;
        float _2520 = _2508 * _2518;
        float _2522 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2524 = fma(_2428, _2520, _2522);
        float _2526 = _2524 * _2516;
        float _2528 = precise::clamp(_2526, 0.0, 1.0);
        float _2530 = -_2528;
        float _2532 = _2530 + 1.0;
        _2418 = _2532;
    }
    float _2534 = _2418;
    float _2536 = _2480 * _2534;
    float _2538 = -_2414;
    float _2540 = _2538 + 1.0;
    bool _2542 = _2480 > 0.0;
    bool _2544 = isnan(_2480);
    bool _2546 = _2542 || _2544;
    bool _2548 = isnan(0.0);
    bool _2550 = _2546 || _2548;
    float _2552 = _2422 + _2265;
    float _2554 = _2536 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _2556 = _2534 <= 0.0;
    bool _2558 = !_2550;
    bool _2560 = _2556 || _2558;
    float _2562 = _2554 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2564 = _2540 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2566 = _2552 * 0.5;
    out.gl_Position.x = _2311;
    out.gl_Position.y = _2313;
    out.gl_Position.z = _2422;
    out.gl_Position.w = _2265;
    float _2568 = _2564 * _2341;
    float _2570 = -_2564;
    float _2572 = _2570 + 1.0;
    out.m_68.z = _2566;
    out.m_68.w = _2265;
    float _2574 = _2352 * _2568;
    float _2576 = _2362 * _2568;
    out.m_45.x = _2562;
    float _2578 = fma(_2358, _2574, _2346);
    float _2580 = fma(_2360, _2574, _2348);
    float _2582 = _2352 * _2572;
    float _2584 = fma(_2352, _2576, _2350);
    out.m_70.x = _2578;
    out.m_70.y = _2580;
    out.m_70.z = _2584;
    out.m_70.w = _2582;
    if (!_2560)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2586 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_45.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2586;
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
        float _2643 = as_type<float>(_105);
        out.gl_Position.z = _2643;
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
    if (_119)
    {
        float _125 = float(_89);
        _99 = _125;
    }
    float _127 = _99;
    bool _129 = _123 >= _127;
    bool _131 = !_119;
    bool _133 = _129 || _131;
    float _135 = _127;
    if (_133)
    {
        _135 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _137 = _135;
    if (_133)
    {
        out.m_45.x = 0.0;
    }
    if (_133)
    {
        float _139 = _137 * 5.0;
        _107 = as_type<int>(_139);
    }
    int _141 = _107;
    if (_133)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2712 = as_type<float>(_141);
        out.gl_Position.z = _2712;
    }
    if (_133)
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
    int _171 = as_type<int>(_143) & 1;
    bool _173 = _171 != 0;
    int _175 = as_type<int>(_143) & 2;
    bool _177 = _175 != 0;
    float _179 = _143;
    float _181 = _145;
    bool _183 = false;
    bool _185 = false;
    if (!_157)
    {
        float _187 = _145 * _145;
        float _189 = _187 * 0.5;
        _179 = _189;
    }
    float _191 = _179;
    bool _193 = !_173;
    float _195 = _193 ? (-0.5) : 0.5;
    float _197 = _191;
    if (!_157)
    {
        float _199 = _191 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _197 = _199;
    }
    float _201 = _197;
    bool _203 = !_177;
    float _205 = _203 ? (-0.5) : 0.5;
    bool _207 = !_157;
    float _209 = _201;
    float _211 = 0.0;
    float _213 = 0.0;
    if (!_207)
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
        _209 = _243;
        _211 = _227;
        _213 = _231;
    }
    float _245 = _209;
    float _247 = _211;
    float _249 = _213;
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
        _181 = _277;
        _253 = _265;
    }
    float _279 = _181;
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
    float _389 = -_379;
    float _391 = _299 + _389;
    float _393 = fma(_299, _147, _165);
    float _395 = -_383;
    float _397 = _381 + _395;
    float _399 = _387 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _401 = _387 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _403 = _387 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _405 = fma(_301, _147, _167);
    float _407 = fma(_391, (*spvDescriptorSet0.vp_c10)._m0[4].x, _399);
    float _409 = fma(_391, (*spvDescriptorSet0.vp_c10)._m0[5].x, _401);
    float _411 = fma(_391, (*spvDescriptorSet0.vp_c10)._m0[6].x, _403);
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
    float _477 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _479 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _477;
    float _481 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _483 = _481 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _485 = -_471;
    float _487 = _485 + 1.0;
    float _489 = in.m_52.x;
    float _491 = in.m_52.y;
    bool _493 = _455 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _495 = isnan(_455);
    bool _497 = _493 || _495;
    bool _499 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _501 = _497 || _499;
    float _503 = float(_501);
    float _505 = 1.0 / _479;
    bool _507 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _509 = 1.0 / _483;
    float _511 = _459 * _505;
    bool _513 = _455 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _515 = isnan(_455);
    bool _517 = _513 || _515;
    bool _519 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _521 = _517 || _519;
    float _523 = float(_521);
    float _525 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _527 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _525;
    float _529 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _531 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _529;
    float _533 = _523 * _487;
    float _535 = -_523;
    float _537 = _535 + 1.0;
    float _539 = _475 * _509;
    float _541 = fma(_527, _511, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _543 = fma(_531, _511, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _545 = _503 * _537;
    float _547 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _549 = _547 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _551 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _553 = _551 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _555 = -_503;
    float _557 = _555 + 1.0;
    float _559 = _541 * _545;
    float _561 = _543 * _545;
    float _563 = fma(_549, _539, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _565 = fma(_553, _539, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _567 = fma(_557, (*spvDescriptorSet0.vp_c9)._m0[143].x, _559);
    float _569 = fma(_557, (*spvDescriptorSet0.vp_c9)._m0[143].y, _561);
    float _571 = fma(_563, _533, _567);
    float _573 = fma(_565, _533, _569);
    float _575 = fma(_471, (*spvDescriptorSet0.vp_c9)._m0[145].x, _571);
    float _577 = fma(_471, (*spvDescriptorSet0.vp_c9)._m0[145].y, _573);
    float _579 = _575 * _489;
    float _581 = _577 * _491;
    bool _583 = !_507;
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
    float _623 = _405 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _625 = _405 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _627 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _629 = _627 + (*spvDescriptorSet0.vp_c9)._m0[156].w;
    int _631 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _633 = _631 != 0;
    float _635 = _405 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _637 = 1.0 / _629;
    float _639 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _641 = _639 + (*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _643 = fma(_393, (*spvDescriptorSet0.vp_c10)._m0[5].x, _625);
    float _645 = fma(_393, (*spvDescriptorSet0.vp_c10)._m0[4].x, _623);
    float _647 = fma(_393, (*spvDescriptorSet0.vp_c10)._m0[6].x, _635);
    float _649 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _651 = _649 + (*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _653 = 1.0 / _641;
    float _655 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _657 = _655 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _659 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _661 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _663 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _665 = fma(_413, (*spvDescriptorSet0.vp_c10)._m0[4].z, _645);
    float _667 = fma(_413, (*spvDescriptorSet0.vp_c10)._m0[5].z, _643);
    float _669 = -(*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _671 = (*spvDescriptorSet0.vp_c9)._m0[156].x + _669;
    float _673 = 1.0 / _651;
    float _675 = fma(_413, (*spvDescriptorSet0.vp_c10)._m0[6].z, _647);
    float _677 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _679 = _677 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _681 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _683 = _681 + (*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _685 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _687 = _659 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _689 = _661 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _691 = _663 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _693 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _695 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _693;
    float _697 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _699 = _697 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _701 = 1.0 / _657;
    float _703 = _671 * _637;
    float _705 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _707 = _705 + (*spvDescriptorSet0.vp_c9)._m0[153].w;
    out.m_56.x = _687;
    out.m_56.y = _689;
    out.m_56.z = _691;
    out.m_56.w = _685;
    float _709 = -(*spvDescriptorSet0.vp_c9)._m0[156].x;
    float _711 = _709 + (*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _713 = 1.0 / _679;
    int _715 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _717 = _715 != 0;
    float _719 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _721 = _619 + _719;
    int _723 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _725 = _723 != 0;
    float _727 = 1.0 / _683;
    float _729 = _695 * _701;
    float _731 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _733 = _731 + (*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _735 = -(*spvDescriptorSet0.vp_c9)._m0[151].x;
    float _737 = (*spvDescriptorSet0.vp_c9)._m0[152].x + _735;
    float _739 = -(*spvDescriptorSet0.vp_c9)._m0[152].x;
    float _741 = _739 + (*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _743 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _745 = _619 + _743;
    float _747 = (*spvDescriptorSet0.vp_c9)._m0[152].x;
    if (_717)
    {
        float _749 = in.m_54.x;
        _747 = _749;
    }
    float _751 = _747;
    float _753 = _737 * _653;
    float _755 = 1.0 / _707;
    float _757 = -(*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _759 = (*spvDescriptorSet0.vp_c9)._m0[154].x + _757;
    float _761 = -(*spvDescriptorSet0.vp_c9)._m0[154].x;
    float _763 = _761 + (*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _765 = _699 * _713;
    float _767 = _759 * _673;
    float _769 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _771 = _769 + (*spvDescriptorSet0.vp_c9)._m0[158].w;
    float _773 = -(*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _775 = (*spvDescriptorSet0.vp_c9)._m0[158].x + _773;
    float _777 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _779 = _621 + _777;
    float _781 = _763 * _727;
    float _783 = 1.0 / _733;
    float _785 = in.m_54.w;
    float _787 = fma(_729, _779, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _789 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _791 = _621 + _789;
    float _793 = _741 * _755;
    float _795 = fma(_765, _791, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _797 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _799 = _619 + _797;
    float _801 = fma(_753, _745, (*spvDescriptorSet0.vp_c9)._m0[151].x);
    float _803 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _805 = _619 + _803;
    bool _807 = _619 >= (*spvDescriptorSet0.vp_c9)._m0[157].w;
    bool _809 = isnan(_619);
    bool _811 = _807 || _809;
    bool _813 = isnan((*spvDescriptorSet0.vp_c9)._m0[157].w);
    bool _815 = _811 || _813;
    float _817 = float(_815);
    float _819 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _821 = _619 + _819;
    float _823 = fma(_767, _799, (*spvDescriptorSet0.vp_c9)._m0[153].x);
    float _825 = fma(_793, _805, (*spvDescriptorSet0.vp_c9)._m0[152].x);
    bool _827 = _619 >= (*spvDescriptorSet0.vp_c9)._m0[156].w;
    bool _829 = isnan(_619);
    bool _831 = _827 || _829;
    bool _833 = isnan((*spvDescriptorSet0.vp_c9)._m0[156].w);
    bool _835 = _831 || _833;
    float _837 = float(_835);
    float _839 = fma(_781, _821, (*spvDescriptorSet0.vp_c9)._m0[154].x);
    float _841 = -_817;
    float _843 = _841 + 1.0;
    bool _845 = _619 >= (*spvDescriptorSet0.vp_c9)._m0[155].w;
    bool _847 = isnan(_619);
    bool _849 = _845 || _847;
    bool _851 = isnan((*spvDescriptorSet0.vp_c9)._m0[155].w);
    bool _853 = _849 || _851;
    float _855 = float(_853);
    float _857 = 1.0 / _771;
    float _859 = -_837;
    float _861 = _859 + 1.0;
    float _863 = _837 * _843;
    bool _865 = _619 >= (*spvDescriptorSet0.vp_c9)._m0[154].w;
    bool _867 = isnan(_619);
    bool _869 = _865 || _867;
    bool _871 = isnan((*spvDescriptorSet0.vp_c9)._m0[154].w);
    bool _873 = _869 || _871;
    float _875 = float(_873);
    float _877 = -_855;
    float _879 = _877 + 1.0;
    float _881 = _855 * _861;
    bool _883 = _619 >= (*spvDescriptorSet0.vp_c9)._m0[153].w;
    bool _885 = isnan(_619);
    bool _887 = _883 || _885;
    bool _889 = isnan((*spvDescriptorSet0.vp_c9)._m0[153].w);
    bool _891 = _887 || _889;
    float _893 = float(_891);
    float _895 = _711 * _783;
    float _897 = _875 * _879;
    bool _899 = _619 >= (*spvDescriptorSet0.vp_c9)._m0[158].w;
    bool _901 = isnan(_619);
    bool _903 = _899 || _901;
    bool _905 = isnan((*spvDescriptorSet0.vp_c9)._m0[158].w);
    bool _907 = _903 || _905;
    float _909 = float(_907);
    float _911 = -_875;
    float _913 = _911 + 1.0;
    float _915 = _875;
    if (_717)
    {
        float _917 = _751 * 3.1415927410125732421875;
        _915 = _917;
    }
    float _919 = _915;
    bool _921 = _785 > 0.5;
    float _923 = _785;
    if (_725)
    {
        float _925 = _785 * 3.1415927410125732421875;
        _923 = _925;
    }
    float _927 = _923;
    float _929 = -_909;
    float _931 = _929 + 1.0;
    float _933 = _893 * _913;
    float _935 = 0.0;
    float _937 = _927;
    if (_717)
    {
        float _939 = _919 * 0.15915493667125701904296875;
        _935 = _939;
    }
    float _941 = _935;
    float _943 = -_893;
    float _945 = _943 + 1.0;
    float _947 = _817 * _931;
    float _949 = _893;
    float _951 = _919;
    if (_633)
    {
        float _953 = in.m_54.x;
        float _955 = in.m_54.y;
        _949 = _953;
        _951 = _955;
    }
    float _957 = _949;
    float _959 = _951;
    bool _961 = _621 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _963 = isnan(_621);
    bool _965 = _961 || _963;
    bool _967 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _969 = _965 || _967;
    float _971 = float(_969);
    if (_725)
    {
        float _973 = _927 * 0.15915493667125701904296875;
        _937 = _973;
    }
    float _975 = _937;
    float _977 = _775 * _857;
    bool _979 = _621 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _981 = isnan(_621);
    bool _983 = _979 || _981;
    bool _985 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _987 = _983 || _985;
    float _989 = float(_987);
    float _991 = _941;
    if (_717)
    {
        float _993 = _941 * 6.283185482025146484375;
        float _995 = sin(_993);
        _991 = _995;
    }
    float _997 = _991;
    bool _999 = _619 >= (*spvDescriptorSet0.vp_c9)._m0[152].w;
    bool _1001 = isnan(_619);
    bool _1003 = _999 || _1001;
    bool _1005 = isnan((*spvDescriptorSet0.vp_c9)._m0[152].w);
    bool _1007 = _1003 || _1005;
    float _1009 = float(_1007);
    float _1011 = -_971;
    float _1013 = _1011 + 1.0;
    bool _1015 = _621 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1017 = isnan(_621);
    bool _1019 = _1015 || _1017;
    bool _1021 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1023 = _1019 || _1021;
    float _1025 = float(_1023);
    float _1027 = fma(_895, _721, (*spvDescriptorSet0.vp_c9)._m0[156].x);
    bool _1029 = _619 >= (*spvDescriptorSet0.vp_c9)._m0[151].w;
    bool _1031 = isnan(_619);
    bool _1033 = _1029 || _1031;
    bool _1035 = isnan((*spvDescriptorSet0.vp_c9)._m0[151].w);
    bool _1037 = _1033 || _1035;
    float _1039 = float(_1037);
    float _1041 = _989 * _1013;
    float _1043 = -_989;
    float _1045 = _1043 + 1.0;
    float _1047 = _975;
    float _1049 = _1045;
    if (_725)
    {
        float _1051 = _975 * 6.283185482025146484375;
        float _1053 = sin(_1051);
        _1047 = _1053;
    }
    float _1055 = _1047;
    float _1057 = -_1009;
    float _1059 = _1057 + 1.0;
    float _1061 = _1009 * _945;
    float _1063 = _1025 * _1045;
    float _1065 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1067 = _619 + _1065;
    float _1069 = _1039 * _1059;
    float _1071 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1073 = _619 + _1071;
    float _1075 = _787 * _1063;
    float _1077 = -_1025;
    float _1079 = _1077 + 1.0;
    float _1081 = _801 * _1069;
    float _1083 = -_1039;
    float _1085 = _1083 + 1.0;
    float _1087 = _1079;
    int _1089 = as_type<int>(_1073);
    float _1091 = _1081;
    float _1093 = _1075;
    if (_717)
    {
        bool _1095 = _997 > 0.5;
        _183 = _1095;
    }
    bool _1097 = _183;
    float _1099 = fma(_977, _1073, (*spvDescriptorSet0.vp_c9)._m0[157].x);
    float _1101 = fma(_1079, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1075);
    float _1103 = fma(_1085, (*spvDescriptorSet0.vp_c9)._m0[151].x, _1081);
    float _1105 = fma(_703, _1067, (*spvDescriptorSet0.vp_c9)._m0[155].x);
    if (_725)
    {
        bool _1107 = _1055 > 0.5;
        _185 = _1107;
    }
    bool _1109 = _185;
    if (!_725)
    {
        _1087 = _195;
    }
    float _1111 = _1087;
    float _1113 = _1111;
    if (_633)
    {
        _1089 = 0;
    }
    int _1115 = _1089;
    float _1117 = _957;
    float _1119 = _959;
    int _1121 = _1115;
    if (_633)
    {
        _1049 = _957;
    }
    float _1123 = _1049;
    float _1125 = _1123;
    if (_633)
    {
        _1091 = _959;
    }
    float _1127 = _1091;
    float _1129 = _1127;
    if (!_633)
    {
        float _1131 = in.m_54.x;
        float _1133 = in.m_54.y;
        float _1135 = _1131 * 3.1415927410125732421875;
        float _1137 = _1135 * 0.15915493667125701904296875;
        float _1139 = _1133 * 3.1415927410125732421875;
        float _1141 = _1139 * 0.15915493667125701904296875;
        float _1143 = _1137 * 6.283185482025146484375;
        float _1145 = sin(_1143);
        float _1147 = _1141 * 6.283185482025146484375;
        float _1149 = sin(_1147);
        _1117 = _1131;
        _1119 = _1133;
        _1121 = 2;
        _1129 = _1149;
        _1125 = _1145;
    }
    float _1151 = _1117;
    float _1153 = _1119;
    int _1155 = _1121;
    float _1157 = _1129;
    float _1159 = _1125;
    float _1161 = fma(_825, _1061, _1103);
    float _1163 = _1161;
    if (_725)
    {
        float _1165 = -_195;
        float _1167 = _1109 ? _1165 : _195;
        _1113 = _1167;
    }
    float _1169 = _1113;
    float _1171 = in.m_54.z;
    bool _1173 = _1151 > 0.5;
    float _1175 = fma(_795, _1041, _1101);
    bool _1177 = _1153 > 0.5;
    float _1179 = _1153 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    if (!_717)
    {
        _1093 = _205;
    }
    float _1181 = _1093;
    float _1183 = _667 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1185 = fma(_971, (*spvDescriptorSet0.vp_c9)._m0[117].x, _1175);
    float _1187 = _1181;
    if (_717)
    {
        float _1189 = -_205;
        float _1191 = _1097 ? _1189 : _205;
        _1187 = _1191;
    }
    float _1193 = _1187;
    float _1195 = _665 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _1197 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1199 = _1197 != 0;
    float _1201 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    float _1203 = -_195;
    int _1205 = _1173 ? as_type<int>(_1203) : as_type<int>(_195);
    float _1207 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1209 = _1183 + _1207;
    bool _1211 = _1155 != 2;
    float _1213 = fma(_1157, (*spvDescriptorSet0.vp_c9)._m0[93].w, _1201);
    int _1215 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1217 = _1215 != 0;
    float _1219 = _1157 * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    float _1221 = -_205;
    int _1223 = _1177 ? as_type<int>(_1221) : as_type<int>(_205);
    float _1225 = fma(_823, _933, _1161);
    int _1227 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1229 = _1227 != 0;
    float _1231 = _675 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1233 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1235 = _1195 + _1233;
    bool _1237 = !_1199;
    float _1239 = _1237 ? _195 : as_type<float>(_1205);
    float _1241 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1243 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1245 = -_195;
    int _1247 = _1177 ? as_type<int>(_1245) : as_type<int>(_195);
    float _1249 = fma(_839, _897, _1225);
    bool _1251 = !_1217;
    float _1253 = _1251 ? _205 : as_type<float>(_1223);
    float _1255 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    int _1257 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1259 = _1257 != 0;
    int _1261 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1263 = _1261 != 0;
    int _1265 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1267 = _1265 != 0;
    float _1269 = fma(_1179, -2.0, _1243);
    float _1271 = fma(_1219, -2.0, _1255);
    float _1273 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    bool _1275 = !_1263;
    float _1277 = _1275 ? _195 : as_type<float>(_1247);
    float _1279 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    float _1281 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1283 = fma(_1159, (*spvDescriptorSet0.vp_c9)._m0[93].z, _1279);
    float _1285 = _1151 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1287 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1289 = _1285;
    if (_1211)
    {
        _1163 = _1151;
    }
    float _1291 = _1163;
    float _1293 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _1295 = _1171 > 0.5;
    float _1297 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1299 = _1291;
    if (!_1211)
    {
        _1299 = _1171;
    }
    float _1301 = _1299;
    float _1303 = _1209 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1305 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1307 = _1159 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    float _1309 = -_1281;
    float _1311 = fma(_1285, 2.0, _1309);
    float _1313 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1315 = _1231 + _1313;
    float _1317 = fma(_1235, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1303);
    if (_1211)
    {
        _1289 = _1153;
    }
    float _1319 = _1289;
    float _1321 = fma(_1151, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1287);
    float _1323 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    float _1325 = fma(_1153, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1293);
    float _1327 = fma(_1153, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1305);
    float _1329 = fma(_1151, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1297);
    float _1331 = _1319;
    if (!_1211)
    {
        _1331 = _1151;
    }
    float _1333 = _1331;
    float _1335 = fma(_1315, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1317);
    float _1337 = -_1323;
    float _1339 = fma(_1307, 2.0, _1337);
    float _1341 = _1273 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    float _1343 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    bool _1345 = _1335 >= 0.0;
    float _1347 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1349 = _1169 + 0.5;
    float _1351 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1353 = -_123;
    float _1355 = fma(_1353, (*spvDescriptorSet0.vp_c9)._m0[91].x, _1339);
    float _1357 = _1343 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1359 = _1347 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1361 = _1351 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1363 = _1185 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1365 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1367 = fma(_1105, _881, _1249);
    float _1369 = fma(_1341, _1349, _1355);
    float _1371 = _1241 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1373 = -_123;
    float _1375 = fma(_1373, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1311);
    float _1377 = _1239 + 0.5;
    out.m_58.x = _1357;
    out.m_58.y = _1359;
    out.m_58.z = _1361;
    out.m_58.w = _1363;
    float _1379 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    float _1381 = _1301 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1383 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1385 = fma(_1027, _863, _1367);
    float _1387 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[91].y, _1271);
    float _1389 = _1193 + (-0.5);
    float _1391 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1393 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1395 = _1365 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1397 = fma(_1099, _947, _1385);
    float _1399 = -_1391;
    float _1401 = fma(_1381, 2.0, _1399);
    float _1403 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[92].w, _1213);
    float _1405 = fma(_1371, _1377, _1375);
    float _1407 = -_205;
    int _1409 = _1295 ? as_type<int>(_1407) : as_type<int>(_205);
    float _1411 = _1333 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1413 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1415 = _1379 * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    bool _1417 = !_1267;
    float _1419 = _1417 ? _205 : as_type<float>(_1409);
    float _1421 = fma(_1411, -2.0, _1383);
    float _1423 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1269);
    float _1425 = _1253 + (-0.5);
    float _1427 = -_205;
    int _1429 = _921 ? as_type<int>(_1427) : as_type<int>(_205);
    float _1431 = _1419 + (-0.5);
    float _1433 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1421);
    float _1435 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1437 = _1393 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1439 = -_1415;
    float _1441 = -_1387;
    float _1443 = fma(_1439, _1389, _1441);
    float _1445 = -_1395;
    float _1447 = -_1433;
    float _1449 = fma(_1445, _1431, _1447);
    float _1451 = -_195;
    int _1453 = _1295 ? as_type<int>(_1451) : as_type<int>(_195);
    float _1455 = _1277 + 0.5;
    float _1457 = -_123;
    float _1459 = fma(_1457, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1401);
    float _1461 = _1413 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    bool _1463 = !_1259;
    float _1465 = _1463 ? _195 : as_type<float>(_1453);
    float _1467 = -_1403;
    float _1469 = _1467 + 1.0;
    float _1471 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1329);
    float _1473 = -_1437;
    float _1475 = -_1423;
    float _1477 = fma(_1473, _1425, _1475);
    bool _1479 = !_1229;
    float _1481 = _1479 ? _205 : as_type<float>(_1429);
    float _1483 = fma(_1461, _1455, _1459);
    float _1485 = fma(_1469, _1193, _1443);
    float _1487 = _1465 + 0.5;
    float _1489 = -_1471;
    float _1491 = _1489 + 1.0;
    float _1493 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1495 = _1209 * _1209;
    float _1497 = _1487 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1499 = -_1491;
    float _1501 = fma(_1277, _1499, _1483);
    float _1503 = -_1481;
    float _1505 = _1503 + 0.5;
    float _1507 = fma(_1235, _1235, _1495);
    float _1509 = _1497 * _1435;
    float _1511 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[92].z, _1283);
    float _1513 = _1505 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1515 = fma(_1315, _1315, _1507);
    float _1517 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1321);
    float _1519 = -_1511;
    float _1521 = _1519 + 1.0;
    float _1523 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1325);
    float _1525 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1327);
    float _1527 = -_1517;
    float _1529 = _1527 + 1.0;
    float _1531 = rsqrt(_1515);
    float _1533 = _1513 * _1493;
    float _1535 = -_1521;
    float _1537 = fma(_1535, _1169, _1369);
    float _1539 = _1513;
    if (_1345)
    {
        _1539 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1541 = _1539;
    float _1543 = -_1523;
    float _1545 = _1543 + 1.0;
    float _1547 = -_1525;
    float _1549 = _1547 + 1.0;
    float _1551 = -_1529;
    float _1553 = fma(_1239, _1551, _1405);
    int _1555 = as_type<int>(_1541);
    if (_1345)
    {
        float _1557 = _1541 * 5.0;
        _1555 = as_type<int>(_1557);
    }
    int _1559 = _1555;
    float _1561 = fma(_1253, _1545, _1477);
    float _1563 = fma(_1419, _1549, _1449);
    float _1565 = fma(_909, (*spvDescriptorSet0.vp_c9)._m0[158].x, _1397);
    out.m_60.x = _1537;
    out.m_60.y = _1485;
    if (_1345)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4989 = as_type<float>(_1559);
        out.gl_Position.z = _4989;
    }
    float _1567 = _1209 * _1531;
    float _1569 = _1235 * _1531;
    out.m_62.x = _1553;
    out.m_62.y = _1561;
    out.m_62.z = _1509;
    out.m_62.w = _1533;
    out.m_64.x = _1501;
    out.m_64.y = _1563;
    out.m_66.x = _1565;
    if (_1345)
    {
        out.m_45.x = 0.0;
    }
    if (_1345)
    {
        return out;
    }
    float _1571 = -_1567;
    float _1573 = fma(_1571, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1183);
    float _1575 = _1315 * _1531;
    float _1577 = -_1569;
    float _1579 = fma(_1577, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1195);
    float _1581 = -_1567;
    float _1583 = fma(_1581, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1209);
    float _1585 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1587 = _1573 + _1585;
    float _1589 = -_1575;
    float _1591 = fma(_1589, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1231);
    float _1593 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1595 = _1579 + _1593;
    float _1597 = -_1569;
    float _1599 = fma(_1597, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1235);
    float _1601 = _1587 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1603 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1605 = _1591 + _1603;
    float _1607 = _1583 * _1583;
    float _1609 = -_1575;
    float _1611 = fma(_1609, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1315);
    float _1613 = fma(_1595, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1601);
    float _1615 = fma(_1599, _1599, _1607);
    float _1617 = fma(_1605, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1613);
    float _1619 = fma(_1611, _1611, _1615);
    bool _1621 = _1617 >= 0.0;
    float _1623 = sqrt(_1619);
    float _1625 = _1605;
    if (_1621)
    {
        _1625 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1627 = _1625;
    int _1629 = as_type<int>(_1627);
    if (_1621)
    {
        out.m_45.x = 0.0;
    }
    float _1631 = _1531 * _1623;
    if (_1621)
    {
        float _1633 = _1627 * 5.0;
        _1629 = as_type<int>(_1633);
    }
    int _1635 = _1629;
    if (_1621)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5141 = as_type<float>(_1635);
        out.gl_Position.z = _5141;
    }
    if (_1621)
    {
        return out;
    }
    float _1637 = _581 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1639 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _205);
    float _1641 = _579 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1643 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _195);
    float _1645 = _1631 * _1637;
    float _1647 = _1631 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1649 = _1647 * 0.5;
    float _1651 = _1631 * _1641;
    float _1653 = _1639 * _1645;
    float _1655 = _1643 * _1651;
    float _1657 = _1653 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1659 = _1653 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1661 = _1653 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1663 = fma(_1655, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1657);
    float _1665 = fma(_1655, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1659);
    float _1667 = fma(_1655, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1661);
    float _1669 = fma(_1649, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1663);
    float _1671 = fma(_1649, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1665);
    float _1673 = fma(_1649, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1667);
    float _1675 = _1669 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1677 = _1671 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1679 = _1673 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1681 = _1231 + _1675;
    float _1683 = _1195 + _1677;
    float _1685 = _1183 + _1679;
    float _1687 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1689 = _1681 + _1687;
    float _1691 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1693 = _1683 + _1691;
    float _1695 = _1689 * _1689;
    float _1697 = fma(_1693, _1693, _1695);
    float _1699 = sqrt(_1697);
    bool _1701 = _1699 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1703 = _1649;
    float _1705 = _1679;
    float _1707 = _1671;
    float _1709 = _1681;
    if (!_1701)
    {
        _1703 = _1683;
    }
    float _1711 = _1703;
    float _1713 = _1711;
    if (!_1701)
    {
        _1705 = _1681;
    }
    float _1715 = _1705;
    float _1717 = _1715;
    if (!_1701)
    {
        _1707 = _1685;
    }
    float _1719 = _1707;
    bool _1721 = !_1701;
    float _1723 = _1719;
    if (!_1721)
    {
        float _1725 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1727 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1729 = _1699 + _1727;
        float _1731 = rsqrt(_1697);
        float _1733 = _1729 * _1725;
        float _1735 = _1685 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1737 = _1733 * 0.15915493667125701904296875;
        float _1739 = _1737 * 6.283185482025146484375;
        float _1741 = sin(_1739);
        float _1743 = _1737 * 6.283185482025146484375;
        float _1745 = cos(_1743);
        float _1747 = fma(_1741, _1735, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1749 = _1731 * _1747;
        float _1751 = _1745 + (-1.0);
        float _1753 = fma(_1693, _1749, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1755 = fma(_1689, _1749, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1757 = _1751 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1759 = fma(_1685, _1745, _1757);
        _1723 = _1759;
        _1713 = _1753;
        _1717 = _1755;
        _1709 = _1737;
    }
    float _1761 = _1723;
    float _1763 = _1713;
    float _1765 = _1717;
    float _1767 = _1709;
    float _1769 = -_1183;
    float _1771 = _1769 + _1761;
    float _1773 = -_1195;
    float _1775 = _1773 + _1763;
    float _1777 = -_1231;
    float _1779 = _1777 + _1765;
    float _1781 = _1771 * _1771;
    float _1783 = fma(_1775, _1775, _1781);
    float _1785 = fma(_1779, _1779, _1783);
    float _1787 = sqrt(_1785);
    bool _1789 = _1787 > 0.0;
    bool _1791 = !_1789;
    float _1793 = _1783;
    float _1795 = _1767;
    float _1797 = _1761;
    float _1799 = _1763;
    float _1801 = _1765;
    if (!_1791)
    {
        bool _1803 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _1805 = _1787;
        if (_1803)
        {
            float _1807 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _1805 = _1807;
        }
        float _1809 = _1805;
        float _1811 = _1809;
        if (_1803)
        {
            float _1813 = _415 * _1809;
            _1793 = _1813;
        }
        float _1815 = _1793;
        float _1817 = _1815;
        if (_1803)
        {
            float _1819 = _417 * _1809;
            _1795 = _1819;
        }
        float _1821 = _1795;
        float _1823 = _1821;
        if (_1803)
        {
            float _1825 = _419 * _1809;
            _1811 = _1825;
        }
        float _1827 = _1811;
        float _1829 = _1827;
        float _1831 = _1827;
        if (!_1803)
        {
            float _1833 = _123 + 1.0;
            float _1835 = _1833;
            if (!_157)
            {
                float _1837 = _1833 * _1833;
                float _1839 = _1837 * 0.5;
                _1829 = _1839;
            }
            float _1841 = _1829;
            float _1843 = _1841;
            if (!_157)
            {
                float _1845 = _1841 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _1843 = _1845;
            }
            float _1847 = _1843;
            bool _1849 = !_157;
            float _1851 = _1847;
            if (!_1849)
            {
                float _1853 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1855 = log2(_1853);
                float _1857 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _1859 = _1857 + 1.0;
                float _1861 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1863 = _1855 * _1833;
                float _1865 = 1.0 / _1859;
                float _1867 = _1861 * 0.693147182464599609375;
                float _1869 = exp2(_1863);
                float _1871 = 1.0 / _1867;
                float _1873 = _1869 + (-1.0);
                float _1875 = -_1873;
                float _1877 = fma(_1875, _1871, _1833);
                float _1879 = _1877 * _1865;
                float _1881 = _1879 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _1851 = _1881;
            }
            float _1883 = _1851;
            float _1885 = _1883 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _1887 = _1883 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            bool _1889 = !_157;
            if (!_1889)
            {
                float _1891 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1893 = log2(_1891);
                float _1895 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _1897 = _1895 + 1.0;
                float _1899 = 1.0 / _1897;
                float _1901 = _1893 * _1833;
                float _1903 = exp2(_1901);
                float _1905 = -_1903;
                float _1907 = _1905 + 1.0;
                float _1909 = _1907 * _1899;
                _1835 = _1909;
            }
            float _1911 = _1835;
            float _1913 = fma(_1911, _161, _1887);
            float _1915 = _1883 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _1917 = fma(_1911, _159, _1885);
            float _1919 = -_377;
            float _1921 = _1919 + _1913;
            float _1923 = fma(_1911, _163, _1915);
            float _1925 = -_379;
            float _1927 = _1925 + _1917;
            float _1929 = _1921 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _1931 = _1921 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _1933 = _1921 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _1935 = -_383;
            float _1937 = _1935 + _1923;
            float _1939 = fma(_1927, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1929);
            float _1941 = fma(_1927, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1931);
            float _1943 = fma(_1927, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1933);
            float _1945 = fma(_1937, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1939);
            float _1947 = fma(_1937, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1941);
            float _1949 = fma(_1937, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1943);
            _423 = _1947;
            _425 = _1945;
            _427 = _1949;
            _1817 = _1945;
            _1823 = _1947;
            _1831 = _1949;
        }
        float _1951 = _423;
        float _1953 = _425;
        float _1955 = _427;
        float _1957 = _1817;
        float _1959 = _1823;
        float _1961 = _1831;
        float _1963 = _1951 * _1951;
        float _1965 = rsqrt(_1785);
        float _1967 = fma(_1953, _1953, _1963);
        float _1969 = fma(_1955, _1955, _1967);
        float _1971 = sqrt(_1969);
        float _1973 = _1775 * _1965;
        float _1975 = _1771 * _1965;
        float _1977 = _1779 * _1965;
        bool _1979 = _1971 > 0.0;
        bool _1981 = !_1979;
        if (!_1981)
        {
            float _1983 = rsqrt(_1969);
            float _1985 = _1983 * _1951;
            float _1987 = _1983 * _1953;
            float _1989 = _1983 * _1955;
            float _1991 = _1975 * _1985;
            float _1993 = fma(_1973, _1987, _1991);
            float _1995 = fma(_1977, _1989, _1993);
            float _1997 = _1995 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1999 = fma(_1957, _1997, _1763);
            float _2001 = fma(_1959, _1997, _1761);
            float _2003 = fma(_1961, _1997, _1765);
            _1797 = _2001;
            _1799 = _1999;
            _1801 = _2003;
        }
    }
    float _2005 = _1797;
    float _2007 = _1799;
    float _2009 = _1801;
    float _2011 = -_1567;
    float _2013 = fma(_2011, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2005);
    float _2015 = -_1569;
    float _2017 = fma(_2015, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2007);
    float _2019 = -_1575;
    float _2021 = fma(_2019, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2009);
    float _2023 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2025 = _2013 + _2023;
    float _2027 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2029 = _2017 + _2027;
    float _2031 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2033 = _2021 + _2031;
    float _2035 = _2025 * _2025;
    float _2037 = fma(_2029, _2029, _2035);
    float _2039 = fma(_2033, _2033, _2037);
    float _2041 = rsqrt(_2039);
    float _2043 = sqrt(_2039);
    float _2045 = _2041 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2047 = _2029 * _2045;
    float _2049 = _2033 * _2045;
    float _2051 = _2047 * _2047;
    float _2053 = _2049 * _2049;
    float _2055 = _2051 + _2053;
    float _2057 = sqrt(_2055);
    bool _2059 = _2057 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2061 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2063 = _2057 + _2061;
    float _2065 = _2041;
    float _2067 = _2007;
    float _2069 = _2063;
    float _2071 = _2009;
    float _2073 = _2025;
    float _2075 = _2045;
    if (_2059)
    {
        float _2077 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2065 = _2077;
    }
    float _2079 = _2065;
    if (_2059)
    {
        float _2081 = rsqrt(_2055);
        _2067 = _2081;
    }
    float _2083 = _2067;
    float _2085 = _2083;
    if (_2059)
    {
        float _2087 = _2063 * _2079;
        _2069 = _2087;
    }
    float _2089 = _2069;
    if (_2059)
    {
        float _2091 = _2089 * 0.15915493667125701904296875;
        _2071 = _2091;
    }
    float _2093 = _2071;
    float _2095 = _2079;
    float _2097 = _2093;
    if (_2059)
    {
        float _2099 = _2093 * 6.283185482025146484375;
        float _2101 = sin(_2099);
        _2095 = _2101;
    }
    float _2103 = _2095;
    float _2105 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2107 = precise::max(0.0, _2105);
    float _2109 = _2033;
    float _2111 = _2107;
    if (_2059)
    {
        float _2113 = _2093 * 6.283185482025146484375;
        float _2115 = cos(_2113);
        _2109 = _2115;
    }
    float _2117 = _2109;
    float _2119 = -_2045;
    float _2121 = -_2107;
    float _2123 = fma(_2025, _2119, _2121);
    if (_2059)
    {
        float _2125 = _2123 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2111 = _2125;
    }
    float _2127 = _2111;
    float _2129 = _2103;
    float _2131 = _2127;
    if (_2059)
    {
        float _2133 = fma(_2103, _2127, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2073 = _2133;
    }
    float _2135 = _2073;
    float _2137 = _2135;
    if (!_2059)
    {
        _2129 = _2047;
    }
    float _2139 = _2129;
    float _2141 = _2139;
    if (_2059)
    {
        float _2143 = _2117 + (-1.0);
        _2131 = _2143;
    }
    float _2145 = _2131;
    float _2147 = _2145;
    if (_2059)
    {
        float _2149 = _2083 * _2135;
        _2075 = _2149;
    }
    float _2151 = _2075;
    if (!_2059)
    {
        _2085 = _2123;
    }
    float _2153 = _2085;
    float _2155 = _2153;
    if (_2059)
    {
        float _2157 = _2145 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2097 = _2157;
    }
    float _2159 = _2097;
    float _2161 = _2159;
    if (_2059)
    {
        float _2163 = _2047 * _2151;
        _2141 = _2163;
    }
    float _2165 = _2141;
    if (!_2059)
    {
        _2137 = _2049;
    }
    float _2167 = _2137;
    float _2169 = _2167;
    if (_2059)
    {
        float _2171 = _2049 * _2151;
        _2169 = _2171;
    }
    float _2173 = _2169;
    if (_2059)
    {
        float _2175 = fma(_2123, _2117, _2159);
        _2155 = _2175;
    }
    float _2177 = _2155;
    if (!_2059)
    {
        _2161 = _2051;
    }
    float _2179 = _2161;
    float _2181 = _2179;
    if (_2059)
    {
        float _2183 = _2165 * _2165;
        _2181 = _2183;
    }
    float _2185 = _2181;
    float _2187 = _2013 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2189 = _2013 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2191 = _2013 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (!_2059)
    {
        _2147 = _2053;
    }
    float _2193 = _2147;
    float _2195 = _2013 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2197 = _2193;
    if (_2059)
    {
        float _2199 = _2173 * _2173;
        _2197 = _2199;
    }
    float _2201 = _2197;
    float _2203 = fma(_2177, _2177, _2185);
    float _2205 = fma(_2017, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2187);
    float _2207 = fma(_2017, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2189);
    float _2209 = fma(_2017, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2191);
    float _2211 = fma(_2017, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2195);
    float _2213 = _2203 + _2201;
    float _2215 = fma(_2021, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2207);
    float _2217 = fma(_2021, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2209);
    float _2219 = rsqrt(_2213);
    float _2221 = fma(_2021, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2205);
    float _2223 = _2215 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2225 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2227 = fma(_2043, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2225);
    float _2229 = precise::clamp(_2227, 0.0, 1.0);
    float _2231 = _2217 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2233 = _2221 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2235 = _2223 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2237 = -_2229;
    float _2239 = _2237 + 1.0;
    float _2241 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2243 = _2231 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2245 = fma(_2021, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2211);
    float _2247 = fma(_2233, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2235);
    float _2249 = -_2243;
    float _2251 = fma(_2249, _2241, 1.0);
    float _2253 = abs(_2239);
    float _2255 = log2(_2253);
    float _2257 = _2245 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2259 = fma(_2231, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2247);
    float _2261 = _2219 * _2165;
    float _2263 = _2219 * _2173;
    float _2265 = fma(_2257, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2259);
    float _2267 = _2219 * _2177;
    float _2269 = _2261 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2271 = log2(_2251);
    float _2273 = _2267 + 1.0;
    float _2275 = -_2269;
    float _2277 = fma(_2267, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2275);
    float _2279 = _2223 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2281 = -_2263;
    float _2283 = fma(_2281, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2277);
    float _2285 = _2255 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2287 = 1.0 / _2265;
    float _2289 = _2223 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2291 = fma(_2283, -0.5, 0.5);
    float _2293 = fma(_2283, 0.5, 0.5);
    float _2295 = fma(_2233, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2279);
    float _2297 = fma(_2233, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2289);
    float _2299 = fma(_2293, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2301 = exp2(_2285);
    float _2303 = fma(_2231, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2297);
    float _2305 = fma(_2231, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2295);
    float _2307 = fma(_2293, _2299, -0.212114393711090087890625);
    float _2309 = _2271 * 0.693147182464599609375;
    float _2311 = fma(_2257, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2303);
    float _2313 = fma(_2257, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2305);
    float _2315 = fma(_2293, _2307, 1.570728778839111328125);
    float _2317 = sqrt(_2291);
    float _2319 = _2311 * _2287;
    float _2321 = _2309 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2323 = fma(_2319, 0.5, 0.5);
    float _2325 = -_2267;
    float _2327 = fma(_2301, _2273, _2325);
    float _2329 = _2313 * _2287;
    float _2331 = fma(_2327, 0.5, 0.5);
    float _2333 = fma(_2329, -0.5, 0.5);
    float _2335 = _2317 * 0.636619746685028076171875;
    float _2337 = -_2315;
    float _2339 = fma(_2335, _2337, 1.0);
    float3 _6274 = float3(_2323, _2333, _2321);
    float _2341 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6274, float3(0.0), isnan(_6274)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6274, float3(0.0), isnan(_6274)), level(0.0)).x;
    float3 _6285 = float3(_2323, _2333, _2321);
    float4 _2344 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6285, float3(0.0), isnan(_6285)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6285, float3(0.0), isnan(_6285)), level(0.0)).xyzw;
    float _2346 = _2344.x;
    float _2348 = _2344.y;
    float _2350 = _2344.z;
    float _2352 = _2344.w;
    float2 _6302 = float2(_2339, _2331);
    float3 _2356 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6302, float2(0.0), isnan(_6302)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6302, float2(0.0), isnan(_6302)), level(0.0)).xyz;
    float _2358 = _2356.x;
    float _2360 = _2356.y;
    float _2362 = _2356.z;
    float _2364 = _1573 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2366 = _1573 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2368 = _2255 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _2370 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2372 = isnan(0.5);
    bool _2374 = _2370 || _2372;
    bool _2376 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2378 = _2374 || _2376;
    float _2380 = fma(_1579, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2364);
    float _2382 = fma(_1579, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2366);
    float _2384 = fma(_1591, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2380);
    float _2386 = fma(_1591, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2382);
    float _2388 = _2384 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2390 = _2386 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2392 = 1.0 / _2388;
    float _2394 = _2390 + _2388;
    float _2396 = _2394 * _2392;
    float _2398 = _2396 * 0.5;
    float _2400 = _2223 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2402 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2404 = fma(_2398, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2402);
    float _2406 = fma(_2233, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2400);
    float _2408 = _2398;
    float _2410 = _2406;
    if (_2378)
    {
        _2408 = 1.0;
    }
    float _2412 = _2408;
    float _2414 = exp2(_2368);
    float _2416 = fma(_2231, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2406);
    float _2418 = _2412;
    if (_2378)
    {
        _2410 = 1.0;
    }
    float _2420 = _2410;
    float _2422 = fma(_2257, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2416);
    float _2424 = 1.0 / _2404;
    float _2426 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2428 = _2424 * _2426;
    float _2430 = _2420;
    if (!_2378)
    {
        float _2432 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2434 = _2432 * 0.15915493667125701904296875;
        float _2436 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2438 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2440 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2438;
        float _2442 = _2434 * 6.283185482025146484375;
        float _2444 = cos(_2442);
        float _2446 = _2436 * 0.15915493667125701904296875;
        float _2448 = _2434 * 6.283185482025146484375;
        float _2450 = sin(_2448);
        float _2452 = 1.0 / _2444;
        float _2454 = _2446 * 6.283185482025146484375;
        float _2456 = cos(_2454);
        float _2458 = _2450 * _2452;
        float _2460 = _2446 * 6.283185482025146484375;
        float _2462 = sin(_2460);
        float _2464 = _2456 * _2458;
        float _2466 = 1.0 / _2440;
        float _2468 = 1.0 / _2464;
        float _2470 = _2462 * _2468;
        float _2472 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2474 = fma(_2428, _2470, _2472);
        float _2476 = _2474 * _2466;
        float _2478 = precise::clamp(_2476, 0.0, 1.0);
        _2430 = _2478;
    }
    float _2480 = _2430;
    if (!_2378)
    {
        float _2482 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2484 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2486 = _2482 * 0.15915493667125701904296875;
        float _2488 = _2484 * 0.15915493667125701904296875;
        float _2490 = _2486 * 6.283185482025146484375;
        float _2492 = cos(_2490);
        float _2494 = _2486 * 6.283185482025146484375;
        float _2496 = sin(_2494);
        float _2498 = 1.0 / _2492;
        float _2500 = _2488 * 6.283185482025146484375;
        float _2502 = cos(_2500);
        float _2504 = _2496 * _2498;
        float _2506 = _2488 * 6.283185482025146484375;
        float _2508 = sin(_2506);
        float _2510 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2512 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2510;
        float _2514 = _2502 * _2504;
        float _2516 = 1.0 / _2512;
        float _2518 = 1.0 / _2514;
        float _2520 = _2508 * _2518;
        float _2522 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2524 = fma(_2428, _2520, _2522);
        float _2526 = _2524 * _2516;
        float _2528 = precise::clamp(_2526, 0.0, 1.0);
        float _2530 = -_2528;
        float _2532 = _2530 + 1.0;
        _2418 = _2532;
    }
    float _2534 = _2418;
    float _2536 = _2480 * _2534;
    float _2538 = -_2414;
    float _2540 = _2538 + 1.0;
    bool _2542 = _2480 > 0.0;
    bool _2544 = isnan(_2480);
    bool _2546 = _2542 || _2544;
    bool _2548 = isnan(0.0);
    bool _2550 = _2546 || _2548;
    float _2552 = _2422 + _2265;
    float _2554 = _2536 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _2556 = _2534 <= 0.0;
    bool _2558 = !_2550;
    bool _2560 = _2556 || _2558;
    float _2562 = _2554 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2564 = _2540 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2566 = _2552 * 0.5;
    out.gl_Position.x = _2311;
    out.gl_Position.y = _2313;
    out.gl_Position.z = _2422;
    out.gl_Position.w = _2265;
    float _2568 = _2564 * _2341;
    float _2570 = -_2564;
    float _2572 = _2570 + 1.0;
    out.m_68.z = _2566;
    out.m_68.w = _2265;
    float _2574 = _2352 * _2568;
    float _2576 = _2362 * _2568;
    out.m_45.x = _2562;
    float _2578 = fma(_2358, _2574, _2346);
    float _2580 = fma(_2360, _2574, _2348);
    float _2582 = _2352 * _2572;
    float _2584 = fma(_2352, _2576, _2350);
    out.m_70.x = _2578;
    out.m_70.y = _2580;
    out.m_70.z = _2584;
    out.m_70.w = _2582;
    if (!_2560)
    {
        return out;
    }
    float _2586 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_45.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2586;
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
        float _2643 = as_type<float>(_105);
        out.gl_Position.z = _2643;
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
    if (_119)
    {
        float _125 = float(_89);
        _99 = _125;
    }
    float _127 = _99;
    bool _129 = _123 >= _127;
    bool _131 = !_119;
    bool _133 = _129 || _131;
    float _135 = _127;
    if (_133)
    {
        _135 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _137 = _135;
    if (_133)
    {
        out.m_45.x = 0.0;
    }
    if (_133)
    {
        float _139 = _137 * 5.0;
        _107 = as_type<int>(_139);
    }
    int _141 = _107;
    if (_133)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2712 = as_type<float>(_141);
        out.gl_Position.z = _2712;
    }
    if (_133)
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
    int _171 = as_type<int>(_143) & 1;
    bool _173 = _171 != 0;
    int _175 = as_type<int>(_143) & 2;
    bool _177 = _175 != 0;
    float _179 = _143;
    float _181 = _145;
    bool _183 = false;
    bool _185 = false;
    if (!_157)
    {
        float _187 = _145 * _145;
        float _189 = _187 * 0.5;
        _179 = _189;
    }
    float _191 = _179;
    bool _193 = !_173;
    float _195 = _193 ? (-0.5) : 0.5;
    float _197 = _191;
    if (!_157)
    {
        float _199 = _191 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _197 = _199;
    }
    float _201 = _197;
    bool _203 = !_177;
    float _205 = _203 ? (-0.5) : 0.5;
    bool _207 = !_157;
    float _209 = _201;
    float _211 = 0.0;
    float _213 = 0.0;
    if (!_207)
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
        _209 = _243;
        _211 = _227;
        _213 = _231;
    }
    float _245 = _209;
    float _247 = _211;
    float _249 = _213;
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
        _181 = _277;
        _253 = _265;
    }
    float _279 = _181;
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
    float _389 = -_379;
    float _391 = _299 + _389;
    float _393 = fma(_299, _147, _165);
    float _395 = -_383;
    float _397 = _381 + _395;
    float _399 = _387 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _401 = _387 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _403 = _387 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _405 = fma(_301, _147, _167);
    float _407 = fma(_391, (*spvDescriptorSet0.vp_c10)._m0[4].x, _399);
    float _409 = fma(_391, (*spvDescriptorSet0.vp_c10)._m0[5].x, _401);
    float _411 = fma(_391, (*spvDescriptorSet0.vp_c10)._m0[6].x, _403);
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
    float _477 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _479 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _477;
    float _481 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _483 = _481 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _485 = -_471;
    float _487 = _485 + 1.0;
    float _489 = in.m_52.x;
    float _491 = in.m_52.y;
    bool _493 = _455 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _495 = isnan(_455);
    bool _497 = _493 || _495;
    bool _499 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _501 = _497 || _499;
    float _503 = float(_501);
    float _505 = 1.0 / _479;
    bool _507 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _509 = 1.0 / _483;
    float _511 = _459 * _505;
    bool _513 = _455 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _515 = isnan(_455);
    bool _517 = _513 || _515;
    bool _519 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _521 = _517 || _519;
    float _523 = float(_521);
    float _525 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _527 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _525;
    float _529 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _531 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _529;
    float _533 = _523 * _487;
    float _535 = -_523;
    float _537 = _535 + 1.0;
    float _539 = _475 * _509;
    float _541 = fma(_527, _511, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _543 = fma(_531, _511, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _545 = _503 * _537;
    float _547 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _549 = _547 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _551 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _553 = _551 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _555 = -_503;
    float _557 = _555 + 1.0;
    float _559 = _541 * _545;
    float _561 = _543 * _545;
    float _563 = fma(_549, _539, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _565 = fma(_553, _539, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _567 = fma(_557, (*spvDescriptorSet0.vp_c9)._m0[143].x, _559);
    float _569 = fma(_557, (*spvDescriptorSet0.vp_c9)._m0[143].y, _561);
    float _571 = fma(_563, _533, _567);
    float _573 = fma(_565, _533, _569);
    float _575 = fma(_471, (*spvDescriptorSet0.vp_c9)._m0[145].x, _571);
    float _577 = fma(_471, (*spvDescriptorSet0.vp_c9)._m0[145].y, _573);
    float _579 = _575 * _489;
    float _581 = _577 * _491;
    bool _583 = !_507;
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
    float _623 = _405 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _625 = _405 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _627 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _629 = _627 + (*spvDescriptorSet0.vp_c9)._m0[156].w;
    int _631 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _633 = _631 != 0;
    float _635 = _405 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _637 = 1.0 / _629;
    float _639 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _641 = _639 + (*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _643 = fma(_393, (*spvDescriptorSet0.vp_c10)._m0[5].x, _625);
    float _645 = fma(_393, (*spvDescriptorSet0.vp_c10)._m0[4].x, _623);
    float _647 = fma(_393, (*spvDescriptorSet0.vp_c10)._m0[6].x, _635);
    float _649 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _651 = _649 + (*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _653 = 1.0 / _641;
    float _655 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _657 = _655 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _659 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _661 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _663 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _665 = fma(_413, (*spvDescriptorSet0.vp_c10)._m0[4].z, _645);
    float _667 = fma(_413, (*spvDescriptorSet0.vp_c10)._m0[5].z, _643);
    float _669 = -(*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _671 = (*spvDescriptorSet0.vp_c9)._m0[156].x + _669;
    float _673 = 1.0 / _651;
    float _675 = fma(_413, (*spvDescriptorSet0.vp_c10)._m0[6].z, _647);
    float _677 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _679 = _677 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _681 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _683 = _681 + (*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _685 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _687 = _659 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _689 = _661 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _691 = _663 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _693 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _695 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _693;
    float _697 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _699 = _697 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _701 = 1.0 / _657;
    float _703 = _671 * _637;
    float _705 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _707 = _705 + (*spvDescriptorSet0.vp_c9)._m0[153].w;
    out.m_56.x = _687;
    out.m_56.y = _689;
    out.m_56.z = _691;
    out.m_56.w = _685;
    float _709 = -(*spvDescriptorSet0.vp_c9)._m0[156].x;
    float _711 = _709 + (*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _713 = 1.0 / _679;
    int _715 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _717 = _715 != 0;
    float _719 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _721 = _619 + _719;
    int _723 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _725 = _723 != 0;
    float _727 = 1.0 / _683;
    float _729 = _695 * _701;
    float _731 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _733 = _731 + (*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _735 = -(*spvDescriptorSet0.vp_c9)._m0[151].x;
    float _737 = (*spvDescriptorSet0.vp_c9)._m0[152].x + _735;
    float _739 = -(*spvDescriptorSet0.vp_c9)._m0[152].x;
    float _741 = _739 + (*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _743 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _745 = _619 + _743;
    float _747 = (*spvDescriptorSet0.vp_c9)._m0[152].x;
    if (_717)
    {
        float _749 = in.m_54.x;
        _747 = _749;
    }
    float _751 = _747;
    float _753 = _737 * _653;
    float _755 = 1.0 / _707;
    float _757 = -(*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _759 = (*spvDescriptorSet0.vp_c9)._m0[154].x + _757;
    float _761 = -(*spvDescriptorSet0.vp_c9)._m0[154].x;
    float _763 = _761 + (*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _765 = _699 * _713;
    float _767 = _759 * _673;
    float _769 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _771 = _769 + (*spvDescriptorSet0.vp_c9)._m0[158].w;
    float _773 = -(*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _775 = (*spvDescriptorSet0.vp_c9)._m0[158].x + _773;
    float _777 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _779 = _621 + _777;
    float _781 = _763 * _727;
    float _783 = 1.0 / _733;
    float _785 = in.m_54.w;
    float _787 = fma(_729, _779, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _789 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _791 = _621 + _789;
    float _793 = _741 * _755;
    float _795 = fma(_765, _791, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _797 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _799 = _619 + _797;
    float _801 = fma(_753, _745, (*spvDescriptorSet0.vp_c9)._m0[151].x);
    float _803 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _805 = _619 + _803;
    bool _807 = _619 >= (*spvDescriptorSet0.vp_c9)._m0[157].w;
    bool _809 = isnan(_619);
    bool _811 = _807 || _809;
    bool _813 = isnan((*spvDescriptorSet0.vp_c9)._m0[157].w);
    bool _815 = _811 || _813;
    float _817 = float(_815);
    float _819 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _821 = _619 + _819;
    float _823 = fma(_767, _799, (*spvDescriptorSet0.vp_c9)._m0[153].x);
    float _825 = fma(_793, _805, (*spvDescriptorSet0.vp_c9)._m0[152].x);
    bool _827 = _619 >= (*spvDescriptorSet0.vp_c9)._m0[156].w;
    bool _829 = isnan(_619);
    bool _831 = _827 || _829;
    bool _833 = isnan((*spvDescriptorSet0.vp_c9)._m0[156].w);
    bool _835 = _831 || _833;
    float _837 = float(_835);
    float _839 = fma(_781, _821, (*spvDescriptorSet0.vp_c9)._m0[154].x);
    float _841 = -_817;
    float _843 = _841 + 1.0;
    bool _845 = _619 >= (*spvDescriptorSet0.vp_c9)._m0[155].w;
    bool _847 = isnan(_619);
    bool _849 = _845 || _847;
    bool _851 = isnan((*spvDescriptorSet0.vp_c9)._m0[155].w);
    bool _853 = _849 || _851;
    float _855 = float(_853);
    float _857 = 1.0 / _771;
    float _859 = -_837;
    float _861 = _859 + 1.0;
    float _863 = _837 * _843;
    bool _865 = _619 >= (*spvDescriptorSet0.vp_c9)._m0[154].w;
    bool _867 = isnan(_619);
    bool _869 = _865 || _867;
    bool _871 = isnan((*spvDescriptorSet0.vp_c9)._m0[154].w);
    bool _873 = _869 || _871;
    float _875 = float(_873);
    float _877 = -_855;
    float _879 = _877 + 1.0;
    float _881 = _855 * _861;
    bool _883 = _619 >= (*spvDescriptorSet0.vp_c9)._m0[153].w;
    bool _885 = isnan(_619);
    bool _887 = _883 || _885;
    bool _889 = isnan((*spvDescriptorSet0.vp_c9)._m0[153].w);
    bool _891 = _887 || _889;
    float _893 = float(_891);
    float _895 = _711 * _783;
    float _897 = _875 * _879;
    bool _899 = _619 >= (*spvDescriptorSet0.vp_c9)._m0[158].w;
    bool _901 = isnan(_619);
    bool _903 = _899 || _901;
    bool _905 = isnan((*spvDescriptorSet0.vp_c9)._m0[158].w);
    bool _907 = _903 || _905;
    float _909 = float(_907);
    float _911 = -_875;
    float _913 = _911 + 1.0;
    float _915 = _875;
    if (_717)
    {
        float _917 = _751 * 3.1415927410125732421875;
        _915 = _917;
    }
    float _919 = _915;
    bool _921 = _785 > 0.5;
    float _923 = _785;
    if (_725)
    {
        float _925 = _785 * 3.1415927410125732421875;
        _923 = _925;
    }
    float _927 = _923;
    float _929 = -_909;
    float _931 = _929 + 1.0;
    float _933 = _893 * _913;
    float _935 = 0.0;
    float _937 = _927;
    if (_717)
    {
        float _939 = _919 * 0.15915493667125701904296875;
        _935 = _939;
    }
    float _941 = _935;
    float _943 = -_893;
    float _945 = _943 + 1.0;
    float _947 = _817 * _931;
    float _949 = _893;
    float _951 = _919;
    if (_633)
    {
        float _953 = in.m_54.x;
        float _955 = in.m_54.y;
        _949 = _953;
        _951 = _955;
    }
    float _957 = _949;
    float _959 = _951;
    bool _961 = _621 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _963 = isnan(_621);
    bool _965 = _961 || _963;
    bool _967 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _969 = _965 || _967;
    float _971 = float(_969);
    if (_725)
    {
        float _973 = _927 * 0.15915493667125701904296875;
        _937 = _973;
    }
    float _975 = _937;
    float _977 = _775 * _857;
    bool _979 = _621 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _981 = isnan(_621);
    bool _983 = _979 || _981;
    bool _985 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _987 = _983 || _985;
    float _989 = float(_987);
    float _991 = _941;
    if (_717)
    {
        float _993 = _941 * 6.283185482025146484375;
        float _995 = sin(_993);
        _991 = _995;
    }
    float _997 = _991;
    bool _999 = _619 >= (*spvDescriptorSet0.vp_c9)._m0[152].w;
    bool _1001 = isnan(_619);
    bool _1003 = _999 || _1001;
    bool _1005 = isnan((*spvDescriptorSet0.vp_c9)._m0[152].w);
    bool _1007 = _1003 || _1005;
    float _1009 = float(_1007);
    float _1011 = -_971;
    float _1013 = _1011 + 1.0;
    bool _1015 = _621 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1017 = isnan(_621);
    bool _1019 = _1015 || _1017;
    bool _1021 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1023 = _1019 || _1021;
    float _1025 = float(_1023);
    float _1027 = fma(_895, _721, (*spvDescriptorSet0.vp_c9)._m0[156].x);
    bool _1029 = _619 >= (*spvDescriptorSet0.vp_c9)._m0[151].w;
    bool _1031 = isnan(_619);
    bool _1033 = _1029 || _1031;
    bool _1035 = isnan((*spvDescriptorSet0.vp_c9)._m0[151].w);
    bool _1037 = _1033 || _1035;
    float _1039 = float(_1037);
    float _1041 = _989 * _1013;
    float _1043 = -_989;
    float _1045 = _1043 + 1.0;
    float _1047 = _975;
    float _1049 = _1045;
    if (_725)
    {
        float _1051 = _975 * 6.283185482025146484375;
        float _1053 = sin(_1051);
        _1047 = _1053;
    }
    float _1055 = _1047;
    float _1057 = -_1009;
    float _1059 = _1057 + 1.0;
    float _1061 = _1009 * _945;
    float _1063 = _1025 * _1045;
    float _1065 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1067 = _619 + _1065;
    float _1069 = _1039 * _1059;
    float _1071 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1073 = _619 + _1071;
    float _1075 = _787 * _1063;
    float _1077 = -_1025;
    float _1079 = _1077 + 1.0;
    float _1081 = _801 * _1069;
    float _1083 = -_1039;
    float _1085 = _1083 + 1.0;
    float _1087 = _1079;
    int _1089 = as_type<int>(_1073);
    float _1091 = _1081;
    float _1093 = _1075;
    if (_717)
    {
        bool _1095 = _997 > 0.5;
        _183 = _1095;
    }
    bool _1097 = _183;
    float _1099 = fma(_977, _1073, (*spvDescriptorSet0.vp_c9)._m0[157].x);
    float _1101 = fma(_1079, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1075);
    float _1103 = fma(_1085, (*spvDescriptorSet0.vp_c9)._m0[151].x, _1081);
    float _1105 = fma(_703, _1067, (*spvDescriptorSet0.vp_c9)._m0[155].x);
    if (_725)
    {
        bool _1107 = _1055 > 0.5;
        _185 = _1107;
    }
    bool _1109 = _185;
    if (!_725)
    {
        _1087 = _195;
    }
    float _1111 = _1087;
    float _1113 = _1111;
    if (_633)
    {
        _1089 = 0;
    }
    int _1115 = _1089;
    float _1117 = _957;
    float _1119 = _959;
    int _1121 = _1115;
    if (_633)
    {
        _1049 = _957;
    }
    float _1123 = _1049;
    float _1125 = _1123;
    if (_633)
    {
        _1091 = _959;
    }
    float _1127 = _1091;
    float _1129 = _1127;
    if (!_633)
    {
        float _1131 = in.m_54.x;
        float _1133 = in.m_54.y;
        float _1135 = _1131 * 3.1415927410125732421875;
        float _1137 = _1135 * 0.15915493667125701904296875;
        float _1139 = _1133 * 3.1415927410125732421875;
        float _1141 = _1139 * 0.15915493667125701904296875;
        float _1143 = _1137 * 6.283185482025146484375;
        float _1145 = sin(_1143);
        float _1147 = _1141 * 6.283185482025146484375;
        float _1149 = sin(_1147);
        _1117 = _1131;
        _1119 = _1133;
        _1121 = 2;
        _1129 = _1149;
        _1125 = _1145;
    }
    float _1151 = _1117;
    float _1153 = _1119;
    int _1155 = _1121;
    float _1157 = _1129;
    float _1159 = _1125;
    float _1161 = fma(_825, _1061, _1103);
    float _1163 = _1161;
    if (_725)
    {
        float _1165 = -_195;
        float _1167 = _1109 ? _1165 : _195;
        _1113 = _1167;
    }
    float _1169 = _1113;
    float _1171 = in.m_54.z;
    bool _1173 = _1151 > 0.5;
    float _1175 = fma(_795, _1041, _1101);
    bool _1177 = _1153 > 0.5;
    float _1179 = _1153 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    if (!_717)
    {
        _1093 = _205;
    }
    float _1181 = _1093;
    float _1183 = _667 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1185 = fma(_971, (*spvDescriptorSet0.vp_c9)._m0[117].x, _1175);
    float _1187 = _1181;
    if (_717)
    {
        float _1189 = -_205;
        float _1191 = _1097 ? _1189 : _205;
        _1187 = _1191;
    }
    float _1193 = _1187;
    float _1195 = _665 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _1197 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1199 = _1197 != 0;
    float _1201 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    float _1203 = -_195;
    int _1205 = _1173 ? as_type<int>(_1203) : as_type<int>(_195);
    float _1207 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1209 = _1183 + _1207;
    bool _1211 = _1155 != 2;
    float _1213 = fma(_1157, (*spvDescriptorSet0.vp_c9)._m0[93].w, _1201);
    int _1215 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1217 = _1215 != 0;
    float _1219 = _1157 * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    float _1221 = -_205;
    int _1223 = _1177 ? as_type<int>(_1221) : as_type<int>(_205);
    float _1225 = fma(_823, _933, _1161);
    int _1227 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1229 = _1227 != 0;
    float _1231 = _675 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1233 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1235 = _1195 + _1233;
    bool _1237 = !_1199;
    float _1239 = _1237 ? _195 : as_type<float>(_1205);
    float _1241 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1243 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1245 = -_195;
    int _1247 = _1177 ? as_type<int>(_1245) : as_type<int>(_195);
    float _1249 = fma(_839, _897, _1225);
    bool _1251 = !_1217;
    float _1253 = _1251 ? _205 : as_type<float>(_1223);
    float _1255 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    int _1257 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1259 = _1257 != 0;
    int _1261 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1263 = _1261 != 0;
    int _1265 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1267 = _1265 != 0;
    float _1269 = fma(_1179, -2.0, _1243);
    float _1271 = fma(_1219, -2.0, _1255);
    float _1273 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    bool _1275 = !_1263;
    float _1277 = _1275 ? _195 : as_type<float>(_1247);
    float _1279 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    float _1281 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1283 = fma(_1159, (*spvDescriptorSet0.vp_c9)._m0[93].z, _1279);
    float _1285 = _1151 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1287 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1289 = _1285;
    if (_1211)
    {
        _1163 = _1151;
    }
    float _1291 = _1163;
    float _1293 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _1295 = _1171 > 0.5;
    float _1297 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1299 = _1291;
    if (!_1211)
    {
        _1299 = _1171;
    }
    float _1301 = _1299;
    float _1303 = _1209 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1305 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1307 = _1159 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    float _1309 = -_1281;
    float _1311 = fma(_1285, 2.0, _1309);
    float _1313 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1315 = _1231 + _1313;
    float _1317 = fma(_1235, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1303);
    if (_1211)
    {
        _1289 = _1153;
    }
    float _1319 = _1289;
    float _1321 = fma(_1151, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1287);
    float _1323 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    float _1325 = fma(_1153, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1293);
    float _1327 = fma(_1153, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1305);
    float _1329 = fma(_1151, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1297);
    float _1331 = _1319;
    if (!_1211)
    {
        _1331 = _1151;
    }
    float _1333 = _1331;
    float _1335 = fma(_1315, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1317);
    float _1337 = -_1323;
    float _1339 = fma(_1307, 2.0, _1337);
    float _1341 = _1273 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    float _1343 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    bool _1345 = _1335 >= 0.0;
    float _1347 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1349 = _1169 + 0.5;
    float _1351 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1353 = -_123;
    float _1355 = fma(_1353, (*spvDescriptorSet0.vp_c9)._m0[91].x, _1339);
    float _1357 = _1343 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1359 = _1347 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1361 = _1351 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1363 = _1185 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1365 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1367 = fma(_1105, _881, _1249);
    float _1369 = fma(_1341, _1349, _1355);
    float _1371 = _1241 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1373 = -_123;
    float _1375 = fma(_1373, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1311);
    float _1377 = _1239 + 0.5;
    out.m_58.x = _1357;
    out.m_58.y = _1359;
    out.m_58.z = _1361;
    out.m_58.w = _1363;
    float _1379 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    float _1381 = _1301 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1383 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1385 = fma(_1027, _863, _1367);
    float _1387 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[91].y, _1271);
    float _1389 = _1193 + (-0.5);
    float _1391 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1393 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1395 = _1365 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1397 = fma(_1099, _947, _1385);
    float _1399 = -_1391;
    float _1401 = fma(_1381, 2.0, _1399);
    float _1403 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[92].w, _1213);
    float _1405 = fma(_1371, _1377, _1375);
    float _1407 = -_205;
    int _1409 = _1295 ? as_type<int>(_1407) : as_type<int>(_205);
    float _1411 = _1333 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1413 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1415 = _1379 * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    bool _1417 = !_1267;
    float _1419 = _1417 ? _205 : as_type<float>(_1409);
    float _1421 = fma(_1411, -2.0, _1383);
    float _1423 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1269);
    float _1425 = _1253 + (-0.5);
    float _1427 = -_205;
    int _1429 = _921 ? as_type<int>(_1427) : as_type<int>(_205);
    float _1431 = _1419 + (-0.5);
    float _1433 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1421);
    float _1435 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1437 = _1393 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1439 = -_1415;
    float _1441 = -_1387;
    float _1443 = fma(_1439, _1389, _1441);
    float _1445 = -_1395;
    float _1447 = -_1433;
    float _1449 = fma(_1445, _1431, _1447);
    float _1451 = -_195;
    int _1453 = _1295 ? as_type<int>(_1451) : as_type<int>(_195);
    float _1455 = _1277 + 0.5;
    float _1457 = -_123;
    float _1459 = fma(_1457, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1401);
    float _1461 = _1413 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    bool _1463 = !_1259;
    float _1465 = _1463 ? _195 : as_type<float>(_1453);
    float _1467 = -_1403;
    float _1469 = _1467 + 1.0;
    float _1471 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1329);
    float _1473 = -_1437;
    float _1475 = -_1423;
    float _1477 = fma(_1473, _1425, _1475);
    bool _1479 = !_1229;
    float _1481 = _1479 ? _205 : as_type<float>(_1429);
    float _1483 = fma(_1461, _1455, _1459);
    float _1485 = fma(_1469, _1193, _1443);
    float _1487 = _1465 + 0.5;
    float _1489 = -_1471;
    float _1491 = _1489 + 1.0;
    float _1493 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1495 = _1209 * _1209;
    float _1497 = _1487 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1499 = -_1491;
    float _1501 = fma(_1277, _1499, _1483);
    float _1503 = -_1481;
    float _1505 = _1503 + 0.5;
    float _1507 = fma(_1235, _1235, _1495);
    float _1509 = _1497 * _1435;
    float _1511 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[92].z, _1283);
    float _1513 = _1505 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1515 = fma(_1315, _1315, _1507);
    float _1517 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1321);
    float _1519 = -_1511;
    float _1521 = _1519 + 1.0;
    float _1523 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1325);
    float _1525 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1327);
    float _1527 = -_1517;
    float _1529 = _1527 + 1.0;
    float _1531 = rsqrt(_1515);
    float _1533 = _1513 * _1493;
    float _1535 = -_1521;
    float _1537 = fma(_1535, _1169, _1369);
    float _1539 = _1513;
    if (_1345)
    {
        _1539 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1541 = _1539;
    float _1543 = -_1523;
    float _1545 = _1543 + 1.0;
    float _1547 = -_1525;
    float _1549 = _1547 + 1.0;
    float _1551 = -_1529;
    float _1553 = fma(_1239, _1551, _1405);
    int _1555 = as_type<int>(_1541);
    if (_1345)
    {
        float _1557 = _1541 * 5.0;
        _1555 = as_type<int>(_1557);
    }
    int _1559 = _1555;
    float _1561 = fma(_1253, _1545, _1477);
    float _1563 = fma(_1419, _1549, _1449);
    float _1565 = fma(_909, (*spvDescriptorSet0.vp_c9)._m0[158].x, _1397);
    out.m_60.x = _1537;
    out.m_60.y = _1485;
    if (_1345)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4989 = as_type<float>(_1559);
        out.gl_Position.z = _4989;
    }
    float _1567 = _1209 * _1531;
    float _1569 = _1235 * _1531;
    out.m_62.x = _1553;
    out.m_62.y = _1561;
    out.m_62.z = _1509;
    out.m_62.w = _1533;
    out.m_64.x = _1501;
    out.m_64.y = _1563;
    out.m_66.x = _1565;
    if (_1345)
    {
        out.m_45.x = 0.0;
    }
    if (_1345)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1571 = -_1567;
    float _1573 = fma(_1571, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1183);
    float _1575 = _1315 * _1531;
    float _1577 = -_1569;
    float _1579 = fma(_1577, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1195);
    float _1581 = -_1567;
    float _1583 = fma(_1581, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1209);
    float _1585 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1587 = _1573 + _1585;
    float _1589 = -_1575;
    float _1591 = fma(_1589, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1231);
    float _1593 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1595 = _1579 + _1593;
    float _1597 = -_1569;
    float _1599 = fma(_1597, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1235);
    float _1601 = _1587 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1603 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1605 = _1591 + _1603;
    float _1607 = _1583 * _1583;
    float _1609 = -_1575;
    float _1611 = fma(_1609, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1315);
    float _1613 = fma(_1595, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1601);
    float _1615 = fma(_1599, _1599, _1607);
    float _1617 = fma(_1605, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1613);
    float _1619 = fma(_1611, _1611, _1615);
    bool _1621 = _1617 >= 0.0;
    float _1623 = sqrt(_1619);
    float _1625 = _1605;
    if (_1621)
    {
        _1625 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1627 = _1625;
    int _1629 = as_type<int>(_1627);
    if (_1621)
    {
        out.m_45.x = 0.0;
    }
    float _1631 = _1531 * _1623;
    if (_1621)
    {
        float _1633 = _1627 * 5.0;
        _1629 = as_type<int>(_1633);
    }
    int _1635 = _1629;
    if (_1621)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5141 = as_type<float>(_1635);
        out.gl_Position.z = _5141;
    }
    if (_1621)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1637 = _581 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1639 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _205);
    float _1641 = _579 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1643 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _195);
    float _1645 = _1631 * _1637;
    float _1647 = _1631 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1649 = _1647 * 0.5;
    float _1651 = _1631 * _1641;
    float _1653 = _1639 * _1645;
    float _1655 = _1643 * _1651;
    float _1657 = _1653 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1659 = _1653 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1661 = _1653 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1663 = fma(_1655, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1657);
    float _1665 = fma(_1655, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1659);
    float _1667 = fma(_1655, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1661);
    float _1669 = fma(_1649, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1663);
    float _1671 = fma(_1649, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1665);
    float _1673 = fma(_1649, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1667);
    float _1675 = _1669 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1677 = _1671 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1679 = _1673 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1681 = _1231 + _1675;
    float _1683 = _1195 + _1677;
    float _1685 = _1183 + _1679;
    float _1687 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1689 = _1681 + _1687;
    float _1691 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1693 = _1683 + _1691;
    float _1695 = _1689 * _1689;
    float _1697 = fma(_1693, _1693, _1695);
    float _1699 = sqrt(_1697);
    bool _1701 = _1699 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1703 = _1649;
    float _1705 = _1679;
    float _1707 = _1671;
    float _1709 = _1681;
    if (!_1701)
    {
        _1703 = _1683;
    }
    float _1711 = _1703;
    float _1713 = _1711;
    if (!_1701)
    {
        _1705 = _1681;
    }
    float _1715 = _1705;
    float _1717 = _1715;
    if (!_1701)
    {
        _1707 = _1685;
    }
    float _1719 = _1707;
    bool _1721 = !_1701;
    float _1723 = _1719;
    if (!_1721)
    {
        float _1725 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1727 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1729 = _1699 + _1727;
        float _1731 = rsqrt(_1697);
        float _1733 = _1729 * _1725;
        float _1735 = _1685 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1737 = _1733 * 0.15915493667125701904296875;
        float _1739 = _1737 * 6.283185482025146484375;
        float _1741 = sin(_1739);
        float _1743 = _1737 * 6.283185482025146484375;
        float _1745 = cos(_1743);
        float _1747 = fma(_1741, _1735, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1749 = _1731 * _1747;
        float _1751 = _1745 + (-1.0);
        float _1753 = fma(_1693, _1749, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1755 = fma(_1689, _1749, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1757 = _1751 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1759 = fma(_1685, _1745, _1757);
        _1723 = _1759;
        _1713 = _1753;
        _1717 = _1755;
        _1709 = _1737;
    }
    float _1761 = _1723;
    float _1763 = _1713;
    float _1765 = _1717;
    float _1767 = _1709;
    float _1769 = -_1183;
    float _1771 = _1769 + _1761;
    float _1773 = -_1195;
    float _1775 = _1773 + _1763;
    float _1777 = -_1231;
    float _1779 = _1777 + _1765;
    float _1781 = _1771 * _1771;
    float _1783 = fma(_1775, _1775, _1781);
    float _1785 = fma(_1779, _1779, _1783);
    float _1787 = sqrt(_1785);
    bool _1789 = _1787 > 0.0;
    bool _1791 = !_1789;
    float _1793 = _1783;
    float _1795 = _1767;
    float _1797 = _1761;
    float _1799 = _1763;
    float _1801 = _1765;
    if (!_1791)
    {
        bool _1803 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _1805 = _1787;
        if (_1803)
        {
            float _1807 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _1805 = _1807;
        }
        float _1809 = _1805;
        float _1811 = _1809;
        if (_1803)
        {
            float _1813 = _415 * _1809;
            _1793 = _1813;
        }
        float _1815 = _1793;
        float _1817 = _1815;
        if (_1803)
        {
            float _1819 = _417 * _1809;
            _1795 = _1819;
        }
        float _1821 = _1795;
        float _1823 = _1821;
        if (_1803)
        {
            float _1825 = _419 * _1809;
            _1811 = _1825;
        }
        float _1827 = _1811;
        float _1829 = _1827;
        float _1831 = _1827;
        if (!_1803)
        {
            float _1833 = _123 + 1.0;
            float _1835 = _1833;
            if (!_157)
            {
                float _1837 = _1833 * _1833;
                float _1839 = _1837 * 0.5;
                _1829 = _1839;
            }
            float _1841 = _1829;
            float _1843 = _1841;
            if (!_157)
            {
                float _1845 = _1841 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _1843 = _1845;
            }
            float _1847 = _1843;
            bool _1849 = !_157;
            float _1851 = _1847;
            if (!_1849)
            {
                float _1853 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1855 = log2(_1853);
                float _1857 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _1859 = _1857 + 1.0;
                float _1861 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1863 = _1855 * _1833;
                float _1865 = 1.0 / _1859;
                float _1867 = _1861 * 0.693147182464599609375;
                float _1869 = exp2(_1863);
                float _1871 = 1.0 / _1867;
                float _1873 = _1869 + (-1.0);
                float _1875 = -_1873;
                float _1877 = fma(_1875, _1871, _1833);
                float _1879 = _1877 * _1865;
                float _1881 = _1879 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _1851 = _1881;
            }
            float _1883 = _1851;
            float _1885 = _1883 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _1887 = _1883 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            bool _1889 = !_157;
            if (!_1889)
            {
                float _1891 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1893 = log2(_1891);
                float _1895 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _1897 = _1895 + 1.0;
                float _1899 = 1.0 / _1897;
                float _1901 = _1893 * _1833;
                float _1903 = exp2(_1901);
                float _1905 = -_1903;
                float _1907 = _1905 + 1.0;
                float _1909 = _1907 * _1899;
                _1835 = _1909;
            }
            float _1911 = _1835;
            float _1913 = fma(_1911, _161, _1887);
            float _1915 = _1883 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _1917 = fma(_1911, _159, _1885);
            float _1919 = -_377;
            float _1921 = _1919 + _1913;
            float _1923 = fma(_1911, _163, _1915);
            float _1925 = -_379;
            float _1927 = _1925 + _1917;
            float _1929 = _1921 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _1931 = _1921 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _1933 = _1921 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _1935 = -_383;
            float _1937 = _1935 + _1923;
            float _1939 = fma(_1927, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1929);
            float _1941 = fma(_1927, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1931);
            float _1943 = fma(_1927, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1933);
            float _1945 = fma(_1937, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1939);
            float _1947 = fma(_1937, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1941);
            float _1949 = fma(_1937, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1943);
            _423 = _1947;
            _425 = _1945;
            _427 = _1949;
            _1817 = _1945;
            _1823 = _1947;
            _1831 = _1949;
        }
        float _1951 = _423;
        float _1953 = _425;
        float _1955 = _427;
        float _1957 = _1817;
        float _1959 = _1823;
        float _1961 = _1831;
        float _1963 = _1951 * _1951;
        float _1965 = rsqrt(_1785);
        float _1967 = fma(_1953, _1953, _1963);
        float _1969 = fma(_1955, _1955, _1967);
        float _1971 = sqrt(_1969);
        float _1973 = _1775 * _1965;
        float _1975 = _1771 * _1965;
        float _1977 = _1779 * _1965;
        bool _1979 = _1971 > 0.0;
        bool _1981 = !_1979;
        if (!_1981)
        {
            float _1983 = rsqrt(_1969);
            float _1985 = _1983 * _1951;
            float _1987 = _1983 * _1953;
            float _1989 = _1983 * _1955;
            float _1991 = _1975 * _1985;
            float _1993 = fma(_1973, _1987, _1991);
            float _1995 = fma(_1977, _1989, _1993);
            float _1997 = _1995 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1999 = fma(_1957, _1997, _1763);
            float _2001 = fma(_1959, _1997, _1761);
            float _2003 = fma(_1961, _1997, _1765);
            _1797 = _2001;
            _1799 = _1999;
            _1801 = _2003;
        }
    }
    float _2005 = _1797;
    float _2007 = _1799;
    float _2009 = _1801;
    float _2011 = -_1567;
    float _2013 = fma(_2011, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2005);
    float _2015 = -_1569;
    float _2017 = fma(_2015, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2007);
    float _2019 = -_1575;
    float _2021 = fma(_2019, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2009);
    float _2023 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2025 = _2013 + _2023;
    float _2027 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2029 = _2017 + _2027;
    float _2031 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2033 = _2021 + _2031;
    float _2035 = _2025 * _2025;
    float _2037 = fma(_2029, _2029, _2035);
    float _2039 = fma(_2033, _2033, _2037);
    float _2041 = rsqrt(_2039);
    float _2043 = sqrt(_2039);
    float _2045 = _2041 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2047 = _2029 * _2045;
    float _2049 = _2033 * _2045;
    float _2051 = _2047 * _2047;
    float _2053 = _2049 * _2049;
    float _2055 = _2051 + _2053;
    float _2057 = sqrt(_2055);
    bool _2059 = _2057 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2061 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2063 = _2057 + _2061;
    float _2065 = _2041;
    float _2067 = _2007;
    float _2069 = _2063;
    float _2071 = _2009;
    float _2073 = _2025;
    float _2075 = _2045;
    if (_2059)
    {
        float _2077 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2065 = _2077;
    }
    float _2079 = _2065;
    if (_2059)
    {
        float _2081 = rsqrt(_2055);
        _2067 = _2081;
    }
    float _2083 = _2067;
    float _2085 = _2083;
    if (_2059)
    {
        float _2087 = _2063 * _2079;
        _2069 = _2087;
    }
    float _2089 = _2069;
    if (_2059)
    {
        float _2091 = _2089 * 0.15915493667125701904296875;
        _2071 = _2091;
    }
    float _2093 = _2071;
    float _2095 = _2079;
    float _2097 = _2093;
    if (_2059)
    {
        float _2099 = _2093 * 6.283185482025146484375;
        float _2101 = sin(_2099);
        _2095 = _2101;
    }
    float _2103 = _2095;
    float _2105 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2107 = precise::max(0.0, _2105);
    float _2109 = _2033;
    float _2111 = _2107;
    if (_2059)
    {
        float _2113 = _2093 * 6.283185482025146484375;
        float _2115 = cos(_2113);
        _2109 = _2115;
    }
    float _2117 = _2109;
    float _2119 = -_2045;
    float _2121 = -_2107;
    float _2123 = fma(_2025, _2119, _2121);
    if (_2059)
    {
        float _2125 = _2123 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2111 = _2125;
    }
    float _2127 = _2111;
    float _2129 = _2103;
    float _2131 = _2127;
    if (_2059)
    {
        float _2133 = fma(_2103, _2127, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2073 = _2133;
    }
    float _2135 = _2073;
    float _2137 = _2135;
    if (!_2059)
    {
        _2129 = _2047;
    }
    float _2139 = _2129;
    float _2141 = _2139;
    if (_2059)
    {
        float _2143 = _2117 + (-1.0);
        _2131 = _2143;
    }
    float _2145 = _2131;
    float _2147 = _2145;
    if (_2059)
    {
        float _2149 = _2083 * _2135;
        _2075 = _2149;
    }
    float _2151 = _2075;
    if (!_2059)
    {
        _2085 = _2123;
    }
    float _2153 = _2085;
    float _2155 = _2153;
    if (_2059)
    {
        float _2157 = _2145 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2097 = _2157;
    }
    float _2159 = _2097;
    float _2161 = _2159;
    if (_2059)
    {
        float _2163 = _2047 * _2151;
        _2141 = _2163;
    }
    float _2165 = _2141;
    if (!_2059)
    {
        _2137 = _2049;
    }
    float _2167 = _2137;
    float _2169 = _2167;
    if (_2059)
    {
        float _2171 = _2049 * _2151;
        _2169 = _2171;
    }
    float _2173 = _2169;
    if (_2059)
    {
        float _2175 = fma(_2123, _2117, _2159);
        _2155 = _2175;
    }
    float _2177 = _2155;
    if (!_2059)
    {
        _2161 = _2051;
    }
    float _2179 = _2161;
    float _2181 = _2179;
    if (_2059)
    {
        float _2183 = _2165 * _2165;
        _2181 = _2183;
    }
    float _2185 = _2181;
    float _2187 = _2013 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2189 = _2013 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2191 = _2013 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (!_2059)
    {
        _2147 = _2053;
    }
    float _2193 = _2147;
    float _2195 = _2013 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2197 = _2193;
    if (_2059)
    {
        float _2199 = _2173 * _2173;
        _2197 = _2199;
    }
    float _2201 = _2197;
    float _2203 = fma(_2177, _2177, _2185);
    float _2205 = fma(_2017, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2187);
    float _2207 = fma(_2017, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2189);
    float _2209 = fma(_2017, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2191);
    float _2211 = fma(_2017, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2195);
    float _2213 = _2203 + _2201;
    float _2215 = fma(_2021, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2207);
    float _2217 = fma(_2021, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2209);
    float _2219 = rsqrt(_2213);
    float _2221 = fma(_2021, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2205);
    float _2223 = _2215 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2225 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2227 = fma(_2043, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2225);
    float _2229 = precise::clamp(_2227, 0.0, 1.0);
    float _2231 = _2217 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2233 = _2221 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2235 = _2223 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2237 = -_2229;
    float _2239 = _2237 + 1.0;
    float _2241 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2243 = _2231 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2245 = fma(_2021, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2211);
    float _2247 = fma(_2233, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2235);
    float _2249 = -_2243;
    float _2251 = fma(_2249, _2241, 1.0);
    float _2253 = abs(_2239);
    float _2255 = log2(_2253);
    float _2257 = _2245 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2259 = fma(_2231, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2247);
    float _2261 = _2219 * _2165;
    float _2263 = _2219 * _2173;
    float _2265 = fma(_2257, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2259);
    float _2267 = _2219 * _2177;
    float _2269 = _2261 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2271 = log2(_2251);
    float _2273 = _2267 + 1.0;
    float _2275 = -_2269;
    float _2277 = fma(_2267, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2275);
    float _2279 = _2223 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2281 = -_2263;
    float _2283 = fma(_2281, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2277);
    float _2285 = _2255 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2287 = 1.0 / _2265;
    float _2289 = _2223 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2291 = fma(_2283, -0.5, 0.5);
    float _2293 = fma(_2283, 0.5, 0.5);
    float _2295 = fma(_2233, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2279);
    float _2297 = fma(_2233, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2289);
    float _2299 = fma(_2293, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2301 = exp2(_2285);
    float _2303 = fma(_2231, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2297);
    float _2305 = fma(_2231, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2295);
    float _2307 = fma(_2293, _2299, -0.212114393711090087890625);
    float _2309 = _2271 * 0.693147182464599609375;
    float _2311 = fma(_2257, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2303);
    float _2313 = fma(_2257, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2305);
    float _2315 = fma(_2293, _2307, 1.570728778839111328125);
    float _2317 = sqrt(_2291);
    float _2319 = _2311 * _2287;
    float _2321 = _2309 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2323 = fma(_2319, 0.5, 0.5);
    float _2325 = -_2267;
    float _2327 = fma(_2301, _2273, _2325);
    float _2329 = _2313 * _2287;
    float _2331 = fma(_2327, 0.5, 0.5);
    float _2333 = fma(_2329, -0.5, 0.5);
    float _2335 = _2317 * 0.636619746685028076171875;
    float _2337 = -_2315;
    float _2339 = fma(_2335, _2337, 1.0);
    float3 _6274 = float3(_2323, _2333, _2321);
    float _2341 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6274, float3(0.0), isnan(_6274)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6274, float3(0.0), isnan(_6274)), level(0.0)).x;
    float3 _6285 = float3(_2323, _2333, _2321);
    float4 _2344 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6285, float3(0.0), isnan(_6285)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6285, float3(0.0), isnan(_6285)), level(0.0)).xyzw;
    float _2346 = _2344.x;
    float _2348 = _2344.y;
    float _2350 = _2344.z;
    float _2352 = _2344.w;
    float2 _6302 = float2(_2339, _2331);
    float3 _2356 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6302, float2(0.0), isnan(_6302)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6302, float2(0.0), isnan(_6302)), level(0.0)).xyz;
    float _2358 = _2356.x;
    float _2360 = _2356.y;
    float _2362 = _2356.z;
    float _2364 = _1573 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2366 = _1573 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2368 = _2255 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _2370 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2372 = isnan(0.5);
    bool _2374 = _2370 || _2372;
    bool _2376 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2378 = _2374 || _2376;
    float _2380 = fma(_1579, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2364);
    float _2382 = fma(_1579, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2366);
    float _2384 = fma(_1591, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2380);
    float _2386 = fma(_1591, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2382);
    float _2388 = _2384 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2390 = _2386 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2392 = 1.0 / _2388;
    float _2394 = _2390 + _2388;
    float _2396 = _2394 * _2392;
    float _2398 = _2396 * 0.5;
    float _2400 = _2223 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2402 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2404 = fma(_2398, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2402);
    float _2406 = fma(_2233, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2400);
    float _2408 = _2398;
    float _2410 = _2406;
    if (_2378)
    {
        _2408 = 1.0;
    }
    float _2412 = _2408;
    float _2414 = exp2(_2368);
    float _2416 = fma(_2231, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2406);
    float _2418 = _2412;
    if (_2378)
    {
        _2410 = 1.0;
    }
    float _2420 = _2410;
    float _2422 = fma(_2257, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2416);
    float _2424 = 1.0 / _2404;
    float _2426 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2428 = _2424 * _2426;
    float _2430 = _2420;
    if (!_2378)
    {
        float _2432 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2434 = _2432 * 0.15915493667125701904296875;
        float _2436 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2438 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2440 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2438;
        float _2442 = _2434 * 6.283185482025146484375;
        float _2444 = cos(_2442);
        float _2446 = _2436 * 0.15915493667125701904296875;
        float _2448 = _2434 * 6.283185482025146484375;
        float _2450 = sin(_2448);
        float _2452 = 1.0 / _2444;
        float _2454 = _2446 * 6.283185482025146484375;
        float _2456 = cos(_2454);
        float _2458 = _2450 * _2452;
        float _2460 = _2446 * 6.283185482025146484375;
        float _2462 = sin(_2460);
        float _2464 = _2456 * _2458;
        float _2466 = 1.0 / _2440;
        float _2468 = 1.0 / _2464;
        float _2470 = _2462 * _2468;
        float _2472 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2474 = fma(_2428, _2470, _2472);
        float _2476 = _2474 * _2466;
        float _2478 = precise::clamp(_2476, 0.0, 1.0);
        _2430 = _2478;
    }
    float _2480 = _2430;
    if (!_2378)
    {
        float _2482 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2484 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2486 = _2482 * 0.15915493667125701904296875;
        float _2488 = _2484 * 0.15915493667125701904296875;
        float _2490 = _2486 * 6.283185482025146484375;
        float _2492 = cos(_2490);
        float _2494 = _2486 * 6.283185482025146484375;
        float _2496 = sin(_2494);
        float _2498 = 1.0 / _2492;
        float _2500 = _2488 * 6.283185482025146484375;
        float _2502 = cos(_2500);
        float _2504 = _2496 * _2498;
        float _2506 = _2488 * 6.283185482025146484375;
        float _2508 = sin(_2506);
        float _2510 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2512 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2510;
        float _2514 = _2502 * _2504;
        float _2516 = 1.0 / _2512;
        float _2518 = 1.0 / _2514;
        float _2520 = _2508 * _2518;
        float _2522 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2524 = fma(_2428, _2520, _2522);
        float _2526 = _2524 * _2516;
        float _2528 = precise::clamp(_2526, 0.0, 1.0);
        float _2530 = -_2528;
        float _2532 = _2530 + 1.0;
        _2418 = _2532;
    }
    float _2534 = _2418;
    float _2536 = _2480 * _2534;
    float _2538 = -_2414;
    float _2540 = _2538 + 1.0;
    bool _2542 = _2480 > 0.0;
    bool _2544 = isnan(_2480);
    bool _2546 = _2542 || _2544;
    bool _2548 = isnan(0.0);
    bool _2550 = _2546 || _2548;
    float _2552 = _2422 + _2265;
    float _2554 = _2536 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _2556 = _2534 <= 0.0;
    bool _2558 = !_2550;
    bool _2560 = _2556 || _2558;
    float _2562 = _2554 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2564 = _2540 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2566 = _2552 * 0.5;
    out.gl_Position.x = _2311;
    out.gl_Position.y = _2313;
    out.gl_Position.z = _2422;
    out.gl_Position.w = _2265;
    float _2568 = _2564 * _2341;
    float _2570 = -_2564;
    float _2572 = _2570 + 1.0;
    out.m_68.z = _2566;
    out.m_68.w = _2265;
    float _2574 = _2352 * _2568;
    float _2576 = _2362 * _2568;
    out.m_45.x = _2562;
    float _2578 = fma(_2358, _2574, _2346);
    float _2580 = fma(_2360, _2574, _2348);
    float _2582 = _2352 * _2572;
    float _2584 = fma(_2352, _2576, _2350);
    out.m_70.x = _2578;
    out.m_70.y = _2580;
    out.m_70.z = _2584;
    out.m_70.w = _2582;
    if (!_2560)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2586 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_45.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2586;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

