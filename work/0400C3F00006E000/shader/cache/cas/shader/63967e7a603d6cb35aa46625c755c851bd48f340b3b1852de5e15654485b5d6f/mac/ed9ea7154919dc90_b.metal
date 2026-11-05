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
    constant _16* vp_c9 [[id(1)]];
    constant _16* vp_c15 [[id(2)]];
    constant _16* vp_c8 [[id(3)]];
    constant _16* vp_c10 [[id(4)]];
    constant _16* vp_c16 [[id(5)]];
    constant _16* vp_c13 [[id(6)]];
    constant _16* vp_c7 [[id(7)]];
    texture2d<float> vp_t_tcb_C [[id(8)]];
    sampler vp_t_tcb_CSmplr [[id(9)]];
    texture2d<float> vp_t_tcb_24 [[id(10)]];
    sampler vp_t_tcb_24Smplr [[id(11)]];
    texture2d_array<float> vp_t_tcb_14 [[id(12)]];
    sampler vp_t_tcb_14Smplr [[id(13)]];
    texture2d_array<float> vp_t_tcb_16 [[id(14)]];
    sampler vp_t_tcb_16Smplr [[id(15)]];
    texture3d<float> vp_t_tcb_32 [[id(16)]];
    sampler vp_t_tcb_32Smplr [[id(17)]];
    texture3d<float> vp_t_tcb_30 [[id(18)]];
    sampler vp_t_tcb_30Smplr [[id(19)]];
    texture2d<float> vp_t_tcb_1C [[id(20)]];
    sampler vp_t_tcb_1CSmplr [[id(21)]];
    sampler vp_t_tcb_24Smplr_w [[id(22)]];
    sampler vp_t_tcb_14Smplr_w [[id(23)]];
    sampler vp_t_tcb_32Smplr_w [[id(24)]];
    sampler vp_t_tcb_30Smplr_w [[id(25)]];
    sampler vp_t_tcb_1CSmplr_w [[id(26)]];
    constant dm_border_t* dm_border [[id(27)]];
};

struct main0_out
{
    float4 m_79 [[user(locn0)]];
    float4 m_77 [[user(locn1)]];
    float4 m_63 [[user(locn2)]];
    float4 m_101 [[user(locn3)]];
    float4 m_89 [[user(locn4)]];
    float4 m_85 [[user(locn5)]];
    float4 m_91 [[user(locn6)]];
    float4 m_87 [[user(locn8)]];
    float4 m_93 [[user(locn9)]];
    float4 m_99 [[user(locn10)]];
    float4 m_95 [[user(locn11)]];
    float4 m_97 [[user(locn12)]];
    float4 m_103 [[user(locn13)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_69 [[attribute(1)]];
    float4 m_67 [[attribute(2)]];
    float4 m_71 [[attribute(3)]];
    float4 m_83 [[attribute(4)]];
    float4 m_60 [[attribute(5)]];
    float4 m_65 [[attribute(6)]];
    float4 m_73 [[attribute(9)]];
    float4 m_81 [[attribute(10)]];
    float4 m_75 [[attribute(12)]];
};

static inline __attribute__((always_inline))
int _118(thread const int& _8596, thread const int& _8597, constant _10& support_buffer)
{
    float _8600 = as_type<float>(support_buffer._m4);
    int _8602 = _8597 + as_type<int>(_8600);
    int _8604 = 1 + _8602;
    float _8606 = support_buffer._m5[_8604].x;
    float _8608 = abs(_8606);
    bool _8610 = _8608 == 1.0;
    if (_8610)
    {
        return _8596;
    }
    float _8612 = float(_8596);
    float _8614 = _8612 / _8608;
    int _8616 = int(_8614);
    return _8616;
}

static inline __attribute__((always_inline))
int _119(thread const int& _8646, thread const int& _8647, constant _10& support_buffer)
{
    float _8650 = as_type<float>(support_buffer._m4);
    int _8652 = _8647 + as_type<int>(_8650);
    int _8654 = 1 + _8652;
    float _8656 = support_buffer._m5[_8654].x;
    bool _8658 = _8656 == 1.0;
    if (_8658)
    {
        return _8646;
    }
    float _8660 = float(_8646);
    float _8662 = _8660 * _8656;
    int _8664 = int(_8662);
    return _8664;
}

static inline __attribute__((always_inline))
void _116(thread const int& _8283, thread const int& _8284, thread const int& _8285, thread const int& _8286, thread const int& _8287, thread int& _8288, thread int& _8289, thread int& _8290, thread int& _8291, thread int& _8292, thread int& _8293, thread int& _8294, thread float4& gl_Position, thread float& gl_PointSize)
{
    gl_PointSize = 1.0;
    int _8297 = _8287;
    int _8299 = _8283;
    int _8301 = _8284;
    int _8303 = _8285;
    float _8305 = 0.0 + as_type<float>(_8283);
    bool _8307 = _8305 != 0.0;
    bool _8309 = isnan(_8305);
    bool _8311 = _8307 || _8309;
    bool _8313 = isnan(0.0);
    bool _8315 = _8311 || _8313;
    int _8317 = _8315 ? (-1) : 0;
    if (!_8315)
    {
        float _8319 = as_type<float>(_8283) * 1.0;
        _8297 = as_type<int>(_8319);
    }
    int _8321 = _8297;
    bool _8323 = !_8315;
    int _8325 = _8321;
    int _8327 = _8321;
    if (!_8323)
    {
        bool _8329 = _8305 >= 0.0;
        bool _8331 = isnan(_8305);
        bool _8333 = _8329 || _8331;
        bool _8335 = isnan(0.0);
        bool _8337 = _8333 || _8335;
        _8317 = _8337 ? (-1) : 0;
        if (!_8337)
        {
            _8325 = 2147483647;
        }
        int _8339 = _8325;
        bool _8341 = !_8337;
        int _8343 = _8339;
        _8327 = _8339;
        if (!_8341)
        {
            float _8345 = abs(as_type<float>(_8283));
            float _8347 = 0.0 + _8345;
            bool _8349 = _8347 > as_type<float>(0x7f800000u /* inf */);
            bool _8351 = isnan(_8347);
            bool _8353 = _8349 || _8351;
            bool _8355 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _8357 = _8353 || _8355;
            _8317 = _8357 ? (-1) : 0;
            if (_8357)
            {
                float _8359 = as_type<float>(_8283) + 1.0;
                _8343 = as_type<int>(_8359);
            }
            int _8361 = _8343;
            int _8363 = _8361;
            _8327 = _8361;
            if (!_8357)
            {
                bool _8365 = _8347 != as_type<float>(0x7f800000u /* inf */);
                bool _8367 = isnan(_8347);
                bool _8369 = _8365 || _8367;
                bool _8371 = isnan(as_type<float>(0x7f800000u /* inf */));
                bool _8373 = _8369 || _8371;
                _8317 = _8373 ? (-1) : 0;
                if (!_8373)
                {
                    _8363 = _8283;
                }
                int _8375 = _8363;
                bool _8377 = !_8373;
                _8327 = _8375;
                if (!_8377)
                {
                    float _8379 = as_type<float>(_8283) * 18446744073709551616.0;
                    float _8381 = rsqrt(_8379);
                    float _8383 = _8379 * _8381;
                    float _8385 = _8381 * 0.5;
                    float _8387 = -_8383;
                    float _8389 = 0.0 + _8387;
                    float _8391 = fma(_8385, _8389, 0.5);
                    float _8393 = fma(_8383, _8391, _8383);
                    float _8395 = -_8393;
                    float _8397 = 0.0 + _8395;
                    float _8399 = fma(_8393, _8397, _8379);
                    float _8401 = fma(_8385, _8399, _8393);
                    float _8403 = _8401 * 2.3283064365386962890625e-10;
                    _8299 = as_type<int>(_8379);
                    _8301 = as_type<int>(_8389);
                    _8303 = as_type<int>(_8393);
                    _8327 = as_type<int>(_8403);
                }
            }
        }
    }
    int _8405 = _8299;
    int _8407 = _8301;
    int _8409 = _8303;
    int _8411 = _8327;
    int _8413 = _8317;
    _8288 = _8405;
    _8289 = _8286;
    _8290 = 0;
    _8291 = _8407;
    _8292 = _8409;
    _8293 = _8411;
    _8294 = _8413;
}

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3013 = false;
    bool _1821 = false;
    bool _1095 = false;
    bool _903 = false;
    bool _363 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _123 = in.m_60.w;
    float _125 = trunc(_123);
    int _127 = int(_125);
    bool _131 = _127 >= 1;
    float _133 = 0.0;
    if (!_131)
    {
        _133 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _135 = _133;
    float _137 = _135;
    if (!_131)
    {
        out.m_63.x = 0.0;
    }
    int _139 = 0;
    if (!_131)
    {
        float _141 = _135 * 5.0;
        _139 = as_type<int>(_141);
    }
    int _143 = _139;
    int _145 = _143;
    if (!_131)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3372 = as_type<float>(_143);
        out.gl_Position.z = _3372;
    }
    if (!_131)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _147 = in.m_65.w;
    bool _149 = _147 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _151 = isnan(_147);
    bool _153 = _149 || _151;
    bool _155 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _157 = _153 || _155;
    float _159 = -_147;
    float _161 = _159 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _163 = 0.0;
    float _165 = _161;
    if (_157)
    {
        float _167 = float(_127);
        _163 = _167;
    }
    float _169 = _163;
    bool _171 = _161 >= _169;
    bool _173 = !_157;
    bool _175 = _171 || _173;
    if (_175)
    {
        _137 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _177 = _137;
    if (_175)
    {
        out.m_63.x = 0.0;
    }
    if (_175)
    {
        float _179 = _177 * 5.0;
        _145 = as_type<int>(_179);
    }
    int _181 = _145;
    if (_175)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3441 = as_type<float>(_181);
        out.gl_Position.z = _3441;
    }
    if (_175)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _183 = in.m_67.x;
    float _185 = in.m_67.y;
    float _187 = in.m_67.z;
    float _189 = in.m_69.x;
    float _191 = in.m_69.y;
    float _193 = in.m_69.z;
    float _195 = in.m_71.x;
    float _197 = in.m_71.y;
    float _199 = in.m_71.z;
    float _201 = _183 * _183;
    float _203 = _185 * _185;
    float _205 = _187 * _187;
    float _207 = fma(_189, _189, _201);
    float _209 = fma(_191, _191, _203);
    float _211 = fma(_193, _193, _205);
    float _213 = fma(_195, _195, _207);
    float _215 = fma(_197, _197, _209);
    float _217 = fma(_199, _199, _211);
    float _219 = sqrt(_213);
    float _221 = sqrt(_215);
    float _223 = sqrt(_217);
    bool _225 = _219 > 0.0;
    bool _227 = _221 > 0.0;
    float _229 = _221;
    float _231 = _213;
    float _233 = _215;
    if (_225)
    {
        float _235 = rsqrt(_213);
        _229 = _235;
    }
    float _237 = _229;
    float _239 = 0.0;
    float _241 = 0.0;
    if (!_225)
    {
        _239 = 0.0;
        _241 = 0.0;
    }
    float _243 = _239;
    float _245 = _241;
    bool _247 = _223 > 0.0;
    float _249 = 0.0;
    float _251 = _223;
    float _253 = _243;
    float _255 = _245;
    if (!_225)
    {
        _249 = 0.0;
    }
    float _257 = _249;
    float _259 = 0.0;
    float _261 = _257;
    if (!_227)
    {
        _259 = 0.0;
    }
    float _263 = _259;
    float _265 = _219;
    float _267 = _263;
    if (_227)
    {
        float _269 = rsqrt(_215);
        _265 = _269;
    }
    float _271 = _265;
    float _273 = 0.0;
    if (!_227)
    {
        _273 = 0.0;
    }
    float _275 = _273;
    float _277 = _275;
    if (!_227)
    {
        _251 = 0.0;
    }
    float _279 = _251;
    float _281 = _279;
    if (!_247)
    {
        _231 = 0.0;
    }
    float _283 = _231;
    float _285 = 0.0;
    float _287 = _283;
    if (_247)
    {
        float _289 = rsqrt(_217);
        _285 = _289;
    }
    float _291 = _285;
    float _293 = _237;
    if (_225)
    {
        float _295 = _237 * _189;
        _253 = _295;
    }
    float _297 = _253;
    float _299 = _297;
    if (_225)
    {
        float _301 = _237 * _183;
        _255 = _301;
    }
    float _303 = _255;
    if (_225)
    {
        float _305 = _237 * _195;
        _261 = _305;
    }
    float _307 = _261;
    bool _309 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    if (!_247)
    {
        _233 = 0.0;
        _293 = 0.0;
    }
    float _311 = _233;
    float _313 = _293;
    float _315 = _311;
    float _317 = _313;
    if (_227)
    {
        float _319 = _271 * _191;
        _267 = _319;
    }
    float _321 = _267;
    if (_227)
    {
        float _323 = _271 * _185;
        _277 = _323;
    }
    float _325 = _277;
    if (_227)
    {
        float _327 = _271 * _197;
        _281 = _327;
    }
    float _329 = _281;
    if (_247)
    {
        float _331 = _291 * _193;
        _315 = _331;
    }
    float _333 = _315;
    if (_247)
    {
        float _335 = _291 * _187;
        _287 = _335;
    }
    float _337 = _287;
    if (_247)
    {
        float _339 = _291 * _199;
        _317 = _339;
    }
    float _341 = _317;
    bool _343 = !_309;
    float _361;
    if (!_343)
    {
        float _345 = in.m_73.x;
        float _347 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _349 = _345 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _351 = fma(_349, (*spvDescriptorSet0.vp_c9)._m0[12].x, _161);
        float _353 = _351 * _347;
        float _355 = floor(_353);
        float _357 = -_355;
        float _359 = _353 + _357;
        _361 = _359;
        _363 = true;
    }
    else
    {
        float _365 = float(_127);
        float _367 = 1.0 / _365;
        float _369 = _161 * _367;
        _361 = _369;
    }
    _363 = false;
    float _371 = _361;
    int _373 = int2(spvDescriptorSet0.vp_t_tcb_C.get_width(), spvDescriptorSet0.vp_t_tcb_C.get_height()).x;
    int _375 = _373;
    int _377 = 0;
    int _379 = _118(_375, _377, (*spvDescriptorSet0.support_buffer));
    float _381 = in.m_73.x;
    float _383 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[191].y;
    float _385 = in.m_73.y;
    float _387 = -_383;
    float _389 = _387 + (*spvDescriptorSet0.vp_c9)._m0[191].y;
    float _391 = fma((*spvDescriptorSet0.vp_c10)._m0[2].x, 0.0166666693985462188720703125, _381);
    float _393 = fma(_389, _385, _383);
    float _395 = _391 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _397 = _395 * _393;
    float _399 = float(_379);
    int _401 = abs(_379);
    bool _403 = _379 == 0;
    float _405 = _397 * _399;
    float _407 = float(uint(_401));
    float _409 = trunc(_405);
    int _411 = int(_409);
    float _413 = 1.0 / _407;
    int _415 = abs(_411);
    uint _418 = uint(int(uint(_411) >> uint(31)));
    float _420 = float(uint(_415));
    int _422 = ~int(_418);
    int _424 = _422 + 1;
    int _426 = as_type<int>(_413) + (-2);
    float _428 = as_type<float>(_426) * _420;
    float _430 = trunc(_428);
    float _432 = precise::max(_430, 0.0);
    uint _434 = uint(_432);
    int _436 = ~int(_434);
    int _438 = _436 + 1;
    int _440 = _438 * _401;
    int _442 = _440 + _415;
    float _444 = float(uint(_442));
    float _446 = as_type<float>(_426) * _444;
    float _448 = trunc(_446);
    float _450 = precise::max(_448, 0.0);
    uint _452 = uint(_450);
    int _454 = int(_434) + int(_452);
    float _456 = in.m_75.z;
    int _458 = ~_454;
    int _460 = _458 + 1;
    int _462 = _460 * _401;
    int _464 = _462 + _415;
    bool _466 = uint(_464) >= uint(_401);
    bool _468 = !_466;
    int _470 = _468 ? 0 : (-1);
    int _472 = ~_454;
    int _474 = _472 + _470;
    int _476 = _474 + 1;
    float _478 = trunc(_456);
    int _480 = int(_478);
    int _482 = _476 * _401;
    int _484 = _482 + _415;
    int _486 = _484 ^ _424;
    int _488 = ~_424;
    int _490 = _488 + _486;
    int _492 = _490 + 1;
    bool _494 = !_403;
    int _496 = _494 ? _492 : (-1);
    int _498 = _496;
    int _500 = 0;
    int _502 = _119(_498, _500, (*spvDescriptorSet0.support_buffer));
    int _504 = _480;
    int _506 = 0;
    int _508 = _119(_504, _506, (*spvDescriptorSet0.support_buffer));
    float4 _511 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_502, _508)), 0).xyzw;
    float _513 = _511.x;
    float _515 = _511.y;
    float _517 = _511.z;
    float _519 = _511.w;
    float _521 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _523 = in.m_75.x;
    float _525 = _521 * _381;
    bool _527 = _371 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _529 = isnan(_371);
    bool _531 = _527 || _529;
    bool _533 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _535 = _531 || _533;
    float _537 = float(_535);
    float _539 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _541 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _539;
    int _543 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _545 = _543 != 0;
    int _547 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _549 = _547 != 0;
    float _551 = trunc(_525);
    int _553 = int(_551);
    float _555 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _557 = _371 + _555;
    bool _559 = _381 > 0.5;
    bool _561 = _559 && _545;
    bool _563 = _385 > 0.5;
    bool _565 = _563 && _549;
    float _567 = 1.0 / _541;
    float _569 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _571 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _573 = _496 + 1;
    float _575 = _569 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _577 = _553 << 4;
    int _579 = _577 + 1712;
    float _581 = _571 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    uint _583 = uint(int(uint(_579) >> uint(2)));
    uint _585 = uint(int(uint(int(_583)) >> uint(2)));
    int _587 = int(_583) & 3;
    float _589 = (*spvDescriptorSet0.vp_c9)._m0[int(_585)][_587];
    int _591 = int(_583) + 1;
    uint _593 = uint(int(uint(_591) >> uint(2)));
    int _595 = _591 & 3;
    float _597 = (*spvDescriptorSet0.vp_c9)._m0[int(_593)][_595];
    float _599 = _557 * _567;
    bool _601 = _371 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _603 = isnan(_371);
    bool _605 = _601 || _603;
    bool _607 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _609 = _605 || _607;
    float _611 = float(_609);
    float _613 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _615 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _613;
    float _617 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _619 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _617;
    int _621 = _579 + 8;
    uint _623 = uint(int(uint(_621) >> uint(2)));
    uint _625 = uint(int(uint(int(_623)) >> uint(2)));
    int _627 = int(_623) & 3;
    float _629 = (*spvDescriptorSet0.vp_c9)._m0[int(_625)][_627];
    float _631 = fma(_615, _599, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _633 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _635 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _633;
    float _637 = fma(_619, _599, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _639 = 0.0;
    if (_545)
    {
        _639 = _523;
    }
    float _641 = _639;
    float _643 = fma(_635, _599, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _645 = -_611;
    float _647 = _645 + 1.0;
    float _649 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _651 = _641;
    if (_561)
    {
        float _653 = -_641;
        float _655 = _653 + 1.0;
        _651 = _655;
    }
    float _657 = _651;
    float _659 = _537 * _647;
    float _661 = _649 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _663 = _631 * _659;
    float _665 = _637 * _659;
    float _667 = _643 * _659;
    out.m_77.x = _661;
    out.m_77.y = _575;
    out.m_77.z = _581;
    float _669 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _671 = _589 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _673 = _597 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _675 = -_537;
    float _677 = _675 + 1.0;
    float _679 = _589;
    if (!_545)
    {
        _679 = _523;
    }
    float _681 = _679;
    float _683 = _671 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _685 = _681;
    if (_545)
    {
        _685 = _657;
    }
    float _687 = _685;
    float _689 = fma(_677, (*spvDescriptorSet0.vp_c9)._m0[143].y, _665);
    float _691 = fma(_677, (*spvDescriptorSet0.vp_c9)._m0[143].x, _663);
    float _693 = fma(_677, (*spvDescriptorSet0.vp_c9)._m0[143].z, _667);
    float _695 = fma(_611, (*spvDescriptorSet0.vp_c9)._m0[144].y, _689);
    int _697 = abs(_573);
    float _699 = fma(_611, (*spvDescriptorSet0.vp_c9)._m0[144].z, _693);
    float _701 = fma(_611, (*spvDescriptorSet0.vp_c9)._m0[144].x, _691);
    uint _703 = uint(int(uint(_573) >> uint(31)));
    float _705 = _629 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _707 = float(uint(_697));
    float _709 = _673 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _711 = ~int(_703);
    int _713 = _711 + 1;
    float _715 = _705 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _717 = _687 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _719 = as_type<float>(_426) * _707;
    out.m_79.x = _683;
    out.m_79.y = _709;
    out.m_79.z = _715;
    out.m_79.w = _669;
    float _721 = trunc(_719);
    float _723 = precise::max(_721, 0.0);
    uint _725 = uint(_723);
    int _727 = ~int(_725);
    int _729 = _727 + 1;
    int _731 = _729 * _401;
    int _733 = _731 + _697;
    float _735 = float(uint(_733));
    float _737 = as_type<float>(_426) * _735;
    float _739 = trunc(_737);
    float _741 = precise::max(_739, 0.0);
    uint _743 = uint(_741);
    float _745 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _747 = int(_725) + int(_743);
    float _749 = in.m_81.x;
    float _751 = in.m_81.y;
    float _753 = in.m_81.z;
    int _755 = ~_747;
    int _757 = _755 + 1;
    int _759 = _757 * _401;
    int _761 = _759 + _697;
    float _763 = _717 * _745;
    bool _765 = uint(_761) >= uint(_401);
    bool _767 = !_765;
    int _769 = _767 ? 0 : (-1);
    int _771 = ~_747;
    int _773 = _771 + _769;
    int _775 = _773 + 1;
    float _777 = _695 * _751;
    int _779 = _775 * _401;
    int _781 = _779 + _697;
    float _783 = _701 * _749;
    float _785 = _699 * _753;
    float _787 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _789 = _781 ^ _713;
    int _791 = ~_713;
    int _793 = _791 + _789;
    int _795 = _793 + 1;
    float _797 = in.m_75.y;
    float _799 = _797;
    if (_565)
    {
        float _801 = -_797;
        float _803 = _801 + 1.0;
        _799 = _803;
    }
    float _805 = _799;
    float _807 = _805 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _809 = _807 * _787;
    uint _811 = as_type<uint>(half2(float2(_519, 0.0)));
    uint _813 = extract_bits(_811, 0u, 8u);
    int _815 = int(_813) & 255;
    uint _817 = extract_bits(_811, 8u, 8u);
    int _819 = int(_817) & 255;
    int _821 = _819 << 8;
    int _823 = _815 | _821;
    bool _825 = _823 >= 32768;
    int _827 = _823 + (-1024);
    int _829 = _827;
    if (_825)
    {
        int _831 = ~_823;
        int _833 = _831 + 33792;
        int _835 = _833 + 1;
        _829 = _835;
    }
    int _837 = _829;
    int _839 = _837 + 30719;
    float _841 = float(_839);
    float _843 = fma(_841, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _845 = abs(_843);
    float _847 = -_845;
    float _849 = _847 + 1.0;
    float _851 = abs(_843);
    float _853 = fma(_851, -0.0187292993068695068359375, 0.074261002242565155029296875);
    bool _855 = _843 < 0.0;
    float _857 = float(_855);
    int _859 = as_type<int>(_849) + (-218103808);
    bool _861 = uint(_859) >= 1920991232u;
    float _863 = abs(_843);
    float _865 = fma(_863, _853, -0.212114393711090087890625);
    bool _867 = !_403;
    int _869 = _867 ? _795 : (-1);
    float _871 = abs(_843);
    float _873 = fma(_871, _865, 1.570728778839111328125);
    bool _875 = !_861;
    float _901;
    if (!_875)
    {
        int _877 = as_type<int>(_849);
        int _879 = _795;
        int _881 = as_type<int>(_745);
        int _883 = 3728;
        int _885 = 0;
        int _887;
        int _889;
        int _891;
        int _893;
        int _895;
        int _897;
        int _899;
        _116(_877, _879, _881, _883, _885, _887, _889, _891, _893, _895, _897, _899, out.gl_Position, out.gl_PointSize);
        _901 = as_type<float>(_897);
        _903 = true;
    }
    else
    {
        float _905 = rsqrt(_849);
        float _907 = _849 * _905;
        float _909 = _905 * 0.5;
        float _911 = -_907;
        float _913 = 0.0 + _911;
        float _915 = fma(_909, _913, 0.5);
        float _917 = fma(_907, _915, _907);
        float _919 = -_917;
        float _921 = 0.0 + _919;
        float _923 = fma(_917, _921, _849);
        float _925 = fma(_909, _923, _917);
        _901 = _925;
    }
    _903 = false;
    float _927 = _901;
    int _929 = _869;
    int _931 = 0;
    int _933 = _119(_929, _931, (*spvDescriptorSet0.support_buffer));
    int _935 = _480;
    int _937 = 0;
    int _939 = _119(_935, _937, (*spvDescriptorSet0.support_buffer));
    float4 _941 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_933, _939)), 0).xyzw;
    float _943 = _941.x;
    float _945 = _941.y;
    float _947 = _941.z;
    float _949 = _941.w;
    float _951 = _873 * _927;
    float _953 = _857 * 2.0;
    float _955 = floor(_405);
    float _957 = _841 * 3.883221149444580078125;
    float _959 = -_953;
    float _961 = fma(_951, _959, _951);
    float _963 = _957 * 0.15915493667125701904296875;
    float _965 = fma(_857, 3.1415927410125732421875, _961);
    float _967 = _963 * 6.283185482025146484375;
    float _969 = cos(_967);
    float _971 = _965 * 0.15915493667125701904296875;
    float _973 = -_955;
    float _975 = _405 + _973;
    float _977 = _971 * 6.283185482025146484375;
    float _979 = sin(_977);
    float _981 = _963 * 6.283185482025146484375;
    float _983 = sin(_981);
    float _985 = _979 * _969;
    float _987 = _979 * _983;
    uint _989 = as_type<uint>(half2(float2(_949, 0.0)));
    float _991 = -_513;
    float _993 = _991 + _943;
    float _995 = -_517;
    float _997 = _995 + _947;
    uint _999 = extract_bits(_989, 0u, 8u);
    int _1001 = int(_999) & 255;
    uint _1003 = extract_bits(_989, 8u, 8u);
    int _1005 = int(_1003) & 255;
    int _1007 = _1005 << 8;
    int _1009 = _1001 | _1007;
    float _1011 = fma(_975, _993, _513);
    float _1013 = fma(_975, _997, _517);
    bool _1015 = _1009 >= 32768;
    int _1017 = _1009 + (-1024);
    int _1019 = _1017;
    if (_1015)
    {
        int _1021 = ~_1009;
        int _1023 = _1021 + 33792;
        int _1025 = _1023 + 1;
        _1019 = _1025;
    }
    int _1027 = _1019;
    int _1029 = _1027 + 30719;
    float _1031 = float(_1029);
    float _1033 = fma(_1031, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _1035 = abs(_1033);
    float _1037 = -_1035;
    float _1039 = _1037 + 1.0;
    bool _1041 = _1033 < 0.0;
    float _1043 = float(_1041);
    float _1045 = abs(_1033);
    float _1047 = fma(_1045, -0.0187292993068695068359375, 0.074261002242565155029296875);
    int _1049 = as_type<int>(_1039) + (-218103808);
    float _1051 = abs(_1033);
    float _1053 = fma(_1051, _1047, -0.212114393711090087890625);
    bool _1055 = uint(_1049) >= 1920991232u;
    float _1057 = -_515;
    float _1059 = _1057 + _945;
    float _1061 = abs(_1033);
    float _1063 = fma(_1061, _1053, 1.570728778839111328125);
    float _1065 = fma(_975, _1059, _515);
    bool _1067 = !_1055;
    float _1093;
    if (!_1067)
    {
        int _1069 = as_type<int>(_1039);
        int _1071 = as_type<int>(_963);
        int _1073 = as_type<int>(_983);
        int _1075 = 4624;
        int _1077 = as_type<int>(_951);
        int _1079;
        int _1081;
        int _1083;
        int _1085;
        int _1087;
        int _1089;
        int _1091;
        _116(_1069, _1071, _1073, _1075, _1077, _1079, _1081, _1083, _1085, _1087, _1089, _1091, out.gl_Position, out.gl_PointSize);
        _1093 = as_type<float>(_1089);
        _1095 = true;
    }
    else
    {
        float _1097 = rsqrt(_1039);
        float _1099 = _1039 * _1097;
        float _1101 = _1097 * 0.5;
        float _1103 = -_1099;
        float _1105 = 0.0 + _1103;
        float _1107 = fma(_1101, _1105, 0.5);
        float _1109 = fma(_1099, _1107, _1099);
        float _1111 = -_1109;
        float _1113 = 0.0 + _1111;
        float _1115 = fma(_1109, _1113, _1039);
        float _1117 = fma(_1101, _1115, _1109);
        _1093 = _1117;
    }
    _1095 = false;
    float _1119 = _1093;
    float _1121 = in.m_73.x;
    float _1123 = in.m_73.y;
    float _1125 = in.m_73.z;
    float _1127 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1129 = log2(_1127);
    float _1131 = _1063 * _1119;
    int _1133 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1135 = _1133 != 0;
    int _1137 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1139 = _1137 != 0;
    int _1141 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1143 = _1141 != 0;
    float _1145 = _783 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1147 = _777 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1149 = _785 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1151 = _1031 * 3.883221149444580078125;
    float _1153 = -_843;
    float _1155 = _1153 + _1033;
    float _1157 = _1151 * 0.15915493667125701904296875;
    float _1159 = _1157 * 6.283185482025146484375;
    float _1161 = sin(_1159);
    float _1163 = _1123 * 2.0;
    float _1165 = _1125 * 2.0;
    float _1167 = _1121 * 2.0;
    float _1169 = _1125 + _1121;
    float _1171 = floor(_1163);
    float _1173 = _1169 + (-1.0);
    float _1175 = floor(_1165);
    bool _1177 = _1171 > 0.0;
    float _1179 = floor(_1167);
    bool _1181 = _1171 >= 0.0;
    bool _1183 = isnan(_1171);
    bool _1185 = _1181 || _1183;
    bool _1187 = isnan(0.0);
    bool _1189 = _1185 || _1187;
    int _1191 = _1189 ? 0 : 1;
    bool _1193 = _1175 > 0.0;
    bool _1195 = _1175 >= 0.0;
    bool _1197 = isnan(_1175);
    bool _1199 = _1195 || _1197;
    bool _1201 = isnan(0.0);
    bool _1203 = _1199 || _1201;
    float _1205 = _1129 * _161;
    int _1207 = ~_1191;
    int _1209 = _1207 + 1;
    int _1211 = _1209 + 1;
    float _1213 = fma(_1173, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    int _1215 = _1203 ? 0 : 1;
    float _1217 = exp2(_1205);
    int _1219 = _1211;
    int _1221 = as_type<int>(_1157);
    if (!_1177)
    {
        int _1223 = ~_1191;
        int _1225 = _1223 + 1;
        _1219 = _1225;
    }
    int _1227 = _1219;
    int _1229 = ~_1215;
    int _1231 = _1229 + 1;
    int _1233 = _1231 + 1;
    float _1235 = in.m_83.x;
    float _1237 = in.m_83.y;
    float _1239 = in.m_83.z;
    int _1241 = _1233;
    if (!_1193)
    {
        int _1243 = ~_1215;
        int _1245 = _1243 + 1;
        _1241 = _1245;
    }
    int _1247 = _1241;
    bool _1249 = !_1135;
    int _1251 = _1249 ? 0 : 1;
    float _1253 = _1123 + _1121;
    bool _1255 = _1179 > 0.0;
    float _1257 = _1121 + (-0.5);
    int _1259 = abs(_1251);
    float _1261 = _1253 + (-1.0);
    bool _1263 = !_1143;
    int _1265 = _1263 ? 0 : 1;
    float _1267 = -_1217;
    float _1269 = _1267 + 1.0;
    bool _1271 = _1179 >= 0.0;
    bool _1273 = isnan(_1179);
    bool _1275 = _1271 || _1273;
    bool _1277 = isnan(0.0);
    bool _1279 = _1275 || _1277;
    float _1281 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1283 = 1.0 + _1281;
    int _1285 = abs(_1265);
    float _1287 = float(_1259);
    float _1289 = 1.0 / _1283;
    float _1291 = float(_1247);
    bool _1293 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1295 = isnan(1.0);
    bool _1297 = _1293 || _1295;
    bool _1299 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1301 = _1297 || _1299;
    float _1303 = _1287 * _1291;
    bool _1305 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1307 = isnan(0.0);
    bool _1309 = _1305 || _1307;
    bool _1311 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1313 = _1309 || _1311;
    float _1315 = float(_1285);
    float _1317 = _1303 * (-2.0);
    float _1319 = float(_1227);
    float _1321 = fma(_1261, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1323 = _1313 ? _1269 : 0.0;
    int _1325 = _1279 ? 0 : 1;
    float _1327 = _1315 * _1319;
    float _1329 = fma(_1317, _1235, _1235);
    float _1331 = fma(_1321, _1317, _1321);
    bool _1333 = !_1139;
    int _1335 = _1333 ? 0 : 1;
    if (_1301)
    {
        float _1337 = _1323 * _1289;
        _165 = _1337;
    }
    float _1339 = _165;
    float _1341 = fma(_1257, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1329);
    float _1343 = _1327 * (-2.0);
    int _1345 = ~_1325;
    int _1347 = _1345 + 1;
    int _1349 = _1347 + 1;
    int _1351 = abs(_1335);
    float _1353 = fma(_1331, _1339, _1341);
    int _1355 = _1349;
    if (!_1255)
    {
        int _1357 = ~_1325;
        int _1359 = _1357 + 1;
        _1355 = _1359;
    }
    int _1361 = _1355;
    float _1363 = _1125 + (-0.5);
    float _1365 = fma(_1343, _1239, _1239);
    float _1367 = float(_1351);
    float _1369 = fma(_1213, _1343, _1213);
    float _1371 = float(_1361);
    float _1373 = _1353 * 0.15915493667125701904296875;
    float _1375 = fma(_1363, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1365);
    float _1377 = in.m_69.x;
    float _1379 = in.m_69.y;
    float _1381 = in.m_69.z;
    float _1383 = _1125 + _1123;
    float _1385 = _1367 * _1371;
    float _1387 = _1123 + (-0.5);
    float _1389 = in.m_60.x;
    float _1391 = in.m_60.y;
    float _1393 = in.m_60.z;
    float _1395 = _1383 + (-1.0);
    float _1397 = _1385 * (-2.0);
    float _1399 = fma(_1369, _1339, _1375);
    float _1401 = _1373 * 6.283185482025146484375;
    float _1403 = sin(_1401);
    float _1405 = fma(_1395, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1407 = fma(_1397, _1237, _1237);
    float _1409 = in.m_71.x;
    float _1411 = in.m_71.y;
    float _1413 = in.m_71.z;
    float _1415 = _1399 * 0.15915493667125701904296875;
    float _1417 = fma(_1405, _1397, _1405);
    float _1419 = fma(_1387, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1407);
    bool _1421 = _1065 != 0.0;
    bool _1423 = isnan(_1065);
    bool _1425 = _1421 || _1423;
    bool _1427 = isnan(0.0);
    bool _1429 = _1425 || _1427;
    float _1431 = _1373 * 6.283185482025146484375;
    float _1433 = cos(_1431);
    float _1435 = fma(_1417, _1339, _1419);
    float _1437 = _1043 * 2.0;
    bool _1439 = _1011 == 0.0;
    bool _1441 = !_1429;
    bool _1443 = _1439 && _1441;
    float _1445 = _1435 * 0.15915493667125701904296875;
    float _1447 = -_1437;
    float _1449 = fma(_1131, _1447, _1131);
    float _1451 = _1415 * 6.283185482025146484375;
    float _1453 = sin(_1451);
    float _1455 = fma(_1043, 3.1415927410125732421875, _1449);
    float _1457 = _1379 * _1391;
    bool _1459 = _1013 == 0.0;
    bool _1461 = _1459 && _1443;
    float _1463 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1065);
    float _1465 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1013);
    float _1467 = _1415 * 6.283185482025146484375;
    float _1469 = cos(_1467);
    float _1471 = fma(_1377, _1389, _1457);
    float _1473 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1011);
    float _1475 = _1411 * _1391;
    float _1477 = _1147 * _1463;
    float _1479 = fma(_1381, _1393, _1471);
    float _1481 = _1145 * _1473;
    float _1483 = fma(_1409, _1389, _1475);
    float _1485 = _1445 * 6.283185482025146484375;
    float _1487 = sin(_1485);
    float _1489 = _1403 * _1453;
    float _1491 = _1149 * _1465;
    float _1493 = fma(_1413, _1393, _1483);
    float _1495 = _1433 * _1453;
    float _1497 = _1479 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1499 = _1445 * 6.283185482025146484375;
    float _1501 = cos(_1499);
    float _1503 = _1433 * _1469;
    float _1505 = _1403 * _1469;
    float _1507 = fma(_1487, _1489, _1503);
    float _1509 = _1157 * 6.283185482025146484375;
    float _1511 = cos(_1509);
    float _1513 = _1501 * _1453;
    float _1515 = _1501 * _1469;
    float _1517 = _1403 * _1501;
    float _1519 = _1433 * _1501;
    float _1521 = -_1495;
    float _1523 = fma(_1487, _1505, _1521);
    float _1525 = _1507 * _1477;
    float _1527 = -_1505;
    float _1529 = fma(_1487, _1495, _1527);
    float _1531 = _1517 * _1477;
    float _1533 = _1523 * _1477;
    float _1535 = fma(_1513, _1481, _1525);
    float _1537 = fma(_1487, _1503, _1489);
    float _1539 = -_1487;
    float _1541 = fma(_1539, _1481, _1531);
    float _1543 = fma(_1515, _1481, _1533);
    float _1545 = fma(_1529, _1491, _1535);
    float _1547 = _1455 * 0.15915493667125701904296875;
    float _1549 = fma(_1519, _1491, _1541);
    float _1551 = fma(_1537, _1491, _1543);
    float _1553 = _1545 * _321;
    float _1555 = _1545 * _329;
    float _1557 = in.m_67.x;
    float _1559 = in.m_67.y;
    float _1561 = in.m_67.z;
    float _1563 = _1547 * 6.283185482025146484375;
    float _1565 = sin(_1563);
    float _1567 = fma(_1551, _297, _1553);
    float _1569 = fma(_1551, _307, _1555);
    float _1571 = _1493 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1573 = fma(_1549, _333, _1567);
    float _1575 = fma(_1549, _341, _1569);
    float _1577 = _1497 + _1573;
    float _1579 = _1571 + _1575;
    float _1581 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1583 = _1577 + _1581;
    float _1585 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1587 = _1579 + _1585;
    float _1589 = -_985;
    float _1591 = fma(_1565, _1511, _1589);
    float _1593 = _1583 * _1583;
    float _1595 = _1587 * _1587;
    float _1597 = -_987;
    float _1599 = fma(_1565, _1161, _1597);
    float _1601 = fma(_975, _1591, _985);
    float _1603 = _1593 + _1595;
    float _1605 = _1559 * _1391;
    float _1607 = _1545 * _325;
    float _1609 = fma(_975, _1599, _987);
    float _1611 = sqrt(_1603);
    float _1613 = fma(_1557, _1389, _1605);
    float _1615 = fma(_975, _1155, _843);
    float _1617 = fma(_1551, _303, _1607);
    float _1619 = _1601;
    float _1621 = _1615;
    float _1623 = _1609;
    float _1625 = _1557;
    float _1627 = _1593;
    float _1629 = _1595;
    float _1631 = _1577;
    float _1633 = _1579;
    float _1635 = _1561;
    int _1637 = as_type<int>(_1599);
    float _1639 = _1571;
    float _1641 = _1497;
    if (!_1461)
    {
        float _1643 = fma(_1011, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1601);
        _1619 = _1643;
    }
    float _1645 = _1619;
    float _1647 = fma(_1561, _1393, _1613);
    if (!_1461)
    {
        float _1649 = fma(_1065, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1615);
        _1621 = _1649;
    }
    float _1651 = _1621;
    float _1653 = fma(_1549, _337, _1617);
    if (!_1461)
    {
        float _1655 = fma(_1013, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1609);
        _1623 = _1655;
    }
    float _1657 = _1623;
    float _1659 = _1647 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1661 = _1507 * _1651;
    float _1663 = _1517 * _1651;
    float _1665 = _1523 * _1651;
    float _1667 = fma(_1513, _1645, _1661);
    float _1669 = _1659 + _1653;
    bool _1671 = _1611 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1673 = -_1487;
    float _1675 = fma(_1673, _1645, _1663);
    if (!_1671)
    {
        _1625 = _1669;
    }
    float _1677 = _1625;
    bool _1679 = !_1671;
    float _1681 = _1677;
    if (!_1679)
    {
        float _1683 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1685 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1687 = _1611 + _1685;
        float _1689 = rsqrt(_1603);
        float _1691 = _1687 * _1683;
        float _1693 = _1669 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1695 = _1691 * 0.15915493667125701904296875;
        float _1697 = _1695 * 6.283185482025146484375;
        float _1699 = sin(_1697);
        float _1701 = _1695 * 6.283185482025146484375;
        float _1703 = cos(_1701);
        float _1705 = fma(_1699, _1693, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1707 = _1689 * _1705;
        float _1709 = _1703 + (-1.0);
        float _1711 = _1583 * _1707;
        float _1713 = _1587 * _1707;
        float _1715 = _1709 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1717 = _1711 + (*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1719 = _1711 * _1711;
        float _1721 = _1713 + (*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1723 = fma(_1669, _1703, _1715);
        float _1725 = _1713 * _1713;
        _1681 = _1723;
        _1627 = _1719;
        _1629 = _1725;
        _1631 = _1717;
        _1633 = _1721;
        _1635 = _1695;
    }
    float _1727 = _1681;
    float _1729 = _1627;
    float _1731 = _1629;
    float _1733 = _1631;
    float _1735 = _1633;
    float _1737 = _1635;
    float _1739 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1741 = _1727 + _1739;
    float _1743 = fma(_1515, _1645, _1665);
    float _1745 = fma(_1529, _1657, _1667);
    float _1747 = fma(_1519, _1657, _1675);
    float _1749 = fma(_1741, _1741, _1729);
    float _1751 = fma(_1537, _1657, _1743);
    float _1753 = _1745 * _321;
    float _1755 = _1745 * _325;
    float _1757 = _1749 + _1731;
    float _1759 = _1745 * _329;
    float _1761 = fma(_1751, _297, _1753);
    float _1763 = fma(_1751, _303, _1755);
    out.m_85.x = _763;
    out.m_85.y = _809;
    float _1765 = fma(_1751, _307, _1759);
    float _1767 = sqrt(_1757);
    float _1769 = fma(_1747, _333, _1761);
    float _1771 = fma(_1747, _337, _1763);
    float _1773 = fma(_1747, _341, _1765);
    out.m_87.x = _1769;
    out.m_87.y = _1771;
    out.m_87.z = _1773;
    out.m_89.x = 1.0;
    out.m_89.y = 1.0;
    out.m_89.z = 1.0;
    bool _1775 = _1767 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1777 = isnan(_1767);
    bool _1779 = _1775 || _1777;
    bool _1781 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1783 = _1779 || _1781;
    float _1785 = _1737;
    if (!_1783)
    {
        _1785 = 1.0;
    }
    float _1787 = _1785;
    bool _1789 = !_1783;
    float _1791 = _1787;
    if (!_1789)
    {
        bool _1793 = _1767 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1795 = isnan(_1767);
        bool _1797 = _1793 || _1795;
        bool _1799 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1801 = _1797 || _1799;
        if (!_1801)
        {
            float _1803 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1805 = _1767 + _1803;
            float _1807 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1809 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1807;
            float _1811 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1813 = _1811 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1815 = 1.0 / _1809;
            float _1817 = _1805 * _1815;
            float _1819 = fma(_1817, _1813, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1791 = _1819;
            _1821 = true;
        }
        else
        {
            bool _1823 = _1767 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1825 = isnan(_1767);
            bool _1827 = _1823 || _1825;
            bool _1829 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1831 = _1827 || _1829;
            if (!_1831)
            {
                float _1833 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1835 = _1767 + _1833;
                float _1837 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1839 = _1837 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1841 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1843 = _1841 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1845 = 1.0 / _1839;
                float _1847 = _1835 * _1845;
                float _1849 = fma(_1847, _1843, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1791 = _1849;
                _1821 = true;
            }
            else
            {
                _1791 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1821 = false;
    float _1851 = _1791;
    float _1853 = _1659 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1855 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1857 = _1727 + _1855;
    float _1859 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1861 = _1733 + _1859;
    float _1863 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1865 = _1735 + _1863;
    float _1867 = fma(_1497, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1853);
    float _1869 = fma(_1857, _1851, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1871 = fma(_1861, _1851, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1873 = fma(_1865, _1851, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1875 = fma(_1571, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1867);
    float _1877 = _1659 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1879 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1881 = _1869 + _1879;
    float _1883 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1885 = _1871 + _1883;
    float _1887 = _1875 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1889 = fma(_1497, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1877);
    float _1891 = _1881 * _1881;
    float _1893 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1895 = _1873 + _1893;
    float _1897 = 1.0 / _1887;
    float _1899 = fma(_1571, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1889);
    float _1901 = fma(_1885, _1885, _1891);
    float _1903 = _1869 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1905 = _1899 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1907 = fma(_1895, _1895, _1901);
    float _1909 = _1905 + _1887;
    float _1911 = rsqrt(_1907);
    float _1913 = _1909 * _1897;
    float _1915 = _1913 * 0.5;
    float _1917 = sqrt(_1907);
    float _1919 = fma(_1571, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1921 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1923 = fma(_1915, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1921);
    float _1925 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _1927 = _1659 + _1925;
    float _1929 = 1.0 / _1923;
    float _1931 = _1885 * _1911;
    float _1933 = _1895 * _1911;
    float _1935 = _1927 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1937 = _1881 * _1911;
    float _1939 = _1931 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1941 = _1933 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1943 = fma(_1497, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1935);
    float _1945 = floor(_1919);
    float _1947 = _1939 * _1939;
    float _1949 = _1941 * _1941;
    float _1951 = fma(_1571, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1943);
    float _1953 = _1947 + _1949;
    float _1955 = _1951 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _1957 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1959 = _1929 * _1957;
    float _1961 = _1927 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1963 = sqrt(_1953);
    bool _1965 = _1959 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _1967 = fma(_1497, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1961);
    bool _1969 = _1959 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _1971 = -_1945;
    float _1973 = _1919 + _1971;
    float _1975 = fma(_1571, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1967);
    float _1977 = trunc(_1955);
    int _1979 = int(_1977);
    float _1981 = _1975 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    bool _1983 = !_1965;
    int _1985 = _1983 ? 0 : 1;
    int _1987 = 2;
    float _1989 = _1939;
    float _1991 = _1941;
    float _1993 = _1947;
    float _1995 = _1949;
    float _1997 = _1919;
    if (!_1965)
    {
        _1987 = 1;
    }
    int _1999 = _1987;
    float _2001 = trunc(_1981);
    int _2003 = int(_2001);
    int _2005 = _1999;
    if (!_1969)
    {
        _2005 = _1985;
    }
    int _2007 = _2005;
    bool _2009 = _1963 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2011 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2013 = _1963 + _2011;
    int _2015 = _2007 << 6;
    int _2017 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _2019 = _1979 + _2017;
    int _2021 = _2019 + 1;
    int _2023 = _2015 + 96;
    uint _2025 = uint(int(uint(_2023) >> uint(2)));
    uint _2027 = uint(int(uint(int(_2025)) >> uint(2)));
    int _2029 = int(_2025) & 3;
    float _2031 = (*spvDescriptorSet0.vp_c15)._m0[int(_2027)][_2029];
    int _2033 = int(_2025) + 1;
    uint _2035 = uint(int(uint(_2033) >> uint(2)));
    int _2037 = _2033 & 3;
    float _2039 = (*spvDescriptorSet0.vp_c15)._m0[int(_2035)][_2037];
    float _2041 = _321;
    float _2043 = _2013;
    int _2045 = _2021;
    if (_2009)
    {
        float _2047 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2041 = _2047;
    }
    float _2049 = _2041;
    int _2051 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _2053 = _2003 + _2051;
    int _2055 = _2053 + 1;
    int _2057 = _2015 + 104;
    uint _2059 = uint(int(uint(_2057) >> uint(2)));
    uint _2061 = uint(int(uint(int(_2059)) >> uint(2)));
    int _2063 = int(_2059) & 3;
    float _2065 = (*spvDescriptorSet0.vp_c15)._m0[int(_2061)][_2063];
    int _2067 = int(_2059) + 1;
    uint _2069 = uint(int(uint(_2067) >> uint(2)));
    int _2071 = _2067 & 3;
    float _2073 = (*spvDescriptorSet0.vp_c15)._m0[int(_2069)][_2071];
    bool _2075 = _2055 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _2077 = _2055 | _2021;
    bool _2079 = _2077 < 0;
    bool _2081 = _2079 || _2075;
    bool _2083 = _2021 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _2085 = _2083 || _2081;
    if (_2009)
    {
        float _2087 = _2013 * _2049;
        _2043 = _2087;
    }
    float _2089 = _2043;
    if (_2009)
    {
        float _2091 = _2089 * 0.15915493667125701904296875;
        _299 = _2091;
    }
    float _2093 = _299;
    float _2095 = _1869 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2097 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2099 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2101 = _1763;
    if (_2009)
    {
        float _2103 = _2093 * 6.283185482025146484375;
        float _2105 = sin(_2103);
        _2101 = _2105;
    }
    float _2107 = _2101;
    float _2109 = fma(_1871, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2095);
    float _2111 = precise::max(0.0, _2097);
    if (!_2085)
    {
        int _2113 = _2021 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _2115 = _2113 + _2055;
        _2045 = _2115;
    }
    int _2117 = _2045;
    float _2119 = fma(_1873, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2109);
    float _2121 = -_1937;
    float _2123 = -_2111;
    float _2125 = fma(_2121, (*spvDescriptorSet0.vp_c15)._m0[24].y, _2123);
    float _2127 = _2119 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2129 = _307;
    float _2131 = _2125;
    if (_2009)
    {
        float _2133 = _2093 * 6.283185482025146484375;
        float _2135 = cos(_2133);
        _2129 = _2135;
    }
    float _2137 = _2129;
    if (!_2085)
    {
        int _2139 = _2117 << 2;
        _1637 = _2139;
    }
    int _2141 = _1637;
    float _2143 = _2127 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    int _2145 = _2141;
    if (!_2085)
    {
        uint _2147 = uint(int(uint(_2117) >> uint(2)));
        _1221 = int(_2147);
    }
    int _2149 = _1221;
    if (!_2085)
    {
        int _2151 = 12 & _2141;
        _2145 = _2151;
    }
    int _2153 = _2145;
    float _2155 = _1927 * _2039;
    float _2157 = _2119;
    float _2159 = _2039;
    int _2161 = _2153;
    float _2163 = _2155;
    if (_2009)
    {
        float _2165 = rsqrt(_1953);
        _2157 = _2165;
    }
    float _2167 = _2157;
    if (_2009)
    {
        float _2169 = _2125 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2159 = _2169;
    }
    float _2171 = _2159;
    float _2173 = -_2143;
    float _2175 = fma(_2173, _2099, 1.0);
    float _2177 = fma(_1497, _2031, _2155);
    if (!_2085)
    {
        int _2179 = _2149 << 4;
        int _2181 = _2179 + _2153;
        _2161 = _2181;
    }
    int _2183 = _2161;
    float _2185 = _2107;
    if (_2009)
    {
        float _2187 = fma(_2107, _2171, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2185 = _2187;
    }
    float _2189 = _2185;
    float _2191 = _1869 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    if (_2009)
    {
        float _2193 = _2137 + (-1.0);
        _2163 = _2193;
    }
    float _2195 = _2163;
    float _2197 = fma(_1571, _2065, _2177);
    float _2199 = log2(_2175);
    float _2201 = _2195;
    if (_2009)
    {
        float _2203 = _2195 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2201 = _2203;
    }
    float _2205 = _2201;
    float _2207 = _2197 + _2073;
    float _2209 = fma(_1497, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2211 = _2167;
    if (_2009)
    {
        float _2213 = _2167 * _2189;
        _2211 = _2213;
    }
    float _2215 = _2211;
    if (_2009)
    {
        float _2217 = fma(_2125, _2137, _2205);
        _2131 = _2217;
    }
    float _2219 = _2131;
    int _2221 = _2015 + 56;
    uint _2223 = uint(int(uint(_2221) >> uint(2)));
    uint _2225 = uint(int(uint(int(_2223)) >> uint(2)));
    int _2227 = int(_2223) & 3;
    float _2229 = (*spvDescriptorSet0.vp_c15)._m0[int(_2225)][_2227];
    int _2231 = int(_2223) + 1;
    uint _2233 = uint(int(uint(_2231) >> uint(2)));
    int _2235 = _2231 & 3;
    float _2237 = (*spvDescriptorSet0.vp_c15)._m0[int(_2233)][_2235];
    float _2239 = floor(_2209);
    if (_2009)
    {
        float _2241 = _1939 * _2215;
        _1989 = _2241;
    }
    float _2243 = _1989;
    if (_2009)
    {
        float _2245 = _1941 * _2215;
        _1991 = _2245;
    }
    float _2247 = _1991;
    if (_2009)
    {
        float _2249 = _2243 * _2243;
        _1993 = _2249;
    }
    float _2251 = _1993;
    if (_2009)
    {
        float _2253 = _2247 * _2247;
        _1995 = _2253;
    }
    float _2255 = _1995;
    int _2257 = _2015 + 48;
    uint _2259 = uint(int(uint(_2257) >> uint(2)));
    uint _2261 = uint(int(uint(int(_2259)) >> uint(2)));
    int _2263 = int(_2259) & 3;
    float _2265 = (*spvDescriptorSet0.vp_c15)._m0[int(_2261)][_2263];
    int _2267 = int(_2259) + 1;
    uint _2269 = uint(int(uint(_2267) >> uint(2)));
    int _2271 = _2267 & 3;
    float _2273 = (*spvDescriptorSet0.vp_c15)._m0[int(_2269)][_2271];
    float _2275 = _2199 * 0.693147182464599609375;
    float _2277 = fma(_2219, _2219, _2251);
    float _2279 = _1869 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2281 = _2277 + _2255;
    float _2283 = fma(_1871, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2279);
    int _2285 = _2015 + 64;
    uint _2287 = uint(int(uint(_2285) >> uint(2)));
    uint _2289 = uint(int(uint(int(_2287)) >> uint(2)));
    int _2291 = int(_2287) & 3;
    float _2293 = (*spvDescriptorSet0.vp_c15)._m0[int(_2289)][_2291];
    int _2295 = int(_2287) + 1;
    uint _2297 = uint(int(uint(_2295) >> uint(2)));
    int _2299 = _2295 & 3;
    float _2301 = (*spvDescriptorSet0.vp_c15)._m0[int(_2297)][_2299];
    float _2303 = fma(_1871, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2191);
    float _2305 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2307 = fma(_1917, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2305);
    float _2309 = precise::clamp(_2307, 0.0, 1.0);
    float _2311 = fma(_1873, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2283);
    float _2313 = fma(_1871, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1903);
    float _2315 = fma(_1873, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2303);
    float _2317 = -_2309;
    float _2319 = _2317 + 1.0;
    float _2321 = _2311 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    int _2323 = _2015 + 72;
    uint _2325 = uint(int(uint(_2323) >> uint(2)));
    uint _2327 = uint(int(uint(int(_2325)) >> uint(2)));
    int _2329 = int(_2325) & 3;
    float _2331 = (*spvDescriptorSet0.vp_c15)._m0[int(_2327)][_2329];
    int _2333 = int(_2325) + 1;
    uint _2335 = uint(int(uint(_2333) >> uint(2)));
    int _2337 = _2333 & 3;
    float _2339 = (*spvDescriptorSet0.vp_c15)._m0[int(_2335)][_2337];
    float _2341 = _2315 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2343 = fma(_1873, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2313);
    float _2345 = _2321 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2347 = rsqrt(_2281);
    float _2349 = -_2239;
    float _2351 = _2209 + _2349;
    float _2353 = _2343 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2355 = fma(_2341, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2345);
    int _2357 = _2015 + 80;
    uint _2359 = uint(int(uint(_2357) >> uint(2)));
    uint _2361 = uint(int(uint(int(_2359)) >> uint(2)));
    int _2363 = int(_2359) & 3;
    float _2365 = (*spvDescriptorSet0.vp_c15)._m0[int(_2361)][_2363];
    int _2367 = int(_2359) + 1;
    uint _2369 = uint(int(uint(_2367) >> uint(2)));
    int _2371 = _2367 & 3;
    float _2373 = (*spvDescriptorSet0.vp_c15)._m0[int(_2369)][_2371];
    float _2375 = fma(_2127, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2355);
    float _2377 = 1.0 / _2207;
    float _2379 = fma(_2353, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2375);
    int _2381 = _2015 + 88;
    uint _2383 = uint(int(uint(_2381) >> uint(2)));
    uint _2385 = uint(int(uint(int(_2383)) >> uint(2)));
    int _2387 = int(_2383) & 3;
    float _2389 = (*spvDescriptorSet0.vp_c15)._m0[int(_2385)][_2387];
    int _2391 = int(_2383) + 1;
    uint _2393 = uint(int(uint(_2391) >> uint(2)));
    int _2395 = _2391 & 3;
    float _2397 = (*spvDescriptorSet0.vp_c15)._m0[int(_2393)][_2395];
    float _2399 = _2347 * _2243;
    float _2401 = _2347 * _2219;
    float _2403 = abs(_2319);
    float _2405 = log2(_2403);
    float _2407 = _2347 * _2247;
    float _2409 = _2355;
    if (!_2085)
    {
        int _2411 = _2183 + 400;
        uint _2413 = uint(int(uint(_2411) >> uint(2)));
        uint _2415 = uint(int(uint(int(_2413)) >> uint(2)));
        int _2417 = int(_2413) & 3;
        float _2419 = (*spvDescriptorSet0.vp_c15)._m0[int(_2415)][_2417];
        _2409 = _2419;
    }
    float _2421 = _2409;
    float _2423 = _2399 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2425 = _2275 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2427 = 1.0 / _2379;
    float _2429 = _1927 * _2273;
    float _2431 = -_2423;
    float _2433 = fma(_2401, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2431);
    float _2435 = fma(_1497, _2265, _2429);
    float _2437 = _2405 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2439 = _1927 * _2301;
    float _2441 = fma(_1571, _2229, _2435);
    float _2443 = exp2(_2437);
    float _2445 = fma(_1497, _2293, _2439);
    float _2447 = _2441 + _2237;
    float _2449 = -_2407;
    float _2451 = fma(_2449, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2433);
    float _2453 = fma(_1571, _2331, _2445);
    float _2455 = _2447 * _2377;
    float _2457 = _2433;
    if (!_2085)
    {
        float _2459 = floor(_1955);
        _2457 = _2459;
    }
    float _2461 = _2457;
    float _2463 = _2453 + _2339;
    float _2465 = fma(_2451, -0.5, 0.5);
    bool _2467 = _2455 >= 0.0;
    float _2469 = fma(_2451, 0.5, 0.5);
    float _2471 = _2463 * _2377;
    float _2473 = _1927 * _2373;
    bool _2475 = _2455 <= 1.0;
    bool _2477 = _2475 && _2467;
    float _2479 = sqrt(_2465);
    float _2481 = fma(_1497, _2365, _2473);
    bool _2483 = _2471 >= 0.0;
    bool _2485 = _2483 && _2477;
    float _2487 = fma(_1571, _2389, _2481);
    bool _2489 = _2471 <= 1.0;
    bool _2491 = _2489 && _2485;
    if (!_2085)
    {
        float _2493 = -_2461;
        float _2495 = _1955 + _2493;
        _1997 = _2495;
    }
    float _2497 = _1997;
    float _2499 = _2321 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2501 = fma(_2469, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2503 = _2487 + _2397;
    float _2505 = _2321 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2507 = _2389;
    if (!_2085)
    {
        float _2509 = floor(_1981);
        _2507 = _2509;
    }
    float _2511 = _2507;
    float _2513 = fma(_2469, _2501, -0.212114393711090087890625);
    float _2515 = fma(_2341, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2499);
    float _2517 = fma(_2341, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2505);
    float _2519 = _2401 + 1.0;
    float _2521 = fma(_2469, _2513, 1.570728778839111328125);
    float _2523 = fma(_2127, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2515);
    float _2525 = _2513;
    if (_2491)
    {
        float _2527 = float(_2007);
        _2525 = _2527;
    }
    float _2529 = _2525;
    float _2531 = _2499;
    if (!_2085)
    {
        float _2533 = rint(_2421);
        float _2535 = precise::max(_2533, 0.0);
        uint _2537 = uint(_2535);
        uint _2539 = clamp(_2537, 0u, 65535u);
        _2531 = as_type<float>(_2539);
    }
    float _2541 = _2531;
    float _2543 = fma(_2127, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2517);
    float _2545 = -_2401;
    float _2547 = fma(_2443, _2519, _2545);
    float _2549 = fma(_2353, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2523);
    float _2551 = _2479 * 0.636619746685028076171875;
    float _2553 = fma(_2353, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2543);
    float _2555 = _2503 * _2377;
    float _2557 = _2549 * _2427;
    float _2559 = _2529;
    float _2561 = _2551;
    float _2563 = _2553;
    if (_2491)
    {
        float _2565 = rint(_2529);
        float _2567 = precise::max(_2565, 0.0);
        uint _2569 = uint(_2567);
        uint _2571 = clamp(_2569, 0u, 65535u);
        _2559 = as_type<float>(_2571);
    }
    float _2573 = _2559;
    float _2575 = _2553 * _2427;
    float _2577 = -_2521;
    float _2579 = fma(_2551, _2577, 1.0);
    if (!_2085)
    {
        float _2581 = -_2511;
        float _2583 = _1981 + _2581;
        _2561 = _2583;
    }
    float _2585 = _2561;
    float _2587 = fma(_2557, 0.5, 0.5);
    float _2589 = fma(_2575, -0.5, 0.5);
    float _2591 = fma(_2547, 0.5, 0.5);
    float2 _7026 = float2(_2351, _1973);
    float _2593 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_7026, float2(0.0), isnan(_7026)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_7026, float2(0.0), isnan(_7026)), level(0.0)).x;
    float _2595 = _2541;
    if (!_2085)
    {
        float3 _7043 = float3(_2585, _2497, float(as_type<int>(_2541)));
        float3 _7047 = select(_7043, float3(0.0), isnan(_7043));
        float _2597 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _7047.xy, uint(rint(_7047.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _7047.xy, uint(rint(_7047.z)), level(0.0)).x;
        _2595 = _2597;
    }
    float _2599 = _2595;
    float _2601 = _2573;
    if (_2491)
    {
        float3 _7062 = float3(_2455, _2471, float(as_type<int>(_2573)));
        float3 _7064 = select(_7062, float3(0.0), isnan(_7062));
        float _2603 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _7064.xy, uint(rint(_7064.z)), _2555, level(0.0));
        _2601 = _2603;
    }
    float _2605 = _2601;
    float3 _7074 = float3(_2587, _2589, _2425);
    float _2607 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7074, float3(0.0), isnan(_7074)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7074, float3(0.0), isnan(_7074)), level(0.0)).x;
    float3 _7083 = float3(_2587, _2589, _2425);
    float4 _2609 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7083, float3(0.0), isnan(_7083)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7083, float3(0.0), isnan(_7083)), level(0.0)).xyzw;
    float _2611 = _2609.x;
    float _2613 = _2609.y;
    float _2615 = _2609.z;
    float _2617 = _2609.w;
    float2 _7099 = float2(_2579, _2591);
    float3 _2621 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7099, float2(0.0), isnan(_7099)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7099, float2(0.0), isnan(_7099)), level(0.0)).xyz;
    float _2623 = _2621.x;
    float _2625 = _2621.y;
    float _2627 = _2621.z;
    float _2629 = abs(_1959);
    float _2631 = log2(_2629);
    float _2633 = _2321 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2635 = _2405 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2637 = fma(_2341, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2633);
    float _2639 = exp2(_2635);
    float _2641 = fma(_2127, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2637);
    float _2643 = fma(_2353, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2641);
    float _2645 = _2631 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2647 = _2643 + _2379;
    out.gl_Position.x = _2549;
    out.gl_Position.y = _2553;
    out.gl_Position.z = _2643;
    out.gl_Position.w = _2379;
    float _2649 = _2647 * 0.5;
    float _2651 = exp2(_2645);
    out.m_91.z = _2649;
    out.m_91.w = _2379;
    bool _2653 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2655 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2657 = _2653 || _2655;
    bool _2659 = isnan(0.5);
    bool _2661 = _2657 || _2659;
    float _2663 = fma(_2651, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2665 = precise::clamp(_2663, 0.0, 1.0);
    float _2667 = fma(_2665, -2.0, 3.0);
    float _2669 = _2665 * _2665;
    float _2671 = _2669 * _2667;
    bool _2673 = _1959 <= 8000.0;
    bool _2675 = isnan(_1959);
    bool _2677 = _2673 || _2675;
    bool _2679 = isnan(8000.0);
    bool _2681 = _2677 || _2679;
    float _2683 = float(_2681);
    float _2685 = -_2671;
    float _2687 = _2685 + 1.0;
    float _2689 = fma(_2687, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2671);
    float _2691 = _2683 * _2689;
    float _2693 = _2683;
    if (_2661)
    {
        _2693 = 1.0;
    }
    float _2695 = _2693;
    float _2697 = _2695;
    float _2699 = _2623;
    float _2701 = _2625;
    if (!_2661)
    {
        float _2703 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2705 = _2703 * 0.15915493667125701904296875;
        float _2707 = _2705 * 6.283185482025146484375;
        float _2709 = cos(_2707);
        float _2711 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2713 = _2711 * 0.15915493667125701904296875;
        float _2715 = _2705 * 6.283185482025146484375;
        float _2717 = sin(_2715);
        float _2719 = 1.0 / _2709;
        float _2721 = _2713 * 6.283185482025146484375;
        float _2723 = cos(_2721);
        float _2725 = _2717 * _2719;
        float _2727 = _2713 * 6.283185482025146484375;
        float _2729 = sin(_2727);
        float _2731 = _2723 * _2725;
        float _2733 = 1.0 / _2731;
        float _2735 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2737 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2735;
        float _2739 = 1.0 / _2737;
        float _2741 = _2729 * _2733;
        float _2743 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2745 = fma(_1959, _2741, _2743);
        float _2747 = _2745 * _2739;
        float _2749 = precise::clamp(_2747, 0.0, 1.0);
        _2563 = _2739;
        _2697 = _2749;
    }
    float _2751 = _2563;
    float _2753 = _2697;
    float _2755 = _2691 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2757 = -_2593;
    float _2759 = _2757 + 1.0;
    float _2761 = -_2639;
    float _2763 = _2761 + 1.0;
    float _2765 = _2751;
    float _2767 = _2755;
    if (!_2491)
    {
        _2765 = 1.0;
    }
    float _2769 = _2765;
    float _2771 = _2759 * _2755;
    float _2773 = precise::clamp(_2771, 0.0, 1.0);
    float _2775 = _2769;
    if (_2491)
    {
        bool _2777 = _2605 >= _2555;
        bool _2779 = isnan(_2605);
        bool _2781 = _2777 || _2779;
        bool _2783 = isnan(_2555);
        bool _2785 = _2781 || _2783;
        float _2787 = float(_2785);
        _2775 = _2787;
    }
    float _2789 = _2775;
    float _2791 = _2763 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    if (_2085)
    {
        _2767 = 1.0;
    }
    float _2793 = _2767;
    float _2795 = _2793;
    if (!_2085)
    {
        int _2797 = _2117 << 4;
        int _2799 = _2797 + 2048;
        uint _2801 = uint(int(uint(_2799) >> uint(2)));
        uint _2803 = uint(int(uint(int(_2801)) >> uint(2)));
        int _2805 = int(_2801) & 3;
        float _2807 = (*spvDescriptorSet0.vp_c15)._m0[int(_2803)][_2805];
        int _2809 = int(_2801) + 1;
        uint _2811 = uint(int(uint(_2809) >> uint(2)));
        int _2813 = _2809 & 3;
        float _2815 = (*spvDescriptorSet0.vp_c15)._m0[int(_2811)][_2813];
        int _2817 = _2799 + 8;
        uint _2819 = uint(int(uint(_2817) >> uint(2)));
        uint _2821 = uint(int(uint(int(_2819)) >> uint(2)));
        int _2823 = int(_2819) & 3;
        float _2825 = (*spvDescriptorSet0.vp_c15)._m0[int(_2821)][_2823];
        int _2827 = int(_2819) + 1;
        uint _2829 = uint(int(uint(_2827) >> uint(2)));
        int _2831 = _2827 & 3;
        float _2833 = (*spvDescriptorSet0.vp_c15)._m0[int(_2829)][_2831];
        float _2835 = _1927 * _2815;
        float _2837 = fma(_1497, _2807, _2835);
        float _2839 = fma(_1571, _2825, _2837);
        float _2841 = _2839 + _2833;
        float _2843 = precise::clamp(_2841, 0.0, 1.0);
        float _2845 = -_2843;
        float _2847 = _2845 + _2599;
        float _2849 = fma(_2847, 500.0, 1.5);
        float _2851 = exp2(_2849);
        float _2853 = 0.0 + _2851;
        float _2855 = precise::clamp(_2853, 0.0, 1.0);
        _2795 = _2855;
        _1639 = _2843;
        _1641 = 500.0;
    }
    float _2857 = _2795;
    float _2859 = _1639;
    float _2861 = _1641;
    float _2863 = _2789 * _2857;
    float _2865 = _2791 * _2607;
    float _2867 = -_2773;
    float _2869 = fma(_2867, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2871 = -_2791;
    float _2873 = _2871 + 1.0;
    out.m_93.x = _1871;
    out.m_93.y = _1869;
    out.m_93.z = _1873;
    float _2875 = _2617 * _2865;
    float _2877 = -_2863;
    float _2879 = fma(_2877, _2869, 1.0);
    float _2881 = precise::clamp(_2879, 0.0, 1.0);
    float _2883 = _2627 * _2865;
    float _2885 = _2617 * _2873;
    float _2887 = fma(_2623, _2875, _2611);
    float _2889 = fma(_2625, _2875, _2613);
    float _2891 = _2881 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2893 = fma(_2617, _2883, _2615);
    bool _2895 = _1917 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2897 = isnan(_1917);
    bool _2899 = _2895 || _2897;
    bool _2901 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2903 = _2899 || _2901;
    float _2905 = _2753 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_95.x = _2891;
    out.m_97.x = _2887;
    out.m_97.y = _2889;
    out.m_97.z = _2893;
    out.m_97.w = _2885;
    float _2907 = _2861;
    float _2909 = _2859;
    float _2911 = _2875;
    float _2913 = _2873;
    if (!_2903)
    {
        _2699 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2915 = _2699;
    float _2917 = _2915;
    float _2919 = _2915;
    if (!_2903)
    {
        _2701 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2921 = _2701;
    float _2923 = _2921;
    float _2925 = _2921;
    if (!_2903)
    {
        _2907 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2927 = _2907;
    float _2929 = _2927;
    float _2931 = _2927;
    if (!_2903)
    {
        _2909 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2933 = _2909;
    float _2935 = _2933;
    float _2937 = _2933;
    if (!_2903)
    {
        _2911 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2939 = _2911;
    float _2941 = _2939;
    float _2943 = _2939;
    if (!_2903)
    {
        _2913 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2945 = _2913;
    bool _2947 = !_2903;
    float _2949 = _2945;
    float _2951 = _2945;
    if (!_2947)
    {
        bool _2953 = _1917 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2955 = isnan(_1917);
        bool _2957 = _2953 || _2955;
        bool _2959 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2961 = _2957 || _2959;
        if (!_2961)
        {
            float _2963 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2965 = _1917 + _2963;
            float _2967 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2969 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2967;
            float _2971 = 1.0 / _2969;
            float _2973 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2975 = _2973 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2977 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2979 = _2977 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2981 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2983 = _2981 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2985 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2987 = _2985 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2989 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2991 = _2989 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2993 = _2965 * _2971;
            float _2995 = precise::clamp(_2993, 0.0, 1.0);
            float _2997 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2999 = _2997 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3001 = fma(_2995, _2975, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3003 = fma(_2995, _2999, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3005 = fma(_2995, _2979, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3007 = fma(_2995, _2983, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3009 = fma(_2995, _2987, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3011 = fma(_2995, _2991, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2925 = _3001;
            _2943 = _3009;
            _2919 = _3003;
            _2937 = _3007;
            _2931 = _3005;
            _2951 = _3011;
            _3013 = true;
        }
        else
        {
            bool _3015 = _1917 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3017 = isnan(_1917);
            bool _3019 = _3015 || _3017;
            bool _3021 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3023 = _3019 || _3021;
            if (!_3023)
            {
                _2917 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3025 = _2917;
            _2919 = _3025;
            if (!_3023)
            {
                _2923 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3027 = _2923;
            _2925 = _3027;
            if (!_3023)
            {
                _2929 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3029 = _2929;
            _2931 = _3029;
            if (!_3023)
            {
                _2935 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3031 = _2935;
            _2937 = _3031;
            if (!_3023)
            {
                _2941 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3033 = _2941;
            _2943 = _3033;
            if (!_3023)
            {
                _2949 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3035 = _2949;
            bool _3037 = !_3023;
            _2951 = _3035;
            if (!_3037)
            {
                bool _3039 = _1917 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3041 = isnan(_1917);
                bool _3043 = _3039 || _3041;
                bool _3045 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3047 = _3043 || _3045;
                if (!_3047)
                {
                    float _3049 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3051 = _1917 + _3049;
                    float _3053 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3055 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3053;
                    float _3057 = 1.0 / _3055;
                    float _3059 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3061 = _3059 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3063 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3065 = _3063 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3067 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3069 = _3067 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3071 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3073 = _3071 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3075 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3077 = _3075 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3079 = _3051 * _3057;
                    float _3081 = precise::clamp(_3079, 0.0, 1.0);
                    float _3083 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3085 = _3083 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3087 = fma(_3081, _3061, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3089 = fma(_3081, _3085, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3091 = fma(_3081, _3065, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3093 = fma(_3081, _3069, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3095 = fma(_3081, _3073, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3097 = fma(_3081, _3077, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2925 = _3087;
                    _2943 = _3095;
                    _2919 = _3089;
                    _2937 = _3093;
                    _2931 = _3091;
                    _2951 = _3097;
                    _3013 = true;
                }
                else
                {
                    _2925 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2943 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2919 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2937 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2931 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2951 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3013 = false;
    float _3099 = _2925;
    float _3101 = _2943;
    float _3103 = _2919;
    float _3105 = _2937;
    float _3107 = _2931;
    float _3109 = _2951;
    float _3111 = fma(_1771, -0.5, 0.5);
    float _3113 = precise::clamp(_3111, 0.0, 1.0);
    float _3115 = -_3099;
    float _3117 = _3115 + _3101;
    float _3119 = -_3103;
    float _3121 = _3119 + _3105;
    out.m_99.x = 0.0;
    float _3123 = -_3107;
    float _3125 = _3123 + _3109;
    float _3127 = fma(_3113, _3117, _3099);
    out.m_101.x = 0.0;
    float _3129 = fma(_3113, _3121, _3103);
    float _3131 = _3127 * 0.586610972881317138671875;
    bool _3133 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3135 = fma(_3113, _3125, _3107);
    float _3137 = fma(_3129, 0.298911988735198974609375, _3131);
    float _3139 = _2905 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    bool _3141 = _2753 > 0.0;
    bool _3143 = isnan(_2753);
    bool _3145 = _3141 || _3143;
    bool _3147 = isnan(0.0);
    bool _3149 = _3145 || _3147;
    float _3151 = fma(_3135, 0.114477999508380889892578125, _3137);
    out.m_63.x = _3139;
    float _3153 = -_3151;
    float _3155 = _3129 + _3153;
    float _3157 = -_3151;
    float _3159 = _3127 + _3157;
    float _3161 = -_3151;
    float _3163 = _3135 + _3161;
    float _3165 = fma(_3155, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3151);
    float _3167 = fma(_3159, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3151);
    float _3169 = fma(_3163, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3151);
    bool _3171 = !_3133;
    if (!_3171)
    {
        float _3173 = -_1869;
        float _3175 = _3173 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3177 = -_1871;
        float _3179 = _3177 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3181 = -_1873;
        float _3183 = _3181 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3185 = _3175 * _3175;
        float _3187 = fma(_3179, _3179, _3185);
        float _3189 = fma(_3183, _3183, _3187);
        float _3191 = rsqrt(_3189);
        float _3193 = sqrt(_3189);
        float _3195 = _3175 * _3191;
        float _3197 = _3179 * _3191;
        float _3199 = _3183 * _3191;
        float _3201 = -_1937;
        float _3203 = _3201 + _3195;
        float _3205 = -_1931;
        float _3207 = _3205 + _3197;
        float _3209 = -_1933;
        float _3211 = _3209 + _3199;
        float _3213 = _3203 * _3203;
        float _3215 = -_3193;
        float _3217 = _3215 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3219 = fma((*spvDescriptorSet0.vp_c13)._m0[4].y, (*spvDescriptorSet0.vp_c13)._m0[4].y, 0.00999999977648258209228515625);
        float _3221 = precise::clamp(_3219, 0.0, 1.0);
        float _3223 = fma(_3207, _3207, _3213);
        float _3225 = _3217 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3227 = precise::clamp(_3225, 0.0, 1.0);
        float _3229 = _3221 * _3221;
        float _3231 = fma(_3211, _3211, _3223);
        float _3233 = _3229 + (-1.0);
        float _3235 = abs(_3227);
        float _3237 = log2(_3235);
        float _3239 = rsqrt(_3231);
        float _3241 = _3237 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3243 = exp2(_3241);
        float _3245 = _3203 * _3239;
        float _3247 = _3207 * _3239;
        float _3249 = _3211 * _3239;
        float _3251 = _3197 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3253 = _1771 * _3245;
        float _3255 = _1771 * _3195;
        float _3257 = fma(_1769, _3247, _3253);
        float _3259 = fma(_1769, _3197, _3255);
        float _3261 = fma(_1773, _3249, _3257);
        float _3263 = precise::clamp(_3261, 0.0, 1.0);
        float _3265 = fma(_1773, _3199, _3259);
        float _3267 = precise::clamp(_3265, 0.0, 1.0);
        float _3269 = _3263 * _3263;
        float _3271 = fma(_3269, _3233, 1.0);
        float _3273 = -_3195;
        float _3275 = -_3251;
        float _3277 = fma(_3273, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3275);
        float _3279 = _3271 * _3271;
        float _3281 = -_3199;
        float _3283 = fma(_3281, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3277);
        float _3285 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3287 = _3283 + _3285;
        float _3289 = 1.0 / _3279;
        float _3291 = _3287 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3293 = precise::clamp(_3291, 0.0, 1.0);
        float _3295 = _3243 * _3293;
        float _3297 = _3267 * _3295;
        float _3299 = _3297 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3301 = _3229 * _3289;
        float _3303 = _3297 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3305 = _3297 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        float _3307 = _3297 * _3301;
        out.m_99.x = _3299;
        out.m_99.y = _3303;
        out.m_99.z = _3305;
        float _3309 = _3307 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3311 = _3307 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3313 = _3307 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_101.x = _3309;
        out.m_101.y = _3311;
        out.m_101.z = _3313;
    }
    out.m_103.x = _3165;
    out.m_103.y = _3167;
    out.m_103.z = _3169;
    if (_3149)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_63.x = 0.0;
    float _3315 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3315;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3013 = false;
    bool _1821 = false;
    bool _1095 = false;
    bool _903 = false;
    bool _363 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _123 = in.m_60.w;
    float _125 = trunc(_123);
    int _127 = int(_125);
    bool _131 = _127 >= 1;
    float _133 = 0.0;
    if (!_131)
    {
        _133 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _135 = _133;
    float _137 = _135;
    if (!_131)
    {
        out.m_63.x = 0.0;
    }
    int _139 = 0;
    if (!_131)
    {
        float _141 = _135 * 5.0;
        _139 = as_type<int>(_141);
    }
    int _143 = _139;
    int _145 = _143;
    if (!_131)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3372 = as_type<float>(_143);
        out.gl_Position.z = _3372;
    }
    if (!_131)
    {
        return out;
    }
    float _147 = in.m_65.w;
    bool _149 = _147 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _151 = isnan(_147);
    bool _153 = _149 || _151;
    bool _155 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _157 = _153 || _155;
    float _159 = -_147;
    float _161 = _159 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _163 = 0.0;
    float _165 = _161;
    if (_157)
    {
        float _167 = float(_127);
        _163 = _167;
    }
    float _169 = _163;
    bool _171 = _161 >= _169;
    bool _173 = !_157;
    bool _175 = _171 || _173;
    if (_175)
    {
        _137 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _177 = _137;
    if (_175)
    {
        out.m_63.x = 0.0;
    }
    if (_175)
    {
        float _179 = _177 * 5.0;
        _145 = as_type<int>(_179);
    }
    int _181 = _145;
    if (_175)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3441 = as_type<float>(_181);
        out.gl_Position.z = _3441;
    }
    if (_175)
    {
        return out;
    }
    float _183 = in.m_67.x;
    float _185 = in.m_67.y;
    float _187 = in.m_67.z;
    float _189 = in.m_69.x;
    float _191 = in.m_69.y;
    float _193 = in.m_69.z;
    float _195 = in.m_71.x;
    float _197 = in.m_71.y;
    float _199 = in.m_71.z;
    float _201 = _183 * _183;
    float _203 = _185 * _185;
    float _205 = _187 * _187;
    float _207 = fma(_189, _189, _201);
    float _209 = fma(_191, _191, _203);
    float _211 = fma(_193, _193, _205);
    float _213 = fma(_195, _195, _207);
    float _215 = fma(_197, _197, _209);
    float _217 = fma(_199, _199, _211);
    float _219 = sqrt(_213);
    float _221 = sqrt(_215);
    float _223 = sqrt(_217);
    bool _225 = _219 > 0.0;
    bool _227 = _221 > 0.0;
    float _229 = _221;
    float _231 = _213;
    float _233 = _215;
    if (_225)
    {
        float _235 = rsqrt(_213);
        _229 = _235;
    }
    float _237 = _229;
    float _239 = 0.0;
    float _241 = 0.0;
    if (!_225)
    {
        _239 = 0.0;
        _241 = 0.0;
    }
    float _243 = _239;
    float _245 = _241;
    bool _247 = _223 > 0.0;
    float _249 = 0.0;
    float _251 = _223;
    float _253 = _243;
    float _255 = _245;
    if (!_225)
    {
        _249 = 0.0;
    }
    float _257 = _249;
    float _259 = 0.0;
    float _261 = _257;
    if (!_227)
    {
        _259 = 0.0;
    }
    float _263 = _259;
    float _265 = _219;
    float _267 = _263;
    if (_227)
    {
        float _269 = rsqrt(_215);
        _265 = _269;
    }
    float _271 = _265;
    float _273 = 0.0;
    if (!_227)
    {
        _273 = 0.0;
    }
    float _275 = _273;
    float _277 = _275;
    if (!_227)
    {
        _251 = 0.0;
    }
    float _279 = _251;
    float _281 = _279;
    if (!_247)
    {
        _231 = 0.0;
    }
    float _283 = _231;
    float _285 = 0.0;
    float _287 = _283;
    if (_247)
    {
        float _289 = rsqrt(_217);
        _285 = _289;
    }
    float _291 = _285;
    float _293 = _237;
    if (_225)
    {
        float _295 = _237 * _189;
        _253 = _295;
    }
    float _297 = _253;
    float _299 = _297;
    if (_225)
    {
        float _301 = _237 * _183;
        _255 = _301;
    }
    float _303 = _255;
    if (_225)
    {
        float _305 = _237 * _195;
        _261 = _305;
    }
    float _307 = _261;
    bool _309 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    if (!_247)
    {
        _233 = 0.0;
        _293 = 0.0;
    }
    float _311 = _233;
    float _313 = _293;
    float _315 = _311;
    float _317 = _313;
    if (_227)
    {
        float _319 = _271 * _191;
        _267 = _319;
    }
    float _321 = _267;
    if (_227)
    {
        float _323 = _271 * _185;
        _277 = _323;
    }
    float _325 = _277;
    if (_227)
    {
        float _327 = _271 * _197;
        _281 = _327;
    }
    float _329 = _281;
    if (_247)
    {
        float _331 = _291 * _193;
        _315 = _331;
    }
    float _333 = _315;
    if (_247)
    {
        float _335 = _291 * _187;
        _287 = _335;
    }
    float _337 = _287;
    if (_247)
    {
        float _339 = _291 * _199;
        _317 = _339;
    }
    float _341 = _317;
    bool _343 = !_309;
    float _361;
    if (!_343)
    {
        float _345 = in.m_73.x;
        float _347 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _349 = _345 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _351 = fma(_349, (*spvDescriptorSet0.vp_c9)._m0[12].x, _161);
        float _353 = _351 * _347;
        float _355 = floor(_353);
        float _357 = -_355;
        float _359 = _353 + _357;
        _361 = _359;
        _363 = true;
    }
    else
    {
        float _365 = float(_127);
        float _367 = 1.0 / _365;
        float _369 = _161 * _367;
        _361 = _369;
    }
    _363 = false;
    float _371 = _361;
    int _373 = int2(spvDescriptorSet0.vp_t_tcb_C.get_width(), spvDescriptorSet0.vp_t_tcb_C.get_height()).x;
    int _375 = _373;
    int _377 = 0;
    int _379 = _118(_375, _377, (*spvDescriptorSet0.support_buffer));
    float _381 = in.m_73.x;
    float _383 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[191].y;
    float _385 = in.m_73.y;
    float _387 = -_383;
    float _389 = _387 + (*spvDescriptorSet0.vp_c9)._m0[191].y;
    float _391 = fma((*spvDescriptorSet0.vp_c10)._m0[2].x, 0.0166666693985462188720703125, _381);
    float _393 = fma(_389, _385, _383);
    float _395 = _391 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _397 = _395 * _393;
    float _399 = float(_379);
    int _401 = abs(_379);
    bool _403 = _379 == 0;
    float _405 = _397 * _399;
    float _407 = float(uint(_401));
    float _409 = trunc(_405);
    int _411 = int(_409);
    float _413 = 1.0 / _407;
    int _415 = abs(_411);
    uint _418 = uint(int(uint(_411) >> uint(31)));
    float _420 = float(uint(_415));
    int _422 = ~int(_418);
    int _424 = _422 + 1;
    int _426 = as_type<int>(_413) + (-2);
    float _428 = as_type<float>(_426) * _420;
    float _430 = trunc(_428);
    float _432 = precise::max(_430, 0.0);
    uint _434 = uint(_432);
    int _436 = ~int(_434);
    int _438 = _436 + 1;
    int _440 = _438 * _401;
    int _442 = _440 + _415;
    float _444 = float(uint(_442));
    float _446 = as_type<float>(_426) * _444;
    float _448 = trunc(_446);
    float _450 = precise::max(_448, 0.0);
    uint _452 = uint(_450);
    int _454 = int(_434) + int(_452);
    float _456 = in.m_75.z;
    int _458 = ~_454;
    int _460 = _458 + 1;
    int _462 = _460 * _401;
    int _464 = _462 + _415;
    bool _466 = uint(_464) >= uint(_401);
    bool _468 = !_466;
    int _470 = _468 ? 0 : (-1);
    int _472 = ~_454;
    int _474 = _472 + _470;
    int _476 = _474 + 1;
    float _478 = trunc(_456);
    int _480 = int(_478);
    int _482 = _476 * _401;
    int _484 = _482 + _415;
    int _486 = _484 ^ _424;
    int _488 = ~_424;
    int _490 = _488 + _486;
    int _492 = _490 + 1;
    bool _494 = !_403;
    int _496 = _494 ? _492 : (-1);
    int _498 = _496;
    int _500 = 0;
    int _502 = _119(_498, _500, (*spvDescriptorSet0.support_buffer));
    int _504 = _480;
    int _506 = 0;
    int _508 = _119(_504, _506, (*spvDescriptorSet0.support_buffer));
    float4 _511 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_502, _508)), 0).xyzw;
    float _513 = _511.x;
    float _515 = _511.y;
    float _517 = _511.z;
    float _519 = _511.w;
    float _521 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _523 = in.m_75.x;
    float _525 = _521 * _381;
    bool _527 = _371 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _529 = isnan(_371);
    bool _531 = _527 || _529;
    bool _533 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _535 = _531 || _533;
    float _537 = float(_535);
    float _539 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _541 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _539;
    int _543 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _545 = _543 != 0;
    int _547 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _549 = _547 != 0;
    float _551 = trunc(_525);
    int _553 = int(_551);
    float _555 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _557 = _371 + _555;
    bool _559 = _381 > 0.5;
    bool _561 = _559 && _545;
    bool _563 = _385 > 0.5;
    bool _565 = _563 && _549;
    float _567 = 1.0 / _541;
    float _569 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _571 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _573 = _496 + 1;
    float _575 = _569 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _577 = _553 << 4;
    int _579 = _577 + 1712;
    float _581 = _571 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    uint _583 = uint(int(uint(_579) >> uint(2)));
    uint _585 = uint(int(uint(int(_583)) >> uint(2)));
    int _587 = int(_583) & 3;
    float _589 = (*spvDescriptorSet0.vp_c9)._m0[int(_585)][_587];
    int _591 = int(_583) + 1;
    uint _593 = uint(int(uint(_591) >> uint(2)));
    int _595 = _591 & 3;
    float _597 = (*spvDescriptorSet0.vp_c9)._m0[int(_593)][_595];
    float _599 = _557 * _567;
    bool _601 = _371 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _603 = isnan(_371);
    bool _605 = _601 || _603;
    bool _607 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _609 = _605 || _607;
    float _611 = float(_609);
    float _613 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _615 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _613;
    float _617 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _619 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _617;
    int _621 = _579 + 8;
    uint _623 = uint(int(uint(_621) >> uint(2)));
    uint _625 = uint(int(uint(int(_623)) >> uint(2)));
    int _627 = int(_623) & 3;
    float _629 = (*spvDescriptorSet0.vp_c9)._m0[int(_625)][_627];
    float _631 = fma(_615, _599, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _633 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _635 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _633;
    float _637 = fma(_619, _599, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _639 = 0.0;
    if (_545)
    {
        _639 = _523;
    }
    float _641 = _639;
    float _643 = fma(_635, _599, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _645 = -_611;
    float _647 = _645 + 1.0;
    float _649 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _651 = _641;
    if (_561)
    {
        float _653 = -_641;
        float _655 = _653 + 1.0;
        _651 = _655;
    }
    float _657 = _651;
    float _659 = _537 * _647;
    float _661 = _649 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _663 = _631 * _659;
    float _665 = _637 * _659;
    float _667 = _643 * _659;
    out.m_77.x = _661;
    out.m_77.y = _575;
    out.m_77.z = _581;
    float _669 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _671 = _589 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _673 = _597 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _675 = -_537;
    float _677 = _675 + 1.0;
    float _679 = _589;
    if (!_545)
    {
        _679 = _523;
    }
    float _681 = _679;
    float _683 = _671 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _685 = _681;
    if (_545)
    {
        _685 = _657;
    }
    float _687 = _685;
    float _689 = fma(_677, (*spvDescriptorSet0.vp_c9)._m0[143].y, _665);
    float _691 = fma(_677, (*spvDescriptorSet0.vp_c9)._m0[143].x, _663);
    float _693 = fma(_677, (*spvDescriptorSet0.vp_c9)._m0[143].z, _667);
    float _695 = fma(_611, (*spvDescriptorSet0.vp_c9)._m0[144].y, _689);
    int _697 = abs(_573);
    float _699 = fma(_611, (*spvDescriptorSet0.vp_c9)._m0[144].z, _693);
    float _701 = fma(_611, (*spvDescriptorSet0.vp_c9)._m0[144].x, _691);
    uint _703 = uint(int(uint(_573) >> uint(31)));
    float _705 = _629 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _707 = float(uint(_697));
    float _709 = _673 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _711 = ~int(_703);
    int _713 = _711 + 1;
    float _715 = _705 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _717 = _687 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _719 = as_type<float>(_426) * _707;
    out.m_79.x = _683;
    out.m_79.y = _709;
    out.m_79.z = _715;
    out.m_79.w = _669;
    float _721 = trunc(_719);
    float _723 = precise::max(_721, 0.0);
    uint _725 = uint(_723);
    int _727 = ~int(_725);
    int _729 = _727 + 1;
    int _731 = _729 * _401;
    int _733 = _731 + _697;
    float _735 = float(uint(_733));
    float _737 = as_type<float>(_426) * _735;
    float _739 = trunc(_737);
    float _741 = precise::max(_739, 0.0);
    uint _743 = uint(_741);
    float _745 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _747 = int(_725) + int(_743);
    float _749 = in.m_81.x;
    float _751 = in.m_81.y;
    float _753 = in.m_81.z;
    int _755 = ~_747;
    int _757 = _755 + 1;
    int _759 = _757 * _401;
    int _761 = _759 + _697;
    float _763 = _717 * _745;
    bool _765 = uint(_761) >= uint(_401);
    bool _767 = !_765;
    int _769 = _767 ? 0 : (-1);
    int _771 = ~_747;
    int _773 = _771 + _769;
    int _775 = _773 + 1;
    float _777 = _695 * _751;
    int _779 = _775 * _401;
    int _781 = _779 + _697;
    float _783 = _701 * _749;
    float _785 = _699 * _753;
    float _787 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _789 = _781 ^ _713;
    int _791 = ~_713;
    int _793 = _791 + _789;
    int _795 = _793 + 1;
    float _797 = in.m_75.y;
    float _799 = _797;
    if (_565)
    {
        float _801 = -_797;
        float _803 = _801 + 1.0;
        _799 = _803;
    }
    float _805 = _799;
    float _807 = _805 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _809 = _807 * _787;
    uint _811 = as_type<uint>(half2(float2(_519, 0.0)));
    uint _813 = extract_bits(_811, 0u, 8u);
    int _815 = int(_813) & 255;
    uint _817 = extract_bits(_811, 8u, 8u);
    int _819 = int(_817) & 255;
    int _821 = _819 << 8;
    int _823 = _815 | _821;
    bool _825 = _823 >= 32768;
    int _827 = _823 + (-1024);
    int _829 = _827;
    if (_825)
    {
        int _831 = ~_823;
        int _833 = _831 + 33792;
        int _835 = _833 + 1;
        _829 = _835;
    }
    int _837 = _829;
    int _839 = _837 + 30719;
    float _841 = float(_839);
    float _843 = fma(_841, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _845 = abs(_843);
    float _847 = -_845;
    float _849 = _847 + 1.0;
    float _851 = abs(_843);
    float _853 = fma(_851, -0.0187292993068695068359375, 0.074261002242565155029296875);
    bool _855 = _843 < 0.0;
    float _857 = float(_855);
    int _859 = as_type<int>(_849) + (-218103808);
    bool _861 = uint(_859) >= 1920991232u;
    float _863 = abs(_843);
    float _865 = fma(_863, _853, -0.212114393711090087890625);
    bool _867 = !_403;
    int _869 = _867 ? _795 : (-1);
    float _871 = abs(_843);
    float _873 = fma(_871, _865, 1.570728778839111328125);
    bool _875 = !_861;
    float _901;
    if (!_875)
    {
        int _877 = as_type<int>(_849);
        int _879 = _795;
        int _881 = as_type<int>(_745);
        int _883 = 3728;
        int _885 = 0;
        int _887;
        int _889;
        int _891;
        int _893;
        int _895;
        int _897;
        int _899;
        _116(_877, _879, _881, _883, _885, _887, _889, _891, _893, _895, _897, _899, out.gl_Position, out.gl_PointSize);
        _901 = as_type<float>(_897);
        _903 = true;
    }
    else
    {
        float _905 = rsqrt(_849);
        float _907 = _849 * _905;
        float _909 = _905 * 0.5;
        float _911 = -_907;
        float _913 = 0.0 + _911;
        float _915 = fma(_909, _913, 0.5);
        float _917 = fma(_907, _915, _907);
        float _919 = -_917;
        float _921 = 0.0 + _919;
        float _923 = fma(_917, _921, _849);
        float _925 = fma(_909, _923, _917);
        _901 = _925;
    }
    _903 = false;
    float _927 = _901;
    int _929 = _869;
    int _931 = 0;
    int _933 = _119(_929, _931, (*spvDescriptorSet0.support_buffer));
    int _935 = _480;
    int _937 = 0;
    int _939 = _119(_935, _937, (*spvDescriptorSet0.support_buffer));
    float4 _941 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_933, _939)), 0).xyzw;
    float _943 = _941.x;
    float _945 = _941.y;
    float _947 = _941.z;
    float _949 = _941.w;
    float _951 = _873 * _927;
    float _953 = _857 * 2.0;
    float _955 = floor(_405);
    float _957 = _841 * 3.883221149444580078125;
    float _959 = -_953;
    float _961 = fma(_951, _959, _951);
    float _963 = _957 * 0.15915493667125701904296875;
    float _965 = fma(_857, 3.1415927410125732421875, _961);
    float _967 = _963 * 6.283185482025146484375;
    float _969 = cos(_967);
    float _971 = _965 * 0.15915493667125701904296875;
    float _973 = -_955;
    float _975 = _405 + _973;
    float _977 = _971 * 6.283185482025146484375;
    float _979 = sin(_977);
    float _981 = _963 * 6.283185482025146484375;
    float _983 = sin(_981);
    float _985 = _979 * _969;
    float _987 = _979 * _983;
    uint _989 = as_type<uint>(half2(float2(_949, 0.0)));
    float _991 = -_513;
    float _993 = _991 + _943;
    float _995 = -_517;
    float _997 = _995 + _947;
    uint _999 = extract_bits(_989, 0u, 8u);
    int _1001 = int(_999) & 255;
    uint _1003 = extract_bits(_989, 8u, 8u);
    int _1005 = int(_1003) & 255;
    int _1007 = _1005 << 8;
    int _1009 = _1001 | _1007;
    float _1011 = fma(_975, _993, _513);
    float _1013 = fma(_975, _997, _517);
    bool _1015 = _1009 >= 32768;
    int _1017 = _1009 + (-1024);
    int _1019 = _1017;
    if (_1015)
    {
        int _1021 = ~_1009;
        int _1023 = _1021 + 33792;
        int _1025 = _1023 + 1;
        _1019 = _1025;
    }
    int _1027 = _1019;
    int _1029 = _1027 + 30719;
    float _1031 = float(_1029);
    float _1033 = fma(_1031, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _1035 = abs(_1033);
    float _1037 = -_1035;
    float _1039 = _1037 + 1.0;
    bool _1041 = _1033 < 0.0;
    float _1043 = float(_1041);
    float _1045 = abs(_1033);
    float _1047 = fma(_1045, -0.0187292993068695068359375, 0.074261002242565155029296875);
    int _1049 = as_type<int>(_1039) + (-218103808);
    float _1051 = abs(_1033);
    float _1053 = fma(_1051, _1047, -0.212114393711090087890625);
    bool _1055 = uint(_1049) >= 1920991232u;
    float _1057 = -_515;
    float _1059 = _1057 + _945;
    float _1061 = abs(_1033);
    float _1063 = fma(_1061, _1053, 1.570728778839111328125);
    float _1065 = fma(_975, _1059, _515);
    bool _1067 = !_1055;
    float _1093;
    if (!_1067)
    {
        int _1069 = as_type<int>(_1039);
        int _1071 = as_type<int>(_963);
        int _1073 = as_type<int>(_983);
        int _1075 = 4624;
        int _1077 = as_type<int>(_951);
        int _1079;
        int _1081;
        int _1083;
        int _1085;
        int _1087;
        int _1089;
        int _1091;
        _116(_1069, _1071, _1073, _1075, _1077, _1079, _1081, _1083, _1085, _1087, _1089, _1091, out.gl_Position, out.gl_PointSize);
        _1093 = as_type<float>(_1089);
        _1095 = true;
    }
    else
    {
        float _1097 = rsqrt(_1039);
        float _1099 = _1039 * _1097;
        float _1101 = _1097 * 0.5;
        float _1103 = -_1099;
        float _1105 = 0.0 + _1103;
        float _1107 = fma(_1101, _1105, 0.5);
        float _1109 = fma(_1099, _1107, _1099);
        float _1111 = -_1109;
        float _1113 = 0.0 + _1111;
        float _1115 = fma(_1109, _1113, _1039);
        float _1117 = fma(_1101, _1115, _1109);
        _1093 = _1117;
    }
    _1095 = false;
    float _1119 = _1093;
    float _1121 = in.m_73.x;
    float _1123 = in.m_73.y;
    float _1125 = in.m_73.z;
    float _1127 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1129 = log2(_1127);
    float _1131 = _1063 * _1119;
    int _1133 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1135 = _1133 != 0;
    int _1137 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1139 = _1137 != 0;
    int _1141 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1143 = _1141 != 0;
    float _1145 = _783 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1147 = _777 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1149 = _785 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1151 = _1031 * 3.883221149444580078125;
    float _1153 = -_843;
    float _1155 = _1153 + _1033;
    float _1157 = _1151 * 0.15915493667125701904296875;
    float _1159 = _1157 * 6.283185482025146484375;
    float _1161 = sin(_1159);
    float _1163 = _1123 * 2.0;
    float _1165 = _1125 * 2.0;
    float _1167 = _1121 * 2.0;
    float _1169 = _1125 + _1121;
    float _1171 = floor(_1163);
    float _1173 = _1169 + (-1.0);
    float _1175 = floor(_1165);
    bool _1177 = _1171 > 0.0;
    float _1179 = floor(_1167);
    bool _1181 = _1171 >= 0.0;
    bool _1183 = isnan(_1171);
    bool _1185 = _1181 || _1183;
    bool _1187 = isnan(0.0);
    bool _1189 = _1185 || _1187;
    int _1191 = _1189 ? 0 : 1;
    bool _1193 = _1175 > 0.0;
    bool _1195 = _1175 >= 0.0;
    bool _1197 = isnan(_1175);
    bool _1199 = _1195 || _1197;
    bool _1201 = isnan(0.0);
    bool _1203 = _1199 || _1201;
    float _1205 = _1129 * _161;
    int _1207 = ~_1191;
    int _1209 = _1207 + 1;
    int _1211 = _1209 + 1;
    float _1213 = fma(_1173, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    int _1215 = _1203 ? 0 : 1;
    float _1217 = exp2(_1205);
    int _1219 = _1211;
    int _1221 = as_type<int>(_1157);
    if (!_1177)
    {
        int _1223 = ~_1191;
        int _1225 = _1223 + 1;
        _1219 = _1225;
    }
    int _1227 = _1219;
    int _1229 = ~_1215;
    int _1231 = _1229 + 1;
    int _1233 = _1231 + 1;
    float _1235 = in.m_83.x;
    float _1237 = in.m_83.y;
    float _1239 = in.m_83.z;
    int _1241 = _1233;
    if (!_1193)
    {
        int _1243 = ~_1215;
        int _1245 = _1243 + 1;
        _1241 = _1245;
    }
    int _1247 = _1241;
    bool _1249 = !_1135;
    int _1251 = _1249 ? 0 : 1;
    float _1253 = _1123 + _1121;
    bool _1255 = _1179 > 0.0;
    float _1257 = _1121 + (-0.5);
    int _1259 = abs(_1251);
    float _1261 = _1253 + (-1.0);
    bool _1263 = !_1143;
    int _1265 = _1263 ? 0 : 1;
    float _1267 = -_1217;
    float _1269 = _1267 + 1.0;
    bool _1271 = _1179 >= 0.0;
    bool _1273 = isnan(_1179);
    bool _1275 = _1271 || _1273;
    bool _1277 = isnan(0.0);
    bool _1279 = _1275 || _1277;
    float _1281 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1283 = 1.0 + _1281;
    int _1285 = abs(_1265);
    float _1287 = float(_1259);
    float _1289 = 1.0 / _1283;
    float _1291 = float(_1247);
    bool _1293 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1295 = isnan(1.0);
    bool _1297 = _1293 || _1295;
    bool _1299 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1301 = _1297 || _1299;
    float _1303 = _1287 * _1291;
    bool _1305 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1307 = isnan(0.0);
    bool _1309 = _1305 || _1307;
    bool _1311 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1313 = _1309 || _1311;
    float _1315 = float(_1285);
    float _1317 = _1303 * (-2.0);
    float _1319 = float(_1227);
    float _1321 = fma(_1261, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1323 = _1313 ? _1269 : 0.0;
    int _1325 = _1279 ? 0 : 1;
    float _1327 = _1315 * _1319;
    float _1329 = fma(_1317, _1235, _1235);
    float _1331 = fma(_1321, _1317, _1321);
    bool _1333 = !_1139;
    int _1335 = _1333 ? 0 : 1;
    if (_1301)
    {
        float _1337 = _1323 * _1289;
        _165 = _1337;
    }
    float _1339 = _165;
    float _1341 = fma(_1257, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1329);
    float _1343 = _1327 * (-2.0);
    int _1345 = ~_1325;
    int _1347 = _1345 + 1;
    int _1349 = _1347 + 1;
    int _1351 = abs(_1335);
    float _1353 = fma(_1331, _1339, _1341);
    int _1355 = _1349;
    if (!_1255)
    {
        int _1357 = ~_1325;
        int _1359 = _1357 + 1;
        _1355 = _1359;
    }
    int _1361 = _1355;
    float _1363 = _1125 + (-0.5);
    float _1365 = fma(_1343, _1239, _1239);
    float _1367 = float(_1351);
    float _1369 = fma(_1213, _1343, _1213);
    float _1371 = float(_1361);
    float _1373 = _1353 * 0.15915493667125701904296875;
    float _1375 = fma(_1363, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1365);
    float _1377 = in.m_69.x;
    float _1379 = in.m_69.y;
    float _1381 = in.m_69.z;
    float _1383 = _1125 + _1123;
    float _1385 = _1367 * _1371;
    float _1387 = _1123 + (-0.5);
    float _1389 = in.m_60.x;
    float _1391 = in.m_60.y;
    float _1393 = in.m_60.z;
    float _1395 = _1383 + (-1.0);
    float _1397 = _1385 * (-2.0);
    float _1399 = fma(_1369, _1339, _1375);
    float _1401 = _1373 * 6.283185482025146484375;
    float _1403 = sin(_1401);
    float _1405 = fma(_1395, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1407 = fma(_1397, _1237, _1237);
    float _1409 = in.m_71.x;
    float _1411 = in.m_71.y;
    float _1413 = in.m_71.z;
    float _1415 = _1399 * 0.15915493667125701904296875;
    float _1417 = fma(_1405, _1397, _1405);
    float _1419 = fma(_1387, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1407);
    bool _1421 = _1065 != 0.0;
    bool _1423 = isnan(_1065);
    bool _1425 = _1421 || _1423;
    bool _1427 = isnan(0.0);
    bool _1429 = _1425 || _1427;
    float _1431 = _1373 * 6.283185482025146484375;
    float _1433 = cos(_1431);
    float _1435 = fma(_1417, _1339, _1419);
    float _1437 = _1043 * 2.0;
    bool _1439 = _1011 == 0.0;
    bool _1441 = !_1429;
    bool _1443 = _1439 && _1441;
    float _1445 = _1435 * 0.15915493667125701904296875;
    float _1447 = -_1437;
    float _1449 = fma(_1131, _1447, _1131);
    float _1451 = _1415 * 6.283185482025146484375;
    float _1453 = sin(_1451);
    float _1455 = fma(_1043, 3.1415927410125732421875, _1449);
    float _1457 = _1379 * _1391;
    bool _1459 = _1013 == 0.0;
    bool _1461 = _1459 && _1443;
    float _1463 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1065);
    float _1465 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1013);
    float _1467 = _1415 * 6.283185482025146484375;
    float _1469 = cos(_1467);
    float _1471 = fma(_1377, _1389, _1457);
    float _1473 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1011);
    float _1475 = _1411 * _1391;
    float _1477 = _1147 * _1463;
    float _1479 = fma(_1381, _1393, _1471);
    float _1481 = _1145 * _1473;
    float _1483 = fma(_1409, _1389, _1475);
    float _1485 = _1445 * 6.283185482025146484375;
    float _1487 = sin(_1485);
    float _1489 = _1403 * _1453;
    float _1491 = _1149 * _1465;
    float _1493 = fma(_1413, _1393, _1483);
    float _1495 = _1433 * _1453;
    float _1497 = _1479 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1499 = _1445 * 6.283185482025146484375;
    float _1501 = cos(_1499);
    float _1503 = _1433 * _1469;
    float _1505 = _1403 * _1469;
    float _1507 = fma(_1487, _1489, _1503);
    float _1509 = _1157 * 6.283185482025146484375;
    float _1511 = cos(_1509);
    float _1513 = _1501 * _1453;
    float _1515 = _1501 * _1469;
    float _1517 = _1403 * _1501;
    float _1519 = _1433 * _1501;
    float _1521 = -_1495;
    float _1523 = fma(_1487, _1505, _1521);
    float _1525 = _1507 * _1477;
    float _1527 = -_1505;
    float _1529 = fma(_1487, _1495, _1527);
    float _1531 = _1517 * _1477;
    float _1533 = _1523 * _1477;
    float _1535 = fma(_1513, _1481, _1525);
    float _1537 = fma(_1487, _1503, _1489);
    float _1539 = -_1487;
    float _1541 = fma(_1539, _1481, _1531);
    float _1543 = fma(_1515, _1481, _1533);
    float _1545 = fma(_1529, _1491, _1535);
    float _1547 = _1455 * 0.15915493667125701904296875;
    float _1549 = fma(_1519, _1491, _1541);
    float _1551 = fma(_1537, _1491, _1543);
    float _1553 = _1545 * _321;
    float _1555 = _1545 * _329;
    float _1557 = in.m_67.x;
    float _1559 = in.m_67.y;
    float _1561 = in.m_67.z;
    float _1563 = _1547 * 6.283185482025146484375;
    float _1565 = sin(_1563);
    float _1567 = fma(_1551, _297, _1553);
    float _1569 = fma(_1551, _307, _1555);
    float _1571 = _1493 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1573 = fma(_1549, _333, _1567);
    float _1575 = fma(_1549, _341, _1569);
    float _1577 = _1497 + _1573;
    float _1579 = _1571 + _1575;
    float _1581 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1583 = _1577 + _1581;
    float _1585 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1587 = _1579 + _1585;
    float _1589 = -_985;
    float _1591 = fma(_1565, _1511, _1589);
    float _1593 = _1583 * _1583;
    float _1595 = _1587 * _1587;
    float _1597 = -_987;
    float _1599 = fma(_1565, _1161, _1597);
    float _1601 = fma(_975, _1591, _985);
    float _1603 = _1593 + _1595;
    float _1605 = _1559 * _1391;
    float _1607 = _1545 * _325;
    float _1609 = fma(_975, _1599, _987);
    float _1611 = sqrt(_1603);
    float _1613 = fma(_1557, _1389, _1605);
    float _1615 = fma(_975, _1155, _843);
    float _1617 = fma(_1551, _303, _1607);
    float _1619 = _1601;
    float _1621 = _1615;
    float _1623 = _1609;
    float _1625 = _1557;
    float _1627 = _1593;
    float _1629 = _1595;
    float _1631 = _1577;
    float _1633 = _1579;
    float _1635 = _1561;
    int _1637 = as_type<int>(_1599);
    float _1639 = _1571;
    float _1641 = _1497;
    if (!_1461)
    {
        float _1643 = fma(_1011, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1601);
        _1619 = _1643;
    }
    float _1645 = _1619;
    float _1647 = fma(_1561, _1393, _1613);
    if (!_1461)
    {
        float _1649 = fma(_1065, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1615);
        _1621 = _1649;
    }
    float _1651 = _1621;
    float _1653 = fma(_1549, _337, _1617);
    if (!_1461)
    {
        float _1655 = fma(_1013, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1609);
        _1623 = _1655;
    }
    float _1657 = _1623;
    float _1659 = _1647 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1661 = _1507 * _1651;
    float _1663 = _1517 * _1651;
    float _1665 = _1523 * _1651;
    float _1667 = fma(_1513, _1645, _1661);
    float _1669 = _1659 + _1653;
    bool _1671 = _1611 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1673 = -_1487;
    float _1675 = fma(_1673, _1645, _1663);
    if (!_1671)
    {
        _1625 = _1669;
    }
    float _1677 = _1625;
    bool _1679 = !_1671;
    float _1681 = _1677;
    if (!_1679)
    {
        float _1683 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1685 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1687 = _1611 + _1685;
        float _1689 = rsqrt(_1603);
        float _1691 = _1687 * _1683;
        float _1693 = _1669 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1695 = _1691 * 0.15915493667125701904296875;
        float _1697 = _1695 * 6.283185482025146484375;
        float _1699 = sin(_1697);
        float _1701 = _1695 * 6.283185482025146484375;
        float _1703 = cos(_1701);
        float _1705 = fma(_1699, _1693, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1707 = _1689 * _1705;
        float _1709 = _1703 + (-1.0);
        float _1711 = _1583 * _1707;
        float _1713 = _1587 * _1707;
        float _1715 = _1709 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1717 = _1711 + (*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1719 = _1711 * _1711;
        float _1721 = _1713 + (*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1723 = fma(_1669, _1703, _1715);
        float _1725 = _1713 * _1713;
        _1681 = _1723;
        _1627 = _1719;
        _1629 = _1725;
        _1631 = _1717;
        _1633 = _1721;
        _1635 = _1695;
    }
    float _1727 = _1681;
    float _1729 = _1627;
    float _1731 = _1629;
    float _1733 = _1631;
    float _1735 = _1633;
    float _1737 = _1635;
    float _1739 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1741 = _1727 + _1739;
    float _1743 = fma(_1515, _1645, _1665);
    float _1745 = fma(_1529, _1657, _1667);
    float _1747 = fma(_1519, _1657, _1675);
    float _1749 = fma(_1741, _1741, _1729);
    float _1751 = fma(_1537, _1657, _1743);
    float _1753 = _1745 * _321;
    float _1755 = _1745 * _325;
    float _1757 = _1749 + _1731;
    float _1759 = _1745 * _329;
    float _1761 = fma(_1751, _297, _1753);
    float _1763 = fma(_1751, _303, _1755);
    out.m_85.x = _763;
    out.m_85.y = _809;
    float _1765 = fma(_1751, _307, _1759);
    float _1767 = sqrt(_1757);
    float _1769 = fma(_1747, _333, _1761);
    float _1771 = fma(_1747, _337, _1763);
    float _1773 = fma(_1747, _341, _1765);
    out.m_87.x = _1769;
    out.m_87.y = _1771;
    out.m_87.z = _1773;
    out.m_89.x = 1.0;
    out.m_89.y = 1.0;
    out.m_89.z = 1.0;
    bool _1775 = _1767 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1777 = isnan(_1767);
    bool _1779 = _1775 || _1777;
    bool _1781 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1783 = _1779 || _1781;
    float _1785 = _1737;
    if (!_1783)
    {
        _1785 = 1.0;
    }
    float _1787 = _1785;
    bool _1789 = !_1783;
    float _1791 = _1787;
    if (!_1789)
    {
        bool _1793 = _1767 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1795 = isnan(_1767);
        bool _1797 = _1793 || _1795;
        bool _1799 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1801 = _1797 || _1799;
        if (!_1801)
        {
            float _1803 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1805 = _1767 + _1803;
            float _1807 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1809 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1807;
            float _1811 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1813 = _1811 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1815 = 1.0 / _1809;
            float _1817 = _1805 * _1815;
            float _1819 = fma(_1817, _1813, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1791 = _1819;
            _1821 = true;
        }
        else
        {
            bool _1823 = _1767 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1825 = isnan(_1767);
            bool _1827 = _1823 || _1825;
            bool _1829 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1831 = _1827 || _1829;
            if (!_1831)
            {
                float _1833 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1835 = _1767 + _1833;
                float _1837 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1839 = _1837 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1841 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1843 = _1841 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1845 = 1.0 / _1839;
                float _1847 = _1835 * _1845;
                float _1849 = fma(_1847, _1843, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1791 = _1849;
                _1821 = true;
            }
            else
            {
                _1791 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1821 = false;
    float _1851 = _1791;
    float _1853 = _1659 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1855 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1857 = _1727 + _1855;
    float _1859 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1861 = _1733 + _1859;
    float _1863 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1865 = _1735 + _1863;
    float _1867 = fma(_1497, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1853);
    float _1869 = fma(_1857, _1851, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1871 = fma(_1861, _1851, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1873 = fma(_1865, _1851, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1875 = fma(_1571, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1867);
    float _1877 = _1659 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1879 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1881 = _1869 + _1879;
    float _1883 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1885 = _1871 + _1883;
    float _1887 = _1875 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1889 = fma(_1497, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1877);
    float _1891 = _1881 * _1881;
    float _1893 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1895 = _1873 + _1893;
    float _1897 = 1.0 / _1887;
    float _1899 = fma(_1571, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1889);
    float _1901 = fma(_1885, _1885, _1891);
    float _1903 = _1869 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1905 = _1899 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1907 = fma(_1895, _1895, _1901);
    float _1909 = _1905 + _1887;
    float _1911 = rsqrt(_1907);
    float _1913 = _1909 * _1897;
    float _1915 = _1913 * 0.5;
    float _1917 = sqrt(_1907);
    float _1919 = fma(_1571, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1921 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1923 = fma(_1915, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1921);
    float _1925 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _1927 = _1659 + _1925;
    float _1929 = 1.0 / _1923;
    float _1931 = _1885 * _1911;
    float _1933 = _1895 * _1911;
    float _1935 = _1927 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1937 = _1881 * _1911;
    float _1939 = _1931 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1941 = _1933 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1943 = fma(_1497, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1935);
    float _1945 = floor(_1919);
    float _1947 = _1939 * _1939;
    float _1949 = _1941 * _1941;
    float _1951 = fma(_1571, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1943);
    float _1953 = _1947 + _1949;
    float _1955 = _1951 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _1957 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1959 = _1929 * _1957;
    float _1961 = _1927 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1963 = sqrt(_1953);
    bool _1965 = _1959 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _1967 = fma(_1497, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1961);
    bool _1969 = _1959 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _1971 = -_1945;
    float _1973 = _1919 + _1971;
    float _1975 = fma(_1571, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1967);
    float _1977 = trunc(_1955);
    int _1979 = int(_1977);
    float _1981 = _1975 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    bool _1983 = !_1965;
    int _1985 = _1983 ? 0 : 1;
    int _1987 = 2;
    float _1989 = _1939;
    float _1991 = _1941;
    float _1993 = _1947;
    float _1995 = _1949;
    float _1997 = _1919;
    if (!_1965)
    {
        _1987 = 1;
    }
    int _1999 = _1987;
    float _2001 = trunc(_1981);
    int _2003 = int(_2001);
    int _2005 = _1999;
    if (!_1969)
    {
        _2005 = _1985;
    }
    int _2007 = _2005;
    bool _2009 = _1963 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2011 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2013 = _1963 + _2011;
    int _2015 = _2007 << 6;
    int _2017 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _2019 = _1979 + _2017;
    int _2021 = _2019 + 1;
    int _2023 = _2015 + 96;
    uint _2025 = uint(int(uint(_2023) >> uint(2)));
    uint _2027 = uint(int(uint(int(_2025)) >> uint(2)));
    int _2029 = int(_2025) & 3;
    float _2031 = (*spvDescriptorSet0.vp_c15)._m0[int(_2027)][_2029];
    int _2033 = int(_2025) + 1;
    uint _2035 = uint(int(uint(_2033) >> uint(2)));
    int _2037 = _2033 & 3;
    float _2039 = (*spvDescriptorSet0.vp_c15)._m0[int(_2035)][_2037];
    float _2041 = _321;
    float _2043 = _2013;
    int _2045 = _2021;
    if (_2009)
    {
        float _2047 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2041 = _2047;
    }
    float _2049 = _2041;
    int _2051 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _2053 = _2003 + _2051;
    int _2055 = _2053 + 1;
    int _2057 = _2015 + 104;
    uint _2059 = uint(int(uint(_2057) >> uint(2)));
    uint _2061 = uint(int(uint(int(_2059)) >> uint(2)));
    int _2063 = int(_2059) & 3;
    float _2065 = (*spvDescriptorSet0.vp_c15)._m0[int(_2061)][_2063];
    int _2067 = int(_2059) + 1;
    uint _2069 = uint(int(uint(_2067) >> uint(2)));
    int _2071 = _2067 & 3;
    float _2073 = (*spvDescriptorSet0.vp_c15)._m0[int(_2069)][_2071];
    bool _2075 = _2055 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _2077 = _2055 | _2021;
    bool _2079 = _2077 < 0;
    bool _2081 = _2079 || _2075;
    bool _2083 = _2021 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _2085 = _2083 || _2081;
    if (_2009)
    {
        float _2087 = _2013 * _2049;
        _2043 = _2087;
    }
    float _2089 = _2043;
    if (_2009)
    {
        float _2091 = _2089 * 0.15915493667125701904296875;
        _299 = _2091;
    }
    float _2093 = _299;
    float _2095 = _1869 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2097 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2099 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2101 = _1763;
    if (_2009)
    {
        float _2103 = _2093 * 6.283185482025146484375;
        float _2105 = sin(_2103);
        _2101 = _2105;
    }
    float _2107 = _2101;
    float _2109 = fma(_1871, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2095);
    float _2111 = precise::max(0.0, _2097);
    if (!_2085)
    {
        int _2113 = _2021 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _2115 = _2113 + _2055;
        _2045 = _2115;
    }
    int _2117 = _2045;
    float _2119 = fma(_1873, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2109);
    float _2121 = -_1937;
    float _2123 = -_2111;
    float _2125 = fma(_2121, (*spvDescriptorSet0.vp_c15)._m0[24].y, _2123);
    float _2127 = _2119 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2129 = _307;
    float _2131 = _2125;
    if (_2009)
    {
        float _2133 = _2093 * 6.283185482025146484375;
        float _2135 = cos(_2133);
        _2129 = _2135;
    }
    float _2137 = _2129;
    if (!_2085)
    {
        int _2139 = _2117 << 2;
        _1637 = _2139;
    }
    int _2141 = _1637;
    float _2143 = _2127 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    int _2145 = _2141;
    if (!_2085)
    {
        uint _2147 = uint(int(uint(_2117) >> uint(2)));
        _1221 = int(_2147);
    }
    int _2149 = _1221;
    if (!_2085)
    {
        int _2151 = 12 & _2141;
        _2145 = _2151;
    }
    int _2153 = _2145;
    float _2155 = _1927 * _2039;
    float _2157 = _2119;
    float _2159 = _2039;
    int _2161 = _2153;
    float _2163 = _2155;
    if (_2009)
    {
        float _2165 = rsqrt(_1953);
        _2157 = _2165;
    }
    float _2167 = _2157;
    if (_2009)
    {
        float _2169 = _2125 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2159 = _2169;
    }
    float _2171 = _2159;
    float _2173 = -_2143;
    float _2175 = fma(_2173, _2099, 1.0);
    float _2177 = fma(_1497, _2031, _2155);
    if (!_2085)
    {
        int _2179 = _2149 << 4;
        int _2181 = _2179 + _2153;
        _2161 = _2181;
    }
    int _2183 = _2161;
    float _2185 = _2107;
    if (_2009)
    {
        float _2187 = fma(_2107, _2171, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2185 = _2187;
    }
    float _2189 = _2185;
    float _2191 = _1869 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    if (_2009)
    {
        float _2193 = _2137 + (-1.0);
        _2163 = _2193;
    }
    float _2195 = _2163;
    float _2197 = fma(_1571, _2065, _2177);
    float _2199 = log2(_2175);
    float _2201 = _2195;
    if (_2009)
    {
        float _2203 = _2195 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2201 = _2203;
    }
    float _2205 = _2201;
    float _2207 = _2197 + _2073;
    float _2209 = fma(_1497, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2211 = _2167;
    if (_2009)
    {
        float _2213 = _2167 * _2189;
        _2211 = _2213;
    }
    float _2215 = _2211;
    if (_2009)
    {
        float _2217 = fma(_2125, _2137, _2205);
        _2131 = _2217;
    }
    float _2219 = _2131;
    int _2221 = _2015 + 56;
    uint _2223 = uint(int(uint(_2221) >> uint(2)));
    uint _2225 = uint(int(uint(int(_2223)) >> uint(2)));
    int _2227 = int(_2223) & 3;
    float _2229 = (*spvDescriptorSet0.vp_c15)._m0[int(_2225)][_2227];
    int _2231 = int(_2223) + 1;
    uint _2233 = uint(int(uint(_2231) >> uint(2)));
    int _2235 = _2231 & 3;
    float _2237 = (*spvDescriptorSet0.vp_c15)._m0[int(_2233)][_2235];
    float _2239 = floor(_2209);
    if (_2009)
    {
        float _2241 = _1939 * _2215;
        _1989 = _2241;
    }
    float _2243 = _1989;
    if (_2009)
    {
        float _2245 = _1941 * _2215;
        _1991 = _2245;
    }
    float _2247 = _1991;
    if (_2009)
    {
        float _2249 = _2243 * _2243;
        _1993 = _2249;
    }
    float _2251 = _1993;
    if (_2009)
    {
        float _2253 = _2247 * _2247;
        _1995 = _2253;
    }
    float _2255 = _1995;
    int _2257 = _2015 + 48;
    uint _2259 = uint(int(uint(_2257) >> uint(2)));
    uint _2261 = uint(int(uint(int(_2259)) >> uint(2)));
    int _2263 = int(_2259) & 3;
    float _2265 = (*spvDescriptorSet0.vp_c15)._m0[int(_2261)][_2263];
    int _2267 = int(_2259) + 1;
    uint _2269 = uint(int(uint(_2267) >> uint(2)));
    int _2271 = _2267 & 3;
    float _2273 = (*spvDescriptorSet0.vp_c15)._m0[int(_2269)][_2271];
    float _2275 = _2199 * 0.693147182464599609375;
    float _2277 = fma(_2219, _2219, _2251);
    float _2279 = _1869 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2281 = _2277 + _2255;
    float _2283 = fma(_1871, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2279);
    int _2285 = _2015 + 64;
    uint _2287 = uint(int(uint(_2285) >> uint(2)));
    uint _2289 = uint(int(uint(int(_2287)) >> uint(2)));
    int _2291 = int(_2287) & 3;
    float _2293 = (*spvDescriptorSet0.vp_c15)._m0[int(_2289)][_2291];
    int _2295 = int(_2287) + 1;
    uint _2297 = uint(int(uint(_2295) >> uint(2)));
    int _2299 = _2295 & 3;
    float _2301 = (*spvDescriptorSet0.vp_c15)._m0[int(_2297)][_2299];
    float _2303 = fma(_1871, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2191);
    float _2305 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2307 = fma(_1917, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2305);
    float _2309 = precise::clamp(_2307, 0.0, 1.0);
    float _2311 = fma(_1873, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2283);
    float _2313 = fma(_1871, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1903);
    float _2315 = fma(_1873, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2303);
    float _2317 = -_2309;
    float _2319 = _2317 + 1.0;
    float _2321 = _2311 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    int _2323 = _2015 + 72;
    uint _2325 = uint(int(uint(_2323) >> uint(2)));
    uint _2327 = uint(int(uint(int(_2325)) >> uint(2)));
    int _2329 = int(_2325) & 3;
    float _2331 = (*spvDescriptorSet0.vp_c15)._m0[int(_2327)][_2329];
    int _2333 = int(_2325) + 1;
    uint _2335 = uint(int(uint(_2333) >> uint(2)));
    int _2337 = _2333 & 3;
    float _2339 = (*spvDescriptorSet0.vp_c15)._m0[int(_2335)][_2337];
    float _2341 = _2315 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2343 = fma(_1873, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2313);
    float _2345 = _2321 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2347 = rsqrt(_2281);
    float _2349 = -_2239;
    float _2351 = _2209 + _2349;
    float _2353 = _2343 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2355 = fma(_2341, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2345);
    int _2357 = _2015 + 80;
    uint _2359 = uint(int(uint(_2357) >> uint(2)));
    uint _2361 = uint(int(uint(int(_2359)) >> uint(2)));
    int _2363 = int(_2359) & 3;
    float _2365 = (*spvDescriptorSet0.vp_c15)._m0[int(_2361)][_2363];
    int _2367 = int(_2359) + 1;
    uint _2369 = uint(int(uint(_2367) >> uint(2)));
    int _2371 = _2367 & 3;
    float _2373 = (*spvDescriptorSet0.vp_c15)._m0[int(_2369)][_2371];
    float _2375 = fma(_2127, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2355);
    float _2377 = 1.0 / _2207;
    float _2379 = fma(_2353, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2375);
    int _2381 = _2015 + 88;
    uint _2383 = uint(int(uint(_2381) >> uint(2)));
    uint _2385 = uint(int(uint(int(_2383)) >> uint(2)));
    int _2387 = int(_2383) & 3;
    float _2389 = (*spvDescriptorSet0.vp_c15)._m0[int(_2385)][_2387];
    int _2391 = int(_2383) + 1;
    uint _2393 = uint(int(uint(_2391) >> uint(2)));
    int _2395 = _2391 & 3;
    float _2397 = (*spvDescriptorSet0.vp_c15)._m0[int(_2393)][_2395];
    float _2399 = _2347 * _2243;
    float _2401 = _2347 * _2219;
    float _2403 = abs(_2319);
    float _2405 = log2(_2403);
    float _2407 = _2347 * _2247;
    float _2409 = _2355;
    if (!_2085)
    {
        int _2411 = _2183 + 400;
        uint _2413 = uint(int(uint(_2411) >> uint(2)));
        uint _2415 = uint(int(uint(int(_2413)) >> uint(2)));
        int _2417 = int(_2413) & 3;
        float _2419 = (*spvDescriptorSet0.vp_c15)._m0[int(_2415)][_2417];
        _2409 = _2419;
    }
    float _2421 = _2409;
    float _2423 = _2399 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2425 = _2275 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2427 = 1.0 / _2379;
    float _2429 = _1927 * _2273;
    float _2431 = -_2423;
    float _2433 = fma(_2401, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2431);
    float _2435 = fma(_1497, _2265, _2429);
    float _2437 = _2405 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2439 = _1927 * _2301;
    float _2441 = fma(_1571, _2229, _2435);
    float _2443 = exp2(_2437);
    float _2445 = fma(_1497, _2293, _2439);
    float _2447 = _2441 + _2237;
    float _2449 = -_2407;
    float _2451 = fma(_2449, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2433);
    float _2453 = fma(_1571, _2331, _2445);
    float _2455 = _2447 * _2377;
    float _2457 = _2433;
    if (!_2085)
    {
        float _2459 = floor(_1955);
        _2457 = _2459;
    }
    float _2461 = _2457;
    float _2463 = _2453 + _2339;
    float _2465 = fma(_2451, -0.5, 0.5);
    bool _2467 = _2455 >= 0.0;
    float _2469 = fma(_2451, 0.5, 0.5);
    float _2471 = _2463 * _2377;
    float _2473 = _1927 * _2373;
    bool _2475 = _2455 <= 1.0;
    bool _2477 = _2475 && _2467;
    float _2479 = sqrt(_2465);
    float _2481 = fma(_1497, _2365, _2473);
    bool _2483 = _2471 >= 0.0;
    bool _2485 = _2483 && _2477;
    float _2487 = fma(_1571, _2389, _2481);
    bool _2489 = _2471 <= 1.0;
    bool _2491 = _2489 && _2485;
    if (!_2085)
    {
        float _2493 = -_2461;
        float _2495 = _1955 + _2493;
        _1997 = _2495;
    }
    float _2497 = _1997;
    float _2499 = _2321 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2501 = fma(_2469, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2503 = _2487 + _2397;
    float _2505 = _2321 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2507 = _2389;
    if (!_2085)
    {
        float _2509 = floor(_1981);
        _2507 = _2509;
    }
    float _2511 = _2507;
    float _2513 = fma(_2469, _2501, -0.212114393711090087890625);
    float _2515 = fma(_2341, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2499);
    float _2517 = fma(_2341, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2505);
    float _2519 = _2401 + 1.0;
    float _2521 = fma(_2469, _2513, 1.570728778839111328125);
    float _2523 = fma(_2127, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2515);
    float _2525 = _2513;
    if (_2491)
    {
        float _2527 = float(_2007);
        _2525 = _2527;
    }
    float _2529 = _2525;
    float _2531 = _2499;
    if (!_2085)
    {
        float _2533 = rint(_2421);
        float _2535 = precise::max(_2533, 0.0);
        uint _2537 = uint(_2535);
        uint _2539 = clamp(_2537, 0u, 65535u);
        _2531 = as_type<float>(_2539);
    }
    float _2541 = _2531;
    float _2543 = fma(_2127, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2517);
    float _2545 = -_2401;
    float _2547 = fma(_2443, _2519, _2545);
    float _2549 = fma(_2353, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2523);
    float _2551 = _2479 * 0.636619746685028076171875;
    float _2553 = fma(_2353, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2543);
    float _2555 = _2503 * _2377;
    float _2557 = _2549 * _2427;
    float _2559 = _2529;
    float _2561 = _2551;
    float _2563 = _2553;
    if (_2491)
    {
        float _2565 = rint(_2529);
        float _2567 = precise::max(_2565, 0.0);
        uint _2569 = uint(_2567);
        uint _2571 = clamp(_2569, 0u, 65535u);
        _2559 = as_type<float>(_2571);
    }
    float _2573 = _2559;
    float _2575 = _2553 * _2427;
    float _2577 = -_2521;
    float _2579 = fma(_2551, _2577, 1.0);
    if (!_2085)
    {
        float _2581 = -_2511;
        float _2583 = _1981 + _2581;
        _2561 = _2583;
    }
    float _2585 = _2561;
    float _2587 = fma(_2557, 0.5, 0.5);
    float _2589 = fma(_2575, -0.5, 0.5);
    float _2591 = fma(_2547, 0.5, 0.5);
    float2 _7026 = float2(_2351, _1973);
    float _2593 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_7026, float2(0.0), isnan(_7026)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_7026, float2(0.0), isnan(_7026)), level(0.0)).x;
    float _2595 = _2541;
    if (!_2085)
    {
        float3 _7043 = float3(_2585, _2497, float(as_type<int>(_2541)));
        float3 _7047 = select(_7043, float3(0.0), isnan(_7043));
        float _2597 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _7047.xy, uint(rint(_7047.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _7047.xy, uint(rint(_7047.z)), level(0.0)).x;
        _2595 = _2597;
    }
    float _2599 = _2595;
    float _2601 = _2573;
    if (_2491)
    {
        float3 _7062 = float3(_2455, _2471, float(as_type<int>(_2573)));
        float3 _7064 = select(_7062, float3(0.0), isnan(_7062));
        float _2603 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _7064.xy, uint(rint(_7064.z)), _2555, level(0.0));
        _2601 = _2603;
    }
    float _2605 = _2601;
    float3 _7074 = float3(_2587, _2589, _2425);
    float _2607 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7074, float3(0.0), isnan(_7074)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7074, float3(0.0), isnan(_7074)), level(0.0)).x;
    float3 _7083 = float3(_2587, _2589, _2425);
    float4 _2609 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7083, float3(0.0), isnan(_7083)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7083, float3(0.0), isnan(_7083)), level(0.0)).xyzw;
    float _2611 = _2609.x;
    float _2613 = _2609.y;
    float _2615 = _2609.z;
    float _2617 = _2609.w;
    float2 _7099 = float2(_2579, _2591);
    float3 _2621 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7099, float2(0.0), isnan(_7099)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7099, float2(0.0), isnan(_7099)), level(0.0)).xyz;
    float _2623 = _2621.x;
    float _2625 = _2621.y;
    float _2627 = _2621.z;
    float _2629 = abs(_1959);
    float _2631 = log2(_2629);
    float _2633 = _2321 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2635 = _2405 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2637 = fma(_2341, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2633);
    float _2639 = exp2(_2635);
    float _2641 = fma(_2127, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2637);
    float _2643 = fma(_2353, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2641);
    float _2645 = _2631 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2647 = _2643 + _2379;
    out.gl_Position.x = _2549;
    out.gl_Position.y = _2553;
    out.gl_Position.z = _2643;
    out.gl_Position.w = _2379;
    float _2649 = _2647 * 0.5;
    float _2651 = exp2(_2645);
    out.m_91.z = _2649;
    out.m_91.w = _2379;
    bool _2653 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2655 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2657 = _2653 || _2655;
    bool _2659 = isnan(0.5);
    bool _2661 = _2657 || _2659;
    float _2663 = fma(_2651, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2665 = precise::clamp(_2663, 0.0, 1.0);
    float _2667 = fma(_2665, -2.0, 3.0);
    float _2669 = _2665 * _2665;
    float _2671 = _2669 * _2667;
    bool _2673 = _1959 <= 8000.0;
    bool _2675 = isnan(_1959);
    bool _2677 = _2673 || _2675;
    bool _2679 = isnan(8000.0);
    bool _2681 = _2677 || _2679;
    float _2683 = float(_2681);
    float _2685 = -_2671;
    float _2687 = _2685 + 1.0;
    float _2689 = fma(_2687, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2671);
    float _2691 = _2683 * _2689;
    float _2693 = _2683;
    if (_2661)
    {
        _2693 = 1.0;
    }
    float _2695 = _2693;
    float _2697 = _2695;
    float _2699 = _2623;
    float _2701 = _2625;
    if (!_2661)
    {
        float _2703 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2705 = _2703 * 0.15915493667125701904296875;
        float _2707 = _2705 * 6.283185482025146484375;
        float _2709 = cos(_2707);
        float _2711 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2713 = _2711 * 0.15915493667125701904296875;
        float _2715 = _2705 * 6.283185482025146484375;
        float _2717 = sin(_2715);
        float _2719 = 1.0 / _2709;
        float _2721 = _2713 * 6.283185482025146484375;
        float _2723 = cos(_2721);
        float _2725 = _2717 * _2719;
        float _2727 = _2713 * 6.283185482025146484375;
        float _2729 = sin(_2727);
        float _2731 = _2723 * _2725;
        float _2733 = 1.0 / _2731;
        float _2735 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2737 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2735;
        float _2739 = 1.0 / _2737;
        float _2741 = _2729 * _2733;
        float _2743 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2745 = fma(_1959, _2741, _2743);
        float _2747 = _2745 * _2739;
        float _2749 = precise::clamp(_2747, 0.0, 1.0);
        _2563 = _2739;
        _2697 = _2749;
    }
    float _2751 = _2563;
    float _2753 = _2697;
    float _2755 = _2691 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2757 = -_2593;
    float _2759 = _2757 + 1.0;
    float _2761 = -_2639;
    float _2763 = _2761 + 1.0;
    float _2765 = _2751;
    float _2767 = _2755;
    if (!_2491)
    {
        _2765 = 1.0;
    }
    float _2769 = _2765;
    float _2771 = _2759 * _2755;
    float _2773 = precise::clamp(_2771, 0.0, 1.0);
    float _2775 = _2769;
    if (_2491)
    {
        bool _2777 = _2605 >= _2555;
        bool _2779 = isnan(_2605);
        bool _2781 = _2777 || _2779;
        bool _2783 = isnan(_2555);
        bool _2785 = _2781 || _2783;
        float _2787 = float(_2785);
        _2775 = _2787;
    }
    float _2789 = _2775;
    float _2791 = _2763 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    if (_2085)
    {
        _2767 = 1.0;
    }
    float _2793 = _2767;
    float _2795 = _2793;
    if (!_2085)
    {
        int _2797 = _2117 << 4;
        int _2799 = _2797 + 2048;
        uint _2801 = uint(int(uint(_2799) >> uint(2)));
        uint _2803 = uint(int(uint(int(_2801)) >> uint(2)));
        int _2805 = int(_2801) & 3;
        float _2807 = (*spvDescriptorSet0.vp_c15)._m0[int(_2803)][_2805];
        int _2809 = int(_2801) + 1;
        uint _2811 = uint(int(uint(_2809) >> uint(2)));
        int _2813 = _2809 & 3;
        float _2815 = (*spvDescriptorSet0.vp_c15)._m0[int(_2811)][_2813];
        int _2817 = _2799 + 8;
        uint _2819 = uint(int(uint(_2817) >> uint(2)));
        uint _2821 = uint(int(uint(int(_2819)) >> uint(2)));
        int _2823 = int(_2819) & 3;
        float _2825 = (*spvDescriptorSet0.vp_c15)._m0[int(_2821)][_2823];
        int _2827 = int(_2819) + 1;
        uint _2829 = uint(int(uint(_2827) >> uint(2)));
        int _2831 = _2827 & 3;
        float _2833 = (*spvDescriptorSet0.vp_c15)._m0[int(_2829)][_2831];
        float _2835 = _1927 * _2815;
        float _2837 = fma(_1497, _2807, _2835);
        float _2839 = fma(_1571, _2825, _2837);
        float _2841 = _2839 + _2833;
        float _2843 = precise::clamp(_2841, 0.0, 1.0);
        float _2845 = -_2843;
        float _2847 = _2845 + _2599;
        float _2849 = fma(_2847, 500.0, 1.5);
        float _2851 = exp2(_2849);
        float _2853 = 0.0 + _2851;
        float _2855 = precise::clamp(_2853, 0.0, 1.0);
        _2795 = _2855;
        _1639 = _2843;
        _1641 = 500.0;
    }
    float _2857 = _2795;
    float _2859 = _1639;
    float _2861 = _1641;
    float _2863 = _2789 * _2857;
    float _2865 = _2791 * _2607;
    float _2867 = -_2773;
    float _2869 = fma(_2867, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2871 = -_2791;
    float _2873 = _2871 + 1.0;
    out.m_93.x = _1871;
    out.m_93.y = _1869;
    out.m_93.z = _1873;
    float _2875 = _2617 * _2865;
    float _2877 = -_2863;
    float _2879 = fma(_2877, _2869, 1.0);
    float _2881 = precise::clamp(_2879, 0.0, 1.0);
    float _2883 = _2627 * _2865;
    float _2885 = _2617 * _2873;
    float _2887 = fma(_2623, _2875, _2611);
    float _2889 = fma(_2625, _2875, _2613);
    float _2891 = _2881 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2893 = fma(_2617, _2883, _2615);
    bool _2895 = _1917 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2897 = isnan(_1917);
    bool _2899 = _2895 || _2897;
    bool _2901 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2903 = _2899 || _2901;
    float _2905 = _2753 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_95.x = _2891;
    out.m_97.x = _2887;
    out.m_97.y = _2889;
    out.m_97.z = _2893;
    out.m_97.w = _2885;
    float _2907 = _2861;
    float _2909 = _2859;
    float _2911 = _2875;
    float _2913 = _2873;
    if (!_2903)
    {
        _2699 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2915 = _2699;
    float _2917 = _2915;
    float _2919 = _2915;
    if (!_2903)
    {
        _2701 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2921 = _2701;
    float _2923 = _2921;
    float _2925 = _2921;
    if (!_2903)
    {
        _2907 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2927 = _2907;
    float _2929 = _2927;
    float _2931 = _2927;
    if (!_2903)
    {
        _2909 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2933 = _2909;
    float _2935 = _2933;
    float _2937 = _2933;
    if (!_2903)
    {
        _2911 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2939 = _2911;
    float _2941 = _2939;
    float _2943 = _2939;
    if (!_2903)
    {
        _2913 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2945 = _2913;
    bool _2947 = !_2903;
    float _2949 = _2945;
    float _2951 = _2945;
    if (!_2947)
    {
        bool _2953 = _1917 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2955 = isnan(_1917);
        bool _2957 = _2953 || _2955;
        bool _2959 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2961 = _2957 || _2959;
        if (!_2961)
        {
            float _2963 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2965 = _1917 + _2963;
            float _2967 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2969 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2967;
            float _2971 = 1.0 / _2969;
            float _2973 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2975 = _2973 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2977 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2979 = _2977 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2981 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2983 = _2981 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2985 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2987 = _2985 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2989 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2991 = _2989 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2993 = _2965 * _2971;
            float _2995 = precise::clamp(_2993, 0.0, 1.0);
            float _2997 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2999 = _2997 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3001 = fma(_2995, _2975, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3003 = fma(_2995, _2999, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3005 = fma(_2995, _2979, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3007 = fma(_2995, _2983, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3009 = fma(_2995, _2987, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3011 = fma(_2995, _2991, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2925 = _3001;
            _2943 = _3009;
            _2919 = _3003;
            _2937 = _3007;
            _2931 = _3005;
            _2951 = _3011;
            _3013 = true;
        }
        else
        {
            bool _3015 = _1917 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3017 = isnan(_1917);
            bool _3019 = _3015 || _3017;
            bool _3021 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3023 = _3019 || _3021;
            if (!_3023)
            {
                _2917 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3025 = _2917;
            _2919 = _3025;
            if (!_3023)
            {
                _2923 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3027 = _2923;
            _2925 = _3027;
            if (!_3023)
            {
                _2929 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3029 = _2929;
            _2931 = _3029;
            if (!_3023)
            {
                _2935 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3031 = _2935;
            _2937 = _3031;
            if (!_3023)
            {
                _2941 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3033 = _2941;
            _2943 = _3033;
            if (!_3023)
            {
                _2949 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3035 = _2949;
            bool _3037 = !_3023;
            _2951 = _3035;
            if (!_3037)
            {
                bool _3039 = _1917 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3041 = isnan(_1917);
                bool _3043 = _3039 || _3041;
                bool _3045 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3047 = _3043 || _3045;
                if (!_3047)
                {
                    float _3049 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3051 = _1917 + _3049;
                    float _3053 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3055 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3053;
                    float _3057 = 1.0 / _3055;
                    float _3059 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3061 = _3059 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3063 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3065 = _3063 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3067 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3069 = _3067 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3071 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3073 = _3071 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3075 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3077 = _3075 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3079 = _3051 * _3057;
                    float _3081 = precise::clamp(_3079, 0.0, 1.0);
                    float _3083 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3085 = _3083 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3087 = fma(_3081, _3061, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3089 = fma(_3081, _3085, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3091 = fma(_3081, _3065, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3093 = fma(_3081, _3069, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3095 = fma(_3081, _3073, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3097 = fma(_3081, _3077, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2925 = _3087;
                    _2943 = _3095;
                    _2919 = _3089;
                    _2937 = _3093;
                    _2931 = _3091;
                    _2951 = _3097;
                    _3013 = true;
                }
                else
                {
                    _2925 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2943 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2919 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2937 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2931 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2951 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3013 = false;
    float _3099 = _2925;
    float _3101 = _2943;
    float _3103 = _2919;
    float _3105 = _2937;
    float _3107 = _2931;
    float _3109 = _2951;
    float _3111 = fma(_1771, -0.5, 0.5);
    float _3113 = precise::clamp(_3111, 0.0, 1.0);
    float _3115 = -_3099;
    float _3117 = _3115 + _3101;
    float _3119 = -_3103;
    float _3121 = _3119 + _3105;
    out.m_99.x = 0.0;
    float _3123 = -_3107;
    float _3125 = _3123 + _3109;
    float _3127 = fma(_3113, _3117, _3099);
    out.m_101.x = 0.0;
    float _3129 = fma(_3113, _3121, _3103);
    float _3131 = _3127 * 0.586610972881317138671875;
    bool _3133 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3135 = fma(_3113, _3125, _3107);
    float _3137 = fma(_3129, 0.298911988735198974609375, _3131);
    float _3139 = _2905 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    bool _3141 = _2753 > 0.0;
    bool _3143 = isnan(_2753);
    bool _3145 = _3141 || _3143;
    bool _3147 = isnan(0.0);
    bool _3149 = _3145 || _3147;
    float _3151 = fma(_3135, 0.114477999508380889892578125, _3137);
    out.m_63.x = _3139;
    float _3153 = -_3151;
    float _3155 = _3129 + _3153;
    float _3157 = -_3151;
    float _3159 = _3127 + _3157;
    float _3161 = -_3151;
    float _3163 = _3135 + _3161;
    float _3165 = fma(_3155, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3151);
    float _3167 = fma(_3159, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3151);
    float _3169 = fma(_3163, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3151);
    bool _3171 = !_3133;
    if (!_3171)
    {
        float _3173 = -_1869;
        float _3175 = _3173 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3177 = -_1871;
        float _3179 = _3177 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3181 = -_1873;
        float _3183 = _3181 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3185 = _3175 * _3175;
        float _3187 = fma(_3179, _3179, _3185);
        float _3189 = fma(_3183, _3183, _3187);
        float _3191 = rsqrt(_3189);
        float _3193 = sqrt(_3189);
        float _3195 = _3175 * _3191;
        float _3197 = _3179 * _3191;
        float _3199 = _3183 * _3191;
        float _3201 = -_1937;
        float _3203 = _3201 + _3195;
        float _3205 = -_1931;
        float _3207 = _3205 + _3197;
        float _3209 = -_1933;
        float _3211 = _3209 + _3199;
        float _3213 = _3203 * _3203;
        float _3215 = -_3193;
        float _3217 = _3215 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3219 = fma((*spvDescriptorSet0.vp_c13)._m0[4].y, (*spvDescriptorSet0.vp_c13)._m0[4].y, 0.00999999977648258209228515625);
        float _3221 = precise::clamp(_3219, 0.0, 1.0);
        float _3223 = fma(_3207, _3207, _3213);
        float _3225 = _3217 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3227 = precise::clamp(_3225, 0.0, 1.0);
        float _3229 = _3221 * _3221;
        float _3231 = fma(_3211, _3211, _3223);
        float _3233 = _3229 + (-1.0);
        float _3235 = abs(_3227);
        float _3237 = log2(_3235);
        float _3239 = rsqrt(_3231);
        float _3241 = _3237 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3243 = exp2(_3241);
        float _3245 = _3203 * _3239;
        float _3247 = _3207 * _3239;
        float _3249 = _3211 * _3239;
        float _3251 = _3197 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3253 = _1771 * _3245;
        float _3255 = _1771 * _3195;
        float _3257 = fma(_1769, _3247, _3253);
        float _3259 = fma(_1769, _3197, _3255);
        float _3261 = fma(_1773, _3249, _3257);
        float _3263 = precise::clamp(_3261, 0.0, 1.0);
        float _3265 = fma(_1773, _3199, _3259);
        float _3267 = precise::clamp(_3265, 0.0, 1.0);
        float _3269 = _3263 * _3263;
        float _3271 = fma(_3269, _3233, 1.0);
        float _3273 = -_3195;
        float _3275 = -_3251;
        float _3277 = fma(_3273, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3275);
        float _3279 = _3271 * _3271;
        float _3281 = -_3199;
        float _3283 = fma(_3281, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3277);
        float _3285 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3287 = _3283 + _3285;
        float _3289 = 1.0 / _3279;
        float _3291 = _3287 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3293 = precise::clamp(_3291, 0.0, 1.0);
        float _3295 = _3243 * _3293;
        float _3297 = _3267 * _3295;
        float _3299 = _3297 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3301 = _3229 * _3289;
        float _3303 = _3297 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3305 = _3297 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        float _3307 = _3297 * _3301;
        out.m_99.x = _3299;
        out.m_99.y = _3303;
        out.m_99.z = _3305;
        float _3309 = _3307 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3311 = _3307 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3313 = _3307 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_101.x = _3309;
        out.m_101.y = _3311;
        out.m_101.z = _3313;
    }
    out.m_103.x = _3165;
    out.m_103.y = _3167;
    out.m_103.z = _3169;
    if (_3149)
    {
        return out;
    }
    out.m_63.x = 0.0;
    float _3315 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3315;
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
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3013 = false;
    bool _1821 = false;
    bool _1095 = false;
    bool _903 = false;
    bool _363 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _123 = in.m_60.w;
    float _125 = trunc(_123);
    int _127 = int(_125);
    bool _131 = _127 >= 1;
    float _133 = 0.0;
    if (!_131)
    {
        _133 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _135 = _133;
    float _137 = _135;
    if (!_131)
    {
        out.m_63.x = 0.0;
    }
    int _139 = 0;
    if (!_131)
    {
        float _141 = _135 * 5.0;
        _139 = as_type<int>(_141);
    }
    int _143 = _139;
    int _145 = _143;
    if (!_131)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3372 = as_type<float>(_143);
        out.gl_Position.z = _3372;
    }
    if (!_131)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _147 = in.m_65.w;
    bool _149 = _147 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _151 = isnan(_147);
    bool _153 = _149 || _151;
    bool _155 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _157 = _153 || _155;
    float _159 = -_147;
    float _161 = _159 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _163 = 0.0;
    float _165 = _161;
    if (_157)
    {
        float _167 = float(_127);
        _163 = _167;
    }
    float _169 = _163;
    bool _171 = _161 >= _169;
    bool _173 = !_157;
    bool _175 = _171 || _173;
    if (_175)
    {
        _137 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _177 = _137;
    if (_175)
    {
        out.m_63.x = 0.0;
    }
    if (_175)
    {
        float _179 = _177 * 5.0;
        _145 = as_type<int>(_179);
    }
    int _181 = _145;
    if (_175)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3441 = as_type<float>(_181);
        out.gl_Position.z = _3441;
    }
    if (_175)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _183 = in.m_67.x;
    float _185 = in.m_67.y;
    float _187 = in.m_67.z;
    float _189 = in.m_69.x;
    float _191 = in.m_69.y;
    float _193 = in.m_69.z;
    float _195 = in.m_71.x;
    float _197 = in.m_71.y;
    float _199 = in.m_71.z;
    float _201 = _183 * _183;
    float _203 = _185 * _185;
    float _205 = _187 * _187;
    float _207 = fma(_189, _189, _201);
    float _209 = fma(_191, _191, _203);
    float _211 = fma(_193, _193, _205);
    float _213 = fma(_195, _195, _207);
    float _215 = fma(_197, _197, _209);
    float _217 = fma(_199, _199, _211);
    float _219 = sqrt(_213);
    float _221 = sqrt(_215);
    float _223 = sqrt(_217);
    bool _225 = _219 > 0.0;
    bool _227 = _221 > 0.0;
    float _229 = _221;
    float _231 = _213;
    float _233 = _215;
    if (_225)
    {
        float _235 = rsqrt(_213);
        _229 = _235;
    }
    float _237 = _229;
    float _239 = 0.0;
    float _241 = 0.0;
    if (!_225)
    {
        _239 = 0.0;
        _241 = 0.0;
    }
    float _243 = _239;
    float _245 = _241;
    bool _247 = _223 > 0.0;
    float _249 = 0.0;
    float _251 = _223;
    float _253 = _243;
    float _255 = _245;
    if (!_225)
    {
        _249 = 0.0;
    }
    float _257 = _249;
    float _259 = 0.0;
    float _261 = _257;
    if (!_227)
    {
        _259 = 0.0;
    }
    float _263 = _259;
    float _265 = _219;
    float _267 = _263;
    if (_227)
    {
        float _269 = rsqrt(_215);
        _265 = _269;
    }
    float _271 = _265;
    float _273 = 0.0;
    if (!_227)
    {
        _273 = 0.0;
    }
    float _275 = _273;
    float _277 = _275;
    if (!_227)
    {
        _251 = 0.0;
    }
    float _279 = _251;
    float _281 = _279;
    if (!_247)
    {
        _231 = 0.0;
    }
    float _283 = _231;
    float _285 = 0.0;
    float _287 = _283;
    if (_247)
    {
        float _289 = rsqrt(_217);
        _285 = _289;
    }
    float _291 = _285;
    float _293 = _237;
    if (_225)
    {
        float _295 = _237 * _189;
        _253 = _295;
    }
    float _297 = _253;
    float _299 = _297;
    if (_225)
    {
        float _301 = _237 * _183;
        _255 = _301;
    }
    float _303 = _255;
    if (_225)
    {
        float _305 = _237 * _195;
        _261 = _305;
    }
    float _307 = _261;
    bool _309 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    if (!_247)
    {
        _233 = 0.0;
        _293 = 0.0;
    }
    float _311 = _233;
    float _313 = _293;
    float _315 = _311;
    float _317 = _313;
    if (_227)
    {
        float _319 = _271 * _191;
        _267 = _319;
    }
    float _321 = _267;
    if (_227)
    {
        float _323 = _271 * _185;
        _277 = _323;
    }
    float _325 = _277;
    if (_227)
    {
        float _327 = _271 * _197;
        _281 = _327;
    }
    float _329 = _281;
    if (_247)
    {
        float _331 = _291 * _193;
        _315 = _331;
    }
    float _333 = _315;
    if (_247)
    {
        float _335 = _291 * _187;
        _287 = _335;
    }
    float _337 = _287;
    if (_247)
    {
        float _339 = _291 * _199;
        _317 = _339;
    }
    float _341 = _317;
    bool _343 = !_309;
    float _361;
    if (!_343)
    {
        float _345 = in.m_73.x;
        float _347 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _349 = _345 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _351 = fma(_349, (*spvDescriptorSet0.vp_c9)._m0[12].x, _161);
        float _353 = _351 * _347;
        float _355 = floor(_353);
        float _357 = -_355;
        float _359 = _353 + _357;
        _361 = _359;
        _363 = true;
    }
    else
    {
        float _365 = float(_127);
        float _367 = 1.0 / _365;
        float _369 = _161 * _367;
        _361 = _369;
    }
    _363 = false;
    float _371 = _361;
    int _373 = int2(spvDescriptorSet0.vp_t_tcb_C.get_width(), spvDescriptorSet0.vp_t_tcb_C.get_height()).x;
    int _375 = _373;
    int _377 = 0;
    int _379 = _118(_375, _377, (*spvDescriptorSet0.support_buffer));
    float _381 = in.m_73.x;
    float _383 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[191].y;
    float _385 = in.m_73.y;
    float _387 = -_383;
    float _389 = _387 + (*spvDescriptorSet0.vp_c9)._m0[191].y;
    float _391 = fma((*spvDescriptorSet0.vp_c10)._m0[2].x, 0.0166666693985462188720703125, _381);
    float _393 = fma(_389, _385, _383);
    float _395 = _391 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _397 = _395 * _393;
    float _399 = float(_379);
    int _401 = abs(_379);
    bool _403 = _379 == 0;
    float _405 = _397 * _399;
    float _407 = float(uint(_401));
    float _409 = trunc(_405);
    int _411 = int(_409);
    float _413 = 1.0 / _407;
    int _415 = abs(_411);
    uint _418 = uint(int(uint(_411) >> uint(31)));
    float _420 = float(uint(_415));
    int _422 = ~int(_418);
    int _424 = _422 + 1;
    int _426 = as_type<int>(_413) + (-2);
    float _428 = as_type<float>(_426) * _420;
    float _430 = trunc(_428);
    float _432 = precise::max(_430, 0.0);
    uint _434 = uint(_432);
    int _436 = ~int(_434);
    int _438 = _436 + 1;
    int _440 = _438 * _401;
    int _442 = _440 + _415;
    float _444 = float(uint(_442));
    float _446 = as_type<float>(_426) * _444;
    float _448 = trunc(_446);
    float _450 = precise::max(_448, 0.0);
    uint _452 = uint(_450);
    int _454 = int(_434) + int(_452);
    float _456 = in.m_75.z;
    int _458 = ~_454;
    int _460 = _458 + 1;
    int _462 = _460 * _401;
    int _464 = _462 + _415;
    bool _466 = uint(_464) >= uint(_401);
    bool _468 = !_466;
    int _470 = _468 ? 0 : (-1);
    int _472 = ~_454;
    int _474 = _472 + _470;
    int _476 = _474 + 1;
    float _478 = trunc(_456);
    int _480 = int(_478);
    int _482 = _476 * _401;
    int _484 = _482 + _415;
    int _486 = _484 ^ _424;
    int _488 = ~_424;
    int _490 = _488 + _486;
    int _492 = _490 + 1;
    bool _494 = !_403;
    int _496 = _494 ? _492 : (-1);
    int _498 = _496;
    int _500 = 0;
    int _502 = _119(_498, _500, (*spvDescriptorSet0.support_buffer));
    int _504 = _480;
    int _506 = 0;
    int _508 = _119(_504, _506, (*spvDescriptorSet0.support_buffer));
    float4 _511 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_502, _508)), 0).xyzw;
    float _513 = _511.x;
    float _515 = _511.y;
    float _517 = _511.z;
    float _519 = _511.w;
    float _521 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _523 = in.m_75.x;
    float _525 = _521 * _381;
    bool _527 = _371 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _529 = isnan(_371);
    bool _531 = _527 || _529;
    bool _533 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _535 = _531 || _533;
    float _537 = float(_535);
    float _539 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _541 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _539;
    int _543 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _545 = _543 != 0;
    int _547 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _549 = _547 != 0;
    float _551 = trunc(_525);
    int _553 = int(_551);
    float _555 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _557 = _371 + _555;
    bool _559 = _381 > 0.5;
    bool _561 = _559 && _545;
    bool _563 = _385 > 0.5;
    bool _565 = _563 && _549;
    float _567 = 1.0 / _541;
    float _569 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _571 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _573 = _496 + 1;
    float _575 = _569 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _577 = _553 << 4;
    int _579 = _577 + 1712;
    float _581 = _571 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    uint _583 = uint(int(uint(_579) >> uint(2)));
    uint _585 = uint(int(uint(int(_583)) >> uint(2)));
    int _587 = int(_583) & 3;
    float _589 = (*spvDescriptorSet0.vp_c9)._m0[int(_585)][_587];
    int _591 = int(_583) + 1;
    uint _593 = uint(int(uint(_591) >> uint(2)));
    int _595 = _591 & 3;
    float _597 = (*spvDescriptorSet0.vp_c9)._m0[int(_593)][_595];
    float _599 = _557 * _567;
    bool _601 = _371 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _603 = isnan(_371);
    bool _605 = _601 || _603;
    bool _607 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _609 = _605 || _607;
    float _611 = float(_609);
    float _613 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _615 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _613;
    float _617 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _619 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _617;
    int _621 = _579 + 8;
    uint _623 = uint(int(uint(_621) >> uint(2)));
    uint _625 = uint(int(uint(int(_623)) >> uint(2)));
    int _627 = int(_623) & 3;
    float _629 = (*spvDescriptorSet0.vp_c9)._m0[int(_625)][_627];
    float _631 = fma(_615, _599, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _633 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _635 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _633;
    float _637 = fma(_619, _599, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _639 = 0.0;
    if (_545)
    {
        _639 = _523;
    }
    float _641 = _639;
    float _643 = fma(_635, _599, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _645 = -_611;
    float _647 = _645 + 1.0;
    float _649 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _651 = _641;
    if (_561)
    {
        float _653 = -_641;
        float _655 = _653 + 1.0;
        _651 = _655;
    }
    float _657 = _651;
    float _659 = _537 * _647;
    float _661 = _649 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _663 = _631 * _659;
    float _665 = _637 * _659;
    float _667 = _643 * _659;
    out.m_77.x = _661;
    out.m_77.y = _575;
    out.m_77.z = _581;
    float _669 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _671 = _589 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _673 = _597 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _675 = -_537;
    float _677 = _675 + 1.0;
    float _679 = _589;
    if (!_545)
    {
        _679 = _523;
    }
    float _681 = _679;
    float _683 = _671 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _685 = _681;
    if (_545)
    {
        _685 = _657;
    }
    float _687 = _685;
    float _689 = fma(_677, (*spvDescriptorSet0.vp_c9)._m0[143].y, _665);
    float _691 = fma(_677, (*spvDescriptorSet0.vp_c9)._m0[143].x, _663);
    float _693 = fma(_677, (*spvDescriptorSet0.vp_c9)._m0[143].z, _667);
    float _695 = fma(_611, (*spvDescriptorSet0.vp_c9)._m0[144].y, _689);
    int _697 = abs(_573);
    float _699 = fma(_611, (*spvDescriptorSet0.vp_c9)._m0[144].z, _693);
    float _701 = fma(_611, (*spvDescriptorSet0.vp_c9)._m0[144].x, _691);
    uint _703 = uint(int(uint(_573) >> uint(31)));
    float _705 = _629 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _707 = float(uint(_697));
    float _709 = _673 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _711 = ~int(_703);
    int _713 = _711 + 1;
    float _715 = _705 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _717 = _687 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _719 = as_type<float>(_426) * _707;
    out.m_79.x = _683;
    out.m_79.y = _709;
    out.m_79.z = _715;
    out.m_79.w = _669;
    float _721 = trunc(_719);
    float _723 = precise::max(_721, 0.0);
    uint _725 = uint(_723);
    int _727 = ~int(_725);
    int _729 = _727 + 1;
    int _731 = _729 * _401;
    int _733 = _731 + _697;
    float _735 = float(uint(_733));
    float _737 = as_type<float>(_426) * _735;
    float _739 = trunc(_737);
    float _741 = precise::max(_739, 0.0);
    uint _743 = uint(_741);
    float _745 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _747 = int(_725) + int(_743);
    float _749 = in.m_81.x;
    float _751 = in.m_81.y;
    float _753 = in.m_81.z;
    int _755 = ~_747;
    int _757 = _755 + 1;
    int _759 = _757 * _401;
    int _761 = _759 + _697;
    float _763 = _717 * _745;
    bool _765 = uint(_761) >= uint(_401);
    bool _767 = !_765;
    int _769 = _767 ? 0 : (-1);
    int _771 = ~_747;
    int _773 = _771 + _769;
    int _775 = _773 + 1;
    float _777 = _695 * _751;
    int _779 = _775 * _401;
    int _781 = _779 + _697;
    float _783 = _701 * _749;
    float _785 = _699 * _753;
    float _787 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _789 = _781 ^ _713;
    int _791 = ~_713;
    int _793 = _791 + _789;
    int _795 = _793 + 1;
    float _797 = in.m_75.y;
    float _799 = _797;
    if (_565)
    {
        float _801 = -_797;
        float _803 = _801 + 1.0;
        _799 = _803;
    }
    float _805 = _799;
    float _807 = _805 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _809 = _807 * _787;
    uint _811 = as_type<uint>(half2(float2(_519, 0.0)));
    uint _813 = extract_bits(_811, 0u, 8u);
    int _815 = int(_813) & 255;
    uint _817 = extract_bits(_811, 8u, 8u);
    int _819 = int(_817) & 255;
    int _821 = _819 << 8;
    int _823 = _815 | _821;
    bool _825 = _823 >= 32768;
    int _827 = _823 + (-1024);
    int _829 = _827;
    if (_825)
    {
        int _831 = ~_823;
        int _833 = _831 + 33792;
        int _835 = _833 + 1;
        _829 = _835;
    }
    int _837 = _829;
    int _839 = _837 + 30719;
    float _841 = float(_839);
    float _843 = fma(_841, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _845 = abs(_843);
    float _847 = -_845;
    float _849 = _847 + 1.0;
    float _851 = abs(_843);
    float _853 = fma(_851, -0.0187292993068695068359375, 0.074261002242565155029296875);
    bool _855 = _843 < 0.0;
    float _857 = float(_855);
    int _859 = as_type<int>(_849) + (-218103808);
    bool _861 = uint(_859) >= 1920991232u;
    float _863 = abs(_843);
    float _865 = fma(_863, _853, -0.212114393711090087890625);
    bool _867 = !_403;
    int _869 = _867 ? _795 : (-1);
    float _871 = abs(_843);
    float _873 = fma(_871, _865, 1.570728778839111328125);
    bool _875 = !_861;
    float _901;
    if (!_875)
    {
        int _877 = as_type<int>(_849);
        int _879 = _795;
        int _881 = as_type<int>(_745);
        int _883 = 3728;
        int _885 = 0;
        int _887;
        int _889;
        int _891;
        int _893;
        int _895;
        int _897;
        int _899;
        _116(_877, _879, _881, _883, _885, _887, _889, _891, _893, _895, _897, _899, out.gl_Position, out.gl_PointSize);
        _901 = as_type<float>(_897);
        _903 = true;
    }
    else
    {
        float _905 = rsqrt(_849);
        float _907 = _849 * _905;
        float _909 = _905 * 0.5;
        float _911 = -_907;
        float _913 = 0.0 + _911;
        float _915 = fma(_909, _913, 0.5);
        float _917 = fma(_907, _915, _907);
        float _919 = -_917;
        float _921 = 0.0 + _919;
        float _923 = fma(_917, _921, _849);
        float _925 = fma(_909, _923, _917);
        _901 = _925;
    }
    _903 = false;
    float _927 = _901;
    int _929 = _869;
    int _931 = 0;
    int _933 = _119(_929, _931, (*spvDescriptorSet0.support_buffer));
    int _935 = _480;
    int _937 = 0;
    int _939 = _119(_935, _937, (*spvDescriptorSet0.support_buffer));
    float4 _941 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_933, _939)), 0).xyzw;
    float _943 = _941.x;
    float _945 = _941.y;
    float _947 = _941.z;
    float _949 = _941.w;
    float _951 = _873 * _927;
    float _953 = _857 * 2.0;
    float _955 = floor(_405);
    float _957 = _841 * 3.883221149444580078125;
    float _959 = -_953;
    float _961 = fma(_951, _959, _951);
    float _963 = _957 * 0.15915493667125701904296875;
    float _965 = fma(_857, 3.1415927410125732421875, _961);
    float _967 = _963 * 6.283185482025146484375;
    float _969 = cos(_967);
    float _971 = _965 * 0.15915493667125701904296875;
    float _973 = -_955;
    float _975 = _405 + _973;
    float _977 = _971 * 6.283185482025146484375;
    float _979 = sin(_977);
    float _981 = _963 * 6.283185482025146484375;
    float _983 = sin(_981);
    float _985 = _979 * _969;
    float _987 = _979 * _983;
    uint _989 = as_type<uint>(half2(float2(_949, 0.0)));
    float _991 = -_513;
    float _993 = _991 + _943;
    float _995 = -_517;
    float _997 = _995 + _947;
    uint _999 = extract_bits(_989, 0u, 8u);
    int _1001 = int(_999) & 255;
    uint _1003 = extract_bits(_989, 8u, 8u);
    int _1005 = int(_1003) & 255;
    int _1007 = _1005 << 8;
    int _1009 = _1001 | _1007;
    float _1011 = fma(_975, _993, _513);
    float _1013 = fma(_975, _997, _517);
    bool _1015 = _1009 >= 32768;
    int _1017 = _1009 + (-1024);
    int _1019 = _1017;
    if (_1015)
    {
        int _1021 = ~_1009;
        int _1023 = _1021 + 33792;
        int _1025 = _1023 + 1;
        _1019 = _1025;
    }
    int _1027 = _1019;
    int _1029 = _1027 + 30719;
    float _1031 = float(_1029);
    float _1033 = fma(_1031, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _1035 = abs(_1033);
    float _1037 = -_1035;
    float _1039 = _1037 + 1.0;
    bool _1041 = _1033 < 0.0;
    float _1043 = float(_1041);
    float _1045 = abs(_1033);
    float _1047 = fma(_1045, -0.0187292993068695068359375, 0.074261002242565155029296875);
    int _1049 = as_type<int>(_1039) + (-218103808);
    float _1051 = abs(_1033);
    float _1053 = fma(_1051, _1047, -0.212114393711090087890625);
    bool _1055 = uint(_1049) >= 1920991232u;
    float _1057 = -_515;
    float _1059 = _1057 + _945;
    float _1061 = abs(_1033);
    float _1063 = fma(_1061, _1053, 1.570728778839111328125);
    float _1065 = fma(_975, _1059, _515);
    bool _1067 = !_1055;
    float _1093;
    if (!_1067)
    {
        int _1069 = as_type<int>(_1039);
        int _1071 = as_type<int>(_963);
        int _1073 = as_type<int>(_983);
        int _1075 = 4624;
        int _1077 = as_type<int>(_951);
        int _1079;
        int _1081;
        int _1083;
        int _1085;
        int _1087;
        int _1089;
        int _1091;
        _116(_1069, _1071, _1073, _1075, _1077, _1079, _1081, _1083, _1085, _1087, _1089, _1091, out.gl_Position, out.gl_PointSize);
        _1093 = as_type<float>(_1089);
        _1095 = true;
    }
    else
    {
        float _1097 = rsqrt(_1039);
        float _1099 = _1039 * _1097;
        float _1101 = _1097 * 0.5;
        float _1103 = -_1099;
        float _1105 = 0.0 + _1103;
        float _1107 = fma(_1101, _1105, 0.5);
        float _1109 = fma(_1099, _1107, _1099);
        float _1111 = -_1109;
        float _1113 = 0.0 + _1111;
        float _1115 = fma(_1109, _1113, _1039);
        float _1117 = fma(_1101, _1115, _1109);
        _1093 = _1117;
    }
    _1095 = false;
    float _1119 = _1093;
    float _1121 = in.m_73.x;
    float _1123 = in.m_73.y;
    float _1125 = in.m_73.z;
    float _1127 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1129 = log2(_1127);
    float _1131 = _1063 * _1119;
    int _1133 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1135 = _1133 != 0;
    int _1137 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1139 = _1137 != 0;
    int _1141 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1143 = _1141 != 0;
    float _1145 = _783 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1147 = _777 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1149 = _785 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1151 = _1031 * 3.883221149444580078125;
    float _1153 = -_843;
    float _1155 = _1153 + _1033;
    float _1157 = _1151 * 0.15915493667125701904296875;
    float _1159 = _1157 * 6.283185482025146484375;
    float _1161 = sin(_1159);
    float _1163 = _1123 * 2.0;
    float _1165 = _1125 * 2.0;
    float _1167 = _1121 * 2.0;
    float _1169 = _1125 + _1121;
    float _1171 = floor(_1163);
    float _1173 = _1169 + (-1.0);
    float _1175 = floor(_1165);
    bool _1177 = _1171 > 0.0;
    float _1179 = floor(_1167);
    bool _1181 = _1171 >= 0.0;
    bool _1183 = isnan(_1171);
    bool _1185 = _1181 || _1183;
    bool _1187 = isnan(0.0);
    bool _1189 = _1185 || _1187;
    int _1191 = _1189 ? 0 : 1;
    bool _1193 = _1175 > 0.0;
    bool _1195 = _1175 >= 0.0;
    bool _1197 = isnan(_1175);
    bool _1199 = _1195 || _1197;
    bool _1201 = isnan(0.0);
    bool _1203 = _1199 || _1201;
    float _1205 = _1129 * _161;
    int _1207 = ~_1191;
    int _1209 = _1207 + 1;
    int _1211 = _1209 + 1;
    float _1213 = fma(_1173, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    int _1215 = _1203 ? 0 : 1;
    float _1217 = exp2(_1205);
    int _1219 = _1211;
    int _1221 = as_type<int>(_1157);
    if (!_1177)
    {
        int _1223 = ~_1191;
        int _1225 = _1223 + 1;
        _1219 = _1225;
    }
    int _1227 = _1219;
    int _1229 = ~_1215;
    int _1231 = _1229 + 1;
    int _1233 = _1231 + 1;
    float _1235 = in.m_83.x;
    float _1237 = in.m_83.y;
    float _1239 = in.m_83.z;
    int _1241 = _1233;
    if (!_1193)
    {
        int _1243 = ~_1215;
        int _1245 = _1243 + 1;
        _1241 = _1245;
    }
    int _1247 = _1241;
    bool _1249 = !_1135;
    int _1251 = _1249 ? 0 : 1;
    float _1253 = _1123 + _1121;
    bool _1255 = _1179 > 0.0;
    float _1257 = _1121 + (-0.5);
    int _1259 = abs(_1251);
    float _1261 = _1253 + (-1.0);
    bool _1263 = !_1143;
    int _1265 = _1263 ? 0 : 1;
    float _1267 = -_1217;
    float _1269 = _1267 + 1.0;
    bool _1271 = _1179 >= 0.0;
    bool _1273 = isnan(_1179);
    bool _1275 = _1271 || _1273;
    bool _1277 = isnan(0.0);
    bool _1279 = _1275 || _1277;
    float _1281 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1283 = 1.0 + _1281;
    int _1285 = abs(_1265);
    float _1287 = float(_1259);
    float _1289 = 1.0 / _1283;
    float _1291 = float(_1247);
    bool _1293 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1295 = isnan(1.0);
    bool _1297 = _1293 || _1295;
    bool _1299 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1301 = _1297 || _1299;
    float _1303 = _1287 * _1291;
    bool _1305 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1307 = isnan(0.0);
    bool _1309 = _1305 || _1307;
    bool _1311 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1313 = _1309 || _1311;
    float _1315 = float(_1285);
    float _1317 = _1303 * (-2.0);
    float _1319 = float(_1227);
    float _1321 = fma(_1261, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1323 = _1313 ? _1269 : 0.0;
    int _1325 = _1279 ? 0 : 1;
    float _1327 = _1315 * _1319;
    float _1329 = fma(_1317, _1235, _1235);
    float _1331 = fma(_1321, _1317, _1321);
    bool _1333 = !_1139;
    int _1335 = _1333 ? 0 : 1;
    if (_1301)
    {
        float _1337 = _1323 * _1289;
        _165 = _1337;
    }
    float _1339 = _165;
    float _1341 = fma(_1257, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1329);
    float _1343 = _1327 * (-2.0);
    int _1345 = ~_1325;
    int _1347 = _1345 + 1;
    int _1349 = _1347 + 1;
    int _1351 = abs(_1335);
    float _1353 = fma(_1331, _1339, _1341);
    int _1355 = _1349;
    if (!_1255)
    {
        int _1357 = ~_1325;
        int _1359 = _1357 + 1;
        _1355 = _1359;
    }
    int _1361 = _1355;
    float _1363 = _1125 + (-0.5);
    float _1365 = fma(_1343, _1239, _1239);
    float _1367 = float(_1351);
    float _1369 = fma(_1213, _1343, _1213);
    float _1371 = float(_1361);
    float _1373 = _1353 * 0.15915493667125701904296875;
    float _1375 = fma(_1363, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1365);
    float _1377 = in.m_69.x;
    float _1379 = in.m_69.y;
    float _1381 = in.m_69.z;
    float _1383 = _1125 + _1123;
    float _1385 = _1367 * _1371;
    float _1387 = _1123 + (-0.5);
    float _1389 = in.m_60.x;
    float _1391 = in.m_60.y;
    float _1393 = in.m_60.z;
    float _1395 = _1383 + (-1.0);
    float _1397 = _1385 * (-2.0);
    float _1399 = fma(_1369, _1339, _1375);
    float _1401 = _1373 * 6.283185482025146484375;
    float _1403 = sin(_1401);
    float _1405 = fma(_1395, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1407 = fma(_1397, _1237, _1237);
    float _1409 = in.m_71.x;
    float _1411 = in.m_71.y;
    float _1413 = in.m_71.z;
    float _1415 = _1399 * 0.15915493667125701904296875;
    float _1417 = fma(_1405, _1397, _1405);
    float _1419 = fma(_1387, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1407);
    bool _1421 = _1065 != 0.0;
    bool _1423 = isnan(_1065);
    bool _1425 = _1421 || _1423;
    bool _1427 = isnan(0.0);
    bool _1429 = _1425 || _1427;
    float _1431 = _1373 * 6.283185482025146484375;
    float _1433 = cos(_1431);
    float _1435 = fma(_1417, _1339, _1419);
    float _1437 = _1043 * 2.0;
    bool _1439 = _1011 == 0.0;
    bool _1441 = !_1429;
    bool _1443 = _1439 && _1441;
    float _1445 = _1435 * 0.15915493667125701904296875;
    float _1447 = -_1437;
    float _1449 = fma(_1131, _1447, _1131);
    float _1451 = _1415 * 6.283185482025146484375;
    float _1453 = sin(_1451);
    float _1455 = fma(_1043, 3.1415927410125732421875, _1449);
    float _1457 = _1379 * _1391;
    bool _1459 = _1013 == 0.0;
    bool _1461 = _1459 && _1443;
    float _1463 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1065);
    float _1465 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1013);
    float _1467 = _1415 * 6.283185482025146484375;
    float _1469 = cos(_1467);
    float _1471 = fma(_1377, _1389, _1457);
    float _1473 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1011);
    float _1475 = _1411 * _1391;
    float _1477 = _1147 * _1463;
    float _1479 = fma(_1381, _1393, _1471);
    float _1481 = _1145 * _1473;
    float _1483 = fma(_1409, _1389, _1475);
    float _1485 = _1445 * 6.283185482025146484375;
    float _1487 = sin(_1485);
    float _1489 = _1403 * _1453;
    float _1491 = _1149 * _1465;
    float _1493 = fma(_1413, _1393, _1483);
    float _1495 = _1433 * _1453;
    float _1497 = _1479 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1499 = _1445 * 6.283185482025146484375;
    float _1501 = cos(_1499);
    float _1503 = _1433 * _1469;
    float _1505 = _1403 * _1469;
    float _1507 = fma(_1487, _1489, _1503);
    float _1509 = _1157 * 6.283185482025146484375;
    float _1511 = cos(_1509);
    float _1513 = _1501 * _1453;
    float _1515 = _1501 * _1469;
    float _1517 = _1403 * _1501;
    float _1519 = _1433 * _1501;
    float _1521 = -_1495;
    float _1523 = fma(_1487, _1505, _1521);
    float _1525 = _1507 * _1477;
    float _1527 = -_1505;
    float _1529 = fma(_1487, _1495, _1527);
    float _1531 = _1517 * _1477;
    float _1533 = _1523 * _1477;
    float _1535 = fma(_1513, _1481, _1525);
    float _1537 = fma(_1487, _1503, _1489);
    float _1539 = -_1487;
    float _1541 = fma(_1539, _1481, _1531);
    float _1543 = fma(_1515, _1481, _1533);
    float _1545 = fma(_1529, _1491, _1535);
    float _1547 = _1455 * 0.15915493667125701904296875;
    float _1549 = fma(_1519, _1491, _1541);
    float _1551 = fma(_1537, _1491, _1543);
    float _1553 = _1545 * _321;
    float _1555 = _1545 * _329;
    float _1557 = in.m_67.x;
    float _1559 = in.m_67.y;
    float _1561 = in.m_67.z;
    float _1563 = _1547 * 6.283185482025146484375;
    float _1565 = sin(_1563);
    float _1567 = fma(_1551, _297, _1553);
    float _1569 = fma(_1551, _307, _1555);
    float _1571 = _1493 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1573 = fma(_1549, _333, _1567);
    float _1575 = fma(_1549, _341, _1569);
    float _1577 = _1497 + _1573;
    float _1579 = _1571 + _1575;
    float _1581 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1583 = _1577 + _1581;
    float _1585 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1587 = _1579 + _1585;
    float _1589 = -_985;
    float _1591 = fma(_1565, _1511, _1589);
    float _1593 = _1583 * _1583;
    float _1595 = _1587 * _1587;
    float _1597 = -_987;
    float _1599 = fma(_1565, _1161, _1597);
    float _1601 = fma(_975, _1591, _985);
    float _1603 = _1593 + _1595;
    float _1605 = _1559 * _1391;
    float _1607 = _1545 * _325;
    float _1609 = fma(_975, _1599, _987);
    float _1611 = sqrt(_1603);
    float _1613 = fma(_1557, _1389, _1605);
    float _1615 = fma(_975, _1155, _843);
    float _1617 = fma(_1551, _303, _1607);
    float _1619 = _1601;
    float _1621 = _1615;
    float _1623 = _1609;
    float _1625 = _1557;
    float _1627 = _1593;
    float _1629 = _1595;
    float _1631 = _1577;
    float _1633 = _1579;
    float _1635 = _1561;
    int _1637 = as_type<int>(_1599);
    float _1639 = _1571;
    float _1641 = _1497;
    if (!_1461)
    {
        float _1643 = fma(_1011, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1601);
        _1619 = _1643;
    }
    float _1645 = _1619;
    float _1647 = fma(_1561, _1393, _1613);
    if (!_1461)
    {
        float _1649 = fma(_1065, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1615);
        _1621 = _1649;
    }
    float _1651 = _1621;
    float _1653 = fma(_1549, _337, _1617);
    if (!_1461)
    {
        float _1655 = fma(_1013, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1609);
        _1623 = _1655;
    }
    float _1657 = _1623;
    float _1659 = _1647 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1661 = _1507 * _1651;
    float _1663 = _1517 * _1651;
    float _1665 = _1523 * _1651;
    float _1667 = fma(_1513, _1645, _1661);
    float _1669 = _1659 + _1653;
    bool _1671 = _1611 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1673 = -_1487;
    float _1675 = fma(_1673, _1645, _1663);
    if (!_1671)
    {
        _1625 = _1669;
    }
    float _1677 = _1625;
    bool _1679 = !_1671;
    float _1681 = _1677;
    if (!_1679)
    {
        float _1683 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1685 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1687 = _1611 + _1685;
        float _1689 = rsqrt(_1603);
        float _1691 = _1687 * _1683;
        float _1693 = _1669 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1695 = _1691 * 0.15915493667125701904296875;
        float _1697 = _1695 * 6.283185482025146484375;
        float _1699 = sin(_1697);
        float _1701 = _1695 * 6.283185482025146484375;
        float _1703 = cos(_1701);
        float _1705 = fma(_1699, _1693, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1707 = _1689 * _1705;
        float _1709 = _1703 + (-1.0);
        float _1711 = _1583 * _1707;
        float _1713 = _1587 * _1707;
        float _1715 = _1709 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1717 = _1711 + (*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1719 = _1711 * _1711;
        float _1721 = _1713 + (*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1723 = fma(_1669, _1703, _1715);
        float _1725 = _1713 * _1713;
        _1681 = _1723;
        _1627 = _1719;
        _1629 = _1725;
        _1631 = _1717;
        _1633 = _1721;
        _1635 = _1695;
    }
    float _1727 = _1681;
    float _1729 = _1627;
    float _1731 = _1629;
    float _1733 = _1631;
    float _1735 = _1633;
    float _1737 = _1635;
    float _1739 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1741 = _1727 + _1739;
    float _1743 = fma(_1515, _1645, _1665);
    float _1745 = fma(_1529, _1657, _1667);
    float _1747 = fma(_1519, _1657, _1675);
    float _1749 = fma(_1741, _1741, _1729);
    float _1751 = fma(_1537, _1657, _1743);
    float _1753 = _1745 * _321;
    float _1755 = _1745 * _325;
    float _1757 = _1749 + _1731;
    float _1759 = _1745 * _329;
    float _1761 = fma(_1751, _297, _1753);
    float _1763 = fma(_1751, _303, _1755);
    out.m_85.x = _763;
    out.m_85.y = _809;
    float _1765 = fma(_1751, _307, _1759);
    float _1767 = sqrt(_1757);
    float _1769 = fma(_1747, _333, _1761);
    float _1771 = fma(_1747, _337, _1763);
    float _1773 = fma(_1747, _341, _1765);
    out.m_87.x = _1769;
    out.m_87.y = _1771;
    out.m_87.z = _1773;
    out.m_89.x = 1.0;
    out.m_89.y = 1.0;
    out.m_89.z = 1.0;
    bool _1775 = _1767 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1777 = isnan(_1767);
    bool _1779 = _1775 || _1777;
    bool _1781 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1783 = _1779 || _1781;
    float _1785 = _1737;
    if (!_1783)
    {
        _1785 = 1.0;
    }
    float _1787 = _1785;
    bool _1789 = !_1783;
    float _1791 = _1787;
    if (!_1789)
    {
        bool _1793 = _1767 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1795 = isnan(_1767);
        bool _1797 = _1793 || _1795;
        bool _1799 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1801 = _1797 || _1799;
        if (!_1801)
        {
            float _1803 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1805 = _1767 + _1803;
            float _1807 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1809 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1807;
            float _1811 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1813 = _1811 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1815 = 1.0 / _1809;
            float _1817 = _1805 * _1815;
            float _1819 = fma(_1817, _1813, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1791 = _1819;
            _1821 = true;
        }
        else
        {
            bool _1823 = _1767 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1825 = isnan(_1767);
            bool _1827 = _1823 || _1825;
            bool _1829 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1831 = _1827 || _1829;
            if (!_1831)
            {
                float _1833 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1835 = _1767 + _1833;
                float _1837 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1839 = _1837 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1841 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1843 = _1841 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1845 = 1.0 / _1839;
                float _1847 = _1835 * _1845;
                float _1849 = fma(_1847, _1843, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1791 = _1849;
                _1821 = true;
            }
            else
            {
                _1791 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1821 = false;
    float _1851 = _1791;
    float _1853 = _1659 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1855 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1857 = _1727 + _1855;
    float _1859 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1861 = _1733 + _1859;
    float _1863 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1865 = _1735 + _1863;
    float _1867 = fma(_1497, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1853);
    float _1869 = fma(_1857, _1851, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1871 = fma(_1861, _1851, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1873 = fma(_1865, _1851, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1875 = fma(_1571, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1867);
    float _1877 = _1659 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1879 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1881 = _1869 + _1879;
    float _1883 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1885 = _1871 + _1883;
    float _1887 = _1875 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1889 = fma(_1497, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1877);
    float _1891 = _1881 * _1881;
    float _1893 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1895 = _1873 + _1893;
    float _1897 = 1.0 / _1887;
    float _1899 = fma(_1571, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1889);
    float _1901 = fma(_1885, _1885, _1891);
    float _1903 = _1869 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1905 = _1899 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1907 = fma(_1895, _1895, _1901);
    float _1909 = _1905 + _1887;
    float _1911 = rsqrt(_1907);
    float _1913 = _1909 * _1897;
    float _1915 = _1913 * 0.5;
    float _1917 = sqrt(_1907);
    float _1919 = fma(_1571, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1921 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1923 = fma(_1915, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1921);
    float _1925 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _1927 = _1659 + _1925;
    float _1929 = 1.0 / _1923;
    float _1931 = _1885 * _1911;
    float _1933 = _1895 * _1911;
    float _1935 = _1927 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1937 = _1881 * _1911;
    float _1939 = _1931 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1941 = _1933 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1943 = fma(_1497, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1935);
    float _1945 = floor(_1919);
    float _1947 = _1939 * _1939;
    float _1949 = _1941 * _1941;
    float _1951 = fma(_1571, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1943);
    float _1953 = _1947 + _1949;
    float _1955 = _1951 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _1957 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1959 = _1929 * _1957;
    float _1961 = _1927 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1963 = sqrt(_1953);
    bool _1965 = _1959 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _1967 = fma(_1497, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1961);
    bool _1969 = _1959 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _1971 = -_1945;
    float _1973 = _1919 + _1971;
    float _1975 = fma(_1571, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1967);
    float _1977 = trunc(_1955);
    int _1979 = int(_1977);
    float _1981 = _1975 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    bool _1983 = !_1965;
    int _1985 = _1983 ? 0 : 1;
    int _1987 = 2;
    float _1989 = _1939;
    float _1991 = _1941;
    float _1993 = _1947;
    float _1995 = _1949;
    float _1997 = _1919;
    if (!_1965)
    {
        _1987 = 1;
    }
    int _1999 = _1987;
    float _2001 = trunc(_1981);
    int _2003 = int(_2001);
    int _2005 = _1999;
    if (!_1969)
    {
        _2005 = _1985;
    }
    int _2007 = _2005;
    bool _2009 = _1963 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2011 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2013 = _1963 + _2011;
    int _2015 = _2007 << 6;
    int _2017 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _2019 = _1979 + _2017;
    int _2021 = _2019 + 1;
    int _2023 = _2015 + 96;
    uint _2025 = uint(int(uint(_2023) >> uint(2)));
    uint _2027 = uint(int(uint(int(_2025)) >> uint(2)));
    int _2029 = int(_2025) & 3;
    float _2031 = (*spvDescriptorSet0.vp_c15)._m0[int(_2027)][_2029];
    int _2033 = int(_2025) + 1;
    uint _2035 = uint(int(uint(_2033) >> uint(2)));
    int _2037 = _2033 & 3;
    float _2039 = (*spvDescriptorSet0.vp_c15)._m0[int(_2035)][_2037];
    float _2041 = _321;
    float _2043 = _2013;
    int _2045 = _2021;
    if (_2009)
    {
        float _2047 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2041 = _2047;
    }
    float _2049 = _2041;
    int _2051 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _2053 = _2003 + _2051;
    int _2055 = _2053 + 1;
    int _2057 = _2015 + 104;
    uint _2059 = uint(int(uint(_2057) >> uint(2)));
    uint _2061 = uint(int(uint(int(_2059)) >> uint(2)));
    int _2063 = int(_2059) & 3;
    float _2065 = (*spvDescriptorSet0.vp_c15)._m0[int(_2061)][_2063];
    int _2067 = int(_2059) + 1;
    uint _2069 = uint(int(uint(_2067) >> uint(2)));
    int _2071 = _2067 & 3;
    float _2073 = (*spvDescriptorSet0.vp_c15)._m0[int(_2069)][_2071];
    bool _2075 = _2055 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _2077 = _2055 | _2021;
    bool _2079 = _2077 < 0;
    bool _2081 = _2079 || _2075;
    bool _2083 = _2021 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _2085 = _2083 || _2081;
    if (_2009)
    {
        float _2087 = _2013 * _2049;
        _2043 = _2087;
    }
    float _2089 = _2043;
    if (_2009)
    {
        float _2091 = _2089 * 0.15915493667125701904296875;
        _299 = _2091;
    }
    float _2093 = _299;
    float _2095 = _1869 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2097 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2099 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2101 = _1763;
    if (_2009)
    {
        float _2103 = _2093 * 6.283185482025146484375;
        float _2105 = sin(_2103);
        _2101 = _2105;
    }
    float _2107 = _2101;
    float _2109 = fma(_1871, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2095);
    float _2111 = precise::max(0.0, _2097);
    if (!_2085)
    {
        int _2113 = _2021 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _2115 = _2113 + _2055;
        _2045 = _2115;
    }
    int _2117 = _2045;
    float _2119 = fma(_1873, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2109);
    float _2121 = -_1937;
    float _2123 = -_2111;
    float _2125 = fma(_2121, (*spvDescriptorSet0.vp_c15)._m0[24].y, _2123);
    float _2127 = _2119 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2129 = _307;
    float _2131 = _2125;
    if (_2009)
    {
        float _2133 = _2093 * 6.283185482025146484375;
        float _2135 = cos(_2133);
        _2129 = _2135;
    }
    float _2137 = _2129;
    if (!_2085)
    {
        int _2139 = _2117 << 2;
        _1637 = _2139;
    }
    int _2141 = _1637;
    float _2143 = _2127 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    int _2145 = _2141;
    if (!_2085)
    {
        uint _2147 = uint(int(uint(_2117) >> uint(2)));
        _1221 = int(_2147);
    }
    int _2149 = _1221;
    if (!_2085)
    {
        int _2151 = 12 & _2141;
        _2145 = _2151;
    }
    int _2153 = _2145;
    float _2155 = _1927 * _2039;
    float _2157 = _2119;
    float _2159 = _2039;
    int _2161 = _2153;
    float _2163 = _2155;
    if (_2009)
    {
        float _2165 = rsqrt(_1953);
        _2157 = _2165;
    }
    float _2167 = _2157;
    if (_2009)
    {
        float _2169 = _2125 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2159 = _2169;
    }
    float _2171 = _2159;
    float _2173 = -_2143;
    float _2175 = fma(_2173, _2099, 1.0);
    float _2177 = fma(_1497, _2031, _2155);
    if (!_2085)
    {
        int _2179 = _2149 << 4;
        int _2181 = _2179 + _2153;
        _2161 = _2181;
    }
    int _2183 = _2161;
    float _2185 = _2107;
    if (_2009)
    {
        float _2187 = fma(_2107, _2171, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2185 = _2187;
    }
    float _2189 = _2185;
    float _2191 = _1869 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    if (_2009)
    {
        float _2193 = _2137 + (-1.0);
        _2163 = _2193;
    }
    float _2195 = _2163;
    float _2197 = fma(_1571, _2065, _2177);
    float _2199 = log2(_2175);
    float _2201 = _2195;
    if (_2009)
    {
        float _2203 = _2195 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2201 = _2203;
    }
    float _2205 = _2201;
    float _2207 = _2197 + _2073;
    float _2209 = fma(_1497, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2211 = _2167;
    if (_2009)
    {
        float _2213 = _2167 * _2189;
        _2211 = _2213;
    }
    float _2215 = _2211;
    if (_2009)
    {
        float _2217 = fma(_2125, _2137, _2205);
        _2131 = _2217;
    }
    float _2219 = _2131;
    int _2221 = _2015 + 56;
    uint _2223 = uint(int(uint(_2221) >> uint(2)));
    uint _2225 = uint(int(uint(int(_2223)) >> uint(2)));
    int _2227 = int(_2223) & 3;
    float _2229 = (*spvDescriptorSet0.vp_c15)._m0[int(_2225)][_2227];
    int _2231 = int(_2223) + 1;
    uint _2233 = uint(int(uint(_2231) >> uint(2)));
    int _2235 = _2231 & 3;
    float _2237 = (*spvDescriptorSet0.vp_c15)._m0[int(_2233)][_2235];
    float _2239 = floor(_2209);
    if (_2009)
    {
        float _2241 = _1939 * _2215;
        _1989 = _2241;
    }
    float _2243 = _1989;
    if (_2009)
    {
        float _2245 = _1941 * _2215;
        _1991 = _2245;
    }
    float _2247 = _1991;
    if (_2009)
    {
        float _2249 = _2243 * _2243;
        _1993 = _2249;
    }
    float _2251 = _1993;
    if (_2009)
    {
        float _2253 = _2247 * _2247;
        _1995 = _2253;
    }
    float _2255 = _1995;
    int _2257 = _2015 + 48;
    uint _2259 = uint(int(uint(_2257) >> uint(2)));
    uint _2261 = uint(int(uint(int(_2259)) >> uint(2)));
    int _2263 = int(_2259) & 3;
    float _2265 = (*spvDescriptorSet0.vp_c15)._m0[int(_2261)][_2263];
    int _2267 = int(_2259) + 1;
    uint _2269 = uint(int(uint(_2267) >> uint(2)));
    int _2271 = _2267 & 3;
    float _2273 = (*spvDescriptorSet0.vp_c15)._m0[int(_2269)][_2271];
    float _2275 = _2199 * 0.693147182464599609375;
    float _2277 = fma(_2219, _2219, _2251);
    float _2279 = _1869 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2281 = _2277 + _2255;
    float _2283 = fma(_1871, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2279);
    int _2285 = _2015 + 64;
    uint _2287 = uint(int(uint(_2285) >> uint(2)));
    uint _2289 = uint(int(uint(int(_2287)) >> uint(2)));
    int _2291 = int(_2287) & 3;
    float _2293 = (*spvDescriptorSet0.vp_c15)._m0[int(_2289)][_2291];
    int _2295 = int(_2287) + 1;
    uint _2297 = uint(int(uint(_2295) >> uint(2)));
    int _2299 = _2295 & 3;
    float _2301 = (*spvDescriptorSet0.vp_c15)._m0[int(_2297)][_2299];
    float _2303 = fma(_1871, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2191);
    float _2305 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2307 = fma(_1917, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2305);
    float _2309 = precise::clamp(_2307, 0.0, 1.0);
    float _2311 = fma(_1873, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2283);
    float _2313 = fma(_1871, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1903);
    float _2315 = fma(_1873, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2303);
    float _2317 = -_2309;
    float _2319 = _2317 + 1.0;
    float _2321 = _2311 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    int _2323 = _2015 + 72;
    uint _2325 = uint(int(uint(_2323) >> uint(2)));
    uint _2327 = uint(int(uint(int(_2325)) >> uint(2)));
    int _2329 = int(_2325) & 3;
    float _2331 = (*spvDescriptorSet0.vp_c15)._m0[int(_2327)][_2329];
    int _2333 = int(_2325) + 1;
    uint _2335 = uint(int(uint(_2333) >> uint(2)));
    int _2337 = _2333 & 3;
    float _2339 = (*spvDescriptorSet0.vp_c15)._m0[int(_2335)][_2337];
    float _2341 = _2315 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2343 = fma(_1873, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2313);
    float _2345 = _2321 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2347 = rsqrt(_2281);
    float _2349 = -_2239;
    float _2351 = _2209 + _2349;
    float _2353 = _2343 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2355 = fma(_2341, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2345);
    int _2357 = _2015 + 80;
    uint _2359 = uint(int(uint(_2357) >> uint(2)));
    uint _2361 = uint(int(uint(int(_2359)) >> uint(2)));
    int _2363 = int(_2359) & 3;
    float _2365 = (*spvDescriptorSet0.vp_c15)._m0[int(_2361)][_2363];
    int _2367 = int(_2359) + 1;
    uint _2369 = uint(int(uint(_2367) >> uint(2)));
    int _2371 = _2367 & 3;
    float _2373 = (*spvDescriptorSet0.vp_c15)._m0[int(_2369)][_2371];
    float _2375 = fma(_2127, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2355);
    float _2377 = 1.0 / _2207;
    float _2379 = fma(_2353, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2375);
    int _2381 = _2015 + 88;
    uint _2383 = uint(int(uint(_2381) >> uint(2)));
    uint _2385 = uint(int(uint(int(_2383)) >> uint(2)));
    int _2387 = int(_2383) & 3;
    float _2389 = (*spvDescriptorSet0.vp_c15)._m0[int(_2385)][_2387];
    int _2391 = int(_2383) + 1;
    uint _2393 = uint(int(uint(_2391) >> uint(2)));
    int _2395 = _2391 & 3;
    float _2397 = (*spvDescriptorSet0.vp_c15)._m0[int(_2393)][_2395];
    float _2399 = _2347 * _2243;
    float _2401 = _2347 * _2219;
    float _2403 = abs(_2319);
    float _2405 = log2(_2403);
    float _2407 = _2347 * _2247;
    float _2409 = _2355;
    if (!_2085)
    {
        int _2411 = _2183 + 400;
        uint _2413 = uint(int(uint(_2411) >> uint(2)));
        uint _2415 = uint(int(uint(int(_2413)) >> uint(2)));
        int _2417 = int(_2413) & 3;
        float _2419 = (*spvDescriptorSet0.vp_c15)._m0[int(_2415)][_2417];
        _2409 = _2419;
    }
    float _2421 = _2409;
    float _2423 = _2399 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2425 = _2275 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2427 = 1.0 / _2379;
    float _2429 = _1927 * _2273;
    float _2431 = -_2423;
    float _2433 = fma(_2401, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2431);
    float _2435 = fma(_1497, _2265, _2429);
    float _2437 = _2405 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2439 = _1927 * _2301;
    float _2441 = fma(_1571, _2229, _2435);
    float _2443 = exp2(_2437);
    float _2445 = fma(_1497, _2293, _2439);
    float _2447 = _2441 + _2237;
    float _2449 = -_2407;
    float _2451 = fma(_2449, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2433);
    float _2453 = fma(_1571, _2331, _2445);
    float _2455 = _2447 * _2377;
    float _2457 = _2433;
    if (!_2085)
    {
        float _2459 = floor(_1955);
        _2457 = _2459;
    }
    float _2461 = _2457;
    float _2463 = _2453 + _2339;
    float _2465 = fma(_2451, -0.5, 0.5);
    bool _2467 = _2455 >= 0.0;
    float _2469 = fma(_2451, 0.5, 0.5);
    float _2471 = _2463 * _2377;
    float _2473 = _1927 * _2373;
    bool _2475 = _2455 <= 1.0;
    bool _2477 = _2475 && _2467;
    float _2479 = sqrt(_2465);
    float _2481 = fma(_1497, _2365, _2473);
    bool _2483 = _2471 >= 0.0;
    bool _2485 = _2483 && _2477;
    float _2487 = fma(_1571, _2389, _2481);
    bool _2489 = _2471 <= 1.0;
    bool _2491 = _2489 && _2485;
    if (!_2085)
    {
        float _2493 = -_2461;
        float _2495 = _1955 + _2493;
        _1997 = _2495;
    }
    float _2497 = _1997;
    float _2499 = _2321 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2501 = fma(_2469, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2503 = _2487 + _2397;
    float _2505 = _2321 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2507 = _2389;
    if (!_2085)
    {
        float _2509 = floor(_1981);
        _2507 = _2509;
    }
    float _2511 = _2507;
    float _2513 = fma(_2469, _2501, -0.212114393711090087890625);
    float _2515 = fma(_2341, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2499);
    float _2517 = fma(_2341, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2505);
    float _2519 = _2401 + 1.0;
    float _2521 = fma(_2469, _2513, 1.570728778839111328125);
    float _2523 = fma(_2127, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2515);
    float _2525 = _2513;
    if (_2491)
    {
        float _2527 = float(_2007);
        _2525 = _2527;
    }
    float _2529 = _2525;
    float _2531 = _2499;
    if (!_2085)
    {
        float _2533 = rint(_2421);
        float _2535 = precise::max(_2533, 0.0);
        uint _2537 = uint(_2535);
        uint _2539 = clamp(_2537, 0u, 65535u);
        _2531 = as_type<float>(_2539);
    }
    float _2541 = _2531;
    float _2543 = fma(_2127, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2517);
    float _2545 = -_2401;
    float _2547 = fma(_2443, _2519, _2545);
    float _2549 = fma(_2353, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2523);
    float _2551 = _2479 * 0.636619746685028076171875;
    float _2553 = fma(_2353, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2543);
    float _2555 = _2503 * _2377;
    float _2557 = _2549 * _2427;
    float _2559 = _2529;
    float _2561 = _2551;
    float _2563 = _2553;
    if (_2491)
    {
        float _2565 = rint(_2529);
        float _2567 = precise::max(_2565, 0.0);
        uint _2569 = uint(_2567);
        uint _2571 = clamp(_2569, 0u, 65535u);
        _2559 = as_type<float>(_2571);
    }
    float _2573 = _2559;
    float _2575 = _2553 * _2427;
    float _2577 = -_2521;
    float _2579 = fma(_2551, _2577, 1.0);
    if (!_2085)
    {
        float _2581 = -_2511;
        float _2583 = _1981 + _2581;
        _2561 = _2583;
    }
    float _2585 = _2561;
    float _2587 = fma(_2557, 0.5, 0.5);
    float _2589 = fma(_2575, -0.5, 0.5);
    float _2591 = fma(_2547, 0.5, 0.5);
    float2 _7026 = float2(_2351, _1973);
    float _2593 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_7026, float2(0.0), isnan(_7026)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_7026, float2(0.0), isnan(_7026)), level(0.0)).x;
    float _2595 = _2541;
    if (!_2085)
    {
        float3 _7043 = float3(_2585, _2497, float(as_type<int>(_2541)));
        float3 _7047 = select(_7043, float3(0.0), isnan(_7043));
        float _2597 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _7047.xy, uint(rint(_7047.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _7047.xy, uint(rint(_7047.z)), level(0.0)).x;
        _2595 = _2597;
    }
    float _2599 = _2595;
    float _2601 = _2573;
    if (_2491)
    {
        float3 _7062 = float3(_2455, _2471, float(as_type<int>(_2573)));
        float3 _7064 = select(_7062, float3(0.0), isnan(_7062));
        float _2603 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _7064.xy, uint(rint(_7064.z)), _2555, level(0.0));
        _2601 = _2603;
    }
    float _2605 = _2601;
    float3 _7074 = float3(_2587, _2589, _2425);
    float _2607 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7074, float3(0.0), isnan(_7074)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7074, float3(0.0), isnan(_7074)), level(0.0)).x;
    float3 _7083 = float3(_2587, _2589, _2425);
    float4 _2609 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7083, float3(0.0), isnan(_7083)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7083, float3(0.0), isnan(_7083)), level(0.0)).xyzw;
    float _2611 = _2609.x;
    float _2613 = _2609.y;
    float _2615 = _2609.z;
    float _2617 = _2609.w;
    float2 _7099 = float2(_2579, _2591);
    float3 _2621 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7099, float2(0.0), isnan(_7099)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7099, float2(0.0), isnan(_7099)), level(0.0)).xyz;
    float _2623 = _2621.x;
    float _2625 = _2621.y;
    float _2627 = _2621.z;
    float _2629 = abs(_1959);
    float _2631 = log2(_2629);
    float _2633 = _2321 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2635 = _2405 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2637 = fma(_2341, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2633);
    float _2639 = exp2(_2635);
    float _2641 = fma(_2127, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2637);
    float _2643 = fma(_2353, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2641);
    float _2645 = _2631 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2647 = _2643 + _2379;
    out.gl_Position.x = _2549;
    out.gl_Position.y = _2553;
    out.gl_Position.z = _2643;
    out.gl_Position.w = _2379;
    float _2649 = _2647 * 0.5;
    float _2651 = exp2(_2645);
    out.m_91.z = _2649;
    out.m_91.w = _2379;
    bool _2653 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2655 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2657 = _2653 || _2655;
    bool _2659 = isnan(0.5);
    bool _2661 = _2657 || _2659;
    float _2663 = fma(_2651, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2665 = precise::clamp(_2663, 0.0, 1.0);
    float _2667 = fma(_2665, -2.0, 3.0);
    float _2669 = _2665 * _2665;
    float _2671 = _2669 * _2667;
    bool _2673 = _1959 <= 8000.0;
    bool _2675 = isnan(_1959);
    bool _2677 = _2673 || _2675;
    bool _2679 = isnan(8000.0);
    bool _2681 = _2677 || _2679;
    float _2683 = float(_2681);
    float _2685 = -_2671;
    float _2687 = _2685 + 1.0;
    float _2689 = fma(_2687, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2671);
    float _2691 = _2683 * _2689;
    float _2693 = _2683;
    if (_2661)
    {
        _2693 = 1.0;
    }
    float _2695 = _2693;
    float _2697 = _2695;
    float _2699 = _2623;
    float _2701 = _2625;
    if (!_2661)
    {
        float _2703 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2705 = _2703 * 0.15915493667125701904296875;
        float _2707 = _2705 * 6.283185482025146484375;
        float _2709 = cos(_2707);
        float _2711 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2713 = _2711 * 0.15915493667125701904296875;
        float _2715 = _2705 * 6.283185482025146484375;
        float _2717 = sin(_2715);
        float _2719 = 1.0 / _2709;
        float _2721 = _2713 * 6.283185482025146484375;
        float _2723 = cos(_2721);
        float _2725 = _2717 * _2719;
        float _2727 = _2713 * 6.283185482025146484375;
        float _2729 = sin(_2727);
        float _2731 = _2723 * _2725;
        float _2733 = 1.0 / _2731;
        float _2735 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2737 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2735;
        float _2739 = 1.0 / _2737;
        float _2741 = _2729 * _2733;
        float _2743 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2745 = fma(_1959, _2741, _2743);
        float _2747 = _2745 * _2739;
        float _2749 = precise::clamp(_2747, 0.0, 1.0);
        _2563 = _2739;
        _2697 = _2749;
    }
    float _2751 = _2563;
    float _2753 = _2697;
    float _2755 = _2691 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2757 = -_2593;
    float _2759 = _2757 + 1.0;
    float _2761 = -_2639;
    float _2763 = _2761 + 1.0;
    float _2765 = _2751;
    float _2767 = _2755;
    if (!_2491)
    {
        _2765 = 1.0;
    }
    float _2769 = _2765;
    float _2771 = _2759 * _2755;
    float _2773 = precise::clamp(_2771, 0.0, 1.0);
    float _2775 = _2769;
    if (_2491)
    {
        bool _2777 = _2605 >= _2555;
        bool _2779 = isnan(_2605);
        bool _2781 = _2777 || _2779;
        bool _2783 = isnan(_2555);
        bool _2785 = _2781 || _2783;
        float _2787 = float(_2785);
        _2775 = _2787;
    }
    float _2789 = _2775;
    float _2791 = _2763 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    if (_2085)
    {
        _2767 = 1.0;
    }
    float _2793 = _2767;
    float _2795 = _2793;
    if (!_2085)
    {
        int _2797 = _2117 << 4;
        int _2799 = _2797 + 2048;
        uint _2801 = uint(int(uint(_2799) >> uint(2)));
        uint _2803 = uint(int(uint(int(_2801)) >> uint(2)));
        int _2805 = int(_2801) & 3;
        float _2807 = (*spvDescriptorSet0.vp_c15)._m0[int(_2803)][_2805];
        int _2809 = int(_2801) + 1;
        uint _2811 = uint(int(uint(_2809) >> uint(2)));
        int _2813 = _2809 & 3;
        float _2815 = (*spvDescriptorSet0.vp_c15)._m0[int(_2811)][_2813];
        int _2817 = _2799 + 8;
        uint _2819 = uint(int(uint(_2817) >> uint(2)));
        uint _2821 = uint(int(uint(int(_2819)) >> uint(2)));
        int _2823 = int(_2819) & 3;
        float _2825 = (*spvDescriptorSet0.vp_c15)._m0[int(_2821)][_2823];
        int _2827 = int(_2819) + 1;
        uint _2829 = uint(int(uint(_2827) >> uint(2)));
        int _2831 = _2827 & 3;
        float _2833 = (*spvDescriptorSet0.vp_c15)._m0[int(_2829)][_2831];
        float _2835 = _1927 * _2815;
        float _2837 = fma(_1497, _2807, _2835);
        float _2839 = fma(_1571, _2825, _2837);
        float _2841 = _2839 + _2833;
        float _2843 = precise::clamp(_2841, 0.0, 1.0);
        float _2845 = -_2843;
        float _2847 = _2845 + _2599;
        float _2849 = fma(_2847, 500.0, 1.5);
        float _2851 = exp2(_2849);
        float _2853 = 0.0 + _2851;
        float _2855 = precise::clamp(_2853, 0.0, 1.0);
        _2795 = _2855;
        _1639 = _2843;
        _1641 = 500.0;
    }
    float _2857 = _2795;
    float _2859 = _1639;
    float _2861 = _1641;
    float _2863 = _2789 * _2857;
    float _2865 = _2791 * _2607;
    float _2867 = -_2773;
    float _2869 = fma(_2867, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2871 = -_2791;
    float _2873 = _2871 + 1.0;
    out.m_93.x = _1871;
    out.m_93.y = _1869;
    out.m_93.z = _1873;
    float _2875 = _2617 * _2865;
    float _2877 = -_2863;
    float _2879 = fma(_2877, _2869, 1.0);
    float _2881 = precise::clamp(_2879, 0.0, 1.0);
    float _2883 = _2627 * _2865;
    float _2885 = _2617 * _2873;
    float _2887 = fma(_2623, _2875, _2611);
    float _2889 = fma(_2625, _2875, _2613);
    float _2891 = _2881 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2893 = fma(_2617, _2883, _2615);
    bool _2895 = _1917 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2897 = isnan(_1917);
    bool _2899 = _2895 || _2897;
    bool _2901 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2903 = _2899 || _2901;
    float _2905 = _2753 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_95.x = _2891;
    out.m_97.x = _2887;
    out.m_97.y = _2889;
    out.m_97.z = _2893;
    out.m_97.w = _2885;
    float _2907 = _2861;
    float _2909 = _2859;
    float _2911 = _2875;
    float _2913 = _2873;
    if (!_2903)
    {
        _2699 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2915 = _2699;
    float _2917 = _2915;
    float _2919 = _2915;
    if (!_2903)
    {
        _2701 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2921 = _2701;
    float _2923 = _2921;
    float _2925 = _2921;
    if (!_2903)
    {
        _2907 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2927 = _2907;
    float _2929 = _2927;
    float _2931 = _2927;
    if (!_2903)
    {
        _2909 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2933 = _2909;
    float _2935 = _2933;
    float _2937 = _2933;
    if (!_2903)
    {
        _2911 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2939 = _2911;
    float _2941 = _2939;
    float _2943 = _2939;
    if (!_2903)
    {
        _2913 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2945 = _2913;
    bool _2947 = !_2903;
    float _2949 = _2945;
    float _2951 = _2945;
    if (!_2947)
    {
        bool _2953 = _1917 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2955 = isnan(_1917);
        bool _2957 = _2953 || _2955;
        bool _2959 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2961 = _2957 || _2959;
        if (!_2961)
        {
            float _2963 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2965 = _1917 + _2963;
            float _2967 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2969 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2967;
            float _2971 = 1.0 / _2969;
            float _2973 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2975 = _2973 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2977 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2979 = _2977 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2981 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2983 = _2981 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2985 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2987 = _2985 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2989 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2991 = _2989 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2993 = _2965 * _2971;
            float _2995 = precise::clamp(_2993, 0.0, 1.0);
            float _2997 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2999 = _2997 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3001 = fma(_2995, _2975, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3003 = fma(_2995, _2999, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3005 = fma(_2995, _2979, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3007 = fma(_2995, _2983, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3009 = fma(_2995, _2987, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3011 = fma(_2995, _2991, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2925 = _3001;
            _2943 = _3009;
            _2919 = _3003;
            _2937 = _3007;
            _2931 = _3005;
            _2951 = _3011;
            _3013 = true;
        }
        else
        {
            bool _3015 = _1917 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3017 = isnan(_1917);
            bool _3019 = _3015 || _3017;
            bool _3021 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3023 = _3019 || _3021;
            if (!_3023)
            {
                _2917 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3025 = _2917;
            _2919 = _3025;
            if (!_3023)
            {
                _2923 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3027 = _2923;
            _2925 = _3027;
            if (!_3023)
            {
                _2929 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3029 = _2929;
            _2931 = _3029;
            if (!_3023)
            {
                _2935 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3031 = _2935;
            _2937 = _3031;
            if (!_3023)
            {
                _2941 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3033 = _2941;
            _2943 = _3033;
            if (!_3023)
            {
                _2949 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3035 = _2949;
            bool _3037 = !_3023;
            _2951 = _3035;
            if (!_3037)
            {
                bool _3039 = _1917 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3041 = isnan(_1917);
                bool _3043 = _3039 || _3041;
                bool _3045 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3047 = _3043 || _3045;
                if (!_3047)
                {
                    float _3049 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3051 = _1917 + _3049;
                    float _3053 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3055 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3053;
                    float _3057 = 1.0 / _3055;
                    float _3059 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3061 = _3059 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3063 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3065 = _3063 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3067 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3069 = _3067 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3071 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3073 = _3071 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3075 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3077 = _3075 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3079 = _3051 * _3057;
                    float _3081 = precise::clamp(_3079, 0.0, 1.0);
                    float _3083 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3085 = _3083 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3087 = fma(_3081, _3061, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3089 = fma(_3081, _3085, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3091 = fma(_3081, _3065, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3093 = fma(_3081, _3069, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3095 = fma(_3081, _3073, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3097 = fma(_3081, _3077, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2925 = _3087;
                    _2943 = _3095;
                    _2919 = _3089;
                    _2937 = _3093;
                    _2931 = _3091;
                    _2951 = _3097;
                    _3013 = true;
                }
                else
                {
                    _2925 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2943 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2919 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2937 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2931 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2951 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3013 = false;
    float _3099 = _2925;
    float _3101 = _2943;
    float _3103 = _2919;
    float _3105 = _2937;
    float _3107 = _2931;
    float _3109 = _2951;
    float _3111 = fma(_1771, -0.5, 0.5);
    float _3113 = precise::clamp(_3111, 0.0, 1.0);
    float _3115 = -_3099;
    float _3117 = _3115 + _3101;
    float _3119 = -_3103;
    float _3121 = _3119 + _3105;
    out.m_99.x = 0.0;
    float _3123 = -_3107;
    float _3125 = _3123 + _3109;
    float _3127 = fma(_3113, _3117, _3099);
    out.m_101.x = 0.0;
    float _3129 = fma(_3113, _3121, _3103);
    float _3131 = _3127 * 0.586610972881317138671875;
    bool _3133 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3135 = fma(_3113, _3125, _3107);
    float _3137 = fma(_3129, 0.298911988735198974609375, _3131);
    float _3139 = _2905 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    bool _3141 = _2753 > 0.0;
    bool _3143 = isnan(_2753);
    bool _3145 = _3141 || _3143;
    bool _3147 = isnan(0.0);
    bool _3149 = _3145 || _3147;
    float _3151 = fma(_3135, 0.114477999508380889892578125, _3137);
    out.m_63.x = _3139;
    float _3153 = -_3151;
    float _3155 = _3129 + _3153;
    float _3157 = -_3151;
    float _3159 = _3127 + _3157;
    float _3161 = -_3151;
    float _3163 = _3135 + _3161;
    float _3165 = fma(_3155, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3151);
    float _3167 = fma(_3159, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3151);
    float _3169 = fma(_3163, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3151);
    bool _3171 = !_3133;
    if (!_3171)
    {
        float _3173 = -_1869;
        float _3175 = _3173 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3177 = -_1871;
        float _3179 = _3177 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3181 = -_1873;
        float _3183 = _3181 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3185 = _3175 * _3175;
        float _3187 = fma(_3179, _3179, _3185);
        float _3189 = fma(_3183, _3183, _3187);
        float _3191 = rsqrt(_3189);
        float _3193 = sqrt(_3189);
        float _3195 = _3175 * _3191;
        float _3197 = _3179 * _3191;
        float _3199 = _3183 * _3191;
        float _3201 = -_1937;
        float _3203 = _3201 + _3195;
        float _3205 = -_1931;
        float _3207 = _3205 + _3197;
        float _3209 = -_1933;
        float _3211 = _3209 + _3199;
        float _3213 = _3203 * _3203;
        float _3215 = -_3193;
        float _3217 = _3215 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3219 = fma((*spvDescriptorSet0.vp_c13)._m0[4].y, (*spvDescriptorSet0.vp_c13)._m0[4].y, 0.00999999977648258209228515625);
        float _3221 = precise::clamp(_3219, 0.0, 1.0);
        float _3223 = fma(_3207, _3207, _3213);
        float _3225 = _3217 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3227 = precise::clamp(_3225, 0.0, 1.0);
        float _3229 = _3221 * _3221;
        float _3231 = fma(_3211, _3211, _3223);
        float _3233 = _3229 + (-1.0);
        float _3235 = abs(_3227);
        float _3237 = log2(_3235);
        float _3239 = rsqrt(_3231);
        float _3241 = _3237 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3243 = exp2(_3241);
        float _3245 = _3203 * _3239;
        float _3247 = _3207 * _3239;
        float _3249 = _3211 * _3239;
        float _3251 = _3197 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3253 = _1771 * _3245;
        float _3255 = _1771 * _3195;
        float _3257 = fma(_1769, _3247, _3253);
        float _3259 = fma(_1769, _3197, _3255);
        float _3261 = fma(_1773, _3249, _3257);
        float _3263 = precise::clamp(_3261, 0.0, 1.0);
        float _3265 = fma(_1773, _3199, _3259);
        float _3267 = precise::clamp(_3265, 0.0, 1.0);
        float _3269 = _3263 * _3263;
        float _3271 = fma(_3269, _3233, 1.0);
        float _3273 = -_3195;
        float _3275 = -_3251;
        float _3277 = fma(_3273, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3275);
        float _3279 = _3271 * _3271;
        float _3281 = -_3199;
        float _3283 = fma(_3281, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3277);
        float _3285 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3287 = _3283 + _3285;
        float _3289 = 1.0 / _3279;
        float _3291 = _3287 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3293 = precise::clamp(_3291, 0.0, 1.0);
        float _3295 = _3243 * _3293;
        float _3297 = _3267 * _3295;
        float _3299 = _3297 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3301 = _3229 * _3289;
        float _3303 = _3297 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3305 = _3297 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        float _3307 = _3297 * _3301;
        out.m_99.x = _3299;
        out.m_99.y = _3303;
        out.m_99.z = _3305;
        float _3309 = _3307 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3311 = _3307 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3313 = _3307 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_101.x = _3309;
        out.m_101.y = _3311;
        out.m_101.z = _3313;
    }
    out.m_103.x = _3165;
    out.m_103.y = _3167;
    out.m_103.z = _3169;
    if (_3149)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_63.x = 0.0;
    float _3315 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3315;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

