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
    constant _16* vp_c15 [[id(1)]];
    constant _16* vp_c8 [[id(2)]];
    constant _16* vp_c10 [[id(3)]];
    constant _16* vp_c9 [[id(4)]];
    constant _16* vp_c13 [[id(5)]];
    constant _16* vp_c7 [[id(6)]];
    texture2d<float> vp_t_tcb_C [[id(7)]];
    sampler vp_t_tcb_CSmplr [[id(8)]];
    texture2d<float> vp_t_tcb_24 [[id(9)]];
    sampler vp_t_tcb_24Smplr [[id(10)]];
    texture2d_array<float> vp_t_tcb_16 [[id(11)]];
    sampler vp_t_tcb_16Smplr [[id(12)]];
    texture3d<float> vp_t_tcb_32 [[id(13)]];
    sampler vp_t_tcb_32Smplr [[id(14)]];
    texture3d<float> vp_t_tcb_30 [[id(15)]];
    sampler vp_t_tcb_30Smplr [[id(16)]];
    texture2d_array<float> vp_t_tcb_14 [[id(17)]];
    sampler vp_t_tcb_14Smplr [[id(18)]];
    texture2d<float> vp_t_tcb_1C [[id(19)]];
    sampler vp_t_tcb_1CSmplr [[id(20)]];
    sampler vp_t_tcb_24Smplr_w [[id(21)]];
    sampler vp_t_tcb_32Smplr_w [[id(22)]];
    sampler vp_t_tcb_30Smplr_w [[id(23)]];
    sampler vp_t_tcb_14Smplr_w [[id(24)]];
    sampler vp_t_tcb_1CSmplr_w [[id(25)]];
    constant dm_border_t* dm_border [[id(26)]];
};

struct main0_out
{
    float4 m_71 [[user(locn0)]];
    float4 m_69 [[user(locn1)]];
    float4 m_61 [[user(locn2)]];
    float4 m_95 [[user(locn3)]];
    float4 m_83 [[user(locn4)]];
    float4 m_77 [[user(locn5)]];
    float4 m_87 [[user(locn6)]];
    float4 m_85 [[user(locn7)]];
    float4 m_79 [[user(locn8)]];
    float4 m_93 [[user(locn9)]];
    float4 m_89 [[user(locn10)]];
    float4 m_91 [[user(locn11)]];
    float4 m_97 [[user(locn12)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_75 [[attribute(1)]];
    float4 m_58 [[attribute(2)]];
    float4 m_63 [[attribute(3)]];
    float4 m_67 [[attribute(6)]];
    float4 m_65 [[attribute(7)]];
    float4 m_73 [[attribute(8)]];
    float4 m_81 [[attribute(9)]];
};

static inline __attribute__((always_inline))
int _112(thread const int& _9649, thread const int& _9650, constant _10& support_buffer)
{
    float _9653 = as_type<float>(support_buffer._m4);
    int _9655 = _9650 + as_type<int>(_9653);
    int _9657 = 1 + _9655;
    float _9659 = support_buffer._m5[_9657].x;
    float _9661 = abs(_9659);
    bool _9663 = _9661 == 1.0;
    if (_9663)
    {
        return _9649;
    }
    float _9665 = float(_9649);
    float _9667 = _9665 / _9661;
    int _9669 = int(_9667);
    return _9669;
}

static inline __attribute__((always_inline))
int _113(thread const int& _9699, thread const int& _9700, constant _10& support_buffer)
{
    float _9703 = as_type<float>(support_buffer._m4);
    int _9705 = _9700 + as_type<int>(_9703);
    int _9707 = 1 + _9705;
    float _9709 = support_buffer._m5[_9707].x;
    bool _9711 = _9709 == 1.0;
    if (_9711)
    {
        return _9699;
    }
    float _9713 = float(_9699);
    float _9715 = _9713 * _9709;
    int _9717 = int(_9715);
    return _9717;
}

static inline __attribute__((always_inline))
void _110(thread const int& _9344, thread const int& _9345, thread const int& _9346, thread const int& _9347, thread int& _9348, thread int& _9349, thread int& _9350, thread int& _9351, thread int& _9352, thread int& _9353, thread float4& gl_Position, thread float& gl_PointSize)
{
    gl_PointSize = 1.0;
    int _9356 = _9345;
    int _9358 = _9346;
    float _9360 = 0.0 + as_type<float>(_9344);
    bool _9362 = _9360 != 0.0;
    bool _9364 = isnan(_9360);
    bool _9366 = _9362 || _9364;
    bool _9368 = isnan(0.0);
    bool _9370 = _9366 || _9368;
    int _9372 = as_type<int>(_9360);
    int _9374 = _9370 ? (-1) : 0;
    if (!_9370)
    {
        float _9376 = as_type<float>(_9344) * 1.0;
        _9356 = as_type<int>(_9376);
    }
    int _9378 = _9356;
    bool _9380 = !_9370;
    int _9382 = _9378;
    int _9384 = _9378;
    if (!_9380)
    {
        bool _9386 = _9360 >= 0.0;
        bool _9388 = isnan(_9360);
        bool _9390 = _9386 || _9388;
        bool _9392 = isnan(0.0);
        bool _9394 = _9390 || _9392;
        _9374 = _9394 ? (-1) : 0;
        if (!_9394)
        {
            _9382 = 2147483647;
        }
        int _9396 = _9382;
        bool _9398 = !_9394;
        int _9400 = _9396;
        _9384 = _9396;
        if (!_9398)
        {
            float _9402 = abs(as_type<float>(_9344));
            float _9404 = 0.0 + _9402;
            bool _9406 = _9404 > as_type<float>(0x7f800000u /* inf */);
            bool _9408 = isnan(_9404);
            bool _9410 = _9406 || _9408;
            bool _9412 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _9414 = _9410 || _9412;
            _9372 = as_type<int>(_9404);
            _9374 = _9414 ? (-1) : 0;
            if (_9414)
            {
                float _9416 = as_type<float>(_9344) + 1.0;
                _9400 = as_type<int>(_9416);
            }
            int _9418 = _9400;
            int _9420 = _9418;
            _9384 = _9418;
            if (!_9414)
            {
                bool _9422 = _9404 != as_type<float>(0x7f800000u /* inf */);
                bool _9424 = isnan(_9404);
                bool _9426 = _9422 || _9424;
                bool _9428 = isnan(as_type<float>(0x7f800000u /* inf */));
                bool _9430 = _9426 || _9428;
                _9374 = _9430 ? (-1) : 0;
                if (!_9430)
                {
                    _9420 = _9344;
                }
                int _9432 = _9420;
                bool _9434 = !_9430;
                _9384 = _9432;
                if (!_9434)
                {
                    float _9436 = as_type<float>(_9344) * 18446744073709551616.0;
                    float _9438 = rsqrt(_9436);
                    float _9440 = _9436 * _9438;
                    float _9442 = _9438 * 0.5;
                    float _9444 = -_9440;
                    float _9446 = 0.0 + _9444;
                    float _9448 = fma(_9442, _9446, 0.5);
                    float _9450 = fma(_9440, _9448, _9440);
                    float _9452 = -_9450;
                    float _9454 = 0.0 + _9452;
                    float _9456 = fma(_9450, _9454, _9436);
                    float _9458 = fma(_9442, _9456, _9450);
                    float _9460 = _9458 * 2.3283064365386962890625e-10;
                    _9372 = as_type<int>(_9458);
                    _9384 = as_type<int>(_9460);
                    _9358 = as_type<int>(_9446);
                }
            }
        }
    }
    int _9462 = _9372;
    int _9464 = _9384;
    int _9466 = _9358;
    int _9468 = _9374;
    _9348 = _9347;
    _9349 = 0;
    _9350 = _9462;
    _9351 = _9464;
    _9352 = _9466;
    _9353 = _9468;
}

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3375 = false;
    bool _1685 = false;
    bool _1497 = false;
    bool _945 = false;
    bool _703 = false;
    bool _319 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _117 = in.m_58.w;
    float _119 = trunc(_117);
    int _121 = int(_119);
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
        float _3720 = as_type<float>(_137);
        out.gl_Position.z = _3720;
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
    float _157 = _155;
    if (_151)
    {
        float _159 = float(_121);
        _131 = _159;
    }
    float _161 = _131;
    bool _163 = _155 >= _161;
    bool _165 = !_151;
    bool _167 = _163 || _165;
    float _169 = _161;
    if (_167)
    {
        _169 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _171 = _169;
    if (_167)
    {
        out.m_61.x = 0.0;
    }
    if (_167)
    {
        float _173 = _171 * 5.0;
        _139 = as_type<int>(_173);
    }
    int _175 = _139;
    if (_167)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3790 = as_type<float>(_175);
        out.gl_Position.z = _3790;
    }
    if (_167)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _177 = in.m_65.w;
    float _179 = _155 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _181 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _183 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _185 = _181 || _183;
    bool _187 = isnan(1.0);
    bool _189 = _185 || _187;
    float _191 = in.m_63.x;
    float _193 = in.m_63.y;
    float _195 = in.m_63.z;
    float _197 = in.m_58.x;
    float _199 = in.m_58.y;
    float _201 = in.m_58.z;
    float _203 = 0.0;
    float _205 = _179;
    if (!_189)
    {
        float _207 = _179 * _179;
        float _209 = _207 * 0.5;
        _203 = _209;
    }
    float _211 = _203;
    float _213 = _211;
    if (!_189)
    {
        float _215 = _211 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _213 = _215;
    }
    float _217 = _213;
    bool _219 = !_189;
    float _221 = _217;
    if (!_219)
    {
        float _223 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _225 = log2(_223);
        float _227 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _229 = _227 + 1.0;
        float _231 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _233 = _179 * _225;
        float _235 = 1.0 / _229;
        float _237 = _231 * 0.693147182464599609375;
        float _239 = exp2(_233);
        float _241 = 1.0 / _237;
        float _243 = _239 + (-1.0);
        float _245 = -_243;
        float _247 = fma(_245, _241, _179);
        float _249 = _247 * _235;
        float _251 = _249 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _221 = _251;
    }
    float _253 = _221;
    bool _255 = !_189;
    if (!_255)
    {
        float _257 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _259 = log2(_257);
        float _261 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _263 = _261 + 1.0;
        float _265 = 1.0 / _263;
        float _267 = _179 * _259;
        float _269 = exp2(_267);
        float _271 = -_269;
        float _273 = _271 + 1.0;
        float _275 = _273 * _265;
        _205 = _275;
    }
    float _277 = _205;
    bool _279 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _281 = _253 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _283 = _253 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _285 = _253 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _287 = fma(_277, _191, _281);
    float _289 = fma(_277, _193, _283);
    float _291 = fma(_277, _195, _285);
    float _293 = fma(_287, _177, _197);
    float _295 = fma(_289, _177, _199);
    float _297 = fma(_291, _177, _201);
    bool _299 = !_279;
    float _317;
    if (!_299)
    {
        float _301 = in.m_67.x;
        float _303 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _305 = _301 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _307 = fma(_305, (*spvDescriptorSet0.vp_c9)._m0[12].x, _155);
        float _309 = _307 * _303;
        float _311 = floor(_309);
        float _313 = -_311;
        float _315 = _309 + _313;
        _317 = _315;
        _319 = true;
    }
    else
    {
        float _321 = float(_121);
        float _323 = 1.0 / _321;
        float _325 = _155 * _323;
        _317 = _325;
    }
    _319 = false;
    float _327 = _317;
    float _329 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _331 = _327 + _329;
    float _333 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _335 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _333;
    float _337 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _339 = _337 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _341 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _343 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _341;
    float _345 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _347 = _345 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _349 = 1.0 / _335;
    float _351 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _353 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _351;
    float _355 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _357 = _355 + (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _359 = _327 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _361 = isnan(_327);
    bool _363 = _359 || _361;
    bool _365 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _367 = _363 || _365;
    float _369 = float(_367);
    float _371 = 1.0 / _339;
    float _373 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _375 = _327 + _373;
    float _377 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _379 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _377;
    float _381 = 1.0 / _343;
    float _383 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _385 = _327 + _383;
    float _387 = _375 * _349;
    float _389 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _391 = _327 + _389;
    bool _393 = _327 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _395 = isnan(_327);
    bool _397 = _393 || _395;
    bool _399 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _401 = _397 || _399;
    float _403 = float(_401);
    float _405 = fma(_379, _387, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    bool _407 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _409 = 1.0 / _353;
    float _411 = _385 * _371;
    float _413 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _415 = _327 + _413;
    float _417 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _419 = _327 + _417;
    float _421 = -_403;
    float _423 = _421 + 1.0;
    float _425 = 1.0 / _347;
    float _427 = _391 * _381;
    bool _429 = _327 >= (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _431 = isnan(_327);
    bool _433 = _429 || _431;
    bool _435 = isnan((*spvDescriptorSet0.vp_c9)._m0[149].w);
    bool _437 = _433 || _435;
    float _439 = float(_437);
    bool _441 = _327 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _443 = isnan(_327);
    bool _445 = _441 || _443;
    bool _447 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _449 = _445 || _447;
    float _451 = float(_449);
    float _453 = 1.0 / _357;
    float _455 = _415 * _409;
    float _457 = -_439;
    float _459 = _457 + 1.0;
    float _461 = _403 * _459;
    float _463 = _331 * _425;
    float _465 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _467 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _465;
    float _469 = fma(_467, _387, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _471 = _369 * _423;
    float _473 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _475 = _473 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _477 = _419 * _453;
    float _479 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _481 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _479;
    bool _483 = _327 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _485 = isnan(_327);
    bool _487 = _483 || _485;
    bool _489 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _491 = _487 || _489;
    float _493 = float(_491);
    float _495 = fma(_475, _411, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _497 = fma(_481, _387, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _499 = _327 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _501 = isnan(_327);
    bool _503 = _499 || _501;
    bool _505 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _507 = _503 || _505;
    float _509 = float(_507);
    float _511 = -_369;
    float _513 = _511 + 1.0;
    bool _515 = _327 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _517 = isnan(_327);
    bool _519 = _515 || _517;
    bool _521 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _523 = _519 || _521;
    float _525 = float(_523);
    float _527 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _529 = _527 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _531 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _533 = _531 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _535 = _509 * _513;
    float _537 = -_509;
    float _539 = _537 + 1.0;
    float _541 = -_525;
    float _543 = _541 + 1.0;
    float _545 = fma(_529, _411, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _547 = fma(_533, _411, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _549 = _451 * _539;
    float _551 = _493 * _543;
    float _553 = -_451;
    float _555 = _553 + 1.0;
    float _557 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _559 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _557;
    float _561 = _405 * _551;
    float _563 = _469 * _551;
    float _565 = _497 * _551;
    float _567 = -_493;
    float _569 = _567 + 1.0;
    float _571 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _573 = _571 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _575 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _577 = _575 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _579 = _525 * _555;
    float _581 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _583 = _581 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _585 = fma(_569, (*spvDescriptorSet0.vp_c9)._m0[143].x, _563);
    float _587 = fma(_569, (*spvDescriptorSet0.vp_c9)._m0[143].y, _565);
    float _589 = fma(_569, (*spvDescriptorSet0.vp_c9)._m0[143].z, _561);
    float _591 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _593 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _591;
    float _595 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _597 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _595;
    float _599 = fma(_573, _463, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _601 = fma(_577, _463, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _603 = fma(_583, _463, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _605 = fma(_545, _579, _585);
    float _607 = fma(_495, _579, _587);
    float _609 = fma(_547, _579, _589);
    float _611 = fma(_593, _427, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _613 = fma(_559, _427, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _615 = fma(_597, _427, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _617 = fma(_611, _549, _605);
    float _619 = fma(_613, _549, _607);
    float _621 = fma(_615, _549, _609);
    float _623 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _625 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _623;
    float _627 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _629 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _627;
    float _631 = fma(_599, _535, _617);
    float _633 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _635 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _633;
    float _637 = fma(_601, _535, _619);
    float _639 = fma(_603, _535, _621);
    float _641 = fma(_625, _455, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _643 = fma(_629, _455, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _645 = -(*spvDescriptorSet0.vp_c9)._m0[148].x;
    float _647 = _645 + (*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _649 = fma(_635, _455, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    float _651 = -(*spvDescriptorSet0.vp_c9)._m0[148].y;
    float _653 = _651 + (*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _655 = -(*spvDescriptorSet0.vp_c9)._m0[148].z;
    float _657 = _655 + (*spvDescriptorSet0.vp_c9)._m0[149].z;
    float _659 = fma(_641, _471, _631);
    float _661 = fma(_647, _477, (*spvDescriptorSet0.vp_c9)._m0[148].x);
    float _663 = fma(_653, _477, (*spvDescriptorSet0.vp_c9)._m0[148].y);
    float _665 = fma(_657, _477, (*spvDescriptorSet0.vp_c9)._m0[148].z);
    float _667 = fma(_643, _471, _637);
    float _669 = fma(_649, _471, _639);
    float _671 = fma(_661, _461, _659);
    float _673 = fma(_663, _461, _667);
    float _675 = fma(_665, _461, _669);
    float _677 = fma(_439, (*spvDescriptorSet0.vp_c9)._m0[149].x, _671);
    float _679 = fma(_439, (*spvDescriptorSet0.vp_c9)._m0[149].y, _673);
    float _681 = fma(_439, (*spvDescriptorSet0.vp_c9)._m0[149].z, _675);
    bool _683 = !_407;
    float _701;
    if (!_683)
    {
        float _685 = in.m_67.x;
        float _687 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _689 = _685 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _691 = fma(_689, (*spvDescriptorSet0.vp_c9)._m0[11].y, _155);
        float _693 = _691 * _687;
        float _695 = floor(_693);
        float _697 = -_695;
        float _699 = _693 + _697;
        _701 = _699;
        _703 = true;
    }
    else
    {
        float _705 = float(_121);
        float _707 = 1.0 / _705;
        float _709 = _155 * _707;
        _701 = _709;
    }
    _703 = false;
    float _711 = _701;
    float _713 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _715 = _713 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _717 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _719 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _717;
    bool _721 = _711 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _723 = isnan(_711);
    bool _725 = _721 || _723;
    bool _727 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _729 = _725 || _727;
    float _731 = float(_729);
    float _733 = 1.0 / _715;
    float _735 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _737 = _735 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _739 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _741 = _739 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _743 = -_731;
    float _745 = _743 + 1.0;
    bool _747 = _711 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _749 = isnan(_711);
    bool _751 = _747 || _749;
    bool _753 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _755 = _751 || _753;
    float _757 = float(_755);
    float _759 = 1.0 / _737;
    bool _761 = _711 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _763 = isnan(_711);
    bool _765 = _761 || _763;
    bool _767 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _769 = _765 || _767;
    float _771 = float(_769);
    bool _773 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _775 = _771 * _745;
    float _777 = -_771;
    float _779 = _777 + 1.0;
    float _781 = _719 * _733;
    float _783 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _785 = _711 + _783;
    float _787 = 1.0 / _741;
    float _789 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _791 = _789 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _793 = _757 * _779;
    float _795 = fma(_781, _785, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _797 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _799 = _797 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _801 = _711 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _803 = isnan(_711);
    bool _805 = _801 || _803;
    bool _807 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _809 = _805 || _807;
    float _811 = float(_809);
    float _813 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _815 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _813;
    float _817 = _791 * _759;
    float _819 = 1.0 / _799;
    float _821 = _795 * _793;
    float _823 = -_811;
    float _825 = _823 + 1.0;
    float _827 = -_757;
    float _829 = _827 + 1.0;
    float _831 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _833 = _831 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _835 = _731 * _825;
    float _837 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _839 = _711 + _837;
    float _841 = _815 * _787;
    float _843 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _845 = _711 + _843;
    bool _847 = _711 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _849 = isnan(_711);
    bool _851 = _847 || _849;
    bool _853 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _855 = _851 || _853;
    float _857 = float(_855);
    float _859 = fma(_829, (*spvDescriptorSet0.vp_c9)._m0[115].x, _821);
    float _861 = fma(_841, _839, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _863 = fma(_817, _845, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _865 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _867 = _711 + _865;
    float _869 = -_857;
    float _871 = _869 + 1.0;
    float _873 = _833 * _819;
    float _875 = fma(_863, _775, _859);
    float _877 = _811 * _871;
    float _879 = fma(_873, _867, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _881 = fma(_861, _835, _875);
    float _883 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _885 = fma(_879, _877, _881);
    float _887 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _889 = fma(_857, (*spvDescriptorSet0.vp_c9)._m0[119].x, _885);
    float _891 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _893 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _895 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _897 = _883 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _899 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _901 = _891 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _903 = _887 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _905 = _893 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _907 = _895 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _909 = _899 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _911 = _889 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _913 = in.m_65.x;
    float _915 = in.m_65.y;
    float _917 = in.m_65.z;
    out.m_69.x = _905;
    out.m_69.y = _907;
    out.m_69.z = _909;
    out.m_71.x = _897;
    out.m_71.y = _901;
    out.m_71.z = _903;
    out.m_71.w = _911;
    float _919 = _681 * _917;
    float _921 = _679 * _915;
    float _923 = _677 * _913;
    bool _925 = !_773;
    float _943;
    if (!_925)
    {
        float _927 = in.m_67.x;
        float _929 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _931 = _927 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _933 = fma(_931, (*spvDescriptorSet0.vp_c9)._m0[14].x, _155);
        float _935 = _933 * _929;
        float _937 = floor(_935);
        float _939 = -_937;
        float _941 = _935 + _939;
        _943 = _941;
        _945 = true;
    }
    else
    {
        float _947 = float(_121);
        float _949 = 1.0 / _947;
        float _951 = _155 * _949;
        _943 = _951;
    }
    _945 = false;
    float _953 = _943;
    int _955 = int2(spvDescriptorSet0.vp_t_tcb_C.get_width(), spvDescriptorSet0.vp_t_tcb_C.get_height()).x;
    int _957 = _955;
    int _959 = 0;
    int _961 = _112(_957, _959, (*spvDescriptorSet0.support_buffer));
    float _963 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _965 = _963 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _967 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _969 = _967 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _971 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _973 = _971 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _975 = 1.0 / _965;
    float _977 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _979 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _977;
    float _981 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _983 = _981 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _985 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _987 = _985 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _989 = 1.0 / _969;
    bool _991 = _953 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _993 = isnan(_953);
    bool _995 = _991 || _993;
    bool _997 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _999 = _995 || _997;
    float _1001 = float(_999);
    float _1003 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1005 = _1003 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1007 = 1.0 / _973;
    float _1009 = _979 * _975;
    float _1011 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _1013 = _1011 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1015 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1017 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _1015;
    float _1019 = 1.0 / _983;
    bool _1021 = _953 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _1023 = isnan(_953);
    bool _1025 = _1021 || _1023;
    bool _1027 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _1029 = _1025 || _1027;
    float _1031 = float(_1029);
    float _1033 = _1017 * _989;
    bool _1035 = _953 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _1037 = isnan(_953);
    bool _1039 = _1035 || _1037;
    bool _1041 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _1043 = _1039 || _1041;
    float _1045 = float(_1043);
    float _1047 = -_1031;
    float _1049 = _1047 + 1.0;
    float _1051 = 1.0 / _987;
    float _1053 = _1013 * _1007;
    bool _1055 = _953 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _1057 = isnan(_953);
    bool _1059 = _1055 || _1057;
    bool _1061 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _1063 = _1059 || _1061;
    float _1065 = float(_1063);
    float _1067 = -_1045;
    float _1069 = _1067 + 1.0;
    float _1071 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1073 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _1071;
    float _1075 = _1045 * _1049;
    float _1077 = _1065 * _1069;
    float _1079 = -_1065;
    float _1081 = _1079 + 1.0;
    bool _1083 = _953 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _1085 = isnan(_953);
    bool _1087 = _1083 || _1085;
    bool _1089 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _1091 = _1087 || _1089;
    float _1093 = float(_1091);
    float _1095 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _1097 = _1095 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1099 = _1073 * _1019;
    bool _1101 = _953 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1103 = isnan(_953);
    bool _1105 = _1101 || _1103;
    bool _1107 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _1109 = _1105 || _1107;
    float _1111 = float(_1109);
    float _1113 = 1.0 / _1005;
    float _1115 = -_1093;
    float _1117 = _1115 + 1.0;
    float _1119 = _1093 * _1081;
    float _1121 = _1097 * _1051;
    float _1123 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1125 = _953 + _1123;
    float _1127 = _1001 * _1117;
    bool _1129 = _953 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _1131 = isnan(_953);
    bool _1133 = _1129 || _1131;
    bool _1135 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _1137 = _1133 || _1135;
    float _1139 = float(_1137);
    float _1141 = -_1111;
    float _1143 = _1141 + 1.0;
    float _1145 = -_1001;
    float _1147 = _1145 + 1.0;
    float _1149 = fma(_1009, _1125, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _1151 = _1139 * _1143;
    float _1153 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1155 = _953 + _1153;
    float _1157 = -_1139;
    float _1159 = _1157 + 1.0;
    float _1161 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1163 = _1161 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _1165 = _1149 * _1151;
    float _1167 = _1111 * _1147;
    float _1169 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1171 = _1169 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1173 = fma(_1053, _1155, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _1175 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1177 = _953 + _1175;
    float _1179 = fma(_1159, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1165);
    float _1181 = 1.0 / _1163;
    float _1183 = _1171 * _1113;
    float _1185 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1187 = _953 + _1185;
    float _1189 = fma(_1033, _1177, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _1191 = fma(_1173, _1167, _1179);
    float _1193 = in.m_67.x;
    float _1195 = in.m_67.y;
    float _1197 = fma(_1121, _1187, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _1199 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1201 = _953 + _1199;
    float _1203 = fma(_1189, _1127, _1191);
    bool _1205 = _953 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1207 = isnan(_953);
    bool _1209 = _1205 || _1207;
    bool _1211 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1213 = _1209 || _1211;
    float _1215 = float(_1213);
    float _1217 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1219 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _1217;
    float _1221 = fma(_1099, _1201, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _1223 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1225 = _953 + _1223;
    float _1227 = fma(_1197, _1119, _1203);
    float _1229 = -_1215;
    float _1231 = _1229 + 1.0;
    float _1233 = _1219 * _1181;
    float _1235 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1237 = _953 + _1235;
    float _1239 = fma(_1183, _1225, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _1241 = fma(_1221, _1077, _1227);
    float _1243 = _1031 * _1231;
    float _1245 = fma(_1233, _1237, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1247 = in.m_73.z;
    float _1249 = fma(_1239, _1075, _1241);
    float _1251 = fma(_1245, _1243, _1249);
    float _1253 = -_1193;
    float _1255 = fma(0.5, _1253, 1.0);
    float _1257 = fma(_1215, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1251);
    float _1259 = _1257 * _1255;
    float _1261 = precise::clamp(_1259, 0.0, 1.0);
    float _1263 = trunc(_1247);
    int _1265 = int(_1263);
    int _1267 = _961 + (-1);
    float _1269 = float(_1267);
    float _1271 = _1261 * _1269;
    float _1273 = trunc(_1271);
    int _1275 = int(_1273);
    int _1277 = _1275;
    int _1279 = 0;
    int _1281 = _113(_1277, _1279, (*spvDescriptorSet0.support_buffer));
    int _1283 = _1265;
    int _1285 = 0;
    int _1287 = _113(_1283, _1285, (*spvDescriptorSet0.support_buffer));
    float4 _1290 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_1281, _1287)), 0).xyzw;
    float _1292 = _1290.x;
    float _1294 = _1290.y;
    float _1296 = _1290.z;
    float _1298 = _1290.w;
    float _1300 = in.m_73.x;
    float _1302 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _1304 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1306 = _1304 != 0;
    float _1308 = in.m_73.y;
    int _1310 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1312 = _1310 != 0;
    float _1314 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1316 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _1318 = _1195 > 0.5;
    bool _1320 = _1318 && _1312;
    float _1322 = _1075;
    float _1324 = _1119;
    if (_1306)
    {
        float _1326 = in.m_67.x;
        _1322 = _1326;
    }
    float _1328 = _1322;
    if (_1306)
    {
        _1324 = _1300;
    }
    float _1330 = _1324;
    float _1332 = _1308;
    float _1334 = _1330;
    if (_1320)
    {
        float _1336 = -_1308;
        float _1338 = _1336 + 1.0;
        _1332 = _1338;
    }
    float _1340 = _1332;
    bool _1342 = _1328 > 0.5;
    bool _1344 = _1342 && _1306;
    float _1346 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1348 = _1193 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1350 = -_1346;
    float _1352 = fma(_1348, 2.0, _1350);
    float _1354 = _1346;
    if (!_1306)
    {
        _1354 = _1300;
    }
    float _1356 = _1354;
    float _1358 = fma(_1193, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1314);
    float _1360 = _1356;
    if (_1344)
    {
        float _1362 = -_1330;
        float _1364 = _1362 + 1.0;
        _1334 = _1364;
    }
    float _1366 = _1334;
    float _1368 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1370 = _1316 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1372 = _1195 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    if (_1306)
    {
        _1360 = _1366;
    }
    float _1374 = _1360;
    float _1376 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1378 = _1302 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1380 = -_155;
    float _1382 = fma(_1380, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1352);
    float _1384 = fma(_1372, -2.0, _1368);
    float _1386 = fma(_1195, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1376);
    float _1388 = fma(_1378, _1374, -0.5);
    float _1390 = fma(_155, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1358);
    float _1392 = fma(_1370, _1340, -0.5);
    float _1394 = fma(_155, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1386);
    float _1396 = fma(_155, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1384);
    float _1398 = fma(_1390, _1388, _1382);
    int _1400 = _1275 + 1;
    float _1402 = -_1396;
    float _1404 = fma(_1394, _1392, _1402);
    float _1406 = _1398 + 0.5;
    int _1408 = min(_1267, _1400);
    float _1410 = _1404 + 0.5;
    uint _1413 = as_type<uint>(half2(float2(_1298, 0.0)));
    uint _1415 = extract_bits(_1413, 0u, 8u);
    int _1417 = int(_1415) & 255;
    uint _1419 = extract_bits(_1413, 8u, 8u);
    int _1421 = int(_1419) & 255;
    int _1423 = _1421 << 8;
    int _1425 = _1417 | _1423;
    bool _1427 = _1425 >= 32768;
    int _1429 = _1425 + (-1024);
    int _1431 = _1429;
    if (_1427)
    {
        int _1433 = ~_1425;
        int _1435 = _1433 + 33792;
        int _1437 = _1435 + 1;
        _1431 = _1437;
    }
    int _1439 = _1431;
    int _1441 = _1439 + 30719;
    float _1443 = float(_1441);
    float _1445 = fma(_1443, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _1447 = abs(_1445);
    float _1449 = -_1447;
    float _1451 = _1449 + 1.0;
    float _1453 = abs(_1445);
    float _1455 = fma(_1453, -0.0187292993068695068359375, 0.074261002242565155029296875);
    bool _1457 = _1445 < 0.0;
    float _1459 = float(_1457);
    int _1461 = as_type<int>(_1451) + (-218103808);
    float _1463 = abs(_1445);
    float _1465 = fma(_1463, _1455, -0.212114393711090087890625);
    bool _1467 = uint(_1461) >= 1920991232u;
    float _1469 = abs(_1445);
    float _1471 = fma(_1469, _1465, 1.570728778839111328125);
    bool _1473 = !_1467;
    float _1495;
    if (!_1473)
    {
        int _1475 = as_type<int>(_1451);
        int _1477 = _1275;
        int _1479 = as_type<int>(_1382);
        int _1481 = 7216;
        int _1483;
        int _1485;
        int _1487;
        int _1489;
        int _1491;
        int _1493;
        _110(_1475, _1477, _1479, _1481, _1483, _1485, _1487, _1489, _1491, _1493, out.gl_Position, out.gl_PointSize);
        _1495 = as_type<float>(_1489);
        _1497 = true;
    }
    else
    {
        float _1499 = rsqrt(_1451);
        float _1501 = _1451 * _1499;
        float _1503 = _1499 * 0.5;
        float _1505 = -_1501;
        float _1507 = 0.0 + _1505;
        float _1509 = fma(_1503, _1507, 0.5);
        float _1511 = fma(_1501, _1509, _1501);
        float _1513 = -_1511;
        float _1515 = 0.0 + _1513;
        float _1517 = fma(_1511, _1515, _1451);
        float _1519 = fma(_1503, _1517, _1511);
        _1495 = _1519;
    }
    _1497 = false;
    float _1521 = _1495;
    int _1523 = _1408;
    int _1525 = 0;
    int _1527 = _113(_1523, _1525, (*spvDescriptorSet0.support_buffer));
    int _1529 = _1265;
    int _1531 = 0;
    int _1533 = _113(_1529, _1531, (*spvDescriptorSet0.support_buffer));
    float4 _1535 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_1527, _1533)), 0).xyzw;
    float _1537 = _1535.x;
    float _1539 = _1535.y;
    float _1541 = _1535.z;
    float _1543 = _1535.w;
    float _1545 = _1471 * _1521;
    float _1547 = _1459 * 2.0;
    float _1549 = _1443 * 3.883221149444580078125;
    float _1551 = floor(_1271);
    float _1553 = -_1547;
    float _1555 = fma(_1545, _1553, _1545);
    float _1557 = _1549 * 0.15915493667125701904296875;
    float _1559 = fma(_1459, 3.1415927410125732421875, _1555);
    float _1561 = _1557 * 6.283185482025146484375;
    float _1563 = cos(_1561);
    float _1565 = _1559 * 0.15915493667125701904296875;
    float _1567 = _1565 * 6.283185482025146484375;
    float _1569 = sin(_1567);
    float _1571 = -_1551;
    float _1573 = _1271 + _1571;
    float _1575 = _1557 * 6.283185482025146484375;
    float _1577 = sin(_1575);
    float _1579 = _1569 * _1563;
    float _1581 = _1569 * _1577;
    uint _1583 = as_type<uint>(half2(float2(_1543, 0.0)));
    float _1585 = -_1296;
    float _1587 = _1585 + _1541;
    float _1589 = -_1292;
    float _1591 = _1589 + _1537;
    uint _1593 = extract_bits(_1583, 0u, 8u);
    int _1595 = int(_1593) & 255;
    uint _1597 = extract_bits(_1583, 8u, 8u);
    int _1599 = int(_1597) & 255;
    int _1601 = _1599 << 8;
    int _1603 = _1595 | _1601;
    float _1605 = fma(_1573, _1587, _1296);
    float _1607 = fma(_1573, _1591, _1292);
    bool _1609 = _1603 >= 32768;
    int _1611 = _1603 + (-1024);
    int _1613 = _1611;
    if (_1609)
    {
        int _1615 = ~_1603;
        int _1617 = _1615 + 33792;
        int _1619 = _1617 + 1;
        _1613 = _1619;
    }
    int _1621 = _1613;
    int _1623 = _1621 + 30719;
    float _1625 = float(_1623);
    float _1627 = fma(_1625, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _1629 = abs(_1627);
    float _1631 = -_1629;
    float _1633 = _1631 + 1.0;
    bool _1635 = _1627 < 0.0;
    float _1637 = float(_1635);
    float _1639 = abs(_1627);
    float _1641 = fma(_1639, -0.0187292993068695068359375, 0.074261002242565155029296875);
    int _1643 = as_type<int>(_1633) + (-218103808);
    float _1645 = abs(_1627);
    float _1647 = fma(_1645, _1641, -0.212114393711090087890625);
    bool _1649 = uint(_1643) >= 1920991232u;
    float _1651 = -_1294;
    float _1653 = _1651 + _1539;
    float _1655 = abs(_1627);
    float _1657 = fma(_1655, _1647, 1.570728778839111328125);
    float _1659 = fma(_1573, _1653, _1294);
    bool _1661 = !_1649;
    float _1683;
    if (!_1661)
    {
        int _1663 = as_type<int>(_1633);
        int _1665 = as_type<int>(_1539);
        int _1667 = as_type<int>(_1633);
        int _1669 = 8128;
        int _1671;
        int _1673;
        int _1675;
        int _1677;
        int _1679;
        int _1681;
        _110(_1663, _1665, _1667, _1669, _1671, _1673, _1675, _1677, _1679, _1681, out.gl_Position, out.gl_PointSize);
        _1683 = as_type<float>(_1677);
        _1685 = true;
    }
    else
    {
        float _1687 = rsqrt(_1633);
        float _1689 = _1633 * _1687;
        float _1691 = _1687 * 0.5;
        float _1693 = -_1689;
        float _1695 = 0.0 + _1693;
        float _1697 = fma(_1691, _1695, 0.5);
        float _1699 = fma(_1689, _1697, _1689);
        float _1701 = -_1699;
        float _1703 = 0.0 + _1701;
        float _1705 = fma(_1699, _1703, _1633);
        float _1707 = fma(_1691, _1705, _1699);
        _1683 = _1707;
    }
    _1685 = false;
    float _1709 = _1683;
    float _1711 = _295 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1713 = _295 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1715 = fma(_293, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1711);
    float _1717 = fma(_293, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1713);
    float _1719 = fma(_297, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1715);
    float _1721 = fma(_297, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1717);
    float _1723 = _1719 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1725 = _1721 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1727 = fma(_1723, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1729 = fma(_1725, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1731 = floor(_1727);
    float _1733 = floor(_1729);
    float _1735 = -_1731;
    float _1737 = _1727 + _1735;
    float _1739 = -_1733;
    float _1741 = _1729 + _1739;
    float2 _6166 = float2(_1737, _1741);
    float _1743 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6166, float2(0.0), isnan(_6166)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6166, float2(0.0), isnan(_6166)), level(0.0)).x;
    float _1745 = in.m_67.x;
    float _1747 = in.m_67.y;
    float _1749 = in.m_67.z;
    float _1751 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1753 = log2(_1751);
    float _1755 = _295 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1757 = _923 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1759 = _921 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1761 = fma(_293, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1755);
    float _1763 = _919 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1765 = fma(_297, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1761);
    float _1767 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _1769 = _1765 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1771 = _1753 * _155;
    float _1773 = _1769 + _1767;
    float _1775 = exp2(_1771);
    float _1777 = _1745 * 2.0;
    float _1779 = _1749 * 2.0;
    float _1781 = _1747 * 2.0;
    float _1783 = floor(_1777);
    float _1785 = floor(_1779);
    float _1787 = -_1775;
    float _1789 = _1787 + 1.0;
    bool _1791 = _1783 > 0.0;
    float _1793 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1795 = 1.0 + _1793;
    bool _1797 = _1783 >= 0.0;
    bool _1799 = isnan(_1783);
    bool _1801 = _1797 || _1799;
    bool _1803 = isnan(0.0);
    bool _1805 = _1801 || _1803;
    float _1807 = floor(_1781);
    int _1809 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1811 = _1809 != 0;
    int _1813 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1815 = _1813 != 0;
    int _1817 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1819 = _1817 != 0;
    float _1821 = _1749 + _1747;
    int _1823 = _1805 ? 0 : 1;
    bool _1825 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1827 = isnan(1.0);
    bool _1829 = _1825 || _1827;
    bool _1831 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1833 = _1829 || _1831;
    float _1835 = 1.0 / _1795;
    float _1837 = _1821 + (-1.0);
    bool _1839 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1841 = isnan(0.0);
    bool _1843 = _1839 || _1841;
    bool _1845 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1847 = _1843 || _1845;
    int _1849 = ~_1823;
    int _1851 = _1849 + 1;
    int _1853 = _1851 + 1;
    float _1855 = fma(_1837, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1857 = _1769 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1859 = _1847 ? _1789 : 0.0;
    int _1861 = _1853;
    int _1863 = 2;
    if (!_1791)
    {
        int _1865 = ~_1823;
        int _1867 = _1865 + 1;
        _1861 = _1867;
    }
    int _1869 = _1861;
    float _1871 = fma(_1723, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1857);
    bool _1873 = _1785 > 0.0;
    bool _1875 = _1785 >= 0.0;
    bool _1877 = isnan(_1785);
    bool _1879 = _1875 || _1877;
    bool _1881 = isnan(0.0);
    bool _1883 = _1879 || _1881;
    float _1885 = fma(_1725, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1871);
    bool _1887 = !_1815;
    int _1889 = _1887 ? 0 : 1;
    if (_1833)
    {
        float _1891 = _1859 * _1835;
        _157 = _1891;
    }
    float _1893 = _157;
    bool _1895 = _1807 > 0.0;
    float _1897 = in.m_75.x;
    float _1899 = in.m_75.y;
    float _1901 = in.m_75.z;
    bool _1903 = _1807 >= 0.0;
    bool _1905 = isnan(_1807);
    bool _1907 = _1903 || _1905;
    bool _1909 = isnan(0.0);
    bool _1911 = _1907 || _1909;
    float _1913 = _1769 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    int _1915 = abs(_1889);
    float _1917 = _1885 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    bool _1919 = !_1811;
    int _1921 = _1919 ? 0 : 1;
    float _1923 = fma(_1723, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1913);
    int _1925 = _1911 ? 0 : 1;
    float _1927 = 1.0 / _1917;
    int _1929 = abs(_1921);
    float _1931 = fma(_1725, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1923);
    float _1933 = float(_1915);
    float _1935 = float(_1869);
    float _1937 = _1931 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    int _1939 = ~_1925;
    int _1941 = _1939 + 1;
    int _1943 = _1941 + 1;
    int _1945 = _1943;
    if (!_1895)
    {
        int _1947 = ~_1925;
        int _1949 = _1947 + 1;
        _1945 = _1949;
    }
    int _1951 = _1945;
    float _1953 = _1933 * _1935;
    float _1955 = _1937 + _1917;
    float _1957 = _1747 + (-0.5);
    float _1959 = _1953 * (-2.0);
    int _1961 = _1883 ? 0 : 1;
    float _1963 = _1747 + _1745;
    float _1965 = float(_1929);
    float _1967 = fma(_1959, _1899, _1899);
    float _1969 = fma(_1855, _1959, _1855);
    bool _1971 = !_1819;
    int _1973 = _1971 ? 0 : 1;
    float _1975 = _1955 * _1927;
    float _1977 = _1975 * 0.5;
    float _1979 = fma(_1957, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1967);
    int _1981 = ~_1961;
    int _1983 = _1981 + 1;
    int _1985 = _1983 + 1;
    float _1987 = _1963 + (-1.0);
    int _1989 = _1985;
    if (!_1873)
    {
        int _1991 = ~_1961;
        int _1993 = _1991 + 1;
        _1989 = _1993;
    }
    int _1995 = _1989;
    float _1997 = fma(_1969, _1893, _1979);
    int _1999 = abs(_1973);
    float _2001 = _1749 + _1745;
    float _2003 = float(_1995);
    float _2005 = _1749 + (-0.5);
    float _2007 = float(_1999);
    float _2009 = _2001 + (-1.0);
    float _2011 = float(_1951);
    float _2013 = _1965 * _2003;
    float _2015 = _1997 * 0.15915493667125701904296875;
    float _2017 = _2007 * _2011;
    float _2019 = _2013 * (-2.0);
    float _2021 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2023 = fma(_1977, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2021);
    float _2025 = fma(_1987, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _2027 = _2017 * (-2.0);
    float _2029 = fma(_2009, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2031 = _1745 + (-0.5);
    float _2033 = fma(_2019, _1897, _1897);
    float _2035 = fma(_2025, _2019, _2025);
    float _2037 = fma(_2027, _1901, _1901);
    float _2039 = 1.0 / _2023;
    float _2041 = fma(_2031, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2033);
    float _2043 = fma(_2029, _2027, _2029);
    float _2045 = fma(_2005, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2037);
    float _2047 = fma(_2035, _1893, _2041);
    float _2049 = fma(_2043, _1893, _2045);
    float _2051 = _2015 * 6.283185482025146484375;
    float _2053 = sin(_2051);
    float _2055 = _2047 * 0.15915493667125701904296875;
    float _2057 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1607);
    float _2059 = _2049 * 0.15915493667125701904296875;
    float _2061 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1659);
    float _2063 = _2057 * _1757;
    float _2065 = _1773 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _2067 = _2055 * 6.283185482025146484375;
    float _2069 = cos(_2067);
    float _2071 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2073 = _2039 * _2071;
    float _2075 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1605);
    float _2077 = _2061 * _1759;
    float _2079 = fma(_1723, (*spvDescriptorSet0.vp_c15)._m0[126].x, _2065);
    bool _2081 = _2073 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _2083 = _2075 * _1763;
    float _2085 = _2015 * 6.283185482025146484375;
    float _2087 = cos(_2085);
    bool _2089 = _2073 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _2091 = fma(_1725, (*spvDescriptorSet0.vp_c15)._m0[126].z, _2079);
    bool _2093 = !_2081;
    int _2095 = _2093 ? 0 : 1;
    float _2097 = _2091 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _2099 = _2059 * 6.283185482025146484375;
    float _2101 = cos(_2099);
    float _2103 = _2069 * _2053;
    if (!_2081)
    {
        _1863 = 1;
    }
    int _2105 = _1863;
    int _2107 = _2105;
    if (!_2089)
    {
        _2107 = _2095;
    }
    int _2109 = _2107;
    float _2111 = _2055 * 6.283185482025146484375;
    float _2113 = sin(_2111);
    float _2115 = _2069 * _2087;
    int _2117 = _2109 << 6;
    int _2119 = _2117 + 64;
    uint _2121 = uint(int(uint(_2119) >> uint(2)));
    uint _2123 = uint(int(uint(int(_2121)) >> uint(2)));
    int _2125 = int(_2121) & 3;
    float _2127 = (*spvDescriptorSet0.vp_c15)._m0[int(_2123)][_2125];
    int _2129 = int(_2121) + 1;
    uint _2131 = uint(int(uint(_2129) >> uint(2)));
    int _2133 = _2129 & 3;
    float _2135 = (*spvDescriptorSet0.vp_c15)._m0[int(_2131)][_2133];
    float _2137 = _2059 * 6.283185482025146484375;
    float _2139 = sin(_2137);
    float _2141 = _2069 * _2101;
    float _2143 = _2087 * _2101;
    float _2145 = _2141 * _2077;
    int _2147 = _2117 + 48;
    uint _2149 = uint(int(uint(_2147) >> uint(2)));
    uint _2151 = uint(int(uint(int(_2149)) >> uint(2)));
    int _2153 = int(_2149) & 3;
    float _2155 = (*spvDescriptorSet0.vp_c15)._m0[int(_2151)][_2153];
    int _2157 = int(_2149) + 1;
    uint _2159 = uint(int(uint(_2157) >> uint(2)));
    int _2161 = _2157 & 3;
    float _2163 = (*spvDescriptorSet0.vp_c15)._m0[int(_2159)][_2161];
    float _2165 = _2113 * _2087;
    float _2167 = _2113 * _2053;
    float _2169 = _2113 * _2101;
    float _2171 = _2053 * _2101;
    float _2173 = _1773 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _2175 = trunc(_2097);
    int _2177 = int(_2175);
    float _2179 = _2169 * _2077;
    float _2181 = fma(_1723, (*spvDescriptorSet0.vp_c15)._m0[127].x, _2173);
    float _2183 = fma(_2139, _2115, _2167);
    float _2185 = fma(_2139, _2167, _2115);
    float _2187 = -_2103;
    float _2189 = fma(_2139, _2165, _2187);
    float _2191 = fma(_1725, (*spvDescriptorSet0.vp_c15)._m0[127].z, _2181);
    float _2193 = -_2165;
    float _2195 = fma(_2139, _2103, _2193);
    int _2197 = _2117 + 96;
    uint _2199 = uint(int(uint(_2197) >> uint(2)));
    uint _2201 = uint(int(uint(int(_2199)) >> uint(2)));
    int _2203 = int(_2199) & 3;
    float _2205 = (*spvDescriptorSet0.vp_c15)._m0[int(_2201)][_2203];
    int _2207 = int(_2199) + 1;
    uint _2209 = uint(int(uint(_2207) >> uint(2)));
    int _2211 = _2207 & 3;
    float _2213 = (*spvDescriptorSet0.vp_c15)._m0[int(_2209)][_2211];
    float _2215 = -_2077;
    float _2217 = _2139 * _2215;
    float _2219 = fma(_2183, _2063, _2145);
    float _2221 = fma(_2189, _2063, _2179);
    float _2223 = _2191 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _2225 = fma(_2143, _2063, _2217);
    float _2227 = fma(_2195, _2083, _2219);
    float _2229 = fma(_2185, _2083, _2221);
    int _2231 = _2117 + 104;
    uint _2233 = uint(int(uint(_2231) >> uint(2)));
    uint _2235 = uint(int(uint(int(_2233)) >> uint(2)));
    int _2237 = int(_2233) & 3;
    float _2239 = (*spvDescriptorSet0.vp_c15)._m0[int(_2235)][_2237];
    int _2241 = int(_2233) + 1;
    uint _2243 = uint(int(uint(_2241) >> uint(2)));
    int _2245 = _2241 & 3;
    float _2247 = (*spvDescriptorSet0.vp_c15)._m0[int(_2243)][_2245];
    float _2249 = fma(_2171, _2083, _2225);
    float _2251 = _2227 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _2253 = _2227 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _2255 = trunc(_2223);
    int _2257 = int(_2255);
    int _2259 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _2261 = _2177 + _2259;
    int _2263 = _2261 + 1;
    float _2265 = fma(_2249, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2251);
    float _2267 = fma(_2249, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2253);
    int _2269 = _2117 + 56;
    uint _2271 = uint(int(uint(_2269) >> uint(2)));
    uint _2273 = uint(int(uint(int(_2271)) >> uint(2)));
    int _2275 = int(_2271) & 3;
    float _2277 = (*spvDescriptorSet0.vp_c15)._m0[int(_2273)][_2275];
    int _2279 = int(_2271) + 1;
    uint _2281 = uint(int(uint(_2279) >> uint(2)));
    int _2283 = _2279 & 3;
    float _2285 = (*spvDescriptorSet0.vp_c15)._m0[int(_2281)][_2283];
    bool _2287 = _2263 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _2289 = fma(_2229, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2265);
    float _2291 = fma(_2229, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2267);
    float _2293 = _2227 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2295 = _1725 + _2289;
    float _2297 = _1723 + _2291;
    int _2299 = _2117 + 72;
    uint _2301 = uint(int(uint(_2299) >> uint(2)));
    uint _2303 = uint(int(uint(int(_2301)) >> uint(2)));
    int _2305 = int(_2301) & 3;
    float _2307 = (*spvDescriptorSet0.vp_c15)._m0[int(_2303)][_2305];
    int _2309 = int(_2301) + 1;
    uint _2311 = uint(int(uint(_2309) >> uint(2)));
    int _2313 = _2309 & 3;
    float _2315 = (*spvDescriptorSet0.vp_c15)._m0[int(_2311)][_2313];
    float _2317 = _1773 * _2135;
    float _2319 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2321 = _2295 + _2319;
    float _2323 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2325 = _2297 + _2323;
    int _2327 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _2329 = _2257 + _2327;
    int _2331 = _2329 + 1;
    float _2333 = fma(_2249, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2293);
    float _2335 = _2321 * _2321;
    int _2337 = _2117 + 80;
    uint _2339 = uint(int(uint(_2337) >> uint(2)));
    uint _2341 = uint(int(uint(int(_2339)) >> uint(2)));
    int _2343 = int(_2339) & 3;
    float _2345 = (*spvDescriptorSet0.vp_c15)._m0[int(_2341)][_2343];
    int _2347 = int(_2339) + 1;
    uint _2349 = uint(int(uint(_2347) >> uint(2)));
    int _2351 = _2347 & 3;
    float _2353 = (*spvDescriptorSet0.vp_c15)._m0[int(_2349)][_2351];
    int _2355 = _2263 | _2331;
    float _2357 = fma(_2325, _2325, _2335);
    float _2359 = _1773 * _2163;
    float _2361 = fma(_2229, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2333);
    bool _2363 = _2355 < 0;
    bool _2365 = _2363 || _2287;
    float _2367 = sqrt(_2357);
    float _2369 = fma(_1723, _2155, _2359);
    bool _2371 = _2331 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _2373 = _2371 || _2365;
    float _2375 = _1773 * _2213;
    float _2377 = fma(_1723, _2205, _2375);
    float _2379 = fma(_1723, _2127, _2317);
    int _2381 = _2263;
    int _2383 = as_type<int>(_2359);
    float _2385 = _2295;
    float _2387 = _2297;
    if (!_2373)
    {
        int _2389 = _2331 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _2391 = _2389 + _2263;
        _2381 = _2391;
    }
    int _2393 = _2381;
    bool _2395 = _2367 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2397 = fma(_1725, _2239, _2377);
    float _2399 = 0.0;
    int _2401 = as_type<int>(_2239);
    float _2403 = _2397;
    if (!_2373)
    {
        float _2405 = floor(_2097);
        _2399 = _2405;
    }
    float _2407 = _2399;
    if (!_2373)
    {
        int _2409 = _2393 << 2;
        _2383 = _2409;
    }
    int _2411 = _2383;
    float _2413 = _2397 + _2247;
    int _2415 = _2411;
    if (!_2373)
    {
        uint _2417 = uint(int(uint(_2393) >> uint(2)));
        _2401 = int(_2417);
    }
    int _2419 = _2401;
    float _2421 = as_type<float>(_2419);
    if (!_2373)
    {
        int _2423 = 12 & _2411;
        _2415 = _2423;
    }
    int _2425 = _2415;
    float _2427 = fma(_1725, _2277, _2369);
    float _2429 = 1.0 / _2413;
    if (!_2373)
    {
        int _2431 = _2419 << 4;
        int _2433 = _2431 + _2425;
        _2421 = as_type<float>(_2433);
    }
    float _2435 = _2421;
    float _2437 = _2427 + _2285;
    if (!_2395)
    {
        _2403 = _2297;
    }
    float _2439 = _2403;
    float _2441 = fma(_1725, _2307, _2379);
    float _2443 = _1769 + _2361;
    float _2445 = _2441 + _2315;
    bool _2447 = !_2395;
    float _2449 = _2443;
    float _2451 = _2439;
    float _2453 = _2353;
    if (!_2447)
    {
        float _2455 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2457 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2459 = _2367 + _2457;
        float _2461 = _2443 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2463 = rsqrt(_2357);
        float _2465 = _2459 * _2455;
        float _2467 = _2465 * 0.15915493667125701904296875;
        float _2469 = _2467 * 6.283185482025146484375;
        float _2471 = cos(_2469);
        float _2473 = _2467 * 6.283185482025146484375;
        float _2475 = sin(_2473);
        float _2477 = _2471 + (-1.0);
        float _2479 = _2477 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2481 = fma(_2475, _2461, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2483 = fma(_2443, _2471, _2479);
        float _2485 = _2463 * _2481;
        float _2487 = fma(_2325, _2485, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2489 = fma(_2321, _2485, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2449 = _2483;
        _2451 = _2487;
        _2385 = _2489;
    }
    float _2491 = _2449;
    float _2493 = _2451;
    float _2495 = _2385;
    float _2497 = _2435;
    if (!_2373)
    {
        int _2499 = as_type<int>(_2435) + 400;
        uint _2501 = uint(int(uint(_2499) >> uint(2)));
        uint _2503 = uint(int(uint(int(_2501)) >> uint(2)));
        int _2505 = int(_2501) & 3;
        float _2507 = (*spvDescriptorSet0.vp_c15)._m0[int(_2503)][_2505];
        _2497 = _2507;
    }
    float _2509 = _2497;
    float _2511 = _2491 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2513 = _2491 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2515 = _2437 * _2429;
    float _2517 = _2491 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2519 = fma(_2493, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2511);
    float _2521 = fma(_2493, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2513);
    float _2523 = _2491 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    int _2525 = _2117 + 88;
    uint _2527 = uint(int(uint(_2525) >> uint(2)));
    uint _2529 = uint(int(uint(int(_2527)) >> uint(2)));
    int _2531 = int(_2527) & 3;
    float _2533 = (*spvDescriptorSet0.vp_c15)._m0[int(_2529)][_2531];
    int _2535 = int(_2527) + 1;
    uint _2537 = uint(int(uint(_2535) >> uint(2)));
    int _2539 = _2535 & 3;
    float _2541 = (*spvDescriptorSet0.vp_c15)._m0[int(_2537)][_2539];
    float _2543 = fma(_2495, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2519);
    bool _2545 = _2515 >= 0.0;
    float _2547 = fma(_2493, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2517);
    float _2549 = fma(_2495, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2521);
    float _2551 = _2543 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2553 = _2445 * _2429;
    bool _2555 = _2515 <= 1.0;
    bool _2557 = _2555 && _2545;
    float _2559 = fma(_2495, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2547);
    float _2561 = _2549 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2563 = fma(_2493, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2523);
    float _2565 = _2551 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2567 = _2559 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    bool _2569 = _2553 >= 0.0;
    bool _2571 = _2569 && _2557;
    float _2573 = fma(_2495, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2563);
    float _2575 = fma(_2561, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2565);
    float _2577 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2579 = _2567 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    bool _2581 = _2553 <= 1.0;
    bool _2583 = _2581 && _2571;
    float _2585 = _2573 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2587 = fma(_2567, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2575);
    float _2589 = -_2579;
    float _2591 = fma(_2589, _2577, 1.0);
    float _2593 = _2361;
    if (!_2373)
    {
        float _2595 = floor(_2223);
        _2593 = _2595;
    }
    float _2597 = _2593;
    float _2599 = _2551 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2601 = fma(_2585, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2587);
    float _2603 = _2551 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2605 = _1773 * _2353;
    float _2607 = fma(_2561, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2599);
    float _2609 = fma(_2561, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2603);
    float _2611 = log2(_2591);
    if (_2583)
    {
        float _2613 = float(_2109);
        _2453 = _2613;
    }
    float _2615 = _2453;
    float _2617 = fma(_1723, _2345, _2605);
    float _2619 = fma(_2567, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2607);
    float _2621 = fma(_2567, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2609);
    float _2623 = fma(_2585, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2619);
    float _2625 = 1.0 / _2601;
    float _2627 = _2597;
    float _2629 = _2621;
    if (!_2373)
    {
        float _2631 = -_2597;
        float _2633 = _2223 + _2631;
        _2627 = _2633;
    }
    float _2635 = _2627;
    float _2637 = fma(_2585, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2621);
    float _2639 = _2605;
    if (_2583)
    {
        float _2641 = rint(_2615);
        float _2643 = precise::max(_2641, 0.0);
        uint _2645 = uint(_2643);
        uint _2647 = clamp(_2645, 0u, 65535u);
        _2639 = as_type<float>(_2647);
    }
    float _2649 = _2639;
    float _2651 = _2611 * 0.693147182464599609375;
    float _2653 = fma(_1725, _2533, _2617);
    float _2655 = _2651 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2657 = _2653 + _2541;
    float _2659 = _2651;
    if (!_2373)
    {
        float _2661 = -_2407;
        float _2663 = _2097 + _2661;
        _2659 = _2663;
    }
    float _2665 = _2659;
    float _2667 = _2509;
    if (!_2373)
    {
        float _2669 = rint(_2509);
        float _2671 = precise::max(_2669, 0.0);
        uint _2673 = uint(_2671);
        uint _2675 = clamp(_2673, 0u, 65535u);
        _2667 = as_type<float>(_2675);
    }
    float _2677 = _2667;
    float _2679 = _2623 * _2625;
    float _2681 = _2637 * _2625;
    float _2683 = _2657 * _2429;
    float _2685 = fma(_2679, 0.5, 0.5);
    float _2687 = fma(_2681, -0.5, 0.5);
    float _2689 = _2553;
    float _2691 = _2681;
    if (_2583)
    {
        float3 _7681 = float3(_2515, _2553, float(as_type<int>(_2649)));
        float3 _7685 = select(_7681, float3(0.0), isnan(_7681));
        float _2693 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _7685.xy, uint(rint(_7685.z)), _2683, level(0.0));
        _2689 = _2693;
    }
    float _2695 = _2689;
    float3 _7695 = float3(_2685, _2687, _2655);
    float _2697 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7695, float3(0.0), isnan(_7695)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7695, float3(0.0), isnan(_7695)), level(0.0)).x;
    float3 _7704 = float3(_2685, _2687, _2655);
    float4 _2699 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7704, float3(0.0), isnan(_7704)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7704, float3(0.0), isnan(_7704)), level(0.0)).xyzw;
    float _2701 = _2699.x;
    float _2703 = _2699.y;
    float _2705 = _2699.z;
    float _2707 = _2699.w;
    float _2709 = _2407;
    if (!_2373)
    {
        float3 _7727 = float3(_2665, _2635, float(as_type<int>(_2677)));
        float3 _7729 = select(_7727, float3(0.0), isnan(_7727));
        float _2711 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _7729.xy, uint(rint(_7729.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _7729.xy, uint(rint(_7729.z)), level(0.0)).x;
        _2709 = _2711;
    }
    float _2713 = _2709;
    if (_2373)
    {
        _2691 = 1.0;
    }
    float _2715 = _2691;
    float _2717 = _2715;
    if (!_2373)
    {
        int _2719 = _2393 << 4;
        int _2721 = _2719 + 2048;
        uint _2723 = uint(int(uint(_2721) >> uint(2)));
        uint _2725 = uint(int(uint(int(_2723)) >> uint(2)));
        int _2727 = int(_2723) & 3;
        float _2729 = (*spvDescriptorSet0.vp_c15)._m0[int(_2725)][_2727];
        int _2731 = int(_2723) + 1;
        uint _2733 = uint(int(uint(_2731) >> uint(2)));
        int _2735 = _2731 & 3;
        float _2737 = (*spvDescriptorSet0.vp_c15)._m0[int(_2733)][_2735];
        int _2739 = _2721 + 8;
        uint _2741 = uint(int(uint(_2739) >> uint(2)));
        uint _2743 = uint(int(uint(int(_2741)) >> uint(2)));
        int _2745 = int(_2741) & 3;
        float _2747 = (*spvDescriptorSet0.vp_c15)._m0[int(_2743)][_2745];
        int _2749 = int(_2741) + 1;
        uint _2751 = uint(int(uint(_2749) >> uint(2)));
        int _2753 = _2749 & 3;
        float _2755 = (*spvDescriptorSet0.vp_c15)._m0[int(_2751)][_2753];
        float _2757 = _1773 * _2737;
        float _2759 = fma(_1723, _2729, _2757);
        float _2761 = fma(_1725, _2747, _2759);
        float _2763 = _2761 + _2755;
        float _2765 = precise::clamp(_2763, 0.0, 1.0);
        float _2767 = -_2765;
        float _2769 = _2767 + _2713;
        float _2771 = fma(_2769, 500.0, 1.5);
        float _2773 = exp2(_2771);
        float _2775 = 0.0 + _2773;
        float _2777 = precise::clamp(_2775, 0.0, 1.0);
        _2717 = _2777;
    }
    float _2779 = _2717;
    float _2781 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2783 = _2491 + _2781;
    float _2785 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2787 = _2493 + _2785;
    float _2789 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2791 = _2495 + _2789;
    float _2793 = _2783 * _2783;
    float _2795 = fma(_2787, _2787, _2793);
    float _2797 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2799 = fma(_2791, _2791, _2795);
    float _2801 = rsqrt(_2799);
    float _2803 = sqrt(_2799);
    float _2805 = _2787 * _2801;
    float _2807 = _2791 * _2801;
    float _2809 = _2783 * _2801;
    float _2811 = precise::max(0.0, _2797);
    float _2813 = _2805 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2815 = _2807 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2817 = _2813 * _2813;
    float _2819 = _2815 * _2815;
    float _2821 = -_2809;
    float _2823 = -_2811;
    float _2825 = fma(_2821, (*spvDescriptorSet0.vp_c15)._m0[24].y, _2823);
    float _2827 = _2817 + _2819;
    float _2829 = sqrt(_2827);
    bool _2831 = _2829 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2833 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2835 = _2829 + _2833;
    float _2837 = _2713;
    float _2839 = _2827;
    float _2841 = _2835;
    float _2843 = _2797;
    float _2845 = _2813;
    float _2847 = _2815;
    float _2849 = _2817;
    float _2851 = _2819;
    float _2853 = _2825;
    if (_2831)
    {
        float _2855 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2837 = _2855;
    }
    float _2857 = _2837;
    if (_2831)
    {
        float _2859 = _2825 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2629 = _2859;
    }
    float _2861 = _2629;
    float _2863 = _2861;
    if (_2831)
    {
        float _2865 = rsqrt(_2827);
        _2839 = _2865;
    }
    float _2867 = _2839;
    if (_2831)
    {
        float _2869 = _2835 * _2857;
        _2841 = _2869;
    }
    float _2871 = _2841;
    if (_2831)
    {
        float _2873 = _2871 * 0.15915493667125701904296875;
        _2387 = _2873;
    }
    float _2875 = _2387;
    float _2877 = _2857;
    if (_2831)
    {
        float _2879 = _2875 * 6.283185482025146484375;
        float _2881 = sin(_2879);
        _2877 = _2881;
    }
    float _2883 = _2877;
    float _2885 = _2871;
    if (_2831)
    {
        float _2887 = _2875 * 6.283185482025146484375;
        float _2889 = cos(_2887);
        _2885 = _2889;
    }
    float _2891 = _2885;
    float _2893 = _2883;
    if (_2831)
    {
        float _2895 = fma(_2883, _2861, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2893 = _2895;
    }
    float _2897 = _2893;
    float _2899 = _2897;
    if (_2831)
    {
        float _2901 = _2867 * _2897;
        _2899 = _2901;
    }
    float _2903 = _2899;
    if (_2831)
    {
        float _2905 = _2891 + (-1.0);
        _2843 = _2905;
    }
    float _2907 = _2843;
    if (_2831)
    {
        float _2909 = _2813 * _2903;
        _2845 = _2909;
    }
    float _2911 = _2845;
    if (_2831)
    {
        float _2913 = _2815 * _2903;
        _2847 = _2913;
    }
    float _2915 = _2847;
    if (_2831)
    {
        float _2917 = _2907 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2863 = _2917;
    }
    float _2919 = _2863;
    if (_2831)
    {
        float _2921 = _2911 * _2911;
        _2849 = _2921;
    }
    float _2923 = _2849;
    if (_2831)
    {
        float _2925 = _2915 * _2915;
        _2851 = _2925;
    }
    float _2927 = _2851;
    if (_2831)
    {
        float _2929 = fma(_2825, _2891, _2919);
        _2853 = _2929;
    }
    float _2931 = _2853;
    float _2933 = fma(_2931, _2931, _2923);
    float _2935 = _2933 + _2927;
    float _2937 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2939 = fma(_2803, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2937);
    float _2941 = precise::clamp(_2939, 0.0, 1.0);
    float _2943 = -_2941;
    float _2945 = _2943 + 1.0;
    float _2947 = rsqrt(_2935);
    float _2949 = _2947 * _2911;
    float _2951 = _2947 * _2931;
    float _2953 = _2947 * _2915;
    float _2955 = _2949 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2957 = abs(_2945);
    float _2959 = log2(_2957);
    float _2961 = -_2955;
    float _2963 = fma(_2951, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2961);
    float _2965 = -_2953;
    float _2967 = fma(_2965, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2963);
    float _2969 = _2951 + 1.0;
    float _2971 = fma(_2967, -0.5, 0.5);
    float _2973 = fma(_2967, 0.5, 0.5);
    float _2975 = fma(_2973, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2977 = _2959 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2979 = sqrt(_2971);
    float _2981 = fma(_2973, _2975, -0.212114393711090087890625);
    float _2983 = fma(_2973, _2981, 1.570728778839111328125);
    float _2985 = exp2(_2977);
    float _2987 = _2979 * 0.636619746685028076171875;
    float _2989 = -_2951;
    float _2991 = fma(_2985, _2969, _2989);
    float _2993 = -_2983;
    float _2995 = fma(_2987, _2993, 1.0);
    float _2997 = fma(_2991, 0.5, 0.5);
    float2 _8172 = float2(_2995, _2997);
    float3 _3001 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8172, float2(0.0), isnan(_8172)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8172, float2(0.0), isnan(_8172)), level(0.0)).xyz;
    float _3003 = _3001.x;
    float _3005 = _3001.y;
    float _3007 = _3001.z;
    float _3009 = _1657 * _1709;
    float _3011 = _1637 * 2.0;
    float _3013 = _1625 * 3.883221149444580078125;
    bool _3015 = _1659 != 0.0;
    bool _3017 = isnan(_1659);
    bool _3019 = _3015 || _3017;
    bool _3021 = isnan(0.0);
    bool _3023 = _3019 || _3021;
    float _3025 = -_1445;
    float _3027 = _3025 + _1627;
    float _3029 = -_3011;
    float _3031 = fma(_3009, _3029, _3009);
    float _3033 = _3013 * 0.15915493667125701904296875;
    bool _3035 = _1607 == 0.0;
    bool _3037 = !_3023;
    bool _3039 = _3035 && _3037;
    float _3041 = abs(_2073);
    float _3043 = log2(_3041);
    float _3045 = fma(_1637, 3.1415927410125732421875, _3031);
    float _3047 = fma(_1573, _3027, _1445);
    bool _3049 = _1605 == 0.0;
    bool _3051 = _3049 && _3039;
    float _3053 = _2959 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3055 = _3045 * 0.15915493667125701904296875;
    float _3057 = -_1743;
    float _3059 = _3057 + 1.0;
    float _3061 = _3033 * 6.283185482025146484375;
    float _3063 = cos(_3061);
    bool _3065 = _2073 <= 8000.0;
    bool _3067 = isnan(_2073);
    bool _3069 = _3065 || _3067;
    bool _3071 = isnan(8000.0);
    bool _3073 = _3069 || _3071;
    float _3075 = float(_3073);
    out.m_77.x = _1406;
    out.m_77.y = _1410;
    out.m_79.x = _2493;
    out.m_79.y = _2491;
    out.m_79.z = _2495;
    float _3077 = _3055 * 6.283185482025146484375;
    float _3079 = sin(_3077);
    float _3081 = _3043 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3083 = _3047;
    if (!_3051)
    {
        float _3085 = fma(_1659, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3047);
        _3083 = _3085;
    }
    float _3087 = _3083;
    float _3089 = -_3087;
    float _3091 = _2139 * _3089;
    float _3093 = _2141 * _3087;
    float _3095 = _3033 * 6.283185482025146484375;
    float _3097 = sin(_3095);
    float _3099 = _2169 * _3087;
    float _3101 = exp2(_3081);
    float _3103 = -_1579;
    float _3105 = fma(_3079, _3063, _3103);
    float _3107 = fma(_1573, _3105, _1579);
    float _3109 = -_1581;
    float _3111 = fma(_3079, _3097, _3109);
    float _3113 = _3107;
    if (!_3051)
    {
        float _3115 = fma(_1607, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3107);
        _3113 = _3115;
    }
    float _3117 = _3113;
    float _3119 = exp2(_3053);
    float _3121 = fma(_1573, _3111, _1581);
    float _3123 = fma(_2183, _3117, _3093);
    float _3125 = fma(_2143, _3117, _3091);
    float _3127 = fma(_2189, _3117, _3099);
    float _3129 = fma(_3101, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3131 = precise::clamp(_3129, 0.0, 1.0);
    float _3133 = _3121;
    if (!_3051)
    {
        float _3135 = fma(_1605, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3121);
        _3133 = _3135;
    }
    float _3137 = _3133;
    bool _3139 = _2803 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3141 = isnan(_2803);
    bool _3143 = _3139 || _3141;
    bool _3145 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3147 = _3143 || _3145;
    float _3149 = in.m_81.w;
    float _3151 = fma(_3131, -2.0, 3.0);
    float _3153 = _3131 * _3131;
    float _3155 = fma(_2195, _3137, _3123);
    float _3157 = fma(_2171, _3137, _3125);
    float _3159 = fma(_2185, _3137, _3127);
    float _3161 = _3153 * _3151;
    float _3163 = _3155 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _3165 = _3155 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _3167 = _2551 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3169 = -_3119;
    float _3171 = _3169 + 1.0;
    float _3173 = fma(_3157, (*spvDescriptorSet0.vp_c10)._m0[8].x, _3163);
    float _3175 = fma(_3157, (*spvDescriptorSet0.vp_c10)._m0[9].x, _3165);
    float _3177 = fma(_2561, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3167);
    float _3179 = _3167;
    if (!_2583)
    {
        _3179 = 1.0;
    }
    float _3181 = _3179;
    float _3183 = fma(_3159, (*spvDescriptorSet0.vp_c10)._m0[8].z, _3173);
    float _3185 = -_3161;
    float _3187 = _3185 + 1.0;
    float _3189 = fma(_2567, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3177);
    float _3191 = _3181;
    if (_2583)
    {
        bool _3193 = _2695 >= _2683;
        bool _3195 = isnan(_2695);
        bool _3197 = _3193 || _3195;
        bool _3199 = isnan(_2683);
        bool _3201 = _3197 || _3199;
        float _3203 = float(_3201);
        _3191 = _3203;
    }
    float _3205 = _3191;
    float _3207 = _3171 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3209 = fma(_3187, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3161);
    float _3211 = fma(_2585, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3189);
    float _3213 = _3155 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _3215 = _3207 * _2697;
    float _3217 = _3075 * _3209;
    float _3219 = _3211 + _2601;
    float _3221 = _3205 * _2779;
    float _3223 = fma(_3157, (*spvDescriptorSet0.vp_c10)._m0[10].x, _3213);
    float _3225 = _3217 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.gl_Position.x = _2623;
    out.gl_Position.y = _2637;
    out.gl_Position.z = _3211;
    out.gl_Position.w = _2601;
    float _3227 = _3219 * 0.5;
    float _3229 = -_3207;
    float _3231 = _3229 + 1.0;
    float _3233 = _3059 * _3225;
    float _3235 = precise::clamp(_3233, 0.0, 1.0);
    float _3237 = fma(_3159, (*spvDescriptorSet0.vp_c10)._m0[9].z, _3175);
    float _3239 = fma(_3159, (*spvDescriptorSet0.vp_c10)._m0[10].z, _3223);
    float _3241 = -_3235;
    float _3243 = fma(_3241, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    out.m_83.w = _3149;
    float _3245 = _3225;
    float _3247 = _3221;
    float _3249 = _3231;
    float _3251 = _3227;
    float _3253 = _2601;
    if (!_3147)
    {
        _3245 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3255 = _3245;
    float _3257 = -_3221;
    float _3259 = fma(_3257, _3243, 1.0);
    float _3261 = precise::clamp(_3259, 0.0, 1.0);
    out.m_85.x = _3183;
    out.m_85.y = _3237;
    out.m_85.z = _3239;
    float _3263 = _3261;
    float _3265 = _3255;
    float _3267 = _3255;
    if (!_3147)
    {
        _3247 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3269 = _3247;
    float _3271 = _2707 * _3215;
    float _3273 = _2707 * _3231;
    float _3275 = _3261 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_87.z = _3227;
    out.m_87.w = _2601;
    float _3277 = _3269;
    float _3279 = _3269;
    if (!_3147)
    {
        _3249 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3281 = _3249;
    float _3283 = _3281;
    float _3285 = _3281;
    if (!_3147)
    {
        _3263 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3287 = _3263;
    out.m_89.x = _3275;
    float _3289 = _3287;
    float _3291 = _3287;
    if (!_3147)
    {
        _3251 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3293 = _3251;
    float _3295 = _3293;
    float _3297 = _3293;
    if (!_3147)
    {
        _3253 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3299 = _3253;
    float _3301 = _3007 * _3215;
    float _3303 = fma(_3003, _3271, _2701);
    float _3305 = fma(_3005, _3271, _2703);
    float _3307 = fma(_2707, _3301, _2705);
    out.m_91.x = _3303;
    out.m_91.y = _3305;
    out.m_91.z = _3307;
    out.m_91.w = _3273;
    bool _3309 = !_3147;
    float _3311 = _3299;
    float _3313 = _3299;
    if (!_3309)
    {
        bool _3315 = _2803 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3317 = isnan(_2803);
        bool _3319 = _3315 || _3317;
        bool _3321 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3323 = _3319 || _3321;
        if (!_3323)
        {
            float _3325 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3327 = _2803 + _3325;
            float _3329 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3331 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3329;
            float _3333 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3335 = _3333 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3337 = 1.0 / _3331;
            float _3339 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3341 = _3339 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3343 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3345 = _3343 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3347 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3349 = _3347 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3351 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3353 = _3351 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3355 = _3327 * _3337;
            float _3357 = precise::clamp(_3355, 0.0, 1.0);
            float _3359 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3361 = _3359 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3363 = fma(_3357, _3335, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3365 = fma(_3357, _3361, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3367 = fma(_3357, _3341, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3369 = fma(_3357, _3345, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3371 = fma(_3357, _3349, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3373 = fma(_3357, _3353, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3313 = _3363;
            _3285 = _3371;
            _3297 = _3367;
            _3279 = _3369;
            _3267 = _3365;
            _3291 = _3373;
            _3375 = true;
        }
        else
        {
            bool _3377 = _2803 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3379 = isnan(_2803);
            bool _3381 = _3377 || _3379;
            bool _3383 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3385 = _3381 || _3383;
            if (!_3385)
            {
                _3295 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3387 = _3295;
            _3297 = _3387;
            if (!_3385)
            {
                _3311 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3389 = _3311;
            _3313 = _3389;
            if (!_3385)
            {
                _3265 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3391 = _3265;
            _3267 = _3391;
            if (!_3385)
            {
                _3277 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3393 = _3277;
            _3279 = _3393;
            if (!_3385)
            {
                _3283 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3395 = _3283;
            _3285 = _3395;
            if (!_3385)
            {
                _3289 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3397 = _3289;
            bool _3399 = !_3385;
            _3291 = _3397;
            if (!_3399)
            {
                bool _3401 = _2803 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3403 = isnan(_2803);
                bool _3405 = _3401 || _3403;
                bool _3407 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3409 = _3405 || _3407;
                if (!_3409)
                {
                    float _3411 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3413 = _2803 + _3411;
                    float _3415 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3417 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3415;
                    float _3419 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3421 = _3419 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3423 = 1.0 / _3417;
                    float _3425 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3427 = _3425 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3429 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3431 = _3429 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3433 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3435 = _3433 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3437 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3439 = _3437 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3441 = _3413 * _3423;
                    float _3443 = precise::clamp(_3441, 0.0, 1.0);
                    float _3445 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3447 = _3445 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3449 = fma(_3443, _3421, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3451 = fma(_3443, _3447, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3453 = fma(_3443, _3427, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3455 = fma(_3443, _3431, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3457 = fma(_3443, _3435, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3459 = fma(_3443, _3439, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3313 = _3449;
                    _3285 = _3457;
                    _3297 = _3453;
                    _3279 = _3455;
                    _3267 = _3451;
                    _3291 = _3459;
                    _3375 = true;
                }
                else
                {
                    _3313 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3285 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3297 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3279 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3267 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3291 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3375 = false;
    float _3461 = _3313;
    float _3463 = _3285;
    float _3465 = _3297;
    float _3467 = _3279;
    float _3469 = _3267;
    float _3471 = _3291;
    float _3473 = fma(_3237, -0.5, 0.5);
    float _3475 = precise::clamp(_3473, 0.0, 1.0);
    float _3477 = -_3461;
    float _3479 = _3477 + _3463;
    float _3481 = -_3465;
    float _3483 = _3481 + _3467;
    float _3485 = -_3469;
    float _3487 = _3485 + _3471;
    bool _3489 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3491 = fma(_3475, _3479, _3461);
    float _3493 = fma(_3475, _3483, _3465);
    float _3495 = fma(_3475, _3487, _3469);
    float _3497 = _3491 * 0.586610972881317138671875;
    out.m_61.x = 1.0;
    float _3499 = fma(_3493, 0.298911988735198974609375, _3497);
    float _3501 = fma(_3495, 0.114477999508380889892578125, _3499);
    out.m_93.x = 0.0;
    float _3503 = -_3501;
    float _3505 = _3493 + _3503;
    float _3507 = -_3501;
    float _3509 = _3491 + _3507;
    float _3511 = -_3501;
    float _3513 = _3495 + _3511;
    float _3515 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3517 = fma(_3505, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3501);
    float _3519 = fma(_3509, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3501);
    float _3521 = fma(_3513, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3501);
    out.m_95.x = 0.0;
    out.m_89.w = _3515;
    out.m_97.x = _3517;
    out.m_97.y = _3519;
    out.m_97.z = _3521;
    if (!_3489)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _3523 = -_2491;
    float _3525 = _3523 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _3527 = -_2493;
    float _3529 = _3527 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _3531 = -_2495;
    float _3533 = _3531 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _3535 = _3525 * _3525;
    float _3537 = fma(_3529, _3529, _3535);
    float _3539 = fma(_3533, _3533, _3537);
    float _3541 = rsqrt(_3539);
    float _3543 = sqrt(_3539);
    float _3545 = _3525 * _3541;
    float _3547 = _3529 * _3541;
    float _3549 = _3533 * _3541;
    float _3551 = -_2809;
    float _3553 = _3551 + _3545;
    float _3555 = -_2805;
    float _3557 = _3555 + _3547;
    float _3559 = -_2807;
    float _3561 = _3559 + _3549;
    float _3563 = _3553 * _3553;
    float _3565 = -_3543;
    float _3567 = _3565 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3569 = fma((*spvDescriptorSet0.vp_c13)._m0[4].y, (*spvDescriptorSet0.vp_c13)._m0[4].y, 0.00999999977648258209228515625);
    float _3571 = precise::clamp(_3569, 0.0, 1.0);
    float _3573 = fma(_3557, _3557, _3563);
    float _3575 = _3567 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _3577 = precise::clamp(_3575, 0.0, 1.0);
    float _3579 = _3571 * _3571;
    float _3581 = fma(_3561, _3561, _3573);
    float _3583 = _3579 + (-1.0);
    float _3585 = abs(_3577);
    float _3587 = log2(_3585);
    float _3589 = rsqrt(_3581);
    float _3591 = _3587 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _3593 = exp2(_3591);
    float _3595 = _3553 * _3589;
    float _3597 = _3557 * _3589;
    float _3599 = _3561 * _3589;
    float _3601 = _3547 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _3603 = _3237 * _3595;
    float _3605 = _3237 * _3545;
    float _3607 = fma(_3183, _3597, _3603);
    float _3609 = fma(_3183, _3547, _3605);
    float _3611 = fma(_3239, _3599, _3607);
    float _3613 = precise::clamp(_3611, 0.0, 1.0);
    float _3615 = fma(_3239, _3549, _3609);
    float _3617 = precise::clamp(_3615, 0.0, 1.0);
    float _3619 = _3613 * _3613;
    float _3621 = fma(_3619, _3583, 1.0);
    float _3623 = -_3545;
    float _3625 = -_3601;
    float _3627 = fma(_3623, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3625);
    float _3629 = _3621 * _3621;
    float _3631 = -_3549;
    float _3633 = fma(_3631, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3627);
    float _3635 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _3637 = _3633 + _3635;
    float _3639 = 1.0 / _3629;
    float _3641 = _3637 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _3643 = precise::clamp(_3641, 0.0, 1.0);
    float _3645 = _3593 * _3643;
    float _3647 = _3617 * _3645;
    float _3649 = _3647 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _3651 = _3579 * _3639;
    float _3653 = _3647 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3655 = _3647 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    float _3657 = _3647 * _3651;
    out.m_93.x = _3649;
    out.m_93.y = _3653;
    out.m_93.z = _3655;
    float _3659 = _3657 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _3661 = _3657 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3663 = _3657 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_95.x = _3659;
    out.m_95.y = _3661;
    out.m_95.z = _3663;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3375 = false;
    bool _1685 = false;
    bool _1497 = false;
    bool _945 = false;
    bool _703 = false;
    bool _319 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _117 = in.m_58.w;
    float _119 = trunc(_117);
    int _121 = int(_119);
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
        float _3720 = as_type<float>(_137);
        out.gl_Position.z = _3720;
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
    float _157 = _155;
    if (_151)
    {
        float _159 = float(_121);
        _131 = _159;
    }
    float _161 = _131;
    bool _163 = _155 >= _161;
    bool _165 = !_151;
    bool _167 = _163 || _165;
    float _169 = _161;
    if (_167)
    {
        _169 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _171 = _169;
    if (_167)
    {
        out.m_61.x = 0.0;
    }
    if (_167)
    {
        float _173 = _171 * 5.0;
        _139 = as_type<int>(_173);
    }
    int _175 = _139;
    if (_167)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3790 = as_type<float>(_175);
        out.gl_Position.z = _3790;
    }
    if (_167)
    {
        return out;
    }
    float _177 = in.m_65.w;
    float _179 = _155 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _181 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _183 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _185 = _181 || _183;
    bool _187 = isnan(1.0);
    bool _189 = _185 || _187;
    float _191 = in.m_63.x;
    float _193 = in.m_63.y;
    float _195 = in.m_63.z;
    float _197 = in.m_58.x;
    float _199 = in.m_58.y;
    float _201 = in.m_58.z;
    float _203 = 0.0;
    float _205 = _179;
    if (!_189)
    {
        float _207 = _179 * _179;
        float _209 = _207 * 0.5;
        _203 = _209;
    }
    float _211 = _203;
    float _213 = _211;
    if (!_189)
    {
        float _215 = _211 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _213 = _215;
    }
    float _217 = _213;
    bool _219 = !_189;
    float _221 = _217;
    if (!_219)
    {
        float _223 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _225 = log2(_223);
        float _227 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _229 = _227 + 1.0;
        float _231 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _233 = _179 * _225;
        float _235 = 1.0 / _229;
        float _237 = _231 * 0.693147182464599609375;
        float _239 = exp2(_233);
        float _241 = 1.0 / _237;
        float _243 = _239 + (-1.0);
        float _245 = -_243;
        float _247 = fma(_245, _241, _179);
        float _249 = _247 * _235;
        float _251 = _249 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _221 = _251;
    }
    float _253 = _221;
    bool _255 = !_189;
    if (!_255)
    {
        float _257 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _259 = log2(_257);
        float _261 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _263 = _261 + 1.0;
        float _265 = 1.0 / _263;
        float _267 = _179 * _259;
        float _269 = exp2(_267);
        float _271 = -_269;
        float _273 = _271 + 1.0;
        float _275 = _273 * _265;
        _205 = _275;
    }
    float _277 = _205;
    bool _279 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _281 = _253 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _283 = _253 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _285 = _253 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _287 = fma(_277, _191, _281);
    float _289 = fma(_277, _193, _283);
    float _291 = fma(_277, _195, _285);
    float _293 = fma(_287, _177, _197);
    float _295 = fma(_289, _177, _199);
    float _297 = fma(_291, _177, _201);
    bool _299 = !_279;
    float _317;
    if (!_299)
    {
        float _301 = in.m_67.x;
        float _303 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _305 = _301 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _307 = fma(_305, (*spvDescriptorSet0.vp_c9)._m0[12].x, _155);
        float _309 = _307 * _303;
        float _311 = floor(_309);
        float _313 = -_311;
        float _315 = _309 + _313;
        _317 = _315;
        _319 = true;
    }
    else
    {
        float _321 = float(_121);
        float _323 = 1.0 / _321;
        float _325 = _155 * _323;
        _317 = _325;
    }
    _319 = false;
    float _327 = _317;
    float _329 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _331 = _327 + _329;
    float _333 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _335 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _333;
    float _337 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _339 = _337 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _341 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _343 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _341;
    float _345 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _347 = _345 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _349 = 1.0 / _335;
    float _351 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _353 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _351;
    float _355 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _357 = _355 + (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _359 = _327 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _361 = isnan(_327);
    bool _363 = _359 || _361;
    bool _365 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _367 = _363 || _365;
    float _369 = float(_367);
    float _371 = 1.0 / _339;
    float _373 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _375 = _327 + _373;
    float _377 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _379 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _377;
    float _381 = 1.0 / _343;
    float _383 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _385 = _327 + _383;
    float _387 = _375 * _349;
    float _389 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _391 = _327 + _389;
    bool _393 = _327 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _395 = isnan(_327);
    bool _397 = _393 || _395;
    bool _399 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _401 = _397 || _399;
    float _403 = float(_401);
    float _405 = fma(_379, _387, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    bool _407 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _409 = 1.0 / _353;
    float _411 = _385 * _371;
    float _413 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _415 = _327 + _413;
    float _417 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _419 = _327 + _417;
    float _421 = -_403;
    float _423 = _421 + 1.0;
    float _425 = 1.0 / _347;
    float _427 = _391 * _381;
    bool _429 = _327 >= (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _431 = isnan(_327);
    bool _433 = _429 || _431;
    bool _435 = isnan((*spvDescriptorSet0.vp_c9)._m0[149].w);
    bool _437 = _433 || _435;
    float _439 = float(_437);
    bool _441 = _327 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _443 = isnan(_327);
    bool _445 = _441 || _443;
    bool _447 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _449 = _445 || _447;
    float _451 = float(_449);
    float _453 = 1.0 / _357;
    float _455 = _415 * _409;
    float _457 = -_439;
    float _459 = _457 + 1.0;
    float _461 = _403 * _459;
    float _463 = _331 * _425;
    float _465 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _467 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _465;
    float _469 = fma(_467, _387, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _471 = _369 * _423;
    float _473 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _475 = _473 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _477 = _419 * _453;
    float _479 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _481 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _479;
    bool _483 = _327 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _485 = isnan(_327);
    bool _487 = _483 || _485;
    bool _489 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _491 = _487 || _489;
    float _493 = float(_491);
    float _495 = fma(_475, _411, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _497 = fma(_481, _387, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _499 = _327 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _501 = isnan(_327);
    bool _503 = _499 || _501;
    bool _505 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _507 = _503 || _505;
    float _509 = float(_507);
    float _511 = -_369;
    float _513 = _511 + 1.0;
    bool _515 = _327 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _517 = isnan(_327);
    bool _519 = _515 || _517;
    bool _521 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _523 = _519 || _521;
    float _525 = float(_523);
    float _527 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _529 = _527 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _531 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _533 = _531 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _535 = _509 * _513;
    float _537 = -_509;
    float _539 = _537 + 1.0;
    float _541 = -_525;
    float _543 = _541 + 1.0;
    float _545 = fma(_529, _411, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _547 = fma(_533, _411, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _549 = _451 * _539;
    float _551 = _493 * _543;
    float _553 = -_451;
    float _555 = _553 + 1.0;
    float _557 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _559 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _557;
    float _561 = _405 * _551;
    float _563 = _469 * _551;
    float _565 = _497 * _551;
    float _567 = -_493;
    float _569 = _567 + 1.0;
    float _571 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _573 = _571 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _575 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _577 = _575 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _579 = _525 * _555;
    float _581 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _583 = _581 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _585 = fma(_569, (*spvDescriptorSet0.vp_c9)._m0[143].x, _563);
    float _587 = fma(_569, (*spvDescriptorSet0.vp_c9)._m0[143].y, _565);
    float _589 = fma(_569, (*spvDescriptorSet0.vp_c9)._m0[143].z, _561);
    float _591 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _593 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _591;
    float _595 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _597 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _595;
    float _599 = fma(_573, _463, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _601 = fma(_577, _463, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _603 = fma(_583, _463, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _605 = fma(_545, _579, _585);
    float _607 = fma(_495, _579, _587);
    float _609 = fma(_547, _579, _589);
    float _611 = fma(_593, _427, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _613 = fma(_559, _427, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _615 = fma(_597, _427, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _617 = fma(_611, _549, _605);
    float _619 = fma(_613, _549, _607);
    float _621 = fma(_615, _549, _609);
    float _623 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _625 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _623;
    float _627 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _629 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _627;
    float _631 = fma(_599, _535, _617);
    float _633 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _635 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _633;
    float _637 = fma(_601, _535, _619);
    float _639 = fma(_603, _535, _621);
    float _641 = fma(_625, _455, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _643 = fma(_629, _455, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _645 = -(*spvDescriptorSet0.vp_c9)._m0[148].x;
    float _647 = _645 + (*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _649 = fma(_635, _455, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    float _651 = -(*spvDescriptorSet0.vp_c9)._m0[148].y;
    float _653 = _651 + (*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _655 = -(*spvDescriptorSet0.vp_c9)._m0[148].z;
    float _657 = _655 + (*spvDescriptorSet0.vp_c9)._m0[149].z;
    float _659 = fma(_641, _471, _631);
    float _661 = fma(_647, _477, (*spvDescriptorSet0.vp_c9)._m0[148].x);
    float _663 = fma(_653, _477, (*spvDescriptorSet0.vp_c9)._m0[148].y);
    float _665 = fma(_657, _477, (*spvDescriptorSet0.vp_c9)._m0[148].z);
    float _667 = fma(_643, _471, _637);
    float _669 = fma(_649, _471, _639);
    float _671 = fma(_661, _461, _659);
    float _673 = fma(_663, _461, _667);
    float _675 = fma(_665, _461, _669);
    float _677 = fma(_439, (*spvDescriptorSet0.vp_c9)._m0[149].x, _671);
    float _679 = fma(_439, (*spvDescriptorSet0.vp_c9)._m0[149].y, _673);
    float _681 = fma(_439, (*spvDescriptorSet0.vp_c9)._m0[149].z, _675);
    bool _683 = !_407;
    float _701;
    if (!_683)
    {
        float _685 = in.m_67.x;
        float _687 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _689 = _685 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _691 = fma(_689, (*spvDescriptorSet0.vp_c9)._m0[11].y, _155);
        float _693 = _691 * _687;
        float _695 = floor(_693);
        float _697 = -_695;
        float _699 = _693 + _697;
        _701 = _699;
        _703 = true;
    }
    else
    {
        float _705 = float(_121);
        float _707 = 1.0 / _705;
        float _709 = _155 * _707;
        _701 = _709;
    }
    _703 = false;
    float _711 = _701;
    float _713 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _715 = _713 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _717 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _719 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _717;
    bool _721 = _711 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _723 = isnan(_711);
    bool _725 = _721 || _723;
    bool _727 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _729 = _725 || _727;
    float _731 = float(_729);
    float _733 = 1.0 / _715;
    float _735 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _737 = _735 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _739 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _741 = _739 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _743 = -_731;
    float _745 = _743 + 1.0;
    bool _747 = _711 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _749 = isnan(_711);
    bool _751 = _747 || _749;
    bool _753 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _755 = _751 || _753;
    float _757 = float(_755);
    float _759 = 1.0 / _737;
    bool _761 = _711 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _763 = isnan(_711);
    bool _765 = _761 || _763;
    bool _767 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _769 = _765 || _767;
    float _771 = float(_769);
    bool _773 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _775 = _771 * _745;
    float _777 = -_771;
    float _779 = _777 + 1.0;
    float _781 = _719 * _733;
    float _783 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _785 = _711 + _783;
    float _787 = 1.0 / _741;
    float _789 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _791 = _789 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _793 = _757 * _779;
    float _795 = fma(_781, _785, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _797 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _799 = _797 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _801 = _711 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _803 = isnan(_711);
    bool _805 = _801 || _803;
    bool _807 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _809 = _805 || _807;
    float _811 = float(_809);
    float _813 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _815 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _813;
    float _817 = _791 * _759;
    float _819 = 1.0 / _799;
    float _821 = _795 * _793;
    float _823 = -_811;
    float _825 = _823 + 1.0;
    float _827 = -_757;
    float _829 = _827 + 1.0;
    float _831 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _833 = _831 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _835 = _731 * _825;
    float _837 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _839 = _711 + _837;
    float _841 = _815 * _787;
    float _843 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _845 = _711 + _843;
    bool _847 = _711 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _849 = isnan(_711);
    bool _851 = _847 || _849;
    bool _853 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _855 = _851 || _853;
    float _857 = float(_855);
    float _859 = fma(_829, (*spvDescriptorSet0.vp_c9)._m0[115].x, _821);
    float _861 = fma(_841, _839, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _863 = fma(_817, _845, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _865 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _867 = _711 + _865;
    float _869 = -_857;
    float _871 = _869 + 1.0;
    float _873 = _833 * _819;
    float _875 = fma(_863, _775, _859);
    float _877 = _811 * _871;
    float _879 = fma(_873, _867, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _881 = fma(_861, _835, _875);
    float _883 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _885 = fma(_879, _877, _881);
    float _887 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _889 = fma(_857, (*spvDescriptorSet0.vp_c9)._m0[119].x, _885);
    float _891 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _893 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _895 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _897 = _883 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _899 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _901 = _891 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _903 = _887 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _905 = _893 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _907 = _895 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _909 = _899 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _911 = _889 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _913 = in.m_65.x;
    float _915 = in.m_65.y;
    float _917 = in.m_65.z;
    out.m_69.x = _905;
    out.m_69.y = _907;
    out.m_69.z = _909;
    out.m_71.x = _897;
    out.m_71.y = _901;
    out.m_71.z = _903;
    out.m_71.w = _911;
    float _919 = _681 * _917;
    float _921 = _679 * _915;
    float _923 = _677 * _913;
    bool _925 = !_773;
    float _943;
    if (!_925)
    {
        float _927 = in.m_67.x;
        float _929 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _931 = _927 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _933 = fma(_931, (*spvDescriptorSet0.vp_c9)._m0[14].x, _155);
        float _935 = _933 * _929;
        float _937 = floor(_935);
        float _939 = -_937;
        float _941 = _935 + _939;
        _943 = _941;
        _945 = true;
    }
    else
    {
        float _947 = float(_121);
        float _949 = 1.0 / _947;
        float _951 = _155 * _949;
        _943 = _951;
    }
    _945 = false;
    float _953 = _943;
    int _955 = int2(spvDescriptorSet0.vp_t_tcb_C.get_width(), spvDescriptorSet0.vp_t_tcb_C.get_height()).x;
    int _957 = _955;
    int _959 = 0;
    int _961 = _112(_957, _959, (*spvDescriptorSet0.support_buffer));
    float _963 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _965 = _963 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _967 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _969 = _967 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _971 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _973 = _971 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _975 = 1.0 / _965;
    float _977 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _979 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _977;
    float _981 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _983 = _981 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _985 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _987 = _985 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _989 = 1.0 / _969;
    bool _991 = _953 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _993 = isnan(_953);
    bool _995 = _991 || _993;
    bool _997 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _999 = _995 || _997;
    float _1001 = float(_999);
    float _1003 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1005 = _1003 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1007 = 1.0 / _973;
    float _1009 = _979 * _975;
    float _1011 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _1013 = _1011 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1015 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1017 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _1015;
    float _1019 = 1.0 / _983;
    bool _1021 = _953 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _1023 = isnan(_953);
    bool _1025 = _1021 || _1023;
    bool _1027 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _1029 = _1025 || _1027;
    float _1031 = float(_1029);
    float _1033 = _1017 * _989;
    bool _1035 = _953 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _1037 = isnan(_953);
    bool _1039 = _1035 || _1037;
    bool _1041 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _1043 = _1039 || _1041;
    float _1045 = float(_1043);
    float _1047 = -_1031;
    float _1049 = _1047 + 1.0;
    float _1051 = 1.0 / _987;
    float _1053 = _1013 * _1007;
    bool _1055 = _953 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _1057 = isnan(_953);
    bool _1059 = _1055 || _1057;
    bool _1061 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _1063 = _1059 || _1061;
    float _1065 = float(_1063);
    float _1067 = -_1045;
    float _1069 = _1067 + 1.0;
    float _1071 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1073 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _1071;
    float _1075 = _1045 * _1049;
    float _1077 = _1065 * _1069;
    float _1079 = -_1065;
    float _1081 = _1079 + 1.0;
    bool _1083 = _953 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _1085 = isnan(_953);
    bool _1087 = _1083 || _1085;
    bool _1089 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _1091 = _1087 || _1089;
    float _1093 = float(_1091);
    float _1095 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _1097 = _1095 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1099 = _1073 * _1019;
    bool _1101 = _953 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1103 = isnan(_953);
    bool _1105 = _1101 || _1103;
    bool _1107 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _1109 = _1105 || _1107;
    float _1111 = float(_1109);
    float _1113 = 1.0 / _1005;
    float _1115 = -_1093;
    float _1117 = _1115 + 1.0;
    float _1119 = _1093 * _1081;
    float _1121 = _1097 * _1051;
    float _1123 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1125 = _953 + _1123;
    float _1127 = _1001 * _1117;
    bool _1129 = _953 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _1131 = isnan(_953);
    bool _1133 = _1129 || _1131;
    bool _1135 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _1137 = _1133 || _1135;
    float _1139 = float(_1137);
    float _1141 = -_1111;
    float _1143 = _1141 + 1.0;
    float _1145 = -_1001;
    float _1147 = _1145 + 1.0;
    float _1149 = fma(_1009, _1125, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _1151 = _1139 * _1143;
    float _1153 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1155 = _953 + _1153;
    float _1157 = -_1139;
    float _1159 = _1157 + 1.0;
    float _1161 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1163 = _1161 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _1165 = _1149 * _1151;
    float _1167 = _1111 * _1147;
    float _1169 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1171 = _1169 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1173 = fma(_1053, _1155, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _1175 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1177 = _953 + _1175;
    float _1179 = fma(_1159, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1165);
    float _1181 = 1.0 / _1163;
    float _1183 = _1171 * _1113;
    float _1185 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1187 = _953 + _1185;
    float _1189 = fma(_1033, _1177, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _1191 = fma(_1173, _1167, _1179);
    float _1193 = in.m_67.x;
    float _1195 = in.m_67.y;
    float _1197 = fma(_1121, _1187, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _1199 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1201 = _953 + _1199;
    float _1203 = fma(_1189, _1127, _1191);
    bool _1205 = _953 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1207 = isnan(_953);
    bool _1209 = _1205 || _1207;
    bool _1211 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1213 = _1209 || _1211;
    float _1215 = float(_1213);
    float _1217 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1219 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _1217;
    float _1221 = fma(_1099, _1201, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _1223 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1225 = _953 + _1223;
    float _1227 = fma(_1197, _1119, _1203);
    float _1229 = -_1215;
    float _1231 = _1229 + 1.0;
    float _1233 = _1219 * _1181;
    float _1235 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1237 = _953 + _1235;
    float _1239 = fma(_1183, _1225, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _1241 = fma(_1221, _1077, _1227);
    float _1243 = _1031 * _1231;
    float _1245 = fma(_1233, _1237, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1247 = in.m_73.z;
    float _1249 = fma(_1239, _1075, _1241);
    float _1251 = fma(_1245, _1243, _1249);
    float _1253 = -_1193;
    float _1255 = fma(0.5, _1253, 1.0);
    float _1257 = fma(_1215, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1251);
    float _1259 = _1257 * _1255;
    float _1261 = precise::clamp(_1259, 0.0, 1.0);
    float _1263 = trunc(_1247);
    int _1265 = int(_1263);
    int _1267 = _961 + (-1);
    float _1269 = float(_1267);
    float _1271 = _1261 * _1269;
    float _1273 = trunc(_1271);
    int _1275 = int(_1273);
    int _1277 = _1275;
    int _1279 = 0;
    int _1281 = _113(_1277, _1279, (*spvDescriptorSet0.support_buffer));
    int _1283 = _1265;
    int _1285 = 0;
    int _1287 = _113(_1283, _1285, (*spvDescriptorSet0.support_buffer));
    float4 _1290 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_1281, _1287)), 0).xyzw;
    float _1292 = _1290.x;
    float _1294 = _1290.y;
    float _1296 = _1290.z;
    float _1298 = _1290.w;
    float _1300 = in.m_73.x;
    float _1302 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _1304 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1306 = _1304 != 0;
    float _1308 = in.m_73.y;
    int _1310 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1312 = _1310 != 0;
    float _1314 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1316 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _1318 = _1195 > 0.5;
    bool _1320 = _1318 && _1312;
    float _1322 = _1075;
    float _1324 = _1119;
    if (_1306)
    {
        float _1326 = in.m_67.x;
        _1322 = _1326;
    }
    float _1328 = _1322;
    if (_1306)
    {
        _1324 = _1300;
    }
    float _1330 = _1324;
    float _1332 = _1308;
    float _1334 = _1330;
    if (_1320)
    {
        float _1336 = -_1308;
        float _1338 = _1336 + 1.0;
        _1332 = _1338;
    }
    float _1340 = _1332;
    bool _1342 = _1328 > 0.5;
    bool _1344 = _1342 && _1306;
    float _1346 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1348 = _1193 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1350 = -_1346;
    float _1352 = fma(_1348, 2.0, _1350);
    float _1354 = _1346;
    if (!_1306)
    {
        _1354 = _1300;
    }
    float _1356 = _1354;
    float _1358 = fma(_1193, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1314);
    float _1360 = _1356;
    if (_1344)
    {
        float _1362 = -_1330;
        float _1364 = _1362 + 1.0;
        _1334 = _1364;
    }
    float _1366 = _1334;
    float _1368 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1370 = _1316 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1372 = _1195 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    if (_1306)
    {
        _1360 = _1366;
    }
    float _1374 = _1360;
    float _1376 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1378 = _1302 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1380 = -_155;
    float _1382 = fma(_1380, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1352);
    float _1384 = fma(_1372, -2.0, _1368);
    float _1386 = fma(_1195, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1376);
    float _1388 = fma(_1378, _1374, -0.5);
    float _1390 = fma(_155, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1358);
    float _1392 = fma(_1370, _1340, -0.5);
    float _1394 = fma(_155, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1386);
    float _1396 = fma(_155, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1384);
    float _1398 = fma(_1390, _1388, _1382);
    int _1400 = _1275 + 1;
    float _1402 = -_1396;
    float _1404 = fma(_1394, _1392, _1402);
    float _1406 = _1398 + 0.5;
    int _1408 = min(_1267, _1400);
    float _1410 = _1404 + 0.5;
    uint _1413 = as_type<uint>(half2(float2(_1298, 0.0)));
    uint _1415 = extract_bits(_1413, 0u, 8u);
    int _1417 = int(_1415) & 255;
    uint _1419 = extract_bits(_1413, 8u, 8u);
    int _1421 = int(_1419) & 255;
    int _1423 = _1421 << 8;
    int _1425 = _1417 | _1423;
    bool _1427 = _1425 >= 32768;
    int _1429 = _1425 + (-1024);
    int _1431 = _1429;
    if (_1427)
    {
        int _1433 = ~_1425;
        int _1435 = _1433 + 33792;
        int _1437 = _1435 + 1;
        _1431 = _1437;
    }
    int _1439 = _1431;
    int _1441 = _1439 + 30719;
    float _1443 = float(_1441);
    float _1445 = fma(_1443, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _1447 = abs(_1445);
    float _1449 = -_1447;
    float _1451 = _1449 + 1.0;
    float _1453 = abs(_1445);
    float _1455 = fma(_1453, -0.0187292993068695068359375, 0.074261002242565155029296875);
    bool _1457 = _1445 < 0.0;
    float _1459 = float(_1457);
    int _1461 = as_type<int>(_1451) + (-218103808);
    float _1463 = abs(_1445);
    float _1465 = fma(_1463, _1455, -0.212114393711090087890625);
    bool _1467 = uint(_1461) >= 1920991232u;
    float _1469 = abs(_1445);
    float _1471 = fma(_1469, _1465, 1.570728778839111328125);
    bool _1473 = !_1467;
    float _1495;
    if (!_1473)
    {
        int _1475 = as_type<int>(_1451);
        int _1477 = _1275;
        int _1479 = as_type<int>(_1382);
        int _1481 = 7216;
        int _1483;
        int _1485;
        int _1487;
        int _1489;
        int _1491;
        int _1493;
        _110(_1475, _1477, _1479, _1481, _1483, _1485, _1487, _1489, _1491, _1493, out.gl_Position, out.gl_PointSize);
        _1495 = as_type<float>(_1489);
        _1497 = true;
    }
    else
    {
        float _1499 = rsqrt(_1451);
        float _1501 = _1451 * _1499;
        float _1503 = _1499 * 0.5;
        float _1505 = -_1501;
        float _1507 = 0.0 + _1505;
        float _1509 = fma(_1503, _1507, 0.5);
        float _1511 = fma(_1501, _1509, _1501);
        float _1513 = -_1511;
        float _1515 = 0.0 + _1513;
        float _1517 = fma(_1511, _1515, _1451);
        float _1519 = fma(_1503, _1517, _1511);
        _1495 = _1519;
    }
    _1497 = false;
    float _1521 = _1495;
    int _1523 = _1408;
    int _1525 = 0;
    int _1527 = _113(_1523, _1525, (*spvDescriptorSet0.support_buffer));
    int _1529 = _1265;
    int _1531 = 0;
    int _1533 = _113(_1529, _1531, (*spvDescriptorSet0.support_buffer));
    float4 _1535 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_1527, _1533)), 0).xyzw;
    float _1537 = _1535.x;
    float _1539 = _1535.y;
    float _1541 = _1535.z;
    float _1543 = _1535.w;
    float _1545 = _1471 * _1521;
    float _1547 = _1459 * 2.0;
    float _1549 = _1443 * 3.883221149444580078125;
    float _1551 = floor(_1271);
    float _1553 = -_1547;
    float _1555 = fma(_1545, _1553, _1545);
    float _1557 = _1549 * 0.15915493667125701904296875;
    float _1559 = fma(_1459, 3.1415927410125732421875, _1555);
    float _1561 = _1557 * 6.283185482025146484375;
    float _1563 = cos(_1561);
    float _1565 = _1559 * 0.15915493667125701904296875;
    float _1567 = _1565 * 6.283185482025146484375;
    float _1569 = sin(_1567);
    float _1571 = -_1551;
    float _1573 = _1271 + _1571;
    float _1575 = _1557 * 6.283185482025146484375;
    float _1577 = sin(_1575);
    float _1579 = _1569 * _1563;
    float _1581 = _1569 * _1577;
    uint _1583 = as_type<uint>(half2(float2(_1543, 0.0)));
    float _1585 = -_1296;
    float _1587 = _1585 + _1541;
    float _1589 = -_1292;
    float _1591 = _1589 + _1537;
    uint _1593 = extract_bits(_1583, 0u, 8u);
    int _1595 = int(_1593) & 255;
    uint _1597 = extract_bits(_1583, 8u, 8u);
    int _1599 = int(_1597) & 255;
    int _1601 = _1599 << 8;
    int _1603 = _1595 | _1601;
    float _1605 = fma(_1573, _1587, _1296);
    float _1607 = fma(_1573, _1591, _1292);
    bool _1609 = _1603 >= 32768;
    int _1611 = _1603 + (-1024);
    int _1613 = _1611;
    if (_1609)
    {
        int _1615 = ~_1603;
        int _1617 = _1615 + 33792;
        int _1619 = _1617 + 1;
        _1613 = _1619;
    }
    int _1621 = _1613;
    int _1623 = _1621 + 30719;
    float _1625 = float(_1623);
    float _1627 = fma(_1625, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _1629 = abs(_1627);
    float _1631 = -_1629;
    float _1633 = _1631 + 1.0;
    bool _1635 = _1627 < 0.0;
    float _1637 = float(_1635);
    float _1639 = abs(_1627);
    float _1641 = fma(_1639, -0.0187292993068695068359375, 0.074261002242565155029296875);
    int _1643 = as_type<int>(_1633) + (-218103808);
    float _1645 = abs(_1627);
    float _1647 = fma(_1645, _1641, -0.212114393711090087890625);
    bool _1649 = uint(_1643) >= 1920991232u;
    float _1651 = -_1294;
    float _1653 = _1651 + _1539;
    float _1655 = abs(_1627);
    float _1657 = fma(_1655, _1647, 1.570728778839111328125);
    float _1659 = fma(_1573, _1653, _1294);
    bool _1661 = !_1649;
    float _1683;
    if (!_1661)
    {
        int _1663 = as_type<int>(_1633);
        int _1665 = as_type<int>(_1539);
        int _1667 = as_type<int>(_1633);
        int _1669 = 8128;
        int _1671;
        int _1673;
        int _1675;
        int _1677;
        int _1679;
        int _1681;
        _110(_1663, _1665, _1667, _1669, _1671, _1673, _1675, _1677, _1679, _1681, out.gl_Position, out.gl_PointSize);
        _1683 = as_type<float>(_1677);
        _1685 = true;
    }
    else
    {
        float _1687 = rsqrt(_1633);
        float _1689 = _1633 * _1687;
        float _1691 = _1687 * 0.5;
        float _1693 = -_1689;
        float _1695 = 0.0 + _1693;
        float _1697 = fma(_1691, _1695, 0.5);
        float _1699 = fma(_1689, _1697, _1689);
        float _1701 = -_1699;
        float _1703 = 0.0 + _1701;
        float _1705 = fma(_1699, _1703, _1633);
        float _1707 = fma(_1691, _1705, _1699);
        _1683 = _1707;
    }
    _1685 = false;
    float _1709 = _1683;
    float _1711 = _295 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1713 = _295 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1715 = fma(_293, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1711);
    float _1717 = fma(_293, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1713);
    float _1719 = fma(_297, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1715);
    float _1721 = fma(_297, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1717);
    float _1723 = _1719 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1725 = _1721 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1727 = fma(_1723, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1729 = fma(_1725, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1731 = floor(_1727);
    float _1733 = floor(_1729);
    float _1735 = -_1731;
    float _1737 = _1727 + _1735;
    float _1739 = -_1733;
    float _1741 = _1729 + _1739;
    float2 _6166 = float2(_1737, _1741);
    float _1743 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6166, float2(0.0), isnan(_6166)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6166, float2(0.0), isnan(_6166)), level(0.0)).x;
    float _1745 = in.m_67.x;
    float _1747 = in.m_67.y;
    float _1749 = in.m_67.z;
    float _1751 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1753 = log2(_1751);
    float _1755 = _295 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1757 = _923 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1759 = _921 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1761 = fma(_293, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1755);
    float _1763 = _919 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1765 = fma(_297, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1761);
    float _1767 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _1769 = _1765 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1771 = _1753 * _155;
    float _1773 = _1769 + _1767;
    float _1775 = exp2(_1771);
    float _1777 = _1745 * 2.0;
    float _1779 = _1749 * 2.0;
    float _1781 = _1747 * 2.0;
    float _1783 = floor(_1777);
    float _1785 = floor(_1779);
    float _1787 = -_1775;
    float _1789 = _1787 + 1.0;
    bool _1791 = _1783 > 0.0;
    float _1793 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1795 = 1.0 + _1793;
    bool _1797 = _1783 >= 0.0;
    bool _1799 = isnan(_1783);
    bool _1801 = _1797 || _1799;
    bool _1803 = isnan(0.0);
    bool _1805 = _1801 || _1803;
    float _1807 = floor(_1781);
    int _1809 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1811 = _1809 != 0;
    int _1813 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1815 = _1813 != 0;
    int _1817 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1819 = _1817 != 0;
    float _1821 = _1749 + _1747;
    int _1823 = _1805 ? 0 : 1;
    bool _1825 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1827 = isnan(1.0);
    bool _1829 = _1825 || _1827;
    bool _1831 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1833 = _1829 || _1831;
    float _1835 = 1.0 / _1795;
    float _1837 = _1821 + (-1.0);
    bool _1839 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1841 = isnan(0.0);
    bool _1843 = _1839 || _1841;
    bool _1845 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1847 = _1843 || _1845;
    int _1849 = ~_1823;
    int _1851 = _1849 + 1;
    int _1853 = _1851 + 1;
    float _1855 = fma(_1837, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1857 = _1769 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1859 = _1847 ? _1789 : 0.0;
    int _1861 = _1853;
    int _1863 = 2;
    if (!_1791)
    {
        int _1865 = ~_1823;
        int _1867 = _1865 + 1;
        _1861 = _1867;
    }
    int _1869 = _1861;
    float _1871 = fma(_1723, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1857);
    bool _1873 = _1785 > 0.0;
    bool _1875 = _1785 >= 0.0;
    bool _1877 = isnan(_1785);
    bool _1879 = _1875 || _1877;
    bool _1881 = isnan(0.0);
    bool _1883 = _1879 || _1881;
    float _1885 = fma(_1725, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1871);
    bool _1887 = !_1815;
    int _1889 = _1887 ? 0 : 1;
    if (_1833)
    {
        float _1891 = _1859 * _1835;
        _157 = _1891;
    }
    float _1893 = _157;
    bool _1895 = _1807 > 0.0;
    float _1897 = in.m_75.x;
    float _1899 = in.m_75.y;
    float _1901 = in.m_75.z;
    bool _1903 = _1807 >= 0.0;
    bool _1905 = isnan(_1807);
    bool _1907 = _1903 || _1905;
    bool _1909 = isnan(0.0);
    bool _1911 = _1907 || _1909;
    float _1913 = _1769 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    int _1915 = abs(_1889);
    float _1917 = _1885 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    bool _1919 = !_1811;
    int _1921 = _1919 ? 0 : 1;
    float _1923 = fma(_1723, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1913);
    int _1925 = _1911 ? 0 : 1;
    float _1927 = 1.0 / _1917;
    int _1929 = abs(_1921);
    float _1931 = fma(_1725, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1923);
    float _1933 = float(_1915);
    float _1935 = float(_1869);
    float _1937 = _1931 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    int _1939 = ~_1925;
    int _1941 = _1939 + 1;
    int _1943 = _1941 + 1;
    int _1945 = _1943;
    if (!_1895)
    {
        int _1947 = ~_1925;
        int _1949 = _1947 + 1;
        _1945 = _1949;
    }
    int _1951 = _1945;
    float _1953 = _1933 * _1935;
    float _1955 = _1937 + _1917;
    float _1957 = _1747 + (-0.5);
    float _1959 = _1953 * (-2.0);
    int _1961 = _1883 ? 0 : 1;
    float _1963 = _1747 + _1745;
    float _1965 = float(_1929);
    float _1967 = fma(_1959, _1899, _1899);
    float _1969 = fma(_1855, _1959, _1855);
    bool _1971 = !_1819;
    int _1973 = _1971 ? 0 : 1;
    float _1975 = _1955 * _1927;
    float _1977 = _1975 * 0.5;
    float _1979 = fma(_1957, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1967);
    int _1981 = ~_1961;
    int _1983 = _1981 + 1;
    int _1985 = _1983 + 1;
    float _1987 = _1963 + (-1.0);
    int _1989 = _1985;
    if (!_1873)
    {
        int _1991 = ~_1961;
        int _1993 = _1991 + 1;
        _1989 = _1993;
    }
    int _1995 = _1989;
    float _1997 = fma(_1969, _1893, _1979);
    int _1999 = abs(_1973);
    float _2001 = _1749 + _1745;
    float _2003 = float(_1995);
    float _2005 = _1749 + (-0.5);
    float _2007 = float(_1999);
    float _2009 = _2001 + (-1.0);
    float _2011 = float(_1951);
    float _2013 = _1965 * _2003;
    float _2015 = _1997 * 0.15915493667125701904296875;
    float _2017 = _2007 * _2011;
    float _2019 = _2013 * (-2.0);
    float _2021 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2023 = fma(_1977, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2021);
    float _2025 = fma(_1987, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _2027 = _2017 * (-2.0);
    float _2029 = fma(_2009, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2031 = _1745 + (-0.5);
    float _2033 = fma(_2019, _1897, _1897);
    float _2035 = fma(_2025, _2019, _2025);
    float _2037 = fma(_2027, _1901, _1901);
    float _2039 = 1.0 / _2023;
    float _2041 = fma(_2031, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2033);
    float _2043 = fma(_2029, _2027, _2029);
    float _2045 = fma(_2005, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2037);
    float _2047 = fma(_2035, _1893, _2041);
    float _2049 = fma(_2043, _1893, _2045);
    float _2051 = _2015 * 6.283185482025146484375;
    float _2053 = sin(_2051);
    float _2055 = _2047 * 0.15915493667125701904296875;
    float _2057 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1607);
    float _2059 = _2049 * 0.15915493667125701904296875;
    float _2061 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1659);
    float _2063 = _2057 * _1757;
    float _2065 = _1773 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _2067 = _2055 * 6.283185482025146484375;
    float _2069 = cos(_2067);
    float _2071 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2073 = _2039 * _2071;
    float _2075 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1605);
    float _2077 = _2061 * _1759;
    float _2079 = fma(_1723, (*spvDescriptorSet0.vp_c15)._m0[126].x, _2065);
    bool _2081 = _2073 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _2083 = _2075 * _1763;
    float _2085 = _2015 * 6.283185482025146484375;
    float _2087 = cos(_2085);
    bool _2089 = _2073 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _2091 = fma(_1725, (*spvDescriptorSet0.vp_c15)._m0[126].z, _2079);
    bool _2093 = !_2081;
    int _2095 = _2093 ? 0 : 1;
    float _2097 = _2091 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _2099 = _2059 * 6.283185482025146484375;
    float _2101 = cos(_2099);
    float _2103 = _2069 * _2053;
    if (!_2081)
    {
        _1863 = 1;
    }
    int _2105 = _1863;
    int _2107 = _2105;
    if (!_2089)
    {
        _2107 = _2095;
    }
    int _2109 = _2107;
    float _2111 = _2055 * 6.283185482025146484375;
    float _2113 = sin(_2111);
    float _2115 = _2069 * _2087;
    int _2117 = _2109 << 6;
    int _2119 = _2117 + 64;
    uint _2121 = uint(int(uint(_2119) >> uint(2)));
    uint _2123 = uint(int(uint(int(_2121)) >> uint(2)));
    int _2125 = int(_2121) & 3;
    float _2127 = (*spvDescriptorSet0.vp_c15)._m0[int(_2123)][_2125];
    int _2129 = int(_2121) + 1;
    uint _2131 = uint(int(uint(_2129) >> uint(2)));
    int _2133 = _2129 & 3;
    float _2135 = (*spvDescriptorSet0.vp_c15)._m0[int(_2131)][_2133];
    float _2137 = _2059 * 6.283185482025146484375;
    float _2139 = sin(_2137);
    float _2141 = _2069 * _2101;
    float _2143 = _2087 * _2101;
    float _2145 = _2141 * _2077;
    int _2147 = _2117 + 48;
    uint _2149 = uint(int(uint(_2147) >> uint(2)));
    uint _2151 = uint(int(uint(int(_2149)) >> uint(2)));
    int _2153 = int(_2149) & 3;
    float _2155 = (*spvDescriptorSet0.vp_c15)._m0[int(_2151)][_2153];
    int _2157 = int(_2149) + 1;
    uint _2159 = uint(int(uint(_2157) >> uint(2)));
    int _2161 = _2157 & 3;
    float _2163 = (*spvDescriptorSet0.vp_c15)._m0[int(_2159)][_2161];
    float _2165 = _2113 * _2087;
    float _2167 = _2113 * _2053;
    float _2169 = _2113 * _2101;
    float _2171 = _2053 * _2101;
    float _2173 = _1773 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _2175 = trunc(_2097);
    int _2177 = int(_2175);
    float _2179 = _2169 * _2077;
    float _2181 = fma(_1723, (*spvDescriptorSet0.vp_c15)._m0[127].x, _2173);
    float _2183 = fma(_2139, _2115, _2167);
    float _2185 = fma(_2139, _2167, _2115);
    float _2187 = -_2103;
    float _2189 = fma(_2139, _2165, _2187);
    float _2191 = fma(_1725, (*spvDescriptorSet0.vp_c15)._m0[127].z, _2181);
    float _2193 = -_2165;
    float _2195 = fma(_2139, _2103, _2193);
    int _2197 = _2117 + 96;
    uint _2199 = uint(int(uint(_2197) >> uint(2)));
    uint _2201 = uint(int(uint(int(_2199)) >> uint(2)));
    int _2203 = int(_2199) & 3;
    float _2205 = (*spvDescriptorSet0.vp_c15)._m0[int(_2201)][_2203];
    int _2207 = int(_2199) + 1;
    uint _2209 = uint(int(uint(_2207) >> uint(2)));
    int _2211 = _2207 & 3;
    float _2213 = (*spvDescriptorSet0.vp_c15)._m0[int(_2209)][_2211];
    float _2215 = -_2077;
    float _2217 = _2139 * _2215;
    float _2219 = fma(_2183, _2063, _2145);
    float _2221 = fma(_2189, _2063, _2179);
    float _2223 = _2191 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _2225 = fma(_2143, _2063, _2217);
    float _2227 = fma(_2195, _2083, _2219);
    float _2229 = fma(_2185, _2083, _2221);
    int _2231 = _2117 + 104;
    uint _2233 = uint(int(uint(_2231) >> uint(2)));
    uint _2235 = uint(int(uint(int(_2233)) >> uint(2)));
    int _2237 = int(_2233) & 3;
    float _2239 = (*spvDescriptorSet0.vp_c15)._m0[int(_2235)][_2237];
    int _2241 = int(_2233) + 1;
    uint _2243 = uint(int(uint(_2241) >> uint(2)));
    int _2245 = _2241 & 3;
    float _2247 = (*spvDescriptorSet0.vp_c15)._m0[int(_2243)][_2245];
    float _2249 = fma(_2171, _2083, _2225);
    float _2251 = _2227 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _2253 = _2227 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _2255 = trunc(_2223);
    int _2257 = int(_2255);
    int _2259 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _2261 = _2177 + _2259;
    int _2263 = _2261 + 1;
    float _2265 = fma(_2249, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2251);
    float _2267 = fma(_2249, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2253);
    int _2269 = _2117 + 56;
    uint _2271 = uint(int(uint(_2269) >> uint(2)));
    uint _2273 = uint(int(uint(int(_2271)) >> uint(2)));
    int _2275 = int(_2271) & 3;
    float _2277 = (*spvDescriptorSet0.vp_c15)._m0[int(_2273)][_2275];
    int _2279 = int(_2271) + 1;
    uint _2281 = uint(int(uint(_2279) >> uint(2)));
    int _2283 = _2279 & 3;
    float _2285 = (*spvDescriptorSet0.vp_c15)._m0[int(_2281)][_2283];
    bool _2287 = _2263 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _2289 = fma(_2229, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2265);
    float _2291 = fma(_2229, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2267);
    float _2293 = _2227 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2295 = _1725 + _2289;
    float _2297 = _1723 + _2291;
    int _2299 = _2117 + 72;
    uint _2301 = uint(int(uint(_2299) >> uint(2)));
    uint _2303 = uint(int(uint(int(_2301)) >> uint(2)));
    int _2305 = int(_2301) & 3;
    float _2307 = (*spvDescriptorSet0.vp_c15)._m0[int(_2303)][_2305];
    int _2309 = int(_2301) + 1;
    uint _2311 = uint(int(uint(_2309) >> uint(2)));
    int _2313 = _2309 & 3;
    float _2315 = (*spvDescriptorSet0.vp_c15)._m0[int(_2311)][_2313];
    float _2317 = _1773 * _2135;
    float _2319 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2321 = _2295 + _2319;
    float _2323 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2325 = _2297 + _2323;
    int _2327 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _2329 = _2257 + _2327;
    int _2331 = _2329 + 1;
    float _2333 = fma(_2249, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2293);
    float _2335 = _2321 * _2321;
    int _2337 = _2117 + 80;
    uint _2339 = uint(int(uint(_2337) >> uint(2)));
    uint _2341 = uint(int(uint(int(_2339)) >> uint(2)));
    int _2343 = int(_2339) & 3;
    float _2345 = (*spvDescriptorSet0.vp_c15)._m0[int(_2341)][_2343];
    int _2347 = int(_2339) + 1;
    uint _2349 = uint(int(uint(_2347) >> uint(2)));
    int _2351 = _2347 & 3;
    float _2353 = (*spvDescriptorSet0.vp_c15)._m0[int(_2349)][_2351];
    int _2355 = _2263 | _2331;
    float _2357 = fma(_2325, _2325, _2335);
    float _2359 = _1773 * _2163;
    float _2361 = fma(_2229, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2333);
    bool _2363 = _2355 < 0;
    bool _2365 = _2363 || _2287;
    float _2367 = sqrt(_2357);
    float _2369 = fma(_1723, _2155, _2359);
    bool _2371 = _2331 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _2373 = _2371 || _2365;
    float _2375 = _1773 * _2213;
    float _2377 = fma(_1723, _2205, _2375);
    float _2379 = fma(_1723, _2127, _2317);
    int _2381 = _2263;
    int _2383 = as_type<int>(_2359);
    float _2385 = _2295;
    float _2387 = _2297;
    if (!_2373)
    {
        int _2389 = _2331 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _2391 = _2389 + _2263;
        _2381 = _2391;
    }
    int _2393 = _2381;
    bool _2395 = _2367 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2397 = fma(_1725, _2239, _2377);
    float _2399 = 0.0;
    int _2401 = as_type<int>(_2239);
    float _2403 = _2397;
    if (!_2373)
    {
        float _2405 = floor(_2097);
        _2399 = _2405;
    }
    float _2407 = _2399;
    if (!_2373)
    {
        int _2409 = _2393 << 2;
        _2383 = _2409;
    }
    int _2411 = _2383;
    float _2413 = _2397 + _2247;
    int _2415 = _2411;
    if (!_2373)
    {
        uint _2417 = uint(int(uint(_2393) >> uint(2)));
        _2401 = int(_2417);
    }
    int _2419 = _2401;
    float _2421 = as_type<float>(_2419);
    if (!_2373)
    {
        int _2423 = 12 & _2411;
        _2415 = _2423;
    }
    int _2425 = _2415;
    float _2427 = fma(_1725, _2277, _2369);
    float _2429 = 1.0 / _2413;
    if (!_2373)
    {
        int _2431 = _2419 << 4;
        int _2433 = _2431 + _2425;
        _2421 = as_type<float>(_2433);
    }
    float _2435 = _2421;
    float _2437 = _2427 + _2285;
    if (!_2395)
    {
        _2403 = _2297;
    }
    float _2439 = _2403;
    float _2441 = fma(_1725, _2307, _2379);
    float _2443 = _1769 + _2361;
    float _2445 = _2441 + _2315;
    bool _2447 = !_2395;
    float _2449 = _2443;
    float _2451 = _2439;
    float _2453 = _2353;
    if (!_2447)
    {
        float _2455 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2457 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2459 = _2367 + _2457;
        float _2461 = _2443 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2463 = rsqrt(_2357);
        float _2465 = _2459 * _2455;
        float _2467 = _2465 * 0.15915493667125701904296875;
        float _2469 = _2467 * 6.283185482025146484375;
        float _2471 = cos(_2469);
        float _2473 = _2467 * 6.283185482025146484375;
        float _2475 = sin(_2473);
        float _2477 = _2471 + (-1.0);
        float _2479 = _2477 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2481 = fma(_2475, _2461, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2483 = fma(_2443, _2471, _2479);
        float _2485 = _2463 * _2481;
        float _2487 = fma(_2325, _2485, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2489 = fma(_2321, _2485, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2449 = _2483;
        _2451 = _2487;
        _2385 = _2489;
    }
    float _2491 = _2449;
    float _2493 = _2451;
    float _2495 = _2385;
    float _2497 = _2435;
    if (!_2373)
    {
        int _2499 = as_type<int>(_2435) + 400;
        uint _2501 = uint(int(uint(_2499) >> uint(2)));
        uint _2503 = uint(int(uint(int(_2501)) >> uint(2)));
        int _2505 = int(_2501) & 3;
        float _2507 = (*spvDescriptorSet0.vp_c15)._m0[int(_2503)][_2505];
        _2497 = _2507;
    }
    float _2509 = _2497;
    float _2511 = _2491 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2513 = _2491 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2515 = _2437 * _2429;
    float _2517 = _2491 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2519 = fma(_2493, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2511);
    float _2521 = fma(_2493, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2513);
    float _2523 = _2491 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    int _2525 = _2117 + 88;
    uint _2527 = uint(int(uint(_2525) >> uint(2)));
    uint _2529 = uint(int(uint(int(_2527)) >> uint(2)));
    int _2531 = int(_2527) & 3;
    float _2533 = (*spvDescriptorSet0.vp_c15)._m0[int(_2529)][_2531];
    int _2535 = int(_2527) + 1;
    uint _2537 = uint(int(uint(_2535) >> uint(2)));
    int _2539 = _2535 & 3;
    float _2541 = (*spvDescriptorSet0.vp_c15)._m0[int(_2537)][_2539];
    float _2543 = fma(_2495, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2519);
    bool _2545 = _2515 >= 0.0;
    float _2547 = fma(_2493, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2517);
    float _2549 = fma(_2495, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2521);
    float _2551 = _2543 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2553 = _2445 * _2429;
    bool _2555 = _2515 <= 1.0;
    bool _2557 = _2555 && _2545;
    float _2559 = fma(_2495, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2547);
    float _2561 = _2549 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2563 = fma(_2493, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2523);
    float _2565 = _2551 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2567 = _2559 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    bool _2569 = _2553 >= 0.0;
    bool _2571 = _2569 && _2557;
    float _2573 = fma(_2495, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2563);
    float _2575 = fma(_2561, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2565);
    float _2577 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2579 = _2567 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    bool _2581 = _2553 <= 1.0;
    bool _2583 = _2581 && _2571;
    float _2585 = _2573 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2587 = fma(_2567, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2575);
    float _2589 = -_2579;
    float _2591 = fma(_2589, _2577, 1.0);
    float _2593 = _2361;
    if (!_2373)
    {
        float _2595 = floor(_2223);
        _2593 = _2595;
    }
    float _2597 = _2593;
    float _2599 = _2551 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2601 = fma(_2585, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2587);
    float _2603 = _2551 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2605 = _1773 * _2353;
    float _2607 = fma(_2561, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2599);
    float _2609 = fma(_2561, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2603);
    float _2611 = log2(_2591);
    if (_2583)
    {
        float _2613 = float(_2109);
        _2453 = _2613;
    }
    float _2615 = _2453;
    float _2617 = fma(_1723, _2345, _2605);
    float _2619 = fma(_2567, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2607);
    float _2621 = fma(_2567, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2609);
    float _2623 = fma(_2585, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2619);
    float _2625 = 1.0 / _2601;
    float _2627 = _2597;
    float _2629 = _2621;
    if (!_2373)
    {
        float _2631 = -_2597;
        float _2633 = _2223 + _2631;
        _2627 = _2633;
    }
    float _2635 = _2627;
    float _2637 = fma(_2585, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2621);
    float _2639 = _2605;
    if (_2583)
    {
        float _2641 = rint(_2615);
        float _2643 = precise::max(_2641, 0.0);
        uint _2645 = uint(_2643);
        uint _2647 = clamp(_2645, 0u, 65535u);
        _2639 = as_type<float>(_2647);
    }
    float _2649 = _2639;
    float _2651 = _2611 * 0.693147182464599609375;
    float _2653 = fma(_1725, _2533, _2617);
    float _2655 = _2651 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2657 = _2653 + _2541;
    float _2659 = _2651;
    if (!_2373)
    {
        float _2661 = -_2407;
        float _2663 = _2097 + _2661;
        _2659 = _2663;
    }
    float _2665 = _2659;
    float _2667 = _2509;
    if (!_2373)
    {
        float _2669 = rint(_2509);
        float _2671 = precise::max(_2669, 0.0);
        uint _2673 = uint(_2671);
        uint _2675 = clamp(_2673, 0u, 65535u);
        _2667 = as_type<float>(_2675);
    }
    float _2677 = _2667;
    float _2679 = _2623 * _2625;
    float _2681 = _2637 * _2625;
    float _2683 = _2657 * _2429;
    float _2685 = fma(_2679, 0.5, 0.5);
    float _2687 = fma(_2681, -0.5, 0.5);
    float _2689 = _2553;
    float _2691 = _2681;
    if (_2583)
    {
        float3 _7681 = float3(_2515, _2553, float(as_type<int>(_2649)));
        float3 _7685 = select(_7681, float3(0.0), isnan(_7681));
        float _2693 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _7685.xy, uint(rint(_7685.z)), _2683, level(0.0));
        _2689 = _2693;
    }
    float _2695 = _2689;
    float3 _7695 = float3(_2685, _2687, _2655);
    float _2697 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7695, float3(0.0), isnan(_7695)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7695, float3(0.0), isnan(_7695)), level(0.0)).x;
    float3 _7704 = float3(_2685, _2687, _2655);
    float4 _2699 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7704, float3(0.0), isnan(_7704)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7704, float3(0.0), isnan(_7704)), level(0.0)).xyzw;
    float _2701 = _2699.x;
    float _2703 = _2699.y;
    float _2705 = _2699.z;
    float _2707 = _2699.w;
    float _2709 = _2407;
    if (!_2373)
    {
        float3 _7727 = float3(_2665, _2635, float(as_type<int>(_2677)));
        float3 _7729 = select(_7727, float3(0.0), isnan(_7727));
        float _2711 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _7729.xy, uint(rint(_7729.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _7729.xy, uint(rint(_7729.z)), level(0.0)).x;
        _2709 = _2711;
    }
    float _2713 = _2709;
    if (_2373)
    {
        _2691 = 1.0;
    }
    float _2715 = _2691;
    float _2717 = _2715;
    if (!_2373)
    {
        int _2719 = _2393 << 4;
        int _2721 = _2719 + 2048;
        uint _2723 = uint(int(uint(_2721) >> uint(2)));
        uint _2725 = uint(int(uint(int(_2723)) >> uint(2)));
        int _2727 = int(_2723) & 3;
        float _2729 = (*spvDescriptorSet0.vp_c15)._m0[int(_2725)][_2727];
        int _2731 = int(_2723) + 1;
        uint _2733 = uint(int(uint(_2731) >> uint(2)));
        int _2735 = _2731 & 3;
        float _2737 = (*spvDescriptorSet0.vp_c15)._m0[int(_2733)][_2735];
        int _2739 = _2721 + 8;
        uint _2741 = uint(int(uint(_2739) >> uint(2)));
        uint _2743 = uint(int(uint(int(_2741)) >> uint(2)));
        int _2745 = int(_2741) & 3;
        float _2747 = (*spvDescriptorSet0.vp_c15)._m0[int(_2743)][_2745];
        int _2749 = int(_2741) + 1;
        uint _2751 = uint(int(uint(_2749) >> uint(2)));
        int _2753 = _2749 & 3;
        float _2755 = (*spvDescriptorSet0.vp_c15)._m0[int(_2751)][_2753];
        float _2757 = _1773 * _2737;
        float _2759 = fma(_1723, _2729, _2757);
        float _2761 = fma(_1725, _2747, _2759);
        float _2763 = _2761 + _2755;
        float _2765 = precise::clamp(_2763, 0.0, 1.0);
        float _2767 = -_2765;
        float _2769 = _2767 + _2713;
        float _2771 = fma(_2769, 500.0, 1.5);
        float _2773 = exp2(_2771);
        float _2775 = 0.0 + _2773;
        float _2777 = precise::clamp(_2775, 0.0, 1.0);
        _2717 = _2777;
    }
    float _2779 = _2717;
    float _2781 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2783 = _2491 + _2781;
    float _2785 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2787 = _2493 + _2785;
    float _2789 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2791 = _2495 + _2789;
    float _2793 = _2783 * _2783;
    float _2795 = fma(_2787, _2787, _2793);
    float _2797 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2799 = fma(_2791, _2791, _2795);
    float _2801 = rsqrt(_2799);
    float _2803 = sqrt(_2799);
    float _2805 = _2787 * _2801;
    float _2807 = _2791 * _2801;
    float _2809 = _2783 * _2801;
    float _2811 = precise::max(0.0, _2797);
    float _2813 = _2805 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2815 = _2807 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2817 = _2813 * _2813;
    float _2819 = _2815 * _2815;
    float _2821 = -_2809;
    float _2823 = -_2811;
    float _2825 = fma(_2821, (*spvDescriptorSet0.vp_c15)._m0[24].y, _2823);
    float _2827 = _2817 + _2819;
    float _2829 = sqrt(_2827);
    bool _2831 = _2829 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2833 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2835 = _2829 + _2833;
    float _2837 = _2713;
    float _2839 = _2827;
    float _2841 = _2835;
    float _2843 = _2797;
    float _2845 = _2813;
    float _2847 = _2815;
    float _2849 = _2817;
    float _2851 = _2819;
    float _2853 = _2825;
    if (_2831)
    {
        float _2855 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2837 = _2855;
    }
    float _2857 = _2837;
    if (_2831)
    {
        float _2859 = _2825 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2629 = _2859;
    }
    float _2861 = _2629;
    float _2863 = _2861;
    if (_2831)
    {
        float _2865 = rsqrt(_2827);
        _2839 = _2865;
    }
    float _2867 = _2839;
    if (_2831)
    {
        float _2869 = _2835 * _2857;
        _2841 = _2869;
    }
    float _2871 = _2841;
    if (_2831)
    {
        float _2873 = _2871 * 0.15915493667125701904296875;
        _2387 = _2873;
    }
    float _2875 = _2387;
    float _2877 = _2857;
    if (_2831)
    {
        float _2879 = _2875 * 6.283185482025146484375;
        float _2881 = sin(_2879);
        _2877 = _2881;
    }
    float _2883 = _2877;
    float _2885 = _2871;
    if (_2831)
    {
        float _2887 = _2875 * 6.283185482025146484375;
        float _2889 = cos(_2887);
        _2885 = _2889;
    }
    float _2891 = _2885;
    float _2893 = _2883;
    if (_2831)
    {
        float _2895 = fma(_2883, _2861, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2893 = _2895;
    }
    float _2897 = _2893;
    float _2899 = _2897;
    if (_2831)
    {
        float _2901 = _2867 * _2897;
        _2899 = _2901;
    }
    float _2903 = _2899;
    if (_2831)
    {
        float _2905 = _2891 + (-1.0);
        _2843 = _2905;
    }
    float _2907 = _2843;
    if (_2831)
    {
        float _2909 = _2813 * _2903;
        _2845 = _2909;
    }
    float _2911 = _2845;
    if (_2831)
    {
        float _2913 = _2815 * _2903;
        _2847 = _2913;
    }
    float _2915 = _2847;
    if (_2831)
    {
        float _2917 = _2907 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2863 = _2917;
    }
    float _2919 = _2863;
    if (_2831)
    {
        float _2921 = _2911 * _2911;
        _2849 = _2921;
    }
    float _2923 = _2849;
    if (_2831)
    {
        float _2925 = _2915 * _2915;
        _2851 = _2925;
    }
    float _2927 = _2851;
    if (_2831)
    {
        float _2929 = fma(_2825, _2891, _2919);
        _2853 = _2929;
    }
    float _2931 = _2853;
    float _2933 = fma(_2931, _2931, _2923);
    float _2935 = _2933 + _2927;
    float _2937 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2939 = fma(_2803, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2937);
    float _2941 = precise::clamp(_2939, 0.0, 1.0);
    float _2943 = -_2941;
    float _2945 = _2943 + 1.0;
    float _2947 = rsqrt(_2935);
    float _2949 = _2947 * _2911;
    float _2951 = _2947 * _2931;
    float _2953 = _2947 * _2915;
    float _2955 = _2949 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2957 = abs(_2945);
    float _2959 = log2(_2957);
    float _2961 = -_2955;
    float _2963 = fma(_2951, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2961);
    float _2965 = -_2953;
    float _2967 = fma(_2965, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2963);
    float _2969 = _2951 + 1.0;
    float _2971 = fma(_2967, -0.5, 0.5);
    float _2973 = fma(_2967, 0.5, 0.5);
    float _2975 = fma(_2973, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2977 = _2959 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2979 = sqrt(_2971);
    float _2981 = fma(_2973, _2975, -0.212114393711090087890625);
    float _2983 = fma(_2973, _2981, 1.570728778839111328125);
    float _2985 = exp2(_2977);
    float _2987 = _2979 * 0.636619746685028076171875;
    float _2989 = -_2951;
    float _2991 = fma(_2985, _2969, _2989);
    float _2993 = -_2983;
    float _2995 = fma(_2987, _2993, 1.0);
    float _2997 = fma(_2991, 0.5, 0.5);
    float2 _8172 = float2(_2995, _2997);
    float3 _3001 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8172, float2(0.0), isnan(_8172)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8172, float2(0.0), isnan(_8172)), level(0.0)).xyz;
    float _3003 = _3001.x;
    float _3005 = _3001.y;
    float _3007 = _3001.z;
    float _3009 = _1657 * _1709;
    float _3011 = _1637 * 2.0;
    float _3013 = _1625 * 3.883221149444580078125;
    bool _3015 = _1659 != 0.0;
    bool _3017 = isnan(_1659);
    bool _3019 = _3015 || _3017;
    bool _3021 = isnan(0.0);
    bool _3023 = _3019 || _3021;
    float _3025 = -_1445;
    float _3027 = _3025 + _1627;
    float _3029 = -_3011;
    float _3031 = fma(_3009, _3029, _3009);
    float _3033 = _3013 * 0.15915493667125701904296875;
    bool _3035 = _1607 == 0.0;
    bool _3037 = !_3023;
    bool _3039 = _3035 && _3037;
    float _3041 = abs(_2073);
    float _3043 = log2(_3041);
    float _3045 = fma(_1637, 3.1415927410125732421875, _3031);
    float _3047 = fma(_1573, _3027, _1445);
    bool _3049 = _1605 == 0.0;
    bool _3051 = _3049 && _3039;
    float _3053 = _2959 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3055 = _3045 * 0.15915493667125701904296875;
    float _3057 = -_1743;
    float _3059 = _3057 + 1.0;
    float _3061 = _3033 * 6.283185482025146484375;
    float _3063 = cos(_3061);
    bool _3065 = _2073 <= 8000.0;
    bool _3067 = isnan(_2073);
    bool _3069 = _3065 || _3067;
    bool _3071 = isnan(8000.0);
    bool _3073 = _3069 || _3071;
    float _3075 = float(_3073);
    out.m_77.x = _1406;
    out.m_77.y = _1410;
    out.m_79.x = _2493;
    out.m_79.y = _2491;
    out.m_79.z = _2495;
    float _3077 = _3055 * 6.283185482025146484375;
    float _3079 = sin(_3077);
    float _3081 = _3043 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3083 = _3047;
    if (!_3051)
    {
        float _3085 = fma(_1659, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3047);
        _3083 = _3085;
    }
    float _3087 = _3083;
    float _3089 = -_3087;
    float _3091 = _2139 * _3089;
    float _3093 = _2141 * _3087;
    float _3095 = _3033 * 6.283185482025146484375;
    float _3097 = sin(_3095);
    float _3099 = _2169 * _3087;
    float _3101 = exp2(_3081);
    float _3103 = -_1579;
    float _3105 = fma(_3079, _3063, _3103);
    float _3107 = fma(_1573, _3105, _1579);
    float _3109 = -_1581;
    float _3111 = fma(_3079, _3097, _3109);
    float _3113 = _3107;
    if (!_3051)
    {
        float _3115 = fma(_1607, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3107);
        _3113 = _3115;
    }
    float _3117 = _3113;
    float _3119 = exp2(_3053);
    float _3121 = fma(_1573, _3111, _1581);
    float _3123 = fma(_2183, _3117, _3093);
    float _3125 = fma(_2143, _3117, _3091);
    float _3127 = fma(_2189, _3117, _3099);
    float _3129 = fma(_3101, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3131 = precise::clamp(_3129, 0.0, 1.0);
    float _3133 = _3121;
    if (!_3051)
    {
        float _3135 = fma(_1605, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3121);
        _3133 = _3135;
    }
    float _3137 = _3133;
    bool _3139 = _2803 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3141 = isnan(_2803);
    bool _3143 = _3139 || _3141;
    bool _3145 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3147 = _3143 || _3145;
    float _3149 = in.m_81.w;
    float _3151 = fma(_3131, -2.0, 3.0);
    float _3153 = _3131 * _3131;
    float _3155 = fma(_2195, _3137, _3123);
    float _3157 = fma(_2171, _3137, _3125);
    float _3159 = fma(_2185, _3137, _3127);
    float _3161 = _3153 * _3151;
    float _3163 = _3155 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _3165 = _3155 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _3167 = _2551 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3169 = -_3119;
    float _3171 = _3169 + 1.0;
    float _3173 = fma(_3157, (*spvDescriptorSet0.vp_c10)._m0[8].x, _3163);
    float _3175 = fma(_3157, (*spvDescriptorSet0.vp_c10)._m0[9].x, _3165);
    float _3177 = fma(_2561, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3167);
    float _3179 = _3167;
    if (!_2583)
    {
        _3179 = 1.0;
    }
    float _3181 = _3179;
    float _3183 = fma(_3159, (*spvDescriptorSet0.vp_c10)._m0[8].z, _3173);
    float _3185 = -_3161;
    float _3187 = _3185 + 1.0;
    float _3189 = fma(_2567, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3177);
    float _3191 = _3181;
    if (_2583)
    {
        bool _3193 = _2695 >= _2683;
        bool _3195 = isnan(_2695);
        bool _3197 = _3193 || _3195;
        bool _3199 = isnan(_2683);
        bool _3201 = _3197 || _3199;
        float _3203 = float(_3201);
        _3191 = _3203;
    }
    float _3205 = _3191;
    float _3207 = _3171 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3209 = fma(_3187, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3161);
    float _3211 = fma(_2585, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3189);
    float _3213 = _3155 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _3215 = _3207 * _2697;
    float _3217 = _3075 * _3209;
    float _3219 = _3211 + _2601;
    float _3221 = _3205 * _2779;
    float _3223 = fma(_3157, (*spvDescriptorSet0.vp_c10)._m0[10].x, _3213);
    float _3225 = _3217 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.gl_Position.x = _2623;
    out.gl_Position.y = _2637;
    out.gl_Position.z = _3211;
    out.gl_Position.w = _2601;
    float _3227 = _3219 * 0.5;
    float _3229 = -_3207;
    float _3231 = _3229 + 1.0;
    float _3233 = _3059 * _3225;
    float _3235 = precise::clamp(_3233, 0.0, 1.0);
    float _3237 = fma(_3159, (*spvDescriptorSet0.vp_c10)._m0[9].z, _3175);
    float _3239 = fma(_3159, (*spvDescriptorSet0.vp_c10)._m0[10].z, _3223);
    float _3241 = -_3235;
    float _3243 = fma(_3241, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    out.m_83.w = _3149;
    float _3245 = _3225;
    float _3247 = _3221;
    float _3249 = _3231;
    float _3251 = _3227;
    float _3253 = _2601;
    if (!_3147)
    {
        _3245 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3255 = _3245;
    float _3257 = -_3221;
    float _3259 = fma(_3257, _3243, 1.0);
    float _3261 = precise::clamp(_3259, 0.0, 1.0);
    out.m_85.x = _3183;
    out.m_85.y = _3237;
    out.m_85.z = _3239;
    float _3263 = _3261;
    float _3265 = _3255;
    float _3267 = _3255;
    if (!_3147)
    {
        _3247 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3269 = _3247;
    float _3271 = _2707 * _3215;
    float _3273 = _2707 * _3231;
    float _3275 = _3261 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_87.z = _3227;
    out.m_87.w = _2601;
    float _3277 = _3269;
    float _3279 = _3269;
    if (!_3147)
    {
        _3249 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3281 = _3249;
    float _3283 = _3281;
    float _3285 = _3281;
    if (!_3147)
    {
        _3263 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3287 = _3263;
    out.m_89.x = _3275;
    float _3289 = _3287;
    float _3291 = _3287;
    if (!_3147)
    {
        _3251 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3293 = _3251;
    float _3295 = _3293;
    float _3297 = _3293;
    if (!_3147)
    {
        _3253 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3299 = _3253;
    float _3301 = _3007 * _3215;
    float _3303 = fma(_3003, _3271, _2701);
    float _3305 = fma(_3005, _3271, _2703);
    float _3307 = fma(_2707, _3301, _2705);
    out.m_91.x = _3303;
    out.m_91.y = _3305;
    out.m_91.z = _3307;
    out.m_91.w = _3273;
    bool _3309 = !_3147;
    float _3311 = _3299;
    float _3313 = _3299;
    if (!_3309)
    {
        bool _3315 = _2803 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3317 = isnan(_2803);
        bool _3319 = _3315 || _3317;
        bool _3321 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3323 = _3319 || _3321;
        if (!_3323)
        {
            float _3325 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3327 = _2803 + _3325;
            float _3329 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3331 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3329;
            float _3333 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3335 = _3333 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3337 = 1.0 / _3331;
            float _3339 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3341 = _3339 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3343 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3345 = _3343 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3347 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3349 = _3347 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3351 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3353 = _3351 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3355 = _3327 * _3337;
            float _3357 = precise::clamp(_3355, 0.0, 1.0);
            float _3359 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3361 = _3359 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3363 = fma(_3357, _3335, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3365 = fma(_3357, _3361, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3367 = fma(_3357, _3341, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3369 = fma(_3357, _3345, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3371 = fma(_3357, _3349, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3373 = fma(_3357, _3353, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3313 = _3363;
            _3285 = _3371;
            _3297 = _3367;
            _3279 = _3369;
            _3267 = _3365;
            _3291 = _3373;
            _3375 = true;
        }
        else
        {
            bool _3377 = _2803 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3379 = isnan(_2803);
            bool _3381 = _3377 || _3379;
            bool _3383 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3385 = _3381 || _3383;
            if (!_3385)
            {
                _3295 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3387 = _3295;
            _3297 = _3387;
            if (!_3385)
            {
                _3311 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3389 = _3311;
            _3313 = _3389;
            if (!_3385)
            {
                _3265 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3391 = _3265;
            _3267 = _3391;
            if (!_3385)
            {
                _3277 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3393 = _3277;
            _3279 = _3393;
            if (!_3385)
            {
                _3283 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3395 = _3283;
            _3285 = _3395;
            if (!_3385)
            {
                _3289 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3397 = _3289;
            bool _3399 = !_3385;
            _3291 = _3397;
            if (!_3399)
            {
                bool _3401 = _2803 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3403 = isnan(_2803);
                bool _3405 = _3401 || _3403;
                bool _3407 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3409 = _3405 || _3407;
                if (!_3409)
                {
                    float _3411 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3413 = _2803 + _3411;
                    float _3415 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3417 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3415;
                    float _3419 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3421 = _3419 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3423 = 1.0 / _3417;
                    float _3425 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3427 = _3425 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3429 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3431 = _3429 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3433 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3435 = _3433 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3437 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3439 = _3437 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3441 = _3413 * _3423;
                    float _3443 = precise::clamp(_3441, 0.0, 1.0);
                    float _3445 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3447 = _3445 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3449 = fma(_3443, _3421, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3451 = fma(_3443, _3447, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3453 = fma(_3443, _3427, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3455 = fma(_3443, _3431, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3457 = fma(_3443, _3435, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3459 = fma(_3443, _3439, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3313 = _3449;
                    _3285 = _3457;
                    _3297 = _3453;
                    _3279 = _3455;
                    _3267 = _3451;
                    _3291 = _3459;
                    _3375 = true;
                }
                else
                {
                    _3313 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3285 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3297 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3279 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3267 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3291 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3375 = false;
    float _3461 = _3313;
    float _3463 = _3285;
    float _3465 = _3297;
    float _3467 = _3279;
    float _3469 = _3267;
    float _3471 = _3291;
    float _3473 = fma(_3237, -0.5, 0.5);
    float _3475 = precise::clamp(_3473, 0.0, 1.0);
    float _3477 = -_3461;
    float _3479 = _3477 + _3463;
    float _3481 = -_3465;
    float _3483 = _3481 + _3467;
    float _3485 = -_3469;
    float _3487 = _3485 + _3471;
    bool _3489 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3491 = fma(_3475, _3479, _3461);
    float _3493 = fma(_3475, _3483, _3465);
    float _3495 = fma(_3475, _3487, _3469);
    float _3497 = _3491 * 0.586610972881317138671875;
    out.m_61.x = 1.0;
    float _3499 = fma(_3493, 0.298911988735198974609375, _3497);
    float _3501 = fma(_3495, 0.114477999508380889892578125, _3499);
    out.m_93.x = 0.0;
    float _3503 = -_3501;
    float _3505 = _3493 + _3503;
    float _3507 = -_3501;
    float _3509 = _3491 + _3507;
    float _3511 = -_3501;
    float _3513 = _3495 + _3511;
    float _3515 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3517 = fma(_3505, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3501);
    float _3519 = fma(_3509, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3501);
    float _3521 = fma(_3513, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3501);
    out.m_95.x = 0.0;
    out.m_89.w = _3515;
    out.m_97.x = _3517;
    out.m_97.y = _3519;
    out.m_97.z = _3521;
    if (!_3489)
    {
        return out;
    }
    float _3523 = -_2491;
    float _3525 = _3523 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _3527 = -_2493;
    float _3529 = _3527 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _3531 = -_2495;
    float _3533 = _3531 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _3535 = _3525 * _3525;
    float _3537 = fma(_3529, _3529, _3535);
    float _3539 = fma(_3533, _3533, _3537);
    float _3541 = rsqrt(_3539);
    float _3543 = sqrt(_3539);
    float _3545 = _3525 * _3541;
    float _3547 = _3529 * _3541;
    float _3549 = _3533 * _3541;
    float _3551 = -_2809;
    float _3553 = _3551 + _3545;
    float _3555 = -_2805;
    float _3557 = _3555 + _3547;
    float _3559 = -_2807;
    float _3561 = _3559 + _3549;
    float _3563 = _3553 * _3553;
    float _3565 = -_3543;
    float _3567 = _3565 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3569 = fma((*spvDescriptorSet0.vp_c13)._m0[4].y, (*spvDescriptorSet0.vp_c13)._m0[4].y, 0.00999999977648258209228515625);
    float _3571 = precise::clamp(_3569, 0.0, 1.0);
    float _3573 = fma(_3557, _3557, _3563);
    float _3575 = _3567 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _3577 = precise::clamp(_3575, 0.0, 1.0);
    float _3579 = _3571 * _3571;
    float _3581 = fma(_3561, _3561, _3573);
    float _3583 = _3579 + (-1.0);
    float _3585 = abs(_3577);
    float _3587 = log2(_3585);
    float _3589 = rsqrt(_3581);
    float _3591 = _3587 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _3593 = exp2(_3591);
    float _3595 = _3553 * _3589;
    float _3597 = _3557 * _3589;
    float _3599 = _3561 * _3589;
    float _3601 = _3547 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _3603 = _3237 * _3595;
    float _3605 = _3237 * _3545;
    float _3607 = fma(_3183, _3597, _3603);
    float _3609 = fma(_3183, _3547, _3605);
    float _3611 = fma(_3239, _3599, _3607);
    float _3613 = precise::clamp(_3611, 0.0, 1.0);
    float _3615 = fma(_3239, _3549, _3609);
    float _3617 = precise::clamp(_3615, 0.0, 1.0);
    float _3619 = _3613 * _3613;
    float _3621 = fma(_3619, _3583, 1.0);
    float _3623 = -_3545;
    float _3625 = -_3601;
    float _3627 = fma(_3623, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3625);
    float _3629 = _3621 * _3621;
    float _3631 = -_3549;
    float _3633 = fma(_3631, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3627);
    float _3635 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _3637 = _3633 + _3635;
    float _3639 = 1.0 / _3629;
    float _3641 = _3637 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _3643 = precise::clamp(_3641, 0.0, 1.0);
    float _3645 = _3593 * _3643;
    float _3647 = _3617 * _3645;
    float _3649 = _3647 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _3651 = _3579 * _3639;
    float _3653 = _3647 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3655 = _3647 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    float _3657 = _3647 * _3651;
    out.m_93.x = _3649;
    out.m_93.y = _3653;
    out.m_93.z = _3655;
    float _3659 = _3657 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _3661 = _3657 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3663 = _3657 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_95.x = _3659;
    out.m_95.y = _3661;
    out.m_95.z = _3663;
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
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3375 = false;
    bool _1685 = false;
    bool _1497 = false;
    bool _945 = false;
    bool _703 = false;
    bool _319 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _117 = in.m_58.w;
    float _119 = trunc(_117);
    int _121 = int(_119);
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
        float _3720 = as_type<float>(_137);
        out.gl_Position.z = _3720;
    }
    if (!_125)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _141 = in.m_63.w;
    bool _143 = _141 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _145 = isnan(_141);
    bool _147 = _143 || _145;
    bool _149 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _151 = _147 || _149;
    float _153 = -_141;
    float _155 = _153 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _157 = _155;
    if (_151)
    {
        float _159 = float(_121);
        _131 = _159;
    }
    float _161 = _131;
    bool _163 = _155 >= _161;
    bool _165 = !_151;
    bool _167 = _163 || _165;
    float _169 = _161;
    if (_167)
    {
        _169 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _171 = _169;
    if (_167)
    {
        out.m_61.x = 0.0;
    }
    if (_167)
    {
        float _173 = _171 * 5.0;
        _139 = as_type<int>(_173);
    }
    int _175 = _139;
    if (_167)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3790 = as_type<float>(_175);
        out.gl_Position.z = _3790;
    }
    if (_167)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _177 = in.m_65.w;
    float _179 = _155 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _181 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _183 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _185 = _181 || _183;
    bool _187 = isnan(1.0);
    bool _189 = _185 || _187;
    float _191 = in.m_63.x;
    float _193 = in.m_63.y;
    float _195 = in.m_63.z;
    float _197 = in.m_58.x;
    float _199 = in.m_58.y;
    float _201 = in.m_58.z;
    float _203 = 0.0;
    float _205 = _179;
    if (!_189)
    {
        float _207 = _179 * _179;
        float _209 = _207 * 0.5;
        _203 = _209;
    }
    float _211 = _203;
    float _213 = _211;
    if (!_189)
    {
        float _215 = _211 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _213 = _215;
    }
    float _217 = _213;
    bool _219 = !_189;
    float _221 = _217;
    if (!_219)
    {
        float _223 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _225 = log2(_223);
        float _227 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _229 = _227 + 1.0;
        float _231 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _233 = _179 * _225;
        float _235 = 1.0 / _229;
        float _237 = _231 * 0.693147182464599609375;
        float _239 = exp2(_233);
        float _241 = 1.0 / _237;
        float _243 = _239 + (-1.0);
        float _245 = -_243;
        float _247 = fma(_245, _241, _179);
        float _249 = _247 * _235;
        float _251 = _249 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _221 = _251;
    }
    float _253 = _221;
    bool _255 = !_189;
    if (!_255)
    {
        float _257 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _259 = log2(_257);
        float _261 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _263 = _261 + 1.0;
        float _265 = 1.0 / _263;
        float _267 = _179 * _259;
        float _269 = exp2(_267);
        float _271 = -_269;
        float _273 = _271 + 1.0;
        float _275 = _273 * _265;
        _205 = _275;
    }
    float _277 = _205;
    bool _279 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _281 = _253 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _283 = _253 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _285 = _253 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _287 = fma(_277, _191, _281);
    float _289 = fma(_277, _193, _283);
    float _291 = fma(_277, _195, _285);
    float _293 = fma(_287, _177, _197);
    float _295 = fma(_289, _177, _199);
    float _297 = fma(_291, _177, _201);
    bool _299 = !_279;
    float _317;
    if (!_299)
    {
        float _301 = in.m_67.x;
        float _303 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _305 = _301 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _307 = fma(_305, (*spvDescriptorSet0.vp_c9)._m0[12].x, _155);
        float _309 = _307 * _303;
        float _311 = floor(_309);
        float _313 = -_311;
        float _315 = _309 + _313;
        _317 = _315;
        _319 = true;
    }
    else
    {
        float _321 = float(_121);
        float _323 = 1.0 / _321;
        float _325 = _155 * _323;
        _317 = _325;
    }
    _319 = false;
    float _327 = _317;
    float _329 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _331 = _327 + _329;
    float _333 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _335 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _333;
    float _337 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _339 = _337 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _341 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _343 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _341;
    float _345 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _347 = _345 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _349 = 1.0 / _335;
    float _351 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _353 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _351;
    float _355 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _357 = _355 + (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _359 = _327 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _361 = isnan(_327);
    bool _363 = _359 || _361;
    bool _365 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _367 = _363 || _365;
    float _369 = float(_367);
    float _371 = 1.0 / _339;
    float _373 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _375 = _327 + _373;
    float _377 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _379 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _377;
    float _381 = 1.0 / _343;
    float _383 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _385 = _327 + _383;
    float _387 = _375 * _349;
    float _389 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _391 = _327 + _389;
    bool _393 = _327 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _395 = isnan(_327);
    bool _397 = _393 || _395;
    bool _399 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _401 = _397 || _399;
    float _403 = float(_401);
    float _405 = fma(_379, _387, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    bool _407 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _409 = 1.0 / _353;
    float _411 = _385 * _371;
    float _413 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _415 = _327 + _413;
    float _417 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _419 = _327 + _417;
    float _421 = -_403;
    float _423 = _421 + 1.0;
    float _425 = 1.0 / _347;
    float _427 = _391 * _381;
    bool _429 = _327 >= (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _431 = isnan(_327);
    bool _433 = _429 || _431;
    bool _435 = isnan((*spvDescriptorSet0.vp_c9)._m0[149].w);
    bool _437 = _433 || _435;
    float _439 = float(_437);
    bool _441 = _327 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _443 = isnan(_327);
    bool _445 = _441 || _443;
    bool _447 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _449 = _445 || _447;
    float _451 = float(_449);
    float _453 = 1.0 / _357;
    float _455 = _415 * _409;
    float _457 = -_439;
    float _459 = _457 + 1.0;
    float _461 = _403 * _459;
    float _463 = _331 * _425;
    float _465 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _467 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _465;
    float _469 = fma(_467, _387, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _471 = _369 * _423;
    float _473 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _475 = _473 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _477 = _419 * _453;
    float _479 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _481 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _479;
    bool _483 = _327 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _485 = isnan(_327);
    bool _487 = _483 || _485;
    bool _489 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _491 = _487 || _489;
    float _493 = float(_491);
    float _495 = fma(_475, _411, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _497 = fma(_481, _387, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _499 = _327 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _501 = isnan(_327);
    bool _503 = _499 || _501;
    bool _505 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _507 = _503 || _505;
    float _509 = float(_507);
    float _511 = -_369;
    float _513 = _511 + 1.0;
    bool _515 = _327 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _517 = isnan(_327);
    bool _519 = _515 || _517;
    bool _521 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _523 = _519 || _521;
    float _525 = float(_523);
    float _527 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _529 = _527 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _531 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _533 = _531 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _535 = _509 * _513;
    float _537 = -_509;
    float _539 = _537 + 1.0;
    float _541 = -_525;
    float _543 = _541 + 1.0;
    float _545 = fma(_529, _411, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _547 = fma(_533, _411, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _549 = _451 * _539;
    float _551 = _493 * _543;
    float _553 = -_451;
    float _555 = _553 + 1.0;
    float _557 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _559 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _557;
    float _561 = _405 * _551;
    float _563 = _469 * _551;
    float _565 = _497 * _551;
    float _567 = -_493;
    float _569 = _567 + 1.0;
    float _571 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _573 = _571 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _575 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _577 = _575 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _579 = _525 * _555;
    float _581 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _583 = _581 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _585 = fma(_569, (*spvDescriptorSet0.vp_c9)._m0[143].x, _563);
    float _587 = fma(_569, (*spvDescriptorSet0.vp_c9)._m0[143].y, _565);
    float _589 = fma(_569, (*spvDescriptorSet0.vp_c9)._m0[143].z, _561);
    float _591 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _593 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _591;
    float _595 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _597 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _595;
    float _599 = fma(_573, _463, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _601 = fma(_577, _463, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _603 = fma(_583, _463, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _605 = fma(_545, _579, _585);
    float _607 = fma(_495, _579, _587);
    float _609 = fma(_547, _579, _589);
    float _611 = fma(_593, _427, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _613 = fma(_559, _427, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _615 = fma(_597, _427, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _617 = fma(_611, _549, _605);
    float _619 = fma(_613, _549, _607);
    float _621 = fma(_615, _549, _609);
    float _623 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _625 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _623;
    float _627 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _629 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _627;
    float _631 = fma(_599, _535, _617);
    float _633 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _635 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _633;
    float _637 = fma(_601, _535, _619);
    float _639 = fma(_603, _535, _621);
    float _641 = fma(_625, _455, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _643 = fma(_629, _455, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _645 = -(*spvDescriptorSet0.vp_c9)._m0[148].x;
    float _647 = _645 + (*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _649 = fma(_635, _455, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    float _651 = -(*spvDescriptorSet0.vp_c9)._m0[148].y;
    float _653 = _651 + (*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _655 = -(*spvDescriptorSet0.vp_c9)._m0[148].z;
    float _657 = _655 + (*spvDescriptorSet0.vp_c9)._m0[149].z;
    float _659 = fma(_641, _471, _631);
    float _661 = fma(_647, _477, (*spvDescriptorSet0.vp_c9)._m0[148].x);
    float _663 = fma(_653, _477, (*spvDescriptorSet0.vp_c9)._m0[148].y);
    float _665 = fma(_657, _477, (*spvDescriptorSet0.vp_c9)._m0[148].z);
    float _667 = fma(_643, _471, _637);
    float _669 = fma(_649, _471, _639);
    float _671 = fma(_661, _461, _659);
    float _673 = fma(_663, _461, _667);
    float _675 = fma(_665, _461, _669);
    float _677 = fma(_439, (*spvDescriptorSet0.vp_c9)._m0[149].x, _671);
    float _679 = fma(_439, (*spvDescriptorSet0.vp_c9)._m0[149].y, _673);
    float _681 = fma(_439, (*spvDescriptorSet0.vp_c9)._m0[149].z, _675);
    bool _683 = !_407;
    float _701;
    if (!_683)
    {
        float _685 = in.m_67.x;
        float _687 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _689 = _685 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _691 = fma(_689, (*spvDescriptorSet0.vp_c9)._m0[11].y, _155);
        float _693 = _691 * _687;
        float _695 = floor(_693);
        float _697 = -_695;
        float _699 = _693 + _697;
        _701 = _699;
        _703 = true;
    }
    else
    {
        float _705 = float(_121);
        float _707 = 1.0 / _705;
        float _709 = _155 * _707;
        _701 = _709;
    }
    _703 = false;
    float _711 = _701;
    float _713 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _715 = _713 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _717 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _719 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _717;
    bool _721 = _711 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _723 = isnan(_711);
    bool _725 = _721 || _723;
    bool _727 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _729 = _725 || _727;
    float _731 = float(_729);
    float _733 = 1.0 / _715;
    float _735 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _737 = _735 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _739 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _741 = _739 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _743 = -_731;
    float _745 = _743 + 1.0;
    bool _747 = _711 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _749 = isnan(_711);
    bool _751 = _747 || _749;
    bool _753 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _755 = _751 || _753;
    float _757 = float(_755);
    float _759 = 1.0 / _737;
    bool _761 = _711 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _763 = isnan(_711);
    bool _765 = _761 || _763;
    bool _767 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _769 = _765 || _767;
    float _771 = float(_769);
    bool _773 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _775 = _771 * _745;
    float _777 = -_771;
    float _779 = _777 + 1.0;
    float _781 = _719 * _733;
    float _783 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _785 = _711 + _783;
    float _787 = 1.0 / _741;
    float _789 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _791 = _789 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _793 = _757 * _779;
    float _795 = fma(_781, _785, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _797 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _799 = _797 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _801 = _711 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _803 = isnan(_711);
    bool _805 = _801 || _803;
    bool _807 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _809 = _805 || _807;
    float _811 = float(_809);
    float _813 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _815 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _813;
    float _817 = _791 * _759;
    float _819 = 1.0 / _799;
    float _821 = _795 * _793;
    float _823 = -_811;
    float _825 = _823 + 1.0;
    float _827 = -_757;
    float _829 = _827 + 1.0;
    float _831 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _833 = _831 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _835 = _731 * _825;
    float _837 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _839 = _711 + _837;
    float _841 = _815 * _787;
    float _843 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _845 = _711 + _843;
    bool _847 = _711 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _849 = isnan(_711);
    bool _851 = _847 || _849;
    bool _853 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _855 = _851 || _853;
    float _857 = float(_855);
    float _859 = fma(_829, (*spvDescriptorSet0.vp_c9)._m0[115].x, _821);
    float _861 = fma(_841, _839, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _863 = fma(_817, _845, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _865 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _867 = _711 + _865;
    float _869 = -_857;
    float _871 = _869 + 1.0;
    float _873 = _833 * _819;
    float _875 = fma(_863, _775, _859);
    float _877 = _811 * _871;
    float _879 = fma(_873, _867, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _881 = fma(_861, _835, _875);
    float _883 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _885 = fma(_879, _877, _881);
    float _887 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _889 = fma(_857, (*spvDescriptorSet0.vp_c9)._m0[119].x, _885);
    float _891 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _893 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _895 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _897 = _883 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _899 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _901 = _891 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _903 = _887 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _905 = _893 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _907 = _895 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _909 = _899 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _911 = _889 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _913 = in.m_65.x;
    float _915 = in.m_65.y;
    float _917 = in.m_65.z;
    out.m_69.x = _905;
    out.m_69.y = _907;
    out.m_69.z = _909;
    out.m_71.x = _897;
    out.m_71.y = _901;
    out.m_71.z = _903;
    out.m_71.w = _911;
    float _919 = _681 * _917;
    float _921 = _679 * _915;
    float _923 = _677 * _913;
    bool _925 = !_773;
    float _943;
    if (!_925)
    {
        float _927 = in.m_67.x;
        float _929 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _931 = _927 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _933 = fma(_931, (*spvDescriptorSet0.vp_c9)._m0[14].x, _155);
        float _935 = _933 * _929;
        float _937 = floor(_935);
        float _939 = -_937;
        float _941 = _935 + _939;
        _943 = _941;
        _945 = true;
    }
    else
    {
        float _947 = float(_121);
        float _949 = 1.0 / _947;
        float _951 = _155 * _949;
        _943 = _951;
    }
    _945 = false;
    float _953 = _943;
    int _955 = int2(spvDescriptorSet0.vp_t_tcb_C.get_width(), spvDescriptorSet0.vp_t_tcb_C.get_height()).x;
    int _957 = _955;
    int _959 = 0;
    int _961 = _112(_957, _959, (*spvDescriptorSet0.support_buffer));
    float _963 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _965 = _963 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _967 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _969 = _967 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _971 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _973 = _971 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _975 = 1.0 / _965;
    float _977 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _979 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _977;
    float _981 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _983 = _981 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _985 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _987 = _985 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _989 = 1.0 / _969;
    bool _991 = _953 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _993 = isnan(_953);
    bool _995 = _991 || _993;
    bool _997 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _999 = _995 || _997;
    float _1001 = float(_999);
    float _1003 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1005 = _1003 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1007 = 1.0 / _973;
    float _1009 = _979 * _975;
    float _1011 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _1013 = _1011 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1015 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1017 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _1015;
    float _1019 = 1.0 / _983;
    bool _1021 = _953 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _1023 = isnan(_953);
    bool _1025 = _1021 || _1023;
    bool _1027 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _1029 = _1025 || _1027;
    float _1031 = float(_1029);
    float _1033 = _1017 * _989;
    bool _1035 = _953 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _1037 = isnan(_953);
    bool _1039 = _1035 || _1037;
    bool _1041 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _1043 = _1039 || _1041;
    float _1045 = float(_1043);
    float _1047 = -_1031;
    float _1049 = _1047 + 1.0;
    float _1051 = 1.0 / _987;
    float _1053 = _1013 * _1007;
    bool _1055 = _953 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _1057 = isnan(_953);
    bool _1059 = _1055 || _1057;
    bool _1061 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _1063 = _1059 || _1061;
    float _1065 = float(_1063);
    float _1067 = -_1045;
    float _1069 = _1067 + 1.0;
    float _1071 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1073 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _1071;
    float _1075 = _1045 * _1049;
    float _1077 = _1065 * _1069;
    float _1079 = -_1065;
    float _1081 = _1079 + 1.0;
    bool _1083 = _953 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _1085 = isnan(_953);
    bool _1087 = _1083 || _1085;
    bool _1089 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _1091 = _1087 || _1089;
    float _1093 = float(_1091);
    float _1095 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _1097 = _1095 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1099 = _1073 * _1019;
    bool _1101 = _953 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1103 = isnan(_953);
    bool _1105 = _1101 || _1103;
    bool _1107 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _1109 = _1105 || _1107;
    float _1111 = float(_1109);
    float _1113 = 1.0 / _1005;
    float _1115 = -_1093;
    float _1117 = _1115 + 1.0;
    float _1119 = _1093 * _1081;
    float _1121 = _1097 * _1051;
    float _1123 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1125 = _953 + _1123;
    float _1127 = _1001 * _1117;
    bool _1129 = _953 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _1131 = isnan(_953);
    bool _1133 = _1129 || _1131;
    bool _1135 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _1137 = _1133 || _1135;
    float _1139 = float(_1137);
    float _1141 = -_1111;
    float _1143 = _1141 + 1.0;
    float _1145 = -_1001;
    float _1147 = _1145 + 1.0;
    float _1149 = fma(_1009, _1125, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _1151 = _1139 * _1143;
    float _1153 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1155 = _953 + _1153;
    float _1157 = -_1139;
    float _1159 = _1157 + 1.0;
    float _1161 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1163 = _1161 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _1165 = _1149 * _1151;
    float _1167 = _1111 * _1147;
    float _1169 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1171 = _1169 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1173 = fma(_1053, _1155, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _1175 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1177 = _953 + _1175;
    float _1179 = fma(_1159, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1165);
    float _1181 = 1.0 / _1163;
    float _1183 = _1171 * _1113;
    float _1185 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1187 = _953 + _1185;
    float _1189 = fma(_1033, _1177, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _1191 = fma(_1173, _1167, _1179);
    float _1193 = in.m_67.x;
    float _1195 = in.m_67.y;
    float _1197 = fma(_1121, _1187, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _1199 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1201 = _953 + _1199;
    float _1203 = fma(_1189, _1127, _1191);
    bool _1205 = _953 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1207 = isnan(_953);
    bool _1209 = _1205 || _1207;
    bool _1211 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1213 = _1209 || _1211;
    float _1215 = float(_1213);
    float _1217 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1219 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _1217;
    float _1221 = fma(_1099, _1201, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _1223 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1225 = _953 + _1223;
    float _1227 = fma(_1197, _1119, _1203);
    float _1229 = -_1215;
    float _1231 = _1229 + 1.0;
    float _1233 = _1219 * _1181;
    float _1235 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1237 = _953 + _1235;
    float _1239 = fma(_1183, _1225, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _1241 = fma(_1221, _1077, _1227);
    float _1243 = _1031 * _1231;
    float _1245 = fma(_1233, _1237, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1247 = in.m_73.z;
    float _1249 = fma(_1239, _1075, _1241);
    float _1251 = fma(_1245, _1243, _1249);
    float _1253 = -_1193;
    float _1255 = fma(0.5, _1253, 1.0);
    float _1257 = fma(_1215, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1251);
    float _1259 = _1257 * _1255;
    float _1261 = precise::clamp(_1259, 0.0, 1.0);
    float _1263 = trunc(_1247);
    int _1265 = int(_1263);
    int _1267 = _961 + (-1);
    float _1269 = float(_1267);
    float _1271 = _1261 * _1269;
    float _1273 = trunc(_1271);
    int _1275 = int(_1273);
    int _1277 = _1275;
    int _1279 = 0;
    int _1281 = _113(_1277, _1279, (*spvDescriptorSet0.support_buffer));
    int _1283 = _1265;
    int _1285 = 0;
    int _1287 = _113(_1283, _1285, (*spvDescriptorSet0.support_buffer));
    float4 _1290 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_1281, _1287)), 0).xyzw;
    float _1292 = _1290.x;
    float _1294 = _1290.y;
    float _1296 = _1290.z;
    float _1298 = _1290.w;
    float _1300 = in.m_73.x;
    float _1302 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _1304 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1306 = _1304 != 0;
    float _1308 = in.m_73.y;
    int _1310 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1312 = _1310 != 0;
    float _1314 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1316 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _1318 = _1195 > 0.5;
    bool _1320 = _1318 && _1312;
    float _1322 = _1075;
    float _1324 = _1119;
    if (_1306)
    {
        float _1326 = in.m_67.x;
        _1322 = _1326;
    }
    float _1328 = _1322;
    if (_1306)
    {
        _1324 = _1300;
    }
    float _1330 = _1324;
    float _1332 = _1308;
    float _1334 = _1330;
    if (_1320)
    {
        float _1336 = -_1308;
        float _1338 = _1336 + 1.0;
        _1332 = _1338;
    }
    float _1340 = _1332;
    bool _1342 = _1328 > 0.5;
    bool _1344 = _1342 && _1306;
    float _1346 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1348 = _1193 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1350 = -_1346;
    float _1352 = fma(_1348, 2.0, _1350);
    float _1354 = _1346;
    if (!_1306)
    {
        _1354 = _1300;
    }
    float _1356 = _1354;
    float _1358 = fma(_1193, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1314);
    float _1360 = _1356;
    if (_1344)
    {
        float _1362 = -_1330;
        float _1364 = _1362 + 1.0;
        _1334 = _1364;
    }
    float _1366 = _1334;
    float _1368 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1370 = _1316 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1372 = _1195 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    if (_1306)
    {
        _1360 = _1366;
    }
    float _1374 = _1360;
    float _1376 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1378 = _1302 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1380 = -_155;
    float _1382 = fma(_1380, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1352);
    float _1384 = fma(_1372, -2.0, _1368);
    float _1386 = fma(_1195, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1376);
    float _1388 = fma(_1378, _1374, -0.5);
    float _1390 = fma(_155, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1358);
    float _1392 = fma(_1370, _1340, -0.5);
    float _1394 = fma(_155, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1386);
    float _1396 = fma(_155, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1384);
    float _1398 = fma(_1390, _1388, _1382);
    int _1400 = _1275 + 1;
    float _1402 = -_1396;
    float _1404 = fma(_1394, _1392, _1402);
    float _1406 = _1398 + 0.5;
    int _1408 = min(_1267, _1400);
    float _1410 = _1404 + 0.5;
    uint _1413 = as_type<uint>(half2(float2(_1298, 0.0)));
    uint _1415 = extract_bits(_1413, 0u, 8u);
    int _1417 = int(_1415) & 255;
    uint _1419 = extract_bits(_1413, 8u, 8u);
    int _1421 = int(_1419) & 255;
    int _1423 = _1421 << 8;
    int _1425 = _1417 | _1423;
    bool _1427 = _1425 >= 32768;
    int _1429 = _1425 + (-1024);
    int _1431 = _1429;
    if (_1427)
    {
        int _1433 = ~_1425;
        int _1435 = _1433 + 33792;
        int _1437 = _1435 + 1;
        _1431 = _1437;
    }
    int _1439 = _1431;
    int _1441 = _1439 + 30719;
    float _1443 = float(_1441);
    float _1445 = fma(_1443, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _1447 = abs(_1445);
    float _1449 = -_1447;
    float _1451 = _1449 + 1.0;
    float _1453 = abs(_1445);
    float _1455 = fma(_1453, -0.0187292993068695068359375, 0.074261002242565155029296875);
    bool _1457 = _1445 < 0.0;
    float _1459 = float(_1457);
    int _1461 = as_type<int>(_1451) + (-218103808);
    float _1463 = abs(_1445);
    float _1465 = fma(_1463, _1455, -0.212114393711090087890625);
    bool _1467 = uint(_1461) >= 1920991232u;
    float _1469 = abs(_1445);
    float _1471 = fma(_1469, _1465, 1.570728778839111328125);
    bool _1473 = !_1467;
    float _1495;
    if (!_1473)
    {
        int _1475 = as_type<int>(_1451);
        int _1477 = _1275;
        int _1479 = as_type<int>(_1382);
        int _1481 = 7216;
        int _1483;
        int _1485;
        int _1487;
        int _1489;
        int _1491;
        int _1493;
        _110(_1475, _1477, _1479, _1481, _1483, _1485, _1487, _1489, _1491, _1493, out.gl_Position, out.gl_PointSize);
        _1495 = as_type<float>(_1489);
        _1497 = true;
    }
    else
    {
        float _1499 = rsqrt(_1451);
        float _1501 = _1451 * _1499;
        float _1503 = _1499 * 0.5;
        float _1505 = -_1501;
        float _1507 = 0.0 + _1505;
        float _1509 = fma(_1503, _1507, 0.5);
        float _1511 = fma(_1501, _1509, _1501);
        float _1513 = -_1511;
        float _1515 = 0.0 + _1513;
        float _1517 = fma(_1511, _1515, _1451);
        float _1519 = fma(_1503, _1517, _1511);
        _1495 = _1519;
    }
    _1497 = false;
    float _1521 = _1495;
    int _1523 = _1408;
    int _1525 = 0;
    int _1527 = _113(_1523, _1525, (*spvDescriptorSet0.support_buffer));
    int _1529 = _1265;
    int _1531 = 0;
    int _1533 = _113(_1529, _1531, (*spvDescriptorSet0.support_buffer));
    float4 _1535 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_1527, _1533)), 0).xyzw;
    float _1537 = _1535.x;
    float _1539 = _1535.y;
    float _1541 = _1535.z;
    float _1543 = _1535.w;
    float _1545 = _1471 * _1521;
    float _1547 = _1459 * 2.0;
    float _1549 = _1443 * 3.883221149444580078125;
    float _1551 = floor(_1271);
    float _1553 = -_1547;
    float _1555 = fma(_1545, _1553, _1545);
    float _1557 = _1549 * 0.15915493667125701904296875;
    float _1559 = fma(_1459, 3.1415927410125732421875, _1555);
    float _1561 = _1557 * 6.283185482025146484375;
    float _1563 = cos(_1561);
    float _1565 = _1559 * 0.15915493667125701904296875;
    float _1567 = _1565 * 6.283185482025146484375;
    float _1569 = sin(_1567);
    float _1571 = -_1551;
    float _1573 = _1271 + _1571;
    float _1575 = _1557 * 6.283185482025146484375;
    float _1577 = sin(_1575);
    float _1579 = _1569 * _1563;
    float _1581 = _1569 * _1577;
    uint _1583 = as_type<uint>(half2(float2(_1543, 0.0)));
    float _1585 = -_1296;
    float _1587 = _1585 + _1541;
    float _1589 = -_1292;
    float _1591 = _1589 + _1537;
    uint _1593 = extract_bits(_1583, 0u, 8u);
    int _1595 = int(_1593) & 255;
    uint _1597 = extract_bits(_1583, 8u, 8u);
    int _1599 = int(_1597) & 255;
    int _1601 = _1599 << 8;
    int _1603 = _1595 | _1601;
    float _1605 = fma(_1573, _1587, _1296);
    float _1607 = fma(_1573, _1591, _1292);
    bool _1609 = _1603 >= 32768;
    int _1611 = _1603 + (-1024);
    int _1613 = _1611;
    if (_1609)
    {
        int _1615 = ~_1603;
        int _1617 = _1615 + 33792;
        int _1619 = _1617 + 1;
        _1613 = _1619;
    }
    int _1621 = _1613;
    int _1623 = _1621 + 30719;
    float _1625 = float(_1623);
    float _1627 = fma(_1625, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _1629 = abs(_1627);
    float _1631 = -_1629;
    float _1633 = _1631 + 1.0;
    bool _1635 = _1627 < 0.0;
    float _1637 = float(_1635);
    float _1639 = abs(_1627);
    float _1641 = fma(_1639, -0.0187292993068695068359375, 0.074261002242565155029296875);
    int _1643 = as_type<int>(_1633) + (-218103808);
    float _1645 = abs(_1627);
    float _1647 = fma(_1645, _1641, -0.212114393711090087890625);
    bool _1649 = uint(_1643) >= 1920991232u;
    float _1651 = -_1294;
    float _1653 = _1651 + _1539;
    float _1655 = abs(_1627);
    float _1657 = fma(_1655, _1647, 1.570728778839111328125);
    float _1659 = fma(_1573, _1653, _1294);
    bool _1661 = !_1649;
    float _1683;
    if (!_1661)
    {
        int _1663 = as_type<int>(_1633);
        int _1665 = as_type<int>(_1539);
        int _1667 = as_type<int>(_1633);
        int _1669 = 8128;
        int _1671;
        int _1673;
        int _1675;
        int _1677;
        int _1679;
        int _1681;
        _110(_1663, _1665, _1667, _1669, _1671, _1673, _1675, _1677, _1679, _1681, out.gl_Position, out.gl_PointSize);
        _1683 = as_type<float>(_1677);
        _1685 = true;
    }
    else
    {
        float _1687 = rsqrt(_1633);
        float _1689 = _1633 * _1687;
        float _1691 = _1687 * 0.5;
        float _1693 = -_1689;
        float _1695 = 0.0 + _1693;
        float _1697 = fma(_1691, _1695, 0.5);
        float _1699 = fma(_1689, _1697, _1689);
        float _1701 = -_1699;
        float _1703 = 0.0 + _1701;
        float _1705 = fma(_1699, _1703, _1633);
        float _1707 = fma(_1691, _1705, _1699);
        _1683 = _1707;
    }
    _1685 = false;
    float _1709 = _1683;
    float _1711 = _295 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1713 = _295 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1715 = fma(_293, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1711);
    float _1717 = fma(_293, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1713);
    float _1719 = fma(_297, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1715);
    float _1721 = fma(_297, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1717);
    float _1723 = _1719 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1725 = _1721 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1727 = fma(_1723, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1729 = fma(_1725, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1731 = floor(_1727);
    float _1733 = floor(_1729);
    float _1735 = -_1731;
    float _1737 = _1727 + _1735;
    float _1739 = -_1733;
    float _1741 = _1729 + _1739;
    float2 _6166 = float2(_1737, _1741);
    float _1743 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6166, float2(0.0), isnan(_6166)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6166, float2(0.0), isnan(_6166)), level(0.0)).x;
    float _1745 = in.m_67.x;
    float _1747 = in.m_67.y;
    float _1749 = in.m_67.z;
    float _1751 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1753 = log2(_1751);
    float _1755 = _295 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1757 = _923 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1759 = _921 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1761 = fma(_293, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1755);
    float _1763 = _919 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1765 = fma(_297, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1761);
    float _1767 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _1769 = _1765 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1771 = _1753 * _155;
    float _1773 = _1769 + _1767;
    float _1775 = exp2(_1771);
    float _1777 = _1745 * 2.0;
    float _1779 = _1749 * 2.0;
    float _1781 = _1747 * 2.0;
    float _1783 = floor(_1777);
    float _1785 = floor(_1779);
    float _1787 = -_1775;
    float _1789 = _1787 + 1.0;
    bool _1791 = _1783 > 0.0;
    float _1793 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1795 = 1.0 + _1793;
    bool _1797 = _1783 >= 0.0;
    bool _1799 = isnan(_1783);
    bool _1801 = _1797 || _1799;
    bool _1803 = isnan(0.0);
    bool _1805 = _1801 || _1803;
    float _1807 = floor(_1781);
    int _1809 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1811 = _1809 != 0;
    int _1813 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1815 = _1813 != 0;
    int _1817 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1819 = _1817 != 0;
    float _1821 = _1749 + _1747;
    int _1823 = _1805 ? 0 : 1;
    bool _1825 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1827 = isnan(1.0);
    bool _1829 = _1825 || _1827;
    bool _1831 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1833 = _1829 || _1831;
    float _1835 = 1.0 / _1795;
    float _1837 = _1821 + (-1.0);
    bool _1839 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1841 = isnan(0.0);
    bool _1843 = _1839 || _1841;
    bool _1845 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1847 = _1843 || _1845;
    int _1849 = ~_1823;
    int _1851 = _1849 + 1;
    int _1853 = _1851 + 1;
    float _1855 = fma(_1837, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1857 = _1769 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1859 = _1847 ? _1789 : 0.0;
    int _1861 = _1853;
    int _1863 = 2;
    if (!_1791)
    {
        int _1865 = ~_1823;
        int _1867 = _1865 + 1;
        _1861 = _1867;
    }
    int _1869 = _1861;
    float _1871 = fma(_1723, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1857);
    bool _1873 = _1785 > 0.0;
    bool _1875 = _1785 >= 0.0;
    bool _1877 = isnan(_1785);
    bool _1879 = _1875 || _1877;
    bool _1881 = isnan(0.0);
    bool _1883 = _1879 || _1881;
    float _1885 = fma(_1725, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1871);
    bool _1887 = !_1815;
    int _1889 = _1887 ? 0 : 1;
    if (_1833)
    {
        float _1891 = _1859 * _1835;
        _157 = _1891;
    }
    float _1893 = _157;
    bool _1895 = _1807 > 0.0;
    float _1897 = in.m_75.x;
    float _1899 = in.m_75.y;
    float _1901 = in.m_75.z;
    bool _1903 = _1807 >= 0.0;
    bool _1905 = isnan(_1807);
    bool _1907 = _1903 || _1905;
    bool _1909 = isnan(0.0);
    bool _1911 = _1907 || _1909;
    float _1913 = _1769 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    int _1915 = abs(_1889);
    float _1917 = _1885 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    bool _1919 = !_1811;
    int _1921 = _1919 ? 0 : 1;
    float _1923 = fma(_1723, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1913);
    int _1925 = _1911 ? 0 : 1;
    float _1927 = 1.0 / _1917;
    int _1929 = abs(_1921);
    float _1931 = fma(_1725, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1923);
    float _1933 = float(_1915);
    float _1935 = float(_1869);
    float _1937 = _1931 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    int _1939 = ~_1925;
    int _1941 = _1939 + 1;
    int _1943 = _1941 + 1;
    int _1945 = _1943;
    if (!_1895)
    {
        int _1947 = ~_1925;
        int _1949 = _1947 + 1;
        _1945 = _1949;
    }
    int _1951 = _1945;
    float _1953 = _1933 * _1935;
    float _1955 = _1937 + _1917;
    float _1957 = _1747 + (-0.5);
    float _1959 = _1953 * (-2.0);
    int _1961 = _1883 ? 0 : 1;
    float _1963 = _1747 + _1745;
    float _1965 = float(_1929);
    float _1967 = fma(_1959, _1899, _1899);
    float _1969 = fma(_1855, _1959, _1855);
    bool _1971 = !_1819;
    int _1973 = _1971 ? 0 : 1;
    float _1975 = _1955 * _1927;
    float _1977 = _1975 * 0.5;
    float _1979 = fma(_1957, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1967);
    int _1981 = ~_1961;
    int _1983 = _1981 + 1;
    int _1985 = _1983 + 1;
    float _1987 = _1963 + (-1.0);
    int _1989 = _1985;
    if (!_1873)
    {
        int _1991 = ~_1961;
        int _1993 = _1991 + 1;
        _1989 = _1993;
    }
    int _1995 = _1989;
    float _1997 = fma(_1969, _1893, _1979);
    int _1999 = abs(_1973);
    float _2001 = _1749 + _1745;
    float _2003 = float(_1995);
    float _2005 = _1749 + (-0.5);
    float _2007 = float(_1999);
    float _2009 = _2001 + (-1.0);
    float _2011 = float(_1951);
    float _2013 = _1965 * _2003;
    float _2015 = _1997 * 0.15915493667125701904296875;
    float _2017 = _2007 * _2011;
    float _2019 = _2013 * (-2.0);
    float _2021 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2023 = fma(_1977, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2021);
    float _2025 = fma(_1987, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _2027 = _2017 * (-2.0);
    float _2029 = fma(_2009, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2031 = _1745 + (-0.5);
    float _2033 = fma(_2019, _1897, _1897);
    float _2035 = fma(_2025, _2019, _2025);
    float _2037 = fma(_2027, _1901, _1901);
    float _2039 = 1.0 / _2023;
    float _2041 = fma(_2031, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2033);
    float _2043 = fma(_2029, _2027, _2029);
    float _2045 = fma(_2005, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2037);
    float _2047 = fma(_2035, _1893, _2041);
    float _2049 = fma(_2043, _1893, _2045);
    float _2051 = _2015 * 6.283185482025146484375;
    float _2053 = sin(_2051);
    float _2055 = _2047 * 0.15915493667125701904296875;
    float _2057 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1607);
    float _2059 = _2049 * 0.15915493667125701904296875;
    float _2061 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1659);
    float _2063 = _2057 * _1757;
    float _2065 = _1773 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _2067 = _2055 * 6.283185482025146484375;
    float _2069 = cos(_2067);
    float _2071 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2073 = _2039 * _2071;
    float _2075 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1605);
    float _2077 = _2061 * _1759;
    float _2079 = fma(_1723, (*spvDescriptorSet0.vp_c15)._m0[126].x, _2065);
    bool _2081 = _2073 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _2083 = _2075 * _1763;
    float _2085 = _2015 * 6.283185482025146484375;
    float _2087 = cos(_2085);
    bool _2089 = _2073 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _2091 = fma(_1725, (*spvDescriptorSet0.vp_c15)._m0[126].z, _2079);
    bool _2093 = !_2081;
    int _2095 = _2093 ? 0 : 1;
    float _2097 = _2091 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _2099 = _2059 * 6.283185482025146484375;
    float _2101 = cos(_2099);
    float _2103 = _2069 * _2053;
    if (!_2081)
    {
        _1863 = 1;
    }
    int _2105 = _1863;
    int _2107 = _2105;
    if (!_2089)
    {
        _2107 = _2095;
    }
    int _2109 = _2107;
    float _2111 = _2055 * 6.283185482025146484375;
    float _2113 = sin(_2111);
    float _2115 = _2069 * _2087;
    int _2117 = _2109 << 6;
    int _2119 = _2117 + 64;
    uint _2121 = uint(int(uint(_2119) >> uint(2)));
    uint _2123 = uint(int(uint(int(_2121)) >> uint(2)));
    int _2125 = int(_2121) & 3;
    float _2127 = (*spvDescriptorSet0.vp_c15)._m0[int(_2123)][_2125];
    int _2129 = int(_2121) + 1;
    uint _2131 = uint(int(uint(_2129) >> uint(2)));
    int _2133 = _2129 & 3;
    float _2135 = (*spvDescriptorSet0.vp_c15)._m0[int(_2131)][_2133];
    float _2137 = _2059 * 6.283185482025146484375;
    float _2139 = sin(_2137);
    float _2141 = _2069 * _2101;
    float _2143 = _2087 * _2101;
    float _2145 = _2141 * _2077;
    int _2147 = _2117 + 48;
    uint _2149 = uint(int(uint(_2147) >> uint(2)));
    uint _2151 = uint(int(uint(int(_2149)) >> uint(2)));
    int _2153 = int(_2149) & 3;
    float _2155 = (*spvDescriptorSet0.vp_c15)._m0[int(_2151)][_2153];
    int _2157 = int(_2149) + 1;
    uint _2159 = uint(int(uint(_2157) >> uint(2)));
    int _2161 = _2157 & 3;
    float _2163 = (*spvDescriptorSet0.vp_c15)._m0[int(_2159)][_2161];
    float _2165 = _2113 * _2087;
    float _2167 = _2113 * _2053;
    float _2169 = _2113 * _2101;
    float _2171 = _2053 * _2101;
    float _2173 = _1773 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _2175 = trunc(_2097);
    int _2177 = int(_2175);
    float _2179 = _2169 * _2077;
    float _2181 = fma(_1723, (*spvDescriptorSet0.vp_c15)._m0[127].x, _2173);
    float _2183 = fma(_2139, _2115, _2167);
    float _2185 = fma(_2139, _2167, _2115);
    float _2187 = -_2103;
    float _2189 = fma(_2139, _2165, _2187);
    float _2191 = fma(_1725, (*spvDescriptorSet0.vp_c15)._m0[127].z, _2181);
    float _2193 = -_2165;
    float _2195 = fma(_2139, _2103, _2193);
    int _2197 = _2117 + 96;
    uint _2199 = uint(int(uint(_2197) >> uint(2)));
    uint _2201 = uint(int(uint(int(_2199)) >> uint(2)));
    int _2203 = int(_2199) & 3;
    float _2205 = (*spvDescriptorSet0.vp_c15)._m0[int(_2201)][_2203];
    int _2207 = int(_2199) + 1;
    uint _2209 = uint(int(uint(_2207) >> uint(2)));
    int _2211 = _2207 & 3;
    float _2213 = (*spvDescriptorSet0.vp_c15)._m0[int(_2209)][_2211];
    float _2215 = -_2077;
    float _2217 = _2139 * _2215;
    float _2219 = fma(_2183, _2063, _2145);
    float _2221 = fma(_2189, _2063, _2179);
    float _2223 = _2191 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _2225 = fma(_2143, _2063, _2217);
    float _2227 = fma(_2195, _2083, _2219);
    float _2229 = fma(_2185, _2083, _2221);
    int _2231 = _2117 + 104;
    uint _2233 = uint(int(uint(_2231) >> uint(2)));
    uint _2235 = uint(int(uint(int(_2233)) >> uint(2)));
    int _2237 = int(_2233) & 3;
    float _2239 = (*spvDescriptorSet0.vp_c15)._m0[int(_2235)][_2237];
    int _2241 = int(_2233) + 1;
    uint _2243 = uint(int(uint(_2241) >> uint(2)));
    int _2245 = _2241 & 3;
    float _2247 = (*spvDescriptorSet0.vp_c15)._m0[int(_2243)][_2245];
    float _2249 = fma(_2171, _2083, _2225);
    float _2251 = _2227 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _2253 = _2227 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _2255 = trunc(_2223);
    int _2257 = int(_2255);
    int _2259 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _2261 = _2177 + _2259;
    int _2263 = _2261 + 1;
    float _2265 = fma(_2249, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2251);
    float _2267 = fma(_2249, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2253);
    int _2269 = _2117 + 56;
    uint _2271 = uint(int(uint(_2269) >> uint(2)));
    uint _2273 = uint(int(uint(int(_2271)) >> uint(2)));
    int _2275 = int(_2271) & 3;
    float _2277 = (*spvDescriptorSet0.vp_c15)._m0[int(_2273)][_2275];
    int _2279 = int(_2271) + 1;
    uint _2281 = uint(int(uint(_2279) >> uint(2)));
    int _2283 = _2279 & 3;
    float _2285 = (*spvDescriptorSet0.vp_c15)._m0[int(_2281)][_2283];
    bool _2287 = _2263 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _2289 = fma(_2229, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2265);
    float _2291 = fma(_2229, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2267);
    float _2293 = _2227 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2295 = _1725 + _2289;
    float _2297 = _1723 + _2291;
    int _2299 = _2117 + 72;
    uint _2301 = uint(int(uint(_2299) >> uint(2)));
    uint _2303 = uint(int(uint(int(_2301)) >> uint(2)));
    int _2305 = int(_2301) & 3;
    float _2307 = (*spvDescriptorSet0.vp_c15)._m0[int(_2303)][_2305];
    int _2309 = int(_2301) + 1;
    uint _2311 = uint(int(uint(_2309) >> uint(2)));
    int _2313 = _2309 & 3;
    float _2315 = (*spvDescriptorSet0.vp_c15)._m0[int(_2311)][_2313];
    float _2317 = _1773 * _2135;
    float _2319 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2321 = _2295 + _2319;
    float _2323 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2325 = _2297 + _2323;
    int _2327 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _2329 = _2257 + _2327;
    int _2331 = _2329 + 1;
    float _2333 = fma(_2249, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2293);
    float _2335 = _2321 * _2321;
    int _2337 = _2117 + 80;
    uint _2339 = uint(int(uint(_2337) >> uint(2)));
    uint _2341 = uint(int(uint(int(_2339)) >> uint(2)));
    int _2343 = int(_2339) & 3;
    float _2345 = (*spvDescriptorSet0.vp_c15)._m0[int(_2341)][_2343];
    int _2347 = int(_2339) + 1;
    uint _2349 = uint(int(uint(_2347) >> uint(2)));
    int _2351 = _2347 & 3;
    float _2353 = (*spvDescriptorSet0.vp_c15)._m0[int(_2349)][_2351];
    int _2355 = _2263 | _2331;
    float _2357 = fma(_2325, _2325, _2335);
    float _2359 = _1773 * _2163;
    float _2361 = fma(_2229, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2333);
    bool _2363 = _2355 < 0;
    bool _2365 = _2363 || _2287;
    float _2367 = sqrt(_2357);
    float _2369 = fma(_1723, _2155, _2359);
    bool _2371 = _2331 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _2373 = _2371 || _2365;
    float _2375 = _1773 * _2213;
    float _2377 = fma(_1723, _2205, _2375);
    float _2379 = fma(_1723, _2127, _2317);
    int _2381 = _2263;
    int _2383 = as_type<int>(_2359);
    float _2385 = _2295;
    float _2387 = _2297;
    if (!_2373)
    {
        int _2389 = _2331 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _2391 = _2389 + _2263;
        _2381 = _2391;
    }
    int _2393 = _2381;
    bool _2395 = _2367 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2397 = fma(_1725, _2239, _2377);
    float _2399 = 0.0;
    int _2401 = as_type<int>(_2239);
    float _2403 = _2397;
    if (!_2373)
    {
        float _2405 = floor(_2097);
        _2399 = _2405;
    }
    float _2407 = _2399;
    if (!_2373)
    {
        int _2409 = _2393 << 2;
        _2383 = _2409;
    }
    int _2411 = _2383;
    float _2413 = _2397 + _2247;
    int _2415 = _2411;
    if (!_2373)
    {
        uint _2417 = uint(int(uint(_2393) >> uint(2)));
        _2401 = int(_2417);
    }
    int _2419 = _2401;
    float _2421 = as_type<float>(_2419);
    if (!_2373)
    {
        int _2423 = 12 & _2411;
        _2415 = _2423;
    }
    int _2425 = _2415;
    float _2427 = fma(_1725, _2277, _2369);
    float _2429 = 1.0 / _2413;
    if (!_2373)
    {
        int _2431 = _2419 << 4;
        int _2433 = _2431 + _2425;
        _2421 = as_type<float>(_2433);
    }
    float _2435 = _2421;
    float _2437 = _2427 + _2285;
    if (!_2395)
    {
        _2403 = _2297;
    }
    float _2439 = _2403;
    float _2441 = fma(_1725, _2307, _2379);
    float _2443 = _1769 + _2361;
    float _2445 = _2441 + _2315;
    bool _2447 = !_2395;
    float _2449 = _2443;
    float _2451 = _2439;
    float _2453 = _2353;
    if (!_2447)
    {
        float _2455 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2457 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2459 = _2367 + _2457;
        float _2461 = _2443 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2463 = rsqrt(_2357);
        float _2465 = _2459 * _2455;
        float _2467 = _2465 * 0.15915493667125701904296875;
        float _2469 = _2467 * 6.283185482025146484375;
        float _2471 = cos(_2469);
        float _2473 = _2467 * 6.283185482025146484375;
        float _2475 = sin(_2473);
        float _2477 = _2471 + (-1.0);
        float _2479 = _2477 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2481 = fma(_2475, _2461, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2483 = fma(_2443, _2471, _2479);
        float _2485 = _2463 * _2481;
        float _2487 = fma(_2325, _2485, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2489 = fma(_2321, _2485, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2449 = _2483;
        _2451 = _2487;
        _2385 = _2489;
    }
    float _2491 = _2449;
    float _2493 = _2451;
    float _2495 = _2385;
    float _2497 = _2435;
    if (!_2373)
    {
        int _2499 = as_type<int>(_2435) + 400;
        uint _2501 = uint(int(uint(_2499) >> uint(2)));
        uint _2503 = uint(int(uint(int(_2501)) >> uint(2)));
        int _2505 = int(_2501) & 3;
        float _2507 = (*spvDescriptorSet0.vp_c15)._m0[int(_2503)][_2505];
        _2497 = _2507;
    }
    float _2509 = _2497;
    float _2511 = _2491 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2513 = _2491 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2515 = _2437 * _2429;
    float _2517 = _2491 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2519 = fma(_2493, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2511);
    float _2521 = fma(_2493, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2513);
    float _2523 = _2491 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    int _2525 = _2117 + 88;
    uint _2527 = uint(int(uint(_2525) >> uint(2)));
    uint _2529 = uint(int(uint(int(_2527)) >> uint(2)));
    int _2531 = int(_2527) & 3;
    float _2533 = (*spvDescriptorSet0.vp_c15)._m0[int(_2529)][_2531];
    int _2535 = int(_2527) + 1;
    uint _2537 = uint(int(uint(_2535) >> uint(2)));
    int _2539 = _2535 & 3;
    float _2541 = (*spvDescriptorSet0.vp_c15)._m0[int(_2537)][_2539];
    float _2543 = fma(_2495, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2519);
    bool _2545 = _2515 >= 0.0;
    float _2547 = fma(_2493, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2517);
    float _2549 = fma(_2495, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2521);
    float _2551 = _2543 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2553 = _2445 * _2429;
    bool _2555 = _2515 <= 1.0;
    bool _2557 = _2555 && _2545;
    float _2559 = fma(_2495, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2547);
    float _2561 = _2549 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2563 = fma(_2493, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2523);
    float _2565 = _2551 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2567 = _2559 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    bool _2569 = _2553 >= 0.0;
    bool _2571 = _2569 && _2557;
    float _2573 = fma(_2495, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2563);
    float _2575 = fma(_2561, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2565);
    float _2577 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2579 = _2567 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    bool _2581 = _2553 <= 1.0;
    bool _2583 = _2581 && _2571;
    float _2585 = _2573 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2587 = fma(_2567, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2575);
    float _2589 = -_2579;
    float _2591 = fma(_2589, _2577, 1.0);
    float _2593 = _2361;
    if (!_2373)
    {
        float _2595 = floor(_2223);
        _2593 = _2595;
    }
    float _2597 = _2593;
    float _2599 = _2551 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2601 = fma(_2585, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2587);
    float _2603 = _2551 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2605 = _1773 * _2353;
    float _2607 = fma(_2561, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2599);
    float _2609 = fma(_2561, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2603);
    float _2611 = log2(_2591);
    if (_2583)
    {
        float _2613 = float(_2109);
        _2453 = _2613;
    }
    float _2615 = _2453;
    float _2617 = fma(_1723, _2345, _2605);
    float _2619 = fma(_2567, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2607);
    float _2621 = fma(_2567, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2609);
    float _2623 = fma(_2585, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2619);
    float _2625 = 1.0 / _2601;
    float _2627 = _2597;
    float _2629 = _2621;
    if (!_2373)
    {
        float _2631 = -_2597;
        float _2633 = _2223 + _2631;
        _2627 = _2633;
    }
    float _2635 = _2627;
    float _2637 = fma(_2585, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2621);
    float _2639 = _2605;
    if (_2583)
    {
        float _2641 = rint(_2615);
        float _2643 = precise::max(_2641, 0.0);
        uint _2645 = uint(_2643);
        uint _2647 = clamp(_2645, 0u, 65535u);
        _2639 = as_type<float>(_2647);
    }
    float _2649 = _2639;
    float _2651 = _2611 * 0.693147182464599609375;
    float _2653 = fma(_1725, _2533, _2617);
    float _2655 = _2651 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2657 = _2653 + _2541;
    float _2659 = _2651;
    if (!_2373)
    {
        float _2661 = -_2407;
        float _2663 = _2097 + _2661;
        _2659 = _2663;
    }
    float _2665 = _2659;
    float _2667 = _2509;
    if (!_2373)
    {
        float _2669 = rint(_2509);
        float _2671 = precise::max(_2669, 0.0);
        uint _2673 = uint(_2671);
        uint _2675 = clamp(_2673, 0u, 65535u);
        _2667 = as_type<float>(_2675);
    }
    float _2677 = _2667;
    float _2679 = _2623 * _2625;
    float _2681 = _2637 * _2625;
    float _2683 = _2657 * _2429;
    float _2685 = fma(_2679, 0.5, 0.5);
    float _2687 = fma(_2681, -0.5, 0.5);
    float _2689 = _2553;
    float _2691 = _2681;
    if (_2583)
    {
        float3 _7681 = float3(_2515, _2553, float(as_type<int>(_2649)));
        float3 _7685 = select(_7681, float3(0.0), isnan(_7681));
        float _2693 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _7685.xy, uint(rint(_7685.z)), _2683, level(0.0));
        _2689 = _2693;
    }
    float _2695 = _2689;
    float3 _7695 = float3(_2685, _2687, _2655);
    float _2697 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7695, float3(0.0), isnan(_7695)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7695, float3(0.0), isnan(_7695)), level(0.0)).x;
    float3 _7704 = float3(_2685, _2687, _2655);
    float4 _2699 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7704, float3(0.0), isnan(_7704)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7704, float3(0.0), isnan(_7704)), level(0.0)).xyzw;
    float _2701 = _2699.x;
    float _2703 = _2699.y;
    float _2705 = _2699.z;
    float _2707 = _2699.w;
    float _2709 = _2407;
    if (!_2373)
    {
        float3 _7727 = float3(_2665, _2635, float(as_type<int>(_2677)));
        float3 _7729 = select(_7727, float3(0.0), isnan(_7727));
        float _2711 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _7729.xy, uint(rint(_7729.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _7729.xy, uint(rint(_7729.z)), level(0.0)).x;
        _2709 = _2711;
    }
    float _2713 = _2709;
    if (_2373)
    {
        _2691 = 1.0;
    }
    float _2715 = _2691;
    float _2717 = _2715;
    if (!_2373)
    {
        int _2719 = _2393 << 4;
        int _2721 = _2719 + 2048;
        uint _2723 = uint(int(uint(_2721) >> uint(2)));
        uint _2725 = uint(int(uint(int(_2723)) >> uint(2)));
        int _2727 = int(_2723) & 3;
        float _2729 = (*spvDescriptorSet0.vp_c15)._m0[int(_2725)][_2727];
        int _2731 = int(_2723) + 1;
        uint _2733 = uint(int(uint(_2731) >> uint(2)));
        int _2735 = _2731 & 3;
        float _2737 = (*spvDescriptorSet0.vp_c15)._m0[int(_2733)][_2735];
        int _2739 = _2721 + 8;
        uint _2741 = uint(int(uint(_2739) >> uint(2)));
        uint _2743 = uint(int(uint(int(_2741)) >> uint(2)));
        int _2745 = int(_2741) & 3;
        float _2747 = (*spvDescriptorSet0.vp_c15)._m0[int(_2743)][_2745];
        int _2749 = int(_2741) + 1;
        uint _2751 = uint(int(uint(_2749) >> uint(2)));
        int _2753 = _2749 & 3;
        float _2755 = (*spvDescriptorSet0.vp_c15)._m0[int(_2751)][_2753];
        float _2757 = _1773 * _2737;
        float _2759 = fma(_1723, _2729, _2757);
        float _2761 = fma(_1725, _2747, _2759);
        float _2763 = _2761 + _2755;
        float _2765 = precise::clamp(_2763, 0.0, 1.0);
        float _2767 = -_2765;
        float _2769 = _2767 + _2713;
        float _2771 = fma(_2769, 500.0, 1.5);
        float _2773 = exp2(_2771);
        float _2775 = 0.0 + _2773;
        float _2777 = precise::clamp(_2775, 0.0, 1.0);
        _2717 = _2777;
    }
    float _2779 = _2717;
    float _2781 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2783 = _2491 + _2781;
    float _2785 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2787 = _2493 + _2785;
    float _2789 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2791 = _2495 + _2789;
    float _2793 = _2783 * _2783;
    float _2795 = fma(_2787, _2787, _2793);
    float _2797 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2799 = fma(_2791, _2791, _2795);
    float _2801 = rsqrt(_2799);
    float _2803 = sqrt(_2799);
    float _2805 = _2787 * _2801;
    float _2807 = _2791 * _2801;
    float _2809 = _2783 * _2801;
    float _2811 = precise::max(0.0, _2797);
    float _2813 = _2805 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2815 = _2807 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2817 = _2813 * _2813;
    float _2819 = _2815 * _2815;
    float _2821 = -_2809;
    float _2823 = -_2811;
    float _2825 = fma(_2821, (*spvDescriptorSet0.vp_c15)._m0[24].y, _2823);
    float _2827 = _2817 + _2819;
    float _2829 = sqrt(_2827);
    bool _2831 = _2829 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2833 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2835 = _2829 + _2833;
    float _2837 = _2713;
    float _2839 = _2827;
    float _2841 = _2835;
    float _2843 = _2797;
    float _2845 = _2813;
    float _2847 = _2815;
    float _2849 = _2817;
    float _2851 = _2819;
    float _2853 = _2825;
    if (_2831)
    {
        float _2855 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2837 = _2855;
    }
    float _2857 = _2837;
    if (_2831)
    {
        float _2859 = _2825 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2629 = _2859;
    }
    float _2861 = _2629;
    float _2863 = _2861;
    if (_2831)
    {
        float _2865 = rsqrt(_2827);
        _2839 = _2865;
    }
    float _2867 = _2839;
    if (_2831)
    {
        float _2869 = _2835 * _2857;
        _2841 = _2869;
    }
    float _2871 = _2841;
    if (_2831)
    {
        float _2873 = _2871 * 0.15915493667125701904296875;
        _2387 = _2873;
    }
    float _2875 = _2387;
    float _2877 = _2857;
    if (_2831)
    {
        float _2879 = _2875 * 6.283185482025146484375;
        float _2881 = sin(_2879);
        _2877 = _2881;
    }
    float _2883 = _2877;
    float _2885 = _2871;
    if (_2831)
    {
        float _2887 = _2875 * 6.283185482025146484375;
        float _2889 = cos(_2887);
        _2885 = _2889;
    }
    float _2891 = _2885;
    float _2893 = _2883;
    if (_2831)
    {
        float _2895 = fma(_2883, _2861, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2893 = _2895;
    }
    float _2897 = _2893;
    float _2899 = _2897;
    if (_2831)
    {
        float _2901 = _2867 * _2897;
        _2899 = _2901;
    }
    float _2903 = _2899;
    if (_2831)
    {
        float _2905 = _2891 + (-1.0);
        _2843 = _2905;
    }
    float _2907 = _2843;
    if (_2831)
    {
        float _2909 = _2813 * _2903;
        _2845 = _2909;
    }
    float _2911 = _2845;
    if (_2831)
    {
        float _2913 = _2815 * _2903;
        _2847 = _2913;
    }
    float _2915 = _2847;
    if (_2831)
    {
        float _2917 = _2907 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2863 = _2917;
    }
    float _2919 = _2863;
    if (_2831)
    {
        float _2921 = _2911 * _2911;
        _2849 = _2921;
    }
    float _2923 = _2849;
    if (_2831)
    {
        float _2925 = _2915 * _2915;
        _2851 = _2925;
    }
    float _2927 = _2851;
    if (_2831)
    {
        float _2929 = fma(_2825, _2891, _2919);
        _2853 = _2929;
    }
    float _2931 = _2853;
    float _2933 = fma(_2931, _2931, _2923);
    float _2935 = _2933 + _2927;
    float _2937 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2939 = fma(_2803, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2937);
    float _2941 = precise::clamp(_2939, 0.0, 1.0);
    float _2943 = -_2941;
    float _2945 = _2943 + 1.0;
    float _2947 = rsqrt(_2935);
    float _2949 = _2947 * _2911;
    float _2951 = _2947 * _2931;
    float _2953 = _2947 * _2915;
    float _2955 = _2949 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2957 = abs(_2945);
    float _2959 = log2(_2957);
    float _2961 = -_2955;
    float _2963 = fma(_2951, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2961);
    float _2965 = -_2953;
    float _2967 = fma(_2965, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2963);
    float _2969 = _2951 + 1.0;
    float _2971 = fma(_2967, -0.5, 0.5);
    float _2973 = fma(_2967, 0.5, 0.5);
    float _2975 = fma(_2973, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2977 = _2959 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2979 = sqrt(_2971);
    float _2981 = fma(_2973, _2975, -0.212114393711090087890625);
    float _2983 = fma(_2973, _2981, 1.570728778839111328125);
    float _2985 = exp2(_2977);
    float _2987 = _2979 * 0.636619746685028076171875;
    float _2989 = -_2951;
    float _2991 = fma(_2985, _2969, _2989);
    float _2993 = -_2983;
    float _2995 = fma(_2987, _2993, 1.0);
    float _2997 = fma(_2991, 0.5, 0.5);
    float2 _8172 = float2(_2995, _2997);
    float3 _3001 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8172, float2(0.0), isnan(_8172)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8172, float2(0.0), isnan(_8172)), level(0.0)).xyz;
    float _3003 = _3001.x;
    float _3005 = _3001.y;
    float _3007 = _3001.z;
    float _3009 = _1657 * _1709;
    float _3011 = _1637 * 2.0;
    float _3013 = _1625 * 3.883221149444580078125;
    bool _3015 = _1659 != 0.0;
    bool _3017 = isnan(_1659);
    bool _3019 = _3015 || _3017;
    bool _3021 = isnan(0.0);
    bool _3023 = _3019 || _3021;
    float _3025 = -_1445;
    float _3027 = _3025 + _1627;
    float _3029 = -_3011;
    float _3031 = fma(_3009, _3029, _3009);
    float _3033 = _3013 * 0.15915493667125701904296875;
    bool _3035 = _1607 == 0.0;
    bool _3037 = !_3023;
    bool _3039 = _3035 && _3037;
    float _3041 = abs(_2073);
    float _3043 = log2(_3041);
    float _3045 = fma(_1637, 3.1415927410125732421875, _3031);
    float _3047 = fma(_1573, _3027, _1445);
    bool _3049 = _1605 == 0.0;
    bool _3051 = _3049 && _3039;
    float _3053 = _2959 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3055 = _3045 * 0.15915493667125701904296875;
    float _3057 = -_1743;
    float _3059 = _3057 + 1.0;
    float _3061 = _3033 * 6.283185482025146484375;
    float _3063 = cos(_3061);
    bool _3065 = _2073 <= 8000.0;
    bool _3067 = isnan(_2073);
    bool _3069 = _3065 || _3067;
    bool _3071 = isnan(8000.0);
    bool _3073 = _3069 || _3071;
    float _3075 = float(_3073);
    out.m_77.x = _1406;
    out.m_77.y = _1410;
    out.m_79.x = _2493;
    out.m_79.y = _2491;
    out.m_79.z = _2495;
    float _3077 = _3055 * 6.283185482025146484375;
    float _3079 = sin(_3077);
    float _3081 = _3043 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3083 = _3047;
    if (!_3051)
    {
        float _3085 = fma(_1659, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3047);
        _3083 = _3085;
    }
    float _3087 = _3083;
    float _3089 = -_3087;
    float _3091 = _2139 * _3089;
    float _3093 = _2141 * _3087;
    float _3095 = _3033 * 6.283185482025146484375;
    float _3097 = sin(_3095);
    float _3099 = _2169 * _3087;
    float _3101 = exp2(_3081);
    float _3103 = -_1579;
    float _3105 = fma(_3079, _3063, _3103);
    float _3107 = fma(_1573, _3105, _1579);
    float _3109 = -_1581;
    float _3111 = fma(_3079, _3097, _3109);
    float _3113 = _3107;
    if (!_3051)
    {
        float _3115 = fma(_1607, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3107);
        _3113 = _3115;
    }
    float _3117 = _3113;
    float _3119 = exp2(_3053);
    float _3121 = fma(_1573, _3111, _1581);
    float _3123 = fma(_2183, _3117, _3093);
    float _3125 = fma(_2143, _3117, _3091);
    float _3127 = fma(_2189, _3117, _3099);
    float _3129 = fma(_3101, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3131 = precise::clamp(_3129, 0.0, 1.0);
    float _3133 = _3121;
    if (!_3051)
    {
        float _3135 = fma(_1605, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3121);
        _3133 = _3135;
    }
    float _3137 = _3133;
    bool _3139 = _2803 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3141 = isnan(_2803);
    bool _3143 = _3139 || _3141;
    bool _3145 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3147 = _3143 || _3145;
    float _3149 = in.m_81.w;
    float _3151 = fma(_3131, -2.0, 3.0);
    float _3153 = _3131 * _3131;
    float _3155 = fma(_2195, _3137, _3123);
    float _3157 = fma(_2171, _3137, _3125);
    float _3159 = fma(_2185, _3137, _3127);
    float _3161 = _3153 * _3151;
    float _3163 = _3155 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _3165 = _3155 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _3167 = _2551 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3169 = -_3119;
    float _3171 = _3169 + 1.0;
    float _3173 = fma(_3157, (*spvDescriptorSet0.vp_c10)._m0[8].x, _3163);
    float _3175 = fma(_3157, (*spvDescriptorSet0.vp_c10)._m0[9].x, _3165);
    float _3177 = fma(_2561, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3167);
    float _3179 = _3167;
    if (!_2583)
    {
        _3179 = 1.0;
    }
    float _3181 = _3179;
    float _3183 = fma(_3159, (*spvDescriptorSet0.vp_c10)._m0[8].z, _3173);
    float _3185 = -_3161;
    float _3187 = _3185 + 1.0;
    float _3189 = fma(_2567, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3177);
    float _3191 = _3181;
    if (_2583)
    {
        bool _3193 = _2695 >= _2683;
        bool _3195 = isnan(_2695);
        bool _3197 = _3193 || _3195;
        bool _3199 = isnan(_2683);
        bool _3201 = _3197 || _3199;
        float _3203 = float(_3201);
        _3191 = _3203;
    }
    float _3205 = _3191;
    float _3207 = _3171 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3209 = fma(_3187, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3161);
    float _3211 = fma(_2585, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3189);
    float _3213 = _3155 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _3215 = _3207 * _2697;
    float _3217 = _3075 * _3209;
    float _3219 = _3211 + _2601;
    float _3221 = _3205 * _2779;
    float _3223 = fma(_3157, (*spvDescriptorSet0.vp_c10)._m0[10].x, _3213);
    float _3225 = _3217 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.gl_Position.x = _2623;
    out.gl_Position.y = _2637;
    out.gl_Position.z = _3211;
    out.gl_Position.w = _2601;
    float _3227 = _3219 * 0.5;
    float _3229 = -_3207;
    float _3231 = _3229 + 1.0;
    float _3233 = _3059 * _3225;
    float _3235 = precise::clamp(_3233, 0.0, 1.0);
    float _3237 = fma(_3159, (*spvDescriptorSet0.vp_c10)._m0[9].z, _3175);
    float _3239 = fma(_3159, (*spvDescriptorSet0.vp_c10)._m0[10].z, _3223);
    float _3241 = -_3235;
    float _3243 = fma(_3241, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    out.m_83.w = _3149;
    float _3245 = _3225;
    float _3247 = _3221;
    float _3249 = _3231;
    float _3251 = _3227;
    float _3253 = _2601;
    if (!_3147)
    {
        _3245 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3255 = _3245;
    float _3257 = -_3221;
    float _3259 = fma(_3257, _3243, 1.0);
    float _3261 = precise::clamp(_3259, 0.0, 1.0);
    out.m_85.x = _3183;
    out.m_85.y = _3237;
    out.m_85.z = _3239;
    float _3263 = _3261;
    float _3265 = _3255;
    float _3267 = _3255;
    if (!_3147)
    {
        _3247 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3269 = _3247;
    float _3271 = _2707 * _3215;
    float _3273 = _2707 * _3231;
    float _3275 = _3261 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_87.z = _3227;
    out.m_87.w = _2601;
    float _3277 = _3269;
    float _3279 = _3269;
    if (!_3147)
    {
        _3249 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3281 = _3249;
    float _3283 = _3281;
    float _3285 = _3281;
    if (!_3147)
    {
        _3263 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3287 = _3263;
    out.m_89.x = _3275;
    float _3289 = _3287;
    float _3291 = _3287;
    if (!_3147)
    {
        _3251 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3293 = _3251;
    float _3295 = _3293;
    float _3297 = _3293;
    if (!_3147)
    {
        _3253 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3299 = _3253;
    float _3301 = _3007 * _3215;
    float _3303 = fma(_3003, _3271, _2701);
    float _3305 = fma(_3005, _3271, _2703);
    float _3307 = fma(_2707, _3301, _2705);
    out.m_91.x = _3303;
    out.m_91.y = _3305;
    out.m_91.z = _3307;
    out.m_91.w = _3273;
    bool _3309 = !_3147;
    float _3311 = _3299;
    float _3313 = _3299;
    if (!_3309)
    {
        bool _3315 = _2803 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3317 = isnan(_2803);
        bool _3319 = _3315 || _3317;
        bool _3321 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3323 = _3319 || _3321;
        if (!_3323)
        {
            float _3325 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3327 = _2803 + _3325;
            float _3329 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3331 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3329;
            float _3333 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3335 = _3333 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3337 = 1.0 / _3331;
            float _3339 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3341 = _3339 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3343 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3345 = _3343 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3347 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3349 = _3347 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3351 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3353 = _3351 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3355 = _3327 * _3337;
            float _3357 = precise::clamp(_3355, 0.0, 1.0);
            float _3359 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3361 = _3359 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3363 = fma(_3357, _3335, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3365 = fma(_3357, _3361, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3367 = fma(_3357, _3341, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3369 = fma(_3357, _3345, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3371 = fma(_3357, _3349, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3373 = fma(_3357, _3353, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3313 = _3363;
            _3285 = _3371;
            _3297 = _3367;
            _3279 = _3369;
            _3267 = _3365;
            _3291 = _3373;
            _3375 = true;
        }
        else
        {
            bool _3377 = _2803 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3379 = isnan(_2803);
            bool _3381 = _3377 || _3379;
            bool _3383 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3385 = _3381 || _3383;
            if (!_3385)
            {
                _3295 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3387 = _3295;
            _3297 = _3387;
            if (!_3385)
            {
                _3311 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3389 = _3311;
            _3313 = _3389;
            if (!_3385)
            {
                _3265 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3391 = _3265;
            _3267 = _3391;
            if (!_3385)
            {
                _3277 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3393 = _3277;
            _3279 = _3393;
            if (!_3385)
            {
                _3283 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3395 = _3283;
            _3285 = _3395;
            if (!_3385)
            {
                _3289 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3397 = _3289;
            bool _3399 = !_3385;
            _3291 = _3397;
            if (!_3399)
            {
                bool _3401 = _2803 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3403 = isnan(_2803);
                bool _3405 = _3401 || _3403;
                bool _3407 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3409 = _3405 || _3407;
                if (!_3409)
                {
                    float _3411 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3413 = _2803 + _3411;
                    float _3415 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3417 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3415;
                    float _3419 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3421 = _3419 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3423 = 1.0 / _3417;
                    float _3425 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3427 = _3425 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3429 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3431 = _3429 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3433 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3435 = _3433 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3437 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3439 = _3437 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3441 = _3413 * _3423;
                    float _3443 = precise::clamp(_3441, 0.0, 1.0);
                    float _3445 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3447 = _3445 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3449 = fma(_3443, _3421, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3451 = fma(_3443, _3447, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3453 = fma(_3443, _3427, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3455 = fma(_3443, _3431, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3457 = fma(_3443, _3435, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3459 = fma(_3443, _3439, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3313 = _3449;
                    _3285 = _3457;
                    _3297 = _3453;
                    _3279 = _3455;
                    _3267 = _3451;
                    _3291 = _3459;
                    _3375 = true;
                }
                else
                {
                    _3313 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3285 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3297 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3279 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3267 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3291 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3375 = false;
    float _3461 = _3313;
    float _3463 = _3285;
    float _3465 = _3297;
    float _3467 = _3279;
    float _3469 = _3267;
    float _3471 = _3291;
    float _3473 = fma(_3237, -0.5, 0.5);
    float _3475 = precise::clamp(_3473, 0.0, 1.0);
    float _3477 = -_3461;
    float _3479 = _3477 + _3463;
    float _3481 = -_3465;
    float _3483 = _3481 + _3467;
    float _3485 = -_3469;
    float _3487 = _3485 + _3471;
    bool _3489 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3491 = fma(_3475, _3479, _3461);
    float _3493 = fma(_3475, _3483, _3465);
    float _3495 = fma(_3475, _3487, _3469);
    float _3497 = _3491 * 0.586610972881317138671875;
    out.m_61.x = 1.0;
    float _3499 = fma(_3493, 0.298911988735198974609375, _3497);
    float _3501 = fma(_3495, 0.114477999508380889892578125, _3499);
    out.m_93.x = 0.0;
    float _3503 = -_3501;
    float _3505 = _3493 + _3503;
    float _3507 = -_3501;
    float _3509 = _3491 + _3507;
    float _3511 = -_3501;
    float _3513 = _3495 + _3511;
    float _3515 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3517 = fma(_3505, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3501);
    float _3519 = fma(_3509, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3501);
    float _3521 = fma(_3513, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3501);
    out.m_95.x = 0.0;
    out.m_89.w = _3515;
    out.m_97.x = _3517;
    out.m_97.y = _3519;
    out.m_97.z = _3521;
    if (!_3489)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _3523 = -_2491;
    float _3525 = _3523 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _3527 = -_2493;
    float _3529 = _3527 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _3531 = -_2495;
    float _3533 = _3531 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _3535 = _3525 * _3525;
    float _3537 = fma(_3529, _3529, _3535);
    float _3539 = fma(_3533, _3533, _3537);
    float _3541 = rsqrt(_3539);
    float _3543 = sqrt(_3539);
    float _3545 = _3525 * _3541;
    float _3547 = _3529 * _3541;
    float _3549 = _3533 * _3541;
    float _3551 = -_2809;
    float _3553 = _3551 + _3545;
    float _3555 = -_2805;
    float _3557 = _3555 + _3547;
    float _3559 = -_2807;
    float _3561 = _3559 + _3549;
    float _3563 = _3553 * _3553;
    float _3565 = -_3543;
    float _3567 = _3565 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3569 = fma((*spvDescriptorSet0.vp_c13)._m0[4].y, (*spvDescriptorSet0.vp_c13)._m0[4].y, 0.00999999977648258209228515625);
    float _3571 = precise::clamp(_3569, 0.0, 1.0);
    float _3573 = fma(_3557, _3557, _3563);
    float _3575 = _3567 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _3577 = precise::clamp(_3575, 0.0, 1.0);
    float _3579 = _3571 * _3571;
    float _3581 = fma(_3561, _3561, _3573);
    float _3583 = _3579 + (-1.0);
    float _3585 = abs(_3577);
    float _3587 = log2(_3585);
    float _3589 = rsqrt(_3581);
    float _3591 = _3587 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _3593 = exp2(_3591);
    float _3595 = _3553 * _3589;
    float _3597 = _3557 * _3589;
    float _3599 = _3561 * _3589;
    float _3601 = _3547 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _3603 = _3237 * _3595;
    float _3605 = _3237 * _3545;
    float _3607 = fma(_3183, _3597, _3603);
    float _3609 = fma(_3183, _3547, _3605);
    float _3611 = fma(_3239, _3599, _3607);
    float _3613 = precise::clamp(_3611, 0.0, 1.0);
    float _3615 = fma(_3239, _3549, _3609);
    float _3617 = precise::clamp(_3615, 0.0, 1.0);
    float _3619 = _3613 * _3613;
    float _3621 = fma(_3619, _3583, 1.0);
    float _3623 = -_3545;
    float _3625 = -_3601;
    float _3627 = fma(_3623, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3625);
    float _3629 = _3621 * _3621;
    float _3631 = -_3549;
    float _3633 = fma(_3631, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3627);
    float _3635 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _3637 = _3633 + _3635;
    float _3639 = 1.0 / _3629;
    float _3641 = _3637 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _3643 = precise::clamp(_3641, 0.0, 1.0);
    float _3645 = _3593 * _3643;
    float _3647 = _3617 * _3645;
    float _3649 = _3647 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _3651 = _3579 * _3639;
    float _3653 = _3647 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3655 = _3647 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    float _3657 = _3647 * _3651;
    out.m_93.x = _3649;
    out.m_93.y = _3653;
    out.m_93.z = _3655;
    float _3659 = _3657 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _3661 = _3657 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3663 = _3657 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_95.x = _3659;
    out.m_95.y = _3661;
    out.m_95.z = _3663;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

