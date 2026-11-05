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

struct _35
{
    uint _m0[1];
};

struct spvDescriptorSetBuffer0
{
    constant _16* vp_c8 [[id(0)]];
    constant _16* vp_c10 [[id(1)]];
    constant _16* vp_c9 [[id(2)]];
    constant _16* vp_c15 [[id(3)]];
    constant _16* vp_c16 [[id(4)]];
    constant _16* vp_c11 [[id(5)]];
    constant _16* vp_c13 [[id(6)]];
    constant _16* vp_c7 [[id(7)]];
    const device _35* vp_s0 [[id(8)]];
    texture2d<float> vp_t_tcb_24 [[id(9)]];
    sampler vp_t_tcb_24Smplr [[id(10)]];
    texture3d<float> vp_t_tcb_32 [[id(11)]];
    sampler vp_t_tcb_32Smplr [[id(12)]];
    texture3d<float> vp_t_tcb_30 [[id(13)]];
    sampler vp_t_tcb_30Smplr [[id(14)]];
    texture2d<float> vp_t_tcb_1C [[id(15)]];
    sampler vp_t_tcb_1CSmplr [[id(16)]];
    sampler vp_t_tcb_24Smplr_w [[id(17)]];
    sampler vp_t_tcb_32Smplr_w [[id(18)]];
    sampler vp_t_tcb_30Smplr_w [[id(19)]];
    sampler vp_t_tcb_1CSmplr_w [[id(20)]];
    constant dm_border_t* dm_border [[id(21)]];
};

struct main0_out
{
    float4 m_78 [[user(locn0)]];
    float4 m_84 [[user(locn1)]];
    float4 m_58 [[user(locn2)]];
    float4 m_100 [[user(locn3)]];
    float4 m_82 [[user(locn4)]];
    float4 m_80 [[user(locn5)]];
    float4 m_90 [[user(locn6)]];
    float4 m_92 [[user(locn7)]];
    float4 m_98 [[user(locn8)]];
    float4 m_94 [[user(locn9)]];
    float4 m_96 [[user(locn10)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_88 [[attribute(0)]];
    float4 m_64 [[attribute(1)]];
    float4 m_62 [[attribute(2)]];
    float4 m_66 [[attribute(3)]];
    float4 m_86 [[attribute(4)]];
    float4 m_55 [[attribute(5)]];
    float4 m_60 [[attribute(6)]];
    float4 m_76 [[attribute(7)]];
    float4 m_72 [[attribute(8)]];
    float4 m_68 [[attribute(9)]];
    float4 m_70 [[attribute(10)]];
    float4 m_74 [[attribute(12)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_100 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2023 = false;
    bool _953 = false;
    bool _355 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _114 = in.m_55.w;
    float _116 = trunc(_114);
    int _119 = int(_116);
    bool _123 = _119 >= 1;
    float _125 = 0.0;
    if (!_123)
    {
        _125 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _127 = _125;
    if (!_123)
    {
        out.m_58.x = 0.0;
    }
    int _129 = 0;
    if (!_123)
    {
        float _131 = _127 * 5.0;
        _129 = as_type<int>(_131);
    }
    int _133 = _129;
    int _135 = _133;
    if (!_123)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2327 = as_type<float>(_133);
        out.gl_Position.z = _2327;
    }
    if (!_123)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _137 = in.m_60.w;
    bool _139 = _137 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _141 = isnan(_137);
    bool _143 = _139 || _141;
    bool _145 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _147 = _143 || _145;
    float _149 = -_137;
    float _151 = _149 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _153 = 0.0;
    if (_147)
    {
        float _155 = float(_119);
        _153 = _155;
    }
    float _157 = _153;
    bool _159 = _151 >= _157;
    bool _161 = !_147;
    bool _163 = _159 || _161;
    float _165 = 0.0;
    if (_163)
    {
        _165 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _167 = _165;
    if (_163)
    {
        out.m_58.x = 0.0;
    }
    if (_163)
    {
        float _169 = _167 * 5.0;
        _135 = as_type<int>(_169);
    }
    int _171 = _135;
    if (_163)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2395 = as_type<float>(_171);
        out.gl_Position.z = _2395;
    }
    if (_163)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _173 = in.m_62.x;
    float _175 = in.m_62.y;
    float _177 = in.m_62.z;
    float _179 = in.m_64.x;
    float _181 = in.m_64.y;
    float _183 = in.m_64.z;
    float _185 = in.m_66.x;
    float _187 = in.m_66.y;
    float _189 = in.m_66.z;
    float _191 = _173 * _173;
    float _193 = _175 * _175;
    float _195 = _177 * _177;
    float _197 = fma(_179, _179, _191);
    float _199 = fma(_181, _181, _193);
    float _201 = fma(_183, _183, _195);
    float _203 = fma(_185, _185, _197);
    float _205 = fma(_187, _187, _199);
    float _207 = fma(_189, _189, _201);
    float _209 = sqrt(_203);
    float _211 = sqrt(_205);
    float _213 = sqrt(_207);
    bool _215 = _209 > 0.0;
    bool _217 = _211 > 0.0;
    float _219 = _211;
    float _221 = _173;
    if (_215)
    {
        float _223 = rsqrt(_203);
        _219 = _223;
    }
    float _225 = _219;
    float _227 = 0.0;
    if (!_215)
    {
        _227 = 0.0;
    }
    float _229 = _227;
    bool _231 = _213 > 0.0;
    float _233 = 0.0;
    float _235 = _229;
    if (!_215)
    {
        _233 = 0.0;
    }
    float _237 = _233;
    float _239 = 0.0;
    float _241 = _237;
    if (!_215)
    {
        _239 = 0.0;
    }
    float _243 = _239;
    float _245 = _213;
    float _247 = _243;
    if (_217)
    {
        float _249 = rsqrt(_205);
        _245 = _249;
    }
    float _251 = _245;
    float _253 = 0.0;
    if (!_217)
    {
        _253 = 0.0;
    }
    float _255 = _253;
    float _257 = 0.0;
    float _259 = _255;
    if (!_217)
    {
        _257 = 0.0;
    }
    float _261 = _257;
    float _263 = 0.0;
    float _265 = _261;
    if (!_217)
    {
        _263 = 0.0;
    }
    float _267 = _263;
    float _269 = 0.0;
    float _271 = _267;
    if (_231)
    {
        float _273 = rsqrt(_207);
        _269 = _273;
    }
    float _275 = _269;
    if (_215)
    {
        float _277 = _225 * _179;
        _235 = _277;
    }
    float _279 = _235;
    if (_215)
    {
        float _281 = _225 * _173;
        _241 = _281;
    }
    float _283 = _241;
    if (_215)
    {
        float _285 = _225 * _185;
        _247 = _285;
    }
    float _287 = _247;
    bool _289 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _291 = 0.0;
    if (!_231)
    {
        _291 = 0.0;
    }
    float _293 = _291;
    float _295 = 0.0;
    float _297 = _293;
    if (!_231)
    {
        _295 = 0.0;
    }
    float _299 = _295;
    float _301 = _299;
    if (_217)
    {
        float _303 = _251 * _181;
        _259 = _303;
    }
    float _305 = _259;
    float _307 = 0.0;
    float _309 = _305;
    if (!_231)
    {
        _307 = 0.0;
    }
    float _311 = _307;
    float _313 = _311;
    if (_217)
    {
        float _315 = _251 * _175;
        _265 = _315;
    }
    float _317 = _265;
    if (_217)
    {
        float _319 = _251 * _187;
        _271 = _319;
    }
    float _321 = _271;
    if (_231)
    {
        float _323 = _275 * _183;
        _297 = _323;
    }
    float _325 = _297;
    if (_231)
    {
        float _327 = _275 * _177;
        _301 = _327;
    }
    float _329 = _301;
    if (_231)
    {
        float _331 = _275 * _189;
        _313 = _331;
    }
    float _333 = _313;
    bool _335 = !_289;
    float _353;
    if (!_335)
    {
        float _337 = in.m_68.x;
        float _339 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _341 = _337 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _343 = fma(_341, (*spvDescriptorSet0.vp_c9)._m0[12].x, _151);
        float _345 = _343 * _339;
        float _347 = floor(_345);
        float _349 = -_347;
        float _351 = _345 + _349;
        _353 = _351;
        _355 = true;
    }
    else
    {
        float _357 = float(_119);
        float _359 = 1.0 / _357;
        float _361 = _151 * _359;
        _353 = _361;
    }
    _355 = false;
    float _363 = _353;
    float _365 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _367 = _363 + _365;
    float _369 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _371 = _363 + _369;
    bool _373 = _363 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _375 = isnan(_363);
    bool _377 = _373 || _375;
    bool _379 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _381 = _377 || _379;
    float _383 = float(_381);
    float _385 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _387 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _385;
    float _389 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _391 = _389 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _393 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _395 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _393;
    float _397 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _399 = _363 + _397;
    float _401 = 1.0 / _391;
    float _403 = -_383;
    float _405 = _403 + 1.0;
    bool _407 = _363 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _409 = isnan(_363);
    bool _411 = _407 || _409;
    bool _413 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _415 = _411 || _413;
    float _417 = float(_415);
    bool _419 = _363 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _421 = isnan(_363);
    bool _423 = _419 || _421;
    bool _425 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _427 = _423 || _425;
    float _429 = float(_427);
    float _431 = 1.0 / _387;
    float _433 = -_417;
    float _435 = _433 + 1.0;
    float _437 = _417 * _405;
    float _439 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _441 = _439 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _443 = _429 * _435;
    float _445 = -_429;
    float _447 = _445 + 1.0;
    float _449 = 1.0 / _395;
    float _451 = _367 * _401;
    bool _453 = _363 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _455 = isnan(_363);
    bool _457 = _453 || _455;
    bool _459 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _461 = _457 || _459;
    float _463 = float(_461);
    float _465 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _467 = _465 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _469 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _471 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _469;
    float _473 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _475 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _473;
    float _477 = -_463;
    float _479 = _477 + 1.0;
    float _481 = _371 * _431;
    float _483 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _485 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _483;
    float _487 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _489 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _487;
    float _491 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _493 = _491 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _495 = _383 * _479;
    float _497 = fma(_485, _481, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _499 = fma(_489, _481, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _501 = fma(_493, _451, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _503 = _399 * _449;
    float _505 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _507 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _505;
    float _509 = fma(_441, _451, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _511 = _497 * _443;
    float _513 = _499 * _443;
    float _515 = fma(_507, _481, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _517 = fma(_467, _451, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _519 = in.m_55.x;
    float _521 = in.m_55.y;
    float _523 = in.m_55.z;
    float _525 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _527 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _525;
    float _529 = _515 * _443;
    float _531 = fma(_447, (*spvDescriptorSet0.vp_c9)._m0[143].y, _513);
    float _533 = in.m_70.x;
    float _535 = in.m_70.y;
    float _537 = in.m_70.z;
    float _539 = fma(_471, _503, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _541 = fma(_475, _503, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _543 = fma(_527, _503, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _545 = in.m_72.x;
    float _547 = in.m_72.y;
    float _549 = in.m_72.z;
    float _551 = fma(_447, (*spvDescriptorSet0.vp_c9)._m0[143].x, _511);
    float _553 = fma(_509, _437, _531);
    float _555 = fma(_447, (*spvDescriptorSet0.vp_c9)._m0[143].z, _529);
    float _557 = fma(_517, _437, _551);
    float _559 = fma(_541, _495, _553);
    float _561 = fma(_501, _437, _555);
    float _563 = fma(_539, _495, _557);
    float _565 = fma(_463, (*spvDescriptorSet0.vp_c9)._m0[146].y, _559);
    float _567 = fma(_543, _495, _561);
    float _569 = fma(_463, (*spvDescriptorSet0.vp_c9)._m0[146].x, _563);
    float _571 = fma(_463, (*spvDescriptorSet0.vp_c9)._m0[146].z, _567);
    float _573 = _187 * _521;
    float _575 = _181 * _521;
    float _577 = in.m_68.y;
    float _579 = _175 * _521;
    float _581 = _565 * _535;
    float _583 = fma(_185, _519, _573);
    float _585 = _569 * _533;
    float _587 = _571 * _537;
    float _589 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _547);
    float _591 = _581 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _593 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _545);
    float _595 = _585 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _597 = fma(_179, _519, _575);
    float _599 = _591 * _589;
    float _601 = _587 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _603 = _595 * _593;
    float _605 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _549);
    float _607 = _599 * _305;
    float _609 = _599 * _321;
    float _611 = fma(_183, _523, _597);
    float _613 = fma(_189, _523, _583);
    float _615 = _601 * _605;
    float _617 = fma(_603, _279, _607);
    float _619 = fma(_603, _287, _609);
    float _621 = _611 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _623 = _613 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _625 = fma(_615, _325, _617);
    float _627 = fma(_615, _333, _619);
    float _629 = in.m_74.x;
    float _631 = fma(_173, _519, _579);
    float _633 = _621 + _625;
    float _635 = _623 + _627;
    float _637 = in.m_74.y;
    float _639 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _641 = _633 + _639;
    float _643 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _645 = _635 + _643;
    int _647 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _649 = _647 != 0;
    float _651 = fma(_177, _523, _631);
    float _653 = _641 * _641;
    float _655 = _645 * _645;
    int _657 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _659 = _657 != 0;
    float _661 = _599 * _317;
    float _663 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _665 = _653 + _655;
    float _667 = _651 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _669 = fma(_603, _283, _661);
    bool _671 = _577 > 0.5;
    float _673 = _501;
    float _675 = _669;
    float _677 = _633;
    float _679 = _635;
    if (_649)
    {
        float _681 = in.m_68.x;
        _673 = _681;
    }
    float _683 = _673;
    float _685 = sqrt(_665);
    float _687 = fma(_615, _329, _669);
    float _689 = _629;
    if (_649)
    {
        _675 = _629;
    }
    float _691 = _675;
    float _693 = _667 + _687;
    float _695 = -_637;
    float _697 = _695 + 1.0;
    float _699 = _637;
    float _701 = _697;
    float _703 = _691;
    if (_659)
    {
        float _705 = _671 ? _697 : _637;
        _699 = _705;
    }
    float _707 = _699;
    bool _709 = _685 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    bool _711 = _683 > 0.5;
    bool _713 = _711 && _649;
    float _715 = _683;
    if (!_709)
    {
        _701 = _655;
    }
    float _717 = _701;
    float _719 = _717;
    if (!_709)
    {
        _221 = _653;
    }
    float _721 = _221;
    float _723 = _721;
    if (!_709)
    {
        _715 = _693;
    }
    float _725 = _715;
    bool _727 = !_709;
    float _729 = _725;
    if (!_727)
    {
        float _731 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _733 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _735 = _685 + _733;
        float _737 = _693 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _739 = rsqrt(_665);
        float _741 = _735 * _731;
        float _743 = _741 * 0.15915493667125701904296875;
        float _745 = _743 * 6.283185482025146484375;
        float _747 = sin(_745);
        float _749 = _743 * 6.283185482025146484375;
        float _751 = cos(_749);
        float _753 = fma(_747, _737, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _755 = _739 * _753;
        float _757 = _751 + (-1.0);
        float _759 = fma(_641, _755, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _761 = fma(_645, _755, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _763 = _757 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _765 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _767 = _759 + _765;
        float _769 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _771 = _761 + _769;
        float _773 = fma(_693, _751, _763);
        float _775 = _767 * _767;
        float _777 = _771 * _771;
        _729 = _773;
        _723 = _775;
        _719 = _777;
        _677 = _759;
        _679 = _761;
    }
    float _779 = _729;
    float _781 = _723;
    float _783 = _719;
    float _785 = _677;
    float _787 = _679;
    float _789 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _791 = _779 + _789;
    float _793 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    if (_713)
    {
        float _795 = -_691;
        float _797 = _795 + 1.0;
        _703 = _797;
    }
    float _799 = _703;
    float _801 = _707 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _803 = fma(_791, _791, _781);
    if (_649)
    {
        _689 = _799;
    }
    float _805 = _689;
    float _807 = _803 + _783;
    float _809 = in.m_76.x;
    float _811 = in.m_76.y;
    float _813 = in.m_76.z;
    float _815 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    bool _817 = _547 != 0.0;
    bool _819 = isnan(_547);
    bool _821 = _817 || _819;
    bool _823 = isnan(0.0);
    bool _825 = _821 || _823;
    float _827 = sqrt(_807);
    float _829 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    bool _831 = _545 == 0.0;
    bool _833 = !_825;
    bool _835 = _831 && _833;
    float _837 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _839 = _805 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _841 = _801 * _663;
    bool _843 = _549 == 0.0;
    bool _845 = _843 && _835;
    float _847 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _849 = _815 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _851 = _829 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _853 = _837 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _855 = _839 * _793;
    out.m_78.x = _849;
    out.m_78.y = _851;
    out.m_78.z = _853;
    out.m_78.w = _847;
    float _857 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    bool _859 = _827 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _861 = isnan(_827);
    bool _863 = _859 || _861;
    bool _865 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _867 = _863 || _865;
    out.m_80.x = _855;
    out.m_80.y = _841;
    float _869 = _811;
    float _871 = _809;
    float _873 = _813;
    float _875 = _841;
    if (!_845)
    {
        float _877 = fma(_547, (*spvDescriptorSet0.vp_c9)._m0[17].y, _811);
        _869 = _877;
    }
    float _879 = _869;
    float _881 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _883 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    if (!_845)
    {
        float _885 = fma(_545, (*spvDescriptorSet0.vp_c9)._m0[17].y, _809);
        _871 = _885;
    }
    float _887 = _871;
    float _889 = _305 * _879;
    float _891 = _317 * _879;
    float _893 = _321 * _879;
    float _895 = _857 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _897 = _881 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _899 = _883 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    if (!_845)
    {
        float _901 = fma(_549, (*spvDescriptorSet0.vp_c9)._m0[17].y, _813);
        _873 = _901;
    }
    float _903 = _873;
    float _905 = fma(_279, _887, _889);
    float _907 = fma(_283, _887, _891);
    float _909 = fma(_287, _887, _893);
    out.m_82.x = 1.0;
    out.m_82.y = 1.0;
    out.m_82.z = 1.0;
    float _911 = fma(_333, _903, _909);
    out.m_84.x = _895;
    out.m_84.y = _897;
    out.m_84.z = _899;
    float _913 = fma(_325, _903, _905);
    float _915 = _905;
    if (!_867)
    {
        _915 = 1.0;
    }
    float _917 = _915;
    float _919 = fma(_329, _903, _907);
    bool _921 = !_867;
    float _923 = _917;
    if (!_921)
    {
        bool _925 = _827 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _927 = isnan(_827);
        bool _929 = _925 || _927;
        bool _931 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _933 = _929 || _931;
        if (!_933)
        {
            float _935 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _937 = _827 + _935;
            float _939 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _941 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _939;
            float _943 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _945 = _943 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _947 = 1.0 / _941;
            float _949 = _937 * _947;
            float _951 = fma(_949, _945, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _923 = _951;
            _953 = true;
        }
        else
        {
            bool _955 = _827 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _957 = isnan(_827);
            bool _959 = _955 || _957;
            bool _961 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _963 = _959 || _961;
            if (!_963)
            {
                float _965 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _967 = _827 + _965;
                float _969 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _971 = _969 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _973 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _975 = _973 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _977 = 1.0 / _971;
                float _979 = _967 * _977;
                float _981 = fma(_979, _975, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _923 = _981;
                _953 = true;
            }
            else
            {
                _923 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _953 = false;
    float _983 = _923;
    float _985 = in.m_86.w;
    float _987 = trunc(_985);
    int _989 = int(_987);
    int _991 = _989 << 5;
    uint _994 = uint(int(uint(_991) >> uint(2)));
    packed_uint4 _dmw0 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_994)];
    float _996 = as_type<float>(_dmw0.x);
    int _998 = _991 + 4;
    uint _1000 = uint(int(uint(_998) >> uint(2)));
    float _1002 = as_type<float>(_dmw0.y);
    int _1004 = _991 + 8;
    uint _1006 = uint(int(uint(_1004) >> uint(2)));
    float _1008 = as_type<float>(_dmw0.z);
    int _1010 = _991 + 12;
    uint _1012 = uint(int(uint(_1010) >> uint(2)));
    float _1014 = as_type<float>(_dmw0.w);
    float _1016 = _667 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1018 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1020 = _785 + _1018;
    float _1022 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1024 = _779 + _1022;
    float _1026 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1028 = _787 + _1026;
    float _1030 = fma(_621, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1016);
    float _1032 = fma(_1020, _983, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1034 = fma(_1024, _983, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1036 = fma(_1028, _983, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1038 = fma(_623, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1030);
    float _1040 = _667 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1042 = -_621;
    float _1044 = _1042 + _1032;
    float _1046 = -_623;
    float _1048 = _1046 + _1036;
    float _1050 = _1038 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1052 = fma(_621, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1040);
    float _1054 = -_667;
    float _1056 = _1054 + _1034;
    float _1058 = 1.0 / _1050;
    float _1060 = fma(_623, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1052);
    bool _1062 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1064 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1066 = _1062 || _1064;
    bool _1068 = isnan(0.5);
    bool _1070 = _1066 || _1068;
    float _1072 = _1056 * _283;
    float _1074 = _1056 * _317;
    float _1076 = _1056 * _329;
    float _1078 = _1060 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1080 = fma(_1044, _279, _1072);
    float _1082 = fma(_1044, _305, _1074);
    float _1084 = fma(_1044, _325, _1076);
    float _1086 = _1078 + _1050;
    float _1088 = fma(_1048, _287, _1080);
    float _1090 = fma(_1048, _321, _1082);
    float _1092 = fma(_1048, _333, _1084);
    float _1094 = _1086 * _1058;
    float _1096 = _1094 * 0.5;
    float _1098 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1100 = fma(_1096, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1098);
    bool _1102 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1104 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1106 = _1102 || _1104;
    bool _1108 = isnan(0.5);
    bool _1110 = _1106 || _1108;
    float _1112 = 1.0 / _1100;
    if (_1110)
    {
        _875 = 1.0;
    }
    float _1114 = _875;
    float _1116 = _1014 * 2.0;
    float _1118 = _996 * 2.0;
    float _1120 = _996 * _996;
    float _1122 = _1008 * _1008;
    float _1124 = _1008 * _1116;
    float _1126 = _996 * _1116;
    float _1128 = fma(_1120, -2.0, 1.0);
    float _1130 = _1002 * _1002;
    float _1132 = -_1124;
    float _1134 = fma(_1002, _1118, _1132);
    float _1136 = fma(_1002, _1118, _1124);
    float _1138 = _1002 * 2.0;
    float _1140 = _1002 * _1116;
    float _1142 = fma(_1122, -2.0, _1128);
    float _1144 = fma(_1130, -2.0, 1.0);
    float _1146 = -_1126;
    float _1148 = fma(_1008, _1138, _1146);
    float _1150 = fma(_1008, _1138, _1126);
    float _1152 = fma(_1008, _1118, _1140);
    float _1154 = _1090 * _1134;
    float _1156 = _1090 * _1142;
    float _1158 = -_1140;
    float _1160 = fma(_1008, _1118, _1158);
    float _1162 = fma(_1122, -2.0, _1144);
    float _1164 = _1090 * _1150;
    float _1166 = fma(_1130, -2.0, _1128);
    float _1168 = fma(_1088, _1136, _1156);
    float _1170 = fma(_1088, _1162, _1154);
    float _1172 = fma(_1088, _1160, _1164);
    float _1174 = fma(_1092, _1148, _1168);
    float _1176 = fma(_1092, _1152, _1170);
    float _1178 = fma(_1092, _1166, _1172);
    float _1180 = _667 + _1174;
    float _1182 = _621 + _1176;
    float _1184 = _623 + _1178;
    float _1186 = _1180;
    float _1188 = _1182;
    float _1190 = _1184;
    float _1192 = _1178;
    float _1194 = _1112;
    float _1196 = _1114;
    if (!_1070)
    {
        float _1198 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1200 = _667 + _1198;
        float _1202 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1204 = _621 + _1202;
        float _1206 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1208 = _1200 * _1200;
        float _1210 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1212 = _623 + _1210;
        float _1214 = fma(_1204, _1204, _1208);
        float _1216 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1218 = fma(_1212, _1212, _1214);
        float _1220 = sqrt(_1218);
        float _1222 = _1206 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1224 = precise::min(_1220, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1226 = _1224 * _1216;
        float _1228 = _1222 * _1226;
        float _1230 = fma(_1174, _1228, _667);
        float _1232 = fma(_1176, _1228, _621);
        float _1234 = fma(_1178, _1228, _623);
        _1186 = _1230;
        _1188 = _1232;
        _1190 = _1234;
    }
    float _1236 = _1186;
    float _1238 = _1188;
    float _1240 = _1190;
    if (_1110)
    {
        _1192 = 1.0;
    }
    float _1242 = _1192;
    float _1244 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1246 = _1112 * _1244;
    float _1248 = _1242;
    if (!_1110)
    {
        float _1250 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1252 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1254 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1252;
        float _1256 = _1250 * 0.15915493667125701904296875;
        float _1258 = _1256 * 6.283185482025146484375;
        float _1260 = cos(_1258);
        float _1262 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1264 = _1262 * 0.15915493667125701904296875;
        float _1266 = _1256 * 6.283185482025146484375;
        float _1268 = sin(_1266);
        float _1270 = 1.0 / _1260;
        float _1272 = _1264 * 6.283185482025146484375;
        float _1274 = cos(_1272);
        float _1276 = _1268 * _1270;
        float _1278 = _1264 * 6.283185482025146484375;
        float _1280 = sin(_1278);
        float _1282 = _1274 * _1276;
        float _1284 = 1.0 / _1254;
        float _1286 = 1.0 / _1282;
        float _1288 = _1280 * _1286;
        float _1290 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1292 = fma(_1246, _1288, _1290);
        float _1294 = _1292 * _1284;
        float _1296 = precise::clamp(_1294, 0.0, 1.0);
        _1194 = _1264;
        _1196 = _1296;
    }
    float _1298 = _1194;
    float _1300 = _1196;
    float _1302 = _1298;
    if (!_1110)
    {
        float _1304 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1306 = _1304 * 0.15915493667125701904296875;
        float _1308 = _1306 * 6.283185482025146484375;
        float _1310 = cos(_1308);
        float _1312 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1314 = _1312 * 0.15915493667125701904296875;
        float _1316 = _1306 * 6.283185482025146484375;
        float _1318 = sin(_1316);
        float _1320 = 1.0 / _1310;
        float _1322 = _1314 * 6.283185482025146484375;
        float _1324 = cos(_1322);
        float _1326 = _1318 * _1320;
        float _1328 = _1314 * 6.283185482025146484375;
        float _1330 = sin(_1328);
        float _1332 = _1324 * _1326;
        float _1334 = 1.0 / _1332;
        float _1336 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1338 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1336;
        float _1340 = 1.0 / _1338;
        float _1342 = _1330 * _1334;
        float _1344 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1346 = fma(_1246, _1342, _1344);
        float _1348 = _1346 * _1340;
        float _1350 = precise::clamp(_1348, 0.0, 1.0);
        float _1352 = -_1350;
        float _1354 = _1352 + 1.0;
        _1248 = _1354;
    }
    float _1356 = _1248;
    float _1358 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1360 = _1236 + _1358;
    float _1362 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1364 = _1238 + _1362;
    float _1366 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1368 = _1240 + _1366;
    float _1370 = _1236 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1372 = _1360 * _1360;
    float _1374 = fma(_1364, _1364, _1372);
    float _1376 = fma(_1368, _1368, _1374);
    float _1378 = rsqrt(_1376);
    float _1380 = sqrt(_1376);
    float _1382 = _1378 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1384 = _1364 * _1382;
    float _1386 = _1368 * _1382;
    float _1388 = _1384 * _1384;
    float _1390 = _1386 * _1386;
    float _1392 = _1388 + _1390;
    float _1394 = sqrt(_1392);
    bool _1396 = _1394 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1398 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1400 = _1394 + _1398;
    float _1402 = _1368;
    float _1404 = _1392;
    float _1406 = _1400;
    float _1408 = _1360;
    if (_1396)
    {
        float _1410 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1402 = _1410;
    }
    float _1412 = _1402;
    if (_1396)
    {
        float _1414 = rsqrt(_1392);
        _1404 = _1414;
    }
    float _1416 = _1404;
    float _1418 = _1416;
    if (_1396)
    {
        float _1420 = _1400 * _1412;
        _1406 = _1420;
    }
    float _1422 = _1406;
    if (_1396)
    {
        float _1424 = _1422 * 0.15915493667125701904296875;
        _1302 = _1424;
    }
    float _1426 = _1302;
    float _1428 = _1378;
    float _1430 = _1426;
    if (_1396)
    {
        float _1432 = _1426 * 6.283185482025146484375;
        float _1434 = sin(_1432);
        _1428 = _1434;
    }
    float _1436 = _1428;
    float _1438 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1440 = precise::max(0.0, _1438);
    float _1442 = _1412;
    float _1444 = _1440;
    if (_1396)
    {
        float _1446 = _1426 * 6.283185482025146484375;
        float _1448 = cos(_1446);
        _1442 = _1448;
    }
    float _1450 = _1442;
    float _1452 = -_1382;
    float _1454 = -_1440;
    float _1456 = fma(_1360, _1452, _1454);
    float _1458 = _1456;
    if (_1396)
    {
        float _1460 = _1456 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1408 = _1460;
    }
    float _1462 = _1408;
    if (!_1396)
    {
        _1430 = _1384;
    }
    float _1464 = _1430;
    float _1466 = _1436;
    float _1468 = _1464;
    if (_1396)
    {
        float _1470 = fma(_1436, _1462, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1466 = _1470;
    }
    float _1472 = _1466;
    float _1474 = _1472;
    float _1476 = _1450;
    if (_1396)
    {
        float _1478 = _1450 + (-1.0);
        _1444 = _1478;
    }
    float _1480 = _1444;
    float _1482 = _1480;
    if (_1396)
    {
        float _1484 = _1416 * _1472;
        _309 = _1484;
    }
    float _1486 = _309;
    if (!_1396)
    {
        _1418 = _1386;
    }
    float _1488 = _1418;
    float _1490 = _1488;
    if (_1396)
    {
        float _1492 = _1480 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1482 = _1492;
    }
    float _1494 = _1482;
    if (_1396)
    {
        float _1496 = _1384 * _1486;
        _1468 = _1496;
    }
    float _1498 = _1468;
    if (_1396)
    {
        float _1500 = _1386 * _1486;
        _1490 = _1500;
    }
    float _1502 = _1490;
    if (!_1396)
    {
        _1474 = _1390;
    }
    float _1504 = _1474;
    float _1506 = _1504;
    if (_1396)
    {
        float _1508 = fma(_1456, _1450, _1494);
        _1458 = _1508;
    }
    float _1510 = _1458;
    if (!_1396)
    {
        _1476 = _1388;
    }
    float _1512 = _1476;
    float _1514 = _1512;
    if (_1396)
    {
        float _1516 = _1498 * _1498;
        _1514 = _1516;
    }
    float _1518 = _1514;
    if (_1396)
    {
        float _1520 = _1502 * _1502;
        _1506 = _1520;
    }
    float _1522 = _1506;
    float _1524 = _1236 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1526 = fma(_1510, _1510, _1518);
    float _1528 = fma(_1238, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1370);
    float _1530 = _1526 + _1522;
    float _1532 = fma(_1238, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1524);
    float _1534 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1536 = fma(_1380, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1534);
    float _1538 = precise::clamp(_1536, 0.0, 1.0);
    float _1540 = rsqrt(_1530);
    float _1542 = fma(_1240, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1532);
    float _1544 = -_1538;
    float _1546 = _1544 + 1.0;
    float _1548 = fma(_621, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1550 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1552 = _1542 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1554 = fma(_623, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1556 = _1236 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1558 = floor(_1548);
    float _1560 = _1552 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1562 = _1236 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1564 = fma(_1240, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1528);
    float _1566 = -_1560;
    float _1568 = fma(_1566, _1550, 1.0);
    float _1570 = fma(_1238, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1556);
    float _1572 = _1540 * _1498;
    float _1574 = _1540 * _1510;
    float _1576 = _1540 * _1502;
    float _1578 = fma(_1238, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1562);
    float _1580 = fma(_1240, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1570);
    float _1582 = abs(_1546);
    float _1584 = log2(_1582);
    float _1586 = _1572 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1588 = fma(_1240, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1578);
    float _1590 = _1580 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1592 = -_1558;
    float _1594 = _1548 + _1592;
    float _1596 = -_1586;
    float _1598 = fma(_1574, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1596);
    float _1600 = _1588 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1602 = _1590 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1604 = floor(_1554);
    float _1606 = -_1576;
    float _1608 = fma(_1606, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1598);
    float _1610 = _1564 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1612 = fma(_1600, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1602);
    float _1614 = fma(_1608, -0.5, 0.5);
    float _1616 = fma(_1608, 0.5, 0.5);
    float _1618 = fma(_1552, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1612);
    float _1620 = _1584 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1622 = log2(_1568);
    float _1624 = _1590 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1626 = fma(_1610, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1618);
    float _1628 = _1574 + 1.0;
    float _1630 = fma(_1600, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1624);
    float _1632 = -_1604;
    float _1634 = _1554 + _1632;
    float _1636 = exp2(_1620);
    float _1638 = fma(_1616, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1640 = fma(_1552, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1630);
    float2 _4744 = float2(_1594, _1634);
    float _1642 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4744, float2(0.0), isnan(_4744)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4744, float2(0.0), isnan(_4744)), level(0.0)).x;
    float _1644 = fma(_1616, _1638, -0.212114393711090087890625);
    float _1646 = fma(_1610, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1640);
    float _1648 = 1.0 / _1626;
    float _1650 = _1590 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1652 = _1622 * 0.693147182464599609375;
    float _1654 = fma(_1616, _1644, 1.570728778839111328125);
    float _1656 = fma(_1600, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1650);
    float _1658 = _1652 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1660 = sqrt(_1614);
    float _1662 = fma(_1552, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1656);
    float _1664 = -_1574;
    float _1666 = fma(_1636, _1628, _1664);
    float _1668 = fma(_1610, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1662);
    float _1670 = fma(_1666, 0.5, 0.5);
    float _1672 = _1646 * _1648;
    float _1674 = _1668 * _1648;
    float _1676 = fma(_1672, 0.5, 0.5);
    float _1678 = fma(_1674, -0.5, 0.5);
    float _1680 = _1660 * 0.636619746685028076171875;
    float _1682 = -_1654;
    float _1684 = fma(_1680, _1682, 1.0);
    float3 _4824 = float3(_1676, _1678, _1658);
    float _1686 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4824, float3(0.0), isnan(_4824)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4824, float3(0.0), isnan(_4824)), level(0.0)).x;
    float3 _4835 = float3(_1676, _1678, _1658);
    float4 _1689 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4835, float3(0.0), isnan(_4835)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4835, float3(0.0), isnan(_4835)), level(0.0)).xyzw;
    float _1691 = _1689.x;
    float _1693 = _1689.y;
    float _1695 = _1689.z;
    float _1697 = _1689.w;
    float2 _4851 = float2(_1684, _1670);
    float3 _1701 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4851, float2(0.0), isnan(_4851)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4851, float2(0.0), isnan(_4851)), level(0.0)).xyz;
    float _1703 = _1701.x;
    float _1705 = _1701.y;
    float _1707 = _1701.z;
    float _1709 = abs(_1246);
    float _1711 = log2(_1709);
    bool _1713 = 0.0 != (*spvDescriptorSet0.vp_c11)._m0[20].z;
    bool _1715 = isnan(0.0);
    bool _1717 = _1713 || _1715;
    bool _1719 = isnan((*spvDescriptorSet0.vp_c11)._m0[20].z);
    bool _1721 = _1717 || _1719;
    float _1723 = _1590 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1725 = _919 * _1134;
    float _1727 = fma(_1600, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1723);
    float _1729 = (*spvDescriptorSet0.vp_c11)._m0[20].z * 0.300000011920928955078125;
    float _1731 = _919 * _1142;
    float _1733 = fma(_1552, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1727);
    float _1735 = fma(_913, _1162, _1725);
    float _1737 = _1711 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1739 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1741 = fma(_1729, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1739);
    float _1743 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1745 = fma(_1729, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1743);
    float _1747 = _1678;
    float _1749 = _1741;
    if (_1721)
    {
        float _1751 = (*spvDescriptorSet0.vp_c11)._m0[20].z * 0.20000000298023223876953125;
        _1747 = _1751;
    }
    float _1753 = _1747;
    float _1755 = fma((*spvDescriptorSet0.vp_c11)._m0[20].z, 0.5, _1741);
    float _1757 = exp2(_1737);
    float _1759 = fma((*spvDescriptorSet0.vp_c11)._m0[20].z, 0.5, _1745);
    if (_1721)
    {
        float _1761 = precise::min(_1753, 20.0);
        _1749 = _1761;
    }
    float _1763 = _1749;
    float _1765 = _621 + _1755;
    float _1767 = _623 + _1759;
    float _1769 = -_1765;
    float _1771 = _1769 + (*spvDescriptorSet0.vp_c11)._m0[20].z;
    float _1773 = (*spvDescriptorSet0.vp_c11)._m0[20].z;
    if (_1721)
    {
        float _1775 = 1.0 / _1763;
        _1773 = _1775;
    }
    float _1777 = _1773;
    float _1779 = -_1767;
    float _1781 = _1779 + (*spvDescriptorSet0.vp_c11)._m0[20].z;
    float _1783 = precise::min(_1765, _1771);
    float _1785 = _919 * _1150;
    float _1787 = precise::min(_1767, _1781);
    float _1789 = _1584 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1791 = fma(_1757, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1793 = precise::clamp(_1791, 0.0, 1.0);
    float _1795 = fma(_1610, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1733);
    float _1797 = precise::min(_1783, _1787);
    float _1799 = in.m_88.x;
    float _1801 = fma(_1793, -2.0, 3.0);
    float _1803 = _1793 * _1793;
    float _1805 = _1781;
    if (!_1721)
    {
        _1805 = 1.0;
    }
    float _1807 = _1805;
    float _1809 = exp2(_1789);
    float _1811 = _1807;
    if (_1721)
    {
        float _1813 = _1797 * _1777;
        float _1815 = precise::clamp(_1813, 0.0, 1.0);
        _1811 = _1815;
    }
    float _1817 = _1811;
    float _1819 = _1803 * _1801;
    bool _1821 = _1246 <= 8000.0;
    bool _1823 = isnan(_1246);
    bool _1825 = _1821 || _1823;
    bool _1827 = isnan(8000.0);
    bool _1829 = _1825 || _1827;
    float _1831 = float(_1829);
    float _1833 = _1795 + _1626;
    float _1835 = -_1819;
    float _1837 = _1835 + 1.0;
    bool _1839 = _1380 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1841 = isnan(_1380);
    bool _1843 = _1839 || _1841;
    bool _1845 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1847 = _1843 || _1845;
    float _1849 = _1833 * 0.5;
    float _1851 = fma(_1837, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1819);
    float _1853 = fma(_913, _1136, _1731);
    float _1855 = fma(_913, _1160, _1785);
    float _1857 = fma(_911, _1152, _1735);
    float _1859 = _1831 * _1851;
    float _1861 = fma(_911, _1148, _1853);
    float _1863 = fma(_911, _1166, _1855);
    float _1865 = _1859 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _1867 = -_1809;
    float _1869 = _1867 + 1.0;
    out.m_90.z = _1849;
    out.m_90.w = _1626;
    float _1871 = _1869 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_92.x = _1857;
    out.m_92.y = _1861;
    out.m_92.z = _1863;
    out.gl_Position.x = _1646;
    out.gl_Position.y = _1668;
    out.gl_Position.z = _1795;
    out.gl_Position.w = _1626;
    float _1873 = -_1642;
    float _1875 = _1873 + 1.0;
    float _1877 = _1875 * _1865;
    float _1879 = precise::clamp(_1877, 0.0, 1.0);
    float _1881 = -_1879;
    float _1883 = fma(_1881, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _1885 = -_1871;
    float _1887 = _1885 + 1.0;
    float _1889 = _1883 * _1799;
    float _1891 = _1889 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_94.x = _1891;
    float _1893 = _1871 * _1686;
    float _1895 = _1697 * _1887;
    float _1897 = _1887;
    float _1899 = _1697;
    float _1901 = _1817;
    float _1903 = _1693;
    if (!_1847)
    {
        _1897 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1905 = _1897;
    float _1907 = _1697 * _1893;
    float _1909 = _1707 * _1893;
    float _1911 = fma(_1703, _1907, _1691);
    float _1913 = _1300 * _1356;
    float _1915 = fma(_1705, _1907, _1693);
    float _1917 = fma(_1697, _1909, _1695);
    float _1919 = _1911;
    float _1921 = _1905;
    float _1923 = _1905;
    if (!_1847)
    {
        _1899 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1925 = _1899;
    float _1927 = _1913 * _1817;
    float _1929 = _1927;
    float _1931 = _1925;
    float _1933 = _1925;
    if (!_1847)
    {
        _1901 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1935 = _1901;
    out.m_96.x = _1911;
    out.m_96.y = _1915;
    out.m_96.z = _1917;
    out.m_96.w = _1895;
    float _1937 = _1927 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1939 = _1935;
    float _1941 = _1935;
    if (!_1847)
    {
        _1903 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1943 = _1903;
    float _1945 = _1943;
    float _1947 = _1943;
    if (!_1847)
    {
        _1929 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1949 = _1929;
    float _1951 = _1949;
    float _1953 = _1949;
    if (!_1847)
    {
        _1919 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1955 = _1919;
    bool _1957 = !_1847;
    float _1959 = _1955;
    float _1961 = _1955;
    if (!_1957)
    {
        bool _1963 = _1380 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1965 = isnan(_1380);
        bool _1967 = _1963 || _1965;
        bool _1969 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1971 = _1967 || _1969;
        if (!_1971)
        {
            float _1973 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1975 = _1380 + _1973;
            float _1977 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1979 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1977;
            float _1981 = 1.0 / _1979;
            float _1983 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1985 = _1983 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1987 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1989 = _1987 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1991 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1993 = _1991 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1995 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1997 = _1995 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1999 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2001 = _1999 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2003 = _1975 * _1981;
            float _2005 = precise::clamp(_2003, 0.0, 1.0);
            float _2007 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2009 = _2007 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2011 = fma(_2005, _1985, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2013 = fma(_2005, _2009, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2015 = fma(_2005, _1989, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2017 = fma(_2005, _1993, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2019 = fma(_2005, _1997, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2021 = fma(_2005, _2001, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1933 = _2011;
            _1953 = _2019;
            _1923 = _2013;
            _1947 = _2017;
            _1941 = _2015;
            _1961 = _2021;
            _2023 = true;
        }
        else
        {
            bool _2025 = _1380 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2027 = isnan(_1380);
            bool _2029 = _2025 || _2027;
            bool _2031 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2033 = _2029 || _2031;
            if (!_2033)
            {
                _1921 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2035 = _1921;
            _1923 = _2035;
            if (!_2033)
            {
                _1931 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2037 = _1931;
            _1933 = _2037;
            if (!_2033)
            {
                _1939 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2039 = _1939;
            _1941 = _2039;
            if (!_2033)
            {
                _1945 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2041 = _1945;
            _1947 = _2041;
            if (!_2033)
            {
                _1951 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2043 = _1951;
            _1953 = _2043;
            if (!_2033)
            {
                _1959 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2045 = _1959;
            bool _2047 = !_2033;
            _1961 = _2045;
            if (!_2047)
            {
                bool _2049 = _1380 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2051 = isnan(_1380);
                bool _2053 = _2049 || _2051;
                bool _2055 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2057 = _2053 || _2055;
                if (!_2057)
                {
                    float _2059 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2061 = _1380 + _2059;
                    float _2063 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2065 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2063;
                    float _2067 = 1.0 / _2065;
                    float _2069 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2071 = _2069 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2073 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2075 = _2073 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2077 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2079 = _2077 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2081 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2083 = _2081 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2085 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2087 = _2085 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2089 = _2061 * _2067;
                    float _2091 = precise::clamp(_2089, 0.0, 1.0);
                    float _2093 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2095 = _2093 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2097 = fma(_2091, _2071, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2099 = fma(_2091, _2095, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2101 = fma(_2091, _2075, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2103 = fma(_2091, _2079, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2105 = fma(_2091, _2083, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2107 = fma(_2091, _2087, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1933 = _2097;
                    _1953 = _2105;
                    _1923 = _2099;
                    _1947 = _2103;
                    _1941 = _2101;
                    _1961 = _2107;
                    _2023 = true;
                }
                else
                {
                    _1933 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1953 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1923 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1947 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1941 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1961 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2023 = false;
    float _2109 = _1933;
    float _2111 = _1953;
    float _2113 = _1923;
    float _2115 = _1947;
    float _2117 = _1941;
    float _2119 = _1961;
    float _2121 = fma(_1861, -0.5, 0.5);
    float _2123 = precise::clamp(_2121, 0.0, 1.0);
    float _2125 = -_2109;
    float _2127 = _2125 + _2111;
    float _2129 = -_2113;
    float _2131 = _2129 + _2115;
    out.m_98.x = 0.0;
    float _2133 = fma(_2123, _2127, _2109);
    float _2135 = -_2117;
    float _2137 = _2135 + _2119;
    float _2139 = fma(_2123, _2131, _2113);
    float _2141 = _2133 * 0.586610972881317138671875;
    bool _2143 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2145 = fma(_2123, _2137, _2117);
    float _2147 = _1937 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2149 = fma(_2139, 0.298911988735198974609375, _2141);
    bool _2151 = _1300 > 0.0;
    bool _2153 = isnan(_1300);
    bool _2155 = _2151 || _2153;
    bool _2157 = isnan(0.0);
    bool _2159 = _2155 || _2157;
    float _2161 = fma(_2145, 0.114477999508380889892578125, _2149);
    out.m_58.x = _2147;
    bool _2163 = _1356 <= 0.0;
    bool _2165 = !_2159;
    bool _2167 = _2163 || _2165;
    float _2169 = -_2161;
    float _2171 = _2139 + _2169;
    float _2173 = -_2161;
    float _2175 = _2133 + _2173;
    float _2177 = -_2161;
    float _2179 = _2145 + _2177;
    float _2181 = fma(_2171, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2161);
    float _2183 = fma(_2175, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2161);
    float _2185 = fma(_2179, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2161);
    bool _2187 = !_2143;
    if (!_2187)
    {
        float _2189 = -_1236;
        float _2191 = _2189 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2193 = -_1238;
        float _2195 = _2193 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2197 = -_1240;
        float _2199 = _2197 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2201 = _2191 * _2191;
        float _2203 = fma(_2195, _2195, _2201);
        float _2205 = fma(_2199, _2199, _2203);
        float _2207 = sqrt(_2205);
        float _2209 = rsqrt(_2205);
        float _2211 = -_2207;
        float _2213 = _2211 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2215 = _2213 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2217 = precise::clamp(_2215, 0.0, 1.0);
        float _2219 = _2195 * _2209;
        float _2221 = _2191 * _2209;
        float _2223 = abs(_2217);
        float _2225 = log2(_2223);
        float _2227 = _2199 * _2209;
        float _2229 = _2219 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2231 = _1861 * _2221;
        float _2233 = -_2221;
        float _2235 = -_2229;
        float _2237 = fma(_2233, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2235);
        float _2239 = fma(_1857, _2219, _2231);
        float _2241 = -_2227;
        float _2243 = fma(_2241, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2237);
        float _2245 = fma(_1863, _2227, _2239);
        float _2247 = precise::clamp(_2245, 0.0, 1.0);
        float _2249 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2251 = _2243 + _2249;
        float _2253 = _2225 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2255 = _2251 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2257 = precise::clamp(_2255, 0.0, 1.0);
        float _2259 = exp2(_2253);
        float _2261 = _2259 * _2257;
        float _2263 = _2247 * _2261;
        float _2265 = _2263 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2267 = _2263 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2269 = _2263 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_98.x = _2265;
        out.m_98.y = _2267;
        out.m_98.z = _2269;
    }
    out.m_100.x = _2181;
    out.m_100.y = _2183;
    out.m_100.z = _2185;
    if (!_2167)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_58.x = 0.0;
    float _2271 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2271;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_100 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2023 = false;
    bool _953 = false;
    bool _355 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _114 = in.m_55.w;
    float _116 = trunc(_114);
    int _119 = int(_116);
    bool _123 = _119 >= 1;
    float _125 = 0.0;
    if (!_123)
    {
        _125 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _127 = _125;
    if (!_123)
    {
        out.m_58.x = 0.0;
    }
    int _129 = 0;
    if (!_123)
    {
        float _131 = _127 * 5.0;
        _129 = as_type<int>(_131);
    }
    int _133 = _129;
    int _135 = _133;
    if (!_123)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2327 = as_type<float>(_133);
        out.gl_Position.z = _2327;
    }
    if (!_123)
    {
        return out;
    }
    float _137 = in.m_60.w;
    bool _139 = _137 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _141 = isnan(_137);
    bool _143 = _139 || _141;
    bool _145 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _147 = _143 || _145;
    float _149 = -_137;
    float _151 = _149 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _153 = 0.0;
    if (_147)
    {
        float _155 = float(_119);
        _153 = _155;
    }
    float _157 = _153;
    bool _159 = _151 >= _157;
    bool _161 = !_147;
    bool _163 = _159 || _161;
    float _165 = 0.0;
    if (_163)
    {
        _165 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _167 = _165;
    if (_163)
    {
        out.m_58.x = 0.0;
    }
    if (_163)
    {
        float _169 = _167 * 5.0;
        _135 = as_type<int>(_169);
    }
    int _171 = _135;
    if (_163)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2395 = as_type<float>(_171);
        out.gl_Position.z = _2395;
    }
    if (_163)
    {
        return out;
    }
    float _173 = in.m_62.x;
    float _175 = in.m_62.y;
    float _177 = in.m_62.z;
    float _179 = in.m_64.x;
    float _181 = in.m_64.y;
    float _183 = in.m_64.z;
    float _185 = in.m_66.x;
    float _187 = in.m_66.y;
    float _189 = in.m_66.z;
    float _191 = _173 * _173;
    float _193 = _175 * _175;
    float _195 = _177 * _177;
    float _197 = fma(_179, _179, _191);
    float _199 = fma(_181, _181, _193);
    float _201 = fma(_183, _183, _195);
    float _203 = fma(_185, _185, _197);
    float _205 = fma(_187, _187, _199);
    float _207 = fma(_189, _189, _201);
    float _209 = sqrt(_203);
    float _211 = sqrt(_205);
    float _213 = sqrt(_207);
    bool _215 = _209 > 0.0;
    bool _217 = _211 > 0.0;
    float _219 = _211;
    float _221 = _173;
    if (_215)
    {
        float _223 = rsqrt(_203);
        _219 = _223;
    }
    float _225 = _219;
    float _227 = 0.0;
    if (!_215)
    {
        _227 = 0.0;
    }
    float _229 = _227;
    bool _231 = _213 > 0.0;
    float _233 = 0.0;
    float _235 = _229;
    if (!_215)
    {
        _233 = 0.0;
    }
    float _237 = _233;
    float _239 = 0.0;
    float _241 = _237;
    if (!_215)
    {
        _239 = 0.0;
    }
    float _243 = _239;
    float _245 = _213;
    float _247 = _243;
    if (_217)
    {
        float _249 = rsqrt(_205);
        _245 = _249;
    }
    float _251 = _245;
    float _253 = 0.0;
    if (!_217)
    {
        _253 = 0.0;
    }
    float _255 = _253;
    float _257 = 0.0;
    float _259 = _255;
    if (!_217)
    {
        _257 = 0.0;
    }
    float _261 = _257;
    float _263 = 0.0;
    float _265 = _261;
    if (!_217)
    {
        _263 = 0.0;
    }
    float _267 = _263;
    float _269 = 0.0;
    float _271 = _267;
    if (_231)
    {
        float _273 = rsqrt(_207);
        _269 = _273;
    }
    float _275 = _269;
    if (_215)
    {
        float _277 = _225 * _179;
        _235 = _277;
    }
    float _279 = _235;
    if (_215)
    {
        float _281 = _225 * _173;
        _241 = _281;
    }
    float _283 = _241;
    if (_215)
    {
        float _285 = _225 * _185;
        _247 = _285;
    }
    float _287 = _247;
    bool _289 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _291 = 0.0;
    if (!_231)
    {
        _291 = 0.0;
    }
    float _293 = _291;
    float _295 = 0.0;
    float _297 = _293;
    if (!_231)
    {
        _295 = 0.0;
    }
    float _299 = _295;
    float _301 = _299;
    if (_217)
    {
        float _303 = _251 * _181;
        _259 = _303;
    }
    float _305 = _259;
    float _307 = 0.0;
    float _309 = _305;
    if (!_231)
    {
        _307 = 0.0;
    }
    float _311 = _307;
    float _313 = _311;
    if (_217)
    {
        float _315 = _251 * _175;
        _265 = _315;
    }
    float _317 = _265;
    if (_217)
    {
        float _319 = _251 * _187;
        _271 = _319;
    }
    float _321 = _271;
    if (_231)
    {
        float _323 = _275 * _183;
        _297 = _323;
    }
    float _325 = _297;
    if (_231)
    {
        float _327 = _275 * _177;
        _301 = _327;
    }
    float _329 = _301;
    if (_231)
    {
        float _331 = _275 * _189;
        _313 = _331;
    }
    float _333 = _313;
    bool _335 = !_289;
    float _353;
    if (!_335)
    {
        float _337 = in.m_68.x;
        float _339 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _341 = _337 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _343 = fma(_341, (*spvDescriptorSet0.vp_c9)._m0[12].x, _151);
        float _345 = _343 * _339;
        float _347 = floor(_345);
        float _349 = -_347;
        float _351 = _345 + _349;
        _353 = _351;
        _355 = true;
    }
    else
    {
        float _357 = float(_119);
        float _359 = 1.0 / _357;
        float _361 = _151 * _359;
        _353 = _361;
    }
    _355 = false;
    float _363 = _353;
    float _365 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _367 = _363 + _365;
    float _369 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _371 = _363 + _369;
    bool _373 = _363 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _375 = isnan(_363);
    bool _377 = _373 || _375;
    bool _379 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _381 = _377 || _379;
    float _383 = float(_381);
    float _385 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _387 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _385;
    float _389 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _391 = _389 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _393 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _395 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _393;
    float _397 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _399 = _363 + _397;
    float _401 = 1.0 / _391;
    float _403 = -_383;
    float _405 = _403 + 1.0;
    bool _407 = _363 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _409 = isnan(_363);
    bool _411 = _407 || _409;
    bool _413 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _415 = _411 || _413;
    float _417 = float(_415);
    bool _419 = _363 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _421 = isnan(_363);
    bool _423 = _419 || _421;
    bool _425 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _427 = _423 || _425;
    float _429 = float(_427);
    float _431 = 1.0 / _387;
    float _433 = -_417;
    float _435 = _433 + 1.0;
    float _437 = _417 * _405;
    float _439 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _441 = _439 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _443 = _429 * _435;
    float _445 = -_429;
    float _447 = _445 + 1.0;
    float _449 = 1.0 / _395;
    float _451 = _367 * _401;
    bool _453 = _363 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _455 = isnan(_363);
    bool _457 = _453 || _455;
    bool _459 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _461 = _457 || _459;
    float _463 = float(_461);
    float _465 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _467 = _465 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _469 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _471 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _469;
    float _473 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _475 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _473;
    float _477 = -_463;
    float _479 = _477 + 1.0;
    float _481 = _371 * _431;
    float _483 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _485 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _483;
    float _487 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _489 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _487;
    float _491 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _493 = _491 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _495 = _383 * _479;
    float _497 = fma(_485, _481, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _499 = fma(_489, _481, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _501 = fma(_493, _451, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _503 = _399 * _449;
    float _505 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _507 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _505;
    float _509 = fma(_441, _451, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _511 = _497 * _443;
    float _513 = _499 * _443;
    float _515 = fma(_507, _481, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _517 = fma(_467, _451, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _519 = in.m_55.x;
    float _521 = in.m_55.y;
    float _523 = in.m_55.z;
    float _525 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _527 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _525;
    float _529 = _515 * _443;
    float _531 = fma(_447, (*spvDescriptorSet0.vp_c9)._m0[143].y, _513);
    float _533 = in.m_70.x;
    float _535 = in.m_70.y;
    float _537 = in.m_70.z;
    float _539 = fma(_471, _503, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _541 = fma(_475, _503, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _543 = fma(_527, _503, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _545 = in.m_72.x;
    float _547 = in.m_72.y;
    float _549 = in.m_72.z;
    float _551 = fma(_447, (*spvDescriptorSet0.vp_c9)._m0[143].x, _511);
    float _553 = fma(_509, _437, _531);
    float _555 = fma(_447, (*spvDescriptorSet0.vp_c9)._m0[143].z, _529);
    float _557 = fma(_517, _437, _551);
    float _559 = fma(_541, _495, _553);
    float _561 = fma(_501, _437, _555);
    float _563 = fma(_539, _495, _557);
    float _565 = fma(_463, (*spvDescriptorSet0.vp_c9)._m0[146].y, _559);
    float _567 = fma(_543, _495, _561);
    float _569 = fma(_463, (*spvDescriptorSet0.vp_c9)._m0[146].x, _563);
    float _571 = fma(_463, (*spvDescriptorSet0.vp_c9)._m0[146].z, _567);
    float _573 = _187 * _521;
    float _575 = _181 * _521;
    float _577 = in.m_68.y;
    float _579 = _175 * _521;
    float _581 = _565 * _535;
    float _583 = fma(_185, _519, _573);
    float _585 = _569 * _533;
    float _587 = _571 * _537;
    float _589 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _547);
    float _591 = _581 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _593 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _545);
    float _595 = _585 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _597 = fma(_179, _519, _575);
    float _599 = _591 * _589;
    float _601 = _587 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _603 = _595 * _593;
    float _605 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _549);
    float _607 = _599 * _305;
    float _609 = _599 * _321;
    float _611 = fma(_183, _523, _597);
    float _613 = fma(_189, _523, _583);
    float _615 = _601 * _605;
    float _617 = fma(_603, _279, _607);
    float _619 = fma(_603, _287, _609);
    float _621 = _611 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _623 = _613 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _625 = fma(_615, _325, _617);
    float _627 = fma(_615, _333, _619);
    float _629 = in.m_74.x;
    float _631 = fma(_173, _519, _579);
    float _633 = _621 + _625;
    float _635 = _623 + _627;
    float _637 = in.m_74.y;
    float _639 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _641 = _633 + _639;
    float _643 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _645 = _635 + _643;
    int _647 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _649 = _647 != 0;
    float _651 = fma(_177, _523, _631);
    float _653 = _641 * _641;
    float _655 = _645 * _645;
    int _657 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _659 = _657 != 0;
    float _661 = _599 * _317;
    float _663 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _665 = _653 + _655;
    float _667 = _651 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _669 = fma(_603, _283, _661);
    bool _671 = _577 > 0.5;
    float _673 = _501;
    float _675 = _669;
    float _677 = _633;
    float _679 = _635;
    if (_649)
    {
        float _681 = in.m_68.x;
        _673 = _681;
    }
    float _683 = _673;
    float _685 = sqrt(_665);
    float _687 = fma(_615, _329, _669);
    float _689 = _629;
    if (_649)
    {
        _675 = _629;
    }
    float _691 = _675;
    float _693 = _667 + _687;
    float _695 = -_637;
    float _697 = _695 + 1.0;
    float _699 = _637;
    float _701 = _697;
    float _703 = _691;
    if (_659)
    {
        float _705 = _671 ? _697 : _637;
        _699 = _705;
    }
    float _707 = _699;
    bool _709 = _685 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    bool _711 = _683 > 0.5;
    bool _713 = _711 && _649;
    float _715 = _683;
    if (!_709)
    {
        _701 = _655;
    }
    float _717 = _701;
    float _719 = _717;
    if (!_709)
    {
        _221 = _653;
    }
    float _721 = _221;
    float _723 = _721;
    if (!_709)
    {
        _715 = _693;
    }
    float _725 = _715;
    bool _727 = !_709;
    float _729 = _725;
    if (!_727)
    {
        float _731 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _733 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _735 = _685 + _733;
        float _737 = _693 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _739 = rsqrt(_665);
        float _741 = _735 * _731;
        float _743 = _741 * 0.15915493667125701904296875;
        float _745 = _743 * 6.283185482025146484375;
        float _747 = sin(_745);
        float _749 = _743 * 6.283185482025146484375;
        float _751 = cos(_749);
        float _753 = fma(_747, _737, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _755 = _739 * _753;
        float _757 = _751 + (-1.0);
        float _759 = fma(_641, _755, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _761 = fma(_645, _755, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _763 = _757 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _765 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _767 = _759 + _765;
        float _769 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _771 = _761 + _769;
        float _773 = fma(_693, _751, _763);
        float _775 = _767 * _767;
        float _777 = _771 * _771;
        _729 = _773;
        _723 = _775;
        _719 = _777;
        _677 = _759;
        _679 = _761;
    }
    float _779 = _729;
    float _781 = _723;
    float _783 = _719;
    float _785 = _677;
    float _787 = _679;
    float _789 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _791 = _779 + _789;
    float _793 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    if (_713)
    {
        float _795 = -_691;
        float _797 = _795 + 1.0;
        _703 = _797;
    }
    float _799 = _703;
    float _801 = _707 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _803 = fma(_791, _791, _781);
    if (_649)
    {
        _689 = _799;
    }
    float _805 = _689;
    float _807 = _803 + _783;
    float _809 = in.m_76.x;
    float _811 = in.m_76.y;
    float _813 = in.m_76.z;
    float _815 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    bool _817 = _547 != 0.0;
    bool _819 = isnan(_547);
    bool _821 = _817 || _819;
    bool _823 = isnan(0.0);
    bool _825 = _821 || _823;
    float _827 = sqrt(_807);
    float _829 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    bool _831 = _545 == 0.0;
    bool _833 = !_825;
    bool _835 = _831 && _833;
    float _837 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _839 = _805 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _841 = _801 * _663;
    bool _843 = _549 == 0.0;
    bool _845 = _843 && _835;
    float _847 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _849 = _815 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _851 = _829 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _853 = _837 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _855 = _839 * _793;
    out.m_78.x = _849;
    out.m_78.y = _851;
    out.m_78.z = _853;
    out.m_78.w = _847;
    float _857 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    bool _859 = _827 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _861 = isnan(_827);
    bool _863 = _859 || _861;
    bool _865 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _867 = _863 || _865;
    out.m_80.x = _855;
    out.m_80.y = _841;
    float _869 = _811;
    float _871 = _809;
    float _873 = _813;
    float _875 = _841;
    if (!_845)
    {
        float _877 = fma(_547, (*spvDescriptorSet0.vp_c9)._m0[17].y, _811);
        _869 = _877;
    }
    float _879 = _869;
    float _881 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _883 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    if (!_845)
    {
        float _885 = fma(_545, (*spvDescriptorSet0.vp_c9)._m0[17].y, _809);
        _871 = _885;
    }
    float _887 = _871;
    float _889 = _305 * _879;
    float _891 = _317 * _879;
    float _893 = _321 * _879;
    float _895 = _857 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _897 = _881 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _899 = _883 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    if (!_845)
    {
        float _901 = fma(_549, (*spvDescriptorSet0.vp_c9)._m0[17].y, _813);
        _873 = _901;
    }
    float _903 = _873;
    float _905 = fma(_279, _887, _889);
    float _907 = fma(_283, _887, _891);
    float _909 = fma(_287, _887, _893);
    out.m_82.x = 1.0;
    out.m_82.y = 1.0;
    out.m_82.z = 1.0;
    float _911 = fma(_333, _903, _909);
    out.m_84.x = _895;
    out.m_84.y = _897;
    out.m_84.z = _899;
    float _913 = fma(_325, _903, _905);
    float _915 = _905;
    if (!_867)
    {
        _915 = 1.0;
    }
    float _917 = _915;
    float _919 = fma(_329, _903, _907);
    bool _921 = !_867;
    float _923 = _917;
    if (!_921)
    {
        bool _925 = _827 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _927 = isnan(_827);
        bool _929 = _925 || _927;
        bool _931 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _933 = _929 || _931;
        if (!_933)
        {
            float _935 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _937 = _827 + _935;
            float _939 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _941 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _939;
            float _943 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _945 = _943 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _947 = 1.0 / _941;
            float _949 = _937 * _947;
            float _951 = fma(_949, _945, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _923 = _951;
            _953 = true;
        }
        else
        {
            bool _955 = _827 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _957 = isnan(_827);
            bool _959 = _955 || _957;
            bool _961 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _963 = _959 || _961;
            if (!_963)
            {
                float _965 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _967 = _827 + _965;
                float _969 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _971 = _969 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _973 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _975 = _973 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _977 = 1.0 / _971;
                float _979 = _967 * _977;
                float _981 = fma(_979, _975, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _923 = _981;
                _953 = true;
            }
            else
            {
                _923 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _953 = false;
    float _983 = _923;
    float _985 = in.m_86.w;
    float _987 = trunc(_985);
    int _989 = int(_987);
    int _991 = _989 << 5;
    uint _994 = uint(int(uint(_991) >> uint(2)));
    packed_uint4 _dmw0 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_994)];
    float _996 = as_type<float>(_dmw0.x);
    int _998 = _991 + 4;
    uint _1000 = uint(int(uint(_998) >> uint(2)));
    float _1002 = as_type<float>(_dmw0.y);
    int _1004 = _991 + 8;
    uint _1006 = uint(int(uint(_1004) >> uint(2)));
    float _1008 = as_type<float>(_dmw0.z);
    int _1010 = _991 + 12;
    uint _1012 = uint(int(uint(_1010) >> uint(2)));
    float _1014 = as_type<float>(_dmw0.w);
    float _1016 = _667 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1018 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1020 = _785 + _1018;
    float _1022 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1024 = _779 + _1022;
    float _1026 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1028 = _787 + _1026;
    float _1030 = fma(_621, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1016);
    float _1032 = fma(_1020, _983, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1034 = fma(_1024, _983, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1036 = fma(_1028, _983, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1038 = fma(_623, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1030);
    float _1040 = _667 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1042 = -_621;
    float _1044 = _1042 + _1032;
    float _1046 = -_623;
    float _1048 = _1046 + _1036;
    float _1050 = _1038 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1052 = fma(_621, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1040);
    float _1054 = -_667;
    float _1056 = _1054 + _1034;
    float _1058 = 1.0 / _1050;
    float _1060 = fma(_623, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1052);
    bool _1062 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1064 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1066 = _1062 || _1064;
    bool _1068 = isnan(0.5);
    bool _1070 = _1066 || _1068;
    float _1072 = _1056 * _283;
    float _1074 = _1056 * _317;
    float _1076 = _1056 * _329;
    float _1078 = _1060 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1080 = fma(_1044, _279, _1072);
    float _1082 = fma(_1044, _305, _1074);
    float _1084 = fma(_1044, _325, _1076);
    float _1086 = _1078 + _1050;
    float _1088 = fma(_1048, _287, _1080);
    float _1090 = fma(_1048, _321, _1082);
    float _1092 = fma(_1048, _333, _1084);
    float _1094 = _1086 * _1058;
    float _1096 = _1094 * 0.5;
    float _1098 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1100 = fma(_1096, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1098);
    bool _1102 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1104 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1106 = _1102 || _1104;
    bool _1108 = isnan(0.5);
    bool _1110 = _1106 || _1108;
    float _1112 = 1.0 / _1100;
    if (_1110)
    {
        _875 = 1.0;
    }
    float _1114 = _875;
    float _1116 = _1014 * 2.0;
    float _1118 = _996 * 2.0;
    float _1120 = _996 * _996;
    float _1122 = _1008 * _1008;
    float _1124 = _1008 * _1116;
    float _1126 = _996 * _1116;
    float _1128 = fma(_1120, -2.0, 1.0);
    float _1130 = _1002 * _1002;
    float _1132 = -_1124;
    float _1134 = fma(_1002, _1118, _1132);
    float _1136 = fma(_1002, _1118, _1124);
    float _1138 = _1002 * 2.0;
    float _1140 = _1002 * _1116;
    float _1142 = fma(_1122, -2.0, _1128);
    float _1144 = fma(_1130, -2.0, 1.0);
    float _1146 = -_1126;
    float _1148 = fma(_1008, _1138, _1146);
    float _1150 = fma(_1008, _1138, _1126);
    float _1152 = fma(_1008, _1118, _1140);
    float _1154 = _1090 * _1134;
    float _1156 = _1090 * _1142;
    float _1158 = -_1140;
    float _1160 = fma(_1008, _1118, _1158);
    float _1162 = fma(_1122, -2.0, _1144);
    float _1164 = _1090 * _1150;
    float _1166 = fma(_1130, -2.0, _1128);
    float _1168 = fma(_1088, _1136, _1156);
    float _1170 = fma(_1088, _1162, _1154);
    float _1172 = fma(_1088, _1160, _1164);
    float _1174 = fma(_1092, _1148, _1168);
    float _1176 = fma(_1092, _1152, _1170);
    float _1178 = fma(_1092, _1166, _1172);
    float _1180 = _667 + _1174;
    float _1182 = _621 + _1176;
    float _1184 = _623 + _1178;
    float _1186 = _1180;
    float _1188 = _1182;
    float _1190 = _1184;
    float _1192 = _1178;
    float _1194 = _1112;
    float _1196 = _1114;
    if (!_1070)
    {
        float _1198 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1200 = _667 + _1198;
        float _1202 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1204 = _621 + _1202;
        float _1206 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1208 = _1200 * _1200;
        float _1210 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1212 = _623 + _1210;
        float _1214 = fma(_1204, _1204, _1208);
        float _1216 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1218 = fma(_1212, _1212, _1214);
        float _1220 = sqrt(_1218);
        float _1222 = _1206 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1224 = precise::min(_1220, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1226 = _1224 * _1216;
        float _1228 = _1222 * _1226;
        float _1230 = fma(_1174, _1228, _667);
        float _1232 = fma(_1176, _1228, _621);
        float _1234 = fma(_1178, _1228, _623);
        _1186 = _1230;
        _1188 = _1232;
        _1190 = _1234;
    }
    float _1236 = _1186;
    float _1238 = _1188;
    float _1240 = _1190;
    if (_1110)
    {
        _1192 = 1.0;
    }
    float _1242 = _1192;
    float _1244 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1246 = _1112 * _1244;
    float _1248 = _1242;
    if (!_1110)
    {
        float _1250 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1252 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1254 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1252;
        float _1256 = _1250 * 0.15915493667125701904296875;
        float _1258 = _1256 * 6.283185482025146484375;
        float _1260 = cos(_1258);
        float _1262 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1264 = _1262 * 0.15915493667125701904296875;
        float _1266 = _1256 * 6.283185482025146484375;
        float _1268 = sin(_1266);
        float _1270 = 1.0 / _1260;
        float _1272 = _1264 * 6.283185482025146484375;
        float _1274 = cos(_1272);
        float _1276 = _1268 * _1270;
        float _1278 = _1264 * 6.283185482025146484375;
        float _1280 = sin(_1278);
        float _1282 = _1274 * _1276;
        float _1284 = 1.0 / _1254;
        float _1286 = 1.0 / _1282;
        float _1288 = _1280 * _1286;
        float _1290 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1292 = fma(_1246, _1288, _1290);
        float _1294 = _1292 * _1284;
        float _1296 = precise::clamp(_1294, 0.0, 1.0);
        _1194 = _1264;
        _1196 = _1296;
    }
    float _1298 = _1194;
    float _1300 = _1196;
    float _1302 = _1298;
    if (!_1110)
    {
        float _1304 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1306 = _1304 * 0.15915493667125701904296875;
        float _1308 = _1306 * 6.283185482025146484375;
        float _1310 = cos(_1308);
        float _1312 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1314 = _1312 * 0.15915493667125701904296875;
        float _1316 = _1306 * 6.283185482025146484375;
        float _1318 = sin(_1316);
        float _1320 = 1.0 / _1310;
        float _1322 = _1314 * 6.283185482025146484375;
        float _1324 = cos(_1322);
        float _1326 = _1318 * _1320;
        float _1328 = _1314 * 6.283185482025146484375;
        float _1330 = sin(_1328);
        float _1332 = _1324 * _1326;
        float _1334 = 1.0 / _1332;
        float _1336 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1338 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1336;
        float _1340 = 1.0 / _1338;
        float _1342 = _1330 * _1334;
        float _1344 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1346 = fma(_1246, _1342, _1344);
        float _1348 = _1346 * _1340;
        float _1350 = precise::clamp(_1348, 0.0, 1.0);
        float _1352 = -_1350;
        float _1354 = _1352 + 1.0;
        _1248 = _1354;
    }
    float _1356 = _1248;
    float _1358 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1360 = _1236 + _1358;
    float _1362 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1364 = _1238 + _1362;
    float _1366 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1368 = _1240 + _1366;
    float _1370 = _1236 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1372 = _1360 * _1360;
    float _1374 = fma(_1364, _1364, _1372);
    float _1376 = fma(_1368, _1368, _1374);
    float _1378 = rsqrt(_1376);
    float _1380 = sqrt(_1376);
    float _1382 = _1378 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1384 = _1364 * _1382;
    float _1386 = _1368 * _1382;
    float _1388 = _1384 * _1384;
    float _1390 = _1386 * _1386;
    float _1392 = _1388 + _1390;
    float _1394 = sqrt(_1392);
    bool _1396 = _1394 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1398 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1400 = _1394 + _1398;
    float _1402 = _1368;
    float _1404 = _1392;
    float _1406 = _1400;
    float _1408 = _1360;
    if (_1396)
    {
        float _1410 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1402 = _1410;
    }
    float _1412 = _1402;
    if (_1396)
    {
        float _1414 = rsqrt(_1392);
        _1404 = _1414;
    }
    float _1416 = _1404;
    float _1418 = _1416;
    if (_1396)
    {
        float _1420 = _1400 * _1412;
        _1406 = _1420;
    }
    float _1422 = _1406;
    if (_1396)
    {
        float _1424 = _1422 * 0.15915493667125701904296875;
        _1302 = _1424;
    }
    float _1426 = _1302;
    float _1428 = _1378;
    float _1430 = _1426;
    if (_1396)
    {
        float _1432 = _1426 * 6.283185482025146484375;
        float _1434 = sin(_1432);
        _1428 = _1434;
    }
    float _1436 = _1428;
    float _1438 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1440 = precise::max(0.0, _1438);
    float _1442 = _1412;
    float _1444 = _1440;
    if (_1396)
    {
        float _1446 = _1426 * 6.283185482025146484375;
        float _1448 = cos(_1446);
        _1442 = _1448;
    }
    float _1450 = _1442;
    float _1452 = -_1382;
    float _1454 = -_1440;
    float _1456 = fma(_1360, _1452, _1454);
    float _1458 = _1456;
    if (_1396)
    {
        float _1460 = _1456 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1408 = _1460;
    }
    float _1462 = _1408;
    if (!_1396)
    {
        _1430 = _1384;
    }
    float _1464 = _1430;
    float _1466 = _1436;
    float _1468 = _1464;
    if (_1396)
    {
        float _1470 = fma(_1436, _1462, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1466 = _1470;
    }
    float _1472 = _1466;
    float _1474 = _1472;
    float _1476 = _1450;
    if (_1396)
    {
        float _1478 = _1450 + (-1.0);
        _1444 = _1478;
    }
    float _1480 = _1444;
    float _1482 = _1480;
    if (_1396)
    {
        float _1484 = _1416 * _1472;
        _309 = _1484;
    }
    float _1486 = _309;
    if (!_1396)
    {
        _1418 = _1386;
    }
    float _1488 = _1418;
    float _1490 = _1488;
    if (_1396)
    {
        float _1492 = _1480 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1482 = _1492;
    }
    float _1494 = _1482;
    if (_1396)
    {
        float _1496 = _1384 * _1486;
        _1468 = _1496;
    }
    float _1498 = _1468;
    if (_1396)
    {
        float _1500 = _1386 * _1486;
        _1490 = _1500;
    }
    float _1502 = _1490;
    if (!_1396)
    {
        _1474 = _1390;
    }
    float _1504 = _1474;
    float _1506 = _1504;
    if (_1396)
    {
        float _1508 = fma(_1456, _1450, _1494);
        _1458 = _1508;
    }
    float _1510 = _1458;
    if (!_1396)
    {
        _1476 = _1388;
    }
    float _1512 = _1476;
    float _1514 = _1512;
    if (_1396)
    {
        float _1516 = _1498 * _1498;
        _1514 = _1516;
    }
    float _1518 = _1514;
    if (_1396)
    {
        float _1520 = _1502 * _1502;
        _1506 = _1520;
    }
    float _1522 = _1506;
    float _1524 = _1236 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1526 = fma(_1510, _1510, _1518);
    float _1528 = fma(_1238, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1370);
    float _1530 = _1526 + _1522;
    float _1532 = fma(_1238, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1524);
    float _1534 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1536 = fma(_1380, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1534);
    float _1538 = precise::clamp(_1536, 0.0, 1.0);
    float _1540 = rsqrt(_1530);
    float _1542 = fma(_1240, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1532);
    float _1544 = -_1538;
    float _1546 = _1544 + 1.0;
    float _1548 = fma(_621, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1550 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1552 = _1542 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1554 = fma(_623, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1556 = _1236 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1558 = floor(_1548);
    float _1560 = _1552 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1562 = _1236 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1564 = fma(_1240, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1528);
    float _1566 = -_1560;
    float _1568 = fma(_1566, _1550, 1.0);
    float _1570 = fma(_1238, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1556);
    float _1572 = _1540 * _1498;
    float _1574 = _1540 * _1510;
    float _1576 = _1540 * _1502;
    float _1578 = fma(_1238, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1562);
    float _1580 = fma(_1240, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1570);
    float _1582 = abs(_1546);
    float _1584 = log2(_1582);
    float _1586 = _1572 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1588 = fma(_1240, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1578);
    float _1590 = _1580 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1592 = -_1558;
    float _1594 = _1548 + _1592;
    float _1596 = -_1586;
    float _1598 = fma(_1574, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1596);
    float _1600 = _1588 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1602 = _1590 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1604 = floor(_1554);
    float _1606 = -_1576;
    float _1608 = fma(_1606, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1598);
    float _1610 = _1564 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1612 = fma(_1600, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1602);
    float _1614 = fma(_1608, -0.5, 0.5);
    float _1616 = fma(_1608, 0.5, 0.5);
    float _1618 = fma(_1552, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1612);
    float _1620 = _1584 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1622 = log2(_1568);
    float _1624 = _1590 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1626 = fma(_1610, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1618);
    float _1628 = _1574 + 1.0;
    float _1630 = fma(_1600, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1624);
    float _1632 = -_1604;
    float _1634 = _1554 + _1632;
    float _1636 = exp2(_1620);
    float _1638 = fma(_1616, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1640 = fma(_1552, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1630);
    float2 _4744 = float2(_1594, _1634);
    float _1642 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4744, float2(0.0), isnan(_4744)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4744, float2(0.0), isnan(_4744)), level(0.0)).x;
    float _1644 = fma(_1616, _1638, -0.212114393711090087890625);
    float _1646 = fma(_1610, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1640);
    float _1648 = 1.0 / _1626;
    float _1650 = _1590 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1652 = _1622 * 0.693147182464599609375;
    float _1654 = fma(_1616, _1644, 1.570728778839111328125);
    float _1656 = fma(_1600, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1650);
    float _1658 = _1652 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1660 = sqrt(_1614);
    float _1662 = fma(_1552, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1656);
    float _1664 = -_1574;
    float _1666 = fma(_1636, _1628, _1664);
    float _1668 = fma(_1610, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1662);
    float _1670 = fma(_1666, 0.5, 0.5);
    float _1672 = _1646 * _1648;
    float _1674 = _1668 * _1648;
    float _1676 = fma(_1672, 0.5, 0.5);
    float _1678 = fma(_1674, -0.5, 0.5);
    float _1680 = _1660 * 0.636619746685028076171875;
    float _1682 = -_1654;
    float _1684 = fma(_1680, _1682, 1.0);
    float3 _4824 = float3(_1676, _1678, _1658);
    float _1686 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4824, float3(0.0), isnan(_4824)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4824, float3(0.0), isnan(_4824)), level(0.0)).x;
    float3 _4835 = float3(_1676, _1678, _1658);
    float4 _1689 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4835, float3(0.0), isnan(_4835)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4835, float3(0.0), isnan(_4835)), level(0.0)).xyzw;
    float _1691 = _1689.x;
    float _1693 = _1689.y;
    float _1695 = _1689.z;
    float _1697 = _1689.w;
    float2 _4851 = float2(_1684, _1670);
    float3 _1701 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4851, float2(0.0), isnan(_4851)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4851, float2(0.0), isnan(_4851)), level(0.0)).xyz;
    float _1703 = _1701.x;
    float _1705 = _1701.y;
    float _1707 = _1701.z;
    float _1709 = abs(_1246);
    float _1711 = log2(_1709);
    bool _1713 = 0.0 != (*spvDescriptorSet0.vp_c11)._m0[20].z;
    bool _1715 = isnan(0.0);
    bool _1717 = _1713 || _1715;
    bool _1719 = isnan((*spvDescriptorSet0.vp_c11)._m0[20].z);
    bool _1721 = _1717 || _1719;
    float _1723 = _1590 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1725 = _919 * _1134;
    float _1727 = fma(_1600, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1723);
    float _1729 = (*spvDescriptorSet0.vp_c11)._m0[20].z * 0.300000011920928955078125;
    float _1731 = _919 * _1142;
    float _1733 = fma(_1552, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1727);
    float _1735 = fma(_913, _1162, _1725);
    float _1737 = _1711 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1739 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1741 = fma(_1729, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1739);
    float _1743 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1745 = fma(_1729, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1743);
    float _1747 = _1678;
    float _1749 = _1741;
    if (_1721)
    {
        float _1751 = (*spvDescriptorSet0.vp_c11)._m0[20].z * 0.20000000298023223876953125;
        _1747 = _1751;
    }
    float _1753 = _1747;
    float _1755 = fma((*spvDescriptorSet0.vp_c11)._m0[20].z, 0.5, _1741);
    float _1757 = exp2(_1737);
    float _1759 = fma((*spvDescriptorSet0.vp_c11)._m0[20].z, 0.5, _1745);
    if (_1721)
    {
        float _1761 = precise::min(_1753, 20.0);
        _1749 = _1761;
    }
    float _1763 = _1749;
    float _1765 = _621 + _1755;
    float _1767 = _623 + _1759;
    float _1769 = -_1765;
    float _1771 = _1769 + (*spvDescriptorSet0.vp_c11)._m0[20].z;
    float _1773 = (*spvDescriptorSet0.vp_c11)._m0[20].z;
    if (_1721)
    {
        float _1775 = 1.0 / _1763;
        _1773 = _1775;
    }
    float _1777 = _1773;
    float _1779 = -_1767;
    float _1781 = _1779 + (*spvDescriptorSet0.vp_c11)._m0[20].z;
    float _1783 = precise::min(_1765, _1771);
    float _1785 = _919 * _1150;
    float _1787 = precise::min(_1767, _1781);
    float _1789 = _1584 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1791 = fma(_1757, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1793 = precise::clamp(_1791, 0.0, 1.0);
    float _1795 = fma(_1610, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1733);
    float _1797 = precise::min(_1783, _1787);
    float _1799 = in.m_88.x;
    float _1801 = fma(_1793, -2.0, 3.0);
    float _1803 = _1793 * _1793;
    float _1805 = _1781;
    if (!_1721)
    {
        _1805 = 1.0;
    }
    float _1807 = _1805;
    float _1809 = exp2(_1789);
    float _1811 = _1807;
    if (_1721)
    {
        float _1813 = _1797 * _1777;
        float _1815 = precise::clamp(_1813, 0.0, 1.0);
        _1811 = _1815;
    }
    float _1817 = _1811;
    float _1819 = _1803 * _1801;
    bool _1821 = _1246 <= 8000.0;
    bool _1823 = isnan(_1246);
    bool _1825 = _1821 || _1823;
    bool _1827 = isnan(8000.0);
    bool _1829 = _1825 || _1827;
    float _1831 = float(_1829);
    float _1833 = _1795 + _1626;
    float _1835 = -_1819;
    float _1837 = _1835 + 1.0;
    bool _1839 = _1380 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1841 = isnan(_1380);
    bool _1843 = _1839 || _1841;
    bool _1845 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1847 = _1843 || _1845;
    float _1849 = _1833 * 0.5;
    float _1851 = fma(_1837, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1819);
    float _1853 = fma(_913, _1136, _1731);
    float _1855 = fma(_913, _1160, _1785);
    float _1857 = fma(_911, _1152, _1735);
    float _1859 = _1831 * _1851;
    float _1861 = fma(_911, _1148, _1853);
    float _1863 = fma(_911, _1166, _1855);
    float _1865 = _1859 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _1867 = -_1809;
    float _1869 = _1867 + 1.0;
    out.m_90.z = _1849;
    out.m_90.w = _1626;
    float _1871 = _1869 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_92.x = _1857;
    out.m_92.y = _1861;
    out.m_92.z = _1863;
    out.gl_Position.x = _1646;
    out.gl_Position.y = _1668;
    out.gl_Position.z = _1795;
    out.gl_Position.w = _1626;
    float _1873 = -_1642;
    float _1875 = _1873 + 1.0;
    float _1877 = _1875 * _1865;
    float _1879 = precise::clamp(_1877, 0.0, 1.0);
    float _1881 = -_1879;
    float _1883 = fma(_1881, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _1885 = -_1871;
    float _1887 = _1885 + 1.0;
    float _1889 = _1883 * _1799;
    float _1891 = _1889 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_94.x = _1891;
    float _1893 = _1871 * _1686;
    float _1895 = _1697 * _1887;
    float _1897 = _1887;
    float _1899 = _1697;
    float _1901 = _1817;
    float _1903 = _1693;
    if (!_1847)
    {
        _1897 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1905 = _1897;
    float _1907 = _1697 * _1893;
    float _1909 = _1707 * _1893;
    float _1911 = fma(_1703, _1907, _1691);
    float _1913 = _1300 * _1356;
    float _1915 = fma(_1705, _1907, _1693);
    float _1917 = fma(_1697, _1909, _1695);
    float _1919 = _1911;
    float _1921 = _1905;
    float _1923 = _1905;
    if (!_1847)
    {
        _1899 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1925 = _1899;
    float _1927 = _1913 * _1817;
    float _1929 = _1927;
    float _1931 = _1925;
    float _1933 = _1925;
    if (!_1847)
    {
        _1901 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1935 = _1901;
    out.m_96.x = _1911;
    out.m_96.y = _1915;
    out.m_96.z = _1917;
    out.m_96.w = _1895;
    float _1937 = _1927 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1939 = _1935;
    float _1941 = _1935;
    if (!_1847)
    {
        _1903 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1943 = _1903;
    float _1945 = _1943;
    float _1947 = _1943;
    if (!_1847)
    {
        _1929 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1949 = _1929;
    float _1951 = _1949;
    float _1953 = _1949;
    if (!_1847)
    {
        _1919 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1955 = _1919;
    bool _1957 = !_1847;
    float _1959 = _1955;
    float _1961 = _1955;
    if (!_1957)
    {
        bool _1963 = _1380 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1965 = isnan(_1380);
        bool _1967 = _1963 || _1965;
        bool _1969 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1971 = _1967 || _1969;
        if (!_1971)
        {
            float _1973 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1975 = _1380 + _1973;
            float _1977 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1979 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1977;
            float _1981 = 1.0 / _1979;
            float _1983 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1985 = _1983 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1987 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1989 = _1987 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1991 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1993 = _1991 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1995 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1997 = _1995 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1999 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2001 = _1999 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2003 = _1975 * _1981;
            float _2005 = precise::clamp(_2003, 0.0, 1.0);
            float _2007 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2009 = _2007 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2011 = fma(_2005, _1985, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2013 = fma(_2005, _2009, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2015 = fma(_2005, _1989, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2017 = fma(_2005, _1993, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2019 = fma(_2005, _1997, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2021 = fma(_2005, _2001, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1933 = _2011;
            _1953 = _2019;
            _1923 = _2013;
            _1947 = _2017;
            _1941 = _2015;
            _1961 = _2021;
            _2023 = true;
        }
        else
        {
            bool _2025 = _1380 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2027 = isnan(_1380);
            bool _2029 = _2025 || _2027;
            bool _2031 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2033 = _2029 || _2031;
            if (!_2033)
            {
                _1921 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2035 = _1921;
            _1923 = _2035;
            if (!_2033)
            {
                _1931 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2037 = _1931;
            _1933 = _2037;
            if (!_2033)
            {
                _1939 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2039 = _1939;
            _1941 = _2039;
            if (!_2033)
            {
                _1945 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2041 = _1945;
            _1947 = _2041;
            if (!_2033)
            {
                _1951 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2043 = _1951;
            _1953 = _2043;
            if (!_2033)
            {
                _1959 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2045 = _1959;
            bool _2047 = !_2033;
            _1961 = _2045;
            if (!_2047)
            {
                bool _2049 = _1380 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2051 = isnan(_1380);
                bool _2053 = _2049 || _2051;
                bool _2055 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2057 = _2053 || _2055;
                if (!_2057)
                {
                    float _2059 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2061 = _1380 + _2059;
                    float _2063 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2065 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2063;
                    float _2067 = 1.0 / _2065;
                    float _2069 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2071 = _2069 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2073 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2075 = _2073 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2077 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2079 = _2077 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2081 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2083 = _2081 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2085 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2087 = _2085 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2089 = _2061 * _2067;
                    float _2091 = precise::clamp(_2089, 0.0, 1.0);
                    float _2093 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2095 = _2093 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2097 = fma(_2091, _2071, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2099 = fma(_2091, _2095, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2101 = fma(_2091, _2075, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2103 = fma(_2091, _2079, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2105 = fma(_2091, _2083, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2107 = fma(_2091, _2087, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1933 = _2097;
                    _1953 = _2105;
                    _1923 = _2099;
                    _1947 = _2103;
                    _1941 = _2101;
                    _1961 = _2107;
                    _2023 = true;
                }
                else
                {
                    _1933 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1953 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1923 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1947 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1941 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1961 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2023 = false;
    float _2109 = _1933;
    float _2111 = _1953;
    float _2113 = _1923;
    float _2115 = _1947;
    float _2117 = _1941;
    float _2119 = _1961;
    float _2121 = fma(_1861, -0.5, 0.5);
    float _2123 = precise::clamp(_2121, 0.0, 1.0);
    float _2125 = -_2109;
    float _2127 = _2125 + _2111;
    float _2129 = -_2113;
    float _2131 = _2129 + _2115;
    out.m_98.x = 0.0;
    float _2133 = fma(_2123, _2127, _2109);
    float _2135 = -_2117;
    float _2137 = _2135 + _2119;
    float _2139 = fma(_2123, _2131, _2113);
    float _2141 = _2133 * 0.586610972881317138671875;
    bool _2143 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2145 = fma(_2123, _2137, _2117);
    float _2147 = _1937 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2149 = fma(_2139, 0.298911988735198974609375, _2141);
    bool _2151 = _1300 > 0.0;
    bool _2153 = isnan(_1300);
    bool _2155 = _2151 || _2153;
    bool _2157 = isnan(0.0);
    bool _2159 = _2155 || _2157;
    float _2161 = fma(_2145, 0.114477999508380889892578125, _2149);
    out.m_58.x = _2147;
    bool _2163 = _1356 <= 0.0;
    bool _2165 = !_2159;
    bool _2167 = _2163 || _2165;
    float _2169 = -_2161;
    float _2171 = _2139 + _2169;
    float _2173 = -_2161;
    float _2175 = _2133 + _2173;
    float _2177 = -_2161;
    float _2179 = _2145 + _2177;
    float _2181 = fma(_2171, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2161);
    float _2183 = fma(_2175, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2161);
    float _2185 = fma(_2179, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2161);
    bool _2187 = !_2143;
    if (!_2187)
    {
        float _2189 = -_1236;
        float _2191 = _2189 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2193 = -_1238;
        float _2195 = _2193 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2197 = -_1240;
        float _2199 = _2197 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2201 = _2191 * _2191;
        float _2203 = fma(_2195, _2195, _2201);
        float _2205 = fma(_2199, _2199, _2203);
        float _2207 = sqrt(_2205);
        float _2209 = rsqrt(_2205);
        float _2211 = -_2207;
        float _2213 = _2211 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2215 = _2213 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2217 = precise::clamp(_2215, 0.0, 1.0);
        float _2219 = _2195 * _2209;
        float _2221 = _2191 * _2209;
        float _2223 = abs(_2217);
        float _2225 = log2(_2223);
        float _2227 = _2199 * _2209;
        float _2229 = _2219 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2231 = _1861 * _2221;
        float _2233 = -_2221;
        float _2235 = -_2229;
        float _2237 = fma(_2233, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2235);
        float _2239 = fma(_1857, _2219, _2231);
        float _2241 = -_2227;
        float _2243 = fma(_2241, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2237);
        float _2245 = fma(_1863, _2227, _2239);
        float _2247 = precise::clamp(_2245, 0.0, 1.0);
        float _2249 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2251 = _2243 + _2249;
        float _2253 = _2225 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2255 = _2251 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2257 = precise::clamp(_2255, 0.0, 1.0);
        float _2259 = exp2(_2253);
        float _2261 = _2259 * _2257;
        float _2263 = _2247 * _2261;
        float _2265 = _2263 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2267 = _2263 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2269 = _2263 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_98.x = _2265;
        out.m_98.y = _2267;
        out.m_98.z = _2269;
    }
    out.m_100.x = _2181;
    out.m_100.y = _2183;
    out.m_100.z = _2185;
    if (!_2167)
    {
        return out;
    }
    out.m_58.x = 0.0;
    float _2271 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2271;
    return out;
}


struct dm_geometry_capture { device uint* dst; uint4 info; uint stride; short slot[144]; };
static inline void dm_cw(constant dm_geometry_capture& g, device uint* p, uint k, uint v) { short s = g.slot[k]; if (s >= 0) p[s] = v; }
vertex void main0_gs(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint dm_vid [[vertex_id]], uint dm_iid [[instance_id]], constant dm_geometry_capture& dm_gs [[buffer(13)]])
{
    uint4 dm_ci = dm_gs.info; device uint* dm_capture = dm_gs.dst;
    if (dm_vid - dm_ci.x >= dm_ci.y || dm_iid - dm_ci.z >= dm_ci.w) return;
    device uint* dm_p = dm_capture + ((ulong(dm_iid - dm_ci.z) * dm_ci.y + dm_vid - dm_ci.x) * dm_gs.stride);

    main0_out out = {};
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_100 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2023 = false;
    bool _953 = false;
    bool _355 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _114 = in.m_55.w;
    float _116 = trunc(_114);
    int _119 = int(_116);
    bool _123 = _119 >= 1;
    float _125 = 0.0;
    if (!_123)
    {
        _125 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _127 = _125;
    if (!_123)
    {
        out.m_58.x = 0.0;
    }
    int _129 = 0;
    if (!_123)
    {
        float _131 = _127 * 5.0;
        _129 = as_type<int>(_131);
    }
    int _133 = _129;
    int _135 = _133;
    if (!_123)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2327 = as_type<float>(_133);
        out.gl_Position.z = _2327;
    }
    if (!_123)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _137 = in.m_60.w;
    bool _139 = _137 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _141 = isnan(_137);
    bool _143 = _139 || _141;
    bool _145 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _147 = _143 || _145;
    float _149 = -_137;
    float _151 = _149 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _153 = 0.0;
    if (_147)
    {
        float _155 = float(_119);
        _153 = _155;
    }
    float _157 = _153;
    bool _159 = _151 >= _157;
    bool _161 = !_147;
    bool _163 = _159 || _161;
    float _165 = 0.0;
    if (_163)
    {
        _165 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _167 = _165;
    if (_163)
    {
        out.m_58.x = 0.0;
    }
    if (_163)
    {
        float _169 = _167 * 5.0;
        _135 = as_type<int>(_169);
    }
    int _171 = _135;
    if (_163)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2395 = as_type<float>(_171);
        out.gl_Position.z = _2395;
    }
    if (_163)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _173 = in.m_62.x;
    float _175 = in.m_62.y;
    float _177 = in.m_62.z;
    float _179 = in.m_64.x;
    float _181 = in.m_64.y;
    float _183 = in.m_64.z;
    float _185 = in.m_66.x;
    float _187 = in.m_66.y;
    float _189 = in.m_66.z;
    float _191 = _173 * _173;
    float _193 = _175 * _175;
    float _195 = _177 * _177;
    float _197 = fma(_179, _179, _191);
    float _199 = fma(_181, _181, _193);
    float _201 = fma(_183, _183, _195);
    float _203 = fma(_185, _185, _197);
    float _205 = fma(_187, _187, _199);
    float _207 = fma(_189, _189, _201);
    float _209 = sqrt(_203);
    float _211 = sqrt(_205);
    float _213 = sqrt(_207);
    bool _215 = _209 > 0.0;
    bool _217 = _211 > 0.0;
    float _219 = _211;
    float _221 = _173;
    if (_215)
    {
        float _223 = rsqrt(_203);
        _219 = _223;
    }
    float _225 = _219;
    float _227 = 0.0;
    if (!_215)
    {
        _227 = 0.0;
    }
    float _229 = _227;
    bool _231 = _213 > 0.0;
    float _233 = 0.0;
    float _235 = _229;
    if (!_215)
    {
        _233 = 0.0;
    }
    float _237 = _233;
    float _239 = 0.0;
    float _241 = _237;
    if (!_215)
    {
        _239 = 0.0;
    }
    float _243 = _239;
    float _245 = _213;
    float _247 = _243;
    if (_217)
    {
        float _249 = rsqrt(_205);
        _245 = _249;
    }
    float _251 = _245;
    float _253 = 0.0;
    if (!_217)
    {
        _253 = 0.0;
    }
    float _255 = _253;
    float _257 = 0.0;
    float _259 = _255;
    if (!_217)
    {
        _257 = 0.0;
    }
    float _261 = _257;
    float _263 = 0.0;
    float _265 = _261;
    if (!_217)
    {
        _263 = 0.0;
    }
    float _267 = _263;
    float _269 = 0.0;
    float _271 = _267;
    if (_231)
    {
        float _273 = rsqrt(_207);
        _269 = _273;
    }
    float _275 = _269;
    if (_215)
    {
        float _277 = _225 * _179;
        _235 = _277;
    }
    float _279 = _235;
    if (_215)
    {
        float _281 = _225 * _173;
        _241 = _281;
    }
    float _283 = _241;
    if (_215)
    {
        float _285 = _225 * _185;
        _247 = _285;
    }
    float _287 = _247;
    bool _289 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _291 = 0.0;
    if (!_231)
    {
        _291 = 0.0;
    }
    float _293 = _291;
    float _295 = 0.0;
    float _297 = _293;
    if (!_231)
    {
        _295 = 0.0;
    }
    float _299 = _295;
    float _301 = _299;
    if (_217)
    {
        float _303 = _251 * _181;
        _259 = _303;
    }
    float _305 = _259;
    float _307 = 0.0;
    float _309 = _305;
    if (!_231)
    {
        _307 = 0.0;
    }
    float _311 = _307;
    float _313 = _311;
    if (_217)
    {
        float _315 = _251 * _175;
        _265 = _315;
    }
    float _317 = _265;
    if (_217)
    {
        float _319 = _251 * _187;
        _271 = _319;
    }
    float _321 = _271;
    if (_231)
    {
        float _323 = _275 * _183;
        _297 = _323;
    }
    float _325 = _297;
    if (_231)
    {
        float _327 = _275 * _177;
        _301 = _327;
    }
    float _329 = _301;
    if (_231)
    {
        float _331 = _275 * _189;
        _313 = _331;
    }
    float _333 = _313;
    bool _335 = !_289;
    float _353;
    if (!_335)
    {
        float _337 = in.m_68.x;
        float _339 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _341 = _337 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _343 = fma(_341, (*spvDescriptorSet0.vp_c9)._m0[12].x, _151);
        float _345 = _343 * _339;
        float _347 = floor(_345);
        float _349 = -_347;
        float _351 = _345 + _349;
        _353 = _351;
        _355 = true;
    }
    else
    {
        float _357 = float(_119);
        float _359 = 1.0 / _357;
        float _361 = _151 * _359;
        _353 = _361;
    }
    _355 = false;
    float _363 = _353;
    float _365 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _367 = _363 + _365;
    float _369 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _371 = _363 + _369;
    bool _373 = _363 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _375 = isnan(_363);
    bool _377 = _373 || _375;
    bool _379 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _381 = _377 || _379;
    float _383 = float(_381);
    float _385 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _387 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _385;
    float _389 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _391 = _389 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _393 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _395 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _393;
    float _397 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _399 = _363 + _397;
    float _401 = 1.0 / _391;
    float _403 = -_383;
    float _405 = _403 + 1.0;
    bool _407 = _363 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _409 = isnan(_363);
    bool _411 = _407 || _409;
    bool _413 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _415 = _411 || _413;
    float _417 = float(_415);
    bool _419 = _363 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _421 = isnan(_363);
    bool _423 = _419 || _421;
    bool _425 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _427 = _423 || _425;
    float _429 = float(_427);
    float _431 = 1.0 / _387;
    float _433 = -_417;
    float _435 = _433 + 1.0;
    float _437 = _417 * _405;
    float _439 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _441 = _439 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _443 = _429 * _435;
    float _445 = -_429;
    float _447 = _445 + 1.0;
    float _449 = 1.0 / _395;
    float _451 = _367 * _401;
    bool _453 = _363 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _455 = isnan(_363);
    bool _457 = _453 || _455;
    bool _459 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _461 = _457 || _459;
    float _463 = float(_461);
    float _465 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _467 = _465 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _469 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _471 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _469;
    float _473 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _475 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _473;
    float _477 = -_463;
    float _479 = _477 + 1.0;
    float _481 = _371 * _431;
    float _483 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _485 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _483;
    float _487 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _489 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _487;
    float _491 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _493 = _491 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _495 = _383 * _479;
    float _497 = fma(_485, _481, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _499 = fma(_489, _481, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _501 = fma(_493, _451, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _503 = _399 * _449;
    float _505 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _507 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _505;
    float _509 = fma(_441, _451, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _511 = _497 * _443;
    float _513 = _499 * _443;
    float _515 = fma(_507, _481, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _517 = fma(_467, _451, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _519 = in.m_55.x;
    float _521 = in.m_55.y;
    float _523 = in.m_55.z;
    float _525 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _527 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _525;
    float _529 = _515 * _443;
    float _531 = fma(_447, (*spvDescriptorSet0.vp_c9)._m0[143].y, _513);
    float _533 = in.m_70.x;
    float _535 = in.m_70.y;
    float _537 = in.m_70.z;
    float _539 = fma(_471, _503, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _541 = fma(_475, _503, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _543 = fma(_527, _503, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _545 = in.m_72.x;
    float _547 = in.m_72.y;
    float _549 = in.m_72.z;
    float _551 = fma(_447, (*spvDescriptorSet0.vp_c9)._m0[143].x, _511);
    float _553 = fma(_509, _437, _531);
    float _555 = fma(_447, (*spvDescriptorSet0.vp_c9)._m0[143].z, _529);
    float _557 = fma(_517, _437, _551);
    float _559 = fma(_541, _495, _553);
    float _561 = fma(_501, _437, _555);
    float _563 = fma(_539, _495, _557);
    float _565 = fma(_463, (*spvDescriptorSet0.vp_c9)._m0[146].y, _559);
    float _567 = fma(_543, _495, _561);
    float _569 = fma(_463, (*spvDescriptorSet0.vp_c9)._m0[146].x, _563);
    float _571 = fma(_463, (*spvDescriptorSet0.vp_c9)._m0[146].z, _567);
    float _573 = _187 * _521;
    float _575 = _181 * _521;
    float _577 = in.m_68.y;
    float _579 = _175 * _521;
    float _581 = _565 * _535;
    float _583 = fma(_185, _519, _573);
    float _585 = _569 * _533;
    float _587 = _571 * _537;
    float _589 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _547);
    float _591 = _581 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _593 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _545);
    float _595 = _585 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _597 = fma(_179, _519, _575);
    float _599 = _591 * _589;
    float _601 = _587 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _603 = _595 * _593;
    float _605 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _549);
    float _607 = _599 * _305;
    float _609 = _599 * _321;
    float _611 = fma(_183, _523, _597);
    float _613 = fma(_189, _523, _583);
    float _615 = _601 * _605;
    float _617 = fma(_603, _279, _607);
    float _619 = fma(_603, _287, _609);
    float _621 = _611 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _623 = _613 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _625 = fma(_615, _325, _617);
    float _627 = fma(_615, _333, _619);
    float _629 = in.m_74.x;
    float _631 = fma(_173, _519, _579);
    float _633 = _621 + _625;
    float _635 = _623 + _627;
    float _637 = in.m_74.y;
    float _639 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _641 = _633 + _639;
    float _643 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _645 = _635 + _643;
    int _647 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _649 = _647 != 0;
    float _651 = fma(_177, _523, _631);
    float _653 = _641 * _641;
    float _655 = _645 * _645;
    int _657 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _659 = _657 != 0;
    float _661 = _599 * _317;
    float _663 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _665 = _653 + _655;
    float _667 = _651 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _669 = fma(_603, _283, _661);
    bool _671 = _577 > 0.5;
    float _673 = _501;
    float _675 = _669;
    float _677 = _633;
    float _679 = _635;
    if (_649)
    {
        float _681 = in.m_68.x;
        _673 = _681;
    }
    float _683 = _673;
    float _685 = sqrt(_665);
    float _687 = fma(_615, _329, _669);
    float _689 = _629;
    if (_649)
    {
        _675 = _629;
    }
    float _691 = _675;
    float _693 = _667 + _687;
    float _695 = -_637;
    float _697 = _695 + 1.0;
    float _699 = _637;
    float _701 = _697;
    float _703 = _691;
    if (_659)
    {
        float _705 = _671 ? _697 : _637;
        _699 = _705;
    }
    float _707 = _699;
    bool _709 = _685 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    bool _711 = _683 > 0.5;
    bool _713 = _711 && _649;
    float _715 = _683;
    if (!_709)
    {
        _701 = _655;
    }
    float _717 = _701;
    float _719 = _717;
    if (!_709)
    {
        _221 = _653;
    }
    float _721 = _221;
    float _723 = _721;
    if (!_709)
    {
        _715 = _693;
    }
    float _725 = _715;
    bool _727 = !_709;
    float _729 = _725;
    if (!_727)
    {
        float _731 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _733 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _735 = _685 + _733;
        float _737 = _693 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _739 = rsqrt(_665);
        float _741 = _735 * _731;
        float _743 = _741 * 0.15915493667125701904296875;
        float _745 = _743 * 6.283185482025146484375;
        float _747 = sin(_745);
        float _749 = _743 * 6.283185482025146484375;
        float _751 = cos(_749);
        float _753 = fma(_747, _737, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _755 = _739 * _753;
        float _757 = _751 + (-1.0);
        float _759 = fma(_641, _755, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _761 = fma(_645, _755, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _763 = _757 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _765 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _767 = _759 + _765;
        float _769 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _771 = _761 + _769;
        float _773 = fma(_693, _751, _763);
        float _775 = _767 * _767;
        float _777 = _771 * _771;
        _729 = _773;
        _723 = _775;
        _719 = _777;
        _677 = _759;
        _679 = _761;
    }
    float _779 = _729;
    float _781 = _723;
    float _783 = _719;
    float _785 = _677;
    float _787 = _679;
    float _789 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _791 = _779 + _789;
    float _793 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    if (_713)
    {
        float _795 = -_691;
        float _797 = _795 + 1.0;
        _703 = _797;
    }
    float _799 = _703;
    float _801 = _707 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _803 = fma(_791, _791, _781);
    if (_649)
    {
        _689 = _799;
    }
    float _805 = _689;
    float _807 = _803 + _783;
    float _809 = in.m_76.x;
    float _811 = in.m_76.y;
    float _813 = in.m_76.z;
    float _815 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    bool _817 = _547 != 0.0;
    bool _819 = isnan(_547);
    bool _821 = _817 || _819;
    bool _823 = isnan(0.0);
    bool _825 = _821 || _823;
    float _827 = sqrt(_807);
    float _829 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    bool _831 = _545 == 0.0;
    bool _833 = !_825;
    bool _835 = _831 && _833;
    float _837 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _839 = _805 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _841 = _801 * _663;
    bool _843 = _549 == 0.0;
    bool _845 = _843 && _835;
    float _847 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _849 = _815 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _851 = _829 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _853 = _837 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _855 = _839 * _793;
    out.m_78.x = _849;
    out.m_78.y = _851;
    out.m_78.z = _853;
    out.m_78.w = _847;
    float _857 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    bool _859 = _827 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _861 = isnan(_827);
    bool _863 = _859 || _861;
    bool _865 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _867 = _863 || _865;
    out.m_80.x = _855;
    out.m_80.y = _841;
    float _869 = _811;
    float _871 = _809;
    float _873 = _813;
    float _875 = _841;
    if (!_845)
    {
        float _877 = fma(_547, (*spvDescriptorSet0.vp_c9)._m0[17].y, _811);
        _869 = _877;
    }
    float _879 = _869;
    float _881 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _883 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    if (!_845)
    {
        float _885 = fma(_545, (*spvDescriptorSet0.vp_c9)._m0[17].y, _809);
        _871 = _885;
    }
    float _887 = _871;
    float _889 = _305 * _879;
    float _891 = _317 * _879;
    float _893 = _321 * _879;
    float _895 = _857 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _897 = _881 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _899 = _883 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    if (!_845)
    {
        float _901 = fma(_549, (*spvDescriptorSet0.vp_c9)._m0[17].y, _813);
        _873 = _901;
    }
    float _903 = _873;
    float _905 = fma(_279, _887, _889);
    float _907 = fma(_283, _887, _891);
    float _909 = fma(_287, _887, _893);
    out.m_82.x = 1.0;
    out.m_82.y = 1.0;
    out.m_82.z = 1.0;
    float _911 = fma(_333, _903, _909);
    out.m_84.x = _895;
    out.m_84.y = _897;
    out.m_84.z = _899;
    float _913 = fma(_325, _903, _905);
    float _915 = _905;
    if (!_867)
    {
        _915 = 1.0;
    }
    float _917 = _915;
    float _919 = fma(_329, _903, _907);
    bool _921 = !_867;
    float _923 = _917;
    if (!_921)
    {
        bool _925 = _827 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _927 = isnan(_827);
        bool _929 = _925 || _927;
        bool _931 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _933 = _929 || _931;
        if (!_933)
        {
            float _935 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _937 = _827 + _935;
            float _939 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _941 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _939;
            float _943 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _945 = _943 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _947 = 1.0 / _941;
            float _949 = _937 * _947;
            float _951 = fma(_949, _945, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _923 = _951;
            _953 = true;
        }
        else
        {
            bool _955 = _827 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _957 = isnan(_827);
            bool _959 = _955 || _957;
            bool _961 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _963 = _959 || _961;
            if (!_963)
            {
                float _965 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _967 = _827 + _965;
                float _969 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _971 = _969 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _973 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _975 = _973 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _977 = 1.0 / _971;
                float _979 = _967 * _977;
                float _981 = fma(_979, _975, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _923 = _981;
                _953 = true;
            }
            else
            {
                _923 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _953 = false;
    float _983 = _923;
    float _985 = in.m_86.w;
    float _987 = trunc(_985);
    int _989 = int(_987);
    int _991 = _989 << 5;
    uint _994 = uint(int(uint(_991) >> uint(2)));
    packed_uint4 _dmw0 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_994)];
    float _996 = as_type<float>(_dmw0.x);
    int _998 = _991 + 4;
    uint _1000 = uint(int(uint(_998) >> uint(2)));
    float _1002 = as_type<float>(_dmw0.y);
    int _1004 = _991 + 8;
    uint _1006 = uint(int(uint(_1004) >> uint(2)));
    float _1008 = as_type<float>(_dmw0.z);
    int _1010 = _991 + 12;
    uint _1012 = uint(int(uint(_1010) >> uint(2)));
    float _1014 = as_type<float>(_dmw0.w);
    float _1016 = _667 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1018 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1020 = _785 + _1018;
    float _1022 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1024 = _779 + _1022;
    float _1026 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1028 = _787 + _1026;
    float _1030 = fma(_621, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1016);
    float _1032 = fma(_1020, _983, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1034 = fma(_1024, _983, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1036 = fma(_1028, _983, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1038 = fma(_623, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1030);
    float _1040 = _667 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1042 = -_621;
    float _1044 = _1042 + _1032;
    float _1046 = -_623;
    float _1048 = _1046 + _1036;
    float _1050 = _1038 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1052 = fma(_621, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1040);
    float _1054 = -_667;
    float _1056 = _1054 + _1034;
    float _1058 = 1.0 / _1050;
    float _1060 = fma(_623, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1052);
    bool _1062 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1064 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1066 = _1062 || _1064;
    bool _1068 = isnan(0.5);
    bool _1070 = _1066 || _1068;
    float _1072 = _1056 * _283;
    float _1074 = _1056 * _317;
    float _1076 = _1056 * _329;
    float _1078 = _1060 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1080 = fma(_1044, _279, _1072);
    float _1082 = fma(_1044, _305, _1074);
    float _1084 = fma(_1044, _325, _1076);
    float _1086 = _1078 + _1050;
    float _1088 = fma(_1048, _287, _1080);
    float _1090 = fma(_1048, _321, _1082);
    float _1092 = fma(_1048, _333, _1084);
    float _1094 = _1086 * _1058;
    float _1096 = _1094 * 0.5;
    float _1098 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1100 = fma(_1096, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1098);
    bool _1102 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1104 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1106 = _1102 || _1104;
    bool _1108 = isnan(0.5);
    bool _1110 = _1106 || _1108;
    float _1112 = 1.0 / _1100;
    if (_1110)
    {
        _875 = 1.0;
    }
    float _1114 = _875;
    float _1116 = _1014 * 2.0;
    float _1118 = _996 * 2.0;
    float _1120 = _996 * _996;
    float _1122 = _1008 * _1008;
    float _1124 = _1008 * _1116;
    float _1126 = _996 * _1116;
    float _1128 = fma(_1120, -2.0, 1.0);
    float _1130 = _1002 * _1002;
    float _1132 = -_1124;
    float _1134 = fma(_1002, _1118, _1132);
    float _1136 = fma(_1002, _1118, _1124);
    float _1138 = _1002 * 2.0;
    float _1140 = _1002 * _1116;
    float _1142 = fma(_1122, -2.0, _1128);
    float _1144 = fma(_1130, -2.0, 1.0);
    float _1146 = -_1126;
    float _1148 = fma(_1008, _1138, _1146);
    float _1150 = fma(_1008, _1138, _1126);
    float _1152 = fma(_1008, _1118, _1140);
    float _1154 = _1090 * _1134;
    float _1156 = _1090 * _1142;
    float _1158 = -_1140;
    float _1160 = fma(_1008, _1118, _1158);
    float _1162 = fma(_1122, -2.0, _1144);
    float _1164 = _1090 * _1150;
    float _1166 = fma(_1130, -2.0, _1128);
    float _1168 = fma(_1088, _1136, _1156);
    float _1170 = fma(_1088, _1162, _1154);
    float _1172 = fma(_1088, _1160, _1164);
    float _1174 = fma(_1092, _1148, _1168);
    float _1176 = fma(_1092, _1152, _1170);
    float _1178 = fma(_1092, _1166, _1172);
    float _1180 = _667 + _1174;
    float _1182 = _621 + _1176;
    float _1184 = _623 + _1178;
    float _1186 = _1180;
    float _1188 = _1182;
    float _1190 = _1184;
    float _1192 = _1178;
    float _1194 = _1112;
    float _1196 = _1114;
    if (!_1070)
    {
        float _1198 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1200 = _667 + _1198;
        float _1202 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1204 = _621 + _1202;
        float _1206 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1208 = _1200 * _1200;
        float _1210 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1212 = _623 + _1210;
        float _1214 = fma(_1204, _1204, _1208);
        float _1216 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1218 = fma(_1212, _1212, _1214);
        float _1220 = sqrt(_1218);
        float _1222 = _1206 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1224 = precise::min(_1220, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1226 = _1224 * _1216;
        float _1228 = _1222 * _1226;
        float _1230 = fma(_1174, _1228, _667);
        float _1232 = fma(_1176, _1228, _621);
        float _1234 = fma(_1178, _1228, _623);
        _1186 = _1230;
        _1188 = _1232;
        _1190 = _1234;
    }
    float _1236 = _1186;
    float _1238 = _1188;
    float _1240 = _1190;
    if (_1110)
    {
        _1192 = 1.0;
    }
    float _1242 = _1192;
    float _1244 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1246 = _1112 * _1244;
    float _1248 = _1242;
    if (!_1110)
    {
        float _1250 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1252 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1254 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1252;
        float _1256 = _1250 * 0.15915493667125701904296875;
        float _1258 = _1256 * 6.283185482025146484375;
        float _1260 = cos(_1258);
        float _1262 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1264 = _1262 * 0.15915493667125701904296875;
        float _1266 = _1256 * 6.283185482025146484375;
        float _1268 = sin(_1266);
        float _1270 = 1.0 / _1260;
        float _1272 = _1264 * 6.283185482025146484375;
        float _1274 = cos(_1272);
        float _1276 = _1268 * _1270;
        float _1278 = _1264 * 6.283185482025146484375;
        float _1280 = sin(_1278);
        float _1282 = _1274 * _1276;
        float _1284 = 1.0 / _1254;
        float _1286 = 1.0 / _1282;
        float _1288 = _1280 * _1286;
        float _1290 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1292 = fma(_1246, _1288, _1290);
        float _1294 = _1292 * _1284;
        float _1296 = precise::clamp(_1294, 0.0, 1.0);
        _1194 = _1264;
        _1196 = _1296;
    }
    float _1298 = _1194;
    float _1300 = _1196;
    float _1302 = _1298;
    if (!_1110)
    {
        float _1304 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1306 = _1304 * 0.15915493667125701904296875;
        float _1308 = _1306 * 6.283185482025146484375;
        float _1310 = cos(_1308);
        float _1312 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1314 = _1312 * 0.15915493667125701904296875;
        float _1316 = _1306 * 6.283185482025146484375;
        float _1318 = sin(_1316);
        float _1320 = 1.0 / _1310;
        float _1322 = _1314 * 6.283185482025146484375;
        float _1324 = cos(_1322);
        float _1326 = _1318 * _1320;
        float _1328 = _1314 * 6.283185482025146484375;
        float _1330 = sin(_1328);
        float _1332 = _1324 * _1326;
        float _1334 = 1.0 / _1332;
        float _1336 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1338 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1336;
        float _1340 = 1.0 / _1338;
        float _1342 = _1330 * _1334;
        float _1344 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1346 = fma(_1246, _1342, _1344);
        float _1348 = _1346 * _1340;
        float _1350 = precise::clamp(_1348, 0.0, 1.0);
        float _1352 = -_1350;
        float _1354 = _1352 + 1.0;
        _1248 = _1354;
    }
    float _1356 = _1248;
    float _1358 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1360 = _1236 + _1358;
    float _1362 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1364 = _1238 + _1362;
    float _1366 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1368 = _1240 + _1366;
    float _1370 = _1236 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1372 = _1360 * _1360;
    float _1374 = fma(_1364, _1364, _1372);
    float _1376 = fma(_1368, _1368, _1374);
    float _1378 = rsqrt(_1376);
    float _1380 = sqrt(_1376);
    float _1382 = _1378 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1384 = _1364 * _1382;
    float _1386 = _1368 * _1382;
    float _1388 = _1384 * _1384;
    float _1390 = _1386 * _1386;
    float _1392 = _1388 + _1390;
    float _1394 = sqrt(_1392);
    bool _1396 = _1394 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1398 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1400 = _1394 + _1398;
    float _1402 = _1368;
    float _1404 = _1392;
    float _1406 = _1400;
    float _1408 = _1360;
    if (_1396)
    {
        float _1410 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1402 = _1410;
    }
    float _1412 = _1402;
    if (_1396)
    {
        float _1414 = rsqrt(_1392);
        _1404 = _1414;
    }
    float _1416 = _1404;
    float _1418 = _1416;
    if (_1396)
    {
        float _1420 = _1400 * _1412;
        _1406 = _1420;
    }
    float _1422 = _1406;
    if (_1396)
    {
        float _1424 = _1422 * 0.15915493667125701904296875;
        _1302 = _1424;
    }
    float _1426 = _1302;
    float _1428 = _1378;
    float _1430 = _1426;
    if (_1396)
    {
        float _1432 = _1426 * 6.283185482025146484375;
        float _1434 = sin(_1432);
        _1428 = _1434;
    }
    float _1436 = _1428;
    float _1438 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1440 = precise::max(0.0, _1438);
    float _1442 = _1412;
    float _1444 = _1440;
    if (_1396)
    {
        float _1446 = _1426 * 6.283185482025146484375;
        float _1448 = cos(_1446);
        _1442 = _1448;
    }
    float _1450 = _1442;
    float _1452 = -_1382;
    float _1454 = -_1440;
    float _1456 = fma(_1360, _1452, _1454);
    float _1458 = _1456;
    if (_1396)
    {
        float _1460 = _1456 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1408 = _1460;
    }
    float _1462 = _1408;
    if (!_1396)
    {
        _1430 = _1384;
    }
    float _1464 = _1430;
    float _1466 = _1436;
    float _1468 = _1464;
    if (_1396)
    {
        float _1470 = fma(_1436, _1462, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1466 = _1470;
    }
    float _1472 = _1466;
    float _1474 = _1472;
    float _1476 = _1450;
    if (_1396)
    {
        float _1478 = _1450 + (-1.0);
        _1444 = _1478;
    }
    float _1480 = _1444;
    float _1482 = _1480;
    if (_1396)
    {
        float _1484 = _1416 * _1472;
        _309 = _1484;
    }
    float _1486 = _309;
    if (!_1396)
    {
        _1418 = _1386;
    }
    float _1488 = _1418;
    float _1490 = _1488;
    if (_1396)
    {
        float _1492 = _1480 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1482 = _1492;
    }
    float _1494 = _1482;
    if (_1396)
    {
        float _1496 = _1384 * _1486;
        _1468 = _1496;
    }
    float _1498 = _1468;
    if (_1396)
    {
        float _1500 = _1386 * _1486;
        _1490 = _1500;
    }
    float _1502 = _1490;
    if (!_1396)
    {
        _1474 = _1390;
    }
    float _1504 = _1474;
    float _1506 = _1504;
    if (_1396)
    {
        float _1508 = fma(_1456, _1450, _1494);
        _1458 = _1508;
    }
    float _1510 = _1458;
    if (!_1396)
    {
        _1476 = _1388;
    }
    float _1512 = _1476;
    float _1514 = _1512;
    if (_1396)
    {
        float _1516 = _1498 * _1498;
        _1514 = _1516;
    }
    float _1518 = _1514;
    if (_1396)
    {
        float _1520 = _1502 * _1502;
        _1506 = _1520;
    }
    float _1522 = _1506;
    float _1524 = _1236 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1526 = fma(_1510, _1510, _1518);
    float _1528 = fma(_1238, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1370);
    float _1530 = _1526 + _1522;
    float _1532 = fma(_1238, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1524);
    float _1534 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1536 = fma(_1380, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1534);
    float _1538 = precise::clamp(_1536, 0.0, 1.0);
    float _1540 = rsqrt(_1530);
    float _1542 = fma(_1240, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1532);
    float _1544 = -_1538;
    float _1546 = _1544 + 1.0;
    float _1548 = fma(_621, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1550 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1552 = _1542 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1554 = fma(_623, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1556 = _1236 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1558 = floor(_1548);
    float _1560 = _1552 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1562 = _1236 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1564 = fma(_1240, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1528);
    float _1566 = -_1560;
    float _1568 = fma(_1566, _1550, 1.0);
    float _1570 = fma(_1238, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1556);
    float _1572 = _1540 * _1498;
    float _1574 = _1540 * _1510;
    float _1576 = _1540 * _1502;
    float _1578 = fma(_1238, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1562);
    float _1580 = fma(_1240, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1570);
    float _1582 = abs(_1546);
    float _1584 = log2(_1582);
    float _1586 = _1572 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1588 = fma(_1240, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1578);
    float _1590 = _1580 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1592 = -_1558;
    float _1594 = _1548 + _1592;
    float _1596 = -_1586;
    float _1598 = fma(_1574, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1596);
    float _1600 = _1588 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1602 = _1590 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1604 = floor(_1554);
    float _1606 = -_1576;
    float _1608 = fma(_1606, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1598);
    float _1610 = _1564 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1612 = fma(_1600, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1602);
    float _1614 = fma(_1608, -0.5, 0.5);
    float _1616 = fma(_1608, 0.5, 0.5);
    float _1618 = fma(_1552, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1612);
    float _1620 = _1584 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1622 = log2(_1568);
    float _1624 = _1590 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1626 = fma(_1610, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1618);
    float _1628 = _1574 + 1.0;
    float _1630 = fma(_1600, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1624);
    float _1632 = -_1604;
    float _1634 = _1554 + _1632;
    float _1636 = exp2(_1620);
    float _1638 = fma(_1616, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1640 = fma(_1552, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1630);
    float2 _4744 = float2(_1594, _1634);
    float _1642 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4744, float2(0.0), isnan(_4744)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4744, float2(0.0), isnan(_4744)), level(0.0)).x;
    float _1644 = fma(_1616, _1638, -0.212114393711090087890625);
    float _1646 = fma(_1610, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1640);
    float _1648 = 1.0 / _1626;
    float _1650 = _1590 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1652 = _1622 * 0.693147182464599609375;
    float _1654 = fma(_1616, _1644, 1.570728778839111328125);
    float _1656 = fma(_1600, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1650);
    float _1658 = _1652 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1660 = sqrt(_1614);
    float _1662 = fma(_1552, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1656);
    float _1664 = -_1574;
    float _1666 = fma(_1636, _1628, _1664);
    float _1668 = fma(_1610, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1662);
    float _1670 = fma(_1666, 0.5, 0.5);
    float _1672 = _1646 * _1648;
    float _1674 = _1668 * _1648;
    float _1676 = fma(_1672, 0.5, 0.5);
    float _1678 = fma(_1674, -0.5, 0.5);
    float _1680 = _1660 * 0.636619746685028076171875;
    float _1682 = -_1654;
    float _1684 = fma(_1680, _1682, 1.0);
    float3 _4824 = float3(_1676, _1678, _1658);
    float _1686 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4824, float3(0.0), isnan(_4824)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4824, float3(0.0), isnan(_4824)), level(0.0)).x;
    float3 _4835 = float3(_1676, _1678, _1658);
    float4 _1689 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4835, float3(0.0), isnan(_4835)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4835, float3(0.0), isnan(_4835)), level(0.0)).xyzw;
    float _1691 = _1689.x;
    float _1693 = _1689.y;
    float _1695 = _1689.z;
    float _1697 = _1689.w;
    float2 _4851 = float2(_1684, _1670);
    float3 _1701 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4851, float2(0.0), isnan(_4851)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4851, float2(0.0), isnan(_4851)), level(0.0)).xyz;
    float _1703 = _1701.x;
    float _1705 = _1701.y;
    float _1707 = _1701.z;
    float _1709 = abs(_1246);
    float _1711 = log2(_1709);
    bool _1713 = 0.0 != (*spvDescriptorSet0.vp_c11)._m0[20].z;
    bool _1715 = isnan(0.0);
    bool _1717 = _1713 || _1715;
    bool _1719 = isnan((*spvDescriptorSet0.vp_c11)._m0[20].z);
    bool _1721 = _1717 || _1719;
    float _1723 = _1590 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1725 = _919 * _1134;
    float _1727 = fma(_1600, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1723);
    float _1729 = (*spvDescriptorSet0.vp_c11)._m0[20].z * 0.300000011920928955078125;
    float _1731 = _919 * _1142;
    float _1733 = fma(_1552, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1727);
    float _1735 = fma(_913, _1162, _1725);
    float _1737 = _1711 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1739 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1741 = fma(_1729, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1739);
    float _1743 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1745 = fma(_1729, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1743);
    float _1747 = _1678;
    float _1749 = _1741;
    if (_1721)
    {
        float _1751 = (*spvDescriptorSet0.vp_c11)._m0[20].z * 0.20000000298023223876953125;
        _1747 = _1751;
    }
    float _1753 = _1747;
    float _1755 = fma((*spvDescriptorSet0.vp_c11)._m0[20].z, 0.5, _1741);
    float _1757 = exp2(_1737);
    float _1759 = fma((*spvDescriptorSet0.vp_c11)._m0[20].z, 0.5, _1745);
    if (_1721)
    {
        float _1761 = precise::min(_1753, 20.0);
        _1749 = _1761;
    }
    float _1763 = _1749;
    float _1765 = _621 + _1755;
    float _1767 = _623 + _1759;
    float _1769 = -_1765;
    float _1771 = _1769 + (*spvDescriptorSet0.vp_c11)._m0[20].z;
    float _1773 = (*spvDescriptorSet0.vp_c11)._m0[20].z;
    if (_1721)
    {
        float _1775 = 1.0 / _1763;
        _1773 = _1775;
    }
    float _1777 = _1773;
    float _1779 = -_1767;
    float _1781 = _1779 + (*spvDescriptorSet0.vp_c11)._m0[20].z;
    float _1783 = precise::min(_1765, _1771);
    float _1785 = _919 * _1150;
    float _1787 = precise::min(_1767, _1781);
    float _1789 = _1584 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1791 = fma(_1757, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1793 = precise::clamp(_1791, 0.0, 1.0);
    float _1795 = fma(_1610, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1733);
    float _1797 = precise::min(_1783, _1787);
    float _1799 = in.m_88.x;
    float _1801 = fma(_1793, -2.0, 3.0);
    float _1803 = _1793 * _1793;
    float _1805 = _1781;
    if (!_1721)
    {
        _1805 = 1.0;
    }
    float _1807 = _1805;
    float _1809 = exp2(_1789);
    float _1811 = _1807;
    if (_1721)
    {
        float _1813 = _1797 * _1777;
        float _1815 = precise::clamp(_1813, 0.0, 1.0);
        _1811 = _1815;
    }
    float _1817 = _1811;
    float _1819 = _1803 * _1801;
    bool _1821 = _1246 <= 8000.0;
    bool _1823 = isnan(_1246);
    bool _1825 = _1821 || _1823;
    bool _1827 = isnan(8000.0);
    bool _1829 = _1825 || _1827;
    float _1831 = float(_1829);
    float _1833 = _1795 + _1626;
    float _1835 = -_1819;
    float _1837 = _1835 + 1.0;
    bool _1839 = _1380 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1841 = isnan(_1380);
    bool _1843 = _1839 || _1841;
    bool _1845 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1847 = _1843 || _1845;
    float _1849 = _1833 * 0.5;
    float _1851 = fma(_1837, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1819);
    float _1853 = fma(_913, _1136, _1731);
    float _1855 = fma(_913, _1160, _1785);
    float _1857 = fma(_911, _1152, _1735);
    float _1859 = _1831 * _1851;
    float _1861 = fma(_911, _1148, _1853);
    float _1863 = fma(_911, _1166, _1855);
    float _1865 = _1859 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _1867 = -_1809;
    float _1869 = _1867 + 1.0;
    out.m_90.z = _1849;
    out.m_90.w = _1626;
    float _1871 = _1869 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_92.x = _1857;
    out.m_92.y = _1861;
    out.m_92.z = _1863;
    out.gl_Position.x = _1646;
    out.gl_Position.y = _1668;
    out.gl_Position.z = _1795;
    out.gl_Position.w = _1626;
    float _1873 = -_1642;
    float _1875 = _1873 + 1.0;
    float _1877 = _1875 * _1865;
    float _1879 = precise::clamp(_1877, 0.0, 1.0);
    float _1881 = -_1879;
    float _1883 = fma(_1881, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _1885 = -_1871;
    float _1887 = _1885 + 1.0;
    float _1889 = _1883 * _1799;
    float _1891 = _1889 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_94.x = _1891;
    float _1893 = _1871 * _1686;
    float _1895 = _1697 * _1887;
    float _1897 = _1887;
    float _1899 = _1697;
    float _1901 = _1817;
    float _1903 = _1693;
    if (!_1847)
    {
        _1897 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1905 = _1897;
    float _1907 = _1697 * _1893;
    float _1909 = _1707 * _1893;
    float _1911 = fma(_1703, _1907, _1691);
    float _1913 = _1300 * _1356;
    float _1915 = fma(_1705, _1907, _1693);
    float _1917 = fma(_1697, _1909, _1695);
    float _1919 = _1911;
    float _1921 = _1905;
    float _1923 = _1905;
    if (!_1847)
    {
        _1899 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1925 = _1899;
    float _1927 = _1913 * _1817;
    float _1929 = _1927;
    float _1931 = _1925;
    float _1933 = _1925;
    if (!_1847)
    {
        _1901 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1935 = _1901;
    out.m_96.x = _1911;
    out.m_96.y = _1915;
    out.m_96.z = _1917;
    out.m_96.w = _1895;
    float _1937 = _1927 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1939 = _1935;
    float _1941 = _1935;
    if (!_1847)
    {
        _1903 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1943 = _1903;
    float _1945 = _1943;
    float _1947 = _1943;
    if (!_1847)
    {
        _1929 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1949 = _1929;
    float _1951 = _1949;
    float _1953 = _1949;
    if (!_1847)
    {
        _1919 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1955 = _1919;
    bool _1957 = !_1847;
    float _1959 = _1955;
    float _1961 = _1955;
    if (!_1957)
    {
        bool _1963 = _1380 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1965 = isnan(_1380);
        bool _1967 = _1963 || _1965;
        bool _1969 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1971 = _1967 || _1969;
        if (!_1971)
        {
            float _1973 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1975 = _1380 + _1973;
            float _1977 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1979 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1977;
            float _1981 = 1.0 / _1979;
            float _1983 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1985 = _1983 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1987 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1989 = _1987 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1991 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1993 = _1991 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1995 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1997 = _1995 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1999 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2001 = _1999 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2003 = _1975 * _1981;
            float _2005 = precise::clamp(_2003, 0.0, 1.0);
            float _2007 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2009 = _2007 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2011 = fma(_2005, _1985, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2013 = fma(_2005, _2009, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2015 = fma(_2005, _1989, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2017 = fma(_2005, _1993, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2019 = fma(_2005, _1997, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2021 = fma(_2005, _2001, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1933 = _2011;
            _1953 = _2019;
            _1923 = _2013;
            _1947 = _2017;
            _1941 = _2015;
            _1961 = _2021;
            _2023 = true;
        }
        else
        {
            bool _2025 = _1380 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2027 = isnan(_1380);
            bool _2029 = _2025 || _2027;
            bool _2031 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2033 = _2029 || _2031;
            if (!_2033)
            {
                _1921 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2035 = _1921;
            _1923 = _2035;
            if (!_2033)
            {
                _1931 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2037 = _1931;
            _1933 = _2037;
            if (!_2033)
            {
                _1939 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2039 = _1939;
            _1941 = _2039;
            if (!_2033)
            {
                _1945 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2041 = _1945;
            _1947 = _2041;
            if (!_2033)
            {
                _1951 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2043 = _1951;
            _1953 = _2043;
            if (!_2033)
            {
                _1959 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2045 = _1959;
            bool _2047 = !_2033;
            _1961 = _2045;
            if (!_2047)
            {
                bool _2049 = _1380 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2051 = isnan(_1380);
                bool _2053 = _2049 || _2051;
                bool _2055 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2057 = _2053 || _2055;
                if (!_2057)
                {
                    float _2059 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2061 = _1380 + _2059;
                    float _2063 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2065 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2063;
                    float _2067 = 1.0 / _2065;
                    float _2069 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2071 = _2069 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2073 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2075 = _2073 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2077 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2079 = _2077 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2081 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2083 = _2081 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2085 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2087 = _2085 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2089 = _2061 * _2067;
                    float _2091 = precise::clamp(_2089, 0.0, 1.0);
                    float _2093 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2095 = _2093 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2097 = fma(_2091, _2071, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2099 = fma(_2091, _2095, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2101 = fma(_2091, _2075, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2103 = fma(_2091, _2079, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2105 = fma(_2091, _2083, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2107 = fma(_2091, _2087, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1933 = _2097;
                    _1953 = _2105;
                    _1923 = _2099;
                    _1947 = _2103;
                    _1941 = _2101;
                    _1961 = _2107;
                    _2023 = true;
                }
                else
                {
                    _1933 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1953 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1923 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1947 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1941 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1961 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2023 = false;
    float _2109 = _1933;
    float _2111 = _1953;
    float _2113 = _1923;
    float _2115 = _1947;
    float _2117 = _1941;
    float _2119 = _1961;
    float _2121 = fma(_1861, -0.5, 0.5);
    float _2123 = precise::clamp(_2121, 0.0, 1.0);
    float _2125 = -_2109;
    float _2127 = _2125 + _2111;
    float _2129 = -_2113;
    float _2131 = _2129 + _2115;
    out.m_98.x = 0.0;
    float _2133 = fma(_2123, _2127, _2109);
    float _2135 = -_2117;
    float _2137 = _2135 + _2119;
    float _2139 = fma(_2123, _2131, _2113);
    float _2141 = _2133 * 0.586610972881317138671875;
    bool _2143 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2145 = fma(_2123, _2137, _2117);
    float _2147 = _1937 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2149 = fma(_2139, 0.298911988735198974609375, _2141);
    bool _2151 = _1300 > 0.0;
    bool _2153 = isnan(_1300);
    bool _2155 = _2151 || _2153;
    bool _2157 = isnan(0.0);
    bool _2159 = _2155 || _2157;
    float _2161 = fma(_2145, 0.114477999508380889892578125, _2149);
    out.m_58.x = _2147;
    bool _2163 = _1356 <= 0.0;
    bool _2165 = !_2159;
    bool _2167 = _2163 || _2165;
    float _2169 = -_2161;
    float _2171 = _2139 + _2169;
    float _2173 = -_2161;
    float _2175 = _2133 + _2173;
    float _2177 = -_2161;
    float _2179 = _2145 + _2177;
    float _2181 = fma(_2171, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2161);
    float _2183 = fma(_2175, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2161);
    float _2185 = fma(_2179, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2161);
    bool _2187 = !_2143;
    if (!_2187)
    {
        float _2189 = -_1236;
        float _2191 = _2189 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2193 = -_1238;
        float _2195 = _2193 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2197 = -_1240;
        float _2199 = _2197 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2201 = _2191 * _2191;
        float _2203 = fma(_2195, _2195, _2201);
        float _2205 = fma(_2199, _2199, _2203);
        float _2207 = sqrt(_2205);
        float _2209 = rsqrt(_2205);
        float _2211 = -_2207;
        float _2213 = _2211 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2215 = _2213 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2217 = precise::clamp(_2215, 0.0, 1.0);
        float _2219 = _2195 * _2209;
        float _2221 = _2191 * _2209;
        float _2223 = abs(_2217);
        float _2225 = log2(_2223);
        float _2227 = _2199 * _2209;
        float _2229 = _2219 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2231 = _1861 * _2221;
        float _2233 = -_2221;
        float _2235 = -_2229;
        float _2237 = fma(_2233, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2235);
        float _2239 = fma(_1857, _2219, _2231);
        float _2241 = -_2227;
        float _2243 = fma(_2241, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2237);
        float _2245 = fma(_1863, _2227, _2239);
        float _2247 = precise::clamp(_2245, 0.0, 1.0);
        float _2249 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2251 = _2243 + _2249;
        float _2253 = _2225 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2255 = _2251 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2257 = precise::clamp(_2255, 0.0, 1.0);
        float _2259 = exp2(_2253);
        float _2261 = _2259 * _2257;
        float _2263 = _2247 * _2261;
        float _2265 = _2263 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2267 = _2263 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2269 = _2263 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_98.x = _2265;
        out.m_98.y = _2267;
        out.m_98.z = _2269;
    }
    out.m_100.x = _2181;
    out.m_100.y = _2183;
    out.m_100.z = _2185;
    if (!_2167)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_58.x = 0.0;
    float _2271 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2271;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

