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
    constant _16* vp_c10 [[id(1)]];
    constant _16* vp_c8 [[id(2)]];
    constant _16* vp_c9 [[id(3)]];
    constant _16* vp_c15 [[id(4)]];
    constant _16* vp_c16 [[id(5)]];
    constant _16* vp_c7 [[id(6)]];
    constant _16* vp_c13 [[id(7)]];
    texture2d<float> vp_t_tcb_C [[id(8)]];
    sampler vp_t_tcb_CSmplr [[id(9)]];
    texture3d<float> vp_t_tcb_32 [[id(10)]];
    sampler vp_t_tcb_32Smplr [[id(11)]];
    texture3d<float> vp_t_tcb_30 [[id(12)]];
    sampler vp_t_tcb_30Smplr [[id(13)]];
    texture2d<float> vp_t_tcb_1C [[id(14)]];
    sampler vp_t_tcb_1CSmplr [[id(15)]];
    sampler vp_t_tcb_32Smplr_w [[id(16)]];
    sampler vp_t_tcb_30Smplr_w [[id(17)]];
    sampler vp_t_tcb_1CSmplr_w [[id(18)]];
    constant dm_border_t* dm_border [[id(19)]];
};

struct main0_out
{
    float4 m_65 [[user(locn0)]];
    float4 m_87 [[user(locn1)]];
    float4 m_53 [[user(locn2)]];
    float4 m_77 [[user(locn3)]];
    float4 m_79 [[user(locn4)]];
    float4 m_55 [[user(locn5)]];
    float4 m_59 [[user(locn6)]];
    float4 m_71 [[user(locn7)]];
    float4 m_73 [[user(locn8)]];
    float4 m_75 [[user(locn9)]];
    float4 m_85 [[user(locn10)]];
    float4 m_83 [[user(locn11)]];
    float4 m_81 [[user(locn12)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_67 [[attribute(1)]];
    float4 m_48 [[attribute(2)]];
    float4 m_50 [[attribute(3)]];
    float4 m_57 [[attribute(6)]];
    float4 m_61 [[attribute(7)]];
    float4 m_63 [[attribute(8)]];
    float4 m_69 [[attribute(9)]];
};

static inline __attribute__((always_inline))
int _102(thread const int& _7312, thread const int& _7313, constant _10& support_buffer)
{
    float _7316 = as_type<float>(support_buffer._m4);
    int _7318 = _7313 + as_type<int>(_7316);
    int _7320 = 1 + _7318;
    float _7322 = support_buffer._m5[_7320].x;
    float _7324 = abs(_7322);
    bool _7326 = _7324 == 1.0;
    if (_7326)
    {
        return _7312;
    }
    float _7328 = float(_7312);
    float _7330 = _7328 / _7324;
    int _7332 = int(_7330);
    return _7332;
}

static inline __attribute__((always_inline))
int _103(thread const int& _7362, thread const int& _7363, constant _10& support_buffer)
{
    float _7366 = as_type<float>(support_buffer._m4);
    int _7368 = _7363 + as_type<int>(_7366);
    int _7370 = 1 + _7368;
    float _7372 = support_buffer._m5[_7370].x;
    bool _7374 = _7372 == 1.0;
    if (_7374)
    {
        return _7362;
    }
    float _7376 = float(_7362);
    float _7378 = _7376 * _7372;
    int _7380 = int(_7378);
    return _7380;
}

static inline __attribute__((always_inline))
void _100(thread const int& _6996, thread const int& _6997, thread const int& _6998, thread const int& _6999, thread const int& _7000, thread int& _7001, thread int& _7002, thread int& _7003, thread int& _7004, thread int& _7005, thread int& _7006, thread int& _7007, thread float4& gl_Position, thread float& gl_PointSize)
{
    gl_PointSize = 1.0;
    int _7010 = _6999;
    int _7012 = _6996;
    float _7014 = 0.0 + as_type<float>(_6996);
    bool _7016 = _7014 != 0.0;
    bool _7018 = isnan(_7014);
    bool _7020 = _7016 || _7018;
    bool _7022 = isnan(0.0);
    bool _7024 = _7020 || _7022;
    int _7026 = 0;
    int _7028 = as_type<int>(_7014);
    int _7030 = _7024 ? (-1) : 0;
    if (!_7024)
    {
        float _7032 = as_type<float>(_6996) * 1.0;
        _7010 = as_type<int>(_7032);
    }
    int _7034 = _7010;
    bool _7036 = !_7024;
    int _7038 = _7034;
    int _7040 = _7034;
    if (!_7036)
    {
        bool _7042 = _7014 >= 0.0;
        bool _7044 = isnan(_7014);
        bool _7046 = _7042 || _7044;
        bool _7048 = isnan(0.0);
        bool _7050 = _7046 || _7048;
        _7030 = _7050 ? (-1) : 0;
        if (!_7050)
        {
            _7038 = 2147483647;
        }
        int _7052 = _7038;
        bool _7054 = !_7050;
        int _7056 = _7052;
        _7040 = _7052;
        if (!_7054)
        {
            float _7058 = abs(as_type<float>(_6996));
            float _7060 = 0.0 + _7058;
            bool _7062 = _7060 > as_type<float>(0x7f800000u /* inf */);
            bool _7064 = isnan(_7060);
            bool _7066 = _7062 || _7064;
            bool _7068 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _7070 = _7066 || _7068;
            _7026 = 2139095040;
            _7028 = as_type<int>(_7060);
            _7030 = _7070 ? (-1) : 0;
            if (_7070)
            {
                float _7072 = as_type<float>(_6996) + 1.0;
                _7056 = as_type<int>(_7072);
            }
            int _7074 = _7056;
            int _7076 = _7074;
            _7040 = _7074;
            if (!_7070)
            {
                bool _7078 = _7060 != as_type<float>(0x7f800000u /* inf */);
                bool _7080 = isnan(_7060);
                bool _7082 = _7078 || _7080;
                bool _7084 = isnan(as_type<float>(0x7f800000u /* inf */));
                bool _7086 = _7082 || _7084;
                _7030 = _7086 ? (-1) : 0;
                if (!_7086)
                {
                    _7076 = _6996;
                }
                int _7088 = _7076;
                bool _7090 = !_7086;
                _7040 = _7088;
                if (!_7090)
                {
                    float _7092 = as_type<float>(_6996) * 18446744073709551616.0;
                    float _7094 = rsqrt(_7092);
                    float _7096 = _7092 * _7094;
                    float _7098 = _7094 * 0.5;
                    float _7100 = -_7096;
                    float _7102 = 0.0 + _7100;
                    float _7104 = fma(_7098, _7102, 0.5);
                    float _7106 = fma(_7096, _7104, _7096);
                    float _7108 = -_7106;
                    float _7110 = 0.0 + _7108;
                    float _7112 = fma(_7106, _7110, _7092);
                    float _7114 = fma(_7098, _7112, _7106);
                    float _7116 = _7114 * 2.3283064365386962890625e-10;
                    _7012 = as_type<int>(_7092);
                    _7026 = as_type<int>(_7114);
                    _7028 = as_type<int>(_7098);
                    _7040 = as_type<int>(_7116);
                }
            }
        }
    }
    int _7118 = _7012;
    int _7120 = _7026;
    int _7122 = _7028;
    int _7124 = _7040;
    int _7126 = _7030;
    _7001 = _7118;
    _7002 = _7120;
    _7003 = _7122;
    _7004 = _7000;
    _7005 = 0;
    _7006 = _7124;
    _7007 = _7126;
}

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2583 = false;
    bool _2047 = false;
    bool _955 = false;
    bool _763 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _107 = in.m_48.w;
    float _109 = in.m_50.w;
    float _111 = trunc(_107);
    int _113 = int(_111);
    float _115 = -_109;
    float _117 = _115 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_53.y = _117;
    bool _121 = _113 >= 1;
    float _123 = 0.0;
    float _125 = as_type<float>(_113);
    float _127 = _117;
    if (!_121)
    {
        _123 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _129 = _123;
    if (!_121)
    {
        out.m_55.x = 0.0;
    }
    int _131 = 0;
    if (!_121)
    {
        float _133 = _129 * 5.0;
        _131 = as_type<int>(_133);
    }
    int _135 = _131;
    int _137 = _135;
    if (!_121)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2878 = as_type<float>(_135);
        out.gl_Position.z = _2878;
    }
    if (!_121)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _139 = _109 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _141 = isnan(_109);
    bool _143 = _139 || _141;
    bool _145 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _147 = _143 || _145;
    float _149 = in.m_57.x;
    float _151 = float(_113);
    float _153 = in.m_57.y;
    bool _155 = _117 >= _151;
    bool _157 = !_147;
    bool _159 = _155 || _157;
    if (_159)
    {
        _125 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _161 = _125;
    if (_159)
    {
        out.m_55.x = 0.0;
    }
    if (_159)
    {
        float _163 = _161 * 5.0;
        _137 = as_type<int>(_163);
    }
    int _165 = _137;
    out.m_59.x = _149;
    out.m_59.y = _153;
    if (_159)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2941 = as_type<float>(_165);
        out.gl_Position.z = _2941;
    }
    if (_159)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _167 = in.m_61.w;
    float _169 = 1.0 / _151;
    float _171 = _117 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _173 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _175 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _177 = _173 || _175;
    bool _179 = isnan(1.0);
    bool _181 = _177 || _179;
    float _183 = in.m_50.x;
    float _185 = in.m_50.y;
    float _187 = in.m_50.z;
    float _189 = in.m_48.x;
    float _191 = in.m_48.y;
    float _193 = in.m_48.z;
    float _195 = 0.0;
    float _197 = _171;
    if (!_181)
    {
        float _199 = _171 * _171;
        float _201 = _199 * 0.5;
        _195 = _201;
    }
    float _203 = _195;
    float _205 = _203;
    if (!_181)
    {
        float _207 = _203 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _205 = _207;
    }
    float _209 = _205;
    bool _211 = !_181;
    float _213 = _209;
    if (!_211)
    {
        float _215 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _217 = log2(_215);
        float _219 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _221 = _219 + 1.0;
        float _223 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _225 = _171 * _217;
        float _227 = 1.0 / _221;
        float _229 = _223 * 0.693147182464599609375;
        float _231 = exp2(_225);
        float _233 = 1.0 / _229;
        float _235 = _231 + (-1.0);
        float _237 = -_235;
        float _239 = fma(_237, _233, _171);
        float _241 = _239 * _227;
        float _243 = _241 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _213 = _243;
    }
    float _245 = _213;
    bool _247 = !_181;
    if (!_247)
    {
        float _249 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _251 = log2(_249);
        float _253 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _255 = _253 + 1.0;
        float _257 = 1.0 / _255;
        float _259 = _171 * _251;
        float _261 = exp2(_259);
        float _263 = -_261;
        float _265 = _263 + 1.0;
        float _267 = _265 * _257;
        _197 = _267;
    }
    float _269 = _197;
    bool _271 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _273 = _245 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _275 = _245 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _277 = _245 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _279 = fma(_269, _183, _273);
    float _281 = fma(_269, _185, _275);
    float _283 = fma(_269, _187, _277);
    float _285 = _117 * _169;
    float _287 = fma(_279, _167, _189);
    float _289 = fma(_281, _167, _191);
    float _291 = fma(_283, _167, _193);
    bool _293 = !_271;
    float _295 = _285;
    float _297 = _289;
    if (!_293)
    {
        float _299 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _301 = _149 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _303 = fma(_301, (*spvDescriptorSet0.vp_c9)._m0[11].x, _117);
        float _305 = _303 * _299;
        float _307 = floor(_305);
        float _309 = -_307;
        float _311 = _305 + _309;
        _295 = _311;
    }
    float _313 = _295;
    int _315 = int2(spvDescriptorSet0.vp_t_tcb_C.get_width(), spvDescriptorSet0.vp_t_tcb_C.get_height()).x;
    int _317 = _315;
    int _319 = 0;
    int _321 = _102(_317, _319, (*spvDescriptorSet0.support_buffer));
    float _323 = in.m_57.z;
    float _325 = _117 + _323;
    float _327 = _325 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _329 = float(_321);
    int _331 = abs(_321);
    bool _333 = _321 == 0;
    float _335 = _327 * _329;
    float _337 = float(uint(_331));
    float _339 = trunc(_335);
    int _341 = int(_339);
    float _343 = 1.0 / _337;
    int _345 = abs(_341);
    uint _348 = uint(int(uint(_341) >> uint(31)));
    float _350 = float(uint(_345));
    int _352 = ~int(_348);
    int _354 = _352 + 1;
    int _356 = as_type<int>(_343) + (-2);
    float _358 = in.m_63.z;
    float _360 = as_type<float>(_356) * _350;
    float _362 = trunc(_360);
    float _364 = precise::max(_362, 0.0);
    uint _366 = uint(_364);
    float _368 = trunc(_358);
    int _370 = int(_368);
    int _372 = ~int(_366);
    int _374 = _372 + 1;
    int _376 = _374 * _331;
    int _378 = _376 + _345;
    float _380 = float(uint(_378));
    float _382 = as_type<float>(_356) * _380;
    float _384 = trunc(_382);
    float _386 = precise::max(_384, 0.0);
    uint _388 = uint(_386);
    int _390 = int(_366) + int(_388);
    int _392 = ~_390;
    int _394 = _392 + 1;
    int _396 = _394 * _331;
    int _398 = _396 + _345;
    bool _400 = uint(_398) >= uint(_331);
    bool _402 = !_400;
    int _404 = _402 ? 0 : (-1);
    int _406 = ~_390;
    int _408 = _406 + _404;
    int _410 = _408 + 1;
    int _412 = _410 * _331;
    int _414 = _412 + _345;
    int _416 = _414 ^ _354;
    int _418 = ~_354;
    int _420 = _418 + _416;
    int _422 = _420 + 1;
    bool _424 = !_333;
    int _426 = _424 ? _422 : (-1);
    int _428 = _426;
    int _430 = 0;
    int _432 = _103(_428, _430, (*spvDescriptorSet0.support_buffer));
    int _434 = _370;
    int _436 = 0;
    int _438 = _103(_434, _436, (*spvDescriptorSet0.support_buffer));
    float4 _441 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_432, _438)), 0).xyzw;
    float _443 = _441.x;
    float _445 = _441.y;
    float _447 = _441.z;
    float _449 = _441.w;
    float _451 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _453 = _313 + _451;
    bool _455 = _313 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _457 = isnan(_313);
    bool _459 = _455 || _457;
    bool _461 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _463 = _459 || _461;
    float _465 = float(_463);
    float _467 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _469 = _313 + _467;
    bool _471 = _313 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _473 = isnan(_313);
    bool _475 = _471 || _473;
    bool _477 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _479 = _475 || _477;
    float _481 = float(_479);
    float _483 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _485 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _483;
    float _487 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _489 = _487 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _491 = _313 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _493 = isnan(_313);
    bool _495 = _491 || _493;
    bool _497 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _499 = _495 || _497;
    float _501 = float(_499);
    float _503 = 1.0 / _485;
    float _505 = -_501;
    float _507 = _505 + 1.0;
    float _509 = _481 * _507;
    float _511 = -_481;
    float _513 = _511 + 1.0;
    float _515 = 1.0 / _489;
    float _517 = _453 * _503;
    float _519 = -_465;
    float _521 = _519 + 1.0;
    float _523 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _525 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _523;
    float _527 = _501 * _521;
    float _529 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _531 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _529;
    float _533 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _535 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _533;
    float _537 = _469 * _515;
    int _539 = _426 + 1;
    float _541 = fma(_531, _517, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _543 = fma(_525, _517, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _545 = fma(_535, _517, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _547 = _541 * _509;
    float _549 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _551 = _549 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _553 = _543 * _509;
    float _555 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _557 = _555 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _559 = fma(_513, (*spvDescriptorSet0.vp_c9)._m0[107].x, _547);
    float _561 = fma(_551, _537, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _563 = fma(_513, (*spvDescriptorSet0.vp_c9)._m0[107].y, _553);
    float _565 = fma(_557, _537, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _567 = _545 * _509;
    float _569 = fma(_561, _527, _559);
    int _571 = abs(_539);
    float _573 = fma(_565, _527, _563);
    float _575 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _577 = _575 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _579 = fma(_465, (*spvDescriptorSet0.vp_c9)._m0[109].x, _569);
    float _581 = fma(_513, (*spvDescriptorSet0.vp_c9)._m0[107].z, _567);
    float _583 = fma(_465, (*spvDescriptorSet0.vp_c9)._m0[109].y, _573);
    float _585 = fma(_577, _537, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _587 = _579 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    uint _589 = uint(int(uint(_539) >> uint(31)));
    float _591 = _583 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _593 = fma(_585, _527, _581);
    float _595 = _587 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _597 = float(uint(_571));
    float _599 = _591 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _601 = fma(_465, (*spvDescriptorSet0.vp_c9)._m0[109].z, _593);
    int _603 = ~int(_589);
    int _605 = _603 + 1;
    float _607 = as_type<float>(_356) * _597;
    float _609 = _601 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _611 = _609 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _613 = trunc(_607);
    float _615 = precise::max(_613, 0.0);
    uint _617 = uint(_615);
    out.m_65.x = _595;
    out.m_65.y = _599;
    out.m_65.z = _611;
    int _619 = ~int(_617);
    int _621 = _619 + 1;
    int _623 = _621 * _331;
    int _625 = _623 + _571;
    float _627 = float(uint(_625));
    float _629 = as_type<float>(_356) * _627;
    float _631 = trunc(_629);
    float _633 = precise::max(_631, 0.0);
    uint _635 = uint(_633);
    int _637 = int(_617) + int(_635);
    int _639 = ~_637;
    int _641 = _639 + 1;
    int _643 = _641 * _331;
    int _645 = _643 + _571;
    bool _647 = uint(_645) >= uint(_331);
    bool _649 = !_647;
    int _651 = _649 ? 0 : (-1);
    int _653 = ~_637;
    int _655 = _653 + _651;
    int _657 = _655 + 1;
    int _659 = _657 * _331;
    int _661 = _659 + _571;
    int _663 = _661 ^ _605;
    int _665 = ~_605;
    int _667 = _665 + _663;
    int _669 = _667 + 1;
    bool _671 = !_333;
    int _673 = _671 ? _669 : (-1);
    uint _675 = as_type<uint>(half2(float2(_449, 0.0)));
    uint _677 = extract_bits(_675, 0u, 8u);
    int _679 = int(_677) & 255;
    uint _681 = extract_bits(_675, 8u, 8u);
    int _683 = int(_681) & 255;
    int _685 = _683 << 8;
    int _687 = _679 | _685;
    bool _689 = _687 >= 32768;
    int _691 = _687 + (-1024);
    int _693 = _691;
    if (_689)
    {
        int _695 = ~_687;
        int _697 = _695 + 33792;
        int _699 = _697 + 1;
        _693 = _699;
    }
    int _701 = _693;
    int _703 = _701 + 30719;
    float _705 = float(_703);
    float _707 = fma(_705, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _709 = abs(_707);
    float _711 = -_709;
    float _713 = _711 + 1.0;
    float _715 = abs(_707);
    float _717 = fma(_715, -0.0187292993068695068359375, 0.074261002242565155029296875);
    bool _719 = _707 < 0.0;
    float _721 = float(_719);
    int _723 = as_type<int>(_713) + (-218103808);
    float _725 = abs(_707);
    float _727 = fma(_725, _717, -0.212114393711090087890625);
    bool _729 = uint(_723) >= 1920991232u;
    float _731 = abs(_707);
    float _733 = fma(_731, _727, 1.570728778839111328125);
    bool _735 = !_729;
    float _761;
    if (!_735)
    {
        int _737 = as_type<int>(_713);
        int _739 = _651;
        int _741 = _669;
        int _743 = as_type<int>(_595);
        int _745 = 3296;
        int _747;
        int _749;
        int _751;
        int _753;
        int _755;
        int _757;
        int _759;
        _100(_737, _739, _741, _743, _745, _747, _749, _751, _753, _755, _757, _759, out.gl_Position, out.gl_PointSize);
        _761 = as_type<float>(_757);
        _763 = true;
    }
    else
    {
        float _765 = rsqrt(_713);
        float _767 = _713 * _765;
        float _769 = _765 * 0.5;
        float _771 = -_767;
        float _773 = 0.0 + _771;
        float _775 = fma(_769, _773, 0.5);
        float _777 = fma(_767, _775, _767);
        float _779 = -_777;
        float _781 = 0.0 + _779;
        float _783 = fma(_777, _781, _713);
        float _785 = fma(_769, _783, _777);
        _761 = _785;
    }
    _763 = false;
    float _787 = _761;
    int _789 = _673;
    int _791 = 0;
    int _793 = _103(_789, _791, (*spvDescriptorSet0.support_buffer));
    int _795 = _370;
    int _797 = 0;
    int _799 = _103(_795, _797, (*spvDescriptorSet0.support_buffer));
    float4 _801 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_793, _799)), 0).xyzw;
    float _803 = _801.x;
    float _805 = _801.y;
    float _807 = _801.z;
    float _809 = _801.w;
    float _811 = _733 * _787;
    float _813 = _721 * 2.0;
    float _815 = _705 * 3.883221149444580078125;
    float _817 = floor(_335);
    float _819 = -_813;
    float _821 = fma(_811, _819, _811);
    float _823 = _815 * 0.15915493667125701904296875;
    float _825 = fma(_721, 3.1415927410125732421875, _821);
    float _827 = _823 * 6.283185482025146484375;
    float _829 = cos(_827);
    float _831 = _825 * 0.15915493667125701904296875;
    float _833 = _831 * 6.283185482025146484375;
    float _835 = sin(_833);
    float _837 = -_817;
    float _839 = _335 + _837;
    float _841 = _823 * 6.283185482025146484375;
    float _843 = sin(_841);
    float _845 = _835 * _829;
    float _847 = _835 * _843;
    uint _849 = as_type<uint>(half2(float2(_809, 0.0)));
    float _851 = -_445;
    float _853 = _851 + _805;
    float _855 = -_447;
    float _857 = _855 + _807;
    uint _859 = extract_bits(_849, 0u, 8u);
    int _861 = int(_859) & 255;
    uint _863 = extract_bits(_849, 8u, 8u);
    int _865 = int(_863) & 255;
    int _867 = _865 << 8;
    int _869 = _861 | _867;
    float _871 = fma(_839, _853, _445);
    float _873 = fma(_839, _857, _447);
    bool _875 = _869 >= 32768;
    int _877 = _869 + (-1024);
    int _879 = _877;
    if (_875)
    {
        int _881 = ~_869;
        int _883 = _881 + 33792;
        int _885 = _883 + 1;
        _879 = _885;
    }
    int _887 = _879;
    int _889 = _887 + 30719;
    float _891 = float(_889);
    float _893 = fma(_891, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _895 = abs(_893);
    float _897 = -_895;
    float _899 = _897 + 1.0;
    bool _901 = _893 < 0.0;
    float _903 = float(_901);
    float _905 = abs(_893);
    float _907 = fma(_905, -0.0187292993068695068359375, 0.074261002242565155029296875);
    int _909 = as_type<int>(_899) + (-218103808);
    float _911 = abs(_893);
    float _913 = fma(_911, _907, -0.212114393711090087890625);
    bool _915 = uint(_909) >= 1920991232u;
    float _917 = -_443;
    float _919 = _917 + _803;
    float _921 = abs(_893);
    float _923 = fma(_921, _913, 1.570728778839111328125);
    float _925 = fma(_839, _919, _443);
    bool _927 = !_915;
    float _953;
    if (!_927)
    {
        int _929 = as_type<int>(_899);
        int _931 = as_type<int>(_803);
        int _933 = as_type<int>(_805);
        int _935 = as_type<int>(_811);
        int _937 = 4192;
        int _939;
        int _941;
        int _943;
        int _945;
        int _947;
        int _949;
        int _951;
        _100(_929, _931, _933, _935, _937, _939, _941, _943, _945, _947, _949, _951, out.gl_Position, out.gl_PointSize);
        _953 = as_type<float>(_949);
        _955 = true;
    }
    else
    {
        float _957 = rsqrt(_899);
        float _959 = _899 * _957;
        float _961 = _957 * 0.5;
        float _963 = -_959;
        float _965 = 0.0 + _963;
        float _967 = fma(_961, _965, 0.5);
        float _969 = fma(_959, _967, _959);
        float _971 = -_969;
        float _973 = 0.0 + _971;
        float _975 = fma(_969, _973, _899);
        float _977 = fma(_961, _975, _969);
        _953 = _977;
    }
    _955 = false;
    float _979 = _953;
    float _981 = in.m_57.x;
    float _983 = in.m_57.y;
    float _985 = in.m_57.z;
    float _987 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _989 = log2(_987);
    float _991 = _923 * _979;
    bool _993 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _995 = isnan(0.0);
    bool _997 = _993 || _995;
    bool _999 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1001 = _997 || _999;
    float _1003 = _891 * 3.883221149444580078125;
    bool _1005 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1007 = isnan(1.0);
    bool _1009 = _1005 || _1007;
    bool _1011 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1013 = _1009 || _1011;
    float _1015 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1017 = 1.0 + _1015;
    float _1019 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[201].x;
    float _1021 = (*spvDescriptorSet0.vp_c10)._m0[5].x * (*spvDescriptorSet0.vp_c10)._m0[5].x;
    float _1023 = _989 * _117;
    float _1025 = 1.0 / _1017;
    float _1027 = fma((*spvDescriptorSet0.vp_c10)._m0[4].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1021);
    float _1029 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1031 = _985 * 2.0;
    float _1033 = _981 * 2.0;
    float _1035 = exp2(_1023);
    float _1037 = _983 * 2.0;
    float _1039 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _1029);
    float _1041 = floor(_1031);
    float _1043 = fma((*spvDescriptorSet0.vp_c10)._m0[6].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1027);
    float _1045 = floor(_1033);
    float _1047 = -_1035;
    float _1049 = _1047 + 1.0;
    float _1051 = _1001 ? _1049 : 0.0;
    bool _1053 = _1041 > 0.0;
    float _1055 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[201].y;
    bool _1057 = _1041 >= 0.0;
    bool _1059 = isnan(_1041);
    bool _1061 = _1057 || _1059;
    bool _1063 = isnan(0.0);
    bool _1065 = _1061 || _1063;
    if (_1013)
    {
        float _1067 = _1051 * _1025;
        _127 = _1067;
    }
    float _1069 = _127;
    int _1071 = _1065 ? 0 : 1;
    float _1073 = _1069 + (*spvDescriptorSet0.vp_c9)._m0[202].x;
    bool _1075 = _1045 >= 0.0;
    bool _1077 = isnan(_1045);
    bool _1079 = _1075 || _1077;
    bool _1081 = isnan(0.0);
    bool _1083 = _1079 || _1081;
    float _1085 = floor(_1037);
    int _1087 = ~_1071;
    int _1089 = _1087 + 1;
    int _1091 = _1089 + 1;
    float _1093 = _1073 * _1019;
    int _1095 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 4096;
    bool _1097 = _1095 != 0;
    int _1099 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 8192;
    bool _1101 = _1099 != 0;
    int _1103 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 16384;
    bool _1105 = _1103 != 0;
    float _1107 = _1069 + (*spvDescriptorSet0.vp_c9)._m0[202].y;
    int _1109 = _1091;
    if (!_1053)
    {
        int _1111 = ~_1071;
        int _1113 = _1111 + 1;
        _1109 = _1113;
    }
    int _1115 = _1109;
    float _1117 = fma(_981, (*spvDescriptorSet0.vp_c9)._m0[203].x, _1093);
    int _1119 = _1083 ? 0 : 1;
    float _1121 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[201].z;
    int _1123 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 65536;
    bool _1125 = _1123 != 0;
    int _1127 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 131072;
    bool _1129 = _1127 != 0;
    float _1131 = _1107 * _1055;
    bool _1133 = !_1101;
    int _1135 = _1133 ? 0 : 1;
    float _1137 = _983 + _981;
    bool _1139 = _1045 > 0.0;
    float _1141 = fma(_981, (*spvDescriptorSet0.vp_c9)._m0[203].y, _1131);
    bool _1143 = !_1097;
    int _1145 = _1143 ? 0 : 1;
    float _1147 = floor(_1117);
    int _1149 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 262144;
    bool _1151 = _1149 != 0;
    int _1153 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 524288;
    bool _1155 = _1153 != 0;
    int _1157 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1048576;
    bool _1159 = _1157 != 0;
    float _1161 = _1137 + (-1.0);
    int _1163 = ~_1119;
    int _1165 = _1163 + 1;
    int _1167 = _1165 + 1;
    bool _1169 = !_1105;
    int _1171 = _1169 ? 0 : 1;
    float _1173 = fma(_1161, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _1175 = !_1159;
    int _1177 = _1175 ? 0 : 1;
    float _1179 = floor(_1141);
    int _1181 = _1167;
    if (!_1139)
    {
        int _1183 = ~_1119;
        int _1185 = _1183 + 1;
        _1181 = _1185;
    }
    int _1187 = _1181;
    int _1189 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1191 = _1189 != 0;
    int _1193 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1195 = _1193 != 0;
    int _1197 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1199 = _1197 != 0;
    float _1201 = _983 + _985;
    float _1203 = (*spvDescriptorSet0.vp_c10)._m0[5].z * (*spvDescriptorSet0.vp_c10)._m0[5].z;
    bool _1205 = !_1125;
    int _1207 = _1205 ? 0 : 1;
    float _1209 = -_1147;
    float _1211 = _1117 + _1209;
    float _1213 = _1201 + (-1.0);
    float _1215 = fma((*spvDescriptorSet0.vp_c10)._m0[4].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1203);
    bool _1217 = _1085 >= 0.0;
    bool _1219 = isnan(_1085);
    bool _1221 = _1217 || _1219;
    bool _1223 = isnan(0.0);
    bool _1225 = _1221 || _1223;
    float _1227 = _1141 + 0.25;
    float _1229 = fma(_1213, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1231 = fma((*spvDescriptorSet0.vp_c10)._m0[6].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1215);
    int _1233 = _1225 ? 0 : 1;
    float _1235 = floor(_1227);
    bool _1237 = _1085 > 0.0;
    float _1239 = _1117 + 0.25;
    bool _1241 = !_1191;
    int _1243 = _1241 ? 0 : 1;
    float _1245 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _1039);
    float _1247 = _1069 + (*spvDescriptorSet0.vp_c9)._m0[202].z;
    float _1249 = float(_1115);
    float _1251 = _983 + (-0.5);
    float _1253 = floor(_1239);
    int _1255 = abs(_1243);
    float _1257 = _1247 * _1121;
    int _1259 = ~_1233;
    int _1261 = _1259 + 1;
    int _1263 = _1261 + 1;
    float _1265 = float(_1255);
    float _1267 = fma(_981, (*spvDescriptorSet0.vp_c9)._m0[203].z, _1257);
    int _1269 = _1263;
    if (!_1237)
    {
        int _1271 = ~_1233;
        int _1273 = _1271 + 1;
        _1269 = _1273;
    }
    int _1275 = _1269;
    float _1277 = rsqrt(_1245);
    bool _1279 = _1211 >= 0.5;
    bool _1281 = isnan(_1211);
    bool _1283 = _1279 || _1281;
    bool _1285 = isnan(0.5);
    bool _1287 = _1283 || _1285;
    float _1289 = _1265 * _1249;
    float _1291 = -_1179;
    float _1293 = _1141 + _1291;
    int _1295 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 32768;
    bool _1297 = _1295 != 0;
    bool _1299 = !_1287;
    float _1301 = _1299 ? 0.5 : (-0.5);
    float _1303 = floor(_1267);
    float _1305 = -_1253;
    float _1307 = _1239 + _1305;
    int _1309 = abs(_1135);
    float _1311 = _1117 * 6.283185482025146484375;
    bool _1313 = _1293 >= 0.5;
    bool _1315 = isnan(_1293);
    bool _1317 = _1313 || _1315;
    bool _1319 = isnan(0.5);
    bool _1321 = _1317 || _1319;
    float _1323 = -_1235;
    float _1325 = _1227 + _1323;
    int _1327 = abs(_1207);
    float _1329 = _1141 * 6.283185482025146484375;
    float _1331 = _1311 * 0.15915493667125701904296875;
    float _1333 = float(_1309);
    float _1335 = _1301 * (*spvDescriptorSet0.vp_c9)._m0[200].x;
    float _1337 = _1335 * 2.0;
    bool _1339 = !_1321;
    float _1341 = _1339 ? 0.5 : (-0.5);
    float _1343 = _1329 * 0.15915493667125701904296875;
    float _1345 = _1267 + 0.25;
    float _1347 = _1333 * _1337;
    float _1349 = -_1303;
    float _1351 = _1267 + _1349;
    float _1353 = float(_1327);
    float _1355 = floor(_1345);
    bool _1357 = !_1155;
    int _1359 = _1357 ? 0 : 1;
    float _1361 = _1341 * (*spvDescriptorSet0.vp_c9)._m0[200].y;
    float _1363 = _1361 * 2.0;
    bool _1365 = _1351 >= 0.5;
    bool _1367 = isnan(_1351);
    bool _1369 = _1365 || _1367;
    bool _1371 = isnan(0.5);
    bool _1373 = _1369 || _1371;
    float _1375 = _1267 * 6.283185482025146484375;
    bool _1377 = !_1297;
    int _1379 = _1377 ? 0 : 1;
    float _1381 = _1353 * _1363;
    int _1383 = abs(_1359);
    float _1385 = _1331 * 6.283185482025146484375;
    float _1387 = sin(_1385);
    bool _1389 = !_1373;
    float _1391 = _1389 ? 0.5 : (-0.5);
    float _1393 = _871 * _1277;
    bool _1395 = _1307 > 0.5;
    int _1397 = abs(_1145);
    int _1399 = abs(_1379);
    float _1401 = _1343 * 6.283185482025146484375;
    float _1403 = sin(_1401);
    float _1405 = -_1355;
    float _1407 = _1345 + _1405;
    float _1409 = _1391 * (*spvDescriptorSet0.vp_c9)._m0[200].z;
    float _1411 = _1409 * 2.0;
    float _1413 = float(_1383);
    float _1415 = _1387 * (*spvDescriptorSet0.vp_c9)._m0[200].x;
    float _1417 = float(_1397);
    float _1419 = _1307;
    float _1421 = _1325;
    float _1423 = _1407;
    if (_1395)
    {
        float _1425 = -_1307;
        float _1427 = _1425 + 1.0;
        _1419 = _1427;
    }
    float _1429 = _1419;
    float _1431 = float(_1399);
    float _1433 = _1413 * _1411;
    float _1435 = _1375 * 0.15915493667125701904296875;
    bool _1437 = _1325 > 0.5;
    float _1439 = fma(_1429, 4.0, -1.0);
    float _1441 = _1403 * (*spvDescriptorSet0.vp_c9)._m0[200].y;
    float _1443 = fma(_1417, _1415, _1347);
    bool _1445 = !_1151;
    int _1447 = _1445 ? 0 : 1;
    float _1449 = _1435 * 6.283185482025146484375;
    float _1451 = sin(_1449);
    float _1453 = fma(_1431, _1441, _1381);
    bool _1455 = !_1129;
    int _1457 = _1455 ? 0 : 1;
    float _1459 = in.m_67.x;
    float _1461 = in.m_67.y;
    float _1463 = in.m_67.z;
    int _1465 = abs(_1171);
    int _1467 = abs(_1447);
    if (_1437)
    {
        float _1469 = -_1325;
        float _1471 = _1469 + 1.0;
        _1421 = _1471;
    }
    float _1473 = _1421;
    bool _1475 = _1407 > 0.5;
    int _1477 = abs(_1457);
    float _1479 = _1439 * (*spvDescriptorSet0.vp_c9)._m0[200].x;
    float _1481 = float(_1465);
    float _1483 = fma(_1473, 4.0, -1.0);
    float _1485 = float(_1467);
    float _1487 = _1451 * (*spvDescriptorSet0.vp_c9)._m0[200].z;
    bool _1489 = !_1195;
    int _1491 = _1489 ? 0 : 1;
    float _1493 = fma(_1481, _1479, _1443);
    float _1495 = float(_1477);
    float _1497 = fma(_1485, _1487, _1433);
    float _1499 = _1483 * (*spvDescriptorSet0.vp_c9)._m0[200].y;
    int _1501 = abs(_1177);
    float _1503 = _1289 * (-2.0);
    int _1505 = abs(_1491);
    if (_1475)
    {
        float _1507 = -_1407;
        float _1509 = _1507 + 1.0;
        _1423 = _1509;
    }
    float _1511 = _1423;
    float _1513 = fma(_1495, _1499, _1453);
    float _1515 = fma(_1493, 3.1415927410125732421875, _1459);
    float _1517 = float(_1187);
    float _1519 = fma(_1173, _1503, _1173);
    float _1521 = fma(_1515, _1503, _1515);
    float _1523 = float(_1505);
    float _1525 = fma(_1511, 4.0, -1.0);
    float _1527 = _981 + (-0.5);
    float _1529 = float(_1501);
    float _1531 = fma(_1513, 3.1415927410125732421875, _1461);
    float _1533 = _1525 * (*spvDescriptorSet0.vp_c9)._m0[200].z;
    float _1535 = fma(_1527, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1521);
    float _1537 = _1523 * _1517;
    bool _1539 = !_1199;
    int _1541 = _1539 ? 0 : 1;
    float _1543 = fma(_1529, _1533, _1497);
    float _1545 = fma(_1519, _1069, _1535);
    float _1547 = _1537 * (-2.0);
    int _1549 = abs(_1541);
    float _1551 = rsqrt(_1231);
    float _1553 = float(_1275);
    float _1555 = fma(_1531, _1547, _1531);
    float _1557 = float(_1549);
    float _1559 = fma(_1229, _1547, _1229);
    float _1561 = in.m_61.x;
    float _1563 = in.m_61.y;
    float _1565 = in.m_61.z;
    float _1567 = fma(_1251, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1555);
    float _1569 = _981 + _985;
    float _1571 = _1557 * _1553;
    float _1573 = rsqrt(_1043);
    float _1575 = fma(_1559, _1069, _1567);
    float _1577 = fma(_1543, 3.1415927410125732421875, _1463);
    float _1579 = _1569 + (-1.0);
    float _1581 = _1571 * (-2.0);
    float _1583 = _1575 * 0.15915493667125701904296875;
    float _1585 = _985 + (-0.5);
    float _1587 = _1545 * 0.15915493667125701904296875;
    float _1589 = sqrt(_1043);
    float _1591 = fma(_1577, _1581, _1577);
    float _1593 = _873 * _1551;
    float _1595 = _289 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1597 = fma(_1585, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1591);
    float _1599 = _1587 * 6.283185482025146484375;
    float _1601 = sin(_1599);
    float _1603 = _925 * _1573;
    float _1605 = _1563 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1607 = _1561 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1609 = fma(_1579, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1611 = _1565 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _1613 = _1587 * 6.283185482025146484375;
    float _1615 = cos(_1613);
    float _1617 = _1589 * _1593;
    float _1619 = fma(_1609, _1581, _1609);
    float _1621 = _1589 * _1603;
    float _1623 = _1607 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1625 = _1605 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1627 = fma(_1619, _1069, _1597);
    float _1629 = _903 * 2.0;
    float _1631 = _1583 * 6.283185482025146484375;
    float _1633 = sin(_1631);
    float _1635 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1621);
    float _1637 = _1627 * 0.15915493667125701904296875;
    float _1639 = _1589 * _1393;
    float _1641 = _1611 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1643 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1617);
    float _1645 = _1623 * _1635;
    float _1647 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1639);
    float _1649 = _1583 * 6.283185482025146484375;
    float _1651 = cos(_1649);
    float _1653 = _1641 * _1643;
    bool _1655 = _1639 != 0.0;
    bool _1657 = isnan(_1639);
    bool _1659 = _1655 || _1657;
    bool _1661 = isnan(0.0);
    bool _1663 = _1659 || _1661;
    float _1665 = _1625 * _1647;
    bool _1667 = _1621 == 0.0;
    bool _1669 = !_1663;
    bool _1671 = _1667 && _1669;
    float _1673 = _1637 * 6.283185482025146484375;
    float _1675 = cos(_1673);
    float _1677 = -_1629;
    float _1679 = fma(_991, _1677, _991);
    float _1681 = _1601 * _1633;
    bool _1683 = _1617 == 0.0;
    bool _1685 = _1683 && _1671;
    float _1687 = fma(_903, 3.1415927410125732421875, _1679);
    float _1689 = _1637 * 6.283185482025146484375;
    float _1691 = sin(_1689);
    float _1693 = _1615 * _1651;
    float _1695 = _1601 * _1651;
    float _1697 = _1615 * _1675;
    float _1699 = _1651 * _1675;
    float _1701 = _1615 * _1633;
    float _1703 = _1601 * _1675;
    float _1705 = _1633 * _1675;
    float _1707 = _289 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1709 = _1703 * _1665;
    float _1711 = fma(_1691, _1693, _1681);
    float _1713 = fma(_1691, _1681, _1693);
    float _1715 = -_1701;
    float _1717 = fma(_1691, _1695, _1715);
    float _1719 = -_1695;
    float _1721 = fma(_1691, _1701, _1719);
    float _1723 = _1697 * _1665;
    float _1725 = -_1665;
    float _1727 = _1691 * _1725;
    float _1729 = fma(_287, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1707);
    float _1731 = fma(_1711, _1645, _1723);
    float _1733 = fma(_1699, _1645, _1727);
    float _1735 = fma(_1717, _1645, _1709);
    float _1737 = _289 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1739 = fma(_1721, _1653, _1731);
    float _1741 = fma(_1705, _1653, _1733);
    float _1743 = fma(_1713, _1653, _1735);
    float _1745 = _1003 * 0.15915493667125701904296875;
    float _1747 = fma(_287, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1737);
    float _1749 = _1739 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1751 = _1739 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1753 = fma(_291, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1729);
    float _1755 = fma(_291, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1747);
    float _1757 = fma(_1741, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1749);
    float _1759 = fma(_1741, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1751);
    float _1761 = _1753 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1763 = _1755 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1765 = fma(_1743, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1757);
    float _1767 = fma(_1743, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1759);
    float _1769 = _1687 * 0.15915493667125701904296875;
    float _1771 = _1745 * 6.283185482025146484375;
    float _1773 = cos(_1771);
    float _1775 = _1761 + _1765;
    float _1777 = _1763 + _1767;
    float _1779 = -_707;
    float _1781 = _1779 + _893;
    float _1783 = fma(_287, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1595);
    float _1785 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1787 = _1775 + _1785;
    float _1789 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1791 = _1777 + _1789;
    float _1793 = _1745 * 6.283185482025146484375;
    float _1795 = sin(_1793);
    float _1797 = _1787 * _1787;
    float _1799 = _1791 * _1791;
    float _1801 = fma(_291, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1783);
    float _1803 = _1797 + _1799;
    float _1805 = _1769 * 6.283185482025146484375;
    float _1807 = sin(_1805);
    float _1809 = sqrt(_1803);
    float _1811 = -_845;
    float _1813 = fma(_1807, _1773, _1811);
    float _1815 = -_847;
    float _1817 = fma(_1807, _1795, _1815);
    float _1819 = _1739 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1821 = fma(_839, _1781, _707);
    float _1823 = fma(_839, _1813, _845);
    float _1825 = fma(_839, _1817, _847);
    float _1827 = fma(_1741, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1819);
    float _1829 = _1821;
    float _1831 = _1823;
    float _1833 = _1825;
    float _1835 = _1639;
    float _1837 = _1691;
    float _1839 = _1801;
    float _1841 = _1617;
    float _1843 = _1763;
    float _1845 = _1761;
    if (!_1685)
    {
        float _1847 = fma(_1639, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1821);
        _1829 = _1847;
    }
    float _1849 = _1829;
    bool _1851 = _1809 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    if (!_1685)
    {
        float _1853 = fma(_1621, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1823);
        _1831 = _1853;
    }
    float _1855 = _1831;
    float _1857 = fma(_1743, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1827);
    float _1859 = _1801 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1861 = _1855;
    float _1863 = _1859;
    if (!_1685)
    {
        float _1865 = fma(_1617, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1825);
        _1833 = _1865;
    }
    float _1867 = _1833;
    float _1869 = -_1849;
    float _1871 = _1691 * _1869;
    float _1873 = _1697 * _1849;
    float _1875 = _1859 + _1857;
    float _1877 = _1703 * _1849;
    if (!_1851)
    {
        _1835 = _1799;
    }
    float _1879 = _1835;
    float _1881 = _1879;
    if (!_1851)
    {
        _1837 = _1797;
    }
    float _1883 = _1837;
    float _1885 = _1883;
    if (!_1851)
    {
        _297 = _1775;
    }
    float _1887 = _297;
    float _1889 = _1887;
    if (!_1851)
    {
        _1839 = _1777;
    }
    float _1891 = _1839;
    float _1893 = _1891;
    if (!_1851)
    {
        _1841 = _1875;
    }
    float _1895 = _1841;
    bool _1897 = !_1851;
    float _1899 = _1895;
    if (!_1897)
    {
        float _1901 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1903 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1905 = _1809 + _1903;
        float _1907 = rsqrt(_1803);
        float _1909 = _1905 * _1901;
        float _1911 = _1875 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1913 = _1909 * 0.15915493667125701904296875;
        float _1915 = _1913 * 6.283185482025146484375;
        float _1917 = sin(_1915);
        float _1919 = _1913 * 6.283185482025146484375;
        float _1921 = cos(_1919);
        float _1923 = fma(_1917, _1911, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1925 = _1907 * _1923;
        float _1927 = _1921 + (-1.0);
        float _1929 = _1787 * _1925;
        float _1931 = _1791 * _1925;
        float _1933 = _1927 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1935 = _1929 + (*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1937 = _1931 + (*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1939 = _1929 * _1929;
        float _1941 = fma(_1875, _1921, _1933);
        float _1943 = _1931 * _1931;
        _1899 = _1941;
        _1885 = _1939;
        _1881 = _1943;
        _1889 = _1935;
        _1893 = _1937;
    }
    float _1945 = _1899;
    float _1947 = _1885;
    float _1949 = _1881;
    float _1951 = _1889;
    float _1953 = _1893;
    float _1955 = in.m_69.x;
    float _1957 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1959 = _1945 + _1957;
    float _1961 = fma(_1711, _1855, _1873);
    float _1963 = fma(_1699, _1855, _1871);
    float _1965 = in.m_69.y;
    float _1967 = fma(_1959, _1959, _1947);
    float _1969 = fma(_1721, _1867, _1961);
    float _1971 = fma(_1717, _1855, _1877);
    float _1973 = fma(_1705, _1867, _1963);
    float _1975 = _1967 + _1949;
    float _1977 = _1969 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1979 = _1969 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1981 = _1969 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1983 = fma(_1713, _1867, _1971);
    float _1985 = fma(_1973, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1977);
    float _1987 = sqrt(_1975);
    float _1989 = fma(_1973, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1979);
    float _1991 = fma(_1973, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1981);
    float _1993 = fma(_1983, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1985);
    float _1995 = fma(_1983, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1989);
    float _1997 = fma(_1983, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1991);
    out.m_71.x = _1955;
    out.m_71.y = _1965;
    bool _1999 = _1987 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2001 = isnan(_1987);
    bool _2003 = _1999 || _2001;
    bool _2005 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2007 = _2003 || _2005;
    out.m_73.x = _1995;
    out.m_73.y = _1993;
    out.m_73.z = _1997;
    float _2009 = _1975;
    float _2011 = _1959;
    if (!_2007)
    {
        _2009 = 1.0;
    }
    float _2013 = _2009;
    bool _2015 = !_2007;
    float _2017 = _2013;
    if (!_2015)
    {
        bool _2019 = _1987 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2021 = isnan(_1987);
        bool _2023 = _2019 || _2021;
        bool _2025 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2027 = _2023 || _2025;
        if (!_2027)
        {
            float _2029 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2031 = _1987 + _2029;
            float _2033 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2035 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2033;
            float _2037 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2039 = _2037 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2041 = 1.0 / _2035;
            float _2043 = _2031 * _2041;
            float _2045 = fma(_2043, _2039, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2017 = _2045;
            _2047 = true;
        }
        else
        {
            bool _2049 = _1987 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2051 = isnan(_1987);
            bool _2053 = _2049 || _2051;
            bool _2055 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2057 = _2053 || _2055;
            if (!_2057)
            {
                float _2059 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2061 = _1987 + _2059;
                float _2063 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2065 = _2063 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2067 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2069 = _2067 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2071 = 1.0 / _2065;
                float _2073 = _2061 * _2071;
                float _2075 = fma(_2073, _2069, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2017 = _2075;
                _2047 = true;
            }
            else
            {
                _2017 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2047 = false;
    float _2077 = _2017;
    float _2079 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2081 = _1945 + _2079;
    float _2083 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2085 = _1951 + _2083;
    float _2087 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2089 = _1953 + _2087;
    float _2091 = fma(_2081, _2077, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2093 = fma(_2085, _2077, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2095 = fma(_2089, _2077, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2097 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2099 = _2091 + _2097;
    float _2101 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2103 = _2093 + _2101;
    float _2105 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2107 = _2095 + _2105;
    float _2109 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2111 = _2099 * _2099;
    float _2113 = fma(_2103, _2103, _2111);
    float _2115 = fma(_2107, _2107, _2113);
    float _2117 = rsqrt(_2115);
    float _2119 = _2117 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2121 = _2103 * _2119;
    float _2123 = _2107 * _2119;
    float _2125 = _2121 * _2121;
    float _2127 = _2123 * _2123;
    float _2129 = _2125 + _2127;
    float _2131 = sqrt(_2129);
    bool _2133 = _2131 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2135 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2137 = _2131 + _2135;
    float _2139 = _2117;
    float _2141 = _2137;
    float _2143 = _2119;
    float _2145 = _2121;
    if (_2133)
    {
        float _2147 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2139 = _2147;
    }
    float _2149 = _2139;
    if (_2133)
    {
        float _2151 = rsqrt(_2129);
        _2011 = _2151;
    }
    float _2153 = _2011;
    float _2155 = _2153;
    if (_2133)
    {
        float _2157 = _2137 * _2149;
        _2141 = _2157;
    }
    float _2159 = _2141;
    float _2161 = _2091 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    if (_2133)
    {
        float _2163 = _2159 * 0.15915493667125701904296875;
        _1861 = _2163;
    }
    float _2165 = _1861;
    float _2167 = fma(_2093, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2161);
    float _2169 = _1987;
    float _2171 = _2165;
    if (_2133)
    {
        float _2173 = _2165 * 6.283185482025146484375;
        float _2175 = sin(_2173);
        _2169 = _2175;
    }
    float _2177 = _2169;
    float _2179 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2181 = precise::max(0.0, _2179);
    float _2183 = _2107;
    float _2185 = _2181;
    float _2187 = _2179;
    if (_2133)
    {
        float _2189 = _2165 * 6.283185482025146484375;
        float _2191 = cos(_2189);
        _2183 = _2191;
    }
    float _2193 = _2183;
    float _2195 = -_2119;
    float _2197 = -_2181;
    float _2199 = fma(_2099, _2195, _2197);
    float _2201 = _2199;
    if (!_2133)
    {
        _2185 = _2125;
    }
    float _2203 = _2185;
    float _2205 = _2203;
    if (_2133)
    {
        float _2207 = _2199 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2187 = _2207;
    }
    float _2209 = _2187;
    float _2211 = _2177;
    float _2213 = _2209;
    if (_2133)
    {
        float _2215 = fma(_2177, _2209, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2211 = _2215;
    }
    float _2217 = _2211;
    float _2219 = _2217;
    if (_2133)
    {
        float _2221 = _2193 + (-1.0);
        _2213 = _2221;
    }
    float _2223 = _2213;
    if (_2133)
    {
        float _2225 = _2153 * _2217;
        _2143 = _2225;
    }
    float _2227 = _2143;
    if (!_2133)
    {
        _2155 = _2199;
    }
    float _2229 = _2155;
    float _2231 = _2229;
    if (_2133)
    {
        float _2233 = _2223 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2171 = _2233;
    }
    float _2235 = _2171;
    if (_2133)
    {
        float _2237 = _2121 * _2227;
        _2145 = _2237;
    }
    float _2239 = _2145;
    float _2241 = sqrt(_2115);
    if (!_2133)
    {
        _2219 = _2123;
    }
    float _2243 = _2219;
    float _2245 = _2243;
    if (_2133)
    {
        float _2247 = fma(_2199, _2193, _2235);
        _2231 = _2247;
    }
    float _2249 = _2231;
    if (_2133)
    {
        float _2251 = _2123 * _2227;
        _2245 = _2251;
    }
    float _2253 = _2245;
    if (_2133)
    {
        float _2255 = _2239 * _2239;
        _2205 = _2255;
    }
    float _2257 = _2205;
    if (!_2133)
    {
        _2201 = _2127;
    }
    float _2259 = _2201;
    float _2261 = _2091 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2263 = _2259;
    if (_2133)
    {
        float _2265 = _2253 * _2253;
        _2263 = _2265;
    }
    float _2267 = _2263;
    float _2269 = fma(_2249, _2249, _2257);
    float _2271 = fma(_2093, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2261);
    float _2273 = _2269 + _2267;
    float _2275 = _2091 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2277 = fma(_2095, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2271);
    float _2279 = rsqrt(_2273);
    float _2281 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2283 = fma(_2241, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2281);
    float _2285 = precise::clamp(_2283, 0.0, 1.0);
    float _2287 = fma(_2093, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2275);
    float _2289 = _2277 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2291 = -_2285;
    float _2293 = _2291 + 1.0;
    float _2295 = _2091 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2297 = _2289 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2299 = fma(_2095, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2287);
    float _2301 = fma(_2093, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2295);
    float _2303 = abs(_2293);
    float _2305 = log2(_2303);
    float _2307 = -_2297;
    float _2309 = fma(_2307, _2109, 1.0);
    float _2311 = _2299 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2313 = fma(_2095, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2301);
    float _2315 = fma(_2095, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2167);
    float _2317 = _2279 * _2239;
    float _2319 = _2279 * _2249;
    float _2321 = _2313 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2323 = _2279 * _2253;
    float _2325 = _2311 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2327 = _2317 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2329 = _2315 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2331 = log2(_2309);
    float _2333 = fma(_2321, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2325);
    float _2335 = -_2327;
    float _2337 = fma(_2319, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2335);
    float _2339 = _2319 + 1.0;
    float _2341 = _2305 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2343 = fma(_2289, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2333);
    float _2345 = -_2323;
    float _2347 = fma(_2345, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2337);
    float _2349 = _2311 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2351 = exp2(_2341);
    float _2353 = fma(_2329, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2343);
    float _2355 = fma(_2347, -0.5, 0.5);
    float _2357 = _2311 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2359 = fma(_2321, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2349);
    float _2361 = fma(_2347, 0.5, 0.5);
    float _2363 = fma(_2321, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2357);
    float _2365 = 1.0 / _2353;
    float _2367 = fma(_2289, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2359);
    float _2369 = fma(_2361, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2371 = fma(_2289, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2363);
    float _2373 = _2331 * 0.693147182464599609375;
    float _2375 = fma(_2329, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2367);
    float _2377 = fma(_2361, _2369, -0.212114393711090087890625);
    float _2379 = fma(_2329, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2371);
    float _2381 = sqrt(_2355);
    float _2383 = -_2319;
    float _2385 = fma(_2351, _2339, _2383);
    float _2387 = fma(_2361, _2377, 1.570728778839111328125);
    float _2389 = _2373 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2391 = fma(_2385, 0.5, 0.5);
    float _2393 = _2375 * _2365;
    float _2395 = _2379 * _2365;
    float _2397 = fma(_2393, 0.5, 0.5);
    float _2399 = fma(_2395, -0.5, 0.5);
    float _2401 = _2381 * 0.636619746685028076171875;
    float _2403 = -_2387;
    float _2405 = fma(_2401, _2403, 1.0);
    float3 _6223 = float3(_2397, _2399, _2389);
    float _2407 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6223, float3(0.0), isnan(_6223)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6223, float3(0.0), isnan(_6223)), level(0.0)).x;
    float3 _6234 = float3(_2397, _2399, _2389);
    float4 _2409 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6234, float3(0.0), isnan(_6234)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6234, float3(0.0), isnan(_6234)), level(0.0)).xyzw;
    float _2411 = _2409.x;
    float _2413 = _2409.y;
    float _2415 = _2409.z;
    float _2417 = _2409.w;
    float2 _6250 = float2(_2405, _2391);
    float3 _2421 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6250, float2(0.0), isnan(_6250)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6250, float2(0.0), isnan(_6250)), level(0.0)).xyz;
    float _2423 = _2421.x;
    float _2425 = _2421.y;
    float _2427 = _2421.z;
    float _2429 = _2305 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2431 = _2311 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_75.x = _2093;
    out.m_75.y = _2091;
    out.m_75.z = _2095;
    bool _2433 = _2241 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2435 = isnan(_2241);
    bool _2437 = _2433 || _2435;
    bool _2439 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2441 = _2437 || _2439;
    float _2443 = fma(_2321, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2431);
    float _2445 = exp2(_2429);
    out.m_77.x = _1761;
    out.m_77.y = _1859;
    out.m_77.z = _1763;
    float _2447 = fma(_2289, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2443);
    float _2449 = fma(_2329, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2447);
    float _2451 = _2449 + _2353;
    out.gl_Position.x = _2375;
    out.gl_Position.y = _2379;
    out.gl_Position.z = _2449;
    out.gl_Position.w = _2353;
    float _2453 = _2451;
    if (!_2441)
    {
        _1843 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2455 = _1843;
    float _2457 = -_2445;
    float _2459 = _2457 + 1.0;
    float _2461 = _2451 * 0.5;
    float _2463 = _2445;
    float _2465 = _2455;
    float _2467 = _2455;
    if (!_2441)
    {
        _2463 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2469 = _2463;
    float _2471 = _2459 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2473 = _2469;
    float _2475 = _2469;
    if (!_2441)
    {
        _2453 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2477 = _2453;
    out.m_79.z = _2461;
    out.m_79.w = _2353;
    float _2479 = _2477;
    float _2481 = _2477;
    if (!_2441)
    {
        _1863 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2483 = _1863;
    float _2485 = _2483;
    float _2487 = _2483;
    if (!_2441)
    {
        _1845 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2489 = _1845;
    float _2491 = _2471 * _2407;
    float _2493 = -_2471;
    float _2495 = _2493 + 1.0;
    float _2497 = _2417 * _2491;
    float _2499 = _2427 * _2491;
    float _2501 = _2417 * _2495;
    float _2503 = _2495;
    float _2505 = _2489;
    float _2507 = _2489;
    if (!_2441)
    {
        _2503 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2509 = _2503;
    float _2511 = fma(_2423, _2497, _2411);
    float _2513 = fma(_2425, _2497, _2413);
    float _2515 = fma(_2417, _2499, _2415);
    out.m_81.x = _2511;
    out.m_81.y = _2513;
    out.m_81.z = _2515;
    out.m_81.w = _2501;
    bool _2517 = !_2441;
    float _2519 = _2509;
    float _2521 = _2509;
    if (!_2517)
    {
        bool _2523 = _2241 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2525 = isnan(_2241);
        bool _2527 = _2523 || _2525;
        bool _2529 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2531 = _2527 || _2529;
        if (!_2531)
        {
            float _2533 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2535 = _2241 + _2533;
            float _2537 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2539 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2537;
            float _2541 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2543 = _2541 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2545 = 1.0 / _2539;
            float _2547 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2549 = _2547 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2551 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2553 = _2551 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2555 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2557 = _2555 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2559 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2561 = _2559 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2563 = _2535 * _2545;
            float _2565 = precise::clamp(_2563, 0.0, 1.0);
            float _2567 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2569 = _2567 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2571 = fma(_2565, _2543, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2573 = fma(_2565, _2569, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2575 = fma(_2565, _2549, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2577 = fma(_2565, _2553, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2579 = fma(_2565, _2557, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2581 = fma(_2565, _2561, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2521 = _2575;
            _2487 = _2579;
            _2475 = _2571;
            _2467 = _2577;
            _2481 = _2573;
            _2507 = _2581;
            _2583 = true;
        }
        else
        {
            bool _2585 = _2241 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2587 = isnan(_2241);
            bool _2589 = _2585 || _2587;
            bool _2591 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2593 = _2589 || _2591;
            if (!_2593)
            {
                _2473 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2595 = _2473;
            _2475 = _2595;
            if (!_2593)
            {
                _2519 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2597 = _2519;
            _2521 = _2597;
            if (!_2593)
            {
                _2479 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2599 = _2479;
            _2481 = _2599;
            if (!_2593)
            {
                _2465 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2601 = _2465;
            _2467 = _2601;
            if (!_2593)
            {
                _2485 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2603 = _2485;
            _2487 = _2603;
            if (!_2593)
            {
                _2505 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2605 = _2505;
            bool _2607 = !_2593;
            _2507 = _2605;
            if (!_2607)
            {
                bool _2609 = _2241 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2611 = isnan(_2241);
                bool _2613 = _2609 || _2611;
                bool _2615 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2617 = _2613 || _2615;
                if (!_2617)
                {
                    float _2619 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2621 = _2241 + _2619;
                    float _2623 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2625 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2623;
                    float _2627 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2629 = _2627 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2631 = 1.0 / _2625;
                    float _2633 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2635 = _2633 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2637 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2639 = _2637 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2641 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2643 = _2641 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2645 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2647 = _2645 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2649 = _2621 * _2631;
                    float _2651 = precise::clamp(_2649, 0.0, 1.0);
                    float _2653 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2655 = _2653 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2657 = fma(_2651, _2629, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2659 = fma(_2651, _2655, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2661 = fma(_2651, _2635, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2663 = fma(_2651, _2639, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2665 = fma(_2651, _2643, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2667 = fma(_2651, _2647, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2521 = _2661;
                    _2487 = _2665;
                    _2475 = _2657;
                    _2467 = _2663;
                    _2481 = _2659;
                    _2507 = _2667;
                    _2583 = true;
                }
                else
                {
                    _2521 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2487 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2475 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2467 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2481 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2507 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2583 = false;
    float _2669 = _2521;
    float _2671 = _2487;
    float _2673 = _2475;
    float _2675 = _2467;
    float _2677 = _2481;
    float _2679 = _2507;
    float _2681 = fma(_1993, -0.5, 0.5);
    float _2683 = precise::clamp(_2681, 0.0, 1.0);
    float _2685 = -_2669;
    float _2687 = _2685 + _2671;
    float _2689 = -_2673;
    float _2691 = _2689 + _2675;
    float _2693 = -_2677;
    float _2695 = _2693 + _2679;
    bool _2697 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2699 = fma(_2683, _2687, _2669);
    float _2701 = fma(_2683, _2691, _2673);
    float _2703 = fma(_2683, _2695, _2677);
    float _2705 = _2699 * 0.586610972881317138671875;
    out.m_55.x = 1.0;
    float _2707 = fma(_2701, 0.298911988735198974609375, _2705);
    out.m_83.w = (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2709 = fma(_2703, 0.114477999508380889892578125, _2707);
    out.m_85.x = 0.0;
    float _2711 = -_2709;
    float _2713 = _2701 + _2711;
    float _2715 = -_2709;
    float _2717 = _2699 + _2715;
    float _2719 = -_2709;
    float _2721 = _2703 + _2719;
    float _2723 = fma(_2713, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2709);
    float _2725 = fma(_2717, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2709);
    float _2727 = fma(_2721, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2709);
    out.m_87.x = _2723;
    out.m_87.y = _2725;
    out.m_87.z = _2727;
    if (!_2697)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2729 = -_2091;
    float _2731 = _2729 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2733 = -_2093;
    float _2735 = _2733 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2737 = -_2095;
    float _2739 = _2737 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2741 = _2731 * _2731;
    float _2743 = fma(_2735, _2735, _2741);
    float _2745 = fma(_2739, _2739, _2743);
    float _2747 = sqrt(_2745);
    float _2749 = rsqrt(_2745);
    float _2751 = -_2747;
    float _2753 = _2751 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2755 = _2753 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2757 = precise::clamp(_2755, 0.0, 1.0);
    float _2759 = _2735 * _2749;
    float _2761 = _2731 * _2749;
    float _2763 = abs(_2757);
    float _2765 = log2(_2763);
    float _2767 = _2739 * _2749;
    float _2769 = _2759 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2771 = _1993 * _2761;
    float _2773 = -_2761;
    float _2775 = -_2769;
    float _2777 = fma(_2773, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2775);
    float _2779 = fma(_1995, _2759, _2771);
    float _2781 = -_2767;
    float _2783 = fma(_2781, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2777);
    float _2785 = fma(_1997, _2767, _2779);
    float _2787 = precise::clamp(_2785, 0.0, 1.0);
    float _2789 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2791 = _2783 + _2789;
    float _2793 = _2765 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2795 = _2791 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2797 = precise::clamp(_2795, 0.0, 1.0);
    float _2799 = exp2(_2793);
    float _2801 = _2799 * _2797;
    float _2803 = _2787 * _2801;
    float _2805 = _2803 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2807 = _2803 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2809 = _2803 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_85.x = _2805;
    out.m_85.y = _2807;
    out.m_85.z = _2809;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2583 = false;
    bool _2047 = false;
    bool _955 = false;
    bool _763 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _107 = in.m_48.w;
    float _109 = in.m_50.w;
    float _111 = trunc(_107);
    int _113 = int(_111);
    float _115 = -_109;
    float _117 = _115 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_53.y = _117;
    bool _121 = _113 >= 1;
    float _123 = 0.0;
    float _125 = as_type<float>(_113);
    float _127 = _117;
    if (!_121)
    {
        _123 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _129 = _123;
    if (!_121)
    {
        out.m_55.x = 0.0;
    }
    int _131 = 0;
    if (!_121)
    {
        float _133 = _129 * 5.0;
        _131 = as_type<int>(_133);
    }
    int _135 = _131;
    int _137 = _135;
    if (!_121)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2878 = as_type<float>(_135);
        out.gl_Position.z = _2878;
    }
    if (!_121)
    {
        return out;
    }
    bool _139 = _109 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _141 = isnan(_109);
    bool _143 = _139 || _141;
    bool _145 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _147 = _143 || _145;
    float _149 = in.m_57.x;
    float _151 = float(_113);
    float _153 = in.m_57.y;
    bool _155 = _117 >= _151;
    bool _157 = !_147;
    bool _159 = _155 || _157;
    if (_159)
    {
        _125 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _161 = _125;
    if (_159)
    {
        out.m_55.x = 0.0;
    }
    if (_159)
    {
        float _163 = _161 * 5.0;
        _137 = as_type<int>(_163);
    }
    int _165 = _137;
    out.m_59.x = _149;
    out.m_59.y = _153;
    if (_159)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2941 = as_type<float>(_165);
        out.gl_Position.z = _2941;
    }
    if (_159)
    {
        return out;
    }
    float _167 = in.m_61.w;
    float _169 = 1.0 / _151;
    float _171 = _117 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _173 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _175 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _177 = _173 || _175;
    bool _179 = isnan(1.0);
    bool _181 = _177 || _179;
    float _183 = in.m_50.x;
    float _185 = in.m_50.y;
    float _187 = in.m_50.z;
    float _189 = in.m_48.x;
    float _191 = in.m_48.y;
    float _193 = in.m_48.z;
    float _195 = 0.0;
    float _197 = _171;
    if (!_181)
    {
        float _199 = _171 * _171;
        float _201 = _199 * 0.5;
        _195 = _201;
    }
    float _203 = _195;
    float _205 = _203;
    if (!_181)
    {
        float _207 = _203 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _205 = _207;
    }
    float _209 = _205;
    bool _211 = !_181;
    float _213 = _209;
    if (!_211)
    {
        float _215 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _217 = log2(_215);
        float _219 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _221 = _219 + 1.0;
        float _223 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _225 = _171 * _217;
        float _227 = 1.0 / _221;
        float _229 = _223 * 0.693147182464599609375;
        float _231 = exp2(_225);
        float _233 = 1.0 / _229;
        float _235 = _231 + (-1.0);
        float _237 = -_235;
        float _239 = fma(_237, _233, _171);
        float _241 = _239 * _227;
        float _243 = _241 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _213 = _243;
    }
    float _245 = _213;
    bool _247 = !_181;
    if (!_247)
    {
        float _249 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _251 = log2(_249);
        float _253 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _255 = _253 + 1.0;
        float _257 = 1.0 / _255;
        float _259 = _171 * _251;
        float _261 = exp2(_259);
        float _263 = -_261;
        float _265 = _263 + 1.0;
        float _267 = _265 * _257;
        _197 = _267;
    }
    float _269 = _197;
    bool _271 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _273 = _245 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _275 = _245 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _277 = _245 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _279 = fma(_269, _183, _273);
    float _281 = fma(_269, _185, _275);
    float _283 = fma(_269, _187, _277);
    float _285 = _117 * _169;
    float _287 = fma(_279, _167, _189);
    float _289 = fma(_281, _167, _191);
    float _291 = fma(_283, _167, _193);
    bool _293 = !_271;
    float _295 = _285;
    float _297 = _289;
    if (!_293)
    {
        float _299 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _301 = _149 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _303 = fma(_301, (*spvDescriptorSet0.vp_c9)._m0[11].x, _117);
        float _305 = _303 * _299;
        float _307 = floor(_305);
        float _309 = -_307;
        float _311 = _305 + _309;
        _295 = _311;
    }
    float _313 = _295;
    int _315 = int2(spvDescriptorSet0.vp_t_tcb_C.get_width(), spvDescriptorSet0.vp_t_tcb_C.get_height()).x;
    int _317 = _315;
    int _319 = 0;
    int _321 = _102(_317, _319, (*spvDescriptorSet0.support_buffer));
    float _323 = in.m_57.z;
    float _325 = _117 + _323;
    float _327 = _325 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _329 = float(_321);
    int _331 = abs(_321);
    bool _333 = _321 == 0;
    float _335 = _327 * _329;
    float _337 = float(uint(_331));
    float _339 = trunc(_335);
    int _341 = int(_339);
    float _343 = 1.0 / _337;
    int _345 = abs(_341);
    uint _348 = uint(int(uint(_341) >> uint(31)));
    float _350 = float(uint(_345));
    int _352 = ~int(_348);
    int _354 = _352 + 1;
    int _356 = as_type<int>(_343) + (-2);
    float _358 = in.m_63.z;
    float _360 = as_type<float>(_356) * _350;
    float _362 = trunc(_360);
    float _364 = precise::max(_362, 0.0);
    uint _366 = uint(_364);
    float _368 = trunc(_358);
    int _370 = int(_368);
    int _372 = ~int(_366);
    int _374 = _372 + 1;
    int _376 = _374 * _331;
    int _378 = _376 + _345;
    float _380 = float(uint(_378));
    float _382 = as_type<float>(_356) * _380;
    float _384 = trunc(_382);
    float _386 = precise::max(_384, 0.0);
    uint _388 = uint(_386);
    int _390 = int(_366) + int(_388);
    int _392 = ~_390;
    int _394 = _392 + 1;
    int _396 = _394 * _331;
    int _398 = _396 + _345;
    bool _400 = uint(_398) >= uint(_331);
    bool _402 = !_400;
    int _404 = _402 ? 0 : (-1);
    int _406 = ~_390;
    int _408 = _406 + _404;
    int _410 = _408 + 1;
    int _412 = _410 * _331;
    int _414 = _412 + _345;
    int _416 = _414 ^ _354;
    int _418 = ~_354;
    int _420 = _418 + _416;
    int _422 = _420 + 1;
    bool _424 = !_333;
    int _426 = _424 ? _422 : (-1);
    int _428 = _426;
    int _430 = 0;
    int _432 = _103(_428, _430, (*spvDescriptorSet0.support_buffer));
    int _434 = _370;
    int _436 = 0;
    int _438 = _103(_434, _436, (*spvDescriptorSet0.support_buffer));
    float4 _441 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_432, _438)), 0).xyzw;
    float _443 = _441.x;
    float _445 = _441.y;
    float _447 = _441.z;
    float _449 = _441.w;
    float _451 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _453 = _313 + _451;
    bool _455 = _313 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _457 = isnan(_313);
    bool _459 = _455 || _457;
    bool _461 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _463 = _459 || _461;
    float _465 = float(_463);
    float _467 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _469 = _313 + _467;
    bool _471 = _313 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _473 = isnan(_313);
    bool _475 = _471 || _473;
    bool _477 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _479 = _475 || _477;
    float _481 = float(_479);
    float _483 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _485 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _483;
    float _487 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _489 = _487 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _491 = _313 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _493 = isnan(_313);
    bool _495 = _491 || _493;
    bool _497 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _499 = _495 || _497;
    float _501 = float(_499);
    float _503 = 1.0 / _485;
    float _505 = -_501;
    float _507 = _505 + 1.0;
    float _509 = _481 * _507;
    float _511 = -_481;
    float _513 = _511 + 1.0;
    float _515 = 1.0 / _489;
    float _517 = _453 * _503;
    float _519 = -_465;
    float _521 = _519 + 1.0;
    float _523 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _525 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _523;
    float _527 = _501 * _521;
    float _529 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _531 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _529;
    float _533 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _535 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _533;
    float _537 = _469 * _515;
    int _539 = _426 + 1;
    float _541 = fma(_531, _517, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _543 = fma(_525, _517, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _545 = fma(_535, _517, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _547 = _541 * _509;
    float _549 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _551 = _549 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _553 = _543 * _509;
    float _555 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _557 = _555 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _559 = fma(_513, (*spvDescriptorSet0.vp_c9)._m0[107].x, _547);
    float _561 = fma(_551, _537, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _563 = fma(_513, (*spvDescriptorSet0.vp_c9)._m0[107].y, _553);
    float _565 = fma(_557, _537, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _567 = _545 * _509;
    float _569 = fma(_561, _527, _559);
    int _571 = abs(_539);
    float _573 = fma(_565, _527, _563);
    float _575 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _577 = _575 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _579 = fma(_465, (*spvDescriptorSet0.vp_c9)._m0[109].x, _569);
    float _581 = fma(_513, (*spvDescriptorSet0.vp_c9)._m0[107].z, _567);
    float _583 = fma(_465, (*spvDescriptorSet0.vp_c9)._m0[109].y, _573);
    float _585 = fma(_577, _537, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _587 = _579 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    uint _589 = uint(int(uint(_539) >> uint(31)));
    float _591 = _583 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _593 = fma(_585, _527, _581);
    float _595 = _587 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _597 = float(uint(_571));
    float _599 = _591 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _601 = fma(_465, (*spvDescriptorSet0.vp_c9)._m0[109].z, _593);
    int _603 = ~int(_589);
    int _605 = _603 + 1;
    float _607 = as_type<float>(_356) * _597;
    float _609 = _601 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _611 = _609 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _613 = trunc(_607);
    float _615 = precise::max(_613, 0.0);
    uint _617 = uint(_615);
    out.m_65.x = _595;
    out.m_65.y = _599;
    out.m_65.z = _611;
    int _619 = ~int(_617);
    int _621 = _619 + 1;
    int _623 = _621 * _331;
    int _625 = _623 + _571;
    float _627 = float(uint(_625));
    float _629 = as_type<float>(_356) * _627;
    float _631 = trunc(_629);
    float _633 = precise::max(_631, 0.0);
    uint _635 = uint(_633);
    int _637 = int(_617) + int(_635);
    int _639 = ~_637;
    int _641 = _639 + 1;
    int _643 = _641 * _331;
    int _645 = _643 + _571;
    bool _647 = uint(_645) >= uint(_331);
    bool _649 = !_647;
    int _651 = _649 ? 0 : (-1);
    int _653 = ~_637;
    int _655 = _653 + _651;
    int _657 = _655 + 1;
    int _659 = _657 * _331;
    int _661 = _659 + _571;
    int _663 = _661 ^ _605;
    int _665 = ~_605;
    int _667 = _665 + _663;
    int _669 = _667 + 1;
    bool _671 = !_333;
    int _673 = _671 ? _669 : (-1);
    uint _675 = as_type<uint>(half2(float2(_449, 0.0)));
    uint _677 = extract_bits(_675, 0u, 8u);
    int _679 = int(_677) & 255;
    uint _681 = extract_bits(_675, 8u, 8u);
    int _683 = int(_681) & 255;
    int _685 = _683 << 8;
    int _687 = _679 | _685;
    bool _689 = _687 >= 32768;
    int _691 = _687 + (-1024);
    int _693 = _691;
    if (_689)
    {
        int _695 = ~_687;
        int _697 = _695 + 33792;
        int _699 = _697 + 1;
        _693 = _699;
    }
    int _701 = _693;
    int _703 = _701 + 30719;
    float _705 = float(_703);
    float _707 = fma(_705, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _709 = abs(_707);
    float _711 = -_709;
    float _713 = _711 + 1.0;
    float _715 = abs(_707);
    float _717 = fma(_715, -0.0187292993068695068359375, 0.074261002242565155029296875);
    bool _719 = _707 < 0.0;
    float _721 = float(_719);
    int _723 = as_type<int>(_713) + (-218103808);
    float _725 = abs(_707);
    float _727 = fma(_725, _717, -0.212114393711090087890625);
    bool _729 = uint(_723) >= 1920991232u;
    float _731 = abs(_707);
    float _733 = fma(_731, _727, 1.570728778839111328125);
    bool _735 = !_729;
    float _761;
    if (!_735)
    {
        int _737 = as_type<int>(_713);
        int _739 = _651;
        int _741 = _669;
        int _743 = as_type<int>(_595);
        int _745 = 3296;
        int _747;
        int _749;
        int _751;
        int _753;
        int _755;
        int _757;
        int _759;
        _100(_737, _739, _741, _743, _745, _747, _749, _751, _753, _755, _757, _759, out.gl_Position, out.gl_PointSize);
        _761 = as_type<float>(_757);
        _763 = true;
    }
    else
    {
        float _765 = rsqrt(_713);
        float _767 = _713 * _765;
        float _769 = _765 * 0.5;
        float _771 = -_767;
        float _773 = 0.0 + _771;
        float _775 = fma(_769, _773, 0.5);
        float _777 = fma(_767, _775, _767);
        float _779 = -_777;
        float _781 = 0.0 + _779;
        float _783 = fma(_777, _781, _713);
        float _785 = fma(_769, _783, _777);
        _761 = _785;
    }
    _763 = false;
    float _787 = _761;
    int _789 = _673;
    int _791 = 0;
    int _793 = _103(_789, _791, (*spvDescriptorSet0.support_buffer));
    int _795 = _370;
    int _797 = 0;
    int _799 = _103(_795, _797, (*spvDescriptorSet0.support_buffer));
    float4 _801 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_793, _799)), 0).xyzw;
    float _803 = _801.x;
    float _805 = _801.y;
    float _807 = _801.z;
    float _809 = _801.w;
    float _811 = _733 * _787;
    float _813 = _721 * 2.0;
    float _815 = _705 * 3.883221149444580078125;
    float _817 = floor(_335);
    float _819 = -_813;
    float _821 = fma(_811, _819, _811);
    float _823 = _815 * 0.15915493667125701904296875;
    float _825 = fma(_721, 3.1415927410125732421875, _821);
    float _827 = _823 * 6.283185482025146484375;
    float _829 = cos(_827);
    float _831 = _825 * 0.15915493667125701904296875;
    float _833 = _831 * 6.283185482025146484375;
    float _835 = sin(_833);
    float _837 = -_817;
    float _839 = _335 + _837;
    float _841 = _823 * 6.283185482025146484375;
    float _843 = sin(_841);
    float _845 = _835 * _829;
    float _847 = _835 * _843;
    uint _849 = as_type<uint>(half2(float2(_809, 0.0)));
    float _851 = -_445;
    float _853 = _851 + _805;
    float _855 = -_447;
    float _857 = _855 + _807;
    uint _859 = extract_bits(_849, 0u, 8u);
    int _861 = int(_859) & 255;
    uint _863 = extract_bits(_849, 8u, 8u);
    int _865 = int(_863) & 255;
    int _867 = _865 << 8;
    int _869 = _861 | _867;
    float _871 = fma(_839, _853, _445);
    float _873 = fma(_839, _857, _447);
    bool _875 = _869 >= 32768;
    int _877 = _869 + (-1024);
    int _879 = _877;
    if (_875)
    {
        int _881 = ~_869;
        int _883 = _881 + 33792;
        int _885 = _883 + 1;
        _879 = _885;
    }
    int _887 = _879;
    int _889 = _887 + 30719;
    float _891 = float(_889);
    float _893 = fma(_891, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _895 = abs(_893);
    float _897 = -_895;
    float _899 = _897 + 1.0;
    bool _901 = _893 < 0.0;
    float _903 = float(_901);
    float _905 = abs(_893);
    float _907 = fma(_905, -0.0187292993068695068359375, 0.074261002242565155029296875);
    int _909 = as_type<int>(_899) + (-218103808);
    float _911 = abs(_893);
    float _913 = fma(_911, _907, -0.212114393711090087890625);
    bool _915 = uint(_909) >= 1920991232u;
    float _917 = -_443;
    float _919 = _917 + _803;
    float _921 = abs(_893);
    float _923 = fma(_921, _913, 1.570728778839111328125);
    float _925 = fma(_839, _919, _443);
    bool _927 = !_915;
    float _953;
    if (!_927)
    {
        int _929 = as_type<int>(_899);
        int _931 = as_type<int>(_803);
        int _933 = as_type<int>(_805);
        int _935 = as_type<int>(_811);
        int _937 = 4192;
        int _939;
        int _941;
        int _943;
        int _945;
        int _947;
        int _949;
        int _951;
        _100(_929, _931, _933, _935, _937, _939, _941, _943, _945, _947, _949, _951, out.gl_Position, out.gl_PointSize);
        _953 = as_type<float>(_949);
        _955 = true;
    }
    else
    {
        float _957 = rsqrt(_899);
        float _959 = _899 * _957;
        float _961 = _957 * 0.5;
        float _963 = -_959;
        float _965 = 0.0 + _963;
        float _967 = fma(_961, _965, 0.5);
        float _969 = fma(_959, _967, _959);
        float _971 = -_969;
        float _973 = 0.0 + _971;
        float _975 = fma(_969, _973, _899);
        float _977 = fma(_961, _975, _969);
        _953 = _977;
    }
    _955 = false;
    float _979 = _953;
    float _981 = in.m_57.x;
    float _983 = in.m_57.y;
    float _985 = in.m_57.z;
    float _987 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _989 = log2(_987);
    float _991 = _923 * _979;
    bool _993 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _995 = isnan(0.0);
    bool _997 = _993 || _995;
    bool _999 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1001 = _997 || _999;
    float _1003 = _891 * 3.883221149444580078125;
    bool _1005 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1007 = isnan(1.0);
    bool _1009 = _1005 || _1007;
    bool _1011 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1013 = _1009 || _1011;
    float _1015 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1017 = 1.0 + _1015;
    float _1019 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[201].x;
    float _1021 = (*spvDescriptorSet0.vp_c10)._m0[5].x * (*spvDescriptorSet0.vp_c10)._m0[5].x;
    float _1023 = _989 * _117;
    float _1025 = 1.0 / _1017;
    float _1027 = fma((*spvDescriptorSet0.vp_c10)._m0[4].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1021);
    float _1029 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1031 = _985 * 2.0;
    float _1033 = _981 * 2.0;
    float _1035 = exp2(_1023);
    float _1037 = _983 * 2.0;
    float _1039 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _1029);
    float _1041 = floor(_1031);
    float _1043 = fma((*spvDescriptorSet0.vp_c10)._m0[6].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1027);
    float _1045 = floor(_1033);
    float _1047 = -_1035;
    float _1049 = _1047 + 1.0;
    float _1051 = _1001 ? _1049 : 0.0;
    bool _1053 = _1041 > 0.0;
    float _1055 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[201].y;
    bool _1057 = _1041 >= 0.0;
    bool _1059 = isnan(_1041);
    bool _1061 = _1057 || _1059;
    bool _1063 = isnan(0.0);
    bool _1065 = _1061 || _1063;
    if (_1013)
    {
        float _1067 = _1051 * _1025;
        _127 = _1067;
    }
    float _1069 = _127;
    int _1071 = _1065 ? 0 : 1;
    float _1073 = _1069 + (*spvDescriptorSet0.vp_c9)._m0[202].x;
    bool _1075 = _1045 >= 0.0;
    bool _1077 = isnan(_1045);
    bool _1079 = _1075 || _1077;
    bool _1081 = isnan(0.0);
    bool _1083 = _1079 || _1081;
    float _1085 = floor(_1037);
    int _1087 = ~_1071;
    int _1089 = _1087 + 1;
    int _1091 = _1089 + 1;
    float _1093 = _1073 * _1019;
    int _1095 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 4096;
    bool _1097 = _1095 != 0;
    int _1099 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 8192;
    bool _1101 = _1099 != 0;
    int _1103 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 16384;
    bool _1105 = _1103 != 0;
    float _1107 = _1069 + (*spvDescriptorSet0.vp_c9)._m0[202].y;
    int _1109 = _1091;
    if (!_1053)
    {
        int _1111 = ~_1071;
        int _1113 = _1111 + 1;
        _1109 = _1113;
    }
    int _1115 = _1109;
    float _1117 = fma(_981, (*spvDescriptorSet0.vp_c9)._m0[203].x, _1093);
    int _1119 = _1083 ? 0 : 1;
    float _1121 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[201].z;
    int _1123 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 65536;
    bool _1125 = _1123 != 0;
    int _1127 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 131072;
    bool _1129 = _1127 != 0;
    float _1131 = _1107 * _1055;
    bool _1133 = !_1101;
    int _1135 = _1133 ? 0 : 1;
    float _1137 = _983 + _981;
    bool _1139 = _1045 > 0.0;
    float _1141 = fma(_981, (*spvDescriptorSet0.vp_c9)._m0[203].y, _1131);
    bool _1143 = !_1097;
    int _1145 = _1143 ? 0 : 1;
    float _1147 = floor(_1117);
    int _1149 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 262144;
    bool _1151 = _1149 != 0;
    int _1153 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 524288;
    bool _1155 = _1153 != 0;
    int _1157 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1048576;
    bool _1159 = _1157 != 0;
    float _1161 = _1137 + (-1.0);
    int _1163 = ~_1119;
    int _1165 = _1163 + 1;
    int _1167 = _1165 + 1;
    bool _1169 = !_1105;
    int _1171 = _1169 ? 0 : 1;
    float _1173 = fma(_1161, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _1175 = !_1159;
    int _1177 = _1175 ? 0 : 1;
    float _1179 = floor(_1141);
    int _1181 = _1167;
    if (!_1139)
    {
        int _1183 = ~_1119;
        int _1185 = _1183 + 1;
        _1181 = _1185;
    }
    int _1187 = _1181;
    int _1189 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1191 = _1189 != 0;
    int _1193 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1195 = _1193 != 0;
    int _1197 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1199 = _1197 != 0;
    float _1201 = _983 + _985;
    float _1203 = (*spvDescriptorSet0.vp_c10)._m0[5].z * (*spvDescriptorSet0.vp_c10)._m0[5].z;
    bool _1205 = !_1125;
    int _1207 = _1205 ? 0 : 1;
    float _1209 = -_1147;
    float _1211 = _1117 + _1209;
    float _1213 = _1201 + (-1.0);
    float _1215 = fma((*spvDescriptorSet0.vp_c10)._m0[4].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1203);
    bool _1217 = _1085 >= 0.0;
    bool _1219 = isnan(_1085);
    bool _1221 = _1217 || _1219;
    bool _1223 = isnan(0.0);
    bool _1225 = _1221 || _1223;
    float _1227 = _1141 + 0.25;
    float _1229 = fma(_1213, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1231 = fma((*spvDescriptorSet0.vp_c10)._m0[6].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1215);
    int _1233 = _1225 ? 0 : 1;
    float _1235 = floor(_1227);
    bool _1237 = _1085 > 0.0;
    float _1239 = _1117 + 0.25;
    bool _1241 = !_1191;
    int _1243 = _1241 ? 0 : 1;
    float _1245 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _1039);
    float _1247 = _1069 + (*spvDescriptorSet0.vp_c9)._m0[202].z;
    float _1249 = float(_1115);
    float _1251 = _983 + (-0.5);
    float _1253 = floor(_1239);
    int _1255 = abs(_1243);
    float _1257 = _1247 * _1121;
    int _1259 = ~_1233;
    int _1261 = _1259 + 1;
    int _1263 = _1261 + 1;
    float _1265 = float(_1255);
    float _1267 = fma(_981, (*spvDescriptorSet0.vp_c9)._m0[203].z, _1257);
    int _1269 = _1263;
    if (!_1237)
    {
        int _1271 = ~_1233;
        int _1273 = _1271 + 1;
        _1269 = _1273;
    }
    int _1275 = _1269;
    float _1277 = rsqrt(_1245);
    bool _1279 = _1211 >= 0.5;
    bool _1281 = isnan(_1211);
    bool _1283 = _1279 || _1281;
    bool _1285 = isnan(0.5);
    bool _1287 = _1283 || _1285;
    float _1289 = _1265 * _1249;
    float _1291 = -_1179;
    float _1293 = _1141 + _1291;
    int _1295 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 32768;
    bool _1297 = _1295 != 0;
    bool _1299 = !_1287;
    float _1301 = _1299 ? 0.5 : (-0.5);
    float _1303 = floor(_1267);
    float _1305 = -_1253;
    float _1307 = _1239 + _1305;
    int _1309 = abs(_1135);
    float _1311 = _1117 * 6.283185482025146484375;
    bool _1313 = _1293 >= 0.5;
    bool _1315 = isnan(_1293);
    bool _1317 = _1313 || _1315;
    bool _1319 = isnan(0.5);
    bool _1321 = _1317 || _1319;
    float _1323 = -_1235;
    float _1325 = _1227 + _1323;
    int _1327 = abs(_1207);
    float _1329 = _1141 * 6.283185482025146484375;
    float _1331 = _1311 * 0.15915493667125701904296875;
    float _1333 = float(_1309);
    float _1335 = _1301 * (*spvDescriptorSet0.vp_c9)._m0[200].x;
    float _1337 = _1335 * 2.0;
    bool _1339 = !_1321;
    float _1341 = _1339 ? 0.5 : (-0.5);
    float _1343 = _1329 * 0.15915493667125701904296875;
    float _1345 = _1267 + 0.25;
    float _1347 = _1333 * _1337;
    float _1349 = -_1303;
    float _1351 = _1267 + _1349;
    float _1353 = float(_1327);
    float _1355 = floor(_1345);
    bool _1357 = !_1155;
    int _1359 = _1357 ? 0 : 1;
    float _1361 = _1341 * (*spvDescriptorSet0.vp_c9)._m0[200].y;
    float _1363 = _1361 * 2.0;
    bool _1365 = _1351 >= 0.5;
    bool _1367 = isnan(_1351);
    bool _1369 = _1365 || _1367;
    bool _1371 = isnan(0.5);
    bool _1373 = _1369 || _1371;
    float _1375 = _1267 * 6.283185482025146484375;
    bool _1377 = !_1297;
    int _1379 = _1377 ? 0 : 1;
    float _1381 = _1353 * _1363;
    int _1383 = abs(_1359);
    float _1385 = _1331 * 6.283185482025146484375;
    float _1387 = sin(_1385);
    bool _1389 = !_1373;
    float _1391 = _1389 ? 0.5 : (-0.5);
    float _1393 = _871 * _1277;
    bool _1395 = _1307 > 0.5;
    int _1397 = abs(_1145);
    int _1399 = abs(_1379);
    float _1401 = _1343 * 6.283185482025146484375;
    float _1403 = sin(_1401);
    float _1405 = -_1355;
    float _1407 = _1345 + _1405;
    float _1409 = _1391 * (*spvDescriptorSet0.vp_c9)._m0[200].z;
    float _1411 = _1409 * 2.0;
    float _1413 = float(_1383);
    float _1415 = _1387 * (*spvDescriptorSet0.vp_c9)._m0[200].x;
    float _1417 = float(_1397);
    float _1419 = _1307;
    float _1421 = _1325;
    float _1423 = _1407;
    if (_1395)
    {
        float _1425 = -_1307;
        float _1427 = _1425 + 1.0;
        _1419 = _1427;
    }
    float _1429 = _1419;
    float _1431 = float(_1399);
    float _1433 = _1413 * _1411;
    float _1435 = _1375 * 0.15915493667125701904296875;
    bool _1437 = _1325 > 0.5;
    float _1439 = fma(_1429, 4.0, -1.0);
    float _1441 = _1403 * (*spvDescriptorSet0.vp_c9)._m0[200].y;
    float _1443 = fma(_1417, _1415, _1347);
    bool _1445 = !_1151;
    int _1447 = _1445 ? 0 : 1;
    float _1449 = _1435 * 6.283185482025146484375;
    float _1451 = sin(_1449);
    float _1453 = fma(_1431, _1441, _1381);
    bool _1455 = !_1129;
    int _1457 = _1455 ? 0 : 1;
    float _1459 = in.m_67.x;
    float _1461 = in.m_67.y;
    float _1463 = in.m_67.z;
    int _1465 = abs(_1171);
    int _1467 = abs(_1447);
    if (_1437)
    {
        float _1469 = -_1325;
        float _1471 = _1469 + 1.0;
        _1421 = _1471;
    }
    float _1473 = _1421;
    bool _1475 = _1407 > 0.5;
    int _1477 = abs(_1457);
    float _1479 = _1439 * (*spvDescriptorSet0.vp_c9)._m0[200].x;
    float _1481 = float(_1465);
    float _1483 = fma(_1473, 4.0, -1.0);
    float _1485 = float(_1467);
    float _1487 = _1451 * (*spvDescriptorSet0.vp_c9)._m0[200].z;
    bool _1489 = !_1195;
    int _1491 = _1489 ? 0 : 1;
    float _1493 = fma(_1481, _1479, _1443);
    float _1495 = float(_1477);
    float _1497 = fma(_1485, _1487, _1433);
    float _1499 = _1483 * (*spvDescriptorSet0.vp_c9)._m0[200].y;
    int _1501 = abs(_1177);
    float _1503 = _1289 * (-2.0);
    int _1505 = abs(_1491);
    if (_1475)
    {
        float _1507 = -_1407;
        float _1509 = _1507 + 1.0;
        _1423 = _1509;
    }
    float _1511 = _1423;
    float _1513 = fma(_1495, _1499, _1453);
    float _1515 = fma(_1493, 3.1415927410125732421875, _1459);
    float _1517 = float(_1187);
    float _1519 = fma(_1173, _1503, _1173);
    float _1521 = fma(_1515, _1503, _1515);
    float _1523 = float(_1505);
    float _1525 = fma(_1511, 4.0, -1.0);
    float _1527 = _981 + (-0.5);
    float _1529 = float(_1501);
    float _1531 = fma(_1513, 3.1415927410125732421875, _1461);
    float _1533 = _1525 * (*spvDescriptorSet0.vp_c9)._m0[200].z;
    float _1535 = fma(_1527, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1521);
    float _1537 = _1523 * _1517;
    bool _1539 = !_1199;
    int _1541 = _1539 ? 0 : 1;
    float _1543 = fma(_1529, _1533, _1497);
    float _1545 = fma(_1519, _1069, _1535);
    float _1547 = _1537 * (-2.0);
    int _1549 = abs(_1541);
    float _1551 = rsqrt(_1231);
    float _1553 = float(_1275);
    float _1555 = fma(_1531, _1547, _1531);
    float _1557 = float(_1549);
    float _1559 = fma(_1229, _1547, _1229);
    float _1561 = in.m_61.x;
    float _1563 = in.m_61.y;
    float _1565 = in.m_61.z;
    float _1567 = fma(_1251, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1555);
    float _1569 = _981 + _985;
    float _1571 = _1557 * _1553;
    float _1573 = rsqrt(_1043);
    float _1575 = fma(_1559, _1069, _1567);
    float _1577 = fma(_1543, 3.1415927410125732421875, _1463);
    float _1579 = _1569 + (-1.0);
    float _1581 = _1571 * (-2.0);
    float _1583 = _1575 * 0.15915493667125701904296875;
    float _1585 = _985 + (-0.5);
    float _1587 = _1545 * 0.15915493667125701904296875;
    float _1589 = sqrt(_1043);
    float _1591 = fma(_1577, _1581, _1577);
    float _1593 = _873 * _1551;
    float _1595 = _289 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1597 = fma(_1585, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1591);
    float _1599 = _1587 * 6.283185482025146484375;
    float _1601 = sin(_1599);
    float _1603 = _925 * _1573;
    float _1605 = _1563 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1607 = _1561 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1609 = fma(_1579, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1611 = _1565 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _1613 = _1587 * 6.283185482025146484375;
    float _1615 = cos(_1613);
    float _1617 = _1589 * _1593;
    float _1619 = fma(_1609, _1581, _1609);
    float _1621 = _1589 * _1603;
    float _1623 = _1607 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1625 = _1605 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1627 = fma(_1619, _1069, _1597);
    float _1629 = _903 * 2.0;
    float _1631 = _1583 * 6.283185482025146484375;
    float _1633 = sin(_1631);
    float _1635 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1621);
    float _1637 = _1627 * 0.15915493667125701904296875;
    float _1639 = _1589 * _1393;
    float _1641 = _1611 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1643 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1617);
    float _1645 = _1623 * _1635;
    float _1647 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1639);
    float _1649 = _1583 * 6.283185482025146484375;
    float _1651 = cos(_1649);
    float _1653 = _1641 * _1643;
    bool _1655 = _1639 != 0.0;
    bool _1657 = isnan(_1639);
    bool _1659 = _1655 || _1657;
    bool _1661 = isnan(0.0);
    bool _1663 = _1659 || _1661;
    float _1665 = _1625 * _1647;
    bool _1667 = _1621 == 0.0;
    bool _1669 = !_1663;
    bool _1671 = _1667 && _1669;
    float _1673 = _1637 * 6.283185482025146484375;
    float _1675 = cos(_1673);
    float _1677 = -_1629;
    float _1679 = fma(_991, _1677, _991);
    float _1681 = _1601 * _1633;
    bool _1683 = _1617 == 0.0;
    bool _1685 = _1683 && _1671;
    float _1687 = fma(_903, 3.1415927410125732421875, _1679);
    float _1689 = _1637 * 6.283185482025146484375;
    float _1691 = sin(_1689);
    float _1693 = _1615 * _1651;
    float _1695 = _1601 * _1651;
    float _1697 = _1615 * _1675;
    float _1699 = _1651 * _1675;
    float _1701 = _1615 * _1633;
    float _1703 = _1601 * _1675;
    float _1705 = _1633 * _1675;
    float _1707 = _289 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1709 = _1703 * _1665;
    float _1711 = fma(_1691, _1693, _1681);
    float _1713 = fma(_1691, _1681, _1693);
    float _1715 = -_1701;
    float _1717 = fma(_1691, _1695, _1715);
    float _1719 = -_1695;
    float _1721 = fma(_1691, _1701, _1719);
    float _1723 = _1697 * _1665;
    float _1725 = -_1665;
    float _1727 = _1691 * _1725;
    float _1729 = fma(_287, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1707);
    float _1731 = fma(_1711, _1645, _1723);
    float _1733 = fma(_1699, _1645, _1727);
    float _1735 = fma(_1717, _1645, _1709);
    float _1737 = _289 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1739 = fma(_1721, _1653, _1731);
    float _1741 = fma(_1705, _1653, _1733);
    float _1743 = fma(_1713, _1653, _1735);
    float _1745 = _1003 * 0.15915493667125701904296875;
    float _1747 = fma(_287, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1737);
    float _1749 = _1739 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1751 = _1739 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1753 = fma(_291, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1729);
    float _1755 = fma(_291, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1747);
    float _1757 = fma(_1741, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1749);
    float _1759 = fma(_1741, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1751);
    float _1761 = _1753 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1763 = _1755 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1765 = fma(_1743, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1757);
    float _1767 = fma(_1743, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1759);
    float _1769 = _1687 * 0.15915493667125701904296875;
    float _1771 = _1745 * 6.283185482025146484375;
    float _1773 = cos(_1771);
    float _1775 = _1761 + _1765;
    float _1777 = _1763 + _1767;
    float _1779 = -_707;
    float _1781 = _1779 + _893;
    float _1783 = fma(_287, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1595);
    float _1785 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1787 = _1775 + _1785;
    float _1789 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1791 = _1777 + _1789;
    float _1793 = _1745 * 6.283185482025146484375;
    float _1795 = sin(_1793);
    float _1797 = _1787 * _1787;
    float _1799 = _1791 * _1791;
    float _1801 = fma(_291, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1783);
    float _1803 = _1797 + _1799;
    float _1805 = _1769 * 6.283185482025146484375;
    float _1807 = sin(_1805);
    float _1809 = sqrt(_1803);
    float _1811 = -_845;
    float _1813 = fma(_1807, _1773, _1811);
    float _1815 = -_847;
    float _1817 = fma(_1807, _1795, _1815);
    float _1819 = _1739 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1821 = fma(_839, _1781, _707);
    float _1823 = fma(_839, _1813, _845);
    float _1825 = fma(_839, _1817, _847);
    float _1827 = fma(_1741, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1819);
    float _1829 = _1821;
    float _1831 = _1823;
    float _1833 = _1825;
    float _1835 = _1639;
    float _1837 = _1691;
    float _1839 = _1801;
    float _1841 = _1617;
    float _1843 = _1763;
    float _1845 = _1761;
    if (!_1685)
    {
        float _1847 = fma(_1639, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1821);
        _1829 = _1847;
    }
    float _1849 = _1829;
    bool _1851 = _1809 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    if (!_1685)
    {
        float _1853 = fma(_1621, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1823);
        _1831 = _1853;
    }
    float _1855 = _1831;
    float _1857 = fma(_1743, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1827);
    float _1859 = _1801 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1861 = _1855;
    float _1863 = _1859;
    if (!_1685)
    {
        float _1865 = fma(_1617, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1825);
        _1833 = _1865;
    }
    float _1867 = _1833;
    float _1869 = -_1849;
    float _1871 = _1691 * _1869;
    float _1873 = _1697 * _1849;
    float _1875 = _1859 + _1857;
    float _1877 = _1703 * _1849;
    if (!_1851)
    {
        _1835 = _1799;
    }
    float _1879 = _1835;
    float _1881 = _1879;
    if (!_1851)
    {
        _1837 = _1797;
    }
    float _1883 = _1837;
    float _1885 = _1883;
    if (!_1851)
    {
        _297 = _1775;
    }
    float _1887 = _297;
    float _1889 = _1887;
    if (!_1851)
    {
        _1839 = _1777;
    }
    float _1891 = _1839;
    float _1893 = _1891;
    if (!_1851)
    {
        _1841 = _1875;
    }
    float _1895 = _1841;
    bool _1897 = !_1851;
    float _1899 = _1895;
    if (!_1897)
    {
        float _1901 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1903 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1905 = _1809 + _1903;
        float _1907 = rsqrt(_1803);
        float _1909 = _1905 * _1901;
        float _1911 = _1875 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1913 = _1909 * 0.15915493667125701904296875;
        float _1915 = _1913 * 6.283185482025146484375;
        float _1917 = sin(_1915);
        float _1919 = _1913 * 6.283185482025146484375;
        float _1921 = cos(_1919);
        float _1923 = fma(_1917, _1911, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1925 = _1907 * _1923;
        float _1927 = _1921 + (-1.0);
        float _1929 = _1787 * _1925;
        float _1931 = _1791 * _1925;
        float _1933 = _1927 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1935 = _1929 + (*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1937 = _1931 + (*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1939 = _1929 * _1929;
        float _1941 = fma(_1875, _1921, _1933);
        float _1943 = _1931 * _1931;
        _1899 = _1941;
        _1885 = _1939;
        _1881 = _1943;
        _1889 = _1935;
        _1893 = _1937;
    }
    float _1945 = _1899;
    float _1947 = _1885;
    float _1949 = _1881;
    float _1951 = _1889;
    float _1953 = _1893;
    float _1955 = in.m_69.x;
    float _1957 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1959 = _1945 + _1957;
    float _1961 = fma(_1711, _1855, _1873);
    float _1963 = fma(_1699, _1855, _1871);
    float _1965 = in.m_69.y;
    float _1967 = fma(_1959, _1959, _1947);
    float _1969 = fma(_1721, _1867, _1961);
    float _1971 = fma(_1717, _1855, _1877);
    float _1973 = fma(_1705, _1867, _1963);
    float _1975 = _1967 + _1949;
    float _1977 = _1969 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1979 = _1969 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1981 = _1969 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1983 = fma(_1713, _1867, _1971);
    float _1985 = fma(_1973, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1977);
    float _1987 = sqrt(_1975);
    float _1989 = fma(_1973, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1979);
    float _1991 = fma(_1973, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1981);
    float _1993 = fma(_1983, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1985);
    float _1995 = fma(_1983, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1989);
    float _1997 = fma(_1983, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1991);
    out.m_71.x = _1955;
    out.m_71.y = _1965;
    bool _1999 = _1987 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2001 = isnan(_1987);
    bool _2003 = _1999 || _2001;
    bool _2005 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2007 = _2003 || _2005;
    out.m_73.x = _1995;
    out.m_73.y = _1993;
    out.m_73.z = _1997;
    float _2009 = _1975;
    float _2011 = _1959;
    if (!_2007)
    {
        _2009 = 1.0;
    }
    float _2013 = _2009;
    bool _2015 = !_2007;
    float _2017 = _2013;
    if (!_2015)
    {
        bool _2019 = _1987 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2021 = isnan(_1987);
        bool _2023 = _2019 || _2021;
        bool _2025 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2027 = _2023 || _2025;
        if (!_2027)
        {
            float _2029 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2031 = _1987 + _2029;
            float _2033 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2035 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2033;
            float _2037 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2039 = _2037 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2041 = 1.0 / _2035;
            float _2043 = _2031 * _2041;
            float _2045 = fma(_2043, _2039, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2017 = _2045;
            _2047 = true;
        }
        else
        {
            bool _2049 = _1987 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2051 = isnan(_1987);
            bool _2053 = _2049 || _2051;
            bool _2055 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2057 = _2053 || _2055;
            if (!_2057)
            {
                float _2059 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2061 = _1987 + _2059;
                float _2063 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2065 = _2063 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2067 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2069 = _2067 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2071 = 1.0 / _2065;
                float _2073 = _2061 * _2071;
                float _2075 = fma(_2073, _2069, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2017 = _2075;
                _2047 = true;
            }
            else
            {
                _2017 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2047 = false;
    float _2077 = _2017;
    float _2079 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2081 = _1945 + _2079;
    float _2083 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2085 = _1951 + _2083;
    float _2087 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2089 = _1953 + _2087;
    float _2091 = fma(_2081, _2077, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2093 = fma(_2085, _2077, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2095 = fma(_2089, _2077, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2097 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2099 = _2091 + _2097;
    float _2101 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2103 = _2093 + _2101;
    float _2105 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2107 = _2095 + _2105;
    float _2109 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2111 = _2099 * _2099;
    float _2113 = fma(_2103, _2103, _2111);
    float _2115 = fma(_2107, _2107, _2113);
    float _2117 = rsqrt(_2115);
    float _2119 = _2117 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2121 = _2103 * _2119;
    float _2123 = _2107 * _2119;
    float _2125 = _2121 * _2121;
    float _2127 = _2123 * _2123;
    float _2129 = _2125 + _2127;
    float _2131 = sqrt(_2129);
    bool _2133 = _2131 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2135 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2137 = _2131 + _2135;
    float _2139 = _2117;
    float _2141 = _2137;
    float _2143 = _2119;
    float _2145 = _2121;
    if (_2133)
    {
        float _2147 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2139 = _2147;
    }
    float _2149 = _2139;
    if (_2133)
    {
        float _2151 = rsqrt(_2129);
        _2011 = _2151;
    }
    float _2153 = _2011;
    float _2155 = _2153;
    if (_2133)
    {
        float _2157 = _2137 * _2149;
        _2141 = _2157;
    }
    float _2159 = _2141;
    float _2161 = _2091 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    if (_2133)
    {
        float _2163 = _2159 * 0.15915493667125701904296875;
        _1861 = _2163;
    }
    float _2165 = _1861;
    float _2167 = fma(_2093, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2161);
    float _2169 = _1987;
    float _2171 = _2165;
    if (_2133)
    {
        float _2173 = _2165 * 6.283185482025146484375;
        float _2175 = sin(_2173);
        _2169 = _2175;
    }
    float _2177 = _2169;
    float _2179 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2181 = precise::max(0.0, _2179);
    float _2183 = _2107;
    float _2185 = _2181;
    float _2187 = _2179;
    if (_2133)
    {
        float _2189 = _2165 * 6.283185482025146484375;
        float _2191 = cos(_2189);
        _2183 = _2191;
    }
    float _2193 = _2183;
    float _2195 = -_2119;
    float _2197 = -_2181;
    float _2199 = fma(_2099, _2195, _2197);
    float _2201 = _2199;
    if (!_2133)
    {
        _2185 = _2125;
    }
    float _2203 = _2185;
    float _2205 = _2203;
    if (_2133)
    {
        float _2207 = _2199 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2187 = _2207;
    }
    float _2209 = _2187;
    float _2211 = _2177;
    float _2213 = _2209;
    if (_2133)
    {
        float _2215 = fma(_2177, _2209, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2211 = _2215;
    }
    float _2217 = _2211;
    float _2219 = _2217;
    if (_2133)
    {
        float _2221 = _2193 + (-1.0);
        _2213 = _2221;
    }
    float _2223 = _2213;
    if (_2133)
    {
        float _2225 = _2153 * _2217;
        _2143 = _2225;
    }
    float _2227 = _2143;
    if (!_2133)
    {
        _2155 = _2199;
    }
    float _2229 = _2155;
    float _2231 = _2229;
    if (_2133)
    {
        float _2233 = _2223 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2171 = _2233;
    }
    float _2235 = _2171;
    if (_2133)
    {
        float _2237 = _2121 * _2227;
        _2145 = _2237;
    }
    float _2239 = _2145;
    float _2241 = sqrt(_2115);
    if (!_2133)
    {
        _2219 = _2123;
    }
    float _2243 = _2219;
    float _2245 = _2243;
    if (_2133)
    {
        float _2247 = fma(_2199, _2193, _2235);
        _2231 = _2247;
    }
    float _2249 = _2231;
    if (_2133)
    {
        float _2251 = _2123 * _2227;
        _2245 = _2251;
    }
    float _2253 = _2245;
    if (_2133)
    {
        float _2255 = _2239 * _2239;
        _2205 = _2255;
    }
    float _2257 = _2205;
    if (!_2133)
    {
        _2201 = _2127;
    }
    float _2259 = _2201;
    float _2261 = _2091 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2263 = _2259;
    if (_2133)
    {
        float _2265 = _2253 * _2253;
        _2263 = _2265;
    }
    float _2267 = _2263;
    float _2269 = fma(_2249, _2249, _2257);
    float _2271 = fma(_2093, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2261);
    float _2273 = _2269 + _2267;
    float _2275 = _2091 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2277 = fma(_2095, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2271);
    float _2279 = rsqrt(_2273);
    float _2281 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2283 = fma(_2241, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2281);
    float _2285 = precise::clamp(_2283, 0.0, 1.0);
    float _2287 = fma(_2093, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2275);
    float _2289 = _2277 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2291 = -_2285;
    float _2293 = _2291 + 1.0;
    float _2295 = _2091 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2297 = _2289 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2299 = fma(_2095, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2287);
    float _2301 = fma(_2093, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2295);
    float _2303 = abs(_2293);
    float _2305 = log2(_2303);
    float _2307 = -_2297;
    float _2309 = fma(_2307, _2109, 1.0);
    float _2311 = _2299 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2313 = fma(_2095, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2301);
    float _2315 = fma(_2095, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2167);
    float _2317 = _2279 * _2239;
    float _2319 = _2279 * _2249;
    float _2321 = _2313 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2323 = _2279 * _2253;
    float _2325 = _2311 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2327 = _2317 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2329 = _2315 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2331 = log2(_2309);
    float _2333 = fma(_2321, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2325);
    float _2335 = -_2327;
    float _2337 = fma(_2319, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2335);
    float _2339 = _2319 + 1.0;
    float _2341 = _2305 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2343 = fma(_2289, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2333);
    float _2345 = -_2323;
    float _2347 = fma(_2345, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2337);
    float _2349 = _2311 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2351 = exp2(_2341);
    float _2353 = fma(_2329, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2343);
    float _2355 = fma(_2347, -0.5, 0.5);
    float _2357 = _2311 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2359 = fma(_2321, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2349);
    float _2361 = fma(_2347, 0.5, 0.5);
    float _2363 = fma(_2321, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2357);
    float _2365 = 1.0 / _2353;
    float _2367 = fma(_2289, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2359);
    float _2369 = fma(_2361, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2371 = fma(_2289, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2363);
    float _2373 = _2331 * 0.693147182464599609375;
    float _2375 = fma(_2329, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2367);
    float _2377 = fma(_2361, _2369, -0.212114393711090087890625);
    float _2379 = fma(_2329, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2371);
    float _2381 = sqrt(_2355);
    float _2383 = -_2319;
    float _2385 = fma(_2351, _2339, _2383);
    float _2387 = fma(_2361, _2377, 1.570728778839111328125);
    float _2389 = _2373 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2391 = fma(_2385, 0.5, 0.5);
    float _2393 = _2375 * _2365;
    float _2395 = _2379 * _2365;
    float _2397 = fma(_2393, 0.5, 0.5);
    float _2399 = fma(_2395, -0.5, 0.5);
    float _2401 = _2381 * 0.636619746685028076171875;
    float _2403 = -_2387;
    float _2405 = fma(_2401, _2403, 1.0);
    float3 _6223 = float3(_2397, _2399, _2389);
    float _2407 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6223, float3(0.0), isnan(_6223)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6223, float3(0.0), isnan(_6223)), level(0.0)).x;
    float3 _6234 = float3(_2397, _2399, _2389);
    float4 _2409 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6234, float3(0.0), isnan(_6234)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6234, float3(0.0), isnan(_6234)), level(0.0)).xyzw;
    float _2411 = _2409.x;
    float _2413 = _2409.y;
    float _2415 = _2409.z;
    float _2417 = _2409.w;
    float2 _6250 = float2(_2405, _2391);
    float3 _2421 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6250, float2(0.0), isnan(_6250)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6250, float2(0.0), isnan(_6250)), level(0.0)).xyz;
    float _2423 = _2421.x;
    float _2425 = _2421.y;
    float _2427 = _2421.z;
    float _2429 = _2305 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2431 = _2311 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_75.x = _2093;
    out.m_75.y = _2091;
    out.m_75.z = _2095;
    bool _2433 = _2241 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2435 = isnan(_2241);
    bool _2437 = _2433 || _2435;
    bool _2439 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2441 = _2437 || _2439;
    float _2443 = fma(_2321, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2431);
    float _2445 = exp2(_2429);
    out.m_77.x = _1761;
    out.m_77.y = _1859;
    out.m_77.z = _1763;
    float _2447 = fma(_2289, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2443);
    float _2449 = fma(_2329, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2447);
    float _2451 = _2449 + _2353;
    out.gl_Position.x = _2375;
    out.gl_Position.y = _2379;
    out.gl_Position.z = _2449;
    out.gl_Position.w = _2353;
    float _2453 = _2451;
    if (!_2441)
    {
        _1843 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2455 = _1843;
    float _2457 = -_2445;
    float _2459 = _2457 + 1.0;
    float _2461 = _2451 * 0.5;
    float _2463 = _2445;
    float _2465 = _2455;
    float _2467 = _2455;
    if (!_2441)
    {
        _2463 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2469 = _2463;
    float _2471 = _2459 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2473 = _2469;
    float _2475 = _2469;
    if (!_2441)
    {
        _2453 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2477 = _2453;
    out.m_79.z = _2461;
    out.m_79.w = _2353;
    float _2479 = _2477;
    float _2481 = _2477;
    if (!_2441)
    {
        _1863 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2483 = _1863;
    float _2485 = _2483;
    float _2487 = _2483;
    if (!_2441)
    {
        _1845 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2489 = _1845;
    float _2491 = _2471 * _2407;
    float _2493 = -_2471;
    float _2495 = _2493 + 1.0;
    float _2497 = _2417 * _2491;
    float _2499 = _2427 * _2491;
    float _2501 = _2417 * _2495;
    float _2503 = _2495;
    float _2505 = _2489;
    float _2507 = _2489;
    if (!_2441)
    {
        _2503 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2509 = _2503;
    float _2511 = fma(_2423, _2497, _2411);
    float _2513 = fma(_2425, _2497, _2413);
    float _2515 = fma(_2417, _2499, _2415);
    out.m_81.x = _2511;
    out.m_81.y = _2513;
    out.m_81.z = _2515;
    out.m_81.w = _2501;
    bool _2517 = !_2441;
    float _2519 = _2509;
    float _2521 = _2509;
    if (!_2517)
    {
        bool _2523 = _2241 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2525 = isnan(_2241);
        bool _2527 = _2523 || _2525;
        bool _2529 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2531 = _2527 || _2529;
        if (!_2531)
        {
            float _2533 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2535 = _2241 + _2533;
            float _2537 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2539 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2537;
            float _2541 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2543 = _2541 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2545 = 1.0 / _2539;
            float _2547 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2549 = _2547 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2551 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2553 = _2551 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2555 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2557 = _2555 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2559 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2561 = _2559 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2563 = _2535 * _2545;
            float _2565 = precise::clamp(_2563, 0.0, 1.0);
            float _2567 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2569 = _2567 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2571 = fma(_2565, _2543, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2573 = fma(_2565, _2569, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2575 = fma(_2565, _2549, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2577 = fma(_2565, _2553, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2579 = fma(_2565, _2557, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2581 = fma(_2565, _2561, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2521 = _2575;
            _2487 = _2579;
            _2475 = _2571;
            _2467 = _2577;
            _2481 = _2573;
            _2507 = _2581;
            _2583 = true;
        }
        else
        {
            bool _2585 = _2241 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2587 = isnan(_2241);
            bool _2589 = _2585 || _2587;
            bool _2591 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2593 = _2589 || _2591;
            if (!_2593)
            {
                _2473 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2595 = _2473;
            _2475 = _2595;
            if (!_2593)
            {
                _2519 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2597 = _2519;
            _2521 = _2597;
            if (!_2593)
            {
                _2479 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2599 = _2479;
            _2481 = _2599;
            if (!_2593)
            {
                _2465 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2601 = _2465;
            _2467 = _2601;
            if (!_2593)
            {
                _2485 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2603 = _2485;
            _2487 = _2603;
            if (!_2593)
            {
                _2505 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2605 = _2505;
            bool _2607 = !_2593;
            _2507 = _2605;
            if (!_2607)
            {
                bool _2609 = _2241 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2611 = isnan(_2241);
                bool _2613 = _2609 || _2611;
                bool _2615 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2617 = _2613 || _2615;
                if (!_2617)
                {
                    float _2619 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2621 = _2241 + _2619;
                    float _2623 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2625 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2623;
                    float _2627 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2629 = _2627 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2631 = 1.0 / _2625;
                    float _2633 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2635 = _2633 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2637 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2639 = _2637 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2641 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2643 = _2641 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2645 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2647 = _2645 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2649 = _2621 * _2631;
                    float _2651 = precise::clamp(_2649, 0.0, 1.0);
                    float _2653 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2655 = _2653 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2657 = fma(_2651, _2629, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2659 = fma(_2651, _2655, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2661 = fma(_2651, _2635, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2663 = fma(_2651, _2639, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2665 = fma(_2651, _2643, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2667 = fma(_2651, _2647, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2521 = _2661;
                    _2487 = _2665;
                    _2475 = _2657;
                    _2467 = _2663;
                    _2481 = _2659;
                    _2507 = _2667;
                    _2583 = true;
                }
                else
                {
                    _2521 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2487 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2475 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2467 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2481 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2507 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2583 = false;
    float _2669 = _2521;
    float _2671 = _2487;
    float _2673 = _2475;
    float _2675 = _2467;
    float _2677 = _2481;
    float _2679 = _2507;
    float _2681 = fma(_1993, -0.5, 0.5);
    float _2683 = precise::clamp(_2681, 0.0, 1.0);
    float _2685 = -_2669;
    float _2687 = _2685 + _2671;
    float _2689 = -_2673;
    float _2691 = _2689 + _2675;
    float _2693 = -_2677;
    float _2695 = _2693 + _2679;
    bool _2697 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2699 = fma(_2683, _2687, _2669);
    float _2701 = fma(_2683, _2691, _2673);
    float _2703 = fma(_2683, _2695, _2677);
    float _2705 = _2699 * 0.586610972881317138671875;
    out.m_55.x = 1.0;
    float _2707 = fma(_2701, 0.298911988735198974609375, _2705);
    out.m_83.w = (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2709 = fma(_2703, 0.114477999508380889892578125, _2707);
    out.m_85.x = 0.0;
    float _2711 = -_2709;
    float _2713 = _2701 + _2711;
    float _2715 = -_2709;
    float _2717 = _2699 + _2715;
    float _2719 = -_2709;
    float _2721 = _2703 + _2719;
    float _2723 = fma(_2713, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2709);
    float _2725 = fma(_2717, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2709);
    float _2727 = fma(_2721, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2709);
    out.m_87.x = _2723;
    out.m_87.y = _2725;
    out.m_87.z = _2727;
    if (!_2697)
    {
        return out;
    }
    float _2729 = -_2091;
    float _2731 = _2729 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2733 = -_2093;
    float _2735 = _2733 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2737 = -_2095;
    float _2739 = _2737 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2741 = _2731 * _2731;
    float _2743 = fma(_2735, _2735, _2741);
    float _2745 = fma(_2739, _2739, _2743);
    float _2747 = sqrt(_2745);
    float _2749 = rsqrt(_2745);
    float _2751 = -_2747;
    float _2753 = _2751 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2755 = _2753 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2757 = precise::clamp(_2755, 0.0, 1.0);
    float _2759 = _2735 * _2749;
    float _2761 = _2731 * _2749;
    float _2763 = abs(_2757);
    float _2765 = log2(_2763);
    float _2767 = _2739 * _2749;
    float _2769 = _2759 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2771 = _1993 * _2761;
    float _2773 = -_2761;
    float _2775 = -_2769;
    float _2777 = fma(_2773, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2775);
    float _2779 = fma(_1995, _2759, _2771);
    float _2781 = -_2767;
    float _2783 = fma(_2781, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2777);
    float _2785 = fma(_1997, _2767, _2779);
    float _2787 = precise::clamp(_2785, 0.0, 1.0);
    float _2789 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2791 = _2783 + _2789;
    float _2793 = _2765 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2795 = _2791 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2797 = precise::clamp(_2795, 0.0, 1.0);
    float _2799 = exp2(_2793);
    float _2801 = _2799 * _2797;
    float _2803 = _2787 * _2801;
    float _2805 = _2803 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2807 = _2803 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2809 = _2803 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_85.x = _2805;
    out.m_85.y = _2807;
    out.m_85.z = _2809;
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
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2583 = false;
    bool _2047 = false;
    bool _955 = false;
    bool _763 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _107 = in.m_48.w;
    float _109 = in.m_50.w;
    float _111 = trunc(_107);
    int _113 = int(_111);
    float _115 = -_109;
    float _117 = _115 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_53.y = _117;
    bool _121 = _113 >= 1;
    float _123 = 0.0;
    float _125 = as_type<float>(_113);
    float _127 = _117;
    if (!_121)
    {
        _123 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _129 = _123;
    if (!_121)
    {
        out.m_55.x = 0.0;
    }
    int _131 = 0;
    if (!_121)
    {
        float _133 = _129 * 5.0;
        _131 = as_type<int>(_133);
    }
    int _135 = _131;
    int _137 = _135;
    if (!_121)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2878 = as_type<float>(_135);
        out.gl_Position.z = _2878;
    }
    if (!_121)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _139 = _109 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _141 = isnan(_109);
    bool _143 = _139 || _141;
    bool _145 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _147 = _143 || _145;
    float _149 = in.m_57.x;
    float _151 = float(_113);
    float _153 = in.m_57.y;
    bool _155 = _117 >= _151;
    bool _157 = !_147;
    bool _159 = _155 || _157;
    if (_159)
    {
        _125 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _161 = _125;
    if (_159)
    {
        out.m_55.x = 0.0;
    }
    if (_159)
    {
        float _163 = _161 * 5.0;
        _137 = as_type<int>(_163);
    }
    int _165 = _137;
    out.m_59.x = _149;
    out.m_59.y = _153;
    if (_159)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2941 = as_type<float>(_165);
        out.gl_Position.z = _2941;
    }
    if (_159)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _167 = in.m_61.w;
    float _169 = 1.0 / _151;
    float _171 = _117 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _173 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _175 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _177 = _173 || _175;
    bool _179 = isnan(1.0);
    bool _181 = _177 || _179;
    float _183 = in.m_50.x;
    float _185 = in.m_50.y;
    float _187 = in.m_50.z;
    float _189 = in.m_48.x;
    float _191 = in.m_48.y;
    float _193 = in.m_48.z;
    float _195 = 0.0;
    float _197 = _171;
    if (!_181)
    {
        float _199 = _171 * _171;
        float _201 = _199 * 0.5;
        _195 = _201;
    }
    float _203 = _195;
    float _205 = _203;
    if (!_181)
    {
        float _207 = _203 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _205 = _207;
    }
    float _209 = _205;
    bool _211 = !_181;
    float _213 = _209;
    if (!_211)
    {
        float _215 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _217 = log2(_215);
        float _219 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _221 = _219 + 1.0;
        float _223 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _225 = _171 * _217;
        float _227 = 1.0 / _221;
        float _229 = _223 * 0.693147182464599609375;
        float _231 = exp2(_225);
        float _233 = 1.0 / _229;
        float _235 = _231 + (-1.0);
        float _237 = -_235;
        float _239 = fma(_237, _233, _171);
        float _241 = _239 * _227;
        float _243 = _241 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _213 = _243;
    }
    float _245 = _213;
    bool _247 = !_181;
    if (!_247)
    {
        float _249 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _251 = log2(_249);
        float _253 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _255 = _253 + 1.0;
        float _257 = 1.0 / _255;
        float _259 = _171 * _251;
        float _261 = exp2(_259);
        float _263 = -_261;
        float _265 = _263 + 1.0;
        float _267 = _265 * _257;
        _197 = _267;
    }
    float _269 = _197;
    bool _271 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _273 = _245 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _275 = _245 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _277 = _245 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _279 = fma(_269, _183, _273);
    float _281 = fma(_269, _185, _275);
    float _283 = fma(_269, _187, _277);
    float _285 = _117 * _169;
    float _287 = fma(_279, _167, _189);
    float _289 = fma(_281, _167, _191);
    float _291 = fma(_283, _167, _193);
    bool _293 = !_271;
    float _295 = _285;
    float _297 = _289;
    if (!_293)
    {
        float _299 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _301 = _149 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _303 = fma(_301, (*spvDescriptorSet0.vp_c9)._m0[11].x, _117);
        float _305 = _303 * _299;
        float _307 = floor(_305);
        float _309 = -_307;
        float _311 = _305 + _309;
        _295 = _311;
    }
    float _313 = _295;
    int _315 = int2(spvDescriptorSet0.vp_t_tcb_C.get_width(), spvDescriptorSet0.vp_t_tcb_C.get_height()).x;
    int _317 = _315;
    int _319 = 0;
    int _321 = _102(_317, _319, (*spvDescriptorSet0.support_buffer));
    float _323 = in.m_57.z;
    float _325 = _117 + _323;
    float _327 = _325 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _329 = float(_321);
    int _331 = abs(_321);
    bool _333 = _321 == 0;
    float _335 = _327 * _329;
    float _337 = float(uint(_331));
    float _339 = trunc(_335);
    int _341 = int(_339);
    float _343 = 1.0 / _337;
    int _345 = abs(_341);
    uint _348 = uint(int(uint(_341) >> uint(31)));
    float _350 = float(uint(_345));
    int _352 = ~int(_348);
    int _354 = _352 + 1;
    int _356 = as_type<int>(_343) + (-2);
    float _358 = in.m_63.z;
    float _360 = as_type<float>(_356) * _350;
    float _362 = trunc(_360);
    float _364 = precise::max(_362, 0.0);
    uint _366 = uint(_364);
    float _368 = trunc(_358);
    int _370 = int(_368);
    int _372 = ~int(_366);
    int _374 = _372 + 1;
    int _376 = _374 * _331;
    int _378 = _376 + _345;
    float _380 = float(uint(_378));
    float _382 = as_type<float>(_356) * _380;
    float _384 = trunc(_382);
    float _386 = precise::max(_384, 0.0);
    uint _388 = uint(_386);
    int _390 = int(_366) + int(_388);
    int _392 = ~_390;
    int _394 = _392 + 1;
    int _396 = _394 * _331;
    int _398 = _396 + _345;
    bool _400 = uint(_398) >= uint(_331);
    bool _402 = !_400;
    int _404 = _402 ? 0 : (-1);
    int _406 = ~_390;
    int _408 = _406 + _404;
    int _410 = _408 + 1;
    int _412 = _410 * _331;
    int _414 = _412 + _345;
    int _416 = _414 ^ _354;
    int _418 = ~_354;
    int _420 = _418 + _416;
    int _422 = _420 + 1;
    bool _424 = !_333;
    int _426 = _424 ? _422 : (-1);
    int _428 = _426;
    int _430 = 0;
    int _432 = _103(_428, _430, (*spvDescriptorSet0.support_buffer));
    int _434 = _370;
    int _436 = 0;
    int _438 = _103(_434, _436, (*spvDescriptorSet0.support_buffer));
    float4 _441 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_432, _438)), 0).xyzw;
    float _443 = _441.x;
    float _445 = _441.y;
    float _447 = _441.z;
    float _449 = _441.w;
    float _451 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _453 = _313 + _451;
    bool _455 = _313 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _457 = isnan(_313);
    bool _459 = _455 || _457;
    bool _461 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _463 = _459 || _461;
    float _465 = float(_463);
    float _467 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _469 = _313 + _467;
    bool _471 = _313 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _473 = isnan(_313);
    bool _475 = _471 || _473;
    bool _477 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _479 = _475 || _477;
    float _481 = float(_479);
    float _483 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _485 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _483;
    float _487 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _489 = _487 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _491 = _313 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _493 = isnan(_313);
    bool _495 = _491 || _493;
    bool _497 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _499 = _495 || _497;
    float _501 = float(_499);
    float _503 = 1.0 / _485;
    float _505 = -_501;
    float _507 = _505 + 1.0;
    float _509 = _481 * _507;
    float _511 = -_481;
    float _513 = _511 + 1.0;
    float _515 = 1.0 / _489;
    float _517 = _453 * _503;
    float _519 = -_465;
    float _521 = _519 + 1.0;
    float _523 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _525 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _523;
    float _527 = _501 * _521;
    float _529 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _531 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _529;
    float _533 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _535 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _533;
    float _537 = _469 * _515;
    int _539 = _426 + 1;
    float _541 = fma(_531, _517, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _543 = fma(_525, _517, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _545 = fma(_535, _517, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _547 = _541 * _509;
    float _549 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _551 = _549 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _553 = _543 * _509;
    float _555 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _557 = _555 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _559 = fma(_513, (*spvDescriptorSet0.vp_c9)._m0[107].x, _547);
    float _561 = fma(_551, _537, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _563 = fma(_513, (*spvDescriptorSet0.vp_c9)._m0[107].y, _553);
    float _565 = fma(_557, _537, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _567 = _545 * _509;
    float _569 = fma(_561, _527, _559);
    int _571 = abs(_539);
    float _573 = fma(_565, _527, _563);
    float _575 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _577 = _575 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _579 = fma(_465, (*spvDescriptorSet0.vp_c9)._m0[109].x, _569);
    float _581 = fma(_513, (*spvDescriptorSet0.vp_c9)._m0[107].z, _567);
    float _583 = fma(_465, (*spvDescriptorSet0.vp_c9)._m0[109].y, _573);
    float _585 = fma(_577, _537, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _587 = _579 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    uint _589 = uint(int(uint(_539) >> uint(31)));
    float _591 = _583 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _593 = fma(_585, _527, _581);
    float _595 = _587 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _597 = float(uint(_571));
    float _599 = _591 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _601 = fma(_465, (*spvDescriptorSet0.vp_c9)._m0[109].z, _593);
    int _603 = ~int(_589);
    int _605 = _603 + 1;
    float _607 = as_type<float>(_356) * _597;
    float _609 = _601 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _611 = _609 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _613 = trunc(_607);
    float _615 = precise::max(_613, 0.0);
    uint _617 = uint(_615);
    out.m_65.x = _595;
    out.m_65.y = _599;
    out.m_65.z = _611;
    int _619 = ~int(_617);
    int _621 = _619 + 1;
    int _623 = _621 * _331;
    int _625 = _623 + _571;
    float _627 = float(uint(_625));
    float _629 = as_type<float>(_356) * _627;
    float _631 = trunc(_629);
    float _633 = precise::max(_631, 0.0);
    uint _635 = uint(_633);
    int _637 = int(_617) + int(_635);
    int _639 = ~_637;
    int _641 = _639 + 1;
    int _643 = _641 * _331;
    int _645 = _643 + _571;
    bool _647 = uint(_645) >= uint(_331);
    bool _649 = !_647;
    int _651 = _649 ? 0 : (-1);
    int _653 = ~_637;
    int _655 = _653 + _651;
    int _657 = _655 + 1;
    int _659 = _657 * _331;
    int _661 = _659 + _571;
    int _663 = _661 ^ _605;
    int _665 = ~_605;
    int _667 = _665 + _663;
    int _669 = _667 + 1;
    bool _671 = !_333;
    int _673 = _671 ? _669 : (-1);
    uint _675 = as_type<uint>(half2(float2(_449, 0.0)));
    uint _677 = extract_bits(_675, 0u, 8u);
    int _679 = int(_677) & 255;
    uint _681 = extract_bits(_675, 8u, 8u);
    int _683 = int(_681) & 255;
    int _685 = _683 << 8;
    int _687 = _679 | _685;
    bool _689 = _687 >= 32768;
    int _691 = _687 + (-1024);
    int _693 = _691;
    if (_689)
    {
        int _695 = ~_687;
        int _697 = _695 + 33792;
        int _699 = _697 + 1;
        _693 = _699;
    }
    int _701 = _693;
    int _703 = _701 + 30719;
    float _705 = float(_703);
    float _707 = fma(_705, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _709 = abs(_707);
    float _711 = -_709;
    float _713 = _711 + 1.0;
    float _715 = abs(_707);
    float _717 = fma(_715, -0.0187292993068695068359375, 0.074261002242565155029296875);
    bool _719 = _707 < 0.0;
    float _721 = float(_719);
    int _723 = as_type<int>(_713) + (-218103808);
    float _725 = abs(_707);
    float _727 = fma(_725, _717, -0.212114393711090087890625);
    bool _729 = uint(_723) >= 1920991232u;
    float _731 = abs(_707);
    float _733 = fma(_731, _727, 1.570728778839111328125);
    bool _735 = !_729;
    float _761;
    if (!_735)
    {
        int _737 = as_type<int>(_713);
        int _739 = _651;
        int _741 = _669;
        int _743 = as_type<int>(_595);
        int _745 = 3296;
        int _747;
        int _749;
        int _751;
        int _753;
        int _755;
        int _757;
        int _759;
        _100(_737, _739, _741, _743, _745, _747, _749, _751, _753, _755, _757, _759, out.gl_Position, out.gl_PointSize);
        _761 = as_type<float>(_757);
        _763 = true;
    }
    else
    {
        float _765 = rsqrt(_713);
        float _767 = _713 * _765;
        float _769 = _765 * 0.5;
        float _771 = -_767;
        float _773 = 0.0 + _771;
        float _775 = fma(_769, _773, 0.5);
        float _777 = fma(_767, _775, _767);
        float _779 = -_777;
        float _781 = 0.0 + _779;
        float _783 = fma(_777, _781, _713);
        float _785 = fma(_769, _783, _777);
        _761 = _785;
    }
    _763 = false;
    float _787 = _761;
    int _789 = _673;
    int _791 = 0;
    int _793 = _103(_789, _791, (*spvDescriptorSet0.support_buffer));
    int _795 = _370;
    int _797 = 0;
    int _799 = _103(_795, _797, (*spvDescriptorSet0.support_buffer));
    float4 _801 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_793, _799)), 0).xyzw;
    float _803 = _801.x;
    float _805 = _801.y;
    float _807 = _801.z;
    float _809 = _801.w;
    float _811 = _733 * _787;
    float _813 = _721 * 2.0;
    float _815 = _705 * 3.883221149444580078125;
    float _817 = floor(_335);
    float _819 = -_813;
    float _821 = fma(_811, _819, _811);
    float _823 = _815 * 0.15915493667125701904296875;
    float _825 = fma(_721, 3.1415927410125732421875, _821);
    float _827 = _823 * 6.283185482025146484375;
    float _829 = cos(_827);
    float _831 = _825 * 0.15915493667125701904296875;
    float _833 = _831 * 6.283185482025146484375;
    float _835 = sin(_833);
    float _837 = -_817;
    float _839 = _335 + _837;
    float _841 = _823 * 6.283185482025146484375;
    float _843 = sin(_841);
    float _845 = _835 * _829;
    float _847 = _835 * _843;
    uint _849 = as_type<uint>(half2(float2(_809, 0.0)));
    float _851 = -_445;
    float _853 = _851 + _805;
    float _855 = -_447;
    float _857 = _855 + _807;
    uint _859 = extract_bits(_849, 0u, 8u);
    int _861 = int(_859) & 255;
    uint _863 = extract_bits(_849, 8u, 8u);
    int _865 = int(_863) & 255;
    int _867 = _865 << 8;
    int _869 = _861 | _867;
    float _871 = fma(_839, _853, _445);
    float _873 = fma(_839, _857, _447);
    bool _875 = _869 >= 32768;
    int _877 = _869 + (-1024);
    int _879 = _877;
    if (_875)
    {
        int _881 = ~_869;
        int _883 = _881 + 33792;
        int _885 = _883 + 1;
        _879 = _885;
    }
    int _887 = _879;
    int _889 = _887 + 30719;
    float _891 = float(_889);
    float _893 = fma(_891, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _895 = abs(_893);
    float _897 = -_895;
    float _899 = _897 + 1.0;
    bool _901 = _893 < 0.0;
    float _903 = float(_901);
    float _905 = abs(_893);
    float _907 = fma(_905, -0.0187292993068695068359375, 0.074261002242565155029296875);
    int _909 = as_type<int>(_899) + (-218103808);
    float _911 = abs(_893);
    float _913 = fma(_911, _907, -0.212114393711090087890625);
    bool _915 = uint(_909) >= 1920991232u;
    float _917 = -_443;
    float _919 = _917 + _803;
    float _921 = abs(_893);
    float _923 = fma(_921, _913, 1.570728778839111328125);
    float _925 = fma(_839, _919, _443);
    bool _927 = !_915;
    float _953;
    if (!_927)
    {
        int _929 = as_type<int>(_899);
        int _931 = as_type<int>(_803);
        int _933 = as_type<int>(_805);
        int _935 = as_type<int>(_811);
        int _937 = 4192;
        int _939;
        int _941;
        int _943;
        int _945;
        int _947;
        int _949;
        int _951;
        _100(_929, _931, _933, _935, _937, _939, _941, _943, _945, _947, _949, _951, out.gl_Position, out.gl_PointSize);
        _953 = as_type<float>(_949);
        _955 = true;
    }
    else
    {
        float _957 = rsqrt(_899);
        float _959 = _899 * _957;
        float _961 = _957 * 0.5;
        float _963 = -_959;
        float _965 = 0.0 + _963;
        float _967 = fma(_961, _965, 0.5);
        float _969 = fma(_959, _967, _959);
        float _971 = -_969;
        float _973 = 0.0 + _971;
        float _975 = fma(_969, _973, _899);
        float _977 = fma(_961, _975, _969);
        _953 = _977;
    }
    _955 = false;
    float _979 = _953;
    float _981 = in.m_57.x;
    float _983 = in.m_57.y;
    float _985 = in.m_57.z;
    float _987 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _989 = log2(_987);
    float _991 = _923 * _979;
    bool _993 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _995 = isnan(0.0);
    bool _997 = _993 || _995;
    bool _999 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1001 = _997 || _999;
    float _1003 = _891 * 3.883221149444580078125;
    bool _1005 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1007 = isnan(1.0);
    bool _1009 = _1005 || _1007;
    bool _1011 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1013 = _1009 || _1011;
    float _1015 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1017 = 1.0 + _1015;
    float _1019 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[201].x;
    float _1021 = (*spvDescriptorSet0.vp_c10)._m0[5].x * (*spvDescriptorSet0.vp_c10)._m0[5].x;
    float _1023 = _989 * _117;
    float _1025 = 1.0 / _1017;
    float _1027 = fma((*spvDescriptorSet0.vp_c10)._m0[4].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1021);
    float _1029 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1031 = _985 * 2.0;
    float _1033 = _981 * 2.0;
    float _1035 = exp2(_1023);
    float _1037 = _983 * 2.0;
    float _1039 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _1029);
    float _1041 = floor(_1031);
    float _1043 = fma((*spvDescriptorSet0.vp_c10)._m0[6].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1027);
    float _1045 = floor(_1033);
    float _1047 = -_1035;
    float _1049 = _1047 + 1.0;
    float _1051 = _1001 ? _1049 : 0.0;
    bool _1053 = _1041 > 0.0;
    float _1055 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[201].y;
    bool _1057 = _1041 >= 0.0;
    bool _1059 = isnan(_1041);
    bool _1061 = _1057 || _1059;
    bool _1063 = isnan(0.0);
    bool _1065 = _1061 || _1063;
    if (_1013)
    {
        float _1067 = _1051 * _1025;
        _127 = _1067;
    }
    float _1069 = _127;
    int _1071 = _1065 ? 0 : 1;
    float _1073 = _1069 + (*spvDescriptorSet0.vp_c9)._m0[202].x;
    bool _1075 = _1045 >= 0.0;
    bool _1077 = isnan(_1045);
    bool _1079 = _1075 || _1077;
    bool _1081 = isnan(0.0);
    bool _1083 = _1079 || _1081;
    float _1085 = floor(_1037);
    int _1087 = ~_1071;
    int _1089 = _1087 + 1;
    int _1091 = _1089 + 1;
    float _1093 = _1073 * _1019;
    int _1095 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 4096;
    bool _1097 = _1095 != 0;
    int _1099 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 8192;
    bool _1101 = _1099 != 0;
    int _1103 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 16384;
    bool _1105 = _1103 != 0;
    float _1107 = _1069 + (*spvDescriptorSet0.vp_c9)._m0[202].y;
    int _1109 = _1091;
    if (!_1053)
    {
        int _1111 = ~_1071;
        int _1113 = _1111 + 1;
        _1109 = _1113;
    }
    int _1115 = _1109;
    float _1117 = fma(_981, (*spvDescriptorSet0.vp_c9)._m0[203].x, _1093);
    int _1119 = _1083 ? 0 : 1;
    float _1121 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[201].z;
    int _1123 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 65536;
    bool _1125 = _1123 != 0;
    int _1127 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 131072;
    bool _1129 = _1127 != 0;
    float _1131 = _1107 * _1055;
    bool _1133 = !_1101;
    int _1135 = _1133 ? 0 : 1;
    float _1137 = _983 + _981;
    bool _1139 = _1045 > 0.0;
    float _1141 = fma(_981, (*spvDescriptorSet0.vp_c9)._m0[203].y, _1131);
    bool _1143 = !_1097;
    int _1145 = _1143 ? 0 : 1;
    float _1147 = floor(_1117);
    int _1149 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 262144;
    bool _1151 = _1149 != 0;
    int _1153 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 524288;
    bool _1155 = _1153 != 0;
    int _1157 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1048576;
    bool _1159 = _1157 != 0;
    float _1161 = _1137 + (-1.0);
    int _1163 = ~_1119;
    int _1165 = _1163 + 1;
    int _1167 = _1165 + 1;
    bool _1169 = !_1105;
    int _1171 = _1169 ? 0 : 1;
    float _1173 = fma(_1161, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _1175 = !_1159;
    int _1177 = _1175 ? 0 : 1;
    float _1179 = floor(_1141);
    int _1181 = _1167;
    if (!_1139)
    {
        int _1183 = ~_1119;
        int _1185 = _1183 + 1;
        _1181 = _1185;
    }
    int _1187 = _1181;
    int _1189 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1191 = _1189 != 0;
    int _1193 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1195 = _1193 != 0;
    int _1197 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1199 = _1197 != 0;
    float _1201 = _983 + _985;
    float _1203 = (*spvDescriptorSet0.vp_c10)._m0[5].z * (*spvDescriptorSet0.vp_c10)._m0[5].z;
    bool _1205 = !_1125;
    int _1207 = _1205 ? 0 : 1;
    float _1209 = -_1147;
    float _1211 = _1117 + _1209;
    float _1213 = _1201 + (-1.0);
    float _1215 = fma((*spvDescriptorSet0.vp_c10)._m0[4].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1203);
    bool _1217 = _1085 >= 0.0;
    bool _1219 = isnan(_1085);
    bool _1221 = _1217 || _1219;
    bool _1223 = isnan(0.0);
    bool _1225 = _1221 || _1223;
    float _1227 = _1141 + 0.25;
    float _1229 = fma(_1213, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1231 = fma((*spvDescriptorSet0.vp_c10)._m0[6].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1215);
    int _1233 = _1225 ? 0 : 1;
    float _1235 = floor(_1227);
    bool _1237 = _1085 > 0.0;
    float _1239 = _1117 + 0.25;
    bool _1241 = !_1191;
    int _1243 = _1241 ? 0 : 1;
    float _1245 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _1039);
    float _1247 = _1069 + (*spvDescriptorSet0.vp_c9)._m0[202].z;
    float _1249 = float(_1115);
    float _1251 = _983 + (-0.5);
    float _1253 = floor(_1239);
    int _1255 = abs(_1243);
    float _1257 = _1247 * _1121;
    int _1259 = ~_1233;
    int _1261 = _1259 + 1;
    int _1263 = _1261 + 1;
    float _1265 = float(_1255);
    float _1267 = fma(_981, (*spvDescriptorSet0.vp_c9)._m0[203].z, _1257);
    int _1269 = _1263;
    if (!_1237)
    {
        int _1271 = ~_1233;
        int _1273 = _1271 + 1;
        _1269 = _1273;
    }
    int _1275 = _1269;
    float _1277 = rsqrt(_1245);
    bool _1279 = _1211 >= 0.5;
    bool _1281 = isnan(_1211);
    bool _1283 = _1279 || _1281;
    bool _1285 = isnan(0.5);
    bool _1287 = _1283 || _1285;
    float _1289 = _1265 * _1249;
    float _1291 = -_1179;
    float _1293 = _1141 + _1291;
    int _1295 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 32768;
    bool _1297 = _1295 != 0;
    bool _1299 = !_1287;
    float _1301 = _1299 ? 0.5 : (-0.5);
    float _1303 = floor(_1267);
    float _1305 = -_1253;
    float _1307 = _1239 + _1305;
    int _1309 = abs(_1135);
    float _1311 = _1117 * 6.283185482025146484375;
    bool _1313 = _1293 >= 0.5;
    bool _1315 = isnan(_1293);
    bool _1317 = _1313 || _1315;
    bool _1319 = isnan(0.5);
    bool _1321 = _1317 || _1319;
    float _1323 = -_1235;
    float _1325 = _1227 + _1323;
    int _1327 = abs(_1207);
    float _1329 = _1141 * 6.283185482025146484375;
    float _1331 = _1311 * 0.15915493667125701904296875;
    float _1333 = float(_1309);
    float _1335 = _1301 * (*spvDescriptorSet0.vp_c9)._m0[200].x;
    float _1337 = _1335 * 2.0;
    bool _1339 = !_1321;
    float _1341 = _1339 ? 0.5 : (-0.5);
    float _1343 = _1329 * 0.15915493667125701904296875;
    float _1345 = _1267 + 0.25;
    float _1347 = _1333 * _1337;
    float _1349 = -_1303;
    float _1351 = _1267 + _1349;
    float _1353 = float(_1327);
    float _1355 = floor(_1345);
    bool _1357 = !_1155;
    int _1359 = _1357 ? 0 : 1;
    float _1361 = _1341 * (*spvDescriptorSet0.vp_c9)._m0[200].y;
    float _1363 = _1361 * 2.0;
    bool _1365 = _1351 >= 0.5;
    bool _1367 = isnan(_1351);
    bool _1369 = _1365 || _1367;
    bool _1371 = isnan(0.5);
    bool _1373 = _1369 || _1371;
    float _1375 = _1267 * 6.283185482025146484375;
    bool _1377 = !_1297;
    int _1379 = _1377 ? 0 : 1;
    float _1381 = _1353 * _1363;
    int _1383 = abs(_1359);
    float _1385 = _1331 * 6.283185482025146484375;
    float _1387 = sin(_1385);
    bool _1389 = !_1373;
    float _1391 = _1389 ? 0.5 : (-0.5);
    float _1393 = _871 * _1277;
    bool _1395 = _1307 > 0.5;
    int _1397 = abs(_1145);
    int _1399 = abs(_1379);
    float _1401 = _1343 * 6.283185482025146484375;
    float _1403 = sin(_1401);
    float _1405 = -_1355;
    float _1407 = _1345 + _1405;
    float _1409 = _1391 * (*spvDescriptorSet0.vp_c9)._m0[200].z;
    float _1411 = _1409 * 2.0;
    float _1413 = float(_1383);
    float _1415 = _1387 * (*spvDescriptorSet0.vp_c9)._m0[200].x;
    float _1417 = float(_1397);
    float _1419 = _1307;
    float _1421 = _1325;
    float _1423 = _1407;
    if (_1395)
    {
        float _1425 = -_1307;
        float _1427 = _1425 + 1.0;
        _1419 = _1427;
    }
    float _1429 = _1419;
    float _1431 = float(_1399);
    float _1433 = _1413 * _1411;
    float _1435 = _1375 * 0.15915493667125701904296875;
    bool _1437 = _1325 > 0.5;
    float _1439 = fma(_1429, 4.0, -1.0);
    float _1441 = _1403 * (*spvDescriptorSet0.vp_c9)._m0[200].y;
    float _1443 = fma(_1417, _1415, _1347);
    bool _1445 = !_1151;
    int _1447 = _1445 ? 0 : 1;
    float _1449 = _1435 * 6.283185482025146484375;
    float _1451 = sin(_1449);
    float _1453 = fma(_1431, _1441, _1381);
    bool _1455 = !_1129;
    int _1457 = _1455 ? 0 : 1;
    float _1459 = in.m_67.x;
    float _1461 = in.m_67.y;
    float _1463 = in.m_67.z;
    int _1465 = abs(_1171);
    int _1467 = abs(_1447);
    if (_1437)
    {
        float _1469 = -_1325;
        float _1471 = _1469 + 1.0;
        _1421 = _1471;
    }
    float _1473 = _1421;
    bool _1475 = _1407 > 0.5;
    int _1477 = abs(_1457);
    float _1479 = _1439 * (*spvDescriptorSet0.vp_c9)._m0[200].x;
    float _1481 = float(_1465);
    float _1483 = fma(_1473, 4.0, -1.0);
    float _1485 = float(_1467);
    float _1487 = _1451 * (*spvDescriptorSet0.vp_c9)._m0[200].z;
    bool _1489 = !_1195;
    int _1491 = _1489 ? 0 : 1;
    float _1493 = fma(_1481, _1479, _1443);
    float _1495 = float(_1477);
    float _1497 = fma(_1485, _1487, _1433);
    float _1499 = _1483 * (*spvDescriptorSet0.vp_c9)._m0[200].y;
    int _1501 = abs(_1177);
    float _1503 = _1289 * (-2.0);
    int _1505 = abs(_1491);
    if (_1475)
    {
        float _1507 = -_1407;
        float _1509 = _1507 + 1.0;
        _1423 = _1509;
    }
    float _1511 = _1423;
    float _1513 = fma(_1495, _1499, _1453);
    float _1515 = fma(_1493, 3.1415927410125732421875, _1459);
    float _1517 = float(_1187);
    float _1519 = fma(_1173, _1503, _1173);
    float _1521 = fma(_1515, _1503, _1515);
    float _1523 = float(_1505);
    float _1525 = fma(_1511, 4.0, -1.0);
    float _1527 = _981 + (-0.5);
    float _1529 = float(_1501);
    float _1531 = fma(_1513, 3.1415927410125732421875, _1461);
    float _1533 = _1525 * (*spvDescriptorSet0.vp_c9)._m0[200].z;
    float _1535 = fma(_1527, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1521);
    float _1537 = _1523 * _1517;
    bool _1539 = !_1199;
    int _1541 = _1539 ? 0 : 1;
    float _1543 = fma(_1529, _1533, _1497);
    float _1545 = fma(_1519, _1069, _1535);
    float _1547 = _1537 * (-2.0);
    int _1549 = abs(_1541);
    float _1551 = rsqrt(_1231);
    float _1553 = float(_1275);
    float _1555 = fma(_1531, _1547, _1531);
    float _1557 = float(_1549);
    float _1559 = fma(_1229, _1547, _1229);
    float _1561 = in.m_61.x;
    float _1563 = in.m_61.y;
    float _1565 = in.m_61.z;
    float _1567 = fma(_1251, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1555);
    float _1569 = _981 + _985;
    float _1571 = _1557 * _1553;
    float _1573 = rsqrt(_1043);
    float _1575 = fma(_1559, _1069, _1567);
    float _1577 = fma(_1543, 3.1415927410125732421875, _1463);
    float _1579 = _1569 + (-1.0);
    float _1581 = _1571 * (-2.0);
    float _1583 = _1575 * 0.15915493667125701904296875;
    float _1585 = _985 + (-0.5);
    float _1587 = _1545 * 0.15915493667125701904296875;
    float _1589 = sqrt(_1043);
    float _1591 = fma(_1577, _1581, _1577);
    float _1593 = _873 * _1551;
    float _1595 = _289 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1597 = fma(_1585, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1591);
    float _1599 = _1587 * 6.283185482025146484375;
    float _1601 = sin(_1599);
    float _1603 = _925 * _1573;
    float _1605 = _1563 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1607 = _1561 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1609 = fma(_1579, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1611 = _1565 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _1613 = _1587 * 6.283185482025146484375;
    float _1615 = cos(_1613);
    float _1617 = _1589 * _1593;
    float _1619 = fma(_1609, _1581, _1609);
    float _1621 = _1589 * _1603;
    float _1623 = _1607 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1625 = _1605 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1627 = fma(_1619, _1069, _1597);
    float _1629 = _903 * 2.0;
    float _1631 = _1583 * 6.283185482025146484375;
    float _1633 = sin(_1631);
    float _1635 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1621);
    float _1637 = _1627 * 0.15915493667125701904296875;
    float _1639 = _1589 * _1393;
    float _1641 = _1611 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1643 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1617);
    float _1645 = _1623 * _1635;
    float _1647 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1639);
    float _1649 = _1583 * 6.283185482025146484375;
    float _1651 = cos(_1649);
    float _1653 = _1641 * _1643;
    bool _1655 = _1639 != 0.0;
    bool _1657 = isnan(_1639);
    bool _1659 = _1655 || _1657;
    bool _1661 = isnan(0.0);
    bool _1663 = _1659 || _1661;
    float _1665 = _1625 * _1647;
    bool _1667 = _1621 == 0.0;
    bool _1669 = !_1663;
    bool _1671 = _1667 && _1669;
    float _1673 = _1637 * 6.283185482025146484375;
    float _1675 = cos(_1673);
    float _1677 = -_1629;
    float _1679 = fma(_991, _1677, _991);
    float _1681 = _1601 * _1633;
    bool _1683 = _1617 == 0.0;
    bool _1685 = _1683 && _1671;
    float _1687 = fma(_903, 3.1415927410125732421875, _1679);
    float _1689 = _1637 * 6.283185482025146484375;
    float _1691 = sin(_1689);
    float _1693 = _1615 * _1651;
    float _1695 = _1601 * _1651;
    float _1697 = _1615 * _1675;
    float _1699 = _1651 * _1675;
    float _1701 = _1615 * _1633;
    float _1703 = _1601 * _1675;
    float _1705 = _1633 * _1675;
    float _1707 = _289 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1709 = _1703 * _1665;
    float _1711 = fma(_1691, _1693, _1681);
    float _1713 = fma(_1691, _1681, _1693);
    float _1715 = -_1701;
    float _1717 = fma(_1691, _1695, _1715);
    float _1719 = -_1695;
    float _1721 = fma(_1691, _1701, _1719);
    float _1723 = _1697 * _1665;
    float _1725 = -_1665;
    float _1727 = _1691 * _1725;
    float _1729 = fma(_287, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1707);
    float _1731 = fma(_1711, _1645, _1723);
    float _1733 = fma(_1699, _1645, _1727);
    float _1735 = fma(_1717, _1645, _1709);
    float _1737 = _289 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1739 = fma(_1721, _1653, _1731);
    float _1741 = fma(_1705, _1653, _1733);
    float _1743 = fma(_1713, _1653, _1735);
    float _1745 = _1003 * 0.15915493667125701904296875;
    float _1747 = fma(_287, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1737);
    float _1749 = _1739 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1751 = _1739 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1753 = fma(_291, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1729);
    float _1755 = fma(_291, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1747);
    float _1757 = fma(_1741, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1749);
    float _1759 = fma(_1741, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1751);
    float _1761 = _1753 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1763 = _1755 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1765 = fma(_1743, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1757);
    float _1767 = fma(_1743, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1759);
    float _1769 = _1687 * 0.15915493667125701904296875;
    float _1771 = _1745 * 6.283185482025146484375;
    float _1773 = cos(_1771);
    float _1775 = _1761 + _1765;
    float _1777 = _1763 + _1767;
    float _1779 = -_707;
    float _1781 = _1779 + _893;
    float _1783 = fma(_287, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1595);
    float _1785 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1787 = _1775 + _1785;
    float _1789 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1791 = _1777 + _1789;
    float _1793 = _1745 * 6.283185482025146484375;
    float _1795 = sin(_1793);
    float _1797 = _1787 * _1787;
    float _1799 = _1791 * _1791;
    float _1801 = fma(_291, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1783);
    float _1803 = _1797 + _1799;
    float _1805 = _1769 * 6.283185482025146484375;
    float _1807 = sin(_1805);
    float _1809 = sqrt(_1803);
    float _1811 = -_845;
    float _1813 = fma(_1807, _1773, _1811);
    float _1815 = -_847;
    float _1817 = fma(_1807, _1795, _1815);
    float _1819 = _1739 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1821 = fma(_839, _1781, _707);
    float _1823 = fma(_839, _1813, _845);
    float _1825 = fma(_839, _1817, _847);
    float _1827 = fma(_1741, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1819);
    float _1829 = _1821;
    float _1831 = _1823;
    float _1833 = _1825;
    float _1835 = _1639;
    float _1837 = _1691;
    float _1839 = _1801;
    float _1841 = _1617;
    float _1843 = _1763;
    float _1845 = _1761;
    if (!_1685)
    {
        float _1847 = fma(_1639, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1821);
        _1829 = _1847;
    }
    float _1849 = _1829;
    bool _1851 = _1809 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    if (!_1685)
    {
        float _1853 = fma(_1621, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1823);
        _1831 = _1853;
    }
    float _1855 = _1831;
    float _1857 = fma(_1743, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1827);
    float _1859 = _1801 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1861 = _1855;
    float _1863 = _1859;
    if (!_1685)
    {
        float _1865 = fma(_1617, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1825);
        _1833 = _1865;
    }
    float _1867 = _1833;
    float _1869 = -_1849;
    float _1871 = _1691 * _1869;
    float _1873 = _1697 * _1849;
    float _1875 = _1859 + _1857;
    float _1877 = _1703 * _1849;
    if (!_1851)
    {
        _1835 = _1799;
    }
    float _1879 = _1835;
    float _1881 = _1879;
    if (!_1851)
    {
        _1837 = _1797;
    }
    float _1883 = _1837;
    float _1885 = _1883;
    if (!_1851)
    {
        _297 = _1775;
    }
    float _1887 = _297;
    float _1889 = _1887;
    if (!_1851)
    {
        _1839 = _1777;
    }
    float _1891 = _1839;
    float _1893 = _1891;
    if (!_1851)
    {
        _1841 = _1875;
    }
    float _1895 = _1841;
    bool _1897 = !_1851;
    float _1899 = _1895;
    if (!_1897)
    {
        float _1901 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1903 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1905 = _1809 + _1903;
        float _1907 = rsqrt(_1803);
        float _1909 = _1905 * _1901;
        float _1911 = _1875 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1913 = _1909 * 0.15915493667125701904296875;
        float _1915 = _1913 * 6.283185482025146484375;
        float _1917 = sin(_1915);
        float _1919 = _1913 * 6.283185482025146484375;
        float _1921 = cos(_1919);
        float _1923 = fma(_1917, _1911, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1925 = _1907 * _1923;
        float _1927 = _1921 + (-1.0);
        float _1929 = _1787 * _1925;
        float _1931 = _1791 * _1925;
        float _1933 = _1927 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1935 = _1929 + (*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1937 = _1931 + (*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1939 = _1929 * _1929;
        float _1941 = fma(_1875, _1921, _1933);
        float _1943 = _1931 * _1931;
        _1899 = _1941;
        _1885 = _1939;
        _1881 = _1943;
        _1889 = _1935;
        _1893 = _1937;
    }
    float _1945 = _1899;
    float _1947 = _1885;
    float _1949 = _1881;
    float _1951 = _1889;
    float _1953 = _1893;
    float _1955 = in.m_69.x;
    float _1957 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1959 = _1945 + _1957;
    float _1961 = fma(_1711, _1855, _1873);
    float _1963 = fma(_1699, _1855, _1871);
    float _1965 = in.m_69.y;
    float _1967 = fma(_1959, _1959, _1947);
    float _1969 = fma(_1721, _1867, _1961);
    float _1971 = fma(_1717, _1855, _1877);
    float _1973 = fma(_1705, _1867, _1963);
    float _1975 = _1967 + _1949;
    float _1977 = _1969 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1979 = _1969 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1981 = _1969 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1983 = fma(_1713, _1867, _1971);
    float _1985 = fma(_1973, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1977);
    float _1987 = sqrt(_1975);
    float _1989 = fma(_1973, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1979);
    float _1991 = fma(_1973, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1981);
    float _1993 = fma(_1983, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1985);
    float _1995 = fma(_1983, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1989);
    float _1997 = fma(_1983, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1991);
    out.m_71.x = _1955;
    out.m_71.y = _1965;
    bool _1999 = _1987 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2001 = isnan(_1987);
    bool _2003 = _1999 || _2001;
    bool _2005 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2007 = _2003 || _2005;
    out.m_73.x = _1995;
    out.m_73.y = _1993;
    out.m_73.z = _1997;
    float _2009 = _1975;
    float _2011 = _1959;
    if (!_2007)
    {
        _2009 = 1.0;
    }
    float _2013 = _2009;
    bool _2015 = !_2007;
    float _2017 = _2013;
    if (!_2015)
    {
        bool _2019 = _1987 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2021 = isnan(_1987);
        bool _2023 = _2019 || _2021;
        bool _2025 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2027 = _2023 || _2025;
        if (!_2027)
        {
            float _2029 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2031 = _1987 + _2029;
            float _2033 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2035 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2033;
            float _2037 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2039 = _2037 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2041 = 1.0 / _2035;
            float _2043 = _2031 * _2041;
            float _2045 = fma(_2043, _2039, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2017 = _2045;
            _2047 = true;
        }
        else
        {
            bool _2049 = _1987 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2051 = isnan(_1987);
            bool _2053 = _2049 || _2051;
            bool _2055 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2057 = _2053 || _2055;
            if (!_2057)
            {
                float _2059 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2061 = _1987 + _2059;
                float _2063 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2065 = _2063 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2067 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2069 = _2067 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2071 = 1.0 / _2065;
                float _2073 = _2061 * _2071;
                float _2075 = fma(_2073, _2069, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2017 = _2075;
                _2047 = true;
            }
            else
            {
                _2017 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2047 = false;
    float _2077 = _2017;
    float _2079 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2081 = _1945 + _2079;
    float _2083 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2085 = _1951 + _2083;
    float _2087 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2089 = _1953 + _2087;
    float _2091 = fma(_2081, _2077, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2093 = fma(_2085, _2077, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2095 = fma(_2089, _2077, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2097 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2099 = _2091 + _2097;
    float _2101 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2103 = _2093 + _2101;
    float _2105 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2107 = _2095 + _2105;
    float _2109 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2111 = _2099 * _2099;
    float _2113 = fma(_2103, _2103, _2111);
    float _2115 = fma(_2107, _2107, _2113);
    float _2117 = rsqrt(_2115);
    float _2119 = _2117 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2121 = _2103 * _2119;
    float _2123 = _2107 * _2119;
    float _2125 = _2121 * _2121;
    float _2127 = _2123 * _2123;
    float _2129 = _2125 + _2127;
    float _2131 = sqrt(_2129);
    bool _2133 = _2131 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2135 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2137 = _2131 + _2135;
    float _2139 = _2117;
    float _2141 = _2137;
    float _2143 = _2119;
    float _2145 = _2121;
    if (_2133)
    {
        float _2147 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2139 = _2147;
    }
    float _2149 = _2139;
    if (_2133)
    {
        float _2151 = rsqrt(_2129);
        _2011 = _2151;
    }
    float _2153 = _2011;
    float _2155 = _2153;
    if (_2133)
    {
        float _2157 = _2137 * _2149;
        _2141 = _2157;
    }
    float _2159 = _2141;
    float _2161 = _2091 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    if (_2133)
    {
        float _2163 = _2159 * 0.15915493667125701904296875;
        _1861 = _2163;
    }
    float _2165 = _1861;
    float _2167 = fma(_2093, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2161);
    float _2169 = _1987;
    float _2171 = _2165;
    if (_2133)
    {
        float _2173 = _2165 * 6.283185482025146484375;
        float _2175 = sin(_2173);
        _2169 = _2175;
    }
    float _2177 = _2169;
    float _2179 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2181 = precise::max(0.0, _2179);
    float _2183 = _2107;
    float _2185 = _2181;
    float _2187 = _2179;
    if (_2133)
    {
        float _2189 = _2165 * 6.283185482025146484375;
        float _2191 = cos(_2189);
        _2183 = _2191;
    }
    float _2193 = _2183;
    float _2195 = -_2119;
    float _2197 = -_2181;
    float _2199 = fma(_2099, _2195, _2197);
    float _2201 = _2199;
    if (!_2133)
    {
        _2185 = _2125;
    }
    float _2203 = _2185;
    float _2205 = _2203;
    if (_2133)
    {
        float _2207 = _2199 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2187 = _2207;
    }
    float _2209 = _2187;
    float _2211 = _2177;
    float _2213 = _2209;
    if (_2133)
    {
        float _2215 = fma(_2177, _2209, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2211 = _2215;
    }
    float _2217 = _2211;
    float _2219 = _2217;
    if (_2133)
    {
        float _2221 = _2193 + (-1.0);
        _2213 = _2221;
    }
    float _2223 = _2213;
    if (_2133)
    {
        float _2225 = _2153 * _2217;
        _2143 = _2225;
    }
    float _2227 = _2143;
    if (!_2133)
    {
        _2155 = _2199;
    }
    float _2229 = _2155;
    float _2231 = _2229;
    if (_2133)
    {
        float _2233 = _2223 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2171 = _2233;
    }
    float _2235 = _2171;
    if (_2133)
    {
        float _2237 = _2121 * _2227;
        _2145 = _2237;
    }
    float _2239 = _2145;
    float _2241 = sqrt(_2115);
    if (!_2133)
    {
        _2219 = _2123;
    }
    float _2243 = _2219;
    float _2245 = _2243;
    if (_2133)
    {
        float _2247 = fma(_2199, _2193, _2235);
        _2231 = _2247;
    }
    float _2249 = _2231;
    if (_2133)
    {
        float _2251 = _2123 * _2227;
        _2245 = _2251;
    }
    float _2253 = _2245;
    if (_2133)
    {
        float _2255 = _2239 * _2239;
        _2205 = _2255;
    }
    float _2257 = _2205;
    if (!_2133)
    {
        _2201 = _2127;
    }
    float _2259 = _2201;
    float _2261 = _2091 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2263 = _2259;
    if (_2133)
    {
        float _2265 = _2253 * _2253;
        _2263 = _2265;
    }
    float _2267 = _2263;
    float _2269 = fma(_2249, _2249, _2257);
    float _2271 = fma(_2093, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2261);
    float _2273 = _2269 + _2267;
    float _2275 = _2091 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2277 = fma(_2095, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2271);
    float _2279 = rsqrt(_2273);
    float _2281 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2283 = fma(_2241, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2281);
    float _2285 = precise::clamp(_2283, 0.0, 1.0);
    float _2287 = fma(_2093, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2275);
    float _2289 = _2277 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2291 = -_2285;
    float _2293 = _2291 + 1.0;
    float _2295 = _2091 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2297 = _2289 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2299 = fma(_2095, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2287);
    float _2301 = fma(_2093, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2295);
    float _2303 = abs(_2293);
    float _2305 = log2(_2303);
    float _2307 = -_2297;
    float _2309 = fma(_2307, _2109, 1.0);
    float _2311 = _2299 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2313 = fma(_2095, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2301);
    float _2315 = fma(_2095, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2167);
    float _2317 = _2279 * _2239;
    float _2319 = _2279 * _2249;
    float _2321 = _2313 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2323 = _2279 * _2253;
    float _2325 = _2311 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2327 = _2317 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2329 = _2315 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2331 = log2(_2309);
    float _2333 = fma(_2321, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2325);
    float _2335 = -_2327;
    float _2337 = fma(_2319, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2335);
    float _2339 = _2319 + 1.0;
    float _2341 = _2305 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2343 = fma(_2289, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2333);
    float _2345 = -_2323;
    float _2347 = fma(_2345, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2337);
    float _2349 = _2311 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2351 = exp2(_2341);
    float _2353 = fma(_2329, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2343);
    float _2355 = fma(_2347, -0.5, 0.5);
    float _2357 = _2311 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2359 = fma(_2321, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2349);
    float _2361 = fma(_2347, 0.5, 0.5);
    float _2363 = fma(_2321, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2357);
    float _2365 = 1.0 / _2353;
    float _2367 = fma(_2289, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2359);
    float _2369 = fma(_2361, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2371 = fma(_2289, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2363);
    float _2373 = _2331 * 0.693147182464599609375;
    float _2375 = fma(_2329, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2367);
    float _2377 = fma(_2361, _2369, -0.212114393711090087890625);
    float _2379 = fma(_2329, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2371);
    float _2381 = sqrt(_2355);
    float _2383 = -_2319;
    float _2385 = fma(_2351, _2339, _2383);
    float _2387 = fma(_2361, _2377, 1.570728778839111328125);
    float _2389 = _2373 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2391 = fma(_2385, 0.5, 0.5);
    float _2393 = _2375 * _2365;
    float _2395 = _2379 * _2365;
    float _2397 = fma(_2393, 0.5, 0.5);
    float _2399 = fma(_2395, -0.5, 0.5);
    float _2401 = _2381 * 0.636619746685028076171875;
    float _2403 = -_2387;
    float _2405 = fma(_2401, _2403, 1.0);
    float3 _6223 = float3(_2397, _2399, _2389);
    float _2407 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6223, float3(0.0), isnan(_6223)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6223, float3(0.0), isnan(_6223)), level(0.0)).x;
    float3 _6234 = float3(_2397, _2399, _2389);
    float4 _2409 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6234, float3(0.0), isnan(_6234)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6234, float3(0.0), isnan(_6234)), level(0.0)).xyzw;
    float _2411 = _2409.x;
    float _2413 = _2409.y;
    float _2415 = _2409.z;
    float _2417 = _2409.w;
    float2 _6250 = float2(_2405, _2391);
    float3 _2421 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6250, float2(0.0), isnan(_6250)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6250, float2(0.0), isnan(_6250)), level(0.0)).xyz;
    float _2423 = _2421.x;
    float _2425 = _2421.y;
    float _2427 = _2421.z;
    float _2429 = _2305 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2431 = _2311 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_75.x = _2093;
    out.m_75.y = _2091;
    out.m_75.z = _2095;
    bool _2433 = _2241 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2435 = isnan(_2241);
    bool _2437 = _2433 || _2435;
    bool _2439 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2441 = _2437 || _2439;
    float _2443 = fma(_2321, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2431);
    float _2445 = exp2(_2429);
    out.m_77.x = _1761;
    out.m_77.y = _1859;
    out.m_77.z = _1763;
    float _2447 = fma(_2289, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2443);
    float _2449 = fma(_2329, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2447);
    float _2451 = _2449 + _2353;
    out.gl_Position.x = _2375;
    out.gl_Position.y = _2379;
    out.gl_Position.z = _2449;
    out.gl_Position.w = _2353;
    float _2453 = _2451;
    if (!_2441)
    {
        _1843 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2455 = _1843;
    float _2457 = -_2445;
    float _2459 = _2457 + 1.0;
    float _2461 = _2451 * 0.5;
    float _2463 = _2445;
    float _2465 = _2455;
    float _2467 = _2455;
    if (!_2441)
    {
        _2463 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2469 = _2463;
    float _2471 = _2459 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2473 = _2469;
    float _2475 = _2469;
    if (!_2441)
    {
        _2453 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2477 = _2453;
    out.m_79.z = _2461;
    out.m_79.w = _2353;
    float _2479 = _2477;
    float _2481 = _2477;
    if (!_2441)
    {
        _1863 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2483 = _1863;
    float _2485 = _2483;
    float _2487 = _2483;
    if (!_2441)
    {
        _1845 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2489 = _1845;
    float _2491 = _2471 * _2407;
    float _2493 = -_2471;
    float _2495 = _2493 + 1.0;
    float _2497 = _2417 * _2491;
    float _2499 = _2427 * _2491;
    float _2501 = _2417 * _2495;
    float _2503 = _2495;
    float _2505 = _2489;
    float _2507 = _2489;
    if (!_2441)
    {
        _2503 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2509 = _2503;
    float _2511 = fma(_2423, _2497, _2411);
    float _2513 = fma(_2425, _2497, _2413);
    float _2515 = fma(_2417, _2499, _2415);
    out.m_81.x = _2511;
    out.m_81.y = _2513;
    out.m_81.z = _2515;
    out.m_81.w = _2501;
    bool _2517 = !_2441;
    float _2519 = _2509;
    float _2521 = _2509;
    if (!_2517)
    {
        bool _2523 = _2241 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2525 = isnan(_2241);
        bool _2527 = _2523 || _2525;
        bool _2529 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2531 = _2527 || _2529;
        if (!_2531)
        {
            float _2533 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2535 = _2241 + _2533;
            float _2537 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2539 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2537;
            float _2541 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2543 = _2541 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2545 = 1.0 / _2539;
            float _2547 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2549 = _2547 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2551 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2553 = _2551 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2555 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2557 = _2555 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2559 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2561 = _2559 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2563 = _2535 * _2545;
            float _2565 = precise::clamp(_2563, 0.0, 1.0);
            float _2567 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2569 = _2567 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2571 = fma(_2565, _2543, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2573 = fma(_2565, _2569, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2575 = fma(_2565, _2549, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2577 = fma(_2565, _2553, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2579 = fma(_2565, _2557, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2581 = fma(_2565, _2561, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2521 = _2575;
            _2487 = _2579;
            _2475 = _2571;
            _2467 = _2577;
            _2481 = _2573;
            _2507 = _2581;
            _2583 = true;
        }
        else
        {
            bool _2585 = _2241 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2587 = isnan(_2241);
            bool _2589 = _2585 || _2587;
            bool _2591 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2593 = _2589 || _2591;
            if (!_2593)
            {
                _2473 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2595 = _2473;
            _2475 = _2595;
            if (!_2593)
            {
                _2519 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2597 = _2519;
            _2521 = _2597;
            if (!_2593)
            {
                _2479 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2599 = _2479;
            _2481 = _2599;
            if (!_2593)
            {
                _2465 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2601 = _2465;
            _2467 = _2601;
            if (!_2593)
            {
                _2485 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2603 = _2485;
            _2487 = _2603;
            if (!_2593)
            {
                _2505 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2605 = _2505;
            bool _2607 = !_2593;
            _2507 = _2605;
            if (!_2607)
            {
                bool _2609 = _2241 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2611 = isnan(_2241);
                bool _2613 = _2609 || _2611;
                bool _2615 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2617 = _2613 || _2615;
                if (!_2617)
                {
                    float _2619 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2621 = _2241 + _2619;
                    float _2623 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2625 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2623;
                    float _2627 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2629 = _2627 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2631 = 1.0 / _2625;
                    float _2633 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2635 = _2633 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2637 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2639 = _2637 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2641 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2643 = _2641 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2645 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2647 = _2645 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2649 = _2621 * _2631;
                    float _2651 = precise::clamp(_2649, 0.0, 1.0);
                    float _2653 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2655 = _2653 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2657 = fma(_2651, _2629, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2659 = fma(_2651, _2655, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2661 = fma(_2651, _2635, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2663 = fma(_2651, _2639, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2665 = fma(_2651, _2643, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2667 = fma(_2651, _2647, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2521 = _2661;
                    _2487 = _2665;
                    _2475 = _2657;
                    _2467 = _2663;
                    _2481 = _2659;
                    _2507 = _2667;
                    _2583 = true;
                }
                else
                {
                    _2521 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2487 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2475 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2467 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2481 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2507 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2583 = false;
    float _2669 = _2521;
    float _2671 = _2487;
    float _2673 = _2475;
    float _2675 = _2467;
    float _2677 = _2481;
    float _2679 = _2507;
    float _2681 = fma(_1993, -0.5, 0.5);
    float _2683 = precise::clamp(_2681, 0.0, 1.0);
    float _2685 = -_2669;
    float _2687 = _2685 + _2671;
    float _2689 = -_2673;
    float _2691 = _2689 + _2675;
    float _2693 = -_2677;
    float _2695 = _2693 + _2679;
    bool _2697 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2699 = fma(_2683, _2687, _2669);
    float _2701 = fma(_2683, _2691, _2673);
    float _2703 = fma(_2683, _2695, _2677);
    float _2705 = _2699 * 0.586610972881317138671875;
    out.m_55.x = 1.0;
    float _2707 = fma(_2701, 0.298911988735198974609375, _2705);
    out.m_83.w = (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2709 = fma(_2703, 0.114477999508380889892578125, _2707);
    out.m_85.x = 0.0;
    float _2711 = -_2709;
    float _2713 = _2701 + _2711;
    float _2715 = -_2709;
    float _2717 = _2699 + _2715;
    float _2719 = -_2709;
    float _2721 = _2703 + _2719;
    float _2723 = fma(_2713, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2709);
    float _2725 = fma(_2717, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2709);
    float _2727 = fma(_2721, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2709);
    out.m_87.x = _2723;
    out.m_87.y = _2725;
    out.m_87.z = _2727;
    if (!_2697)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2729 = -_2091;
    float _2731 = _2729 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2733 = -_2093;
    float _2735 = _2733 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2737 = -_2095;
    float _2739 = _2737 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2741 = _2731 * _2731;
    float _2743 = fma(_2735, _2735, _2741);
    float _2745 = fma(_2739, _2739, _2743);
    float _2747 = sqrt(_2745);
    float _2749 = rsqrt(_2745);
    float _2751 = -_2747;
    float _2753 = _2751 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2755 = _2753 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2757 = precise::clamp(_2755, 0.0, 1.0);
    float _2759 = _2735 * _2749;
    float _2761 = _2731 * _2749;
    float _2763 = abs(_2757);
    float _2765 = log2(_2763);
    float _2767 = _2739 * _2749;
    float _2769 = _2759 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2771 = _1993 * _2761;
    float _2773 = -_2761;
    float _2775 = -_2769;
    float _2777 = fma(_2773, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2775);
    float _2779 = fma(_1995, _2759, _2771);
    float _2781 = -_2767;
    float _2783 = fma(_2781, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2777);
    float _2785 = fma(_1997, _2767, _2779);
    float _2787 = precise::clamp(_2785, 0.0, 1.0);
    float _2789 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2791 = _2783 + _2789;
    float _2793 = _2765 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2795 = _2791 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2797 = precise::clamp(_2795, 0.0, 1.0);
    float _2799 = exp2(_2793);
    float _2801 = _2799 * _2797;
    float _2803 = _2787 * _2801;
    float _2805 = _2803 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2807 = _2803 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2809 = _2803 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_85.x = _2805;
    out.m_85.y = _2807;
    out.m_85.z = _2809;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

