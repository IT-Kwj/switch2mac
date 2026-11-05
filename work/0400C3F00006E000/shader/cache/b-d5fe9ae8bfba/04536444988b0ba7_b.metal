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
    float4 m_77 [[user(locn0)]];
    float4 m_79 [[user(locn1)]];
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
int _118(thread const int& _8511, thread const int& _8512, constant _10& support_buffer)
{
    float _8515 = as_type<float>(support_buffer._m4);
    int _8517 = _8512 + as_type<int>(_8515);
    int _8519 = 1 + _8517;
    float _8521 = support_buffer._m5[_8519].x;
    float _8523 = abs(_8521);
    bool _8525 = _8523 == 1.0;
    if (_8525)
    {
        return _8511;
    }
    float _8527 = float(_8511);
    float _8529 = _8527 / _8523;
    int _8531 = int(_8529);
    return _8531;
}

static inline __attribute__((always_inline))
int _119(thread const int& _8561, thread const int& _8562, constant _10& support_buffer)
{
    float _8565 = as_type<float>(support_buffer._m4);
    int _8567 = _8562 + as_type<int>(_8565);
    int _8569 = 1 + _8567;
    float _8571 = support_buffer._m5[_8569].x;
    bool _8573 = _8571 == 1.0;
    if (_8573)
    {
        return _8561;
    }
    float _8575 = float(_8561);
    float _8577 = _8575 * _8571;
    int _8579 = int(_8577);
    return _8579;
}

static inline __attribute__((always_inline))
void _116(thread const int& _8195, thread const int& _8196, thread const int& _8197, thread const int& _8198, thread const int& _8199, thread int& _8200, thread int& _8201, thread int& _8202, thread int& _8203, thread int& _8204, thread int& _8205, thread int& _8206, thread float4& gl_Position, thread float& gl_PointSize)
{
    gl_PointSize = 1.0;
    int _8209 = _8199;
    int _8211 = _8196;
    int _8213 = _8198;
    float _8215 = 0.0 + as_type<float>(_8195);
    bool _8217 = _8215 != 0.0;
    bool _8219 = isnan(_8215);
    bool _8221 = _8217 || _8219;
    bool _8223 = isnan(0.0);
    bool _8225 = _8221 || _8223;
    int _8227 = as_type<int>(_8215);
    int _8229 = _8225 ? (-1) : 0;
    if (!_8225)
    {
        float _8231 = as_type<float>(_8195) * 1.0;
        _8209 = as_type<int>(_8231);
    }
    int _8233 = _8209;
    bool _8235 = !_8225;
    int _8237 = _8233;
    int _8239 = _8233;
    if (!_8235)
    {
        bool _8241 = _8215 >= 0.0;
        bool _8243 = isnan(_8215);
        bool _8245 = _8241 || _8243;
        bool _8247 = isnan(0.0);
        bool _8249 = _8245 || _8247;
        _8229 = _8249 ? (-1) : 0;
        if (!_8249)
        {
            _8237 = 2147483647;
        }
        int _8251 = _8237;
        bool _8253 = !_8249;
        int _8255 = _8251;
        _8239 = _8251;
        if (!_8253)
        {
            float _8257 = abs(as_type<float>(_8195));
            float _8259 = 0.0 + _8257;
            bool _8261 = _8259 > as_type<float>(0x7f800000u /* inf */);
            bool _8263 = isnan(_8259);
            bool _8265 = _8261 || _8263;
            bool _8267 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _8269 = _8265 || _8267;
            _8227 = as_type<int>(_8259);
            _8229 = _8269 ? (-1) : 0;
            if (_8269)
            {
                float _8271 = as_type<float>(_8195) + 1.0;
                _8255 = as_type<int>(_8271);
            }
            int _8273 = _8255;
            int _8275 = _8273;
            _8239 = _8273;
            if (!_8269)
            {
                bool _8277 = _8259 != as_type<float>(0x7f800000u /* inf */);
                bool _8279 = isnan(_8259);
                bool _8281 = _8277 || _8279;
                bool _8283 = isnan(as_type<float>(0x7f800000u /* inf */));
                bool _8285 = _8281 || _8283;
                _8229 = _8285 ? (-1) : 0;
                if (!_8285)
                {
                    _8275 = _8195;
                }
                int _8287 = _8275;
                bool _8289 = !_8285;
                _8239 = _8287;
                if (!_8289)
                {
                    float _8291 = as_type<float>(_8195) * 18446744073709551616.0;
                    float _8293 = rsqrt(_8291);
                    float _8295 = _8291 * _8293;
                    float _8297 = _8293 * 0.5;
                    float _8299 = -_8295;
                    float _8301 = 0.0 + _8299;
                    float _8303 = fma(_8297, _8301, 0.5);
                    float _8305 = fma(_8295, _8303, _8295);
                    float _8307 = -_8305;
                    float _8309 = 0.0 + _8307;
                    float _8311 = fma(_8305, _8309, _8291);
                    float _8313 = fma(_8297, _8311, _8305);
                    float _8315 = _8313 * 2.3283064365386962890625e-10;
                    _8227 = as_type<int>(_8313);
                    _8211 = as_type<int>(_8301);
                    _8213 = as_type<int>(_8305);
                    _8239 = as_type<int>(_8315);
                }
            }
        }
    }
    int _8317 = _8227;
    int _8319 = _8211;
    int _8321 = _8213;
    int _8323 = _8239;
    int _8325 = _8229;
    _8200 = _8197;
    _8201 = 0;
    _8202 = _8317;
    _8203 = _8319;
    _8204 = _8321;
    _8205 = _8323;
    _8206 = _8325;
}

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
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
    bool _2981 = false;
    bool _1789 = false;
    bool _1063 = false;
    bool _869 = false;
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
        float _3340 = as_type<float>(_143);
        out.gl_Position.z = _3340;
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
        float _3409 = as_type<float>(_181);
        out.gl_Position.z = _3409;
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
    float _383 = in.m_73.y;
    float _385 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[191].y;
    float _387 = -_385;
    float _389 = _387 + (*spvDescriptorSet0.vp_c9)._m0[191].y;
    float _391 = fma((*spvDescriptorSet0.vp_c10)._m0[2].x, 0.0166666693985462188720703125, _381);
    float _393 = fma(_389, _383, _385);
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
    float _521 = in.m_75.x;
    int _523 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _525 = _523 != 0;
    int _527 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _529 = _527 != 0;
    float _531 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _533 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _531;
    float _535 = 1.0 / _533;
    float _537 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _539 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    bool _541 = _383 > 0.5;
    bool _543 = _541 && _529;
    float _545 = 0.0;
    float _547 = _521;
    if (_525)
    {
        float _549 = in.m_73.x;
        _545 = _549;
    }
    float _551 = _545;
    float _553 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _555 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _557 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _559 = _371 + _557;
    float _561 = _537 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _563 = _539 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _565 = _553 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _567 = _559 * _535;
    out.m_77.x = _561;
    out.m_77.y = _563;
    out.m_77.z = _565;
    out.m_77.w = _555;
    bool _569 = _371 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _571 = isnan(_371);
    bool _573 = _569 || _571;
    bool _575 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _577 = _573 || _575;
    float _579 = float(_577);
    float _581 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _583 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _585 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _587 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _589 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _587;
    bool _591 = _371 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _593 = isnan(_371);
    bool _595 = _591 || _593;
    bool _597 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _599 = _595 || _597;
    float _601 = float(_599);
    float _603 = _581 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _605 = _583 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _607 = _551 > 0.5;
    bool _609 = _607 && _525;
    float _611 = -_579;
    float _613 = _611 + 1.0;
    float _615 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _617 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _615;
    float _619 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _621 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _619;
    float _623 = _585 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _625 = _601 * _613;
    float _627 = fma(_589, _567, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _629 = fma(_617, _567, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _631 = fma(_621, _567, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    int _633 = _496 + 1;
    float _635 = -_601;
    float _637 = _635 + 1.0;
    float _639 = _627 * _625;
    float _641 = _629 * _625;
    out.m_79.x = _603;
    out.m_79.y = _605;
    out.m_79.z = _623;
    float _643 = _631 * _625;
    float _645 = fma(_637, (*spvDescriptorSet0.vp_c9)._m0[143].x, _639);
    float _647 = fma(_637, (*spvDescriptorSet0.vp_c9)._m0[143].y, _641);
    float _649 = in.m_75.y;
    float _651 = fma(_637, (*spvDescriptorSet0.vp_c9)._m0[143].z, _643);
    float _653 = fma(_579, (*spvDescriptorSet0.vp_c9)._m0[144].x, _645);
    float _655 = fma(_579, (*spvDescriptorSet0.vp_c9)._m0[144].y, _647);
    float _657 = fma(_579, (*spvDescriptorSet0.vp_c9)._m0[144].z, _651);
    int _659 = abs(_633);
    float _661 = _603;
    if (_525)
    {
        _661 = _521;
    }
    float _663 = _661;
    float _665 = float(uint(_659));
    uint _667 = uint(int(uint(_633) >> uint(31)));
    float _669 = _663;
    if (_609)
    {
        float _671 = -_663;
        float _673 = _671 + 1.0;
        _669 = _673;
    }
    float _675 = _669;
    float _677 = as_type<float>(_426) * _665;
    int _679 = ~int(_667);
    int _681 = _679 + 1;
    if (_525)
    {
        _547 = _675;
    }
    float _683 = _547;
    float _685 = trunc(_677);
    float _687 = precise::max(_685, 0.0);
    uint _689 = uint(_687);
    float _691 = _649;
    if (_543)
    {
        float _693 = -_649;
        float _695 = _693 + 1.0;
        _691 = _695;
    }
    float _697 = _691;
    float _699 = _697 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _701 = ~int(_689);
    int _703 = _701 + 1;
    int _705 = _703 * _401;
    int _707 = _705 + _659;
    float _709 = float(uint(_707));
    float _711 = as_type<float>(_426) * _709;
    float _713 = in.m_81.x;
    float _715 = in.m_81.y;
    float _717 = in.m_81.z;
    float _719 = trunc(_711);
    float _721 = precise::max(_719, 0.0);
    uint _723 = uint(_721);
    int _725 = int(_689) + int(_723);
    float _727 = _683 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _729 = ~_725;
    int _731 = _729 + 1;
    float _733 = _653 * _713;
    float _735 = _657 * _717;
    float _737 = _655 * _715;
    float _739 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _741 = _731 * _401;
    int _743 = _741 + _659;
    bool _745 = uint(_743) >= uint(_401);
    bool _747 = !_745;
    int _749 = _747 ? 0 : (-1);
    int _751 = ~_725;
    int _753 = _751 + _749;
    int _755 = _753 + 1;
    float _757 = _699 * _739;
    int _759 = _755 * _401;
    int _761 = _759 + _659;
    float _763 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _765 = _761 ^ _681;
    int _767 = ~_681;
    int _769 = _767 + _765;
    int _771 = _769 + 1;
    bool _773 = !_403;
    int _775 = _773 ? _771 : (-1);
    float _777 = _727 * _763;
    uint _779 = as_type<uint>(half2(float2(_519, 0.0)));
    uint _781 = extract_bits(_779, 0u, 8u);
    int _783 = int(_781) & 255;
    uint _785 = extract_bits(_779, 8u, 8u);
    int _787 = int(_785) & 255;
    int _789 = _787 << 8;
    int _791 = _783 | _789;
    bool _793 = _791 >= 32768;
    int _795 = _791 + (-1024);
    int _797 = _795;
    if (_793)
    {
        int _799 = ~_791;
        int _801 = _799 + 33792;
        int _803 = _801 + 1;
        _797 = _803;
    }
    int _805 = _797;
    int _807 = _805 + 30719;
    float _809 = float(_807);
    float _811 = fma(_809, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _813 = abs(_811);
    float _815 = -_813;
    float _817 = _815 + 1.0;
    float _819 = abs(_811);
    float _821 = fma(_819, -0.0187292993068695068359375, 0.074261002242565155029296875);
    bool _823 = _811 < 0.0;
    float _825 = float(_823);
    int _827 = as_type<int>(_817) + (-218103808);
    float _829 = abs(_811);
    float _831 = fma(_829, _821, -0.212114393711090087890625);
    bool _833 = uint(_827) >= 1920991232u;
    float _835 = abs(_811);
    float _837 = fma(_835, _831, 1.570728778839111328125);
    bool _839 = !_833;
    float _865;
    int _867;
    if (!_839)
    {
        int _841 = as_type<int>(_817);
        int _843 = as_type<int>(_817);
        int _845 = 3664;
        int _847 = 0;
        int _849 = 0;
        int _851;
        int _853;
        int _855;
        int _857;
        int _859;
        int _861;
        int _863;
        _116(_841, _843, _845, _847, _849, _851, _853, _855, _857, _859, _861, _863, out.gl_Position, out.gl_PointSize);
        _865 = as_type<float>(_861);
        _867 = _859;
        _869 = true;
    }
    else
    {
        float _871 = rsqrt(_817);
        float _873 = _817 * _871;
        float _875 = _871 * 0.5;
        float _877 = -_873;
        float _879 = 0.0 + _877;
        float _881 = fma(_875, _879, 0.5);
        float _883 = fma(_873, _881, _873);
        float _885 = -_883;
        float _887 = 0.0 + _885;
        float _889 = fma(_883, _887, _817);
        float _891 = fma(_875, _889, _883);
        _865 = _891;
        _867 = 0;
    }
    _869 = false;
    float _893 = _865;
    int _895 = _867;
    int _897 = _775;
    int _899 = 0;
    int _901 = _119(_897, _899, (*spvDescriptorSet0.support_buffer));
    int _903 = _480;
    int _905 = 0;
    int _907 = _119(_903, _905, (*spvDescriptorSet0.support_buffer));
    float4 _909 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_901, _907)), 0).xyzw;
    float _911 = _909.x;
    float _913 = _909.y;
    float _915 = _909.z;
    float _917 = _909.w;
    float _919 = _837 * _893;
    float _921 = _825 * 2.0;
    float _923 = _809 * 3.883221149444580078125;
    float _925 = floor(_405);
    float _927 = -_921;
    float _929 = fma(_919, _927, _919);
    float _931 = _923 * 0.15915493667125701904296875;
    float _933 = fma(_825, 3.1415927410125732421875, _929);
    float _935 = _931 * 6.283185482025146484375;
    float _937 = cos(_935);
    float _939 = _933 * 0.15915493667125701904296875;
    float _941 = _939 * 6.283185482025146484375;
    float _943 = sin(_941);
    float _945 = -_925;
    float _947 = _405 + _945;
    float _949 = _931 * 6.283185482025146484375;
    float _951 = sin(_949);
    float _953 = _943 * _937;
    float _955 = _943 * _951;
    uint _957 = as_type<uint>(half2(float2(_917, 0.0)));
    float _959 = -_513;
    float _961 = _959 + _911;
    float _963 = -_517;
    float _965 = _963 + _915;
    uint _967 = extract_bits(_957, 0u, 8u);
    int _969 = int(_967) & 255;
    uint _971 = extract_bits(_957, 8u, 8u);
    int _973 = int(_971) & 255;
    int _975 = _973 << 8;
    int _977 = _969 | _975;
    float _979 = fma(_947, _961, _513);
    float _981 = fma(_947, _965, _517);
    bool _983 = _977 >= 32768;
    int _985 = _977 + (-1024);
    int _987 = _985;
    if (_983)
    {
        int _989 = ~_977;
        int _991 = _989 + 33792;
        int _993 = _991 + 1;
        _987 = _993;
    }
    int _995 = _987;
    int _997 = _995 + 30719;
    float _999 = float(_997);
    float _1001 = fma(_999, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _1003 = abs(_1001);
    float _1005 = -_1003;
    float _1007 = _1005 + 1.0;
    bool _1009 = _1001 < 0.0;
    float _1011 = float(_1009);
    float _1013 = abs(_1001);
    float _1015 = fma(_1013, -0.0187292993068695068359375, 0.074261002242565155029296875);
    int _1017 = as_type<int>(_1007) + (-218103808);
    float _1019 = abs(_1001);
    float _1021 = fma(_1019, _1015, -0.212114393711090087890625);
    bool _1023 = uint(_1017) >= 1920991232u;
    float _1025 = -_515;
    float _1027 = _1025 + _913;
    float _1029 = abs(_1001);
    float _1031 = fma(_1029, _1021, 1.570728778839111328125);
    float _1033 = fma(_947, _1027, _515);
    bool _1035 = !_1023;
    float _1061;
    if (!_1035)
    {
        int _1037 = as_type<int>(_1007);
        int _1039 = as_type<int>(_961);
        int _1041 = 4560;
        int _1043 = _895;
        int _1045 = as_type<int>(_919);
        int _1047;
        int _1049;
        int _1051;
        int _1053;
        int _1055;
        int _1057;
        int _1059;
        _116(_1037, _1039, _1041, _1043, _1045, _1047, _1049, _1051, _1053, _1055, _1057, _1059, out.gl_Position, out.gl_PointSize);
        _1061 = as_type<float>(_1057);
        _1063 = true;
    }
    else
    {
        float _1065 = rsqrt(_1007);
        float _1067 = _1007 * _1065;
        float _1069 = _1065 * 0.5;
        float _1071 = -_1067;
        float _1073 = 0.0 + _1071;
        float _1075 = fma(_1069, _1073, 0.5);
        float _1077 = fma(_1067, _1075, _1067);
        float _1079 = -_1077;
        float _1081 = 0.0 + _1079;
        float _1083 = fma(_1077, _1081, _1007);
        float _1085 = fma(_1069, _1083, _1077);
        _1061 = _1085;
    }
    _1063 = false;
    float _1087 = _1061;
    float _1089 = in.m_73.x;
    float _1091 = in.m_73.y;
    float _1093 = in.m_73.z;
    float _1095 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1097 = log2(_1095);
    float _1099 = _1031 * _1087;
    int _1101 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1103 = _1101 != 0;
    int _1105 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1107 = _1105 != 0;
    int _1109 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1111 = _1109 != 0;
    float _1113 = _733 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1115 = _737 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1117 = _735 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1119 = _999 * 3.883221149444580078125;
    float _1121 = -_811;
    float _1123 = _1121 + _1001;
    float _1125 = _1119 * 0.15915493667125701904296875;
    float _1127 = _1125 * 6.283185482025146484375;
    float _1129 = sin(_1127);
    float _1131 = _1091 * 2.0;
    float _1133 = _1093 * 2.0;
    float _1135 = _1089 * 2.0;
    float _1137 = _1093 + _1089;
    float _1139 = floor(_1131);
    float _1141 = _1137 + (-1.0);
    float _1143 = floor(_1133);
    bool _1145 = _1139 > 0.0;
    float _1147 = floor(_1135);
    bool _1149 = _1139 >= 0.0;
    bool _1151 = isnan(_1139);
    bool _1153 = _1149 || _1151;
    bool _1155 = isnan(0.0);
    bool _1157 = _1153 || _1155;
    int _1159 = _1157 ? 0 : 1;
    bool _1161 = _1143 > 0.0;
    bool _1163 = _1143 >= 0.0;
    bool _1165 = isnan(_1143);
    bool _1167 = _1163 || _1165;
    bool _1169 = isnan(0.0);
    bool _1171 = _1167 || _1169;
    float _1173 = _1097 * _161;
    int _1175 = ~_1159;
    int _1177 = _1175 + 1;
    int _1179 = _1177 + 1;
    float _1181 = fma(_1141, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    int _1183 = _1171 ? 0 : 1;
    float _1185 = exp2(_1173);
    int _1187 = _1179;
    int _1189 = as_type<int>(_1125);
    if (!_1145)
    {
        int _1191 = ~_1159;
        int _1193 = _1191 + 1;
        _1187 = _1193;
    }
    int _1195 = _1187;
    int _1197 = ~_1183;
    int _1199 = _1197 + 1;
    int _1201 = _1199 + 1;
    float _1203 = in.m_83.x;
    float _1205 = in.m_83.y;
    float _1207 = in.m_83.z;
    int _1209 = _1201;
    if (!_1161)
    {
        int _1211 = ~_1183;
        int _1213 = _1211 + 1;
        _1209 = _1213;
    }
    int _1215 = _1209;
    bool _1217 = !_1103;
    int _1219 = _1217 ? 0 : 1;
    float _1221 = _1091 + _1089;
    bool _1223 = _1147 > 0.0;
    float _1225 = _1089 + (-0.5);
    int _1227 = abs(_1219);
    float _1229 = _1221 + (-1.0);
    bool _1231 = !_1111;
    int _1233 = _1231 ? 0 : 1;
    float _1235 = -_1185;
    float _1237 = _1235 + 1.0;
    bool _1239 = _1147 >= 0.0;
    bool _1241 = isnan(_1147);
    bool _1243 = _1239 || _1241;
    bool _1245 = isnan(0.0);
    bool _1247 = _1243 || _1245;
    float _1249 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1251 = 1.0 + _1249;
    int _1253 = abs(_1233);
    float _1255 = float(_1227);
    float _1257 = 1.0 / _1251;
    float _1259 = float(_1215);
    bool _1261 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1263 = isnan(1.0);
    bool _1265 = _1261 || _1263;
    bool _1267 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1269 = _1265 || _1267;
    float _1271 = _1255 * _1259;
    bool _1273 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1275 = isnan(0.0);
    bool _1277 = _1273 || _1275;
    bool _1279 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1281 = _1277 || _1279;
    float _1283 = float(_1253);
    float _1285 = _1271 * (-2.0);
    float _1287 = float(_1195);
    float _1289 = fma(_1229, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1291 = _1281 ? _1237 : 0.0;
    int _1293 = _1247 ? 0 : 1;
    float _1295 = _1283 * _1287;
    float _1297 = fma(_1285, _1203, _1203);
    float _1299 = fma(_1289, _1285, _1289);
    bool _1301 = !_1107;
    int _1303 = _1301 ? 0 : 1;
    if (_1269)
    {
        float _1305 = _1291 * _1257;
        _165 = _1305;
    }
    float _1307 = _165;
    float _1309 = fma(_1225, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1297);
    float _1311 = _1295 * (-2.0);
    int _1313 = ~_1293;
    int _1315 = _1313 + 1;
    int _1317 = _1315 + 1;
    int _1319 = abs(_1303);
    float _1321 = fma(_1299, _1307, _1309);
    int _1323 = _1317;
    if (!_1223)
    {
        int _1325 = ~_1293;
        int _1327 = _1325 + 1;
        _1323 = _1327;
    }
    int _1329 = _1323;
    float _1331 = _1093 + (-0.5);
    float _1333 = fma(_1311, _1207, _1207);
    float _1335 = float(_1319);
    float _1337 = fma(_1181, _1311, _1181);
    float _1339 = float(_1329);
    float _1341 = _1321 * 0.15915493667125701904296875;
    float _1343 = fma(_1331, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1333);
    float _1345 = in.m_69.x;
    float _1347 = in.m_69.y;
    float _1349 = in.m_69.z;
    float _1351 = _1093 + _1091;
    float _1353 = _1335 * _1339;
    float _1355 = _1091 + (-0.5);
    float _1357 = in.m_60.x;
    float _1359 = in.m_60.y;
    float _1361 = in.m_60.z;
    float _1363 = _1351 + (-1.0);
    float _1365 = _1353 * (-2.0);
    float _1367 = fma(_1337, _1307, _1343);
    float _1369 = _1341 * 6.283185482025146484375;
    float _1371 = sin(_1369);
    float _1373 = fma(_1363, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1375 = fma(_1365, _1205, _1205);
    float _1377 = in.m_71.x;
    float _1379 = in.m_71.y;
    float _1381 = in.m_71.z;
    float _1383 = _1367 * 0.15915493667125701904296875;
    float _1385 = fma(_1373, _1365, _1373);
    float _1387 = fma(_1355, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1375);
    bool _1389 = _1033 != 0.0;
    bool _1391 = isnan(_1033);
    bool _1393 = _1389 || _1391;
    bool _1395 = isnan(0.0);
    bool _1397 = _1393 || _1395;
    float _1399 = _1341 * 6.283185482025146484375;
    float _1401 = cos(_1399);
    float _1403 = fma(_1385, _1307, _1387);
    float _1405 = _1011 * 2.0;
    bool _1407 = _979 == 0.0;
    bool _1409 = !_1397;
    bool _1411 = _1407 && _1409;
    float _1413 = _1403 * 0.15915493667125701904296875;
    float _1415 = -_1405;
    float _1417 = fma(_1099, _1415, _1099);
    float _1419 = _1383 * 6.283185482025146484375;
    float _1421 = sin(_1419);
    float _1423 = fma(_1011, 3.1415927410125732421875, _1417);
    float _1425 = _1347 * _1359;
    bool _1427 = _981 == 0.0;
    bool _1429 = _1427 && _1411;
    float _1431 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1033);
    float _1433 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _981);
    float _1435 = _1383 * 6.283185482025146484375;
    float _1437 = cos(_1435);
    float _1439 = fma(_1345, _1357, _1425);
    float _1441 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _979);
    float _1443 = _1379 * _1359;
    float _1445 = _1115 * _1431;
    float _1447 = fma(_1349, _1361, _1439);
    float _1449 = _1113 * _1441;
    float _1451 = fma(_1377, _1357, _1443);
    float _1453 = _1413 * 6.283185482025146484375;
    float _1455 = sin(_1453);
    float _1457 = _1371 * _1421;
    float _1459 = _1117 * _1433;
    float _1461 = fma(_1381, _1361, _1451);
    float _1463 = _1401 * _1421;
    float _1465 = _1447 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1467 = _1413 * 6.283185482025146484375;
    float _1469 = cos(_1467);
    float _1471 = _1401 * _1437;
    float _1473 = _1371 * _1437;
    float _1475 = fma(_1455, _1457, _1471);
    float _1477 = _1125 * 6.283185482025146484375;
    float _1479 = cos(_1477);
    float _1481 = _1469 * _1421;
    float _1483 = _1469 * _1437;
    float _1485 = _1371 * _1469;
    float _1487 = _1401 * _1469;
    float _1489 = -_1463;
    float _1491 = fma(_1455, _1473, _1489);
    float _1493 = _1475 * _1445;
    float _1495 = -_1473;
    float _1497 = fma(_1455, _1463, _1495);
    float _1499 = _1485 * _1445;
    float _1501 = _1491 * _1445;
    float _1503 = fma(_1481, _1449, _1493);
    float _1505 = fma(_1455, _1471, _1457);
    float _1507 = -_1455;
    float _1509 = fma(_1507, _1449, _1499);
    float _1511 = fma(_1483, _1449, _1501);
    float _1513 = fma(_1497, _1459, _1503);
    float _1515 = _1423 * 0.15915493667125701904296875;
    float _1517 = fma(_1487, _1459, _1509);
    float _1519 = fma(_1505, _1459, _1511);
    float _1521 = _1513 * _321;
    float _1523 = _1513 * _329;
    float _1525 = in.m_67.x;
    float _1527 = in.m_67.y;
    float _1529 = in.m_67.z;
    float _1531 = _1515 * 6.283185482025146484375;
    float _1533 = sin(_1531);
    float _1535 = fma(_1519, _297, _1521);
    float _1537 = fma(_1519, _307, _1523);
    float _1539 = _1461 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1541 = fma(_1517, _333, _1535);
    float _1543 = fma(_1517, _341, _1537);
    float _1545 = _1465 + _1541;
    float _1547 = _1539 + _1543;
    float _1549 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1551 = _1545 + _1549;
    float _1553 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1555 = _1547 + _1553;
    float _1557 = -_953;
    float _1559 = fma(_1533, _1479, _1557);
    float _1561 = _1551 * _1551;
    float _1563 = _1555 * _1555;
    float _1565 = -_955;
    float _1567 = fma(_1533, _1129, _1565);
    float _1569 = fma(_947, _1559, _953);
    float _1571 = _1561 + _1563;
    float _1573 = _1527 * _1359;
    float _1575 = _1513 * _325;
    float _1577 = fma(_947, _1567, _955);
    float _1579 = sqrt(_1571);
    float _1581 = fma(_1525, _1357, _1573);
    float _1583 = fma(_947, _1123, _811);
    float _1585 = fma(_1519, _303, _1575);
    float _1587 = _1569;
    float _1589 = _1583;
    float _1591 = _1577;
    float _1593 = _1525;
    float _1595 = _1561;
    float _1597 = _1563;
    float _1599 = _1545;
    float _1601 = _1547;
    float _1603 = _1529;
    int _1605 = as_type<int>(_1567);
    float _1607 = _1539;
    float _1609 = _1465;
    if (!_1429)
    {
        float _1611 = fma(_979, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1569);
        _1587 = _1611;
    }
    float _1613 = _1587;
    float _1615 = fma(_1529, _1361, _1581);
    if (!_1429)
    {
        float _1617 = fma(_1033, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1583);
        _1589 = _1617;
    }
    float _1619 = _1589;
    float _1621 = fma(_1517, _337, _1585);
    if (!_1429)
    {
        float _1623 = fma(_981, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1577);
        _1591 = _1623;
    }
    float _1625 = _1591;
    float _1627 = _1615 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1629 = _1475 * _1619;
    float _1631 = _1485 * _1619;
    float _1633 = _1491 * _1619;
    float _1635 = fma(_1481, _1613, _1629);
    float _1637 = _1627 + _1621;
    bool _1639 = _1579 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1641 = -_1455;
    float _1643 = fma(_1641, _1613, _1631);
    if (!_1639)
    {
        _1593 = _1637;
    }
    float _1645 = _1593;
    bool _1647 = !_1639;
    float _1649 = _1645;
    if (!_1647)
    {
        float _1651 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1653 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1655 = _1579 + _1653;
        float _1657 = rsqrt(_1571);
        float _1659 = _1655 * _1651;
        float _1661 = _1637 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1663 = _1659 * 0.15915493667125701904296875;
        float _1665 = _1663 * 6.283185482025146484375;
        float _1667 = sin(_1665);
        float _1669 = _1663 * 6.283185482025146484375;
        float _1671 = cos(_1669);
        float _1673 = fma(_1667, _1661, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1675 = _1657 * _1673;
        float _1677 = _1671 + (-1.0);
        float _1679 = _1551 * _1675;
        float _1681 = _1555 * _1675;
        float _1683 = _1677 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1685 = _1679 + (*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1687 = _1679 * _1679;
        float _1689 = _1681 + (*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1691 = fma(_1637, _1671, _1683);
        float _1693 = _1681 * _1681;
        _1649 = _1691;
        _1595 = _1687;
        _1597 = _1693;
        _1599 = _1685;
        _1601 = _1689;
        _1603 = _1663;
    }
    float _1695 = _1649;
    float _1697 = _1595;
    float _1699 = _1597;
    float _1701 = _1599;
    float _1703 = _1601;
    float _1705 = _1603;
    float _1707 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1709 = _1695 + _1707;
    float _1711 = fma(_1483, _1613, _1633);
    float _1713 = fma(_1497, _1625, _1635);
    float _1715 = fma(_1487, _1625, _1643);
    float _1717 = fma(_1709, _1709, _1697);
    float _1719 = fma(_1505, _1625, _1711);
    float _1721 = _1713 * _321;
    float _1723 = _1713 * _325;
    float _1725 = _1717 + _1699;
    float _1727 = _1713 * _329;
    float _1729 = fma(_1719, _297, _1721);
    float _1731 = fma(_1719, _303, _1723);
    out.m_85.x = _777;
    out.m_85.y = _757;
    float _1733 = fma(_1719, _307, _1727);
    float _1735 = sqrt(_1725);
    float _1737 = fma(_1715, _333, _1729);
    float _1739 = fma(_1715, _337, _1731);
    float _1741 = fma(_1715, _341, _1733);
    out.m_87.x = _1737;
    out.m_87.y = _1739;
    out.m_87.z = _1741;
    out.m_89.x = 1.0;
    out.m_89.y = 1.0;
    out.m_89.z = 1.0;
    bool _1743 = _1735 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1745 = isnan(_1735);
    bool _1747 = _1743 || _1745;
    bool _1749 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1751 = _1747 || _1749;
    float _1753 = _1705;
    if (!_1751)
    {
        _1753 = 1.0;
    }
    float _1755 = _1753;
    bool _1757 = !_1751;
    float _1759 = _1755;
    if (!_1757)
    {
        bool _1761 = _1735 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1763 = isnan(_1735);
        bool _1765 = _1761 || _1763;
        bool _1767 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1769 = _1765 || _1767;
        if (!_1769)
        {
            float _1771 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1773 = _1735 + _1771;
            float _1775 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1777 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1775;
            float _1779 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1781 = _1779 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1783 = 1.0 / _1777;
            float _1785 = _1773 * _1783;
            float _1787 = fma(_1785, _1781, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1759 = _1787;
            _1789 = true;
        }
        else
        {
            bool _1791 = _1735 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1793 = isnan(_1735);
            bool _1795 = _1791 || _1793;
            bool _1797 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1799 = _1795 || _1797;
            if (!_1799)
            {
                float _1801 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1803 = _1735 + _1801;
                float _1805 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1807 = _1805 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1809 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1811 = _1809 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1813 = 1.0 / _1807;
                float _1815 = _1803 * _1813;
                float _1817 = fma(_1815, _1811, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1759 = _1817;
                _1789 = true;
            }
            else
            {
                _1759 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1789 = false;
    float _1819 = _1759;
    float _1821 = _1627 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1823 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1825 = _1695 + _1823;
    float _1827 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1829 = _1701 + _1827;
    float _1831 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1833 = _1703 + _1831;
    float _1835 = fma(_1465, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1821);
    float _1837 = fma(_1825, _1819, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1839 = fma(_1829, _1819, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1841 = fma(_1833, _1819, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1843 = fma(_1539, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1835);
    float _1845 = _1627 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1847 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1849 = _1837 + _1847;
    float _1851 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1853 = _1839 + _1851;
    float _1855 = _1843 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1857 = fma(_1465, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1845);
    float _1859 = _1849 * _1849;
    float _1861 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1863 = _1841 + _1861;
    float _1865 = 1.0 / _1855;
    float _1867 = fma(_1539, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1857);
    float _1869 = fma(_1853, _1853, _1859);
    float _1871 = _1837 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1873 = _1867 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1875 = fma(_1863, _1863, _1869);
    float _1877 = _1873 + _1855;
    float _1879 = rsqrt(_1875);
    float _1881 = _1877 * _1865;
    float _1883 = _1881 * 0.5;
    float _1885 = sqrt(_1875);
    float _1887 = fma(_1539, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1889 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1891 = fma(_1883, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1889);
    float _1893 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _1895 = _1627 + _1893;
    float _1897 = 1.0 / _1891;
    float _1899 = _1853 * _1879;
    float _1901 = _1863 * _1879;
    float _1903 = _1895 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1905 = _1849 * _1879;
    float _1907 = _1899 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1909 = _1901 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1911 = fma(_1465, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1903);
    float _1913 = floor(_1887);
    float _1915 = _1907 * _1907;
    float _1917 = _1909 * _1909;
    float _1919 = fma(_1539, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1911);
    float _1921 = _1915 + _1917;
    float _1923 = _1919 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _1925 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1927 = _1897 * _1925;
    float _1929 = _1895 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1931 = sqrt(_1921);
    bool _1933 = _1927 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _1935 = fma(_1465, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1929);
    bool _1937 = _1927 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _1939 = -_1913;
    float _1941 = _1887 + _1939;
    float _1943 = fma(_1539, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1935);
    float _1945 = trunc(_1923);
    int _1947 = int(_1945);
    float _1949 = _1943 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    bool _1951 = !_1933;
    int _1953 = _1951 ? 0 : 1;
    int _1955 = 2;
    float _1957 = _1907;
    float _1959 = _1909;
    float _1961 = _1915;
    float _1963 = _1917;
    float _1965 = _1887;
    if (!_1933)
    {
        _1955 = 1;
    }
    int _1967 = _1955;
    float _1969 = trunc(_1949);
    int _1971 = int(_1969);
    int _1973 = _1967;
    if (!_1937)
    {
        _1973 = _1953;
    }
    int _1975 = _1973;
    bool _1977 = _1931 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1979 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1981 = _1931 + _1979;
    int _1983 = _1975 << 6;
    int _1985 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1987 = _1947 + _1985;
    int _1989 = _1987 + 1;
    int _1991 = _1983 + 96;
    uint _1993 = uint(int(uint(_1991) >> uint(2)));
    uint _1995 = uint(int(uint(int(_1993)) >> uint(2)));
    int _1997 = int(_1993) & 3;
    float _1999 = (*spvDescriptorSet0.vp_c15)._m0[int(_1995)][_1997];
    int _2001 = int(_1993) + 1;
    uint _2003 = uint(int(uint(_2001) >> uint(2)));
    int _2005 = _2001 & 3;
    float _2007 = (*spvDescriptorSet0.vp_c15)._m0[int(_2003)][_2005];
    float _2009 = _321;
    float _2011 = _1981;
    int _2013 = _1989;
    if (_1977)
    {
        float _2015 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2009 = _2015;
    }
    float _2017 = _2009;
    int _2019 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _2021 = _1971 + _2019;
    int _2023 = _2021 + 1;
    int _2025 = _1983 + 104;
    uint _2027 = uint(int(uint(_2025) >> uint(2)));
    uint _2029 = uint(int(uint(int(_2027)) >> uint(2)));
    int _2031 = int(_2027) & 3;
    float _2033 = (*spvDescriptorSet0.vp_c15)._m0[int(_2029)][_2031];
    int _2035 = int(_2027) + 1;
    uint _2037 = uint(int(uint(_2035) >> uint(2)));
    int _2039 = _2035 & 3;
    float _2041 = (*spvDescriptorSet0.vp_c15)._m0[int(_2037)][_2039];
    bool _2043 = _2023 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _2045 = _2023 | _1989;
    bool _2047 = _2045 < 0;
    bool _2049 = _2047 || _2043;
    bool _2051 = _1989 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _2053 = _2051 || _2049;
    if (_1977)
    {
        float _2055 = _1981 * _2017;
        _2011 = _2055;
    }
    float _2057 = _2011;
    if (_1977)
    {
        float _2059 = _2057 * 0.15915493667125701904296875;
        _299 = _2059;
    }
    float _2061 = _299;
    float _2063 = _1837 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2065 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2067 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2069 = _1731;
    if (_1977)
    {
        float _2071 = _2061 * 6.283185482025146484375;
        float _2073 = sin(_2071);
        _2069 = _2073;
    }
    float _2075 = _2069;
    float _2077 = fma(_1839, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2063);
    float _2079 = precise::max(0.0, _2065);
    if (!_2053)
    {
        int _2081 = _1989 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _2083 = _2081 + _2023;
        _2013 = _2083;
    }
    int _2085 = _2013;
    float _2087 = fma(_1841, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2077);
    float _2089 = -_1905;
    float _2091 = -_2079;
    float _2093 = fma(_2089, (*spvDescriptorSet0.vp_c15)._m0[24].y, _2091);
    float _2095 = _2087 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2097 = _307;
    float _2099 = _2093;
    if (_1977)
    {
        float _2101 = _2061 * 6.283185482025146484375;
        float _2103 = cos(_2101);
        _2097 = _2103;
    }
    float _2105 = _2097;
    if (!_2053)
    {
        int _2107 = _2085 << 2;
        _1605 = _2107;
    }
    int _2109 = _1605;
    float _2111 = _2095 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    int _2113 = _2109;
    if (!_2053)
    {
        uint _2115 = uint(int(uint(_2085) >> uint(2)));
        _1189 = int(_2115);
    }
    int _2117 = _1189;
    if (!_2053)
    {
        int _2119 = 12 & _2109;
        _2113 = _2119;
    }
    int _2121 = _2113;
    float _2123 = _1895 * _2007;
    float _2125 = _2087;
    float _2127 = _2007;
    int _2129 = _2121;
    float _2131 = _2123;
    if (_1977)
    {
        float _2133 = rsqrt(_1921);
        _2125 = _2133;
    }
    float _2135 = _2125;
    if (_1977)
    {
        float _2137 = _2093 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2127 = _2137;
    }
    float _2139 = _2127;
    float _2141 = -_2111;
    float _2143 = fma(_2141, _2067, 1.0);
    float _2145 = fma(_1465, _1999, _2123);
    if (!_2053)
    {
        int _2147 = _2117 << 4;
        int _2149 = _2147 + _2121;
        _2129 = _2149;
    }
    int _2151 = _2129;
    float _2153 = _2075;
    if (_1977)
    {
        float _2155 = fma(_2075, _2139, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2153 = _2155;
    }
    float _2157 = _2153;
    float _2159 = _1837 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    if (_1977)
    {
        float _2161 = _2105 + (-1.0);
        _2131 = _2161;
    }
    float _2163 = _2131;
    float _2165 = fma(_1539, _2033, _2145);
    float _2167 = log2(_2143);
    float _2169 = _2163;
    if (_1977)
    {
        float _2171 = _2163 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2169 = _2171;
    }
    float _2173 = _2169;
    float _2175 = _2165 + _2041;
    float _2177 = fma(_1465, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2179 = _2135;
    if (_1977)
    {
        float _2181 = _2135 * _2157;
        _2179 = _2181;
    }
    float _2183 = _2179;
    if (_1977)
    {
        float _2185 = fma(_2093, _2105, _2173);
        _2099 = _2185;
    }
    float _2187 = _2099;
    int _2189 = _1983 + 56;
    uint _2191 = uint(int(uint(_2189) >> uint(2)));
    uint _2193 = uint(int(uint(int(_2191)) >> uint(2)));
    int _2195 = int(_2191) & 3;
    float _2197 = (*spvDescriptorSet0.vp_c15)._m0[int(_2193)][_2195];
    int _2199 = int(_2191) + 1;
    uint _2201 = uint(int(uint(_2199) >> uint(2)));
    int _2203 = _2199 & 3;
    float _2205 = (*spvDescriptorSet0.vp_c15)._m0[int(_2201)][_2203];
    float _2207 = floor(_2177);
    if (_1977)
    {
        float _2209 = _1907 * _2183;
        _1957 = _2209;
    }
    float _2211 = _1957;
    if (_1977)
    {
        float _2213 = _1909 * _2183;
        _1959 = _2213;
    }
    float _2215 = _1959;
    if (_1977)
    {
        float _2217 = _2211 * _2211;
        _1961 = _2217;
    }
    float _2219 = _1961;
    if (_1977)
    {
        float _2221 = _2215 * _2215;
        _1963 = _2221;
    }
    float _2223 = _1963;
    int _2225 = _1983 + 48;
    uint _2227 = uint(int(uint(_2225) >> uint(2)));
    uint _2229 = uint(int(uint(int(_2227)) >> uint(2)));
    int _2231 = int(_2227) & 3;
    float _2233 = (*spvDescriptorSet0.vp_c15)._m0[int(_2229)][_2231];
    int _2235 = int(_2227) + 1;
    uint _2237 = uint(int(uint(_2235) >> uint(2)));
    int _2239 = _2235 & 3;
    float _2241 = (*spvDescriptorSet0.vp_c15)._m0[int(_2237)][_2239];
    float _2243 = _2167 * 0.693147182464599609375;
    float _2245 = fma(_2187, _2187, _2219);
    float _2247 = _1837 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2249 = _2245 + _2223;
    float _2251 = fma(_1839, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2247);
    int _2253 = _1983 + 64;
    uint _2255 = uint(int(uint(_2253) >> uint(2)));
    uint _2257 = uint(int(uint(int(_2255)) >> uint(2)));
    int _2259 = int(_2255) & 3;
    float _2261 = (*spvDescriptorSet0.vp_c15)._m0[int(_2257)][_2259];
    int _2263 = int(_2255) + 1;
    uint _2265 = uint(int(uint(_2263) >> uint(2)));
    int _2267 = _2263 & 3;
    float _2269 = (*spvDescriptorSet0.vp_c15)._m0[int(_2265)][_2267];
    float _2271 = fma(_1839, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2159);
    float _2273 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2275 = fma(_1885, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2273);
    float _2277 = precise::clamp(_2275, 0.0, 1.0);
    float _2279 = fma(_1841, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2251);
    float _2281 = fma(_1839, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1871);
    float _2283 = fma(_1841, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2271);
    float _2285 = -_2277;
    float _2287 = _2285 + 1.0;
    float _2289 = _2279 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    int _2291 = _1983 + 72;
    uint _2293 = uint(int(uint(_2291) >> uint(2)));
    uint _2295 = uint(int(uint(int(_2293)) >> uint(2)));
    int _2297 = int(_2293) & 3;
    float _2299 = (*spvDescriptorSet0.vp_c15)._m0[int(_2295)][_2297];
    int _2301 = int(_2293) + 1;
    uint _2303 = uint(int(uint(_2301) >> uint(2)));
    int _2305 = _2301 & 3;
    float _2307 = (*spvDescriptorSet0.vp_c15)._m0[int(_2303)][_2305];
    float _2309 = _2283 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2311 = fma(_1841, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2281);
    float _2313 = _2289 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2315 = rsqrt(_2249);
    float _2317 = -_2207;
    float _2319 = _2177 + _2317;
    float _2321 = _2311 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2323 = fma(_2309, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2313);
    int _2325 = _1983 + 80;
    uint _2327 = uint(int(uint(_2325) >> uint(2)));
    uint _2329 = uint(int(uint(int(_2327)) >> uint(2)));
    int _2331 = int(_2327) & 3;
    float _2333 = (*spvDescriptorSet0.vp_c15)._m0[int(_2329)][_2331];
    int _2335 = int(_2327) + 1;
    uint _2337 = uint(int(uint(_2335) >> uint(2)));
    int _2339 = _2335 & 3;
    float _2341 = (*spvDescriptorSet0.vp_c15)._m0[int(_2337)][_2339];
    float _2343 = fma(_2095, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2323);
    float _2345 = 1.0 / _2175;
    float _2347 = fma(_2321, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2343);
    int _2349 = _1983 + 88;
    uint _2351 = uint(int(uint(_2349) >> uint(2)));
    uint _2353 = uint(int(uint(int(_2351)) >> uint(2)));
    int _2355 = int(_2351) & 3;
    float _2357 = (*spvDescriptorSet0.vp_c15)._m0[int(_2353)][_2355];
    int _2359 = int(_2351) + 1;
    uint _2361 = uint(int(uint(_2359) >> uint(2)));
    int _2363 = _2359 & 3;
    float _2365 = (*spvDescriptorSet0.vp_c15)._m0[int(_2361)][_2363];
    float _2367 = _2315 * _2211;
    float _2369 = _2315 * _2187;
    float _2371 = abs(_2287);
    float _2373 = log2(_2371);
    float _2375 = _2315 * _2215;
    float _2377 = _2323;
    if (!_2053)
    {
        int _2379 = _2151 + 400;
        uint _2381 = uint(int(uint(_2379) >> uint(2)));
        uint _2383 = uint(int(uint(int(_2381)) >> uint(2)));
        int _2385 = int(_2381) & 3;
        float _2387 = (*spvDescriptorSet0.vp_c15)._m0[int(_2383)][_2385];
        _2377 = _2387;
    }
    float _2389 = _2377;
    float _2391 = _2367 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2393 = _2243 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2395 = 1.0 / _2347;
    float _2397 = _1895 * _2241;
    float _2399 = -_2391;
    float _2401 = fma(_2369, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2399);
    float _2403 = fma(_1465, _2233, _2397);
    float _2405 = _2373 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2407 = _1895 * _2269;
    float _2409 = fma(_1539, _2197, _2403);
    float _2411 = exp2(_2405);
    float _2413 = fma(_1465, _2261, _2407);
    float _2415 = _2409 + _2205;
    float _2417 = -_2375;
    float _2419 = fma(_2417, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2401);
    float _2421 = fma(_1539, _2299, _2413);
    float _2423 = _2415 * _2345;
    float _2425 = _2401;
    if (!_2053)
    {
        float _2427 = floor(_1923);
        _2425 = _2427;
    }
    float _2429 = _2425;
    float _2431 = _2421 + _2307;
    float _2433 = fma(_2419, -0.5, 0.5);
    bool _2435 = _2423 >= 0.0;
    float _2437 = fma(_2419, 0.5, 0.5);
    float _2439 = _2431 * _2345;
    float _2441 = _1895 * _2341;
    bool _2443 = _2423 <= 1.0;
    bool _2445 = _2443 && _2435;
    float _2447 = sqrt(_2433);
    float _2449 = fma(_1465, _2333, _2441);
    bool _2451 = _2439 >= 0.0;
    bool _2453 = _2451 && _2445;
    float _2455 = fma(_1539, _2357, _2449);
    bool _2457 = _2439 <= 1.0;
    bool _2459 = _2457 && _2453;
    if (!_2053)
    {
        float _2461 = -_2429;
        float _2463 = _1923 + _2461;
        _1965 = _2463;
    }
    float _2465 = _1965;
    float _2467 = _2289 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2469 = fma(_2437, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2471 = _2455 + _2365;
    float _2473 = _2289 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2475 = _2357;
    if (!_2053)
    {
        float _2477 = floor(_1949);
        _2475 = _2477;
    }
    float _2479 = _2475;
    float _2481 = fma(_2437, _2469, -0.212114393711090087890625);
    float _2483 = fma(_2309, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2467);
    float _2485 = fma(_2309, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2473);
    float _2487 = _2369 + 1.0;
    float _2489 = fma(_2437, _2481, 1.570728778839111328125);
    float _2491 = fma(_2095, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2483);
    float _2493 = _2481;
    if (_2459)
    {
        float _2495 = float(_1975);
        _2493 = _2495;
    }
    float _2497 = _2493;
    float _2499 = _2467;
    if (!_2053)
    {
        float _2501 = rint(_2389);
        float _2503 = precise::max(_2501, 0.0);
        uint _2505 = uint(_2503);
        uint _2507 = clamp(_2505, 0u, 65535u);
        _2499 = as_type<float>(_2507);
    }
    float _2509 = _2499;
    float _2511 = fma(_2095, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2485);
    float _2513 = -_2369;
    float _2515 = fma(_2411, _2487, _2513);
    float _2517 = fma(_2321, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2491);
    float _2519 = _2447 * 0.636619746685028076171875;
    float _2521 = fma(_2321, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2511);
    float _2523 = _2471 * _2345;
    float _2525 = _2517 * _2395;
    float _2527 = _2497;
    float _2529 = _2519;
    float _2531 = _2521;
    if (_2459)
    {
        float _2533 = rint(_2497);
        float _2535 = precise::max(_2533, 0.0);
        uint _2537 = uint(_2535);
        uint _2539 = clamp(_2537, 0u, 65535u);
        _2527 = as_type<float>(_2539);
    }
    float _2541 = _2527;
    float _2543 = _2521 * _2395;
    float _2545 = -_2489;
    float _2547 = fma(_2519, _2545, 1.0);
    if (!_2053)
    {
        float _2549 = -_2479;
        float _2551 = _1949 + _2549;
        _2529 = _2551;
    }
    float _2553 = _2529;
    float _2555 = fma(_2525, 0.5, 0.5);
    float _2557 = fma(_2543, -0.5, 0.5);
    float _2559 = fma(_2515, 0.5, 0.5);
    float2 _6938 = float2(_2319, _1941);
    float _2561 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6938, float2(0.0), isnan(_6938)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6938, float2(0.0), isnan(_6938)), level(0.0)).x;
    float _2563 = _2509;
    if (!_2053)
    {
        float3 _6955 = float3(_2553, _2465, float(as_type<int>(_2509)));
        float3 _6959 = select(_6955, float3(0.0), isnan(_6955));
        float _2565 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _6959.xy, uint(rint(_6959.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _6959.xy, uint(rint(_6959.z)), level(0.0)).x;
        _2563 = _2565;
    }
    float _2567 = _2563;
    float _2569 = _2541;
    if (_2459)
    {
        float3 _6974 = float3(_2423, _2439, float(as_type<int>(_2541)));
        float3 _6976 = select(_6974, float3(0.0), isnan(_6974));
        float _2571 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _6976.xy, uint(rint(_6976.z)), _2523, level(0.0));
        _2569 = _2571;
    }
    float _2573 = _2569;
    float3 _6986 = float3(_2555, _2557, _2393);
    float _2575 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6986, float3(0.0), isnan(_6986)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6986, float3(0.0), isnan(_6986)), level(0.0)).x;
    float3 _6995 = float3(_2555, _2557, _2393);
    float4 _2577 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6995, float3(0.0), isnan(_6995)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6995, float3(0.0), isnan(_6995)), level(0.0)).xyzw;
    float _2579 = _2577.x;
    float _2581 = _2577.y;
    float _2583 = _2577.z;
    float _2585 = _2577.w;
    float2 _7011 = float2(_2547, _2559);
    float3 _2589 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7011, float2(0.0), isnan(_7011)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7011, float2(0.0), isnan(_7011)), level(0.0)).xyz;
    float _2591 = _2589.x;
    float _2593 = _2589.y;
    float _2595 = _2589.z;
    float _2597 = abs(_1927);
    float _2599 = log2(_2597);
    float _2601 = _2289 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2603 = _2373 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2605 = fma(_2309, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2601);
    float _2607 = exp2(_2603);
    float _2609 = fma(_2095, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2605);
    float _2611 = fma(_2321, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2609);
    float _2613 = _2599 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2615 = _2611 + _2347;
    out.gl_Position.x = _2517;
    out.gl_Position.y = _2521;
    out.gl_Position.z = _2611;
    out.gl_Position.w = _2347;
    float _2617 = _2615 * 0.5;
    float _2619 = exp2(_2613);
    out.m_91.z = _2617;
    out.m_91.w = _2347;
    bool _2621 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2623 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2625 = _2621 || _2623;
    bool _2627 = isnan(0.5);
    bool _2629 = _2625 || _2627;
    float _2631 = fma(_2619, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2633 = precise::clamp(_2631, 0.0, 1.0);
    float _2635 = fma(_2633, -2.0, 3.0);
    float _2637 = _2633 * _2633;
    float _2639 = _2637 * _2635;
    bool _2641 = _1927 <= 8000.0;
    bool _2643 = isnan(_1927);
    bool _2645 = _2641 || _2643;
    bool _2647 = isnan(8000.0);
    bool _2649 = _2645 || _2647;
    float _2651 = float(_2649);
    float _2653 = -_2639;
    float _2655 = _2653 + 1.0;
    float _2657 = fma(_2655, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2639);
    float _2659 = _2651 * _2657;
    float _2661 = _2651;
    if (_2629)
    {
        _2661 = 1.0;
    }
    float _2663 = _2661;
    float _2665 = _2663;
    float _2667 = _2591;
    float _2669 = _2593;
    if (!_2629)
    {
        float _2671 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2673 = _2671 * 0.15915493667125701904296875;
        float _2675 = _2673 * 6.283185482025146484375;
        float _2677 = cos(_2675);
        float _2679 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2681 = _2679 * 0.15915493667125701904296875;
        float _2683 = _2673 * 6.283185482025146484375;
        float _2685 = sin(_2683);
        float _2687 = 1.0 / _2677;
        float _2689 = _2681 * 6.283185482025146484375;
        float _2691 = cos(_2689);
        float _2693 = _2685 * _2687;
        float _2695 = _2681 * 6.283185482025146484375;
        float _2697 = sin(_2695);
        float _2699 = _2691 * _2693;
        float _2701 = 1.0 / _2699;
        float _2703 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2705 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2703;
        float _2707 = 1.0 / _2705;
        float _2709 = _2697 * _2701;
        float _2711 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2713 = fma(_1927, _2709, _2711);
        float _2715 = _2713 * _2707;
        float _2717 = precise::clamp(_2715, 0.0, 1.0);
        _2531 = _2707;
        _2665 = _2717;
    }
    float _2719 = _2531;
    float _2721 = _2665;
    float _2723 = _2659 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2725 = -_2561;
    float _2727 = _2725 + 1.0;
    float _2729 = -_2607;
    float _2731 = _2729 + 1.0;
    float _2733 = _2719;
    float _2735 = _2723;
    if (!_2459)
    {
        _2733 = 1.0;
    }
    float _2737 = _2733;
    float _2739 = _2727 * _2723;
    float _2741 = precise::clamp(_2739, 0.0, 1.0);
    float _2743 = _2737;
    if (_2459)
    {
        bool _2745 = _2573 >= _2523;
        bool _2747 = isnan(_2573);
        bool _2749 = _2745 || _2747;
        bool _2751 = isnan(_2523);
        bool _2753 = _2749 || _2751;
        float _2755 = float(_2753);
        _2743 = _2755;
    }
    float _2757 = _2743;
    float _2759 = _2731 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    if (_2053)
    {
        _2735 = 1.0;
    }
    float _2761 = _2735;
    float _2763 = _2761;
    if (!_2053)
    {
        int _2765 = _2085 << 4;
        int _2767 = _2765 + 2048;
        uint _2769 = uint(int(uint(_2767) >> uint(2)));
        uint _2771 = uint(int(uint(int(_2769)) >> uint(2)));
        int _2773 = int(_2769) & 3;
        float _2775 = (*spvDescriptorSet0.vp_c15)._m0[int(_2771)][_2773];
        int _2777 = int(_2769) + 1;
        uint _2779 = uint(int(uint(_2777) >> uint(2)));
        int _2781 = _2777 & 3;
        float _2783 = (*spvDescriptorSet0.vp_c15)._m0[int(_2779)][_2781];
        int _2785 = _2767 + 8;
        uint _2787 = uint(int(uint(_2785) >> uint(2)));
        uint _2789 = uint(int(uint(int(_2787)) >> uint(2)));
        int _2791 = int(_2787) & 3;
        float _2793 = (*spvDescriptorSet0.vp_c15)._m0[int(_2789)][_2791];
        int _2795 = int(_2787) + 1;
        uint _2797 = uint(int(uint(_2795) >> uint(2)));
        int _2799 = _2795 & 3;
        float _2801 = (*spvDescriptorSet0.vp_c15)._m0[int(_2797)][_2799];
        float _2803 = _1895 * _2783;
        float _2805 = fma(_1465, _2775, _2803);
        float _2807 = fma(_1539, _2793, _2805);
        float _2809 = _2807 + _2801;
        float _2811 = precise::clamp(_2809, 0.0, 1.0);
        float _2813 = -_2811;
        float _2815 = _2813 + _2567;
        float _2817 = fma(_2815, 500.0, 1.5);
        float _2819 = exp2(_2817);
        float _2821 = 0.0 + _2819;
        float _2823 = precise::clamp(_2821, 0.0, 1.0);
        _2763 = _2823;
        _1607 = _2811;
        _1609 = 500.0;
    }
    float _2825 = _2763;
    float _2827 = _1607;
    float _2829 = _1609;
    float _2831 = _2757 * _2825;
    float _2833 = _2759 * _2575;
    float _2835 = -_2741;
    float _2837 = fma(_2835, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2839 = -_2759;
    float _2841 = _2839 + 1.0;
    out.m_93.x = _1839;
    out.m_93.y = _1837;
    out.m_93.z = _1841;
    float _2843 = _2585 * _2833;
    float _2845 = -_2831;
    float _2847 = fma(_2845, _2837, 1.0);
    float _2849 = precise::clamp(_2847, 0.0, 1.0);
    float _2851 = _2595 * _2833;
    float _2853 = _2585 * _2841;
    float _2855 = fma(_2591, _2843, _2579);
    float _2857 = fma(_2593, _2843, _2581);
    float _2859 = _2849 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2861 = fma(_2585, _2851, _2583);
    bool _2863 = _1885 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2865 = isnan(_1885);
    bool _2867 = _2863 || _2865;
    bool _2869 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2871 = _2867 || _2869;
    float _2873 = _2721 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_95.x = _2859;
    out.m_97.x = _2855;
    out.m_97.y = _2857;
    out.m_97.z = _2861;
    out.m_97.w = _2853;
    float _2875 = _2829;
    float _2877 = _2827;
    float _2879 = _2843;
    float _2881 = _2841;
    if (!_2871)
    {
        _2667 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2883 = _2667;
    float _2885 = _2883;
    float _2887 = _2883;
    if (!_2871)
    {
        _2669 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2889 = _2669;
    float _2891 = _2889;
    float _2893 = _2889;
    if (!_2871)
    {
        _2875 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2895 = _2875;
    float _2897 = _2895;
    float _2899 = _2895;
    if (!_2871)
    {
        _2877 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2901 = _2877;
    float _2903 = _2901;
    float _2905 = _2901;
    if (!_2871)
    {
        _2879 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2907 = _2879;
    float _2909 = _2907;
    float _2911 = _2907;
    if (!_2871)
    {
        _2881 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2913 = _2881;
    bool _2915 = !_2871;
    float _2917 = _2913;
    float _2919 = _2913;
    if (!_2915)
    {
        bool _2921 = _1885 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2923 = isnan(_1885);
        bool _2925 = _2921 || _2923;
        bool _2927 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2929 = _2925 || _2927;
        if (!_2929)
        {
            float _2931 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2933 = _1885 + _2931;
            float _2935 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2937 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2935;
            float _2939 = 1.0 / _2937;
            float _2941 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2943 = _2941 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2945 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2947 = _2945 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2949 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2951 = _2949 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2953 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2955 = _2953 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2957 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2959 = _2957 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2961 = _2933 * _2939;
            float _2963 = precise::clamp(_2961, 0.0, 1.0);
            float _2965 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2967 = _2965 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2969 = fma(_2963, _2943, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2971 = fma(_2963, _2967, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2973 = fma(_2963, _2947, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2975 = fma(_2963, _2951, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2977 = fma(_2963, _2955, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2979 = fma(_2963, _2959, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2893 = _2969;
            _2911 = _2977;
            _2887 = _2971;
            _2905 = _2975;
            _2899 = _2973;
            _2919 = _2979;
            _2981 = true;
        }
        else
        {
            bool _2983 = _1885 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2985 = isnan(_1885);
            bool _2987 = _2983 || _2985;
            bool _2989 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2991 = _2987 || _2989;
            if (!_2991)
            {
                _2885 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2993 = _2885;
            _2887 = _2993;
            if (!_2991)
            {
                _2891 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2995 = _2891;
            _2893 = _2995;
            if (!_2991)
            {
                _2897 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2997 = _2897;
            _2899 = _2997;
            if (!_2991)
            {
                _2903 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2999 = _2903;
            _2905 = _2999;
            if (!_2991)
            {
                _2909 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3001 = _2909;
            _2911 = _3001;
            if (!_2991)
            {
                _2917 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3003 = _2917;
            bool _3005 = !_2991;
            _2919 = _3003;
            if (!_3005)
            {
                bool _3007 = _1885 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3009 = isnan(_1885);
                bool _3011 = _3007 || _3009;
                bool _3013 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3015 = _3011 || _3013;
                if (!_3015)
                {
                    float _3017 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3019 = _1885 + _3017;
                    float _3021 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3023 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3021;
                    float _3025 = 1.0 / _3023;
                    float _3027 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3029 = _3027 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3031 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3033 = _3031 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3035 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3037 = _3035 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3039 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3041 = _3039 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3043 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3045 = _3043 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3047 = _3019 * _3025;
                    float _3049 = precise::clamp(_3047, 0.0, 1.0);
                    float _3051 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3053 = _3051 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3055 = fma(_3049, _3029, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3057 = fma(_3049, _3053, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3059 = fma(_3049, _3033, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3061 = fma(_3049, _3037, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3063 = fma(_3049, _3041, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3065 = fma(_3049, _3045, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2893 = _3055;
                    _2911 = _3063;
                    _2887 = _3057;
                    _2905 = _3061;
                    _2899 = _3059;
                    _2919 = _3065;
                    _2981 = true;
                }
                else
                {
                    _2893 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2911 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2887 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2905 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2899 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2919 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2981 = false;
    float _3067 = _2893;
    float _3069 = _2911;
    float _3071 = _2887;
    float _3073 = _2905;
    float _3075 = _2899;
    float _3077 = _2919;
    float _3079 = fma(_1739, -0.5, 0.5);
    float _3081 = precise::clamp(_3079, 0.0, 1.0);
    float _3083 = -_3067;
    float _3085 = _3083 + _3069;
    float _3087 = -_3071;
    float _3089 = _3087 + _3073;
    out.m_99.x = 0.0;
    float _3091 = -_3075;
    float _3093 = _3091 + _3077;
    float _3095 = fma(_3081, _3085, _3067);
    out.m_101.x = 0.0;
    float _3097 = fma(_3081, _3089, _3071);
    float _3099 = _3095 * 0.586610972881317138671875;
    bool _3101 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3103 = fma(_3081, _3093, _3075);
    float _3105 = fma(_3097, 0.298911988735198974609375, _3099);
    float _3107 = _2873 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    bool _3109 = _2721 > 0.0;
    bool _3111 = isnan(_2721);
    bool _3113 = _3109 || _3111;
    bool _3115 = isnan(0.0);
    bool _3117 = _3113 || _3115;
    float _3119 = fma(_3103, 0.114477999508380889892578125, _3105);
    out.m_63.x = _3107;
    float _3121 = -_3119;
    float _3123 = _3097 + _3121;
    float _3125 = -_3119;
    float _3127 = _3095 + _3125;
    float _3129 = -_3119;
    float _3131 = _3103 + _3129;
    float _3133 = fma(_3123, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3119);
    float _3135 = fma(_3127, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3119);
    float _3137 = fma(_3131, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3119);
    bool _3139 = !_3101;
    if (!_3139)
    {
        float _3141 = -_1837;
        float _3143 = _3141 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3145 = -_1839;
        float _3147 = _3145 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3149 = -_1841;
        float _3151 = _3149 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3153 = _3143 * _3143;
        float _3155 = fma(_3147, _3147, _3153);
        float _3157 = fma(_3151, _3151, _3155);
        float _3159 = rsqrt(_3157);
        float _3161 = sqrt(_3157);
        float _3163 = _3143 * _3159;
        float _3165 = _3147 * _3159;
        float _3167 = _3151 * _3159;
        float _3169 = -_1905;
        float _3171 = _3169 + _3163;
        float _3173 = -_1899;
        float _3175 = _3173 + _3165;
        float _3177 = -_1901;
        float _3179 = _3177 + _3167;
        float _3181 = _3171 * _3171;
        float _3183 = -_3161;
        float _3185 = _3183 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3187 = fma((*spvDescriptorSet0.vp_c13)._m0[4].y, (*spvDescriptorSet0.vp_c13)._m0[4].y, 0.00999999977648258209228515625);
        float _3189 = precise::clamp(_3187, 0.0, 1.0);
        float _3191 = fma(_3175, _3175, _3181);
        float _3193 = _3185 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3195 = precise::clamp(_3193, 0.0, 1.0);
        float _3197 = _3189 * _3189;
        float _3199 = fma(_3179, _3179, _3191);
        float _3201 = _3197 + (-1.0);
        float _3203 = abs(_3195);
        float _3205 = log2(_3203);
        float _3207 = rsqrt(_3199);
        float _3209 = _3205 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3211 = exp2(_3209);
        float _3213 = _3171 * _3207;
        float _3215 = _3175 * _3207;
        float _3217 = _3179 * _3207;
        float _3219 = _3165 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3221 = _1739 * _3213;
        float _3223 = _1739 * _3163;
        float _3225 = fma(_1737, _3215, _3221);
        float _3227 = fma(_1737, _3165, _3223);
        float _3229 = fma(_1741, _3217, _3225);
        float _3231 = precise::clamp(_3229, 0.0, 1.0);
        float _3233 = fma(_1741, _3167, _3227);
        float _3235 = precise::clamp(_3233, 0.0, 1.0);
        float _3237 = _3231 * _3231;
        float _3239 = fma(_3237, _3201, 1.0);
        float _3241 = -_3163;
        float _3243 = -_3219;
        float _3245 = fma(_3241, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3243);
        float _3247 = _3239 * _3239;
        float _3249 = -_3167;
        float _3251 = fma(_3249, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3245);
        float _3253 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3255 = _3251 + _3253;
        float _3257 = 1.0 / _3247;
        float _3259 = _3255 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3261 = precise::clamp(_3259, 0.0, 1.0);
        float _3263 = _3211 * _3261;
        float _3265 = _3235 * _3263;
        float _3267 = _3265 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3269 = _3197 * _3257;
        float _3271 = _3265 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3273 = _3265 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        float _3275 = _3265 * _3269;
        out.m_99.x = _3267;
        out.m_99.y = _3271;
        out.m_99.z = _3273;
        float _3277 = _3275 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3279 = _3275 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3281 = _3275 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_101.x = _3277;
        out.m_101.y = _3279;
        out.m_101.z = _3281;
    }
    out.m_103.x = _3133;
    out.m_103.y = _3135;
    out.m_103.z = _3137;
    if (_3117)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_63.x = 0.0;
    float _3283 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3283;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
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
    bool _2981 = false;
    bool _1789 = false;
    bool _1063 = false;
    bool _869 = false;
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
        float _3340 = as_type<float>(_143);
        out.gl_Position.z = _3340;
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
        float _3409 = as_type<float>(_181);
        out.gl_Position.z = _3409;
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
    float _383 = in.m_73.y;
    float _385 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[191].y;
    float _387 = -_385;
    float _389 = _387 + (*spvDescriptorSet0.vp_c9)._m0[191].y;
    float _391 = fma((*spvDescriptorSet0.vp_c10)._m0[2].x, 0.0166666693985462188720703125, _381);
    float _393 = fma(_389, _383, _385);
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
    float _521 = in.m_75.x;
    int _523 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _525 = _523 != 0;
    int _527 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _529 = _527 != 0;
    float _531 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _533 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _531;
    float _535 = 1.0 / _533;
    float _537 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _539 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    bool _541 = _383 > 0.5;
    bool _543 = _541 && _529;
    float _545 = 0.0;
    float _547 = _521;
    if (_525)
    {
        float _549 = in.m_73.x;
        _545 = _549;
    }
    float _551 = _545;
    float _553 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _555 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _557 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _559 = _371 + _557;
    float _561 = _537 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _563 = _539 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _565 = _553 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _567 = _559 * _535;
    out.m_77.x = _561;
    out.m_77.y = _563;
    out.m_77.z = _565;
    out.m_77.w = _555;
    bool _569 = _371 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _571 = isnan(_371);
    bool _573 = _569 || _571;
    bool _575 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _577 = _573 || _575;
    float _579 = float(_577);
    float _581 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _583 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _585 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _587 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _589 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _587;
    bool _591 = _371 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _593 = isnan(_371);
    bool _595 = _591 || _593;
    bool _597 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _599 = _595 || _597;
    float _601 = float(_599);
    float _603 = _581 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _605 = _583 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _607 = _551 > 0.5;
    bool _609 = _607 && _525;
    float _611 = -_579;
    float _613 = _611 + 1.0;
    float _615 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _617 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _615;
    float _619 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _621 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _619;
    float _623 = _585 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _625 = _601 * _613;
    float _627 = fma(_589, _567, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _629 = fma(_617, _567, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _631 = fma(_621, _567, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    int _633 = _496 + 1;
    float _635 = -_601;
    float _637 = _635 + 1.0;
    float _639 = _627 * _625;
    float _641 = _629 * _625;
    out.m_79.x = _603;
    out.m_79.y = _605;
    out.m_79.z = _623;
    float _643 = _631 * _625;
    float _645 = fma(_637, (*spvDescriptorSet0.vp_c9)._m0[143].x, _639);
    float _647 = fma(_637, (*spvDescriptorSet0.vp_c9)._m0[143].y, _641);
    float _649 = in.m_75.y;
    float _651 = fma(_637, (*spvDescriptorSet0.vp_c9)._m0[143].z, _643);
    float _653 = fma(_579, (*spvDescriptorSet0.vp_c9)._m0[144].x, _645);
    float _655 = fma(_579, (*spvDescriptorSet0.vp_c9)._m0[144].y, _647);
    float _657 = fma(_579, (*spvDescriptorSet0.vp_c9)._m0[144].z, _651);
    int _659 = abs(_633);
    float _661 = _603;
    if (_525)
    {
        _661 = _521;
    }
    float _663 = _661;
    float _665 = float(uint(_659));
    uint _667 = uint(int(uint(_633) >> uint(31)));
    float _669 = _663;
    if (_609)
    {
        float _671 = -_663;
        float _673 = _671 + 1.0;
        _669 = _673;
    }
    float _675 = _669;
    float _677 = as_type<float>(_426) * _665;
    int _679 = ~int(_667);
    int _681 = _679 + 1;
    if (_525)
    {
        _547 = _675;
    }
    float _683 = _547;
    float _685 = trunc(_677);
    float _687 = precise::max(_685, 0.0);
    uint _689 = uint(_687);
    float _691 = _649;
    if (_543)
    {
        float _693 = -_649;
        float _695 = _693 + 1.0;
        _691 = _695;
    }
    float _697 = _691;
    float _699 = _697 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _701 = ~int(_689);
    int _703 = _701 + 1;
    int _705 = _703 * _401;
    int _707 = _705 + _659;
    float _709 = float(uint(_707));
    float _711 = as_type<float>(_426) * _709;
    float _713 = in.m_81.x;
    float _715 = in.m_81.y;
    float _717 = in.m_81.z;
    float _719 = trunc(_711);
    float _721 = precise::max(_719, 0.0);
    uint _723 = uint(_721);
    int _725 = int(_689) + int(_723);
    float _727 = _683 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _729 = ~_725;
    int _731 = _729 + 1;
    float _733 = _653 * _713;
    float _735 = _657 * _717;
    float _737 = _655 * _715;
    float _739 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _741 = _731 * _401;
    int _743 = _741 + _659;
    bool _745 = uint(_743) >= uint(_401);
    bool _747 = !_745;
    int _749 = _747 ? 0 : (-1);
    int _751 = ~_725;
    int _753 = _751 + _749;
    int _755 = _753 + 1;
    float _757 = _699 * _739;
    int _759 = _755 * _401;
    int _761 = _759 + _659;
    float _763 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _765 = _761 ^ _681;
    int _767 = ~_681;
    int _769 = _767 + _765;
    int _771 = _769 + 1;
    bool _773 = !_403;
    int _775 = _773 ? _771 : (-1);
    float _777 = _727 * _763;
    uint _779 = as_type<uint>(half2(float2(_519, 0.0)));
    uint _781 = extract_bits(_779, 0u, 8u);
    int _783 = int(_781) & 255;
    uint _785 = extract_bits(_779, 8u, 8u);
    int _787 = int(_785) & 255;
    int _789 = _787 << 8;
    int _791 = _783 | _789;
    bool _793 = _791 >= 32768;
    int _795 = _791 + (-1024);
    int _797 = _795;
    if (_793)
    {
        int _799 = ~_791;
        int _801 = _799 + 33792;
        int _803 = _801 + 1;
        _797 = _803;
    }
    int _805 = _797;
    int _807 = _805 + 30719;
    float _809 = float(_807);
    float _811 = fma(_809, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _813 = abs(_811);
    float _815 = -_813;
    float _817 = _815 + 1.0;
    float _819 = abs(_811);
    float _821 = fma(_819, -0.0187292993068695068359375, 0.074261002242565155029296875);
    bool _823 = _811 < 0.0;
    float _825 = float(_823);
    int _827 = as_type<int>(_817) + (-218103808);
    float _829 = abs(_811);
    float _831 = fma(_829, _821, -0.212114393711090087890625);
    bool _833 = uint(_827) >= 1920991232u;
    float _835 = abs(_811);
    float _837 = fma(_835, _831, 1.570728778839111328125);
    bool _839 = !_833;
    float _865;
    int _867;
    if (!_839)
    {
        int _841 = as_type<int>(_817);
        int _843 = as_type<int>(_817);
        int _845 = 3664;
        int _847 = 0;
        int _849 = 0;
        int _851;
        int _853;
        int _855;
        int _857;
        int _859;
        int _861;
        int _863;
        _116(_841, _843, _845, _847, _849, _851, _853, _855, _857, _859, _861, _863, out.gl_Position, out.gl_PointSize);
        _865 = as_type<float>(_861);
        _867 = _859;
        _869 = true;
    }
    else
    {
        float _871 = rsqrt(_817);
        float _873 = _817 * _871;
        float _875 = _871 * 0.5;
        float _877 = -_873;
        float _879 = 0.0 + _877;
        float _881 = fma(_875, _879, 0.5);
        float _883 = fma(_873, _881, _873);
        float _885 = -_883;
        float _887 = 0.0 + _885;
        float _889 = fma(_883, _887, _817);
        float _891 = fma(_875, _889, _883);
        _865 = _891;
        _867 = 0;
    }
    _869 = false;
    float _893 = _865;
    int _895 = _867;
    int _897 = _775;
    int _899 = 0;
    int _901 = _119(_897, _899, (*spvDescriptorSet0.support_buffer));
    int _903 = _480;
    int _905 = 0;
    int _907 = _119(_903, _905, (*spvDescriptorSet0.support_buffer));
    float4 _909 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_901, _907)), 0).xyzw;
    float _911 = _909.x;
    float _913 = _909.y;
    float _915 = _909.z;
    float _917 = _909.w;
    float _919 = _837 * _893;
    float _921 = _825 * 2.0;
    float _923 = _809 * 3.883221149444580078125;
    float _925 = floor(_405);
    float _927 = -_921;
    float _929 = fma(_919, _927, _919);
    float _931 = _923 * 0.15915493667125701904296875;
    float _933 = fma(_825, 3.1415927410125732421875, _929);
    float _935 = _931 * 6.283185482025146484375;
    float _937 = cos(_935);
    float _939 = _933 * 0.15915493667125701904296875;
    float _941 = _939 * 6.283185482025146484375;
    float _943 = sin(_941);
    float _945 = -_925;
    float _947 = _405 + _945;
    float _949 = _931 * 6.283185482025146484375;
    float _951 = sin(_949);
    float _953 = _943 * _937;
    float _955 = _943 * _951;
    uint _957 = as_type<uint>(half2(float2(_917, 0.0)));
    float _959 = -_513;
    float _961 = _959 + _911;
    float _963 = -_517;
    float _965 = _963 + _915;
    uint _967 = extract_bits(_957, 0u, 8u);
    int _969 = int(_967) & 255;
    uint _971 = extract_bits(_957, 8u, 8u);
    int _973 = int(_971) & 255;
    int _975 = _973 << 8;
    int _977 = _969 | _975;
    float _979 = fma(_947, _961, _513);
    float _981 = fma(_947, _965, _517);
    bool _983 = _977 >= 32768;
    int _985 = _977 + (-1024);
    int _987 = _985;
    if (_983)
    {
        int _989 = ~_977;
        int _991 = _989 + 33792;
        int _993 = _991 + 1;
        _987 = _993;
    }
    int _995 = _987;
    int _997 = _995 + 30719;
    float _999 = float(_997);
    float _1001 = fma(_999, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _1003 = abs(_1001);
    float _1005 = -_1003;
    float _1007 = _1005 + 1.0;
    bool _1009 = _1001 < 0.0;
    float _1011 = float(_1009);
    float _1013 = abs(_1001);
    float _1015 = fma(_1013, -0.0187292993068695068359375, 0.074261002242565155029296875);
    int _1017 = as_type<int>(_1007) + (-218103808);
    float _1019 = abs(_1001);
    float _1021 = fma(_1019, _1015, -0.212114393711090087890625);
    bool _1023 = uint(_1017) >= 1920991232u;
    float _1025 = -_515;
    float _1027 = _1025 + _913;
    float _1029 = abs(_1001);
    float _1031 = fma(_1029, _1021, 1.570728778839111328125);
    float _1033 = fma(_947, _1027, _515);
    bool _1035 = !_1023;
    float _1061;
    if (!_1035)
    {
        int _1037 = as_type<int>(_1007);
        int _1039 = as_type<int>(_961);
        int _1041 = 4560;
        int _1043 = _895;
        int _1045 = as_type<int>(_919);
        int _1047;
        int _1049;
        int _1051;
        int _1053;
        int _1055;
        int _1057;
        int _1059;
        _116(_1037, _1039, _1041, _1043, _1045, _1047, _1049, _1051, _1053, _1055, _1057, _1059, out.gl_Position, out.gl_PointSize);
        _1061 = as_type<float>(_1057);
        _1063 = true;
    }
    else
    {
        float _1065 = rsqrt(_1007);
        float _1067 = _1007 * _1065;
        float _1069 = _1065 * 0.5;
        float _1071 = -_1067;
        float _1073 = 0.0 + _1071;
        float _1075 = fma(_1069, _1073, 0.5);
        float _1077 = fma(_1067, _1075, _1067);
        float _1079 = -_1077;
        float _1081 = 0.0 + _1079;
        float _1083 = fma(_1077, _1081, _1007);
        float _1085 = fma(_1069, _1083, _1077);
        _1061 = _1085;
    }
    _1063 = false;
    float _1087 = _1061;
    float _1089 = in.m_73.x;
    float _1091 = in.m_73.y;
    float _1093 = in.m_73.z;
    float _1095 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1097 = log2(_1095);
    float _1099 = _1031 * _1087;
    int _1101 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1103 = _1101 != 0;
    int _1105 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1107 = _1105 != 0;
    int _1109 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1111 = _1109 != 0;
    float _1113 = _733 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1115 = _737 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1117 = _735 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1119 = _999 * 3.883221149444580078125;
    float _1121 = -_811;
    float _1123 = _1121 + _1001;
    float _1125 = _1119 * 0.15915493667125701904296875;
    float _1127 = _1125 * 6.283185482025146484375;
    float _1129 = sin(_1127);
    float _1131 = _1091 * 2.0;
    float _1133 = _1093 * 2.0;
    float _1135 = _1089 * 2.0;
    float _1137 = _1093 + _1089;
    float _1139 = floor(_1131);
    float _1141 = _1137 + (-1.0);
    float _1143 = floor(_1133);
    bool _1145 = _1139 > 0.0;
    float _1147 = floor(_1135);
    bool _1149 = _1139 >= 0.0;
    bool _1151 = isnan(_1139);
    bool _1153 = _1149 || _1151;
    bool _1155 = isnan(0.0);
    bool _1157 = _1153 || _1155;
    int _1159 = _1157 ? 0 : 1;
    bool _1161 = _1143 > 0.0;
    bool _1163 = _1143 >= 0.0;
    bool _1165 = isnan(_1143);
    bool _1167 = _1163 || _1165;
    bool _1169 = isnan(0.0);
    bool _1171 = _1167 || _1169;
    float _1173 = _1097 * _161;
    int _1175 = ~_1159;
    int _1177 = _1175 + 1;
    int _1179 = _1177 + 1;
    float _1181 = fma(_1141, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    int _1183 = _1171 ? 0 : 1;
    float _1185 = exp2(_1173);
    int _1187 = _1179;
    int _1189 = as_type<int>(_1125);
    if (!_1145)
    {
        int _1191 = ~_1159;
        int _1193 = _1191 + 1;
        _1187 = _1193;
    }
    int _1195 = _1187;
    int _1197 = ~_1183;
    int _1199 = _1197 + 1;
    int _1201 = _1199 + 1;
    float _1203 = in.m_83.x;
    float _1205 = in.m_83.y;
    float _1207 = in.m_83.z;
    int _1209 = _1201;
    if (!_1161)
    {
        int _1211 = ~_1183;
        int _1213 = _1211 + 1;
        _1209 = _1213;
    }
    int _1215 = _1209;
    bool _1217 = !_1103;
    int _1219 = _1217 ? 0 : 1;
    float _1221 = _1091 + _1089;
    bool _1223 = _1147 > 0.0;
    float _1225 = _1089 + (-0.5);
    int _1227 = abs(_1219);
    float _1229 = _1221 + (-1.0);
    bool _1231 = !_1111;
    int _1233 = _1231 ? 0 : 1;
    float _1235 = -_1185;
    float _1237 = _1235 + 1.0;
    bool _1239 = _1147 >= 0.0;
    bool _1241 = isnan(_1147);
    bool _1243 = _1239 || _1241;
    bool _1245 = isnan(0.0);
    bool _1247 = _1243 || _1245;
    float _1249 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1251 = 1.0 + _1249;
    int _1253 = abs(_1233);
    float _1255 = float(_1227);
    float _1257 = 1.0 / _1251;
    float _1259 = float(_1215);
    bool _1261 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1263 = isnan(1.0);
    bool _1265 = _1261 || _1263;
    bool _1267 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1269 = _1265 || _1267;
    float _1271 = _1255 * _1259;
    bool _1273 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1275 = isnan(0.0);
    bool _1277 = _1273 || _1275;
    bool _1279 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1281 = _1277 || _1279;
    float _1283 = float(_1253);
    float _1285 = _1271 * (-2.0);
    float _1287 = float(_1195);
    float _1289 = fma(_1229, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1291 = _1281 ? _1237 : 0.0;
    int _1293 = _1247 ? 0 : 1;
    float _1295 = _1283 * _1287;
    float _1297 = fma(_1285, _1203, _1203);
    float _1299 = fma(_1289, _1285, _1289);
    bool _1301 = !_1107;
    int _1303 = _1301 ? 0 : 1;
    if (_1269)
    {
        float _1305 = _1291 * _1257;
        _165 = _1305;
    }
    float _1307 = _165;
    float _1309 = fma(_1225, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1297);
    float _1311 = _1295 * (-2.0);
    int _1313 = ~_1293;
    int _1315 = _1313 + 1;
    int _1317 = _1315 + 1;
    int _1319 = abs(_1303);
    float _1321 = fma(_1299, _1307, _1309);
    int _1323 = _1317;
    if (!_1223)
    {
        int _1325 = ~_1293;
        int _1327 = _1325 + 1;
        _1323 = _1327;
    }
    int _1329 = _1323;
    float _1331 = _1093 + (-0.5);
    float _1333 = fma(_1311, _1207, _1207);
    float _1335 = float(_1319);
    float _1337 = fma(_1181, _1311, _1181);
    float _1339 = float(_1329);
    float _1341 = _1321 * 0.15915493667125701904296875;
    float _1343 = fma(_1331, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1333);
    float _1345 = in.m_69.x;
    float _1347 = in.m_69.y;
    float _1349 = in.m_69.z;
    float _1351 = _1093 + _1091;
    float _1353 = _1335 * _1339;
    float _1355 = _1091 + (-0.5);
    float _1357 = in.m_60.x;
    float _1359 = in.m_60.y;
    float _1361 = in.m_60.z;
    float _1363 = _1351 + (-1.0);
    float _1365 = _1353 * (-2.0);
    float _1367 = fma(_1337, _1307, _1343);
    float _1369 = _1341 * 6.283185482025146484375;
    float _1371 = sin(_1369);
    float _1373 = fma(_1363, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1375 = fma(_1365, _1205, _1205);
    float _1377 = in.m_71.x;
    float _1379 = in.m_71.y;
    float _1381 = in.m_71.z;
    float _1383 = _1367 * 0.15915493667125701904296875;
    float _1385 = fma(_1373, _1365, _1373);
    float _1387 = fma(_1355, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1375);
    bool _1389 = _1033 != 0.0;
    bool _1391 = isnan(_1033);
    bool _1393 = _1389 || _1391;
    bool _1395 = isnan(0.0);
    bool _1397 = _1393 || _1395;
    float _1399 = _1341 * 6.283185482025146484375;
    float _1401 = cos(_1399);
    float _1403 = fma(_1385, _1307, _1387);
    float _1405 = _1011 * 2.0;
    bool _1407 = _979 == 0.0;
    bool _1409 = !_1397;
    bool _1411 = _1407 && _1409;
    float _1413 = _1403 * 0.15915493667125701904296875;
    float _1415 = -_1405;
    float _1417 = fma(_1099, _1415, _1099);
    float _1419 = _1383 * 6.283185482025146484375;
    float _1421 = sin(_1419);
    float _1423 = fma(_1011, 3.1415927410125732421875, _1417);
    float _1425 = _1347 * _1359;
    bool _1427 = _981 == 0.0;
    bool _1429 = _1427 && _1411;
    float _1431 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1033);
    float _1433 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _981);
    float _1435 = _1383 * 6.283185482025146484375;
    float _1437 = cos(_1435);
    float _1439 = fma(_1345, _1357, _1425);
    float _1441 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _979);
    float _1443 = _1379 * _1359;
    float _1445 = _1115 * _1431;
    float _1447 = fma(_1349, _1361, _1439);
    float _1449 = _1113 * _1441;
    float _1451 = fma(_1377, _1357, _1443);
    float _1453 = _1413 * 6.283185482025146484375;
    float _1455 = sin(_1453);
    float _1457 = _1371 * _1421;
    float _1459 = _1117 * _1433;
    float _1461 = fma(_1381, _1361, _1451);
    float _1463 = _1401 * _1421;
    float _1465 = _1447 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1467 = _1413 * 6.283185482025146484375;
    float _1469 = cos(_1467);
    float _1471 = _1401 * _1437;
    float _1473 = _1371 * _1437;
    float _1475 = fma(_1455, _1457, _1471);
    float _1477 = _1125 * 6.283185482025146484375;
    float _1479 = cos(_1477);
    float _1481 = _1469 * _1421;
    float _1483 = _1469 * _1437;
    float _1485 = _1371 * _1469;
    float _1487 = _1401 * _1469;
    float _1489 = -_1463;
    float _1491 = fma(_1455, _1473, _1489);
    float _1493 = _1475 * _1445;
    float _1495 = -_1473;
    float _1497 = fma(_1455, _1463, _1495);
    float _1499 = _1485 * _1445;
    float _1501 = _1491 * _1445;
    float _1503 = fma(_1481, _1449, _1493);
    float _1505 = fma(_1455, _1471, _1457);
    float _1507 = -_1455;
    float _1509 = fma(_1507, _1449, _1499);
    float _1511 = fma(_1483, _1449, _1501);
    float _1513 = fma(_1497, _1459, _1503);
    float _1515 = _1423 * 0.15915493667125701904296875;
    float _1517 = fma(_1487, _1459, _1509);
    float _1519 = fma(_1505, _1459, _1511);
    float _1521 = _1513 * _321;
    float _1523 = _1513 * _329;
    float _1525 = in.m_67.x;
    float _1527 = in.m_67.y;
    float _1529 = in.m_67.z;
    float _1531 = _1515 * 6.283185482025146484375;
    float _1533 = sin(_1531);
    float _1535 = fma(_1519, _297, _1521);
    float _1537 = fma(_1519, _307, _1523);
    float _1539 = _1461 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1541 = fma(_1517, _333, _1535);
    float _1543 = fma(_1517, _341, _1537);
    float _1545 = _1465 + _1541;
    float _1547 = _1539 + _1543;
    float _1549 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1551 = _1545 + _1549;
    float _1553 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1555 = _1547 + _1553;
    float _1557 = -_953;
    float _1559 = fma(_1533, _1479, _1557);
    float _1561 = _1551 * _1551;
    float _1563 = _1555 * _1555;
    float _1565 = -_955;
    float _1567 = fma(_1533, _1129, _1565);
    float _1569 = fma(_947, _1559, _953);
    float _1571 = _1561 + _1563;
    float _1573 = _1527 * _1359;
    float _1575 = _1513 * _325;
    float _1577 = fma(_947, _1567, _955);
    float _1579 = sqrt(_1571);
    float _1581 = fma(_1525, _1357, _1573);
    float _1583 = fma(_947, _1123, _811);
    float _1585 = fma(_1519, _303, _1575);
    float _1587 = _1569;
    float _1589 = _1583;
    float _1591 = _1577;
    float _1593 = _1525;
    float _1595 = _1561;
    float _1597 = _1563;
    float _1599 = _1545;
    float _1601 = _1547;
    float _1603 = _1529;
    int _1605 = as_type<int>(_1567);
    float _1607 = _1539;
    float _1609 = _1465;
    if (!_1429)
    {
        float _1611 = fma(_979, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1569);
        _1587 = _1611;
    }
    float _1613 = _1587;
    float _1615 = fma(_1529, _1361, _1581);
    if (!_1429)
    {
        float _1617 = fma(_1033, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1583);
        _1589 = _1617;
    }
    float _1619 = _1589;
    float _1621 = fma(_1517, _337, _1585);
    if (!_1429)
    {
        float _1623 = fma(_981, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1577);
        _1591 = _1623;
    }
    float _1625 = _1591;
    float _1627 = _1615 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1629 = _1475 * _1619;
    float _1631 = _1485 * _1619;
    float _1633 = _1491 * _1619;
    float _1635 = fma(_1481, _1613, _1629);
    float _1637 = _1627 + _1621;
    bool _1639 = _1579 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1641 = -_1455;
    float _1643 = fma(_1641, _1613, _1631);
    if (!_1639)
    {
        _1593 = _1637;
    }
    float _1645 = _1593;
    bool _1647 = !_1639;
    float _1649 = _1645;
    if (!_1647)
    {
        float _1651 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1653 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1655 = _1579 + _1653;
        float _1657 = rsqrt(_1571);
        float _1659 = _1655 * _1651;
        float _1661 = _1637 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1663 = _1659 * 0.15915493667125701904296875;
        float _1665 = _1663 * 6.283185482025146484375;
        float _1667 = sin(_1665);
        float _1669 = _1663 * 6.283185482025146484375;
        float _1671 = cos(_1669);
        float _1673 = fma(_1667, _1661, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1675 = _1657 * _1673;
        float _1677 = _1671 + (-1.0);
        float _1679 = _1551 * _1675;
        float _1681 = _1555 * _1675;
        float _1683 = _1677 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1685 = _1679 + (*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1687 = _1679 * _1679;
        float _1689 = _1681 + (*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1691 = fma(_1637, _1671, _1683);
        float _1693 = _1681 * _1681;
        _1649 = _1691;
        _1595 = _1687;
        _1597 = _1693;
        _1599 = _1685;
        _1601 = _1689;
        _1603 = _1663;
    }
    float _1695 = _1649;
    float _1697 = _1595;
    float _1699 = _1597;
    float _1701 = _1599;
    float _1703 = _1601;
    float _1705 = _1603;
    float _1707 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1709 = _1695 + _1707;
    float _1711 = fma(_1483, _1613, _1633);
    float _1713 = fma(_1497, _1625, _1635);
    float _1715 = fma(_1487, _1625, _1643);
    float _1717 = fma(_1709, _1709, _1697);
    float _1719 = fma(_1505, _1625, _1711);
    float _1721 = _1713 * _321;
    float _1723 = _1713 * _325;
    float _1725 = _1717 + _1699;
    float _1727 = _1713 * _329;
    float _1729 = fma(_1719, _297, _1721);
    float _1731 = fma(_1719, _303, _1723);
    out.m_85.x = _777;
    out.m_85.y = _757;
    float _1733 = fma(_1719, _307, _1727);
    float _1735 = sqrt(_1725);
    float _1737 = fma(_1715, _333, _1729);
    float _1739 = fma(_1715, _337, _1731);
    float _1741 = fma(_1715, _341, _1733);
    out.m_87.x = _1737;
    out.m_87.y = _1739;
    out.m_87.z = _1741;
    out.m_89.x = 1.0;
    out.m_89.y = 1.0;
    out.m_89.z = 1.0;
    bool _1743 = _1735 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1745 = isnan(_1735);
    bool _1747 = _1743 || _1745;
    bool _1749 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1751 = _1747 || _1749;
    float _1753 = _1705;
    if (!_1751)
    {
        _1753 = 1.0;
    }
    float _1755 = _1753;
    bool _1757 = !_1751;
    float _1759 = _1755;
    if (!_1757)
    {
        bool _1761 = _1735 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1763 = isnan(_1735);
        bool _1765 = _1761 || _1763;
        bool _1767 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1769 = _1765 || _1767;
        if (!_1769)
        {
            float _1771 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1773 = _1735 + _1771;
            float _1775 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1777 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1775;
            float _1779 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1781 = _1779 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1783 = 1.0 / _1777;
            float _1785 = _1773 * _1783;
            float _1787 = fma(_1785, _1781, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1759 = _1787;
            _1789 = true;
        }
        else
        {
            bool _1791 = _1735 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1793 = isnan(_1735);
            bool _1795 = _1791 || _1793;
            bool _1797 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1799 = _1795 || _1797;
            if (!_1799)
            {
                float _1801 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1803 = _1735 + _1801;
                float _1805 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1807 = _1805 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1809 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1811 = _1809 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1813 = 1.0 / _1807;
                float _1815 = _1803 * _1813;
                float _1817 = fma(_1815, _1811, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1759 = _1817;
                _1789 = true;
            }
            else
            {
                _1759 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1789 = false;
    float _1819 = _1759;
    float _1821 = _1627 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1823 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1825 = _1695 + _1823;
    float _1827 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1829 = _1701 + _1827;
    float _1831 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1833 = _1703 + _1831;
    float _1835 = fma(_1465, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1821);
    float _1837 = fma(_1825, _1819, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1839 = fma(_1829, _1819, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1841 = fma(_1833, _1819, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1843 = fma(_1539, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1835);
    float _1845 = _1627 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1847 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1849 = _1837 + _1847;
    float _1851 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1853 = _1839 + _1851;
    float _1855 = _1843 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1857 = fma(_1465, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1845);
    float _1859 = _1849 * _1849;
    float _1861 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1863 = _1841 + _1861;
    float _1865 = 1.0 / _1855;
    float _1867 = fma(_1539, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1857);
    float _1869 = fma(_1853, _1853, _1859);
    float _1871 = _1837 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1873 = _1867 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1875 = fma(_1863, _1863, _1869);
    float _1877 = _1873 + _1855;
    float _1879 = rsqrt(_1875);
    float _1881 = _1877 * _1865;
    float _1883 = _1881 * 0.5;
    float _1885 = sqrt(_1875);
    float _1887 = fma(_1539, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1889 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1891 = fma(_1883, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1889);
    float _1893 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _1895 = _1627 + _1893;
    float _1897 = 1.0 / _1891;
    float _1899 = _1853 * _1879;
    float _1901 = _1863 * _1879;
    float _1903 = _1895 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1905 = _1849 * _1879;
    float _1907 = _1899 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1909 = _1901 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1911 = fma(_1465, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1903);
    float _1913 = floor(_1887);
    float _1915 = _1907 * _1907;
    float _1917 = _1909 * _1909;
    float _1919 = fma(_1539, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1911);
    float _1921 = _1915 + _1917;
    float _1923 = _1919 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _1925 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1927 = _1897 * _1925;
    float _1929 = _1895 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1931 = sqrt(_1921);
    bool _1933 = _1927 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _1935 = fma(_1465, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1929);
    bool _1937 = _1927 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _1939 = -_1913;
    float _1941 = _1887 + _1939;
    float _1943 = fma(_1539, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1935);
    float _1945 = trunc(_1923);
    int _1947 = int(_1945);
    float _1949 = _1943 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    bool _1951 = !_1933;
    int _1953 = _1951 ? 0 : 1;
    int _1955 = 2;
    float _1957 = _1907;
    float _1959 = _1909;
    float _1961 = _1915;
    float _1963 = _1917;
    float _1965 = _1887;
    if (!_1933)
    {
        _1955 = 1;
    }
    int _1967 = _1955;
    float _1969 = trunc(_1949);
    int _1971 = int(_1969);
    int _1973 = _1967;
    if (!_1937)
    {
        _1973 = _1953;
    }
    int _1975 = _1973;
    bool _1977 = _1931 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1979 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1981 = _1931 + _1979;
    int _1983 = _1975 << 6;
    int _1985 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1987 = _1947 + _1985;
    int _1989 = _1987 + 1;
    int _1991 = _1983 + 96;
    uint _1993 = uint(int(uint(_1991) >> uint(2)));
    uint _1995 = uint(int(uint(int(_1993)) >> uint(2)));
    int _1997 = int(_1993) & 3;
    float _1999 = (*spvDescriptorSet0.vp_c15)._m0[int(_1995)][_1997];
    int _2001 = int(_1993) + 1;
    uint _2003 = uint(int(uint(_2001) >> uint(2)));
    int _2005 = _2001 & 3;
    float _2007 = (*spvDescriptorSet0.vp_c15)._m0[int(_2003)][_2005];
    float _2009 = _321;
    float _2011 = _1981;
    int _2013 = _1989;
    if (_1977)
    {
        float _2015 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2009 = _2015;
    }
    float _2017 = _2009;
    int _2019 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _2021 = _1971 + _2019;
    int _2023 = _2021 + 1;
    int _2025 = _1983 + 104;
    uint _2027 = uint(int(uint(_2025) >> uint(2)));
    uint _2029 = uint(int(uint(int(_2027)) >> uint(2)));
    int _2031 = int(_2027) & 3;
    float _2033 = (*spvDescriptorSet0.vp_c15)._m0[int(_2029)][_2031];
    int _2035 = int(_2027) + 1;
    uint _2037 = uint(int(uint(_2035) >> uint(2)));
    int _2039 = _2035 & 3;
    float _2041 = (*spvDescriptorSet0.vp_c15)._m0[int(_2037)][_2039];
    bool _2043 = _2023 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _2045 = _2023 | _1989;
    bool _2047 = _2045 < 0;
    bool _2049 = _2047 || _2043;
    bool _2051 = _1989 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _2053 = _2051 || _2049;
    if (_1977)
    {
        float _2055 = _1981 * _2017;
        _2011 = _2055;
    }
    float _2057 = _2011;
    if (_1977)
    {
        float _2059 = _2057 * 0.15915493667125701904296875;
        _299 = _2059;
    }
    float _2061 = _299;
    float _2063 = _1837 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2065 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2067 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2069 = _1731;
    if (_1977)
    {
        float _2071 = _2061 * 6.283185482025146484375;
        float _2073 = sin(_2071);
        _2069 = _2073;
    }
    float _2075 = _2069;
    float _2077 = fma(_1839, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2063);
    float _2079 = precise::max(0.0, _2065);
    if (!_2053)
    {
        int _2081 = _1989 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _2083 = _2081 + _2023;
        _2013 = _2083;
    }
    int _2085 = _2013;
    float _2087 = fma(_1841, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2077);
    float _2089 = -_1905;
    float _2091 = -_2079;
    float _2093 = fma(_2089, (*spvDescriptorSet0.vp_c15)._m0[24].y, _2091);
    float _2095 = _2087 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2097 = _307;
    float _2099 = _2093;
    if (_1977)
    {
        float _2101 = _2061 * 6.283185482025146484375;
        float _2103 = cos(_2101);
        _2097 = _2103;
    }
    float _2105 = _2097;
    if (!_2053)
    {
        int _2107 = _2085 << 2;
        _1605 = _2107;
    }
    int _2109 = _1605;
    float _2111 = _2095 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    int _2113 = _2109;
    if (!_2053)
    {
        uint _2115 = uint(int(uint(_2085) >> uint(2)));
        _1189 = int(_2115);
    }
    int _2117 = _1189;
    if (!_2053)
    {
        int _2119 = 12 & _2109;
        _2113 = _2119;
    }
    int _2121 = _2113;
    float _2123 = _1895 * _2007;
    float _2125 = _2087;
    float _2127 = _2007;
    int _2129 = _2121;
    float _2131 = _2123;
    if (_1977)
    {
        float _2133 = rsqrt(_1921);
        _2125 = _2133;
    }
    float _2135 = _2125;
    if (_1977)
    {
        float _2137 = _2093 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2127 = _2137;
    }
    float _2139 = _2127;
    float _2141 = -_2111;
    float _2143 = fma(_2141, _2067, 1.0);
    float _2145 = fma(_1465, _1999, _2123);
    if (!_2053)
    {
        int _2147 = _2117 << 4;
        int _2149 = _2147 + _2121;
        _2129 = _2149;
    }
    int _2151 = _2129;
    float _2153 = _2075;
    if (_1977)
    {
        float _2155 = fma(_2075, _2139, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2153 = _2155;
    }
    float _2157 = _2153;
    float _2159 = _1837 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    if (_1977)
    {
        float _2161 = _2105 + (-1.0);
        _2131 = _2161;
    }
    float _2163 = _2131;
    float _2165 = fma(_1539, _2033, _2145);
    float _2167 = log2(_2143);
    float _2169 = _2163;
    if (_1977)
    {
        float _2171 = _2163 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2169 = _2171;
    }
    float _2173 = _2169;
    float _2175 = _2165 + _2041;
    float _2177 = fma(_1465, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2179 = _2135;
    if (_1977)
    {
        float _2181 = _2135 * _2157;
        _2179 = _2181;
    }
    float _2183 = _2179;
    if (_1977)
    {
        float _2185 = fma(_2093, _2105, _2173);
        _2099 = _2185;
    }
    float _2187 = _2099;
    int _2189 = _1983 + 56;
    uint _2191 = uint(int(uint(_2189) >> uint(2)));
    uint _2193 = uint(int(uint(int(_2191)) >> uint(2)));
    int _2195 = int(_2191) & 3;
    float _2197 = (*spvDescriptorSet0.vp_c15)._m0[int(_2193)][_2195];
    int _2199 = int(_2191) + 1;
    uint _2201 = uint(int(uint(_2199) >> uint(2)));
    int _2203 = _2199 & 3;
    float _2205 = (*spvDescriptorSet0.vp_c15)._m0[int(_2201)][_2203];
    float _2207 = floor(_2177);
    if (_1977)
    {
        float _2209 = _1907 * _2183;
        _1957 = _2209;
    }
    float _2211 = _1957;
    if (_1977)
    {
        float _2213 = _1909 * _2183;
        _1959 = _2213;
    }
    float _2215 = _1959;
    if (_1977)
    {
        float _2217 = _2211 * _2211;
        _1961 = _2217;
    }
    float _2219 = _1961;
    if (_1977)
    {
        float _2221 = _2215 * _2215;
        _1963 = _2221;
    }
    float _2223 = _1963;
    int _2225 = _1983 + 48;
    uint _2227 = uint(int(uint(_2225) >> uint(2)));
    uint _2229 = uint(int(uint(int(_2227)) >> uint(2)));
    int _2231 = int(_2227) & 3;
    float _2233 = (*spvDescriptorSet0.vp_c15)._m0[int(_2229)][_2231];
    int _2235 = int(_2227) + 1;
    uint _2237 = uint(int(uint(_2235) >> uint(2)));
    int _2239 = _2235 & 3;
    float _2241 = (*spvDescriptorSet0.vp_c15)._m0[int(_2237)][_2239];
    float _2243 = _2167 * 0.693147182464599609375;
    float _2245 = fma(_2187, _2187, _2219);
    float _2247 = _1837 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2249 = _2245 + _2223;
    float _2251 = fma(_1839, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2247);
    int _2253 = _1983 + 64;
    uint _2255 = uint(int(uint(_2253) >> uint(2)));
    uint _2257 = uint(int(uint(int(_2255)) >> uint(2)));
    int _2259 = int(_2255) & 3;
    float _2261 = (*spvDescriptorSet0.vp_c15)._m0[int(_2257)][_2259];
    int _2263 = int(_2255) + 1;
    uint _2265 = uint(int(uint(_2263) >> uint(2)));
    int _2267 = _2263 & 3;
    float _2269 = (*spvDescriptorSet0.vp_c15)._m0[int(_2265)][_2267];
    float _2271 = fma(_1839, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2159);
    float _2273 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2275 = fma(_1885, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2273);
    float _2277 = precise::clamp(_2275, 0.0, 1.0);
    float _2279 = fma(_1841, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2251);
    float _2281 = fma(_1839, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1871);
    float _2283 = fma(_1841, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2271);
    float _2285 = -_2277;
    float _2287 = _2285 + 1.0;
    float _2289 = _2279 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    int _2291 = _1983 + 72;
    uint _2293 = uint(int(uint(_2291) >> uint(2)));
    uint _2295 = uint(int(uint(int(_2293)) >> uint(2)));
    int _2297 = int(_2293) & 3;
    float _2299 = (*spvDescriptorSet0.vp_c15)._m0[int(_2295)][_2297];
    int _2301 = int(_2293) + 1;
    uint _2303 = uint(int(uint(_2301) >> uint(2)));
    int _2305 = _2301 & 3;
    float _2307 = (*spvDescriptorSet0.vp_c15)._m0[int(_2303)][_2305];
    float _2309 = _2283 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2311 = fma(_1841, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2281);
    float _2313 = _2289 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2315 = rsqrt(_2249);
    float _2317 = -_2207;
    float _2319 = _2177 + _2317;
    float _2321 = _2311 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2323 = fma(_2309, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2313);
    int _2325 = _1983 + 80;
    uint _2327 = uint(int(uint(_2325) >> uint(2)));
    uint _2329 = uint(int(uint(int(_2327)) >> uint(2)));
    int _2331 = int(_2327) & 3;
    float _2333 = (*spvDescriptorSet0.vp_c15)._m0[int(_2329)][_2331];
    int _2335 = int(_2327) + 1;
    uint _2337 = uint(int(uint(_2335) >> uint(2)));
    int _2339 = _2335 & 3;
    float _2341 = (*spvDescriptorSet0.vp_c15)._m0[int(_2337)][_2339];
    float _2343 = fma(_2095, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2323);
    float _2345 = 1.0 / _2175;
    float _2347 = fma(_2321, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2343);
    int _2349 = _1983 + 88;
    uint _2351 = uint(int(uint(_2349) >> uint(2)));
    uint _2353 = uint(int(uint(int(_2351)) >> uint(2)));
    int _2355 = int(_2351) & 3;
    float _2357 = (*spvDescriptorSet0.vp_c15)._m0[int(_2353)][_2355];
    int _2359 = int(_2351) + 1;
    uint _2361 = uint(int(uint(_2359) >> uint(2)));
    int _2363 = _2359 & 3;
    float _2365 = (*spvDescriptorSet0.vp_c15)._m0[int(_2361)][_2363];
    float _2367 = _2315 * _2211;
    float _2369 = _2315 * _2187;
    float _2371 = abs(_2287);
    float _2373 = log2(_2371);
    float _2375 = _2315 * _2215;
    float _2377 = _2323;
    if (!_2053)
    {
        int _2379 = _2151 + 400;
        uint _2381 = uint(int(uint(_2379) >> uint(2)));
        uint _2383 = uint(int(uint(int(_2381)) >> uint(2)));
        int _2385 = int(_2381) & 3;
        float _2387 = (*spvDescriptorSet0.vp_c15)._m0[int(_2383)][_2385];
        _2377 = _2387;
    }
    float _2389 = _2377;
    float _2391 = _2367 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2393 = _2243 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2395 = 1.0 / _2347;
    float _2397 = _1895 * _2241;
    float _2399 = -_2391;
    float _2401 = fma(_2369, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2399);
    float _2403 = fma(_1465, _2233, _2397);
    float _2405 = _2373 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2407 = _1895 * _2269;
    float _2409 = fma(_1539, _2197, _2403);
    float _2411 = exp2(_2405);
    float _2413 = fma(_1465, _2261, _2407);
    float _2415 = _2409 + _2205;
    float _2417 = -_2375;
    float _2419 = fma(_2417, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2401);
    float _2421 = fma(_1539, _2299, _2413);
    float _2423 = _2415 * _2345;
    float _2425 = _2401;
    if (!_2053)
    {
        float _2427 = floor(_1923);
        _2425 = _2427;
    }
    float _2429 = _2425;
    float _2431 = _2421 + _2307;
    float _2433 = fma(_2419, -0.5, 0.5);
    bool _2435 = _2423 >= 0.0;
    float _2437 = fma(_2419, 0.5, 0.5);
    float _2439 = _2431 * _2345;
    float _2441 = _1895 * _2341;
    bool _2443 = _2423 <= 1.0;
    bool _2445 = _2443 && _2435;
    float _2447 = sqrt(_2433);
    float _2449 = fma(_1465, _2333, _2441);
    bool _2451 = _2439 >= 0.0;
    bool _2453 = _2451 && _2445;
    float _2455 = fma(_1539, _2357, _2449);
    bool _2457 = _2439 <= 1.0;
    bool _2459 = _2457 && _2453;
    if (!_2053)
    {
        float _2461 = -_2429;
        float _2463 = _1923 + _2461;
        _1965 = _2463;
    }
    float _2465 = _1965;
    float _2467 = _2289 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2469 = fma(_2437, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2471 = _2455 + _2365;
    float _2473 = _2289 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2475 = _2357;
    if (!_2053)
    {
        float _2477 = floor(_1949);
        _2475 = _2477;
    }
    float _2479 = _2475;
    float _2481 = fma(_2437, _2469, -0.212114393711090087890625);
    float _2483 = fma(_2309, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2467);
    float _2485 = fma(_2309, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2473);
    float _2487 = _2369 + 1.0;
    float _2489 = fma(_2437, _2481, 1.570728778839111328125);
    float _2491 = fma(_2095, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2483);
    float _2493 = _2481;
    if (_2459)
    {
        float _2495 = float(_1975);
        _2493 = _2495;
    }
    float _2497 = _2493;
    float _2499 = _2467;
    if (!_2053)
    {
        float _2501 = rint(_2389);
        float _2503 = precise::max(_2501, 0.0);
        uint _2505 = uint(_2503);
        uint _2507 = clamp(_2505, 0u, 65535u);
        _2499 = as_type<float>(_2507);
    }
    float _2509 = _2499;
    float _2511 = fma(_2095, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2485);
    float _2513 = -_2369;
    float _2515 = fma(_2411, _2487, _2513);
    float _2517 = fma(_2321, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2491);
    float _2519 = _2447 * 0.636619746685028076171875;
    float _2521 = fma(_2321, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2511);
    float _2523 = _2471 * _2345;
    float _2525 = _2517 * _2395;
    float _2527 = _2497;
    float _2529 = _2519;
    float _2531 = _2521;
    if (_2459)
    {
        float _2533 = rint(_2497);
        float _2535 = precise::max(_2533, 0.0);
        uint _2537 = uint(_2535);
        uint _2539 = clamp(_2537, 0u, 65535u);
        _2527 = as_type<float>(_2539);
    }
    float _2541 = _2527;
    float _2543 = _2521 * _2395;
    float _2545 = -_2489;
    float _2547 = fma(_2519, _2545, 1.0);
    if (!_2053)
    {
        float _2549 = -_2479;
        float _2551 = _1949 + _2549;
        _2529 = _2551;
    }
    float _2553 = _2529;
    float _2555 = fma(_2525, 0.5, 0.5);
    float _2557 = fma(_2543, -0.5, 0.5);
    float _2559 = fma(_2515, 0.5, 0.5);
    float2 _6938 = float2(_2319, _1941);
    float _2561 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6938, float2(0.0), isnan(_6938)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6938, float2(0.0), isnan(_6938)), level(0.0)).x;
    float _2563 = _2509;
    if (!_2053)
    {
        float3 _6955 = float3(_2553, _2465, float(as_type<int>(_2509)));
        float3 _6959 = select(_6955, float3(0.0), isnan(_6955));
        float _2565 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _6959.xy, uint(rint(_6959.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _6959.xy, uint(rint(_6959.z)), level(0.0)).x;
        _2563 = _2565;
    }
    float _2567 = _2563;
    float _2569 = _2541;
    if (_2459)
    {
        float3 _6974 = float3(_2423, _2439, float(as_type<int>(_2541)));
        float3 _6976 = select(_6974, float3(0.0), isnan(_6974));
        float _2571 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _6976.xy, uint(rint(_6976.z)), _2523, level(0.0));
        _2569 = _2571;
    }
    float _2573 = _2569;
    float3 _6986 = float3(_2555, _2557, _2393);
    float _2575 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6986, float3(0.0), isnan(_6986)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6986, float3(0.0), isnan(_6986)), level(0.0)).x;
    float3 _6995 = float3(_2555, _2557, _2393);
    float4 _2577 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6995, float3(0.0), isnan(_6995)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6995, float3(0.0), isnan(_6995)), level(0.0)).xyzw;
    float _2579 = _2577.x;
    float _2581 = _2577.y;
    float _2583 = _2577.z;
    float _2585 = _2577.w;
    float2 _7011 = float2(_2547, _2559);
    float3 _2589 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7011, float2(0.0), isnan(_7011)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7011, float2(0.0), isnan(_7011)), level(0.0)).xyz;
    float _2591 = _2589.x;
    float _2593 = _2589.y;
    float _2595 = _2589.z;
    float _2597 = abs(_1927);
    float _2599 = log2(_2597);
    float _2601 = _2289 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2603 = _2373 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2605 = fma(_2309, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2601);
    float _2607 = exp2(_2603);
    float _2609 = fma(_2095, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2605);
    float _2611 = fma(_2321, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2609);
    float _2613 = _2599 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2615 = _2611 + _2347;
    out.gl_Position.x = _2517;
    out.gl_Position.y = _2521;
    out.gl_Position.z = _2611;
    out.gl_Position.w = _2347;
    float _2617 = _2615 * 0.5;
    float _2619 = exp2(_2613);
    out.m_91.z = _2617;
    out.m_91.w = _2347;
    bool _2621 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2623 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2625 = _2621 || _2623;
    bool _2627 = isnan(0.5);
    bool _2629 = _2625 || _2627;
    float _2631 = fma(_2619, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2633 = precise::clamp(_2631, 0.0, 1.0);
    float _2635 = fma(_2633, -2.0, 3.0);
    float _2637 = _2633 * _2633;
    float _2639 = _2637 * _2635;
    bool _2641 = _1927 <= 8000.0;
    bool _2643 = isnan(_1927);
    bool _2645 = _2641 || _2643;
    bool _2647 = isnan(8000.0);
    bool _2649 = _2645 || _2647;
    float _2651 = float(_2649);
    float _2653 = -_2639;
    float _2655 = _2653 + 1.0;
    float _2657 = fma(_2655, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2639);
    float _2659 = _2651 * _2657;
    float _2661 = _2651;
    if (_2629)
    {
        _2661 = 1.0;
    }
    float _2663 = _2661;
    float _2665 = _2663;
    float _2667 = _2591;
    float _2669 = _2593;
    if (!_2629)
    {
        float _2671 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2673 = _2671 * 0.15915493667125701904296875;
        float _2675 = _2673 * 6.283185482025146484375;
        float _2677 = cos(_2675);
        float _2679 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2681 = _2679 * 0.15915493667125701904296875;
        float _2683 = _2673 * 6.283185482025146484375;
        float _2685 = sin(_2683);
        float _2687 = 1.0 / _2677;
        float _2689 = _2681 * 6.283185482025146484375;
        float _2691 = cos(_2689);
        float _2693 = _2685 * _2687;
        float _2695 = _2681 * 6.283185482025146484375;
        float _2697 = sin(_2695);
        float _2699 = _2691 * _2693;
        float _2701 = 1.0 / _2699;
        float _2703 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2705 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2703;
        float _2707 = 1.0 / _2705;
        float _2709 = _2697 * _2701;
        float _2711 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2713 = fma(_1927, _2709, _2711);
        float _2715 = _2713 * _2707;
        float _2717 = precise::clamp(_2715, 0.0, 1.0);
        _2531 = _2707;
        _2665 = _2717;
    }
    float _2719 = _2531;
    float _2721 = _2665;
    float _2723 = _2659 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2725 = -_2561;
    float _2727 = _2725 + 1.0;
    float _2729 = -_2607;
    float _2731 = _2729 + 1.0;
    float _2733 = _2719;
    float _2735 = _2723;
    if (!_2459)
    {
        _2733 = 1.0;
    }
    float _2737 = _2733;
    float _2739 = _2727 * _2723;
    float _2741 = precise::clamp(_2739, 0.0, 1.0);
    float _2743 = _2737;
    if (_2459)
    {
        bool _2745 = _2573 >= _2523;
        bool _2747 = isnan(_2573);
        bool _2749 = _2745 || _2747;
        bool _2751 = isnan(_2523);
        bool _2753 = _2749 || _2751;
        float _2755 = float(_2753);
        _2743 = _2755;
    }
    float _2757 = _2743;
    float _2759 = _2731 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    if (_2053)
    {
        _2735 = 1.0;
    }
    float _2761 = _2735;
    float _2763 = _2761;
    if (!_2053)
    {
        int _2765 = _2085 << 4;
        int _2767 = _2765 + 2048;
        uint _2769 = uint(int(uint(_2767) >> uint(2)));
        uint _2771 = uint(int(uint(int(_2769)) >> uint(2)));
        int _2773 = int(_2769) & 3;
        float _2775 = (*spvDescriptorSet0.vp_c15)._m0[int(_2771)][_2773];
        int _2777 = int(_2769) + 1;
        uint _2779 = uint(int(uint(_2777) >> uint(2)));
        int _2781 = _2777 & 3;
        float _2783 = (*spvDescriptorSet0.vp_c15)._m0[int(_2779)][_2781];
        int _2785 = _2767 + 8;
        uint _2787 = uint(int(uint(_2785) >> uint(2)));
        uint _2789 = uint(int(uint(int(_2787)) >> uint(2)));
        int _2791 = int(_2787) & 3;
        float _2793 = (*spvDescriptorSet0.vp_c15)._m0[int(_2789)][_2791];
        int _2795 = int(_2787) + 1;
        uint _2797 = uint(int(uint(_2795) >> uint(2)));
        int _2799 = _2795 & 3;
        float _2801 = (*spvDescriptorSet0.vp_c15)._m0[int(_2797)][_2799];
        float _2803 = _1895 * _2783;
        float _2805 = fma(_1465, _2775, _2803);
        float _2807 = fma(_1539, _2793, _2805);
        float _2809 = _2807 + _2801;
        float _2811 = precise::clamp(_2809, 0.0, 1.0);
        float _2813 = -_2811;
        float _2815 = _2813 + _2567;
        float _2817 = fma(_2815, 500.0, 1.5);
        float _2819 = exp2(_2817);
        float _2821 = 0.0 + _2819;
        float _2823 = precise::clamp(_2821, 0.0, 1.0);
        _2763 = _2823;
        _1607 = _2811;
        _1609 = 500.0;
    }
    float _2825 = _2763;
    float _2827 = _1607;
    float _2829 = _1609;
    float _2831 = _2757 * _2825;
    float _2833 = _2759 * _2575;
    float _2835 = -_2741;
    float _2837 = fma(_2835, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2839 = -_2759;
    float _2841 = _2839 + 1.0;
    out.m_93.x = _1839;
    out.m_93.y = _1837;
    out.m_93.z = _1841;
    float _2843 = _2585 * _2833;
    float _2845 = -_2831;
    float _2847 = fma(_2845, _2837, 1.0);
    float _2849 = precise::clamp(_2847, 0.0, 1.0);
    float _2851 = _2595 * _2833;
    float _2853 = _2585 * _2841;
    float _2855 = fma(_2591, _2843, _2579);
    float _2857 = fma(_2593, _2843, _2581);
    float _2859 = _2849 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2861 = fma(_2585, _2851, _2583);
    bool _2863 = _1885 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2865 = isnan(_1885);
    bool _2867 = _2863 || _2865;
    bool _2869 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2871 = _2867 || _2869;
    float _2873 = _2721 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_95.x = _2859;
    out.m_97.x = _2855;
    out.m_97.y = _2857;
    out.m_97.z = _2861;
    out.m_97.w = _2853;
    float _2875 = _2829;
    float _2877 = _2827;
    float _2879 = _2843;
    float _2881 = _2841;
    if (!_2871)
    {
        _2667 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2883 = _2667;
    float _2885 = _2883;
    float _2887 = _2883;
    if (!_2871)
    {
        _2669 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2889 = _2669;
    float _2891 = _2889;
    float _2893 = _2889;
    if (!_2871)
    {
        _2875 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2895 = _2875;
    float _2897 = _2895;
    float _2899 = _2895;
    if (!_2871)
    {
        _2877 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2901 = _2877;
    float _2903 = _2901;
    float _2905 = _2901;
    if (!_2871)
    {
        _2879 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2907 = _2879;
    float _2909 = _2907;
    float _2911 = _2907;
    if (!_2871)
    {
        _2881 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2913 = _2881;
    bool _2915 = !_2871;
    float _2917 = _2913;
    float _2919 = _2913;
    if (!_2915)
    {
        bool _2921 = _1885 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2923 = isnan(_1885);
        bool _2925 = _2921 || _2923;
        bool _2927 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2929 = _2925 || _2927;
        if (!_2929)
        {
            float _2931 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2933 = _1885 + _2931;
            float _2935 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2937 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2935;
            float _2939 = 1.0 / _2937;
            float _2941 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2943 = _2941 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2945 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2947 = _2945 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2949 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2951 = _2949 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2953 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2955 = _2953 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2957 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2959 = _2957 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2961 = _2933 * _2939;
            float _2963 = precise::clamp(_2961, 0.0, 1.0);
            float _2965 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2967 = _2965 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2969 = fma(_2963, _2943, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2971 = fma(_2963, _2967, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2973 = fma(_2963, _2947, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2975 = fma(_2963, _2951, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2977 = fma(_2963, _2955, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2979 = fma(_2963, _2959, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2893 = _2969;
            _2911 = _2977;
            _2887 = _2971;
            _2905 = _2975;
            _2899 = _2973;
            _2919 = _2979;
            _2981 = true;
        }
        else
        {
            bool _2983 = _1885 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2985 = isnan(_1885);
            bool _2987 = _2983 || _2985;
            bool _2989 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2991 = _2987 || _2989;
            if (!_2991)
            {
                _2885 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2993 = _2885;
            _2887 = _2993;
            if (!_2991)
            {
                _2891 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2995 = _2891;
            _2893 = _2995;
            if (!_2991)
            {
                _2897 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2997 = _2897;
            _2899 = _2997;
            if (!_2991)
            {
                _2903 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2999 = _2903;
            _2905 = _2999;
            if (!_2991)
            {
                _2909 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3001 = _2909;
            _2911 = _3001;
            if (!_2991)
            {
                _2917 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3003 = _2917;
            bool _3005 = !_2991;
            _2919 = _3003;
            if (!_3005)
            {
                bool _3007 = _1885 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3009 = isnan(_1885);
                bool _3011 = _3007 || _3009;
                bool _3013 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3015 = _3011 || _3013;
                if (!_3015)
                {
                    float _3017 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3019 = _1885 + _3017;
                    float _3021 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3023 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3021;
                    float _3025 = 1.0 / _3023;
                    float _3027 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3029 = _3027 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3031 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3033 = _3031 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3035 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3037 = _3035 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3039 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3041 = _3039 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3043 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3045 = _3043 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3047 = _3019 * _3025;
                    float _3049 = precise::clamp(_3047, 0.0, 1.0);
                    float _3051 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3053 = _3051 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3055 = fma(_3049, _3029, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3057 = fma(_3049, _3053, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3059 = fma(_3049, _3033, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3061 = fma(_3049, _3037, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3063 = fma(_3049, _3041, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3065 = fma(_3049, _3045, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2893 = _3055;
                    _2911 = _3063;
                    _2887 = _3057;
                    _2905 = _3061;
                    _2899 = _3059;
                    _2919 = _3065;
                    _2981 = true;
                }
                else
                {
                    _2893 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2911 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2887 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2905 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2899 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2919 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2981 = false;
    float _3067 = _2893;
    float _3069 = _2911;
    float _3071 = _2887;
    float _3073 = _2905;
    float _3075 = _2899;
    float _3077 = _2919;
    float _3079 = fma(_1739, -0.5, 0.5);
    float _3081 = precise::clamp(_3079, 0.0, 1.0);
    float _3083 = -_3067;
    float _3085 = _3083 + _3069;
    float _3087 = -_3071;
    float _3089 = _3087 + _3073;
    out.m_99.x = 0.0;
    float _3091 = -_3075;
    float _3093 = _3091 + _3077;
    float _3095 = fma(_3081, _3085, _3067);
    out.m_101.x = 0.0;
    float _3097 = fma(_3081, _3089, _3071);
    float _3099 = _3095 * 0.586610972881317138671875;
    bool _3101 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3103 = fma(_3081, _3093, _3075);
    float _3105 = fma(_3097, 0.298911988735198974609375, _3099);
    float _3107 = _2873 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    bool _3109 = _2721 > 0.0;
    bool _3111 = isnan(_2721);
    bool _3113 = _3109 || _3111;
    bool _3115 = isnan(0.0);
    bool _3117 = _3113 || _3115;
    float _3119 = fma(_3103, 0.114477999508380889892578125, _3105);
    out.m_63.x = _3107;
    float _3121 = -_3119;
    float _3123 = _3097 + _3121;
    float _3125 = -_3119;
    float _3127 = _3095 + _3125;
    float _3129 = -_3119;
    float _3131 = _3103 + _3129;
    float _3133 = fma(_3123, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3119);
    float _3135 = fma(_3127, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3119);
    float _3137 = fma(_3131, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3119);
    bool _3139 = !_3101;
    if (!_3139)
    {
        float _3141 = -_1837;
        float _3143 = _3141 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3145 = -_1839;
        float _3147 = _3145 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3149 = -_1841;
        float _3151 = _3149 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3153 = _3143 * _3143;
        float _3155 = fma(_3147, _3147, _3153);
        float _3157 = fma(_3151, _3151, _3155);
        float _3159 = rsqrt(_3157);
        float _3161 = sqrt(_3157);
        float _3163 = _3143 * _3159;
        float _3165 = _3147 * _3159;
        float _3167 = _3151 * _3159;
        float _3169 = -_1905;
        float _3171 = _3169 + _3163;
        float _3173 = -_1899;
        float _3175 = _3173 + _3165;
        float _3177 = -_1901;
        float _3179 = _3177 + _3167;
        float _3181 = _3171 * _3171;
        float _3183 = -_3161;
        float _3185 = _3183 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3187 = fma((*spvDescriptorSet0.vp_c13)._m0[4].y, (*spvDescriptorSet0.vp_c13)._m0[4].y, 0.00999999977648258209228515625);
        float _3189 = precise::clamp(_3187, 0.0, 1.0);
        float _3191 = fma(_3175, _3175, _3181);
        float _3193 = _3185 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3195 = precise::clamp(_3193, 0.0, 1.0);
        float _3197 = _3189 * _3189;
        float _3199 = fma(_3179, _3179, _3191);
        float _3201 = _3197 + (-1.0);
        float _3203 = abs(_3195);
        float _3205 = log2(_3203);
        float _3207 = rsqrt(_3199);
        float _3209 = _3205 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3211 = exp2(_3209);
        float _3213 = _3171 * _3207;
        float _3215 = _3175 * _3207;
        float _3217 = _3179 * _3207;
        float _3219 = _3165 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3221 = _1739 * _3213;
        float _3223 = _1739 * _3163;
        float _3225 = fma(_1737, _3215, _3221);
        float _3227 = fma(_1737, _3165, _3223);
        float _3229 = fma(_1741, _3217, _3225);
        float _3231 = precise::clamp(_3229, 0.0, 1.0);
        float _3233 = fma(_1741, _3167, _3227);
        float _3235 = precise::clamp(_3233, 0.0, 1.0);
        float _3237 = _3231 * _3231;
        float _3239 = fma(_3237, _3201, 1.0);
        float _3241 = -_3163;
        float _3243 = -_3219;
        float _3245 = fma(_3241, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3243);
        float _3247 = _3239 * _3239;
        float _3249 = -_3167;
        float _3251 = fma(_3249, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3245);
        float _3253 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3255 = _3251 + _3253;
        float _3257 = 1.0 / _3247;
        float _3259 = _3255 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3261 = precise::clamp(_3259, 0.0, 1.0);
        float _3263 = _3211 * _3261;
        float _3265 = _3235 * _3263;
        float _3267 = _3265 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3269 = _3197 * _3257;
        float _3271 = _3265 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3273 = _3265 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        float _3275 = _3265 * _3269;
        out.m_99.x = _3267;
        out.m_99.y = _3271;
        out.m_99.z = _3273;
        float _3277 = _3275 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3279 = _3275 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3281 = _3275 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_101.x = _3277;
        out.m_101.y = _3279;
        out.m_101.z = _3281;
    }
    out.m_103.x = _3133;
    out.m_103.y = _3135;
    out.m_103.z = _3137;
    if (_3117)
    {
        return out;
    }
    out.m_63.x = 0.0;
    float _3283 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3283;
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
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
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
    bool _2981 = false;
    bool _1789 = false;
    bool _1063 = false;
    bool _869 = false;
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
        float _3340 = as_type<float>(_143);
        out.gl_Position.z = _3340;
    }
    if (!_131)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
        float _3409 = as_type<float>(_181);
        out.gl_Position.z = _3409;
    }
    if (_175)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
    float _383 = in.m_73.y;
    float _385 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[191].y;
    float _387 = -_385;
    float _389 = _387 + (*spvDescriptorSet0.vp_c9)._m0[191].y;
    float _391 = fma((*spvDescriptorSet0.vp_c10)._m0[2].x, 0.0166666693985462188720703125, _381);
    float _393 = fma(_389, _383, _385);
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
    float _521 = in.m_75.x;
    int _523 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _525 = _523 != 0;
    int _527 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _529 = _527 != 0;
    float _531 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _533 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _531;
    float _535 = 1.0 / _533;
    float _537 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _539 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    bool _541 = _383 > 0.5;
    bool _543 = _541 && _529;
    float _545 = 0.0;
    float _547 = _521;
    if (_525)
    {
        float _549 = in.m_73.x;
        _545 = _549;
    }
    float _551 = _545;
    float _553 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _555 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _557 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _559 = _371 + _557;
    float _561 = _537 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _563 = _539 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _565 = _553 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _567 = _559 * _535;
    out.m_77.x = _561;
    out.m_77.y = _563;
    out.m_77.z = _565;
    out.m_77.w = _555;
    bool _569 = _371 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _571 = isnan(_371);
    bool _573 = _569 || _571;
    bool _575 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _577 = _573 || _575;
    float _579 = float(_577);
    float _581 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _583 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _585 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _587 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _589 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _587;
    bool _591 = _371 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _593 = isnan(_371);
    bool _595 = _591 || _593;
    bool _597 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _599 = _595 || _597;
    float _601 = float(_599);
    float _603 = _581 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _605 = _583 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _607 = _551 > 0.5;
    bool _609 = _607 && _525;
    float _611 = -_579;
    float _613 = _611 + 1.0;
    float _615 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _617 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _615;
    float _619 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _621 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _619;
    float _623 = _585 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _625 = _601 * _613;
    float _627 = fma(_589, _567, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _629 = fma(_617, _567, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _631 = fma(_621, _567, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    int _633 = _496 + 1;
    float _635 = -_601;
    float _637 = _635 + 1.0;
    float _639 = _627 * _625;
    float _641 = _629 * _625;
    out.m_79.x = _603;
    out.m_79.y = _605;
    out.m_79.z = _623;
    float _643 = _631 * _625;
    float _645 = fma(_637, (*spvDescriptorSet0.vp_c9)._m0[143].x, _639);
    float _647 = fma(_637, (*spvDescriptorSet0.vp_c9)._m0[143].y, _641);
    float _649 = in.m_75.y;
    float _651 = fma(_637, (*spvDescriptorSet0.vp_c9)._m0[143].z, _643);
    float _653 = fma(_579, (*spvDescriptorSet0.vp_c9)._m0[144].x, _645);
    float _655 = fma(_579, (*spvDescriptorSet0.vp_c9)._m0[144].y, _647);
    float _657 = fma(_579, (*spvDescriptorSet0.vp_c9)._m0[144].z, _651);
    int _659 = abs(_633);
    float _661 = _603;
    if (_525)
    {
        _661 = _521;
    }
    float _663 = _661;
    float _665 = float(uint(_659));
    uint _667 = uint(int(uint(_633) >> uint(31)));
    float _669 = _663;
    if (_609)
    {
        float _671 = -_663;
        float _673 = _671 + 1.0;
        _669 = _673;
    }
    float _675 = _669;
    float _677 = as_type<float>(_426) * _665;
    int _679 = ~int(_667);
    int _681 = _679 + 1;
    if (_525)
    {
        _547 = _675;
    }
    float _683 = _547;
    float _685 = trunc(_677);
    float _687 = precise::max(_685, 0.0);
    uint _689 = uint(_687);
    float _691 = _649;
    if (_543)
    {
        float _693 = -_649;
        float _695 = _693 + 1.0;
        _691 = _695;
    }
    float _697 = _691;
    float _699 = _697 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _701 = ~int(_689);
    int _703 = _701 + 1;
    int _705 = _703 * _401;
    int _707 = _705 + _659;
    float _709 = float(uint(_707));
    float _711 = as_type<float>(_426) * _709;
    float _713 = in.m_81.x;
    float _715 = in.m_81.y;
    float _717 = in.m_81.z;
    float _719 = trunc(_711);
    float _721 = precise::max(_719, 0.0);
    uint _723 = uint(_721);
    int _725 = int(_689) + int(_723);
    float _727 = _683 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _729 = ~_725;
    int _731 = _729 + 1;
    float _733 = _653 * _713;
    float _735 = _657 * _717;
    float _737 = _655 * _715;
    float _739 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _741 = _731 * _401;
    int _743 = _741 + _659;
    bool _745 = uint(_743) >= uint(_401);
    bool _747 = !_745;
    int _749 = _747 ? 0 : (-1);
    int _751 = ~_725;
    int _753 = _751 + _749;
    int _755 = _753 + 1;
    float _757 = _699 * _739;
    int _759 = _755 * _401;
    int _761 = _759 + _659;
    float _763 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _765 = _761 ^ _681;
    int _767 = ~_681;
    int _769 = _767 + _765;
    int _771 = _769 + 1;
    bool _773 = !_403;
    int _775 = _773 ? _771 : (-1);
    float _777 = _727 * _763;
    uint _779 = as_type<uint>(half2(float2(_519, 0.0)));
    uint _781 = extract_bits(_779, 0u, 8u);
    int _783 = int(_781) & 255;
    uint _785 = extract_bits(_779, 8u, 8u);
    int _787 = int(_785) & 255;
    int _789 = _787 << 8;
    int _791 = _783 | _789;
    bool _793 = _791 >= 32768;
    int _795 = _791 + (-1024);
    int _797 = _795;
    if (_793)
    {
        int _799 = ~_791;
        int _801 = _799 + 33792;
        int _803 = _801 + 1;
        _797 = _803;
    }
    int _805 = _797;
    int _807 = _805 + 30719;
    float _809 = float(_807);
    float _811 = fma(_809, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _813 = abs(_811);
    float _815 = -_813;
    float _817 = _815 + 1.0;
    float _819 = abs(_811);
    float _821 = fma(_819, -0.0187292993068695068359375, 0.074261002242565155029296875);
    bool _823 = _811 < 0.0;
    float _825 = float(_823);
    int _827 = as_type<int>(_817) + (-218103808);
    float _829 = abs(_811);
    float _831 = fma(_829, _821, -0.212114393711090087890625);
    bool _833 = uint(_827) >= 1920991232u;
    float _835 = abs(_811);
    float _837 = fma(_835, _831, 1.570728778839111328125);
    bool _839 = !_833;
    float _865;
    int _867;
    if (!_839)
    {
        int _841 = as_type<int>(_817);
        int _843 = as_type<int>(_817);
        int _845 = 3664;
        int _847 = 0;
        int _849 = 0;
        int _851;
        int _853;
        int _855;
        int _857;
        int _859;
        int _861;
        int _863;
        _116(_841, _843, _845, _847, _849, _851, _853, _855, _857, _859, _861, _863, out.gl_Position, out.gl_PointSize);
        _865 = as_type<float>(_861);
        _867 = _859;
        _869 = true;
    }
    else
    {
        float _871 = rsqrt(_817);
        float _873 = _817 * _871;
        float _875 = _871 * 0.5;
        float _877 = -_873;
        float _879 = 0.0 + _877;
        float _881 = fma(_875, _879, 0.5);
        float _883 = fma(_873, _881, _873);
        float _885 = -_883;
        float _887 = 0.0 + _885;
        float _889 = fma(_883, _887, _817);
        float _891 = fma(_875, _889, _883);
        _865 = _891;
        _867 = 0;
    }
    _869 = false;
    float _893 = _865;
    int _895 = _867;
    int _897 = _775;
    int _899 = 0;
    int _901 = _119(_897, _899, (*spvDescriptorSet0.support_buffer));
    int _903 = _480;
    int _905 = 0;
    int _907 = _119(_903, _905, (*spvDescriptorSet0.support_buffer));
    float4 _909 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_901, _907)), 0).xyzw;
    float _911 = _909.x;
    float _913 = _909.y;
    float _915 = _909.z;
    float _917 = _909.w;
    float _919 = _837 * _893;
    float _921 = _825 * 2.0;
    float _923 = _809 * 3.883221149444580078125;
    float _925 = floor(_405);
    float _927 = -_921;
    float _929 = fma(_919, _927, _919);
    float _931 = _923 * 0.15915493667125701904296875;
    float _933 = fma(_825, 3.1415927410125732421875, _929);
    float _935 = _931 * 6.283185482025146484375;
    float _937 = cos(_935);
    float _939 = _933 * 0.15915493667125701904296875;
    float _941 = _939 * 6.283185482025146484375;
    float _943 = sin(_941);
    float _945 = -_925;
    float _947 = _405 + _945;
    float _949 = _931 * 6.283185482025146484375;
    float _951 = sin(_949);
    float _953 = _943 * _937;
    float _955 = _943 * _951;
    uint _957 = as_type<uint>(half2(float2(_917, 0.0)));
    float _959 = -_513;
    float _961 = _959 + _911;
    float _963 = -_517;
    float _965 = _963 + _915;
    uint _967 = extract_bits(_957, 0u, 8u);
    int _969 = int(_967) & 255;
    uint _971 = extract_bits(_957, 8u, 8u);
    int _973 = int(_971) & 255;
    int _975 = _973 << 8;
    int _977 = _969 | _975;
    float _979 = fma(_947, _961, _513);
    float _981 = fma(_947, _965, _517);
    bool _983 = _977 >= 32768;
    int _985 = _977 + (-1024);
    int _987 = _985;
    if (_983)
    {
        int _989 = ~_977;
        int _991 = _989 + 33792;
        int _993 = _991 + 1;
        _987 = _993;
    }
    int _995 = _987;
    int _997 = _995 + 30719;
    float _999 = float(_997);
    float _1001 = fma(_999, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _1003 = abs(_1001);
    float _1005 = -_1003;
    float _1007 = _1005 + 1.0;
    bool _1009 = _1001 < 0.0;
    float _1011 = float(_1009);
    float _1013 = abs(_1001);
    float _1015 = fma(_1013, -0.0187292993068695068359375, 0.074261002242565155029296875);
    int _1017 = as_type<int>(_1007) + (-218103808);
    float _1019 = abs(_1001);
    float _1021 = fma(_1019, _1015, -0.212114393711090087890625);
    bool _1023 = uint(_1017) >= 1920991232u;
    float _1025 = -_515;
    float _1027 = _1025 + _913;
    float _1029 = abs(_1001);
    float _1031 = fma(_1029, _1021, 1.570728778839111328125);
    float _1033 = fma(_947, _1027, _515);
    bool _1035 = !_1023;
    float _1061;
    if (!_1035)
    {
        int _1037 = as_type<int>(_1007);
        int _1039 = as_type<int>(_961);
        int _1041 = 4560;
        int _1043 = _895;
        int _1045 = as_type<int>(_919);
        int _1047;
        int _1049;
        int _1051;
        int _1053;
        int _1055;
        int _1057;
        int _1059;
        _116(_1037, _1039, _1041, _1043, _1045, _1047, _1049, _1051, _1053, _1055, _1057, _1059, out.gl_Position, out.gl_PointSize);
        _1061 = as_type<float>(_1057);
        _1063 = true;
    }
    else
    {
        float _1065 = rsqrt(_1007);
        float _1067 = _1007 * _1065;
        float _1069 = _1065 * 0.5;
        float _1071 = -_1067;
        float _1073 = 0.0 + _1071;
        float _1075 = fma(_1069, _1073, 0.5);
        float _1077 = fma(_1067, _1075, _1067);
        float _1079 = -_1077;
        float _1081 = 0.0 + _1079;
        float _1083 = fma(_1077, _1081, _1007);
        float _1085 = fma(_1069, _1083, _1077);
        _1061 = _1085;
    }
    _1063 = false;
    float _1087 = _1061;
    float _1089 = in.m_73.x;
    float _1091 = in.m_73.y;
    float _1093 = in.m_73.z;
    float _1095 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1097 = log2(_1095);
    float _1099 = _1031 * _1087;
    int _1101 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1103 = _1101 != 0;
    int _1105 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1107 = _1105 != 0;
    int _1109 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1111 = _1109 != 0;
    float _1113 = _733 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1115 = _737 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1117 = _735 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1119 = _999 * 3.883221149444580078125;
    float _1121 = -_811;
    float _1123 = _1121 + _1001;
    float _1125 = _1119 * 0.15915493667125701904296875;
    float _1127 = _1125 * 6.283185482025146484375;
    float _1129 = sin(_1127);
    float _1131 = _1091 * 2.0;
    float _1133 = _1093 * 2.0;
    float _1135 = _1089 * 2.0;
    float _1137 = _1093 + _1089;
    float _1139 = floor(_1131);
    float _1141 = _1137 + (-1.0);
    float _1143 = floor(_1133);
    bool _1145 = _1139 > 0.0;
    float _1147 = floor(_1135);
    bool _1149 = _1139 >= 0.0;
    bool _1151 = isnan(_1139);
    bool _1153 = _1149 || _1151;
    bool _1155 = isnan(0.0);
    bool _1157 = _1153 || _1155;
    int _1159 = _1157 ? 0 : 1;
    bool _1161 = _1143 > 0.0;
    bool _1163 = _1143 >= 0.0;
    bool _1165 = isnan(_1143);
    bool _1167 = _1163 || _1165;
    bool _1169 = isnan(0.0);
    bool _1171 = _1167 || _1169;
    float _1173 = _1097 * _161;
    int _1175 = ~_1159;
    int _1177 = _1175 + 1;
    int _1179 = _1177 + 1;
    float _1181 = fma(_1141, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    int _1183 = _1171 ? 0 : 1;
    float _1185 = exp2(_1173);
    int _1187 = _1179;
    int _1189 = as_type<int>(_1125);
    if (!_1145)
    {
        int _1191 = ~_1159;
        int _1193 = _1191 + 1;
        _1187 = _1193;
    }
    int _1195 = _1187;
    int _1197 = ~_1183;
    int _1199 = _1197 + 1;
    int _1201 = _1199 + 1;
    float _1203 = in.m_83.x;
    float _1205 = in.m_83.y;
    float _1207 = in.m_83.z;
    int _1209 = _1201;
    if (!_1161)
    {
        int _1211 = ~_1183;
        int _1213 = _1211 + 1;
        _1209 = _1213;
    }
    int _1215 = _1209;
    bool _1217 = !_1103;
    int _1219 = _1217 ? 0 : 1;
    float _1221 = _1091 + _1089;
    bool _1223 = _1147 > 0.0;
    float _1225 = _1089 + (-0.5);
    int _1227 = abs(_1219);
    float _1229 = _1221 + (-1.0);
    bool _1231 = !_1111;
    int _1233 = _1231 ? 0 : 1;
    float _1235 = -_1185;
    float _1237 = _1235 + 1.0;
    bool _1239 = _1147 >= 0.0;
    bool _1241 = isnan(_1147);
    bool _1243 = _1239 || _1241;
    bool _1245 = isnan(0.0);
    bool _1247 = _1243 || _1245;
    float _1249 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1251 = 1.0 + _1249;
    int _1253 = abs(_1233);
    float _1255 = float(_1227);
    float _1257 = 1.0 / _1251;
    float _1259 = float(_1215);
    bool _1261 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1263 = isnan(1.0);
    bool _1265 = _1261 || _1263;
    bool _1267 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1269 = _1265 || _1267;
    float _1271 = _1255 * _1259;
    bool _1273 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1275 = isnan(0.0);
    bool _1277 = _1273 || _1275;
    bool _1279 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1281 = _1277 || _1279;
    float _1283 = float(_1253);
    float _1285 = _1271 * (-2.0);
    float _1287 = float(_1195);
    float _1289 = fma(_1229, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1291 = _1281 ? _1237 : 0.0;
    int _1293 = _1247 ? 0 : 1;
    float _1295 = _1283 * _1287;
    float _1297 = fma(_1285, _1203, _1203);
    float _1299 = fma(_1289, _1285, _1289);
    bool _1301 = !_1107;
    int _1303 = _1301 ? 0 : 1;
    if (_1269)
    {
        float _1305 = _1291 * _1257;
        _165 = _1305;
    }
    float _1307 = _165;
    float _1309 = fma(_1225, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1297);
    float _1311 = _1295 * (-2.0);
    int _1313 = ~_1293;
    int _1315 = _1313 + 1;
    int _1317 = _1315 + 1;
    int _1319 = abs(_1303);
    float _1321 = fma(_1299, _1307, _1309);
    int _1323 = _1317;
    if (!_1223)
    {
        int _1325 = ~_1293;
        int _1327 = _1325 + 1;
        _1323 = _1327;
    }
    int _1329 = _1323;
    float _1331 = _1093 + (-0.5);
    float _1333 = fma(_1311, _1207, _1207);
    float _1335 = float(_1319);
    float _1337 = fma(_1181, _1311, _1181);
    float _1339 = float(_1329);
    float _1341 = _1321 * 0.15915493667125701904296875;
    float _1343 = fma(_1331, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1333);
    float _1345 = in.m_69.x;
    float _1347 = in.m_69.y;
    float _1349 = in.m_69.z;
    float _1351 = _1093 + _1091;
    float _1353 = _1335 * _1339;
    float _1355 = _1091 + (-0.5);
    float _1357 = in.m_60.x;
    float _1359 = in.m_60.y;
    float _1361 = in.m_60.z;
    float _1363 = _1351 + (-1.0);
    float _1365 = _1353 * (-2.0);
    float _1367 = fma(_1337, _1307, _1343);
    float _1369 = _1341 * 6.283185482025146484375;
    float _1371 = sin(_1369);
    float _1373 = fma(_1363, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1375 = fma(_1365, _1205, _1205);
    float _1377 = in.m_71.x;
    float _1379 = in.m_71.y;
    float _1381 = in.m_71.z;
    float _1383 = _1367 * 0.15915493667125701904296875;
    float _1385 = fma(_1373, _1365, _1373);
    float _1387 = fma(_1355, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1375);
    bool _1389 = _1033 != 0.0;
    bool _1391 = isnan(_1033);
    bool _1393 = _1389 || _1391;
    bool _1395 = isnan(0.0);
    bool _1397 = _1393 || _1395;
    float _1399 = _1341 * 6.283185482025146484375;
    float _1401 = cos(_1399);
    float _1403 = fma(_1385, _1307, _1387);
    float _1405 = _1011 * 2.0;
    bool _1407 = _979 == 0.0;
    bool _1409 = !_1397;
    bool _1411 = _1407 && _1409;
    float _1413 = _1403 * 0.15915493667125701904296875;
    float _1415 = -_1405;
    float _1417 = fma(_1099, _1415, _1099);
    float _1419 = _1383 * 6.283185482025146484375;
    float _1421 = sin(_1419);
    float _1423 = fma(_1011, 3.1415927410125732421875, _1417);
    float _1425 = _1347 * _1359;
    bool _1427 = _981 == 0.0;
    bool _1429 = _1427 && _1411;
    float _1431 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1033);
    float _1433 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _981);
    float _1435 = _1383 * 6.283185482025146484375;
    float _1437 = cos(_1435);
    float _1439 = fma(_1345, _1357, _1425);
    float _1441 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _979);
    float _1443 = _1379 * _1359;
    float _1445 = _1115 * _1431;
    float _1447 = fma(_1349, _1361, _1439);
    float _1449 = _1113 * _1441;
    float _1451 = fma(_1377, _1357, _1443);
    float _1453 = _1413 * 6.283185482025146484375;
    float _1455 = sin(_1453);
    float _1457 = _1371 * _1421;
    float _1459 = _1117 * _1433;
    float _1461 = fma(_1381, _1361, _1451);
    float _1463 = _1401 * _1421;
    float _1465 = _1447 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1467 = _1413 * 6.283185482025146484375;
    float _1469 = cos(_1467);
    float _1471 = _1401 * _1437;
    float _1473 = _1371 * _1437;
    float _1475 = fma(_1455, _1457, _1471);
    float _1477 = _1125 * 6.283185482025146484375;
    float _1479 = cos(_1477);
    float _1481 = _1469 * _1421;
    float _1483 = _1469 * _1437;
    float _1485 = _1371 * _1469;
    float _1487 = _1401 * _1469;
    float _1489 = -_1463;
    float _1491 = fma(_1455, _1473, _1489);
    float _1493 = _1475 * _1445;
    float _1495 = -_1473;
    float _1497 = fma(_1455, _1463, _1495);
    float _1499 = _1485 * _1445;
    float _1501 = _1491 * _1445;
    float _1503 = fma(_1481, _1449, _1493);
    float _1505 = fma(_1455, _1471, _1457);
    float _1507 = -_1455;
    float _1509 = fma(_1507, _1449, _1499);
    float _1511 = fma(_1483, _1449, _1501);
    float _1513 = fma(_1497, _1459, _1503);
    float _1515 = _1423 * 0.15915493667125701904296875;
    float _1517 = fma(_1487, _1459, _1509);
    float _1519 = fma(_1505, _1459, _1511);
    float _1521 = _1513 * _321;
    float _1523 = _1513 * _329;
    float _1525 = in.m_67.x;
    float _1527 = in.m_67.y;
    float _1529 = in.m_67.z;
    float _1531 = _1515 * 6.283185482025146484375;
    float _1533 = sin(_1531);
    float _1535 = fma(_1519, _297, _1521);
    float _1537 = fma(_1519, _307, _1523);
    float _1539 = _1461 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1541 = fma(_1517, _333, _1535);
    float _1543 = fma(_1517, _341, _1537);
    float _1545 = _1465 + _1541;
    float _1547 = _1539 + _1543;
    float _1549 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1551 = _1545 + _1549;
    float _1553 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1555 = _1547 + _1553;
    float _1557 = -_953;
    float _1559 = fma(_1533, _1479, _1557);
    float _1561 = _1551 * _1551;
    float _1563 = _1555 * _1555;
    float _1565 = -_955;
    float _1567 = fma(_1533, _1129, _1565);
    float _1569 = fma(_947, _1559, _953);
    float _1571 = _1561 + _1563;
    float _1573 = _1527 * _1359;
    float _1575 = _1513 * _325;
    float _1577 = fma(_947, _1567, _955);
    float _1579 = sqrt(_1571);
    float _1581 = fma(_1525, _1357, _1573);
    float _1583 = fma(_947, _1123, _811);
    float _1585 = fma(_1519, _303, _1575);
    float _1587 = _1569;
    float _1589 = _1583;
    float _1591 = _1577;
    float _1593 = _1525;
    float _1595 = _1561;
    float _1597 = _1563;
    float _1599 = _1545;
    float _1601 = _1547;
    float _1603 = _1529;
    int _1605 = as_type<int>(_1567);
    float _1607 = _1539;
    float _1609 = _1465;
    if (!_1429)
    {
        float _1611 = fma(_979, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1569);
        _1587 = _1611;
    }
    float _1613 = _1587;
    float _1615 = fma(_1529, _1361, _1581);
    if (!_1429)
    {
        float _1617 = fma(_1033, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1583);
        _1589 = _1617;
    }
    float _1619 = _1589;
    float _1621 = fma(_1517, _337, _1585);
    if (!_1429)
    {
        float _1623 = fma(_981, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1577);
        _1591 = _1623;
    }
    float _1625 = _1591;
    float _1627 = _1615 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1629 = _1475 * _1619;
    float _1631 = _1485 * _1619;
    float _1633 = _1491 * _1619;
    float _1635 = fma(_1481, _1613, _1629);
    float _1637 = _1627 + _1621;
    bool _1639 = _1579 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1641 = -_1455;
    float _1643 = fma(_1641, _1613, _1631);
    if (!_1639)
    {
        _1593 = _1637;
    }
    float _1645 = _1593;
    bool _1647 = !_1639;
    float _1649 = _1645;
    if (!_1647)
    {
        float _1651 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1653 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1655 = _1579 + _1653;
        float _1657 = rsqrt(_1571);
        float _1659 = _1655 * _1651;
        float _1661 = _1637 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1663 = _1659 * 0.15915493667125701904296875;
        float _1665 = _1663 * 6.283185482025146484375;
        float _1667 = sin(_1665);
        float _1669 = _1663 * 6.283185482025146484375;
        float _1671 = cos(_1669);
        float _1673 = fma(_1667, _1661, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1675 = _1657 * _1673;
        float _1677 = _1671 + (-1.0);
        float _1679 = _1551 * _1675;
        float _1681 = _1555 * _1675;
        float _1683 = _1677 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1685 = _1679 + (*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1687 = _1679 * _1679;
        float _1689 = _1681 + (*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1691 = fma(_1637, _1671, _1683);
        float _1693 = _1681 * _1681;
        _1649 = _1691;
        _1595 = _1687;
        _1597 = _1693;
        _1599 = _1685;
        _1601 = _1689;
        _1603 = _1663;
    }
    float _1695 = _1649;
    float _1697 = _1595;
    float _1699 = _1597;
    float _1701 = _1599;
    float _1703 = _1601;
    float _1705 = _1603;
    float _1707 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1709 = _1695 + _1707;
    float _1711 = fma(_1483, _1613, _1633);
    float _1713 = fma(_1497, _1625, _1635);
    float _1715 = fma(_1487, _1625, _1643);
    float _1717 = fma(_1709, _1709, _1697);
    float _1719 = fma(_1505, _1625, _1711);
    float _1721 = _1713 * _321;
    float _1723 = _1713 * _325;
    float _1725 = _1717 + _1699;
    float _1727 = _1713 * _329;
    float _1729 = fma(_1719, _297, _1721);
    float _1731 = fma(_1719, _303, _1723);
    out.m_85.x = _777;
    out.m_85.y = _757;
    float _1733 = fma(_1719, _307, _1727);
    float _1735 = sqrt(_1725);
    float _1737 = fma(_1715, _333, _1729);
    float _1739 = fma(_1715, _337, _1731);
    float _1741 = fma(_1715, _341, _1733);
    out.m_87.x = _1737;
    out.m_87.y = _1739;
    out.m_87.z = _1741;
    out.m_89.x = 1.0;
    out.m_89.y = 1.0;
    out.m_89.z = 1.0;
    bool _1743 = _1735 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1745 = isnan(_1735);
    bool _1747 = _1743 || _1745;
    bool _1749 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1751 = _1747 || _1749;
    float _1753 = _1705;
    if (!_1751)
    {
        _1753 = 1.0;
    }
    float _1755 = _1753;
    bool _1757 = !_1751;
    float _1759 = _1755;
    if (!_1757)
    {
        bool _1761 = _1735 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1763 = isnan(_1735);
        bool _1765 = _1761 || _1763;
        bool _1767 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1769 = _1765 || _1767;
        if (!_1769)
        {
            float _1771 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1773 = _1735 + _1771;
            float _1775 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1777 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1775;
            float _1779 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1781 = _1779 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1783 = 1.0 / _1777;
            float _1785 = _1773 * _1783;
            float _1787 = fma(_1785, _1781, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1759 = _1787;
            _1789 = true;
        }
        else
        {
            bool _1791 = _1735 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1793 = isnan(_1735);
            bool _1795 = _1791 || _1793;
            bool _1797 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1799 = _1795 || _1797;
            if (!_1799)
            {
                float _1801 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1803 = _1735 + _1801;
                float _1805 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1807 = _1805 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1809 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1811 = _1809 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1813 = 1.0 / _1807;
                float _1815 = _1803 * _1813;
                float _1817 = fma(_1815, _1811, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1759 = _1817;
                _1789 = true;
            }
            else
            {
                _1759 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1789 = false;
    float _1819 = _1759;
    float _1821 = _1627 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1823 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1825 = _1695 + _1823;
    float _1827 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1829 = _1701 + _1827;
    float _1831 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1833 = _1703 + _1831;
    float _1835 = fma(_1465, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1821);
    float _1837 = fma(_1825, _1819, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1839 = fma(_1829, _1819, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1841 = fma(_1833, _1819, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1843 = fma(_1539, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1835);
    float _1845 = _1627 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1847 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1849 = _1837 + _1847;
    float _1851 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1853 = _1839 + _1851;
    float _1855 = _1843 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1857 = fma(_1465, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1845);
    float _1859 = _1849 * _1849;
    float _1861 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1863 = _1841 + _1861;
    float _1865 = 1.0 / _1855;
    float _1867 = fma(_1539, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1857);
    float _1869 = fma(_1853, _1853, _1859);
    float _1871 = _1837 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1873 = _1867 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1875 = fma(_1863, _1863, _1869);
    float _1877 = _1873 + _1855;
    float _1879 = rsqrt(_1875);
    float _1881 = _1877 * _1865;
    float _1883 = _1881 * 0.5;
    float _1885 = sqrt(_1875);
    float _1887 = fma(_1539, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1889 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1891 = fma(_1883, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1889);
    float _1893 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _1895 = _1627 + _1893;
    float _1897 = 1.0 / _1891;
    float _1899 = _1853 * _1879;
    float _1901 = _1863 * _1879;
    float _1903 = _1895 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1905 = _1849 * _1879;
    float _1907 = _1899 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1909 = _1901 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1911 = fma(_1465, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1903);
    float _1913 = floor(_1887);
    float _1915 = _1907 * _1907;
    float _1917 = _1909 * _1909;
    float _1919 = fma(_1539, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1911);
    float _1921 = _1915 + _1917;
    float _1923 = _1919 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _1925 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1927 = _1897 * _1925;
    float _1929 = _1895 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1931 = sqrt(_1921);
    bool _1933 = _1927 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _1935 = fma(_1465, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1929);
    bool _1937 = _1927 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _1939 = -_1913;
    float _1941 = _1887 + _1939;
    float _1943 = fma(_1539, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1935);
    float _1945 = trunc(_1923);
    int _1947 = int(_1945);
    float _1949 = _1943 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    bool _1951 = !_1933;
    int _1953 = _1951 ? 0 : 1;
    int _1955 = 2;
    float _1957 = _1907;
    float _1959 = _1909;
    float _1961 = _1915;
    float _1963 = _1917;
    float _1965 = _1887;
    if (!_1933)
    {
        _1955 = 1;
    }
    int _1967 = _1955;
    float _1969 = trunc(_1949);
    int _1971 = int(_1969);
    int _1973 = _1967;
    if (!_1937)
    {
        _1973 = _1953;
    }
    int _1975 = _1973;
    bool _1977 = _1931 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1979 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1981 = _1931 + _1979;
    int _1983 = _1975 << 6;
    int _1985 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1987 = _1947 + _1985;
    int _1989 = _1987 + 1;
    int _1991 = _1983 + 96;
    uint _1993 = uint(int(uint(_1991) >> uint(2)));
    uint _1995 = uint(int(uint(int(_1993)) >> uint(2)));
    int _1997 = int(_1993) & 3;
    float _1999 = (*spvDescriptorSet0.vp_c15)._m0[int(_1995)][_1997];
    int _2001 = int(_1993) + 1;
    uint _2003 = uint(int(uint(_2001) >> uint(2)));
    int _2005 = _2001 & 3;
    float _2007 = (*spvDescriptorSet0.vp_c15)._m0[int(_2003)][_2005];
    float _2009 = _321;
    float _2011 = _1981;
    int _2013 = _1989;
    if (_1977)
    {
        float _2015 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2009 = _2015;
    }
    float _2017 = _2009;
    int _2019 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _2021 = _1971 + _2019;
    int _2023 = _2021 + 1;
    int _2025 = _1983 + 104;
    uint _2027 = uint(int(uint(_2025) >> uint(2)));
    uint _2029 = uint(int(uint(int(_2027)) >> uint(2)));
    int _2031 = int(_2027) & 3;
    float _2033 = (*spvDescriptorSet0.vp_c15)._m0[int(_2029)][_2031];
    int _2035 = int(_2027) + 1;
    uint _2037 = uint(int(uint(_2035) >> uint(2)));
    int _2039 = _2035 & 3;
    float _2041 = (*spvDescriptorSet0.vp_c15)._m0[int(_2037)][_2039];
    bool _2043 = _2023 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _2045 = _2023 | _1989;
    bool _2047 = _2045 < 0;
    bool _2049 = _2047 || _2043;
    bool _2051 = _1989 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _2053 = _2051 || _2049;
    if (_1977)
    {
        float _2055 = _1981 * _2017;
        _2011 = _2055;
    }
    float _2057 = _2011;
    if (_1977)
    {
        float _2059 = _2057 * 0.15915493667125701904296875;
        _299 = _2059;
    }
    float _2061 = _299;
    float _2063 = _1837 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2065 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2067 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2069 = _1731;
    if (_1977)
    {
        float _2071 = _2061 * 6.283185482025146484375;
        float _2073 = sin(_2071);
        _2069 = _2073;
    }
    float _2075 = _2069;
    float _2077 = fma(_1839, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2063);
    float _2079 = precise::max(0.0, _2065);
    if (!_2053)
    {
        int _2081 = _1989 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _2083 = _2081 + _2023;
        _2013 = _2083;
    }
    int _2085 = _2013;
    float _2087 = fma(_1841, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2077);
    float _2089 = -_1905;
    float _2091 = -_2079;
    float _2093 = fma(_2089, (*spvDescriptorSet0.vp_c15)._m0[24].y, _2091);
    float _2095 = _2087 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2097 = _307;
    float _2099 = _2093;
    if (_1977)
    {
        float _2101 = _2061 * 6.283185482025146484375;
        float _2103 = cos(_2101);
        _2097 = _2103;
    }
    float _2105 = _2097;
    if (!_2053)
    {
        int _2107 = _2085 << 2;
        _1605 = _2107;
    }
    int _2109 = _1605;
    float _2111 = _2095 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    int _2113 = _2109;
    if (!_2053)
    {
        uint _2115 = uint(int(uint(_2085) >> uint(2)));
        _1189 = int(_2115);
    }
    int _2117 = _1189;
    if (!_2053)
    {
        int _2119 = 12 & _2109;
        _2113 = _2119;
    }
    int _2121 = _2113;
    float _2123 = _1895 * _2007;
    float _2125 = _2087;
    float _2127 = _2007;
    int _2129 = _2121;
    float _2131 = _2123;
    if (_1977)
    {
        float _2133 = rsqrt(_1921);
        _2125 = _2133;
    }
    float _2135 = _2125;
    if (_1977)
    {
        float _2137 = _2093 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2127 = _2137;
    }
    float _2139 = _2127;
    float _2141 = -_2111;
    float _2143 = fma(_2141, _2067, 1.0);
    float _2145 = fma(_1465, _1999, _2123);
    if (!_2053)
    {
        int _2147 = _2117 << 4;
        int _2149 = _2147 + _2121;
        _2129 = _2149;
    }
    int _2151 = _2129;
    float _2153 = _2075;
    if (_1977)
    {
        float _2155 = fma(_2075, _2139, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2153 = _2155;
    }
    float _2157 = _2153;
    float _2159 = _1837 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    if (_1977)
    {
        float _2161 = _2105 + (-1.0);
        _2131 = _2161;
    }
    float _2163 = _2131;
    float _2165 = fma(_1539, _2033, _2145);
    float _2167 = log2(_2143);
    float _2169 = _2163;
    if (_1977)
    {
        float _2171 = _2163 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2169 = _2171;
    }
    float _2173 = _2169;
    float _2175 = _2165 + _2041;
    float _2177 = fma(_1465, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2179 = _2135;
    if (_1977)
    {
        float _2181 = _2135 * _2157;
        _2179 = _2181;
    }
    float _2183 = _2179;
    if (_1977)
    {
        float _2185 = fma(_2093, _2105, _2173);
        _2099 = _2185;
    }
    float _2187 = _2099;
    int _2189 = _1983 + 56;
    uint _2191 = uint(int(uint(_2189) >> uint(2)));
    uint _2193 = uint(int(uint(int(_2191)) >> uint(2)));
    int _2195 = int(_2191) & 3;
    float _2197 = (*spvDescriptorSet0.vp_c15)._m0[int(_2193)][_2195];
    int _2199 = int(_2191) + 1;
    uint _2201 = uint(int(uint(_2199) >> uint(2)));
    int _2203 = _2199 & 3;
    float _2205 = (*spvDescriptorSet0.vp_c15)._m0[int(_2201)][_2203];
    float _2207 = floor(_2177);
    if (_1977)
    {
        float _2209 = _1907 * _2183;
        _1957 = _2209;
    }
    float _2211 = _1957;
    if (_1977)
    {
        float _2213 = _1909 * _2183;
        _1959 = _2213;
    }
    float _2215 = _1959;
    if (_1977)
    {
        float _2217 = _2211 * _2211;
        _1961 = _2217;
    }
    float _2219 = _1961;
    if (_1977)
    {
        float _2221 = _2215 * _2215;
        _1963 = _2221;
    }
    float _2223 = _1963;
    int _2225 = _1983 + 48;
    uint _2227 = uint(int(uint(_2225) >> uint(2)));
    uint _2229 = uint(int(uint(int(_2227)) >> uint(2)));
    int _2231 = int(_2227) & 3;
    float _2233 = (*spvDescriptorSet0.vp_c15)._m0[int(_2229)][_2231];
    int _2235 = int(_2227) + 1;
    uint _2237 = uint(int(uint(_2235) >> uint(2)));
    int _2239 = _2235 & 3;
    float _2241 = (*spvDescriptorSet0.vp_c15)._m0[int(_2237)][_2239];
    float _2243 = _2167 * 0.693147182464599609375;
    float _2245 = fma(_2187, _2187, _2219);
    float _2247 = _1837 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2249 = _2245 + _2223;
    float _2251 = fma(_1839, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2247);
    int _2253 = _1983 + 64;
    uint _2255 = uint(int(uint(_2253) >> uint(2)));
    uint _2257 = uint(int(uint(int(_2255)) >> uint(2)));
    int _2259 = int(_2255) & 3;
    float _2261 = (*spvDescriptorSet0.vp_c15)._m0[int(_2257)][_2259];
    int _2263 = int(_2255) + 1;
    uint _2265 = uint(int(uint(_2263) >> uint(2)));
    int _2267 = _2263 & 3;
    float _2269 = (*spvDescriptorSet0.vp_c15)._m0[int(_2265)][_2267];
    float _2271 = fma(_1839, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2159);
    float _2273 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2275 = fma(_1885, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2273);
    float _2277 = precise::clamp(_2275, 0.0, 1.0);
    float _2279 = fma(_1841, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2251);
    float _2281 = fma(_1839, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1871);
    float _2283 = fma(_1841, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2271);
    float _2285 = -_2277;
    float _2287 = _2285 + 1.0;
    float _2289 = _2279 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    int _2291 = _1983 + 72;
    uint _2293 = uint(int(uint(_2291) >> uint(2)));
    uint _2295 = uint(int(uint(int(_2293)) >> uint(2)));
    int _2297 = int(_2293) & 3;
    float _2299 = (*spvDescriptorSet0.vp_c15)._m0[int(_2295)][_2297];
    int _2301 = int(_2293) + 1;
    uint _2303 = uint(int(uint(_2301) >> uint(2)));
    int _2305 = _2301 & 3;
    float _2307 = (*spvDescriptorSet0.vp_c15)._m0[int(_2303)][_2305];
    float _2309 = _2283 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2311 = fma(_1841, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2281);
    float _2313 = _2289 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2315 = rsqrt(_2249);
    float _2317 = -_2207;
    float _2319 = _2177 + _2317;
    float _2321 = _2311 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2323 = fma(_2309, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2313);
    int _2325 = _1983 + 80;
    uint _2327 = uint(int(uint(_2325) >> uint(2)));
    uint _2329 = uint(int(uint(int(_2327)) >> uint(2)));
    int _2331 = int(_2327) & 3;
    float _2333 = (*spvDescriptorSet0.vp_c15)._m0[int(_2329)][_2331];
    int _2335 = int(_2327) + 1;
    uint _2337 = uint(int(uint(_2335) >> uint(2)));
    int _2339 = _2335 & 3;
    float _2341 = (*spvDescriptorSet0.vp_c15)._m0[int(_2337)][_2339];
    float _2343 = fma(_2095, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2323);
    float _2345 = 1.0 / _2175;
    float _2347 = fma(_2321, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2343);
    int _2349 = _1983 + 88;
    uint _2351 = uint(int(uint(_2349) >> uint(2)));
    uint _2353 = uint(int(uint(int(_2351)) >> uint(2)));
    int _2355 = int(_2351) & 3;
    float _2357 = (*spvDescriptorSet0.vp_c15)._m0[int(_2353)][_2355];
    int _2359 = int(_2351) + 1;
    uint _2361 = uint(int(uint(_2359) >> uint(2)));
    int _2363 = _2359 & 3;
    float _2365 = (*spvDescriptorSet0.vp_c15)._m0[int(_2361)][_2363];
    float _2367 = _2315 * _2211;
    float _2369 = _2315 * _2187;
    float _2371 = abs(_2287);
    float _2373 = log2(_2371);
    float _2375 = _2315 * _2215;
    float _2377 = _2323;
    if (!_2053)
    {
        int _2379 = _2151 + 400;
        uint _2381 = uint(int(uint(_2379) >> uint(2)));
        uint _2383 = uint(int(uint(int(_2381)) >> uint(2)));
        int _2385 = int(_2381) & 3;
        float _2387 = (*spvDescriptorSet0.vp_c15)._m0[int(_2383)][_2385];
        _2377 = _2387;
    }
    float _2389 = _2377;
    float _2391 = _2367 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2393 = _2243 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2395 = 1.0 / _2347;
    float _2397 = _1895 * _2241;
    float _2399 = -_2391;
    float _2401 = fma(_2369, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2399);
    float _2403 = fma(_1465, _2233, _2397);
    float _2405 = _2373 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2407 = _1895 * _2269;
    float _2409 = fma(_1539, _2197, _2403);
    float _2411 = exp2(_2405);
    float _2413 = fma(_1465, _2261, _2407);
    float _2415 = _2409 + _2205;
    float _2417 = -_2375;
    float _2419 = fma(_2417, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2401);
    float _2421 = fma(_1539, _2299, _2413);
    float _2423 = _2415 * _2345;
    float _2425 = _2401;
    if (!_2053)
    {
        float _2427 = floor(_1923);
        _2425 = _2427;
    }
    float _2429 = _2425;
    float _2431 = _2421 + _2307;
    float _2433 = fma(_2419, -0.5, 0.5);
    bool _2435 = _2423 >= 0.0;
    float _2437 = fma(_2419, 0.5, 0.5);
    float _2439 = _2431 * _2345;
    float _2441 = _1895 * _2341;
    bool _2443 = _2423 <= 1.0;
    bool _2445 = _2443 && _2435;
    float _2447 = sqrt(_2433);
    float _2449 = fma(_1465, _2333, _2441);
    bool _2451 = _2439 >= 0.0;
    bool _2453 = _2451 && _2445;
    float _2455 = fma(_1539, _2357, _2449);
    bool _2457 = _2439 <= 1.0;
    bool _2459 = _2457 && _2453;
    if (!_2053)
    {
        float _2461 = -_2429;
        float _2463 = _1923 + _2461;
        _1965 = _2463;
    }
    float _2465 = _1965;
    float _2467 = _2289 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2469 = fma(_2437, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2471 = _2455 + _2365;
    float _2473 = _2289 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2475 = _2357;
    if (!_2053)
    {
        float _2477 = floor(_1949);
        _2475 = _2477;
    }
    float _2479 = _2475;
    float _2481 = fma(_2437, _2469, -0.212114393711090087890625);
    float _2483 = fma(_2309, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2467);
    float _2485 = fma(_2309, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2473);
    float _2487 = _2369 + 1.0;
    float _2489 = fma(_2437, _2481, 1.570728778839111328125);
    float _2491 = fma(_2095, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2483);
    float _2493 = _2481;
    if (_2459)
    {
        float _2495 = float(_1975);
        _2493 = _2495;
    }
    float _2497 = _2493;
    float _2499 = _2467;
    if (!_2053)
    {
        float _2501 = rint(_2389);
        float _2503 = precise::max(_2501, 0.0);
        uint _2505 = uint(_2503);
        uint _2507 = clamp(_2505, 0u, 65535u);
        _2499 = as_type<float>(_2507);
    }
    float _2509 = _2499;
    float _2511 = fma(_2095, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2485);
    float _2513 = -_2369;
    float _2515 = fma(_2411, _2487, _2513);
    float _2517 = fma(_2321, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2491);
    float _2519 = _2447 * 0.636619746685028076171875;
    float _2521 = fma(_2321, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2511);
    float _2523 = _2471 * _2345;
    float _2525 = _2517 * _2395;
    float _2527 = _2497;
    float _2529 = _2519;
    float _2531 = _2521;
    if (_2459)
    {
        float _2533 = rint(_2497);
        float _2535 = precise::max(_2533, 0.0);
        uint _2537 = uint(_2535);
        uint _2539 = clamp(_2537, 0u, 65535u);
        _2527 = as_type<float>(_2539);
    }
    float _2541 = _2527;
    float _2543 = _2521 * _2395;
    float _2545 = -_2489;
    float _2547 = fma(_2519, _2545, 1.0);
    if (!_2053)
    {
        float _2549 = -_2479;
        float _2551 = _1949 + _2549;
        _2529 = _2551;
    }
    float _2553 = _2529;
    float _2555 = fma(_2525, 0.5, 0.5);
    float _2557 = fma(_2543, -0.5, 0.5);
    float _2559 = fma(_2515, 0.5, 0.5);
    float2 _6938 = float2(_2319, _1941);
    float _2561 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6938, float2(0.0), isnan(_6938)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6938, float2(0.0), isnan(_6938)), level(0.0)).x;
    float _2563 = _2509;
    if (!_2053)
    {
        float3 _6955 = float3(_2553, _2465, float(as_type<int>(_2509)));
        float3 _6959 = select(_6955, float3(0.0), isnan(_6955));
        float _2565 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _6959.xy, uint(rint(_6959.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _6959.xy, uint(rint(_6959.z)), level(0.0)).x;
        _2563 = _2565;
    }
    float _2567 = _2563;
    float _2569 = _2541;
    if (_2459)
    {
        float3 _6974 = float3(_2423, _2439, float(as_type<int>(_2541)));
        float3 _6976 = select(_6974, float3(0.0), isnan(_6974));
        float _2571 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _6976.xy, uint(rint(_6976.z)), _2523, level(0.0));
        _2569 = _2571;
    }
    float _2573 = _2569;
    float3 _6986 = float3(_2555, _2557, _2393);
    float _2575 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6986, float3(0.0), isnan(_6986)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6986, float3(0.0), isnan(_6986)), level(0.0)).x;
    float3 _6995 = float3(_2555, _2557, _2393);
    float4 _2577 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6995, float3(0.0), isnan(_6995)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6995, float3(0.0), isnan(_6995)), level(0.0)).xyzw;
    float _2579 = _2577.x;
    float _2581 = _2577.y;
    float _2583 = _2577.z;
    float _2585 = _2577.w;
    float2 _7011 = float2(_2547, _2559);
    float3 _2589 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7011, float2(0.0), isnan(_7011)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7011, float2(0.0), isnan(_7011)), level(0.0)).xyz;
    float _2591 = _2589.x;
    float _2593 = _2589.y;
    float _2595 = _2589.z;
    float _2597 = abs(_1927);
    float _2599 = log2(_2597);
    float _2601 = _2289 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2603 = _2373 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2605 = fma(_2309, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2601);
    float _2607 = exp2(_2603);
    float _2609 = fma(_2095, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2605);
    float _2611 = fma(_2321, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2609);
    float _2613 = _2599 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2615 = _2611 + _2347;
    out.gl_Position.x = _2517;
    out.gl_Position.y = _2521;
    out.gl_Position.z = _2611;
    out.gl_Position.w = _2347;
    float _2617 = _2615 * 0.5;
    float _2619 = exp2(_2613);
    out.m_91.z = _2617;
    out.m_91.w = _2347;
    bool _2621 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2623 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2625 = _2621 || _2623;
    bool _2627 = isnan(0.5);
    bool _2629 = _2625 || _2627;
    float _2631 = fma(_2619, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2633 = precise::clamp(_2631, 0.0, 1.0);
    float _2635 = fma(_2633, -2.0, 3.0);
    float _2637 = _2633 * _2633;
    float _2639 = _2637 * _2635;
    bool _2641 = _1927 <= 8000.0;
    bool _2643 = isnan(_1927);
    bool _2645 = _2641 || _2643;
    bool _2647 = isnan(8000.0);
    bool _2649 = _2645 || _2647;
    float _2651 = float(_2649);
    float _2653 = -_2639;
    float _2655 = _2653 + 1.0;
    float _2657 = fma(_2655, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2639);
    float _2659 = _2651 * _2657;
    float _2661 = _2651;
    if (_2629)
    {
        _2661 = 1.0;
    }
    float _2663 = _2661;
    float _2665 = _2663;
    float _2667 = _2591;
    float _2669 = _2593;
    if (!_2629)
    {
        float _2671 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2673 = _2671 * 0.15915493667125701904296875;
        float _2675 = _2673 * 6.283185482025146484375;
        float _2677 = cos(_2675);
        float _2679 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2681 = _2679 * 0.15915493667125701904296875;
        float _2683 = _2673 * 6.283185482025146484375;
        float _2685 = sin(_2683);
        float _2687 = 1.0 / _2677;
        float _2689 = _2681 * 6.283185482025146484375;
        float _2691 = cos(_2689);
        float _2693 = _2685 * _2687;
        float _2695 = _2681 * 6.283185482025146484375;
        float _2697 = sin(_2695);
        float _2699 = _2691 * _2693;
        float _2701 = 1.0 / _2699;
        float _2703 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2705 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2703;
        float _2707 = 1.0 / _2705;
        float _2709 = _2697 * _2701;
        float _2711 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2713 = fma(_1927, _2709, _2711);
        float _2715 = _2713 * _2707;
        float _2717 = precise::clamp(_2715, 0.0, 1.0);
        _2531 = _2707;
        _2665 = _2717;
    }
    float _2719 = _2531;
    float _2721 = _2665;
    float _2723 = _2659 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2725 = -_2561;
    float _2727 = _2725 + 1.0;
    float _2729 = -_2607;
    float _2731 = _2729 + 1.0;
    float _2733 = _2719;
    float _2735 = _2723;
    if (!_2459)
    {
        _2733 = 1.0;
    }
    float _2737 = _2733;
    float _2739 = _2727 * _2723;
    float _2741 = precise::clamp(_2739, 0.0, 1.0);
    float _2743 = _2737;
    if (_2459)
    {
        bool _2745 = _2573 >= _2523;
        bool _2747 = isnan(_2573);
        bool _2749 = _2745 || _2747;
        bool _2751 = isnan(_2523);
        bool _2753 = _2749 || _2751;
        float _2755 = float(_2753);
        _2743 = _2755;
    }
    float _2757 = _2743;
    float _2759 = _2731 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    if (_2053)
    {
        _2735 = 1.0;
    }
    float _2761 = _2735;
    float _2763 = _2761;
    if (!_2053)
    {
        int _2765 = _2085 << 4;
        int _2767 = _2765 + 2048;
        uint _2769 = uint(int(uint(_2767) >> uint(2)));
        uint _2771 = uint(int(uint(int(_2769)) >> uint(2)));
        int _2773 = int(_2769) & 3;
        float _2775 = (*spvDescriptorSet0.vp_c15)._m0[int(_2771)][_2773];
        int _2777 = int(_2769) + 1;
        uint _2779 = uint(int(uint(_2777) >> uint(2)));
        int _2781 = _2777 & 3;
        float _2783 = (*spvDescriptorSet0.vp_c15)._m0[int(_2779)][_2781];
        int _2785 = _2767 + 8;
        uint _2787 = uint(int(uint(_2785) >> uint(2)));
        uint _2789 = uint(int(uint(int(_2787)) >> uint(2)));
        int _2791 = int(_2787) & 3;
        float _2793 = (*spvDescriptorSet0.vp_c15)._m0[int(_2789)][_2791];
        int _2795 = int(_2787) + 1;
        uint _2797 = uint(int(uint(_2795) >> uint(2)));
        int _2799 = _2795 & 3;
        float _2801 = (*spvDescriptorSet0.vp_c15)._m0[int(_2797)][_2799];
        float _2803 = _1895 * _2783;
        float _2805 = fma(_1465, _2775, _2803);
        float _2807 = fma(_1539, _2793, _2805);
        float _2809 = _2807 + _2801;
        float _2811 = precise::clamp(_2809, 0.0, 1.0);
        float _2813 = -_2811;
        float _2815 = _2813 + _2567;
        float _2817 = fma(_2815, 500.0, 1.5);
        float _2819 = exp2(_2817);
        float _2821 = 0.0 + _2819;
        float _2823 = precise::clamp(_2821, 0.0, 1.0);
        _2763 = _2823;
        _1607 = _2811;
        _1609 = 500.0;
    }
    float _2825 = _2763;
    float _2827 = _1607;
    float _2829 = _1609;
    float _2831 = _2757 * _2825;
    float _2833 = _2759 * _2575;
    float _2835 = -_2741;
    float _2837 = fma(_2835, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2839 = -_2759;
    float _2841 = _2839 + 1.0;
    out.m_93.x = _1839;
    out.m_93.y = _1837;
    out.m_93.z = _1841;
    float _2843 = _2585 * _2833;
    float _2845 = -_2831;
    float _2847 = fma(_2845, _2837, 1.0);
    float _2849 = precise::clamp(_2847, 0.0, 1.0);
    float _2851 = _2595 * _2833;
    float _2853 = _2585 * _2841;
    float _2855 = fma(_2591, _2843, _2579);
    float _2857 = fma(_2593, _2843, _2581);
    float _2859 = _2849 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2861 = fma(_2585, _2851, _2583);
    bool _2863 = _1885 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2865 = isnan(_1885);
    bool _2867 = _2863 || _2865;
    bool _2869 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2871 = _2867 || _2869;
    float _2873 = _2721 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_95.x = _2859;
    out.m_97.x = _2855;
    out.m_97.y = _2857;
    out.m_97.z = _2861;
    out.m_97.w = _2853;
    float _2875 = _2829;
    float _2877 = _2827;
    float _2879 = _2843;
    float _2881 = _2841;
    if (!_2871)
    {
        _2667 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2883 = _2667;
    float _2885 = _2883;
    float _2887 = _2883;
    if (!_2871)
    {
        _2669 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2889 = _2669;
    float _2891 = _2889;
    float _2893 = _2889;
    if (!_2871)
    {
        _2875 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2895 = _2875;
    float _2897 = _2895;
    float _2899 = _2895;
    if (!_2871)
    {
        _2877 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2901 = _2877;
    float _2903 = _2901;
    float _2905 = _2901;
    if (!_2871)
    {
        _2879 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2907 = _2879;
    float _2909 = _2907;
    float _2911 = _2907;
    if (!_2871)
    {
        _2881 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2913 = _2881;
    bool _2915 = !_2871;
    float _2917 = _2913;
    float _2919 = _2913;
    if (!_2915)
    {
        bool _2921 = _1885 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2923 = isnan(_1885);
        bool _2925 = _2921 || _2923;
        bool _2927 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2929 = _2925 || _2927;
        if (!_2929)
        {
            float _2931 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2933 = _1885 + _2931;
            float _2935 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2937 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2935;
            float _2939 = 1.0 / _2937;
            float _2941 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2943 = _2941 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2945 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2947 = _2945 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2949 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2951 = _2949 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2953 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2955 = _2953 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2957 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2959 = _2957 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2961 = _2933 * _2939;
            float _2963 = precise::clamp(_2961, 0.0, 1.0);
            float _2965 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2967 = _2965 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2969 = fma(_2963, _2943, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2971 = fma(_2963, _2967, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2973 = fma(_2963, _2947, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2975 = fma(_2963, _2951, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2977 = fma(_2963, _2955, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2979 = fma(_2963, _2959, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2893 = _2969;
            _2911 = _2977;
            _2887 = _2971;
            _2905 = _2975;
            _2899 = _2973;
            _2919 = _2979;
            _2981 = true;
        }
        else
        {
            bool _2983 = _1885 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2985 = isnan(_1885);
            bool _2987 = _2983 || _2985;
            bool _2989 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2991 = _2987 || _2989;
            if (!_2991)
            {
                _2885 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2993 = _2885;
            _2887 = _2993;
            if (!_2991)
            {
                _2891 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2995 = _2891;
            _2893 = _2995;
            if (!_2991)
            {
                _2897 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2997 = _2897;
            _2899 = _2997;
            if (!_2991)
            {
                _2903 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2999 = _2903;
            _2905 = _2999;
            if (!_2991)
            {
                _2909 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3001 = _2909;
            _2911 = _3001;
            if (!_2991)
            {
                _2917 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3003 = _2917;
            bool _3005 = !_2991;
            _2919 = _3003;
            if (!_3005)
            {
                bool _3007 = _1885 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3009 = isnan(_1885);
                bool _3011 = _3007 || _3009;
                bool _3013 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3015 = _3011 || _3013;
                if (!_3015)
                {
                    float _3017 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3019 = _1885 + _3017;
                    float _3021 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3023 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3021;
                    float _3025 = 1.0 / _3023;
                    float _3027 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3029 = _3027 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3031 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3033 = _3031 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3035 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3037 = _3035 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3039 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3041 = _3039 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3043 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3045 = _3043 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3047 = _3019 * _3025;
                    float _3049 = precise::clamp(_3047, 0.0, 1.0);
                    float _3051 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3053 = _3051 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3055 = fma(_3049, _3029, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3057 = fma(_3049, _3053, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3059 = fma(_3049, _3033, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3061 = fma(_3049, _3037, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3063 = fma(_3049, _3041, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3065 = fma(_3049, _3045, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2893 = _3055;
                    _2911 = _3063;
                    _2887 = _3057;
                    _2905 = _3061;
                    _2899 = _3059;
                    _2919 = _3065;
                    _2981 = true;
                }
                else
                {
                    _2893 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2911 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2887 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2905 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2899 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2919 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2981 = false;
    float _3067 = _2893;
    float _3069 = _2911;
    float _3071 = _2887;
    float _3073 = _2905;
    float _3075 = _2899;
    float _3077 = _2919;
    float _3079 = fma(_1739, -0.5, 0.5);
    float _3081 = precise::clamp(_3079, 0.0, 1.0);
    float _3083 = -_3067;
    float _3085 = _3083 + _3069;
    float _3087 = -_3071;
    float _3089 = _3087 + _3073;
    out.m_99.x = 0.0;
    float _3091 = -_3075;
    float _3093 = _3091 + _3077;
    float _3095 = fma(_3081, _3085, _3067);
    out.m_101.x = 0.0;
    float _3097 = fma(_3081, _3089, _3071);
    float _3099 = _3095 * 0.586610972881317138671875;
    bool _3101 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3103 = fma(_3081, _3093, _3075);
    float _3105 = fma(_3097, 0.298911988735198974609375, _3099);
    float _3107 = _2873 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    bool _3109 = _2721 > 0.0;
    bool _3111 = isnan(_2721);
    bool _3113 = _3109 || _3111;
    bool _3115 = isnan(0.0);
    bool _3117 = _3113 || _3115;
    float _3119 = fma(_3103, 0.114477999508380889892578125, _3105);
    out.m_63.x = _3107;
    float _3121 = -_3119;
    float _3123 = _3097 + _3121;
    float _3125 = -_3119;
    float _3127 = _3095 + _3125;
    float _3129 = -_3119;
    float _3131 = _3103 + _3129;
    float _3133 = fma(_3123, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3119);
    float _3135 = fma(_3127, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3119);
    float _3137 = fma(_3131, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3119);
    bool _3139 = !_3101;
    if (!_3139)
    {
        float _3141 = -_1837;
        float _3143 = _3141 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3145 = -_1839;
        float _3147 = _3145 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3149 = -_1841;
        float _3151 = _3149 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3153 = _3143 * _3143;
        float _3155 = fma(_3147, _3147, _3153);
        float _3157 = fma(_3151, _3151, _3155);
        float _3159 = rsqrt(_3157);
        float _3161 = sqrt(_3157);
        float _3163 = _3143 * _3159;
        float _3165 = _3147 * _3159;
        float _3167 = _3151 * _3159;
        float _3169 = -_1905;
        float _3171 = _3169 + _3163;
        float _3173 = -_1899;
        float _3175 = _3173 + _3165;
        float _3177 = -_1901;
        float _3179 = _3177 + _3167;
        float _3181 = _3171 * _3171;
        float _3183 = -_3161;
        float _3185 = _3183 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3187 = fma((*spvDescriptorSet0.vp_c13)._m0[4].y, (*spvDescriptorSet0.vp_c13)._m0[4].y, 0.00999999977648258209228515625);
        float _3189 = precise::clamp(_3187, 0.0, 1.0);
        float _3191 = fma(_3175, _3175, _3181);
        float _3193 = _3185 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3195 = precise::clamp(_3193, 0.0, 1.0);
        float _3197 = _3189 * _3189;
        float _3199 = fma(_3179, _3179, _3191);
        float _3201 = _3197 + (-1.0);
        float _3203 = abs(_3195);
        float _3205 = log2(_3203);
        float _3207 = rsqrt(_3199);
        float _3209 = _3205 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3211 = exp2(_3209);
        float _3213 = _3171 * _3207;
        float _3215 = _3175 * _3207;
        float _3217 = _3179 * _3207;
        float _3219 = _3165 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3221 = _1739 * _3213;
        float _3223 = _1739 * _3163;
        float _3225 = fma(_1737, _3215, _3221);
        float _3227 = fma(_1737, _3165, _3223);
        float _3229 = fma(_1741, _3217, _3225);
        float _3231 = precise::clamp(_3229, 0.0, 1.0);
        float _3233 = fma(_1741, _3167, _3227);
        float _3235 = precise::clamp(_3233, 0.0, 1.0);
        float _3237 = _3231 * _3231;
        float _3239 = fma(_3237, _3201, 1.0);
        float _3241 = -_3163;
        float _3243 = -_3219;
        float _3245 = fma(_3241, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3243);
        float _3247 = _3239 * _3239;
        float _3249 = -_3167;
        float _3251 = fma(_3249, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3245);
        float _3253 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3255 = _3251 + _3253;
        float _3257 = 1.0 / _3247;
        float _3259 = _3255 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3261 = precise::clamp(_3259, 0.0, 1.0);
        float _3263 = _3211 * _3261;
        float _3265 = _3235 * _3263;
        float _3267 = _3265 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3269 = _3197 * _3257;
        float _3271 = _3265 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3273 = _3265 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        float _3275 = _3265 * _3269;
        out.m_99.x = _3267;
        out.m_99.y = _3271;
        out.m_99.z = _3273;
        float _3277 = _3275 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3279 = _3275 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3281 = _3275 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_101.x = _3277;
        out.m_101.y = _3279;
        out.m_101.z = _3281;
    }
    out.m_103.x = _3133;
    out.m_103.y = _3135;
    out.m_103.z = _3137;
    if (_3117)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_63.x = 0.0;
    float _3283 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3283;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

