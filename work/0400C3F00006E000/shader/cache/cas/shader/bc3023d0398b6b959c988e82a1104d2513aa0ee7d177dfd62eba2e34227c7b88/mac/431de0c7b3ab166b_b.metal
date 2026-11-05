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

template <typename T>
static inline depth2d<T> spvDepthCast(texture2d<T> t)
{
    return reinterpret_cast<thread const depth2d<T> &>(t);
}

template <typename T>
static inline depth2d_array<T> spvDepthCast(texture2d_array<T> t)
{
    return reinterpret_cast<thread const depth2d_array<T> &>(t);
}

template <typename T>
static inline depthcube<T> spvDepthCast(texturecube<T> t)
{
    return reinterpret_cast<thread const depthcube<T> &>(t);
}

template <typename T>
static inline depthcube_array<T> spvDepthCast(texturecube_array<T> t)
{
    return reinterpret_cast<thread const depthcube_array<T> &>(t);
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
    constant _16* vp_c15 [[id(0)]];
    constant _16* vp_c8 [[id(1)]];
    constant _16* vp_c10 [[id(2)]];
    constant _16* vp_c9 [[id(3)]];
    constant _16* vp_c16 [[id(4)]];
    constant _16* vp_c13 [[id(5)]];
    constant _16* vp_c7 [[id(6)]];
    texture2d<float> vp_t_tcb_24 [[id(7)]];
    sampler vp_t_tcb_24Smplr [[id(8)]];
    texture2d_array<float> vp_t_tcb_16 [[id(9)]];
    sampler vp_t_tcb_16Smplr [[id(10)]];
    texture3d<float> vp_t_tcb_32 [[id(11)]];
    sampler vp_t_tcb_32Smplr [[id(12)]];
    texture3d<float> vp_t_tcb_30 [[id(13)]];
    sampler vp_t_tcb_30Smplr [[id(14)]];
    texture2d<float> vp_t_tcb_1C [[id(15)]];
    sampler vp_t_tcb_1CSmplr [[id(16)]];
    texture2d_array<float> vp_t_tcb_14 [[id(17)]];
    sampler vp_t_tcb_14Smplr [[id(18)]];
    sampler vp_t_tcb_24Smplr_w [[id(19)]];
    sampler vp_t_tcb_32Smplr_w [[id(20)]];
    sampler vp_t_tcb_30Smplr_w [[id(21)]];
    sampler vp_t_tcb_1CSmplr_w [[id(22)]];
    sampler vp_t_tcb_14Smplr_w [[id(23)]];
    constant dm_border_t* dm_border [[id(24)]];
};

struct main0_out
{
    float4 m_84 [[user(locn0)]];
    float4 m_80 [[user(locn1)]];
    float4 m_61 [[user(locn2)]];
    float4 m_102 [[user(locn3)]];
    float4 m_82 [[user(locn4)]];
    float4 m_73 [[user(locn5)]];
    float4 m_92 [[user(locn6)]];
    float4 m_88 [[user(locn7)]];
    float4 m_90 [[user(locn8)]];
    float4 m_94 [[user(locn9)]];
    float4 m_86 [[user(locn10)]];
    float4 m_100 [[user(locn11)]];
    float4 m_96 [[user(locn12)]];
    float4 m_98 [[user(locn13)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_71 [[attribute(1)]];
    float4 m_67 [[attribute(2)]];
    float4 m_69 [[attribute(3)]];
    float4 m_58 [[attribute(5)]];
    float4 m_63 [[attribute(6)]];
    float4 m_75 [[attribute(7)]];
    float4 m_65 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_102 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_100 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2687 = false;
    bool _1383 = false;
    bool _839 = false;
    bool _691 = false;
    bool _531 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _116 = in.m_58.w;
    float _118 = trunc(_116);
    int _121 = int(_118);
    bool _125 = _121 >= 1;
    float _127 = 0.0;
    if (!_125)
    {
        _127 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _129 = _127;
    float _131 = _129;
    if (!_125)
    {
        out.m_61.x = 0.0;
    }
    int _133 = 0;
    if (!_125)
    {
        float _135 = _129 * 5.0;
        _133 = as_type<int>(_135);
    }
    int _137 = _133;
    int _139 = _137;
    if (!_125)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2986 = as_type<float>(_137);
        out.gl_Position.z = _2986;
    }
    if (!_125)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _141 = in.m_63.w;
    bool _143 = _141 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _145 = isnan(_141);
    bool _147 = _143 || _145;
    bool _149 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _151 = _147 || _149;
    float _153 = -_141;
    float _155 = _153 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_151)
    {
        float _157 = float(_121);
        _131 = _157;
    }
    float _159 = _131;
    bool _161 = _155 >= _159;
    bool _163 = !_151;
    bool _165 = _161 || _163;
    float _167 = _159;
    if (_165)
    {
        _167 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _169 = _167;
    float _171 = _169;
    if (_165)
    {
        out.m_61.x = 0.0;
    }
    if (_165)
    {
        float _173 = _169 * 5.0;
        _139 = as_type<int>(_173);
    }
    int _175 = _139;
    if (_165)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3056 = as_type<float>(_175);
        out.gl_Position.z = _3056;
    }
    if (_165)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _177 = in.m_63.x;
    float _179 = in.m_63.y;
    float _181 = in.m_63.z;
    float _183 = _155 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _185 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _187 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _189 = _185 || _187;
    bool _191 = isnan(1.0);
    bool _193 = _189 || _191;
    float _195 = 0.0;
    float _197 = _183;
    if (!_193)
    {
        float _199 = _183 * _183;
        float _201 = _199 * 0.5;
        _195 = _201;
    }
    float _203 = _195;
    float _205 = 0.0;
    float _207 = _203;
    if (!_193)
    {
        float _209 = _155 * _155;
        float _211 = _209 * 0.5;
        _205 = _211;
    }
    float _213 = _205;
    if (!_193)
    {
        float _215 = _203 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _207 = _215;
    }
    float _217 = _207;
    bool _219 = !_193;
    float _221 = _217;
    float _223 = 0.0;
    if (!_219)
    {
        float _225 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _227 = log2(_225);
        float _229 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _231 = _229 + 1.0;
        float _233 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _235 = _183 * _227;
        float _237 = 1.0 / _231;
        float _239 = _233 * 0.693147182464599609375;
        float _241 = exp2(_235);
        float _243 = 1.0 / _239;
        float _245 = _241 + (-1.0);
        float _247 = -_245;
        float _249 = fma(_247, _243, _183);
        float _251 = _249 * _237;
        float _253 = _251 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _171 = _243;
        _221 = _253;
        _223 = _237;
    }
    float _255 = _171;
    float _257 = _221;
    float _259 = _223;
    bool _261 = !_193;
    float _263 = _255;
    float _265 = _259;
    if (!_261)
    {
        float _267 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _269 = log2(_267);
        float _271 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _273 = _271 + 1.0;
        float _275 = 1.0 / _273;
        float _277 = _183 * _269;
        float _279 = exp2(_277);
        float _281 = -_279;
        float _283 = _281 + 1.0;
        float _285 = _283 * _275;
        _263 = _279;
        _197 = _285;
    }
    float _287 = _263;
    float _289 = _197;
    float _291 = _287;
    if (!_193)
    {
        _265 = _155;
    }
    float _293 = _265;
    float _295 = _257 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _297 = _293;
    if (!_193)
    {
        float _299 = _213 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _291 = _299;
    }
    float _301 = _291;
    bool _303 = !_193;
    float _305 = _301;
    if (!_303)
    {
        float _307 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _309 = log2(_307);
        float _311 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _313 = _311 + 1.0;
        float _315 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _317 = _155 * _309;
        float _319 = 1.0 / _313;
        float _321 = _315 * 0.693147182464599609375;
        float _323 = exp2(_317);
        float _325 = 1.0 / _321;
        float _327 = _323 + (-1.0);
        float _329 = -_327;
        float _331 = fma(_329, _325, _155);
        float _333 = _331 * _319;
        float _335 = _333 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _305 = _335;
    }
    float _337 = _305;
    bool _339 = !_193;
    if (!_339)
    {
        float _341 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _343 = log2(_341);
        float _345 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _347 = _345 + 1.0;
        float _349 = 1.0 / _347;
        float _351 = _155 * _343;
        float _353 = exp2(_351);
        float _355 = -_353;
        float _357 = _355 + 1.0;
        float _359 = _357 * _349;
        _297 = _359;
    }
    float _361 = _297;
    float _363 = _257 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _365 = _257 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _367 = _337 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _369 = fma(_289, _177, _295);
    float _371 = fma(_289, _179, _363);
    float _373 = fma(_289, _181, _365);
    float _375 = _337 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _377 = fma(_361, _179, _367);
    float _379 = _337 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _381 = in.m_65.w;
    float _383 = fma(_361, _177, _375);
    float _385 = -_377;
    float _387 = _371 + _385;
    float _389 = fma(_361, _181, _379);
    float _391 = in.m_58.x;
    float _393 = in.m_58.y;
    float _395 = in.m_58.z;
    float _397 = -_383;
    float _399 = _369 + _397;
    float _401 = _387 * _387;
    float _403 = -_389;
    float _405 = _373 + _403;
    float _407 = in.m_67.y;
    float _409 = fma(_399, _399, _401);
    float _411 = in.m_69.y;
    float _413 = fma(_405, _405, _409);
    float _415 = in.m_71.y;
    float _417 = in.m_67.x;
    float _419 = sqrt(_413);
    float _421 = in.m_69.x;
    float _423 = in.m_71.x;
    float _425 = fma(_369, _381, _391);
    float _427 = fma(_373, _381, _395);
    float _429 = in.m_67.z;
    float _431 = _387 * _407;
    float _433 = in.m_69.z;
    bool _435 = _419 >= 9.9999999747524270787835121154785e-07;
    bool _437 = isnan(_419);
    bool _439 = _435 || _437;
    bool _441 = isnan(9.9999999747524270787835121154785e-07);
    bool _443 = _439 || _441;
    float _445 = _387 * _411;
    float _447 = in.m_71.z;
    float _449 = _387 * _415;
    float _451 = _407 * _407;
    out.m_73.x = _425;
    float _453 = fma(_399, _417, _431);
    out.m_73.z = _427;
    float _455 = fma(_399, _421, _445);
    float _457 = fma(_399, _423, _449);
    float _459 = fma(_415, _415, _451);
    float _461 = fma(_371, _381, _393);
    float _463 = fma(_405, _429, _453);
    float _465 = fma(_411, _411, _459);
    float _467 = fma(_405, _433, _455);
    float _469 = fma(_405, _447, _457);
    float _471 = _405;
    float _473 = _463;
    float _475 = _469;
    float _477 = _469;
    float _479 = _427;
    if (_443)
    {
        _471 = _463;
    }
    float _481 = _471;
    float _483 = _481;
    float _485 = _481;
    if (_443)
    {
        _473 = _467;
    }
    float _487 = _473;
    float _489 = _487;
    float _491 = _487;
    if (!_443)
    {
        bool _493 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _495 = !_493;
        if (!_495)
        {
            float _497 = _407 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _499 = _415 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _501 = _411 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _503 = fma(_417, (*spvDescriptorSet0.vp_c9)._m0[16].x, _497);
            float _505 = fma(_423, (*spvDescriptorSet0.vp_c9)._m0[16].x, _499);
            float _507 = fma(_421, (*spvDescriptorSet0.vp_c9)._m0[16].x, _501);
            float _509 = fma(_429, (*spvDescriptorSet0.vp_c9)._m0[16].z, _503);
            float _511 = fma(_447, (*spvDescriptorSet0.vp_c9)._m0[16].z, _505);
            float _513 = fma(_433, (*spvDescriptorSet0.vp_c9)._m0[16].z, _507);
            float _515 = _509 * _509;
            float _517 = fma(_511, _511, _515);
            float _519 = fma(_513, _513, _517);
            float _521 = rsqrt(_519);
            float _523 = _521 * 9.9999999747524270787835121154785e-07;
            float _525 = _511 * _523;
            float _527 = _509 * _523;
            float _529 = _513 * _523;
            _485 = _527;
            _477 = _525;
            _491 = _529;
            _531 = true;
        }
        else
        {
            float _533 = _179 * _179;
            float _535 = fma(_177, _177, _533);
            float _537 = fma(_181, _181, _535);
            float _539 = sqrt(_537);
            bool _541 = _539 >= 9.9999999747524270787835121154785e-07;
            bool _543 = isnan(_539);
            bool _545 = _541 || _543;
            bool _547 = isnan(9.9999999747524270787835121154785e-07);
            bool _549 = _545 || _547;
            float _551 = _539;
            if (!_549)
            {
                float _553 = _393 * _393;
                float _555 = fma(_391, _391, _553);
                float _557 = fma(_395, _395, _555);
                float _559 = sqrt(_557);
                bool _561 = _559 >= 9.9999999747524270787835121154785e-07;
                bool _563 = isnan(_559);
                bool _565 = _561 || _563;
                bool _567 = isnan(9.9999999747524270787835121154785e-07);
                bool _569 = _565 || _567;
                float _571 = _465;
                if (!_569)
                {
                    float _573 = rsqrt(_465);
                    _571 = _573;
                }
                float _575 = _571;
                if (!_569)
                {
                    float _577 = _575 * 9.9999999747524270787835121154785e-07;
                    _551 = _577;
                }
                float _579 = _551;
                if (!_569)
                {
                    float _581 = _415 * _579;
                    _475 = _581;
                }
                float _583 = _475;
                _477 = _583;
                if (!_569)
                {
                    float _585 = _407 * _579;
                    _483 = _585;
                }
                float _587 = _483;
                _485 = _587;
                if (!_569)
                {
                    float _589 = _411 * _579;
                    _489 = _589;
                }
                float _591 = _489;
                bool _593 = !_569;
                _491 = _591;
                _531 = _593;
                if (!_531)
                {
                    float _595 = _407 * _393;
                    float _597 = _415 * _393;
                    float _599 = _411 * _393;
                    float _601 = fma(_391, _417, _595);
                    float _603 = fma(_391, _423, _597);
                    float _605 = fma(_391, _421, _599);
                    float _607 = fma(_395, _429, _601);
                    float _609 = fma(_395, _447, _603);
                    float _611 = fma(_395, _433, _605);
                    float _613 = _607 * _607;
                    float _615 = fma(_609, _609, _613);
                    float _617 = fma(_611, _611, _615);
                    float _619 = rsqrt(_617);
                    float _621 = _619 * 9.9999999747524270787835121154785e-07;
                    float _623 = _609 * _621;
                    float _625 = _607 * _621;
                    float _627 = _611 * _621;
                    _485 = _625;
                    _477 = _623;
                    _491 = _627;
                    _531 = true;
                }
            }
            else
            {
                float _629 = _407 * _179;
                float _631 = _415 * _179;
                float _633 = _411 * _179;
                float _635 = fma(_177, _417, _629);
                float _637 = fma(_177, _423, _631);
                float _639 = fma(_177, _421, _633);
                float _641 = fma(_181, _429, _635);
                float _643 = fma(_181, _447, _637);
                float _645 = fma(_181, _433, _639);
                float _647 = _641 * _641;
                float _649 = fma(_643, _643, _647);
                float _651 = fma(_645, _645, _649);
                float _653 = rsqrt(_651);
                float _655 = _653 * 9.9999999747524270787835121154785e-07;
                float _657 = _643 * _655;
                float _659 = _641 * _655;
                float _661 = _645 * _655;
                _485 = _659;
                _477 = _657;
                _491 = _661;
            }
        }
    }
    _531 = false;
    float _663 = _485;
    float _665 = _477;
    float _667 = _491;
    bool _669 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _671 = !_669;
    float _689;
    if (!_671)
    {
        float _673 = in.m_75.x;
        float _675 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _677 = _673 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _679 = fma(_677, (*spvDescriptorSet0.vp_c9)._m0[12].x, _155);
        float _681 = _679 * _675;
        float _683 = floor(_681);
        float _685 = -_683;
        float _687 = _681 + _685;
        _689 = _687;
        _691 = true;
    }
    else
    {
        float _693 = float(_121);
        float _695 = 1.0 / _693;
        float _697 = _155 * _695;
        _689 = _697;
    }
    _691 = false;
    float _699 = _689;
    float _701 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _703 = _699 + _701;
    bool _705 = _699 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _707 = isnan(_699);
    bool _709 = _705 || _707;
    bool _711 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _713 = _709 || _711;
    float _715 = float(_713);
    bool _717 = _699 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _719 = isnan(_699);
    bool _721 = _717 || _719;
    bool _723 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _725 = _721 || _723;
    float _727 = float(_725);
    float _729 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _731 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _729;
    float _733 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _735 = _733 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _737 = -_715;
    float _739 = _737 + 1.0;
    float _741 = 1.0 / _735;
    bool _743 = _699 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _745 = isnan(_699);
    bool _747 = _743 || _745;
    bool _749 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _751 = _747 || _749;
    float _753 = float(_751);
    float _755 = _727 * _739;
    float _757 = -_727;
    float _759 = _757 + 1.0;
    bool _761 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _763 = _753 * _759;
    float _765 = 1.0 / _731;
    float _767 = -_753;
    float _769 = _767 + 1.0;
    float _771 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _773 = _771 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _775 = _703 * _765;
    float _777 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _779 = _699 + _777;
    float _781 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _783 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _781;
    float _785 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _787 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _785;
    float _789 = _779 * _741;
    float _791 = fma(_783, _775, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _793 = fma(_787, _775, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _795 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _797 = _795 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _799 = fma(_773, _789, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _801 = _791 * _763;
    float _803 = _793 * _763;
    float _805 = fma(_797, _789, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _807 = fma(_769, (*spvDescriptorSet0.vp_c9)._m0[143].x, _801);
    float _809 = fma(_769, (*spvDescriptorSet0.vp_c9)._m0[143].y, _803);
    float _811 = fma(_805, _755, _807);
    float _813 = fma(_799, _755, _809);
    float _815 = fma(_715, (*spvDescriptorSet0.vp_c9)._m0[145].x, _811);
    float _817 = fma(_715, (*spvDescriptorSet0.vp_c9)._m0[145].y, _813);
    bool _819 = !_761;
    float _837;
    if (!_819)
    {
        float _821 = in.m_75.x;
        float _823 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _825 = _821 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _827 = fma(_825, (*spvDescriptorSet0.vp_c9)._m0[11].y, _155);
        float _829 = _827 * _823;
        float _831 = floor(_829);
        float _833 = -_831;
        float _835 = _829 + _833;
        _837 = _835;
        _839 = true;
    }
    else
    {
        float _841 = float(_121);
        float _843 = 1.0 / _841;
        float _845 = _155 * _843;
        _837 = _845;
    }
    _839 = false;
    float _847 = _837;
    float _849 = _663 * _663;
    float _851 = in.m_75.x;
    float _853 = in.m_75.y;
    float _855 = _461 * _407;
    float _857 = _461 * _411;
    float _859 = fma(_665, _665, _849);
    float _861 = as_type<float>(int(gl_VertexIndex));
    float _863 = fma(_425, _417, _855);
    float _865 = fma(_667, _667, _859);
    float _867 = _461 * _415;
    float _869 = fma(_427, _429, _863);
    bool _871 = _847 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _873 = isnan(_847);
    bool _875 = _871 || _873;
    bool _877 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _879 = _875 || _877;
    float _881 = float(_879);
    float _883 = fma(_425, _423, _867);
    float _885 = rsqrt(_865);
    float _887 = fma(_425, _421, _857);
    float _889 = in.m_65.x;
    float _891 = in.m_65.y;
    float _893 = _869 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _895 = fma(_427, _433, _887);
    bool _897 = _847 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _899 = isnan(_847);
    bool _901 = _897 || _899;
    bool _903 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _905 = _901 || _903;
    float _907 = float(_905);
    bool _909 = _851 > 0.5;
    bool _911 = _853 > 0.5;
    float _913 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _915 = _885 * _667;
    float _917 = _885 * _663;
    float _919 = _885 * _665;
    int _921 = as_type<int>(_861) & 1;
    bool _923 = _921 != 0;
    int _925 = as_type<int>(_861) & 2;
    bool _927 = _925 != 0;
    float _929 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _931 = _915 * _929;
    float _933 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _935 = _917 * _933;
    float _937 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _939 = _937 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _941 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _943 = -_931;
    float _945 = fma(_919, _941, _943);
    float _947 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _949 = -_935;
    float _951 = fma(_915, _947, _949);
    float _953 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _955 = _919 * _953;
    float _957 = 1.0 / _939;
    float _959 = _945 * _945;
    float _961 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _963 = _961 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _965 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _967 = -_955;
    float _969 = fma(_917, _965, _967);
    int _971 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _973 = _971 != 0;
    float _975 = fma(_951, _951, _959);
    int _977 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _979 = _977 != 0;
    float _981 = _815 * _889;
    float _983 = 1.0 / _963;
    float _985 = fma(_969, _969, _975);
    float _987 = fma(_427, _447, _883);
    float _989 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _991 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _989;
    float _993 = _817 * _891;
    float _995 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _997 = _995 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    bool _999 = !_927;
    float _1001 = _999 ? (-0.5) : 0.5;
    float _1003 = rsqrt(_985);
    float _1005 = _991 * _957;
    bool _1007 = !_923;
    float _1009 = _1007 ? (-0.5) : 0.5;
    float _1011 = _993 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1013 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1001);
    float _1015 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1017 = _847 + _1015;
    float _1019 = _981 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1021 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1009);
    float _1023 = _997 * _983;
    float _1025 = _1011 * _1013;
    float _1027 = fma(_1005, _1017, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1029 = _1019 * _1021;
    float _1031 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1033 = _1025 * _919;
    float _1035 = _987 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1037 = _945 * _1003;
    float _1039 = _969 * _1003;
    float _1041 = _951 * _1003;
    float _1043 = _1025 * _915;
    float _1045 = _919 * _1037;
    float _1047 = _917 * _1039;
    float _1049 = fma(_1029, _1041, _1033);
    float _1051 = fma(_1029, _1039, _1043);
    float _1053 = -_1045;
    float _1055 = fma(_917, _1041, _1053);
    float _1057 = -_1047;
    float _1059 = fma(_915, _1037, _1057);
    float _1061 = _895 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1063 = fma(_1031, _1055, _1051);
    float _1065 = fma(_1031, _1059, _1049);
    float _1067 = -_881;
    float _1069 = _1067 + 1.0;
    bool _1071 = _847 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1073 = isnan(_847);
    bool _1075 = _1071 || _1073;
    bool _1077 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1079 = _1075 || _1077;
    float _1081 = float(_1079);
    float _1083 = _1061 + _1063;
    float _1085 = _1035 + _1065;
    float _1087 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1089 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1091 = _1083 + _1089;
    float _1093 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1095 = _1085 + _1093;
    float _1097 = _907 * _1069;
    float _1099 = _1091 * _1091;
    float _1101 = _1095 * _1095;
    float _1103 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1105 = -_1081;
    float _1107 = _1105 + 1.0;
    float _1109 = _1087 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1111 = _1101 + _1099;
    float _1113 = _1027 * _1097;
    float _1115 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1117 = _1103 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1119 = sqrt(_1111);
    float _1121 = _913 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1123 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1125 = _847 + _1123;
    float _1127 = _1025 * _917;
    float _1129 = _915 * _1041;
    float _1131 = _881 * _1107;
    out.m_80.x = _1117;
    out.m_80.y = _1109;
    out.m_80.z = _1121;
    out.m_80.w = _1115;
    float _1133 = fma(_1029, _1037, _1127);
    float _1135 = fma(_1023, _1125, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1137 = -_1129;
    float _1139 = fma(_919, _1039, _1137);
    float _1141 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1143 = -_907;
    float _1145 = _1143 + 1.0;
    float _1147 = fma(_1031, _1139, _1133);
    float _1149 = fma(_1145, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1113);
    bool _1151 = _1119 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1153 = _893 + _1147;
    float _1155 = fma(_1135, _1131, _1149);
    float _1157 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1159 = -_1001;
    int _1161 = _911 ? as_type<int>(_1159) : as_type<int>(_1001);
    float _1163 = _1001 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _1165 = !_979;
    float _1167 = _1165 ? _1001 : as_type<float>(_1161);
    float _1169 = -_1009;
    int _1171 = _909 ? as_type<int>(_1169) : as_type<int>(_1009);
    float _1173 = _1101;
    float _1175 = _1099;
    float _1177 = _1085;
    float _1179 = _1083;
    float _1181 = _1059;
    float _1183 = _1039;
    float _1185 = _1035;
    if (!_1151)
    {
        _479 = _1153;
    }
    float _1187 = _479;
    bool _1189 = !_1151;
    float _1191 = _1187;
    if (!_1189)
    {
        float _1193 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1195 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1197 = _1119 + _1195;
        float _1199 = rsqrt(_1111);
        float _1201 = _1197 * _1193;
        float _1203 = _1153 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1205 = _1201 * 0.15915493667125701904296875;
        float _1207 = _1205 * 6.283185482025146484375;
        float _1209 = sin(_1207);
        float _1211 = _1205 * 6.283185482025146484375;
        float _1213 = cos(_1211);
        float _1215 = fma(_1209, _1203, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1217 = _1199 * _1215;
        float _1219 = fma(_1095, _1217, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1221 = _1213 + (-1.0);
        float _1223 = fma(_1091, _1217, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1225 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1227 = _1219 + _1225;
        float _1229 = _1221 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1231 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1233 = _1223 + _1231;
        float _1235 = _1227 * _1227;
        float _1237 = fma(_1153, _1213, _1229);
        float _1239 = _1233 * _1233;
        _1191 = _1237;
        _1173 = _1235;
        _1175 = _1239;
        _1177 = _1219;
        _1179 = _1223;
    }
    float _1241 = _1191;
    float _1243 = _1173;
    float _1245 = _1175;
    float _1247 = _1177;
    float _1249 = _1179;
    float _1251 = fma(_1163, _1163, 1.0);
    float _1253 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1255 = _1241 + _1253;
    bool _1257 = !_973;
    float _1259 = _1257 ? _1009 : as_type<float>(_1171);
    float _1261 = -_1167;
    float _1263 = _1261 + 0.5;
    float _1265 = fma(_1081, (*spvDescriptorSet0.vp_c9)._m0[117].x, _1155);
    float _1267 = fma(_1255, _1255, _1243);
    float _1269 = rsqrt(_1251);
    float _1271 = _1009 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1273 = _919 * _1163;
    float _1275 = _917 * _1163;
    float _1277 = _915 * _1163;
    float _1279 = _1259 + 0.5;
    float _1281 = _1263 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1283 = fma(_1041, _1271, _1273);
    float _1285 = fma(_1037, _1271, _1275);
    float _1287 = fma(_1039, _1271, _1277);
    float _1289 = _1279 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1291 = _1281 * _1157;
    float _1293 = _1267 + _1245;
    float _1295 = _1289 * _1141;
    float _1297 = _1163 * _1269;
    float _1299 = sqrt(_1293);
    float _1301 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1303 = -_1297;
    float _1305 = _1059 * _1303;
    float _1307 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1309 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1311 = _1059 + _1283;
    float _1313 = fma(_919, _1269, _1305);
    float _1315 = _1139 + _1285;
    float _1317 = -_1297;
    float _1319 = _1139 * _1317;
    float _1321 = -_1297;
    float _1323 = _1055 * _1321;
    float _1325 = _1301 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1327 = _1309 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1329 = _1307 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1331 = _1265 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1333 = fma(_917, _1269, _1319);
    float _1335 = fma(_915, _1269, _1323);
    float _1337 = _1055 + _1287;
    out.m_82.x = _1295;
    out.m_82.y = _1291;
    bool _1339 = _1299 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1341 = isnan(_1299);
    bool _1343 = _1339 || _1341;
    bool _1345 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1347 = _1343 || _1345;
    out.m_84.x = _1325;
    out.m_84.y = _1327;
    out.m_84.z = _1329;
    out.m_84.w = _1331;
    out.m_86.x = _1041;
    out.m_86.y = _1037;
    out.m_86.z = _1039;
    out.m_88.x = _1313;
    out.m_88.y = _1333;
    out.m_88.z = _1335;
    if (!_1347)
    {
        _1181 = 1.0;
    }
    float _1349 = _1181;
    out.m_90.x = _1311;
    out.m_90.y = _1315;
    out.m_90.z = _1337;
    bool _1351 = !_1347;
    float _1353 = _1349;
    if (!_1351)
    {
        bool _1355 = _1299 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1357 = isnan(_1299);
        bool _1359 = _1355 || _1357;
        bool _1361 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1363 = _1359 || _1361;
        if (!_1363)
        {
            float _1365 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1367 = _1299 + _1365;
            float _1369 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1371 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1369;
            float _1373 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1375 = _1373 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1377 = 1.0 / _1371;
            float _1379 = _1367 * _1377;
            float _1381 = fma(_1379, _1375, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1353 = _1381;
            _1383 = true;
        }
        else
        {
            bool _1385 = _1299 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1387 = isnan(_1299);
            bool _1389 = _1385 || _1387;
            bool _1391 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1393 = _1389 || _1391;
            if (!_1393)
            {
                float _1395 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1397 = _1299 + _1395;
                float _1399 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1401 = _1399 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1403 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1405 = _1403 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1407 = 1.0 / _1401;
                float _1409 = _1397 * _1407;
                float _1411 = fma(_1409, _1405, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1353 = _1411;
                _1383 = true;
            }
            else
            {
                _1353 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1383 = false;
    float _1413 = _1353;
    float _1415 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1417 = _1247 + _1415;
    float _1419 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1421 = _1241 + _1419;
    float _1423 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1425 = _1249 + _1423;
    bool _1427 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1429 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1431 = _1427 || _1429;
    bool _1433 = isnan(0.5);
    bool _1435 = _1431 || _1433;
    float _1437 = fma(_1417, _1413, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1439 = fma(_1421, _1413, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1441 = fma(_1425, _1413, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1443 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    float _1445 = _1417;
    if (_1435)
    {
        _1443 = _1437;
    }
    float _1447 = _1443;
    float _1449 = _1447;
    if (_1435)
    {
        _1445 = _1439;
    }
    float _1451 = _1445;
    float _1453 = _1451;
    if (_1435)
    {
        _1183 = _1441;
    }
    float _1455 = _1183;
    float _1457 = _1455;
    if (!_1435)
    {
        float _1459 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1461 = _893 + _1459;
        float _1463 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1465 = _1035 + _1463;
        float _1467 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1469 = _1461 * _1461;
        float _1471 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1473 = _1061 + _1471;
        float _1475 = fma(_1465, _1465, _1469);
        float _1477 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1479 = fma(_1473, _1473, _1475);
        float _1481 = sqrt(_1479);
        float _1483 = _1467 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1485 = precise::min(_1481, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1487 = _1485 * _1477;
        float _1489 = -_1035;
        float _1491 = _1489 + _1437;
        float _1493 = _1483 * _1487;
        float _1495 = -_893;
        float _1497 = _1495 + _1439;
        float _1499 = -_1061;
        float _1501 = _1499 + _1441;
        float _1503 = fma(_1491, _1493, _1035);
        float _1505 = fma(_1497, _1493, _893);
        float _1507 = fma(_1501, _1493, _1061);
        _1453 = _1505;
        _1449 = _1503;
        _1457 = _1507;
    }
    float _1509 = _1453;
    float _1511 = _1449;
    float _1513 = _1457;
    float _1515 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1517 = _1509 + _1515;
    float _1519 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1521 = _1511 + _1519;
    float _1523 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1525 = _1513 + _1523;
    float _1527 = _893 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1529 = _1517 * _1517;
    float _1531 = fma(_1035, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1527);
    float _1533 = fma(_1521, _1521, _1529);
    float _1535 = fma(_1061, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1531);
    float _1537 = fma(_1525, _1525, _1533);
    float _1539 = _1535 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1541 = rsqrt(_1537);
    float _1543 = fma(_1061, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1545 = 1.0 / _1539;
    float _1547 = _1521 * _1541;
    float _1549 = _1525 * _1541;
    float _1551 = _893 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1553 = _1517 * _1541;
    float _1555 = _1547 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1557 = _1549 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1559 = fma(_1035, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1551);
    float _1561 = sqrt(_1537);
    float _1563 = _1555 * _1555;
    float _1565 = _1557 * _1557;
    float _1567 = fma(_1061, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1559);
    float _1569 = _1563 + _1565;
    float _1571 = _1567 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1573 = floor(_1543);
    float _1575 = _1571 + _1539;
    float _1577 = _1575 * _1545;
    float _1579 = _1577 * 0.5;
    float _1581 = sqrt(_1569);
    float _1583 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1585 = fma(_1579, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1583);
    float _1587 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _1589 = -_1573;
    float _1591 = _1543 + _1589;
    float _1593 = 1.0 / _1585;
    float _1595 = _893 + _1587;
    float _1597 = fma(_1035, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1599 = _1595 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1601 = _1595 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    bool _1603 = _1581 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1605 = floor(_1597);
    float _1607 = fma(_1035, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1599);
    float _1609 = fma(_1035, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1601);
    float _1611 = fma(_1061, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1607);
    float _1613 = fma(_1061, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1609);
    float _1615 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1617 = _1593 * _1615;
    float _1619 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1621 = _1581 + _1619;
    float _1623 = _1611 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1625 = _1613 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _1627 = _1587;
    int _1629 = 2;
    float _1631 = _1621;
    float _1633 = _1557;
    float _1635 = _1563;
    float _1637 = _1625;
    float _1639 = _1553;
    float _1641 = _1617;
    if (_1603)
    {
        float _1643 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1627 = _1643;
    }
    float _1645 = _1627;
    bool _1647 = _1617 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    bool _1649 = _1617 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _1651 = -_1605;
    float _1653 = _1597 + _1651;
    float _1655 = trunc(_1623);
    int _1657 = int(_1655);
    float _1659 = _1605;
    if (!_1647)
    {
        _1629 = 1;
    }
    int _1661 = _1629;
    int _1663 = _1661;
    if (_1603)
    {
        float _1665 = _1621 * _1645;
        _1631 = _1665;
    }
    float _1667 = _1631;
    float _1669 = trunc(_1625);
    int _1671 = int(_1669);
    float _1673 = 0.0;
    if (_1603)
    {
        float _1675 = _1667 * 0.15915493667125701904296875;
        _1673 = _1675;
    }
    float _1677 = _1673;
    bool _1679 = !_1647;
    int _1681 = _1679 ? 0 : 1;
    float _1683 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    int _1685 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1687 = _1657 + _1685;
    int _1689 = _1687 + 1;
    float _1691 = _1611;
    if (_1603)
    {
        float _1693 = _1677 * 6.283185482025146484375;
        float _1695 = sin(_1693);
        _1691 = _1695;
    }
    float _1697 = _1691;
    if (!_1649)
    {
        _1663 = _1681;
    }
    int _1699 = _1663;
    float _1701 = precise::max(0.0, _1683);
    int _1703 = _1699 << 6;
    bool _1705 = _1689 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _1707 = -_1553;
    float _1709 = -_1701;
    float _1711 = fma(_1707, (*spvDescriptorSet0.vp_c15)._m0[24].y, _1709);
    int _1713 = _1703 + 96;
    uint _1716 = uint(int(uint(_1713) >> uint(2)));
    uint _1718 = uint(int(uint(int(_1716)) >> uint(2)));
    int _1720 = int(_1716) & 3;
    float _1722 = (*spvDescriptorSet0.vp_c15)._m0[int(_1718)][_1720];
    int _1724 = int(_1716) + 1;
    uint _1726 = uint(int(uint(_1724) >> uint(2)));
    int _1728 = _1724 & 3;
    float _1730 = (*spvDescriptorSet0.vp_c15)._m0[int(_1726)][_1728];
    float _1732 = _1569;
    float _1734 = _1701;
    float _1736 = _1711;
    if (_1603)
    {
        float _1738 = rsqrt(_1569);
        _1732 = _1738;
    }
    float _1740 = _1732;
    int _1742 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1744 = _1671 + _1742;
    int _1746 = _1744 + 1;
    if (_1603)
    {
        float _1748 = _1711 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1734 = _1748;
    }
    float _1750 = _1734;
    int _1752 = _1689 | _1746;
    if (_1603)
    {
        float _1754 = fma(_1697, _1750, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1659 = _1754;
    }
    float _1756 = _1659;
    int _1758 = _1703 + 48;
    uint _1760 = uint(int(uint(_1758) >> uint(2)));
    uint _1762 = uint(int(uint(int(_1760)) >> uint(2)));
    int _1764 = int(_1760) & 3;
    float _1766 = (*spvDescriptorSet0.vp_c15)._m0[int(_1762)][_1764];
    int _1768 = int(_1760) + 1;
    uint _1770 = uint(int(uint(_1768) >> uint(2)));
    int _1772 = _1768 & 3;
    float _1774 = (*spvDescriptorSet0.vp_c15)._m0[int(_1770)][_1772];
    float _1776 = _1677;
    if (_1603)
    {
        float _1778 = _1677 * 6.283185482025146484375;
        float _1780 = cos(_1778);
        _1776 = _1780;
    }
    float _1782 = _1776;
    bool _1784 = _1752 < 0;
    bool _1786 = _1784 || _1705;
    float _1788 = _1509 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    bool _1790 = _1746 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1792 = _1790 || _1786;
    float _1794 = fma(_1511, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1788);
    int _1796 = _1703 + 104;
    uint _1798 = uint(int(uint(_1796) >> uint(2)));
    uint _1800 = uint(int(uint(int(_1798)) >> uint(2)));
    int _1802 = int(_1798) & 3;
    float _1804 = (*spvDescriptorSet0.vp_c15)._m0[int(_1800)][_1802];
    int _1806 = int(_1798) + 1;
    uint _1808 = uint(int(uint(_1806) >> uint(2)));
    int _1810 = _1806 & 3;
    float _1812 = (*spvDescriptorSet0.vp_c15)._m0[int(_1808)][_1810];
    float _1814 = 0.0;
    float _1816 = _1740;
    if (_1603)
    {
        float _1818 = _1740 * _1756;
        _1814 = _1818;
    }
    float _1820 = _1814;
    float _1822 = fma(_1513, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1794);
    float _1824 = _1820;
    if (_1603)
    {
        float _1826 = _1557 * _1820;
        _1633 = _1826;
    }
    float _1828 = _1633;
    int _1830 = _1703 + 64;
    uint _1832 = uint(int(uint(_1830) >> uint(2)));
    uint _1834 = uint(int(uint(int(_1832)) >> uint(2)));
    int _1836 = int(_1832) & 3;
    float _1838 = (*spvDescriptorSet0.vp_c15)._m0[int(_1834)][_1836];
    int _1840 = int(_1832) + 1;
    uint _1842 = uint(int(uint(_1840) >> uint(2)));
    int _1844 = _1840 & 3;
    float _1846 = (*spvDescriptorSet0.vp_c15)._m0[int(_1842)][_1844];
    if (_1603)
    {
        float _1848 = _1782 + (-1.0);
        _1816 = _1848;
    }
    float _1850 = _1816;
    float _1852 = 0.0;
    float _1854 = _1850;
    if (!_1792)
    {
        float _1856 = floor(_1625);
        _1852 = _1856;
    }
    float _1858 = _1852;
    float _1860 = 0.0;
    if (_1603)
    {
        float _1862 = _1850 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1860 = _1862;
    }
    float _1864 = _1860;
    if (!_1603)
    {
        _1854 = _1555;
    }
    float _1866 = _1854;
    float _1868 = _1866;
    if (_1603)
    {
        float _1870 = _1555 * _1820;
        _1868 = _1870;
    }
    float _1872 = _1868;
    int _1874 = _1703 + 80;
    uint _1876 = uint(int(uint(_1874) >> uint(2)));
    uint _1878 = uint(int(uint(int(_1876)) >> uint(2)));
    int _1880 = int(_1876) & 3;
    float _1882 = (*spvDescriptorSet0.vp_c15)._m0[int(_1878)][_1880];
    int _1884 = int(_1876) + 1;
    uint _1886 = uint(int(uint(_1884) >> uint(2)));
    int _1888 = _1884 & 3;
    float _1890 = (*spvDescriptorSet0.vp_c15)._m0[int(_1886)][_1888];
    if (_1603)
    {
        float _1892 = fma(_1711, _1782, _1864);
        _1736 = _1892;
    }
    float _1894 = _1736;
    float _1896 = _1822 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    if (_1603)
    {
        float _1898 = _1872 * _1872;
        _1635 = _1898;
    }
    float _1900 = _1635;
    if (!_1603)
    {
        _1824 = _1565;
    }
    float _1902 = _1824;
    float _1904 = _1902;
    if (_1603)
    {
        float _1906 = _1828 * _1828;
        _1904 = _1906;
    }
    float _1908 = _1904;
    float _1910 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1912 = fma(_1894, _1894, _1900);
    int _1914 = _1703 + 56;
    uint _1916 = uint(int(uint(_1914) >> uint(2)));
    uint _1918 = uint(int(uint(int(_1916)) >> uint(2)));
    int _1920 = int(_1916) & 3;
    float _1922 = (*spvDescriptorSet0.vp_c15)._m0[int(_1918)][_1920];
    int _1924 = int(_1916) + 1;
    uint _1926 = uint(int(uint(_1924) >> uint(2)));
    int _1928 = _1924 & 3;
    float _1930 = (*spvDescriptorSet0.vp_c15)._m0[int(_1926)][_1928];
    float _1932 = _1896 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float2 _5892 = float2(_1653, _1591);
    float _1934 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5892, float2(0.0), isnan(_5892)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5892, float2(0.0), isnan(_5892)), level(0.0)).x;
    int _1936 = as_type<int>(_1932);
    if (!_1792)
    {
        float _1938 = -_1858;
        float _1940 = _1625 + _1938;
        _1637 = _1940;
    }
    float _1942 = _1637;
    float _1944 = -_1932;
    float _1946 = fma(_1944, _1910, 1.0);
    if (!_1792)
    {
        int _1948 = _1746 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1950 = _1948 + _1689;
        _1936 = _1950;
    }
    int _1952 = _1936;
    int _1954 = _1703 + 72;
    uint _1956 = uint(int(uint(_1954) >> uint(2)));
    uint _1958 = uint(int(uint(int(_1956)) >> uint(2)));
    int _1960 = int(_1956) & 3;
    float _1962 = (*spvDescriptorSet0.vp_c15)._m0[int(_1958)][_1960];
    int _1964 = int(_1956) + 1;
    uint _1966 = uint(int(uint(_1964) >> uint(2)));
    int _1968 = _1964 & 3;
    float _1970 = (*spvDescriptorSet0.vp_c15)._m0[int(_1966)][_1968];
    float _1972 = _1595 * _1730;
    float _1974 = fma(_1035, _1722, _1972);
    int _1976 = _1703 + 88;
    uint _1978 = uint(int(uint(_1976) >> uint(2)));
    uint _1980 = uint(int(uint(int(_1978)) >> uint(2)));
    int _1982 = int(_1978) & 3;
    float _1984 = (*spvDescriptorSet0.vp_c15)._m0[int(_1980)][_1982];
    int _1986 = int(_1978) + 1;
    uint _1988 = uint(int(uint(_1986) >> uint(2)));
    int _1990 = _1986 & 3;
    float _1992 = (*spvDescriptorSet0.vp_c15)._m0[int(_1988)][_1990];
    float _1994 = _1595 * _1774;
    int _1996 = as_type<int>(_1774);
    if (!_1792)
    {
        int _1998 = _1952 << 2;
        _1996 = _1998;
    }
    int _2000 = _1996;
    float _2002 = fma(_1035, _1766, _1994);
    int _2004 = _2000;
    if (!_1792)
    {
        int _2006 = 12 & _2000;
        _2004 = _2006;
    }
    int _2008 = _2004;
    float _2010 = _1912 + _1908;
    float _2012 = fma(_1061, _1804, _1974);
    float _2014 = _2012 + _1812;
    float _2016 = rsqrt(_2010);
    float _2018 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2020 = fma(_1561, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2018);
    float _2022 = precise::clamp(_2020, 0.0, 1.0);
    float _2024 = _1595 * _1846;
    int _2026 = as_type<int>((*spvDescriptorSet0.vp_c15)._m0[23].w);
    if (!_1792)
    {
        uint _2028 = uint(int(uint(_1952) >> uint(2)));
        _2026 = int(_2028);
    }
    int _2030 = _2026;
    float _2032 = -_2022;
    float _2034 = _2032 + 1.0;
    float _2036 = fma(_1035, _1838, _2024);
    float _2038 = as_type<float>(_2030);
    if (!_1792)
    {
        int _2040 = _2030 << 4;
        int _2042 = _2040 + _2008;
        _2038 = as_type<float>(_2042);
    }
    float _2044 = _2038;
    float _2046 = 1.0 / _2014;
    float _2048 = _1509 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2050 = _1595 * _1890;
    float _2052 = fma(_1511, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2048);
    float _2054 = fma(_1035, _1882, _2050);
    float _2056 = _2044;
    if (!_1792)
    {
        int _2058 = as_type<int>(_2044) + 400;
        uint _2060 = uint(int(uint(_2058) >> uint(2)));
        uint _2062 = uint(int(uint(int(_2060)) >> uint(2)));
        int _2064 = int(_2060) & 3;
        float _2066 = (*spvDescriptorSet0.vp_c15)._m0[int(_2062)][_2064];
        _2056 = _2066;
    }
    float _2068 = _2056;
    float _2070 = _2016 * _1872;
    float _2072 = abs(_2034);
    float _2074 = log2(_2072);
    float _2076 = fma(_1061, _1922, _2002);
    float _2078 = _2016 * _1894;
    float _2080 = _2070 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2082 = _2016 * _1828;
    float _2084 = _2076 + _1930;
    float _2086 = _1509 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2088 = -_2080;
    float _2090 = fma(_2078, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2088);
    float _2092 = fma(_1513, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2052);
    float _2094 = fma(_1061, _1962, _2036);
    float _2096 = fma(_1511, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2086);
    float _2098 = -_2082;
    float _2100 = fma(_2098, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2090);
    float _2102 = log2(_1946);
    float _2104 = fma(_2100, -0.5, 0.5);
    float _2106 = _2074 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2108 = fma(_1061, _1984, _2054);
    float _2110 = _2094 + _1970;
    float _2112 = _1509 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2114 = fma(_1513, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2096);
    float _2116 = _2084 * _2046;
    float _2118 = exp2(_2106);
    float _2120 = fma(_1511, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2112);
    float _2122 = _2114 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2124 = _2092 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    bool _2126 = _2116 >= 0.0;
    float _2128 = fma(_1513, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2120);
    float _2130 = _2122 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2132 = fma(_2100, 0.5, 0.5);
    bool _2134 = _2116 <= 1.0;
    bool _2136 = _2134 && _2126;
    float _2138 = _2128 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2140 = sqrt(_2104);
    float _2142 = _2102 * 0.693147182464599609375;
    float _2144 = fma(_2138, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2130);
    float _2146 = _2110 * _2046;
    float _2148 = fma(_2132, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2150 = _2108 + _1992;
    float _2152 = fma(_1896, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2144);
    float _2154 = _2078 + 1.0;
    bool _2156 = _2146 >= 0.0;
    bool _2158 = _2156 && _2136;
    float _2160 = fma(_2132, _2148, -0.212114393711090087890625);
    float _2162 = fma(_2124, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2152);
    float _2164 = _2122 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    bool _2166 = _2146 <= 1.0;
    bool _2168 = _2166 && _2158;
    float _2170 = fma(_2132, _2160, 1.570728778839111328125);
    float _2172 = _2100;
    float _2174 = _2164;
    float _2176 = _2162;
    if (!_1792)
    {
        float _2178 = floor(_1623);
        _2172 = _2178;
    }
    float _2180 = _2172;
    float _2182 = fma(_2138, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2164);
    float _2184 = _2122 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2186 = -_2078;
    float _2188 = fma(_2118, _2154, _2186);
    float _2190 = _2140 * 0.636619746685028076171875;
    float _2192 = fma(_1896, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2182);
    float _2194 = fma(_2138, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2184);
    float _2196 = _2150 * _2046;
    float _2198 = 1.0 / _2162;
    float _2200 = -_2170;
    float _2202 = fma(_2190, _2200, 1.0);
    float _2204 = fma(_1896, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2194);
    float _2206 = _2182;
    if (_2168)
    {
        float _2208 = float(_1699);
        _2174 = _2208;
    }
    float _2210 = _2174;
    float _2212 = fma(_2124, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2192);
    float _2214 = _2142 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2216 = fma(_2124, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2204);
    float _2218 = fma(_2188, 0.5, 0.5);
    float _2220 = _2216;
    if (!_1792)
    {
        float _2222 = -_2180;
        float _2224 = _1623 + _2222;
        _2206 = _2224;
    }
    float _2226 = _2206;
    float _2228 = _2210;
    if (_2168)
    {
        float _2230 = rint(_2210);
        float _2232 = precise::max(_2230, 0.0);
        uint _2234 = uint(_2232);
        uint _2236 = clamp(_2234, 0u, 65535u);
        _2228 = as_type<float>(_2236);
    }
    float _2238 = _2228;
    float _2240 = _2216 * _2198;
    float _2242 = _2212 * _2198;
    float _2244 = _2142;
    if (!_1792)
    {
        float _2246 = rint(_2068);
        float _2248 = precise::max(_2246, 0.0);
        uint _2250 = uint(_2248);
        uint _2252 = clamp(_2250, 0u, 65535u);
        _2244 = as_type<float>(_2252);
    }
    float _2254 = _2244;
    float _2256 = fma(_2240, 0.5, 0.5);
    float _2258 = fma(_2242, -0.5, 0.5);
    float _2260 = _2146;
    if (_2168)
    {
        float3 _6447 = float3(_2116, _2146, float(as_type<int>(_2238)));
        float3 _6451 = select(_6447, float3(0.0), isnan(_6447));
        float _2262 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _6451.xy, uint(rint(_6451.z)), _2196, level(0.0));
        _2260 = _2262;
    }
    float _2264 = _2260;
    float3 _6461 = float3(_2256, _2258, _2214);
    float _2266 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6461, float3(0.0), isnan(_6461)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6461, float3(0.0), isnan(_6461)), level(0.0)).x;
    float3 _6470 = float3(_2256, _2258, _2214);
    float4 _2269 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6470, float3(0.0), isnan(_6470)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6470, float3(0.0), isnan(_6470)), level(0.0)).xyzw;
    float _2271 = _2269.x;
    float _2273 = _2269.y;
    float _2275 = _2269.z;
    float _2277 = _2269.w;
    float2 _6486 = float2(_2202, _2218);
    float3 _2281 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6486, float2(0.0), isnan(_6486)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6486, float2(0.0), isnan(_6486)), level(0.0)).xyz;
    float _2283 = _2281.x;
    float _2285 = _2281.y;
    float _2287 = _2281.z;
    float _2289 = _1942;
    if (!_1792)
    {
        float3 _6507 = float3(_2226, _1942, float(as_type<int>(_2254)));
        float3 _6509 = select(_6507, float3(0.0), isnan(_6507));
        float _2291 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _6509.xy, uint(rint(_6509.z)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _6509.xy, uint(rint(_6509.z)), level(0.0)).x;
        _2289 = _2291;
    }
    float _2293 = _2289;
    float _2295 = abs(_1617);
    float _2297 = log2(_2295);
    float _2299 = _2122 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2301 = _2074 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2303 = fma(_2138, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2299);
    bool _2305 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2307 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2309 = _2305 || _2307;
    bool _2311 = isnan(0.5);
    bool _2313 = _2309 || _2311;
    float _2315 = fma(_1896, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2303);
    float _2317 = _1315 * _1553;
    float _2319 = -(*spvDescriptorSet0.vp_c9)._m0[139].z;
    float _2321 = (*spvDescriptorSet0.vp_c9)._m0[139].w + _2319;
    float _2323 = fma(_2124, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2315);
    float _2325 = fma(_1311, _1547, _2317);
    float _2327 = _2297 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2329 = 1.0 / _2321;
    float _2331 = _2162 * 0.5;
    if (!_2313)
    {
        _1639 = (*spvDescriptorSet0.vp_c9)._m0[140].y;
    }
    float _2333 = _1639;
    float _2335 = fma(_1337, _1549, _2325);
    float _2337 = fma(_2212, -0.5, _2331);
    float _2339 = _2333;
    if (!_2313)
    {
        float _2341 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2343 = _2333 + _2341;
        _2339 = _2343;
    }
    float _2345 = _2339;
    float _2347 = exp2(_2327);
    float _2349 = _2216 + _2162;
    float _2351 = abs(_2335);
    float _2353 = -(*spvDescriptorSet0.vp_c9)._m0[139].z;
    float _2355 = _2351 + _2353;
    out.gl_Position.x = _2216;
    out.gl_Position.y = _2212;
    out.gl_Position.z = _2323;
    out.gl_Position.w = _2162;
    float _2357 = _2349 * 0.5;
    float _2359 = exp2(_2301);
    float _2361 = _2355 * _2329;
    float _2363 = precise::clamp(_2361, 0.0, 1.0);
    float _2365 = fma(_2347, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2367 = precise::clamp(_2365, 0.0, 1.0);
    float _2369 = _2345;
    float _2371 = _2357;
    if (!_2313)
    {
        float _2373 = 1.0 / _2345;
        _2369 = _2373;
    }
    float _2375 = _2369;
    float _2377 = _2363 * _2363;
    if (_2313)
    {
        _2220 = 1.0;
    }
    float _2379 = _2220;
    float _2381 = fma(_2367, -2.0, 3.0);
    float _2383 = _2323 + _2162;
    float _2385 = _2367 * _2367;
    float _2387 = fma(_2363, -2.0, 3.0);
    float _2389 = -_2359;
    float _2391 = _2389 + 1.0;
    float _2393 = _2383 * 0.5;
    float _2395 = _2385 * _2381;
    float _2397 = _2377 * _2387;
    float _2399 = _2379;
    float _2401 = _2397;
    if (!_2168)
    {
        _2176 = 1.0;
    }
    float _2403 = _2176;
    out.m_92.x = _2357;
    out.m_92.y = _2337;
    out.m_92.z = _2393;
    out.m_92.w = _2162;
    float _2405 = -_2395;
    float _2407 = _2405 + 1.0;
    float _2409 = fma(_2407, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2395);
    bool _2411 = _1617 <= 8000.0;
    bool _2413 = isnan(_1617);
    bool _2415 = _2411 || _2413;
    bool _2417 = isnan(8000.0);
    bool _2419 = _2415 || _2417;
    float _2421 = float(_2419);
    float _2423 = _2403;
    if (!_2313)
    {
        float _2425 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2427 = _1617 + _2425;
        _1641 = _2427;
    }
    float _2429 = _1641;
    float _2431 = _2421 * _2409;
    if (!_2313)
    {
        float _2433 = _2429 * _2375;
        float _2435 = precise::clamp(_2433, 0.0, 1.0);
        _2399 = _2435;
    }
    float _2437 = _2399;
    float _2439 = _2431 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2441 = -_1934;
    float _2443 = _2441 + 1.0;
    float _2445 = _2439;
    if (_2168)
    {
        bool _2447 = _2264 >= _2196;
        bool _2449 = isnan(_2264);
        bool _2451 = _2447 || _2449;
        bool _2453 = isnan(_2196);
        bool _2455 = _2451 || _2453;
        float _2457 = float(_2455);
        _2423 = _2457;
    }
    float _2459 = _2423;
    float _2461 = _2443 * _2439;
    float _2463 = precise::clamp(_2461, 0.0, 1.0);
    float _2465 = _2391 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    if (_1792)
    {
        _2445 = 1.0;
    }
    float _2467 = _2445;
    float _2469 = _2467;
    if (!_1792)
    {
        int _2471 = _1952 << 4;
        int _2473 = _2471 + 2048;
        uint _2475 = uint(int(uint(_2473) >> uint(2)));
        uint _2477 = uint(int(uint(int(_2475)) >> uint(2)));
        int _2479 = int(_2475) & 3;
        float _2481 = (*spvDescriptorSet0.vp_c15)._m0[int(_2477)][_2479];
        int _2483 = int(_2475) + 1;
        uint _2485 = uint(int(uint(_2483) >> uint(2)));
        int _2487 = _2483 & 3;
        float _2489 = (*spvDescriptorSet0.vp_c15)._m0[int(_2485)][_2487];
        int _2491 = _2473 + 8;
        uint _2493 = uint(int(uint(_2491) >> uint(2)));
        uint _2495 = uint(int(uint(int(_2493)) >> uint(2)));
        int _2497 = int(_2493) & 3;
        float _2499 = (*spvDescriptorSet0.vp_c15)._m0[int(_2495)][_2497];
        int _2501 = int(_2493) + 1;
        uint _2503 = uint(int(uint(_2501) >> uint(2)));
        int _2505 = _2501 & 3;
        float _2507 = (*spvDescriptorSet0.vp_c15)._m0[int(_2503)][_2505];
        float _2509 = _1595 * _2489;
        float _2511 = fma(_1035, _2481, _2509);
        float _2513 = fma(_1061, _2499, _2511);
        float _2515 = _2513 + _2507;
        float _2517 = precise::clamp(_2515, 0.0, 1.0);
        float _2519 = -_2517;
        float _2521 = _2519 + _2293;
        float _2523 = fma(_2521, 500.0, 1.5);
        float _2525 = exp2(_2523);
        float _2527 = 0.0 + _2525;
        float _2529 = precise::clamp(_2527, 0.0, 1.0);
        _2469 = _2529;
        _2371 = _2481;
    }
    float _2531 = _2469;
    float _2533 = _2371;
    float _2535 = _2459 * _2531;
    float _2537 = _2465 * _2266;
    float _2539 = -_2463;
    float _2541 = fma(_2539, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2543 = -_2465;
    float _2545 = _2543 + 1.0;
    out.m_94.x = _1511;
    out.m_94.y = _1509;
    out.m_94.z = _1513;
    float _2547 = _2277 * _2537;
    float _2549 = -_2535;
    float _2551 = fma(_2549, _2541, 1.0);
    float _2553 = precise::clamp(_2551, 0.0, 1.0);
    float _2555 = _2287 * _2537;
    float _2557 = _2277 * _2545;
    float _2559 = fma(_2283, _2547, _2271);
    float _2561 = fma(_2285, _2547, _2273);
    float _2563 = _2553 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2565 = fma(_2277, _2555, _2275);
    bool _2567 = _1561 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2569 = isnan(_1561);
    bool _2571 = _2567 || _2569;
    bool _2573 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2575 = _2571 || _2573;
    float _2577 = _2397 * _2437;
    out.m_96.x = _2563;
    float _2579 = _2577 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_98.x = _2559;
    out.m_98.y = _2561;
    out.m_98.z = _2565;
    out.m_98.w = _2557;
    float _2581 = _2533;
    float _2583 = _2545;
    float _2585 = _2553;
    float _2587 = _2547;
    if (!_2575)
    {
        _2581 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2589 = _2581;
    float _2591 = _2589;
    float _2593 = _2589;
    if (!_2575)
    {
        _2583 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2595 = _2583;
    float _2597 = _2595;
    float _2599 = _2595;
    if (!_2575)
    {
        _2585 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2601 = _2585;
    float _2603 = _2601;
    float _2605 = _2601;
    if (!_2575)
    {
        _2401 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2607 = _2401;
    float _2609 = _2607;
    float _2611 = _2607;
    if (!_2575)
    {
        _1185 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2613 = _1185;
    float _2615 = _2613;
    float _2617 = _2613;
    if (!_2575)
    {
        _2587 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2619 = _2587;
    bool _2621 = !_2575;
    float _2623 = _2619;
    float _2625 = _2619;
    if (!_2621)
    {
        bool _2627 = _1561 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2629 = isnan(_1561);
        bool _2631 = _2627 || _2629;
        bool _2633 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2635 = _2631 || _2633;
        if (!_2635)
        {
            float _2637 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2639 = _1561 + _2637;
            float _2641 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2643 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2641;
            float _2645 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2647 = _2645 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2649 = 1.0 / _2643;
            float _2651 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2653 = _2651 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2655 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2657 = _2655 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2659 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2661 = _2659 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2663 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2665 = _2663 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2667 = _2639 * _2649;
            float _2669 = precise::clamp(_2667, 0.0, 1.0);
            float _2671 = fma(_2669, _2647, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2673 = fma(_2669, _2653, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2675 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2677 = _2675 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2679 = fma(_2669, _2657, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2681 = fma(_2669, _2661, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2683 = fma(_2669, _2665, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            float _2685 = fma(_2669, _2677, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            _2599 = _2673;
            _2617 = _2681;
            _2593 = _2671;
            _2611 = _2679;
            _2605 = _2685;
            _2625 = _2683;
            _2687 = true;
        }
        else
        {
            bool _2689 = _1561 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2691 = isnan(_1561);
            bool _2693 = _2689 || _2691;
            bool _2695 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2697 = _2693 || _2695;
            if (!_2697)
            {
                _2591 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2699 = _2591;
            _2593 = _2699;
            if (!_2697)
            {
                _2597 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2701 = _2597;
            _2599 = _2701;
            if (!_2697)
            {
                _2603 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2703 = _2603;
            _2605 = _2703;
            if (!_2697)
            {
                _2609 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2705 = _2609;
            _2611 = _2705;
            if (!_2697)
            {
                _2615 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2707 = _2615;
            _2617 = _2707;
            if (!_2697)
            {
                _2623 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2709 = _2623;
            bool _2711 = !_2697;
            _2625 = _2709;
            if (!_2711)
            {
                bool _2713 = _1561 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2715 = isnan(_1561);
                bool _2717 = _2713 || _2715;
                bool _2719 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2721 = _2717 || _2719;
                if (!_2721)
                {
                    float _2723 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2725 = _1561 + _2723;
                    float _2727 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2729 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2727;
                    float _2731 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2733 = _2731 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2735 = 1.0 / _2729;
                    float _2737 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2739 = _2737 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2741 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2743 = _2741 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2745 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2747 = _2745 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2749 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2751 = _2749 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2753 = _2725 * _2735;
                    float _2755 = precise::clamp(_2753, 0.0, 1.0);
                    float _2757 = fma(_2755, _2733, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2759 = fma(_2755, _2739, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2761 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2763 = _2761 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2765 = fma(_2755, _2743, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2767 = fma(_2755, _2747, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2769 = fma(_2755, _2751, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    float _2771 = fma(_2755, _2763, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    _2599 = _2759;
                    _2617 = _2767;
                    _2593 = _2757;
                    _2611 = _2765;
                    _2605 = _2771;
                    _2625 = _2769;
                    _2687 = true;
                }
                else
                {
                    _2599 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2617 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2593 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2611 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2605 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2625 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2687 = false;
    float _2773 = _2599;
    float _2775 = _2617;
    float _2777 = _2593;
    float _2779 = _2611;
    float _2781 = _2605;
    float _2783 = _2625;
    float _2785 = fma(_1315, -0.5, 0.5);
    float _2787 = precise::clamp(_2785, 0.0, 1.0);
    float _2789 = -_2773;
    float _2791 = _2789 + _2775;
    float _2793 = _2579 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2795 = -_2777;
    float _2797 = _2795 + _2779;
    out.m_100.x = 0.0;
    float _2799 = fma(_2787, _2791, _2773);
    float _2801 = fma(_2787, _2797, _2777);
    out.m_61.x = _2793;
    float _2803 = -_2781;
    float _2805 = _2803 + _2783;
    float _2807 = _2799 * 0.586610972881317138671875;
    bool _2809 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2811 = fma(_2787, _2805, _2781);
    float _2813 = fma(_2801, 0.298911988735198974609375, _2807);
    bool _2815 = _2437 > 0.0;
    bool _2817 = isnan(_2437);
    bool _2819 = _2815 || _2817;
    bool _2821 = isnan(0.0);
    bool _2823 = _2819 || _2821;
    float _2825 = fma(_2811, 0.114477999508380889892578125, _2813);
    float _2827 = -_2825;
    float _2829 = _2801 + _2827;
    float _2831 = -_2825;
    float _2833 = _2799 + _2831;
    float _2835 = -_2825;
    float _2837 = _2811 + _2835;
    float _2839 = fma(_2829, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2825);
    float _2841 = fma(_2833, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2825);
    float _2843 = fma(_2837, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2825);
    bool _2845 = !_2809;
    if (!_2845)
    {
        float _2847 = -_1509;
        float _2849 = _2847 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2851 = -_1511;
        float _2853 = _2851 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2855 = -_1513;
        float _2857 = _2855 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2859 = _2849 * _2849;
        float _2861 = fma(_2853, _2853, _2859);
        float _2863 = fma(_2857, _2857, _2861);
        float _2865 = sqrt(_2863);
        float _2867 = rsqrt(_2863);
        float _2869 = -_2865;
        float _2871 = _2869 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2873 = _2871 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2875 = precise::clamp(_2873, 0.0, 1.0);
        float _2877 = _2853 * _2867;
        float _2879 = _2849 * _2867;
        float _2881 = abs(_2875);
        float _2883 = log2(_2881);
        float _2885 = _2857 * _2867;
        float _2887 = _2877 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2889 = _1315 * _2879;
        float _2891 = -_2879;
        float _2893 = -_2887;
        float _2895 = fma(_2891, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2893);
        float _2897 = fma(_1311, _2877, _2889);
        float _2899 = -_2885;
        float _2901 = fma(_2899, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2895);
        float _2903 = fma(_1337, _2885, _2897);
        float _2905 = precise::clamp(_2903, 0.0, 1.0);
        float _2907 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2909 = _2901 + _2907;
        float _2911 = _2883 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2913 = _2909 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2915 = precise::clamp(_2913, 0.0, 1.0);
        float _2917 = exp2(_2911);
        float _2919 = _2917 * _2915;
        float _2921 = _2905 * _2919;
        float _2923 = _2921 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2925 = _2921 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2927 = _2921 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_100.x = _2923;
        out.m_100.y = _2925;
        out.m_100.z = _2927;
    }
    out.m_102.x = _2839;
    out.m_102.y = _2841;
    out.m_102.z = _2843;
    if (_2823)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_61.x = 0.0;
    float _2929 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2929;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_102 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_100 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2687 = false;
    bool _1383 = false;
    bool _839 = false;
    bool _691 = false;
    bool _531 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _116 = in.m_58.w;
    float _118 = trunc(_116);
    int _121 = int(_118);
    bool _125 = _121 >= 1;
    float _127 = 0.0;
    if (!_125)
    {
        _127 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _129 = _127;
    float _131 = _129;
    if (!_125)
    {
        out.m_61.x = 0.0;
    }
    int _133 = 0;
    if (!_125)
    {
        float _135 = _129 * 5.0;
        _133 = as_type<int>(_135);
    }
    int _137 = _133;
    int _139 = _137;
    if (!_125)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2986 = as_type<float>(_137);
        out.gl_Position.z = _2986;
    }
    if (!_125)
    {
        return out;
    }
    float _141 = in.m_63.w;
    bool _143 = _141 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _145 = isnan(_141);
    bool _147 = _143 || _145;
    bool _149 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _151 = _147 || _149;
    float _153 = -_141;
    float _155 = _153 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_151)
    {
        float _157 = float(_121);
        _131 = _157;
    }
    float _159 = _131;
    bool _161 = _155 >= _159;
    bool _163 = !_151;
    bool _165 = _161 || _163;
    float _167 = _159;
    if (_165)
    {
        _167 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _169 = _167;
    float _171 = _169;
    if (_165)
    {
        out.m_61.x = 0.0;
    }
    if (_165)
    {
        float _173 = _169 * 5.0;
        _139 = as_type<int>(_173);
    }
    int _175 = _139;
    if (_165)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3056 = as_type<float>(_175);
        out.gl_Position.z = _3056;
    }
    if (_165)
    {
        return out;
    }
    float _177 = in.m_63.x;
    float _179 = in.m_63.y;
    float _181 = in.m_63.z;
    float _183 = _155 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _185 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _187 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _189 = _185 || _187;
    bool _191 = isnan(1.0);
    bool _193 = _189 || _191;
    float _195 = 0.0;
    float _197 = _183;
    if (!_193)
    {
        float _199 = _183 * _183;
        float _201 = _199 * 0.5;
        _195 = _201;
    }
    float _203 = _195;
    float _205 = 0.0;
    float _207 = _203;
    if (!_193)
    {
        float _209 = _155 * _155;
        float _211 = _209 * 0.5;
        _205 = _211;
    }
    float _213 = _205;
    if (!_193)
    {
        float _215 = _203 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _207 = _215;
    }
    float _217 = _207;
    bool _219 = !_193;
    float _221 = _217;
    float _223 = 0.0;
    if (!_219)
    {
        float _225 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _227 = log2(_225);
        float _229 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _231 = _229 + 1.0;
        float _233 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _235 = _183 * _227;
        float _237 = 1.0 / _231;
        float _239 = _233 * 0.693147182464599609375;
        float _241 = exp2(_235);
        float _243 = 1.0 / _239;
        float _245 = _241 + (-1.0);
        float _247 = -_245;
        float _249 = fma(_247, _243, _183);
        float _251 = _249 * _237;
        float _253 = _251 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _171 = _243;
        _221 = _253;
        _223 = _237;
    }
    float _255 = _171;
    float _257 = _221;
    float _259 = _223;
    bool _261 = !_193;
    float _263 = _255;
    float _265 = _259;
    if (!_261)
    {
        float _267 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _269 = log2(_267);
        float _271 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _273 = _271 + 1.0;
        float _275 = 1.0 / _273;
        float _277 = _183 * _269;
        float _279 = exp2(_277);
        float _281 = -_279;
        float _283 = _281 + 1.0;
        float _285 = _283 * _275;
        _263 = _279;
        _197 = _285;
    }
    float _287 = _263;
    float _289 = _197;
    float _291 = _287;
    if (!_193)
    {
        _265 = _155;
    }
    float _293 = _265;
    float _295 = _257 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _297 = _293;
    if (!_193)
    {
        float _299 = _213 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _291 = _299;
    }
    float _301 = _291;
    bool _303 = !_193;
    float _305 = _301;
    if (!_303)
    {
        float _307 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _309 = log2(_307);
        float _311 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _313 = _311 + 1.0;
        float _315 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _317 = _155 * _309;
        float _319 = 1.0 / _313;
        float _321 = _315 * 0.693147182464599609375;
        float _323 = exp2(_317);
        float _325 = 1.0 / _321;
        float _327 = _323 + (-1.0);
        float _329 = -_327;
        float _331 = fma(_329, _325, _155);
        float _333 = _331 * _319;
        float _335 = _333 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _305 = _335;
    }
    float _337 = _305;
    bool _339 = !_193;
    if (!_339)
    {
        float _341 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _343 = log2(_341);
        float _345 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _347 = _345 + 1.0;
        float _349 = 1.0 / _347;
        float _351 = _155 * _343;
        float _353 = exp2(_351);
        float _355 = -_353;
        float _357 = _355 + 1.0;
        float _359 = _357 * _349;
        _297 = _359;
    }
    float _361 = _297;
    float _363 = _257 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _365 = _257 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _367 = _337 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _369 = fma(_289, _177, _295);
    float _371 = fma(_289, _179, _363);
    float _373 = fma(_289, _181, _365);
    float _375 = _337 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _377 = fma(_361, _179, _367);
    float _379 = _337 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _381 = in.m_65.w;
    float _383 = fma(_361, _177, _375);
    float _385 = -_377;
    float _387 = _371 + _385;
    float _389 = fma(_361, _181, _379);
    float _391 = in.m_58.x;
    float _393 = in.m_58.y;
    float _395 = in.m_58.z;
    float _397 = -_383;
    float _399 = _369 + _397;
    float _401 = _387 * _387;
    float _403 = -_389;
    float _405 = _373 + _403;
    float _407 = in.m_67.y;
    float _409 = fma(_399, _399, _401);
    float _411 = in.m_69.y;
    float _413 = fma(_405, _405, _409);
    float _415 = in.m_71.y;
    float _417 = in.m_67.x;
    float _419 = sqrt(_413);
    float _421 = in.m_69.x;
    float _423 = in.m_71.x;
    float _425 = fma(_369, _381, _391);
    float _427 = fma(_373, _381, _395);
    float _429 = in.m_67.z;
    float _431 = _387 * _407;
    float _433 = in.m_69.z;
    bool _435 = _419 >= 9.9999999747524270787835121154785e-07;
    bool _437 = isnan(_419);
    bool _439 = _435 || _437;
    bool _441 = isnan(9.9999999747524270787835121154785e-07);
    bool _443 = _439 || _441;
    float _445 = _387 * _411;
    float _447 = in.m_71.z;
    float _449 = _387 * _415;
    float _451 = _407 * _407;
    out.m_73.x = _425;
    float _453 = fma(_399, _417, _431);
    out.m_73.z = _427;
    float _455 = fma(_399, _421, _445);
    float _457 = fma(_399, _423, _449);
    float _459 = fma(_415, _415, _451);
    float _461 = fma(_371, _381, _393);
    float _463 = fma(_405, _429, _453);
    float _465 = fma(_411, _411, _459);
    float _467 = fma(_405, _433, _455);
    float _469 = fma(_405, _447, _457);
    float _471 = _405;
    float _473 = _463;
    float _475 = _469;
    float _477 = _469;
    float _479 = _427;
    if (_443)
    {
        _471 = _463;
    }
    float _481 = _471;
    float _483 = _481;
    float _485 = _481;
    if (_443)
    {
        _473 = _467;
    }
    float _487 = _473;
    float _489 = _487;
    float _491 = _487;
    if (!_443)
    {
        bool _493 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _495 = !_493;
        if (!_495)
        {
            float _497 = _407 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _499 = _415 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _501 = _411 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _503 = fma(_417, (*spvDescriptorSet0.vp_c9)._m0[16].x, _497);
            float _505 = fma(_423, (*spvDescriptorSet0.vp_c9)._m0[16].x, _499);
            float _507 = fma(_421, (*spvDescriptorSet0.vp_c9)._m0[16].x, _501);
            float _509 = fma(_429, (*spvDescriptorSet0.vp_c9)._m0[16].z, _503);
            float _511 = fma(_447, (*spvDescriptorSet0.vp_c9)._m0[16].z, _505);
            float _513 = fma(_433, (*spvDescriptorSet0.vp_c9)._m0[16].z, _507);
            float _515 = _509 * _509;
            float _517 = fma(_511, _511, _515);
            float _519 = fma(_513, _513, _517);
            float _521 = rsqrt(_519);
            float _523 = _521 * 9.9999999747524270787835121154785e-07;
            float _525 = _511 * _523;
            float _527 = _509 * _523;
            float _529 = _513 * _523;
            _485 = _527;
            _477 = _525;
            _491 = _529;
            _531 = true;
        }
        else
        {
            float _533 = _179 * _179;
            float _535 = fma(_177, _177, _533);
            float _537 = fma(_181, _181, _535);
            float _539 = sqrt(_537);
            bool _541 = _539 >= 9.9999999747524270787835121154785e-07;
            bool _543 = isnan(_539);
            bool _545 = _541 || _543;
            bool _547 = isnan(9.9999999747524270787835121154785e-07);
            bool _549 = _545 || _547;
            float _551 = _539;
            if (!_549)
            {
                float _553 = _393 * _393;
                float _555 = fma(_391, _391, _553);
                float _557 = fma(_395, _395, _555);
                float _559 = sqrt(_557);
                bool _561 = _559 >= 9.9999999747524270787835121154785e-07;
                bool _563 = isnan(_559);
                bool _565 = _561 || _563;
                bool _567 = isnan(9.9999999747524270787835121154785e-07);
                bool _569 = _565 || _567;
                float _571 = _465;
                if (!_569)
                {
                    float _573 = rsqrt(_465);
                    _571 = _573;
                }
                float _575 = _571;
                if (!_569)
                {
                    float _577 = _575 * 9.9999999747524270787835121154785e-07;
                    _551 = _577;
                }
                float _579 = _551;
                if (!_569)
                {
                    float _581 = _415 * _579;
                    _475 = _581;
                }
                float _583 = _475;
                _477 = _583;
                if (!_569)
                {
                    float _585 = _407 * _579;
                    _483 = _585;
                }
                float _587 = _483;
                _485 = _587;
                if (!_569)
                {
                    float _589 = _411 * _579;
                    _489 = _589;
                }
                float _591 = _489;
                bool _593 = !_569;
                _491 = _591;
                _531 = _593;
                if (!_531)
                {
                    float _595 = _407 * _393;
                    float _597 = _415 * _393;
                    float _599 = _411 * _393;
                    float _601 = fma(_391, _417, _595);
                    float _603 = fma(_391, _423, _597);
                    float _605 = fma(_391, _421, _599);
                    float _607 = fma(_395, _429, _601);
                    float _609 = fma(_395, _447, _603);
                    float _611 = fma(_395, _433, _605);
                    float _613 = _607 * _607;
                    float _615 = fma(_609, _609, _613);
                    float _617 = fma(_611, _611, _615);
                    float _619 = rsqrt(_617);
                    float _621 = _619 * 9.9999999747524270787835121154785e-07;
                    float _623 = _609 * _621;
                    float _625 = _607 * _621;
                    float _627 = _611 * _621;
                    _485 = _625;
                    _477 = _623;
                    _491 = _627;
                    _531 = true;
                }
            }
            else
            {
                float _629 = _407 * _179;
                float _631 = _415 * _179;
                float _633 = _411 * _179;
                float _635 = fma(_177, _417, _629);
                float _637 = fma(_177, _423, _631);
                float _639 = fma(_177, _421, _633);
                float _641 = fma(_181, _429, _635);
                float _643 = fma(_181, _447, _637);
                float _645 = fma(_181, _433, _639);
                float _647 = _641 * _641;
                float _649 = fma(_643, _643, _647);
                float _651 = fma(_645, _645, _649);
                float _653 = rsqrt(_651);
                float _655 = _653 * 9.9999999747524270787835121154785e-07;
                float _657 = _643 * _655;
                float _659 = _641 * _655;
                float _661 = _645 * _655;
                _485 = _659;
                _477 = _657;
                _491 = _661;
            }
        }
    }
    _531 = false;
    float _663 = _485;
    float _665 = _477;
    float _667 = _491;
    bool _669 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _671 = !_669;
    float _689;
    if (!_671)
    {
        float _673 = in.m_75.x;
        float _675 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _677 = _673 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _679 = fma(_677, (*spvDescriptorSet0.vp_c9)._m0[12].x, _155);
        float _681 = _679 * _675;
        float _683 = floor(_681);
        float _685 = -_683;
        float _687 = _681 + _685;
        _689 = _687;
        _691 = true;
    }
    else
    {
        float _693 = float(_121);
        float _695 = 1.0 / _693;
        float _697 = _155 * _695;
        _689 = _697;
    }
    _691 = false;
    float _699 = _689;
    float _701 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _703 = _699 + _701;
    bool _705 = _699 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _707 = isnan(_699);
    bool _709 = _705 || _707;
    bool _711 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _713 = _709 || _711;
    float _715 = float(_713);
    bool _717 = _699 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _719 = isnan(_699);
    bool _721 = _717 || _719;
    bool _723 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _725 = _721 || _723;
    float _727 = float(_725);
    float _729 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _731 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _729;
    float _733 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _735 = _733 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _737 = -_715;
    float _739 = _737 + 1.0;
    float _741 = 1.0 / _735;
    bool _743 = _699 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _745 = isnan(_699);
    bool _747 = _743 || _745;
    bool _749 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _751 = _747 || _749;
    float _753 = float(_751);
    float _755 = _727 * _739;
    float _757 = -_727;
    float _759 = _757 + 1.0;
    bool _761 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _763 = _753 * _759;
    float _765 = 1.0 / _731;
    float _767 = -_753;
    float _769 = _767 + 1.0;
    float _771 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _773 = _771 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _775 = _703 * _765;
    float _777 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _779 = _699 + _777;
    float _781 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _783 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _781;
    float _785 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _787 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _785;
    float _789 = _779 * _741;
    float _791 = fma(_783, _775, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _793 = fma(_787, _775, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _795 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _797 = _795 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _799 = fma(_773, _789, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _801 = _791 * _763;
    float _803 = _793 * _763;
    float _805 = fma(_797, _789, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _807 = fma(_769, (*spvDescriptorSet0.vp_c9)._m0[143].x, _801);
    float _809 = fma(_769, (*spvDescriptorSet0.vp_c9)._m0[143].y, _803);
    float _811 = fma(_805, _755, _807);
    float _813 = fma(_799, _755, _809);
    float _815 = fma(_715, (*spvDescriptorSet0.vp_c9)._m0[145].x, _811);
    float _817 = fma(_715, (*spvDescriptorSet0.vp_c9)._m0[145].y, _813);
    bool _819 = !_761;
    float _837;
    if (!_819)
    {
        float _821 = in.m_75.x;
        float _823 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _825 = _821 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _827 = fma(_825, (*spvDescriptorSet0.vp_c9)._m0[11].y, _155);
        float _829 = _827 * _823;
        float _831 = floor(_829);
        float _833 = -_831;
        float _835 = _829 + _833;
        _837 = _835;
        _839 = true;
    }
    else
    {
        float _841 = float(_121);
        float _843 = 1.0 / _841;
        float _845 = _155 * _843;
        _837 = _845;
    }
    _839 = false;
    float _847 = _837;
    float _849 = _663 * _663;
    float _851 = in.m_75.x;
    float _853 = in.m_75.y;
    float _855 = _461 * _407;
    float _857 = _461 * _411;
    float _859 = fma(_665, _665, _849);
    float _861 = as_type<float>(int(gl_VertexIndex));
    float _863 = fma(_425, _417, _855);
    float _865 = fma(_667, _667, _859);
    float _867 = _461 * _415;
    float _869 = fma(_427, _429, _863);
    bool _871 = _847 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _873 = isnan(_847);
    bool _875 = _871 || _873;
    bool _877 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _879 = _875 || _877;
    float _881 = float(_879);
    float _883 = fma(_425, _423, _867);
    float _885 = rsqrt(_865);
    float _887 = fma(_425, _421, _857);
    float _889 = in.m_65.x;
    float _891 = in.m_65.y;
    float _893 = _869 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _895 = fma(_427, _433, _887);
    bool _897 = _847 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _899 = isnan(_847);
    bool _901 = _897 || _899;
    bool _903 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _905 = _901 || _903;
    float _907 = float(_905);
    bool _909 = _851 > 0.5;
    bool _911 = _853 > 0.5;
    float _913 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _915 = _885 * _667;
    float _917 = _885 * _663;
    float _919 = _885 * _665;
    int _921 = as_type<int>(_861) & 1;
    bool _923 = _921 != 0;
    int _925 = as_type<int>(_861) & 2;
    bool _927 = _925 != 0;
    float _929 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _931 = _915 * _929;
    float _933 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _935 = _917 * _933;
    float _937 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _939 = _937 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _941 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _943 = -_931;
    float _945 = fma(_919, _941, _943);
    float _947 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _949 = -_935;
    float _951 = fma(_915, _947, _949);
    float _953 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _955 = _919 * _953;
    float _957 = 1.0 / _939;
    float _959 = _945 * _945;
    float _961 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _963 = _961 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _965 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _967 = -_955;
    float _969 = fma(_917, _965, _967);
    int _971 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _973 = _971 != 0;
    float _975 = fma(_951, _951, _959);
    int _977 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _979 = _977 != 0;
    float _981 = _815 * _889;
    float _983 = 1.0 / _963;
    float _985 = fma(_969, _969, _975);
    float _987 = fma(_427, _447, _883);
    float _989 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _991 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _989;
    float _993 = _817 * _891;
    float _995 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _997 = _995 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    bool _999 = !_927;
    float _1001 = _999 ? (-0.5) : 0.5;
    float _1003 = rsqrt(_985);
    float _1005 = _991 * _957;
    bool _1007 = !_923;
    float _1009 = _1007 ? (-0.5) : 0.5;
    float _1011 = _993 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1013 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1001);
    float _1015 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1017 = _847 + _1015;
    float _1019 = _981 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1021 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1009);
    float _1023 = _997 * _983;
    float _1025 = _1011 * _1013;
    float _1027 = fma(_1005, _1017, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1029 = _1019 * _1021;
    float _1031 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1033 = _1025 * _919;
    float _1035 = _987 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1037 = _945 * _1003;
    float _1039 = _969 * _1003;
    float _1041 = _951 * _1003;
    float _1043 = _1025 * _915;
    float _1045 = _919 * _1037;
    float _1047 = _917 * _1039;
    float _1049 = fma(_1029, _1041, _1033);
    float _1051 = fma(_1029, _1039, _1043);
    float _1053 = -_1045;
    float _1055 = fma(_917, _1041, _1053);
    float _1057 = -_1047;
    float _1059 = fma(_915, _1037, _1057);
    float _1061 = _895 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1063 = fma(_1031, _1055, _1051);
    float _1065 = fma(_1031, _1059, _1049);
    float _1067 = -_881;
    float _1069 = _1067 + 1.0;
    bool _1071 = _847 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1073 = isnan(_847);
    bool _1075 = _1071 || _1073;
    bool _1077 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1079 = _1075 || _1077;
    float _1081 = float(_1079);
    float _1083 = _1061 + _1063;
    float _1085 = _1035 + _1065;
    float _1087 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1089 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1091 = _1083 + _1089;
    float _1093 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1095 = _1085 + _1093;
    float _1097 = _907 * _1069;
    float _1099 = _1091 * _1091;
    float _1101 = _1095 * _1095;
    float _1103 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1105 = -_1081;
    float _1107 = _1105 + 1.0;
    float _1109 = _1087 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1111 = _1101 + _1099;
    float _1113 = _1027 * _1097;
    float _1115 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1117 = _1103 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1119 = sqrt(_1111);
    float _1121 = _913 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1123 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1125 = _847 + _1123;
    float _1127 = _1025 * _917;
    float _1129 = _915 * _1041;
    float _1131 = _881 * _1107;
    out.m_80.x = _1117;
    out.m_80.y = _1109;
    out.m_80.z = _1121;
    out.m_80.w = _1115;
    float _1133 = fma(_1029, _1037, _1127);
    float _1135 = fma(_1023, _1125, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1137 = -_1129;
    float _1139 = fma(_919, _1039, _1137);
    float _1141 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1143 = -_907;
    float _1145 = _1143 + 1.0;
    float _1147 = fma(_1031, _1139, _1133);
    float _1149 = fma(_1145, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1113);
    bool _1151 = _1119 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1153 = _893 + _1147;
    float _1155 = fma(_1135, _1131, _1149);
    float _1157 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1159 = -_1001;
    int _1161 = _911 ? as_type<int>(_1159) : as_type<int>(_1001);
    float _1163 = _1001 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _1165 = !_979;
    float _1167 = _1165 ? _1001 : as_type<float>(_1161);
    float _1169 = -_1009;
    int _1171 = _909 ? as_type<int>(_1169) : as_type<int>(_1009);
    float _1173 = _1101;
    float _1175 = _1099;
    float _1177 = _1085;
    float _1179 = _1083;
    float _1181 = _1059;
    float _1183 = _1039;
    float _1185 = _1035;
    if (!_1151)
    {
        _479 = _1153;
    }
    float _1187 = _479;
    bool _1189 = !_1151;
    float _1191 = _1187;
    if (!_1189)
    {
        float _1193 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1195 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1197 = _1119 + _1195;
        float _1199 = rsqrt(_1111);
        float _1201 = _1197 * _1193;
        float _1203 = _1153 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1205 = _1201 * 0.15915493667125701904296875;
        float _1207 = _1205 * 6.283185482025146484375;
        float _1209 = sin(_1207);
        float _1211 = _1205 * 6.283185482025146484375;
        float _1213 = cos(_1211);
        float _1215 = fma(_1209, _1203, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1217 = _1199 * _1215;
        float _1219 = fma(_1095, _1217, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1221 = _1213 + (-1.0);
        float _1223 = fma(_1091, _1217, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1225 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1227 = _1219 + _1225;
        float _1229 = _1221 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1231 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1233 = _1223 + _1231;
        float _1235 = _1227 * _1227;
        float _1237 = fma(_1153, _1213, _1229);
        float _1239 = _1233 * _1233;
        _1191 = _1237;
        _1173 = _1235;
        _1175 = _1239;
        _1177 = _1219;
        _1179 = _1223;
    }
    float _1241 = _1191;
    float _1243 = _1173;
    float _1245 = _1175;
    float _1247 = _1177;
    float _1249 = _1179;
    float _1251 = fma(_1163, _1163, 1.0);
    float _1253 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1255 = _1241 + _1253;
    bool _1257 = !_973;
    float _1259 = _1257 ? _1009 : as_type<float>(_1171);
    float _1261 = -_1167;
    float _1263 = _1261 + 0.5;
    float _1265 = fma(_1081, (*spvDescriptorSet0.vp_c9)._m0[117].x, _1155);
    float _1267 = fma(_1255, _1255, _1243);
    float _1269 = rsqrt(_1251);
    float _1271 = _1009 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1273 = _919 * _1163;
    float _1275 = _917 * _1163;
    float _1277 = _915 * _1163;
    float _1279 = _1259 + 0.5;
    float _1281 = _1263 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1283 = fma(_1041, _1271, _1273);
    float _1285 = fma(_1037, _1271, _1275);
    float _1287 = fma(_1039, _1271, _1277);
    float _1289 = _1279 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1291 = _1281 * _1157;
    float _1293 = _1267 + _1245;
    float _1295 = _1289 * _1141;
    float _1297 = _1163 * _1269;
    float _1299 = sqrt(_1293);
    float _1301 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1303 = -_1297;
    float _1305 = _1059 * _1303;
    float _1307 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1309 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1311 = _1059 + _1283;
    float _1313 = fma(_919, _1269, _1305);
    float _1315 = _1139 + _1285;
    float _1317 = -_1297;
    float _1319 = _1139 * _1317;
    float _1321 = -_1297;
    float _1323 = _1055 * _1321;
    float _1325 = _1301 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1327 = _1309 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1329 = _1307 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1331 = _1265 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1333 = fma(_917, _1269, _1319);
    float _1335 = fma(_915, _1269, _1323);
    float _1337 = _1055 + _1287;
    out.m_82.x = _1295;
    out.m_82.y = _1291;
    bool _1339 = _1299 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1341 = isnan(_1299);
    bool _1343 = _1339 || _1341;
    bool _1345 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1347 = _1343 || _1345;
    out.m_84.x = _1325;
    out.m_84.y = _1327;
    out.m_84.z = _1329;
    out.m_84.w = _1331;
    out.m_86.x = _1041;
    out.m_86.y = _1037;
    out.m_86.z = _1039;
    out.m_88.x = _1313;
    out.m_88.y = _1333;
    out.m_88.z = _1335;
    if (!_1347)
    {
        _1181 = 1.0;
    }
    float _1349 = _1181;
    out.m_90.x = _1311;
    out.m_90.y = _1315;
    out.m_90.z = _1337;
    bool _1351 = !_1347;
    float _1353 = _1349;
    if (!_1351)
    {
        bool _1355 = _1299 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1357 = isnan(_1299);
        bool _1359 = _1355 || _1357;
        bool _1361 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1363 = _1359 || _1361;
        if (!_1363)
        {
            float _1365 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1367 = _1299 + _1365;
            float _1369 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1371 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1369;
            float _1373 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1375 = _1373 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1377 = 1.0 / _1371;
            float _1379 = _1367 * _1377;
            float _1381 = fma(_1379, _1375, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1353 = _1381;
            _1383 = true;
        }
        else
        {
            bool _1385 = _1299 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1387 = isnan(_1299);
            bool _1389 = _1385 || _1387;
            bool _1391 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1393 = _1389 || _1391;
            if (!_1393)
            {
                float _1395 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1397 = _1299 + _1395;
                float _1399 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1401 = _1399 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1403 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1405 = _1403 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1407 = 1.0 / _1401;
                float _1409 = _1397 * _1407;
                float _1411 = fma(_1409, _1405, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1353 = _1411;
                _1383 = true;
            }
            else
            {
                _1353 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1383 = false;
    float _1413 = _1353;
    float _1415 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1417 = _1247 + _1415;
    float _1419 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1421 = _1241 + _1419;
    float _1423 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1425 = _1249 + _1423;
    bool _1427 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1429 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1431 = _1427 || _1429;
    bool _1433 = isnan(0.5);
    bool _1435 = _1431 || _1433;
    float _1437 = fma(_1417, _1413, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1439 = fma(_1421, _1413, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1441 = fma(_1425, _1413, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1443 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    float _1445 = _1417;
    if (_1435)
    {
        _1443 = _1437;
    }
    float _1447 = _1443;
    float _1449 = _1447;
    if (_1435)
    {
        _1445 = _1439;
    }
    float _1451 = _1445;
    float _1453 = _1451;
    if (_1435)
    {
        _1183 = _1441;
    }
    float _1455 = _1183;
    float _1457 = _1455;
    if (!_1435)
    {
        float _1459 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1461 = _893 + _1459;
        float _1463 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1465 = _1035 + _1463;
        float _1467 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1469 = _1461 * _1461;
        float _1471 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1473 = _1061 + _1471;
        float _1475 = fma(_1465, _1465, _1469);
        float _1477 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1479 = fma(_1473, _1473, _1475);
        float _1481 = sqrt(_1479);
        float _1483 = _1467 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1485 = precise::min(_1481, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1487 = _1485 * _1477;
        float _1489 = -_1035;
        float _1491 = _1489 + _1437;
        float _1493 = _1483 * _1487;
        float _1495 = -_893;
        float _1497 = _1495 + _1439;
        float _1499 = -_1061;
        float _1501 = _1499 + _1441;
        float _1503 = fma(_1491, _1493, _1035);
        float _1505 = fma(_1497, _1493, _893);
        float _1507 = fma(_1501, _1493, _1061);
        _1453 = _1505;
        _1449 = _1503;
        _1457 = _1507;
    }
    float _1509 = _1453;
    float _1511 = _1449;
    float _1513 = _1457;
    float _1515 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1517 = _1509 + _1515;
    float _1519 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1521 = _1511 + _1519;
    float _1523 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1525 = _1513 + _1523;
    float _1527 = _893 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1529 = _1517 * _1517;
    float _1531 = fma(_1035, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1527);
    float _1533 = fma(_1521, _1521, _1529);
    float _1535 = fma(_1061, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1531);
    float _1537 = fma(_1525, _1525, _1533);
    float _1539 = _1535 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1541 = rsqrt(_1537);
    float _1543 = fma(_1061, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1545 = 1.0 / _1539;
    float _1547 = _1521 * _1541;
    float _1549 = _1525 * _1541;
    float _1551 = _893 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1553 = _1517 * _1541;
    float _1555 = _1547 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1557 = _1549 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1559 = fma(_1035, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1551);
    float _1561 = sqrt(_1537);
    float _1563 = _1555 * _1555;
    float _1565 = _1557 * _1557;
    float _1567 = fma(_1061, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1559);
    float _1569 = _1563 + _1565;
    float _1571 = _1567 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1573 = floor(_1543);
    float _1575 = _1571 + _1539;
    float _1577 = _1575 * _1545;
    float _1579 = _1577 * 0.5;
    float _1581 = sqrt(_1569);
    float _1583 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1585 = fma(_1579, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1583);
    float _1587 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _1589 = -_1573;
    float _1591 = _1543 + _1589;
    float _1593 = 1.0 / _1585;
    float _1595 = _893 + _1587;
    float _1597 = fma(_1035, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1599 = _1595 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1601 = _1595 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    bool _1603 = _1581 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1605 = floor(_1597);
    float _1607 = fma(_1035, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1599);
    float _1609 = fma(_1035, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1601);
    float _1611 = fma(_1061, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1607);
    float _1613 = fma(_1061, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1609);
    float _1615 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1617 = _1593 * _1615;
    float _1619 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1621 = _1581 + _1619;
    float _1623 = _1611 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1625 = _1613 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _1627 = _1587;
    int _1629 = 2;
    float _1631 = _1621;
    float _1633 = _1557;
    float _1635 = _1563;
    float _1637 = _1625;
    float _1639 = _1553;
    float _1641 = _1617;
    if (_1603)
    {
        float _1643 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1627 = _1643;
    }
    float _1645 = _1627;
    bool _1647 = _1617 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    bool _1649 = _1617 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _1651 = -_1605;
    float _1653 = _1597 + _1651;
    float _1655 = trunc(_1623);
    int _1657 = int(_1655);
    float _1659 = _1605;
    if (!_1647)
    {
        _1629 = 1;
    }
    int _1661 = _1629;
    int _1663 = _1661;
    if (_1603)
    {
        float _1665 = _1621 * _1645;
        _1631 = _1665;
    }
    float _1667 = _1631;
    float _1669 = trunc(_1625);
    int _1671 = int(_1669);
    float _1673 = 0.0;
    if (_1603)
    {
        float _1675 = _1667 * 0.15915493667125701904296875;
        _1673 = _1675;
    }
    float _1677 = _1673;
    bool _1679 = !_1647;
    int _1681 = _1679 ? 0 : 1;
    float _1683 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    int _1685 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1687 = _1657 + _1685;
    int _1689 = _1687 + 1;
    float _1691 = _1611;
    if (_1603)
    {
        float _1693 = _1677 * 6.283185482025146484375;
        float _1695 = sin(_1693);
        _1691 = _1695;
    }
    float _1697 = _1691;
    if (!_1649)
    {
        _1663 = _1681;
    }
    int _1699 = _1663;
    float _1701 = precise::max(0.0, _1683);
    int _1703 = _1699 << 6;
    bool _1705 = _1689 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _1707 = -_1553;
    float _1709 = -_1701;
    float _1711 = fma(_1707, (*spvDescriptorSet0.vp_c15)._m0[24].y, _1709);
    int _1713 = _1703 + 96;
    uint _1716 = uint(int(uint(_1713) >> uint(2)));
    uint _1718 = uint(int(uint(int(_1716)) >> uint(2)));
    int _1720 = int(_1716) & 3;
    float _1722 = (*spvDescriptorSet0.vp_c15)._m0[int(_1718)][_1720];
    int _1724 = int(_1716) + 1;
    uint _1726 = uint(int(uint(_1724) >> uint(2)));
    int _1728 = _1724 & 3;
    float _1730 = (*spvDescriptorSet0.vp_c15)._m0[int(_1726)][_1728];
    float _1732 = _1569;
    float _1734 = _1701;
    float _1736 = _1711;
    if (_1603)
    {
        float _1738 = rsqrt(_1569);
        _1732 = _1738;
    }
    float _1740 = _1732;
    int _1742 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1744 = _1671 + _1742;
    int _1746 = _1744 + 1;
    if (_1603)
    {
        float _1748 = _1711 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1734 = _1748;
    }
    float _1750 = _1734;
    int _1752 = _1689 | _1746;
    if (_1603)
    {
        float _1754 = fma(_1697, _1750, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1659 = _1754;
    }
    float _1756 = _1659;
    int _1758 = _1703 + 48;
    uint _1760 = uint(int(uint(_1758) >> uint(2)));
    uint _1762 = uint(int(uint(int(_1760)) >> uint(2)));
    int _1764 = int(_1760) & 3;
    float _1766 = (*spvDescriptorSet0.vp_c15)._m0[int(_1762)][_1764];
    int _1768 = int(_1760) + 1;
    uint _1770 = uint(int(uint(_1768) >> uint(2)));
    int _1772 = _1768 & 3;
    float _1774 = (*spvDescriptorSet0.vp_c15)._m0[int(_1770)][_1772];
    float _1776 = _1677;
    if (_1603)
    {
        float _1778 = _1677 * 6.283185482025146484375;
        float _1780 = cos(_1778);
        _1776 = _1780;
    }
    float _1782 = _1776;
    bool _1784 = _1752 < 0;
    bool _1786 = _1784 || _1705;
    float _1788 = _1509 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    bool _1790 = _1746 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1792 = _1790 || _1786;
    float _1794 = fma(_1511, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1788);
    int _1796 = _1703 + 104;
    uint _1798 = uint(int(uint(_1796) >> uint(2)));
    uint _1800 = uint(int(uint(int(_1798)) >> uint(2)));
    int _1802 = int(_1798) & 3;
    float _1804 = (*spvDescriptorSet0.vp_c15)._m0[int(_1800)][_1802];
    int _1806 = int(_1798) + 1;
    uint _1808 = uint(int(uint(_1806) >> uint(2)));
    int _1810 = _1806 & 3;
    float _1812 = (*spvDescriptorSet0.vp_c15)._m0[int(_1808)][_1810];
    float _1814 = 0.0;
    float _1816 = _1740;
    if (_1603)
    {
        float _1818 = _1740 * _1756;
        _1814 = _1818;
    }
    float _1820 = _1814;
    float _1822 = fma(_1513, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1794);
    float _1824 = _1820;
    if (_1603)
    {
        float _1826 = _1557 * _1820;
        _1633 = _1826;
    }
    float _1828 = _1633;
    int _1830 = _1703 + 64;
    uint _1832 = uint(int(uint(_1830) >> uint(2)));
    uint _1834 = uint(int(uint(int(_1832)) >> uint(2)));
    int _1836 = int(_1832) & 3;
    float _1838 = (*spvDescriptorSet0.vp_c15)._m0[int(_1834)][_1836];
    int _1840 = int(_1832) + 1;
    uint _1842 = uint(int(uint(_1840) >> uint(2)));
    int _1844 = _1840 & 3;
    float _1846 = (*spvDescriptorSet0.vp_c15)._m0[int(_1842)][_1844];
    if (_1603)
    {
        float _1848 = _1782 + (-1.0);
        _1816 = _1848;
    }
    float _1850 = _1816;
    float _1852 = 0.0;
    float _1854 = _1850;
    if (!_1792)
    {
        float _1856 = floor(_1625);
        _1852 = _1856;
    }
    float _1858 = _1852;
    float _1860 = 0.0;
    if (_1603)
    {
        float _1862 = _1850 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1860 = _1862;
    }
    float _1864 = _1860;
    if (!_1603)
    {
        _1854 = _1555;
    }
    float _1866 = _1854;
    float _1868 = _1866;
    if (_1603)
    {
        float _1870 = _1555 * _1820;
        _1868 = _1870;
    }
    float _1872 = _1868;
    int _1874 = _1703 + 80;
    uint _1876 = uint(int(uint(_1874) >> uint(2)));
    uint _1878 = uint(int(uint(int(_1876)) >> uint(2)));
    int _1880 = int(_1876) & 3;
    float _1882 = (*spvDescriptorSet0.vp_c15)._m0[int(_1878)][_1880];
    int _1884 = int(_1876) + 1;
    uint _1886 = uint(int(uint(_1884) >> uint(2)));
    int _1888 = _1884 & 3;
    float _1890 = (*spvDescriptorSet0.vp_c15)._m0[int(_1886)][_1888];
    if (_1603)
    {
        float _1892 = fma(_1711, _1782, _1864);
        _1736 = _1892;
    }
    float _1894 = _1736;
    float _1896 = _1822 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    if (_1603)
    {
        float _1898 = _1872 * _1872;
        _1635 = _1898;
    }
    float _1900 = _1635;
    if (!_1603)
    {
        _1824 = _1565;
    }
    float _1902 = _1824;
    float _1904 = _1902;
    if (_1603)
    {
        float _1906 = _1828 * _1828;
        _1904 = _1906;
    }
    float _1908 = _1904;
    float _1910 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1912 = fma(_1894, _1894, _1900);
    int _1914 = _1703 + 56;
    uint _1916 = uint(int(uint(_1914) >> uint(2)));
    uint _1918 = uint(int(uint(int(_1916)) >> uint(2)));
    int _1920 = int(_1916) & 3;
    float _1922 = (*spvDescriptorSet0.vp_c15)._m0[int(_1918)][_1920];
    int _1924 = int(_1916) + 1;
    uint _1926 = uint(int(uint(_1924) >> uint(2)));
    int _1928 = _1924 & 3;
    float _1930 = (*spvDescriptorSet0.vp_c15)._m0[int(_1926)][_1928];
    float _1932 = _1896 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float2 _5892 = float2(_1653, _1591);
    float _1934 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5892, float2(0.0), isnan(_5892)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5892, float2(0.0), isnan(_5892)), level(0.0)).x;
    int _1936 = as_type<int>(_1932);
    if (!_1792)
    {
        float _1938 = -_1858;
        float _1940 = _1625 + _1938;
        _1637 = _1940;
    }
    float _1942 = _1637;
    float _1944 = -_1932;
    float _1946 = fma(_1944, _1910, 1.0);
    if (!_1792)
    {
        int _1948 = _1746 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1950 = _1948 + _1689;
        _1936 = _1950;
    }
    int _1952 = _1936;
    int _1954 = _1703 + 72;
    uint _1956 = uint(int(uint(_1954) >> uint(2)));
    uint _1958 = uint(int(uint(int(_1956)) >> uint(2)));
    int _1960 = int(_1956) & 3;
    float _1962 = (*spvDescriptorSet0.vp_c15)._m0[int(_1958)][_1960];
    int _1964 = int(_1956) + 1;
    uint _1966 = uint(int(uint(_1964) >> uint(2)));
    int _1968 = _1964 & 3;
    float _1970 = (*spvDescriptorSet0.vp_c15)._m0[int(_1966)][_1968];
    float _1972 = _1595 * _1730;
    float _1974 = fma(_1035, _1722, _1972);
    int _1976 = _1703 + 88;
    uint _1978 = uint(int(uint(_1976) >> uint(2)));
    uint _1980 = uint(int(uint(int(_1978)) >> uint(2)));
    int _1982 = int(_1978) & 3;
    float _1984 = (*spvDescriptorSet0.vp_c15)._m0[int(_1980)][_1982];
    int _1986 = int(_1978) + 1;
    uint _1988 = uint(int(uint(_1986) >> uint(2)));
    int _1990 = _1986 & 3;
    float _1992 = (*spvDescriptorSet0.vp_c15)._m0[int(_1988)][_1990];
    float _1994 = _1595 * _1774;
    int _1996 = as_type<int>(_1774);
    if (!_1792)
    {
        int _1998 = _1952 << 2;
        _1996 = _1998;
    }
    int _2000 = _1996;
    float _2002 = fma(_1035, _1766, _1994);
    int _2004 = _2000;
    if (!_1792)
    {
        int _2006 = 12 & _2000;
        _2004 = _2006;
    }
    int _2008 = _2004;
    float _2010 = _1912 + _1908;
    float _2012 = fma(_1061, _1804, _1974);
    float _2014 = _2012 + _1812;
    float _2016 = rsqrt(_2010);
    float _2018 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2020 = fma(_1561, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2018);
    float _2022 = precise::clamp(_2020, 0.0, 1.0);
    float _2024 = _1595 * _1846;
    int _2026 = as_type<int>((*spvDescriptorSet0.vp_c15)._m0[23].w);
    if (!_1792)
    {
        uint _2028 = uint(int(uint(_1952) >> uint(2)));
        _2026 = int(_2028);
    }
    int _2030 = _2026;
    float _2032 = -_2022;
    float _2034 = _2032 + 1.0;
    float _2036 = fma(_1035, _1838, _2024);
    float _2038 = as_type<float>(_2030);
    if (!_1792)
    {
        int _2040 = _2030 << 4;
        int _2042 = _2040 + _2008;
        _2038 = as_type<float>(_2042);
    }
    float _2044 = _2038;
    float _2046 = 1.0 / _2014;
    float _2048 = _1509 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2050 = _1595 * _1890;
    float _2052 = fma(_1511, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2048);
    float _2054 = fma(_1035, _1882, _2050);
    float _2056 = _2044;
    if (!_1792)
    {
        int _2058 = as_type<int>(_2044) + 400;
        uint _2060 = uint(int(uint(_2058) >> uint(2)));
        uint _2062 = uint(int(uint(int(_2060)) >> uint(2)));
        int _2064 = int(_2060) & 3;
        float _2066 = (*spvDescriptorSet0.vp_c15)._m0[int(_2062)][_2064];
        _2056 = _2066;
    }
    float _2068 = _2056;
    float _2070 = _2016 * _1872;
    float _2072 = abs(_2034);
    float _2074 = log2(_2072);
    float _2076 = fma(_1061, _1922, _2002);
    float _2078 = _2016 * _1894;
    float _2080 = _2070 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2082 = _2016 * _1828;
    float _2084 = _2076 + _1930;
    float _2086 = _1509 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2088 = -_2080;
    float _2090 = fma(_2078, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2088);
    float _2092 = fma(_1513, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2052);
    float _2094 = fma(_1061, _1962, _2036);
    float _2096 = fma(_1511, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2086);
    float _2098 = -_2082;
    float _2100 = fma(_2098, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2090);
    float _2102 = log2(_1946);
    float _2104 = fma(_2100, -0.5, 0.5);
    float _2106 = _2074 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2108 = fma(_1061, _1984, _2054);
    float _2110 = _2094 + _1970;
    float _2112 = _1509 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2114 = fma(_1513, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2096);
    float _2116 = _2084 * _2046;
    float _2118 = exp2(_2106);
    float _2120 = fma(_1511, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2112);
    float _2122 = _2114 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2124 = _2092 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    bool _2126 = _2116 >= 0.0;
    float _2128 = fma(_1513, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2120);
    float _2130 = _2122 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2132 = fma(_2100, 0.5, 0.5);
    bool _2134 = _2116 <= 1.0;
    bool _2136 = _2134 && _2126;
    float _2138 = _2128 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2140 = sqrt(_2104);
    float _2142 = _2102 * 0.693147182464599609375;
    float _2144 = fma(_2138, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2130);
    float _2146 = _2110 * _2046;
    float _2148 = fma(_2132, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2150 = _2108 + _1992;
    float _2152 = fma(_1896, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2144);
    float _2154 = _2078 + 1.0;
    bool _2156 = _2146 >= 0.0;
    bool _2158 = _2156 && _2136;
    float _2160 = fma(_2132, _2148, -0.212114393711090087890625);
    float _2162 = fma(_2124, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2152);
    float _2164 = _2122 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    bool _2166 = _2146 <= 1.0;
    bool _2168 = _2166 && _2158;
    float _2170 = fma(_2132, _2160, 1.570728778839111328125);
    float _2172 = _2100;
    float _2174 = _2164;
    float _2176 = _2162;
    if (!_1792)
    {
        float _2178 = floor(_1623);
        _2172 = _2178;
    }
    float _2180 = _2172;
    float _2182 = fma(_2138, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2164);
    float _2184 = _2122 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2186 = -_2078;
    float _2188 = fma(_2118, _2154, _2186);
    float _2190 = _2140 * 0.636619746685028076171875;
    float _2192 = fma(_1896, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2182);
    float _2194 = fma(_2138, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2184);
    float _2196 = _2150 * _2046;
    float _2198 = 1.0 / _2162;
    float _2200 = -_2170;
    float _2202 = fma(_2190, _2200, 1.0);
    float _2204 = fma(_1896, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2194);
    float _2206 = _2182;
    if (_2168)
    {
        float _2208 = float(_1699);
        _2174 = _2208;
    }
    float _2210 = _2174;
    float _2212 = fma(_2124, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2192);
    float _2214 = _2142 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2216 = fma(_2124, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2204);
    float _2218 = fma(_2188, 0.5, 0.5);
    float _2220 = _2216;
    if (!_1792)
    {
        float _2222 = -_2180;
        float _2224 = _1623 + _2222;
        _2206 = _2224;
    }
    float _2226 = _2206;
    float _2228 = _2210;
    if (_2168)
    {
        float _2230 = rint(_2210);
        float _2232 = precise::max(_2230, 0.0);
        uint _2234 = uint(_2232);
        uint _2236 = clamp(_2234, 0u, 65535u);
        _2228 = as_type<float>(_2236);
    }
    float _2238 = _2228;
    float _2240 = _2216 * _2198;
    float _2242 = _2212 * _2198;
    float _2244 = _2142;
    if (!_1792)
    {
        float _2246 = rint(_2068);
        float _2248 = precise::max(_2246, 0.0);
        uint _2250 = uint(_2248);
        uint _2252 = clamp(_2250, 0u, 65535u);
        _2244 = as_type<float>(_2252);
    }
    float _2254 = _2244;
    float _2256 = fma(_2240, 0.5, 0.5);
    float _2258 = fma(_2242, -0.5, 0.5);
    float _2260 = _2146;
    if (_2168)
    {
        float3 _6447 = float3(_2116, _2146, float(as_type<int>(_2238)));
        float3 _6451 = select(_6447, float3(0.0), isnan(_6447));
        float _2262 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _6451.xy, uint(rint(_6451.z)), _2196, level(0.0));
        _2260 = _2262;
    }
    float _2264 = _2260;
    float3 _6461 = float3(_2256, _2258, _2214);
    float _2266 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6461, float3(0.0), isnan(_6461)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6461, float3(0.0), isnan(_6461)), level(0.0)).x;
    float3 _6470 = float3(_2256, _2258, _2214);
    float4 _2269 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6470, float3(0.0), isnan(_6470)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6470, float3(0.0), isnan(_6470)), level(0.0)).xyzw;
    float _2271 = _2269.x;
    float _2273 = _2269.y;
    float _2275 = _2269.z;
    float _2277 = _2269.w;
    float2 _6486 = float2(_2202, _2218);
    float3 _2281 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6486, float2(0.0), isnan(_6486)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6486, float2(0.0), isnan(_6486)), level(0.0)).xyz;
    float _2283 = _2281.x;
    float _2285 = _2281.y;
    float _2287 = _2281.z;
    float _2289 = _1942;
    if (!_1792)
    {
        float3 _6507 = float3(_2226, _1942, float(as_type<int>(_2254)));
        float3 _6509 = select(_6507, float3(0.0), isnan(_6507));
        float _2291 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _6509.xy, uint(rint(_6509.z)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _6509.xy, uint(rint(_6509.z)), level(0.0)).x;
        _2289 = _2291;
    }
    float _2293 = _2289;
    float _2295 = abs(_1617);
    float _2297 = log2(_2295);
    float _2299 = _2122 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2301 = _2074 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2303 = fma(_2138, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2299);
    bool _2305 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2307 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2309 = _2305 || _2307;
    bool _2311 = isnan(0.5);
    bool _2313 = _2309 || _2311;
    float _2315 = fma(_1896, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2303);
    float _2317 = _1315 * _1553;
    float _2319 = -(*spvDescriptorSet0.vp_c9)._m0[139].z;
    float _2321 = (*spvDescriptorSet0.vp_c9)._m0[139].w + _2319;
    float _2323 = fma(_2124, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2315);
    float _2325 = fma(_1311, _1547, _2317);
    float _2327 = _2297 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2329 = 1.0 / _2321;
    float _2331 = _2162 * 0.5;
    if (!_2313)
    {
        _1639 = (*spvDescriptorSet0.vp_c9)._m0[140].y;
    }
    float _2333 = _1639;
    float _2335 = fma(_1337, _1549, _2325);
    float _2337 = fma(_2212, -0.5, _2331);
    float _2339 = _2333;
    if (!_2313)
    {
        float _2341 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2343 = _2333 + _2341;
        _2339 = _2343;
    }
    float _2345 = _2339;
    float _2347 = exp2(_2327);
    float _2349 = _2216 + _2162;
    float _2351 = abs(_2335);
    float _2353 = -(*spvDescriptorSet0.vp_c9)._m0[139].z;
    float _2355 = _2351 + _2353;
    out.gl_Position.x = _2216;
    out.gl_Position.y = _2212;
    out.gl_Position.z = _2323;
    out.gl_Position.w = _2162;
    float _2357 = _2349 * 0.5;
    float _2359 = exp2(_2301);
    float _2361 = _2355 * _2329;
    float _2363 = precise::clamp(_2361, 0.0, 1.0);
    float _2365 = fma(_2347, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2367 = precise::clamp(_2365, 0.0, 1.0);
    float _2369 = _2345;
    float _2371 = _2357;
    if (!_2313)
    {
        float _2373 = 1.0 / _2345;
        _2369 = _2373;
    }
    float _2375 = _2369;
    float _2377 = _2363 * _2363;
    if (_2313)
    {
        _2220 = 1.0;
    }
    float _2379 = _2220;
    float _2381 = fma(_2367, -2.0, 3.0);
    float _2383 = _2323 + _2162;
    float _2385 = _2367 * _2367;
    float _2387 = fma(_2363, -2.0, 3.0);
    float _2389 = -_2359;
    float _2391 = _2389 + 1.0;
    float _2393 = _2383 * 0.5;
    float _2395 = _2385 * _2381;
    float _2397 = _2377 * _2387;
    float _2399 = _2379;
    float _2401 = _2397;
    if (!_2168)
    {
        _2176 = 1.0;
    }
    float _2403 = _2176;
    out.m_92.x = _2357;
    out.m_92.y = _2337;
    out.m_92.z = _2393;
    out.m_92.w = _2162;
    float _2405 = -_2395;
    float _2407 = _2405 + 1.0;
    float _2409 = fma(_2407, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2395);
    bool _2411 = _1617 <= 8000.0;
    bool _2413 = isnan(_1617);
    bool _2415 = _2411 || _2413;
    bool _2417 = isnan(8000.0);
    bool _2419 = _2415 || _2417;
    float _2421 = float(_2419);
    float _2423 = _2403;
    if (!_2313)
    {
        float _2425 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2427 = _1617 + _2425;
        _1641 = _2427;
    }
    float _2429 = _1641;
    float _2431 = _2421 * _2409;
    if (!_2313)
    {
        float _2433 = _2429 * _2375;
        float _2435 = precise::clamp(_2433, 0.0, 1.0);
        _2399 = _2435;
    }
    float _2437 = _2399;
    float _2439 = _2431 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2441 = -_1934;
    float _2443 = _2441 + 1.0;
    float _2445 = _2439;
    if (_2168)
    {
        bool _2447 = _2264 >= _2196;
        bool _2449 = isnan(_2264);
        bool _2451 = _2447 || _2449;
        bool _2453 = isnan(_2196);
        bool _2455 = _2451 || _2453;
        float _2457 = float(_2455);
        _2423 = _2457;
    }
    float _2459 = _2423;
    float _2461 = _2443 * _2439;
    float _2463 = precise::clamp(_2461, 0.0, 1.0);
    float _2465 = _2391 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    if (_1792)
    {
        _2445 = 1.0;
    }
    float _2467 = _2445;
    float _2469 = _2467;
    if (!_1792)
    {
        int _2471 = _1952 << 4;
        int _2473 = _2471 + 2048;
        uint _2475 = uint(int(uint(_2473) >> uint(2)));
        uint _2477 = uint(int(uint(int(_2475)) >> uint(2)));
        int _2479 = int(_2475) & 3;
        float _2481 = (*spvDescriptorSet0.vp_c15)._m0[int(_2477)][_2479];
        int _2483 = int(_2475) + 1;
        uint _2485 = uint(int(uint(_2483) >> uint(2)));
        int _2487 = _2483 & 3;
        float _2489 = (*spvDescriptorSet0.vp_c15)._m0[int(_2485)][_2487];
        int _2491 = _2473 + 8;
        uint _2493 = uint(int(uint(_2491) >> uint(2)));
        uint _2495 = uint(int(uint(int(_2493)) >> uint(2)));
        int _2497 = int(_2493) & 3;
        float _2499 = (*spvDescriptorSet0.vp_c15)._m0[int(_2495)][_2497];
        int _2501 = int(_2493) + 1;
        uint _2503 = uint(int(uint(_2501) >> uint(2)));
        int _2505 = _2501 & 3;
        float _2507 = (*spvDescriptorSet0.vp_c15)._m0[int(_2503)][_2505];
        float _2509 = _1595 * _2489;
        float _2511 = fma(_1035, _2481, _2509);
        float _2513 = fma(_1061, _2499, _2511);
        float _2515 = _2513 + _2507;
        float _2517 = precise::clamp(_2515, 0.0, 1.0);
        float _2519 = -_2517;
        float _2521 = _2519 + _2293;
        float _2523 = fma(_2521, 500.0, 1.5);
        float _2525 = exp2(_2523);
        float _2527 = 0.0 + _2525;
        float _2529 = precise::clamp(_2527, 0.0, 1.0);
        _2469 = _2529;
        _2371 = _2481;
    }
    float _2531 = _2469;
    float _2533 = _2371;
    float _2535 = _2459 * _2531;
    float _2537 = _2465 * _2266;
    float _2539 = -_2463;
    float _2541 = fma(_2539, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2543 = -_2465;
    float _2545 = _2543 + 1.0;
    out.m_94.x = _1511;
    out.m_94.y = _1509;
    out.m_94.z = _1513;
    float _2547 = _2277 * _2537;
    float _2549 = -_2535;
    float _2551 = fma(_2549, _2541, 1.0);
    float _2553 = precise::clamp(_2551, 0.0, 1.0);
    float _2555 = _2287 * _2537;
    float _2557 = _2277 * _2545;
    float _2559 = fma(_2283, _2547, _2271);
    float _2561 = fma(_2285, _2547, _2273);
    float _2563 = _2553 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2565 = fma(_2277, _2555, _2275);
    bool _2567 = _1561 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2569 = isnan(_1561);
    bool _2571 = _2567 || _2569;
    bool _2573 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2575 = _2571 || _2573;
    float _2577 = _2397 * _2437;
    out.m_96.x = _2563;
    float _2579 = _2577 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_98.x = _2559;
    out.m_98.y = _2561;
    out.m_98.z = _2565;
    out.m_98.w = _2557;
    float _2581 = _2533;
    float _2583 = _2545;
    float _2585 = _2553;
    float _2587 = _2547;
    if (!_2575)
    {
        _2581 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2589 = _2581;
    float _2591 = _2589;
    float _2593 = _2589;
    if (!_2575)
    {
        _2583 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2595 = _2583;
    float _2597 = _2595;
    float _2599 = _2595;
    if (!_2575)
    {
        _2585 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2601 = _2585;
    float _2603 = _2601;
    float _2605 = _2601;
    if (!_2575)
    {
        _2401 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2607 = _2401;
    float _2609 = _2607;
    float _2611 = _2607;
    if (!_2575)
    {
        _1185 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2613 = _1185;
    float _2615 = _2613;
    float _2617 = _2613;
    if (!_2575)
    {
        _2587 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2619 = _2587;
    bool _2621 = !_2575;
    float _2623 = _2619;
    float _2625 = _2619;
    if (!_2621)
    {
        bool _2627 = _1561 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2629 = isnan(_1561);
        bool _2631 = _2627 || _2629;
        bool _2633 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2635 = _2631 || _2633;
        if (!_2635)
        {
            float _2637 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2639 = _1561 + _2637;
            float _2641 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2643 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2641;
            float _2645 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2647 = _2645 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2649 = 1.0 / _2643;
            float _2651 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2653 = _2651 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2655 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2657 = _2655 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2659 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2661 = _2659 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2663 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2665 = _2663 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2667 = _2639 * _2649;
            float _2669 = precise::clamp(_2667, 0.0, 1.0);
            float _2671 = fma(_2669, _2647, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2673 = fma(_2669, _2653, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2675 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2677 = _2675 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2679 = fma(_2669, _2657, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2681 = fma(_2669, _2661, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2683 = fma(_2669, _2665, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            float _2685 = fma(_2669, _2677, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            _2599 = _2673;
            _2617 = _2681;
            _2593 = _2671;
            _2611 = _2679;
            _2605 = _2685;
            _2625 = _2683;
            _2687 = true;
        }
        else
        {
            bool _2689 = _1561 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2691 = isnan(_1561);
            bool _2693 = _2689 || _2691;
            bool _2695 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2697 = _2693 || _2695;
            if (!_2697)
            {
                _2591 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2699 = _2591;
            _2593 = _2699;
            if (!_2697)
            {
                _2597 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2701 = _2597;
            _2599 = _2701;
            if (!_2697)
            {
                _2603 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2703 = _2603;
            _2605 = _2703;
            if (!_2697)
            {
                _2609 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2705 = _2609;
            _2611 = _2705;
            if (!_2697)
            {
                _2615 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2707 = _2615;
            _2617 = _2707;
            if (!_2697)
            {
                _2623 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2709 = _2623;
            bool _2711 = !_2697;
            _2625 = _2709;
            if (!_2711)
            {
                bool _2713 = _1561 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2715 = isnan(_1561);
                bool _2717 = _2713 || _2715;
                bool _2719 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2721 = _2717 || _2719;
                if (!_2721)
                {
                    float _2723 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2725 = _1561 + _2723;
                    float _2727 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2729 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2727;
                    float _2731 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2733 = _2731 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2735 = 1.0 / _2729;
                    float _2737 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2739 = _2737 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2741 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2743 = _2741 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2745 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2747 = _2745 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2749 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2751 = _2749 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2753 = _2725 * _2735;
                    float _2755 = precise::clamp(_2753, 0.0, 1.0);
                    float _2757 = fma(_2755, _2733, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2759 = fma(_2755, _2739, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2761 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2763 = _2761 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2765 = fma(_2755, _2743, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2767 = fma(_2755, _2747, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2769 = fma(_2755, _2751, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    float _2771 = fma(_2755, _2763, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    _2599 = _2759;
                    _2617 = _2767;
                    _2593 = _2757;
                    _2611 = _2765;
                    _2605 = _2771;
                    _2625 = _2769;
                    _2687 = true;
                }
                else
                {
                    _2599 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2617 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2593 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2611 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2605 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2625 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2687 = false;
    float _2773 = _2599;
    float _2775 = _2617;
    float _2777 = _2593;
    float _2779 = _2611;
    float _2781 = _2605;
    float _2783 = _2625;
    float _2785 = fma(_1315, -0.5, 0.5);
    float _2787 = precise::clamp(_2785, 0.0, 1.0);
    float _2789 = -_2773;
    float _2791 = _2789 + _2775;
    float _2793 = _2579 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2795 = -_2777;
    float _2797 = _2795 + _2779;
    out.m_100.x = 0.0;
    float _2799 = fma(_2787, _2791, _2773);
    float _2801 = fma(_2787, _2797, _2777);
    out.m_61.x = _2793;
    float _2803 = -_2781;
    float _2805 = _2803 + _2783;
    float _2807 = _2799 * 0.586610972881317138671875;
    bool _2809 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2811 = fma(_2787, _2805, _2781);
    float _2813 = fma(_2801, 0.298911988735198974609375, _2807);
    bool _2815 = _2437 > 0.0;
    bool _2817 = isnan(_2437);
    bool _2819 = _2815 || _2817;
    bool _2821 = isnan(0.0);
    bool _2823 = _2819 || _2821;
    float _2825 = fma(_2811, 0.114477999508380889892578125, _2813);
    float _2827 = -_2825;
    float _2829 = _2801 + _2827;
    float _2831 = -_2825;
    float _2833 = _2799 + _2831;
    float _2835 = -_2825;
    float _2837 = _2811 + _2835;
    float _2839 = fma(_2829, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2825);
    float _2841 = fma(_2833, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2825);
    float _2843 = fma(_2837, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2825);
    bool _2845 = !_2809;
    if (!_2845)
    {
        float _2847 = -_1509;
        float _2849 = _2847 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2851 = -_1511;
        float _2853 = _2851 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2855 = -_1513;
        float _2857 = _2855 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2859 = _2849 * _2849;
        float _2861 = fma(_2853, _2853, _2859);
        float _2863 = fma(_2857, _2857, _2861);
        float _2865 = sqrt(_2863);
        float _2867 = rsqrt(_2863);
        float _2869 = -_2865;
        float _2871 = _2869 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2873 = _2871 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2875 = precise::clamp(_2873, 0.0, 1.0);
        float _2877 = _2853 * _2867;
        float _2879 = _2849 * _2867;
        float _2881 = abs(_2875);
        float _2883 = log2(_2881);
        float _2885 = _2857 * _2867;
        float _2887 = _2877 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2889 = _1315 * _2879;
        float _2891 = -_2879;
        float _2893 = -_2887;
        float _2895 = fma(_2891, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2893);
        float _2897 = fma(_1311, _2877, _2889);
        float _2899 = -_2885;
        float _2901 = fma(_2899, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2895);
        float _2903 = fma(_1337, _2885, _2897);
        float _2905 = precise::clamp(_2903, 0.0, 1.0);
        float _2907 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2909 = _2901 + _2907;
        float _2911 = _2883 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2913 = _2909 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2915 = precise::clamp(_2913, 0.0, 1.0);
        float _2917 = exp2(_2911);
        float _2919 = _2917 * _2915;
        float _2921 = _2905 * _2919;
        float _2923 = _2921 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2925 = _2921 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2927 = _2921 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_100.x = _2923;
        out.m_100.y = _2925;
        out.m_100.z = _2927;
    }
    out.m_102.x = _2839;
    out.m_102.y = _2841;
    out.m_102.z = _2843;
    if (_2823)
    {
        return out;
    }
    out.m_61.x = 0.0;
    float _2929 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2929;
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
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_102 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_100 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2687 = false;
    bool _1383 = false;
    bool _839 = false;
    bool _691 = false;
    bool _531 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _116 = in.m_58.w;
    float _118 = trunc(_116);
    int _121 = int(_118);
    bool _125 = _121 >= 1;
    float _127 = 0.0;
    if (!_125)
    {
        _127 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _129 = _127;
    float _131 = _129;
    if (!_125)
    {
        out.m_61.x = 0.0;
    }
    int _133 = 0;
    if (!_125)
    {
        float _135 = _129 * 5.0;
        _133 = as_type<int>(_135);
    }
    int _137 = _133;
    int _139 = _137;
    if (!_125)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2986 = as_type<float>(_137);
        out.gl_Position.z = _2986;
    }
    if (!_125)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _141 = in.m_63.w;
    bool _143 = _141 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _145 = isnan(_141);
    bool _147 = _143 || _145;
    bool _149 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _151 = _147 || _149;
    float _153 = -_141;
    float _155 = _153 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_151)
    {
        float _157 = float(_121);
        _131 = _157;
    }
    float _159 = _131;
    bool _161 = _155 >= _159;
    bool _163 = !_151;
    bool _165 = _161 || _163;
    float _167 = _159;
    if (_165)
    {
        _167 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _169 = _167;
    float _171 = _169;
    if (_165)
    {
        out.m_61.x = 0.0;
    }
    if (_165)
    {
        float _173 = _169 * 5.0;
        _139 = as_type<int>(_173);
    }
    int _175 = _139;
    if (_165)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3056 = as_type<float>(_175);
        out.gl_Position.z = _3056;
    }
    if (_165)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _177 = in.m_63.x;
    float _179 = in.m_63.y;
    float _181 = in.m_63.z;
    float _183 = _155 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _185 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _187 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _189 = _185 || _187;
    bool _191 = isnan(1.0);
    bool _193 = _189 || _191;
    float _195 = 0.0;
    float _197 = _183;
    if (!_193)
    {
        float _199 = _183 * _183;
        float _201 = _199 * 0.5;
        _195 = _201;
    }
    float _203 = _195;
    float _205 = 0.0;
    float _207 = _203;
    if (!_193)
    {
        float _209 = _155 * _155;
        float _211 = _209 * 0.5;
        _205 = _211;
    }
    float _213 = _205;
    if (!_193)
    {
        float _215 = _203 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _207 = _215;
    }
    float _217 = _207;
    bool _219 = !_193;
    float _221 = _217;
    float _223 = 0.0;
    if (!_219)
    {
        float _225 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _227 = log2(_225);
        float _229 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _231 = _229 + 1.0;
        float _233 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _235 = _183 * _227;
        float _237 = 1.0 / _231;
        float _239 = _233 * 0.693147182464599609375;
        float _241 = exp2(_235);
        float _243 = 1.0 / _239;
        float _245 = _241 + (-1.0);
        float _247 = -_245;
        float _249 = fma(_247, _243, _183);
        float _251 = _249 * _237;
        float _253 = _251 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _171 = _243;
        _221 = _253;
        _223 = _237;
    }
    float _255 = _171;
    float _257 = _221;
    float _259 = _223;
    bool _261 = !_193;
    float _263 = _255;
    float _265 = _259;
    if (!_261)
    {
        float _267 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _269 = log2(_267);
        float _271 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _273 = _271 + 1.0;
        float _275 = 1.0 / _273;
        float _277 = _183 * _269;
        float _279 = exp2(_277);
        float _281 = -_279;
        float _283 = _281 + 1.0;
        float _285 = _283 * _275;
        _263 = _279;
        _197 = _285;
    }
    float _287 = _263;
    float _289 = _197;
    float _291 = _287;
    if (!_193)
    {
        _265 = _155;
    }
    float _293 = _265;
    float _295 = _257 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _297 = _293;
    if (!_193)
    {
        float _299 = _213 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _291 = _299;
    }
    float _301 = _291;
    bool _303 = !_193;
    float _305 = _301;
    if (!_303)
    {
        float _307 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _309 = log2(_307);
        float _311 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _313 = _311 + 1.0;
        float _315 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _317 = _155 * _309;
        float _319 = 1.0 / _313;
        float _321 = _315 * 0.693147182464599609375;
        float _323 = exp2(_317);
        float _325 = 1.0 / _321;
        float _327 = _323 + (-1.0);
        float _329 = -_327;
        float _331 = fma(_329, _325, _155);
        float _333 = _331 * _319;
        float _335 = _333 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _305 = _335;
    }
    float _337 = _305;
    bool _339 = !_193;
    if (!_339)
    {
        float _341 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _343 = log2(_341);
        float _345 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _347 = _345 + 1.0;
        float _349 = 1.0 / _347;
        float _351 = _155 * _343;
        float _353 = exp2(_351);
        float _355 = -_353;
        float _357 = _355 + 1.0;
        float _359 = _357 * _349;
        _297 = _359;
    }
    float _361 = _297;
    float _363 = _257 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _365 = _257 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _367 = _337 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _369 = fma(_289, _177, _295);
    float _371 = fma(_289, _179, _363);
    float _373 = fma(_289, _181, _365);
    float _375 = _337 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _377 = fma(_361, _179, _367);
    float _379 = _337 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _381 = in.m_65.w;
    float _383 = fma(_361, _177, _375);
    float _385 = -_377;
    float _387 = _371 + _385;
    float _389 = fma(_361, _181, _379);
    float _391 = in.m_58.x;
    float _393 = in.m_58.y;
    float _395 = in.m_58.z;
    float _397 = -_383;
    float _399 = _369 + _397;
    float _401 = _387 * _387;
    float _403 = -_389;
    float _405 = _373 + _403;
    float _407 = in.m_67.y;
    float _409 = fma(_399, _399, _401);
    float _411 = in.m_69.y;
    float _413 = fma(_405, _405, _409);
    float _415 = in.m_71.y;
    float _417 = in.m_67.x;
    float _419 = sqrt(_413);
    float _421 = in.m_69.x;
    float _423 = in.m_71.x;
    float _425 = fma(_369, _381, _391);
    float _427 = fma(_373, _381, _395);
    float _429 = in.m_67.z;
    float _431 = _387 * _407;
    float _433 = in.m_69.z;
    bool _435 = _419 >= 9.9999999747524270787835121154785e-07;
    bool _437 = isnan(_419);
    bool _439 = _435 || _437;
    bool _441 = isnan(9.9999999747524270787835121154785e-07);
    bool _443 = _439 || _441;
    float _445 = _387 * _411;
    float _447 = in.m_71.z;
    float _449 = _387 * _415;
    float _451 = _407 * _407;
    out.m_73.x = _425;
    float _453 = fma(_399, _417, _431);
    out.m_73.z = _427;
    float _455 = fma(_399, _421, _445);
    float _457 = fma(_399, _423, _449);
    float _459 = fma(_415, _415, _451);
    float _461 = fma(_371, _381, _393);
    float _463 = fma(_405, _429, _453);
    float _465 = fma(_411, _411, _459);
    float _467 = fma(_405, _433, _455);
    float _469 = fma(_405, _447, _457);
    float _471 = _405;
    float _473 = _463;
    float _475 = _469;
    float _477 = _469;
    float _479 = _427;
    if (_443)
    {
        _471 = _463;
    }
    float _481 = _471;
    float _483 = _481;
    float _485 = _481;
    if (_443)
    {
        _473 = _467;
    }
    float _487 = _473;
    float _489 = _487;
    float _491 = _487;
    if (!_443)
    {
        bool _493 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _495 = !_493;
        if (!_495)
        {
            float _497 = _407 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _499 = _415 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _501 = _411 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _503 = fma(_417, (*spvDescriptorSet0.vp_c9)._m0[16].x, _497);
            float _505 = fma(_423, (*spvDescriptorSet0.vp_c9)._m0[16].x, _499);
            float _507 = fma(_421, (*spvDescriptorSet0.vp_c9)._m0[16].x, _501);
            float _509 = fma(_429, (*spvDescriptorSet0.vp_c9)._m0[16].z, _503);
            float _511 = fma(_447, (*spvDescriptorSet0.vp_c9)._m0[16].z, _505);
            float _513 = fma(_433, (*spvDescriptorSet0.vp_c9)._m0[16].z, _507);
            float _515 = _509 * _509;
            float _517 = fma(_511, _511, _515);
            float _519 = fma(_513, _513, _517);
            float _521 = rsqrt(_519);
            float _523 = _521 * 9.9999999747524270787835121154785e-07;
            float _525 = _511 * _523;
            float _527 = _509 * _523;
            float _529 = _513 * _523;
            _485 = _527;
            _477 = _525;
            _491 = _529;
            _531 = true;
        }
        else
        {
            float _533 = _179 * _179;
            float _535 = fma(_177, _177, _533);
            float _537 = fma(_181, _181, _535);
            float _539 = sqrt(_537);
            bool _541 = _539 >= 9.9999999747524270787835121154785e-07;
            bool _543 = isnan(_539);
            bool _545 = _541 || _543;
            bool _547 = isnan(9.9999999747524270787835121154785e-07);
            bool _549 = _545 || _547;
            float _551 = _539;
            if (!_549)
            {
                float _553 = _393 * _393;
                float _555 = fma(_391, _391, _553);
                float _557 = fma(_395, _395, _555);
                float _559 = sqrt(_557);
                bool _561 = _559 >= 9.9999999747524270787835121154785e-07;
                bool _563 = isnan(_559);
                bool _565 = _561 || _563;
                bool _567 = isnan(9.9999999747524270787835121154785e-07);
                bool _569 = _565 || _567;
                float _571 = _465;
                if (!_569)
                {
                    float _573 = rsqrt(_465);
                    _571 = _573;
                }
                float _575 = _571;
                if (!_569)
                {
                    float _577 = _575 * 9.9999999747524270787835121154785e-07;
                    _551 = _577;
                }
                float _579 = _551;
                if (!_569)
                {
                    float _581 = _415 * _579;
                    _475 = _581;
                }
                float _583 = _475;
                _477 = _583;
                if (!_569)
                {
                    float _585 = _407 * _579;
                    _483 = _585;
                }
                float _587 = _483;
                _485 = _587;
                if (!_569)
                {
                    float _589 = _411 * _579;
                    _489 = _589;
                }
                float _591 = _489;
                bool _593 = !_569;
                _491 = _591;
                _531 = _593;
                if (!_531)
                {
                    float _595 = _407 * _393;
                    float _597 = _415 * _393;
                    float _599 = _411 * _393;
                    float _601 = fma(_391, _417, _595);
                    float _603 = fma(_391, _423, _597);
                    float _605 = fma(_391, _421, _599);
                    float _607 = fma(_395, _429, _601);
                    float _609 = fma(_395, _447, _603);
                    float _611 = fma(_395, _433, _605);
                    float _613 = _607 * _607;
                    float _615 = fma(_609, _609, _613);
                    float _617 = fma(_611, _611, _615);
                    float _619 = rsqrt(_617);
                    float _621 = _619 * 9.9999999747524270787835121154785e-07;
                    float _623 = _609 * _621;
                    float _625 = _607 * _621;
                    float _627 = _611 * _621;
                    _485 = _625;
                    _477 = _623;
                    _491 = _627;
                    _531 = true;
                }
            }
            else
            {
                float _629 = _407 * _179;
                float _631 = _415 * _179;
                float _633 = _411 * _179;
                float _635 = fma(_177, _417, _629);
                float _637 = fma(_177, _423, _631);
                float _639 = fma(_177, _421, _633);
                float _641 = fma(_181, _429, _635);
                float _643 = fma(_181, _447, _637);
                float _645 = fma(_181, _433, _639);
                float _647 = _641 * _641;
                float _649 = fma(_643, _643, _647);
                float _651 = fma(_645, _645, _649);
                float _653 = rsqrt(_651);
                float _655 = _653 * 9.9999999747524270787835121154785e-07;
                float _657 = _643 * _655;
                float _659 = _641 * _655;
                float _661 = _645 * _655;
                _485 = _659;
                _477 = _657;
                _491 = _661;
            }
        }
    }
    _531 = false;
    float _663 = _485;
    float _665 = _477;
    float _667 = _491;
    bool _669 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _671 = !_669;
    float _689;
    if (!_671)
    {
        float _673 = in.m_75.x;
        float _675 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _677 = _673 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _679 = fma(_677, (*spvDescriptorSet0.vp_c9)._m0[12].x, _155);
        float _681 = _679 * _675;
        float _683 = floor(_681);
        float _685 = -_683;
        float _687 = _681 + _685;
        _689 = _687;
        _691 = true;
    }
    else
    {
        float _693 = float(_121);
        float _695 = 1.0 / _693;
        float _697 = _155 * _695;
        _689 = _697;
    }
    _691 = false;
    float _699 = _689;
    float _701 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _703 = _699 + _701;
    bool _705 = _699 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _707 = isnan(_699);
    bool _709 = _705 || _707;
    bool _711 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _713 = _709 || _711;
    float _715 = float(_713);
    bool _717 = _699 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _719 = isnan(_699);
    bool _721 = _717 || _719;
    bool _723 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _725 = _721 || _723;
    float _727 = float(_725);
    float _729 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _731 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _729;
    float _733 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _735 = _733 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _737 = -_715;
    float _739 = _737 + 1.0;
    float _741 = 1.0 / _735;
    bool _743 = _699 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _745 = isnan(_699);
    bool _747 = _743 || _745;
    bool _749 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _751 = _747 || _749;
    float _753 = float(_751);
    float _755 = _727 * _739;
    float _757 = -_727;
    float _759 = _757 + 1.0;
    bool _761 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _763 = _753 * _759;
    float _765 = 1.0 / _731;
    float _767 = -_753;
    float _769 = _767 + 1.0;
    float _771 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _773 = _771 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _775 = _703 * _765;
    float _777 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _779 = _699 + _777;
    float _781 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _783 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _781;
    float _785 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _787 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _785;
    float _789 = _779 * _741;
    float _791 = fma(_783, _775, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _793 = fma(_787, _775, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _795 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _797 = _795 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _799 = fma(_773, _789, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _801 = _791 * _763;
    float _803 = _793 * _763;
    float _805 = fma(_797, _789, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _807 = fma(_769, (*spvDescriptorSet0.vp_c9)._m0[143].x, _801);
    float _809 = fma(_769, (*spvDescriptorSet0.vp_c9)._m0[143].y, _803);
    float _811 = fma(_805, _755, _807);
    float _813 = fma(_799, _755, _809);
    float _815 = fma(_715, (*spvDescriptorSet0.vp_c9)._m0[145].x, _811);
    float _817 = fma(_715, (*spvDescriptorSet0.vp_c9)._m0[145].y, _813);
    bool _819 = !_761;
    float _837;
    if (!_819)
    {
        float _821 = in.m_75.x;
        float _823 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _825 = _821 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _827 = fma(_825, (*spvDescriptorSet0.vp_c9)._m0[11].y, _155);
        float _829 = _827 * _823;
        float _831 = floor(_829);
        float _833 = -_831;
        float _835 = _829 + _833;
        _837 = _835;
        _839 = true;
    }
    else
    {
        float _841 = float(_121);
        float _843 = 1.0 / _841;
        float _845 = _155 * _843;
        _837 = _845;
    }
    _839 = false;
    float _847 = _837;
    float _849 = _663 * _663;
    float _851 = in.m_75.x;
    float _853 = in.m_75.y;
    float _855 = _461 * _407;
    float _857 = _461 * _411;
    float _859 = fma(_665, _665, _849);
    float _861 = as_type<float>(int(gl_VertexIndex));
    float _863 = fma(_425, _417, _855);
    float _865 = fma(_667, _667, _859);
    float _867 = _461 * _415;
    float _869 = fma(_427, _429, _863);
    bool _871 = _847 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _873 = isnan(_847);
    bool _875 = _871 || _873;
    bool _877 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _879 = _875 || _877;
    float _881 = float(_879);
    float _883 = fma(_425, _423, _867);
    float _885 = rsqrt(_865);
    float _887 = fma(_425, _421, _857);
    float _889 = in.m_65.x;
    float _891 = in.m_65.y;
    float _893 = _869 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _895 = fma(_427, _433, _887);
    bool _897 = _847 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _899 = isnan(_847);
    bool _901 = _897 || _899;
    bool _903 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _905 = _901 || _903;
    float _907 = float(_905);
    bool _909 = _851 > 0.5;
    bool _911 = _853 > 0.5;
    float _913 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _915 = _885 * _667;
    float _917 = _885 * _663;
    float _919 = _885 * _665;
    int _921 = as_type<int>(_861) & 1;
    bool _923 = _921 != 0;
    int _925 = as_type<int>(_861) & 2;
    bool _927 = _925 != 0;
    float _929 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _931 = _915 * _929;
    float _933 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _935 = _917 * _933;
    float _937 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _939 = _937 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _941 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _943 = -_931;
    float _945 = fma(_919, _941, _943);
    float _947 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _949 = -_935;
    float _951 = fma(_915, _947, _949);
    float _953 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _955 = _919 * _953;
    float _957 = 1.0 / _939;
    float _959 = _945 * _945;
    float _961 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _963 = _961 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _965 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _967 = -_955;
    float _969 = fma(_917, _965, _967);
    int _971 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _973 = _971 != 0;
    float _975 = fma(_951, _951, _959);
    int _977 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _979 = _977 != 0;
    float _981 = _815 * _889;
    float _983 = 1.0 / _963;
    float _985 = fma(_969, _969, _975);
    float _987 = fma(_427, _447, _883);
    float _989 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _991 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _989;
    float _993 = _817 * _891;
    float _995 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _997 = _995 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    bool _999 = !_927;
    float _1001 = _999 ? (-0.5) : 0.5;
    float _1003 = rsqrt(_985);
    float _1005 = _991 * _957;
    bool _1007 = !_923;
    float _1009 = _1007 ? (-0.5) : 0.5;
    float _1011 = _993 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1013 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1001);
    float _1015 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1017 = _847 + _1015;
    float _1019 = _981 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1021 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1009);
    float _1023 = _997 * _983;
    float _1025 = _1011 * _1013;
    float _1027 = fma(_1005, _1017, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1029 = _1019 * _1021;
    float _1031 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1033 = _1025 * _919;
    float _1035 = _987 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1037 = _945 * _1003;
    float _1039 = _969 * _1003;
    float _1041 = _951 * _1003;
    float _1043 = _1025 * _915;
    float _1045 = _919 * _1037;
    float _1047 = _917 * _1039;
    float _1049 = fma(_1029, _1041, _1033);
    float _1051 = fma(_1029, _1039, _1043);
    float _1053 = -_1045;
    float _1055 = fma(_917, _1041, _1053);
    float _1057 = -_1047;
    float _1059 = fma(_915, _1037, _1057);
    float _1061 = _895 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1063 = fma(_1031, _1055, _1051);
    float _1065 = fma(_1031, _1059, _1049);
    float _1067 = -_881;
    float _1069 = _1067 + 1.0;
    bool _1071 = _847 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1073 = isnan(_847);
    bool _1075 = _1071 || _1073;
    bool _1077 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1079 = _1075 || _1077;
    float _1081 = float(_1079);
    float _1083 = _1061 + _1063;
    float _1085 = _1035 + _1065;
    float _1087 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1089 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1091 = _1083 + _1089;
    float _1093 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1095 = _1085 + _1093;
    float _1097 = _907 * _1069;
    float _1099 = _1091 * _1091;
    float _1101 = _1095 * _1095;
    float _1103 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1105 = -_1081;
    float _1107 = _1105 + 1.0;
    float _1109 = _1087 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1111 = _1101 + _1099;
    float _1113 = _1027 * _1097;
    float _1115 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1117 = _1103 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1119 = sqrt(_1111);
    float _1121 = _913 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1123 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1125 = _847 + _1123;
    float _1127 = _1025 * _917;
    float _1129 = _915 * _1041;
    float _1131 = _881 * _1107;
    out.m_80.x = _1117;
    out.m_80.y = _1109;
    out.m_80.z = _1121;
    out.m_80.w = _1115;
    float _1133 = fma(_1029, _1037, _1127);
    float _1135 = fma(_1023, _1125, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1137 = -_1129;
    float _1139 = fma(_919, _1039, _1137);
    float _1141 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1143 = -_907;
    float _1145 = _1143 + 1.0;
    float _1147 = fma(_1031, _1139, _1133);
    float _1149 = fma(_1145, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1113);
    bool _1151 = _1119 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1153 = _893 + _1147;
    float _1155 = fma(_1135, _1131, _1149);
    float _1157 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1159 = -_1001;
    int _1161 = _911 ? as_type<int>(_1159) : as_type<int>(_1001);
    float _1163 = _1001 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _1165 = !_979;
    float _1167 = _1165 ? _1001 : as_type<float>(_1161);
    float _1169 = -_1009;
    int _1171 = _909 ? as_type<int>(_1169) : as_type<int>(_1009);
    float _1173 = _1101;
    float _1175 = _1099;
    float _1177 = _1085;
    float _1179 = _1083;
    float _1181 = _1059;
    float _1183 = _1039;
    float _1185 = _1035;
    if (!_1151)
    {
        _479 = _1153;
    }
    float _1187 = _479;
    bool _1189 = !_1151;
    float _1191 = _1187;
    if (!_1189)
    {
        float _1193 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1195 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1197 = _1119 + _1195;
        float _1199 = rsqrt(_1111);
        float _1201 = _1197 * _1193;
        float _1203 = _1153 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1205 = _1201 * 0.15915493667125701904296875;
        float _1207 = _1205 * 6.283185482025146484375;
        float _1209 = sin(_1207);
        float _1211 = _1205 * 6.283185482025146484375;
        float _1213 = cos(_1211);
        float _1215 = fma(_1209, _1203, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1217 = _1199 * _1215;
        float _1219 = fma(_1095, _1217, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1221 = _1213 + (-1.0);
        float _1223 = fma(_1091, _1217, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1225 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1227 = _1219 + _1225;
        float _1229 = _1221 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1231 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1233 = _1223 + _1231;
        float _1235 = _1227 * _1227;
        float _1237 = fma(_1153, _1213, _1229);
        float _1239 = _1233 * _1233;
        _1191 = _1237;
        _1173 = _1235;
        _1175 = _1239;
        _1177 = _1219;
        _1179 = _1223;
    }
    float _1241 = _1191;
    float _1243 = _1173;
    float _1245 = _1175;
    float _1247 = _1177;
    float _1249 = _1179;
    float _1251 = fma(_1163, _1163, 1.0);
    float _1253 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1255 = _1241 + _1253;
    bool _1257 = !_973;
    float _1259 = _1257 ? _1009 : as_type<float>(_1171);
    float _1261 = -_1167;
    float _1263 = _1261 + 0.5;
    float _1265 = fma(_1081, (*spvDescriptorSet0.vp_c9)._m0[117].x, _1155);
    float _1267 = fma(_1255, _1255, _1243);
    float _1269 = rsqrt(_1251);
    float _1271 = _1009 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1273 = _919 * _1163;
    float _1275 = _917 * _1163;
    float _1277 = _915 * _1163;
    float _1279 = _1259 + 0.5;
    float _1281 = _1263 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1283 = fma(_1041, _1271, _1273);
    float _1285 = fma(_1037, _1271, _1275);
    float _1287 = fma(_1039, _1271, _1277);
    float _1289 = _1279 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1291 = _1281 * _1157;
    float _1293 = _1267 + _1245;
    float _1295 = _1289 * _1141;
    float _1297 = _1163 * _1269;
    float _1299 = sqrt(_1293);
    float _1301 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1303 = -_1297;
    float _1305 = _1059 * _1303;
    float _1307 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1309 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1311 = _1059 + _1283;
    float _1313 = fma(_919, _1269, _1305);
    float _1315 = _1139 + _1285;
    float _1317 = -_1297;
    float _1319 = _1139 * _1317;
    float _1321 = -_1297;
    float _1323 = _1055 * _1321;
    float _1325 = _1301 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1327 = _1309 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1329 = _1307 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1331 = _1265 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1333 = fma(_917, _1269, _1319);
    float _1335 = fma(_915, _1269, _1323);
    float _1337 = _1055 + _1287;
    out.m_82.x = _1295;
    out.m_82.y = _1291;
    bool _1339 = _1299 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1341 = isnan(_1299);
    bool _1343 = _1339 || _1341;
    bool _1345 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1347 = _1343 || _1345;
    out.m_84.x = _1325;
    out.m_84.y = _1327;
    out.m_84.z = _1329;
    out.m_84.w = _1331;
    out.m_86.x = _1041;
    out.m_86.y = _1037;
    out.m_86.z = _1039;
    out.m_88.x = _1313;
    out.m_88.y = _1333;
    out.m_88.z = _1335;
    if (!_1347)
    {
        _1181 = 1.0;
    }
    float _1349 = _1181;
    out.m_90.x = _1311;
    out.m_90.y = _1315;
    out.m_90.z = _1337;
    bool _1351 = !_1347;
    float _1353 = _1349;
    if (!_1351)
    {
        bool _1355 = _1299 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1357 = isnan(_1299);
        bool _1359 = _1355 || _1357;
        bool _1361 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1363 = _1359 || _1361;
        if (!_1363)
        {
            float _1365 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1367 = _1299 + _1365;
            float _1369 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1371 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1369;
            float _1373 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1375 = _1373 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1377 = 1.0 / _1371;
            float _1379 = _1367 * _1377;
            float _1381 = fma(_1379, _1375, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1353 = _1381;
            _1383 = true;
        }
        else
        {
            bool _1385 = _1299 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1387 = isnan(_1299);
            bool _1389 = _1385 || _1387;
            bool _1391 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1393 = _1389 || _1391;
            if (!_1393)
            {
                float _1395 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1397 = _1299 + _1395;
                float _1399 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1401 = _1399 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1403 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1405 = _1403 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1407 = 1.0 / _1401;
                float _1409 = _1397 * _1407;
                float _1411 = fma(_1409, _1405, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1353 = _1411;
                _1383 = true;
            }
            else
            {
                _1353 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1383 = false;
    float _1413 = _1353;
    float _1415 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1417 = _1247 + _1415;
    float _1419 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1421 = _1241 + _1419;
    float _1423 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1425 = _1249 + _1423;
    bool _1427 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1429 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1431 = _1427 || _1429;
    bool _1433 = isnan(0.5);
    bool _1435 = _1431 || _1433;
    float _1437 = fma(_1417, _1413, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1439 = fma(_1421, _1413, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1441 = fma(_1425, _1413, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1443 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    float _1445 = _1417;
    if (_1435)
    {
        _1443 = _1437;
    }
    float _1447 = _1443;
    float _1449 = _1447;
    if (_1435)
    {
        _1445 = _1439;
    }
    float _1451 = _1445;
    float _1453 = _1451;
    if (_1435)
    {
        _1183 = _1441;
    }
    float _1455 = _1183;
    float _1457 = _1455;
    if (!_1435)
    {
        float _1459 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1461 = _893 + _1459;
        float _1463 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1465 = _1035 + _1463;
        float _1467 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1469 = _1461 * _1461;
        float _1471 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1473 = _1061 + _1471;
        float _1475 = fma(_1465, _1465, _1469);
        float _1477 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1479 = fma(_1473, _1473, _1475);
        float _1481 = sqrt(_1479);
        float _1483 = _1467 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1485 = precise::min(_1481, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1487 = _1485 * _1477;
        float _1489 = -_1035;
        float _1491 = _1489 + _1437;
        float _1493 = _1483 * _1487;
        float _1495 = -_893;
        float _1497 = _1495 + _1439;
        float _1499 = -_1061;
        float _1501 = _1499 + _1441;
        float _1503 = fma(_1491, _1493, _1035);
        float _1505 = fma(_1497, _1493, _893);
        float _1507 = fma(_1501, _1493, _1061);
        _1453 = _1505;
        _1449 = _1503;
        _1457 = _1507;
    }
    float _1509 = _1453;
    float _1511 = _1449;
    float _1513 = _1457;
    float _1515 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1517 = _1509 + _1515;
    float _1519 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1521 = _1511 + _1519;
    float _1523 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1525 = _1513 + _1523;
    float _1527 = _893 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1529 = _1517 * _1517;
    float _1531 = fma(_1035, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1527);
    float _1533 = fma(_1521, _1521, _1529);
    float _1535 = fma(_1061, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1531);
    float _1537 = fma(_1525, _1525, _1533);
    float _1539 = _1535 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1541 = rsqrt(_1537);
    float _1543 = fma(_1061, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1545 = 1.0 / _1539;
    float _1547 = _1521 * _1541;
    float _1549 = _1525 * _1541;
    float _1551 = _893 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1553 = _1517 * _1541;
    float _1555 = _1547 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1557 = _1549 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1559 = fma(_1035, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1551);
    float _1561 = sqrt(_1537);
    float _1563 = _1555 * _1555;
    float _1565 = _1557 * _1557;
    float _1567 = fma(_1061, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1559);
    float _1569 = _1563 + _1565;
    float _1571 = _1567 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1573 = floor(_1543);
    float _1575 = _1571 + _1539;
    float _1577 = _1575 * _1545;
    float _1579 = _1577 * 0.5;
    float _1581 = sqrt(_1569);
    float _1583 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1585 = fma(_1579, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1583);
    float _1587 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _1589 = -_1573;
    float _1591 = _1543 + _1589;
    float _1593 = 1.0 / _1585;
    float _1595 = _893 + _1587;
    float _1597 = fma(_1035, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1599 = _1595 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1601 = _1595 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    bool _1603 = _1581 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1605 = floor(_1597);
    float _1607 = fma(_1035, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1599);
    float _1609 = fma(_1035, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1601);
    float _1611 = fma(_1061, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1607);
    float _1613 = fma(_1061, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1609);
    float _1615 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1617 = _1593 * _1615;
    float _1619 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1621 = _1581 + _1619;
    float _1623 = _1611 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1625 = _1613 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _1627 = _1587;
    int _1629 = 2;
    float _1631 = _1621;
    float _1633 = _1557;
    float _1635 = _1563;
    float _1637 = _1625;
    float _1639 = _1553;
    float _1641 = _1617;
    if (_1603)
    {
        float _1643 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1627 = _1643;
    }
    float _1645 = _1627;
    bool _1647 = _1617 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    bool _1649 = _1617 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _1651 = -_1605;
    float _1653 = _1597 + _1651;
    float _1655 = trunc(_1623);
    int _1657 = int(_1655);
    float _1659 = _1605;
    if (!_1647)
    {
        _1629 = 1;
    }
    int _1661 = _1629;
    int _1663 = _1661;
    if (_1603)
    {
        float _1665 = _1621 * _1645;
        _1631 = _1665;
    }
    float _1667 = _1631;
    float _1669 = trunc(_1625);
    int _1671 = int(_1669);
    float _1673 = 0.0;
    if (_1603)
    {
        float _1675 = _1667 * 0.15915493667125701904296875;
        _1673 = _1675;
    }
    float _1677 = _1673;
    bool _1679 = !_1647;
    int _1681 = _1679 ? 0 : 1;
    float _1683 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    int _1685 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1687 = _1657 + _1685;
    int _1689 = _1687 + 1;
    float _1691 = _1611;
    if (_1603)
    {
        float _1693 = _1677 * 6.283185482025146484375;
        float _1695 = sin(_1693);
        _1691 = _1695;
    }
    float _1697 = _1691;
    if (!_1649)
    {
        _1663 = _1681;
    }
    int _1699 = _1663;
    float _1701 = precise::max(0.0, _1683);
    int _1703 = _1699 << 6;
    bool _1705 = _1689 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _1707 = -_1553;
    float _1709 = -_1701;
    float _1711 = fma(_1707, (*spvDescriptorSet0.vp_c15)._m0[24].y, _1709);
    int _1713 = _1703 + 96;
    uint _1716 = uint(int(uint(_1713) >> uint(2)));
    uint _1718 = uint(int(uint(int(_1716)) >> uint(2)));
    int _1720 = int(_1716) & 3;
    float _1722 = (*spvDescriptorSet0.vp_c15)._m0[int(_1718)][_1720];
    int _1724 = int(_1716) + 1;
    uint _1726 = uint(int(uint(_1724) >> uint(2)));
    int _1728 = _1724 & 3;
    float _1730 = (*spvDescriptorSet0.vp_c15)._m0[int(_1726)][_1728];
    float _1732 = _1569;
    float _1734 = _1701;
    float _1736 = _1711;
    if (_1603)
    {
        float _1738 = rsqrt(_1569);
        _1732 = _1738;
    }
    float _1740 = _1732;
    int _1742 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1744 = _1671 + _1742;
    int _1746 = _1744 + 1;
    if (_1603)
    {
        float _1748 = _1711 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1734 = _1748;
    }
    float _1750 = _1734;
    int _1752 = _1689 | _1746;
    if (_1603)
    {
        float _1754 = fma(_1697, _1750, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1659 = _1754;
    }
    float _1756 = _1659;
    int _1758 = _1703 + 48;
    uint _1760 = uint(int(uint(_1758) >> uint(2)));
    uint _1762 = uint(int(uint(int(_1760)) >> uint(2)));
    int _1764 = int(_1760) & 3;
    float _1766 = (*spvDescriptorSet0.vp_c15)._m0[int(_1762)][_1764];
    int _1768 = int(_1760) + 1;
    uint _1770 = uint(int(uint(_1768) >> uint(2)));
    int _1772 = _1768 & 3;
    float _1774 = (*spvDescriptorSet0.vp_c15)._m0[int(_1770)][_1772];
    float _1776 = _1677;
    if (_1603)
    {
        float _1778 = _1677 * 6.283185482025146484375;
        float _1780 = cos(_1778);
        _1776 = _1780;
    }
    float _1782 = _1776;
    bool _1784 = _1752 < 0;
    bool _1786 = _1784 || _1705;
    float _1788 = _1509 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    bool _1790 = _1746 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1792 = _1790 || _1786;
    float _1794 = fma(_1511, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1788);
    int _1796 = _1703 + 104;
    uint _1798 = uint(int(uint(_1796) >> uint(2)));
    uint _1800 = uint(int(uint(int(_1798)) >> uint(2)));
    int _1802 = int(_1798) & 3;
    float _1804 = (*spvDescriptorSet0.vp_c15)._m0[int(_1800)][_1802];
    int _1806 = int(_1798) + 1;
    uint _1808 = uint(int(uint(_1806) >> uint(2)));
    int _1810 = _1806 & 3;
    float _1812 = (*spvDescriptorSet0.vp_c15)._m0[int(_1808)][_1810];
    float _1814 = 0.0;
    float _1816 = _1740;
    if (_1603)
    {
        float _1818 = _1740 * _1756;
        _1814 = _1818;
    }
    float _1820 = _1814;
    float _1822 = fma(_1513, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1794);
    float _1824 = _1820;
    if (_1603)
    {
        float _1826 = _1557 * _1820;
        _1633 = _1826;
    }
    float _1828 = _1633;
    int _1830 = _1703 + 64;
    uint _1832 = uint(int(uint(_1830) >> uint(2)));
    uint _1834 = uint(int(uint(int(_1832)) >> uint(2)));
    int _1836 = int(_1832) & 3;
    float _1838 = (*spvDescriptorSet0.vp_c15)._m0[int(_1834)][_1836];
    int _1840 = int(_1832) + 1;
    uint _1842 = uint(int(uint(_1840) >> uint(2)));
    int _1844 = _1840 & 3;
    float _1846 = (*spvDescriptorSet0.vp_c15)._m0[int(_1842)][_1844];
    if (_1603)
    {
        float _1848 = _1782 + (-1.0);
        _1816 = _1848;
    }
    float _1850 = _1816;
    float _1852 = 0.0;
    float _1854 = _1850;
    if (!_1792)
    {
        float _1856 = floor(_1625);
        _1852 = _1856;
    }
    float _1858 = _1852;
    float _1860 = 0.0;
    if (_1603)
    {
        float _1862 = _1850 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1860 = _1862;
    }
    float _1864 = _1860;
    if (!_1603)
    {
        _1854 = _1555;
    }
    float _1866 = _1854;
    float _1868 = _1866;
    if (_1603)
    {
        float _1870 = _1555 * _1820;
        _1868 = _1870;
    }
    float _1872 = _1868;
    int _1874 = _1703 + 80;
    uint _1876 = uint(int(uint(_1874) >> uint(2)));
    uint _1878 = uint(int(uint(int(_1876)) >> uint(2)));
    int _1880 = int(_1876) & 3;
    float _1882 = (*spvDescriptorSet0.vp_c15)._m0[int(_1878)][_1880];
    int _1884 = int(_1876) + 1;
    uint _1886 = uint(int(uint(_1884) >> uint(2)));
    int _1888 = _1884 & 3;
    float _1890 = (*spvDescriptorSet0.vp_c15)._m0[int(_1886)][_1888];
    if (_1603)
    {
        float _1892 = fma(_1711, _1782, _1864);
        _1736 = _1892;
    }
    float _1894 = _1736;
    float _1896 = _1822 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    if (_1603)
    {
        float _1898 = _1872 * _1872;
        _1635 = _1898;
    }
    float _1900 = _1635;
    if (!_1603)
    {
        _1824 = _1565;
    }
    float _1902 = _1824;
    float _1904 = _1902;
    if (_1603)
    {
        float _1906 = _1828 * _1828;
        _1904 = _1906;
    }
    float _1908 = _1904;
    float _1910 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1912 = fma(_1894, _1894, _1900);
    int _1914 = _1703 + 56;
    uint _1916 = uint(int(uint(_1914) >> uint(2)));
    uint _1918 = uint(int(uint(int(_1916)) >> uint(2)));
    int _1920 = int(_1916) & 3;
    float _1922 = (*spvDescriptorSet0.vp_c15)._m0[int(_1918)][_1920];
    int _1924 = int(_1916) + 1;
    uint _1926 = uint(int(uint(_1924) >> uint(2)));
    int _1928 = _1924 & 3;
    float _1930 = (*spvDescriptorSet0.vp_c15)._m0[int(_1926)][_1928];
    float _1932 = _1896 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float2 _5892 = float2(_1653, _1591);
    float _1934 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5892, float2(0.0), isnan(_5892)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5892, float2(0.0), isnan(_5892)), level(0.0)).x;
    int _1936 = as_type<int>(_1932);
    if (!_1792)
    {
        float _1938 = -_1858;
        float _1940 = _1625 + _1938;
        _1637 = _1940;
    }
    float _1942 = _1637;
    float _1944 = -_1932;
    float _1946 = fma(_1944, _1910, 1.0);
    if (!_1792)
    {
        int _1948 = _1746 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1950 = _1948 + _1689;
        _1936 = _1950;
    }
    int _1952 = _1936;
    int _1954 = _1703 + 72;
    uint _1956 = uint(int(uint(_1954) >> uint(2)));
    uint _1958 = uint(int(uint(int(_1956)) >> uint(2)));
    int _1960 = int(_1956) & 3;
    float _1962 = (*spvDescriptorSet0.vp_c15)._m0[int(_1958)][_1960];
    int _1964 = int(_1956) + 1;
    uint _1966 = uint(int(uint(_1964) >> uint(2)));
    int _1968 = _1964 & 3;
    float _1970 = (*spvDescriptorSet0.vp_c15)._m0[int(_1966)][_1968];
    float _1972 = _1595 * _1730;
    float _1974 = fma(_1035, _1722, _1972);
    int _1976 = _1703 + 88;
    uint _1978 = uint(int(uint(_1976) >> uint(2)));
    uint _1980 = uint(int(uint(int(_1978)) >> uint(2)));
    int _1982 = int(_1978) & 3;
    float _1984 = (*spvDescriptorSet0.vp_c15)._m0[int(_1980)][_1982];
    int _1986 = int(_1978) + 1;
    uint _1988 = uint(int(uint(_1986) >> uint(2)));
    int _1990 = _1986 & 3;
    float _1992 = (*spvDescriptorSet0.vp_c15)._m0[int(_1988)][_1990];
    float _1994 = _1595 * _1774;
    int _1996 = as_type<int>(_1774);
    if (!_1792)
    {
        int _1998 = _1952 << 2;
        _1996 = _1998;
    }
    int _2000 = _1996;
    float _2002 = fma(_1035, _1766, _1994);
    int _2004 = _2000;
    if (!_1792)
    {
        int _2006 = 12 & _2000;
        _2004 = _2006;
    }
    int _2008 = _2004;
    float _2010 = _1912 + _1908;
    float _2012 = fma(_1061, _1804, _1974);
    float _2014 = _2012 + _1812;
    float _2016 = rsqrt(_2010);
    float _2018 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2020 = fma(_1561, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2018);
    float _2022 = precise::clamp(_2020, 0.0, 1.0);
    float _2024 = _1595 * _1846;
    int _2026 = as_type<int>((*spvDescriptorSet0.vp_c15)._m0[23].w);
    if (!_1792)
    {
        uint _2028 = uint(int(uint(_1952) >> uint(2)));
        _2026 = int(_2028);
    }
    int _2030 = _2026;
    float _2032 = -_2022;
    float _2034 = _2032 + 1.0;
    float _2036 = fma(_1035, _1838, _2024);
    float _2038 = as_type<float>(_2030);
    if (!_1792)
    {
        int _2040 = _2030 << 4;
        int _2042 = _2040 + _2008;
        _2038 = as_type<float>(_2042);
    }
    float _2044 = _2038;
    float _2046 = 1.0 / _2014;
    float _2048 = _1509 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2050 = _1595 * _1890;
    float _2052 = fma(_1511, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2048);
    float _2054 = fma(_1035, _1882, _2050);
    float _2056 = _2044;
    if (!_1792)
    {
        int _2058 = as_type<int>(_2044) + 400;
        uint _2060 = uint(int(uint(_2058) >> uint(2)));
        uint _2062 = uint(int(uint(int(_2060)) >> uint(2)));
        int _2064 = int(_2060) & 3;
        float _2066 = (*spvDescriptorSet0.vp_c15)._m0[int(_2062)][_2064];
        _2056 = _2066;
    }
    float _2068 = _2056;
    float _2070 = _2016 * _1872;
    float _2072 = abs(_2034);
    float _2074 = log2(_2072);
    float _2076 = fma(_1061, _1922, _2002);
    float _2078 = _2016 * _1894;
    float _2080 = _2070 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2082 = _2016 * _1828;
    float _2084 = _2076 + _1930;
    float _2086 = _1509 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2088 = -_2080;
    float _2090 = fma(_2078, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2088);
    float _2092 = fma(_1513, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2052);
    float _2094 = fma(_1061, _1962, _2036);
    float _2096 = fma(_1511, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2086);
    float _2098 = -_2082;
    float _2100 = fma(_2098, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2090);
    float _2102 = log2(_1946);
    float _2104 = fma(_2100, -0.5, 0.5);
    float _2106 = _2074 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2108 = fma(_1061, _1984, _2054);
    float _2110 = _2094 + _1970;
    float _2112 = _1509 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2114 = fma(_1513, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2096);
    float _2116 = _2084 * _2046;
    float _2118 = exp2(_2106);
    float _2120 = fma(_1511, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2112);
    float _2122 = _2114 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2124 = _2092 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    bool _2126 = _2116 >= 0.0;
    float _2128 = fma(_1513, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2120);
    float _2130 = _2122 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2132 = fma(_2100, 0.5, 0.5);
    bool _2134 = _2116 <= 1.0;
    bool _2136 = _2134 && _2126;
    float _2138 = _2128 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2140 = sqrt(_2104);
    float _2142 = _2102 * 0.693147182464599609375;
    float _2144 = fma(_2138, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2130);
    float _2146 = _2110 * _2046;
    float _2148 = fma(_2132, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2150 = _2108 + _1992;
    float _2152 = fma(_1896, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2144);
    float _2154 = _2078 + 1.0;
    bool _2156 = _2146 >= 0.0;
    bool _2158 = _2156 && _2136;
    float _2160 = fma(_2132, _2148, -0.212114393711090087890625);
    float _2162 = fma(_2124, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2152);
    float _2164 = _2122 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    bool _2166 = _2146 <= 1.0;
    bool _2168 = _2166 && _2158;
    float _2170 = fma(_2132, _2160, 1.570728778839111328125);
    float _2172 = _2100;
    float _2174 = _2164;
    float _2176 = _2162;
    if (!_1792)
    {
        float _2178 = floor(_1623);
        _2172 = _2178;
    }
    float _2180 = _2172;
    float _2182 = fma(_2138, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2164);
    float _2184 = _2122 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2186 = -_2078;
    float _2188 = fma(_2118, _2154, _2186);
    float _2190 = _2140 * 0.636619746685028076171875;
    float _2192 = fma(_1896, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2182);
    float _2194 = fma(_2138, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2184);
    float _2196 = _2150 * _2046;
    float _2198 = 1.0 / _2162;
    float _2200 = -_2170;
    float _2202 = fma(_2190, _2200, 1.0);
    float _2204 = fma(_1896, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2194);
    float _2206 = _2182;
    if (_2168)
    {
        float _2208 = float(_1699);
        _2174 = _2208;
    }
    float _2210 = _2174;
    float _2212 = fma(_2124, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2192);
    float _2214 = _2142 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2216 = fma(_2124, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2204);
    float _2218 = fma(_2188, 0.5, 0.5);
    float _2220 = _2216;
    if (!_1792)
    {
        float _2222 = -_2180;
        float _2224 = _1623 + _2222;
        _2206 = _2224;
    }
    float _2226 = _2206;
    float _2228 = _2210;
    if (_2168)
    {
        float _2230 = rint(_2210);
        float _2232 = precise::max(_2230, 0.0);
        uint _2234 = uint(_2232);
        uint _2236 = clamp(_2234, 0u, 65535u);
        _2228 = as_type<float>(_2236);
    }
    float _2238 = _2228;
    float _2240 = _2216 * _2198;
    float _2242 = _2212 * _2198;
    float _2244 = _2142;
    if (!_1792)
    {
        float _2246 = rint(_2068);
        float _2248 = precise::max(_2246, 0.0);
        uint _2250 = uint(_2248);
        uint _2252 = clamp(_2250, 0u, 65535u);
        _2244 = as_type<float>(_2252);
    }
    float _2254 = _2244;
    float _2256 = fma(_2240, 0.5, 0.5);
    float _2258 = fma(_2242, -0.5, 0.5);
    float _2260 = _2146;
    if (_2168)
    {
        float3 _6447 = float3(_2116, _2146, float(as_type<int>(_2238)));
        float3 _6451 = select(_6447, float3(0.0), isnan(_6447));
        float _2262 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _6451.xy, uint(rint(_6451.z)), _2196, level(0.0));
        _2260 = _2262;
    }
    float _2264 = _2260;
    float3 _6461 = float3(_2256, _2258, _2214);
    float _2266 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6461, float3(0.0), isnan(_6461)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6461, float3(0.0), isnan(_6461)), level(0.0)).x;
    float3 _6470 = float3(_2256, _2258, _2214);
    float4 _2269 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6470, float3(0.0), isnan(_6470)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6470, float3(0.0), isnan(_6470)), level(0.0)).xyzw;
    float _2271 = _2269.x;
    float _2273 = _2269.y;
    float _2275 = _2269.z;
    float _2277 = _2269.w;
    float2 _6486 = float2(_2202, _2218);
    float3 _2281 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6486, float2(0.0), isnan(_6486)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6486, float2(0.0), isnan(_6486)), level(0.0)).xyz;
    float _2283 = _2281.x;
    float _2285 = _2281.y;
    float _2287 = _2281.z;
    float _2289 = _1942;
    if (!_1792)
    {
        float3 _6507 = float3(_2226, _1942, float(as_type<int>(_2254)));
        float3 _6509 = select(_6507, float3(0.0), isnan(_6507));
        float _2291 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _6509.xy, uint(rint(_6509.z)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _6509.xy, uint(rint(_6509.z)), level(0.0)).x;
        _2289 = _2291;
    }
    float _2293 = _2289;
    float _2295 = abs(_1617);
    float _2297 = log2(_2295);
    float _2299 = _2122 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2301 = _2074 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2303 = fma(_2138, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2299);
    bool _2305 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2307 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2309 = _2305 || _2307;
    bool _2311 = isnan(0.5);
    bool _2313 = _2309 || _2311;
    float _2315 = fma(_1896, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2303);
    float _2317 = _1315 * _1553;
    float _2319 = -(*spvDescriptorSet0.vp_c9)._m0[139].z;
    float _2321 = (*spvDescriptorSet0.vp_c9)._m0[139].w + _2319;
    float _2323 = fma(_2124, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2315);
    float _2325 = fma(_1311, _1547, _2317);
    float _2327 = _2297 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2329 = 1.0 / _2321;
    float _2331 = _2162 * 0.5;
    if (!_2313)
    {
        _1639 = (*spvDescriptorSet0.vp_c9)._m0[140].y;
    }
    float _2333 = _1639;
    float _2335 = fma(_1337, _1549, _2325);
    float _2337 = fma(_2212, -0.5, _2331);
    float _2339 = _2333;
    if (!_2313)
    {
        float _2341 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2343 = _2333 + _2341;
        _2339 = _2343;
    }
    float _2345 = _2339;
    float _2347 = exp2(_2327);
    float _2349 = _2216 + _2162;
    float _2351 = abs(_2335);
    float _2353 = -(*spvDescriptorSet0.vp_c9)._m0[139].z;
    float _2355 = _2351 + _2353;
    out.gl_Position.x = _2216;
    out.gl_Position.y = _2212;
    out.gl_Position.z = _2323;
    out.gl_Position.w = _2162;
    float _2357 = _2349 * 0.5;
    float _2359 = exp2(_2301);
    float _2361 = _2355 * _2329;
    float _2363 = precise::clamp(_2361, 0.0, 1.0);
    float _2365 = fma(_2347, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2367 = precise::clamp(_2365, 0.0, 1.0);
    float _2369 = _2345;
    float _2371 = _2357;
    if (!_2313)
    {
        float _2373 = 1.0 / _2345;
        _2369 = _2373;
    }
    float _2375 = _2369;
    float _2377 = _2363 * _2363;
    if (_2313)
    {
        _2220 = 1.0;
    }
    float _2379 = _2220;
    float _2381 = fma(_2367, -2.0, 3.0);
    float _2383 = _2323 + _2162;
    float _2385 = _2367 * _2367;
    float _2387 = fma(_2363, -2.0, 3.0);
    float _2389 = -_2359;
    float _2391 = _2389 + 1.0;
    float _2393 = _2383 * 0.5;
    float _2395 = _2385 * _2381;
    float _2397 = _2377 * _2387;
    float _2399 = _2379;
    float _2401 = _2397;
    if (!_2168)
    {
        _2176 = 1.0;
    }
    float _2403 = _2176;
    out.m_92.x = _2357;
    out.m_92.y = _2337;
    out.m_92.z = _2393;
    out.m_92.w = _2162;
    float _2405 = -_2395;
    float _2407 = _2405 + 1.0;
    float _2409 = fma(_2407, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2395);
    bool _2411 = _1617 <= 8000.0;
    bool _2413 = isnan(_1617);
    bool _2415 = _2411 || _2413;
    bool _2417 = isnan(8000.0);
    bool _2419 = _2415 || _2417;
    float _2421 = float(_2419);
    float _2423 = _2403;
    if (!_2313)
    {
        float _2425 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2427 = _1617 + _2425;
        _1641 = _2427;
    }
    float _2429 = _1641;
    float _2431 = _2421 * _2409;
    if (!_2313)
    {
        float _2433 = _2429 * _2375;
        float _2435 = precise::clamp(_2433, 0.0, 1.0);
        _2399 = _2435;
    }
    float _2437 = _2399;
    float _2439 = _2431 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2441 = -_1934;
    float _2443 = _2441 + 1.0;
    float _2445 = _2439;
    if (_2168)
    {
        bool _2447 = _2264 >= _2196;
        bool _2449 = isnan(_2264);
        bool _2451 = _2447 || _2449;
        bool _2453 = isnan(_2196);
        bool _2455 = _2451 || _2453;
        float _2457 = float(_2455);
        _2423 = _2457;
    }
    float _2459 = _2423;
    float _2461 = _2443 * _2439;
    float _2463 = precise::clamp(_2461, 0.0, 1.0);
    float _2465 = _2391 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    if (_1792)
    {
        _2445 = 1.0;
    }
    float _2467 = _2445;
    float _2469 = _2467;
    if (!_1792)
    {
        int _2471 = _1952 << 4;
        int _2473 = _2471 + 2048;
        uint _2475 = uint(int(uint(_2473) >> uint(2)));
        uint _2477 = uint(int(uint(int(_2475)) >> uint(2)));
        int _2479 = int(_2475) & 3;
        float _2481 = (*spvDescriptorSet0.vp_c15)._m0[int(_2477)][_2479];
        int _2483 = int(_2475) + 1;
        uint _2485 = uint(int(uint(_2483) >> uint(2)));
        int _2487 = _2483 & 3;
        float _2489 = (*spvDescriptorSet0.vp_c15)._m0[int(_2485)][_2487];
        int _2491 = _2473 + 8;
        uint _2493 = uint(int(uint(_2491) >> uint(2)));
        uint _2495 = uint(int(uint(int(_2493)) >> uint(2)));
        int _2497 = int(_2493) & 3;
        float _2499 = (*spvDescriptorSet0.vp_c15)._m0[int(_2495)][_2497];
        int _2501 = int(_2493) + 1;
        uint _2503 = uint(int(uint(_2501) >> uint(2)));
        int _2505 = _2501 & 3;
        float _2507 = (*spvDescriptorSet0.vp_c15)._m0[int(_2503)][_2505];
        float _2509 = _1595 * _2489;
        float _2511 = fma(_1035, _2481, _2509);
        float _2513 = fma(_1061, _2499, _2511);
        float _2515 = _2513 + _2507;
        float _2517 = precise::clamp(_2515, 0.0, 1.0);
        float _2519 = -_2517;
        float _2521 = _2519 + _2293;
        float _2523 = fma(_2521, 500.0, 1.5);
        float _2525 = exp2(_2523);
        float _2527 = 0.0 + _2525;
        float _2529 = precise::clamp(_2527, 0.0, 1.0);
        _2469 = _2529;
        _2371 = _2481;
    }
    float _2531 = _2469;
    float _2533 = _2371;
    float _2535 = _2459 * _2531;
    float _2537 = _2465 * _2266;
    float _2539 = -_2463;
    float _2541 = fma(_2539, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2543 = -_2465;
    float _2545 = _2543 + 1.0;
    out.m_94.x = _1511;
    out.m_94.y = _1509;
    out.m_94.z = _1513;
    float _2547 = _2277 * _2537;
    float _2549 = -_2535;
    float _2551 = fma(_2549, _2541, 1.0);
    float _2553 = precise::clamp(_2551, 0.0, 1.0);
    float _2555 = _2287 * _2537;
    float _2557 = _2277 * _2545;
    float _2559 = fma(_2283, _2547, _2271);
    float _2561 = fma(_2285, _2547, _2273);
    float _2563 = _2553 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2565 = fma(_2277, _2555, _2275);
    bool _2567 = _1561 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2569 = isnan(_1561);
    bool _2571 = _2567 || _2569;
    bool _2573 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2575 = _2571 || _2573;
    float _2577 = _2397 * _2437;
    out.m_96.x = _2563;
    float _2579 = _2577 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_98.x = _2559;
    out.m_98.y = _2561;
    out.m_98.z = _2565;
    out.m_98.w = _2557;
    float _2581 = _2533;
    float _2583 = _2545;
    float _2585 = _2553;
    float _2587 = _2547;
    if (!_2575)
    {
        _2581 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2589 = _2581;
    float _2591 = _2589;
    float _2593 = _2589;
    if (!_2575)
    {
        _2583 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2595 = _2583;
    float _2597 = _2595;
    float _2599 = _2595;
    if (!_2575)
    {
        _2585 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2601 = _2585;
    float _2603 = _2601;
    float _2605 = _2601;
    if (!_2575)
    {
        _2401 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2607 = _2401;
    float _2609 = _2607;
    float _2611 = _2607;
    if (!_2575)
    {
        _1185 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2613 = _1185;
    float _2615 = _2613;
    float _2617 = _2613;
    if (!_2575)
    {
        _2587 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2619 = _2587;
    bool _2621 = !_2575;
    float _2623 = _2619;
    float _2625 = _2619;
    if (!_2621)
    {
        bool _2627 = _1561 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2629 = isnan(_1561);
        bool _2631 = _2627 || _2629;
        bool _2633 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2635 = _2631 || _2633;
        if (!_2635)
        {
            float _2637 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2639 = _1561 + _2637;
            float _2641 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2643 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2641;
            float _2645 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2647 = _2645 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2649 = 1.0 / _2643;
            float _2651 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2653 = _2651 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2655 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2657 = _2655 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2659 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2661 = _2659 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2663 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2665 = _2663 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2667 = _2639 * _2649;
            float _2669 = precise::clamp(_2667, 0.0, 1.0);
            float _2671 = fma(_2669, _2647, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2673 = fma(_2669, _2653, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2675 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2677 = _2675 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2679 = fma(_2669, _2657, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2681 = fma(_2669, _2661, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2683 = fma(_2669, _2665, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            float _2685 = fma(_2669, _2677, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            _2599 = _2673;
            _2617 = _2681;
            _2593 = _2671;
            _2611 = _2679;
            _2605 = _2685;
            _2625 = _2683;
            _2687 = true;
        }
        else
        {
            bool _2689 = _1561 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2691 = isnan(_1561);
            bool _2693 = _2689 || _2691;
            bool _2695 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2697 = _2693 || _2695;
            if (!_2697)
            {
                _2591 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2699 = _2591;
            _2593 = _2699;
            if (!_2697)
            {
                _2597 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2701 = _2597;
            _2599 = _2701;
            if (!_2697)
            {
                _2603 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2703 = _2603;
            _2605 = _2703;
            if (!_2697)
            {
                _2609 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2705 = _2609;
            _2611 = _2705;
            if (!_2697)
            {
                _2615 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2707 = _2615;
            _2617 = _2707;
            if (!_2697)
            {
                _2623 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2709 = _2623;
            bool _2711 = !_2697;
            _2625 = _2709;
            if (!_2711)
            {
                bool _2713 = _1561 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2715 = isnan(_1561);
                bool _2717 = _2713 || _2715;
                bool _2719 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2721 = _2717 || _2719;
                if (!_2721)
                {
                    float _2723 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2725 = _1561 + _2723;
                    float _2727 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2729 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2727;
                    float _2731 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2733 = _2731 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2735 = 1.0 / _2729;
                    float _2737 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2739 = _2737 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2741 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2743 = _2741 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2745 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2747 = _2745 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2749 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2751 = _2749 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2753 = _2725 * _2735;
                    float _2755 = precise::clamp(_2753, 0.0, 1.0);
                    float _2757 = fma(_2755, _2733, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2759 = fma(_2755, _2739, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2761 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2763 = _2761 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2765 = fma(_2755, _2743, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2767 = fma(_2755, _2747, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2769 = fma(_2755, _2751, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    float _2771 = fma(_2755, _2763, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    _2599 = _2759;
                    _2617 = _2767;
                    _2593 = _2757;
                    _2611 = _2765;
                    _2605 = _2771;
                    _2625 = _2769;
                    _2687 = true;
                }
                else
                {
                    _2599 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2617 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2593 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2611 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2605 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2625 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2687 = false;
    float _2773 = _2599;
    float _2775 = _2617;
    float _2777 = _2593;
    float _2779 = _2611;
    float _2781 = _2605;
    float _2783 = _2625;
    float _2785 = fma(_1315, -0.5, 0.5);
    float _2787 = precise::clamp(_2785, 0.0, 1.0);
    float _2789 = -_2773;
    float _2791 = _2789 + _2775;
    float _2793 = _2579 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2795 = -_2777;
    float _2797 = _2795 + _2779;
    out.m_100.x = 0.0;
    float _2799 = fma(_2787, _2791, _2773);
    float _2801 = fma(_2787, _2797, _2777);
    out.m_61.x = _2793;
    float _2803 = -_2781;
    float _2805 = _2803 + _2783;
    float _2807 = _2799 * 0.586610972881317138671875;
    bool _2809 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2811 = fma(_2787, _2805, _2781);
    float _2813 = fma(_2801, 0.298911988735198974609375, _2807);
    bool _2815 = _2437 > 0.0;
    bool _2817 = isnan(_2437);
    bool _2819 = _2815 || _2817;
    bool _2821 = isnan(0.0);
    bool _2823 = _2819 || _2821;
    float _2825 = fma(_2811, 0.114477999508380889892578125, _2813);
    float _2827 = -_2825;
    float _2829 = _2801 + _2827;
    float _2831 = -_2825;
    float _2833 = _2799 + _2831;
    float _2835 = -_2825;
    float _2837 = _2811 + _2835;
    float _2839 = fma(_2829, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2825);
    float _2841 = fma(_2833, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2825);
    float _2843 = fma(_2837, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2825);
    bool _2845 = !_2809;
    if (!_2845)
    {
        float _2847 = -_1509;
        float _2849 = _2847 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2851 = -_1511;
        float _2853 = _2851 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2855 = -_1513;
        float _2857 = _2855 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2859 = _2849 * _2849;
        float _2861 = fma(_2853, _2853, _2859);
        float _2863 = fma(_2857, _2857, _2861);
        float _2865 = sqrt(_2863);
        float _2867 = rsqrt(_2863);
        float _2869 = -_2865;
        float _2871 = _2869 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2873 = _2871 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2875 = precise::clamp(_2873, 0.0, 1.0);
        float _2877 = _2853 * _2867;
        float _2879 = _2849 * _2867;
        float _2881 = abs(_2875);
        float _2883 = log2(_2881);
        float _2885 = _2857 * _2867;
        float _2887 = _2877 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2889 = _1315 * _2879;
        float _2891 = -_2879;
        float _2893 = -_2887;
        float _2895 = fma(_2891, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2893);
        float _2897 = fma(_1311, _2877, _2889);
        float _2899 = -_2885;
        float _2901 = fma(_2899, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2895);
        float _2903 = fma(_1337, _2885, _2897);
        float _2905 = precise::clamp(_2903, 0.0, 1.0);
        float _2907 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2909 = _2901 + _2907;
        float _2911 = _2883 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2913 = _2909 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2915 = precise::clamp(_2913, 0.0, 1.0);
        float _2917 = exp2(_2911);
        float _2919 = _2917 * _2915;
        float _2921 = _2905 * _2919;
        float _2923 = _2921 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2925 = _2921 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2927 = _2921 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_100.x = _2923;
        out.m_100.y = _2925;
        out.m_100.z = _2927;
    }
    out.m_102.x = _2839;
    out.m_102.y = _2841;
    out.m_102.z = _2843;
    if (_2823)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_61.x = 0.0;
    float _2929 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2929;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

