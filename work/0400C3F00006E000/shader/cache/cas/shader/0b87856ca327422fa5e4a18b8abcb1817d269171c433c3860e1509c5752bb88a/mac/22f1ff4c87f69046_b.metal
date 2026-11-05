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
    float4 m_79 [[user(locn0)]];
    float4 m_77 [[user(locn1)]];
    float4 m_99 [[user(locn2)]];
    float4 m_95 [[user(locn3)]];
    float4 m_97 [[user(locn4)]];
    float4 m_89 [[user(locn5)]];
    float4 m_101 [[user(locn6)]];
    float4 m_87 [[user(locn7)]];
    float4 m_85 [[user(locn8)]];
    float4 m_93 [[user(locn10)]];
    float4 m_91 [[user(locn11)]];
    float4 m_63 [[user(locn12)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
    float4 dm_pad9 [[user(locn9)]];
};

struct main0_in
{
    float4 m_69 [[attribute(1)]];
    float4 m_67 [[attribute(2)]];
    float4 m_71 [[attribute(3)]];
    float4 m_81 [[attribute(4)]];
    float4 m_60 [[attribute(5)]];
    float4 m_65 [[attribute(6)]];
    float4 m_73 [[attribute(9)]];
    float4 m_83 [[attribute(10)]];
    float4 m_75 [[attribute(12)]];
};

static inline __attribute__((always_inline))
int _116(thread const int& _8327, thread const int& _8328, constant _10& support_buffer)
{
    float _8331 = as_type<float>(support_buffer._m4);
    int _8333 = _8328 + as_type<int>(_8331);
    int _8335 = 1 + _8333;
    float _8337 = support_buffer._m5[_8335].x;
    float _8339 = abs(_8337);
    bool _8341 = _8339 == 1.0;
    if (_8341)
    {
        return _8327;
    }
    float _8343 = float(_8327);
    float _8345 = _8343 / _8339;
    int _8347 = int(_8345);
    return _8347;
}

static inline __attribute__((always_inline))
int _117(thread const int& _8377, thread const int& _8378, constant _10& support_buffer)
{
    float _8381 = as_type<float>(support_buffer._m4);
    int _8383 = _8378 + as_type<int>(_8381);
    int _8385 = 1 + _8383;
    float _8387 = support_buffer._m5[_8385].x;
    bool _8389 = _8387 == 1.0;
    if (_8389)
    {
        return _8377;
    }
    float _8391 = float(_8377);
    float _8393 = _8391 * _8387;
    int _8395 = int(_8393);
    return _8395;
}

static inline __attribute__((always_inline))
void _114(thread const int& _8011, thread const int& _8012, thread const int& _8013, thread const int& _8014, thread const int& _8015, thread int& _8016, thread int& _8017, thread int& _8018, thread int& _8019, thread int& _8020, thread int& _8021, thread int& _8022, thread float4& gl_Position, thread float& gl_PointSize)
{
    gl_PointSize = 1.0;
    int _8025 = _8015;
    int _8027 = _8012;
    int _8029 = _8013;
    float _8031 = 0.0 + as_type<float>(_8011);
    bool _8033 = _8031 != 0.0;
    bool _8035 = isnan(_8031);
    bool _8037 = _8033 || _8035;
    bool _8039 = isnan(0.0);
    bool _8041 = _8037 || _8039;
    int _8043 = as_type<int>(_8031);
    int _8045 = _8041 ? (-1) : 0;
    if (!_8041)
    {
        float _8047 = as_type<float>(_8011) * 1.0;
        _8025 = as_type<int>(_8047);
    }
    int _8049 = _8025;
    bool _8051 = !_8041;
    int _8053 = _8049;
    int _8055 = _8049;
    if (!_8051)
    {
        bool _8057 = _8031 >= 0.0;
        bool _8059 = isnan(_8031);
        bool _8061 = _8057 || _8059;
        bool _8063 = isnan(0.0);
        bool _8065 = _8061 || _8063;
        _8045 = _8065 ? (-1) : 0;
        if (!_8065)
        {
            _8053 = 2147483647;
        }
        int _8067 = _8053;
        bool _8069 = !_8065;
        int _8071 = _8067;
        _8055 = _8067;
        if (!_8069)
        {
            float _8073 = abs(as_type<float>(_8011));
            float _8075 = 0.0 + _8073;
            bool _8077 = _8075 > as_type<float>(0x7f800000u /* inf */);
            bool _8079 = isnan(_8075);
            bool _8081 = _8077 || _8079;
            bool _8083 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _8085 = _8081 || _8083;
            _8043 = as_type<int>(_8075);
            _8045 = _8085 ? (-1) : 0;
            if (_8085)
            {
                float _8087 = as_type<float>(_8011) + 1.0;
                _8071 = as_type<int>(_8087);
            }
            int _8089 = _8071;
            int _8091 = _8089;
            _8055 = _8089;
            if (!_8085)
            {
                bool _8093 = _8075 != as_type<float>(0x7f800000u /* inf */);
                bool _8095 = isnan(_8075);
                bool _8097 = _8093 || _8095;
                bool _8099 = isnan(as_type<float>(0x7f800000u /* inf */));
                bool _8101 = _8097 || _8099;
                _8045 = _8101 ? (-1) : 0;
                if (!_8101)
                {
                    _8091 = _8011;
                }
                int _8103 = _8091;
                bool _8105 = !_8101;
                _8055 = _8103;
                if (!_8105)
                {
                    float _8107 = as_type<float>(_8011) * 18446744073709551616.0;
                    float _8109 = rsqrt(_8107);
                    float _8111 = _8107 * _8109;
                    float _8113 = _8109 * 0.5;
                    float _8115 = -_8111;
                    float _8117 = 0.0 + _8115;
                    float _8119 = fma(_8113, _8117, 0.5);
                    float _8121 = fma(_8111, _8119, _8111);
                    float _8123 = -_8121;
                    float _8125 = 0.0 + _8123;
                    float _8127 = fma(_8121, _8125, _8107);
                    float _8129 = fma(_8113, _8127, _8121);
                    float _8131 = _8129 * 2.3283064365386962890625e-10;
                    _8043 = as_type<int>(_8129);
                    _8027 = as_type<int>(_8117);
                    _8029 = as_type<int>(_8121);
                    _8055 = as_type<int>(_8131);
                }
            }
        }
    }
    int _8133 = _8043;
    int _8135 = _8027;
    int _8137 = _8029;
    int _8139 = _8055;
    int _8141 = _8045;
    _8016 = _8014;
    _8017 = 0;
    _8018 = _8133;
    _8019 = _8135;
    _8020 = _8137;
    _8021 = _8139;
    _8022 = _8141;
}

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.dm_pad9 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2963 = false;
    bool _1777 = false;
    bool _1045 = false;
    bool _853 = false;
    bool _359 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _121 = in.m_60.w;
    float _123 = trunc(_121);
    int _125 = int(_123);
    bool _129 = _125 >= 1;
    float _131 = 0.0;
    if (!_129)
    {
        _131 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _133 = _131;
    float _135 = _133;
    if (!_129)
    {
        out.m_63.x = 0.0;
    }
    int _137 = 0;
    if (!_129)
    {
        float _139 = _133 * 5.0;
        _137 = as_type<int>(_139);
    }
    int _141 = _137;
    int _143 = _141;
    if (!_129)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3262 = as_type<float>(_141);
        out.gl_Position.z = _3262;
    }
    if (!_129)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _145 = in.m_65.w;
    bool _147 = _145 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _149 = isnan(_145);
    bool _151 = _147 || _149;
    bool _153 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _155 = _151 || _153;
    float _157 = -_145;
    float _159 = _157 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _161 = 0.0;
    float _163 = _159;
    if (_155)
    {
        float _165 = float(_125);
        _161 = _165;
    }
    float _167 = _161;
    bool _169 = _159 >= _167;
    bool _171 = !_155;
    bool _173 = _169 || _171;
    if (_173)
    {
        _135 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _175 = _135;
    if (_173)
    {
        out.m_63.x = 0.0;
    }
    if (_173)
    {
        float _177 = _175 * 5.0;
        _143 = as_type<int>(_177);
    }
    int _179 = _143;
    if (_173)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3331 = as_type<float>(_179);
        out.gl_Position.z = _3331;
    }
    if (_173)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _181 = in.m_67.x;
    float _183 = in.m_67.y;
    float _185 = in.m_67.z;
    float _187 = in.m_69.x;
    float _189 = in.m_69.y;
    float _191 = in.m_69.z;
    float _193 = in.m_71.x;
    float _195 = in.m_71.y;
    float _197 = in.m_71.z;
    float _199 = _181 * _181;
    float _201 = _183 * _183;
    float _203 = _185 * _185;
    float _205 = fma(_187, _187, _199);
    float _207 = fma(_189, _189, _201);
    float _209 = fma(_191, _191, _203);
    float _211 = fma(_193, _193, _205);
    float _213 = fma(_195, _195, _207);
    float _215 = fma(_197, _197, _209);
    float _217 = sqrt(_211);
    float _219 = sqrt(_213);
    float _221 = sqrt(_215);
    bool _223 = _217 > 0.0;
    bool _225 = _219 > 0.0;
    float _227 = _219;
    float _229 = _217;
    float _231 = _211;
    float _233 = _215;
    if (_223)
    {
        float _235 = rsqrt(_211);
        _227 = _235;
    }
    float _237 = _227;
    float _239 = 0.0;
    float _241 = 0.0;
    if (!_223)
    {
        _239 = 0.0;
        _241 = 0.0;
    }
    float _243 = _239;
    float _245 = _241;
    bool _247 = _221 > 0.0;
    float _249 = 0.0;
    float _251 = _245;
    float _253 = _243;
    if (!_223)
    {
        _249 = 0.0;
    }
    float _255 = _249;
    float _257 = 0.0;
    float _259 = _255;
    if (!_225)
    {
        _257 = 0.0;
    }
    float _261 = _257;
    float _263 = 0.0;
    float _265 = _261;
    if (_225)
    {
        float _267 = rsqrt(_213);
        _263 = _267;
    }
    float _269 = _263;
    float _271 = 0.0;
    if (!_225)
    {
        _271 = 0.0;
    }
    float _273 = _271;
    float _275 = _273;
    if (!_225)
    {
        _229 = 0.0;
    }
    float _277 = _229;
    float _279 = _277;
    if (!_247)
    {
        _231 = 0.0;
    }
    float _281 = _231;
    float _283 = _221;
    float _285 = _281;
    if (_247)
    {
        float _287 = rsqrt(_215);
        _283 = _287;
    }
    float _289 = _283;
    float _291 = _237;
    if (_223)
    {
        float _293 = _237 * _187;
        _259 = _293;
    }
    float _295 = _259;
    if (_223)
    {
        float _297 = _237 * _181;
        _251 = _297;
    }
    float _299 = _251;
    if (_223)
    {
        float _301 = _237 * _193;
        _253 = _301;
    }
    float _303 = _253;
    bool _305 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    if (!_247)
    {
        _291 = 0.0;
    }
    float _307 = _291;
    float _309 = _307;
    if (_225)
    {
        float _311 = _269 * _189;
        _265 = _311;
    }
    float _313 = _265;
    if (!_247)
    {
        _233 = 0.0;
    }
    float _315 = _233;
    float _317 = _315;
    if (_225)
    {
        float _319 = _269 * _183;
        _275 = _319;
    }
    float _321 = _275;
    if (_225)
    {
        float _323 = _269 * _195;
        _279 = _323;
    }
    float _325 = _279;
    if (_247)
    {
        float _327 = _289 * _191;
        _317 = _327;
    }
    float _329 = _317;
    if (_247)
    {
        float _331 = _289 * _185;
        _309 = _331;
    }
    float _333 = _309;
    if (_247)
    {
        float _335 = _289 * _197;
        _285 = _335;
    }
    float _337 = _285;
    bool _339 = !_305;
    float _357;
    if (!_339)
    {
        float _341 = in.m_73.x;
        float _343 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _345 = _341 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _347 = fma(_345, (*spvDescriptorSet0.vp_c9)._m0[12].x, _159);
        float _349 = _347 * _343;
        float _351 = floor(_349);
        float _353 = -_351;
        float _355 = _349 + _353;
        _357 = _355;
        _359 = true;
    }
    else
    {
        float _361 = float(_125);
        float _363 = 1.0 / _361;
        float _365 = _159 * _363;
        _357 = _365;
    }
    _359 = false;
    float _367 = _357;
    int _369 = int2(spvDescriptorSet0.vp_t_tcb_C.get_width(), spvDescriptorSet0.vp_t_tcb_C.get_height()).x;
    int _371 = _369;
    int _373 = 0;
    int _375 = _116(_371, _373, (*spvDescriptorSet0.support_buffer));
    float _377 = in.m_73.x;
    float _379 = in.m_73.y;
    float _381 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[191].y;
    float _383 = in.m_75.z;
    float _385 = -_381;
    float _387 = _385 + (*spvDescriptorSet0.vp_c9)._m0[191].y;
    float _389 = fma((*spvDescriptorSet0.vp_c10)._m0[2].x, 0.0166666693985462188720703125, _377);
    float _391 = fma(_387, _379, _381);
    float _393 = _389 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _395 = trunc(_383);
    int _397 = int(_395);
    float _399 = _393 * _391;
    float _401 = float(_375);
    int _403 = abs(_375);
    bool _405 = _375 == 0;
    float _407 = _399 * _401;
    float _409 = float(uint(_403));
    float _411 = trunc(_407);
    int _413 = int(_411);
    float _415 = 1.0 / _409;
    int _417 = abs(_413);
    uint _420 = uint(int(uint(_413) >> uint(31)));
    float _422 = float(uint(_417));
    int _424 = ~int(_420);
    int _426 = _424 + 1;
    int _428 = as_type<int>(_415) + (-2);
    float _430 = as_type<float>(_428) * _422;
    float _432 = trunc(_430);
    float _434 = precise::max(_432, 0.0);
    uint _436 = uint(_434);
    int _438 = ~int(_436);
    int _440 = _438 + 1;
    int _442 = _440 * _403;
    int _444 = _442 + _417;
    float _446 = float(uint(_444));
    float _448 = as_type<float>(_428) * _446;
    float _450 = trunc(_448);
    float _452 = precise::max(_450, 0.0);
    uint _454 = uint(_452);
    int _456 = int(_436) + int(_454);
    int _458 = ~_456;
    int _460 = _458 + 1;
    int _462 = _460 * _403;
    int _464 = _462 + _417;
    bool _466 = uint(_464) >= uint(_403);
    bool _468 = !_466;
    int _470 = _468 ? 0 : (-1);
    int _472 = ~_456;
    int _474 = _472 + _470;
    int _476 = _474 + 1;
    int _478 = _476 * _403;
    int _480 = _478 + _417;
    int _482 = _480 ^ _426;
    int _484 = ~_426;
    int _486 = _484 + _482;
    int _488 = _486 + 1;
    bool _490 = !_405;
    int _492 = _490 ? _488 : (-1);
    int _494 = _492;
    int _496 = 0;
    int _498 = _117(_494, _496, (*spvDescriptorSet0.support_buffer));
    int _500 = _397;
    int _502 = 0;
    int _504 = _117(_500, _502, (*spvDescriptorSet0.support_buffer));
    float4 _507 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_498, _504)), 0).xyzw;
    float _509 = _507.x;
    float _511 = _507.y;
    float _513 = _507.z;
    float _515 = _507.w;
    float _517 = in.m_75.x;
    int _519 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _521 = _519 != 0;
    int _523 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _525 = _523 != 0;
    float _527 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _529 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _527;
    float _531 = 1.0 / _529;
    float _533 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    bool _535 = _367 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _537 = isnan(_367);
    bool _539 = _535 || _537;
    bool _541 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _543 = _539 || _541;
    float _545 = float(_543);
    float _547 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    bool _549 = _379 > 0.5;
    bool _551 = _549 && _525;
    float _553 = 0.0;
    float _555 = _517;
    if (_521)
    {
        float _557 = in.m_73.x;
        _553 = _557;
    }
    float _559 = _553;
    float _561 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _563 = _533 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _565 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _567 = _367 + _565;
    float _569 = _547 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _571 = _561 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _573 = _567 * _531;
    bool _575 = _367 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _577 = isnan(_367);
    bool _579 = _575 || _577;
    bool _581 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _583 = _579 || _581;
    float _585 = float(_583);
    float _587 = -_545;
    float _589 = _587 + 1.0;
    out.m_77.x = _563;
    out.m_77.y = _569;
    out.m_77.z = _571;
    float _591 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _593 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _591;
    int _595 = _492 + 1;
    float _597 = _585 * _589;
    float _599 = -_585;
    float _601 = _599 + 1.0;
    float _603 = fma(_593, _573, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _605 = _603 * _597;
    float _607 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    bool _609 = _559 > 0.5;
    bool _611 = _609 && _521;
    float _613 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _615 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _613;
    float _617 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _619 = _571;
    if (_521)
    {
        _619 = _517;
    }
    float _621 = _619;
    float _623 = fma(_615, _573, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _625 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _627 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _625;
    float _629 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _631 = _607 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _633 = fma(_627, _573, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    int _635 = abs(_595);
    float _637 = _621;
    if (_611)
    {
        float _639 = -_621;
        float _641 = _639 + 1.0;
        _637 = _641;
    }
    float _643 = _637;
    uint _645 = uint(int(uint(_595) >> uint(31)));
    float _647 = _633 * _597;
    float _649 = _623 * _597;
    float _651 = fma(_601, (*spvDescriptorSet0.vp_c9)._m0[143].x, _605);
    if (_521)
    {
        _555 = _643;
    }
    float _653 = _555;
    float _655 = fma(_601, (*spvDescriptorSet0.vp_c9)._m0[143].y, _647);
    float _657 = float(uint(_635));
    float _659 = fma(_545, (*spvDescriptorSet0.vp_c9)._m0[144].x, _651);
    float _661 = fma(_601, (*spvDescriptorSet0.vp_c9)._m0[143].z, _649);
    int _663 = ~int(_645);
    int _665 = _663 + 1;
    float _667 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _669 = as_type<float>(_428) * _657;
    float _671 = _617 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _673 = _629 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _675 = _653 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _677 = fma(_545, (*spvDescriptorSet0.vp_c9)._m0[144].y, _655);
    float _679 = fma(_545, (*spvDescriptorSet0.vp_c9)._m0[144].z, _661);
    float _681 = trunc(_669);
    float _683 = precise::max(_681, 0.0);
    uint _685 = uint(_683);
    out.m_79.x = _631;
    out.m_79.y = _671;
    out.m_79.z = _673;
    out.m_79.w = _667;
    int _687 = ~int(_685);
    int _689 = _687 + 1;
    int _691 = _689 * _403;
    int _693 = _691 + _635;
    float _695 = float(uint(_693));
    float _697 = as_type<float>(_428) * _695;
    float _699 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _701 = trunc(_697);
    float _703 = precise::max(_701, 0.0);
    uint _705 = uint(_703);
    int _707 = int(_685) + int(_705);
    int _709 = ~_707;
    int _711 = _709 + 1;
    int _713 = _711 * _403;
    int _715 = _713 + _635;
    bool _717 = uint(_715) >= uint(_403);
    bool _719 = !_717;
    int _721 = _719 ? 0 : (-1);
    int _723 = ~_707;
    int _725 = _723 + _721;
    int _727 = _725 + 1;
    int _729 = _727 * _403;
    int _731 = _729 + _635;
    float _733 = in.m_75.y;
    float _735 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _737 = _731 ^ _665;
    int _739 = ~_665;
    int _741 = _739 + _737;
    int _743 = _741 + 1;
    bool _745 = !_405;
    int _747 = _745 ? _743 : (-1);
    float _749 = _675 * _735;
    float _751 = _733;
    if (_551)
    {
        float _753 = -_733;
        float _755 = _753 + 1.0;
        _751 = _755;
    }
    float _757 = _751;
    float _759 = _757 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _761 = _759 * _699;
    uint _763 = as_type<uint>(half2(float2(_515, 0.0)));
    uint _765 = extract_bits(_763, 0u, 8u);
    int _767 = int(_765) & 255;
    uint _769 = extract_bits(_763, 8u, 8u);
    int _771 = int(_769) & 255;
    int _773 = _771 << 8;
    int _775 = _767 | _773;
    bool _777 = _775 >= 32768;
    int _779 = _775 + (-1024);
    int _781 = _779;
    float _783 = _761;
    if (_777)
    {
        int _785 = ~_775;
        int _787 = _785 + 33792;
        int _789 = _787 + 1;
        _781 = _789;
    }
    int _791 = _781;
    int _793 = _791 + 30719;
    float _795 = float(_793);
    float _797 = fma(_795, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _799 = abs(_797);
    float _801 = -_799;
    float _803 = _801 + 1.0;
    float _805 = abs(_797);
    float _807 = fma(_805, -0.0187292993068695068359375, 0.074261002242565155029296875);
    int _809 = as_type<int>(_803) + (-218103808);
    float _811 = abs(_797);
    float _813 = fma(_811, _807, -0.212114393711090087890625);
    bool _815 = uint(_809) >= 1920991232u;
    float _817 = abs(_797);
    float _819 = fma(_817, _813, 1.570728778839111328125);
    bool _821 = _797 < 0.0;
    float _823 = float(_821);
    bool _825 = !_815;
    float _851;
    if (!_825)
    {
        int _827 = as_type<int>(_803);
        int _829 = as_type<int>(_803);
        int _831 = _665;
        int _833 = 3616;
        int _835 = 0;
        int _837;
        int _839;
        int _841;
        int _843;
        int _845;
        int _847;
        int _849;
        _114(_827, _829, _831, _833, _835, _837, _839, _841, _843, _845, _847, _849, out.gl_Position, out.gl_PointSize);
        _851 = as_type<float>(_847);
        _853 = true;
    }
    else
    {
        float _855 = rsqrt(_803);
        float _857 = _803 * _855;
        float _859 = _855 * 0.5;
        float _861 = -_857;
        float _863 = 0.0 + _861;
        float _865 = fma(_859, _863, 0.5);
        float _867 = fma(_857, _865, _857);
        float _869 = -_867;
        float _871 = 0.0 + _869;
        float _873 = fma(_867, _871, _803);
        float _875 = fma(_859, _873, _867);
        _851 = _875;
    }
    _853 = false;
    float _877 = _851;
    int _879 = _747;
    int _881 = 0;
    int _883 = _117(_879, _881, (*spvDescriptorSet0.support_buffer));
    int _885 = _397;
    int _887 = 0;
    int _889 = _117(_885, _887, (*spvDescriptorSet0.support_buffer));
    float4 _891 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_883, _889)), 0).xyzw;
    float _893 = _891.x;
    float _895 = _891.y;
    float _897 = _891.z;
    float _899 = _891.w;
    float _901 = _819 * _877;
    float _903 = _823 * 2.0;
    float _905 = _795 * 3.883221149444580078125;
    float _907 = floor(_407);
    float _909 = -_903;
    float _911 = fma(_901, _909, _901);
    float _913 = _905 * 0.15915493667125701904296875;
    float _915 = fma(_823, 3.1415927410125732421875, _911);
    float _917 = _913 * 6.283185482025146484375;
    float _919 = cos(_917);
    float _921 = _915 * 0.15915493667125701904296875;
    float _923 = _921 * 6.283185482025146484375;
    float _925 = sin(_923);
    float _927 = -_907;
    float _929 = _407 + _927;
    float _931 = _925 * _919;
    float _933 = _913 * 6.283185482025146484375;
    float _935 = sin(_933);
    float _937 = _925 * _935;
    uint _939 = as_type<uint>(half2(float2(_899, 0.0)));
    float _941 = -_509;
    float _943 = _941 + _893;
    float _945 = -_513;
    float _947 = _945 + _897;
    uint _949 = extract_bits(_939, 0u, 8u);
    int _951 = int(_949) & 255;
    uint _953 = extract_bits(_939, 8u, 8u);
    int _955 = int(_953) & 255;
    int _957 = _955 << 8;
    int _959 = _951 | _957;
    float _961 = fma(_929, _943, _509);
    float _963 = fma(_929, _947, _513);
    bool _965 = _959 >= 32768;
    int _967 = _959 + (-1024);
    int _969 = _967;
    if (_965)
    {
        int _971 = ~_959;
        int _973 = _971 + 33792;
        int _975 = _973 + 1;
        _969 = _975;
    }
    int _977 = _969;
    int _979 = _977 + 30719;
    float _981 = float(_979);
    float _983 = fma(_981, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _985 = abs(_983);
    float _987 = -_985;
    float _989 = _987 + 1.0;
    bool _991 = _983 < 0.0;
    float _993 = float(_991);
    float _995 = abs(_983);
    float _997 = fma(_995, -0.0187292993068695068359375, 0.074261002242565155029296875);
    int _999 = as_type<int>(_989) + (-218103808);
    float _1001 = abs(_983);
    float _1003 = fma(_1001, _997, -0.212114393711090087890625);
    bool _1005 = uint(_999) >= 1920991232u;
    float _1007 = -_511;
    float _1009 = _1007 + _895;
    float _1011 = abs(_983);
    float _1013 = fma(_1011, _1003, 1.570728778839111328125);
    float _1015 = fma(_929, _1009, _511);
    bool _1017 = !_1005;
    float _1043;
    if (!_1017)
    {
        int _1019 = as_type<int>(_989);
        int _1021 = as_type<int>(_921);
        int _1023 = as_type<int>(_907);
        int _1025 = 4512;
        int _1027 = as_type<int>(_901);
        int _1029;
        int _1031;
        int _1033;
        int _1035;
        int _1037;
        int _1039;
        int _1041;
        _114(_1019, _1021, _1023, _1025, _1027, _1029, _1031, _1033, _1035, _1037, _1039, _1041, out.gl_Position, out.gl_PointSize);
        _1043 = as_type<float>(_1039);
        _1045 = true;
    }
    else
    {
        float _1047 = rsqrt(_989);
        float _1049 = _989 * _1047;
        float _1051 = _1047 * 0.5;
        float _1053 = -_1049;
        float _1055 = 0.0 + _1053;
        float _1057 = fma(_1051, _1055, 0.5);
        float _1059 = fma(_1049, _1057, _1049);
        float _1061 = -_1059;
        float _1063 = 0.0 + _1061;
        float _1065 = fma(_1059, _1063, _989);
        float _1067 = fma(_1051, _1065, _1059);
        _1043 = _1067;
    }
    _1045 = false;
    float _1069 = _1043;
    float _1071 = in.m_73.x;
    float _1073 = in.m_73.y;
    float _1075 = in.m_73.z;
    float _1077 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1079 = log2(_1077);
    float _1081 = _1013 * _1069;
    float _1083 = _981 * 3.883221149444580078125;
    float _1085 = -_797;
    float _1087 = _1085 + _983;
    float _1089 = _1079 * _159;
    float _1091 = exp2(_1089);
    float _1093 = _1075 * 2.0;
    float _1095 = _1071 * 2.0;
    float _1097 = _1073 * 2.0;
    float _1099 = floor(_1093);
    float _1101 = floor(_1095);
    float _1103 = -_1091;
    float _1105 = _1103 + 1.0;
    float _1107 = floor(_1097);
    bool _1109 = _1099 > 0.0;
    bool _1111 = _1099 >= 0.0;
    bool _1113 = isnan(_1099);
    bool _1115 = _1111 || _1113;
    bool _1117 = isnan(0.0);
    bool _1119 = _1115 || _1117;
    int _1121 = _1119 ? 0 : 1;
    int _1123 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1125 = _1123 != 0;
    int _1127 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1129 = _1127 != 0;
    int _1131 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1133 = _1131 != 0;
    int _1135 = ~_1121;
    int _1137 = _1135 + 1;
    int _1139 = _1137 + 1;
    bool _1141 = _1101 > 0.0;
    int _1143 = _1139;
    if (!_1109)
    {
        int _1145 = ~_1121;
        int _1147 = _1145 + 1;
        _1143 = _1147;
    }
    int _1149 = _1143;
    float _1151 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1153 = 1.0 + _1151;
    bool _1155 = _1101 >= 0.0;
    bool _1157 = isnan(_1101);
    bool _1159 = _1155 || _1157;
    bool _1161 = isnan(0.0);
    bool _1163 = _1159 || _1161;
    bool _1165 = _1107 > 0.0;
    float _1167 = 1.0 / _1153;
    bool _1169 = _1107 >= 0.0;
    bool _1171 = isnan(_1107);
    bool _1173 = _1169 || _1171;
    bool _1175 = isnan(0.0);
    bool _1177 = _1173 || _1175;
    float _1179 = in.m_81.x;
    float _1181 = in.m_81.y;
    float _1183 = in.m_81.z;
    bool _1185 = !_1125;
    int _1187 = _1185 ? 0 : 1;
    int _1189 = _1163 ? 0 : 1;
    bool _1191 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1193 = isnan(1.0);
    bool _1195 = _1191 || _1193;
    bool _1197 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1199 = _1195 || _1197;
    int _1201 = abs(_1187);
    float _1203 = _1073 + _1071;
    bool _1205 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1207 = isnan(0.0);
    bool _1209 = _1205 || _1207;
    bool _1211 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1213 = _1209 || _1211;
    float _1215 = float(_1201);
    float _1217 = _1203 + (-1.0);
    float _1219 = float(_1149);
    float _1221 = _1213 ? _1105 : 0.0;
    float _1223 = fma(_1217, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _1225 = _1177 ? 0 : 1;
    float _1227 = _1215 * _1219;
    float _1229 = _1071 + (-0.5);
    if (_1199)
    {
        float _1231 = _1221 * _1167;
        _163 = _1231;
    }
    float _1233 = _163;
    int _1235 = ~_1225;
    int _1237 = _1235 + 1;
    int _1239 = _1237 + 1;
    float _1241 = _1227 * (-2.0);
    bool _1243 = !_1133;
    int _1245 = _1243 ? 0 : 1;
    float _1247 = _1075 + _1071;
    bool _1249 = !_1129;
    int _1251 = _1249 ? 0 : 1;
    float _1253 = fma(_1241, _1179, _1179);
    int _1255 = abs(_1245);
    float _1257 = fma(_1223, _1241, _1223);
    int _1259 = _1239;
    if (!_1165)
    {
        int _1261 = ~_1225;
        int _1263 = _1261 + 1;
        _1259 = _1263;
    }
    int _1265 = _1259;
    float _1267 = fma(_1229, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1253);
    float _1269 = _1247 + (-1.0);
    int _1271 = abs(_1251);
    float _1273 = fma(_1257, _1233, _1267);
    float _1275 = float(_1255);
    float _1277 = float(_1265);
    float _1279 = _1273 * 0.15915493667125701904296875;
    int _1281 = ~_1189;
    int _1283 = _1281 + 1;
    int _1285 = _1283 + 1;
    float _1287 = _1275 * _1277;
    int _1289 = _1285;
    if (!_1141)
    {
        int _1291 = ~_1189;
        int _1293 = _1291 + 1;
        _1289 = _1293;
    }
    int _1295 = _1289;
    float _1297 = fma(_1269, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1299 = float(_1271);
    float _1301 = _1287 * (-2.0);
    float _1303 = float(_1295);
    float _1305 = _1075 + (-0.5);
    float _1307 = _1075 + _1073;
    float _1309 = fma(_1301, _1183, _1183);
    float _1311 = fma(_1297, _1301, _1297);
    float _1313 = _1299 * _1303;
    float _1315 = _1307 + (-1.0);
    float _1317 = fma(_1305, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1309);
    float _1319 = in.m_60.x;
    float _1321 = in.m_60.y;
    float _1323 = in.m_60.z;
    float _1325 = _1313 * (-2.0);
    float _1327 = _1073 + (-0.5);
    float _1329 = fma(_1311, _1233, _1317);
    float _1331 = in.m_69.x;
    float _1333 = in.m_69.y;
    float _1335 = in.m_69.z;
    float _1337 = fma(_1315, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1339 = _1279 * 6.283185482025146484375;
    float _1341 = sin(_1339);
    float _1343 = _1329 * 0.15915493667125701904296875;
    float _1345 = in.m_83.x;
    float _1347 = in.m_83.y;
    float _1349 = in.m_83.z;
    float _1351 = fma(_1325, _1181, _1181);
    float _1353 = fma(_1337, _1325, _1337);
    float _1355 = _993 * 2.0;
    float _1357 = in.m_71.x;
    float _1359 = in.m_71.y;
    float _1361 = in.m_71.z;
    float _1363 = fma(_1327, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1351);
    float _1365 = _1279 * 6.283185482025146484375;
    float _1367 = cos(_1365);
    float _1369 = -_1355;
    float _1371 = fma(_1081, _1369, _1081);
    bool _1373 = _1015 != 0.0;
    bool _1375 = isnan(_1015);
    bool _1377 = _1373 || _1375;
    bool _1379 = isnan(0.0);
    bool _1381 = _1377 || _1379;
    float _1383 = fma(_1353, _1233, _1363);
    float _1385 = fma(_993, 3.1415927410125732421875, _1371);
    bool _1387 = _961 == 0.0;
    bool _1389 = !_1381;
    bool _1391 = _1387 && _1389;
    float _1393 = _1383 * 0.15915493667125701904296875;
    float _1395 = _1343 * 6.283185482025146484375;
    float _1397 = sin(_1395);
    float _1399 = _1385 * 0.15915493667125701904296875;
    bool _1401 = _963 == 0.0;
    bool _1403 = _1401 && _1391;
    float _1405 = _1333 * _1321;
    float _1407 = _1393 * 6.283185482025146484375;
    float _1409 = cos(_1407);
    float _1411 = _677 * _1347;
    float _1413 = _679 * _1349;
    float _1415 = fma(_1331, _1319, _1405);
    float _1417 = _659 * _1345;
    float _1419 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1015);
    float _1421 = _1411 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1423 = _1343 * 6.283185482025146484375;
    float _1425 = cos(_1423);
    float _1427 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _963);
    float _1429 = _1413 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1431 = _1359 * _1321;
    float _1433 = fma(_1335, _1323, _1415);
    float _1435 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _961);
    float _1437 = _1417 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1439 = _1421 * _1419;
    float _1441 = _1393 * 6.283185482025146484375;
    float _1443 = sin(_1441);
    float _1445 = _1429 * _1427;
    float _1447 = fma(_1357, _1319, _1431);
    float _1449 = _1367 * _1397;
    float _1451 = _1341 * _1397;
    float _1453 = _1409 * _1397;
    float _1455 = _1437 * _1435;
    float _1457 = fma(_1361, _1323, _1447);
    float _1459 = _1367 * _1425;
    float _1461 = _1341 * _1425;
    float _1463 = _1341 * _1409;
    float _1465 = _1409 * _1425;
    float _1467 = _1367 * _1409;
    float _1469 = _1433 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1471 = _1399 * 6.283185482025146484375;
    float _1473 = sin(_1471);
    float _1475 = fma(_1443, _1451, _1459);
    float _1477 = -_1449;
    float _1479 = fma(_1443, _1461, _1477);
    float _1481 = -_1461;
    float _1483 = fma(_1443, _1449, _1481);
    float _1485 = _1463 * _1439;
    float _1487 = _1475 * _1439;
    float _1489 = _1479 * _1439;
    float _1491 = fma(_1443, _1459, _1451);
    float _1493 = -_1443;
    float _1495 = fma(_1493, _1455, _1485);
    float _1497 = fma(_1453, _1455, _1487);
    float _1499 = fma(_1465, _1455, _1489);
    float _1501 = fma(_1467, _1445, _1495);
    float _1503 = fma(_1483, _1445, _1497);
    float _1505 = fma(_1491, _1445, _1499);
    float _1507 = _1083 * 0.15915493667125701904296875;
    float _1509 = in.m_67.x;
    float _1511 = in.m_67.y;
    float _1513 = in.m_67.z;
    float _1515 = _1503 * _313;
    float _1517 = _1503 * _325;
    float _1519 = _1507 * 6.283185482025146484375;
    float _1521 = cos(_1519);
    float _1523 = _1503 * _321;
    float _1525 = fma(_1505, _295, _1515);
    float _1527 = fma(_1505, _303, _1517);
    float _1529 = _1457 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1531 = fma(_1505, _299, _1523);
    float _1533 = fma(_1501, _329, _1525);
    float _1535 = fma(_1501, _337, _1527);
    float _1537 = _1507 * 6.283185482025146484375;
    float _1539 = sin(_1537);
    float _1541 = fma(_1501, _333, _1531);
    float _1543 = _1469 + _1533;
    float _1545 = _1529 + _1535;
    float _1547 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1549 = _1543 + _1547;
    float _1551 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1553 = _1545 + _1551;
    float _1555 = -_931;
    float _1557 = fma(_1473, _1521, _1555);
    float _1559 = _1549 * _1549;
    float _1561 = _1553 * _1553;
    float _1563 = _1511 * _1321;
    float _1565 = _1559 + _1561;
    float _1567 = -_937;
    float _1569 = fma(_1473, _1539, _1567);
    float _1571 = fma(_1509, _1319, _1563);
    float _1573 = fma(_929, _1087, _797);
    float _1575 = sqrt(_1565);
    float _1577 = fma(_929, _1557, _931);
    float _1579 = fma(_1513, _1323, _1571);
    float _1581 = _1573;
    float _1583 = _1577;
    float _1585 = _1559;
    float _1587 = _1561;
    float _1589 = _1543;
    float _1591 = _1545;
    int _1593 = as_type<int>(_1439);
    int _1595 = as_type<int>(_1523);
    float _1597 = _1529;
    if (!_1403)
    {
        float _1599 = fma(_1015, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1573);
        _1581 = _1599;
    }
    float _1601 = _1581;
    float _1603 = fma(_929, _1569, _937);
    float _1605 = _1603;
    float _1607 = _1601;
    if (!_1403)
    {
        float _1609 = fma(_961, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1577);
        _1583 = _1609;
    }
    float _1611 = _1583;
    float _1613 = _1579 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1615 = _1463 * _1601;
    float _1617 = _1479 * _1601;
    float _1619 = _1475 * _1601;
    float _1621 = _1613 + _1541;
    if (!_1403)
    {
        float _1623 = fma(_963, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1603);
        _1605 = _1623;
    }
    float _1625 = _1605;
    bool _1627 = _1575 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    if (!_1627)
    {
        _1607 = _1621;
    }
    float _1629 = _1607;
    bool _1631 = !_1627;
    float _1633 = _1629;
    if (!_1631)
    {
        float _1635 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1637 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1639 = _1575 + _1637;
        float _1641 = rsqrt(_1565);
        float _1643 = _1639 * _1635;
        float _1645 = _1621 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1647 = _1643 * 0.15915493667125701904296875;
        float _1649 = _1647 * 6.283185482025146484375;
        float _1651 = sin(_1649);
        float _1653 = _1647 * 6.283185482025146484375;
        float _1655 = cos(_1653);
        float _1657 = fma(_1651, _1645, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1659 = _1641 * _1657;
        float _1661 = _1655 + (-1.0);
        float _1663 = _1549 * _1659;
        float _1665 = _1553 * _1659;
        float _1667 = _1661 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1669 = _1663 + (*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1671 = _1663 * _1663;
        float _1673 = _1665 + (*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1675 = fma(_1621, _1655, _1667);
        float _1677 = _1665 * _1665;
        _1633 = _1675;
        _1585 = _1671;
        _1587 = _1677;
        _1589 = _1669;
        _1591 = _1673;
    }
    float _1679 = _1633;
    float _1681 = _1585;
    float _1683 = _1587;
    float _1685 = _1589;
    float _1687 = _1591;
    float _1689 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1691 = _1679 + _1689;
    float _1693 = fma(_1453, _1611, _1619);
    float _1695 = fma(_1465, _1611, _1617);
    float _1697 = -_1443;
    float _1699 = fma(_1697, _1611, _1615);
    float _1701 = fma(_1691, _1691, _1681);
    float _1703 = fma(_1483, _1625, _1693);
    float _1705 = fma(_1491, _1625, _1695);
    float _1707 = fma(_1467, _1625, _1699);
    float _1709 = _1701 + _1683;
    float _1711 = _1703 * _313;
    float _1713 = _1703 * _321;
    float _1715 = _1703 * _325;
    out.m_85.x = _749;
    out.m_85.y = _761;
    float _1717 = fma(_1705, _295, _1711);
    float _1719 = sqrt(_1709);
    float _1721 = fma(_1705, _299, _1713);
    float _1723 = fma(_1705, _303, _1715);
    float _1725 = fma(_1707, _329, _1717);
    float _1727 = fma(_1707, _333, _1721);
    float _1729 = fma(_1707, _337, _1723);
    out.m_87.x = _1725;
    out.m_87.y = _1727;
    out.m_87.z = _1729;
    bool _1731 = _1719 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1733 = isnan(_1719);
    bool _1735 = _1731 || _1733;
    bool _1737 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1739 = _1735 || _1737;
    float _1741 = _1721;
    if (!_1739)
    {
        _1741 = 1.0;
    }
    float _1743 = _1741;
    bool _1745 = !_1739;
    float _1747 = _1743;
    if (!_1745)
    {
        bool _1749 = _1719 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1751 = isnan(_1719);
        bool _1753 = _1749 || _1751;
        bool _1755 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1757 = _1753 || _1755;
        if (!_1757)
        {
            float _1759 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1761 = _1719 + _1759;
            float _1763 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1765 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1763;
            float _1767 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1769 = _1767 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1771 = 1.0 / _1765;
            float _1773 = _1761 * _1771;
            float _1775 = fma(_1773, _1769, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1747 = _1775;
            _1777 = true;
        }
        else
        {
            bool _1779 = _1719 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1781 = isnan(_1719);
            bool _1783 = _1779 || _1781;
            bool _1785 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1787 = _1783 || _1785;
            if (!_1787)
            {
                float _1789 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1791 = _1719 + _1789;
                float _1793 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1795 = _1793 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1797 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1799 = _1797 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1801 = 1.0 / _1795;
                float _1803 = _1791 * _1801;
                float _1805 = fma(_1803, _1799, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1747 = _1805;
                _1777 = true;
            }
            else
            {
                _1747 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1777 = false;
    float _1807 = _1747;
    float _1809 = _1613 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1811 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1813 = _1679 + _1811;
    float _1815 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1817 = _1685 + _1815;
    float _1819 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1821 = _1687 + _1819;
    float _1823 = fma(_1469, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1809);
    float _1825 = fma(_1813, _1807, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1827 = fma(_1817, _1807, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1829 = fma(_1821, _1807, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1831 = fma(_1529, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1823);
    float _1833 = _1613 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1835 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1837 = _1825 + _1835;
    float _1839 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1841 = _1827 + _1839;
    float _1843 = _1831 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1845 = fma(_1469, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1833);
    float _1847 = _1837 * _1837;
    float _1849 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1851 = _1829 + _1849;
    float _1853 = 1.0 / _1843;
    float _1855 = fma(_1529, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1845);
    float _1857 = fma(_1841, _1841, _1847);
    float _1859 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _1861 = _1855 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1863 = fma(_1851, _1851, _1857);
    float _1865 = _1613 + _1859;
    float _1867 = _1861 + _1843;
    float _1869 = rsqrt(_1863);
    float _1871 = _1865 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1873 = _1825 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1875 = _1867 * _1853;
    float _1877 = _1875 * 0.5;
    float _1879 = fma(_1469, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1871);
    float _1881 = sqrt(_1863);
    float _1883 = fma(_1827, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1873);
    float _1885 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1887 = fma(_1877, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1885);
    float _1889 = fma(_1529, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1879);
    float _1891 = fma(_1529, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1893 = fma(_1829, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1883);
    float _1895 = _1889 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _1897 = 1.0 / _1887;
    float _1899 = _1869 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1901 = _1893 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1903 = _1841 * _1899;
    float _1905 = _1851 * _1899;
    float _1907 = trunc(_1895);
    int _1909 = int(_1907);
    float _1911 = _1903 * _1903;
    float _1913 = _1905 * _1905;
    float _1915 = _1911 + _1913;
    float _1917 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1919 = _1897 * _1917;
    float _1921 = _1865 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1923 = sqrt(_1915);
    bool _1925 = _1919 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _1927 = fma(_1469, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1921);
    bool _1929 = _1919 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _1931 = fma(_1529, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1927);
    float _1933 = floor(_1891);
    float _1935 = _1931 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    bool _1937 = !_1925;
    int _1939 = _1937 ? 0 : 1;
    int _1941 = 2;
    int _1943 = as_type<int>(_1837);
    float _1945 = _1903;
    float _1947 = _1905;
    float _1949 = _1911;
    float _1951 = _1913;
    float _1953 = _1919;
    if (!_1925)
    {
        _1941 = 1;
    }
    int _1955 = _1941;
    float _1957 = trunc(_1935);
    int _1959 = int(_1957);
    int _1961 = _1955;
    if (!_1929)
    {
        _1961 = _1939;
    }
    int _1963 = _1961;
    bool _1965 = _1923 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1967 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1969 = _1923 + _1967;
    int _1971 = _1963 << 6;
    float _1973 = -_1933;
    float _1975 = _1891 + _1973;
    int _1977 = _1971 + 96;
    uint _1979 = uint(int(uint(_1977) >> uint(2)));
    uint _1981 = uint(int(uint(int(_1979)) >> uint(2)));
    int _1983 = int(_1979) & 3;
    float _1985 = (*spvDescriptorSet0.vp_c15)._m0[int(_1981)][_1983];
    int _1987 = int(_1979) + 1;
    uint _1989 = uint(int(uint(_1987) >> uint(2)));
    int _1991 = _1987 & 3;
    float _1993 = (*spvDescriptorSet0.vp_c15)._m0[int(_1989)][_1991];
    float _1995 = _1693;
    float _1997 = _1969;
    if (_1965)
    {
        float _1999 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1995 = _1999;
    }
    float _2001 = _1995;
    int _2003 = _1971 + 104;
    uint _2005 = uint(int(uint(_2003) >> uint(2)));
    uint _2007 = uint(int(uint(int(_2005)) >> uint(2)));
    int _2009 = int(_2005) & 3;
    float _2011 = (*spvDescriptorSet0.vp_c15)._m0[int(_2007)][_2009];
    int _2013 = int(_2005) + 1;
    uint _2015 = uint(int(uint(_2013) >> uint(2)));
    int _2017 = _2013 & 3;
    float _2019 = (*spvDescriptorSet0.vp_c15)._m0[int(_2015)][_2017];
    if (_1965)
    {
        float _2021 = _1969 * _2001;
        _1997 = _2021;
    }
    float _2023 = _1997;
    int _2025 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _2027 = _1909 + _2025;
    int _2029 = _2027 + 1;
    float _2031 = _1825 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (_1965)
    {
        float _2033 = _2023 * 0.15915493667125701904296875;
        _783 = _2033;
    }
    float _2035 = _783;
    int _2037 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _2039 = _1959 + _2037;
    int _2041 = _2039 + 1;
    float _2043 = fma(_1827, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2031);
    float _2045 = _313;
    if (_1965)
    {
        float _2047 = _2035 * 6.283185482025146484375;
        float _2049 = cos(_2047);
        _2045 = _2049;
    }
    float _2051 = _2045;
    bool _2053 = _2041 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _2055 = fma(_1829, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2043);
    int _2057 = _2041 | _2029;
    float _2059 = _2055 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    bool _2061 = _2057 < 0;
    bool _2063 = _2061 || _2053;
    float _2065 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2067 = _749;
    if (_1965)
    {
        float _2069 = _2035 * 6.283185482025146484375;
        float _2071 = sin(_2069);
        _2067 = _2071;
    }
    float _2073 = _2067;
    float _2075 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    bool _2077 = _2029 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _2079 = _2077 || _2063;
    float _2081 = _2059 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2083 = precise::max(0.0, _2065);
    float _2085 = -_2081;
    float _2087 = fma(_2085, _2075, 1.0);
    float _2089 = _2055;
    if (_1965)
    {
        float _2091 = rsqrt(_1915);
        _2089 = _2091;
    }
    float _2093 = _2089;
    float _2095 = -_1899;
    float _2097 = -_2083;
    float _2099 = fma(_1837, _2095, _2097);
    float _2101 = _1865 * _1993;
    float _2103 = _1993;
    float _2105 = _2101;
    float _2107 = _2099;
    if (_1965)
    {
        float _2109 = _2099 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2103 = _2109;
    }
    float _2111 = _2103;
    float _2113 = fma(_1469, _1985, _2101);
    if (!_2079)
    {
        int _2115 = _2029 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _2117 = _2115 + _2041;
        _1943 = _2117;
    }
    int _2119 = _1943;
    if (_1965)
    {
        float _2121 = _2051 + (-1.0);
        _2105 = _2121;
    }
    float _2123 = _2105;
    int _2125 = _1971 + 48;
    uint _2127 = uint(int(uint(_2125) >> uint(2)));
    uint _2129 = uint(int(uint(int(_2127)) >> uint(2)));
    int _2131 = int(_2127) & 3;
    float _2133 = (*spvDescriptorSet0.vp_c15)._m0[int(_2129)][_2131];
    int _2135 = int(_2127) + 1;
    uint _2137 = uint(int(uint(_2135) >> uint(2)));
    int _2139 = _2135 & 3;
    float _2141 = (*spvDescriptorSet0.vp_c15)._m0[int(_2137)][_2139];
    float _2143 = _2073;
    float _2145 = _2123;
    if (_1965)
    {
        float _2147 = fma(_2073, _2111, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2143 = _2147;
    }
    float _2149 = _2143;
    float _2151 = fma(_1529, _2011, _2113);
    if (_1965)
    {
        float _2153 = _2123 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2145 = _2153;
    }
    float _2155 = _2145;
    float _2157 = _1825 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    if (!_2079)
    {
        int _2159 = _2119 << 2;
        _1593 = _2159;
    }
    int _2161 = _1593;
    float _2163 = _2093;
    int _2165 = _2161;
    if (_1965)
    {
        float _2167 = _2093 * _2149;
        _2163 = _2167;
    }
    float _2169 = _2163;
    if (_1965)
    {
        float _2171 = fma(_2099, _2051, _2155);
        _2107 = _2171;
    }
    float _2173 = _2107;
    int _2175 = _1971 + 56;
    uint _2177 = uint(int(uint(_2175) >> uint(2)));
    uint _2179 = uint(int(uint(int(_2177)) >> uint(2)));
    int _2181 = int(_2177) & 3;
    float _2183 = (*spvDescriptorSet0.vp_c15)._m0[int(_2179)][_2181];
    int _2185 = int(_2177) + 1;
    uint _2187 = uint(int(uint(_2185) >> uint(2)));
    int _2189 = _2185 & 3;
    float _2191 = (*spvDescriptorSet0.vp_c15)._m0[int(_2187)][_2189];
    float _2193 = fma(_1469, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    if (_1965)
    {
        float _2195 = _1903 * _2169;
        _1945 = _2195;
    }
    float _2197 = _1945;
    if (_1965)
    {
        float _2199 = _1905 * _2169;
        _1947 = _2199;
    }
    float _2201 = _1947;
    float _2203 = _2151 + _2019;
    if (!_2079)
    {
        uint _2205 = uint(int(uint(_2119) >> uint(2)));
        _1595 = int(_2205);
    }
    int _2207 = _1595;
    if (_1965)
    {
        float _2209 = _2197 * _2197;
        _1949 = _2209;
    }
    float _2211 = _1949;
    if (_1965)
    {
        float _2213 = _2201 * _2201;
        _1951 = _2213;
    }
    float _2215 = _1951;
    int _2217 = _1971 + 64;
    uint _2219 = uint(int(uint(_2217) >> uint(2)));
    uint _2221 = uint(int(uint(int(_2219)) >> uint(2)));
    int _2223 = int(_2219) & 3;
    float _2225 = (*spvDescriptorSet0.vp_c15)._m0[int(_2221)][_2223];
    int _2227 = int(_2219) + 1;
    uint _2229 = uint(int(uint(_2227) >> uint(2)));
    int _2231 = _2227 & 3;
    float _2233 = (*spvDescriptorSet0.vp_c15)._m0[int(_2229)][_2231];
    if (!_2079)
    {
        int _2235 = 12 & _2161;
        _2165 = _2235;
    }
    int _2237 = _2165;
    float _2239 = fma(_2173, _2173, _2211);
    float _2241 = _1825 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2243 = 1.0 / _2203;
    int _2245 = _2237;
    if (!_2079)
    {
        int _2247 = _2207 << 4;
        int _2249 = _2247 + _2237;
        _2245 = _2249;
    }
    int _2251 = _2245;
    float _2253 = _2239 + _2215;
    float _2255 = fma(_1827, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2241);
    int _2257 = _1971 + 72;
    uint _2259 = uint(int(uint(_2257) >> uint(2)));
    uint _2261 = uint(int(uint(int(_2259)) >> uint(2)));
    int _2263 = int(_2259) & 3;
    float _2265 = (*spvDescriptorSet0.vp_c15)._m0[int(_2261)][_2263];
    int _2267 = int(_2259) + 1;
    uint _2269 = uint(int(uint(_2267) >> uint(2)));
    int _2271 = _2267 & 3;
    float _2273 = (*spvDescriptorSet0.vp_c15)._m0[int(_2269)][_2271];
    float _2275 = fma(_1827, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2157);
    float _2277 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2279 = fma(_1881, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2277);
    float _2281 = precise::clamp(_2279, 0.0, 1.0);
    float _2283 = fma(_1829, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2255);
    float _2285 = rsqrt(_2253);
    float _2287 = fma(_1829, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2275);
    float _2289 = -_2281;
    float _2291 = _2289 + 1.0;
    float _2293 = _2283 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    int _2295 = _1971 + 80;
    uint _2297 = uint(int(uint(_2295) >> uint(2)));
    uint _2299 = uint(int(uint(int(_2297)) >> uint(2)));
    int _2301 = int(_2297) & 3;
    float _2303 = (*spvDescriptorSet0.vp_c15)._m0[int(_2299)][_2301];
    int _2305 = int(_2297) + 1;
    uint _2307 = uint(int(uint(_2305) >> uint(2)));
    int _2309 = _2305 & 3;
    float _2311 = (*spvDescriptorSet0.vp_c15)._m0[int(_2307)][_2309];
    float _2313 = _2287 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2315 = _2293 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2317 = abs(_2291);
    float _2319 = log2(_2317);
    float _2321 = fma(_2313, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2315);
    int _2323 = _1971 + 88;
    uint _2325 = uint(int(uint(_2323) >> uint(2)));
    uint _2327 = uint(int(uint(int(_2325)) >> uint(2)));
    int _2329 = int(_2325) & 3;
    float _2331 = (*spvDescriptorSet0.vp_c15)._m0[int(_2327)][_2329];
    int _2333 = int(_2325) + 1;
    uint _2335 = uint(int(uint(_2333) >> uint(2)));
    int _2337 = _2333 & 3;
    float _2339 = (*spvDescriptorSet0.vp_c15)._m0[int(_2335)][_2337];
    float _2341 = fma(_2059, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2321);
    float _2343 = _2285 * _2197;
    float _2345 = floor(_2193);
    float _2347 = _2285 * _2173;
    float _2349 = _1865 * _2141;
    float _2351 = _2321;
    if (!_2079)
    {
        int _2353 = _2251 + 400;
        uint _2355 = uint(int(uint(_2353) >> uint(2)));
        uint _2357 = uint(int(uint(int(_2355)) >> uint(2)));
        int _2359 = int(_2355) & 3;
        float _2361 = (*spvDescriptorSet0.vp_c15)._m0[int(_2357)][_2359];
        _2351 = _2361;
    }
    float _2363 = _2351;
    float _2365 = _2343 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2367 = _2285 * _2201;
    float _2369 = fma(_1469, _2133, _2349);
    float _2371 = fma(_1901, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2341);
    float _2373 = log2(_2087);
    float _2375 = fma(_1529, _2183, _2369);
    float _2377 = _2375 + _2191;
    float _2379 = -_2365;
    float _2381 = fma(_2347, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2379);
    float _2383 = -_2345;
    float _2385 = _2193 + _2383;
    float _2387 = _1865 * _2233;
    float _2389 = _2377 * _2243;
    float _2391 = -_2367;
    float _2393 = fma(_2391, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2381);
    float _2395 = 1.0 / _2371;
    float _2397 = fma(_1469, _2225, _2387);
    float _2399 = _2319 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    bool _2401 = _2389 >= 0.0;
    float _2403 = _2373 * 0.693147182464599609375;
    float _2405 = fma(_1529, _2265, _2397);
    float _2407 = fma(_2393, -0.5, 0.5);
    bool _2409 = _2389 <= 1.0;
    bool _2411 = _2409 && _2401;
    float _2413 = exp2(_2399);
    float _2415 = _2405 + _2273;
    float _2417 = _2415 * _2243;
    float _2419 = _1865 * _2311;
    float _2421 = _2293 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2423 = sqrt(_2407);
    bool _2425 = _2417 >= 0.0;
    bool _2427 = _2425 && _2411;
    float _2429 = fma(_1469, _2303, _2419);
    float _2431 = fma(_2393, 0.5, 0.5);
    float _2433 = fma(_2313, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2421);
    bool _2435 = _2417 <= 1.0;
    bool _2437 = _2435 && _2427;
    float _2439 = fma(_1529, _2331, _2429);
    float _2441 = fma(_2431, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2443 = _2367;
    float _2445 = _2431;
    if (!_2079)
    {
        float _2447 = floor(_1895);
        _2443 = _2447;
    }
    float _2449 = _2443;
    float _2451 = fma(_2059, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2433);
    float _2453 = _2439 + _2339;
    float _2455 = fma(_2431, _2441, -0.212114393711090087890625);
    float _2457 = _2293 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2459 = _2347 + 1.0;
    float _2461 = fma(_1901, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2451);
    float _2463 = fma(_2431, _2455, 1.570728778839111328125);
    float _2465 = _2393;
    float _2467 = _2459;
    float _2469 = _2461;
    if (!_2079)
    {
        float _2471 = floor(_1935);
        _2465 = _2471;
    }
    float _2473 = _2465;
    float _2475 = fma(_2313, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2457);
    if (_2437)
    {
        float _2477 = float(_1963);
        _2445 = _2477;
    }
    float _2479 = _2445;
    float _2481 = _2423 * 0.636619746685028076171875;
    float _2483 = -_2347;
    float _2485 = fma(_2413, _2459, _2483);
    float _2487 = fma(_2059, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2475);
    float _2489 = _2461 * _2395;
    float _2491 = -_2463;
    float _2493 = fma(_2481, _2491, 1.0);
    float _2495 = _2439;
    if (!_2079)
    {
        float _2497 = rint(_2363);
        float _2499 = precise::max(_2497, 0.0);
        uint _2501 = uint(_2499);
        uint _2503 = clamp(_2501, 0u, 65535u);
        _2495 = as_type<float>(_2503);
    }
    float _2505 = _2495;
    float _2507 = fma(_1901, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2487);
    float _2509 = _2449;
    if (!_2079)
    {
        float _2511 = -_2449;
        float _2513 = _1895 + _2511;
        _2509 = _2513;
    }
    float _2515 = _2509;
    float _2517 = _2453 * _2243;
    float _2519 = _2403 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2521 = _2507 * _2395;
    float _2523 = fma(_2489, 0.5, 0.5);
    float _2525 = fma(_2485, 0.5, 0.5);
    float _2527 = _2479;
    if (_2437)
    {
        float _2529 = rint(_2479);
        float _2531 = precise::max(_2529, 0.0);
        uint _2533 = uint(_2531);
        uint _2535 = clamp(_2533, 0u, 65535u);
        _2527 = as_type<float>(_2535);
    }
    float _2537 = _2527;
    if (!_2079)
    {
        float _2539 = -_2473;
        float _2541 = _1935 + _2539;
        _2467 = _2541;
    }
    float _2543 = _2467;
    float _2545 = fma(_2521, -0.5, 0.5);
    float2 _6851 = float2(_2385, _1975);
    float _2547 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6851, float2(0.0), isnan(_6851)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6851, float2(0.0), isnan(_6851)), level(0.0)).x;
    float _2549 = _2505;
    if (!_2079)
    {
        float3 _6868 = float3(_2543, _2515, float(as_type<int>(_2505)));
        float3 _6872 = select(_6868, float3(0.0), isnan(_6868));
        float _2551 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _6872.xy, uint(rint(_6872.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _6872.xy, uint(rint(_6872.z)), level(0.0)).x;
        _2549 = _2551;
    }
    float _2553 = _2549;
    float _2555 = _2537;
    if (_2437)
    {
        float3 _6887 = float3(_2389, _2417, float(as_type<int>(_2537)));
        float3 _6889 = select(_6887, float3(0.0), isnan(_6887));
        float _2557 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _6889.xy, uint(rint(_6889.z)), _2517, level(0.0));
        _2555 = _2557;
    }
    float _2559 = _2555;
    float3 _6899 = float3(_2523, _2545, _2519);
    float _2561 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6899, float3(0.0), isnan(_6899)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6899, float3(0.0), isnan(_6899)), level(0.0)).x;
    float3 _6908 = float3(_2523, _2545, _2519);
    float4 _2563 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6908, float3(0.0), isnan(_6908)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6908, float3(0.0), isnan(_6908)), level(0.0)).xyzw;
    float _2565 = _2563.x;
    float _2567 = _2563.y;
    float _2569 = _2563.z;
    float _2571 = _2563.w;
    float2 _6924 = float2(_2493, _2525);
    float3 _2575 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6924, float2(0.0), isnan(_6924)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6924, float2(0.0), isnan(_6924)), level(0.0)).xyz;
    float _2577 = _2575.x;
    float _2579 = _2575.y;
    float _2581 = _2575.z;
    float _2583 = abs(_1919);
    float _2585 = log2(_2583);
    float _2587 = _2293 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_89.x = _1469;
    float _2589 = _2319 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2591 = fma(_2313, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2587);
    out.m_89.z = _1529;
    float _2593 = fma(_2059, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2591);
    float _2595 = exp2(_2589);
    float _2597 = fma(_1901, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2593);
    float _2599 = _2585 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2601 = _2597 + _2371;
    out.gl_Position.x = _2461;
    out.gl_Position.y = _2507;
    out.gl_Position.z = _2597;
    out.gl_Position.w = _2371;
    float _2603 = exp2(_2599);
    float _2605 = _2601 * 0.5;
    bool _2607 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2609 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2611 = _2607 || _2609;
    bool _2613 = isnan(0.5);
    bool _2615 = _2611 || _2613;
    out.m_91.z = _2605;
    out.m_91.w = _2371;
    float _2617 = fma(_2603, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2619 = precise::clamp(_2617, 0.0, 1.0);
    float _2621 = fma(_2619, -2.0, 3.0);
    float _2623 = _2619 * _2619;
    float _2625 = _2623 * _2621;
    bool _2627 = _1919 <= 8000.0;
    bool _2629 = isnan(_1919);
    bool _2631 = _2627 || _2629;
    bool _2633 = isnan(8000.0);
    bool _2635 = _2631 || _2633;
    float _2637 = float(_2635);
    float _2639 = -_2625;
    float _2641 = _2639 + 1.0;
    float _2643 = fma(_2641, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2625);
    float _2645 = _2637 * _2643;
    float _2647 = _2637;
    if (_2615)
    {
        _2647 = 1.0;
    }
    float _2649 = _2647;
    float _2651 = _2649;
    float _2653 = _2553;
    if (!_2615)
    {
        float _2655 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2657 = _2655 * 0.15915493667125701904296875;
        float _2659 = _2657 * 6.283185482025146484375;
        float _2661 = cos(_2659);
        float _2663 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2665 = _2663 * 0.15915493667125701904296875;
        float _2667 = _2657 * 6.283185482025146484375;
        float _2669 = sin(_2667);
        float _2671 = 1.0 / _2661;
        float _2673 = _2665 * 6.283185482025146484375;
        float _2675 = cos(_2673);
        float _2677 = _2669 * _2671;
        float _2679 = _2665 * 6.283185482025146484375;
        float _2681 = sin(_2679);
        float _2683 = _2675 * _2677;
        float _2685 = 1.0 / _2683;
        float _2687 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2689 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2687;
        float _2691 = 1.0 / _2689;
        float _2693 = _2681 * _2685;
        float _2695 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2697 = fma(_1919, _2693, _2695);
        float _2699 = _2697 * _2691;
        float _2701 = precise::clamp(_2699, 0.0, 1.0);
        _2469 = _2685;
        _2651 = _2701;
    }
    float _2703 = _2469;
    float _2705 = _2651;
    float _2707 = _2645 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2709 = -_2547;
    float _2711 = _2709 + 1.0;
    float _2713 = -_2595;
    float _2715 = _2713 + 1.0;
    float _2717 = _2703;
    if (!_2437)
    {
        _2717 = 1.0;
    }
    float _2719 = _2717;
    float _2721 = _2711 * _2707;
    float _2723 = precise::clamp(_2721, 0.0, 1.0);
    float _2725 = _2719;
    if (_2437)
    {
        bool _2727 = _2559 >= _2517;
        bool _2729 = isnan(_2559);
        bool _2731 = _2727 || _2729;
        bool _2733 = isnan(_2517);
        bool _2735 = _2731 || _2733;
        float _2737 = float(_2735);
        _2725 = _2737;
    }
    float _2739 = _2725;
    float _2741 = _2715 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2743 = _2739;
    if (_2079)
    {
        _1953 = 1.0;
    }
    float _2745 = _1953;
    float _2747 = _2745;
    if (!_2079)
    {
        int _2749 = _2119 << 4;
        int _2751 = _2749 + 2048;
        uint _2753 = uint(int(uint(_2751) >> uint(2)));
        uint _2755 = uint(int(uint(int(_2753)) >> uint(2)));
        int _2757 = int(_2753) & 3;
        float _2759 = (*spvDescriptorSet0.vp_c15)._m0[int(_2755)][_2757];
        int _2761 = int(_2753) + 1;
        uint _2763 = uint(int(uint(_2761) >> uint(2)));
        int _2765 = _2761 & 3;
        float _2767 = (*spvDescriptorSet0.vp_c15)._m0[int(_2763)][_2765];
        int _2769 = _2751 + 8;
        uint _2771 = uint(int(uint(_2769) >> uint(2)));
        uint _2773 = uint(int(uint(int(_2771)) >> uint(2)));
        int _2775 = int(_2771) & 3;
        float _2777 = (*spvDescriptorSet0.vp_c15)._m0[int(_2773)][_2775];
        int _2779 = int(_2771) + 1;
        uint _2781 = uint(int(uint(_2779) >> uint(2)));
        int _2783 = _2779 & 3;
        float _2785 = (*spvDescriptorSet0.vp_c15)._m0[int(_2781)][_2783];
        float _2787 = _1865 * _2767;
        float _2789 = fma(_1469, _2759, _2787);
        float _2791 = fma(_1529, _2777, _2789);
        float _2793 = _2791 + _2785;
        float _2795 = precise::clamp(_2793, 0.0, 1.0);
        float _2797 = -_2795;
        float _2799 = _2797 + _2553;
        float _2801 = fma(_2799, 500.0, 1.5);
        float _2803 = exp2(_2801);
        float _2805 = 0.0 + _2803;
        float _2807 = precise::clamp(_2805, 0.0, 1.0);
        _2747 = _2807;
        _1597 = _2803;
    }
    float _2809 = _2747;
    float _2811 = _1597;
    float _2813 = _2739 * _2809;
    float _2815 = _2741 * _2561;
    float _2817 = -_2723;
    float _2819 = fma(_2817, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2821 = -_2741;
    float _2823 = _2821 + 1.0;
    out.m_93.x = _1827;
    out.m_93.y = _1825;
    out.m_93.z = _1829;
    float _2825 = _2571 * _2815;
    float _2827 = -_2813;
    float _2829 = fma(_2827, _2819, 1.0);
    float _2831 = precise::clamp(_2829, 0.0, 1.0);
    float _2833 = _2581 * _2815;
    float _2835 = _2571 * _2823;
    float _2837 = fma(_2577, _2825, _2565);
    float _2839 = fma(_2579, _2825, _2567);
    float _2841 = _2831 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2843 = fma(_2571, _2833, _2569);
    bool _2845 = _1881 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2847 = isnan(_1881);
    bool _2849 = _2845 || _2847;
    bool _2851 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2853 = _2849 || _2851;
    float _2855 = _2705 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_95.x = _2841;
    out.m_97.x = _2837;
    out.m_97.y = _2839;
    out.m_97.z = _2843;
    out.m_97.w = _2835;
    float _2857 = _2823;
    float _2859 = _2811;
    float _2861 = _2825;
    float _2863 = _2831;
    if (!_2853)
    {
        _2857 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2865 = _2857;
    float _2867 = _2865;
    float _2869 = _2865;
    if (!_2853)
    {
        _2743 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2871 = _2743;
    float _2873 = _2871;
    float _2875 = _2871;
    if (!_2853)
    {
        _2653 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2877 = _2653;
    float _2879 = _2877;
    float _2881 = _2877;
    if (!_2853)
    {
        _2859 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2883 = _2859;
    float _2885 = _2883;
    float _2887 = _2883;
    if (!_2853)
    {
        _2861 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2889 = _2861;
    float _2891 = _2889;
    float _2893 = _2889;
    if (!_2853)
    {
        _2863 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2895 = _2863;
    bool _2897 = !_2853;
    float _2899 = _2895;
    float _2901 = _2895;
    if (!_2897)
    {
        bool _2903 = _1881 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2905 = isnan(_1881);
        bool _2907 = _2903 || _2905;
        bool _2909 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2911 = _2907 || _2909;
        if (!_2911)
        {
            float _2913 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2915 = _1881 + _2913;
            float _2917 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2919 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2917;
            float _2921 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2923 = _2921 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2925 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2927 = _2925 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2929 = 1.0 / _2919;
            float _2931 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2933 = _2931 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2935 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2937 = _2935 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2939 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2941 = _2939 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2943 = _2915 * _2929;
            float _2945 = precise::clamp(_2943, 0.0, 1.0);
            float _2947 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2949 = _2947 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2951 = fma(_2945, _2923, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2953 = fma(_2945, _2927, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2955 = fma(_2945, _2949, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2957 = fma(_2945, _2933, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2959 = fma(_2945, _2937, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2961 = fma(_2945, _2941, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2875 = _2953;
            _2893 = _2959;
            _2869 = _2951;
            _2887 = _2957;
            _2881 = _2955;
            _2901 = _2961;
            _2963 = true;
        }
        else
        {
            bool _2965 = _1881 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2967 = isnan(_1881);
            bool _2969 = _2965 || _2967;
            bool _2971 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2973 = _2969 || _2971;
            if (!_2973)
            {
                _2867 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2975 = _2867;
            _2869 = _2975;
            if (!_2973)
            {
                _2873 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2977 = _2873;
            _2875 = _2977;
            if (!_2973)
            {
                _2879 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2979 = _2879;
            _2881 = _2979;
            if (!_2973)
            {
                _2885 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2981 = _2885;
            _2887 = _2981;
            if (!_2973)
            {
                _2891 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2983 = _2891;
            _2893 = _2983;
            if (!_2973)
            {
                _2899 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2985 = _2899;
            bool _2987 = !_2973;
            _2901 = _2985;
            if (!_2987)
            {
                bool _2989 = _1881 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2991 = isnan(_1881);
                bool _2993 = _2989 || _2991;
                bool _2995 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2997 = _2993 || _2995;
                if (!_2997)
                {
                    float _2999 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3001 = _1881 + _2999;
                    float _3003 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3005 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3003;
                    float _3007 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3009 = _3007 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3011 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3013 = _3011 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3015 = 1.0 / _3005;
                    float _3017 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3019 = _3017 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3021 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3023 = _3021 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3025 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3027 = _3025 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3029 = _3001 * _3015;
                    float _3031 = precise::clamp(_3029, 0.0, 1.0);
                    float _3033 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3035 = _3033 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3037 = fma(_3031, _3009, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3039 = fma(_3031, _3013, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3041 = fma(_3031, _3035, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3043 = fma(_3031, _3019, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3045 = fma(_3031, _3023, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3047 = fma(_3031, _3027, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2875 = _3039;
                    _2893 = _3045;
                    _2869 = _3037;
                    _2887 = _3043;
                    _2881 = _3041;
                    _2901 = _3047;
                    _2963 = true;
                }
                else
                {
                    _2875 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2893 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2869 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2887 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2881 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2901 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2963 = false;
    float _3049 = _2875;
    float _3051 = _2893;
    float _3053 = _2869;
    float _3055 = _2887;
    float _3057 = _2881;
    float _3059 = _2901;
    float _3061 = fma(_1727, -0.5, 0.5);
    float _3063 = precise::clamp(_3061, 0.0, 1.0);
    float _3065 = -_3049;
    float _3067 = _3065 + _3051;
    float _3069 = _2855 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3071 = -_3053;
    float _3073 = _3071 + _3055;
    out.m_99.x = 0.0;
    float _3075 = fma(_3063, _3067, _3049);
    float _3077 = fma(_3063, _3073, _3053);
    out.m_63.x = _3069;
    float _3079 = -_3057;
    float _3081 = _3079 + _3059;
    float _3083 = _3075 * 0.586610972881317138671875;
    bool _3085 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3087 = fma(_3063, _3081, _3057);
    float _3089 = fma(_3077, 0.298911988735198974609375, _3083);
    bool _3091 = _2705 > 0.0;
    bool _3093 = isnan(_2705);
    bool _3095 = _3091 || _3093;
    bool _3097 = isnan(0.0);
    bool _3099 = _3095 || _3097;
    float _3101 = fma(_3087, 0.114477999508380889892578125, _3089);
    float _3103 = -_3101;
    float _3105 = _3077 + _3103;
    float _3107 = -_3101;
    float _3109 = _3075 + _3107;
    float _3111 = -_3101;
    float _3113 = _3087 + _3111;
    float _3115 = fma(_3105, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3101);
    float _3117 = fma(_3109, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3101);
    float _3119 = fma(_3113, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3101);
    bool _3121 = !_3085;
    if (!_3121)
    {
        float _3123 = -_1825;
        float _3125 = _3123 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3127 = -_1827;
        float _3129 = _3127 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3131 = -_1829;
        float _3133 = _3131 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3135 = _3125 * _3125;
        float _3137 = fma(_3129, _3129, _3135);
        float _3139 = fma(_3133, _3133, _3137);
        float _3141 = sqrt(_3139);
        float _3143 = rsqrt(_3139);
        float _3145 = -_3141;
        float _3147 = _3145 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3149 = _3147 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3151 = precise::clamp(_3149, 0.0, 1.0);
        float _3153 = _3129 * _3143;
        float _3155 = _3125 * _3143;
        float _3157 = abs(_3151);
        float _3159 = log2(_3157);
        float _3161 = _3133 * _3143;
        float _3163 = _3153 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3165 = _1727 * _3155;
        float _3167 = -_3155;
        float _3169 = -_3163;
        float _3171 = fma(_3167, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3169);
        float _3173 = fma(_1725, _3153, _3165);
        float _3175 = -_3161;
        float _3177 = fma(_3175, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3171);
        float _3179 = fma(_1729, _3161, _3173);
        float _3181 = precise::clamp(_3179, 0.0, 1.0);
        float _3183 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3185 = _3177 + _3183;
        float _3187 = _3159 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3189 = _3185 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3191 = precise::clamp(_3189, 0.0, 1.0);
        float _3193 = exp2(_3187);
        float _3195 = _3193 * _3191;
        float _3197 = _3181 * _3195;
        float _3199 = _3197 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3201 = _3197 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3203 = _3197 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_99.x = _3199;
        out.m_99.y = _3201;
        out.m_99.z = _3203;
    }
    out.m_101.x = _3115;
    out.m_101.y = _3117;
    out.m_101.z = _3119;
    if (_3099)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_63.x = 0.0;
    float _3205 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3205;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.dm_pad9 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2963 = false;
    bool _1777 = false;
    bool _1045 = false;
    bool _853 = false;
    bool _359 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _121 = in.m_60.w;
    float _123 = trunc(_121);
    int _125 = int(_123);
    bool _129 = _125 >= 1;
    float _131 = 0.0;
    if (!_129)
    {
        _131 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _133 = _131;
    float _135 = _133;
    if (!_129)
    {
        out.m_63.x = 0.0;
    }
    int _137 = 0;
    if (!_129)
    {
        float _139 = _133 * 5.0;
        _137 = as_type<int>(_139);
    }
    int _141 = _137;
    int _143 = _141;
    if (!_129)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3262 = as_type<float>(_141);
        out.gl_Position.z = _3262;
    }
    if (!_129)
    {
        return out;
    }
    float _145 = in.m_65.w;
    bool _147 = _145 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _149 = isnan(_145);
    bool _151 = _147 || _149;
    bool _153 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _155 = _151 || _153;
    float _157 = -_145;
    float _159 = _157 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _161 = 0.0;
    float _163 = _159;
    if (_155)
    {
        float _165 = float(_125);
        _161 = _165;
    }
    float _167 = _161;
    bool _169 = _159 >= _167;
    bool _171 = !_155;
    bool _173 = _169 || _171;
    if (_173)
    {
        _135 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _175 = _135;
    if (_173)
    {
        out.m_63.x = 0.0;
    }
    if (_173)
    {
        float _177 = _175 * 5.0;
        _143 = as_type<int>(_177);
    }
    int _179 = _143;
    if (_173)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3331 = as_type<float>(_179);
        out.gl_Position.z = _3331;
    }
    if (_173)
    {
        return out;
    }
    float _181 = in.m_67.x;
    float _183 = in.m_67.y;
    float _185 = in.m_67.z;
    float _187 = in.m_69.x;
    float _189 = in.m_69.y;
    float _191 = in.m_69.z;
    float _193 = in.m_71.x;
    float _195 = in.m_71.y;
    float _197 = in.m_71.z;
    float _199 = _181 * _181;
    float _201 = _183 * _183;
    float _203 = _185 * _185;
    float _205 = fma(_187, _187, _199);
    float _207 = fma(_189, _189, _201);
    float _209 = fma(_191, _191, _203);
    float _211 = fma(_193, _193, _205);
    float _213 = fma(_195, _195, _207);
    float _215 = fma(_197, _197, _209);
    float _217 = sqrt(_211);
    float _219 = sqrt(_213);
    float _221 = sqrt(_215);
    bool _223 = _217 > 0.0;
    bool _225 = _219 > 0.0;
    float _227 = _219;
    float _229 = _217;
    float _231 = _211;
    float _233 = _215;
    if (_223)
    {
        float _235 = rsqrt(_211);
        _227 = _235;
    }
    float _237 = _227;
    float _239 = 0.0;
    float _241 = 0.0;
    if (!_223)
    {
        _239 = 0.0;
        _241 = 0.0;
    }
    float _243 = _239;
    float _245 = _241;
    bool _247 = _221 > 0.0;
    float _249 = 0.0;
    float _251 = _245;
    float _253 = _243;
    if (!_223)
    {
        _249 = 0.0;
    }
    float _255 = _249;
    float _257 = 0.0;
    float _259 = _255;
    if (!_225)
    {
        _257 = 0.0;
    }
    float _261 = _257;
    float _263 = 0.0;
    float _265 = _261;
    if (_225)
    {
        float _267 = rsqrt(_213);
        _263 = _267;
    }
    float _269 = _263;
    float _271 = 0.0;
    if (!_225)
    {
        _271 = 0.0;
    }
    float _273 = _271;
    float _275 = _273;
    if (!_225)
    {
        _229 = 0.0;
    }
    float _277 = _229;
    float _279 = _277;
    if (!_247)
    {
        _231 = 0.0;
    }
    float _281 = _231;
    float _283 = _221;
    float _285 = _281;
    if (_247)
    {
        float _287 = rsqrt(_215);
        _283 = _287;
    }
    float _289 = _283;
    float _291 = _237;
    if (_223)
    {
        float _293 = _237 * _187;
        _259 = _293;
    }
    float _295 = _259;
    if (_223)
    {
        float _297 = _237 * _181;
        _251 = _297;
    }
    float _299 = _251;
    if (_223)
    {
        float _301 = _237 * _193;
        _253 = _301;
    }
    float _303 = _253;
    bool _305 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    if (!_247)
    {
        _291 = 0.0;
    }
    float _307 = _291;
    float _309 = _307;
    if (_225)
    {
        float _311 = _269 * _189;
        _265 = _311;
    }
    float _313 = _265;
    if (!_247)
    {
        _233 = 0.0;
    }
    float _315 = _233;
    float _317 = _315;
    if (_225)
    {
        float _319 = _269 * _183;
        _275 = _319;
    }
    float _321 = _275;
    if (_225)
    {
        float _323 = _269 * _195;
        _279 = _323;
    }
    float _325 = _279;
    if (_247)
    {
        float _327 = _289 * _191;
        _317 = _327;
    }
    float _329 = _317;
    if (_247)
    {
        float _331 = _289 * _185;
        _309 = _331;
    }
    float _333 = _309;
    if (_247)
    {
        float _335 = _289 * _197;
        _285 = _335;
    }
    float _337 = _285;
    bool _339 = !_305;
    float _357;
    if (!_339)
    {
        float _341 = in.m_73.x;
        float _343 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _345 = _341 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _347 = fma(_345, (*spvDescriptorSet0.vp_c9)._m0[12].x, _159);
        float _349 = _347 * _343;
        float _351 = floor(_349);
        float _353 = -_351;
        float _355 = _349 + _353;
        _357 = _355;
        _359 = true;
    }
    else
    {
        float _361 = float(_125);
        float _363 = 1.0 / _361;
        float _365 = _159 * _363;
        _357 = _365;
    }
    _359 = false;
    float _367 = _357;
    int _369 = int2(spvDescriptorSet0.vp_t_tcb_C.get_width(), spvDescriptorSet0.vp_t_tcb_C.get_height()).x;
    int _371 = _369;
    int _373 = 0;
    int _375 = _116(_371, _373, (*spvDescriptorSet0.support_buffer));
    float _377 = in.m_73.x;
    float _379 = in.m_73.y;
    float _381 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[191].y;
    float _383 = in.m_75.z;
    float _385 = -_381;
    float _387 = _385 + (*spvDescriptorSet0.vp_c9)._m0[191].y;
    float _389 = fma((*spvDescriptorSet0.vp_c10)._m0[2].x, 0.0166666693985462188720703125, _377);
    float _391 = fma(_387, _379, _381);
    float _393 = _389 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _395 = trunc(_383);
    int _397 = int(_395);
    float _399 = _393 * _391;
    float _401 = float(_375);
    int _403 = abs(_375);
    bool _405 = _375 == 0;
    float _407 = _399 * _401;
    float _409 = float(uint(_403));
    float _411 = trunc(_407);
    int _413 = int(_411);
    float _415 = 1.0 / _409;
    int _417 = abs(_413);
    uint _420 = uint(int(uint(_413) >> uint(31)));
    float _422 = float(uint(_417));
    int _424 = ~int(_420);
    int _426 = _424 + 1;
    int _428 = as_type<int>(_415) + (-2);
    float _430 = as_type<float>(_428) * _422;
    float _432 = trunc(_430);
    float _434 = precise::max(_432, 0.0);
    uint _436 = uint(_434);
    int _438 = ~int(_436);
    int _440 = _438 + 1;
    int _442 = _440 * _403;
    int _444 = _442 + _417;
    float _446 = float(uint(_444));
    float _448 = as_type<float>(_428) * _446;
    float _450 = trunc(_448);
    float _452 = precise::max(_450, 0.0);
    uint _454 = uint(_452);
    int _456 = int(_436) + int(_454);
    int _458 = ~_456;
    int _460 = _458 + 1;
    int _462 = _460 * _403;
    int _464 = _462 + _417;
    bool _466 = uint(_464) >= uint(_403);
    bool _468 = !_466;
    int _470 = _468 ? 0 : (-1);
    int _472 = ~_456;
    int _474 = _472 + _470;
    int _476 = _474 + 1;
    int _478 = _476 * _403;
    int _480 = _478 + _417;
    int _482 = _480 ^ _426;
    int _484 = ~_426;
    int _486 = _484 + _482;
    int _488 = _486 + 1;
    bool _490 = !_405;
    int _492 = _490 ? _488 : (-1);
    int _494 = _492;
    int _496 = 0;
    int _498 = _117(_494, _496, (*spvDescriptorSet0.support_buffer));
    int _500 = _397;
    int _502 = 0;
    int _504 = _117(_500, _502, (*spvDescriptorSet0.support_buffer));
    float4 _507 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_498, _504)), 0).xyzw;
    float _509 = _507.x;
    float _511 = _507.y;
    float _513 = _507.z;
    float _515 = _507.w;
    float _517 = in.m_75.x;
    int _519 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _521 = _519 != 0;
    int _523 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _525 = _523 != 0;
    float _527 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _529 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _527;
    float _531 = 1.0 / _529;
    float _533 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    bool _535 = _367 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _537 = isnan(_367);
    bool _539 = _535 || _537;
    bool _541 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _543 = _539 || _541;
    float _545 = float(_543);
    float _547 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    bool _549 = _379 > 0.5;
    bool _551 = _549 && _525;
    float _553 = 0.0;
    float _555 = _517;
    if (_521)
    {
        float _557 = in.m_73.x;
        _553 = _557;
    }
    float _559 = _553;
    float _561 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _563 = _533 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _565 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _567 = _367 + _565;
    float _569 = _547 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _571 = _561 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _573 = _567 * _531;
    bool _575 = _367 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _577 = isnan(_367);
    bool _579 = _575 || _577;
    bool _581 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _583 = _579 || _581;
    float _585 = float(_583);
    float _587 = -_545;
    float _589 = _587 + 1.0;
    out.m_77.x = _563;
    out.m_77.y = _569;
    out.m_77.z = _571;
    float _591 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _593 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _591;
    int _595 = _492 + 1;
    float _597 = _585 * _589;
    float _599 = -_585;
    float _601 = _599 + 1.0;
    float _603 = fma(_593, _573, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _605 = _603 * _597;
    float _607 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    bool _609 = _559 > 0.5;
    bool _611 = _609 && _521;
    float _613 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _615 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _613;
    float _617 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _619 = _571;
    if (_521)
    {
        _619 = _517;
    }
    float _621 = _619;
    float _623 = fma(_615, _573, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _625 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _627 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _625;
    float _629 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _631 = _607 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _633 = fma(_627, _573, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    int _635 = abs(_595);
    float _637 = _621;
    if (_611)
    {
        float _639 = -_621;
        float _641 = _639 + 1.0;
        _637 = _641;
    }
    float _643 = _637;
    uint _645 = uint(int(uint(_595) >> uint(31)));
    float _647 = _633 * _597;
    float _649 = _623 * _597;
    float _651 = fma(_601, (*spvDescriptorSet0.vp_c9)._m0[143].x, _605);
    if (_521)
    {
        _555 = _643;
    }
    float _653 = _555;
    float _655 = fma(_601, (*spvDescriptorSet0.vp_c9)._m0[143].y, _647);
    float _657 = float(uint(_635));
    float _659 = fma(_545, (*spvDescriptorSet0.vp_c9)._m0[144].x, _651);
    float _661 = fma(_601, (*spvDescriptorSet0.vp_c9)._m0[143].z, _649);
    int _663 = ~int(_645);
    int _665 = _663 + 1;
    float _667 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _669 = as_type<float>(_428) * _657;
    float _671 = _617 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _673 = _629 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _675 = _653 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _677 = fma(_545, (*spvDescriptorSet0.vp_c9)._m0[144].y, _655);
    float _679 = fma(_545, (*spvDescriptorSet0.vp_c9)._m0[144].z, _661);
    float _681 = trunc(_669);
    float _683 = precise::max(_681, 0.0);
    uint _685 = uint(_683);
    out.m_79.x = _631;
    out.m_79.y = _671;
    out.m_79.z = _673;
    out.m_79.w = _667;
    int _687 = ~int(_685);
    int _689 = _687 + 1;
    int _691 = _689 * _403;
    int _693 = _691 + _635;
    float _695 = float(uint(_693));
    float _697 = as_type<float>(_428) * _695;
    float _699 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _701 = trunc(_697);
    float _703 = precise::max(_701, 0.0);
    uint _705 = uint(_703);
    int _707 = int(_685) + int(_705);
    int _709 = ~_707;
    int _711 = _709 + 1;
    int _713 = _711 * _403;
    int _715 = _713 + _635;
    bool _717 = uint(_715) >= uint(_403);
    bool _719 = !_717;
    int _721 = _719 ? 0 : (-1);
    int _723 = ~_707;
    int _725 = _723 + _721;
    int _727 = _725 + 1;
    int _729 = _727 * _403;
    int _731 = _729 + _635;
    float _733 = in.m_75.y;
    float _735 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _737 = _731 ^ _665;
    int _739 = ~_665;
    int _741 = _739 + _737;
    int _743 = _741 + 1;
    bool _745 = !_405;
    int _747 = _745 ? _743 : (-1);
    float _749 = _675 * _735;
    float _751 = _733;
    if (_551)
    {
        float _753 = -_733;
        float _755 = _753 + 1.0;
        _751 = _755;
    }
    float _757 = _751;
    float _759 = _757 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _761 = _759 * _699;
    uint _763 = as_type<uint>(half2(float2(_515, 0.0)));
    uint _765 = extract_bits(_763, 0u, 8u);
    int _767 = int(_765) & 255;
    uint _769 = extract_bits(_763, 8u, 8u);
    int _771 = int(_769) & 255;
    int _773 = _771 << 8;
    int _775 = _767 | _773;
    bool _777 = _775 >= 32768;
    int _779 = _775 + (-1024);
    int _781 = _779;
    float _783 = _761;
    if (_777)
    {
        int _785 = ~_775;
        int _787 = _785 + 33792;
        int _789 = _787 + 1;
        _781 = _789;
    }
    int _791 = _781;
    int _793 = _791 + 30719;
    float _795 = float(_793);
    float _797 = fma(_795, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _799 = abs(_797);
    float _801 = -_799;
    float _803 = _801 + 1.0;
    float _805 = abs(_797);
    float _807 = fma(_805, -0.0187292993068695068359375, 0.074261002242565155029296875);
    int _809 = as_type<int>(_803) + (-218103808);
    float _811 = abs(_797);
    float _813 = fma(_811, _807, -0.212114393711090087890625);
    bool _815 = uint(_809) >= 1920991232u;
    float _817 = abs(_797);
    float _819 = fma(_817, _813, 1.570728778839111328125);
    bool _821 = _797 < 0.0;
    float _823 = float(_821);
    bool _825 = !_815;
    float _851;
    if (!_825)
    {
        int _827 = as_type<int>(_803);
        int _829 = as_type<int>(_803);
        int _831 = _665;
        int _833 = 3616;
        int _835 = 0;
        int _837;
        int _839;
        int _841;
        int _843;
        int _845;
        int _847;
        int _849;
        _114(_827, _829, _831, _833, _835, _837, _839, _841, _843, _845, _847, _849, out.gl_Position, out.gl_PointSize);
        _851 = as_type<float>(_847);
        _853 = true;
    }
    else
    {
        float _855 = rsqrt(_803);
        float _857 = _803 * _855;
        float _859 = _855 * 0.5;
        float _861 = -_857;
        float _863 = 0.0 + _861;
        float _865 = fma(_859, _863, 0.5);
        float _867 = fma(_857, _865, _857);
        float _869 = -_867;
        float _871 = 0.0 + _869;
        float _873 = fma(_867, _871, _803);
        float _875 = fma(_859, _873, _867);
        _851 = _875;
    }
    _853 = false;
    float _877 = _851;
    int _879 = _747;
    int _881 = 0;
    int _883 = _117(_879, _881, (*spvDescriptorSet0.support_buffer));
    int _885 = _397;
    int _887 = 0;
    int _889 = _117(_885, _887, (*spvDescriptorSet0.support_buffer));
    float4 _891 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_883, _889)), 0).xyzw;
    float _893 = _891.x;
    float _895 = _891.y;
    float _897 = _891.z;
    float _899 = _891.w;
    float _901 = _819 * _877;
    float _903 = _823 * 2.0;
    float _905 = _795 * 3.883221149444580078125;
    float _907 = floor(_407);
    float _909 = -_903;
    float _911 = fma(_901, _909, _901);
    float _913 = _905 * 0.15915493667125701904296875;
    float _915 = fma(_823, 3.1415927410125732421875, _911);
    float _917 = _913 * 6.283185482025146484375;
    float _919 = cos(_917);
    float _921 = _915 * 0.15915493667125701904296875;
    float _923 = _921 * 6.283185482025146484375;
    float _925 = sin(_923);
    float _927 = -_907;
    float _929 = _407 + _927;
    float _931 = _925 * _919;
    float _933 = _913 * 6.283185482025146484375;
    float _935 = sin(_933);
    float _937 = _925 * _935;
    uint _939 = as_type<uint>(half2(float2(_899, 0.0)));
    float _941 = -_509;
    float _943 = _941 + _893;
    float _945 = -_513;
    float _947 = _945 + _897;
    uint _949 = extract_bits(_939, 0u, 8u);
    int _951 = int(_949) & 255;
    uint _953 = extract_bits(_939, 8u, 8u);
    int _955 = int(_953) & 255;
    int _957 = _955 << 8;
    int _959 = _951 | _957;
    float _961 = fma(_929, _943, _509);
    float _963 = fma(_929, _947, _513);
    bool _965 = _959 >= 32768;
    int _967 = _959 + (-1024);
    int _969 = _967;
    if (_965)
    {
        int _971 = ~_959;
        int _973 = _971 + 33792;
        int _975 = _973 + 1;
        _969 = _975;
    }
    int _977 = _969;
    int _979 = _977 + 30719;
    float _981 = float(_979);
    float _983 = fma(_981, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _985 = abs(_983);
    float _987 = -_985;
    float _989 = _987 + 1.0;
    bool _991 = _983 < 0.0;
    float _993 = float(_991);
    float _995 = abs(_983);
    float _997 = fma(_995, -0.0187292993068695068359375, 0.074261002242565155029296875);
    int _999 = as_type<int>(_989) + (-218103808);
    float _1001 = abs(_983);
    float _1003 = fma(_1001, _997, -0.212114393711090087890625);
    bool _1005 = uint(_999) >= 1920991232u;
    float _1007 = -_511;
    float _1009 = _1007 + _895;
    float _1011 = abs(_983);
    float _1013 = fma(_1011, _1003, 1.570728778839111328125);
    float _1015 = fma(_929, _1009, _511);
    bool _1017 = !_1005;
    float _1043;
    if (!_1017)
    {
        int _1019 = as_type<int>(_989);
        int _1021 = as_type<int>(_921);
        int _1023 = as_type<int>(_907);
        int _1025 = 4512;
        int _1027 = as_type<int>(_901);
        int _1029;
        int _1031;
        int _1033;
        int _1035;
        int _1037;
        int _1039;
        int _1041;
        _114(_1019, _1021, _1023, _1025, _1027, _1029, _1031, _1033, _1035, _1037, _1039, _1041, out.gl_Position, out.gl_PointSize);
        _1043 = as_type<float>(_1039);
        _1045 = true;
    }
    else
    {
        float _1047 = rsqrt(_989);
        float _1049 = _989 * _1047;
        float _1051 = _1047 * 0.5;
        float _1053 = -_1049;
        float _1055 = 0.0 + _1053;
        float _1057 = fma(_1051, _1055, 0.5);
        float _1059 = fma(_1049, _1057, _1049);
        float _1061 = -_1059;
        float _1063 = 0.0 + _1061;
        float _1065 = fma(_1059, _1063, _989);
        float _1067 = fma(_1051, _1065, _1059);
        _1043 = _1067;
    }
    _1045 = false;
    float _1069 = _1043;
    float _1071 = in.m_73.x;
    float _1073 = in.m_73.y;
    float _1075 = in.m_73.z;
    float _1077 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1079 = log2(_1077);
    float _1081 = _1013 * _1069;
    float _1083 = _981 * 3.883221149444580078125;
    float _1085 = -_797;
    float _1087 = _1085 + _983;
    float _1089 = _1079 * _159;
    float _1091 = exp2(_1089);
    float _1093 = _1075 * 2.0;
    float _1095 = _1071 * 2.0;
    float _1097 = _1073 * 2.0;
    float _1099 = floor(_1093);
    float _1101 = floor(_1095);
    float _1103 = -_1091;
    float _1105 = _1103 + 1.0;
    float _1107 = floor(_1097);
    bool _1109 = _1099 > 0.0;
    bool _1111 = _1099 >= 0.0;
    bool _1113 = isnan(_1099);
    bool _1115 = _1111 || _1113;
    bool _1117 = isnan(0.0);
    bool _1119 = _1115 || _1117;
    int _1121 = _1119 ? 0 : 1;
    int _1123 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1125 = _1123 != 0;
    int _1127 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1129 = _1127 != 0;
    int _1131 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1133 = _1131 != 0;
    int _1135 = ~_1121;
    int _1137 = _1135 + 1;
    int _1139 = _1137 + 1;
    bool _1141 = _1101 > 0.0;
    int _1143 = _1139;
    if (!_1109)
    {
        int _1145 = ~_1121;
        int _1147 = _1145 + 1;
        _1143 = _1147;
    }
    int _1149 = _1143;
    float _1151 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1153 = 1.0 + _1151;
    bool _1155 = _1101 >= 0.0;
    bool _1157 = isnan(_1101);
    bool _1159 = _1155 || _1157;
    bool _1161 = isnan(0.0);
    bool _1163 = _1159 || _1161;
    bool _1165 = _1107 > 0.0;
    float _1167 = 1.0 / _1153;
    bool _1169 = _1107 >= 0.0;
    bool _1171 = isnan(_1107);
    bool _1173 = _1169 || _1171;
    bool _1175 = isnan(0.0);
    bool _1177 = _1173 || _1175;
    float _1179 = in.m_81.x;
    float _1181 = in.m_81.y;
    float _1183 = in.m_81.z;
    bool _1185 = !_1125;
    int _1187 = _1185 ? 0 : 1;
    int _1189 = _1163 ? 0 : 1;
    bool _1191 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1193 = isnan(1.0);
    bool _1195 = _1191 || _1193;
    bool _1197 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1199 = _1195 || _1197;
    int _1201 = abs(_1187);
    float _1203 = _1073 + _1071;
    bool _1205 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1207 = isnan(0.0);
    bool _1209 = _1205 || _1207;
    bool _1211 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1213 = _1209 || _1211;
    float _1215 = float(_1201);
    float _1217 = _1203 + (-1.0);
    float _1219 = float(_1149);
    float _1221 = _1213 ? _1105 : 0.0;
    float _1223 = fma(_1217, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _1225 = _1177 ? 0 : 1;
    float _1227 = _1215 * _1219;
    float _1229 = _1071 + (-0.5);
    if (_1199)
    {
        float _1231 = _1221 * _1167;
        _163 = _1231;
    }
    float _1233 = _163;
    int _1235 = ~_1225;
    int _1237 = _1235 + 1;
    int _1239 = _1237 + 1;
    float _1241 = _1227 * (-2.0);
    bool _1243 = !_1133;
    int _1245 = _1243 ? 0 : 1;
    float _1247 = _1075 + _1071;
    bool _1249 = !_1129;
    int _1251 = _1249 ? 0 : 1;
    float _1253 = fma(_1241, _1179, _1179);
    int _1255 = abs(_1245);
    float _1257 = fma(_1223, _1241, _1223);
    int _1259 = _1239;
    if (!_1165)
    {
        int _1261 = ~_1225;
        int _1263 = _1261 + 1;
        _1259 = _1263;
    }
    int _1265 = _1259;
    float _1267 = fma(_1229, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1253);
    float _1269 = _1247 + (-1.0);
    int _1271 = abs(_1251);
    float _1273 = fma(_1257, _1233, _1267);
    float _1275 = float(_1255);
    float _1277 = float(_1265);
    float _1279 = _1273 * 0.15915493667125701904296875;
    int _1281 = ~_1189;
    int _1283 = _1281 + 1;
    int _1285 = _1283 + 1;
    float _1287 = _1275 * _1277;
    int _1289 = _1285;
    if (!_1141)
    {
        int _1291 = ~_1189;
        int _1293 = _1291 + 1;
        _1289 = _1293;
    }
    int _1295 = _1289;
    float _1297 = fma(_1269, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1299 = float(_1271);
    float _1301 = _1287 * (-2.0);
    float _1303 = float(_1295);
    float _1305 = _1075 + (-0.5);
    float _1307 = _1075 + _1073;
    float _1309 = fma(_1301, _1183, _1183);
    float _1311 = fma(_1297, _1301, _1297);
    float _1313 = _1299 * _1303;
    float _1315 = _1307 + (-1.0);
    float _1317 = fma(_1305, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1309);
    float _1319 = in.m_60.x;
    float _1321 = in.m_60.y;
    float _1323 = in.m_60.z;
    float _1325 = _1313 * (-2.0);
    float _1327 = _1073 + (-0.5);
    float _1329 = fma(_1311, _1233, _1317);
    float _1331 = in.m_69.x;
    float _1333 = in.m_69.y;
    float _1335 = in.m_69.z;
    float _1337 = fma(_1315, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1339 = _1279 * 6.283185482025146484375;
    float _1341 = sin(_1339);
    float _1343 = _1329 * 0.15915493667125701904296875;
    float _1345 = in.m_83.x;
    float _1347 = in.m_83.y;
    float _1349 = in.m_83.z;
    float _1351 = fma(_1325, _1181, _1181);
    float _1353 = fma(_1337, _1325, _1337);
    float _1355 = _993 * 2.0;
    float _1357 = in.m_71.x;
    float _1359 = in.m_71.y;
    float _1361 = in.m_71.z;
    float _1363 = fma(_1327, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1351);
    float _1365 = _1279 * 6.283185482025146484375;
    float _1367 = cos(_1365);
    float _1369 = -_1355;
    float _1371 = fma(_1081, _1369, _1081);
    bool _1373 = _1015 != 0.0;
    bool _1375 = isnan(_1015);
    bool _1377 = _1373 || _1375;
    bool _1379 = isnan(0.0);
    bool _1381 = _1377 || _1379;
    float _1383 = fma(_1353, _1233, _1363);
    float _1385 = fma(_993, 3.1415927410125732421875, _1371);
    bool _1387 = _961 == 0.0;
    bool _1389 = !_1381;
    bool _1391 = _1387 && _1389;
    float _1393 = _1383 * 0.15915493667125701904296875;
    float _1395 = _1343 * 6.283185482025146484375;
    float _1397 = sin(_1395);
    float _1399 = _1385 * 0.15915493667125701904296875;
    bool _1401 = _963 == 0.0;
    bool _1403 = _1401 && _1391;
    float _1405 = _1333 * _1321;
    float _1407 = _1393 * 6.283185482025146484375;
    float _1409 = cos(_1407);
    float _1411 = _677 * _1347;
    float _1413 = _679 * _1349;
    float _1415 = fma(_1331, _1319, _1405);
    float _1417 = _659 * _1345;
    float _1419 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1015);
    float _1421 = _1411 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1423 = _1343 * 6.283185482025146484375;
    float _1425 = cos(_1423);
    float _1427 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _963);
    float _1429 = _1413 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1431 = _1359 * _1321;
    float _1433 = fma(_1335, _1323, _1415);
    float _1435 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _961);
    float _1437 = _1417 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1439 = _1421 * _1419;
    float _1441 = _1393 * 6.283185482025146484375;
    float _1443 = sin(_1441);
    float _1445 = _1429 * _1427;
    float _1447 = fma(_1357, _1319, _1431);
    float _1449 = _1367 * _1397;
    float _1451 = _1341 * _1397;
    float _1453 = _1409 * _1397;
    float _1455 = _1437 * _1435;
    float _1457 = fma(_1361, _1323, _1447);
    float _1459 = _1367 * _1425;
    float _1461 = _1341 * _1425;
    float _1463 = _1341 * _1409;
    float _1465 = _1409 * _1425;
    float _1467 = _1367 * _1409;
    float _1469 = _1433 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1471 = _1399 * 6.283185482025146484375;
    float _1473 = sin(_1471);
    float _1475 = fma(_1443, _1451, _1459);
    float _1477 = -_1449;
    float _1479 = fma(_1443, _1461, _1477);
    float _1481 = -_1461;
    float _1483 = fma(_1443, _1449, _1481);
    float _1485 = _1463 * _1439;
    float _1487 = _1475 * _1439;
    float _1489 = _1479 * _1439;
    float _1491 = fma(_1443, _1459, _1451);
    float _1493 = -_1443;
    float _1495 = fma(_1493, _1455, _1485);
    float _1497 = fma(_1453, _1455, _1487);
    float _1499 = fma(_1465, _1455, _1489);
    float _1501 = fma(_1467, _1445, _1495);
    float _1503 = fma(_1483, _1445, _1497);
    float _1505 = fma(_1491, _1445, _1499);
    float _1507 = _1083 * 0.15915493667125701904296875;
    float _1509 = in.m_67.x;
    float _1511 = in.m_67.y;
    float _1513 = in.m_67.z;
    float _1515 = _1503 * _313;
    float _1517 = _1503 * _325;
    float _1519 = _1507 * 6.283185482025146484375;
    float _1521 = cos(_1519);
    float _1523 = _1503 * _321;
    float _1525 = fma(_1505, _295, _1515);
    float _1527 = fma(_1505, _303, _1517);
    float _1529 = _1457 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1531 = fma(_1505, _299, _1523);
    float _1533 = fma(_1501, _329, _1525);
    float _1535 = fma(_1501, _337, _1527);
    float _1537 = _1507 * 6.283185482025146484375;
    float _1539 = sin(_1537);
    float _1541 = fma(_1501, _333, _1531);
    float _1543 = _1469 + _1533;
    float _1545 = _1529 + _1535;
    float _1547 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1549 = _1543 + _1547;
    float _1551 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1553 = _1545 + _1551;
    float _1555 = -_931;
    float _1557 = fma(_1473, _1521, _1555);
    float _1559 = _1549 * _1549;
    float _1561 = _1553 * _1553;
    float _1563 = _1511 * _1321;
    float _1565 = _1559 + _1561;
    float _1567 = -_937;
    float _1569 = fma(_1473, _1539, _1567);
    float _1571 = fma(_1509, _1319, _1563);
    float _1573 = fma(_929, _1087, _797);
    float _1575 = sqrt(_1565);
    float _1577 = fma(_929, _1557, _931);
    float _1579 = fma(_1513, _1323, _1571);
    float _1581 = _1573;
    float _1583 = _1577;
    float _1585 = _1559;
    float _1587 = _1561;
    float _1589 = _1543;
    float _1591 = _1545;
    int _1593 = as_type<int>(_1439);
    int _1595 = as_type<int>(_1523);
    float _1597 = _1529;
    if (!_1403)
    {
        float _1599 = fma(_1015, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1573);
        _1581 = _1599;
    }
    float _1601 = _1581;
    float _1603 = fma(_929, _1569, _937);
    float _1605 = _1603;
    float _1607 = _1601;
    if (!_1403)
    {
        float _1609 = fma(_961, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1577);
        _1583 = _1609;
    }
    float _1611 = _1583;
    float _1613 = _1579 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1615 = _1463 * _1601;
    float _1617 = _1479 * _1601;
    float _1619 = _1475 * _1601;
    float _1621 = _1613 + _1541;
    if (!_1403)
    {
        float _1623 = fma(_963, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1603);
        _1605 = _1623;
    }
    float _1625 = _1605;
    bool _1627 = _1575 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    if (!_1627)
    {
        _1607 = _1621;
    }
    float _1629 = _1607;
    bool _1631 = !_1627;
    float _1633 = _1629;
    if (!_1631)
    {
        float _1635 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1637 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1639 = _1575 + _1637;
        float _1641 = rsqrt(_1565);
        float _1643 = _1639 * _1635;
        float _1645 = _1621 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1647 = _1643 * 0.15915493667125701904296875;
        float _1649 = _1647 * 6.283185482025146484375;
        float _1651 = sin(_1649);
        float _1653 = _1647 * 6.283185482025146484375;
        float _1655 = cos(_1653);
        float _1657 = fma(_1651, _1645, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1659 = _1641 * _1657;
        float _1661 = _1655 + (-1.0);
        float _1663 = _1549 * _1659;
        float _1665 = _1553 * _1659;
        float _1667 = _1661 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1669 = _1663 + (*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1671 = _1663 * _1663;
        float _1673 = _1665 + (*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1675 = fma(_1621, _1655, _1667);
        float _1677 = _1665 * _1665;
        _1633 = _1675;
        _1585 = _1671;
        _1587 = _1677;
        _1589 = _1669;
        _1591 = _1673;
    }
    float _1679 = _1633;
    float _1681 = _1585;
    float _1683 = _1587;
    float _1685 = _1589;
    float _1687 = _1591;
    float _1689 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1691 = _1679 + _1689;
    float _1693 = fma(_1453, _1611, _1619);
    float _1695 = fma(_1465, _1611, _1617);
    float _1697 = -_1443;
    float _1699 = fma(_1697, _1611, _1615);
    float _1701 = fma(_1691, _1691, _1681);
    float _1703 = fma(_1483, _1625, _1693);
    float _1705 = fma(_1491, _1625, _1695);
    float _1707 = fma(_1467, _1625, _1699);
    float _1709 = _1701 + _1683;
    float _1711 = _1703 * _313;
    float _1713 = _1703 * _321;
    float _1715 = _1703 * _325;
    out.m_85.x = _749;
    out.m_85.y = _761;
    float _1717 = fma(_1705, _295, _1711);
    float _1719 = sqrt(_1709);
    float _1721 = fma(_1705, _299, _1713);
    float _1723 = fma(_1705, _303, _1715);
    float _1725 = fma(_1707, _329, _1717);
    float _1727 = fma(_1707, _333, _1721);
    float _1729 = fma(_1707, _337, _1723);
    out.m_87.x = _1725;
    out.m_87.y = _1727;
    out.m_87.z = _1729;
    bool _1731 = _1719 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1733 = isnan(_1719);
    bool _1735 = _1731 || _1733;
    bool _1737 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1739 = _1735 || _1737;
    float _1741 = _1721;
    if (!_1739)
    {
        _1741 = 1.0;
    }
    float _1743 = _1741;
    bool _1745 = !_1739;
    float _1747 = _1743;
    if (!_1745)
    {
        bool _1749 = _1719 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1751 = isnan(_1719);
        bool _1753 = _1749 || _1751;
        bool _1755 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1757 = _1753 || _1755;
        if (!_1757)
        {
            float _1759 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1761 = _1719 + _1759;
            float _1763 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1765 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1763;
            float _1767 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1769 = _1767 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1771 = 1.0 / _1765;
            float _1773 = _1761 * _1771;
            float _1775 = fma(_1773, _1769, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1747 = _1775;
            _1777 = true;
        }
        else
        {
            bool _1779 = _1719 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1781 = isnan(_1719);
            bool _1783 = _1779 || _1781;
            bool _1785 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1787 = _1783 || _1785;
            if (!_1787)
            {
                float _1789 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1791 = _1719 + _1789;
                float _1793 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1795 = _1793 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1797 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1799 = _1797 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1801 = 1.0 / _1795;
                float _1803 = _1791 * _1801;
                float _1805 = fma(_1803, _1799, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1747 = _1805;
                _1777 = true;
            }
            else
            {
                _1747 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1777 = false;
    float _1807 = _1747;
    float _1809 = _1613 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1811 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1813 = _1679 + _1811;
    float _1815 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1817 = _1685 + _1815;
    float _1819 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1821 = _1687 + _1819;
    float _1823 = fma(_1469, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1809);
    float _1825 = fma(_1813, _1807, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1827 = fma(_1817, _1807, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1829 = fma(_1821, _1807, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1831 = fma(_1529, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1823);
    float _1833 = _1613 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1835 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1837 = _1825 + _1835;
    float _1839 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1841 = _1827 + _1839;
    float _1843 = _1831 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1845 = fma(_1469, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1833);
    float _1847 = _1837 * _1837;
    float _1849 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1851 = _1829 + _1849;
    float _1853 = 1.0 / _1843;
    float _1855 = fma(_1529, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1845);
    float _1857 = fma(_1841, _1841, _1847);
    float _1859 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _1861 = _1855 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1863 = fma(_1851, _1851, _1857);
    float _1865 = _1613 + _1859;
    float _1867 = _1861 + _1843;
    float _1869 = rsqrt(_1863);
    float _1871 = _1865 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1873 = _1825 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1875 = _1867 * _1853;
    float _1877 = _1875 * 0.5;
    float _1879 = fma(_1469, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1871);
    float _1881 = sqrt(_1863);
    float _1883 = fma(_1827, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1873);
    float _1885 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1887 = fma(_1877, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1885);
    float _1889 = fma(_1529, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1879);
    float _1891 = fma(_1529, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1893 = fma(_1829, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1883);
    float _1895 = _1889 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _1897 = 1.0 / _1887;
    float _1899 = _1869 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1901 = _1893 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1903 = _1841 * _1899;
    float _1905 = _1851 * _1899;
    float _1907 = trunc(_1895);
    int _1909 = int(_1907);
    float _1911 = _1903 * _1903;
    float _1913 = _1905 * _1905;
    float _1915 = _1911 + _1913;
    float _1917 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1919 = _1897 * _1917;
    float _1921 = _1865 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1923 = sqrt(_1915);
    bool _1925 = _1919 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _1927 = fma(_1469, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1921);
    bool _1929 = _1919 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _1931 = fma(_1529, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1927);
    float _1933 = floor(_1891);
    float _1935 = _1931 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    bool _1937 = !_1925;
    int _1939 = _1937 ? 0 : 1;
    int _1941 = 2;
    int _1943 = as_type<int>(_1837);
    float _1945 = _1903;
    float _1947 = _1905;
    float _1949 = _1911;
    float _1951 = _1913;
    float _1953 = _1919;
    if (!_1925)
    {
        _1941 = 1;
    }
    int _1955 = _1941;
    float _1957 = trunc(_1935);
    int _1959 = int(_1957);
    int _1961 = _1955;
    if (!_1929)
    {
        _1961 = _1939;
    }
    int _1963 = _1961;
    bool _1965 = _1923 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1967 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1969 = _1923 + _1967;
    int _1971 = _1963 << 6;
    float _1973 = -_1933;
    float _1975 = _1891 + _1973;
    int _1977 = _1971 + 96;
    uint _1979 = uint(int(uint(_1977) >> uint(2)));
    uint _1981 = uint(int(uint(int(_1979)) >> uint(2)));
    int _1983 = int(_1979) & 3;
    float _1985 = (*spvDescriptorSet0.vp_c15)._m0[int(_1981)][_1983];
    int _1987 = int(_1979) + 1;
    uint _1989 = uint(int(uint(_1987) >> uint(2)));
    int _1991 = _1987 & 3;
    float _1993 = (*spvDescriptorSet0.vp_c15)._m0[int(_1989)][_1991];
    float _1995 = _1693;
    float _1997 = _1969;
    if (_1965)
    {
        float _1999 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1995 = _1999;
    }
    float _2001 = _1995;
    int _2003 = _1971 + 104;
    uint _2005 = uint(int(uint(_2003) >> uint(2)));
    uint _2007 = uint(int(uint(int(_2005)) >> uint(2)));
    int _2009 = int(_2005) & 3;
    float _2011 = (*spvDescriptorSet0.vp_c15)._m0[int(_2007)][_2009];
    int _2013 = int(_2005) + 1;
    uint _2015 = uint(int(uint(_2013) >> uint(2)));
    int _2017 = _2013 & 3;
    float _2019 = (*spvDescriptorSet0.vp_c15)._m0[int(_2015)][_2017];
    if (_1965)
    {
        float _2021 = _1969 * _2001;
        _1997 = _2021;
    }
    float _2023 = _1997;
    int _2025 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _2027 = _1909 + _2025;
    int _2029 = _2027 + 1;
    float _2031 = _1825 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (_1965)
    {
        float _2033 = _2023 * 0.15915493667125701904296875;
        _783 = _2033;
    }
    float _2035 = _783;
    int _2037 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _2039 = _1959 + _2037;
    int _2041 = _2039 + 1;
    float _2043 = fma(_1827, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2031);
    float _2045 = _313;
    if (_1965)
    {
        float _2047 = _2035 * 6.283185482025146484375;
        float _2049 = cos(_2047);
        _2045 = _2049;
    }
    float _2051 = _2045;
    bool _2053 = _2041 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _2055 = fma(_1829, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2043);
    int _2057 = _2041 | _2029;
    float _2059 = _2055 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    bool _2061 = _2057 < 0;
    bool _2063 = _2061 || _2053;
    float _2065 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2067 = _749;
    if (_1965)
    {
        float _2069 = _2035 * 6.283185482025146484375;
        float _2071 = sin(_2069);
        _2067 = _2071;
    }
    float _2073 = _2067;
    float _2075 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    bool _2077 = _2029 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _2079 = _2077 || _2063;
    float _2081 = _2059 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2083 = precise::max(0.0, _2065);
    float _2085 = -_2081;
    float _2087 = fma(_2085, _2075, 1.0);
    float _2089 = _2055;
    if (_1965)
    {
        float _2091 = rsqrt(_1915);
        _2089 = _2091;
    }
    float _2093 = _2089;
    float _2095 = -_1899;
    float _2097 = -_2083;
    float _2099 = fma(_1837, _2095, _2097);
    float _2101 = _1865 * _1993;
    float _2103 = _1993;
    float _2105 = _2101;
    float _2107 = _2099;
    if (_1965)
    {
        float _2109 = _2099 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2103 = _2109;
    }
    float _2111 = _2103;
    float _2113 = fma(_1469, _1985, _2101);
    if (!_2079)
    {
        int _2115 = _2029 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _2117 = _2115 + _2041;
        _1943 = _2117;
    }
    int _2119 = _1943;
    if (_1965)
    {
        float _2121 = _2051 + (-1.0);
        _2105 = _2121;
    }
    float _2123 = _2105;
    int _2125 = _1971 + 48;
    uint _2127 = uint(int(uint(_2125) >> uint(2)));
    uint _2129 = uint(int(uint(int(_2127)) >> uint(2)));
    int _2131 = int(_2127) & 3;
    float _2133 = (*spvDescriptorSet0.vp_c15)._m0[int(_2129)][_2131];
    int _2135 = int(_2127) + 1;
    uint _2137 = uint(int(uint(_2135) >> uint(2)));
    int _2139 = _2135 & 3;
    float _2141 = (*spvDescriptorSet0.vp_c15)._m0[int(_2137)][_2139];
    float _2143 = _2073;
    float _2145 = _2123;
    if (_1965)
    {
        float _2147 = fma(_2073, _2111, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2143 = _2147;
    }
    float _2149 = _2143;
    float _2151 = fma(_1529, _2011, _2113);
    if (_1965)
    {
        float _2153 = _2123 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2145 = _2153;
    }
    float _2155 = _2145;
    float _2157 = _1825 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    if (!_2079)
    {
        int _2159 = _2119 << 2;
        _1593 = _2159;
    }
    int _2161 = _1593;
    float _2163 = _2093;
    int _2165 = _2161;
    if (_1965)
    {
        float _2167 = _2093 * _2149;
        _2163 = _2167;
    }
    float _2169 = _2163;
    if (_1965)
    {
        float _2171 = fma(_2099, _2051, _2155);
        _2107 = _2171;
    }
    float _2173 = _2107;
    int _2175 = _1971 + 56;
    uint _2177 = uint(int(uint(_2175) >> uint(2)));
    uint _2179 = uint(int(uint(int(_2177)) >> uint(2)));
    int _2181 = int(_2177) & 3;
    float _2183 = (*spvDescriptorSet0.vp_c15)._m0[int(_2179)][_2181];
    int _2185 = int(_2177) + 1;
    uint _2187 = uint(int(uint(_2185) >> uint(2)));
    int _2189 = _2185 & 3;
    float _2191 = (*spvDescriptorSet0.vp_c15)._m0[int(_2187)][_2189];
    float _2193 = fma(_1469, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    if (_1965)
    {
        float _2195 = _1903 * _2169;
        _1945 = _2195;
    }
    float _2197 = _1945;
    if (_1965)
    {
        float _2199 = _1905 * _2169;
        _1947 = _2199;
    }
    float _2201 = _1947;
    float _2203 = _2151 + _2019;
    if (!_2079)
    {
        uint _2205 = uint(int(uint(_2119) >> uint(2)));
        _1595 = int(_2205);
    }
    int _2207 = _1595;
    if (_1965)
    {
        float _2209 = _2197 * _2197;
        _1949 = _2209;
    }
    float _2211 = _1949;
    if (_1965)
    {
        float _2213 = _2201 * _2201;
        _1951 = _2213;
    }
    float _2215 = _1951;
    int _2217 = _1971 + 64;
    uint _2219 = uint(int(uint(_2217) >> uint(2)));
    uint _2221 = uint(int(uint(int(_2219)) >> uint(2)));
    int _2223 = int(_2219) & 3;
    float _2225 = (*spvDescriptorSet0.vp_c15)._m0[int(_2221)][_2223];
    int _2227 = int(_2219) + 1;
    uint _2229 = uint(int(uint(_2227) >> uint(2)));
    int _2231 = _2227 & 3;
    float _2233 = (*spvDescriptorSet0.vp_c15)._m0[int(_2229)][_2231];
    if (!_2079)
    {
        int _2235 = 12 & _2161;
        _2165 = _2235;
    }
    int _2237 = _2165;
    float _2239 = fma(_2173, _2173, _2211);
    float _2241 = _1825 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2243 = 1.0 / _2203;
    int _2245 = _2237;
    if (!_2079)
    {
        int _2247 = _2207 << 4;
        int _2249 = _2247 + _2237;
        _2245 = _2249;
    }
    int _2251 = _2245;
    float _2253 = _2239 + _2215;
    float _2255 = fma(_1827, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2241);
    int _2257 = _1971 + 72;
    uint _2259 = uint(int(uint(_2257) >> uint(2)));
    uint _2261 = uint(int(uint(int(_2259)) >> uint(2)));
    int _2263 = int(_2259) & 3;
    float _2265 = (*spvDescriptorSet0.vp_c15)._m0[int(_2261)][_2263];
    int _2267 = int(_2259) + 1;
    uint _2269 = uint(int(uint(_2267) >> uint(2)));
    int _2271 = _2267 & 3;
    float _2273 = (*spvDescriptorSet0.vp_c15)._m0[int(_2269)][_2271];
    float _2275 = fma(_1827, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2157);
    float _2277 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2279 = fma(_1881, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2277);
    float _2281 = precise::clamp(_2279, 0.0, 1.0);
    float _2283 = fma(_1829, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2255);
    float _2285 = rsqrt(_2253);
    float _2287 = fma(_1829, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2275);
    float _2289 = -_2281;
    float _2291 = _2289 + 1.0;
    float _2293 = _2283 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    int _2295 = _1971 + 80;
    uint _2297 = uint(int(uint(_2295) >> uint(2)));
    uint _2299 = uint(int(uint(int(_2297)) >> uint(2)));
    int _2301 = int(_2297) & 3;
    float _2303 = (*spvDescriptorSet0.vp_c15)._m0[int(_2299)][_2301];
    int _2305 = int(_2297) + 1;
    uint _2307 = uint(int(uint(_2305) >> uint(2)));
    int _2309 = _2305 & 3;
    float _2311 = (*spvDescriptorSet0.vp_c15)._m0[int(_2307)][_2309];
    float _2313 = _2287 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2315 = _2293 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2317 = abs(_2291);
    float _2319 = log2(_2317);
    float _2321 = fma(_2313, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2315);
    int _2323 = _1971 + 88;
    uint _2325 = uint(int(uint(_2323) >> uint(2)));
    uint _2327 = uint(int(uint(int(_2325)) >> uint(2)));
    int _2329 = int(_2325) & 3;
    float _2331 = (*spvDescriptorSet0.vp_c15)._m0[int(_2327)][_2329];
    int _2333 = int(_2325) + 1;
    uint _2335 = uint(int(uint(_2333) >> uint(2)));
    int _2337 = _2333 & 3;
    float _2339 = (*spvDescriptorSet0.vp_c15)._m0[int(_2335)][_2337];
    float _2341 = fma(_2059, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2321);
    float _2343 = _2285 * _2197;
    float _2345 = floor(_2193);
    float _2347 = _2285 * _2173;
    float _2349 = _1865 * _2141;
    float _2351 = _2321;
    if (!_2079)
    {
        int _2353 = _2251 + 400;
        uint _2355 = uint(int(uint(_2353) >> uint(2)));
        uint _2357 = uint(int(uint(int(_2355)) >> uint(2)));
        int _2359 = int(_2355) & 3;
        float _2361 = (*spvDescriptorSet0.vp_c15)._m0[int(_2357)][_2359];
        _2351 = _2361;
    }
    float _2363 = _2351;
    float _2365 = _2343 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2367 = _2285 * _2201;
    float _2369 = fma(_1469, _2133, _2349);
    float _2371 = fma(_1901, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2341);
    float _2373 = log2(_2087);
    float _2375 = fma(_1529, _2183, _2369);
    float _2377 = _2375 + _2191;
    float _2379 = -_2365;
    float _2381 = fma(_2347, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2379);
    float _2383 = -_2345;
    float _2385 = _2193 + _2383;
    float _2387 = _1865 * _2233;
    float _2389 = _2377 * _2243;
    float _2391 = -_2367;
    float _2393 = fma(_2391, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2381);
    float _2395 = 1.0 / _2371;
    float _2397 = fma(_1469, _2225, _2387);
    float _2399 = _2319 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    bool _2401 = _2389 >= 0.0;
    float _2403 = _2373 * 0.693147182464599609375;
    float _2405 = fma(_1529, _2265, _2397);
    float _2407 = fma(_2393, -0.5, 0.5);
    bool _2409 = _2389 <= 1.0;
    bool _2411 = _2409 && _2401;
    float _2413 = exp2(_2399);
    float _2415 = _2405 + _2273;
    float _2417 = _2415 * _2243;
    float _2419 = _1865 * _2311;
    float _2421 = _2293 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2423 = sqrt(_2407);
    bool _2425 = _2417 >= 0.0;
    bool _2427 = _2425 && _2411;
    float _2429 = fma(_1469, _2303, _2419);
    float _2431 = fma(_2393, 0.5, 0.5);
    float _2433 = fma(_2313, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2421);
    bool _2435 = _2417 <= 1.0;
    bool _2437 = _2435 && _2427;
    float _2439 = fma(_1529, _2331, _2429);
    float _2441 = fma(_2431, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2443 = _2367;
    float _2445 = _2431;
    if (!_2079)
    {
        float _2447 = floor(_1895);
        _2443 = _2447;
    }
    float _2449 = _2443;
    float _2451 = fma(_2059, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2433);
    float _2453 = _2439 + _2339;
    float _2455 = fma(_2431, _2441, -0.212114393711090087890625);
    float _2457 = _2293 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2459 = _2347 + 1.0;
    float _2461 = fma(_1901, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2451);
    float _2463 = fma(_2431, _2455, 1.570728778839111328125);
    float _2465 = _2393;
    float _2467 = _2459;
    float _2469 = _2461;
    if (!_2079)
    {
        float _2471 = floor(_1935);
        _2465 = _2471;
    }
    float _2473 = _2465;
    float _2475 = fma(_2313, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2457);
    if (_2437)
    {
        float _2477 = float(_1963);
        _2445 = _2477;
    }
    float _2479 = _2445;
    float _2481 = _2423 * 0.636619746685028076171875;
    float _2483 = -_2347;
    float _2485 = fma(_2413, _2459, _2483);
    float _2487 = fma(_2059, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2475);
    float _2489 = _2461 * _2395;
    float _2491 = -_2463;
    float _2493 = fma(_2481, _2491, 1.0);
    float _2495 = _2439;
    if (!_2079)
    {
        float _2497 = rint(_2363);
        float _2499 = precise::max(_2497, 0.0);
        uint _2501 = uint(_2499);
        uint _2503 = clamp(_2501, 0u, 65535u);
        _2495 = as_type<float>(_2503);
    }
    float _2505 = _2495;
    float _2507 = fma(_1901, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2487);
    float _2509 = _2449;
    if (!_2079)
    {
        float _2511 = -_2449;
        float _2513 = _1895 + _2511;
        _2509 = _2513;
    }
    float _2515 = _2509;
    float _2517 = _2453 * _2243;
    float _2519 = _2403 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2521 = _2507 * _2395;
    float _2523 = fma(_2489, 0.5, 0.5);
    float _2525 = fma(_2485, 0.5, 0.5);
    float _2527 = _2479;
    if (_2437)
    {
        float _2529 = rint(_2479);
        float _2531 = precise::max(_2529, 0.0);
        uint _2533 = uint(_2531);
        uint _2535 = clamp(_2533, 0u, 65535u);
        _2527 = as_type<float>(_2535);
    }
    float _2537 = _2527;
    if (!_2079)
    {
        float _2539 = -_2473;
        float _2541 = _1935 + _2539;
        _2467 = _2541;
    }
    float _2543 = _2467;
    float _2545 = fma(_2521, -0.5, 0.5);
    float2 _6851 = float2(_2385, _1975);
    float _2547 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6851, float2(0.0), isnan(_6851)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6851, float2(0.0), isnan(_6851)), level(0.0)).x;
    float _2549 = _2505;
    if (!_2079)
    {
        float3 _6868 = float3(_2543, _2515, float(as_type<int>(_2505)));
        float3 _6872 = select(_6868, float3(0.0), isnan(_6868));
        float _2551 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _6872.xy, uint(rint(_6872.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _6872.xy, uint(rint(_6872.z)), level(0.0)).x;
        _2549 = _2551;
    }
    float _2553 = _2549;
    float _2555 = _2537;
    if (_2437)
    {
        float3 _6887 = float3(_2389, _2417, float(as_type<int>(_2537)));
        float3 _6889 = select(_6887, float3(0.0), isnan(_6887));
        float _2557 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _6889.xy, uint(rint(_6889.z)), _2517, level(0.0));
        _2555 = _2557;
    }
    float _2559 = _2555;
    float3 _6899 = float3(_2523, _2545, _2519);
    float _2561 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6899, float3(0.0), isnan(_6899)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6899, float3(0.0), isnan(_6899)), level(0.0)).x;
    float3 _6908 = float3(_2523, _2545, _2519);
    float4 _2563 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6908, float3(0.0), isnan(_6908)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6908, float3(0.0), isnan(_6908)), level(0.0)).xyzw;
    float _2565 = _2563.x;
    float _2567 = _2563.y;
    float _2569 = _2563.z;
    float _2571 = _2563.w;
    float2 _6924 = float2(_2493, _2525);
    float3 _2575 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6924, float2(0.0), isnan(_6924)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6924, float2(0.0), isnan(_6924)), level(0.0)).xyz;
    float _2577 = _2575.x;
    float _2579 = _2575.y;
    float _2581 = _2575.z;
    float _2583 = abs(_1919);
    float _2585 = log2(_2583);
    float _2587 = _2293 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_89.x = _1469;
    float _2589 = _2319 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2591 = fma(_2313, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2587);
    out.m_89.z = _1529;
    float _2593 = fma(_2059, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2591);
    float _2595 = exp2(_2589);
    float _2597 = fma(_1901, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2593);
    float _2599 = _2585 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2601 = _2597 + _2371;
    out.gl_Position.x = _2461;
    out.gl_Position.y = _2507;
    out.gl_Position.z = _2597;
    out.gl_Position.w = _2371;
    float _2603 = exp2(_2599);
    float _2605 = _2601 * 0.5;
    bool _2607 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2609 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2611 = _2607 || _2609;
    bool _2613 = isnan(0.5);
    bool _2615 = _2611 || _2613;
    out.m_91.z = _2605;
    out.m_91.w = _2371;
    float _2617 = fma(_2603, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2619 = precise::clamp(_2617, 0.0, 1.0);
    float _2621 = fma(_2619, -2.0, 3.0);
    float _2623 = _2619 * _2619;
    float _2625 = _2623 * _2621;
    bool _2627 = _1919 <= 8000.0;
    bool _2629 = isnan(_1919);
    bool _2631 = _2627 || _2629;
    bool _2633 = isnan(8000.0);
    bool _2635 = _2631 || _2633;
    float _2637 = float(_2635);
    float _2639 = -_2625;
    float _2641 = _2639 + 1.0;
    float _2643 = fma(_2641, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2625);
    float _2645 = _2637 * _2643;
    float _2647 = _2637;
    if (_2615)
    {
        _2647 = 1.0;
    }
    float _2649 = _2647;
    float _2651 = _2649;
    float _2653 = _2553;
    if (!_2615)
    {
        float _2655 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2657 = _2655 * 0.15915493667125701904296875;
        float _2659 = _2657 * 6.283185482025146484375;
        float _2661 = cos(_2659);
        float _2663 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2665 = _2663 * 0.15915493667125701904296875;
        float _2667 = _2657 * 6.283185482025146484375;
        float _2669 = sin(_2667);
        float _2671 = 1.0 / _2661;
        float _2673 = _2665 * 6.283185482025146484375;
        float _2675 = cos(_2673);
        float _2677 = _2669 * _2671;
        float _2679 = _2665 * 6.283185482025146484375;
        float _2681 = sin(_2679);
        float _2683 = _2675 * _2677;
        float _2685 = 1.0 / _2683;
        float _2687 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2689 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2687;
        float _2691 = 1.0 / _2689;
        float _2693 = _2681 * _2685;
        float _2695 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2697 = fma(_1919, _2693, _2695);
        float _2699 = _2697 * _2691;
        float _2701 = precise::clamp(_2699, 0.0, 1.0);
        _2469 = _2685;
        _2651 = _2701;
    }
    float _2703 = _2469;
    float _2705 = _2651;
    float _2707 = _2645 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2709 = -_2547;
    float _2711 = _2709 + 1.0;
    float _2713 = -_2595;
    float _2715 = _2713 + 1.0;
    float _2717 = _2703;
    if (!_2437)
    {
        _2717 = 1.0;
    }
    float _2719 = _2717;
    float _2721 = _2711 * _2707;
    float _2723 = precise::clamp(_2721, 0.0, 1.0);
    float _2725 = _2719;
    if (_2437)
    {
        bool _2727 = _2559 >= _2517;
        bool _2729 = isnan(_2559);
        bool _2731 = _2727 || _2729;
        bool _2733 = isnan(_2517);
        bool _2735 = _2731 || _2733;
        float _2737 = float(_2735);
        _2725 = _2737;
    }
    float _2739 = _2725;
    float _2741 = _2715 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2743 = _2739;
    if (_2079)
    {
        _1953 = 1.0;
    }
    float _2745 = _1953;
    float _2747 = _2745;
    if (!_2079)
    {
        int _2749 = _2119 << 4;
        int _2751 = _2749 + 2048;
        uint _2753 = uint(int(uint(_2751) >> uint(2)));
        uint _2755 = uint(int(uint(int(_2753)) >> uint(2)));
        int _2757 = int(_2753) & 3;
        float _2759 = (*spvDescriptorSet0.vp_c15)._m0[int(_2755)][_2757];
        int _2761 = int(_2753) + 1;
        uint _2763 = uint(int(uint(_2761) >> uint(2)));
        int _2765 = _2761 & 3;
        float _2767 = (*spvDescriptorSet0.vp_c15)._m0[int(_2763)][_2765];
        int _2769 = _2751 + 8;
        uint _2771 = uint(int(uint(_2769) >> uint(2)));
        uint _2773 = uint(int(uint(int(_2771)) >> uint(2)));
        int _2775 = int(_2771) & 3;
        float _2777 = (*spvDescriptorSet0.vp_c15)._m0[int(_2773)][_2775];
        int _2779 = int(_2771) + 1;
        uint _2781 = uint(int(uint(_2779) >> uint(2)));
        int _2783 = _2779 & 3;
        float _2785 = (*spvDescriptorSet0.vp_c15)._m0[int(_2781)][_2783];
        float _2787 = _1865 * _2767;
        float _2789 = fma(_1469, _2759, _2787);
        float _2791 = fma(_1529, _2777, _2789);
        float _2793 = _2791 + _2785;
        float _2795 = precise::clamp(_2793, 0.0, 1.0);
        float _2797 = -_2795;
        float _2799 = _2797 + _2553;
        float _2801 = fma(_2799, 500.0, 1.5);
        float _2803 = exp2(_2801);
        float _2805 = 0.0 + _2803;
        float _2807 = precise::clamp(_2805, 0.0, 1.0);
        _2747 = _2807;
        _1597 = _2803;
    }
    float _2809 = _2747;
    float _2811 = _1597;
    float _2813 = _2739 * _2809;
    float _2815 = _2741 * _2561;
    float _2817 = -_2723;
    float _2819 = fma(_2817, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2821 = -_2741;
    float _2823 = _2821 + 1.0;
    out.m_93.x = _1827;
    out.m_93.y = _1825;
    out.m_93.z = _1829;
    float _2825 = _2571 * _2815;
    float _2827 = -_2813;
    float _2829 = fma(_2827, _2819, 1.0);
    float _2831 = precise::clamp(_2829, 0.0, 1.0);
    float _2833 = _2581 * _2815;
    float _2835 = _2571 * _2823;
    float _2837 = fma(_2577, _2825, _2565);
    float _2839 = fma(_2579, _2825, _2567);
    float _2841 = _2831 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2843 = fma(_2571, _2833, _2569);
    bool _2845 = _1881 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2847 = isnan(_1881);
    bool _2849 = _2845 || _2847;
    bool _2851 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2853 = _2849 || _2851;
    float _2855 = _2705 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_95.x = _2841;
    out.m_97.x = _2837;
    out.m_97.y = _2839;
    out.m_97.z = _2843;
    out.m_97.w = _2835;
    float _2857 = _2823;
    float _2859 = _2811;
    float _2861 = _2825;
    float _2863 = _2831;
    if (!_2853)
    {
        _2857 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2865 = _2857;
    float _2867 = _2865;
    float _2869 = _2865;
    if (!_2853)
    {
        _2743 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2871 = _2743;
    float _2873 = _2871;
    float _2875 = _2871;
    if (!_2853)
    {
        _2653 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2877 = _2653;
    float _2879 = _2877;
    float _2881 = _2877;
    if (!_2853)
    {
        _2859 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2883 = _2859;
    float _2885 = _2883;
    float _2887 = _2883;
    if (!_2853)
    {
        _2861 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2889 = _2861;
    float _2891 = _2889;
    float _2893 = _2889;
    if (!_2853)
    {
        _2863 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2895 = _2863;
    bool _2897 = !_2853;
    float _2899 = _2895;
    float _2901 = _2895;
    if (!_2897)
    {
        bool _2903 = _1881 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2905 = isnan(_1881);
        bool _2907 = _2903 || _2905;
        bool _2909 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2911 = _2907 || _2909;
        if (!_2911)
        {
            float _2913 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2915 = _1881 + _2913;
            float _2917 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2919 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2917;
            float _2921 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2923 = _2921 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2925 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2927 = _2925 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2929 = 1.0 / _2919;
            float _2931 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2933 = _2931 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2935 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2937 = _2935 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2939 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2941 = _2939 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2943 = _2915 * _2929;
            float _2945 = precise::clamp(_2943, 0.0, 1.0);
            float _2947 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2949 = _2947 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2951 = fma(_2945, _2923, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2953 = fma(_2945, _2927, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2955 = fma(_2945, _2949, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2957 = fma(_2945, _2933, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2959 = fma(_2945, _2937, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2961 = fma(_2945, _2941, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2875 = _2953;
            _2893 = _2959;
            _2869 = _2951;
            _2887 = _2957;
            _2881 = _2955;
            _2901 = _2961;
            _2963 = true;
        }
        else
        {
            bool _2965 = _1881 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2967 = isnan(_1881);
            bool _2969 = _2965 || _2967;
            bool _2971 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2973 = _2969 || _2971;
            if (!_2973)
            {
                _2867 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2975 = _2867;
            _2869 = _2975;
            if (!_2973)
            {
                _2873 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2977 = _2873;
            _2875 = _2977;
            if (!_2973)
            {
                _2879 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2979 = _2879;
            _2881 = _2979;
            if (!_2973)
            {
                _2885 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2981 = _2885;
            _2887 = _2981;
            if (!_2973)
            {
                _2891 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2983 = _2891;
            _2893 = _2983;
            if (!_2973)
            {
                _2899 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2985 = _2899;
            bool _2987 = !_2973;
            _2901 = _2985;
            if (!_2987)
            {
                bool _2989 = _1881 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2991 = isnan(_1881);
                bool _2993 = _2989 || _2991;
                bool _2995 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2997 = _2993 || _2995;
                if (!_2997)
                {
                    float _2999 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3001 = _1881 + _2999;
                    float _3003 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3005 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3003;
                    float _3007 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3009 = _3007 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3011 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3013 = _3011 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3015 = 1.0 / _3005;
                    float _3017 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3019 = _3017 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3021 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3023 = _3021 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3025 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3027 = _3025 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3029 = _3001 * _3015;
                    float _3031 = precise::clamp(_3029, 0.0, 1.0);
                    float _3033 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3035 = _3033 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3037 = fma(_3031, _3009, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3039 = fma(_3031, _3013, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3041 = fma(_3031, _3035, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3043 = fma(_3031, _3019, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3045 = fma(_3031, _3023, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3047 = fma(_3031, _3027, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2875 = _3039;
                    _2893 = _3045;
                    _2869 = _3037;
                    _2887 = _3043;
                    _2881 = _3041;
                    _2901 = _3047;
                    _2963 = true;
                }
                else
                {
                    _2875 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2893 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2869 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2887 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2881 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2901 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2963 = false;
    float _3049 = _2875;
    float _3051 = _2893;
    float _3053 = _2869;
    float _3055 = _2887;
    float _3057 = _2881;
    float _3059 = _2901;
    float _3061 = fma(_1727, -0.5, 0.5);
    float _3063 = precise::clamp(_3061, 0.0, 1.0);
    float _3065 = -_3049;
    float _3067 = _3065 + _3051;
    float _3069 = _2855 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3071 = -_3053;
    float _3073 = _3071 + _3055;
    out.m_99.x = 0.0;
    float _3075 = fma(_3063, _3067, _3049);
    float _3077 = fma(_3063, _3073, _3053);
    out.m_63.x = _3069;
    float _3079 = -_3057;
    float _3081 = _3079 + _3059;
    float _3083 = _3075 * 0.586610972881317138671875;
    bool _3085 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3087 = fma(_3063, _3081, _3057);
    float _3089 = fma(_3077, 0.298911988735198974609375, _3083);
    bool _3091 = _2705 > 0.0;
    bool _3093 = isnan(_2705);
    bool _3095 = _3091 || _3093;
    bool _3097 = isnan(0.0);
    bool _3099 = _3095 || _3097;
    float _3101 = fma(_3087, 0.114477999508380889892578125, _3089);
    float _3103 = -_3101;
    float _3105 = _3077 + _3103;
    float _3107 = -_3101;
    float _3109 = _3075 + _3107;
    float _3111 = -_3101;
    float _3113 = _3087 + _3111;
    float _3115 = fma(_3105, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3101);
    float _3117 = fma(_3109, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3101);
    float _3119 = fma(_3113, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3101);
    bool _3121 = !_3085;
    if (!_3121)
    {
        float _3123 = -_1825;
        float _3125 = _3123 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3127 = -_1827;
        float _3129 = _3127 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3131 = -_1829;
        float _3133 = _3131 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3135 = _3125 * _3125;
        float _3137 = fma(_3129, _3129, _3135);
        float _3139 = fma(_3133, _3133, _3137);
        float _3141 = sqrt(_3139);
        float _3143 = rsqrt(_3139);
        float _3145 = -_3141;
        float _3147 = _3145 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3149 = _3147 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3151 = precise::clamp(_3149, 0.0, 1.0);
        float _3153 = _3129 * _3143;
        float _3155 = _3125 * _3143;
        float _3157 = abs(_3151);
        float _3159 = log2(_3157);
        float _3161 = _3133 * _3143;
        float _3163 = _3153 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3165 = _1727 * _3155;
        float _3167 = -_3155;
        float _3169 = -_3163;
        float _3171 = fma(_3167, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3169);
        float _3173 = fma(_1725, _3153, _3165);
        float _3175 = -_3161;
        float _3177 = fma(_3175, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3171);
        float _3179 = fma(_1729, _3161, _3173);
        float _3181 = precise::clamp(_3179, 0.0, 1.0);
        float _3183 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3185 = _3177 + _3183;
        float _3187 = _3159 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3189 = _3185 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3191 = precise::clamp(_3189, 0.0, 1.0);
        float _3193 = exp2(_3187);
        float _3195 = _3193 * _3191;
        float _3197 = _3181 * _3195;
        float _3199 = _3197 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3201 = _3197 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3203 = _3197 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_99.x = _3199;
        out.m_99.y = _3201;
        out.m_99.z = _3203;
    }
    out.m_101.x = _3115;
    out.m_101.y = _3117;
    out.m_101.z = _3119;
    if (_3099)
    {
        return out;
    }
    out.m_63.x = 0.0;
    float _3205 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3205;
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
    out.dm_pad9 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2963 = false;
    bool _1777 = false;
    bool _1045 = false;
    bool _853 = false;
    bool _359 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _121 = in.m_60.w;
    float _123 = trunc(_121);
    int _125 = int(_123);
    bool _129 = _125 >= 1;
    float _131 = 0.0;
    if (!_129)
    {
        _131 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _133 = _131;
    float _135 = _133;
    if (!_129)
    {
        out.m_63.x = 0.0;
    }
    int _137 = 0;
    if (!_129)
    {
        float _139 = _133 * 5.0;
        _137 = as_type<int>(_139);
    }
    int _141 = _137;
    int _143 = _141;
    if (!_129)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3262 = as_type<float>(_141);
        out.gl_Position.z = _3262;
    }
    if (!_129)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.dm_pad9.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.dm_pad9.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.dm_pad9.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.dm_pad9.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _145 = in.m_65.w;
    bool _147 = _145 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _149 = isnan(_145);
    bool _151 = _147 || _149;
    bool _153 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _155 = _151 || _153;
    float _157 = -_145;
    float _159 = _157 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _161 = 0.0;
    float _163 = _159;
    if (_155)
    {
        float _165 = float(_125);
        _161 = _165;
    }
    float _167 = _161;
    bool _169 = _159 >= _167;
    bool _171 = !_155;
    bool _173 = _169 || _171;
    if (_173)
    {
        _135 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _175 = _135;
    if (_173)
    {
        out.m_63.x = 0.0;
    }
    if (_173)
    {
        float _177 = _175 * 5.0;
        _143 = as_type<int>(_177);
    }
    int _179 = _143;
    if (_173)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3331 = as_type<float>(_179);
        out.gl_Position.z = _3331;
    }
    if (_173)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.dm_pad9.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.dm_pad9.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.dm_pad9.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.dm_pad9.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _181 = in.m_67.x;
    float _183 = in.m_67.y;
    float _185 = in.m_67.z;
    float _187 = in.m_69.x;
    float _189 = in.m_69.y;
    float _191 = in.m_69.z;
    float _193 = in.m_71.x;
    float _195 = in.m_71.y;
    float _197 = in.m_71.z;
    float _199 = _181 * _181;
    float _201 = _183 * _183;
    float _203 = _185 * _185;
    float _205 = fma(_187, _187, _199);
    float _207 = fma(_189, _189, _201);
    float _209 = fma(_191, _191, _203);
    float _211 = fma(_193, _193, _205);
    float _213 = fma(_195, _195, _207);
    float _215 = fma(_197, _197, _209);
    float _217 = sqrt(_211);
    float _219 = sqrt(_213);
    float _221 = sqrt(_215);
    bool _223 = _217 > 0.0;
    bool _225 = _219 > 0.0;
    float _227 = _219;
    float _229 = _217;
    float _231 = _211;
    float _233 = _215;
    if (_223)
    {
        float _235 = rsqrt(_211);
        _227 = _235;
    }
    float _237 = _227;
    float _239 = 0.0;
    float _241 = 0.0;
    if (!_223)
    {
        _239 = 0.0;
        _241 = 0.0;
    }
    float _243 = _239;
    float _245 = _241;
    bool _247 = _221 > 0.0;
    float _249 = 0.0;
    float _251 = _245;
    float _253 = _243;
    if (!_223)
    {
        _249 = 0.0;
    }
    float _255 = _249;
    float _257 = 0.0;
    float _259 = _255;
    if (!_225)
    {
        _257 = 0.0;
    }
    float _261 = _257;
    float _263 = 0.0;
    float _265 = _261;
    if (_225)
    {
        float _267 = rsqrt(_213);
        _263 = _267;
    }
    float _269 = _263;
    float _271 = 0.0;
    if (!_225)
    {
        _271 = 0.0;
    }
    float _273 = _271;
    float _275 = _273;
    if (!_225)
    {
        _229 = 0.0;
    }
    float _277 = _229;
    float _279 = _277;
    if (!_247)
    {
        _231 = 0.0;
    }
    float _281 = _231;
    float _283 = _221;
    float _285 = _281;
    if (_247)
    {
        float _287 = rsqrt(_215);
        _283 = _287;
    }
    float _289 = _283;
    float _291 = _237;
    if (_223)
    {
        float _293 = _237 * _187;
        _259 = _293;
    }
    float _295 = _259;
    if (_223)
    {
        float _297 = _237 * _181;
        _251 = _297;
    }
    float _299 = _251;
    if (_223)
    {
        float _301 = _237 * _193;
        _253 = _301;
    }
    float _303 = _253;
    bool _305 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    if (!_247)
    {
        _291 = 0.0;
    }
    float _307 = _291;
    float _309 = _307;
    if (_225)
    {
        float _311 = _269 * _189;
        _265 = _311;
    }
    float _313 = _265;
    if (!_247)
    {
        _233 = 0.0;
    }
    float _315 = _233;
    float _317 = _315;
    if (_225)
    {
        float _319 = _269 * _183;
        _275 = _319;
    }
    float _321 = _275;
    if (_225)
    {
        float _323 = _269 * _195;
        _279 = _323;
    }
    float _325 = _279;
    if (_247)
    {
        float _327 = _289 * _191;
        _317 = _327;
    }
    float _329 = _317;
    if (_247)
    {
        float _331 = _289 * _185;
        _309 = _331;
    }
    float _333 = _309;
    if (_247)
    {
        float _335 = _289 * _197;
        _285 = _335;
    }
    float _337 = _285;
    bool _339 = !_305;
    float _357;
    if (!_339)
    {
        float _341 = in.m_73.x;
        float _343 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _345 = _341 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _347 = fma(_345, (*spvDescriptorSet0.vp_c9)._m0[12].x, _159);
        float _349 = _347 * _343;
        float _351 = floor(_349);
        float _353 = -_351;
        float _355 = _349 + _353;
        _357 = _355;
        _359 = true;
    }
    else
    {
        float _361 = float(_125);
        float _363 = 1.0 / _361;
        float _365 = _159 * _363;
        _357 = _365;
    }
    _359 = false;
    float _367 = _357;
    int _369 = int2(spvDescriptorSet0.vp_t_tcb_C.get_width(), spvDescriptorSet0.vp_t_tcb_C.get_height()).x;
    int _371 = _369;
    int _373 = 0;
    int _375 = _116(_371, _373, (*spvDescriptorSet0.support_buffer));
    float _377 = in.m_73.x;
    float _379 = in.m_73.y;
    float _381 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[191].y;
    float _383 = in.m_75.z;
    float _385 = -_381;
    float _387 = _385 + (*spvDescriptorSet0.vp_c9)._m0[191].y;
    float _389 = fma((*spvDescriptorSet0.vp_c10)._m0[2].x, 0.0166666693985462188720703125, _377);
    float _391 = fma(_387, _379, _381);
    float _393 = _389 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _395 = trunc(_383);
    int _397 = int(_395);
    float _399 = _393 * _391;
    float _401 = float(_375);
    int _403 = abs(_375);
    bool _405 = _375 == 0;
    float _407 = _399 * _401;
    float _409 = float(uint(_403));
    float _411 = trunc(_407);
    int _413 = int(_411);
    float _415 = 1.0 / _409;
    int _417 = abs(_413);
    uint _420 = uint(int(uint(_413) >> uint(31)));
    float _422 = float(uint(_417));
    int _424 = ~int(_420);
    int _426 = _424 + 1;
    int _428 = as_type<int>(_415) + (-2);
    float _430 = as_type<float>(_428) * _422;
    float _432 = trunc(_430);
    float _434 = precise::max(_432, 0.0);
    uint _436 = uint(_434);
    int _438 = ~int(_436);
    int _440 = _438 + 1;
    int _442 = _440 * _403;
    int _444 = _442 + _417;
    float _446 = float(uint(_444));
    float _448 = as_type<float>(_428) * _446;
    float _450 = trunc(_448);
    float _452 = precise::max(_450, 0.0);
    uint _454 = uint(_452);
    int _456 = int(_436) + int(_454);
    int _458 = ~_456;
    int _460 = _458 + 1;
    int _462 = _460 * _403;
    int _464 = _462 + _417;
    bool _466 = uint(_464) >= uint(_403);
    bool _468 = !_466;
    int _470 = _468 ? 0 : (-1);
    int _472 = ~_456;
    int _474 = _472 + _470;
    int _476 = _474 + 1;
    int _478 = _476 * _403;
    int _480 = _478 + _417;
    int _482 = _480 ^ _426;
    int _484 = ~_426;
    int _486 = _484 + _482;
    int _488 = _486 + 1;
    bool _490 = !_405;
    int _492 = _490 ? _488 : (-1);
    int _494 = _492;
    int _496 = 0;
    int _498 = _117(_494, _496, (*spvDescriptorSet0.support_buffer));
    int _500 = _397;
    int _502 = 0;
    int _504 = _117(_500, _502, (*spvDescriptorSet0.support_buffer));
    float4 _507 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_498, _504)), 0).xyzw;
    float _509 = _507.x;
    float _511 = _507.y;
    float _513 = _507.z;
    float _515 = _507.w;
    float _517 = in.m_75.x;
    int _519 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _521 = _519 != 0;
    int _523 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _525 = _523 != 0;
    float _527 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _529 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _527;
    float _531 = 1.0 / _529;
    float _533 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    bool _535 = _367 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _537 = isnan(_367);
    bool _539 = _535 || _537;
    bool _541 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _543 = _539 || _541;
    float _545 = float(_543);
    float _547 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    bool _549 = _379 > 0.5;
    bool _551 = _549 && _525;
    float _553 = 0.0;
    float _555 = _517;
    if (_521)
    {
        float _557 = in.m_73.x;
        _553 = _557;
    }
    float _559 = _553;
    float _561 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _563 = _533 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _565 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _567 = _367 + _565;
    float _569 = _547 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _571 = _561 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _573 = _567 * _531;
    bool _575 = _367 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _577 = isnan(_367);
    bool _579 = _575 || _577;
    bool _581 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _583 = _579 || _581;
    float _585 = float(_583);
    float _587 = -_545;
    float _589 = _587 + 1.0;
    out.m_77.x = _563;
    out.m_77.y = _569;
    out.m_77.z = _571;
    float _591 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _593 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _591;
    int _595 = _492 + 1;
    float _597 = _585 * _589;
    float _599 = -_585;
    float _601 = _599 + 1.0;
    float _603 = fma(_593, _573, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _605 = _603 * _597;
    float _607 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    bool _609 = _559 > 0.5;
    bool _611 = _609 && _521;
    float _613 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _615 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _613;
    float _617 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _619 = _571;
    if (_521)
    {
        _619 = _517;
    }
    float _621 = _619;
    float _623 = fma(_615, _573, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _625 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _627 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _625;
    float _629 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _631 = _607 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _633 = fma(_627, _573, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    int _635 = abs(_595);
    float _637 = _621;
    if (_611)
    {
        float _639 = -_621;
        float _641 = _639 + 1.0;
        _637 = _641;
    }
    float _643 = _637;
    uint _645 = uint(int(uint(_595) >> uint(31)));
    float _647 = _633 * _597;
    float _649 = _623 * _597;
    float _651 = fma(_601, (*spvDescriptorSet0.vp_c9)._m0[143].x, _605);
    if (_521)
    {
        _555 = _643;
    }
    float _653 = _555;
    float _655 = fma(_601, (*spvDescriptorSet0.vp_c9)._m0[143].y, _647);
    float _657 = float(uint(_635));
    float _659 = fma(_545, (*spvDescriptorSet0.vp_c9)._m0[144].x, _651);
    float _661 = fma(_601, (*spvDescriptorSet0.vp_c9)._m0[143].z, _649);
    int _663 = ~int(_645);
    int _665 = _663 + 1;
    float _667 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _669 = as_type<float>(_428) * _657;
    float _671 = _617 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _673 = _629 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _675 = _653 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _677 = fma(_545, (*spvDescriptorSet0.vp_c9)._m0[144].y, _655);
    float _679 = fma(_545, (*spvDescriptorSet0.vp_c9)._m0[144].z, _661);
    float _681 = trunc(_669);
    float _683 = precise::max(_681, 0.0);
    uint _685 = uint(_683);
    out.m_79.x = _631;
    out.m_79.y = _671;
    out.m_79.z = _673;
    out.m_79.w = _667;
    int _687 = ~int(_685);
    int _689 = _687 + 1;
    int _691 = _689 * _403;
    int _693 = _691 + _635;
    float _695 = float(uint(_693));
    float _697 = as_type<float>(_428) * _695;
    float _699 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _701 = trunc(_697);
    float _703 = precise::max(_701, 0.0);
    uint _705 = uint(_703);
    int _707 = int(_685) + int(_705);
    int _709 = ~_707;
    int _711 = _709 + 1;
    int _713 = _711 * _403;
    int _715 = _713 + _635;
    bool _717 = uint(_715) >= uint(_403);
    bool _719 = !_717;
    int _721 = _719 ? 0 : (-1);
    int _723 = ~_707;
    int _725 = _723 + _721;
    int _727 = _725 + 1;
    int _729 = _727 * _403;
    int _731 = _729 + _635;
    float _733 = in.m_75.y;
    float _735 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _737 = _731 ^ _665;
    int _739 = ~_665;
    int _741 = _739 + _737;
    int _743 = _741 + 1;
    bool _745 = !_405;
    int _747 = _745 ? _743 : (-1);
    float _749 = _675 * _735;
    float _751 = _733;
    if (_551)
    {
        float _753 = -_733;
        float _755 = _753 + 1.0;
        _751 = _755;
    }
    float _757 = _751;
    float _759 = _757 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _761 = _759 * _699;
    uint _763 = as_type<uint>(half2(float2(_515, 0.0)));
    uint _765 = extract_bits(_763, 0u, 8u);
    int _767 = int(_765) & 255;
    uint _769 = extract_bits(_763, 8u, 8u);
    int _771 = int(_769) & 255;
    int _773 = _771 << 8;
    int _775 = _767 | _773;
    bool _777 = _775 >= 32768;
    int _779 = _775 + (-1024);
    int _781 = _779;
    float _783 = _761;
    if (_777)
    {
        int _785 = ~_775;
        int _787 = _785 + 33792;
        int _789 = _787 + 1;
        _781 = _789;
    }
    int _791 = _781;
    int _793 = _791 + 30719;
    float _795 = float(_793);
    float _797 = fma(_795, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _799 = abs(_797);
    float _801 = -_799;
    float _803 = _801 + 1.0;
    float _805 = abs(_797);
    float _807 = fma(_805, -0.0187292993068695068359375, 0.074261002242565155029296875);
    int _809 = as_type<int>(_803) + (-218103808);
    float _811 = abs(_797);
    float _813 = fma(_811, _807, -0.212114393711090087890625);
    bool _815 = uint(_809) >= 1920991232u;
    float _817 = abs(_797);
    float _819 = fma(_817, _813, 1.570728778839111328125);
    bool _821 = _797 < 0.0;
    float _823 = float(_821);
    bool _825 = !_815;
    float _851;
    if (!_825)
    {
        int _827 = as_type<int>(_803);
        int _829 = as_type<int>(_803);
        int _831 = _665;
        int _833 = 3616;
        int _835 = 0;
        int _837;
        int _839;
        int _841;
        int _843;
        int _845;
        int _847;
        int _849;
        _114(_827, _829, _831, _833, _835, _837, _839, _841, _843, _845, _847, _849, out.gl_Position, out.gl_PointSize);
        _851 = as_type<float>(_847);
        _853 = true;
    }
    else
    {
        float _855 = rsqrt(_803);
        float _857 = _803 * _855;
        float _859 = _855 * 0.5;
        float _861 = -_857;
        float _863 = 0.0 + _861;
        float _865 = fma(_859, _863, 0.5);
        float _867 = fma(_857, _865, _857);
        float _869 = -_867;
        float _871 = 0.0 + _869;
        float _873 = fma(_867, _871, _803);
        float _875 = fma(_859, _873, _867);
        _851 = _875;
    }
    _853 = false;
    float _877 = _851;
    int _879 = _747;
    int _881 = 0;
    int _883 = _117(_879, _881, (*spvDescriptorSet0.support_buffer));
    int _885 = _397;
    int _887 = 0;
    int _889 = _117(_885, _887, (*spvDescriptorSet0.support_buffer));
    float4 _891 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_883, _889)), 0).xyzw;
    float _893 = _891.x;
    float _895 = _891.y;
    float _897 = _891.z;
    float _899 = _891.w;
    float _901 = _819 * _877;
    float _903 = _823 * 2.0;
    float _905 = _795 * 3.883221149444580078125;
    float _907 = floor(_407);
    float _909 = -_903;
    float _911 = fma(_901, _909, _901);
    float _913 = _905 * 0.15915493667125701904296875;
    float _915 = fma(_823, 3.1415927410125732421875, _911);
    float _917 = _913 * 6.283185482025146484375;
    float _919 = cos(_917);
    float _921 = _915 * 0.15915493667125701904296875;
    float _923 = _921 * 6.283185482025146484375;
    float _925 = sin(_923);
    float _927 = -_907;
    float _929 = _407 + _927;
    float _931 = _925 * _919;
    float _933 = _913 * 6.283185482025146484375;
    float _935 = sin(_933);
    float _937 = _925 * _935;
    uint _939 = as_type<uint>(half2(float2(_899, 0.0)));
    float _941 = -_509;
    float _943 = _941 + _893;
    float _945 = -_513;
    float _947 = _945 + _897;
    uint _949 = extract_bits(_939, 0u, 8u);
    int _951 = int(_949) & 255;
    uint _953 = extract_bits(_939, 8u, 8u);
    int _955 = int(_953) & 255;
    int _957 = _955 << 8;
    int _959 = _951 | _957;
    float _961 = fma(_929, _943, _509);
    float _963 = fma(_929, _947, _513);
    bool _965 = _959 >= 32768;
    int _967 = _959 + (-1024);
    int _969 = _967;
    if (_965)
    {
        int _971 = ~_959;
        int _973 = _971 + 33792;
        int _975 = _973 + 1;
        _969 = _975;
    }
    int _977 = _969;
    int _979 = _977 + 30719;
    float _981 = float(_979);
    float _983 = fma(_981, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _985 = abs(_983);
    float _987 = -_985;
    float _989 = _987 + 1.0;
    bool _991 = _983 < 0.0;
    float _993 = float(_991);
    float _995 = abs(_983);
    float _997 = fma(_995, -0.0187292993068695068359375, 0.074261002242565155029296875);
    int _999 = as_type<int>(_989) + (-218103808);
    float _1001 = abs(_983);
    float _1003 = fma(_1001, _997, -0.212114393711090087890625);
    bool _1005 = uint(_999) >= 1920991232u;
    float _1007 = -_511;
    float _1009 = _1007 + _895;
    float _1011 = abs(_983);
    float _1013 = fma(_1011, _1003, 1.570728778839111328125);
    float _1015 = fma(_929, _1009, _511);
    bool _1017 = !_1005;
    float _1043;
    if (!_1017)
    {
        int _1019 = as_type<int>(_989);
        int _1021 = as_type<int>(_921);
        int _1023 = as_type<int>(_907);
        int _1025 = 4512;
        int _1027 = as_type<int>(_901);
        int _1029;
        int _1031;
        int _1033;
        int _1035;
        int _1037;
        int _1039;
        int _1041;
        _114(_1019, _1021, _1023, _1025, _1027, _1029, _1031, _1033, _1035, _1037, _1039, _1041, out.gl_Position, out.gl_PointSize);
        _1043 = as_type<float>(_1039);
        _1045 = true;
    }
    else
    {
        float _1047 = rsqrt(_989);
        float _1049 = _989 * _1047;
        float _1051 = _1047 * 0.5;
        float _1053 = -_1049;
        float _1055 = 0.0 + _1053;
        float _1057 = fma(_1051, _1055, 0.5);
        float _1059 = fma(_1049, _1057, _1049);
        float _1061 = -_1059;
        float _1063 = 0.0 + _1061;
        float _1065 = fma(_1059, _1063, _989);
        float _1067 = fma(_1051, _1065, _1059);
        _1043 = _1067;
    }
    _1045 = false;
    float _1069 = _1043;
    float _1071 = in.m_73.x;
    float _1073 = in.m_73.y;
    float _1075 = in.m_73.z;
    float _1077 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1079 = log2(_1077);
    float _1081 = _1013 * _1069;
    float _1083 = _981 * 3.883221149444580078125;
    float _1085 = -_797;
    float _1087 = _1085 + _983;
    float _1089 = _1079 * _159;
    float _1091 = exp2(_1089);
    float _1093 = _1075 * 2.0;
    float _1095 = _1071 * 2.0;
    float _1097 = _1073 * 2.0;
    float _1099 = floor(_1093);
    float _1101 = floor(_1095);
    float _1103 = -_1091;
    float _1105 = _1103 + 1.0;
    float _1107 = floor(_1097);
    bool _1109 = _1099 > 0.0;
    bool _1111 = _1099 >= 0.0;
    bool _1113 = isnan(_1099);
    bool _1115 = _1111 || _1113;
    bool _1117 = isnan(0.0);
    bool _1119 = _1115 || _1117;
    int _1121 = _1119 ? 0 : 1;
    int _1123 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1125 = _1123 != 0;
    int _1127 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1129 = _1127 != 0;
    int _1131 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1133 = _1131 != 0;
    int _1135 = ~_1121;
    int _1137 = _1135 + 1;
    int _1139 = _1137 + 1;
    bool _1141 = _1101 > 0.0;
    int _1143 = _1139;
    if (!_1109)
    {
        int _1145 = ~_1121;
        int _1147 = _1145 + 1;
        _1143 = _1147;
    }
    int _1149 = _1143;
    float _1151 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1153 = 1.0 + _1151;
    bool _1155 = _1101 >= 0.0;
    bool _1157 = isnan(_1101);
    bool _1159 = _1155 || _1157;
    bool _1161 = isnan(0.0);
    bool _1163 = _1159 || _1161;
    bool _1165 = _1107 > 0.0;
    float _1167 = 1.0 / _1153;
    bool _1169 = _1107 >= 0.0;
    bool _1171 = isnan(_1107);
    bool _1173 = _1169 || _1171;
    bool _1175 = isnan(0.0);
    bool _1177 = _1173 || _1175;
    float _1179 = in.m_81.x;
    float _1181 = in.m_81.y;
    float _1183 = in.m_81.z;
    bool _1185 = !_1125;
    int _1187 = _1185 ? 0 : 1;
    int _1189 = _1163 ? 0 : 1;
    bool _1191 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1193 = isnan(1.0);
    bool _1195 = _1191 || _1193;
    bool _1197 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1199 = _1195 || _1197;
    int _1201 = abs(_1187);
    float _1203 = _1073 + _1071;
    bool _1205 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1207 = isnan(0.0);
    bool _1209 = _1205 || _1207;
    bool _1211 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1213 = _1209 || _1211;
    float _1215 = float(_1201);
    float _1217 = _1203 + (-1.0);
    float _1219 = float(_1149);
    float _1221 = _1213 ? _1105 : 0.0;
    float _1223 = fma(_1217, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _1225 = _1177 ? 0 : 1;
    float _1227 = _1215 * _1219;
    float _1229 = _1071 + (-0.5);
    if (_1199)
    {
        float _1231 = _1221 * _1167;
        _163 = _1231;
    }
    float _1233 = _163;
    int _1235 = ~_1225;
    int _1237 = _1235 + 1;
    int _1239 = _1237 + 1;
    float _1241 = _1227 * (-2.0);
    bool _1243 = !_1133;
    int _1245 = _1243 ? 0 : 1;
    float _1247 = _1075 + _1071;
    bool _1249 = !_1129;
    int _1251 = _1249 ? 0 : 1;
    float _1253 = fma(_1241, _1179, _1179);
    int _1255 = abs(_1245);
    float _1257 = fma(_1223, _1241, _1223);
    int _1259 = _1239;
    if (!_1165)
    {
        int _1261 = ~_1225;
        int _1263 = _1261 + 1;
        _1259 = _1263;
    }
    int _1265 = _1259;
    float _1267 = fma(_1229, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1253);
    float _1269 = _1247 + (-1.0);
    int _1271 = abs(_1251);
    float _1273 = fma(_1257, _1233, _1267);
    float _1275 = float(_1255);
    float _1277 = float(_1265);
    float _1279 = _1273 * 0.15915493667125701904296875;
    int _1281 = ~_1189;
    int _1283 = _1281 + 1;
    int _1285 = _1283 + 1;
    float _1287 = _1275 * _1277;
    int _1289 = _1285;
    if (!_1141)
    {
        int _1291 = ~_1189;
        int _1293 = _1291 + 1;
        _1289 = _1293;
    }
    int _1295 = _1289;
    float _1297 = fma(_1269, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1299 = float(_1271);
    float _1301 = _1287 * (-2.0);
    float _1303 = float(_1295);
    float _1305 = _1075 + (-0.5);
    float _1307 = _1075 + _1073;
    float _1309 = fma(_1301, _1183, _1183);
    float _1311 = fma(_1297, _1301, _1297);
    float _1313 = _1299 * _1303;
    float _1315 = _1307 + (-1.0);
    float _1317 = fma(_1305, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1309);
    float _1319 = in.m_60.x;
    float _1321 = in.m_60.y;
    float _1323 = in.m_60.z;
    float _1325 = _1313 * (-2.0);
    float _1327 = _1073 + (-0.5);
    float _1329 = fma(_1311, _1233, _1317);
    float _1331 = in.m_69.x;
    float _1333 = in.m_69.y;
    float _1335 = in.m_69.z;
    float _1337 = fma(_1315, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1339 = _1279 * 6.283185482025146484375;
    float _1341 = sin(_1339);
    float _1343 = _1329 * 0.15915493667125701904296875;
    float _1345 = in.m_83.x;
    float _1347 = in.m_83.y;
    float _1349 = in.m_83.z;
    float _1351 = fma(_1325, _1181, _1181);
    float _1353 = fma(_1337, _1325, _1337);
    float _1355 = _993 * 2.0;
    float _1357 = in.m_71.x;
    float _1359 = in.m_71.y;
    float _1361 = in.m_71.z;
    float _1363 = fma(_1327, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1351);
    float _1365 = _1279 * 6.283185482025146484375;
    float _1367 = cos(_1365);
    float _1369 = -_1355;
    float _1371 = fma(_1081, _1369, _1081);
    bool _1373 = _1015 != 0.0;
    bool _1375 = isnan(_1015);
    bool _1377 = _1373 || _1375;
    bool _1379 = isnan(0.0);
    bool _1381 = _1377 || _1379;
    float _1383 = fma(_1353, _1233, _1363);
    float _1385 = fma(_993, 3.1415927410125732421875, _1371);
    bool _1387 = _961 == 0.0;
    bool _1389 = !_1381;
    bool _1391 = _1387 && _1389;
    float _1393 = _1383 * 0.15915493667125701904296875;
    float _1395 = _1343 * 6.283185482025146484375;
    float _1397 = sin(_1395);
    float _1399 = _1385 * 0.15915493667125701904296875;
    bool _1401 = _963 == 0.0;
    bool _1403 = _1401 && _1391;
    float _1405 = _1333 * _1321;
    float _1407 = _1393 * 6.283185482025146484375;
    float _1409 = cos(_1407);
    float _1411 = _677 * _1347;
    float _1413 = _679 * _1349;
    float _1415 = fma(_1331, _1319, _1405);
    float _1417 = _659 * _1345;
    float _1419 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1015);
    float _1421 = _1411 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1423 = _1343 * 6.283185482025146484375;
    float _1425 = cos(_1423);
    float _1427 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _963);
    float _1429 = _1413 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1431 = _1359 * _1321;
    float _1433 = fma(_1335, _1323, _1415);
    float _1435 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _961);
    float _1437 = _1417 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1439 = _1421 * _1419;
    float _1441 = _1393 * 6.283185482025146484375;
    float _1443 = sin(_1441);
    float _1445 = _1429 * _1427;
    float _1447 = fma(_1357, _1319, _1431);
    float _1449 = _1367 * _1397;
    float _1451 = _1341 * _1397;
    float _1453 = _1409 * _1397;
    float _1455 = _1437 * _1435;
    float _1457 = fma(_1361, _1323, _1447);
    float _1459 = _1367 * _1425;
    float _1461 = _1341 * _1425;
    float _1463 = _1341 * _1409;
    float _1465 = _1409 * _1425;
    float _1467 = _1367 * _1409;
    float _1469 = _1433 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1471 = _1399 * 6.283185482025146484375;
    float _1473 = sin(_1471);
    float _1475 = fma(_1443, _1451, _1459);
    float _1477 = -_1449;
    float _1479 = fma(_1443, _1461, _1477);
    float _1481 = -_1461;
    float _1483 = fma(_1443, _1449, _1481);
    float _1485 = _1463 * _1439;
    float _1487 = _1475 * _1439;
    float _1489 = _1479 * _1439;
    float _1491 = fma(_1443, _1459, _1451);
    float _1493 = -_1443;
    float _1495 = fma(_1493, _1455, _1485);
    float _1497 = fma(_1453, _1455, _1487);
    float _1499 = fma(_1465, _1455, _1489);
    float _1501 = fma(_1467, _1445, _1495);
    float _1503 = fma(_1483, _1445, _1497);
    float _1505 = fma(_1491, _1445, _1499);
    float _1507 = _1083 * 0.15915493667125701904296875;
    float _1509 = in.m_67.x;
    float _1511 = in.m_67.y;
    float _1513 = in.m_67.z;
    float _1515 = _1503 * _313;
    float _1517 = _1503 * _325;
    float _1519 = _1507 * 6.283185482025146484375;
    float _1521 = cos(_1519);
    float _1523 = _1503 * _321;
    float _1525 = fma(_1505, _295, _1515);
    float _1527 = fma(_1505, _303, _1517);
    float _1529 = _1457 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1531 = fma(_1505, _299, _1523);
    float _1533 = fma(_1501, _329, _1525);
    float _1535 = fma(_1501, _337, _1527);
    float _1537 = _1507 * 6.283185482025146484375;
    float _1539 = sin(_1537);
    float _1541 = fma(_1501, _333, _1531);
    float _1543 = _1469 + _1533;
    float _1545 = _1529 + _1535;
    float _1547 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1549 = _1543 + _1547;
    float _1551 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1553 = _1545 + _1551;
    float _1555 = -_931;
    float _1557 = fma(_1473, _1521, _1555);
    float _1559 = _1549 * _1549;
    float _1561 = _1553 * _1553;
    float _1563 = _1511 * _1321;
    float _1565 = _1559 + _1561;
    float _1567 = -_937;
    float _1569 = fma(_1473, _1539, _1567);
    float _1571 = fma(_1509, _1319, _1563);
    float _1573 = fma(_929, _1087, _797);
    float _1575 = sqrt(_1565);
    float _1577 = fma(_929, _1557, _931);
    float _1579 = fma(_1513, _1323, _1571);
    float _1581 = _1573;
    float _1583 = _1577;
    float _1585 = _1559;
    float _1587 = _1561;
    float _1589 = _1543;
    float _1591 = _1545;
    int _1593 = as_type<int>(_1439);
    int _1595 = as_type<int>(_1523);
    float _1597 = _1529;
    if (!_1403)
    {
        float _1599 = fma(_1015, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1573);
        _1581 = _1599;
    }
    float _1601 = _1581;
    float _1603 = fma(_929, _1569, _937);
    float _1605 = _1603;
    float _1607 = _1601;
    if (!_1403)
    {
        float _1609 = fma(_961, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1577);
        _1583 = _1609;
    }
    float _1611 = _1583;
    float _1613 = _1579 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1615 = _1463 * _1601;
    float _1617 = _1479 * _1601;
    float _1619 = _1475 * _1601;
    float _1621 = _1613 + _1541;
    if (!_1403)
    {
        float _1623 = fma(_963, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1603);
        _1605 = _1623;
    }
    float _1625 = _1605;
    bool _1627 = _1575 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    if (!_1627)
    {
        _1607 = _1621;
    }
    float _1629 = _1607;
    bool _1631 = !_1627;
    float _1633 = _1629;
    if (!_1631)
    {
        float _1635 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1637 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1639 = _1575 + _1637;
        float _1641 = rsqrt(_1565);
        float _1643 = _1639 * _1635;
        float _1645 = _1621 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1647 = _1643 * 0.15915493667125701904296875;
        float _1649 = _1647 * 6.283185482025146484375;
        float _1651 = sin(_1649);
        float _1653 = _1647 * 6.283185482025146484375;
        float _1655 = cos(_1653);
        float _1657 = fma(_1651, _1645, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1659 = _1641 * _1657;
        float _1661 = _1655 + (-1.0);
        float _1663 = _1549 * _1659;
        float _1665 = _1553 * _1659;
        float _1667 = _1661 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1669 = _1663 + (*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1671 = _1663 * _1663;
        float _1673 = _1665 + (*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1675 = fma(_1621, _1655, _1667);
        float _1677 = _1665 * _1665;
        _1633 = _1675;
        _1585 = _1671;
        _1587 = _1677;
        _1589 = _1669;
        _1591 = _1673;
    }
    float _1679 = _1633;
    float _1681 = _1585;
    float _1683 = _1587;
    float _1685 = _1589;
    float _1687 = _1591;
    float _1689 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1691 = _1679 + _1689;
    float _1693 = fma(_1453, _1611, _1619);
    float _1695 = fma(_1465, _1611, _1617);
    float _1697 = -_1443;
    float _1699 = fma(_1697, _1611, _1615);
    float _1701 = fma(_1691, _1691, _1681);
    float _1703 = fma(_1483, _1625, _1693);
    float _1705 = fma(_1491, _1625, _1695);
    float _1707 = fma(_1467, _1625, _1699);
    float _1709 = _1701 + _1683;
    float _1711 = _1703 * _313;
    float _1713 = _1703 * _321;
    float _1715 = _1703 * _325;
    out.m_85.x = _749;
    out.m_85.y = _761;
    float _1717 = fma(_1705, _295, _1711);
    float _1719 = sqrt(_1709);
    float _1721 = fma(_1705, _299, _1713);
    float _1723 = fma(_1705, _303, _1715);
    float _1725 = fma(_1707, _329, _1717);
    float _1727 = fma(_1707, _333, _1721);
    float _1729 = fma(_1707, _337, _1723);
    out.m_87.x = _1725;
    out.m_87.y = _1727;
    out.m_87.z = _1729;
    bool _1731 = _1719 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1733 = isnan(_1719);
    bool _1735 = _1731 || _1733;
    bool _1737 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1739 = _1735 || _1737;
    float _1741 = _1721;
    if (!_1739)
    {
        _1741 = 1.0;
    }
    float _1743 = _1741;
    bool _1745 = !_1739;
    float _1747 = _1743;
    if (!_1745)
    {
        bool _1749 = _1719 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1751 = isnan(_1719);
        bool _1753 = _1749 || _1751;
        bool _1755 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1757 = _1753 || _1755;
        if (!_1757)
        {
            float _1759 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1761 = _1719 + _1759;
            float _1763 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1765 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1763;
            float _1767 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1769 = _1767 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1771 = 1.0 / _1765;
            float _1773 = _1761 * _1771;
            float _1775 = fma(_1773, _1769, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1747 = _1775;
            _1777 = true;
        }
        else
        {
            bool _1779 = _1719 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1781 = isnan(_1719);
            bool _1783 = _1779 || _1781;
            bool _1785 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1787 = _1783 || _1785;
            if (!_1787)
            {
                float _1789 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1791 = _1719 + _1789;
                float _1793 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1795 = _1793 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1797 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1799 = _1797 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1801 = 1.0 / _1795;
                float _1803 = _1791 * _1801;
                float _1805 = fma(_1803, _1799, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1747 = _1805;
                _1777 = true;
            }
            else
            {
                _1747 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1777 = false;
    float _1807 = _1747;
    float _1809 = _1613 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1811 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1813 = _1679 + _1811;
    float _1815 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1817 = _1685 + _1815;
    float _1819 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1821 = _1687 + _1819;
    float _1823 = fma(_1469, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1809);
    float _1825 = fma(_1813, _1807, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1827 = fma(_1817, _1807, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1829 = fma(_1821, _1807, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1831 = fma(_1529, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1823);
    float _1833 = _1613 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1835 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1837 = _1825 + _1835;
    float _1839 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1841 = _1827 + _1839;
    float _1843 = _1831 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1845 = fma(_1469, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1833);
    float _1847 = _1837 * _1837;
    float _1849 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1851 = _1829 + _1849;
    float _1853 = 1.0 / _1843;
    float _1855 = fma(_1529, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1845);
    float _1857 = fma(_1841, _1841, _1847);
    float _1859 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _1861 = _1855 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1863 = fma(_1851, _1851, _1857);
    float _1865 = _1613 + _1859;
    float _1867 = _1861 + _1843;
    float _1869 = rsqrt(_1863);
    float _1871 = _1865 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1873 = _1825 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1875 = _1867 * _1853;
    float _1877 = _1875 * 0.5;
    float _1879 = fma(_1469, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1871);
    float _1881 = sqrt(_1863);
    float _1883 = fma(_1827, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1873);
    float _1885 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1887 = fma(_1877, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1885);
    float _1889 = fma(_1529, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1879);
    float _1891 = fma(_1529, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1893 = fma(_1829, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1883);
    float _1895 = _1889 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _1897 = 1.0 / _1887;
    float _1899 = _1869 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1901 = _1893 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1903 = _1841 * _1899;
    float _1905 = _1851 * _1899;
    float _1907 = trunc(_1895);
    int _1909 = int(_1907);
    float _1911 = _1903 * _1903;
    float _1913 = _1905 * _1905;
    float _1915 = _1911 + _1913;
    float _1917 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1919 = _1897 * _1917;
    float _1921 = _1865 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1923 = sqrt(_1915);
    bool _1925 = _1919 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _1927 = fma(_1469, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1921);
    bool _1929 = _1919 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _1931 = fma(_1529, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1927);
    float _1933 = floor(_1891);
    float _1935 = _1931 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    bool _1937 = !_1925;
    int _1939 = _1937 ? 0 : 1;
    int _1941 = 2;
    int _1943 = as_type<int>(_1837);
    float _1945 = _1903;
    float _1947 = _1905;
    float _1949 = _1911;
    float _1951 = _1913;
    float _1953 = _1919;
    if (!_1925)
    {
        _1941 = 1;
    }
    int _1955 = _1941;
    float _1957 = trunc(_1935);
    int _1959 = int(_1957);
    int _1961 = _1955;
    if (!_1929)
    {
        _1961 = _1939;
    }
    int _1963 = _1961;
    bool _1965 = _1923 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1967 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1969 = _1923 + _1967;
    int _1971 = _1963 << 6;
    float _1973 = -_1933;
    float _1975 = _1891 + _1973;
    int _1977 = _1971 + 96;
    uint _1979 = uint(int(uint(_1977) >> uint(2)));
    uint _1981 = uint(int(uint(int(_1979)) >> uint(2)));
    int _1983 = int(_1979) & 3;
    float _1985 = (*spvDescriptorSet0.vp_c15)._m0[int(_1981)][_1983];
    int _1987 = int(_1979) + 1;
    uint _1989 = uint(int(uint(_1987) >> uint(2)));
    int _1991 = _1987 & 3;
    float _1993 = (*spvDescriptorSet0.vp_c15)._m0[int(_1989)][_1991];
    float _1995 = _1693;
    float _1997 = _1969;
    if (_1965)
    {
        float _1999 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1995 = _1999;
    }
    float _2001 = _1995;
    int _2003 = _1971 + 104;
    uint _2005 = uint(int(uint(_2003) >> uint(2)));
    uint _2007 = uint(int(uint(int(_2005)) >> uint(2)));
    int _2009 = int(_2005) & 3;
    float _2011 = (*spvDescriptorSet0.vp_c15)._m0[int(_2007)][_2009];
    int _2013 = int(_2005) + 1;
    uint _2015 = uint(int(uint(_2013) >> uint(2)));
    int _2017 = _2013 & 3;
    float _2019 = (*spvDescriptorSet0.vp_c15)._m0[int(_2015)][_2017];
    if (_1965)
    {
        float _2021 = _1969 * _2001;
        _1997 = _2021;
    }
    float _2023 = _1997;
    int _2025 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _2027 = _1909 + _2025;
    int _2029 = _2027 + 1;
    float _2031 = _1825 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (_1965)
    {
        float _2033 = _2023 * 0.15915493667125701904296875;
        _783 = _2033;
    }
    float _2035 = _783;
    int _2037 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _2039 = _1959 + _2037;
    int _2041 = _2039 + 1;
    float _2043 = fma(_1827, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2031);
    float _2045 = _313;
    if (_1965)
    {
        float _2047 = _2035 * 6.283185482025146484375;
        float _2049 = cos(_2047);
        _2045 = _2049;
    }
    float _2051 = _2045;
    bool _2053 = _2041 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _2055 = fma(_1829, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2043);
    int _2057 = _2041 | _2029;
    float _2059 = _2055 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    bool _2061 = _2057 < 0;
    bool _2063 = _2061 || _2053;
    float _2065 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2067 = _749;
    if (_1965)
    {
        float _2069 = _2035 * 6.283185482025146484375;
        float _2071 = sin(_2069);
        _2067 = _2071;
    }
    float _2073 = _2067;
    float _2075 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    bool _2077 = _2029 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _2079 = _2077 || _2063;
    float _2081 = _2059 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2083 = precise::max(0.0, _2065);
    float _2085 = -_2081;
    float _2087 = fma(_2085, _2075, 1.0);
    float _2089 = _2055;
    if (_1965)
    {
        float _2091 = rsqrt(_1915);
        _2089 = _2091;
    }
    float _2093 = _2089;
    float _2095 = -_1899;
    float _2097 = -_2083;
    float _2099 = fma(_1837, _2095, _2097);
    float _2101 = _1865 * _1993;
    float _2103 = _1993;
    float _2105 = _2101;
    float _2107 = _2099;
    if (_1965)
    {
        float _2109 = _2099 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2103 = _2109;
    }
    float _2111 = _2103;
    float _2113 = fma(_1469, _1985, _2101);
    if (!_2079)
    {
        int _2115 = _2029 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _2117 = _2115 + _2041;
        _1943 = _2117;
    }
    int _2119 = _1943;
    if (_1965)
    {
        float _2121 = _2051 + (-1.0);
        _2105 = _2121;
    }
    float _2123 = _2105;
    int _2125 = _1971 + 48;
    uint _2127 = uint(int(uint(_2125) >> uint(2)));
    uint _2129 = uint(int(uint(int(_2127)) >> uint(2)));
    int _2131 = int(_2127) & 3;
    float _2133 = (*spvDescriptorSet0.vp_c15)._m0[int(_2129)][_2131];
    int _2135 = int(_2127) + 1;
    uint _2137 = uint(int(uint(_2135) >> uint(2)));
    int _2139 = _2135 & 3;
    float _2141 = (*spvDescriptorSet0.vp_c15)._m0[int(_2137)][_2139];
    float _2143 = _2073;
    float _2145 = _2123;
    if (_1965)
    {
        float _2147 = fma(_2073, _2111, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2143 = _2147;
    }
    float _2149 = _2143;
    float _2151 = fma(_1529, _2011, _2113);
    if (_1965)
    {
        float _2153 = _2123 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2145 = _2153;
    }
    float _2155 = _2145;
    float _2157 = _1825 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    if (!_2079)
    {
        int _2159 = _2119 << 2;
        _1593 = _2159;
    }
    int _2161 = _1593;
    float _2163 = _2093;
    int _2165 = _2161;
    if (_1965)
    {
        float _2167 = _2093 * _2149;
        _2163 = _2167;
    }
    float _2169 = _2163;
    if (_1965)
    {
        float _2171 = fma(_2099, _2051, _2155);
        _2107 = _2171;
    }
    float _2173 = _2107;
    int _2175 = _1971 + 56;
    uint _2177 = uint(int(uint(_2175) >> uint(2)));
    uint _2179 = uint(int(uint(int(_2177)) >> uint(2)));
    int _2181 = int(_2177) & 3;
    float _2183 = (*spvDescriptorSet0.vp_c15)._m0[int(_2179)][_2181];
    int _2185 = int(_2177) + 1;
    uint _2187 = uint(int(uint(_2185) >> uint(2)));
    int _2189 = _2185 & 3;
    float _2191 = (*spvDescriptorSet0.vp_c15)._m0[int(_2187)][_2189];
    float _2193 = fma(_1469, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    if (_1965)
    {
        float _2195 = _1903 * _2169;
        _1945 = _2195;
    }
    float _2197 = _1945;
    if (_1965)
    {
        float _2199 = _1905 * _2169;
        _1947 = _2199;
    }
    float _2201 = _1947;
    float _2203 = _2151 + _2019;
    if (!_2079)
    {
        uint _2205 = uint(int(uint(_2119) >> uint(2)));
        _1595 = int(_2205);
    }
    int _2207 = _1595;
    if (_1965)
    {
        float _2209 = _2197 * _2197;
        _1949 = _2209;
    }
    float _2211 = _1949;
    if (_1965)
    {
        float _2213 = _2201 * _2201;
        _1951 = _2213;
    }
    float _2215 = _1951;
    int _2217 = _1971 + 64;
    uint _2219 = uint(int(uint(_2217) >> uint(2)));
    uint _2221 = uint(int(uint(int(_2219)) >> uint(2)));
    int _2223 = int(_2219) & 3;
    float _2225 = (*spvDescriptorSet0.vp_c15)._m0[int(_2221)][_2223];
    int _2227 = int(_2219) + 1;
    uint _2229 = uint(int(uint(_2227) >> uint(2)));
    int _2231 = _2227 & 3;
    float _2233 = (*spvDescriptorSet0.vp_c15)._m0[int(_2229)][_2231];
    if (!_2079)
    {
        int _2235 = 12 & _2161;
        _2165 = _2235;
    }
    int _2237 = _2165;
    float _2239 = fma(_2173, _2173, _2211);
    float _2241 = _1825 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2243 = 1.0 / _2203;
    int _2245 = _2237;
    if (!_2079)
    {
        int _2247 = _2207 << 4;
        int _2249 = _2247 + _2237;
        _2245 = _2249;
    }
    int _2251 = _2245;
    float _2253 = _2239 + _2215;
    float _2255 = fma(_1827, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2241);
    int _2257 = _1971 + 72;
    uint _2259 = uint(int(uint(_2257) >> uint(2)));
    uint _2261 = uint(int(uint(int(_2259)) >> uint(2)));
    int _2263 = int(_2259) & 3;
    float _2265 = (*spvDescriptorSet0.vp_c15)._m0[int(_2261)][_2263];
    int _2267 = int(_2259) + 1;
    uint _2269 = uint(int(uint(_2267) >> uint(2)));
    int _2271 = _2267 & 3;
    float _2273 = (*spvDescriptorSet0.vp_c15)._m0[int(_2269)][_2271];
    float _2275 = fma(_1827, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2157);
    float _2277 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2279 = fma(_1881, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2277);
    float _2281 = precise::clamp(_2279, 0.0, 1.0);
    float _2283 = fma(_1829, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2255);
    float _2285 = rsqrt(_2253);
    float _2287 = fma(_1829, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2275);
    float _2289 = -_2281;
    float _2291 = _2289 + 1.0;
    float _2293 = _2283 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    int _2295 = _1971 + 80;
    uint _2297 = uint(int(uint(_2295) >> uint(2)));
    uint _2299 = uint(int(uint(int(_2297)) >> uint(2)));
    int _2301 = int(_2297) & 3;
    float _2303 = (*spvDescriptorSet0.vp_c15)._m0[int(_2299)][_2301];
    int _2305 = int(_2297) + 1;
    uint _2307 = uint(int(uint(_2305) >> uint(2)));
    int _2309 = _2305 & 3;
    float _2311 = (*spvDescriptorSet0.vp_c15)._m0[int(_2307)][_2309];
    float _2313 = _2287 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2315 = _2293 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2317 = abs(_2291);
    float _2319 = log2(_2317);
    float _2321 = fma(_2313, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2315);
    int _2323 = _1971 + 88;
    uint _2325 = uint(int(uint(_2323) >> uint(2)));
    uint _2327 = uint(int(uint(int(_2325)) >> uint(2)));
    int _2329 = int(_2325) & 3;
    float _2331 = (*spvDescriptorSet0.vp_c15)._m0[int(_2327)][_2329];
    int _2333 = int(_2325) + 1;
    uint _2335 = uint(int(uint(_2333) >> uint(2)));
    int _2337 = _2333 & 3;
    float _2339 = (*spvDescriptorSet0.vp_c15)._m0[int(_2335)][_2337];
    float _2341 = fma(_2059, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2321);
    float _2343 = _2285 * _2197;
    float _2345 = floor(_2193);
    float _2347 = _2285 * _2173;
    float _2349 = _1865 * _2141;
    float _2351 = _2321;
    if (!_2079)
    {
        int _2353 = _2251 + 400;
        uint _2355 = uint(int(uint(_2353) >> uint(2)));
        uint _2357 = uint(int(uint(int(_2355)) >> uint(2)));
        int _2359 = int(_2355) & 3;
        float _2361 = (*spvDescriptorSet0.vp_c15)._m0[int(_2357)][_2359];
        _2351 = _2361;
    }
    float _2363 = _2351;
    float _2365 = _2343 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2367 = _2285 * _2201;
    float _2369 = fma(_1469, _2133, _2349);
    float _2371 = fma(_1901, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2341);
    float _2373 = log2(_2087);
    float _2375 = fma(_1529, _2183, _2369);
    float _2377 = _2375 + _2191;
    float _2379 = -_2365;
    float _2381 = fma(_2347, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2379);
    float _2383 = -_2345;
    float _2385 = _2193 + _2383;
    float _2387 = _1865 * _2233;
    float _2389 = _2377 * _2243;
    float _2391 = -_2367;
    float _2393 = fma(_2391, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2381);
    float _2395 = 1.0 / _2371;
    float _2397 = fma(_1469, _2225, _2387);
    float _2399 = _2319 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    bool _2401 = _2389 >= 0.0;
    float _2403 = _2373 * 0.693147182464599609375;
    float _2405 = fma(_1529, _2265, _2397);
    float _2407 = fma(_2393, -0.5, 0.5);
    bool _2409 = _2389 <= 1.0;
    bool _2411 = _2409 && _2401;
    float _2413 = exp2(_2399);
    float _2415 = _2405 + _2273;
    float _2417 = _2415 * _2243;
    float _2419 = _1865 * _2311;
    float _2421 = _2293 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2423 = sqrt(_2407);
    bool _2425 = _2417 >= 0.0;
    bool _2427 = _2425 && _2411;
    float _2429 = fma(_1469, _2303, _2419);
    float _2431 = fma(_2393, 0.5, 0.5);
    float _2433 = fma(_2313, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2421);
    bool _2435 = _2417 <= 1.0;
    bool _2437 = _2435 && _2427;
    float _2439 = fma(_1529, _2331, _2429);
    float _2441 = fma(_2431, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2443 = _2367;
    float _2445 = _2431;
    if (!_2079)
    {
        float _2447 = floor(_1895);
        _2443 = _2447;
    }
    float _2449 = _2443;
    float _2451 = fma(_2059, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2433);
    float _2453 = _2439 + _2339;
    float _2455 = fma(_2431, _2441, -0.212114393711090087890625);
    float _2457 = _2293 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2459 = _2347 + 1.0;
    float _2461 = fma(_1901, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2451);
    float _2463 = fma(_2431, _2455, 1.570728778839111328125);
    float _2465 = _2393;
    float _2467 = _2459;
    float _2469 = _2461;
    if (!_2079)
    {
        float _2471 = floor(_1935);
        _2465 = _2471;
    }
    float _2473 = _2465;
    float _2475 = fma(_2313, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2457);
    if (_2437)
    {
        float _2477 = float(_1963);
        _2445 = _2477;
    }
    float _2479 = _2445;
    float _2481 = _2423 * 0.636619746685028076171875;
    float _2483 = -_2347;
    float _2485 = fma(_2413, _2459, _2483);
    float _2487 = fma(_2059, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2475);
    float _2489 = _2461 * _2395;
    float _2491 = -_2463;
    float _2493 = fma(_2481, _2491, 1.0);
    float _2495 = _2439;
    if (!_2079)
    {
        float _2497 = rint(_2363);
        float _2499 = precise::max(_2497, 0.0);
        uint _2501 = uint(_2499);
        uint _2503 = clamp(_2501, 0u, 65535u);
        _2495 = as_type<float>(_2503);
    }
    float _2505 = _2495;
    float _2507 = fma(_1901, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2487);
    float _2509 = _2449;
    if (!_2079)
    {
        float _2511 = -_2449;
        float _2513 = _1895 + _2511;
        _2509 = _2513;
    }
    float _2515 = _2509;
    float _2517 = _2453 * _2243;
    float _2519 = _2403 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2521 = _2507 * _2395;
    float _2523 = fma(_2489, 0.5, 0.5);
    float _2525 = fma(_2485, 0.5, 0.5);
    float _2527 = _2479;
    if (_2437)
    {
        float _2529 = rint(_2479);
        float _2531 = precise::max(_2529, 0.0);
        uint _2533 = uint(_2531);
        uint _2535 = clamp(_2533, 0u, 65535u);
        _2527 = as_type<float>(_2535);
    }
    float _2537 = _2527;
    if (!_2079)
    {
        float _2539 = -_2473;
        float _2541 = _1935 + _2539;
        _2467 = _2541;
    }
    float _2543 = _2467;
    float _2545 = fma(_2521, -0.5, 0.5);
    float2 _6851 = float2(_2385, _1975);
    float _2547 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6851, float2(0.0), isnan(_6851)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6851, float2(0.0), isnan(_6851)), level(0.0)).x;
    float _2549 = _2505;
    if (!_2079)
    {
        float3 _6868 = float3(_2543, _2515, float(as_type<int>(_2505)));
        float3 _6872 = select(_6868, float3(0.0), isnan(_6868));
        float _2551 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _6872.xy, uint(rint(_6872.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _6872.xy, uint(rint(_6872.z)), level(0.0)).x;
        _2549 = _2551;
    }
    float _2553 = _2549;
    float _2555 = _2537;
    if (_2437)
    {
        float3 _6887 = float3(_2389, _2417, float(as_type<int>(_2537)));
        float3 _6889 = select(_6887, float3(0.0), isnan(_6887));
        float _2557 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _6889.xy, uint(rint(_6889.z)), _2517, level(0.0));
        _2555 = _2557;
    }
    float _2559 = _2555;
    float3 _6899 = float3(_2523, _2545, _2519);
    float _2561 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6899, float3(0.0), isnan(_6899)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6899, float3(0.0), isnan(_6899)), level(0.0)).x;
    float3 _6908 = float3(_2523, _2545, _2519);
    float4 _2563 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6908, float3(0.0), isnan(_6908)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6908, float3(0.0), isnan(_6908)), level(0.0)).xyzw;
    float _2565 = _2563.x;
    float _2567 = _2563.y;
    float _2569 = _2563.z;
    float _2571 = _2563.w;
    float2 _6924 = float2(_2493, _2525);
    float3 _2575 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6924, float2(0.0), isnan(_6924)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6924, float2(0.0), isnan(_6924)), level(0.0)).xyz;
    float _2577 = _2575.x;
    float _2579 = _2575.y;
    float _2581 = _2575.z;
    float _2583 = abs(_1919);
    float _2585 = log2(_2583);
    float _2587 = _2293 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_89.x = _1469;
    float _2589 = _2319 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2591 = fma(_2313, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2587);
    out.m_89.z = _1529;
    float _2593 = fma(_2059, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2591);
    float _2595 = exp2(_2589);
    float _2597 = fma(_1901, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2593);
    float _2599 = _2585 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2601 = _2597 + _2371;
    out.gl_Position.x = _2461;
    out.gl_Position.y = _2507;
    out.gl_Position.z = _2597;
    out.gl_Position.w = _2371;
    float _2603 = exp2(_2599);
    float _2605 = _2601 * 0.5;
    bool _2607 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2609 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2611 = _2607 || _2609;
    bool _2613 = isnan(0.5);
    bool _2615 = _2611 || _2613;
    out.m_91.z = _2605;
    out.m_91.w = _2371;
    float _2617 = fma(_2603, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2619 = precise::clamp(_2617, 0.0, 1.0);
    float _2621 = fma(_2619, -2.0, 3.0);
    float _2623 = _2619 * _2619;
    float _2625 = _2623 * _2621;
    bool _2627 = _1919 <= 8000.0;
    bool _2629 = isnan(_1919);
    bool _2631 = _2627 || _2629;
    bool _2633 = isnan(8000.0);
    bool _2635 = _2631 || _2633;
    float _2637 = float(_2635);
    float _2639 = -_2625;
    float _2641 = _2639 + 1.0;
    float _2643 = fma(_2641, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2625);
    float _2645 = _2637 * _2643;
    float _2647 = _2637;
    if (_2615)
    {
        _2647 = 1.0;
    }
    float _2649 = _2647;
    float _2651 = _2649;
    float _2653 = _2553;
    if (!_2615)
    {
        float _2655 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2657 = _2655 * 0.15915493667125701904296875;
        float _2659 = _2657 * 6.283185482025146484375;
        float _2661 = cos(_2659);
        float _2663 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2665 = _2663 * 0.15915493667125701904296875;
        float _2667 = _2657 * 6.283185482025146484375;
        float _2669 = sin(_2667);
        float _2671 = 1.0 / _2661;
        float _2673 = _2665 * 6.283185482025146484375;
        float _2675 = cos(_2673);
        float _2677 = _2669 * _2671;
        float _2679 = _2665 * 6.283185482025146484375;
        float _2681 = sin(_2679);
        float _2683 = _2675 * _2677;
        float _2685 = 1.0 / _2683;
        float _2687 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2689 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2687;
        float _2691 = 1.0 / _2689;
        float _2693 = _2681 * _2685;
        float _2695 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2697 = fma(_1919, _2693, _2695);
        float _2699 = _2697 * _2691;
        float _2701 = precise::clamp(_2699, 0.0, 1.0);
        _2469 = _2685;
        _2651 = _2701;
    }
    float _2703 = _2469;
    float _2705 = _2651;
    float _2707 = _2645 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2709 = -_2547;
    float _2711 = _2709 + 1.0;
    float _2713 = -_2595;
    float _2715 = _2713 + 1.0;
    float _2717 = _2703;
    if (!_2437)
    {
        _2717 = 1.0;
    }
    float _2719 = _2717;
    float _2721 = _2711 * _2707;
    float _2723 = precise::clamp(_2721, 0.0, 1.0);
    float _2725 = _2719;
    if (_2437)
    {
        bool _2727 = _2559 >= _2517;
        bool _2729 = isnan(_2559);
        bool _2731 = _2727 || _2729;
        bool _2733 = isnan(_2517);
        bool _2735 = _2731 || _2733;
        float _2737 = float(_2735);
        _2725 = _2737;
    }
    float _2739 = _2725;
    float _2741 = _2715 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2743 = _2739;
    if (_2079)
    {
        _1953 = 1.0;
    }
    float _2745 = _1953;
    float _2747 = _2745;
    if (!_2079)
    {
        int _2749 = _2119 << 4;
        int _2751 = _2749 + 2048;
        uint _2753 = uint(int(uint(_2751) >> uint(2)));
        uint _2755 = uint(int(uint(int(_2753)) >> uint(2)));
        int _2757 = int(_2753) & 3;
        float _2759 = (*spvDescriptorSet0.vp_c15)._m0[int(_2755)][_2757];
        int _2761 = int(_2753) + 1;
        uint _2763 = uint(int(uint(_2761) >> uint(2)));
        int _2765 = _2761 & 3;
        float _2767 = (*spvDescriptorSet0.vp_c15)._m0[int(_2763)][_2765];
        int _2769 = _2751 + 8;
        uint _2771 = uint(int(uint(_2769) >> uint(2)));
        uint _2773 = uint(int(uint(int(_2771)) >> uint(2)));
        int _2775 = int(_2771) & 3;
        float _2777 = (*spvDescriptorSet0.vp_c15)._m0[int(_2773)][_2775];
        int _2779 = int(_2771) + 1;
        uint _2781 = uint(int(uint(_2779) >> uint(2)));
        int _2783 = _2779 & 3;
        float _2785 = (*spvDescriptorSet0.vp_c15)._m0[int(_2781)][_2783];
        float _2787 = _1865 * _2767;
        float _2789 = fma(_1469, _2759, _2787);
        float _2791 = fma(_1529, _2777, _2789);
        float _2793 = _2791 + _2785;
        float _2795 = precise::clamp(_2793, 0.0, 1.0);
        float _2797 = -_2795;
        float _2799 = _2797 + _2553;
        float _2801 = fma(_2799, 500.0, 1.5);
        float _2803 = exp2(_2801);
        float _2805 = 0.0 + _2803;
        float _2807 = precise::clamp(_2805, 0.0, 1.0);
        _2747 = _2807;
        _1597 = _2803;
    }
    float _2809 = _2747;
    float _2811 = _1597;
    float _2813 = _2739 * _2809;
    float _2815 = _2741 * _2561;
    float _2817 = -_2723;
    float _2819 = fma(_2817, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2821 = -_2741;
    float _2823 = _2821 + 1.0;
    out.m_93.x = _1827;
    out.m_93.y = _1825;
    out.m_93.z = _1829;
    float _2825 = _2571 * _2815;
    float _2827 = -_2813;
    float _2829 = fma(_2827, _2819, 1.0);
    float _2831 = precise::clamp(_2829, 0.0, 1.0);
    float _2833 = _2581 * _2815;
    float _2835 = _2571 * _2823;
    float _2837 = fma(_2577, _2825, _2565);
    float _2839 = fma(_2579, _2825, _2567);
    float _2841 = _2831 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2843 = fma(_2571, _2833, _2569);
    bool _2845 = _1881 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2847 = isnan(_1881);
    bool _2849 = _2845 || _2847;
    bool _2851 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2853 = _2849 || _2851;
    float _2855 = _2705 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_95.x = _2841;
    out.m_97.x = _2837;
    out.m_97.y = _2839;
    out.m_97.z = _2843;
    out.m_97.w = _2835;
    float _2857 = _2823;
    float _2859 = _2811;
    float _2861 = _2825;
    float _2863 = _2831;
    if (!_2853)
    {
        _2857 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2865 = _2857;
    float _2867 = _2865;
    float _2869 = _2865;
    if (!_2853)
    {
        _2743 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2871 = _2743;
    float _2873 = _2871;
    float _2875 = _2871;
    if (!_2853)
    {
        _2653 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2877 = _2653;
    float _2879 = _2877;
    float _2881 = _2877;
    if (!_2853)
    {
        _2859 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2883 = _2859;
    float _2885 = _2883;
    float _2887 = _2883;
    if (!_2853)
    {
        _2861 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2889 = _2861;
    float _2891 = _2889;
    float _2893 = _2889;
    if (!_2853)
    {
        _2863 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2895 = _2863;
    bool _2897 = !_2853;
    float _2899 = _2895;
    float _2901 = _2895;
    if (!_2897)
    {
        bool _2903 = _1881 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2905 = isnan(_1881);
        bool _2907 = _2903 || _2905;
        bool _2909 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2911 = _2907 || _2909;
        if (!_2911)
        {
            float _2913 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2915 = _1881 + _2913;
            float _2917 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2919 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2917;
            float _2921 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2923 = _2921 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2925 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2927 = _2925 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2929 = 1.0 / _2919;
            float _2931 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2933 = _2931 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2935 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2937 = _2935 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2939 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2941 = _2939 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2943 = _2915 * _2929;
            float _2945 = precise::clamp(_2943, 0.0, 1.0);
            float _2947 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2949 = _2947 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2951 = fma(_2945, _2923, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2953 = fma(_2945, _2927, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2955 = fma(_2945, _2949, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2957 = fma(_2945, _2933, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2959 = fma(_2945, _2937, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2961 = fma(_2945, _2941, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2875 = _2953;
            _2893 = _2959;
            _2869 = _2951;
            _2887 = _2957;
            _2881 = _2955;
            _2901 = _2961;
            _2963 = true;
        }
        else
        {
            bool _2965 = _1881 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2967 = isnan(_1881);
            bool _2969 = _2965 || _2967;
            bool _2971 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2973 = _2969 || _2971;
            if (!_2973)
            {
                _2867 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2975 = _2867;
            _2869 = _2975;
            if (!_2973)
            {
                _2873 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2977 = _2873;
            _2875 = _2977;
            if (!_2973)
            {
                _2879 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2979 = _2879;
            _2881 = _2979;
            if (!_2973)
            {
                _2885 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2981 = _2885;
            _2887 = _2981;
            if (!_2973)
            {
                _2891 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2983 = _2891;
            _2893 = _2983;
            if (!_2973)
            {
                _2899 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2985 = _2899;
            bool _2987 = !_2973;
            _2901 = _2985;
            if (!_2987)
            {
                bool _2989 = _1881 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2991 = isnan(_1881);
                bool _2993 = _2989 || _2991;
                bool _2995 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2997 = _2993 || _2995;
                if (!_2997)
                {
                    float _2999 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3001 = _1881 + _2999;
                    float _3003 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3005 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3003;
                    float _3007 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3009 = _3007 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3011 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3013 = _3011 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3015 = 1.0 / _3005;
                    float _3017 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3019 = _3017 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3021 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3023 = _3021 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3025 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3027 = _3025 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3029 = _3001 * _3015;
                    float _3031 = precise::clamp(_3029, 0.0, 1.0);
                    float _3033 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3035 = _3033 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3037 = fma(_3031, _3009, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3039 = fma(_3031, _3013, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3041 = fma(_3031, _3035, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3043 = fma(_3031, _3019, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3045 = fma(_3031, _3023, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3047 = fma(_3031, _3027, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2875 = _3039;
                    _2893 = _3045;
                    _2869 = _3037;
                    _2887 = _3043;
                    _2881 = _3041;
                    _2901 = _3047;
                    _2963 = true;
                }
                else
                {
                    _2875 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2893 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2869 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2887 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2881 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2901 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2963 = false;
    float _3049 = _2875;
    float _3051 = _2893;
    float _3053 = _2869;
    float _3055 = _2887;
    float _3057 = _2881;
    float _3059 = _2901;
    float _3061 = fma(_1727, -0.5, 0.5);
    float _3063 = precise::clamp(_3061, 0.0, 1.0);
    float _3065 = -_3049;
    float _3067 = _3065 + _3051;
    float _3069 = _2855 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3071 = -_3053;
    float _3073 = _3071 + _3055;
    out.m_99.x = 0.0;
    float _3075 = fma(_3063, _3067, _3049);
    float _3077 = fma(_3063, _3073, _3053);
    out.m_63.x = _3069;
    float _3079 = -_3057;
    float _3081 = _3079 + _3059;
    float _3083 = _3075 * 0.586610972881317138671875;
    bool _3085 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3087 = fma(_3063, _3081, _3057);
    float _3089 = fma(_3077, 0.298911988735198974609375, _3083);
    bool _3091 = _2705 > 0.0;
    bool _3093 = isnan(_2705);
    bool _3095 = _3091 || _3093;
    bool _3097 = isnan(0.0);
    bool _3099 = _3095 || _3097;
    float _3101 = fma(_3087, 0.114477999508380889892578125, _3089);
    float _3103 = -_3101;
    float _3105 = _3077 + _3103;
    float _3107 = -_3101;
    float _3109 = _3075 + _3107;
    float _3111 = -_3101;
    float _3113 = _3087 + _3111;
    float _3115 = fma(_3105, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3101);
    float _3117 = fma(_3109, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3101);
    float _3119 = fma(_3113, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3101);
    bool _3121 = !_3085;
    if (!_3121)
    {
        float _3123 = -_1825;
        float _3125 = _3123 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3127 = -_1827;
        float _3129 = _3127 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3131 = -_1829;
        float _3133 = _3131 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3135 = _3125 * _3125;
        float _3137 = fma(_3129, _3129, _3135);
        float _3139 = fma(_3133, _3133, _3137);
        float _3141 = sqrt(_3139);
        float _3143 = rsqrt(_3139);
        float _3145 = -_3141;
        float _3147 = _3145 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3149 = _3147 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3151 = precise::clamp(_3149, 0.0, 1.0);
        float _3153 = _3129 * _3143;
        float _3155 = _3125 * _3143;
        float _3157 = abs(_3151);
        float _3159 = log2(_3157);
        float _3161 = _3133 * _3143;
        float _3163 = _3153 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3165 = _1727 * _3155;
        float _3167 = -_3155;
        float _3169 = -_3163;
        float _3171 = fma(_3167, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3169);
        float _3173 = fma(_1725, _3153, _3165);
        float _3175 = -_3161;
        float _3177 = fma(_3175, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3171);
        float _3179 = fma(_1729, _3161, _3173);
        float _3181 = precise::clamp(_3179, 0.0, 1.0);
        float _3183 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3185 = _3177 + _3183;
        float _3187 = _3159 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3189 = _3185 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3191 = precise::clamp(_3189, 0.0, 1.0);
        float _3193 = exp2(_3187);
        float _3195 = _3193 * _3191;
        float _3197 = _3181 * _3195;
        float _3199 = _3197 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3201 = _3197 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3203 = _3197 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_99.x = _3199;
        out.m_99.y = _3201;
        out.m_99.z = _3203;
    }
    out.m_101.x = _3115;
    out.m_101.y = _3117;
    out.m_101.z = _3119;
    if (_3099)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.dm_pad9.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.dm_pad9.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.dm_pad9.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.dm_pad9.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_63.x = 0.0;
    float _3205 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3205;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.dm_pad9.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.dm_pad9.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.dm_pad9.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.dm_pad9.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

