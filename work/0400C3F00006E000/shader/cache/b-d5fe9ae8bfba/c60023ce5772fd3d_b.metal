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
    float4 m_56 [[user(locn0)]];
    float4 m_58 [[user(locn1)]];
    float4 m_70 [[user(locn2)]];
    float4 m_45 [[user(locn3)]];
    float4 m_64 [[user(locn4)]];
    float4 m_62 [[user(locn5)]];
    float4 m_66 [[user(locn6)]];
    float4 m_60 [[user(locn7)]];
    float4 m_68 [[user(locn8)]];
    float4 m_72 [[user(locn10)]];
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
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    bool _717 = false;
    bool _589 = false;
    bool _447 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _86 = in.m_42.w;
    float _88 = trunc(_86);
    int _91 = int(_88);
    bool _95 = _91 >= 1;
    float _97 = 0.0;
    if (!_95)
    {
        _97 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _99 = _97;
    float _101 = _99;
    if (!_95)
    {
        out.m_45.x = 0.0;
    }
    int _103 = 0;
    if (!_95)
    {
        float _105 = _99 * 5.0;
        _103 = as_type<int>(_105);
    }
    int _107 = _103;
    int _109 = _107;
    if (!_95)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3108 = as_type<float>(_107);
        out.gl_Position.z = _3108;
    }
    if (!_95)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _111 = in.m_47.w;
    bool _113 = _111 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _115 = isnan(_111);
    bool _117 = _113 || _115;
    bool _119 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _121 = _117 || _119;
    float _123 = -_111;
    float _125 = _123 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_121)
    {
        float _127 = float(_91);
        _101 = _127;
    }
    float _129 = _101;
    bool _131 = _125 >= _129;
    bool _133 = !_121;
    bool _135 = _131 || _133;
    float _137 = _129;
    if (_135)
    {
        _137 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _139 = _137;
    if (_135)
    {
        out.m_45.x = 0.0;
    }
    if (_135)
    {
        float _141 = _139 * 5.0;
        _109 = as_type<int>(_141);
    }
    int _143 = _109;
    if (_135)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3177 = as_type<float>(_143);
        out.gl_Position.z = _3177;
    }
    if (_135)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _145 = as_type<float>(int(gl_VertexIndex));
    float _147 = _125 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _149 = in.m_52.w;
    bool _151 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _153 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _155 = _151 || _153;
    bool _157 = isnan(1.0);
    bool _159 = _155 || _157;
    float _161 = in.m_47.x;
    float _163 = in.m_47.y;
    float _165 = in.m_47.z;
    float _167 = in.m_42.x;
    float _169 = in.m_42.y;
    float _171 = in.m_42.z;
    float _173 = 0.0;
    float _175 = _147;
    if (!_159)
    {
        float _177 = _147 * _147;
        float _179 = _177 * 0.5;
        _173 = _179;
    }
    float _181 = _173;
    float _183 = _181;
    if (!_159)
    {
        float _185 = _181 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _183 = _185;
    }
    float _187 = _183;
    int _189 = as_type<int>(_145) & 1;
    bool _191 = _189 != 0;
    int _193 = as_type<int>(_145) & 2;
    bool _195 = _193 != 0;
    bool _197 = !_191;
    float _199 = _197 ? (-0.5) : 0.5;
    bool _201 = !_195;
    float _203 = _201 ? (-0.5) : 0.5;
    bool _205 = !_159;
    float _207 = _187;
    float _209 = 0.0;
    float _211 = _145;
    bool _213 = false;
    if (!_205)
    {
        float _215 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _217 = log2(_215);
        float _219 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _221 = _219 + 1.0;
        float _223 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _225 = _147 * _217;
        float _227 = 1.0 / _221;
        float _229 = _223 * 0.693147182464599609375;
        float _231 = exp2(_225);
        float _233 = 1.0 / _229;
        float _235 = _231 + (-1.0);
        float _237 = -_235;
        float _239 = fma(_237, _233, _147);
        float _241 = _239 * _227;
        float _243 = _241 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _207 = _243;
        _209 = _227;
        _211 = _233;
    }
    float _245 = _207;
    float _247 = _209;
    float _249 = _211;
    bool _251 = !_159;
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
        float _269 = _147 * _261;
        float _271 = exp2(_269);
        float _273 = -_271;
        float _275 = _273 + 1.0;
        float _277 = _275 * _267;
        _175 = _277;
        _253 = _265;
    }
    float _279 = _175;
    float _281 = _253;
    float _283 = _281;
    if (!_159)
    {
        float _285 = _125 * _125;
        float _287 = _285 * 0.5;
        _255 = _287;
    }
    float _289 = _255;
    float _291 = _245 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _293 = _245 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _295 = _245 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    if (!_159)
    {
        _283 = _125;
    }
    float _297 = _283;
    float _299 = fma(_279, _161, _291);
    float _301 = fma(_279, _163, _293);
    float _303 = _297;
    if (!_159)
    {
        float _305 = _289 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _257 = _305;
    }
    float _307 = _257;
    bool _309 = !_159;
    float _311 = _307;
    if (!_309)
    {
        float _313 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _315 = log2(_313);
        float _317 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _319 = _317 + 1.0;
        float _321 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _323 = _125 * _315;
        float _325 = 1.0 / _319;
        float _327 = _321 * 0.693147182464599609375;
        float _329 = exp2(_323);
        float _331 = 1.0 / _327;
        float _333 = _329 + (-1.0);
        float _335 = -_333;
        float _337 = fma(_335, _331, _125);
        float _339 = _337 * _325;
        float _341 = _339 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _311 = _341;
    }
    float _343 = _311;
    bool _345 = !_159;
    if (!_345)
    {
        float _347 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _349 = log2(_347);
        float _351 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _353 = _351 + 1.0;
        float _355 = 1.0 / _353;
        float _357 = _125 * _349;
        float _359 = exp2(_357);
        float _361 = -_359;
        float _363 = _361 + 1.0;
        float _365 = _363 * _355;
        _303 = _365;
    }
    float _367 = _303;
    float _369 = _343 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _371 = _343 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    bool _373 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _375 = _343 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _377 = fma(_367, _163, _369);
    float _379 = fma(_301, _149, _169);
    float _381 = fma(_367, _161, _371);
    float _383 = fma(_279, _165, _295);
    float _385 = -_377;
    float _387 = _301 + _385;
    float _389 = fma(_367, _165, _375);
    float _391 = fma(_299, _149, _167);
    float _393 = -_381;
    float _395 = _299 + _393;
    float _397 = _387 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _399 = _387 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _401 = _387 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _403 = -_389;
    float _405 = _383 + _403;
    float _407 = fma(_395, (*spvDescriptorSet0.vp_c10)._m0[4].x, _397);
    float _409 = fma(_395, (*spvDescriptorSet0.vp_c10)._m0[5].x, _399);
    float _411 = fma(_395, (*spvDescriptorSet0.vp_c10)._m0[6].x, _401);
    float _413 = fma(_383, _149, _171);
    float _415 = fma(_405, (*spvDescriptorSet0.vp_c10)._m0[4].z, _407);
    float _417 = fma(_405, (*spvDescriptorSet0.vp_c10)._m0[5].z, _409);
    float _419 = fma(_405, (*spvDescriptorSet0.vp_c10)._m0[6].z, _411);
    bool _421 = !_373;
    float _423 = _417;
    float _425 = _415;
    float _427 = _419;
    float _445;
    if (!_421)
    {
        float _429 = in.m_54.x;
        float _431 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _433 = _429 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _435 = fma(_433, (*spvDescriptorSet0.vp_c9)._m0[11].y, _125);
        float _437 = _435 * _431;
        float _439 = floor(_437);
        float _441 = -_439;
        float _443 = _437 + _441;
        _445 = _443;
        _447 = true;
    }
    else
    {
        float _449 = float(_91);
        float _451 = 1.0 / _449;
        float _453 = _125 * _451;
        _445 = _453;
    }
    _447 = false;
    float _455 = _445;
    float _457 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _459 = _455 + _457;
    float _461 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _463 = _461 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _465 = _455 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _467 = isnan(_455);
    bool _469 = _465 || _467;
    bool _471 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _473 = _469 || _471;
    float _475 = float(_473);
    float _477 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _479 = _477 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _481 = _455 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _483 = isnan(_455);
    bool _485 = _481 || _483;
    bool _487 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _489 = _485 || _487;
    float _491 = float(_489);
    float _493 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _495 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _493;
    bool _497 = _455 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _499 = isnan(_455);
    bool _501 = _497 || _499;
    bool _503 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _505 = _501 || _503;
    float _507 = float(_505);
    float _509 = 1.0 / _463;
    float _511 = -_475;
    float _513 = _511 + 1.0;
    bool _515 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _517 = 1.0 / _479;
    float _519 = _495 * _509;
    float _521 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _523 = _521 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _525 = -_507;
    float _527 = _525 + 1.0;
    float _529 = fma(_519, _459, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _531 = _491 * _513;
    float _533 = -_491;
    float _535 = _533 + 1.0;
    float _537 = _475 * _527;
    float _539 = _523 * _517;
    float _541 = _529 * _531;
    float _543 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _545 = _455 + _543;
    float _547 = fma(_535, (*spvDescriptorSet0.vp_c9)._m0[115].x, _541);
    float _549 = fma(_539, _545, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _551 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _553 = fma(_549, _537, _547);
    float _555 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _557 = _551 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _559 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _561 = fma(_507, (*spvDescriptorSet0.vp_c9)._m0[117].x, _553);
    float _563 = _555 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _565 = _559 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _567 = _561 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_56.x = _557;
    out.m_56.y = _563;
    out.m_56.z = _565;
    out.m_56.w = _567;
    bool _569 = !_515;
    float _587;
    if (!_569)
    {
        float _571 = in.m_54.x;
        float _573 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _575 = _571 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _577 = fma(_575, (*spvDescriptorSet0.vp_c9)._m0[11].z, _125);
        float _579 = _577 * _573;
        float _581 = floor(_579);
        float _583 = -_581;
        float _585 = _579 + _583;
        _587 = _585;
        _589 = true;
    }
    else
    {
        float _591 = float(_91);
        float _593 = 1.0 / _591;
        float _595 = _125 * _593;
        _587 = _595;
    }
    _589 = false;
    float _597 = _587;
    float _599 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _601 = _597 + _599;
    bool _603 = _597 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _605 = isnan(_597);
    bool _607 = _603 || _605;
    bool _609 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _611 = _607 || _609;
    float _613 = float(_611);
    float _615 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _617 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _615;
    bool _619 = _597 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _621 = isnan(_597);
    bool _623 = _619 || _621;
    bool _625 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _627 = _623 || _625;
    float _629 = float(_627);
    float _631 = -_613;
    float _633 = _631 + 1.0;
    float _635 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _637 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _635;
    float _639 = 1.0 / _617;
    bool _641 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _643 = _629 * _633;
    float _645 = -_629;
    float _647 = _645 + 1.0;
    float _649 = _601 * _639;
    float _651 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _653 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _651;
    float _655 = fma(_637, _649, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _657 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _659 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _657;
    float _661 = fma(_653, _649, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _663 = _655 * _643;
    float _665 = fma(_659, _649, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _667 = _661 * _643;
    float _669 = _665 * _643;
    float _671 = fma(_647, (*spvDescriptorSet0.vp_c9)._m0[123].x, _663);
    float _673 = fma(_647, (*spvDescriptorSet0.vp_c9)._m0[123].y, _669);
    float _675 = fma(_647, (*spvDescriptorSet0.vp_c9)._m0[123].z, _667);
    float _677 = fma(_613, (*spvDescriptorSet0.vp_c9)._m0[124].x, _671);
    float _679 = fma(_613, (*spvDescriptorSet0.vp_c9)._m0[124].y, _673);
    float _681 = fma(_613, (*spvDescriptorSet0.vp_c9)._m0[124].z, _675);
    float _683 = _677 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _685 = _679 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _687 = _681 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _689 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _691 = _683 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _693 = _685 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _695 = _687 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_58.x = _691;
    out.m_58.y = _693;
    out.m_58.z = _695;
    out.m_58.w = _689;
    bool _697 = !_641;
    float _715;
    if (!_697)
    {
        float _699 = in.m_54.x;
        float _701 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _703 = _699 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _705 = fma(_703, (*spvDescriptorSet0.vp_c9)._m0[14].x, _125);
        float _707 = _705 * _701;
        float _709 = floor(_707);
        float _711 = -_709;
        float _713 = _707 + _711;
        _715 = _713;
        _717 = true;
    }
    else
    {
        float _719 = float(_91);
        float _721 = 1.0 / _719;
        float _723 = _125 * _721;
        _715 = _723;
    }
    _717 = false;
    float _725 = _715;
    float _727 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _729 = int(_727);
    float _731 = in.m_54.z;
    float _733 = in.m_54.w;
    float _735 = _379 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _737 = fma(_391, (*spvDescriptorSet0.vp_c10)._m0[5].x, _735);
    float _739 = float(_91);
    float _741 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _743 = int(_741);
    float _745 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _747 = _745 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _749 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _751 = _749 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _753 = fma(_413, (*spvDescriptorSet0.vp_c10)._m0[5].z, _737);
    float _755 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _757 = _755 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _759 = float(_729);
    float _761 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _763 = _761 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _765 = 1.0 / _747;
    float _767 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _769 = _767 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _771 = float(uint(_743));
    float _773 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _775 = _773 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _777 = _733 > 0.5;
    float _779 = 1.0 / _759;
    float _781 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _783 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _781;
    float _785 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _787 = _785 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _789 = 1.0 / _771;
    float _791 = _125 * _779;
    float _793 = 1.0 / _751;
    int _795 = as_type<int>(_789) + (-2);
    float _797 = trunc(_791);
    int _799 = int(_797);
    int _801 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _803 = _801 != 0;
    float _805 = _379 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _807 = _379 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _809 = 1.0 / _787;
    float _811 = fma(_391, (*spvDescriptorSet0.vp_c10)._m0[4].x, _805);
    float _813 = fma(_391, (*spvDescriptorSet0.vp_c10)._m0[6].x, _807);
    int _815 = ~_743;
    int _817 = _815 + 1;
    float _819 = fma(_413, (*spvDescriptorSet0.vp_c10)._m0[4].z, _811);
    float _821 = fma(_413, (*spvDescriptorSet0.vp_c10)._m0[6].z, _813);
    float _823 = float(uint(_799));
    float _825 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _827 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _825;
    float _829 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _831 = _829 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _833 = 1.0 / _757;
    int _835 = as_type<int>(_765);
    float _837 = _833;
    if (_803)
    {
        _213 = false;
    }
    bool _839 = _213;
    float _841 = as_type<float>(_795) * _823;
    float _843 = _831 * _793;
    float _845 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _847 = _845 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _849 = _783 * _809;
    float _851 = trunc(_841);
    float _853 = precise::max(_851, 0.0);
    uint _856 = uint(_853);
    float _858 = 1.0 / _763;
    float _860 = _841;
    float _862 = _805;
    float _864 = _809;
    bool _866 = _839;
    if (_803)
    {
        float _868 = in.m_54.x;
        float _870 = in.m_54.y;
        _860 = _868;
        _862 = _870;
    }
    float _872 = _860;
    float _874 = _862;
    int _876 = _817 * int(_856);
    int _878 = _876 + _799;
    float _880 = 1.0 / _739;
    float _882 = float(uint(_878));
    float _884 = _827 * _765;
    float _886 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _888 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _886;
    float _890 = _847 * _858;
    float _892 = 1.0 / _769;
    float _894 = as_type<float>(_795) * _882;
    float _896 = _888 * _833;
    float _898 = _882;
    float _900 = _858;
    if (_803)
    {
        _835 = 0;
    }
    int _902 = _835;
    int _904 = _902;
    if (_803)
    {
        _898 = 1.0;
    }
    float _906 = _898;
    float _908 = 1.0 / _775;
    float _910 = _906;
    float _912 = _874;
    float _914 = _872;
    if (_803)
    {
        _864 = _872;
    }
    float _916 = _864;
    float _918 = _916;
    if (_803)
    {
        _837 = _874;
    }
    float _920 = _837;
    float _922 = _920;
    if (_803)
    {
        _900 = _916;
    }
    float _924 = _900;
    float _926 = trunc(_894);
    float _928 = precise::max(_926, 0.0);
    uint _930 = uint(_928);
    float _932 = _924;
    if (!_803)
    {
        float _934 = in.m_54.x;
        float _936 = in.m_54.y;
        float _938 = _934 * 3.1415927410125732421875;
        float _940 = _938 * 0.15915493667125701904296875;
        float _942 = _936 * 3.1415927410125732421875;
        float _944 = _942 * 0.15915493667125701904296875;
        float _946 = _940 * 6.283185482025146484375;
        float _948 = sin(_946);
        float _950 = _944 * 6.283185482025146484375;
        float _952 = sin(_950);
        _910 = 1.2345600128173828125;
        _918 = _936;
        _866 = true;
        _922 = _952;
        _904 = 2;
        _912 = _936;
        _932 = _948;
        _914 = _934;
    }
    float _954 = _910;
    float _956 = _918;
    bool _958 = _866;
    float _960 = _922;
    int _962 = _904;
    float _964 = _912;
    float _966 = _932;
    float _968 = _914;
    float _970 = _954 * _956;
    int _972 = int(_856) + int(_930);
    float _974 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _976 = _974 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    int _978 = ~_743;
    int _980 = _978 + 1;
    float _982 = floor(_970);
    float _984 = _976 * _892;
    float _986 = float(_743);
    int _988 = _980 * _972;
    int _990 = _988 + _799;
    float _992 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _994 = _725 + _992;
    float _996 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _998 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _996;
    float _1000 = float(_799);
    float _1002 = _125 * _986;
    bool _1004 = uint(_990) >= uint(_743);
    float _1006 = _998 * _908;
    bool _1008 = _1000 >= _986;
    bool _1010 = isnan(_1000);
    bool _1012 = _1008 || _1010;
    bool _1014 = isnan(_986);
    bool _1016 = _1012 || _1014;
    float _1018 = float(_1016);
    float _1020 = _1002 * _880;
    bool _1022 = !_1004;
    int _1024 = _1022 ? 0 : (-1);
    float _1026 = fma(_884, _994, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _1028 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1030 = _725 + _1028;
    float _1032 = -_982;
    float _1034 = _970 + _1032;
    int _1036 = ~_972;
    int _1038 = _1036 + _1024;
    int _1040 = _1038 + 1;
    float _1042 = trunc(_1018);
    int _1044 = int(_1042);
    float _1046 = _986 * _1034;
    float _1048 = fma(_843, _1030, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    bool _1050 = _743 == 0;
    float _1052 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1054 = _725 + _1052;
    int _1056 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1058 = _1056 != 0;
    int _1060 = _743 * _1040;
    int _1062 = _1060 + _799;
    float _1064 = trunc(_1046);
    int _1066 = int(_1064);
    float _1068 = fma(_896, _1054, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    int _1070 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1072 = _1070 != 0;
    int _1074 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1076 = _1074 != 0;
    float _1078 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1080 = _725 + _1078;
    bool _1082 = !_1050;
    int _1084 = _1082 ? _1062 : (-1);
    float _1086 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1088 = _725 + _1086;
    bool _1090 = !_1058;
    int _1092 = _1090 ? 0 : 1;
    float _1094 = fma(_849, _1080, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    bool _1096 = !_1076;
    int _1098 = _1096 ? 0 : 1;
    float _1100 = trunc(_1020);
    int _1102 = int(_1100);
    int _1104 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1106 = _1104 != 0;
    int _1108 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1110 = _1108 != 0;
    float _1112 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1114 = _725 + _1112;
    int _1116 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _1118 = _1116 != 0;
    float _1120 = fma(_984, _1088, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    int _1122 = ~_1044;
    int _1124 = _1122 + 1;
    int _1126 = _1124 + 1;
    float _1128 = fma(_1006, _1114, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    bool _1130 = !_1072;
    int _1132 = _1130 ? 0 : 1;
    float _1134 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    int _1136 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _1138 = _1136 != 0;
    int _1140 = _1084 * _1126;
    int _1142 = _743 + (-1);
    float _1144 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1146 = _725 + _1144;
    int _1148 = abs(_1092);
    float _1150 = _821 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _1152 = abs(_1098);
    int _1154 = _1044 * _1142;
    int _1156 = _1154 + _1140;
    int _1158 = abs(_1132);
    float _1160 = as_type<float>(_1044);
    float _1162 = _1026;
    bool _1164 = _1106;
    bool _1166 = _1110;
    float _1168 = _964;
    if (_1118)
    {
        float _1170 = in.m_54.w;
        _1160 = _1170;
    }
    float _1172 = _1160;
    float _1174 = fma(_890, _1146, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    int _1176 = _1156 * _1152;
    bool _1178 = _725 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1180 = isnan(_725);
    bool _1182 = _1178 || _1180;
    bool _1184 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1186 = _1182 || _1184;
    float _1188 = float(_1186);
    float _1190 = _819 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _1192 = _1066 * _1148;
    int _1194 = _1192 + _799;
    bool _1196 = !_1106;
    int _1198 = _1196 ? 0 : 1;
    float _1200 = as_type<float>(_1148);
    if (_1138)
    {
        float _1202 = in.m_54.x;
        _1200 = _1202;
    }
    float _1204 = _1200;
    int _1206 = _1102 * _1158;
    int _1208 = _1206 + _1176;
    bool _1210 = _725 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _1212 = isnan(_725);
    bool _1214 = _1210 || _1212;
    bool _1216 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _1218 = _1214 || _1216;
    float _1220 = float(_1218);
    float _1222 = -_1188;
    float _1224 = _1222 + 1.0;
    bool _1226 = _725 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _1228 = isnan(_725);
    bool _1230 = _1226 || _1228;
    bool _1232 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _1234 = _1230 || _1232;
    float _1236 = float(_1234);
    bool _1238 = !_1110;
    int _1240 = _1238 ? 0 : 1;
    float _1242 = _1220 * _1224;
    int _1244 = abs(_1198);
    float _1246 = -_1220;
    float _1248 = _1246 + 1.0;
    bool _1250 = _725 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _1252 = isnan(_725);
    bool _1254 = _1250 || _1252;
    bool _1256 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _1258 = _1254 || _1256;
    float _1260 = float(_1258);
    float _1262 = -_1236;
    float _1264 = _1262 + 1.0;
    int _1266 = abs(_1240);
    float _1268 = _1236 * _1248;
    int _1270 = _1194 * _1244;
    int _1272 = _1270 + _1208;
    bool _1274 = _725 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _1276 = isnan(_725);
    bool _1278 = _1274 || _1276;
    bool _1280 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _1282 = _1278 || _1280;
    float _1284 = float(_1282);
    float _1286 = _1260 * _1264;
    float _1288 = -_1260;
    float _1290 = _1288 + 1.0;
    int _1292 = _1066 * _1266;
    int _1294 = _1292 + _1272;
    bool _1296 = _725 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _1298 = isnan(_725);
    bool _1300 = _1296 || _1298;
    bool _1302 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _1304 = _1300 || _1302;
    float _1306 = float(_1304);
    float _1308 = _1172;
    float _1310 = as_type<float>(_1272);
    float _1312 = _1306;
    if (_1118)
    {
        float _1314 = _1172 * 3.1415927410125732421875;
        _1308 = _1314;
    }
    float _1316 = _1308;
    float _1318 = -_1284;
    float _1320 = _1318 + 1.0;
    float _1322 = _1284 * _1290;
    bool _1324 = _725 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1326 = isnan(_725);
    bool _1328 = _1324 || _1326;
    bool _1330 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _1332 = _1328 || _1330;
    float _1334 = float(_1332);
    float _1336 = _1320;
    if (_1118)
    {
        float _1338 = _1316 * 0.15915493667125701904296875;
        _1310 = _1338;
    }
    float _1340 = _1310;
    float _1342 = _1306 * _1320;
    float _1344 = _1342;
    if (_1138)
    {
        float _1346 = _1204 * 3.1415927410125732421875;
        _1336 = _1346;
    }
    float _1348 = _1336;
    float _1350 = -_1306;
    float _1352 = _1350 + 1.0;
    bool _1354 = _725 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _1356 = isnan(_725);
    bool _1358 = _1354 || _1356;
    bool _1360 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _1362 = _1358 || _1360;
    float _1364 = float(_1362);
    if (_1138)
    {
        float _1366 = _1348 * 0.15915493667125701904296875;
        _1312 = _1366;
    }
    float _1368 = _1312;
    float _1370 = -_1334;
    float _1372 = _1370 + 1.0;
    float _1374 = _1340;
    if (_1118)
    {
        float _1376 = _1340 * 6.283185482025146484375;
        float _1378 = sin(_1376);
        _1374 = _1378;
    }
    float _1380 = _1374;
    float _1382 = _1334 * _1352;
    float _1384 = _1364 * _1372;
    float _1386 = float(uint(_1294));
    float _1388 = _1334;
    float _1390 = _1382;
    if (_958)
    {
        float _1392 = in.m_54.z;
        _1388 = _1392;
    }
    float _1394 = _1388;
    float _1396 = -_1364;
    float _1398 = _1396 + 1.0;
    float _1400 = _1026 * _1384;
    if (!_1118)
    {
        _1162 = _199;
    }
    float _1402 = _1162;
    float _1404 = as_type<float>(_795) * _1386;
    float _1406 = _1368;
    float _1408 = _1402;
    if (_1138)
    {
        float _1410 = _1368 * 6.283185482025146484375;
        float _1412 = sin(_1410);
        _1406 = _1412;
    }
    float _1414 = _1406;
    float _1416 = fma(_1398, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1400);
    float _1418 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    float _1420 = _960 * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    float _1422 = _1416;
    if (_1118)
    {
        bool _1424 = _1380 > 0.5;
        _1164 = _1424;
    }
    bool _1426 = _1164;
    float _1428 = fma(_1048, _1382, _1416);
    float _1430 = trunc(_1404);
    float _1432 = precise::max(_1430, 0.0);
    uint _1434 = uint(_1432);
    float _1436 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    float _1438 = _1428;
    if (_1118)
    {
        float _1440 = -_199;
        float _1442 = _1426 ? _1440 : _199;
        _1408 = _1442;
    }
    float _1444 = _1408;
    float _1446 = fma(_1068, _1342, _1428);
    bool _1448 = _962 != 2;
    float _1450 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    int _1452 = ~_743;
    int _1454 = _1452 + 1;
    float _1456 = fma(_964, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1450);
    int _1458 = int(_1138);
    int _1460 = _1118 ? 2 : 0;
    int _1462 = _1458 | _1460;
    int _1464 = _1448 ? 4 : 0;
    int _1466 = _1462 | _1464;
    int _1468 = _1110 ? 8 : 0;
    int _1470 = _1466 | _1468;
    int _1472 = _958 ? 16 : 0;
    int _1474 = _1470 | _1472;
    int _1476 = _777 ? 32 : 0;
    int _1478 = _1474 | _1476;
    int _1480 = _159 ? 64 : 0;
    int _1482 = _1478 | _1480;
    int _1484 = _1482 & 64;
    float _1486 = _1414;
    if (_1138)
    {
        bool _1488 = _1414 > 0.5;
        _1166 = _1488;
    }
    bool _1490 = _1166;
    float _1492 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    int _1494 = _1454 * int(_1434);
    int _1496 = _1494 + _1294;
    bool _1498 = _731 > 0.5;
    float _1500 = fma(_960, (*spvDescriptorSet0.vp_c9)._m0[93].w, _1492);
    float _1502 = _1394;
    if (_958)
    {
        _1390 = _1394;
    }
    float _1504 = _1390;
    float _1506 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    float _1508 = float(uint(_1496));
    float _1510 = _1504;
    if (_958)
    {
        _1422 = _964;
    }
    float _1512 = _1422;
    float _1514 = fma(_1420, -2.0, _1506);
    float _1516 = _1512;
    if (_958)
    {
        _1486 = _964;
    }
    float _1518 = _1486;
    float _1520 = as_type<float>(_795) * _1508;
    float _1522 = fma(_966, (*spvDescriptorSet0.vp_c9)._m0[93].z, _1418);
    float _1524 = _966 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    float _1526 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    float _1528 = _1518;
    float _1530 = _1522;
    if (!_958)
    {
        _1510 = _964;
    }
    float _1532 = _1510;
    float _1534 = -_1436;
    float _1536 = fma(_1524, 2.0, _1534);
    float _1538 = fma(_1174, _1322, _1446);
    float _1540 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    if (!_958)
    {
        _1502 = _964;
    }
    float _1542 = _1502;
    float _1544 = fma(_1094, _1286, _1538);
    float _1546 = trunc(_1520);
    float _1548 = precise::max(_1546, 0.0);
    uint _1550 = uint(_1548);
    bool _1552 = _964 > 0.5;
    float _1554 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    if (_1448)
    {
        _1438 = _968;
    }
    float _1556 = _1438;
    float _1558 = -_125;
    float _1560 = fma(_1558, (*spvDescriptorSet0.vp_c9)._m0[91].x, _1536);
    float _1562 = _1556;
    if (!_1448)
    {
        _1562 = _731;
    }
    float _1564 = _1562;
    float _1566 = fma(_968, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1554);
    if (!_1448)
    {
        _1168 = _968;
    }
    float _1568 = _1168;
    float _1570 = _968 * 6.283185482025146484375;
    int _1572 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1574 = _1572 != 0;
    float _1576 = _1526 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    float _1578 = -_199;
    int _1580 = _1498 ? as_type<int>(_1578) : as_type<int>(_199);
    float _1582 = _1570 * 0.15915493667125701904296875;
    if (!_958)
    {
        _1516 = _968;
    }
    float _1584 = _1516;
    float _1586 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[91].y, _1514);
    if (!_958)
    {
        _1528 = _968;
    }
    float _1588 = _1528;
    float _1590 = _1582 * 6.283185482025146484375;
    float _1592 = cos(_1590);
    float _1594 = -_203;
    int _1596 = _777 ? as_type<int>(_1594) : as_type<int>(_203);
    float _1598 = _1584 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _1600 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1602 = _1600 != 0;
    float _1604 = fma(_1588, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1540);
    bool _1606 = !_1574;
    float _1608 = _1606 ? _199 : as_type<float>(_1580);
    float _1610 = _1564 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    bool _1612 = _968 > 0.5;
    bool _1614 = !_1602;
    float _1616 = _1614 ? _203 : as_type<float>(_1596);
    int _1618 = int(_1434) + int(_1550);
    int _1620 = ~_743;
    int _1622 = _1620 + 1;
    int _1624 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1626 = _1624 != 0;
    int _1628 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1630 = _1628 != 0;
    float _1632 = -_203;
    int _1634 = _1498 ? as_type<int>(_1632) : as_type<int>(_203);
    int _1636 = _1622 * _1618;
    int _1638 = _1636 + _1294;
    if (!_1138)
    {
        _1344 = _203;
    }
    float _1640 = _1344;
    bool _1642 = !_1630;
    float _1644 = _1642 ? _203 : as_type<float>(_1634);
    float _1646 = _1582 * 6.283185482025146484375;
    float _1648 = sin(_1646);
    float _1650 = _1640;
    if (_1138)
    {
        float _1652 = -_203;
        float _1654 = _1490 ? _1652 : _203;
        _1650 = _1654;
    }
    float _1656 = _1650;
    bool _1658 = uint(_1638) >= uint(_743);
    float _1660 = _1656 + (-0.5);
    float _1662 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _1664 = _1484 != 0;
    int _1666 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1668 = _1666 != 0;
    float _1670 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1672 = -_199;
    int _1674 = _1552 ? as_type<int>(_1672) : as_type<int>(_199);
    float _1676 = fma(_1542, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1662);
    float _1678 = -_203;
    int _1680 = _1552 ? as_type<int>(_1678) : as_type<int>(_203);
    float _1682 = -_1670;
    float _1684 = fma(_1598, 2.0, _1682);
    bool _1686 = !_1658;
    int _1688 = _1686 ? 0 : (-1);
    float _1690 = fma(_1120, _1268, _1544);
    int _1692 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1694 = _1692 != 0;
    int _1696 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1698 = _1696 != 0;
    float _1700 = _1134 * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    float _1702 = _1444 + 0.5;
    float _1704 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    int _1706 = ~_1618;
    int _1708 = _1706 + _1688;
    int _1710 = _1708 + 1;
    float _1712 = fma(_1576, _1702, _1560);
    float _1714 = _203 * _1648;
    bool _1716 = !_1698;
    float _1718 = _1716 ? _203 : as_type<float>(_1680);
    float _1720 = _203 * _1592;
    float _1722 = -_199;
    int _1724 = _1612 ? as_type<int>(_1722) : as_type<int>(_199);
    float _1726 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    bool _1728 = !_1626;
    float _1730 = _1728 ? _199 : as_type<float>(_1674);
    float _1732 = _1532 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1734 = -_1714;
    float _1736 = fma(_199, _1592, _1734);
    bool _1738 = !_1694;
    float _1740 = _1738 ? _199 : as_type<float>(_1724);
    float _1742 = _1568 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1744 = fma(_199, _1648, _1720);
    float _1746 = fma(_1732, -2.0, _1726);
    float _1748 = in.m_52.x;
    float _1750 = in.m_52.y;
    float _1752 = float(uint(_1194));
    float _1754 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1756 = -_1700;
    float _1758 = -_1586;
    float _1760 = fma(_1756, _1660, _1758);
    float _1762 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1764 = as_type<float>(_795) * _1752;
    int _1766 = _743 * _1710;
    int _1768 = _1766 + _1294;
    bool _1770 = _743 == 0;
    float _1772 = -_1762;
    float _1774 = fma(_1610, 2.0, _1772);
    float _1776 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1778 = _1704 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1780 = _1608 + 0.5;
    float _1782 = -_125;
    float _1784 = fma(_1782, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1684);
    float _1786 = trunc(_1764);
    float _1788 = precise::max(_1786, 0.0);
    uint _1790 = uint(_1788);
    float _1792 = _1730 + 0.5;
    float _1794 = -_125;
    float _1796 = fma(_1794, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1774);
    float _1798 = fma(_1128, _1242, _1690);
    float _1800 = fma(_1742, -2.0, _1776);
    bool _1802 = !_1770;
    int _1804 = _1802 ? _1768 : (-1);
    float _1806 = fma(_1780, (*spvDescriptorSet0.vp_c9)._m0[85].x, _1784);
    float _1808 = fma(_1778, _1792, _1796);
    float _1810 = _1754 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1812 = _1644 + (-0.5);
    float _1814 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1800);
    int _1816 = _1804 >> 31;
    float _1818 = fma(_1188, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1798);
    float _1820 = _1750 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1822 = -_1810;
    float _1824 = -_1814;
    float _1826 = fma(_1822, _1812, _1824);
    int _1828 = _1816 & 3;
    float _1830 = _1748 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    int _1832 = ~_743;
    int _1834 = _1832 + 1;
    float _1836 = _1820 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    int _1838 = _1804 + _1828;
    float _1840 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1744);
    float _1842 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1746);
    int _1844 = _1834 * int(_1790);
    int _1846 = _1844 + _1194;
    int _1848 = _1838 >> 2;
    float _1850 = _1830 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1852 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1736);
    float _1854 = _1836 * _1840;
    float _1856 = float(uint(_1846));
    float _1858 = _1616 + (-0.5);
    int _1860 = _1848 << 4;
    int _1862 = _1860 + 512;
    float _1864 = _1850 * _1852;
    float _1866 = _1854 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1868 = as_type<float>(_795) * _1856;
    uint _1870 = uint(int(uint(_1862) >> uint(2)));
    uint _1872 = uint(int(uint(int(_1870)) >> uint(2)));
    int _1874 = int(_1870) & 3;
    float _1876 = (*spvDescriptorSet0.vp_c9)._m0[int(_1872)][_1874];
    int _1878 = int(_1870) + 1;
    uint _1880 = uint(int(uint(_1878) >> uint(2)));
    int _1882 = _1878 & 3;
    float _1884 = (*spvDescriptorSet0.vp_c9)._m0[int(_1880)][_1882];
    float _1886 = _1854 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1888 = _1854 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1890 = -_1858;
    float _1892 = -_1842;
    float _1894 = fma(_1890, (*spvDescriptorSet0.vp_c9)._m0[85].y, _1892);
    float _1896 = fma(_1864, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1866);
    float _1898 = trunc(_1868);
    float _1900 = precise::max(_1898, 0.0);
    uint _1902 = uint(_1900);
    float _1904 = fma(_1864, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1886);
    float _1906 = fma(_1864, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1888);
    int _1908 = _1804 & 3;
    int _1910 = _1862 + 8;
    uint _1912 = uint(int(uint(_1910) >> uint(2)));
    uint _1914 = uint(int(uint(int(_1912)) >> uint(2)));
    int _1916 = int(_1912) & 3;
    float _1918 = (*spvDescriptorSet0.vp_c9)._m0[int(_1914)][_1916];
    int _1920 = int(_1912) + 1;
    uint _1922 = uint(int(uint(_1920) >> uint(2)));
    int _1924 = _1920 & 3;
    float _1926 = (*spvDescriptorSet0.vp_c9)._m0[int(_1922)][_1924];
    float _1928 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    int _1930 = _1804 & 3;
    bool _1932 = _1930 != 0;
    bool _1934 = uint(_1908) > 1u;
    float _1936 = fma(_1928, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1906);
    float _1938 = fma(_1928, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1904);
    int _1940 = _1932 ? 0 : 1;
    float _1942 = fma(_1928, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1896);
    float _1944 = _1936 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1946 = _1938 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    int _1948 = ~_743;
    int _1950 = _1948 + 1;
    float _1952 = _1942 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    int _1954 = int(_1790) + int(_1902);
    int _1956 = ~_1940;
    int _1958 = _1956 + 1;
    int _1960 = _1958 + 1;
    int _1962 = _1960;
    if (!_1934)
    {
        int _1964 = ~_1940;
        int _1966 = _1964 + 1;
        _1962 = _1966;
    }
    int _1968 = _1962;
    float _1970 = _1150 + _1944;
    bool _1972 = _1908 != 3;
    float _1974 = _1190 + _1946;
    bool _1976 = uint(_1908) >= 2u;
    float _1978 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1980 = _1970 + _1978;
    int _1982 = _1950 * _1954;
    int _1984 = _1982 + _1194;
    float _1986 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1988 = _1974 + _1986;
    int _1990 = abs(_1968);
    float _1992 = _1980 * _1980;
    int _1994 = _1976 ? 0 : 1;
    bool _1996 = !_1932;
    int _1998 = _1996 ? 0 : 1;
    bool _2000 = _1908 != 3;
    float _2002 = fma(_1988, _1988, _1992);
    bool _2004 = uint(_1984) >= uint(_743);
    int _2006 = ~_1994;
    int _2008 = _2006 + 1;
    int _2010 = _2008 + 1;
    int _2012 = _2010;
    float _2014 = _1970;
    if (_1972)
    {
        int _2016 = ~_1994;
        int _2018 = _2016 + 1;
        _2012 = _2018;
    }
    int _2020 = _2012;
    int _2022 = abs(_1998);
    float _2024 = sqrt(_2002);
    bool _2026 = !_2000;
    int _2028 = _2026 ? 0 : (-1);
    int _2030 = ~_1990;
    int _2032 = _2030 + 1;
    int _2034 = _2032 + 1;
    int _2036 = abs(_2028);
    int _2038 = abs(_2020);
    int _2040 = _2034 * as_type<int>(_1884);
    int _2042 = ~_2022;
    int _2044 = _2042 + 1;
    int _2046 = _2044 + 1;
    int _2048 = ~_2038;
    int _2050 = _2048 + 1;
    int _2052 = _2050 + 1;
    bool _2054 = !_2004;
    int _2056 = _2054 ? 0 : (-1);
    int _2058 = _2046 * as_type<int>(_1876);
    int _2060 = _2058 + _2040;
    int _2062 = ~_2036;
    int _2064 = _2062 + 1;
    int _2066 = _2064 + 1;
    bool _2068 = _2024 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _2070 = _2052 * as_type<int>(_1918);
    int _2072 = _2070 + _2060;
    bool _2074 = !_1668;
    int _2076 = _2074 ? 0 : 1;
    int _2078 = ~_1954;
    int _2080 = _2078 + _2056;
    int _2082 = _2080 + 1;
    int _2084 = _2066 * as_type<int>(_1926);
    int _2086 = _2084 + _2072;
    int _2088 = abs(_2076);
    float _2090 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2092 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[92].z, _1522);
    int _2094 = _743 * _2082;
    int _2096 = _2094 + _1194;
    int _2098 = ~_2088;
    int _2100 = _2098 + 1;
    int _2102 = _2100 + 1;
    float _2104 = _753 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _2106 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[92].w, _1500);
    float _2108 = -_2092;
    float _2110 = _2108 + 1.0;
    if (!_2068)
    {
        _1530 = _1974;
    }
    float _2112 = _1530;
    int _2114 = _2086 * _2102;
    float _2116 = _2104 + _1952;
    float _2118 = -_2106;
    float _2120 = _2118 + 1.0;
    bool _2122 = !_1770;
    int _2124 = _2122 ? _2096 : (-1);
    bool _2126 = !_2068;
    float _2128 = _2116;
    float _2130 = _2112;
    if (!_2126)
    {
        float _2132 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2134 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2136 = _2024 + _2134;
        float _2138 = _2116 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2140 = rsqrt(_2002);
        float _2142 = _2136 * _2132;
        float _2144 = _2142 * 0.15915493667125701904296875;
        float _2146 = _2144 * 6.283185482025146484375;
        float _2148 = cos(_2146);
        float _2150 = _2144 * 6.283185482025146484375;
        float _2152 = sin(_2150);
        float _2154 = _2148 + (-1.0);
        float _2156 = fma(_2152, _2138, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2158 = _2154 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2160 = _2140 * _2156;
        float _2162 = fma(_2116, _2148, _2158);
        float _2164 = fma(_1988, _2160, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2166 = fma(_1980, _2160, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2128 = _2162;
        _2130 = _2164;
        _2014 = _2166;
    }
    float _2168 = _2128;
    float _2170 = _2130;
    float _2172 = _2014;
    float _2174 = fma(_2120, _1656, _1760);
    float _2176 = -_2104;
    float _2178 = _2176 + _2168;
    int _2180 = _2124 * _2088;
    int _2182 = _2180 + _2114;
    float _2184 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1566);
    float _2186 = -_1190;
    float _2188 = _2186 + _2170;
    float _2190 = _2178 * _2178;
    float _2192 = -_2110;
    float _2194 = fma(_2192, _1444, _1712);
    float _2196 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2198 = -_2184;
    float _2200 = _2198 + 1.0;
    float _2202 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1604);
    float _2204 = -_1150;
    float _2206 = _2204 + _2172;
    float _2208 = fma(_2188, _2188, _2190);
    float _2210 = -_2200;
    float _2212 = fma(_1730, _2210, _1808);
    float _2214 = -_2202;
    float _2216 = _2214 + 1.0;
    float _2218 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1456);
    float _2220 = fma(_2206, _2206, _2208);
    float _2222 = _1740 + 0.5;
    float _2224 = -_1718;
    float _2226 = _2224 + 0.5;
    float _2228 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1676);
    float _2230 = -_2216;
    float _2232 = fma(_1608, _2230, _1806);
    float _2234 = _2222 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2236 = sqrt(_2220);
    float _2238 = _2226 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2240 = -_2228;
    float _2242 = _2240 + 1.0;
    float _2244 = -_2218;
    float _2246 = _2244 + 1.0;
    float _2248 = _2234 * _2090;
    float _2250 = _2238 * _2196;
    float _2252 = fma(_1616, _2242, _1894);
    float _2254 = fma(_1644, _2246, _1826);
    float _2256 = float(_2182);
    out.m_60.x = _2194;
    out.m_60.y = _2174;
    out.m_62.x = _1818;
    bool _2258 = _2236 > 0.0;
    out.m_64.x = _2248;
    out.m_64.y = _2250;
    out.m_64.z = _2232;
    out.m_64.w = _2252;
    out.m_66.x = _2212;
    out.m_66.y = _2254;
    out.m_68.y = _2256;
    bool _2260 = !_2258;
    float _2262 = _2252;
    float _2264 = _2250;
    float _2266 = _2168;
    float _2268 = _2170;
    float _2270 = _2172;
    float _2272 = _2250;
    float _2274 = _2248;
    if (!_2260)
    {
        bool _2276 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _2278 = _2248;
        if (_2276)
        {
            float _2280 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _2278 = _2280;
        }
        float _2282 = _2278;
        float _2284 = _2282;
        if (_2276)
        {
            float _2286 = _415 * _2282;
            _2262 = _2286;
        }
        float _2288 = _2262;
        float _2290 = _2288;
        if (_2276)
        {
            float _2292 = _417 * _2282;
            _2264 = _2292;
        }
        float _2294 = _2264;
        float _2296 = _2294;
        if (_2276)
        {
            float _2298 = _419 * _2282;
            _2284 = _2298;
        }
        float _2300 = _2284;
        float _2302 = _2300;
        float _2304 = _2300;
        if (!_2276)
        {
            float _2306 = _125 + 1.0;
            float _2308 = _2306;
            if (!_1664)
            {
                float _2310 = _2306 * _2306;
                float _2312 = _2310 * 0.5;
                _2302 = _2312;
            }
            float _2314 = _2302;
            float _2316 = _2314;
            if (!_1664)
            {
                float _2318 = _2314 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2316 = _2318;
            }
            float _2320 = _2316;
            bool _2322 = !_1664;
            float _2324 = _2320;
            if (!_2322)
            {
                float _2326 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2328 = log2(_2326);
                float _2330 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2332 = _2330 + 1.0;
                float _2334 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2336 = _2328 * _2306;
                float _2338 = 1.0 / _2332;
                float _2340 = _2334 * 0.693147182464599609375;
                float _2342 = exp2(_2336);
                float _2344 = 1.0 / _2340;
                float _2346 = _2342 + (-1.0);
                float _2348 = -_2346;
                float _2350 = fma(_2348, _2344, _2306);
                float _2352 = _2350 * _2338;
                float _2354 = _2352 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2324 = _2354;
            }
            float _2356 = _2324;
            float _2358 = _2356 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _2360 = _2356 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            bool _2362 = !_1664;
            if (!_2362)
            {
                float _2364 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2366 = log2(_2364);
                float _2368 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2370 = _2368 + 1.0;
                float _2372 = 1.0 / _2370;
                float _2374 = _2366 * _2306;
                float _2376 = exp2(_2374);
                float _2378 = -_2376;
                float _2380 = _2378 + 1.0;
                float _2382 = _2380 * _2372;
                _2308 = _2382;
            }
            float _2384 = _2308;
            float _2386 = fma(_2384, _163, _2360);
            float _2388 = _2356 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _2390 = fma(_2384, _161, _2358);
            float _2392 = -_377;
            float _2394 = _2392 + _2386;
            float _2396 = fma(_2384, _165, _2388);
            float _2398 = -_381;
            float _2400 = _2398 + _2390;
            float _2402 = _2394 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _2404 = _2394 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _2406 = _2394 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _2408 = -_389;
            float _2410 = _2408 + _2396;
            float _2412 = fma(_2400, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2402);
            float _2414 = fma(_2400, (*spvDescriptorSet0.vp_c10)._m0[5].x, _2404);
            float _2416 = fma(_2400, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2406);
            float _2418 = fma(_2410, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2412);
            float _2420 = fma(_2410, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2414);
            float _2422 = fma(_2410, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2416);
            _423 = _2420;
            _425 = _2418;
            _427 = _2422;
            _2290 = _2418;
            _2296 = _2420;
            _2304 = _2422;
        }
        float _2424 = _423;
        float _2426 = _425;
        float _2428 = _427;
        float _2430 = _2290;
        float _2432 = _2296;
        float _2434 = _2304;
        float _2436 = _2424 * _2424;
        float _2438 = rsqrt(_2220);
        float _2440 = fma(_2426, _2426, _2436);
        float _2442 = fma(_2428, _2428, _2440);
        float _2444 = sqrt(_2442);
        float _2446 = _2188 * _2438;
        float _2448 = _2178 * _2438;
        float _2450 = _2206 * _2438;
        bool _2452 = _2444 > 0.0;
        bool _2454 = !_2452;
        _2272 = _2432;
        _2274 = _2434;
        if (!_2454)
        {
            float _2456 = rsqrt(_2442);
            float _2458 = _2456 * _2424;
            float _2460 = _2456 * _2426;
            float _2462 = _2456 * _2428;
            float _2464 = _2448 * _2458;
            float _2466 = fma(_2446, _2460, _2464);
            float _2468 = fma(_2450, _2462, _2466);
            float _2470 = _2468 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2472 = fma(_2430, _2470, _2170);
            float _2474 = fma(_2432, _2470, _2168);
            float _2476 = fma(_2434, _2470, _2172);
            _2266 = _2474;
            _2268 = _2472;
            _2270 = _2476;
        }
    }
    float _2478 = _2266;
    float _2480 = _2268;
    float _2482 = _2270;
    float _2484 = _2272;
    float _2486 = _2274;
    float _2488 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2490 = _2478 + _2488;
    float _2492 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2494 = _2480 + _2492;
    float _2496 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2498 = _2482 + _2496;
    float _2500 = _2490 * _2490;
    float _2502 = _2478 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2504 = fma(_2494, _2494, _2500);
    float _2506 = fma(_2498, _2498, _2504);
    float _2508 = rsqrt(_2506);
    float _2510 = sqrt(_2506);
    float _2512 = _2508 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2514 = _2494 * _2512;
    float _2516 = _2498 * _2512;
    float _2518 = _2514 * _2514;
    float _2520 = _2516 * _2516;
    float _2522 = _2518 + _2520;
    float _2524 = sqrt(_2522);
    bool _2526 = _2524 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2528 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2530 = _2524 + _2528;
    float _2532 = _2508;
    float _2534 = _2486;
    float _2536 = _2530;
    float _2538 = _2484;
    float _2540 = _2490;
    float _2542 = _2512;
    if (_2526)
    {
        float _2544 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2532 = _2544;
    }
    float _2546 = _2532;
    if (_2526)
    {
        float _2548 = rsqrt(_2522);
        _2534 = _2548;
    }
    float _2550 = _2534;
    float _2552 = _2550;
    if (_2526)
    {
        float _2554 = _2530 * _2546;
        _2536 = _2554;
    }
    float _2556 = _2536;
    float _2558 = _2478 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    if (_2526)
    {
        float _2560 = _2556 * 0.15915493667125701904296875;
        _2538 = _2560;
    }
    float _2562 = _2538;
    float _2564 = _2546;
    float _2566 = _2562;
    if (_2526)
    {
        float _2568 = _2562 * 6.283185482025146484375;
        float _2570 = sin(_2568);
        _2564 = _2570;
    }
    float _2572 = _2564;
    float _2574 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2576 = precise::max(0.0, _2574);
    float _2578 = _2498;
    float _2580 = _2576;
    if (_2526)
    {
        float _2582 = _2562 * 6.283185482025146484375;
        float _2584 = cos(_2582);
        _2578 = _2584;
    }
    float _2586 = _2578;
    float _2588 = -_2512;
    float _2590 = -_2576;
    float _2592 = fma(_2490, _2588, _2590);
    if (_2526)
    {
        float _2594 = _2592 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2580 = _2594;
    }
    float _2596 = _2580;
    float _2598 = _2572;
    float _2600 = _2596;
    if (_2526)
    {
        float _2602 = fma(_2572, _2596, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2540 = _2602;
    }
    float _2604 = _2540;
    float _2606 = _2604;
    if (!_2526)
    {
        _2598 = _2514;
    }
    float _2608 = _2598;
    float _2610 = _2608;
    if (_2526)
    {
        float _2612 = _2586 + (-1.0);
        _2600 = _2612;
    }
    float _2614 = _2600;
    float _2616 = _2614;
    if (_2526)
    {
        float _2618 = _2550 * _2604;
        _2542 = _2618;
    }
    float _2620 = _2542;
    if (!_2526)
    {
        _2552 = _2592;
    }
    float _2622 = _2552;
    float _2624 = _2622;
    if (_2526)
    {
        float _2626 = _2614 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2566 = _2626;
    }
    float _2628 = _2566;
    float _2630 = _2628;
    if (_2526)
    {
        float _2632 = _2514 * _2620;
        _2610 = _2632;
    }
    float _2634 = _2610;
    if (!_2526)
    {
        _2606 = _2516;
    }
    float _2636 = _2606;
    float _2638 = _2636;
    if (_2526)
    {
        float _2640 = _2516 * _2620;
        _2638 = _2640;
    }
    float _2642 = _2638;
    if (_2526)
    {
        float _2644 = fma(_2592, _2586, _2628);
        _2624 = _2644;
    }
    float _2646 = _2624;
    if (!_2526)
    {
        _2630 = _2518;
    }
    float _2648 = _2630;
    float _2650 = _2648;
    if (_2526)
    {
        float _2652 = _2634 * _2634;
        _2650 = _2652;
    }
    float _2654 = _2650;
    float _2656 = _2478 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (!_2526)
    {
        _2616 = _2520;
    }
    float _2658 = _2616;
    float _2660 = _2658;
    if (_2526)
    {
        float _2662 = _2642 * _2642;
        _2660 = _2662;
    }
    float _2664 = _2660;
    float _2666 = fma(_2646, _2646, _2654);
    float _2668 = fma(_2480, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2656);
    float _2670 = fma(_2480, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2558);
    float _2672 = _2478 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2674 = _2666 + _2664;
    float _2676 = fma(_2482, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2668);
    float _2678 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2680 = fma(_2510, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2678);
    float _2682 = precise::clamp(_2680, 0.0, 1.0);
    float _2684 = fma(_2480, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2672);
    float _2686 = rsqrt(_2674);
    float _2688 = fma(_2482, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2670);
    float _2690 = _2676 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2692 = fma(_2482, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2684);
    float _2694 = -_2682;
    float _2696 = _2694 + 1.0;
    float _2698 = _2688 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2700 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2702 = _2690 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2704 = fma(_2480, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2502);
    float _2706 = _2692 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2708 = abs(_2696);
    float _2710 = log2(_2708);
    float _2712 = -_2702;
    float _2714 = fma(_2712, _2700, 1.0);
    float _2716 = _2698 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2718 = fma(_2482, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2704);
    float _2720 = _2686 * _2634;
    float _2722 = _2686 * _2646;
    float _2724 = _2686 * _2642;
    float _2726 = fma(_2706, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2716);
    float _2728 = _2720 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2730 = _2718 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2732 = log2(_2714);
    float _2734 = fma(_2690, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2726);
    float _2736 = -_2728;
    float _2738 = fma(_2722, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2736);
    float _2740 = _2710 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2742 = -_2724;
    float _2744 = fma(_2742, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2738);
    float _2746 = fma(_2730, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2734);
    float _2748 = _2698 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2750 = _2698 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2752 = fma(_2744, -0.5, 0.5);
    float _2754 = exp2(_2740);
    float _2756 = fma(_2744, 0.5, 0.5);
    float _2758 = fma(_2706, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2748);
    float _2760 = fma(_2706, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2750);
    float _2762 = _2722 + 1.0;
    float _2764 = fma(_2756, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2766 = fma(_2690, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2758);
    float _2768 = fma(_2690, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2760);
    float _2770 = 1.0 / _2746;
    float _2772 = fma(_2756, _2764, -0.212114393711090087890625);
    float _2774 = fma(_2730, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2766);
    float _2776 = fma(_2730, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2768);
    float _2778 = _2732 * 0.693147182464599609375;
    float _2780 = fma(_2756, _2772, 1.570728778839111328125);
    float _2782 = sqrt(_2752);
    float _2784 = -_2722;
    float _2786 = fma(_2754, _2762, _2784);
    float _2788 = _2778 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2790 = fma(_2786, 0.5, 0.5);
    float _2792 = _2774 * _2770;
    float _2794 = _2776 * _2770;
    float _2796 = fma(_2792, 0.5, 0.5);
    float _2798 = fma(_2794, -0.5, 0.5);
    float _2800 = _2782 * 0.636619746685028076171875;
    float _2802 = -_2780;
    float _2804 = fma(_2800, _2802, 1.0);
    float3 _7264 = float3(_2796, _2798, _2788);
    float _2806 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7264, float3(0.0), isnan(_7264)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7264, float3(0.0), isnan(_7264)), level(0.0)).x;
    float3 _7275 = float3(_2796, _2798, _2788);
    float4 _2809 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7275, float3(0.0), isnan(_7275)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7275, float3(0.0), isnan(_7275)), level(0.0)).xyzw;
    float _2811 = _2809.x;
    float _2813 = _2809.y;
    float _2815 = _2809.z;
    float _2817 = _2809.w;
    float2 _7292 = float2(_2804, _2790);
    float3 _2821 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7292, float2(0.0), isnan(_7292)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7292, float2(0.0), isnan(_7292)), level(0.0)).xyz;
    float _2823 = _2821.x;
    float _2825 = _2821.y;
    float _2827 = _2821.z;
    float _2829 = _2104 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    bool _2831 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2833 = isnan(0.5);
    bool _2835 = _2831 || _2833;
    bool _2837 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2839 = _2835 || _2837;
    float _2841 = fma(_1190, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2829);
    float _2843 = _2104 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2845 = fma(_1150, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2841);
    float _2847 = fma(_1190, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2843);
    float _2849 = _2845 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2851 = fma(_1150, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2847);
    float _2853 = _2698 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2855 = 1.0 / _2849;
    float _2857 = _2851 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2859 = fma(_2706, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2853);
    float _2861 = _2706;
    float _2863 = _2710;
    if (_2839)
    {
        _2861 = 1.0;
    }
    float _2865 = _2861;
    float _2867 = _2857 + _2849;
    float _2869 = fma(_2690, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2859);
    float _2871 = fma(_2730, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2869);
    float _2873 = _2867 * _2855;
    float _2875 = _2873 * 0.5;
    float _2877 = _2710 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2879 = _2865;
    if (_2839)
    {
        _2863 = 1.0;
    }
    float _2881 = _2863;
    float _2883 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2885 = fma(_2875, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2883);
    float _2887 = exp2(_2877);
    float _2889 = 1.0 / _2885;
    float _2891 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2893 = _2889 * _2891;
    float _2895 = _2881;
    if (!_2839)
    {
        float _2897 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2899 = _2897 * 0.15915493667125701904296875;
        float _2901 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2903 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2905 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2903;
        float _2907 = _2899 * 6.283185482025146484375;
        float _2909 = cos(_2907);
        float _2911 = _2901 * 0.15915493667125701904296875;
        float _2913 = _2899 * 6.283185482025146484375;
        float _2915 = sin(_2913);
        float _2917 = 1.0 / _2909;
        float _2919 = _2911 * 6.283185482025146484375;
        float _2921 = cos(_2919);
        float _2923 = _2915 * _2917;
        float _2925 = _2911 * 6.283185482025146484375;
        float _2927 = sin(_2925);
        float _2929 = _2921 * _2923;
        float _2931 = 1.0 / _2905;
        float _2933 = 1.0 / _2929;
        float _2935 = _2927 * _2933;
        float _2937 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2939 = fma(_2893, _2935, _2937);
        float _2941 = _2939 * _2931;
        float _2943 = precise::clamp(_2941, 0.0, 1.0);
        _2895 = _2943;
    }
    float _2945 = _2895;
    if (!_2839)
    {
        float _2947 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2949 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2951 = _2947 * 0.15915493667125701904296875;
        float _2953 = _2949 * 0.15915493667125701904296875;
        float _2955 = _2951 * 6.283185482025146484375;
        float _2957 = cos(_2955);
        float _2959 = _2951 * 6.283185482025146484375;
        float _2961 = sin(_2959);
        float _2963 = 1.0 / _2957;
        float _2965 = _2953 * 6.283185482025146484375;
        float _2967 = cos(_2965);
        float _2969 = _2961 * _2963;
        float _2971 = _2953 * 6.283185482025146484375;
        float _2973 = sin(_2971);
        float _2975 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2977 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2975;
        float _2979 = _2967 * _2969;
        float _2981 = 1.0 / _2977;
        float _2983 = 1.0 / _2979;
        float _2985 = _2973 * _2983;
        float _2987 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2989 = fma(_2893, _2985, _2987);
        float _2991 = _2989 * _2981;
        float _2993 = precise::clamp(_2991, 0.0, 1.0);
        float _2995 = -_2993;
        float _2997 = _2995 + 1.0;
        _2879 = _2997;
    }
    float _2999 = _2879;
    float _3001 = _2945 * _2999;
    float _3003 = -_2887;
    float _3005 = _3003 + 1.0;
    bool _3007 = _2945 > 0.0;
    bool _3009 = isnan(_2945);
    bool _3011 = _3007 || _3009;
    bool _3013 = isnan(0.0);
    bool _3015 = _3011 || _3013;
    float _3017 = _2871 + _2746;
    float _3019 = _3001 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3021 = _3005 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    bool _3023 = _2999 <= 0.0;
    bool _3025 = !_3015;
    bool _3027 = _3023 || _3025;
    float _3029 = _3017 * 0.5;
    float _3031 = _3021 * _2806;
    float _3033 = -_3021;
    float _3035 = _3033 + 1.0;
    out.gl_Position.x = _2774;
    out.gl_Position.y = _2776;
    out.gl_Position.z = _2871;
    out.gl_Position.w = _2746;
    float _3037 = _3019 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3039 = _2817 * _3031;
    float _3041 = _2827 * _3031;
    out.m_70.z = _3029;
    out.m_70.w = _2746;
    float _3043 = fma(_2823, _3039, _2811);
    float _3045 = fma(_2825, _3039, _2813);
    float _3047 = _2817 * _3035;
    float _3049 = fma(_2817, _3041, _2815);
    out.m_45.x = _3037;
    out.m_72.x = _3043;
    out.m_72.y = _3045;
    out.m_72.z = _3049;
    out.m_72.w = _3047;
    if (!_3027)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_45.x = 0.0;
    float _3051 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3051;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    bool _717 = false;
    bool _589 = false;
    bool _447 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _86 = in.m_42.w;
    float _88 = trunc(_86);
    int _91 = int(_88);
    bool _95 = _91 >= 1;
    float _97 = 0.0;
    if (!_95)
    {
        _97 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _99 = _97;
    float _101 = _99;
    if (!_95)
    {
        out.m_45.x = 0.0;
    }
    int _103 = 0;
    if (!_95)
    {
        float _105 = _99 * 5.0;
        _103 = as_type<int>(_105);
    }
    int _107 = _103;
    int _109 = _107;
    if (!_95)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3108 = as_type<float>(_107);
        out.gl_Position.z = _3108;
    }
    if (!_95)
    {
        return out;
    }
    float _111 = in.m_47.w;
    bool _113 = _111 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _115 = isnan(_111);
    bool _117 = _113 || _115;
    bool _119 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _121 = _117 || _119;
    float _123 = -_111;
    float _125 = _123 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_121)
    {
        float _127 = float(_91);
        _101 = _127;
    }
    float _129 = _101;
    bool _131 = _125 >= _129;
    bool _133 = !_121;
    bool _135 = _131 || _133;
    float _137 = _129;
    if (_135)
    {
        _137 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _139 = _137;
    if (_135)
    {
        out.m_45.x = 0.0;
    }
    if (_135)
    {
        float _141 = _139 * 5.0;
        _109 = as_type<int>(_141);
    }
    int _143 = _109;
    if (_135)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3177 = as_type<float>(_143);
        out.gl_Position.z = _3177;
    }
    if (_135)
    {
        return out;
    }
    float _145 = as_type<float>(int(gl_VertexIndex));
    float _147 = _125 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _149 = in.m_52.w;
    bool _151 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _153 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _155 = _151 || _153;
    bool _157 = isnan(1.0);
    bool _159 = _155 || _157;
    float _161 = in.m_47.x;
    float _163 = in.m_47.y;
    float _165 = in.m_47.z;
    float _167 = in.m_42.x;
    float _169 = in.m_42.y;
    float _171 = in.m_42.z;
    float _173 = 0.0;
    float _175 = _147;
    if (!_159)
    {
        float _177 = _147 * _147;
        float _179 = _177 * 0.5;
        _173 = _179;
    }
    float _181 = _173;
    float _183 = _181;
    if (!_159)
    {
        float _185 = _181 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _183 = _185;
    }
    float _187 = _183;
    int _189 = as_type<int>(_145) & 1;
    bool _191 = _189 != 0;
    int _193 = as_type<int>(_145) & 2;
    bool _195 = _193 != 0;
    bool _197 = !_191;
    float _199 = _197 ? (-0.5) : 0.5;
    bool _201 = !_195;
    float _203 = _201 ? (-0.5) : 0.5;
    bool _205 = !_159;
    float _207 = _187;
    float _209 = 0.0;
    float _211 = _145;
    bool _213 = false;
    if (!_205)
    {
        float _215 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _217 = log2(_215);
        float _219 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _221 = _219 + 1.0;
        float _223 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _225 = _147 * _217;
        float _227 = 1.0 / _221;
        float _229 = _223 * 0.693147182464599609375;
        float _231 = exp2(_225);
        float _233 = 1.0 / _229;
        float _235 = _231 + (-1.0);
        float _237 = -_235;
        float _239 = fma(_237, _233, _147);
        float _241 = _239 * _227;
        float _243 = _241 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _207 = _243;
        _209 = _227;
        _211 = _233;
    }
    float _245 = _207;
    float _247 = _209;
    float _249 = _211;
    bool _251 = !_159;
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
        float _269 = _147 * _261;
        float _271 = exp2(_269);
        float _273 = -_271;
        float _275 = _273 + 1.0;
        float _277 = _275 * _267;
        _175 = _277;
        _253 = _265;
    }
    float _279 = _175;
    float _281 = _253;
    float _283 = _281;
    if (!_159)
    {
        float _285 = _125 * _125;
        float _287 = _285 * 0.5;
        _255 = _287;
    }
    float _289 = _255;
    float _291 = _245 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _293 = _245 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _295 = _245 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    if (!_159)
    {
        _283 = _125;
    }
    float _297 = _283;
    float _299 = fma(_279, _161, _291);
    float _301 = fma(_279, _163, _293);
    float _303 = _297;
    if (!_159)
    {
        float _305 = _289 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _257 = _305;
    }
    float _307 = _257;
    bool _309 = !_159;
    float _311 = _307;
    if (!_309)
    {
        float _313 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _315 = log2(_313);
        float _317 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _319 = _317 + 1.0;
        float _321 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _323 = _125 * _315;
        float _325 = 1.0 / _319;
        float _327 = _321 * 0.693147182464599609375;
        float _329 = exp2(_323);
        float _331 = 1.0 / _327;
        float _333 = _329 + (-1.0);
        float _335 = -_333;
        float _337 = fma(_335, _331, _125);
        float _339 = _337 * _325;
        float _341 = _339 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _311 = _341;
    }
    float _343 = _311;
    bool _345 = !_159;
    if (!_345)
    {
        float _347 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _349 = log2(_347);
        float _351 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _353 = _351 + 1.0;
        float _355 = 1.0 / _353;
        float _357 = _125 * _349;
        float _359 = exp2(_357);
        float _361 = -_359;
        float _363 = _361 + 1.0;
        float _365 = _363 * _355;
        _303 = _365;
    }
    float _367 = _303;
    float _369 = _343 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _371 = _343 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    bool _373 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _375 = _343 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _377 = fma(_367, _163, _369);
    float _379 = fma(_301, _149, _169);
    float _381 = fma(_367, _161, _371);
    float _383 = fma(_279, _165, _295);
    float _385 = -_377;
    float _387 = _301 + _385;
    float _389 = fma(_367, _165, _375);
    float _391 = fma(_299, _149, _167);
    float _393 = -_381;
    float _395 = _299 + _393;
    float _397 = _387 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _399 = _387 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _401 = _387 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _403 = -_389;
    float _405 = _383 + _403;
    float _407 = fma(_395, (*spvDescriptorSet0.vp_c10)._m0[4].x, _397);
    float _409 = fma(_395, (*spvDescriptorSet0.vp_c10)._m0[5].x, _399);
    float _411 = fma(_395, (*spvDescriptorSet0.vp_c10)._m0[6].x, _401);
    float _413 = fma(_383, _149, _171);
    float _415 = fma(_405, (*spvDescriptorSet0.vp_c10)._m0[4].z, _407);
    float _417 = fma(_405, (*spvDescriptorSet0.vp_c10)._m0[5].z, _409);
    float _419 = fma(_405, (*spvDescriptorSet0.vp_c10)._m0[6].z, _411);
    bool _421 = !_373;
    float _423 = _417;
    float _425 = _415;
    float _427 = _419;
    float _445;
    if (!_421)
    {
        float _429 = in.m_54.x;
        float _431 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _433 = _429 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _435 = fma(_433, (*spvDescriptorSet0.vp_c9)._m0[11].y, _125);
        float _437 = _435 * _431;
        float _439 = floor(_437);
        float _441 = -_439;
        float _443 = _437 + _441;
        _445 = _443;
        _447 = true;
    }
    else
    {
        float _449 = float(_91);
        float _451 = 1.0 / _449;
        float _453 = _125 * _451;
        _445 = _453;
    }
    _447 = false;
    float _455 = _445;
    float _457 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _459 = _455 + _457;
    float _461 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _463 = _461 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _465 = _455 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _467 = isnan(_455);
    bool _469 = _465 || _467;
    bool _471 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _473 = _469 || _471;
    float _475 = float(_473);
    float _477 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _479 = _477 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _481 = _455 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _483 = isnan(_455);
    bool _485 = _481 || _483;
    bool _487 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _489 = _485 || _487;
    float _491 = float(_489);
    float _493 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _495 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _493;
    bool _497 = _455 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _499 = isnan(_455);
    bool _501 = _497 || _499;
    bool _503 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _505 = _501 || _503;
    float _507 = float(_505);
    float _509 = 1.0 / _463;
    float _511 = -_475;
    float _513 = _511 + 1.0;
    bool _515 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _517 = 1.0 / _479;
    float _519 = _495 * _509;
    float _521 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _523 = _521 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _525 = -_507;
    float _527 = _525 + 1.0;
    float _529 = fma(_519, _459, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _531 = _491 * _513;
    float _533 = -_491;
    float _535 = _533 + 1.0;
    float _537 = _475 * _527;
    float _539 = _523 * _517;
    float _541 = _529 * _531;
    float _543 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _545 = _455 + _543;
    float _547 = fma(_535, (*spvDescriptorSet0.vp_c9)._m0[115].x, _541);
    float _549 = fma(_539, _545, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _551 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _553 = fma(_549, _537, _547);
    float _555 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _557 = _551 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _559 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _561 = fma(_507, (*spvDescriptorSet0.vp_c9)._m0[117].x, _553);
    float _563 = _555 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _565 = _559 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _567 = _561 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_56.x = _557;
    out.m_56.y = _563;
    out.m_56.z = _565;
    out.m_56.w = _567;
    bool _569 = !_515;
    float _587;
    if (!_569)
    {
        float _571 = in.m_54.x;
        float _573 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _575 = _571 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _577 = fma(_575, (*spvDescriptorSet0.vp_c9)._m0[11].z, _125);
        float _579 = _577 * _573;
        float _581 = floor(_579);
        float _583 = -_581;
        float _585 = _579 + _583;
        _587 = _585;
        _589 = true;
    }
    else
    {
        float _591 = float(_91);
        float _593 = 1.0 / _591;
        float _595 = _125 * _593;
        _587 = _595;
    }
    _589 = false;
    float _597 = _587;
    float _599 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _601 = _597 + _599;
    bool _603 = _597 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _605 = isnan(_597);
    bool _607 = _603 || _605;
    bool _609 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _611 = _607 || _609;
    float _613 = float(_611);
    float _615 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _617 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _615;
    bool _619 = _597 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _621 = isnan(_597);
    bool _623 = _619 || _621;
    bool _625 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _627 = _623 || _625;
    float _629 = float(_627);
    float _631 = -_613;
    float _633 = _631 + 1.0;
    float _635 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _637 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _635;
    float _639 = 1.0 / _617;
    bool _641 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _643 = _629 * _633;
    float _645 = -_629;
    float _647 = _645 + 1.0;
    float _649 = _601 * _639;
    float _651 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _653 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _651;
    float _655 = fma(_637, _649, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _657 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _659 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _657;
    float _661 = fma(_653, _649, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _663 = _655 * _643;
    float _665 = fma(_659, _649, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _667 = _661 * _643;
    float _669 = _665 * _643;
    float _671 = fma(_647, (*spvDescriptorSet0.vp_c9)._m0[123].x, _663);
    float _673 = fma(_647, (*spvDescriptorSet0.vp_c9)._m0[123].y, _669);
    float _675 = fma(_647, (*spvDescriptorSet0.vp_c9)._m0[123].z, _667);
    float _677 = fma(_613, (*spvDescriptorSet0.vp_c9)._m0[124].x, _671);
    float _679 = fma(_613, (*spvDescriptorSet0.vp_c9)._m0[124].y, _673);
    float _681 = fma(_613, (*spvDescriptorSet0.vp_c9)._m0[124].z, _675);
    float _683 = _677 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _685 = _679 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _687 = _681 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _689 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _691 = _683 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _693 = _685 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _695 = _687 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_58.x = _691;
    out.m_58.y = _693;
    out.m_58.z = _695;
    out.m_58.w = _689;
    bool _697 = !_641;
    float _715;
    if (!_697)
    {
        float _699 = in.m_54.x;
        float _701 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _703 = _699 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _705 = fma(_703, (*spvDescriptorSet0.vp_c9)._m0[14].x, _125);
        float _707 = _705 * _701;
        float _709 = floor(_707);
        float _711 = -_709;
        float _713 = _707 + _711;
        _715 = _713;
        _717 = true;
    }
    else
    {
        float _719 = float(_91);
        float _721 = 1.0 / _719;
        float _723 = _125 * _721;
        _715 = _723;
    }
    _717 = false;
    float _725 = _715;
    float _727 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _729 = int(_727);
    float _731 = in.m_54.z;
    float _733 = in.m_54.w;
    float _735 = _379 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _737 = fma(_391, (*spvDescriptorSet0.vp_c10)._m0[5].x, _735);
    float _739 = float(_91);
    float _741 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _743 = int(_741);
    float _745 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _747 = _745 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _749 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _751 = _749 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _753 = fma(_413, (*spvDescriptorSet0.vp_c10)._m0[5].z, _737);
    float _755 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _757 = _755 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _759 = float(_729);
    float _761 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _763 = _761 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _765 = 1.0 / _747;
    float _767 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _769 = _767 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _771 = float(uint(_743));
    float _773 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _775 = _773 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _777 = _733 > 0.5;
    float _779 = 1.0 / _759;
    float _781 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _783 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _781;
    float _785 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _787 = _785 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _789 = 1.0 / _771;
    float _791 = _125 * _779;
    float _793 = 1.0 / _751;
    int _795 = as_type<int>(_789) + (-2);
    float _797 = trunc(_791);
    int _799 = int(_797);
    int _801 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _803 = _801 != 0;
    float _805 = _379 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _807 = _379 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _809 = 1.0 / _787;
    float _811 = fma(_391, (*spvDescriptorSet0.vp_c10)._m0[4].x, _805);
    float _813 = fma(_391, (*spvDescriptorSet0.vp_c10)._m0[6].x, _807);
    int _815 = ~_743;
    int _817 = _815 + 1;
    float _819 = fma(_413, (*spvDescriptorSet0.vp_c10)._m0[4].z, _811);
    float _821 = fma(_413, (*spvDescriptorSet0.vp_c10)._m0[6].z, _813);
    float _823 = float(uint(_799));
    float _825 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _827 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _825;
    float _829 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _831 = _829 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _833 = 1.0 / _757;
    int _835 = as_type<int>(_765);
    float _837 = _833;
    if (_803)
    {
        _213 = false;
    }
    bool _839 = _213;
    float _841 = as_type<float>(_795) * _823;
    float _843 = _831 * _793;
    float _845 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _847 = _845 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _849 = _783 * _809;
    float _851 = trunc(_841);
    float _853 = precise::max(_851, 0.0);
    uint _856 = uint(_853);
    float _858 = 1.0 / _763;
    float _860 = _841;
    float _862 = _805;
    float _864 = _809;
    bool _866 = _839;
    if (_803)
    {
        float _868 = in.m_54.x;
        float _870 = in.m_54.y;
        _860 = _868;
        _862 = _870;
    }
    float _872 = _860;
    float _874 = _862;
    int _876 = _817 * int(_856);
    int _878 = _876 + _799;
    float _880 = 1.0 / _739;
    float _882 = float(uint(_878));
    float _884 = _827 * _765;
    float _886 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _888 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _886;
    float _890 = _847 * _858;
    float _892 = 1.0 / _769;
    float _894 = as_type<float>(_795) * _882;
    float _896 = _888 * _833;
    float _898 = _882;
    float _900 = _858;
    if (_803)
    {
        _835 = 0;
    }
    int _902 = _835;
    int _904 = _902;
    if (_803)
    {
        _898 = 1.0;
    }
    float _906 = _898;
    float _908 = 1.0 / _775;
    float _910 = _906;
    float _912 = _874;
    float _914 = _872;
    if (_803)
    {
        _864 = _872;
    }
    float _916 = _864;
    float _918 = _916;
    if (_803)
    {
        _837 = _874;
    }
    float _920 = _837;
    float _922 = _920;
    if (_803)
    {
        _900 = _916;
    }
    float _924 = _900;
    float _926 = trunc(_894);
    float _928 = precise::max(_926, 0.0);
    uint _930 = uint(_928);
    float _932 = _924;
    if (!_803)
    {
        float _934 = in.m_54.x;
        float _936 = in.m_54.y;
        float _938 = _934 * 3.1415927410125732421875;
        float _940 = _938 * 0.15915493667125701904296875;
        float _942 = _936 * 3.1415927410125732421875;
        float _944 = _942 * 0.15915493667125701904296875;
        float _946 = _940 * 6.283185482025146484375;
        float _948 = sin(_946);
        float _950 = _944 * 6.283185482025146484375;
        float _952 = sin(_950);
        _910 = 1.2345600128173828125;
        _918 = _936;
        _866 = true;
        _922 = _952;
        _904 = 2;
        _912 = _936;
        _932 = _948;
        _914 = _934;
    }
    float _954 = _910;
    float _956 = _918;
    bool _958 = _866;
    float _960 = _922;
    int _962 = _904;
    float _964 = _912;
    float _966 = _932;
    float _968 = _914;
    float _970 = _954 * _956;
    int _972 = int(_856) + int(_930);
    float _974 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _976 = _974 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    int _978 = ~_743;
    int _980 = _978 + 1;
    float _982 = floor(_970);
    float _984 = _976 * _892;
    float _986 = float(_743);
    int _988 = _980 * _972;
    int _990 = _988 + _799;
    float _992 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _994 = _725 + _992;
    float _996 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _998 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _996;
    float _1000 = float(_799);
    float _1002 = _125 * _986;
    bool _1004 = uint(_990) >= uint(_743);
    float _1006 = _998 * _908;
    bool _1008 = _1000 >= _986;
    bool _1010 = isnan(_1000);
    bool _1012 = _1008 || _1010;
    bool _1014 = isnan(_986);
    bool _1016 = _1012 || _1014;
    float _1018 = float(_1016);
    float _1020 = _1002 * _880;
    bool _1022 = !_1004;
    int _1024 = _1022 ? 0 : (-1);
    float _1026 = fma(_884, _994, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _1028 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1030 = _725 + _1028;
    float _1032 = -_982;
    float _1034 = _970 + _1032;
    int _1036 = ~_972;
    int _1038 = _1036 + _1024;
    int _1040 = _1038 + 1;
    float _1042 = trunc(_1018);
    int _1044 = int(_1042);
    float _1046 = _986 * _1034;
    float _1048 = fma(_843, _1030, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    bool _1050 = _743 == 0;
    float _1052 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1054 = _725 + _1052;
    int _1056 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1058 = _1056 != 0;
    int _1060 = _743 * _1040;
    int _1062 = _1060 + _799;
    float _1064 = trunc(_1046);
    int _1066 = int(_1064);
    float _1068 = fma(_896, _1054, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    int _1070 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1072 = _1070 != 0;
    int _1074 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1076 = _1074 != 0;
    float _1078 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1080 = _725 + _1078;
    bool _1082 = !_1050;
    int _1084 = _1082 ? _1062 : (-1);
    float _1086 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1088 = _725 + _1086;
    bool _1090 = !_1058;
    int _1092 = _1090 ? 0 : 1;
    float _1094 = fma(_849, _1080, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    bool _1096 = !_1076;
    int _1098 = _1096 ? 0 : 1;
    float _1100 = trunc(_1020);
    int _1102 = int(_1100);
    int _1104 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1106 = _1104 != 0;
    int _1108 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1110 = _1108 != 0;
    float _1112 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1114 = _725 + _1112;
    int _1116 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _1118 = _1116 != 0;
    float _1120 = fma(_984, _1088, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    int _1122 = ~_1044;
    int _1124 = _1122 + 1;
    int _1126 = _1124 + 1;
    float _1128 = fma(_1006, _1114, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    bool _1130 = !_1072;
    int _1132 = _1130 ? 0 : 1;
    float _1134 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    int _1136 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _1138 = _1136 != 0;
    int _1140 = _1084 * _1126;
    int _1142 = _743 + (-1);
    float _1144 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1146 = _725 + _1144;
    int _1148 = abs(_1092);
    float _1150 = _821 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _1152 = abs(_1098);
    int _1154 = _1044 * _1142;
    int _1156 = _1154 + _1140;
    int _1158 = abs(_1132);
    float _1160 = as_type<float>(_1044);
    float _1162 = _1026;
    bool _1164 = _1106;
    bool _1166 = _1110;
    float _1168 = _964;
    if (_1118)
    {
        float _1170 = in.m_54.w;
        _1160 = _1170;
    }
    float _1172 = _1160;
    float _1174 = fma(_890, _1146, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    int _1176 = _1156 * _1152;
    bool _1178 = _725 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1180 = isnan(_725);
    bool _1182 = _1178 || _1180;
    bool _1184 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1186 = _1182 || _1184;
    float _1188 = float(_1186);
    float _1190 = _819 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _1192 = _1066 * _1148;
    int _1194 = _1192 + _799;
    bool _1196 = !_1106;
    int _1198 = _1196 ? 0 : 1;
    float _1200 = as_type<float>(_1148);
    if (_1138)
    {
        float _1202 = in.m_54.x;
        _1200 = _1202;
    }
    float _1204 = _1200;
    int _1206 = _1102 * _1158;
    int _1208 = _1206 + _1176;
    bool _1210 = _725 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _1212 = isnan(_725);
    bool _1214 = _1210 || _1212;
    bool _1216 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _1218 = _1214 || _1216;
    float _1220 = float(_1218);
    float _1222 = -_1188;
    float _1224 = _1222 + 1.0;
    bool _1226 = _725 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _1228 = isnan(_725);
    bool _1230 = _1226 || _1228;
    bool _1232 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _1234 = _1230 || _1232;
    float _1236 = float(_1234);
    bool _1238 = !_1110;
    int _1240 = _1238 ? 0 : 1;
    float _1242 = _1220 * _1224;
    int _1244 = abs(_1198);
    float _1246 = -_1220;
    float _1248 = _1246 + 1.0;
    bool _1250 = _725 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _1252 = isnan(_725);
    bool _1254 = _1250 || _1252;
    bool _1256 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _1258 = _1254 || _1256;
    float _1260 = float(_1258);
    float _1262 = -_1236;
    float _1264 = _1262 + 1.0;
    int _1266 = abs(_1240);
    float _1268 = _1236 * _1248;
    int _1270 = _1194 * _1244;
    int _1272 = _1270 + _1208;
    bool _1274 = _725 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _1276 = isnan(_725);
    bool _1278 = _1274 || _1276;
    bool _1280 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _1282 = _1278 || _1280;
    float _1284 = float(_1282);
    float _1286 = _1260 * _1264;
    float _1288 = -_1260;
    float _1290 = _1288 + 1.0;
    int _1292 = _1066 * _1266;
    int _1294 = _1292 + _1272;
    bool _1296 = _725 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _1298 = isnan(_725);
    bool _1300 = _1296 || _1298;
    bool _1302 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _1304 = _1300 || _1302;
    float _1306 = float(_1304);
    float _1308 = _1172;
    float _1310 = as_type<float>(_1272);
    float _1312 = _1306;
    if (_1118)
    {
        float _1314 = _1172 * 3.1415927410125732421875;
        _1308 = _1314;
    }
    float _1316 = _1308;
    float _1318 = -_1284;
    float _1320 = _1318 + 1.0;
    float _1322 = _1284 * _1290;
    bool _1324 = _725 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1326 = isnan(_725);
    bool _1328 = _1324 || _1326;
    bool _1330 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _1332 = _1328 || _1330;
    float _1334 = float(_1332);
    float _1336 = _1320;
    if (_1118)
    {
        float _1338 = _1316 * 0.15915493667125701904296875;
        _1310 = _1338;
    }
    float _1340 = _1310;
    float _1342 = _1306 * _1320;
    float _1344 = _1342;
    if (_1138)
    {
        float _1346 = _1204 * 3.1415927410125732421875;
        _1336 = _1346;
    }
    float _1348 = _1336;
    float _1350 = -_1306;
    float _1352 = _1350 + 1.0;
    bool _1354 = _725 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _1356 = isnan(_725);
    bool _1358 = _1354 || _1356;
    bool _1360 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _1362 = _1358 || _1360;
    float _1364 = float(_1362);
    if (_1138)
    {
        float _1366 = _1348 * 0.15915493667125701904296875;
        _1312 = _1366;
    }
    float _1368 = _1312;
    float _1370 = -_1334;
    float _1372 = _1370 + 1.0;
    float _1374 = _1340;
    if (_1118)
    {
        float _1376 = _1340 * 6.283185482025146484375;
        float _1378 = sin(_1376);
        _1374 = _1378;
    }
    float _1380 = _1374;
    float _1382 = _1334 * _1352;
    float _1384 = _1364 * _1372;
    float _1386 = float(uint(_1294));
    float _1388 = _1334;
    float _1390 = _1382;
    if (_958)
    {
        float _1392 = in.m_54.z;
        _1388 = _1392;
    }
    float _1394 = _1388;
    float _1396 = -_1364;
    float _1398 = _1396 + 1.0;
    float _1400 = _1026 * _1384;
    if (!_1118)
    {
        _1162 = _199;
    }
    float _1402 = _1162;
    float _1404 = as_type<float>(_795) * _1386;
    float _1406 = _1368;
    float _1408 = _1402;
    if (_1138)
    {
        float _1410 = _1368 * 6.283185482025146484375;
        float _1412 = sin(_1410);
        _1406 = _1412;
    }
    float _1414 = _1406;
    float _1416 = fma(_1398, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1400);
    float _1418 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    float _1420 = _960 * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    float _1422 = _1416;
    if (_1118)
    {
        bool _1424 = _1380 > 0.5;
        _1164 = _1424;
    }
    bool _1426 = _1164;
    float _1428 = fma(_1048, _1382, _1416);
    float _1430 = trunc(_1404);
    float _1432 = precise::max(_1430, 0.0);
    uint _1434 = uint(_1432);
    float _1436 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    float _1438 = _1428;
    if (_1118)
    {
        float _1440 = -_199;
        float _1442 = _1426 ? _1440 : _199;
        _1408 = _1442;
    }
    float _1444 = _1408;
    float _1446 = fma(_1068, _1342, _1428);
    bool _1448 = _962 != 2;
    float _1450 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    int _1452 = ~_743;
    int _1454 = _1452 + 1;
    float _1456 = fma(_964, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1450);
    int _1458 = int(_1138);
    int _1460 = _1118 ? 2 : 0;
    int _1462 = _1458 | _1460;
    int _1464 = _1448 ? 4 : 0;
    int _1466 = _1462 | _1464;
    int _1468 = _1110 ? 8 : 0;
    int _1470 = _1466 | _1468;
    int _1472 = _958 ? 16 : 0;
    int _1474 = _1470 | _1472;
    int _1476 = _777 ? 32 : 0;
    int _1478 = _1474 | _1476;
    int _1480 = _159 ? 64 : 0;
    int _1482 = _1478 | _1480;
    int _1484 = _1482 & 64;
    float _1486 = _1414;
    if (_1138)
    {
        bool _1488 = _1414 > 0.5;
        _1166 = _1488;
    }
    bool _1490 = _1166;
    float _1492 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    int _1494 = _1454 * int(_1434);
    int _1496 = _1494 + _1294;
    bool _1498 = _731 > 0.5;
    float _1500 = fma(_960, (*spvDescriptorSet0.vp_c9)._m0[93].w, _1492);
    float _1502 = _1394;
    if (_958)
    {
        _1390 = _1394;
    }
    float _1504 = _1390;
    float _1506 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    float _1508 = float(uint(_1496));
    float _1510 = _1504;
    if (_958)
    {
        _1422 = _964;
    }
    float _1512 = _1422;
    float _1514 = fma(_1420, -2.0, _1506);
    float _1516 = _1512;
    if (_958)
    {
        _1486 = _964;
    }
    float _1518 = _1486;
    float _1520 = as_type<float>(_795) * _1508;
    float _1522 = fma(_966, (*spvDescriptorSet0.vp_c9)._m0[93].z, _1418);
    float _1524 = _966 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    float _1526 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    float _1528 = _1518;
    float _1530 = _1522;
    if (!_958)
    {
        _1510 = _964;
    }
    float _1532 = _1510;
    float _1534 = -_1436;
    float _1536 = fma(_1524, 2.0, _1534);
    float _1538 = fma(_1174, _1322, _1446);
    float _1540 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    if (!_958)
    {
        _1502 = _964;
    }
    float _1542 = _1502;
    float _1544 = fma(_1094, _1286, _1538);
    float _1546 = trunc(_1520);
    float _1548 = precise::max(_1546, 0.0);
    uint _1550 = uint(_1548);
    bool _1552 = _964 > 0.5;
    float _1554 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    if (_1448)
    {
        _1438 = _968;
    }
    float _1556 = _1438;
    float _1558 = -_125;
    float _1560 = fma(_1558, (*spvDescriptorSet0.vp_c9)._m0[91].x, _1536);
    float _1562 = _1556;
    if (!_1448)
    {
        _1562 = _731;
    }
    float _1564 = _1562;
    float _1566 = fma(_968, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1554);
    if (!_1448)
    {
        _1168 = _968;
    }
    float _1568 = _1168;
    float _1570 = _968 * 6.283185482025146484375;
    int _1572 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1574 = _1572 != 0;
    float _1576 = _1526 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    float _1578 = -_199;
    int _1580 = _1498 ? as_type<int>(_1578) : as_type<int>(_199);
    float _1582 = _1570 * 0.15915493667125701904296875;
    if (!_958)
    {
        _1516 = _968;
    }
    float _1584 = _1516;
    float _1586 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[91].y, _1514);
    if (!_958)
    {
        _1528 = _968;
    }
    float _1588 = _1528;
    float _1590 = _1582 * 6.283185482025146484375;
    float _1592 = cos(_1590);
    float _1594 = -_203;
    int _1596 = _777 ? as_type<int>(_1594) : as_type<int>(_203);
    float _1598 = _1584 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _1600 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1602 = _1600 != 0;
    float _1604 = fma(_1588, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1540);
    bool _1606 = !_1574;
    float _1608 = _1606 ? _199 : as_type<float>(_1580);
    float _1610 = _1564 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    bool _1612 = _968 > 0.5;
    bool _1614 = !_1602;
    float _1616 = _1614 ? _203 : as_type<float>(_1596);
    int _1618 = int(_1434) + int(_1550);
    int _1620 = ~_743;
    int _1622 = _1620 + 1;
    int _1624 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1626 = _1624 != 0;
    int _1628 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1630 = _1628 != 0;
    float _1632 = -_203;
    int _1634 = _1498 ? as_type<int>(_1632) : as_type<int>(_203);
    int _1636 = _1622 * _1618;
    int _1638 = _1636 + _1294;
    if (!_1138)
    {
        _1344 = _203;
    }
    float _1640 = _1344;
    bool _1642 = !_1630;
    float _1644 = _1642 ? _203 : as_type<float>(_1634);
    float _1646 = _1582 * 6.283185482025146484375;
    float _1648 = sin(_1646);
    float _1650 = _1640;
    if (_1138)
    {
        float _1652 = -_203;
        float _1654 = _1490 ? _1652 : _203;
        _1650 = _1654;
    }
    float _1656 = _1650;
    bool _1658 = uint(_1638) >= uint(_743);
    float _1660 = _1656 + (-0.5);
    float _1662 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _1664 = _1484 != 0;
    int _1666 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1668 = _1666 != 0;
    float _1670 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1672 = -_199;
    int _1674 = _1552 ? as_type<int>(_1672) : as_type<int>(_199);
    float _1676 = fma(_1542, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1662);
    float _1678 = -_203;
    int _1680 = _1552 ? as_type<int>(_1678) : as_type<int>(_203);
    float _1682 = -_1670;
    float _1684 = fma(_1598, 2.0, _1682);
    bool _1686 = !_1658;
    int _1688 = _1686 ? 0 : (-1);
    float _1690 = fma(_1120, _1268, _1544);
    int _1692 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1694 = _1692 != 0;
    int _1696 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1698 = _1696 != 0;
    float _1700 = _1134 * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    float _1702 = _1444 + 0.5;
    float _1704 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    int _1706 = ~_1618;
    int _1708 = _1706 + _1688;
    int _1710 = _1708 + 1;
    float _1712 = fma(_1576, _1702, _1560);
    float _1714 = _203 * _1648;
    bool _1716 = !_1698;
    float _1718 = _1716 ? _203 : as_type<float>(_1680);
    float _1720 = _203 * _1592;
    float _1722 = -_199;
    int _1724 = _1612 ? as_type<int>(_1722) : as_type<int>(_199);
    float _1726 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    bool _1728 = !_1626;
    float _1730 = _1728 ? _199 : as_type<float>(_1674);
    float _1732 = _1532 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1734 = -_1714;
    float _1736 = fma(_199, _1592, _1734);
    bool _1738 = !_1694;
    float _1740 = _1738 ? _199 : as_type<float>(_1724);
    float _1742 = _1568 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1744 = fma(_199, _1648, _1720);
    float _1746 = fma(_1732, -2.0, _1726);
    float _1748 = in.m_52.x;
    float _1750 = in.m_52.y;
    float _1752 = float(uint(_1194));
    float _1754 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1756 = -_1700;
    float _1758 = -_1586;
    float _1760 = fma(_1756, _1660, _1758);
    float _1762 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1764 = as_type<float>(_795) * _1752;
    int _1766 = _743 * _1710;
    int _1768 = _1766 + _1294;
    bool _1770 = _743 == 0;
    float _1772 = -_1762;
    float _1774 = fma(_1610, 2.0, _1772);
    float _1776 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1778 = _1704 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1780 = _1608 + 0.5;
    float _1782 = -_125;
    float _1784 = fma(_1782, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1684);
    float _1786 = trunc(_1764);
    float _1788 = precise::max(_1786, 0.0);
    uint _1790 = uint(_1788);
    float _1792 = _1730 + 0.5;
    float _1794 = -_125;
    float _1796 = fma(_1794, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1774);
    float _1798 = fma(_1128, _1242, _1690);
    float _1800 = fma(_1742, -2.0, _1776);
    bool _1802 = !_1770;
    int _1804 = _1802 ? _1768 : (-1);
    float _1806 = fma(_1780, (*spvDescriptorSet0.vp_c9)._m0[85].x, _1784);
    float _1808 = fma(_1778, _1792, _1796);
    float _1810 = _1754 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1812 = _1644 + (-0.5);
    float _1814 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1800);
    int _1816 = _1804 >> 31;
    float _1818 = fma(_1188, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1798);
    float _1820 = _1750 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1822 = -_1810;
    float _1824 = -_1814;
    float _1826 = fma(_1822, _1812, _1824);
    int _1828 = _1816 & 3;
    float _1830 = _1748 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    int _1832 = ~_743;
    int _1834 = _1832 + 1;
    float _1836 = _1820 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    int _1838 = _1804 + _1828;
    float _1840 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1744);
    float _1842 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1746);
    int _1844 = _1834 * int(_1790);
    int _1846 = _1844 + _1194;
    int _1848 = _1838 >> 2;
    float _1850 = _1830 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1852 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1736);
    float _1854 = _1836 * _1840;
    float _1856 = float(uint(_1846));
    float _1858 = _1616 + (-0.5);
    int _1860 = _1848 << 4;
    int _1862 = _1860 + 512;
    float _1864 = _1850 * _1852;
    float _1866 = _1854 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1868 = as_type<float>(_795) * _1856;
    uint _1870 = uint(int(uint(_1862) >> uint(2)));
    uint _1872 = uint(int(uint(int(_1870)) >> uint(2)));
    int _1874 = int(_1870) & 3;
    float _1876 = (*spvDescriptorSet0.vp_c9)._m0[int(_1872)][_1874];
    int _1878 = int(_1870) + 1;
    uint _1880 = uint(int(uint(_1878) >> uint(2)));
    int _1882 = _1878 & 3;
    float _1884 = (*spvDescriptorSet0.vp_c9)._m0[int(_1880)][_1882];
    float _1886 = _1854 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1888 = _1854 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1890 = -_1858;
    float _1892 = -_1842;
    float _1894 = fma(_1890, (*spvDescriptorSet0.vp_c9)._m0[85].y, _1892);
    float _1896 = fma(_1864, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1866);
    float _1898 = trunc(_1868);
    float _1900 = precise::max(_1898, 0.0);
    uint _1902 = uint(_1900);
    float _1904 = fma(_1864, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1886);
    float _1906 = fma(_1864, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1888);
    int _1908 = _1804 & 3;
    int _1910 = _1862 + 8;
    uint _1912 = uint(int(uint(_1910) >> uint(2)));
    uint _1914 = uint(int(uint(int(_1912)) >> uint(2)));
    int _1916 = int(_1912) & 3;
    float _1918 = (*spvDescriptorSet0.vp_c9)._m0[int(_1914)][_1916];
    int _1920 = int(_1912) + 1;
    uint _1922 = uint(int(uint(_1920) >> uint(2)));
    int _1924 = _1920 & 3;
    float _1926 = (*spvDescriptorSet0.vp_c9)._m0[int(_1922)][_1924];
    float _1928 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    int _1930 = _1804 & 3;
    bool _1932 = _1930 != 0;
    bool _1934 = uint(_1908) > 1u;
    float _1936 = fma(_1928, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1906);
    float _1938 = fma(_1928, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1904);
    int _1940 = _1932 ? 0 : 1;
    float _1942 = fma(_1928, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1896);
    float _1944 = _1936 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1946 = _1938 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    int _1948 = ~_743;
    int _1950 = _1948 + 1;
    float _1952 = _1942 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    int _1954 = int(_1790) + int(_1902);
    int _1956 = ~_1940;
    int _1958 = _1956 + 1;
    int _1960 = _1958 + 1;
    int _1962 = _1960;
    if (!_1934)
    {
        int _1964 = ~_1940;
        int _1966 = _1964 + 1;
        _1962 = _1966;
    }
    int _1968 = _1962;
    float _1970 = _1150 + _1944;
    bool _1972 = _1908 != 3;
    float _1974 = _1190 + _1946;
    bool _1976 = uint(_1908) >= 2u;
    float _1978 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1980 = _1970 + _1978;
    int _1982 = _1950 * _1954;
    int _1984 = _1982 + _1194;
    float _1986 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1988 = _1974 + _1986;
    int _1990 = abs(_1968);
    float _1992 = _1980 * _1980;
    int _1994 = _1976 ? 0 : 1;
    bool _1996 = !_1932;
    int _1998 = _1996 ? 0 : 1;
    bool _2000 = _1908 != 3;
    float _2002 = fma(_1988, _1988, _1992);
    bool _2004 = uint(_1984) >= uint(_743);
    int _2006 = ~_1994;
    int _2008 = _2006 + 1;
    int _2010 = _2008 + 1;
    int _2012 = _2010;
    float _2014 = _1970;
    if (_1972)
    {
        int _2016 = ~_1994;
        int _2018 = _2016 + 1;
        _2012 = _2018;
    }
    int _2020 = _2012;
    int _2022 = abs(_1998);
    float _2024 = sqrt(_2002);
    bool _2026 = !_2000;
    int _2028 = _2026 ? 0 : (-1);
    int _2030 = ~_1990;
    int _2032 = _2030 + 1;
    int _2034 = _2032 + 1;
    int _2036 = abs(_2028);
    int _2038 = abs(_2020);
    int _2040 = _2034 * as_type<int>(_1884);
    int _2042 = ~_2022;
    int _2044 = _2042 + 1;
    int _2046 = _2044 + 1;
    int _2048 = ~_2038;
    int _2050 = _2048 + 1;
    int _2052 = _2050 + 1;
    bool _2054 = !_2004;
    int _2056 = _2054 ? 0 : (-1);
    int _2058 = _2046 * as_type<int>(_1876);
    int _2060 = _2058 + _2040;
    int _2062 = ~_2036;
    int _2064 = _2062 + 1;
    int _2066 = _2064 + 1;
    bool _2068 = _2024 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _2070 = _2052 * as_type<int>(_1918);
    int _2072 = _2070 + _2060;
    bool _2074 = !_1668;
    int _2076 = _2074 ? 0 : 1;
    int _2078 = ~_1954;
    int _2080 = _2078 + _2056;
    int _2082 = _2080 + 1;
    int _2084 = _2066 * as_type<int>(_1926);
    int _2086 = _2084 + _2072;
    int _2088 = abs(_2076);
    float _2090 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2092 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[92].z, _1522);
    int _2094 = _743 * _2082;
    int _2096 = _2094 + _1194;
    int _2098 = ~_2088;
    int _2100 = _2098 + 1;
    int _2102 = _2100 + 1;
    float _2104 = _753 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _2106 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[92].w, _1500);
    float _2108 = -_2092;
    float _2110 = _2108 + 1.0;
    if (!_2068)
    {
        _1530 = _1974;
    }
    float _2112 = _1530;
    int _2114 = _2086 * _2102;
    float _2116 = _2104 + _1952;
    float _2118 = -_2106;
    float _2120 = _2118 + 1.0;
    bool _2122 = !_1770;
    int _2124 = _2122 ? _2096 : (-1);
    bool _2126 = !_2068;
    float _2128 = _2116;
    float _2130 = _2112;
    if (!_2126)
    {
        float _2132 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2134 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2136 = _2024 + _2134;
        float _2138 = _2116 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2140 = rsqrt(_2002);
        float _2142 = _2136 * _2132;
        float _2144 = _2142 * 0.15915493667125701904296875;
        float _2146 = _2144 * 6.283185482025146484375;
        float _2148 = cos(_2146);
        float _2150 = _2144 * 6.283185482025146484375;
        float _2152 = sin(_2150);
        float _2154 = _2148 + (-1.0);
        float _2156 = fma(_2152, _2138, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2158 = _2154 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2160 = _2140 * _2156;
        float _2162 = fma(_2116, _2148, _2158);
        float _2164 = fma(_1988, _2160, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2166 = fma(_1980, _2160, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2128 = _2162;
        _2130 = _2164;
        _2014 = _2166;
    }
    float _2168 = _2128;
    float _2170 = _2130;
    float _2172 = _2014;
    float _2174 = fma(_2120, _1656, _1760);
    float _2176 = -_2104;
    float _2178 = _2176 + _2168;
    int _2180 = _2124 * _2088;
    int _2182 = _2180 + _2114;
    float _2184 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1566);
    float _2186 = -_1190;
    float _2188 = _2186 + _2170;
    float _2190 = _2178 * _2178;
    float _2192 = -_2110;
    float _2194 = fma(_2192, _1444, _1712);
    float _2196 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2198 = -_2184;
    float _2200 = _2198 + 1.0;
    float _2202 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1604);
    float _2204 = -_1150;
    float _2206 = _2204 + _2172;
    float _2208 = fma(_2188, _2188, _2190);
    float _2210 = -_2200;
    float _2212 = fma(_1730, _2210, _1808);
    float _2214 = -_2202;
    float _2216 = _2214 + 1.0;
    float _2218 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1456);
    float _2220 = fma(_2206, _2206, _2208);
    float _2222 = _1740 + 0.5;
    float _2224 = -_1718;
    float _2226 = _2224 + 0.5;
    float _2228 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1676);
    float _2230 = -_2216;
    float _2232 = fma(_1608, _2230, _1806);
    float _2234 = _2222 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2236 = sqrt(_2220);
    float _2238 = _2226 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2240 = -_2228;
    float _2242 = _2240 + 1.0;
    float _2244 = -_2218;
    float _2246 = _2244 + 1.0;
    float _2248 = _2234 * _2090;
    float _2250 = _2238 * _2196;
    float _2252 = fma(_1616, _2242, _1894);
    float _2254 = fma(_1644, _2246, _1826);
    float _2256 = float(_2182);
    out.m_60.x = _2194;
    out.m_60.y = _2174;
    out.m_62.x = _1818;
    bool _2258 = _2236 > 0.0;
    out.m_64.x = _2248;
    out.m_64.y = _2250;
    out.m_64.z = _2232;
    out.m_64.w = _2252;
    out.m_66.x = _2212;
    out.m_66.y = _2254;
    out.m_68.y = _2256;
    bool _2260 = !_2258;
    float _2262 = _2252;
    float _2264 = _2250;
    float _2266 = _2168;
    float _2268 = _2170;
    float _2270 = _2172;
    float _2272 = _2250;
    float _2274 = _2248;
    if (!_2260)
    {
        bool _2276 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _2278 = _2248;
        if (_2276)
        {
            float _2280 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _2278 = _2280;
        }
        float _2282 = _2278;
        float _2284 = _2282;
        if (_2276)
        {
            float _2286 = _415 * _2282;
            _2262 = _2286;
        }
        float _2288 = _2262;
        float _2290 = _2288;
        if (_2276)
        {
            float _2292 = _417 * _2282;
            _2264 = _2292;
        }
        float _2294 = _2264;
        float _2296 = _2294;
        if (_2276)
        {
            float _2298 = _419 * _2282;
            _2284 = _2298;
        }
        float _2300 = _2284;
        float _2302 = _2300;
        float _2304 = _2300;
        if (!_2276)
        {
            float _2306 = _125 + 1.0;
            float _2308 = _2306;
            if (!_1664)
            {
                float _2310 = _2306 * _2306;
                float _2312 = _2310 * 0.5;
                _2302 = _2312;
            }
            float _2314 = _2302;
            float _2316 = _2314;
            if (!_1664)
            {
                float _2318 = _2314 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2316 = _2318;
            }
            float _2320 = _2316;
            bool _2322 = !_1664;
            float _2324 = _2320;
            if (!_2322)
            {
                float _2326 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2328 = log2(_2326);
                float _2330 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2332 = _2330 + 1.0;
                float _2334 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2336 = _2328 * _2306;
                float _2338 = 1.0 / _2332;
                float _2340 = _2334 * 0.693147182464599609375;
                float _2342 = exp2(_2336);
                float _2344 = 1.0 / _2340;
                float _2346 = _2342 + (-1.0);
                float _2348 = -_2346;
                float _2350 = fma(_2348, _2344, _2306);
                float _2352 = _2350 * _2338;
                float _2354 = _2352 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2324 = _2354;
            }
            float _2356 = _2324;
            float _2358 = _2356 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _2360 = _2356 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            bool _2362 = !_1664;
            if (!_2362)
            {
                float _2364 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2366 = log2(_2364);
                float _2368 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2370 = _2368 + 1.0;
                float _2372 = 1.0 / _2370;
                float _2374 = _2366 * _2306;
                float _2376 = exp2(_2374);
                float _2378 = -_2376;
                float _2380 = _2378 + 1.0;
                float _2382 = _2380 * _2372;
                _2308 = _2382;
            }
            float _2384 = _2308;
            float _2386 = fma(_2384, _163, _2360);
            float _2388 = _2356 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _2390 = fma(_2384, _161, _2358);
            float _2392 = -_377;
            float _2394 = _2392 + _2386;
            float _2396 = fma(_2384, _165, _2388);
            float _2398 = -_381;
            float _2400 = _2398 + _2390;
            float _2402 = _2394 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _2404 = _2394 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _2406 = _2394 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _2408 = -_389;
            float _2410 = _2408 + _2396;
            float _2412 = fma(_2400, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2402);
            float _2414 = fma(_2400, (*spvDescriptorSet0.vp_c10)._m0[5].x, _2404);
            float _2416 = fma(_2400, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2406);
            float _2418 = fma(_2410, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2412);
            float _2420 = fma(_2410, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2414);
            float _2422 = fma(_2410, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2416);
            _423 = _2420;
            _425 = _2418;
            _427 = _2422;
            _2290 = _2418;
            _2296 = _2420;
            _2304 = _2422;
        }
        float _2424 = _423;
        float _2426 = _425;
        float _2428 = _427;
        float _2430 = _2290;
        float _2432 = _2296;
        float _2434 = _2304;
        float _2436 = _2424 * _2424;
        float _2438 = rsqrt(_2220);
        float _2440 = fma(_2426, _2426, _2436);
        float _2442 = fma(_2428, _2428, _2440);
        float _2444 = sqrt(_2442);
        float _2446 = _2188 * _2438;
        float _2448 = _2178 * _2438;
        float _2450 = _2206 * _2438;
        bool _2452 = _2444 > 0.0;
        bool _2454 = !_2452;
        _2272 = _2432;
        _2274 = _2434;
        if (!_2454)
        {
            float _2456 = rsqrt(_2442);
            float _2458 = _2456 * _2424;
            float _2460 = _2456 * _2426;
            float _2462 = _2456 * _2428;
            float _2464 = _2448 * _2458;
            float _2466 = fma(_2446, _2460, _2464);
            float _2468 = fma(_2450, _2462, _2466);
            float _2470 = _2468 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2472 = fma(_2430, _2470, _2170);
            float _2474 = fma(_2432, _2470, _2168);
            float _2476 = fma(_2434, _2470, _2172);
            _2266 = _2474;
            _2268 = _2472;
            _2270 = _2476;
        }
    }
    float _2478 = _2266;
    float _2480 = _2268;
    float _2482 = _2270;
    float _2484 = _2272;
    float _2486 = _2274;
    float _2488 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2490 = _2478 + _2488;
    float _2492 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2494 = _2480 + _2492;
    float _2496 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2498 = _2482 + _2496;
    float _2500 = _2490 * _2490;
    float _2502 = _2478 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2504 = fma(_2494, _2494, _2500);
    float _2506 = fma(_2498, _2498, _2504);
    float _2508 = rsqrt(_2506);
    float _2510 = sqrt(_2506);
    float _2512 = _2508 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2514 = _2494 * _2512;
    float _2516 = _2498 * _2512;
    float _2518 = _2514 * _2514;
    float _2520 = _2516 * _2516;
    float _2522 = _2518 + _2520;
    float _2524 = sqrt(_2522);
    bool _2526 = _2524 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2528 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2530 = _2524 + _2528;
    float _2532 = _2508;
    float _2534 = _2486;
    float _2536 = _2530;
    float _2538 = _2484;
    float _2540 = _2490;
    float _2542 = _2512;
    if (_2526)
    {
        float _2544 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2532 = _2544;
    }
    float _2546 = _2532;
    if (_2526)
    {
        float _2548 = rsqrt(_2522);
        _2534 = _2548;
    }
    float _2550 = _2534;
    float _2552 = _2550;
    if (_2526)
    {
        float _2554 = _2530 * _2546;
        _2536 = _2554;
    }
    float _2556 = _2536;
    float _2558 = _2478 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    if (_2526)
    {
        float _2560 = _2556 * 0.15915493667125701904296875;
        _2538 = _2560;
    }
    float _2562 = _2538;
    float _2564 = _2546;
    float _2566 = _2562;
    if (_2526)
    {
        float _2568 = _2562 * 6.283185482025146484375;
        float _2570 = sin(_2568);
        _2564 = _2570;
    }
    float _2572 = _2564;
    float _2574 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2576 = precise::max(0.0, _2574);
    float _2578 = _2498;
    float _2580 = _2576;
    if (_2526)
    {
        float _2582 = _2562 * 6.283185482025146484375;
        float _2584 = cos(_2582);
        _2578 = _2584;
    }
    float _2586 = _2578;
    float _2588 = -_2512;
    float _2590 = -_2576;
    float _2592 = fma(_2490, _2588, _2590);
    if (_2526)
    {
        float _2594 = _2592 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2580 = _2594;
    }
    float _2596 = _2580;
    float _2598 = _2572;
    float _2600 = _2596;
    if (_2526)
    {
        float _2602 = fma(_2572, _2596, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2540 = _2602;
    }
    float _2604 = _2540;
    float _2606 = _2604;
    if (!_2526)
    {
        _2598 = _2514;
    }
    float _2608 = _2598;
    float _2610 = _2608;
    if (_2526)
    {
        float _2612 = _2586 + (-1.0);
        _2600 = _2612;
    }
    float _2614 = _2600;
    float _2616 = _2614;
    if (_2526)
    {
        float _2618 = _2550 * _2604;
        _2542 = _2618;
    }
    float _2620 = _2542;
    if (!_2526)
    {
        _2552 = _2592;
    }
    float _2622 = _2552;
    float _2624 = _2622;
    if (_2526)
    {
        float _2626 = _2614 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2566 = _2626;
    }
    float _2628 = _2566;
    float _2630 = _2628;
    if (_2526)
    {
        float _2632 = _2514 * _2620;
        _2610 = _2632;
    }
    float _2634 = _2610;
    if (!_2526)
    {
        _2606 = _2516;
    }
    float _2636 = _2606;
    float _2638 = _2636;
    if (_2526)
    {
        float _2640 = _2516 * _2620;
        _2638 = _2640;
    }
    float _2642 = _2638;
    if (_2526)
    {
        float _2644 = fma(_2592, _2586, _2628);
        _2624 = _2644;
    }
    float _2646 = _2624;
    if (!_2526)
    {
        _2630 = _2518;
    }
    float _2648 = _2630;
    float _2650 = _2648;
    if (_2526)
    {
        float _2652 = _2634 * _2634;
        _2650 = _2652;
    }
    float _2654 = _2650;
    float _2656 = _2478 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (!_2526)
    {
        _2616 = _2520;
    }
    float _2658 = _2616;
    float _2660 = _2658;
    if (_2526)
    {
        float _2662 = _2642 * _2642;
        _2660 = _2662;
    }
    float _2664 = _2660;
    float _2666 = fma(_2646, _2646, _2654);
    float _2668 = fma(_2480, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2656);
    float _2670 = fma(_2480, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2558);
    float _2672 = _2478 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2674 = _2666 + _2664;
    float _2676 = fma(_2482, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2668);
    float _2678 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2680 = fma(_2510, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2678);
    float _2682 = precise::clamp(_2680, 0.0, 1.0);
    float _2684 = fma(_2480, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2672);
    float _2686 = rsqrt(_2674);
    float _2688 = fma(_2482, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2670);
    float _2690 = _2676 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2692 = fma(_2482, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2684);
    float _2694 = -_2682;
    float _2696 = _2694 + 1.0;
    float _2698 = _2688 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2700 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2702 = _2690 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2704 = fma(_2480, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2502);
    float _2706 = _2692 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2708 = abs(_2696);
    float _2710 = log2(_2708);
    float _2712 = -_2702;
    float _2714 = fma(_2712, _2700, 1.0);
    float _2716 = _2698 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2718 = fma(_2482, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2704);
    float _2720 = _2686 * _2634;
    float _2722 = _2686 * _2646;
    float _2724 = _2686 * _2642;
    float _2726 = fma(_2706, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2716);
    float _2728 = _2720 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2730 = _2718 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2732 = log2(_2714);
    float _2734 = fma(_2690, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2726);
    float _2736 = -_2728;
    float _2738 = fma(_2722, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2736);
    float _2740 = _2710 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2742 = -_2724;
    float _2744 = fma(_2742, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2738);
    float _2746 = fma(_2730, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2734);
    float _2748 = _2698 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2750 = _2698 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2752 = fma(_2744, -0.5, 0.5);
    float _2754 = exp2(_2740);
    float _2756 = fma(_2744, 0.5, 0.5);
    float _2758 = fma(_2706, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2748);
    float _2760 = fma(_2706, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2750);
    float _2762 = _2722 + 1.0;
    float _2764 = fma(_2756, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2766 = fma(_2690, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2758);
    float _2768 = fma(_2690, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2760);
    float _2770 = 1.0 / _2746;
    float _2772 = fma(_2756, _2764, -0.212114393711090087890625);
    float _2774 = fma(_2730, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2766);
    float _2776 = fma(_2730, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2768);
    float _2778 = _2732 * 0.693147182464599609375;
    float _2780 = fma(_2756, _2772, 1.570728778839111328125);
    float _2782 = sqrt(_2752);
    float _2784 = -_2722;
    float _2786 = fma(_2754, _2762, _2784);
    float _2788 = _2778 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2790 = fma(_2786, 0.5, 0.5);
    float _2792 = _2774 * _2770;
    float _2794 = _2776 * _2770;
    float _2796 = fma(_2792, 0.5, 0.5);
    float _2798 = fma(_2794, -0.5, 0.5);
    float _2800 = _2782 * 0.636619746685028076171875;
    float _2802 = -_2780;
    float _2804 = fma(_2800, _2802, 1.0);
    float3 _7264 = float3(_2796, _2798, _2788);
    float _2806 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7264, float3(0.0), isnan(_7264)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7264, float3(0.0), isnan(_7264)), level(0.0)).x;
    float3 _7275 = float3(_2796, _2798, _2788);
    float4 _2809 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7275, float3(0.0), isnan(_7275)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7275, float3(0.0), isnan(_7275)), level(0.0)).xyzw;
    float _2811 = _2809.x;
    float _2813 = _2809.y;
    float _2815 = _2809.z;
    float _2817 = _2809.w;
    float2 _7292 = float2(_2804, _2790);
    float3 _2821 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7292, float2(0.0), isnan(_7292)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7292, float2(0.0), isnan(_7292)), level(0.0)).xyz;
    float _2823 = _2821.x;
    float _2825 = _2821.y;
    float _2827 = _2821.z;
    float _2829 = _2104 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    bool _2831 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2833 = isnan(0.5);
    bool _2835 = _2831 || _2833;
    bool _2837 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2839 = _2835 || _2837;
    float _2841 = fma(_1190, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2829);
    float _2843 = _2104 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2845 = fma(_1150, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2841);
    float _2847 = fma(_1190, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2843);
    float _2849 = _2845 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2851 = fma(_1150, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2847);
    float _2853 = _2698 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2855 = 1.0 / _2849;
    float _2857 = _2851 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2859 = fma(_2706, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2853);
    float _2861 = _2706;
    float _2863 = _2710;
    if (_2839)
    {
        _2861 = 1.0;
    }
    float _2865 = _2861;
    float _2867 = _2857 + _2849;
    float _2869 = fma(_2690, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2859);
    float _2871 = fma(_2730, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2869);
    float _2873 = _2867 * _2855;
    float _2875 = _2873 * 0.5;
    float _2877 = _2710 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2879 = _2865;
    if (_2839)
    {
        _2863 = 1.0;
    }
    float _2881 = _2863;
    float _2883 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2885 = fma(_2875, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2883);
    float _2887 = exp2(_2877);
    float _2889 = 1.0 / _2885;
    float _2891 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2893 = _2889 * _2891;
    float _2895 = _2881;
    if (!_2839)
    {
        float _2897 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2899 = _2897 * 0.15915493667125701904296875;
        float _2901 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2903 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2905 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2903;
        float _2907 = _2899 * 6.283185482025146484375;
        float _2909 = cos(_2907);
        float _2911 = _2901 * 0.15915493667125701904296875;
        float _2913 = _2899 * 6.283185482025146484375;
        float _2915 = sin(_2913);
        float _2917 = 1.0 / _2909;
        float _2919 = _2911 * 6.283185482025146484375;
        float _2921 = cos(_2919);
        float _2923 = _2915 * _2917;
        float _2925 = _2911 * 6.283185482025146484375;
        float _2927 = sin(_2925);
        float _2929 = _2921 * _2923;
        float _2931 = 1.0 / _2905;
        float _2933 = 1.0 / _2929;
        float _2935 = _2927 * _2933;
        float _2937 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2939 = fma(_2893, _2935, _2937);
        float _2941 = _2939 * _2931;
        float _2943 = precise::clamp(_2941, 0.0, 1.0);
        _2895 = _2943;
    }
    float _2945 = _2895;
    if (!_2839)
    {
        float _2947 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2949 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2951 = _2947 * 0.15915493667125701904296875;
        float _2953 = _2949 * 0.15915493667125701904296875;
        float _2955 = _2951 * 6.283185482025146484375;
        float _2957 = cos(_2955);
        float _2959 = _2951 * 6.283185482025146484375;
        float _2961 = sin(_2959);
        float _2963 = 1.0 / _2957;
        float _2965 = _2953 * 6.283185482025146484375;
        float _2967 = cos(_2965);
        float _2969 = _2961 * _2963;
        float _2971 = _2953 * 6.283185482025146484375;
        float _2973 = sin(_2971);
        float _2975 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2977 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2975;
        float _2979 = _2967 * _2969;
        float _2981 = 1.0 / _2977;
        float _2983 = 1.0 / _2979;
        float _2985 = _2973 * _2983;
        float _2987 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2989 = fma(_2893, _2985, _2987);
        float _2991 = _2989 * _2981;
        float _2993 = precise::clamp(_2991, 0.0, 1.0);
        float _2995 = -_2993;
        float _2997 = _2995 + 1.0;
        _2879 = _2997;
    }
    float _2999 = _2879;
    float _3001 = _2945 * _2999;
    float _3003 = -_2887;
    float _3005 = _3003 + 1.0;
    bool _3007 = _2945 > 0.0;
    bool _3009 = isnan(_2945);
    bool _3011 = _3007 || _3009;
    bool _3013 = isnan(0.0);
    bool _3015 = _3011 || _3013;
    float _3017 = _2871 + _2746;
    float _3019 = _3001 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3021 = _3005 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    bool _3023 = _2999 <= 0.0;
    bool _3025 = !_3015;
    bool _3027 = _3023 || _3025;
    float _3029 = _3017 * 0.5;
    float _3031 = _3021 * _2806;
    float _3033 = -_3021;
    float _3035 = _3033 + 1.0;
    out.gl_Position.x = _2774;
    out.gl_Position.y = _2776;
    out.gl_Position.z = _2871;
    out.gl_Position.w = _2746;
    float _3037 = _3019 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3039 = _2817 * _3031;
    float _3041 = _2827 * _3031;
    out.m_70.z = _3029;
    out.m_70.w = _2746;
    float _3043 = fma(_2823, _3039, _2811);
    float _3045 = fma(_2825, _3039, _2813);
    float _3047 = _2817 * _3035;
    float _3049 = fma(_2817, _3041, _2815);
    out.m_45.x = _3037;
    out.m_72.x = _3043;
    out.m_72.y = _3045;
    out.m_72.z = _3049;
    out.m_72.w = _3047;
    if (!_3027)
    {
        return out;
    }
    out.m_45.x = 0.0;
    float _3051 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3051;
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
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    bool _717 = false;
    bool _589 = false;
    bool _447 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _86 = in.m_42.w;
    float _88 = trunc(_86);
    int _91 = int(_88);
    bool _95 = _91 >= 1;
    float _97 = 0.0;
    if (!_95)
    {
        _97 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _99 = _97;
    float _101 = _99;
    if (!_95)
    {
        out.m_45.x = 0.0;
    }
    int _103 = 0;
    if (!_95)
    {
        float _105 = _99 * 5.0;
        _103 = as_type<int>(_105);
    }
    int _107 = _103;
    int _109 = _107;
    if (!_95)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3108 = as_type<float>(_107);
        out.gl_Position.z = _3108;
    }
    if (!_95)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _111 = in.m_47.w;
    bool _113 = _111 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _115 = isnan(_111);
    bool _117 = _113 || _115;
    bool _119 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _121 = _117 || _119;
    float _123 = -_111;
    float _125 = _123 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_121)
    {
        float _127 = float(_91);
        _101 = _127;
    }
    float _129 = _101;
    bool _131 = _125 >= _129;
    bool _133 = !_121;
    bool _135 = _131 || _133;
    float _137 = _129;
    if (_135)
    {
        _137 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _139 = _137;
    if (_135)
    {
        out.m_45.x = 0.0;
    }
    if (_135)
    {
        float _141 = _139 * 5.0;
        _109 = as_type<int>(_141);
    }
    int _143 = _109;
    if (_135)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3177 = as_type<float>(_143);
        out.gl_Position.z = _3177;
    }
    if (_135)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _145 = as_type<float>(int(gl_VertexIndex));
    float _147 = _125 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _149 = in.m_52.w;
    bool _151 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _153 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _155 = _151 || _153;
    bool _157 = isnan(1.0);
    bool _159 = _155 || _157;
    float _161 = in.m_47.x;
    float _163 = in.m_47.y;
    float _165 = in.m_47.z;
    float _167 = in.m_42.x;
    float _169 = in.m_42.y;
    float _171 = in.m_42.z;
    float _173 = 0.0;
    float _175 = _147;
    if (!_159)
    {
        float _177 = _147 * _147;
        float _179 = _177 * 0.5;
        _173 = _179;
    }
    float _181 = _173;
    float _183 = _181;
    if (!_159)
    {
        float _185 = _181 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _183 = _185;
    }
    float _187 = _183;
    int _189 = as_type<int>(_145) & 1;
    bool _191 = _189 != 0;
    int _193 = as_type<int>(_145) & 2;
    bool _195 = _193 != 0;
    bool _197 = !_191;
    float _199 = _197 ? (-0.5) : 0.5;
    bool _201 = !_195;
    float _203 = _201 ? (-0.5) : 0.5;
    bool _205 = !_159;
    float _207 = _187;
    float _209 = 0.0;
    float _211 = _145;
    bool _213 = false;
    if (!_205)
    {
        float _215 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _217 = log2(_215);
        float _219 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _221 = _219 + 1.0;
        float _223 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _225 = _147 * _217;
        float _227 = 1.0 / _221;
        float _229 = _223 * 0.693147182464599609375;
        float _231 = exp2(_225);
        float _233 = 1.0 / _229;
        float _235 = _231 + (-1.0);
        float _237 = -_235;
        float _239 = fma(_237, _233, _147);
        float _241 = _239 * _227;
        float _243 = _241 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _207 = _243;
        _209 = _227;
        _211 = _233;
    }
    float _245 = _207;
    float _247 = _209;
    float _249 = _211;
    bool _251 = !_159;
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
        float _269 = _147 * _261;
        float _271 = exp2(_269);
        float _273 = -_271;
        float _275 = _273 + 1.0;
        float _277 = _275 * _267;
        _175 = _277;
        _253 = _265;
    }
    float _279 = _175;
    float _281 = _253;
    float _283 = _281;
    if (!_159)
    {
        float _285 = _125 * _125;
        float _287 = _285 * 0.5;
        _255 = _287;
    }
    float _289 = _255;
    float _291 = _245 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _293 = _245 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _295 = _245 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    if (!_159)
    {
        _283 = _125;
    }
    float _297 = _283;
    float _299 = fma(_279, _161, _291);
    float _301 = fma(_279, _163, _293);
    float _303 = _297;
    if (!_159)
    {
        float _305 = _289 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _257 = _305;
    }
    float _307 = _257;
    bool _309 = !_159;
    float _311 = _307;
    if (!_309)
    {
        float _313 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _315 = log2(_313);
        float _317 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _319 = _317 + 1.0;
        float _321 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _323 = _125 * _315;
        float _325 = 1.0 / _319;
        float _327 = _321 * 0.693147182464599609375;
        float _329 = exp2(_323);
        float _331 = 1.0 / _327;
        float _333 = _329 + (-1.0);
        float _335 = -_333;
        float _337 = fma(_335, _331, _125);
        float _339 = _337 * _325;
        float _341 = _339 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _311 = _341;
    }
    float _343 = _311;
    bool _345 = !_159;
    if (!_345)
    {
        float _347 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _349 = log2(_347);
        float _351 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _353 = _351 + 1.0;
        float _355 = 1.0 / _353;
        float _357 = _125 * _349;
        float _359 = exp2(_357);
        float _361 = -_359;
        float _363 = _361 + 1.0;
        float _365 = _363 * _355;
        _303 = _365;
    }
    float _367 = _303;
    float _369 = _343 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _371 = _343 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    bool _373 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _375 = _343 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _377 = fma(_367, _163, _369);
    float _379 = fma(_301, _149, _169);
    float _381 = fma(_367, _161, _371);
    float _383 = fma(_279, _165, _295);
    float _385 = -_377;
    float _387 = _301 + _385;
    float _389 = fma(_367, _165, _375);
    float _391 = fma(_299, _149, _167);
    float _393 = -_381;
    float _395 = _299 + _393;
    float _397 = _387 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _399 = _387 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _401 = _387 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _403 = -_389;
    float _405 = _383 + _403;
    float _407 = fma(_395, (*spvDescriptorSet0.vp_c10)._m0[4].x, _397);
    float _409 = fma(_395, (*spvDescriptorSet0.vp_c10)._m0[5].x, _399);
    float _411 = fma(_395, (*spvDescriptorSet0.vp_c10)._m0[6].x, _401);
    float _413 = fma(_383, _149, _171);
    float _415 = fma(_405, (*spvDescriptorSet0.vp_c10)._m0[4].z, _407);
    float _417 = fma(_405, (*spvDescriptorSet0.vp_c10)._m0[5].z, _409);
    float _419 = fma(_405, (*spvDescriptorSet0.vp_c10)._m0[6].z, _411);
    bool _421 = !_373;
    float _423 = _417;
    float _425 = _415;
    float _427 = _419;
    float _445;
    if (!_421)
    {
        float _429 = in.m_54.x;
        float _431 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _433 = _429 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _435 = fma(_433, (*spvDescriptorSet0.vp_c9)._m0[11].y, _125);
        float _437 = _435 * _431;
        float _439 = floor(_437);
        float _441 = -_439;
        float _443 = _437 + _441;
        _445 = _443;
        _447 = true;
    }
    else
    {
        float _449 = float(_91);
        float _451 = 1.0 / _449;
        float _453 = _125 * _451;
        _445 = _453;
    }
    _447 = false;
    float _455 = _445;
    float _457 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _459 = _455 + _457;
    float _461 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _463 = _461 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _465 = _455 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _467 = isnan(_455);
    bool _469 = _465 || _467;
    bool _471 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _473 = _469 || _471;
    float _475 = float(_473);
    float _477 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _479 = _477 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _481 = _455 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _483 = isnan(_455);
    bool _485 = _481 || _483;
    bool _487 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _489 = _485 || _487;
    float _491 = float(_489);
    float _493 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _495 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _493;
    bool _497 = _455 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _499 = isnan(_455);
    bool _501 = _497 || _499;
    bool _503 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _505 = _501 || _503;
    float _507 = float(_505);
    float _509 = 1.0 / _463;
    float _511 = -_475;
    float _513 = _511 + 1.0;
    bool _515 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _517 = 1.0 / _479;
    float _519 = _495 * _509;
    float _521 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _523 = _521 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _525 = -_507;
    float _527 = _525 + 1.0;
    float _529 = fma(_519, _459, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _531 = _491 * _513;
    float _533 = -_491;
    float _535 = _533 + 1.0;
    float _537 = _475 * _527;
    float _539 = _523 * _517;
    float _541 = _529 * _531;
    float _543 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _545 = _455 + _543;
    float _547 = fma(_535, (*spvDescriptorSet0.vp_c9)._m0[115].x, _541);
    float _549 = fma(_539, _545, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _551 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _553 = fma(_549, _537, _547);
    float _555 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _557 = _551 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _559 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _561 = fma(_507, (*spvDescriptorSet0.vp_c9)._m0[117].x, _553);
    float _563 = _555 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _565 = _559 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _567 = _561 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_56.x = _557;
    out.m_56.y = _563;
    out.m_56.z = _565;
    out.m_56.w = _567;
    bool _569 = !_515;
    float _587;
    if (!_569)
    {
        float _571 = in.m_54.x;
        float _573 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _575 = _571 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _577 = fma(_575, (*spvDescriptorSet0.vp_c9)._m0[11].z, _125);
        float _579 = _577 * _573;
        float _581 = floor(_579);
        float _583 = -_581;
        float _585 = _579 + _583;
        _587 = _585;
        _589 = true;
    }
    else
    {
        float _591 = float(_91);
        float _593 = 1.0 / _591;
        float _595 = _125 * _593;
        _587 = _595;
    }
    _589 = false;
    float _597 = _587;
    float _599 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _601 = _597 + _599;
    bool _603 = _597 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _605 = isnan(_597);
    bool _607 = _603 || _605;
    bool _609 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _611 = _607 || _609;
    float _613 = float(_611);
    float _615 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _617 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _615;
    bool _619 = _597 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _621 = isnan(_597);
    bool _623 = _619 || _621;
    bool _625 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _627 = _623 || _625;
    float _629 = float(_627);
    float _631 = -_613;
    float _633 = _631 + 1.0;
    float _635 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _637 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _635;
    float _639 = 1.0 / _617;
    bool _641 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _643 = _629 * _633;
    float _645 = -_629;
    float _647 = _645 + 1.0;
    float _649 = _601 * _639;
    float _651 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _653 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _651;
    float _655 = fma(_637, _649, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _657 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _659 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _657;
    float _661 = fma(_653, _649, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _663 = _655 * _643;
    float _665 = fma(_659, _649, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _667 = _661 * _643;
    float _669 = _665 * _643;
    float _671 = fma(_647, (*spvDescriptorSet0.vp_c9)._m0[123].x, _663);
    float _673 = fma(_647, (*spvDescriptorSet0.vp_c9)._m0[123].y, _669);
    float _675 = fma(_647, (*spvDescriptorSet0.vp_c9)._m0[123].z, _667);
    float _677 = fma(_613, (*spvDescriptorSet0.vp_c9)._m0[124].x, _671);
    float _679 = fma(_613, (*spvDescriptorSet0.vp_c9)._m0[124].y, _673);
    float _681 = fma(_613, (*spvDescriptorSet0.vp_c9)._m0[124].z, _675);
    float _683 = _677 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _685 = _679 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _687 = _681 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _689 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _691 = _683 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _693 = _685 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _695 = _687 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_58.x = _691;
    out.m_58.y = _693;
    out.m_58.z = _695;
    out.m_58.w = _689;
    bool _697 = !_641;
    float _715;
    if (!_697)
    {
        float _699 = in.m_54.x;
        float _701 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _703 = _699 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _705 = fma(_703, (*spvDescriptorSet0.vp_c9)._m0[14].x, _125);
        float _707 = _705 * _701;
        float _709 = floor(_707);
        float _711 = -_709;
        float _713 = _707 + _711;
        _715 = _713;
        _717 = true;
    }
    else
    {
        float _719 = float(_91);
        float _721 = 1.0 / _719;
        float _723 = _125 * _721;
        _715 = _723;
    }
    _717 = false;
    float _725 = _715;
    float _727 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _729 = int(_727);
    float _731 = in.m_54.z;
    float _733 = in.m_54.w;
    float _735 = _379 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _737 = fma(_391, (*spvDescriptorSet0.vp_c10)._m0[5].x, _735);
    float _739 = float(_91);
    float _741 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _743 = int(_741);
    float _745 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _747 = _745 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _749 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _751 = _749 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _753 = fma(_413, (*spvDescriptorSet0.vp_c10)._m0[5].z, _737);
    float _755 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _757 = _755 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _759 = float(_729);
    float _761 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _763 = _761 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _765 = 1.0 / _747;
    float _767 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _769 = _767 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _771 = float(uint(_743));
    float _773 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _775 = _773 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _777 = _733 > 0.5;
    float _779 = 1.0 / _759;
    float _781 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _783 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _781;
    float _785 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _787 = _785 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _789 = 1.0 / _771;
    float _791 = _125 * _779;
    float _793 = 1.0 / _751;
    int _795 = as_type<int>(_789) + (-2);
    float _797 = trunc(_791);
    int _799 = int(_797);
    int _801 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _803 = _801 != 0;
    float _805 = _379 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _807 = _379 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _809 = 1.0 / _787;
    float _811 = fma(_391, (*spvDescriptorSet0.vp_c10)._m0[4].x, _805);
    float _813 = fma(_391, (*spvDescriptorSet0.vp_c10)._m0[6].x, _807);
    int _815 = ~_743;
    int _817 = _815 + 1;
    float _819 = fma(_413, (*spvDescriptorSet0.vp_c10)._m0[4].z, _811);
    float _821 = fma(_413, (*spvDescriptorSet0.vp_c10)._m0[6].z, _813);
    float _823 = float(uint(_799));
    float _825 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _827 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _825;
    float _829 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _831 = _829 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _833 = 1.0 / _757;
    int _835 = as_type<int>(_765);
    float _837 = _833;
    if (_803)
    {
        _213 = false;
    }
    bool _839 = _213;
    float _841 = as_type<float>(_795) * _823;
    float _843 = _831 * _793;
    float _845 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _847 = _845 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _849 = _783 * _809;
    float _851 = trunc(_841);
    float _853 = precise::max(_851, 0.0);
    uint _856 = uint(_853);
    float _858 = 1.0 / _763;
    float _860 = _841;
    float _862 = _805;
    float _864 = _809;
    bool _866 = _839;
    if (_803)
    {
        float _868 = in.m_54.x;
        float _870 = in.m_54.y;
        _860 = _868;
        _862 = _870;
    }
    float _872 = _860;
    float _874 = _862;
    int _876 = _817 * int(_856);
    int _878 = _876 + _799;
    float _880 = 1.0 / _739;
    float _882 = float(uint(_878));
    float _884 = _827 * _765;
    float _886 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _888 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _886;
    float _890 = _847 * _858;
    float _892 = 1.0 / _769;
    float _894 = as_type<float>(_795) * _882;
    float _896 = _888 * _833;
    float _898 = _882;
    float _900 = _858;
    if (_803)
    {
        _835 = 0;
    }
    int _902 = _835;
    int _904 = _902;
    if (_803)
    {
        _898 = 1.0;
    }
    float _906 = _898;
    float _908 = 1.0 / _775;
    float _910 = _906;
    float _912 = _874;
    float _914 = _872;
    if (_803)
    {
        _864 = _872;
    }
    float _916 = _864;
    float _918 = _916;
    if (_803)
    {
        _837 = _874;
    }
    float _920 = _837;
    float _922 = _920;
    if (_803)
    {
        _900 = _916;
    }
    float _924 = _900;
    float _926 = trunc(_894);
    float _928 = precise::max(_926, 0.0);
    uint _930 = uint(_928);
    float _932 = _924;
    if (!_803)
    {
        float _934 = in.m_54.x;
        float _936 = in.m_54.y;
        float _938 = _934 * 3.1415927410125732421875;
        float _940 = _938 * 0.15915493667125701904296875;
        float _942 = _936 * 3.1415927410125732421875;
        float _944 = _942 * 0.15915493667125701904296875;
        float _946 = _940 * 6.283185482025146484375;
        float _948 = sin(_946);
        float _950 = _944 * 6.283185482025146484375;
        float _952 = sin(_950);
        _910 = 1.2345600128173828125;
        _918 = _936;
        _866 = true;
        _922 = _952;
        _904 = 2;
        _912 = _936;
        _932 = _948;
        _914 = _934;
    }
    float _954 = _910;
    float _956 = _918;
    bool _958 = _866;
    float _960 = _922;
    int _962 = _904;
    float _964 = _912;
    float _966 = _932;
    float _968 = _914;
    float _970 = _954 * _956;
    int _972 = int(_856) + int(_930);
    float _974 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _976 = _974 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    int _978 = ~_743;
    int _980 = _978 + 1;
    float _982 = floor(_970);
    float _984 = _976 * _892;
    float _986 = float(_743);
    int _988 = _980 * _972;
    int _990 = _988 + _799;
    float _992 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _994 = _725 + _992;
    float _996 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _998 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _996;
    float _1000 = float(_799);
    float _1002 = _125 * _986;
    bool _1004 = uint(_990) >= uint(_743);
    float _1006 = _998 * _908;
    bool _1008 = _1000 >= _986;
    bool _1010 = isnan(_1000);
    bool _1012 = _1008 || _1010;
    bool _1014 = isnan(_986);
    bool _1016 = _1012 || _1014;
    float _1018 = float(_1016);
    float _1020 = _1002 * _880;
    bool _1022 = !_1004;
    int _1024 = _1022 ? 0 : (-1);
    float _1026 = fma(_884, _994, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _1028 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1030 = _725 + _1028;
    float _1032 = -_982;
    float _1034 = _970 + _1032;
    int _1036 = ~_972;
    int _1038 = _1036 + _1024;
    int _1040 = _1038 + 1;
    float _1042 = trunc(_1018);
    int _1044 = int(_1042);
    float _1046 = _986 * _1034;
    float _1048 = fma(_843, _1030, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    bool _1050 = _743 == 0;
    float _1052 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1054 = _725 + _1052;
    int _1056 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1058 = _1056 != 0;
    int _1060 = _743 * _1040;
    int _1062 = _1060 + _799;
    float _1064 = trunc(_1046);
    int _1066 = int(_1064);
    float _1068 = fma(_896, _1054, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    int _1070 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1072 = _1070 != 0;
    int _1074 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1076 = _1074 != 0;
    float _1078 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1080 = _725 + _1078;
    bool _1082 = !_1050;
    int _1084 = _1082 ? _1062 : (-1);
    float _1086 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1088 = _725 + _1086;
    bool _1090 = !_1058;
    int _1092 = _1090 ? 0 : 1;
    float _1094 = fma(_849, _1080, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    bool _1096 = !_1076;
    int _1098 = _1096 ? 0 : 1;
    float _1100 = trunc(_1020);
    int _1102 = int(_1100);
    int _1104 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1106 = _1104 != 0;
    int _1108 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1110 = _1108 != 0;
    float _1112 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1114 = _725 + _1112;
    int _1116 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _1118 = _1116 != 0;
    float _1120 = fma(_984, _1088, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    int _1122 = ~_1044;
    int _1124 = _1122 + 1;
    int _1126 = _1124 + 1;
    float _1128 = fma(_1006, _1114, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    bool _1130 = !_1072;
    int _1132 = _1130 ? 0 : 1;
    float _1134 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    int _1136 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _1138 = _1136 != 0;
    int _1140 = _1084 * _1126;
    int _1142 = _743 + (-1);
    float _1144 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1146 = _725 + _1144;
    int _1148 = abs(_1092);
    float _1150 = _821 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _1152 = abs(_1098);
    int _1154 = _1044 * _1142;
    int _1156 = _1154 + _1140;
    int _1158 = abs(_1132);
    float _1160 = as_type<float>(_1044);
    float _1162 = _1026;
    bool _1164 = _1106;
    bool _1166 = _1110;
    float _1168 = _964;
    if (_1118)
    {
        float _1170 = in.m_54.w;
        _1160 = _1170;
    }
    float _1172 = _1160;
    float _1174 = fma(_890, _1146, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    int _1176 = _1156 * _1152;
    bool _1178 = _725 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1180 = isnan(_725);
    bool _1182 = _1178 || _1180;
    bool _1184 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1186 = _1182 || _1184;
    float _1188 = float(_1186);
    float _1190 = _819 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _1192 = _1066 * _1148;
    int _1194 = _1192 + _799;
    bool _1196 = !_1106;
    int _1198 = _1196 ? 0 : 1;
    float _1200 = as_type<float>(_1148);
    if (_1138)
    {
        float _1202 = in.m_54.x;
        _1200 = _1202;
    }
    float _1204 = _1200;
    int _1206 = _1102 * _1158;
    int _1208 = _1206 + _1176;
    bool _1210 = _725 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _1212 = isnan(_725);
    bool _1214 = _1210 || _1212;
    bool _1216 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _1218 = _1214 || _1216;
    float _1220 = float(_1218);
    float _1222 = -_1188;
    float _1224 = _1222 + 1.0;
    bool _1226 = _725 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _1228 = isnan(_725);
    bool _1230 = _1226 || _1228;
    bool _1232 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _1234 = _1230 || _1232;
    float _1236 = float(_1234);
    bool _1238 = !_1110;
    int _1240 = _1238 ? 0 : 1;
    float _1242 = _1220 * _1224;
    int _1244 = abs(_1198);
    float _1246 = -_1220;
    float _1248 = _1246 + 1.0;
    bool _1250 = _725 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _1252 = isnan(_725);
    bool _1254 = _1250 || _1252;
    bool _1256 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _1258 = _1254 || _1256;
    float _1260 = float(_1258);
    float _1262 = -_1236;
    float _1264 = _1262 + 1.0;
    int _1266 = abs(_1240);
    float _1268 = _1236 * _1248;
    int _1270 = _1194 * _1244;
    int _1272 = _1270 + _1208;
    bool _1274 = _725 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _1276 = isnan(_725);
    bool _1278 = _1274 || _1276;
    bool _1280 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _1282 = _1278 || _1280;
    float _1284 = float(_1282);
    float _1286 = _1260 * _1264;
    float _1288 = -_1260;
    float _1290 = _1288 + 1.0;
    int _1292 = _1066 * _1266;
    int _1294 = _1292 + _1272;
    bool _1296 = _725 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _1298 = isnan(_725);
    bool _1300 = _1296 || _1298;
    bool _1302 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _1304 = _1300 || _1302;
    float _1306 = float(_1304);
    float _1308 = _1172;
    float _1310 = as_type<float>(_1272);
    float _1312 = _1306;
    if (_1118)
    {
        float _1314 = _1172 * 3.1415927410125732421875;
        _1308 = _1314;
    }
    float _1316 = _1308;
    float _1318 = -_1284;
    float _1320 = _1318 + 1.0;
    float _1322 = _1284 * _1290;
    bool _1324 = _725 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1326 = isnan(_725);
    bool _1328 = _1324 || _1326;
    bool _1330 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _1332 = _1328 || _1330;
    float _1334 = float(_1332);
    float _1336 = _1320;
    if (_1118)
    {
        float _1338 = _1316 * 0.15915493667125701904296875;
        _1310 = _1338;
    }
    float _1340 = _1310;
    float _1342 = _1306 * _1320;
    float _1344 = _1342;
    if (_1138)
    {
        float _1346 = _1204 * 3.1415927410125732421875;
        _1336 = _1346;
    }
    float _1348 = _1336;
    float _1350 = -_1306;
    float _1352 = _1350 + 1.0;
    bool _1354 = _725 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _1356 = isnan(_725);
    bool _1358 = _1354 || _1356;
    bool _1360 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _1362 = _1358 || _1360;
    float _1364 = float(_1362);
    if (_1138)
    {
        float _1366 = _1348 * 0.15915493667125701904296875;
        _1312 = _1366;
    }
    float _1368 = _1312;
    float _1370 = -_1334;
    float _1372 = _1370 + 1.0;
    float _1374 = _1340;
    if (_1118)
    {
        float _1376 = _1340 * 6.283185482025146484375;
        float _1378 = sin(_1376);
        _1374 = _1378;
    }
    float _1380 = _1374;
    float _1382 = _1334 * _1352;
    float _1384 = _1364 * _1372;
    float _1386 = float(uint(_1294));
    float _1388 = _1334;
    float _1390 = _1382;
    if (_958)
    {
        float _1392 = in.m_54.z;
        _1388 = _1392;
    }
    float _1394 = _1388;
    float _1396 = -_1364;
    float _1398 = _1396 + 1.0;
    float _1400 = _1026 * _1384;
    if (!_1118)
    {
        _1162 = _199;
    }
    float _1402 = _1162;
    float _1404 = as_type<float>(_795) * _1386;
    float _1406 = _1368;
    float _1408 = _1402;
    if (_1138)
    {
        float _1410 = _1368 * 6.283185482025146484375;
        float _1412 = sin(_1410);
        _1406 = _1412;
    }
    float _1414 = _1406;
    float _1416 = fma(_1398, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1400);
    float _1418 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    float _1420 = _960 * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    float _1422 = _1416;
    if (_1118)
    {
        bool _1424 = _1380 > 0.5;
        _1164 = _1424;
    }
    bool _1426 = _1164;
    float _1428 = fma(_1048, _1382, _1416);
    float _1430 = trunc(_1404);
    float _1432 = precise::max(_1430, 0.0);
    uint _1434 = uint(_1432);
    float _1436 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    float _1438 = _1428;
    if (_1118)
    {
        float _1440 = -_199;
        float _1442 = _1426 ? _1440 : _199;
        _1408 = _1442;
    }
    float _1444 = _1408;
    float _1446 = fma(_1068, _1342, _1428);
    bool _1448 = _962 != 2;
    float _1450 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    int _1452 = ~_743;
    int _1454 = _1452 + 1;
    float _1456 = fma(_964, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1450);
    int _1458 = int(_1138);
    int _1460 = _1118 ? 2 : 0;
    int _1462 = _1458 | _1460;
    int _1464 = _1448 ? 4 : 0;
    int _1466 = _1462 | _1464;
    int _1468 = _1110 ? 8 : 0;
    int _1470 = _1466 | _1468;
    int _1472 = _958 ? 16 : 0;
    int _1474 = _1470 | _1472;
    int _1476 = _777 ? 32 : 0;
    int _1478 = _1474 | _1476;
    int _1480 = _159 ? 64 : 0;
    int _1482 = _1478 | _1480;
    int _1484 = _1482 & 64;
    float _1486 = _1414;
    if (_1138)
    {
        bool _1488 = _1414 > 0.5;
        _1166 = _1488;
    }
    bool _1490 = _1166;
    float _1492 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    int _1494 = _1454 * int(_1434);
    int _1496 = _1494 + _1294;
    bool _1498 = _731 > 0.5;
    float _1500 = fma(_960, (*spvDescriptorSet0.vp_c9)._m0[93].w, _1492);
    float _1502 = _1394;
    if (_958)
    {
        _1390 = _1394;
    }
    float _1504 = _1390;
    float _1506 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    float _1508 = float(uint(_1496));
    float _1510 = _1504;
    if (_958)
    {
        _1422 = _964;
    }
    float _1512 = _1422;
    float _1514 = fma(_1420, -2.0, _1506);
    float _1516 = _1512;
    if (_958)
    {
        _1486 = _964;
    }
    float _1518 = _1486;
    float _1520 = as_type<float>(_795) * _1508;
    float _1522 = fma(_966, (*spvDescriptorSet0.vp_c9)._m0[93].z, _1418);
    float _1524 = _966 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    float _1526 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    float _1528 = _1518;
    float _1530 = _1522;
    if (!_958)
    {
        _1510 = _964;
    }
    float _1532 = _1510;
    float _1534 = -_1436;
    float _1536 = fma(_1524, 2.0, _1534);
    float _1538 = fma(_1174, _1322, _1446);
    float _1540 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    if (!_958)
    {
        _1502 = _964;
    }
    float _1542 = _1502;
    float _1544 = fma(_1094, _1286, _1538);
    float _1546 = trunc(_1520);
    float _1548 = precise::max(_1546, 0.0);
    uint _1550 = uint(_1548);
    bool _1552 = _964 > 0.5;
    float _1554 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    if (_1448)
    {
        _1438 = _968;
    }
    float _1556 = _1438;
    float _1558 = -_125;
    float _1560 = fma(_1558, (*spvDescriptorSet0.vp_c9)._m0[91].x, _1536);
    float _1562 = _1556;
    if (!_1448)
    {
        _1562 = _731;
    }
    float _1564 = _1562;
    float _1566 = fma(_968, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1554);
    if (!_1448)
    {
        _1168 = _968;
    }
    float _1568 = _1168;
    float _1570 = _968 * 6.283185482025146484375;
    int _1572 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1574 = _1572 != 0;
    float _1576 = _1526 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    float _1578 = -_199;
    int _1580 = _1498 ? as_type<int>(_1578) : as_type<int>(_199);
    float _1582 = _1570 * 0.15915493667125701904296875;
    if (!_958)
    {
        _1516 = _968;
    }
    float _1584 = _1516;
    float _1586 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[91].y, _1514);
    if (!_958)
    {
        _1528 = _968;
    }
    float _1588 = _1528;
    float _1590 = _1582 * 6.283185482025146484375;
    float _1592 = cos(_1590);
    float _1594 = -_203;
    int _1596 = _777 ? as_type<int>(_1594) : as_type<int>(_203);
    float _1598 = _1584 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _1600 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1602 = _1600 != 0;
    float _1604 = fma(_1588, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1540);
    bool _1606 = !_1574;
    float _1608 = _1606 ? _199 : as_type<float>(_1580);
    float _1610 = _1564 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    bool _1612 = _968 > 0.5;
    bool _1614 = !_1602;
    float _1616 = _1614 ? _203 : as_type<float>(_1596);
    int _1618 = int(_1434) + int(_1550);
    int _1620 = ~_743;
    int _1622 = _1620 + 1;
    int _1624 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1626 = _1624 != 0;
    int _1628 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1630 = _1628 != 0;
    float _1632 = -_203;
    int _1634 = _1498 ? as_type<int>(_1632) : as_type<int>(_203);
    int _1636 = _1622 * _1618;
    int _1638 = _1636 + _1294;
    if (!_1138)
    {
        _1344 = _203;
    }
    float _1640 = _1344;
    bool _1642 = !_1630;
    float _1644 = _1642 ? _203 : as_type<float>(_1634);
    float _1646 = _1582 * 6.283185482025146484375;
    float _1648 = sin(_1646);
    float _1650 = _1640;
    if (_1138)
    {
        float _1652 = -_203;
        float _1654 = _1490 ? _1652 : _203;
        _1650 = _1654;
    }
    float _1656 = _1650;
    bool _1658 = uint(_1638) >= uint(_743);
    float _1660 = _1656 + (-0.5);
    float _1662 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _1664 = _1484 != 0;
    int _1666 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1668 = _1666 != 0;
    float _1670 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1672 = -_199;
    int _1674 = _1552 ? as_type<int>(_1672) : as_type<int>(_199);
    float _1676 = fma(_1542, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1662);
    float _1678 = -_203;
    int _1680 = _1552 ? as_type<int>(_1678) : as_type<int>(_203);
    float _1682 = -_1670;
    float _1684 = fma(_1598, 2.0, _1682);
    bool _1686 = !_1658;
    int _1688 = _1686 ? 0 : (-1);
    float _1690 = fma(_1120, _1268, _1544);
    int _1692 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1694 = _1692 != 0;
    int _1696 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1698 = _1696 != 0;
    float _1700 = _1134 * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    float _1702 = _1444 + 0.5;
    float _1704 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    int _1706 = ~_1618;
    int _1708 = _1706 + _1688;
    int _1710 = _1708 + 1;
    float _1712 = fma(_1576, _1702, _1560);
    float _1714 = _203 * _1648;
    bool _1716 = !_1698;
    float _1718 = _1716 ? _203 : as_type<float>(_1680);
    float _1720 = _203 * _1592;
    float _1722 = -_199;
    int _1724 = _1612 ? as_type<int>(_1722) : as_type<int>(_199);
    float _1726 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    bool _1728 = !_1626;
    float _1730 = _1728 ? _199 : as_type<float>(_1674);
    float _1732 = _1532 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1734 = -_1714;
    float _1736 = fma(_199, _1592, _1734);
    bool _1738 = !_1694;
    float _1740 = _1738 ? _199 : as_type<float>(_1724);
    float _1742 = _1568 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1744 = fma(_199, _1648, _1720);
    float _1746 = fma(_1732, -2.0, _1726);
    float _1748 = in.m_52.x;
    float _1750 = in.m_52.y;
    float _1752 = float(uint(_1194));
    float _1754 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1756 = -_1700;
    float _1758 = -_1586;
    float _1760 = fma(_1756, _1660, _1758);
    float _1762 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1764 = as_type<float>(_795) * _1752;
    int _1766 = _743 * _1710;
    int _1768 = _1766 + _1294;
    bool _1770 = _743 == 0;
    float _1772 = -_1762;
    float _1774 = fma(_1610, 2.0, _1772);
    float _1776 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1778 = _1704 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1780 = _1608 + 0.5;
    float _1782 = -_125;
    float _1784 = fma(_1782, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1684);
    float _1786 = trunc(_1764);
    float _1788 = precise::max(_1786, 0.0);
    uint _1790 = uint(_1788);
    float _1792 = _1730 + 0.5;
    float _1794 = -_125;
    float _1796 = fma(_1794, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1774);
    float _1798 = fma(_1128, _1242, _1690);
    float _1800 = fma(_1742, -2.0, _1776);
    bool _1802 = !_1770;
    int _1804 = _1802 ? _1768 : (-1);
    float _1806 = fma(_1780, (*spvDescriptorSet0.vp_c9)._m0[85].x, _1784);
    float _1808 = fma(_1778, _1792, _1796);
    float _1810 = _1754 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1812 = _1644 + (-0.5);
    float _1814 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1800);
    int _1816 = _1804 >> 31;
    float _1818 = fma(_1188, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1798);
    float _1820 = _1750 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1822 = -_1810;
    float _1824 = -_1814;
    float _1826 = fma(_1822, _1812, _1824);
    int _1828 = _1816 & 3;
    float _1830 = _1748 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    int _1832 = ~_743;
    int _1834 = _1832 + 1;
    float _1836 = _1820 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    int _1838 = _1804 + _1828;
    float _1840 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1744);
    float _1842 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1746);
    int _1844 = _1834 * int(_1790);
    int _1846 = _1844 + _1194;
    int _1848 = _1838 >> 2;
    float _1850 = _1830 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1852 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1736);
    float _1854 = _1836 * _1840;
    float _1856 = float(uint(_1846));
    float _1858 = _1616 + (-0.5);
    int _1860 = _1848 << 4;
    int _1862 = _1860 + 512;
    float _1864 = _1850 * _1852;
    float _1866 = _1854 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1868 = as_type<float>(_795) * _1856;
    uint _1870 = uint(int(uint(_1862) >> uint(2)));
    uint _1872 = uint(int(uint(int(_1870)) >> uint(2)));
    int _1874 = int(_1870) & 3;
    float _1876 = (*spvDescriptorSet0.vp_c9)._m0[int(_1872)][_1874];
    int _1878 = int(_1870) + 1;
    uint _1880 = uint(int(uint(_1878) >> uint(2)));
    int _1882 = _1878 & 3;
    float _1884 = (*spvDescriptorSet0.vp_c9)._m0[int(_1880)][_1882];
    float _1886 = _1854 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1888 = _1854 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1890 = -_1858;
    float _1892 = -_1842;
    float _1894 = fma(_1890, (*spvDescriptorSet0.vp_c9)._m0[85].y, _1892);
    float _1896 = fma(_1864, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1866);
    float _1898 = trunc(_1868);
    float _1900 = precise::max(_1898, 0.0);
    uint _1902 = uint(_1900);
    float _1904 = fma(_1864, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1886);
    float _1906 = fma(_1864, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1888);
    int _1908 = _1804 & 3;
    int _1910 = _1862 + 8;
    uint _1912 = uint(int(uint(_1910) >> uint(2)));
    uint _1914 = uint(int(uint(int(_1912)) >> uint(2)));
    int _1916 = int(_1912) & 3;
    float _1918 = (*spvDescriptorSet0.vp_c9)._m0[int(_1914)][_1916];
    int _1920 = int(_1912) + 1;
    uint _1922 = uint(int(uint(_1920) >> uint(2)));
    int _1924 = _1920 & 3;
    float _1926 = (*spvDescriptorSet0.vp_c9)._m0[int(_1922)][_1924];
    float _1928 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    int _1930 = _1804 & 3;
    bool _1932 = _1930 != 0;
    bool _1934 = uint(_1908) > 1u;
    float _1936 = fma(_1928, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1906);
    float _1938 = fma(_1928, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1904);
    int _1940 = _1932 ? 0 : 1;
    float _1942 = fma(_1928, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1896);
    float _1944 = _1936 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1946 = _1938 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    int _1948 = ~_743;
    int _1950 = _1948 + 1;
    float _1952 = _1942 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    int _1954 = int(_1790) + int(_1902);
    int _1956 = ~_1940;
    int _1958 = _1956 + 1;
    int _1960 = _1958 + 1;
    int _1962 = _1960;
    if (!_1934)
    {
        int _1964 = ~_1940;
        int _1966 = _1964 + 1;
        _1962 = _1966;
    }
    int _1968 = _1962;
    float _1970 = _1150 + _1944;
    bool _1972 = _1908 != 3;
    float _1974 = _1190 + _1946;
    bool _1976 = uint(_1908) >= 2u;
    float _1978 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1980 = _1970 + _1978;
    int _1982 = _1950 * _1954;
    int _1984 = _1982 + _1194;
    float _1986 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1988 = _1974 + _1986;
    int _1990 = abs(_1968);
    float _1992 = _1980 * _1980;
    int _1994 = _1976 ? 0 : 1;
    bool _1996 = !_1932;
    int _1998 = _1996 ? 0 : 1;
    bool _2000 = _1908 != 3;
    float _2002 = fma(_1988, _1988, _1992);
    bool _2004 = uint(_1984) >= uint(_743);
    int _2006 = ~_1994;
    int _2008 = _2006 + 1;
    int _2010 = _2008 + 1;
    int _2012 = _2010;
    float _2014 = _1970;
    if (_1972)
    {
        int _2016 = ~_1994;
        int _2018 = _2016 + 1;
        _2012 = _2018;
    }
    int _2020 = _2012;
    int _2022 = abs(_1998);
    float _2024 = sqrt(_2002);
    bool _2026 = !_2000;
    int _2028 = _2026 ? 0 : (-1);
    int _2030 = ~_1990;
    int _2032 = _2030 + 1;
    int _2034 = _2032 + 1;
    int _2036 = abs(_2028);
    int _2038 = abs(_2020);
    int _2040 = _2034 * as_type<int>(_1884);
    int _2042 = ~_2022;
    int _2044 = _2042 + 1;
    int _2046 = _2044 + 1;
    int _2048 = ~_2038;
    int _2050 = _2048 + 1;
    int _2052 = _2050 + 1;
    bool _2054 = !_2004;
    int _2056 = _2054 ? 0 : (-1);
    int _2058 = _2046 * as_type<int>(_1876);
    int _2060 = _2058 + _2040;
    int _2062 = ~_2036;
    int _2064 = _2062 + 1;
    int _2066 = _2064 + 1;
    bool _2068 = _2024 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _2070 = _2052 * as_type<int>(_1918);
    int _2072 = _2070 + _2060;
    bool _2074 = !_1668;
    int _2076 = _2074 ? 0 : 1;
    int _2078 = ~_1954;
    int _2080 = _2078 + _2056;
    int _2082 = _2080 + 1;
    int _2084 = _2066 * as_type<int>(_1926);
    int _2086 = _2084 + _2072;
    int _2088 = abs(_2076);
    float _2090 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2092 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[92].z, _1522);
    int _2094 = _743 * _2082;
    int _2096 = _2094 + _1194;
    int _2098 = ~_2088;
    int _2100 = _2098 + 1;
    int _2102 = _2100 + 1;
    float _2104 = _753 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _2106 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[92].w, _1500);
    float _2108 = -_2092;
    float _2110 = _2108 + 1.0;
    if (!_2068)
    {
        _1530 = _1974;
    }
    float _2112 = _1530;
    int _2114 = _2086 * _2102;
    float _2116 = _2104 + _1952;
    float _2118 = -_2106;
    float _2120 = _2118 + 1.0;
    bool _2122 = !_1770;
    int _2124 = _2122 ? _2096 : (-1);
    bool _2126 = !_2068;
    float _2128 = _2116;
    float _2130 = _2112;
    if (!_2126)
    {
        float _2132 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2134 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2136 = _2024 + _2134;
        float _2138 = _2116 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2140 = rsqrt(_2002);
        float _2142 = _2136 * _2132;
        float _2144 = _2142 * 0.15915493667125701904296875;
        float _2146 = _2144 * 6.283185482025146484375;
        float _2148 = cos(_2146);
        float _2150 = _2144 * 6.283185482025146484375;
        float _2152 = sin(_2150);
        float _2154 = _2148 + (-1.0);
        float _2156 = fma(_2152, _2138, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2158 = _2154 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2160 = _2140 * _2156;
        float _2162 = fma(_2116, _2148, _2158);
        float _2164 = fma(_1988, _2160, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2166 = fma(_1980, _2160, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2128 = _2162;
        _2130 = _2164;
        _2014 = _2166;
    }
    float _2168 = _2128;
    float _2170 = _2130;
    float _2172 = _2014;
    float _2174 = fma(_2120, _1656, _1760);
    float _2176 = -_2104;
    float _2178 = _2176 + _2168;
    int _2180 = _2124 * _2088;
    int _2182 = _2180 + _2114;
    float _2184 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1566);
    float _2186 = -_1190;
    float _2188 = _2186 + _2170;
    float _2190 = _2178 * _2178;
    float _2192 = -_2110;
    float _2194 = fma(_2192, _1444, _1712);
    float _2196 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2198 = -_2184;
    float _2200 = _2198 + 1.0;
    float _2202 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1604);
    float _2204 = -_1150;
    float _2206 = _2204 + _2172;
    float _2208 = fma(_2188, _2188, _2190);
    float _2210 = -_2200;
    float _2212 = fma(_1730, _2210, _1808);
    float _2214 = -_2202;
    float _2216 = _2214 + 1.0;
    float _2218 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1456);
    float _2220 = fma(_2206, _2206, _2208);
    float _2222 = _1740 + 0.5;
    float _2224 = -_1718;
    float _2226 = _2224 + 0.5;
    float _2228 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1676);
    float _2230 = -_2216;
    float _2232 = fma(_1608, _2230, _1806);
    float _2234 = _2222 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2236 = sqrt(_2220);
    float _2238 = _2226 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2240 = -_2228;
    float _2242 = _2240 + 1.0;
    float _2244 = -_2218;
    float _2246 = _2244 + 1.0;
    float _2248 = _2234 * _2090;
    float _2250 = _2238 * _2196;
    float _2252 = fma(_1616, _2242, _1894);
    float _2254 = fma(_1644, _2246, _1826);
    float _2256 = float(_2182);
    out.m_60.x = _2194;
    out.m_60.y = _2174;
    out.m_62.x = _1818;
    bool _2258 = _2236 > 0.0;
    out.m_64.x = _2248;
    out.m_64.y = _2250;
    out.m_64.z = _2232;
    out.m_64.w = _2252;
    out.m_66.x = _2212;
    out.m_66.y = _2254;
    out.m_68.y = _2256;
    bool _2260 = !_2258;
    float _2262 = _2252;
    float _2264 = _2250;
    float _2266 = _2168;
    float _2268 = _2170;
    float _2270 = _2172;
    float _2272 = _2250;
    float _2274 = _2248;
    if (!_2260)
    {
        bool _2276 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _2278 = _2248;
        if (_2276)
        {
            float _2280 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _2278 = _2280;
        }
        float _2282 = _2278;
        float _2284 = _2282;
        if (_2276)
        {
            float _2286 = _415 * _2282;
            _2262 = _2286;
        }
        float _2288 = _2262;
        float _2290 = _2288;
        if (_2276)
        {
            float _2292 = _417 * _2282;
            _2264 = _2292;
        }
        float _2294 = _2264;
        float _2296 = _2294;
        if (_2276)
        {
            float _2298 = _419 * _2282;
            _2284 = _2298;
        }
        float _2300 = _2284;
        float _2302 = _2300;
        float _2304 = _2300;
        if (!_2276)
        {
            float _2306 = _125 + 1.0;
            float _2308 = _2306;
            if (!_1664)
            {
                float _2310 = _2306 * _2306;
                float _2312 = _2310 * 0.5;
                _2302 = _2312;
            }
            float _2314 = _2302;
            float _2316 = _2314;
            if (!_1664)
            {
                float _2318 = _2314 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2316 = _2318;
            }
            float _2320 = _2316;
            bool _2322 = !_1664;
            float _2324 = _2320;
            if (!_2322)
            {
                float _2326 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2328 = log2(_2326);
                float _2330 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2332 = _2330 + 1.0;
                float _2334 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2336 = _2328 * _2306;
                float _2338 = 1.0 / _2332;
                float _2340 = _2334 * 0.693147182464599609375;
                float _2342 = exp2(_2336);
                float _2344 = 1.0 / _2340;
                float _2346 = _2342 + (-1.0);
                float _2348 = -_2346;
                float _2350 = fma(_2348, _2344, _2306);
                float _2352 = _2350 * _2338;
                float _2354 = _2352 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2324 = _2354;
            }
            float _2356 = _2324;
            float _2358 = _2356 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _2360 = _2356 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            bool _2362 = !_1664;
            if (!_2362)
            {
                float _2364 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2366 = log2(_2364);
                float _2368 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2370 = _2368 + 1.0;
                float _2372 = 1.0 / _2370;
                float _2374 = _2366 * _2306;
                float _2376 = exp2(_2374);
                float _2378 = -_2376;
                float _2380 = _2378 + 1.0;
                float _2382 = _2380 * _2372;
                _2308 = _2382;
            }
            float _2384 = _2308;
            float _2386 = fma(_2384, _163, _2360);
            float _2388 = _2356 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _2390 = fma(_2384, _161, _2358);
            float _2392 = -_377;
            float _2394 = _2392 + _2386;
            float _2396 = fma(_2384, _165, _2388);
            float _2398 = -_381;
            float _2400 = _2398 + _2390;
            float _2402 = _2394 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _2404 = _2394 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _2406 = _2394 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _2408 = -_389;
            float _2410 = _2408 + _2396;
            float _2412 = fma(_2400, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2402);
            float _2414 = fma(_2400, (*spvDescriptorSet0.vp_c10)._m0[5].x, _2404);
            float _2416 = fma(_2400, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2406);
            float _2418 = fma(_2410, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2412);
            float _2420 = fma(_2410, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2414);
            float _2422 = fma(_2410, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2416);
            _423 = _2420;
            _425 = _2418;
            _427 = _2422;
            _2290 = _2418;
            _2296 = _2420;
            _2304 = _2422;
        }
        float _2424 = _423;
        float _2426 = _425;
        float _2428 = _427;
        float _2430 = _2290;
        float _2432 = _2296;
        float _2434 = _2304;
        float _2436 = _2424 * _2424;
        float _2438 = rsqrt(_2220);
        float _2440 = fma(_2426, _2426, _2436);
        float _2442 = fma(_2428, _2428, _2440);
        float _2444 = sqrt(_2442);
        float _2446 = _2188 * _2438;
        float _2448 = _2178 * _2438;
        float _2450 = _2206 * _2438;
        bool _2452 = _2444 > 0.0;
        bool _2454 = !_2452;
        _2272 = _2432;
        _2274 = _2434;
        if (!_2454)
        {
            float _2456 = rsqrt(_2442);
            float _2458 = _2456 * _2424;
            float _2460 = _2456 * _2426;
            float _2462 = _2456 * _2428;
            float _2464 = _2448 * _2458;
            float _2466 = fma(_2446, _2460, _2464);
            float _2468 = fma(_2450, _2462, _2466);
            float _2470 = _2468 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2472 = fma(_2430, _2470, _2170);
            float _2474 = fma(_2432, _2470, _2168);
            float _2476 = fma(_2434, _2470, _2172);
            _2266 = _2474;
            _2268 = _2472;
            _2270 = _2476;
        }
    }
    float _2478 = _2266;
    float _2480 = _2268;
    float _2482 = _2270;
    float _2484 = _2272;
    float _2486 = _2274;
    float _2488 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2490 = _2478 + _2488;
    float _2492 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2494 = _2480 + _2492;
    float _2496 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2498 = _2482 + _2496;
    float _2500 = _2490 * _2490;
    float _2502 = _2478 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2504 = fma(_2494, _2494, _2500);
    float _2506 = fma(_2498, _2498, _2504);
    float _2508 = rsqrt(_2506);
    float _2510 = sqrt(_2506);
    float _2512 = _2508 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2514 = _2494 * _2512;
    float _2516 = _2498 * _2512;
    float _2518 = _2514 * _2514;
    float _2520 = _2516 * _2516;
    float _2522 = _2518 + _2520;
    float _2524 = sqrt(_2522);
    bool _2526 = _2524 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2528 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2530 = _2524 + _2528;
    float _2532 = _2508;
    float _2534 = _2486;
    float _2536 = _2530;
    float _2538 = _2484;
    float _2540 = _2490;
    float _2542 = _2512;
    if (_2526)
    {
        float _2544 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2532 = _2544;
    }
    float _2546 = _2532;
    if (_2526)
    {
        float _2548 = rsqrt(_2522);
        _2534 = _2548;
    }
    float _2550 = _2534;
    float _2552 = _2550;
    if (_2526)
    {
        float _2554 = _2530 * _2546;
        _2536 = _2554;
    }
    float _2556 = _2536;
    float _2558 = _2478 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    if (_2526)
    {
        float _2560 = _2556 * 0.15915493667125701904296875;
        _2538 = _2560;
    }
    float _2562 = _2538;
    float _2564 = _2546;
    float _2566 = _2562;
    if (_2526)
    {
        float _2568 = _2562 * 6.283185482025146484375;
        float _2570 = sin(_2568);
        _2564 = _2570;
    }
    float _2572 = _2564;
    float _2574 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2576 = precise::max(0.0, _2574);
    float _2578 = _2498;
    float _2580 = _2576;
    if (_2526)
    {
        float _2582 = _2562 * 6.283185482025146484375;
        float _2584 = cos(_2582);
        _2578 = _2584;
    }
    float _2586 = _2578;
    float _2588 = -_2512;
    float _2590 = -_2576;
    float _2592 = fma(_2490, _2588, _2590);
    if (_2526)
    {
        float _2594 = _2592 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2580 = _2594;
    }
    float _2596 = _2580;
    float _2598 = _2572;
    float _2600 = _2596;
    if (_2526)
    {
        float _2602 = fma(_2572, _2596, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2540 = _2602;
    }
    float _2604 = _2540;
    float _2606 = _2604;
    if (!_2526)
    {
        _2598 = _2514;
    }
    float _2608 = _2598;
    float _2610 = _2608;
    if (_2526)
    {
        float _2612 = _2586 + (-1.0);
        _2600 = _2612;
    }
    float _2614 = _2600;
    float _2616 = _2614;
    if (_2526)
    {
        float _2618 = _2550 * _2604;
        _2542 = _2618;
    }
    float _2620 = _2542;
    if (!_2526)
    {
        _2552 = _2592;
    }
    float _2622 = _2552;
    float _2624 = _2622;
    if (_2526)
    {
        float _2626 = _2614 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2566 = _2626;
    }
    float _2628 = _2566;
    float _2630 = _2628;
    if (_2526)
    {
        float _2632 = _2514 * _2620;
        _2610 = _2632;
    }
    float _2634 = _2610;
    if (!_2526)
    {
        _2606 = _2516;
    }
    float _2636 = _2606;
    float _2638 = _2636;
    if (_2526)
    {
        float _2640 = _2516 * _2620;
        _2638 = _2640;
    }
    float _2642 = _2638;
    if (_2526)
    {
        float _2644 = fma(_2592, _2586, _2628);
        _2624 = _2644;
    }
    float _2646 = _2624;
    if (!_2526)
    {
        _2630 = _2518;
    }
    float _2648 = _2630;
    float _2650 = _2648;
    if (_2526)
    {
        float _2652 = _2634 * _2634;
        _2650 = _2652;
    }
    float _2654 = _2650;
    float _2656 = _2478 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (!_2526)
    {
        _2616 = _2520;
    }
    float _2658 = _2616;
    float _2660 = _2658;
    if (_2526)
    {
        float _2662 = _2642 * _2642;
        _2660 = _2662;
    }
    float _2664 = _2660;
    float _2666 = fma(_2646, _2646, _2654);
    float _2668 = fma(_2480, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2656);
    float _2670 = fma(_2480, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2558);
    float _2672 = _2478 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2674 = _2666 + _2664;
    float _2676 = fma(_2482, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2668);
    float _2678 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2680 = fma(_2510, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2678);
    float _2682 = precise::clamp(_2680, 0.0, 1.0);
    float _2684 = fma(_2480, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2672);
    float _2686 = rsqrt(_2674);
    float _2688 = fma(_2482, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2670);
    float _2690 = _2676 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2692 = fma(_2482, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2684);
    float _2694 = -_2682;
    float _2696 = _2694 + 1.0;
    float _2698 = _2688 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2700 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2702 = _2690 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2704 = fma(_2480, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2502);
    float _2706 = _2692 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2708 = abs(_2696);
    float _2710 = log2(_2708);
    float _2712 = -_2702;
    float _2714 = fma(_2712, _2700, 1.0);
    float _2716 = _2698 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2718 = fma(_2482, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2704);
    float _2720 = _2686 * _2634;
    float _2722 = _2686 * _2646;
    float _2724 = _2686 * _2642;
    float _2726 = fma(_2706, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2716);
    float _2728 = _2720 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2730 = _2718 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2732 = log2(_2714);
    float _2734 = fma(_2690, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2726);
    float _2736 = -_2728;
    float _2738 = fma(_2722, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2736);
    float _2740 = _2710 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2742 = -_2724;
    float _2744 = fma(_2742, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2738);
    float _2746 = fma(_2730, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2734);
    float _2748 = _2698 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2750 = _2698 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2752 = fma(_2744, -0.5, 0.5);
    float _2754 = exp2(_2740);
    float _2756 = fma(_2744, 0.5, 0.5);
    float _2758 = fma(_2706, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2748);
    float _2760 = fma(_2706, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2750);
    float _2762 = _2722 + 1.0;
    float _2764 = fma(_2756, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2766 = fma(_2690, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2758);
    float _2768 = fma(_2690, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2760);
    float _2770 = 1.0 / _2746;
    float _2772 = fma(_2756, _2764, -0.212114393711090087890625);
    float _2774 = fma(_2730, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2766);
    float _2776 = fma(_2730, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2768);
    float _2778 = _2732 * 0.693147182464599609375;
    float _2780 = fma(_2756, _2772, 1.570728778839111328125);
    float _2782 = sqrt(_2752);
    float _2784 = -_2722;
    float _2786 = fma(_2754, _2762, _2784);
    float _2788 = _2778 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2790 = fma(_2786, 0.5, 0.5);
    float _2792 = _2774 * _2770;
    float _2794 = _2776 * _2770;
    float _2796 = fma(_2792, 0.5, 0.5);
    float _2798 = fma(_2794, -0.5, 0.5);
    float _2800 = _2782 * 0.636619746685028076171875;
    float _2802 = -_2780;
    float _2804 = fma(_2800, _2802, 1.0);
    float3 _7264 = float3(_2796, _2798, _2788);
    float _2806 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7264, float3(0.0), isnan(_7264)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7264, float3(0.0), isnan(_7264)), level(0.0)).x;
    float3 _7275 = float3(_2796, _2798, _2788);
    float4 _2809 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7275, float3(0.0), isnan(_7275)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7275, float3(0.0), isnan(_7275)), level(0.0)).xyzw;
    float _2811 = _2809.x;
    float _2813 = _2809.y;
    float _2815 = _2809.z;
    float _2817 = _2809.w;
    float2 _7292 = float2(_2804, _2790);
    float3 _2821 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7292, float2(0.0), isnan(_7292)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7292, float2(0.0), isnan(_7292)), level(0.0)).xyz;
    float _2823 = _2821.x;
    float _2825 = _2821.y;
    float _2827 = _2821.z;
    float _2829 = _2104 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    bool _2831 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2833 = isnan(0.5);
    bool _2835 = _2831 || _2833;
    bool _2837 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2839 = _2835 || _2837;
    float _2841 = fma(_1190, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2829);
    float _2843 = _2104 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2845 = fma(_1150, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2841);
    float _2847 = fma(_1190, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2843);
    float _2849 = _2845 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2851 = fma(_1150, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2847);
    float _2853 = _2698 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2855 = 1.0 / _2849;
    float _2857 = _2851 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2859 = fma(_2706, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2853);
    float _2861 = _2706;
    float _2863 = _2710;
    if (_2839)
    {
        _2861 = 1.0;
    }
    float _2865 = _2861;
    float _2867 = _2857 + _2849;
    float _2869 = fma(_2690, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2859);
    float _2871 = fma(_2730, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2869);
    float _2873 = _2867 * _2855;
    float _2875 = _2873 * 0.5;
    float _2877 = _2710 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2879 = _2865;
    if (_2839)
    {
        _2863 = 1.0;
    }
    float _2881 = _2863;
    float _2883 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2885 = fma(_2875, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2883);
    float _2887 = exp2(_2877);
    float _2889 = 1.0 / _2885;
    float _2891 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2893 = _2889 * _2891;
    float _2895 = _2881;
    if (!_2839)
    {
        float _2897 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2899 = _2897 * 0.15915493667125701904296875;
        float _2901 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2903 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2905 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2903;
        float _2907 = _2899 * 6.283185482025146484375;
        float _2909 = cos(_2907);
        float _2911 = _2901 * 0.15915493667125701904296875;
        float _2913 = _2899 * 6.283185482025146484375;
        float _2915 = sin(_2913);
        float _2917 = 1.0 / _2909;
        float _2919 = _2911 * 6.283185482025146484375;
        float _2921 = cos(_2919);
        float _2923 = _2915 * _2917;
        float _2925 = _2911 * 6.283185482025146484375;
        float _2927 = sin(_2925);
        float _2929 = _2921 * _2923;
        float _2931 = 1.0 / _2905;
        float _2933 = 1.0 / _2929;
        float _2935 = _2927 * _2933;
        float _2937 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2939 = fma(_2893, _2935, _2937);
        float _2941 = _2939 * _2931;
        float _2943 = precise::clamp(_2941, 0.0, 1.0);
        _2895 = _2943;
    }
    float _2945 = _2895;
    if (!_2839)
    {
        float _2947 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2949 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2951 = _2947 * 0.15915493667125701904296875;
        float _2953 = _2949 * 0.15915493667125701904296875;
        float _2955 = _2951 * 6.283185482025146484375;
        float _2957 = cos(_2955);
        float _2959 = _2951 * 6.283185482025146484375;
        float _2961 = sin(_2959);
        float _2963 = 1.0 / _2957;
        float _2965 = _2953 * 6.283185482025146484375;
        float _2967 = cos(_2965);
        float _2969 = _2961 * _2963;
        float _2971 = _2953 * 6.283185482025146484375;
        float _2973 = sin(_2971);
        float _2975 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2977 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2975;
        float _2979 = _2967 * _2969;
        float _2981 = 1.0 / _2977;
        float _2983 = 1.0 / _2979;
        float _2985 = _2973 * _2983;
        float _2987 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2989 = fma(_2893, _2985, _2987);
        float _2991 = _2989 * _2981;
        float _2993 = precise::clamp(_2991, 0.0, 1.0);
        float _2995 = -_2993;
        float _2997 = _2995 + 1.0;
        _2879 = _2997;
    }
    float _2999 = _2879;
    float _3001 = _2945 * _2999;
    float _3003 = -_2887;
    float _3005 = _3003 + 1.0;
    bool _3007 = _2945 > 0.0;
    bool _3009 = isnan(_2945);
    bool _3011 = _3007 || _3009;
    bool _3013 = isnan(0.0);
    bool _3015 = _3011 || _3013;
    float _3017 = _2871 + _2746;
    float _3019 = _3001 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3021 = _3005 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    bool _3023 = _2999 <= 0.0;
    bool _3025 = !_3015;
    bool _3027 = _3023 || _3025;
    float _3029 = _3017 * 0.5;
    float _3031 = _3021 * _2806;
    float _3033 = -_3021;
    float _3035 = _3033 + 1.0;
    out.gl_Position.x = _2774;
    out.gl_Position.y = _2776;
    out.gl_Position.z = _2871;
    out.gl_Position.w = _2746;
    float _3037 = _3019 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3039 = _2817 * _3031;
    float _3041 = _2827 * _3031;
    out.m_70.z = _3029;
    out.m_70.w = _2746;
    float _3043 = fma(_2823, _3039, _2811);
    float _3045 = fma(_2825, _3039, _2813);
    float _3047 = _2817 * _3035;
    float _3049 = fma(_2817, _3041, _2815);
    out.m_45.x = _3037;
    out.m_72.x = _3043;
    out.m_72.y = _3045;
    out.m_72.z = _3049;
    out.m_72.w = _3047;
    if (!_3027)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_45.x = 0.0;
    float _3051 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3051;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

