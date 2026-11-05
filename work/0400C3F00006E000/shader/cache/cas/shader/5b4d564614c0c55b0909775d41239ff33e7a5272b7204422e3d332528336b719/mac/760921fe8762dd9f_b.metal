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
    constant _16* vp_c13 [[id(4)]];
    constant _16* vp_c7 [[id(5)]];
    texture2d<float> vp_t_tcb_24 [[id(6)]];
    sampler vp_t_tcb_24Smplr [[id(7)]];
    texture3d<float> vp_t_tcb_32 [[id(8)]];
    sampler vp_t_tcb_32Smplr [[id(9)]];
    texture3d<float> vp_t_tcb_30 [[id(10)]];
    sampler vp_t_tcb_30Smplr [[id(11)]];
    texture2d<float> vp_t_tcb_1C [[id(12)]];
    sampler vp_t_tcb_1CSmplr [[id(13)]];
    sampler vp_t_tcb_24Smplr_w [[id(14)]];
    sampler vp_t_tcb_32Smplr_w [[id(15)]];
    sampler vp_t_tcb_30Smplr_w [[id(16)]];
    sampler vp_t_tcb_1CSmplr_w [[id(17)]];
    constant dm_border_t* dm_border [[id(18)]];
};

struct main0_out
{
    float4 m_62 [[user(locn0)]];
    float4 m_64 [[user(locn1)]];
    float4 m_70 [[user(locn2)]];
    float4 m_68 [[user(locn3)]];
    float4 m_82 [[user(locn4)]];
    float4 m_49 [[user(locn5)]];
    float4 m_72 [[user(locn6)]];
    float4 m_78 [[user(locn7)]];
    float4 m_80 [[user(locn8)]];
    float4 m_76 [[user(locn9)]];
    float4 m_74 [[user(locn10)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_66 [[attribute(0)]];
    float4 m_55 [[attribute(2)]];
    float4 m_46 [[attribute(3)]];
    float4 m_51 [[attribute(4)]];
    float4 m_53 [[attribute(5)]];
    float4 m_60 [[attribute(6)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1979 = false;
    bool _293 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _96 = in.m_46.w;
    float _98 = trunc(_96);
    int _101 = int(_98);
    bool _105 = _101 >= 1;
    float _107 = 0.0;
    if (!_105)
    {
        _107 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _109 = _107;
    float _111 = _109;
    if (!_105)
    {
        out.m_49.x = 0.0;
    }
    int _113 = 0;
    if (!_105)
    {
        float _115 = _109 * 5.0;
        _113 = as_type<int>(_115);
    }
    int _117 = _113;
    int _119 = _117;
    if (!_105)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2264 = as_type<float>(_117);
        out.gl_Position.z = _2264;
    }
    if (!_105)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _121 = in.m_51.w;
    bool _123 = _121 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _125 = isnan(_121);
    bool _127 = _123 || _125;
    bool _129 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _131 = _127 || _129;
    float _133 = -_121;
    float _135 = _133 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _137 = 0.0;
    if (_131)
    {
        float _139 = float(_101);
        _137 = _139;
    }
    float _141 = _137;
    bool _143 = _135 >= _141;
    bool _145 = !_131;
    bool _147 = _143 || _145;
    if (_147)
    {
        _111 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _149 = _111;
    if (_147)
    {
        out.m_49.x = 0.0;
    }
    if (_147)
    {
        float _151 = _149 * 5.0;
        _119 = as_type<int>(_151);
    }
    int _153 = _119;
    if (_147)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2332 = as_type<float>(_153);
        out.gl_Position.z = _2332;
    }
    if (_147)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _155 = in.m_53.x;
    float _157 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _159 = _135 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _161 = in.m_55.x;
    float _163 = in.m_55.y;
    float _165 = in.m_55.z;
    float _167 = _159 * _157;
    float _169 = fma(_155, (*spvDescriptorSet0.vp_c9)._m0[20].x, _167);
    float _171 = _169 * 6.283185482025146484375;
    float _173 = floor(_169);
    int _175 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _177 = _175 != 0;
    float _179 = _163 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _181 = _171 * 0.15915493667125701904296875;
    float _183 = _163 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _185 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _187 = _185 != 0;
    int _189 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _191 = _189 != 0;
    float _193 = _163 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _195 = fma(_161, (*spvDescriptorSet0.vp_c10)._m0[4].x, _179);
    float _197 = fma(_161, (*spvDescriptorSet0.vp_c10)._m0[5].x, _183);
    float _199 = _181 * 6.283185482025146484375;
    float _201 = cos(_199);
    bool _203 = !_187;
    int _205 = _203 ? 0 : 1;
    float _207 = fma(_161, (*spvDescriptorSet0.vp_c10)._m0[6].x, _193);
    bool _209 = !_177;
    int _211 = _209 ? 0 : 1;
    float _213 = fma(_165, (*spvDescriptorSet0.vp_c10)._m0[4].z, _195);
    bool _215 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _217 = -_173;
    float _219 = _169 + _217;
    int _221 = abs(_205);
    bool _223 = !_191;
    int _225 = _223 ? 0 : 1;
    int _227 = abs(_211);
    float _229 = float(_221);
    float _231 = -_219;
    float _233 = fma(_231, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _235 = abs(_225);
    float _237 = fma(_201, 0.5, 0.5);
    float _239 = abs(_233);
    float _241 = _229 * _239;
    bool _243 = _219 < 0.5;
    float _245 = float(_243);
    float _247 = -_237;
    float _249 = fma(_247, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _251 = float(_227);
    float _253 = -_245;
    float _255 = fma(_253, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _257 = float(_235);
    float _259 = fma(_165, (*spvDescriptorSet0.vp_c10)._m0[6].z, _207);
    float _261 = fma(_251, _249, _241);
    float _263 = fma(_165, (*spvDescriptorSet0.vp_c10)._m0[5].z, _197);
    float _265 = abs(_255);
    float _267 = fma(_257, _265, _261);
    bool _269 = !_215;
    float _271 = _263;
    float _289;
    float _291;
    if (!_269)
    {
        float _273 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _275 = _155 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _277 = float(_101);
        float _279 = fma(_275, (*spvDescriptorSet0.vp_c9)._m0[12].x, _135);
        float _281 = _279 * _273;
        float _283 = floor(_281);
        float _285 = -_283;
        float _287 = _281 + _285;
        _289 = _287;
        _291 = _277;
        _293 = true;
    }
    else
    {
        float _295 = float(_101);
        float _297 = 1.0 / _295;
        float _299 = _135 * _297;
        _289 = _299;
        _291 = _295;
    }
    _293 = false;
    float _301 = _289;
    float _303 = _291;
    float _305 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _307 = _301 + _305;
    bool _309 = _301 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _311 = isnan(_301);
    bool _313 = _309 || _311;
    bool _315 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _317 = _313 || _315;
    float _319 = float(_317);
    float _321 = as_type<float>(int(gl_VertexIndex));
    float _323 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _325 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _323;
    float _327 = in.m_60.x;
    float _329 = in.m_60.y;
    float _331 = -_319;
    float _333 = _331 + 1.0;
    float _335 = 1.0 / _325;
    float _337 = _307 * _335;
    bool _339 = _301 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _341 = isnan(_301);
    bool _343 = _339 || _341;
    bool _345 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _347 = _343 || _345;
    float _349 = float(_347);
    float _351 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _353 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _351;
    float _355 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _357 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _355;
    int _359 = as_type<int>(_321) & 1;
    bool _361 = _359 != 0;
    int _363 = as_type<int>(_321) & 2;
    bool _365 = _363 != 0;
    float _367 = _349 * _333;
    float _369 = fma(_353, _337, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _371 = fma(_357, _337, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _373 = !_365;
    float _375 = _373 ? (-0.5) : 0.5;
    float _377 = _369 * _367;
    float _379 = _371 * _367;
    float _381 = -_349;
    float _383 = _381 + 1.0;
    bool _385 = !_361;
    float _387 = _385 ? (-0.5) : 0.5;
    float _389 = in.m_46.x;
    float _391 = in.m_46.y;
    float _393 = in.m_46.z;
    float _395 = fma(_383, (*spvDescriptorSet0.vp_c9)._m0[143].y, _379);
    float _397 = fma(_383, (*spvDescriptorSet0.vp_c9)._m0[143].x, _377);
    float _399 = fma(_319, (*spvDescriptorSet0.vp_c9)._m0[144].y, _395);
    float _401 = fma(_319, (*spvDescriptorSet0.vp_c9)._m0[144].x, _397);
    float _403 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _405 = _399 * _329;
    float _407 = _401 * _327;
    float _409 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _387);
    float _411 = _267 * _405;
    float _413 = _267 * _407;
    float _415 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _375);
    float _417 = _411 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _419 = _413 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _421 = _417 * _415;
    float _423 = _419 * _409;
    float _425 = _391 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _427 = _391 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _429 = _421 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _431 = _421 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _433 = fma(_389, (*spvDescriptorSet0.vp_c10)._m0[6].x, _425);
    float _435 = fma(_389, (*spvDescriptorSet0.vp_c10)._m0[4].x, _427);
    float _437 = fma(_423, (*spvDescriptorSet0.vp_c8)._m0[26].x, _429);
    float _439 = fma(_423, (*spvDescriptorSet0.vp_c8)._m0[24].x, _431);
    float _441 = fma(_393, (*spvDescriptorSet0.vp_c10)._m0[6].z, _433);
    float _443 = fma(_393, (*spvDescriptorSet0.vp_c10)._m0[4].z, _435);
    float _445 = fma(_403, (*spvDescriptorSet0.vp_c8)._m0[26].z, _437);
    float _447 = fma(_403, (*spvDescriptorSet0.vp_c8)._m0[24].z, _439);
    float _449 = _441 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _451 = _443 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _453 = _445 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _455 = _447 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _457 = _391 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _459 = _421 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _461 = _449 + _453;
    float _463 = _451 + _455;
    float _465 = fma(_389, (*spvDescriptorSet0.vp_c10)._m0[5].x, _457);
    float _467 = fma(_423, (*spvDescriptorSet0.vp_c8)._m0[25].x, _459);
    float _469 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _471 = _461 + _469;
    float _473 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _475 = _463 + _473;
    float _477 = fma(_393, (*spvDescriptorSet0.vp_c10)._m0[5].z, _465);
    float _479 = fma(_403, (*spvDescriptorSet0.vp_c8)._m0[25].z, _467);
    float _481 = _471 * _471;
    float _483 = _479 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _485 = fma(_475, _475, _481);
    float _487 = _477 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _489 = sqrt(_485);
    float _491 = _487 + _483;
    bool _493 = _489 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _495 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _497 = _495 != 0;
    int _499 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _501 = _499 != 0;
    int _503 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _505 = _503 != 0;
    bool _507 = !_501;
    int _509 = _507 ? 0 : 1;
    bool _511 = !_497;
    int _513 = _511 ? 0 : 1;
    bool _515 = !_505;
    int _517 = _515 ? 0 : 1;
    float _519 = _477;
    float _521 = _461;
    float _523 = _459;
    float _525 = _479;
    if (!_493)
    {
        _519 = _463;
    }
    float _527 = _519;
    float _529 = 0.0;
    float _531 = _527;
    if (!_493)
    {
        _529 = _491;
    }
    float _533 = _529;
    bool _535 = !_493;
    float _537 = _533;
    if (!_535)
    {
        float _539 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _541 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _543 = _489 + _541;
        float _545 = _491 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _547 = rsqrt(_485);
        float _549 = _543 * _539;
        float _551 = _549 * 0.15915493667125701904296875;
        float _553 = _551 * 6.283185482025146484375;
        float _555 = cos(_553);
        float _557 = _551 * 6.283185482025146484375;
        float _559 = sin(_557);
        float _561 = _555 + (-1.0);
        float _563 = _561 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _565 = fma(_559, _545, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _567 = fma(_491, _555, _563);
        float _569 = _547 * _565;
        float _571 = fma(_475, _569, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _573 = fma(_471, _569, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _537 = _567;
        _531 = _571;
        _521 = _573;
        _523 = _551;
        _525 = _547;
    }
    float _575 = _537;
    float _577 = _531;
    float _579 = _521;
    float _581 = _523;
    float _583 = _525;
    float _585 = -_487;
    float _587 = _585 + _575;
    float _589 = -_451;
    float _591 = _589 + _577;
    float _593 = -_449;
    float _595 = _593 + _579;
    float _597 = _587 * _587;
    bool _599 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _601 = isnan(0.5);
    bool _603 = _599 || _601;
    bool _605 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _607 = _603 || _605;
    float _609 = fma(_591, _591, _597);
    float _611 = fma(_595, _595, _609);
    float _613 = sqrt(_611);
    bool _615 = _613 > 0.0;
    bool _617 = !_615;
    float _619 = _577;
    float _621 = _579;
    float _623 = _575;
    float _625 = _583;
    float _627 = _581;
    if (!_617)
    {
        float _629 = _263 * _263;
        float _631 = fma(_213, _213, _629);
        float _633 = rsqrt(_611);
        float _635 = fma(_259, _259, _631);
        float _637 = sqrt(_635);
        float _639 = _591 * _633;
        float _641 = _587 * _633;
        float _643 = _595 * _633;
        bool _645 = _637 > 0.0;
        bool _647 = !_645;
        _625 = _635;
        _627 = _637;
        if (!_647)
        {
            float _649 = rsqrt(_635);
            float _651 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _653 = _263 * _649;
            float _655 = _213 * _649;
            float _657 = _259 * _649;
            float _659 = _641 * _653;
            float _661 = fma(_639, _655, _659);
            float _663 = _651 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _665 = fma(_643, _657, _661);
            float _667 = _665 * _663;
            float _669 = fma(_213, _667, _577);
            float _671 = fma(_263, _667, _575);
            float _673 = fma(_259, _667, _579);
            _619 = _669;
            _621 = _673;
            _623 = _671;
            _627 = _653;
        }
    }
    float _675 = _619;
    float _677 = _621;
    float _679 = _623;
    float _681 = _625;
    float _683 = _627;
    float _685 = _679;
    float _687 = _677;
    float _689 = _681;
    float _691 = _683;
    if (_607)
    {
        _271 = _675;
    }
    float _693 = _271;
    float _695 = _693;
    if (!_607)
    {
        float _697 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _699 = _487 + _697;
        float _701 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _703 = _451 + _701;
        float _705 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _707 = -_451;
        float _709 = _707 + _675;
        float _711 = _699 * _699;
        float _713 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _715 = _449 + _713;
        float _717 = -_449;
        float _719 = _717 + _677;
        float _721 = fma(_703, _703, _711);
        float _723 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _725 = fma(_715, _715, _721);
        float _727 = sqrt(_725);
        float _729 = _705 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _731 = precise::min(_727, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _733 = _731 * _723;
        float _735 = _729 * _733;
        float _737 = -_487;
        float _739 = _737 + _679;
        float _741 = fma(_709, _735, _451);
        float _743 = fma(_739, _735, _487);
        float _745 = fma(_719, _735, _449);
        _685 = _743;
        _695 = _741;
        _687 = _745;
        _689 = _723;
    }
    float _747 = _685;
    float _749 = _695;
    float _751 = _687;
    float _753 = _689;
    float _755 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _757 = _747 + _755;
    float _759 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _761 = _749 + _759;
    float _763 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _765 = _751 + _763;
    float _767 = _757 * _757;
    float _769 = fma(_761, _761, _767);
    float _771 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _773 = fma(_765, _765, _769);
    float _775 = rsqrt(_773);
    float _777 = sqrt(_773);
    float _779 = _775 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _781 = _761 * _779;
    float _783 = _765 * _779;
    float _785 = _781 * _781;
    float _787 = _783 * _783;
    float _789 = _785 + _787;
    float _791 = sqrt(_789);
    bool _793 = _791 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _795 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _797 = _791 + _795;
    float _799 = _775;
    float _801 = _797;
    float _803 = _753;
    float _805 = _757;
    if (_793)
    {
        float _807 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _799 = _807;
    }
    float _809 = _799;
    float _811 = _809;
    if (_793)
    {
        float _813 = _797 * _809;
        _801 = _813;
    }
    float _815 = _801;
    if (_793)
    {
        float _817 = rsqrt(_789);
        _811 = _817;
    }
    float _819 = _811;
    float _821 = _819;
    if (_793)
    {
        float _823 = _815 * 0.15915493667125701904296875;
        _803 = _823;
    }
    float _825 = _803;
    float _827 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _829 = _765;
    float _831 = _825;
    if (_793)
    {
        float _833 = _825 * 6.283185482025146484375;
        float _835 = sin(_833);
        _829 = _835;
    }
    float _837 = _829;
    float _839 = precise::max(0.0, _827);
    float _841 = _259;
    if (_793)
    {
        float _843 = _825 * 6.283185482025146484375;
        float _845 = cos(_843);
        _841 = _845;
    }
    float _847 = _841;
    float _849 = -_779;
    float _851 = -_839;
    float _853 = fma(_757, _849, _851);
    float _855 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_793)
    {
        float _857 = _853 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _805 = _857;
    }
    float _859 = _805;
    float _861 = fma(_451, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    if (!_793)
    {
        _855 = _853;
    }
    float _863 = _855;
    float _865 = _837;
    float _867 = _863;
    if (_793)
    {
        float _869 = fma(_837, _859, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _691 = _869;
    }
    float _871 = _691;
    float _873 = floor(_861);
    float _875 = 0.0;
    float _877 = _871;
    if (_793)
    {
        float _879 = _819 * _871;
        _875 = _879;
    }
    float _881 = _875;
    if (!_793)
    {
        _821 = _781;
    }
    float _883 = _821;
    float _885 = _883;
    if (_793)
    {
        float _887 = _847 + (-1.0);
        _865 = _887;
    }
    float _889 = _865;
    float _891 = _889;
    if (_793)
    {
        float _893 = _781 * _881;
        _885 = _893;
    }
    float _895 = _885;
    if (!_793)
    {
        _877 = _783;
    }
    float _897 = _877;
    float _899 = _897;
    if (_793)
    {
        float _901 = _783 * _881;
        _899 = _901;
    }
    float _903 = _899;
    if (_793)
    {
        float _905 = _889 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _831 = _905;
    }
    float _907 = _831;
    float _909 = _907;
    if (!_793)
    {
        _891 = _785;
    }
    float _911 = _891;
    float _913 = _911;
    if (_793)
    {
        float _915 = _895 * _895;
        _913 = _915;
    }
    float _917 = _913;
    float _919 = _747 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    if (_793)
    {
        float _921 = fma(_853, _847, _907);
        _867 = _921;
    }
    float _923 = _867;
    if (!_793)
    {
        _909 = _787;
    }
    float _925 = _909;
    float _927 = _925;
    if (_793)
    {
        float _929 = _903 * _903;
        _927 = _929;
    }
    float _931 = _927;
    float _933 = fma(_749, (*spvDescriptorSet0.vp_c8)._m0[1].x, _919);
    float _935 = fma(_923, _923, _917);
    float _937 = _747 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _939 = fma(_751, (*spvDescriptorSet0.vp_c8)._m0[1].z, _933);
    float _941 = _935 + _931;
    float _943 = _747 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _945 = _747 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _947 = fma(_749, (*spvDescriptorSet0.vp_c8)._m0[2].x, _937);
    float _949 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _951 = fma(_777, (*spvDescriptorSet0.vp_c15)._m0[23].w, _949);
    float _953 = precise::clamp(_951, 0.0, 1.0);
    float _955 = fma(_749, (*spvDescriptorSet0.vp_c8)._m0[0].x, _943);
    float _957 = rsqrt(_941);
    float _959 = _939 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _961 = fma(_749, (*spvDescriptorSet0.vp_c8)._m0[3].x, _945);
    float _963 = fma(_751, (*spvDescriptorSet0.vp_c8)._m0[0].z, _955);
    float _965 = fma(_751, (*spvDescriptorSet0.vp_c8)._m0[2].z, _947);
    float _967 = -_953;
    float _969 = _967 + 1.0;
    float _971 = _959 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _973 = _963 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _975 = _965 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _977 = fma(_751, (*spvDescriptorSet0.vp_c8)._m0[3].z, _961);
    float _979 = fma(_973, (*spvDescriptorSet0.vp_c8)._m0[7].x, _971);
    float _981 = abs(_969);
    float _983 = log2(_981);
    float _985 = _977 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _987 = _975 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _989 = fma(_975, (*spvDescriptorSet0.vp_c8)._m0[7].z, _979);
    float _991 = _957 * _895;
    float _993 = fma(_449, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _995 = _957 * _903;
    float _997 = fma(_985, (*spvDescriptorSet0.vp_c8)._m0[7].w, _989);
    float _999 = _957 * _923;
    float _1001 = _991 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1003 = floor(_993);
    float _1005 = -_987;
    float _1007 = fma(_1005, _771, 1.0);
    float _1009 = _959 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1011 = -_1001;
    float _1013 = fma(_999, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1011);
    float _1015 = _983 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1017 = -_995;
    float _1019 = fma(_1017, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1013);
    float _1021 = log2(_1007);
    float _1023 = fma(_1019, -0.5, 0.5);
    float _1025 = fma(_1019, 0.5, 0.5);
    float _1027 = exp2(_1015);
    float _1029 = -_873;
    float _1031 = _861 + _1029;
    float _1033 = _959 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1035 = -_1003;
    float _1037 = _993 + _1035;
    float _1039 = fma(_973, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1009);
    float _1041 = fma(_973, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1033);
    float _1043 = _999 + 1.0;
    float _1045 = 1.0 / _997;
    float _1047 = fma(_1025, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1049 = fma(_975, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1041);
    float _1051 = fma(_975, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1039);
    float _1053 = _1021 * 0.693147182464599609375;
    float _1055 = fma(_1025, _1047, -0.212114393711090087890625);
    float _1057 = fma(_985, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1049);
    float _1059 = sqrt(_1023);
    float _1061 = -_999;
    float _1063 = fma(_1027, _1043, _1061);
    float _1065 = fma(_985, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1051);
    float _1067 = fma(_1025, _1055, 1.570728778839111328125);
    float _1069 = _1053 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1071 = fma(_1063, 0.5, 0.5);
    float _1073 = _1057 * _1045;
    float _1075 = _1065 * _1045;
    float _1077 = fma(_1073, 0.5, 0.5);
    float _1079 = fma(_1075, -0.5, 0.5);
    float _1081 = _1059 * 0.636619746685028076171875;
    float2 _3803 = float2(_1031, _1037);
    float _1083 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_3803, float2(0.0), isnan(_3803)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_3803, float2(0.0), isnan(_3803)), level(0.0)).x;
    float3 _3814 = float3(_1077, _1079, _1069);
    float _1085 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3814, float3(0.0), isnan(_3814)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3814, float3(0.0), isnan(_3814)), level(0.0)).x;
    float _1087 = -_1067;
    float _1089 = fma(_1081, _1087, 1.0);
    float3 _3830 = float3(_1077, _1079, _1069);
    float4 _1092 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3830, float3(0.0), isnan(_3830)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3830, float3(0.0), isnan(_3830)), level(0.0)).xyzw;
    float _1094 = _1092.x;
    float _1096 = _1092.y;
    float _1098 = _1092.z;
    float _1100 = _1092.w;
    float2 _3846 = float2(_1089, _1071);
    float3 _1104 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3846, float2(0.0), isnan(_3846)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3846, float2(0.0), isnan(_3846)), level(0.0)).xyz;
    float _1106 = _1104.x;
    float _1108 = _1104.y;
    float _1110 = _1104.z;
    float _1112 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1114 = int(_1112);
    int _1116 = abs(_513);
    float _1118 = _983 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1120 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1122 = int(_1120);
    float _1124 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1126 = float(_1114);
    float _1128 = 1.0 / _303;
    float _1130 = float(uint(_1122));
    float _1132 = 1.0 / _1126;
    int _1134 = ~_1122;
    int _1136 = _1134 + 1;
    int _1138 = ~_1122;
    int _1140 = _1138 + 1;
    float _1142 = 1.0 / _1130;
    float _1144 = _135 * _1132;
    int _1146 = ~_1122;
    int _1148 = _1146 + 1;
    float _1150 = exp2(_1118);
    float _1152 = float(_1122);
    int _1154 = as_type<int>(_1142) + (-2);
    float _1156 = trunc(_1144);
    int _1158 = int(_1156);
    float _1160 = -_1150;
    float _1162 = _1160 + 1.0;
    float _1164 = float(uint(_1158));
    float _1166 = float(_1158);
    float _1168 = as_type<float>(_1154) * _1164;
    bool _1170 = _1166 >= _1152;
    bool _1172 = isnan(_1166);
    bool _1174 = _1170 || _1172;
    bool _1176 = isnan(_1152);
    bool _1178 = _1174 || _1176;
    float _1180 = float(_1178);
    float _1182 = trunc(_1168);
    float _1184 = precise::max(_1182, 0.0);
    uint _1187 = uint(_1184);
    float _1189 = trunc(_1180);
    int _1191 = int(_1189);
    int _1193 = _1148 * int(_1187);
    int _1195 = _1193 + _1158;
    float _1197 = float(uint(_1195));
    int _1199 = ~_1191;
    int _1201 = _1199 + 1;
    int _1203 = _1201 + 1;
    float _1205 = as_type<float>(_1154) * _1197;
    int _1207 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1209 = _1207 != 0;
    float _1211 = trunc(_1205);
    float _1213 = precise::max(_1211, 0.0);
    uint _1215 = uint(_1213);
    bool _1217 = !_1209;
    float _1219 = _1217 ? 7.345489978790283203125 : 1.0;
    float _1221 = _1219 * _155;
    float _1223 = floor(_1221);
    int _1225 = int(_1187) + int(_1215);
    int _1227 = _1136 * _1225;
    int _1229 = _1227 + _1158;
    bool _1231 = uint(_1229) >= uint(_1122);
    float _1233 = -_1223;
    float _1235 = _1221 + _1233;
    bool _1237 = !_1231;
    int _1239 = _1237 ? 0 : (-1);
    float _1241 = _1235 * _1152;
    float _1243 = _135 * _1152;
    bool _1245 = _1122 == 0;
    int _1247 = ~_1225;
    int _1249 = _1247 + _1239;
    int _1251 = _1249 + 1;
    float _1253 = _1243 * _1128;
    int _1255 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1257 = _1255 != 0;
    float _1259 = trunc(_1241);
    int _1261 = int(_1259);
    int _1263 = _1122 + (-1);
    int _1265 = _1122 * _1251;
    int _1267 = _1265 + _1158;
    int _1269 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1271 = _1269 != 0;
    int _1273 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1275 = _1273 != 0;
    bool _1277 = !_1245;
    int _1279 = _1277 ? _1267 : (-1);
    float _1281 = trunc(_1253);
    int _1283 = int(_1281);
    bool _1285 = !_1257;
    int _1287 = _1285 ? 0 : 1;
    int _1289 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1291 = _1289 != 0;
    int _1293 = _1279 * _1203;
    int _1295 = abs(_509);
    int _1297 = abs(_1287);
    int _1299 = _1191 * _1263;
    int _1301 = _1299 + _1293;
    bool _1303 = !_1291;
    int _1305 = _1303 ? 0 : 1;
    int _1307 = _1261 * _1297;
    int _1309 = _1307 + _1158;
    int _1311 = abs(_517);
    int _1313 = _1301 * _1295;
    int _1315 = abs(_1305);
    int _1317 = _1283 * _1116;
    int _1319 = _1317 + _1313;
    int _1321 = _1309 * _1311;
    int _1323 = _1321 + _1319;
    int _1325 = ~_1122;
    int _1327 = _1325 + 1;
    float _1329 = in.m_53.y;
    int _1331 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1333 = _1331 != 0;
    int _1335 = _1261 * _1315;
    int _1337 = _1335 + _1323;
    float _1339 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1341 = float(uint(_1337));
    float _1343 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1345 = as_type<float>(_1154) * _1341;
    float _1347 = fma(_155, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1343);
    float _1349 = trunc(_1345);
    float _1351 = precise::max(_1349, 0.0);
    uint _1353 = uint(_1351);
    bool _1355 = _1329 > 0.5;
    int _1357 = _1327 * int(_1353);
    int _1359 = _1357 + _1337;
    float _1361 = float(uint(_1359));
    float _1363 = _487 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1365 = _487 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1367 = as_type<float>(_1154) * _1361;
    float _1369 = fma(_451, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1363);
    float _1371 = fma(_451, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1365);
    int _1373 = ~_1122;
    int _1375 = _1373 + 1;
    float _1377 = fma(_449, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1369);
    float _1379 = trunc(_1367);
    float _1381 = precise::max(_1379, 0.0);
    uint _1383 = uint(_1381);
    float _1385 = fma(_449, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1371);
    float _1387 = float(uint(_1309));
    float _1389 = _1377 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1391 = _1385 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1393 = 1.0 / _1389;
    float _1395 = _1391 + _1389;
    int _1397 = int(_1353) + int(_1383);
    float _1399 = as_type<float>(_1154) * _1387;
    float _1401 = trunc(_1399);
    float _1403 = precise::max(_1401, 0.0);
    uint _1405 = uint(_1403);
    int _1407 = _1375 * _1397;
    int _1409 = _1407 + _1337;
    float _1411 = _1395 * _1393;
    float _1413 = _1411 * 0.5;
    float _1415 = _155 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _1417 = uint(_1409) >= uint(_1122);
    float _1419 = -_1339;
    float _1421 = fma(_1415, 2.0, _1419);
    float _1423 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1425 = fma(_1413, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1423);
    bool _1427 = !_1417;
    int _1429 = _1427 ? 0 : (-1);
    bool _1431 = _155 > 0.5;
    float _1433 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _1435 = ~_1397;
    int _1437 = _1435 + _1429;
    int _1439 = _1437 + 1;
    float _1441 = 1.0 / _1425;
    int _1443 = _1375 * int(_1405);
    int _1445 = _1443 + _1309;
    float _1447 = _1329 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _1449 = _1122 * _1439;
    int _1451 = _1449 + _1337;
    float _1453 = fma(_1447, -2.0, _1124);
    float _1455 = float(uint(_1445));
    float _1457 = fma(_1329, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1433);
    bool _1459 = !_1245;
    int _1461 = _1459 ? _1451 : (-1);
    float _1463 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1465 = as_type<float>(_1154) * _1455;
    int _1467 = _1461 >> 31;
    float _1469 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1471 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1473 = _1441 * _1471;
    int _1475 = _1467 & 3;
    float _1477 = trunc(_1465);
    float _1479 = precise::max(_1477, 0.0);
    uint _1481 = uint(_1479);
    float _1483 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1485 = -_135;
    float _1487 = fma(_1485, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1421);
    int _1489 = _1461 + _1475;
    float _1491 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1493 = abs(_1473);
    float _1495 = log2(_1493);
    float _1497 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1499 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1501 = _1463 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1503 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1505 = _1469 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1507 = _1483 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1509 = _1491 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1511 = int(_1405) + int(_1481);
    float _1513 = _1497 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1515 = _1489 >> 2;
    float _1517 = _1499 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_62.x = _1501;
    out.m_62.y = _1505;
    out.m_62.z = _1507;
    out.m_62.w = _1503;
    float _1519 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1347);
    int _1521 = _1515 << 4;
    int _1523 = _1521 + 368;
    float _1525 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1453);
    out.m_64.x = _1509;
    out.m_64.y = _1513;
    out.m_64.z = _1517;
    float _1527 = _1495 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1529 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1457);
    int _1531 = _1140 * _1511;
    int _1533 = _1531 + _1309;
    float _1535 = exp2(_1527);
    bool _1537 = _1473 <= 8000.0;
    bool _1539 = isnan(_1473);
    bool _1541 = _1537 || _1539;
    bool _1543 = isnan(8000.0);
    bool _1545 = _1541 || _1543;
    float _1547 = float(_1545);
    float _1549 = -_1083;
    float _1551 = _1549 + 1.0;
    float _1553 = -_1519;
    float _1555 = _1553 + 1.0;
    float _1557 = -_1529;
    float _1559 = _1557 + 1.0;
    uint _1561 = uint(int(uint(_1523) >> uint(2)));
    uint _1563 = uint(int(uint(int(_1561)) >> uint(2)));
    int _1565 = int(_1561) & 3;
    float _1567 = (*spvDescriptorSet0.vp_c9)._m0[int(_1563)][_1565];
    int _1569 = int(_1561) + 1;
    uint _1571 = uint(int(uint(_1569) >> uint(2)));
    int _1573 = _1569 & 3;
    float _1575 = (*spvDescriptorSet0.vp_c9)._m0[int(_1571)][_1573];
    float _1577 = -_387;
    int _1579 = _1431 ? as_type<int>(_1577) : as_type<int>(_387);
    float _1581 = _375 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1583 = -_375;
    int _1585 = _1355 ? as_type<int>(_1583) : as_type<int>(_375);
    bool _1587 = uint(_1533) >= uint(_1122);
    float _1589 = _1581 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    bool _1591 = !_1275;
    float _1593 = _1591 ? _375 : as_type<float>(_1585);
    float _1595 = _387 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _1597 = !_1271;
    float _1599 = _1597 ? _387 : as_type<float>(_1579);
    float _1601 = _1581 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _1603 = _1523 + 8;
    uint _1605 = uint(int(uint(_1603) >> uint(2)));
    uint _1607 = uint(int(uint(int(_1605)) >> uint(2)));
    int _1609 = int(_1605) & 3;
    float _1611 = (*spvDescriptorSet0.vp_c9)._m0[int(_1607)][_1609];
    int _1613 = int(_1605) + 1;
    uint _1615 = uint(int(uint(_1613) >> uint(2)));
    int _1617 = _1613 & 3;
    float _1619 = (*spvDescriptorSet0.vp_c9)._m0[int(_1615)][_1617];
    int _1621 = _1461 & 3;
    bool _1623 = _1621 != 0;
    float _1625 = _1581 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1627 = fma(_1595, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1601);
    int _1629 = _1461 & 3;
    bool _1631 = _1629 != 0;
    float _1633 = fma(_1535, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1635 = precise::clamp(_1633, 0.0, 1.0);
    bool _1637 = uint(_1621) > 1u;
    float _1639 = fma(_1595, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1589);
    float _1641 = _1599 + 0.5;
    int _1643 = _1631 ? 0 : 1;
    float _1645 = fma(_1595, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1625);
    bool _1647 = _1621 != 3;
    float _1649 = fma(_1635, -2.0, 3.0);
    float _1651 = _1635 * _1635;
    int _1653 = ~_1643;
    int _1655 = _1653 + 1;
    int _1657 = _1655 + 1;
    float _1659 = fma(_1641, (*spvDescriptorSet0.vp_c9)._m0[80].x, _1487);
    bool _1661 = !_1587;
    int _1663 = _1661 ? 0 : (-1);
    float _1665 = _1651 * _1649;
    int _1667 = _1657;
    float _1669 = _1094;
    float _1671 = _1096;
    float _1673 = _1627;
    float _1675 = _1639;
    float _1677 = _1645;
    float _1679 = _997;
    if (!_1637)
    {
        int _1681 = ~_1643;
        int _1683 = _1681 + 1;
        _1667 = _1683;
    }
    int _1685 = _1667;
    float _1687 = -_1555;
    float _1689 = fma(_1599, _1687, _1659);
    bool _1691 = uint(_1621) >= 2u;
    int _1693 = abs(_1685);
    bool _1695 = !_1623;
    int _1697 = _1695 ? 0 : 1;
    int _1699 = _1691 ? 0 : 1;
    bool _1701 = _1621 != 3;
    int _1703 = ~_1699;
    int _1705 = _1703 + 1;
    int _1707 = _1705 + 1;
    bool _1709 = !_1701;
    int _1711 = _1709 ? 0 : (-1);
    int _1713 = abs(_1697);
    int _1715 = _1707;
    if (_1647)
    {
        int _1717 = ~_1699;
        int _1719 = _1717 + 1;
        _1715 = _1719;
    }
    int _1721 = _1715;
    int _1723 = ~_1693;
    int _1725 = _1723 + 1;
    int _1727 = _1725 + 1;
    int _1729 = abs(_1711);
    int _1731 = abs(_1721);
    int _1733 = _1727 * as_type<int>(_1575);
    bool _1735 = !_1333;
    int _1737 = _1735 ? 0 : 1;
    int _1739 = ~_1713;
    int _1741 = _1739 + 1;
    int _1743 = _1741 + 1;
    int _1745 = abs(_1737);
    int _1747 = _1743 * as_type<int>(_1567);
    int _1749 = _1747 + _1733;
    int _1751 = ~_1731;
    int _1753 = _1751 + 1;
    int _1755 = _1753 + 1;
    int _1757 = ~_1511;
    int _1759 = _1757 + _1663;
    int _1761 = _1759 + 1;
    int _1763 = _1755 * as_type<int>(_1611);
    int _1765 = _1763 + _1749;
    int _1767 = ~_1729;
    int _1769 = _1767 + 1;
    int _1771 = _1769 + 1;
    float _1773 = _959 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _1775 = _1122 * _1761;
    int _1777 = _1775 + _1309;
    int _1779 = ~_1745;
    int _1781 = _1779 + 1;
    int _1783 = _1781 + 1;
    float _1785 = -_1665;
    float _1787 = _1785 + 1.0;
    int _1789 = _1771 * as_type<int>(_1619);
    int _1791 = _1789 + _1765;
    float _1793 = fma(_973, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1773);
    bool _1795 = !_1245;
    int _1797 = _1795 ? _1777 : (-1);
    float _1799 = fma(_1787, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1665);
    int _1801 = _1791 * _1783;
    float _1803 = fma(_975, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1793);
    float _1805 = _1547 * _1799;
    int _1807 = _1797 * _1745;
    int _1809 = _1807 + _1801;
    float _1811 = fma(_985, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1803);
    float _1813 = _1162 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1815 = in.m_66.x;
    float _1817 = _1805 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _1819 = _1593 + (-0.5);
    float _1821 = _1811 + _997;
    float _1823 = _1813 * _1085;
    float _1825 = _1551 * _1817;
    float _1827 = precise::clamp(_1825, 0.0, 1.0);
    float _1829 = -_1819;
    float _1831 = -_1525;
    float _1833 = fma(_1829, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1831);
    float _1835 = _1821 * 0.5;
    float _1837 = -_1827;
    float _1839 = fma(_1837, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    out.gl_Position.x = _1057;
    out.gl_Position.y = _1065;
    out.gl_Position.z = _1811;
    out.gl_Position.w = _997;
    float _1841 = _1110 * _1823;
    float _1843 = fma(_1593, _1559, _1833);
    float _1845 = float(_1809);
    out.m_68.z = _1835;
    out.m_68.w = _997;
    float _1847 = fma(_1100, _1841, _1098);
    bool _1849 = _777 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1851 = isnan(_777);
    bool _1853 = _1849 || _1851;
    bool _1855 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1857 = _1853 || _1855;
    out.m_70.x = _1689;
    out.m_70.y = _1843;
    out.m_72.x = _1845;
    float _1859 = _1100 * _1823;
    float _1861 = -_1813;
    float _1863 = _1861 + 1.0;
    float _1865 = _1839 * _1815;
    float _1867 = _1645 + (*spvDescriptorSet0.vp_c8)._m0[26].z;
    float _1869 = fma(_1106, _1859, _1094);
    float _1871 = fma(_1108, _1859, _1096);
    float _1873 = _1100 * _1863;
    float _1875 = _1865 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _1877 = _1627 + (*spvDescriptorSet0.vp_c8)._m0[24].z;
    float _1879 = _1639 + (*spvDescriptorSet0.vp_c8)._m0[25].z;
    if (!_1857)
    {
        _1669 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1881 = _1669;
    out.m_74.x = _1869;
    out.m_74.y = _1871;
    out.m_74.z = _1847;
    out.m_74.w = _1873;
    float _1883 = _1881;
    float _1885 = _1881;
    if (!_1857)
    {
        _1671 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1887 = _1671;
    float _1889 = _1887;
    float _1891 = _1887;
    if (!_1857)
    {
        _1673 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1893 = _1673;
    out.m_76.x = _1875;
    float _1895 = _1893;
    float _1897 = _1893;
    if (!_1857)
    {
        _1675 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1899 = _1675;
    float _1901 = _1899;
    float _1903 = _1899;
    if (!_1857)
    {
        _1677 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1905 = _1677;
    out.m_78.x = _1877;
    out.m_78.y = _1879;
    out.m_78.z = _1867;
    float _1907 = _1905;
    float _1909 = _1905;
    if (!_1857)
    {
        _1679 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1911 = _1679;
    bool _1913 = !_1857;
    float _1915 = _1911;
    float _1917 = _1911;
    if (!_1913)
    {
        bool _1919 = _777 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1921 = isnan(_777);
        bool _1923 = _1919 || _1921;
        bool _1925 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1927 = _1923 || _1925;
        if (!_1927)
        {
            float _1929 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1931 = _777 + _1929;
            float _1933 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1935 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1933;
            float _1937 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1939 = _1937 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1941 = 1.0 / _1935;
            float _1943 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1945 = _1943 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1947 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1949 = _1947 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1951 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1953 = _1951 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1955 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1957 = _1955 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1959 = _1931 * _1941;
            float _1961 = precise::clamp(_1959, 0.0, 1.0);
            float _1963 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1965 = _1963 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1967 = fma(_1961, _1939, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1969 = fma(_1961, _1965, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1971 = fma(_1961, _1945, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1973 = fma(_1961, _1949, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1975 = fma(_1961, _1953, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1977 = fma(_1961, _1957, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1891 = _1969;
            _1909 = _1975;
            _1885 = _1967;
            _1903 = _1973;
            _1897 = _1971;
            _1917 = _1977;
            _1979 = true;
        }
        else
        {
            bool _1981 = _777 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1983 = isnan(_777);
            bool _1985 = _1981 || _1983;
            bool _1987 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1989 = _1985 || _1987;
            if (!_1989)
            {
                _1883 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1991 = _1883;
            _1885 = _1991;
            if (!_1989)
            {
                _1889 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1993 = _1889;
            _1891 = _1993;
            if (!_1989)
            {
                _1895 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1995 = _1895;
            _1897 = _1995;
            if (!_1989)
            {
                _1901 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _1997 = _1901;
            _1903 = _1997;
            if (!_1989)
            {
                _1907 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _1999 = _1907;
            _1909 = _1999;
            if (!_1989)
            {
                _1915 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2001 = _1915;
            bool _2003 = !_1989;
            _1917 = _2001;
            if (!_2003)
            {
                bool _2005 = _777 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2007 = isnan(_777);
                bool _2009 = _2005 || _2007;
                bool _2011 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2013 = _2009 || _2011;
                if (!_2013)
                {
                    float _2015 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2017 = _777 + _2015;
                    float _2019 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2021 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2019;
                    float _2023 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2025 = _2023 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2027 = 1.0 / _2021;
                    float _2029 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2031 = _2029 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2033 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2035 = _2033 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2037 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2039 = _2037 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2041 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2043 = _2041 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2045 = _2017 * _2027;
                    float _2047 = precise::clamp(_2045, 0.0, 1.0);
                    float _2049 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2051 = _2049 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2053 = fma(_2047, _2025, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2055 = fma(_2047, _2051, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2057 = fma(_2047, _2031, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2059 = fma(_2047, _2035, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2061 = fma(_2047, _2039, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2063 = fma(_2047, _2043, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1891 = _2055;
                    _1909 = _2061;
                    _1885 = _2053;
                    _1903 = _2059;
                    _1897 = _2057;
                    _1917 = _2063;
                    _1979 = true;
                }
                else
                {
                    _1891 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1909 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1885 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1903 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1897 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1917 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1979 = false;
    float _2065 = _1891;
    float _2067 = _1909;
    float _2069 = _1885;
    float _2071 = _1903;
    float _2073 = _1897;
    float _2075 = _1917;
    float _2077 = fma(_1879, -0.5, 0.5);
    float _2079 = precise::clamp(_2077, 0.0, 1.0);
    float _2081 = -_2065;
    float _2083 = _2081 + _2067;
    float _2085 = -_2069;
    float _2087 = _2085 + _2071;
    float _2089 = -_2073;
    float _2091 = _2089 + _2075;
    bool _2093 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2095 = fma(_2079, _2083, _2065);
    float _2097 = fma(_2079, _2087, _2069);
    float _2099 = fma(_2079, _2091, _2073);
    float _2101 = _2095 * 0.586610972881317138671875;
    out.m_80.x = 0.0;
    float _2103 = fma(_2097, 0.298911988735198974609375, _2101);
    float _2105 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2107 = fma(_2099, 0.114477999508380889892578125, _2103);
    out.m_49.x = _2105;
    float _2109 = -_2107;
    float _2111 = _2097 + _2109;
    float _2113 = -_2107;
    float _2115 = _2095 + _2113;
    float _2117 = -_2107;
    float _2119 = _2099 + _2117;
    float _2121 = fma(_2111, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2107);
    float _2123 = fma(_2115, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2107);
    float _2125 = fma(_2119, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2107);
    out.m_82.x = _2121;
    out.m_82.y = _2123;
    out.m_82.z = _2125;
    if (!_2093)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2127 = -_747;
    float _2129 = _2127 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2131 = -_749;
    float _2133 = _2131 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2135 = -_751;
    float _2137 = _2135 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2139 = _2129 * _2129;
    float _2141 = fma(_2133, _2133, _2139);
    float _2143 = fma(_2137, _2137, _2141);
    float _2145 = sqrt(_2143);
    float _2147 = rsqrt(_2143);
    float _2149 = -_2145;
    float _2151 = _2149 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2153 = _2151 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2155 = precise::clamp(_2153, 0.0, 1.0);
    float _2157 = _2133 * _2147;
    float _2159 = _2129 * _2147;
    float _2161 = abs(_2155);
    float _2163 = log2(_2161);
    float _2165 = _2137 * _2147;
    float _2167 = _2157 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2169 = _1879 * _2159;
    float _2171 = -_2159;
    float _2173 = -_2167;
    float _2175 = fma(_2171, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2173);
    float _2177 = fma(_1877, _2157, _2169);
    float _2179 = -_2165;
    float _2181 = fma(_2179, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2175);
    float _2183 = fma(_1867, _2165, _2177);
    float _2185 = precise::clamp(_2183, 0.0, 1.0);
    float _2187 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2189 = _2181 + _2187;
    float _2191 = _2163 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2193 = _2189 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2195 = precise::clamp(_2193, 0.0, 1.0);
    float _2197 = exp2(_2191);
    float _2199 = _2197 * _2195;
    float _2201 = _2185 * _2199;
    float _2203 = _2201 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2205 = _2201 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2207 = _2201 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_80.x = _2203;
    out.m_80.y = _2205;
    out.m_80.z = _2207;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1979 = false;
    bool _293 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _96 = in.m_46.w;
    float _98 = trunc(_96);
    int _101 = int(_98);
    bool _105 = _101 >= 1;
    float _107 = 0.0;
    if (!_105)
    {
        _107 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _109 = _107;
    float _111 = _109;
    if (!_105)
    {
        out.m_49.x = 0.0;
    }
    int _113 = 0;
    if (!_105)
    {
        float _115 = _109 * 5.0;
        _113 = as_type<int>(_115);
    }
    int _117 = _113;
    int _119 = _117;
    if (!_105)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2264 = as_type<float>(_117);
        out.gl_Position.z = _2264;
    }
    if (!_105)
    {
        return out;
    }
    float _121 = in.m_51.w;
    bool _123 = _121 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _125 = isnan(_121);
    bool _127 = _123 || _125;
    bool _129 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _131 = _127 || _129;
    float _133 = -_121;
    float _135 = _133 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _137 = 0.0;
    if (_131)
    {
        float _139 = float(_101);
        _137 = _139;
    }
    float _141 = _137;
    bool _143 = _135 >= _141;
    bool _145 = !_131;
    bool _147 = _143 || _145;
    if (_147)
    {
        _111 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _149 = _111;
    if (_147)
    {
        out.m_49.x = 0.0;
    }
    if (_147)
    {
        float _151 = _149 * 5.0;
        _119 = as_type<int>(_151);
    }
    int _153 = _119;
    if (_147)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2332 = as_type<float>(_153);
        out.gl_Position.z = _2332;
    }
    if (_147)
    {
        return out;
    }
    float _155 = in.m_53.x;
    float _157 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _159 = _135 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _161 = in.m_55.x;
    float _163 = in.m_55.y;
    float _165 = in.m_55.z;
    float _167 = _159 * _157;
    float _169 = fma(_155, (*spvDescriptorSet0.vp_c9)._m0[20].x, _167);
    float _171 = _169 * 6.283185482025146484375;
    float _173 = floor(_169);
    int _175 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _177 = _175 != 0;
    float _179 = _163 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _181 = _171 * 0.15915493667125701904296875;
    float _183 = _163 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _185 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _187 = _185 != 0;
    int _189 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _191 = _189 != 0;
    float _193 = _163 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _195 = fma(_161, (*spvDescriptorSet0.vp_c10)._m0[4].x, _179);
    float _197 = fma(_161, (*spvDescriptorSet0.vp_c10)._m0[5].x, _183);
    float _199 = _181 * 6.283185482025146484375;
    float _201 = cos(_199);
    bool _203 = !_187;
    int _205 = _203 ? 0 : 1;
    float _207 = fma(_161, (*spvDescriptorSet0.vp_c10)._m0[6].x, _193);
    bool _209 = !_177;
    int _211 = _209 ? 0 : 1;
    float _213 = fma(_165, (*spvDescriptorSet0.vp_c10)._m0[4].z, _195);
    bool _215 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _217 = -_173;
    float _219 = _169 + _217;
    int _221 = abs(_205);
    bool _223 = !_191;
    int _225 = _223 ? 0 : 1;
    int _227 = abs(_211);
    float _229 = float(_221);
    float _231 = -_219;
    float _233 = fma(_231, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _235 = abs(_225);
    float _237 = fma(_201, 0.5, 0.5);
    float _239 = abs(_233);
    float _241 = _229 * _239;
    bool _243 = _219 < 0.5;
    float _245 = float(_243);
    float _247 = -_237;
    float _249 = fma(_247, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _251 = float(_227);
    float _253 = -_245;
    float _255 = fma(_253, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _257 = float(_235);
    float _259 = fma(_165, (*spvDescriptorSet0.vp_c10)._m0[6].z, _207);
    float _261 = fma(_251, _249, _241);
    float _263 = fma(_165, (*spvDescriptorSet0.vp_c10)._m0[5].z, _197);
    float _265 = abs(_255);
    float _267 = fma(_257, _265, _261);
    bool _269 = !_215;
    float _271 = _263;
    float _289;
    float _291;
    if (!_269)
    {
        float _273 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _275 = _155 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _277 = float(_101);
        float _279 = fma(_275, (*spvDescriptorSet0.vp_c9)._m0[12].x, _135);
        float _281 = _279 * _273;
        float _283 = floor(_281);
        float _285 = -_283;
        float _287 = _281 + _285;
        _289 = _287;
        _291 = _277;
        _293 = true;
    }
    else
    {
        float _295 = float(_101);
        float _297 = 1.0 / _295;
        float _299 = _135 * _297;
        _289 = _299;
        _291 = _295;
    }
    _293 = false;
    float _301 = _289;
    float _303 = _291;
    float _305 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _307 = _301 + _305;
    bool _309 = _301 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _311 = isnan(_301);
    bool _313 = _309 || _311;
    bool _315 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _317 = _313 || _315;
    float _319 = float(_317);
    float _321 = as_type<float>(int(gl_VertexIndex));
    float _323 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _325 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _323;
    float _327 = in.m_60.x;
    float _329 = in.m_60.y;
    float _331 = -_319;
    float _333 = _331 + 1.0;
    float _335 = 1.0 / _325;
    float _337 = _307 * _335;
    bool _339 = _301 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _341 = isnan(_301);
    bool _343 = _339 || _341;
    bool _345 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _347 = _343 || _345;
    float _349 = float(_347);
    float _351 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _353 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _351;
    float _355 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _357 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _355;
    int _359 = as_type<int>(_321) & 1;
    bool _361 = _359 != 0;
    int _363 = as_type<int>(_321) & 2;
    bool _365 = _363 != 0;
    float _367 = _349 * _333;
    float _369 = fma(_353, _337, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _371 = fma(_357, _337, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _373 = !_365;
    float _375 = _373 ? (-0.5) : 0.5;
    float _377 = _369 * _367;
    float _379 = _371 * _367;
    float _381 = -_349;
    float _383 = _381 + 1.0;
    bool _385 = !_361;
    float _387 = _385 ? (-0.5) : 0.5;
    float _389 = in.m_46.x;
    float _391 = in.m_46.y;
    float _393 = in.m_46.z;
    float _395 = fma(_383, (*spvDescriptorSet0.vp_c9)._m0[143].y, _379);
    float _397 = fma(_383, (*spvDescriptorSet0.vp_c9)._m0[143].x, _377);
    float _399 = fma(_319, (*spvDescriptorSet0.vp_c9)._m0[144].y, _395);
    float _401 = fma(_319, (*spvDescriptorSet0.vp_c9)._m0[144].x, _397);
    float _403 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _405 = _399 * _329;
    float _407 = _401 * _327;
    float _409 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _387);
    float _411 = _267 * _405;
    float _413 = _267 * _407;
    float _415 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _375);
    float _417 = _411 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _419 = _413 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _421 = _417 * _415;
    float _423 = _419 * _409;
    float _425 = _391 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _427 = _391 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _429 = _421 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _431 = _421 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _433 = fma(_389, (*spvDescriptorSet0.vp_c10)._m0[6].x, _425);
    float _435 = fma(_389, (*spvDescriptorSet0.vp_c10)._m0[4].x, _427);
    float _437 = fma(_423, (*spvDescriptorSet0.vp_c8)._m0[26].x, _429);
    float _439 = fma(_423, (*spvDescriptorSet0.vp_c8)._m0[24].x, _431);
    float _441 = fma(_393, (*spvDescriptorSet0.vp_c10)._m0[6].z, _433);
    float _443 = fma(_393, (*spvDescriptorSet0.vp_c10)._m0[4].z, _435);
    float _445 = fma(_403, (*spvDescriptorSet0.vp_c8)._m0[26].z, _437);
    float _447 = fma(_403, (*spvDescriptorSet0.vp_c8)._m0[24].z, _439);
    float _449 = _441 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _451 = _443 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _453 = _445 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _455 = _447 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _457 = _391 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _459 = _421 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _461 = _449 + _453;
    float _463 = _451 + _455;
    float _465 = fma(_389, (*spvDescriptorSet0.vp_c10)._m0[5].x, _457);
    float _467 = fma(_423, (*spvDescriptorSet0.vp_c8)._m0[25].x, _459);
    float _469 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _471 = _461 + _469;
    float _473 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _475 = _463 + _473;
    float _477 = fma(_393, (*spvDescriptorSet0.vp_c10)._m0[5].z, _465);
    float _479 = fma(_403, (*spvDescriptorSet0.vp_c8)._m0[25].z, _467);
    float _481 = _471 * _471;
    float _483 = _479 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _485 = fma(_475, _475, _481);
    float _487 = _477 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _489 = sqrt(_485);
    float _491 = _487 + _483;
    bool _493 = _489 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _495 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _497 = _495 != 0;
    int _499 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _501 = _499 != 0;
    int _503 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _505 = _503 != 0;
    bool _507 = !_501;
    int _509 = _507 ? 0 : 1;
    bool _511 = !_497;
    int _513 = _511 ? 0 : 1;
    bool _515 = !_505;
    int _517 = _515 ? 0 : 1;
    float _519 = _477;
    float _521 = _461;
    float _523 = _459;
    float _525 = _479;
    if (!_493)
    {
        _519 = _463;
    }
    float _527 = _519;
    float _529 = 0.0;
    float _531 = _527;
    if (!_493)
    {
        _529 = _491;
    }
    float _533 = _529;
    bool _535 = !_493;
    float _537 = _533;
    if (!_535)
    {
        float _539 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _541 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _543 = _489 + _541;
        float _545 = _491 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _547 = rsqrt(_485);
        float _549 = _543 * _539;
        float _551 = _549 * 0.15915493667125701904296875;
        float _553 = _551 * 6.283185482025146484375;
        float _555 = cos(_553);
        float _557 = _551 * 6.283185482025146484375;
        float _559 = sin(_557);
        float _561 = _555 + (-1.0);
        float _563 = _561 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _565 = fma(_559, _545, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _567 = fma(_491, _555, _563);
        float _569 = _547 * _565;
        float _571 = fma(_475, _569, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _573 = fma(_471, _569, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _537 = _567;
        _531 = _571;
        _521 = _573;
        _523 = _551;
        _525 = _547;
    }
    float _575 = _537;
    float _577 = _531;
    float _579 = _521;
    float _581 = _523;
    float _583 = _525;
    float _585 = -_487;
    float _587 = _585 + _575;
    float _589 = -_451;
    float _591 = _589 + _577;
    float _593 = -_449;
    float _595 = _593 + _579;
    float _597 = _587 * _587;
    bool _599 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _601 = isnan(0.5);
    bool _603 = _599 || _601;
    bool _605 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _607 = _603 || _605;
    float _609 = fma(_591, _591, _597);
    float _611 = fma(_595, _595, _609);
    float _613 = sqrt(_611);
    bool _615 = _613 > 0.0;
    bool _617 = !_615;
    float _619 = _577;
    float _621 = _579;
    float _623 = _575;
    float _625 = _583;
    float _627 = _581;
    if (!_617)
    {
        float _629 = _263 * _263;
        float _631 = fma(_213, _213, _629);
        float _633 = rsqrt(_611);
        float _635 = fma(_259, _259, _631);
        float _637 = sqrt(_635);
        float _639 = _591 * _633;
        float _641 = _587 * _633;
        float _643 = _595 * _633;
        bool _645 = _637 > 0.0;
        bool _647 = !_645;
        _625 = _635;
        _627 = _637;
        if (!_647)
        {
            float _649 = rsqrt(_635);
            float _651 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _653 = _263 * _649;
            float _655 = _213 * _649;
            float _657 = _259 * _649;
            float _659 = _641 * _653;
            float _661 = fma(_639, _655, _659);
            float _663 = _651 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _665 = fma(_643, _657, _661);
            float _667 = _665 * _663;
            float _669 = fma(_213, _667, _577);
            float _671 = fma(_263, _667, _575);
            float _673 = fma(_259, _667, _579);
            _619 = _669;
            _621 = _673;
            _623 = _671;
            _627 = _653;
        }
    }
    float _675 = _619;
    float _677 = _621;
    float _679 = _623;
    float _681 = _625;
    float _683 = _627;
    float _685 = _679;
    float _687 = _677;
    float _689 = _681;
    float _691 = _683;
    if (_607)
    {
        _271 = _675;
    }
    float _693 = _271;
    float _695 = _693;
    if (!_607)
    {
        float _697 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _699 = _487 + _697;
        float _701 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _703 = _451 + _701;
        float _705 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _707 = -_451;
        float _709 = _707 + _675;
        float _711 = _699 * _699;
        float _713 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _715 = _449 + _713;
        float _717 = -_449;
        float _719 = _717 + _677;
        float _721 = fma(_703, _703, _711);
        float _723 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _725 = fma(_715, _715, _721);
        float _727 = sqrt(_725);
        float _729 = _705 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _731 = precise::min(_727, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _733 = _731 * _723;
        float _735 = _729 * _733;
        float _737 = -_487;
        float _739 = _737 + _679;
        float _741 = fma(_709, _735, _451);
        float _743 = fma(_739, _735, _487);
        float _745 = fma(_719, _735, _449);
        _685 = _743;
        _695 = _741;
        _687 = _745;
        _689 = _723;
    }
    float _747 = _685;
    float _749 = _695;
    float _751 = _687;
    float _753 = _689;
    float _755 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _757 = _747 + _755;
    float _759 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _761 = _749 + _759;
    float _763 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _765 = _751 + _763;
    float _767 = _757 * _757;
    float _769 = fma(_761, _761, _767);
    float _771 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _773 = fma(_765, _765, _769);
    float _775 = rsqrt(_773);
    float _777 = sqrt(_773);
    float _779 = _775 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _781 = _761 * _779;
    float _783 = _765 * _779;
    float _785 = _781 * _781;
    float _787 = _783 * _783;
    float _789 = _785 + _787;
    float _791 = sqrt(_789);
    bool _793 = _791 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _795 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _797 = _791 + _795;
    float _799 = _775;
    float _801 = _797;
    float _803 = _753;
    float _805 = _757;
    if (_793)
    {
        float _807 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _799 = _807;
    }
    float _809 = _799;
    float _811 = _809;
    if (_793)
    {
        float _813 = _797 * _809;
        _801 = _813;
    }
    float _815 = _801;
    if (_793)
    {
        float _817 = rsqrt(_789);
        _811 = _817;
    }
    float _819 = _811;
    float _821 = _819;
    if (_793)
    {
        float _823 = _815 * 0.15915493667125701904296875;
        _803 = _823;
    }
    float _825 = _803;
    float _827 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _829 = _765;
    float _831 = _825;
    if (_793)
    {
        float _833 = _825 * 6.283185482025146484375;
        float _835 = sin(_833);
        _829 = _835;
    }
    float _837 = _829;
    float _839 = precise::max(0.0, _827);
    float _841 = _259;
    if (_793)
    {
        float _843 = _825 * 6.283185482025146484375;
        float _845 = cos(_843);
        _841 = _845;
    }
    float _847 = _841;
    float _849 = -_779;
    float _851 = -_839;
    float _853 = fma(_757, _849, _851);
    float _855 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_793)
    {
        float _857 = _853 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _805 = _857;
    }
    float _859 = _805;
    float _861 = fma(_451, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    if (!_793)
    {
        _855 = _853;
    }
    float _863 = _855;
    float _865 = _837;
    float _867 = _863;
    if (_793)
    {
        float _869 = fma(_837, _859, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _691 = _869;
    }
    float _871 = _691;
    float _873 = floor(_861);
    float _875 = 0.0;
    float _877 = _871;
    if (_793)
    {
        float _879 = _819 * _871;
        _875 = _879;
    }
    float _881 = _875;
    if (!_793)
    {
        _821 = _781;
    }
    float _883 = _821;
    float _885 = _883;
    if (_793)
    {
        float _887 = _847 + (-1.0);
        _865 = _887;
    }
    float _889 = _865;
    float _891 = _889;
    if (_793)
    {
        float _893 = _781 * _881;
        _885 = _893;
    }
    float _895 = _885;
    if (!_793)
    {
        _877 = _783;
    }
    float _897 = _877;
    float _899 = _897;
    if (_793)
    {
        float _901 = _783 * _881;
        _899 = _901;
    }
    float _903 = _899;
    if (_793)
    {
        float _905 = _889 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _831 = _905;
    }
    float _907 = _831;
    float _909 = _907;
    if (!_793)
    {
        _891 = _785;
    }
    float _911 = _891;
    float _913 = _911;
    if (_793)
    {
        float _915 = _895 * _895;
        _913 = _915;
    }
    float _917 = _913;
    float _919 = _747 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    if (_793)
    {
        float _921 = fma(_853, _847, _907);
        _867 = _921;
    }
    float _923 = _867;
    if (!_793)
    {
        _909 = _787;
    }
    float _925 = _909;
    float _927 = _925;
    if (_793)
    {
        float _929 = _903 * _903;
        _927 = _929;
    }
    float _931 = _927;
    float _933 = fma(_749, (*spvDescriptorSet0.vp_c8)._m0[1].x, _919);
    float _935 = fma(_923, _923, _917);
    float _937 = _747 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _939 = fma(_751, (*spvDescriptorSet0.vp_c8)._m0[1].z, _933);
    float _941 = _935 + _931;
    float _943 = _747 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _945 = _747 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _947 = fma(_749, (*spvDescriptorSet0.vp_c8)._m0[2].x, _937);
    float _949 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _951 = fma(_777, (*spvDescriptorSet0.vp_c15)._m0[23].w, _949);
    float _953 = precise::clamp(_951, 0.0, 1.0);
    float _955 = fma(_749, (*spvDescriptorSet0.vp_c8)._m0[0].x, _943);
    float _957 = rsqrt(_941);
    float _959 = _939 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _961 = fma(_749, (*spvDescriptorSet0.vp_c8)._m0[3].x, _945);
    float _963 = fma(_751, (*spvDescriptorSet0.vp_c8)._m0[0].z, _955);
    float _965 = fma(_751, (*spvDescriptorSet0.vp_c8)._m0[2].z, _947);
    float _967 = -_953;
    float _969 = _967 + 1.0;
    float _971 = _959 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _973 = _963 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _975 = _965 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _977 = fma(_751, (*spvDescriptorSet0.vp_c8)._m0[3].z, _961);
    float _979 = fma(_973, (*spvDescriptorSet0.vp_c8)._m0[7].x, _971);
    float _981 = abs(_969);
    float _983 = log2(_981);
    float _985 = _977 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _987 = _975 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _989 = fma(_975, (*spvDescriptorSet0.vp_c8)._m0[7].z, _979);
    float _991 = _957 * _895;
    float _993 = fma(_449, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _995 = _957 * _903;
    float _997 = fma(_985, (*spvDescriptorSet0.vp_c8)._m0[7].w, _989);
    float _999 = _957 * _923;
    float _1001 = _991 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1003 = floor(_993);
    float _1005 = -_987;
    float _1007 = fma(_1005, _771, 1.0);
    float _1009 = _959 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1011 = -_1001;
    float _1013 = fma(_999, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1011);
    float _1015 = _983 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1017 = -_995;
    float _1019 = fma(_1017, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1013);
    float _1021 = log2(_1007);
    float _1023 = fma(_1019, -0.5, 0.5);
    float _1025 = fma(_1019, 0.5, 0.5);
    float _1027 = exp2(_1015);
    float _1029 = -_873;
    float _1031 = _861 + _1029;
    float _1033 = _959 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1035 = -_1003;
    float _1037 = _993 + _1035;
    float _1039 = fma(_973, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1009);
    float _1041 = fma(_973, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1033);
    float _1043 = _999 + 1.0;
    float _1045 = 1.0 / _997;
    float _1047 = fma(_1025, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1049 = fma(_975, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1041);
    float _1051 = fma(_975, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1039);
    float _1053 = _1021 * 0.693147182464599609375;
    float _1055 = fma(_1025, _1047, -0.212114393711090087890625);
    float _1057 = fma(_985, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1049);
    float _1059 = sqrt(_1023);
    float _1061 = -_999;
    float _1063 = fma(_1027, _1043, _1061);
    float _1065 = fma(_985, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1051);
    float _1067 = fma(_1025, _1055, 1.570728778839111328125);
    float _1069 = _1053 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1071 = fma(_1063, 0.5, 0.5);
    float _1073 = _1057 * _1045;
    float _1075 = _1065 * _1045;
    float _1077 = fma(_1073, 0.5, 0.5);
    float _1079 = fma(_1075, -0.5, 0.5);
    float _1081 = _1059 * 0.636619746685028076171875;
    float2 _3803 = float2(_1031, _1037);
    float _1083 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_3803, float2(0.0), isnan(_3803)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_3803, float2(0.0), isnan(_3803)), level(0.0)).x;
    float3 _3814 = float3(_1077, _1079, _1069);
    float _1085 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3814, float3(0.0), isnan(_3814)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3814, float3(0.0), isnan(_3814)), level(0.0)).x;
    float _1087 = -_1067;
    float _1089 = fma(_1081, _1087, 1.0);
    float3 _3830 = float3(_1077, _1079, _1069);
    float4 _1092 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3830, float3(0.0), isnan(_3830)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3830, float3(0.0), isnan(_3830)), level(0.0)).xyzw;
    float _1094 = _1092.x;
    float _1096 = _1092.y;
    float _1098 = _1092.z;
    float _1100 = _1092.w;
    float2 _3846 = float2(_1089, _1071);
    float3 _1104 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3846, float2(0.0), isnan(_3846)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3846, float2(0.0), isnan(_3846)), level(0.0)).xyz;
    float _1106 = _1104.x;
    float _1108 = _1104.y;
    float _1110 = _1104.z;
    float _1112 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1114 = int(_1112);
    int _1116 = abs(_513);
    float _1118 = _983 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1120 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1122 = int(_1120);
    float _1124 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1126 = float(_1114);
    float _1128 = 1.0 / _303;
    float _1130 = float(uint(_1122));
    float _1132 = 1.0 / _1126;
    int _1134 = ~_1122;
    int _1136 = _1134 + 1;
    int _1138 = ~_1122;
    int _1140 = _1138 + 1;
    float _1142 = 1.0 / _1130;
    float _1144 = _135 * _1132;
    int _1146 = ~_1122;
    int _1148 = _1146 + 1;
    float _1150 = exp2(_1118);
    float _1152 = float(_1122);
    int _1154 = as_type<int>(_1142) + (-2);
    float _1156 = trunc(_1144);
    int _1158 = int(_1156);
    float _1160 = -_1150;
    float _1162 = _1160 + 1.0;
    float _1164 = float(uint(_1158));
    float _1166 = float(_1158);
    float _1168 = as_type<float>(_1154) * _1164;
    bool _1170 = _1166 >= _1152;
    bool _1172 = isnan(_1166);
    bool _1174 = _1170 || _1172;
    bool _1176 = isnan(_1152);
    bool _1178 = _1174 || _1176;
    float _1180 = float(_1178);
    float _1182 = trunc(_1168);
    float _1184 = precise::max(_1182, 0.0);
    uint _1187 = uint(_1184);
    float _1189 = trunc(_1180);
    int _1191 = int(_1189);
    int _1193 = _1148 * int(_1187);
    int _1195 = _1193 + _1158;
    float _1197 = float(uint(_1195));
    int _1199 = ~_1191;
    int _1201 = _1199 + 1;
    int _1203 = _1201 + 1;
    float _1205 = as_type<float>(_1154) * _1197;
    int _1207 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1209 = _1207 != 0;
    float _1211 = trunc(_1205);
    float _1213 = precise::max(_1211, 0.0);
    uint _1215 = uint(_1213);
    bool _1217 = !_1209;
    float _1219 = _1217 ? 7.345489978790283203125 : 1.0;
    float _1221 = _1219 * _155;
    float _1223 = floor(_1221);
    int _1225 = int(_1187) + int(_1215);
    int _1227 = _1136 * _1225;
    int _1229 = _1227 + _1158;
    bool _1231 = uint(_1229) >= uint(_1122);
    float _1233 = -_1223;
    float _1235 = _1221 + _1233;
    bool _1237 = !_1231;
    int _1239 = _1237 ? 0 : (-1);
    float _1241 = _1235 * _1152;
    float _1243 = _135 * _1152;
    bool _1245 = _1122 == 0;
    int _1247 = ~_1225;
    int _1249 = _1247 + _1239;
    int _1251 = _1249 + 1;
    float _1253 = _1243 * _1128;
    int _1255 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1257 = _1255 != 0;
    float _1259 = trunc(_1241);
    int _1261 = int(_1259);
    int _1263 = _1122 + (-1);
    int _1265 = _1122 * _1251;
    int _1267 = _1265 + _1158;
    int _1269 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1271 = _1269 != 0;
    int _1273 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1275 = _1273 != 0;
    bool _1277 = !_1245;
    int _1279 = _1277 ? _1267 : (-1);
    float _1281 = trunc(_1253);
    int _1283 = int(_1281);
    bool _1285 = !_1257;
    int _1287 = _1285 ? 0 : 1;
    int _1289 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1291 = _1289 != 0;
    int _1293 = _1279 * _1203;
    int _1295 = abs(_509);
    int _1297 = abs(_1287);
    int _1299 = _1191 * _1263;
    int _1301 = _1299 + _1293;
    bool _1303 = !_1291;
    int _1305 = _1303 ? 0 : 1;
    int _1307 = _1261 * _1297;
    int _1309 = _1307 + _1158;
    int _1311 = abs(_517);
    int _1313 = _1301 * _1295;
    int _1315 = abs(_1305);
    int _1317 = _1283 * _1116;
    int _1319 = _1317 + _1313;
    int _1321 = _1309 * _1311;
    int _1323 = _1321 + _1319;
    int _1325 = ~_1122;
    int _1327 = _1325 + 1;
    float _1329 = in.m_53.y;
    int _1331 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1333 = _1331 != 0;
    int _1335 = _1261 * _1315;
    int _1337 = _1335 + _1323;
    float _1339 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1341 = float(uint(_1337));
    float _1343 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1345 = as_type<float>(_1154) * _1341;
    float _1347 = fma(_155, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1343);
    float _1349 = trunc(_1345);
    float _1351 = precise::max(_1349, 0.0);
    uint _1353 = uint(_1351);
    bool _1355 = _1329 > 0.5;
    int _1357 = _1327 * int(_1353);
    int _1359 = _1357 + _1337;
    float _1361 = float(uint(_1359));
    float _1363 = _487 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1365 = _487 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1367 = as_type<float>(_1154) * _1361;
    float _1369 = fma(_451, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1363);
    float _1371 = fma(_451, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1365);
    int _1373 = ~_1122;
    int _1375 = _1373 + 1;
    float _1377 = fma(_449, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1369);
    float _1379 = trunc(_1367);
    float _1381 = precise::max(_1379, 0.0);
    uint _1383 = uint(_1381);
    float _1385 = fma(_449, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1371);
    float _1387 = float(uint(_1309));
    float _1389 = _1377 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1391 = _1385 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1393 = 1.0 / _1389;
    float _1395 = _1391 + _1389;
    int _1397 = int(_1353) + int(_1383);
    float _1399 = as_type<float>(_1154) * _1387;
    float _1401 = trunc(_1399);
    float _1403 = precise::max(_1401, 0.0);
    uint _1405 = uint(_1403);
    int _1407 = _1375 * _1397;
    int _1409 = _1407 + _1337;
    float _1411 = _1395 * _1393;
    float _1413 = _1411 * 0.5;
    float _1415 = _155 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _1417 = uint(_1409) >= uint(_1122);
    float _1419 = -_1339;
    float _1421 = fma(_1415, 2.0, _1419);
    float _1423 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1425 = fma(_1413, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1423);
    bool _1427 = !_1417;
    int _1429 = _1427 ? 0 : (-1);
    bool _1431 = _155 > 0.5;
    float _1433 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _1435 = ~_1397;
    int _1437 = _1435 + _1429;
    int _1439 = _1437 + 1;
    float _1441 = 1.0 / _1425;
    int _1443 = _1375 * int(_1405);
    int _1445 = _1443 + _1309;
    float _1447 = _1329 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _1449 = _1122 * _1439;
    int _1451 = _1449 + _1337;
    float _1453 = fma(_1447, -2.0, _1124);
    float _1455 = float(uint(_1445));
    float _1457 = fma(_1329, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1433);
    bool _1459 = !_1245;
    int _1461 = _1459 ? _1451 : (-1);
    float _1463 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1465 = as_type<float>(_1154) * _1455;
    int _1467 = _1461 >> 31;
    float _1469 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1471 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1473 = _1441 * _1471;
    int _1475 = _1467 & 3;
    float _1477 = trunc(_1465);
    float _1479 = precise::max(_1477, 0.0);
    uint _1481 = uint(_1479);
    float _1483 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1485 = -_135;
    float _1487 = fma(_1485, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1421);
    int _1489 = _1461 + _1475;
    float _1491 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1493 = abs(_1473);
    float _1495 = log2(_1493);
    float _1497 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1499 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1501 = _1463 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1503 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1505 = _1469 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1507 = _1483 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1509 = _1491 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1511 = int(_1405) + int(_1481);
    float _1513 = _1497 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1515 = _1489 >> 2;
    float _1517 = _1499 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_62.x = _1501;
    out.m_62.y = _1505;
    out.m_62.z = _1507;
    out.m_62.w = _1503;
    float _1519 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1347);
    int _1521 = _1515 << 4;
    int _1523 = _1521 + 368;
    float _1525 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1453);
    out.m_64.x = _1509;
    out.m_64.y = _1513;
    out.m_64.z = _1517;
    float _1527 = _1495 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1529 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1457);
    int _1531 = _1140 * _1511;
    int _1533 = _1531 + _1309;
    float _1535 = exp2(_1527);
    bool _1537 = _1473 <= 8000.0;
    bool _1539 = isnan(_1473);
    bool _1541 = _1537 || _1539;
    bool _1543 = isnan(8000.0);
    bool _1545 = _1541 || _1543;
    float _1547 = float(_1545);
    float _1549 = -_1083;
    float _1551 = _1549 + 1.0;
    float _1553 = -_1519;
    float _1555 = _1553 + 1.0;
    float _1557 = -_1529;
    float _1559 = _1557 + 1.0;
    uint _1561 = uint(int(uint(_1523) >> uint(2)));
    uint _1563 = uint(int(uint(int(_1561)) >> uint(2)));
    int _1565 = int(_1561) & 3;
    float _1567 = (*spvDescriptorSet0.vp_c9)._m0[int(_1563)][_1565];
    int _1569 = int(_1561) + 1;
    uint _1571 = uint(int(uint(_1569) >> uint(2)));
    int _1573 = _1569 & 3;
    float _1575 = (*spvDescriptorSet0.vp_c9)._m0[int(_1571)][_1573];
    float _1577 = -_387;
    int _1579 = _1431 ? as_type<int>(_1577) : as_type<int>(_387);
    float _1581 = _375 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1583 = -_375;
    int _1585 = _1355 ? as_type<int>(_1583) : as_type<int>(_375);
    bool _1587 = uint(_1533) >= uint(_1122);
    float _1589 = _1581 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    bool _1591 = !_1275;
    float _1593 = _1591 ? _375 : as_type<float>(_1585);
    float _1595 = _387 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _1597 = !_1271;
    float _1599 = _1597 ? _387 : as_type<float>(_1579);
    float _1601 = _1581 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _1603 = _1523 + 8;
    uint _1605 = uint(int(uint(_1603) >> uint(2)));
    uint _1607 = uint(int(uint(int(_1605)) >> uint(2)));
    int _1609 = int(_1605) & 3;
    float _1611 = (*spvDescriptorSet0.vp_c9)._m0[int(_1607)][_1609];
    int _1613 = int(_1605) + 1;
    uint _1615 = uint(int(uint(_1613) >> uint(2)));
    int _1617 = _1613 & 3;
    float _1619 = (*spvDescriptorSet0.vp_c9)._m0[int(_1615)][_1617];
    int _1621 = _1461 & 3;
    bool _1623 = _1621 != 0;
    float _1625 = _1581 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1627 = fma(_1595, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1601);
    int _1629 = _1461 & 3;
    bool _1631 = _1629 != 0;
    float _1633 = fma(_1535, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1635 = precise::clamp(_1633, 0.0, 1.0);
    bool _1637 = uint(_1621) > 1u;
    float _1639 = fma(_1595, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1589);
    float _1641 = _1599 + 0.5;
    int _1643 = _1631 ? 0 : 1;
    float _1645 = fma(_1595, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1625);
    bool _1647 = _1621 != 3;
    float _1649 = fma(_1635, -2.0, 3.0);
    float _1651 = _1635 * _1635;
    int _1653 = ~_1643;
    int _1655 = _1653 + 1;
    int _1657 = _1655 + 1;
    float _1659 = fma(_1641, (*spvDescriptorSet0.vp_c9)._m0[80].x, _1487);
    bool _1661 = !_1587;
    int _1663 = _1661 ? 0 : (-1);
    float _1665 = _1651 * _1649;
    int _1667 = _1657;
    float _1669 = _1094;
    float _1671 = _1096;
    float _1673 = _1627;
    float _1675 = _1639;
    float _1677 = _1645;
    float _1679 = _997;
    if (!_1637)
    {
        int _1681 = ~_1643;
        int _1683 = _1681 + 1;
        _1667 = _1683;
    }
    int _1685 = _1667;
    float _1687 = -_1555;
    float _1689 = fma(_1599, _1687, _1659);
    bool _1691 = uint(_1621) >= 2u;
    int _1693 = abs(_1685);
    bool _1695 = !_1623;
    int _1697 = _1695 ? 0 : 1;
    int _1699 = _1691 ? 0 : 1;
    bool _1701 = _1621 != 3;
    int _1703 = ~_1699;
    int _1705 = _1703 + 1;
    int _1707 = _1705 + 1;
    bool _1709 = !_1701;
    int _1711 = _1709 ? 0 : (-1);
    int _1713 = abs(_1697);
    int _1715 = _1707;
    if (_1647)
    {
        int _1717 = ~_1699;
        int _1719 = _1717 + 1;
        _1715 = _1719;
    }
    int _1721 = _1715;
    int _1723 = ~_1693;
    int _1725 = _1723 + 1;
    int _1727 = _1725 + 1;
    int _1729 = abs(_1711);
    int _1731 = abs(_1721);
    int _1733 = _1727 * as_type<int>(_1575);
    bool _1735 = !_1333;
    int _1737 = _1735 ? 0 : 1;
    int _1739 = ~_1713;
    int _1741 = _1739 + 1;
    int _1743 = _1741 + 1;
    int _1745 = abs(_1737);
    int _1747 = _1743 * as_type<int>(_1567);
    int _1749 = _1747 + _1733;
    int _1751 = ~_1731;
    int _1753 = _1751 + 1;
    int _1755 = _1753 + 1;
    int _1757 = ~_1511;
    int _1759 = _1757 + _1663;
    int _1761 = _1759 + 1;
    int _1763 = _1755 * as_type<int>(_1611);
    int _1765 = _1763 + _1749;
    int _1767 = ~_1729;
    int _1769 = _1767 + 1;
    int _1771 = _1769 + 1;
    float _1773 = _959 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _1775 = _1122 * _1761;
    int _1777 = _1775 + _1309;
    int _1779 = ~_1745;
    int _1781 = _1779 + 1;
    int _1783 = _1781 + 1;
    float _1785 = -_1665;
    float _1787 = _1785 + 1.0;
    int _1789 = _1771 * as_type<int>(_1619);
    int _1791 = _1789 + _1765;
    float _1793 = fma(_973, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1773);
    bool _1795 = !_1245;
    int _1797 = _1795 ? _1777 : (-1);
    float _1799 = fma(_1787, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1665);
    int _1801 = _1791 * _1783;
    float _1803 = fma(_975, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1793);
    float _1805 = _1547 * _1799;
    int _1807 = _1797 * _1745;
    int _1809 = _1807 + _1801;
    float _1811 = fma(_985, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1803);
    float _1813 = _1162 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1815 = in.m_66.x;
    float _1817 = _1805 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _1819 = _1593 + (-0.5);
    float _1821 = _1811 + _997;
    float _1823 = _1813 * _1085;
    float _1825 = _1551 * _1817;
    float _1827 = precise::clamp(_1825, 0.0, 1.0);
    float _1829 = -_1819;
    float _1831 = -_1525;
    float _1833 = fma(_1829, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1831);
    float _1835 = _1821 * 0.5;
    float _1837 = -_1827;
    float _1839 = fma(_1837, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    out.gl_Position.x = _1057;
    out.gl_Position.y = _1065;
    out.gl_Position.z = _1811;
    out.gl_Position.w = _997;
    float _1841 = _1110 * _1823;
    float _1843 = fma(_1593, _1559, _1833);
    float _1845 = float(_1809);
    out.m_68.z = _1835;
    out.m_68.w = _997;
    float _1847 = fma(_1100, _1841, _1098);
    bool _1849 = _777 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1851 = isnan(_777);
    bool _1853 = _1849 || _1851;
    bool _1855 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1857 = _1853 || _1855;
    out.m_70.x = _1689;
    out.m_70.y = _1843;
    out.m_72.x = _1845;
    float _1859 = _1100 * _1823;
    float _1861 = -_1813;
    float _1863 = _1861 + 1.0;
    float _1865 = _1839 * _1815;
    float _1867 = _1645 + (*spvDescriptorSet0.vp_c8)._m0[26].z;
    float _1869 = fma(_1106, _1859, _1094);
    float _1871 = fma(_1108, _1859, _1096);
    float _1873 = _1100 * _1863;
    float _1875 = _1865 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _1877 = _1627 + (*spvDescriptorSet0.vp_c8)._m0[24].z;
    float _1879 = _1639 + (*spvDescriptorSet0.vp_c8)._m0[25].z;
    if (!_1857)
    {
        _1669 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1881 = _1669;
    out.m_74.x = _1869;
    out.m_74.y = _1871;
    out.m_74.z = _1847;
    out.m_74.w = _1873;
    float _1883 = _1881;
    float _1885 = _1881;
    if (!_1857)
    {
        _1671 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1887 = _1671;
    float _1889 = _1887;
    float _1891 = _1887;
    if (!_1857)
    {
        _1673 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1893 = _1673;
    out.m_76.x = _1875;
    float _1895 = _1893;
    float _1897 = _1893;
    if (!_1857)
    {
        _1675 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1899 = _1675;
    float _1901 = _1899;
    float _1903 = _1899;
    if (!_1857)
    {
        _1677 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1905 = _1677;
    out.m_78.x = _1877;
    out.m_78.y = _1879;
    out.m_78.z = _1867;
    float _1907 = _1905;
    float _1909 = _1905;
    if (!_1857)
    {
        _1679 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1911 = _1679;
    bool _1913 = !_1857;
    float _1915 = _1911;
    float _1917 = _1911;
    if (!_1913)
    {
        bool _1919 = _777 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1921 = isnan(_777);
        bool _1923 = _1919 || _1921;
        bool _1925 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1927 = _1923 || _1925;
        if (!_1927)
        {
            float _1929 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1931 = _777 + _1929;
            float _1933 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1935 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1933;
            float _1937 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1939 = _1937 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1941 = 1.0 / _1935;
            float _1943 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1945 = _1943 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1947 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1949 = _1947 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1951 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1953 = _1951 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1955 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1957 = _1955 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1959 = _1931 * _1941;
            float _1961 = precise::clamp(_1959, 0.0, 1.0);
            float _1963 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1965 = _1963 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1967 = fma(_1961, _1939, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1969 = fma(_1961, _1965, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1971 = fma(_1961, _1945, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1973 = fma(_1961, _1949, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1975 = fma(_1961, _1953, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1977 = fma(_1961, _1957, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1891 = _1969;
            _1909 = _1975;
            _1885 = _1967;
            _1903 = _1973;
            _1897 = _1971;
            _1917 = _1977;
            _1979 = true;
        }
        else
        {
            bool _1981 = _777 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1983 = isnan(_777);
            bool _1985 = _1981 || _1983;
            bool _1987 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1989 = _1985 || _1987;
            if (!_1989)
            {
                _1883 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1991 = _1883;
            _1885 = _1991;
            if (!_1989)
            {
                _1889 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1993 = _1889;
            _1891 = _1993;
            if (!_1989)
            {
                _1895 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1995 = _1895;
            _1897 = _1995;
            if (!_1989)
            {
                _1901 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _1997 = _1901;
            _1903 = _1997;
            if (!_1989)
            {
                _1907 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _1999 = _1907;
            _1909 = _1999;
            if (!_1989)
            {
                _1915 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2001 = _1915;
            bool _2003 = !_1989;
            _1917 = _2001;
            if (!_2003)
            {
                bool _2005 = _777 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2007 = isnan(_777);
                bool _2009 = _2005 || _2007;
                bool _2011 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2013 = _2009 || _2011;
                if (!_2013)
                {
                    float _2015 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2017 = _777 + _2015;
                    float _2019 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2021 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2019;
                    float _2023 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2025 = _2023 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2027 = 1.0 / _2021;
                    float _2029 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2031 = _2029 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2033 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2035 = _2033 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2037 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2039 = _2037 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2041 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2043 = _2041 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2045 = _2017 * _2027;
                    float _2047 = precise::clamp(_2045, 0.0, 1.0);
                    float _2049 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2051 = _2049 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2053 = fma(_2047, _2025, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2055 = fma(_2047, _2051, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2057 = fma(_2047, _2031, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2059 = fma(_2047, _2035, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2061 = fma(_2047, _2039, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2063 = fma(_2047, _2043, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1891 = _2055;
                    _1909 = _2061;
                    _1885 = _2053;
                    _1903 = _2059;
                    _1897 = _2057;
                    _1917 = _2063;
                    _1979 = true;
                }
                else
                {
                    _1891 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1909 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1885 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1903 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1897 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1917 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1979 = false;
    float _2065 = _1891;
    float _2067 = _1909;
    float _2069 = _1885;
    float _2071 = _1903;
    float _2073 = _1897;
    float _2075 = _1917;
    float _2077 = fma(_1879, -0.5, 0.5);
    float _2079 = precise::clamp(_2077, 0.0, 1.0);
    float _2081 = -_2065;
    float _2083 = _2081 + _2067;
    float _2085 = -_2069;
    float _2087 = _2085 + _2071;
    float _2089 = -_2073;
    float _2091 = _2089 + _2075;
    bool _2093 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2095 = fma(_2079, _2083, _2065);
    float _2097 = fma(_2079, _2087, _2069);
    float _2099 = fma(_2079, _2091, _2073);
    float _2101 = _2095 * 0.586610972881317138671875;
    out.m_80.x = 0.0;
    float _2103 = fma(_2097, 0.298911988735198974609375, _2101);
    float _2105 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2107 = fma(_2099, 0.114477999508380889892578125, _2103);
    out.m_49.x = _2105;
    float _2109 = -_2107;
    float _2111 = _2097 + _2109;
    float _2113 = -_2107;
    float _2115 = _2095 + _2113;
    float _2117 = -_2107;
    float _2119 = _2099 + _2117;
    float _2121 = fma(_2111, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2107);
    float _2123 = fma(_2115, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2107);
    float _2125 = fma(_2119, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2107);
    out.m_82.x = _2121;
    out.m_82.y = _2123;
    out.m_82.z = _2125;
    if (!_2093)
    {
        return out;
    }
    float _2127 = -_747;
    float _2129 = _2127 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2131 = -_749;
    float _2133 = _2131 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2135 = -_751;
    float _2137 = _2135 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2139 = _2129 * _2129;
    float _2141 = fma(_2133, _2133, _2139);
    float _2143 = fma(_2137, _2137, _2141);
    float _2145 = sqrt(_2143);
    float _2147 = rsqrt(_2143);
    float _2149 = -_2145;
    float _2151 = _2149 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2153 = _2151 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2155 = precise::clamp(_2153, 0.0, 1.0);
    float _2157 = _2133 * _2147;
    float _2159 = _2129 * _2147;
    float _2161 = abs(_2155);
    float _2163 = log2(_2161);
    float _2165 = _2137 * _2147;
    float _2167 = _2157 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2169 = _1879 * _2159;
    float _2171 = -_2159;
    float _2173 = -_2167;
    float _2175 = fma(_2171, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2173);
    float _2177 = fma(_1877, _2157, _2169);
    float _2179 = -_2165;
    float _2181 = fma(_2179, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2175);
    float _2183 = fma(_1867, _2165, _2177);
    float _2185 = precise::clamp(_2183, 0.0, 1.0);
    float _2187 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2189 = _2181 + _2187;
    float _2191 = _2163 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2193 = _2189 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2195 = precise::clamp(_2193, 0.0, 1.0);
    float _2197 = exp2(_2191);
    float _2199 = _2197 * _2195;
    float _2201 = _2185 * _2199;
    float _2203 = _2201 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2205 = _2201 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2207 = _2201 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_80.x = _2203;
    out.m_80.y = _2205;
    out.m_80.z = _2207;
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
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1979 = false;
    bool _293 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _96 = in.m_46.w;
    float _98 = trunc(_96);
    int _101 = int(_98);
    bool _105 = _101 >= 1;
    float _107 = 0.0;
    if (!_105)
    {
        _107 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _109 = _107;
    float _111 = _109;
    if (!_105)
    {
        out.m_49.x = 0.0;
    }
    int _113 = 0;
    if (!_105)
    {
        float _115 = _109 * 5.0;
        _113 = as_type<int>(_115);
    }
    int _117 = _113;
    int _119 = _117;
    if (!_105)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2264 = as_type<float>(_117);
        out.gl_Position.z = _2264;
    }
    if (!_105)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _121 = in.m_51.w;
    bool _123 = _121 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _125 = isnan(_121);
    bool _127 = _123 || _125;
    bool _129 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _131 = _127 || _129;
    float _133 = -_121;
    float _135 = _133 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _137 = 0.0;
    if (_131)
    {
        float _139 = float(_101);
        _137 = _139;
    }
    float _141 = _137;
    bool _143 = _135 >= _141;
    bool _145 = !_131;
    bool _147 = _143 || _145;
    if (_147)
    {
        _111 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _149 = _111;
    if (_147)
    {
        out.m_49.x = 0.0;
    }
    if (_147)
    {
        float _151 = _149 * 5.0;
        _119 = as_type<int>(_151);
    }
    int _153 = _119;
    if (_147)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2332 = as_type<float>(_153);
        out.gl_Position.z = _2332;
    }
    if (_147)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _155 = in.m_53.x;
    float _157 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _159 = _135 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _161 = in.m_55.x;
    float _163 = in.m_55.y;
    float _165 = in.m_55.z;
    float _167 = _159 * _157;
    float _169 = fma(_155, (*spvDescriptorSet0.vp_c9)._m0[20].x, _167);
    float _171 = _169 * 6.283185482025146484375;
    float _173 = floor(_169);
    int _175 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _177 = _175 != 0;
    float _179 = _163 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _181 = _171 * 0.15915493667125701904296875;
    float _183 = _163 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _185 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _187 = _185 != 0;
    int _189 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _191 = _189 != 0;
    float _193 = _163 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _195 = fma(_161, (*spvDescriptorSet0.vp_c10)._m0[4].x, _179);
    float _197 = fma(_161, (*spvDescriptorSet0.vp_c10)._m0[5].x, _183);
    float _199 = _181 * 6.283185482025146484375;
    float _201 = cos(_199);
    bool _203 = !_187;
    int _205 = _203 ? 0 : 1;
    float _207 = fma(_161, (*spvDescriptorSet0.vp_c10)._m0[6].x, _193);
    bool _209 = !_177;
    int _211 = _209 ? 0 : 1;
    float _213 = fma(_165, (*spvDescriptorSet0.vp_c10)._m0[4].z, _195);
    bool _215 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _217 = -_173;
    float _219 = _169 + _217;
    int _221 = abs(_205);
    bool _223 = !_191;
    int _225 = _223 ? 0 : 1;
    int _227 = abs(_211);
    float _229 = float(_221);
    float _231 = -_219;
    float _233 = fma(_231, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _235 = abs(_225);
    float _237 = fma(_201, 0.5, 0.5);
    float _239 = abs(_233);
    float _241 = _229 * _239;
    bool _243 = _219 < 0.5;
    float _245 = float(_243);
    float _247 = -_237;
    float _249 = fma(_247, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _251 = float(_227);
    float _253 = -_245;
    float _255 = fma(_253, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _257 = float(_235);
    float _259 = fma(_165, (*spvDescriptorSet0.vp_c10)._m0[6].z, _207);
    float _261 = fma(_251, _249, _241);
    float _263 = fma(_165, (*spvDescriptorSet0.vp_c10)._m0[5].z, _197);
    float _265 = abs(_255);
    float _267 = fma(_257, _265, _261);
    bool _269 = !_215;
    float _271 = _263;
    float _289;
    float _291;
    if (!_269)
    {
        float _273 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _275 = _155 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _277 = float(_101);
        float _279 = fma(_275, (*spvDescriptorSet0.vp_c9)._m0[12].x, _135);
        float _281 = _279 * _273;
        float _283 = floor(_281);
        float _285 = -_283;
        float _287 = _281 + _285;
        _289 = _287;
        _291 = _277;
        _293 = true;
    }
    else
    {
        float _295 = float(_101);
        float _297 = 1.0 / _295;
        float _299 = _135 * _297;
        _289 = _299;
        _291 = _295;
    }
    _293 = false;
    float _301 = _289;
    float _303 = _291;
    float _305 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _307 = _301 + _305;
    bool _309 = _301 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _311 = isnan(_301);
    bool _313 = _309 || _311;
    bool _315 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _317 = _313 || _315;
    float _319 = float(_317);
    float _321 = as_type<float>(int(gl_VertexIndex));
    float _323 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _325 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _323;
    float _327 = in.m_60.x;
    float _329 = in.m_60.y;
    float _331 = -_319;
    float _333 = _331 + 1.0;
    float _335 = 1.0 / _325;
    float _337 = _307 * _335;
    bool _339 = _301 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _341 = isnan(_301);
    bool _343 = _339 || _341;
    bool _345 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _347 = _343 || _345;
    float _349 = float(_347);
    float _351 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _353 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _351;
    float _355 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _357 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _355;
    int _359 = as_type<int>(_321) & 1;
    bool _361 = _359 != 0;
    int _363 = as_type<int>(_321) & 2;
    bool _365 = _363 != 0;
    float _367 = _349 * _333;
    float _369 = fma(_353, _337, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _371 = fma(_357, _337, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _373 = !_365;
    float _375 = _373 ? (-0.5) : 0.5;
    float _377 = _369 * _367;
    float _379 = _371 * _367;
    float _381 = -_349;
    float _383 = _381 + 1.0;
    bool _385 = !_361;
    float _387 = _385 ? (-0.5) : 0.5;
    float _389 = in.m_46.x;
    float _391 = in.m_46.y;
    float _393 = in.m_46.z;
    float _395 = fma(_383, (*spvDescriptorSet0.vp_c9)._m0[143].y, _379);
    float _397 = fma(_383, (*spvDescriptorSet0.vp_c9)._m0[143].x, _377);
    float _399 = fma(_319, (*spvDescriptorSet0.vp_c9)._m0[144].y, _395);
    float _401 = fma(_319, (*spvDescriptorSet0.vp_c9)._m0[144].x, _397);
    float _403 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _405 = _399 * _329;
    float _407 = _401 * _327;
    float _409 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _387);
    float _411 = _267 * _405;
    float _413 = _267 * _407;
    float _415 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _375);
    float _417 = _411 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _419 = _413 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _421 = _417 * _415;
    float _423 = _419 * _409;
    float _425 = _391 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _427 = _391 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _429 = _421 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _431 = _421 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _433 = fma(_389, (*spvDescriptorSet0.vp_c10)._m0[6].x, _425);
    float _435 = fma(_389, (*spvDescriptorSet0.vp_c10)._m0[4].x, _427);
    float _437 = fma(_423, (*spvDescriptorSet0.vp_c8)._m0[26].x, _429);
    float _439 = fma(_423, (*spvDescriptorSet0.vp_c8)._m0[24].x, _431);
    float _441 = fma(_393, (*spvDescriptorSet0.vp_c10)._m0[6].z, _433);
    float _443 = fma(_393, (*spvDescriptorSet0.vp_c10)._m0[4].z, _435);
    float _445 = fma(_403, (*spvDescriptorSet0.vp_c8)._m0[26].z, _437);
    float _447 = fma(_403, (*spvDescriptorSet0.vp_c8)._m0[24].z, _439);
    float _449 = _441 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _451 = _443 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _453 = _445 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _455 = _447 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _457 = _391 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _459 = _421 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _461 = _449 + _453;
    float _463 = _451 + _455;
    float _465 = fma(_389, (*spvDescriptorSet0.vp_c10)._m0[5].x, _457);
    float _467 = fma(_423, (*spvDescriptorSet0.vp_c8)._m0[25].x, _459);
    float _469 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _471 = _461 + _469;
    float _473 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _475 = _463 + _473;
    float _477 = fma(_393, (*spvDescriptorSet0.vp_c10)._m0[5].z, _465);
    float _479 = fma(_403, (*spvDescriptorSet0.vp_c8)._m0[25].z, _467);
    float _481 = _471 * _471;
    float _483 = _479 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _485 = fma(_475, _475, _481);
    float _487 = _477 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _489 = sqrt(_485);
    float _491 = _487 + _483;
    bool _493 = _489 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _495 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _497 = _495 != 0;
    int _499 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _501 = _499 != 0;
    int _503 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _505 = _503 != 0;
    bool _507 = !_501;
    int _509 = _507 ? 0 : 1;
    bool _511 = !_497;
    int _513 = _511 ? 0 : 1;
    bool _515 = !_505;
    int _517 = _515 ? 0 : 1;
    float _519 = _477;
    float _521 = _461;
    float _523 = _459;
    float _525 = _479;
    if (!_493)
    {
        _519 = _463;
    }
    float _527 = _519;
    float _529 = 0.0;
    float _531 = _527;
    if (!_493)
    {
        _529 = _491;
    }
    float _533 = _529;
    bool _535 = !_493;
    float _537 = _533;
    if (!_535)
    {
        float _539 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _541 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _543 = _489 + _541;
        float _545 = _491 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _547 = rsqrt(_485);
        float _549 = _543 * _539;
        float _551 = _549 * 0.15915493667125701904296875;
        float _553 = _551 * 6.283185482025146484375;
        float _555 = cos(_553);
        float _557 = _551 * 6.283185482025146484375;
        float _559 = sin(_557);
        float _561 = _555 + (-1.0);
        float _563 = _561 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _565 = fma(_559, _545, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _567 = fma(_491, _555, _563);
        float _569 = _547 * _565;
        float _571 = fma(_475, _569, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _573 = fma(_471, _569, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _537 = _567;
        _531 = _571;
        _521 = _573;
        _523 = _551;
        _525 = _547;
    }
    float _575 = _537;
    float _577 = _531;
    float _579 = _521;
    float _581 = _523;
    float _583 = _525;
    float _585 = -_487;
    float _587 = _585 + _575;
    float _589 = -_451;
    float _591 = _589 + _577;
    float _593 = -_449;
    float _595 = _593 + _579;
    float _597 = _587 * _587;
    bool _599 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _601 = isnan(0.5);
    bool _603 = _599 || _601;
    bool _605 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _607 = _603 || _605;
    float _609 = fma(_591, _591, _597);
    float _611 = fma(_595, _595, _609);
    float _613 = sqrt(_611);
    bool _615 = _613 > 0.0;
    bool _617 = !_615;
    float _619 = _577;
    float _621 = _579;
    float _623 = _575;
    float _625 = _583;
    float _627 = _581;
    if (!_617)
    {
        float _629 = _263 * _263;
        float _631 = fma(_213, _213, _629);
        float _633 = rsqrt(_611);
        float _635 = fma(_259, _259, _631);
        float _637 = sqrt(_635);
        float _639 = _591 * _633;
        float _641 = _587 * _633;
        float _643 = _595 * _633;
        bool _645 = _637 > 0.0;
        bool _647 = !_645;
        _625 = _635;
        _627 = _637;
        if (!_647)
        {
            float _649 = rsqrt(_635);
            float _651 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _653 = _263 * _649;
            float _655 = _213 * _649;
            float _657 = _259 * _649;
            float _659 = _641 * _653;
            float _661 = fma(_639, _655, _659);
            float _663 = _651 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _665 = fma(_643, _657, _661);
            float _667 = _665 * _663;
            float _669 = fma(_213, _667, _577);
            float _671 = fma(_263, _667, _575);
            float _673 = fma(_259, _667, _579);
            _619 = _669;
            _621 = _673;
            _623 = _671;
            _627 = _653;
        }
    }
    float _675 = _619;
    float _677 = _621;
    float _679 = _623;
    float _681 = _625;
    float _683 = _627;
    float _685 = _679;
    float _687 = _677;
    float _689 = _681;
    float _691 = _683;
    if (_607)
    {
        _271 = _675;
    }
    float _693 = _271;
    float _695 = _693;
    if (!_607)
    {
        float _697 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _699 = _487 + _697;
        float _701 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _703 = _451 + _701;
        float _705 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _707 = -_451;
        float _709 = _707 + _675;
        float _711 = _699 * _699;
        float _713 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _715 = _449 + _713;
        float _717 = -_449;
        float _719 = _717 + _677;
        float _721 = fma(_703, _703, _711);
        float _723 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _725 = fma(_715, _715, _721);
        float _727 = sqrt(_725);
        float _729 = _705 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _731 = precise::min(_727, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _733 = _731 * _723;
        float _735 = _729 * _733;
        float _737 = -_487;
        float _739 = _737 + _679;
        float _741 = fma(_709, _735, _451);
        float _743 = fma(_739, _735, _487);
        float _745 = fma(_719, _735, _449);
        _685 = _743;
        _695 = _741;
        _687 = _745;
        _689 = _723;
    }
    float _747 = _685;
    float _749 = _695;
    float _751 = _687;
    float _753 = _689;
    float _755 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _757 = _747 + _755;
    float _759 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _761 = _749 + _759;
    float _763 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _765 = _751 + _763;
    float _767 = _757 * _757;
    float _769 = fma(_761, _761, _767);
    float _771 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _773 = fma(_765, _765, _769);
    float _775 = rsqrt(_773);
    float _777 = sqrt(_773);
    float _779 = _775 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _781 = _761 * _779;
    float _783 = _765 * _779;
    float _785 = _781 * _781;
    float _787 = _783 * _783;
    float _789 = _785 + _787;
    float _791 = sqrt(_789);
    bool _793 = _791 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _795 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _797 = _791 + _795;
    float _799 = _775;
    float _801 = _797;
    float _803 = _753;
    float _805 = _757;
    if (_793)
    {
        float _807 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _799 = _807;
    }
    float _809 = _799;
    float _811 = _809;
    if (_793)
    {
        float _813 = _797 * _809;
        _801 = _813;
    }
    float _815 = _801;
    if (_793)
    {
        float _817 = rsqrt(_789);
        _811 = _817;
    }
    float _819 = _811;
    float _821 = _819;
    if (_793)
    {
        float _823 = _815 * 0.15915493667125701904296875;
        _803 = _823;
    }
    float _825 = _803;
    float _827 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _829 = _765;
    float _831 = _825;
    if (_793)
    {
        float _833 = _825 * 6.283185482025146484375;
        float _835 = sin(_833);
        _829 = _835;
    }
    float _837 = _829;
    float _839 = precise::max(0.0, _827);
    float _841 = _259;
    if (_793)
    {
        float _843 = _825 * 6.283185482025146484375;
        float _845 = cos(_843);
        _841 = _845;
    }
    float _847 = _841;
    float _849 = -_779;
    float _851 = -_839;
    float _853 = fma(_757, _849, _851);
    float _855 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_793)
    {
        float _857 = _853 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _805 = _857;
    }
    float _859 = _805;
    float _861 = fma(_451, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    if (!_793)
    {
        _855 = _853;
    }
    float _863 = _855;
    float _865 = _837;
    float _867 = _863;
    if (_793)
    {
        float _869 = fma(_837, _859, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _691 = _869;
    }
    float _871 = _691;
    float _873 = floor(_861);
    float _875 = 0.0;
    float _877 = _871;
    if (_793)
    {
        float _879 = _819 * _871;
        _875 = _879;
    }
    float _881 = _875;
    if (!_793)
    {
        _821 = _781;
    }
    float _883 = _821;
    float _885 = _883;
    if (_793)
    {
        float _887 = _847 + (-1.0);
        _865 = _887;
    }
    float _889 = _865;
    float _891 = _889;
    if (_793)
    {
        float _893 = _781 * _881;
        _885 = _893;
    }
    float _895 = _885;
    if (!_793)
    {
        _877 = _783;
    }
    float _897 = _877;
    float _899 = _897;
    if (_793)
    {
        float _901 = _783 * _881;
        _899 = _901;
    }
    float _903 = _899;
    if (_793)
    {
        float _905 = _889 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _831 = _905;
    }
    float _907 = _831;
    float _909 = _907;
    if (!_793)
    {
        _891 = _785;
    }
    float _911 = _891;
    float _913 = _911;
    if (_793)
    {
        float _915 = _895 * _895;
        _913 = _915;
    }
    float _917 = _913;
    float _919 = _747 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    if (_793)
    {
        float _921 = fma(_853, _847, _907);
        _867 = _921;
    }
    float _923 = _867;
    if (!_793)
    {
        _909 = _787;
    }
    float _925 = _909;
    float _927 = _925;
    if (_793)
    {
        float _929 = _903 * _903;
        _927 = _929;
    }
    float _931 = _927;
    float _933 = fma(_749, (*spvDescriptorSet0.vp_c8)._m0[1].x, _919);
    float _935 = fma(_923, _923, _917);
    float _937 = _747 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _939 = fma(_751, (*spvDescriptorSet0.vp_c8)._m0[1].z, _933);
    float _941 = _935 + _931;
    float _943 = _747 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _945 = _747 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _947 = fma(_749, (*spvDescriptorSet0.vp_c8)._m0[2].x, _937);
    float _949 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _951 = fma(_777, (*spvDescriptorSet0.vp_c15)._m0[23].w, _949);
    float _953 = precise::clamp(_951, 0.0, 1.0);
    float _955 = fma(_749, (*spvDescriptorSet0.vp_c8)._m0[0].x, _943);
    float _957 = rsqrt(_941);
    float _959 = _939 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _961 = fma(_749, (*spvDescriptorSet0.vp_c8)._m0[3].x, _945);
    float _963 = fma(_751, (*spvDescriptorSet0.vp_c8)._m0[0].z, _955);
    float _965 = fma(_751, (*spvDescriptorSet0.vp_c8)._m0[2].z, _947);
    float _967 = -_953;
    float _969 = _967 + 1.0;
    float _971 = _959 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _973 = _963 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _975 = _965 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _977 = fma(_751, (*spvDescriptorSet0.vp_c8)._m0[3].z, _961);
    float _979 = fma(_973, (*spvDescriptorSet0.vp_c8)._m0[7].x, _971);
    float _981 = abs(_969);
    float _983 = log2(_981);
    float _985 = _977 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _987 = _975 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _989 = fma(_975, (*spvDescriptorSet0.vp_c8)._m0[7].z, _979);
    float _991 = _957 * _895;
    float _993 = fma(_449, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _995 = _957 * _903;
    float _997 = fma(_985, (*spvDescriptorSet0.vp_c8)._m0[7].w, _989);
    float _999 = _957 * _923;
    float _1001 = _991 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1003 = floor(_993);
    float _1005 = -_987;
    float _1007 = fma(_1005, _771, 1.0);
    float _1009 = _959 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1011 = -_1001;
    float _1013 = fma(_999, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1011);
    float _1015 = _983 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1017 = -_995;
    float _1019 = fma(_1017, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1013);
    float _1021 = log2(_1007);
    float _1023 = fma(_1019, -0.5, 0.5);
    float _1025 = fma(_1019, 0.5, 0.5);
    float _1027 = exp2(_1015);
    float _1029 = -_873;
    float _1031 = _861 + _1029;
    float _1033 = _959 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1035 = -_1003;
    float _1037 = _993 + _1035;
    float _1039 = fma(_973, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1009);
    float _1041 = fma(_973, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1033);
    float _1043 = _999 + 1.0;
    float _1045 = 1.0 / _997;
    float _1047 = fma(_1025, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1049 = fma(_975, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1041);
    float _1051 = fma(_975, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1039);
    float _1053 = _1021 * 0.693147182464599609375;
    float _1055 = fma(_1025, _1047, -0.212114393711090087890625);
    float _1057 = fma(_985, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1049);
    float _1059 = sqrt(_1023);
    float _1061 = -_999;
    float _1063 = fma(_1027, _1043, _1061);
    float _1065 = fma(_985, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1051);
    float _1067 = fma(_1025, _1055, 1.570728778839111328125);
    float _1069 = _1053 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1071 = fma(_1063, 0.5, 0.5);
    float _1073 = _1057 * _1045;
    float _1075 = _1065 * _1045;
    float _1077 = fma(_1073, 0.5, 0.5);
    float _1079 = fma(_1075, -0.5, 0.5);
    float _1081 = _1059 * 0.636619746685028076171875;
    float2 _3803 = float2(_1031, _1037);
    float _1083 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_3803, float2(0.0), isnan(_3803)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_3803, float2(0.0), isnan(_3803)), level(0.0)).x;
    float3 _3814 = float3(_1077, _1079, _1069);
    float _1085 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3814, float3(0.0), isnan(_3814)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3814, float3(0.0), isnan(_3814)), level(0.0)).x;
    float _1087 = -_1067;
    float _1089 = fma(_1081, _1087, 1.0);
    float3 _3830 = float3(_1077, _1079, _1069);
    float4 _1092 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3830, float3(0.0), isnan(_3830)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3830, float3(0.0), isnan(_3830)), level(0.0)).xyzw;
    float _1094 = _1092.x;
    float _1096 = _1092.y;
    float _1098 = _1092.z;
    float _1100 = _1092.w;
    float2 _3846 = float2(_1089, _1071);
    float3 _1104 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3846, float2(0.0), isnan(_3846)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3846, float2(0.0), isnan(_3846)), level(0.0)).xyz;
    float _1106 = _1104.x;
    float _1108 = _1104.y;
    float _1110 = _1104.z;
    float _1112 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1114 = int(_1112);
    int _1116 = abs(_513);
    float _1118 = _983 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1120 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1122 = int(_1120);
    float _1124 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1126 = float(_1114);
    float _1128 = 1.0 / _303;
    float _1130 = float(uint(_1122));
    float _1132 = 1.0 / _1126;
    int _1134 = ~_1122;
    int _1136 = _1134 + 1;
    int _1138 = ~_1122;
    int _1140 = _1138 + 1;
    float _1142 = 1.0 / _1130;
    float _1144 = _135 * _1132;
    int _1146 = ~_1122;
    int _1148 = _1146 + 1;
    float _1150 = exp2(_1118);
    float _1152 = float(_1122);
    int _1154 = as_type<int>(_1142) + (-2);
    float _1156 = trunc(_1144);
    int _1158 = int(_1156);
    float _1160 = -_1150;
    float _1162 = _1160 + 1.0;
    float _1164 = float(uint(_1158));
    float _1166 = float(_1158);
    float _1168 = as_type<float>(_1154) * _1164;
    bool _1170 = _1166 >= _1152;
    bool _1172 = isnan(_1166);
    bool _1174 = _1170 || _1172;
    bool _1176 = isnan(_1152);
    bool _1178 = _1174 || _1176;
    float _1180 = float(_1178);
    float _1182 = trunc(_1168);
    float _1184 = precise::max(_1182, 0.0);
    uint _1187 = uint(_1184);
    float _1189 = trunc(_1180);
    int _1191 = int(_1189);
    int _1193 = _1148 * int(_1187);
    int _1195 = _1193 + _1158;
    float _1197 = float(uint(_1195));
    int _1199 = ~_1191;
    int _1201 = _1199 + 1;
    int _1203 = _1201 + 1;
    float _1205 = as_type<float>(_1154) * _1197;
    int _1207 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1209 = _1207 != 0;
    float _1211 = trunc(_1205);
    float _1213 = precise::max(_1211, 0.0);
    uint _1215 = uint(_1213);
    bool _1217 = !_1209;
    float _1219 = _1217 ? 7.345489978790283203125 : 1.0;
    float _1221 = _1219 * _155;
    float _1223 = floor(_1221);
    int _1225 = int(_1187) + int(_1215);
    int _1227 = _1136 * _1225;
    int _1229 = _1227 + _1158;
    bool _1231 = uint(_1229) >= uint(_1122);
    float _1233 = -_1223;
    float _1235 = _1221 + _1233;
    bool _1237 = !_1231;
    int _1239 = _1237 ? 0 : (-1);
    float _1241 = _1235 * _1152;
    float _1243 = _135 * _1152;
    bool _1245 = _1122 == 0;
    int _1247 = ~_1225;
    int _1249 = _1247 + _1239;
    int _1251 = _1249 + 1;
    float _1253 = _1243 * _1128;
    int _1255 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1257 = _1255 != 0;
    float _1259 = trunc(_1241);
    int _1261 = int(_1259);
    int _1263 = _1122 + (-1);
    int _1265 = _1122 * _1251;
    int _1267 = _1265 + _1158;
    int _1269 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1271 = _1269 != 0;
    int _1273 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1275 = _1273 != 0;
    bool _1277 = !_1245;
    int _1279 = _1277 ? _1267 : (-1);
    float _1281 = trunc(_1253);
    int _1283 = int(_1281);
    bool _1285 = !_1257;
    int _1287 = _1285 ? 0 : 1;
    int _1289 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1291 = _1289 != 0;
    int _1293 = _1279 * _1203;
    int _1295 = abs(_509);
    int _1297 = abs(_1287);
    int _1299 = _1191 * _1263;
    int _1301 = _1299 + _1293;
    bool _1303 = !_1291;
    int _1305 = _1303 ? 0 : 1;
    int _1307 = _1261 * _1297;
    int _1309 = _1307 + _1158;
    int _1311 = abs(_517);
    int _1313 = _1301 * _1295;
    int _1315 = abs(_1305);
    int _1317 = _1283 * _1116;
    int _1319 = _1317 + _1313;
    int _1321 = _1309 * _1311;
    int _1323 = _1321 + _1319;
    int _1325 = ~_1122;
    int _1327 = _1325 + 1;
    float _1329 = in.m_53.y;
    int _1331 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1333 = _1331 != 0;
    int _1335 = _1261 * _1315;
    int _1337 = _1335 + _1323;
    float _1339 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1341 = float(uint(_1337));
    float _1343 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1345 = as_type<float>(_1154) * _1341;
    float _1347 = fma(_155, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1343);
    float _1349 = trunc(_1345);
    float _1351 = precise::max(_1349, 0.0);
    uint _1353 = uint(_1351);
    bool _1355 = _1329 > 0.5;
    int _1357 = _1327 * int(_1353);
    int _1359 = _1357 + _1337;
    float _1361 = float(uint(_1359));
    float _1363 = _487 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1365 = _487 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1367 = as_type<float>(_1154) * _1361;
    float _1369 = fma(_451, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1363);
    float _1371 = fma(_451, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1365);
    int _1373 = ~_1122;
    int _1375 = _1373 + 1;
    float _1377 = fma(_449, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1369);
    float _1379 = trunc(_1367);
    float _1381 = precise::max(_1379, 0.0);
    uint _1383 = uint(_1381);
    float _1385 = fma(_449, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1371);
    float _1387 = float(uint(_1309));
    float _1389 = _1377 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1391 = _1385 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1393 = 1.0 / _1389;
    float _1395 = _1391 + _1389;
    int _1397 = int(_1353) + int(_1383);
    float _1399 = as_type<float>(_1154) * _1387;
    float _1401 = trunc(_1399);
    float _1403 = precise::max(_1401, 0.0);
    uint _1405 = uint(_1403);
    int _1407 = _1375 * _1397;
    int _1409 = _1407 + _1337;
    float _1411 = _1395 * _1393;
    float _1413 = _1411 * 0.5;
    float _1415 = _155 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _1417 = uint(_1409) >= uint(_1122);
    float _1419 = -_1339;
    float _1421 = fma(_1415, 2.0, _1419);
    float _1423 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1425 = fma(_1413, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1423);
    bool _1427 = !_1417;
    int _1429 = _1427 ? 0 : (-1);
    bool _1431 = _155 > 0.5;
    float _1433 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _1435 = ~_1397;
    int _1437 = _1435 + _1429;
    int _1439 = _1437 + 1;
    float _1441 = 1.0 / _1425;
    int _1443 = _1375 * int(_1405);
    int _1445 = _1443 + _1309;
    float _1447 = _1329 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _1449 = _1122 * _1439;
    int _1451 = _1449 + _1337;
    float _1453 = fma(_1447, -2.0, _1124);
    float _1455 = float(uint(_1445));
    float _1457 = fma(_1329, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1433);
    bool _1459 = !_1245;
    int _1461 = _1459 ? _1451 : (-1);
    float _1463 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1465 = as_type<float>(_1154) * _1455;
    int _1467 = _1461 >> 31;
    float _1469 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1471 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1473 = _1441 * _1471;
    int _1475 = _1467 & 3;
    float _1477 = trunc(_1465);
    float _1479 = precise::max(_1477, 0.0);
    uint _1481 = uint(_1479);
    float _1483 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1485 = -_135;
    float _1487 = fma(_1485, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1421);
    int _1489 = _1461 + _1475;
    float _1491 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1493 = abs(_1473);
    float _1495 = log2(_1493);
    float _1497 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1499 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1501 = _1463 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1503 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1505 = _1469 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1507 = _1483 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1509 = _1491 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1511 = int(_1405) + int(_1481);
    float _1513 = _1497 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1515 = _1489 >> 2;
    float _1517 = _1499 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_62.x = _1501;
    out.m_62.y = _1505;
    out.m_62.z = _1507;
    out.m_62.w = _1503;
    float _1519 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1347);
    int _1521 = _1515 << 4;
    int _1523 = _1521 + 368;
    float _1525 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1453);
    out.m_64.x = _1509;
    out.m_64.y = _1513;
    out.m_64.z = _1517;
    float _1527 = _1495 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1529 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1457);
    int _1531 = _1140 * _1511;
    int _1533 = _1531 + _1309;
    float _1535 = exp2(_1527);
    bool _1537 = _1473 <= 8000.0;
    bool _1539 = isnan(_1473);
    bool _1541 = _1537 || _1539;
    bool _1543 = isnan(8000.0);
    bool _1545 = _1541 || _1543;
    float _1547 = float(_1545);
    float _1549 = -_1083;
    float _1551 = _1549 + 1.0;
    float _1553 = -_1519;
    float _1555 = _1553 + 1.0;
    float _1557 = -_1529;
    float _1559 = _1557 + 1.0;
    uint _1561 = uint(int(uint(_1523) >> uint(2)));
    uint _1563 = uint(int(uint(int(_1561)) >> uint(2)));
    int _1565 = int(_1561) & 3;
    float _1567 = (*spvDescriptorSet0.vp_c9)._m0[int(_1563)][_1565];
    int _1569 = int(_1561) + 1;
    uint _1571 = uint(int(uint(_1569) >> uint(2)));
    int _1573 = _1569 & 3;
    float _1575 = (*spvDescriptorSet0.vp_c9)._m0[int(_1571)][_1573];
    float _1577 = -_387;
    int _1579 = _1431 ? as_type<int>(_1577) : as_type<int>(_387);
    float _1581 = _375 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1583 = -_375;
    int _1585 = _1355 ? as_type<int>(_1583) : as_type<int>(_375);
    bool _1587 = uint(_1533) >= uint(_1122);
    float _1589 = _1581 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    bool _1591 = !_1275;
    float _1593 = _1591 ? _375 : as_type<float>(_1585);
    float _1595 = _387 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _1597 = !_1271;
    float _1599 = _1597 ? _387 : as_type<float>(_1579);
    float _1601 = _1581 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _1603 = _1523 + 8;
    uint _1605 = uint(int(uint(_1603) >> uint(2)));
    uint _1607 = uint(int(uint(int(_1605)) >> uint(2)));
    int _1609 = int(_1605) & 3;
    float _1611 = (*spvDescriptorSet0.vp_c9)._m0[int(_1607)][_1609];
    int _1613 = int(_1605) + 1;
    uint _1615 = uint(int(uint(_1613) >> uint(2)));
    int _1617 = _1613 & 3;
    float _1619 = (*spvDescriptorSet0.vp_c9)._m0[int(_1615)][_1617];
    int _1621 = _1461 & 3;
    bool _1623 = _1621 != 0;
    float _1625 = _1581 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1627 = fma(_1595, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1601);
    int _1629 = _1461 & 3;
    bool _1631 = _1629 != 0;
    float _1633 = fma(_1535, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1635 = precise::clamp(_1633, 0.0, 1.0);
    bool _1637 = uint(_1621) > 1u;
    float _1639 = fma(_1595, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1589);
    float _1641 = _1599 + 0.5;
    int _1643 = _1631 ? 0 : 1;
    float _1645 = fma(_1595, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1625);
    bool _1647 = _1621 != 3;
    float _1649 = fma(_1635, -2.0, 3.0);
    float _1651 = _1635 * _1635;
    int _1653 = ~_1643;
    int _1655 = _1653 + 1;
    int _1657 = _1655 + 1;
    float _1659 = fma(_1641, (*spvDescriptorSet0.vp_c9)._m0[80].x, _1487);
    bool _1661 = !_1587;
    int _1663 = _1661 ? 0 : (-1);
    float _1665 = _1651 * _1649;
    int _1667 = _1657;
    float _1669 = _1094;
    float _1671 = _1096;
    float _1673 = _1627;
    float _1675 = _1639;
    float _1677 = _1645;
    float _1679 = _997;
    if (!_1637)
    {
        int _1681 = ~_1643;
        int _1683 = _1681 + 1;
        _1667 = _1683;
    }
    int _1685 = _1667;
    float _1687 = -_1555;
    float _1689 = fma(_1599, _1687, _1659);
    bool _1691 = uint(_1621) >= 2u;
    int _1693 = abs(_1685);
    bool _1695 = !_1623;
    int _1697 = _1695 ? 0 : 1;
    int _1699 = _1691 ? 0 : 1;
    bool _1701 = _1621 != 3;
    int _1703 = ~_1699;
    int _1705 = _1703 + 1;
    int _1707 = _1705 + 1;
    bool _1709 = !_1701;
    int _1711 = _1709 ? 0 : (-1);
    int _1713 = abs(_1697);
    int _1715 = _1707;
    if (_1647)
    {
        int _1717 = ~_1699;
        int _1719 = _1717 + 1;
        _1715 = _1719;
    }
    int _1721 = _1715;
    int _1723 = ~_1693;
    int _1725 = _1723 + 1;
    int _1727 = _1725 + 1;
    int _1729 = abs(_1711);
    int _1731 = abs(_1721);
    int _1733 = _1727 * as_type<int>(_1575);
    bool _1735 = !_1333;
    int _1737 = _1735 ? 0 : 1;
    int _1739 = ~_1713;
    int _1741 = _1739 + 1;
    int _1743 = _1741 + 1;
    int _1745 = abs(_1737);
    int _1747 = _1743 * as_type<int>(_1567);
    int _1749 = _1747 + _1733;
    int _1751 = ~_1731;
    int _1753 = _1751 + 1;
    int _1755 = _1753 + 1;
    int _1757 = ~_1511;
    int _1759 = _1757 + _1663;
    int _1761 = _1759 + 1;
    int _1763 = _1755 * as_type<int>(_1611);
    int _1765 = _1763 + _1749;
    int _1767 = ~_1729;
    int _1769 = _1767 + 1;
    int _1771 = _1769 + 1;
    float _1773 = _959 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _1775 = _1122 * _1761;
    int _1777 = _1775 + _1309;
    int _1779 = ~_1745;
    int _1781 = _1779 + 1;
    int _1783 = _1781 + 1;
    float _1785 = -_1665;
    float _1787 = _1785 + 1.0;
    int _1789 = _1771 * as_type<int>(_1619);
    int _1791 = _1789 + _1765;
    float _1793 = fma(_973, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1773);
    bool _1795 = !_1245;
    int _1797 = _1795 ? _1777 : (-1);
    float _1799 = fma(_1787, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1665);
    int _1801 = _1791 * _1783;
    float _1803 = fma(_975, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1793);
    float _1805 = _1547 * _1799;
    int _1807 = _1797 * _1745;
    int _1809 = _1807 + _1801;
    float _1811 = fma(_985, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1803);
    float _1813 = _1162 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1815 = in.m_66.x;
    float _1817 = _1805 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _1819 = _1593 + (-0.5);
    float _1821 = _1811 + _997;
    float _1823 = _1813 * _1085;
    float _1825 = _1551 * _1817;
    float _1827 = precise::clamp(_1825, 0.0, 1.0);
    float _1829 = -_1819;
    float _1831 = -_1525;
    float _1833 = fma(_1829, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1831);
    float _1835 = _1821 * 0.5;
    float _1837 = -_1827;
    float _1839 = fma(_1837, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    out.gl_Position.x = _1057;
    out.gl_Position.y = _1065;
    out.gl_Position.z = _1811;
    out.gl_Position.w = _997;
    float _1841 = _1110 * _1823;
    float _1843 = fma(_1593, _1559, _1833);
    float _1845 = float(_1809);
    out.m_68.z = _1835;
    out.m_68.w = _997;
    float _1847 = fma(_1100, _1841, _1098);
    bool _1849 = _777 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1851 = isnan(_777);
    bool _1853 = _1849 || _1851;
    bool _1855 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1857 = _1853 || _1855;
    out.m_70.x = _1689;
    out.m_70.y = _1843;
    out.m_72.x = _1845;
    float _1859 = _1100 * _1823;
    float _1861 = -_1813;
    float _1863 = _1861 + 1.0;
    float _1865 = _1839 * _1815;
    float _1867 = _1645 + (*spvDescriptorSet0.vp_c8)._m0[26].z;
    float _1869 = fma(_1106, _1859, _1094);
    float _1871 = fma(_1108, _1859, _1096);
    float _1873 = _1100 * _1863;
    float _1875 = _1865 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _1877 = _1627 + (*spvDescriptorSet0.vp_c8)._m0[24].z;
    float _1879 = _1639 + (*spvDescriptorSet0.vp_c8)._m0[25].z;
    if (!_1857)
    {
        _1669 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1881 = _1669;
    out.m_74.x = _1869;
    out.m_74.y = _1871;
    out.m_74.z = _1847;
    out.m_74.w = _1873;
    float _1883 = _1881;
    float _1885 = _1881;
    if (!_1857)
    {
        _1671 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1887 = _1671;
    float _1889 = _1887;
    float _1891 = _1887;
    if (!_1857)
    {
        _1673 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1893 = _1673;
    out.m_76.x = _1875;
    float _1895 = _1893;
    float _1897 = _1893;
    if (!_1857)
    {
        _1675 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1899 = _1675;
    float _1901 = _1899;
    float _1903 = _1899;
    if (!_1857)
    {
        _1677 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1905 = _1677;
    out.m_78.x = _1877;
    out.m_78.y = _1879;
    out.m_78.z = _1867;
    float _1907 = _1905;
    float _1909 = _1905;
    if (!_1857)
    {
        _1679 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1911 = _1679;
    bool _1913 = !_1857;
    float _1915 = _1911;
    float _1917 = _1911;
    if (!_1913)
    {
        bool _1919 = _777 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1921 = isnan(_777);
        bool _1923 = _1919 || _1921;
        bool _1925 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1927 = _1923 || _1925;
        if (!_1927)
        {
            float _1929 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1931 = _777 + _1929;
            float _1933 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1935 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1933;
            float _1937 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1939 = _1937 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1941 = 1.0 / _1935;
            float _1943 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1945 = _1943 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1947 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1949 = _1947 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1951 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1953 = _1951 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1955 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1957 = _1955 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1959 = _1931 * _1941;
            float _1961 = precise::clamp(_1959, 0.0, 1.0);
            float _1963 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1965 = _1963 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1967 = fma(_1961, _1939, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1969 = fma(_1961, _1965, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1971 = fma(_1961, _1945, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1973 = fma(_1961, _1949, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1975 = fma(_1961, _1953, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1977 = fma(_1961, _1957, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1891 = _1969;
            _1909 = _1975;
            _1885 = _1967;
            _1903 = _1973;
            _1897 = _1971;
            _1917 = _1977;
            _1979 = true;
        }
        else
        {
            bool _1981 = _777 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1983 = isnan(_777);
            bool _1985 = _1981 || _1983;
            bool _1987 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1989 = _1985 || _1987;
            if (!_1989)
            {
                _1883 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1991 = _1883;
            _1885 = _1991;
            if (!_1989)
            {
                _1889 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1993 = _1889;
            _1891 = _1993;
            if (!_1989)
            {
                _1895 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1995 = _1895;
            _1897 = _1995;
            if (!_1989)
            {
                _1901 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _1997 = _1901;
            _1903 = _1997;
            if (!_1989)
            {
                _1907 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _1999 = _1907;
            _1909 = _1999;
            if (!_1989)
            {
                _1915 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2001 = _1915;
            bool _2003 = !_1989;
            _1917 = _2001;
            if (!_2003)
            {
                bool _2005 = _777 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2007 = isnan(_777);
                bool _2009 = _2005 || _2007;
                bool _2011 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2013 = _2009 || _2011;
                if (!_2013)
                {
                    float _2015 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2017 = _777 + _2015;
                    float _2019 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2021 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2019;
                    float _2023 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2025 = _2023 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2027 = 1.0 / _2021;
                    float _2029 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2031 = _2029 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2033 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2035 = _2033 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2037 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2039 = _2037 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2041 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2043 = _2041 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2045 = _2017 * _2027;
                    float _2047 = precise::clamp(_2045, 0.0, 1.0);
                    float _2049 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2051 = _2049 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2053 = fma(_2047, _2025, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2055 = fma(_2047, _2051, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2057 = fma(_2047, _2031, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2059 = fma(_2047, _2035, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2061 = fma(_2047, _2039, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2063 = fma(_2047, _2043, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1891 = _2055;
                    _1909 = _2061;
                    _1885 = _2053;
                    _1903 = _2059;
                    _1897 = _2057;
                    _1917 = _2063;
                    _1979 = true;
                }
                else
                {
                    _1891 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1909 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1885 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1903 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1897 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1917 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1979 = false;
    float _2065 = _1891;
    float _2067 = _1909;
    float _2069 = _1885;
    float _2071 = _1903;
    float _2073 = _1897;
    float _2075 = _1917;
    float _2077 = fma(_1879, -0.5, 0.5);
    float _2079 = precise::clamp(_2077, 0.0, 1.0);
    float _2081 = -_2065;
    float _2083 = _2081 + _2067;
    float _2085 = -_2069;
    float _2087 = _2085 + _2071;
    float _2089 = -_2073;
    float _2091 = _2089 + _2075;
    bool _2093 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2095 = fma(_2079, _2083, _2065);
    float _2097 = fma(_2079, _2087, _2069);
    float _2099 = fma(_2079, _2091, _2073);
    float _2101 = _2095 * 0.586610972881317138671875;
    out.m_80.x = 0.0;
    float _2103 = fma(_2097, 0.298911988735198974609375, _2101);
    float _2105 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2107 = fma(_2099, 0.114477999508380889892578125, _2103);
    out.m_49.x = _2105;
    float _2109 = -_2107;
    float _2111 = _2097 + _2109;
    float _2113 = -_2107;
    float _2115 = _2095 + _2113;
    float _2117 = -_2107;
    float _2119 = _2099 + _2117;
    float _2121 = fma(_2111, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2107);
    float _2123 = fma(_2115, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2107);
    float _2125 = fma(_2119, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2107);
    out.m_82.x = _2121;
    out.m_82.y = _2123;
    out.m_82.z = _2125;
    if (!_2093)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2127 = -_747;
    float _2129 = _2127 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2131 = -_749;
    float _2133 = _2131 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2135 = -_751;
    float _2137 = _2135 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2139 = _2129 * _2129;
    float _2141 = fma(_2133, _2133, _2139);
    float _2143 = fma(_2137, _2137, _2141);
    float _2145 = sqrt(_2143);
    float _2147 = rsqrt(_2143);
    float _2149 = -_2145;
    float _2151 = _2149 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2153 = _2151 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2155 = precise::clamp(_2153, 0.0, 1.0);
    float _2157 = _2133 * _2147;
    float _2159 = _2129 * _2147;
    float _2161 = abs(_2155);
    float _2163 = log2(_2161);
    float _2165 = _2137 * _2147;
    float _2167 = _2157 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2169 = _1879 * _2159;
    float _2171 = -_2159;
    float _2173 = -_2167;
    float _2175 = fma(_2171, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2173);
    float _2177 = fma(_1877, _2157, _2169);
    float _2179 = -_2165;
    float _2181 = fma(_2179, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2175);
    float _2183 = fma(_1867, _2165, _2177);
    float _2185 = precise::clamp(_2183, 0.0, 1.0);
    float _2187 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2189 = _2181 + _2187;
    float _2191 = _2163 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2193 = _2189 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2195 = precise::clamp(_2193, 0.0, 1.0);
    float _2197 = exp2(_2191);
    float _2199 = _2197 * _2195;
    float _2201 = _2185 * _2199;
    float _2203 = _2201 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2205 = _2201 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2207 = _2201 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_80.x = _2203;
    out.m_80.y = _2205;
    out.m_80.z = _2207;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

