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
    constant _16* vp_c13 [[id(5)]];
    texture3d<float> vp_t_tcb_32 [[id(6)]];
    sampler vp_t_tcb_32Smplr [[id(7)]];
    texture3d<float> vp_t_tcb_30 [[id(8)]];
    sampler vp_t_tcb_30Smplr [[id(9)]];
    texture2d<float> vp_t_tcb_1C [[id(10)]];
    sampler vp_t_tcb_1CSmplr [[id(11)]];
    sampler vp_t_tcb_32Smplr_w [[id(12)]];
    sampler vp_t_tcb_30Smplr_w [[id(13)]];
    sampler vp_t_tcb_1CSmplr_w [[id(14)]];
    constant dm_border_t* dm_border [[id(15)]];
};

struct main0_out
{
    float4 m_58 [[user(locn0)]];
    float4 m_56 [[user(locn1)]];
    float4 m_64 [[user(locn2)]];
    float4 m_74 [[user(locn3)]];
    float4 m_82 [[user(locn4)]];
    float4 m_47 [[user(locn5)]];
    float4 m_60 [[user(locn6)]];
    float4 m_72 [[user(locn7)]];
    float4 m_76 [[user(locn8)]];
    float4 m_70 [[user(locn9)]];
    float4 m_68 [[user(locn10)]];
    float4 m_80 [[user(locn11)]];
    float4 m_78 [[user(locn12)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_62 [[attribute(1)]];
    float4 m_44 [[attribute(2)]];
    float4 m_49 [[attribute(3)]];
    float4 m_54 [[attribute(4)]];
    float4 m_66 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3775 = false;
    bool _457 = false;
    bool _197 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _96 = in.m_44.w;
    float _98 = trunc(_96);
    int _101 = int(_98);
    bool _105 = _101 >= 1;
    float _107 = 0.0;
    float _109 = as_type<float>(_101);
    if (!_105)
    {
        _107 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _111 = _107;
    if (!_105)
    {
        out.m_47.x = 0.0;
    }
    int _113 = 0;
    if (!_105)
    {
        float _115 = _111 * 5.0;
        _113 = as_type<int>(_115);
    }
    int _117 = _113;
    int _119 = _117;
    if (!_105)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4061 = as_type<float>(_117);
        out.gl_Position.z = _4061;
    }
    if (!_105)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _121 = in.m_49.w;
    float _123 = float(_101);
    float _125 = -_121;
    float _127 = _125 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _129 = _121 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _131 = isnan(_121);
    bool _133 = _129 || _131;
    bool _135 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _137 = _133 || _135;
    bool _139 = _127 >= _123;
    bool _141 = !_137;
    bool _143 = _139 || _141;
    float _145 = _127;
    if (_143)
    {
        _109 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _147 = _109;
    if (_143)
    {
        out.m_47.x = 0.0;
    }
    if (_143)
    {
        float _149 = _147 * 5.0;
        _119 = as_type<int>(_149);
    }
    int _151 = _119;
    if (_143)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4125 = as_type<float>(_151);
        out.gl_Position.z = _4125;
    }
    if (_143)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _153 = as_type<float>(int(gl_VertexIndex));
    float _155 = 1.0 / _123;
    bool _157 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _159 = _127 * _155;
    int _161 = as_type<int>(_153) & 1;
    bool _163 = _161 != 0;
    int _165 = as_type<int>(_153) & 2;
    bool _167 = _165 != 0;
    bool _169 = !_163;
    float _171 = _169 ? (-0.5) : 0.5;
    bool _173 = !_167;
    float _175 = _173 ? (-0.5) : 0.5;
    bool _177 = !_157;
    float _195;
    if (!_177)
    {
        float _179 = in.m_54.x;
        float _181 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _183 = _179 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _185 = fma(_183, (*spvDescriptorSet0.vp_c9)._m0[12].x, _127);
        float _187 = _185 * _181;
        float _189 = floor(_187);
        float _191 = -_189;
        float _193 = _187 + _191;
        _195 = _193;
        _197 = true;
    }
    else
    {
        _195 = _159;
    }
    _197 = false;
    float _199 = _195;
    float _201 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _203 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _201;
    float _205 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _207 = _205 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _209 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _211 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _209;
    float _213 = 1.0 / _203;
    float _215 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _217 = _215 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _219 = 1.0 / _207;
    float _221 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _223 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _225 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _227 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _229 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _231 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _233 = 1.0 / _217;
    float _235 = _221 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _237 = _223 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _239 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _241 = _199 + _239;
    float _243 = _231 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _245 = _227 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _247 = _229 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _249 = _241 * _213;
    float _251 = 1.0 / _211;
    float _253 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _255 = _199 + _253;
    float _257 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _259 = _199 + _257;
    out.m_56.x = _245;
    out.m_56.y = _247;
    out.m_56.z = _243;
    bool _261 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _263 = _255 * _233;
    float _265 = _225 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _267 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _269 = _199 + _267;
    float _271 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _273 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _271;
    float _275 = _269 * _219;
    out.m_58.x = _235;
    out.m_58.y = _237;
    out.m_58.z = _265;
    bool _277 = _199 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _279 = isnan(_199);
    bool _281 = _277 || _279;
    bool _283 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _285 = _281 || _283;
    float _287 = float(_285);
    float _289 = _259 * _251;
    float _291 = fma(_273, _249, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _293 = -_287;
    float _295 = _293 + 1.0;
    bool _297 = _199 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _299 = isnan(_199);
    bool _301 = _297 || _299;
    bool _303 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _305 = _301 || _303;
    float _307 = float(_305);
    float _309 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _311 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _309;
    bool _313 = _199 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _315 = isnan(_199);
    bool _317 = _313 || _315;
    bool _319 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _321 = _317 || _319;
    float _323 = float(_321);
    float _325 = -_307;
    float _327 = _325 + 1.0;
    float _329 = _307 * _295;
    float _331 = fma(_311, _249, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _333 = _199 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _335 = isnan(_199);
    bool _337 = _333 || _335;
    bool _339 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _341 = _337 || _339;
    float _343 = float(_341);
    float _345 = _323 * _327;
    float _347 = -_323;
    float _349 = _347 + 1.0;
    float _351 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _353 = _351 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    bool _355 = _199 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _357 = isnan(_199);
    bool _359 = _355 || _357;
    bool _361 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _363 = _359 || _361;
    float _365 = float(_363);
    float _367 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _369 = _367 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _371 = _343 * _349;
    float _373 = -_343;
    float _375 = _373 + 1.0;
    float _377 = fma(_353, _275, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _379 = fma(_369, _275, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _381 = -_365;
    float _383 = _381 + 1.0;
    float _385 = _365 * _375;
    float _387 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _389 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _387;
    float _391 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _393 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _391;
    float _395 = _291 * _385;
    float _397 = _331 * _385;
    float _399 = fma(_389, _289, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _401 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _403 = _401 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _405 = fma(_383, (*spvDescriptorSet0.vp_c9)._m0[143].x, _395);
    float _407 = fma(_383, (*spvDescriptorSet0.vp_c9)._m0[143].y, _397);
    float _409 = fma(_393, _289, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _411 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _413 = _411 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _415 = fma(_379, _371, _405);
    float _417 = fma(_377, _371, _407);
    float _419 = fma(_403, _263, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _421 = fma(_413, _263, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _423 = fma(_399, _345, _415);
    float _425 = fma(_409, _345, _417);
    float _427 = fma(_419, _329, _423);
    float _429 = fma(_421, _329, _425);
    float _431 = fma(_287, (*spvDescriptorSet0.vp_c9)._m0[147].x, _427);
    float _433 = fma(_287, (*spvDescriptorSet0.vp_c9)._m0[147].y, _429);
    bool _435 = !_261;
    float _437 = _263;
    float _455;
    if (!_435)
    {
        float _439 = in.m_54.x;
        float _441 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _443 = _439 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _445 = fma(_443, (*spvDescriptorSet0.vp_c9)._m0[14].x, _127);
        float _447 = _445 * _441;
        float _449 = floor(_447);
        float _451 = -_449;
        float _453 = _447 + _451;
        _455 = _453;
        _457 = true;
    }
    else
    {
        _455 = _159;
    }
    _457 = false;
    float _459 = _455;
    float _461 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _463 = int(_461);
    float _465 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _467 = int(_465);
    float _469 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _471 = _469 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _473 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _475 = _473 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _477 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _479 = int(_477);
    float _481 = float(_463);
    float _483 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _485 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _483;
    float _487 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _489 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _491 = _489 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    bool _493 = _459 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _495 = isnan(_459);
    bool _497 = _493 || _495;
    bool _499 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _501 = _497 || _499;
    float _503 = float(_501);
    float _505 = float(_467);
    float _507 = 1.0 / _481;
    int _509 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _511 = _509 != 0;
    float _513 = float(uint(_479));
    float _515 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _517 = int(_515);
    int _519 = ~_479;
    int _521 = _519 + 1;
    int _523 = ~_479;
    int _525 = _523 + 1;
    bool _527 = _479 == 0;
    if (_511)
    {
        float _529 = in.m_54.x;
        _437 = _529;
    }
    float _531 = _437;
    float _533 = 1.0 / _505;
    float _535 = _507 * _127;
    float _537 = _531;
    if (!_511)
    {
        float _539 = in.m_54.y;
        _537 = _539;
    }
    float _541 = _537;
    float _543 = float(uint(_517));
    float _545 = 1.0 / _513;
    int _547 = ~_517;
    int _549 = _547 + 1;
    int _551 = ~_517;
    int _553 = _551 + 1;
    float _555 = _533 * _127;
    float _557 = trunc(_535);
    int _559 = int(_557);
    float _561 = 1.0 / _543;
    int _563 = as_type<int>(_545) + (-2);
    float _565 = trunc(_555);
    int _567 = int(_565);
    float _569 = float(uint(_559));
    float _571 = as_type<float>(_563) * _569;
    int _573 = as_type<int>(_561) + (-2);
    float _575 = 1.0 / _471;
    float _577 = float(uint(_567));
    float _579 = trunc(_571);
    float _581 = precise::max(_579, 0.0);
    uint _584 = uint(_581);
    float _586 = as_type<float>(_573) * _577;
    float _588 = in.m_54.x;
    float _590 = in.m_54.y;
    float _592 = in.m_54.z;
    float _594 = in.m_54.w;
    float _596 = trunc(_586);
    float _598 = precise::max(_596, 0.0);
    uint _600 = uint(_598);
    int _602 = _521 * int(_584);
    int _604 = _602 + _559;
    float _606 = 1.0 / _475;
    float _608 = float(uint(_604));
    int _610 = _549 * int(_600);
    int _612 = _610 + _567;
    float _614 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _616 = int(_614);
    float _618 = as_type<float>(_563) * _608;
    float _620 = _608;
    if (_511)
    {
        _620 = 1.0;
    }
    float _622 = _620;
    float _624 = float(uint(_612));
    float _626 = fma(_588, (*spvDescriptorSet0.vp_c9)._m0[78].z, _487);
    float _628 = _622;
    float _630 = _624;
    float _632 = _592;
    if (!_511)
    {
        _628 = 7.345489978790283203125;
    }
    float _634 = _628;
    float _636 = _592 * 2.0;
    float _638 = trunc(_618);
    float _640 = precise::max(_638, 0.0);
    uint _642 = uint(_640);
    float _644 = as_type<float>(_573) * _624;
    if (_511)
    {
        _630 = 1.0;
    }
    float _646 = _630;
    float _648 = _634 * _588;
    float _650 = _646;
    if (!_511)
    {
        _650 = 1.2345600128173828125;
    }
    float _652 = _650;
    float _654 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[77].z, _626);
    float _656 = trunc(_644);
    float _658 = precise::max(_656, 0.0);
    uint _660 = uint(_658);
    float _662 = _541 * _652;
    float _664 = -_654;
    float _666 = _664 + 1.0;
    float _668 = float(_479);
    float _670 = floor(_648);
    int _672 = int(_584) + int(_642);
    float _674 = float(_567);
    int _676 = int(_600) + int(_660);
    int _678 = _525 * _672;
    int _680 = _678 + _559;
    float _682 = float(_559);
    float _684 = floor(_662);
    float _686 = _155 * _127;
    int _688 = _553 * _676;
    int _690 = _688 + _567;
    bool _692 = _682 >= _668;
    bool _694 = isnan(_682);
    bool _696 = _692 || _694;
    bool _698 = isnan(_668);
    bool _700 = _696 || _698;
    float _702 = float(_700);
    bool _704 = uint(_680) >= uint(_479);
    float _706 = -_670;
    float _708 = _648 + _706;
    float _710 = float(_517);
    float _712 = trunc(_702);
    int _714 = int(_712);
    bool _716 = !_704;
    int _718 = _716 ? 0 : (-1);
    int _720 = ~_672;
    int _722 = _720 + _718;
    int _724 = _722 + 1;
    bool _726 = _674 >= _710;
    bool _728 = isnan(_674);
    bool _730 = _726 || _728;
    bool _732 = isnan(_710);
    bool _734 = _730 || _732;
    float _736 = float(_734);
    float _738 = -_684;
    float _740 = _662 + _738;
    float _742 = _708 * _668;
    bool _744 = uint(_690) >= uint(_517);
    int _746 = _479 * _724;
    int _748 = _746 + _559;
    int _750 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _752 = _750 != 0;
    float _754 = trunc(_736);
    int _756 = int(_754);
    float _758 = _668 * _686;
    float _760 = _710 * _686;
    bool _762 = !_744;
    int _764 = _762 ? 0 : (-1);
    float _766 = _740 * _710;
    int _768 = ~_714;
    int _770 = _768 + 1;
    int _772 = _770 + 1;
    bool _774 = !_527;
    int _776 = _774 ? _748 : (-1);
    float _778 = trunc(_742);
    int _780 = int(_778);
    bool _782 = !_752;
    int _784 = _782 ? 0 : 1;
    int _786 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _788 = _786 != 0;
    int _790 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _792 = _790 != 0;
    int _794 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _796 = _794 != 0;
    int _798 = _776 * _772;
    int _800 = ~_676;
    int _802 = _800 + _764;
    int _804 = _802 + 1;
    int _806 = abs(_784);
    float _808 = trunc(_758);
    int _810 = int(_808);
    bool _812 = !_792;
    int _814 = _812 ? 0 : 1;
    int _816 = _517 * _804;
    int _818 = _816 + _567;
    bool _820 = _517 == 0;
    int _822 = _479 + (-1);
    int _824 = _780 * _806;
    int _826 = _824 + _559;
    int _828 = abs(_814);
    float _830 = trunc(_760);
    int _832 = int(_830);
    int _834 = ~_756;
    int _836 = _834 + 1;
    int _838 = _836 + 1;
    int _840 = _714 * _822;
    int _842 = _840 + _798;
    bool _844 = !_820;
    int _846 = _844 ? _818 : (-1);
    int _848 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _850 = _848 != 0;
    float _852 = trunc(_766);
    int _854 = int(_852);
    bool _856 = !_788;
    int _858 = _856 ? 0 : 1;
    int _860 = _846 * _838;
    bool _862 = !_850;
    int _864 = _862 ? 0 : 1;
    int _866 = _842 * _828;
    bool _868 = !_796;
    int _870 = _868 ? 0 : 1;
    int _872 = abs(_858);
    float _874 = floor(_636);
    int _876 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _878 = _876 != 0;
    int _880 = abs(_870);
    int _882 = abs(_864);
    bool _884 = !_878;
    int _886 = _884 ? 0 : 1;
    int _888 = _810 * _872;
    int _890 = _888 + _866;
    int _892 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _894 = _892 != 0;
    int _896 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _898 = _896 != 0;
    int _900 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _902 = _900 != 0;
    int _904 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _906 = _904 != 0;
    int _908 = _854 * _882;
    int _910 = _908 + _567;
    int _912 = _517 + (-1);
    int _914 = _826 * _880;
    int _916 = _914 + _890;
    int _918 = abs(_886);
    bool _920 = !_898;
    int _922 = _920 ? 0 : 1;
    int _924 = _756 * _912;
    int _926 = _924 + _860;
    bool _928 = !_894;
    int _930 = _928 ? 0 : 1;
    int _932 = abs(_922);
    bool _934 = !_902;
    int _936 = _934 ? 0 : 1;
    int _938 = abs(_930);
    int _940 = _926 * _932;
    int _942 = abs(_936);
    int _944 = _780 * _918;
    int _946 = _944 + _916;
    bool _948 = !_906;
    int _950 = _948 ? 0 : 1;
    int _952 = _832 * _938;
    int _954 = _952 + _940;
    float _956 = float(uint(_946));
    int _958 = abs(_950);
    int _960 = _910 * _942;
    int _962 = _960 + _954;
    int _964 = ~_479;
    int _966 = _964 + 1;
    float _968 = as_type<float>(_563) * _956;
    int _970 = ~_517;
    int _972 = _970 + 1;
    int _974 = _854 * _958;
    int _976 = _974 + _962;
    float _978 = float(uint(_826));
    float _980 = trunc(_968);
    float _982 = precise::max(_980, 0.0);
    uint _984 = uint(_982);
    float _986 = float(uint(_910));
    float _988 = float(uint(_976));
    float _990 = as_type<float>(_563) * _978;
    bool _992 = _479 == 0;
    float _994 = as_type<float>(_573) * _986;
    float _996 = as_type<float>(_573) * _988;
    int _998 = ~_479;
    int _1000 = _998 + 1;
    float _1002 = trunc(_996);
    float _1004 = precise::max(_1002, 0.0);
    uint _1006 = uint(_1004);
    float _1008 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1010 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _1008;
    int _1012 = _966 * int(_984);
    int _1014 = _1012 + _946;
    float _1016 = trunc(_994);
    float _1018 = precise::max(_1016, 0.0);
    uint _1020 = uint(_1018);
    float _1022 = float(uint(_1014));
    int _1024 = ~_479;
    int _1026 = _1024 + 1;
    float _1028 = as_type<float>(_563) * _1022;
    int _1030 = _972 * int(_1006);
    int _1032 = _1030 + _976;
    float _1034 = trunc(_1028);
    float _1036 = precise::max(_1034, 0.0);
    uint _1038 = uint(_1036);
    float _1040 = float(uint(_1032));
    float _1042 = as_type<float>(_573) * _1040;
    float _1044 = trunc(_990);
    float _1046 = precise::max(_1044, 0.0);
    uint _1048 = uint(_1046);
    float _1050 = trunc(_1042);
    float _1052 = precise::max(_1050, 0.0);
    uint _1054 = uint(_1052);
    int _1056 = int(_984) + int(_1038);
    int _1058 = ~_517;
    int _1060 = _1058 + 1;
    int _1062 = _1000 * _1056;
    int _1064 = _1062 + _946;
    int _1066 = _1026 * int(_1048);
    int _1068 = _1066 + _826;
    float _1070 = _590 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _1072 = uint(_1064) >= uint(_479);
    float _1074 = float(uint(_1068));
    bool _1076 = !_1072;
    int _1078 = _1076 ? 0 : (-1);
    int _1080 = int(_1006) + int(_1054);
    float _1082 = as_type<float>(_563) * _1074;
    int _1084 = ~_1056;
    int _1086 = _1084 + _1078;
    int _1088 = _1086 + 1;
    int _1090 = ~_517;
    int _1092 = _1090 + 1;
    int _1094 = _1060 * _1080;
    int _1096 = _1094 + _976;
    float _1098 = trunc(_1082);
    float _1100 = precise::max(_1098, 0.0);
    uint _1102 = uint(_1100);
    int _1104 = _479 * _1088;
    int _1106 = _1104 + _946;
    bool _1108 = uint(_1096) >= uint(_517);
    int _1110 = _1092 * int(_1020);
    int _1112 = _1110 + _910;
    float _1114 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _1116 = !_992;
    int _1118 = _1116 ? _1106 : (-1);
    bool _1120 = !_1108;
    int _1122 = _1120 ? 0 : (-1);
    int _1124 = _1118 & 3;
    bool _1126 = _1124 != 0;
    int _1128 = _1118 & 3;
    bool _1130 = _1128 != 0;
    int _1132 = ~_1080;
    int _1134 = _1132 + _1122;
    int _1136 = _1134 + 1;
    int _1138 = int(_1048) + int(_1102);
    int _1140 = ~_479;
    int _1142 = _1140 + 1;
    int _1144 = _517 * _1136;
    int _1146 = _1144 + _976;
    bool _1148 = uint(_1124) > 1u;
    int _1150 = _1130 ? 0 : 1;
    float _1152 = float(uint(_1112));
    bool _1154 = _1124 != 3;
    float _1156 = as_type<float>(_573) * _1152;
    bool _1158 = uint(_1124) >= 2u;
    bool _1160 = !_820;
    int _1162 = _1160 ? _1146 : (-1);
    int _1164 = _1142 * _1138;
    int _1166 = _1164 + _826;
    int _1168 = _1158 ? 0 : 1;
    float _1170 = trunc(_1156);
    float _1172 = precise::max(_1170, 0.0);
    uint _1174 = uint(_1172);
    int _1176 = _1162 & 3;
    bool _1178 = _1176 != 0;
    int _1180 = ~_1150;
    int _1182 = _1180 + 1;
    int _1184 = _1182 + 1;
    int _1186 = _1184;
    int _1188 = _1168;
    if (!_1148)
    {
        int _1190 = ~_1150;
        int _1192 = _1190 + 1;
        _1186 = _1192;
    }
    int _1194 = _1186;
    int _1196 = ~_1168;
    int _1198 = _1196 + 1;
    int _1200 = _1198 + 1;
    bool _1202 = uint(_1166) >= uint(_479);
    int _1204 = _1200;
    float _1206 = as_type<float>(_1194);
    if (_1154)
    {
        int _1208 = ~_1168;
        int _1210 = _1208 + 1;
        _1204 = _1210;
    }
    int _1212 = _1204;
    bool _1214 = uint(_1176) > 1u;
    int _1216 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1218 = _1216 != 0;
    bool _1220 = !_1202;
    int _1222 = _1220 ? 0 : (-1);
    int _1224 = _1162 & 3;
    bool _1226 = _1224 != 0;
    int _1228 = ~_1138;
    int _1230 = _1228 + _1222;
    int _1232 = _1230 + 1;
    int _1234 = _1226 ? 0 : 1;
    int _1236 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1238 = _1236 != 0;
    int _1240 = _479 * _1232;
    int _1242 = _1240 + _826;
    int _1244 = ~_1234;
    int _1246 = _1244 + 1;
    int _1248 = _1246 + 1;
    int _1250 = _1248;
    if (!_1214)
    {
        int _1252 = ~_1234;
        int _1254 = _1252 + 1;
        _1250 = _1254;
    }
    int _1256 = _1250;
    if (_1218)
    {
        _1188 = 0;
    }
    int _1258 = _1188;
    int _1260 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1262 = _1260 != 0;
    int _1264 = _1258;
    if (!_1218)
    {
        _1264 = 1;
    }
    int _1266 = _1264;
    bool _1268 = _1176 != 3;
    bool _1270 = !_1262;
    int _1272 = _1270 ? 0 : 1;
    bool _1274 = uint(_1176) >= 2u;
    int _1276 = _1274 ? 0 : 1;
    bool _1278 = !_1238;
    int _1280 = _1278 ? 0 : 1;
    int _1282 = ~_1276;
    int _1284 = _1282 + 1;
    int _1286 = _1284 + 1;
    bool _1288 = !_992;
    int _1290 = _1288 ? _1242 : (-1);
    float _1292 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1294 = _1292 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    int _1296 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1298 = _1296 != 0;
    int _1300 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1302 = _1300 != 0;
    float _1304 = 1.0 / _1294;
    int _1306 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1308 = _1306 != 0;
    int _1310 = _1286;
    if (_1268)
    {
        int _1312 = ~_1276;
        int _1314 = _1312 + 1;
        _1310 = _1314;
    }
    int _1316 = _1310;
    float _1318 = in.m_44.x;
    float _1320 = in.m_44.y;
    float _1322 = in.m_44.z;
    int _1324 = int(_1020) + int(_1174);
    int _1326 = ~_517;
    int _1328 = _1326 + 1;
    int _1330 = _1328 * _1324;
    int _1332 = _1330 + _910;
    float _1334 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1336 = _1334 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1338 = _588 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _1340 = _592 > 0.5;
    bool _1342 = uint(_1332) >= uint(_517);
    float _1344 = 1.0 / _1336;
    float _1346 = -_1114;
    float _1348 = fma(_1338, 2.0, _1346);
    float _1350 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    bool _1352 = !_1342;
    int _1354 = _1352 ? 0 : (-1);
    bool _1356 = _588 > 0.5;
    float _1358 = fma(_1070, -2.0, _1350);
    bool _1360 = !_1126;
    int _1362 = _1360 ? 0 : 1;
    float _1364 = _1320 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1366 = _1320 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1368 = _1320 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1370 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _1372 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _1370;
    float _1374 = fma(_1318, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1364);
    float _1376 = fma(_1318, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1366);
    float _1378 = fma(_1318, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1368);
    float _1380 = _1372 * _575;
    float _1382 = -_171;
    int _1384 = _1356 ? as_type<int>(_1382) : as_type<int>(_171);
    float _1386 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _1388 = _1386 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    int _1390 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1392 = _1390 != 0;
    float _1394 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1396 = _1394 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _1398 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1400 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _1398;
    int _1402 = ~_1324;
    int _1404 = _1402 + _1354;
    int _1406 = _1404 + 1;
    float _1408 = _588 * 2.0;
    int _1410 = _1118 >> 31;
    float _1412 = 1.0 / _1396;
    float _1414 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1416 = _1414 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1418 = _1400 * _606;
    float _1420 = _588 + _590;
    bool _1422 = !_1392;
    float _1424 = _1422 ? _171 : as_type<float>(_1384);
    int _1426 = _517 * _1406;
    int _1428 = _1426 + _910;
    float _1430 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1432 = _1430 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1434 = 1.0 / _1416;
    float _1436 = _1420 + (-1.0);
    bool _1438 = _590 > 0.5;
    float _1440 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _1442 = _1440 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1444 = _590 * 2.0;
    float _1446 = _592 + _588;
    float _1448 = _1388 * _1304;
    float _1450 = _1442 * _1344;
    float _1452 = _1010 * _1412;
    int _1454 = _1410 & 3;
    float _1456 = floor(_1408);
    float _1458 = -_171;
    int _1460 = _1340 ? as_type<int>(_1458) : as_type<int>(_171);
    float _1462 = _588 + (-0.5);
    int _1464 = _1118 + _1454;
    float _1466 = _592 + _590;
    bool _1468 = _594 > 0.5;
    float _1470 = _485 * _1434;
    int _1472 = _1464 >> 2;
    float _1474 = 1.0 / _1432;
    float _1476 = _1466 + (-1.0);
    bool _1478 = !_1302;
    float _1480 = _1478 ? _171 : as_type<float>(_1460);
    float _1482 = _592 + (-0.5);
    int _1484 = _1472 << 4;
    int _1486 = _1484 + 368;
    float _1488 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1358);
    int _1490 = abs(_1194);
    float _1492 = floor(_1444);
    int _1494 = ~_1490;
    int _1496 = _1494 + 1;
    int _1498 = _1496 + 1;
    int _1500 = abs(_1362);
    float _1502 = fma(_1436, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1504 = -_175;
    int _1506 = _1438 ? as_type<int>(_1504) : as_type<int>(_175);
    float _1508 = _491 * _1474;
    bool _1510 = _517 == 0;
    float _1512 = fma(_590, 6.283185482025146484375, _127);
    int _1514 = _1162 >> 31;
    bool _1516 = !_1298;
    float _1518 = _1516 ? _175 : as_type<float>(_1506);
    bool _1520 = !_1510;
    int _1522 = _1520 ? _1428 : (-1);
    uint _1524 = uint(int(uint(_1486) >> uint(2)));
    uint _1526 = uint(int(uint(int(_1524)) >> uint(2)));
    int _1528 = int(_1524) & 3;
    float _1530 = (*spvDescriptorSet0.vp_c9)._m0[int(_1526)][_1528];
    int _1532 = int(_1524) + 1;
    uint _1534 = uint(int(uint(_1532) >> uint(2)));
    int _1536 = _1532 & 3;
    float _1538 = (*spvDescriptorSet0.vp_c9)._m0[int(_1534)][_1536];
    bool _1540 = _1456 > 0.0;
    float _1542 = fma(_594, 6.283185482025146484375, _127);
    bool _1544 = _1456 >= 0.0;
    bool _1546 = isnan(_1456);
    bool _1548 = _1544 || _1546;
    bool _1550 = isnan(0.0);
    bool _1552 = _1548 || _1550;
    float _1554 = fma(_1476, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _1556 = int(_1308);
    int _1558 = _1126 ? 2 : 0;
    int _1560 = _1556 | _1558;
    int _1562 = _1302 ? 4 : 0;
    int _1564 = _1560 | _1562;
    int _1566 = _1540 ? 8 : 0;
    int _1568 = _1564 | _1566;
    int _1570 = _1178 ? 16 : 0;
    int _1572 = _1568 | _1570;
    int _1574 = _1552 ? 32 : 0;
    int _1576 = _1572 | _1574;
    int _1578 = _1468 ? 64 : 0;
    int _1580 = _1576 | _1578;
    int _1582 = _1580 & 64;
    float _1584 = fma(_592, 6.283185482025146484375, _127);
    int _1586 = _1514 & 3;
    float _1588 = _1542 * 1.57079637050628662109375;
    bool _1590 = _1266 != 1;
    float _1592 = _590 + (-0.5);
    bool _1594 = _1582 != 0;
    int _1596 = _1162 + _1586;
    int _1598 = _1486 + 8;
    uint _1600 = uint(int(uint(_1598) >> uint(2)));
    uint _1602 = uint(int(uint(int(_1600)) >> uint(2)));
    int _1604 = int(_1600) & 3;
    float _1606 = (*spvDescriptorSet0.vp_c9)._m0[int(_1602)][_1604];
    int _1608 = int(_1600) + 1;
    uint _1610 = uint(int(uint(_1608) >> uint(2)));
    int _1612 = _1608 & 3;
    float _1614 = (*spvDescriptorSet0.vp_c9)._m0[int(_1610)][_1612];
    float _1616 = -_175;
    int _1618 = _1594 ? as_type<int>(_1616) : as_type<int>(_175);
    int _1620 = _1596 >> 2;
    bool _1622 = _1492 > 0.0;
    bool _1624 = _1492 >= 0.0;
    bool _1626 = isnan(_1492);
    bool _1628 = _1624 || _1626;
    bool _1630 = isnan(0.0);
    bool _1632 = _1628 || _1630;
    int _1634 = _1620 << 4;
    int _1636 = _1634 + 512;
    float _1638 = 0.0;
    if (!_1590)
    {
        _1638 = _590;
    }
    float _1640 = _1638;
    float _1642 = 0.0;
    float _1644 = _1640;
    if (!_1590)
    {
        _1642 = _590;
    }
    float _1646 = _1642;
    float _1648 = _1646;
    if (_1590)
    {
        _1644 = _588;
    }
    float _1650 = _1644;
    if (_1590)
    {
        _1648 = _588;
    }
    float _1652 = _1648;
    float _1654 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    if (!_1590)
    {
        _1206 = _592;
    }
    float _1656 = _1206;
    uint _1658 = uint(int(uint(_1636) >> uint(2)));
    uint _1660 = uint(int(uint(int(_1658)) >> uint(2)));
    int _1662 = int(_1658) & 3;
    float _1664 = (*spvDescriptorSet0.vp_c9)._m0[int(_1660)][_1662];
    int _1666 = int(_1658) + 1;
    uint _1668 = uint(int(uint(_1666) >> uint(2)));
    int _1670 = _1666 & 3;
    float _1672 = (*spvDescriptorSet0.vp_c9)._m0[int(_1668)][_1670];
    float _1674 = _1656;
    if (_1590)
    {
        _632 = _590;
    }
    float _1676 = _632;
    float _1678 = fma(_590, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1654);
    if (_1590)
    {
        _1674 = _590;
    }
    float _1680 = _1674;
    float _1682 = _1650 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    bool _1684 = !_1178;
    int _1686 = _1684 ? 0 : 1;
    float _1688 = _1676 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _1690 = _1124 != 3;
    int _1692 = _1636 + 8;
    uint _1694 = uint(int(uint(_1692) >> uint(2)));
    uint _1696 = uint(int(uint(int(_1694)) >> uint(2)));
    int _1698 = int(_1694) & 3;
    float _1700 = (*spvDescriptorSet0.vp_c9)._m0[int(_1696)][_1698];
    int _1702 = int(_1694) + 1;
    uint _1704 = uint(int(uint(_1702) >> uint(2)));
    int _1706 = _1702 & 3;
    float _1708 = (*spvDescriptorSet0.vp_c9)._m0[int(_1704)][_1706];
    int _1710 = abs(_1212);
    float _1712 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1678);
    int _1714 = ~_1500;
    int _1716 = _1714 + 1;
    int _1718 = _1716 + 1;
    int _1720 = _1498 * as_type<int>(_1538);
    bool _1722 = _1176 != 3;
    bool _1724 = !_1690;
    int _1726 = _1724 ? 0 : (-1);
    int _1728 = _1718 * as_type<int>(_1530);
    int _1730 = _1728 + _1720;
    int _1732 = ~_1710;
    int _1734 = _1732 + 1;
    int _1736 = _1734 + 1;
    int _1738 = abs(_1726);
    int _1740 = abs(_1256);
    float _1742 = float(uint(_616));
    int _1744 = _1552 ? 0 : 1;
    int _1746 = _1736 * as_type<int>(_1606);
    int _1748 = _1746 + _1730;
    bool _1750 = !_1722;
    int _1752 = _1750 ? 0 : (-1);
    int _1754 = abs(_1280);
    int _1756 = ~_1738;
    int _1758 = _1756 + 1;
    int _1760 = _1758 + 1;
    int _1762 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1764 = _1762 != 0;
    int _1766 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1768 = _1766 != 0;
    int _1770 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1772 = _1770 != 0;
    float _1774 = 1.0 / _1742;
    int _1776 = ~_1740;
    int _1778 = _1776 + 1;
    int _1780 = _1778 + 1;
    int _1782 = _1760 * as_type<int>(_1614);
    int _1784 = _1782 + _1748;
    int _1786 = ~_1754;
    int _1788 = _1786 + 1;
    int _1790 = _1788 + 1;
    int _1792 = abs(_1316);
    int _1794 = ~_1744;
    int _1796 = _1794 + 1;
    int _1798 = _1796 + 1;
    int _1800 = _1784 * _1790;
    int _1802 = abs(_1686);
    int _1804 = _1780 * as_type<int>(_1672);
    int _1806 = _1798;
    if (!_1540)
    {
        int _1808 = ~_1744;
        int _1810 = _1808 + 1;
        _1806 = _1810;
    }
    int _1812 = _1806;
    int _1814 = _1290 * _1754;
    int _1816 = _1814 + _1800;
    int _1818 = ~_1802;
    int _1820 = _1818 + 1;
    int _1822 = _1820 + 1;
    float _1824 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _1826 = int(_1824);
    int _1828 = abs(_1272);
    int _1830 = as_type<int>(_1774) + (-2);
    int _1832 = _1822 * as_type<int>(_1664);
    int _1834 = _1832 + _1804;
    float _1836 = float(uint(_1816));
    int _1838 = ~_1792;
    int _1840 = _1838 + 1;
    int _1842 = _1840 + 1;
    int _1844 = abs(_1752);
    bool _1846 = _874 >= 0.0;
    bool _1848 = isnan(_874);
    bool _1850 = _1846 || _1848;
    bool _1852 = isnan(0.0);
    bool _1854 = _1850 || _1852;
    int _1856 = _1842 * as_type<int>(_1700);
    int _1858 = _1856 + _1834;
    float _1860 = as_type<float>(_1830) * _1836;
    int _1862 = ~_1844;
    int _1864 = _1862 + 1;
    int _1866 = _1864 + 1;
    float _1868 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1870 = _459 + _1868;
    float _1872 = fma(_1322, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1376);
    float _1874 = fma(_1322, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1374);
    float _1876 = fma(_1322, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1378);
    float _1878 = trunc(_1860);
    float _1880 = precise::max(_1878, 0.0);
    uint _1882 = uint(_1880);
    int _1884 = _1866 * as_type<int>(_1708);
    int _1886 = _1884 + _1858;
    float _1888 = fma(_1380, _1870, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _1890 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1892 = _459 + _1890;
    int _1894 = ~_616;
    int _1896 = _1894 + 1;
    int _1898 = ~_1828;
    int _1900 = _1898 + 1;
    int _1902 = _1900 + 1;
    float _1904 = fma(_1448, _1892, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    int _1906 = abs(_616);
    float _1908 = float(uint(_1826));
    int _1910 = _1886 * _1902;
    int _1912 = _1854 ? 0 : 1;
    bool _1914 = _874 > 0.0;
    int _1916 = _1896 * int(_1882);
    int _1918 = _1916 + _1816;
    float _1920 = float(uint(_1906));
    float _1922 = 1.0 / _1908;
    int _1924 = abs(_1826);
    float _1926 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1928 = _459 + _1926;
    float _1930 = float(uint(_1918));
    int _1932 = _1522 * _1828;
    int _1934 = _1932 + _1910;
    float _1936 = fma(_1418, _1928, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    bool _1938 = _459 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _1940 = isnan(_459);
    bool _1942 = _1938 || _1940;
    bool _1944 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _1946 = _1942 || _1944;
    float _1948 = float(_1946);
    float _1950 = 1.0 / _1920;
    bool _1952 = _459 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1954 = isnan(_459);
    bool _1956 = _1952 || _1954;
    bool _1958 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1960 = _1956 || _1958;
    float _1962 = float(_1960);
    float _1964 = as_type<float>(_1830) * _1930;
    float _1966 = float(uint(_1924));
    int _1968 = abs(_1816);
    float _1970 = -_1962;
    float _1972 = _1970 + 1.0;
    float _1974 = float(uint(_1934));
    float _1976 = trunc(_1964);
    float _1978 = precise::max(_1976, 0.0);
    uint _1980 = uint(_1978);
    int _1982 = as_type<int>(_1922) + (-2);
    float _1984 = _1948 * _1972;
    int _1986 = abs(_1934);
    float _1988 = as_type<float>(_1982) * _1974;
    float _1990 = float(uint(_1968));
    float _1992 = 1.0 / _1966;
    int _1994 = as_type<int>(_1950) + (-2);
    float _1996 = -_1948;
    float _1998 = _1996 + 1.0;
    bool _2000 = _459 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _2002 = isnan(_459);
    bool _2004 = _2000 || _2002;
    bool _2006 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _2008 = _2004 || _2006;
    float _2010 = float(_2008);
    bool _2012 = _459 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _2014 = isnan(_459);
    bool _2016 = _2012 || _2014;
    bool _2018 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _2020 = _2016 || _2018;
    float _2022 = float(_2020);
    float _2024 = as_type<float>(_1994) * _1990;
    float _2026 = float(uint(_1986));
    float _2028 = trunc(_1988);
    float _2030 = precise::max(_2028, 0.0);
    uint _2032 = uint(_2030);
    float _2034 = _2010 * _1998;
    bool _2036 = _459 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _2038 = isnan(_459);
    bool _2040 = _2036 || _2038;
    bool _2042 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _2044 = _2040 || _2042;
    float _2046 = float(_2044);
    float _2048 = -_2010;
    float _2050 = _2048 + 1.0;
    float _2052 = -_2022;
    float _2054 = _2052 + 1.0;
    int _2056 = ~_1826;
    int _2058 = _2056 + 1;
    float _2060 = _2022 * _2050;
    int _2062 = as_type<int>(_1992) + (-2);
    float _2064 = trunc(_2024);
    float _2066 = precise::max(_2064, 0.0);
    uint _2068 = uint(_2066);
    float _2070 = _2046 * _2054;
    int _2072 = ~_1906;
    int _2074 = _2072 + 1;
    float _2076 = -_2046;
    float _2078 = _2076 + 1.0;
    float _2080 = as_type<float>(_2062) * _2026;
    bool _2082 = _459 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _2084 = isnan(_459);
    bool _2086 = _2082 || _2084;
    bool _2088 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _2090 = _2086 || _2088;
    float _2092 = float(_2090);
    int _2094 = _2058 * int(_2032);
    int _2096 = _2094 + _1934;
    float _2098 = trunc(_2080);
    float _2100 = precise::max(_2098, 0.0);
    uint _2102 = uint(_2100);
    int _2104 = ~_1924;
    int _2106 = _2104 + 1;
    float _2108 = -_2092;
    float _2110 = _2108 + 1.0;
    float _2112 = _2092 * _2078;
    float _2114 = float(uint(_2096));
    float _2116 = _503 * _2110;
    float _2118 = -_503;
    float _2120 = _2118 + 1.0;
    int _2122 = _2074 * int(_2068);
    int _2124 = _2122 + _1968;
    float _2126 = as_type<float>(_1982) * _2114;
    bool _2128 = _459 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _2130 = isnan(_459);
    bool _2132 = _2128 || _2130;
    bool _2134 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _2136 = _2132 || _2134;
    float _2138 = float(_2136);
    float _2140 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2142 = _459 + _2140;
    bool _2144 = !_1308;
    float _2146 = _2144 ? _175 : as_type<float>(_1618);
    float _2148 = float(uint(_2124));
    float _2150 = trunc(_2126);
    float _2152 = precise::max(_2150, 0.0);
    uint _2154 = uint(_2152);
    int _2156 = _2106 * int(_2102);
    int _2158 = _2156 + _1986;
    float _2160 = fma(_1450, _2142, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _2162 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2164 = _459 + _2162;
    float _2166 = as_type<float>(_1994) * _2148;
    float _2168 = _2138 * _2120;
    float _2170 = float(uint(_2158));
    float _2172 = -_2138;
    float _2174 = _2172 + 1.0;
    int _2176 = ~_616;
    int _2178 = _2176 + 1;
    float _2180 = _1888 * _2168;
    int _2182 = int(_1882) + int(_1980);
    float _2184 = as_type<float>(_2062) * _2170;
    float _2186 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2188 = _459 + _2186;
    float _2190 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2192 = _459 + _2190;
    float _2194 = trunc(_2166);
    float _2196 = precise::max(_2194, 0.0);
    uint _2198 = uint(_2196);
    float _2200 = fma(_2174, (*spvDescriptorSet0.vp_c9)._m0[159].x, _2180);
    int _2202 = int(_2032) + int(_2154);
    float _2204 = fma(_1452, _2192, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    int _2206 = _2178 * _2182;
    int _2208 = _2206 + _1816;
    int _2210 = ~_1826;
    int _2212 = _2210 + 1;
    float _2214 = fma(_1904, _2116, _2200);
    int _2216 = ~_1912;
    int _2218 = _2216 + 1;
    int _2220 = _2218 + 1;
    float _2222 = trunc(_2184);
    float _2224 = precise::max(_2222, 0.0);
    uint _2226 = uint(_2224);
    int _2228 = _2220;
    if (!_1914)
    {
        int _2230 = ~_1912;
        int _2232 = _2230 + 1;
        _2228 = _2232;
    }
    int _2234 = _2228;
    int _2236 = _2212 * _2202;
    int _2238 = _2236 + _1934;
    bool _2240 = uint(_2208) >= uint(_616);
    float _2242 = fma(_1508, _2188, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _2244 = fma(_1936, _2112, _2214);
    bool _2246 = !_2240;
    int _2248 = _2246 ? 0 : (-1);
    float _2250 = fma(_1470, _2164, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    int _2252 = int(_2068) + int(_2198);
    float _2254 = fma(_2160, _2070, _2244);
    int _2256 = ~_1924;
    int _2258 = _2256 + 1;
    float _2260 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _2262 = uint(_2238) >= uint(_1826);
    float _2264 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _2266 = ~_2182;
    int _2268 = _2266 + _2248;
    int _2270 = _2268 + 1;
    float _2272 = fma(_2250, _2060, _2254);
    int _2274 = int(_2102) + int(_2226);
    int _2276 = ~_1906;
    int _2278 = _2276 + 1;
    float _2280 = fma(_2242, _2034, _2272);
    bool _2282 = !_2262;
    int _2284 = _2282 ? 0 : (-1);
    int _2286 = _2258 * _2274;
    int _2288 = _2286 + _1986;
    int _2290 = _2278 * _2252;
    int _2292 = _2290 + _1968;
    int _2294 = ~_2202;
    int _2296 = _2294 + _2284;
    int _2298 = _2296 + 1;
    float _2300 = fma(_2204, _1984, _2280);
    bool _2302 = !_1768;
    int _2304 = _2302 ? 0 : 1;
    float _2306 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    bool _2308 = uint(_2292) >= uint(_1906);
    float _2310 = fma(_1680, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2264);
    float _2312 = fma(_1652, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2306);
    bool _2314 = !_2308;
    int _2316 = _2314 ? 0 : (-1);
    int _2318 = _1826 * _2298;
    int _2320 = _2318 + _1934;
    bool _2322 = uint(_2288) >= uint(_1924);
    int _2324 = _616 * _2270;
    int _2326 = _2324 + _1816;
    float _2328 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    int _2330 = ~_2316;
    int _2332 = _2252 + _2330;
    int _2334 = _2332 + 1;
    float _2336 = _1872 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _2338 = !_2322;
    int _2340 = _2338 ? 0 : (-1);
    float _2342 = -_127;
    float _2344 = fma(_2342, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1348);
    bool _2346 = _616 == 0;
    float _2348 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2350 = _2336 + _2348;
    int _2352 = _1934 ^ _1826;
    float _2354 = _2260 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _2356 = !_2346;
    int _2358 = _2356 ? _2326 : (-1);
    float _2360 = _1876 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _2362 = _1826 == 0;
    float _2364 = _2350 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    uint _2366 = uint(int(uint(_2352) >> uint(31)));
    float _2368 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2312);
    bool _2370 = !_2362;
    int _2372 = _2370 ? _2320 : (-1);
    float _2374 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2310);
    bool _2376 = _616 == 0;
    float _2378 = fma(_1962, (*spvDescriptorSet0.vp_c9)._m0[166].x, _2300);
    int _2380 = _1816 ^ _616;
    float _2382 = -_2328;
    float _2384 = fma(_1682, 2.0, _2382);
    float _2386 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    uint _2388 = uint(int(uint(_2380) >> uint(31)));
    float _2390 = -_127;
    float _2392 = fma(_2390, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2384);
    int _2394 = abs(_2304);
    float _2396 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _2398 = ~int(_2388);
    int _2400 = _2398 + 1;
    out.m_60.x = _2378;
    int _2402 = ~_2340;
    int _2404 = _2274 + _2402;
    int _2406 = _2404 + 1;
    float _2408 = fma(_1688, -2.0, _2396);
    int _2410 = _2334 ^ _2400;
    float _2412 = _1874 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _2414 = ~int(_2366);
    int _2416 = _2414 + 1;
    int _2418 = ~_2400;
    int _2420 = _2418 + _2410;
    int _2422 = _2420 + 1;
    float _2424 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2426 = _2412 + _2424;
    float _2428 = float(_1812);
    float _2430 = _2386 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    bool _2432 = !_2376;
    int _2434 = _2432 ? _2422 : (-1);
    float _2436 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _2438 = _1826 == 0;
    float _2440 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2442 = _2360 + _2440;
    float _2444 = float(_2394);
    float _2446 = float(_2358);
    int _2448 = _2406 ^ _2416;
    float _2450 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2452 = float(_2372);
    float _2454 = _2444 * _2428;
    float _2456 = fma(_2426, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2364);
    int _2458 = ~_2416;
    int _2460 = _2458 + _2448;
    int _2462 = _2460 + 1;
    float _2464 = fma(_2354, _2446, _2344);
    float _2466 = fma(_2430, _2452, _2392);
    float _2468 = _1424 + 0.5;
    bool _2470 = !_2438;
    int _2472 = _2470 ? _2462 : (-1);
    float _2474 = _2436 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2476 = float(_2434);
    float _2478 = fma(_2354, _2468, _2464);
    float _2480 = float(_2472);
    float _2482 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2408);
    float _2484 = _1480 + 0.5;
    float _2486 = -_1488;
    float _2488 = fma(_2474, _2476, _2486);
    float _2490 = _2450 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2492 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _2494 = log2(_2492);
    float _2496 = fma(_2430, _2484, _2466);
    float _2498 = -_2368;
    float _2500 = _2498 + 1.0;
    float _2502 = -_2482;
    float _2504 = fma(_2490, _2480, _2502);
    float _2506 = _1518 + (-0.5);
    float _2508 = _2146 + (-0.5);
    float _2510 = fma(_2442, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2456);
    float _2512 = -_2500;
    float _2514 = fma(_1480, _2512, _2496);
    float _2516 = -_2474;
    float _2518 = fma(_2516, _2506, _2488);
    float _2520 = -_2490;
    float _2522 = fma(_2520, _2508, _2504);
    bool _2524 = !_1764;
    int _2526 = _2524 ? 0 : 1;
    float _2528 = -_1712;
    float _2530 = _2528 + 1.0;
    bool _2532 = _2510 >= 0.0;
    float _2534 = -_666;
    float _2536 = fma(_1424, _2534, _2478);
    int _2538 = abs(_2526);
    float _2540 = _2350 * _2350;
    float _2542 = float(_2234);
    float _2544 = _2494 * _127;
    float _2546 = float(_2538);
    float _2548 = fma(_2426, _2426, _2540);
    float _2550 = fma(_1518, _2530, _2518);
    float _2552 = -_2374;
    float _2554 = _2552 + 1.0;
    float _2556 = _2546 * _2542;
    float _2558 = fma(_2442, _2442, _2548);
    float _2560 = in.m_62.x;
    float _2562 = in.m_62.y;
    float _2564 = in.m_62.z;
    float _2566 = fma(_2146, _2554, _2522);
    float _2568 = exp2(_2544);
    float _2570 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _2572 = 1.0 + _2570;
    float _2574 = _2540;
    if (_2532)
    {
        _2574 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2576 = _2574;
    out.m_64.x = _2536;
    out.m_64.y = _2550;
    out.m_64.z = _2514;
    out.m_64.w = _2566;
    bool _2578 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2580 = isnan(0.0);
    bool _2582 = _2578 || _2580;
    bool _2584 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2586 = _2582 || _2584;
    float _2588 = _1512 * 1.57079637050628662109375;
    int _2590 = as_type<int>(_2576);
    if (_2532)
    {
        float _2592 = _2576 * 5.0;
        _2590 = as_type<int>(_2592);
    }
    int _2594 = _2590;
    float _2596 = rsqrt(_2558);
    if (_2532)
    {
        out.m_47.x = 0.0;
    }
    bool _2598 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2600 = isnan(1.0);
    bool _2602 = _2598 || _2600;
    bool _2604 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2606 = _2602 || _2604;
    if (_2532)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7688 = as_type<float>(_2594);
        out.gl_Position.z = _7688;
    }
    float _2608 = 1.0 / _2572;
    float _2610 = -_2568;
    float _2612 = _2610 + 1.0;
    float _2614 = _2350 * _2596;
    bool _2616 = !_1772;
    int _2618 = _2616 ? 0 : 1;
    float _2620 = _2426 * _2596;
    if (_2532)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2622 = -_2614;
    float _2624 = fma(_2622, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2336);
    float _2626 = _1588 * 0.15915493667125701904296875;
    float _2628 = _2442 * _2596;
    float _2630 = -_2620;
    float _2632 = fma(_2630, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2412);
    float _2634 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2636 = _2624 + _2634;
    float _2638 = _2556 * (-2.0);
    float _2640 = -_2628;
    float _2642 = fma(_2640, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2360);
    float _2644 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2646 = _2632 + _2644;
    float _2648 = _2636 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2650 = _2586 ? _2612 : 0.0;
    float _2652 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2654 = _2642 + _2652;
    float _2656 = _2454 * (-2.0);
    float _2658 = fma(_2646, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2648);
    float _2660 = _2588 * 0.15915493667125701904296875;
    float _2662 = fma(_1502, _2638, _1502);
    float _2664 = fma(_2638, _2560, _2560);
    float _2666 = fma(_2654, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2658);
    float _2668 = _2660;
    float _2670 = _2624;
    if (_2606)
    {
        float _2672 = _2650 * _2608;
        _145 = _2672;
    }
    float _2674 = _145;
    float _2676 = _1584 * 1.57079637050628662109375;
    float _2678 = fma(_1462, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2664);
    float _2680 = fma(_2656, _2562, _2562);
    bool _2682 = _2666 >= 0.0;
    float _2684 = _2676 * 0.15915493667125701904296875;
    float _2686 = fma(_2662, _2674, _2678);
    int _2688 = _1632 ? 0 : 1;
    float _2690 = fma(_1554, _2656, _1554);
    float _2692 = fma(_1592, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2680);
    int _2694 = abs(_2618);
    float _2696 = _2686 * 0.15915493667125701904296875;
    int _2698 = ~_2688;
    int _2700 = _2698 + 1;
    int _2702 = _2700 + 1;
    float _2704 = _2660 * 6.283185482025146484375;
    float _2706 = sin(_2704);
    int _2708 = _2702;
    if (!_1622)
    {
        int _2710 = ~_2688;
        int _2712 = _2710 + 1;
        _2708 = _2712;
    }
    int _2714 = _2708;
    float _2716 = fma(_2690, _2674, _2692);
    float _2718 = _1446 + (-1.0);
    if (_2682)
    {
        out.m_47.x = 0.0;
    }
    float _2720 = _2626 * 6.283185482025146484375;
    float _2722 = sin(_2720);
    if (_2682)
    {
        _2668 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2724 = _2668;
    float _2726 = fma(_2718, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2728 = float(_2714);
    float _2730 = float(_2694);
    int _2732 = as_type<int>(_2724);
    if (_2682)
    {
        float _2734 = _2724 * 5.0;
        _2732 = as_type<int>(_2734);
    }
    int _2736 = _2732;
    float _2738 = _2684 * 6.283185482025146484375;
    float _2740 = sin(_2738);
    if (_2682)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7902 = as_type<float>(_2736);
        out.gl_Position.z = _7902;
    }
    float _2742 = _2696 * 6.283185482025146484375;
    float _2744 = sin(_2742);
    float _2746 = _2696 * 6.283185482025146484375;
    float _2748 = cos(_2746);
    if (_2682)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2750 = -_2336;
    float _2752 = _2750 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2754 = _2730 * _2728;
    float _2756 = _2716 * 0.15915493667125701904296875;
    float _2758 = -_2412;
    float _2760 = _2758 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2762 = _2752 * _2752;
    float _2764 = _2754 * (-2.0);
    float _2766 = -_2360;
    float _2768 = _2766 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2770 = _159 + (*spvDescriptorSet0.vp_c9)._m0[191].z;
    float _2772 = fma(_2760, _2760, _2762);
    float _2774 = fma(_2764, _2564, _2564);
    float _2776 = in.m_66.x;
    float _2778 = in.m_66.y;
    float _2780 = fma(_2726, _2764, _2726);
    float _2782 = fma(_2768, _2768, _2772);
    float _2784 = fma(_1482, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2774);
    float _2786 = -_2770;
    float _2788 = _2786 + 1.0;
    float _2790 = precise::clamp(_2788, 0.0, 1.0);
    float _2792 = rsqrt(_2782);
    float _2794 = fma(_2780, _2674, _2784);
    float _2796 = -_2614;
    float _2798 = fma(_2796, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2350);
    float _2800 = fma(_2790, -2.0, 3.0);
    float _2802 = _2790 * _2790;
    float _2804 = -_2620;
    float _2806 = fma(_2804, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2426);
    float _2808 = _2798 * _2798;
    float _2810 = -_2628;
    float _2812 = fma(_2810, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2442);
    float _2814 = _2800 * _2802;
    float _2816 = precise::clamp(_2814, 0.0, 1.0);
    float _2818 = _2794 * 0.15915493667125701904296875;
    float _2820 = fma(_2806, _2806, _2808);
    float _2822 = _2756 * 6.283185482025146484375;
    float _2824 = sin(_2822);
    float _2826 = _2816 * (*spvDescriptorSet0.vp_c9)._m0[191].y;
    float _2828 = fma(_2812, _2812, _2820);
    bool _2830 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2832 = isnan(0.5);
    bool _2834 = _2830 || _2832;
    bool _2836 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2838 = _2834 || _2836;
    float _2840 = _2760 * _2792;
    float _2842 = fma(_2740, _2826, _175);
    float _2844 = _431 * _2776;
    float _2846 = _2768 * _2792;
    float _2848 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _2850 = _2840 * _2848;
    float _2852 = fma(_2706, _2826, _171);
    float _2854 = _2722 * _2826;
    float _2856 = _2752 * _2792;
    float _2858 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2860 = _2846 * _2858;
    float _2862 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _2864 = -_2850;
    float _2866 = fma(_2846, _2862, _2864);
    float _2868 = _2756 * 6.283185482025146484375;
    float _2870 = cos(_2868);
    float _2872 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _2874 = _2856 * _2872;
    float _2876 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _2878 = -_2860;
    float _2880 = fma(_2856, _2876, _2878);
    float _2882 = _2866 * _2866;
    float _2884 = _433 * _2778;
    float _2886 = _2744 * _2824;
    float _2888 = fma(_2880, _2880, _2882);
    float _2890 = sqrt(_2828);
    float _2892 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2894 = -_2874;
    float _2896 = fma(_2840, _2892, _2894);
    float _2898 = _2844 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2900 = fma(_2896, _2896, _2888);
    float _2902 = _2884 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2904 = _2748 * _2824;
    float _2906 = _2818 * 6.283185482025146484375;
    float _2908 = sin(_2906);
    float _2910 = _2748 * _2870;
    float _2912 = _2744 * _2870;
    float _2914 = _2818 * 6.283185482025146484375;
    float _2916 = cos(_2914);
    float _2918 = _2596 * _2890;
    float _2920 = _2918 * _2902;
    float _2922 = _2918 * _2898;
    float _2924 = rsqrt(_2900);
    float _2926 = fma(_2908, _2910, _2886);
    float _2928 = fma(_2908, _2886, _2910);
    float _2930 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _2842);
    float _2932 = _2748 * _2916;
    float _2934 = _2870 * _2916;
    float _2936 = _2744 * _2916;
    float _2938 = _2824 * _2916;
    float _2940 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _2852);
    float _2942 = _2930 * _2920;
    float _2944 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _2854);
    float _2946 = -_2904;
    float _2948 = fma(_2908, _2912, _2946);
    float _2950 = _2940 * _2922;
    float _2952 = _2932 * _2942;
    float _2954 = _2880 * _2924;
    float _2956 = _2866 * _2924;
    float _2958 = _2896 * _2924;
    float _2960 = -_2942;
    float _2962 = _2908 * _2960;
    float _2964 = -_2912;
    float _2966 = fma(_2908, _2904, _2964);
    float _2968 = _2918 * _2944;
    float _2970 = fma(_2926, _2950, _2952);
    float _2972 = _2856 * _2954;
    float _2974 = _2936 * _2942;
    float _2976 = fma(_2934, _2950, _2962);
    float _2978 = fma(_2966, _2968, _2970);
    float _2980 = _2846 * _2956;
    float _2982 = -_2972;
    float _2984 = fma(_2840, _2956, _2982);
    float _2986 = fma(_2948, _2950, _2974);
    float _2988 = fma(_2938, _2968, _2976);
    float _2990 = -_2980;
    float _2992 = fma(_2856, _2958, _2990);
    float _2994 = _2984 * _2978;
    float _2996 = fma(_2928, _2968, _2986);
    float _2998 = _2992 * _2978;
    float _3000 = fma(_2958, _2988, _2994);
    float _3002 = fma(_2954, _2988, _2998);
    float _3004 = fma(_2846, _2996, _3000);
    float _3006 = fma(_2840, _2996, _3002);
    float _3008 = _2360 + _3004;
    float _3010 = _2412 + _3006;
    float _3012 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _3014 = _3008 + _3012;
    float _3016 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _3018 = _3010 + _3016;
    float _3020 = _3014 * _3014;
    float _3022 = fma(_3018, _3018, _3020);
    float _3024 = _2840 * _2958;
    float _3026 = sqrt(_3022);
    float _3028 = -_3024;
    float _3030 = fma(_2846, _2954, _3028);
    float _3032 = _3030 * _2978;
    float _3034 = fma(_2956, _2988, _3032);
    float _3036 = fma(_2856, _2996, _3034);
    bool _3038 = _3026 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3040 = _2336 + _3036;
    float _3042 = _3032;
    float _3044 = _3010;
    float _3046 = _3008;
    if (!_3038)
    {
        _3042 = _3040;
    }
    float _3048 = _3042;
    bool _3050 = !_3038;
    float _3052 = _3048;
    if (!_3050)
    {
        float _3054 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3056 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _3058 = _3026 + _3056;
        float _3060 = rsqrt(_3022);
        float _3062 = _3058 * _3054;
        float _3064 = _3040 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3066 = _3062 * 0.15915493667125701904296875;
        float _3068 = _3066 * 6.283185482025146484375;
        float _3070 = sin(_3068);
        float _3072 = _3066 * 6.283185482025146484375;
        float _3074 = cos(_3072);
        float _3076 = fma(_3070, _3064, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _3078 = _3060 * _3076;
        float _3080 = _3074 + (-1.0);
        float _3082 = fma(_3018, _3078, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _3084 = fma(_3014, _3078, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _3086 = _3080 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3088 = fma(_3040, _3074, _3086);
        _3044 = _3082;
        _3052 = _3088;
        _3046 = _3084;
    }
    float _3090 = _3044;
    float _3092 = _3052;
    float _3094 = _3046;
    float _3096 = -_2620;
    float _3098 = fma(_3096, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3090);
    float _3100 = -_2614;
    float _3102 = fma(_3100, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3092);
    float _3104 = -_2628;
    float _3106 = fma(_3104, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3094);
    float _3108 = _3102;
    float _3110 = _3098;
    float _3112 = _3106;
    float _3114 = _3092;
    if (!_2838)
    {
        float _3116 = _2636 * _2636;
        float _3118 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _3120 = -_2360;
        float _3122 = _3120 + _3094;
        float _3124 = fma(_2646, _2646, _3116);
        float _3126 = fma(_2654, _2654, _3124);
        float _3128 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3130 = sqrt(_3126);
        float _3132 = 1.0 / _2918;
        float _3134 = _3128 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3136 = precise::min(_3130, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _3138 = _3136 * _3118;
        float _3140 = _3138 * _3132;
        float _3142 = -_2412;
        float _3144 = _3142 + _3090;
        float _3146 = -_2336;
        float _3148 = _3146 + _3092;
        float _3150 = _3134 * _3140;
        float _3152 = _3122 * _3140;
        float _3154 = fma(_3144, _3150, _2632);
        float _3156 = fma(_3148, _3150, _2624);
        float _3158 = fma(_3134, _3152, _2642);
        _3108 = _3156;
        _3110 = _3154;
        _3112 = _3158;
    }
    float _3160 = _3108;
    float _3162 = _3110;
    float _3164 = _3112;
    float _3166 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3168 = _3160 + _3166;
    float _3170 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3172 = _3162 + _3170;
    float _3174 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3176 = _3164 + _3174;
    float _3178 = _3168 * _3168;
    float _3180 = fma(_3172, _3172, _3178);
    float _3182 = fma(_3176, _3176, _3180);
    float _3184 = rsqrt(_3182);
    float _3186 = sqrt(_3182);
    float _3188 = _3184 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3190 = _3172 * _3188;
    float _3192 = _3176 * _3188;
    float _3194 = _3190 * _3190;
    float _3196 = _3192 * _3192;
    float _3198 = _3194 + _3196;
    float _3200 = sqrt(_3198);
    bool _3202 = _3200 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3204 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3206 = _3200 + _3204;
    float _3208 = _3184;
    float _3210 = _3206;
    float _3212 = _3168;
    if (_3202)
    {
        float _3214 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3208 = _3214;
    }
    float _3216 = _3208;
    float _3218 = _3216;
    if (_3202)
    {
        float _3220 = _3206 * _3216;
        _3210 = _3220;
    }
    float _3222 = _3210;
    if (_3202)
    {
        float _3224 = rsqrt(_3198);
        _3218 = _3224;
    }
    float _3226 = _3218;
    float _3228 = _3226;
    if (_3202)
    {
        float _3230 = _3222 * 0.15915493667125701904296875;
        _3114 = _3230;
    }
    float _3232 = _3114;
    float _3234 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3236 = _3176;
    float _3238 = _3232;
    if (_3202)
    {
        float _3240 = _3232 * 6.283185482025146484375;
        float _3242 = sin(_3240);
        _3236 = _3242;
    }
    float _3244 = _3236;
    float _3246 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _3248 = precise::max(0.0, _3234);
    float _3250 = _2918;
    float _3252 = _3248;
    if (_3202)
    {
        float _3254 = _3232 * 6.283185482025146484375;
        float _3256 = cos(_3254);
        _3250 = _3256;
    }
    float _3258 = _3250;
    float _3260 = -_3188;
    float _3262 = -_3248;
    float _3264 = fma(_3168, _3260, _3262);
    if (_3202)
    {
        float _3266 = _3264 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3212 = _3266;
    }
    float _3268 = _3212;
    float _3270 = _3244;
    float _3272 = _3268;
    if (_3202)
    {
        float _3274 = fma(_3244, _3268, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3270 = _3274;
    }
    float _3276 = _3270;
    float _3278 = _3276;
    if (!_3202)
    {
        _3272 = _3264;
    }
    float _3280 = _3272;
    float _3282 = _3280;
    if (_3202)
    {
        float _3284 = _3226 * _3276;
        _2670 = _3284;
    }
    float _3286 = _2670;
    if (!_3202)
    {
        _3228 = _3190;
    }
    float _3288 = _3228;
    float _3290 = _3288;
    float _3292 = _3258;
    if (_3202)
    {
        float _3294 = _3258 + (-1.0);
        _3252 = _3294;
    }
    float _3296 = _3252;
    float _3298 = _3296;
    if (_3202)
    {
        float _3300 = _3190 * _3286;
        _3290 = _3300;
    }
    float _3302 = _3290;
    if (!_3202)
    {
        _3278 = _3194;
    }
    float _3304 = _3278;
    float _3306 = _3160 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3308 = _3304;
    if (_3202)
    {
        float _3310 = _3296 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3238 = _3310;
    }
    float _3312 = _3238;
    if (!_3202)
    {
        _3298 = _3192;
    }
    float _3314 = _3298;
    float _3316 = _3314;
    if (_3202)
    {
        float _3318 = _3192 * _3286;
        _3316 = _3318;
    }
    float _3320 = _3316;
    if (_3202)
    {
        float _3322 = _3302 * _3302;
        _3308 = _3322;
    }
    float _3324 = _3308;
    if (_3202)
    {
        float _3326 = fma(_3264, _3258, _3312);
        _3282 = _3326;
    }
    float _3328 = _3282;
    if (!_3202)
    {
        _3292 = _3196;
    }
    float _3330 = _3292;
    float _3332 = _3330;
    if (_3202)
    {
        float _3334 = _3320 * _3320;
        _3332 = _3334;
    }
    float _3336 = _3332;
    float _3338 = _3160 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3340 = fma(_3328, _3328, _3324);
    float _3342 = fma(_3162, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3306);
    float _3344 = fma(_3162, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3338);
    float _3346 = _3340 + _3336;
    float _3348 = _3160 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3350 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3352 = fma(_3186, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3350);
    float _3354 = precise::clamp(_3352, 0.0, 1.0);
    float _3356 = fma(_3164, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3344);
    float _3358 = _3160 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3360 = fma(_3162, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3348);
    float _3362 = rsqrt(_3346);
    float _3364 = -_3354;
    float _3366 = _3364 + 1.0;
    float _3368 = fma(_3162, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3358);
    float _3370 = fma(_3164, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3360);
    float _3372 = _3356 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3374 = fma(_3164, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3368);
    float _3376 = _3370 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3378 = abs(_3366);
    float _3380 = log2(_3378);
    float _3382 = _3372 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3384 = _3374 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3386 = _3376 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3388 = -_3382;
    float _3390 = fma(_3388, _3246, 1.0);
    float _3392 = fma(_3164, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3342);
    float _3394 = fma(_3384, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3386);
    float _3396 = _3362 * _3302;
    float _3398 = _3362 * _3328;
    float _3400 = _3362 * _3320;
    float _3402 = _3392 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3404 = _3396 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3406 = fma(_3372, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3394);
    float _3408 = log2(_3390);
    float _3410 = _3376 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3412 = _3380 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3414 = -_3404;
    float _3416 = fma(_3398, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3414);
    float _3418 = fma(_3402, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3406);
    float _3420 = fma(_3384, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3410);
    float _3422 = -_3400;
    float _3424 = fma(_3422, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3416);
    float _3426 = exp2(_3412);
    float _3428 = _3376 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3430 = _3398 + 1.0;
    float _3432 = fma(_3424, -0.5, 0.5);
    float _3434 = fma(_3424, 0.5, 0.5);
    float _3436 = fma(_3384, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3428);
    float _3438 = fma(_3372, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3420);
    float _3440 = 1.0 / _3418;
    float _3442 = fma(_3372, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3436);
    float _3444 = fma(_3434, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3446 = fma(_3434, _3444, -0.212114393711090087890625);
    float _3448 = sqrt(_3432);
    float _3450 = -_3398;
    float _3452 = fma(_3426, _3430, _3450);
    float _3454 = fma(_3402, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3442);
    float _3456 = fma(_3402, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3438);
    float _3458 = fma(_3434, _3446, 1.570728778839111328125);
    float _3460 = fma(_3452, 0.5, 0.5);
    float _3462 = _3454 * _3440;
    float _3464 = _3408 * 0.693147182464599609375;
    float _3466 = _3456 * _3440;
    float _3468 = fma(_3462, 0.5, 0.5);
    float _3470 = _3464 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3472 = fma(_3466, -0.5, 0.5);
    float _3474 = _3448 * 0.636619746685028076171875;
    float3 _9073 = float3(_3468, _3472, _3470);
    float _3476 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_9073, float3(0.0), isnan(_9073)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_9073, float3(0.0), isnan(_9073)), level(0.0)).x;
    float _3478 = -_3458;
    float _3480 = fma(_3474, _3478, 1.0);
    float3 _9089 = float3(_3468, _3472, _3470);
    float4 _3483 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_9089, float3(0.0), isnan(_9089)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_9089, float3(0.0), isnan(_9089)), level(0.0)).xyzw;
    float _3485 = _3483.x;
    float _3487 = _3483.y;
    float _3489 = _3483.z;
    float _3491 = _3483.w;
    float2 _9106 = float2(_3480, _3460);
    float3 _3495 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_9106, float2(0.0), isnan(_9106)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_9106, float2(0.0), isnan(_9106)), level(0.0)).xyz;
    float _3497 = _3495.x;
    float _3499 = _3495.y;
    float _3501 = _3495.z;
    float _3503 = fma(_2854, (*spvDescriptorSet0.vp_c9)._m0[17].y, 1.0);
    float _3505 = _2842 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3507 = _3380 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3509 = _2926 * _2992;
    float _3511 = _2926 * _3030;
    float _3513 = _2926 * _2984;
    float _3515 = _2932 * _2992;
    float _3517 = _2932 * _3030;
    float _3519 = _3505 * _3505;
    float _3521 = exp2(_3507);
    float _3523 = _2932 * _2984;
    float _3525 = _2966 * _2992;
    float _3527 = fma(_3503, _3503, _3519);
    float _3529 = _2966 * _3030;
    float _3531 = _2966 * _2984;
    float _3533 = fma(_2934, _2954, _3509);
    float _3535 = fma(_2934, _2956, _3511);
    float _3537 = fma(_2934, _2958, _3513);
    float _3539 = rsqrt(_3527);
    float _3541 = -_2908;
    float _3543 = fma(_3541, _2954, _3515);
    float _3545 = -_2908;
    float _3547 = fma(_3545, _2956, _3517);
    float _3549 = -_2908;
    float _3551 = fma(_3549, _2958, _3523);
    float _3553 = fma(_2938, _2954, _3525);
    float _3555 = fma(_2938, _2956, _3529);
    float _3557 = fma(_2938, _2958, _3531);
    float _3559 = _3376 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3561 = fma(_2936, _2840, _3543);
    float _3563 = fma(_2936, _2856, _3547);
    float _3565 = fma(_2928, _2840, _3553);
    float _3567 = fma(_2948, _2840, _3533);
    float _3569 = fma(_2948, _2856, _3535);
    float _3571 = fma(_2948, _2846, _3537);
    float _3573 = fma(_3384, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3559);
    float _3575 = _2852 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3577 = _3505 * _3561;
    float _3579 = fma(_2928, _2856, _3555);
    float _3581 = fma(_3372, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3573);
    float _3583 = -_3521;
    float _3585 = _3583 + 1.0;
    float _3587 = fma(_3575, _3567, _3577);
    float _3589 = fma(_2928, _2846, _3557);
    float _3591 = _3505 * _3563;
    float _3593 = fma(_2936, _2846, _3551);
    float _3595 = _3505 * _3539;
    float _3597 = fma(_3402, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3581);
    float _3599 = _3585 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_68.x = _3567;
    out.m_68.y = _3569;
    out.m_68.z = _3571;
    float _3601 = _3503 * _3539;
    float _3603 = fma(_3575, _3569, _3591);
    float _3605 = -_3565;
    float _3607 = _3595 * _3605;
    float _3609 = -_3579;
    float _3611 = _3595 * _3609;
    out.m_70.x = _3162;
    out.m_70.y = _3160;
    out.m_70.z = _3164;
    float _3613 = fma(_3601, _3561, _3607);
    float _3615 = fma(_3601, _3563, _3611);
    bool _3617 = _3186 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3619 = isnan(_3186);
    bool _3621 = _3617 || _3619;
    bool _3623 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3625 = _3621 || _3623;
    out.gl_Position.x = _3454;
    out.gl_Position.y = _3456;
    out.gl_Position.z = _3597;
    out.gl_Position.w = _3418;
    float _3627 = -_3589;
    float _3629 = _3595 * _3627;
    float _3631 = _3505 * _3593;
    float _3633 = _3597 + _3418;
    float _3635 = fma(_3601, _3593, _3629);
    float _3637 = fma(_3575, _3571, _3631);
    float _3639 = _3633 * 0.5;
    float _3641 = fma(_3503, _3565, _3587);
    float _3643 = -_3599;
    float _3645 = _3643 + 1.0;
    out.m_72.x = _3613;
    out.m_72.y = _3615;
    out.m_72.z = _3635;
    float _3647 = fma(_3503, _3579, _3603);
    float _3649 = fma(_3503, _3589, _3637);
    out.m_74.z = _3639;
    out.m_74.w = _3418;
    float _3651 = _3418;
    float _3653 = _3597;
    float _3655 = _3456;
    float _3657 = _3454;
    if (!_3625)
    {
        _3651 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3659 = _3651;
    float _3661 = _3659;
    float _3663 = _3659;
    if (!_3625)
    {
        _3653 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3665 = _3653;
    out.m_76.x = _3641;
    out.m_76.y = _3647;
    out.m_76.z = _3649;
    float _3667 = _3665;
    float _3669 = _3665;
    if (!_3625)
    {
        _3655 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3671 = _3655;
    float _3673 = _3671;
    float _3675 = _3671;
    if (!_3625)
    {
        _3657 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3677 = _3657;
    float _3679 = _3599 * _3476;
    float _3681 = _3491 * _3679;
    float _3683 = _3491 * _3645;
    float _3685 = _3501 * _3679;
    float _3687 = fma(_3497, _3681, _3485);
    float _3689 = fma(_3499, _3681, _3487);
    float _3691 = _3485;
    float _3693 = _3681;
    float _3695 = _3677;
    float _3697 = _3677;
    if (!_3625)
    {
        _3691 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3699 = _3691;
    float _3701 = fma(_3491, _3685, _3489);
    float _3703 = _3699;
    float _3705 = _3699;
    if (!_3625)
    {
        _3693 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3707 = _3693;
    out.m_78.x = _3687;
    out.m_78.y = _3689;
    out.m_78.z = _3701;
    out.m_78.w = _3683;
    bool _3709 = !_3625;
    float _3711 = _3707;
    float _3713 = _3707;
    if (!_3709)
    {
        bool _3715 = _3186 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3717 = isnan(_3186);
        bool _3719 = _3715 || _3717;
        bool _3721 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3723 = _3719 || _3721;
        if (!_3723)
        {
            float _3725 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3727 = _3186 + _3725;
            float _3729 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3731 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3729;
            float _3733 = 1.0 / _3731;
            float _3735 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3737 = _3735 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3739 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3741 = _3739 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3743 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3745 = _3743 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3747 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3749 = _3747 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3751 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3753 = _3751 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3755 = _3727 * _3733;
            float _3757 = precise::clamp(_3755, 0.0, 1.0);
            float _3759 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3761 = _3759 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3763 = fma(_3757, _3737, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3765 = fma(_3757, _3761, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3767 = fma(_3757, _3741, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3769 = fma(_3757, _3745, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3771 = fma(_3757, _3749, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3773 = fma(_3757, _3753, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3663 = _3765;
            _3697 = _3771;
            _3705 = _3763;
            _3675 = _3769;
            _3669 = _3767;
            _3713 = _3773;
            _3775 = true;
        }
        else
        {
            bool _3777 = _3186 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3779 = isnan(_3186);
            bool _3781 = _3777 || _3779;
            bool _3783 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3785 = _3781 || _3783;
            if (!_3785)
            {
                _3703 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3787 = _3703;
            _3705 = _3787;
            if (!_3785)
            {
                _3661 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3789 = _3661;
            _3663 = _3789;
            if (!_3785)
            {
                _3667 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3791 = _3667;
            _3669 = _3791;
            if (!_3785)
            {
                _3673 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3793 = _3673;
            _3675 = _3793;
            if (!_3785)
            {
                _3695 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3795 = _3695;
            _3697 = _3795;
            if (!_3785)
            {
                _3711 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3797 = _3711;
            bool _3799 = !_3785;
            _3713 = _3797;
            if (!_3799)
            {
                bool _3801 = _3186 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3803 = isnan(_3186);
                bool _3805 = _3801 || _3803;
                bool _3807 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3809 = _3805 || _3807;
                if (!_3809)
                {
                    float _3811 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3813 = _3186 + _3811;
                    float _3815 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3817 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3815;
                    float _3819 = 1.0 / _3817;
                    float _3821 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3823 = _3821 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3825 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3827 = _3825 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3829 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3831 = _3829 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3833 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3835 = _3833 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3837 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3839 = _3837 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3841 = _3813 * _3819;
                    float _3843 = precise::clamp(_3841, 0.0, 1.0);
                    float _3845 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3847 = _3845 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3849 = fma(_3843, _3823, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3851 = fma(_3843, _3847, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3853 = fma(_3843, _3827, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3855 = fma(_3843, _3831, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3857 = fma(_3843, _3835, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3859 = fma(_3843, _3839, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3663 = _3851;
                    _3697 = _3857;
                    _3705 = _3849;
                    _3675 = _3855;
                    _3669 = _3853;
                    _3713 = _3859;
                    _3775 = true;
                }
                else
                {
                    _3663 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3697 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3705 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3675 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3669 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3713 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3775 = false;
    float _3861 = _3663;
    float _3863 = _3697;
    float _3865 = _3705;
    float _3867 = _3675;
    float _3869 = _3669;
    float _3871 = _3713;
    float _3873 = fma(_3647, -0.5, 0.5);
    float _3875 = precise::clamp(_3873, 0.0, 1.0);
    float _3877 = -_3861;
    float _3879 = _3877 + _3863;
    float _3881 = -_3865;
    float _3883 = _3881 + _3867;
    float _3885 = -_3869;
    float _3887 = _3885 + _3871;
    bool _3889 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3891 = fma(_3875, _3879, _3861);
    float _3893 = fma(_3875, _3883, _3865);
    float _3895 = fma(_3875, _3887, _3869);
    float _3897 = _3891 * 0.586610972881317138671875;
    out.m_80.x = 0.0;
    float _3899 = fma(_3893, 0.298911988735198974609375, _3897);
    float _3901 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3903 = fma(_3895, 0.114477999508380889892578125, _3899);
    out.m_47.x = _3901;
    float _3905 = -_3903;
    float _3907 = _3893 + _3905;
    float _3909 = -_3903;
    float _3911 = _3891 + _3909;
    float _3913 = -_3903;
    float _3915 = _3895 + _3913;
    float _3917 = fma(_3907, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3903);
    float _3919 = fma(_3911, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3903);
    float _3921 = fma(_3915, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3903);
    out.m_82.x = _3917;
    out.m_82.y = _3919;
    out.m_82.z = _3921;
    if (!_3889)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _3923 = -_3160;
    float _3925 = _3923 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _3927 = -_3162;
    float _3929 = _3927 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _3931 = -_3164;
    float _3933 = _3931 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _3935 = _3925 * _3925;
    float _3937 = fma(_3929, _3929, _3935);
    float _3939 = fma(_3933, _3933, _3937);
    float _3941 = sqrt(_3939);
    float _3943 = rsqrt(_3939);
    float _3945 = -_3941;
    float _3947 = _3945 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3949 = _3947 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _3951 = precise::clamp(_3949, 0.0, 1.0);
    float _3953 = _3929 * _3943;
    float _3955 = _3925 * _3943;
    float _3957 = abs(_3951);
    float _3959 = log2(_3957);
    float _3961 = _3933 * _3943;
    float _3963 = _3953 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _3965 = _3647 * _3955;
    float _3967 = -_3955;
    float _3969 = -_3963;
    float _3971 = fma(_3967, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3969);
    float _3973 = fma(_3641, _3953, _3965);
    float _3975 = -_3961;
    float _3977 = fma(_3975, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3971);
    float _3979 = fma(_3649, _3961, _3973);
    float _3981 = precise::clamp(_3979, 0.0, 1.0);
    float _3983 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _3985 = _3977 + _3983;
    float _3987 = _3959 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _3989 = _3985 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _3991 = precise::clamp(_3989, 0.0, 1.0);
    float _3993 = exp2(_3987);
    float _3995 = _3993 * _3991;
    float _3997 = _3981 * _3995;
    float _3999 = _3997 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _4001 = _3997 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _4003 = _3997 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_80.x = _3999;
    out.m_80.y = _4001;
    out.m_80.z = _4003;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3775 = false;
    bool _457 = false;
    bool _197 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _96 = in.m_44.w;
    float _98 = trunc(_96);
    int _101 = int(_98);
    bool _105 = _101 >= 1;
    float _107 = 0.0;
    float _109 = as_type<float>(_101);
    if (!_105)
    {
        _107 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _111 = _107;
    if (!_105)
    {
        out.m_47.x = 0.0;
    }
    int _113 = 0;
    if (!_105)
    {
        float _115 = _111 * 5.0;
        _113 = as_type<int>(_115);
    }
    int _117 = _113;
    int _119 = _117;
    if (!_105)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4061 = as_type<float>(_117);
        out.gl_Position.z = _4061;
    }
    if (!_105)
    {
        return out;
    }
    float _121 = in.m_49.w;
    float _123 = float(_101);
    float _125 = -_121;
    float _127 = _125 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _129 = _121 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _131 = isnan(_121);
    bool _133 = _129 || _131;
    bool _135 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _137 = _133 || _135;
    bool _139 = _127 >= _123;
    bool _141 = !_137;
    bool _143 = _139 || _141;
    float _145 = _127;
    if (_143)
    {
        _109 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _147 = _109;
    if (_143)
    {
        out.m_47.x = 0.0;
    }
    if (_143)
    {
        float _149 = _147 * 5.0;
        _119 = as_type<int>(_149);
    }
    int _151 = _119;
    if (_143)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4125 = as_type<float>(_151);
        out.gl_Position.z = _4125;
    }
    if (_143)
    {
        return out;
    }
    float _153 = as_type<float>(int(gl_VertexIndex));
    float _155 = 1.0 / _123;
    bool _157 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _159 = _127 * _155;
    int _161 = as_type<int>(_153) & 1;
    bool _163 = _161 != 0;
    int _165 = as_type<int>(_153) & 2;
    bool _167 = _165 != 0;
    bool _169 = !_163;
    float _171 = _169 ? (-0.5) : 0.5;
    bool _173 = !_167;
    float _175 = _173 ? (-0.5) : 0.5;
    bool _177 = !_157;
    float _195;
    if (!_177)
    {
        float _179 = in.m_54.x;
        float _181 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _183 = _179 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _185 = fma(_183, (*spvDescriptorSet0.vp_c9)._m0[12].x, _127);
        float _187 = _185 * _181;
        float _189 = floor(_187);
        float _191 = -_189;
        float _193 = _187 + _191;
        _195 = _193;
        _197 = true;
    }
    else
    {
        _195 = _159;
    }
    _197 = false;
    float _199 = _195;
    float _201 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _203 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _201;
    float _205 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _207 = _205 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _209 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _211 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _209;
    float _213 = 1.0 / _203;
    float _215 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _217 = _215 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _219 = 1.0 / _207;
    float _221 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _223 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _225 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _227 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _229 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _231 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _233 = 1.0 / _217;
    float _235 = _221 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _237 = _223 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _239 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _241 = _199 + _239;
    float _243 = _231 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _245 = _227 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _247 = _229 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _249 = _241 * _213;
    float _251 = 1.0 / _211;
    float _253 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _255 = _199 + _253;
    float _257 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _259 = _199 + _257;
    out.m_56.x = _245;
    out.m_56.y = _247;
    out.m_56.z = _243;
    bool _261 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _263 = _255 * _233;
    float _265 = _225 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _267 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _269 = _199 + _267;
    float _271 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _273 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _271;
    float _275 = _269 * _219;
    out.m_58.x = _235;
    out.m_58.y = _237;
    out.m_58.z = _265;
    bool _277 = _199 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _279 = isnan(_199);
    bool _281 = _277 || _279;
    bool _283 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _285 = _281 || _283;
    float _287 = float(_285);
    float _289 = _259 * _251;
    float _291 = fma(_273, _249, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _293 = -_287;
    float _295 = _293 + 1.0;
    bool _297 = _199 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _299 = isnan(_199);
    bool _301 = _297 || _299;
    bool _303 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _305 = _301 || _303;
    float _307 = float(_305);
    float _309 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _311 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _309;
    bool _313 = _199 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _315 = isnan(_199);
    bool _317 = _313 || _315;
    bool _319 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _321 = _317 || _319;
    float _323 = float(_321);
    float _325 = -_307;
    float _327 = _325 + 1.0;
    float _329 = _307 * _295;
    float _331 = fma(_311, _249, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _333 = _199 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _335 = isnan(_199);
    bool _337 = _333 || _335;
    bool _339 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _341 = _337 || _339;
    float _343 = float(_341);
    float _345 = _323 * _327;
    float _347 = -_323;
    float _349 = _347 + 1.0;
    float _351 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _353 = _351 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    bool _355 = _199 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _357 = isnan(_199);
    bool _359 = _355 || _357;
    bool _361 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _363 = _359 || _361;
    float _365 = float(_363);
    float _367 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _369 = _367 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _371 = _343 * _349;
    float _373 = -_343;
    float _375 = _373 + 1.0;
    float _377 = fma(_353, _275, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _379 = fma(_369, _275, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _381 = -_365;
    float _383 = _381 + 1.0;
    float _385 = _365 * _375;
    float _387 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _389 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _387;
    float _391 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _393 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _391;
    float _395 = _291 * _385;
    float _397 = _331 * _385;
    float _399 = fma(_389, _289, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _401 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _403 = _401 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _405 = fma(_383, (*spvDescriptorSet0.vp_c9)._m0[143].x, _395);
    float _407 = fma(_383, (*spvDescriptorSet0.vp_c9)._m0[143].y, _397);
    float _409 = fma(_393, _289, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _411 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _413 = _411 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _415 = fma(_379, _371, _405);
    float _417 = fma(_377, _371, _407);
    float _419 = fma(_403, _263, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _421 = fma(_413, _263, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _423 = fma(_399, _345, _415);
    float _425 = fma(_409, _345, _417);
    float _427 = fma(_419, _329, _423);
    float _429 = fma(_421, _329, _425);
    float _431 = fma(_287, (*spvDescriptorSet0.vp_c9)._m0[147].x, _427);
    float _433 = fma(_287, (*spvDescriptorSet0.vp_c9)._m0[147].y, _429);
    bool _435 = !_261;
    float _437 = _263;
    float _455;
    if (!_435)
    {
        float _439 = in.m_54.x;
        float _441 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _443 = _439 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _445 = fma(_443, (*spvDescriptorSet0.vp_c9)._m0[14].x, _127);
        float _447 = _445 * _441;
        float _449 = floor(_447);
        float _451 = -_449;
        float _453 = _447 + _451;
        _455 = _453;
        _457 = true;
    }
    else
    {
        _455 = _159;
    }
    _457 = false;
    float _459 = _455;
    float _461 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _463 = int(_461);
    float _465 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _467 = int(_465);
    float _469 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _471 = _469 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _473 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _475 = _473 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _477 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _479 = int(_477);
    float _481 = float(_463);
    float _483 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _485 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _483;
    float _487 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _489 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _491 = _489 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    bool _493 = _459 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _495 = isnan(_459);
    bool _497 = _493 || _495;
    bool _499 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _501 = _497 || _499;
    float _503 = float(_501);
    float _505 = float(_467);
    float _507 = 1.0 / _481;
    int _509 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _511 = _509 != 0;
    float _513 = float(uint(_479));
    float _515 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _517 = int(_515);
    int _519 = ~_479;
    int _521 = _519 + 1;
    int _523 = ~_479;
    int _525 = _523 + 1;
    bool _527 = _479 == 0;
    if (_511)
    {
        float _529 = in.m_54.x;
        _437 = _529;
    }
    float _531 = _437;
    float _533 = 1.0 / _505;
    float _535 = _507 * _127;
    float _537 = _531;
    if (!_511)
    {
        float _539 = in.m_54.y;
        _537 = _539;
    }
    float _541 = _537;
    float _543 = float(uint(_517));
    float _545 = 1.0 / _513;
    int _547 = ~_517;
    int _549 = _547 + 1;
    int _551 = ~_517;
    int _553 = _551 + 1;
    float _555 = _533 * _127;
    float _557 = trunc(_535);
    int _559 = int(_557);
    float _561 = 1.0 / _543;
    int _563 = as_type<int>(_545) + (-2);
    float _565 = trunc(_555);
    int _567 = int(_565);
    float _569 = float(uint(_559));
    float _571 = as_type<float>(_563) * _569;
    int _573 = as_type<int>(_561) + (-2);
    float _575 = 1.0 / _471;
    float _577 = float(uint(_567));
    float _579 = trunc(_571);
    float _581 = precise::max(_579, 0.0);
    uint _584 = uint(_581);
    float _586 = as_type<float>(_573) * _577;
    float _588 = in.m_54.x;
    float _590 = in.m_54.y;
    float _592 = in.m_54.z;
    float _594 = in.m_54.w;
    float _596 = trunc(_586);
    float _598 = precise::max(_596, 0.0);
    uint _600 = uint(_598);
    int _602 = _521 * int(_584);
    int _604 = _602 + _559;
    float _606 = 1.0 / _475;
    float _608 = float(uint(_604));
    int _610 = _549 * int(_600);
    int _612 = _610 + _567;
    float _614 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _616 = int(_614);
    float _618 = as_type<float>(_563) * _608;
    float _620 = _608;
    if (_511)
    {
        _620 = 1.0;
    }
    float _622 = _620;
    float _624 = float(uint(_612));
    float _626 = fma(_588, (*spvDescriptorSet0.vp_c9)._m0[78].z, _487);
    float _628 = _622;
    float _630 = _624;
    float _632 = _592;
    if (!_511)
    {
        _628 = 7.345489978790283203125;
    }
    float _634 = _628;
    float _636 = _592 * 2.0;
    float _638 = trunc(_618);
    float _640 = precise::max(_638, 0.0);
    uint _642 = uint(_640);
    float _644 = as_type<float>(_573) * _624;
    if (_511)
    {
        _630 = 1.0;
    }
    float _646 = _630;
    float _648 = _634 * _588;
    float _650 = _646;
    if (!_511)
    {
        _650 = 1.2345600128173828125;
    }
    float _652 = _650;
    float _654 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[77].z, _626);
    float _656 = trunc(_644);
    float _658 = precise::max(_656, 0.0);
    uint _660 = uint(_658);
    float _662 = _541 * _652;
    float _664 = -_654;
    float _666 = _664 + 1.0;
    float _668 = float(_479);
    float _670 = floor(_648);
    int _672 = int(_584) + int(_642);
    float _674 = float(_567);
    int _676 = int(_600) + int(_660);
    int _678 = _525 * _672;
    int _680 = _678 + _559;
    float _682 = float(_559);
    float _684 = floor(_662);
    float _686 = _155 * _127;
    int _688 = _553 * _676;
    int _690 = _688 + _567;
    bool _692 = _682 >= _668;
    bool _694 = isnan(_682);
    bool _696 = _692 || _694;
    bool _698 = isnan(_668);
    bool _700 = _696 || _698;
    float _702 = float(_700);
    bool _704 = uint(_680) >= uint(_479);
    float _706 = -_670;
    float _708 = _648 + _706;
    float _710 = float(_517);
    float _712 = trunc(_702);
    int _714 = int(_712);
    bool _716 = !_704;
    int _718 = _716 ? 0 : (-1);
    int _720 = ~_672;
    int _722 = _720 + _718;
    int _724 = _722 + 1;
    bool _726 = _674 >= _710;
    bool _728 = isnan(_674);
    bool _730 = _726 || _728;
    bool _732 = isnan(_710);
    bool _734 = _730 || _732;
    float _736 = float(_734);
    float _738 = -_684;
    float _740 = _662 + _738;
    float _742 = _708 * _668;
    bool _744 = uint(_690) >= uint(_517);
    int _746 = _479 * _724;
    int _748 = _746 + _559;
    int _750 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _752 = _750 != 0;
    float _754 = trunc(_736);
    int _756 = int(_754);
    float _758 = _668 * _686;
    float _760 = _710 * _686;
    bool _762 = !_744;
    int _764 = _762 ? 0 : (-1);
    float _766 = _740 * _710;
    int _768 = ~_714;
    int _770 = _768 + 1;
    int _772 = _770 + 1;
    bool _774 = !_527;
    int _776 = _774 ? _748 : (-1);
    float _778 = trunc(_742);
    int _780 = int(_778);
    bool _782 = !_752;
    int _784 = _782 ? 0 : 1;
    int _786 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _788 = _786 != 0;
    int _790 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _792 = _790 != 0;
    int _794 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _796 = _794 != 0;
    int _798 = _776 * _772;
    int _800 = ~_676;
    int _802 = _800 + _764;
    int _804 = _802 + 1;
    int _806 = abs(_784);
    float _808 = trunc(_758);
    int _810 = int(_808);
    bool _812 = !_792;
    int _814 = _812 ? 0 : 1;
    int _816 = _517 * _804;
    int _818 = _816 + _567;
    bool _820 = _517 == 0;
    int _822 = _479 + (-1);
    int _824 = _780 * _806;
    int _826 = _824 + _559;
    int _828 = abs(_814);
    float _830 = trunc(_760);
    int _832 = int(_830);
    int _834 = ~_756;
    int _836 = _834 + 1;
    int _838 = _836 + 1;
    int _840 = _714 * _822;
    int _842 = _840 + _798;
    bool _844 = !_820;
    int _846 = _844 ? _818 : (-1);
    int _848 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _850 = _848 != 0;
    float _852 = trunc(_766);
    int _854 = int(_852);
    bool _856 = !_788;
    int _858 = _856 ? 0 : 1;
    int _860 = _846 * _838;
    bool _862 = !_850;
    int _864 = _862 ? 0 : 1;
    int _866 = _842 * _828;
    bool _868 = !_796;
    int _870 = _868 ? 0 : 1;
    int _872 = abs(_858);
    float _874 = floor(_636);
    int _876 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _878 = _876 != 0;
    int _880 = abs(_870);
    int _882 = abs(_864);
    bool _884 = !_878;
    int _886 = _884 ? 0 : 1;
    int _888 = _810 * _872;
    int _890 = _888 + _866;
    int _892 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _894 = _892 != 0;
    int _896 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _898 = _896 != 0;
    int _900 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _902 = _900 != 0;
    int _904 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _906 = _904 != 0;
    int _908 = _854 * _882;
    int _910 = _908 + _567;
    int _912 = _517 + (-1);
    int _914 = _826 * _880;
    int _916 = _914 + _890;
    int _918 = abs(_886);
    bool _920 = !_898;
    int _922 = _920 ? 0 : 1;
    int _924 = _756 * _912;
    int _926 = _924 + _860;
    bool _928 = !_894;
    int _930 = _928 ? 0 : 1;
    int _932 = abs(_922);
    bool _934 = !_902;
    int _936 = _934 ? 0 : 1;
    int _938 = abs(_930);
    int _940 = _926 * _932;
    int _942 = abs(_936);
    int _944 = _780 * _918;
    int _946 = _944 + _916;
    bool _948 = !_906;
    int _950 = _948 ? 0 : 1;
    int _952 = _832 * _938;
    int _954 = _952 + _940;
    float _956 = float(uint(_946));
    int _958 = abs(_950);
    int _960 = _910 * _942;
    int _962 = _960 + _954;
    int _964 = ~_479;
    int _966 = _964 + 1;
    float _968 = as_type<float>(_563) * _956;
    int _970 = ~_517;
    int _972 = _970 + 1;
    int _974 = _854 * _958;
    int _976 = _974 + _962;
    float _978 = float(uint(_826));
    float _980 = trunc(_968);
    float _982 = precise::max(_980, 0.0);
    uint _984 = uint(_982);
    float _986 = float(uint(_910));
    float _988 = float(uint(_976));
    float _990 = as_type<float>(_563) * _978;
    bool _992 = _479 == 0;
    float _994 = as_type<float>(_573) * _986;
    float _996 = as_type<float>(_573) * _988;
    int _998 = ~_479;
    int _1000 = _998 + 1;
    float _1002 = trunc(_996);
    float _1004 = precise::max(_1002, 0.0);
    uint _1006 = uint(_1004);
    float _1008 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1010 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _1008;
    int _1012 = _966 * int(_984);
    int _1014 = _1012 + _946;
    float _1016 = trunc(_994);
    float _1018 = precise::max(_1016, 0.0);
    uint _1020 = uint(_1018);
    float _1022 = float(uint(_1014));
    int _1024 = ~_479;
    int _1026 = _1024 + 1;
    float _1028 = as_type<float>(_563) * _1022;
    int _1030 = _972 * int(_1006);
    int _1032 = _1030 + _976;
    float _1034 = trunc(_1028);
    float _1036 = precise::max(_1034, 0.0);
    uint _1038 = uint(_1036);
    float _1040 = float(uint(_1032));
    float _1042 = as_type<float>(_573) * _1040;
    float _1044 = trunc(_990);
    float _1046 = precise::max(_1044, 0.0);
    uint _1048 = uint(_1046);
    float _1050 = trunc(_1042);
    float _1052 = precise::max(_1050, 0.0);
    uint _1054 = uint(_1052);
    int _1056 = int(_984) + int(_1038);
    int _1058 = ~_517;
    int _1060 = _1058 + 1;
    int _1062 = _1000 * _1056;
    int _1064 = _1062 + _946;
    int _1066 = _1026 * int(_1048);
    int _1068 = _1066 + _826;
    float _1070 = _590 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _1072 = uint(_1064) >= uint(_479);
    float _1074 = float(uint(_1068));
    bool _1076 = !_1072;
    int _1078 = _1076 ? 0 : (-1);
    int _1080 = int(_1006) + int(_1054);
    float _1082 = as_type<float>(_563) * _1074;
    int _1084 = ~_1056;
    int _1086 = _1084 + _1078;
    int _1088 = _1086 + 1;
    int _1090 = ~_517;
    int _1092 = _1090 + 1;
    int _1094 = _1060 * _1080;
    int _1096 = _1094 + _976;
    float _1098 = trunc(_1082);
    float _1100 = precise::max(_1098, 0.0);
    uint _1102 = uint(_1100);
    int _1104 = _479 * _1088;
    int _1106 = _1104 + _946;
    bool _1108 = uint(_1096) >= uint(_517);
    int _1110 = _1092 * int(_1020);
    int _1112 = _1110 + _910;
    float _1114 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _1116 = !_992;
    int _1118 = _1116 ? _1106 : (-1);
    bool _1120 = !_1108;
    int _1122 = _1120 ? 0 : (-1);
    int _1124 = _1118 & 3;
    bool _1126 = _1124 != 0;
    int _1128 = _1118 & 3;
    bool _1130 = _1128 != 0;
    int _1132 = ~_1080;
    int _1134 = _1132 + _1122;
    int _1136 = _1134 + 1;
    int _1138 = int(_1048) + int(_1102);
    int _1140 = ~_479;
    int _1142 = _1140 + 1;
    int _1144 = _517 * _1136;
    int _1146 = _1144 + _976;
    bool _1148 = uint(_1124) > 1u;
    int _1150 = _1130 ? 0 : 1;
    float _1152 = float(uint(_1112));
    bool _1154 = _1124 != 3;
    float _1156 = as_type<float>(_573) * _1152;
    bool _1158 = uint(_1124) >= 2u;
    bool _1160 = !_820;
    int _1162 = _1160 ? _1146 : (-1);
    int _1164 = _1142 * _1138;
    int _1166 = _1164 + _826;
    int _1168 = _1158 ? 0 : 1;
    float _1170 = trunc(_1156);
    float _1172 = precise::max(_1170, 0.0);
    uint _1174 = uint(_1172);
    int _1176 = _1162 & 3;
    bool _1178 = _1176 != 0;
    int _1180 = ~_1150;
    int _1182 = _1180 + 1;
    int _1184 = _1182 + 1;
    int _1186 = _1184;
    int _1188 = _1168;
    if (!_1148)
    {
        int _1190 = ~_1150;
        int _1192 = _1190 + 1;
        _1186 = _1192;
    }
    int _1194 = _1186;
    int _1196 = ~_1168;
    int _1198 = _1196 + 1;
    int _1200 = _1198 + 1;
    bool _1202 = uint(_1166) >= uint(_479);
    int _1204 = _1200;
    float _1206 = as_type<float>(_1194);
    if (_1154)
    {
        int _1208 = ~_1168;
        int _1210 = _1208 + 1;
        _1204 = _1210;
    }
    int _1212 = _1204;
    bool _1214 = uint(_1176) > 1u;
    int _1216 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1218 = _1216 != 0;
    bool _1220 = !_1202;
    int _1222 = _1220 ? 0 : (-1);
    int _1224 = _1162 & 3;
    bool _1226 = _1224 != 0;
    int _1228 = ~_1138;
    int _1230 = _1228 + _1222;
    int _1232 = _1230 + 1;
    int _1234 = _1226 ? 0 : 1;
    int _1236 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1238 = _1236 != 0;
    int _1240 = _479 * _1232;
    int _1242 = _1240 + _826;
    int _1244 = ~_1234;
    int _1246 = _1244 + 1;
    int _1248 = _1246 + 1;
    int _1250 = _1248;
    if (!_1214)
    {
        int _1252 = ~_1234;
        int _1254 = _1252 + 1;
        _1250 = _1254;
    }
    int _1256 = _1250;
    if (_1218)
    {
        _1188 = 0;
    }
    int _1258 = _1188;
    int _1260 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1262 = _1260 != 0;
    int _1264 = _1258;
    if (!_1218)
    {
        _1264 = 1;
    }
    int _1266 = _1264;
    bool _1268 = _1176 != 3;
    bool _1270 = !_1262;
    int _1272 = _1270 ? 0 : 1;
    bool _1274 = uint(_1176) >= 2u;
    int _1276 = _1274 ? 0 : 1;
    bool _1278 = !_1238;
    int _1280 = _1278 ? 0 : 1;
    int _1282 = ~_1276;
    int _1284 = _1282 + 1;
    int _1286 = _1284 + 1;
    bool _1288 = !_992;
    int _1290 = _1288 ? _1242 : (-1);
    float _1292 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1294 = _1292 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    int _1296 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1298 = _1296 != 0;
    int _1300 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1302 = _1300 != 0;
    float _1304 = 1.0 / _1294;
    int _1306 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1308 = _1306 != 0;
    int _1310 = _1286;
    if (_1268)
    {
        int _1312 = ~_1276;
        int _1314 = _1312 + 1;
        _1310 = _1314;
    }
    int _1316 = _1310;
    float _1318 = in.m_44.x;
    float _1320 = in.m_44.y;
    float _1322 = in.m_44.z;
    int _1324 = int(_1020) + int(_1174);
    int _1326 = ~_517;
    int _1328 = _1326 + 1;
    int _1330 = _1328 * _1324;
    int _1332 = _1330 + _910;
    float _1334 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1336 = _1334 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1338 = _588 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _1340 = _592 > 0.5;
    bool _1342 = uint(_1332) >= uint(_517);
    float _1344 = 1.0 / _1336;
    float _1346 = -_1114;
    float _1348 = fma(_1338, 2.0, _1346);
    float _1350 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    bool _1352 = !_1342;
    int _1354 = _1352 ? 0 : (-1);
    bool _1356 = _588 > 0.5;
    float _1358 = fma(_1070, -2.0, _1350);
    bool _1360 = !_1126;
    int _1362 = _1360 ? 0 : 1;
    float _1364 = _1320 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1366 = _1320 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1368 = _1320 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1370 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _1372 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _1370;
    float _1374 = fma(_1318, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1364);
    float _1376 = fma(_1318, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1366);
    float _1378 = fma(_1318, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1368);
    float _1380 = _1372 * _575;
    float _1382 = -_171;
    int _1384 = _1356 ? as_type<int>(_1382) : as_type<int>(_171);
    float _1386 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _1388 = _1386 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    int _1390 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1392 = _1390 != 0;
    float _1394 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1396 = _1394 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _1398 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1400 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _1398;
    int _1402 = ~_1324;
    int _1404 = _1402 + _1354;
    int _1406 = _1404 + 1;
    float _1408 = _588 * 2.0;
    int _1410 = _1118 >> 31;
    float _1412 = 1.0 / _1396;
    float _1414 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1416 = _1414 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1418 = _1400 * _606;
    float _1420 = _588 + _590;
    bool _1422 = !_1392;
    float _1424 = _1422 ? _171 : as_type<float>(_1384);
    int _1426 = _517 * _1406;
    int _1428 = _1426 + _910;
    float _1430 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1432 = _1430 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1434 = 1.0 / _1416;
    float _1436 = _1420 + (-1.0);
    bool _1438 = _590 > 0.5;
    float _1440 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _1442 = _1440 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1444 = _590 * 2.0;
    float _1446 = _592 + _588;
    float _1448 = _1388 * _1304;
    float _1450 = _1442 * _1344;
    float _1452 = _1010 * _1412;
    int _1454 = _1410 & 3;
    float _1456 = floor(_1408);
    float _1458 = -_171;
    int _1460 = _1340 ? as_type<int>(_1458) : as_type<int>(_171);
    float _1462 = _588 + (-0.5);
    int _1464 = _1118 + _1454;
    float _1466 = _592 + _590;
    bool _1468 = _594 > 0.5;
    float _1470 = _485 * _1434;
    int _1472 = _1464 >> 2;
    float _1474 = 1.0 / _1432;
    float _1476 = _1466 + (-1.0);
    bool _1478 = !_1302;
    float _1480 = _1478 ? _171 : as_type<float>(_1460);
    float _1482 = _592 + (-0.5);
    int _1484 = _1472 << 4;
    int _1486 = _1484 + 368;
    float _1488 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1358);
    int _1490 = abs(_1194);
    float _1492 = floor(_1444);
    int _1494 = ~_1490;
    int _1496 = _1494 + 1;
    int _1498 = _1496 + 1;
    int _1500 = abs(_1362);
    float _1502 = fma(_1436, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1504 = -_175;
    int _1506 = _1438 ? as_type<int>(_1504) : as_type<int>(_175);
    float _1508 = _491 * _1474;
    bool _1510 = _517 == 0;
    float _1512 = fma(_590, 6.283185482025146484375, _127);
    int _1514 = _1162 >> 31;
    bool _1516 = !_1298;
    float _1518 = _1516 ? _175 : as_type<float>(_1506);
    bool _1520 = !_1510;
    int _1522 = _1520 ? _1428 : (-1);
    uint _1524 = uint(int(uint(_1486) >> uint(2)));
    uint _1526 = uint(int(uint(int(_1524)) >> uint(2)));
    int _1528 = int(_1524) & 3;
    float _1530 = (*spvDescriptorSet0.vp_c9)._m0[int(_1526)][_1528];
    int _1532 = int(_1524) + 1;
    uint _1534 = uint(int(uint(_1532) >> uint(2)));
    int _1536 = _1532 & 3;
    float _1538 = (*spvDescriptorSet0.vp_c9)._m0[int(_1534)][_1536];
    bool _1540 = _1456 > 0.0;
    float _1542 = fma(_594, 6.283185482025146484375, _127);
    bool _1544 = _1456 >= 0.0;
    bool _1546 = isnan(_1456);
    bool _1548 = _1544 || _1546;
    bool _1550 = isnan(0.0);
    bool _1552 = _1548 || _1550;
    float _1554 = fma(_1476, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _1556 = int(_1308);
    int _1558 = _1126 ? 2 : 0;
    int _1560 = _1556 | _1558;
    int _1562 = _1302 ? 4 : 0;
    int _1564 = _1560 | _1562;
    int _1566 = _1540 ? 8 : 0;
    int _1568 = _1564 | _1566;
    int _1570 = _1178 ? 16 : 0;
    int _1572 = _1568 | _1570;
    int _1574 = _1552 ? 32 : 0;
    int _1576 = _1572 | _1574;
    int _1578 = _1468 ? 64 : 0;
    int _1580 = _1576 | _1578;
    int _1582 = _1580 & 64;
    float _1584 = fma(_592, 6.283185482025146484375, _127);
    int _1586 = _1514 & 3;
    float _1588 = _1542 * 1.57079637050628662109375;
    bool _1590 = _1266 != 1;
    float _1592 = _590 + (-0.5);
    bool _1594 = _1582 != 0;
    int _1596 = _1162 + _1586;
    int _1598 = _1486 + 8;
    uint _1600 = uint(int(uint(_1598) >> uint(2)));
    uint _1602 = uint(int(uint(int(_1600)) >> uint(2)));
    int _1604 = int(_1600) & 3;
    float _1606 = (*spvDescriptorSet0.vp_c9)._m0[int(_1602)][_1604];
    int _1608 = int(_1600) + 1;
    uint _1610 = uint(int(uint(_1608) >> uint(2)));
    int _1612 = _1608 & 3;
    float _1614 = (*spvDescriptorSet0.vp_c9)._m0[int(_1610)][_1612];
    float _1616 = -_175;
    int _1618 = _1594 ? as_type<int>(_1616) : as_type<int>(_175);
    int _1620 = _1596 >> 2;
    bool _1622 = _1492 > 0.0;
    bool _1624 = _1492 >= 0.0;
    bool _1626 = isnan(_1492);
    bool _1628 = _1624 || _1626;
    bool _1630 = isnan(0.0);
    bool _1632 = _1628 || _1630;
    int _1634 = _1620 << 4;
    int _1636 = _1634 + 512;
    float _1638 = 0.0;
    if (!_1590)
    {
        _1638 = _590;
    }
    float _1640 = _1638;
    float _1642 = 0.0;
    float _1644 = _1640;
    if (!_1590)
    {
        _1642 = _590;
    }
    float _1646 = _1642;
    float _1648 = _1646;
    if (_1590)
    {
        _1644 = _588;
    }
    float _1650 = _1644;
    if (_1590)
    {
        _1648 = _588;
    }
    float _1652 = _1648;
    float _1654 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    if (!_1590)
    {
        _1206 = _592;
    }
    float _1656 = _1206;
    uint _1658 = uint(int(uint(_1636) >> uint(2)));
    uint _1660 = uint(int(uint(int(_1658)) >> uint(2)));
    int _1662 = int(_1658) & 3;
    float _1664 = (*spvDescriptorSet0.vp_c9)._m0[int(_1660)][_1662];
    int _1666 = int(_1658) + 1;
    uint _1668 = uint(int(uint(_1666) >> uint(2)));
    int _1670 = _1666 & 3;
    float _1672 = (*spvDescriptorSet0.vp_c9)._m0[int(_1668)][_1670];
    float _1674 = _1656;
    if (_1590)
    {
        _632 = _590;
    }
    float _1676 = _632;
    float _1678 = fma(_590, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1654);
    if (_1590)
    {
        _1674 = _590;
    }
    float _1680 = _1674;
    float _1682 = _1650 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    bool _1684 = !_1178;
    int _1686 = _1684 ? 0 : 1;
    float _1688 = _1676 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _1690 = _1124 != 3;
    int _1692 = _1636 + 8;
    uint _1694 = uint(int(uint(_1692) >> uint(2)));
    uint _1696 = uint(int(uint(int(_1694)) >> uint(2)));
    int _1698 = int(_1694) & 3;
    float _1700 = (*spvDescriptorSet0.vp_c9)._m0[int(_1696)][_1698];
    int _1702 = int(_1694) + 1;
    uint _1704 = uint(int(uint(_1702) >> uint(2)));
    int _1706 = _1702 & 3;
    float _1708 = (*spvDescriptorSet0.vp_c9)._m0[int(_1704)][_1706];
    int _1710 = abs(_1212);
    float _1712 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1678);
    int _1714 = ~_1500;
    int _1716 = _1714 + 1;
    int _1718 = _1716 + 1;
    int _1720 = _1498 * as_type<int>(_1538);
    bool _1722 = _1176 != 3;
    bool _1724 = !_1690;
    int _1726 = _1724 ? 0 : (-1);
    int _1728 = _1718 * as_type<int>(_1530);
    int _1730 = _1728 + _1720;
    int _1732 = ~_1710;
    int _1734 = _1732 + 1;
    int _1736 = _1734 + 1;
    int _1738 = abs(_1726);
    int _1740 = abs(_1256);
    float _1742 = float(uint(_616));
    int _1744 = _1552 ? 0 : 1;
    int _1746 = _1736 * as_type<int>(_1606);
    int _1748 = _1746 + _1730;
    bool _1750 = !_1722;
    int _1752 = _1750 ? 0 : (-1);
    int _1754 = abs(_1280);
    int _1756 = ~_1738;
    int _1758 = _1756 + 1;
    int _1760 = _1758 + 1;
    int _1762 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1764 = _1762 != 0;
    int _1766 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1768 = _1766 != 0;
    int _1770 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1772 = _1770 != 0;
    float _1774 = 1.0 / _1742;
    int _1776 = ~_1740;
    int _1778 = _1776 + 1;
    int _1780 = _1778 + 1;
    int _1782 = _1760 * as_type<int>(_1614);
    int _1784 = _1782 + _1748;
    int _1786 = ~_1754;
    int _1788 = _1786 + 1;
    int _1790 = _1788 + 1;
    int _1792 = abs(_1316);
    int _1794 = ~_1744;
    int _1796 = _1794 + 1;
    int _1798 = _1796 + 1;
    int _1800 = _1784 * _1790;
    int _1802 = abs(_1686);
    int _1804 = _1780 * as_type<int>(_1672);
    int _1806 = _1798;
    if (!_1540)
    {
        int _1808 = ~_1744;
        int _1810 = _1808 + 1;
        _1806 = _1810;
    }
    int _1812 = _1806;
    int _1814 = _1290 * _1754;
    int _1816 = _1814 + _1800;
    int _1818 = ~_1802;
    int _1820 = _1818 + 1;
    int _1822 = _1820 + 1;
    float _1824 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _1826 = int(_1824);
    int _1828 = abs(_1272);
    int _1830 = as_type<int>(_1774) + (-2);
    int _1832 = _1822 * as_type<int>(_1664);
    int _1834 = _1832 + _1804;
    float _1836 = float(uint(_1816));
    int _1838 = ~_1792;
    int _1840 = _1838 + 1;
    int _1842 = _1840 + 1;
    int _1844 = abs(_1752);
    bool _1846 = _874 >= 0.0;
    bool _1848 = isnan(_874);
    bool _1850 = _1846 || _1848;
    bool _1852 = isnan(0.0);
    bool _1854 = _1850 || _1852;
    int _1856 = _1842 * as_type<int>(_1700);
    int _1858 = _1856 + _1834;
    float _1860 = as_type<float>(_1830) * _1836;
    int _1862 = ~_1844;
    int _1864 = _1862 + 1;
    int _1866 = _1864 + 1;
    float _1868 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1870 = _459 + _1868;
    float _1872 = fma(_1322, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1376);
    float _1874 = fma(_1322, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1374);
    float _1876 = fma(_1322, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1378);
    float _1878 = trunc(_1860);
    float _1880 = precise::max(_1878, 0.0);
    uint _1882 = uint(_1880);
    int _1884 = _1866 * as_type<int>(_1708);
    int _1886 = _1884 + _1858;
    float _1888 = fma(_1380, _1870, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _1890 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1892 = _459 + _1890;
    int _1894 = ~_616;
    int _1896 = _1894 + 1;
    int _1898 = ~_1828;
    int _1900 = _1898 + 1;
    int _1902 = _1900 + 1;
    float _1904 = fma(_1448, _1892, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    int _1906 = abs(_616);
    float _1908 = float(uint(_1826));
    int _1910 = _1886 * _1902;
    int _1912 = _1854 ? 0 : 1;
    bool _1914 = _874 > 0.0;
    int _1916 = _1896 * int(_1882);
    int _1918 = _1916 + _1816;
    float _1920 = float(uint(_1906));
    float _1922 = 1.0 / _1908;
    int _1924 = abs(_1826);
    float _1926 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1928 = _459 + _1926;
    float _1930 = float(uint(_1918));
    int _1932 = _1522 * _1828;
    int _1934 = _1932 + _1910;
    float _1936 = fma(_1418, _1928, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    bool _1938 = _459 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _1940 = isnan(_459);
    bool _1942 = _1938 || _1940;
    bool _1944 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _1946 = _1942 || _1944;
    float _1948 = float(_1946);
    float _1950 = 1.0 / _1920;
    bool _1952 = _459 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1954 = isnan(_459);
    bool _1956 = _1952 || _1954;
    bool _1958 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1960 = _1956 || _1958;
    float _1962 = float(_1960);
    float _1964 = as_type<float>(_1830) * _1930;
    float _1966 = float(uint(_1924));
    int _1968 = abs(_1816);
    float _1970 = -_1962;
    float _1972 = _1970 + 1.0;
    float _1974 = float(uint(_1934));
    float _1976 = trunc(_1964);
    float _1978 = precise::max(_1976, 0.0);
    uint _1980 = uint(_1978);
    int _1982 = as_type<int>(_1922) + (-2);
    float _1984 = _1948 * _1972;
    int _1986 = abs(_1934);
    float _1988 = as_type<float>(_1982) * _1974;
    float _1990 = float(uint(_1968));
    float _1992 = 1.0 / _1966;
    int _1994 = as_type<int>(_1950) + (-2);
    float _1996 = -_1948;
    float _1998 = _1996 + 1.0;
    bool _2000 = _459 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _2002 = isnan(_459);
    bool _2004 = _2000 || _2002;
    bool _2006 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _2008 = _2004 || _2006;
    float _2010 = float(_2008);
    bool _2012 = _459 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _2014 = isnan(_459);
    bool _2016 = _2012 || _2014;
    bool _2018 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _2020 = _2016 || _2018;
    float _2022 = float(_2020);
    float _2024 = as_type<float>(_1994) * _1990;
    float _2026 = float(uint(_1986));
    float _2028 = trunc(_1988);
    float _2030 = precise::max(_2028, 0.0);
    uint _2032 = uint(_2030);
    float _2034 = _2010 * _1998;
    bool _2036 = _459 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _2038 = isnan(_459);
    bool _2040 = _2036 || _2038;
    bool _2042 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _2044 = _2040 || _2042;
    float _2046 = float(_2044);
    float _2048 = -_2010;
    float _2050 = _2048 + 1.0;
    float _2052 = -_2022;
    float _2054 = _2052 + 1.0;
    int _2056 = ~_1826;
    int _2058 = _2056 + 1;
    float _2060 = _2022 * _2050;
    int _2062 = as_type<int>(_1992) + (-2);
    float _2064 = trunc(_2024);
    float _2066 = precise::max(_2064, 0.0);
    uint _2068 = uint(_2066);
    float _2070 = _2046 * _2054;
    int _2072 = ~_1906;
    int _2074 = _2072 + 1;
    float _2076 = -_2046;
    float _2078 = _2076 + 1.0;
    float _2080 = as_type<float>(_2062) * _2026;
    bool _2082 = _459 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _2084 = isnan(_459);
    bool _2086 = _2082 || _2084;
    bool _2088 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _2090 = _2086 || _2088;
    float _2092 = float(_2090);
    int _2094 = _2058 * int(_2032);
    int _2096 = _2094 + _1934;
    float _2098 = trunc(_2080);
    float _2100 = precise::max(_2098, 0.0);
    uint _2102 = uint(_2100);
    int _2104 = ~_1924;
    int _2106 = _2104 + 1;
    float _2108 = -_2092;
    float _2110 = _2108 + 1.0;
    float _2112 = _2092 * _2078;
    float _2114 = float(uint(_2096));
    float _2116 = _503 * _2110;
    float _2118 = -_503;
    float _2120 = _2118 + 1.0;
    int _2122 = _2074 * int(_2068);
    int _2124 = _2122 + _1968;
    float _2126 = as_type<float>(_1982) * _2114;
    bool _2128 = _459 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _2130 = isnan(_459);
    bool _2132 = _2128 || _2130;
    bool _2134 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _2136 = _2132 || _2134;
    float _2138 = float(_2136);
    float _2140 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2142 = _459 + _2140;
    bool _2144 = !_1308;
    float _2146 = _2144 ? _175 : as_type<float>(_1618);
    float _2148 = float(uint(_2124));
    float _2150 = trunc(_2126);
    float _2152 = precise::max(_2150, 0.0);
    uint _2154 = uint(_2152);
    int _2156 = _2106 * int(_2102);
    int _2158 = _2156 + _1986;
    float _2160 = fma(_1450, _2142, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _2162 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2164 = _459 + _2162;
    float _2166 = as_type<float>(_1994) * _2148;
    float _2168 = _2138 * _2120;
    float _2170 = float(uint(_2158));
    float _2172 = -_2138;
    float _2174 = _2172 + 1.0;
    int _2176 = ~_616;
    int _2178 = _2176 + 1;
    float _2180 = _1888 * _2168;
    int _2182 = int(_1882) + int(_1980);
    float _2184 = as_type<float>(_2062) * _2170;
    float _2186 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2188 = _459 + _2186;
    float _2190 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2192 = _459 + _2190;
    float _2194 = trunc(_2166);
    float _2196 = precise::max(_2194, 0.0);
    uint _2198 = uint(_2196);
    float _2200 = fma(_2174, (*spvDescriptorSet0.vp_c9)._m0[159].x, _2180);
    int _2202 = int(_2032) + int(_2154);
    float _2204 = fma(_1452, _2192, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    int _2206 = _2178 * _2182;
    int _2208 = _2206 + _1816;
    int _2210 = ~_1826;
    int _2212 = _2210 + 1;
    float _2214 = fma(_1904, _2116, _2200);
    int _2216 = ~_1912;
    int _2218 = _2216 + 1;
    int _2220 = _2218 + 1;
    float _2222 = trunc(_2184);
    float _2224 = precise::max(_2222, 0.0);
    uint _2226 = uint(_2224);
    int _2228 = _2220;
    if (!_1914)
    {
        int _2230 = ~_1912;
        int _2232 = _2230 + 1;
        _2228 = _2232;
    }
    int _2234 = _2228;
    int _2236 = _2212 * _2202;
    int _2238 = _2236 + _1934;
    bool _2240 = uint(_2208) >= uint(_616);
    float _2242 = fma(_1508, _2188, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _2244 = fma(_1936, _2112, _2214);
    bool _2246 = !_2240;
    int _2248 = _2246 ? 0 : (-1);
    float _2250 = fma(_1470, _2164, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    int _2252 = int(_2068) + int(_2198);
    float _2254 = fma(_2160, _2070, _2244);
    int _2256 = ~_1924;
    int _2258 = _2256 + 1;
    float _2260 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _2262 = uint(_2238) >= uint(_1826);
    float _2264 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _2266 = ~_2182;
    int _2268 = _2266 + _2248;
    int _2270 = _2268 + 1;
    float _2272 = fma(_2250, _2060, _2254);
    int _2274 = int(_2102) + int(_2226);
    int _2276 = ~_1906;
    int _2278 = _2276 + 1;
    float _2280 = fma(_2242, _2034, _2272);
    bool _2282 = !_2262;
    int _2284 = _2282 ? 0 : (-1);
    int _2286 = _2258 * _2274;
    int _2288 = _2286 + _1986;
    int _2290 = _2278 * _2252;
    int _2292 = _2290 + _1968;
    int _2294 = ~_2202;
    int _2296 = _2294 + _2284;
    int _2298 = _2296 + 1;
    float _2300 = fma(_2204, _1984, _2280);
    bool _2302 = !_1768;
    int _2304 = _2302 ? 0 : 1;
    float _2306 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    bool _2308 = uint(_2292) >= uint(_1906);
    float _2310 = fma(_1680, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2264);
    float _2312 = fma(_1652, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2306);
    bool _2314 = !_2308;
    int _2316 = _2314 ? 0 : (-1);
    int _2318 = _1826 * _2298;
    int _2320 = _2318 + _1934;
    bool _2322 = uint(_2288) >= uint(_1924);
    int _2324 = _616 * _2270;
    int _2326 = _2324 + _1816;
    float _2328 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    int _2330 = ~_2316;
    int _2332 = _2252 + _2330;
    int _2334 = _2332 + 1;
    float _2336 = _1872 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _2338 = !_2322;
    int _2340 = _2338 ? 0 : (-1);
    float _2342 = -_127;
    float _2344 = fma(_2342, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1348);
    bool _2346 = _616 == 0;
    float _2348 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2350 = _2336 + _2348;
    int _2352 = _1934 ^ _1826;
    float _2354 = _2260 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _2356 = !_2346;
    int _2358 = _2356 ? _2326 : (-1);
    float _2360 = _1876 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _2362 = _1826 == 0;
    float _2364 = _2350 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    uint _2366 = uint(int(uint(_2352) >> uint(31)));
    float _2368 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2312);
    bool _2370 = !_2362;
    int _2372 = _2370 ? _2320 : (-1);
    float _2374 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2310);
    bool _2376 = _616 == 0;
    float _2378 = fma(_1962, (*spvDescriptorSet0.vp_c9)._m0[166].x, _2300);
    int _2380 = _1816 ^ _616;
    float _2382 = -_2328;
    float _2384 = fma(_1682, 2.0, _2382);
    float _2386 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    uint _2388 = uint(int(uint(_2380) >> uint(31)));
    float _2390 = -_127;
    float _2392 = fma(_2390, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2384);
    int _2394 = abs(_2304);
    float _2396 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _2398 = ~int(_2388);
    int _2400 = _2398 + 1;
    out.m_60.x = _2378;
    int _2402 = ~_2340;
    int _2404 = _2274 + _2402;
    int _2406 = _2404 + 1;
    float _2408 = fma(_1688, -2.0, _2396);
    int _2410 = _2334 ^ _2400;
    float _2412 = _1874 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _2414 = ~int(_2366);
    int _2416 = _2414 + 1;
    int _2418 = ~_2400;
    int _2420 = _2418 + _2410;
    int _2422 = _2420 + 1;
    float _2424 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2426 = _2412 + _2424;
    float _2428 = float(_1812);
    float _2430 = _2386 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    bool _2432 = !_2376;
    int _2434 = _2432 ? _2422 : (-1);
    float _2436 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _2438 = _1826 == 0;
    float _2440 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2442 = _2360 + _2440;
    float _2444 = float(_2394);
    float _2446 = float(_2358);
    int _2448 = _2406 ^ _2416;
    float _2450 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2452 = float(_2372);
    float _2454 = _2444 * _2428;
    float _2456 = fma(_2426, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2364);
    int _2458 = ~_2416;
    int _2460 = _2458 + _2448;
    int _2462 = _2460 + 1;
    float _2464 = fma(_2354, _2446, _2344);
    float _2466 = fma(_2430, _2452, _2392);
    float _2468 = _1424 + 0.5;
    bool _2470 = !_2438;
    int _2472 = _2470 ? _2462 : (-1);
    float _2474 = _2436 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2476 = float(_2434);
    float _2478 = fma(_2354, _2468, _2464);
    float _2480 = float(_2472);
    float _2482 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2408);
    float _2484 = _1480 + 0.5;
    float _2486 = -_1488;
    float _2488 = fma(_2474, _2476, _2486);
    float _2490 = _2450 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2492 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _2494 = log2(_2492);
    float _2496 = fma(_2430, _2484, _2466);
    float _2498 = -_2368;
    float _2500 = _2498 + 1.0;
    float _2502 = -_2482;
    float _2504 = fma(_2490, _2480, _2502);
    float _2506 = _1518 + (-0.5);
    float _2508 = _2146 + (-0.5);
    float _2510 = fma(_2442, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2456);
    float _2512 = -_2500;
    float _2514 = fma(_1480, _2512, _2496);
    float _2516 = -_2474;
    float _2518 = fma(_2516, _2506, _2488);
    float _2520 = -_2490;
    float _2522 = fma(_2520, _2508, _2504);
    bool _2524 = !_1764;
    int _2526 = _2524 ? 0 : 1;
    float _2528 = -_1712;
    float _2530 = _2528 + 1.0;
    bool _2532 = _2510 >= 0.0;
    float _2534 = -_666;
    float _2536 = fma(_1424, _2534, _2478);
    int _2538 = abs(_2526);
    float _2540 = _2350 * _2350;
    float _2542 = float(_2234);
    float _2544 = _2494 * _127;
    float _2546 = float(_2538);
    float _2548 = fma(_2426, _2426, _2540);
    float _2550 = fma(_1518, _2530, _2518);
    float _2552 = -_2374;
    float _2554 = _2552 + 1.0;
    float _2556 = _2546 * _2542;
    float _2558 = fma(_2442, _2442, _2548);
    float _2560 = in.m_62.x;
    float _2562 = in.m_62.y;
    float _2564 = in.m_62.z;
    float _2566 = fma(_2146, _2554, _2522);
    float _2568 = exp2(_2544);
    float _2570 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _2572 = 1.0 + _2570;
    float _2574 = _2540;
    if (_2532)
    {
        _2574 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2576 = _2574;
    out.m_64.x = _2536;
    out.m_64.y = _2550;
    out.m_64.z = _2514;
    out.m_64.w = _2566;
    bool _2578 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2580 = isnan(0.0);
    bool _2582 = _2578 || _2580;
    bool _2584 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2586 = _2582 || _2584;
    float _2588 = _1512 * 1.57079637050628662109375;
    int _2590 = as_type<int>(_2576);
    if (_2532)
    {
        float _2592 = _2576 * 5.0;
        _2590 = as_type<int>(_2592);
    }
    int _2594 = _2590;
    float _2596 = rsqrt(_2558);
    if (_2532)
    {
        out.m_47.x = 0.0;
    }
    bool _2598 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2600 = isnan(1.0);
    bool _2602 = _2598 || _2600;
    bool _2604 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2606 = _2602 || _2604;
    if (_2532)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7688 = as_type<float>(_2594);
        out.gl_Position.z = _7688;
    }
    float _2608 = 1.0 / _2572;
    float _2610 = -_2568;
    float _2612 = _2610 + 1.0;
    float _2614 = _2350 * _2596;
    bool _2616 = !_1772;
    int _2618 = _2616 ? 0 : 1;
    float _2620 = _2426 * _2596;
    if (_2532)
    {
        return out;
    }
    float _2622 = -_2614;
    float _2624 = fma(_2622, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2336);
    float _2626 = _1588 * 0.15915493667125701904296875;
    float _2628 = _2442 * _2596;
    float _2630 = -_2620;
    float _2632 = fma(_2630, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2412);
    float _2634 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2636 = _2624 + _2634;
    float _2638 = _2556 * (-2.0);
    float _2640 = -_2628;
    float _2642 = fma(_2640, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2360);
    float _2644 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2646 = _2632 + _2644;
    float _2648 = _2636 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2650 = _2586 ? _2612 : 0.0;
    float _2652 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2654 = _2642 + _2652;
    float _2656 = _2454 * (-2.0);
    float _2658 = fma(_2646, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2648);
    float _2660 = _2588 * 0.15915493667125701904296875;
    float _2662 = fma(_1502, _2638, _1502);
    float _2664 = fma(_2638, _2560, _2560);
    float _2666 = fma(_2654, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2658);
    float _2668 = _2660;
    float _2670 = _2624;
    if (_2606)
    {
        float _2672 = _2650 * _2608;
        _145 = _2672;
    }
    float _2674 = _145;
    float _2676 = _1584 * 1.57079637050628662109375;
    float _2678 = fma(_1462, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2664);
    float _2680 = fma(_2656, _2562, _2562);
    bool _2682 = _2666 >= 0.0;
    float _2684 = _2676 * 0.15915493667125701904296875;
    float _2686 = fma(_2662, _2674, _2678);
    int _2688 = _1632 ? 0 : 1;
    float _2690 = fma(_1554, _2656, _1554);
    float _2692 = fma(_1592, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2680);
    int _2694 = abs(_2618);
    float _2696 = _2686 * 0.15915493667125701904296875;
    int _2698 = ~_2688;
    int _2700 = _2698 + 1;
    int _2702 = _2700 + 1;
    float _2704 = _2660 * 6.283185482025146484375;
    float _2706 = sin(_2704);
    int _2708 = _2702;
    if (!_1622)
    {
        int _2710 = ~_2688;
        int _2712 = _2710 + 1;
        _2708 = _2712;
    }
    int _2714 = _2708;
    float _2716 = fma(_2690, _2674, _2692);
    float _2718 = _1446 + (-1.0);
    if (_2682)
    {
        out.m_47.x = 0.0;
    }
    float _2720 = _2626 * 6.283185482025146484375;
    float _2722 = sin(_2720);
    if (_2682)
    {
        _2668 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2724 = _2668;
    float _2726 = fma(_2718, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2728 = float(_2714);
    float _2730 = float(_2694);
    int _2732 = as_type<int>(_2724);
    if (_2682)
    {
        float _2734 = _2724 * 5.0;
        _2732 = as_type<int>(_2734);
    }
    int _2736 = _2732;
    float _2738 = _2684 * 6.283185482025146484375;
    float _2740 = sin(_2738);
    if (_2682)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7902 = as_type<float>(_2736);
        out.gl_Position.z = _7902;
    }
    float _2742 = _2696 * 6.283185482025146484375;
    float _2744 = sin(_2742);
    float _2746 = _2696 * 6.283185482025146484375;
    float _2748 = cos(_2746);
    if (_2682)
    {
        return out;
    }
    float _2750 = -_2336;
    float _2752 = _2750 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2754 = _2730 * _2728;
    float _2756 = _2716 * 0.15915493667125701904296875;
    float _2758 = -_2412;
    float _2760 = _2758 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2762 = _2752 * _2752;
    float _2764 = _2754 * (-2.0);
    float _2766 = -_2360;
    float _2768 = _2766 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2770 = _159 + (*spvDescriptorSet0.vp_c9)._m0[191].z;
    float _2772 = fma(_2760, _2760, _2762);
    float _2774 = fma(_2764, _2564, _2564);
    float _2776 = in.m_66.x;
    float _2778 = in.m_66.y;
    float _2780 = fma(_2726, _2764, _2726);
    float _2782 = fma(_2768, _2768, _2772);
    float _2784 = fma(_1482, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2774);
    float _2786 = -_2770;
    float _2788 = _2786 + 1.0;
    float _2790 = precise::clamp(_2788, 0.0, 1.0);
    float _2792 = rsqrt(_2782);
    float _2794 = fma(_2780, _2674, _2784);
    float _2796 = -_2614;
    float _2798 = fma(_2796, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2350);
    float _2800 = fma(_2790, -2.0, 3.0);
    float _2802 = _2790 * _2790;
    float _2804 = -_2620;
    float _2806 = fma(_2804, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2426);
    float _2808 = _2798 * _2798;
    float _2810 = -_2628;
    float _2812 = fma(_2810, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2442);
    float _2814 = _2800 * _2802;
    float _2816 = precise::clamp(_2814, 0.0, 1.0);
    float _2818 = _2794 * 0.15915493667125701904296875;
    float _2820 = fma(_2806, _2806, _2808);
    float _2822 = _2756 * 6.283185482025146484375;
    float _2824 = sin(_2822);
    float _2826 = _2816 * (*spvDescriptorSet0.vp_c9)._m0[191].y;
    float _2828 = fma(_2812, _2812, _2820);
    bool _2830 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2832 = isnan(0.5);
    bool _2834 = _2830 || _2832;
    bool _2836 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2838 = _2834 || _2836;
    float _2840 = _2760 * _2792;
    float _2842 = fma(_2740, _2826, _175);
    float _2844 = _431 * _2776;
    float _2846 = _2768 * _2792;
    float _2848 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _2850 = _2840 * _2848;
    float _2852 = fma(_2706, _2826, _171);
    float _2854 = _2722 * _2826;
    float _2856 = _2752 * _2792;
    float _2858 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2860 = _2846 * _2858;
    float _2862 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _2864 = -_2850;
    float _2866 = fma(_2846, _2862, _2864);
    float _2868 = _2756 * 6.283185482025146484375;
    float _2870 = cos(_2868);
    float _2872 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _2874 = _2856 * _2872;
    float _2876 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _2878 = -_2860;
    float _2880 = fma(_2856, _2876, _2878);
    float _2882 = _2866 * _2866;
    float _2884 = _433 * _2778;
    float _2886 = _2744 * _2824;
    float _2888 = fma(_2880, _2880, _2882);
    float _2890 = sqrt(_2828);
    float _2892 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2894 = -_2874;
    float _2896 = fma(_2840, _2892, _2894);
    float _2898 = _2844 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2900 = fma(_2896, _2896, _2888);
    float _2902 = _2884 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2904 = _2748 * _2824;
    float _2906 = _2818 * 6.283185482025146484375;
    float _2908 = sin(_2906);
    float _2910 = _2748 * _2870;
    float _2912 = _2744 * _2870;
    float _2914 = _2818 * 6.283185482025146484375;
    float _2916 = cos(_2914);
    float _2918 = _2596 * _2890;
    float _2920 = _2918 * _2902;
    float _2922 = _2918 * _2898;
    float _2924 = rsqrt(_2900);
    float _2926 = fma(_2908, _2910, _2886);
    float _2928 = fma(_2908, _2886, _2910);
    float _2930 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _2842);
    float _2932 = _2748 * _2916;
    float _2934 = _2870 * _2916;
    float _2936 = _2744 * _2916;
    float _2938 = _2824 * _2916;
    float _2940 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _2852);
    float _2942 = _2930 * _2920;
    float _2944 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _2854);
    float _2946 = -_2904;
    float _2948 = fma(_2908, _2912, _2946);
    float _2950 = _2940 * _2922;
    float _2952 = _2932 * _2942;
    float _2954 = _2880 * _2924;
    float _2956 = _2866 * _2924;
    float _2958 = _2896 * _2924;
    float _2960 = -_2942;
    float _2962 = _2908 * _2960;
    float _2964 = -_2912;
    float _2966 = fma(_2908, _2904, _2964);
    float _2968 = _2918 * _2944;
    float _2970 = fma(_2926, _2950, _2952);
    float _2972 = _2856 * _2954;
    float _2974 = _2936 * _2942;
    float _2976 = fma(_2934, _2950, _2962);
    float _2978 = fma(_2966, _2968, _2970);
    float _2980 = _2846 * _2956;
    float _2982 = -_2972;
    float _2984 = fma(_2840, _2956, _2982);
    float _2986 = fma(_2948, _2950, _2974);
    float _2988 = fma(_2938, _2968, _2976);
    float _2990 = -_2980;
    float _2992 = fma(_2856, _2958, _2990);
    float _2994 = _2984 * _2978;
    float _2996 = fma(_2928, _2968, _2986);
    float _2998 = _2992 * _2978;
    float _3000 = fma(_2958, _2988, _2994);
    float _3002 = fma(_2954, _2988, _2998);
    float _3004 = fma(_2846, _2996, _3000);
    float _3006 = fma(_2840, _2996, _3002);
    float _3008 = _2360 + _3004;
    float _3010 = _2412 + _3006;
    float _3012 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _3014 = _3008 + _3012;
    float _3016 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _3018 = _3010 + _3016;
    float _3020 = _3014 * _3014;
    float _3022 = fma(_3018, _3018, _3020);
    float _3024 = _2840 * _2958;
    float _3026 = sqrt(_3022);
    float _3028 = -_3024;
    float _3030 = fma(_2846, _2954, _3028);
    float _3032 = _3030 * _2978;
    float _3034 = fma(_2956, _2988, _3032);
    float _3036 = fma(_2856, _2996, _3034);
    bool _3038 = _3026 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3040 = _2336 + _3036;
    float _3042 = _3032;
    float _3044 = _3010;
    float _3046 = _3008;
    if (!_3038)
    {
        _3042 = _3040;
    }
    float _3048 = _3042;
    bool _3050 = !_3038;
    float _3052 = _3048;
    if (!_3050)
    {
        float _3054 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3056 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _3058 = _3026 + _3056;
        float _3060 = rsqrt(_3022);
        float _3062 = _3058 * _3054;
        float _3064 = _3040 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3066 = _3062 * 0.15915493667125701904296875;
        float _3068 = _3066 * 6.283185482025146484375;
        float _3070 = sin(_3068);
        float _3072 = _3066 * 6.283185482025146484375;
        float _3074 = cos(_3072);
        float _3076 = fma(_3070, _3064, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _3078 = _3060 * _3076;
        float _3080 = _3074 + (-1.0);
        float _3082 = fma(_3018, _3078, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _3084 = fma(_3014, _3078, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _3086 = _3080 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3088 = fma(_3040, _3074, _3086);
        _3044 = _3082;
        _3052 = _3088;
        _3046 = _3084;
    }
    float _3090 = _3044;
    float _3092 = _3052;
    float _3094 = _3046;
    float _3096 = -_2620;
    float _3098 = fma(_3096, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3090);
    float _3100 = -_2614;
    float _3102 = fma(_3100, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3092);
    float _3104 = -_2628;
    float _3106 = fma(_3104, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3094);
    float _3108 = _3102;
    float _3110 = _3098;
    float _3112 = _3106;
    float _3114 = _3092;
    if (!_2838)
    {
        float _3116 = _2636 * _2636;
        float _3118 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _3120 = -_2360;
        float _3122 = _3120 + _3094;
        float _3124 = fma(_2646, _2646, _3116);
        float _3126 = fma(_2654, _2654, _3124);
        float _3128 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3130 = sqrt(_3126);
        float _3132 = 1.0 / _2918;
        float _3134 = _3128 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3136 = precise::min(_3130, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _3138 = _3136 * _3118;
        float _3140 = _3138 * _3132;
        float _3142 = -_2412;
        float _3144 = _3142 + _3090;
        float _3146 = -_2336;
        float _3148 = _3146 + _3092;
        float _3150 = _3134 * _3140;
        float _3152 = _3122 * _3140;
        float _3154 = fma(_3144, _3150, _2632);
        float _3156 = fma(_3148, _3150, _2624);
        float _3158 = fma(_3134, _3152, _2642);
        _3108 = _3156;
        _3110 = _3154;
        _3112 = _3158;
    }
    float _3160 = _3108;
    float _3162 = _3110;
    float _3164 = _3112;
    float _3166 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3168 = _3160 + _3166;
    float _3170 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3172 = _3162 + _3170;
    float _3174 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3176 = _3164 + _3174;
    float _3178 = _3168 * _3168;
    float _3180 = fma(_3172, _3172, _3178);
    float _3182 = fma(_3176, _3176, _3180);
    float _3184 = rsqrt(_3182);
    float _3186 = sqrt(_3182);
    float _3188 = _3184 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3190 = _3172 * _3188;
    float _3192 = _3176 * _3188;
    float _3194 = _3190 * _3190;
    float _3196 = _3192 * _3192;
    float _3198 = _3194 + _3196;
    float _3200 = sqrt(_3198);
    bool _3202 = _3200 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3204 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3206 = _3200 + _3204;
    float _3208 = _3184;
    float _3210 = _3206;
    float _3212 = _3168;
    if (_3202)
    {
        float _3214 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3208 = _3214;
    }
    float _3216 = _3208;
    float _3218 = _3216;
    if (_3202)
    {
        float _3220 = _3206 * _3216;
        _3210 = _3220;
    }
    float _3222 = _3210;
    if (_3202)
    {
        float _3224 = rsqrt(_3198);
        _3218 = _3224;
    }
    float _3226 = _3218;
    float _3228 = _3226;
    if (_3202)
    {
        float _3230 = _3222 * 0.15915493667125701904296875;
        _3114 = _3230;
    }
    float _3232 = _3114;
    float _3234 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3236 = _3176;
    float _3238 = _3232;
    if (_3202)
    {
        float _3240 = _3232 * 6.283185482025146484375;
        float _3242 = sin(_3240);
        _3236 = _3242;
    }
    float _3244 = _3236;
    float _3246 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _3248 = precise::max(0.0, _3234);
    float _3250 = _2918;
    float _3252 = _3248;
    if (_3202)
    {
        float _3254 = _3232 * 6.283185482025146484375;
        float _3256 = cos(_3254);
        _3250 = _3256;
    }
    float _3258 = _3250;
    float _3260 = -_3188;
    float _3262 = -_3248;
    float _3264 = fma(_3168, _3260, _3262);
    if (_3202)
    {
        float _3266 = _3264 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3212 = _3266;
    }
    float _3268 = _3212;
    float _3270 = _3244;
    float _3272 = _3268;
    if (_3202)
    {
        float _3274 = fma(_3244, _3268, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3270 = _3274;
    }
    float _3276 = _3270;
    float _3278 = _3276;
    if (!_3202)
    {
        _3272 = _3264;
    }
    float _3280 = _3272;
    float _3282 = _3280;
    if (_3202)
    {
        float _3284 = _3226 * _3276;
        _2670 = _3284;
    }
    float _3286 = _2670;
    if (!_3202)
    {
        _3228 = _3190;
    }
    float _3288 = _3228;
    float _3290 = _3288;
    float _3292 = _3258;
    if (_3202)
    {
        float _3294 = _3258 + (-1.0);
        _3252 = _3294;
    }
    float _3296 = _3252;
    float _3298 = _3296;
    if (_3202)
    {
        float _3300 = _3190 * _3286;
        _3290 = _3300;
    }
    float _3302 = _3290;
    if (!_3202)
    {
        _3278 = _3194;
    }
    float _3304 = _3278;
    float _3306 = _3160 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3308 = _3304;
    if (_3202)
    {
        float _3310 = _3296 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3238 = _3310;
    }
    float _3312 = _3238;
    if (!_3202)
    {
        _3298 = _3192;
    }
    float _3314 = _3298;
    float _3316 = _3314;
    if (_3202)
    {
        float _3318 = _3192 * _3286;
        _3316 = _3318;
    }
    float _3320 = _3316;
    if (_3202)
    {
        float _3322 = _3302 * _3302;
        _3308 = _3322;
    }
    float _3324 = _3308;
    if (_3202)
    {
        float _3326 = fma(_3264, _3258, _3312);
        _3282 = _3326;
    }
    float _3328 = _3282;
    if (!_3202)
    {
        _3292 = _3196;
    }
    float _3330 = _3292;
    float _3332 = _3330;
    if (_3202)
    {
        float _3334 = _3320 * _3320;
        _3332 = _3334;
    }
    float _3336 = _3332;
    float _3338 = _3160 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3340 = fma(_3328, _3328, _3324);
    float _3342 = fma(_3162, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3306);
    float _3344 = fma(_3162, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3338);
    float _3346 = _3340 + _3336;
    float _3348 = _3160 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3350 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3352 = fma(_3186, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3350);
    float _3354 = precise::clamp(_3352, 0.0, 1.0);
    float _3356 = fma(_3164, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3344);
    float _3358 = _3160 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3360 = fma(_3162, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3348);
    float _3362 = rsqrt(_3346);
    float _3364 = -_3354;
    float _3366 = _3364 + 1.0;
    float _3368 = fma(_3162, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3358);
    float _3370 = fma(_3164, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3360);
    float _3372 = _3356 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3374 = fma(_3164, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3368);
    float _3376 = _3370 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3378 = abs(_3366);
    float _3380 = log2(_3378);
    float _3382 = _3372 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3384 = _3374 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3386 = _3376 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3388 = -_3382;
    float _3390 = fma(_3388, _3246, 1.0);
    float _3392 = fma(_3164, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3342);
    float _3394 = fma(_3384, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3386);
    float _3396 = _3362 * _3302;
    float _3398 = _3362 * _3328;
    float _3400 = _3362 * _3320;
    float _3402 = _3392 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3404 = _3396 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3406 = fma(_3372, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3394);
    float _3408 = log2(_3390);
    float _3410 = _3376 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3412 = _3380 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3414 = -_3404;
    float _3416 = fma(_3398, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3414);
    float _3418 = fma(_3402, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3406);
    float _3420 = fma(_3384, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3410);
    float _3422 = -_3400;
    float _3424 = fma(_3422, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3416);
    float _3426 = exp2(_3412);
    float _3428 = _3376 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3430 = _3398 + 1.0;
    float _3432 = fma(_3424, -0.5, 0.5);
    float _3434 = fma(_3424, 0.5, 0.5);
    float _3436 = fma(_3384, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3428);
    float _3438 = fma(_3372, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3420);
    float _3440 = 1.0 / _3418;
    float _3442 = fma(_3372, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3436);
    float _3444 = fma(_3434, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3446 = fma(_3434, _3444, -0.212114393711090087890625);
    float _3448 = sqrt(_3432);
    float _3450 = -_3398;
    float _3452 = fma(_3426, _3430, _3450);
    float _3454 = fma(_3402, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3442);
    float _3456 = fma(_3402, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3438);
    float _3458 = fma(_3434, _3446, 1.570728778839111328125);
    float _3460 = fma(_3452, 0.5, 0.5);
    float _3462 = _3454 * _3440;
    float _3464 = _3408 * 0.693147182464599609375;
    float _3466 = _3456 * _3440;
    float _3468 = fma(_3462, 0.5, 0.5);
    float _3470 = _3464 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3472 = fma(_3466, -0.5, 0.5);
    float _3474 = _3448 * 0.636619746685028076171875;
    float3 _9073 = float3(_3468, _3472, _3470);
    float _3476 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_9073, float3(0.0), isnan(_9073)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_9073, float3(0.0), isnan(_9073)), level(0.0)).x;
    float _3478 = -_3458;
    float _3480 = fma(_3474, _3478, 1.0);
    float3 _9089 = float3(_3468, _3472, _3470);
    float4 _3483 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_9089, float3(0.0), isnan(_9089)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_9089, float3(0.0), isnan(_9089)), level(0.0)).xyzw;
    float _3485 = _3483.x;
    float _3487 = _3483.y;
    float _3489 = _3483.z;
    float _3491 = _3483.w;
    float2 _9106 = float2(_3480, _3460);
    float3 _3495 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_9106, float2(0.0), isnan(_9106)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_9106, float2(0.0), isnan(_9106)), level(0.0)).xyz;
    float _3497 = _3495.x;
    float _3499 = _3495.y;
    float _3501 = _3495.z;
    float _3503 = fma(_2854, (*spvDescriptorSet0.vp_c9)._m0[17].y, 1.0);
    float _3505 = _2842 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3507 = _3380 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3509 = _2926 * _2992;
    float _3511 = _2926 * _3030;
    float _3513 = _2926 * _2984;
    float _3515 = _2932 * _2992;
    float _3517 = _2932 * _3030;
    float _3519 = _3505 * _3505;
    float _3521 = exp2(_3507);
    float _3523 = _2932 * _2984;
    float _3525 = _2966 * _2992;
    float _3527 = fma(_3503, _3503, _3519);
    float _3529 = _2966 * _3030;
    float _3531 = _2966 * _2984;
    float _3533 = fma(_2934, _2954, _3509);
    float _3535 = fma(_2934, _2956, _3511);
    float _3537 = fma(_2934, _2958, _3513);
    float _3539 = rsqrt(_3527);
    float _3541 = -_2908;
    float _3543 = fma(_3541, _2954, _3515);
    float _3545 = -_2908;
    float _3547 = fma(_3545, _2956, _3517);
    float _3549 = -_2908;
    float _3551 = fma(_3549, _2958, _3523);
    float _3553 = fma(_2938, _2954, _3525);
    float _3555 = fma(_2938, _2956, _3529);
    float _3557 = fma(_2938, _2958, _3531);
    float _3559 = _3376 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3561 = fma(_2936, _2840, _3543);
    float _3563 = fma(_2936, _2856, _3547);
    float _3565 = fma(_2928, _2840, _3553);
    float _3567 = fma(_2948, _2840, _3533);
    float _3569 = fma(_2948, _2856, _3535);
    float _3571 = fma(_2948, _2846, _3537);
    float _3573 = fma(_3384, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3559);
    float _3575 = _2852 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3577 = _3505 * _3561;
    float _3579 = fma(_2928, _2856, _3555);
    float _3581 = fma(_3372, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3573);
    float _3583 = -_3521;
    float _3585 = _3583 + 1.0;
    float _3587 = fma(_3575, _3567, _3577);
    float _3589 = fma(_2928, _2846, _3557);
    float _3591 = _3505 * _3563;
    float _3593 = fma(_2936, _2846, _3551);
    float _3595 = _3505 * _3539;
    float _3597 = fma(_3402, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3581);
    float _3599 = _3585 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_68.x = _3567;
    out.m_68.y = _3569;
    out.m_68.z = _3571;
    float _3601 = _3503 * _3539;
    float _3603 = fma(_3575, _3569, _3591);
    float _3605 = -_3565;
    float _3607 = _3595 * _3605;
    float _3609 = -_3579;
    float _3611 = _3595 * _3609;
    out.m_70.x = _3162;
    out.m_70.y = _3160;
    out.m_70.z = _3164;
    float _3613 = fma(_3601, _3561, _3607);
    float _3615 = fma(_3601, _3563, _3611);
    bool _3617 = _3186 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3619 = isnan(_3186);
    bool _3621 = _3617 || _3619;
    bool _3623 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3625 = _3621 || _3623;
    out.gl_Position.x = _3454;
    out.gl_Position.y = _3456;
    out.gl_Position.z = _3597;
    out.gl_Position.w = _3418;
    float _3627 = -_3589;
    float _3629 = _3595 * _3627;
    float _3631 = _3505 * _3593;
    float _3633 = _3597 + _3418;
    float _3635 = fma(_3601, _3593, _3629);
    float _3637 = fma(_3575, _3571, _3631);
    float _3639 = _3633 * 0.5;
    float _3641 = fma(_3503, _3565, _3587);
    float _3643 = -_3599;
    float _3645 = _3643 + 1.0;
    out.m_72.x = _3613;
    out.m_72.y = _3615;
    out.m_72.z = _3635;
    float _3647 = fma(_3503, _3579, _3603);
    float _3649 = fma(_3503, _3589, _3637);
    out.m_74.z = _3639;
    out.m_74.w = _3418;
    float _3651 = _3418;
    float _3653 = _3597;
    float _3655 = _3456;
    float _3657 = _3454;
    if (!_3625)
    {
        _3651 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3659 = _3651;
    float _3661 = _3659;
    float _3663 = _3659;
    if (!_3625)
    {
        _3653 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3665 = _3653;
    out.m_76.x = _3641;
    out.m_76.y = _3647;
    out.m_76.z = _3649;
    float _3667 = _3665;
    float _3669 = _3665;
    if (!_3625)
    {
        _3655 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3671 = _3655;
    float _3673 = _3671;
    float _3675 = _3671;
    if (!_3625)
    {
        _3657 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3677 = _3657;
    float _3679 = _3599 * _3476;
    float _3681 = _3491 * _3679;
    float _3683 = _3491 * _3645;
    float _3685 = _3501 * _3679;
    float _3687 = fma(_3497, _3681, _3485);
    float _3689 = fma(_3499, _3681, _3487);
    float _3691 = _3485;
    float _3693 = _3681;
    float _3695 = _3677;
    float _3697 = _3677;
    if (!_3625)
    {
        _3691 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3699 = _3691;
    float _3701 = fma(_3491, _3685, _3489);
    float _3703 = _3699;
    float _3705 = _3699;
    if (!_3625)
    {
        _3693 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3707 = _3693;
    out.m_78.x = _3687;
    out.m_78.y = _3689;
    out.m_78.z = _3701;
    out.m_78.w = _3683;
    bool _3709 = !_3625;
    float _3711 = _3707;
    float _3713 = _3707;
    if (!_3709)
    {
        bool _3715 = _3186 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3717 = isnan(_3186);
        bool _3719 = _3715 || _3717;
        bool _3721 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3723 = _3719 || _3721;
        if (!_3723)
        {
            float _3725 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3727 = _3186 + _3725;
            float _3729 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3731 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3729;
            float _3733 = 1.0 / _3731;
            float _3735 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3737 = _3735 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3739 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3741 = _3739 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3743 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3745 = _3743 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3747 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3749 = _3747 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3751 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3753 = _3751 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3755 = _3727 * _3733;
            float _3757 = precise::clamp(_3755, 0.0, 1.0);
            float _3759 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3761 = _3759 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3763 = fma(_3757, _3737, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3765 = fma(_3757, _3761, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3767 = fma(_3757, _3741, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3769 = fma(_3757, _3745, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3771 = fma(_3757, _3749, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3773 = fma(_3757, _3753, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3663 = _3765;
            _3697 = _3771;
            _3705 = _3763;
            _3675 = _3769;
            _3669 = _3767;
            _3713 = _3773;
            _3775 = true;
        }
        else
        {
            bool _3777 = _3186 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3779 = isnan(_3186);
            bool _3781 = _3777 || _3779;
            bool _3783 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3785 = _3781 || _3783;
            if (!_3785)
            {
                _3703 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3787 = _3703;
            _3705 = _3787;
            if (!_3785)
            {
                _3661 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3789 = _3661;
            _3663 = _3789;
            if (!_3785)
            {
                _3667 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3791 = _3667;
            _3669 = _3791;
            if (!_3785)
            {
                _3673 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3793 = _3673;
            _3675 = _3793;
            if (!_3785)
            {
                _3695 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3795 = _3695;
            _3697 = _3795;
            if (!_3785)
            {
                _3711 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3797 = _3711;
            bool _3799 = !_3785;
            _3713 = _3797;
            if (!_3799)
            {
                bool _3801 = _3186 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3803 = isnan(_3186);
                bool _3805 = _3801 || _3803;
                bool _3807 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3809 = _3805 || _3807;
                if (!_3809)
                {
                    float _3811 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3813 = _3186 + _3811;
                    float _3815 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3817 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3815;
                    float _3819 = 1.0 / _3817;
                    float _3821 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3823 = _3821 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3825 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3827 = _3825 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3829 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3831 = _3829 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3833 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3835 = _3833 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3837 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3839 = _3837 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3841 = _3813 * _3819;
                    float _3843 = precise::clamp(_3841, 0.0, 1.0);
                    float _3845 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3847 = _3845 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3849 = fma(_3843, _3823, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3851 = fma(_3843, _3847, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3853 = fma(_3843, _3827, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3855 = fma(_3843, _3831, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3857 = fma(_3843, _3835, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3859 = fma(_3843, _3839, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3663 = _3851;
                    _3697 = _3857;
                    _3705 = _3849;
                    _3675 = _3855;
                    _3669 = _3853;
                    _3713 = _3859;
                    _3775 = true;
                }
                else
                {
                    _3663 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3697 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3705 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3675 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3669 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3713 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3775 = false;
    float _3861 = _3663;
    float _3863 = _3697;
    float _3865 = _3705;
    float _3867 = _3675;
    float _3869 = _3669;
    float _3871 = _3713;
    float _3873 = fma(_3647, -0.5, 0.5);
    float _3875 = precise::clamp(_3873, 0.0, 1.0);
    float _3877 = -_3861;
    float _3879 = _3877 + _3863;
    float _3881 = -_3865;
    float _3883 = _3881 + _3867;
    float _3885 = -_3869;
    float _3887 = _3885 + _3871;
    bool _3889 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3891 = fma(_3875, _3879, _3861);
    float _3893 = fma(_3875, _3883, _3865);
    float _3895 = fma(_3875, _3887, _3869);
    float _3897 = _3891 * 0.586610972881317138671875;
    out.m_80.x = 0.0;
    float _3899 = fma(_3893, 0.298911988735198974609375, _3897);
    float _3901 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3903 = fma(_3895, 0.114477999508380889892578125, _3899);
    out.m_47.x = _3901;
    float _3905 = -_3903;
    float _3907 = _3893 + _3905;
    float _3909 = -_3903;
    float _3911 = _3891 + _3909;
    float _3913 = -_3903;
    float _3915 = _3895 + _3913;
    float _3917 = fma(_3907, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3903);
    float _3919 = fma(_3911, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3903);
    float _3921 = fma(_3915, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3903);
    out.m_82.x = _3917;
    out.m_82.y = _3919;
    out.m_82.z = _3921;
    if (!_3889)
    {
        return out;
    }
    float _3923 = -_3160;
    float _3925 = _3923 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _3927 = -_3162;
    float _3929 = _3927 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _3931 = -_3164;
    float _3933 = _3931 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _3935 = _3925 * _3925;
    float _3937 = fma(_3929, _3929, _3935);
    float _3939 = fma(_3933, _3933, _3937);
    float _3941 = sqrt(_3939);
    float _3943 = rsqrt(_3939);
    float _3945 = -_3941;
    float _3947 = _3945 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3949 = _3947 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _3951 = precise::clamp(_3949, 0.0, 1.0);
    float _3953 = _3929 * _3943;
    float _3955 = _3925 * _3943;
    float _3957 = abs(_3951);
    float _3959 = log2(_3957);
    float _3961 = _3933 * _3943;
    float _3963 = _3953 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _3965 = _3647 * _3955;
    float _3967 = -_3955;
    float _3969 = -_3963;
    float _3971 = fma(_3967, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3969);
    float _3973 = fma(_3641, _3953, _3965);
    float _3975 = -_3961;
    float _3977 = fma(_3975, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3971);
    float _3979 = fma(_3649, _3961, _3973);
    float _3981 = precise::clamp(_3979, 0.0, 1.0);
    float _3983 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _3985 = _3977 + _3983;
    float _3987 = _3959 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _3989 = _3985 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _3991 = precise::clamp(_3989, 0.0, 1.0);
    float _3993 = exp2(_3987);
    float _3995 = _3993 * _3991;
    float _3997 = _3981 * _3995;
    float _3999 = _3997 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _4001 = _3997 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _4003 = _3997 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_80.x = _3999;
    out.m_80.y = _4001;
    out.m_80.z = _4003;
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
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3775 = false;
    bool _457 = false;
    bool _197 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _96 = in.m_44.w;
    float _98 = trunc(_96);
    int _101 = int(_98);
    bool _105 = _101 >= 1;
    float _107 = 0.0;
    float _109 = as_type<float>(_101);
    if (!_105)
    {
        _107 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _111 = _107;
    if (!_105)
    {
        out.m_47.x = 0.0;
    }
    int _113 = 0;
    if (!_105)
    {
        float _115 = _111 * 5.0;
        _113 = as_type<int>(_115);
    }
    int _117 = _113;
    int _119 = _117;
    if (!_105)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4061 = as_type<float>(_117);
        out.gl_Position.z = _4061;
    }
    if (!_105)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _121 = in.m_49.w;
    float _123 = float(_101);
    float _125 = -_121;
    float _127 = _125 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _129 = _121 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _131 = isnan(_121);
    bool _133 = _129 || _131;
    bool _135 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _137 = _133 || _135;
    bool _139 = _127 >= _123;
    bool _141 = !_137;
    bool _143 = _139 || _141;
    float _145 = _127;
    if (_143)
    {
        _109 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _147 = _109;
    if (_143)
    {
        out.m_47.x = 0.0;
    }
    if (_143)
    {
        float _149 = _147 * 5.0;
        _119 = as_type<int>(_149);
    }
    int _151 = _119;
    if (_143)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4125 = as_type<float>(_151);
        out.gl_Position.z = _4125;
    }
    if (_143)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _153 = as_type<float>(int(gl_VertexIndex));
    float _155 = 1.0 / _123;
    bool _157 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _159 = _127 * _155;
    int _161 = as_type<int>(_153) & 1;
    bool _163 = _161 != 0;
    int _165 = as_type<int>(_153) & 2;
    bool _167 = _165 != 0;
    bool _169 = !_163;
    float _171 = _169 ? (-0.5) : 0.5;
    bool _173 = !_167;
    float _175 = _173 ? (-0.5) : 0.5;
    bool _177 = !_157;
    float _195;
    if (!_177)
    {
        float _179 = in.m_54.x;
        float _181 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _183 = _179 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _185 = fma(_183, (*spvDescriptorSet0.vp_c9)._m0[12].x, _127);
        float _187 = _185 * _181;
        float _189 = floor(_187);
        float _191 = -_189;
        float _193 = _187 + _191;
        _195 = _193;
        _197 = true;
    }
    else
    {
        _195 = _159;
    }
    _197 = false;
    float _199 = _195;
    float _201 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _203 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _201;
    float _205 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _207 = _205 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _209 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _211 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _209;
    float _213 = 1.0 / _203;
    float _215 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _217 = _215 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _219 = 1.0 / _207;
    float _221 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _223 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _225 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _227 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _229 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _231 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _233 = 1.0 / _217;
    float _235 = _221 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _237 = _223 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _239 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _241 = _199 + _239;
    float _243 = _231 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _245 = _227 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _247 = _229 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _249 = _241 * _213;
    float _251 = 1.0 / _211;
    float _253 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _255 = _199 + _253;
    float _257 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _259 = _199 + _257;
    out.m_56.x = _245;
    out.m_56.y = _247;
    out.m_56.z = _243;
    bool _261 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _263 = _255 * _233;
    float _265 = _225 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _267 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _269 = _199 + _267;
    float _271 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _273 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _271;
    float _275 = _269 * _219;
    out.m_58.x = _235;
    out.m_58.y = _237;
    out.m_58.z = _265;
    bool _277 = _199 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _279 = isnan(_199);
    bool _281 = _277 || _279;
    bool _283 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _285 = _281 || _283;
    float _287 = float(_285);
    float _289 = _259 * _251;
    float _291 = fma(_273, _249, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _293 = -_287;
    float _295 = _293 + 1.0;
    bool _297 = _199 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _299 = isnan(_199);
    bool _301 = _297 || _299;
    bool _303 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _305 = _301 || _303;
    float _307 = float(_305);
    float _309 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _311 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _309;
    bool _313 = _199 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _315 = isnan(_199);
    bool _317 = _313 || _315;
    bool _319 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _321 = _317 || _319;
    float _323 = float(_321);
    float _325 = -_307;
    float _327 = _325 + 1.0;
    float _329 = _307 * _295;
    float _331 = fma(_311, _249, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _333 = _199 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _335 = isnan(_199);
    bool _337 = _333 || _335;
    bool _339 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _341 = _337 || _339;
    float _343 = float(_341);
    float _345 = _323 * _327;
    float _347 = -_323;
    float _349 = _347 + 1.0;
    float _351 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _353 = _351 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    bool _355 = _199 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _357 = isnan(_199);
    bool _359 = _355 || _357;
    bool _361 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _363 = _359 || _361;
    float _365 = float(_363);
    float _367 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _369 = _367 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _371 = _343 * _349;
    float _373 = -_343;
    float _375 = _373 + 1.0;
    float _377 = fma(_353, _275, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _379 = fma(_369, _275, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _381 = -_365;
    float _383 = _381 + 1.0;
    float _385 = _365 * _375;
    float _387 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _389 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _387;
    float _391 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _393 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _391;
    float _395 = _291 * _385;
    float _397 = _331 * _385;
    float _399 = fma(_389, _289, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _401 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _403 = _401 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _405 = fma(_383, (*spvDescriptorSet0.vp_c9)._m0[143].x, _395);
    float _407 = fma(_383, (*spvDescriptorSet0.vp_c9)._m0[143].y, _397);
    float _409 = fma(_393, _289, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _411 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _413 = _411 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _415 = fma(_379, _371, _405);
    float _417 = fma(_377, _371, _407);
    float _419 = fma(_403, _263, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _421 = fma(_413, _263, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _423 = fma(_399, _345, _415);
    float _425 = fma(_409, _345, _417);
    float _427 = fma(_419, _329, _423);
    float _429 = fma(_421, _329, _425);
    float _431 = fma(_287, (*spvDescriptorSet0.vp_c9)._m0[147].x, _427);
    float _433 = fma(_287, (*spvDescriptorSet0.vp_c9)._m0[147].y, _429);
    bool _435 = !_261;
    float _437 = _263;
    float _455;
    if (!_435)
    {
        float _439 = in.m_54.x;
        float _441 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _443 = _439 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _445 = fma(_443, (*spvDescriptorSet0.vp_c9)._m0[14].x, _127);
        float _447 = _445 * _441;
        float _449 = floor(_447);
        float _451 = -_449;
        float _453 = _447 + _451;
        _455 = _453;
        _457 = true;
    }
    else
    {
        _455 = _159;
    }
    _457 = false;
    float _459 = _455;
    float _461 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _463 = int(_461);
    float _465 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _467 = int(_465);
    float _469 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _471 = _469 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _473 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _475 = _473 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _477 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _479 = int(_477);
    float _481 = float(_463);
    float _483 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _485 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _483;
    float _487 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _489 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _491 = _489 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    bool _493 = _459 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _495 = isnan(_459);
    bool _497 = _493 || _495;
    bool _499 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _501 = _497 || _499;
    float _503 = float(_501);
    float _505 = float(_467);
    float _507 = 1.0 / _481;
    int _509 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _511 = _509 != 0;
    float _513 = float(uint(_479));
    float _515 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _517 = int(_515);
    int _519 = ~_479;
    int _521 = _519 + 1;
    int _523 = ~_479;
    int _525 = _523 + 1;
    bool _527 = _479 == 0;
    if (_511)
    {
        float _529 = in.m_54.x;
        _437 = _529;
    }
    float _531 = _437;
    float _533 = 1.0 / _505;
    float _535 = _507 * _127;
    float _537 = _531;
    if (!_511)
    {
        float _539 = in.m_54.y;
        _537 = _539;
    }
    float _541 = _537;
    float _543 = float(uint(_517));
    float _545 = 1.0 / _513;
    int _547 = ~_517;
    int _549 = _547 + 1;
    int _551 = ~_517;
    int _553 = _551 + 1;
    float _555 = _533 * _127;
    float _557 = trunc(_535);
    int _559 = int(_557);
    float _561 = 1.0 / _543;
    int _563 = as_type<int>(_545) + (-2);
    float _565 = trunc(_555);
    int _567 = int(_565);
    float _569 = float(uint(_559));
    float _571 = as_type<float>(_563) * _569;
    int _573 = as_type<int>(_561) + (-2);
    float _575 = 1.0 / _471;
    float _577 = float(uint(_567));
    float _579 = trunc(_571);
    float _581 = precise::max(_579, 0.0);
    uint _584 = uint(_581);
    float _586 = as_type<float>(_573) * _577;
    float _588 = in.m_54.x;
    float _590 = in.m_54.y;
    float _592 = in.m_54.z;
    float _594 = in.m_54.w;
    float _596 = trunc(_586);
    float _598 = precise::max(_596, 0.0);
    uint _600 = uint(_598);
    int _602 = _521 * int(_584);
    int _604 = _602 + _559;
    float _606 = 1.0 / _475;
    float _608 = float(uint(_604));
    int _610 = _549 * int(_600);
    int _612 = _610 + _567;
    float _614 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _616 = int(_614);
    float _618 = as_type<float>(_563) * _608;
    float _620 = _608;
    if (_511)
    {
        _620 = 1.0;
    }
    float _622 = _620;
    float _624 = float(uint(_612));
    float _626 = fma(_588, (*spvDescriptorSet0.vp_c9)._m0[78].z, _487);
    float _628 = _622;
    float _630 = _624;
    float _632 = _592;
    if (!_511)
    {
        _628 = 7.345489978790283203125;
    }
    float _634 = _628;
    float _636 = _592 * 2.0;
    float _638 = trunc(_618);
    float _640 = precise::max(_638, 0.0);
    uint _642 = uint(_640);
    float _644 = as_type<float>(_573) * _624;
    if (_511)
    {
        _630 = 1.0;
    }
    float _646 = _630;
    float _648 = _634 * _588;
    float _650 = _646;
    if (!_511)
    {
        _650 = 1.2345600128173828125;
    }
    float _652 = _650;
    float _654 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[77].z, _626);
    float _656 = trunc(_644);
    float _658 = precise::max(_656, 0.0);
    uint _660 = uint(_658);
    float _662 = _541 * _652;
    float _664 = -_654;
    float _666 = _664 + 1.0;
    float _668 = float(_479);
    float _670 = floor(_648);
    int _672 = int(_584) + int(_642);
    float _674 = float(_567);
    int _676 = int(_600) + int(_660);
    int _678 = _525 * _672;
    int _680 = _678 + _559;
    float _682 = float(_559);
    float _684 = floor(_662);
    float _686 = _155 * _127;
    int _688 = _553 * _676;
    int _690 = _688 + _567;
    bool _692 = _682 >= _668;
    bool _694 = isnan(_682);
    bool _696 = _692 || _694;
    bool _698 = isnan(_668);
    bool _700 = _696 || _698;
    float _702 = float(_700);
    bool _704 = uint(_680) >= uint(_479);
    float _706 = -_670;
    float _708 = _648 + _706;
    float _710 = float(_517);
    float _712 = trunc(_702);
    int _714 = int(_712);
    bool _716 = !_704;
    int _718 = _716 ? 0 : (-1);
    int _720 = ~_672;
    int _722 = _720 + _718;
    int _724 = _722 + 1;
    bool _726 = _674 >= _710;
    bool _728 = isnan(_674);
    bool _730 = _726 || _728;
    bool _732 = isnan(_710);
    bool _734 = _730 || _732;
    float _736 = float(_734);
    float _738 = -_684;
    float _740 = _662 + _738;
    float _742 = _708 * _668;
    bool _744 = uint(_690) >= uint(_517);
    int _746 = _479 * _724;
    int _748 = _746 + _559;
    int _750 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _752 = _750 != 0;
    float _754 = trunc(_736);
    int _756 = int(_754);
    float _758 = _668 * _686;
    float _760 = _710 * _686;
    bool _762 = !_744;
    int _764 = _762 ? 0 : (-1);
    float _766 = _740 * _710;
    int _768 = ~_714;
    int _770 = _768 + 1;
    int _772 = _770 + 1;
    bool _774 = !_527;
    int _776 = _774 ? _748 : (-1);
    float _778 = trunc(_742);
    int _780 = int(_778);
    bool _782 = !_752;
    int _784 = _782 ? 0 : 1;
    int _786 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _788 = _786 != 0;
    int _790 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _792 = _790 != 0;
    int _794 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _796 = _794 != 0;
    int _798 = _776 * _772;
    int _800 = ~_676;
    int _802 = _800 + _764;
    int _804 = _802 + 1;
    int _806 = abs(_784);
    float _808 = trunc(_758);
    int _810 = int(_808);
    bool _812 = !_792;
    int _814 = _812 ? 0 : 1;
    int _816 = _517 * _804;
    int _818 = _816 + _567;
    bool _820 = _517 == 0;
    int _822 = _479 + (-1);
    int _824 = _780 * _806;
    int _826 = _824 + _559;
    int _828 = abs(_814);
    float _830 = trunc(_760);
    int _832 = int(_830);
    int _834 = ~_756;
    int _836 = _834 + 1;
    int _838 = _836 + 1;
    int _840 = _714 * _822;
    int _842 = _840 + _798;
    bool _844 = !_820;
    int _846 = _844 ? _818 : (-1);
    int _848 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _850 = _848 != 0;
    float _852 = trunc(_766);
    int _854 = int(_852);
    bool _856 = !_788;
    int _858 = _856 ? 0 : 1;
    int _860 = _846 * _838;
    bool _862 = !_850;
    int _864 = _862 ? 0 : 1;
    int _866 = _842 * _828;
    bool _868 = !_796;
    int _870 = _868 ? 0 : 1;
    int _872 = abs(_858);
    float _874 = floor(_636);
    int _876 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _878 = _876 != 0;
    int _880 = abs(_870);
    int _882 = abs(_864);
    bool _884 = !_878;
    int _886 = _884 ? 0 : 1;
    int _888 = _810 * _872;
    int _890 = _888 + _866;
    int _892 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _894 = _892 != 0;
    int _896 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _898 = _896 != 0;
    int _900 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _902 = _900 != 0;
    int _904 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _906 = _904 != 0;
    int _908 = _854 * _882;
    int _910 = _908 + _567;
    int _912 = _517 + (-1);
    int _914 = _826 * _880;
    int _916 = _914 + _890;
    int _918 = abs(_886);
    bool _920 = !_898;
    int _922 = _920 ? 0 : 1;
    int _924 = _756 * _912;
    int _926 = _924 + _860;
    bool _928 = !_894;
    int _930 = _928 ? 0 : 1;
    int _932 = abs(_922);
    bool _934 = !_902;
    int _936 = _934 ? 0 : 1;
    int _938 = abs(_930);
    int _940 = _926 * _932;
    int _942 = abs(_936);
    int _944 = _780 * _918;
    int _946 = _944 + _916;
    bool _948 = !_906;
    int _950 = _948 ? 0 : 1;
    int _952 = _832 * _938;
    int _954 = _952 + _940;
    float _956 = float(uint(_946));
    int _958 = abs(_950);
    int _960 = _910 * _942;
    int _962 = _960 + _954;
    int _964 = ~_479;
    int _966 = _964 + 1;
    float _968 = as_type<float>(_563) * _956;
    int _970 = ~_517;
    int _972 = _970 + 1;
    int _974 = _854 * _958;
    int _976 = _974 + _962;
    float _978 = float(uint(_826));
    float _980 = trunc(_968);
    float _982 = precise::max(_980, 0.0);
    uint _984 = uint(_982);
    float _986 = float(uint(_910));
    float _988 = float(uint(_976));
    float _990 = as_type<float>(_563) * _978;
    bool _992 = _479 == 0;
    float _994 = as_type<float>(_573) * _986;
    float _996 = as_type<float>(_573) * _988;
    int _998 = ~_479;
    int _1000 = _998 + 1;
    float _1002 = trunc(_996);
    float _1004 = precise::max(_1002, 0.0);
    uint _1006 = uint(_1004);
    float _1008 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1010 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _1008;
    int _1012 = _966 * int(_984);
    int _1014 = _1012 + _946;
    float _1016 = trunc(_994);
    float _1018 = precise::max(_1016, 0.0);
    uint _1020 = uint(_1018);
    float _1022 = float(uint(_1014));
    int _1024 = ~_479;
    int _1026 = _1024 + 1;
    float _1028 = as_type<float>(_563) * _1022;
    int _1030 = _972 * int(_1006);
    int _1032 = _1030 + _976;
    float _1034 = trunc(_1028);
    float _1036 = precise::max(_1034, 0.0);
    uint _1038 = uint(_1036);
    float _1040 = float(uint(_1032));
    float _1042 = as_type<float>(_573) * _1040;
    float _1044 = trunc(_990);
    float _1046 = precise::max(_1044, 0.0);
    uint _1048 = uint(_1046);
    float _1050 = trunc(_1042);
    float _1052 = precise::max(_1050, 0.0);
    uint _1054 = uint(_1052);
    int _1056 = int(_984) + int(_1038);
    int _1058 = ~_517;
    int _1060 = _1058 + 1;
    int _1062 = _1000 * _1056;
    int _1064 = _1062 + _946;
    int _1066 = _1026 * int(_1048);
    int _1068 = _1066 + _826;
    float _1070 = _590 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _1072 = uint(_1064) >= uint(_479);
    float _1074 = float(uint(_1068));
    bool _1076 = !_1072;
    int _1078 = _1076 ? 0 : (-1);
    int _1080 = int(_1006) + int(_1054);
    float _1082 = as_type<float>(_563) * _1074;
    int _1084 = ~_1056;
    int _1086 = _1084 + _1078;
    int _1088 = _1086 + 1;
    int _1090 = ~_517;
    int _1092 = _1090 + 1;
    int _1094 = _1060 * _1080;
    int _1096 = _1094 + _976;
    float _1098 = trunc(_1082);
    float _1100 = precise::max(_1098, 0.0);
    uint _1102 = uint(_1100);
    int _1104 = _479 * _1088;
    int _1106 = _1104 + _946;
    bool _1108 = uint(_1096) >= uint(_517);
    int _1110 = _1092 * int(_1020);
    int _1112 = _1110 + _910;
    float _1114 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _1116 = !_992;
    int _1118 = _1116 ? _1106 : (-1);
    bool _1120 = !_1108;
    int _1122 = _1120 ? 0 : (-1);
    int _1124 = _1118 & 3;
    bool _1126 = _1124 != 0;
    int _1128 = _1118 & 3;
    bool _1130 = _1128 != 0;
    int _1132 = ~_1080;
    int _1134 = _1132 + _1122;
    int _1136 = _1134 + 1;
    int _1138 = int(_1048) + int(_1102);
    int _1140 = ~_479;
    int _1142 = _1140 + 1;
    int _1144 = _517 * _1136;
    int _1146 = _1144 + _976;
    bool _1148 = uint(_1124) > 1u;
    int _1150 = _1130 ? 0 : 1;
    float _1152 = float(uint(_1112));
    bool _1154 = _1124 != 3;
    float _1156 = as_type<float>(_573) * _1152;
    bool _1158 = uint(_1124) >= 2u;
    bool _1160 = !_820;
    int _1162 = _1160 ? _1146 : (-1);
    int _1164 = _1142 * _1138;
    int _1166 = _1164 + _826;
    int _1168 = _1158 ? 0 : 1;
    float _1170 = trunc(_1156);
    float _1172 = precise::max(_1170, 0.0);
    uint _1174 = uint(_1172);
    int _1176 = _1162 & 3;
    bool _1178 = _1176 != 0;
    int _1180 = ~_1150;
    int _1182 = _1180 + 1;
    int _1184 = _1182 + 1;
    int _1186 = _1184;
    int _1188 = _1168;
    if (!_1148)
    {
        int _1190 = ~_1150;
        int _1192 = _1190 + 1;
        _1186 = _1192;
    }
    int _1194 = _1186;
    int _1196 = ~_1168;
    int _1198 = _1196 + 1;
    int _1200 = _1198 + 1;
    bool _1202 = uint(_1166) >= uint(_479);
    int _1204 = _1200;
    float _1206 = as_type<float>(_1194);
    if (_1154)
    {
        int _1208 = ~_1168;
        int _1210 = _1208 + 1;
        _1204 = _1210;
    }
    int _1212 = _1204;
    bool _1214 = uint(_1176) > 1u;
    int _1216 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1218 = _1216 != 0;
    bool _1220 = !_1202;
    int _1222 = _1220 ? 0 : (-1);
    int _1224 = _1162 & 3;
    bool _1226 = _1224 != 0;
    int _1228 = ~_1138;
    int _1230 = _1228 + _1222;
    int _1232 = _1230 + 1;
    int _1234 = _1226 ? 0 : 1;
    int _1236 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1238 = _1236 != 0;
    int _1240 = _479 * _1232;
    int _1242 = _1240 + _826;
    int _1244 = ~_1234;
    int _1246 = _1244 + 1;
    int _1248 = _1246 + 1;
    int _1250 = _1248;
    if (!_1214)
    {
        int _1252 = ~_1234;
        int _1254 = _1252 + 1;
        _1250 = _1254;
    }
    int _1256 = _1250;
    if (_1218)
    {
        _1188 = 0;
    }
    int _1258 = _1188;
    int _1260 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1262 = _1260 != 0;
    int _1264 = _1258;
    if (!_1218)
    {
        _1264 = 1;
    }
    int _1266 = _1264;
    bool _1268 = _1176 != 3;
    bool _1270 = !_1262;
    int _1272 = _1270 ? 0 : 1;
    bool _1274 = uint(_1176) >= 2u;
    int _1276 = _1274 ? 0 : 1;
    bool _1278 = !_1238;
    int _1280 = _1278 ? 0 : 1;
    int _1282 = ~_1276;
    int _1284 = _1282 + 1;
    int _1286 = _1284 + 1;
    bool _1288 = !_992;
    int _1290 = _1288 ? _1242 : (-1);
    float _1292 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1294 = _1292 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    int _1296 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1298 = _1296 != 0;
    int _1300 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1302 = _1300 != 0;
    float _1304 = 1.0 / _1294;
    int _1306 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1308 = _1306 != 0;
    int _1310 = _1286;
    if (_1268)
    {
        int _1312 = ~_1276;
        int _1314 = _1312 + 1;
        _1310 = _1314;
    }
    int _1316 = _1310;
    float _1318 = in.m_44.x;
    float _1320 = in.m_44.y;
    float _1322 = in.m_44.z;
    int _1324 = int(_1020) + int(_1174);
    int _1326 = ~_517;
    int _1328 = _1326 + 1;
    int _1330 = _1328 * _1324;
    int _1332 = _1330 + _910;
    float _1334 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1336 = _1334 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1338 = _588 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _1340 = _592 > 0.5;
    bool _1342 = uint(_1332) >= uint(_517);
    float _1344 = 1.0 / _1336;
    float _1346 = -_1114;
    float _1348 = fma(_1338, 2.0, _1346);
    float _1350 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    bool _1352 = !_1342;
    int _1354 = _1352 ? 0 : (-1);
    bool _1356 = _588 > 0.5;
    float _1358 = fma(_1070, -2.0, _1350);
    bool _1360 = !_1126;
    int _1362 = _1360 ? 0 : 1;
    float _1364 = _1320 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1366 = _1320 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1368 = _1320 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1370 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _1372 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _1370;
    float _1374 = fma(_1318, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1364);
    float _1376 = fma(_1318, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1366);
    float _1378 = fma(_1318, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1368);
    float _1380 = _1372 * _575;
    float _1382 = -_171;
    int _1384 = _1356 ? as_type<int>(_1382) : as_type<int>(_171);
    float _1386 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _1388 = _1386 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    int _1390 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1392 = _1390 != 0;
    float _1394 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1396 = _1394 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _1398 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1400 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _1398;
    int _1402 = ~_1324;
    int _1404 = _1402 + _1354;
    int _1406 = _1404 + 1;
    float _1408 = _588 * 2.0;
    int _1410 = _1118 >> 31;
    float _1412 = 1.0 / _1396;
    float _1414 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1416 = _1414 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1418 = _1400 * _606;
    float _1420 = _588 + _590;
    bool _1422 = !_1392;
    float _1424 = _1422 ? _171 : as_type<float>(_1384);
    int _1426 = _517 * _1406;
    int _1428 = _1426 + _910;
    float _1430 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1432 = _1430 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1434 = 1.0 / _1416;
    float _1436 = _1420 + (-1.0);
    bool _1438 = _590 > 0.5;
    float _1440 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _1442 = _1440 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1444 = _590 * 2.0;
    float _1446 = _592 + _588;
    float _1448 = _1388 * _1304;
    float _1450 = _1442 * _1344;
    float _1452 = _1010 * _1412;
    int _1454 = _1410 & 3;
    float _1456 = floor(_1408);
    float _1458 = -_171;
    int _1460 = _1340 ? as_type<int>(_1458) : as_type<int>(_171);
    float _1462 = _588 + (-0.5);
    int _1464 = _1118 + _1454;
    float _1466 = _592 + _590;
    bool _1468 = _594 > 0.5;
    float _1470 = _485 * _1434;
    int _1472 = _1464 >> 2;
    float _1474 = 1.0 / _1432;
    float _1476 = _1466 + (-1.0);
    bool _1478 = !_1302;
    float _1480 = _1478 ? _171 : as_type<float>(_1460);
    float _1482 = _592 + (-0.5);
    int _1484 = _1472 << 4;
    int _1486 = _1484 + 368;
    float _1488 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1358);
    int _1490 = abs(_1194);
    float _1492 = floor(_1444);
    int _1494 = ~_1490;
    int _1496 = _1494 + 1;
    int _1498 = _1496 + 1;
    int _1500 = abs(_1362);
    float _1502 = fma(_1436, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1504 = -_175;
    int _1506 = _1438 ? as_type<int>(_1504) : as_type<int>(_175);
    float _1508 = _491 * _1474;
    bool _1510 = _517 == 0;
    float _1512 = fma(_590, 6.283185482025146484375, _127);
    int _1514 = _1162 >> 31;
    bool _1516 = !_1298;
    float _1518 = _1516 ? _175 : as_type<float>(_1506);
    bool _1520 = !_1510;
    int _1522 = _1520 ? _1428 : (-1);
    uint _1524 = uint(int(uint(_1486) >> uint(2)));
    uint _1526 = uint(int(uint(int(_1524)) >> uint(2)));
    int _1528 = int(_1524) & 3;
    float _1530 = (*spvDescriptorSet0.vp_c9)._m0[int(_1526)][_1528];
    int _1532 = int(_1524) + 1;
    uint _1534 = uint(int(uint(_1532) >> uint(2)));
    int _1536 = _1532 & 3;
    float _1538 = (*spvDescriptorSet0.vp_c9)._m0[int(_1534)][_1536];
    bool _1540 = _1456 > 0.0;
    float _1542 = fma(_594, 6.283185482025146484375, _127);
    bool _1544 = _1456 >= 0.0;
    bool _1546 = isnan(_1456);
    bool _1548 = _1544 || _1546;
    bool _1550 = isnan(0.0);
    bool _1552 = _1548 || _1550;
    float _1554 = fma(_1476, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _1556 = int(_1308);
    int _1558 = _1126 ? 2 : 0;
    int _1560 = _1556 | _1558;
    int _1562 = _1302 ? 4 : 0;
    int _1564 = _1560 | _1562;
    int _1566 = _1540 ? 8 : 0;
    int _1568 = _1564 | _1566;
    int _1570 = _1178 ? 16 : 0;
    int _1572 = _1568 | _1570;
    int _1574 = _1552 ? 32 : 0;
    int _1576 = _1572 | _1574;
    int _1578 = _1468 ? 64 : 0;
    int _1580 = _1576 | _1578;
    int _1582 = _1580 & 64;
    float _1584 = fma(_592, 6.283185482025146484375, _127);
    int _1586 = _1514 & 3;
    float _1588 = _1542 * 1.57079637050628662109375;
    bool _1590 = _1266 != 1;
    float _1592 = _590 + (-0.5);
    bool _1594 = _1582 != 0;
    int _1596 = _1162 + _1586;
    int _1598 = _1486 + 8;
    uint _1600 = uint(int(uint(_1598) >> uint(2)));
    uint _1602 = uint(int(uint(int(_1600)) >> uint(2)));
    int _1604 = int(_1600) & 3;
    float _1606 = (*spvDescriptorSet0.vp_c9)._m0[int(_1602)][_1604];
    int _1608 = int(_1600) + 1;
    uint _1610 = uint(int(uint(_1608) >> uint(2)));
    int _1612 = _1608 & 3;
    float _1614 = (*spvDescriptorSet0.vp_c9)._m0[int(_1610)][_1612];
    float _1616 = -_175;
    int _1618 = _1594 ? as_type<int>(_1616) : as_type<int>(_175);
    int _1620 = _1596 >> 2;
    bool _1622 = _1492 > 0.0;
    bool _1624 = _1492 >= 0.0;
    bool _1626 = isnan(_1492);
    bool _1628 = _1624 || _1626;
    bool _1630 = isnan(0.0);
    bool _1632 = _1628 || _1630;
    int _1634 = _1620 << 4;
    int _1636 = _1634 + 512;
    float _1638 = 0.0;
    if (!_1590)
    {
        _1638 = _590;
    }
    float _1640 = _1638;
    float _1642 = 0.0;
    float _1644 = _1640;
    if (!_1590)
    {
        _1642 = _590;
    }
    float _1646 = _1642;
    float _1648 = _1646;
    if (_1590)
    {
        _1644 = _588;
    }
    float _1650 = _1644;
    if (_1590)
    {
        _1648 = _588;
    }
    float _1652 = _1648;
    float _1654 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    if (!_1590)
    {
        _1206 = _592;
    }
    float _1656 = _1206;
    uint _1658 = uint(int(uint(_1636) >> uint(2)));
    uint _1660 = uint(int(uint(int(_1658)) >> uint(2)));
    int _1662 = int(_1658) & 3;
    float _1664 = (*spvDescriptorSet0.vp_c9)._m0[int(_1660)][_1662];
    int _1666 = int(_1658) + 1;
    uint _1668 = uint(int(uint(_1666) >> uint(2)));
    int _1670 = _1666 & 3;
    float _1672 = (*spvDescriptorSet0.vp_c9)._m0[int(_1668)][_1670];
    float _1674 = _1656;
    if (_1590)
    {
        _632 = _590;
    }
    float _1676 = _632;
    float _1678 = fma(_590, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1654);
    if (_1590)
    {
        _1674 = _590;
    }
    float _1680 = _1674;
    float _1682 = _1650 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    bool _1684 = !_1178;
    int _1686 = _1684 ? 0 : 1;
    float _1688 = _1676 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _1690 = _1124 != 3;
    int _1692 = _1636 + 8;
    uint _1694 = uint(int(uint(_1692) >> uint(2)));
    uint _1696 = uint(int(uint(int(_1694)) >> uint(2)));
    int _1698 = int(_1694) & 3;
    float _1700 = (*spvDescriptorSet0.vp_c9)._m0[int(_1696)][_1698];
    int _1702 = int(_1694) + 1;
    uint _1704 = uint(int(uint(_1702) >> uint(2)));
    int _1706 = _1702 & 3;
    float _1708 = (*spvDescriptorSet0.vp_c9)._m0[int(_1704)][_1706];
    int _1710 = abs(_1212);
    float _1712 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1678);
    int _1714 = ~_1500;
    int _1716 = _1714 + 1;
    int _1718 = _1716 + 1;
    int _1720 = _1498 * as_type<int>(_1538);
    bool _1722 = _1176 != 3;
    bool _1724 = !_1690;
    int _1726 = _1724 ? 0 : (-1);
    int _1728 = _1718 * as_type<int>(_1530);
    int _1730 = _1728 + _1720;
    int _1732 = ~_1710;
    int _1734 = _1732 + 1;
    int _1736 = _1734 + 1;
    int _1738 = abs(_1726);
    int _1740 = abs(_1256);
    float _1742 = float(uint(_616));
    int _1744 = _1552 ? 0 : 1;
    int _1746 = _1736 * as_type<int>(_1606);
    int _1748 = _1746 + _1730;
    bool _1750 = !_1722;
    int _1752 = _1750 ? 0 : (-1);
    int _1754 = abs(_1280);
    int _1756 = ~_1738;
    int _1758 = _1756 + 1;
    int _1760 = _1758 + 1;
    int _1762 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1764 = _1762 != 0;
    int _1766 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1768 = _1766 != 0;
    int _1770 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1772 = _1770 != 0;
    float _1774 = 1.0 / _1742;
    int _1776 = ~_1740;
    int _1778 = _1776 + 1;
    int _1780 = _1778 + 1;
    int _1782 = _1760 * as_type<int>(_1614);
    int _1784 = _1782 + _1748;
    int _1786 = ~_1754;
    int _1788 = _1786 + 1;
    int _1790 = _1788 + 1;
    int _1792 = abs(_1316);
    int _1794 = ~_1744;
    int _1796 = _1794 + 1;
    int _1798 = _1796 + 1;
    int _1800 = _1784 * _1790;
    int _1802 = abs(_1686);
    int _1804 = _1780 * as_type<int>(_1672);
    int _1806 = _1798;
    if (!_1540)
    {
        int _1808 = ~_1744;
        int _1810 = _1808 + 1;
        _1806 = _1810;
    }
    int _1812 = _1806;
    int _1814 = _1290 * _1754;
    int _1816 = _1814 + _1800;
    int _1818 = ~_1802;
    int _1820 = _1818 + 1;
    int _1822 = _1820 + 1;
    float _1824 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _1826 = int(_1824);
    int _1828 = abs(_1272);
    int _1830 = as_type<int>(_1774) + (-2);
    int _1832 = _1822 * as_type<int>(_1664);
    int _1834 = _1832 + _1804;
    float _1836 = float(uint(_1816));
    int _1838 = ~_1792;
    int _1840 = _1838 + 1;
    int _1842 = _1840 + 1;
    int _1844 = abs(_1752);
    bool _1846 = _874 >= 0.0;
    bool _1848 = isnan(_874);
    bool _1850 = _1846 || _1848;
    bool _1852 = isnan(0.0);
    bool _1854 = _1850 || _1852;
    int _1856 = _1842 * as_type<int>(_1700);
    int _1858 = _1856 + _1834;
    float _1860 = as_type<float>(_1830) * _1836;
    int _1862 = ~_1844;
    int _1864 = _1862 + 1;
    int _1866 = _1864 + 1;
    float _1868 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1870 = _459 + _1868;
    float _1872 = fma(_1322, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1376);
    float _1874 = fma(_1322, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1374);
    float _1876 = fma(_1322, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1378);
    float _1878 = trunc(_1860);
    float _1880 = precise::max(_1878, 0.0);
    uint _1882 = uint(_1880);
    int _1884 = _1866 * as_type<int>(_1708);
    int _1886 = _1884 + _1858;
    float _1888 = fma(_1380, _1870, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _1890 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1892 = _459 + _1890;
    int _1894 = ~_616;
    int _1896 = _1894 + 1;
    int _1898 = ~_1828;
    int _1900 = _1898 + 1;
    int _1902 = _1900 + 1;
    float _1904 = fma(_1448, _1892, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    int _1906 = abs(_616);
    float _1908 = float(uint(_1826));
    int _1910 = _1886 * _1902;
    int _1912 = _1854 ? 0 : 1;
    bool _1914 = _874 > 0.0;
    int _1916 = _1896 * int(_1882);
    int _1918 = _1916 + _1816;
    float _1920 = float(uint(_1906));
    float _1922 = 1.0 / _1908;
    int _1924 = abs(_1826);
    float _1926 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1928 = _459 + _1926;
    float _1930 = float(uint(_1918));
    int _1932 = _1522 * _1828;
    int _1934 = _1932 + _1910;
    float _1936 = fma(_1418, _1928, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    bool _1938 = _459 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _1940 = isnan(_459);
    bool _1942 = _1938 || _1940;
    bool _1944 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _1946 = _1942 || _1944;
    float _1948 = float(_1946);
    float _1950 = 1.0 / _1920;
    bool _1952 = _459 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1954 = isnan(_459);
    bool _1956 = _1952 || _1954;
    bool _1958 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1960 = _1956 || _1958;
    float _1962 = float(_1960);
    float _1964 = as_type<float>(_1830) * _1930;
    float _1966 = float(uint(_1924));
    int _1968 = abs(_1816);
    float _1970 = -_1962;
    float _1972 = _1970 + 1.0;
    float _1974 = float(uint(_1934));
    float _1976 = trunc(_1964);
    float _1978 = precise::max(_1976, 0.0);
    uint _1980 = uint(_1978);
    int _1982 = as_type<int>(_1922) + (-2);
    float _1984 = _1948 * _1972;
    int _1986 = abs(_1934);
    float _1988 = as_type<float>(_1982) * _1974;
    float _1990 = float(uint(_1968));
    float _1992 = 1.0 / _1966;
    int _1994 = as_type<int>(_1950) + (-2);
    float _1996 = -_1948;
    float _1998 = _1996 + 1.0;
    bool _2000 = _459 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _2002 = isnan(_459);
    bool _2004 = _2000 || _2002;
    bool _2006 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _2008 = _2004 || _2006;
    float _2010 = float(_2008);
    bool _2012 = _459 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _2014 = isnan(_459);
    bool _2016 = _2012 || _2014;
    bool _2018 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _2020 = _2016 || _2018;
    float _2022 = float(_2020);
    float _2024 = as_type<float>(_1994) * _1990;
    float _2026 = float(uint(_1986));
    float _2028 = trunc(_1988);
    float _2030 = precise::max(_2028, 0.0);
    uint _2032 = uint(_2030);
    float _2034 = _2010 * _1998;
    bool _2036 = _459 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _2038 = isnan(_459);
    bool _2040 = _2036 || _2038;
    bool _2042 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _2044 = _2040 || _2042;
    float _2046 = float(_2044);
    float _2048 = -_2010;
    float _2050 = _2048 + 1.0;
    float _2052 = -_2022;
    float _2054 = _2052 + 1.0;
    int _2056 = ~_1826;
    int _2058 = _2056 + 1;
    float _2060 = _2022 * _2050;
    int _2062 = as_type<int>(_1992) + (-2);
    float _2064 = trunc(_2024);
    float _2066 = precise::max(_2064, 0.0);
    uint _2068 = uint(_2066);
    float _2070 = _2046 * _2054;
    int _2072 = ~_1906;
    int _2074 = _2072 + 1;
    float _2076 = -_2046;
    float _2078 = _2076 + 1.0;
    float _2080 = as_type<float>(_2062) * _2026;
    bool _2082 = _459 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _2084 = isnan(_459);
    bool _2086 = _2082 || _2084;
    bool _2088 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _2090 = _2086 || _2088;
    float _2092 = float(_2090);
    int _2094 = _2058 * int(_2032);
    int _2096 = _2094 + _1934;
    float _2098 = trunc(_2080);
    float _2100 = precise::max(_2098, 0.0);
    uint _2102 = uint(_2100);
    int _2104 = ~_1924;
    int _2106 = _2104 + 1;
    float _2108 = -_2092;
    float _2110 = _2108 + 1.0;
    float _2112 = _2092 * _2078;
    float _2114 = float(uint(_2096));
    float _2116 = _503 * _2110;
    float _2118 = -_503;
    float _2120 = _2118 + 1.0;
    int _2122 = _2074 * int(_2068);
    int _2124 = _2122 + _1968;
    float _2126 = as_type<float>(_1982) * _2114;
    bool _2128 = _459 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _2130 = isnan(_459);
    bool _2132 = _2128 || _2130;
    bool _2134 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _2136 = _2132 || _2134;
    float _2138 = float(_2136);
    float _2140 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2142 = _459 + _2140;
    bool _2144 = !_1308;
    float _2146 = _2144 ? _175 : as_type<float>(_1618);
    float _2148 = float(uint(_2124));
    float _2150 = trunc(_2126);
    float _2152 = precise::max(_2150, 0.0);
    uint _2154 = uint(_2152);
    int _2156 = _2106 * int(_2102);
    int _2158 = _2156 + _1986;
    float _2160 = fma(_1450, _2142, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _2162 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2164 = _459 + _2162;
    float _2166 = as_type<float>(_1994) * _2148;
    float _2168 = _2138 * _2120;
    float _2170 = float(uint(_2158));
    float _2172 = -_2138;
    float _2174 = _2172 + 1.0;
    int _2176 = ~_616;
    int _2178 = _2176 + 1;
    float _2180 = _1888 * _2168;
    int _2182 = int(_1882) + int(_1980);
    float _2184 = as_type<float>(_2062) * _2170;
    float _2186 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2188 = _459 + _2186;
    float _2190 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2192 = _459 + _2190;
    float _2194 = trunc(_2166);
    float _2196 = precise::max(_2194, 0.0);
    uint _2198 = uint(_2196);
    float _2200 = fma(_2174, (*spvDescriptorSet0.vp_c9)._m0[159].x, _2180);
    int _2202 = int(_2032) + int(_2154);
    float _2204 = fma(_1452, _2192, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    int _2206 = _2178 * _2182;
    int _2208 = _2206 + _1816;
    int _2210 = ~_1826;
    int _2212 = _2210 + 1;
    float _2214 = fma(_1904, _2116, _2200);
    int _2216 = ~_1912;
    int _2218 = _2216 + 1;
    int _2220 = _2218 + 1;
    float _2222 = trunc(_2184);
    float _2224 = precise::max(_2222, 0.0);
    uint _2226 = uint(_2224);
    int _2228 = _2220;
    if (!_1914)
    {
        int _2230 = ~_1912;
        int _2232 = _2230 + 1;
        _2228 = _2232;
    }
    int _2234 = _2228;
    int _2236 = _2212 * _2202;
    int _2238 = _2236 + _1934;
    bool _2240 = uint(_2208) >= uint(_616);
    float _2242 = fma(_1508, _2188, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _2244 = fma(_1936, _2112, _2214);
    bool _2246 = !_2240;
    int _2248 = _2246 ? 0 : (-1);
    float _2250 = fma(_1470, _2164, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    int _2252 = int(_2068) + int(_2198);
    float _2254 = fma(_2160, _2070, _2244);
    int _2256 = ~_1924;
    int _2258 = _2256 + 1;
    float _2260 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _2262 = uint(_2238) >= uint(_1826);
    float _2264 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _2266 = ~_2182;
    int _2268 = _2266 + _2248;
    int _2270 = _2268 + 1;
    float _2272 = fma(_2250, _2060, _2254);
    int _2274 = int(_2102) + int(_2226);
    int _2276 = ~_1906;
    int _2278 = _2276 + 1;
    float _2280 = fma(_2242, _2034, _2272);
    bool _2282 = !_2262;
    int _2284 = _2282 ? 0 : (-1);
    int _2286 = _2258 * _2274;
    int _2288 = _2286 + _1986;
    int _2290 = _2278 * _2252;
    int _2292 = _2290 + _1968;
    int _2294 = ~_2202;
    int _2296 = _2294 + _2284;
    int _2298 = _2296 + 1;
    float _2300 = fma(_2204, _1984, _2280);
    bool _2302 = !_1768;
    int _2304 = _2302 ? 0 : 1;
    float _2306 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    bool _2308 = uint(_2292) >= uint(_1906);
    float _2310 = fma(_1680, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2264);
    float _2312 = fma(_1652, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2306);
    bool _2314 = !_2308;
    int _2316 = _2314 ? 0 : (-1);
    int _2318 = _1826 * _2298;
    int _2320 = _2318 + _1934;
    bool _2322 = uint(_2288) >= uint(_1924);
    int _2324 = _616 * _2270;
    int _2326 = _2324 + _1816;
    float _2328 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    int _2330 = ~_2316;
    int _2332 = _2252 + _2330;
    int _2334 = _2332 + 1;
    float _2336 = _1872 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _2338 = !_2322;
    int _2340 = _2338 ? 0 : (-1);
    float _2342 = -_127;
    float _2344 = fma(_2342, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1348);
    bool _2346 = _616 == 0;
    float _2348 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2350 = _2336 + _2348;
    int _2352 = _1934 ^ _1826;
    float _2354 = _2260 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _2356 = !_2346;
    int _2358 = _2356 ? _2326 : (-1);
    float _2360 = _1876 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _2362 = _1826 == 0;
    float _2364 = _2350 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    uint _2366 = uint(int(uint(_2352) >> uint(31)));
    float _2368 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2312);
    bool _2370 = !_2362;
    int _2372 = _2370 ? _2320 : (-1);
    float _2374 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2310);
    bool _2376 = _616 == 0;
    float _2378 = fma(_1962, (*spvDescriptorSet0.vp_c9)._m0[166].x, _2300);
    int _2380 = _1816 ^ _616;
    float _2382 = -_2328;
    float _2384 = fma(_1682, 2.0, _2382);
    float _2386 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    uint _2388 = uint(int(uint(_2380) >> uint(31)));
    float _2390 = -_127;
    float _2392 = fma(_2390, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2384);
    int _2394 = abs(_2304);
    float _2396 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _2398 = ~int(_2388);
    int _2400 = _2398 + 1;
    out.m_60.x = _2378;
    int _2402 = ~_2340;
    int _2404 = _2274 + _2402;
    int _2406 = _2404 + 1;
    float _2408 = fma(_1688, -2.0, _2396);
    int _2410 = _2334 ^ _2400;
    float _2412 = _1874 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _2414 = ~int(_2366);
    int _2416 = _2414 + 1;
    int _2418 = ~_2400;
    int _2420 = _2418 + _2410;
    int _2422 = _2420 + 1;
    float _2424 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2426 = _2412 + _2424;
    float _2428 = float(_1812);
    float _2430 = _2386 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    bool _2432 = !_2376;
    int _2434 = _2432 ? _2422 : (-1);
    float _2436 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _2438 = _1826 == 0;
    float _2440 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2442 = _2360 + _2440;
    float _2444 = float(_2394);
    float _2446 = float(_2358);
    int _2448 = _2406 ^ _2416;
    float _2450 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2452 = float(_2372);
    float _2454 = _2444 * _2428;
    float _2456 = fma(_2426, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2364);
    int _2458 = ~_2416;
    int _2460 = _2458 + _2448;
    int _2462 = _2460 + 1;
    float _2464 = fma(_2354, _2446, _2344);
    float _2466 = fma(_2430, _2452, _2392);
    float _2468 = _1424 + 0.5;
    bool _2470 = !_2438;
    int _2472 = _2470 ? _2462 : (-1);
    float _2474 = _2436 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2476 = float(_2434);
    float _2478 = fma(_2354, _2468, _2464);
    float _2480 = float(_2472);
    float _2482 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2408);
    float _2484 = _1480 + 0.5;
    float _2486 = -_1488;
    float _2488 = fma(_2474, _2476, _2486);
    float _2490 = _2450 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2492 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _2494 = log2(_2492);
    float _2496 = fma(_2430, _2484, _2466);
    float _2498 = -_2368;
    float _2500 = _2498 + 1.0;
    float _2502 = -_2482;
    float _2504 = fma(_2490, _2480, _2502);
    float _2506 = _1518 + (-0.5);
    float _2508 = _2146 + (-0.5);
    float _2510 = fma(_2442, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2456);
    float _2512 = -_2500;
    float _2514 = fma(_1480, _2512, _2496);
    float _2516 = -_2474;
    float _2518 = fma(_2516, _2506, _2488);
    float _2520 = -_2490;
    float _2522 = fma(_2520, _2508, _2504);
    bool _2524 = !_1764;
    int _2526 = _2524 ? 0 : 1;
    float _2528 = -_1712;
    float _2530 = _2528 + 1.0;
    bool _2532 = _2510 >= 0.0;
    float _2534 = -_666;
    float _2536 = fma(_1424, _2534, _2478);
    int _2538 = abs(_2526);
    float _2540 = _2350 * _2350;
    float _2542 = float(_2234);
    float _2544 = _2494 * _127;
    float _2546 = float(_2538);
    float _2548 = fma(_2426, _2426, _2540);
    float _2550 = fma(_1518, _2530, _2518);
    float _2552 = -_2374;
    float _2554 = _2552 + 1.0;
    float _2556 = _2546 * _2542;
    float _2558 = fma(_2442, _2442, _2548);
    float _2560 = in.m_62.x;
    float _2562 = in.m_62.y;
    float _2564 = in.m_62.z;
    float _2566 = fma(_2146, _2554, _2522);
    float _2568 = exp2(_2544);
    float _2570 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _2572 = 1.0 + _2570;
    float _2574 = _2540;
    if (_2532)
    {
        _2574 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2576 = _2574;
    out.m_64.x = _2536;
    out.m_64.y = _2550;
    out.m_64.z = _2514;
    out.m_64.w = _2566;
    bool _2578 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2580 = isnan(0.0);
    bool _2582 = _2578 || _2580;
    bool _2584 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2586 = _2582 || _2584;
    float _2588 = _1512 * 1.57079637050628662109375;
    int _2590 = as_type<int>(_2576);
    if (_2532)
    {
        float _2592 = _2576 * 5.0;
        _2590 = as_type<int>(_2592);
    }
    int _2594 = _2590;
    float _2596 = rsqrt(_2558);
    if (_2532)
    {
        out.m_47.x = 0.0;
    }
    bool _2598 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2600 = isnan(1.0);
    bool _2602 = _2598 || _2600;
    bool _2604 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2606 = _2602 || _2604;
    if (_2532)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7688 = as_type<float>(_2594);
        out.gl_Position.z = _7688;
    }
    float _2608 = 1.0 / _2572;
    float _2610 = -_2568;
    float _2612 = _2610 + 1.0;
    float _2614 = _2350 * _2596;
    bool _2616 = !_1772;
    int _2618 = _2616 ? 0 : 1;
    float _2620 = _2426 * _2596;
    if (_2532)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2622 = -_2614;
    float _2624 = fma(_2622, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2336);
    float _2626 = _1588 * 0.15915493667125701904296875;
    float _2628 = _2442 * _2596;
    float _2630 = -_2620;
    float _2632 = fma(_2630, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2412);
    float _2634 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2636 = _2624 + _2634;
    float _2638 = _2556 * (-2.0);
    float _2640 = -_2628;
    float _2642 = fma(_2640, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2360);
    float _2644 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2646 = _2632 + _2644;
    float _2648 = _2636 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2650 = _2586 ? _2612 : 0.0;
    float _2652 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2654 = _2642 + _2652;
    float _2656 = _2454 * (-2.0);
    float _2658 = fma(_2646, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2648);
    float _2660 = _2588 * 0.15915493667125701904296875;
    float _2662 = fma(_1502, _2638, _1502);
    float _2664 = fma(_2638, _2560, _2560);
    float _2666 = fma(_2654, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2658);
    float _2668 = _2660;
    float _2670 = _2624;
    if (_2606)
    {
        float _2672 = _2650 * _2608;
        _145 = _2672;
    }
    float _2674 = _145;
    float _2676 = _1584 * 1.57079637050628662109375;
    float _2678 = fma(_1462, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2664);
    float _2680 = fma(_2656, _2562, _2562);
    bool _2682 = _2666 >= 0.0;
    float _2684 = _2676 * 0.15915493667125701904296875;
    float _2686 = fma(_2662, _2674, _2678);
    int _2688 = _1632 ? 0 : 1;
    float _2690 = fma(_1554, _2656, _1554);
    float _2692 = fma(_1592, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2680);
    int _2694 = abs(_2618);
    float _2696 = _2686 * 0.15915493667125701904296875;
    int _2698 = ~_2688;
    int _2700 = _2698 + 1;
    int _2702 = _2700 + 1;
    float _2704 = _2660 * 6.283185482025146484375;
    float _2706 = sin(_2704);
    int _2708 = _2702;
    if (!_1622)
    {
        int _2710 = ~_2688;
        int _2712 = _2710 + 1;
        _2708 = _2712;
    }
    int _2714 = _2708;
    float _2716 = fma(_2690, _2674, _2692);
    float _2718 = _1446 + (-1.0);
    if (_2682)
    {
        out.m_47.x = 0.0;
    }
    float _2720 = _2626 * 6.283185482025146484375;
    float _2722 = sin(_2720);
    if (_2682)
    {
        _2668 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2724 = _2668;
    float _2726 = fma(_2718, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2728 = float(_2714);
    float _2730 = float(_2694);
    int _2732 = as_type<int>(_2724);
    if (_2682)
    {
        float _2734 = _2724 * 5.0;
        _2732 = as_type<int>(_2734);
    }
    int _2736 = _2732;
    float _2738 = _2684 * 6.283185482025146484375;
    float _2740 = sin(_2738);
    if (_2682)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7902 = as_type<float>(_2736);
        out.gl_Position.z = _7902;
    }
    float _2742 = _2696 * 6.283185482025146484375;
    float _2744 = sin(_2742);
    float _2746 = _2696 * 6.283185482025146484375;
    float _2748 = cos(_2746);
    if (_2682)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2750 = -_2336;
    float _2752 = _2750 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2754 = _2730 * _2728;
    float _2756 = _2716 * 0.15915493667125701904296875;
    float _2758 = -_2412;
    float _2760 = _2758 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2762 = _2752 * _2752;
    float _2764 = _2754 * (-2.0);
    float _2766 = -_2360;
    float _2768 = _2766 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2770 = _159 + (*spvDescriptorSet0.vp_c9)._m0[191].z;
    float _2772 = fma(_2760, _2760, _2762);
    float _2774 = fma(_2764, _2564, _2564);
    float _2776 = in.m_66.x;
    float _2778 = in.m_66.y;
    float _2780 = fma(_2726, _2764, _2726);
    float _2782 = fma(_2768, _2768, _2772);
    float _2784 = fma(_1482, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2774);
    float _2786 = -_2770;
    float _2788 = _2786 + 1.0;
    float _2790 = precise::clamp(_2788, 0.0, 1.0);
    float _2792 = rsqrt(_2782);
    float _2794 = fma(_2780, _2674, _2784);
    float _2796 = -_2614;
    float _2798 = fma(_2796, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2350);
    float _2800 = fma(_2790, -2.0, 3.0);
    float _2802 = _2790 * _2790;
    float _2804 = -_2620;
    float _2806 = fma(_2804, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2426);
    float _2808 = _2798 * _2798;
    float _2810 = -_2628;
    float _2812 = fma(_2810, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2442);
    float _2814 = _2800 * _2802;
    float _2816 = precise::clamp(_2814, 0.0, 1.0);
    float _2818 = _2794 * 0.15915493667125701904296875;
    float _2820 = fma(_2806, _2806, _2808);
    float _2822 = _2756 * 6.283185482025146484375;
    float _2824 = sin(_2822);
    float _2826 = _2816 * (*spvDescriptorSet0.vp_c9)._m0[191].y;
    float _2828 = fma(_2812, _2812, _2820);
    bool _2830 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2832 = isnan(0.5);
    bool _2834 = _2830 || _2832;
    bool _2836 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2838 = _2834 || _2836;
    float _2840 = _2760 * _2792;
    float _2842 = fma(_2740, _2826, _175);
    float _2844 = _431 * _2776;
    float _2846 = _2768 * _2792;
    float _2848 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _2850 = _2840 * _2848;
    float _2852 = fma(_2706, _2826, _171);
    float _2854 = _2722 * _2826;
    float _2856 = _2752 * _2792;
    float _2858 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2860 = _2846 * _2858;
    float _2862 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _2864 = -_2850;
    float _2866 = fma(_2846, _2862, _2864);
    float _2868 = _2756 * 6.283185482025146484375;
    float _2870 = cos(_2868);
    float _2872 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _2874 = _2856 * _2872;
    float _2876 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _2878 = -_2860;
    float _2880 = fma(_2856, _2876, _2878);
    float _2882 = _2866 * _2866;
    float _2884 = _433 * _2778;
    float _2886 = _2744 * _2824;
    float _2888 = fma(_2880, _2880, _2882);
    float _2890 = sqrt(_2828);
    float _2892 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2894 = -_2874;
    float _2896 = fma(_2840, _2892, _2894);
    float _2898 = _2844 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2900 = fma(_2896, _2896, _2888);
    float _2902 = _2884 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2904 = _2748 * _2824;
    float _2906 = _2818 * 6.283185482025146484375;
    float _2908 = sin(_2906);
    float _2910 = _2748 * _2870;
    float _2912 = _2744 * _2870;
    float _2914 = _2818 * 6.283185482025146484375;
    float _2916 = cos(_2914);
    float _2918 = _2596 * _2890;
    float _2920 = _2918 * _2902;
    float _2922 = _2918 * _2898;
    float _2924 = rsqrt(_2900);
    float _2926 = fma(_2908, _2910, _2886);
    float _2928 = fma(_2908, _2886, _2910);
    float _2930 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _2842);
    float _2932 = _2748 * _2916;
    float _2934 = _2870 * _2916;
    float _2936 = _2744 * _2916;
    float _2938 = _2824 * _2916;
    float _2940 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _2852);
    float _2942 = _2930 * _2920;
    float _2944 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _2854);
    float _2946 = -_2904;
    float _2948 = fma(_2908, _2912, _2946);
    float _2950 = _2940 * _2922;
    float _2952 = _2932 * _2942;
    float _2954 = _2880 * _2924;
    float _2956 = _2866 * _2924;
    float _2958 = _2896 * _2924;
    float _2960 = -_2942;
    float _2962 = _2908 * _2960;
    float _2964 = -_2912;
    float _2966 = fma(_2908, _2904, _2964);
    float _2968 = _2918 * _2944;
    float _2970 = fma(_2926, _2950, _2952);
    float _2972 = _2856 * _2954;
    float _2974 = _2936 * _2942;
    float _2976 = fma(_2934, _2950, _2962);
    float _2978 = fma(_2966, _2968, _2970);
    float _2980 = _2846 * _2956;
    float _2982 = -_2972;
    float _2984 = fma(_2840, _2956, _2982);
    float _2986 = fma(_2948, _2950, _2974);
    float _2988 = fma(_2938, _2968, _2976);
    float _2990 = -_2980;
    float _2992 = fma(_2856, _2958, _2990);
    float _2994 = _2984 * _2978;
    float _2996 = fma(_2928, _2968, _2986);
    float _2998 = _2992 * _2978;
    float _3000 = fma(_2958, _2988, _2994);
    float _3002 = fma(_2954, _2988, _2998);
    float _3004 = fma(_2846, _2996, _3000);
    float _3006 = fma(_2840, _2996, _3002);
    float _3008 = _2360 + _3004;
    float _3010 = _2412 + _3006;
    float _3012 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _3014 = _3008 + _3012;
    float _3016 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _3018 = _3010 + _3016;
    float _3020 = _3014 * _3014;
    float _3022 = fma(_3018, _3018, _3020);
    float _3024 = _2840 * _2958;
    float _3026 = sqrt(_3022);
    float _3028 = -_3024;
    float _3030 = fma(_2846, _2954, _3028);
    float _3032 = _3030 * _2978;
    float _3034 = fma(_2956, _2988, _3032);
    float _3036 = fma(_2856, _2996, _3034);
    bool _3038 = _3026 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3040 = _2336 + _3036;
    float _3042 = _3032;
    float _3044 = _3010;
    float _3046 = _3008;
    if (!_3038)
    {
        _3042 = _3040;
    }
    float _3048 = _3042;
    bool _3050 = !_3038;
    float _3052 = _3048;
    if (!_3050)
    {
        float _3054 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3056 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _3058 = _3026 + _3056;
        float _3060 = rsqrt(_3022);
        float _3062 = _3058 * _3054;
        float _3064 = _3040 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3066 = _3062 * 0.15915493667125701904296875;
        float _3068 = _3066 * 6.283185482025146484375;
        float _3070 = sin(_3068);
        float _3072 = _3066 * 6.283185482025146484375;
        float _3074 = cos(_3072);
        float _3076 = fma(_3070, _3064, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _3078 = _3060 * _3076;
        float _3080 = _3074 + (-1.0);
        float _3082 = fma(_3018, _3078, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _3084 = fma(_3014, _3078, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _3086 = _3080 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3088 = fma(_3040, _3074, _3086);
        _3044 = _3082;
        _3052 = _3088;
        _3046 = _3084;
    }
    float _3090 = _3044;
    float _3092 = _3052;
    float _3094 = _3046;
    float _3096 = -_2620;
    float _3098 = fma(_3096, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3090);
    float _3100 = -_2614;
    float _3102 = fma(_3100, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3092);
    float _3104 = -_2628;
    float _3106 = fma(_3104, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3094);
    float _3108 = _3102;
    float _3110 = _3098;
    float _3112 = _3106;
    float _3114 = _3092;
    if (!_2838)
    {
        float _3116 = _2636 * _2636;
        float _3118 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _3120 = -_2360;
        float _3122 = _3120 + _3094;
        float _3124 = fma(_2646, _2646, _3116);
        float _3126 = fma(_2654, _2654, _3124);
        float _3128 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3130 = sqrt(_3126);
        float _3132 = 1.0 / _2918;
        float _3134 = _3128 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3136 = precise::min(_3130, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _3138 = _3136 * _3118;
        float _3140 = _3138 * _3132;
        float _3142 = -_2412;
        float _3144 = _3142 + _3090;
        float _3146 = -_2336;
        float _3148 = _3146 + _3092;
        float _3150 = _3134 * _3140;
        float _3152 = _3122 * _3140;
        float _3154 = fma(_3144, _3150, _2632);
        float _3156 = fma(_3148, _3150, _2624);
        float _3158 = fma(_3134, _3152, _2642);
        _3108 = _3156;
        _3110 = _3154;
        _3112 = _3158;
    }
    float _3160 = _3108;
    float _3162 = _3110;
    float _3164 = _3112;
    float _3166 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3168 = _3160 + _3166;
    float _3170 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3172 = _3162 + _3170;
    float _3174 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3176 = _3164 + _3174;
    float _3178 = _3168 * _3168;
    float _3180 = fma(_3172, _3172, _3178);
    float _3182 = fma(_3176, _3176, _3180);
    float _3184 = rsqrt(_3182);
    float _3186 = sqrt(_3182);
    float _3188 = _3184 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3190 = _3172 * _3188;
    float _3192 = _3176 * _3188;
    float _3194 = _3190 * _3190;
    float _3196 = _3192 * _3192;
    float _3198 = _3194 + _3196;
    float _3200 = sqrt(_3198);
    bool _3202 = _3200 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3204 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3206 = _3200 + _3204;
    float _3208 = _3184;
    float _3210 = _3206;
    float _3212 = _3168;
    if (_3202)
    {
        float _3214 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3208 = _3214;
    }
    float _3216 = _3208;
    float _3218 = _3216;
    if (_3202)
    {
        float _3220 = _3206 * _3216;
        _3210 = _3220;
    }
    float _3222 = _3210;
    if (_3202)
    {
        float _3224 = rsqrt(_3198);
        _3218 = _3224;
    }
    float _3226 = _3218;
    float _3228 = _3226;
    if (_3202)
    {
        float _3230 = _3222 * 0.15915493667125701904296875;
        _3114 = _3230;
    }
    float _3232 = _3114;
    float _3234 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3236 = _3176;
    float _3238 = _3232;
    if (_3202)
    {
        float _3240 = _3232 * 6.283185482025146484375;
        float _3242 = sin(_3240);
        _3236 = _3242;
    }
    float _3244 = _3236;
    float _3246 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _3248 = precise::max(0.0, _3234);
    float _3250 = _2918;
    float _3252 = _3248;
    if (_3202)
    {
        float _3254 = _3232 * 6.283185482025146484375;
        float _3256 = cos(_3254);
        _3250 = _3256;
    }
    float _3258 = _3250;
    float _3260 = -_3188;
    float _3262 = -_3248;
    float _3264 = fma(_3168, _3260, _3262);
    if (_3202)
    {
        float _3266 = _3264 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3212 = _3266;
    }
    float _3268 = _3212;
    float _3270 = _3244;
    float _3272 = _3268;
    if (_3202)
    {
        float _3274 = fma(_3244, _3268, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3270 = _3274;
    }
    float _3276 = _3270;
    float _3278 = _3276;
    if (!_3202)
    {
        _3272 = _3264;
    }
    float _3280 = _3272;
    float _3282 = _3280;
    if (_3202)
    {
        float _3284 = _3226 * _3276;
        _2670 = _3284;
    }
    float _3286 = _2670;
    if (!_3202)
    {
        _3228 = _3190;
    }
    float _3288 = _3228;
    float _3290 = _3288;
    float _3292 = _3258;
    if (_3202)
    {
        float _3294 = _3258 + (-1.0);
        _3252 = _3294;
    }
    float _3296 = _3252;
    float _3298 = _3296;
    if (_3202)
    {
        float _3300 = _3190 * _3286;
        _3290 = _3300;
    }
    float _3302 = _3290;
    if (!_3202)
    {
        _3278 = _3194;
    }
    float _3304 = _3278;
    float _3306 = _3160 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3308 = _3304;
    if (_3202)
    {
        float _3310 = _3296 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3238 = _3310;
    }
    float _3312 = _3238;
    if (!_3202)
    {
        _3298 = _3192;
    }
    float _3314 = _3298;
    float _3316 = _3314;
    if (_3202)
    {
        float _3318 = _3192 * _3286;
        _3316 = _3318;
    }
    float _3320 = _3316;
    if (_3202)
    {
        float _3322 = _3302 * _3302;
        _3308 = _3322;
    }
    float _3324 = _3308;
    if (_3202)
    {
        float _3326 = fma(_3264, _3258, _3312);
        _3282 = _3326;
    }
    float _3328 = _3282;
    if (!_3202)
    {
        _3292 = _3196;
    }
    float _3330 = _3292;
    float _3332 = _3330;
    if (_3202)
    {
        float _3334 = _3320 * _3320;
        _3332 = _3334;
    }
    float _3336 = _3332;
    float _3338 = _3160 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3340 = fma(_3328, _3328, _3324);
    float _3342 = fma(_3162, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3306);
    float _3344 = fma(_3162, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3338);
    float _3346 = _3340 + _3336;
    float _3348 = _3160 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3350 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3352 = fma(_3186, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3350);
    float _3354 = precise::clamp(_3352, 0.0, 1.0);
    float _3356 = fma(_3164, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3344);
    float _3358 = _3160 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3360 = fma(_3162, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3348);
    float _3362 = rsqrt(_3346);
    float _3364 = -_3354;
    float _3366 = _3364 + 1.0;
    float _3368 = fma(_3162, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3358);
    float _3370 = fma(_3164, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3360);
    float _3372 = _3356 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3374 = fma(_3164, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3368);
    float _3376 = _3370 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3378 = abs(_3366);
    float _3380 = log2(_3378);
    float _3382 = _3372 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3384 = _3374 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3386 = _3376 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3388 = -_3382;
    float _3390 = fma(_3388, _3246, 1.0);
    float _3392 = fma(_3164, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3342);
    float _3394 = fma(_3384, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3386);
    float _3396 = _3362 * _3302;
    float _3398 = _3362 * _3328;
    float _3400 = _3362 * _3320;
    float _3402 = _3392 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3404 = _3396 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3406 = fma(_3372, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3394);
    float _3408 = log2(_3390);
    float _3410 = _3376 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3412 = _3380 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3414 = -_3404;
    float _3416 = fma(_3398, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3414);
    float _3418 = fma(_3402, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3406);
    float _3420 = fma(_3384, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3410);
    float _3422 = -_3400;
    float _3424 = fma(_3422, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3416);
    float _3426 = exp2(_3412);
    float _3428 = _3376 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3430 = _3398 + 1.0;
    float _3432 = fma(_3424, -0.5, 0.5);
    float _3434 = fma(_3424, 0.5, 0.5);
    float _3436 = fma(_3384, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3428);
    float _3438 = fma(_3372, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3420);
    float _3440 = 1.0 / _3418;
    float _3442 = fma(_3372, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3436);
    float _3444 = fma(_3434, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3446 = fma(_3434, _3444, -0.212114393711090087890625);
    float _3448 = sqrt(_3432);
    float _3450 = -_3398;
    float _3452 = fma(_3426, _3430, _3450);
    float _3454 = fma(_3402, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3442);
    float _3456 = fma(_3402, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3438);
    float _3458 = fma(_3434, _3446, 1.570728778839111328125);
    float _3460 = fma(_3452, 0.5, 0.5);
    float _3462 = _3454 * _3440;
    float _3464 = _3408 * 0.693147182464599609375;
    float _3466 = _3456 * _3440;
    float _3468 = fma(_3462, 0.5, 0.5);
    float _3470 = _3464 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3472 = fma(_3466, -0.5, 0.5);
    float _3474 = _3448 * 0.636619746685028076171875;
    float3 _9073 = float3(_3468, _3472, _3470);
    float _3476 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_9073, float3(0.0), isnan(_9073)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_9073, float3(0.0), isnan(_9073)), level(0.0)).x;
    float _3478 = -_3458;
    float _3480 = fma(_3474, _3478, 1.0);
    float3 _9089 = float3(_3468, _3472, _3470);
    float4 _3483 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_9089, float3(0.0), isnan(_9089)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_9089, float3(0.0), isnan(_9089)), level(0.0)).xyzw;
    float _3485 = _3483.x;
    float _3487 = _3483.y;
    float _3489 = _3483.z;
    float _3491 = _3483.w;
    float2 _9106 = float2(_3480, _3460);
    float3 _3495 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_9106, float2(0.0), isnan(_9106)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_9106, float2(0.0), isnan(_9106)), level(0.0)).xyz;
    float _3497 = _3495.x;
    float _3499 = _3495.y;
    float _3501 = _3495.z;
    float _3503 = fma(_2854, (*spvDescriptorSet0.vp_c9)._m0[17].y, 1.0);
    float _3505 = _2842 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3507 = _3380 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3509 = _2926 * _2992;
    float _3511 = _2926 * _3030;
    float _3513 = _2926 * _2984;
    float _3515 = _2932 * _2992;
    float _3517 = _2932 * _3030;
    float _3519 = _3505 * _3505;
    float _3521 = exp2(_3507);
    float _3523 = _2932 * _2984;
    float _3525 = _2966 * _2992;
    float _3527 = fma(_3503, _3503, _3519);
    float _3529 = _2966 * _3030;
    float _3531 = _2966 * _2984;
    float _3533 = fma(_2934, _2954, _3509);
    float _3535 = fma(_2934, _2956, _3511);
    float _3537 = fma(_2934, _2958, _3513);
    float _3539 = rsqrt(_3527);
    float _3541 = -_2908;
    float _3543 = fma(_3541, _2954, _3515);
    float _3545 = -_2908;
    float _3547 = fma(_3545, _2956, _3517);
    float _3549 = -_2908;
    float _3551 = fma(_3549, _2958, _3523);
    float _3553 = fma(_2938, _2954, _3525);
    float _3555 = fma(_2938, _2956, _3529);
    float _3557 = fma(_2938, _2958, _3531);
    float _3559 = _3376 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3561 = fma(_2936, _2840, _3543);
    float _3563 = fma(_2936, _2856, _3547);
    float _3565 = fma(_2928, _2840, _3553);
    float _3567 = fma(_2948, _2840, _3533);
    float _3569 = fma(_2948, _2856, _3535);
    float _3571 = fma(_2948, _2846, _3537);
    float _3573 = fma(_3384, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3559);
    float _3575 = _2852 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3577 = _3505 * _3561;
    float _3579 = fma(_2928, _2856, _3555);
    float _3581 = fma(_3372, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3573);
    float _3583 = -_3521;
    float _3585 = _3583 + 1.0;
    float _3587 = fma(_3575, _3567, _3577);
    float _3589 = fma(_2928, _2846, _3557);
    float _3591 = _3505 * _3563;
    float _3593 = fma(_2936, _2846, _3551);
    float _3595 = _3505 * _3539;
    float _3597 = fma(_3402, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3581);
    float _3599 = _3585 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_68.x = _3567;
    out.m_68.y = _3569;
    out.m_68.z = _3571;
    float _3601 = _3503 * _3539;
    float _3603 = fma(_3575, _3569, _3591);
    float _3605 = -_3565;
    float _3607 = _3595 * _3605;
    float _3609 = -_3579;
    float _3611 = _3595 * _3609;
    out.m_70.x = _3162;
    out.m_70.y = _3160;
    out.m_70.z = _3164;
    float _3613 = fma(_3601, _3561, _3607);
    float _3615 = fma(_3601, _3563, _3611);
    bool _3617 = _3186 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3619 = isnan(_3186);
    bool _3621 = _3617 || _3619;
    bool _3623 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3625 = _3621 || _3623;
    out.gl_Position.x = _3454;
    out.gl_Position.y = _3456;
    out.gl_Position.z = _3597;
    out.gl_Position.w = _3418;
    float _3627 = -_3589;
    float _3629 = _3595 * _3627;
    float _3631 = _3505 * _3593;
    float _3633 = _3597 + _3418;
    float _3635 = fma(_3601, _3593, _3629);
    float _3637 = fma(_3575, _3571, _3631);
    float _3639 = _3633 * 0.5;
    float _3641 = fma(_3503, _3565, _3587);
    float _3643 = -_3599;
    float _3645 = _3643 + 1.0;
    out.m_72.x = _3613;
    out.m_72.y = _3615;
    out.m_72.z = _3635;
    float _3647 = fma(_3503, _3579, _3603);
    float _3649 = fma(_3503, _3589, _3637);
    out.m_74.z = _3639;
    out.m_74.w = _3418;
    float _3651 = _3418;
    float _3653 = _3597;
    float _3655 = _3456;
    float _3657 = _3454;
    if (!_3625)
    {
        _3651 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3659 = _3651;
    float _3661 = _3659;
    float _3663 = _3659;
    if (!_3625)
    {
        _3653 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3665 = _3653;
    out.m_76.x = _3641;
    out.m_76.y = _3647;
    out.m_76.z = _3649;
    float _3667 = _3665;
    float _3669 = _3665;
    if (!_3625)
    {
        _3655 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3671 = _3655;
    float _3673 = _3671;
    float _3675 = _3671;
    if (!_3625)
    {
        _3657 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3677 = _3657;
    float _3679 = _3599 * _3476;
    float _3681 = _3491 * _3679;
    float _3683 = _3491 * _3645;
    float _3685 = _3501 * _3679;
    float _3687 = fma(_3497, _3681, _3485);
    float _3689 = fma(_3499, _3681, _3487);
    float _3691 = _3485;
    float _3693 = _3681;
    float _3695 = _3677;
    float _3697 = _3677;
    if (!_3625)
    {
        _3691 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3699 = _3691;
    float _3701 = fma(_3491, _3685, _3489);
    float _3703 = _3699;
    float _3705 = _3699;
    if (!_3625)
    {
        _3693 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3707 = _3693;
    out.m_78.x = _3687;
    out.m_78.y = _3689;
    out.m_78.z = _3701;
    out.m_78.w = _3683;
    bool _3709 = !_3625;
    float _3711 = _3707;
    float _3713 = _3707;
    if (!_3709)
    {
        bool _3715 = _3186 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3717 = isnan(_3186);
        bool _3719 = _3715 || _3717;
        bool _3721 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3723 = _3719 || _3721;
        if (!_3723)
        {
            float _3725 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3727 = _3186 + _3725;
            float _3729 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3731 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3729;
            float _3733 = 1.0 / _3731;
            float _3735 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3737 = _3735 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3739 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3741 = _3739 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3743 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3745 = _3743 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3747 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3749 = _3747 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3751 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3753 = _3751 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3755 = _3727 * _3733;
            float _3757 = precise::clamp(_3755, 0.0, 1.0);
            float _3759 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3761 = _3759 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3763 = fma(_3757, _3737, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3765 = fma(_3757, _3761, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3767 = fma(_3757, _3741, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3769 = fma(_3757, _3745, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3771 = fma(_3757, _3749, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3773 = fma(_3757, _3753, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3663 = _3765;
            _3697 = _3771;
            _3705 = _3763;
            _3675 = _3769;
            _3669 = _3767;
            _3713 = _3773;
            _3775 = true;
        }
        else
        {
            bool _3777 = _3186 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3779 = isnan(_3186);
            bool _3781 = _3777 || _3779;
            bool _3783 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3785 = _3781 || _3783;
            if (!_3785)
            {
                _3703 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3787 = _3703;
            _3705 = _3787;
            if (!_3785)
            {
                _3661 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3789 = _3661;
            _3663 = _3789;
            if (!_3785)
            {
                _3667 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3791 = _3667;
            _3669 = _3791;
            if (!_3785)
            {
                _3673 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3793 = _3673;
            _3675 = _3793;
            if (!_3785)
            {
                _3695 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3795 = _3695;
            _3697 = _3795;
            if (!_3785)
            {
                _3711 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3797 = _3711;
            bool _3799 = !_3785;
            _3713 = _3797;
            if (!_3799)
            {
                bool _3801 = _3186 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3803 = isnan(_3186);
                bool _3805 = _3801 || _3803;
                bool _3807 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3809 = _3805 || _3807;
                if (!_3809)
                {
                    float _3811 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3813 = _3186 + _3811;
                    float _3815 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3817 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3815;
                    float _3819 = 1.0 / _3817;
                    float _3821 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3823 = _3821 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3825 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3827 = _3825 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3829 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3831 = _3829 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3833 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3835 = _3833 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3837 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3839 = _3837 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3841 = _3813 * _3819;
                    float _3843 = precise::clamp(_3841, 0.0, 1.0);
                    float _3845 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3847 = _3845 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3849 = fma(_3843, _3823, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3851 = fma(_3843, _3847, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3853 = fma(_3843, _3827, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3855 = fma(_3843, _3831, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3857 = fma(_3843, _3835, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3859 = fma(_3843, _3839, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3663 = _3851;
                    _3697 = _3857;
                    _3705 = _3849;
                    _3675 = _3855;
                    _3669 = _3853;
                    _3713 = _3859;
                    _3775 = true;
                }
                else
                {
                    _3663 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3697 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3705 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3675 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3669 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3713 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3775 = false;
    float _3861 = _3663;
    float _3863 = _3697;
    float _3865 = _3705;
    float _3867 = _3675;
    float _3869 = _3669;
    float _3871 = _3713;
    float _3873 = fma(_3647, -0.5, 0.5);
    float _3875 = precise::clamp(_3873, 0.0, 1.0);
    float _3877 = -_3861;
    float _3879 = _3877 + _3863;
    float _3881 = -_3865;
    float _3883 = _3881 + _3867;
    float _3885 = -_3869;
    float _3887 = _3885 + _3871;
    bool _3889 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3891 = fma(_3875, _3879, _3861);
    float _3893 = fma(_3875, _3883, _3865);
    float _3895 = fma(_3875, _3887, _3869);
    float _3897 = _3891 * 0.586610972881317138671875;
    out.m_80.x = 0.0;
    float _3899 = fma(_3893, 0.298911988735198974609375, _3897);
    float _3901 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3903 = fma(_3895, 0.114477999508380889892578125, _3899);
    out.m_47.x = _3901;
    float _3905 = -_3903;
    float _3907 = _3893 + _3905;
    float _3909 = -_3903;
    float _3911 = _3891 + _3909;
    float _3913 = -_3903;
    float _3915 = _3895 + _3913;
    float _3917 = fma(_3907, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3903);
    float _3919 = fma(_3911, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3903);
    float _3921 = fma(_3915, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3903);
    out.m_82.x = _3917;
    out.m_82.y = _3919;
    out.m_82.z = _3921;
    if (!_3889)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _3923 = -_3160;
    float _3925 = _3923 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _3927 = -_3162;
    float _3929 = _3927 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _3931 = -_3164;
    float _3933 = _3931 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _3935 = _3925 * _3925;
    float _3937 = fma(_3929, _3929, _3935);
    float _3939 = fma(_3933, _3933, _3937);
    float _3941 = sqrt(_3939);
    float _3943 = rsqrt(_3939);
    float _3945 = -_3941;
    float _3947 = _3945 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3949 = _3947 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _3951 = precise::clamp(_3949, 0.0, 1.0);
    float _3953 = _3929 * _3943;
    float _3955 = _3925 * _3943;
    float _3957 = abs(_3951);
    float _3959 = log2(_3957);
    float _3961 = _3933 * _3943;
    float _3963 = _3953 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _3965 = _3647 * _3955;
    float _3967 = -_3955;
    float _3969 = -_3963;
    float _3971 = fma(_3967, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3969);
    float _3973 = fma(_3641, _3953, _3965);
    float _3975 = -_3961;
    float _3977 = fma(_3975, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3971);
    float _3979 = fma(_3649, _3961, _3973);
    float _3981 = precise::clamp(_3979, 0.0, 1.0);
    float _3983 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _3985 = _3977 + _3983;
    float _3987 = _3959 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _3989 = _3985 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _3991 = precise::clamp(_3989, 0.0, 1.0);
    float _3993 = exp2(_3987);
    float _3995 = _3993 * _3991;
    float _3997 = _3981 * _3995;
    float _3999 = _3997 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _4001 = _3997 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _4003 = _3997 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_80.x = _3999;
    out.m_80.y = _4001;
    out.m_80.z = _4003;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

