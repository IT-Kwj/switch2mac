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
    float4 m_62 [[user(locn0)]];
    float4 m_60 [[user(locn1)]];
    float4 m_70 [[user(locn2)]];
    float4 m_45 [[user(locn3)]];
    float4 m_66 [[user(locn4)]];
    float4 m_68 [[user(locn5)]];
    float4 m_64 [[user(locn6)]];
    float4 m_72 [[user(locn8)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_56 [[attribute(1)]];
    float4 m_52 [[attribute(2)]];
    float4 m_42 [[attribute(3)]];
    float4 m_47 [[attribute(4)]];
    float4 m_54 [[attribute(5)]];
    float4 m_58 [[attribute(6)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    bool _223 = false;
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
        float _2343 = as_type<float>(_107);
        out.gl_Position.z = _2343;
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
    float _127 = _125;
    if (_121)
    {
        float _129 = float(_91);
        _101 = _129;
    }
    float _131 = _101;
    bool _133 = _125 >= _131;
    bool _135 = !_121;
    bool _137 = _133 || _135;
    float _139 = _131;
    if (_137)
    {
        _139 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _141 = _139;
    if (_137)
    {
        out.m_45.x = 0.0;
    }
    if (_137)
    {
        float _143 = _141 * 5.0;
        _109 = as_type<int>(_143);
    }
    int _145 = _109;
    if (_137)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2413 = as_type<float>(_145);
        out.gl_Position.z = _2413;
    }
    if (_137)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _147 = as_type<float>(int(gl_VertexIndex));
    float _149 = in.m_52.x;
    float _151 = in.m_52.y;
    float _153 = in.m_52.z;
    int _155 = as_type<int>(_147) & 1;
    bool _157 = _155 != 0;
    int _159 = as_type<int>(_147) & 2;
    bool _161 = _159 != 0;
    bool _163 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _165 = _151 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _167 = _151 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _169 = _151 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _171 = !_157;
    float _173 = _171 ? (-0.5) : 0.5;
    float _175 = fma(_149, (*spvDescriptorSet0.vp_c10)._m0[4].x, _165);
    float _177 = fma(_149, (*spvDescriptorSet0.vp_c10)._m0[5].x, _167);
    float _179 = fma(_149, (*spvDescriptorSet0.vp_c10)._m0[6].x, _169);
    bool _181 = !_161;
    float _183 = _181 ? (-0.5) : 0.5;
    float _185 = fma(_153, (*spvDescriptorSet0.vp_c10)._m0[4].z, _175);
    float _187 = fma(_153, (*spvDescriptorSet0.vp_c10)._m0[5].z, _177);
    float _189 = fma(_153, (*spvDescriptorSet0.vp_c10)._m0[6].z, _179);
    bool _191 = !_163;
    float _193 = _175;
    int _195 = as_type<int>(_177);
    float _197 = _147;
    float _199 = _189;
    float _201 = _185;
    float _203 = _187;
    float _221;
    if (!_191)
    {
        float _205 = in.m_54.x;
        float _207 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _209 = _205 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _211 = fma(_209, (*spvDescriptorSet0.vp_c9)._m0[11].y, _125);
        float _213 = _211 * _207;
        float _215 = floor(_213);
        float _217 = -_215;
        float _219 = _213 + _217;
        _193 = _213;
        _221 = _219;
        _223 = true;
    }
    else
    {
        float _225 = float(_91);
        float _227 = 1.0 / _225;
        float _229 = _125 * _227;
        _221 = _229;
    }
    _223 = false;
    float _231 = _193;
    float _233 = _221;
    float _235 = in.m_54.z;
    int _237 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _239 = _237 != 0;
    float _241 = 0.0;
    float _243 = 0.0;
    int _245 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z);
    float _247 = _231;
    if (_239)
    {
        float _249 = in.m_54.x;
        float _251 = in.m_54.y;
        _241 = _249;
        _243 = _251;
    }
    float _253 = _241;
    float _255 = _243;
    if (_239)
    {
        _245 = 0;
    }
    int _257 = _245;
    int _259 = _257;
    if (_239)
    {
        _195 = 0;
    }
    int _261 = _195;
    float _263 = _235 * 2.0;
    float _265 = floor(_263);
    float _267 = _253;
    float _269 = _255;
    int _271 = _261;
    if (_239)
    {
        _197 = _253;
    }
    float _273 = _197;
    float _275 = _273;
    if (_239)
    {
        _247 = _255;
    }
    float _277 = _247;
    bool _279 = _265 >= 0.0;
    bool _281 = isnan(_265);
    bool _283 = _279 || _281;
    bool _285 = isnan(0.0);
    bool _287 = _283 || _285;
    bool _289 = _265 > 0.0;
    int _291 = _287 ? 0 : 1;
    float _293 = _277;
    if (!_239)
    {
        float _295 = in.m_54.x;
        float _297 = in.m_54.y;
        float _299 = _295 * 3.1415927410125732421875;
        float _301 = _299 * 0.15915493667125701904296875;
        float _303 = _297 * 3.1415927410125732421875;
        float _305 = _303 * 0.15915493667125701904296875;
        float _307 = _301 * 6.283185482025146484375;
        float _309 = sin(_307);
        float _311 = _305 * 6.283185482025146484375;
        float _313 = sin(_311);
        _267 = _295;
        _269 = _297;
        _271 = 2;
        _259 = 1;
        _275 = _309;
        _293 = _313;
    }
    float _315 = _267;
    float _317 = _269;
    int _319 = _271;
    int _321 = _259;
    float _323 = _275;
    float _325 = _293;
    float _327 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _329 = _315 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _331 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _333 = _317 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _335 = _319 != 2;
    float _337 = -_327;
    float _339 = fma(_329, 2.0, _337);
    bool _341 = _321 != 1;
    float _343 = fma(_333, -2.0, _331);
    float _345 = _315 * 2.0;
    int _347 = ~_291;
    int _349 = _347 + 1;
    int _351 = _349 + 1;
    float _353 = _317 * 2.0;
    int _355 = _351;
    float _357 = _325;
    if (!_289)
    {
        int _359 = ~_291;
        int _361 = _359 + 1;
        _355 = _361;
    }
    int _363 = _355;
    float _365 = _317 + _235;
    float _367 = floor(_345);
    float _369 = _365 + (-1.0);
    float _371 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    float _373 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    float _375 = floor(_353);
    float _377 = fma(_323, (*spvDescriptorSet0.vp_c9)._m0[93].z, _371);
    float _379 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    float _381 = _323 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    float _383 = fma(_325, (*spvDescriptorSet0.vp_c9)._m0[93].w, _373);
    float _385 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    float _387 = _317 + _315;
    bool _389 = _367 > 0.0;
    float _391 = _325 * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    bool _393 = _367 >= 0.0;
    bool _395 = isnan(_367);
    bool _397 = _393 || _395;
    bool _399 = isnan(0.0);
    bool _401 = _397 || _399;
    float _403 = -_379;
    float _405 = fma(_381, 2.0, _403);
    float _407 = _381;
    float _409 = _391;
    float _411 = _369;
    if (!_341)
    {
        _407 = _315;
    }
    float _413 = _407;
    float _415 = _387 + (-1.0);
    int _417 = _401 ? 0 : 1;
    float _419 = fma(_391, -2.0, _385);
    float _421 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[92].z, _377);
    float _423 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[91].y, _419);
    int _425 = ~_417;
    int _427 = _425 + 1;
    int _429 = _427 + 1;
    float _431 = fma(_369, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _433 = 0.0;
    int _435 = _429;
    float _437 = _413;
    float _439 = _415;
    if (!_341)
    {
        _433 = _317;
    }
    float _441 = _433;
    float _443 = fma(_415, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _445 = 0.0;
    float _447 = _441;
    if (!_341)
    {
        _445 = _413;
    }
    float _449 = _445;
    float _451 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[92].w, _383);
    float _453 = _449;
    if (!_341)
    {
        _409 = _235;
    }
    float _455 = _409;
    float _457 = -_125;
    float _459 = fma(_457, (*spvDescriptorSet0.vp_c9)._m0[91].x, _405);
    float _461 = _455;
    if (!_389)
    {
        int _463 = ~_417;
        int _465 = _463 + 1;
        _435 = _465;
    }
    int _467 = _435;
    if (_341)
    {
        _437 = _315;
    }
    float _469 = _437;
    float _471 = _469;
    if (!_341)
    {
        _411 = _441;
    }
    float _473 = _411;
    float _475 = _473;
    if (!_341)
    {
        _439 = _455;
    }
    float _477 = _439;
    float _479 = (*spvDescriptorSet0.vp_c9)._m0[84].z + (*spvDescriptorSet0.vp_c9)._m0[84].y;
    float _481 = _477;
    if (_341)
    {
        _475 = _469;
    }
    float _483 = _475;
    if (_341)
    {
        _447 = _469;
    }
    float _485 = _447;
    if (_341)
    {
        _453 = _235;
    }
    float _487 = _453;
    if (_341)
    {
        _481 = _317;
    }
    float _489 = _481;
    if (_341)
    {
        _461 = _317;
    }
    float _491 = _461;
    float _493 = fma(_487, (*spvDescriptorSet0.vp_c9)._m0[84].z, _479);
    bool _495 = _375 > 0.0;
    float _497 = _483 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    bool _499 = _375 >= 0.0;
    bool _501 = isnan(_375);
    bool _503 = _499 || _501;
    bool _505 = isnan(0.0);
    bool _507 = _503 || _505;
    float _509 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _511 = log2(_509);
    float _513 = _489 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _515 = _235 > 0.5;
    float _517 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[84].x, _493);
    bool _519 = _317 > 0.5;
    if (_335)
    {
        _357 = _317;
    }
    float _521 = _357;
    float _523 = _521;
    if (!_335)
    {
        _523 = _469;
    }
    float _525 = _523;
    float _527 = 0.0;
    if (_335)
    {
        _527 = _235;
    }
    float _529 = _527;
    float _531 = _529;
    if (!_335)
    {
        _471 = _235;
    }
    float _533 = _471;
    if (!_335)
    {
        _531 = _317;
    }
    float _535 = _531;
    float _537 = _511 * _125;
    int _539 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _541 = _539 != 0;
    int _543 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _545 = _543 != 0;
    float _547 = _533 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _549 = -_183;
    int _551 = _515 ? as_type<int>(_549) : as_type<int>(_183);
    float _553 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _555 = -_173;
    int _557 = _519 ? as_type<int>(_555) : as_type<int>(_173);
    float _559 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _561 = -_553;
    float _563 = fma(_497, 2.0, _561);
    bool _565 = !_545;
    float _567 = _565 ? _183 : as_type<float>(_551);
    float _569 = fma(_491, (*spvDescriptorSet0.vp_c9)._m0[83].w, _559);
    bool _571 = !_541;
    float _573 = _571 ? _173 : as_type<float>(_557);
    int _575 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _577 = _575 != 0;
    int _579 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _581 = _579 != 0;
    int _583 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _585 = _583 != 0;
    float _587 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[82].w, _569);
    float _589 = in.m_56.x;
    float _591 = in.m_56.y;
    float _593 = in.m_56.z;
    bool _595 = !_577;
    int _597 = _595 ? 0 : 1;
    float _599 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _601 = 1.0 + _599;
    int _603 = abs(_597);
    float _605 = (*spvDescriptorSet0.vp_c9)._m0[89].z + (*spvDescriptorSet0.vp_c9)._m0[89].y;
    float _607 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _609 = fma(_535, (*spvDescriptorSet0.vp_c9)._m0[89].z, _605);
    float _611 = exp2(_537);
    float _613 = float(_363);
    float _615 = _525 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _617 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _619 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _621 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _623 = -_607;
    float _625 = fma(_547, 2.0, _623);
    float _627 = fma(_615, -2.0, _617);
    float _629 = 1.0 / _601;
    float _631 = fma(_485, (*spvDescriptorSet0.vp_c9)._m0[83].z, _619);
    float _633 = fma(_513, -2.0, _621);
    float _635 = (*spvDescriptorSet0.vp_c9)._m0[79].z + (*spvDescriptorSet0.vp_c9)._m0[79].y;
    float _637 = -_125;
    float _639 = fma(_637, (*spvDescriptorSet0.vp_c9)._m0[76].x, _339);
    float _641 = fma(_235, (*spvDescriptorSet0.vp_c9)._m0[79].z, _635);
    float _643 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _645 = !_581;
    int _647 = _645 ? 0 : 1;
    float _649 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _651 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _653 = isnan(1.0);
    bool _655 = _651 || _653;
    bool _657 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _659 = _655 || _657;
    float _661 = -_611;
    float _663 = _661 + 1.0;
    float _665 = float(_603);
    float _667 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    bool _669 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _671 = isnan(0.0);
    bool _673 = _669 || _671;
    bool _675 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _677 = _673 || _675;
    float _679 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _681 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[79].x, _641);
    float _683 = _665 * _613;
    float _685 = fma(_317, (*spvDescriptorSet0.vp_c9)._m0[78].w, _643);
    float _687 = _677 ? _663 : 0.0;
    float _689 = fma(_315, (*spvDescriptorSet0.vp_c9)._m0[78].z, _649);
    float _691 = fma(_315, (*spvDescriptorSet0.vp_c9)._m0[88].z, _667);
    float _693 = fma(_317, (*spvDescriptorSet0.vp_c9)._m0[88].w, _679);
    int _695 = abs(_647);
    float _697 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[77].w, _685);
    float _699 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[76].y, _343);
    float _701 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[77].z, _689);
    float _703 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[87].z, _691);
    float _705 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[87].w, _693);
    float _707 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[82].z, _631);
    float _709 = -_125;
    float _711 = fma(_709, (*spvDescriptorSet0.vp_c9)._m0[81].x, _563);
    float _713 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[81].y, _633);
    float _715 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[89].x, _609);
    float _717 = -_125;
    float _719 = fma(_717, (*spvDescriptorSet0.vp_c9)._m0[86].x, _625);
    float _721 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[86].y, _627);
    float _723 = _609;
    float _725 = _625;
    bool _727 = _585;
    if (_659)
    {
        float _729 = _687 * _629;
        _127 = _729;
    }
    float _731 = _127;
    float _733 = _683 * (-2.0);
    float _735 = float(_467);
    float _737 = _317 + (-0.5);
    float _739 = float(_695);
    float _741 = fma(_733, _589, _589);
    bool _743 = !_585;
    int _745 = _743 ? 0 : 1;
    float _747 = fma(_443, _733, _443);
    int _749 = _507 ? 0 : 1;
    float _751 = _739 * _735;
    int _753 = abs(_745);
    float _755 = _315 + (-0.5);
    int _757 = ~_749;
    int _759 = _757 + 1;
    int _761 = _759 + 1;
    float _763 = _751 * (-2.0);
    int _765 = _761;
    if (!_495)
    {
        int _767 = ~_749;
        int _769 = _767 + 1;
        _765 = _769;
    }
    int _771 = _765;
    float _773 = fma(_755, (*spvDescriptorSet0.vp_c9)._m0[196].x, _741);
    float _775 = fma(_763, _591, _591);
    float _777 = float(_771);
    float _779 = fma(_747, _731, _773);
    float _781 = float(_753);
    float _783 = fma(_431, _763, _431);
    float _785 = fma(_737, (*spvDescriptorSet0.vp_c9)._m0[196].y, _775);
    float _787 = _235 + _315;
    float _789 = _781 * _777;
    float _791 = fma(_783, _731, _785);
    float _793 = _787 + (-1.0);
    float _795 = _235 + (-0.5);
    float _797 = _789 * (-2.0);
    float _799 = _779 * 0.15915493667125701904296875;
    float _801 = in.m_58.x;
    float _803 = in.m_58.y;
    float _805 = fma(_793, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _807 = fma(_797, _593, _593);
    float _809 = _791 * 0.15915493667125701904296875;
    float _811 = _799 * 6.283185482025146484375;
    float _813 = sin(_811);
    float _815 = fma(_805, _797, _805);
    float _817 = fma(_795, (*spvDescriptorSet0.vp_c9)._m0[196].z, _807);
    float _819 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _173);
    float _821 = fma(_815, _731, _817);
    float _823 = _799 * 6.283185482025146484375;
    float _825 = cos(_823);
    float _827 = _821 * 0.15915493667125701904296875;
    float _829 = _827 * 6.283185482025146484375;
    float _831 = cos(_829);
    float _833 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _183);
    float _835 = _801 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _837 = _803 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _839 = _809 * 6.283185482025146484375;
    float _841 = sin(_839);
    float _843 = _835 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _845 = _837 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _847 = in.m_42.x;
    float _849 = in.m_42.y;
    float _851 = in.m_42.z;
    float _853 = _843 * _819;
    float _855 = _845 * _833;
    float _857 = _809 * 6.283185482025146484375;
    float _859 = cos(_857);
    float _861 = _831 * _855;
    float _863 = _827 * 6.283185482025146484375;
    float _865 = sin(_863);
    float _867 = _813 * _841;
    float _869 = _825 * _841;
    float _871 = _841 * _831;
    float _873 = _825 * _859;
    float _875 = _813 * _859;
    float _877 = _825 * _861;
    float _879 = _859 * _831;
    float _881 = fma(_865, _873, _867);
    float _883 = -_869;
    float _885 = fma(_865, _875, _883);
    float _887 = -_875;
    float _889 = fma(_865, _869, _887);
    float _891 = -_855;
    float _893 = _865 * _891;
    float _895 = fma(_881, _853, _877);
    float _897 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _899 = _813 * _861;
    float _901 = fma(_879, _853, _893);
    float _903 = fma(_865, _867, _873);
    float _905 = fma(_889, _897, _895);
    float _907 = fma(_885, _853, _899);
    float _909 = _849 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _911 = fma(_871, _897, _901);
    float _913 = _905 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _915 = fma(_903, _897, _907);
    float _917 = fma(_847, (*spvDescriptorSet0.vp_c10)._m0[6].x, _909);
    float _919 = _849 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _921 = _905 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _923 = fma(_911, (*spvDescriptorSet0.vp_c8)._m0[26].x, _913);
    float _925 = fma(_851, (*spvDescriptorSet0.vp_c10)._m0[6].z, _917);
    float _927 = fma(_847, (*spvDescriptorSet0.vp_c10)._m0[4].x, _919);
    float _929 = fma(_911, (*spvDescriptorSet0.vp_c8)._m0[24].x, _921);
    float _931 = fma(_915, (*spvDescriptorSet0.vp_c8)._m0[26].z, _923);
    float _933 = _925 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _935 = fma(_851, (*spvDescriptorSet0.vp_c10)._m0[4].z, _927);
    float _937 = fma(_915, (*spvDescriptorSet0.vp_c8)._m0[24].z, _929);
    float _939 = _931 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _941 = _849 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _943 = _935 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _945 = _937 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _947 = _933 + _939;
    float _949 = _905 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _951 = fma(_847, (*spvDescriptorSet0.vp_c10)._m0[5].x, _941);
    float _953 = _943 + _945;
    float _955 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _957 = _947 + _955;
    float _959 = fma(_911, (*spvDescriptorSet0.vp_c8)._m0[25].x, _949);
    float _961 = fma(_851, (*spvDescriptorSet0.vp_c10)._m0[5].z, _951);
    float _963 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _965 = _953 + _963;
    float _967 = _957 * _957;
    float _969 = fma(_915, (*spvDescriptorSet0.vp_c8)._m0[25].z, _959);
    float _971 = _961 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _973 = fma(_965, _965, _967);
    float _975 = _969 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _977 = _971 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _979 = sqrt(_973);
    float _981 = _971 + _975;
    float _983 = fma(_943, (*spvDescriptorSet0.vp_c8)._m0[11].x, _977);
    float _985 = fma(_933, (*spvDescriptorSet0.vp_c8)._m0[11].z, _983);
    bool _987 = _979 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _989 = _851;
    float _991 = _915;
    float _993 = _975;
    float _995 = _861;
    if (!_987)
    {
        _989 = _953;
    }
    float _997 = _989;
    float _999 = _997;
    if (!_987)
    {
        _991 = _947;
    }
    float _1001 = _991;
    float _1003 = _1001;
    if (!_987)
    {
        _993 = _981;
    }
    float _1005 = _993;
    bool _1007 = !_987;
    float _1009 = _1005;
    if (!_1007)
    {
        float _1011 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1013 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1015 = _979 + _1013;
        float _1017 = rsqrt(_973);
        float _1019 = _1015 * _1011;
        float _1021 = _981 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1023 = _1019 * 0.15915493667125701904296875;
        float _1025 = _1023 * 6.283185482025146484375;
        float _1027 = cos(_1025);
        float _1029 = _1023 * 6.283185482025146484375;
        float _1031 = sin(_1029);
        float _1033 = _1027 + (-1.0);
        float _1035 = fma(_1031, _1021, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1037 = _1033 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1039 = _1017 * _1035;
        float _1041 = fma(_981, _1027, _1037);
        float _1043 = fma(_965, _1039, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1045 = fma(_957, _1039, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1009 = _1041;
        _999 = _1043;
        _1003 = _1045;
    }
    float _1047 = _1009;
    float _1049 = _999;
    float _1051 = _1003;
    float _1053 = -_971;
    float _1055 = _1053 + _1047;
    float _1057 = -_943;
    float _1059 = _1057 + _1049;
    float _1061 = _985 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1063 = -_933;
    float _1065 = _1063 + _1051;
    float _1067 = _1055 * _1055;
    float _1069 = 1.0 / _1061;
    bool _1071 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1073 = isnan(0.5);
    bool _1075 = _1071 || _1073;
    bool _1077 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1079 = _1075 || _1077;
    float _1081 = fma(_1059, _1059, _1067);
    float _1083 = _971 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _1085 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1087 = isnan(0.5);
    bool _1089 = _1085 || _1087;
    bool _1091 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1093 = _1089 || _1091;
    float _1095 = fma(_1065, _1065, _1081);
    float _1097 = fma(_943, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1083);
    float _1099 = sqrt(_1095);
    float _1101 = fma(_933, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1097);
    float _1103 = _1101 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1105 = _1103 + _1061;
    float _1107 = _1105 * _1069;
    float _1109 = _1107 * 0.5;
    bool _1111 = _1099 > 0.0;
    float _1113 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1115 = fma(_1109, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1113);
    float _1117 = 1.0 / _1115;
    bool _1119 = !_1111;
    float _1121 = _1051;
    float _1123 = _1065;
    float _1125 = _1047;
    float _1127 = _1049;
    float _1129 = _1059;
    float _1131 = _1095;
    if (!_1119)
    {
        float _1133 = _187 * _187;
        float _1135 = fma(_185, _185, _1133);
        float _1137 = fma(_189, _189, _1135);
        float _1139 = rsqrt(_1095);
        float _1141 = sqrt(_1137);
        float _1143 = _1059 * _1139;
        float _1145 = _1065 * _1139;
        bool _1147 = _1141 > 0.0;
        float _1149 = _1055 * _1139;
        bool _1151 = !_1147;
        if (!_1151)
        {
            float _1153 = rsqrt(_1137);
            float _1155 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1157 = _187 * _1153;
            float _1159 = _185 * _1153;
            float _1161 = _189 * _1153;
            float _1163 = _1149 * _1157;
            float _1165 = fma(_1143, _1159, _1163);
            float _1167 = _1155 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1169 = fma(_1145, _1161, _1165);
            float _1171 = _1169 * _1167;
            float _1173 = fma(_185, _1171, _1049);
            float _1175 = fma(_187, _1171, _1047);
            float _1177 = fma(_189, _1171, _1051);
            _1121 = _1177;
            _1123 = _1157;
            _1125 = _1175;
            _1127 = _1173;
            _1129 = _1161;
            _1131 = _1155;
        }
    }
    float _1179 = _1121;
    float _1181 = _1123;
    float _1183 = _1125;
    float _1185 = _1127;
    float _1187 = _1129;
    float _1189 = _1131;
    float _1191 = _1183;
    float _1193 = _1185;
    float _1195 = _1187;
    float _1197 = _1181;
    float _1199 = _1179;
    float _1201 = _1189;
    if (_1093)
    {
        _199 = 1.0;
    }
    float _1203 = _199;
    float _1205 = _1203;
    if (_1079)
    {
        _201 = _1179;
    }
    float _1207 = _201;
    float _1209 = _1207;
    if (!_1079)
    {
        float _1211 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1213 = _971 + _1211;
        float _1215 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1217 = _943 + _1215;
        float _1219 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1221 = -_971;
        float _1223 = _1221 + _1183;
        float _1225 = _1213 * _1213;
        float _1227 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1229 = _933 + _1227;
        float _1231 = fma(_1217, _1217, _1225);
        float _1233 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1235 = fma(_1229, _1229, _1231);
        float _1237 = sqrt(_1235);
        float _1239 = _1219 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1241 = precise::min(_1237, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1243 = _1241 * _1233;
        float _1245 = -_943;
        float _1247 = _1245 + _1185;
        float _1249 = _1239 * _1243;
        float _1251 = -_933;
        float _1253 = _1251 + _1179;
        float _1255 = fma(_1247, _1249, _943);
        float _1257 = fma(_1223, _1249, _971);
        float _1259 = fma(_1253, _1249, _933);
        _1191 = _1257;
        _1193 = _1255;
        _1209 = _1259;
        _1195 = _1233;
        _1197 = _1253;
        _203 = _1249;
    }
    float _1261 = _1191;
    float _1263 = _1193;
    float _1265 = _1209;
    float _1267 = _1195;
    float _1269 = _1197;
    float _1271 = _203;
    float _1273 = _1271;
    float _1275 = _1269;
    if (_1093)
    {
        _1273 = 1.0;
    }
    float _1277 = _1273;
    float _1279 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1281 = _1117 * _1279;
    float _1283 = _1277;
    if (!_1093)
    {
        float _1285 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1287 = _1285 * 0.15915493667125701904296875;
        float _1289 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1291 = _1287 * 6.283185482025146484375;
        float _1293 = cos(_1291);
        float _1295 = _1289 * 0.15915493667125701904296875;
        float _1297 = _1287 * 6.283185482025146484375;
        float _1299 = sin(_1297);
        float _1301 = 1.0 / _1293;
        float _1303 = _1295 * 6.283185482025146484375;
        float _1305 = cos(_1303);
        float _1307 = _1299 * _1301;
        float _1309 = _1295 * 6.283185482025146484375;
        float _1311 = sin(_1309);
        float _1313 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1315 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1313;
        float _1317 = _1305 * _1307;
        float _1319 = 1.0 / _1317;
        float _1321 = 1.0 / _1315;
        float _1323 = _1311 * _1319;
        float _1325 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1327 = fma(_1281, _1323, _1325);
        float _1329 = _1327 * _1321;
        float _1331 = precise::clamp(_1329, 0.0, 1.0);
        _1199 = _1295;
        _1275 = _1287;
        _1205 = _1331;
    }
    float _1333 = _1199;
    float _1335 = _1275;
    float _1337 = _1205;
    float _1339 = _1333;
    if (!_1093)
    {
        float _1341 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1343 = _1341 * 0.15915493667125701904296875;
        float _1345 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1347 = _1343 * 6.283185482025146484375;
        float _1349 = cos(_1347);
        float _1351 = _1345 * 0.15915493667125701904296875;
        float _1353 = _1343 * 6.283185482025146484375;
        float _1355 = sin(_1353);
        float _1357 = 1.0 / _1349;
        float _1359 = _1351 * 6.283185482025146484375;
        float _1361 = cos(_1359);
        float _1363 = _1355 * _1357;
        float _1365 = _1351 * 6.283185482025146484375;
        float _1367 = sin(_1365);
        float _1369 = _1361 * _1363;
        float _1371 = 1.0 / _1369;
        float _1373 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1375 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1373;
        float _1377 = 1.0 / _1375;
        float _1379 = _1367 * _1371;
        float _1381 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1383 = fma(_1281, _1379, _1381);
        float _1385 = _1383 * _1377;
        float _1387 = precise::clamp(_1385, 0.0, 1.0);
        float _1389 = -_1387;
        float _1391 = _1389 + 1.0;
        _1339 = _1357;
        _1283 = _1391;
    }
    float _1393 = _1339;
    float _1395 = _1283;
    float _1397 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1399 = _1261 + _1397;
    float _1401 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1403 = _1263 + _1401;
    float _1405 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1407 = _1265 + _1405;
    float _1409 = _1399 * _1399;
    float _1411 = fma(_1403, _1403, _1409);
    float _1413 = fma(_1407, _1407, _1411);
    float _1415 = rsqrt(_1413);
    float _1417 = sqrt(_1413);
    float _1419 = _1415 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1421 = _1403 * _1419;
    float _1423 = _1407 * _1419;
    float _1425 = _1421 * _1421;
    float _1427 = _1423 * _1423;
    float _1429 = _1425 + _1427;
    float _1431 = sqrt(_1429);
    bool _1433 = _1431 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1435 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1437 = _1431 + _1435;
    float _1439 = _1393;
    float _1441 = _1429;
    float _1443 = _1437;
    float _1445 = _1399;
    float _1447 = _1421;
    float _1449 = _1423;
    float _1451 = _1427;
    bool _1453 = _1433;
    if (_1433)
    {
        float _1455 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1439 = _1455;
    }
    float _1457 = _1439;
    if (_1433)
    {
        float _1459 = rsqrt(_1429);
        _1441 = _1459;
    }
    float _1461 = _1441;
    if (_1433)
    {
        float _1463 = _1437 * _1457;
        _1443 = _1463;
    }
    float _1465 = _1443;
    if (_1433)
    {
        float _1467 = _1465 * 0.15915493667125701904296875;
        _1201 = _1467;
    }
    float _1469 = _1201;
    float _1471 = _1267;
    if (_1433)
    {
        float _1473 = _1469 * 6.283185482025146484375;
        float _1475 = sin(_1473);
        _1471 = _1475;
    }
    float _1477 = _1471;
    float _1479 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1481 = precise::max(0.0, _1479);
    float _1483 = _1335;
    float _1485 = _1481;
    float _1487 = _1479;
    if (_1433)
    {
        float _1489 = _1469 * 6.283185482025146484375;
        float _1491 = cos(_1489);
        _1483 = _1491;
    }
    float _1493 = _1483;
    float _1495 = -_1419;
    float _1497 = -_1481;
    float _1499 = fma(_1399, _1495, _1497);
    if (!_1433)
    {
        _1485 = _1425;
    }
    float _1501 = _1485;
    float _1503 = _1501;
    if (_1433)
    {
        float _1505 = _1499 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1445 = _1505;
    }
    float _1507 = _1445;
    float _1509 = _1507;
    float _1511 = _1477;
    if (_1433)
    {
        float _1513 = fma(_1477, _1507, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1509 = _1513;
    }
    float _1515 = _1509;
    float _1517 = _1515;
    if (_1433)
    {
        float _1519 = _1493 + (-1.0);
        _1487 = _1519;
    }
    float _1521 = _1487;
    if (_1433)
    {
        float _1523 = _1461 * _1515;
        _723 = _1523;
    }
    float _1525 = _723;
    if (!_1433)
    {
        _1517 = _1499;
    }
    float _1527 = _1517;
    float _1529 = _1527;
    if (_1433)
    {
        float _1531 = _1521 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1511 = _1531;
    }
    float _1533 = _1511;
    if (_1433)
    {
        float _1535 = _1421 * _1525;
        _1447 = _1535;
    }
    float _1537 = _1447;
    if (_1433)
    {
        float _1539 = _1423 * _1525;
        _1449 = _1539;
    }
    float _1541 = _1449;
    float _1543 = _1261 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (_1433)
    {
        float _1545 = fma(_1499, _1493, _1533);
        _1529 = _1545;
    }
    float _1547 = _1529;
    if (_1433)
    {
        float _1549 = _1537 * _1537;
        _1503 = _1549;
    }
    float _1551 = _1503;
    if (_1433)
    {
        float _1553 = _1541 * _1541;
        _1451 = _1553;
    }
    float _1555 = _1451;
    float _1557 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1559 = _1261 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1561 = fma(_1547, _1547, _1551);
    float _1563 = _1561 + _1555;
    float _1565 = fma(_1263, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1543);
    float _1567 = _1261 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1569 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1571 = fma(_1417, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1569);
    float _1573 = precise::clamp(_1571, 0.0, 1.0);
    float _1575 = fma(_1265, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1565);
    float _1577 = rsqrt(_1563);
    float _1579 = fma(_1263, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1567);
    float _1581 = _1261 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1583 = _1575 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1585 = fma(_1263, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1559);
    float _1587 = fma(_1265, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1579);
    float _1589 = -_1573;
    float _1591 = _1589 + 1.0;
    float _1593 = _1583 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1595 = fma(_1265, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1585);
    float _1597 = _1587 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1599 = fma(_1263, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1581);
    float _1601 = -_1593;
    float _1603 = fma(_1601, _1557, 1.0);
    float _1605 = _1595 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1607 = _1597 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1609 = abs(_1591);
    float _1611 = log2(_1609);
    float _1613 = fma(_1265, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1599);
    float _1615 = _1577 * _1537;
    float _1617 = fma(_1605, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1607);
    float _1619 = _1577 * _1547;
    float _1621 = _1577 * _1541;
    float _1623 = _1615 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1625 = fma(_1583, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1617);
    float _1627 = _1613 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1629 = log2(_1603);
    float _1631 = -_1623;
    float _1633 = fma(_1619, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1631);
    float _1635 = _1597 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1637 = fma(_1627, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1625);
    float _1639 = _1619 + 1.0;
    float _1641 = -_1621;
    float _1643 = fma(_1641, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1633);
    float _1645 = _1597 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1647 = _1611 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1649 = 1.0 / _1637;
    float _1651 = fma(_1643, -0.5, 0.5);
    float _1653 = fma(_1605, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1645);
    float _1655 = fma(_1605, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1635);
    float _1657 = fma(_1643, 0.5, 0.5);
    float _1659 = fma(_1583, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1655);
    float _1661 = exp2(_1647);
    float _1663 = fma(_1657, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1665 = _1629 * 0.693147182464599609375;
    float _1667 = fma(_1657, _1663, -0.212114393711090087890625);
    float _1669 = _1665 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1671 = sqrt(_1651);
    float _1673 = fma(_1583, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1653);
    float _1675 = fma(_1627, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1659);
    float _1677 = fma(_1657, _1667, 1.570728778839111328125);
    float _1679 = fma(_1627, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1673);
    float _1681 = _1675 * _1649;
    float _1683 = -_1619;
    float _1685 = fma(_1661, _1639, _1683);
    float _1687 = _1679 * _1649;
    float _1689 = fma(_1681, -0.5, 0.5);
    float _1691 = fma(_1687, 0.5, 0.5);
    float _1693 = fma(_1685, 0.5, 0.5);
    float _1695 = _1671 * 0.636619746685028076171875;
    float3 _4837 = float3(_1691, _1689, _1669);
    float _1697 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4837, float3(0.0), isnan(_4837)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4837, float3(0.0), isnan(_4837)), level(0.0)).x;
    float _1699 = -_1677;
    float _1701 = fma(_1695, _1699, 1.0);
    float3 _4853 = float3(_1691, _1689, _1669);
    float4 _1704 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4853, float3(0.0), isnan(_4853)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4853, float3(0.0), isnan(_4853)), level(0.0)).xyzw;
    float _1706 = _1704.x;
    float _1708 = _1704.y;
    float _1710 = _1704.z;
    float _1712 = _1704.w;
    float2 _4870 = float2(_1701, _1693);
    float3 _1716 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4870, float2(0.0), isnan(_4870)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4870, float2(0.0), isnan(_4870)), level(0.0)).xyz;
    float _1718 = _1716.x;
    float _1720 = _1716.y;
    float _1722 = _1716.z;
    int _1724 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _1726 = _1724 != 0;
    float _1728 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1730 = _233 + _1728;
    int _1732 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _1734 = _1732 != 0;
    float _1736 = _681 * (-0.15915493667125701904296875);
    float _1738 = -_421;
    float _1740 = _1738 + 1.0;
    float _1742 = _1736 * 6.283185482025146484375;
    float _1744 = sin(_1742);
    float _1746 = in.m_54.w;
    float _1748 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1750 = _1748 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1752 = _233 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1754 = isnan(_233);
    bool _1756 = _1752 || _1754;
    bool _1758 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1760 = _1756 || _1758;
    float _1762 = float(_1760);
    float _1764 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1766 = _1764 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1768 = _1681;
    if (_1726)
    {
        float _1770 = in.m_54.w;
        _1768 = _1770;
    }
    float _1772 = _1768;
    float _1774 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1776 = _1774 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    if (!_1726)
    {
        _725 = _173;
    }
    float _1778 = _725;
    float _1780 = -_1762;
    float _1782 = _1780 + 1.0;
    float _1784 = _1425;
    float _1786 = _1778;
    if (_1734)
    {
        float _1788 = in.m_54.x;
        _1784 = _1788;
    }
    float _1790 = _1784;
    float _1792 = 1.0 / _1776;
    if (!_1734)
    {
        _995 = _183;
    }
    float _1794 = _995;
    float _1796 = _1611 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _1798 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1800 = _1798 != 0;
    float _1802 = _1597 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _1804 = _233 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1806 = isnan(_233);
    bool _1808 = _1804 || _1806;
    bool _1810 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1812 = _1808 || _1810;
    float _1814 = float(_1812);
    float _1816 = -_707;
    float _1818 = _1816 + 1.0;
    float _1820 = 1.0 / _1750;
    float _1822 = fma(_1605, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1802);
    float _1824 = -_703;
    float _1826 = _1824 + 1.0;
    float _1828 = -_705;
    float _1830 = _1828 + 1.0;
    float _1832 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1834 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _1832;
    float _1836 = 1.0 / _1766;
    float _1838 = _1814 * _1782;
    float _1840 = -_1814;
    float _1842 = _1840 + 1.0;
    float _1844 = _1772;
    float _1846 = _1794;
    if (_1726)
    {
        float _1848 = _1772 * 3.1415927410125732421875;
        _1844 = _1848;
    }
    float _1850 = _1844;
    float _1852 = _1790;
    float _1854 = _1850;
    if (_1734)
    {
        float _1856 = _1790 * 3.1415927410125732421875;
        _1852 = _1856;
    }
    float _1858 = _1852;
    float _1860 = _1858;
    if (_1726)
    {
        float _1862 = _1850 * 0.15915493667125701904296875;
        _1854 = _1862;
    }
    float _1864 = _1854;
    float _1866 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    if (_1734)
    {
        float _1868 = _1858 * 0.15915493667125701904296875;
        _1860 = _1868;
    }
    float _1870 = _1860;
    float _1872 = _1834 * _1836;
    float _1874 = _1864;
    if (_1726)
    {
        float _1876 = _1864 * 6.283185482025146484375;
        float _1878 = sin(_1876);
        _1874 = _1878;
    }
    float _1880 = _1874;
    float _1882 = fma(_1872, _1730, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _1884 = _1870;
    if (_1734)
    {
        float _1886 = _1870 * 6.283185482025146484375;
        float _1888 = sin(_1886);
        _1884 = _1888;
    }
    float _1890 = _1884;
    float _1892 = _1866 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    if (_1726)
    {
        bool _1894 = _1880 > 0.5;
        _1453 = _1894;
    }
    bool _1896 = _1453;
    float _1898 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    if (_1726)
    {
        float _1900 = -_173;
        float _1902 = _1896 ? _1900 : _173;
        _1786 = _1902;
    }
    float _1904 = _1786;
    int _1906 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1908 = _1906 != 0;
    float _1910 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1912 = _1910 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    if (_1734)
    {
        bool _1914 = _1890 > 0.5;
        _727 = _1914;
    }
    bool _1916 = _727;
    float _1918 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _1920 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1922 = _1920 != 0;
    float _1924 = _1912 * _1820;
    if (_1734)
    {
        float _1926 = -_183;
        float _1928 = _1916 ? _1926 : _183;
        _1846 = _1928;
    }
    float _1930 = _1846;
    float _1932 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1934 = _233 + _1932;
    int _1936 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1938 = _1936 != 0;
    float _1940 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1942 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1940;
    bool _1944 = _1746 > 0.5;
    float _1946 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _1948 = _233 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1950 = isnan(_233);
    bool _1952 = _1948 || _1950;
    bool _1954 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1956 = _1952 || _1954;
    float _1958 = float(_1956);
    float _1960 = _1942 * _1792;
    float _1962 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1964 = _233 + _1962;
    float _1966 = _1958 * _1842;
    float _1968 = fma(_1960, _1964, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1970 = exp2(_1796);
    float _1972 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1974 = _1968 * _1966;
    float _1976 = -_1958;
    float _1978 = _1976 + 1.0;
    float _1980 = fma(_1924, _1934, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1982 = _1972 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1984 = fma(_1978, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1974);
    bool _1986 = _233 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1988 = isnan(_233);
    bool _1990 = _1986 || _1988;
    bool _1992 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1994 = _1990 || _1992;
    float _1996 = float(_1994);
    float _1998 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    float _2000 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2002 = -_1996;
    float _2004 = _2002 + 1.0;
    float _2006 = fma(_1980, _1838, _1984);
    float _2008 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2010 = -_173;
    int _2012 = _515 ? as_type<int>(_2010) : as_type<int>(_173);
    float _2014 = _1762 * _2004;
    float _2016 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2018 = _2000 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2020 = _2008 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _2022 = _315 > 0.5;
    float _2024 = fma(_1882, _2014, _2006);
    bool _2026 = !_1922;
    float _2028 = _2026 ? _173 : as_type<float>(_2012);
    float _2030 = _1898 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    float _2032 = _1904 + 0.5;
    out.m_60.x = _2018;
    out.m_60.y = _2020;
    out.m_60.z = _1982;
    out.m_60.w = _2016;
    float _2034 = _1736 * 6.283185482025146484375;
    float _2036 = cos(_2034);
    float _2038 = _1998 * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    float _2040 = -_173;
    int _2042 = _2022 ? as_type<int>(_2040) : as_type<int>(_173);
    float _2044 = _517 * (-0.15915493667125701904296875);
    float _2046 = fma(_2030, _2032, _459);
    float _2048 = -_183;
    int _2050 = _1944 ? as_type<int>(_2048) : as_type<int>(_183);
    float _2052 = _1946 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    bool _2054 = !_1800;
    float _2056 = _2054 ? _173 : as_type<float>(_2042);
    float _2058 = _715 * (-0.15915493667125701904296875);
    float _2060 = _2044 * 6.283185482025146484375;
    float _2062 = sin(_2060);
    float _2064 = -_183;
    int _2066 = _519 ? as_type<int>(_2064) : as_type<int>(_183);
    float _2068 = -_1970;
    float _2070 = _2068 + 1.0;
    bool _2072 = _1337 > 0.0;
    bool _2074 = isnan(_1337);
    bool _2076 = _2072 || _2074;
    bool _2078 = isnan(0.0);
    bool _2080 = _2076 || _2078;
    float _2082 = _1930 + (-0.5);
    float _2084 = fma(_1996, (*spvDescriptorSet0.vp_c9)._m0[118].x, _2024);
    float _2086 = -_2038;
    float _2088 = -_423;
    float _2090 = fma(_2086, _2082, _2088);
    float _2092 = -_1740;
    float _2094 = fma(_2092, _1904, _2046);
    float _2096 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2098 = _2044 * 6.283185482025146484375;
    float _2100 = cos(_2098);
    float _2102 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2104 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    bool _2106 = !_1908;
    float _2108 = _2106 ? _183 : as_type<float>(_2066);
    float _2110 = -_451;
    float _2112 = _2110 + 1.0;
    float _2114 = _2096 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2116 = _2104 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2118 = _2102 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2120 = _2058 * 6.283185482025146484375;
    float _2122 = sin(_2120);
    float _2124 = _2084 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2126 = _2108 * _1744;
    float _2128 = _2108 * _2036;
    float _2130 = fma(_2112, _1930, _2090);
    bool _2132 = !_1938;
    float _2134 = _2132 ? _183 : as_type<float>(_2050);
    out.m_62.x = _2116;
    out.m_62.y = _2114;
    out.m_62.z = _2118;
    out.m_62.w = _2124;
    float _2136 = -_2126;
    float _2138 = fma(_2056, _2036, _2136);
    float _2140 = _2058 * 6.283185482025146484375;
    float _2142 = cos(_2140);
    float _2144 = fma(_2056, _1744, _2128);
    float _2146 = _2134 * _2062;
    float _2148 = _2134 * _2100;
    float _2150 = _1918 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2152 = _2144 + (-0.5);
    float _2154 = -_2146;
    float _2156 = fma(_2028, _2100, _2154);
    float _2158 = fma(_2028, _2062, _2148);
    float _2160 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2162 = _2138 + 0.5;
    float _2164 = -_1892;
    float _2166 = -_699;
    float _2168 = fma(_2164, _2152, _2166);
    float _2170 = _2156 + 0.5;
    float _2172 = _567 * _2122;
    float _2174 = fma(_2150, _2162, _639);
    float _2176 = _2158 + (-0.5);
    float _2178 = fma(_2052, _2170, _711);
    float _2180 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _2182 = _567 * _2142;
    float _2184 = -_2172;
    float _2186 = fma(_573, _2142, _2184);
    float _2188 = -_701;
    float _2190 = _2188 + 1.0;
    float _2192 = -_1818;
    float _2194 = fma(_2156, _2192, _2178);
    float _2196 = fma(_573, _2122, _2182);
    float _2198 = _2186 + 0.5;
    float _2200 = _2070 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2202 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _2204 = _2160 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2206 = _2196 + (-0.5);
    float _2208 = fma(_1583, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1822);
    float _2210 = -_2190;
    float _2212 = fma(_2138, _2210, _2174);
    float _2214 = -_2204;
    float _2216 = -_713;
    float _2218 = fma(_2214, _2176, _2216);
    float _2220 = -_697;
    float _2222 = _2220 + 1.0;
    float _2224 = -_587;
    float _2226 = _2224 + 1.0;
    float _2228 = _2180 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _2230 = fma(_1627, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2208);
    float _2232 = fma(_2144, _2222, _2168);
    float _2234 = fma(_2158, _2226, _2218);
    float _2236 = -_2228;
    float _2238 = -_721;
    float _2240 = fma(_2236, _2206, _2238);
    float _2242 = _1337 * _1395;
    bool _2244 = _1395 <= 0.0;
    bool _2246 = !_2080;
    bool _2248 = _2244 || _2246;
    out.m_64.x = _2094;
    out.m_64.y = _2130;
    float _2250 = _2202 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _2252 = _2242 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2254 = fma(_2196, _1830, _2240);
    out.m_66.x = _2212;
    out.m_66.y = _2232;
    out.m_66.z = _2194;
    out.m_66.w = _2234;
    float _2256 = fma(_2250, _2198, _719);
    float _2258 = _2252 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2260 = _2230 + _1637;
    float _2262 = -_1826;
    float _2264 = fma(_2186, _2262, _2256);
    out.m_45.x = _2258;
    float _2266 = _2260 * 0.5;
    out.m_68.x = _2264;
    out.m_68.y = _2254;
    float _2268 = -_2200;
    float _2270 = _2268 + 1.0;
    out.gl_Position.x = _1679;
    out.gl_Position.y = _1675;
    out.gl_Position.z = _2230;
    out.gl_Position.w = _1637;
    out.m_70.z = _2266;
    out.m_70.w = _1637;
    float _2272 = _2200 * _1697;
    float _2274 = _1712 * _2272;
    float _2276 = _1712 * _2270;
    float _2278 = _1722 * _2272;
    float _2280 = fma(_1718, _2274, _1706);
    float _2282 = fma(_1720, _2274, _1708);
    float _2284 = fma(_1712, _2278, _1710);
    out.m_72.x = _2280;
    out.m_72.y = _2282;
    out.m_72.z = _2284;
    out.m_72.w = _2276;
    if (!_2248)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_45.x = 0.0;
    float _2286 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2286;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    bool _223 = false;
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
        float _2343 = as_type<float>(_107);
        out.gl_Position.z = _2343;
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
    float _127 = _125;
    if (_121)
    {
        float _129 = float(_91);
        _101 = _129;
    }
    float _131 = _101;
    bool _133 = _125 >= _131;
    bool _135 = !_121;
    bool _137 = _133 || _135;
    float _139 = _131;
    if (_137)
    {
        _139 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _141 = _139;
    if (_137)
    {
        out.m_45.x = 0.0;
    }
    if (_137)
    {
        float _143 = _141 * 5.0;
        _109 = as_type<int>(_143);
    }
    int _145 = _109;
    if (_137)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2413 = as_type<float>(_145);
        out.gl_Position.z = _2413;
    }
    if (_137)
    {
        return out;
    }
    float _147 = as_type<float>(int(gl_VertexIndex));
    float _149 = in.m_52.x;
    float _151 = in.m_52.y;
    float _153 = in.m_52.z;
    int _155 = as_type<int>(_147) & 1;
    bool _157 = _155 != 0;
    int _159 = as_type<int>(_147) & 2;
    bool _161 = _159 != 0;
    bool _163 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _165 = _151 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _167 = _151 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _169 = _151 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _171 = !_157;
    float _173 = _171 ? (-0.5) : 0.5;
    float _175 = fma(_149, (*spvDescriptorSet0.vp_c10)._m0[4].x, _165);
    float _177 = fma(_149, (*spvDescriptorSet0.vp_c10)._m0[5].x, _167);
    float _179 = fma(_149, (*spvDescriptorSet0.vp_c10)._m0[6].x, _169);
    bool _181 = !_161;
    float _183 = _181 ? (-0.5) : 0.5;
    float _185 = fma(_153, (*spvDescriptorSet0.vp_c10)._m0[4].z, _175);
    float _187 = fma(_153, (*spvDescriptorSet0.vp_c10)._m0[5].z, _177);
    float _189 = fma(_153, (*spvDescriptorSet0.vp_c10)._m0[6].z, _179);
    bool _191 = !_163;
    float _193 = _175;
    int _195 = as_type<int>(_177);
    float _197 = _147;
    float _199 = _189;
    float _201 = _185;
    float _203 = _187;
    float _221;
    if (!_191)
    {
        float _205 = in.m_54.x;
        float _207 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _209 = _205 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _211 = fma(_209, (*spvDescriptorSet0.vp_c9)._m0[11].y, _125);
        float _213 = _211 * _207;
        float _215 = floor(_213);
        float _217 = -_215;
        float _219 = _213 + _217;
        _193 = _213;
        _221 = _219;
        _223 = true;
    }
    else
    {
        float _225 = float(_91);
        float _227 = 1.0 / _225;
        float _229 = _125 * _227;
        _221 = _229;
    }
    _223 = false;
    float _231 = _193;
    float _233 = _221;
    float _235 = in.m_54.z;
    int _237 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _239 = _237 != 0;
    float _241 = 0.0;
    float _243 = 0.0;
    int _245 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z);
    float _247 = _231;
    if (_239)
    {
        float _249 = in.m_54.x;
        float _251 = in.m_54.y;
        _241 = _249;
        _243 = _251;
    }
    float _253 = _241;
    float _255 = _243;
    if (_239)
    {
        _245 = 0;
    }
    int _257 = _245;
    int _259 = _257;
    if (_239)
    {
        _195 = 0;
    }
    int _261 = _195;
    float _263 = _235 * 2.0;
    float _265 = floor(_263);
    float _267 = _253;
    float _269 = _255;
    int _271 = _261;
    if (_239)
    {
        _197 = _253;
    }
    float _273 = _197;
    float _275 = _273;
    if (_239)
    {
        _247 = _255;
    }
    float _277 = _247;
    bool _279 = _265 >= 0.0;
    bool _281 = isnan(_265);
    bool _283 = _279 || _281;
    bool _285 = isnan(0.0);
    bool _287 = _283 || _285;
    bool _289 = _265 > 0.0;
    int _291 = _287 ? 0 : 1;
    float _293 = _277;
    if (!_239)
    {
        float _295 = in.m_54.x;
        float _297 = in.m_54.y;
        float _299 = _295 * 3.1415927410125732421875;
        float _301 = _299 * 0.15915493667125701904296875;
        float _303 = _297 * 3.1415927410125732421875;
        float _305 = _303 * 0.15915493667125701904296875;
        float _307 = _301 * 6.283185482025146484375;
        float _309 = sin(_307);
        float _311 = _305 * 6.283185482025146484375;
        float _313 = sin(_311);
        _267 = _295;
        _269 = _297;
        _271 = 2;
        _259 = 1;
        _275 = _309;
        _293 = _313;
    }
    float _315 = _267;
    float _317 = _269;
    int _319 = _271;
    int _321 = _259;
    float _323 = _275;
    float _325 = _293;
    float _327 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _329 = _315 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _331 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _333 = _317 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _335 = _319 != 2;
    float _337 = -_327;
    float _339 = fma(_329, 2.0, _337);
    bool _341 = _321 != 1;
    float _343 = fma(_333, -2.0, _331);
    float _345 = _315 * 2.0;
    int _347 = ~_291;
    int _349 = _347 + 1;
    int _351 = _349 + 1;
    float _353 = _317 * 2.0;
    int _355 = _351;
    float _357 = _325;
    if (!_289)
    {
        int _359 = ~_291;
        int _361 = _359 + 1;
        _355 = _361;
    }
    int _363 = _355;
    float _365 = _317 + _235;
    float _367 = floor(_345);
    float _369 = _365 + (-1.0);
    float _371 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    float _373 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    float _375 = floor(_353);
    float _377 = fma(_323, (*spvDescriptorSet0.vp_c9)._m0[93].z, _371);
    float _379 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    float _381 = _323 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    float _383 = fma(_325, (*spvDescriptorSet0.vp_c9)._m0[93].w, _373);
    float _385 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    float _387 = _317 + _315;
    bool _389 = _367 > 0.0;
    float _391 = _325 * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    bool _393 = _367 >= 0.0;
    bool _395 = isnan(_367);
    bool _397 = _393 || _395;
    bool _399 = isnan(0.0);
    bool _401 = _397 || _399;
    float _403 = -_379;
    float _405 = fma(_381, 2.0, _403);
    float _407 = _381;
    float _409 = _391;
    float _411 = _369;
    if (!_341)
    {
        _407 = _315;
    }
    float _413 = _407;
    float _415 = _387 + (-1.0);
    int _417 = _401 ? 0 : 1;
    float _419 = fma(_391, -2.0, _385);
    float _421 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[92].z, _377);
    float _423 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[91].y, _419);
    int _425 = ~_417;
    int _427 = _425 + 1;
    int _429 = _427 + 1;
    float _431 = fma(_369, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _433 = 0.0;
    int _435 = _429;
    float _437 = _413;
    float _439 = _415;
    if (!_341)
    {
        _433 = _317;
    }
    float _441 = _433;
    float _443 = fma(_415, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _445 = 0.0;
    float _447 = _441;
    if (!_341)
    {
        _445 = _413;
    }
    float _449 = _445;
    float _451 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[92].w, _383);
    float _453 = _449;
    if (!_341)
    {
        _409 = _235;
    }
    float _455 = _409;
    float _457 = -_125;
    float _459 = fma(_457, (*spvDescriptorSet0.vp_c9)._m0[91].x, _405);
    float _461 = _455;
    if (!_389)
    {
        int _463 = ~_417;
        int _465 = _463 + 1;
        _435 = _465;
    }
    int _467 = _435;
    if (_341)
    {
        _437 = _315;
    }
    float _469 = _437;
    float _471 = _469;
    if (!_341)
    {
        _411 = _441;
    }
    float _473 = _411;
    float _475 = _473;
    if (!_341)
    {
        _439 = _455;
    }
    float _477 = _439;
    float _479 = (*spvDescriptorSet0.vp_c9)._m0[84].z + (*spvDescriptorSet0.vp_c9)._m0[84].y;
    float _481 = _477;
    if (_341)
    {
        _475 = _469;
    }
    float _483 = _475;
    if (_341)
    {
        _447 = _469;
    }
    float _485 = _447;
    if (_341)
    {
        _453 = _235;
    }
    float _487 = _453;
    if (_341)
    {
        _481 = _317;
    }
    float _489 = _481;
    if (_341)
    {
        _461 = _317;
    }
    float _491 = _461;
    float _493 = fma(_487, (*spvDescriptorSet0.vp_c9)._m0[84].z, _479);
    bool _495 = _375 > 0.0;
    float _497 = _483 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    bool _499 = _375 >= 0.0;
    bool _501 = isnan(_375);
    bool _503 = _499 || _501;
    bool _505 = isnan(0.0);
    bool _507 = _503 || _505;
    float _509 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _511 = log2(_509);
    float _513 = _489 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _515 = _235 > 0.5;
    float _517 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[84].x, _493);
    bool _519 = _317 > 0.5;
    if (_335)
    {
        _357 = _317;
    }
    float _521 = _357;
    float _523 = _521;
    if (!_335)
    {
        _523 = _469;
    }
    float _525 = _523;
    float _527 = 0.0;
    if (_335)
    {
        _527 = _235;
    }
    float _529 = _527;
    float _531 = _529;
    if (!_335)
    {
        _471 = _235;
    }
    float _533 = _471;
    if (!_335)
    {
        _531 = _317;
    }
    float _535 = _531;
    float _537 = _511 * _125;
    int _539 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _541 = _539 != 0;
    int _543 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _545 = _543 != 0;
    float _547 = _533 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _549 = -_183;
    int _551 = _515 ? as_type<int>(_549) : as_type<int>(_183);
    float _553 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _555 = -_173;
    int _557 = _519 ? as_type<int>(_555) : as_type<int>(_173);
    float _559 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _561 = -_553;
    float _563 = fma(_497, 2.0, _561);
    bool _565 = !_545;
    float _567 = _565 ? _183 : as_type<float>(_551);
    float _569 = fma(_491, (*spvDescriptorSet0.vp_c9)._m0[83].w, _559);
    bool _571 = !_541;
    float _573 = _571 ? _173 : as_type<float>(_557);
    int _575 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _577 = _575 != 0;
    int _579 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _581 = _579 != 0;
    int _583 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _585 = _583 != 0;
    float _587 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[82].w, _569);
    float _589 = in.m_56.x;
    float _591 = in.m_56.y;
    float _593 = in.m_56.z;
    bool _595 = !_577;
    int _597 = _595 ? 0 : 1;
    float _599 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _601 = 1.0 + _599;
    int _603 = abs(_597);
    float _605 = (*spvDescriptorSet0.vp_c9)._m0[89].z + (*spvDescriptorSet0.vp_c9)._m0[89].y;
    float _607 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _609 = fma(_535, (*spvDescriptorSet0.vp_c9)._m0[89].z, _605);
    float _611 = exp2(_537);
    float _613 = float(_363);
    float _615 = _525 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _617 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _619 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _621 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _623 = -_607;
    float _625 = fma(_547, 2.0, _623);
    float _627 = fma(_615, -2.0, _617);
    float _629 = 1.0 / _601;
    float _631 = fma(_485, (*spvDescriptorSet0.vp_c9)._m0[83].z, _619);
    float _633 = fma(_513, -2.0, _621);
    float _635 = (*spvDescriptorSet0.vp_c9)._m0[79].z + (*spvDescriptorSet0.vp_c9)._m0[79].y;
    float _637 = -_125;
    float _639 = fma(_637, (*spvDescriptorSet0.vp_c9)._m0[76].x, _339);
    float _641 = fma(_235, (*spvDescriptorSet0.vp_c9)._m0[79].z, _635);
    float _643 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _645 = !_581;
    int _647 = _645 ? 0 : 1;
    float _649 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _651 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _653 = isnan(1.0);
    bool _655 = _651 || _653;
    bool _657 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _659 = _655 || _657;
    float _661 = -_611;
    float _663 = _661 + 1.0;
    float _665 = float(_603);
    float _667 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    bool _669 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _671 = isnan(0.0);
    bool _673 = _669 || _671;
    bool _675 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _677 = _673 || _675;
    float _679 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _681 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[79].x, _641);
    float _683 = _665 * _613;
    float _685 = fma(_317, (*spvDescriptorSet0.vp_c9)._m0[78].w, _643);
    float _687 = _677 ? _663 : 0.0;
    float _689 = fma(_315, (*spvDescriptorSet0.vp_c9)._m0[78].z, _649);
    float _691 = fma(_315, (*spvDescriptorSet0.vp_c9)._m0[88].z, _667);
    float _693 = fma(_317, (*spvDescriptorSet0.vp_c9)._m0[88].w, _679);
    int _695 = abs(_647);
    float _697 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[77].w, _685);
    float _699 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[76].y, _343);
    float _701 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[77].z, _689);
    float _703 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[87].z, _691);
    float _705 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[87].w, _693);
    float _707 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[82].z, _631);
    float _709 = -_125;
    float _711 = fma(_709, (*spvDescriptorSet0.vp_c9)._m0[81].x, _563);
    float _713 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[81].y, _633);
    float _715 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[89].x, _609);
    float _717 = -_125;
    float _719 = fma(_717, (*spvDescriptorSet0.vp_c9)._m0[86].x, _625);
    float _721 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[86].y, _627);
    float _723 = _609;
    float _725 = _625;
    bool _727 = _585;
    if (_659)
    {
        float _729 = _687 * _629;
        _127 = _729;
    }
    float _731 = _127;
    float _733 = _683 * (-2.0);
    float _735 = float(_467);
    float _737 = _317 + (-0.5);
    float _739 = float(_695);
    float _741 = fma(_733, _589, _589);
    bool _743 = !_585;
    int _745 = _743 ? 0 : 1;
    float _747 = fma(_443, _733, _443);
    int _749 = _507 ? 0 : 1;
    float _751 = _739 * _735;
    int _753 = abs(_745);
    float _755 = _315 + (-0.5);
    int _757 = ~_749;
    int _759 = _757 + 1;
    int _761 = _759 + 1;
    float _763 = _751 * (-2.0);
    int _765 = _761;
    if (!_495)
    {
        int _767 = ~_749;
        int _769 = _767 + 1;
        _765 = _769;
    }
    int _771 = _765;
    float _773 = fma(_755, (*spvDescriptorSet0.vp_c9)._m0[196].x, _741);
    float _775 = fma(_763, _591, _591);
    float _777 = float(_771);
    float _779 = fma(_747, _731, _773);
    float _781 = float(_753);
    float _783 = fma(_431, _763, _431);
    float _785 = fma(_737, (*spvDescriptorSet0.vp_c9)._m0[196].y, _775);
    float _787 = _235 + _315;
    float _789 = _781 * _777;
    float _791 = fma(_783, _731, _785);
    float _793 = _787 + (-1.0);
    float _795 = _235 + (-0.5);
    float _797 = _789 * (-2.0);
    float _799 = _779 * 0.15915493667125701904296875;
    float _801 = in.m_58.x;
    float _803 = in.m_58.y;
    float _805 = fma(_793, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _807 = fma(_797, _593, _593);
    float _809 = _791 * 0.15915493667125701904296875;
    float _811 = _799 * 6.283185482025146484375;
    float _813 = sin(_811);
    float _815 = fma(_805, _797, _805);
    float _817 = fma(_795, (*spvDescriptorSet0.vp_c9)._m0[196].z, _807);
    float _819 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _173);
    float _821 = fma(_815, _731, _817);
    float _823 = _799 * 6.283185482025146484375;
    float _825 = cos(_823);
    float _827 = _821 * 0.15915493667125701904296875;
    float _829 = _827 * 6.283185482025146484375;
    float _831 = cos(_829);
    float _833 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _183);
    float _835 = _801 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _837 = _803 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _839 = _809 * 6.283185482025146484375;
    float _841 = sin(_839);
    float _843 = _835 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _845 = _837 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _847 = in.m_42.x;
    float _849 = in.m_42.y;
    float _851 = in.m_42.z;
    float _853 = _843 * _819;
    float _855 = _845 * _833;
    float _857 = _809 * 6.283185482025146484375;
    float _859 = cos(_857);
    float _861 = _831 * _855;
    float _863 = _827 * 6.283185482025146484375;
    float _865 = sin(_863);
    float _867 = _813 * _841;
    float _869 = _825 * _841;
    float _871 = _841 * _831;
    float _873 = _825 * _859;
    float _875 = _813 * _859;
    float _877 = _825 * _861;
    float _879 = _859 * _831;
    float _881 = fma(_865, _873, _867);
    float _883 = -_869;
    float _885 = fma(_865, _875, _883);
    float _887 = -_875;
    float _889 = fma(_865, _869, _887);
    float _891 = -_855;
    float _893 = _865 * _891;
    float _895 = fma(_881, _853, _877);
    float _897 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _899 = _813 * _861;
    float _901 = fma(_879, _853, _893);
    float _903 = fma(_865, _867, _873);
    float _905 = fma(_889, _897, _895);
    float _907 = fma(_885, _853, _899);
    float _909 = _849 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _911 = fma(_871, _897, _901);
    float _913 = _905 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _915 = fma(_903, _897, _907);
    float _917 = fma(_847, (*spvDescriptorSet0.vp_c10)._m0[6].x, _909);
    float _919 = _849 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _921 = _905 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _923 = fma(_911, (*spvDescriptorSet0.vp_c8)._m0[26].x, _913);
    float _925 = fma(_851, (*spvDescriptorSet0.vp_c10)._m0[6].z, _917);
    float _927 = fma(_847, (*spvDescriptorSet0.vp_c10)._m0[4].x, _919);
    float _929 = fma(_911, (*spvDescriptorSet0.vp_c8)._m0[24].x, _921);
    float _931 = fma(_915, (*spvDescriptorSet0.vp_c8)._m0[26].z, _923);
    float _933 = _925 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _935 = fma(_851, (*spvDescriptorSet0.vp_c10)._m0[4].z, _927);
    float _937 = fma(_915, (*spvDescriptorSet0.vp_c8)._m0[24].z, _929);
    float _939 = _931 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _941 = _849 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _943 = _935 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _945 = _937 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _947 = _933 + _939;
    float _949 = _905 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _951 = fma(_847, (*spvDescriptorSet0.vp_c10)._m0[5].x, _941);
    float _953 = _943 + _945;
    float _955 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _957 = _947 + _955;
    float _959 = fma(_911, (*spvDescriptorSet0.vp_c8)._m0[25].x, _949);
    float _961 = fma(_851, (*spvDescriptorSet0.vp_c10)._m0[5].z, _951);
    float _963 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _965 = _953 + _963;
    float _967 = _957 * _957;
    float _969 = fma(_915, (*spvDescriptorSet0.vp_c8)._m0[25].z, _959);
    float _971 = _961 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _973 = fma(_965, _965, _967);
    float _975 = _969 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _977 = _971 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _979 = sqrt(_973);
    float _981 = _971 + _975;
    float _983 = fma(_943, (*spvDescriptorSet0.vp_c8)._m0[11].x, _977);
    float _985 = fma(_933, (*spvDescriptorSet0.vp_c8)._m0[11].z, _983);
    bool _987 = _979 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _989 = _851;
    float _991 = _915;
    float _993 = _975;
    float _995 = _861;
    if (!_987)
    {
        _989 = _953;
    }
    float _997 = _989;
    float _999 = _997;
    if (!_987)
    {
        _991 = _947;
    }
    float _1001 = _991;
    float _1003 = _1001;
    if (!_987)
    {
        _993 = _981;
    }
    float _1005 = _993;
    bool _1007 = !_987;
    float _1009 = _1005;
    if (!_1007)
    {
        float _1011 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1013 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1015 = _979 + _1013;
        float _1017 = rsqrt(_973);
        float _1019 = _1015 * _1011;
        float _1021 = _981 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1023 = _1019 * 0.15915493667125701904296875;
        float _1025 = _1023 * 6.283185482025146484375;
        float _1027 = cos(_1025);
        float _1029 = _1023 * 6.283185482025146484375;
        float _1031 = sin(_1029);
        float _1033 = _1027 + (-1.0);
        float _1035 = fma(_1031, _1021, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1037 = _1033 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1039 = _1017 * _1035;
        float _1041 = fma(_981, _1027, _1037);
        float _1043 = fma(_965, _1039, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1045 = fma(_957, _1039, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1009 = _1041;
        _999 = _1043;
        _1003 = _1045;
    }
    float _1047 = _1009;
    float _1049 = _999;
    float _1051 = _1003;
    float _1053 = -_971;
    float _1055 = _1053 + _1047;
    float _1057 = -_943;
    float _1059 = _1057 + _1049;
    float _1061 = _985 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1063 = -_933;
    float _1065 = _1063 + _1051;
    float _1067 = _1055 * _1055;
    float _1069 = 1.0 / _1061;
    bool _1071 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1073 = isnan(0.5);
    bool _1075 = _1071 || _1073;
    bool _1077 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1079 = _1075 || _1077;
    float _1081 = fma(_1059, _1059, _1067);
    float _1083 = _971 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _1085 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1087 = isnan(0.5);
    bool _1089 = _1085 || _1087;
    bool _1091 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1093 = _1089 || _1091;
    float _1095 = fma(_1065, _1065, _1081);
    float _1097 = fma(_943, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1083);
    float _1099 = sqrt(_1095);
    float _1101 = fma(_933, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1097);
    float _1103 = _1101 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1105 = _1103 + _1061;
    float _1107 = _1105 * _1069;
    float _1109 = _1107 * 0.5;
    bool _1111 = _1099 > 0.0;
    float _1113 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1115 = fma(_1109, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1113);
    float _1117 = 1.0 / _1115;
    bool _1119 = !_1111;
    float _1121 = _1051;
    float _1123 = _1065;
    float _1125 = _1047;
    float _1127 = _1049;
    float _1129 = _1059;
    float _1131 = _1095;
    if (!_1119)
    {
        float _1133 = _187 * _187;
        float _1135 = fma(_185, _185, _1133);
        float _1137 = fma(_189, _189, _1135);
        float _1139 = rsqrt(_1095);
        float _1141 = sqrt(_1137);
        float _1143 = _1059 * _1139;
        float _1145 = _1065 * _1139;
        bool _1147 = _1141 > 0.0;
        float _1149 = _1055 * _1139;
        bool _1151 = !_1147;
        if (!_1151)
        {
            float _1153 = rsqrt(_1137);
            float _1155 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1157 = _187 * _1153;
            float _1159 = _185 * _1153;
            float _1161 = _189 * _1153;
            float _1163 = _1149 * _1157;
            float _1165 = fma(_1143, _1159, _1163);
            float _1167 = _1155 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1169 = fma(_1145, _1161, _1165);
            float _1171 = _1169 * _1167;
            float _1173 = fma(_185, _1171, _1049);
            float _1175 = fma(_187, _1171, _1047);
            float _1177 = fma(_189, _1171, _1051);
            _1121 = _1177;
            _1123 = _1157;
            _1125 = _1175;
            _1127 = _1173;
            _1129 = _1161;
            _1131 = _1155;
        }
    }
    float _1179 = _1121;
    float _1181 = _1123;
    float _1183 = _1125;
    float _1185 = _1127;
    float _1187 = _1129;
    float _1189 = _1131;
    float _1191 = _1183;
    float _1193 = _1185;
    float _1195 = _1187;
    float _1197 = _1181;
    float _1199 = _1179;
    float _1201 = _1189;
    if (_1093)
    {
        _199 = 1.0;
    }
    float _1203 = _199;
    float _1205 = _1203;
    if (_1079)
    {
        _201 = _1179;
    }
    float _1207 = _201;
    float _1209 = _1207;
    if (!_1079)
    {
        float _1211 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1213 = _971 + _1211;
        float _1215 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1217 = _943 + _1215;
        float _1219 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1221 = -_971;
        float _1223 = _1221 + _1183;
        float _1225 = _1213 * _1213;
        float _1227 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1229 = _933 + _1227;
        float _1231 = fma(_1217, _1217, _1225);
        float _1233 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1235 = fma(_1229, _1229, _1231);
        float _1237 = sqrt(_1235);
        float _1239 = _1219 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1241 = precise::min(_1237, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1243 = _1241 * _1233;
        float _1245 = -_943;
        float _1247 = _1245 + _1185;
        float _1249 = _1239 * _1243;
        float _1251 = -_933;
        float _1253 = _1251 + _1179;
        float _1255 = fma(_1247, _1249, _943);
        float _1257 = fma(_1223, _1249, _971);
        float _1259 = fma(_1253, _1249, _933);
        _1191 = _1257;
        _1193 = _1255;
        _1209 = _1259;
        _1195 = _1233;
        _1197 = _1253;
        _203 = _1249;
    }
    float _1261 = _1191;
    float _1263 = _1193;
    float _1265 = _1209;
    float _1267 = _1195;
    float _1269 = _1197;
    float _1271 = _203;
    float _1273 = _1271;
    float _1275 = _1269;
    if (_1093)
    {
        _1273 = 1.0;
    }
    float _1277 = _1273;
    float _1279 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1281 = _1117 * _1279;
    float _1283 = _1277;
    if (!_1093)
    {
        float _1285 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1287 = _1285 * 0.15915493667125701904296875;
        float _1289 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1291 = _1287 * 6.283185482025146484375;
        float _1293 = cos(_1291);
        float _1295 = _1289 * 0.15915493667125701904296875;
        float _1297 = _1287 * 6.283185482025146484375;
        float _1299 = sin(_1297);
        float _1301 = 1.0 / _1293;
        float _1303 = _1295 * 6.283185482025146484375;
        float _1305 = cos(_1303);
        float _1307 = _1299 * _1301;
        float _1309 = _1295 * 6.283185482025146484375;
        float _1311 = sin(_1309);
        float _1313 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1315 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1313;
        float _1317 = _1305 * _1307;
        float _1319 = 1.0 / _1317;
        float _1321 = 1.0 / _1315;
        float _1323 = _1311 * _1319;
        float _1325 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1327 = fma(_1281, _1323, _1325);
        float _1329 = _1327 * _1321;
        float _1331 = precise::clamp(_1329, 0.0, 1.0);
        _1199 = _1295;
        _1275 = _1287;
        _1205 = _1331;
    }
    float _1333 = _1199;
    float _1335 = _1275;
    float _1337 = _1205;
    float _1339 = _1333;
    if (!_1093)
    {
        float _1341 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1343 = _1341 * 0.15915493667125701904296875;
        float _1345 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1347 = _1343 * 6.283185482025146484375;
        float _1349 = cos(_1347);
        float _1351 = _1345 * 0.15915493667125701904296875;
        float _1353 = _1343 * 6.283185482025146484375;
        float _1355 = sin(_1353);
        float _1357 = 1.0 / _1349;
        float _1359 = _1351 * 6.283185482025146484375;
        float _1361 = cos(_1359);
        float _1363 = _1355 * _1357;
        float _1365 = _1351 * 6.283185482025146484375;
        float _1367 = sin(_1365);
        float _1369 = _1361 * _1363;
        float _1371 = 1.0 / _1369;
        float _1373 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1375 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1373;
        float _1377 = 1.0 / _1375;
        float _1379 = _1367 * _1371;
        float _1381 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1383 = fma(_1281, _1379, _1381);
        float _1385 = _1383 * _1377;
        float _1387 = precise::clamp(_1385, 0.0, 1.0);
        float _1389 = -_1387;
        float _1391 = _1389 + 1.0;
        _1339 = _1357;
        _1283 = _1391;
    }
    float _1393 = _1339;
    float _1395 = _1283;
    float _1397 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1399 = _1261 + _1397;
    float _1401 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1403 = _1263 + _1401;
    float _1405 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1407 = _1265 + _1405;
    float _1409 = _1399 * _1399;
    float _1411 = fma(_1403, _1403, _1409);
    float _1413 = fma(_1407, _1407, _1411);
    float _1415 = rsqrt(_1413);
    float _1417 = sqrt(_1413);
    float _1419 = _1415 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1421 = _1403 * _1419;
    float _1423 = _1407 * _1419;
    float _1425 = _1421 * _1421;
    float _1427 = _1423 * _1423;
    float _1429 = _1425 + _1427;
    float _1431 = sqrt(_1429);
    bool _1433 = _1431 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1435 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1437 = _1431 + _1435;
    float _1439 = _1393;
    float _1441 = _1429;
    float _1443 = _1437;
    float _1445 = _1399;
    float _1447 = _1421;
    float _1449 = _1423;
    float _1451 = _1427;
    bool _1453 = _1433;
    if (_1433)
    {
        float _1455 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1439 = _1455;
    }
    float _1457 = _1439;
    if (_1433)
    {
        float _1459 = rsqrt(_1429);
        _1441 = _1459;
    }
    float _1461 = _1441;
    if (_1433)
    {
        float _1463 = _1437 * _1457;
        _1443 = _1463;
    }
    float _1465 = _1443;
    if (_1433)
    {
        float _1467 = _1465 * 0.15915493667125701904296875;
        _1201 = _1467;
    }
    float _1469 = _1201;
    float _1471 = _1267;
    if (_1433)
    {
        float _1473 = _1469 * 6.283185482025146484375;
        float _1475 = sin(_1473);
        _1471 = _1475;
    }
    float _1477 = _1471;
    float _1479 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1481 = precise::max(0.0, _1479);
    float _1483 = _1335;
    float _1485 = _1481;
    float _1487 = _1479;
    if (_1433)
    {
        float _1489 = _1469 * 6.283185482025146484375;
        float _1491 = cos(_1489);
        _1483 = _1491;
    }
    float _1493 = _1483;
    float _1495 = -_1419;
    float _1497 = -_1481;
    float _1499 = fma(_1399, _1495, _1497);
    if (!_1433)
    {
        _1485 = _1425;
    }
    float _1501 = _1485;
    float _1503 = _1501;
    if (_1433)
    {
        float _1505 = _1499 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1445 = _1505;
    }
    float _1507 = _1445;
    float _1509 = _1507;
    float _1511 = _1477;
    if (_1433)
    {
        float _1513 = fma(_1477, _1507, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1509 = _1513;
    }
    float _1515 = _1509;
    float _1517 = _1515;
    if (_1433)
    {
        float _1519 = _1493 + (-1.0);
        _1487 = _1519;
    }
    float _1521 = _1487;
    if (_1433)
    {
        float _1523 = _1461 * _1515;
        _723 = _1523;
    }
    float _1525 = _723;
    if (!_1433)
    {
        _1517 = _1499;
    }
    float _1527 = _1517;
    float _1529 = _1527;
    if (_1433)
    {
        float _1531 = _1521 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1511 = _1531;
    }
    float _1533 = _1511;
    if (_1433)
    {
        float _1535 = _1421 * _1525;
        _1447 = _1535;
    }
    float _1537 = _1447;
    if (_1433)
    {
        float _1539 = _1423 * _1525;
        _1449 = _1539;
    }
    float _1541 = _1449;
    float _1543 = _1261 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (_1433)
    {
        float _1545 = fma(_1499, _1493, _1533);
        _1529 = _1545;
    }
    float _1547 = _1529;
    if (_1433)
    {
        float _1549 = _1537 * _1537;
        _1503 = _1549;
    }
    float _1551 = _1503;
    if (_1433)
    {
        float _1553 = _1541 * _1541;
        _1451 = _1553;
    }
    float _1555 = _1451;
    float _1557 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1559 = _1261 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1561 = fma(_1547, _1547, _1551);
    float _1563 = _1561 + _1555;
    float _1565 = fma(_1263, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1543);
    float _1567 = _1261 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1569 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1571 = fma(_1417, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1569);
    float _1573 = precise::clamp(_1571, 0.0, 1.0);
    float _1575 = fma(_1265, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1565);
    float _1577 = rsqrt(_1563);
    float _1579 = fma(_1263, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1567);
    float _1581 = _1261 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1583 = _1575 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1585 = fma(_1263, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1559);
    float _1587 = fma(_1265, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1579);
    float _1589 = -_1573;
    float _1591 = _1589 + 1.0;
    float _1593 = _1583 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1595 = fma(_1265, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1585);
    float _1597 = _1587 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1599 = fma(_1263, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1581);
    float _1601 = -_1593;
    float _1603 = fma(_1601, _1557, 1.0);
    float _1605 = _1595 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1607 = _1597 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1609 = abs(_1591);
    float _1611 = log2(_1609);
    float _1613 = fma(_1265, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1599);
    float _1615 = _1577 * _1537;
    float _1617 = fma(_1605, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1607);
    float _1619 = _1577 * _1547;
    float _1621 = _1577 * _1541;
    float _1623 = _1615 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1625 = fma(_1583, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1617);
    float _1627 = _1613 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1629 = log2(_1603);
    float _1631 = -_1623;
    float _1633 = fma(_1619, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1631);
    float _1635 = _1597 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1637 = fma(_1627, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1625);
    float _1639 = _1619 + 1.0;
    float _1641 = -_1621;
    float _1643 = fma(_1641, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1633);
    float _1645 = _1597 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1647 = _1611 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1649 = 1.0 / _1637;
    float _1651 = fma(_1643, -0.5, 0.5);
    float _1653 = fma(_1605, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1645);
    float _1655 = fma(_1605, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1635);
    float _1657 = fma(_1643, 0.5, 0.5);
    float _1659 = fma(_1583, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1655);
    float _1661 = exp2(_1647);
    float _1663 = fma(_1657, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1665 = _1629 * 0.693147182464599609375;
    float _1667 = fma(_1657, _1663, -0.212114393711090087890625);
    float _1669 = _1665 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1671 = sqrt(_1651);
    float _1673 = fma(_1583, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1653);
    float _1675 = fma(_1627, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1659);
    float _1677 = fma(_1657, _1667, 1.570728778839111328125);
    float _1679 = fma(_1627, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1673);
    float _1681 = _1675 * _1649;
    float _1683 = -_1619;
    float _1685 = fma(_1661, _1639, _1683);
    float _1687 = _1679 * _1649;
    float _1689 = fma(_1681, -0.5, 0.5);
    float _1691 = fma(_1687, 0.5, 0.5);
    float _1693 = fma(_1685, 0.5, 0.5);
    float _1695 = _1671 * 0.636619746685028076171875;
    float3 _4837 = float3(_1691, _1689, _1669);
    float _1697 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4837, float3(0.0), isnan(_4837)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4837, float3(0.0), isnan(_4837)), level(0.0)).x;
    float _1699 = -_1677;
    float _1701 = fma(_1695, _1699, 1.0);
    float3 _4853 = float3(_1691, _1689, _1669);
    float4 _1704 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4853, float3(0.0), isnan(_4853)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4853, float3(0.0), isnan(_4853)), level(0.0)).xyzw;
    float _1706 = _1704.x;
    float _1708 = _1704.y;
    float _1710 = _1704.z;
    float _1712 = _1704.w;
    float2 _4870 = float2(_1701, _1693);
    float3 _1716 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4870, float2(0.0), isnan(_4870)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4870, float2(0.0), isnan(_4870)), level(0.0)).xyz;
    float _1718 = _1716.x;
    float _1720 = _1716.y;
    float _1722 = _1716.z;
    int _1724 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _1726 = _1724 != 0;
    float _1728 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1730 = _233 + _1728;
    int _1732 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _1734 = _1732 != 0;
    float _1736 = _681 * (-0.15915493667125701904296875);
    float _1738 = -_421;
    float _1740 = _1738 + 1.0;
    float _1742 = _1736 * 6.283185482025146484375;
    float _1744 = sin(_1742);
    float _1746 = in.m_54.w;
    float _1748 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1750 = _1748 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1752 = _233 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1754 = isnan(_233);
    bool _1756 = _1752 || _1754;
    bool _1758 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1760 = _1756 || _1758;
    float _1762 = float(_1760);
    float _1764 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1766 = _1764 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1768 = _1681;
    if (_1726)
    {
        float _1770 = in.m_54.w;
        _1768 = _1770;
    }
    float _1772 = _1768;
    float _1774 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1776 = _1774 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    if (!_1726)
    {
        _725 = _173;
    }
    float _1778 = _725;
    float _1780 = -_1762;
    float _1782 = _1780 + 1.0;
    float _1784 = _1425;
    float _1786 = _1778;
    if (_1734)
    {
        float _1788 = in.m_54.x;
        _1784 = _1788;
    }
    float _1790 = _1784;
    float _1792 = 1.0 / _1776;
    if (!_1734)
    {
        _995 = _183;
    }
    float _1794 = _995;
    float _1796 = _1611 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _1798 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1800 = _1798 != 0;
    float _1802 = _1597 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _1804 = _233 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1806 = isnan(_233);
    bool _1808 = _1804 || _1806;
    bool _1810 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1812 = _1808 || _1810;
    float _1814 = float(_1812);
    float _1816 = -_707;
    float _1818 = _1816 + 1.0;
    float _1820 = 1.0 / _1750;
    float _1822 = fma(_1605, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1802);
    float _1824 = -_703;
    float _1826 = _1824 + 1.0;
    float _1828 = -_705;
    float _1830 = _1828 + 1.0;
    float _1832 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1834 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _1832;
    float _1836 = 1.0 / _1766;
    float _1838 = _1814 * _1782;
    float _1840 = -_1814;
    float _1842 = _1840 + 1.0;
    float _1844 = _1772;
    float _1846 = _1794;
    if (_1726)
    {
        float _1848 = _1772 * 3.1415927410125732421875;
        _1844 = _1848;
    }
    float _1850 = _1844;
    float _1852 = _1790;
    float _1854 = _1850;
    if (_1734)
    {
        float _1856 = _1790 * 3.1415927410125732421875;
        _1852 = _1856;
    }
    float _1858 = _1852;
    float _1860 = _1858;
    if (_1726)
    {
        float _1862 = _1850 * 0.15915493667125701904296875;
        _1854 = _1862;
    }
    float _1864 = _1854;
    float _1866 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    if (_1734)
    {
        float _1868 = _1858 * 0.15915493667125701904296875;
        _1860 = _1868;
    }
    float _1870 = _1860;
    float _1872 = _1834 * _1836;
    float _1874 = _1864;
    if (_1726)
    {
        float _1876 = _1864 * 6.283185482025146484375;
        float _1878 = sin(_1876);
        _1874 = _1878;
    }
    float _1880 = _1874;
    float _1882 = fma(_1872, _1730, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _1884 = _1870;
    if (_1734)
    {
        float _1886 = _1870 * 6.283185482025146484375;
        float _1888 = sin(_1886);
        _1884 = _1888;
    }
    float _1890 = _1884;
    float _1892 = _1866 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    if (_1726)
    {
        bool _1894 = _1880 > 0.5;
        _1453 = _1894;
    }
    bool _1896 = _1453;
    float _1898 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    if (_1726)
    {
        float _1900 = -_173;
        float _1902 = _1896 ? _1900 : _173;
        _1786 = _1902;
    }
    float _1904 = _1786;
    int _1906 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1908 = _1906 != 0;
    float _1910 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1912 = _1910 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    if (_1734)
    {
        bool _1914 = _1890 > 0.5;
        _727 = _1914;
    }
    bool _1916 = _727;
    float _1918 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _1920 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1922 = _1920 != 0;
    float _1924 = _1912 * _1820;
    if (_1734)
    {
        float _1926 = -_183;
        float _1928 = _1916 ? _1926 : _183;
        _1846 = _1928;
    }
    float _1930 = _1846;
    float _1932 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1934 = _233 + _1932;
    int _1936 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1938 = _1936 != 0;
    float _1940 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1942 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1940;
    bool _1944 = _1746 > 0.5;
    float _1946 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _1948 = _233 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1950 = isnan(_233);
    bool _1952 = _1948 || _1950;
    bool _1954 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1956 = _1952 || _1954;
    float _1958 = float(_1956);
    float _1960 = _1942 * _1792;
    float _1962 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1964 = _233 + _1962;
    float _1966 = _1958 * _1842;
    float _1968 = fma(_1960, _1964, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1970 = exp2(_1796);
    float _1972 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1974 = _1968 * _1966;
    float _1976 = -_1958;
    float _1978 = _1976 + 1.0;
    float _1980 = fma(_1924, _1934, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1982 = _1972 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1984 = fma(_1978, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1974);
    bool _1986 = _233 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1988 = isnan(_233);
    bool _1990 = _1986 || _1988;
    bool _1992 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1994 = _1990 || _1992;
    float _1996 = float(_1994);
    float _1998 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    float _2000 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2002 = -_1996;
    float _2004 = _2002 + 1.0;
    float _2006 = fma(_1980, _1838, _1984);
    float _2008 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2010 = -_173;
    int _2012 = _515 ? as_type<int>(_2010) : as_type<int>(_173);
    float _2014 = _1762 * _2004;
    float _2016 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2018 = _2000 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2020 = _2008 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _2022 = _315 > 0.5;
    float _2024 = fma(_1882, _2014, _2006);
    bool _2026 = !_1922;
    float _2028 = _2026 ? _173 : as_type<float>(_2012);
    float _2030 = _1898 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    float _2032 = _1904 + 0.5;
    out.m_60.x = _2018;
    out.m_60.y = _2020;
    out.m_60.z = _1982;
    out.m_60.w = _2016;
    float _2034 = _1736 * 6.283185482025146484375;
    float _2036 = cos(_2034);
    float _2038 = _1998 * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    float _2040 = -_173;
    int _2042 = _2022 ? as_type<int>(_2040) : as_type<int>(_173);
    float _2044 = _517 * (-0.15915493667125701904296875);
    float _2046 = fma(_2030, _2032, _459);
    float _2048 = -_183;
    int _2050 = _1944 ? as_type<int>(_2048) : as_type<int>(_183);
    float _2052 = _1946 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    bool _2054 = !_1800;
    float _2056 = _2054 ? _173 : as_type<float>(_2042);
    float _2058 = _715 * (-0.15915493667125701904296875);
    float _2060 = _2044 * 6.283185482025146484375;
    float _2062 = sin(_2060);
    float _2064 = -_183;
    int _2066 = _519 ? as_type<int>(_2064) : as_type<int>(_183);
    float _2068 = -_1970;
    float _2070 = _2068 + 1.0;
    bool _2072 = _1337 > 0.0;
    bool _2074 = isnan(_1337);
    bool _2076 = _2072 || _2074;
    bool _2078 = isnan(0.0);
    bool _2080 = _2076 || _2078;
    float _2082 = _1930 + (-0.5);
    float _2084 = fma(_1996, (*spvDescriptorSet0.vp_c9)._m0[118].x, _2024);
    float _2086 = -_2038;
    float _2088 = -_423;
    float _2090 = fma(_2086, _2082, _2088);
    float _2092 = -_1740;
    float _2094 = fma(_2092, _1904, _2046);
    float _2096 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2098 = _2044 * 6.283185482025146484375;
    float _2100 = cos(_2098);
    float _2102 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2104 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    bool _2106 = !_1908;
    float _2108 = _2106 ? _183 : as_type<float>(_2066);
    float _2110 = -_451;
    float _2112 = _2110 + 1.0;
    float _2114 = _2096 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2116 = _2104 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2118 = _2102 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2120 = _2058 * 6.283185482025146484375;
    float _2122 = sin(_2120);
    float _2124 = _2084 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2126 = _2108 * _1744;
    float _2128 = _2108 * _2036;
    float _2130 = fma(_2112, _1930, _2090);
    bool _2132 = !_1938;
    float _2134 = _2132 ? _183 : as_type<float>(_2050);
    out.m_62.x = _2116;
    out.m_62.y = _2114;
    out.m_62.z = _2118;
    out.m_62.w = _2124;
    float _2136 = -_2126;
    float _2138 = fma(_2056, _2036, _2136);
    float _2140 = _2058 * 6.283185482025146484375;
    float _2142 = cos(_2140);
    float _2144 = fma(_2056, _1744, _2128);
    float _2146 = _2134 * _2062;
    float _2148 = _2134 * _2100;
    float _2150 = _1918 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2152 = _2144 + (-0.5);
    float _2154 = -_2146;
    float _2156 = fma(_2028, _2100, _2154);
    float _2158 = fma(_2028, _2062, _2148);
    float _2160 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2162 = _2138 + 0.5;
    float _2164 = -_1892;
    float _2166 = -_699;
    float _2168 = fma(_2164, _2152, _2166);
    float _2170 = _2156 + 0.5;
    float _2172 = _567 * _2122;
    float _2174 = fma(_2150, _2162, _639);
    float _2176 = _2158 + (-0.5);
    float _2178 = fma(_2052, _2170, _711);
    float _2180 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _2182 = _567 * _2142;
    float _2184 = -_2172;
    float _2186 = fma(_573, _2142, _2184);
    float _2188 = -_701;
    float _2190 = _2188 + 1.0;
    float _2192 = -_1818;
    float _2194 = fma(_2156, _2192, _2178);
    float _2196 = fma(_573, _2122, _2182);
    float _2198 = _2186 + 0.5;
    float _2200 = _2070 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2202 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _2204 = _2160 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2206 = _2196 + (-0.5);
    float _2208 = fma(_1583, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1822);
    float _2210 = -_2190;
    float _2212 = fma(_2138, _2210, _2174);
    float _2214 = -_2204;
    float _2216 = -_713;
    float _2218 = fma(_2214, _2176, _2216);
    float _2220 = -_697;
    float _2222 = _2220 + 1.0;
    float _2224 = -_587;
    float _2226 = _2224 + 1.0;
    float _2228 = _2180 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _2230 = fma(_1627, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2208);
    float _2232 = fma(_2144, _2222, _2168);
    float _2234 = fma(_2158, _2226, _2218);
    float _2236 = -_2228;
    float _2238 = -_721;
    float _2240 = fma(_2236, _2206, _2238);
    float _2242 = _1337 * _1395;
    bool _2244 = _1395 <= 0.0;
    bool _2246 = !_2080;
    bool _2248 = _2244 || _2246;
    out.m_64.x = _2094;
    out.m_64.y = _2130;
    float _2250 = _2202 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _2252 = _2242 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2254 = fma(_2196, _1830, _2240);
    out.m_66.x = _2212;
    out.m_66.y = _2232;
    out.m_66.z = _2194;
    out.m_66.w = _2234;
    float _2256 = fma(_2250, _2198, _719);
    float _2258 = _2252 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2260 = _2230 + _1637;
    float _2262 = -_1826;
    float _2264 = fma(_2186, _2262, _2256);
    out.m_45.x = _2258;
    float _2266 = _2260 * 0.5;
    out.m_68.x = _2264;
    out.m_68.y = _2254;
    float _2268 = -_2200;
    float _2270 = _2268 + 1.0;
    out.gl_Position.x = _1679;
    out.gl_Position.y = _1675;
    out.gl_Position.z = _2230;
    out.gl_Position.w = _1637;
    out.m_70.z = _2266;
    out.m_70.w = _1637;
    float _2272 = _2200 * _1697;
    float _2274 = _1712 * _2272;
    float _2276 = _1712 * _2270;
    float _2278 = _1722 * _2272;
    float _2280 = fma(_1718, _2274, _1706);
    float _2282 = fma(_1720, _2274, _1708);
    float _2284 = fma(_1712, _2278, _1710);
    out.m_72.x = _2280;
    out.m_72.y = _2282;
    out.m_72.z = _2284;
    out.m_72.w = _2276;
    if (!_2248)
    {
        return out;
    }
    out.m_45.x = 0.0;
    float _2286 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2286;
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
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    bool _223 = false;
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
        float _2343 = as_type<float>(_107);
        out.gl_Position.z = _2343;
    }
    if (!_95)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _111 = in.m_47.w;
    bool _113 = _111 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _115 = isnan(_111);
    bool _117 = _113 || _115;
    bool _119 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _121 = _117 || _119;
    float _123 = -_111;
    float _125 = _123 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _127 = _125;
    if (_121)
    {
        float _129 = float(_91);
        _101 = _129;
    }
    float _131 = _101;
    bool _133 = _125 >= _131;
    bool _135 = !_121;
    bool _137 = _133 || _135;
    float _139 = _131;
    if (_137)
    {
        _139 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _141 = _139;
    if (_137)
    {
        out.m_45.x = 0.0;
    }
    if (_137)
    {
        float _143 = _141 * 5.0;
        _109 = as_type<int>(_143);
    }
    int _145 = _109;
    if (_137)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2413 = as_type<float>(_145);
        out.gl_Position.z = _2413;
    }
    if (_137)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _147 = as_type<float>(int(gl_VertexIndex));
    float _149 = in.m_52.x;
    float _151 = in.m_52.y;
    float _153 = in.m_52.z;
    int _155 = as_type<int>(_147) & 1;
    bool _157 = _155 != 0;
    int _159 = as_type<int>(_147) & 2;
    bool _161 = _159 != 0;
    bool _163 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _165 = _151 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _167 = _151 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _169 = _151 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _171 = !_157;
    float _173 = _171 ? (-0.5) : 0.5;
    float _175 = fma(_149, (*spvDescriptorSet0.vp_c10)._m0[4].x, _165);
    float _177 = fma(_149, (*spvDescriptorSet0.vp_c10)._m0[5].x, _167);
    float _179 = fma(_149, (*spvDescriptorSet0.vp_c10)._m0[6].x, _169);
    bool _181 = !_161;
    float _183 = _181 ? (-0.5) : 0.5;
    float _185 = fma(_153, (*spvDescriptorSet0.vp_c10)._m0[4].z, _175);
    float _187 = fma(_153, (*spvDescriptorSet0.vp_c10)._m0[5].z, _177);
    float _189 = fma(_153, (*spvDescriptorSet0.vp_c10)._m0[6].z, _179);
    bool _191 = !_163;
    float _193 = _175;
    int _195 = as_type<int>(_177);
    float _197 = _147;
    float _199 = _189;
    float _201 = _185;
    float _203 = _187;
    float _221;
    if (!_191)
    {
        float _205 = in.m_54.x;
        float _207 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _209 = _205 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _211 = fma(_209, (*spvDescriptorSet0.vp_c9)._m0[11].y, _125);
        float _213 = _211 * _207;
        float _215 = floor(_213);
        float _217 = -_215;
        float _219 = _213 + _217;
        _193 = _213;
        _221 = _219;
        _223 = true;
    }
    else
    {
        float _225 = float(_91);
        float _227 = 1.0 / _225;
        float _229 = _125 * _227;
        _221 = _229;
    }
    _223 = false;
    float _231 = _193;
    float _233 = _221;
    float _235 = in.m_54.z;
    int _237 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _239 = _237 != 0;
    float _241 = 0.0;
    float _243 = 0.0;
    int _245 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z);
    float _247 = _231;
    if (_239)
    {
        float _249 = in.m_54.x;
        float _251 = in.m_54.y;
        _241 = _249;
        _243 = _251;
    }
    float _253 = _241;
    float _255 = _243;
    if (_239)
    {
        _245 = 0;
    }
    int _257 = _245;
    int _259 = _257;
    if (_239)
    {
        _195 = 0;
    }
    int _261 = _195;
    float _263 = _235 * 2.0;
    float _265 = floor(_263);
    float _267 = _253;
    float _269 = _255;
    int _271 = _261;
    if (_239)
    {
        _197 = _253;
    }
    float _273 = _197;
    float _275 = _273;
    if (_239)
    {
        _247 = _255;
    }
    float _277 = _247;
    bool _279 = _265 >= 0.0;
    bool _281 = isnan(_265);
    bool _283 = _279 || _281;
    bool _285 = isnan(0.0);
    bool _287 = _283 || _285;
    bool _289 = _265 > 0.0;
    int _291 = _287 ? 0 : 1;
    float _293 = _277;
    if (!_239)
    {
        float _295 = in.m_54.x;
        float _297 = in.m_54.y;
        float _299 = _295 * 3.1415927410125732421875;
        float _301 = _299 * 0.15915493667125701904296875;
        float _303 = _297 * 3.1415927410125732421875;
        float _305 = _303 * 0.15915493667125701904296875;
        float _307 = _301 * 6.283185482025146484375;
        float _309 = sin(_307);
        float _311 = _305 * 6.283185482025146484375;
        float _313 = sin(_311);
        _267 = _295;
        _269 = _297;
        _271 = 2;
        _259 = 1;
        _275 = _309;
        _293 = _313;
    }
    float _315 = _267;
    float _317 = _269;
    int _319 = _271;
    int _321 = _259;
    float _323 = _275;
    float _325 = _293;
    float _327 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _329 = _315 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _331 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _333 = _317 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _335 = _319 != 2;
    float _337 = -_327;
    float _339 = fma(_329, 2.0, _337);
    bool _341 = _321 != 1;
    float _343 = fma(_333, -2.0, _331);
    float _345 = _315 * 2.0;
    int _347 = ~_291;
    int _349 = _347 + 1;
    int _351 = _349 + 1;
    float _353 = _317 * 2.0;
    int _355 = _351;
    float _357 = _325;
    if (!_289)
    {
        int _359 = ~_291;
        int _361 = _359 + 1;
        _355 = _361;
    }
    int _363 = _355;
    float _365 = _317 + _235;
    float _367 = floor(_345);
    float _369 = _365 + (-1.0);
    float _371 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    float _373 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    float _375 = floor(_353);
    float _377 = fma(_323, (*spvDescriptorSet0.vp_c9)._m0[93].z, _371);
    float _379 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    float _381 = _323 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    float _383 = fma(_325, (*spvDescriptorSet0.vp_c9)._m0[93].w, _373);
    float _385 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    float _387 = _317 + _315;
    bool _389 = _367 > 0.0;
    float _391 = _325 * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    bool _393 = _367 >= 0.0;
    bool _395 = isnan(_367);
    bool _397 = _393 || _395;
    bool _399 = isnan(0.0);
    bool _401 = _397 || _399;
    float _403 = -_379;
    float _405 = fma(_381, 2.0, _403);
    float _407 = _381;
    float _409 = _391;
    float _411 = _369;
    if (!_341)
    {
        _407 = _315;
    }
    float _413 = _407;
    float _415 = _387 + (-1.0);
    int _417 = _401 ? 0 : 1;
    float _419 = fma(_391, -2.0, _385);
    float _421 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[92].z, _377);
    float _423 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[91].y, _419);
    int _425 = ~_417;
    int _427 = _425 + 1;
    int _429 = _427 + 1;
    float _431 = fma(_369, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _433 = 0.0;
    int _435 = _429;
    float _437 = _413;
    float _439 = _415;
    if (!_341)
    {
        _433 = _317;
    }
    float _441 = _433;
    float _443 = fma(_415, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _445 = 0.0;
    float _447 = _441;
    if (!_341)
    {
        _445 = _413;
    }
    float _449 = _445;
    float _451 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[92].w, _383);
    float _453 = _449;
    if (!_341)
    {
        _409 = _235;
    }
    float _455 = _409;
    float _457 = -_125;
    float _459 = fma(_457, (*spvDescriptorSet0.vp_c9)._m0[91].x, _405);
    float _461 = _455;
    if (!_389)
    {
        int _463 = ~_417;
        int _465 = _463 + 1;
        _435 = _465;
    }
    int _467 = _435;
    if (_341)
    {
        _437 = _315;
    }
    float _469 = _437;
    float _471 = _469;
    if (!_341)
    {
        _411 = _441;
    }
    float _473 = _411;
    float _475 = _473;
    if (!_341)
    {
        _439 = _455;
    }
    float _477 = _439;
    float _479 = (*spvDescriptorSet0.vp_c9)._m0[84].z + (*spvDescriptorSet0.vp_c9)._m0[84].y;
    float _481 = _477;
    if (_341)
    {
        _475 = _469;
    }
    float _483 = _475;
    if (_341)
    {
        _447 = _469;
    }
    float _485 = _447;
    if (_341)
    {
        _453 = _235;
    }
    float _487 = _453;
    if (_341)
    {
        _481 = _317;
    }
    float _489 = _481;
    if (_341)
    {
        _461 = _317;
    }
    float _491 = _461;
    float _493 = fma(_487, (*spvDescriptorSet0.vp_c9)._m0[84].z, _479);
    bool _495 = _375 > 0.0;
    float _497 = _483 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    bool _499 = _375 >= 0.0;
    bool _501 = isnan(_375);
    bool _503 = _499 || _501;
    bool _505 = isnan(0.0);
    bool _507 = _503 || _505;
    float _509 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _511 = log2(_509);
    float _513 = _489 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _515 = _235 > 0.5;
    float _517 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[84].x, _493);
    bool _519 = _317 > 0.5;
    if (_335)
    {
        _357 = _317;
    }
    float _521 = _357;
    float _523 = _521;
    if (!_335)
    {
        _523 = _469;
    }
    float _525 = _523;
    float _527 = 0.0;
    if (_335)
    {
        _527 = _235;
    }
    float _529 = _527;
    float _531 = _529;
    if (!_335)
    {
        _471 = _235;
    }
    float _533 = _471;
    if (!_335)
    {
        _531 = _317;
    }
    float _535 = _531;
    float _537 = _511 * _125;
    int _539 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _541 = _539 != 0;
    int _543 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _545 = _543 != 0;
    float _547 = _533 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _549 = -_183;
    int _551 = _515 ? as_type<int>(_549) : as_type<int>(_183);
    float _553 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _555 = -_173;
    int _557 = _519 ? as_type<int>(_555) : as_type<int>(_173);
    float _559 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _561 = -_553;
    float _563 = fma(_497, 2.0, _561);
    bool _565 = !_545;
    float _567 = _565 ? _183 : as_type<float>(_551);
    float _569 = fma(_491, (*spvDescriptorSet0.vp_c9)._m0[83].w, _559);
    bool _571 = !_541;
    float _573 = _571 ? _173 : as_type<float>(_557);
    int _575 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _577 = _575 != 0;
    int _579 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _581 = _579 != 0;
    int _583 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _585 = _583 != 0;
    float _587 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[82].w, _569);
    float _589 = in.m_56.x;
    float _591 = in.m_56.y;
    float _593 = in.m_56.z;
    bool _595 = !_577;
    int _597 = _595 ? 0 : 1;
    float _599 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _601 = 1.0 + _599;
    int _603 = abs(_597);
    float _605 = (*spvDescriptorSet0.vp_c9)._m0[89].z + (*spvDescriptorSet0.vp_c9)._m0[89].y;
    float _607 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _609 = fma(_535, (*spvDescriptorSet0.vp_c9)._m0[89].z, _605);
    float _611 = exp2(_537);
    float _613 = float(_363);
    float _615 = _525 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _617 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _619 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _621 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _623 = -_607;
    float _625 = fma(_547, 2.0, _623);
    float _627 = fma(_615, -2.0, _617);
    float _629 = 1.0 / _601;
    float _631 = fma(_485, (*spvDescriptorSet0.vp_c9)._m0[83].z, _619);
    float _633 = fma(_513, -2.0, _621);
    float _635 = (*spvDescriptorSet0.vp_c9)._m0[79].z + (*spvDescriptorSet0.vp_c9)._m0[79].y;
    float _637 = -_125;
    float _639 = fma(_637, (*spvDescriptorSet0.vp_c9)._m0[76].x, _339);
    float _641 = fma(_235, (*spvDescriptorSet0.vp_c9)._m0[79].z, _635);
    float _643 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _645 = !_581;
    int _647 = _645 ? 0 : 1;
    float _649 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _651 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _653 = isnan(1.0);
    bool _655 = _651 || _653;
    bool _657 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _659 = _655 || _657;
    float _661 = -_611;
    float _663 = _661 + 1.0;
    float _665 = float(_603);
    float _667 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    bool _669 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _671 = isnan(0.0);
    bool _673 = _669 || _671;
    bool _675 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _677 = _673 || _675;
    float _679 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _681 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[79].x, _641);
    float _683 = _665 * _613;
    float _685 = fma(_317, (*spvDescriptorSet0.vp_c9)._m0[78].w, _643);
    float _687 = _677 ? _663 : 0.0;
    float _689 = fma(_315, (*spvDescriptorSet0.vp_c9)._m0[78].z, _649);
    float _691 = fma(_315, (*spvDescriptorSet0.vp_c9)._m0[88].z, _667);
    float _693 = fma(_317, (*spvDescriptorSet0.vp_c9)._m0[88].w, _679);
    int _695 = abs(_647);
    float _697 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[77].w, _685);
    float _699 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[76].y, _343);
    float _701 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[77].z, _689);
    float _703 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[87].z, _691);
    float _705 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[87].w, _693);
    float _707 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[82].z, _631);
    float _709 = -_125;
    float _711 = fma(_709, (*spvDescriptorSet0.vp_c9)._m0[81].x, _563);
    float _713 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[81].y, _633);
    float _715 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[89].x, _609);
    float _717 = -_125;
    float _719 = fma(_717, (*spvDescriptorSet0.vp_c9)._m0[86].x, _625);
    float _721 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[86].y, _627);
    float _723 = _609;
    float _725 = _625;
    bool _727 = _585;
    if (_659)
    {
        float _729 = _687 * _629;
        _127 = _729;
    }
    float _731 = _127;
    float _733 = _683 * (-2.0);
    float _735 = float(_467);
    float _737 = _317 + (-0.5);
    float _739 = float(_695);
    float _741 = fma(_733, _589, _589);
    bool _743 = !_585;
    int _745 = _743 ? 0 : 1;
    float _747 = fma(_443, _733, _443);
    int _749 = _507 ? 0 : 1;
    float _751 = _739 * _735;
    int _753 = abs(_745);
    float _755 = _315 + (-0.5);
    int _757 = ~_749;
    int _759 = _757 + 1;
    int _761 = _759 + 1;
    float _763 = _751 * (-2.0);
    int _765 = _761;
    if (!_495)
    {
        int _767 = ~_749;
        int _769 = _767 + 1;
        _765 = _769;
    }
    int _771 = _765;
    float _773 = fma(_755, (*spvDescriptorSet0.vp_c9)._m0[196].x, _741);
    float _775 = fma(_763, _591, _591);
    float _777 = float(_771);
    float _779 = fma(_747, _731, _773);
    float _781 = float(_753);
    float _783 = fma(_431, _763, _431);
    float _785 = fma(_737, (*spvDescriptorSet0.vp_c9)._m0[196].y, _775);
    float _787 = _235 + _315;
    float _789 = _781 * _777;
    float _791 = fma(_783, _731, _785);
    float _793 = _787 + (-1.0);
    float _795 = _235 + (-0.5);
    float _797 = _789 * (-2.0);
    float _799 = _779 * 0.15915493667125701904296875;
    float _801 = in.m_58.x;
    float _803 = in.m_58.y;
    float _805 = fma(_793, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _807 = fma(_797, _593, _593);
    float _809 = _791 * 0.15915493667125701904296875;
    float _811 = _799 * 6.283185482025146484375;
    float _813 = sin(_811);
    float _815 = fma(_805, _797, _805);
    float _817 = fma(_795, (*spvDescriptorSet0.vp_c9)._m0[196].z, _807);
    float _819 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _173);
    float _821 = fma(_815, _731, _817);
    float _823 = _799 * 6.283185482025146484375;
    float _825 = cos(_823);
    float _827 = _821 * 0.15915493667125701904296875;
    float _829 = _827 * 6.283185482025146484375;
    float _831 = cos(_829);
    float _833 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _183);
    float _835 = _801 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _837 = _803 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _839 = _809 * 6.283185482025146484375;
    float _841 = sin(_839);
    float _843 = _835 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _845 = _837 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _847 = in.m_42.x;
    float _849 = in.m_42.y;
    float _851 = in.m_42.z;
    float _853 = _843 * _819;
    float _855 = _845 * _833;
    float _857 = _809 * 6.283185482025146484375;
    float _859 = cos(_857);
    float _861 = _831 * _855;
    float _863 = _827 * 6.283185482025146484375;
    float _865 = sin(_863);
    float _867 = _813 * _841;
    float _869 = _825 * _841;
    float _871 = _841 * _831;
    float _873 = _825 * _859;
    float _875 = _813 * _859;
    float _877 = _825 * _861;
    float _879 = _859 * _831;
    float _881 = fma(_865, _873, _867);
    float _883 = -_869;
    float _885 = fma(_865, _875, _883);
    float _887 = -_875;
    float _889 = fma(_865, _869, _887);
    float _891 = -_855;
    float _893 = _865 * _891;
    float _895 = fma(_881, _853, _877);
    float _897 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _899 = _813 * _861;
    float _901 = fma(_879, _853, _893);
    float _903 = fma(_865, _867, _873);
    float _905 = fma(_889, _897, _895);
    float _907 = fma(_885, _853, _899);
    float _909 = _849 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _911 = fma(_871, _897, _901);
    float _913 = _905 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _915 = fma(_903, _897, _907);
    float _917 = fma(_847, (*spvDescriptorSet0.vp_c10)._m0[6].x, _909);
    float _919 = _849 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _921 = _905 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _923 = fma(_911, (*spvDescriptorSet0.vp_c8)._m0[26].x, _913);
    float _925 = fma(_851, (*spvDescriptorSet0.vp_c10)._m0[6].z, _917);
    float _927 = fma(_847, (*spvDescriptorSet0.vp_c10)._m0[4].x, _919);
    float _929 = fma(_911, (*spvDescriptorSet0.vp_c8)._m0[24].x, _921);
    float _931 = fma(_915, (*spvDescriptorSet0.vp_c8)._m0[26].z, _923);
    float _933 = _925 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _935 = fma(_851, (*spvDescriptorSet0.vp_c10)._m0[4].z, _927);
    float _937 = fma(_915, (*spvDescriptorSet0.vp_c8)._m0[24].z, _929);
    float _939 = _931 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _941 = _849 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _943 = _935 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _945 = _937 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _947 = _933 + _939;
    float _949 = _905 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _951 = fma(_847, (*spvDescriptorSet0.vp_c10)._m0[5].x, _941);
    float _953 = _943 + _945;
    float _955 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _957 = _947 + _955;
    float _959 = fma(_911, (*spvDescriptorSet0.vp_c8)._m0[25].x, _949);
    float _961 = fma(_851, (*spvDescriptorSet0.vp_c10)._m0[5].z, _951);
    float _963 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _965 = _953 + _963;
    float _967 = _957 * _957;
    float _969 = fma(_915, (*spvDescriptorSet0.vp_c8)._m0[25].z, _959);
    float _971 = _961 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _973 = fma(_965, _965, _967);
    float _975 = _969 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _977 = _971 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _979 = sqrt(_973);
    float _981 = _971 + _975;
    float _983 = fma(_943, (*spvDescriptorSet0.vp_c8)._m0[11].x, _977);
    float _985 = fma(_933, (*spvDescriptorSet0.vp_c8)._m0[11].z, _983);
    bool _987 = _979 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _989 = _851;
    float _991 = _915;
    float _993 = _975;
    float _995 = _861;
    if (!_987)
    {
        _989 = _953;
    }
    float _997 = _989;
    float _999 = _997;
    if (!_987)
    {
        _991 = _947;
    }
    float _1001 = _991;
    float _1003 = _1001;
    if (!_987)
    {
        _993 = _981;
    }
    float _1005 = _993;
    bool _1007 = !_987;
    float _1009 = _1005;
    if (!_1007)
    {
        float _1011 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1013 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1015 = _979 + _1013;
        float _1017 = rsqrt(_973);
        float _1019 = _1015 * _1011;
        float _1021 = _981 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1023 = _1019 * 0.15915493667125701904296875;
        float _1025 = _1023 * 6.283185482025146484375;
        float _1027 = cos(_1025);
        float _1029 = _1023 * 6.283185482025146484375;
        float _1031 = sin(_1029);
        float _1033 = _1027 + (-1.0);
        float _1035 = fma(_1031, _1021, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1037 = _1033 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1039 = _1017 * _1035;
        float _1041 = fma(_981, _1027, _1037);
        float _1043 = fma(_965, _1039, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1045 = fma(_957, _1039, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1009 = _1041;
        _999 = _1043;
        _1003 = _1045;
    }
    float _1047 = _1009;
    float _1049 = _999;
    float _1051 = _1003;
    float _1053 = -_971;
    float _1055 = _1053 + _1047;
    float _1057 = -_943;
    float _1059 = _1057 + _1049;
    float _1061 = _985 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1063 = -_933;
    float _1065 = _1063 + _1051;
    float _1067 = _1055 * _1055;
    float _1069 = 1.0 / _1061;
    bool _1071 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1073 = isnan(0.5);
    bool _1075 = _1071 || _1073;
    bool _1077 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1079 = _1075 || _1077;
    float _1081 = fma(_1059, _1059, _1067);
    float _1083 = _971 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _1085 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1087 = isnan(0.5);
    bool _1089 = _1085 || _1087;
    bool _1091 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1093 = _1089 || _1091;
    float _1095 = fma(_1065, _1065, _1081);
    float _1097 = fma(_943, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1083);
    float _1099 = sqrt(_1095);
    float _1101 = fma(_933, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1097);
    float _1103 = _1101 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1105 = _1103 + _1061;
    float _1107 = _1105 * _1069;
    float _1109 = _1107 * 0.5;
    bool _1111 = _1099 > 0.0;
    float _1113 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1115 = fma(_1109, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1113);
    float _1117 = 1.0 / _1115;
    bool _1119 = !_1111;
    float _1121 = _1051;
    float _1123 = _1065;
    float _1125 = _1047;
    float _1127 = _1049;
    float _1129 = _1059;
    float _1131 = _1095;
    if (!_1119)
    {
        float _1133 = _187 * _187;
        float _1135 = fma(_185, _185, _1133);
        float _1137 = fma(_189, _189, _1135);
        float _1139 = rsqrt(_1095);
        float _1141 = sqrt(_1137);
        float _1143 = _1059 * _1139;
        float _1145 = _1065 * _1139;
        bool _1147 = _1141 > 0.0;
        float _1149 = _1055 * _1139;
        bool _1151 = !_1147;
        if (!_1151)
        {
            float _1153 = rsqrt(_1137);
            float _1155 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1157 = _187 * _1153;
            float _1159 = _185 * _1153;
            float _1161 = _189 * _1153;
            float _1163 = _1149 * _1157;
            float _1165 = fma(_1143, _1159, _1163);
            float _1167 = _1155 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1169 = fma(_1145, _1161, _1165);
            float _1171 = _1169 * _1167;
            float _1173 = fma(_185, _1171, _1049);
            float _1175 = fma(_187, _1171, _1047);
            float _1177 = fma(_189, _1171, _1051);
            _1121 = _1177;
            _1123 = _1157;
            _1125 = _1175;
            _1127 = _1173;
            _1129 = _1161;
            _1131 = _1155;
        }
    }
    float _1179 = _1121;
    float _1181 = _1123;
    float _1183 = _1125;
    float _1185 = _1127;
    float _1187 = _1129;
    float _1189 = _1131;
    float _1191 = _1183;
    float _1193 = _1185;
    float _1195 = _1187;
    float _1197 = _1181;
    float _1199 = _1179;
    float _1201 = _1189;
    if (_1093)
    {
        _199 = 1.0;
    }
    float _1203 = _199;
    float _1205 = _1203;
    if (_1079)
    {
        _201 = _1179;
    }
    float _1207 = _201;
    float _1209 = _1207;
    if (!_1079)
    {
        float _1211 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1213 = _971 + _1211;
        float _1215 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1217 = _943 + _1215;
        float _1219 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1221 = -_971;
        float _1223 = _1221 + _1183;
        float _1225 = _1213 * _1213;
        float _1227 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1229 = _933 + _1227;
        float _1231 = fma(_1217, _1217, _1225);
        float _1233 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1235 = fma(_1229, _1229, _1231);
        float _1237 = sqrt(_1235);
        float _1239 = _1219 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1241 = precise::min(_1237, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1243 = _1241 * _1233;
        float _1245 = -_943;
        float _1247 = _1245 + _1185;
        float _1249 = _1239 * _1243;
        float _1251 = -_933;
        float _1253 = _1251 + _1179;
        float _1255 = fma(_1247, _1249, _943);
        float _1257 = fma(_1223, _1249, _971);
        float _1259 = fma(_1253, _1249, _933);
        _1191 = _1257;
        _1193 = _1255;
        _1209 = _1259;
        _1195 = _1233;
        _1197 = _1253;
        _203 = _1249;
    }
    float _1261 = _1191;
    float _1263 = _1193;
    float _1265 = _1209;
    float _1267 = _1195;
    float _1269 = _1197;
    float _1271 = _203;
    float _1273 = _1271;
    float _1275 = _1269;
    if (_1093)
    {
        _1273 = 1.0;
    }
    float _1277 = _1273;
    float _1279 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1281 = _1117 * _1279;
    float _1283 = _1277;
    if (!_1093)
    {
        float _1285 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1287 = _1285 * 0.15915493667125701904296875;
        float _1289 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1291 = _1287 * 6.283185482025146484375;
        float _1293 = cos(_1291);
        float _1295 = _1289 * 0.15915493667125701904296875;
        float _1297 = _1287 * 6.283185482025146484375;
        float _1299 = sin(_1297);
        float _1301 = 1.0 / _1293;
        float _1303 = _1295 * 6.283185482025146484375;
        float _1305 = cos(_1303);
        float _1307 = _1299 * _1301;
        float _1309 = _1295 * 6.283185482025146484375;
        float _1311 = sin(_1309);
        float _1313 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1315 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1313;
        float _1317 = _1305 * _1307;
        float _1319 = 1.0 / _1317;
        float _1321 = 1.0 / _1315;
        float _1323 = _1311 * _1319;
        float _1325 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1327 = fma(_1281, _1323, _1325);
        float _1329 = _1327 * _1321;
        float _1331 = precise::clamp(_1329, 0.0, 1.0);
        _1199 = _1295;
        _1275 = _1287;
        _1205 = _1331;
    }
    float _1333 = _1199;
    float _1335 = _1275;
    float _1337 = _1205;
    float _1339 = _1333;
    if (!_1093)
    {
        float _1341 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1343 = _1341 * 0.15915493667125701904296875;
        float _1345 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1347 = _1343 * 6.283185482025146484375;
        float _1349 = cos(_1347);
        float _1351 = _1345 * 0.15915493667125701904296875;
        float _1353 = _1343 * 6.283185482025146484375;
        float _1355 = sin(_1353);
        float _1357 = 1.0 / _1349;
        float _1359 = _1351 * 6.283185482025146484375;
        float _1361 = cos(_1359);
        float _1363 = _1355 * _1357;
        float _1365 = _1351 * 6.283185482025146484375;
        float _1367 = sin(_1365);
        float _1369 = _1361 * _1363;
        float _1371 = 1.0 / _1369;
        float _1373 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1375 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1373;
        float _1377 = 1.0 / _1375;
        float _1379 = _1367 * _1371;
        float _1381 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1383 = fma(_1281, _1379, _1381);
        float _1385 = _1383 * _1377;
        float _1387 = precise::clamp(_1385, 0.0, 1.0);
        float _1389 = -_1387;
        float _1391 = _1389 + 1.0;
        _1339 = _1357;
        _1283 = _1391;
    }
    float _1393 = _1339;
    float _1395 = _1283;
    float _1397 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1399 = _1261 + _1397;
    float _1401 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1403 = _1263 + _1401;
    float _1405 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1407 = _1265 + _1405;
    float _1409 = _1399 * _1399;
    float _1411 = fma(_1403, _1403, _1409);
    float _1413 = fma(_1407, _1407, _1411);
    float _1415 = rsqrt(_1413);
    float _1417 = sqrt(_1413);
    float _1419 = _1415 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1421 = _1403 * _1419;
    float _1423 = _1407 * _1419;
    float _1425 = _1421 * _1421;
    float _1427 = _1423 * _1423;
    float _1429 = _1425 + _1427;
    float _1431 = sqrt(_1429);
    bool _1433 = _1431 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1435 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1437 = _1431 + _1435;
    float _1439 = _1393;
    float _1441 = _1429;
    float _1443 = _1437;
    float _1445 = _1399;
    float _1447 = _1421;
    float _1449 = _1423;
    float _1451 = _1427;
    bool _1453 = _1433;
    if (_1433)
    {
        float _1455 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1439 = _1455;
    }
    float _1457 = _1439;
    if (_1433)
    {
        float _1459 = rsqrt(_1429);
        _1441 = _1459;
    }
    float _1461 = _1441;
    if (_1433)
    {
        float _1463 = _1437 * _1457;
        _1443 = _1463;
    }
    float _1465 = _1443;
    if (_1433)
    {
        float _1467 = _1465 * 0.15915493667125701904296875;
        _1201 = _1467;
    }
    float _1469 = _1201;
    float _1471 = _1267;
    if (_1433)
    {
        float _1473 = _1469 * 6.283185482025146484375;
        float _1475 = sin(_1473);
        _1471 = _1475;
    }
    float _1477 = _1471;
    float _1479 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1481 = precise::max(0.0, _1479);
    float _1483 = _1335;
    float _1485 = _1481;
    float _1487 = _1479;
    if (_1433)
    {
        float _1489 = _1469 * 6.283185482025146484375;
        float _1491 = cos(_1489);
        _1483 = _1491;
    }
    float _1493 = _1483;
    float _1495 = -_1419;
    float _1497 = -_1481;
    float _1499 = fma(_1399, _1495, _1497);
    if (!_1433)
    {
        _1485 = _1425;
    }
    float _1501 = _1485;
    float _1503 = _1501;
    if (_1433)
    {
        float _1505 = _1499 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1445 = _1505;
    }
    float _1507 = _1445;
    float _1509 = _1507;
    float _1511 = _1477;
    if (_1433)
    {
        float _1513 = fma(_1477, _1507, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1509 = _1513;
    }
    float _1515 = _1509;
    float _1517 = _1515;
    if (_1433)
    {
        float _1519 = _1493 + (-1.0);
        _1487 = _1519;
    }
    float _1521 = _1487;
    if (_1433)
    {
        float _1523 = _1461 * _1515;
        _723 = _1523;
    }
    float _1525 = _723;
    if (!_1433)
    {
        _1517 = _1499;
    }
    float _1527 = _1517;
    float _1529 = _1527;
    if (_1433)
    {
        float _1531 = _1521 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1511 = _1531;
    }
    float _1533 = _1511;
    if (_1433)
    {
        float _1535 = _1421 * _1525;
        _1447 = _1535;
    }
    float _1537 = _1447;
    if (_1433)
    {
        float _1539 = _1423 * _1525;
        _1449 = _1539;
    }
    float _1541 = _1449;
    float _1543 = _1261 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (_1433)
    {
        float _1545 = fma(_1499, _1493, _1533);
        _1529 = _1545;
    }
    float _1547 = _1529;
    if (_1433)
    {
        float _1549 = _1537 * _1537;
        _1503 = _1549;
    }
    float _1551 = _1503;
    if (_1433)
    {
        float _1553 = _1541 * _1541;
        _1451 = _1553;
    }
    float _1555 = _1451;
    float _1557 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1559 = _1261 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1561 = fma(_1547, _1547, _1551);
    float _1563 = _1561 + _1555;
    float _1565 = fma(_1263, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1543);
    float _1567 = _1261 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1569 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1571 = fma(_1417, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1569);
    float _1573 = precise::clamp(_1571, 0.0, 1.0);
    float _1575 = fma(_1265, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1565);
    float _1577 = rsqrt(_1563);
    float _1579 = fma(_1263, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1567);
    float _1581 = _1261 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1583 = _1575 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1585 = fma(_1263, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1559);
    float _1587 = fma(_1265, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1579);
    float _1589 = -_1573;
    float _1591 = _1589 + 1.0;
    float _1593 = _1583 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1595 = fma(_1265, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1585);
    float _1597 = _1587 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1599 = fma(_1263, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1581);
    float _1601 = -_1593;
    float _1603 = fma(_1601, _1557, 1.0);
    float _1605 = _1595 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1607 = _1597 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1609 = abs(_1591);
    float _1611 = log2(_1609);
    float _1613 = fma(_1265, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1599);
    float _1615 = _1577 * _1537;
    float _1617 = fma(_1605, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1607);
    float _1619 = _1577 * _1547;
    float _1621 = _1577 * _1541;
    float _1623 = _1615 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1625 = fma(_1583, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1617);
    float _1627 = _1613 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1629 = log2(_1603);
    float _1631 = -_1623;
    float _1633 = fma(_1619, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1631);
    float _1635 = _1597 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1637 = fma(_1627, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1625);
    float _1639 = _1619 + 1.0;
    float _1641 = -_1621;
    float _1643 = fma(_1641, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1633);
    float _1645 = _1597 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1647 = _1611 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1649 = 1.0 / _1637;
    float _1651 = fma(_1643, -0.5, 0.5);
    float _1653 = fma(_1605, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1645);
    float _1655 = fma(_1605, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1635);
    float _1657 = fma(_1643, 0.5, 0.5);
    float _1659 = fma(_1583, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1655);
    float _1661 = exp2(_1647);
    float _1663 = fma(_1657, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1665 = _1629 * 0.693147182464599609375;
    float _1667 = fma(_1657, _1663, -0.212114393711090087890625);
    float _1669 = _1665 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1671 = sqrt(_1651);
    float _1673 = fma(_1583, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1653);
    float _1675 = fma(_1627, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1659);
    float _1677 = fma(_1657, _1667, 1.570728778839111328125);
    float _1679 = fma(_1627, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1673);
    float _1681 = _1675 * _1649;
    float _1683 = -_1619;
    float _1685 = fma(_1661, _1639, _1683);
    float _1687 = _1679 * _1649;
    float _1689 = fma(_1681, -0.5, 0.5);
    float _1691 = fma(_1687, 0.5, 0.5);
    float _1693 = fma(_1685, 0.5, 0.5);
    float _1695 = _1671 * 0.636619746685028076171875;
    float3 _4837 = float3(_1691, _1689, _1669);
    float _1697 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4837, float3(0.0), isnan(_4837)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4837, float3(0.0), isnan(_4837)), level(0.0)).x;
    float _1699 = -_1677;
    float _1701 = fma(_1695, _1699, 1.0);
    float3 _4853 = float3(_1691, _1689, _1669);
    float4 _1704 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4853, float3(0.0), isnan(_4853)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4853, float3(0.0), isnan(_4853)), level(0.0)).xyzw;
    float _1706 = _1704.x;
    float _1708 = _1704.y;
    float _1710 = _1704.z;
    float _1712 = _1704.w;
    float2 _4870 = float2(_1701, _1693);
    float3 _1716 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4870, float2(0.0), isnan(_4870)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4870, float2(0.0), isnan(_4870)), level(0.0)).xyz;
    float _1718 = _1716.x;
    float _1720 = _1716.y;
    float _1722 = _1716.z;
    int _1724 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _1726 = _1724 != 0;
    float _1728 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1730 = _233 + _1728;
    int _1732 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _1734 = _1732 != 0;
    float _1736 = _681 * (-0.15915493667125701904296875);
    float _1738 = -_421;
    float _1740 = _1738 + 1.0;
    float _1742 = _1736 * 6.283185482025146484375;
    float _1744 = sin(_1742);
    float _1746 = in.m_54.w;
    float _1748 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1750 = _1748 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1752 = _233 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1754 = isnan(_233);
    bool _1756 = _1752 || _1754;
    bool _1758 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1760 = _1756 || _1758;
    float _1762 = float(_1760);
    float _1764 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1766 = _1764 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1768 = _1681;
    if (_1726)
    {
        float _1770 = in.m_54.w;
        _1768 = _1770;
    }
    float _1772 = _1768;
    float _1774 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1776 = _1774 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    if (!_1726)
    {
        _725 = _173;
    }
    float _1778 = _725;
    float _1780 = -_1762;
    float _1782 = _1780 + 1.0;
    float _1784 = _1425;
    float _1786 = _1778;
    if (_1734)
    {
        float _1788 = in.m_54.x;
        _1784 = _1788;
    }
    float _1790 = _1784;
    float _1792 = 1.0 / _1776;
    if (!_1734)
    {
        _995 = _183;
    }
    float _1794 = _995;
    float _1796 = _1611 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _1798 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1800 = _1798 != 0;
    float _1802 = _1597 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _1804 = _233 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1806 = isnan(_233);
    bool _1808 = _1804 || _1806;
    bool _1810 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1812 = _1808 || _1810;
    float _1814 = float(_1812);
    float _1816 = -_707;
    float _1818 = _1816 + 1.0;
    float _1820 = 1.0 / _1750;
    float _1822 = fma(_1605, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1802);
    float _1824 = -_703;
    float _1826 = _1824 + 1.0;
    float _1828 = -_705;
    float _1830 = _1828 + 1.0;
    float _1832 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1834 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _1832;
    float _1836 = 1.0 / _1766;
    float _1838 = _1814 * _1782;
    float _1840 = -_1814;
    float _1842 = _1840 + 1.0;
    float _1844 = _1772;
    float _1846 = _1794;
    if (_1726)
    {
        float _1848 = _1772 * 3.1415927410125732421875;
        _1844 = _1848;
    }
    float _1850 = _1844;
    float _1852 = _1790;
    float _1854 = _1850;
    if (_1734)
    {
        float _1856 = _1790 * 3.1415927410125732421875;
        _1852 = _1856;
    }
    float _1858 = _1852;
    float _1860 = _1858;
    if (_1726)
    {
        float _1862 = _1850 * 0.15915493667125701904296875;
        _1854 = _1862;
    }
    float _1864 = _1854;
    float _1866 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    if (_1734)
    {
        float _1868 = _1858 * 0.15915493667125701904296875;
        _1860 = _1868;
    }
    float _1870 = _1860;
    float _1872 = _1834 * _1836;
    float _1874 = _1864;
    if (_1726)
    {
        float _1876 = _1864 * 6.283185482025146484375;
        float _1878 = sin(_1876);
        _1874 = _1878;
    }
    float _1880 = _1874;
    float _1882 = fma(_1872, _1730, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _1884 = _1870;
    if (_1734)
    {
        float _1886 = _1870 * 6.283185482025146484375;
        float _1888 = sin(_1886);
        _1884 = _1888;
    }
    float _1890 = _1884;
    float _1892 = _1866 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    if (_1726)
    {
        bool _1894 = _1880 > 0.5;
        _1453 = _1894;
    }
    bool _1896 = _1453;
    float _1898 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    if (_1726)
    {
        float _1900 = -_173;
        float _1902 = _1896 ? _1900 : _173;
        _1786 = _1902;
    }
    float _1904 = _1786;
    int _1906 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1908 = _1906 != 0;
    float _1910 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1912 = _1910 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    if (_1734)
    {
        bool _1914 = _1890 > 0.5;
        _727 = _1914;
    }
    bool _1916 = _727;
    float _1918 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _1920 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1922 = _1920 != 0;
    float _1924 = _1912 * _1820;
    if (_1734)
    {
        float _1926 = -_183;
        float _1928 = _1916 ? _1926 : _183;
        _1846 = _1928;
    }
    float _1930 = _1846;
    float _1932 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1934 = _233 + _1932;
    int _1936 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1938 = _1936 != 0;
    float _1940 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1942 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1940;
    bool _1944 = _1746 > 0.5;
    float _1946 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _1948 = _233 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1950 = isnan(_233);
    bool _1952 = _1948 || _1950;
    bool _1954 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1956 = _1952 || _1954;
    float _1958 = float(_1956);
    float _1960 = _1942 * _1792;
    float _1962 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1964 = _233 + _1962;
    float _1966 = _1958 * _1842;
    float _1968 = fma(_1960, _1964, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1970 = exp2(_1796);
    float _1972 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1974 = _1968 * _1966;
    float _1976 = -_1958;
    float _1978 = _1976 + 1.0;
    float _1980 = fma(_1924, _1934, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1982 = _1972 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1984 = fma(_1978, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1974);
    bool _1986 = _233 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1988 = isnan(_233);
    bool _1990 = _1986 || _1988;
    bool _1992 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1994 = _1990 || _1992;
    float _1996 = float(_1994);
    float _1998 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    float _2000 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2002 = -_1996;
    float _2004 = _2002 + 1.0;
    float _2006 = fma(_1980, _1838, _1984);
    float _2008 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2010 = -_173;
    int _2012 = _515 ? as_type<int>(_2010) : as_type<int>(_173);
    float _2014 = _1762 * _2004;
    float _2016 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2018 = _2000 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2020 = _2008 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _2022 = _315 > 0.5;
    float _2024 = fma(_1882, _2014, _2006);
    bool _2026 = !_1922;
    float _2028 = _2026 ? _173 : as_type<float>(_2012);
    float _2030 = _1898 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    float _2032 = _1904 + 0.5;
    out.m_60.x = _2018;
    out.m_60.y = _2020;
    out.m_60.z = _1982;
    out.m_60.w = _2016;
    float _2034 = _1736 * 6.283185482025146484375;
    float _2036 = cos(_2034);
    float _2038 = _1998 * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    float _2040 = -_173;
    int _2042 = _2022 ? as_type<int>(_2040) : as_type<int>(_173);
    float _2044 = _517 * (-0.15915493667125701904296875);
    float _2046 = fma(_2030, _2032, _459);
    float _2048 = -_183;
    int _2050 = _1944 ? as_type<int>(_2048) : as_type<int>(_183);
    float _2052 = _1946 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    bool _2054 = !_1800;
    float _2056 = _2054 ? _173 : as_type<float>(_2042);
    float _2058 = _715 * (-0.15915493667125701904296875);
    float _2060 = _2044 * 6.283185482025146484375;
    float _2062 = sin(_2060);
    float _2064 = -_183;
    int _2066 = _519 ? as_type<int>(_2064) : as_type<int>(_183);
    float _2068 = -_1970;
    float _2070 = _2068 + 1.0;
    bool _2072 = _1337 > 0.0;
    bool _2074 = isnan(_1337);
    bool _2076 = _2072 || _2074;
    bool _2078 = isnan(0.0);
    bool _2080 = _2076 || _2078;
    float _2082 = _1930 + (-0.5);
    float _2084 = fma(_1996, (*spvDescriptorSet0.vp_c9)._m0[118].x, _2024);
    float _2086 = -_2038;
    float _2088 = -_423;
    float _2090 = fma(_2086, _2082, _2088);
    float _2092 = -_1740;
    float _2094 = fma(_2092, _1904, _2046);
    float _2096 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2098 = _2044 * 6.283185482025146484375;
    float _2100 = cos(_2098);
    float _2102 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2104 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    bool _2106 = !_1908;
    float _2108 = _2106 ? _183 : as_type<float>(_2066);
    float _2110 = -_451;
    float _2112 = _2110 + 1.0;
    float _2114 = _2096 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2116 = _2104 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2118 = _2102 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2120 = _2058 * 6.283185482025146484375;
    float _2122 = sin(_2120);
    float _2124 = _2084 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2126 = _2108 * _1744;
    float _2128 = _2108 * _2036;
    float _2130 = fma(_2112, _1930, _2090);
    bool _2132 = !_1938;
    float _2134 = _2132 ? _183 : as_type<float>(_2050);
    out.m_62.x = _2116;
    out.m_62.y = _2114;
    out.m_62.z = _2118;
    out.m_62.w = _2124;
    float _2136 = -_2126;
    float _2138 = fma(_2056, _2036, _2136);
    float _2140 = _2058 * 6.283185482025146484375;
    float _2142 = cos(_2140);
    float _2144 = fma(_2056, _1744, _2128);
    float _2146 = _2134 * _2062;
    float _2148 = _2134 * _2100;
    float _2150 = _1918 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2152 = _2144 + (-0.5);
    float _2154 = -_2146;
    float _2156 = fma(_2028, _2100, _2154);
    float _2158 = fma(_2028, _2062, _2148);
    float _2160 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2162 = _2138 + 0.5;
    float _2164 = -_1892;
    float _2166 = -_699;
    float _2168 = fma(_2164, _2152, _2166);
    float _2170 = _2156 + 0.5;
    float _2172 = _567 * _2122;
    float _2174 = fma(_2150, _2162, _639);
    float _2176 = _2158 + (-0.5);
    float _2178 = fma(_2052, _2170, _711);
    float _2180 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _2182 = _567 * _2142;
    float _2184 = -_2172;
    float _2186 = fma(_573, _2142, _2184);
    float _2188 = -_701;
    float _2190 = _2188 + 1.0;
    float _2192 = -_1818;
    float _2194 = fma(_2156, _2192, _2178);
    float _2196 = fma(_573, _2122, _2182);
    float _2198 = _2186 + 0.5;
    float _2200 = _2070 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2202 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _2204 = _2160 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2206 = _2196 + (-0.5);
    float _2208 = fma(_1583, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1822);
    float _2210 = -_2190;
    float _2212 = fma(_2138, _2210, _2174);
    float _2214 = -_2204;
    float _2216 = -_713;
    float _2218 = fma(_2214, _2176, _2216);
    float _2220 = -_697;
    float _2222 = _2220 + 1.0;
    float _2224 = -_587;
    float _2226 = _2224 + 1.0;
    float _2228 = _2180 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _2230 = fma(_1627, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2208);
    float _2232 = fma(_2144, _2222, _2168);
    float _2234 = fma(_2158, _2226, _2218);
    float _2236 = -_2228;
    float _2238 = -_721;
    float _2240 = fma(_2236, _2206, _2238);
    float _2242 = _1337 * _1395;
    bool _2244 = _1395 <= 0.0;
    bool _2246 = !_2080;
    bool _2248 = _2244 || _2246;
    out.m_64.x = _2094;
    out.m_64.y = _2130;
    float _2250 = _2202 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _2252 = _2242 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2254 = fma(_2196, _1830, _2240);
    out.m_66.x = _2212;
    out.m_66.y = _2232;
    out.m_66.z = _2194;
    out.m_66.w = _2234;
    float _2256 = fma(_2250, _2198, _719);
    float _2258 = _2252 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2260 = _2230 + _1637;
    float _2262 = -_1826;
    float _2264 = fma(_2186, _2262, _2256);
    out.m_45.x = _2258;
    float _2266 = _2260 * 0.5;
    out.m_68.x = _2264;
    out.m_68.y = _2254;
    float _2268 = -_2200;
    float _2270 = _2268 + 1.0;
    out.gl_Position.x = _1679;
    out.gl_Position.y = _1675;
    out.gl_Position.z = _2230;
    out.gl_Position.w = _1637;
    out.m_70.z = _2266;
    out.m_70.w = _1637;
    float _2272 = _2200 * _1697;
    float _2274 = _1712 * _2272;
    float _2276 = _1712 * _2270;
    float _2278 = _1722 * _2272;
    float _2280 = fma(_1718, _2274, _1706);
    float _2282 = fma(_1720, _2274, _1708);
    float _2284 = fma(_1712, _2278, _1710);
    out.m_72.x = _2280;
    out.m_72.y = _2282;
    out.m_72.z = _2284;
    out.m_72.w = _2276;
    if (!_2248)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_45.x = 0.0;
    float _2286 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2286;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

