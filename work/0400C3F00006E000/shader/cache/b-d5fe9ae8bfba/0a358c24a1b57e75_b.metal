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
    constant _16* vp_c9 [[id(1)]];
    constant _16* vp_c8 [[id(2)]];
    constant _16* vp_c10 [[id(3)]];
    constant _16* vp_c15 [[id(4)]];
    constant _16* vp_c13 [[id(5)]];
    constant _16* vp_c7 [[id(6)]];
    texture2d<float> vp_t_tcb_C [[id(7)]];
    sampler vp_t_tcb_CSmplr [[id(8)]];
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
    float4 m_67 [[user(locn0)]];
    float4 m_65 [[user(locn1)]];
    float4 m_77 [[user(locn2)]];
    float4 m_79 [[user(locn3)]];
    float4 m_89 [[user(locn4)]];
    float4 m_51 [[user(locn5)]];
    float4 m_69 [[user(locn6)]];
    float4 m_81 [[user(locn7)]];
    float4 m_87 [[user(locn8)]];
    float4 m_83 [[user(locn9)]];
    float4 m_85 [[user(locn10)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_73 [[attribute(0)]];
    float4 m_57 [[attribute(1)]];
    float4 m_55 [[attribute(2)]];
    float4 m_59 [[attribute(3)]];
    float4 m_71 [[attribute(4)]];
    float4 m_48 [[attribute(5)]];
    float4 m_53 [[attribute(6)]];
    float4 m_61 [[attribute(9)]];
    float4 m_75 [[attribute(10)]];
    float4 m_63 [[attribute(12)]];
};

static inline __attribute__((always_inline))
int _104(thread const int& _8534, thread const int& _8535, constant _10& support_buffer)
{
    float _8538 = as_type<float>(support_buffer._m4);
    int _8540 = _8535 + as_type<int>(_8538);
    int _8542 = 1 + _8540;
    float _8544 = support_buffer._m5[_8542].x;
    float _8546 = abs(_8544);
    bool _8548 = _8546 == 1.0;
    if (_8548)
    {
        return _8534;
    }
    float _8550 = float(_8534);
    float _8552 = _8550 / _8546;
    int _8554 = int(_8552);
    return _8554;
}

static inline __attribute__((always_inline))
int _105(thread const int& _8584, thread const int& _8585, constant _10& support_buffer)
{
    float _8588 = as_type<float>(support_buffer._m4);
    int _8590 = _8585 + as_type<int>(_8588);
    int _8592 = 1 + _8590;
    float _8594 = support_buffer._m5[_8592].x;
    bool _8596 = _8594 == 1.0;
    if (_8596)
    {
        return _8584;
    }
    float _8598 = float(_8584);
    float _8600 = _8598 * _8594;
    int _8602 = int(_8600);
    return _8602;
}

static inline __attribute__((always_inline))
void _102(thread const int& _8229, thread const int& _8230, thread const int& _8231, thread const int& _8232, thread int& _8233, thread int& _8234, thread int& _8235, thread int& _8236, thread int& _8237, thread int& _8238, thread float4& gl_Position, thread float& gl_PointSize)
{
    gl_PointSize = 1.0;
    int _8241 = _8232;
    int _8243 = _8230;
    float _8245 = 0.0 + as_type<float>(_8229);
    bool _8247 = _8245 != 0.0;
    bool _8249 = isnan(_8245);
    bool _8251 = _8247 || _8249;
    bool _8253 = isnan(0.0);
    bool _8255 = _8251 || _8253;
    int _8257 = as_type<int>(_8245);
    int _8259 = _8255 ? (-1) : 0;
    if (!_8255)
    {
        float _8261 = as_type<float>(_8229) * 1.0;
        _8241 = as_type<int>(_8261);
    }
    int _8263 = _8241;
    bool _8265 = !_8255;
    int _8267 = _8263;
    int _8269 = _8263;
    if (!_8265)
    {
        bool _8271 = _8245 >= 0.0;
        bool _8273 = isnan(_8245);
        bool _8275 = _8271 || _8273;
        bool _8277 = isnan(0.0);
        bool _8279 = _8275 || _8277;
        _8259 = _8279 ? (-1) : 0;
        if (!_8279)
        {
            _8267 = 2147483647;
        }
        int _8281 = _8267;
        bool _8283 = !_8279;
        int _8285 = _8281;
        _8269 = _8281;
        if (!_8283)
        {
            float _8287 = abs(as_type<float>(_8229));
            float _8289 = 0.0 + _8287;
            bool _8291 = _8289 > as_type<float>(0x7f800000u /* inf */);
            bool _8293 = isnan(_8289);
            bool _8295 = _8291 || _8293;
            bool _8297 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _8299 = _8295 || _8297;
            _8257 = as_type<int>(_8289);
            _8259 = _8299 ? (-1) : 0;
            if (_8299)
            {
                float _8301 = as_type<float>(_8229) + 1.0;
                _8285 = as_type<int>(_8301);
            }
            int _8303 = _8285;
            int _8305 = _8303;
            _8269 = _8303;
            if (!_8299)
            {
                bool _8307 = _8289 != as_type<float>(0x7f800000u /* inf */);
                bool _8309 = isnan(_8289);
                bool _8311 = _8307 || _8309;
                bool _8313 = isnan(as_type<float>(0x7f800000u /* inf */));
                bool _8315 = _8311 || _8313;
                _8259 = _8315 ? (-1) : 0;
                if (!_8315)
                {
                    _8305 = _8229;
                }
                int _8317 = _8305;
                bool _8319 = !_8315;
                _8269 = _8317;
                if (!_8319)
                {
                    float _8321 = as_type<float>(_8229) * 18446744073709551616.0;
                    float _8323 = rsqrt(_8321);
                    float _8325 = _8321 * _8323;
                    float _8327 = _8323 * 0.5;
                    float _8329 = -_8325;
                    float _8331 = 0.0 + _8329;
                    float _8333 = fma(_8327, _8331, 0.5);
                    float _8335 = fma(_8325, _8333, _8325);
                    float _8337 = -_8335;
                    float _8339 = 0.0 + _8337;
                    float _8341 = fma(_8335, _8339, _8321);
                    float _8343 = fma(_8327, _8341, _8335);
                    float _8345 = _8343 * 2.3283064365386962890625e-10;
                    _8243 = as_type<int>(_8343);
                    _8257 = as_type<int>(_8335);
                    _8269 = as_type<int>(_8345);
                }
            }
        }
    }
    int _8347 = _8243;
    int _8349 = _8257;
    int _8351 = _8269;
    int _8353 = _8259;
    _8233 = _8231;
    _8234 = 0;
    _8235 = _8347;
    _8236 = _8349;
    _8237 = _8351;
    _8238 = _8353;
}

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3113 = false;
    bool _1647 = false;
    bool _1459 = false;
    bool _359 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _109 = in.m_48.w;
    float _111 = trunc(_109);
    int _113 = int(_111);
    bool _117 = _113 >= 1;
    float _119 = 0.0;
    if (!_117)
    {
        _119 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _121 = _119;
    float _123 = _121;
    if (!_117)
    {
        out.m_51.x = 0.0;
    }
    int _125 = 0;
    if (!_117)
    {
        float _127 = _121 * 5.0;
        _125 = as_type<int>(_127);
    }
    int _129 = _125;
    int _131 = _129;
    if (!_117)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3418 = as_type<float>(_129);
        out.gl_Position.z = _3418;
    }
    if (!_117)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _133 = in.m_53.w;
    bool _135 = _133 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _137 = isnan(_133);
    bool _139 = _135 || _137;
    bool _141 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _143 = _139 || _141;
    float _145 = -_133;
    float _147 = _145 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _149 = _147;
    if (_143)
    {
        float _151 = float(_113);
        _123 = _151;
    }
    float _153 = _123;
    bool _155 = _147 >= _153;
    bool _157 = !_143;
    bool _159 = _155 || _157;
    float _161 = _153;
    if (_159)
    {
        _161 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _163 = _161;
    if (_159)
    {
        out.m_51.x = 0.0;
    }
    if (_159)
    {
        float _165 = _163 * 5.0;
        _131 = as_type<int>(_165);
    }
    int _167 = _131;
    if (_159)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3488 = as_type<float>(_167);
        out.gl_Position.z = _3488;
    }
    if (_159)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _169 = in.m_55.x;
    float _171 = in.m_55.y;
    float _173 = in.m_55.z;
    float _175 = in.m_57.x;
    float _177 = in.m_57.y;
    float _179 = in.m_57.z;
    float _181 = in.m_59.x;
    float _183 = in.m_59.y;
    float _185 = in.m_59.z;
    float _187 = in.m_61.x;
    float _189 = _169 * _169;
    float _191 = _173 * _173;
    float _193 = _171 * _171;
    float _195 = fma(_175, _175, _189);
    float _197 = fma(_179, _179, _191);
    float _199 = fma(_177, _177, _193);
    float _201 = fma(_181, _181, _195);
    float _203 = fma(_185, _185, _197);
    float _205 = fma(_183, _183, _199);
    float _207 = sqrt(_201);
    float _209 = sqrt(_203);
    float _211 = sqrt(_205);
    bool _213 = _207 > 0.0;
    bool _215 = _209 > 0.0;
    float _217 = 0.0;
    if (_213)
    {
        float _219 = rsqrt(_201);
        _217 = _219;
    }
    float _221 = _217;
    float _223 = 0.0;
    if (!_213)
    {
        _223 = 0.0;
    }
    float _225 = _223;
    bool _227 = _211 > 0.0;
    float _229 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _231 = 0.0;
    float _233 = _225;
    if (!_213)
    {
        _231 = 0.0;
    }
    float _235 = _231;
    float _237 = 0.0;
    float _239 = _235;
    if (_215)
    {
        float _241 = rsqrt(_203);
        _237 = _241;
    }
    float _243 = _237;
    float _245 = 0.0;
    if (!_213)
    {
        _245 = 0.0;
    }
    float _247 = _245;
    float _249 = _229 * _187;
    float _251 = 0.0;
    float _253 = _247;
    if (!_215)
    {
        _251 = 0.0;
    }
    float _255 = _251;
    float _257 = 0.0;
    float _259 = _255;
    if (!_215)
    {
        _257 = 0.0;
    }
    float _261 = _257;
    float _263 = 0.0;
    float _265 = _261;
    if (!_215)
    {
        _263 = 0.0;
    }
    float _267 = _263;
    float _269 = _209;
    float _271 = _267;
    if (_227)
    {
        float _273 = rsqrt(_205);
        _269 = _273;
    }
    float _275 = _269;
    if (_213)
    {
        float _277 = _221 * _175;
        _233 = _277;
    }
    float _279 = _233;
    if (_213)
    {
        float _281 = _221 * _169;
        _239 = _281;
    }
    float _283 = _239;
    if (_213)
    {
        float _285 = _221 * _181;
        _253 = _285;
    }
    float _287 = _253;
    bool _289 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _291 = 0.0;
    float _293 = 0.0;
    if (!_227)
    {
        _291 = 0.0;
        _293 = 0.0;
    }
    float _295 = _291;
    float _297 = _293;
    float _299 = 0.0;
    float _301 = _295;
    float _303 = _297;
    if (!_227)
    {
        _299 = 0.0;
    }
    float _305 = _299;
    float _307 = trunc(_249);
    int _309 = int(_307);
    float _311 = _305;
    if (_215)
    {
        float _313 = _243 * _173;
        _259 = _313;
    }
    float _315 = _259;
    if (_215)
    {
        float _317 = _243 * _179;
        _265 = _317;
    }
    float _319 = _265;
    if (_215)
    {
        float _321 = _243 * _185;
        _271 = _321;
    }
    float _323 = _271;
    if (_227)
    {
        float _325 = _275 * _177;
        _301 = _325;
    }
    float _327 = _301;
    if (_227)
    {
        float _329 = _275 * _171;
        _303 = _329;
    }
    float _331 = _303;
    if (_227)
    {
        float _333 = _275 * _183;
        _311 = _333;
    }
    float _335 = _311;
    int _337 = _309 << 4;
    int _339 = _337 + 1712;
    bool _341 = !_289;
    float _357;
    if (!_341)
    {
        float _343 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _345 = _187 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _347 = fma(_345, (*spvDescriptorSet0.vp_c9)._m0[11].y, _147);
        float _349 = _347 * _343;
        float _351 = floor(_349);
        float _353 = -_351;
        float _355 = _349 + _353;
        _357 = _355;
        _359 = true;
    }
    else
    {
        float _361 = float(_113);
        float _363 = 1.0 / _361;
        float _365 = _147 * _363;
        _357 = _365;
    }
    _359 = false;
    float _367 = _357;
    int _369 = int2(spvDescriptorSet0.vp_t_tcb_C.get_width(), spvDescriptorSet0.vp_t_tcb_C.get_height()).x;
    int _371 = _369;
    int _373 = 0;
    int _375 = _104(_371, _373, (*spvDescriptorSet0.support_buffer));
    float _377 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _379 = int(_377);
    float _381 = in.m_61.y;
    float _383 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _385 = int(_383);
    float _387 = float(_379);
    float _389 = 1.0 / _387;
    float _391 = float(uint(_385));
    int _393 = ~_385;
    int _395 = _393 + 1;
    int _397 = ~_385;
    int _399 = _397 + 1;
    float _401 = 1.0 / _391;
    float _403 = _147 * _389;
    float _405 = trunc(_403);
    int _407 = int(_405);
    int _409 = as_type<int>(_401) + (-2);
    float _411 = float(uint(_407));
    float _413 = as_type<float>(_409) * _411;
    float _415 = trunc(_413);
    float _417 = precise::max(_415, 0.0);
    uint _420 = uint(_417);
    int _422 = _395 * int(_420);
    int _424 = _422 + _407;
    float _426 = float(uint(_424));
    float _428 = as_type<float>(_409) * _426;
    int _430 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _432 = _430 != 0;
    float _434 = trunc(_428);
    float _436 = precise::max(_434, 0.0);
    uint _438 = uint(_436);
    bool _440 = !_432;
    float _442 = _440 ? 7.345489978790283203125 : 1.0;
    float _444 = _442 * _187;
    float _446 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[191].y;
    float _448 = float(_113);
    float _450 = floor(_444);
    int _452 = int(_420) + int(_438);
    float _454 = float(_385);
    float _456 = float(_407);
    int _458 = _399 * _452;
    int _460 = _458 + _407;
    float _462 = 1.0 / _448;
    bool _464 = _456 >= _454;
    bool _466 = isnan(_456);
    bool _468 = _464 || _466;
    bool _470 = isnan(_454);
    bool _472 = _468 || _470;
    float _474 = float(_472);
    bool _476 = uint(_460) >= uint(_385);
    bool _478 = !_476;
    int _480 = _478 ? 0 : (-1);
    float _482 = trunc(_474);
    int _484 = int(_482);
    float _486 = -_450;
    float _488 = _444 + _486;
    int _490 = ~_452;
    int _492 = _490 + _480;
    int _494 = _492 + 1;
    float _496 = _488 * _454;
    int _498 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _500 = _498 != 0;
    float _502 = _147 * _454;
    int _504 = _385 * _494;
    int _506 = _504 + _407;
    int _508 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _510 = _508 != 0;
    int _512 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _514 = _512 != 0;
    int _516 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _518 = _516 != 0;
    float _520 = trunc(_496);
    int _522 = int(_520);
    int _524 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _526 = _524 != 0;
    float _528 = _502 * _462;
    bool _530 = !_500;
    int _532 = _530 ? 0 : 1;
    bool _534 = _385 == 0;
    int _536 = ~_484;
    int _538 = _536 + 1;
    int _540 = _538 + 1;
    float _542 = trunc(_528);
    int _544 = int(_542);
    bool _546 = !_534;
    int _548 = _546 ? _506 : (-1);
    int _550 = _385 + (-1);
    int _552 = abs(_532);
    int _554 = _548 * _540;
    bool _556 = !_514;
    int _558 = _556 ? 0 : 1;
    int _560 = _484 * _550;
    int _562 = _560 + _554;
    int _564 = abs(_558);
    int _566 = _522 * _552;
    int _568 = _566 + _407;
    bool _570 = !_518;
    int _572 = _570 ? 0 : 1;
    float _574 = -_446;
    float _576 = _574 + (*spvDescriptorSet0.vp_c9)._m0[191].y;
    bool _578 = !_510;
    int _580 = _578 ? 0 : 1;
    int _582 = _562 * _564;
    int _584 = abs(_572);
    float _586 = fma((*spvDescriptorSet0.vp_c10)._m0[2].x, 0.0166666693985462188720703125, _187);
    int _588 = abs(_580);
    float _590 = fma(_576, _381, _446);
    bool _592 = !_526;
    int _594 = _592 ? 0 : 1;
    float _596 = _586 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    int _598 = _544 * _588;
    int _600 = _598 + _582;
    int _602 = abs(_594);
    float _604 = _596 * _590;
    int _606 = _568 * _584;
    int _608 = _606 + _600;
    int _610 = _522 * _602;
    int _612 = _610 + _608;
    float _614 = float(_375);
    int _616 = abs(_375);
    bool _618 = _375 == 0;
    float _620 = _604 * _614;
    float _622 = float(uint(_616));
    float _624 = trunc(_620);
    int _626 = int(_624);
    float _628 = 1.0 / _622;
    int _630 = abs(_626);
    uint _632 = uint(int(uint(_626) >> uint(31)));
    float _634 = float(uint(_630));
    int _636 = as_type<int>(_628) + (-2);
    float _638 = float(uint(_612));
    float _640 = as_type<float>(_636) * _634;
    float _642 = as_type<float>(_409) * _638;
    float _644 = trunc(_640);
    float _646 = precise::max(_644, 0.0);
    uint _648 = uint(_646);
    float _650 = trunc(_642);
    float _652 = precise::max(_650, 0.0);
    uint _654 = uint(_652);
    int _656 = ~int(_648);
    int _658 = _656 + 1;
    int _660 = _658 * _616;
    int _662 = _660 + _630;
    float _664 = float(uint(_662));
    float _666 = as_type<float>(_636) * _664;
    float _668 = in.m_63.z;
    float _670 = trunc(_666);
    float _672 = precise::max(_670, 0.0);
    uint _674 = uint(_672);
    int _676 = int(_648) + int(_674);
    int _678 = ~_385;
    int _680 = _678 + 1;
    int _682 = ~_676;
    int _684 = _682 + 1;
    float _686 = trunc(_668);
    int _688 = int(_686);
    int _690 = _684 * _616;
    int _692 = _690 + _630;
    bool _694 = uint(_692) >= uint(_616);
    bool _696 = !_694;
    int _698 = _696 ? 0 : (-1);
    int _700 = ~_676;
    int _702 = _700 + _698;
    int _704 = _702 + 1;
    int _706 = _704 * _616;
    int _708 = _706 + _630;
    int _710 = ~int(_632);
    int _712 = _710 + 1;
    int _714 = _680 * int(_654);
    int _716 = _714 + _612;
    int _718 = _708 ^ _712;
    int _720 = ~_712;
    int _722 = _720 + _718;
    int _724 = _722 + 1;
    float _726 = float(uint(_716));
    bool _728 = !_618;
    int _730 = _728 ? _724 : (-1);
    float _732 = as_type<float>(_409) * _726;
    int _734 = _730;
    int _736 = 0;
    int _738 = _105(_734, _736, (*spvDescriptorSet0.support_buffer));
    int _740 = _688;
    int _742 = 0;
    int _744 = _105(_740, _742, (*spvDescriptorSet0.support_buffer));
    float4 _747 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_738, _744)), 0).xyzw;
    float _749 = _747.x;
    float _751 = _747.y;
    float _753 = _747.z;
    float _755 = _747.w;
    float _757 = _187 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _759 = trunc(_732);
    float _761 = precise::max(_759, 0.0);
    uint _763 = uint(_761);
    int _765 = ~_385;
    int _767 = _765 + 1;
    float _769 = in.m_63.x;
    int _771 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _773 = _771 != 0;
    float _775 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _777 = _367 + _775;
    int _779 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _781 = _779 != 0;
    float _783 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _785 = _367 + _783;
    int _787 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _789 = _787 != 0;
    float _791 = float(uint(_568));
    bool _793 = _381 > 0.5;
    bool _795 = _793 && _789;
    bool _797 = _367 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _799 = isnan(_367);
    bool _801 = _797 || _799;
    bool _803 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _805 = _801 || _803;
    float _807 = float(_805);
    int _809 = int(_654) + int(_763);
    float _811 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _813 = -_807;
    float _815 = _813 + 1.0;
    float _817 = -_811;
    float _819 = fma(_757, 2.0, _817);
    int _821 = _767 * _809;
    int _823 = _821 + _612;
    float _825 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _827 = _825 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _829 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _831 = _829 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _833 = uint(_823) >= uint(_385);
    float _835 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _837 = _381 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _839 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _841 = !_833;
    int _843 = _841 ? 0 : (-1);
    float _845 = 1.0 / _831;
    float _847 = fma(_837, -2.0, _835);
    bool _849 = _187 > 0.5;
    bool _851 = _849 && _773;
    float _853 = fma(_187, (*spvDescriptorSet0.vp_c9)._m0[78].z, _839);
    int _855 = ~_809;
    int _857 = _855 + _843;
    int _859 = _857 + 1;
    float _861 = as_type<float>(_409) * _791;
    float _863 = -_147;
    float _865 = fma(_863, (*spvDescriptorSet0.vp_c9)._m0[76].x, _819);
    int _867 = _385 * _859;
    int _869 = _867 + _612;
    float _871 = 1.0 / _827;
    float _873 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _875 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _877 = _875 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _879 = !_534;
    int _881 = _879 ? _869 : (-1);
    float _883 = fma(_381, (*spvDescriptorSet0.vp_c9)._m0[78].w, _873);
    int _885 = ~_385;
    int _887 = _885 + 1;
    float _889 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[76].y, _847);
    float _891 = trunc(_861);
    float _893 = precise::max(_891, 0.0);
    uint _895 = uint(_893);
    int _897 = _881 >> 31;
    float _899 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _901 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _899;
    float _903 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _905 = _903 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    int _907 = _897 & 3;
    float _909 = _905 * _845;
    float _911 = 1.0 / _877;
    float _913 = _901 * _871;
    int _915 = _881 + _907;
    float _917 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _919 = _367 + _917;
    float _921 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _923 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _921;
    float _925 = 0.0;
    float _927 = _769;
    if (_773)
    {
        _925 = _769;
    }
    float _929 = _925;
    float _931 = fma(_909, _777, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    int _933 = _915 >> 2;
    int _935 = _887 * int(_895);
    int _937 = _935 + _568;
    float _939 = fma(_913, _919, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _941 = _929;
    if (_851)
    {
        float _943 = -_929;
        float _945 = _943 + 1.0;
        _941 = _945;
    }
    float _947 = _941;
    int _949 = _933 << 4;
    int _951 = _949 + 368;
    float _953 = float(uint(_937));
    uint _955 = uint(int(uint(_951) >> uint(2)));
    uint _957 = uint(int(uint(int(_955)) >> uint(2)));
    int _959 = int(_955) & 3;
    float _961 = (*spvDescriptorSet0.vp_c9)._m0[int(_957)][_959];
    int _963 = int(_955) + 1;
    uint _965 = uint(int(uint(_963) >> uint(2)));
    int _967 = _963 & 3;
    float _969 = (*spvDescriptorSet0.vp_c9)._m0[int(_965)][_967];
    float _971 = _923 * _911;
    bool _973 = _367 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _975 = isnan(_367);
    bool _977 = _973 || _975;
    bool _979 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _981 = _977 || _979;
    float _983 = float(_981);
    float _985 = as_type<float>(_409) * _953;
    bool _987 = _367 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _989 = isnan(_367);
    bool _991 = _987 || _989;
    bool _993 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _995 = _991 || _993;
    float _997 = float(_995);
    float _999 = fma(_971, _785, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    int _1001 = _881 & 3;
    bool _1003 = _1001 != 0;
    float _1005 = -_983;
    float _1007 = _1005 + 1.0;
    int _1009 = _881 & 3;
    bool _1011 = _1009 != 0;
    float _1013 = -_997;
    float _1015 = _1013 + 1.0;
    int _1017 = _1003 ? 0 : 1;
    float _1019 = _997 * _1007;
    bool _1021 = uint(_1009) > 1u;
    int _1023 = _951 + 8;
    uint _1025 = uint(int(uint(_1023) >> uint(2)));
    uint _1027 = uint(int(uint(int(_1025)) >> uint(2)));
    int _1029 = int(_1025) & 3;
    float _1031 = (*spvDescriptorSet0.vp_c9)._m0[int(_1027)][_1029];
    int _1033 = int(_1025) + 1;
    uint _1035 = uint(int(uint(_1033) >> uint(2)));
    int _1037 = _1033 & 3;
    float _1039 = (*spvDescriptorSet0.vp_c9)._m0[int(_1035)][_1037];
    float _1041 = trunc(_985);
    float _1043 = precise::max(_1041, 0.0);
    uint _1045 = uint(_1043);
    bool _1047 = _367 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1049 = isnan(_367);
    bool _1051 = _1047 || _1049;
    bool _1053 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1055 = _1051 || _1053;
    float _1057 = float(_1055);
    float _1059 = _807 * _1015;
    if (_773)
    {
        _927 = _947;
    }
    float _1061 = _927;
    bool _1063 = _1009 != 3;
    float _1065 = _1057 * _815;
    int _1067 = ~_1017;
    int _1069 = _1067 + 1;
    int _1071 = _1069 + 1;
    float _1073 = -_1057;
    float _1075 = _1073 + 1.0;
    float _1077 = _939 * _1065;
    int _1079 = _1071;
    if (!_1021)
    {
        int _1081 = ~_1017;
        int _1083 = _1081 + 1;
        _1079 = _1083;
    }
    int _1085 = _1079;
    int _1087 = _339 + 8;
    uint _1089 = uint(int(uint(_1087) >> uint(2)));
    uint _1091 = uint(int(uint(int(_1089)) >> uint(2)));
    int _1093 = int(_1089) & 3;
    float _1095 = (*spvDescriptorSet0.vp_c9)._m0[int(_1091)][_1093];
    int _1097 = ~_385;
    int _1099 = _1097 + 1;
    float _1101 = fma(_1075, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1077);
    bool _1103 = uint(_1009) >= 2u;
    int _1105 = int(_895) + int(_1045);
    float _1107 = fma(_931, _1059, _1101);
    uint _1109 = uint(int(uint(_339) >> uint(2)));
    uint _1111 = uint(int(uint(int(_1109)) >> uint(2)));
    int _1113 = int(_1109) & 3;
    float _1115 = (*spvDescriptorSet0.vp_c9)._m0[int(_1111)][_1113];
    int _1117 = int(_1109) + 1;
    uint _1119 = uint(int(uint(_1117) >> uint(2)));
    int _1121 = _1117 & 3;
    float _1123 = (*spvDescriptorSet0.vp_c9)._m0[int(_1119)][_1121];
    int _1125 = _1103 ? 0 : 1;
    float _1127 = fma(_999, _1019, _1107);
    int _1129 = abs(_1085);
    int _1131 = _1099 * _1105;
    int _1133 = _1131 + _568;
    bool _1135 = !_1011;
    int _1137 = _1135 ? 0 : 1;
    float _1139 = fma(_983, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1127);
    int _1141 = ~_1125;
    int _1143 = _1141 + 1;
    int _1145 = _1143 + 1;
    float _1147 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[77].z, _853);
    int _1149 = _1145;
    if (_1063)
    {
        int _1151 = ~_1125;
        int _1153 = _1151 + 1;
        _1149 = _1153;
    }
    int _1155 = _1149;
    float _1157 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[77].w, _883);
    int _1159 = abs(_1137);
    int _1161 = ~_1129;
    int _1163 = _1161 + 1;
    int _1165 = _1163 + 1;
    bool _1167 = _1009 != 3;
    int _1169 = _1165 * as_type<int>(_969);
    int _1171 = abs(_1155);
    float _1173 = in.m_63.y;
    bool _1175 = uint(_1133) >= uint(_385);
    int _1177 = ~_1159;
    int _1179 = _1177 + 1;
    int _1181 = _1179 + 1;
    bool _1183 = !_1167;
    int _1185 = _1183 ? 0 : (-1);
    int _1187 = _1181 * as_type<int>(_961);
    int _1189 = _1187 + _1169;
    bool _1191 = !_781;
    int _1193 = _1191 ? 0 : 1;
    int _1195 = abs(_1185);
    int _1197 = ~_1171;
    int _1199 = _1197 + 1;
    int _1201 = _1199 + 1;
    int _1203 = abs(_1193);
    int _1205 = ~_1195;
    int _1207 = _1205 + 1;
    int _1209 = _1207 + 1;
    int _1211 = _1201 * as_type<int>(_1031);
    int _1213 = _1211 + _1189;
    bool _1215 = !_1175;
    int _1217 = _1215 ? 0 : (-1);
    int _1219 = _730 + 1;
    int _1221 = _1209 * as_type<int>(_1039);
    int _1223 = _1221 + _1213;
    float _1225 = _1173;
    if (_795)
    {
        float _1227 = -_1173;
        float _1229 = _1227 + 1.0;
        _1225 = _1229;
    }
    float _1231 = _1225;
    int _1233 = ~_1105;
    int _1235 = _1233 + _1217;
    int _1237 = _1235 + 1;
    int _1239 = abs(_1219);
    float _1241 = fma(_1061, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    int _1243 = _385 * _1237;
    int _1245 = _1243 + _568;
    float _1247 = fma(_1231, (*spvDescriptorSet0.vp_c9)._m0[80].y, -0.5);
    float _1249 = fma(_1147, _1241, _865);
    float _1251 = float(uint(_1239));
    int _1253 = ~_1203;
    int _1255 = _1253 + 1;
    int _1257 = _1255 + 1;
    float _1259 = -_889;
    float _1261 = fma(_1157, _1247, _1259);
    bool _1263 = !_534;
    int _1265 = _1263 ? _1245 : (-1);
    float _1267 = as_type<float>(_636) * _1251;
    int _1269 = _1223 * _1257;
    float _1271 = _1123 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1273 = _1139 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    uint _1275 = uint(int(uint(_1219) >> uint(31)));
    int _1277 = _1265 * _1203;
    int _1279 = _1277 + _1269;
    float _1281 = trunc(_1267);
    float _1283 = precise::max(_1281, 0.0);
    uint _1285 = uint(_1283);
    float _1287 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1289 = _1115 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1291 = _1095 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1293 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1295 = _1287 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1297 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1299 = _1289 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1301 = _1293 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1303 = _1271 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1305 = _1297 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1307 = _1291 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1309 = float(_1279);
    float _1311 = _1261 + 0.5;
    int _1313 = ~int(_1275);
    int _1315 = _1313 + 1;
    out.m_65.x = _1301;
    out.m_65.y = _1305;
    out.m_65.z = _1295;
    float _1317 = _1249 + 0.5;
    out.m_67.x = _1299;
    out.m_67.y = _1303;
    out.m_67.z = _1307;
    out.m_67.w = _1273;
    out.m_69.x = _1309;
    int _1319 = ~int(_1285);
    int _1321 = _1319 + 1;
    int _1323 = _1321 * _616;
    int _1325 = _1323 + _1239;
    float _1327 = float(uint(_1325));
    float _1329 = as_type<float>(_636) * _1327;
    float _1331 = trunc(_1329);
    float _1333 = precise::max(_1331, 0.0);
    uint _1335 = uint(_1333);
    int _1337 = int(_1285) + int(_1335);
    int _1339 = ~_1337;
    int _1341 = _1339 + 1;
    int _1343 = _1341 * _616;
    int _1345 = _1343 + _1239;
    bool _1347 = uint(_1345) >= uint(_616);
    bool _1349 = !_1347;
    int _1351 = _1349 ? 0 : (-1);
    int _1353 = ~_1337;
    int _1355 = _1353 + _1351;
    int _1357 = _1355 + 1;
    int _1359 = _1357 * _616;
    int _1361 = _1359 + _1239;
    int _1363 = _1361 ^ _1315;
    int _1365 = ~_1315;
    int _1367 = _1365 + _1363;
    int _1369 = _1367 + 1;
    bool _1371 = !_618;
    int _1373 = _1371 ? _1369 : (-1);
    uint _1375 = as_type<uint>(half2(float2(_755, 0.0)));
    uint _1377 = extract_bits(_1375, 0u, 8u);
    int _1379 = int(_1377) & 255;
    uint _1381 = extract_bits(_1375, 8u, 8u);
    int _1383 = int(_1381) & 255;
    int _1385 = _1383 << 8;
    int _1387 = _1379 | _1385;
    bool _1389 = _1387 >= 32768;
    int _1391 = _1387 + (-1024);
    int _1393 = _1391;
    if (_1389)
    {
        int _1395 = ~_1387;
        int _1397 = _1395 + 33792;
        int _1399 = _1397 + 1;
        _1393 = _1399;
    }
    int _1401 = _1393;
    int _1403 = _1401 + 30719;
    float _1405 = float(_1403);
    float _1407 = fma(_1405, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _1409 = abs(_1407);
    float _1411 = -_1409;
    float _1413 = _1411 + 1.0;
    bool _1415 = _1407 < 0.0;
    float _1417 = float(_1415);
    float _1419 = abs(_1407);
    float _1421 = fma(_1419, -0.0187292993068695068359375, 0.074261002242565155029296875);
    int _1423 = as_type<int>(_1413) + (-218103808);
    float _1425 = abs(_1407);
    float _1427 = fma(_1425, _1421, -0.212114393711090087890625);
    bool _1429 = uint(_1423) >= 1920991232u;
    float _1431 = abs(_1407);
    float _1433 = fma(_1431, _1427, 1.570728778839111328125);
    bool _1435 = !_1429;
    float _1457;
    if (!_1435)
    {
        int _1437 = as_type<int>(_1413);
        int _1439 = _1351;
        int _1441 = 6448;
        int _1443 = as_type<int>(_1107);
        int _1445;
        int _1447;
        int _1449;
        int _1451;
        int _1453;
        int _1455;
        _102(_1437, _1439, _1441, _1443, _1445, _1447, _1449, _1451, _1453, _1455, out.gl_Position, out.gl_PointSize);
        _1457 = as_type<float>(_1453);
        _1459 = true;
    }
    else
    {
        float _1461 = rsqrt(_1413);
        float _1463 = _1413 * _1461;
        float _1465 = _1461 * 0.5;
        float _1467 = -_1463;
        float _1469 = 0.0 + _1467;
        float _1471 = fma(_1465, _1469, 0.5);
        float _1473 = fma(_1463, _1471, _1463);
        float _1475 = -_1473;
        float _1477 = 0.0 + _1475;
        float _1479 = fma(_1473, _1477, _1413);
        float _1481 = fma(_1465, _1479, _1473);
        _1457 = _1481;
    }
    _1459 = false;
    float _1483 = _1457;
    int _1485 = _1373;
    int _1487 = 0;
    int _1489 = _105(_1485, _1487, (*spvDescriptorSet0.support_buffer));
    int _1491 = _688;
    int _1493 = 0;
    int _1495 = _105(_1491, _1493, (*spvDescriptorSet0.support_buffer));
    float4 _1497 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_1489, _1495)), 0).xyzw;
    float _1499 = _1497.x;
    float _1501 = _1497.y;
    float _1503 = _1497.z;
    float _1505 = _1497.w;
    float _1507 = _1433 * _1483;
    float _1509 = _1417 * 2.0;
    float _1511 = _1405 * 3.883221149444580078125;
    float _1513 = floor(_620);
    float _1515 = -_1509;
    float _1517 = fma(_1507, _1515, _1507);
    float _1519 = _1511 * 0.15915493667125701904296875;
    float _1521 = fma(_1417, 3.1415927410125732421875, _1517);
    float _1523 = _1519 * 6.283185482025146484375;
    float _1525 = cos(_1523);
    float _1527 = _1521 * 0.15915493667125701904296875;
    float _1529 = _1527 * 6.283185482025146484375;
    float _1531 = sin(_1529);
    float _1533 = -_1513;
    float _1535 = _620 + _1533;
    float _1537 = _1519 * 6.283185482025146484375;
    float _1539 = sin(_1537);
    float _1541 = _1531 * _1525;
    float _1543 = _1531 * _1539;
    uint _1545 = as_type<uint>(half2(float2(_1505, 0.0)));
    float _1547 = -_749;
    float _1549 = _1547 + _1499;
    uint _1551 = extract_bits(_1545, 0u, 8u);
    int _1553 = int(_1551) & 255;
    uint _1555 = extract_bits(_1545, 8u, 8u);
    int _1557 = int(_1555) & 255;
    int _1559 = _1557 << 8;
    int _1561 = _1553 | _1559;
    float _1563 = fma(_1535, _1549, _749);
    bool _1565 = _1561 >= 32768;
    int _1567 = _1561 + (-1024);
    int _1569 = _1567;
    if (_1565)
    {
        int _1571 = ~_1561;
        int _1573 = _1571 + 33792;
        int _1575 = _1573 + 1;
        _1569 = _1575;
    }
    int _1577 = _1569;
    int _1579 = _1577 + 30719;
    float _1581 = float(_1579);
    float _1583 = -_751;
    float _1585 = _1583 + _1501;
    float _1587 = fma(_1581, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _1589 = fma(_1535, _1585, _751);
    float _1591 = abs(_1587);
    float _1593 = -_1591;
    float _1595 = _1593 + 1.0;
    float _1597 = abs(_1587);
    float _1599 = fma(_1597, -0.0187292993068695068359375, 0.074261002242565155029296875);
    bool _1601 = _1587 < 0.0;
    float _1603 = float(_1601);
    int _1605 = as_type<int>(_1595) + (-218103808);
    float _1607 = abs(_1587);
    float _1609 = fma(_1607, _1599, -0.212114393711090087890625);
    bool _1611 = uint(_1605) >= 1920991232u;
    float _1613 = -_753;
    float _1615 = _1613 + _1503;
    float _1617 = abs(_1587);
    float _1619 = fma(_1617, _1609, 1.570728778839111328125);
    float _1621 = fma(_1535, _1615, _753);
    bool _1623 = !_1611;
    float _1645;
    if (!_1623)
    {
        int _1625 = as_type<int>(_1595);
        int _1627 = as_type<int>(_1501);
        int _1629 = 7344;
        int _1631 = as_type<int>(_1527);
        int _1633;
        int _1635;
        int _1637;
        int _1639;
        int _1641;
        int _1643;
        _102(_1625, _1627, _1629, _1631, _1633, _1635, _1637, _1639, _1641, _1643, out.gl_Position, out.gl_PointSize);
        _1645 = as_type<float>(_1641);
        _1647 = true;
    }
    else
    {
        float _1649 = rsqrt(_1595);
        float _1651 = _1595 * _1649;
        float _1653 = _1649 * 0.5;
        float _1655 = -_1651;
        float _1657 = 0.0 + _1655;
        float _1659 = fma(_1653, _1657, 0.5);
        float _1661 = fma(_1651, _1659, _1651);
        float _1663 = -_1661;
        float _1665 = 0.0 + _1663;
        float _1667 = fma(_1661, _1665, _1595);
        float _1669 = fma(_1653, _1667, _1661);
        _1645 = _1669;
    }
    _1647 = false;
    float _1671 = _1645;
    float _1673 = in.m_61.x;
    float _1675 = in.m_61.y;
    float _1677 = in.m_61.z;
    float _1679 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1681 = log2(_1679);
    float _1683 = _1677 * 2.0;
    float _1685 = _1675 * 2.0;
    float _1687 = _1677 + _1673;
    float _1689 = _1673 * 2.0;
    float _1691 = _1675 + (-0.5);
    float _1693 = floor(_1685);
    float _1695 = _1687 + (-1.0);
    float _1697 = floor(_1683);
    float _1699 = fma(_1695, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1701 = floor(_1689);
    bool _1703 = _1697 > 0.0;
    bool _1705 = _1697 >= 0.0;
    bool _1707 = isnan(_1697);
    bool _1709 = _1705 || _1707;
    bool _1711 = isnan(0.0);
    bool _1713 = _1709 || _1711;
    int _1715 = _1713 ? 0 : 1;
    int _1717 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1719 = _1717 != 0;
    int _1721 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1723 = _1721 != 0;
    int _1725 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1727 = _1725 != 0;
    bool _1729 = _1693 > 0.0;
    bool _1731 = _1693 >= 0.0;
    bool _1733 = isnan(_1693);
    bool _1735 = _1731 || _1733;
    bool _1737 = isnan(0.0);
    bool _1739 = _1735 || _1737;
    float _1741 = _1681 * _147;
    int _1743 = ~_1715;
    int _1745 = _1743 + 1;
    int _1747 = _1745 + 1;
    bool _1749 = !_1719;
    int _1751 = _1749 ? 0 : 1;
    float _1753 = exp2(_1741);
    int _1755 = _1747;
    if (!_1703)
    {
        int _1757 = ~_1715;
        int _1759 = _1757 + 1;
        _1755 = _1759;
    }
    int _1761 = _1755;
    bool _1763 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1765 = isnan(1.0);
    bool _1767 = _1763 || _1765;
    bool _1769 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1771 = _1767 || _1769;
    float _1773 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1775 = 1.0 + _1773;
    int _1777 = abs(_1751);
    float _1779 = in.m_71.x;
    float _1781 = in.m_71.y;
    float _1783 = in.m_71.z;
    float _1785 = 1.0 / _1775;
    int _1787 = _1739 ? 0 : 1;
    float _1789 = _1675 + _1673;
    float _1791 = float(_1761);
    float _1793 = _1673 + (-0.5);
    float _1795 = float(_1777);
    float _1797 = _1789 + (-1.0);
    bool _1799 = !_1727;
    int _1801 = _1799 ? 0 : 1;
    float _1803 = -_1753;
    float _1805 = _1803 + 1.0;
    int _1807 = ~_1787;
    int _1809 = _1807 + 1;
    int _1811 = _1809 + 1;
    float _1813 = _1795 * _1791;
    int _1815 = _1811;
    if (!_1729)
    {
        int _1817 = ~_1787;
        int _1819 = _1817 + 1;
        _1815 = _1819;
    }
    int _1821 = _1815;
    float _1823 = fma(_1797, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _1825 = _1701 > 0.0;
    float _1827 = _1813 * (-2.0);
    bool _1829 = _1701 >= 0.0;
    bool _1831 = isnan(_1701);
    bool _1833 = _1829 || _1831;
    bool _1835 = isnan(0.0);
    bool _1837 = _1833 || _1835;
    bool _1839 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1841 = isnan(0.0);
    bool _1843 = _1839 || _1841;
    bool _1845 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1847 = _1843 || _1845;
    int _1849 = abs(_1801);
    float _1851 = _1847 ? _1805 : 0.0;
    float _1853 = float(_1849);
    float _1855 = float(_1821);
    if (_1771)
    {
        float _1857 = _1851 * _1785;
        _149 = _1857;
    }
    float _1859 = _149;
    int _1861 = _1837 ? 0 : 1;
    float _1863 = fma(_1823, _1827, _1823);
    bool _1865 = !_1723;
    int _1867 = _1865 ? 0 : 1;
    float _1869 = _1853 * _1855;
    int _1871 = ~_1861;
    int _1873 = _1871 + 1;
    int _1875 = _1873 + 1;
    int _1877 = _1875;
    if (!_1825)
    {
        int _1879 = ~_1861;
        int _1881 = _1879 + 1;
        _1877 = _1881;
    }
    int _1883 = _1877;
    float _1885 = _1869 * (-2.0);
    int _1887 = abs(_1867);
    float _1889 = fma(_1827, _1779, _1779);
    float _1891 = _1677 + (-0.5);
    float _1893 = fma(_1885, _1783, _1783);
    float _1895 = fma(_1793, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1889);
    float _1897 = float(_1883);
    float _1899 = fma(_1891, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1893);
    float _1901 = float(_1887);
    float _1903 = fma(_1863, _1859, _1895);
    float _1905 = fma(_1699, _1885, _1699);
    float _1907 = _1677 + _1675;
    float _1909 = in.m_48.x;
    float _1911 = in.m_48.y;
    float _1913 = in.m_48.z;
    float _1915 = _1901 * _1897;
    float _1917 = _1903 * 0.15915493667125701904296875;
    float _1919 = fma(_1905, _1859, _1899);
    float _1921 = in.m_59.x;
    float _1923 = in.m_59.y;
    float _1925 = in.m_59.z;
    float _1927 = in.m_59.w;
    float _1929 = _1915 * (-2.0);
    float _1931 = _1907 + (-1.0);
    float _1933 = _1919 * 0.15915493667125701904296875;
    float _1935 = in.m_57.x;
    float _1937 = in.m_57.y;
    float _1939 = in.m_57.z;
    float _1941 = in.m_57.w;
    float _1943 = fma(_1929, _1781, _1781);
    float _1945 = fma(_1931, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1947 = _1917 * 6.283185482025146484375;
    float _1949 = sin(_1947);
    float _1951 = in.m_73.y;
    float _1953 = fma(_1691, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1943);
    float _1955 = fma(_1945, _1929, _1945);
    float _1957 = in.m_75.x;
    float _1959 = in.m_75.y;
    float _1961 = in.m_75.z;
    float _1963 = fma(_1955, _1859, _1953);
    float _1965 = _1917 * 6.283185482025146484375;
    float _1967 = cos(_1965);
    float _1969 = _1963 * 0.15915493667125701904296875;
    float _1971 = _1933 * 6.283185482025146484375;
    float _1973 = sin(_1971);
    float _1975 = _1911 * _1923;
    float _1977 = _1911 * _1937;
    float _1979 = fma(_1909, _1921, _1975);
    float _1981 = _1933 * 6.283185482025146484375;
    float _1983 = cos(_1981);
    float _1985 = _1911 + _1951;
    float _1987 = fma(_1909, _1935, _1977);
    float _1989 = fma(_1913, _1925, _1979);
    float _1991 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1563);
    float _1993 = _1957 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1995 = _1959 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1997 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1589);
    float _1999 = _1969 * 6.283185482025146484375;
    float _2001 = sin(_1999);
    float _2003 = _1993 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2005 = _1995 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2007 = _1961 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _2009 = fma(_1913, _1939, _1987);
    float _2011 = _2003 * _1991;
    float _2013 = _1949 * _1973;
    float _2015 = _2005 * _1997;
    float _2017 = _1969 * 6.283185482025146484375;
    float _2019 = cos(_2017);
    float _2021 = _1967 * _1983;
    float _2023 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1621);
    float _2025 = _2007 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _2027 = _1967 * _1973;
    float _2029 = _1949 * _1983;
    float _2031 = _2009 + _1941;
    float _2033 = _2025 * _2023;
    float _2035 = fma(_2001, _2013, _2021);
    float _2037 = -_2027;
    float _2039 = fma(_2001, _2029, _2037);
    float _2041 = -_2029;
    float _2043 = fma(_2001, _2027, _2041);
    float _2045 = fma(_2001, _2021, _2013);
    float _2047 = _2035 * _2015;
    float _2049 = _2039 * _2015;
    float _2051 = _1985 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    bool _2053 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2055 = isnan(0.5);
    bool _2057 = _2053 || _2055;
    bool _2059 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2061 = _2057 || _2059;
    float _2063 = _2019 * _1973;
    float _2065 = _2019 * _1983;
    float _2067 = _1949 * _2019;
    float _2069 = _1967 * _2019;
    float _2071 = fma(_2063, _2011, _2047);
    float _2073 = fma(_2065, _2011, _2049);
    float _2075 = _2067 * _2015;
    float _2077 = fma(_2031, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2051);
    float _2079 = fma(_2043, _2033, _2071);
    float _2081 = fma(_2045, _2033, _2073);
    float _2083 = -_2001;
    float _2085 = fma(_2083, _2011, _2075);
    bool _2087 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2089 = isnan(0.5);
    bool _2091 = _2087 || _2089;
    bool _2093 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2095 = _2091 || _2093;
    float _2097 = _2079 * _335;
    float _2099 = _2079 * _327;
    float _2101 = fma(_2069, _2033, _2085);
    float _2103 = fma(_2081, _287, _2097);
    float _2105 = fma(_2081, _279, _2099);
    float _2107 = _1989 + _1927;
    float _2109 = _1985 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2111 = fma(_2101, _323, _2103);
    float _2113 = fma(_2101, _319, _2105);
    float _2115 = fma(_2107, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2077);
    float _2117 = fma(_2031, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2109);
    float _2119 = _2107 + _2111;
    float _2121 = _2031 + _2113;
    float _2123 = _2115 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2125 = fma(_2107, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2117);
    float _2127 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2129 = _2119 + _2127;
    float _2131 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2133 = _2121 + _2131;
    float _2135 = 1.0 / _2123;
    float _2137 = _2125 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2139 = _2129 * _2129;
    float _2141 = _2137 + _2123;
    float _2143 = fma(_2133, _2133, _2139);
    float _2145 = _2079 * _331;
    float _2147 = sqrt(_2143);
    float _2149 = fma(_2081, _283, _2145);
    float _2151 = _2141 * _2135;
    float _2153 = _2151 * 0.5;
    float _2155 = fma(_2101, _315, _2149);
    float _2157 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2159 = fma(_2153, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2157);
    float _2161 = _1985 + _2155;
    bool _2163 = _2147 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2165 = 1.0 / _2159;
    float _2167 = _2153;
    float _2169 = _2145;
    float _2171 = _2119;
    float _2173 = _2143;
    float _2175 = _2147;
    float _2177 = _2121;
    float _2179 = _2161;
    if (!_2163)
    {
        _2167 = _2121;
    }
    float _2181 = _2167;
    float _2183 = _2181;
    if (!_2163)
    {
        _2169 = _2161;
    }
    float _2185 = _2169;
    bool _2187 = !_2163;
    float _2189 = _2185;
    if (!_2187)
    {
        float _2191 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2193 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2195 = _2147 + _2193;
        float _2197 = _2161 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2199 = rsqrt(_2143);
        float _2201 = _2195 * _2191;
        float _2203 = _2201 * 0.15915493667125701904296875;
        float _2205 = _2203 * 6.283185482025146484375;
        float _2207 = cos(_2205);
        float _2209 = _2203 * 6.283185482025146484375;
        float _2211 = sin(_2209);
        float _2213 = _2207 + (-1.0);
        float _2215 = _2213 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2217 = fma(_2211, _2197, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2219 = fma(_2161, _2207, _2215);
        float _2221 = _2199 * _2217;
        float _2223 = fma(_2133, _2221, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2225 = fma(_2129, _2221, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2171 = _2225;
        _2183 = _2223;
        _2189 = _2219;
        _2173 = _2199;
        _2175 = _2203;
    }
    float _2227 = _2171;
    float _2229 = _2183;
    float _2231 = _2189;
    float _2233 = _2173;
    float _2235 = _2175;
    float _2237 = _2235;
    float _2239 = _2231;
    float _2241 = _2229;
    float _2243 = _2233;
    if (_2095)
    {
        _2237 = 1.0;
    }
    float _2245 = _2237;
    float _2247 = _2245;
    if (_2061)
    {
        _2177 = _2227;
    }
    float _2249 = _2177;
    float _2251 = _2249;
    if (!_2061)
    {
        float _2253 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2255 = _1985 + _2253;
        float _2257 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2259 = _2031 + _2257;
        float _2261 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2263 = -_2031;
        float _2265 = _2263 + _2229;
        float _2267 = _2255 * _2255;
        float _2269 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2271 = _2107 + _2269;
        float _2273 = -_2107;
        float _2275 = _2273 + _2227;
        float _2277 = fma(_2259, _2259, _2267);
        float _2279 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2281 = fma(_2271, _2271, _2277);
        float _2283 = sqrt(_2281);
        float _2285 = _2261 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2287 = precise::min(_2283, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2289 = _2287 * _2279;
        float _2291 = -_1985;
        float _2293 = _2291 + _2231;
        float _2295 = _2285 * _2289;
        float _2297 = fma(_2293, _2295, _1985);
        float _2299 = fma(_2265, _2295, _2031);
        float _2301 = fma(_2275, _2295, _2107);
        _2239 = _2297;
        _2241 = _2299;
        _2251 = _2301;
        _2243 = _2279;
    }
    float _2303 = _2239;
    float _2305 = _2241;
    float _2307 = _2251;
    float _2309 = _2243;
    if (_2095)
    {
        _2179 = 1.0;
    }
    float _2311 = _2179;
    float _2313 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2315 = _2165 * _2313;
    float _2317 = _2311;
    if (!_2095)
    {
        float _2319 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2321 = _2319 * 0.15915493667125701904296875;
        float _2323 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2325 = _2321 * 6.283185482025146484375;
        float _2327 = cos(_2325);
        float _2329 = _2323 * 0.15915493667125701904296875;
        float _2331 = _2321 * 6.283185482025146484375;
        float _2333 = sin(_2331);
        float _2335 = 1.0 / _2327;
        float _2337 = _2329 * 6.283185482025146484375;
        float _2339 = cos(_2337);
        float _2341 = _2333 * _2335;
        float _2343 = _2329 * 6.283185482025146484375;
        float _2345 = sin(_2343);
        float _2347 = _2339 * _2341;
        float _2349 = 1.0 / _2347;
        float _2351 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2353 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2351;
        float _2355 = 1.0 / _2353;
        float _2357 = _2345 * _2349;
        float _2359 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2361 = fma(_2315, _2357, _2359);
        float _2363 = _2361 * _2355;
        float _2365 = precise::clamp(_2363, 0.0, 1.0);
        _2247 = _2365;
    }
    float _2367 = _2247;
    if (!_2095)
    {
        float _2369 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2371 = _2369 * 0.15915493667125701904296875;
        float _2373 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2375 = _2371 * 6.283185482025146484375;
        float _2377 = cos(_2375);
        float _2379 = _2373 * 0.15915493667125701904296875;
        float _2381 = _2371 * 6.283185482025146484375;
        float _2383 = sin(_2381);
        float _2385 = 1.0 / _2377;
        float _2387 = _2379 * 6.283185482025146484375;
        float _2389 = cos(_2387);
        float _2391 = _2383 * _2385;
        float _2393 = _2379 * 6.283185482025146484375;
        float _2395 = sin(_2393);
        float _2397 = _2389 * _2391;
        float _2399 = 1.0 / _2397;
        float _2401 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2403 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2401;
        float _2405 = 1.0 / _2403;
        float _2407 = _2395 * _2399;
        float _2409 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2411 = fma(_2315, _2407, _2409);
        float _2413 = _2411 * _2405;
        float _2415 = precise::clamp(_2413, 0.0, 1.0);
        float _2417 = -_2415;
        float _2419 = _2417 + 1.0;
        _2317 = _2419;
    }
    float _2421 = _2317;
    float _2423 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2425 = _2303 + _2423;
    float _2427 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2429 = _2305 + _2427;
    float _2431 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2433 = _2307 + _2431;
    float _2435 = _2425 * _2425;
    float _2437 = fma(_2429, _2429, _2435);
    float _2439 = fma(_2433, _2433, _2437);
    float _2441 = rsqrt(_2439);
    float _2443 = sqrt(_2439);
    float _2445 = _2441 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2447 = _2429 * _2445;
    float _2449 = _2433 * _2445;
    float _2451 = _2447 * _2447;
    float _2453 = _2449 * _2449;
    float _2455 = _2451 + _2453;
    float _2457 = sqrt(_2455);
    bool _2459 = _2457 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2461 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2463 = _2457 + _2461;
    float _2465 = _2309;
    float _2467 = _2455;
    float _2469 = _2463;
    float _2471 = _2425;
    float _2473 = _2447;
    float _2475 = _2449;
    float _2477 = _2451;
    if (_2459)
    {
        float _2479 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2465 = _2479;
    }
    float _2481 = _2465;
    if (_2459)
    {
        float _2483 = rsqrt(_2455);
        _2467 = _2483;
    }
    float _2485 = _2467;
    if (_2459)
    {
        float _2487 = _2463 * _2481;
        _2469 = _2487;
    }
    float _2489 = _2469;
    float _2491 = 0.0;
    if (_2459)
    {
        float _2493 = _2489 * 0.15915493667125701904296875;
        _2491 = _2493;
    }
    float _2495 = _2491;
    float _2497 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2499 = _1969;
    float _2501 = _2497;
    if (_2459)
    {
        float _2503 = _2495 * 6.283185482025146484375;
        float _2505 = sin(_2503);
        _2499 = _2505;
    }
    float _2507 = _2499;
    float _2509 = precise::max(0.0, _2497);
    float _2511 = _2489;
    float _2513 = _2509;
    if (_2459)
    {
        float _2515 = _2495 * 6.283185482025146484375;
        float _2517 = cos(_2515);
        _2511 = _2517;
    }
    float _2519 = _2511;
    float _2521 = -_2445;
    float _2523 = -_2509;
    float _2525 = fma(_2425, _2521, _2523);
    if (_2459)
    {
        float _2527 = _2525 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2471 = _2527;
    }
    float _2529 = _2471;
    float _2531 = _2529;
    if (_2459)
    {
        float _2533 = fma(_2507, _2529, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2513 = _2533;
    }
    float _2535 = _2513;
    float _2537 = _2535;
    if (!_2459)
    {
        _2531 = _2525;
    }
    float _2539 = _2531;
    float _2541 = fma(_2031, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2543 = _2539;
    if (_2459)
    {
        float _2545 = _2485 * _2535;
        _2537 = _2545;
    }
    float _2547 = _2537;
    float _2549 = _2519;
    if (_2459)
    {
        float _2551 = _2519 + (-1.0);
        _2501 = _2551;
    }
    float _2553 = _2501;
    float _2555 = _2553;
    if (_2459)
    {
        float _2557 = _2447 * _2547;
        _2473 = _2557;
    }
    float _2559 = _2473;
    if (_2459)
    {
        float _2561 = _2449 * _2547;
        _2475 = _2561;
    }
    float _2563 = _2475;
    if (_2459)
    {
        float _2565 = _2553 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2555 = _2565;
    }
    float _2567 = _2555;
    if (_2459)
    {
        float _2569 = _2559 * _2559;
        _2477 = _2569;
    }
    float _2571 = _2477;
    if (_2459)
    {
        float _2573 = fma(_2525, _2519, _2567);
        _2543 = _2573;
    }
    float _2575 = _2543;
    float _2577 = _2303 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (!_2459)
    {
        _2549 = _2453;
    }
    float _2579 = _2549;
    float _2581 = _2579;
    if (_2459)
    {
        float _2583 = _2563 * _2563;
        _2581 = _2583;
    }
    float _2585 = _2581;
    float _2587 = fma(_2575, _2575, _2571);
    float _2589 = fma(_2305, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2577);
    float _2591 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2593 = fma(_2443, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2591);
    float _2595 = precise::clamp(_2593, 0.0, 1.0);
    float _2597 = floor(_2541);
    float _2599 = _2587 + _2585;
    float _2601 = fma(_2307, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2589);
    float _2603 = -_2595;
    float _2605 = _2603 + 1.0;
    float _2607 = fma(_2107, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2609 = _2601 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2611 = _2303 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2613 = rsqrt(_2599);
    float _2615 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2617 = _2609 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2619 = _2303 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2621 = -_2617;
    float _2623 = fma(_2621, _2615, 1.0);
    float _2625 = _2303 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2627 = fma(_2305, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2619);
    float _2629 = abs(_2605);
    float _2631 = log2(_2629);
    float _2633 = -_2597;
    float _2635 = _2541 + _2633;
    float _2637 = fma(_2305, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2625);
    float _2639 = fma(_2307, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2627);
    float _2641 = fma(_2307, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2637);
    float _2643 = _2639 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2645 = _2613 * _2559;
    float _2647 = fma(_2305, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2611);
    float _2649 = _2641 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2651 = _2643 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2653 = floor(_2607);
    float _2655 = _2613 * _2575;
    float _2657 = _2645 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2659 = fma(_2307, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2647);
    float _2661 = fma(_2649, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2651);
    float _2663 = _2613 * _2563;
    float _2665 = -_2657;
    float _2667 = fma(_2655, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2665);
    float _2669 = _2659 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2671 = fma(_2609, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2661);
    float _2673 = _2631 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2675 = -_2663;
    float _2677 = fma(_2675, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2667);
    float _2679 = log2(_2623);
    float _2681 = fma(_2669, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2671);
    float _2683 = _2643 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2685 = fma(_2677, -0.5, 0.5);
    float _2687 = fma(_2677, 0.5, 0.5);
    float _2689 = _2643 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2691 = -_2653;
    float _2693 = _2607 + _2691;
    float _2695 = fma(_2649, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2683);
    float _2697 = exp2(_2673);
    float _2699 = fma(_2649, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2689);
    float _2701 = _2655 + 1.0;
    float _2703 = fma(_2687, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2705 = 1.0 / _2681;
    float _2707 = fma(_2687, _2703, -0.212114393711090087890625);
    float _2709 = fma(_2609, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2695);
    float _2711 = fma(_2669, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2709);
    float _2713 = sqrt(_2685);
    float _2715 = -_2655;
    float _2717 = fma(_2697, _2701, _2715);
    float _2719 = fma(_2687, _2707, 1.570728778839111328125);
    float _2721 = _2679 * 0.693147182464599609375;
    float2 _7097 = float2(_2635, _2693);
    float _2723 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_7097, float2(0.0), isnan(_7097)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_7097, float2(0.0), isnan(_7097)), level(0.0)).x;
    float _2725 = fma(_2717, 0.5, 0.5);
    float _2727 = _2711 * _2705;
    float _2729 = fma(_2609, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2699);
    float _2731 = _2721 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2733 = fma(_2727, 0.5, 0.5);
    float _2735 = fma(_2669, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2729);
    float _2737 = _2713 * 0.636619746685028076171875;
    float _2739 = _2735 * _2705;
    float _2741 = -_2719;
    float _2743 = fma(_2737, _2741, 1.0);
    float _2745 = fma(_2739, -0.5, 0.5);
    float3 _7142 = float3(_2733, _2745, _2731);
    float _2747 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7142, float3(0.0), isnan(_7142)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7142, float3(0.0), isnan(_7142)), level(0.0)).x;
    float3 _7153 = float3(_2733, _2745, _2731);
    float4 _2749 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7153, float3(0.0), isnan(_7153)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7153, float3(0.0), isnan(_7153)), level(0.0)).xyzw;
    float _2751 = _2749.x;
    float _2753 = _2749.y;
    float _2755 = _2749.z;
    float _2757 = _2749.w;
    float2 _7169 = float2(_2743, _2725);
    float3 _2761 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7169, float2(0.0), isnan(_7169)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7169, float2(0.0), isnan(_7169)), level(0.0)).xyz;
    float _2763 = _2761.x;
    float _2765 = _2761.y;
    float _2767 = _2761.z;
    float _2769 = _1619 * _1671;
    float _2771 = _1603 * 2.0;
    float _2773 = _1581 * 3.883221149444580078125;
    bool _2775 = _1589 != 0.0;
    bool _2777 = isnan(_1589);
    bool _2779 = _2775 || _2777;
    bool _2781 = isnan(0.0);
    bool _2783 = _2779 || _2781;
    float _2785 = -_1407;
    float _2787 = _2785 + _1587;
    float _2789 = -_2771;
    float _2791 = fma(_2769, _2789, _2769);
    float _2793 = _2773 * 0.15915493667125701904296875;
    bool _2795 = _1563 == 0.0;
    bool _2797 = !_2783;
    bool _2799 = _2795 && _2797;
    float _2801 = fma(_1535, _2787, _1407);
    float _2803 = fma(_1603, 3.1415927410125732421875, _2791);
    float _2805 = _2793 * 6.283185482025146484375;
    float _2807 = cos(_2805);
    bool _2809 = _1621 == 0.0;
    bool _2811 = _2809 && _2799;
    out.m_77.x = _1317;
    out.m_77.y = _1311;
    float _2813 = _2803 * 0.15915493667125701904296875;
    float _2815 = _2631 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2817 = _2643 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2819 = abs(_2315);
    float _2821 = log2(_2819);
    float _2823 = fma(_2649, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2817);
    float _2825 = fma(_2609, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2823);
    float _2827 = _2801;
    float _2829 = _2681;
    if (!_2811)
    {
        float _2831 = fma(_1589, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2801);
        _2827 = _2831;
    }
    float _2833 = _2827;
    float _2835 = _2813 * 6.283185482025146484375;
    float _2837 = sin(_2835);
    bool _2839 = _2315 <= 8000.0;
    bool _2841 = isnan(_2315);
    bool _2843 = _2839 || _2841;
    bool _2845 = isnan(8000.0);
    bool _2847 = _2843 || _2845;
    float _2849 = float(_2847);
    float _2851 = _2039 * _2833;
    float _2853 = _2821 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2855 = _2793 * 6.283185482025146484375;
    float _2857 = sin(_2855);
    float _2859 = -_1541;
    float _2861 = fma(_2837, _2807, _2859);
    float _2863 = exp2(_2853);
    float _2865 = fma(_1535, _2861, _1541);
    float _2867 = _2865;
    if (!_2811)
    {
        float _2869 = fma(_1563, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2865);
        _2867 = _2869;
    }
    float _2871 = _2867;
    float _2873 = -_1543;
    float _2875 = fma(_2837, _2857, _2873);
    float _2877 = _2067 * _2833;
    float _2879 = exp2(_2815);
    float _2881 = fma(_2065, _2871, _2851);
    float _2883 = fma(_1535, _2875, _1543);
    float _2885 = -_2001;
    float _2887 = fma(_2885, _2871, _2877);
    float _2889 = in.m_73.x;
    float _2891 = fma(_2669, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2825);
    float _2893 = fma(_2863, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2895 = precise::clamp(_2893, 0.0, 1.0);
    float _2897 = _2035 * _2833;
    float _2899 = _2883;
    float _2901 = _2891;
    if (!_2811)
    {
        float _2903 = fma(_1621, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2883);
        _2899 = _2903;
    }
    float _2905 = _2899;
    bool _2907 = _2443 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2909 = isnan(_2443);
    bool _2911 = _2907 || _2909;
    bool _2913 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2915 = _2911 || _2913;
    float _2917 = fma(_2895, -2.0, 3.0);
    float _2919 = _2895 * _2895;
    float _2921 = fma(_2063, _2871, _2897);
    float _2923 = fma(_2045, _2905, _2881);
    float _2925 = fma(_2069, _2905, _2887);
    float _2927 = _2919 * _2917;
    float _2929 = fma(_2043, _2905, _2921);
    float _2931 = -_2879;
    float _2933 = _2931 + 1.0;
    float _2935 = -_2927;
    float _2937 = _2935 + 1.0;
    float _2939 = _2929 * _327;
    float _2941 = _2929 * _331;
    float _2943 = _2929 * _335;
    float _2945 = fma(_2937, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2927);
    float _2947 = fma(_2923, _279, _2939);
    float _2949 = _2933 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2951 = fma(_2923, _287, _2943);
    float _2953 = _2849 * _2945;
    float _2955 = fma(_2925, _319, _2947);
    float _2957 = _2891 + _2681;
    float _2959 = fma(_2925, _323, _2951);
    float _2961 = _2953 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.gl_Position.x = _2711;
    out.gl_Position.y = _2735;
    out.gl_Position.z = _2891;
    out.gl_Position.w = _2681;
    float _2963 = _2957 * 0.5;
    float _2965 = fma(_2923, _283, _2941);
    out.m_79.z = _2963;
    out.m_79.w = _2681;
    float _2967 = fma(_2925, _315, _2965);
    out.m_81.x = _2955;
    out.m_81.y = _2967;
    out.m_81.z = _2959;
    if (!_2915)
    {
        _2829 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2969 = _2829;
    float _2971 = _2969;
    float _2973 = _2969;
    if (!_2915)
    {
        _2901 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2975 = _2901;
    float _2977 = -_2723;
    float _2979 = _2977 + 1.0;
    float _2981 = _2979 * _2961;
    float _2983 = precise::clamp(_2981, 0.0, 1.0);
    float _2985 = -_2983;
    float _2987 = fma(_2985, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2989 = _2987 * _2889;
    float _2991 = _2989 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2993 = _2949 * _2747;
    float _2995 = -_2949;
    float _2997 = _2995 + 1.0;
    out.m_83.x = _2991;
    float _2999 = _2757 * _2993;
    float _3001 = _2767 * _2993;
    float _3003 = _2757 * _2997;
    float _3005 = _2367 * _2421;
    float _3007 = fma(_2763, _2999, _2751);
    float _3009 = fma(_2765, _2999, _2753);
    float _3011 = fma(_2757, _3001, _2755);
    float _3013 = _3005 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3015 = _2753;
    float _3017 = _2751;
    float _3019 = _2999;
    float _3021 = _3005;
    float _3023 = _2975;
    float _3025 = _2975;
    if (!_2915)
    {
        _3015 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3027 = _3015;
    float _3029 = _3027;
    float _3031 = _3027;
    if (!_2915)
    {
        _3017 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3033 = _3017;
    out.m_85.x = _3007;
    out.m_85.y = _3009;
    out.m_85.z = _3011;
    out.m_85.w = _3003;
    float _3035 = _3033;
    float _3037 = _3033;
    if (!_2915)
    {
        _3019 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3039 = _3019;
    float _3041 = _3039;
    float _3043 = _3039;
    if (!_2915)
    {
        _3021 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3045 = _3021;
    bool _3047 = !_2915;
    float _3049 = _3045;
    float _3051 = _3045;
    if (!_3047)
    {
        bool _3053 = _2443 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3055 = isnan(_2443);
        bool _3057 = _3053 || _3055;
        bool _3059 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3061 = _3057 || _3059;
        if (!_3061)
        {
            float _3063 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3065 = _2443 + _3063;
            float _3067 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3069 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3067;
            float _3071 = 1.0 / _3069;
            float _3073 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3075 = _3073 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3077 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3079 = _3077 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3081 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3083 = _3081 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3085 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3087 = _3085 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3089 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3091 = _3089 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3093 = _3065 * _3071;
            float _3095 = precise::clamp(_3093, 0.0, 1.0);
            float _3097 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3099 = _3097 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3101 = fma(_3095, _3075, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3103 = fma(_3095, _3099, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3105 = fma(_3095, _3079, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3107 = fma(_3095, _3083, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3109 = fma(_3095, _3087, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3111 = fma(_3095, _3091, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3037 = _3103;
            _3043 = _3109;
            _3031 = _3101;
            _3025 = _3107;
            _2973 = _3105;
            _3051 = _3111;
            _3113 = true;
        }
        else
        {
            bool _3115 = _2443 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3117 = isnan(_2443);
            bool _3119 = _3115 || _3117;
            bool _3121 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3123 = _3119 || _3121;
            if (!_3123)
            {
                _3029 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3125 = _3029;
            _3031 = _3125;
            if (!_3123)
            {
                _3035 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3127 = _3035;
            _3037 = _3127;
            if (!_3123)
            {
                _2971 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3129 = _2971;
            _2973 = _3129;
            if (!_3123)
            {
                _3023 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3131 = _3023;
            _3025 = _3131;
            if (!_3123)
            {
                _3041 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3133 = _3041;
            _3043 = _3133;
            if (!_3123)
            {
                _3049 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3135 = _3049;
            bool _3137 = !_3123;
            _3051 = _3135;
            if (!_3137)
            {
                bool _3139 = _2443 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3141 = isnan(_2443);
                bool _3143 = _3139 || _3141;
                bool _3145 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3147 = _3143 || _3145;
                if (!_3147)
                {
                    float _3149 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3151 = _2443 + _3149;
                    float _3153 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3155 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3153;
                    float _3157 = 1.0 / _3155;
                    float _3159 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3161 = _3159 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3163 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3165 = _3163 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3167 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3169 = _3167 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3171 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3173 = _3171 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3175 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3177 = _3175 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3179 = _3151 * _3157;
                    float _3181 = precise::clamp(_3179, 0.0, 1.0);
                    float _3183 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3185 = _3183 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3187 = fma(_3181, _3161, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3189 = fma(_3181, _3185, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3191 = fma(_3181, _3165, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3193 = fma(_3181, _3169, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3195 = fma(_3181, _3173, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3197 = fma(_3181, _3177, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3037 = _3189;
                    _3043 = _3195;
                    _3031 = _3187;
                    _3025 = _3193;
                    _2973 = _3191;
                    _3051 = _3197;
                    _3113 = true;
                }
                else
                {
                    _3037 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3043 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3031 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3025 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2973 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3051 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3113 = false;
    float _3199 = _3037;
    float _3201 = _3043;
    float _3203 = _3031;
    float _3205 = _3025;
    float _3207 = _2973;
    float _3209 = _3051;
    float _3211 = fma(_2967, -0.5, 0.5);
    float _3213 = precise::clamp(_3211, 0.0, 1.0);
    float _3215 = -_3199;
    float _3217 = _3215 + _3201;
    float _3219 = _3013 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3221 = -_3203;
    float _3223 = _3221 + _3205;
    float _3225 = fma(_3213, _3217, _3199);
    out.m_87.x = 0.0;
    float _3227 = -_3207;
    float _3229 = _3227 + _3209;
    float _3231 = fma(_3213, _3223, _3203);
    float _3233 = _3225 * 0.586610972881317138671875;
    out.m_51.x = _3219;
    bool _3235 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3237 = fma(_3213, _3229, _3207);
    float _3239 = fma(_3231, 0.298911988735198974609375, _3233);
    bool _3241 = _2367 > 0.0;
    bool _3243 = isnan(_2367);
    bool _3245 = _3241 || _3243;
    bool _3247 = isnan(0.0);
    bool _3249 = _3245 || _3247;
    float _3251 = fma(_3237, 0.114477999508380889892578125, _3239);
    bool _3253 = _2421 <= 0.0;
    bool _3255 = !_3249;
    bool _3257 = _3253 || _3255;
    float _3259 = -_3251;
    float _3261 = _3231 + _3259;
    float _3263 = -_3251;
    float _3265 = _3225 + _3263;
    float _3267 = -_3251;
    float _3269 = _3237 + _3267;
    float _3271 = fma(_3261, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3251);
    float _3273 = fma(_3265, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3251);
    float _3275 = fma(_3269, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3251);
    bool _3277 = !_3235;
    if (!_3277)
    {
        float _3279 = -_2303;
        float _3281 = _3279 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3283 = -_2305;
        float _3285 = _3283 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3287 = -_2307;
        float _3289 = _3287 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3291 = _3281 * _3281;
        float _3293 = fma(_3285, _3285, _3291);
        float _3295 = fma(_3289, _3289, _3293);
        float _3297 = sqrt(_3295);
        float _3299 = rsqrt(_3295);
        float _3301 = -_3297;
        float _3303 = _3301 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3305 = _3303 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3307 = precise::clamp(_3305, 0.0, 1.0);
        float _3309 = _3285 * _3299;
        float _3311 = _3281 * _3299;
        float _3313 = abs(_3307);
        float _3315 = log2(_3313);
        float _3317 = _3289 * _3299;
        float _3319 = _3309 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3321 = _2967 * _3311;
        float _3323 = -_3311;
        float _3325 = -_3319;
        float _3327 = fma(_3323, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3325);
        float _3329 = fma(_2955, _3309, _3321);
        float _3331 = -_3317;
        float _3333 = fma(_3331, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3327);
        float _3335 = fma(_2959, _3317, _3329);
        float _3337 = precise::clamp(_3335, 0.0, 1.0);
        float _3339 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3341 = _3333 + _3339;
        float _3343 = _3315 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3345 = _3341 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3347 = precise::clamp(_3345, 0.0, 1.0);
        float _3349 = exp2(_3343);
        float _3351 = _3349 * _3347;
        float _3353 = _3337 * _3351;
        float _3355 = _3353 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3357 = _3353 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3359 = _3353 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_87.x = _3355;
        out.m_87.y = _3357;
        out.m_87.z = _3359;
    }
    out.m_89.x = _3271;
    out.m_89.y = _3273;
    out.m_89.z = _3275;
    if (!_3257)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_51.x = 0.0;
    float _3361 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3361;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3113 = false;
    bool _1647 = false;
    bool _1459 = false;
    bool _359 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _109 = in.m_48.w;
    float _111 = trunc(_109);
    int _113 = int(_111);
    bool _117 = _113 >= 1;
    float _119 = 0.0;
    if (!_117)
    {
        _119 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _121 = _119;
    float _123 = _121;
    if (!_117)
    {
        out.m_51.x = 0.0;
    }
    int _125 = 0;
    if (!_117)
    {
        float _127 = _121 * 5.0;
        _125 = as_type<int>(_127);
    }
    int _129 = _125;
    int _131 = _129;
    if (!_117)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3418 = as_type<float>(_129);
        out.gl_Position.z = _3418;
    }
    if (!_117)
    {
        return out;
    }
    float _133 = in.m_53.w;
    bool _135 = _133 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _137 = isnan(_133);
    bool _139 = _135 || _137;
    bool _141 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _143 = _139 || _141;
    float _145 = -_133;
    float _147 = _145 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _149 = _147;
    if (_143)
    {
        float _151 = float(_113);
        _123 = _151;
    }
    float _153 = _123;
    bool _155 = _147 >= _153;
    bool _157 = !_143;
    bool _159 = _155 || _157;
    float _161 = _153;
    if (_159)
    {
        _161 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _163 = _161;
    if (_159)
    {
        out.m_51.x = 0.0;
    }
    if (_159)
    {
        float _165 = _163 * 5.0;
        _131 = as_type<int>(_165);
    }
    int _167 = _131;
    if (_159)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3488 = as_type<float>(_167);
        out.gl_Position.z = _3488;
    }
    if (_159)
    {
        return out;
    }
    float _169 = in.m_55.x;
    float _171 = in.m_55.y;
    float _173 = in.m_55.z;
    float _175 = in.m_57.x;
    float _177 = in.m_57.y;
    float _179 = in.m_57.z;
    float _181 = in.m_59.x;
    float _183 = in.m_59.y;
    float _185 = in.m_59.z;
    float _187 = in.m_61.x;
    float _189 = _169 * _169;
    float _191 = _173 * _173;
    float _193 = _171 * _171;
    float _195 = fma(_175, _175, _189);
    float _197 = fma(_179, _179, _191);
    float _199 = fma(_177, _177, _193);
    float _201 = fma(_181, _181, _195);
    float _203 = fma(_185, _185, _197);
    float _205 = fma(_183, _183, _199);
    float _207 = sqrt(_201);
    float _209 = sqrt(_203);
    float _211 = sqrt(_205);
    bool _213 = _207 > 0.0;
    bool _215 = _209 > 0.0;
    float _217 = 0.0;
    if (_213)
    {
        float _219 = rsqrt(_201);
        _217 = _219;
    }
    float _221 = _217;
    float _223 = 0.0;
    if (!_213)
    {
        _223 = 0.0;
    }
    float _225 = _223;
    bool _227 = _211 > 0.0;
    float _229 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _231 = 0.0;
    float _233 = _225;
    if (!_213)
    {
        _231 = 0.0;
    }
    float _235 = _231;
    float _237 = 0.0;
    float _239 = _235;
    if (_215)
    {
        float _241 = rsqrt(_203);
        _237 = _241;
    }
    float _243 = _237;
    float _245 = 0.0;
    if (!_213)
    {
        _245 = 0.0;
    }
    float _247 = _245;
    float _249 = _229 * _187;
    float _251 = 0.0;
    float _253 = _247;
    if (!_215)
    {
        _251 = 0.0;
    }
    float _255 = _251;
    float _257 = 0.0;
    float _259 = _255;
    if (!_215)
    {
        _257 = 0.0;
    }
    float _261 = _257;
    float _263 = 0.0;
    float _265 = _261;
    if (!_215)
    {
        _263 = 0.0;
    }
    float _267 = _263;
    float _269 = _209;
    float _271 = _267;
    if (_227)
    {
        float _273 = rsqrt(_205);
        _269 = _273;
    }
    float _275 = _269;
    if (_213)
    {
        float _277 = _221 * _175;
        _233 = _277;
    }
    float _279 = _233;
    if (_213)
    {
        float _281 = _221 * _169;
        _239 = _281;
    }
    float _283 = _239;
    if (_213)
    {
        float _285 = _221 * _181;
        _253 = _285;
    }
    float _287 = _253;
    bool _289 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _291 = 0.0;
    float _293 = 0.0;
    if (!_227)
    {
        _291 = 0.0;
        _293 = 0.0;
    }
    float _295 = _291;
    float _297 = _293;
    float _299 = 0.0;
    float _301 = _295;
    float _303 = _297;
    if (!_227)
    {
        _299 = 0.0;
    }
    float _305 = _299;
    float _307 = trunc(_249);
    int _309 = int(_307);
    float _311 = _305;
    if (_215)
    {
        float _313 = _243 * _173;
        _259 = _313;
    }
    float _315 = _259;
    if (_215)
    {
        float _317 = _243 * _179;
        _265 = _317;
    }
    float _319 = _265;
    if (_215)
    {
        float _321 = _243 * _185;
        _271 = _321;
    }
    float _323 = _271;
    if (_227)
    {
        float _325 = _275 * _177;
        _301 = _325;
    }
    float _327 = _301;
    if (_227)
    {
        float _329 = _275 * _171;
        _303 = _329;
    }
    float _331 = _303;
    if (_227)
    {
        float _333 = _275 * _183;
        _311 = _333;
    }
    float _335 = _311;
    int _337 = _309 << 4;
    int _339 = _337 + 1712;
    bool _341 = !_289;
    float _357;
    if (!_341)
    {
        float _343 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _345 = _187 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _347 = fma(_345, (*spvDescriptorSet0.vp_c9)._m0[11].y, _147);
        float _349 = _347 * _343;
        float _351 = floor(_349);
        float _353 = -_351;
        float _355 = _349 + _353;
        _357 = _355;
        _359 = true;
    }
    else
    {
        float _361 = float(_113);
        float _363 = 1.0 / _361;
        float _365 = _147 * _363;
        _357 = _365;
    }
    _359 = false;
    float _367 = _357;
    int _369 = int2(spvDescriptorSet0.vp_t_tcb_C.get_width(), spvDescriptorSet0.vp_t_tcb_C.get_height()).x;
    int _371 = _369;
    int _373 = 0;
    int _375 = _104(_371, _373, (*spvDescriptorSet0.support_buffer));
    float _377 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _379 = int(_377);
    float _381 = in.m_61.y;
    float _383 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _385 = int(_383);
    float _387 = float(_379);
    float _389 = 1.0 / _387;
    float _391 = float(uint(_385));
    int _393 = ~_385;
    int _395 = _393 + 1;
    int _397 = ~_385;
    int _399 = _397 + 1;
    float _401 = 1.0 / _391;
    float _403 = _147 * _389;
    float _405 = trunc(_403);
    int _407 = int(_405);
    int _409 = as_type<int>(_401) + (-2);
    float _411 = float(uint(_407));
    float _413 = as_type<float>(_409) * _411;
    float _415 = trunc(_413);
    float _417 = precise::max(_415, 0.0);
    uint _420 = uint(_417);
    int _422 = _395 * int(_420);
    int _424 = _422 + _407;
    float _426 = float(uint(_424));
    float _428 = as_type<float>(_409) * _426;
    int _430 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _432 = _430 != 0;
    float _434 = trunc(_428);
    float _436 = precise::max(_434, 0.0);
    uint _438 = uint(_436);
    bool _440 = !_432;
    float _442 = _440 ? 7.345489978790283203125 : 1.0;
    float _444 = _442 * _187;
    float _446 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[191].y;
    float _448 = float(_113);
    float _450 = floor(_444);
    int _452 = int(_420) + int(_438);
    float _454 = float(_385);
    float _456 = float(_407);
    int _458 = _399 * _452;
    int _460 = _458 + _407;
    float _462 = 1.0 / _448;
    bool _464 = _456 >= _454;
    bool _466 = isnan(_456);
    bool _468 = _464 || _466;
    bool _470 = isnan(_454);
    bool _472 = _468 || _470;
    float _474 = float(_472);
    bool _476 = uint(_460) >= uint(_385);
    bool _478 = !_476;
    int _480 = _478 ? 0 : (-1);
    float _482 = trunc(_474);
    int _484 = int(_482);
    float _486 = -_450;
    float _488 = _444 + _486;
    int _490 = ~_452;
    int _492 = _490 + _480;
    int _494 = _492 + 1;
    float _496 = _488 * _454;
    int _498 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _500 = _498 != 0;
    float _502 = _147 * _454;
    int _504 = _385 * _494;
    int _506 = _504 + _407;
    int _508 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _510 = _508 != 0;
    int _512 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _514 = _512 != 0;
    int _516 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _518 = _516 != 0;
    float _520 = trunc(_496);
    int _522 = int(_520);
    int _524 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _526 = _524 != 0;
    float _528 = _502 * _462;
    bool _530 = !_500;
    int _532 = _530 ? 0 : 1;
    bool _534 = _385 == 0;
    int _536 = ~_484;
    int _538 = _536 + 1;
    int _540 = _538 + 1;
    float _542 = trunc(_528);
    int _544 = int(_542);
    bool _546 = !_534;
    int _548 = _546 ? _506 : (-1);
    int _550 = _385 + (-1);
    int _552 = abs(_532);
    int _554 = _548 * _540;
    bool _556 = !_514;
    int _558 = _556 ? 0 : 1;
    int _560 = _484 * _550;
    int _562 = _560 + _554;
    int _564 = abs(_558);
    int _566 = _522 * _552;
    int _568 = _566 + _407;
    bool _570 = !_518;
    int _572 = _570 ? 0 : 1;
    float _574 = -_446;
    float _576 = _574 + (*spvDescriptorSet0.vp_c9)._m0[191].y;
    bool _578 = !_510;
    int _580 = _578 ? 0 : 1;
    int _582 = _562 * _564;
    int _584 = abs(_572);
    float _586 = fma((*spvDescriptorSet0.vp_c10)._m0[2].x, 0.0166666693985462188720703125, _187);
    int _588 = abs(_580);
    float _590 = fma(_576, _381, _446);
    bool _592 = !_526;
    int _594 = _592 ? 0 : 1;
    float _596 = _586 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    int _598 = _544 * _588;
    int _600 = _598 + _582;
    int _602 = abs(_594);
    float _604 = _596 * _590;
    int _606 = _568 * _584;
    int _608 = _606 + _600;
    int _610 = _522 * _602;
    int _612 = _610 + _608;
    float _614 = float(_375);
    int _616 = abs(_375);
    bool _618 = _375 == 0;
    float _620 = _604 * _614;
    float _622 = float(uint(_616));
    float _624 = trunc(_620);
    int _626 = int(_624);
    float _628 = 1.0 / _622;
    int _630 = abs(_626);
    uint _632 = uint(int(uint(_626) >> uint(31)));
    float _634 = float(uint(_630));
    int _636 = as_type<int>(_628) + (-2);
    float _638 = float(uint(_612));
    float _640 = as_type<float>(_636) * _634;
    float _642 = as_type<float>(_409) * _638;
    float _644 = trunc(_640);
    float _646 = precise::max(_644, 0.0);
    uint _648 = uint(_646);
    float _650 = trunc(_642);
    float _652 = precise::max(_650, 0.0);
    uint _654 = uint(_652);
    int _656 = ~int(_648);
    int _658 = _656 + 1;
    int _660 = _658 * _616;
    int _662 = _660 + _630;
    float _664 = float(uint(_662));
    float _666 = as_type<float>(_636) * _664;
    float _668 = in.m_63.z;
    float _670 = trunc(_666);
    float _672 = precise::max(_670, 0.0);
    uint _674 = uint(_672);
    int _676 = int(_648) + int(_674);
    int _678 = ~_385;
    int _680 = _678 + 1;
    int _682 = ~_676;
    int _684 = _682 + 1;
    float _686 = trunc(_668);
    int _688 = int(_686);
    int _690 = _684 * _616;
    int _692 = _690 + _630;
    bool _694 = uint(_692) >= uint(_616);
    bool _696 = !_694;
    int _698 = _696 ? 0 : (-1);
    int _700 = ~_676;
    int _702 = _700 + _698;
    int _704 = _702 + 1;
    int _706 = _704 * _616;
    int _708 = _706 + _630;
    int _710 = ~int(_632);
    int _712 = _710 + 1;
    int _714 = _680 * int(_654);
    int _716 = _714 + _612;
    int _718 = _708 ^ _712;
    int _720 = ~_712;
    int _722 = _720 + _718;
    int _724 = _722 + 1;
    float _726 = float(uint(_716));
    bool _728 = !_618;
    int _730 = _728 ? _724 : (-1);
    float _732 = as_type<float>(_409) * _726;
    int _734 = _730;
    int _736 = 0;
    int _738 = _105(_734, _736, (*spvDescriptorSet0.support_buffer));
    int _740 = _688;
    int _742 = 0;
    int _744 = _105(_740, _742, (*spvDescriptorSet0.support_buffer));
    float4 _747 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_738, _744)), 0).xyzw;
    float _749 = _747.x;
    float _751 = _747.y;
    float _753 = _747.z;
    float _755 = _747.w;
    float _757 = _187 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _759 = trunc(_732);
    float _761 = precise::max(_759, 0.0);
    uint _763 = uint(_761);
    int _765 = ~_385;
    int _767 = _765 + 1;
    float _769 = in.m_63.x;
    int _771 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _773 = _771 != 0;
    float _775 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _777 = _367 + _775;
    int _779 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _781 = _779 != 0;
    float _783 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _785 = _367 + _783;
    int _787 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _789 = _787 != 0;
    float _791 = float(uint(_568));
    bool _793 = _381 > 0.5;
    bool _795 = _793 && _789;
    bool _797 = _367 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _799 = isnan(_367);
    bool _801 = _797 || _799;
    bool _803 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _805 = _801 || _803;
    float _807 = float(_805);
    int _809 = int(_654) + int(_763);
    float _811 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _813 = -_807;
    float _815 = _813 + 1.0;
    float _817 = -_811;
    float _819 = fma(_757, 2.0, _817);
    int _821 = _767 * _809;
    int _823 = _821 + _612;
    float _825 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _827 = _825 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _829 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _831 = _829 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _833 = uint(_823) >= uint(_385);
    float _835 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _837 = _381 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _839 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _841 = !_833;
    int _843 = _841 ? 0 : (-1);
    float _845 = 1.0 / _831;
    float _847 = fma(_837, -2.0, _835);
    bool _849 = _187 > 0.5;
    bool _851 = _849 && _773;
    float _853 = fma(_187, (*spvDescriptorSet0.vp_c9)._m0[78].z, _839);
    int _855 = ~_809;
    int _857 = _855 + _843;
    int _859 = _857 + 1;
    float _861 = as_type<float>(_409) * _791;
    float _863 = -_147;
    float _865 = fma(_863, (*spvDescriptorSet0.vp_c9)._m0[76].x, _819);
    int _867 = _385 * _859;
    int _869 = _867 + _612;
    float _871 = 1.0 / _827;
    float _873 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _875 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _877 = _875 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _879 = !_534;
    int _881 = _879 ? _869 : (-1);
    float _883 = fma(_381, (*spvDescriptorSet0.vp_c9)._m0[78].w, _873);
    int _885 = ~_385;
    int _887 = _885 + 1;
    float _889 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[76].y, _847);
    float _891 = trunc(_861);
    float _893 = precise::max(_891, 0.0);
    uint _895 = uint(_893);
    int _897 = _881 >> 31;
    float _899 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _901 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _899;
    float _903 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _905 = _903 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    int _907 = _897 & 3;
    float _909 = _905 * _845;
    float _911 = 1.0 / _877;
    float _913 = _901 * _871;
    int _915 = _881 + _907;
    float _917 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _919 = _367 + _917;
    float _921 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _923 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _921;
    float _925 = 0.0;
    float _927 = _769;
    if (_773)
    {
        _925 = _769;
    }
    float _929 = _925;
    float _931 = fma(_909, _777, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    int _933 = _915 >> 2;
    int _935 = _887 * int(_895);
    int _937 = _935 + _568;
    float _939 = fma(_913, _919, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _941 = _929;
    if (_851)
    {
        float _943 = -_929;
        float _945 = _943 + 1.0;
        _941 = _945;
    }
    float _947 = _941;
    int _949 = _933 << 4;
    int _951 = _949 + 368;
    float _953 = float(uint(_937));
    uint _955 = uint(int(uint(_951) >> uint(2)));
    uint _957 = uint(int(uint(int(_955)) >> uint(2)));
    int _959 = int(_955) & 3;
    float _961 = (*spvDescriptorSet0.vp_c9)._m0[int(_957)][_959];
    int _963 = int(_955) + 1;
    uint _965 = uint(int(uint(_963) >> uint(2)));
    int _967 = _963 & 3;
    float _969 = (*spvDescriptorSet0.vp_c9)._m0[int(_965)][_967];
    float _971 = _923 * _911;
    bool _973 = _367 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _975 = isnan(_367);
    bool _977 = _973 || _975;
    bool _979 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _981 = _977 || _979;
    float _983 = float(_981);
    float _985 = as_type<float>(_409) * _953;
    bool _987 = _367 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _989 = isnan(_367);
    bool _991 = _987 || _989;
    bool _993 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _995 = _991 || _993;
    float _997 = float(_995);
    float _999 = fma(_971, _785, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    int _1001 = _881 & 3;
    bool _1003 = _1001 != 0;
    float _1005 = -_983;
    float _1007 = _1005 + 1.0;
    int _1009 = _881 & 3;
    bool _1011 = _1009 != 0;
    float _1013 = -_997;
    float _1015 = _1013 + 1.0;
    int _1017 = _1003 ? 0 : 1;
    float _1019 = _997 * _1007;
    bool _1021 = uint(_1009) > 1u;
    int _1023 = _951 + 8;
    uint _1025 = uint(int(uint(_1023) >> uint(2)));
    uint _1027 = uint(int(uint(int(_1025)) >> uint(2)));
    int _1029 = int(_1025) & 3;
    float _1031 = (*spvDescriptorSet0.vp_c9)._m0[int(_1027)][_1029];
    int _1033 = int(_1025) + 1;
    uint _1035 = uint(int(uint(_1033) >> uint(2)));
    int _1037 = _1033 & 3;
    float _1039 = (*spvDescriptorSet0.vp_c9)._m0[int(_1035)][_1037];
    float _1041 = trunc(_985);
    float _1043 = precise::max(_1041, 0.0);
    uint _1045 = uint(_1043);
    bool _1047 = _367 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1049 = isnan(_367);
    bool _1051 = _1047 || _1049;
    bool _1053 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1055 = _1051 || _1053;
    float _1057 = float(_1055);
    float _1059 = _807 * _1015;
    if (_773)
    {
        _927 = _947;
    }
    float _1061 = _927;
    bool _1063 = _1009 != 3;
    float _1065 = _1057 * _815;
    int _1067 = ~_1017;
    int _1069 = _1067 + 1;
    int _1071 = _1069 + 1;
    float _1073 = -_1057;
    float _1075 = _1073 + 1.0;
    float _1077 = _939 * _1065;
    int _1079 = _1071;
    if (!_1021)
    {
        int _1081 = ~_1017;
        int _1083 = _1081 + 1;
        _1079 = _1083;
    }
    int _1085 = _1079;
    int _1087 = _339 + 8;
    uint _1089 = uint(int(uint(_1087) >> uint(2)));
    uint _1091 = uint(int(uint(int(_1089)) >> uint(2)));
    int _1093 = int(_1089) & 3;
    float _1095 = (*spvDescriptorSet0.vp_c9)._m0[int(_1091)][_1093];
    int _1097 = ~_385;
    int _1099 = _1097 + 1;
    float _1101 = fma(_1075, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1077);
    bool _1103 = uint(_1009) >= 2u;
    int _1105 = int(_895) + int(_1045);
    float _1107 = fma(_931, _1059, _1101);
    uint _1109 = uint(int(uint(_339) >> uint(2)));
    uint _1111 = uint(int(uint(int(_1109)) >> uint(2)));
    int _1113 = int(_1109) & 3;
    float _1115 = (*spvDescriptorSet0.vp_c9)._m0[int(_1111)][_1113];
    int _1117 = int(_1109) + 1;
    uint _1119 = uint(int(uint(_1117) >> uint(2)));
    int _1121 = _1117 & 3;
    float _1123 = (*spvDescriptorSet0.vp_c9)._m0[int(_1119)][_1121];
    int _1125 = _1103 ? 0 : 1;
    float _1127 = fma(_999, _1019, _1107);
    int _1129 = abs(_1085);
    int _1131 = _1099 * _1105;
    int _1133 = _1131 + _568;
    bool _1135 = !_1011;
    int _1137 = _1135 ? 0 : 1;
    float _1139 = fma(_983, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1127);
    int _1141 = ~_1125;
    int _1143 = _1141 + 1;
    int _1145 = _1143 + 1;
    float _1147 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[77].z, _853);
    int _1149 = _1145;
    if (_1063)
    {
        int _1151 = ~_1125;
        int _1153 = _1151 + 1;
        _1149 = _1153;
    }
    int _1155 = _1149;
    float _1157 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[77].w, _883);
    int _1159 = abs(_1137);
    int _1161 = ~_1129;
    int _1163 = _1161 + 1;
    int _1165 = _1163 + 1;
    bool _1167 = _1009 != 3;
    int _1169 = _1165 * as_type<int>(_969);
    int _1171 = abs(_1155);
    float _1173 = in.m_63.y;
    bool _1175 = uint(_1133) >= uint(_385);
    int _1177 = ~_1159;
    int _1179 = _1177 + 1;
    int _1181 = _1179 + 1;
    bool _1183 = !_1167;
    int _1185 = _1183 ? 0 : (-1);
    int _1187 = _1181 * as_type<int>(_961);
    int _1189 = _1187 + _1169;
    bool _1191 = !_781;
    int _1193 = _1191 ? 0 : 1;
    int _1195 = abs(_1185);
    int _1197 = ~_1171;
    int _1199 = _1197 + 1;
    int _1201 = _1199 + 1;
    int _1203 = abs(_1193);
    int _1205 = ~_1195;
    int _1207 = _1205 + 1;
    int _1209 = _1207 + 1;
    int _1211 = _1201 * as_type<int>(_1031);
    int _1213 = _1211 + _1189;
    bool _1215 = !_1175;
    int _1217 = _1215 ? 0 : (-1);
    int _1219 = _730 + 1;
    int _1221 = _1209 * as_type<int>(_1039);
    int _1223 = _1221 + _1213;
    float _1225 = _1173;
    if (_795)
    {
        float _1227 = -_1173;
        float _1229 = _1227 + 1.0;
        _1225 = _1229;
    }
    float _1231 = _1225;
    int _1233 = ~_1105;
    int _1235 = _1233 + _1217;
    int _1237 = _1235 + 1;
    int _1239 = abs(_1219);
    float _1241 = fma(_1061, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    int _1243 = _385 * _1237;
    int _1245 = _1243 + _568;
    float _1247 = fma(_1231, (*spvDescriptorSet0.vp_c9)._m0[80].y, -0.5);
    float _1249 = fma(_1147, _1241, _865);
    float _1251 = float(uint(_1239));
    int _1253 = ~_1203;
    int _1255 = _1253 + 1;
    int _1257 = _1255 + 1;
    float _1259 = -_889;
    float _1261 = fma(_1157, _1247, _1259);
    bool _1263 = !_534;
    int _1265 = _1263 ? _1245 : (-1);
    float _1267 = as_type<float>(_636) * _1251;
    int _1269 = _1223 * _1257;
    float _1271 = _1123 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1273 = _1139 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    uint _1275 = uint(int(uint(_1219) >> uint(31)));
    int _1277 = _1265 * _1203;
    int _1279 = _1277 + _1269;
    float _1281 = trunc(_1267);
    float _1283 = precise::max(_1281, 0.0);
    uint _1285 = uint(_1283);
    float _1287 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1289 = _1115 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1291 = _1095 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1293 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1295 = _1287 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1297 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1299 = _1289 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1301 = _1293 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1303 = _1271 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1305 = _1297 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1307 = _1291 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1309 = float(_1279);
    float _1311 = _1261 + 0.5;
    int _1313 = ~int(_1275);
    int _1315 = _1313 + 1;
    out.m_65.x = _1301;
    out.m_65.y = _1305;
    out.m_65.z = _1295;
    float _1317 = _1249 + 0.5;
    out.m_67.x = _1299;
    out.m_67.y = _1303;
    out.m_67.z = _1307;
    out.m_67.w = _1273;
    out.m_69.x = _1309;
    int _1319 = ~int(_1285);
    int _1321 = _1319 + 1;
    int _1323 = _1321 * _616;
    int _1325 = _1323 + _1239;
    float _1327 = float(uint(_1325));
    float _1329 = as_type<float>(_636) * _1327;
    float _1331 = trunc(_1329);
    float _1333 = precise::max(_1331, 0.0);
    uint _1335 = uint(_1333);
    int _1337 = int(_1285) + int(_1335);
    int _1339 = ~_1337;
    int _1341 = _1339 + 1;
    int _1343 = _1341 * _616;
    int _1345 = _1343 + _1239;
    bool _1347 = uint(_1345) >= uint(_616);
    bool _1349 = !_1347;
    int _1351 = _1349 ? 0 : (-1);
    int _1353 = ~_1337;
    int _1355 = _1353 + _1351;
    int _1357 = _1355 + 1;
    int _1359 = _1357 * _616;
    int _1361 = _1359 + _1239;
    int _1363 = _1361 ^ _1315;
    int _1365 = ~_1315;
    int _1367 = _1365 + _1363;
    int _1369 = _1367 + 1;
    bool _1371 = !_618;
    int _1373 = _1371 ? _1369 : (-1);
    uint _1375 = as_type<uint>(half2(float2(_755, 0.0)));
    uint _1377 = extract_bits(_1375, 0u, 8u);
    int _1379 = int(_1377) & 255;
    uint _1381 = extract_bits(_1375, 8u, 8u);
    int _1383 = int(_1381) & 255;
    int _1385 = _1383 << 8;
    int _1387 = _1379 | _1385;
    bool _1389 = _1387 >= 32768;
    int _1391 = _1387 + (-1024);
    int _1393 = _1391;
    if (_1389)
    {
        int _1395 = ~_1387;
        int _1397 = _1395 + 33792;
        int _1399 = _1397 + 1;
        _1393 = _1399;
    }
    int _1401 = _1393;
    int _1403 = _1401 + 30719;
    float _1405 = float(_1403);
    float _1407 = fma(_1405, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _1409 = abs(_1407);
    float _1411 = -_1409;
    float _1413 = _1411 + 1.0;
    bool _1415 = _1407 < 0.0;
    float _1417 = float(_1415);
    float _1419 = abs(_1407);
    float _1421 = fma(_1419, -0.0187292993068695068359375, 0.074261002242565155029296875);
    int _1423 = as_type<int>(_1413) + (-218103808);
    float _1425 = abs(_1407);
    float _1427 = fma(_1425, _1421, -0.212114393711090087890625);
    bool _1429 = uint(_1423) >= 1920991232u;
    float _1431 = abs(_1407);
    float _1433 = fma(_1431, _1427, 1.570728778839111328125);
    bool _1435 = !_1429;
    float _1457;
    if (!_1435)
    {
        int _1437 = as_type<int>(_1413);
        int _1439 = _1351;
        int _1441 = 6448;
        int _1443 = as_type<int>(_1107);
        int _1445;
        int _1447;
        int _1449;
        int _1451;
        int _1453;
        int _1455;
        _102(_1437, _1439, _1441, _1443, _1445, _1447, _1449, _1451, _1453, _1455, out.gl_Position, out.gl_PointSize);
        _1457 = as_type<float>(_1453);
        _1459 = true;
    }
    else
    {
        float _1461 = rsqrt(_1413);
        float _1463 = _1413 * _1461;
        float _1465 = _1461 * 0.5;
        float _1467 = -_1463;
        float _1469 = 0.0 + _1467;
        float _1471 = fma(_1465, _1469, 0.5);
        float _1473 = fma(_1463, _1471, _1463);
        float _1475 = -_1473;
        float _1477 = 0.0 + _1475;
        float _1479 = fma(_1473, _1477, _1413);
        float _1481 = fma(_1465, _1479, _1473);
        _1457 = _1481;
    }
    _1459 = false;
    float _1483 = _1457;
    int _1485 = _1373;
    int _1487 = 0;
    int _1489 = _105(_1485, _1487, (*spvDescriptorSet0.support_buffer));
    int _1491 = _688;
    int _1493 = 0;
    int _1495 = _105(_1491, _1493, (*spvDescriptorSet0.support_buffer));
    float4 _1497 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_1489, _1495)), 0).xyzw;
    float _1499 = _1497.x;
    float _1501 = _1497.y;
    float _1503 = _1497.z;
    float _1505 = _1497.w;
    float _1507 = _1433 * _1483;
    float _1509 = _1417 * 2.0;
    float _1511 = _1405 * 3.883221149444580078125;
    float _1513 = floor(_620);
    float _1515 = -_1509;
    float _1517 = fma(_1507, _1515, _1507);
    float _1519 = _1511 * 0.15915493667125701904296875;
    float _1521 = fma(_1417, 3.1415927410125732421875, _1517);
    float _1523 = _1519 * 6.283185482025146484375;
    float _1525 = cos(_1523);
    float _1527 = _1521 * 0.15915493667125701904296875;
    float _1529 = _1527 * 6.283185482025146484375;
    float _1531 = sin(_1529);
    float _1533 = -_1513;
    float _1535 = _620 + _1533;
    float _1537 = _1519 * 6.283185482025146484375;
    float _1539 = sin(_1537);
    float _1541 = _1531 * _1525;
    float _1543 = _1531 * _1539;
    uint _1545 = as_type<uint>(half2(float2(_1505, 0.0)));
    float _1547 = -_749;
    float _1549 = _1547 + _1499;
    uint _1551 = extract_bits(_1545, 0u, 8u);
    int _1553 = int(_1551) & 255;
    uint _1555 = extract_bits(_1545, 8u, 8u);
    int _1557 = int(_1555) & 255;
    int _1559 = _1557 << 8;
    int _1561 = _1553 | _1559;
    float _1563 = fma(_1535, _1549, _749);
    bool _1565 = _1561 >= 32768;
    int _1567 = _1561 + (-1024);
    int _1569 = _1567;
    if (_1565)
    {
        int _1571 = ~_1561;
        int _1573 = _1571 + 33792;
        int _1575 = _1573 + 1;
        _1569 = _1575;
    }
    int _1577 = _1569;
    int _1579 = _1577 + 30719;
    float _1581 = float(_1579);
    float _1583 = -_751;
    float _1585 = _1583 + _1501;
    float _1587 = fma(_1581, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _1589 = fma(_1535, _1585, _751);
    float _1591 = abs(_1587);
    float _1593 = -_1591;
    float _1595 = _1593 + 1.0;
    float _1597 = abs(_1587);
    float _1599 = fma(_1597, -0.0187292993068695068359375, 0.074261002242565155029296875);
    bool _1601 = _1587 < 0.0;
    float _1603 = float(_1601);
    int _1605 = as_type<int>(_1595) + (-218103808);
    float _1607 = abs(_1587);
    float _1609 = fma(_1607, _1599, -0.212114393711090087890625);
    bool _1611 = uint(_1605) >= 1920991232u;
    float _1613 = -_753;
    float _1615 = _1613 + _1503;
    float _1617 = abs(_1587);
    float _1619 = fma(_1617, _1609, 1.570728778839111328125);
    float _1621 = fma(_1535, _1615, _753);
    bool _1623 = !_1611;
    float _1645;
    if (!_1623)
    {
        int _1625 = as_type<int>(_1595);
        int _1627 = as_type<int>(_1501);
        int _1629 = 7344;
        int _1631 = as_type<int>(_1527);
        int _1633;
        int _1635;
        int _1637;
        int _1639;
        int _1641;
        int _1643;
        _102(_1625, _1627, _1629, _1631, _1633, _1635, _1637, _1639, _1641, _1643, out.gl_Position, out.gl_PointSize);
        _1645 = as_type<float>(_1641);
        _1647 = true;
    }
    else
    {
        float _1649 = rsqrt(_1595);
        float _1651 = _1595 * _1649;
        float _1653 = _1649 * 0.5;
        float _1655 = -_1651;
        float _1657 = 0.0 + _1655;
        float _1659 = fma(_1653, _1657, 0.5);
        float _1661 = fma(_1651, _1659, _1651);
        float _1663 = -_1661;
        float _1665 = 0.0 + _1663;
        float _1667 = fma(_1661, _1665, _1595);
        float _1669 = fma(_1653, _1667, _1661);
        _1645 = _1669;
    }
    _1647 = false;
    float _1671 = _1645;
    float _1673 = in.m_61.x;
    float _1675 = in.m_61.y;
    float _1677 = in.m_61.z;
    float _1679 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1681 = log2(_1679);
    float _1683 = _1677 * 2.0;
    float _1685 = _1675 * 2.0;
    float _1687 = _1677 + _1673;
    float _1689 = _1673 * 2.0;
    float _1691 = _1675 + (-0.5);
    float _1693 = floor(_1685);
    float _1695 = _1687 + (-1.0);
    float _1697 = floor(_1683);
    float _1699 = fma(_1695, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1701 = floor(_1689);
    bool _1703 = _1697 > 0.0;
    bool _1705 = _1697 >= 0.0;
    bool _1707 = isnan(_1697);
    bool _1709 = _1705 || _1707;
    bool _1711 = isnan(0.0);
    bool _1713 = _1709 || _1711;
    int _1715 = _1713 ? 0 : 1;
    int _1717 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1719 = _1717 != 0;
    int _1721 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1723 = _1721 != 0;
    int _1725 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1727 = _1725 != 0;
    bool _1729 = _1693 > 0.0;
    bool _1731 = _1693 >= 0.0;
    bool _1733 = isnan(_1693);
    bool _1735 = _1731 || _1733;
    bool _1737 = isnan(0.0);
    bool _1739 = _1735 || _1737;
    float _1741 = _1681 * _147;
    int _1743 = ~_1715;
    int _1745 = _1743 + 1;
    int _1747 = _1745 + 1;
    bool _1749 = !_1719;
    int _1751 = _1749 ? 0 : 1;
    float _1753 = exp2(_1741);
    int _1755 = _1747;
    if (!_1703)
    {
        int _1757 = ~_1715;
        int _1759 = _1757 + 1;
        _1755 = _1759;
    }
    int _1761 = _1755;
    bool _1763 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1765 = isnan(1.0);
    bool _1767 = _1763 || _1765;
    bool _1769 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1771 = _1767 || _1769;
    float _1773 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1775 = 1.0 + _1773;
    int _1777 = abs(_1751);
    float _1779 = in.m_71.x;
    float _1781 = in.m_71.y;
    float _1783 = in.m_71.z;
    float _1785 = 1.0 / _1775;
    int _1787 = _1739 ? 0 : 1;
    float _1789 = _1675 + _1673;
    float _1791 = float(_1761);
    float _1793 = _1673 + (-0.5);
    float _1795 = float(_1777);
    float _1797 = _1789 + (-1.0);
    bool _1799 = !_1727;
    int _1801 = _1799 ? 0 : 1;
    float _1803 = -_1753;
    float _1805 = _1803 + 1.0;
    int _1807 = ~_1787;
    int _1809 = _1807 + 1;
    int _1811 = _1809 + 1;
    float _1813 = _1795 * _1791;
    int _1815 = _1811;
    if (!_1729)
    {
        int _1817 = ~_1787;
        int _1819 = _1817 + 1;
        _1815 = _1819;
    }
    int _1821 = _1815;
    float _1823 = fma(_1797, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _1825 = _1701 > 0.0;
    float _1827 = _1813 * (-2.0);
    bool _1829 = _1701 >= 0.0;
    bool _1831 = isnan(_1701);
    bool _1833 = _1829 || _1831;
    bool _1835 = isnan(0.0);
    bool _1837 = _1833 || _1835;
    bool _1839 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1841 = isnan(0.0);
    bool _1843 = _1839 || _1841;
    bool _1845 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1847 = _1843 || _1845;
    int _1849 = abs(_1801);
    float _1851 = _1847 ? _1805 : 0.0;
    float _1853 = float(_1849);
    float _1855 = float(_1821);
    if (_1771)
    {
        float _1857 = _1851 * _1785;
        _149 = _1857;
    }
    float _1859 = _149;
    int _1861 = _1837 ? 0 : 1;
    float _1863 = fma(_1823, _1827, _1823);
    bool _1865 = !_1723;
    int _1867 = _1865 ? 0 : 1;
    float _1869 = _1853 * _1855;
    int _1871 = ~_1861;
    int _1873 = _1871 + 1;
    int _1875 = _1873 + 1;
    int _1877 = _1875;
    if (!_1825)
    {
        int _1879 = ~_1861;
        int _1881 = _1879 + 1;
        _1877 = _1881;
    }
    int _1883 = _1877;
    float _1885 = _1869 * (-2.0);
    int _1887 = abs(_1867);
    float _1889 = fma(_1827, _1779, _1779);
    float _1891 = _1677 + (-0.5);
    float _1893 = fma(_1885, _1783, _1783);
    float _1895 = fma(_1793, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1889);
    float _1897 = float(_1883);
    float _1899 = fma(_1891, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1893);
    float _1901 = float(_1887);
    float _1903 = fma(_1863, _1859, _1895);
    float _1905 = fma(_1699, _1885, _1699);
    float _1907 = _1677 + _1675;
    float _1909 = in.m_48.x;
    float _1911 = in.m_48.y;
    float _1913 = in.m_48.z;
    float _1915 = _1901 * _1897;
    float _1917 = _1903 * 0.15915493667125701904296875;
    float _1919 = fma(_1905, _1859, _1899);
    float _1921 = in.m_59.x;
    float _1923 = in.m_59.y;
    float _1925 = in.m_59.z;
    float _1927 = in.m_59.w;
    float _1929 = _1915 * (-2.0);
    float _1931 = _1907 + (-1.0);
    float _1933 = _1919 * 0.15915493667125701904296875;
    float _1935 = in.m_57.x;
    float _1937 = in.m_57.y;
    float _1939 = in.m_57.z;
    float _1941 = in.m_57.w;
    float _1943 = fma(_1929, _1781, _1781);
    float _1945 = fma(_1931, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1947 = _1917 * 6.283185482025146484375;
    float _1949 = sin(_1947);
    float _1951 = in.m_73.y;
    float _1953 = fma(_1691, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1943);
    float _1955 = fma(_1945, _1929, _1945);
    float _1957 = in.m_75.x;
    float _1959 = in.m_75.y;
    float _1961 = in.m_75.z;
    float _1963 = fma(_1955, _1859, _1953);
    float _1965 = _1917 * 6.283185482025146484375;
    float _1967 = cos(_1965);
    float _1969 = _1963 * 0.15915493667125701904296875;
    float _1971 = _1933 * 6.283185482025146484375;
    float _1973 = sin(_1971);
    float _1975 = _1911 * _1923;
    float _1977 = _1911 * _1937;
    float _1979 = fma(_1909, _1921, _1975);
    float _1981 = _1933 * 6.283185482025146484375;
    float _1983 = cos(_1981);
    float _1985 = _1911 + _1951;
    float _1987 = fma(_1909, _1935, _1977);
    float _1989 = fma(_1913, _1925, _1979);
    float _1991 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1563);
    float _1993 = _1957 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1995 = _1959 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1997 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1589);
    float _1999 = _1969 * 6.283185482025146484375;
    float _2001 = sin(_1999);
    float _2003 = _1993 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2005 = _1995 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2007 = _1961 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _2009 = fma(_1913, _1939, _1987);
    float _2011 = _2003 * _1991;
    float _2013 = _1949 * _1973;
    float _2015 = _2005 * _1997;
    float _2017 = _1969 * 6.283185482025146484375;
    float _2019 = cos(_2017);
    float _2021 = _1967 * _1983;
    float _2023 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1621);
    float _2025 = _2007 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _2027 = _1967 * _1973;
    float _2029 = _1949 * _1983;
    float _2031 = _2009 + _1941;
    float _2033 = _2025 * _2023;
    float _2035 = fma(_2001, _2013, _2021);
    float _2037 = -_2027;
    float _2039 = fma(_2001, _2029, _2037);
    float _2041 = -_2029;
    float _2043 = fma(_2001, _2027, _2041);
    float _2045 = fma(_2001, _2021, _2013);
    float _2047 = _2035 * _2015;
    float _2049 = _2039 * _2015;
    float _2051 = _1985 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    bool _2053 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2055 = isnan(0.5);
    bool _2057 = _2053 || _2055;
    bool _2059 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2061 = _2057 || _2059;
    float _2063 = _2019 * _1973;
    float _2065 = _2019 * _1983;
    float _2067 = _1949 * _2019;
    float _2069 = _1967 * _2019;
    float _2071 = fma(_2063, _2011, _2047);
    float _2073 = fma(_2065, _2011, _2049);
    float _2075 = _2067 * _2015;
    float _2077 = fma(_2031, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2051);
    float _2079 = fma(_2043, _2033, _2071);
    float _2081 = fma(_2045, _2033, _2073);
    float _2083 = -_2001;
    float _2085 = fma(_2083, _2011, _2075);
    bool _2087 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2089 = isnan(0.5);
    bool _2091 = _2087 || _2089;
    bool _2093 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2095 = _2091 || _2093;
    float _2097 = _2079 * _335;
    float _2099 = _2079 * _327;
    float _2101 = fma(_2069, _2033, _2085);
    float _2103 = fma(_2081, _287, _2097);
    float _2105 = fma(_2081, _279, _2099);
    float _2107 = _1989 + _1927;
    float _2109 = _1985 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2111 = fma(_2101, _323, _2103);
    float _2113 = fma(_2101, _319, _2105);
    float _2115 = fma(_2107, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2077);
    float _2117 = fma(_2031, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2109);
    float _2119 = _2107 + _2111;
    float _2121 = _2031 + _2113;
    float _2123 = _2115 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2125 = fma(_2107, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2117);
    float _2127 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2129 = _2119 + _2127;
    float _2131 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2133 = _2121 + _2131;
    float _2135 = 1.0 / _2123;
    float _2137 = _2125 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2139 = _2129 * _2129;
    float _2141 = _2137 + _2123;
    float _2143 = fma(_2133, _2133, _2139);
    float _2145 = _2079 * _331;
    float _2147 = sqrt(_2143);
    float _2149 = fma(_2081, _283, _2145);
    float _2151 = _2141 * _2135;
    float _2153 = _2151 * 0.5;
    float _2155 = fma(_2101, _315, _2149);
    float _2157 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2159 = fma(_2153, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2157);
    float _2161 = _1985 + _2155;
    bool _2163 = _2147 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2165 = 1.0 / _2159;
    float _2167 = _2153;
    float _2169 = _2145;
    float _2171 = _2119;
    float _2173 = _2143;
    float _2175 = _2147;
    float _2177 = _2121;
    float _2179 = _2161;
    if (!_2163)
    {
        _2167 = _2121;
    }
    float _2181 = _2167;
    float _2183 = _2181;
    if (!_2163)
    {
        _2169 = _2161;
    }
    float _2185 = _2169;
    bool _2187 = !_2163;
    float _2189 = _2185;
    if (!_2187)
    {
        float _2191 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2193 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2195 = _2147 + _2193;
        float _2197 = _2161 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2199 = rsqrt(_2143);
        float _2201 = _2195 * _2191;
        float _2203 = _2201 * 0.15915493667125701904296875;
        float _2205 = _2203 * 6.283185482025146484375;
        float _2207 = cos(_2205);
        float _2209 = _2203 * 6.283185482025146484375;
        float _2211 = sin(_2209);
        float _2213 = _2207 + (-1.0);
        float _2215 = _2213 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2217 = fma(_2211, _2197, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2219 = fma(_2161, _2207, _2215);
        float _2221 = _2199 * _2217;
        float _2223 = fma(_2133, _2221, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2225 = fma(_2129, _2221, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2171 = _2225;
        _2183 = _2223;
        _2189 = _2219;
        _2173 = _2199;
        _2175 = _2203;
    }
    float _2227 = _2171;
    float _2229 = _2183;
    float _2231 = _2189;
    float _2233 = _2173;
    float _2235 = _2175;
    float _2237 = _2235;
    float _2239 = _2231;
    float _2241 = _2229;
    float _2243 = _2233;
    if (_2095)
    {
        _2237 = 1.0;
    }
    float _2245 = _2237;
    float _2247 = _2245;
    if (_2061)
    {
        _2177 = _2227;
    }
    float _2249 = _2177;
    float _2251 = _2249;
    if (!_2061)
    {
        float _2253 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2255 = _1985 + _2253;
        float _2257 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2259 = _2031 + _2257;
        float _2261 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2263 = -_2031;
        float _2265 = _2263 + _2229;
        float _2267 = _2255 * _2255;
        float _2269 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2271 = _2107 + _2269;
        float _2273 = -_2107;
        float _2275 = _2273 + _2227;
        float _2277 = fma(_2259, _2259, _2267);
        float _2279 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2281 = fma(_2271, _2271, _2277);
        float _2283 = sqrt(_2281);
        float _2285 = _2261 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2287 = precise::min(_2283, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2289 = _2287 * _2279;
        float _2291 = -_1985;
        float _2293 = _2291 + _2231;
        float _2295 = _2285 * _2289;
        float _2297 = fma(_2293, _2295, _1985);
        float _2299 = fma(_2265, _2295, _2031);
        float _2301 = fma(_2275, _2295, _2107);
        _2239 = _2297;
        _2241 = _2299;
        _2251 = _2301;
        _2243 = _2279;
    }
    float _2303 = _2239;
    float _2305 = _2241;
    float _2307 = _2251;
    float _2309 = _2243;
    if (_2095)
    {
        _2179 = 1.0;
    }
    float _2311 = _2179;
    float _2313 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2315 = _2165 * _2313;
    float _2317 = _2311;
    if (!_2095)
    {
        float _2319 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2321 = _2319 * 0.15915493667125701904296875;
        float _2323 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2325 = _2321 * 6.283185482025146484375;
        float _2327 = cos(_2325);
        float _2329 = _2323 * 0.15915493667125701904296875;
        float _2331 = _2321 * 6.283185482025146484375;
        float _2333 = sin(_2331);
        float _2335 = 1.0 / _2327;
        float _2337 = _2329 * 6.283185482025146484375;
        float _2339 = cos(_2337);
        float _2341 = _2333 * _2335;
        float _2343 = _2329 * 6.283185482025146484375;
        float _2345 = sin(_2343);
        float _2347 = _2339 * _2341;
        float _2349 = 1.0 / _2347;
        float _2351 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2353 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2351;
        float _2355 = 1.0 / _2353;
        float _2357 = _2345 * _2349;
        float _2359 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2361 = fma(_2315, _2357, _2359);
        float _2363 = _2361 * _2355;
        float _2365 = precise::clamp(_2363, 0.0, 1.0);
        _2247 = _2365;
    }
    float _2367 = _2247;
    if (!_2095)
    {
        float _2369 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2371 = _2369 * 0.15915493667125701904296875;
        float _2373 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2375 = _2371 * 6.283185482025146484375;
        float _2377 = cos(_2375);
        float _2379 = _2373 * 0.15915493667125701904296875;
        float _2381 = _2371 * 6.283185482025146484375;
        float _2383 = sin(_2381);
        float _2385 = 1.0 / _2377;
        float _2387 = _2379 * 6.283185482025146484375;
        float _2389 = cos(_2387);
        float _2391 = _2383 * _2385;
        float _2393 = _2379 * 6.283185482025146484375;
        float _2395 = sin(_2393);
        float _2397 = _2389 * _2391;
        float _2399 = 1.0 / _2397;
        float _2401 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2403 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2401;
        float _2405 = 1.0 / _2403;
        float _2407 = _2395 * _2399;
        float _2409 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2411 = fma(_2315, _2407, _2409);
        float _2413 = _2411 * _2405;
        float _2415 = precise::clamp(_2413, 0.0, 1.0);
        float _2417 = -_2415;
        float _2419 = _2417 + 1.0;
        _2317 = _2419;
    }
    float _2421 = _2317;
    float _2423 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2425 = _2303 + _2423;
    float _2427 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2429 = _2305 + _2427;
    float _2431 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2433 = _2307 + _2431;
    float _2435 = _2425 * _2425;
    float _2437 = fma(_2429, _2429, _2435);
    float _2439 = fma(_2433, _2433, _2437);
    float _2441 = rsqrt(_2439);
    float _2443 = sqrt(_2439);
    float _2445 = _2441 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2447 = _2429 * _2445;
    float _2449 = _2433 * _2445;
    float _2451 = _2447 * _2447;
    float _2453 = _2449 * _2449;
    float _2455 = _2451 + _2453;
    float _2457 = sqrt(_2455);
    bool _2459 = _2457 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2461 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2463 = _2457 + _2461;
    float _2465 = _2309;
    float _2467 = _2455;
    float _2469 = _2463;
    float _2471 = _2425;
    float _2473 = _2447;
    float _2475 = _2449;
    float _2477 = _2451;
    if (_2459)
    {
        float _2479 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2465 = _2479;
    }
    float _2481 = _2465;
    if (_2459)
    {
        float _2483 = rsqrt(_2455);
        _2467 = _2483;
    }
    float _2485 = _2467;
    if (_2459)
    {
        float _2487 = _2463 * _2481;
        _2469 = _2487;
    }
    float _2489 = _2469;
    float _2491 = 0.0;
    if (_2459)
    {
        float _2493 = _2489 * 0.15915493667125701904296875;
        _2491 = _2493;
    }
    float _2495 = _2491;
    float _2497 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2499 = _1969;
    float _2501 = _2497;
    if (_2459)
    {
        float _2503 = _2495 * 6.283185482025146484375;
        float _2505 = sin(_2503);
        _2499 = _2505;
    }
    float _2507 = _2499;
    float _2509 = precise::max(0.0, _2497);
    float _2511 = _2489;
    float _2513 = _2509;
    if (_2459)
    {
        float _2515 = _2495 * 6.283185482025146484375;
        float _2517 = cos(_2515);
        _2511 = _2517;
    }
    float _2519 = _2511;
    float _2521 = -_2445;
    float _2523 = -_2509;
    float _2525 = fma(_2425, _2521, _2523);
    if (_2459)
    {
        float _2527 = _2525 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2471 = _2527;
    }
    float _2529 = _2471;
    float _2531 = _2529;
    if (_2459)
    {
        float _2533 = fma(_2507, _2529, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2513 = _2533;
    }
    float _2535 = _2513;
    float _2537 = _2535;
    if (!_2459)
    {
        _2531 = _2525;
    }
    float _2539 = _2531;
    float _2541 = fma(_2031, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2543 = _2539;
    if (_2459)
    {
        float _2545 = _2485 * _2535;
        _2537 = _2545;
    }
    float _2547 = _2537;
    float _2549 = _2519;
    if (_2459)
    {
        float _2551 = _2519 + (-1.0);
        _2501 = _2551;
    }
    float _2553 = _2501;
    float _2555 = _2553;
    if (_2459)
    {
        float _2557 = _2447 * _2547;
        _2473 = _2557;
    }
    float _2559 = _2473;
    if (_2459)
    {
        float _2561 = _2449 * _2547;
        _2475 = _2561;
    }
    float _2563 = _2475;
    if (_2459)
    {
        float _2565 = _2553 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2555 = _2565;
    }
    float _2567 = _2555;
    if (_2459)
    {
        float _2569 = _2559 * _2559;
        _2477 = _2569;
    }
    float _2571 = _2477;
    if (_2459)
    {
        float _2573 = fma(_2525, _2519, _2567);
        _2543 = _2573;
    }
    float _2575 = _2543;
    float _2577 = _2303 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (!_2459)
    {
        _2549 = _2453;
    }
    float _2579 = _2549;
    float _2581 = _2579;
    if (_2459)
    {
        float _2583 = _2563 * _2563;
        _2581 = _2583;
    }
    float _2585 = _2581;
    float _2587 = fma(_2575, _2575, _2571);
    float _2589 = fma(_2305, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2577);
    float _2591 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2593 = fma(_2443, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2591);
    float _2595 = precise::clamp(_2593, 0.0, 1.0);
    float _2597 = floor(_2541);
    float _2599 = _2587 + _2585;
    float _2601 = fma(_2307, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2589);
    float _2603 = -_2595;
    float _2605 = _2603 + 1.0;
    float _2607 = fma(_2107, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2609 = _2601 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2611 = _2303 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2613 = rsqrt(_2599);
    float _2615 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2617 = _2609 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2619 = _2303 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2621 = -_2617;
    float _2623 = fma(_2621, _2615, 1.0);
    float _2625 = _2303 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2627 = fma(_2305, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2619);
    float _2629 = abs(_2605);
    float _2631 = log2(_2629);
    float _2633 = -_2597;
    float _2635 = _2541 + _2633;
    float _2637 = fma(_2305, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2625);
    float _2639 = fma(_2307, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2627);
    float _2641 = fma(_2307, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2637);
    float _2643 = _2639 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2645 = _2613 * _2559;
    float _2647 = fma(_2305, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2611);
    float _2649 = _2641 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2651 = _2643 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2653 = floor(_2607);
    float _2655 = _2613 * _2575;
    float _2657 = _2645 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2659 = fma(_2307, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2647);
    float _2661 = fma(_2649, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2651);
    float _2663 = _2613 * _2563;
    float _2665 = -_2657;
    float _2667 = fma(_2655, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2665);
    float _2669 = _2659 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2671 = fma(_2609, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2661);
    float _2673 = _2631 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2675 = -_2663;
    float _2677 = fma(_2675, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2667);
    float _2679 = log2(_2623);
    float _2681 = fma(_2669, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2671);
    float _2683 = _2643 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2685 = fma(_2677, -0.5, 0.5);
    float _2687 = fma(_2677, 0.5, 0.5);
    float _2689 = _2643 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2691 = -_2653;
    float _2693 = _2607 + _2691;
    float _2695 = fma(_2649, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2683);
    float _2697 = exp2(_2673);
    float _2699 = fma(_2649, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2689);
    float _2701 = _2655 + 1.0;
    float _2703 = fma(_2687, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2705 = 1.0 / _2681;
    float _2707 = fma(_2687, _2703, -0.212114393711090087890625);
    float _2709 = fma(_2609, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2695);
    float _2711 = fma(_2669, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2709);
    float _2713 = sqrt(_2685);
    float _2715 = -_2655;
    float _2717 = fma(_2697, _2701, _2715);
    float _2719 = fma(_2687, _2707, 1.570728778839111328125);
    float _2721 = _2679 * 0.693147182464599609375;
    float2 _7097 = float2(_2635, _2693);
    float _2723 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_7097, float2(0.0), isnan(_7097)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_7097, float2(0.0), isnan(_7097)), level(0.0)).x;
    float _2725 = fma(_2717, 0.5, 0.5);
    float _2727 = _2711 * _2705;
    float _2729 = fma(_2609, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2699);
    float _2731 = _2721 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2733 = fma(_2727, 0.5, 0.5);
    float _2735 = fma(_2669, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2729);
    float _2737 = _2713 * 0.636619746685028076171875;
    float _2739 = _2735 * _2705;
    float _2741 = -_2719;
    float _2743 = fma(_2737, _2741, 1.0);
    float _2745 = fma(_2739, -0.5, 0.5);
    float3 _7142 = float3(_2733, _2745, _2731);
    float _2747 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7142, float3(0.0), isnan(_7142)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7142, float3(0.0), isnan(_7142)), level(0.0)).x;
    float3 _7153 = float3(_2733, _2745, _2731);
    float4 _2749 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7153, float3(0.0), isnan(_7153)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7153, float3(0.0), isnan(_7153)), level(0.0)).xyzw;
    float _2751 = _2749.x;
    float _2753 = _2749.y;
    float _2755 = _2749.z;
    float _2757 = _2749.w;
    float2 _7169 = float2(_2743, _2725);
    float3 _2761 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7169, float2(0.0), isnan(_7169)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7169, float2(0.0), isnan(_7169)), level(0.0)).xyz;
    float _2763 = _2761.x;
    float _2765 = _2761.y;
    float _2767 = _2761.z;
    float _2769 = _1619 * _1671;
    float _2771 = _1603 * 2.0;
    float _2773 = _1581 * 3.883221149444580078125;
    bool _2775 = _1589 != 0.0;
    bool _2777 = isnan(_1589);
    bool _2779 = _2775 || _2777;
    bool _2781 = isnan(0.0);
    bool _2783 = _2779 || _2781;
    float _2785 = -_1407;
    float _2787 = _2785 + _1587;
    float _2789 = -_2771;
    float _2791 = fma(_2769, _2789, _2769);
    float _2793 = _2773 * 0.15915493667125701904296875;
    bool _2795 = _1563 == 0.0;
    bool _2797 = !_2783;
    bool _2799 = _2795 && _2797;
    float _2801 = fma(_1535, _2787, _1407);
    float _2803 = fma(_1603, 3.1415927410125732421875, _2791);
    float _2805 = _2793 * 6.283185482025146484375;
    float _2807 = cos(_2805);
    bool _2809 = _1621 == 0.0;
    bool _2811 = _2809 && _2799;
    out.m_77.x = _1317;
    out.m_77.y = _1311;
    float _2813 = _2803 * 0.15915493667125701904296875;
    float _2815 = _2631 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2817 = _2643 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2819 = abs(_2315);
    float _2821 = log2(_2819);
    float _2823 = fma(_2649, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2817);
    float _2825 = fma(_2609, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2823);
    float _2827 = _2801;
    float _2829 = _2681;
    if (!_2811)
    {
        float _2831 = fma(_1589, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2801);
        _2827 = _2831;
    }
    float _2833 = _2827;
    float _2835 = _2813 * 6.283185482025146484375;
    float _2837 = sin(_2835);
    bool _2839 = _2315 <= 8000.0;
    bool _2841 = isnan(_2315);
    bool _2843 = _2839 || _2841;
    bool _2845 = isnan(8000.0);
    bool _2847 = _2843 || _2845;
    float _2849 = float(_2847);
    float _2851 = _2039 * _2833;
    float _2853 = _2821 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2855 = _2793 * 6.283185482025146484375;
    float _2857 = sin(_2855);
    float _2859 = -_1541;
    float _2861 = fma(_2837, _2807, _2859);
    float _2863 = exp2(_2853);
    float _2865 = fma(_1535, _2861, _1541);
    float _2867 = _2865;
    if (!_2811)
    {
        float _2869 = fma(_1563, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2865);
        _2867 = _2869;
    }
    float _2871 = _2867;
    float _2873 = -_1543;
    float _2875 = fma(_2837, _2857, _2873);
    float _2877 = _2067 * _2833;
    float _2879 = exp2(_2815);
    float _2881 = fma(_2065, _2871, _2851);
    float _2883 = fma(_1535, _2875, _1543);
    float _2885 = -_2001;
    float _2887 = fma(_2885, _2871, _2877);
    float _2889 = in.m_73.x;
    float _2891 = fma(_2669, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2825);
    float _2893 = fma(_2863, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2895 = precise::clamp(_2893, 0.0, 1.0);
    float _2897 = _2035 * _2833;
    float _2899 = _2883;
    float _2901 = _2891;
    if (!_2811)
    {
        float _2903 = fma(_1621, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2883);
        _2899 = _2903;
    }
    float _2905 = _2899;
    bool _2907 = _2443 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2909 = isnan(_2443);
    bool _2911 = _2907 || _2909;
    bool _2913 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2915 = _2911 || _2913;
    float _2917 = fma(_2895, -2.0, 3.0);
    float _2919 = _2895 * _2895;
    float _2921 = fma(_2063, _2871, _2897);
    float _2923 = fma(_2045, _2905, _2881);
    float _2925 = fma(_2069, _2905, _2887);
    float _2927 = _2919 * _2917;
    float _2929 = fma(_2043, _2905, _2921);
    float _2931 = -_2879;
    float _2933 = _2931 + 1.0;
    float _2935 = -_2927;
    float _2937 = _2935 + 1.0;
    float _2939 = _2929 * _327;
    float _2941 = _2929 * _331;
    float _2943 = _2929 * _335;
    float _2945 = fma(_2937, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2927);
    float _2947 = fma(_2923, _279, _2939);
    float _2949 = _2933 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2951 = fma(_2923, _287, _2943);
    float _2953 = _2849 * _2945;
    float _2955 = fma(_2925, _319, _2947);
    float _2957 = _2891 + _2681;
    float _2959 = fma(_2925, _323, _2951);
    float _2961 = _2953 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.gl_Position.x = _2711;
    out.gl_Position.y = _2735;
    out.gl_Position.z = _2891;
    out.gl_Position.w = _2681;
    float _2963 = _2957 * 0.5;
    float _2965 = fma(_2923, _283, _2941);
    out.m_79.z = _2963;
    out.m_79.w = _2681;
    float _2967 = fma(_2925, _315, _2965);
    out.m_81.x = _2955;
    out.m_81.y = _2967;
    out.m_81.z = _2959;
    if (!_2915)
    {
        _2829 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2969 = _2829;
    float _2971 = _2969;
    float _2973 = _2969;
    if (!_2915)
    {
        _2901 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2975 = _2901;
    float _2977 = -_2723;
    float _2979 = _2977 + 1.0;
    float _2981 = _2979 * _2961;
    float _2983 = precise::clamp(_2981, 0.0, 1.0);
    float _2985 = -_2983;
    float _2987 = fma(_2985, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2989 = _2987 * _2889;
    float _2991 = _2989 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2993 = _2949 * _2747;
    float _2995 = -_2949;
    float _2997 = _2995 + 1.0;
    out.m_83.x = _2991;
    float _2999 = _2757 * _2993;
    float _3001 = _2767 * _2993;
    float _3003 = _2757 * _2997;
    float _3005 = _2367 * _2421;
    float _3007 = fma(_2763, _2999, _2751);
    float _3009 = fma(_2765, _2999, _2753);
    float _3011 = fma(_2757, _3001, _2755);
    float _3013 = _3005 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3015 = _2753;
    float _3017 = _2751;
    float _3019 = _2999;
    float _3021 = _3005;
    float _3023 = _2975;
    float _3025 = _2975;
    if (!_2915)
    {
        _3015 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3027 = _3015;
    float _3029 = _3027;
    float _3031 = _3027;
    if (!_2915)
    {
        _3017 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3033 = _3017;
    out.m_85.x = _3007;
    out.m_85.y = _3009;
    out.m_85.z = _3011;
    out.m_85.w = _3003;
    float _3035 = _3033;
    float _3037 = _3033;
    if (!_2915)
    {
        _3019 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3039 = _3019;
    float _3041 = _3039;
    float _3043 = _3039;
    if (!_2915)
    {
        _3021 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3045 = _3021;
    bool _3047 = !_2915;
    float _3049 = _3045;
    float _3051 = _3045;
    if (!_3047)
    {
        bool _3053 = _2443 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3055 = isnan(_2443);
        bool _3057 = _3053 || _3055;
        bool _3059 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3061 = _3057 || _3059;
        if (!_3061)
        {
            float _3063 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3065 = _2443 + _3063;
            float _3067 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3069 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3067;
            float _3071 = 1.0 / _3069;
            float _3073 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3075 = _3073 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3077 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3079 = _3077 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3081 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3083 = _3081 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3085 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3087 = _3085 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3089 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3091 = _3089 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3093 = _3065 * _3071;
            float _3095 = precise::clamp(_3093, 0.0, 1.0);
            float _3097 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3099 = _3097 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3101 = fma(_3095, _3075, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3103 = fma(_3095, _3099, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3105 = fma(_3095, _3079, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3107 = fma(_3095, _3083, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3109 = fma(_3095, _3087, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3111 = fma(_3095, _3091, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3037 = _3103;
            _3043 = _3109;
            _3031 = _3101;
            _3025 = _3107;
            _2973 = _3105;
            _3051 = _3111;
            _3113 = true;
        }
        else
        {
            bool _3115 = _2443 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3117 = isnan(_2443);
            bool _3119 = _3115 || _3117;
            bool _3121 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3123 = _3119 || _3121;
            if (!_3123)
            {
                _3029 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3125 = _3029;
            _3031 = _3125;
            if (!_3123)
            {
                _3035 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3127 = _3035;
            _3037 = _3127;
            if (!_3123)
            {
                _2971 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3129 = _2971;
            _2973 = _3129;
            if (!_3123)
            {
                _3023 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3131 = _3023;
            _3025 = _3131;
            if (!_3123)
            {
                _3041 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3133 = _3041;
            _3043 = _3133;
            if (!_3123)
            {
                _3049 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3135 = _3049;
            bool _3137 = !_3123;
            _3051 = _3135;
            if (!_3137)
            {
                bool _3139 = _2443 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3141 = isnan(_2443);
                bool _3143 = _3139 || _3141;
                bool _3145 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3147 = _3143 || _3145;
                if (!_3147)
                {
                    float _3149 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3151 = _2443 + _3149;
                    float _3153 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3155 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3153;
                    float _3157 = 1.0 / _3155;
                    float _3159 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3161 = _3159 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3163 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3165 = _3163 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3167 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3169 = _3167 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3171 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3173 = _3171 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3175 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3177 = _3175 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3179 = _3151 * _3157;
                    float _3181 = precise::clamp(_3179, 0.0, 1.0);
                    float _3183 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3185 = _3183 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3187 = fma(_3181, _3161, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3189 = fma(_3181, _3185, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3191 = fma(_3181, _3165, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3193 = fma(_3181, _3169, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3195 = fma(_3181, _3173, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3197 = fma(_3181, _3177, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3037 = _3189;
                    _3043 = _3195;
                    _3031 = _3187;
                    _3025 = _3193;
                    _2973 = _3191;
                    _3051 = _3197;
                    _3113 = true;
                }
                else
                {
                    _3037 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3043 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3031 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3025 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2973 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3051 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3113 = false;
    float _3199 = _3037;
    float _3201 = _3043;
    float _3203 = _3031;
    float _3205 = _3025;
    float _3207 = _2973;
    float _3209 = _3051;
    float _3211 = fma(_2967, -0.5, 0.5);
    float _3213 = precise::clamp(_3211, 0.0, 1.0);
    float _3215 = -_3199;
    float _3217 = _3215 + _3201;
    float _3219 = _3013 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3221 = -_3203;
    float _3223 = _3221 + _3205;
    float _3225 = fma(_3213, _3217, _3199);
    out.m_87.x = 0.0;
    float _3227 = -_3207;
    float _3229 = _3227 + _3209;
    float _3231 = fma(_3213, _3223, _3203);
    float _3233 = _3225 * 0.586610972881317138671875;
    out.m_51.x = _3219;
    bool _3235 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3237 = fma(_3213, _3229, _3207);
    float _3239 = fma(_3231, 0.298911988735198974609375, _3233);
    bool _3241 = _2367 > 0.0;
    bool _3243 = isnan(_2367);
    bool _3245 = _3241 || _3243;
    bool _3247 = isnan(0.0);
    bool _3249 = _3245 || _3247;
    float _3251 = fma(_3237, 0.114477999508380889892578125, _3239);
    bool _3253 = _2421 <= 0.0;
    bool _3255 = !_3249;
    bool _3257 = _3253 || _3255;
    float _3259 = -_3251;
    float _3261 = _3231 + _3259;
    float _3263 = -_3251;
    float _3265 = _3225 + _3263;
    float _3267 = -_3251;
    float _3269 = _3237 + _3267;
    float _3271 = fma(_3261, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3251);
    float _3273 = fma(_3265, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3251);
    float _3275 = fma(_3269, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3251);
    bool _3277 = !_3235;
    if (!_3277)
    {
        float _3279 = -_2303;
        float _3281 = _3279 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3283 = -_2305;
        float _3285 = _3283 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3287 = -_2307;
        float _3289 = _3287 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3291 = _3281 * _3281;
        float _3293 = fma(_3285, _3285, _3291);
        float _3295 = fma(_3289, _3289, _3293);
        float _3297 = sqrt(_3295);
        float _3299 = rsqrt(_3295);
        float _3301 = -_3297;
        float _3303 = _3301 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3305 = _3303 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3307 = precise::clamp(_3305, 0.0, 1.0);
        float _3309 = _3285 * _3299;
        float _3311 = _3281 * _3299;
        float _3313 = abs(_3307);
        float _3315 = log2(_3313);
        float _3317 = _3289 * _3299;
        float _3319 = _3309 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3321 = _2967 * _3311;
        float _3323 = -_3311;
        float _3325 = -_3319;
        float _3327 = fma(_3323, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3325);
        float _3329 = fma(_2955, _3309, _3321);
        float _3331 = -_3317;
        float _3333 = fma(_3331, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3327);
        float _3335 = fma(_2959, _3317, _3329);
        float _3337 = precise::clamp(_3335, 0.0, 1.0);
        float _3339 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3341 = _3333 + _3339;
        float _3343 = _3315 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3345 = _3341 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3347 = precise::clamp(_3345, 0.0, 1.0);
        float _3349 = exp2(_3343);
        float _3351 = _3349 * _3347;
        float _3353 = _3337 * _3351;
        float _3355 = _3353 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3357 = _3353 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3359 = _3353 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_87.x = _3355;
        out.m_87.y = _3357;
        out.m_87.z = _3359;
    }
    out.m_89.x = _3271;
    out.m_89.y = _3273;
    out.m_89.z = _3275;
    if (!_3257)
    {
        return out;
    }
    out.m_51.x = 0.0;
    float _3361 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3361;
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
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3113 = false;
    bool _1647 = false;
    bool _1459 = false;
    bool _359 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _109 = in.m_48.w;
    float _111 = trunc(_109);
    int _113 = int(_111);
    bool _117 = _113 >= 1;
    float _119 = 0.0;
    if (!_117)
    {
        _119 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _121 = _119;
    float _123 = _121;
    if (!_117)
    {
        out.m_51.x = 0.0;
    }
    int _125 = 0;
    if (!_117)
    {
        float _127 = _121 * 5.0;
        _125 = as_type<int>(_127);
    }
    int _129 = _125;
    int _131 = _129;
    if (!_117)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3418 = as_type<float>(_129);
        out.gl_Position.z = _3418;
    }
    if (!_117)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _133 = in.m_53.w;
    bool _135 = _133 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _137 = isnan(_133);
    bool _139 = _135 || _137;
    bool _141 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _143 = _139 || _141;
    float _145 = -_133;
    float _147 = _145 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _149 = _147;
    if (_143)
    {
        float _151 = float(_113);
        _123 = _151;
    }
    float _153 = _123;
    bool _155 = _147 >= _153;
    bool _157 = !_143;
    bool _159 = _155 || _157;
    float _161 = _153;
    if (_159)
    {
        _161 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _163 = _161;
    if (_159)
    {
        out.m_51.x = 0.0;
    }
    if (_159)
    {
        float _165 = _163 * 5.0;
        _131 = as_type<int>(_165);
    }
    int _167 = _131;
    if (_159)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3488 = as_type<float>(_167);
        out.gl_Position.z = _3488;
    }
    if (_159)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _169 = in.m_55.x;
    float _171 = in.m_55.y;
    float _173 = in.m_55.z;
    float _175 = in.m_57.x;
    float _177 = in.m_57.y;
    float _179 = in.m_57.z;
    float _181 = in.m_59.x;
    float _183 = in.m_59.y;
    float _185 = in.m_59.z;
    float _187 = in.m_61.x;
    float _189 = _169 * _169;
    float _191 = _173 * _173;
    float _193 = _171 * _171;
    float _195 = fma(_175, _175, _189);
    float _197 = fma(_179, _179, _191);
    float _199 = fma(_177, _177, _193);
    float _201 = fma(_181, _181, _195);
    float _203 = fma(_185, _185, _197);
    float _205 = fma(_183, _183, _199);
    float _207 = sqrt(_201);
    float _209 = sqrt(_203);
    float _211 = sqrt(_205);
    bool _213 = _207 > 0.0;
    bool _215 = _209 > 0.0;
    float _217 = 0.0;
    if (_213)
    {
        float _219 = rsqrt(_201);
        _217 = _219;
    }
    float _221 = _217;
    float _223 = 0.0;
    if (!_213)
    {
        _223 = 0.0;
    }
    float _225 = _223;
    bool _227 = _211 > 0.0;
    float _229 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _231 = 0.0;
    float _233 = _225;
    if (!_213)
    {
        _231 = 0.0;
    }
    float _235 = _231;
    float _237 = 0.0;
    float _239 = _235;
    if (_215)
    {
        float _241 = rsqrt(_203);
        _237 = _241;
    }
    float _243 = _237;
    float _245 = 0.0;
    if (!_213)
    {
        _245 = 0.0;
    }
    float _247 = _245;
    float _249 = _229 * _187;
    float _251 = 0.0;
    float _253 = _247;
    if (!_215)
    {
        _251 = 0.0;
    }
    float _255 = _251;
    float _257 = 0.0;
    float _259 = _255;
    if (!_215)
    {
        _257 = 0.0;
    }
    float _261 = _257;
    float _263 = 0.0;
    float _265 = _261;
    if (!_215)
    {
        _263 = 0.0;
    }
    float _267 = _263;
    float _269 = _209;
    float _271 = _267;
    if (_227)
    {
        float _273 = rsqrt(_205);
        _269 = _273;
    }
    float _275 = _269;
    if (_213)
    {
        float _277 = _221 * _175;
        _233 = _277;
    }
    float _279 = _233;
    if (_213)
    {
        float _281 = _221 * _169;
        _239 = _281;
    }
    float _283 = _239;
    if (_213)
    {
        float _285 = _221 * _181;
        _253 = _285;
    }
    float _287 = _253;
    bool _289 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _291 = 0.0;
    float _293 = 0.0;
    if (!_227)
    {
        _291 = 0.0;
        _293 = 0.0;
    }
    float _295 = _291;
    float _297 = _293;
    float _299 = 0.0;
    float _301 = _295;
    float _303 = _297;
    if (!_227)
    {
        _299 = 0.0;
    }
    float _305 = _299;
    float _307 = trunc(_249);
    int _309 = int(_307);
    float _311 = _305;
    if (_215)
    {
        float _313 = _243 * _173;
        _259 = _313;
    }
    float _315 = _259;
    if (_215)
    {
        float _317 = _243 * _179;
        _265 = _317;
    }
    float _319 = _265;
    if (_215)
    {
        float _321 = _243 * _185;
        _271 = _321;
    }
    float _323 = _271;
    if (_227)
    {
        float _325 = _275 * _177;
        _301 = _325;
    }
    float _327 = _301;
    if (_227)
    {
        float _329 = _275 * _171;
        _303 = _329;
    }
    float _331 = _303;
    if (_227)
    {
        float _333 = _275 * _183;
        _311 = _333;
    }
    float _335 = _311;
    int _337 = _309 << 4;
    int _339 = _337 + 1712;
    bool _341 = !_289;
    float _357;
    if (!_341)
    {
        float _343 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _345 = _187 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _347 = fma(_345, (*spvDescriptorSet0.vp_c9)._m0[11].y, _147);
        float _349 = _347 * _343;
        float _351 = floor(_349);
        float _353 = -_351;
        float _355 = _349 + _353;
        _357 = _355;
        _359 = true;
    }
    else
    {
        float _361 = float(_113);
        float _363 = 1.0 / _361;
        float _365 = _147 * _363;
        _357 = _365;
    }
    _359 = false;
    float _367 = _357;
    int _369 = int2(spvDescriptorSet0.vp_t_tcb_C.get_width(), spvDescriptorSet0.vp_t_tcb_C.get_height()).x;
    int _371 = _369;
    int _373 = 0;
    int _375 = _104(_371, _373, (*spvDescriptorSet0.support_buffer));
    float _377 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _379 = int(_377);
    float _381 = in.m_61.y;
    float _383 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _385 = int(_383);
    float _387 = float(_379);
    float _389 = 1.0 / _387;
    float _391 = float(uint(_385));
    int _393 = ~_385;
    int _395 = _393 + 1;
    int _397 = ~_385;
    int _399 = _397 + 1;
    float _401 = 1.0 / _391;
    float _403 = _147 * _389;
    float _405 = trunc(_403);
    int _407 = int(_405);
    int _409 = as_type<int>(_401) + (-2);
    float _411 = float(uint(_407));
    float _413 = as_type<float>(_409) * _411;
    float _415 = trunc(_413);
    float _417 = precise::max(_415, 0.0);
    uint _420 = uint(_417);
    int _422 = _395 * int(_420);
    int _424 = _422 + _407;
    float _426 = float(uint(_424));
    float _428 = as_type<float>(_409) * _426;
    int _430 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _432 = _430 != 0;
    float _434 = trunc(_428);
    float _436 = precise::max(_434, 0.0);
    uint _438 = uint(_436);
    bool _440 = !_432;
    float _442 = _440 ? 7.345489978790283203125 : 1.0;
    float _444 = _442 * _187;
    float _446 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[191].y;
    float _448 = float(_113);
    float _450 = floor(_444);
    int _452 = int(_420) + int(_438);
    float _454 = float(_385);
    float _456 = float(_407);
    int _458 = _399 * _452;
    int _460 = _458 + _407;
    float _462 = 1.0 / _448;
    bool _464 = _456 >= _454;
    bool _466 = isnan(_456);
    bool _468 = _464 || _466;
    bool _470 = isnan(_454);
    bool _472 = _468 || _470;
    float _474 = float(_472);
    bool _476 = uint(_460) >= uint(_385);
    bool _478 = !_476;
    int _480 = _478 ? 0 : (-1);
    float _482 = trunc(_474);
    int _484 = int(_482);
    float _486 = -_450;
    float _488 = _444 + _486;
    int _490 = ~_452;
    int _492 = _490 + _480;
    int _494 = _492 + 1;
    float _496 = _488 * _454;
    int _498 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _500 = _498 != 0;
    float _502 = _147 * _454;
    int _504 = _385 * _494;
    int _506 = _504 + _407;
    int _508 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _510 = _508 != 0;
    int _512 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _514 = _512 != 0;
    int _516 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _518 = _516 != 0;
    float _520 = trunc(_496);
    int _522 = int(_520);
    int _524 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _526 = _524 != 0;
    float _528 = _502 * _462;
    bool _530 = !_500;
    int _532 = _530 ? 0 : 1;
    bool _534 = _385 == 0;
    int _536 = ~_484;
    int _538 = _536 + 1;
    int _540 = _538 + 1;
    float _542 = trunc(_528);
    int _544 = int(_542);
    bool _546 = !_534;
    int _548 = _546 ? _506 : (-1);
    int _550 = _385 + (-1);
    int _552 = abs(_532);
    int _554 = _548 * _540;
    bool _556 = !_514;
    int _558 = _556 ? 0 : 1;
    int _560 = _484 * _550;
    int _562 = _560 + _554;
    int _564 = abs(_558);
    int _566 = _522 * _552;
    int _568 = _566 + _407;
    bool _570 = !_518;
    int _572 = _570 ? 0 : 1;
    float _574 = -_446;
    float _576 = _574 + (*spvDescriptorSet0.vp_c9)._m0[191].y;
    bool _578 = !_510;
    int _580 = _578 ? 0 : 1;
    int _582 = _562 * _564;
    int _584 = abs(_572);
    float _586 = fma((*spvDescriptorSet0.vp_c10)._m0[2].x, 0.0166666693985462188720703125, _187);
    int _588 = abs(_580);
    float _590 = fma(_576, _381, _446);
    bool _592 = !_526;
    int _594 = _592 ? 0 : 1;
    float _596 = _586 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    int _598 = _544 * _588;
    int _600 = _598 + _582;
    int _602 = abs(_594);
    float _604 = _596 * _590;
    int _606 = _568 * _584;
    int _608 = _606 + _600;
    int _610 = _522 * _602;
    int _612 = _610 + _608;
    float _614 = float(_375);
    int _616 = abs(_375);
    bool _618 = _375 == 0;
    float _620 = _604 * _614;
    float _622 = float(uint(_616));
    float _624 = trunc(_620);
    int _626 = int(_624);
    float _628 = 1.0 / _622;
    int _630 = abs(_626);
    uint _632 = uint(int(uint(_626) >> uint(31)));
    float _634 = float(uint(_630));
    int _636 = as_type<int>(_628) + (-2);
    float _638 = float(uint(_612));
    float _640 = as_type<float>(_636) * _634;
    float _642 = as_type<float>(_409) * _638;
    float _644 = trunc(_640);
    float _646 = precise::max(_644, 0.0);
    uint _648 = uint(_646);
    float _650 = trunc(_642);
    float _652 = precise::max(_650, 0.0);
    uint _654 = uint(_652);
    int _656 = ~int(_648);
    int _658 = _656 + 1;
    int _660 = _658 * _616;
    int _662 = _660 + _630;
    float _664 = float(uint(_662));
    float _666 = as_type<float>(_636) * _664;
    float _668 = in.m_63.z;
    float _670 = trunc(_666);
    float _672 = precise::max(_670, 0.0);
    uint _674 = uint(_672);
    int _676 = int(_648) + int(_674);
    int _678 = ~_385;
    int _680 = _678 + 1;
    int _682 = ~_676;
    int _684 = _682 + 1;
    float _686 = trunc(_668);
    int _688 = int(_686);
    int _690 = _684 * _616;
    int _692 = _690 + _630;
    bool _694 = uint(_692) >= uint(_616);
    bool _696 = !_694;
    int _698 = _696 ? 0 : (-1);
    int _700 = ~_676;
    int _702 = _700 + _698;
    int _704 = _702 + 1;
    int _706 = _704 * _616;
    int _708 = _706 + _630;
    int _710 = ~int(_632);
    int _712 = _710 + 1;
    int _714 = _680 * int(_654);
    int _716 = _714 + _612;
    int _718 = _708 ^ _712;
    int _720 = ~_712;
    int _722 = _720 + _718;
    int _724 = _722 + 1;
    float _726 = float(uint(_716));
    bool _728 = !_618;
    int _730 = _728 ? _724 : (-1);
    float _732 = as_type<float>(_409) * _726;
    int _734 = _730;
    int _736 = 0;
    int _738 = _105(_734, _736, (*spvDescriptorSet0.support_buffer));
    int _740 = _688;
    int _742 = 0;
    int _744 = _105(_740, _742, (*spvDescriptorSet0.support_buffer));
    float4 _747 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_738, _744)), 0).xyzw;
    float _749 = _747.x;
    float _751 = _747.y;
    float _753 = _747.z;
    float _755 = _747.w;
    float _757 = _187 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _759 = trunc(_732);
    float _761 = precise::max(_759, 0.0);
    uint _763 = uint(_761);
    int _765 = ~_385;
    int _767 = _765 + 1;
    float _769 = in.m_63.x;
    int _771 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _773 = _771 != 0;
    float _775 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _777 = _367 + _775;
    int _779 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _781 = _779 != 0;
    float _783 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _785 = _367 + _783;
    int _787 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _789 = _787 != 0;
    float _791 = float(uint(_568));
    bool _793 = _381 > 0.5;
    bool _795 = _793 && _789;
    bool _797 = _367 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _799 = isnan(_367);
    bool _801 = _797 || _799;
    bool _803 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _805 = _801 || _803;
    float _807 = float(_805);
    int _809 = int(_654) + int(_763);
    float _811 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _813 = -_807;
    float _815 = _813 + 1.0;
    float _817 = -_811;
    float _819 = fma(_757, 2.0, _817);
    int _821 = _767 * _809;
    int _823 = _821 + _612;
    float _825 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _827 = _825 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _829 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _831 = _829 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _833 = uint(_823) >= uint(_385);
    float _835 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _837 = _381 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _839 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _841 = !_833;
    int _843 = _841 ? 0 : (-1);
    float _845 = 1.0 / _831;
    float _847 = fma(_837, -2.0, _835);
    bool _849 = _187 > 0.5;
    bool _851 = _849 && _773;
    float _853 = fma(_187, (*spvDescriptorSet0.vp_c9)._m0[78].z, _839);
    int _855 = ~_809;
    int _857 = _855 + _843;
    int _859 = _857 + 1;
    float _861 = as_type<float>(_409) * _791;
    float _863 = -_147;
    float _865 = fma(_863, (*spvDescriptorSet0.vp_c9)._m0[76].x, _819);
    int _867 = _385 * _859;
    int _869 = _867 + _612;
    float _871 = 1.0 / _827;
    float _873 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _875 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _877 = _875 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _879 = !_534;
    int _881 = _879 ? _869 : (-1);
    float _883 = fma(_381, (*spvDescriptorSet0.vp_c9)._m0[78].w, _873);
    int _885 = ~_385;
    int _887 = _885 + 1;
    float _889 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[76].y, _847);
    float _891 = trunc(_861);
    float _893 = precise::max(_891, 0.0);
    uint _895 = uint(_893);
    int _897 = _881 >> 31;
    float _899 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _901 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _899;
    float _903 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _905 = _903 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    int _907 = _897 & 3;
    float _909 = _905 * _845;
    float _911 = 1.0 / _877;
    float _913 = _901 * _871;
    int _915 = _881 + _907;
    float _917 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _919 = _367 + _917;
    float _921 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _923 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _921;
    float _925 = 0.0;
    float _927 = _769;
    if (_773)
    {
        _925 = _769;
    }
    float _929 = _925;
    float _931 = fma(_909, _777, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    int _933 = _915 >> 2;
    int _935 = _887 * int(_895);
    int _937 = _935 + _568;
    float _939 = fma(_913, _919, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _941 = _929;
    if (_851)
    {
        float _943 = -_929;
        float _945 = _943 + 1.0;
        _941 = _945;
    }
    float _947 = _941;
    int _949 = _933 << 4;
    int _951 = _949 + 368;
    float _953 = float(uint(_937));
    uint _955 = uint(int(uint(_951) >> uint(2)));
    uint _957 = uint(int(uint(int(_955)) >> uint(2)));
    int _959 = int(_955) & 3;
    float _961 = (*spvDescriptorSet0.vp_c9)._m0[int(_957)][_959];
    int _963 = int(_955) + 1;
    uint _965 = uint(int(uint(_963) >> uint(2)));
    int _967 = _963 & 3;
    float _969 = (*spvDescriptorSet0.vp_c9)._m0[int(_965)][_967];
    float _971 = _923 * _911;
    bool _973 = _367 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _975 = isnan(_367);
    bool _977 = _973 || _975;
    bool _979 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _981 = _977 || _979;
    float _983 = float(_981);
    float _985 = as_type<float>(_409) * _953;
    bool _987 = _367 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _989 = isnan(_367);
    bool _991 = _987 || _989;
    bool _993 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _995 = _991 || _993;
    float _997 = float(_995);
    float _999 = fma(_971, _785, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    int _1001 = _881 & 3;
    bool _1003 = _1001 != 0;
    float _1005 = -_983;
    float _1007 = _1005 + 1.0;
    int _1009 = _881 & 3;
    bool _1011 = _1009 != 0;
    float _1013 = -_997;
    float _1015 = _1013 + 1.0;
    int _1017 = _1003 ? 0 : 1;
    float _1019 = _997 * _1007;
    bool _1021 = uint(_1009) > 1u;
    int _1023 = _951 + 8;
    uint _1025 = uint(int(uint(_1023) >> uint(2)));
    uint _1027 = uint(int(uint(int(_1025)) >> uint(2)));
    int _1029 = int(_1025) & 3;
    float _1031 = (*spvDescriptorSet0.vp_c9)._m0[int(_1027)][_1029];
    int _1033 = int(_1025) + 1;
    uint _1035 = uint(int(uint(_1033) >> uint(2)));
    int _1037 = _1033 & 3;
    float _1039 = (*spvDescriptorSet0.vp_c9)._m0[int(_1035)][_1037];
    float _1041 = trunc(_985);
    float _1043 = precise::max(_1041, 0.0);
    uint _1045 = uint(_1043);
    bool _1047 = _367 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1049 = isnan(_367);
    bool _1051 = _1047 || _1049;
    bool _1053 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1055 = _1051 || _1053;
    float _1057 = float(_1055);
    float _1059 = _807 * _1015;
    if (_773)
    {
        _927 = _947;
    }
    float _1061 = _927;
    bool _1063 = _1009 != 3;
    float _1065 = _1057 * _815;
    int _1067 = ~_1017;
    int _1069 = _1067 + 1;
    int _1071 = _1069 + 1;
    float _1073 = -_1057;
    float _1075 = _1073 + 1.0;
    float _1077 = _939 * _1065;
    int _1079 = _1071;
    if (!_1021)
    {
        int _1081 = ~_1017;
        int _1083 = _1081 + 1;
        _1079 = _1083;
    }
    int _1085 = _1079;
    int _1087 = _339 + 8;
    uint _1089 = uint(int(uint(_1087) >> uint(2)));
    uint _1091 = uint(int(uint(int(_1089)) >> uint(2)));
    int _1093 = int(_1089) & 3;
    float _1095 = (*spvDescriptorSet0.vp_c9)._m0[int(_1091)][_1093];
    int _1097 = ~_385;
    int _1099 = _1097 + 1;
    float _1101 = fma(_1075, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1077);
    bool _1103 = uint(_1009) >= 2u;
    int _1105 = int(_895) + int(_1045);
    float _1107 = fma(_931, _1059, _1101);
    uint _1109 = uint(int(uint(_339) >> uint(2)));
    uint _1111 = uint(int(uint(int(_1109)) >> uint(2)));
    int _1113 = int(_1109) & 3;
    float _1115 = (*spvDescriptorSet0.vp_c9)._m0[int(_1111)][_1113];
    int _1117 = int(_1109) + 1;
    uint _1119 = uint(int(uint(_1117) >> uint(2)));
    int _1121 = _1117 & 3;
    float _1123 = (*spvDescriptorSet0.vp_c9)._m0[int(_1119)][_1121];
    int _1125 = _1103 ? 0 : 1;
    float _1127 = fma(_999, _1019, _1107);
    int _1129 = abs(_1085);
    int _1131 = _1099 * _1105;
    int _1133 = _1131 + _568;
    bool _1135 = !_1011;
    int _1137 = _1135 ? 0 : 1;
    float _1139 = fma(_983, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1127);
    int _1141 = ~_1125;
    int _1143 = _1141 + 1;
    int _1145 = _1143 + 1;
    float _1147 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[77].z, _853);
    int _1149 = _1145;
    if (_1063)
    {
        int _1151 = ~_1125;
        int _1153 = _1151 + 1;
        _1149 = _1153;
    }
    int _1155 = _1149;
    float _1157 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[77].w, _883);
    int _1159 = abs(_1137);
    int _1161 = ~_1129;
    int _1163 = _1161 + 1;
    int _1165 = _1163 + 1;
    bool _1167 = _1009 != 3;
    int _1169 = _1165 * as_type<int>(_969);
    int _1171 = abs(_1155);
    float _1173 = in.m_63.y;
    bool _1175 = uint(_1133) >= uint(_385);
    int _1177 = ~_1159;
    int _1179 = _1177 + 1;
    int _1181 = _1179 + 1;
    bool _1183 = !_1167;
    int _1185 = _1183 ? 0 : (-1);
    int _1187 = _1181 * as_type<int>(_961);
    int _1189 = _1187 + _1169;
    bool _1191 = !_781;
    int _1193 = _1191 ? 0 : 1;
    int _1195 = abs(_1185);
    int _1197 = ~_1171;
    int _1199 = _1197 + 1;
    int _1201 = _1199 + 1;
    int _1203 = abs(_1193);
    int _1205 = ~_1195;
    int _1207 = _1205 + 1;
    int _1209 = _1207 + 1;
    int _1211 = _1201 * as_type<int>(_1031);
    int _1213 = _1211 + _1189;
    bool _1215 = !_1175;
    int _1217 = _1215 ? 0 : (-1);
    int _1219 = _730 + 1;
    int _1221 = _1209 * as_type<int>(_1039);
    int _1223 = _1221 + _1213;
    float _1225 = _1173;
    if (_795)
    {
        float _1227 = -_1173;
        float _1229 = _1227 + 1.0;
        _1225 = _1229;
    }
    float _1231 = _1225;
    int _1233 = ~_1105;
    int _1235 = _1233 + _1217;
    int _1237 = _1235 + 1;
    int _1239 = abs(_1219);
    float _1241 = fma(_1061, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    int _1243 = _385 * _1237;
    int _1245 = _1243 + _568;
    float _1247 = fma(_1231, (*spvDescriptorSet0.vp_c9)._m0[80].y, -0.5);
    float _1249 = fma(_1147, _1241, _865);
    float _1251 = float(uint(_1239));
    int _1253 = ~_1203;
    int _1255 = _1253 + 1;
    int _1257 = _1255 + 1;
    float _1259 = -_889;
    float _1261 = fma(_1157, _1247, _1259);
    bool _1263 = !_534;
    int _1265 = _1263 ? _1245 : (-1);
    float _1267 = as_type<float>(_636) * _1251;
    int _1269 = _1223 * _1257;
    float _1271 = _1123 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1273 = _1139 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    uint _1275 = uint(int(uint(_1219) >> uint(31)));
    int _1277 = _1265 * _1203;
    int _1279 = _1277 + _1269;
    float _1281 = trunc(_1267);
    float _1283 = precise::max(_1281, 0.0);
    uint _1285 = uint(_1283);
    float _1287 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1289 = _1115 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1291 = _1095 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1293 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1295 = _1287 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1297 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1299 = _1289 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1301 = _1293 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1303 = _1271 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1305 = _1297 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1307 = _1291 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1309 = float(_1279);
    float _1311 = _1261 + 0.5;
    int _1313 = ~int(_1275);
    int _1315 = _1313 + 1;
    out.m_65.x = _1301;
    out.m_65.y = _1305;
    out.m_65.z = _1295;
    float _1317 = _1249 + 0.5;
    out.m_67.x = _1299;
    out.m_67.y = _1303;
    out.m_67.z = _1307;
    out.m_67.w = _1273;
    out.m_69.x = _1309;
    int _1319 = ~int(_1285);
    int _1321 = _1319 + 1;
    int _1323 = _1321 * _616;
    int _1325 = _1323 + _1239;
    float _1327 = float(uint(_1325));
    float _1329 = as_type<float>(_636) * _1327;
    float _1331 = trunc(_1329);
    float _1333 = precise::max(_1331, 0.0);
    uint _1335 = uint(_1333);
    int _1337 = int(_1285) + int(_1335);
    int _1339 = ~_1337;
    int _1341 = _1339 + 1;
    int _1343 = _1341 * _616;
    int _1345 = _1343 + _1239;
    bool _1347 = uint(_1345) >= uint(_616);
    bool _1349 = !_1347;
    int _1351 = _1349 ? 0 : (-1);
    int _1353 = ~_1337;
    int _1355 = _1353 + _1351;
    int _1357 = _1355 + 1;
    int _1359 = _1357 * _616;
    int _1361 = _1359 + _1239;
    int _1363 = _1361 ^ _1315;
    int _1365 = ~_1315;
    int _1367 = _1365 + _1363;
    int _1369 = _1367 + 1;
    bool _1371 = !_618;
    int _1373 = _1371 ? _1369 : (-1);
    uint _1375 = as_type<uint>(half2(float2(_755, 0.0)));
    uint _1377 = extract_bits(_1375, 0u, 8u);
    int _1379 = int(_1377) & 255;
    uint _1381 = extract_bits(_1375, 8u, 8u);
    int _1383 = int(_1381) & 255;
    int _1385 = _1383 << 8;
    int _1387 = _1379 | _1385;
    bool _1389 = _1387 >= 32768;
    int _1391 = _1387 + (-1024);
    int _1393 = _1391;
    if (_1389)
    {
        int _1395 = ~_1387;
        int _1397 = _1395 + 33792;
        int _1399 = _1397 + 1;
        _1393 = _1399;
    }
    int _1401 = _1393;
    int _1403 = _1401 + 30719;
    float _1405 = float(_1403);
    float _1407 = fma(_1405, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _1409 = abs(_1407);
    float _1411 = -_1409;
    float _1413 = _1411 + 1.0;
    bool _1415 = _1407 < 0.0;
    float _1417 = float(_1415);
    float _1419 = abs(_1407);
    float _1421 = fma(_1419, -0.0187292993068695068359375, 0.074261002242565155029296875);
    int _1423 = as_type<int>(_1413) + (-218103808);
    float _1425 = abs(_1407);
    float _1427 = fma(_1425, _1421, -0.212114393711090087890625);
    bool _1429 = uint(_1423) >= 1920991232u;
    float _1431 = abs(_1407);
    float _1433 = fma(_1431, _1427, 1.570728778839111328125);
    bool _1435 = !_1429;
    float _1457;
    if (!_1435)
    {
        int _1437 = as_type<int>(_1413);
        int _1439 = _1351;
        int _1441 = 6448;
        int _1443 = as_type<int>(_1107);
        int _1445;
        int _1447;
        int _1449;
        int _1451;
        int _1453;
        int _1455;
        _102(_1437, _1439, _1441, _1443, _1445, _1447, _1449, _1451, _1453, _1455, out.gl_Position, out.gl_PointSize);
        _1457 = as_type<float>(_1453);
        _1459 = true;
    }
    else
    {
        float _1461 = rsqrt(_1413);
        float _1463 = _1413 * _1461;
        float _1465 = _1461 * 0.5;
        float _1467 = -_1463;
        float _1469 = 0.0 + _1467;
        float _1471 = fma(_1465, _1469, 0.5);
        float _1473 = fma(_1463, _1471, _1463);
        float _1475 = -_1473;
        float _1477 = 0.0 + _1475;
        float _1479 = fma(_1473, _1477, _1413);
        float _1481 = fma(_1465, _1479, _1473);
        _1457 = _1481;
    }
    _1459 = false;
    float _1483 = _1457;
    int _1485 = _1373;
    int _1487 = 0;
    int _1489 = _105(_1485, _1487, (*spvDescriptorSet0.support_buffer));
    int _1491 = _688;
    int _1493 = 0;
    int _1495 = _105(_1491, _1493, (*spvDescriptorSet0.support_buffer));
    float4 _1497 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_1489, _1495)), 0).xyzw;
    float _1499 = _1497.x;
    float _1501 = _1497.y;
    float _1503 = _1497.z;
    float _1505 = _1497.w;
    float _1507 = _1433 * _1483;
    float _1509 = _1417 * 2.0;
    float _1511 = _1405 * 3.883221149444580078125;
    float _1513 = floor(_620);
    float _1515 = -_1509;
    float _1517 = fma(_1507, _1515, _1507);
    float _1519 = _1511 * 0.15915493667125701904296875;
    float _1521 = fma(_1417, 3.1415927410125732421875, _1517);
    float _1523 = _1519 * 6.283185482025146484375;
    float _1525 = cos(_1523);
    float _1527 = _1521 * 0.15915493667125701904296875;
    float _1529 = _1527 * 6.283185482025146484375;
    float _1531 = sin(_1529);
    float _1533 = -_1513;
    float _1535 = _620 + _1533;
    float _1537 = _1519 * 6.283185482025146484375;
    float _1539 = sin(_1537);
    float _1541 = _1531 * _1525;
    float _1543 = _1531 * _1539;
    uint _1545 = as_type<uint>(half2(float2(_1505, 0.0)));
    float _1547 = -_749;
    float _1549 = _1547 + _1499;
    uint _1551 = extract_bits(_1545, 0u, 8u);
    int _1553 = int(_1551) & 255;
    uint _1555 = extract_bits(_1545, 8u, 8u);
    int _1557 = int(_1555) & 255;
    int _1559 = _1557 << 8;
    int _1561 = _1553 | _1559;
    float _1563 = fma(_1535, _1549, _749);
    bool _1565 = _1561 >= 32768;
    int _1567 = _1561 + (-1024);
    int _1569 = _1567;
    if (_1565)
    {
        int _1571 = ~_1561;
        int _1573 = _1571 + 33792;
        int _1575 = _1573 + 1;
        _1569 = _1575;
    }
    int _1577 = _1569;
    int _1579 = _1577 + 30719;
    float _1581 = float(_1579);
    float _1583 = -_751;
    float _1585 = _1583 + _1501;
    float _1587 = fma(_1581, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _1589 = fma(_1535, _1585, _751);
    float _1591 = abs(_1587);
    float _1593 = -_1591;
    float _1595 = _1593 + 1.0;
    float _1597 = abs(_1587);
    float _1599 = fma(_1597, -0.0187292993068695068359375, 0.074261002242565155029296875);
    bool _1601 = _1587 < 0.0;
    float _1603 = float(_1601);
    int _1605 = as_type<int>(_1595) + (-218103808);
    float _1607 = abs(_1587);
    float _1609 = fma(_1607, _1599, -0.212114393711090087890625);
    bool _1611 = uint(_1605) >= 1920991232u;
    float _1613 = -_753;
    float _1615 = _1613 + _1503;
    float _1617 = abs(_1587);
    float _1619 = fma(_1617, _1609, 1.570728778839111328125);
    float _1621 = fma(_1535, _1615, _753);
    bool _1623 = !_1611;
    float _1645;
    if (!_1623)
    {
        int _1625 = as_type<int>(_1595);
        int _1627 = as_type<int>(_1501);
        int _1629 = 7344;
        int _1631 = as_type<int>(_1527);
        int _1633;
        int _1635;
        int _1637;
        int _1639;
        int _1641;
        int _1643;
        _102(_1625, _1627, _1629, _1631, _1633, _1635, _1637, _1639, _1641, _1643, out.gl_Position, out.gl_PointSize);
        _1645 = as_type<float>(_1641);
        _1647 = true;
    }
    else
    {
        float _1649 = rsqrt(_1595);
        float _1651 = _1595 * _1649;
        float _1653 = _1649 * 0.5;
        float _1655 = -_1651;
        float _1657 = 0.0 + _1655;
        float _1659 = fma(_1653, _1657, 0.5);
        float _1661 = fma(_1651, _1659, _1651);
        float _1663 = -_1661;
        float _1665 = 0.0 + _1663;
        float _1667 = fma(_1661, _1665, _1595);
        float _1669 = fma(_1653, _1667, _1661);
        _1645 = _1669;
    }
    _1647 = false;
    float _1671 = _1645;
    float _1673 = in.m_61.x;
    float _1675 = in.m_61.y;
    float _1677 = in.m_61.z;
    float _1679 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1681 = log2(_1679);
    float _1683 = _1677 * 2.0;
    float _1685 = _1675 * 2.0;
    float _1687 = _1677 + _1673;
    float _1689 = _1673 * 2.0;
    float _1691 = _1675 + (-0.5);
    float _1693 = floor(_1685);
    float _1695 = _1687 + (-1.0);
    float _1697 = floor(_1683);
    float _1699 = fma(_1695, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1701 = floor(_1689);
    bool _1703 = _1697 > 0.0;
    bool _1705 = _1697 >= 0.0;
    bool _1707 = isnan(_1697);
    bool _1709 = _1705 || _1707;
    bool _1711 = isnan(0.0);
    bool _1713 = _1709 || _1711;
    int _1715 = _1713 ? 0 : 1;
    int _1717 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1719 = _1717 != 0;
    int _1721 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1723 = _1721 != 0;
    int _1725 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1727 = _1725 != 0;
    bool _1729 = _1693 > 0.0;
    bool _1731 = _1693 >= 0.0;
    bool _1733 = isnan(_1693);
    bool _1735 = _1731 || _1733;
    bool _1737 = isnan(0.0);
    bool _1739 = _1735 || _1737;
    float _1741 = _1681 * _147;
    int _1743 = ~_1715;
    int _1745 = _1743 + 1;
    int _1747 = _1745 + 1;
    bool _1749 = !_1719;
    int _1751 = _1749 ? 0 : 1;
    float _1753 = exp2(_1741);
    int _1755 = _1747;
    if (!_1703)
    {
        int _1757 = ~_1715;
        int _1759 = _1757 + 1;
        _1755 = _1759;
    }
    int _1761 = _1755;
    bool _1763 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1765 = isnan(1.0);
    bool _1767 = _1763 || _1765;
    bool _1769 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1771 = _1767 || _1769;
    float _1773 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1775 = 1.0 + _1773;
    int _1777 = abs(_1751);
    float _1779 = in.m_71.x;
    float _1781 = in.m_71.y;
    float _1783 = in.m_71.z;
    float _1785 = 1.0 / _1775;
    int _1787 = _1739 ? 0 : 1;
    float _1789 = _1675 + _1673;
    float _1791 = float(_1761);
    float _1793 = _1673 + (-0.5);
    float _1795 = float(_1777);
    float _1797 = _1789 + (-1.0);
    bool _1799 = !_1727;
    int _1801 = _1799 ? 0 : 1;
    float _1803 = -_1753;
    float _1805 = _1803 + 1.0;
    int _1807 = ~_1787;
    int _1809 = _1807 + 1;
    int _1811 = _1809 + 1;
    float _1813 = _1795 * _1791;
    int _1815 = _1811;
    if (!_1729)
    {
        int _1817 = ~_1787;
        int _1819 = _1817 + 1;
        _1815 = _1819;
    }
    int _1821 = _1815;
    float _1823 = fma(_1797, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _1825 = _1701 > 0.0;
    float _1827 = _1813 * (-2.0);
    bool _1829 = _1701 >= 0.0;
    bool _1831 = isnan(_1701);
    bool _1833 = _1829 || _1831;
    bool _1835 = isnan(0.0);
    bool _1837 = _1833 || _1835;
    bool _1839 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1841 = isnan(0.0);
    bool _1843 = _1839 || _1841;
    bool _1845 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1847 = _1843 || _1845;
    int _1849 = abs(_1801);
    float _1851 = _1847 ? _1805 : 0.0;
    float _1853 = float(_1849);
    float _1855 = float(_1821);
    if (_1771)
    {
        float _1857 = _1851 * _1785;
        _149 = _1857;
    }
    float _1859 = _149;
    int _1861 = _1837 ? 0 : 1;
    float _1863 = fma(_1823, _1827, _1823);
    bool _1865 = !_1723;
    int _1867 = _1865 ? 0 : 1;
    float _1869 = _1853 * _1855;
    int _1871 = ~_1861;
    int _1873 = _1871 + 1;
    int _1875 = _1873 + 1;
    int _1877 = _1875;
    if (!_1825)
    {
        int _1879 = ~_1861;
        int _1881 = _1879 + 1;
        _1877 = _1881;
    }
    int _1883 = _1877;
    float _1885 = _1869 * (-2.0);
    int _1887 = abs(_1867);
    float _1889 = fma(_1827, _1779, _1779);
    float _1891 = _1677 + (-0.5);
    float _1893 = fma(_1885, _1783, _1783);
    float _1895 = fma(_1793, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1889);
    float _1897 = float(_1883);
    float _1899 = fma(_1891, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1893);
    float _1901 = float(_1887);
    float _1903 = fma(_1863, _1859, _1895);
    float _1905 = fma(_1699, _1885, _1699);
    float _1907 = _1677 + _1675;
    float _1909 = in.m_48.x;
    float _1911 = in.m_48.y;
    float _1913 = in.m_48.z;
    float _1915 = _1901 * _1897;
    float _1917 = _1903 * 0.15915493667125701904296875;
    float _1919 = fma(_1905, _1859, _1899);
    float _1921 = in.m_59.x;
    float _1923 = in.m_59.y;
    float _1925 = in.m_59.z;
    float _1927 = in.m_59.w;
    float _1929 = _1915 * (-2.0);
    float _1931 = _1907 + (-1.0);
    float _1933 = _1919 * 0.15915493667125701904296875;
    float _1935 = in.m_57.x;
    float _1937 = in.m_57.y;
    float _1939 = in.m_57.z;
    float _1941 = in.m_57.w;
    float _1943 = fma(_1929, _1781, _1781);
    float _1945 = fma(_1931, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1947 = _1917 * 6.283185482025146484375;
    float _1949 = sin(_1947);
    float _1951 = in.m_73.y;
    float _1953 = fma(_1691, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1943);
    float _1955 = fma(_1945, _1929, _1945);
    float _1957 = in.m_75.x;
    float _1959 = in.m_75.y;
    float _1961 = in.m_75.z;
    float _1963 = fma(_1955, _1859, _1953);
    float _1965 = _1917 * 6.283185482025146484375;
    float _1967 = cos(_1965);
    float _1969 = _1963 * 0.15915493667125701904296875;
    float _1971 = _1933 * 6.283185482025146484375;
    float _1973 = sin(_1971);
    float _1975 = _1911 * _1923;
    float _1977 = _1911 * _1937;
    float _1979 = fma(_1909, _1921, _1975);
    float _1981 = _1933 * 6.283185482025146484375;
    float _1983 = cos(_1981);
    float _1985 = _1911 + _1951;
    float _1987 = fma(_1909, _1935, _1977);
    float _1989 = fma(_1913, _1925, _1979);
    float _1991 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1563);
    float _1993 = _1957 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1995 = _1959 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1997 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1589);
    float _1999 = _1969 * 6.283185482025146484375;
    float _2001 = sin(_1999);
    float _2003 = _1993 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2005 = _1995 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2007 = _1961 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _2009 = fma(_1913, _1939, _1987);
    float _2011 = _2003 * _1991;
    float _2013 = _1949 * _1973;
    float _2015 = _2005 * _1997;
    float _2017 = _1969 * 6.283185482025146484375;
    float _2019 = cos(_2017);
    float _2021 = _1967 * _1983;
    float _2023 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1621);
    float _2025 = _2007 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _2027 = _1967 * _1973;
    float _2029 = _1949 * _1983;
    float _2031 = _2009 + _1941;
    float _2033 = _2025 * _2023;
    float _2035 = fma(_2001, _2013, _2021);
    float _2037 = -_2027;
    float _2039 = fma(_2001, _2029, _2037);
    float _2041 = -_2029;
    float _2043 = fma(_2001, _2027, _2041);
    float _2045 = fma(_2001, _2021, _2013);
    float _2047 = _2035 * _2015;
    float _2049 = _2039 * _2015;
    float _2051 = _1985 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    bool _2053 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2055 = isnan(0.5);
    bool _2057 = _2053 || _2055;
    bool _2059 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2061 = _2057 || _2059;
    float _2063 = _2019 * _1973;
    float _2065 = _2019 * _1983;
    float _2067 = _1949 * _2019;
    float _2069 = _1967 * _2019;
    float _2071 = fma(_2063, _2011, _2047);
    float _2073 = fma(_2065, _2011, _2049);
    float _2075 = _2067 * _2015;
    float _2077 = fma(_2031, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2051);
    float _2079 = fma(_2043, _2033, _2071);
    float _2081 = fma(_2045, _2033, _2073);
    float _2083 = -_2001;
    float _2085 = fma(_2083, _2011, _2075);
    bool _2087 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2089 = isnan(0.5);
    bool _2091 = _2087 || _2089;
    bool _2093 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2095 = _2091 || _2093;
    float _2097 = _2079 * _335;
    float _2099 = _2079 * _327;
    float _2101 = fma(_2069, _2033, _2085);
    float _2103 = fma(_2081, _287, _2097);
    float _2105 = fma(_2081, _279, _2099);
    float _2107 = _1989 + _1927;
    float _2109 = _1985 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2111 = fma(_2101, _323, _2103);
    float _2113 = fma(_2101, _319, _2105);
    float _2115 = fma(_2107, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2077);
    float _2117 = fma(_2031, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2109);
    float _2119 = _2107 + _2111;
    float _2121 = _2031 + _2113;
    float _2123 = _2115 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2125 = fma(_2107, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2117);
    float _2127 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2129 = _2119 + _2127;
    float _2131 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2133 = _2121 + _2131;
    float _2135 = 1.0 / _2123;
    float _2137 = _2125 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2139 = _2129 * _2129;
    float _2141 = _2137 + _2123;
    float _2143 = fma(_2133, _2133, _2139);
    float _2145 = _2079 * _331;
    float _2147 = sqrt(_2143);
    float _2149 = fma(_2081, _283, _2145);
    float _2151 = _2141 * _2135;
    float _2153 = _2151 * 0.5;
    float _2155 = fma(_2101, _315, _2149);
    float _2157 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2159 = fma(_2153, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2157);
    float _2161 = _1985 + _2155;
    bool _2163 = _2147 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2165 = 1.0 / _2159;
    float _2167 = _2153;
    float _2169 = _2145;
    float _2171 = _2119;
    float _2173 = _2143;
    float _2175 = _2147;
    float _2177 = _2121;
    float _2179 = _2161;
    if (!_2163)
    {
        _2167 = _2121;
    }
    float _2181 = _2167;
    float _2183 = _2181;
    if (!_2163)
    {
        _2169 = _2161;
    }
    float _2185 = _2169;
    bool _2187 = !_2163;
    float _2189 = _2185;
    if (!_2187)
    {
        float _2191 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2193 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2195 = _2147 + _2193;
        float _2197 = _2161 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2199 = rsqrt(_2143);
        float _2201 = _2195 * _2191;
        float _2203 = _2201 * 0.15915493667125701904296875;
        float _2205 = _2203 * 6.283185482025146484375;
        float _2207 = cos(_2205);
        float _2209 = _2203 * 6.283185482025146484375;
        float _2211 = sin(_2209);
        float _2213 = _2207 + (-1.0);
        float _2215 = _2213 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2217 = fma(_2211, _2197, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2219 = fma(_2161, _2207, _2215);
        float _2221 = _2199 * _2217;
        float _2223 = fma(_2133, _2221, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2225 = fma(_2129, _2221, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2171 = _2225;
        _2183 = _2223;
        _2189 = _2219;
        _2173 = _2199;
        _2175 = _2203;
    }
    float _2227 = _2171;
    float _2229 = _2183;
    float _2231 = _2189;
    float _2233 = _2173;
    float _2235 = _2175;
    float _2237 = _2235;
    float _2239 = _2231;
    float _2241 = _2229;
    float _2243 = _2233;
    if (_2095)
    {
        _2237 = 1.0;
    }
    float _2245 = _2237;
    float _2247 = _2245;
    if (_2061)
    {
        _2177 = _2227;
    }
    float _2249 = _2177;
    float _2251 = _2249;
    if (!_2061)
    {
        float _2253 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2255 = _1985 + _2253;
        float _2257 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2259 = _2031 + _2257;
        float _2261 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2263 = -_2031;
        float _2265 = _2263 + _2229;
        float _2267 = _2255 * _2255;
        float _2269 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2271 = _2107 + _2269;
        float _2273 = -_2107;
        float _2275 = _2273 + _2227;
        float _2277 = fma(_2259, _2259, _2267);
        float _2279 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2281 = fma(_2271, _2271, _2277);
        float _2283 = sqrt(_2281);
        float _2285 = _2261 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2287 = precise::min(_2283, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2289 = _2287 * _2279;
        float _2291 = -_1985;
        float _2293 = _2291 + _2231;
        float _2295 = _2285 * _2289;
        float _2297 = fma(_2293, _2295, _1985);
        float _2299 = fma(_2265, _2295, _2031);
        float _2301 = fma(_2275, _2295, _2107);
        _2239 = _2297;
        _2241 = _2299;
        _2251 = _2301;
        _2243 = _2279;
    }
    float _2303 = _2239;
    float _2305 = _2241;
    float _2307 = _2251;
    float _2309 = _2243;
    if (_2095)
    {
        _2179 = 1.0;
    }
    float _2311 = _2179;
    float _2313 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2315 = _2165 * _2313;
    float _2317 = _2311;
    if (!_2095)
    {
        float _2319 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2321 = _2319 * 0.15915493667125701904296875;
        float _2323 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2325 = _2321 * 6.283185482025146484375;
        float _2327 = cos(_2325);
        float _2329 = _2323 * 0.15915493667125701904296875;
        float _2331 = _2321 * 6.283185482025146484375;
        float _2333 = sin(_2331);
        float _2335 = 1.0 / _2327;
        float _2337 = _2329 * 6.283185482025146484375;
        float _2339 = cos(_2337);
        float _2341 = _2333 * _2335;
        float _2343 = _2329 * 6.283185482025146484375;
        float _2345 = sin(_2343);
        float _2347 = _2339 * _2341;
        float _2349 = 1.0 / _2347;
        float _2351 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2353 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2351;
        float _2355 = 1.0 / _2353;
        float _2357 = _2345 * _2349;
        float _2359 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2361 = fma(_2315, _2357, _2359);
        float _2363 = _2361 * _2355;
        float _2365 = precise::clamp(_2363, 0.0, 1.0);
        _2247 = _2365;
    }
    float _2367 = _2247;
    if (!_2095)
    {
        float _2369 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2371 = _2369 * 0.15915493667125701904296875;
        float _2373 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2375 = _2371 * 6.283185482025146484375;
        float _2377 = cos(_2375);
        float _2379 = _2373 * 0.15915493667125701904296875;
        float _2381 = _2371 * 6.283185482025146484375;
        float _2383 = sin(_2381);
        float _2385 = 1.0 / _2377;
        float _2387 = _2379 * 6.283185482025146484375;
        float _2389 = cos(_2387);
        float _2391 = _2383 * _2385;
        float _2393 = _2379 * 6.283185482025146484375;
        float _2395 = sin(_2393);
        float _2397 = _2389 * _2391;
        float _2399 = 1.0 / _2397;
        float _2401 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2403 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2401;
        float _2405 = 1.0 / _2403;
        float _2407 = _2395 * _2399;
        float _2409 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2411 = fma(_2315, _2407, _2409);
        float _2413 = _2411 * _2405;
        float _2415 = precise::clamp(_2413, 0.0, 1.0);
        float _2417 = -_2415;
        float _2419 = _2417 + 1.0;
        _2317 = _2419;
    }
    float _2421 = _2317;
    float _2423 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2425 = _2303 + _2423;
    float _2427 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2429 = _2305 + _2427;
    float _2431 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2433 = _2307 + _2431;
    float _2435 = _2425 * _2425;
    float _2437 = fma(_2429, _2429, _2435);
    float _2439 = fma(_2433, _2433, _2437);
    float _2441 = rsqrt(_2439);
    float _2443 = sqrt(_2439);
    float _2445 = _2441 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2447 = _2429 * _2445;
    float _2449 = _2433 * _2445;
    float _2451 = _2447 * _2447;
    float _2453 = _2449 * _2449;
    float _2455 = _2451 + _2453;
    float _2457 = sqrt(_2455);
    bool _2459 = _2457 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2461 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2463 = _2457 + _2461;
    float _2465 = _2309;
    float _2467 = _2455;
    float _2469 = _2463;
    float _2471 = _2425;
    float _2473 = _2447;
    float _2475 = _2449;
    float _2477 = _2451;
    if (_2459)
    {
        float _2479 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2465 = _2479;
    }
    float _2481 = _2465;
    if (_2459)
    {
        float _2483 = rsqrt(_2455);
        _2467 = _2483;
    }
    float _2485 = _2467;
    if (_2459)
    {
        float _2487 = _2463 * _2481;
        _2469 = _2487;
    }
    float _2489 = _2469;
    float _2491 = 0.0;
    if (_2459)
    {
        float _2493 = _2489 * 0.15915493667125701904296875;
        _2491 = _2493;
    }
    float _2495 = _2491;
    float _2497 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2499 = _1969;
    float _2501 = _2497;
    if (_2459)
    {
        float _2503 = _2495 * 6.283185482025146484375;
        float _2505 = sin(_2503);
        _2499 = _2505;
    }
    float _2507 = _2499;
    float _2509 = precise::max(0.0, _2497);
    float _2511 = _2489;
    float _2513 = _2509;
    if (_2459)
    {
        float _2515 = _2495 * 6.283185482025146484375;
        float _2517 = cos(_2515);
        _2511 = _2517;
    }
    float _2519 = _2511;
    float _2521 = -_2445;
    float _2523 = -_2509;
    float _2525 = fma(_2425, _2521, _2523);
    if (_2459)
    {
        float _2527 = _2525 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2471 = _2527;
    }
    float _2529 = _2471;
    float _2531 = _2529;
    if (_2459)
    {
        float _2533 = fma(_2507, _2529, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2513 = _2533;
    }
    float _2535 = _2513;
    float _2537 = _2535;
    if (!_2459)
    {
        _2531 = _2525;
    }
    float _2539 = _2531;
    float _2541 = fma(_2031, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2543 = _2539;
    if (_2459)
    {
        float _2545 = _2485 * _2535;
        _2537 = _2545;
    }
    float _2547 = _2537;
    float _2549 = _2519;
    if (_2459)
    {
        float _2551 = _2519 + (-1.0);
        _2501 = _2551;
    }
    float _2553 = _2501;
    float _2555 = _2553;
    if (_2459)
    {
        float _2557 = _2447 * _2547;
        _2473 = _2557;
    }
    float _2559 = _2473;
    if (_2459)
    {
        float _2561 = _2449 * _2547;
        _2475 = _2561;
    }
    float _2563 = _2475;
    if (_2459)
    {
        float _2565 = _2553 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2555 = _2565;
    }
    float _2567 = _2555;
    if (_2459)
    {
        float _2569 = _2559 * _2559;
        _2477 = _2569;
    }
    float _2571 = _2477;
    if (_2459)
    {
        float _2573 = fma(_2525, _2519, _2567);
        _2543 = _2573;
    }
    float _2575 = _2543;
    float _2577 = _2303 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (!_2459)
    {
        _2549 = _2453;
    }
    float _2579 = _2549;
    float _2581 = _2579;
    if (_2459)
    {
        float _2583 = _2563 * _2563;
        _2581 = _2583;
    }
    float _2585 = _2581;
    float _2587 = fma(_2575, _2575, _2571);
    float _2589 = fma(_2305, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2577);
    float _2591 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2593 = fma(_2443, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2591);
    float _2595 = precise::clamp(_2593, 0.0, 1.0);
    float _2597 = floor(_2541);
    float _2599 = _2587 + _2585;
    float _2601 = fma(_2307, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2589);
    float _2603 = -_2595;
    float _2605 = _2603 + 1.0;
    float _2607 = fma(_2107, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2609 = _2601 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2611 = _2303 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2613 = rsqrt(_2599);
    float _2615 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2617 = _2609 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2619 = _2303 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2621 = -_2617;
    float _2623 = fma(_2621, _2615, 1.0);
    float _2625 = _2303 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2627 = fma(_2305, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2619);
    float _2629 = abs(_2605);
    float _2631 = log2(_2629);
    float _2633 = -_2597;
    float _2635 = _2541 + _2633;
    float _2637 = fma(_2305, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2625);
    float _2639 = fma(_2307, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2627);
    float _2641 = fma(_2307, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2637);
    float _2643 = _2639 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2645 = _2613 * _2559;
    float _2647 = fma(_2305, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2611);
    float _2649 = _2641 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2651 = _2643 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2653 = floor(_2607);
    float _2655 = _2613 * _2575;
    float _2657 = _2645 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2659 = fma(_2307, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2647);
    float _2661 = fma(_2649, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2651);
    float _2663 = _2613 * _2563;
    float _2665 = -_2657;
    float _2667 = fma(_2655, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2665);
    float _2669 = _2659 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2671 = fma(_2609, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2661);
    float _2673 = _2631 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2675 = -_2663;
    float _2677 = fma(_2675, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2667);
    float _2679 = log2(_2623);
    float _2681 = fma(_2669, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2671);
    float _2683 = _2643 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2685 = fma(_2677, -0.5, 0.5);
    float _2687 = fma(_2677, 0.5, 0.5);
    float _2689 = _2643 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2691 = -_2653;
    float _2693 = _2607 + _2691;
    float _2695 = fma(_2649, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2683);
    float _2697 = exp2(_2673);
    float _2699 = fma(_2649, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2689);
    float _2701 = _2655 + 1.0;
    float _2703 = fma(_2687, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2705 = 1.0 / _2681;
    float _2707 = fma(_2687, _2703, -0.212114393711090087890625);
    float _2709 = fma(_2609, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2695);
    float _2711 = fma(_2669, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2709);
    float _2713 = sqrt(_2685);
    float _2715 = -_2655;
    float _2717 = fma(_2697, _2701, _2715);
    float _2719 = fma(_2687, _2707, 1.570728778839111328125);
    float _2721 = _2679 * 0.693147182464599609375;
    float2 _7097 = float2(_2635, _2693);
    float _2723 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_7097, float2(0.0), isnan(_7097)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_7097, float2(0.0), isnan(_7097)), level(0.0)).x;
    float _2725 = fma(_2717, 0.5, 0.5);
    float _2727 = _2711 * _2705;
    float _2729 = fma(_2609, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2699);
    float _2731 = _2721 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2733 = fma(_2727, 0.5, 0.5);
    float _2735 = fma(_2669, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2729);
    float _2737 = _2713 * 0.636619746685028076171875;
    float _2739 = _2735 * _2705;
    float _2741 = -_2719;
    float _2743 = fma(_2737, _2741, 1.0);
    float _2745 = fma(_2739, -0.5, 0.5);
    float3 _7142 = float3(_2733, _2745, _2731);
    float _2747 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7142, float3(0.0), isnan(_7142)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7142, float3(0.0), isnan(_7142)), level(0.0)).x;
    float3 _7153 = float3(_2733, _2745, _2731);
    float4 _2749 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7153, float3(0.0), isnan(_7153)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7153, float3(0.0), isnan(_7153)), level(0.0)).xyzw;
    float _2751 = _2749.x;
    float _2753 = _2749.y;
    float _2755 = _2749.z;
    float _2757 = _2749.w;
    float2 _7169 = float2(_2743, _2725);
    float3 _2761 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7169, float2(0.0), isnan(_7169)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7169, float2(0.0), isnan(_7169)), level(0.0)).xyz;
    float _2763 = _2761.x;
    float _2765 = _2761.y;
    float _2767 = _2761.z;
    float _2769 = _1619 * _1671;
    float _2771 = _1603 * 2.0;
    float _2773 = _1581 * 3.883221149444580078125;
    bool _2775 = _1589 != 0.0;
    bool _2777 = isnan(_1589);
    bool _2779 = _2775 || _2777;
    bool _2781 = isnan(0.0);
    bool _2783 = _2779 || _2781;
    float _2785 = -_1407;
    float _2787 = _2785 + _1587;
    float _2789 = -_2771;
    float _2791 = fma(_2769, _2789, _2769);
    float _2793 = _2773 * 0.15915493667125701904296875;
    bool _2795 = _1563 == 0.0;
    bool _2797 = !_2783;
    bool _2799 = _2795 && _2797;
    float _2801 = fma(_1535, _2787, _1407);
    float _2803 = fma(_1603, 3.1415927410125732421875, _2791);
    float _2805 = _2793 * 6.283185482025146484375;
    float _2807 = cos(_2805);
    bool _2809 = _1621 == 0.0;
    bool _2811 = _2809 && _2799;
    out.m_77.x = _1317;
    out.m_77.y = _1311;
    float _2813 = _2803 * 0.15915493667125701904296875;
    float _2815 = _2631 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2817 = _2643 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2819 = abs(_2315);
    float _2821 = log2(_2819);
    float _2823 = fma(_2649, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2817);
    float _2825 = fma(_2609, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2823);
    float _2827 = _2801;
    float _2829 = _2681;
    if (!_2811)
    {
        float _2831 = fma(_1589, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2801);
        _2827 = _2831;
    }
    float _2833 = _2827;
    float _2835 = _2813 * 6.283185482025146484375;
    float _2837 = sin(_2835);
    bool _2839 = _2315 <= 8000.0;
    bool _2841 = isnan(_2315);
    bool _2843 = _2839 || _2841;
    bool _2845 = isnan(8000.0);
    bool _2847 = _2843 || _2845;
    float _2849 = float(_2847);
    float _2851 = _2039 * _2833;
    float _2853 = _2821 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2855 = _2793 * 6.283185482025146484375;
    float _2857 = sin(_2855);
    float _2859 = -_1541;
    float _2861 = fma(_2837, _2807, _2859);
    float _2863 = exp2(_2853);
    float _2865 = fma(_1535, _2861, _1541);
    float _2867 = _2865;
    if (!_2811)
    {
        float _2869 = fma(_1563, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2865);
        _2867 = _2869;
    }
    float _2871 = _2867;
    float _2873 = -_1543;
    float _2875 = fma(_2837, _2857, _2873);
    float _2877 = _2067 * _2833;
    float _2879 = exp2(_2815);
    float _2881 = fma(_2065, _2871, _2851);
    float _2883 = fma(_1535, _2875, _1543);
    float _2885 = -_2001;
    float _2887 = fma(_2885, _2871, _2877);
    float _2889 = in.m_73.x;
    float _2891 = fma(_2669, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2825);
    float _2893 = fma(_2863, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2895 = precise::clamp(_2893, 0.0, 1.0);
    float _2897 = _2035 * _2833;
    float _2899 = _2883;
    float _2901 = _2891;
    if (!_2811)
    {
        float _2903 = fma(_1621, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2883);
        _2899 = _2903;
    }
    float _2905 = _2899;
    bool _2907 = _2443 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2909 = isnan(_2443);
    bool _2911 = _2907 || _2909;
    bool _2913 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2915 = _2911 || _2913;
    float _2917 = fma(_2895, -2.0, 3.0);
    float _2919 = _2895 * _2895;
    float _2921 = fma(_2063, _2871, _2897);
    float _2923 = fma(_2045, _2905, _2881);
    float _2925 = fma(_2069, _2905, _2887);
    float _2927 = _2919 * _2917;
    float _2929 = fma(_2043, _2905, _2921);
    float _2931 = -_2879;
    float _2933 = _2931 + 1.0;
    float _2935 = -_2927;
    float _2937 = _2935 + 1.0;
    float _2939 = _2929 * _327;
    float _2941 = _2929 * _331;
    float _2943 = _2929 * _335;
    float _2945 = fma(_2937, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2927);
    float _2947 = fma(_2923, _279, _2939);
    float _2949 = _2933 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2951 = fma(_2923, _287, _2943);
    float _2953 = _2849 * _2945;
    float _2955 = fma(_2925, _319, _2947);
    float _2957 = _2891 + _2681;
    float _2959 = fma(_2925, _323, _2951);
    float _2961 = _2953 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.gl_Position.x = _2711;
    out.gl_Position.y = _2735;
    out.gl_Position.z = _2891;
    out.gl_Position.w = _2681;
    float _2963 = _2957 * 0.5;
    float _2965 = fma(_2923, _283, _2941);
    out.m_79.z = _2963;
    out.m_79.w = _2681;
    float _2967 = fma(_2925, _315, _2965);
    out.m_81.x = _2955;
    out.m_81.y = _2967;
    out.m_81.z = _2959;
    if (!_2915)
    {
        _2829 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2969 = _2829;
    float _2971 = _2969;
    float _2973 = _2969;
    if (!_2915)
    {
        _2901 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2975 = _2901;
    float _2977 = -_2723;
    float _2979 = _2977 + 1.0;
    float _2981 = _2979 * _2961;
    float _2983 = precise::clamp(_2981, 0.0, 1.0);
    float _2985 = -_2983;
    float _2987 = fma(_2985, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2989 = _2987 * _2889;
    float _2991 = _2989 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2993 = _2949 * _2747;
    float _2995 = -_2949;
    float _2997 = _2995 + 1.0;
    out.m_83.x = _2991;
    float _2999 = _2757 * _2993;
    float _3001 = _2767 * _2993;
    float _3003 = _2757 * _2997;
    float _3005 = _2367 * _2421;
    float _3007 = fma(_2763, _2999, _2751);
    float _3009 = fma(_2765, _2999, _2753);
    float _3011 = fma(_2757, _3001, _2755);
    float _3013 = _3005 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3015 = _2753;
    float _3017 = _2751;
    float _3019 = _2999;
    float _3021 = _3005;
    float _3023 = _2975;
    float _3025 = _2975;
    if (!_2915)
    {
        _3015 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3027 = _3015;
    float _3029 = _3027;
    float _3031 = _3027;
    if (!_2915)
    {
        _3017 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3033 = _3017;
    out.m_85.x = _3007;
    out.m_85.y = _3009;
    out.m_85.z = _3011;
    out.m_85.w = _3003;
    float _3035 = _3033;
    float _3037 = _3033;
    if (!_2915)
    {
        _3019 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3039 = _3019;
    float _3041 = _3039;
    float _3043 = _3039;
    if (!_2915)
    {
        _3021 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3045 = _3021;
    bool _3047 = !_2915;
    float _3049 = _3045;
    float _3051 = _3045;
    if (!_3047)
    {
        bool _3053 = _2443 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3055 = isnan(_2443);
        bool _3057 = _3053 || _3055;
        bool _3059 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3061 = _3057 || _3059;
        if (!_3061)
        {
            float _3063 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3065 = _2443 + _3063;
            float _3067 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3069 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3067;
            float _3071 = 1.0 / _3069;
            float _3073 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3075 = _3073 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3077 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3079 = _3077 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3081 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3083 = _3081 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3085 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3087 = _3085 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3089 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3091 = _3089 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3093 = _3065 * _3071;
            float _3095 = precise::clamp(_3093, 0.0, 1.0);
            float _3097 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3099 = _3097 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3101 = fma(_3095, _3075, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3103 = fma(_3095, _3099, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3105 = fma(_3095, _3079, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3107 = fma(_3095, _3083, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3109 = fma(_3095, _3087, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3111 = fma(_3095, _3091, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3037 = _3103;
            _3043 = _3109;
            _3031 = _3101;
            _3025 = _3107;
            _2973 = _3105;
            _3051 = _3111;
            _3113 = true;
        }
        else
        {
            bool _3115 = _2443 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3117 = isnan(_2443);
            bool _3119 = _3115 || _3117;
            bool _3121 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3123 = _3119 || _3121;
            if (!_3123)
            {
                _3029 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3125 = _3029;
            _3031 = _3125;
            if (!_3123)
            {
                _3035 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3127 = _3035;
            _3037 = _3127;
            if (!_3123)
            {
                _2971 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3129 = _2971;
            _2973 = _3129;
            if (!_3123)
            {
                _3023 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3131 = _3023;
            _3025 = _3131;
            if (!_3123)
            {
                _3041 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3133 = _3041;
            _3043 = _3133;
            if (!_3123)
            {
                _3049 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3135 = _3049;
            bool _3137 = !_3123;
            _3051 = _3135;
            if (!_3137)
            {
                bool _3139 = _2443 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3141 = isnan(_2443);
                bool _3143 = _3139 || _3141;
                bool _3145 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3147 = _3143 || _3145;
                if (!_3147)
                {
                    float _3149 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3151 = _2443 + _3149;
                    float _3153 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3155 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3153;
                    float _3157 = 1.0 / _3155;
                    float _3159 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3161 = _3159 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3163 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3165 = _3163 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3167 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3169 = _3167 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3171 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3173 = _3171 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3175 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3177 = _3175 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3179 = _3151 * _3157;
                    float _3181 = precise::clamp(_3179, 0.0, 1.0);
                    float _3183 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3185 = _3183 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3187 = fma(_3181, _3161, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3189 = fma(_3181, _3185, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3191 = fma(_3181, _3165, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3193 = fma(_3181, _3169, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3195 = fma(_3181, _3173, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3197 = fma(_3181, _3177, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3037 = _3189;
                    _3043 = _3195;
                    _3031 = _3187;
                    _3025 = _3193;
                    _2973 = _3191;
                    _3051 = _3197;
                    _3113 = true;
                }
                else
                {
                    _3037 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3043 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3031 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3025 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2973 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3051 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3113 = false;
    float _3199 = _3037;
    float _3201 = _3043;
    float _3203 = _3031;
    float _3205 = _3025;
    float _3207 = _2973;
    float _3209 = _3051;
    float _3211 = fma(_2967, -0.5, 0.5);
    float _3213 = precise::clamp(_3211, 0.0, 1.0);
    float _3215 = -_3199;
    float _3217 = _3215 + _3201;
    float _3219 = _3013 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3221 = -_3203;
    float _3223 = _3221 + _3205;
    float _3225 = fma(_3213, _3217, _3199);
    out.m_87.x = 0.0;
    float _3227 = -_3207;
    float _3229 = _3227 + _3209;
    float _3231 = fma(_3213, _3223, _3203);
    float _3233 = _3225 * 0.586610972881317138671875;
    out.m_51.x = _3219;
    bool _3235 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3237 = fma(_3213, _3229, _3207);
    float _3239 = fma(_3231, 0.298911988735198974609375, _3233);
    bool _3241 = _2367 > 0.0;
    bool _3243 = isnan(_2367);
    bool _3245 = _3241 || _3243;
    bool _3247 = isnan(0.0);
    bool _3249 = _3245 || _3247;
    float _3251 = fma(_3237, 0.114477999508380889892578125, _3239);
    bool _3253 = _2421 <= 0.0;
    bool _3255 = !_3249;
    bool _3257 = _3253 || _3255;
    float _3259 = -_3251;
    float _3261 = _3231 + _3259;
    float _3263 = -_3251;
    float _3265 = _3225 + _3263;
    float _3267 = -_3251;
    float _3269 = _3237 + _3267;
    float _3271 = fma(_3261, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3251);
    float _3273 = fma(_3265, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3251);
    float _3275 = fma(_3269, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3251);
    bool _3277 = !_3235;
    if (!_3277)
    {
        float _3279 = -_2303;
        float _3281 = _3279 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3283 = -_2305;
        float _3285 = _3283 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3287 = -_2307;
        float _3289 = _3287 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3291 = _3281 * _3281;
        float _3293 = fma(_3285, _3285, _3291);
        float _3295 = fma(_3289, _3289, _3293);
        float _3297 = sqrt(_3295);
        float _3299 = rsqrt(_3295);
        float _3301 = -_3297;
        float _3303 = _3301 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3305 = _3303 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3307 = precise::clamp(_3305, 0.0, 1.0);
        float _3309 = _3285 * _3299;
        float _3311 = _3281 * _3299;
        float _3313 = abs(_3307);
        float _3315 = log2(_3313);
        float _3317 = _3289 * _3299;
        float _3319 = _3309 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3321 = _2967 * _3311;
        float _3323 = -_3311;
        float _3325 = -_3319;
        float _3327 = fma(_3323, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3325);
        float _3329 = fma(_2955, _3309, _3321);
        float _3331 = -_3317;
        float _3333 = fma(_3331, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3327);
        float _3335 = fma(_2959, _3317, _3329);
        float _3337 = precise::clamp(_3335, 0.0, 1.0);
        float _3339 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3341 = _3333 + _3339;
        float _3343 = _3315 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3345 = _3341 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3347 = precise::clamp(_3345, 0.0, 1.0);
        float _3349 = exp2(_3343);
        float _3351 = _3349 * _3347;
        float _3353 = _3337 * _3351;
        float _3355 = _3353 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3357 = _3353 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3359 = _3353 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_87.x = _3355;
        out.m_87.y = _3357;
        out.m_87.z = _3359;
    }
    out.m_89.x = _3271;
    out.m_89.y = _3273;
    out.m_89.z = _3275;
    if (!_3257)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_51.x = 0.0;
    float _3361 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3361;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

