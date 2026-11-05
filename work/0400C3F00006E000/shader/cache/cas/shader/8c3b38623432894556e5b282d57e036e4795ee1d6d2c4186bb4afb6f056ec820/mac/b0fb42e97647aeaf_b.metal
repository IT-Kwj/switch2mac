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
    float4 m_62 [[user(locn1)]];
    float4 m_64 [[user(locn2)]];
    float4 m_45 [[user(locn3)]];
    float4 m_60 [[user(locn4)]];
    float4 m_66 [[user(locn5)]];
    float4 m_58 [[user(locn7)]];
    float4 m_68 [[user(locn8)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_42 [[attribute(2)]];
    float4 m_47 [[attribute(3)]];
    float4 m_49 [[attribute(4)]];
    float4 m_54 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    bool _644 = false;
    bool _503 = false;
    bool _391 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _82 = in.m_42.w;
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
        out.m_45.x = 0.0;
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
        float _2308 = as_type<float>(_103);
        out.gl_Position.z = _2308;
    }
    if (!_91)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _107 = in.m_47.w;
    bool _109 = _107 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _111 = isnan(_107);
    bool _113 = _109 || _111;
    bool _115 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _117 = _113 || _115;
    float _119 = -_107;
    float _121 = _119 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _123 = 0.0;
    if (_117)
    {
        float _125 = float(_87);
        _123 = _125;
    }
    float _127 = _123;
    bool _129 = _121 >= _127;
    bool _131 = !_117;
    bool _133 = _129 || _131;
    if (_133)
    {
        _97 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _135 = _97;
    if (_133)
    {
        out.m_45.x = 0.0;
    }
    if (_133)
    {
        float _137 = _135 * 5.0;
        _105 = as_type<int>(_137);
    }
    int _139 = _105;
    if (_133)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2376 = as_type<float>(_139);
        out.gl_Position.z = _2376;
    }
    if (_133)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _141 = in.m_49.x;
    float _143 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _145 = _121 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _147 = as_type<float>(int(gl_VertexIndex));
    bool _149 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _151 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _153 = _149 || _151;
    bool _155 = isnan(1.0);
    bool _157 = _153 || _155;
    float _159 = in.m_47.x;
    float _161 = in.m_47.y;
    float _163 = in.m_47.z;
    float _165 = _145 * _143;
    float _167 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[20].x, _165);
    float _169 = _167 * 6.283185482025146484375;
    float _171 = floor(_167);
    int _173 = as_type<int>(_147) & 1;
    bool _175 = _173 != 0;
    int _177 = as_type<int>(_147) & 2;
    bool _179 = _177 != 0;
    float _181 = _169 * 0.15915493667125701904296875;
    bool _183 = !_175;
    float _185 = _183 ? (-0.5) : 0.5;
    int _187 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _189 = _187 != 0;
    float _191 = _181 * 6.283185482025146484375;
    float _193 = cos(_191);
    float _195 = _121 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _197 = !_179;
    float _199 = _197 ? (-0.5) : 0.5;
    float _201 = -_171;
    float _203 = _167 + _201;
    float _205 = _167;
    float _207 = _195;
    float _209 = _185;
    if (!_157)
    {
        float _211 = _195 * _195;
        float _213 = _211 * 0.5;
        _205 = _213;
    }
    float _215 = _205;
    float _217 = _215;
    if (!_157)
    {
        float _219 = _215 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _217 = _219;
    }
    float _221 = _217;
    bool _223 = !_157;
    float _225 = _221;
    if (!_223)
    {
        float _227 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _229 = log2(_227);
        float _231 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _233 = _231 + 1.0;
        float _235 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _237 = _195 * _229;
        float _239 = 1.0 / _233;
        float _241 = _235 * 0.693147182464599609375;
        float _243 = exp2(_237);
        float _245 = 1.0 / _241;
        float _247 = _243 + (-1.0);
        float _249 = -_247;
        float _251 = fma(_249, _245, _195);
        float _253 = _251 * _239;
        float _255 = _253 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _225 = _255;
    }
    float _257 = _225;
    bool _259 = !_157;
    if (!_259)
    {
        float _261 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _263 = log2(_261);
        float _265 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _267 = _265 + 1.0;
        float _269 = 1.0 / _267;
        float _271 = _195 * _263;
        float _273 = exp2(_271);
        float _275 = -_273;
        float _277 = _275 + 1.0;
        float _279 = _277 * _269;
        _207 = _279;
    }
    float _281 = _207;
    float _283 = in.m_54.w;
    int _285 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _287 = _285 != 0;
    int _289 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _291 = _289 != 0;
    float _293 = in.m_42.x;
    float _295 = in.m_42.y;
    float _297 = in.m_42.z;
    bool _299 = _203 < 0.5;
    float _301 = float(_299);
    float _303 = -_203;
    float _305 = fma(_303, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _307 = fma(_193, 0.5, 0.5);
    bool _309 = !_287;
    int _311 = _309 ? 0 : 1;
    float _313 = _257 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    bool _315 = !_189;
    int _317 = _315 ? 0 : 1;
    float _319 = -_301;
    float _321 = fma(_319, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _323 = abs(_311);
    float _325 = -_307;
    float _327 = fma(_325, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _329 = abs(_317);
    float _331 = fma(_281, _159, _313);
    bool _333 = !_291;
    int _335 = _333 ? 0 : 1;
    float _337 = _257 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _339 = _257 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    bool _341 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _343 = fma(_281, _161, _337);
    int _345 = abs(_335);
    float _347 = fma(_281, _163, _339);
    float _349 = float(_323);
    float _351 = float(_329);
    float _353 = abs(_305);
    float _355 = _349 * _353;
    float _357 = fma(_331, _283, _293);
    float _359 = fma(_343, _283, _295);
    float _361 = float(_345);
    float _363 = fma(_351, _327, _355);
    float _365 = fma(_347, _283, _297);
    float _367 = abs(_321);
    float _369 = fma(_361, _367, _363);
    bool _371 = !_341;
    float _373 = (*spvDescriptorSet0.vp_c9)._m0[7].x;
    float _389;
    if (!_371)
    {
        float _375 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _377 = _141 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _379 = fma(_377, (*spvDescriptorSet0.vp_c9)._m0[12].x, _121);
        float _381 = _379 * _375;
        float _383 = floor(_381);
        float _385 = -_383;
        float _387 = _381 + _385;
        _389 = _387;
        _391 = true;
    }
    else
    {
        float _393 = float(_87);
        float _395 = 1.0 / _393;
        float _397 = _121 * _395;
        _389 = _397;
    }
    _391 = false;
    float _399 = _389;
    float _401 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _403 = _399 + _401;
    float _405 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    bool _407 = _399 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _409 = isnan(_399);
    bool _411 = _407 || _409;
    bool _413 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _415 = _411 || _413;
    float _417 = float(_415);
    float _419 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _421 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _419;
    float _423 = _405 * _141;
    float _425 = -_417;
    float _427 = _425 + 1.0;
    bool _429 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _431 = 1.0 / _421;
    float _433 = trunc(_423);
    int _435 = int(_433);
    float _437 = _403 * _431;
    bool _439 = _399 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _441 = isnan(_399);
    bool _443 = _439 || _441;
    bool _445 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _447 = _443 || _445;
    float _449 = float(_447);
    float _451 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _453 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _451;
    float _455 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _457 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _455;
    float _459 = _449 * _427;
    float _461 = fma(_453, _437, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _463 = fma(_457, _437, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _465 = -_449;
    float _467 = _465 + 1.0;
    float _469 = _461 * _459;
    float _471 = _463 * _459;
    float _473 = fma(_467, (*spvDescriptorSet0.vp_c9)._m0[143].x, _469);
    float _475 = fma(_467, (*spvDescriptorSet0.vp_c9)._m0[143].y, _471);
    int _477 = _435 << 4;
    int _479 = _477 + 1712;
    float _481 = fma(_417, (*spvDescriptorSet0.vp_c9)._m0[144].x, _473);
    float _483 = fma(_417, (*spvDescriptorSet0.vp_c9)._m0[144].y, _475);
    bool _485 = !_429;
    float _501;
    if (!_485)
    {
        float _487 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _489 = _141 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _491 = fma(_489, (*spvDescriptorSet0.vp_c9)._m0[11].y, _121);
        float _493 = _491 * _487;
        float _495 = floor(_493);
        float _497 = -_495;
        float _499 = _493 + _497;
        _501 = _499;
        _503 = true;
    }
    else
    {
        float _505 = float(_87);
        float _507 = 1.0 / _505;
        float _509 = _121 * _507;
        _501 = _509;
    }
    _503 = false;
    float _511 = _501;
    uint _514 = uint(int(uint(_479) >> uint(2)));
    uint _516 = uint(int(uint(int(_514)) >> uint(2)));
    int _518 = int(_514) & 3;
    float _520 = (*spvDescriptorSet0.vp_c9)._m0[int(_516)][_518];
    int _522 = int(_514) + 1;
    uint _524 = uint(int(uint(_522) >> uint(2)));
    int _526 = _522 & 3;
    float _528 = (*spvDescriptorSet0.vp_c9)._m0[int(_524)][_526];
    float _530 = in.m_54.x;
    float _532 = in.m_54.y;
    float _534 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _536 = _511 + _534;
    bool _538 = _511 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _540 = isnan(_511);
    bool _542 = _538 || _540;
    bool _544 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _546 = _542 || _544;
    float _548 = float(_546);
    float _550 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _552 = _550 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _554 = _511 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _556 = isnan(_511);
    bool _558 = _554 || _556;
    bool _560 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _562 = _558 || _560;
    float _564 = float(_562);
    int _566 = _479 + 8;
    uint _568 = uint(int(uint(_566) >> uint(2)));
    uint _570 = uint(int(uint(int(_568)) >> uint(2)));
    int _572 = int(_568) & 3;
    float _574 = (*spvDescriptorSet0.vp_c9)._m0[int(_570)][_572];
    float _576 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _578 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _576;
    float _580 = -_548;
    float _582 = _580 + 1.0;
    bool _584 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _586 = 1.0 / _552;
    float _588 = _578 * _586;
    float _590 = fma(_588, _536, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _592 = _564 * _582;
    float _594 = _590 * _592;
    float _596 = -_564;
    float _598 = _596 + 1.0;
    float _600 = _483 * _532;
    float _602 = _481 * _530;
    float _604 = fma(_598, (*spvDescriptorSet0.vp_c9)._m0[115].x, _594);
    float _606 = fma(_548, (*spvDescriptorSet0.vp_c9)._m0[116].x, _604);
    float _608 = _520 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _610 = _528 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _612 = _606 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _614 = _608 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _616 = _610 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _618 = _574 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _620 = _618 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _622 = !_584;
    float _640;
    float _642;
    if (!_622)
    {
        float _624 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _626 = _141 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _628 = float(_87);
        float _630 = fma(_626, (*spvDescriptorSet0.vp_c9)._m0[11].w, _121);
        float _632 = _630 * _624;
        float _634 = floor(_632);
        float _636 = -_634;
        float _638 = _632 + _636;
        _640 = _628;
        _642 = _638;
        _644 = true;
    }
    else
    {
        float _646 = float(_87);
        float _648 = 1.0 / _646;
        float _650 = _121 * _648;
        _640 = _646;
        _642 = _650;
    }
    _644 = false;
    float _652 = _640;
    float _654 = _642;
    float _656 = _359 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _658 = _359 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _660 = _359 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _662 = fma(_121, 0.014999999664723873138427734375, _141);
    float _664 = fma(_357, (*spvDescriptorSet0.vp_c10)._m0[5].x, _656);
    float _666 = fma(_357, (*spvDescriptorSet0.vp_c10)._m0[4].x, _658);
    float _668 = fma(_357, (*spvDescriptorSet0.vp_c10)._m0[6].x, _660);
    float _670 = floor(_662);
    float _672 = fma(_365, (*spvDescriptorSet0.vp_c10)._m0[5].z, _664);
    float _674 = fma(_365, (*spvDescriptorSet0.vp_c10)._m0[4].z, _666);
    float _676 = fma(_365, (*spvDescriptorSet0.vp_c10)._m0[6].z, _668);
    float _678 = _672 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _680 = _674 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _682 = _676 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _684 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _686 = _678 + _684;
    float _688 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _690 = _680 + _688;
    float _692 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _694 = _682 + _692;
    float _696 = _686 * _686;
    float _698 = fma(_690, _690, _696);
    float _700 = fma(_694, _694, _698);
    float _702 = rsqrt(_700);
    float _704 = _686 * _702;
    float _706 = _690 * _702;
    float _708 = _694 * _702;
    float _710 = -_704;
    float _712 = fma(_710, (*spvDescriptorSet0.vp_c9)._m0[18].w, _686);
    float _714 = -_706;
    float _716 = fma(_714, (*spvDescriptorSet0.vp_c9)._m0[18].w, _690);
    float _718 = -_708;
    float _720 = fma(_718, (*spvDescriptorSet0.vp_c9)._m0[18].w, _694);
    float _722 = -_706;
    float _724 = fma(_722, (*spvDescriptorSet0.vp_c9)._m0[18].w, _680);
    float _726 = _712 * _712;
    float _728 = fma(_716, _716, _726);
    float _730 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _199);
    float _732 = fma(_720, _720, _728);
    float _734 = _600 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _736 = sqrt(_732);
    float _738 = _702 * _736;
    float _740 = _734 * _738;
    float _742 = _602 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _744 = _738 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _746 = _744 * 0.5;
    float _748 = _740 * _730;
    float _750 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _185);
    float _752 = _742 * _738;
    float _754 = fma(_670, -0.1500000059604644775390625, 1.0);
    float _756 = _748 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _758 = _752 * _750;
    float _760 = _748 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _762 = precise::max(_754, 0.20000000298023223876953125);
    float _764 = fma(_758, (*spvDescriptorSet0.vp_c10)._m0[10].x, _756);
    float _766 = fma(_758, (*spvDescriptorSet0.vp_c10)._m0[8].x, _760);
    float _768 = precise::min(_762, 1.0);
    float _770 = fma(_746, (*spvDescriptorSet0.vp_c10)._m0[10].z, _764);
    float _772 = _670 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _774 = fma(_746, (*spvDescriptorSet0.vp_c10)._m0[8].z, _766);
    float _776 = fma(_770, _768, _682);
    float _778 = fma(_774, _768, _680);
    float _780 = fma(_772, (*spvDescriptorSet0.vp_c10)._m0[10].y, _776);
    float _782 = fma(_772, (*spvDescriptorSet0.vp_c10)._m0[8].y, _778);
    float _784 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _786 = _780 + _784;
    float _788 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _790 = _782 + _788;
    float _792 = _786 * _786;
    float _794 = fma(_790, _790, _792);
    float _796 = _748 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _798 = sqrt(_794);
    float _800 = fma(_758, (*spvDescriptorSet0.vp_c10)._m0[9].x, _796);
    float _802 = fma(_746, (*spvDescriptorSet0.vp_c10)._m0[9].z, _800);
    float _804 = fma(_802, _768, _678);
    float _806 = fma(_772, (*spvDescriptorSet0.vp_c10)._m0[9].y, _804);
    bool _808 = _798 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _810 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _812 = _810 != 0;
    int _814 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _816 = _814 != 0;
    int _818 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _820 = _818 != 0;
    int _822 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _824 = _822 != 0;
    bool _826 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _828 = isnan(0.5);
    bool _830 = _826 || _828;
    bool _832 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _834 = _830 || _832;
    bool _836 = !_816;
    int _838 = _836 ? 0 : 1;
    bool _840 = !_812;
    int _842 = _840 ? 0 : 1;
    bool _844 = !_820;
    int _846 = _844 ? 0 : 1;
    bool _848 = !_824;
    int _850 = _848 ? 0 : 1;
    float _852 = _748;
    float _854 = _800;
    float _856 = _704;
    if (!_808)
    {
        _852 = _782;
    }
    float _858 = _852;
    float _860 = _858;
    if (!_808)
    {
        _373 = _780;
    }
    float _862 = _373;
    float _864 = _862;
    if (!_808)
    {
        _854 = _806;
    }
    float _866 = _854;
    bool _868 = !_808;
    float _870 = _866;
    if (!_868)
    {
        float _872 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _874 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _876 = _798 + _874;
        float _878 = rsqrt(_794);
        float _880 = _876 * _872;
        float _882 = _806 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _884 = _880 * 0.15915493667125701904296875;
        float _886 = _884 * 6.283185482025146484375;
        float _888 = cos(_886);
        float _890 = _884 * 6.283185482025146484375;
        float _892 = sin(_890);
        float _894 = _888 + (-1.0);
        float _896 = _894 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _898 = fma(_892, _882, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _900 = fma(_806, _888, _896);
        float _902 = _878 * _898;
        float _904 = fma(_790, _902, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _906 = fma(_786, _902, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _860 = _904;
        _864 = _906;
        _870 = _900;
    }
    float _908 = _860;
    float _910 = _864;
    float _912 = _870;
    float _914 = -_706;
    float _916 = fma(_914, (*spvDescriptorSet0.vp_c9)._m0[18].w, _908);
    float _918 = -_708;
    float _920 = fma(_918, (*spvDescriptorSet0.vp_c9)._m0[18].w, _910);
    float _922 = -_704;
    float _924 = fma(_922, (*spvDescriptorSet0.vp_c9)._m0[18].w, _912);
    float _926 = -_704;
    float _928 = fma(_926, (*spvDescriptorSet0.vp_c9)._m0[18].w, _678);
    float _930 = -_708;
    float _932 = fma(_930, (*spvDescriptorSet0.vp_c9)._m0[18].w, _682);
    float _934 = _924;
    float _936 = _916;
    float _938 = _920;
    float _940 = _912;
    if (_834)
    {
        _856 = _920;
    }
    float _942 = _856;
    float _944 = _942;
    if (!_834)
    {
        float _946 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _948 = _928 + _946;
        float _950 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _952 = _724 + _950;
        float _954 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _956 = -_682;
        float _958 = _956 + _910;
        float _960 = _948 * _948;
        float _962 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _964 = _932 + _962;
        float _966 = -_680;
        float _968 = _966 + _908;
        float _970 = -_678;
        float _972 = _970 + _912;
        float _974 = fma(_952, _952, _960);
        float _976 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _978 = fma(_964, _964, _974);
        float _980 = sqrt(_978);
        float _982 = 1.0 / _738;
        float _984 = _976 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _986 = precise::min(_980, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _988 = _986 * _954;
        float _990 = _988 * _982;
        float _992 = _984 * _990;
        float _994 = _958 * _990;
        float _996 = fma(_968, _992, _724);
        float _998 = fma(_972, _992, _928);
        float _1000 = fma(_984, _994, _932);
        _934 = _998;
        _936 = _996;
        _944 = _1000;
        _938 = _980;
    }
    float _1002 = _934;
    float _1004 = _936;
    float _1006 = _944;
    float _1008 = _938;
    float _1010 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1012 = _1002 + _1010;
    float _1014 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1016 = _1004 + _1014;
    float _1018 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1020 = _1006 + _1018;
    float _1022 = _1012 * _1012;
    float _1024 = fma(_1016, _1016, _1022);
    float _1026 = fma(_1020, _1020, _1024);
    float _1028 = rsqrt(_1026);
    float _1030 = sqrt(_1026);
    float _1032 = _1028 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1034 = _1016 * _1032;
    float _1036 = _1020 * _1032;
    float _1038 = _1034 * _1034;
    float _1040 = _1036 * _1036;
    float _1042 = _1038 + _1040;
    float _1044 = sqrt(_1042);
    bool _1046 = _1044 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1048 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1050 = _1044 + _1048;
    float _1052 = _1024;
    float _1054 = _1042;
    float _1056 = _1050;
    float _1058 = _1012;
    float _1060 = _1008;
    if (_1046)
    {
        float _1062 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1052 = _1062;
    }
    float _1064 = _1052;
    if (_1046)
    {
        float _1066 = rsqrt(_1042);
        _1054 = _1066;
    }
    float _1068 = _1054;
    float _1070 = _1064;
    if (_1046)
    {
        float _1072 = _1050 * _1064;
        _1056 = _1072;
    }
    float _1074 = _1056;
    if (_1046)
    {
        float _1076 = _1074 * 0.15915493667125701904296875;
        _940 = _1076;
    }
    float _1078 = _940;
    float _1080 = _1028;
    if (_1046)
    {
        float _1082 = _1078 * 6.283185482025146484375;
        float _1084 = cos(_1082);
        _1080 = _1084;
    }
    float _1086 = _1080;
    float _1088 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1090 = precise::max(0.0, _1088);
    float _1092 = _1020;
    float _1094 = _1090;
    if (_1046)
    {
        float _1096 = _1078 * 6.283185482025146484375;
        float _1098 = sin(_1096);
        _1092 = _1098;
    }
    float _1100 = _1092;
    float _1102 = -_1032;
    float _1104 = -_1090;
    float _1106 = fma(_1012, _1102, _1104);
    if (!_1046)
    {
        _1094 = _1034;
    }
    float _1108 = _1094;
    float _1110 = _1108;
    if (_1046)
    {
        float _1112 = _1106 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1058 = _1112;
    }
    float _1114 = _1058;
    float _1116 = _1114;
    float _1118 = _1086;
    if (_1046)
    {
        float _1120 = _1086 + (-1.0);
        _1060 = _1120;
    }
    float _1122 = _1060;
    float _1124 = _1002 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1126 = _1122;
    if (_1046)
    {
        float _1128 = _1122 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1070 = _1128;
    }
    float _1130 = _1070;
    float _1132 = fma(_1004, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1124);
    float _1134 = _1100;
    float _1136 = _1130;
    if (_1046)
    {
        float _1138 = fma(_1100, _1114, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1116 = _1138;
    }
    float _1140 = _1116;
    float _1142 = _1140;
    if (!_1046)
    {
        _1134 = _1106;
    }
    float _1144 = _1134;
    float _1146 = _1144;
    if (_1046)
    {
        float _1148 = fma(_1106, _1086, _1130);
        _1146 = _1148;
    }
    float _1150 = _1146;
    if (!_1046)
    {
        _1136 = _1038;
    }
    float _1152 = _1136;
    float _1154 = _1152;
    if (_1046)
    {
        float _1156 = _1068 * _1140;
        _1126 = _1156;
    }
    float _1158 = _1126;
    if (!_1046)
    {
        _1142 = _1036;
    }
    float _1160 = _1142;
    float _1162 = _1002 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1164 = _1160;
    if (!_1046)
    {
        _1118 = _1040;
    }
    float _1166 = _1118;
    float _1168 = _1166;
    if (_1046)
    {
        float _1170 = _1034 * _1158;
        _1110 = _1170;
    }
    float _1172 = _1110;
    if (_1046)
    {
        float _1174 = _1036 * _1158;
        _1164 = _1174;
    }
    float _1176 = _1164;
    float _1178 = _1002 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1180 = fma(_1004, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1162);
    if (_1046)
    {
        float _1182 = _1172 * _1172;
        _1154 = _1182;
    }
    float _1184 = _1154;
    if (_1046)
    {
        float _1186 = _1176 * _1176;
        _1168 = _1186;
    }
    float _1188 = _1168;
    float _1190 = fma(_1004, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1178);
    float _1192 = fma(_1006, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1180);
    float _1194 = fma(_1150, _1150, _1184);
    float _1196 = _1002 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1198 = fma(_1006, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1190);
    float _1200 = _1194 + _1188;
    float _1202 = _1192 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1204 = fma(_1004, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1196);
    float _1206 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1208 = fma(_1006, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1132);
    float _1210 = _1198 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1212 = rsqrt(_1200);
    float _1214 = _1202 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1216 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1218 = fma(_1030, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1216);
    float _1220 = precise::clamp(_1218, 0.0, 1.0);
    float _1222 = fma(_1006, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1204);
    float _1224 = _1208 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1226 = fma(_1210, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1214);
    float _1228 = -_1220;
    float _1230 = _1228 + 1.0;
    float _1232 = _1222 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1234 = _1224 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1236 = fma(_1224, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1226);
    float _1238 = abs(_1230);
    float _1240 = log2(_1238);
    float _1242 = -_1234;
    float _1244 = fma(_1242, _1206, 1.0);
    float _1246 = _1212 * _1172;
    float _1248 = fma(_1232, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1236);
    float _1250 = _1212 * _1150;
    float _1252 = _1212 * _1176;
    float _1254 = _1246 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1256 = log2(_1244);
    float _1258 = _1202 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1260 = -_1254;
    float _1262 = fma(_1250, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1260);
    float _1264 = _1240 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1266 = fma(_1210, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1258);
    float _1268 = -_1252;
    float _1270 = fma(_1268, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1262);
    float _1272 = 1.0 / _1248;
    float _1274 = _1202 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1276 = _1250 + 1.0;
    float _1278 = fma(_1270, -0.5, 0.5);
    float _1280 = fma(_1270, 0.5, 0.5);
    float _1282 = fma(_1210, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1274);
    float _1284 = fma(_1224, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1266);
    float _1286 = exp2(_1264);
    float _1288 = fma(_1280, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1290 = fma(_1224, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1282);
    float _1292 = fma(_1232, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1284);
    float _1294 = _1256 * 0.693147182464599609375;
    float _1296 = fma(_1280, _1288, -0.212114393711090087890625);
    float _1298 = fma(_1232, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1290);
    float _1300 = sqrt(_1278);
    float _1302 = fma(_1280, _1296, 1.570728778839111328125);
    float _1304 = _1298 * _1272;
    float _1306 = _1292 * _1272;
    float _1308 = _1294 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1310 = fma(_1304, 0.5, 0.5);
    float _1312 = fma(_1306, -0.5, 0.5);
    float _1314 = -_1250;
    float _1316 = fma(_1286, _1276, _1314);
    float _1318 = fma(_1316, 0.5, 0.5);
    float _1320 = _1300 * 0.636619746685028076171875;
    float _1322 = -_1302;
    float _1324 = fma(_1320, _1322, 1.0);
    float3 _4251 = float3(_1310, _1312, _1308);
    float _1326 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4251, float3(0.0), isnan(_4251)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4251, float3(0.0), isnan(_4251)), level(0.0)).x;
    float3 _4262 = float3(_1310, _1312, _1308);
    float4 _1329 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4262, float3(0.0), isnan(_4262)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4262, float3(0.0), isnan(_4262)), level(0.0)).xyzw;
    float _1331 = _1329.x;
    float _1333 = _1329.y;
    float _1335 = _1329.z;
    float _1337 = _1329.w;
    float2 _4279 = float2(_1324, _1318);
    float3 _1341 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4279, float2(0.0), isnan(_4279)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4279, float2(0.0), isnan(_4279)), level(0.0)).xyz;
    float _1343 = _1341.x;
    float _1345 = _1341.y;
    float _1347 = _1341.z;
    float _1349 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _1351 = int(_1349);
    int _1353 = abs(_838);
    out.m_56.x = _614;
    out.m_56.y = _616;
    out.m_56.z = _620;
    out.m_56.w = _612;
    bool _1355 = _141 > 0.5;
    float _1357 = _1202 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_58.y = _1002;
    float _1359 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1361 = int(_1359);
    float _1363 = fma(_1210, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1357);
    float _1365 = in.m_49.y;
    float _1367 = fma(_1224, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1363);
    float _1369 = float(_1351);
    float _1371 = fma(_1232, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1367);
    float _1373 = 1.0 / _1369;
    float _1375 = float(uint(_1361));
    int _1377 = ~_1361;
    int _1379 = _1377 + 1;
    float _1381 = 1.0 / _1375;
    int _1383 = ~_1361;
    int _1385 = _1383 + 1;
    int _1387 = ~_1361;
    int _1389 = _1387 + 1;
    int _1391 = ~_1361;
    int _1393 = _1391 + 1;
    float _1395 = _1365 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1397 = _121 * _1373;
    float _1399 = float(_1361);
    float _1401 = trunc(_1397);
    int _1403 = int(_1401);
    int _1405 = as_type<int>(_1381) + (-2);
    float _1407 = float(uint(_1403));
    float _1409 = as_type<float>(_1405) * _1407;
    float _1411 = trunc(_1409);
    float _1413 = precise::max(_1411, 0.0);
    uint _1415 = uint(_1413);
    int _1417 = _1385 * int(_1415);
    int _1419 = _1417 + _1403;
    float _1421 = float(uint(_1419));
    float _1423 = as_type<float>(_1405) * _1421;
    int _1425 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1427 = _1425 != 0;
    bool _1429 = !_1427;
    float _1431 = _1429 ? _1365 : _141;
    float _1433 = trunc(_1423);
    float _1435 = precise::max(_1433, 0.0);
    uint _1437 = uint(_1435);
    bool _1439 = !_1427;
    float _1441 = _1439 ? 1.2345600128173828125 : 1.0;
    float _1443 = float(_1403);
    float _1445 = _1441 * _1431;
    bool _1447 = _1443 >= _1399;
    bool _1449 = isnan(_1443);
    bool _1451 = _1447 || _1449;
    bool _1453 = isnan(_1399);
    bool _1455 = _1451 || _1453;
    float _1457 = float(_1455);
    float _1459 = floor(_1445);
    int _1461 = int(_1415) + int(_1437);
    float _1463 = 1.0 / _652;
    int _1465 = _1379 * _1461;
    int _1467 = _1465 + _1403;
    bool _1469 = uint(_1467) >= uint(_1361);
    float _1471 = trunc(_1457);
    int _1473 = int(_1471);
    float _1475 = -_1459;
    float _1477 = _1445 + _1475;
    float _1479 = _121 * _1399;
    bool _1481 = !_1469;
    int _1483 = _1481 ? 0 : (-1);
    float _1485 = _1477 * _1399;
    bool _1487 = _1361 == 0;
    float _1489 = _1479 * _1463;
    int _1491 = ~_1461;
    int _1493 = _1491 + _1483;
    int _1495 = _1493 + 1;
    float _1497 = trunc(_1485);
    int _1499 = int(_1497);
    int _1501 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1503 = _1501 != 0;
    int _1505 = _1361 + (-1);
    int _1507 = _1361 * _1495;
    int _1509 = _1507 + _1403;
    bool _1511 = !_1503;
    int _1513 = _1511 ? 0 : 1;
    int _1515 = ~_1473;
    int _1517 = _1515 + 1;
    int _1519 = _1517 + 1;
    float _1521 = trunc(_1489);
    int _1523 = int(_1521);
    bool _1525 = !_1487;
    int _1527 = _1525 ? _1509 : (-1);
    int _1529 = abs(_1513);
    bool _1531 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1533 = isnan(0.5);
    bool _1535 = _1531 || _1533;
    bool _1537 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1539 = _1535 || _1537;
    int _1541 = _1527 * _1519;
    int _1543 = abs(_842);
    int _1545 = _1473 * _1505;
    int _1547 = _1545 + _1541;
    float _1549 = in.m_49.w;
    int _1551 = abs(_846);
    int _1553 = _1499 * _1529;
    int _1555 = _1553 + _1403;
    int _1557 = _1547 * _1353;
    int _1559 = abs(_850);
    float _1561 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _1563 = _1523 * _1543;
    int _1565 = _1563 + _1557;
    float _1567 = in.m_49.z;
    int _1569 = _1555 * _1551;
    int _1571 = _1569 + _1565;
    float _1573 = _141 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _1575 = _1499 * _1559;
    int _1577 = _1575 + _1571;
    float _1579 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1581 = _1579 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1583 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1585 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1587 = float(uint(_1577));
    float _1589 = -_1583;
    float _1591 = fma(_1573, 2.0, _1589);
    float _1593 = 1.0 / _1581;
    bool _1595 = _1549 > 0.5;
    float _1597 = fma(_1395, -2.0, _1585);
    float _1599 = as_type<float>(_1405) * _1587;
    float _1601 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1603 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1601;
    int _1605 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1607 = _1605 != 0;
    float _1609 = trunc(_1599);
    float _1611 = precise::max(_1609, 0.0);
    uint _1613 = uint(_1611);
    float _1615 = -_185;
    int _1617 = _1355 ? as_type<int>(_1615) : as_type<int>(_185);
    float _1619 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _1621 = _1567 > 0.5;
    int _1623 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1625 = _1623 != 0;
    float _1627 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1629 = -_185;
    int _1631 = _1621 ? as_type<int>(_1629) : as_type<int>(_185);
    float _1633 = _1603 * _1593;
    bool _1635 = !_1607;
    float _1637 = _1635 ? _185 : as_type<float>(_1617);
    float _1639 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1619);
    float _1641 = _1593;
    float _1643 = _1567;
    if (!_1427)
    {
        _1641 = _1365;
    }
    float _1645 = _1641;
    float _1647 = -_121;
    float _1649 = fma(_1647, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1591);
    bool _1651 = _1365 > 0.5;
    int _1653 = _1389 * int(_1613);
    int _1655 = _1653 + _1577;
    bool _1657 = !_1625;
    float _1659 = _1657 ? _185 : as_type<float>(_1631);
    float _1661 = _1637 + 0.5;
    float _1663 = _1645;
    if (_1427)
    {
        _1663 = _141;
    }
    float _1665 = _1663;
    float _1667 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1669 = float(uint(_1655));
    if (!_1427)
    {
        _209 = _1567;
    }
    float _1671 = _209;
    float _1673 = fma(_1365, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1667);
    float _1675 = _1671;
    if (_1427)
    {
        _1643 = _1365;
    }
    float _1677 = _1643;
    float _1679 = as_type<float>(_1405) * _1669;
    if (_1427)
    {
        _1675 = _1365;
    }
    float _1681 = _1675;
    float _1683 = _1627 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1685 = trunc(_1679);
    float _1687 = precise::max(_1685, 0.0);
    uint _1689 = uint(_1687);
    int _1691 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1693 = _1691 != 0;
    float _1695 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1697 = _654 + _1695;
    int _1699 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1701 = _1699 != 0;
    float _1703 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1705 = -_199;
    int _1707 = _1595 ? as_type<int>(_1705) : as_type<int>(_199);
    float _1709 = _1665 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1711 = float(uint(_1555));
    float _1713 = _1677 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1715 = -_199;
    int _1717 = _1651 ? as_type<int>(_1715) : as_type<int>(_199);
    bool _1719 = !_1693;
    float _1721 = _1719 ? _199 : as_type<float>(_1717);
    bool _1723 = !_1701;
    float _1725 = _1723 ? _199 : as_type<float>(_1707);
    float _1727 = fma(_1683, _1661, _1649);
    float _1729 = fma(_1633, _1697, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1731 = fma(_1681, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1703);
    bool _1733 = _654 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1735 = isnan(_654);
    bool _1737 = _1733 || _1735;
    bool _1739 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1741 = _1737 || _1739;
    float _1743 = float(_1741);
    float _1745 = _1721 + (-0.5);
    int _1747 = int(_1613) + int(_1689);
    float _1749 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1731);
    bool _1751 = _654 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1753 = isnan(_654);
    bool _1755 = _1751 || _1753;
    bool _1757 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1759 = _1755 || _1757;
    float _1761 = float(_1759);
    float _1763 = _1561 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1765 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1767 = as_type<float>(_1405) * _1711;
    float _1769 = -_1743;
    float _1771 = _1769 + 1.0;
    float _1773 = -_1749;
    float _1775 = _1773 + 1.0;
    float _1777 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1779 = _1761 * _1771;
    float _1781 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1597);
    float _1783 = trunc(_1767);
    float _1785 = precise::max(_1783, 0.0);
    uint _1787 = uint(_1785);
    float _1789 = fma(_1665, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1777);
    int _1791 = _1393 * _1747;
    int _1793 = _1791 + _1577;
    float _1795 = -_1763;
    float _1797 = -_1781;
    float _1799 = fma(_1795, _1745, _1797);
    float _1801 = _1729 * _1779;
    float _1803 = -_1765;
    float _1805 = fma(_1709, 2.0, _1803);
    bool _1807 = uint(_1793) >= uint(_1361);
    float _1809 = _928 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    int _1811 = ~_1361;
    int _1813 = _1811 + 1;
    float _1815 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    bool _1817 = !_1807;
    int _1819 = _1817 ? 0 : (-1);
    float _1821 = fma(_724, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1809);
    float _1823 = _928 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1825 = fma(_1713, -2.0, _1815);
    int _1827 = ~_1747;
    int _1829 = _1827 + _1819;
    int _1831 = _1829 + 1;
    int _1833 = _1813 * int(_1787);
    int _1835 = _1833 + _1555;
    float _1837 = fma(_932, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1821);
    float _1839 = fma(_724, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1823);
    float _1841 = -_1761;
    float _1843 = _1841 + 1.0;
    int _1845 = _1361 * _1831;
    int _1847 = _1845 + _1577;
    float _1849 = float(uint(_1835));
    float _1851 = fma(_932, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1839);
    float _1853 = _1837 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1855 = fma(_1843, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1801);
    bool _1857 = !_1487;
    int _1859 = _1857 ? _1847 : (-1);
    float _1861 = as_type<float>(_1405) * _1849;
    float _1863 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1673);
    float _1865 = 1.0 / _1853;
    int _1867 = _1859 >> 31;
    float _1869 = _1851 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1871 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1639);
    float _1873 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1789);
    int _1875 = _1867 & 3;
    float _1877 = -_121;
    float _1879 = fma(_1877, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1805);
    float _1881 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1825);
    float _1883 = trunc(_1861);
    float _1885 = precise::max(_1883, 0.0);
    uint _1887 = uint(_1885);
    int _1889 = _1859 + _1875;
    float _1891 = _1725 + (-0.5);
    float _1893 = _1869 + _1853;
    float _1895 = -_1863;
    float _1897 = _1895 + 1.0;
    int _1899 = _1889 >> 2;
    float _1901 = -_1891;
    float _1903 = -_1881;
    float _1905 = fma(_1901, (*spvDescriptorSet0.vp_c9)._m0[85].y, _1903);
    int _1907 = _1859 & 3;
    bool _1909 = _1907 != 0;
    float _1911 = _1893 * _1865;
    float _1913 = _1911 * 0.5;
    int _1915 = _1899 << 4;
    int _1917 = _1915 + 512;
    float _1919 = -_1871;
    float _1921 = _1919 + 1.0;
    float _1923 = fma(_1721, _1897, _1799);
    int _1925 = _1859 & 3;
    bool _1927 = _1925 != 0;
    float _1929 = _1659 + 0.5;
    float _1931 = -_1921;
    float _1933 = fma(_1637, _1931, _1727);
    int _1935 = ~_1361;
    int _1937 = _1935 + 1;
    int _1939 = _1917 + 8;
    uint _1941 = uint(int(uint(_1939) >> uint(2)));
    uint _1943 = uint(int(uint(int(_1941)) >> uint(2)));
    int _1945 = int(_1941) & 3;
    float _1947 = (*spvDescriptorSet0.vp_c9)._m0[int(_1943)][_1945];
    int _1949 = int(_1941) + 1;
    uint _1951 = uint(int(uint(_1949) >> uint(2)));
    int _1953 = _1949 & 3;
    float _1955 = (*spvDescriptorSet0.vp_c9)._m0[int(_1951)][_1953];
    int _1957 = int(_1787) + int(_1887);
    float _1959 = fma(_1725, _1775, _1905);
    bool _1961 = uint(_1925) > 1u;
    float _1963 = fma(_1929, (*spvDescriptorSet0.vp_c9)._m0[85].x, _1879);
    int _1965 = _1909 ? 0 : 1;
    int _1967 = _1937 * _1957;
    int _1969 = _1967 + _1555;
    float _1971 = -_1873;
    float _1973 = _1971 + 1.0;
    uint _1975 = uint(int(uint(_1917) >> uint(2)));
    uint _1977 = uint(int(uint(int(_1975)) >> uint(2)));
    int _1979 = int(_1975) & 3;
    float _1981 = (*spvDescriptorSet0.vp_c9)._m0[int(_1977)][_1979];
    int _1983 = int(_1975) + 1;
    uint _1985 = uint(int(uint(_1983) >> uint(2)));
    int _1987 = _1983 & 3;
    float _1989 = (*spvDescriptorSet0.vp_c9)._m0[int(_1985)][_1987];
    float _1991 = _1929;
    float _1993 = _1913;
    float _1995 = _1761;
    float _1997 = _1799;
    float _1999 = _1743;
    if (!_1539)
    {
        _1991 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    }
    float _2001 = _1991;
    float _2003 = fma(_1743, (*spvDescriptorSet0.vp_c9)._m0[132].x, _1855);
    int _2005 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _2007 = _2005 != 0;
    float _2009 = -_1973;
    float _2011 = fma(_1659, _2009, _1963);
    bool _2013 = uint(_1969) >= uint(_1361);
    if (!_1539)
    {
        float _2015 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _2017 = fma(_1913, _2001, _2015);
        _1993 = _2017;
    }
    float _2019 = _1993;
    if (!_1539)
    {
        _1995 = (*spvDescriptorSet0.vp_c9)._m0[140].z;
    }
    float _2021 = _1995;
    float _2023 = _2003 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    int _2025 = ~_1965;
    int _2027 = _2025 + 1;
    int _2029 = _2027 + 1;
    out.m_60.x = _1933;
    out.m_60.y = _1923;
    out.m_60.z = _2011;
    out.m_60.w = _1959;
    int _2031 = _2029;
    if (!_1961)
    {
        int _2033 = ~_1965;
        int _2035 = _2033 + 1;
        _2031 = _2035;
    }
    int _2037 = _2031;
    if (!_1539)
    {
        float _2039 = -_2021;
        float _2041 = _2039 + (*spvDescriptorSet0.vp_c9)._m0[140].w;
        _1997 = _2041;
    }
    float _2043 = _1997;
    bool _2045 = _1925 != 3;
    float _2047 = _2019;
    if (!_1539)
    {
        float _2049 = 1.0 / _2019;
        _2047 = _2049;
    }
    float _2051 = _2047;
    bool _2053 = !_2013;
    int _2055 = _2053 ? 0 : (-1);
    out.m_62.w = _2023;
    bool _2057 = !_1927;
    int _2059 = _2057 ? 0 : 1;
    int _2061 = abs(_2037);
    bool _2063 = uint(_1925) >= 2u;
    float _2065 = _2001;
    if (!_1539)
    {
        float _2067 = 1.0 / _2043;
        _2065 = _2067;
    }
    float _2069 = _2065;
    int _2071 = ~_1957;
    int _2073 = _2071 + _2055;
    int _2075 = _2073 + 1;
    int _2077 = abs(_2059);
    int _2079 = _1361 * _2075;
    int _2081 = _2079 + _1555;
    float _2083 = _1240 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _2085 = _1925 != 3;
    if (!_1539)
    {
        float _2087 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2089 = -_2021;
        float _2091 = fma(_2051, _2087, _2089);
        _1999 = _2091;
    }
    float _2093 = _1999;
    int _2095 = _2063 ? 0 : 1;
    int _2097 = ~_2061;
    int _2099 = _2097 + 1;
    int _2101 = _2099 + 1;
    float _2103 = exp2(_2083);
    int _2105 = ~_2095;
    int _2107 = _2105 + 1;
    int _2109 = _2107 + 1;
    int _2111 = _2109;
    float _2113 = _2093;
    if (_2045)
    {
        int _2115 = ~_2095;
        int _2117 = _2115 + 1;
        _2111 = _2117;
    }
    int _2119 = _2111;
    if (!_1539)
    {
        float _2121 = _2093 * _2069;
        float _2123 = precise::clamp(_2121, 0.0, 1.0);
        _2113 = _2123;
    }
    float _2125 = _2113;
    int _2127 = ~_2077;
    int _2129 = _2127 + 1;
    int _2131 = _2129 + 1;
    int _2133 = abs(_2119);
    bool _2135 = !_2085;
    float _2137 = _2135 ? 0.0 : as_type<float>(0xffffffffu /* nan */);
    int _2139 = _2101 * as_type<int>(_1989);
    int _2141 = abs(as_type<int>(_2137));
    float _2143 = _2137;
    if (_1539)
    {
        _2143 = 1.0;
    }
    float _2145 = _2143;
    int _2147 = _2131 * as_type<int>(_1981);
    int _2149 = _2147 + _2139;
    bool _2151 = !_2007;
    int _2153 = _2151 ? 0 : 1;
    float _2155 = _2145;
    if (!_1539)
    {
        float _2157 = -_2125;
        float _2159 = _2157 + 1.0;
        _2155 = _2159;
    }
    float _2161 = _2155;
    int _2163 = ~_2133;
    int _2165 = _2163 + 1;
    int _2167 = _2165 + 1;
    float _2169 = -_2103;
    float _2171 = _2169 + 1.0;
    int _2173 = abs(_2153);
    float _2175 = _2161 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    int _2177 = _2167 * as_type<int>(_1947);
    int _2179 = _2177 + _2149;
    int _2181 = ~_2173;
    int _2183 = _2181 + 1;
    int _2185 = _2183 + 1;
    float _2187 = _2171 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    int _2189 = ~_2141;
    int _2191 = _2189 + 1;
    int _2193 = _2191 + 1;
    float _2195 = _369 * _2175;
    float _2197 = _2187 * _1326;
    float _2199 = -_2187;
    float _2201 = _2199 + 1.0;
    int _2203 = _2193 * as_type<int>(_1955);
    int _2205 = _2203 + _2179;
    bool _2207 = !_1487;
    int _2209 = _2207 ? _2081 : (-1);
    float _2211 = _2195 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    bool _2213 = _2161 > 0.0;
    bool _2215 = isnan(_2161);
    bool _2217 = _2213 || _2215;
    bool _2219 = isnan(0.0);
    bool _2221 = _2217 || _2219;
    int _2223 = _2205 * _2185;
    float _2225 = -(*spvDescriptorSet0.vp_c8)._m0[31].z;
    float _2227 = _1371 + _2225;
    float _2229 = _1337 * _2197;
    float _2231 = _1347 * _2197;
    int _2233 = _2209 * _2173;
    int _2235 = _2233 + _2223;
    float _2237 = _1248 + _2227;
    out.gl_Position.x = _1298;
    out.gl_Position.y = _1292;
    out.gl_Position.z = _2227;
    out.gl_Position.w = _1248;
    float _2239 = fma(_1343, _2229, _1331);
    float _2241 = _2237 * 0.5;
    float _2243 = float(_2235);
    float _2245 = fma(_1345, _2229, _1333);
    float _2247 = _1337 * _2201;
    float _2249 = fma(_1337, _2231, _1335);
    out.m_64.z = _2241;
    out.m_64.w = _1248;
    out.m_66.y = _2243;
    out.m_45.x = _2211;
    out.m_68.x = _2239;
    out.m_68.y = _2245;
    out.m_68.z = _2249;
    out.m_68.w = _2247;
    if (_2221)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_45.x = 0.0;
    float _2251 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2251;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    bool _644 = false;
    bool _503 = false;
    bool _391 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _82 = in.m_42.w;
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
        out.m_45.x = 0.0;
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
        float _2308 = as_type<float>(_103);
        out.gl_Position.z = _2308;
    }
    if (!_91)
    {
        return out;
    }
    float _107 = in.m_47.w;
    bool _109 = _107 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _111 = isnan(_107);
    bool _113 = _109 || _111;
    bool _115 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _117 = _113 || _115;
    float _119 = -_107;
    float _121 = _119 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _123 = 0.0;
    if (_117)
    {
        float _125 = float(_87);
        _123 = _125;
    }
    float _127 = _123;
    bool _129 = _121 >= _127;
    bool _131 = !_117;
    bool _133 = _129 || _131;
    if (_133)
    {
        _97 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _135 = _97;
    if (_133)
    {
        out.m_45.x = 0.0;
    }
    if (_133)
    {
        float _137 = _135 * 5.0;
        _105 = as_type<int>(_137);
    }
    int _139 = _105;
    if (_133)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2376 = as_type<float>(_139);
        out.gl_Position.z = _2376;
    }
    if (_133)
    {
        return out;
    }
    float _141 = in.m_49.x;
    float _143 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _145 = _121 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _147 = as_type<float>(int(gl_VertexIndex));
    bool _149 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _151 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _153 = _149 || _151;
    bool _155 = isnan(1.0);
    bool _157 = _153 || _155;
    float _159 = in.m_47.x;
    float _161 = in.m_47.y;
    float _163 = in.m_47.z;
    float _165 = _145 * _143;
    float _167 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[20].x, _165);
    float _169 = _167 * 6.283185482025146484375;
    float _171 = floor(_167);
    int _173 = as_type<int>(_147) & 1;
    bool _175 = _173 != 0;
    int _177 = as_type<int>(_147) & 2;
    bool _179 = _177 != 0;
    float _181 = _169 * 0.15915493667125701904296875;
    bool _183 = !_175;
    float _185 = _183 ? (-0.5) : 0.5;
    int _187 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _189 = _187 != 0;
    float _191 = _181 * 6.283185482025146484375;
    float _193 = cos(_191);
    float _195 = _121 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _197 = !_179;
    float _199 = _197 ? (-0.5) : 0.5;
    float _201 = -_171;
    float _203 = _167 + _201;
    float _205 = _167;
    float _207 = _195;
    float _209 = _185;
    if (!_157)
    {
        float _211 = _195 * _195;
        float _213 = _211 * 0.5;
        _205 = _213;
    }
    float _215 = _205;
    float _217 = _215;
    if (!_157)
    {
        float _219 = _215 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _217 = _219;
    }
    float _221 = _217;
    bool _223 = !_157;
    float _225 = _221;
    if (!_223)
    {
        float _227 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _229 = log2(_227);
        float _231 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _233 = _231 + 1.0;
        float _235 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _237 = _195 * _229;
        float _239 = 1.0 / _233;
        float _241 = _235 * 0.693147182464599609375;
        float _243 = exp2(_237);
        float _245 = 1.0 / _241;
        float _247 = _243 + (-1.0);
        float _249 = -_247;
        float _251 = fma(_249, _245, _195);
        float _253 = _251 * _239;
        float _255 = _253 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _225 = _255;
    }
    float _257 = _225;
    bool _259 = !_157;
    if (!_259)
    {
        float _261 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _263 = log2(_261);
        float _265 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _267 = _265 + 1.0;
        float _269 = 1.0 / _267;
        float _271 = _195 * _263;
        float _273 = exp2(_271);
        float _275 = -_273;
        float _277 = _275 + 1.0;
        float _279 = _277 * _269;
        _207 = _279;
    }
    float _281 = _207;
    float _283 = in.m_54.w;
    int _285 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _287 = _285 != 0;
    int _289 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _291 = _289 != 0;
    float _293 = in.m_42.x;
    float _295 = in.m_42.y;
    float _297 = in.m_42.z;
    bool _299 = _203 < 0.5;
    float _301 = float(_299);
    float _303 = -_203;
    float _305 = fma(_303, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _307 = fma(_193, 0.5, 0.5);
    bool _309 = !_287;
    int _311 = _309 ? 0 : 1;
    float _313 = _257 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    bool _315 = !_189;
    int _317 = _315 ? 0 : 1;
    float _319 = -_301;
    float _321 = fma(_319, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _323 = abs(_311);
    float _325 = -_307;
    float _327 = fma(_325, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _329 = abs(_317);
    float _331 = fma(_281, _159, _313);
    bool _333 = !_291;
    int _335 = _333 ? 0 : 1;
    float _337 = _257 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _339 = _257 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    bool _341 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _343 = fma(_281, _161, _337);
    int _345 = abs(_335);
    float _347 = fma(_281, _163, _339);
    float _349 = float(_323);
    float _351 = float(_329);
    float _353 = abs(_305);
    float _355 = _349 * _353;
    float _357 = fma(_331, _283, _293);
    float _359 = fma(_343, _283, _295);
    float _361 = float(_345);
    float _363 = fma(_351, _327, _355);
    float _365 = fma(_347, _283, _297);
    float _367 = abs(_321);
    float _369 = fma(_361, _367, _363);
    bool _371 = !_341;
    float _373 = (*spvDescriptorSet0.vp_c9)._m0[7].x;
    float _389;
    if (!_371)
    {
        float _375 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _377 = _141 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _379 = fma(_377, (*spvDescriptorSet0.vp_c9)._m0[12].x, _121);
        float _381 = _379 * _375;
        float _383 = floor(_381);
        float _385 = -_383;
        float _387 = _381 + _385;
        _389 = _387;
        _391 = true;
    }
    else
    {
        float _393 = float(_87);
        float _395 = 1.0 / _393;
        float _397 = _121 * _395;
        _389 = _397;
    }
    _391 = false;
    float _399 = _389;
    float _401 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _403 = _399 + _401;
    float _405 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    bool _407 = _399 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _409 = isnan(_399);
    bool _411 = _407 || _409;
    bool _413 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _415 = _411 || _413;
    float _417 = float(_415);
    float _419 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _421 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _419;
    float _423 = _405 * _141;
    float _425 = -_417;
    float _427 = _425 + 1.0;
    bool _429 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _431 = 1.0 / _421;
    float _433 = trunc(_423);
    int _435 = int(_433);
    float _437 = _403 * _431;
    bool _439 = _399 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _441 = isnan(_399);
    bool _443 = _439 || _441;
    bool _445 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _447 = _443 || _445;
    float _449 = float(_447);
    float _451 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _453 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _451;
    float _455 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _457 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _455;
    float _459 = _449 * _427;
    float _461 = fma(_453, _437, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _463 = fma(_457, _437, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _465 = -_449;
    float _467 = _465 + 1.0;
    float _469 = _461 * _459;
    float _471 = _463 * _459;
    float _473 = fma(_467, (*spvDescriptorSet0.vp_c9)._m0[143].x, _469);
    float _475 = fma(_467, (*spvDescriptorSet0.vp_c9)._m0[143].y, _471);
    int _477 = _435 << 4;
    int _479 = _477 + 1712;
    float _481 = fma(_417, (*spvDescriptorSet0.vp_c9)._m0[144].x, _473);
    float _483 = fma(_417, (*spvDescriptorSet0.vp_c9)._m0[144].y, _475);
    bool _485 = !_429;
    float _501;
    if (!_485)
    {
        float _487 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _489 = _141 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _491 = fma(_489, (*spvDescriptorSet0.vp_c9)._m0[11].y, _121);
        float _493 = _491 * _487;
        float _495 = floor(_493);
        float _497 = -_495;
        float _499 = _493 + _497;
        _501 = _499;
        _503 = true;
    }
    else
    {
        float _505 = float(_87);
        float _507 = 1.0 / _505;
        float _509 = _121 * _507;
        _501 = _509;
    }
    _503 = false;
    float _511 = _501;
    uint _514 = uint(int(uint(_479) >> uint(2)));
    uint _516 = uint(int(uint(int(_514)) >> uint(2)));
    int _518 = int(_514) & 3;
    float _520 = (*spvDescriptorSet0.vp_c9)._m0[int(_516)][_518];
    int _522 = int(_514) + 1;
    uint _524 = uint(int(uint(_522) >> uint(2)));
    int _526 = _522 & 3;
    float _528 = (*spvDescriptorSet0.vp_c9)._m0[int(_524)][_526];
    float _530 = in.m_54.x;
    float _532 = in.m_54.y;
    float _534 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _536 = _511 + _534;
    bool _538 = _511 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _540 = isnan(_511);
    bool _542 = _538 || _540;
    bool _544 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _546 = _542 || _544;
    float _548 = float(_546);
    float _550 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _552 = _550 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _554 = _511 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _556 = isnan(_511);
    bool _558 = _554 || _556;
    bool _560 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _562 = _558 || _560;
    float _564 = float(_562);
    int _566 = _479 + 8;
    uint _568 = uint(int(uint(_566) >> uint(2)));
    uint _570 = uint(int(uint(int(_568)) >> uint(2)));
    int _572 = int(_568) & 3;
    float _574 = (*spvDescriptorSet0.vp_c9)._m0[int(_570)][_572];
    float _576 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _578 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _576;
    float _580 = -_548;
    float _582 = _580 + 1.0;
    bool _584 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _586 = 1.0 / _552;
    float _588 = _578 * _586;
    float _590 = fma(_588, _536, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _592 = _564 * _582;
    float _594 = _590 * _592;
    float _596 = -_564;
    float _598 = _596 + 1.0;
    float _600 = _483 * _532;
    float _602 = _481 * _530;
    float _604 = fma(_598, (*spvDescriptorSet0.vp_c9)._m0[115].x, _594);
    float _606 = fma(_548, (*spvDescriptorSet0.vp_c9)._m0[116].x, _604);
    float _608 = _520 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _610 = _528 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _612 = _606 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _614 = _608 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _616 = _610 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _618 = _574 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _620 = _618 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _622 = !_584;
    float _640;
    float _642;
    if (!_622)
    {
        float _624 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _626 = _141 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _628 = float(_87);
        float _630 = fma(_626, (*spvDescriptorSet0.vp_c9)._m0[11].w, _121);
        float _632 = _630 * _624;
        float _634 = floor(_632);
        float _636 = -_634;
        float _638 = _632 + _636;
        _640 = _628;
        _642 = _638;
        _644 = true;
    }
    else
    {
        float _646 = float(_87);
        float _648 = 1.0 / _646;
        float _650 = _121 * _648;
        _640 = _646;
        _642 = _650;
    }
    _644 = false;
    float _652 = _640;
    float _654 = _642;
    float _656 = _359 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _658 = _359 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _660 = _359 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _662 = fma(_121, 0.014999999664723873138427734375, _141);
    float _664 = fma(_357, (*spvDescriptorSet0.vp_c10)._m0[5].x, _656);
    float _666 = fma(_357, (*spvDescriptorSet0.vp_c10)._m0[4].x, _658);
    float _668 = fma(_357, (*spvDescriptorSet0.vp_c10)._m0[6].x, _660);
    float _670 = floor(_662);
    float _672 = fma(_365, (*spvDescriptorSet0.vp_c10)._m0[5].z, _664);
    float _674 = fma(_365, (*spvDescriptorSet0.vp_c10)._m0[4].z, _666);
    float _676 = fma(_365, (*spvDescriptorSet0.vp_c10)._m0[6].z, _668);
    float _678 = _672 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _680 = _674 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _682 = _676 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _684 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _686 = _678 + _684;
    float _688 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _690 = _680 + _688;
    float _692 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _694 = _682 + _692;
    float _696 = _686 * _686;
    float _698 = fma(_690, _690, _696);
    float _700 = fma(_694, _694, _698);
    float _702 = rsqrt(_700);
    float _704 = _686 * _702;
    float _706 = _690 * _702;
    float _708 = _694 * _702;
    float _710 = -_704;
    float _712 = fma(_710, (*spvDescriptorSet0.vp_c9)._m0[18].w, _686);
    float _714 = -_706;
    float _716 = fma(_714, (*spvDescriptorSet0.vp_c9)._m0[18].w, _690);
    float _718 = -_708;
    float _720 = fma(_718, (*spvDescriptorSet0.vp_c9)._m0[18].w, _694);
    float _722 = -_706;
    float _724 = fma(_722, (*spvDescriptorSet0.vp_c9)._m0[18].w, _680);
    float _726 = _712 * _712;
    float _728 = fma(_716, _716, _726);
    float _730 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _199);
    float _732 = fma(_720, _720, _728);
    float _734 = _600 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _736 = sqrt(_732);
    float _738 = _702 * _736;
    float _740 = _734 * _738;
    float _742 = _602 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _744 = _738 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _746 = _744 * 0.5;
    float _748 = _740 * _730;
    float _750 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _185);
    float _752 = _742 * _738;
    float _754 = fma(_670, -0.1500000059604644775390625, 1.0);
    float _756 = _748 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _758 = _752 * _750;
    float _760 = _748 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _762 = precise::max(_754, 0.20000000298023223876953125);
    float _764 = fma(_758, (*spvDescriptorSet0.vp_c10)._m0[10].x, _756);
    float _766 = fma(_758, (*spvDescriptorSet0.vp_c10)._m0[8].x, _760);
    float _768 = precise::min(_762, 1.0);
    float _770 = fma(_746, (*spvDescriptorSet0.vp_c10)._m0[10].z, _764);
    float _772 = _670 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _774 = fma(_746, (*spvDescriptorSet0.vp_c10)._m0[8].z, _766);
    float _776 = fma(_770, _768, _682);
    float _778 = fma(_774, _768, _680);
    float _780 = fma(_772, (*spvDescriptorSet0.vp_c10)._m0[10].y, _776);
    float _782 = fma(_772, (*spvDescriptorSet0.vp_c10)._m0[8].y, _778);
    float _784 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _786 = _780 + _784;
    float _788 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _790 = _782 + _788;
    float _792 = _786 * _786;
    float _794 = fma(_790, _790, _792);
    float _796 = _748 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _798 = sqrt(_794);
    float _800 = fma(_758, (*spvDescriptorSet0.vp_c10)._m0[9].x, _796);
    float _802 = fma(_746, (*spvDescriptorSet0.vp_c10)._m0[9].z, _800);
    float _804 = fma(_802, _768, _678);
    float _806 = fma(_772, (*spvDescriptorSet0.vp_c10)._m0[9].y, _804);
    bool _808 = _798 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _810 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _812 = _810 != 0;
    int _814 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _816 = _814 != 0;
    int _818 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _820 = _818 != 0;
    int _822 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _824 = _822 != 0;
    bool _826 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _828 = isnan(0.5);
    bool _830 = _826 || _828;
    bool _832 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _834 = _830 || _832;
    bool _836 = !_816;
    int _838 = _836 ? 0 : 1;
    bool _840 = !_812;
    int _842 = _840 ? 0 : 1;
    bool _844 = !_820;
    int _846 = _844 ? 0 : 1;
    bool _848 = !_824;
    int _850 = _848 ? 0 : 1;
    float _852 = _748;
    float _854 = _800;
    float _856 = _704;
    if (!_808)
    {
        _852 = _782;
    }
    float _858 = _852;
    float _860 = _858;
    if (!_808)
    {
        _373 = _780;
    }
    float _862 = _373;
    float _864 = _862;
    if (!_808)
    {
        _854 = _806;
    }
    float _866 = _854;
    bool _868 = !_808;
    float _870 = _866;
    if (!_868)
    {
        float _872 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _874 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _876 = _798 + _874;
        float _878 = rsqrt(_794);
        float _880 = _876 * _872;
        float _882 = _806 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _884 = _880 * 0.15915493667125701904296875;
        float _886 = _884 * 6.283185482025146484375;
        float _888 = cos(_886);
        float _890 = _884 * 6.283185482025146484375;
        float _892 = sin(_890);
        float _894 = _888 + (-1.0);
        float _896 = _894 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _898 = fma(_892, _882, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _900 = fma(_806, _888, _896);
        float _902 = _878 * _898;
        float _904 = fma(_790, _902, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _906 = fma(_786, _902, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _860 = _904;
        _864 = _906;
        _870 = _900;
    }
    float _908 = _860;
    float _910 = _864;
    float _912 = _870;
    float _914 = -_706;
    float _916 = fma(_914, (*spvDescriptorSet0.vp_c9)._m0[18].w, _908);
    float _918 = -_708;
    float _920 = fma(_918, (*spvDescriptorSet0.vp_c9)._m0[18].w, _910);
    float _922 = -_704;
    float _924 = fma(_922, (*spvDescriptorSet0.vp_c9)._m0[18].w, _912);
    float _926 = -_704;
    float _928 = fma(_926, (*spvDescriptorSet0.vp_c9)._m0[18].w, _678);
    float _930 = -_708;
    float _932 = fma(_930, (*spvDescriptorSet0.vp_c9)._m0[18].w, _682);
    float _934 = _924;
    float _936 = _916;
    float _938 = _920;
    float _940 = _912;
    if (_834)
    {
        _856 = _920;
    }
    float _942 = _856;
    float _944 = _942;
    if (!_834)
    {
        float _946 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _948 = _928 + _946;
        float _950 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _952 = _724 + _950;
        float _954 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _956 = -_682;
        float _958 = _956 + _910;
        float _960 = _948 * _948;
        float _962 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _964 = _932 + _962;
        float _966 = -_680;
        float _968 = _966 + _908;
        float _970 = -_678;
        float _972 = _970 + _912;
        float _974 = fma(_952, _952, _960);
        float _976 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _978 = fma(_964, _964, _974);
        float _980 = sqrt(_978);
        float _982 = 1.0 / _738;
        float _984 = _976 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _986 = precise::min(_980, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _988 = _986 * _954;
        float _990 = _988 * _982;
        float _992 = _984 * _990;
        float _994 = _958 * _990;
        float _996 = fma(_968, _992, _724);
        float _998 = fma(_972, _992, _928);
        float _1000 = fma(_984, _994, _932);
        _934 = _998;
        _936 = _996;
        _944 = _1000;
        _938 = _980;
    }
    float _1002 = _934;
    float _1004 = _936;
    float _1006 = _944;
    float _1008 = _938;
    float _1010 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1012 = _1002 + _1010;
    float _1014 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1016 = _1004 + _1014;
    float _1018 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1020 = _1006 + _1018;
    float _1022 = _1012 * _1012;
    float _1024 = fma(_1016, _1016, _1022);
    float _1026 = fma(_1020, _1020, _1024);
    float _1028 = rsqrt(_1026);
    float _1030 = sqrt(_1026);
    float _1032 = _1028 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1034 = _1016 * _1032;
    float _1036 = _1020 * _1032;
    float _1038 = _1034 * _1034;
    float _1040 = _1036 * _1036;
    float _1042 = _1038 + _1040;
    float _1044 = sqrt(_1042);
    bool _1046 = _1044 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1048 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1050 = _1044 + _1048;
    float _1052 = _1024;
    float _1054 = _1042;
    float _1056 = _1050;
    float _1058 = _1012;
    float _1060 = _1008;
    if (_1046)
    {
        float _1062 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1052 = _1062;
    }
    float _1064 = _1052;
    if (_1046)
    {
        float _1066 = rsqrt(_1042);
        _1054 = _1066;
    }
    float _1068 = _1054;
    float _1070 = _1064;
    if (_1046)
    {
        float _1072 = _1050 * _1064;
        _1056 = _1072;
    }
    float _1074 = _1056;
    if (_1046)
    {
        float _1076 = _1074 * 0.15915493667125701904296875;
        _940 = _1076;
    }
    float _1078 = _940;
    float _1080 = _1028;
    if (_1046)
    {
        float _1082 = _1078 * 6.283185482025146484375;
        float _1084 = cos(_1082);
        _1080 = _1084;
    }
    float _1086 = _1080;
    float _1088 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1090 = precise::max(0.0, _1088);
    float _1092 = _1020;
    float _1094 = _1090;
    if (_1046)
    {
        float _1096 = _1078 * 6.283185482025146484375;
        float _1098 = sin(_1096);
        _1092 = _1098;
    }
    float _1100 = _1092;
    float _1102 = -_1032;
    float _1104 = -_1090;
    float _1106 = fma(_1012, _1102, _1104);
    if (!_1046)
    {
        _1094 = _1034;
    }
    float _1108 = _1094;
    float _1110 = _1108;
    if (_1046)
    {
        float _1112 = _1106 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1058 = _1112;
    }
    float _1114 = _1058;
    float _1116 = _1114;
    float _1118 = _1086;
    if (_1046)
    {
        float _1120 = _1086 + (-1.0);
        _1060 = _1120;
    }
    float _1122 = _1060;
    float _1124 = _1002 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1126 = _1122;
    if (_1046)
    {
        float _1128 = _1122 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1070 = _1128;
    }
    float _1130 = _1070;
    float _1132 = fma(_1004, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1124);
    float _1134 = _1100;
    float _1136 = _1130;
    if (_1046)
    {
        float _1138 = fma(_1100, _1114, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1116 = _1138;
    }
    float _1140 = _1116;
    float _1142 = _1140;
    if (!_1046)
    {
        _1134 = _1106;
    }
    float _1144 = _1134;
    float _1146 = _1144;
    if (_1046)
    {
        float _1148 = fma(_1106, _1086, _1130);
        _1146 = _1148;
    }
    float _1150 = _1146;
    if (!_1046)
    {
        _1136 = _1038;
    }
    float _1152 = _1136;
    float _1154 = _1152;
    if (_1046)
    {
        float _1156 = _1068 * _1140;
        _1126 = _1156;
    }
    float _1158 = _1126;
    if (!_1046)
    {
        _1142 = _1036;
    }
    float _1160 = _1142;
    float _1162 = _1002 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1164 = _1160;
    if (!_1046)
    {
        _1118 = _1040;
    }
    float _1166 = _1118;
    float _1168 = _1166;
    if (_1046)
    {
        float _1170 = _1034 * _1158;
        _1110 = _1170;
    }
    float _1172 = _1110;
    if (_1046)
    {
        float _1174 = _1036 * _1158;
        _1164 = _1174;
    }
    float _1176 = _1164;
    float _1178 = _1002 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1180 = fma(_1004, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1162);
    if (_1046)
    {
        float _1182 = _1172 * _1172;
        _1154 = _1182;
    }
    float _1184 = _1154;
    if (_1046)
    {
        float _1186 = _1176 * _1176;
        _1168 = _1186;
    }
    float _1188 = _1168;
    float _1190 = fma(_1004, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1178);
    float _1192 = fma(_1006, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1180);
    float _1194 = fma(_1150, _1150, _1184);
    float _1196 = _1002 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1198 = fma(_1006, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1190);
    float _1200 = _1194 + _1188;
    float _1202 = _1192 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1204 = fma(_1004, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1196);
    float _1206 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1208 = fma(_1006, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1132);
    float _1210 = _1198 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1212 = rsqrt(_1200);
    float _1214 = _1202 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1216 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1218 = fma(_1030, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1216);
    float _1220 = precise::clamp(_1218, 0.0, 1.0);
    float _1222 = fma(_1006, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1204);
    float _1224 = _1208 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1226 = fma(_1210, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1214);
    float _1228 = -_1220;
    float _1230 = _1228 + 1.0;
    float _1232 = _1222 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1234 = _1224 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1236 = fma(_1224, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1226);
    float _1238 = abs(_1230);
    float _1240 = log2(_1238);
    float _1242 = -_1234;
    float _1244 = fma(_1242, _1206, 1.0);
    float _1246 = _1212 * _1172;
    float _1248 = fma(_1232, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1236);
    float _1250 = _1212 * _1150;
    float _1252 = _1212 * _1176;
    float _1254 = _1246 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1256 = log2(_1244);
    float _1258 = _1202 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1260 = -_1254;
    float _1262 = fma(_1250, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1260);
    float _1264 = _1240 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1266 = fma(_1210, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1258);
    float _1268 = -_1252;
    float _1270 = fma(_1268, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1262);
    float _1272 = 1.0 / _1248;
    float _1274 = _1202 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1276 = _1250 + 1.0;
    float _1278 = fma(_1270, -0.5, 0.5);
    float _1280 = fma(_1270, 0.5, 0.5);
    float _1282 = fma(_1210, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1274);
    float _1284 = fma(_1224, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1266);
    float _1286 = exp2(_1264);
    float _1288 = fma(_1280, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1290 = fma(_1224, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1282);
    float _1292 = fma(_1232, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1284);
    float _1294 = _1256 * 0.693147182464599609375;
    float _1296 = fma(_1280, _1288, -0.212114393711090087890625);
    float _1298 = fma(_1232, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1290);
    float _1300 = sqrt(_1278);
    float _1302 = fma(_1280, _1296, 1.570728778839111328125);
    float _1304 = _1298 * _1272;
    float _1306 = _1292 * _1272;
    float _1308 = _1294 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1310 = fma(_1304, 0.5, 0.5);
    float _1312 = fma(_1306, -0.5, 0.5);
    float _1314 = -_1250;
    float _1316 = fma(_1286, _1276, _1314);
    float _1318 = fma(_1316, 0.5, 0.5);
    float _1320 = _1300 * 0.636619746685028076171875;
    float _1322 = -_1302;
    float _1324 = fma(_1320, _1322, 1.0);
    float3 _4251 = float3(_1310, _1312, _1308);
    float _1326 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4251, float3(0.0), isnan(_4251)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4251, float3(0.0), isnan(_4251)), level(0.0)).x;
    float3 _4262 = float3(_1310, _1312, _1308);
    float4 _1329 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4262, float3(0.0), isnan(_4262)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4262, float3(0.0), isnan(_4262)), level(0.0)).xyzw;
    float _1331 = _1329.x;
    float _1333 = _1329.y;
    float _1335 = _1329.z;
    float _1337 = _1329.w;
    float2 _4279 = float2(_1324, _1318);
    float3 _1341 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4279, float2(0.0), isnan(_4279)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4279, float2(0.0), isnan(_4279)), level(0.0)).xyz;
    float _1343 = _1341.x;
    float _1345 = _1341.y;
    float _1347 = _1341.z;
    float _1349 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _1351 = int(_1349);
    int _1353 = abs(_838);
    out.m_56.x = _614;
    out.m_56.y = _616;
    out.m_56.z = _620;
    out.m_56.w = _612;
    bool _1355 = _141 > 0.5;
    float _1357 = _1202 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_58.y = _1002;
    float _1359 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1361 = int(_1359);
    float _1363 = fma(_1210, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1357);
    float _1365 = in.m_49.y;
    float _1367 = fma(_1224, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1363);
    float _1369 = float(_1351);
    float _1371 = fma(_1232, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1367);
    float _1373 = 1.0 / _1369;
    float _1375 = float(uint(_1361));
    int _1377 = ~_1361;
    int _1379 = _1377 + 1;
    float _1381 = 1.0 / _1375;
    int _1383 = ~_1361;
    int _1385 = _1383 + 1;
    int _1387 = ~_1361;
    int _1389 = _1387 + 1;
    int _1391 = ~_1361;
    int _1393 = _1391 + 1;
    float _1395 = _1365 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1397 = _121 * _1373;
    float _1399 = float(_1361);
    float _1401 = trunc(_1397);
    int _1403 = int(_1401);
    int _1405 = as_type<int>(_1381) + (-2);
    float _1407 = float(uint(_1403));
    float _1409 = as_type<float>(_1405) * _1407;
    float _1411 = trunc(_1409);
    float _1413 = precise::max(_1411, 0.0);
    uint _1415 = uint(_1413);
    int _1417 = _1385 * int(_1415);
    int _1419 = _1417 + _1403;
    float _1421 = float(uint(_1419));
    float _1423 = as_type<float>(_1405) * _1421;
    int _1425 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1427 = _1425 != 0;
    bool _1429 = !_1427;
    float _1431 = _1429 ? _1365 : _141;
    float _1433 = trunc(_1423);
    float _1435 = precise::max(_1433, 0.0);
    uint _1437 = uint(_1435);
    bool _1439 = !_1427;
    float _1441 = _1439 ? 1.2345600128173828125 : 1.0;
    float _1443 = float(_1403);
    float _1445 = _1441 * _1431;
    bool _1447 = _1443 >= _1399;
    bool _1449 = isnan(_1443);
    bool _1451 = _1447 || _1449;
    bool _1453 = isnan(_1399);
    bool _1455 = _1451 || _1453;
    float _1457 = float(_1455);
    float _1459 = floor(_1445);
    int _1461 = int(_1415) + int(_1437);
    float _1463 = 1.0 / _652;
    int _1465 = _1379 * _1461;
    int _1467 = _1465 + _1403;
    bool _1469 = uint(_1467) >= uint(_1361);
    float _1471 = trunc(_1457);
    int _1473 = int(_1471);
    float _1475 = -_1459;
    float _1477 = _1445 + _1475;
    float _1479 = _121 * _1399;
    bool _1481 = !_1469;
    int _1483 = _1481 ? 0 : (-1);
    float _1485 = _1477 * _1399;
    bool _1487 = _1361 == 0;
    float _1489 = _1479 * _1463;
    int _1491 = ~_1461;
    int _1493 = _1491 + _1483;
    int _1495 = _1493 + 1;
    float _1497 = trunc(_1485);
    int _1499 = int(_1497);
    int _1501 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1503 = _1501 != 0;
    int _1505 = _1361 + (-1);
    int _1507 = _1361 * _1495;
    int _1509 = _1507 + _1403;
    bool _1511 = !_1503;
    int _1513 = _1511 ? 0 : 1;
    int _1515 = ~_1473;
    int _1517 = _1515 + 1;
    int _1519 = _1517 + 1;
    float _1521 = trunc(_1489);
    int _1523 = int(_1521);
    bool _1525 = !_1487;
    int _1527 = _1525 ? _1509 : (-1);
    int _1529 = abs(_1513);
    bool _1531 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1533 = isnan(0.5);
    bool _1535 = _1531 || _1533;
    bool _1537 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1539 = _1535 || _1537;
    int _1541 = _1527 * _1519;
    int _1543 = abs(_842);
    int _1545 = _1473 * _1505;
    int _1547 = _1545 + _1541;
    float _1549 = in.m_49.w;
    int _1551 = abs(_846);
    int _1553 = _1499 * _1529;
    int _1555 = _1553 + _1403;
    int _1557 = _1547 * _1353;
    int _1559 = abs(_850);
    float _1561 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _1563 = _1523 * _1543;
    int _1565 = _1563 + _1557;
    float _1567 = in.m_49.z;
    int _1569 = _1555 * _1551;
    int _1571 = _1569 + _1565;
    float _1573 = _141 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _1575 = _1499 * _1559;
    int _1577 = _1575 + _1571;
    float _1579 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1581 = _1579 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1583 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1585 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1587 = float(uint(_1577));
    float _1589 = -_1583;
    float _1591 = fma(_1573, 2.0, _1589);
    float _1593 = 1.0 / _1581;
    bool _1595 = _1549 > 0.5;
    float _1597 = fma(_1395, -2.0, _1585);
    float _1599 = as_type<float>(_1405) * _1587;
    float _1601 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1603 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1601;
    int _1605 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1607 = _1605 != 0;
    float _1609 = trunc(_1599);
    float _1611 = precise::max(_1609, 0.0);
    uint _1613 = uint(_1611);
    float _1615 = -_185;
    int _1617 = _1355 ? as_type<int>(_1615) : as_type<int>(_185);
    float _1619 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _1621 = _1567 > 0.5;
    int _1623 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1625 = _1623 != 0;
    float _1627 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1629 = -_185;
    int _1631 = _1621 ? as_type<int>(_1629) : as_type<int>(_185);
    float _1633 = _1603 * _1593;
    bool _1635 = !_1607;
    float _1637 = _1635 ? _185 : as_type<float>(_1617);
    float _1639 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1619);
    float _1641 = _1593;
    float _1643 = _1567;
    if (!_1427)
    {
        _1641 = _1365;
    }
    float _1645 = _1641;
    float _1647 = -_121;
    float _1649 = fma(_1647, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1591);
    bool _1651 = _1365 > 0.5;
    int _1653 = _1389 * int(_1613);
    int _1655 = _1653 + _1577;
    bool _1657 = !_1625;
    float _1659 = _1657 ? _185 : as_type<float>(_1631);
    float _1661 = _1637 + 0.5;
    float _1663 = _1645;
    if (_1427)
    {
        _1663 = _141;
    }
    float _1665 = _1663;
    float _1667 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1669 = float(uint(_1655));
    if (!_1427)
    {
        _209 = _1567;
    }
    float _1671 = _209;
    float _1673 = fma(_1365, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1667);
    float _1675 = _1671;
    if (_1427)
    {
        _1643 = _1365;
    }
    float _1677 = _1643;
    float _1679 = as_type<float>(_1405) * _1669;
    if (_1427)
    {
        _1675 = _1365;
    }
    float _1681 = _1675;
    float _1683 = _1627 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1685 = trunc(_1679);
    float _1687 = precise::max(_1685, 0.0);
    uint _1689 = uint(_1687);
    int _1691 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1693 = _1691 != 0;
    float _1695 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1697 = _654 + _1695;
    int _1699 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1701 = _1699 != 0;
    float _1703 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1705 = -_199;
    int _1707 = _1595 ? as_type<int>(_1705) : as_type<int>(_199);
    float _1709 = _1665 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1711 = float(uint(_1555));
    float _1713 = _1677 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1715 = -_199;
    int _1717 = _1651 ? as_type<int>(_1715) : as_type<int>(_199);
    bool _1719 = !_1693;
    float _1721 = _1719 ? _199 : as_type<float>(_1717);
    bool _1723 = !_1701;
    float _1725 = _1723 ? _199 : as_type<float>(_1707);
    float _1727 = fma(_1683, _1661, _1649);
    float _1729 = fma(_1633, _1697, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1731 = fma(_1681, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1703);
    bool _1733 = _654 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1735 = isnan(_654);
    bool _1737 = _1733 || _1735;
    bool _1739 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1741 = _1737 || _1739;
    float _1743 = float(_1741);
    float _1745 = _1721 + (-0.5);
    int _1747 = int(_1613) + int(_1689);
    float _1749 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1731);
    bool _1751 = _654 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1753 = isnan(_654);
    bool _1755 = _1751 || _1753;
    bool _1757 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1759 = _1755 || _1757;
    float _1761 = float(_1759);
    float _1763 = _1561 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1765 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1767 = as_type<float>(_1405) * _1711;
    float _1769 = -_1743;
    float _1771 = _1769 + 1.0;
    float _1773 = -_1749;
    float _1775 = _1773 + 1.0;
    float _1777 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1779 = _1761 * _1771;
    float _1781 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1597);
    float _1783 = trunc(_1767);
    float _1785 = precise::max(_1783, 0.0);
    uint _1787 = uint(_1785);
    float _1789 = fma(_1665, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1777);
    int _1791 = _1393 * _1747;
    int _1793 = _1791 + _1577;
    float _1795 = -_1763;
    float _1797 = -_1781;
    float _1799 = fma(_1795, _1745, _1797);
    float _1801 = _1729 * _1779;
    float _1803 = -_1765;
    float _1805 = fma(_1709, 2.0, _1803);
    bool _1807 = uint(_1793) >= uint(_1361);
    float _1809 = _928 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    int _1811 = ~_1361;
    int _1813 = _1811 + 1;
    float _1815 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    bool _1817 = !_1807;
    int _1819 = _1817 ? 0 : (-1);
    float _1821 = fma(_724, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1809);
    float _1823 = _928 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1825 = fma(_1713, -2.0, _1815);
    int _1827 = ~_1747;
    int _1829 = _1827 + _1819;
    int _1831 = _1829 + 1;
    int _1833 = _1813 * int(_1787);
    int _1835 = _1833 + _1555;
    float _1837 = fma(_932, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1821);
    float _1839 = fma(_724, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1823);
    float _1841 = -_1761;
    float _1843 = _1841 + 1.0;
    int _1845 = _1361 * _1831;
    int _1847 = _1845 + _1577;
    float _1849 = float(uint(_1835));
    float _1851 = fma(_932, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1839);
    float _1853 = _1837 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1855 = fma(_1843, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1801);
    bool _1857 = !_1487;
    int _1859 = _1857 ? _1847 : (-1);
    float _1861 = as_type<float>(_1405) * _1849;
    float _1863 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1673);
    float _1865 = 1.0 / _1853;
    int _1867 = _1859 >> 31;
    float _1869 = _1851 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1871 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1639);
    float _1873 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1789);
    int _1875 = _1867 & 3;
    float _1877 = -_121;
    float _1879 = fma(_1877, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1805);
    float _1881 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1825);
    float _1883 = trunc(_1861);
    float _1885 = precise::max(_1883, 0.0);
    uint _1887 = uint(_1885);
    int _1889 = _1859 + _1875;
    float _1891 = _1725 + (-0.5);
    float _1893 = _1869 + _1853;
    float _1895 = -_1863;
    float _1897 = _1895 + 1.0;
    int _1899 = _1889 >> 2;
    float _1901 = -_1891;
    float _1903 = -_1881;
    float _1905 = fma(_1901, (*spvDescriptorSet0.vp_c9)._m0[85].y, _1903);
    int _1907 = _1859 & 3;
    bool _1909 = _1907 != 0;
    float _1911 = _1893 * _1865;
    float _1913 = _1911 * 0.5;
    int _1915 = _1899 << 4;
    int _1917 = _1915 + 512;
    float _1919 = -_1871;
    float _1921 = _1919 + 1.0;
    float _1923 = fma(_1721, _1897, _1799);
    int _1925 = _1859 & 3;
    bool _1927 = _1925 != 0;
    float _1929 = _1659 + 0.5;
    float _1931 = -_1921;
    float _1933 = fma(_1637, _1931, _1727);
    int _1935 = ~_1361;
    int _1937 = _1935 + 1;
    int _1939 = _1917 + 8;
    uint _1941 = uint(int(uint(_1939) >> uint(2)));
    uint _1943 = uint(int(uint(int(_1941)) >> uint(2)));
    int _1945 = int(_1941) & 3;
    float _1947 = (*spvDescriptorSet0.vp_c9)._m0[int(_1943)][_1945];
    int _1949 = int(_1941) + 1;
    uint _1951 = uint(int(uint(_1949) >> uint(2)));
    int _1953 = _1949 & 3;
    float _1955 = (*spvDescriptorSet0.vp_c9)._m0[int(_1951)][_1953];
    int _1957 = int(_1787) + int(_1887);
    float _1959 = fma(_1725, _1775, _1905);
    bool _1961 = uint(_1925) > 1u;
    float _1963 = fma(_1929, (*spvDescriptorSet0.vp_c9)._m0[85].x, _1879);
    int _1965 = _1909 ? 0 : 1;
    int _1967 = _1937 * _1957;
    int _1969 = _1967 + _1555;
    float _1971 = -_1873;
    float _1973 = _1971 + 1.0;
    uint _1975 = uint(int(uint(_1917) >> uint(2)));
    uint _1977 = uint(int(uint(int(_1975)) >> uint(2)));
    int _1979 = int(_1975) & 3;
    float _1981 = (*spvDescriptorSet0.vp_c9)._m0[int(_1977)][_1979];
    int _1983 = int(_1975) + 1;
    uint _1985 = uint(int(uint(_1983) >> uint(2)));
    int _1987 = _1983 & 3;
    float _1989 = (*spvDescriptorSet0.vp_c9)._m0[int(_1985)][_1987];
    float _1991 = _1929;
    float _1993 = _1913;
    float _1995 = _1761;
    float _1997 = _1799;
    float _1999 = _1743;
    if (!_1539)
    {
        _1991 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    }
    float _2001 = _1991;
    float _2003 = fma(_1743, (*spvDescriptorSet0.vp_c9)._m0[132].x, _1855);
    int _2005 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _2007 = _2005 != 0;
    float _2009 = -_1973;
    float _2011 = fma(_1659, _2009, _1963);
    bool _2013 = uint(_1969) >= uint(_1361);
    if (!_1539)
    {
        float _2015 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _2017 = fma(_1913, _2001, _2015);
        _1993 = _2017;
    }
    float _2019 = _1993;
    if (!_1539)
    {
        _1995 = (*spvDescriptorSet0.vp_c9)._m0[140].z;
    }
    float _2021 = _1995;
    float _2023 = _2003 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    int _2025 = ~_1965;
    int _2027 = _2025 + 1;
    int _2029 = _2027 + 1;
    out.m_60.x = _1933;
    out.m_60.y = _1923;
    out.m_60.z = _2011;
    out.m_60.w = _1959;
    int _2031 = _2029;
    if (!_1961)
    {
        int _2033 = ~_1965;
        int _2035 = _2033 + 1;
        _2031 = _2035;
    }
    int _2037 = _2031;
    if (!_1539)
    {
        float _2039 = -_2021;
        float _2041 = _2039 + (*spvDescriptorSet0.vp_c9)._m0[140].w;
        _1997 = _2041;
    }
    float _2043 = _1997;
    bool _2045 = _1925 != 3;
    float _2047 = _2019;
    if (!_1539)
    {
        float _2049 = 1.0 / _2019;
        _2047 = _2049;
    }
    float _2051 = _2047;
    bool _2053 = !_2013;
    int _2055 = _2053 ? 0 : (-1);
    out.m_62.w = _2023;
    bool _2057 = !_1927;
    int _2059 = _2057 ? 0 : 1;
    int _2061 = abs(_2037);
    bool _2063 = uint(_1925) >= 2u;
    float _2065 = _2001;
    if (!_1539)
    {
        float _2067 = 1.0 / _2043;
        _2065 = _2067;
    }
    float _2069 = _2065;
    int _2071 = ~_1957;
    int _2073 = _2071 + _2055;
    int _2075 = _2073 + 1;
    int _2077 = abs(_2059);
    int _2079 = _1361 * _2075;
    int _2081 = _2079 + _1555;
    float _2083 = _1240 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _2085 = _1925 != 3;
    if (!_1539)
    {
        float _2087 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2089 = -_2021;
        float _2091 = fma(_2051, _2087, _2089);
        _1999 = _2091;
    }
    float _2093 = _1999;
    int _2095 = _2063 ? 0 : 1;
    int _2097 = ~_2061;
    int _2099 = _2097 + 1;
    int _2101 = _2099 + 1;
    float _2103 = exp2(_2083);
    int _2105 = ~_2095;
    int _2107 = _2105 + 1;
    int _2109 = _2107 + 1;
    int _2111 = _2109;
    float _2113 = _2093;
    if (_2045)
    {
        int _2115 = ~_2095;
        int _2117 = _2115 + 1;
        _2111 = _2117;
    }
    int _2119 = _2111;
    if (!_1539)
    {
        float _2121 = _2093 * _2069;
        float _2123 = precise::clamp(_2121, 0.0, 1.0);
        _2113 = _2123;
    }
    float _2125 = _2113;
    int _2127 = ~_2077;
    int _2129 = _2127 + 1;
    int _2131 = _2129 + 1;
    int _2133 = abs(_2119);
    bool _2135 = !_2085;
    float _2137 = _2135 ? 0.0 : as_type<float>(0xffffffffu /* nan */);
    int _2139 = _2101 * as_type<int>(_1989);
    int _2141 = abs(as_type<int>(_2137));
    float _2143 = _2137;
    if (_1539)
    {
        _2143 = 1.0;
    }
    float _2145 = _2143;
    int _2147 = _2131 * as_type<int>(_1981);
    int _2149 = _2147 + _2139;
    bool _2151 = !_2007;
    int _2153 = _2151 ? 0 : 1;
    float _2155 = _2145;
    if (!_1539)
    {
        float _2157 = -_2125;
        float _2159 = _2157 + 1.0;
        _2155 = _2159;
    }
    float _2161 = _2155;
    int _2163 = ~_2133;
    int _2165 = _2163 + 1;
    int _2167 = _2165 + 1;
    float _2169 = -_2103;
    float _2171 = _2169 + 1.0;
    int _2173 = abs(_2153);
    float _2175 = _2161 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    int _2177 = _2167 * as_type<int>(_1947);
    int _2179 = _2177 + _2149;
    int _2181 = ~_2173;
    int _2183 = _2181 + 1;
    int _2185 = _2183 + 1;
    float _2187 = _2171 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    int _2189 = ~_2141;
    int _2191 = _2189 + 1;
    int _2193 = _2191 + 1;
    float _2195 = _369 * _2175;
    float _2197 = _2187 * _1326;
    float _2199 = -_2187;
    float _2201 = _2199 + 1.0;
    int _2203 = _2193 * as_type<int>(_1955);
    int _2205 = _2203 + _2179;
    bool _2207 = !_1487;
    int _2209 = _2207 ? _2081 : (-1);
    float _2211 = _2195 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    bool _2213 = _2161 > 0.0;
    bool _2215 = isnan(_2161);
    bool _2217 = _2213 || _2215;
    bool _2219 = isnan(0.0);
    bool _2221 = _2217 || _2219;
    int _2223 = _2205 * _2185;
    float _2225 = -(*spvDescriptorSet0.vp_c8)._m0[31].z;
    float _2227 = _1371 + _2225;
    float _2229 = _1337 * _2197;
    float _2231 = _1347 * _2197;
    int _2233 = _2209 * _2173;
    int _2235 = _2233 + _2223;
    float _2237 = _1248 + _2227;
    out.gl_Position.x = _1298;
    out.gl_Position.y = _1292;
    out.gl_Position.z = _2227;
    out.gl_Position.w = _1248;
    float _2239 = fma(_1343, _2229, _1331);
    float _2241 = _2237 * 0.5;
    float _2243 = float(_2235);
    float _2245 = fma(_1345, _2229, _1333);
    float _2247 = _1337 * _2201;
    float _2249 = fma(_1337, _2231, _1335);
    out.m_64.z = _2241;
    out.m_64.w = _1248;
    out.m_66.y = _2243;
    out.m_45.x = _2211;
    out.m_68.x = _2239;
    out.m_68.y = _2245;
    out.m_68.z = _2249;
    out.m_68.w = _2247;
    if (_2221)
    {
        return out;
    }
    out.m_45.x = 0.0;
    float _2251 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2251;
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
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    bool _644 = false;
    bool _503 = false;
    bool _391 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _82 = in.m_42.w;
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
        out.m_45.x = 0.0;
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
        float _2308 = as_type<float>(_103);
        out.gl_Position.z = _2308;
    }
    if (!_91)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _107 = in.m_47.w;
    bool _109 = _107 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _111 = isnan(_107);
    bool _113 = _109 || _111;
    bool _115 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _117 = _113 || _115;
    float _119 = -_107;
    float _121 = _119 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _123 = 0.0;
    if (_117)
    {
        float _125 = float(_87);
        _123 = _125;
    }
    float _127 = _123;
    bool _129 = _121 >= _127;
    bool _131 = !_117;
    bool _133 = _129 || _131;
    if (_133)
    {
        _97 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _135 = _97;
    if (_133)
    {
        out.m_45.x = 0.0;
    }
    if (_133)
    {
        float _137 = _135 * 5.0;
        _105 = as_type<int>(_137);
    }
    int _139 = _105;
    if (_133)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2376 = as_type<float>(_139);
        out.gl_Position.z = _2376;
    }
    if (_133)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _141 = in.m_49.x;
    float _143 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _145 = _121 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _147 = as_type<float>(int(gl_VertexIndex));
    bool _149 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _151 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _153 = _149 || _151;
    bool _155 = isnan(1.0);
    bool _157 = _153 || _155;
    float _159 = in.m_47.x;
    float _161 = in.m_47.y;
    float _163 = in.m_47.z;
    float _165 = _145 * _143;
    float _167 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[20].x, _165);
    float _169 = _167 * 6.283185482025146484375;
    float _171 = floor(_167);
    int _173 = as_type<int>(_147) & 1;
    bool _175 = _173 != 0;
    int _177 = as_type<int>(_147) & 2;
    bool _179 = _177 != 0;
    float _181 = _169 * 0.15915493667125701904296875;
    bool _183 = !_175;
    float _185 = _183 ? (-0.5) : 0.5;
    int _187 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _189 = _187 != 0;
    float _191 = _181 * 6.283185482025146484375;
    float _193 = cos(_191);
    float _195 = _121 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _197 = !_179;
    float _199 = _197 ? (-0.5) : 0.5;
    float _201 = -_171;
    float _203 = _167 + _201;
    float _205 = _167;
    float _207 = _195;
    float _209 = _185;
    if (!_157)
    {
        float _211 = _195 * _195;
        float _213 = _211 * 0.5;
        _205 = _213;
    }
    float _215 = _205;
    float _217 = _215;
    if (!_157)
    {
        float _219 = _215 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _217 = _219;
    }
    float _221 = _217;
    bool _223 = !_157;
    float _225 = _221;
    if (!_223)
    {
        float _227 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _229 = log2(_227);
        float _231 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _233 = _231 + 1.0;
        float _235 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _237 = _195 * _229;
        float _239 = 1.0 / _233;
        float _241 = _235 * 0.693147182464599609375;
        float _243 = exp2(_237);
        float _245 = 1.0 / _241;
        float _247 = _243 + (-1.0);
        float _249 = -_247;
        float _251 = fma(_249, _245, _195);
        float _253 = _251 * _239;
        float _255 = _253 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _225 = _255;
    }
    float _257 = _225;
    bool _259 = !_157;
    if (!_259)
    {
        float _261 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _263 = log2(_261);
        float _265 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _267 = _265 + 1.0;
        float _269 = 1.0 / _267;
        float _271 = _195 * _263;
        float _273 = exp2(_271);
        float _275 = -_273;
        float _277 = _275 + 1.0;
        float _279 = _277 * _269;
        _207 = _279;
    }
    float _281 = _207;
    float _283 = in.m_54.w;
    int _285 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _287 = _285 != 0;
    int _289 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _291 = _289 != 0;
    float _293 = in.m_42.x;
    float _295 = in.m_42.y;
    float _297 = in.m_42.z;
    bool _299 = _203 < 0.5;
    float _301 = float(_299);
    float _303 = -_203;
    float _305 = fma(_303, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _307 = fma(_193, 0.5, 0.5);
    bool _309 = !_287;
    int _311 = _309 ? 0 : 1;
    float _313 = _257 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    bool _315 = !_189;
    int _317 = _315 ? 0 : 1;
    float _319 = -_301;
    float _321 = fma(_319, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _323 = abs(_311);
    float _325 = -_307;
    float _327 = fma(_325, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _329 = abs(_317);
    float _331 = fma(_281, _159, _313);
    bool _333 = !_291;
    int _335 = _333 ? 0 : 1;
    float _337 = _257 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _339 = _257 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    bool _341 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _343 = fma(_281, _161, _337);
    int _345 = abs(_335);
    float _347 = fma(_281, _163, _339);
    float _349 = float(_323);
    float _351 = float(_329);
    float _353 = abs(_305);
    float _355 = _349 * _353;
    float _357 = fma(_331, _283, _293);
    float _359 = fma(_343, _283, _295);
    float _361 = float(_345);
    float _363 = fma(_351, _327, _355);
    float _365 = fma(_347, _283, _297);
    float _367 = abs(_321);
    float _369 = fma(_361, _367, _363);
    bool _371 = !_341;
    float _373 = (*spvDescriptorSet0.vp_c9)._m0[7].x;
    float _389;
    if (!_371)
    {
        float _375 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _377 = _141 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _379 = fma(_377, (*spvDescriptorSet0.vp_c9)._m0[12].x, _121);
        float _381 = _379 * _375;
        float _383 = floor(_381);
        float _385 = -_383;
        float _387 = _381 + _385;
        _389 = _387;
        _391 = true;
    }
    else
    {
        float _393 = float(_87);
        float _395 = 1.0 / _393;
        float _397 = _121 * _395;
        _389 = _397;
    }
    _391 = false;
    float _399 = _389;
    float _401 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _403 = _399 + _401;
    float _405 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    bool _407 = _399 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _409 = isnan(_399);
    bool _411 = _407 || _409;
    bool _413 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _415 = _411 || _413;
    float _417 = float(_415);
    float _419 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _421 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _419;
    float _423 = _405 * _141;
    float _425 = -_417;
    float _427 = _425 + 1.0;
    bool _429 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _431 = 1.0 / _421;
    float _433 = trunc(_423);
    int _435 = int(_433);
    float _437 = _403 * _431;
    bool _439 = _399 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _441 = isnan(_399);
    bool _443 = _439 || _441;
    bool _445 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _447 = _443 || _445;
    float _449 = float(_447);
    float _451 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _453 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _451;
    float _455 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _457 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _455;
    float _459 = _449 * _427;
    float _461 = fma(_453, _437, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _463 = fma(_457, _437, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _465 = -_449;
    float _467 = _465 + 1.0;
    float _469 = _461 * _459;
    float _471 = _463 * _459;
    float _473 = fma(_467, (*spvDescriptorSet0.vp_c9)._m0[143].x, _469);
    float _475 = fma(_467, (*spvDescriptorSet0.vp_c9)._m0[143].y, _471);
    int _477 = _435 << 4;
    int _479 = _477 + 1712;
    float _481 = fma(_417, (*spvDescriptorSet0.vp_c9)._m0[144].x, _473);
    float _483 = fma(_417, (*spvDescriptorSet0.vp_c9)._m0[144].y, _475);
    bool _485 = !_429;
    float _501;
    if (!_485)
    {
        float _487 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _489 = _141 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _491 = fma(_489, (*spvDescriptorSet0.vp_c9)._m0[11].y, _121);
        float _493 = _491 * _487;
        float _495 = floor(_493);
        float _497 = -_495;
        float _499 = _493 + _497;
        _501 = _499;
        _503 = true;
    }
    else
    {
        float _505 = float(_87);
        float _507 = 1.0 / _505;
        float _509 = _121 * _507;
        _501 = _509;
    }
    _503 = false;
    float _511 = _501;
    uint _514 = uint(int(uint(_479) >> uint(2)));
    uint _516 = uint(int(uint(int(_514)) >> uint(2)));
    int _518 = int(_514) & 3;
    float _520 = (*spvDescriptorSet0.vp_c9)._m0[int(_516)][_518];
    int _522 = int(_514) + 1;
    uint _524 = uint(int(uint(_522) >> uint(2)));
    int _526 = _522 & 3;
    float _528 = (*spvDescriptorSet0.vp_c9)._m0[int(_524)][_526];
    float _530 = in.m_54.x;
    float _532 = in.m_54.y;
    float _534 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _536 = _511 + _534;
    bool _538 = _511 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _540 = isnan(_511);
    bool _542 = _538 || _540;
    bool _544 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _546 = _542 || _544;
    float _548 = float(_546);
    float _550 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _552 = _550 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _554 = _511 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _556 = isnan(_511);
    bool _558 = _554 || _556;
    bool _560 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _562 = _558 || _560;
    float _564 = float(_562);
    int _566 = _479 + 8;
    uint _568 = uint(int(uint(_566) >> uint(2)));
    uint _570 = uint(int(uint(int(_568)) >> uint(2)));
    int _572 = int(_568) & 3;
    float _574 = (*spvDescriptorSet0.vp_c9)._m0[int(_570)][_572];
    float _576 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _578 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _576;
    float _580 = -_548;
    float _582 = _580 + 1.0;
    bool _584 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _586 = 1.0 / _552;
    float _588 = _578 * _586;
    float _590 = fma(_588, _536, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _592 = _564 * _582;
    float _594 = _590 * _592;
    float _596 = -_564;
    float _598 = _596 + 1.0;
    float _600 = _483 * _532;
    float _602 = _481 * _530;
    float _604 = fma(_598, (*spvDescriptorSet0.vp_c9)._m0[115].x, _594);
    float _606 = fma(_548, (*spvDescriptorSet0.vp_c9)._m0[116].x, _604);
    float _608 = _520 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _610 = _528 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _612 = _606 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _614 = _608 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _616 = _610 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _618 = _574 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _620 = _618 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _622 = !_584;
    float _640;
    float _642;
    if (!_622)
    {
        float _624 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _626 = _141 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _628 = float(_87);
        float _630 = fma(_626, (*spvDescriptorSet0.vp_c9)._m0[11].w, _121);
        float _632 = _630 * _624;
        float _634 = floor(_632);
        float _636 = -_634;
        float _638 = _632 + _636;
        _640 = _628;
        _642 = _638;
        _644 = true;
    }
    else
    {
        float _646 = float(_87);
        float _648 = 1.0 / _646;
        float _650 = _121 * _648;
        _640 = _646;
        _642 = _650;
    }
    _644 = false;
    float _652 = _640;
    float _654 = _642;
    float _656 = _359 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _658 = _359 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _660 = _359 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _662 = fma(_121, 0.014999999664723873138427734375, _141);
    float _664 = fma(_357, (*spvDescriptorSet0.vp_c10)._m0[5].x, _656);
    float _666 = fma(_357, (*spvDescriptorSet0.vp_c10)._m0[4].x, _658);
    float _668 = fma(_357, (*spvDescriptorSet0.vp_c10)._m0[6].x, _660);
    float _670 = floor(_662);
    float _672 = fma(_365, (*spvDescriptorSet0.vp_c10)._m0[5].z, _664);
    float _674 = fma(_365, (*spvDescriptorSet0.vp_c10)._m0[4].z, _666);
    float _676 = fma(_365, (*spvDescriptorSet0.vp_c10)._m0[6].z, _668);
    float _678 = _672 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _680 = _674 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _682 = _676 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _684 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _686 = _678 + _684;
    float _688 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _690 = _680 + _688;
    float _692 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _694 = _682 + _692;
    float _696 = _686 * _686;
    float _698 = fma(_690, _690, _696);
    float _700 = fma(_694, _694, _698);
    float _702 = rsqrt(_700);
    float _704 = _686 * _702;
    float _706 = _690 * _702;
    float _708 = _694 * _702;
    float _710 = -_704;
    float _712 = fma(_710, (*spvDescriptorSet0.vp_c9)._m0[18].w, _686);
    float _714 = -_706;
    float _716 = fma(_714, (*spvDescriptorSet0.vp_c9)._m0[18].w, _690);
    float _718 = -_708;
    float _720 = fma(_718, (*spvDescriptorSet0.vp_c9)._m0[18].w, _694);
    float _722 = -_706;
    float _724 = fma(_722, (*spvDescriptorSet0.vp_c9)._m0[18].w, _680);
    float _726 = _712 * _712;
    float _728 = fma(_716, _716, _726);
    float _730 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _199);
    float _732 = fma(_720, _720, _728);
    float _734 = _600 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _736 = sqrt(_732);
    float _738 = _702 * _736;
    float _740 = _734 * _738;
    float _742 = _602 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _744 = _738 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _746 = _744 * 0.5;
    float _748 = _740 * _730;
    float _750 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _185);
    float _752 = _742 * _738;
    float _754 = fma(_670, -0.1500000059604644775390625, 1.0);
    float _756 = _748 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _758 = _752 * _750;
    float _760 = _748 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _762 = precise::max(_754, 0.20000000298023223876953125);
    float _764 = fma(_758, (*spvDescriptorSet0.vp_c10)._m0[10].x, _756);
    float _766 = fma(_758, (*spvDescriptorSet0.vp_c10)._m0[8].x, _760);
    float _768 = precise::min(_762, 1.0);
    float _770 = fma(_746, (*spvDescriptorSet0.vp_c10)._m0[10].z, _764);
    float _772 = _670 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _774 = fma(_746, (*spvDescriptorSet0.vp_c10)._m0[8].z, _766);
    float _776 = fma(_770, _768, _682);
    float _778 = fma(_774, _768, _680);
    float _780 = fma(_772, (*spvDescriptorSet0.vp_c10)._m0[10].y, _776);
    float _782 = fma(_772, (*spvDescriptorSet0.vp_c10)._m0[8].y, _778);
    float _784 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _786 = _780 + _784;
    float _788 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _790 = _782 + _788;
    float _792 = _786 * _786;
    float _794 = fma(_790, _790, _792);
    float _796 = _748 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _798 = sqrt(_794);
    float _800 = fma(_758, (*spvDescriptorSet0.vp_c10)._m0[9].x, _796);
    float _802 = fma(_746, (*spvDescriptorSet0.vp_c10)._m0[9].z, _800);
    float _804 = fma(_802, _768, _678);
    float _806 = fma(_772, (*spvDescriptorSet0.vp_c10)._m0[9].y, _804);
    bool _808 = _798 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _810 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _812 = _810 != 0;
    int _814 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _816 = _814 != 0;
    int _818 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _820 = _818 != 0;
    int _822 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _824 = _822 != 0;
    bool _826 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _828 = isnan(0.5);
    bool _830 = _826 || _828;
    bool _832 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _834 = _830 || _832;
    bool _836 = !_816;
    int _838 = _836 ? 0 : 1;
    bool _840 = !_812;
    int _842 = _840 ? 0 : 1;
    bool _844 = !_820;
    int _846 = _844 ? 0 : 1;
    bool _848 = !_824;
    int _850 = _848 ? 0 : 1;
    float _852 = _748;
    float _854 = _800;
    float _856 = _704;
    if (!_808)
    {
        _852 = _782;
    }
    float _858 = _852;
    float _860 = _858;
    if (!_808)
    {
        _373 = _780;
    }
    float _862 = _373;
    float _864 = _862;
    if (!_808)
    {
        _854 = _806;
    }
    float _866 = _854;
    bool _868 = !_808;
    float _870 = _866;
    if (!_868)
    {
        float _872 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _874 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _876 = _798 + _874;
        float _878 = rsqrt(_794);
        float _880 = _876 * _872;
        float _882 = _806 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _884 = _880 * 0.15915493667125701904296875;
        float _886 = _884 * 6.283185482025146484375;
        float _888 = cos(_886);
        float _890 = _884 * 6.283185482025146484375;
        float _892 = sin(_890);
        float _894 = _888 + (-1.0);
        float _896 = _894 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _898 = fma(_892, _882, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _900 = fma(_806, _888, _896);
        float _902 = _878 * _898;
        float _904 = fma(_790, _902, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _906 = fma(_786, _902, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _860 = _904;
        _864 = _906;
        _870 = _900;
    }
    float _908 = _860;
    float _910 = _864;
    float _912 = _870;
    float _914 = -_706;
    float _916 = fma(_914, (*spvDescriptorSet0.vp_c9)._m0[18].w, _908);
    float _918 = -_708;
    float _920 = fma(_918, (*spvDescriptorSet0.vp_c9)._m0[18].w, _910);
    float _922 = -_704;
    float _924 = fma(_922, (*spvDescriptorSet0.vp_c9)._m0[18].w, _912);
    float _926 = -_704;
    float _928 = fma(_926, (*spvDescriptorSet0.vp_c9)._m0[18].w, _678);
    float _930 = -_708;
    float _932 = fma(_930, (*spvDescriptorSet0.vp_c9)._m0[18].w, _682);
    float _934 = _924;
    float _936 = _916;
    float _938 = _920;
    float _940 = _912;
    if (_834)
    {
        _856 = _920;
    }
    float _942 = _856;
    float _944 = _942;
    if (!_834)
    {
        float _946 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _948 = _928 + _946;
        float _950 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _952 = _724 + _950;
        float _954 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _956 = -_682;
        float _958 = _956 + _910;
        float _960 = _948 * _948;
        float _962 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _964 = _932 + _962;
        float _966 = -_680;
        float _968 = _966 + _908;
        float _970 = -_678;
        float _972 = _970 + _912;
        float _974 = fma(_952, _952, _960);
        float _976 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _978 = fma(_964, _964, _974);
        float _980 = sqrt(_978);
        float _982 = 1.0 / _738;
        float _984 = _976 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _986 = precise::min(_980, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _988 = _986 * _954;
        float _990 = _988 * _982;
        float _992 = _984 * _990;
        float _994 = _958 * _990;
        float _996 = fma(_968, _992, _724);
        float _998 = fma(_972, _992, _928);
        float _1000 = fma(_984, _994, _932);
        _934 = _998;
        _936 = _996;
        _944 = _1000;
        _938 = _980;
    }
    float _1002 = _934;
    float _1004 = _936;
    float _1006 = _944;
    float _1008 = _938;
    float _1010 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1012 = _1002 + _1010;
    float _1014 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1016 = _1004 + _1014;
    float _1018 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1020 = _1006 + _1018;
    float _1022 = _1012 * _1012;
    float _1024 = fma(_1016, _1016, _1022);
    float _1026 = fma(_1020, _1020, _1024);
    float _1028 = rsqrt(_1026);
    float _1030 = sqrt(_1026);
    float _1032 = _1028 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1034 = _1016 * _1032;
    float _1036 = _1020 * _1032;
    float _1038 = _1034 * _1034;
    float _1040 = _1036 * _1036;
    float _1042 = _1038 + _1040;
    float _1044 = sqrt(_1042);
    bool _1046 = _1044 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1048 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1050 = _1044 + _1048;
    float _1052 = _1024;
    float _1054 = _1042;
    float _1056 = _1050;
    float _1058 = _1012;
    float _1060 = _1008;
    if (_1046)
    {
        float _1062 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1052 = _1062;
    }
    float _1064 = _1052;
    if (_1046)
    {
        float _1066 = rsqrt(_1042);
        _1054 = _1066;
    }
    float _1068 = _1054;
    float _1070 = _1064;
    if (_1046)
    {
        float _1072 = _1050 * _1064;
        _1056 = _1072;
    }
    float _1074 = _1056;
    if (_1046)
    {
        float _1076 = _1074 * 0.15915493667125701904296875;
        _940 = _1076;
    }
    float _1078 = _940;
    float _1080 = _1028;
    if (_1046)
    {
        float _1082 = _1078 * 6.283185482025146484375;
        float _1084 = cos(_1082);
        _1080 = _1084;
    }
    float _1086 = _1080;
    float _1088 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1090 = precise::max(0.0, _1088);
    float _1092 = _1020;
    float _1094 = _1090;
    if (_1046)
    {
        float _1096 = _1078 * 6.283185482025146484375;
        float _1098 = sin(_1096);
        _1092 = _1098;
    }
    float _1100 = _1092;
    float _1102 = -_1032;
    float _1104 = -_1090;
    float _1106 = fma(_1012, _1102, _1104);
    if (!_1046)
    {
        _1094 = _1034;
    }
    float _1108 = _1094;
    float _1110 = _1108;
    if (_1046)
    {
        float _1112 = _1106 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1058 = _1112;
    }
    float _1114 = _1058;
    float _1116 = _1114;
    float _1118 = _1086;
    if (_1046)
    {
        float _1120 = _1086 + (-1.0);
        _1060 = _1120;
    }
    float _1122 = _1060;
    float _1124 = _1002 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1126 = _1122;
    if (_1046)
    {
        float _1128 = _1122 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1070 = _1128;
    }
    float _1130 = _1070;
    float _1132 = fma(_1004, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1124);
    float _1134 = _1100;
    float _1136 = _1130;
    if (_1046)
    {
        float _1138 = fma(_1100, _1114, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1116 = _1138;
    }
    float _1140 = _1116;
    float _1142 = _1140;
    if (!_1046)
    {
        _1134 = _1106;
    }
    float _1144 = _1134;
    float _1146 = _1144;
    if (_1046)
    {
        float _1148 = fma(_1106, _1086, _1130);
        _1146 = _1148;
    }
    float _1150 = _1146;
    if (!_1046)
    {
        _1136 = _1038;
    }
    float _1152 = _1136;
    float _1154 = _1152;
    if (_1046)
    {
        float _1156 = _1068 * _1140;
        _1126 = _1156;
    }
    float _1158 = _1126;
    if (!_1046)
    {
        _1142 = _1036;
    }
    float _1160 = _1142;
    float _1162 = _1002 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1164 = _1160;
    if (!_1046)
    {
        _1118 = _1040;
    }
    float _1166 = _1118;
    float _1168 = _1166;
    if (_1046)
    {
        float _1170 = _1034 * _1158;
        _1110 = _1170;
    }
    float _1172 = _1110;
    if (_1046)
    {
        float _1174 = _1036 * _1158;
        _1164 = _1174;
    }
    float _1176 = _1164;
    float _1178 = _1002 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1180 = fma(_1004, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1162);
    if (_1046)
    {
        float _1182 = _1172 * _1172;
        _1154 = _1182;
    }
    float _1184 = _1154;
    if (_1046)
    {
        float _1186 = _1176 * _1176;
        _1168 = _1186;
    }
    float _1188 = _1168;
    float _1190 = fma(_1004, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1178);
    float _1192 = fma(_1006, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1180);
    float _1194 = fma(_1150, _1150, _1184);
    float _1196 = _1002 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1198 = fma(_1006, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1190);
    float _1200 = _1194 + _1188;
    float _1202 = _1192 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1204 = fma(_1004, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1196);
    float _1206 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1208 = fma(_1006, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1132);
    float _1210 = _1198 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1212 = rsqrt(_1200);
    float _1214 = _1202 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1216 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1218 = fma(_1030, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1216);
    float _1220 = precise::clamp(_1218, 0.0, 1.0);
    float _1222 = fma(_1006, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1204);
    float _1224 = _1208 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1226 = fma(_1210, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1214);
    float _1228 = -_1220;
    float _1230 = _1228 + 1.0;
    float _1232 = _1222 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1234 = _1224 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1236 = fma(_1224, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1226);
    float _1238 = abs(_1230);
    float _1240 = log2(_1238);
    float _1242 = -_1234;
    float _1244 = fma(_1242, _1206, 1.0);
    float _1246 = _1212 * _1172;
    float _1248 = fma(_1232, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1236);
    float _1250 = _1212 * _1150;
    float _1252 = _1212 * _1176;
    float _1254 = _1246 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1256 = log2(_1244);
    float _1258 = _1202 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1260 = -_1254;
    float _1262 = fma(_1250, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1260);
    float _1264 = _1240 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1266 = fma(_1210, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1258);
    float _1268 = -_1252;
    float _1270 = fma(_1268, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1262);
    float _1272 = 1.0 / _1248;
    float _1274 = _1202 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1276 = _1250 + 1.0;
    float _1278 = fma(_1270, -0.5, 0.5);
    float _1280 = fma(_1270, 0.5, 0.5);
    float _1282 = fma(_1210, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1274);
    float _1284 = fma(_1224, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1266);
    float _1286 = exp2(_1264);
    float _1288 = fma(_1280, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1290 = fma(_1224, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1282);
    float _1292 = fma(_1232, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1284);
    float _1294 = _1256 * 0.693147182464599609375;
    float _1296 = fma(_1280, _1288, -0.212114393711090087890625);
    float _1298 = fma(_1232, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1290);
    float _1300 = sqrt(_1278);
    float _1302 = fma(_1280, _1296, 1.570728778839111328125);
    float _1304 = _1298 * _1272;
    float _1306 = _1292 * _1272;
    float _1308 = _1294 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1310 = fma(_1304, 0.5, 0.5);
    float _1312 = fma(_1306, -0.5, 0.5);
    float _1314 = -_1250;
    float _1316 = fma(_1286, _1276, _1314);
    float _1318 = fma(_1316, 0.5, 0.5);
    float _1320 = _1300 * 0.636619746685028076171875;
    float _1322 = -_1302;
    float _1324 = fma(_1320, _1322, 1.0);
    float3 _4251 = float3(_1310, _1312, _1308);
    float _1326 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4251, float3(0.0), isnan(_4251)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4251, float3(0.0), isnan(_4251)), level(0.0)).x;
    float3 _4262 = float3(_1310, _1312, _1308);
    float4 _1329 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4262, float3(0.0), isnan(_4262)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4262, float3(0.0), isnan(_4262)), level(0.0)).xyzw;
    float _1331 = _1329.x;
    float _1333 = _1329.y;
    float _1335 = _1329.z;
    float _1337 = _1329.w;
    float2 _4279 = float2(_1324, _1318);
    float3 _1341 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4279, float2(0.0), isnan(_4279)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4279, float2(0.0), isnan(_4279)), level(0.0)).xyz;
    float _1343 = _1341.x;
    float _1345 = _1341.y;
    float _1347 = _1341.z;
    float _1349 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _1351 = int(_1349);
    int _1353 = abs(_838);
    out.m_56.x = _614;
    out.m_56.y = _616;
    out.m_56.z = _620;
    out.m_56.w = _612;
    bool _1355 = _141 > 0.5;
    float _1357 = _1202 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_58.y = _1002;
    float _1359 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1361 = int(_1359);
    float _1363 = fma(_1210, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1357);
    float _1365 = in.m_49.y;
    float _1367 = fma(_1224, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1363);
    float _1369 = float(_1351);
    float _1371 = fma(_1232, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1367);
    float _1373 = 1.0 / _1369;
    float _1375 = float(uint(_1361));
    int _1377 = ~_1361;
    int _1379 = _1377 + 1;
    float _1381 = 1.0 / _1375;
    int _1383 = ~_1361;
    int _1385 = _1383 + 1;
    int _1387 = ~_1361;
    int _1389 = _1387 + 1;
    int _1391 = ~_1361;
    int _1393 = _1391 + 1;
    float _1395 = _1365 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1397 = _121 * _1373;
    float _1399 = float(_1361);
    float _1401 = trunc(_1397);
    int _1403 = int(_1401);
    int _1405 = as_type<int>(_1381) + (-2);
    float _1407 = float(uint(_1403));
    float _1409 = as_type<float>(_1405) * _1407;
    float _1411 = trunc(_1409);
    float _1413 = precise::max(_1411, 0.0);
    uint _1415 = uint(_1413);
    int _1417 = _1385 * int(_1415);
    int _1419 = _1417 + _1403;
    float _1421 = float(uint(_1419));
    float _1423 = as_type<float>(_1405) * _1421;
    int _1425 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1427 = _1425 != 0;
    bool _1429 = !_1427;
    float _1431 = _1429 ? _1365 : _141;
    float _1433 = trunc(_1423);
    float _1435 = precise::max(_1433, 0.0);
    uint _1437 = uint(_1435);
    bool _1439 = !_1427;
    float _1441 = _1439 ? 1.2345600128173828125 : 1.0;
    float _1443 = float(_1403);
    float _1445 = _1441 * _1431;
    bool _1447 = _1443 >= _1399;
    bool _1449 = isnan(_1443);
    bool _1451 = _1447 || _1449;
    bool _1453 = isnan(_1399);
    bool _1455 = _1451 || _1453;
    float _1457 = float(_1455);
    float _1459 = floor(_1445);
    int _1461 = int(_1415) + int(_1437);
    float _1463 = 1.0 / _652;
    int _1465 = _1379 * _1461;
    int _1467 = _1465 + _1403;
    bool _1469 = uint(_1467) >= uint(_1361);
    float _1471 = trunc(_1457);
    int _1473 = int(_1471);
    float _1475 = -_1459;
    float _1477 = _1445 + _1475;
    float _1479 = _121 * _1399;
    bool _1481 = !_1469;
    int _1483 = _1481 ? 0 : (-1);
    float _1485 = _1477 * _1399;
    bool _1487 = _1361 == 0;
    float _1489 = _1479 * _1463;
    int _1491 = ~_1461;
    int _1493 = _1491 + _1483;
    int _1495 = _1493 + 1;
    float _1497 = trunc(_1485);
    int _1499 = int(_1497);
    int _1501 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1503 = _1501 != 0;
    int _1505 = _1361 + (-1);
    int _1507 = _1361 * _1495;
    int _1509 = _1507 + _1403;
    bool _1511 = !_1503;
    int _1513 = _1511 ? 0 : 1;
    int _1515 = ~_1473;
    int _1517 = _1515 + 1;
    int _1519 = _1517 + 1;
    float _1521 = trunc(_1489);
    int _1523 = int(_1521);
    bool _1525 = !_1487;
    int _1527 = _1525 ? _1509 : (-1);
    int _1529 = abs(_1513);
    bool _1531 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1533 = isnan(0.5);
    bool _1535 = _1531 || _1533;
    bool _1537 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1539 = _1535 || _1537;
    int _1541 = _1527 * _1519;
    int _1543 = abs(_842);
    int _1545 = _1473 * _1505;
    int _1547 = _1545 + _1541;
    float _1549 = in.m_49.w;
    int _1551 = abs(_846);
    int _1553 = _1499 * _1529;
    int _1555 = _1553 + _1403;
    int _1557 = _1547 * _1353;
    int _1559 = abs(_850);
    float _1561 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _1563 = _1523 * _1543;
    int _1565 = _1563 + _1557;
    float _1567 = in.m_49.z;
    int _1569 = _1555 * _1551;
    int _1571 = _1569 + _1565;
    float _1573 = _141 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _1575 = _1499 * _1559;
    int _1577 = _1575 + _1571;
    float _1579 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1581 = _1579 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1583 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1585 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1587 = float(uint(_1577));
    float _1589 = -_1583;
    float _1591 = fma(_1573, 2.0, _1589);
    float _1593 = 1.0 / _1581;
    bool _1595 = _1549 > 0.5;
    float _1597 = fma(_1395, -2.0, _1585);
    float _1599 = as_type<float>(_1405) * _1587;
    float _1601 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1603 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1601;
    int _1605 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1607 = _1605 != 0;
    float _1609 = trunc(_1599);
    float _1611 = precise::max(_1609, 0.0);
    uint _1613 = uint(_1611);
    float _1615 = -_185;
    int _1617 = _1355 ? as_type<int>(_1615) : as_type<int>(_185);
    float _1619 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _1621 = _1567 > 0.5;
    int _1623 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1625 = _1623 != 0;
    float _1627 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1629 = -_185;
    int _1631 = _1621 ? as_type<int>(_1629) : as_type<int>(_185);
    float _1633 = _1603 * _1593;
    bool _1635 = !_1607;
    float _1637 = _1635 ? _185 : as_type<float>(_1617);
    float _1639 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1619);
    float _1641 = _1593;
    float _1643 = _1567;
    if (!_1427)
    {
        _1641 = _1365;
    }
    float _1645 = _1641;
    float _1647 = -_121;
    float _1649 = fma(_1647, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1591);
    bool _1651 = _1365 > 0.5;
    int _1653 = _1389 * int(_1613);
    int _1655 = _1653 + _1577;
    bool _1657 = !_1625;
    float _1659 = _1657 ? _185 : as_type<float>(_1631);
    float _1661 = _1637 + 0.5;
    float _1663 = _1645;
    if (_1427)
    {
        _1663 = _141;
    }
    float _1665 = _1663;
    float _1667 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1669 = float(uint(_1655));
    if (!_1427)
    {
        _209 = _1567;
    }
    float _1671 = _209;
    float _1673 = fma(_1365, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1667);
    float _1675 = _1671;
    if (_1427)
    {
        _1643 = _1365;
    }
    float _1677 = _1643;
    float _1679 = as_type<float>(_1405) * _1669;
    if (_1427)
    {
        _1675 = _1365;
    }
    float _1681 = _1675;
    float _1683 = _1627 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1685 = trunc(_1679);
    float _1687 = precise::max(_1685, 0.0);
    uint _1689 = uint(_1687);
    int _1691 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1693 = _1691 != 0;
    float _1695 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1697 = _654 + _1695;
    int _1699 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1701 = _1699 != 0;
    float _1703 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1705 = -_199;
    int _1707 = _1595 ? as_type<int>(_1705) : as_type<int>(_199);
    float _1709 = _1665 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1711 = float(uint(_1555));
    float _1713 = _1677 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1715 = -_199;
    int _1717 = _1651 ? as_type<int>(_1715) : as_type<int>(_199);
    bool _1719 = !_1693;
    float _1721 = _1719 ? _199 : as_type<float>(_1717);
    bool _1723 = !_1701;
    float _1725 = _1723 ? _199 : as_type<float>(_1707);
    float _1727 = fma(_1683, _1661, _1649);
    float _1729 = fma(_1633, _1697, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1731 = fma(_1681, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1703);
    bool _1733 = _654 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1735 = isnan(_654);
    bool _1737 = _1733 || _1735;
    bool _1739 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1741 = _1737 || _1739;
    float _1743 = float(_1741);
    float _1745 = _1721 + (-0.5);
    int _1747 = int(_1613) + int(_1689);
    float _1749 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1731);
    bool _1751 = _654 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1753 = isnan(_654);
    bool _1755 = _1751 || _1753;
    bool _1757 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1759 = _1755 || _1757;
    float _1761 = float(_1759);
    float _1763 = _1561 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1765 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1767 = as_type<float>(_1405) * _1711;
    float _1769 = -_1743;
    float _1771 = _1769 + 1.0;
    float _1773 = -_1749;
    float _1775 = _1773 + 1.0;
    float _1777 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1779 = _1761 * _1771;
    float _1781 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1597);
    float _1783 = trunc(_1767);
    float _1785 = precise::max(_1783, 0.0);
    uint _1787 = uint(_1785);
    float _1789 = fma(_1665, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1777);
    int _1791 = _1393 * _1747;
    int _1793 = _1791 + _1577;
    float _1795 = -_1763;
    float _1797 = -_1781;
    float _1799 = fma(_1795, _1745, _1797);
    float _1801 = _1729 * _1779;
    float _1803 = -_1765;
    float _1805 = fma(_1709, 2.0, _1803);
    bool _1807 = uint(_1793) >= uint(_1361);
    float _1809 = _928 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    int _1811 = ~_1361;
    int _1813 = _1811 + 1;
    float _1815 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    bool _1817 = !_1807;
    int _1819 = _1817 ? 0 : (-1);
    float _1821 = fma(_724, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1809);
    float _1823 = _928 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1825 = fma(_1713, -2.0, _1815);
    int _1827 = ~_1747;
    int _1829 = _1827 + _1819;
    int _1831 = _1829 + 1;
    int _1833 = _1813 * int(_1787);
    int _1835 = _1833 + _1555;
    float _1837 = fma(_932, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1821);
    float _1839 = fma(_724, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1823);
    float _1841 = -_1761;
    float _1843 = _1841 + 1.0;
    int _1845 = _1361 * _1831;
    int _1847 = _1845 + _1577;
    float _1849 = float(uint(_1835));
    float _1851 = fma(_932, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1839);
    float _1853 = _1837 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1855 = fma(_1843, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1801);
    bool _1857 = !_1487;
    int _1859 = _1857 ? _1847 : (-1);
    float _1861 = as_type<float>(_1405) * _1849;
    float _1863 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1673);
    float _1865 = 1.0 / _1853;
    int _1867 = _1859 >> 31;
    float _1869 = _1851 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1871 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1639);
    float _1873 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1789);
    int _1875 = _1867 & 3;
    float _1877 = -_121;
    float _1879 = fma(_1877, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1805);
    float _1881 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1825);
    float _1883 = trunc(_1861);
    float _1885 = precise::max(_1883, 0.0);
    uint _1887 = uint(_1885);
    int _1889 = _1859 + _1875;
    float _1891 = _1725 + (-0.5);
    float _1893 = _1869 + _1853;
    float _1895 = -_1863;
    float _1897 = _1895 + 1.0;
    int _1899 = _1889 >> 2;
    float _1901 = -_1891;
    float _1903 = -_1881;
    float _1905 = fma(_1901, (*spvDescriptorSet0.vp_c9)._m0[85].y, _1903);
    int _1907 = _1859 & 3;
    bool _1909 = _1907 != 0;
    float _1911 = _1893 * _1865;
    float _1913 = _1911 * 0.5;
    int _1915 = _1899 << 4;
    int _1917 = _1915 + 512;
    float _1919 = -_1871;
    float _1921 = _1919 + 1.0;
    float _1923 = fma(_1721, _1897, _1799);
    int _1925 = _1859 & 3;
    bool _1927 = _1925 != 0;
    float _1929 = _1659 + 0.5;
    float _1931 = -_1921;
    float _1933 = fma(_1637, _1931, _1727);
    int _1935 = ~_1361;
    int _1937 = _1935 + 1;
    int _1939 = _1917 + 8;
    uint _1941 = uint(int(uint(_1939) >> uint(2)));
    uint _1943 = uint(int(uint(int(_1941)) >> uint(2)));
    int _1945 = int(_1941) & 3;
    float _1947 = (*spvDescriptorSet0.vp_c9)._m0[int(_1943)][_1945];
    int _1949 = int(_1941) + 1;
    uint _1951 = uint(int(uint(_1949) >> uint(2)));
    int _1953 = _1949 & 3;
    float _1955 = (*spvDescriptorSet0.vp_c9)._m0[int(_1951)][_1953];
    int _1957 = int(_1787) + int(_1887);
    float _1959 = fma(_1725, _1775, _1905);
    bool _1961 = uint(_1925) > 1u;
    float _1963 = fma(_1929, (*spvDescriptorSet0.vp_c9)._m0[85].x, _1879);
    int _1965 = _1909 ? 0 : 1;
    int _1967 = _1937 * _1957;
    int _1969 = _1967 + _1555;
    float _1971 = -_1873;
    float _1973 = _1971 + 1.0;
    uint _1975 = uint(int(uint(_1917) >> uint(2)));
    uint _1977 = uint(int(uint(int(_1975)) >> uint(2)));
    int _1979 = int(_1975) & 3;
    float _1981 = (*spvDescriptorSet0.vp_c9)._m0[int(_1977)][_1979];
    int _1983 = int(_1975) + 1;
    uint _1985 = uint(int(uint(_1983) >> uint(2)));
    int _1987 = _1983 & 3;
    float _1989 = (*spvDescriptorSet0.vp_c9)._m0[int(_1985)][_1987];
    float _1991 = _1929;
    float _1993 = _1913;
    float _1995 = _1761;
    float _1997 = _1799;
    float _1999 = _1743;
    if (!_1539)
    {
        _1991 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    }
    float _2001 = _1991;
    float _2003 = fma(_1743, (*spvDescriptorSet0.vp_c9)._m0[132].x, _1855);
    int _2005 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _2007 = _2005 != 0;
    float _2009 = -_1973;
    float _2011 = fma(_1659, _2009, _1963);
    bool _2013 = uint(_1969) >= uint(_1361);
    if (!_1539)
    {
        float _2015 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _2017 = fma(_1913, _2001, _2015);
        _1993 = _2017;
    }
    float _2019 = _1993;
    if (!_1539)
    {
        _1995 = (*spvDescriptorSet0.vp_c9)._m0[140].z;
    }
    float _2021 = _1995;
    float _2023 = _2003 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    int _2025 = ~_1965;
    int _2027 = _2025 + 1;
    int _2029 = _2027 + 1;
    out.m_60.x = _1933;
    out.m_60.y = _1923;
    out.m_60.z = _2011;
    out.m_60.w = _1959;
    int _2031 = _2029;
    if (!_1961)
    {
        int _2033 = ~_1965;
        int _2035 = _2033 + 1;
        _2031 = _2035;
    }
    int _2037 = _2031;
    if (!_1539)
    {
        float _2039 = -_2021;
        float _2041 = _2039 + (*spvDescriptorSet0.vp_c9)._m0[140].w;
        _1997 = _2041;
    }
    float _2043 = _1997;
    bool _2045 = _1925 != 3;
    float _2047 = _2019;
    if (!_1539)
    {
        float _2049 = 1.0 / _2019;
        _2047 = _2049;
    }
    float _2051 = _2047;
    bool _2053 = !_2013;
    int _2055 = _2053 ? 0 : (-1);
    out.m_62.w = _2023;
    bool _2057 = !_1927;
    int _2059 = _2057 ? 0 : 1;
    int _2061 = abs(_2037);
    bool _2063 = uint(_1925) >= 2u;
    float _2065 = _2001;
    if (!_1539)
    {
        float _2067 = 1.0 / _2043;
        _2065 = _2067;
    }
    float _2069 = _2065;
    int _2071 = ~_1957;
    int _2073 = _2071 + _2055;
    int _2075 = _2073 + 1;
    int _2077 = abs(_2059);
    int _2079 = _1361 * _2075;
    int _2081 = _2079 + _1555;
    float _2083 = _1240 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _2085 = _1925 != 3;
    if (!_1539)
    {
        float _2087 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2089 = -_2021;
        float _2091 = fma(_2051, _2087, _2089);
        _1999 = _2091;
    }
    float _2093 = _1999;
    int _2095 = _2063 ? 0 : 1;
    int _2097 = ~_2061;
    int _2099 = _2097 + 1;
    int _2101 = _2099 + 1;
    float _2103 = exp2(_2083);
    int _2105 = ~_2095;
    int _2107 = _2105 + 1;
    int _2109 = _2107 + 1;
    int _2111 = _2109;
    float _2113 = _2093;
    if (_2045)
    {
        int _2115 = ~_2095;
        int _2117 = _2115 + 1;
        _2111 = _2117;
    }
    int _2119 = _2111;
    if (!_1539)
    {
        float _2121 = _2093 * _2069;
        float _2123 = precise::clamp(_2121, 0.0, 1.0);
        _2113 = _2123;
    }
    float _2125 = _2113;
    int _2127 = ~_2077;
    int _2129 = _2127 + 1;
    int _2131 = _2129 + 1;
    int _2133 = abs(_2119);
    bool _2135 = !_2085;
    float _2137 = _2135 ? 0.0 : as_type<float>(0xffffffffu /* nan */);
    int _2139 = _2101 * as_type<int>(_1989);
    int _2141 = abs(as_type<int>(_2137));
    float _2143 = _2137;
    if (_1539)
    {
        _2143 = 1.0;
    }
    float _2145 = _2143;
    int _2147 = _2131 * as_type<int>(_1981);
    int _2149 = _2147 + _2139;
    bool _2151 = !_2007;
    int _2153 = _2151 ? 0 : 1;
    float _2155 = _2145;
    if (!_1539)
    {
        float _2157 = -_2125;
        float _2159 = _2157 + 1.0;
        _2155 = _2159;
    }
    float _2161 = _2155;
    int _2163 = ~_2133;
    int _2165 = _2163 + 1;
    int _2167 = _2165 + 1;
    float _2169 = -_2103;
    float _2171 = _2169 + 1.0;
    int _2173 = abs(_2153);
    float _2175 = _2161 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    int _2177 = _2167 * as_type<int>(_1947);
    int _2179 = _2177 + _2149;
    int _2181 = ~_2173;
    int _2183 = _2181 + 1;
    int _2185 = _2183 + 1;
    float _2187 = _2171 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    int _2189 = ~_2141;
    int _2191 = _2189 + 1;
    int _2193 = _2191 + 1;
    float _2195 = _369 * _2175;
    float _2197 = _2187 * _1326;
    float _2199 = -_2187;
    float _2201 = _2199 + 1.0;
    int _2203 = _2193 * as_type<int>(_1955);
    int _2205 = _2203 + _2179;
    bool _2207 = !_1487;
    int _2209 = _2207 ? _2081 : (-1);
    float _2211 = _2195 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    bool _2213 = _2161 > 0.0;
    bool _2215 = isnan(_2161);
    bool _2217 = _2213 || _2215;
    bool _2219 = isnan(0.0);
    bool _2221 = _2217 || _2219;
    int _2223 = _2205 * _2185;
    float _2225 = -(*spvDescriptorSet0.vp_c8)._m0[31].z;
    float _2227 = _1371 + _2225;
    float _2229 = _1337 * _2197;
    float _2231 = _1347 * _2197;
    int _2233 = _2209 * _2173;
    int _2235 = _2233 + _2223;
    float _2237 = _1248 + _2227;
    out.gl_Position.x = _1298;
    out.gl_Position.y = _1292;
    out.gl_Position.z = _2227;
    out.gl_Position.w = _1248;
    float _2239 = fma(_1343, _2229, _1331);
    float _2241 = _2237 * 0.5;
    float _2243 = float(_2235);
    float _2245 = fma(_1345, _2229, _1333);
    float _2247 = _1337 * _2201;
    float _2249 = fma(_1337, _2231, _1335);
    out.m_64.z = _2241;
    out.m_64.w = _1248;
    out.m_66.y = _2243;
    out.m_45.x = _2211;
    out.m_68.x = _2239;
    out.m_68.y = _2245;
    out.m_68.z = _2249;
    out.m_68.w = _2247;
    if (_2221)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_45.x = 0.0;
    float _2251 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2251;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

