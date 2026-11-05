#pragma clang diagnostic ignored "-Wmissing-prototypes"

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
    uint4 _m1[8];
    float4 _m2;
    float4 _m3;
    int _m4;
    float4 _m5[73];
    int4 _m6;
    int _m7;
};

struct _16
{
    float4 _m0[4096];
};

struct spvDescriptorSetBuffer0
{
    constant _10* support_buffer [[id(0)]];
    constant _16* vp_c8 [[id(1)]];
    constant _16* vp_c10 [[id(2)]];
    constant _16* vp_c9 [[id(3)]];
    constant _16* vp_c15 [[id(4)]];
    constant _16* vp_c7 [[id(5)]];
    texture2d<float> vp_t_tcb_C [[id(6)]];
    sampler vp_t_tcb_CSmplr [[id(7)]];
    texture3d<float> vp_t_tcb_32 [[id(8)]];
    sampler vp_t_tcb_32Smplr [[id(9)]];
    texture3d<float> vp_t_tcb_30 [[id(10)]];
    sampler vp_t_tcb_30Smplr [[id(11)]];
    texture2d<float> vp_t_tcb_1C [[id(12)]];
    sampler vp_t_tcb_1CSmplr [[id(13)]];
    sampler vp_t_tcb_32Smplr_w [[id(14)]];
    sampler vp_t_tcb_30Smplr_w [[id(15)]];
    sampler vp_t_tcb_1CSmplr_w [[id(16)]];
    constant dm_border_t* dm_border [[id(17)]];
};

struct main0_out
{
    float4 m_65 [[user(locn0)]];
    float4 m_75 [[user(locn1)]];
    float4 m_81 [[user(locn2)]];
    float4 m_83 [[user(locn3)]];
    float4 m_47 [[user(locn4)]];
    float4 m_73 [[user(locn5)]];
    float4 m_77 [[user(locn6)]];
    float4 m_61 [[user(locn7)]];
    float4 m_79 [[user(locn8)]];
    float4 m_85 [[user(locn9)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_53 [[attribute(1)]];
    float4 m_51 [[attribute(2)]];
    float4 m_55 [[attribute(3)]];
    float4 m_67 [[attribute(4)]];
    float4 m_44 [[attribute(5)]];
    float4 m_49 [[attribute(6)]];
    float4 m_71 [[attribute(7)]];
    float4 m_63 [[attribute(9)]];
    float4 m_59 [[attribute(10)]];
    float4 m_57 [[attribute(11)]];
    float4 m_69 [[attribute(12)]];
};

static inline __attribute__((always_inline))
int _98(thread const int& _7032, thread const int& _7033, constant _10& support_buffer)
{
    float _7036 = as_type<float>(support_buffer._m4);
    int _7038 = _7033 + as_type<int>(_7036);
    int _7040 = 1 + _7038;
    float _7042 = support_buffer._m5[_7040].x;
    float _7044 = abs(_7042);
    bool _7046 = _7044 == 1.0;
    if (_7046)
    {
        return _7032;
    }
    float _7048 = float(_7032);
    float _7050 = _7048 / _7044;
    int _7052 = int(_7050);
    return _7052;
}

static inline __attribute__((always_inline))
int _99(thread const int& _7082, thread const int& _7083, constant _10& support_buffer)
{
    float _7086 = as_type<float>(support_buffer._m4);
    int _7088 = _7083 + as_type<int>(_7086);
    int _7090 = 1 + _7088;
    float _7092 = support_buffer._m5[_7090].x;
    bool _7094 = _7092 == 1.0;
    if (_7094)
    {
        return _7082;
    }
    float _7096 = float(_7082);
    float _7098 = _7096 * _7092;
    int _7100 = int(_7098);
    return _7100;
}

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1089 = false;
    bool _947 = false;
    bool _767 = false;
    bool _607 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _103 = in.m_44.w;
    float _105 = trunc(_103);
    int _107 = int(_105);
    bool _111 = _107 >= 1;
    float _113 = 0.0;
    if (!_111)
    {
        _113 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _115 = _113;
    float _117 = _115;
    if (!_111)
    {
        out.m_47.x = 0.0;
    }
    int _119 = 0;
    if (!_111)
    {
        float _121 = _115 * 5.0;
        _119 = as_type<int>(_121);
    }
    int _123 = _119;
    int _125 = _123;
    if (!_111)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2853 = as_type<float>(_123);
        out.gl_Position.z = _2853;
    }
    if (!_111)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _127 = in.m_49.w;
    bool _129 = _127 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _131 = isnan(_127);
    bool _133 = _129 || _131;
    bool _135 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _137 = _133 || _135;
    float _139 = -_127;
    float _141 = _139 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _143 = 0.0;
    float _145 = 0.0;
    float _147 = _141;
    if (_137)
    {
        float _149 = float(_107);
        _143 = _149;
    }
    float _151 = _143;
    bool _153 = _141 >= _151;
    bool _155 = !_137;
    bool _157 = _153 || _155;
    if (_157)
    {
        _117 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _159 = _117;
    if (_157)
    {
        out.m_47.x = 0.0;
    }
    if (_157)
    {
        float _161 = _159 * 5.0;
        _125 = as_type<int>(_161);
    }
    int _163 = _125;
    float _165 = as_type<float>(_163);
    if (_157)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2924 = as_type<float>(_163);
        out.gl_Position.z = _2924;
    }
    if (_157)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _167 = in.m_51.y;
    float _169 = _141 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _171 = in.m_53.y;
    bool _173 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _175 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _177 = _173 || _175;
    bool _179 = isnan(1.0);
    bool _181 = _177 || _179;
    float _183 = in.m_55.y;
    float _185 = in.m_51.z;
    float _187 = in.m_53.z;
    float _189 = _169;
    if (!_181)
    {
        float _191 = _169 * _169;
        float _193 = _191 * 0.5;
        _165 = _193;
    }
    float _195 = _165;
    float _197 = 0.0;
    float _199 = _195;
    if (!_181)
    {
        float _201 = _141 * _141;
        float _203 = _201 * 0.5;
        _197 = _203;
    }
    float _205 = _197;
    float _207 = in.m_55.z;
    if (!_181)
    {
        float _209 = _195 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _199 = _209;
    }
    float _211 = _199;
    float _213 = _167 * _167;
    float _215 = fma(_171, _171, _213);
    float _217 = fma(_183, _183, _215);
    float _219 = in.m_49.x;
    float _221 = in.m_49.y;
    float _223 = in.m_49.z;
    float _225 = sqrt(_217);
    bool _227 = _225 > 0.0;
    float _229 = _185 * _185;
    float _231 = fma(_187, _187, _229);
    bool _233 = !_181;
    float _235 = _211;
    float _237 = _231;
    if (!_233)
    {
        float _239 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _241 = log2(_239);
        float _243 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _245 = _243 + 1.0;
        float _247 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _249 = _169 * _241;
        float _251 = 1.0 / _245;
        float _253 = _247 * 0.693147182464599609375;
        float _255 = exp2(_249);
        float _257 = 1.0 / _253;
        float _259 = _255 + (-1.0);
        float _261 = -_259;
        float _263 = fma(_261, _257, _169);
        float _265 = _263 * _251;
        float _267 = _265 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _145 = _257;
        _235 = _267;
    }
    float _269 = _145;
    float _271 = _235;
    bool _273 = !_181;
    float _275 = _269;
    if (!_273)
    {
        float _277 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _279 = log2(_277);
        float _281 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _283 = _281 + 1.0;
        float _285 = 1.0 / _283;
        float _287 = _169 * _279;
        float _289 = exp2(_287);
        float _291 = -_289;
        float _293 = _291 + 1.0;
        float _295 = _293 * _285;
        _275 = _283;
        _189 = _295;
    }
    float _297 = _275;
    float _299 = _189;
    float _301 = fma(_207, _207, _231);
    float _303 = _297;
    if (!_181)
    {
        _303 = _141;
    }
    float _305 = _303;
    float _307 = _305;
    if (!_181)
    {
        float _309 = _205 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _237 = _309;
    }
    float _311 = _237;
    bool _313 = !_181;
    float _315 = _311;
    if (!_313)
    {
        float _317 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _319 = log2(_317);
        float _321 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _323 = _321 + 1.0;
        float _325 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _327 = _141 * _319;
        float _329 = 1.0 / _323;
        float _331 = _325 * 0.693147182464599609375;
        float _333 = exp2(_327);
        float _335 = 1.0 / _331;
        float _337 = _333 + (-1.0);
        float _339 = -_337;
        float _341 = fma(_339, _335, _141);
        float _343 = _341 * _329;
        float _345 = _343 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _315 = _345;
    }
    float _347 = _315;
    bool _349 = !_181;
    if (!_349)
    {
        float _351 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _353 = log2(_351);
        float _355 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _357 = _355 + 1.0;
        float _359 = 1.0 / _357;
        float _361 = _141 * _353;
        float _363 = exp2(_361);
        float _365 = -_363;
        float _367 = _365 + 1.0;
        float _369 = _367 * _359;
        _307 = _369;
    }
    float _371 = _307;
    float _373 = _271 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _375 = _347 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _377 = _271 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _379 = _347 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _381 = fma(_299, _221, _373);
    float _383 = fma(_371, _221, _375);
    float _385 = sqrt(_301);
    float _387 = _271 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _389 = fma(_299, _219, _377);
    float _391 = _347 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _393 = fma(_371, _219, _379);
    float _395 = -_383;
    float _397 = _381 + _395;
    float _399 = fma(_299, _223, _387);
    float _401 = fma(_371, _223, _391);
    float _403 = -_393;
    float _405 = _389 + _403;
    float _407 = _397 * _397;
    float _409 = in.m_57.y;
    float _411 = -_401;
    float _413 = _399 + _411;
    float _415 = _391;
    float _417 = _399;
    if (_227)
    {
        float _419 = rsqrt(_217);
        _415 = _419;
    }
    float _421 = _415;
    float _423 = fma(_405, _405, _407);
    float _425 = in.m_53.x;
    float _427 = 0.0;
    if (!_227)
    {
        _427 = 0.0;
    }
    float _429 = _427;
    float _431 = _397 * _183;
    float _433 = fma(_413, _413, _423);
    bool _435 = _385 > 0.0;
    float _437 = in.m_51.x;
    float _439 = 0.0;
    float _441 = _429;
    if (!_227)
    {
        _439 = 0.0;
    }
    float _443 = _439;
    float _445 = _397 * _167;
    float _447 = 0.0;
    float _449 = _443;
    if (!_227)
    {
        _447 = 0.0;
    }
    float _451 = _447;
    float _453 = in.m_55.x;
    float _455 = sqrt(_433);
    float _457 = in.m_59.w;
    float _459 = _451;
    if (_227)
    {
        float _461 = _421 * _171;
        _441 = _461;
    }
    float _463 = _441;
    float _465 = _463;
    if (_227)
    {
        float _467 = _421 * _167;
        _449 = _467;
    }
    float _469 = _449;
    float _471 = _469;
    if (_227)
    {
        float _473 = _421 * _183;
        _459 = _473;
    }
    float _475 = _459;
    float _477 = in.m_44.x;
    float _479 = in.m_44.y;
    float _481 = in.m_44.z;
    float _483 = 0.0;
    if (_435)
    {
        float _485 = rsqrt(_301);
        _483 = _485;
    }
    float _487 = _483;
    float _489 = 0.0;
    if (!_435)
    {
        _489 = 0.0;
    }
    float _491 = _489;
    out.m_61.y = _409;
    float _493 = 0.0;
    float _495 = _491;
    float _497 = _409;
    if (!_435)
    {
        _493 = 0.0;
    }
    float _499 = _493;
    float _501 = 0.0;
    float _503 = _499;
    if (!_435)
    {
        _501 = 0.0;
    }
    float _505 = _501;
    bool _507 = _455 >= 9.9999999747524270787835121154785e-07;
    bool _509 = isnan(_455);
    bool _511 = _507 || _509;
    bool _513 = isnan(9.9999999747524270787835121154785e-07);
    bool _515 = _511 || _513;
    float _517 = _397 * _171;
    float _519 = fma(_405, _437, _445);
    float _521 = fma(_405, _425, _517);
    float _523 = fma(_405, _453, _431);
    float _525 = _505;
    float _527 = _523;
    if (_435)
    {
        float _529 = _487 * _187;
        _495 = _529;
    }
    float _531 = _495;
    if (_435)
    {
        float _533 = _487 * _185;
        _503 = _533;
    }
    float _535 = _503;
    if (_435)
    {
        float _537 = _487 * _207;
        _525 = _537;
    }
    float _539 = _525;
    float _541 = fma(_413, _187, _521);
    float _543 = fma(_413, _185, _519);
    float _545 = fma(_413, _207, _523);
    float _547 = fma(_399, _457, _481);
    float _549 = fma(_389, _457, _477);
    float _551 = fma(_381, _457, _479);
    float _553 = _543;
    float _555 = _543;
    if (_515)
    {
        _527 = _541;
    }
    float _557 = _527;
    float _559 = _557;
    float _561 = _557;
    if (_515)
    {
        _417 = _545;
    }
    float _563 = _417;
    float _565 = _563;
    float _567 = _563;
    if (!_515)
    {
        bool _569 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _571 = !_569;
        if (!_571)
        {
            float _573 = _167 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _575 = _171 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _577 = _183 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _579 = fma(_437, (*spvDescriptorSet0.vp_c9)._m0[16].x, _573);
            float _581 = fma(_425, (*spvDescriptorSet0.vp_c9)._m0[16].x, _575);
            float _583 = fma(_453, (*spvDescriptorSet0.vp_c9)._m0[16].x, _577);
            float _585 = fma(_185, (*spvDescriptorSet0.vp_c9)._m0[16].z, _579);
            float _587 = fma(_187, (*spvDescriptorSet0.vp_c9)._m0[16].z, _581);
            float _589 = fma(_207, (*spvDescriptorSet0.vp_c9)._m0[16].z, _583);
            float _591 = _585 * _585;
            float _593 = fma(_587, _587, _591);
            float _595 = fma(_589, _589, _593);
            float _597 = rsqrt(_595);
            float _599 = _597 * 9.9999999747524270787835121154785e-07;
            float _601 = _587 * _599;
            float _603 = _585 * _599;
            float _605 = _589 * _599;
            _555 = _603;
            _561 = _601;
            _567 = _605;
            _607 = true;
        }
        else
        {
            float _609 = _221 * _221;
            float _611 = fma(_219, _219, _609);
            float _613 = fma(_223, _223, _611);
            float _615 = sqrt(_613);
            bool _617 = _615 >= 9.9999999747524270787835121154785e-07;
            bool _619 = isnan(_615);
            bool _621 = _617 || _619;
            bool _623 = isnan(9.9999999747524270787835121154785e-07);
            bool _625 = _621 || _623;
            if (!_625)
            {
                float _627 = _479 * _479;
                float _629 = fma(_477, _477, _627);
                float _631 = fma(_481, _481, _629);
                float _633 = sqrt(_631);
                bool _635 = _633 >= 9.9999999747524270787835121154785e-07;
                bool _637 = isnan(_633);
                bool _639 = _635 || _637;
                bool _641 = isnan(9.9999999747524270787835121154785e-07);
                bool _643 = _639 || _641;
                float _645 = _217;
                if (!_643)
                {
                    float _647 = rsqrt(_217);
                    _645 = _647;
                }
                float _649 = _645;
                if (!_643)
                {
                    float _651 = _649 * 9.9999999747524270787835121154785e-07;
                    _565 = _651;
                }
                float _653 = _565;
                float _655 = _653;
                if (!_643)
                {
                    float _657 = _171 * _653;
                    _559 = _657;
                }
                float _659 = _559;
                _561 = _659;
                if (!_643)
                {
                    float _661 = _167 * _653;
                    _553 = _661;
                }
                float _663 = _553;
                _555 = _663;
                if (!_643)
                {
                    float _665 = _183 * _653;
                    _655 = _665;
                }
                float _667 = _655;
                bool _669 = !_643;
                _567 = _667;
                _607 = _669;
                if (!_607)
                {
                    float _671 = _167 * _479;
                    float _673 = _171 * _479;
                    float _675 = _183 * _479;
                    float _677 = fma(_477, _437, _671);
                    float _679 = fma(_477, _425, _673);
                    float _681 = fma(_477, _453, _675);
                    float _683 = fma(_185, _481, _677);
                    float _685 = fma(_187, _481, _679);
                    float _687 = fma(_207, _481, _681);
                    float _689 = _683 * _683;
                    float _691 = fma(_685, _685, _689);
                    float _693 = fma(_687, _687, _691);
                    float _695 = rsqrt(_693);
                    float _697 = _695 * 9.9999999747524270787835121154785e-07;
                    float _699 = _685 * _697;
                    float _701 = _683 * _697;
                    float _703 = _687 * _697;
                    _555 = _701;
                    _561 = _699;
                    _567 = _703;
                    _607 = true;
                }
            }
            else
            {
                float _705 = _167 * _221;
                float _707 = _171 * _221;
                float _709 = _183 * _221;
                float _711 = fma(_219, _437, _705);
                float _713 = fma(_219, _425, _707);
                float _715 = fma(_219, _453, _709);
                float _717 = fma(_185, _223, _711);
                float _719 = fma(_187, _223, _713);
                float _721 = fma(_207, _223, _715);
                float _723 = _717 * _717;
                float _725 = fma(_719, _719, _723);
                float _727 = fma(_721, _721, _725);
                float _729 = rsqrt(_727);
                float _731 = _729 * 9.9999999747524270787835121154785e-07;
                float _733 = _719 * _731;
                float _735 = _717 * _731;
                float _737 = _721 * _731;
                _555 = _735;
                _561 = _733;
                _567 = _737;
            }
        }
    }
    _607 = false;
    float _739 = _555;
    float _741 = _561;
    float _743 = _567;
    bool _745 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _747 = !_745;
    float _765;
    if (!_747)
    {
        float _749 = in.m_63.x;
        float _751 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _753 = _749 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _755 = fma(_753, (*spvDescriptorSet0.vp_c9)._m0[12].x, _141);
        float _757 = _755 * _751;
        float _759 = floor(_757);
        float _761 = -_759;
        float _763 = _757 + _761;
        _765 = _763;
        _767 = true;
    }
    else
    {
        float _769 = float(_107);
        float _771 = 1.0 / _769;
        float _773 = _141 * _771;
        _765 = _773;
    }
    _767 = false;
    float _775 = _765;
    float _777 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _779 = _775 + _777;
    bool _781 = _775 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _783 = isnan(_775);
    bool _785 = _781 || _783;
    bool _787 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _789 = _785 || _787;
    float _791 = float(_789);
    float _793 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _795 = _775 + _793;
    bool _797 = _775 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _799 = isnan(_775);
    bool _801 = _797 || _799;
    bool _803 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _805 = _801 || _803;
    float _807 = float(_805);
    float _809 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _811 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _809;
    float _813 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _815 = _813 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _817 = _775 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _819 = isnan(_775);
    bool _821 = _817 || _819;
    bool _823 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _825 = _821 || _823;
    float _827 = float(_825);
    float _829 = -_791;
    float _831 = _829 + 1.0;
    float _833 = 1.0 / _815;
    float _835 = _827 * _831;
    float _837 = -_827;
    float _839 = _837 + 1.0;
    float _841 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _843 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _841;
    bool _845 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _847 = 1.0 / _811;
    float _849 = _807 * _839;
    float _851 = -_807;
    float _853 = _851 + 1.0;
    float _855 = _795 * _833;
    float _857 = _779 * _847;
    float _859 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _861 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _859;
    float _863 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _865 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _863;
    float _867 = fma(_843, _857, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _869 = fma(_861, _857, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _871 = fma(_865, _857, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _873 = in.m_59.x;
    float _875 = in.m_59.y;
    float _877 = in.m_59.z;
    float _879 = _867 * _849;
    float _881 = _869 * _849;
    float _883 = _871 * _849;
    float _885 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _887 = _885 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _889 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _891 = _889 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _893 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _895 = _893 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _897 = fma(_853, (*spvDescriptorSet0.vp_c9)._m0[143].y, _881);
    float _899 = fma(_887, _855, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _901 = fma(_891, _855, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _903 = fma(_895, _855, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _905 = fma(_853, (*spvDescriptorSet0.vp_c9)._m0[143].x, _879);
    float _907 = fma(_853, (*spvDescriptorSet0.vp_c9)._m0[143].z, _883);
    float _909 = fma(_901, _835, _897);
    float _911 = fma(_899, _835, _905);
    float _913 = fma(_903, _835, _907);
    float _915 = fma(_791, (*spvDescriptorSet0.vp_c9)._m0[145].y, _909);
    float _917 = fma(_791, (*spvDescriptorSet0.vp_c9)._m0[145].x, _911);
    float _919 = fma(_791, (*spvDescriptorSet0.vp_c9)._m0[145].z, _913);
    float _921 = _917 * _873;
    float _923 = _915 * _875;
    float _925 = _919 * _877;
    bool _927 = !_845;
    float _945;
    if (!_927)
    {
        float _929 = in.m_63.x;
        float _931 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _933 = _929 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _935 = fma(_933, (*spvDescriptorSet0.vp_c9)._m0[11].y, _141);
        float _937 = _935 * _931;
        float _939 = floor(_937);
        float _941 = -_939;
        float _943 = _937 + _941;
        _945 = _943;
        _947 = true;
    }
    else
    {
        float _949 = float(_107);
        float _951 = 1.0 / _949;
        float _953 = _141 * _951;
        _945 = _953;
    }
    _947 = false;
    float _955 = _945;
    float _957 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _959 = _955 + _957;
    float _961 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _963 = _961 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _965 = _955 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _967 = isnan(_955);
    bool _969 = _965 || _967;
    bool _971 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _973 = _969 || _971;
    float _975 = float(_973);
    float _977 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _979 = _977 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _981 = _955 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _983 = isnan(_955);
    bool _985 = _981 || _983;
    bool _987 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _989 = _985 || _987;
    float _991 = float(_989);
    float _993 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _995 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _993;
    bool _997 = _955 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _999 = isnan(_955);
    bool _1001 = _997 || _999;
    bool _1003 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1005 = _1001 || _1003;
    float _1007 = float(_1005);
    float _1009 = 1.0 / _963;
    float _1011 = -_975;
    float _1013 = _1011 + 1.0;
    bool _1015 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _1017 = -_1007;
    float _1019 = _1017 + 1.0;
    float _1021 = 1.0 / _979;
    float _1023 = _975 * _1019;
    float _1025 = _995 * _1009;
    float _1027 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1029 = _1027 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1031 = fma(_1025, _959, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1033 = _991 * _1013;
    float _1035 = -_991;
    float _1037 = _1035 + 1.0;
    float _1039 = _1029 * _1021;
    float _1041 = _1031 * _1033;
    float _1043 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1045 = _955 + _1043;
    float _1047 = fma(_1037, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1041);
    float _1049 = fma(_1039, _1045, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1051 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1053 = fma(_1049, _1023, _1047);
    float _1055 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1057 = _1051 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1059 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1061 = fma(_1007, (*spvDescriptorSet0.vp_c9)._m0[117].x, _1053);
    float _1063 = _1055 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1065 = _1059 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1067 = _1061 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_65.x = _1057;
    out.m_65.y = _1063;
    out.m_65.z = _1065;
    out.m_65.w = _1067;
    bool _1069 = !_1015;
    float _1087;
    if (!_1069)
    {
        float _1071 = in.m_63.x;
        float _1073 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _1075 = _1071 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _1077 = fma(_1075, (*spvDescriptorSet0.vp_c9)._m0[11].w, _141);
        float _1079 = _1077 * _1073;
        float _1081 = floor(_1079);
        float _1083 = -_1081;
        float _1085 = _1079 + _1083;
        _1087 = _1085;
        _1089 = true;
    }
    else
    {
        float _1091 = float(_107);
        float _1093 = 1.0 / _1091;
        float _1095 = _141 * _1093;
        _1087 = _1095;
    }
    _1089 = false;
    float _1097 = _1087;
    int _1099 = int2(spvDescriptorSet0.vp_t_tcb_C.get_width(), spvDescriptorSet0.vp_t_tcb_C.get_height()).x;
    int _1101 = _1099;
    int _1103 = 0;
    int _1105 = _98(_1101, _1103, (*spvDescriptorSet0.support_buffer));
    float _1107 = in.m_63.x;
    float _1109 = in.m_57.z;
    float _1111 = _1107 * 5.0;
    float _1113 = rint(_1111);
    float _1115 = _1113 * 0.20000000298023223876953125;
    float _1117 = precise::clamp(_1115, 0.0, 1.0);
    int _1119 = _1105 + (-1);
    float _1121 = trunc(_1109);
    int _1123 = int(_1121);
    float _1125 = float(_1119);
    float _1127 = _1117 * _1125;
    float _1129 = trunc(_1127);
    int _1131 = int(_1129);
    int _1133 = _1131 + 1;
    int _1135 = min(_1119, _1133);
    int _1137 = _1131;
    int _1139 = 0;
    int _1141 = _99(_1137, _1139, (*spvDescriptorSet0.support_buffer));
    int _1143 = _1123;
    int _1145 = 0;
    int _1147 = _99(_1143, _1145, (*spvDescriptorSet0.support_buffer));
    float3 _1151 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_1141, _1147)), 0).xyz;
    float _1153 = _1151.x;
    float _1155 = _1151.y;
    float _1157 = _1151.z;
    int _1159 = _1135;
    int _1161 = 0;
    int _1163 = _99(_1159, _1161, (*spvDescriptorSet0.support_buffer));
    int _1165 = _1123;
    int _1167 = 0;
    int _1169 = _99(_1165, _1167, (*spvDescriptorSet0.support_buffer));
    float3 _1171 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_1163, _1169)), 0).xyz;
    float _1173 = _1171.x;
    float _1175 = _1171.y;
    float _1177 = _1171.z;
    float _1179 = in.m_63.z;
    float _1181 = _551 * _167;
    float _1183 = _551 * _183;
    float _1185 = in.m_63.y;
    float _1187 = fma(_549, _437, _1181);
    float _1189 = _551 * _171;
    int _1191 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1193 = _1191 != 0;
    int _1195 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1197 = _1195 != 0;
    int _1199 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1201 = _1199 != 0;
    float _1203 = _1107 * 2.0;
    float _1205 = fma(_547, _185, _1187);
    float _1207 = fma(_549, _453, _1183);
    float _1209 = fma(_549, _425, _1189);
    float _1211 = in.m_51.w;
    float _1213 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1215 = fma(_547, _187, _1209);
    float _1217 = fma(_547, _207, _1207);
    float _1219 = -_1213;
    float _1221 = fma(_1203, (*spvDescriptorSet0.vp_c9)._m0[77].x, _1219);
    float _1223 = _739 * _739;
    float _1225 = floor(_1203);
    float _1227 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1229 = in.m_53.w;
    float _1231 = _1179 * 2.0;
    float _1233 = fma(_741, _741, _1223);
    float _1235 = in.m_55.w;
    float _1237 = _1185 + _1179;
    float _1239 = floor(_1231);
    float _1241 = _1185 * 2.0;
    float _1243 = fma(_743, _743, _1233);
    float _1245 = _1237 + (-1.0);
    bool _1247 = !_1197;
    int _1249 = _1247 ? 0 : 1;
    float _1251 = -_141;
    float _1253 = fma(_1251, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1221);
    float _1255 = fma(_1245, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1257 = floor(_1241);
    float _1259 = _1185 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _1261 = _1225 > 0.0;
    float _1263 = _1205 + _1211;
    bool _1265 = _1225 >= 0.0;
    bool _1267 = isnan(_1225);
    bool _1269 = _1265 || _1267;
    bool _1271 = isnan(0.0);
    bool _1273 = _1269 || _1271;
    float _1275 = fma(_1259, -2.0, _1227);
    float _1277 = _1107 + _1185;
    float _1279 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1281 = log2(_1279);
    bool _1283 = _1239 > 0.0;
    float _1285 = _1277 + (-1.0);
    bool _1287 = _1239 >= 0.0;
    bool _1289 = isnan(_1239);
    bool _1291 = _1287 || _1289;
    bool _1293 = isnan(0.0);
    bool _1295 = _1291 || _1293;
    float _1297 = _1215 + _1229;
    float _1299 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1301 = 1.0 + _1299;
    float _1303 = fma(_1285, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _1305 = !_1193;
    int _1307 = _1305 ? 0 : 1;
    float _1309 = rsqrt(_1243);
    int _1311 = _1295 ? 0 : 1;
    float _1313 = _1217 + _1235;
    int _1315 = abs(_1307);
    int _1317 = ~_1311;
    int _1319 = _1317 + 1;
    int _1321 = _1319 + 1;
    float _1323 = 1.0 / _1301;
    float _1325 = _1281 * _141;
    int _1327 = _1273 ? 0 : 1;
    bool _1329 = _1257 > 0.0;
    bool _1331 = _1257 >= 0.0;
    bool _1333 = isnan(_1257);
    bool _1335 = _1331 || _1333;
    bool _1337 = isnan(0.0);
    bool _1339 = _1335 || _1337;
    int _1341 = _1321;
    bool _1343 = _1197;
    int _1345 = as_type<int>(_1097);
    if (!_1283)
    {
        int _1347 = ~_1311;
        int _1349 = _1347 + 1;
        _1341 = _1349;
    }
    int _1351 = _1341;
    float _1353 = exp2(_1325);
    int _1355 = ~_1327;
    int _1357 = _1355 + 1;
    int _1359 = _1357 + 1;
    float _1361 = _1309 * _741;
    int _1363 = _1359;
    if (!_1261)
    {
        int _1365 = ~_1327;
        int _1367 = _1365 + 1;
        _1363 = _1367;
    }
    int _1369 = _1363;
    float _1371 = _1309 * _739;
    float _1373 = _1309 * _743;
    float _1375 = float(_1315);
    float _1377 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1379 = float(_1351);
    float _1381 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _1383 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1385 = isnan(1.0);
    bool _1387 = _1383 || _1385;
    bool _1389 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1391 = _1387 || _1389;
    float _1393 = fma(_1107, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1377);
    bool _1395 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1397 = isnan(0.0);
    bool _1399 = _1395 || _1397;
    bool _1401 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1403 = _1399 || _1401;
    float _1405 = _1375 * _1379;
    float _1407 = fma(_1185, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1381);
    float _1409 = in.m_67.x;
    float _1411 = in.m_67.y;
    float _1413 = in.m_67.z;
    float _1415 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1393);
    int _1417 = _1339 ? 0 : 1;
    float _1419 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1407);
    int _1421 = abs(_1249);
    float _1423 = -_1353;
    float _1425 = _1423 + 1.0;
    float _1427 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1275);
    float _1429 = _1371 * _469;
    float _1431 = _1405 * (-2.0);
    float _1433 = float(_1421);
    float _1435 = _1403 ? _1425 : 0.0;
    float _1437 = fma(_1361, _463, _1429);
    float _1439 = float(_1369);
    int _1441 = ~_1417;
    int _1443 = _1441 + 1;
    int _1445 = _1443 + 1;
    float _1447 = fma(_1373, _475, _1437);
    int _1449 = _1445;
    if (_1391)
    {
        float _1451 = _1435 * _1323;
        _147 = _1451;
    }
    float _1453 = _147;
    float _1455 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1457 = _1263 + _1455;
    if (!_1329)
    {
        int _1459 = ~_1417;
        int _1461 = _1459 + 1;
        _1449 = _1461;
    }
    int _1463 = _1449;
    float _1465 = fma(_1303, _1431, _1303);
    float _1467 = abs(_1447);
    bool _1469 = _1467 > 0.99989998340606689453125;
    float _1471 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1473 = _1297 + _1471;
    float _1475 = _1457 * _1457;
    float _1477 = _1433 * _1439;
    float _1479 = fma(_1431, _1409, _1409);
    float _1481 = _1107 + (-0.5);
    bool _1483 = !_1201;
    int _1485 = _1483 ? 0 : 1;
    float _1487 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1489 = _1313 + _1487;
    float _1491 = fma(_1473, _1473, _1475);
    float _1493 = _1477 * (-2.0);
    float _1495 = fma(_1481, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1479);
    int _1497 = abs(_1485);
    float _1499 = fma(_1489, _1489, _1491);
    float _1501 = fma(_1255, _1493, _1255);
    float _1503 = fma(_1493, _1411, _1411);
    float _1505 = fma(_1465, _1453, _1495);
    float _1507 = _1185 + (-0.5);
    float _1509 = float(_1497);
    float _1511 = _1107 + _1179;
    float _1513 = float(_1463);
    float _1515 = rsqrt(_1499);
    float _1517 = fma(_1507, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1503);
    float _1519 = _1511 + (-1.0);
    float _1521 = _1509 * _1513;
    if (_1469)
    {
        float _1523 = fma(_531, 0.001000000047497451305389404296875, _463);
        _465 = _1523;
    }
    float _1525 = _465;
    float _1527 = fma(_1501, _1453, _1517);
    float _1529 = fma(_1519, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1531 = _1521 * (-2.0);
    float _1533 = _921 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1535 = _1505 * 0.15915493667125701904296875;
    float _1537 = _1179 + (-0.5);
    float _1539 = fma(_1531, _1413, _1413);
    float _1541 = _1533 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    float _1543 = _1535 * 6.283185482025146484375;
    float _1545 = sin(_1543);
    float _1547 = fma(_1529, _1531, _1529);
    float _1549 = fma(_1537, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1539);
    float _1551 = _1539;
    if (_1469)
    {
        float _1553 = fma(_535, 0.001000000047497451305389404296875, _469);
        _471 = _1553;
    }
    float _1555 = _471;
    if (!_1469)
    {
        _1551 = _475;
    }
    float _1557 = _1551;
    float _1559 = _1557;
    if (_1469)
    {
        float _1561 = fma(_539, 0.001000000047497451305389404296875, _475);
        _1559 = _1561;
    }
    float _1563 = _1559;
    float _1565 = fma(_1547, _1453, _1549);
    float _1567 = -_1525;
    float _1569 = _1373 * _1567;
    float _1571 = _1535 * 6.283185482025146484375;
    float _1573 = cos(_1571);
    float _1575 = _1527 * 0.15915493667125701904296875;
    float _1577 = _1565 * 0.15915493667125701904296875;
    float _1579 = -_1563;
    float _1581 = -_1569;
    float _1583 = fma(_1361, _1579, _1581);
    float _1585 = _1575 * 6.283185482025146484375;
    float _1587 = sin(_1585);
    float _1589 = _1541 * _1515;
    float _1591 = _1457 * _1589;
    float _1593 = _1473 * _1589;
    float _1595 = _1575 * 6.283185482025146484375;
    float _1597 = cos(_1595);
    float _1599 = -_1591;
    float _1601 = _1457 + _1599;
    float _1603 = -_1593;
    float _1605 = _1473 + _1603;
    float _1607 = _1489 * _1589;
    float _1609 = _1583 * _1583;
    float _1611 = _1601 * _1601;
    float _1613 = -_1563;
    float _1615 = _1371 * _1613;
    float _1617 = -_1607;
    float _1619 = _1489 + _1617;
    float _1621 = -_1555;
    float _1623 = _1361 * _1621;
    float _1625 = fma(_1605, _1605, _1611);
    float _1627 = -_1555;
    float _1629 = -_1615;
    float _1631 = fma(_1373, _1627, _1629);
    float _1633 = _1577 * 6.283185482025146484375;
    float _1635 = sin(_1633);
    float _1637 = -_1525;
    float _1639 = -_1623;
    float _1641 = fma(_1371, _1637, _1639);
    float _1643 = fma(_1619, _1619, _1625);
    float _1645 = fma(_1631, _1631, _1609);
    float _1647 = _1545 * _1587;
    float _1649 = _1573 * _1597;
    float _1651 = _1545 * _1597;
    float _1653 = fma(_1641, _1641, _1645);
    float _1655 = _1577 * 6.283185482025146484375;
    float _1657 = cos(_1655);
    float _1659 = rsqrt(_1653);
    float _1661 = fma(_1635, _1649, _1647);
    float _1663 = _1573 * _1587;
    float _1665 = fma(_1635, _1647, _1649);
    float _1667 = _1545 * _1657;
    float _1669 = _1573 * _1657;
    float _1671 = _1597 * _1657;
    float _1673 = _1587 * _1657;
    float _1675 = sqrt(_1643);
    float _1677 = _1669 * _1371;
    float _1679 = _1669 * _1373;
    float _1681 = -_1663;
    float _1683 = fma(_1635, _1651, _1681);
    float _1685 = _1583 * _1659;
    float _1687 = _1641 * _1659;
    float _1689 = _1631 * _1659;
    float _1691 = _1661 * _1361;
    float _1693 = -_1651;
    float _1695 = fma(_1635, _1663, _1693);
    float _1697 = _1669 * _1361;
    float _1699 = _1661 * _1371;
    float _1701 = fma(_1671, _1689, _1691);
    float _1703 = -_1635;
    float _1705 = fma(_1703, _1685, _1677);
    float _1707 = -_1635;
    float _1709 = fma(_1707, _1689, _1697);
    float _1711 = -_1635;
    float _1713 = fma(_1711, _1687, _1679);
    float _1715 = _1661 * _1373;
    float _1717 = floor(_1127);
    float _1719 = _1695 * _1371;
    float _1721 = fma(_1671, _1685, _1699);
    float _1723 = fma(_1671, _1687, _1715);
    float _1725 = _1695 * _1361;
    float _1727 = _1695 * _1373;
    float _1729 = _1371 * _1687;
    float _1731 = _1373 * _1689;
    float _1733 = fma(_1673, _1685, _1719);
    float _1735 = _1361 * _1685;
    float _1737 = -_1729;
    float _1739 = fma(_1373, _1685, _1737);
    float _1741 = -_1731;
    float _1743 = fma(_1361, _1687, _1741);
    float _1745 = _1515 * _1675;
    float _1747 = fma(_1673, _1689, _1725);
    float _1749 = -_1735;
    float _1751 = fma(_1371, _1689, _1749);
    float _1753 = fma(_1673, _1687, _1727);
    float _1755 = -_1717;
    float _1757 = _1127 + _1755;
    float _1759 = fma(_1667, _1739, _1709);
    float _1761 = fma(_1667, _1743, _1705);
    float _1763 = fma(_1683, _1739, _1701);
    float _1765 = fma(_1683, _1743, _1721);
    float _1767 = fma(_1665, _1739, _1747);
    float _1769 = fma(_1665, _1743, _1733);
    float _1771 = fma(_1683, _1751, _1723);
    float _1773 = fma(_1667, _1751, _1713);
    float _1775 = fma(_1665, _1751, _1753);
    float _1777 = _923 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1779 = _925 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1781 = _1533 * _1745;
    float _1783 = _1777 * _1745;
    float _1785 = _1779 * _1745;
    float _1787 = -_1155;
    float _1789 = _1787 + _1175;
    float _1791 = -_1153;
    float _1793 = _1791 + _1173;
    float _1795 = -_1157;
    float _1797 = _1795 + _1177;
    float _1799 = fma(_1757, _1789, _1155);
    float _1801 = fma(_1757, _1793, _1153);
    float _1803 = fma(_1757, _1797, _1157);
    float _1805 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1799);
    float _1807 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1801);
    float _1809 = _1783 * _1805;
    float _1811 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1803);
    float _1813 = _1781 * _1807;
    float _1815 = _1809 * _1773;
    float _1817 = _1785 * _1811;
    float _1819 = _1809 * _1759;
    float _1821 = fma(_1813, _1771, _1815);
    float _1823 = fma(_1813, _1763, _1819);
    float _1825 = fma(_1817, _1775, _1821);
    float _1827 = fma(_1817, _1767, _1823);
    float _1829 = _1313 + _1825;
    float _1831 = _1297 + _1827;
    float _1833 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1835 = _1829 + _1833;
    float _1837 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1839 = _1831 + _1837;
    float _1841 = _1835 * _1835;
    float _1843 = fma(_1839, _1839, _1841);
    float _1845 = _1809 * _1761;
    float _1847 = sqrt(_1843);
    float _1849 = fma(_1813, _1765, _1845);
    float _1851 = fma(_1817, _1769, _1849);
    float _1853 = _1263 + _1851;
    bool _1855 = _1847 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1857 = _1851;
    float _1859 = _1849;
    float _1861 = _1831;
    float _1863 = _1829;
    float _1865 = _1813;
    float _1867 = _1723;
    float _1869 = _1713;
    float _1871 = _1701;
    if (!_1855)
    {
        _1857 = _1831;
    }
    float _1873 = _1857;
    float _1875 = _1873;
    if (!_1855)
    {
        _1859 = _1829;
    }
    float _1877 = _1859;
    float _1879 = _1877;
    if (!_1855)
    {
        _1861 = _1853;
    }
    float _1881 = _1861;
    bool _1883 = !_1855;
    float _1885 = _1881;
    if (!_1883)
    {
        float _1887 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1889 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1891 = _1847 + _1889;
        float _1893 = _1853 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1895 = rsqrt(_1843);
        float _1897 = _1891 * _1887;
        float _1899 = _1897 * 0.15915493667125701904296875;
        float _1901 = _1899 * 6.283185482025146484375;
        float _1903 = sin(_1901);
        float _1905 = _1899 * 6.283185482025146484375;
        float _1907 = cos(_1905);
        float _1909 = fma(_1903, _1893, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1911 = _1895 * _1909;
        float _1913 = _1907 + (-1.0);
        float _1915 = fma(_1839, _1911, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1917 = fma(_1835, _1911, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1919 = _1913 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1921 = fma(_1853, _1907, _1919);
        _1885 = _1921;
        _1875 = _1915;
        _1879 = _1917;
        _1863 = _1899;
        _1865 = _1895;
    }
    float _1923 = _1885;
    float _1925 = _1875;
    float _1927 = _1879;
    float _1929 = _1863;
    float _1931 = _1865;
    float _1933 = -_1591;
    float _1935 = _1933 + _1923;
    float _1937 = -_1593;
    float _1939 = _1937 + _1925;
    float _1941 = -_1607;
    float _1943 = _1941 + _1927;
    float _1945 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1947 = _1935 + _1945;
    float _1949 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1951 = _1939 + _1949;
    float _1953 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1955 = _1943 + _1953;
    float _1957 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1959 = _1947 * _1947;
    float _1961 = fma(_1951, _1951, _1959);
    float _1963 = fma(_1955, _1955, _1961);
    float _1965 = rsqrt(_1963);
    float _1967 = _1965 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1969 = _1951 * _1967;
    float _1971 = _1955 * _1967;
    float _1973 = _1969 * _1969;
    float _1975 = _1971 * _1971;
    float _1977 = _1973 + _1975;
    float _1979 = sqrt(_1977);
    bool _1981 = _1979 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1983 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1985 = _1979 + _1983;
    float _1987 = _1929;
    float _1989 = _1977;
    float _1991 = _1985;
    float _1993 = _1973;
    float _1995 = _1975;
    if (_1981)
    {
        float _1997 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1987 = _1997;
    }
    float _1999 = _1987;
    if (_1981)
    {
        float _2001 = rsqrt(_1977);
        _1989 = _2001;
    }
    float _2003 = _1989;
    if (_1981)
    {
        float _2005 = _1985 * _1999;
        _1991 = _2005;
    }
    float _2007 = _1991;
    if (_1981)
    {
        float _2009 = _2007 * 0.15915493667125701904296875;
        _1867 = _2009;
    }
    float _2011 = _1867;
    float _2013 = _1931;
    if (_1981)
    {
        float _2015 = _2011 * 6.283185482025146484375;
        float _2017 = sin(_2015);
        _2013 = _2017;
    }
    float _2019 = _2013;
    float _2021 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2023 = precise::max(0.0, _2021);
    float _2025 = _1689;
    float _2027 = _2023;
    float _2029 = _2021;
    if (_1981)
    {
        float _2031 = _2011 * 6.283185482025146484375;
        float _2033 = cos(_2031);
        _2025 = _2033;
    }
    float _2035 = _2025;
    float _2037 = -_1967;
    float _2039 = -_2023;
    float _2041 = fma(_1947, _2037, _2039);
    if (_1981)
    {
        float _2043 = _2041 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2027 = _2043;
    }
    float _2045 = _2027;
    float _2047 = sqrt(_1963);
    float _2049 = _2019;
    float _2051 = _2045;
    if (_1981)
    {
        float _2053 = fma(_2019, _2045, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1869 = _2053;
    }
    float _2055 = _1869;
    float _2057 = _2055;
    if (!_1981)
    {
        _2049 = _1969;
    }
    float _2059 = _2049;
    float _2061 = _2059;
    if (!_1981)
    {
        _2051 = _2041;
    }
    float _2063 = _2051;
    float _2065 = _2063;
    if (_1981)
    {
        float _2067 = _2035 + (-1.0);
        _2029 = _2067;
    }
    float _2069 = _2029;
    float _2071 = _2069;
    if (_1981)
    {
        float _2073 = _2003 * _2055;
        _2057 = _2073;
    }
    float _2075 = _2057;
    if (_1981)
    {
        float _2077 = _2069 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1871 = _2077;
    }
    float _2079 = _1871;
    if (_1981)
    {
        float _2081 = _1969 * _2075;
        _2061 = _2081;
    }
    float _2083 = _2061;
    if (!_1981)
    {
        _2071 = _1971;
    }
    float _2085 = _2071;
    float _2087 = _2085;
    if (_1981)
    {
        float _2089 = _1971 * _2075;
        _2087 = _2089;
    }
    float _2091 = _2087;
    if (_1981)
    {
        float _2093 = fma(_2041, _2035, _2079);
        _2065 = _2093;
    }
    float _2095 = _2065;
    if (_1981)
    {
        float _2097 = _2083 * _2083;
        _1993 = _2097;
    }
    float _2099 = _1993;
    float _2101 = _1935 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    if (_1981)
    {
        float _2103 = _2091 * _2091;
        _1995 = _2103;
    }
    float _2105 = _1995;
    float _2107 = _1935 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2109 = fma(_2095, _2095, _2099);
    float _2111 = fma(_1939, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2101);
    float _2113 = _1935 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2115 = _1935 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2117 = _2109 + _2105;
    float _2119 = fma(_1939, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2107);
    float _2121 = fma(_1943, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2111);
    float _2123 = fma(_1939, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2113);
    float _2125 = rsqrt(_2117);
    float _2127 = fma(_1939, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2115);
    float _2129 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2131 = fma(_2047, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2129);
    float _2133 = precise::clamp(_2131, 0.0, 1.0);
    float _2135 = fma(_1943, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2119);
    float _2137 = _2121 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2139 = fma(_1943, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2123);
    float _2141 = -_2133;
    float _2143 = _2141 + 1.0;
    float _2145 = _2135 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2147 = _2137 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2149 = fma(_1943, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2127);
    float _2151 = _2139 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2153 = fma(_2145, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2147);
    float _2155 = abs(_2143);
    float _2157 = log2(_2155);
    float _2159 = _2151 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2161 = _2149 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2163 = _2125 * _2083;
    float _2165 = _2125 * _2095;
    float _2167 = _2125 * _2091;
    float _2169 = fma(_2151, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2153);
    float _2171 = _2163 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2173 = -_2159;
    float _2175 = fma(_2173, _1957, 1.0);
    float _2177 = fma(_2161, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2169);
    float _2179 = -_2171;
    float _2181 = fma(_2165, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2179);
    float _2183 = log2(_2175);
    float _2185 = _2137 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2187 = -_2167;
    float _2189 = fma(_2187, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2181);
    float _2191 = _2157 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2193 = _2137 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2195 = fma(_2145, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2185);
    float _2197 = fma(_2189, -0.5, 0.5);
    float _2199 = exp2(_2191);
    float _2201 = fma(_2189, 0.5, 0.5);
    float _2203 = fma(_2145, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2193);
    float _2205 = fma(_2151, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2195);
    float _2207 = _2165 + 1.0;
    float _2209 = fma(_2201, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2211 = fma(_2151, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2203);
    float _2213 = fma(_2161, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2205);
    float _2215 = 1.0 / _2177;
    float _2217 = fma(_2201, _2209, -0.212114393711090087890625);
    float _2219 = fma(_2161, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2211);
    float _2221 = _2183 * 0.693147182464599609375;
    float _2223 = fma(_2201, _2217, 1.570728778839111328125);
    float _2225 = _2221 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2227 = sqrt(_2197);
    float _2229 = -_2165;
    float _2231 = fma(_2199, _2207, _2229);
    float _2233 = fma(_2231, 0.5, 0.5);
    float _2235 = _2213 * _2215;
    float _2237 = _2219 * _2215;
    float _2239 = fma(_2235, 0.5, 0.5);
    float _2241 = fma(_2237, -0.5, 0.5);
    float _2243 = _2227 * 0.636619746685028076171875;
    float _2245 = -_2223;
    float _2247 = fma(_2243, _2245, 1.0);
    float3 _6099 = float3(_2239, _2241, _2225);
    float _2249 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6099, float3(0.0), isnan(_6099)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6099, float3(0.0), isnan(_6099)), level(0.0)).x;
    float3 _6110 = float3(_2239, _2241, _2225);
    float4 _2252 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6110, float3(0.0), isnan(_6110)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6110, float3(0.0), isnan(_6110)), level(0.0)).xyzw;
    float _2254 = _2252.x;
    float _2256 = _2252.y;
    float _2258 = _2252.z;
    float _2260 = _2252.w;
    float2 _6127 = float2(_2247, _2233);
    float3 _2262 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6127, float2(0.0), isnan(_6127)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6127, float2(0.0), isnan(_6127)), level(0.0)).xyz;
    float _2264 = _2262.x;
    float _2266 = _2262.y;
    float _2268 = _2262.z;
    float _2270 = in.m_63.w;
    float _2272 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2274 = _1097 + _2272;
    float _2276 = in.m_57.x;
    float _2278 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2280 = _2278 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2282 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2284 = _2282 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _2286 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2288 = _2286 != 0;
    float _2290 = -_409;
    float _2292 = _2290 + 1.0;
    int _2294 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2296 = _2294 != 0;
    float _2298 = 1.0 / _2280;
    float _2300 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2302 = _2300 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    int _2304 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2306 = _2304 != 0;
    float _2308 = -_1591;
    float _2310 = _1263 + _2308;
    int _2312 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2314 = _2312 != 0;
    float _2316 = -_1593;
    float _2318 = _1297 + _2316;
    float _2320 = -_1607;
    float _2322 = _1313 + _2320;
    float _2324 = 1.0 / _2284;
    float _2326 = _2157 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _2328 = _1185 > 0.5;
    float _2330 = -(*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _2332 = _2330 + (*spvDescriptorSet0.vp_c9)._m0[135].w;
    bool _2334 = _2270 > 0.5;
    float _2336 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _2338 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _2336;
    float _2340 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _2342 = _2340 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _2344 = 1.0 / _2302;
    int _2346 = _2334 ? as_type<int>(_2292) : as_type<int>(_409);
    float _2348 = _2137 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _2350 = _2334;
    if (_2288)
    {
        bool _2352 = _1179 > 0.5;
        _2350 = _2352;
    }
    bool _2354 = _2350;
    float _2356 = _2342 * _2298;
    bool _2358 = _1097 >= (*spvDescriptorSet0.vp_c9)._m0[135].w;
    bool _2360 = isnan(_1097);
    bool _2362 = _2358 || _2360;
    bool _2364 = isnan((*spvDescriptorSet0.vp_c9)._m0[135].w);
    bool _2366 = _2362 || _2364;
    float _2368 = float(_2366);
    float _2370 = fma(_2145, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2348);
    float _2372 = 1.0 / _2332;
    bool _2374 = _1097 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _2376 = isnan(_1097);
    bool _2378 = _2374 || _2376;
    bool _2380 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _2382 = _2378 || _2380;
    float _2384 = float(_2382);
    float _2386 = -_2368;
    float _2388 = _2386 + 1.0;
    bool _2390 = _1097 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2392 = isnan(_1097);
    bool _2394 = _2390 || _2392;
    bool _2396 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2398 = _2394 || _2396;
    float _2400 = float(_2398);
    float _2402 = _2338 * _2324;
    if (_2296)
    {
        bool _2404 = _1107 > 0.5;
        _1343 = _2404;
    }
    bool _2406 = _1343;
    float _2408 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _2410 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _2408;
    bool _2412 = _1097 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _2414 = isnan(_1097);
    bool _2416 = _2412 || _2414;
    bool _2418 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _2420 = _2416 || _2418;
    float _2422 = float(_2420);
    float _2424 = _2384 * _2388;
    float _2426 = -_2384;
    float _2428 = _2426 + 1.0;
    bool _2430 = _1097 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2432 = isnan(_1097);
    bool _2434 = _2430 || _2432;
    bool _2436 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2438 = _2434 || _2436;
    float _2440 = float(_2438);
    float _2442 = -_2400;
    float _2444 = _2442 + 1.0;
    float _2446 = _2410 * _2344;
    float _2448 = _2422 * _2428;
    float _2450 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2452 = _1097 + _2450;
    float _2454 = fma(_2402, _2274, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _2456 = -(*spvDescriptorSet0.vp_c9)._m0[134].x;
    float _2458 = _2456 + (*spvDescriptorSet0.vp_c9)._m0[135].x;
    float _2460 = _2440 * _2444;
    float _2462 = fma(_2356, _2452, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _2464 = _2306 ? as_type<float>(_2346) : _409;
    float _2466 = _2458 * _2372;
    float _2468 = _2454 * _2460;
    float _2470 = -_2422;
    float _2472 = _2470 + 1.0;
    float _2474 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2476 = -_2440;
    float _2478 = _2476 + 1.0;
    float _2480 = _2440;
    if (_2314)
    {
        float _2482 = _2328 ? _2292 : _409;
        _497 = _2482;
    }
    float _2484 = _497;
    float _2486 = _2400 * _2472;
    float _2488 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2490 = _1097 + _2488;
    float _2492 = fma(_2478, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2468);
    float _2494 = -(*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _2496 = _1097 + _2494;
    float _2498 = _2276;
    if (_2296)
    {
        float _2500 = -_2276;
        float _2502 = _2500 + 1.0;
        _1345 = as_type<int>(_2502);
    }
    int _2504 = _1345;
    float _2506 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2508 = fma(_2446, _2490, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _2510 = fma(_2462, _2486, _2492);
    int _2512 = _2504;
    if (!_2296)
    {
        _2480 = _2276;
    }
    float _2514 = _2480;
    float _2516 = fma(_2466, _2496, (*spvDescriptorSet0.vp_c9)._m0[134].x);
    float _2518 = _2514;
    if (_2296)
    {
        float _2520 = _2406 ? as_type<float>(_2504) : _2276;
        _2518 = _2520;
    }
    float _2522 = _2518;
    float _2524 = fma(_2508, _2448, _2510);
    bool _2526 = _1799 != 0.0;
    bool _2528 = isnan(_1799);
    bool _2530 = _2526 || _2528;
    bool _2532 = isnan(0.0);
    bool _2534 = _2530 || _2532;
    float _2536 = _2474 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    if (_2288)
    {
        float _2538 = -_2276;
        float _2540 = _2538 + 1.0;
        _2512 = as_type<int>(_2540);
    }
    int _2542 = _2512;
    float _2544 = fma(_2516, _2424, _2524);
    bool _2546 = _1801 == 0.0;
    bool _2548 = !_2534;
    bool _2550 = _2546 && _2548;
    float _2552 = fma(_2536, _2522, -0.5);
    float _2554 = in.m_69.w;
    float _2556 = fma(_2368, (*spvDescriptorSet0.vp_c9)._m0[135].x, _2544);
    bool _2558 = _1803 == 0.0;
    bool _2560 = _2558 && _2550;
    float _2562 = _2506 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2564 = fma(_1415, _2552, _1253);
    float _2566 = _2464 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2568 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2570 = fma(_2562, _2484, -0.5);
    if (_2288)
    {
        float _2572 = _2354 ? as_type<float>(_2542) : _2276;
        _2498 = _2572;
    }
    float _2574 = _2498;
    float _2576 = _2556 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2578 = -_1427;
    float _2580 = fma(_1419, _2570, _2578);
    float _2582 = in.m_71.x;
    float _2584 = in.m_71.y;
    float _2586 = in.m_71.z;
    float _2588 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2590 = _2574 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2592 = _2580 + 0.5;
    float _2594 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2596 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2598 = _2566 * _2568;
    float _2600 = _2564 + 0.5;
    float _2602 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2604 = _2594 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2606 = _2596 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_73.w = _2554;
    float _2608 = _2602 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2610 = exp2(_2326);
    float _2612 = _2590 * _2588;
    out.m_75.x = _2604;
    out.m_75.y = _2606;
    out.m_75.z = _2608;
    out.m_75.w = _2576;
    float _2614 = _2584;
    float _2616 = _2582;
    float _2618 = _2586;
    if (!_2560)
    {
        float _2620 = fma(_1799, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2584);
        _2614 = _2620;
    }
    float _2622 = _2614;
    if (!_2560)
    {
        float _2624 = fma(_1801, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2582);
        _2616 = _2624;
    }
    float _2626 = _2616;
    out.m_77.x = _2600;
    out.m_77.y = _2592;
    out.m_77.z = _2612;
    out.m_77.w = _2598;
    if (!_2560)
    {
        float _2628 = fma(_1803, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2586);
        _2618 = _2628;
    }
    float _2630 = _2618;
    float _2632 = _1759 * _2622;
    float _2634 = _1761 * _2622;
    float _2636 = _1773 * _2622;
    bool _2638 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2640 = isnan(0.5);
    bool _2642 = _2638 || _2640;
    bool _2644 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2646 = _2642 || _2644;
    float _2648 = fma(_1763, _2626, _2632);
    float _2650 = fma(_1765, _2626, _2634);
    float _2652 = fma(_1771, _2626, _2636);
    float _2654 = fma(_1767, _2630, _2648);
    float _2656 = fma(_1769, _2630, _2650);
    float _2658 = fma(_1775, _2630, _2652);
    float _2660 = _2310 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2662 = _2310 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    out.m_79.x = _2654;
    out.m_79.y = _2656;
    out.m_79.z = _2658;
    float _2664 = fma(_2318, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2660);
    float _2666 = fma(_2318, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2662);
    float _2668 = fma(_2151, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2370);
    float _2670 = fma(_2322, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2664);
    float _2672 = fma(_2322, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2666);
    float _2674 = fma(_2161, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2668);
    float _2676 = _2670 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2678 = _2672 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2680 = 1.0 / _2676;
    float _2682 = _2678 + _2676;
    float _2684 = _2676;
    if (_2646)
    {
        _2684 = 1.0;
    }
    float _2686 = _2684;
    float _2688 = _2682 * _2680;
    float _2690 = _2688 * 0.5;
    float _2692 = _2686;
    if (!_2646)
    {
        float _2694 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2696 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2698 = _2694 * 0.15915493667125701904296875;
        float _2700 = _2696 * 0.15915493667125701904296875;
        float _2702 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _2704 = fma(_2690, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2702);
        float _2706 = _2698 * 6.283185482025146484375;
        float _2708 = cos(_2706);
        float _2710 = _2698 * 6.283185482025146484375;
        float _2712 = sin(_2710);
        float _2714 = 1.0 / _2708;
        float _2716 = _2700 * 6.283185482025146484375;
        float _2718 = cos(_2716);
        float _2720 = _2712 * _2714;
        float _2722 = _2700 * 6.283185482025146484375;
        float _2724 = sin(_2722);
        float _2726 = _2718 * _2720;
        float _2728 = 1.0 / _2704;
        float _2730 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2732 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2730;
        float _2734 = 1.0 / _2726;
        float _2736 = 1.0 / _2732;
        float _2738 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2740 = _2728 * _2738;
        float _2742 = _2724 * _2734;
        float _2744 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2746 = fma(_2742, _2740, _2744);
        float _2748 = _2746 * _2736;
        float _2750 = precise::clamp(_2748, 0.0, 1.0);
        _2692 = _2750;
    }
    float _2752 = _2692;
    float _2754 = _2674 + _2177;
    float _2756 = -_2610;
    float _2758 = _2756 + 1.0;
    bool _2760 = _2752 > 0.0;
    bool _2762 = isnan(_2752);
    bool _2764 = _2760 || _2762;
    bool _2766 = isnan(0.0);
    bool _2768 = _2764 || _2766;
    float _2770 = _2752 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2772 = _2754 * 0.5;
    float _2774 = _2758 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_81.x = _1951;
    out.m_81.y = _1947;
    out.m_81.z = _1955;
    float _2776 = _2770 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2778 = _2774 * _2249;
    float _2780 = -_2774;
    float _2782 = _2780 + 1.0;
    out.gl_Position.x = _2213;
    out.gl_Position.y = _2219;
    out.gl_Position.z = _2674;
    out.gl_Position.w = _2177;
    float _2784 = _2260 * _2778;
    float _2786 = _2268 * _2778;
    float _2788 = _2260 * _2782;
    out.m_83.z = _2772;
    out.m_83.w = _2177;
    float _2790 = fma(_2264, _2784, _2254);
    float _2792 = fma(_2266, _2784, _2256);
    float _2794 = fma(_2260, _2786, _2258);
    out.m_47.x = _2776;
    out.m_85.x = _2790;
    out.m_85.y = _2792;
    out.m_85.z = _2794;
    out.m_85.w = _2788;
    if (_2768)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_47.x = 0.0;
    float _2796 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2796;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1089 = false;
    bool _947 = false;
    bool _767 = false;
    bool _607 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _103 = in.m_44.w;
    float _105 = trunc(_103);
    int _107 = int(_105);
    bool _111 = _107 >= 1;
    float _113 = 0.0;
    if (!_111)
    {
        _113 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _115 = _113;
    float _117 = _115;
    if (!_111)
    {
        out.m_47.x = 0.0;
    }
    int _119 = 0;
    if (!_111)
    {
        float _121 = _115 * 5.0;
        _119 = as_type<int>(_121);
    }
    int _123 = _119;
    int _125 = _123;
    if (!_111)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2853 = as_type<float>(_123);
        out.gl_Position.z = _2853;
    }
    if (!_111)
    {
        return out;
    }
    float _127 = in.m_49.w;
    bool _129 = _127 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _131 = isnan(_127);
    bool _133 = _129 || _131;
    bool _135 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _137 = _133 || _135;
    float _139 = -_127;
    float _141 = _139 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _143 = 0.0;
    float _145 = 0.0;
    float _147 = _141;
    if (_137)
    {
        float _149 = float(_107);
        _143 = _149;
    }
    float _151 = _143;
    bool _153 = _141 >= _151;
    bool _155 = !_137;
    bool _157 = _153 || _155;
    if (_157)
    {
        _117 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _159 = _117;
    if (_157)
    {
        out.m_47.x = 0.0;
    }
    if (_157)
    {
        float _161 = _159 * 5.0;
        _125 = as_type<int>(_161);
    }
    int _163 = _125;
    float _165 = as_type<float>(_163);
    if (_157)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2924 = as_type<float>(_163);
        out.gl_Position.z = _2924;
    }
    if (_157)
    {
        return out;
    }
    float _167 = in.m_51.y;
    float _169 = _141 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _171 = in.m_53.y;
    bool _173 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _175 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _177 = _173 || _175;
    bool _179 = isnan(1.0);
    bool _181 = _177 || _179;
    float _183 = in.m_55.y;
    float _185 = in.m_51.z;
    float _187 = in.m_53.z;
    float _189 = _169;
    if (!_181)
    {
        float _191 = _169 * _169;
        float _193 = _191 * 0.5;
        _165 = _193;
    }
    float _195 = _165;
    float _197 = 0.0;
    float _199 = _195;
    if (!_181)
    {
        float _201 = _141 * _141;
        float _203 = _201 * 0.5;
        _197 = _203;
    }
    float _205 = _197;
    float _207 = in.m_55.z;
    if (!_181)
    {
        float _209 = _195 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _199 = _209;
    }
    float _211 = _199;
    float _213 = _167 * _167;
    float _215 = fma(_171, _171, _213);
    float _217 = fma(_183, _183, _215);
    float _219 = in.m_49.x;
    float _221 = in.m_49.y;
    float _223 = in.m_49.z;
    float _225 = sqrt(_217);
    bool _227 = _225 > 0.0;
    float _229 = _185 * _185;
    float _231 = fma(_187, _187, _229);
    bool _233 = !_181;
    float _235 = _211;
    float _237 = _231;
    if (!_233)
    {
        float _239 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _241 = log2(_239);
        float _243 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _245 = _243 + 1.0;
        float _247 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _249 = _169 * _241;
        float _251 = 1.0 / _245;
        float _253 = _247 * 0.693147182464599609375;
        float _255 = exp2(_249);
        float _257 = 1.0 / _253;
        float _259 = _255 + (-1.0);
        float _261 = -_259;
        float _263 = fma(_261, _257, _169);
        float _265 = _263 * _251;
        float _267 = _265 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _145 = _257;
        _235 = _267;
    }
    float _269 = _145;
    float _271 = _235;
    bool _273 = !_181;
    float _275 = _269;
    if (!_273)
    {
        float _277 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _279 = log2(_277);
        float _281 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _283 = _281 + 1.0;
        float _285 = 1.0 / _283;
        float _287 = _169 * _279;
        float _289 = exp2(_287);
        float _291 = -_289;
        float _293 = _291 + 1.0;
        float _295 = _293 * _285;
        _275 = _283;
        _189 = _295;
    }
    float _297 = _275;
    float _299 = _189;
    float _301 = fma(_207, _207, _231);
    float _303 = _297;
    if (!_181)
    {
        _303 = _141;
    }
    float _305 = _303;
    float _307 = _305;
    if (!_181)
    {
        float _309 = _205 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _237 = _309;
    }
    float _311 = _237;
    bool _313 = !_181;
    float _315 = _311;
    if (!_313)
    {
        float _317 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _319 = log2(_317);
        float _321 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _323 = _321 + 1.0;
        float _325 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _327 = _141 * _319;
        float _329 = 1.0 / _323;
        float _331 = _325 * 0.693147182464599609375;
        float _333 = exp2(_327);
        float _335 = 1.0 / _331;
        float _337 = _333 + (-1.0);
        float _339 = -_337;
        float _341 = fma(_339, _335, _141);
        float _343 = _341 * _329;
        float _345 = _343 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _315 = _345;
    }
    float _347 = _315;
    bool _349 = !_181;
    if (!_349)
    {
        float _351 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _353 = log2(_351);
        float _355 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _357 = _355 + 1.0;
        float _359 = 1.0 / _357;
        float _361 = _141 * _353;
        float _363 = exp2(_361);
        float _365 = -_363;
        float _367 = _365 + 1.0;
        float _369 = _367 * _359;
        _307 = _369;
    }
    float _371 = _307;
    float _373 = _271 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _375 = _347 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _377 = _271 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _379 = _347 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _381 = fma(_299, _221, _373);
    float _383 = fma(_371, _221, _375);
    float _385 = sqrt(_301);
    float _387 = _271 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _389 = fma(_299, _219, _377);
    float _391 = _347 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _393 = fma(_371, _219, _379);
    float _395 = -_383;
    float _397 = _381 + _395;
    float _399 = fma(_299, _223, _387);
    float _401 = fma(_371, _223, _391);
    float _403 = -_393;
    float _405 = _389 + _403;
    float _407 = _397 * _397;
    float _409 = in.m_57.y;
    float _411 = -_401;
    float _413 = _399 + _411;
    float _415 = _391;
    float _417 = _399;
    if (_227)
    {
        float _419 = rsqrt(_217);
        _415 = _419;
    }
    float _421 = _415;
    float _423 = fma(_405, _405, _407);
    float _425 = in.m_53.x;
    float _427 = 0.0;
    if (!_227)
    {
        _427 = 0.0;
    }
    float _429 = _427;
    float _431 = _397 * _183;
    float _433 = fma(_413, _413, _423);
    bool _435 = _385 > 0.0;
    float _437 = in.m_51.x;
    float _439 = 0.0;
    float _441 = _429;
    if (!_227)
    {
        _439 = 0.0;
    }
    float _443 = _439;
    float _445 = _397 * _167;
    float _447 = 0.0;
    float _449 = _443;
    if (!_227)
    {
        _447 = 0.0;
    }
    float _451 = _447;
    float _453 = in.m_55.x;
    float _455 = sqrt(_433);
    float _457 = in.m_59.w;
    float _459 = _451;
    if (_227)
    {
        float _461 = _421 * _171;
        _441 = _461;
    }
    float _463 = _441;
    float _465 = _463;
    if (_227)
    {
        float _467 = _421 * _167;
        _449 = _467;
    }
    float _469 = _449;
    float _471 = _469;
    if (_227)
    {
        float _473 = _421 * _183;
        _459 = _473;
    }
    float _475 = _459;
    float _477 = in.m_44.x;
    float _479 = in.m_44.y;
    float _481 = in.m_44.z;
    float _483 = 0.0;
    if (_435)
    {
        float _485 = rsqrt(_301);
        _483 = _485;
    }
    float _487 = _483;
    float _489 = 0.0;
    if (!_435)
    {
        _489 = 0.0;
    }
    float _491 = _489;
    out.m_61.y = _409;
    float _493 = 0.0;
    float _495 = _491;
    float _497 = _409;
    if (!_435)
    {
        _493 = 0.0;
    }
    float _499 = _493;
    float _501 = 0.0;
    float _503 = _499;
    if (!_435)
    {
        _501 = 0.0;
    }
    float _505 = _501;
    bool _507 = _455 >= 9.9999999747524270787835121154785e-07;
    bool _509 = isnan(_455);
    bool _511 = _507 || _509;
    bool _513 = isnan(9.9999999747524270787835121154785e-07);
    bool _515 = _511 || _513;
    float _517 = _397 * _171;
    float _519 = fma(_405, _437, _445);
    float _521 = fma(_405, _425, _517);
    float _523 = fma(_405, _453, _431);
    float _525 = _505;
    float _527 = _523;
    if (_435)
    {
        float _529 = _487 * _187;
        _495 = _529;
    }
    float _531 = _495;
    if (_435)
    {
        float _533 = _487 * _185;
        _503 = _533;
    }
    float _535 = _503;
    if (_435)
    {
        float _537 = _487 * _207;
        _525 = _537;
    }
    float _539 = _525;
    float _541 = fma(_413, _187, _521);
    float _543 = fma(_413, _185, _519);
    float _545 = fma(_413, _207, _523);
    float _547 = fma(_399, _457, _481);
    float _549 = fma(_389, _457, _477);
    float _551 = fma(_381, _457, _479);
    float _553 = _543;
    float _555 = _543;
    if (_515)
    {
        _527 = _541;
    }
    float _557 = _527;
    float _559 = _557;
    float _561 = _557;
    if (_515)
    {
        _417 = _545;
    }
    float _563 = _417;
    float _565 = _563;
    float _567 = _563;
    if (!_515)
    {
        bool _569 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _571 = !_569;
        if (!_571)
        {
            float _573 = _167 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _575 = _171 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _577 = _183 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _579 = fma(_437, (*spvDescriptorSet0.vp_c9)._m0[16].x, _573);
            float _581 = fma(_425, (*spvDescriptorSet0.vp_c9)._m0[16].x, _575);
            float _583 = fma(_453, (*spvDescriptorSet0.vp_c9)._m0[16].x, _577);
            float _585 = fma(_185, (*spvDescriptorSet0.vp_c9)._m0[16].z, _579);
            float _587 = fma(_187, (*spvDescriptorSet0.vp_c9)._m0[16].z, _581);
            float _589 = fma(_207, (*spvDescriptorSet0.vp_c9)._m0[16].z, _583);
            float _591 = _585 * _585;
            float _593 = fma(_587, _587, _591);
            float _595 = fma(_589, _589, _593);
            float _597 = rsqrt(_595);
            float _599 = _597 * 9.9999999747524270787835121154785e-07;
            float _601 = _587 * _599;
            float _603 = _585 * _599;
            float _605 = _589 * _599;
            _555 = _603;
            _561 = _601;
            _567 = _605;
            _607 = true;
        }
        else
        {
            float _609 = _221 * _221;
            float _611 = fma(_219, _219, _609);
            float _613 = fma(_223, _223, _611);
            float _615 = sqrt(_613);
            bool _617 = _615 >= 9.9999999747524270787835121154785e-07;
            bool _619 = isnan(_615);
            bool _621 = _617 || _619;
            bool _623 = isnan(9.9999999747524270787835121154785e-07);
            bool _625 = _621 || _623;
            if (!_625)
            {
                float _627 = _479 * _479;
                float _629 = fma(_477, _477, _627);
                float _631 = fma(_481, _481, _629);
                float _633 = sqrt(_631);
                bool _635 = _633 >= 9.9999999747524270787835121154785e-07;
                bool _637 = isnan(_633);
                bool _639 = _635 || _637;
                bool _641 = isnan(9.9999999747524270787835121154785e-07);
                bool _643 = _639 || _641;
                float _645 = _217;
                if (!_643)
                {
                    float _647 = rsqrt(_217);
                    _645 = _647;
                }
                float _649 = _645;
                if (!_643)
                {
                    float _651 = _649 * 9.9999999747524270787835121154785e-07;
                    _565 = _651;
                }
                float _653 = _565;
                float _655 = _653;
                if (!_643)
                {
                    float _657 = _171 * _653;
                    _559 = _657;
                }
                float _659 = _559;
                _561 = _659;
                if (!_643)
                {
                    float _661 = _167 * _653;
                    _553 = _661;
                }
                float _663 = _553;
                _555 = _663;
                if (!_643)
                {
                    float _665 = _183 * _653;
                    _655 = _665;
                }
                float _667 = _655;
                bool _669 = !_643;
                _567 = _667;
                _607 = _669;
                if (!_607)
                {
                    float _671 = _167 * _479;
                    float _673 = _171 * _479;
                    float _675 = _183 * _479;
                    float _677 = fma(_477, _437, _671);
                    float _679 = fma(_477, _425, _673);
                    float _681 = fma(_477, _453, _675);
                    float _683 = fma(_185, _481, _677);
                    float _685 = fma(_187, _481, _679);
                    float _687 = fma(_207, _481, _681);
                    float _689 = _683 * _683;
                    float _691 = fma(_685, _685, _689);
                    float _693 = fma(_687, _687, _691);
                    float _695 = rsqrt(_693);
                    float _697 = _695 * 9.9999999747524270787835121154785e-07;
                    float _699 = _685 * _697;
                    float _701 = _683 * _697;
                    float _703 = _687 * _697;
                    _555 = _701;
                    _561 = _699;
                    _567 = _703;
                    _607 = true;
                }
            }
            else
            {
                float _705 = _167 * _221;
                float _707 = _171 * _221;
                float _709 = _183 * _221;
                float _711 = fma(_219, _437, _705);
                float _713 = fma(_219, _425, _707);
                float _715 = fma(_219, _453, _709);
                float _717 = fma(_185, _223, _711);
                float _719 = fma(_187, _223, _713);
                float _721 = fma(_207, _223, _715);
                float _723 = _717 * _717;
                float _725 = fma(_719, _719, _723);
                float _727 = fma(_721, _721, _725);
                float _729 = rsqrt(_727);
                float _731 = _729 * 9.9999999747524270787835121154785e-07;
                float _733 = _719 * _731;
                float _735 = _717 * _731;
                float _737 = _721 * _731;
                _555 = _735;
                _561 = _733;
                _567 = _737;
            }
        }
    }
    _607 = false;
    float _739 = _555;
    float _741 = _561;
    float _743 = _567;
    bool _745 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _747 = !_745;
    float _765;
    if (!_747)
    {
        float _749 = in.m_63.x;
        float _751 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _753 = _749 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _755 = fma(_753, (*spvDescriptorSet0.vp_c9)._m0[12].x, _141);
        float _757 = _755 * _751;
        float _759 = floor(_757);
        float _761 = -_759;
        float _763 = _757 + _761;
        _765 = _763;
        _767 = true;
    }
    else
    {
        float _769 = float(_107);
        float _771 = 1.0 / _769;
        float _773 = _141 * _771;
        _765 = _773;
    }
    _767 = false;
    float _775 = _765;
    float _777 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _779 = _775 + _777;
    bool _781 = _775 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _783 = isnan(_775);
    bool _785 = _781 || _783;
    bool _787 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _789 = _785 || _787;
    float _791 = float(_789);
    float _793 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _795 = _775 + _793;
    bool _797 = _775 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _799 = isnan(_775);
    bool _801 = _797 || _799;
    bool _803 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _805 = _801 || _803;
    float _807 = float(_805);
    float _809 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _811 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _809;
    float _813 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _815 = _813 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _817 = _775 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _819 = isnan(_775);
    bool _821 = _817 || _819;
    bool _823 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _825 = _821 || _823;
    float _827 = float(_825);
    float _829 = -_791;
    float _831 = _829 + 1.0;
    float _833 = 1.0 / _815;
    float _835 = _827 * _831;
    float _837 = -_827;
    float _839 = _837 + 1.0;
    float _841 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _843 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _841;
    bool _845 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _847 = 1.0 / _811;
    float _849 = _807 * _839;
    float _851 = -_807;
    float _853 = _851 + 1.0;
    float _855 = _795 * _833;
    float _857 = _779 * _847;
    float _859 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _861 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _859;
    float _863 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _865 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _863;
    float _867 = fma(_843, _857, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _869 = fma(_861, _857, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _871 = fma(_865, _857, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _873 = in.m_59.x;
    float _875 = in.m_59.y;
    float _877 = in.m_59.z;
    float _879 = _867 * _849;
    float _881 = _869 * _849;
    float _883 = _871 * _849;
    float _885 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _887 = _885 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _889 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _891 = _889 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _893 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _895 = _893 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _897 = fma(_853, (*spvDescriptorSet0.vp_c9)._m0[143].y, _881);
    float _899 = fma(_887, _855, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _901 = fma(_891, _855, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _903 = fma(_895, _855, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _905 = fma(_853, (*spvDescriptorSet0.vp_c9)._m0[143].x, _879);
    float _907 = fma(_853, (*spvDescriptorSet0.vp_c9)._m0[143].z, _883);
    float _909 = fma(_901, _835, _897);
    float _911 = fma(_899, _835, _905);
    float _913 = fma(_903, _835, _907);
    float _915 = fma(_791, (*spvDescriptorSet0.vp_c9)._m0[145].y, _909);
    float _917 = fma(_791, (*spvDescriptorSet0.vp_c9)._m0[145].x, _911);
    float _919 = fma(_791, (*spvDescriptorSet0.vp_c9)._m0[145].z, _913);
    float _921 = _917 * _873;
    float _923 = _915 * _875;
    float _925 = _919 * _877;
    bool _927 = !_845;
    float _945;
    if (!_927)
    {
        float _929 = in.m_63.x;
        float _931 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _933 = _929 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _935 = fma(_933, (*spvDescriptorSet0.vp_c9)._m0[11].y, _141);
        float _937 = _935 * _931;
        float _939 = floor(_937);
        float _941 = -_939;
        float _943 = _937 + _941;
        _945 = _943;
        _947 = true;
    }
    else
    {
        float _949 = float(_107);
        float _951 = 1.0 / _949;
        float _953 = _141 * _951;
        _945 = _953;
    }
    _947 = false;
    float _955 = _945;
    float _957 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _959 = _955 + _957;
    float _961 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _963 = _961 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _965 = _955 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _967 = isnan(_955);
    bool _969 = _965 || _967;
    bool _971 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _973 = _969 || _971;
    float _975 = float(_973);
    float _977 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _979 = _977 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _981 = _955 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _983 = isnan(_955);
    bool _985 = _981 || _983;
    bool _987 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _989 = _985 || _987;
    float _991 = float(_989);
    float _993 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _995 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _993;
    bool _997 = _955 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _999 = isnan(_955);
    bool _1001 = _997 || _999;
    bool _1003 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1005 = _1001 || _1003;
    float _1007 = float(_1005);
    float _1009 = 1.0 / _963;
    float _1011 = -_975;
    float _1013 = _1011 + 1.0;
    bool _1015 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _1017 = -_1007;
    float _1019 = _1017 + 1.0;
    float _1021 = 1.0 / _979;
    float _1023 = _975 * _1019;
    float _1025 = _995 * _1009;
    float _1027 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1029 = _1027 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1031 = fma(_1025, _959, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1033 = _991 * _1013;
    float _1035 = -_991;
    float _1037 = _1035 + 1.0;
    float _1039 = _1029 * _1021;
    float _1041 = _1031 * _1033;
    float _1043 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1045 = _955 + _1043;
    float _1047 = fma(_1037, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1041);
    float _1049 = fma(_1039, _1045, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1051 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1053 = fma(_1049, _1023, _1047);
    float _1055 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1057 = _1051 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1059 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1061 = fma(_1007, (*spvDescriptorSet0.vp_c9)._m0[117].x, _1053);
    float _1063 = _1055 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1065 = _1059 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1067 = _1061 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_65.x = _1057;
    out.m_65.y = _1063;
    out.m_65.z = _1065;
    out.m_65.w = _1067;
    bool _1069 = !_1015;
    float _1087;
    if (!_1069)
    {
        float _1071 = in.m_63.x;
        float _1073 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _1075 = _1071 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _1077 = fma(_1075, (*spvDescriptorSet0.vp_c9)._m0[11].w, _141);
        float _1079 = _1077 * _1073;
        float _1081 = floor(_1079);
        float _1083 = -_1081;
        float _1085 = _1079 + _1083;
        _1087 = _1085;
        _1089 = true;
    }
    else
    {
        float _1091 = float(_107);
        float _1093 = 1.0 / _1091;
        float _1095 = _141 * _1093;
        _1087 = _1095;
    }
    _1089 = false;
    float _1097 = _1087;
    int _1099 = int2(spvDescriptorSet0.vp_t_tcb_C.get_width(), spvDescriptorSet0.vp_t_tcb_C.get_height()).x;
    int _1101 = _1099;
    int _1103 = 0;
    int _1105 = _98(_1101, _1103, (*spvDescriptorSet0.support_buffer));
    float _1107 = in.m_63.x;
    float _1109 = in.m_57.z;
    float _1111 = _1107 * 5.0;
    float _1113 = rint(_1111);
    float _1115 = _1113 * 0.20000000298023223876953125;
    float _1117 = precise::clamp(_1115, 0.0, 1.0);
    int _1119 = _1105 + (-1);
    float _1121 = trunc(_1109);
    int _1123 = int(_1121);
    float _1125 = float(_1119);
    float _1127 = _1117 * _1125;
    float _1129 = trunc(_1127);
    int _1131 = int(_1129);
    int _1133 = _1131 + 1;
    int _1135 = min(_1119, _1133);
    int _1137 = _1131;
    int _1139 = 0;
    int _1141 = _99(_1137, _1139, (*spvDescriptorSet0.support_buffer));
    int _1143 = _1123;
    int _1145 = 0;
    int _1147 = _99(_1143, _1145, (*spvDescriptorSet0.support_buffer));
    float3 _1151 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_1141, _1147)), 0).xyz;
    float _1153 = _1151.x;
    float _1155 = _1151.y;
    float _1157 = _1151.z;
    int _1159 = _1135;
    int _1161 = 0;
    int _1163 = _99(_1159, _1161, (*spvDescriptorSet0.support_buffer));
    int _1165 = _1123;
    int _1167 = 0;
    int _1169 = _99(_1165, _1167, (*spvDescriptorSet0.support_buffer));
    float3 _1171 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_1163, _1169)), 0).xyz;
    float _1173 = _1171.x;
    float _1175 = _1171.y;
    float _1177 = _1171.z;
    float _1179 = in.m_63.z;
    float _1181 = _551 * _167;
    float _1183 = _551 * _183;
    float _1185 = in.m_63.y;
    float _1187 = fma(_549, _437, _1181);
    float _1189 = _551 * _171;
    int _1191 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1193 = _1191 != 0;
    int _1195 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1197 = _1195 != 0;
    int _1199 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1201 = _1199 != 0;
    float _1203 = _1107 * 2.0;
    float _1205 = fma(_547, _185, _1187);
    float _1207 = fma(_549, _453, _1183);
    float _1209 = fma(_549, _425, _1189);
    float _1211 = in.m_51.w;
    float _1213 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1215 = fma(_547, _187, _1209);
    float _1217 = fma(_547, _207, _1207);
    float _1219 = -_1213;
    float _1221 = fma(_1203, (*spvDescriptorSet0.vp_c9)._m0[77].x, _1219);
    float _1223 = _739 * _739;
    float _1225 = floor(_1203);
    float _1227 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1229 = in.m_53.w;
    float _1231 = _1179 * 2.0;
    float _1233 = fma(_741, _741, _1223);
    float _1235 = in.m_55.w;
    float _1237 = _1185 + _1179;
    float _1239 = floor(_1231);
    float _1241 = _1185 * 2.0;
    float _1243 = fma(_743, _743, _1233);
    float _1245 = _1237 + (-1.0);
    bool _1247 = !_1197;
    int _1249 = _1247 ? 0 : 1;
    float _1251 = -_141;
    float _1253 = fma(_1251, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1221);
    float _1255 = fma(_1245, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1257 = floor(_1241);
    float _1259 = _1185 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _1261 = _1225 > 0.0;
    float _1263 = _1205 + _1211;
    bool _1265 = _1225 >= 0.0;
    bool _1267 = isnan(_1225);
    bool _1269 = _1265 || _1267;
    bool _1271 = isnan(0.0);
    bool _1273 = _1269 || _1271;
    float _1275 = fma(_1259, -2.0, _1227);
    float _1277 = _1107 + _1185;
    float _1279 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1281 = log2(_1279);
    bool _1283 = _1239 > 0.0;
    float _1285 = _1277 + (-1.0);
    bool _1287 = _1239 >= 0.0;
    bool _1289 = isnan(_1239);
    bool _1291 = _1287 || _1289;
    bool _1293 = isnan(0.0);
    bool _1295 = _1291 || _1293;
    float _1297 = _1215 + _1229;
    float _1299 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1301 = 1.0 + _1299;
    float _1303 = fma(_1285, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _1305 = !_1193;
    int _1307 = _1305 ? 0 : 1;
    float _1309 = rsqrt(_1243);
    int _1311 = _1295 ? 0 : 1;
    float _1313 = _1217 + _1235;
    int _1315 = abs(_1307);
    int _1317 = ~_1311;
    int _1319 = _1317 + 1;
    int _1321 = _1319 + 1;
    float _1323 = 1.0 / _1301;
    float _1325 = _1281 * _141;
    int _1327 = _1273 ? 0 : 1;
    bool _1329 = _1257 > 0.0;
    bool _1331 = _1257 >= 0.0;
    bool _1333 = isnan(_1257);
    bool _1335 = _1331 || _1333;
    bool _1337 = isnan(0.0);
    bool _1339 = _1335 || _1337;
    int _1341 = _1321;
    bool _1343 = _1197;
    int _1345 = as_type<int>(_1097);
    if (!_1283)
    {
        int _1347 = ~_1311;
        int _1349 = _1347 + 1;
        _1341 = _1349;
    }
    int _1351 = _1341;
    float _1353 = exp2(_1325);
    int _1355 = ~_1327;
    int _1357 = _1355 + 1;
    int _1359 = _1357 + 1;
    float _1361 = _1309 * _741;
    int _1363 = _1359;
    if (!_1261)
    {
        int _1365 = ~_1327;
        int _1367 = _1365 + 1;
        _1363 = _1367;
    }
    int _1369 = _1363;
    float _1371 = _1309 * _739;
    float _1373 = _1309 * _743;
    float _1375 = float(_1315);
    float _1377 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1379 = float(_1351);
    float _1381 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _1383 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1385 = isnan(1.0);
    bool _1387 = _1383 || _1385;
    bool _1389 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1391 = _1387 || _1389;
    float _1393 = fma(_1107, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1377);
    bool _1395 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1397 = isnan(0.0);
    bool _1399 = _1395 || _1397;
    bool _1401 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1403 = _1399 || _1401;
    float _1405 = _1375 * _1379;
    float _1407 = fma(_1185, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1381);
    float _1409 = in.m_67.x;
    float _1411 = in.m_67.y;
    float _1413 = in.m_67.z;
    float _1415 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1393);
    int _1417 = _1339 ? 0 : 1;
    float _1419 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1407);
    int _1421 = abs(_1249);
    float _1423 = -_1353;
    float _1425 = _1423 + 1.0;
    float _1427 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1275);
    float _1429 = _1371 * _469;
    float _1431 = _1405 * (-2.0);
    float _1433 = float(_1421);
    float _1435 = _1403 ? _1425 : 0.0;
    float _1437 = fma(_1361, _463, _1429);
    float _1439 = float(_1369);
    int _1441 = ~_1417;
    int _1443 = _1441 + 1;
    int _1445 = _1443 + 1;
    float _1447 = fma(_1373, _475, _1437);
    int _1449 = _1445;
    if (_1391)
    {
        float _1451 = _1435 * _1323;
        _147 = _1451;
    }
    float _1453 = _147;
    float _1455 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1457 = _1263 + _1455;
    if (!_1329)
    {
        int _1459 = ~_1417;
        int _1461 = _1459 + 1;
        _1449 = _1461;
    }
    int _1463 = _1449;
    float _1465 = fma(_1303, _1431, _1303);
    float _1467 = abs(_1447);
    bool _1469 = _1467 > 0.99989998340606689453125;
    float _1471 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1473 = _1297 + _1471;
    float _1475 = _1457 * _1457;
    float _1477 = _1433 * _1439;
    float _1479 = fma(_1431, _1409, _1409);
    float _1481 = _1107 + (-0.5);
    bool _1483 = !_1201;
    int _1485 = _1483 ? 0 : 1;
    float _1487 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1489 = _1313 + _1487;
    float _1491 = fma(_1473, _1473, _1475);
    float _1493 = _1477 * (-2.0);
    float _1495 = fma(_1481, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1479);
    int _1497 = abs(_1485);
    float _1499 = fma(_1489, _1489, _1491);
    float _1501 = fma(_1255, _1493, _1255);
    float _1503 = fma(_1493, _1411, _1411);
    float _1505 = fma(_1465, _1453, _1495);
    float _1507 = _1185 + (-0.5);
    float _1509 = float(_1497);
    float _1511 = _1107 + _1179;
    float _1513 = float(_1463);
    float _1515 = rsqrt(_1499);
    float _1517 = fma(_1507, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1503);
    float _1519 = _1511 + (-1.0);
    float _1521 = _1509 * _1513;
    if (_1469)
    {
        float _1523 = fma(_531, 0.001000000047497451305389404296875, _463);
        _465 = _1523;
    }
    float _1525 = _465;
    float _1527 = fma(_1501, _1453, _1517);
    float _1529 = fma(_1519, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1531 = _1521 * (-2.0);
    float _1533 = _921 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1535 = _1505 * 0.15915493667125701904296875;
    float _1537 = _1179 + (-0.5);
    float _1539 = fma(_1531, _1413, _1413);
    float _1541 = _1533 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    float _1543 = _1535 * 6.283185482025146484375;
    float _1545 = sin(_1543);
    float _1547 = fma(_1529, _1531, _1529);
    float _1549 = fma(_1537, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1539);
    float _1551 = _1539;
    if (_1469)
    {
        float _1553 = fma(_535, 0.001000000047497451305389404296875, _469);
        _471 = _1553;
    }
    float _1555 = _471;
    if (!_1469)
    {
        _1551 = _475;
    }
    float _1557 = _1551;
    float _1559 = _1557;
    if (_1469)
    {
        float _1561 = fma(_539, 0.001000000047497451305389404296875, _475);
        _1559 = _1561;
    }
    float _1563 = _1559;
    float _1565 = fma(_1547, _1453, _1549);
    float _1567 = -_1525;
    float _1569 = _1373 * _1567;
    float _1571 = _1535 * 6.283185482025146484375;
    float _1573 = cos(_1571);
    float _1575 = _1527 * 0.15915493667125701904296875;
    float _1577 = _1565 * 0.15915493667125701904296875;
    float _1579 = -_1563;
    float _1581 = -_1569;
    float _1583 = fma(_1361, _1579, _1581);
    float _1585 = _1575 * 6.283185482025146484375;
    float _1587 = sin(_1585);
    float _1589 = _1541 * _1515;
    float _1591 = _1457 * _1589;
    float _1593 = _1473 * _1589;
    float _1595 = _1575 * 6.283185482025146484375;
    float _1597 = cos(_1595);
    float _1599 = -_1591;
    float _1601 = _1457 + _1599;
    float _1603 = -_1593;
    float _1605 = _1473 + _1603;
    float _1607 = _1489 * _1589;
    float _1609 = _1583 * _1583;
    float _1611 = _1601 * _1601;
    float _1613 = -_1563;
    float _1615 = _1371 * _1613;
    float _1617 = -_1607;
    float _1619 = _1489 + _1617;
    float _1621 = -_1555;
    float _1623 = _1361 * _1621;
    float _1625 = fma(_1605, _1605, _1611);
    float _1627 = -_1555;
    float _1629 = -_1615;
    float _1631 = fma(_1373, _1627, _1629);
    float _1633 = _1577 * 6.283185482025146484375;
    float _1635 = sin(_1633);
    float _1637 = -_1525;
    float _1639 = -_1623;
    float _1641 = fma(_1371, _1637, _1639);
    float _1643 = fma(_1619, _1619, _1625);
    float _1645 = fma(_1631, _1631, _1609);
    float _1647 = _1545 * _1587;
    float _1649 = _1573 * _1597;
    float _1651 = _1545 * _1597;
    float _1653 = fma(_1641, _1641, _1645);
    float _1655 = _1577 * 6.283185482025146484375;
    float _1657 = cos(_1655);
    float _1659 = rsqrt(_1653);
    float _1661 = fma(_1635, _1649, _1647);
    float _1663 = _1573 * _1587;
    float _1665 = fma(_1635, _1647, _1649);
    float _1667 = _1545 * _1657;
    float _1669 = _1573 * _1657;
    float _1671 = _1597 * _1657;
    float _1673 = _1587 * _1657;
    float _1675 = sqrt(_1643);
    float _1677 = _1669 * _1371;
    float _1679 = _1669 * _1373;
    float _1681 = -_1663;
    float _1683 = fma(_1635, _1651, _1681);
    float _1685 = _1583 * _1659;
    float _1687 = _1641 * _1659;
    float _1689 = _1631 * _1659;
    float _1691 = _1661 * _1361;
    float _1693 = -_1651;
    float _1695 = fma(_1635, _1663, _1693);
    float _1697 = _1669 * _1361;
    float _1699 = _1661 * _1371;
    float _1701 = fma(_1671, _1689, _1691);
    float _1703 = -_1635;
    float _1705 = fma(_1703, _1685, _1677);
    float _1707 = -_1635;
    float _1709 = fma(_1707, _1689, _1697);
    float _1711 = -_1635;
    float _1713 = fma(_1711, _1687, _1679);
    float _1715 = _1661 * _1373;
    float _1717 = floor(_1127);
    float _1719 = _1695 * _1371;
    float _1721 = fma(_1671, _1685, _1699);
    float _1723 = fma(_1671, _1687, _1715);
    float _1725 = _1695 * _1361;
    float _1727 = _1695 * _1373;
    float _1729 = _1371 * _1687;
    float _1731 = _1373 * _1689;
    float _1733 = fma(_1673, _1685, _1719);
    float _1735 = _1361 * _1685;
    float _1737 = -_1729;
    float _1739 = fma(_1373, _1685, _1737);
    float _1741 = -_1731;
    float _1743 = fma(_1361, _1687, _1741);
    float _1745 = _1515 * _1675;
    float _1747 = fma(_1673, _1689, _1725);
    float _1749 = -_1735;
    float _1751 = fma(_1371, _1689, _1749);
    float _1753 = fma(_1673, _1687, _1727);
    float _1755 = -_1717;
    float _1757 = _1127 + _1755;
    float _1759 = fma(_1667, _1739, _1709);
    float _1761 = fma(_1667, _1743, _1705);
    float _1763 = fma(_1683, _1739, _1701);
    float _1765 = fma(_1683, _1743, _1721);
    float _1767 = fma(_1665, _1739, _1747);
    float _1769 = fma(_1665, _1743, _1733);
    float _1771 = fma(_1683, _1751, _1723);
    float _1773 = fma(_1667, _1751, _1713);
    float _1775 = fma(_1665, _1751, _1753);
    float _1777 = _923 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1779 = _925 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1781 = _1533 * _1745;
    float _1783 = _1777 * _1745;
    float _1785 = _1779 * _1745;
    float _1787 = -_1155;
    float _1789 = _1787 + _1175;
    float _1791 = -_1153;
    float _1793 = _1791 + _1173;
    float _1795 = -_1157;
    float _1797 = _1795 + _1177;
    float _1799 = fma(_1757, _1789, _1155);
    float _1801 = fma(_1757, _1793, _1153);
    float _1803 = fma(_1757, _1797, _1157);
    float _1805 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1799);
    float _1807 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1801);
    float _1809 = _1783 * _1805;
    float _1811 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1803);
    float _1813 = _1781 * _1807;
    float _1815 = _1809 * _1773;
    float _1817 = _1785 * _1811;
    float _1819 = _1809 * _1759;
    float _1821 = fma(_1813, _1771, _1815);
    float _1823 = fma(_1813, _1763, _1819);
    float _1825 = fma(_1817, _1775, _1821);
    float _1827 = fma(_1817, _1767, _1823);
    float _1829 = _1313 + _1825;
    float _1831 = _1297 + _1827;
    float _1833 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1835 = _1829 + _1833;
    float _1837 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1839 = _1831 + _1837;
    float _1841 = _1835 * _1835;
    float _1843 = fma(_1839, _1839, _1841);
    float _1845 = _1809 * _1761;
    float _1847 = sqrt(_1843);
    float _1849 = fma(_1813, _1765, _1845);
    float _1851 = fma(_1817, _1769, _1849);
    float _1853 = _1263 + _1851;
    bool _1855 = _1847 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1857 = _1851;
    float _1859 = _1849;
    float _1861 = _1831;
    float _1863 = _1829;
    float _1865 = _1813;
    float _1867 = _1723;
    float _1869 = _1713;
    float _1871 = _1701;
    if (!_1855)
    {
        _1857 = _1831;
    }
    float _1873 = _1857;
    float _1875 = _1873;
    if (!_1855)
    {
        _1859 = _1829;
    }
    float _1877 = _1859;
    float _1879 = _1877;
    if (!_1855)
    {
        _1861 = _1853;
    }
    float _1881 = _1861;
    bool _1883 = !_1855;
    float _1885 = _1881;
    if (!_1883)
    {
        float _1887 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1889 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1891 = _1847 + _1889;
        float _1893 = _1853 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1895 = rsqrt(_1843);
        float _1897 = _1891 * _1887;
        float _1899 = _1897 * 0.15915493667125701904296875;
        float _1901 = _1899 * 6.283185482025146484375;
        float _1903 = sin(_1901);
        float _1905 = _1899 * 6.283185482025146484375;
        float _1907 = cos(_1905);
        float _1909 = fma(_1903, _1893, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1911 = _1895 * _1909;
        float _1913 = _1907 + (-1.0);
        float _1915 = fma(_1839, _1911, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1917 = fma(_1835, _1911, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1919 = _1913 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1921 = fma(_1853, _1907, _1919);
        _1885 = _1921;
        _1875 = _1915;
        _1879 = _1917;
        _1863 = _1899;
        _1865 = _1895;
    }
    float _1923 = _1885;
    float _1925 = _1875;
    float _1927 = _1879;
    float _1929 = _1863;
    float _1931 = _1865;
    float _1933 = -_1591;
    float _1935 = _1933 + _1923;
    float _1937 = -_1593;
    float _1939 = _1937 + _1925;
    float _1941 = -_1607;
    float _1943 = _1941 + _1927;
    float _1945 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1947 = _1935 + _1945;
    float _1949 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1951 = _1939 + _1949;
    float _1953 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1955 = _1943 + _1953;
    float _1957 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1959 = _1947 * _1947;
    float _1961 = fma(_1951, _1951, _1959);
    float _1963 = fma(_1955, _1955, _1961);
    float _1965 = rsqrt(_1963);
    float _1967 = _1965 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1969 = _1951 * _1967;
    float _1971 = _1955 * _1967;
    float _1973 = _1969 * _1969;
    float _1975 = _1971 * _1971;
    float _1977 = _1973 + _1975;
    float _1979 = sqrt(_1977);
    bool _1981 = _1979 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1983 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1985 = _1979 + _1983;
    float _1987 = _1929;
    float _1989 = _1977;
    float _1991 = _1985;
    float _1993 = _1973;
    float _1995 = _1975;
    if (_1981)
    {
        float _1997 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1987 = _1997;
    }
    float _1999 = _1987;
    if (_1981)
    {
        float _2001 = rsqrt(_1977);
        _1989 = _2001;
    }
    float _2003 = _1989;
    if (_1981)
    {
        float _2005 = _1985 * _1999;
        _1991 = _2005;
    }
    float _2007 = _1991;
    if (_1981)
    {
        float _2009 = _2007 * 0.15915493667125701904296875;
        _1867 = _2009;
    }
    float _2011 = _1867;
    float _2013 = _1931;
    if (_1981)
    {
        float _2015 = _2011 * 6.283185482025146484375;
        float _2017 = sin(_2015);
        _2013 = _2017;
    }
    float _2019 = _2013;
    float _2021 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2023 = precise::max(0.0, _2021);
    float _2025 = _1689;
    float _2027 = _2023;
    float _2029 = _2021;
    if (_1981)
    {
        float _2031 = _2011 * 6.283185482025146484375;
        float _2033 = cos(_2031);
        _2025 = _2033;
    }
    float _2035 = _2025;
    float _2037 = -_1967;
    float _2039 = -_2023;
    float _2041 = fma(_1947, _2037, _2039);
    if (_1981)
    {
        float _2043 = _2041 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2027 = _2043;
    }
    float _2045 = _2027;
    float _2047 = sqrt(_1963);
    float _2049 = _2019;
    float _2051 = _2045;
    if (_1981)
    {
        float _2053 = fma(_2019, _2045, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1869 = _2053;
    }
    float _2055 = _1869;
    float _2057 = _2055;
    if (!_1981)
    {
        _2049 = _1969;
    }
    float _2059 = _2049;
    float _2061 = _2059;
    if (!_1981)
    {
        _2051 = _2041;
    }
    float _2063 = _2051;
    float _2065 = _2063;
    if (_1981)
    {
        float _2067 = _2035 + (-1.0);
        _2029 = _2067;
    }
    float _2069 = _2029;
    float _2071 = _2069;
    if (_1981)
    {
        float _2073 = _2003 * _2055;
        _2057 = _2073;
    }
    float _2075 = _2057;
    if (_1981)
    {
        float _2077 = _2069 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1871 = _2077;
    }
    float _2079 = _1871;
    if (_1981)
    {
        float _2081 = _1969 * _2075;
        _2061 = _2081;
    }
    float _2083 = _2061;
    if (!_1981)
    {
        _2071 = _1971;
    }
    float _2085 = _2071;
    float _2087 = _2085;
    if (_1981)
    {
        float _2089 = _1971 * _2075;
        _2087 = _2089;
    }
    float _2091 = _2087;
    if (_1981)
    {
        float _2093 = fma(_2041, _2035, _2079);
        _2065 = _2093;
    }
    float _2095 = _2065;
    if (_1981)
    {
        float _2097 = _2083 * _2083;
        _1993 = _2097;
    }
    float _2099 = _1993;
    float _2101 = _1935 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    if (_1981)
    {
        float _2103 = _2091 * _2091;
        _1995 = _2103;
    }
    float _2105 = _1995;
    float _2107 = _1935 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2109 = fma(_2095, _2095, _2099);
    float _2111 = fma(_1939, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2101);
    float _2113 = _1935 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2115 = _1935 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2117 = _2109 + _2105;
    float _2119 = fma(_1939, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2107);
    float _2121 = fma(_1943, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2111);
    float _2123 = fma(_1939, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2113);
    float _2125 = rsqrt(_2117);
    float _2127 = fma(_1939, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2115);
    float _2129 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2131 = fma(_2047, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2129);
    float _2133 = precise::clamp(_2131, 0.0, 1.0);
    float _2135 = fma(_1943, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2119);
    float _2137 = _2121 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2139 = fma(_1943, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2123);
    float _2141 = -_2133;
    float _2143 = _2141 + 1.0;
    float _2145 = _2135 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2147 = _2137 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2149 = fma(_1943, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2127);
    float _2151 = _2139 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2153 = fma(_2145, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2147);
    float _2155 = abs(_2143);
    float _2157 = log2(_2155);
    float _2159 = _2151 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2161 = _2149 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2163 = _2125 * _2083;
    float _2165 = _2125 * _2095;
    float _2167 = _2125 * _2091;
    float _2169 = fma(_2151, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2153);
    float _2171 = _2163 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2173 = -_2159;
    float _2175 = fma(_2173, _1957, 1.0);
    float _2177 = fma(_2161, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2169);
    float _2179 = -_2171;
    float _2181 = fma(_2165, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2179);
    float _2183 = log2(_2175);
    float _2185 = _2137 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2187 = -_2167;
    float _2189 = fma(_2187, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2181);
    float _2191 = _2157 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2193 = _2137 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2195 = fma(_2145, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2185);
    float _2197 = fma(_2189, -0.5, 0.5);
    float _2199 = exp2(_2191);
    float _2201 = fma(_2189, 0.5, 0.5);
    float _2203 = fma(_2145, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2193);
    float _2205 = fma(_2151, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2195);
    float _2207 = _2165 + 1.0;
    float _2209 = fma(_2201, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2211 = fma(_2151, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2203);
    float _2213 = fma(_2161, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2205);
    float _2215 = 1.0 / _2177;
    float _2217 = fma(_2201, _2209, -0.212114393711090087890625);
    float _2219 = fma(_2161, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2211);
    float _2221 = _2183 * 0.693147182464599609375;
    float _2223 = fma(_2201, _2217, 1.570728778839111328125);
    float _2225 = _2221 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2227 = sqrt(_2197);
    float _2229 = -_2165;
    float _2231 = fma(_2199, _2207, _2229);
    float _2233 = fma(_2231, 0.5, 0.5);
    float _2235 = _2213 * _2215;
    float _2237 = _2219 * _2215;
    float _2239 = fma(_2235, 0.5, 0.5);
    float _2241 = fma(_2237, -0.5, 0.5);
    float _2243 = _2227 * 0.636619746685028076171875;
    float _2245 = -_2223;
    float _2247 = fma(_2243, _2245, 1.0);
    float3 _6099 = float3(_2239, _2241, _2225);
    float _2249 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6099, float3(0.0), isnan(_6099)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6099, float3(0.0), isnan(_6099)), level(0.0)).x;
    float3 _6110 = float3(_2239, _2241, _2225);
    float4 _2252 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6110, float3(0.0), isnan(_6110)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6110, float3(0.0), isnan(_6110)), level(0.0)).xyzw;
    float _2254 = _2252.x;
    float _2256 = _2252.y;
    float _2258 = _2252.z;
    float _2260 = _2252.w;
    float2 _6127 = float2(_2247, _2233);
    float3 _2262 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6127, float2(0.0), isnan(_6127)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6127, float2(0.0), isnan(_6127)), level(0.0)).xyz;
    float _2264 = _2262.x;
    float _2266 = _2262.y;
    float _2268 = _2262.z;
    float _2270 = in.m_63.w;
    float _2272 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2274 = _1097 + _2272;
    float _2276 = in.m_57.x;
    float _2278 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2280 = _2278 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2282 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2284 = _2282 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _2286 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2288 = _2286 != 0;
    float _2290 = -_409;
    float _2292 = _2290 + 1.0;
    int _2294 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2296 = _2294 != 0;
    float _2298 = 1.0 / _2280;
    float _2300 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2302 = _2300 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    int _2304 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2306 = _2304 != 0;
    float _2308 = -_1591;
    float _2310 = _1263 + _2308;
    int _2312 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2314 = _2312 != 0;
    float _2316 = -_1593;
    float _2318 = _1297 + _2316;
    float _2320 = -_1607;
    float _2322 = _1313 + _2320;
    float _2324 = 1.0 / _2284;
    float _2326 = _2157 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _2328 = _1185 > 0.5;
    float _2330 = -(*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _2332 = _2330 + (*spvDescriptorSet0.vp_c9)._m0[135].w;
    bool _2334 = _2270 > 0.5;
    float _2336 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _2338 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _2336;
    float _2340 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _2342 = _2340 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _2344 = 1.0 / _2302;
    int _2346 = _2334 ? as_type<int>(_2292) : as_type<int>(_409);
    float _2348 = _2137 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _2350 = _2334;
    if (_2288)
    {
        bool _2352 = _1179 > 0.5;
        _2350 = _2352;
    }
    bool _2354 = _2350;
    float _2356 = _2342 * _2298;
    bool _2358 = _1097 >= (*spvDescriptorSet0.vp_c9)._m0[135].w;
    bool _2360 = isnan(_1097);
    bool _2362 = _2358 || _2360;
    bool _2364 = isnan((*spvDescriptorSet0.vp_c9)._m0[135].w);
    bool _2366 = _2362 || _2364;
    float _2368 = float(_2366);
    float _2370 = fma(_2145, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2348);
    float _2372 = 1.0 / _2332;
    bool _2374 = _1097 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _2376 = isnan(_1097);
    bool _2378 = _2374 || _2376;
    bool _2380 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _2382 = _2378 || _2380;
    float _2384 = float(_2382);
    float _2386 = -_2368;
    float _2388 = _2386 + 1.0;
    bool _2390 = _1097 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2392 = isnan(_1097);
    bool _2394 = _2390 || _2392;
    bool _2396 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2398 = _2394 || _2396;
    float _2400 = float(_2398);
    float _2402 = _2338 * _2324;
    if (_2296)
    {
        bool _2404 = _1107 > 0.5;
        _1343 = _2404;
    }
    bool _2406 = _1343;
    float _2408 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _2410 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _2408;
    bool _2412 = _1097 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _2414 = isnan(_1097);
    bool _2416 = _2412 || _2414;
    bool _2418 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _2420 = _2416 || _2418;
    float _2422 = float(_2420);
    float _2424 = _2384 * _2388;
    float _2426 = -_2384;
    float _2428 = _2426 + 1.0;
    bool _2430 = _1097 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2432 = isnan(_1097);
    bool _2434 = _2430 || _2432;
    bool _2436 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2438 = _2434 || _2436;
    float _2440 = float(_2438);
    float _2442 = -_2400;
    float _2444 = _2442 + 1.0;
    float _2446 = _2410 * _2344;
    float _2448 = _2422 * _2428;
    float _2450 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2452 = _1097 + _2450;
    float _2454 = fma(_2402, _2274, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _2456 = -(*spvDescriptorSet0.vp_c9)._m0[134].x;
    float _2458 = _2456 + (*spvDescriptorSet0.vp_c9)._m0[135].x;
    float _2460 = _2440 * _2444;
    float _2462 = fma(_2356, _2452, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _2464 = _2306 ? as_type<float>(_2346) : _409;
    float _2466 = _2458 * _2372;
    float _2468 = _2454 * _2460;
    float _2470 = -_2422;
    float _2472 = _2470 + 1.0;
    float _2474 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2476 = -_2440;
    float _2478 = _2476 + 1.0;
    float _2480 = _2440;
    if (_2314)
    {
        float _2482 = _2328 ? _2292 : _409;
        _497 = _2482;
    }
    float _2484 = _497;
    float _2486 = _2400 * _2472;
    float _2488 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2490 = _1097 + _2488;
    float _2492 = fma(_2478, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2468);
    float _2494 = -(*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _2496 = _1097 + _2494;
    float _2498 = _2276;
    if (_2296)
    {
        float _2500 = -_2276;
        float _2502 = _2500 + 1.0;
        _1345 = as_type<int>(_2502);
    }
    int _2504 = _1345;
    float _2506 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2508 = fma(_2446, _2490, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _2510 = fma(_2462, _2486, _2492);
    int _2512 = _2504;
    if (!_2296)
    {
        _2480 = _2276;
    }
    float _2514 = _2480;
    float _2516 = fma(_2466, _2496, (*spvDescriptorSet0.vp_c9)._m0[134].x);
    float _2518 = _2514;
    if (_2296)
    {
        float _2520 = _2406 ? as_type<float>(_2504) : _2276;
        _2518 = _2520;
    }
    float _2522 = _2518;
    float _2524 = fma(_2508, _2448, _2510);
    bool _2526 = _1799 != 0.0;
    bool _2528 = isnan(_1799);
    bool _2530 = _2526 || _2528;
    bool _2532 = isnan(0.0);
    bool _2534 = _2530 || _2532;
    float _2536 = _2474 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    if (_2288)
    {
        float _2538 = -_2276;
        float _2540 = _2538 + 1.0;
        _2512 = as_type<int>(_2540);
    }
    int _2542 = _2512;
    float _2544 = fma(_2516, _2424, _2524);
    bool _2546 = _1801 == 0.0;
    bool _2548 = !_2534;
    bool _2550 = _2546 && _2548;
    float _2552 = fma(_2536, _2522, -0.5);
    float _2554 = in.m_69.w;
    float _2556 = fma(_2368, (*spvDescriptorSet0.vp_c9)._m0[135].x, _2544);
    bool _2558 = _1803 == 0.0;
    bool _2560 = _2558 && _2550;
    float _2562 = _2506 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2564 = fma(_1415, _2552, _1253);
    float _2566 = _2464 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2568 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2570 = fma(_2562, _2484, -0.5);
    if (_2288)
    {
        float _2572 = _2354 ? as_type<float>(_2542) : _2276;
        _2498 = _2572;
    }
    float _2574 = _2498;
    float _2576 = _2556 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2578 = -_1427;
    float _2580 = fma(_1419, _2570, _2578);
    float _2582 = in.m_71.x;
    float _2584 = in.m_71.y;
    float _2586 = in.m_71.z;
    float _2588 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2590 = _2574 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2592 = _2580 + 0.5;
    float _2594 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2596 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2598 = _2566 * _2568;
    float _2600 = _2564 + 0.5;
    float _2602 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2604 = _2594 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2606 = _2596 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_73.w = _2554;
    float _2608 = _2602 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2610 = exp2(_2326);
    float _2612 = _2590 * _2588;
    out.m_75.x = _2604;
    out.m_75.y = _2606;
    out.m_75.z = _2608;
    out.m_75.w = _2576;
    float _2614 = _2584;
    float _2616 = _2582;
    float _2618 = _2586;
    if (!_2560)
    {
        float _2620 = fma(_1799, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2584);
        _2614 = _2620;
    }
    float _2622 = _2614;
    if (!_2560)
    {
        float _2624 = fma(_1801, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2582);
        _2616 = _2624;
    }
    float _2626 = _2616;
    out.m_77.x = _2600;
    out.m_77.y = _2592;
    out.m_77.z = _2612;
    out.m_77.w = _2598;
    if (!_2560)
    {
        float _2628 = fma(_1803, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2586);
        _2618 = _2628;
    }
    float _2630 = _2618;
    float _2632 = _1759 * _2622;
    float _2634 = _1761 * _2622;
    float _2636 = _1773 * _2622;
    bool _2638 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2640 = isnan(0.5);
    bool _2642 = _2638 || _2640;
    bool _2644 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2646 = _2642 || _2644;
    float _2648 = fma(_1763, _2626, _2632);
    float _2650 = fma(_1765, _2626, _2634);
    float _2652 = fma(_1771, _2626, _2636);
    float _2654 = fma(_1767, _2630, _2648);
    float _2656 = fma(_1769, _2630, _2650);
    float _2658 = fma(_1775, _2630, _2652);
    float _2660 = _2310 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2662 = _2310 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    out.m_79.x = _2654;
    out.m_79.y = _2656;
    out.m_79.z = _2658;
    float _2664 = fma(_2318, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2660);
    float _2666 = fma(_2318, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2662);
    float _2668 = fma(_2151, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2370);
    float _2670 = fma(_2322, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2664);
    float _2672 = fma(_2322, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2666);
    float _2674 = fma(_2161, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2668);
    float _2676 = _2670 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2678 = _2672 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2680 = 1.0 / _2676;
    float _2682 = _2678 + _2676;
    float _2684 = _2676;
    if (_2646)
    {
        _2684 = 1.0;
    }
    float _2686 = _2684;
    float _2688 = _2682 * _2680;
    float _2690 = _2688 * 0.5;
    float _2692 = _2686;
    if (!_2646)
    {
        float _2694 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2696 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2698 = _2694 * 0.15915493667125701904296875;
        float _2700 = _2696 * 0.15915493667125701904296875;
        float _2702 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _2704 = fma(_2690, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2702);
        float _2706 = _2698 * 6.283185482025146484375;
        float _2708 = cos(_2706);
        float _2710 = _2698 * 6.283185482025146484375;
        float _2712 = sin(_2710);
        float _2714 = 1.0 / _2708;
        float _2716 = _2700 * 6.283185482025146484375;
        float _2718 = cos(_2716);
        float _2720 = _2712 * _2714;
        float _2722 = _2700 * 6.283185482025146484375;
        float _2724 = sin(_2722);
        float _2726 = _2718 * _2720;
        float _2728 = 1.0 / _2704;
        float _2730 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2732 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2730;
        float _2734 = 1.0 / _2726;
        float _2736 = 1.0 / _2732;
        float _2738 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2740 = _2728 * _2738;
        float _2742 = _2724 * _2734;
        float _2744 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2746 = fma(_2742, _2740, _2744);
        float _2748 = _2746 * _2736;
        float _2750 = precise::clamp(_2748, 0.0, 1.0);
        _2692 = _2750;
    }
    float _2752 = _2692;
    float _2754 = _2674 + _2177;
    float _2756 = -_2610;
    float _2758 = _2756 + 1.0;
    bool _2760 = _2752 > 0.0;
    bool _2762 = isnan(_2752);
    bool _2764 = _2760 || _2762;
    bool _2766 = isnan(0.0);
    bool _2768 = _2764 || _2766;
    float _2770 = _2752 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2772 = _2754 * 0.5;
    float _2774 = _2758 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_81.x = _1951;
    out.m_81.y = _1947;
    out.m_81.z = _1955;
    float _2776 = _2770 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2778 = _2774 * _2249;
    float _2780 = -_2774;
    float _2782 = _2780 + 1.0;
    out.gl_Position.x = _2213;
    out.gl_Position.y = _2219;
    out.gl_Position.z = _2674;
    out.gl_Position.w = _2177;
    float _2784 = _2260 * _2778;
    float _2786 = _2268 * _2778;
    float _2788 = _2260 * _2782;
    out.m_83.z = _2772;
    out.m_83.w = _2177;
    float _2790 = fma(_2264, _2784, _2254);
    float _2792 = fma(_2266, _2784, _2256);
    float _2794 = fma(_2260, _2786, _2258);
    out.m_47.x = _2776;
    out.m_85.x = _2790;
    out.m_85.y = _2792;
    out.m_85.z = _2794;
    out.m_85.w = _2788;
    if (_2768)
    {
        return out;
    }
    out.m_47.x = 0.0;
    float _2796 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2796;
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
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1089 = false;
    bool _947 = false;
    bool _767 = false;
    bool _607 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _103 = in.m_44.w;
    float _105 = trunc(_103);
    int _107 = int(_105);
    bool _111 = _107 >= 1;
    float _113 = 0.0;
    if (!_111)
    {
        _113 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _115 = _113;
    float _117 = _115;
    if (!_111)
    {
        out.m_47.x = 0.0;
    }
    int _119 = 0;
    if (!_111)
    {
        float _121 = _115 * 5.0;
        _119 = as_type<int>(_121);
    }
    int _123 = _119;
    int _125 = _123;
    if (!_111)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2853 = as_type<float>(_123);
        out.gl_Position.z = _2853;
    }
    if (!_111)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _127 = in.m_49.w;
    bool _129 = _127 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _131 = isnan(_127);
    bool _133 = _129 || _131;
    bool _135 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _137 = _133 || _135;
    float _139 = -_127;
    float _141 = _139 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _143 = 0.0;
    float _145 = 0.0;
    float _147 = _141;
    if (_137)
    {
        float _149 = float(_107);
        _143 = _149;
    }
    float _151 = _143;
    bool _153 = _141 >= _151;
    bool _155 = !_137;
    bool _157 = _153 || _155;
    if (_157)
    {
        _117 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _159 = _117;
    if (_157)
    {
        out.m_47.x = 0.0;
    }
    if (_157)
    {
        float _161 = _159 * 5.0;
        _125 = as_type<int>(_161);
    }
    int _163 = _125;
    float _165 = as_type<float>(_163);
    if (_157)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2924 = as_type<float>(_163);
        out.gl_Position.z = _2924;
    }
    if (_157)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _167 = in.m_51.y;
    float _169 = _141 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _171 = in.m_53.y;
    bool _173 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _175 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _177 = _173 || _175;
    bool _179 = isnan(1.0);
    bool _181 = _177 || _179;
    float _183 = in.m_55.y;
    float _185 = in.m_51.z;
    float _187 = in.m_53.z;
    float _189 = _169;
    if (!_181)
    {
        float _191 = _169 * _169;
        float _193 = _191 * 0.5;
        _165 = _193;
    }
    float _195 = _165;
    float _197 = 0.0;
    float _199 = _195;
    if (!_181)
    {
        float _201 = _141 * _141;
        float _203 = _201 * 0.5;
        _197 = _203;
    }
    float _205 = _197;
    float _207 = in.m_55.z;
    if (!_181)
    {
        float _209 = _195 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _199 = _209;
    }
    float _211 = _199;
    float _213 = _167 * _167;
    float _215 = fma(_171, _171, _213);
    float _217 = fma(_183, _183, _215);
    float _219 = in.m_49.x;
    float _221 = in.m_49.y;
    float _223 = in.m_49.z;
    float _225 = sqrt(_217);
    bool _227 = _225 > 0.0;
    float _229 = _185 * _185;
    float _231 = fma(_187, _187, _229);
    bool _233 = !_181;
    float _235 = _211;
    float _237 = _231;
    if (!_233)
    {
        float _239 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _241 = log2(_239);
        float _243 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _245 = _243 + 1.0;
        float _247 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _249 = _169 * _241;
        float _251 = 1.0 / _245;
        float _253 = _247 * 0.693147182464599609375;
        float _255 = exp2(_249);
        float _257 = 1.0 / _253;
        float _259 = _255 + (-1.0);
        float _261 = -_259;
        float _263 = fma(_261, _257, _169);
        float _265 = _263 * _251;
        float _267 = _265 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _145 = _257;
        _235 = _267;
    }
    float _269 = _145;
    float _271 = _235;
    bool _273 = !_181;
    float _275 = _269;
    if (!_273)
    {
        float _277 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _279 = log2(_277);
        float _281 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _283 = _281 + 1.0;
        float _285 = 1.0 / _283;
        float _287 = _169 * _279;
        float _289 = exp2(_287);
        float _291 = -_289;
        float _293 = _291 + 1.0;
        float _295 = _293 * _285;
        _275 = _283;
        _189 = _295;
    }
    float _297 = _275;
    float _299 = _189;
    float _301 = fma(_207, _207, _231);
    float _303 = _297;
    if (!_181)
    {
        _303 = _141;
    }
    float _305 = _303;
    float _307 = _305;
    if (!_181)
    {
        float _309 = _205 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _237 = _309;
    }
    float _311 = _237;
    bool _313 = !_181;
    float _315 = _311;
    if (!_313)
    {
        float _317 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _319 = log2(_317);
        float _321 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _323 = _321 + 1.0;
        float _325 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _327 = _141 * _319;
        float _329 = 1.0 / _323;
        float _331 = _325 * 0.693147182464599609375;
        float _333 = exp2(_327);
        float _335 = 1.0 / _331;
        float _337 = _333 + (-1.0);
        float _339 = -_337;
        float _341 = fma(_339, _335, _141);
        float _343 = _341 * _329;
        float _345 = _343 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _315 = _345;
    }
    float _347 = _315;
    bool _349 = !_181;
    if (!_349)
    {
        float _351 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _353 = log2(_351);
        float _355 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _357 = _355 + 1.0;
        float _359 = 1.0 / _357;
        float _361 = _141 * _353;
        float _363 = exp2(_361);
        float _365 = -_363;
        float _367 = _365 + 1.0;
        float _369 = _367 * _359;
        _307 = _369;
    }
    float _371 = _307;
    float _373 = _271 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _375 = _347 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _377 = _271 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _379 = _347 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _381 = fma(_299, _221, _373);
    float _383 = fma(_371, _221, _375);
    float _385 = sqrt(_301);
    float _387 = _271 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _389 = fma(_299, _219, _377);
    float _391 = _347 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _393 = fma(_371, _219, _379);
    float _395 = -_383;
    float _397 = _381 + _395;
    float _399 = fma(_299, _223, _387);
    float _401 = fma(_371, _223, _391);
    float _403 = -_393;
    float _405 = _389 + _403;
    float _407 = _397 * _397;
    float _409 = in.m_57.y;
    float _411 = -_401;
    float _413 = _399 + _411;
    float _415 = _391;
    float _417 = _399;
    if (_227)
    {
        float _419 = rsqrt(_217);
        _415 = _419;
    }
    float _421 = _415;
    float _423 = fma(_405, _405, _407);
    float _425 = in.m_53.x;
    float _427 = 0.0;
    if (!_227)
    {
        _427 = 0.0;
    }
    float _429 = _427;
    float _431 = _397 * _183;
    float _433 = fma(_413, _413, _423);
    bool _435 = _385 > 0.0;
    float _437 = in.m_51.x;
    float _439 = 0.0;
    float _441 = _429;
    if (!_227)
    {
        _439 = 0.0;
    }
    float _443 = _439;
    float _445 = _397 * _167;
    float _447 = 0.0;
    float _449 = _443;
    if (!_227)
    {
        _447 = 0.0;
    }
    float _451 = _447;
    float _453 = in.m_55.x;
    float _455 = sqrt(_433);
    float _457 = in.m_59.w;
    float _459 = _451;
    if (_227)
    {
        float _461 = _421 * _171;
        _441 = _461;
    }
    float _463 = _441;
    float _465 = _463;
    if (_227)
    {
        float _467 = _421 * _167;
        _449 = _467;
    }
    float _469 = _449;
    float _471 = _469;
    if (_227)
    {
        float _473 = _421 * _183;
        _459 = _473;
    }
    float _475 = _459;
    float _477 = in.m_44.x;
    float _479 = in.m_44.y;
    float _481 = in.m_44.z;
    float _483 = 0.0;
    if (_435)
    {
        float _485 = rsqrt(_301);
        _483 = _485;
    }
    float _487 = _483;
    float _489 = 0.0;
    if (!_435)
    {
        _489 = 0.0;
    }
    float _491 = _489;
    out.m_61.y = _409;
    float _493 = 0.0;
    float _495 = _491;
    float _497 = _409;
    if (!_435)
    {
        _493 = 0.0;
    }
    float _499 = _493;
    float _501 = 0.0;
    float _503 = _499;
    if (!_435)
    {
        _501 = 0.0;
    }
    float _505 = _501;
    bool _507 = _455 >= 9.9999999747524270787835121154785e-07;
    bool _509 = isnan(_455);
    bool _511 = _507 || _509;
    bool _513 = isnan(9.9999999747524270787835121154785e-07);
    bool _515 = _511 || _513;
    float _517 = _397 * _171;
    float _519 = fma(_405, _437, _445);
    float _521 = fma(_405, _425, _517);
    float _523 = fma(_405, _453, _431);
    float _525 = _505;
    float _527 = _523;
    if (_435)
    {
        float _529 = _487 * _187;
        _495 = _529;
    }
    float _531 = _495;
    if (_435)
    {
        float _533 = _487 * _185;
        _503 = _533;
    }
    float _535 = _503;
    if (_435)
    {
        float _537 = _487 * _207;
        _525 = _537;
    }
    float _539 = _525;
    float _541 = fma(_413, _187, _521);
    float _543 = fma(_413, _185, _519);
    float _545 = fma(_413, _207, _523);
    float _547 = fma(_399, _457, _481);
    float _549 = fma(_389, _457, _477);
    float _551 = fma(_381, _457, _479);
    float _553 = _543;
    float _555 = _543;
    if (_515)
    {
        _527 = _541;
    }
    float _557 = _527;
    float _559 = _557;
    float _561 = _557;
    if (_515)
    {
        _417 = _545;
    }
    float _563 = _417;
    float _565 = _563;
    float _567 = _563;
    if (!_515)
    {
        bool _569 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _571 = !_569;
        if (!_571)
        {
            float _573 = _167 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _575 = _171 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _577 = _183 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _579 = fma(_437, (*spvDescriptorSet0.vp_c9)._m0[16].x, _573);
            float _581 = fma(_425, (*spvDescriptorSet0.vp_c9)._m0[16].x, _575);
            float _583 = fma(_453, (*spvDescriptorSet0.vp_c9)._m0[16].x, _577);
            float _585 = fma(_185, (*spvDescriptorSet0.vp_c9)._m0[16].z, _579);
            float _587 = fma(_187, (*spvDescriptorSet0.vp_c9)._m0[16].z, _581);
            float _589 = fma(_207, (*spvDescriptorSet0.vp_c9)._m0[16].z, _583);
            float _591 = _585 * _585;
            float _593 = fma(_587, _587, _591);
            float _595 = fma(_589, _589, _593);
            float _597 = rsqrt(_595);
            float _599 = _597 * 9.9999999747524270787835121154785e-07;
            float _601 = _587 * _599;
            float _603 = _585 * _599;
            float _605 = _589 * _599;
            _555 = _603;
            _561 = _601;
            _567 = _605;
            _607 = true;
        }
        else
        {
            float _609 = _221 * _221;
            float _611 = fma(_219, _219, _609);
            float _613 = fma(_223, _223, _611);
            float _615 = sqrt(_613);
            bool _617 = _615 >= 9.9999999747524270787835121154785e-07;
            bool _619 = isnan(_615);
            bool _621 = _617 || _619;
            bool _623 = isnan(9.9999999747524270787835121154785e-07);
            bool _625 = _621 || _623;
            if (!_625)
            {
                float _627 = _479 * _479;
                float _629 = fma(_477, _477, _627);
                float _631 = fma(_481, _481, _629);
                float _633 = sqrt(_631);
                bool _635 = _633 >= 9.9999999747524270787835121154785e-07;
                bool _637 = isnan(_633);
                bool _639 = _635 || _637;
                bool _641 = isnan(9.9999999747524270787835121154785e-07);
                bool _643 = _639 || _641;
                float _645 = _217;
                if (!_643)
                {
                    float _647 = rsqrt(_217);
                    _645 = _647;
                }
                float _649 = _645;
                if (!_643)
                {
                    float _651 = _649 * 9.9999999747524270787835121154785e-07;
                    _565 = _651;
                }
                float _653 = _565;
                float _655 = _653;
                if (!_643)
                {
                    float _657 = _171 * _653;
                    _559 = _657;
                }
                float _659 = _559;
                _561 = _659;
                if (!_643)
                {
                    float _661 = _167 * _653;
                    _553 = _661;
                }
                float _663 = _553;
                _555 = _663;
                if (!_643)
                {
                    float _665 = _183 * _653;
                    _655 = _665;
                }
                float _667 = _655;
                bool _669 = !_643;
                _567 = _667;
                _607 = _669;
                if (!_607)
                {
                    float _671 = _167 * _479;
                    float _673 = _171 * _479;
                    float _675 = _183 * _479;
                    float _677 = fma(_477, _437, _671);
                    float _679 = fma(_477, _425, _673);
                    float _681 = fma(_477, _453, _675);
                    float _683 = fma(_185, _481, _677);
                    float _685 = fma(_187, _481, _679);
                    float _687 = fma(_207, _481, _681);
                    float _689 = _683 * _683;
                    float _691 = fma(_685, _685, _689);
                    float _693 = fma(_687, _687, _691);
                    float _695 = rsqrt(_693);
                    float _697 = _695 * 9.9999999747524270787835121154785e-07;
                    float _699 = _685 * _697;
                    float _701 = _683 * _697;
                    float _703 = _687 * _697;
                    _555 = _701;
                    _561 = _699;
                    _567 = _703;
                    _607 = true;
                }
            }
            else
            {
                float _705 = _167 * _221;
                float _707 = _171 * _221;
                float _709 = _183 * _221;
                float _711 = fma(_219, _437, _705);
                float _713 = fma(_219, _425, _707);
                float _715 = fma(_219, _453, _709);
                float _717 = fma(_185, _223, _711);
                float _719 = fma(_187, _223, _713);
                float _721 = fma(_207, _223, _715);
                float _723 = _717 * _717;
                float _725 = fma(_719, _719, _723);
                float _727 = fma(_721, _721, _725);
                float _729 = rsqrt(_727);
                float _731 = _729 * 9.9999999747524270787835121154785e-07;
                float _733 = _719 * _731;
                float _735 = _717 * _731;
                float _737 = _721 * _731;
                _555 = _735;
                _561 = _733;
                _567 = _737;
            }
        }
    }
    _607 = false;
    float _739 = _555;
    float _741 = _561;
    float _743 = _567;
    bool _745 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _747 = !_745;
    float _765;
    if (!_747)
    {
        float _749 = in.m_63.x;
        float _751 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _753 = _749 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _755 = fma(_753, (*spvDescriptorSet0.vp_c9)._m0[12].x, _141);
        float _757 = _755 * _751;
        float _759 = floor(_757);
        float _761 = -_759;
        float _763 = _757 + _761;
        _765 = _763;
        _767 = true;
    }
    else
    {
        float _769 = float(_107);
        float _771 = 1.0 / _769;
        float _773 = _141 * _771;
        _765 = _773;
    }
    _767 = false;
    float _775 = _765;
    float _777 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _779 = _775 + _777;
    bool _781 = _775 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _783 = isnan(_775);
    bool _785 = _781 || _783;
    bool _787 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _789 = _785 || _787;
    float _791 = float(_789);
    float _793 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _795 = _775 + _793;
    bool _797 = _775 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _799 = isnan(_775);
    bool _801 = _797 || _799;
    bool _803 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _805 = _801 || _803;
    float _807 = float(_805);
    float _809 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _811 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _809;
    float _813 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _815 = _813 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _817 = _775 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _819 = isnan(_775);
    bool _821 = _817 || _819;
    bool _823 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _825 = _821 || _823;
    float _827 = float(_825);
    float _829 = -_791;
    float _831 = _829 + 1.0;
    float _833 = 1.0 / _815;
    float _835 = _827 * _831;
    float _837 = -_827;
    float _839 = _837 + 1.0;
    float _841 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _843 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _841;
    bool _845 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _847 = 1.0 / _811;
    float _849 = _807 * _839;
    float _851 = -_807;
    float _853 = _851 + 1.0;
    float _855 = _795 * _833;
    float _857 = _779 * _847;
    float _859 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _861 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _859;
    float _863 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _865 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _863;
    float _867 = fma(_843, _857, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _869 = fma(_861, _857, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _871 = fma(_865, _857, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _873 = in.m_59.x;
    float _875 = in.m_59.y;
    float _877 = in.m_59.z;
    float _879 = _867 * _849;
    float _881 = _869 * _849;
    float _883 = _871 * _849;
    float _885 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _887 = _885 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _889 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _891 = _889 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _893 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _895 = _893 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _897 = fma(_853, (*spvDescriptorSet0.vp_c9)._m0[143].y, _881);
    float _899 = fma(_887, _855, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _901 = fma(_891, _855, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _903 = fma(_895, _855, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _905 = fma(_853, (*spvDescriptorSet0.vp_c9)._m0[143].x, _879);
    float _907 = fma(_853, (*spvDescriptorSet0.vp_c9)._m0[143].z, _883);
    float _909 = fma(_901, _835, _897);
    float _911 = fma(_899, _835, _905);
    float _913 = fma(_903, _835, _907);
    float _915 = fma(_791, (*spvDescriptorSet0.vp_c9)._m0[145].y, _909);
    float _917 = fma(_791, (*spvDescriptorSet0.vp_c9)._m0[145].x, _911);
    float _919 = fma(_791, (*spvDescriptorSet0.vp_c9)._m0[145].z, _913);
    float _921 = _917 * _873;
    float _923 = _915 * _875;
    float _925 = _919 * _877;
    bool _927 = !_845;
    float _945;
    if (!_927)
    {
        float _929 = in.m_63.x;
        float _931 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _933 = _929 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _935 = fma(_933, (*spvDescriptorSet0.vp_c9)._m0[11].y, _141);
        float _937 = _935 * _931;
        float _939 = floor(_937);
        float _941 = -_939;
        float _943 = _937 + _941;
        _945 = _943;
        _947 = true;
    }
    else
    {
        float _949 = float(_107);
        float _951 = 1.0 / _949;
        float _953 = _141 * _951;
        _945 = _953;
    }
    _947 = false;
    float _955 = _945;
    float _957 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _959 = _955 + _957;
    float _961 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _963 = _961 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _965 = _955 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _967 = isnan(_955);
    bool _969 = _965 || _967;
    bool _971 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _973 = _969 || _971;
    float _975 = float(_973);
    float _977 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _979 = _977 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _981 = _955 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _983 = isnan(_955);
    bool _985 = _981 || _983;
    bool _987 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _989 = _985 || _987;
    float _991 = float(_989);
    float _993 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _995 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _993;
    bool _997 = _955 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _999 = isnan(_955);
    bool _1001 = _997 || _999;
    bool _1003 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1005 = _1001 || _1003;
    float _1007 = float(_1005);
    float _1009 = 1.0 / _963;
    float _1011 = -_975;
    float _1013 = _1011 + 1.0;
    bool _1015 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _1017 = -_1007;
    float _1019 = _1017 + 1.0;
    float _1021 = 1.0 / _979;
    float _1023 = _975 * _1019;
    float _1025 = _995 * _1009;
    float _1027 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1029 = _1027 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1031 = fma(_1025, _959, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1033 = _991 * _1013;
    float _1035 = -_991;
    float _1037 = _1035 + 1.0;
    float _1039 = _1029 * _1021;
    float _1041 = _1031 * _1033;
    float _1043 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1045 = _955 + _1043;
    float _1047 = fma(_1037, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1041);
    float _1049 = fma(_1039, _1045, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1051 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1053 = fma(_1049, _1023, _1047);
    float _1055 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1057 = _1051 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1059 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1061 = fma(_1007, (*spvDescriptorSet0.vp_c9)._m0[117].x, _1053);
    float _1063 = _1055 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1065 = _1059 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1067 = _1061 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_65.x = _1057;
    out.m_65.y = _1063;
    out.m_65.z = _1065;
    out.m_65.w = _1067;
    bool _1069 = !_1015;
    float _1087;
    if (!_1069)
    {
        float _1071 = in.m_63.x;
        float _1073 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _1075 = _1071 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _1077 = fma(_1075, (*spvDescriptorSet0.vp_c9)._m0[11].w, _141);
        float _1079 = _1077 * _1073;
        float _1081 = floor(_1079);
        float _1083 = -_1081;
        float _1085 = _1079 + _1083;
        _1087 = _1085;
        _1089 = true;
    }
    else
    {
        float _1091 = float(_107);
        float _1093 = 1.0 / _1091;
        float _1095 = _141 * _1093;
        _1087 = _1095;
    }
    _1089 = false;
    float _1097 = _1087;
    int _1099 = int2(spvDescriptorSet0.vp_t_tcb_C.get_width(), spvDescriptorSet0.vp_t_tcb_C.get_height()).x;
    int _1101 = _1099;
    int _1103 = 0;
    int _1105 = _98(_1101, _1103, (*spvDescriptorSet0.support_buffer));
    float _1107 = in.m_63.x;
    float _1109 = in.m_57.z;
    float _1111 = _1107 * 5.0;
    float _1113 = rint(_1111);
    float _1115 = _1113 * 0.20000000298023223876953125;
    float _1117 = precise::clamp(_1115, 0.0, 1.0);
    int _1119 = _1105 + (-1);
    float _1121 = trunc(_1109);
    int _1123 = int(_1121);
    float _1125 = float(_1119);
    float _1127 = _1117 * _1125;
    float _1129 = trunc(_1127);
    int _1131 = int(_1129);
    int _1133 = _1131 + 1;
    int _1135 = min(_1119, _1133);
    int _1137 = _1131;
    int _1139 = 0;
    int _1141 = _99(_1137, _1139, (*spvDescriptorSet0.support_buffer));
    int _1143 = _1123;
    int _1145 = 0;
    int _1147 = _99(_1143, _1145, (*spvDescriptorSet0.support_buffer));
    float3 _1151 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_1141, _1147)), 0).xyz;
    float _1153 = _1151.x;
    float _1155 = _1151.y;
    float _1157 = _1151.z;
    int _1159 = _1135;
    int _1161 = 0;
    int _1163 = _99(_1159, _1161, (*spvDescriptorSet0.support_buffer));
    int _1165 = _1123;
    int _1167 = 0;
    int _1169 = _99(_1165, _1167, (*spvDescriptorSet0.support_buffer));
    float3 _1171 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_1163, _1169)), 0).xyz;
    float _1173 = _1171.x;
    float _1175 = _1171.y;
    float _1177 = _1171.z;
    float _1179 = in.m_63.z;
    float _1181 = _551 * _167;
    float _1183 = _551 * _183;
    float _1185 = in.m_63.y;
    float _1187 = fma(_549, _437, _1181);
    float _1189 = _551 * _171;
    int _1191 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1193 = _1191 != 0;
    int _1195 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1197 = _1195 != 0;
    int _1199 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1201 = _1199 != 0;
    float _1203 = _1107 * 2.0;
    float _1205 = fma(_547, _185, _1187);
    float _1207 = fma(_549, _453, _1183);
    float _1209 = fma(_549, _425, _1189);
    float _1211 = in.m_51.w;
    float _1213 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1215 = fma(_547, _187, _1209);
    float _1217 = fma(_547, _207, _1207);
    float _1219 = -_1213;
    float _1221 = fma(_1203, (*spvDescriptorSet0.vp_c9)._m0[77].x, _1219);
    float _1223 = _739 * _739;
    float _1225 = floor(_1203);
    float _1227 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1229 = in.m_53.w;
    float _1231 = _1179 * 2.0;
    float _1233 = fma(_741, _741, _1223);
    float _1235 = in.m_55.w;
    float _1237 = _1185 + _1179;
    float _1239 = floor(_1231);
    float _1241 = _1185 * 2.0;
    float _1243 = fma(_743, _743, _1233);
    float _1245 = _1237 + (-1.0);
    bool _1247 = !_1197;
    int _1249 = _1247 ? 0 : 1;
    float _1251 = -_141;
    float _1253 = fma(_1251, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1221);
    float _1255 = fma(_1245, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1257 = floor(_1241);
    float _1259 = _1185 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _1261 = _1225 > 0.0;
    float _1263 = _1205 + _1211;
    bool _1265 = _1225 >= 0.0;
    bool _1267 = isnan(_1225);
    bool _1269 = _1265 || _1267;
    bool _1271 = isnan(0.0);
    bool _1273 = _1269 || _1271;
    float _1275 = fma(_1259, -2.0, _1227);
    float _1277 = _1107 + _1185;
    float _1279 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1281 = log2(_1279);
    bool _1283 = _1239 > 0.0;
    float _1285 = _1277 + (-1.0);
    bool _1287 = _1239 >= 0.0;
    bool _1289 = isnan(_1239);
    bool _1291 = _1287 || _1289;
    bool _1293 = isnan(0.0);
    bool _1295 = _1291 || _1293;
    float _1297 = _1215 + _1229;
    float _1299 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1301 = 1.0 + _1299;
    float _1303 = fma(_1285, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _1305 = !_1193;
    int _1307 = _1305 ? 0 : 1;
    float _1309 = rsqrt(_1243);
    int _1311 = _1295 ? 0 : 1;
    float _1313 = _1217 + _1235;
    int _1315 = abs(_1307);
    int _1317 = ~_1311;
    int _1319 = _1317 + 1;
    int _1321 = _1319 + 1;
    float _1323 = 1.0 / _1301;
    float _1325 = _1281 * _141;
    int _1327 = _1273 ? 0 : 1;
    bool _1329 = _1257 > 0.0;
    bool _1331 = _1257 >= 0.0;
    bool _1333 = isnan(_1257);
    bool _1335 = _1331 || _1333;
    bool _1337 = isnan(0.0);
    bool _1339 = _1335 || _1337;
    int _1341 = _1321;
    bool _1343 = _1197;
    int _1345 = as_type<int>(_1097);
    if (!_1283)
    {
        int _1347 = ~_1311;
        int _1349 = _1347 + 1;
        _1341 = _1349;
    }
    int _1351 = _1341;
    float _1353 = exp2(_1325);
    int _1355 = ~_1327;
    int _1357 = _1355 + 1;
    int _1359 = _1357 + 1;
    float _1361 = _1309 * _741;
    int _1363 = _1359;
    if (!_1261)
    {
        int _1365 = ~_1327;
        int _1367 = _1365 + 1;
        _1363 = _1367;
    }
    int _1369 = _1363;
    float _1371 = _1309 * _739;
    float _1373 = _1309 * _743;
    float _1375 = float(_1315);
    float _1377 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1379 = float(_1351);
    float _1381 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _1383 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1385 = isnan(1.0);
    bool _1387 = _1383 || _1385;
    bool _1389 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1391 = _1387 || _1389;
    float _1393 = fma(_1107, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1377);
    bool _1395 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1397 = isnan(0.0);
    bool _1399 = _1395 || _1397;
    bool _1401 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1403 = _1399 || _1401;
    float _1405 = _1375 * _1379;
    float _1407 = fma(_1185, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1381);
    float _1409 = in.m_67.x;
    float _1411 = in.m_67.y;
    float _1413 = in.m_67.z;
    float _1415 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1393);
    int _1417 = _1339 ? 0 : 1;
    float _1419 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1407);
    int _1421 = abs(_1249);
    float _1423 = -_1353;
    float _1425 = _1423 + 1.0;
    float _1427 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1275);
    float _1429 = _1371 * _469;
    float _1431 = _1405 * (-2.0);
    float _1433 = float(_1421);
    float _1435 = _1403 ? _1425 : 0.0;
    float _1437 = fma(_1361, _463, _1429);
    float _1439 = float(_1369);
    int _1441 = ~_1417;
    int _1443 = _1441 + 1;
    int _1445 = _1443 + 1;
    float _1447 = fma(_1373, _475, _1437);
    int _1449 = _1445;
    if (_1391)
    {
        float _1451 = _1435 * _1323;
        _147 = _1451;
    }
    float _1453 = _147;
    float _1455 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1457 = _1263 + _1455;
    if (!_1329)
    {
        int _1459 = ~_1417;
        int _1461 = _1459 + 1;
        _1449 = _1461;
    }
    int _1463 = _1449;
    float _1465 = fma(_1303, _1431, _1303);
    float _1467 = abs(_1447);
    bool _1469 = _1467 > 0.99989998340606689453125;
    float _1471 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1473 = _1297 + _1471;
    float _1475 = _1457 * _1457;
    float _1477 = _1433 * _1439;
    float _1479 = fma(_1431, _1409, _1409);
    float _1481 = _1107 + (-0.5);
    bool _1483 = !_1201;
    int _1485 = _1483 ? 0 : 1;
    float _1487 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1489 = _1313 + _1487;
    float _1491 = fma(_1473, _1473, _1475);
    float _1493 = _1477 * (-2.0);
    float _1495 = fma(_1481, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1479);
    int _1497 = abs(_1485);
    float _1499 = fma(_1489, _1489, _1491);
    float _1501 = fma(_1255, _1493, _1255);
    float _1503 = fma(_1493, _1411, _1411);
    float _1505 = fma(_1465, _1453, _1495);
    float _1507 = _1185 + (-0.5);
    float _1509 = float(_1497);
    float _1511 = _1107 + _1179;
    float _1513 = float(_1463);
    float _1515 = rsqrt(_1499);
    float _1517 = fma(_1507, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1503);
    float _1519 = _1511 + (-1.0);
    float _1521 = _1509 * _1513;
    if (_1469)
    {
        float _1523 = fma(_531, 0.001000000047497451305389404296875, _463);
        _465 = _1523;
    }
    float _1525 = _465;
    float _1527 = fma(_1501, _1453, _1517);
    float _1529 = fma(_1519, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1531 = _1521 * (-2.0);
    float _1533 = _921 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1535 = _1505 * 0.15915493667125701904296875;
    float _1537 = _1179 + (-0.5);
    float _1539 = fma(_1531, _1413, _1413);
    float _1541 = _1533 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    float _1543 = _1535 * 6.283185482025146484375;
    float _1545 = sin(_1543);
    float _1547 = fma(_1529, _1531, _1529);
    float _1549 = fma(_1537, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1539);
    float _1551 = _1539;
    if (_1469)
    {
        float _1553 = fma(_535, 0.001000000047497451305389404296875, _469);
        _471 = _1553;
    }
    float _1555 = _471;
    if (!_1469)
    {
        _1551 = _475;
    }
    float _1557 = _1551;
    float _1559 = _1557;
    if (_1469)
    {
        float _1561 = fma(_539, 0.001000000047497451305389404296875, _475);
        _1559 = _1561;
    }
    float _1563 = _1559;
    float _1565 = fma(_1547, _1453, _1549);
    float _1567 = -_1525;
    float _1569 = _1373 * _1567;
    float _1571 = _1535 * 6.283185482025146484375;
    float _1573 = cos(_1571);
    float _1575 = _1527 * 0.15915493667125701904296875;
    float _1577 = _1565 * 0.15915493667125701904296875;
    float _1579 = -_1563;
    float _1581 = -_1569;
    float _1583 = fma(_1361, _1579, _1581);
    float _1585 = _1575 * 6.283185482025146484375;
    float _1587 = sin(_1585);
    float _1589 = _1541 * _1515;
    float _1591 = _1457 * _1589;
    float _1593 = _1473 * _1589;
    float _1595 = _1575 * 6.283185482025146484375;
    float _1597 = cos(_1595);
    float _1599 = -_1591;
    float _1601 = _1457 + _1599;
    float _1603 = -_1593;
    float _1605 = _1473 + _1603;
    float _1607 = _1489 * _1589;
    float _1609 = _1583 * _1583;
    float _1611 = _1601 * _1601;
    float _1613 = -_1563;
    float _1615 = _1371 * _1613;
    float _1617 = -_1607;
    float _1619 = _1489 + _1617;
    float _1621 = -_1555;
    float _1623 = _1361 * _1621;
    float _1625 = fma(_1605, _1605, _1611);
    float _1627 = -_1555;
    float _1629 = -_1615;
    float _1631 = fma(_1373, _1627, _1629);
    float _1633 = _1577 * 6.283185482025146484375;
    float _1635 = sin(_1633);
    float _1637 = -_1525;
    float _1639 = -_1623;
    float _1641 = fma(_1371, _1637, _1639);
    float _1643 = fma(_1619, _1619, _1625);
    float _1645 = fma(_1631, _1631, _1609);
    float _1647 = _1545 * _1587;
    float _1649 = _1573 * _1597;
    float _1651 = _1545 * _1597;
    float _1653 = fma(_1641, _1641, _1645);
    float _1655 = _1577 * 6.283185482025146484375;
    float _1657 = cos(_1655);
    float _1659 = rsqrt(_1653);
    float _1661 = fma(_1635, _1649, _1647);
    float _1663 = _1573 * _1587;
    float _1665 = fma(_1635, _1647, _1649);
    float _1667 = _1545 * _1657;
    float _1669 = _1573 * _1657;
    float _1671 = _1597 * _1657;
    float _1673 = _1587 * _1657;
    float _1675 = sqrt(_1643);
    float _1677 = _1669 * _1371;
    float _1679 = _1669 * _1373;
    float _1681 = -_1663;
    float _1683 = fma(_1635, _1651, _1681);
    float _1685 = _1583 * _1659;
    float _1687 = _1641 * _1659;
    float _1689 = _1631 * _1659;
    float _1691 = _1661 * _1361;
    float _1693 = -_1651;
    float _1695 = fma(_1635, _1663, _1693);
    float _1697 = _1669 * _1361;
    float _1699 = _1661 * _1371;
    float _1701 = fma(_1671, _1689, _1691);
    float _1703 = -_1635;
    float _1705 = fma(_1703, _1685, _1677);
    float _1707 = -_1635;
    float _1709 = fma(_1707, _1689, _1697);
    float _1711 = -_1635;
    float _1713 = fma(_1711, _1687, _1679);
    float _1715 = _1661 * _1373;
    float _1717 = floor(_1127);
    float _1719 = _1695 * _1371;
    float _1721 = fma(_1671, _1685, _1699);
    float _1723 = fma(_1671, _1687, _1715);
    float _1725 = _1695 * _1361;
    float _1727 = _1695 * _1373;
    float _1729 = _1371 * _1687;
    float _1731 = _1373 * _1689;
    float _1733 = fma(_1673, _1685, _1719);
    float _1735 = _1361 * _1685;
    float _1737 = -_1729;
    float _1739 = fma(_1373, _1685, _1737);
    float _1741 = -_1731;
    float _1743 = fma(_1361, _1687, _1741);
    float _1745 = _1515 * _1675;
    float _1747 = fma(_1673, _1689, _1725);
    float _1749 = -_1735;
    float _1751 = fma(_1371, _1689, _1749);
    float _1753 = fma(_1673, _1687, _1727);
    float _1755 = -_1717;
    float _1757 = _1127 + _1755;
    float _1759 = fma(_1667, _1739, _1709);
    float _1761 = fma(_1667, _1743, _1705);
    float _1763 = fma(_1683, _1739, _1701);
    float _1765 = fma(_1683, _1743, _1721);
    float _1767 = fma(_1665, _1739, _1747);
    float _1769 = fma(_1665, _1743, _1733);
    float _1771 = fma(_1683, _1751, _1723);
    float _1773 = fma(_1667, _1751, _1713);
    float _1775 = fma(_1665, _1751, _1753);
    float _1777 = _923 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1779 = _925 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1781 = _1533 * _1745;
    float _1783 = _1777 * _1745;
    float _1785 = _1779 * _1745;
    float _1787 = -_1155;
    float _1789 = _1787 + _1175;
    float _1791 = -_1153;
    float _1793 = _1791 + _1173;
    float _1795 = -_1157;
    float _1797 = _1795 + _1177;
    float _1799 = fma(_1757, _1789, _1155);
    float _1801 = fma(_1757, _1793, _1153);
    float _1803 = fma(_1757, _1797, _1157);
    float _1805 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1799);
    float _1807 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1801);
    float _1809 = _1783 * _1805;
    float _1811 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1803);
    float _1813 = _1781 * _1807;
    float _1815 = _1809 * _1773;
    float _1817 = _1785 * _1811;
    float _1819 = _1809 * _1759;
    float _1821 = fma(_1813, _1771, _1815);
    float _1823 = fma(_1813, _1763, _1819);
    float _1825 = fma(_1817, _1775, _1821);
    float _1827 = fma(_1817, _1767, _1823);
    float _1829 = _1313 + _1825;
    float _1831 = _1297 + _1827;
    float _1833 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1835 = _1829 + _1833;
    float _1837 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1839 = _1831 + _1837;
    float _1841 = _1835 * _1835;
    float _1843 = fma(_1839, _1839, _1841);
    float _1845 = _1809 * _1761;
    float _1847 = sqrt(_1843);
    float _1849 = fma(_1813, _1765, _1845);
    float _1851 = fma(_1817, _1769, _1849);
    float _1853 = _1263 + _1851;
    bool _1855 = _1847 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1857 = _1851;
    float _1859 = _1849;
    float _1861 = _1831;
    float _1863 = _1829;
    float _1865 = _1813;
    float _1867 = _1723;
    float _1869 = _1713;
    float _1871 = _1701;
    if (!_1855)
    {
        _1857 = _1831;
    }
    float _1873 = _1857;
    float _1875 = _1873;
    if (!_1855)
    {
        _1859 = _1829;
    }
    float _1877 = _1859;
    float _1879 = _1877;
    if (!_1855)
    {
        _1861 = _1853;
    }
    float _1881 = _1861;
    bool _1883 = !_1855;
    float _1885 = _1881;
    if (!_1883)
    {
        float _1887 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1889 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1891 = _1847 + _1889;
        float _1893 = _1853 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1895 = rsqrt(_1843);
        float _1897 = _1891 * _1887;
        float _1899 = _1897 * 0.15915493667125701904296875;
        float _1901 = _1899 * 6.283185482025146484375;
        float _1903 = sin(_1901);
        float _1905 = _1899 * 6.283185482025146484375;
        float _1907 = cos(_1905);
        float _1909 = fma(_1903, _1893, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1911 = _1895 * _1909;
        float _1913 = _1907 + (-1.0);
        float _1915 = fma(_1839, _1911, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1917 = fma(_1835, _1911, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1919 = _1913 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1921 = fma(_1853, _1907, _1919);
        _1885 = _1921;
        _1875 = _1915;
        _1879 = _1917;
        _1863 = _1899;
        _1865 = _1895;
    }
    float _1923 = _1885;
    float _1925 = _1875;
    float _1927 = _1879;
    float _1929 = _1863;
    float _1931 = _1865;
    float _1933 = -_1591;
    float _1935 = _1933 + _1923;
    float _1937 = -_1593;
    float _1939 = _1937 + _1925;
    float _1941 = -_1607;
    float _1943 = _1941 + _1927;
    float _1945 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1947 = _1935 + _1945;
    float _1949 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1951 = _1939 + _1949;
    float _1953 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1955 = _1943 + _1953;
    float _1957 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1959 = _1947 * _1947;
    float _1961 = fma(_1951, _1951, _1959);
    float _1963 = fma(_1955, _1955, _1961);
    float _1965 = rsqrt(_1963);
    float _1967 = _1965 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1969 = _1951 * _1967;
    float _1971 = _1955 * _1967;
    float _1973 = _1969 * _1969;
    float _1975 = _1971 * _1971;
    float _1977 = _1973 + _1975;
    float _1979 = sqrt(_1977);
    bool _1981 = _1979 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1983 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1985 = _1979 + _1983;
    float _1987 = _1929;
    float _1989 = _1977;
    float _1991 = _1985;
    float _1993 = _1973;
    float _1995 = _1975;
    if (_1981)
    {
        float _1997 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1987 = _1997;
    }
    float _1999 = _1987;
    if (_1981)
    {
        float _2001 = rsqrt(_1977);
        _1989 = _2001;
    }
    float _2003 = _1989;
    if (_1981)
    {
        float _2005 = _1985 * _1999;
        _1991 = _2005;
    }
    float _2007 = _1991;
    if (_1981)
    {
        float _2009 = _2007 * 0.15915493667125701904296875;
        _1867 = _2009;
    }
    float _2011 = _1867;
    float _2013 = _1931;
    if (_1981)
    {
        float _2015 = _2011 * 6.283185482025146484375;
        float _2017 = sin(_2015);
        _2013 = _2017;
    }
    float _2019 = _2013;
    float _2021 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2023 = precise::max(0.0, _2021);
    float _2025 = _1689;
    float _2027 = _2023;
    float _2029 = _2021;
    if (_1981)
    {
        float _2031 = _2011 * 6.283185482025146484375;
        float _2033 = cos(_2031);
        _2025 = _2033;
    }
    float _2035 = _2025;
    float _2037 = -_1967;
    float _2039 = -_2023;
    float _2041 = fma(_1947, _2037, _2039);
    if (_1981)
    {
        float _2043 = _2041 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2027 = _2043;
    }
    float _2045 = _2027;
    float _2047 = sqrt(_1963);
    float _2049 = _2019;
    float _2051 = _2045;
    if (_1981)
    {
        float _2053 = fma(_2019, _2045, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1869 = _2053;
    }
    float _2055 = _1869;
    float _2057 = _2055;
    if (!_1981)
    {
        _2049 = _1969;
    }
    float _2059 = _2049;
    float _2061 = _2059;
    if (!_1981)
    {
        _2051 = _2041;
    }
    float _2063 = _2051;
    float _2065 = _2063;
    if (_1981)
    {
        float _2067 = _2035 + (-1.0);
        _2029 = _2067;
    }
    float _2069 = _2029;
    float _2071 = _2069;
    if (_1981)
    {
        float _2073 = _2003 * _2055;
        _2057 = _2073;
    }
    float _2075 = _2057;
    if (_1981)
    {
        float _2077 = _2069 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1871 = _2077;
    }
    float _2079 = _1871;
    if (_1981)
    {
        float _2081 = _1969 * _2075;
        _2061 = _2081;
    }
    float _2083 = _2061;
    if (!_1981)
    {
        _2071 = _1971;
    }
    float _2085 = _2071;
    float _2087 = _2085;
    if (_1981)
    {
        float _2089 = _1971 * _2075;
        _2087 = _2089;
    }
    float _2091 = _2087;
    if (_1981)
    {
        float _2093 = fma(_2041, _2035, _2079);
        _2065 = _2093;
    }
    float _2095 = _2065;
    if (_1981)
    {
        float _2097 = _2083 * _2083;
        _1993 = _2097;
    }
    float _2099 = _1993;
    float _2101 = _1935 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    if (_1981)
    {
        float _2103 = _2091 * _2091;
        _1995 = _2103;
    }
    float _2105 = _1995;
    float _2107 = _1935 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2109 = fma(_2095, _2095, _2099);
    float _2111 = fma(_1939, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2101);
    float _2113 = _1935 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2115 = _1935 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2117 = _2109 + _2105;
    float _2119 = fma(_1939, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2107);
    float _2121 = fma(_1943, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2111);
    float _2123 = fma(_1939, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2113);
    float _2125 = rsqrt(_2117);
    float _2127 = fma(_1939, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2115);
    float _2129 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2131 = fma(_2047, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2129);
    float _2133 = precise::clamp(_2131, 0.0, 1.0);
    float _2135 = fma(_1943, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2119);
    float _2137 = _2121 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2139 = fma(_1943, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2123);
    float _2141 = -_2133;
    float _2143 = _2141 + 1.0;
    float _2145 = _2135 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2147 = _2137 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2149 = fma(_1943, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2127);
    float _2151 = _2139 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2153 = fma(_2145, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2147);
    float _2155 = abs(_2143);
    float _2157 = log2(_2155);
    float _2159 = _2151 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2161 = _2149 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2163 = _2125 * _2083;
    float _2165 = _2125 * _2095;
    float _2167 = _2125 * _2091;
    float _2169 = fma(_2151, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2153);
    float _2171 = _2163 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2173 = -_2159;
    float _2175 = fma(_2173, _1957, 1.0);
    float _2177 = fma(_2161, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2169);
    float _2179 = -_2171;
    float _2181 = fma(_2165, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2179);
    float _2183 = log2(_2175);
    float _2185 = _2137 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2187 = -_2167;
    float _2189 = fma(_2187, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2181);
    float _2191 = _2157 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2193 = _2137 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2195 = fma(_2145, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2185);
    float _2197 = fma(_2189, -0.5, 0.5);
    float _2199 = exp2(_2191);
    float _2201 = fma(_2189, 0.5, 0.5);
    float _2203 = fma(_2145, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2193);
    float _2205 = fma(_2151, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2195);
    float _2207 = _2165 + 1.0;
    float _2209 = fma(_2201, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2211 = fma(_2151, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2203);
    float _2213 = fma(_2161, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2205);
    float _2215 = 1.0 / _2177;
    float _2217 = fma(_2201, _2209, -0.212114393711090087890625);
    float _2219 = fma(_2161, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2211);
    float _2221 = _2183 * 0.693147182464599609375;
    float _2223 = fma(_2201, _2217, 1.570728778839111328125);
    float _2225 = _2221 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2227 = sqrt(_2197);
    float _2229 = -_2165;
    float _2231 = fma(_2199, _2207, _2229);
    float _2233 = fma(_2231, 0.5, 0.5);
    float _2235 = _2213 * _2215;
    float _2237 = _2219 * _2215;
    float _2239 = fma(_2235, 0.5, 0.5);
    float _2241 = fma(_2237, -0.5, 0.5);
    float _2243 = _2227 * 0.636619746685028076171875;
    float _2245 = -_2223;
    float _2247 = fma(_2243, _2245, 1.0);
    float3 _6099 = float3(_2239, _2241, _2225);
    float _2249 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6099, float3(0.0), isnan(_6099)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6099, float3(0.0), isnan(_6099)), level(0.0)).x;
    float3 _6110 = float3(_2239, _2241, _2225);
    float4 _2252 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6110, float3(0.0), isnan(_6110)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6110, float3(0.0), isnan(_6110)), level(0.0)).xyzw;
    float _2254 = _2252.x;
    float _2256 = _2252.y;
    float _2258 = _2252.z;
    float _2260 = _2252.w;
    float2 _6127 = float2(_2247, _2233);
    float3 _2262 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6127, float2(0.0), isnan(_6127)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6127, float2(0.0), isnan(_6127)), level(0.0)).xyz;
    float _2264 = _2262.x;
    float _2266 = _2262.y;
    float _2268 = _2262.z;
    float _2270 = in.m_63.w;
    float _2272 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2274 = _1097 + _2272;
    float _2276 = in.m_57.x;
    float _2278 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2280 = _2278 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2282 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2284 = _2282 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _2286 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2288 = _2286 != 0;
    float _2290 = -_409;
    float _2292 = _2290 + 1.0;
    int _2294 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2296 = _2294 != 0;
    float _2298 = 1.0 / _2280;
    float _2300 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2302 = _2300 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    int _2304 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2306 = _2304 != 0;
    float _2308 = -_1591;
    float _2310 = _1263 + _2308;
    int _2312 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2314 = _2312 != 0;
    float _2316 = -_1593;
    float _2318 = _1297 + _2316;
    float _2320 = -_1607;
    float _2322 = _1313 + _2320;
    float _2324 = 1.0 / _2284;
    float _2326 = _2157 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _2328 = _1185 > 0.5;
    float _2330 = -(*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _2332 = _2330 + (*spvDescriptorSet0.vp_c9)._m0[135].w;
    bool _2334 = _2270 > 0.5;
    float _2336 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _2338 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _2336;
    float _2340 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _2342 = _2340 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _2344 = 1.0 / _2302;
    int _2346 = _2334 ? as_type<int>(_2292) : as_type<int>(_409);
    float _2348 = _2137 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _2350 = _2334;
    if (_2288)
    {
        bool _2352 = _1179 > 0.5;
        _2350 = _2352;
    }
    bool _2354 = _2350;
    float _2356 = _2342 * _2298;
    bool _2358 = _1097 >= (*spvDescriptorSet0.vp_c9)._m0[135].w;
    bool _2360 = isnan(_1097);
    bool _2362 = _2358 || _2360;
    bool _2364 = isnan((*spvDescriptorSet0.vp_c9)._m0[135].w);
    bool _2366 = _2362 || _2364;
    float _2368 = float(_2366);
    float _2370 = fma(_2145, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2348);
    float _2372 = 1.0 / _2332;
    bool _2374 = _1097 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _2376 = isnan(_1097);
    bool _2378 = _2374 || _2376;
    bool _2380 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _2382 = _2378 || _2380;
    float _2384 = float(_2382);
    float _2386 = -_2368;
    float _2388 = _2386 + 1.0;
    bool _2390 = _1097 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2392 = isnan(_1097);
    bool _2394 = _2390 || _2392;
    bool _2396 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2398 = _2394 || _2396;
    float _2400 = float(_2398);
    float _2402 = _2338 * _2324;
    if (_2296)
    {
        bool _2404 = _1107 > 0.5;
        _1343 = _2404;
    }
    bool _2406 = _1343;
    float _2408 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _2410 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _2408;
    bool _2412 = _1097 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _2414 = isnan(_1097);
    bool _2416 = _2412 || _2414;
    bool _2418 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _2420 = _2416 || _2418;
    float _2422 = float(_2420);
    float _2424 = _2384 * _2388;
    float _2426 = -_2384;
    float _2428 = _2426 + 1.0;
    bool _2430 = _1097 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2432 = isnan(_1097);
    bool _2434 = _2430 || _2432;
    bool _2436 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2438 = _2434 || _2436;
    float _2440 = float(_2438);
    float _2442 = -_2400;
    float _2444 = _2442 + 1.0;
    float _2446 = _2410 * _2344;
    float _2448 = _2422 * _2428;
    float _2450 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2452 = _1097 + _2450;
    float _2454 = fma(_2402, _2274, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _2456 = -(*spvDescriptorSet0.vp_c9)._m0[134].x;
    float _2458 = _2456 + (*spvDescriptorSet0.vp_c9)._m0[135].x;
    float _2460 = _2440 * _2444;
    float _2462 = fma(_2356, _2452, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _2464 = _2306 ? as_type<float>(_2346) : _409;
    float _2466 = _2458 * _2372;
    float _2468 = _2454 * _2460;
    float _2470 = -_2422;
    float _2472 = _2470 + 1.0;
    float _2474 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2476 = -_2440;
    float _2478 = _2476 + 1.0;
    float _2480 = _2440;
    if (_2314)
    {
        float _2482 = _2328 ? _2292 : _409;
        _497 = _2482;
    }
    float _2484 = _497;
    float _2486 = _2400 * _2472;
    float _2488 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2490 = _1097 + _2488;
    float _2492 = fma(_2478, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2468);
    float _2494 = -(*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _2496 = _1097 + _2494;
    float _2498 = _2276;
    if (_2296)
    {
        float _2500 = -_2276;
        float _2502 = _2500 + 1.0;
        _1345 = as_type<int>(_2502);
    }
    int _2504 = _1345;
    float _2506 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2508 = fma(_2446, _2490, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _2510 = fma(_2462, _2486, _2492);
    int _2512 = _2504;
    if (!_2296)
    {
        _2480 = _2276;
    }
    float _2514 = _2480;
    float _2516 = fma(_2466, _2496, (*spvDescriptorSet0.vp_c9)._m0[134].x);
    float _2518 = _2514;
    if (_2296)
    {
        float _2520 = _2406 ? as_type<float>(_2504) : _2276;
        _2518 = _2520;
    }
    float _2522 = _2518;
    float _2524 = fma(_2508, _2448, _2510);
    bool _2526 = _1799 != 0.0;
    bool _2528 = isnan(_1799);
    bool _2530 = _2526 || _2528;
    bool _2532 = isnan(0.0);
    bool _2534 = _2530 || _2532;
    float _2536 = _2474 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    if (_2288)
    {
        float _2538 = -_2276;
        float _2540 = _2538 + 1.0;
        _2512 = as_type<int>(_2540);
    }
    int _2542 = _2512;
    float _2544 = fma(_2516, _2424, _2524);
    bool _2546 = _1801 == 0.0;
    bool _2548 = !_2534;
    bool _2550 = _2546 && _2548;
    float _2552 = fma(_2536, _2522, -0.5);
    float _2554 = in.m_69.w;
    float _2556 = fma(_2368, (*spvDescriptorSet0.vp_c9)._m0[135].x, _2544);
    bool _2558 = _1803 == 0.0;
    bool _2560 = _2558 && _2550;
    float _2562 = _2506 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2564 = fma(_1415, _2552, _1253);
    float _2566 = _2464 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2568 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2570 = fma(_2562, _2484, -0.5);
    if (_2288)
    {
        float _2572 = _2354 ? as_type<float>(_2542) : _2276;
        _2498 = _2572;
    }
    float _2574 = _2498;
    float _2576 = _2556 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2578 = -_1427;
    float _2580 = fma(_1419, _2570, _2578);
    float _2582 = in.m_71.x;
    float _2584 = in.m_71.y;
    float _2586 = in.m_71.z;
    float _2588 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2590 = _2574 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2592 = _2580 + 0.5;
    float _2594 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2596 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2598 = _2566 * _2568;
    float _2600 = _2564 + 0.5;
    float _2602 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2604 = _2594 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2606 = _2596 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_73.w = _2554;
    float _2608 = _2602 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2610 = exp2(_2326);
    float _2612 = _2590 * _2588;
    out.m_75.x = _2604;
    out.m_75.y = _2606;
    out.m_75.z = _2608;
    out.m_75.w = _2576;
    float _2614 = _2584;
    float _2616 = _2582;
    float _2618 = _2586;
    if (!_2560)
    {
        float _2620 = fma(_1799, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2584);
        _2614 = _2620;
    }
    float _2622 = _2614;
    if (!_2560)
    {
        float _2624 = fma(_1801, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2582);
        _2616 = _2624;
    }
    float _2626 = _2616;
    out.m_77.x = _2600;
    out.m_77.y = _2592;
    out.m_77.z = _2612;
    out.m_77.w = _2598;
    if (!_2560)
    {
        float _2628 = fma(_1803, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2586);
        _2618 = _2628;
    }
    float _2630 = _2618;
    float _2632 = _1759 * _2622;
    float _2634 = _1761 * _2622;
    float _2636 = _1773 * _2622;
    bool _2638 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2640 = isnan(0.5);
    bool _2642 = _2638 || _2640;
    bool _2644 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2646 = _2642 || _2644;
    float _2648 = fma(_1763, _2626, _2632);
    float _2650 = fma(_1765, _2626, _2634);
    float _2652 = fma(_1771, _2626, _2636);
    float _2654 = fma(_1767, _2630, _2648);
    float _2656 = fma(_1769, _2630, _2650);
    float _2658 = fma(_1775, _2630, _2652);
    float _2660 = _2310 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2662 = _2310 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    out.m_79.x = _2654;
    out.m_79.y = _2656;
    out.m_79.z = _2658;
    float _2664 = fma(_2318, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2660);
    float _2666 = fma(_2318, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2662);
    float _2668 = fma(_2151, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2370);
    float _2670 = fma(_2322, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2664);
    float _2672 = fma(_2322, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2666);
    float _2674 = fma(_2161, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2668);
    float _2676 = _2670 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2678 = _2672 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2680 = 1.0 / _2676;
    float _2682 = _2678 + _2676;
    float _2684 = _2676;
    if (_2646)
    {
        _2684 = 1.0;
    }
    float _2686 = _2684;
    float _2688 = _2682 * _2680;
    float _2690 = _2688 * 0.5;
    float _2692 = _2686;
    if (!_2646)
    {
        float _2694 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2696 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2698 = _2694 * 0.15915493667125701904296875;
        float _2700 = _2696 * 0.15915493667125701904296875;
        float _2702 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _2704 = fma(_2690, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2702);
        float _2706 = _2698 * 6.283185482025146484375;
        float _2708 = cos(_2706);
        float _2710 = _2698 * 6.283185482025146484375;
        float _2712 = sin(_2710);
        float _2714 = 1.0 / _2708;
        float _2716 = _2700 * 6.283185482025146484375;
        float _2718 = cos(_2716);
        float _2720 = _2712 * _2714;
        float _2722 = _2700 * 6.283185482025146484375;
        float _2724 = sin(_2722);
        float _2726 = _2718 * _2720;
        float _2728 = 1.0 / _2704;
        float _2730 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2732 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2730;
        float _2734 = 1.0 / _2726;
        float _2736 = 1.0 / _2732;
        float _2738 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2740 = _2728 * _2738;
        float _2742 = _2724 * _2734;
        float _2744 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2746 = fma(_2742, _2740, _2744);
        float _2748 = _2746 * _2736;
        float _2750 = precise::clamp(_2748, 0.0, 1.0);
        _2692 = _2750;
    }
    float _2752 = _2692;
    float _2754 = _2674 + _2177;
    float _2756 = -_2610;
    float _2758 = _2756 + 1.0;
    bool _2760 = _2752 > 0.0;
    bool _2762 = isnan(_2752);
    bool _2764 = _2760 || _2762;
    bool _2766 = isnan(0.0);
    bool _2768 = _2764 || _2766;
    float _2770 = _2752 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2772 = _2754 * 0.5;
    float _2774 = _2758 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_81.x = _1951;
    out.m_81.y = _1947;
    out.m_81.z = _1955;
    float _2776 = _2770 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2778 = _2774 * _2249;
    float _2780 = -_2774;
    float _2782 = _2780 + 1.0;
    out.gl_Position.x = _2213;
    out.gl_Position.y = _2219;
    out.gl_Position.z = _2674;
    out.gl_Position.w = _2177;
    float _2784 = _2260 * _2778;
    float _2786 = _2268 * _2778;
    float _2788 = _2260 * _2782;
    out.m_83.z = _2772;
    out.m_83.w = _2177;
    float _2790 = fma(_2264, _2784, _2254);
    float _2792 = fma(_2266, _2784, _2256);
    float _2794 = fma(_2260, _2786, _2258);
    out.m_47.x = _2776;
    out.m_85.x = _2790;
    out.m_85.y = _2792;
    out.m_85.z = _2794;
    out.m_85.w = _2788;
    if (_2768)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_47.x = 0.0;
    float _2796 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2796;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

