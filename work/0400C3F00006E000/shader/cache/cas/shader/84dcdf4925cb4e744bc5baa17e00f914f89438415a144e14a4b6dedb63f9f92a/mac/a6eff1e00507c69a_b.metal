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
    float4 m_85 [[user(locn2)]];
    float4 m_87 [[user(locn3)]];
    float4 m_93 [[user(locn4)]];
    float4 m_77 [[user(locn5)]];
    float4 m_91 [[user(locn6)]];
    float4 m_81 [[user(locn7)]];
    float4 m_75 [[user(locn8)]];
    float4 m_79 [[user(locn9)]];
    float4 m_89 [[user(locn10)]];
    float4 m_83 [[user(locn11)]];
    float4 m_51 [[user(locn12)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_69 [[attribute(0)]];
    float4 m_57 [[attribute(1)]];
    float4 m_55 [[attribute(2)]];
    float4 m_59 [[attribute(3)]];
    float4 m_71 [[attribute(4)]];
    float4 m_48 [[attribute(5)]];
    float4 m_53 [[attribute(6)]];
    float4 m_61 [[attribute(9)]];
    float4 m_73 [[attribute(10)]];
    float4 m_63 [[attribute(12)]];
};

static inline __attribute__((always_inline))
int _108(thread const int& _7589, thread const int& _7590, constant _10& support_buffer)
{
    float _7593 = as_type<float>(support_buffer._m4);
    int _7595 = _7590 + as_type<int>(_7593);
    int _7597 = 1 + _7595;
    float _7599 = support_buffer._m5[_7597].x;
    float _7601 = abs(_7599);
    bool _7603 = _7601 == 1.0;
    if (_7603)
    {
        return _7589;
    }
    float _7605 = float(_7589);
    float _7607 = _7605 / _7601;
    int _7609 = int(_7607);
    return _7609;
}

static inline __attribute__((always_inline))
int _109(thread const int& _7639, thread const int& _7640, constant _10& support_buffer)
{
    float _7643 = as_type<float>(support_buffer._m4);
    int _7645 = _7640 + as_type<int>(_7643);
    int _7647 = 1 + _7645;
    float _7649 = support_buffer._m5[_7647].x;
    bool _7651 = _7649 == 1.0;
    if (_7651)
    {
        return _7639;
    }
    float _7653 = float(_7639);
    float _7655 = _7653 * _7649;
    int _7657 = int(_7655);
    return _7657;
}

static inline __attribute__((always_inline))
void _106(thread const int& _7276, thread const int& _7277, thread const int& _7278, thread const int& _7279, thread const int& _7280, thread int& _7281, thread int& _7282, thread int& _7283, thread int& _7284, thread int& _7285, thread int& _7286, thread int& _7287, thread float4& gl_Position, thread float& gl_PointSize)
{
    gl_PointSize = 1.0;
    int _7290 = _7280;
    int _7292 = _7276;
    int _7294 = _7277;
    int _7296 = _7279;
    float _7298 = 0.0 + as_type<float>(_7276);
    bool _7300 = _7298 != 0.0;
    bool _7302 = isnan(_7298);
    bool _7304 = _7300 || _7302;
    bool _7306 = isnan(0.0);
    bool _7308 = _7304 || _7306;
    int _7310 = _7308 ? (-1) : 0;
    if (!_7308)
    {
        float _7312 = as_type<float>(_7276) * 1.0;
        _7290 = as_type<int>(_7312);
    }
    int _7314 = _7290;
    bool _7316 = !_7308;
    int _7318 = _7314;
    int _7320 = _7314;
    if (!_7316)
    {
        bool _7322 = _7298 >= 0.0;
        bool _7324 = isnan(_7298);
        bool _7326 = _7322 || _7324;
        bool _7328 = isnan(0.0);
        bool _7330 = _7326 || _7328;
        _7310 = _7330 ? (-1) : 0;
        if (!_7330)
        {
            _7318 = 2147483647;
        }
        int _7332 = _7318;
        bool _7334 = !_7330;
        int _7336 = _7332;
        _7320 = _7332;
        if (!_7334)
        {
            float _7338 = abs(as_type<float>(_7276));
            float _7340 = 0.0 + _7338;
            bool _7342 = _7340 > as_type<float>(0x7f800000u /* inf */);
            bool _7344 = isnan(_7340);
            bool _7346 = _7342 || _7344;
            bool _7348 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _7350 = _7346 || _7348;
            _7310 = _7350 ? (-1) : 0;
            if (_7350)
            {
                float _7352 = as_type<float>(_7276) + 1.0;
                _7336 = as_type<int>(_7352);
            }
            int _7354 = _7336;
            int _7356 = _7354;
            _7320 = _7354;
            if (!_7350)
            {
                bool _7358 = _7340 != as_type<float>(0x7f800000u /* inf */);
                bool _7360 = isnan(_7340);
                bool _7362 = _7358 || _7360;
                bool _7364 = isnan(as_type<float>(0x7f800000u /* inf */));
                bool _7366 = _7362 || _7364;
                _7310 = _7366 ? (-1) : 0;
                if (!_7366)
                {
                    _7356 = _7276;
                }
                int _7368 = _7356;
                bool _7370 = !_7366;
                _7320 = _7368;
                if (!_7370)
                {
                    float _7372 = as_type<float>(_7276) * 18446744073709551616.0;
                    float _7374 = rsqrt(_7372);
                    float _7376 = _7372 * _7374;
                    float _7378 = _7374 * 0.5;
                    float _7380 = -_7376;
                    float _7382 = 0.0 + _7380;
                    float _7384 = fma(_7378, _7382, 0.5);
                    float _7386 = fma(_7376, _7384, _7376);
                    float _7388 = -_7386;
                    float _7390 = 0.0 + _7388;
                    float _7392 = fma(_7386, _7390, _7372);
                    float _7394 = fma(_7378, _7392, _7386);
                    float _7396 = _7394 * 2.3283064365386962890625e-10;
                    _7292 = as_type<int>(_7372);
                    _7294 = as_type<int>(_7386);
                    _7296 = as_type<int>(_7382);
                    _7320 = as_type<int>(_7396);
                }
            }
        }
    }
    int _7398 = _7292;
    int _7400 = _7294;
    int _7402 = _7296;
    int _7404 = _7320;
    int _7406 = _7310;
    _7281 = _7398;
    _7282 = _7278;
    _7283 = 0;
    _7284 = _7400;
    _7285 = _7402;
    _7286 = _7404;
    _7287 = _7406;
}

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2631 = false;
    bool _1153 = false;
    bool _959 = false;
    bool _351 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _113 = in.m_48.w;
    float _115 = trunc(_113);
    int _117 = int(_115);
    bool _121 = _117 >= 1;
    float _123 = 0.0;
    if (!_121)
    {
        _123 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _125 = _123;
    float _127 = _125;
    if (!_121)
    {
        out.m_51.x = 0.0;
    }
    int _129 = 0;
    if (!_121)
    {
        float _131 = _125 * 5.0;
        _129 = as_type<int>(_131);
    }
    int _133 = _129;
    int _135 = _133;
    if (!_121)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2996 = as_type<float>(_133);
        out.gl_Position.z = _2996;
    }
    if (!_121)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _137 = in.m_53.w;
    bool _139 = _137 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _141 = isnan(_137);
    bool _143 = _139 || _141;
    bool _145 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _147 = _143 || _145;
    float _149 = -_137;
    float _151 = _149 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _153 = _151;
    if (_147)
    {
        float _155 = float(_117);
        _127 = _155;
    }
    float _157 = _127;
    bool _159 = _151 >= _157;
    bool _161 = !_147;
    bool _163 = _159 || _161;
    float _165 = _157;
    if (_163)
    {
        _165 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _167 = _165;
    if (_163)
    {
        out.m_51.x = 0.0;
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
        float _3066 = as_type<float>(_171);
        out.gl_Position.z = _3066;
    }
    if (_163)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _173 = in.m_55.x;
    float _175 = in.m_55.y;
    float _177 = in.m_55.z;
    float _179 = in.m_57.x;
    float _181 = in.m_57.y;
    float _183 = in.m_57.z;
    float _185 = in.m_59.x;
    float _187 = in.m_59.y;
    float _189 = in.m_59.z;
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
    float _221 = _203;
    if (_215)
    {
        float _223 = rsqrt(_203);
        _219 = _223;
    }
    float _225 = _219;
    float _227 = 0.0;
    float _229 = 0.0;
    if (!_215)
    {
        _227 = 0.0;
        _229 = 0.0;
    }
    float _231 = _227;
    float _233 = _229;
    bool _235 = _213 > 0.0;
    float _237 = 0.0;
    float _239 = _231;
    float _241 = _233;
    if (!_215)
    {
        _237 = 0.0;
    }
    float _243 = _237;
    float _245 = 0.0;
    float _247 = 0.0;
    float _249 = _243;
    if (!_217)
    {
        _245 = 0.0;
        _247 = 0.0;
    }
    float _251 = _245;
    float _253 = _247;
    float _255 = _209;
    float _257 = _253;
    float _259 = _251;
    if (_217)
    {
        float _261 = rsqrt(_205);
        _255 = _261;
    }
    float _263 = _255;
    float _265 = 0.0;
    if (!_217)
    {
        _265 = 0.0;
    }
    float _267 = _265;
    float _269 = 0.0;
    float _271 = _267;
    if (!_235)
    {
        _269 = 0.0;
    }
    float _273 = _269;
    float _275 = _213;
    float _277 = _273;
    if (_235)
    {
        float _279 = rsqrt(_207);
        _275 = _279;
    }
    float _281 = _275;
    float _283 = _225;
    if (_215)
    {
        float _285 = _225 * _179;
        _239 = _285;
    }
    float _287 = _239;
    if (_215)
    {
        float _289 = _225 * _173;
        _241 = _289;
    }
    float _291 = _241;
    if (_215)
    {
        float _293 = _225 * _185;
        _249 = _293;
    }
    float _295 = _249;
    bool _297 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    if (!_235)
    {
        _283 = 0.0;
    }
    float _299 = _283;
    float _301 = _299;
    if (!_235)
    {
        _221 = 0.0;
    }
    float _303 = _221;
    float _305 = _303;
    if (_217)
    {
        float _307 = _263 * _181;
        _271 = _307;
    }
    float _309 = _271;
    if (_217)
    {
        float _311 = _263 * _175;
        _257 = _311;
    }
    float _313 = _257;
    if (_217)
    {
        float _315 = _263 * _187;
        _259 = _315;
    }
    float _317 = _259;
    if (_235)
    {
        float _319 = _281 * _183;
        _277 = _319;
    }
    float _321 = _277;
    if (_235)
    {
        float _323 = _281 * _177;
        _301 = _323;
    }
    float _325 = _301;
    if (_235)
    {
        float _327 = _281 * _189;
        _305 = _327;
    }
    float _329 = _305;
    bool _331 = !_297;
    float _349;
    if (!_331)
    {
        float _333 = in.m_61.x;
        float _335 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _337 = _333 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _339 = fma(_337, (*spvDescriptorSet0.vp_c9)._m0[12].x, _151);
        float _341 = _339 * _335;
        float _343 = floor(_341);
        float _345 = -_343;
        float _347 = _341 + _345;
        _349 = _347;
        _351 = true;
    }
    else
    {
        float _353 = float(_117);
        float _355 = 1.0 / _353;
        float _357 = _151 * _355;
        _349 = _357;
    }
    _351 = false;
    float _359 = _349;
    int _361 = int2(spvDescriptorSet0.vp_t_tcb_C.get_width(), spvDescriptorSet0.vp_t_tcb_C.get_height()).x;
    int _363 = _361;
    int _365 = 0;
    int _367 = _108(_363, _365, (*spvDescriptorSet0.support_buffer));
    float _369 = in.m_61.x;
    float _371 = in.m_61.y;
    float _373 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[191].y;
    float _375 = -_373;
    float _377 = _375 + (*spvDescriptorSet0.vp_c9)._m0[191].y;
    float _379 = fma((*spvDescriptorSet0.vp_c10)._m0[2].x, 0.0166666693985462188720703125, _369);
    float _381 = fma(_377, _371, _373);
    float _383 = _379 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _385 = _383 * _381;
    float _387 = float(_367);
    int _389 = abs(_367);
    bool _391 = _367 == 0;
    float _393 = _385 * _387;
    float _395 = float(uint(_389));
    float _397 = trunc(_393);
    int _399 = int(_397);
    float _401 = 1.0 / _395;
    int _403 = abs(_399);
    uint _406 = uint(int(uint(_399) >> uint(31)));
    float _408 = float(uint(_403));
    int _410 = ~int(_406);
    int _412 = _410 + 1;
    int _414 = as_type<int>(_401) + (-2);
    float _416 = as_type<float>(_414) * _408;
    float _418 = trunc(_416);
    float _420 = precise::max(_418, 0.0);
    uint _422 = uint(_420);
    int _424 = ~int(_422);
    int _426 = _424 + 1;
    int _428 = _426 * _389;
    int _430 = _428 + _403;
    float _432 = float(uint(_430));
    float _434 = as_type<float>(_414) * _432;
    float _436 = trunc(_434);
    float _438 = precise::max(_436, 0.0);
    uint _440 = uint(_438);
    int _442 = int(_422) + int(_440);
    float _444 = in.m_63.z;
    int _446 = ~_442;
    int _448 = _446 + 1;
    int _450 = _448 * _389;
    int _452 = _450 + _403;
    bool _454 = uint(_452) >= uint(_389);
    bool _456 = !_454;
    int _458 = _456 ? 0 : (-1);
    int _460 = ~_442;
    int _462 = _460 + _458;
    int _464 = _462 + 1;
    float _466 = trunc(_444);
    int _468 = int(_466);
    int _470 = _464 * _389;
    int _472 = _470 + _403;
    int _474 = _472 ^ _412;
    int _476 = ~_412;
    int _478 = _476 + _474;
    int _480 = _478 + 1;
    bool _482 = !_391;
    int _484 = _482 ? _480 : (-1);
    int _486 = _484;
    int _488 = 0;
    int _490 = _109(_486, _488, (*spvDescriptorSet0.support_buffer));
    int _492 = _468;
    int _494 = 0;
    int _496 = _109(_492, _494, (*spvDescriptorSet0.support_buffer));
    float4 _499 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_490, _496)), 0).xyzw;
    float _501 = _499.x;
    float _503 = _499.y;
    float _505 = _499.z;
    float _507 = _499.w;
    int _509 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _511 = _509 != 0;
    bool _513 = _371 > 0.5;
    bool _515 = _513 && _511;
    float _517 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _519 = _517 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _521 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _523 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _521;
    int _525 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _527 = _525 != 0;
    float _529 = 1.0 / _519;
    float _531 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _533 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _531;
    float _535 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _537 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _539 = 1.0 / _523;
    float _541 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _543 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _545 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _547 = _541 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _549 = 1.0 / _533;
    float _551 = _543 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _553 = _545 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _555 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _557 = _359 + _555;
    float _559 = _535 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _561 = _537 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _563 = _359 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _565 = isnan(_359);
    bool _567 = _563 || _565;
    bool _569 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _571 = _567 || _569;
    float _573 = float(_571);
    float _575 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _577 = _359 + _575;
    float _579 = _557 * _529;
    float _581 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _583 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _585 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    bool _587 = _359 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _589 = isnan(_359);
    bool _591 = _587 || _589;
    bool _593 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _595 = _591 || _593;
    float _597 = float(_595);
    float _599 = _581 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _601 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _603 = _359 + _601;
    float _605 = _577 * _539;
    out.m_65.x = _547;
    out.m_65.y = _551;
    out.m_65.z = _553;
    out.m_65.w = _585;
    float _607 = _603 * _549;
    out.m_67.x = _559;
    out.m_67.y = _599;
    out.m_67.z = _561;
    out.m_67.w = _583;
    int _609 = _484 + 1;
    float _611 = 0.0;
    if (_527)
    {
        float _613 = in.m_61.x;
        _611 = _613;
    }
    float _615 = _611;
    float _617 = in.m_63.x;
    float _619 = -_573;
    float _621 = _619 + 1.0;
    float _623 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _625 = _623 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    bool _627 = _359 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _629 = isnan(_359);
    bool _631 = _627 || _629;
    bool _633 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _635 = _631 || _633;
    float _637 = float(_635);
    float _639 = _597 * _621;
    bool _641 = _359 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _643 = isnan(_359);
    bool _645 = _641 || _643;
    bool _647 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _649 = _645 || _647;
    float _651 = float(_649);
    float _653 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _655 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _653;
    float _657 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _659 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _657;
    float _661 = -_637;
    float _663 = _661 + 1.0;
    float _665 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _667 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _665;
    float _669 = -_597;
    float _671 = _669 + 1.0;
    float _673 = fma(_655, _607, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _675 = _651 * _663;
    float _677 = fma(_659, _607, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _679 = fma(_667, _607, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _681 = _637 * _671;
    float _683 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _685 = _683 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _687 = _673 * _675;
    float _689 = -_651;
    float _691 = _689 + 1.0;
    float _693 = _679 * _675;
    float _695 = _677 * _675;
    float _697 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _699 = _697 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _701 = fma(_691, (*spvDescriptorSet0.vp_c9)._m0[143].z, _687);
    float _703 = fma(_625, _579, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _705 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _707 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _705;
    float _709 = fma(_691, (*spvDescriptorSet0.vp_c9)._m0[143].x, _695);
    float _711 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _713 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _711;
    float _715 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _717 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _715;
    float _719 = fma(_685, _579, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _721 = fma(_691, (*spvDescriptorSet0.vp_c9)._m0[143].y, _693);
    float _723 = fma(_707, _605, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _725 = fma(_703, _681, _701);
    float _727 = fma(_717, _605, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _729 = fma(_719, _681, _721);
    float _731 = fma(_699, _579, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _733 = fma(_723, _639, _725);
    int _735 = abs(_609);
    float _737 = fma(_727, _639, _729);
    float _739 = fma(_713, _605, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _741 = fma(_731, _681, _709);
    float _743 = float(uint(_735));
    float _745 = in.m_63.y;
    bool _747 = _615 > 0.5;
    bool _749 = _747 && _527;
    float _751 = fma(_739, _639, _741);
    float _753 = (*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _755 = _731;
    if (_527)
    {
        _753 = _617;
    }
    float _757 = _753;
    float _759 = as_type<float>(_414) * _743;
    float _761 = _757;
    if (!_527)
    {
        _755 = _617;
    }
    float _763 = _755;
    float _765 = fma(_573, (*spvDescriptorSet0.vp_c9)._m0[146].x, _751);
    uint _767 = uint(int(uint(_609) >> uint(31)));
    float _769 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _771 = fma(_573, (*spvDescriptorSet0.vp_c9)._m0[146].y, _737);
    float _773 = fma(_573, (*spvDescriptorSet0.vp_c9)._m0[146].z, _733);
    int _775 = ~int(_767);
    int _777 = _775 + 1;
    float _779 = _763;
    if (_749)
    {
        float _781 = -_757;
        float _783 = _781 + 1.0;
        _761 = _783;
    }
    float _785 = _761;
    float _787 = trunc(_759);
    float _789 = precise::max(_787, 0.0);
    uint _791 = uint(_789);
    if (_527)
    {
        _779 = _785;
    }
    float _793 = _779;
    float _795 = _745;
    if (_515)
    {
        float _797 = -_745;
        float _799 = _797 + 1.0;
        _795 = _799;
    }
    float _801 = _795;
    float _803 = _793 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _805 = _801 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _807 = _803 * _769;
    int _809 = ~int(_791);
    int _811 = _809 + 1;
    int _813 = _811 * _389;
    int _815 = _813 + _735;
    float _817 = float(uint(_815));
    float _819 = as_type<float>(_414) * _817;
    float _821 = trunc(_819);
    float _823 = precise::max(_821, 0.0);
    uint _825 = uint(_823);
    int _827 = int(_791) + int(_825);
    int _829 = ~_827;
    int _831 = _829 + 1;
    int _833 = _831 * _389;
    int _835 = _833 + _735;
    bool _837 = uint(_835) >= uint(_389);
    bool _839 = !_837;
    int _841 = _839 ? 0 : (-1);
    int _843 = ~_827;
    int _845 = _843 + _841;
    int _847 = _845 + 1;
    int _849 = _847 * _389;
    int _851 = _849 + _735;
    int _853 = _851 ^ _777;
    int _855 = ~_777;
    int _857 = _855 + _853;
    int _859 = _857 + 1;
    float _861 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _863 = !_391;
    int _865 = _863 ? _859 : (-1);
    float _867 = _805 * _861;
    uint _869 = as_type<uint>(half2(float2(_507, 0.0)));
    uint _871 = extract_bits(_869, 0u, 8u);
    int _873 = int(_871) & 255;
    uint _875 = extract_bits(_869, 8u, 8u);
    int _877 = int(_875) & 255;
    int _879 = _877 << 8;
    int _881 = _873 | _879;
    bool _883 = _881 >= 32768;
    int _885 = _881 + (-1024);
    int _887 = _885;
    if (_883)
    {
        int _889 = ~_881;
        int _891 = _889 + 33792;
        int _893 = _891 + 1;
        _887 = _893;
    }
    int _895 = _887;
    int _897 = _895 + 30719;
    float _899 = float(_897);
    float _901 = fma(_899, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _903 = abs(_901);
    float _905 = -_903;
    float _907 = _905 + 1.0;
    float _909 = abs(_901);
    float _911 = fma(_909, -0.0187292993068695068359375, 0.074261002242565155029296875);
    bool _913 = _901 < 0.0;
    float _915 = float(_913);
    int _917 = as_type<int>(_907) + (-218103808);
    float _919 = abs(_901);
    float _921 = fma(_919, _911, -0.212114393711090087890625);
    bool _923 = uint(_917) >= 1920991232u;
    float _925 = abs(_901);
    float _927 = fma(_925, _921, 1.570728778839111328125);
    bool _929 = !_923;
    int _931 = as_type<int>(_907);
    float _957;
    if (!_929)
    {
        int _933 = as_type<int>(_907);
        int _935 = _917;
        int _937 = 4224;
        int _939 = as_type<int>(_907);
        int _941 = as_type<int>(_681);
        int _943;
        int _945;
        int _947;
        int _949;
        int _951;
        int _953;
        int _955;
        _106(_933, _935, _937, _939, _941, _943, _945, _947, _949, _951, _953, _955, out.gl_Position, out.gl_PointSize);
        _957 = as_type<float>(_953);
        _931 = _951;
        _959 = true;
    }
    else
    {
        float _961 = rsqrt(_907);
        float _963 = _907 * _961;
        float _965 = _961 * 0.5;
        float _967 = -_963;
        float _969 = 0.0 + _967;
        float _971 = fma(_965, _969, 0.5);
        float _973 = fma(_963, _971, _963);
        float _975 = -_973;
        float _977 = 0.0 + _975;
        float _979 = fma(_973, _977, _907);
        float _981 = fma(_965, _979, _973);
        _957 = _981;
    }
    _959 = false;
    float _983 = _957;
    int _985 = _931;
    int _987 = _865;
    int _989 = 0;
    int _991 = _109(_987, _989, (*spvDescriptorSet0.support_buffer));
    int _993 = _468;
    int _995 = 0;
    int _997 = _109(_993, _995, (*spvDescriptorSet0.support_buffer));
    float4 _999 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_991, _997)), 0).xyzw;
    float _1001 = _999.x;
    float _1003 = _999.y;
    float _1005 = _999.z;
    float _1007 = _999.w;
    float _1009 = floor(_393);
    float _1011 = _927 * _983;
    float _1013 = _915 * 2.0;
    float _1015 = _899 * 3.883221149444580078125;
    float _1017 = -_1013;
    float _1019 = fma(_1011, _1017, _1011);
    float _1021 = _1015 * 0.15915493667125701904296875;
    float _1023 = fma(_915, 3.1415927410125732421875, _1019);
    float _1025 = _1021 * 6.283185482025146484375;
    float _1027 = cos(_1025);
    float _1029 = _1023 * 0.15915493667125701904296875;
    float _1031 = -_1009;
    float _1033 = _393 + _1031;
    float _1035 = _1029 * 6.283185482025146484375;
    float _1037 = sin(_1035);
    float _1039 = _1021 * 6.283185482025146484375;
    float _1041 = sin(_1039);
    float _1043 = _1037 * _1027;
    float _1045 = _1037 * _1041;
    uint _1047 = as_type<uint>(half2(float2(_1007, 0.0)));
    float _1049 = -_501;
    float _1051 = _1049 + _1001;
    uint _1053 = extract_bits(_1047, 0u, 8u);
    int _1055 = int(_1053) & 255;
    uint _1057 = extract_bits(_1047, 8u, 8u);
    int _1059 = int(_1057) & 255;
    int _1061 = _1059 << 8;
    int _1063 = _1055 | _1061;
    float _1065 = fma(_1033, _1051, _501);
    bool _1067 = _1063 >= 32768;
    int _1069 = _1063 + (-1024);
    int _1071 = _1069;
    if (_1067)
    {
        int _1073 = ~_1063;
        int _1075 = _1073 + 33792;
        int _1077 = _1075 + 1;
        _1071 = _1077;
    }
    int _1079 = _1071;
    float _1081 = -_505;
    float _1083 = _1081 + _1005;
    int _1085 = _1079 + 30719;
    float _1087 = fma(_1033, _1083, _505);
    float _1089 = float(_1085);
    float _1091 = fma(_1089, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _1093 = abs(_1091);
    float _1095 = -_1093;
    float _1097 = _1095 + 1.0;
    float _1099 = abs(_1091);
    float _1101 = fma(_1099, -0.0187292993068695068359375, 0.074261002242565155029296875);
    bool _1103 = _1091 < 0.0;
    float _1105 = float(_1103);
    int _1107 = as_type<int>(_1097) + (-218103808);
    float _1109 = abs(_1091);
    float _1111 = fma(_1109, _1101, -0.212114393711090087890625);
    bool _1113 = uint(_1107) >= 1920991232u;
    float _1115 = -_503;
    float _1117 = _1115 + _1003;
    float _1119 = abs(_1091);
    float _1121 = fma(_1119, _1111, 1.570728778839111328125);
    float _1123 = fma(_1033, _1117, _503);
    bool _1125 = !_1113;
    float _1151;
    if (!_1125)
    {
        int _1127 = as_type<int>(_1097);
        int _1129 = as_type<int>(_1097);
        int _1131 = 5120;
        int _1133 = _985;
        int _1135 = as_type<int>(_1011);
        int _1137;
        int _1139;
        int _1141;
        int _1143;
        int _1145;
        int _1147;
        int _1149;
        _106(_1127, _1129, _1131, _1133, _1135, _1137, _1139, _1141, _1143, _1145, _1147, _1149, out.gl_Position, out.gl_PointSize);
        _1151 = as_type<float>(_1147);
        _1153 = true;
    }
    else
    {
        float _1155 = rsqrt(_1097);
        float _1157 = _1097 * _1155;
        float _1159 = _1155 * 0.5;
        float _1161 = -_1157;
        float _1163 = 0.0 + _1161;
        float _1165 = fma(_1159, _1163, 0.5);
        float _1167 = fma(_1157, _1165, _1157);
        float _1169 = -_1167;
        float _1171 = 0.0 + _1169;
        float _1173 = fma(_1167, _1171, _1097);
        float _1175 = fma(_1159, _1173, _1167);
        _1151 = _1175;
    }
    _1153 = false;
    float _1177 = _1151;
    float _1179 = in.m_61.x;
    float _1181 = in.m_61.y;
    float _1183 = in.m_61.z;
    float _1185 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1187 = log2(_1185);
    float _1189 = in.m_69.y;
    int _1191 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1193 = _1191 != 0;
    int _1195 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1197 = _1195 != 0;
    int _1199 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1201 = _1199 != 0;
    float _1203 = _1187 * _151;
    float _1205 = exp2(_1203);
    float _1207 = _1183 * 2.0;
    float _1209 = _1179 * 2.0;
    float _1211 = _1181 * 2.0;
    float _1213 = _1183 + _1179;
    float _1215 = floor(_1207);
    float _1217 = _1213 + (-1.0);
    float _1219 = floor(_1209);
    float _1221 = -_1205;
    float _1223 = _1221 + 1.0;
    bool _1225 = _1215 > 0.0;
    float _1227 = floor(_1211);
    bool _1229 = _1215 >= 0.0;
    bool _1231 = isnan(_1215);
    bool _1233 = _1229 || _1231;
    bool _1235 = isnan(0.0);
    bool _1237 = _1233 || _1235;
    float _1239 = _1181 + _1179;
    float _1241 = fma(_1217, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1243 = _1179 + (-0.5);
    int _1245 = _1237 ? 0 : 1;
    float _1247 = _1239 + (-1.0);
    bool _1249 = _1219 > 0.0;
    int _1251 = ~_1245;
    int _1253 = _1251 + 1;
    int _1255 = _1253 + 1;
    float _1257 = fma(_1247, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _1259 = _1219 >= 0.0;
    bool _1261 = isnan(_1219);
    bool _1263 = _1259 || _1261;
    bool _1265 = isnan(0.0);
    bool _1267 = _1263 || _1265;
    float _1269 = in.m_71.x;
    float _1271 = in.m_71.y;
    float _1273 = in.m_71.z;
    int _1275 = _1255;
    if (!_1225)
    {
        int _1277 = ~_1245;
        int _1279 = _1277 + 1;
        _1275 = _1279;
    }
    int _1281 = _1275;
    bool _1283 = !_1193;
    int _1285 = _1283 ? 0 : 1;
    bool _1287 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1289 = isnan(1.0);
    bool _1291 = _1287 || _1289;
    bool _1293 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1295 = _1291 || _1293;
    float _1297 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1299 = 1.0 + _1297;
    bool _1301 = _1227 > 0.0;
    bool _1303 = _1227 >= 0.0;
    bool _1305 = isnan(_1227);
    bool _1307 = _1303 || _1305;
    bool _1309 = isnan(0.0);
    bool _1311 = _1307 || _1309;
    float _1313 = 1.0 / _1299;
    int _1315 = abs(_1285);
    bool _1317 = !_1201;
    int _1319 = _1317 ? 0 : 1;
    int _1321 = _1311 ? 0 : 1;
    int _1323 = abs(_1319);
    bool _1325 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1327 = isnan(0.0);
    bool _1329 = _1325 || _1327;
    bool _1331 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1333 = _1329 || _1331;
    float _1335 = float(_1315);
    float _1337 = float(_1281);
    int _1339 = ~_1321;
    int _1341 = _1339 + 1;
    int _1343 = _1341 + 1;
    int _1345 = _1343;
    if (!_1301)
    {
        int _1347 = ~_1321;
        int _1349 = _1347 + 1;
        _1345 = _1349;
    }
    int _1351 = _1345;
    float _1353 = _1335 * _1337;
    float _1355 = _1333 ? _1223 : 0.0;
    float _1357 = float(_1323);
    float _1359 = _1353 * (-2.0);
    int _1361 = _1267 ? 0 : 1;
    if (_1295)
    {
        float _1363 = _1355 * _1313;
        _153 = _1363;
    }
    float _1365 = _153;
    float _1367 = float(_1351);
    bool _1369 = !_1197;
    int _1371 = _1369 ? 0 : 1;
    int _1373 = ~_1361;
    int _1375 = _1373 + 1;
    int _1377 = _1375 + 1;
    float _1379 = _1357 * _1367;
    int _1381 = _1377;
    if (!_1249)
    {
        int _1383 = ~_1361;
        int _1385 = _1383 + 1;
        _1381 = _1385;
    }
    int _1387 = _1381;
    float _1389 = fma(_1359, _1269, _1269);
    int _1391 = abs(_1371);
    float _1393 = _1379 * (-2.0);
    float _1395 = fma(_1257, _1359, _1257);
    float _1397 = fma(_1243, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1389);
    float _1399 = fma(_1241, _1393, _1241);
    float _1401 = fma(_1393, _1273, _1273);
    float _1403 = _1183 + (-0.5);
    float _1405 = float(_1391);
    float _1407 = fma(_1395, _1365, _1397);
    float _1409 = float(_1387);
    float _1411 = fma(_1403, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1401);
    float _1413 = _1183 + _1181;
    float _1415 = _1181 + (-0.5);
    float _1417 = _1407 * 0.15915493667125701904296875;
    float _1419 = _1405 * _1409;
    float _1421 = fma(_1399, _1365, _1411);
    float _1423 = in.m_73.x;
    float _1425 = in.m_73.y;
    float _1427 = in.m_73.z;
    float _1429 = _1413 + (-1.0);
    float _1431 = _1419 * (-2.0);
    float _1433 = _1421 * 0.15915493667125701904296875;
    float _1435 = in.m_48.x;
    float _1437 = in.m_48.y;
    float _1439 = in.m_48.z;
    float _1441 = fma(_1429, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1443 = fma(_1431, _1271, _1271);
    float _1445 = _1417 * 6.283185482025146484375;
    float _1447 = sin(_1445);
    float _1449 = in.m_57.x;
    float _1451 = in.m_57.y;
    float _1453 = in.m_57.z;
    float _1455 = in.m_57.w;
    float _1457 = fma(_1441, _1431, _1441);
    float _1459 = fma(_1415, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1443);
    float _1461 = in.m_59.x;
    float _1463 = in.m_59.y;
    float _1465 = in.m_59.z;
    float _1467 = in.m_59.w;
    float _1469 = fma(_1457, _1365, _1459);
    float _1471 = _1417 * 6.283185482025146484375;
    float _1473 = cos(_1471);
    float _1475 = _1469 * 0.15915493667125701904296875;
    float _1477 = _1433 * 6.283185482025146484375;
    float _1479 = sin(_1477);
    float _1481 = _765 * _1423;
    float _1483 = _773 * _1427;
    float _1485 = _771 * _1425;
    float _1487 = _1481 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1489 = _1483 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    bool _1491 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1493 = isnan(0.5);
    bool _1495 = _1491 || _1493;
    bool _1497 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1499 = _1495 || _1497;
    float _1501 = _1433 * 6.283185482025146484375;
    float _1503 = cos(_1501);
    float _1505 = _1437 * _1451;
    float _1507 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1087);
    float _1509 = _1485 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _1511 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1513 = isnan(0.5);
    bool _1515 = _1511 || _1513;
    bool _1517 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1519 = _1515 || _1517;
    float _1521 = _1437 * _1463;
    float _1523 = fma(_1435, _1449, _1505);
    float _1525 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1123);
    float _1527 = _1475 * 6.283185482025146484375;
    float _1529 = sin(_1527);
    float _1531 = fma(_1435, _1461, _1521);
    float _1533 = fma(_1439, _1453, _1523);
    float _1535 = _1437 + _1189;
    float _1537 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1065);
    float _1539 = fma(_1439, _1465, _1531);
    float _1541 = _1489 * _1507;
    float _1543 = _1447 * _1479;
    float _1545 = _1475 * 6.283185482025146484375;
    float _1547 = cos(_1545);
    float _1549 = _1473 * _1503;
    float _1551 = _1509 * _1525;
    float _1553 = _1473 * _1479;
    float _1555 = _1447 * _1503;
    float _1557 = _1487 * _1537;
    float _1559 = _1533 + _1455;
    float _1561 = _1539 + _1467;
    float _1563 = fma(_1529, _1543, _1549);
    float _1565 = -_1553;
    float _1567 = fma(_1529, _1555, _1565);
    float _1569 = -_1555;
    float _1571 = fma(_1529, _1553, _1569);
    float _1573 = fma(_1529, _1549, _1543);
    float _1575 = _1563 * _1551;
    float _1577 = _1547 * _1479;
    float _1579 = _1447 * _1547;
    float _1581 = _1547 * _1503;
    float _1583 = _1567 * _1551;
    float _1585 = fma(_1577, _1557, _1575);
    float _1587 = _1473 * _1547;
    float _1589 = _1579 * _1551;
    float _1591 = fma(_1581, _1557, _1583);
    float _1593 = fma(_1571, _1541, _1585);
    float _1595 = _1535 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1597 = -_1529;
    float _1599 = fma(_1597, _1557, _1589);
    float _1601 = fma(_1573, _1541, _1591);
    float _1603 = _1593 * _317;
    float _1605 = _1593 * _309;
    float _1607 = fma(_1587, _1541, _1599);
    float _1609 = fma(_1559, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1595);
    float _1611 = fma(_1601, _295, _1603);
    float _1613 = fma(_1601, _287, _1605);
    float _1615 = _1593 * _313;
    float _1617 = fma(_1561, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1609);
    float _1619 = fma(_1607, _329, _1611);
    float _1621 = fma(_1607, _321, _1613);
    float _1623 = fma(_1601, _291, _1615);
    float _1625 = _1617 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1627 = _1561 + _1619;
    float _1629 = _1559 + _1621;
    float _1631 = _1535 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1633 = 1.0 / _1625;
    float _1635 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1637 = _1627 + _1635;
    float _1639 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1641 = _1629 + _1639;
    float _1643 = fma(_1559, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1631);
    float _1645 = fma(_1607, _325, _1623);
    float _1647 = _1637 * _1637;
    float _1649 = fma(_1561, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1643);
    float _1651 = fma(_1641, _1641, _1647);
    float _1653 = _1649 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1655 = sqrt(_1651);
    float _1657 = _1653 + _1625;
    float _1659 = _1657 * _1633;
    float _1661 = _1659 * 0.5;
    float _1663 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1665 = fma(_1661, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1663);
    float _1667 = _1535 + _1645;
    float _1669 = 1.0 / _1665;
    bool _1671 = _1655 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1673 = _1623;
    float _1675 = _1601;
    float _1677 = _1645;
    float _1679 = _1633;
    float _1681 = _1625;
    float _1683 = _1641;
    float _1685 = _1637;
    float _1687 = _1467;
    if (!_1671)
    {
        _1673 = _1629;
    }
    float _1689 = _1673;
    float _1691 = _1689;
    if (!_1671)
    {
        _1675 = _1627;
    }
    float _1693 = _1675;
    float _1695 = _1693;
    if (!_1671)
    {
        _1677 = _1667;
    }
    float _1697 = _1677;
    bool _1699 = !_1671;
    float _1701 = _1697;
    if (!_1699)
    {
        float _1703 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1705 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1707 = _1655 + _1705;
        float _1709 = _1667 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1711 = rsqrt(_1651);
        float _1713 = _1707 * _1703;
        float _1715 = _1713 * 0.15915493667125701904296875;
        float _1717 = _1715 * 6.283185482025146484375;
        float _1719 = cos(_1717);
        float _1721 = _1715 * 6.283185482025146484375;
        float _1723 = sin(_1721);
        float _1725 = _1719 + (-1.0);
        float _1727 = _1725 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1729 = fma(_1723, _1709, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1731 = fma(_1667, _1719, _1727);
        float _1733 = _1711 * _1729;
        float _1735 = fma(_1641, _1733, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1737 = fma(_1637, _1733, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1691 = _1735;
        _1701 = _1731;
        _1679 = _1715;
        _1695 = _1737;
        _1681 = _1733;
    }
    float _1739 = _1691;
    float _1741 = _1701;
    float _1743 = _1679;
    float _1745 = _1695;
    float _1747 = _1681;
    float _1749 = _1747;
    float _1751 = _1745;
    float _1753 = _1743;
    if (_1519)
    {
        _1749 = 1.0;
    }
    float _1755 = _1749;
    float _1757 = _1755;
    if (_1499)
    {
        _1683 = _1739;
    }
    float _1759 = _1683;
    float _1761 = _1759;
    if (_1499)
    {
        _1685 = _1741;
    }
    float _1763 = _1685;
    float _1765 = _1763;
    if (!_1499)
    {
        float _1767 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1769 = _1535 + _1767;
        float _1771 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1773 = _1559 + _1771;
        float _1775 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1777 = -_1535;
        float _1779 = _1777 + _1741;
        float _1781 = _1769 * _1769;
        float _1783 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1785 = _1561 + _1783;
        float _1787 = -_1559;
        float _1789 = _1787 + _1739;
        float _1791 = -_1561;
        float _1793 = _1791 + _1745;
        float _1795 = fma(_1773, _1773, _1781);
        float _1797 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1799 = fma(_1785, _1785, _1795);
        float _1801 = sqrt(_1799);
        float _1803 = _1775 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1805 = precise::min(_1801, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1807 = _1805 * _1797;
        float _1809 = _1803 * _1807;
        float _1811 = fma(_1779, _1809, _1535);
        float _1813 = fma(_1789, _1809, _1559);
        float _1815 = fma(_1793, _1809, _1561);
        _1765 = _1811;
        _1761 = _1813;
        _1751 = _1815;
        _1753 = _1809;
    }
    float _1817 = _1765;
    float _1819 = _1761;
    float _1821 = _1751;
    float _1823 = _1753;
    float _1825 = _1823;
    if (_1519)
    {
        _1687 = 1.0;
    }
    float _1827 = _1687;
    float _1829 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1831 = _1669 * _1829;
    float _1833 = _1827;
    if (!_1519)
    {
        float _1835 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1837 = _1835 * 0.15915493667125701904296875;
        float _1839 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1841 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1843 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1841;
        float _1845 = _1837 * 6.283185482025146484375;
        float _1847 = cos(_1845);
        float _1849 = _1839 * 0.15915493667125701904296875;
        float _1851 = _1837 * 6.283185482025146484375;
        float _1853 = sin(_1851);
        float _1855 = 1.0 / _1847;
        float _1857 = _1849 * 6.283185482025146484375;
        float _1859 = cos(_1857);
        float _1861 = _1853 * _1855;
        float _1863 = _1849 * 6.283185482025146484375;
        float _1865 = sin(_1863);
        float _1867 = _1859 * _1861;
        float _1869 = 1.0 / _1843;
        float _1871 = 1.0 / _1867;
        float _1873 = _1865 * _1871;
        float _1875 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1877 = fma(_1831, _1873, _1875);
        float _1879 = _1877 * _1869;
        float _1881 = precise::clamp(_1879, 0.0, 1.0);
        _1825 = _1843;
        _1757 = _1881;
    }
    float _1883 = _1825;
    float _1885 = _1757;
    float _1887 = _1883;
    if (!_1519)
    {
        float _1889 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1891 = _1889 * 0.15915493667125701904296875;
        float _1893 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1895 = _1891 * 6.283185482025146484375;
        float _1897 = cos(_1895);
        float _1899 = _1893 * 0.15915493667125701904296875;
        float _1901 = _1891 * 6.283185482025146484375;
        float _1903 = sin(_1901);
        float _1905 = 1.0 / _1897;
        float _1907 = _1899 * 6.283185482025146484375;
        float _1909 = cos(_1907);
        float _1911 = _1903 * _1905;
        float _1913 = _1899 * 6.283185482025146484375;
        float _1915 = sin(_1913);
        float _1917 = _1909 * _1911;
        float _1919 = 1.0 / _1917;
        float _1921 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1923 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1921;
        float _1925 = 1.0 / _1923;
        float _1927 = _1915 * _1919;
        float _1929 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1931 = fma(_1831, _1927, _1929);
        float _1933 = _1931 * _1925;
        float _1935 = precise::clamp(_1933, 0.0, 1.0);
        float _1937 = -_1935;
        float _1939 = _1937 + 1.0;
        _1887 = _1919;
        _1833 = _1939;
    }
    float _1941 = _1887;
    float _1943 = _1833;
    float _1945 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1947 = _1817 + _1945;
    float _1949 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1951 = _1819 + _1949;
    float _1953 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1955 = _1821 + _1953;
    float _1957 = _1817 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1959 = _1947 * _1947;
    float _1961 = fma(_1819, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1957);
    float _1963 = fma(_1951, _1951, _1959);
    float _1965 = fma(_1821, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1961);
    float _1967 = fma(_1955, _1955, _1963);
    float _1969 = _1965 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1971 = rsqrt(_1967);
    float _1973 = sqrt(_1967);
    float _1975 = _1951 * _1971;
    float _1977 = _1955 * _1971;
    float _1979 = _1947 * _1971;
    float _1981 = _1975 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1983 = _1977 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1985 = _1981 * _1981;
    float _1987 = _1983 * _1983;
    float _1989 = _1985 + _1987;
    float _1991 = sqrt(_1989);
    bool _1993 = _1991 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1995 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1997 = _1991 + _1995;
    float _1999 = _1941;
    float _2001 = _1989;
    float _2003 = _1997;
    float _2005 = _1971;
    float _2007 = _1981;
    float _2009 = _1983;
    float _2011 = _1985;
    float _2013 = _1987;
    if (_1993)
    {
        float _2015 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1999 = _2015;
    }
    float _2017 = _1999;
    if (_1993)
    {
        float _2019 = rsqrt(_1989);
        _2001 = _2019;
    }
    float _2021 = _2001;
    if (_1993)
    {
        float _2023 = _1997 * _2017;
        _2003 = _2023;
    }
    float _2025 = _2003;
    float _2027 = 0.0;
    if (_1993)
    {
        float _2029 = _2025 * 0.15915493667125701904296875;
        _2027 = _2029;
    }
    float _2031 = _2027;
    float _2033 = _1627;
    if (_1993)
    {
        float _2035 = _2031 * 6.283185482025146484375;
        float _2037 = sin(_2035);
        _2033 = _2037;
    }
    float _2039 = _2033;
    float _2041 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2043 = precise::max(0.0, _2041);
    float _2045 = _1629;
    float _2047 = _2043;
    if (_1993)
    {
        float _2049 = _2031 * 6.283185482025146484375;
        float _2051 = cos(_2049);
        _2045 = _2051;
    }
    float _2053 = _2045;
    float _2055 = -_1979;
    float _2057 = -_2043;
    float _2059 = fma(_2055, (*spvDescriptorSet0.vp_c15)._m0[24].y, _2057);
    float _2061 = _2059;
    if (_1993)
    {
        float _2063 = _2059 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2005 = _2063;
    }
    float _2065 = _2005;
    float _2067 = _2039;
    if (_1993)
    {
        float _2069 = fma(_2039, _2065, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2067 = _2069;
    }
    float _2071 = _2067;
    float _2073 = _2071;
    if (_1993)
    {
        float _2075 = _2053 + (-1.0);
        _2047 = _2075;
    }
    float _2077 = _2047;
    float _2079 = _2077;
    if (_1993)
    {
        float _2081 = _2021 * _2071;
        _2073 = _2081;
    }
    float _2083 = _2073;
    float _2085 = fma(_1559, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    if (_1993)
    {
        float _2087 = _2077 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2079 = _2087;
    }
    float _2089 = _2079;
    if (_1993)
    {
        float _2091 = _1981 * _2083;
        _2007 = _2091;
    }
    float _2093 = _2007;
    if (_1993)
    {
        float _2095 = _1983 * _2083;
        _2009 = _2095;
    }
    float _2097 = _2009;
    if (_1993)
    {
        float _2099 = fma(_2059, _2053, _2089);
        _2061 = _2099;
    }
    float _2101 = _2061;
    if (_1993)
    {
        float _2103 = _2093 * _2093;
        _2011 = _2103;
    }
    float _2105 = _2011;
    if (_1993)
    {
        float _2107 = _2097 * _2097;
        _2013 = _2107;
    }
    float _2109 = _2013;
    float _2111 = _1817 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2113 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2115 = fma(_2101, _2101, _2105);
    float _2117 = floor(_2085);
    float _2119 = fma(_1819, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2111);
    float _2121 = _2115 + _2109;
    float _2123 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2125 = fma(_1973, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2123);
    float _2127 = precise::clamp(_2125, 0.0, 1.0);
    float _2129 = fma(_1821, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2119);
    float _2131 = rsqrt(_2121);
    float _2133 = _2129 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2135 = -_2127;
    float _2137 = _2135 + 1.0;
    float _2139 = _2133 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2141 = fma(_1561, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2143 = _1817 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2145 = _1817 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2147 = -_2139;
    float _2149 = fma(_2147, _2113, 1.0);
    float _2151 = abs(_2137);
    float _2153 = log2(_2151);
    float _2155 = fma(_1819, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2143);
    float _2157 = fma(_1819, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2145);
    float _2159 = -_2117;
    float _2161 = _2085 + _2159;
    float _2163 = _2131 * _2093;
    float _2165 = fma(_1821, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2157);
    float _2167 = _2131 * _2097;
    float _2169 = _2131 * _2101;
    float _2171 = _2163 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2173 = fma(_1821, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2155);
    float _2175 = _2165 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2177 = floor(_2141);
    float _2179 = -_2171;
    float _2181 = fma(_2169, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2179);
    float _2183 = _2173 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2185 = _2175 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2187 = _2153 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2189 = -_2167;
    float _2191 = fma(_2189, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2181);
    float _2193 = fma(_2183, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2185);
    float _2195 = log2(_2149);
    float _2197 = fma(_2191, -0.5, 0.5);
    float _2199 = exp2(_2187);
    float _2201 = fma(_2133, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2193);
    float _2203 = fma(_2191, 0.5, 0.5);
    float _2205 = _2175 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2207 = -_2177;
    float _2209 = _2141 + _2207;
    float _2211 = fma(_1969, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2201);
    float _2213 = _2175 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2215 = fma(_2183, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2205);
    float _2217 = sqrt(_2197);
    float _2219 = fma(_2203, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2221 = fma(_2183, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2213);
    float _2223 = fma(_2133, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2215);
    float _2225 = _2169 + 1.0;
    float _2227 = fma(_2203, _2219, -0.212114393711090087890625);
    float _2229 = fma(_2133, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2221);
    float _2231 = fma(_1969, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2223);
    float _2233 = 1.0 / _2211;
    float _2235 = -_2169;
    float _2237 = fma(_2199, _2225, _2235);
    float _2239 = fma(_1969, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2229);
    float _2241 = _2195 * 0.693147182464599609375;
    float2 _6042 = float2(_2161, _2209);
    float _2243 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6042, float2(0.0), isnan(_6042)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6042, float2(0.0), isnan(_6042)), level(0.0)).x;
    float _2245 = fma(_2203, _2227, 1.570728778839111328125);
    float _2247 = _2241 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2249 = _2217 * 0.636619746685028076171875;
    float _2251 = -_2245;
    float _2253 = fma(_2249, _2251, 1.0);
    float _2255 = fma(_2237, 0.5, 0.5);
    float _2257 = _2239 * _2233;
    float _2259 = _2231 * _2233;
    float _2261 = fma(_2257, 0.5, 0.5);
    float _2263 = fma(_2259, -0.5, 0.5);
    float3 _6080 = float3(_2261, _2263, _2247);
    float _2265 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6080, float3(0.0), isnan(_6080)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6080, float3(0.0), isnan(_6080)), level(0.0)).x;
    float3 _6091 = float3(_2261, _2263, _2247);
    float4 _2267 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6091, float3(0.0), isnan(_6091)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6091, float3(0.0), isnan(_6091)), level(0.0)).xyzw;
    float _2269 = _2267.x;
    float _2271 = _2267.y;
    float _2273 = _2267.z;
    float _2275 = _2267.w;
    float2 _6107 = float2(_2253, _2255);
    float3 _2279 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6107, float2(0.0), isnan(_6107)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6107, float2(0.0), isnan(_6107)), level(0.0)).xyz;
    float _2281 = _2279.x;
    float _2283 = _2279.y;
    float _2285 = _2279.z;
    float _2287 = _1121 * _1177;
    float _2289 = _1105 * 2.0;
    float _2291 = _1089 * 3.883221149444580078125;
    bool _2293 = _1123 != 0.0;
    bool _2295 = isnan(_1123);
    bool _2297 = _2293 || _2295;
    bool _2299 = isnan(0.0);
    bool _2301 = _2297 || _2299;
    float _2303 = -_901;
    float _2305 = _2303 + _1091;
    float _2307 = -_2289;
    float _2309 = fma(_2287, _2307, _2287);
    float _2311 = _2291 * 0.15915493667125701904296875;
    bool _2313 = _1065 == 0.0;
    bool _2315 = !_2301;
    bool _2317 = _2313 && _2315;
    float _2319 = fma(_1033, _2305, _901);
    float _2321 = fma(_1105, 3.1415927410125732421875, _2309);
    out.m_75.x = _807;
    out.m_75.y = _867;
    float _2323 = abs(_1831);
    float _2325 = log2(_2323);
    bool _2327 = _1087 == 0.0;
    bool _2329 = _2327 && _2317;
    float _2331 = _2321 * 0.15915493667125701904296875;
    float _2333 = _2153 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2335 = _2175 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_77.x = _1559;
    float _2337 = _2311 * 6.283185482025146484375;
    float _2339 = cos(_2337);
    bool _2341 = _1831 <= 8000.0;
    bool _2343 = isnan(_1831);
    bool _2345 = _2341 || _2343;
    bool _2347 = isnan(8000.0);
    bool _2349 = _2345 || _2347;
    float _2351 = float(_2349);
    float _2353 = fma(_2183, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2335);
    out.m_77.z = _1561;
    float _2355 = _2319;
    float _2357 = _2211;
    float _2359 = _2231;
    if (!_2329)
    {
        float _2361 = fma(_1123, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2319);
        _2355 = _2361;
    }
    float _2363 = _2355;
    out.m_79.x = _1819;
    out.m_79.y = _1817;
    out.m_79.z = _1821;
    float _2365 = _2331 * 6.283185482025146484375;
    float _2367 = sin(_2365);
    float _2369 = _2325 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2371 = _1563 * _2363;
    float _2373 = _1567 * _2363;
    float _2375 = _1579 * _2363;
    float _2377 = _2311 * 6.283185482025146484375;
    float _2379 = sin(_2377);
    float _2381 = exp2(_2369);
    float _2383 = -_1043;
    float _2385 = fma(_2367, _2339, _2383);
    float _2387 = fma(_1033, _2385, _1043);
    float _2389 = -_1045;
    float _2391 = fma(_2367, _2379, _2389);
    float _2393 = _2387;
    if (!_2329)
    {
        float _2395 = fma(_1065, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2387);
        _2393 = _2395;
    }
    float _2397 = _2393;
    float _2399 = exp2(_2333);
    float _2401 = fma(_1033, _2391, _1045);
    float _2403 = fma(_1577, _2397, _2371);
    float _2405 = fma(_1581, _2397, _2373);
    float _2407 = fma(_2381, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2409 = precise::clamp(_2407, 0.0, 1.0);
    float _2411 = _2401;
    if (!_2329)
    {
        float _2413 = fma(_1087, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2401);
        _2411 = _2413;
    }
    float _2415 = _2411;
    float _2417 = -_1529;
    float _2419 = fma(_2417, _2397, _2375);
    float _2421 = fma(_2133, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2353);
    float _2423 = fma(_2409, -2.0, 3.0);
    float _2425 = _2409 * _2409;
    float _2427 = fma(_1571, _2415, _2403);
    float _2429 = fma(_1573, _2415, _2405);
    float _2431 = fma(_1587, _2415, _2419);
    float _2433 = _2425 * _2423;
    float _2435 = _2427 * _313;
    float _2437 = _2427 * _309;
    float _2439 = _2427 * _317;
    float _2441 = -_2433;
    float _2443 = _2441 + 1.0;
    float _2445 = fma(_2429, _291, _2435);
    float _2447 = fma(_2429, _287, _2437);
    float _2449 = fma(_2429, _295, _2439);
    float _2451 = fma(_2443, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2433);
    float _2453 = fma(_2431, _325, _2445);
    float _2455 = in.m_69.x;
    float _2457 = -_2399;
    float _2459 = _2457 + 1.0;
    float _2461 = _2351 * _2451;
    float _2463 = fma(_2431, _321, _2447);
    float _2465 = fma(_2431, _329, _2449);
    float _2467 = _2461 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2469 = _2459 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2471 = fma(_1969, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2421);
    out.m_81.x = _2463;
    out.m_81.y = _2453;
    out.m_81.z = _2465;
    float _2473 = _2471 + _2211;
    bool _2475 = _1973 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2477 = isnan(_1973);
    bool _2479 = _2475 || _2477;
    bool _2481 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2483 = _2479 || _2481;
    out.gl_Position.x = _2239;
    out.gl_Position.y = _2231;
    out.gl_Position.z = _2471;
    out.gl_Position.w = _2211;
    float _2485 = _2473 * 0.5;
    out.m_83.z = _2485;
    out.m_83.w = _2211;
    float _2487 = -_2469;
    float _2489 = _2487 + 1.0;
    float _2491 = _2471;
    float _2493 = _2489;
    if (!_2483)
    {
        _2357 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2495 = _2357;
    float _2497 = _2495;
    float _2499 = _2495;
    if (!_2483)
    {
        _2491 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2501 = _2491;
    float _2503 = _2501;
    float _2505 = _2501;
    if (!_2483)
    {
        _2359 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2507 = _2359;
    float _2509 = -_2243;
    float _2511 = _2509 + 1.0;
    float _2513 = _2511 * _2467;
    float _2515 = precise::clamp(_2513, 0.0, 1.0);
    float _2517 = -_2515;
    float _2519 = fma(_2517, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2521 = _2519 * _2455;
    float _2523 = _2521 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2525 = _2469 * _2265;
    float _2527 = _2275 * _2489;
    out.m_85.x = _2523;
    float _2529 = _2269;
    float _2531 = _2507;
    float _2533 = _2507;
    if (!_2483)
    {
        _2493 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2535 = _2493;
    float _2537 = _2275 * _2525;
    float _2539 = _2285 * _2525;
    float _2541 = fma(_2281, _2537, _2269);
    float _2543 = fma(_2283, _2537, _2271);
    float _2545 = fma(_2275, _2539, _2273);
    float _2547 = _1885 * _1943;
    float _2549 = _2547;
    float _2551 = _2535;
    float _2553 = _2535;
    if (!_2483)
    {
        _2529 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2555 = _2529;
    out.m_87.x = _2541;
    out.m_87.y = _2543;
    out.m_87.z = _2545;
    out.m_87.w = _2527;
    float _2557 = _2547 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2559 = _2555;
    float _2561 = _2555;
    if (!_2483)
    {
        _2549 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2563 = _2549;
    bool _2565 = !_2483;
    float _2567 = _2563;
    float _2569 = _2563;
    if (!_2565)
    {
        bool _2571 = _1973 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2573 = isnan(_1973);
        bool _2575 = _2571 || _2573;
        bool _2577 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2579 = _2575 || _2577;
        if (!_2579)
        {
            float _2581 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2583 = _1973 + _2581;
            float _2585 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2587 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2585;
            float _2589 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2591 = _2589 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2593 = 1.0 / _2587;
            float _2595 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2597 = _2595 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2599 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2601 = _2599 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2603 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2605 = _2603 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2607 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2609 = _2607 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2611 = _2583 * _2593;
            float _2613 = precise::clamp(_2611, 0.0, 1.0);
            float _2615 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2617 = _2615 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2619 = fma(_2613, _2591, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2621 = fma(_2613, _2617, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2623 = fma(_2613, _2597, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2625 = fma(_2613, _2601, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2627 = fma(_2613, _2605, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2629 = fma(_2613, _2609, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2499 = _2623;
            _2553 = _2627;
            _2561 = _2619;
            _2533 = _2625;
            _2505 = _2621;
            _2569 = _2629;
            _2631 = true;
        }
        else
        {
            bool _2633 = _1973 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2635 = isnan(_1973);
            bool _2637 = _2633 || _2635;
            bool _2639 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2641 = _2637 || _2639;
            if (!_2641)
            {
                _2559 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2643 = _2559;
            _2561 = _2643;
            if (!_2641)
            {
                _2497 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2645 = _2497;
            _2499 = _2645;
            if (!_2641)
            {
                _2503 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2647 = _2503;
            _2505 = _2647;
            if (!_2641)
            {
                _2531 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2649 = _2531;
            _2533 = _2649;
            if (!_2641)
            {
                _2551 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2651 = _2551;
            _2553 = _2651;
            if (!_2641)
            {
                _2567 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2653 = _2567;
            bool _2655 = !_2641;
            _2569 = _2653;
            if (!_2655)
            {
                bool _2657 = _1973 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2659 = isnan(_1973);
                bool _2661 = _2657 || _2659;
                bool _2663 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2665 = _2661 || _2663;
                if (!_2665)
                {
                    float _2667 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2669 = _1973 + _2667;
                    float _2671 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2673 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2671;
                    float _2675 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2677 = _2675 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2679 = 1.0 / _2673;
                    float _2681 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2683 = _2681 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2685 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2687 = _2685 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2689 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2691 = _2689 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2693 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2695 = _2693 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2697 = _2669 * _2679;
                    float _2699 = precise::clamp(_2697, 0.0, 1.0);
                    float _2701 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2703 = _2701 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2705 = fma(_2699, _2677, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2707 = fma(_2699, _2703, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2709 = fma(_2699, _2683, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2711 = fma(_2699, _2687, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2713 = fma(_2699, _2691, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2715 = fma(_2699, _2695, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2499 = _2709;
                    _2553 = _2713;
                    _2561 = _2705;
                    _2533 = _2711;
                    _2505 = _2707;
                    _2569 = _2715;
                    _2631 = true;
                }
                else
                {
                    _2499 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2553 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2561 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2533 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2505 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2569 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2631 = false;
    float _2717 = _2499;
    float _2719 = _2553;
    float _2721 = _2561;
    float _2723 = _2533;
    float _2725 = _2505;
    float _2727 = _2569;
    float _2729 = fma(_2453, -0.5, 0.5);
    float _2731 = precise::clamp(_2729, 0.0, 1.0);
    float _2733 = -_2717;
    float _2735 = _2733 + _2719;
    float _2737 = _2557 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2739 = -_2721;
    float _2741 = _2739 + _2723;
    float _2743 = fma(_2731, _2735, _2717);
    out.m_89.x = 0.0;
    float _2745 = -_2725;
    float _2747 = _2745 + _2727;
    float _2749 = fma(_2731, _2741, _2721);
    float _2751 = _2743 * 0.586610972881317138671875;
    out.m_51.x = _2737;
    bool _2753 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2755 = fma(_2731, _2747, _2725);
    float _2757 = fma(_2749, 0.298911988735198974609375, _2751);
    bool _2759 = _1885 > 0.0;
    bool _2761 = isnan(_1885);
    bool _2763 = _2759 || _2761;
    bool _2765 = isnan(0.0);
    bool _2767 = _2763 || _2765;
    float _2769 = fma(_2755, 0.114477999508380889892578125, _2757);
    out.m_91.x = 0.0;
    bool _2771 = _1943 <= 0.0;
    bool _2773 = !_2767;
    bool _2775 = _2771 || _2773;
    float _2777 = -_2769;
    float _2779 = _2749 + _2777;
    float _2781 = -_2769;
    float _2783 = _2743 + _2781;
    float _2785 = -_2769;
    float _2787 = _2755 + _2785;
    float _2789 = fma(_2779, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2769);
    float _2791 = fma(_2783, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2769);
    float _2793 = fma(_2787, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2769);
    bool _2795 = !_2753;
    if (!_2795)
    {
        float _2797 = -_1817;
        float _2799 = _2797 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2801 = -_1819;
        float _2803 = _2801 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2805 = -_1821;
        float _2807 = _2805 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2809 = _2799 * _2799;
        float _2811 = fma(_2803, _2803, _2809);
        float _2813 = fma(_2807, _2807, _2811);
        float _2815 = rsqrt(_2813);
        float _2817 = _2799 * _2815;
        float _2819 = _2803 * _2815;
        float _2821 = _2807 * _2815;
        float _2823 = sqrt(_2813);
        float _2825 = -_1979;
        float _2827 = _2825 + _2817;
        float _2829 = -_1975;
        float _2831 = _2829 + _2819;
        float _2833 = -_1977;
        float _2835 = _2833 + _2821;
        float _2837 = _2827 * _2827;
        float _2839 = fma(_2831, _2831, _2837);
        float _2841 = fma(_2835, _2835, _2839);
        float _2843 = -_2823;
        float _2845 = _2843 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2847 = rsqrt(_2841);
        float _2849 = _2845 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2851 = precise::clamp(_2849, 0.0, 1.0);
        float _2853 = abs(_2851);
        float _2855 = log2(_2853);
        float _2857 = _2827 * _2847;
        float _2859 = _2831 * _2847;
        float _2861 = _2835 * _2847;
        float _2863 = _2453 * _2857;
        float _2865 = fma((*spvDescriptorSet0.vp_c13)._m0[4].y, (*spvDescriptorSet0.vp_c13)._m0[4].y, 0.00999999977648258209228515625);
        float _2867 = precise::clamp(_2865, 0.0, 1.0);
        float _2869 = _2453 * _2817;
        float _2871 = fma(_2463, _2859, _2863);
        float _2873 = _2867 * _2867;
        float _2875 = _2855 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2877 = fma(_2463, _2819, _2869);
        float _2879 = fma(_2465, _2861, _2871);
        float _2881 = precise::clamp(_2879, 0.0, 1.0);
        float _2883 = _2873 + (-1.0);
        float _2885 = fma(_2465, _2821, _2877);
        float _2887 = precise::clamp(_2885, 0.0, 1.0);
        float _2889 = _2881 * _2881;
        float _2891 = _2819 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2893 = exp2(_2875);
        float _2895 = fma(_2889, _2883, 1.0);
        float _2897 = -_2817;
        float _2899 = -_2891;
        float _2901 = fma(_2897, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2899);
        float _2903 = _2895 * _2895;
        float _2905 = -_2821;
        float _2907 = fma(_2905, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2901);
        float _2909 = 1.0 / _2903;
        float _2911 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2913 = _2907 + _2911;
        float _2915 = _2913 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2917 = precise::clamp(_2915, 0.0, 1.0);
        float _2919 = _2893 * _2917;
        float _2921 = _2887 * _2919;
        float _2923 = _2873 * _2909;
        float _2925 = _2921 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2927 = _2921 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2929 = _2921 * _2923;
        float _2931 = _2921 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        float _2933 = _2929 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2935 = _2929 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2937 = _2929 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_89.x = _2925;
        out.m_89.y = _2927;
        out.m_89.z = _2931;
        out.m_91.x = _2933;
        out.m_91.y = _2935;
        out.m_91.z = _2937;
    }
    out.m_93.x = _2789;
    out.m_93.y = _2791;
    out.m_93.z = _2793;
    if (!_2775)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_51.x = 0.0;
    float _2939 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2939;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2631 = false;
    bool _1153 = false;
    bool _959 = false;
    bool _351 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _113 = in.m_48.w;
    float _115 = trunc(_113);
    int _117 = int(_115);
    bool _121 = _117 >= 1;
    float _123 = 0.0;
    if (!_121)
    {
        _123 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _125 = _123;
    float _127 = _125;
    if (!_121)
    {
        out.m_51.x = 0.0;
    }
    int _129 = 0;
    if (!_121)
    {
        float _131 = _125 * 5.0;
        _129 = as_type<int>(_131);
    }
    int _133 = _129;
    int _135 = _133;
    if (!_121)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2996 = as_type<float>(_133);
        out.gl_Position.z = _2996;
    }
    if (!_121)
    {
        return out;
    }
    float _137 = in.m_53.w;
    bool _139 = _137 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _141 = isnan(_137);
    bool _143 = _139 || _141;
    bool _145 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _147 = _143 || _145;
    float _149 = -_137;
    float _151 = _149 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _153 = _151;
    if (_147)
    {
        float _155 = float(_117);
        _127 = _155;
    }
    float _157 = _127;
    bool _159 = _151 >= _157;
    bool _161 = !_147;
    bool _163 = _159 || _161;
    float _165 = _157;
    if (_163)
    {
        _165 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _167 = _165;
    if (_163)
    {
        out.m_51.x = 0.0;
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
        float _3066 = as_type<float>(_171);
        out.gl_Position.z = _3066;
    }
    if (_163)
    {
        return out;
    }
    float _173 = in.m_55.x;
    float _175 = in.m_55.y;
    float _177 = in.m_55.z;
    float _179 = in.m_57.x;
    float _181 = in.m_57.y;
    float _183 = in.m_57.z;
    float _185 = in.m_59.x;
    float _187 = in.m_59.y;
    float _189 = in.m_59.z;
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
    float _221 = _203;
    if (_215)
    {
        float _223 = rsqrt(_203);
        _219 = _223;
    }
    float _225 = _219;
    float _227 = 0.0;
    float _229 = 0.0;
    if (!_215)
    {
        _227 = 0.0;
        _229 = 0.0;
    }
    float _231 = _227;
    float _233 = _229;
    bool _235 = _213 > 0.0;
    float _237 = 0.0;
    float _239 = _231;
    float _241 = _233;
    if (!_215)
    {
        _237 = 0.0;
    }
    float _243 = _237;
    float _245 = 0.0;
    float _247 = 0.0;
    float _249 = _243;
    if (!_217)
    {
        _245 = 0.0;
        _247 = 0.0;
    }
    float _251 = _245;
    float _253 = _247;
    float _255 = _209;
    float _257 = _253;
    float _259 = _251;
    if (_217)
    {
        float _261 = rsqrt(_205);
        _255 = _261;
    }
    float _263 = _255;
    float _265 = 0.0;
    if (!_217)
    {
        _265 = 0.0;
    }
    float _267 = _265;
    float _269 = 0.0;
    float _271 = _267;
    if (!_235)
    {
        _269 = 0.0;
    }
    float _273 = _269;
    float _275 = _213;
    float _277 = _273;
    if (_235)
    {
        float _279 = rsqrt(_207);
        _275 = _279;
    }
    float _281 = _275;
    float _283 = _225;
    if (_215)
    {
        float _285 = _225 * _179;
        _239 = _285;
    }
    float _287 = _239;
    if (_215)
    {
        float _289 = _225 * _173;
        _241 = _289;
    }
    float _291 = _241;
    if (_215)
    {
        float _293 = _225 * _185;
        _249 = _293;
    }
    float _295 = _249;
    bool _297 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    if (!_235)
    {
        _283 = 0.0;
    }
    float _299 = _283;
    float _301 = _299;
    if (!_235)
    {
        _221 = 0.0;
    }
    float _303 = _221;
    float _305 = _303;
    if (_217)
    {
        float _307 = _263 * _181;
        _271 = _307;
    }
    float _309 = _271;
    if (_217)
    {
        float _311 = _263 * _175;
        _257 = _311;
    }
    float _313 = _257;
    if (_217)
    {
        float _315 = _263 * _187;
        _259 = _315;
    }
    float _317 = _259;
    if (_235)
    {
        float _319 = _281 * _183;
        _277 = _319;
    }
    float _321 = _277;
    if (_235)
    {
        float _323 = _281 * _177;
        _301 = _323;
    }
    float _325 = _301;
    if (_235)
    {
        float _327 = _281 * _189;
        _305 = _327;
    }
    float _329 = _305;
    bool _331 = !_297;
    float _349;
    if (!_331)
    {
        float _333 = in.m_61.x;
        float _335 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _337 = _333 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _339 = fma(_337, (*spvDescriptorSet0.vp_c9)._m0[12].x, _151);
        float _341 = _339 * _335;
        float _343 = floor(_341);
        float _345 = -_343;
        float _347 = _341 + _345;
        _349 = _347;
        _351 = true;
    }
    else
    {
        float _353 = float(_117);
        float _355 = 1.0 / _353;
        float _357 = _151 * _355;
        _349 = _357;
    }
    _351 = false;
    float _359 = _349;
    int _361 = int2(spvDescriptorSet0.vp_t_tcb_C.get_width(), spvDescriptorSet0.vp_t_tcb_C.get_height()).x;
    int _363 = _361;
    int _365 = 0;
    int _367 = _108(_363, _365, (*spvDescriptorSet0.support_buffer));
    float _369 = in.m_61.x;
    float _371 = in.m_61.y;
    float _373 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[191].y;
    float _375 = -_373;
    float _377 = _375 + (*spvDescriptorSet0.vp_c9)._m0[191].y;
    float _379 = fma((*spvDescriptorSet0.vp_c10)._m0[2].x, 0.0166666693985462188720703125, _369);
    float _381 = fma(_377, _371, _373);
    float _383 = _379 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _385 = _383 * _381;
    float _387 = float(_367);
    int _389 = abs(_367);
    bool _391 = _367 == 0;
    float _393 = _385 * _387;
    float _395 = float(uint(_389));
    float _397 = trunc(_393);
    int _399 = int(_397);
    float _401 = 1.0 / _395;
    int _403 = abs(_399);
    uint _406 = uint(int(uint(_399) >> uint(31)));
    float _408 = float(uint(_403));
    int _410 = ~int(_406);
    int _412 = _410 + 1;
    int _414 = as_type<int>(_401) + (-2);
    float _416 = as_type<float>(_414) * _408;
    float _418 = trunc(_416);
    float _420 = precise::max(_418, 0.0);
    uint _422 = uint(_420);
    int _424 = ~int(_422);
    int _426 = _424 + 1;
    int _428 = _426 * _389;
    int _430 = _428 + _403;
    float _432 = float(uint(_430));
    float _434 = as_type<float>(_414) * _432;
    float _436 = trunc(_434);
    float _438 = precise::max(_436, 0.0);
    uint _440 = uint(_438);
    int _442 = int(_422) + int(_440);
    float _444 = in.m_63.z;
    int _446 = ~_442;
    int _448 = _446 + 1;
    int _450 = _448 * _389;
    int _452 = _450 + _403;
    bool _454 = uint(_452) >= uint(_389);
    bool _456 = !_454;
    int _458 = _456 ? 0 : (-1);
    int _460 = ~_442;
    int _462 = _460 + _458;
    int _464 = _462 + 1;
    float _466 = trunc(_444);
    int _468 = int(_466);
    int _470 = _464 * _389;
    int _472 = _470 + _403;
    int _474 = _472 ^ _412;
    int _476 = ~_412;
    int _478 = _476 + _474;
    int _480 = _478 + 1;
    bool _482 = !_391;
    int _484 = _482 ? _480 : (-1);
    int _486 = _484;
    int _488 = 0;
    int _490 = _109(_486, _488, (*spvDescriptorSet0.support_buffer));
    int _492 = _468;
    int _494 = 0;
    int _496 = _109(_492, _494, (*spvDescriptorSet0.support_buffer));
    float4 _499 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_490, _496)), 0).xyzw;
    float _501 = _499.x;
    float _503 = _499.y;
    float _505 = _499.z;
    float _507 = _499.w;
    int _509 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _511 = _509 != 0;
    bool _513 = _371 > 0.5;
    bool _515 = _513 && _511;
    float _517 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _519 = _517 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _521 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _523 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _521;
    int _525 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _527 = _525 != 0;
    float _529 = 1.0 / _519;
    float _531 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _533 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _531;
    float _535 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _537 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _539 = 1.0 / _523;
    float _541 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _543 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _545 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _547 = _541 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _549 = 1.0 / _533;
    float _551 = _543 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _553 = _545 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _555 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _557 = _359 + _555;
    float _559 = _535 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _561 = _537 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _563 = _359 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _565 = isnan(_359);
    bool _567 = _563 || _565;
    bool _569 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _571 = _567 || _569;
    float _573 = float(_571);
    float _575 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _577 = _359 + _575;
    float _579 = _557 * _529;
    float _581 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _583 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _585 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    bool _587 = _359 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _589 = isnan(_359);
    bool _591 = _587 || _589;
    bool _593 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _595 = _591 || _593;
    float _597 = float(_595);
    float _599 = _581 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _601 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _603 = _359 + _601;
    float _605 = _577 * _539;
    out.m_65.x = _547;
    out.m_65.y = _551;
    out.m_65.z = _553;
    out.m_65.w = _585;
    float _607 = _603 * _549;
    out.m_67.x = _559;
    out.m_67.y = _599;
    out.m_67.z = _561;
    out.m_67.w = _583;
    int _609 = _484 + 1;
    float _611 = 0.0;
    if (_527)
    {
        float _613 = in.m_61.x;
        _611 = _613;
    }
    float _615 = _611;
    float _617 = in.m_63.x;
    float _619 = -_573;
    float _621 = _619 + 1.0;
    float _623 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _625 = _623 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    bool _627 = _359 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _629 = isnan(_359);
    bool _631 = _627 || _629;
    bool _633 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _635 = _631 || _633;
    float _637 = float(_635);
    float _639 = _597 * _621;
    bool _641 = _359 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _643 = isnan(_359);
    bool _645 = _641 || _643;
    bool _647 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _649 = _645 || _647;
    float _651 = float(_649);
    float _653 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _655 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _653;
    float _657 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _659 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _657;
    float _661 = -_637;
    float _663 = _661 + 1.0;
    float _665 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _667 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _665;
    float _669 = -_597;
    float _671 = _669 + 1.0;
    float _673 = fma(_655, _607, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _675 = _651 * _663;
    float _677 = fma(_659, _607, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _679 = fma(_667, _607, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _681 = _637 * _671;
    float _683 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _685 = _683 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _687 = _673 * _675;
    float _689 = -_651;
    float _691 = _689 + 1.0;
    float _693 = _679 * _675;
    float _695 = _677 * _675;
    float _697 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _699 = _697 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _701 = fma(_691, (*spvDescriptorSet0.vp_c9)._m0[143].z, _687);
    float _703 = fma(_625, _579, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _705 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _707 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _705;
    float _709 = fma(_691, (*spvDescriptorSet0.vp_c9)._m0[143].x, _695);
    float _711 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _713 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _711;
    float _715 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _717 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _715;
    float _719 = fma(_685, _579, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _721 = fma(_691, (*spvDescriptorSet0.vp_c9)._m0[143].y, _693);
    float _723 = fma(_707, _605, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _725 = fma(_703, _681, _701);
    float _727 = fma(_717, _605, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _729 = fma(_719, _681, _721);
    float _731 = fma(_699, _579, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _733 = fma(_723, _639, _725);
    int _735 = abs(_609);
    float _737 = fma(_727, _639, _729);
    float _739 = fma(_713, _605, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _741 = fma(_731, _681, _709);
    float _743 = float(uint(_735));
    float _745 = in.m_63.y;
    bool _747 = _615 > 0.5;
    bool _749 = _747 && _527;
    float _751 = fma(_739, _639, _741);
    float _753 = (*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _755 = _731;
    if (_527)
    {
        _753 = _617;
    }
    float _757 = _753;
    float _759 = as_type<float>(_414) * _743;
    float _761 = _757;
    if (!_527)
    {
        _755 = _617;
    }
    float _763 = _755;
    float _765 = fma(_573, (*spvDescriptorSet0.vp_c9)._m0[146].x, _751);
    uint _767 = uint(int(uint(_609) >> uint(31)));
    float _769 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _771 = fma(_573, (*spvDescriptorSet0.vp_c9)._m0[146].y, _737);
    float _773 = fma(_573, (*spvDescriptorSet0.vp_c9)._m0[146].z, _733);
    int _775 = ~int(_767);
    int _777 = _775 + 1;
    float _779 = _763;
    if (_749)
    {
        float _781 = -_757;
        float _783 = _781 + 1.0;
        _761 = _783;
    }
    float _785 = _761;
    float _787 = trunc(_759);
    float _789 = precise::max(_787, 0.0);
    uint _791 = uint(_789);
    if (_527)
    {
        _779 = _785;
    }
    float _793 = _779;
    float _795 = _745;
    if (_515)
    {
        float _797 = -_745;
        float _799 = _797 + 1.0;
        _795 = _799;
    }
    float _801 = _795;
    float _803 = _793 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _805 = _801 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _807 = _803 * _769;
    int _809 = ~int(_791);
    int _811 = _809 + 1;
    int _813 = _811 * _389;
    int _815 = _813 + _735;
    float _817 = float(uint(_815));
    float _819 = as_type<float>(_414) * _817;
    float _821 = trunc(_819);
    float _823 = precise::max(_821, 0.0);
    uint _825 = uint(_823);
    int _827 = int(_791) + int(_825);
    int _829 = ~_827;
    int _831 = _829 + 1;
    int _833 = _831 * _389;
    int _835 = _833 + _735;
    bool _837 = uint(_835) >= uint(_389);
    bool _839 = !_837;
    int _841 = _839 ? 0 : (-1);
    int _843 = ~_827;
    int _845 = _843 + _841;
    int _847 = _845 + 1;
    int _849 = _847 * _389;
    int _851 = _849 + _735;
    int _853 = _851 ^ _777;
    int _855 = ~_777;
    int _857 = _855 + _853;
    int _859 = _857 + 1;
    float _861 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _863 = !_391;
    int _865 = _863 ? _859 : (-1);
    float _867 = _805 * _861;
    uint _869 = as_type<uint>(half2(float2(_507, 0.0)));
    uint _871 = extract_bits(_869, 0u, 8u);
    int _873 = int(_871) & 255;
    uint _875 = extract_bits(_869, 8u, 8u);
    int _877 = int(_875) & 255;
    int _879 = _877 << 8;
    int _881 = _873 | _879;
    bool _883 = _881 >= 32768;
    int _885 = _881 + (-1024);
    int _887 = _885;
    if (_883)
    {
        int _889 = ~_881;
        int _891 = _889 + 33792;
        int _893 = _891 + 1;
        _887 = _893;
    }
    int _895 = _887;
    int _897 = _895 + 30719;
    float _899 = float(_897);
    float _901 = fma(_899, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _903 = abs(_901);
    float _905 = -_903;
    float _907 = _905 + 1.0;
    float _909 = abs(_901);
    float _911 = fma(_909, -0.0187292993068695068359375, 0.074261002242565155029296875);
    bool _913 = _901 < 0.0;
    float _915 = float(_913);
    int _917 = as_type<int>(_907) + (-218103808);
    float _919 = abs(_901);
    float _921 = fma(_919, _911, -0.212114393711090087890625);
    bool _923 = uint(_917) >= 1920991232u;
    float _925 = abs(_901);
    float _927 = fma(_925, _921, 1.570728778839111328125);
    bool _929 = !_923;
    int _931 = as_type<int>(_907);
    float _957;
    if (!_929)
    {
        int _933 = as_type<int>(_907);
        int _935 = _917;
        int _937 = 4224;
        int _939 = as_type<int>(_907);
        int _941 = as_type<int>(_681);
        int _943;
        int _945;
        int _947;
        int _949;
        int _951;
        int _953;
        int _955;
        _106(_933, _935, _937, _939, _941, _943, _945, _947, _949, _951, _953, _955, out.gl_Position, out.gl_PointSize);
        _957 = as_type<float>(_953);
        _931 = _951;
        _959 = true;
    }
    else
    {
        float _961 = rsqrt(_907);
        float _963 = _907 * _961;
        float _965 = _961 * 0.5;
        float _967 = -_963;
        float _969 = 0.0 + _967;
        float _971 = fma(_965, _969, 0.5);
        float _973 = fma(_963, _971, _963);
        float _975 = -_973;
        float _977 = 0.0 + _975;
        float _979 = fma(_973, _977, _907);
        float _981 = fma(_965, _979, _973);
        _957 = _981;
    }
    _959 = false;
    float _983 = _957;
    int _985 = _931;
    int _987 = _865;
    int _989 = 0;
    int _991 = _109(_987, _989, (*spvDescriptorSet0.support_buffer));
    int _993 = _468;
    int _995 = 0;
    int _997 = _109(_993, _995, (*spvDescriptorSet0.support_buffer));
    float4 _999 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_991, _997)), 0).xyzw;
    float _1001 = _999.x;
    float _1003 = _999.y;
    float _1005 = _999.z;
    float _1007 = _999.w;
    float _1009 = floor(_393);
    float _1011 = _927 * _983;
    float _1013 = _915 * 2.0;
    float _1015 = _899 * 3.883221149444580078125;
    float _1017 = -_1013;
    float _1019 = fma(_1011, _1017, _1011);
    float _1021 = _1015 * 0.15915493667125701904296875;
    float _1023 = fma(_915, 3.1415927410125732421875, _1019);
    float _1025 = _1021 * 6.283185482025146484375;
    float _1027 = cos(_1025);
    float _1029 = _1023 * 0.15915493667125701904296875;
    float _1031 = -_1009;
    float _1033 = _393 + _1031;
    float _1035 = _1029 * 6.283185482025146484375;
    float _1037 = sin(_1035);
    float _1039 = _1021 * 6.283185482025146484375;
    float _1041 = sin(_1039);
    float _1043 = _1037 * _1027;
    float _1045 = _1037 * _1041;
    uint _1047 = as_type<uint>(half2(float2(_1007, 0.0)));
    float _1049 = -_501;
    float _1051 = _1049 + _1001;
    uint _1053 = extract_bits(_1047, 0u, 8u);
    int _1055 = int(_1053) & 255;
    uint _1057 = extract_bits(_1047, 8u, 8u);
    int _1059 = int(_1057) & 255;
    int _1061 = _1059 << 8;
    int _1063 = _1055 | _1061;
    float _1065 = fma(_1033, _1051, _501);
    bool _1067 = _1063 >= 32768;
    int _1069 = _1063 + (-1024);
    int _1071 = _1069;
    if (_1067)
    {
        int _1073 = ~_1063;
        int _1075 = _1073 + 33792;
        int _1077 = _1075 + 1;
        _1071 = _1077;
    }
    int _1079 = _1071;
    float _1081 = -_505;
    float _1083 = _1081 + _1005;
    int _1085 = _1079 + 30719;
    float _1087 = fma(_1033, _1083, _505);
    float _1089 = float(_1085);
    float _1091 = fma(_1089, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _1093 = abs(_1091);
    float _1095 = -_1093;
    float _1097 = _1095 + 1.0;
    float _1099 = abs(_1091);
    float _1101 = fma(_1099, -0.0187292993068695068359375, 0.074261002242565155029296875);
    bool _1103 = _1091 < 0.0;
    float _1105 = float(_1103);
    int _1107 = as_type<int>(_1097) + (-218103808);
    float _1109 = abs(_1091);
    float _1111 = fma(_1109, _1101, -0.212114393711090087890625);
    bool _1113 = uint(_1107) >= 1920991232u;
    float _1115 = -_503;
    float _1117 = _1115 + _1003;
    float _1119 = abs(_1091);
    float _1121 = fma(_1119, _1111, 1.570728778839111328125);
    float _1123 = fma(_1033, _1117, _503);
    bool _1125 = !_1113;
    float _1151;
    if (!_1125)
    {
        int _1127 = as_type<int>(_1097);
        int _1129 = as_type<int>(_1097);
        int _1131 = 5120;
        int _1133 = _985;
        int _1135 = as_type<int>(_1011);
        int _1137;
        int _1139;
        int _1141;
        int _1143;
        int _1145;
        int _1147;
        int _1149;
        _106(_1127, _1129, _1131, _1133, _1135, _1137, _1139, _1141, _1143, _1145, _1147, _1149, out.gl_Position, out.gl_PointSize);
        _1151 = as_type<float>(_1147);
        _1153 = true;
    }
    else
    {
        float _1155 = rsqrt(_1097);
        float _1157 = _1097 * _1155;
        float _1159 = _1155 * 0.5;
        float _1161 = -_1157;
        float _1163 = 0.0 + _1161;
        float _1165 = fma(_1159, _1163, 0.5);
        float _1167 = fma(_1157, _1165, _1157);
        float _1169 = -_1167;
        float _1171 = 0.0 + _1169;
        float _1173 = fma(_1167, _1171, _1097);
        float _1175 = fma(_1159, _1173, _1167);
        _1151 = _1175;
    }
    _1153 = false;
    float _1177 = _1151;
    float _1179 = in.m_61.x;
    float _1181 = in.m_61.y;
    float _1183 = in.m_61.z;
    float _1185 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1187 = log2(_1185);
    float _1189 = in.m_69.y;
    int _1191 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1193 = _1191 != 0;
    int _1195 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1197 = _1195 != 0;
    int _1199 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1201 = _1199 != 0;
    float _1203 = _1187 * _151;
    float _1205 = exp2(_1203);
    float _1207 = _1183 * 2.0;
    float _1209 = _1179 * 2.0;
    float _1211 = _1181 * 2.0;
    float _1213 = _1183 + _1179;
    float _1215 = floor(_1207);
    float _1217 = _1213 + (-1.0);
    float _1219 = floor(_1209);
    float _1221 = -_1205;
    float _1223 = _1221 + 1.0;
    bool _1225 = _1215 > 0.0;
    float _1227 = floor(_1211);
    bool _1229 = _1215 >= 0.0;
    bool _1231 = isnan(_1215);
    bool _1233 = _1229 || _1231;
    bool _1235 = isnan(0.0);
    bool _1237 = _1233 || _1235;
    float _1239 = _1181 + _1179;
    float _1241 = fma(_1217, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1243 = _1179 + (-0.5);
    int _1245 = _1237 ? 0 : 1;
    float _1247 = _1239 + (-1.0);
    bool _1249 = _1219 > 0.0;
    int _1251 = ~_1245;
    int _1253 = _1251 + 1;
    int _1255 = _1253 + 1;
    float _1257 = fma(_1247, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _1259 = _1219 >= 0.0;
    bool _1261 = isnan(_1219);
    bool _1263 = _1259 || _1261;
    bool _1265 = isnan(0.0);
    bool _1267 = _1263 || _1265;
    float _1269 = in.m_71.x;
    float _1271 = in.m_71.y;
    float _1273 = in.m_71.z;
    int _1275 = _1255;
    if (!_1225)
    {
        int _1277 = ~_1245;
        int _1279 = _1277 + 1;
        _1275 = _1279;
    }
    int _1281 = _1275;
    bool _1283 = !_1193;
    int _1285 = _1283 ? 0 : 1;
    bool _1287 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1289 = isnan(1.0);
    bool _1291 = _1287 || _1289;
    bool _1293 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1295 = _1291 || _1293;
    float _1297 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1299 = 1.0 + _1297;
    bool _1301 = _1227 > 0.0;
    bool _1303 = _1227 >= 0.0;
    bool _1305 = isnan(_1227);
    bool _1307 = _1303 || _1305;
    bool _1309 = isnan(0.0);
    bool _1311 = _1307 || _1309;
    float _1313 = 1.0 / _1299;
    int _1315 = abs(_1285);
    bool _1317 = !_1201;
    int _1319 = _1317 ? 0 : 1;
    int _1321 = _1311 ? 0 : 1;
    int _1323 = abs(_1319);
    bool _1325 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1327 = isnan(0.0);
    bool _1329 = _1325 || _1327;
    bool _1331 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1333 = _1329 || _1331;
    float _1335 = float(_1315);
    float _1337 = float(_1281);
    int _1339 = ~_1321;
    int _1341 = _1339 + 1;
    int _1343 = _1341 + 1;
    int _1345 = _1343;
    if (!_1301)
    {
        int _1347 = ~_1321;
        int _1349 = _1347 + 1;
        _1345 = _1349;
    }
    int _1351 = _1345;
    float _1353 = _1335 * _1337;
    float _1355 = _1333 ? _1223 : 0.0;
    float _1357 = float(_1323);
    float _1359 = _1353 * (-2.0);
    int _1361 = _1267 ? 0 : 1;
    if (_1295)
    {
        float _1363 = _1355 * _1313;
        _153 = _1363;
    }
    float _1365 = _153;
    float _1367 = float(_1351);
    bool _1369 = !_1197;
    int _1371 = _1369 ? 0 : 1;
    int _1373 = ~_1361;
    int _1375 = _1373 + 1;
    int _1377 = _1375 + 1;
    float _1379 = _1357 * _1367;
    int _1381 = _1377;
    if (!_1249)
    {
        int _1383 = ~_1361;
        int _1385 = _1383 + 1;
        _1381 = _1385;
    }
    int _1387 = _1381;
    float _1389 = fma(_1359, _1269, _1269);
    int _1391 = abs(_1371);
    float _1393 = _1379 * (-2.0);
    float _1395 = fma(_1257, _1359, _1257);
    float _1397 = fma(_1243, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1389);
    float _1399 = fma(_1241, _1393, _1241);
    float _1401 = fma(_1393, _1273, _1273);
    float _1403 = _1183 + (-0.5);
    float _1405 = float(_1391);
    float _1407 = fma(_1395, _1365, _1397);
    float _1409 = float(_1387);
    float _1411 = fma(_1403, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1401);
    float _1413 = _1183 + _1181;
    float _1415 = _1181 + (-0.5);
    float _1417 = _1407 * 0.15915493667125701904296875;
    float _1419 = _1405 * _1409;
    float _1421 = fma(_1399, _1365, _1411);
    float _1423 = in.m_73.x;
    float _1425 = in.m_73.y;
    float _1427 = in.m_73.z;
    float _1429 = _1413 + (-1.0);
    float _1431 = _1419 * (-2.0);
    float _1433 = _1421 * 0.15915493667125701904296875;
    float _1435 = in.m_48.x;
    float _1437 = in.m_48.y;
    float _1439 = in.m_48.z;
    float _1441 = fma(_1429, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1443 = fma(_1431, _1271, _1271);
    float _1445 = _1417 * 6.283185482025146484375;
    float _1447 = sin(_1445);
    float _1449 = in.m_57.x;
    float _1451 = in.m_57.y;
    float _1453 = in.m_57.z;
    float _1455 = in.m_57.w;
    float _1457 = fma(_1441, _1431, _1441);
    float _1459 = fma(_1415, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1443);
    float _1461 = in.m_59.x;
    float _1463 = in.m_59.y;
    float _1465 = in.m_59.z;
    float _1467 = in.m_59.w;
    float _1469 = fma(_1457, _1365, _1459);
    float _1471 = _1417 * 6.283185482025146484375;
    float _1473 = cos(_1471);
    float _1475 = _1469 * 0.15915493667125701904296875;
    float _1477 = _1433 * 6.283185482025146484375;
    float _1479 = sin(_1477);
    float _1481 = _765 * _1423;
    float _1483 = _773 * _1427;
    float _1485 = _771 * _1425;
    float _1487 = _1481 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1489 = _1483 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    bool _1491 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1493 = isnan(0.5);
    bool _1495 = _1491 || _1493;
    bool _1497 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1499 = _1495 || _1497;
    float _1501 = _1433 * 6.283185482025146484375;
    float _1503 = cos(_1501);
    float _1505 = _1437 * _1451;
    float _1507 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1087);
    float _1509 = _1485 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _1511 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1513 = isnan(0.5);
    bool _1515 = _1511 || _1513;
    bool _1517 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1519 = _1515 || _1517;
    float _1521 = _1437 * _1463;
    float _1523 = fma(_1435, _1449, _1505);
    float _1525 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1123);
    float _1527 = _1475 * 6.283185482025146484375;
    float _1529 = sin(_1527);
    float _1531 = fma(_1435, _1461, _1521);
    float _1533 = fma(_1439, _1453, _1523);
    float _1535 = _1437 + _1189;
    float _1537 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1065);
    float _1539 = fma(_1439, _1465, _1531);
    float _1541 = _1489 * _1507;
    float _1543 = _1447 * _1479;
    float _1545 = _1475 * 6.283185482025146484375;
    float _1547 = cos(_1545);
    float _1549 = _1473 * _1503;
    float _1551 = _1509 * _1525;
    float _1553 = _1473 * _1479;
    float _1555 = _1447 * _1503;
    float _1557 = _1487 * _1537;
    float _1559 = _1533 + _1455;
    float _1561 = _1539 + _1467;
    float _1563 = fma(_1529, _1543, _1549);
    float _1565 = -_1553;
    float _1567 = fma(_1529, _1555, _1565);
    float _1569 = -_1555;
    float _1571 = fma(_1529, _1553, _1569);
    float _1573 = fma(_1529, _1549, _1543);
    float _1575 = _1563 * _1551;
    float _1577 = _1547 * _1479;
    float _1579 = _1447 * _1547;
    float _1581 = _1547 * _1503;
    float _1583 = _1567 * _1551;
    float _1585 = fma(_1577, _1557, _1575);
    float _1587 = _1473 * _1547;
    float _1589 = _1579 * _1551;
    float _1591 = fma(_1581, _1557, _1583);
    float _1593 = fma(_1571, _1541, _1585);
    float _1595 = _1535 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1597 = -_1529;
    float _1599 = fma(_1597, _1557, _1589);
    float _1601 = fma(_1573, _1541, _1591);
    float _1603 = _1593 * _317;
    float _1605 = _1593 * _309;
    float _1607 = fma(_1587, _1541, _1599);
    float _1609 = fma(_1559, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1595);
    float _1611 = fma(_1601, _295, _1603);
    float _1613 = fma(_1601, _287, _1605);
    float _1615 = _1593 * _313;
    float _1617 = fma(_1561, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1609);
    float _1619 = fma(_1607, _329, _1611);
    float _1621 = fma(_1607, _321, _1613);
    float _1623 = fma(_1601, _291, _1615);
    float _1625 = _1617 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1627 = _1561 + _1619;
    float _1629 = _1559 + _1621;
    float _1631 = _1535 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1633 = 1.0 / _1625;
    float _1635 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1637 = _1627 + _1635;
    float _1639 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1641 = _1629 + _1639;
    float _1643 = fma(_1559, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1631);
    float _1645 = fma(_1607, _325, _1623);
    float _1647 = _1637 * _1637;
    float _1649 = fma(_1561, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1643);
    float _1651 = fma(_1641, _1641, _1647);
    float _1653 = _1649 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1655 = sqrt(_1651);
    float _1657 = _1653 + _1625;
    float _1659 = _1657 * _1633;
    float _1661 = _1659 * 0.5;
    float _1663 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1665 = fma(_1661, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1663);
    float _1667 = _1535 + _1645;
    float _1669 = 1.0 / _1665;
    bool _1671 = _1655 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1673 = _1623;
    float _1675 = _1601;
    float _1677 = _1645;
    float _1679 = _1633;
    float _1681 = _1625;
    float _1683 = _1641;
    float _1685 = _1637;
    float _1687 = _1467;
    if (!_1671)
    {
        _1673 = _1629;
    }
    float _1689 = _1673;
    float _1691 = _1689;
    if (!_1671)
    {
        _1675 = _1627;
    }
    float _1693 = _1675;
    float _1695 = _1693;
    if (!_1671)
    {
        _1677 = _1667;
    }
    float _1697 = _1677;
    bool _1699 = !_1671;
    float _1701 = _1697;
    if (!_1699)
    {
        float _1703 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1705 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1707 = _1655 + _1705;
        float _1709 = _1667 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1711 = rsqrt(_1651);
        float _1713 = _1707 * _1703;
        float _1715 = _1713 * 0.15915493667125701904296875;
        float _1717 = _1715 * 6.283185482025146484375;
        float _1719 = cos(_1717);
        float _1721 = _1715 * 6.283185482025146484375;
        float _1723 = sin(_1721);
        float _1725 = _1719 + (-1.0);
        float _1727 = _1725 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1729 = fma(_1723, _1709, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1731 = fma(_1667, _1719, _1727);
        float _1733 = _1711 * _1729;
        float _1735 = fma(_1641, _1733, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1737 = fma(_1637, _1733, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1691 = _1735;
        _1701 = _1731;
        _1679 = _1715;
        _1695 = _1737;
        _1681 = _1733;
    }
    float _1739 = _1691;
    float _1741 = _1701;
    float _1743 = _1679;
    float _1745 = _1695;
    float _1747 = _1681;
    float _1749 = _1747;
    float _1751 = _1745;
    float _1753 = _1743;
    if (_1519)
    {
        _1749 = 1.0;
    }
    float _1755 = _1749;
    float _1757 = _1755;
    if (_1499)
    {
        _1683 = _1739;
    }
    float _1759 = _1683;
    float _1761 = _1759;
    if (_1499)
    {
        _1685 = _1741;
    }
    float _1763 = _1685;
    float _1765 = _1763;
    if (!_1499)
    {
        float _1767 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1769 = _1535 + _1767;
        float _1771 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1773 = _1559 + _1771;
        float _1775 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1777 = -_1535;
        float _1779 = _1777 + _1741;
        float _1781 = _1769 * _1769;
        float _1783 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1785 = _1561 + _1783;
        float _1787 = -_1559;
        float _1789 = _1787 + _1739;
        float _1791 = -_1561;
        float _1793 = _1791 + _1745;
        float _1795 = fma(_1773, _1773, _1781);
        float _1797 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1799 = fma(_1785, _1785, _1795);
        float _1801 = sqrt(_1799);
        float _1803 = _1775 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1805 = precise::min(_1801, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1807 = _1805 * _1797;
        float _1809 = _1803 * _1807;
        float _1811 = fma(_1779, _1809, _1535);
        float _1813 = fma(_1789, _1809, _1559);
        float _1815 = fma(_1793, _1809, _1561);
        _1765 = _1811;
        _1761 = _1813;
        _1751 = _1815;
        _1753 = _1809;
    }
    float _1817 = _1765;
    float _1819 = _1761;
    float _1821 = _1751;
    float _1823 = _1753;
    float _1825 = _1823;
    if (_1519)
    {
        _1687 = 1.0;
    }
    float _1827 = _1687;
    float _1829 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1831 = _1669 * _1829;
    float _1833 = _1827;
    if (!_1519)
    {
        float _1835 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1837 = _1835 * 0.15915493667125701904296875;
        float _1839 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1841 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1843 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1841;
        float _1845 = _1837 * 6.283185482025146484375;
        float _1847 = cos(_1845);
        float _1849 = _1839 * 0.15915493667125701904296875;
        float _1851 = _1837 * 6.283185482025146484375;
        float _1853 = sin(_1851);
        float _1855 = 1.0 / _1847;
        float _1857 = _1849 * 6.283185482025146484375;
        float _1859 = cos(_1857);
        float _1861 = _1853 * _1855;
        float _1863 = _1849 * 6.283185482025146484375;
        float _1865 = sin(_1863);
        float _1867 = _1859 * _1861;
        float _1869 = 1.0 / _1843;
        float _1871 = 1.0 / _1867;
        float _1873 = _1865 * _1871;
        float _1875 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1877 = fma(_1831, _1873, _1875);
        float _1879 = _1877 * _1869;
        float _1881 = precise::clamp(_1879, 0.0, 1.0);
        _1825 = _1843;
        _1757 = _1881;
    }
    float _1883 = _1825;
    float _1885 = _1757;
    float _1887 = _1883;
    if (!_1519)
    {
        float _1889 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1891 = _1889 * 0.15915493667125701904296875;
        float _1893 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1895 = _1891 * 6.283185482025146484375;
        float _1897 = cos(_1895);
        float _1899 = _1893 * 0.15915493667125701904296875;
        float _1901 = _1891 * 6.283185482025146484375;
        float _1903 = sin(_1901);
        float _1905 = 1.0 / _1897;
        float _1907 = _1899 * 6.283185482025146484375;
        float _1909 = cos(_1907);
        float _1911 = _1903 * _1905;
        float _1913 = _1899 * 6.283185482025146484375;
        float _1915 = sin(_1913);
        float _1917 = _1909 * _1911;
        float _1919 = 1.0 / _1917;
        float _1921 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1923 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1921;
        float _1925 = 1.0 / _1923;
        float _1927 = _1915 * _1919;
        float _1929 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1931 = fma(_1831, _1927, _1929);
        float _1933 = _1931 * _1925;
        float _1935 = precise::clamp(_1933, 0.0, 1.0);
        float _1937 = -_1935;
        float _1939 = _1937 + 1.0;
        _1887 = _1919;
        _1833 = _1939;
    }
    float _1941 = _1887;
    float _1943 = _1833;
    float _1945 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1947 = _1817 + _1945;
    float _1949 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1951 = _1819 + _1949;
    float _1953 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1955 = _1821 + _1953;
    float _1957 = _1817 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1959 = _1947 * _1947;
    float _1961 = fma(_1819, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1957);
    float _1963 = fma(_1951, _1951, _1959);
    float _1965 = fma(_1821, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1961);
    float _1967 = fma(_1955, _1955, _1963);
    float _1969 = _1965 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1971 = rsqrt(_1967);
    float _1973 = sqrt(_1967);
    float _1975 = _1951 * _1971;
    float _1977 = _1955 * _1971;
    float _1979 = _1947 * _1971;
    float _1981 = _1975 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1983 = _1977 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1985 = _1981 * _1981;
    float _1987 = _1983 * _1983;
    float _1989 = _1985 + _1987;
    float _1991 = sqrt(_1989);
    bool _1993 = _1991 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1995 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1997 = _1991 + _1995;
    float _1999 = _1941;
    float _2001 = _1989;
    float _2003 = _1997;
    float _2005 = _1971;
    float _2007 = _1981;
    float _2009 = _1983;
    float _2011 = _1985;
    float _2013 = _1987;
    if (_1993)
    {
        float _2015 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1999 = _2015;
    }
    float _2017 = _1999;
    if (_1993)
    {
        float _2019 = rsqrt(_1989);
        _2001 = _2019;
    }
    float _2021 = _2001;
    if (_1993)
    {
        float _2023 = _1997 * _2017;
        _2003 = _2023;
    }
    float _2025 = _2003;
    float _2027 = 0.0;
    if (_1993)
    {
        float _2029 = _2025 * 0.15915493667125701904296875;
        _2027 = _2029;
    }
    float _2031 = _2027;
    float _2033 = _1627;
    if (_1993)
    {
        float _2035 = _2031 * 6.283185482025146484375;
        float _2037 = sin(_2035);
        _2033 = _2037;
    }
    float _2039 = _2033;
    float _2041 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2043 = precise::max(0.0, _2041);
    float _2045 = _1629;
    float _2047 = _2043;
    if (_1993)
    {
        float _2049 = _2031 * 6.283185482025146484375;
        float _2051 = cos(_2049);
        _2045 = _2051;
    }
    float _2053 = _2045;
    float _2055 = -_1979;
    float _2057 = -_2043;
    float _2059 = fma(_2055, (*spvDescriptorSet0.vp_c15)._m0[24].y, _2057);
    float _2061 = _2059;
    if (_1993)
    {
        float _2063 = _2059 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2005 = _2063;
    }
    float _2065 = _2005;
    float _2067 = _2039;
    if (_1993)
    {
        float _2069 = fma(_2039, _2065, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2067 = _2069;
    }
    float _2071 = _2067;
    float _2073 = _2071;
    if (_1993)
    {
        float _2075 = _2053 + (-1.0);
        _2047 = _2075;
    }
    float _2077 = _2047;
    float _2079 = _2077;
    if (_1993)
    {
        float _2081 = _2021 * _2071;
        _2073 = _2081;
    }
    float _2083 = _2073;
    float _2085 = fma(_1559, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    if (_1993)
    {
        float _2087 = _2077 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2079 = _2087;
    }
    float _2089 = _2079;
    if (_1993)
    {
        float _2091 = _1981 * _2083;
        _2007 = _2091;
    }
    float _2093 = _2007;
    if (_1993)
    {
        float _2095 = _1983 * _2083;
        _2009 = _2095;
    }
    float _2097 = _2009;
    if (_1993)
    {
        float _2099 = fma(_2059, _2053, _2089);
        _2061 = _2099;
    }
    float _2101 = _2061;
    if (_1993)
    {
        float _2103 = _2093 * _2093;
        _2011 = _2103;
    }
    float _2105 = _2011;
    if (_1993)
    {
        float _2107 = _2097 * _2097;
        _2013 = _2107;
    }
    float _2109 = _2013;
    float _2111 = _1817 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2113 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2115 = fma(_2101, _2101, _2105);
    float _2117 = floor(_2085);
    float _2119 = fma(_1819, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2111);
    float _2121 = _2115 + _2109;
    float _2123 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2125 = fma(_1973, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2123);
    float _2127 = precise::clamp(_2125, 0.0, 1.0);
    float _2129 = fma(_1821, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2119);
    float _2131 = rsqrt(_2121);
    float _2133 = _2129 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2135 = -_2127;
    float _2137 = _2135 + 1.0;
    float _2139 = _2133 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2141 = fma(_1561, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2143 = _1817 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2145 = _1817 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2147 = -_2139;
    float _2149 = fma(_2147, _2113, 1.0);
    float _2151 = abs(_2137);
    float _2153 = log2(_2151);
    float _2155 = fma(_1819, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2143);
    float _2157 = fma(_1819, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2145);
    float _2159 = -_2117;
    float _2161 = _2085 + _2159;
    float _2163 = _2131 * _2093;
    float _2165 = fma(_1821, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2157);
    float _2167 = _2131 * _2097;
    float _2169 = _2131 * _2101;
    float _2171 = _2163 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2173 = fma(_1821, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2155);
    float _2175 = _2165 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2177 = floor(_2141);
    float _2179 = -_2171;
    float _2181 = fma(_2169, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2179);
    float _2183 = _2173 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2185 = _2175 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2187 = _2153 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2189 = -_2167;
    float _2191 = fma(_2189, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2181);
    float _2193 = fma(_2183, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2185);
    float _2195 = log2(_2149);
    float _2197 = fma(_2191, -0.5, 0.5);
    float _2199 = exp2(_2187);
    float _2201 = fma(_2133, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2193);
    float _2203 = fma(_2191, 0.5, 0.5);
    float _2205 = _2175 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2207 = -_2177;
    float _2209 = _2141 + _2207;
    float _2211 = fma(_1969, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2201);
    float _2213 = _2175 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2215 = fma(_2183, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2205);
    float _2217 = sqrt(_2197);
    float _2219 = fma(_2203, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2221 = fma(_2183, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2213);
    float _2223 = fma(_2133, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2215);
    float _2225 = _2169 + 1.0;
    float _2227 = fma(_2203, _2219, -0.212114393711090087890625);
    float _2229 = fma(_2133, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2221);
    float _2231 = fma(_1969, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2223);
    float _2233 = 1.0 / _2211;
    float _2235 = -_2169;
    float _2237 = fma(_2199, _2225, _2235);
    float _2239 = fma(_1969, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2229);
    float _2241 = _2195 * 0.693147182464599609375;
    float2 _6042 = float2(_2161, _2209);
    float _2243 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6042, float2(0.0), isnan(_6042)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6042, float2(0.0), isnan(_6042)), level(0.0)).x;
    float _2245 = fma(_2203, _2227, 1.570728778839111328125);
    float _2247 = _2241 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2249 = _2217 * 0.636619746685028076171875;
    float _2251 = -_2245;
    float _2253 = fma(_2249, _2251, 1.0);
    float _2255 = fma(_2237, 0.5, 0.5);
    float _2257 = _2239 * _2233;
    float _2259 = _2231 * _2233;
    float _2261 = fma(_2257, 0.5, 0.5);
    float _2263 = fma(_2259, -0.5, 0.5);
    float3 _6080 = float3(_2261, _2263, _2247);
    float _2265 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6080, float3(0.0), isnan(_6080)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6080, float3(0.0), isnan(_6080)), level(0.0)).x;
    float3 _6091 = float3(_2261, _2263, _2247);
    float4 _2267 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6091, float3(0.0), isnan(_6091)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6091, float3(0.0), isnan(_6091)), level(0.0)).xyzw;
    float _2269 = _2267.x;
    float _2271 = _2267.y;
    float _2273 = _2267.z;
    float _2275 = _2267.w;
    float2 _6107 = float2(_2253, _2255);
    float3 _2279 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6107, float2(0.0), isnan(_6107)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6107, float2(0.0), isnan(_6107)), level(0.0)).xyz;
    float _2281 = _2279.x;
    float _2283 = _2279.y;
    float _2285 = _2279.z;
    float _2287 = _1121 * _1177;
    float _2289 = _1105 * 2.0;
    float _2291 = _1089 * 3.883221149444580078125;
    bool _2293 = _1123 != 0.0;
    bool _2295 = isnan(_1123);
    bool _2297 = _2293 || _2295;
    bool _2299 = isnan(0.0);
    bool _2301 = _2297 || _2299;
    float _2303 = -_901;
    float _2305 = _2303 + _1091;
    float _2307 = -_2289;
    float _2309 = fma(_2287, _2307, _2287);
    float _2311 = _2291 * 0.15915493667125701904296875;
    bool _2313 = _1065 == 0.0;
    bool _2315 = !_2301;
    bool _2317 = _2313 && _2315;
    float _2319 = fma(_1033, _2305, _901);
    float _2321 = fma(_1105, 3.1415927410125732421875, _2309);
    out.m_75.x = _807;
    out.m_75.y = _867;
    float _2323 = abs(_1831);
    float _2325 = log2(_2323);
    bool _2327 = _1087 == 0.0;
    bool _2329 = _2327 && _2317;
    float _2331 = _2321 * 0.15915493667125701904296875;
    float _2333 = _2153 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2335 = _2175 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_77.x = _1559;
    float _2337 = _2311 * 6.283185482025146484375;
    float _2339 = cos(_2337);
    bool _2341 = _1831 <= 8000.0;
    bool _2343 = isnan(_1831);
    bool _2345 = _2341 || _2343;
    bool _2347 = isnan(8000.0);
    bool _2349 = _2345 || _2347;
    float _2351 = float(_2349);
    float _2353 = fma(_2183, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2335);
    out.m_77.z = _1561;
    float _2355 = _2319;
    float _2357 = _2211;
    float _2359 = _2231;
    if (!_2329)
    {
        float _2361 = fma(_1123, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2319);
        _2355 = _2361;
    }
    float _2363 = _2355;
    out.m_79.x = _1819;
    out.m_79.y = _1817;
    out.m_79.z = _1821;
    float _2365 = _2331 * 6.283185482025146484375;
    float _2367 = sin(_2365);
    float _2369 = _2325 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2371 = _1563 * _2363;
    float _2373 = _1567 * _2363;
    float _2375 = _1579 * _2363;
    float _2377 = _2311 * 6.283185482025146484375;
    float _2379 = sin(_2377);
    float _2381 = exp2(_2369);
    float _2383 = -_1043;
    float _2385 = fma(_2367, _2339, _2383);
    float _2387 = fma(_1033, _2385, _1043);
    float _2389 = -_1045;
    float _2391 = fma(_2367, _2379, _2389);
    float _2393 = _2387;
    if (!_2329)
    {
        float _2395 = fma(_1065, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2387);
        _2393 = _2395;
    }
    float _2397 = _2393;
    float _2399 = exp2(_2333);
    float _2401 = fma(_1033, _2391, _1045);
    float _2403 = fma(_1577, _2397, _2371);
    float _2405 = fma(_1581, _2397, _2373);
    float _2407 = fma(_2381, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2409 = precise::clamp(_2407, 0.0, 1.0);
    float _2411 = _2401;
    if (!_2329)
    {
        float _2413 = fma(_1087, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2401);
        _2411 = _2413;
    }
    float _2415 = _2411;
    float _2417 = -_1529;
    float _2419 = fma(_2417, _2397, _2375);
    float _2421 = fma(_2133, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2353);
    float _2423 = fma(_2409, -2.0, 3.0);
    float _2425 = _2409 * _2409;
    float _2427 = fma(_1571, _2415, _2403);
    float _2429 = fma(_1573, _2415, _2405);
    float _2431 = fma(_1587, _2415, _2419);
    float _2433 = _2425 * _2423;
    float _2435 = _2427 * _313;
    float _2437 = _2427 * _309;
    float _2439 = _2427 * _317;
    float _2441 = -_2433;
    float _2443 = _2441 + 1.0;
    float _2445 = fma(_2429, _291, _2435);
    float _2447 = fma(_2429, _287, _2437);
    float _2449 = fma(_2429, _295, _2439);
    float _2451 = fma(_2443, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2433);
    float _2453 = fma(_2431, _325, _2445);
    float _2455 = in.m_69.x;
    float _2457 = -_2399;
    float _2459 = _2457 + 1.0;
    float _2461 = _2351 * _2451;
    float _2463 = fma(_2431, _321, _2447);
    float _2465 = fma(_2431, _329, _2449);
    float _2467 = _2461 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2469 = _2459 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2471 = fma(_1969, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2421);
    out.m_81.x = _2463;
    out.m_81.y = _2453;
    out.m_81.z = _2465;
    float _2473 = _2471 + _2211;
    bool _2475 = _1973 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2477 = isnan(_1973);
    bool _2479 = _2475 || _2477;
    bool _2481 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2483 = _2479 || _2481;
    out.gl_Position.x = _2239;
    out.gl_Position.y = _2231;
    out.gl_Position.z = _2471;
    out.gl_Position.w = _2211;
    float _2485 = _2473 * 0.5;
    out.m_83.z = _2485;
    out.m_83.w = _2211;
    float _2487 = -_2469;
    float _2489 = _2487 + 1.0;
    float _2491 = _2471;
    float _2493 = _2489;
    if (!_2483)
    {
        _2357 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2495 = _2357;
    float _2497 = _2495;
    float _2499 = _2495;
    if (!_2483)
    {
        _2491 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2501 = _2491;
    float _2503 = _2501;
    float _2505 = _2501;
    if (!_2483)
    {
        _2359 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2507 = _2359;
    float _2509 = -_2243;
    float _2511 = _2509 + 1.0;
    float _2513 = _2511 * _2467;
    float _2515 = precise::clamp(_2513, 0.0, 1.0);
    float _2517 = -_2515;
    float _2519 = fma(_2517, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2521 = _2519 * _2455;
    float _2523 = _2521 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2525 = _2469 * _2265;
    float _2527 = _2275 * _2489;
    out.m_85.x = _2523;
    float _2529 = _2269;
    float _2531 = _2507;
    float _2533 = _2507;
    if (!_2483)
    {
        _2493 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2535 = _2493;
    float _2537 = _2275 * _2525;
    float _2539 = _2285 * _2525;
    float _2541 = fma(_2281, _2537, _2269);
    float _2543 = fma(_2283, _2537, _2271);
    float _2545 = fma(_2275, _2539, _2273);
    float _2547 = _1885 * _1943;
    float _2549 = _2547;
    float _2551 = _2535;
    float _2553 = _2535;
    if (!_2483)
    {
        _2529 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2555 = _2529;
    out.m_87.x = _2541;
    out.m_87.y = _2543;
    out.m_87.z = _2545;
    out.m_87.w = _2527;
    float _2557 = _2547 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2559 = _2555;
    float _2561 = _2555;
    if (!_2483)
    {
        _2549 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2563 = _2549;
    bool _2565 = !_2483;
    float _2567 = _2563;
    float _2569 = _2563;
    if (!_2565)
    {
        bool _2571 = _1973 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2573 = isnan(_1973);
        bool _2575 = _2571 || _2573;
        bool _2577 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2579 = _2575 || _2577;
        if (!_2579)
        {
            float _2581 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2583 = _1973 + _2581;
            float _2585 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2587 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2585;
            float _2589 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2591 = _2589 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2593 = 1.0 / _2587;
            float _2595 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2597 = _2595 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2599 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2601 = _2599 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2603 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2605 = _2603 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2607 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2609 = _2607 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2611 = _2583 * _2593;
            float _2613 = precise::clamp(_2611, 0.0, 1.0);
            float _2615 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2617 = _2615 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2619 = fma(_2613, _2591, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2621 = fma(_2613, _2617, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2623 = fma(_2613, _2597, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2625 = fma(_2613, _2601, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2627 = fma(_2613, _2605, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2629 = fma(_2613, _2609, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2499 = _2623;
            _2553 = _2627;
            _2561 = _2619;
            _2533 = _2625;
            _2505 = _2621;
            _2569 = _2629;
            _2631 = true;
        }
        else
        {
            bool _2633 = _1973 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2635 = isnan(_1973);
            bool _2637 = _2633 || _2635;
            bool _2639 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2641 = _2637 || _2639;
            if (!_2641)
            {
                _2559 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2643 = _2559;
            _2561 = _2643;
            if (!_2641)
            {
                _2497 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2645 = _2497;
            _2499 = _2645;
            if (!_2641)
            {
                _2503 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2647 = _2503;
            _2505 = _2647;
            if (!_2641)
            {
                _2531 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2649 = _2531;
            _2533 = _2649;
            if (!_2641)
            {
                _2551 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2651 = _2551;
            _2553 = _2651;
            if (!_2641)
            {
                _2567 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2653 = _2567;
            bool _2655 = !_2641;
            _2569 = _2653;
            if (!_2655)
            {
                bool _2657 = _1973 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2659 = isnan(_1973);
                bool _2661 = _2657 || _2659;
                bool _2663 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2665 = _2661 || _2663;
                if (!_2665)
                {
                    float _2667 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2669 = _1973 + _2667;
                    float _2671 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2673 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2671;
                    float _2675 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2677 = _2675 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2679 = 1.0 / _2673;
                    float _2681 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2683 = _2681 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2685 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2687 = _2685 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2689 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2691 = _2689 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2693 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2695 = _2693 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2697 = _2669 * _2679;
                    float _2699 = precise::clamp(_2697, 0.0, 1.0);
                    float _2701 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2703 = _2701 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2705 = fma(_2699, _2677, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2707 = fma(_2699, _2703, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2709 = fma(_2699, _2683, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2711 = fma(_2699, _2687, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2713 = fma(_2699, _2691, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2715 = fma(_2699, _2695, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2499 = _2709;
                    _2553 = _2713;
                    _2561 = _2705;
                    _2533 = _2711;
                    _2505 = _2707;
                    _2569 = _2715;
                    _2631 = true;
                }
                else
                {
                    _2499 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2553 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2561 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2533 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2505 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2569 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2631 = false;
    float _2717 = _2499;
    float _2719 = _2553;
    float _2721 = _2561;
    float _2723 = _2533;
    float _2725 = _2505;
    float _2727 = _2569;
    float _2729 = fma(_2453, -0.5, 0.5);
    float _2731 = precise::clamp(_2729, 0.0, 1.0);
    float _2733 = -_2717;
    float _2735 = _2733 + _2719;
    float _2737 = _2557 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2739 = -_2721;
    float _2741 = _2739 + _2723;
    float _2743 = fma(_2731, _2735, _2717);
    out.m_89.x = 0.0;
    float _2745 = -_2725;
    float _2747 = _2745 + _2727;
    float _2749 = fma(_2731, _2741, _2721);
    float _2751 = _2743 * 0.586610972881317138671875;
    out.m_51.x = _2737;
    bool _2753 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2755 = fma(_2731, _2747, _2725);
    float _2757 = fma(_2749, 0.298911988735198974609375, _2751);
    bool _2759 = _1885 > 0.0;
    bool _2761 = isnan(_1885);
    bool _2763 = _2759 || _2761;
    bool _2765 = isnan(0.0);
    bool _2767 = _2763 || _2765;
    float _2769 = fma(_2755, 0.114477999508380889892578125, _2757);
    out.m_91.x = 0.0;
    bool _2771 = _1943 <= 0.0;
    bool _2773 = !_2767;
    bool _2775 = _2771 || _2773;
    float _2777 = -_2769;
    float _2779 = _2749 + _2777;
    float _2781 = -_2769;
    float _2783 = _2743 + _2781;
    float _2785 = -_2769;
    float _2787 = _2755 + _2785;
    float _2789 = fma(_2779, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2769);
    float _2791 = fma(_2783, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2769);
    float _2793 = fma(_2787, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2769);
    bool _2795 = !_2753;
    if (!_2795)
    {
        float _2797 = -_1817;
        float _2799 = _2797 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2801 = -_1819;
        float _2803 = _2801 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2805 = -_1821;
        float _2807 = _2805 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2809 = _2799 * _2799;
        float _2811 = fma(_2803, _2803, _2809);
        float _2813 = fma(_2807, _2807, _2811);
        float _2815 = rsqrt(_2813);
        float _2817 = _2799 * _2815;
        float _2819 = _2803 * _2815;
        float _2821 = _2807 * _2815;
        float _2823 = sqrt(_2813);
        float _2825 = -_1979;
        float _2827 = _2825 + _2817;
        float _2829 = -_1975;
        float _2831 = _2829 + _2819;
        float _2833 = -_1977;
        float _2835 = _2833 + _2821;
        float _2837 = _2827 * _2827;
        float _2839 = fma(_2831, _2831, _2837);
        float _2841 = fma(_2835, _2835, _2839);
        float _2843 = -_2823;
        float _2845 = _2843 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2847 = rsqrt(_2841);
        float _2849 = _2845 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2851 = precise::clamp(_2849, 0.0, 1.0);
        float _2853 = abs(_2851);
        float _2855 = log2(_2853);
        float _2857 = _2827 * _2847;
        float _2859 = _2831 * _2847;
        float _2861 = _2835 * _2847;
        float _2863 = _2453 * _2857;
        float _2865 = fma((*spvDescriptorSet0.vp_c13)._m0[4].y, (*spvDescriptorSet0.vp_c13)._m0[4].y, 0.00999999977648258209228515625);
        float _2867 = precise::clamp(_2865, 0.0, 1.0);
        float _2869 = _2453 * _2817;
        float _2871 = fma(_2463, _2859, _2863);
        float _2873 = _2867 * _2867;
        float _2875 = _2855 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2877 = fma(_2463, _2819, _2869);
        float _2879 = fma(_2465, _2861, _2871);
        float _2881 = precise::clamp(_2879, 0.0, 1.0);
        float _2883 = _2873 + (-1.0);
        float _2885 = fma(_2465, _2821, _2877);
        float _2887 = precise::clamp(_2885, 0.0, 1.0);
        float _2889 = _2881 * _2881;
        float _2891 = _2819 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2893 = exp2(_2875);
        float _2895 = fma(_2889, _2883, 1.0);
        float _2897 = -_2817;
        float _2899 = -_2891;
        float _2901 = fma(_2897, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2899);
        float _2903 = _2895 * _2895;
        float _2905 = -_2821;
        float _2907 = fma(_2905, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2901);
        float _2909 = 1.0 / _2903;
        float _2911 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2913 = _2907 + _2911;
        float _2915 = _2913 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2917 = precise::clamp(_2915, 0.0, 1.0);
        float _2919 = _2893 * _2917;
        float _2921 = _2887 * _2919;
        float _2923 = _2873 * _2909;
        float _2925 = _2921 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2927 = _2921 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2929 = _2921 * _2923;
        float _2931 = _2921 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        float _2933 = _2929 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2935 = _2929 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2937 = _2929 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_89.x = _2925;
        out.m_89.y = _2927;
        out.m_89.z = _2931;
        out.m_91.x = _2933;
        out.m_91.y = _2935;
        out.m_91.z = _2937;
    }
    out.m_93.x = _2789;
    out.m_93.y = _2791;
    out.m_93.z = _2793;
    if (!_2775)
    {
        return out;
    }
    out.m_51.x = 0.0;
    float _2939 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2939;
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
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2631 = false;
    bool _1153 = false;
    bool _959 = false;
    bool _351 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _113 = in.m_48.w;
    float _115 = trunc(_113);
    int _117 = int(_115);
    bool _121 = _117 >= 1;
    float _123 = 0.0;
    if (!_121)
    {
        _123 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _125 = _123;
    float _127 = _125;
    if (!_121)
    {
        out.m_51.x = 0.0;
    }
    int _129 = 0;
    if (!_121)
    {
        float _131 = _125 * 5.0;
        _129 = as_type<int>(_131);
    }
    int _133 = _129;
    int _135 = _133;
    if (!_121)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2996 = as_type<float>(_133);
        out.gl_Position.z = _2996;
    }
    if (!_121)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _137 = in.m_53.w;
    bool _139 = _137 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _141 = isnan(_137);
    bool _143 = _139 || _141;
    bool _145 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _147 = _143 || _145;
    float _149 = -_137;
    float _151 = _149 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _153 = _151;
    if (_147)
    {
        float _155 = float(_117);
        _127 = _155;
    }
    float _157 = _127;
    bool _159 = _151 >= _157;
    bool _161 = !_147;
    bool _163 = _159 || _161;
    float _165 = _157;
    if (_163)
    {
        _165 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _167 = _165;
    if (_163)
    {
        out.m_51.x = 0.0;
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
        float _3066 = as_type<float>(_171);
        out.gl_Position.z = _3066;
    }
    if (_163)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _173 = in.m_55.x;
    float _175 = in.m_55.y;
    float _177 = in.m_55.z;
    float _179 = in.m_57.x;
    float _181 = in.m_57.y;
    float _183 = in.m_57.z;
    float _185 = in.m_59.x;
    float _187 = in.m_59.y;
    float _189 = in.m_59.z;
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
    float _221 = _203;
    if (_215)
    {
        float _223 = rsqrt(_203);
        _219 = _223;
    }
    float _225 = _219;
    float _227 = 0.0;
    float _229 = 0.0;
    if (!_215)
    {
        _227 = 0.0;
        _229 = 0.0;
    }
    float _231 = _227;
    float _233 = _229;
    bool _235 = _213 > 0.0;
    float _237 = 0.0;
    float _239 = _231;
    float _241 = _233;
    if (!_215)
    {
        _237 = 0.0;
    }
    float _243 = _237;
    float _245 = 0.0;
    float _247 = 0.0;
    float _249 = _243;
    if (!_217)
    {
        _245 = 0.0;
        _247 = 0.0;
    }
    float _251 = _245;
    float _253 = _247;
    float _255 = _209;
    float _257 = _253;
    float _259 = _251;
    if (_217)
    {
        float _261 = rsqrt(_205);
        _255 = _261;
    }
    float _263 = _255;
    float _265 = 0.0;
    if (!_217)
    {
        _265 = 0.0;
    }
    float _267 = _265;
    float _269 = 0.0;
    float _271 = _267;
    if (!_235)
    {
        _269 = 0.0;
    }
    float _273 = _269;
    float _275 = _213;
    float _277 = _273;
    if (_235)
    {
        float _279 = rsqrt(_207);
        _275 = _279;
    }
    float _281 = _275;
    float _283 = _225;
    if (_215)
    {
        float _285 = _225 * _179;
        _239 = _285;
    }
    float _287 = _239;
    if (_215)
    {
        float _289 = _225 * _173;
        _241 = _289;
    }
    float _291 = _241;
    if (_215)
    {
        float _293 = _225 * _185;
        _249 = _293;
    }
    float _295 = _249;
    bool _297 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    if (!_235)
    {
        _283 = 0.0;
    }
    float _299 = _283;
    float _301 = _299;
    if (!_235)
    {
        _221 = 0.0;
    }
    float _303 = _221;
    float _305 = _303;
    if (_217)
    {
        float _307 = _263 * _181;
        _271 = _307;
    }
    float _309 = _271;
    if (_217)
    {
        float _311 = _263 * _175;
        _257 = _311;
    }
    float _313 = _257;
    if (_217)
    {
        float _315 = _263 * _187;
        _259 = _315;
    }
    float _317 = _259;
    if (_235)
    {
        float _319 = _281 * _183;
        _277 = _319;
    }
    float _321 = _277;
    if (_235)
    {
        float _323 = _281 * _177;
        _301 = _323;
    }
    float _325 = _301;
    if (_235)
    {
        float _327 = _281 * _189;
        _305 = _327;
    }
    float _329 = _305;
    bool _331 = !_297;
    float _349;
    if (!_331)
    {
        float _333 = in.m_61.x;
        float _335 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _337 = _333 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _339 = fma(_337, (*spvDescriptorSet0.vp_c9)._m0[12].x, _151);
        float _341 = _339 * _335;
        float _343 = floor(_341);
        float _345 = -_343;
        float _347 = _341 + _345;
        _349 = _347;
        _351 = true;
    }
    else
    {
        float _353 = float(_117);
        float _355 = 1.0 / _353;
        float _357 = _151 * _355;
        _349 = _357;
    }
    _351 = false;
    float _359 = _349;
    int _361 = int2(spvDescriptorSet0.vp_t_tcb_C.get_width(), spvDescriptorSet0.vp_t_tcb_C.get_height()).x;
    int _363 = _361;
    int _365 = 0;
    int _367 = _108(_363, _365, (*spvDescriptorSet0.support_buffer));
    float _369 = in.m_61.x;
    float _371 = in.m_61.y;
    float _373 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[191].y;
    float _375 = -_373;
    float _377 = _375 + (*spvDescriptorSet0.vp_c9)._m0[191].y;
    float _379 = fma((*spvDescriptorSet0.vp_c10)._m0[2].x, 0.0166666693985462188720703125, _369);
    float _381 = fma(_377, _371, _373);
    float _383 = _379 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _385 = _383 * _381;
    float _387 = float(_367);
    int _389 = abs(_367);
    bool _391 = _367 == 0;
    float _393 = _385 * _387;
    float _395 = float(uint(_389));
    float _397 = trunc(_393);
    int _399 = int(_397);
    float _401 = 1.0 / _395;
    int _403 = abs(_399);
    uint _406 = uint(int(uint(_399) >> uint(31)));
    float _408 = float(uint(_403));
    int _410 = ~int(_406);
    int _412 = _410 + 1;
    int _414 = as_type<int>(_401) + (-2);
    float _416 = as_type<float>(_414) * _408;
    float _418 = trunc(_416);
    float _420 = precise::max(_418, 0.0);
    uint _422 = uint(_420);
    int _424 = ~int(_422);
    int _426 = _424 + 1;
    int _428 = _426 * _389;
    int _430 = _428 + _403;
    float _432 = float(uint(_430));
    float _434 = as_type<float>(_414) * _432;
    float _436 = trunc(_434);
    float _438 = precise::max(_436, 0.0);
    uint _440 = uint(_438);
    int _442 = int(_422) + int(_440);
    float _444 = in.m_63.z;
    int _446 = ~_442;
    int _448 = _446 + 1;
    int _450 = _448 * _389;
    int _452 = _450 + _403;
    bool _454 = uint(_452) >= uint(_389);
    bool _456 = !_454;
    int _458 = _456 ? 0 : (-1);
    int _460 = ~_442;
    int _462 = _460 + _458;
    int _464 = _462 + 1;
    float _466 = trunc(_444);
    int _468 = int(_466);
    int _470 = _464 * _389;
    int _472 = _470 + _403;
    int _474 = _472 ^ _412;
    int _476 = ~_412;
    int _478 = _476 + _474;
    int _480 = _478 + 1;
    bool _482 = !_391;
    int _484 = _482 ? _480 : (-1);
    int _486 = _484;
    int _488 = 0;
    int _490 = _109(_486, _488, (*spvDescriptorSet0.support_buffer));
    int _492 = _468;
    int _494 = 0;
    int _496 = _109(_492, _494, (*spvDescriptorSet0.support_buffer));
    float4 _499 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_490, _496)), 0).xyzw;
    float _501 = _499.x;
    float _503 = _499.y;
    float _505 = _499.z;
    float _507 = _499.w;
    int _509 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _511 = _509 != 0;
    bool _513 = _371 > 0.5;
    bool _515 = _513 && _511;
    float _517 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _519 = _517 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _521 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _523 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _521;
    int _525 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _527 = _525 != 0;
    float _529 = 1.0 / _519;
    float _531 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _533 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _531;
    float _535 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _537 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _539 = 1.0 / _523;
    float _541 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _543 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _545 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _547 = _541 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _549 = 1.0 / _533;
    float _551 = _543 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _553 = _545 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _555 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _557 = _359 + _555;
    float _559 = _535 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _561 = _537 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _563 = _359 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _565 = isnan(_359);
    bool _567 = _563 || _565;
    bool _569 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _571 = _567 || _569;
    float _573 = float(_571);
    float _575 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _577 = _359 + _575;
    float _579 = _557 * _529;
    float _581 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _583 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _585 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    bool _587 = _359 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _589 = isnan(_359);
    bool _591 = _587 || _589;
    bool _593 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _595 = _591 || _593;
    float _597 = float(_595);
    float _599 = _581 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _601 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _603 = _359 + _601;
    float _605 = _577 * _539;
    out.m_65.x = _547;
    out.m_65.y = _551;
    out.m_65.z = _553;
    out.m_65.w = _585;
    float _607 = _603 * _549;
    out.m_67.x = _559;
    out.m_67.y = _599;
    out.m_67.z = _561;
    out.m_67.w = _583;
    int _609 = _484 + 1;
    float _611 = 0.0;
    if (_527)
    {
        float _613 = in.m_61.x;
        _611 = _613;
    }
    float _615 = _611;
    float _617 = in.m_63.x;
    float _619 = -_573;
    float _621 = _619 + 1.0;
    float _623 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _625 = _623 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    bool _627 = _359 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _629 = isnan(_359);
    bool _631 = _627 || _629;
    bool _633 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _635 = _631 || _633;
    float _637 = float(_635);
    float _639 = _597 * _621;
    bool _641 = _359 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _643 = isnan(_359);
    bool _645 = _641 || _643;
    bool _647 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _649 = _645 || _647;
    float _651 = float(_649);
    float _653 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _655 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _653;
    float _657 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _659 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _657;
    float _661 = -_637;
    float _663 = _661 + 1.0;
    float _665 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _667 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _665;
    float _669 = -_597;
    float _671 = _669 + 1.0;
    float _673 = fma(_655, _607, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _675 = _651 * _663;
    float _677 = fma(_659, _607, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _679 = fma(_667, _607, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _681 = _637 * _671;
    float _683 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _685 = _683 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _687 = _673 * _675;
    float _689 = -_651;
    float _691 = _689 + 1.0;
    float _693 = _679 * _675;
    float _695 = _677 * _675;
    float _697 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _699 = _697 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _701 = fma(_691, (*spvDescriptorSet0.vp_c9)._m0[143].z, _687);
    float _703 = fma(_625, _579, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _705 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _707 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _705;
    float _709 = fma(_691, (*spvDescriptorSet0.vp_c9)._m0[143].x, _695);
    float _711 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _713 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _711;
    float _715 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _717 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _715;
    float _719 = fma(_685, _579, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _721 = fma(_691, (*spvDescriptorSet0.vp_c9)._m0[143].y, _693);
    float _723 = fma(_707, _605, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _725 = fma(_703, _681, _701);
    float _727 = fma(_717, _605, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _729 = fma(_719, _681, _721);
    float _731 = fma(_699, _579, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _733 = fma(_723, _639, _725);
    int _735 = abs(_609);
    float _737 = fma(_727, _639, _729);
    float _739 = fma(_713, _605, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _741 = fma(_731, _681, _709);
    float _743 = float(uint(_735));
    float _745 = in.m_63.y;
    bool _747 = _615 > 0.5;
    bool _749 = _747 && _527;
    float _751 = fma(_739, _639, _741);
    float _753 = (*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _755 = _731;
    if (_527)
    {
        _753 = _617;
    }
    float _757 = _753;
    float _759 = as_type<float>(_414) * _743;
    float _761 = _757;
    if (!_527)
    {
        _755 = _617;
    }
    float _763 = _755;
    float _765 = fma(_573, (*spvDescriptorSet0.vp_c9)._m0[146].x, _751);
    uint _767 = uint(int(uint(_609) >> uint(31)));
    float _769 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _771 = fma(_573, (*spvDescriptorSet0.vp_c9)._m0[146].y, _737);
    float _773 = fma(_573, (*spvDescriptorSet0.vp_c9)._m0[146].z, _733);
    int _775 = ~int(_767);
    int _777 = _775 + 1;
    float _779 = _763;
    if (_749)
    {
        float _781 = -_757;
        float _783 = _781 + 1.0;
        _761 = _783;
    }
    float _785 = _761;
    float _787 = trunc(_759);
    float _789 = precise::max(_787, 0.0);
    uint _791 = uint(_789);
    if (_527)
    {
        _779 = _785;
    }
    float _793 = _779;
    float _795 = _745;
    if (_515)
    {
        float _797 = -_745;
        float _799 = _797 + 1.0;
        _795 = _799;
    }
    float _801 = _795;
    float _803 = _793 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _805 = _801 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _807 = _803 * _769;
    int _809 = ~int(_791);
    int _811 = _809 + 1;
    int _813 = _811 * _389;
    int _815 = _813 + _735;
    float _817 = float(uint(_815));
    float _819 = as_type<float>(_414) * _817;
    float _821 = trunc(_819);
    float _823 = precise::max(_821, 0.0);
    uint _825 = uint(_823);
    int _827 = int(_791) + int(_825);
    int _829 = ~_827;
    int _831 = _829 + 1;
    int _833 = _831 * _389;
    int _835 = _833 + _735;
    bool _837 = uint(_835) >= uint(_389);
    bool _839 = !_837;
    int _841 = _839 ? 0 : (-1);
    int _843 = ~_827;
    int _845 = _843 + _841;
    int _847 = _845 + 1;
    int _849 = _847 * _389;
    int _851 = _849 + _735;
    int _853 = _851 ^ _777;
    int _855 = ~_777;
    int _857 = _855 + _853;
    int _859 = _857 + 1;
    float _861 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _863 = !_391;
    int _865 = _863 ? _859 : (-1);
    float _867 = _805 * _861;
    uint _869 = as_type<uint>(half2(float2(_507, 0.0)));
    uint _871 = extract_bits(_869, 0u, 8u);
    int _873 = int(_871) & 255;
    uint _875 = extract_bits(_869, 8u, 8u);
    int _877 = int(_875) & 255;
    int _879 = _877 << 8;
    int _881 = _873 | _879;
    bool _883 = _881 >= 32768;
    int _885 = _881 + (-1024);
    int _887 = _885;
    if (_883)
    {
        int _889 = ~_881;
        int _891 = _889 + 33792;
        int _893 = _891 + 1;
        _887 = _893;
    }
    int _895 = _887;
    int _897 = _895 + 30719;
    float _899 = float(_897);
    float _901 = fma(_899, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _903 = abs(_901);
    float _905 = -_903;
    float _907 = _905 + 1.0;
    float _909 = abs(_901);
    float _911 = fma(_909, -0.0187292993068695068359375, 0.074261002242565155029296875);
    bool _913 = _901 < 0.0;
    float _915 = float(_913);
    int _917 = as_type<int>(_907) + (-218103808);
    float _919 = abs(_901);
    float _921 = fma(_919, _911, -0.212114393711090087890625);
    bool _923 = uint(_917) >= 1920991232u;
    float _925 = abs(_901);
    float _927 = fma(_925, _921, 1.570728778839111328125);
    bool _929 = !_923;
    int _931 = as_type<int>(_907);
    float _957;
    if (!_929)
    {
        int _933 = as_type<int>(_907);
        int _935 = _917;
        int _937 = 4224;
        int _939 = as_type<int>(_907);
        int _941 = as_type<int>(_681);
        int _943;
        int _945;
        int _947;
        int _949;
        int _951;
        int _953;
        int _955;
        _106(_933, _935, _937, _939, _941, _943, _945, _947, _949, _951, _953, _955, out.gl_Position, out.gl_PointSize);
        _957 = as_type<float>(_953);
        _931 = _951;
        _959 = true;
    }
    else
    {
        float _961 = rsqrt(_907);
        float _963 = _907 * _961;
        float _965 = _961 * 0.5;
        float _967 = -_963;
        float _969 = 0.0 + _967;
        float _971 = fma(_965, _969, 0.5);
        float _973 = fma(_963, _971, _963);
        float _975 = -_973;
        float _977 = 0.0 + _975;
        float _979 = fma(_973, _977, _907);
        float _981 = fma(_965, _979, _973);
        _957 = _981;
    }
    _959 = false;
    float _983 = _957;
    int _985 = _931;
    int _987 = _865;
    int _989 = 0;
    int _991 = _109(_987, _989, (*spvDescriptorSet0.support_buffer));
    int _993 = _468;
    int _995 = 0;
    int _997 = _109(_993, _995, (*spvDescriptorSet0.support_buffer));
    float4 _999 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_991, _997)), 0).xyzw;
    float _1001 = _999.x;
    float _1003 = _999.y;
    float _1005 = _999.z;
    float _1007 = _999.w;
    float _1009 = floor(_393);
    float _1011 = _927 * _983;
    float _1013 = _915 * 2.0;
    float _1015 = _899 * 3.883221149444580078125;
    float _1017 = -_1013;
    float _1019 = fma(_1011, _1017, _1011);
    float _1021 = _1015 * 0.15915493667125701904296875;
    float _1023 = fma(_915, 3.1415927410125732421875, _1019);
    float _1025 = _1021 * 6.283185482025146484375;
    float _1027 = cos(_1025);
    float _1029 = _1023 * 0.15915493667125701904296875;
    float _1031 = -_1009;
    float _1033 = _393 + _1031;
    float _1035 = _1029 * 6.283185482025146484375;
    float _1037 = sin(_1035);
    float _1039 = _1021 * 6.283185482025146484375;
    float _1041 = sin(_1039);
    float _1043 = _1037 * _1027;
    float _1045 = _1037 * _1041;
    uint _1047 = as_type<uint>(half2(float2(_1007, 0.0)));
    float _1049 = -_501;
    float _1051 = _1049 + _1001;
    uint _1053 = extract_bits(_1047, 0u, 8u);
    int _1055 = int(_1053) & 255;
    uint _1057 = extract_bits(_1047, 8u, 8u);
    int _1059 = int(_1057) & 255;
    int _1061 = _1059 << 8;
    int _1063 = _1055 | _1061;
    float _1065 = fma(_1033, _1051, _501);
    bool _1067 = _1063 >= 32768;
    int _1069 = _1063 + (-1024);
    int _1071 = _1069;
    if (_1067)
    {
        int _1073 = ~_1063;
        int _1075 = _1073 + 33792;
        int _1077 = _1075 + 1;
        _1071 = _1077;
    }
    int _1079 = _1071;
    float _1081 = -_505;
    float _1083 = _1081 + _1005;
    int _1085 = _1079 + 30719;
    float _1087 = fma(_1033, _1083, _505);
    float _1089 = float(_1085);
    float _1091 = fma(_1089, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _1093 = abs(_1091);
    float _1095 = -_1093;
    float _1097 = _1095 + 1.0;
    float _1099 = abs(_1091);
    float _1101 = fma(_1099, -0.0187292993068695068359375, 0.074261002242565155029296875);
    bool _1103 = _1091 < 0.0;
    float _1105 = float(_1103);
    int _1107 = as_type<int>(_1097) + (-218103808);
    float _1109 = abs(_1091);
    float _1111 = fma(_1109, _1101, -0.212114393711090087890625);
    bool _1113 = uint(_1107) >= 1920991232u;
    float _1115 = -_503;
    float _1117 = _1115 + _1003;
    float _1119 = abs(_1091);
    float _1121 = fma(_1119, _1111, 1.570728778839111328125);
    float _1123 = fma(_1033, _1117, _503);
    bool _1125 = !_1113;
    float _1151;
    if (!_1125)
    {
        int _1127 = as_type<int>(_1097);
        int _1129 = as_type<int>(_1097);
        int _1131 = 5120;
        int _1133 = _985;
        int _1135 = as_type<int>(_1011);
        int _1137;
        int _1139;
        int _1141;
        int _1143;
        int _1145;
        int _1147;
        int _1149;
        _106(_1127, _1129, _1131, _1133, _1135, _1137, _1139, _1141, _1143, _1145, _1147, _1149, out.gl_Position, out.gl_PointSize);
        _1151 = as_type<float>(_1147);
        _1153 = true;
    }
    else
    {
        float _1155 = rsqrt(_1097);
        float _1157 = _1097 * _1155;
        float _1159 = _1155 * 0.5;
        float _1161 = -_1157;
        float _1163 = 0.0 + _1161;
        float _1165 = fma(_1159, _1163, 0.5);
        float _1167 = fma(_1157, _1165, _1157);
        float _1169 = -_1167;
        float _1171 = 0.0 + _1169;
        float _1173 = fma(_1167, _1171, _1097);
        float _1175 = fma(_1159, _1173, _1167);
        _1151 = _1175;
    }
    _1153 = false;
    float _1177 = _1151;
    float _1179 = in.m_61.x;
    float _1181 = in.m_61.y;
    float _1183 = in.m_61.z;
    float _1185 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1187 = log2(_1185);
    float _1189 = in.m_69.y;
    int _1191 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1193 = _1191 != 0;
    int _1195 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1197 = _1195 != 0;
    int _1199 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1201 = _1199 != 0;
    float _1203 = _1187 * _151;
    float _1205 = exp2(_1203);
    float _1207 = _1183 * 2.0;
    float _1209 = _1179 * 2.0;
    float _1211 = _1181 * 2.0;
    float _1213 = _1183 + _1179;
    float _1215 = floor(_1207);
    float _1217 = _1213 + (-1.0);
    float _1219 = floor(_1209);
    float _1221 = -_1205;
    float _1223 = _1221 + 1.0;
    bool _1225 = _1215 > 0.0;
    float _1227 = floor(_1211);
    bool _1229 = _1215 >= 0.0;
    bool _1231 = isnan(_1215);
    bool _1233 = _1229 || _1231;
    bool _1235 = isnan(0.0);
    bool _1237 = _1233 || _1235;
    float _1239 = _1181 + _1179;
    float _1241 = fma(_1217, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1243 = _1179 + (-0.5);
    int _1245 = _1237 ? 0 : 1;
    float _1247 = _1239 + (-1.0);
    bool _1249 = _1219 > 0.0;
    int _1251 = ~_1245;
    int _1253 = _1251 + 1;
    int _1255 = _1253 + 1;
    float _1257 = fma(_1247, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _1259 = _1219 >= 0.0;
    bool _1261 = isnan(_1219);
    bool _1263 = _1259 || _1261;
    bool _1265 = isnan(0.0);
    bool _1267 = _1263 || _1265;
    float _1269 = in.m_71.x;
    float _1271 = in.m_71.y;
    float _1273 = in.m_71.z;
    int _1275 = _1255;
    if (!_1225)
    {
        int _1277 = ~_1245;
        int _1279 = _1277 + 1;
        _1275 = _1279;
    }
    int _1281 = _1275;
    bool _1283 = !_1193;
    int _1285 = _1283 ? 0 : 1;
    bool _1287 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1289 = isnan(1.0);
    bool _1291 = _1287 || _1289;
    bool _1293 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1295 = _1291 || _1293;
    float _1297 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1299 = 1.0 + _1297;
    bool _1301 = _1227 > 0.0;
    bool _1303 = _1227 >= 0.0;
    bool _1305 = isnan(_1227);
    bool _1307 = _1303 || _1305;
    bool _1309 = isnan(0.0);
    bool _1311 = _1307 || _1309;
    float _1313 = 1.0 / _1299;
    int _1315 = abs(_1285);
    bool _1317 = !_1201;
    int _1319 = _1317 ? 0 : 1;
    int _1321 = _1311 ? 0 : 1;
    int _1323 = abs(_1319);
    bool _1325 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1327 = isnan(0.0);
    bool _1329 = _1325 || _1327;
    bool _1331 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1333 = _1329 || _1331;
    float _1335 = float(_1315);
    float _1337 = float(_1281);
    int _1339 = ~_1321;
    int _1341 = _1339 + 1;
    int _1343 = _1341 + 1;
    int _1345 = _1343;
    if (!_1301)
    {
        int _1347 = ~_1321;
        int _1349 = _1347 + 1;
        _1345 = _1349;
    }
    int _1351 = _1345;
    float _1353 = _1335 * _1337;
    float _1355 = _1333 ? _1223 : 0.0;
    float _1357 = float(_1323);
    float _1359 = _1353 * (-2.0);
    int _1361 = _1267 ? 0 : 1;
    if (_1295)
    {
        float _1363 = _1355 * _1313;
        _153 = _1363;
    }
    float _1365 = _153;
    float _1367 = float(_1351);
    bool _1369 = !_1197;
    int _1371 = _1369 ? 0 : 1;
    int _1373 = ~_1361;
    int _1375 = _1373 + 1;
    int _1377 = _1375 + 1;
    float _1379 = _1357 * _1367;
    int _1381 = _1377;
    if (!_1249)
    {
        int _1383 = ~_1361;
        int _1385 = _1383 + 1;
        _1381 = _1385;
    }
    int _1387 = _1381;
    float _1389 = fma(_1359, _1269, _1269);
    int _1391 = abs(_1371);
    float _1393 = _1379 * (-2.0);
    float _1395 = fma(_1257, _1359, _1257);
    float _1397 = fma(_1243, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1389);
    float _1399 = fma(_1241, _1393, _1241);
    float _1401 = fma(_1393, _1273, _1273);
    float _1403 = _1183 + (-0.5);
    float _1405 = float(_1391);
    float _1407 = fma(_1395, _1365, _1397);
    float _1409 = float(_1387);
    float _1411 = fma(_1403, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1401);
    float _1413 = _1183 + _1181;
    float _1415 = _1181 + (-0.5);
    float _1417 = _1407 * 0.15915493667125701904296875;
    float _1419 = _1405 * _1409;
    float _1421 = fma(_1399, _1365, _1411);
    float _1423 = in.m_73.x;
    float _1425 = in.m_73.y;
    float _1427 = in.m_73.z;
    float _1429 = _1413 + (-1.0);
    float _1431 = _1419 * (-2.0);
    float _1433 = _1421 * 0.15915493667125701904296875;
    float _1435 = in.m_48.x;
    float _1437 = in.m_48.y;
    float _1439 = in.m_48.z;
    float _1441 = fma(_1429, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1443 = fma(_1431, _1271, _1271);
    float _1445 = _1417 * 6.283185482025146484375;
    float _1447 = sin(_1445);
    float _1449 = in.m_57.x;
    float _1451 = in.m_57.y;
    float _1453 = in.m_57.z;
    float _1455 = in.m_57.w;
    float _1457 = fma(_1441, _1431, _1441);
    float _1459 = fma(_1415, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1443);
    float _1461 = in.m_59.x;
    float _1463 = in.m_59.y;
    float _1465 = in.m_59.z;
    float _1467 = in.m_59.w;
    float _1469 = fma(_1457, _1365, _1459);
    float _1471 = _1417 * 6.283185482025146484375;
    float _1473 = cos(_1471);
    float _1475 = _1469 * 0.15915493667125701904296875;
    float _1477 = _1433 * 6.283185482025146484375;
    float _1479 = sin(_1477);
    float _1481 = _765 * _1423;
    float _1483 = _773 * _1427;
    float _1485 = _771 * _1425;
    float _1487 = _1481 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1489 = _1483 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    bool _1491 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1493 = isnan(0.5);
    bool _1495 = _1491 || _1493;
    bool _1497 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1499 = _1495 || _1497;
    float _1501 = _1433 * 6.283185482025146484375;
    float _1503 = cos(_1501);
    float _1505 = _1437 * _1451;
    float _1507 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1087);
    float _1509 = _1485 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _1511 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1513 = isnan(0.5);
    bool _1515 = _1511 || _1513;
    bool _1517 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1519 = _1515 || _1517;
    float _1521 = _1437 * _1463;
    float _1523 = fma(_1435, _1449, _1505);
    float _1525 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1123);
    float _1527 = _1475 * 6.283185482025146484375;
    float _1529 = sin(_1527);
    float _1531 = fma(_1435, _1461, _1521);
    float _1533 = fma(_1439, _1453, _1523);
    float _1535 = _1437 + _1189;
    float _1537 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1065);
    float _1539 = fma(_1439, _1465, _1531);
    float _1541 = _1489 * _1507;
    float _1543 = _1447 * _1479;
    float _1545 = _1475 * 6.283185482025146484375;
    float _1547 = cos(_1545);
    float _1549 = _1473 * _1503;
    float _1551 = _1509 * _1525;
    float _1553 = _1473 * _1479;
    float _1555 = _1447 * _1503;
    float _1557 = _1487 * _1537;
    float _1559 = _1533 + _1455;
    float _1561 = _1539 + _1467;
    float _1563 = fma(_1529, _1543, _1549);
    float _1565 = -_1553;
    float _1567 = fma(_1529, _1555, _1565);
    float _1569 = -_1555;
    float _1571 = fma(_1529, _1553, _1569);
    float _1573 = fma(_1529, _1549, _1543);
    float _1575 = _1563 * _1551;
    float _1577 = _1547 * _1479;
    float _1579 = _1447 * _1547;
    float _1581 = _1547 * _1503;
    float _1583 = _1567 * _1551;
    float _1585 = fma(_1577, _1557, _1575);
    float _1587 = _1473 * _1547;
    float _1589 = _1579 * _1551;
    float _1591 = fma(_1581, _1557, _1583);
    float _1593 = fma(_1571, _1541, _1585);
    float _1595 = _1535 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1597 = -_1529;
    float _1599 = fma(_1597, _1557, _1589);
    float _1601 = fma(_1573, _1541, _1591);
    float _1603 = _1593 * _317;
    float _1605 = _1593 * _309;
    float _1607 = fma(_1587, _1541, _1599);
    float _1609 = fma(_1559, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1595);
    float _1611 = fma(_1601, _295, _1603);
    float _1613 = fma(_1601, _287, _1605);
    float _1615 = _1593 * _313;
    float _1617 = fma(_1561, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1609);
    float _1619 = fma(_1607, _329, _1611);
    float _1621 = fma(_1607, _321, _1613);
    float _1623 = fma(_1601, _291, _1615);
    float _1625 = _1617 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1627 = _1561 + _1619;
    float _1629 = _1559 + _1621;
    float _1631 = _1535 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1633 = 1.0 / _1625;
    float _1635 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1637 = _1627 + _1635;
    float _1639 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1641 = _1629 + _1639;
    float _1643 = fma(_1559, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1631);
    float _1645 = fma(_1607, _325, _1623);
    float _1647 = _1637 * _1637;
    float _1649 = fma(_1561, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1643);
    float _1651 = fma(_1641, _1641, _1647);
    float _1653 = _1649 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1655 = sqrt(_1651);
    float _1657 = _1653 + _1625;
    float _1659 = _1657 * _1633;
    float _1661 = _1659 * 0.5;
    float _1663 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1665 = fma(_1661, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1663);
    float _1667 = _1535 + _1645;
    float _1669 = 1.0 / _1665;
    bool _1671 = _1655 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1673 = _1623;
    float _1675 = _1601;
    float _1677 = _1645;
    float _1679 = _1633;
    float _1681 = _1625;
    float _1683 = _1641;
    float _1685 = _1637;
    float _1687 = _1467;
    if (!_1671)
    {
        _1673 = _1629;
    }
    float _1689 = _1673;
    float _1691 = _1689;
    if (!_1671)
    {
        _1675 = _1627;
    }
    float _1693 = _1675;
    float _1695 = _1693;
    if (!_1671)
    {
        _1677 = _1667;
    }
    float _1697 = _1677;
    bool _1699 = !_1671;
    float _1701 = _1697;
    if (!_1699)
    {
        float _1703 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1705 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1707 = _1655 + _1705;
        float _1709 = _1667 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1711 = rsqrt(_1651);
        float _1713 = _1707 * _1703;
        float _1715 = _1713 * 0.15915493667125701904296875;
        float _1717 = _1715 * 6.283185482025146484375;
        float _1719 = cos(_1717);
        float _1721 = _1715 * 6.283185482025146484375;
        float _1723 = sin(_1721);
        float _1725 = _1719 + (-1.0);
        float _1727 = _1725 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1729 = fma(_1723, _1709, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1731 = fma(_1667, _1719, _1727);
        float _1733 = _1711 * _1729;
        float _1735 = fma(_1641, _1733, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1737 = fma(_1637, _1733, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1691 = _1735;
        _1701 = _1731;
        _1679 = _1715;
        _1695 = _1737;
        _1681 = _1733;
    }
    float _1739 = _1691;
    float _1741 = _1701;
    float _1743 = _1679;
    float _1745 = _1695;
    float _1747 = _1681;
    float _1749 = _1747;
    float _1751 = _1745;
    float _1753 = _1743;
    if (_1519)
    {
        _1749 = 1.0;
    }
    float _1755 = _1749;
    float _1757 = _1755;
    if (_1499)
    {
        _1683 = _1739;
    }
    float _1759 = _1683;
    float _1761 = _1759;
    if (_1499)
    {
        _1685 = _1741;
    }
    float _1763 = _1685;
    float _1765 = _1763;
    if (!_1499)
    {
        float _1767 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1769 = _1535 + _1767;
        float _1771 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1773 = _1559 + _1771;
        float _1775 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1777 = -_1535;
        float _1779 = _1777 + _1741;
        float _1781 = _1769 * _1769;
        float _1783 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1785 = _1561 + _1783;
        float _1787 = -_1559;
        float _1789 = _1787 + _1739;
        float _1791 = -_1561;
        float _1793 = _1791 + _1745;
        float _1795 = fma(_1773, _1773, _1781);
        float _1797 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1799 = fma(_1785, _1785, _1795);
        float _1801 = sqrt(_1799);
        float _1803 = _1775 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1805 = precise::min(_1801, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1807 = _1805 * _1797;
        float _1809 = _1803 * _1807;
        float _1811 = fma(_1779, _1809, _1535);
        float _1813 = fma(_1789, _1809, _1559);
        float _1815 = fma(_1793, _1809, _1561);
        _1765 = _1811;
        _1761 = _1813;
        _1751 = _1815;
        _1753 = _1809;
    }
    float _1817 = _1765;
    float _1819 = _1761;
    float _1821 = _1751;
    float _1823 = _1753;
    float _1825 = _1823;
    if (_1519)
    {
        _1687 = 1.0;
    }
    float _1827 = _1687;
    float _1829 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1831 = _1669 * _1829;
    float _1833 = _1827;
    if (!_1519)
    {
        float _1835 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1837 = _1835 * 0.15915493667125701904296875;
        float _1839 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1841 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1843 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1841;
        float _1845 = _1837 * 6.283185482025146484375;
        float _1847 = cos(_1845);
        float _1849 = _1839 * 0.15915493667125701904296875;
        float _1851 = _1837 * 6.283185482025146484375;
        float _1853 = sin(_1851);
        float _1855 = 1.0 / _1847;
        float _1857 = _1849 * 6.283185482025146484375;
        float _1859 = cos(_1857);
        float _1861 = _1853 * _1855;
        float _1863 = _1849 * 6.283185482025146484375;
        float _1865 = sin(_1863);
        float _1867 = _1859 * _1861;
        float _1869 = 1.0 / _1843;
        float _1871 = 1.0 / _1867;
        float _1873 = _1865 * _1871;
        float _1875 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1877 = fma(_1831, _1873, _1875);
        float _1879 = _1877 * _1869;
        float _1881 = precise::clamp(_1879, 0.0, 1.0);
        _1825 = _1843;
        _1757 = _1881;
    }
    float _1883 = _1825;
    float _1885 = _1757;
    float _1887 = _1883;
    if (!_1519)
    {
        float _1889 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1891 = _1889 * 0.15915493667125701904296875;
        float _1893 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1895 = _1891 * 6.283185482025146484375;
        float _1897 = cos(_1895);
        float _1899 = _1893 * 0.15915493667125701904296875;
        float _1901 = _1891 * 6.283185482025146484375;
        float _1903 = sin(_1901);
        float _1905 = 1.0 / _1897;
        float _1907 = _1899 * 6.283185482025146484375;
        float _1909 = cos(_1907);
        float _1911 = _1903 * _1905;
        float _1913 = _1899 * 6.283185482025146484375;
        float _1915 = sin(_1913);
        float _1917 = _1909 * _1911;
        float _1919 = 1.0 / _1917;
        float _1921 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1923 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1921;
        float _1925 = 1.0 / _1923;
        float _1927 = _1915 * _1919;
        float _1929 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1931 = fma(_1831, _1927, _1929);
        float _1933 = _1931 * _1925;
        float _1935 = precise::clamp(_1933, 0.0, 1.0);
        float _1937 = -_1935;
        float _1939 = _1937 + 1.0;
        _1887 = _1919;
        _1833 = _1939;
    }
    float _1941 = _1887;
    float _1943 = _1833;
    float _1945 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1947 = _1817 + _1945;
    float _1949 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1951 = _1819 + _1949;
    float _1953 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1955 = _1821 + _1953;
    float _1957 = _1817 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1959 = _1947 * _1947;
    float _1961 = fma(_1819, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1957);
    float _1963 = fma(_1951, _1951, _1959);
    float _1965 = fma(_1821, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1961);
    float _1967 = fma(_1955, _1955, _1963);
    float _1969 = _1965 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1971 = rsqrt(_1967);
    float _1973 = sqrt(_1967);
    float _1975 = _1951 * _1971;
    float _1977 = _1955 * _1971;
    float _1979 = _1947 * _1971;
    float _1981 = _1975 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1983 = _1977 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1985 = _1981 * _1981;
    float _1987 = _1983 * _1983;
    float _1989 = _1985 + _1987;
    float _1991 = sqrt(_1989);
    bool _1993 = _1991 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1995 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1997 = _1991 + _1995;
    float _1999 = _1941;
    float _2001 = _1989;
    float _2003 = _1997;
    float _2005 = _1971;
    float _2007 = _1981;
    float _2009 = _1983;
    float _2011 = _1985;
    float _2013 = _1987;
    if (_1993)
    {
        float _2015 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1999 = _2015;
    }
    float _2017 = _1999;
    if (_1993)
    {
        float _2019 = rsqrt(_1989);
        _2001 = _2019;
    }
    float _2021 = _2001;
    if (_1993)
    {
        float _2023 = _1997 * _2017;
        _2003 = _2023;
    }
    float _2025 = _2003;
    float _2027 = 0.0;
    if (_1993)
    {
        float _2029 = _2025 * 0.15915493667125701904296875;
        _2027 = _2029;
    }
    float _2031 = _2027;
    float _2033 = _1627;
    if (_1993)
    {
        float _2035 = _2031 * 6.283185482025146484375;
        float _2037 = sin(_2035);
        _2033 = _2037;
    }
    float _2039 = _2033;
    float _2041 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2043 = precise::max(0.0, _2041);
    float _2045 = _1629;
    float _2047 = _2043;
    if (_1993)
    {
        float _2049 = _2031 * 6.283185482025146484375;
        float _2051 = cos(_2049);
        _2045 = _2051;
    }
    float _2053 = _2045;
    float _2055 = -_1979;
    float _2057 = -_2043;
    float _2059 = fma(_2055, (*spvDescriptorSet0.vp_c15)._m0[24].y, _2057);
    float _2061 = _2059;
    if (_1993)
    {
        float _2063 = _2059 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2005 = _2063;
    }
    float _2065 = _2005;
    float _2067 = _2039;
    if (_1993)
    {
        float _2069 = fma(_2039, _2065, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2067 = _2069;
    }
    float _2071 = _2067;
    float _2073 = _2071;
    if (_1993)
    {
        float _2075 = _2053 + (-1.0);
        _2047 = _2075;
    }
    float _2077 = _2047;
    float _2079 = _2077;
    if (_1993)
    {
        float _2081 = _2021 * _2071;
        _2073 = _2081;
    }
    float _2083 = _2073;
    float _2085 = fma(_1559, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    if (_1993)
    {
        float _2087 = _2077 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2079 = _2087;
    }
    float _2089 = _2079;
    if (_1993)
    {
        float _2091 = _1981 * _2083;
        _2007 = _2091;
    }
    float _2093 = _2007;
    if (_1993)
    {
        float _2095 = _1983 * _2083;
        _2009 = _2095;
    }
    float _2097 = _2009;
    if (_1993)
    {
        float _2099 = fma(_2059, _2053, _2089);
        _2061 = _2099;
    }
    float _2101 = _2061;
    if (_1993)
    {
        float _2103 = _2093 * _2093;
        _2011 = _2103;
    }
    float _2105 = _2011;
    if (_1993)
    {
        float _2107 = _2097 * _2097;
        _2013 = _2107;
    }
    float _2109 = _2013;
    float _2111 = _1817 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2113 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2115 = fma(_2101, _2101, _2105);
    float _2117 = floor(_2085);
    float _2119 = fma(_1819, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2111);
    float _2121 = _2115 + _2109;
    float _2123 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2125 = fma(_1973, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2123);
    float _2127 = precise::clamp(_2125, 0.0, 1.0);
    float _2129 = fma(_1821, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2119);
    float _2131 = rsqrt(_2121);
    float _2133 = _2129 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2135 = -_2127;
    float _2137 = _2135 + 1.0;
    float _2139 = _2133 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2141 = fma(_1561, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2143 = _1817 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2145 = _1817 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2147 = -_2139;
    float _2149 = fma(_2147, _2113, 1.0);
    float _2151 = abs(_2137);
    float _2153 = log2(_2151);
    float _2155 = fma(_1819, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2143);
    float _2157 = fma(_1819, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2145);
    float _2159 = -_2117;
    float _2161 = _2085 + _2159;
    float _2163 = _2131 * _2093;
    float _2165 = fma(_1821, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2157);
    float _2167 = _2131 * _2097;
    float _2169 = _2131 * _2101;
    float _2171 = _2163 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2173 = fma(_1821, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2155);
    float _2175 = _2165 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2177 = floor(_2141);
    float _2179 = -_2171;
    float _2181 = fma(_2169, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2179);
    float _2183 = _2173 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2185 = _2175 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2187 = _2153 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2189 = -_2167;
    float _2191 = fma(_2189, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2181);
    float _2193 = fma(_2183, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2185);
    float _2195 = log2(_2149);
    float _2197 = fma(_2191, -0.5, 0.5);
    float _2199 = exp2(_2187);
    float _2201 = fma(_2133, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2193);
    float _2203 = fma(_2191, 0.5, 0.5);
    float _2205 = _2175 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2207 = -_2177;
    float _2209 = _2141 + _2207;
    float _2211 = fma(_1969, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2201);
    float _2213 = _2175 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2215 = fma(_2183, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2205);
    float _2217 = sqrt(_2197);
    float _2219 = fma(_2203, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2221 = fma(_2183, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2213);
    float _2223 = fma(_2133, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2215);
    float _2225 = _2169 + 1.0;
    float _2227 = fma(_2203, _2219, -0.212114393711090087890625);
    float _2229 = fma(_2133, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2221);
    float _2231 = fma(_1969, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2223);
    float _2233 = 1.0 / _2211;
    float _2235 = -_2169;
    float _2237 = fma(_2199, _2225, _2235);
    float _2239 = fma(_1969, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2229);
    float _2241 = _2195 * 0.693147182464599609375;
    float2 _6042 = float2(_2161, _2209);
    float _2243 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6042, float2(0.0), isnan(_6042)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6042, float2(0.0), isnan(_6042)), level(0.0)).x;
    float _2245 = fma(_2203, _2227, 1.570728778839111328125);
    float _2247 = _2241 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2249 = _2217 * 0.636619746685028076171875;
    float _2251 = -_2245;
    float _2253 = fma(_2249, _2251, 1.0);
    float _2255 = fma(_2237, 0.5, 0.5);
    float _2257 = _2239 * _2233;
    float _2259 = _2231 * _2233;
    float _2261 = fma(_2257, 0.5, 0.5);
    float _2263 = fma(_2259, -0.5, 0.5);
    float3 _6080 = float3(_2261, _2263, _2247);
    float _2265 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6080, float3(0.0), isnan(_6080)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6080, float3(0.0), isnan(_6080)), level(0.0)).x;
    float3 _6091 = float3(_2261, _2263, _2247);
    float4 _2267 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6091, float3(0.0), isnan(_6091)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6091, float3(0.0), isnan(_6091)), level(0.0)).xyzw;
    float _2269 = _2267.x;
    float _2271 = _2267.y;
    float _2273 = _2267.z;
    float _2275 = _2267.w;
    float2 _6107 = float2(_2253, _2255);
    float3 _2279 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6107, float2(0.0), isnan(_6107)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6107, float2(0.0), isnan(_6107)), level(0.0)).xyz;
    float _2281 = _2279.x;
    float _2283 = _2279.y;
    float _2285 = _2279.z;
    float _2287 = _1121 * _1177;
    float _2289 = _1105 * 2.0;
    float _2291 = _1089 * 3.883221149444580078125;
    bool _2293 = _1123 != 0.0;
    bool _2295 = isnan(_1123);
    bool _2297 = _2293 || _2295;
    bool _2299 = isnan(0.0);
    bool _2301 = _2297 || _2299;
    float _2303 = -_901;
    float _2305 = _2303 + _1091;
    float _2307 = -_2289;
    float _2309 = fma(_2287, _2307, _2287);
    float _2311 = _2291 * 0.15915493667125701904296875;
    bool _2313 = _1065 == 0.0;
    bool _2315 = !_2301;
    bool _2317 = _2313 && _2315;
    float _2319 = fma(_1033, _2305, _901);
    float _2321 = fma(_1105, 3.1415927410125732421875, _2309);
    out.m_75.x = _807;
    out.m_75.y = _867;
    float _2323 = abs(_1831);
    float _2325 = log2(_2323);
    bool _2327 = _1087 == 0.0;
    bool _2329 = _2327 && _2317;
    float _2331 = _2321 * 0.15915493667125701904296875;
    float _2333 = _2153 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2335 = _2175 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_77.x = _1559;
    float _2337 = _2311 * 6.283185482025146484375;
    float _2339 = cos(_2337);
    bool _2341 = _1831 <= 8000.0;
    bool _2343 = isnan(_1831);
    bool _2345 = _2341 || _2343;
    bool _2347 = isnan(8000.0);
    bool _2349 = _2345 || _2347;
    float _2351 = float(_2349);
    float _2353 = fma(_2183, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2335);
    out.m_77.z = _1561;
    float _2355 = _2319;
    float _2357 = _2211;
    float _2359 = _2231;
    if (!_2329)
    {
        float _2361 = fma(_1123, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2319);
        _2355 = _2361;
    }
    float _2363 = _2355;
    out.m_79.x = _1819;
    out.m_79.y = _1817;
    out.m_79.z = _1821;
    float _2365 = _2331 * 6.283185482025146484375;
    float _2367 = sin(_2365);
    float _2369 = _2325 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2371 = _1563 * _2363;
    float _2373 = _1567 * _2363;
    float _2375 = _1579 * _2363;
    float _2377 = _2311 * 6.283185482025146484375;
    float _2379 = sin(_2377);
    float _2381 = exp2(_2369);
    float _2383 = -_1043;
    float _2385 = fma(_2367, _2339, _2383);
    float _2387 = fma(_1033, _2385, _1043);
    float _2389 = -_1045;
    float _2391 = fma(_2367, _2379, _2389);
    float _2393 = _2387;
    if (!_2329)
    {
        float _2395 = fma(_1065, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2387);
        _2393 = _2395;
    }
    float _2397 = _2393;
    float _2399 = exp2(_2333);
    float _2401 = fma(_1033, _2391, _1045);
    float _2403 = fma(_1577, _2397, _2371);
    float _2405 = fma(_1581, _2397, _2373);
    float _2407 = fma(_2381, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2409 = precise::clamp(_2407, 0.0, 1.0);
    float _2411 = _2401;
    if (!_2329)
    {
        float _2413 = fma(_1087, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2401);
        _2411 = _2413;
    }
    float _2415 = _2411;
    float _2417 = -_1529;
    float _2419 = fma(_2417, _2397, _2375);
    float _2421 = fma(_2133, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2353);
    float _2423 = fma(_2409, -2.0, 3.0);
    float _2425 = _2409 * _2409;
    float _2427 = fma(_1571, _2415, _2403);
    float _2429 = fma(_1573, _2415, _2405);
    float _2431 = fma(_1587, _2415, _2419);
    float _2433 = _2425 * _2423;
    float _2435 = _2427 * _313;
    float _2437 = _2427 * _309;
    float _2439 = _2427 * _317;
    float _2441 = -_2433;
    float _2443 = _2441 + 1.0;
    float _2445 = fma(_2429, _291, _2435);
    float _2447 = fma(_2429, _287, _2437);
    float _2449 = fma(_2429, _295, _2439);
    float _2451 = fma(_2443, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2433);
    float _2453 = fma(_2431, _325, _2445);
    float _2455 = in.m_69.x;
    float _2457 = -_2399;
    float _2459 = _2457 + 1.0;
    float _2461 = _2351 * _2451;
    float _2463 = fma(_2431, _321, _2447);
    float _2465 = fma(_2431, _329, _2449);
    float _2467 = _2461 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2469 = _2459 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2471 = fma(_1969, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2421);
    out.m_81.x = _2463;
    out.m_81.y = _2453;
    out.m_81.z = _2465;
    float _2473 = _2471 + _2211;
    bool _2475 = _1973 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2477 = isnan(_1973);
    bool _2479 = _2475 || _2477;
    bool _2481 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2483 = _2479 || _2481;
    out.gl_Position.x = _2239;
    out.gl_Position.y = _2231;
    out.gl_Position.z = _2471;
    out.gl_Position.w = _2211;
    float _2485 = _2473 * 0.5;
    out.m_83.z = _2485;
    out.m_83.w = _2211;
    float _2487 = -_2469;
    float _2489 = _2487 + 1.0;
    float _2491 = _2471;
    float _2493 = _2489;
    if (!_2483)
    {
        _2357 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2495 = _2357;
    float _2497 = _2495;
    float _2499 = _2495;
    if (!_2483)
    {
        _2491 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2501 = _2491;
    float _2503 = _2501;
    float _2505 = _2501;
    if (!_2483)
    {
        _2359 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2507 = _2359;
    float _2509 = -_2243;
    float _2511 = _2509 + 1.0;
    float _2513 = _2511 * _2467;
    float _2515 = precise::clamp(_2513, 0.0, 1.0);
    float _2517 = -_2515;
    float _2519 = fma(_2517, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2521 = _2519 * _2455;
    float _2523 = _2521 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2525 = _2469 * _2265;
    float _2527 = _2275 * _2489;
    out.m_85.x = _2523;
    float _2529 = _2269;
    float _2531 = _2507;
    float _2533 = _2507;
    if (!_2483)
    {
        _2493 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2535 = _2493;
    float _2537 = _2275 * _2525;
    float _2539 = _2285 * _2525;
    float _2541 = fma(_2281, _2537, _2269);
    float _2543 = fma(_2283, _2537, _2271);
    float _2545 = fma(_2275, _2539, _2273);
    float _2547 = _1885 * _1943;
    float _2549 = _2547;
    float _2551 = _2535;
    float _2553 = _2535;
    if (!_2483)
    {
        _2529 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2555 = _2529;
    out.m_87.x = _2541;
    out.m_87.y = _2543;
    out.m_87.z = _2545;
    out.m_87.w = _2527;
    float _2557 = _2547 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2559 = _2555;
    float _2561 = _2555;
    if (!_2483)
    {
        _2549 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2563 = _2549;
    bool _2565 = !_2483;
    float _2567 = _2563;
    float _2569 = _2563;
    if (!_2565)
    {
        bool _2571 = _1973 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2573 = isnan(_1973);
        bool _2575 = _2571 || _2573;
        bool _2577 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2579 = _2575 || _2577;
        if (!_2579)
        {
            float _2581 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2583 = _1973 + _2581;
            float _2585 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2587 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2585;
            float _2589 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2591 = _2589 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2593 = 1.0 / _2587;
            float _2595 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2597 = _2595 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2599 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2601 = _2599 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2603 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2605 = _2603 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2607 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2609 = _2607 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2611 = _2583 * _2593;
            float _2613 = precise::clamp(_2611, 0.0, 1.0);
            float _2615 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2617 = _2615 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2619 = fma(_2613, _2591, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2621 = fma(_2613, _2617, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2623 = fma(_2613, _2597, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2625 = fma(_2613, _2601, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2627 = fma(_2613, _2605, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2629 = fma(_2613, _2609, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2499 = _2623;
            _2553 = _2627;
            _2561 = _2619;
            _2533 = _2625;
            _2505 = _2621;
            _2569 = _2629;
            _2631 = true;
        }
        else
        {
            bool _2633 = _1973 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2635 = isnan(_1973);
            bool _2637 = _2633 || _2635;
            bool _2639 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2641 = _2637 || _2639;
            if (!_2641)
            {
                _2559 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2643 = _2559;
            _2561 = _2643;
            if (!_2641)
            {
                _2497 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2645 = _2497;
            _2499 = _2645;
            if (!_2641)
            {
                _2503 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2647 = _2503;
            _2505 = _2647;
            if (!_2641)
            {
                _2531 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2649 = _2531;
            _2533 = _2649;
            if (!_2641)
            {
                _2551 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2651 = _2551;
            _2553 = _2651;
            if (!_2641)
            {
                _2567 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2653 = _2567;
            bool _2655 = !_2641;
            _2569 = _2653;
            if (!_2655)
            {
                bool _2657 = _1973 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2659 = isnan(_1973);
                bool _2661 = _2657 || _2659;
                bool _2663 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2665 = _2661 || _2663;
                if (!_2665)
                {
                    float _2667 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2669 = _1973 + _2667;
                    float _2671 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2673 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2671;
                    float _2675 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2677 = _2675 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2679 = 1.0 / _2673;
                    float _2681 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2683 = _2681 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2685 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2687 = _2685 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2689 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2691 = _2689 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2693 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2695 = _2693 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2697 = _2669 * _2679;
                    float _2699 = precise::clamp(_2697, 0.0, 1.0);
                    float _2701 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2703 = _2701 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2705 = fma(_2699, _2677, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2707 = fma(_2699, _2703, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2709 = fma(_2699, _2683, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2711 = fma(_2699, _2687, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2713 = fma(_2699, _2691, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2715 = fma(_2699, _2695, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2499 = _2709;
                    _2553 = _2713;
                    _2561 = _2705;
                    _2533 = _2711;
                    _2505 = _2707;
                    _2569 = _2715;
                    _2631 = true;
                }
                else
                {
                    _2499 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2553 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2561 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2533 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2505 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2569 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2631 = false;
    float _2717 = _2499;
    float _2719 = _2553;
    float _2721 = _2561;
    float _2723 = _2533;
    float _2725 = _2505;
    float _2727 = _2569;
    float _2729 = fma(_2453, -0.5, 0.5);
    float _2731 = precise::clamp(_2729, 0.0, 1.0);
    float _2733 = -_2717;
    float _2735 = _2733 + _2719;
    float _2737 = _2557 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2739 = -_2721;
    float _2741 = _2739 + _2723;
    float _2743 = fma(_2731, _2735, _2717);
    out.m_89.x = 0.0;
    float _2745 = -_2725;
    float _2747 = _2745 + _2727;
    float _2749 = fma(_2731, _2741, _2721);
    float _2751 = _2743 * 0.586610972881317138671875;
    out.m_51.x = _2737;
    bool _2753 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2755 = fma(_2731, _2747, _2725);
    float _2757 = fma(_2749, 0.298911988735198974609375, _2751);
    bool _2759 = _1885 > 0.0;
    bool _2761 = isnan(_1885);
    bool _2763 = _2759 || _2761;
    bool _2765 = isnan(0.0);
    bool _2767 = _2763 || _2765;
    float _2769 = fma(_2755, 0.114477999508380889892578125, _2757);
    out.m_91.x = 0.0;
    bool _2771 = _1943 <= 0.0;
    bool _2773 = !_2767;
    bool _2775 = _2771 || _2773;
    float _2777 = -_2769;
    float _2779 = _2749 + _2777;
    float _2781 = -_2769;
    float _2783 = _2743 + _2781;
    float _2785 = -_2769;
    float _2787 = _2755 + _2785;
    float _2789 = fma(_2779, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2769);
    float _2791 = fma(_2783, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2769);
    float _2793 = fma(_2787, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2769);
    bool _2795 = !_2753;
    if (!_2795)
    {
        float _2797 = -_1817;
        float _2799 = _2797 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2801 = -_1819;
        float _2803 = _2801 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2805 = -_1821;
        float _2807 = _2805 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2809 = _2799 * _2799;
        float _2811 = fma(_2803, _2803, _2809);
        float _2813 = fma(_2807, _2807, _2811);
        float _2815 = rsqrt(_2813);
        float _2817 = _2799 * _2815;
        float _2819 = _2803 * _2815;
        float _2821 = _2807 * _2815;
        float _2823 = sqrt(_2813);
        float _2825 = -_1979;
        float _2827 = _2825 + _2817;
        float _2829 = -_1975;
        float _2831 = _2829 + _2819;
        float _2833 = -_1977;
        float _2835 = _2833 + _2821;
        float _2837 = _2827 * _2827;
        float _2839 = fma(_2831, _2831, _2837);
        float _2841 = fma(_2835, _2835, _2839);
        float _2843 = -_2823;
        float _2845 = _2843 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2847 = rsqrt(_2841);
        float _2849 = _2845 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2851 = precise::clamp(_2849, 0.0, 1.0);
        float _2853 = abs(_2851);
        float _2855 = log2(_2853);
        float _2857 = _2827 * _2847;
        float _2859 = _2831 * _2847;
        float _2861 = _2835 * _2847;
        float _2863 = _2453 * _2857;
        float _2865 = fma((*spvDescriptorSet0.vp_c13)._m0[4].y, (*spvDescriptorSet0.vp_c13)._m0[4].y, 0.00999999977648258209228515625);
        float _2867 = precise::clamp(_2865, 0.0, 1.0);
        float _2869 = _2453 * _2817;
        float _2871 = fma(_2463, _2859, _2863);
        float _2873 = _2867 * _2867;
        float _2875 = _2855 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2877 = fma(_2463, _2819, _2869);
        float _2879 = fma(_2465, _2861, _2871);
        float _2881 = precise::clamp(_2879, 0.0, 1.0);
        float _2883 = _2873 + (-1.0);
        float _2885 = fma(_2465, _2821, _2877);
        float _2887 = precise::clamp(_2885, 0.0, 1.0);
        float _2889 = _2881 * _2881;
        float _2891 = _2819 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2893 = exp2(_2875);
        float _2895 = fma(_2889, _2883, 1.0);
        float _2897 = -_2817;
        float _2899 = -_2891;
        float _2901 = fma(_2897, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2899);
        float _2903 = _2895 * _2895;
        float _2905 = -_2821;
        float _2907 = fma(_2905, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2901);
        float _2909 = 1.0 / _2903;
        float _2911 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2913 = _2907 + _2911;
        float _2915 = _2913 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2917 = precise::clamp(_2915, 0.0, 1.0);
        float _2919 = _2893 * _2917;
        float _2921 = _2887 * _2919;
        float _2923 = _2873 * _2909;
        float _2925 = _2921 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2927 = _2921 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2929 = _2921 * _2923;
        float _2931 = _2921 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        float _2933 = _2929 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2935 = _2929 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2937 = _2929 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_89.x = _2925;
        out.m_89.y = _2927;
        out.m_89.z = _2931;
        out.m_91.x = _2933;
        out.m_91.y = _2935;
        out.m_91.z = _2937;
    }
    out.m_93.x = _2789;
    out.m_93.y = _2791;
    out.m_93.z = _2793;
    if (!_2775)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_51.x = 0.0;
    float _2939 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2939;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

