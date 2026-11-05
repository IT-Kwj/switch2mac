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
    bool _642 = false;
    bool _501 = false;
    bool _389 = false;
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
        float _2388 = as_type<float>(_103);
        out.gl_Position.z = _2388;
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
        float _2456 = as_type<float>(_139);
        out.gl_Position.z = _2456;
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
    if (!_157)
    {
        float _209 = _195 * _195;
        float _211 = _209 * 0.5;
        _205 = _211;
    }
    float _213 = _205;
    float _215 = _213;
    if (!_157)
    {
        float _217 = _213 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _215 = _217;
    }
    float _219 = _215;
    bool _221 = !_157;
    float _223 = _219;
    if (!_221)
    {
        float _225 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _227 = log2(_225);
        float _229 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _231 = _229 + 1.0;
        float _233 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _235 = _195 * _227;
        float _237 = 1.0 / _231;
        float _239 = _233 * 0.693147182464599609375;
        float _241 = exp2(_235);
        float _243 = 1.0 / _239;
        float _245 = _241 + (-1.0);
        float _247 = -_245;
        float _249 = fma(_247, _243, _195);
        float _251 = _249 * _237;
        float _253 = _251 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _223 = _253;
    }
    float _255 = _223;
    bool _257 = !_157;
    if (!_257)
    {
        float _259 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _261 = log2(_259);
        float _263 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _265 = _263 + 1.0;
        float _267 = 1.0 / _265;
        float _269 = _195 * _261;
        float _271 = exp2(_269);
        float _273 = -_271;
        float _275 = _273 + 1.0;
        float _277 = _275 * _267;
        _207 = _277;
    }
    float _279 = _207;
    float _281 = in.m_54.w;
    int _283 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _285 = _283 != 0;
    int _287 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _289 = _287 != 0;
    float _291 = in.m_42.x;
    float _293 = in.m_42.y;
    float _295 = in.m_42.z;
    bool _297 = _203 < 0.5;
    float _299 = float(_297);
    float _301 = -_203;
    float _303 = fma(_301, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _305 = fma(_193, 0.5, 0.5);
    bool _307 = !_285;
    int _309 = _307 ? 0 : 1;
    float _311 = _255 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    bool _313 = !_189;
    int _315 = _313 ? 0 : 1;
    float _317 = -_299;
    float _319 = fma(_317, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _321 = abs(_309);
    float _323 = -_305;
    float _325 = fma(_323, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _327 = abs(_315);
    float _329 = fma(_279, _159, _311);
    bool _331 = !_289;
    int _333 = _331 ? 0 : 1;
    float _335 = _255 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _337 = _255 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    bool _339 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _341 = fma(_279, _161, _335);
    int _343 = abs(_333);
    float _345 = fma(_279, _163, _337);
    float _347 = float(_321);
    float _349 = float(_327);
    float _351 = abs(_303);
    float _353 = _347 * _351;
    float _355 = fma(_329, _281, _291);
    float _357 = fma(_341, _281, _293);
    float _359 = float(_343);
    float _361 = fma(_349, _325, _353);
    float _363 = fma(_345, _281, _295);
    float _365 = abs(_319);
    float _367 = fma(_359, _365, _361);
    bool _369 = !_339;
    float _371 = (*spvDescriptorSet0.vp_c9)._m0[7].x;
    float _387;
    if (!_369)
    {
        float _373 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _375 = _141 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _377 = fma(_375, (*spvDescriptorSet0.vp_c9)._m0[12].x, _121);
        float _379 = _377 * _373;
        float _381 = floor(_379);
        float _383 = -_381;
        float _385 = _379 + _383;
        _387 = _385;
        _389 = true;
    }
    else
    {
        float _391 = float(_87);
        float _393 = 1.0 / _391;
        float _395 = _121 * _393;
        _387 = _395;
    }
    _389 = false;
    float _397 = _387;
    float _399 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _401 = _397 + _399;
    float _403 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    bool _405 = _397 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _407 = isnan(_397);
    bool _409 = _405 || _407;
    bool _411 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _413 = _409 || _411;
    float _415 = float(_413);
    float _417 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _419 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _417;
    float _421 = _403 * _141;
    float _423 = -_415;
    float _425 = _423 + 1.0;
    bool _427 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _429 = 1.0 / _419;
    float _431 = trunc(_421);
    int _433 = int(_431);
    float _435 = _401 * _429;
    bool _437 = _397 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _439 = isnan(_397);
    bool _441 = _437 || _439;
    bool _443 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _445 = _441 || _443;
    float _447 = float(_445);
    float _449 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _451 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _449;
    float _453 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _455 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _453;
    float _457 = _447 * _425;
    float _459 = fma(_451, _435, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _461 = fma(_455, _435, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _463 = -_447;
    float _465 = _463 + 1.0;
    float _467 = _459 * _457;
    float _469 = _461 * _457;
    float _471 = fma(_465, (*spvDescriptorSet0.vp_c9)._m0[143].x, _467);
    float _473 = fma(_465, (*spvDescriptorSet0.vp_c9)._m0[143].y, _469);
    int _475 = _433 << 4;
    int _477 = _475 + 1712;
    float _479 = fma(_415, (*spvDescriptorSet0.vp_c9)._m0[144].x, _471);
    float _481 = fma(_415, (*spvDescriptorSet0.vp_c9)._m0[144].y, _473);
    bool _483 = !_427;
    float _499;
    if (!_483)
    {
        float _485 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _487 = _141 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _489 = fma(_487, (*spvDescriptorSet0.vp_c9)._m0[11].y, _121);
        float _491 = _489 * _485;
        float _493 = floor(_491);
        float _495 = -_493;
        float _497 = _491 + _495;
        _499 = _497;
        _501 = true;
    }
    else
    {
        float _503 = float(_87);
        float _505 = 1.0 / _503;
        float _507 = _121 * _505;
        _499 = _507;
    }
    _501 = false;
    float _509 = _499;
    uint _512 = uint(int(uint(_477) >> uint(2)));
    uint _514 = uint(int(uint(int(_512)) >> uint(2)));
    int _516 = int(_512) & 3;
    float _518 = (*spvDescriptorSet0.vp_c9)._m0[int(_514)][_516];
    int _520 = int(_512) + 1;
    uint _522 = uint(int(uint(_520) >> uint(2)));
    int _524 = _520 & 3;
    float _526 = (*spvDescriptorSet0.vp_c9)._m0[int(_522)][_524];
    float _528 = in.m_54.x;
    float _530 = in.m_54.y;
    float _532 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _534 = _509 + _532;
    bool _536 = _509 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _538 = isnan(_509);
    bool _540 = _536 || _538;
    bool _542 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _544 = _540 || _542;
    float _546 = float(_544);
    float _548 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _550 = _548 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _552 = _509 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _554 = isnan(_509);
    bool _556 = _552 || _554;
    bool _558 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _560 = _556 || _558;
    float _562 = float(_560);
    int _564 = _477 + 8;
    uint _566 = uint(int(uint(_564) >> uint(2)));
    uint _568 = uint(int(uint(int(_566)) >> uint(2)));
    int _570 = int(_566) & 3;
    float _572 = (*spvDescriptorSet0.vp_c9)._m0[int(_568)][_570];
    float _574 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _576 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _574;
    float _578 = -_546;
    float _580 = _578 + 1.0;
    bool _582 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _584 = 1.0 / _550;
    float _586 = _576 * _584;
    float _588 = fma(_586, _534, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _590 = _562 * _580;
    float _592 = _588 * _590;
    float _594 = -_562;
    float _596 = _594 + 1.0;
    float _598 = _481 * _530;
    float _600 = _479 * _528;
    float _602 = fma(_596, (*spvDescriptorSet0.vp_c9)._m0[115].x, _592);
    float _604 = fma(_546, (*spvDescriptorSet0.vp_c9)._m0[116].x, _602);
    float _606 = _518 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _608 = _526 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _610 = _604 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _612 = _606 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _614 = _608 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _616 = _572 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _618 = _616 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _620 = !_582;
    float _638;
    float _640;
    if (!_620)
    {
        float _622 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _624 = _141 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _626 = float(_87);
        float _628 = fma(_624, (*spvDescriptorSet0.vp_c9)._m0[11].w, _121);
        float _630 = _628 * _622;
        float _632 = floor(_630);
        float _634 = -_632;
        float _636 = _630 + _634;
        _638 = _626;
        _640 = _636;
        _642 = true;
    }
    else
    {
        float _644 = float(_87);
        float _646 = 1.0 / _644;
        float _648 = _121 * _646;
        _638 = _644;
        _640 = _648;
    }
    _642 = false;
    float _650 = _638;
    float _652 = _640;
    float _654 = _357 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _656 = _357 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _658 = _357 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _660 = fma(_121, 0.014999999664723873138427734375, _141);
    float _662 = fma(_355, (*spvDescriptorSet0.vp_c10)._m0[5].x, _654);
    float _664 = fma(_355, (*spvDescriptorSet0.vp_c10)._m0[4].x, _656);
    float _666 = fma(_355, (*spvDescriptorSet0.vp_c10)._m0[6].x, _658);
    float _668 = floor(_660);
    float _670 = fma(_363, (*spvDescriptorSet0.vp_c10)._m0[5].z, _662);
    float _672 = fma(_363, (*spvDescriptorSet0.vp_c10)._m0[4].z, _664);
    float _674 = fma(_363, (*spvDescriptorSet0.vp_c10)._m0[6].z, _666);
    float _676 = _670 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _678 = _672 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _680 = _674 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _682 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _684 = _676 + _682;
    float _686 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _688 = _678 + _686;
    float _690 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _692 = _680 + _690;
    float _694 = _684 * _684;
    float _696 = _668 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _698 = fma(_688, _688, _694);
    float _700 = fma(_692, _692, _698);
    float _702 = rsqrt(_700);
    float _704 = _684 * _702;
    float _706 = _688 * _702;
    float _708 = _692 * _702;
    float _710 = -_704;
    float _712 = fma(_710, (*spvDescriptorSet0.vp_c9)._m0[18].w, _684);
    float _714 = -_706;
    float _716 = fma(_714, (*spvDescriptorSet0.vp_c9)._m0[18].w, _688);
    float _718 = -_708;
    float _720 = fma(_718, (*spvDescriptorSet0.vp_c9)._m0[18].w, _692);
    float _722 = -_706;
    float _724 = fma(_722, (*spvDescriptorSet0.vp_c9)._m0[18].w, _678);
    float _726 = _712 * _712;
    float _728 = fma(_716, _716, _726);
    float _730 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _199);
    float _732 = fma(_720, _720, _728);
    float _734 = _598 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _736 = sqrt(_732);
    float _738 = _702 * _736;
    float _740 = _734 * _738;
    float _742 = _600 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _744 = _740 * _730;
    float _746 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _185);
    float _748 = _742 * _738;
    float _750 = fma(_668, -0.1500000059604644775390625, 1.0);
    float _752 = _744 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _754 = _748 * _746;
    float _756 = _738 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _758 = _756 * 0.5;
    float _760 = precise::max(_750, 0.20000000298023223876953125);
    float _762 = _744 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _764 = fma(_754, (*spvDescriptorSet0.vp_c10)._m0[10].x, _752);
    float _766 = precise::min(_760, 1.0);
    float _768 = fma(_754, (*spvDescriptorSet0.vp_c10)._m0[8].x, _762);
    float _770 = fma(_758, (*spvDescriptorSet0.vp_c10)._m0[10].z, _764);
    float _772 = fma(_758, (*spvDescriptorSet0.vp_c10)._m0[8].z, _768);
    float _774 = fma(_770, _766, _680);
    float _776 = fma(_772, _766, _678);
    float _778 = fma(_696, (*spvDescriptorSet0.vp_c10)._m0[10].y, _774);
    float _780 = fma(_696, (*spvDescriptorSet0.vp_c10)._m0[8].y, _776);
    float _782 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _784 = _778 + _782;
    float _786 = _744 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _788 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _790 = _780 + _788;
    float _792 = _784 * _784;
    float _794 = fma(_754, (*spvDescriptorSet0.vp_c10)._m0[9].x, _786);
    float _796 = fma(_790, _790, _792);
    float _798 = fma(_758, (*spvDescriptorSet0.vp_c10)._m0[9].z, _794);
    float _800 = sqrt(_796);
    float _802 = fma(_798, _766, _676);
    float _804 = fma(_696, (*spvDescriptorSet0.vp_c10)._m0[9].y, _802);
    bool _806 = _800 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _808 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _810 = _808 != 0;
    int _812 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _814 = _812 != 0;
    int _816 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _818 = _816 != 0;
    int _820 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _822 = _820 != 0;
    bool _824 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _826 = isnan(0.5);
    bool _828 = _824 || _826;
    bool _830 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _832 = _828 || _830;
    bool _834 = !_814;
    int _836 = _834 ? 0 : 1;
    bool _838 = !_810;
    int _840 = _838 ? 0 : 1;
    bool _842 = !_818;
    int _844 = _842 ? 0 : 1;
    bool _846 = !_822;
    int _848 = _846 ? 0 : 1;
    float _850 = _802;
    float _852 = _758;
    float _854 = _708;
    float _856 = _704;
    if (!_806)
    {
        _850 = _780;
    }
    float _858 = _850;
    float _860 = _858;
    if (!_806)
    {
        _371 = _778;
    }
    float _862 = _371;
    float _864 = _862;
    if (!_806)
    {
        _852 = _804;
    }
    float _866 = _852;
    bool _868 = !_806;
    float _870 = _866;
    if (!_868)
    {
        float _872 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _874 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _876 = _800 + _874;
        float _878 = rsqrt(_796);
        float _880 = _876 * _872;
        float _882 = _804 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _884 = _880 * 0.15915493667125701904296875;
        float _886 = _884 * 6.283185482025146484375;
        float _888 = cos(_886);
        float _890 = _884 * 6.283185482025146484375;
        float _892 = sin(_890);
        float _894 = _888 + (-1.0);
        float _896 = _894 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _898 = fma(_892, _882, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _900 = fma(_804, _888, _896);
        float _902 = _878 * _898;
        float _904 = fma(_790, _902, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _906 = fma(_784, _902, (*spvDescriptorSet0.vp_c15)._m0[0].z);
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
    float _928 = fma(_926, (*spvDescriptorSet0.vp_c9)._m0[18].w, _676);
    float _930 = -_708;
    float _932 = fma(_930, (*spvDescriptorSet0.vp_c9)._m0[18].w, _680);
    float _934 = _924;
    float _936 = _916;
    float _938 = _912;
    if (_832)
    {
        _854 = _916;
    }
    float _940 = _854;
    float _942 = _940;
    if (_832)
    {
        _856 = _920;
    }
    float _944 = _856;
    float _946 = _944;
    if (!_832)
    {
        float _948 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _950 = _928 + _948;
        float _952 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _954 = _724 + _952;
        float _956 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _958 = -_680;
        float _960 = _958 + _910;
        float _962 = _950 * _950;
        float _964 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _966 = _932 + _964;
        float _968 = -_678;
        float _970 = _968 + _908;
        float _972 = fma(_954, _954, _962);
        float _974 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _976 = fma(_966, _966, _972);
        float _978 = sqrt(_976);
        float _980 = 1.0 / _738;
        float _982 = precise::min(_978, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _984 = _982 * _956;
        float _986 = _974 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _988 = -_676;
        float _990 = _988 + _912;
        float _992 = _984 * _980;
        float _994 = _986 * _992;
        float _996 = _960 * _992;
        float _998 = fma(_970, _994, _724);
        float _1000 = fma(_990, _994, _928);
        float _1002 = fma(_986, _996, _932);
        _934 = _1000;
        _942 = _998;
        _946 = _1002;
        _936 = _978;
    }
    float _1004 = _934;
    float _1006 = _942;
    float _1008 = _946;
    float _1010 = _936;
    float _1012 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1014 = _1004 + _1012;
    float _1016 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1018 = _1006 + _1016;
    float _1020 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1022 = _1008 + _1020;
    float _1024 = _1014 * _1014;
    float _1026 = fma(_1018, _1018, _1024);
    float _1028 = fma(_1022, _1022, _1026);
    float _1030 = rsqrt(_1028);
    float _1032 = sqrt(_1028);
    float _1034 = _1030 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1036 = _1018 * _1034;
    float _1038 = _1022 * _1034;
    float _1040 = _1036 * _1036;
    float _1042 = _1038 * _1038;
    float _1044 = _1040 + _1042;
    float _1046 = sqrt(_1044);
    bool _1048 = _1046 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1050 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1052 = _1046 + _1050;
    float _1054 = _1026;
    float _1056 = _1044;
    float _1058 = _1052;
    float _1060 = _1014;
    float _1062 = _1010;
    if (_1048)
    {
        float _1064 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1054 = _1064;
    }
    float _1066 = _1054;
    if (_1048)
    {
        float _1068 = rsqrt(_1044);
        _1056 = _1068;
    }
    float _1070 = _1056;
    float _1072 = _1066;
    if (_1048)
    {
        float _1074 = _1052 * _1066;
        _1058 = _1074;
    }
    float _1076 = _1058;
    if (_1048)
    {
        float _1078 = _1076 * 0.15915493667125701904296875;
        _938 = _1078;
    }
    float _1080 = _938;
    float _1082 = _1030;
    if (_1048)
    {
        float _1084 = _1080 * 6.283185482025146484375;
        float _1086 = cos(_1084);
        _1082 = _1086;
    }
    float _1088 = _1082;
    float _1090 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1092 = precise::max(0.0, _1090);
    float _1094 = _1022;
    float _1096 = _1092;
    if (_1048)
    {
        float _1098 = _1080 * 6.283185482025146484375;
        float _1100 = sin(_1098);
        _1094 = _1100;
    }
    float _1102 = _1094;
    float _1104 = -_1034;
    float _1106 = -_1092;
    float _1108 = fma(_1014, _1104, _1106);
    if (!_1048)
    {
        _1096 = _1036;
    }
    float _1110 = _1096;
    float _1112 = _1110;
    if (_1048)
    {
        float _1114 = _1108 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1060 = _1114;
    }
    float _1116 = _1060;
    float _1118 = _1116;
    float _1120 = _1088;
    if (_1048)
    {
        float _1122 = _1088 + (-1.0);
        _1062 = _1122;
    }
    float _1124 = _1062;
    float _1126 = _1004 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1128 = _1124;
    if (_1048)
    {
        float _1130 = _1124 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1072 = _1130;
    }
    float _1132 = _1072;
    float _1134 = fma(_1006, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1126);
    float _1136 = _1102;
    float _1138 = _1132;
    if (_1048)
    {
        float _1140 = fma(_1102, _1116, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1118 = _1140;
    }
    float _1142 = _1118;
    float _1144 = _1142;
    if (!_1048)
    {
        _1136 = _1108;
    }
    float _1146 = _1136;
    float _1148 = _1146;
    if (_1048)
    {
        float _1150 = fma(_1108, _1088, _1132);
        _1148 = _1150;
    }
    float _1152 = _1148;
    if (!_1048)
    {
        _1138 = _1040;
    }
    float _1154 = _1138;
    float _1156 = _1154;
    if (_1048)
    {
        float _1158 = _1070 * _1142;
        _1128 = _1158;
    }
    float _1160 = _1128;
    if (!_1048)
    {
        _1144 = _1038;
    }
    float _1162 = _1144;
    float _1164 = _1004 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1166 = _1162;
    if (!_1048)
    {
        _1120 = _1042;
    }
    float _1168 = _1120;
    float _1170 = _1168;
    if (_1048)
    {
        float _1172 = _1036 * _1160;
        _1112 = _1172;
    }
    float _1174 = _1112;
    if (_1048)
    {
        float _1176 = _1038 * _1160;
        _1166 = _1176;
    }
    float _1178 = _1166;
    float _1180 = _1004 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1182 = fma(_1006, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1164);
    if (_1048)
    {
        float _1184 = _1174 * _1174;
        _1156 = _1184;
    }
    float _1186 = _1156;
    if (_1048)
    {
        float _1188 = _1178 * _1178;
        _1170 = _1188;
    }
    float _1190 = _1170;
    float _1192 = fma(_1006, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1180);
    float _1194 = fma(_1008, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1182);
    float _1196 = fma(_1152, _1152, _1186);
    float _1198 = _1004 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1200 = fma(_1008, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1192);
    float _1202 = _1196 + _1190;
    float _1204 = _1194 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1206 = fma(_1006, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1198);
    float _1208 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1210 = fma(_1008, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1134);
    float _1212 = _1200 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1214 = rsqrt(_1202);
    float _1216 = _1204 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1218 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1220 = fma(_1032, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1218);
    float _1222 = precise::clamp(_1220, 0.0, 1.0);
    float _1224 = fma(_1008, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1206);
    float _1226 = _1210 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1228 = fma(_1212, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1216);
    float _1230 = -_1222;
    float _1232 = _1230 + 1.0;
    float _1234 = _1224 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1236 = _1226 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1238 = fma(_1226, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1228);
    float _1240 = abs(_1232);
    float _1242 = log2(_1240);
    float _1244 = -_1236;
    float _1246 = fma(_1244, _1208, 1.0);
    float _1248 = _1214 * _1174;
    float _1250 = fma(_1234, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1238);
    float _1252 = _1214 * _1152;
    float _1254 = _1214 * _1178;
    float _1256 = _1248 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1258 = log2(_1246);
    float _1260 = _1204 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1262 = -_1256;
    float _1264 = fma(_1252, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1262);
    float _1266 = _1242 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1268 = fma(_1212, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1260);
    float _1270 = -_1254;
    float _1272 = fma(_1270, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1264);
    float _1274 = 1.0 / _1250;
    float _1276 = _1204 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1278 = _1252 + 1.0;
    float _1280 = fma(_1272, -0.5, 0.5);
    float _1282 = fma(_1272, 0.5, 0.5);
    float _1284 = fma(_1212, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1276);
    float _1286 = fma(_1226, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1268);
    float _1288 = exp2(_1266);
    float _1290 = fma(_1282, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1292 = fma(_1226, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1284);
    float _1294 = fma(_1234, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1286);
    float _1296 = _1258 * 0.693147182464599609375;
    float _1298 = fma(_1282, _1290, -0.212114393711090087890625);
    float _1300 = fma(_1234, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1292);
    float _1302 = sqrt(_1280);
    float _1304 = fma(_1282, _1298, 1.570728778839111328125);
    float _1306 = _1300 * _1274;
    float _1308 = _1294 * _1274;
    float _1310 = _1296 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1312 = fma(_1306, 0.5, 0.5);
    float _1314 = fma(_1308, -0.5, 0.5);
    float _1316 = -_1252;
    float _1318 = fma(_1288, _1278, _1316);
    float _1320 = fma(_1318, 0.5, 0.5);
    float _1322 = _1302 * 0.636619746685028076171875;
    float _1324 = -_1304;
    float _1326 = fma(_1322, _1324, 1.0);
    float3 _4336 = float3(_1312, _1314, _1310);
    float _1328 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4336, float3(0.0), isnan(_4336)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4336, float3(0.0), isnan(_4336)), level(0.0)).x;
    float3 _4347 = float3(_1312, _1314, _1310);
    float4 _1331 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4347, float3(0.0), isnan(_4347)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4347, float3(0.0), isnan(_4347)), level(0.0)).xyzw;
    float _1333 = _1331.x;
    float _1335 = _1331.y;
    float _1337 = _1331.z;
    float _1339 = _1331.w;
    float2 _4364 = float2(_1326, _1320);
    float3 _1343 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4364, float2(0.0), isnan(_4364)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4364, float2(0.0), isnan(_4364)), level(0.0)).xyz;
    float _1345 = _1343.x;
    float _1347 = _1343.y;
    float _1349 = _1343.z;
    float _1351 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _1353 = int(_1351);
    bool _1355 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1357 = isnan(0.5);
    bool _1359 = _1355 || _1357;
    bool _1361 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1363 = _1359 || _1361;
    out.m_56.x = _612;
    out.m_56.y = _614;
    out.m_56.z = _618;
    out.m_56.w = _610;
    bool _1365 = _141 > 0.5;
    float _1367 = _1204 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _1369 = abs(_848);
    out.m_58.y = _1004;
    float _1371 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1373 = int(_1371);
    float _1375 = fma(_1212, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1367);
    float _1377 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1379 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1381 = fma(_1226, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1375);
    float _1383 = float(_1353);
    float _1385 = 1.0 / _650;
    float _1387 = -_185;
    int _1389 = _1365 ? as_type<int>(_1387) : as_type<int>(_185);
    float _1391 = fma(_1234, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1381);
    int _1393 = abs(_836);
    float _1395 = float(uint(_1373));
    float _1397 = 1.0 / _1383;
    int _1399 = ~_1373;
    int _1401 = _1399 + 1;
    int _1403 = ~_1373;
    int _1405 = _1403 + 1;
    float _1407 = 1.0 / _1395;
    int _1409 = ~_1373;
    int _1411 = _1409 + 1;
    float _1413 = in.m_49.y;
    float _1415 = _121 * _1397;
    int _1417 = ~_1373;
    int _1419 = _1417 + 1;
    float _1421 = trunc(_1415);
    int _1423 = int(_1421);
    int _1425 = as_type<int>(_1407) + (-2);
    float _1427 = float(uint(_1423));
    float _1429 = as_type<float>(_1425) * _1427;
    float _1431 = trunc(_1429);
    float _1433 = precise::max(_1431, 0.0);
    uint _1435 = uint(_1433);
    int _1437 = _1411 * int(_1435);
    int _1439 = _1437 + _1423;
    float _1441 = float(uint(_1439));
    float _1443 = as_type<float>(_1425) * _1441;
    int _1445 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1447 = _1445 != 0;
    bool _1449 = !_1447;
    float _1451 = _1449 ? _1413 : _141;
    float _1453 = trunc(_1443);
    float _1455 = precise::max(_1453, 0.0);
    uint _1457 = uint(_1455);
    bool _1459 = !_1447;
    float _1461 = _1459 ? 1.2345600128173828125 : 1.0;
    float _1463 = _1461 * _1451;
    float _1465 = float(_1423);
    float _1467 = floor(_1463);
    int _1469 = int(_1435) + int(_1457);
    float _1471 = float(_1373);
    int _1473 = _1419 * _1469;
    int _1475 = _1473 + _1423;
    bool _1477 = _1465 >= _1471;
    bool _1479 = isnan(_1465);
    bool _1481 = _1477 || _1479;
    bool _1483 = isnan(_1471);
    bool _1485 = _1481 || _1483;
    float _1487 = float(_1485);
    float _1489 = _121 * _1471;
    float _1491 = -_1467;
    float _1493 = _1463 + _1491;
    int _1495 = _1373 + (-1);
    bool _1497 = uint(_1475) >= uint(_1373);
    float _1499 = _1493 * _1471;
    float _1501 = trunc(_1487);
    int _1503 = int(_1501);
    bool _1505 = !_1497;
    int _1507 = _1505 ? 0 : (-1);
    bool _1509 = _1373 == 0;
    int _1511 = ~_1469;
    int _1513 = _1511 + _1507;
    int _1515 = _1513 + 1;
    float _1517 = _1489 * _1385;
    int _1519 = _1373 * _1515;
    int _1521 = _1519 + _1423;
    float _1523 = in.m_49.z;
    int _1525 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1527 = _1525 != 0;
    float _1529 = trunc(_1517);
    int _1531 = int(_1529);
    int _1533 = ~_1503;
    int _1535 = _1533 + 1;
    int _1537 = _1535 + 1;
    float _1539 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1541 = _1539 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1543 = !_1509;
    int _1545 = _1543 ? _1521 : (-1);
    int _1547 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1549 = _1547 != 0;
    bool _1551 = !_1527;
    int _1553 = _1551 ? 0 : 1;
    int _1555 = _1545 * _1537;
    bool _1557 = _1413 > 0.5;
    float _1559 = 1.0 / _1541;
    bool _1561 = !_1549;
    float _1563 = _1561 ? _185 : as_type<float>(_1389);
    int _1565 = _1503 * _1495;
    int _1567 = _1565 + _1555;
    float _1569 = -_199;
    int _1571 = _1557 ? as_type<int>(_1569) : as_type<int>(_199);
    int _1573 = abs(_1553);
    int _1575 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1577 = _1575 != 0;
    float _1579 = trunc(_1499);
    int _1581 = int(_1579);
    int _1583 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1585 = _1583 != 0;
    int _1587 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1589 = _1587 != 0;
    bool _1591 = _1523 > 0.5;
    bool _1593 = !_1585;
    float _1595 = _1593 ? _199 : as_type<float>(_1571);
    float _1597 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1599 = -_185;
    int _1601 = _1591 ? as_type<int>(_1599) : as_type<int>(_185);
    int _1603 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1605 = _1603 != 0;
    int _1607 = _1581 * _1573;
    int _1609 = _1607 + _1423;
    int _1611 = abs(_840);
    int _1613 = _1567 * _1393;
    int _1615 = abs(_844);
    float _1617 = in.m_49.w;
    int _1619 = _1531 * _1611;
    int _1621 = _1619 + _1613;
    bool _1623 = !_1589;
    float _1625 = _1623 ? _185 : as_type<float>(_1601);
    int _1627 = _1609 * _1615;
    int _1629 = _1627 + _1621;
    float _1631 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1633 = _1631 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    int _1635 = _1581 * _1369;
    int _1637 = _1635 + _1629;
    float _1639 = 1.0 / _1633;
    float _1641 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1643 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1645 = _1643 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _1647 = _141 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1649 = float(uint(_1637));
    int _1651 = ~_1373;
    int _1653 = _1651 + 1;
    float _1655 = 1.0 / _1645;
    float _1657 = -_1641;
    float _1659 = fma(_1647, 2.0, _1657);
    float _1661 = as_type<float>(_1425) * _1649;
    float _1663 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1665 = _1413 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _1667 = _1617 > 0.5;
    float _1669 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1671 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1669;
    float _1673 = trunc(_1661);
    float _1675 = precise::max(_1673, 0.0);
    uint _1677 = uint(_1675);
    float _1679 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1681 = _1679 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1683 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1685 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _1683;
    float _1687 = _1671 * _1559;
    float _1689 = _1681 * _1639;
    float _1691 = fma(_1665, -2.0, _1663);
    float _1693 = _1685 * _1655;
    float _1695 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1697 = _1665;
    float _1699 = _1695;
    float _1701 = _1523;
    if (!_1447)
    {
        _1697 = _1413;
    }
    float _1703 = _1697;
    float _1705 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1707 = _1703;
    if (_1447)
    {
        _1707 = _141;
    }
    float _1709 = _1707;
    float _1711 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1695);
    float _1713 = -_199;
    int _1715 = _1667 ? as_type<int>(_1713) : as_type<int>(_199);
    float _1717 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _1719 = _1653 * int(_1677);
    int _1721 = _1719 + _1637;
    if (!_1447)
    {
        _1699 = _1523;
    }
    float _1723 = _1699;
    float _1725 = fma(_1413, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1705);
    float _1727 = _1723;
    if (_1447)
    {
        _1701 = _1413;
    }
    float _1729 = _1701;
    float _1731 = -_121;
    float _1733 = fma(_1731, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1659);
    float _1735 = float(uint(_1721));
    float _1737 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1711);
    if (_1447)
    {
        _1727 = _1413;
    }
    float _1739 = _1727;
    float _1741 = _1563 + 0.5;
    bool _1743 = !_1605;
    float _1745 = _1743 ? _199 : as_type<float>(_1715);
    float _1747 = as_type<float>(_1425) * _1735;
    float _1749 = _1597 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1751 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1753 = _652 + _1751;
    float _1755 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1757 = _652 + _1755;
    float _1759 = trunc(_1747);
    float _1761 = precise::max(_1759, 0.0);
    uint _1763 = uint(_1761);
    float _1765 = fma(_1749, _1741, _1733);
    float _1767 = fma(_1687, _1753, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1769 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1771 = _652 + _1769;
    float _1773 = fma(_1689, _1757, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    bool _1775 = _652 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _1777 = isnan(_652);
    bool _1779 = _1775 || _1777;
    bool _1781 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _1783 = _1779 || _1781;
    float _1785 = float(_1783);
    float _1787 = _1717 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1789 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1691);
    float _1791 = fma(_1693, _1771, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _1793 = _1595 + (-0.5);
    float _1795 = fma(_1739, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1377);
    bool _1797 = _652 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1799 = isnan(_652);
    bool _1801 = _1797 || _1799;
    bool _1803 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1805 = _1801 || _1803;
    float _1807 = float(_1805);
    float _1809 = _1729 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1811 = -_1787;
    float _1813 = -_1789;
    float _1815 = fma(_1811, _1793, _1813);
    float _1817 = float(uint(_1609));
    float _1819 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1725);
    int _1821 = int(_1677) + int(_1763);
    float _1823 = -_1785;
    float _1825 = _1823 + 1.0;
    bool _1827 = _652 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1829 = isnan(_652);
    bool _1831 = _1827 || _1829;
    bool _1833 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1835 = _1831 || _1833;
    float _1837 = float(_1835);
    float _1839 = as_type<float>(_1425) * _1817;
    bool _1841 = _652 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1843 = isnan(_652);
    bool _1845 = _1841 || _1843;
    bool _1847 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1849 = _1845 || _1847;
    float _1851 = float(_1849);
    float _1853 = _1807 * _1825;
    float _1855 = -_1807;
    float _1857 = _1855 + 1.0;
    int _1859 = _1401 * _1821;
    int _1861 = _1859 + _1637;
    float _1863 = -_1851;
    float _1865 = _1863 + 1.0;
    float _1867 = _1851 * _1857;
    float _1869 = trunc(_1839);
    float _1871 = precise::max(_1869, 0.0);
    uint _1873 = uint(_1871);
    float _1875 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1877 = _1837 * _1865;
    bool _1879 = uint(_1861) >= uint(_1373);
    float _1881 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1883 = fma(_1709, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1875);
    float _1885 = _1709 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1887 = _1767 * _1877;
    bool _1889 = !_1879;
    int _1891 = _1889 ? 0 : (-1);
    float _1893 = -_1881;
    float _1895 = fma(_1885, 2.0, _1893);
    float _1897 = fma(_1809, -2.0, _1379);
    float _1899 = -_1837;
    float _1901 = _1899 + 1.0;
    float _1903 = _928 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    int _1905 = ~_1821;
    int _1907 = _1905 + _1891;
    int _1909 = _1907 + 1;
    float _1911 = _928 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    int _1913 = _1405 * int(_1873);
    int _1915 = _1913 + _1609;
    float _1917 = fma(_1901, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1887);
    float _1919 = fma(_724, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1903);
    float _1921 = fma(_724, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1911);
    int _1923 = _1373 * _1909;
    int _1925 = _1923 + _1637;
    float _1927 = float(uint(_1915));
    float _1929 = fma(_932, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1919);
    float _1931 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1883);
    float _1933 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1795);
    float _1935 = -_121;
    float _1937 = fma(_1935, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1895);
    float _1939 = as_type<float>(_1425) * _1927;
    float _1941 = fma(_932, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1921);
    bool _1943 = !_1509;
    int _1945 = _1943 ? _1925 : (-1);
    float _1947 = _1929 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1949 = -_1737;
    float _1951 = _1949 + 1.0;
    float _1953 = _1941 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    int _1955 = _1945 >> 31;
    float _1957 = trunc(_1939);
    float _1959 = precise::max(_1957, 0.0);
    uint _1961 = uint(_1959);
    float _1963 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1897);
    float _1965 = _1625 + 0.5;
    int _1967 = _1955 & 3;
    float _1969 = -_1819;
    float _1971 = _1969 + 1.0;
    float _1973 = -_1951;
    float _1975 = fma(_1563, _1973, _1765);
    float _1977 = fma(_1965, (*spvDescriptorSet0.vp_c9)._m0[85].x, _1937);
    int _1979 = _1945 + _1967;
    float _1981 = 1.0 / _1953;
    float _1983 = _1745 + (-0.5);
    float _1985 = fma(_1595, _1971, _1815);
    int _1987 = _1979 >> 2;
    float _1989 = -_1933;
    float _1991 = _1989 + 1.0;
    float _1993 = -_1983;
    float _1995 = -_1963;
    float _1997 = fma(_1993, (*spvDescriptorSet0.vp_c9)._m0[85].y, _1995);
    int _1999 = ~_1373;
    int _2001 = _1999 + 1;
    float _2003 = -_1931;
    float _2005 = _2003 + 1.0;
    int _2007 = int(_1873) + int(_1961);
    float _2009 = _1947 + _1953;
    int _2011 = _1987 << 4;
    int _2013 = _2011 + 512;
    float _2015 = fma(_1745, _1991, _1997);
    float _2017 = as_type<float>(_1961);
    float _2019 = _1971;
    float _2021 = _1765;
    if (!_1363)
    {
        _2017 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    }
    float _2023 = _2017;
    int _2025 = _2001 * _2007;
    int _2027 = _2025 + _1609;
    uint _2029 = uint(int(uint(_2013) >> uint(2)));
    uint _2031 = uint(int(uint(int(_2029)) >> uint(2)));
    int _2033 = int(_2029) & 3;
    float _2035 = (*spvDescriptorSet0.vp_c9)._m0[int(_2031)][_2033];
    int _2037 = int(_2029) + 1;
    uint _2039 = uint(int(uint(_2037) >> uint(2)));
    int _2041 = _2037 & 3;
    float _2043 = (*spvDescriptorSet0.vp_c9)._m0[int(_2039)][_2041];
    int _2045 = _1945 & 3;
    bool _2047 = _2045 != 0;
    float _2049 = _2009 * _1981;
    float _2051 = _2049 * 0.5;
    float _2053 = -_2005;
    float _2055 = fma(_1625, _2053, _1977);
    bool _2057 = uint(_2027) >= uint(_1373);
    float _2059 = fma(_1773, _1867, _1917);
    float _2061 = _2051;
    if (!_1363)
    {
        float _2063 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _2065 = fma(_2051, _2023, _2063);
        _2061 = _2065;
    }
    float _2067 = _2061;
    int _2069 = _1945 & 3;
    bool _2071 = _2069 != 0;
    int _2073 = _2013 + 8;
    uint _2075 = uint(int(uint(_2073) >> uint(2)));
    uint _2077 = uint(int(uint(int(_2075)) >> uint(2)));
    int _2079 = int(_2075) & 3;
    float _2081 = (*spvDescriptorSet0.vp_c9)._m0[int(_2077)][_2079];
    int _2083 = int(_2075) + 1;
    uint _2085 = uint(int(uint(_2083) >> uint(2)));
    int _2087 = _2083 & 3;
    float _2089 = (*spvDescriptorSet0.vp_c9)._m0[int(_2085)][_2087];
    int _2091 = _2047 ? 0 : 1;
    out.m_60.x = _1975;
    out.m_60.y = _1985;
    out.m_60.z = _2055;
    out.m_60.w = _2015;
    bool _2093 = uint(_2069) > 1u;
    float _2095 = _2067;
    if (!_1363)
    {
        float _2097 = 1.0 / _2067;
        _2095 = _2097;
    }
    float _2099 = _2095;
    bool _2101 = !_2057;
    int _2103 = _2101 ? 0 : (-1);
    float _2105 = fma(_1791, _1853, _2059);
    int _2107 = ~_2091;
    int _2109 = _2107 + 1;
    int _2111 = _2109 + 1;
    bool _2113 = _2069 != 3;
    float _2115 = fma(_1785, (*spvDescriptorSet0.vp_c9)._m0[134].x, _2105);
    int _2117 = ~_2007;
    int _2119 = _2117 + _2103;
    int _2121 = _2119 + 1;
    bool _2123 = !_2071;
    int _2125 = _2123 ? 0 : 1;
    float _2127 = _2115 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    int _2129 = _2111;
    float _2131 = _2105;
    if (!_1363)
    {
        _2019 = (*spvDescriptorSet0.vp_c9)._m0[140].z;
    }
    float _2133 = _2019;
    int _2135 = _1373 * _2121;
    int _2137 = _2135 + _1609;
    if (!_2093)
    {
        int _2139 = ~_2091;
        int _2141 = _2139 + 1;
        _2129 = _2141;
    }
    int _2143 = _2129;
    float _2145 = _1242 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _2147 = uint(_2069) >= 2u;
    if (!_1363)
    {
        float _2149 = -_2133;
        float _2151 = _2149 + (*spvDescriptorSet0.vp_c9)._m0[140].w;
        _2021 = _2151;
    }
    float _2153 = _2021;
    int _2155 = abs(_2143);
    if (!_1363)
    {
        float _2157 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2159 = -_2133;
        float _2161 = fma(_2099, _2157, _2159);
        _2131 = _2161;
    }
    float _2163 = _2131;
    int _2165 = abs(_2125);
    float _2167 = as_type<float>(_1821);
    float _2169 = _2163;
    if (!_1363)
    {
        float _2171 = 1.0 / _2153;
        _2167 = _2171;
    }
    float _2173 = _2167;
    out.m_62.w = _2127;
    int _2175 = _2147 ? 0 : 1;
    int _2177 = ~_2155;
    int _2179 = _2177 + 1;
    int _2181 = _2179 + 1;
    int _2183 = ~_2175;
    int _2185 = _2183 + 1;
    int _2187 = _2185 + 1;
    float _2189 = exp2(_2145);
    int _2191 = _2187;
    if (_2113)
    {
        int _2193 = ~_2175;
        int _2195 = _2193 + 1;
        _2191 = _2195;
    }
    int _2197 = _2191;
    bool _2199 = _2069 != 3;
    int _2201 = ~_2165;
    int _2203 = _2201 + 1;
    int _2205 = _2203 + 1;
    int _2207 = abs(_2197);
    int _2209 = _2181 * as_type<int>(_2043);
    bool _2211 = !_2199;
    float _2213 = _2211 ? 0.0 : as_type<float>(0xffffffffu /* nan */);
    float _2215 = _2213;
    if (!_1363)
    {
        float _2217 = _2163 * _2173;
        float _2219 = precise::clamp(_2217, 0.0, 1.0);
        _2169 = _2219;
    }
    float _2221 = _2169;
    int _2223 = _2205 * as_type<int>(_2035);
    int _2225 = _2223 + _2209;
    bool _2227 = !_1577;
    int _2229 = _2227 ? 0 : 1;
    int _2231 = abs(as_type<int>(_2213));
    float _2233 = -_2189;
    float _2235 = _2233 + 1.0;
    int _2237 = abs(_2229);
    int _2239 = ~_2207;
    int _2241 = _2239 + 1;
    int _2243 = _2241 + 1;
    float _2245 = _2235 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    if (_1363)
    {
        _2215 = 1.0;
    }
    float _2247 = _2215;
    int _2249 = _2243 * as_type<int>(_2081);
    int _2251 = _2249 + _2225;
    int _2253 = ~_2231;
    int _2255 = _2253 + 1;
    int _2257 = _2255 + 1;
    float _2259 = _2247;
    if (!_1363)
    {
        float _2261 = -_2221;
        float _2263 = _2261 + 1.0;
        _2259 = _2263;
    }
    float _2265 = _2259;
    int _2267 = ~_2237;
    int _2269 = _2267 + 1;
    int _2271 = _2269 + 1;
    float _2273 = _2245 * _1328;
    float _2275 = -_2245;
    float _2277 = _2275 + 1.0;
    int _2279 = _2257 * as_type<int>(_2089);
    int _2281 = _2279 + _2251;
    float _2283 = _2265 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _2285 = !_1509;
    int _2287 = _2285 ? _2137 : (-1);
    int _2289 = _2281 * _2271;
    float _2291 = -(*spvDescriptorSet0.vp_c8)._m0[31].z;
    float _2293 = _1391 + _2291;
    float _2295 = _367 * _2283;
    bool _2297 = _2265 > 0.0;
    bool _2299 = isnan(_2265);
    bool _2301 = _2297 || _2299;
    bool _2303 = isnan(0.0);
    bool _2305 = _2301 || _2303;
    int _2307 = _2287 * _2237;
    int _2309 = _2307 + _2289;
    float _2311 = _1250 + _2293;
    float _2313 = _2295 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2315 = _1339 * _2273;
    float _2317 = _1349 * _2273;
    float _2319 = _2311 * 0.5;
    out.gl_Position.x = _1300;
    out.gl_Position.y = _1294;
    out.gl_Position.z = _2293;
    out.gl_Position.w = _1250;
    float _2321 = fma(_1345, _2315, _1333);
    float _2323 = float(_2309);
    float _2325 = fma(_1347, _2315, _1335);
    float _2327 = _1339 * _2277;
    float _2329 = fma(_1339, _2317, _1337);
    out.m_64.z = _2319;
    out.m_64.w = _1250;
    out.m_66.y = _2323;
    out.m_45.x = _2313;
    out.m_68.x = _2321;
    out.m_68.y = _2325;
    out.m_68.z = _2329;
    out.m_68.w = _2327;
    if (_2305)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_45.x = 0.0;
    float _2331 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2331;
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
    bool _642 = false;
    bool _501 = false;
    bool _389 = false;
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
        float _2388 = as_type<float>(_103);
        out.gl_Position.z = _2388;
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
        float _2456 = as_type<float>(_139);
        out.gl_Position.z = _2456;
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
    if (!_157)
    {
        float _209 = _195 * _195;
        float _211 = _209 * 0.5;
        _205 = _211;
    }
    float _213 = _205;
    float _215 = _213;
    if (!_157)
    {
        float _217 = _213 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _215 = _217;
    }
    float _219 = _215;
    bool _221 = !_157;
    float _223 = _219;
    if (!_221)
    {
        float _225 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _227 = log2(_225);
        float _229 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _231 = _229 + 1.0;
        float _233 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _235 = _195 * _227;
        float _237 = 1.0 / _231;
        float _239 = _233 * 0.693147182464599609375;
        float _241 = exp2(_235);
        float _243 = 1.0 / _239;
        float _245 = _241 + (-1.0);
        float _247 = -_245;
        float _249 = fma(_247, _243, _195);
        float _251 = _249 * _237;
        float _253 = _251 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _223 = _253;
    }
    float _255 = _223;
    bool _257 = !_157;
    if (!_257)
    {
        float _259 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _261 = log2(_259);
        float _263 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _265 = _263 + 1.0;
        float _267 = 1.0 / _265;
        float _269 = _195 * _261;
        float _271 = exp2(_269);
        float _273 = -_271;
        float _275 = _273 + 1.0;
        float _277 = _275 * _267;
        _207 = _277;
    }
    float _279 = _207;
    float _281 = in.m_54.w;
    int _283 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _285 = _283 != 0;
    int _287 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _289 = _287 != 0;
    float _291 = in.m_42.x;
    float _293 = in.m_42.y;
    float _295 = in.m_42.z;
    bool _297 = _203 < 0.5;
    float _299 = float(_297);
    float _301 = -_203;
    float _303 = fma(_301, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _305 = fma(_193, 0.5, 0.5);
    bool _307 = !_285;
    int _309 = _307 ? 0 : 1;
    float _311 = _255 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    bool _313 = !_189;
    int _315 = _313 ? 0 : 1;
    float _317 = -_299;
    float _319 = fma(_317, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _321 = abs(_309);
    float _323 = -_305;
    float _325 = fma(_323, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _327 = abs(_315);
    float _329 = fma(_279, _159, _311);
    bool _331 = !_289;
    int _333 = _331 ? 0 : 1;
    float _335 = _255 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _337 = _255 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    bool _339 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _341 = fma(_279, _161, _335);
    int _343 = abs(_333);
    float _345 = fma(_279, _163, _337);
    float _347 = float(_321);
    float _349 = float(_327);
    float _351 = abs(_303);
    float _353 = _347 * _351;
    float _355 = fma(_329, _281, _291);
    float _357 = fma(_341, _281, _293);
    float _359 = float(_343);
    float _361 = fma(_349, _325, _353);
    float _363 = fma(_345, _281, _295);
    float _365 = abs(_319);
    float _367 = fma(_359, _365, _361);
    bool _369 = !_339;
    float _371 = (*spvDescriptorSet0.vp_c9)._m0[7].x;
    float _387;
    if (!_369)
    {
        float _373 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _375 = _141 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _377 = fma(_375, (*spvDescriptorSet0.vp_c9)._m0[12].x, _121);
        float _379 = _377 * _373;
        float _381 = floor(_379);
        float _383 = -_381;
        float _385 = _379 + _383;
        _387 = _385;
        _389 = true;
    }
    else
    {
        float _391 = float(_87);
        float _393 = 1.0 / _391;
        float _395 = _121 * _393;
        _387 = _395;
    }
    _389 = false;
    float _397 = _387;
    float _399 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _401 = _397 + _399;
    float _403 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    bool _405 = _397 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _407 = isnan(_397);
    bool _409 = _405 || _407;
    bool _411 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _413 = _409 || _411;
    float _415 = float(_413);
    float _417 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _419 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _417;
    float _421 = _403 * _141;
    float _423 = -_415;
    float _425 = _423 + 1.0;
    bool _427 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _429 = 1.0 / _419;
    float _431 = trunc(_421);
    int _433 = int(_431);
    float _435 = _401 * _429;
    bool _437 = _397 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _439 = isnan(_397);
    bool _441 = _437 || _439;
    bool _443 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _445 = _441 || _443;
    float _447 = float(_445);
    float _449 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _451 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _449;
    float _453 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _455 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _453;
    float _457 = _447 * _425;
    float _459 = fma(_451, _435, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _461 = fma(_455, _435, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _463 = -_447;
    float _465 = _463 + 1.0;
    float _467 = _459 * _457;
    float _469 = _461 * _457;
    float _471 = fma(_465, (*spvDescriptorSet0.vp_c9)._m0[143].x, _467);
    float _473 = fma(_465, (*spvDescriptorSet0.vp_c9)._m0[143].y, _469);
    int _475 = _433 << 4;
    int _477 = _475 + 1712;
    float _479 = fma(_415, (*spvDescriptorSet0.vp_c9)._m0[144].x, _471);
    float _481 = fma(_415, (*spvDescriptorSet0.vp_c9)._m0[144].y, _473);
    bool _483 = !_427;
    float _499;
    if (!_483)
    {
        float _485 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _487 = _141 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _489 = fma(_487, (*spvDescriptorSet0.vp_c9)._m0[11].y, _121);
        float _491 = _489 * _485;
        float _493 = floor(_491);
        float _495 = -_493;
        float _497 = _491 + _495;
        _499 = _497;
        _501 = true;
    }
    else
    {
        float _503 = float(_87);
        float _505 = 1.0 / _503;
        float _507 = _121 * _505;
        _499 = _507;
    }
    _501 = false;
    float _509 = _499;
    uint _512 = uint(int(uint(_477) >> uint(2)));
    uint _514 = uint(int(uint(int(_512)) >> uint(2)));
    int _516 = int(_512) & 3;
    float _518 = (*spvDescriptorSet0.vp_c9)._m0[int(_514)][_516];
    int _520 = int(_512) + 1;
    uint _522 = uint(int(uint(_520) >> uint(2)));
    int _524 = _520 & 3;
    float _526 = (*spvDescriptorSet0.vp_c9)._m0[int(_522)][_524];
    float _528 = in.m_54.x;
    float _530 = in.m_54.y;
    float _532 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _534 = _509 + _532;
    bool _536 = _509 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _538 = isnan(_509);
    bool _540 = _536 || _538;
    bool _542 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _544 = _540 || _542;
    float _546 = float(_544);
    float _548 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _550 = _548 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _552 = _509 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _554 = isnan(_509);
    bool _556 = _552 || _554;
    bool _558 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _560 = _556 || _558;
    float _562 = float(_560);
    int _564 = _477 + 8;
    uint _566 = uint(int(uint(_564) >> uint(2)));
    uint _568 = uint(int(uint(int(_566)) >> uint(2)));
    int _570 = int(_566) & 3;
    float _572 = (*spvDescriptorSet0.vp_c9)._m0[int(_568)][_570];
    float _574 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _576 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _574;
    float _578 = -_546;
    float _580 = _578 + 1.0;
    bool _582 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _584 = 1.0 / _550;
    float _586 = _576 * _584;
    float _588 = fma(_586, _534, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _590 = _562 * _580;
    float _592 = _588 * _590;
    float _594 = -_562;
    float _596 = _594 + 1.0;
    float _598 = _481 * _530;
    float _600 = _479 * _528;
    float _602 = fma(_596, (*spvDescriptorSet0.vp_c9)._m0[115].x, _592);
    float _604 = fma(_546, (*spvDescriptorSet0.vp_c9)._m0[116].x, _602);
    float _606 = _518 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _608 = _526 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _610 = _604 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _612 = _606 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _614 = _608 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _616 = _572 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _618 = _616 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _620 = !_582;
    float _638;
    float _640;
    if (!_620)
    {
        float _622 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _624 = _141 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _626 = float(_87);
        float _628 = fma(_624, (*spvDescriptorSet0.vp_c9)._m0[11].w, _121);
        float _630 = _628 * _622;
        float _632 = floor(_630);
        float _634 = -_632;
        float _636 = _630 + _634;
        _638 = _626;
        _640 = _636;
        _642 = true;
    }
    else
    {
        float _644 = float(_87);
        float _646 = 1.0 / _644;
        float _648 = _121 * _646;
        _638 = _644;
        _640 = _648;
    }
    _642 = false;
    float _650 = _638;
    float _652 = _640;
    float _654 = _357 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _656 = _357 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _658 = _357 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _660 = fma(_121, 0.014999999664723873138427734375, _141);
    float _662 = fma(_355, (*spvDescriptorSet0.vp_c10)._m0[5].x, _654);
    float _664 = fma(_355, (*spvDescriptorSet0.vp_c10)._m0[4].x, _656);
    float _666 = fma(_355, (*spvDescriptorSet0.vp_c10)._m0[6].x, _658);
    float _668 = floor(_660);
    float _670 = fma(_363, (*spvDescriptorSet0.vp_c10)._m0[5].z, _662);
    float _672 = fma(_363, (*spvDescriptorSet0.vp_c10)._m0[4].z, _664);
    float _674 = fma(_363, (*spvDescriptorSet0.vp_c10)._m0[6].z, _666);
    float _676 = _670 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _678 = _672 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _680 = _674 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _682 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _684 = _676 + _682;
    float _686 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _688 = _678 + _686;
    float _690 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _692 = _680 + _690;
    float _694 = _684 * _684;
    float _696 = _668 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _698 = fma(_688, _688, _694);
    float _700 = fma(_692, _692, _698);
    float _702 = rsqrt(_700);
    float _704 = _684 * _702;
    float _706 = _688 * _702;
    float _708 = _692 * _702;
    float _710 = -_704;
    float _712 = fma(_710, (*spvDescriptorSet0.vp_c9)._m0[18].w, _684);
    float _714 = -_706;
    float _716 = fma(_714, (*spvDescriptorSet0.vp_c9)._m0[18].w, _688);
    float _718 = -_708;
    float _720 = fma(_718, (*spvDescriptorSet0.vp_c9)._m0[18].w, _692);
    float _722 = -_706;
    float _724 = fma(_722, (*spvDescriptorSet0.vp_c9)._m0[18].w, _678);
    float _726 = _712 * _712;
    float _728 = fma(_716, _716, _726);
    float _730 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _199);
    float _732 = fma(_720, _720, _728);
    float _734 = _598 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _736 = sqrt(_732);
    float _738 = _702 * _736;
    float _740 = _734 * _738;
    float _742 = _600 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _744 = _740 * _730;
    float _746 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _185);
    float _748 = _742 * _738;
    float _750 = fma(_668, -0.1500000059604644775390625, 1.0);
    float _752 = _744 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _754 = _748 * _746;
    float _756 = _738 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _758 = _756 * 0.5;
    float _760 = precise::max(_750, 0.20000000298023223876953125);
    float _762 = _744 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _764 = fma(_754, (*spvDescriptorSet0.vp_c10)._m0[10].x, _752);
    float _766 = precise::min(_760, 1.0);
    float _768 = fma(_754, (*spvDescriptorSet0.vp_c10)._m0[8].x, _762);
    float _770 = fma(_758, (*spvDescriptorSet0.vp_c10)._m0[10].z, _764);
    float _772 = fma(_758, (*spvDescriptorSet0.vp_c10)._m0[8].z, _768);
    float _774 = fma(_770, _766, _680);
    float _776 = fma(_772, _766, _678);
    float _778 = fma(_696, (*spvDescriptorSet0.vp_c10)._m0[10].y, _774);
    float _780 = fma(_696, (*spvDescriptorSet0.vp_c10)._m0[8].y, _776);
    float _782 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _784 = _778 + _782;
    float _786 = _744 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _788 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _790 = _780 + _788;
    float _792 = _784 * _784;
    float _794 = fma(_754, (*spvDescriptorSet0.vp_c10)._m0[9].x, _786);
    float _796 = fma(_790, _790, _792);
    float _798 = fma(_758, (*spvDescriptorSet0.vp_c10)._m0[9].z, _794);
    float _800 = sqrt(_796);
    float _802 = fma(_798, _766, _676);
    float _804 = fma(_696, (*spvDescriptorSet0.vp_c10)._m0[9].y, _802);
    bool _806 = _800 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _808 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _810 = _808 != 0;
    int _812 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _814 = _812 != 0;
    int _816 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _818 = _816 != 0;
    int _820 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _822 = _820 != 0;
    bool _824 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _826 = isnan(0.5);
    bool _828 = _824 || _826;
    bool _830 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _832 = _828 || _830;
    bool _834 = !_814;
    int _836 = _834 ? 0 : 1;
    bool _838 = !_810;
    int _840 = _838 ? 0 : 1;
    bool _842 = !_818;
    int _844 = _842 ? 0 : 1;
    bool _846 = !_822;
    int _848 = _846 ? 0 : 1;
    float _850 = _802;
    float _852 = _758;
    float _854 = _708;
    float _856 = _704;
    if (!_806)
    {
        _850 = _780;
    }
    float _858 = _850;
    float _860 = _858;
    if (!_806)
    {
        _371 = _778;
    }
    float _862 = _371;
    float _864 = _862;
    if (!_806)
    {
        _852 = _804;
    }
    float _866 = _852;
    bool _868 = !_806;
    float _870 = _866;
    if (!_868)
    {
        float _872 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _874 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _876 = _800 + _874;
        float _878 = rsqrt(_796);
        float _880 = _876 * _872;
        float _882 = _804 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _884 = _880 * 0.15915493667125701904296875;
        float _886 = _884 * 6.283185482025146484375;
        float _888 = cos(_886);
        float _890 = _884 * 6.283185482025146484375;
        float _892 = sin(_890);
        float _894 = _888 + (-1.0);
        float _896 = _894 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _898 = fma(_892, _882, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _900 = fma(_804, _888, _896);
        float _902 = _878 * _898;
        float _904 = fma(_790, _902, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _906 = fma(_784, _902, (*spvDescriptorSet0.vp_c15)._m0[0].z);
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
    float _928 = fma(_926, (*spvDescriptorSet0.vp_c9)._m0[18].w, _676);
    float _930 = -_708;
    float _932 = fma(_930, (*spvDescriptorSet0.vp_c9)._m0[18].w, _680);
    float _934 = _924;
    float _936 = _916;
    float _938 = _912;
    if (_832)
    {
        _854 = _916;
    }
    float _940 = _854;
    float _942 = _940;
    if (_832)
    {
        _856 = _920;
    }
    float _944 = _856;
    float _946 = _944;
    if (!_832)
    {
        float _948 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _950 = _928 + _948;
        float _952 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _954 = _724 + _952;
        float _956 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _958 = -_680;
        float _960 = _958 + _910;
        float _962 = _950 * _950;
        float _964 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _966 = _932 + _964;
        float _968 = -_678;
        float _970 = _968 + _908;
        float _972 = fma(_954, _954, _962);
        float _974 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _976 = fma(_966, _966, _972);
        float _978 = sqrt(_976);
        float _980 = 1.0 / _738;
        float _982 = precise::min(_978, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _984 = _982 * _956;
        float _986 = _974 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _988 = -_676;
        float _990 = _988 + _912;
        float _992 = _984 * _980;
        float _994 = _986 * _992;
        float _996 = _960 * _992;
        float _998 = fma(_970, _994, _724);
        float _1000 = fma(_990, _994, _928);
        float _1002 = fma(_986, _996, _932);
        _934 = _1000;
        _942 = _998;
        _946 = _1002;
        _936 = _978;
    }
    float _1004 = _934;
    float _1006 = _942;
    float _1008 = _946;
    float _1010 = _936;
    float _1012 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1014 = _1004 + _1012;
    float _1016 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1018 = _1006 + _1016;
    float _1020 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1022 = _1008 + _1020;
    float _1024 = _1014 * _1014;
    float _1026 = fma(_1018, _1018, _1024);
    float _1028 = fma(_1022, _1022, _1026);
    float _1030 = rsqrt(_1028);
    float _1032 = sqrt(_1028);
    float _1034 = _1030 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1036 = _1018 * _1034;
    float _1038 = _1022 * _1034;
    float _1040 = _1036 * _1036;
    float _1042 = _1038 * _1038;
    float _1044 = _1040 + _1042;
    float _1046 = sqrt(_1044);
    bool _1048 = _1046 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1050 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1052 = _1046 + _1050;
    float _1054 = _1026;
    float _1056 = _1044;
    float _1058 = _1052;
    float _1060 = _1014;
    float _1062 = _1010;
    if (_1048)
    {
        float _1064 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1054 = _1064;
    }
    float _1066 = _1054;
    if (_1048)
    {
        float _1068 = rsqrt(_1044);
        _1056 = _1068;
    }
    float _1070 = _1056;
    float _1072 = _1066;
    if (_1048)
    {
        float _1074 = _1052 * _1066;
        _1058 = _1074;
    }
    float _1076 = _1058;
    if (_1048)
    {
        float _1078 = _1076 * 0.15915493667125701904296875;
        _938 = _1078;
    }
    float _1080 = _938;
    float _1082 = _1030;
    if (_1048)
    {
        float _1084 = _1080 * 6.283185482025146484375;
        float _1086 = cos(_1084);
        _1082 = _1086;
    }
    float _1088 = _1082;
    float _1090 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1092 = precise::max(0.0, _1090);
    float _1094 = _1022;
    float _1096 = _1092;
    if (_1048)
    {
        float _1098 = _1080 * 6.283185482025146484375;
        float _1100 = sin(_1098);
        _1094 = _1100;
    }
    float _1102 = _1094;
    float _1104 = -_1034;
    float _1106 = -_1092;
    float _1108 = fma(_1014, _1104, _1106);
    if (!_1048)
    {
        _1096 = _1036;
    }
    float _1110 = _1096;
    float _1112 = _1110;
    if (_1048)
    {
        float _1114 = _1108 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1060 = _1114;
    }
    float _1116 = _1060;
    float _1118 = _1116;
    float _1120 = _1088;
    if (_1048)
    {
        float _1122 = _1088 + (-1.0);
        _1062 = _1122;
    }
    float _1124 = _1062;
    float _1126 = _1004 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1128 = _1124;
    if (_1048)
    {
        float _1130 = _1124 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1072 = _1130;
    }
    float _1132 = _1072;
    float _1134 = fma(_1006, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1126);
    float _1136 = _1102;
    float _1138 = _1132;
    if (_1048)
    {
        float _1140 = fma(_1102, _1116, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1118 = _1140;
    }
    float _1142 = _1118;
    float _1144 = _1142;
    if (!_1048)
    {
        _1136 = _1108;
    }
    float _1146 = _1136;
    float _1148 = _1146;
    if (_1048)
    {
        float _1150 = fma(_1108, _1088, _1132);
        _1148 = _1150;
    }
    float _1152 = _1148;
    if (!_1048)
    {
        _1138 = _1040;
    }
    float _1154 = _1138;
    float _1156 = _1154;
    if (_1048)
    {
        float _1158 = _1070 * _1142;
        _1128 = _1158;
    }
    float _1160 = _1128;
    if (!_1048)
    {
        _1144 = _1038;
    }
    float _1162 = _1144;
    float _1164 = _1004 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1166 = _1162;
    if (!_1048)
    {
        _1120 = _1042;
    }
    float _1168 = _1120;
    float _1170 = _1168;
    if (_1048)
    {
        float _1172 = _1036 * _1160;
        _1112 = _1172;
    }
    float _1174 = _1112;
    if (_1048)
    {
        float _1176 = _1038 * _1160;
        _1166 = _1176;
    }
    float _1178 = _1166;
    float _1180 = _1004 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1182 = fma(_1006, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1164);
    if (_1048)
    {
        float _1184 = _1174 * _1174;
        _1156 = _1184;
    }
    float _1186 = _1156;
    if (_1048)
    {
        float _1188 = _1178 * _1178;
        _1170 = _1188;
    }
    float _1190 = _1170;
    float _1192 = fma(_1006, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1180);
    float _1194 = fma(_1008, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1182);
    float _1196 = fma(_1152, _1152, _1186);
    float _1198 = _1004 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1200 = fma(_1008, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1192);
    float _1202 = _1196 + _1190;
    float _1204 = _1194 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1206 = fma(_1006, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1198);
    float _1208 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1210 = fma(_1008, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1134);
    float _1212 = _1200 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1214 = rsqrt(_1202);
    float _1216 = _1204 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1218 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1220 = fma(_1032, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1218);
    float _1222 = precise::clamp(_1220, 0.0, 1.0);
    float _1224 = fma(_1008, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1206);
    float _1226 = _1210 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1228 = fma(_1212, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1216);
    float _1230 = -_1222;
    float _1232 = _1230 + 1.0;
    float _1234 = _1224 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1236 = _1226 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1238 = fma(_1226, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1228);
    float _1240 = abs(_1232);
    float _1242 = log2(_1240);
    float _1244 = -_1236;
    float _1246 = fma(_1244, _1208, 1.0);
    float _1248 = _1214 * _1174;
    float _1250 = fma(_1234, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1238);
    float _1252 = _1214 * _1152;
    float _1254 = _1214 * _1178;
    float _1256 = _1248 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1258 = log2(_1246);
    float _1260 = _1204 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1262 = -_1256;
    float _1264 = fma(_1252, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1262);
    float _1266 = _1242 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1268 = fma(_1212, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1260);
    float _1270 = -_1254;
    float _1272 = fma(_1270, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1264);
    float _1274 = 1.0 / _1250;
    float _1276 = _1204 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1278 = _1252 + 1.0;
    float _1280 = fma(_1272, -0.5, 0.5);
    float _1282 = fma(_1272, 0.5, 0.5);
    float _1284 = fma(_1212, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1276);
    float _1286 = fma(_1226, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1268);
    float _1288 = exp2(_1266);
    float _1290 = fma(_1282, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1292 = fma(_1226, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1284);
    float _1294 = fma(_1234, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1286);
    float _1296 = _1258 * 0.693147182464599609375;
    float _1298 = fma(_1282, _1290, -0.212114393711090087890625);
    float _1300 = fma(_1234, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1292);
    float _1302 = sqrt(_1280);
    float _1304 = fma(_1282, _1298, 1.570728778839111328125);
    float _1306 = _1300 * _1274;
    float _1308 = _1294 * _1274;
    float _1310 = _1296 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1312 = fma(_1306, 0.5, 0.5);
    float _1314 = fma(_1308, -0.5, 0.5);
    float _1316 = -_1252;
    float _1318 = fma(_1288, _1278, _1316);
    float _1320 = fma(_1318, 0.5, 0.5);
    float _1322 = _1302 * 0.636619746685028076171875;
    float _1324 = -_1304;
    float _1326 = fma(_1322, _1324, 1.0);
    float3 _4336 = float3(_1312, _1314, _1310);
    float _1328 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4336, float3(0.0), isnan(_4336)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4336, float3(0.0), isnan(_4336)), level(0.0)).x;
    float3 _4347 = float3(_1312, _1314, _1310);
    float4 _1331 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4347, float3(0.0), isnan(_4347)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4347, float3(0.0), isnan(_4347)), level(0.0)).xyzw;
    float _1333 = _1331.x;
    float _1335 = _1331.y;
    float _1337 = _1331.z;
    float _1339 = _1331.w;
    float2 _4364 = float2(_1326, _1320);
    float3 _1343 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4364, float2(0.0), isnan(_4364)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4364, float2(0.0), isnan(_4364)), level(0.0)).xyz;
    float _1345 = _1343.x;
    float _1347 = _1343.y;
    float _1349 = _1343.z;
    float _1351 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _1353 = int(_1351);
    bool _1355 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1357 = isnan(0.5);
    bool _1359 = _1355 || _1357;
    bool _1361 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1363 = _1359 || _1361;
    out.m_56.x = _612;
    out.m_56.y = _614;
    out.m_56.z = _618;
    out.m_56.w = _610;
    bool _1365 = _141 > 0.5;
    float _1367 = _1204 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _1369 = abs(_848);
    out.m_58.y = _1004;
    float _1371 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1373 = int(_1371);
    float _1375 = fma(_1212, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1367);
    float _1377 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1379 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1381 = fma(_1226, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1375);
    float _1383 = float(_1353);
    float _1385 = 1.0 / _650;
    float _1387 = -_185;
    int _1389 = _1365 ? as_type<int>(_1387) : as_type<int>(_185);
    float _1391 = fma(_1234, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1381);
    int _1393 = abs(_836);
    float _1395 = float(uint(_1373));
    float _1397 = 1.0 / _1383;
    int _1399 = ~_1373;
    int _1401 = _1399 + 1;
    int _1403 = ~_1373;
    int _1405 = _1403 + 1;
    float _1407 = 1.0 / _1395;
    int _1409 = ~_1373;
    int _1411 = _1409 + 1;
    float _1413 = in.m_49.y;
    float _1415 = _121 * _1397;
    int _1417 = ~_1373;
    int _1419 = _1417 + 1;
    float _1421 = trunc(_1415);
    int _1423 = int(_1421);
    int _1425 = as_type<int>(_1407) + (-2);
    float _1427 = float(uint(_1423));
    float _1429 = as_type<float>(_1425) * _1427;
    float _1431 = trunc(_1429);
    float _1433 = precise::max(_1431, 0.0);
    uint _1435 = uint(_1433);
    int _1437 = _1411 * int(_1435);
    int _1439 = _1437 + _1423;
    float _1441 = float(uint(_1439));
    float _1443 = as_type<float>(_1425) * _1441;
    int _1445 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1447 = _1445 != 0;
    bool _1449 = !_1447;
    float _1451 = _1449 ? _1413 : _141;
    float _1453 = trunc(_1443);
    float _1455 = precise::max(_1453, 0.0);
    uint _1457 = uint(_1455);
    bool _1459 = !_1447;
    float _1461 = _1459 ? 1.2345600128173828125 : 1.0;
    float _1463 = _1461 * _1451;
    float _1465 = float(_1423);
    float _1467 = floor(_1463);
    int _1469 = int(_1435) + int(_1457);
    float _1471 = float(_1373);
    int _1473 = _1419 * _1469;
    int _1475 = _1473 + _1423;
    bool _1477 = _1465 >= _1471;
    bool _1479 = isnan(_1465);
    bool _1481 = _1477 || _1479;
    bool _1483 = isnan(_1471);
    bool _1485 = _1481 || _1483;
    float _1487 = float(_1485);
    float _1489 = _121 * _1471;
    float _1491 = -_1467;
    float _1493 = _1463 + _1491;
    int _1495 = _1373 + (-1);
    bool _1497 = uint(_1475) >= uint(_1373);
    float _1499 = _1493 * _1471;
    float _1501 = trunc(_1487);
    int _1503 = int(_1501);
    bool _1505 = !_1497;
    int _1507 = _1505 ? 0 : (-1);
    bool _1509 = _1373 == 0;
    int _1511 = ~_1469;
    int _1513 = _1511 + _1507;
    int _1515 = _1513 + 1;
    float _1517 = _1489 * _1385;
    int _1519 = _1373 * _1515;
    int _1521 = _1519 + _1423;
    float _1523 = in.m_49.z;
    int _1525 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1527 = _1525 != 0;
    float _1529 = trunc(_1517);
    int _1531 = int(_1529);
    int _1533 = ~_1503;
    int _1535 = _1533 + 1;
    int _1537 = _1535 + 1;
    float _1539 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1541 = _1539 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1543 = !_1509;
    int _1545 = _1543 ? _1521 : (-1);
    int _1547 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1549 = _1547 != 0;
    bool _1551 = !_1527;
    int _1553 = _1551 ? 0 : 1;
    int _1555 = _1545 * _1537;
    bool _1557 = _1413 > 0.5;
    float _1559 = 1.0 / _1541;
    bool _1561 = !_1549;
    float _1563 = _1561 ? _185 : as_type<float>(_1389);
    int _1565 = _1503 * _1495;
    int _1567 = _1565 + _1555;
    float _1569 = -_199;
    int _1571 = _1557 ? as_type<int>(_1569) : as_type<int>(_199);
    int _1573 = abs(_1553);
    int _1575 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1577 = _1575 != 0;
    float _1579 = trunc(_1499);
    int _1581 = int(_1579);
    int _1583 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1585 = _1583 != 0;
    int _1587 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1589 = _1587 != 0;
    bool _1591 = _1523 > 0.5;
    bool _1593 = !_1585;
    float _1595 = _1593 ? _199 : as_type<float>(_1571);
    float _1597 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1599 = -_185;
    int _1601 = _1591 ? as_type<int>(_1599) : as_type<int>(_185);
    int _1603 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1605 = _1603 != 0;
    int _1607 = _1581 * _1573;
    int _1609 = _1607 + _1423;
    int _1611 = abs(_840);
    int _1613 = _1567 * _1393;
    int _1615 = abs(_844);
    float _1617 = in.m_49.w;
    int _1619 = _1531 * _1611;
    int _1621 = _1619 + _1613;
    bool _1623 = !_1589;
    float _1625 = _1623 ? _185 : as_type<float>(_1601);
    int _1627 = _1609 * _1615;
    int _1629 = _1627 + _1621;
    float _1631 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1633 = _1631 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    int _1635 = _1581 * _1369;
    int _1637 = _1635 + _1629;
    float _1639 = 1.0 / _1633;
    float _1641 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1643 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1645 = _1643 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _1647 = _141 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1649 = float(uint(_1637));
    int _1651 = ~_1373;
    int _1653 = _1651 + 1;
    float _1655 = 1.0 / _1645;
    float _1657 = -_1641;
    float _1659 = fma(_1647, 2.0, _1657);
    float _1661 = as_type<float>(_1425) * _1649;
    float _1663 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1665 = _1413 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _1667 = _1617 > 0.5;
    float _1669 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1671 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1669;
    float _1673 = trunc(_1661);
    float _1675 = precise::max(_1673, 0.0);
    uint _1677 = uint(_1675);
    float _1679 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1681 = _1679 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1683 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1685 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _1683;
    float _1687 = _1671 * _1559;
    float _1689 = _1681 * _1639;
    float _1691 = fma(_1665, -2.0, _1663);
    float _1693 = _1685 * _1655;
    float _1695 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1697 = _1665;
    float _1699 = _1695;
    float _1701 = _1523;
    if (!_1447)
    {
        _1697 = _1413;
    }
    float _1703 = _1697;
    float _1705 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1707 = _1703;
    if (_1447)
    {
        _1707 = _141;
    }
    float _1709 = _1707;
    float _1711 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1695);
    float _1713 = -_199;
    int _1715 = _1667 ? as_type<int>(_1713) : as_type<int>(_199);
    float _1717 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _1719 = _1653 * int(_1677);
    int _1721 = _1719 + _1637;
    if (!_1447)
    {
        _1699 = _1523;
    }
    float _1723 = _1699;
    float _1725 = fma(_1413, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1705);
    float _1727 = _1723;
    if (_1447)
    {
        _1701 = _1413;
    }
    float _1729 = _1701;
    float _1731 = -_121;
    float _1733 = fma(_1731, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1659);
    float _1735 = float(uint(_1721));
    float _1737 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1711);
    if (_1447)
    {
        _1727 = _1413;
    }
    float _1739 = _1727;
    float _1741 = _1563 + 0.5;
    bool _1743 = !_1605;
    float _1745 = _1743 ? _199 : as_type<float>(_1715);
    float _1747 = as_type<float>(_1425) * _1735;
    float _1749 = _1597 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1751 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1753 = _652 + _1751;
    float _1755 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1757 = _652 + _1755;
    float _1759 = trunc(_1747);
    float _1761 = precise::max(_1759, 0.0);
    uint _1763 = uint(_1761);
    float _1765 = fma(_1749, _1741, _1733);
    float _1767 = fma(_1687, _1753, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1769 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1771 = _652 + _1769;
    float _1773 = fma(_1689, _1757, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    bool _1775 = _652 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _1777 = isnan(_652);
    bool _1779 = _1775 || _1777;
    bool _1781 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _1783 = _1779 || _1781;
    float _1785 = float(_1783);
    float _1787 = _1717 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1789 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1691);
    float _1791 = fma(_1693, _1771, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _1793 = _1595 + (-0.5);
    float _1795 = fma(_1739, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1377);
    bool _1797 = _652 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1799 = isnan(_652);
    bool _1801 = _1797 || _1799;
    bool _1803 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1805 = _1801 || _1803;
    float _1807 = float(_1805);
    float _1809 = _1729 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1811 = -_1787;
    float _1813 = -_1789;
    float _1815 = fma(_1811, _1793, _1813);
    float _1817 = float(uint(_1609));
    float _1819 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1725);
    int _1821 = int(_1677) + int(_1763);
    float _1823 = -_1785;
    float _1825 = _1823 + 1.0;
    bool _1827 = _652 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1829 = isnan(_652);
    bool _1831 = _1827 || _1829;
    bool _1833 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1835 = _1831 || _1833;
    float _1837 = float(_1835);
    float _1839 = as_type<float>(_1425) * _1817;
    bool _1841 = _652 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1843 = isnan(_652);
    bool _1845 = _1841 || _1843;
    bool _1847 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1849 = _1845 || _1847;
    float _1851 = float(_1849);
    float _1853 = _1807 * _1825;
    float _1855 = -_1807;
    float _1857 = _1855 + 1.0;
    int _1859 = _1401 * _1821;
    int _1861 = _1859 + _1637;
    float _1863 = -_1851;
    float _1865 = _1863 + 1.0;
    float _1867 = _1851 * _1857;
    float _1869 = trunc(_1839);
    float _1871 = precise::max(_1869, 0.0);
    uint _1873 = uint(_1871);
    float _1875 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1877 = _1837 * _1865;
    bool _1879 = uint(_1861) >= uint(_1373);
    float _1881 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1883 = fma(_1709, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1875);
    float _1885 = _1709 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1887 = _1767 * _1877;
    bool _1889 = !_1879;
    int _1891 = _1889 ? 0 : (-1);
    float _1893 = -_1881;
    float _1895 = fma(_1885, 2.0, _1893);
    float _1897 = fma(_1809, -2.0, _1379);
    float _1899 = -_1837;
    float _1901 = _1899 + 1.0;
    float _1903 = _928 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    int _1905 = ~_1821;
    int _1907 = _1905 + _1891;
    int _1909 = _1907 + 1;
    float _1911 = _928 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    int _1913 = _1405 * int(_1873);
    int _1915 = _1913 + _1609;
    float _1917 = fma(_1901, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1887);
    float _1919 = fma(_724, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1903);
    float _1921 = fma(_724, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1911);
    int _1923 = _1373 * _1909;
    int _1925 = _1923 + _1637;
    float _1927 = float(uint(_1915));
    float _1929 = fma(_932, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1919);
    float _1931 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1883);
    float _1933 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1795);
    float _1935 = -_121;
    float _1937 = fma(_1935, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1895);
    float _1939 = as_type<float>(_1425) * _1927;
    float _1941 = fma(_932, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1921);
    bool _1943 = !_1509;
    int _1945 = _1943 ? _1925 : (-1);
    float _1947 = _1929 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1949 = -_1737;
    float _1951 = _1949 + 1.0;
    float _1953 = _1941 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    int _1955 = _1945 >> 31;
    float _1957 = trunc(_1939);
    float _1959 = precise::max(_1957, 0.0);
    uint _1961 = uint(_1959);
    float _1963 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1897);
    float _1965 = _1625 + 0.5;
    int _1967 = _1955 & 3;
    float _1969 = -_1819;
    float _1971 = _1969 + 1.0;
    float _1973 = -_1951;
    float _1975 = fma(_1563, _1973, _1765);
    float _1977 = fma(_1965, (*spvDescriptorSet0.vp_c9)._m0[85].x, _1937);
    int _1979 = _1945 + _1967;
    float _1981 = 1.0 / _1953;
    float _1983 = _1745 + (-0.5);
    float _1985 = fma(_1595, _1971, _1815);
    int _1987 = _1979 >> 2;
    float _1989 = -_1933;
    float _1991 = _1989 + 1.0;
    float _1993 = -_1983;
    float _1995 = -_1963;
    float _1997 = fma(_1993, (*spvDescriptorSet0.vp_c9)._m0[85].y, _1995);
    int _1999 = ~_1373;
    int _2001 = _1999 + 1;
    float _2003 = -_1931;
    float _2005 = _2003 + 1.0;
    int _2007 = int(_1873) + int(_1961);
    float _2009 = _1947 + _1953;
    int _2011 = _1987 << 4;
    int _2013 = _2011 + 512;
    float _2015 = fma(_1745, _1991, _1997);
    float _2017 = as_type<float>(_1961);
    float _2019 = _1971;
    float _2021 = _1765;
    if (!_1363)
    {
        _2017 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    }
    float _2023 = _2017;
    int _2025 = _2001 * _2007;
    int _2027 = _2025 + _1609;
    uint _2029 = uint(int(uint(_2013) >> uint(2)));
    uint _2031 = uint(int(uint(int(_2029)) >> uint(2)));
    int _2033 = int(_2029) & 3;
    float _2035 = (*spvDescriptorSet0.vp_c9)._m0[int(_2031)][_2033];
    int _2037 = int(_2029) + 1;
    uint _2039 = uint(int(uint(_2037) >> uint(2)));
    int _2041 = _2037 & 3;
    float _2043 = (*spvDescriptorSet0.vp_c9)._m0[int(_2039)][_2041];
    int _2045 = _1945 & 3;
    bool _2047 = _2045 != 0;
    float _2049 = _2009 * _1981;
    float _2051 = _2049 * 0.5;
    float _2053 = -_2005;
    float _2055 = fma(_1625, _2053, _1977);
    bool _2057 = uint(_2027) >= uint(_1373);
    float _2059 = fma(_1773, _1867, _1917);
    float _2061 = _2051;
    if (!_1363)
    {
        float _2063 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _2065 = fma(_2051, _2023, _2063);
        _2061 = _2065;
    }
    float _2067 = _2061;
    int _2069 = _1945 & 3;
    bool _2071 = _2069 != 0;
    int _2073 = _2013 + 8;
    uint _2075 = uint(int(uint(_2073) >> uint(2)));
    uint _2077 = uint(int(uint(int(_2075)) >> uint(2)));
    int _2079 = int(_2075) & 3;
    float _2081 = (*spvDescriptorSet0.vp_c9)._m0[int(_2077)][_2079];
    int _2083 = int(_2075) + 1;
    uint _2085 = uint(int(uint(_2083) >> uint(2)));
    int _2087 = _2083 & 3;
    float _2089 = (*spvDescriptorSet0.vp_c9)._m0[int(_2085)][_2087];
    int _2091 = _2047 ? 0 : 1;
    out.m_60.x = _1975;
    out.m_60.y = _1985;
    out.m_60.z = _2055;
    out.m_60.w = _2015;
    bool _2093 = uint(_2069) > 1u;
    float _2095 = _2067;
    if (!_1363)
    {
        float _2097 = 1.0 / _2067;
        _2095 = _2097;
    }
    float _2099 = _2095;
    bool _2101 = !_2057;
    int _2103 = _2101 ? 0 : (-1);
    float _2105 = fma(_1791, _1853, _2059);
    int _2107 = ~_2091;
    int _2109 = _2107 + 1;
    int _2111 = _2109 + 1;
    bool _2113 = _2069 != 3;
    float _2115 = fma(_1785, (*spvDescriptorSet0.vp_c9)._m0[134].x, _2105);
    int _2117 = ~_2007;
    int _2119 = _2117 + _2103;
    int _2121 = _2119 + 1;
    bool _2123 = !_2071;
    int _2125 = _2123 ? 0 : 1;
    float _2127 = _2115 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    int _2129 = _2111;
    float _2131 = _2105;
    if (!_1363)
    {
        _2019 = (*spvDescriptorSet0.vp_c9)._m0[140].z;
    }
    float _2133 = _2019;
    int _2135 = _1373 * _2121;
    int _2137 = _2135 + _1609;
    if (!_2093)
    {
        int _2139 = ~_2091;
        int _2141 = _2139 + 1;
        _2129 = _2141;
    }
    int _2143 = _2129;
    float _2145 = _1242 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _2147 = uint(_2069) >= 2u;
    if (!_1363)
    {
        float _2149 = -_2133;
        float _2151 = _2149 + (*spvDescriptorSet0.vp_c9)._m0[140].w;
        _2021 = _2151;
    }
    float _2153 = _2021;
    int _2155 = abs(_2143);
    if (!_1363)
    {
        float _2157 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2159 = -_2133;
        float _2161 = fma(_2099, _2157, _2159);
        _2131 = _2161;
    }
    float _2163 = _2131;
    int _2165 = abs(_2125);
    float _2167 = as_type<float>(_1821);
    float _2169 = _2163;
    if (!_1363)
    {
        float _2171 = 1.0 / _2153;
        _2167 = _2171;
    }
    float _2173 = _2167;
    out.m_62.w = _2127;
    int _2175 = _2147 ? 0 : 1;
    int _2177 = ~_2155;
    int _2179 = _2177 + 1;
    int _2181 = _2179 + 1;
    int _2183 = ~_2175;
    int _2185 = _2183 + 1;
    int _2187 = _2185 + 1;
    float _2189 = exp2(_2145);
    int _2191 = _2187;
    if (_2113)
    {
        int _2193 = ~_2175;
        int _2195 = _2193 + 1;
        _2191 = _2195;
    }
    int _2197 = _2191;
    bool _2199 = _2069 != 3;
    int _2201 = ~_2165;
    int _2203 = _2201 + 1;
    int _2205 = _2203 + 1;
    int _2207 = abs(_2197);
    int _2209 = _2181 * as_type<int>(_2043);
    bool _2211 = !_2199;
    float _2213 = _2211 ? 0.0 : as_type<float>(0xffffffffu /* nan */);
    float _2215 = _2213;
    if (!_1363)
    {
        float _2217 = _2163 * _2173;
        float _2219 = precise::clamp(_2217, 0.0, 1.0);
        _2169 = _2219;
    }
    float _2221 = _2169;
    int _2223 = _2205 * as_type<int>(_2035);
    int _2225 = _2223 + _2209;
    bool _2227 = !_1577;
    int _2229 = _2227 ? 0 : 1;
    int _2231 = abs(as_type<int>(_2213));
    float _2233 = -_2189;
    float _2235 = _2233 + 1.0;
    int _2237 = abs(_2229);
    int _2239 = ~_2207;
    int _2241 = _2239 + 1;
    int _2243 = _2241 + 1;
    float _2245 = _2235 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    if (_1363)
    {
        _2215 = 1.0;
    }
    float _2247 = _2215;
    int _2249 = _2243 * as_type<int>(_2081);
    int _2251 = _2249 + _2225;
    int _2253 = ~_2231;
    int _2255 = _2253 + 1;
    int _2257 = _2255 + 1;
    float _2259 = _2247;
    if (!_1363)
    {
        float _2261 = -_2221;
        float _2263 = _2261 + 1.0;
        _2259 = _2263;
    }
    float _2265 = _2259;
    int _2267 = ~_2237;
    int _2269 = _2267 + 1;
    int _2271 = _2269 + 1;
    float _2273 = _2245 * _1328;
    float _2275 = -_2245;
    float _2277 = _2275 + 1.0;
    int _2279 = _2257 * as_type<int>(_2089);
    int _2281 = _2279 + _2251;
    float _2283 = _2265 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _2285 = !_1509;
    int _2287 = _2285 ? _2137 : (-1);
    int _2289 = _2281 * _2271;
    float _2291 = -(*spvDescriptorSet0.vp_c8)._m0[31].z;
    float _2293 = _1391 + _2291;
    float _2295 = _367 * _2283;
    bool _2297 = _2265 > 0.0;
    bool _2299 = isnan(_2265);
    bool _2301 = _2297 || _2299;
    bool _2303 = isnan(0.0);
    bool _2305 = _2301 || _2303;
    int _2307 = _2287 * _2237;
    int _2309 = _2307 + _2289;
    float _2311 = _1250 + _2293;
    float _2313 = _2295 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2315 = _1339 * _2273;
    float _2317 = _1349 * _2273;
    float _2319 = _2311 * 0.5;
    out.gl_Position.x = _1300;
    out.gl_Position.y = _1294;
    out.gl_Position.z = _2293;
    out.gl_Position.w = _1250;
    float _2321 = fma(_1345, _2315, _1333);
    float _2323 = float(_2309);
    float _2325 = fma(_1347, _2315, _1335);
    float _2327 = _1339 * _2277;
    float _2329 = fma(_1339, _2317, _1337);
    out.m_64.z = _2319;
    out.m_64.w = _1250;
    out.m_66.y = _2323;
    out.m_45.x = _2313;
    out.m_68.x = _2321;
    out.m_68.y = _2325;
    out.m_68.z = _2329;
    out.m_68.w = _2327;
    if (_2305)
    {
        return out;
    }
    out.m_45.x = 0.0;
    float _2331 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2331;
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
    bool _642 = false;
    bool _501 = false;
    bool _389 = false;
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
        float _2388 = as_type<float>(_103);
        out.gl_Position.z = _2388;
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
        float _2456 = as_type<float>(_139);
        out.gl_Position.z = _2456;
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
    if (!_157)
    {
        float _209 = _195 * _195;
        float _211 = _209 * 0.5;
        _205 = _211;
    }
    float _213 = _205;
    float _215 = _213;
    if (!_157)
    {
        float _217 = _213 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _215 = _217;
    }
    float _219 = _215;
    bool _221 = !_157;
    float _223 = _219;
    if (!_221)
    {
        float _225 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _227 = log2(_225);
        float _229 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _231 = _229 + 1.0;
        float _233 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _235 = _195 * _227;
        float _237 = 1.0 / _231;
        float _239 = _233 * 0.693147182464599609375;
        float _241 = exp2(_235);
        float _243 = 1.0 / _239;
        float _245 = _241 + (-1.0);
        float _247 = -_245;
        float _249 = fma(_247, _243, _195);
        float _251 = _249 * _237;
        float _253 = _251 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _223 = _253;
    }
    float _255 = _223;
    bool _257 = !_157;
    if (!_257)
    {
        float _259 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _261 = log2(_259);
        float _263 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _265 = _263 + 1.0;
        float _267 = 1.0 / _265;
        float _269 = _195 * _261;
        float _271 = exp2(_269);
        float _273 = -_271;
        float _275 = _273 + 1.0;
        float _277 = _275 * _267;
        _207 = _277;
    }
    float _279 = _207;
    float _281 = in.m_54.w;
    int _283 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _285 = _283 != 0;
    int _287 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _289 = _287 != 0;
    float _291 = in.m_42.x;
    float _293 = in.m_42.y;
    float _295 = in.m_42.z;
    bool _297 = _203 < 0.5;
    float _299 = float(_297);
    float _301 = -_203;
    float _303 = fma(_301, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _305 = fma(_193, 0.5, 0.5);
    bool _307 = !_285;
    int _309 = _307 ? 0 : 1;
    float _311 = _255 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    bool _313 = !_189;
    int _315 = _313 ? 0 : 1;
    float _317 = -_299;
    float _319 = fma(_317, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _321 = abs(_309);
    float _323 = -_305;
    float _325 = fma(_323, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _327 = abs(_315);
    float _329 = fma(_279, _159, _311);
    bool _331 = !_289;
    int _333 = _331 ? 0 : 1;
    float _335 = _255 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _337 = _255 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    bool _339 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _341 = fma(_279, _161, _335);
    int _343 = abs(_333);
    float _345 = fma(_279, _163, _337);
    float _347 = float(_321);
    float _349 = float(_327);
    float _351 = abs(_303);
    float _353 = _347 * _351;
    float _355 = fma(_329, _281, _291);
    float _357 = fma(_341, _281, _293);
    float _359 = float(_343);
    float _361 = fma(_349, _325, _353);
    float _363 = fma(_345, _281, _295);
    float _365 = abs(_319);
    float _367 = fma(_359, _365, _361);
    bool _369 = !_339;
    float _371 = (*spvDescriptorSet0.vp_c9)._m0[7].x;
    float _387;
    if (!_369)
    {
        float _373 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _375 = _141 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _377 = fma(_375, (*spvDescriptorSet0.vp_c9)._m0[12].x, _121);
        float _379 = _377 * _373;
        float _381 = floor(_379);
        float _383 = -_381;
        float _385 = _379 + _383;
        _387 = _385;
        _389 = true;
    }
    else
    {
        float _391 = float(_87);
        float _393 = 1.0 / _391;
        float _395 = _121 * _393;
        _387 = _395;
    }
    _389 = false;
    float _397 = _387;
    float _399 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _401 = _397 + _399;
    float _403 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    bool _405 = _397 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _407 = isnan(_397);
    bool _409 = _405 || _407;
    bool _411 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _413 = _409 || _411;
    float _415 = float(_413);
    float _417 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _419 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _417;
    float _421 = _403 * _141;
    float _423 = -_415;
    float _425 = _423 + 1.0;
    bool _427 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _429 = 1.0 / _419;
    float _431 = trunc(_421);
    int _433 = int(_431);
    float _435 = _401 * _429;
    bool _437 = _397 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _439 = isnan(_397);
    bool _441 = _437 || _439;
    bool _443 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _445 = _441 || _443;
    float _447 = float(_445);
    float _449 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _451 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _449;
    float _453 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _455 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _453;
    float _457 = _447 * _425;
    float _459 = fma(_451, _435, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _461 = fma(_455, _435, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _463 = -_447;
    float _465 = _463 + 1.0;
    float _467 = _459 * _457;
    float _469 = _461 * _457;
    float _471 = fma(_465, (*spvDescriptorSet0.vp_c9)._m0[143].x, _467);
    float _473 = fma(_465, (*spvDescriptorSet0.vp_c9)._m0[143].y, _469);
    int _475 = _433 << 4;
    int _477 = _475 + 1712;
    float _479 = fma(_415, (*spvDescriptorSet0.vp_c9)._m0[144].x, _471);
    float _481 = fma(_415, (*spvDescriptorSet0.vp_c9)._m0[144].y, _473);
    bool _483 = !_427;
    float _499;
    if (!_483)
    {
        float _485 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _487 = _141 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _489 = fma(_487, (*spvDescriptorSet0.vp_c9)._m0[11].y, _121);
        float _491 = _489 * _485;
        float _493 = floor(_491);
        float _495 = -_493;
        float _497 = _491 + _495;
        _499 = _497;
        _501 = true;
    }
    else
    {
        float _503 = float(_87);
        float _505 = 1.0 / _503;
        float _507 = _121 * _505;
        _499 = _507;
    }
    _501 = false;
    float _509 = _499;
    uint _512 = uint(int(uint(_477) >> uint(2)));
    uint _514 = uint(int(uint(int(_512)) >> uint(2)));
    int _516 = int(_512) & 3;
    float _518 = (*spvDescriptorSet0.vp_c9)._m0[int(_514)][_516];
    int _520 = int(_512) + 1;
    uint _522 = uint(int(uint(_520) >> uint(2)));
    int _524 = _520 & 3;
    float _526 = (*spvDescriptorSet0.vp_c9)._m0[int(_522)][_524];
    float _528 = in.m_54.x;
    float _530 = in.m_54.y;
    float _532 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _534 = _509 + _532;
    bool _536 = _509 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _538 = isnan(_509);
    bool _540 = _536 || _538;
    bool _542 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _544 = _540 || _542;
    float _546 = float(_544);
    float _548 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _550 = _548 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _552 = _509 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _554 = isnan(_509);
    bool _556 = _552 || _554;
    bool _558 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _560 = _556 || _558;
    float _562 = float(_560);
    int _564 = _477 + 8;
    uint _566 = uint(int(uint(_564) >> uint(2)));
    uint _568 = uint(int(uint(int(_566)) >> uint(2)));
    int _570 = int(_566) & 3;
    float _572 = (*spvDescriptorSet0.vp_c9)._m0[int(_568)][_570];
    float _574 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _576 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _574;
    float _578 = -_546;
    float _580 = _578 + 1.0;
    bool _582 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _584 = 1.0 / _550;
    float _586 = _576 * _584;
    float _588 = fma(_586, _534, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _590 = _562 * _580;
    float _592 = _588 * _590;
    float _594 = -_562;
    float _596 = _594 + 1.0;
    float _598 = _481 * _530;
    float _600 = _479 * _528;
    float _602 = fma(_596, (*spvDescriptorSet0.vp_c9)._m0[115].x, _592);
    float _604 = fma(_546, (*spvDescriptorSet0.vp_c9)._m0[116].x, _602);
    float _606 = _518 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _608 = _526 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _610 = _604 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _612 = _606 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _614 = _608 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _616 = _572 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _618 = _616 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _620 = !_582;
    float _638;
    float _640;
    if (!_620)
    {
        float _622 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _624 = _141 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _626 = float(_87);
        float _628 = fma(_624, (*spvDescriptorSet0.vp_c9)._m0[11].w, _121);
        float _630 = _628 * _622;
        float _632 = floor(_630);
        float _634 = -_632;
        float _636 = _630 + _634;
        _638 = _626;
        _640 = _636;
        _642 = true;
    }
    else
    {
        float _644 = float(_87);
        float _646 = 1.0 / _644;
        float _648 = _121 * _646;
        _638 = _644;
        _640 = _648;
    }
    _642 = false;
    float _650 = _638;
    float _652 = _640;
    float _654 = _357 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _656 = _357 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _658 = _357 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _660 = fma(_121, 0.014999999664723873138427734375, _141);
    float _662 = fma(_355, (*spvDescriptorSet0.vp_c10)._m0[5].x, _654);
    float _664 = fma(_355, (*spvDescriptorSet0.vp_c10)._m0[4].x, _656);
    float _666 = fma(_355, (*spvDescriptorSet0.vp_c10)._m0[6].x, _658);
    float _668 = floor(_660);
    float _670 = fma(_363, (*spvDescriptorSet0.vp_c10)._m0[5].z, _662);
    float _672 = fma(_363, (*spvDescriptorSet0.vp_c10)._m0[4].z, _664);
    float _674 = fma(_363, (*spvDescriptorSet0.vp_c10)._m0[6].z, _666);
    float _676 = _670 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _678 = _672 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _680 = _674 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _682 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _684 = _676 + _682;
    float _686 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _688 = _678 + _686;
    float _690 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _692 = _680 + _690;
    float _694 = _684 * _684;
    float _696 = _668 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _698 = fma(_688, _688, _694);
    float _700 = fma(_692, _692, _698);
    float _702 = rsqrt(_700);
    float _704 = _684 * _702;
    float _706 = _688 * _702;
    float _708 = _692 * _702;
    float _710 = -_704;
    float _712 = fma(_710, (*spvDescriptorSet0.vp_c9)._m0[18].w, _684);
    float _714 = -_706;
    float _716 = fma(_714, (*spvDescriptorSet0.vp_c9)._m0[18].w, _688);
    float _718 = -_708;
    float _720 = fma(_718, (*spvDescriptorSet0.vp_c9)._m0[18].w, _692);
    float _722 = -_706;
    float _724 = fma(_722, (*spvDescriptorSet0.vp_c9)._m0[18].w, _678);
    float _726 = _712 * _712;
    float _728 = fma(_716, _716, _726);
    float _730 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _199);
    float _732 = fma(_720, _720, _728);
    float _734 = _598 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _736 = sqrt(_732);
    float _738 = _702 * _736;
    float _740 = _734 * _738;
    float _742 = _600 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _744 = _740 * _730;
    float _746 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _185);
    float _748 = _742 * _738;
    float _750 = fma(_668, -0.1500000059604644775390625, 1.0);
    float _752 = _744 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _754 = _748 * _746;
    float _756 = _738 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _758 = _756 * 0.5;
    float _760 = precise::max(_750, 0.20000000298023223876953125);
    float _762 = _744 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _764 = fma(_754, (*spvDescriptorSet0.vp_c10)._m0[10].x, _752);
    float _766 = precise::min(_760, 1.0);
    float _768 = fma(_754, (*spvDescriptorSet0.vp_c10)._m0[8].x, _762);
    float _770 = fma(_758, (*spvDescriptorSet0.vp_c10)._m0[10].z, _764);
    float _772 = fma(_758, (*spvDescriptorSet0.vp_c10)._m0[8].z, _768);
    float _774 = fma(_770, _766, _680);
    float _776 = fma(_772, _766, _678);
    float _778 = fma(_696, (*spvDescriptorSet0.vp_c10)._m0[10].y, _774);
    float _780 = fma(_696, (*spvDescriptorSet0.vp_c10)._m0[8].y, _776);
    float _782 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _784 = _778 + _782;
    float _786 = _744 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _788 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _790 = _780 + _788;
    float _792 = _784 * _784;
    float _794 = fma(_754, (*spvDescriptorSet0.vp_c10)._m0[9].x, _786);
    float _796 = fma(_790, _790, _792);
    float _798 = fma(_758, (*spvDescriptorSet0.vp_c10)._m0[9].z, _794);
    float _800 = sqrt(_796);
    float _802 = fma(_798, _766, _676);
    float _804 = fma(_696, (*spvDescriptorSet0.vp_c10)._m0[9].y, _802);
    bool _806 = _800 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _808 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _810 = _808 != 0;
    int _812 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _814 = _812 != 0;
    int _816 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _818 = _816 != 0;
    int _820 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _822 = _820 != 0;
    bool _824 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _826 = isnan(0.5);
    bool _828 = _824 || _826;
    bool _830 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _832 = _828 || _830;
    bool _834 = !_814;
    int _836 = _834 ? 0 : 1;
    bool _838 = !_810;
    int _840 = _838 ? 0 : 1;
    bool _842 = !_818;
    int _844 = _842 ? 0 : 1;
    bool _846 = !_822;
    int _848 = _846 ? 0 : 1;
    float _850 = _802;
    float _852 = _758;
    float _854 = _708;
    float _856 = _704;
    if (!_806)
    {
        _850 = _780;
    }
    float _858 = _850;
    float _860 = _858;
    if (!_806)
    {
        _371 = _778;
    }
    float _862 = _371;
    float _864 = _862;
    if (!_806)
    {
        _852 = _804;
    }
    float _866 = _852;
    bool _868 = !_806;
    float _870 = _866;
    if (!_868)
    {
        float _872 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _874 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _876 = _800 + _874;
        float _878 = rsqrt(_796);
        float _880 = _876 * _872;
        float _882 = _804 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _884 = _880 * 0.15915493667125701904296875;
        float _886 = _884 * 6.283185482025146484375;
        float _888 = cos(_886);
        float _890 = _884 * 6.283185482025146484375;
        float _892 = sin(_890);
        float _894 = _888 + (-1.0);
        float _896 = _894 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _898 = fma(_892, _882, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _900 = fma(_804, _888, _896);
        float _902 = _878 * _898;
        float _904 = fma(_790, _902, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _906 = fma(_784, _902, (*spvDescriptorSet0.vp_c15)._m0[0].z);
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
    float _928 = fma(_926, (*spvDescriptorSet0.vp_c9)._m0[18].w, _676);
    float _930 = -_708;
    float _932 = fma(_930, (*spvDescriptorSet0.vp_c9)._m0[18].w, _680);
    float _934 = _924;
    float _936 = _916;
    float _938 = _912;
    if (_832)
    {
        _854 = _916;
    }
    float _940 = _854;
    float _942 = _940;
    if (_832)
    {
        _856 = _920;
    }
    float _944 = _856;
    float _946 = _944;
    if (!_832)
    {
        float _948 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _950 = _928 + _948;
        float _952 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _954 = _724 + _952;
        float _956 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _958 = -_680;
        float _960 = _958 + _910;
        float _962 = _950 * _950;
        float _964 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _966 = _932 + _964;
        float _968 = -_678;
        float _970 = _968 + _908;
        float _972 = fma(_954, _954, _962);
        float _974 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _976 = fma(_966, _966, _972);
        float _978 = sqrt(_976);
        float _980 = 1.0 / _738;
        float _982 = precise::min(_978, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _984 = _982 * _956;
        float _986 = _974 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _988 = -_676;
        float _990 = _988 + _912;
        float _992 = _984 * _980;
        float _994 = _986 * _992;
        float _996 = _960 * _992;
        float _998 = fma(_970, _994, _724);
        float _1000 = fma(_990, _994, _928);
        float _1002 = fma(_986, _996, _932);
        _934 = _1000;
        _942 = _998;
        _946 = _1002;
        _936 = _978;
    }
    float _1004 = _934;
    float _1006 = _942;
    float _1008 = _946;
    float _1010 = _936;
    float _1012 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1014 = _1004 + _1012;
    float _1016 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1018 = _1006 + _1016;
    float _1020 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1022 = _1008 + _1020;
    float _1024 = _1014 * _1014;
    float _1026 = fma(_1018, _1018, _1024);
    float _1028 = fma(_1022, _1022, _1026);
    float _1030 = rsqrt(_1028);
    float _1032 = sqrt(_1028);
    float _1034 = _1030 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1036 = _1018 * _1034;
    float _1038 = _1022 * _1034;
    float _1040 = _1036 * _1036;
    float _1042 = _1038 * _1038;
    float _1044 = _1040 + _1042;
    float _1046 = sqrt(_1044);
    bool _1048 = _1046 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1050 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1052 = _1046 + _1050;
    float _1054 = _1026;
    float _1056 = _1044;
    float _1058 = _1052;
    float _1060 = _1014;
    float _1062 = _1010;
    if (_1048)
    {
        float _1064 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1054 = _1064;
    }
    float _1066 = _1054;
    if (_1048)
    {
        float _1068 = rsqrt(_1044);
        _1056 = _1068;
    }
    float _1070 = _1056;
    float _1072 = _1066;
    if (_1048)
    {
        float _1074 = _1052 * _1066;
        _1058 = _1074;
    }
    float _1076 = _1058;
    if (_1048)
    {
        float _1078 = _1076 * 0.15915493667125701904296875;
        _938 = _1078;
    }
    float _1080 = _938;
    float _1082 = _1030;
    if (_1048)
    {
        float _1084 = _1080 * 6.283185482025146484375;
        float _1086 = cos(_1084);
        _1082 = _1086;
    }
    float _1088 = _1082;
    float _1090 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1092 = precise::max(0.0, _1090);
    float _1094 = _1022;
    float _1096 = _1092;
    if (_1048)
    {
        float _1098 = _1080 * 6.283185482025146484375;
        float _1100 = sin(_1098);
        _1094 = _1100;
    }
    float _1102 = _1094;
    float _1104 = -_1034;
    float _1106 = -_1092;
    float _1108 = fma(_1014, _1104, _1106);
    if (!_1048)
    {
        _1096 = _1036;
    }
    float _1110 = _1096;
    float _1112 = _1110;
    if (_1048)
    {
        float _1114 = _1108 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1060 = _1114;
    }
    float _1116 = _1060;
    float _1118 = _1116;
    float _1120 = _1088;
    if (_1048)
    {
        float _1122 = _1088 + (-1.0);
        _1062 = _1122;
    }
    float _1124 = _1062;
    float _1126 = _1004 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1128 = _1124;
    if (_1048)
    {
        float _1130 = _1124 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1072 = _1130;
    }
    float _1132 = _1072;
    float _1134 = fma(_1006, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1126);
    float _1136 = _1102;
    float _1138 = _1132;
    if (_1048)
    {
        float _1140 = fma(_1102, _1116, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1118 = _1140;
    }
    float _1142 = _1118;
    float _1144 = _1142;
    if (!_1048)
    {
        _1136 = _1108;
    }
    float _1146 = _1136;
    float _1148 = _1146;
    if (_1048)
    {
        float _1150 = fma(_1108, _1088, _1132);
        _1148 = _1150;
    }
    float _1152 = _1148;
    if (!_1048)
    {
        _1138 = _1040;
    }
    float _1154 = _1138;
    float _1156 = _1154;
    if (_1048)
    {
        float _1158 = _1070 * _1142;
        _1128 = _1158;
    }
    float _1160 = _1128;
    if (!_1048)
    {
        _1144 = _1038;
    }
    float _1162 = _1144;
    float _1164 = _1004 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1166 = _1162;
    if (!_1048)
    {
        _1120 = _1042;
    }
    float _1168 = _1120;
    float _1170 = _1168;
    if (_1048)
    {
        float _1172 = _1036 * _1160;
        _1112 = _1172;
    }
    float _1174 = _1112;
    if (_1048)
    {
        float _1176 = _1038 * _1160;
        _1166 = _1176;
    }
    float _1178 = _1166;
    float _1180 = _1004 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1182 = fma(_1006, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1164);
    if (_1048)
    {
        float _1184 = _1174 * _1174;
        _1156 = _1184;
    }
    float _1186 = _1156;
    if (_1048)
    {
        float _1188 = _1178 * _1178;
        _1170 = _1188;
    }
    float _1190 = _1170;
    float _1192 = fma(_1006, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1180);
    float _1194 = fma(_1008, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1182);
    float _1196 = fma(_1152, _1152, _1186);
    float _1198 = _1004 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1200 = fma(_1008, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1192);
    float _1202 = _1196 + _1190;
    float _1204 = _1194 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1206 = fma(_1006, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1198);
    float _1208 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1210 = fma(_1008, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1134);
    float _1212 = _1200 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1214 = rsqrt(_1202);
    float _1216 = _1204 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1218 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1220 = fma(_1032, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1218);
    float _1222 = precise::clamp(_1220, 0.0, 1.0);
    float _1224 = fma(_1008, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1206);
    float _1226 = _1210 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1228 = fma(_1212, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1216);
    float _1230 = -_1222;
    float _1232 = _1230 + 1.0;
    float _1234 = _1224 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1236 = _1226 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1238 = fma(_1226, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1228);
    float _1240 = abs(_1232);
    float _1242 = log2(_1240);
    float _1244 = -_1236;
    float _1246 = fma(_1244, _1208, 1.0);
    float _1248 = _1214 * _1174;
    float _1250 = fma(_1234, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1238);
    float _1252 = _1214 * _1152;
    float _1254 = _1214 * _1178;
    float _1256 = _1248 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1258 = log2(_1246);
    float _1260 = _1204 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1262 = -_1256;
    float _1264 = fma(_1252, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1262);
    float _1266 = _1242 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1268 = fma(_1212, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1260);
    float _1270 = -_1254;
    float _1272 = fma(_1270, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1264);
    float _1274 = 1.0 / _1250;
    float _1276 = _1204 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1278 = _1252 + 1.0;
    float _1280 = fma(_1272, -0.5, 0.5);
    float _1282 = fma(_1272, 0.5, 0.5);
    float _1284 = fma(_1212, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1276);
    float _1286 = fma(_1226, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1268);
    float _1288 = exp2(_1266);
    float _1290 = fma(_1282, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1292 = fma(_1226, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1284);
    float _1294 = fma(_1234, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1286);
    float _1296 = _1258 * 0.693147182464599609375;
    float _1298 = fma(_1282, _1290, -0.212114393711090087890625);
    float _1300 = fma(_1234, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1292);
    float _1302 = sqrt(_1280);
    float _1304 = fma(_1282, _1298, 1.570728778839111328125);
    float _1306 = _1300 * _1274;
    float _1308 = _1294 * _1274;
    float _1310 = _1296 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1312 = fma(_1306, 0.5, 0.5);
    float _1314 = fma(_1308, -0.5, 0.5);
    float _1316 = -_1252;
    float _1318 = fma(_1288, _1278, _1316);
    float _1320 = fma(_1318, 0.5, 0.5);
    float _1322 = _1302 * 0.636619746685028076171875;
    float _1324 = -_1304;
    float _1326 = fma(_1322, _1324, 1.0);
    float3 _4336 = float3(_1312, _1314, _1310);
    float _1328 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4336, float3(0.0), isnan(_4336)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4336, float3(0.0), isnan(_4336)), level(0.0)).x;
    float3 _4347 = float3(_1312, _1314, _1310);
    float4 _1331 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4347, float3(0.0), isnan(_4347)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4347, float3(0.0), isnan(_4347)), level(0.0)).xyzw;
    float _1333 = _1331.x;
    float _1335 = _1331.y;
    float _1337 = _1331.z;
    float _1339 = _1331.w;
    float2 _4364 = float2(_1326, _1320);
    float3 _1343 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4364, float2(0.0), isnan(_4364)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4364, float2(0.0), isnan(_4364)), level(0.0)).xyz;
    float _1345 = _1343.x;
    float _1347 = _1343.y;
    float _1349 = _1343.z;
    float _1351 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _1353 = int(_1351);
    bool _1355 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1357 = isnan(0.5);
    bool _1359 = _1355 || _1357;
    bool _1361 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1363 = _1359 || _1361;
    out.m_56.x = _612;
    out.m_56.y = _614;
    out.m_56.z = _618;
    out.m_56.w = _610;
    bool _1365 = _141 > 0.5;
    float _1367 = _1204 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _1369 = abs(_848);
    out.m_58.y = _1004;
    float _1371 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1373 = int(_1371);
    float _1375 = fma(_1212, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1367);
    float _1377 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1379 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1381 = fma(_1226, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1375);
    float _1383 = float(_1353);
    float _1385 = 1.0 / _650;
    float _1387 = -_185;
    int _1389 = _1365 ? as_type<int>(_1387) : as_type<int>(_185);
    float _1391 = fma(_1234, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1381);
    int _1393 = abs(_836);
    float _1395 = float(uint(_1373));
    float _1397 = 1.0 / _1383;
    int _1399 = ~_1373;
    int _1401 = _1399 + 1;
    int _1403 = ~_1373;
    int _1405 = _1403 + 1;
    float _1407 = 1.0 / _1395;
    int _1409 = ~_1373;
    int _1411 = _1409 + 1;
    float _1413 = in.m_49.y;
    float _1415 = _121 * _1397;
    int _1417 = ~_1373;
    int _1419 = _1417 + 1;
    float _1421 = trunc(_1415);
    int _1423 = int(_1421);
    int _1425 = as_type<int>(_1407) + (-2);
    float _1427 = float(uint(_1423));
    float _1429 = as_type<float>(_1425) * _1427;
    float _1431 = trunc(_1429);
    float _1433 = precise::max(_1431, 0.0);
    uint _1435 = uint(_1433);
    int _1437 = _1411 * int(_1435);
    int _1439 = _1437 + _1423;
    float _1441 = float(uint(_1439));
    float _1443 = as_type<float>(_1425) * _1441;
    int _1445 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1447 = _1445 != 0;
    bool _1449 = !_1447;
    float _1451 = _1449 ? _1413 : _141;
    float _1453 = trunc(_1443);
    float _1455 = precise::max(_1453, 0.0);
    uint _1457 = uint(_1455);
    bool _1459 = !_1447;
    float _1461 = _1459 ? 1.2345600128173828125 : 1.0;
    float _1463 = _1461 * _1451;
    float _1465 = float(_1423);
    float _1467 = floor(_1463);
    int _1469 = int(_1435) + int(_1457);
    float _1471 = float(_1373);
    int _1473 = _1419 * _1469;
    int _1475 = _1473 + _1423;
    bool _1477 = _1465 >= _1471;
    bool _1479 = isnan(_1465);
    bool _1481 = _1477 || _1479;
    bool _1483 = isnan(_1471);
    bool _1485 = _1481 || _1483;
    float _1487 = float(_1485);
    float _1489 = _121 * _1471;
    float _1491 = -_1467;
    float _1493 = _1463 + _1491;
    int _1495 = _1373 + (-1);
    bool _1497 = uint(_1475) >= uint(_1373);
    float _1499 = _1493 * _1471;
    float _1501 = trunc(_1487);
    int _1503 = int(_1501);
    bool _1505 = !_1497;
    int _1507 = _1505 ? 0 : (-1);
    bool _1509 = _1373 == 0;
    int _1511 = ~_1469;
    int _1513 = _1511 + _1507;
    int _1515 = _1513 + 1;
    float _1517 = _1489 * _1385;
    int _1519 = _1373 * _1515;
    int _1521 = _1519 + _1423;
    float _1523 = in.m_49.z;
    int _1525 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1527 = _1525 != 0;
    float _1529 = trunc(_1517);
    int _1531 = int(_1529);
    int _1533 = ~_1503;
    int _1535 = _1533 + 1;
    int _1537 = _1535 + 1;
    float _1539 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1541 = _1539 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1543 = !_1509;
    int _1545 = _1543 ? _1521 : (-1);
    int _1547 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1549 = _1547 != 0;
    bool _1551 = !_1527;
    int _1553 = _1551 ? 0 : 1;
    int _1555 = _1545 * _1537;
    bool _1557 = _1413 > 0.5;
    float _1559 = 1.0 / _1541;
    bool _1561 = !_1549;
    float _1563 = _1561 ? _185 : as_type<float>(_1389);
    int _1565 = _1503 * _1495;
    int _1567 = _1565 + _1555;
    float _1569 = -_199;
    int _1571 = _1557 ? as_type<int>(_1569) : as_type<int>(_199);
    int _1573 = abs(_1553);
    int _1575 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1577 = _1575 != 0;
    float _1579 = trunc(_1499);
    int _1581 = int(_1579);
    int _1583 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1585 = _1583 != 0;
    int _1587 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1589 = _1587 != 0;
    bool _1591 = _1523 > 0.5;
    bool _1593 = !_1585;
    float _1595 = _1593 ? _199 : as_type<float>(_1571);
    float _1597 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1599 = -_185;
    int _1601 = _1591 ? as_type<int>(_1599) : as_type<int>(_185);
    int _1603 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1605 = _1603 != 0;
    int _1607 = _1581 * _1573;
    int _1609 = _1607 + _1423;
    int _1611 = abs(_840);
    int _1613 = _1567 * _1393;
    int _1615 = abs(_844);
    float _1617 = in.m_49.w;
    int _1619 = _1531 * _1611;
    int _1621 = _1619 + _1613;
    bool _1623 = !_1589;
    float _1625 = _1623 ? _185 : as_type<float>(_1601);
    int _1627 = _1609 * _1615;
    int _1629 = _1627 + _1621;
    float _1631 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1633 = _1631 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    int _1635 = _1581 * _1369;
    int _1637 = _1635 + _1629;
    float _1639 = 1.0 / _1633;
    float _1641 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1643 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1645 = _1643 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _1647 = _141 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1649 = float(uint(_1637));
    int _1651 = ~_1373;
    int _1653 = _1651 + 1;
    float _1655 = 1.0 / _1645;
    float _1657 = -_1641;
    float _1659 = fma(_1647, 2.0, _1657);
    float _1661 = as_type<float>(_1425) * _1649;
    float _1663 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1665 = _1413 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _1667 = _1617 > 0.5;
    float _1669 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1671 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1669;
    float _1673 = trunc(_1661);
    float _1675 = precise::max(_1673, 0.0);
    uint _1677 = uint(_1675);
    float _1679 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1681 = _1679 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1683 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1685 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _1683;
    float _1687 = _1671 * _1559;
    float _1689 = _1681 * _1639;
    float _1691 = fma(_1665, -2.0, _1663);
    float _1693 = _1685 * _1655;
    float _1695 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1697 = _1665;
    float _1699 = _1695;
    float _1701 = _1523;
    if (!_1447)
    {
        _1697 = _1413;
    }
    float _1703 = _1697;
    float _1705 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1707 = _1703;
    if (_1447)
    {
        _1707 = _141;
    }
    float _1709 = _1707;
    float _1711 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1695);
    float _1713 = -_199;
    int _1715 = _1667 ? as_type<int>(_1713) : as_type<int>(_199);
    float _1717 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _1719 = _1653 * int(_1677);
    int _1721 = _1719 + _1637;
    if (!_1447)
    {
        _1699 = _1523;
    }
    float _1723 = _1699;
    float _1725 = fma(_1413, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1705);
    float _1727 = _1723;
    if (_1447)
    {
        _1701 = _1413;
    }
    float _1729 = _1701;
    float _1731 = -_121;
    float _1733 = fma(_1731, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1659);
    float _1735 = float(uint(_1721));
    float _1737 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1711);
    if (_1447)
    {
        _1727 = _1413;
    }
    float _1739 = _1727;
    float _1741 = _1563 + 0.5;
    bool _1743 = !_1605;
    float _1745 = _1743 ? _199 : as_type<float>(_1715);
    float _1747 = as_type<float>(_1425) * _1735;
    float _1749 = _1597 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1751 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1753 = _652 + _1751;
    float _1755 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1757 = _652 + _1755;
    float _1759 = trunc(_1747);
    float _1761 = precise::max(_1759, 0.0);
    uint _1763 = uint(_1761);
    float _1765 = fma(_1749, _1741, _1733);
    float _1767 = fma(_1687, _1753, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1769 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1771 = _652 + _1769;
    float _1773 = fma(_1689, _1757, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    bool _1775 = _652 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _1777 = isnan(_652);
    bool _1779 = _1775 || _1777;
    bool _1781 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _1783 = _1779 || _1781;
    float _1785 = float(_1783);
    float _1787 = _1717 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1789 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1691);
    float _1791 = fma(_1693, _1771, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _1793 = _1595 + (-0.5);
    float _1795 = fma(_1739, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1377);
    bool _1797 = _652 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1799 = isnan(_652);
    bool _1801 = _1797 || _1799;
    bool _1803 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1805 = _1801 || _1803;
    float _1807 = float(_1805);
    float _1809 = _1729 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1811 = -_1787;
    float _1813 = -_1789;
    float _1815 = fma(_1811, _1793, _1813);
    float _1817 = float(uint(_1609));
    float _1819 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1725);
    int _1821 = int(_1677) + int(_1763);
    float _1823 = -_1785;
    float _1825 = _1823 + 1.0;
    bool _1827 = _652 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1829 = isnan(_652);
    bool _1831 = _1827 || _1829;
    bool _1833 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1835 = _1831 || _1833;
    float _1837 = float(_1835);
    float _1839 = as_type<float>(_1425) * _1817;
    bool _1841 = _652 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1843 = isnan(_652);
    bool _1845 = _1841 || _1843;
    bool _1847 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1849 = _1845 || _1847;
    float _1851 = float(_1849);
    float _1853 = _1807 * _1825;
    float _1855 = -_1807;
    float _1857 = _1855 + 1.0;
    int _1859 = _1401 * _1821;
    int _1861 = _1859 + _1637;
    float _1863 = -_1851;
    float _1865 = _1863 + 1.0;
    float _1867 = _1851 * _1857;
    float _1869 = trunc(_1839);
    float _1871 = precise::max(_1869, 0.0);
    uint _1873 = uint(_1871);
    float _1875 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1877 = _1837 * _1865;
    bool _1879 = uint(_1861) >= uint(_1373);
    float _1881 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1883 = fma(_1709, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1875);
    float _1885 = _1709 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1887 = _1767 * _1877;
    bool _1889 = !_1879;
    int _1891 = _1889 ? 0 : (-1);
    float _1893 = -_1881;
    float _1895 = fma(_1885, 2.0, _1893);
    float _1897 = fma(_1809, -2.0, _1379);
    float _1899 = -_1837;
    float _1901 = _1899 + 1.0;
    float _1903 = _928 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    int _1905 = ~_1821;
    int _1907 = _1905 + _1891;
    int _1909 = _1907 + 1;
    float _1911 = _928 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    int _1913 = _1405 * int(_1873);
    int _1915 = _1913 + _1609;
    float _1917 = fma(_1901, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1887);
    float _1919 = fma(_724, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1903);
    float _1921 = fma(_724, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1911);
    int _1923 = _1373 * _1909;
    int _1925 = _1923 + _1637;
    float _1927 = float(uint(_1915));
    float _1929 = fma(_932, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1919);
    float _1931 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1883);
    float _1933 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1795);
    float _1935 = -_121;
    float _1937 = fma(_1935, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1895);
    float _1939 = as_type<float>(_1425) * _1927;
    float _1941 = fma(_932, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1921);
    bool _1943 = !_1509;
    int _1945 = _1943 ? _1925 : (-1);
    float _1947 = _1929 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1949 = -_1737;
    float _1951 = _1949 + 1.0;
    float _1953 = _1941 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    int _1955 = _1945 >> 31;
    float _1957 = trunc(_1939);
    float _1959 = precise::max(_1957, 0.0);
    uint _1961 = uint(_1959);
    float _1963 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1897);
    float _1965 = _1625 + 0.5;
    int _1967 = _1955 & 3;
    float _1969 = -_1819;
    float _1971 = _1969 + 1.0;
    float _1973 = -_1951;
    float _1975 = fma(_1563, _1973, _1765);
    float _1977 = fma(_1965, (*spvDescriptorSet0.vp_c9)._m0[85].x, _1937);
    int _1979 = _1945 + _1967;
    float _1981 = 1.0 / _1953;
    float _1983 = _1745 + (-0.5);
    float _1985 = fma(_1595, _1971, _1815);
    int _1987 = _1979 >> 2;
    float _1989 = -_1933;
    float _1991 = _1989 + 1.0;
    float _1993 = -_1983;
    float _1995 = -_1963;
    float _1997 = fma(_1993, (*spvDescriptorSet0.vp_c9)._m0[85].y, _1995);
    int _1999 = ~_1373;
    int _2001 = _1999 + 1;
    float _2003 = -_1931;
    float _2005 = _2003 + 1.0;
    int _2007 = int(_1873) + int(_1961);
    float _2009 = _1947 + _1953;
    int _2011 = _1987 << 4;
    int _2013 = _2011 + 512;
    float _2015 = fma(_1745, _1991, _1997);
    float _2017 = as_type<float>(_1961);
    float _2019 = _1971;
    float _2021 = _1765;
    if (!_1363)
    {
        _2017 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    }
    float _2023 = _2017;
    int _2025 = _2001 * _2007;
    int _2027 = _2025 + _1609;
    uint _2029 = uint(int(uint(_2013) >> uint(2)));
    uint _2031 = uint(int(uint(int(_2029)) >> uint(2)));
    int _2033 = int(_2029) & 3;
    float _2035 = (*spvDescriptorSet0.vp_c9)._m0[int(_2031)][_2033];
    int _2037 = int(_2029) + 1;
    uint _2039 = uint(int(uint(_2037) >> uint(2)));
    int _2041 = _2037 & 3;
    float _2043 = (*spvDescriptorSet0.vp_c9)._m0[int(_2039)][_2041];
    int _2045 = _1945 & 3;
    bool _2047 = _2045 != 0;
    float _2049 = _2009 * _1981;
    float _2051 = _2049 * 0.5;
    float _2053 = -_2005;
    float _2055 = fma(_1625, _2053, _1977);
    bool _2057 = uint(_2027) >= uint(_1373);
    float _2059 = fma(_1773, _1867, _1917);
    float _2061 = _2051;
    if (!_1363)
    {
        float _2063 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _2065 = fma(_2051, _2023, _2063);
        _2061 = _2065;
    }
    float _2067 = _2061;
    int _2069 = _1945 & 3;
    bool _2071 = _2069 != 0;
    int _2073 = _2013 + 8;
    uint _2075 = uint(int(uint(_2073) >> uint(2)));
    uint _2077 = uint(int(uint(int(_2075)) >> uint(2)));
    int _2079 = int(_2075) & 3;
    float _2081 = (*spvDescriptorSet0.vp_c9)._m0[int(_2077)][_2079];
    int _2083 = int(_2075) + 1;
    uint _2085 = uint(int(uint(_2083) >> uint(2)));
    int _2087 = _2083 & 3;
    float _2089 = (*spvDescriptorSet0.vp_c9)._m0[int(_2085)][_2087];
    int _2091 = _2047 ? 0 : 1;
    out.m_60.x = _1975;
    out.m_60.y = _1985;
    out.m_60.z = _2055;
    out.m_60.w = _2015;
    bool _2093 = uint(_2069) > 1u;
    float _2095 = _2067;
    if (!_1363)
    {
        float _2097 = 1.0 / _2067;
        _2095 = _2097;
    }
    float _2099 = _2095;
    bool _2101 = !_2057;
    int _2103 = _2101 ? 0 : (-1);
    float _2105 = fma(_1791, _1853, _2059);
    int _2107 = ~_2091;
    int _2109 = _2107 + 1;
    int _2111 = _2109 + 1;
    bool _2113 = _2069 != 3;
    float _2115 = fma(_1785, (*spvDescriptorSet0.vp_c9)._m0[134].x, _2105);
    int _2117 = ~_2007;
    int _2119 = _2117 + _2103;
    int _2121 = _2119 + 1;
    bool _2123 = !_2071;
    int _2125 = _2123 ? 0 : 1;
    float _2127 = _2115 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    int _2129 = _2111;
    float _2131 = _2105;
    if (!_1363)
    {
        _2019 = (*spvDescriptorSet0.vp_c9)._m0[140].z;
    }
    float _2133 = _2019;
    int _2135 = _1373 * _2121;
    int _2137 = _2135 + _1609;
    if (!_2093)
    {
        int _2139 = ~_2091;
        int _2141 = _2139 + 1;
        _2129 = _2141;
    }
    int _2143 = _2129;
    float _2145 = _1242 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _2147 = uint(_2069) >= 2u;
    if (!_1363)
    {
        float _2149 = -_2133;
        float _2151 = _2149 + (*spvDescriptorSet0.vp_c9)._m0[140].w;
        _2021 = _2151;
    }
    float _2153 = _2021;
    int _2155 = abs(_2143);
    if (!_1363)
    {
        float _2157 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2159 = -_2133;
        float _2161 = fma(_2099, _2157, _2159);
        _2131 = _2161;
    }
    float _2163 = _2131;
    int _2165 = abs(_2125);
    float _2167 = as_type<float>(_1821);
    float _2169 = _2163;
    if (!_1363)
    {
        float _2171 = 1.0 / _2153;
        _2167 = _2171;
    }
    float _2173 = _2167;
    out.m_62.w = _2127;
    int _2175 = _2147 ? 0 : 1;
    int _2177 = ~_2155;
    int _2179 = _2177 + 1;
    int _2181 = _2179 + 1;
    int _2183 = ~_2175;
    int _2185 = _2183 + 1;
    int _2187 = _2185 + 1;
    float _2189 = exp2(_2145);
    int _2191 = _2187;
    if (_2113)
    {
        int _2193 = ~_2175;
        int _2195 = _2193 + 1;
        _2191 = _2195;
    }
    int _2197 = _2191;
    bool _2199 = _2069 != 3;
    int _2201 = ~_2165;
    int _2203 = _2201 + 1;
    int _2205 = _2203 + 1;
    int _2207 = abs(_2197);
    int _2209 = _2181 * as_type<int>(_2043);
    bool _2211 = !_2199;
    float _2213 = _2211 ? 0.0 : as_type<float>(0xffffffffu /* nan */);
    float _2215 = _2213;
    if (!_1363)
    {
        float _2217 = _2163 * _2173;
        float _2219 = precise::clamp(_2217, 0.0, 1.0);
        _2169 = _2219;
    }
    float _2221 = _2169;
    int _2223 = _2205 * as_type<int>(_2035);
    int _2225 = _2223 + _2209;
    bool _2227 = !_1577;
    int _2229 = _2227 ? 0 : 1;
    int _2231 = abs(as_type<int>(_2213));
    float _2233 = -_2189;
    float _2235 = _2233 + 1.0;
    int _2237 = abs(_2229);
    int _2239 = ~_2207;
    int _2241 = _2239 + 1;
    int _2243 = _2241 + 1;
    float _2245 = _2235 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    if (_1363)
    {
        _2215 = 1.0;
    }
    float _2247 = _2215;
    int _2249 = _2243 * as_type<int>(_2081);
    int _2251 = _2249 + _2225;
    int _2253 = ~_2231;
    int _2255 = _2253 + 1;
    int _2257 = _2255 + 1;
    float _2259 = _2247;
    if (!_1363)
    {
        float _2261 = -_2221;
        float _2263 = _2261 + 1.0;
        _2259 = _2263;
    }
    float _2265 = _2259;
    int _2267 = ~_2237;
    int _2269 = _2267 + 1;
    int _2271 = _2269 + 1;
    float _2273 = _2245 * _1328;
    float _2275 = -_2245;
    float _2277 = _2275 + 1.0;
    int _2279 = _2257 * as_type<int>(_2089);
    int _2281 = _2279 + _2251;
    float _2283 = _2265 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _2285 = !_1509;
    int _2287 = _2285 ? _2137 : (-1);
    int _2289 = _2281 * _2271;
    float _2291 = -(*spvDescriptorSet0.vp_c8)._m0[31].z;
    float _2293 = _1391 + _2291;
    float _2295 = _367 * _2283;
    bool _2297 = _2265 > 0.0;
    bool _2299 = isnan(_2265);
    bool _2301 = _2297 || _2299;
    bool _2303 = isnan(0.0);
    bool _2305 = _2301 || _2303;
    int _2307 = _2287 * _2237;
    int _2309 = _2307 + _2289;
    float _2311 = _1250 + _2293;
    float _2313 = _2295 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2315 = _1339 * _2273;
    float _2317 = _1349 * _2273;
    float _2319 = _2311 * 0.5;
    out.gl_Position.x = _1300;
    out.gl_Position.y = _1294;
    out.gl_Position.z = _2293;
    out.gl_Position.w = _1250;
    float _2321 = fma(_1345, _2315, _1333);
    float _2323 = float(_2309);
    float _2325 = fma(_1347, _2315, _1335);
    float _2327 = _1339 * _2277;
    float _2329 = fma(_1339, _2317, _1337);
    out.m_64.z = _2319;
    out.m_64.w = _1250;
    out.m_66.y = _2323;
    out.m_45.x = _2313;
    out.m_68.x = _2321;
    out.m_68.y = _2325;
    out.m_68.z = _2329;
    out.m_68.w = _2327;
    if (_2305)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_45.x = 0.0;
    float _2331 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2331;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

