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

template<typename T>
[[clang::optnone]] T spvFAdd(T l, T r)
{
    return fma(T(1), l, r);
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
    constant _16* fp_c3 [[id(0)]];
    texture2d<float> fp_t_tcb_8 [[id(1)]];
    sampler fp_t_tcb_8Smplr [[id(2)]];
    texture2d<float> fp_t_tcb_10 [[id(3)]];
    sampler fp_t_tcb_10Smplr [[id(4)]];
    texture2d<float> fp_t_tcb_A [[id(5)]];
    sampler fp_t_tcb_ASmplr [[id(6)]];
    texture2d<float> fp_t_tcb_E [[id(7)]];
    sampler fp_t_tcb_ESmplr [[id(8)]];
    texture2d<float> fp_t_tcb_C [[id(9)]];
    sampler fp_t_tcb_CSmplr [[id(10)]];
    texture2d<float> fp_t_tcb_12 [[id(11)]];
    sampler fp_t_tcb_12Smplr [[id(12)]];
    sampler fp_t_tcb_8Smplr_w [[id(13)]];
    sampler fp_t_tcb_10Smplr_w [[id(14)]];
    sampler fp_t_tcb_ASmplr_w [[id(15)]];
    sampler fp_t_tcb_ESmplr_w [[id(16)]];
    sampler fp_t_tcb_CSmplr_w [[id(17)]];
    sampler fp_t_tcb_12Smplr_w [[id(18)]];
    constant dm_border_t* dm_border [[id(19)]];
};

struct main0_out
{
    float4 m_42 [[color(0)]];
};

struct main0_in
{
    float4 m_44 [[user(locn0)]];
    float4 m_39 [[user(locn1)]];
};

static inline __attribute__((always_inline))
void _50(thread const int& _4121, thread const int& _4122, thread const int& _4123, thread const int& _4124, thread int& _4125, thread int& _4126, thread int& _4127, thread int& _4128, thread int& _4129, thread int& _4130)
{
    float _4133 = as_type<float>(_4122) + 0.0;
    bool _4135 = _4133 != 0.0;
    bool _4137 = isnan(_4133);
    bool _4139 = _4135 || _4137;
    bool _4141 = isnan(0.0);
    bool _4143 = _4139 || _4141;
    int _4145 = as_type<int>(_4133);
    int _4147 = _4121;
    int _4149 = _4123;
    int _4151 = _4143 ? (-1) : 0;
    if (!_4143)
    {
        float _4153 = as_type<float>(_4122) * 1.0;
        _4145 = as_type<int>(_4153);
    }
    int _4155 = _4145;
    bool _4157 = !_4143;
    int _4159 = _4155;
    if (!_4157)
    {
        float _4161 = as_type<float>(_4122) + 0.0;
        bool _4163 = _4161 >= 0.0;
        bool _4165 = isnan(_4161);
        bool _4167 = _4163 || _4165;
        bool _4169 = isnan(0.0);
        bool _4171 = _4167 || _4169;
        int _4173 = as_type<int>(_4161);
        _4151 = _4171 ? (-1) : 0;
        if (!_4171)
        {
            _4173 = 2147483647;
        }
        int _4175 = _4173;
        bool _4177 = !_4171;
        _4159 = _4175;
        if (!_4177)
        {
            float _4179 = abs(as_type<float>(_4122));
            float _4181 = _4179 + 0.0;
            bool _4183 = _4181 > as_type<float>(0x7f800000u /* inf */);
            bool _4185 = isnan(_4181);
            bool _4187 = _4183 || _4185;
            bool _4189 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _4191 = _4187 || _4189;
            int _4193 = as_type<int>(_4181);
            _4151 = _4191 ? (-1) : 0;
            if (_4191)
            {
                float _4195 = as_type<float>(_4122) + 1.0;
                _4193 = as_type<int>(_4195);
            }
            int _4197 = _4193;
            _4159 = _4197;
            if (!_4191)
            {
                float _4199 = abs(as_type<float>(_4122));
                float _4201 = _4199 + (-0.0);
                float _4203 = 0.0 + _4201;
                bool _4205 = _4203 != as_type<float>(0x7f800000u /* inf */);
                bool _4207 = isnan(_4203);
                bool _4209 = _4205 || _4207;
                bool _4211 = isnan(as_type<float>(0x7f800000u /* inf */));
                bool _4213 = _4209 || _4211;
                int _4215 = as_type<int>(_4203);
                _4151 = _4213 ? (-1) : 0;
                if (!_4213)
                {
                    _4215 = _4122;
                }
                int _4217 = _4215;
                bool _4219 = !_4213;
                _4159 = _4217;
                if (!_4219)
                {
                    float _4221 = as_type<float>(_4122) * 18446744073709551616.0;
                    float _4223 = rsqrt(_4221);
                    float _4225 = _4221 * _4223;
                    float _4227 = _4223 * 0.5;
                    float _4229 = -_4225;
                    float _4231 = 0.0 + _4229;
                    float _4233 = fma(_4227, _4231, 0.5);
                    float _4235 = fma(_4225, _4233, _4225);
                    float _4237 = -_4235;
                    float _4239 = 0.0 + _4237;
                    float _4241 = fma(_4235, _4239, _4221);
                    float _4243 = fma(_4227, _4241, _4235);
                    float _4245 = _4243 * 2.3283064365386962890625e-10;
                    _4159 = as_type<int>(_4245);
                    _4147 = as_type<int>(_4221);
                    _4149 = as_type<int>(_4235);
                }
            }
        }
    }
    int _4247 = _4159;
    int _4249 = _4147;
    int _4251 = _4149;
    int _4253 = _4151;
    _4125 = _4247;
    _4126 = _4249;
    _4127 = _4124;
    _4128 = 0;
    _4129 = _4251;
    _4130 = _4253;
}

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    bool _835 = false;
    bool _274 = false;
    float _54 = gl_FragCoord.w;
    float _56 = in.m_39.y;
    float _58 = gl_FragCoord.w;
    float _60 = _56 * _58;
    float _62 = in.m_39.x;
    float _64 = gl_FragCoord.w;
    float _66 = _62 * _64;
    float _68 = in.m_39.z;
    float _70 = gl_FragCoord.w;
    float _72 = _68 * _70;
    int _74 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 4096;
    bool _78 = _74 != 0;
    int _80 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 1;
    bool _82 = _80 != 0;
    int _84 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 8;
    bool _86 = _84 != 0;
    int _88 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 32;
    bool _90 = _88 != 0;
    int _92 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 64;
    bool _94 = _92 != 0;
    int _96 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 8192;
    bool _98 = _96 != 0;
    int _100 = int(_78);
    float _102 = 1.0 / _54;
    float _104 = _102 * _60;
    float _106 = _102 * _66;
    float _108 = _102 * _72;
    float _110 = _104 * _104;
    float _112 = fma(_106, _106, _110);
    float _114 = (*spvDescriptorSet0.fp_c3)._m0[13].w + (-220.0);
    float _116 = fma(_108, _108, _112);
    float _118 = precise::max(0.0, _114);
    float _120 = rsqrt(_116);
    float _122 = _106 * _120;
    float _124 = _108 * _120;
    float _126 = _104 * _120;
    float _128 = _122 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    float _130 = _124 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    float _132 = -_126;
    float _134 = -_118;
    float _136 = fma(_132, (*spvDescriptorSet0.fp_c3)._m0[13].z, _134);
    float _138 = _128 * _128;
    float _140 = _130 * _130;
    float _142 = _138 + _140;
    float _144 = sqrt(_142);
    bool _146 = _144 > (*spvDescriptorSet0.fp_c3)._m0[13].x;
    float _148 = _120;
    float _150 = _118;
    float _152 = _136;
    float _154 = _128;
    float _156 = _130;
    if (!_146)
    {
        _148 = _140;
    }
    float _158 = _148;
    float _160 = _158;
    if (!_146)
    {
        _150 = _138;
    }
    float _162 = _150;
    bool _164 = !_146;
    float _166 = _162;
    if (!_164)
    {
        float _168 = 1.0 / (*spvDescriptorSet0.fp_c3)._m0[13].y;
        float _170 = -(*spvDescriptorSet0.fp_c3)._m0[13].x;
        float _172 = _144 + _170;
        float _174 = _136 + (*spvDescriptorSet0.fp_c3)._m0[13].y;
        float _176 = rsqrt(_142);
        float _178 = _172 * _168;
        float _180 = _178 * 0.15915493667125701904296875;
        float _182 = _180 * 6.283185482025146484375;
        float _184 = sin(_182);
        float _186 = _180 * 6.283185482025146484375;
        float _188 = cos(_186);
        float _190 = fma(_184, _174, (*spvDescriptorSet0.fp_c3)._m0[13].x);
        float _192 = _176 * _190;
        float _194 = _188 + (-1.0);
        float _196 = _128 * _192;
        float _198 = _130 * _192;
        float _200 = _194 * (*spvDescriptorSet0.fp_c3)._m0[13].y;
        float _202 = _198 * _198;
        float _204 = fma(_136, _188, _200);
        float _206 = _196 * _196;
        _152 = _204;
        _166 = _206;
        _160 = _202;
        _154 = _196;
        _156 = _198;
    }
    float _208 = _152;
    float _210 = _166;
    float _212 = _160;
    float _214 = _154;
    float _216 = _156;
    float _218 = fma(_208, _208, _210);
    float _220 = _218 + _212;
    float _222 = rsqrt(_220);
    float _224 = _222 * _208;
    float _226 = _222 * _214;
    float _228 = _222 * _216;
    float _230 = -_224;
    float _232 = precise::max(0.0, _230);
    float _234 = abs(_232);
    float _236 = -_234;
    float _238 = _236 + 1.0;
    float _240 = fma(_232, -0.0187292993068695068359375, 0.074261002242565155029296875);
    int _242 = as_type<int>(_238) + (-218103808);
    float _244 = fma(_232, _240, -0.212114393711090087890625);
    bool _246 = uint(_242) >= 1920991232u;
    float _248 = fma(_232, _244, 1.570728778839111328125);
    bool _250 = !_246;
    float _272;
    if (!_250)
    {
        int _252 = 0;
        int _254 = as_type<int>(_238);
        int _256 = 0;
        int _258 = 1232;
        int _260;
        int _262;
        int _264;
        int _266;
        int _268;
        int _270;
        _50(_252, _254, _256, _258, _260, _262, _264, _266, _268, _270);
        _272 = as_type<float>(_260);
        _274 = true;
    }
    else
    {
        float _276 = rsqrt(_238);
        float _278 = _238 * _276;
        float _280 = _276 * 0.5;
        float _282 = -_278;
        float _284 = 0.0 + _282;
        float _286 = fma(_280, _284, 0.5);
        float _288 = fma(_278, _286, _278);
        float _290 = -_288;
        float _292 = 0.0 + _290;
        float _294 = fma(_288, _292, _238);
        float _296 = fma(_280, _294, _288);
        _272 = _296;
    }
    _274 = false;
    float _298 = _272;
    bool _300 = _224 > 0.0;
    float _302 = _124 * _124;
    float _304 = _122 * _122;
    float _306 = _302 + _304;
    if (_300)
    {
        discard_fragment();
    }
    float _308 = rsqrt(_306);
    float _310 = _248 * _298;
    float _312 = _310 * 0.636619746685028076171875;
    float _314 = precise::clamp(_312, 0.0, 1.0);
    float _316 = -_314;
    float _318 = _316 + 1.0;
    float _320 = sqrt(_318);
    float _322 = _124 * _308;
    float _324 = _122 * _308;
    float _326 = abs(_322);
    float _328 = abs(_324);
    float _330 = precise::max(_326, _328);
    float _332 = precise::max(_330, 9.9999997473787516355514526367188e-05);
    float _334 = -_320;
    float _336 = _334 + 1.0;
    float _338 = 1.0 / _332;
    float _340 = _336 * 0.5;
    float _342 = -_338;
    float _344 = _322 * _342;
    float _346 = _324 * _338;
    float _348 = fma(_344, _340, 0.5);
    float _350 = fma(_346, _340, 0.5);
    if (_300)
    {
        out.m_42.x = 0.0;
        out.m_42.y = 0.0;
        out.m_42.z = 0.0;
        out.m_42.w = 0.0;
        return out;
    }
    float2 _2057;
    _2057.x = spvDescriptorSet0.fp_t_tcb_8.calculate_clamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_348, _350));
    _2057.y = spvDescriptorSet0.fp_t_tcb_8.calculate_unclamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_348, _350));
    float _352 = _2057.x;
    float _354 = _352 * 256.0;
    int _356 = int(_354);
    float _358 = -_126;
    float _360 = _358 + 1.0;
    float _362 = precise::clamp(_360, 0.0, 1.0);
    float _364 = -_126;
    float _366 = fma(_364, _126, 1.0);
    float _368 = precise::clamp(_366, 0.0, 1.0);
    float _370 = _124 * (-3.0);
    int _372 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 2;
    bool _374 = _372 != 0;
    float _376 = _122 * _122;
    float _378 = 0.88622701168060302734375 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
    float _380 = 0.88622701168060302734375 * (*spvDescriptorSet0.fp_c3)._m0[4].z;
    float _382 = 0.88622701168060302734375 * (*spvDescriptorSet0.fp_c3)._m0[4].x;
    float _384 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].x;
    float _386 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
    float _388 = -_124;
    float _390 = fma(_388, _370, -1.0);
    float _392 = -_126;
    float _394 = fma(_392, _126, _376);
    float _396 = fma(_126, _384, _378);
    float _398 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _400 = _362;
    if (_374)
    {
        float _402 = sqrt(_368);
        _400 = _402;
    }
    float _404 = _400;
    float _406 = fma(_302, 3.0, -1.0);
    float _408 = -_124;
    float _410 = fma(_408, _386, _396);
    float _412 = fma(_124, _386, _396);
    float _414 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[4].w;
    float _416 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
    float _418 = fma(_126, _398, _380);
    float _420 = fma(_126, _414, _382);
    float _422 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
    float _424 = -_124;
    float _426 = fma(_424, _416, _418);
    float _428 = fma(_124, _416, _418);
    float _430 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].w;
    float _432 = -_122;
    float _434 = fma(_432, _422, _410);
    float _436 = fma(_122, _422, _412);
    float _438 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].z;
    float _440 = abs(_404);
    float _442 = log2(_440);
    float _444 = -_122;
    float _446 = fma(_444, _430, _426);
    float _448 = fma(_122, _430, _428);
    float _450 = -_124;
    float _452 = fma(_450, _438, _420);
    float _454 = fma(_124, _438, _420);
    float _456 = _122 * _124;
    float _458 = -_124;
    float _460 = _126 * _458;
    float _462 = _126 * _124;
    float _464 = _122 * _126;
    float _466 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
    float _468 = _226 * (*spvDescriptorSet0.fp_c3)._m0[11].x;
    float _470 = -_122;
    float _472 = fma(_470, _466, _452);
    float _474 = -_468;
    float _476 = fma(_224, (*spvDescriptorSet0.fp_c3)._m0[11].y, _474);
    float _478 = _442 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _480 = -_126;
    float _482 = _122 * _480;
    float _484 = fma(_122, _466, _454);
    float _486 = exp2(_478);
    float _488 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].x;
    float _490 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
    float _492 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].z;
    float _494 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[9].x;
    float _496 = fma(_488, _482, _472);
    float _498 = fma(_488, _464, _484);
    float _500 = fma(_490, _482, _434);
    float _502 = fma(_492, _482, _446);
    float _504 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].w;
    float _506 = fma(_490, _464, _436);
    float _508 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].x;
    float _510 = fma(_504, _460, _496);
    float _512 = _486 * (*spvDescriptorSet0.fp_c3)._m0[3].x;
    float _514 = fma(_492, _464, _448);
    float _516 = fma(_504, _462, _498);
    float _518 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
    float _520 = fma(_512, (*spvDescriptorSet0.fp_c3)._m0[12].x, (*spvDescriptorSet0.fp_c3)._m0[12].y);
    float _522 = precise::clamp(_520, 0.0, 1.0);
    float _524 = -_228;
    float _526 = fma(_524, (*spvDescriptorSet0.fp_c3)._m0[11].z, _476);
    float _528 = fma(_508, _460, _500);
    float _530 = fma(_518, _460, _502);
    float _532 = -_522;
    float _534 = _532 + 1.0;
    float _536 = fma(_526, 0.5, 0.5);
    float _538 = fma(_508, _462, _506);
    float _540 = fma(_518, _462, _514);
    float _542 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].z;
    float _544 = fma(_536, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _546 = abs(_534);
    float _548 = log2(_546);
    float _550 = in.m_44.y;
    float _552 = gl_FragCoord.w;
    float _554 = _550 * _552;
    float _556 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].w;
    float _558 = fma(_536, _544, -0.212114393711090087890625);
    float _560 = fma(_542, _456, _510);
    float _562 = fma(_542, _456, _516);
    float _564 = fma(_556, _456, _528);
    float _566 = fma(_536, _558, 1.570728778839111328125);
    float _568 = fma(_556, _456, _538);
    float _570 = in.m_44.x;
    float _572 = gl_FragCoord.w;
    float _574 = _570 * _572;
    float _576 = fma(_494, _456, _530);
    float _578 = fma(_494, _456, _540);
    float _580 = fma(_526, -0.5, 0.5);
    float _582 = 0.429042994976043701171875 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
    float _584 = 0.429042994976043701171875 * (*spvDescriptorSet0.fp_c3)._m0[10].x;
    float _586 = _548 * (*spvDescriptorSet0.fp_c3)._m0[11].w;
    float _588 = sqrt(_580);
    float _590 = 0.2477079927921295166015625 * (*spvDescriptorSet0.fp_c3)._m0[9].z;
    float _592 = 0.2477079927921295166015625 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
    float _594 = 0.2477079927921295166015625 * (*spvDescriptorSet0.fp_c3)._m0[9].w;
    float _596 = fma(_590, _390, _564);
    float _598 = fma(_590, _406, _568);
    float _600 = fma(_592, _390, _560);
    float _602 = exp2(_586);
    float _604 = fma(_592, _406, _562);
    float _606 = fma(_594, _390, _576);
    float _608 = fma(_594, _406, _578);
    float _610 = _224 + 1.0;
    float _612 = fma(_582, _394, _596);
    float _614 = fma(_582, _394, _598);
    float _616 = _102 * _554;
    float _618 = _588 * 0.636619746685028076171875;
    float _620 = fma(_224, -0.5, 0.5);
    float _622 = fma(_584, _394, _600);
    float _624 = fma(_584, _394, _604);
    float _626 = -_566;
    float _628 = fma(_618, _626, 1.0);
    float _630 = _102 * _574;
    float _632 = -_224;
    float _634 = fma(_602, _610, _632);
    float _636 = fma(_634, 0.5, 0.5);
    float _638 = float(uint(_356));
    float _640 = _638 * 0.00390625;
    float2 _2523 = float2(_630, _616);
    float3 _644 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_2523, float2(0.0), isnan(_2523))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_2523, float2(0.0), isnan(_2523))).xyz;
    float _646 = _644.x;
    float _648 = _644.y;
    float _650 = _644.z;
    float2 _2539 = float2(_348, _350);
    float4 _653 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2539, float2(0.0), isnan(_2539)), level(_640)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2539, float2(0.0), isnan(_2539)), level(_640)).xyzw;
    float _655 = _653.x;
    float _657 = _653.y;
    float _659 = _653.z;
    float _661 = _653.w;
    float2 _2556 = float2(_348, _350);
    float2 _665 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_2556, float2(0.0), isnan(_2556)), level(_640)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_2556, float2(0.0), isnan(_2556)), level(_640)).xy;
    float _667 = _665.x;
    float _669 = _665.y;
    float2 _2569 = float2(_348, _350);
    float2 _671 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_2569, float2(0.0), isnan(_2569)), level(_640)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_2569, float2(0.0), isnan(_2569)), level(_640)).xy;
    float _673 = _671.x;
    float _675 = _671.y;
    float2 _2582 = float2(_348, _350);
    float4 _677 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_2582, float2(0.0), isnan(_2582)), level(_640)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_2582, float2(0.0), isnan(_2582)), level(_640)).xyzw;
    float _679 = _677.x;
    float _681 = _677.y;
    float _683 = _677.z;
    float _685 = _677.w;
    float2 _2599 = float2(_628, _620);
    float3 _687 = dm_bs(spvDescriptorSet0.fp_t_tcb_12.sample(spvDescriptorSet0.fp_t_tcb_12Smplr, select(_2599, float2(0.0), isnan(_2599))), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.fp_t_tcb_12, spvDescriptorSet0.fp_t_tcb_12Smplr_w, select(_2599, float2(0.0), isnan(_2599))).xyz;
    float _689 = _687.x;
    float _691 = _687.y;
    float _693 = _687.z;
    float2 _2613 = float2(_628, _636);
    float3 _695 = dm_bs(spvDescriptorSet0.fp_t_tcb_12.sample(spvDescriptorSet0.fp_t_tcb_12Smplr, select(_2613, float2(0.0), isnan(_2613))), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.fp_t_tcb_12, spvDescriptorSet0.fp_t_tcb_12Smplr_w, select(_2613, float2(0.0), isnan(_2613))).xyz;
    float _697 = _695.x;
    float _699 = _695.y;
    float _701 = _695.z;
    int _703 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 1024;
    bool _705 = _703 != 0;
    int _707 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 256;
    bool _709 = _707 != 0;
    float _711 = 0.429042994976043701171875 * (*spvDescriptorSet0.fp_c3)._m0[10].z;
    float _713 = fma(_711, _394, _606);
    float _715 = fma(_711, _394, _608);
    float _717 = -(*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _719 = _717 + 1.0;
    float _721 = -(*spvDescriptorSet0.fp_c3)._m0[2].z;
    float _723 = _721 + 1.0;
    float _725 = _646 * _648;
    float _727 = _661 * _661;
    float _729 = _667 * _669;
    float _731 = -_725;
    float _733 = _731 + 1.0;
    float _735 = _685 * _685;
    float _737 = _727 * _727;
    float _739 = fma(_733, _719, (*spvDescriptorSet0.fp_c3)._m0[2].y);
    float _741 = fma(_733, _723, (*spvDescriptorSet0.fp_c3)._m0[2].z);
    float _743 = _737 * 16.0;
    float _745 = _735 * _735;
    float _747 = -_669;
    float _749 = _747 + _675;
    float _751 = _673 * _741;
    float _753 = _743 * _669;
    float _755 = _745 * 16.0;
    float _757 = fma(_646, _749, _669);
    float _759 = -_729;
    float _761 = fma(_675, _751, _759);
    float _763 = _659 * _753;
    float _765 = _755 * _739;
    float _767 = _655 * _753;
    float _769 = precise::max(_757, 1.52587890625e-05);
    float _771 = _657 * _753;
    float _773 = _675 * _765;
    float _775 = _683 * _765;
    float _777 = fma(_646, _761, _729);
    float _779 = 1.0 / _769;
    float _781 = -_767;
    float _783 = fma(_679, _773, _781);
    float _785 = -_771;
    float _787 = fma(_681, _773, _785);
    float _789 = -_763;
    float _791 = fma(_675, _775, _789);
    float _793 = fma(_646, _783, _767);
    float _795 = fma(_646, _787, _771);
    float _797 = fma(_646, _791, _763);
    float _799 = _777 * _779;
    bool _801 = !_705;
    int _803 = _801 ? as_type<int>(_799) : 0;
    bool _805 = !_709;
    int _807 = _709 ? (-1) : 0;
    int _809 = _803;
    int _823;
    int _825;
    int _827;
    int _829;
    int _831;
    int _833;
    if (!_805)
    {
        float _811 = _472 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _813 = _434 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _815 = _446 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _817 = _484 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _819 = _436 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _821 = _448 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        _823 = as_type<int>(_817);
        _825 = as_type<int>(_819);
        _827 = as_type<int>(_821);
        _829 = as_type<int>(_813);
        _831 = as_type<int>(_811);
        _833 = as_type<int>(_815);
        _835 = true;
    }
    else
    {
        int _837 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 128;
        bool _839 = _837 != 0;
        float _841 = _622 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _843 = _612 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _845 = _713 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _847 = _624 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _849 = _614 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _851 = _715 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        int _853 = as_type<int>(_841);
        int _855 = as_type<int>(_843);
        int _857 = as_type<int>(_845);
        int _859 = as_type<int>(_847);
        int _861 = as_type<int>(_849);
        _807 = _839 ? (-1) : 0;
        _827 = as_type<int>(_851);
        if (_839)
        {
            float _863 = _382 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
            _853 = as_type<int>(_863);
        }
        int _865 = _853;
        _831 = _865;
        if (_839)
        {
            float _867 = _378 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
            _855 = as_type<int>(_867);
        }
        int _869 = _855;
        _829 = _869;
        if (_839)
        {
            float _871 = _380 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
            _857 = as_type<int>(_871);
        }
        int _873 = _857;
        _833 = _873;
        if (_839)
        {
            _859 = _865;
        }
        int _875 = _859;
        _823 = _875;
        if (_839)
        {
            _861 = _869;
        }
        int _877 = _861;
        _825 = _877;
        if (_839)
        {
            _827 = _873;
        }
    }
    _835 = false;
    int _879 = _807;
    int _881 = _823;
    int _883 = _825;
    int _885 = _827;
    int _887 = _829;
    int _889 = _831;
    int _891 = _833;
    int _893 = 0;
    int _895 = _879;
    if (!_94)
    {
        int _897 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 4104;
        bool _899 = _897 != 0;
        _893 = _899 ? (-1) : 0;
    }
    int _901 = _893;
    float _903 = _548 * (*spvDescriptorSet0.fp_c3)._m0[12].z;
    if (_94)
    {
        _895 = -1;
    }
    int _905 = _895;
    float _907 = as_type<float>(_803) * (*spvDescriptorSet0.fp_c3)._m0[1].x;
    int _909 = _905;
    if (!_94)
    {
        int _911 = ~_901;
        bool _913 = !_98;
        int _915 = _911 & (_913 ? (-1) : 0);
        _909 = _915;
    }
    int _917 = _909;
    float _919 = as_type<float>(_803) * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    bool _921 = _100 != 0;
    float _923 = exp2(_903);
    float _925 = _793 * _779;
    float _927 = _795 * _779;
    float _929 = _797 * _779;
    int _931 = _917;
    if (_90)
    {
        _931 = -1;
    }
    int _933 = _931;
    int _935 = ~_917;
    float _937 = (_935 != 0) ? as_type<float>(_881) : 0.0;
    int _939 = _933;
    if (!_90)
    {
        bool _941 = !_98;
        bool _943 = _941 && _86;
        bool _945 = !_921;
        bool _947 = _943 && _945;
        _939 = _947 ? (-1) : 0;
    }
    int _949 = _939;
    int _951 = ~_917;
    float _953 = (_951 != 0) ? as_type<float>(_883) : 0.0;
    int _955 = ~_917;
    float _957 = (_955 != 0) ? as_type<float>(_885) : 0.0;
    bool _959 = !_98;
    bool _961 = _86 && _959;
    int _963 = ~_949;
    float _965 = (_963 != 0) ? as_type<float>(_887) : 0.0;
    int _967 = ~_949;
    float _969 = (_967 != 0) ? as_type<float>(_889) : 0.0;
    int _971 = ~_949;
    float _973 = (_971 != 0) ? as_type<float>(_891) : 0.0;
    int _975 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 16;
    bool _977 = _975 != 0;
    bool _979 = !_961;
    float _981 = _979 ? _907 : 0.0;
    float _983 = -_923;
    float _985 = _983 + 1.0;
    bool _987 = !_961;
    float _989 = _987 ? _919 : 0.0;
    float _991 = _985 * (*spvDescriptorSet0.fp_c3)._m0[12].w;
    bool _993 = !_977;
    float _995 = _989 * _953;
    bool _997 = !_977;
    float _999 = -_991;
    float _1001 = _999 + 1.0;
    bool _1003 = !_993;
    float _1005 = _1003 ? 1.0 : (*spvDescriptorSet0.fp_c3)._m0[23].y;
    float _1007 = _989 * _937;
    float _1009 = _989 * _957;
    float _1011 = fma(_965, _981, _995);
    bool _1013 = !_997;
    float _1015 = _1013 ? 1.0 : (*spvDescriptorSet0.fp_c3)._m0[23].x;
    float _1017 = abs(_1001);
    float _1019 = log2(_1017);
    bool _1021 = !_977;
    float _1023 = fma(_969, _981, _1007);
    float _1025 = _1005 * _1011;
    float _1027 = fma(_973, _981, _1009);
    bool _1029 = !_1021;
    float _1031 = _1029 ? 1.0 : (*spvDescriptorSet0.fp_c3)._m0[23].z;
    float _1033 = _1015 * _1023;
    float _1035 = _1025 * 0.715200006961822509765625;
    float _1037 = -_650;
    float _1039 = _1037 + 1.0;
    float _1041 = -(*spvDescriptorSet0.fp_c3)._m0[26].y;
    float _1043 = _224 * _1041;
    float _1045 = _1031 * _1027;
    float _1047 = fma(_1033, 0.2125999927520751953125, _1035);
    float _1049 = _757 * _1039;
    float _1051 = _725 * (*spvDescriptorSet0.fp_c3)._m0[2].x;
    float _1053 = fma(_226, (*spvDescriptorSet0.fp_c3)._m0[26].x, _1043);
    float _1055 = fma(_1045, 0.072200000286102294921875, _1047);
    float _1057 = _1019 * (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _1059 = _1019 * (*spvDescriptorSet0.fp_c3)._m0[3].z;
    float _1061 = -_1033;
    float _1063 = _1061 + _1055;
    float _1065 = -_1025;
    float _1067 = _1065 + _1055;
    float _1069 = exp2(_1057);
    float _1071 = fma(_1051, _1063, _1033);
    float _1073 = -_1045;
    float _1075 = _1073 + _1055;
    float _1077 = fma(_1051, _1067, _1025);
    int _1079 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 512;
    bool _1081 = _1079 != 0;
    float _1083 = fma(_1051, _1075, _1045);
    float _1085 = exp2(_1059);
    float _1087 = _1049 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    bool _1089 = !_1081;
    float _1091 = _224 * (-10000.0);
    float _1093 = _1089 ? _925 : 0.0;
    bool _1095 = !_82;
    float _1097 = _1095 ? _1069 : 1.0;
    bool _1099 = !_1081;
    bool _1101 = !_1081;
    float _1103 = as_type<float>(_803) * _1097;
    float _1105 = _1097 * _1071;
    float _1107 = _1097 * _1077;
    float _1109 = _1099 ? _929 : 0.0;
    int _1111 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 16384;
    bool _1113 = _1111 != 0;
    float _1115 = _86 ? _1103 : _1105;
    float _1117 = _86 ? _1103 : _1107;
    float _1119 = _1103;
    float _1121 = _1083;
    float _1123 = _1069;
    if (!_86)
    {
        float _1125 = _1097 * _1083;
        _1119 = _1125;
    }
    float _1127 = _1119;
    float _1129 = _1115 * (*spvDescriptorSet0.fp_c3)._m0[28].x;
    bool _1131 = !_82;
    float _1133 = _1131 ? _1085 : 1.0;
    float _1135 = _1117 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    float _1137 = _1101 ? _927 : 0.0;
    float _1139 = _1127 * (*spvDescriptorSet0.fp_c3)._m0[28].z;
    float _1141 = _1133 * _1093;
    float _1143 = _1133 * _1137;
    float _1145 = _1133 * _1109;
    float _1147 = fma(_1141, (*spvDescriptorSet0.fp_c3)._m0[27].x, _1129);
    float _1149 = _1141;
    float _1151 = _1145;
    float _1153 = _1147;
    if (_82)
    {
        _809 = as_type<int>(_1087);
    }
    int _1155 = _809;
    float _1157 = fma(_1143, (*spvDescriptorSet0.fp_c3)._m0[27].y, _1135);
    int _1159 = _1155;
    int _1161 = _1155;
    if (_82)
    {
        _1121 = 0.0;
    }
    float _1163 = _1121;
    float _1165 = fma(_1145, (*spvDescriptorSet0.fp_c3)._m0[27].z, _1139);
    float _1167 = _1165;
    float _1169 = _1163;
    if (_82)
    {
        _1149 = 0.0;
    }
    float _1171 = _1149;
    float _1173 = (*spvDescriptorSet0.fp_c3)._m0[24].x * (*spvDescriptorSet0.fp_c3)._m0[24].y;
    float _1175 = _1171;
    if (_82)
    {
        _1123 = 0.0;
    }
    float _1177 = _1123;
    bool _1179 = !_82;
    float _1181 = _1179 ? _991 : 0.0;
    float _1183 = _1177;
    if (_82)
    {
        _1151 = _1157;
    }
    float _1185 = _1151;
    float _1187 = _1185;
    float _1189 = _1185;
    if (!_82)
    {
        int _1191 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 4;
        bool _1193 = _1191 != 0;
        float _1195 = _699 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        int _1197 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 5;
        bool _1199 = _1197 != 0;
        float _1201 = _697 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _1203 = _701 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        bool _1205 = !_1199;
        float _1207 = _1205 ? _1201 : 0.0;
        bool _1209 = !_1199;
        float _1211 = _1209 ? _1195 : 0.0;
        bool _1213 = !_1199;
        float _1215 = _1213 ? _1203 : 0.0;
        float _1217 = _1181 * _1207;
        _1169 = _1217;
        if (!_1193)
        {
            _1159 = as_type<int>(_1087);
        }
        int _1219 = _1159;
        float _1221 = _1181 * _1211;
        float _1223 = _1181 * _1215;
        _1161 = _1219;
        _1183 = _1223;
        _1175 = _1221;
        if (!_1193)
        {
            _1187 = _1157;
        }
        float _1225 = _1187;
        bool _1227 = !_1193;
        _1189 = _1225;
        if (!_1227)
        {
            float _1229 = -_1181;
            float _1231 = _1229 + 1.0;
            float _1233 = precise::clamp(_1231, 0.0, 1.0);
            float _1235 = _1233 * _1087;
            float _1237 = precise::max(_1235, 9.9999997473787516355514526367188e-05);
            float _1239 = 1.0 / _1237;
            float _1241 = _1239 * _1087;
            float _1243 = _1147 * _1241;
            float _1245 = _1157 * _1241;
            float _1247 = _1165 * _1241;
            _1161 = as_type<int>(_1235);
            _1167 = _1247;
            _1183 = 0.0;
            _1189 = _1245;
            _1175 = 0.0;
            _1153 = _1243;
            _1169 = 0.0;
        }
    }
    int _1249 = _1161;
    float _1251 = _1167;
    float _1253 = _1183;
    float _1255 = _1189;
    float _1257 = _1175;
    float _1259 = _1153;
    float _1261 = _1169;
    bool _1263 = !_1113;
    float _1265 = _1263 ? as_type<float>(_1249) : 1.0;
    float _1267 = fma(_228, (*spvDescriptorSet0.fp_c3)._m0[26].z, _1053);
    float _1269 = abs(_1091);
    bool _1271 = _1269 > 0.00999999977648258209228515625;
    float _1273 = -_1173;
    float _1275 = exp2(_1273);
    float _1277 = -_1265;
    float _1279 = _1277 + 1.0;
    float _1281 = _1271 ? _1091 : 0.00999999977648258209228515625;
    float _1283 = _1251 + _1253;
    float _1285 = _691 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _1287 = fma(_1267, 2.0, (*spvDescriptorSet0.fp_c3)._m0[24].w);
    float _1289 = _1255 + _1257;
    float _1291 = abs(_1279);
    float _1293 = log2(_1291);
    float _1295 = _1281 * (*spvDescriptorSet0.fp_c3)._m0[24].x;
    float _1297 = fma(_1287, (*spvDescriptorSet0.fp_c3)._m0[24].w, 1.0);
    float _1299 = _689 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _1301 = _693 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    int _1303 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 2048;
    bool _1305 = _1303 != 0;
    float _1307 = precise::max(_1295, -127.0);
    float _1309 = abs(_1297);
    float _1311 = log2(_1309);
    float _1313 = -(*spvDescriptorSet0.fp_c3)._m0[24].w;
    float _1315 = fma(_1313, (*spvDescriptorSet0.fp_c3)._m0[24].w, 1.0);
    float _1317 = _1293 * (*spvDescriptorSet0.fp_c3)._m0[29].z;
    float _1319 = -_1307;
    float _1321 = exp2(_1319);
    float _1323 = _1259 + _1261;
    float _1325 = _1311 * 1.5;
    float _1327 = exp2(_1317);
    float _1329 = -_1321;
    float _1331 = _1329 + 1.0;
    float _1333 = 1.0 / _1307;
    float _1335 = _1275 * _1331;
    float _1337 = -_1327;
    float _1339 = spvFAdd(_1337, 1.00010001659393310546875);
    float _1341 = -_1327;
    float _1343 = _1341 + 1.0;
    float _1345 = exp2(_1325);
    float _1347 = -_1265;
    float _1349 = _1347 + _1343;
    float _1351 = _1285 * _1349;
    float _1353 = 1.0 / _1339;
    float _1355 = _1299 * _1349;
    float _1357 = _1301 * _1349;
    float _1359 = fma(_1289, _1265, _1351);
    float _1361 = _1335 * _1333;
    float _1363 = fma(_1323, _1265, _1355);
    float _1365 = fma(_1283, _1265, _1357);
    float _1367 = _1345 * 12.56637096405029296875;
    float _1369 = (*spvDescriptorSet0.fp_c3)._m0[24].z * 10000.0;
    float _1371 = _1361 * _1369;
    float _1373 = 1.0 / _1367;
    float _1375 = _1353 * _1359;
    float _1377 = _1353 * _1363;
    float _1379 = _1353 * _1365;
    float _1381 = _1375 * 0.715200006961822509765625;
    float _1383 = -_1371;
    float _1385 = exp2(_1383);
    float _1387 = fma(_1377, 0.2125999927520751953125, _1381);
    float _1389 = fma(_1379, 0.072200000286102294921875, _1387);
    float _1391 = _1315 * _1373;
    float _1393 = 1.0 / _1389;
    float _1395 = -_1385;
    float _1397 = _1395 + 1.0;
    float _1399 = _1397 * _1391;
    float _1401 = _1399 * (*spvDescriptorSet0.fp_c3)._m0[25].x;
    float _1403 = _1399 * (*spvDescriptorSet0.fp_c3)._m0[25].y;
    float _1405 = _1399 * (*spvDescriptorSet0.fp_c3)._m0[25].z;
    float _1407 = _1393 * (*spvDescriptorSet0.fp_c3)._m0[21].z;
    float _1409 = precise::clamp(_1407, 0.0, 1.0);
    float _1411 = fma(_1409, (*spvDescriptorSet0.fp_c3)._m0[21].y, (*spvDescriptorSet0.fp_c3)._m0[21].x);
    float _1413 = _1411 * _1385;
    float _1415 = fma(_1377, _1413, _1401);
    float _1417 = fma(_1375, _1413, _1403);
    float _1419 = fma(_1379, _1413, _1405);
    bool _1421 = !_1305;
    float _1423 = _1379;
    float _1425 = _1327;
    float _1427 = _1417;
    int _1429 = as_type<int>(_1327);
    int _1431 = as_type<int>(_1403);
    int _1433 = as_type<int>(_1417);
    float _1435 = _1379;
    if (!_1421)
    {
        bool _1437 = _1343 != 1.0;
        bool _1439 = isnan(_1343);
        bool _1441 = _1437 || _1439;
        bool _1443 = isnan(1.0);
        bool _1445 = _1441 || _1443;
        float _1447 = -_1327;
        bool _1449 = _1447 != (-1.0);
        bool _1451 = isnan(_1447);
        bool _1453 = _1449 || _1451;
        bool _1455 = isnan(-1.0);
        bool _1457 = _1453 || _1455;
        float _1459 = -_1327;
        bool _1461 = _1459 == (-1.0);
        bool _1463 = !_1445;
        bool _1465 = _1461 || _1463;
        bool _1467 = _1343 == 1.0;
        bool _1469 = _1467 && _1457;
        bool _1471 = !_1465;
        float _1473 = _1471 ? _1343 : 0.0;
        bool _1475 = !_1469;
        float _1477 = _1475 ? 0.0 : 1.0;
        float _1479 = _1465 ? 0.0 : 0.5;
        float _1481 = _1473 * 0.715200006961822509765625;
        float _1483 = fma(_1477, 0.2125999927520751953125, _1481);
        float _1485 = fma(_1479, 0.072200000286102294921875, _1483);
        float _1487 = 1.0 / _1485;
        float _1489 = _1487 * (*spvDescriptorSet0.fp_c3)._m0[21].z;
        float _1491 = precise::clamp(_1489, 0.0, 1.0);
        float _1493 = fma(_1491, (*spvDescriptorSet0.fp_c3)._m0[21].y, (*spvDescriptorSet0.fp_c3)._m0[21].x);
        float _1495 = _1477 * _1493;
        float _1497 = _1473 * _1493;
        float _1499 = _1479 * _1493;
        out.m_42.x = _1495;
        out.m_42.y = _1497;
        out.m_42.z = _1499;
        out.m_42.w = 1.0;
        return out;
    }
    bool _1501 = _100 != 0;
    bool _1503 = !_1501;
    if (!_1503)
    {
        if (_90)
        {
            _1423 = 0.0;
        }
        float _1505 = _1423;
        float _1507 = _1505;
        if (_90)
        {
            _1425 = 0.0;
        }
        float _1509 = _1425;
        float _1511 = _1509;
        if (!_90)
        {
            float _1513 = _965 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
            _1511 = _1513;
        }
        float _1515 = _1511;
        float _1517 = _1515;
        if (!_90)
        {
            float _1519 = _969 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
            _1507 = _1519;
        }
        float _1521 = _1507;
        float _1523 = _1521;
        if (!_94)
        {
            float _1525 = fma(_953, (*spvDescriptorSet0.fp_c3)._m0[1].y, _1515);
            _1517 = _1525;
        }
        float _1527 = _1517;
        if (_90)
        {
            _1427 = 0.0;
        }
        float _1529 = _1427;
        float _1531 = _1529;
        if (!_90)
        {
            float _1533 = _973 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
            _1531 = _1533;
        }
        float _1535 = _1531;
        float _1537 = _1527 * 0.715200006961822509765625;
        float _1539 = _1535;
        if (!_94)
        {
            float _1541 = fma(_937, (*spvDescriptorSet0.fp_c3)._m0[1].y, _1521);
            _1523 = _1541;
        }
        float _1543 = _1523;
        if (!_94)
        {
            float _1545 = fma(_957, (*spvDescriptorSet0.fp_c3)._m0[1].y, _1535);
            _1539 = _1545;
        }
        float _1547 = _1539;
        float _1549 = fma(_1543, 0.2125999927520751953125, _1537);
        float _1551 = fma(_1547, 0.072200000286102294921875, _1549);
        float _1553 = 1.0 / _1551;
        float _1555 = _1553 * (*spvDescriptorSet0.fp_c3)._m0[21].z;
        float _1557 = precise::clamp(_1555, 0.0, 1.0);
        float _1559 = fma(_1557, (*spvDescriptorSet0.fp_c3)._m0[21].y, (*spvDescriptorSet0.fp_c3)._m0[21].x);
        float _1561 = _1559 * _1543;
        float _1563 = _1559 * _1527;
        float _1565 = _1559 * _1547;
        out.m_42.x = _1561;
        out.m_42.y = _1563;
        out.m_42.z = _1565;
        out.m_42.w = 1.0;
        return out;
    }
    if (!_98)
    {
        _1429 = as_type<int>(_1417);
    }
    int _1567 = _1429;
    float _1569 = as_type<float>(_1567);
    if (!_98)
    {
        _1431 = as_type<int>(_1415);
    }
    int _1571 = _1431;
    if (!_98)
    {
        _1433 = as_type<int>(_1343);
    }
    int _1573 = _1433;
    float _1575 = as_type<float>(_1573);
    if (!_98)
    {
        out.m_42.x = as_type<float>(_1571);
        out.m_42.y = as_type<float>(_1567);
        out.m_42.z = _1419;
        out.m_42.w = as_type<float>(_1573);
        return out;
    }
    if (_90)
    {
        _1435 = 0.0;
    }
    float _1577 = _1435;
    float _1579 = _1577;
    if (_90)
    {
        _1569 = 0.0;
    }
    float _1581 = _1569;
    float _1583 = _1581;
    if (!_90)
    {
        float _1585 = _965 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
        _1583 = _1585;
    }
    float _1587 = _1583;
    float _1589 = _1587;
    if (!_90)
    {
        float _1591 = _969 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
        _1579 = _1591;
    }
    float _1593 = _1579;
    float _1595 = _1593;
    if (!_94)
    {
        float _1597 = fma(_953, (*spvDescriptorSet0.fp_c3)._m0[1].y, _1587);
        _1589 = _1597;
    }
    float _1599 = _1589;
    if (_90)
    {
        _1575 = 0.0;
    }
    float _1601 = _1575;
    float _1603 = _1601;
    if (!_90)
    {
        float _1605 = _973 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
        _1603 = _1605;
    }
    float _1607 = _1603;
    float _1609 = _1599 * 0.715200006961822509765625;
    float _1611 = _1607;
    if (!_94)
    {
        float _1613 = fma(_937, (*spvDescriptorSet0.fp_c3)._m0[1].y, _1593);
        _1595 = _1613;
    }
    float _1615 = _1595;
    if (!_94)
    {
        float _1617 = fma(_957, (*spvDescriptorSet0.fp_c3)._m0[1].y, _1607);
        _1611 = _1617;
    }
    float _1619 = _1611;
    float _1621 = fma(_1615, 0.2125999927520751953125, _1609);
    float _1623 = fma(_1619, 0.072200000286102294921875, _1621);
    float _1625 = 1.0 / _1623;
    float _1627 = _1625 * (*spvDescriptorSet0.fp_c3)._m0[21].z;
    float _1629 = precise::clamp(_1627, 0.0, 1.0);
    float _1631 = fma(_1629, (*spvDescriptorSet0.fp_c3)._m0[21].y, (*spvDescriptorSet0.fp_c3)._m0[21].x);
    float _1633 = _1631 * _1615;
    float _1635 = _1631 * _1599;
    float _1637 = _1631 * _1619;
    out.m_42.x = _1633;
    out.m_42.y = _1635;
    out.m_42.z = _1637;
    out.m_42.w = 1.0;
    return out;
}


struct main0_out_u
{
    uint4 m_42 [[color(0)]];
};

fragment main0_out_u main0_u(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    bool _835 = false;
    bool _274 = false;
    float _54 = gl_FragCoord.w;
    float _56 = in.m_39.y;
    float _58 = gl_FragCoord.w;
    float _60 = _56 * _58;
    float _62 = in.m_39.x;
    float _64 = gl_FragCoord.w;
    float _66 = _62 * _64;
    float _68 = in.m_39.z;
    float _70 = gl_FragCoord.w;
    float _72 = _68 * _70;
    int _74 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 4096;
    bool _78 = _74 != 0;
    int _80 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 1;
    bool _82 = _80 != 0;
    int _84 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 8;
    bool _86 = _84 != 0;
    int _88 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 32;
    bool _90 = _88 != 0;
    int _92 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 64;
    bool _94 = _92 != 0;
    int _96 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 8192;
    bool _98 = _96 != 0;
    int _100 = int(_78);
    float _102 = 1.0 / _54;
    float _104 = _102 * _60;
    float _106 = _102 * _66;
    float _108 = _102 * _72;
    float _110 = _104 * _104;
    float _112 = fma(_106, _106, _110);
    float _114 = (*spvDescriptorSet0.fp_c3)._m0[13].w + (-220.0);
    float _116 = fma(_108, _108, _112);
    float _118 = precise::max(0.0, _114);
    float _120 = rsqrt(_116);
    float _122 = _106 * _120;
    float _124 = _108 * _120;
    float _126 = _104 * _120;
    float _128 = _122 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    float _130 = _124 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    float _132 = -_126;
    float _134 = -_118;
    float _136 = fma(_132, (*spvDescriptorSet0.fp_c3)._m0[13].z, _134);
    float _138 = _128 * _128;
    float _140 = _130 * _130;
    float _142 = _138 + _140;
    float _144 = sqrt(_142);
    bool _146 = _144 > (*spvDescriptorSet0.fp_c3)._m0[13].x;
    float _148 = _120;
    float _150 = _118;
    float _152 = _136;
    float _154 = _128;
    float _156 = _130;
    if (!_146)
    {
        _148 = _140;
    }
    float _158 = _148;
    float _160 = _158;
    if (!_146)
    {
        _150 = _138;
    }
    float _162 = _150;
    bool _164 = !_146;
    float _166 = _162;
    if (!_164)
    {
        float _168 = 1.0 / (*spvDescriptorSet0.fp_c3)._m0[13].y;
        float _170 = -(*spvDescriptorSet0.fp_c3)._m0[13].x;
        float _172 = _144 + _170;
        float _174 = _136 + (*spvDescriptorSet0.fp_c3)._m0[13].y;
        float _176 = rsqrt(_142);
        float _178 = _172 * _168;
        float _180 = _178 * 0.15915493667125701904296875;
        float _182 = _180 * 6.283185482025146484375;
        float _184 = sin(_182);
        float _186 = _180 * 6.283185482025146484375;
        float _188 = cos(_186);
        float _190 = fma(_184, _174, (*spvDescriptorSet0.fp_c3)._m0[13].x);
        float _192 = _176 * _190;
        float _194 = _188 + (-1.0);
        float _196 = _128 * _192;
        float _198 = _130 * _192;
        float _200 = _194 * (*spvDescriptorSet0.fp_c3)._m0[13].y;
        float _202 = _198 * _198;
        float _204 = fma(_136, _188, _200);
        float _206 = _196 * _196;
        _152 = _204;
        _166 = _206;
        _160 = _202;
        _154 = _196;
        _156 = _198;
    }
    float _208 = _152;
    float _210 = _166;
    float _212 = _160;
    float _214 = _154;
    float _216 = _156;
    float _218 = fma(_208, _208, _210);
    float _220 = _218 + _212;
    float _222 = rsqrt(_220);
    float _224 = _222 * _208;
    float _226 = _222 * _214;
    float _228 = _222 * _216;
    float _230 = -_224;
    float _232 = precise::max(0.0, _230);
    float _234 = abs(_232);
    float _236 = -_234;
    float _238 = _236 + 1.0;
    float _240 = fma(_232, -0.0187292993068695068359375, 0.074261002242565155029296875);
    int _242 = as_type<int>(_238) + (-218103808);
    float _244 = fma(_232, _240, -0.212114393711090087890625);
    bool _246 = uint(_242) >= 1920991232u;
    float _248 = fma(_232, _244, 1.570728778839111328125);
    bool _250 = !_246;
    float _272;
    if (!_250)
    {
        int _252 = 0;
        int _254 = as_type<int>(_238);
        int _256 = 0;
        int _258 = 1232;
        int _260;
        int _262;
        int _264;
        int _266;
        int _268;
        int _270;
        _50(_252, _254, _256, _258, _260, _262, _264, _266, _268, _270);
        _272 = as_type<float>(_260);
        _274 = true;
    }
    else
    {
        float _276 = rsqrt(_238);
        float _278 = _238 * _276;
        float _280 = _276 * 0.5;
        float _282 = -_278;
        float _284 = 0.0 + _282;
        float _286 = fma(_280, _284, 0.5);
        float _288 = fma(_278, _286, _278);
        float _290 = -_288;
        float _292 = 0.0 + _290;
        float _294 = fma(_288, _292, _238);
        float _296 = fma(_280, _294, _288);
        _272 = _296;
    }
    _274 = false;
    float _298 = _272;
    bool _300 = _224 > 0.0;
    float _302 = _124 * _124;
    float _304 = _122 * _122;
    float _306 = _302 + _304;
    if (_300)
    {
        discard_fragment();
    }
    float _308 = rsqrt(_306);
    float _310 = _248 * _298;
    float _312 = _310 * 0.636619746685028076171875;
    float _314 = precise::clamp(_312, 0.0, 1.0);
    float _316 = -_314;
    float _318 = _316 + 1.0;
    float _320 = sqrt(_318);
    float _322 = _124 * _308;
    float _324 = _122 * _308;
    float _326 = abs(_322);
    float _328 = abs(_324);
    float _330 = precise::max(_326, _328);
    float _332 = precise::max(_330, 9.9999997473787516355514526367188e-05);
    float _334 = -_320;
    float _336 = _334 + 1.0;
    float _338 = 1.0 / _332;
    float _340 = _336 * 0.5;
    float _342 = -_338;
    float _344 = _322 * _342;
    float _346 = _324 * _338;
    float _348 = fma(_344, _340, 0.5);
    float _350 = fma(_346, _340, 0.5);
    if (_300)
    {
        out.m_42.x = 0.0;
        out.m_42.y = 0.0;
        out.m_42.z = 0.0;
        out.m_42.w = 0.0;
        return main0_out_u{as_type<uint4>(out.m_42)};
    }
    float2 _2057;
    _2057.x = spvDescriptorSet0.fp_t_tcb_8.calculate_clamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_348, _350));
    _2057.y = spvDescriptorSet0.fp_t_tcb_8.calculate_unclamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_348, _350));
    float _352 = _2057.x;
    float _354 = _352 * 256.0;
    int _356 = int(_354);
    float _358 = -_126;
    float _360 = _358 + 1.0;
    float _362 = precise::clamp(_360, 0.0, 1.0);
    float _364 = -_126;
    float _366 = fma(_364, _126, 1.0);
    float _368 = precise::clamp(_366, 0.0, 1.0);
    float _370 = _124 * (-3.0);
    int _372 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 2;
    bool _374 = _372 != 0;
    float _376 = _122 * _122;
    float _378 = 0.88622701168060302734375 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
    float _380 = 0.88622701168060302734375 * (*spvDescriptorSet0.fp_c3)._m0[4].z;
    float _382 = 0.88622701168060302734375 * (*spvDescriptorSet0.fp_c3)._m0[4].x;
    float _384 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].x;
    float _386 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
    float _388 = -_124;
    float _390 = fma(_388, _370, -1.0);
    float _392 = -_126;
    float _394 = fma(_392, _126, _376);
    float _396 = fma(_126, _384, _378);
    float _398 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _400 = _362;
    if (_374)
    {
        float _402 = sqrt(_368);
        _400 = _402;
    }
    float _404 = _400;
    float _406 = fma(_302, 3.0, -1.0);
    float _408 = -_124;
    float _410 = fma(_408, _386, _396);
    float _412 = fma(_124, _386, _396);
    float _414 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[4].w;
    float _416 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
    float _418 = fma(_126, _398, _380);
    float _420 = fma(_126, _414, _382);
    float _422 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
    float _424 = -_124;
    float _426 = fma(_424, _416, _418);
    float _428 = fma(_124, _416, _418);
    float _430 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].w;
    float _432 = -_122;
    float _434 = fma(_432, _422, _410);
    float _436 = fma(_122, _422, _412);
    float _438 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].z;
    float _440 = abs(_404);
    float _442 = log2(_440);
    float _444 = -_122;
    float _446 = fma(_444, _430, _426);
    float _448 = fma(_122, _430, _428);
    float _450 = -_124;
    float _452 = fma(_450, _438, _420);
    float _454 = fma(_124, _438, _420);
    float _456 = _122 * _124;
    float _458 = -_124;
    float _460 = _126 * _458;
    float _462 = _126 * _124;
    float _464 = _122 * _126;
    float _466 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
    float _468 = _226 * (*spvDescriptorSet0.fp_c3)._m0[11].x;
    float _470 = -_122;
    float _472 = fma(_470, _466, _452);
    float _474 = -_468;
    float _476 = fma(_224, (*spvDescriptorSet0.fp_c3)._m0[11].y, _474);
    float _478 = _442 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _480 = -_126;
    float _482 = _122 * _480;
    float _484 = fma(_122, _466, _454);
    float _486 = exp2(_478);
    float _488 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].x;
    float _490 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
    float _492 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].z;
    float _494 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[9].x;
    float _496 = fma(_488, _482, _472);
    float _498 = fma(_488, _464, _484);
    float _500 = fma(_490, _482, _434);
    float _502 = fma(_492, _482, _446);
    float _504 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].w;
    float _506 = fma(_490, _464, _436);
    float _508 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].x;
    float _510 = fma(_504, _460, _496);
    float _512 = _486 * (*spvDescriptorSet0.fp_c3)._m0[3].x;
    float _514 = fma(_492, _464, _448);
    float _516 = fma(_504, _462, _498);
    float _518 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
    float _520 = fma(_512, (*spvDescriptorSet0.fp_c3)._m0[12].x, (*spvDescriptorSet0.fp_c3)._m0[12].y);
    float _522 = precise::clamp(_520, 0.0, 1.0);
    float _524 = -_228;
    float _526 = fma(_524, (*spvDescriptorSet0.fp_c3)._m0[11].z, _476);
    float _528 = fma(_508, _460, _500);
    float _530 = fma(_518, _460, _502);
    float _532 = -_522;
    float _534 = _532 + 1.0;
    float _536 = fma(_526, 0.5, 0.5);
    float _538 = fma(_508, _462, _506);
    float _540 = fma(_518, _462, _514);
    float _542 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].z;
    float _544 = fma(_536, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _546 = abs(_534);
    float _548 = log2(_546);
    float _550 = in.m_44.y;
    float _552 = gl_FragCoord.w;
    float _554 = _550 * _552;
    float _556 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].w;
    float _558 = fma(_536, _544, -0.212114393711090087890625);
    float _560 = fma(_542, _456, _510);
    float _562 = fma(_542, _456, _516);
    float _564 = fma(_556, _456, _528);
    float _566 = fma(_536, _558, 1.570728778839111328125);
    float _568 = fma(_556, _456, _538);
    float _570 = in.m_44.x;
    float _572 = gl_FragCoord.w;
    float _574 = _570 * _572;
    float _576 = fma(_494, _456, _530);
    float _578 = fma(_494, _456, _540);
    float _580 = fma(_526, -0.5, 0.5);
    float _582 = 0.429042994976043701171875 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
    float _584 = 0.429042994976043701171875 * (*spvDescriptorSet0.fp_c3)._m0[10].x;
    float _586 = _548 * (*spvDescriptorSet0.fp_c3)._m0[11].w;
    float _588 = sqrt(_580);
    float _590 = 0.2477079927921295166015625 * (*spvDescriptorSet0.fp_c3)._m0[9].z;
    float _592 = 0.2477079927921295166015625 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
    float _594 = 0.2477079927921295166015625 * (*spvDescriptorSet0.fp_c3)._m0[9].w;
    float _596 = fma(_590, _390, _564);
    float _598 = fma(_590, _406, _568);
    float _600 = fma(_592, _390, _560);
    float _602 = exp2(_586);
    float _604 = fma(_592, _406, _562);
    float _606 = fma(_594, _390, _576);
    float _608 = fma(_594, _406, _578);
    float _610 = _224 + 1.0;
    float _612 = fma(_582, _394, _596);
    float _614 = fma(_582, _394, _598);
    float _616 = _102 * _554;
    float _618 = _588 * 0.636619746685028076171875;
    float _620 = fma(_224, -0.5, 0.5);
    float _622 = fma(_584, _394, _600);
    float _624 = fma(_584, _394, _604);
    float _626 = -_566;
    float _628 = fma(_618, _626, 1.0);
    float _630 = _102 * _574;
    float _632 = -_224;
    float _634 = fma(_602, _610, _632);
    float _636 = fma(_634, 0.5, 0.5);
    float _638 = float(uint(_356));
    float _640 = _638 * 0.00390625;
    float2 _2523 = float2(_630, _616);
    float3 _644 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_2523, float2(0.0), isnan(_2523))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_2523, float2(0.0), isnan(_2523))).xyz;
    float _646 = _644.x;
    float _648 = _644.y;
    float _650 = _644.z;
    float2 _2539 = float2(_348, _350);
    float4 _653 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2539, float2(0.0), isnan(_2539)), level(_640)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2539, float2(0.0), isnan(_2539)), level(_640)).xyzw;
    float _655 = _653.x;
    float _657 = _653.y;
    float _659 = _653.z;
    float _661 = _653.w;
    float2 _2556 = float2(_348, _350);
    float2 _665 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_2556, float2(0.0), isnan(_2556)), level(_640)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_2556, float2(0.0), isnan(_2556)), level(_640)).xy;
    float _667 = _665.x;
    float _669 = _665.y;
    float2 _2569 = float2(_348, _350);
    float2 _671 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_2569, float2(0.0), isnan(_2569)), level(_640)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_2569, float2(0.0), isnan(_2569)), level(_640)).xy;
    float _673 = _671.x;
    float _675 = _671.y;
    float2 _2582 = float2(_348, _350);
    float4 _677 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_2582, float2(0.0), isnan(_2582)), level(_640)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_2582, float2(0.0), isnan(_2582)), level(_640)).xyzw;
    float _679 = _677.x;
    float _681 = _677.y;
    float _683 = _677.z;
    float _685 = _677.w;
    float2 _2599 = float2(_628, _620);
    float3 _687 = dm_bs(spvDescriptorSet0.fp_t_tcb_12.sample(spvDescriptorSet0.fp_t_tcb_12Smplr, select(_2599, float2(0.0), isnan(_2599))), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.fp_t_tcb_12, spvDescriptorSet0.fp_t_tcb_12Smplr_w, select(_2599, float2(0.0), isnan(_2599))).xyz;
    float _689 = _687.x;
    float _691 = _687.y;
    float _693 = _687.z;
    float2 _2613 = float2(_628, _636);
    float3 _695 = dm_bs(spvDescriptorSet0.fp_t_tcb_12.sample(spvDescriptorSet0.fp_t_tcb_12Smplr, select(_2613, float2(0.0), isnan(_2613))), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.fp_t_tcb_12, spvDescriptorSet0.fp_t_tcb_12Smplr_w, select(_2613, float2(0.0), isnan(_2613))).xyz;
    float _697 = _695.x;
    float _699 = _695.y;
    float _701 = _695.z;
    int _703 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 1024;
    bool _705 = _703 != 0;
    int _707 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 256;
    bool _709 = _707 != 0;
    float _711 = 0.429042994976043701171875 * (*spvDescriptorSet0.fp_c3)._m0[10].z;
    float _713 = fma(_711, _394, _606);
    float _715 = fma(_711, _394, _608);
    float _717 = -(*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _719 = _717 + 1.0;
    float _721 = -(*spvDescriptorSet0.fp_c3)._m0[2].z;
    float _723 = _721 + 1.0;
    float _725 = _646 * _648;
    float _727 = _661 * _661;
    float _729 = _667 * _669;
    float _731 = -_725;
    float _733 = _731 + 1.0;
    float _735 = _685 * _685;
    float _737 = _727 * _727;
    float _739 = fma(_733, _719, (*spvDescriptorSet0.fp_c3)._m0[2].y);
    float _741 = fma(_733, _723, (*spvDescriptorSet0.fp_c3)._m0[2].z);
    float _743 = _737 * 16.0;
    float _745 = _735 * _735;
    float _747 = -_669;
    float _749 = _747 + _675;
    float _751 = _673 * _741;
    float _753 = _743 * _669;
    float _755 = _745 * 16.0;
    float _757 = fma(_646, _749, _669);
    float _759 = -_729;
    float _761 = fma(_675, _751, _759);
    float _763 = _659 * _753;
    float _765 = _755 * _739;
    float _767 = _655 * _753;
    float _769 = precise::max(_757, 1.52587890625e-05);
    float _771 = _657 * _753;
    float _773 = _675 * _765;
    float _775 = _683 * _765;
    float _777 = fma(_646, _761, _729);
    float _779 = 1.0 / _769;
    float _781 = -_767;
    float _783 = fma(_679, _773, _781);
    float _785 = -_771;
    float _787 = fma(_681, _773, _785);
    float _789 = -_763;
    float _791 = fma(_675, _775, _789);
    float _793 = fma(_646, _783, _767);
    float _795 = fma(_646, _787, _771);
    float _797 = fma(_646, _791, _763);
    float _799 = _777 * _779;
    bool _801 = !_705;
    int _803 = _801 ? as_type<int>(_799) : 0;
    bool _805 = !_709;
    int _807 = _709 ? (-1) : 0;
    int _809 = _803;
    int _823;
    int _825;
    int _827;
    int _829;
    int _831;
    int _833;
    if (!_805)
    {
        float _811 = _472 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _813 = _434 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _815 = _446 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _817 = _484 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _819 = _436 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _821 = _448 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        _823 = as_type<int>(_817);
        _825 = as_type<int>(_819);
        _827 = as_type<int>(_821);
        _829 = as_type<int>(_813);
        _831 = as_type<int>(_811);
        _833 = as_type<int>(_815);
        _835 = true;
    }
    else
    {
        int _837 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 128;
        bool _839 = _837 != 0;
        float _841 = _622 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _843 = _612 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _845 = _713 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _847 = _624 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _849 = _614 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _851 = _715 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        int _853 = as_type<int>(_841);
        int _855 = as_type<int>(_843);
        int _857 = as_type<int>(_845);
        int _859 = as_type<int>(_847);
        int _861 = as_type<int>(_849);
        _807 = _839 ? (-1) : 0;
        _827 = as_type<int>(_851);
        if (_839)
        {
            float _863 = _382 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
            _853 = as_type<int>(_863);
        }
        int _865 = _853;
        _831 = _865;
        if (_839)
        {
            float _867 = _378 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
            _855 = as_type<int>(_867);
        }
        int _869 = _855;
        _829 = _869;
        if (_839)
        {
            float _871 = _380 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
            _857 = as_type<int>(_871);
        }
        int _873 = _857;
        _833 = _873;
        if (_839)
        {
            _859 = _865;
        }
        int _875 = _859;
        _823 = _875;
        if (_839)
        {
            _861 = _869;
        }
        int _877 = _861;
        _825 = _877;
        if (_839)
        {
            _827 = _873;
        }
    }
    _835 = false;
    int _879 = _807;
    int _881 = _823;
    int _883 = _825;
    int _885 = _827;
    int _887 = _829;
    int _889 = _831;
    int _891 = _833;
    int _893 = 0;
    int _895 = _879;
    if (!_94)
    {
        int _897 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 4104;
        bool _899 = _897 != 0;
        _893 = _899 ? (-1) : 0;
    }
    int _901 = _893;
    float _903 = _548 * (*spvDescriptorSet0.fp_c3)._m0[12].z;
    if (_94)
    {
        _895 = -1;
    }
    int _905 = _895;
    float _907 = as_type<float>(_803) * (*spvDescriptorSet0.fp_c3)._m0[1].x;
    int _909 = _905;
    if (!_94)
    {
        int _911 = ~_901;
        bool _913 = !_98;
        int _915 = _911 & (_913 ? (-1) : 0);
        _909 = _915;
    }
    int _917 = _909;
    float _919 = as_type<float>(_803) * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    bool _921 = _100 != 0;
    float _923 = exp2(_903);
    float _925 = _793 * _779;
    float _927 = _795 * _779;
    float _929 = _797 * _779;
    int _931 = _917;
    if (_90)
    {
        _931 = -1;
    }
    int _933 = _931;
    int _935 = ~_917;
    float _937 = (_935 != 0) ? as_type<float>(_881) : 0.0;
    int _939 = _933;
    if (!_90)
    {
        bool _941 = !_98;
        bool _943 = _941 && _86;
        bool _945 = !_921;
        bool _947 = _943 && _945;
        _939 = _947 ? (-1) : 0;
    }
    int _949 = _939;
    int _951 = ~_917;
    float _953 = (_951 != 0) ? as_type<float>(_883) : 0.0;
    int _955 = ~_917;
    float _957 = (_955 != 0) ? as_type<float>(_885) : 0.0;
    bool _959 = !_98;
    bool _961 = _86 && _959;
    int _963 = ~_949;
    float _965 = (_963 != 0) ? as_type<float>(_887) : 0.0;
    int _967 = ~_949;
    float _969 = (_967 != 0) ? as_type<float>(_889) : 0.0;
    int _971 = ~_949;
    float _973 = (_971 != 0) ? as_type<float>(_891) : 0.0;
    int _975 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 16;
    bool _977 = _975 != 0;
    bool _979 = !_961;
    float _981 = _979 ? _907 : 0.0;
    float _983 = -_923;
    float _985 = _983 + 1.0;
    bool _987 = !_961;
    float _989 = _987 ? _919 : 0.0;
    float _991 = _985 * (*spvDescriptorSet0.fp_c3)._m0[12].w;
    bool _993 = !_977;
    float _995 = _989 * _953;
    bool _997 = !_977;
    float _999 = -_991;
    float _1001 = _999 + 1.0;
    bool _1003 = !_993;
    float _1005 = _1003 ? 1.0 : (*spvDescriptorSet0.fp_c3)._m0[23].y;
    float _1007 = _989 * _937;
    float _1009 = _989 * _957;
    float _1011 = fma(_965, _981, _995);
    bool _1013 = !_997;
    float _1015 = _1013 ? 1.0 : (*spvDescriptorSet0.fp_c3)._m0[23].x;
    float _1017 = abs(_1001);
    float _1019 = log2(_1017);
    bool _1021 = !_977;
    float _1023 = fma(_969, _981, _1007);
    float _1025 = _1005 * _1011;
    float _1027 = fma(_973, _981, _1009);
    bool _1029 = !_1021;
    float _1031 = _1029 ? 1.0 : (*spvDescriptorSet0.fp_c3)._m0[23].z;
    float _1033 = _1015 * _1023;
    float _1035 = _1025 * 0.715200006961822509765625;
    float _1037 = -_650;
    float _1039 = _1037 + 1.0;
    float _1041 = -(*spvDescriptorSet0.fp_c3)._m0[26].y;
    float _1043 = _224 * _1041;
    float _1045 = _1031 * _1027;
    float _1047 = fma(_1033, 0.2125999927520751953125, _1035);
    float _1049 = _757 * _1039;
    float _1051 = _725 * (*spvDescriptorSet0.fp_c3)._m0[2].x;
    float _1053 = fma(_226, (*spvDescriptorSet0.fp_c3)._m0[26].x, _1043);
    float _1055 = fma(_1045, 0.072200000286102294921875, _1047);
    float _1057 = _1019 * (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _1059 = _1019 * (*spvDescriptorSet0.fp_c3)._m0[3].z;
    float _1061 = -_1033;
    float _1063 = _1061 + _1055;
    float _1065 = -_1025;
    float _1067 = _1065 + _1055;
    float _1069 = exp2(_1057);
    float _1071 = fma(_1051, _1063, _1033);
    float _1073 = -_1045;
    float _1075 = _1073 + _1055;
    float _1077 = fma(_1051, _1067, _1025);
    int _1079 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 512;
    bool _1081 = _1079 != 0;
    float _1083 = fma(_1051, _1075, _1045);
    float _1085 = exp2(_1059);
    float _1087 = _1049 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    bool _1089 = !_1081;
    float _1091 = _224 * (-10000.0);
    float _1093 = _1089 ? _925 : 0.0;
    bool _1095 = !_82;
    float _1097 = _1095 ? _1069 : 1.0;
    bool _1099 = !_1081;
    bool _1101 = !_1081;
    float _1103 = as_type<float>(_803) * _1097;
    float _1105 = _1097 * _1071;
    float _1107 = _1097 * _1077;
    float _1109 = _1099 ? _929 : 0.0;
    int _1111 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 16384;
    bool _1113 = _1111 != 0;
    float _1115 = _86 ? _1103 : _1105;
    float _1117 = _86 ? _1103 : _1107;
    float _1119 = _1103;
    float _1121 = _1083;
    float _1123 = _1069;
    if (!_86)
    {
        float _1125 = _1097 * _1083;
        _1119 = _1125;
    }
    float _1127 = _1119;
    float _1129 = _1115 * (*spvDescriptorSet0.fp_c3)._m0[28].x;
    bool _1131 = !_82;
    float _1133 = _1131 ? _1085 : 1.0;
    float _1135 = _1117 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    float _1137 = _1101 ? _927 : 0.0;
    float _1139 = _1127 * (*spvDescriptorSet0.fp_c3)._m0[28].z;
    float _1141 = _1133 * _1093;
    float _1143 = _1133 * _1137;
    float _1145 = _1133 * _1109;
    float _1147 = fma(_1141, (*spvDescriptorSet0.fp_c3)._m0[27].x, _1129);
    float _1149 = _1141;
    float _1151 = _1145;
    float _1153 = _1147;
    if (_82)
    {
        _809 = as_type<int>(_1087);
    }
    int _1155 = _809;
    float _1157 = fma(_1143, (*spvDescriptorSet0.fp_c3)._m0[27].y, _1135);
    int _1159 = _1155;
    int _1161 = _1155;
    if (_82)
    {
        _1121 = 0.0;
    }
    float _1163 = _1121;
    float _1165 = fma(_1145, (*spvDescriptorSet0.fp_c3)._m0[27].z, _1139);
    float _1167 = _1165;
    float _1169 = _1163;
    if (_82)
    {
        _1149 = 0.0;
    }
    float _1171 = _1149;
    float _1173 = (*spvDescriptorSet0.fp_c3)._m0[24].x * (*spvDescriptorSet0.fp_c3)._m0[24].y;
    float _1175 = _1171;
    if (_82)
    {
        _1123 = 0.0;
    }
    float _1177 = _1123;
    bool _1179 = !_82;
    float _1181 = _1179 ? _991 : 0.0;
    float _1183 = _1177;
    if (_82)
    {
        _1151 = _1157;
    }
    float _1185 = _1151;
    float _1187 = _1185;
    float _1189 = _1185;
    if (!_82)
    {
        int _1191 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 4;
        bool _1193 = _1191 != 0;
        float _1195 = _699 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        int _1197 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 5;
        bool _1199 = _1197 != 0;
        float _1201 = _697 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _1203 = _701 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        bool _1205 = !_1199;
        float _1207 = _1205 ? _1201 : 0.0;
        bool _1209 = !_1199;
        float _1211 = _1209 ? _1195 : 0.0;
        bool _1213 = !_1199;
        float _1215 = _1213 ? _1203 : 0.0;
        float _1217 = _1181 * _1207;
        _1169 = _1217;
        if (!_1193)
        {
            _1159 = as_type<int>(_1087);
        }
        int _1219 = _1159;
        float _1221 = _1181 * _1211;
        float _1223 = _1181 * _1215;
        _1161 = _1219;
        _1183 = _1223;
        _1175 = _1221;
        if (!_1193)
        {
            _1187 = _1157;
        }
        float _1225 = _1187;
        bool _1227 = !_1193;
        _1189 = _1225;
        if (!_1227)
        {
            float _1229 = -_1181;
            float _1231 = _1229 + 1.0;
            float _1233 = precise::clamp(_1231, 0.0, 1.0);
            float _1235 = _1233 * _1087;
            float _1237 = precise::max(_1235, 9.9999997473787516355514526367188e-05);
            float _1239 = 1.0 / _1237;
            float _1241 = _1239 * _1087;
            float _1243 = _1147 * _1241;
            float _1245 = _1157 * _1241;
            float _1247 = _1165 * _1241;
            _1161 = as_type<int>(_1235);
            _1167 = _1247;
            _1183 = 0.0;
            _1189 = _1245;
            _1175 = 0.0;
            _1153 = _1243;
            _1169 = 0.0;
        }
    }
    int _1249 = _1161;
    float _1251 = _1167;
    float _1253 = _1183;
    float _1255 = _1189;
    float _1257 = _1175;
    float _1259 = _1153;
    float _1261 = _1169;
    bool _1263 = !_1113;
    float _1265 = _1263 ? as_type<float>(_1249) : 1.0;
    float _1267 = fma(_228, (*spvDescriptorSet0.fp_c3)._m0[26].z, _1053);
    float _1269 = abs(_1091);
    bool _1271 = _1269 > 0.00999999977648258209228515625;
    float _1273 = -_1173;
    float _1275 = exp2(_1273);
    float _1277 = -_1265;
    float _1279 = _1277 + 1.0;
    float _1281 = _1271 ? _1091 : 0.00999999977648258209228515625;
    float _1283 = _1251 + _1253;
    float _1285 = _691 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _1287 = fma(_1267, 2.0, (*spvDescriptorSet0.fp_c3)._m0[24].w);
    float _1289 = _1255 + _1257;
    float _1291 = abs(_1279);
    float _1293 = log2(_1291);
    float _1295 = _1281 * (*spvDescriptorSet0.fp_c3)._m0[24].x;
    float _1297 = fma(_1287, (*spvDescriptorSet0.fp_c3)._m0[24].w, 1.0);
    float _1299 = _689 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _1301 = _693 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    int _1303 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 2048;
    bool _1305 = _1303 != 0;
    float _1307 = precise::max(_1295, -127.0);
    float _1309 = abs(_1297);
    float _1311 = log2(_1309);
    float _1313 = -(*spvDescriptorSet0.fp_c3)._m0[24].w;
    float _1315 = fma(_1313, (*spvDescriptorSet0.fp_c3)._m0[24].w, 1.0);
    float _1317 = _1293 * (*spvDescriptorSet0.fp_c3)._m0[29].z;
    float _1319 = -_1307;
    float _1321 = exp2(_1319);
    float _1323 = _1259 + _1261;
    float _1325 = _1311 * 1.5;
    float _1327 = exp2(_1317);
    float _1329 = -_1321;
    float _1331 = _1329 + 1.0;
    float _1333 = 1.0 / _1307;
    float _1335 = _1275 * _1331;
    float _1337 = -_1327;
    float _1339 = spvFAdd(_1337, 1.00010001659393310546875);
    float _1341 = -_1327;
    float _1343 = _1341 + 1.0;
    float _1345 = exp2(_1325);
    float _1347 = -_1265;
    float _1349 = _1347 + _1343;
    float _1351 = _1285 * _1349;
    float _1353 = 1.0 / _1339;
    float _1355 = _1299 * _1349;
    float _1357 = _1301 * _1349;
    float _1359 = fma(_1289, _1265, _1351);
    float _1361 = _1335 * _1333;
    float _1363 = fma(_1323, _1265, _1355);
    float _1365 = fma(_1283, _1265, _1357);
    float _1367 = _1345 * 12.56637096405029296875;
    float _1369 = (*spvDescriptorSet0.fp_c3)._m0[24].z * 10000.0;
    float _1371 = _1361 * _1369;
    float _1373 = 1.0 / _1367;
    float _1375 = _1353 * _1359;
    float _1377 = _1353 * _1363;
    float _1379 = _1353 * _1365;
    float _1381 = _1375 * 0.715200006961822509765625;
    float _1383 = -_1371;
    float _1385 = exp2(_1383);
    float _1387 = fma(_1377, 0.2125999927520751953125, _1381);
    float _1389 = fma(_1379, 0.072200000286102294921875, _1387);
    float _1391 = _1315 * _1373;
    float _1393 = 1.0 / _1389;
    float _1395 = -_1385;
    float _1397 = _1395 + 1.0;
    float _1399 = _1397 * _1391;
    float _1401 = _1399 * (*spvDescriptorSet0.fp_c3)._m0[25].x;
    float _1403 = _1399 * (*spvDescriptorSet0.fp_c3)._m0[25].y;
    float _1405 = _1399 * (*spvDescriptorSet0.fp_c3)._m0[25].z;
    float _1407 = _1393 * (*spvDescriptorSet0.fp_c3)._m0[21].z;
    float _1409 = precise::clamp(_1407, 0.0, 1.0);
    float _1411 = fma(_1409, (*spvDescriptorSet0.fp_c3)._m0[21].y, (*spvDescriptorSet0.fp_c3)._m0[21].x);
    float _1413 = _1411 * _1385;
    float _1415 = fma(_1377, _1413, _1401);
    float _1417 = fma(_1375, _1413, _1403);
    float _1419 = fma(_1379, _1413, _1405);
    bool _1421 = !_1305;
    float _1423 = _1379;
    float _1425 = _1327;
    float _1427 = _1417;
    int _1429 = as_type<int>(_1327);
    int _1431 = as_type<int>(_1403);
    int _1433 = as_type<int>(_1417);
    float _1435 = _1379;
    if (!_1421)
    {
        bool _1437 = _1343 != 1.0;
        bool _1439 = isnan(_1343);
        bool _1441 = _1437 || _1439;
        bool _1443 = isnan(1.0);
        bool _1445 = _1441 || _1443;
        float _1447 = -_1327;
        bool _1449 = _1447 != (-1.0);
        bool _1451 = isnan(_1447);
        bool _1453 = _1449 || _1451;
        bool _1455 = isnan(-1.0);
        bool _1457 = _1453 || _1455;
        float _1459 = -_1327;
        bool _1461 = _1459 == (-1.0);
        bool _1463 = !_1445;
        bool _1465 = _1461 || _1463;
        bool _1467 = _1343 == 1.0;
        bool _1469 = _1467 && _1457;
        bool _1471 = !_1465;
        float _1473 = _1471 ? _1343 : 0.0;
        bool _1475 = !_1469;
        float _1477 = _1475 ? 0.0 : 1.0;
        float _1479 = _1465 ? 0.0 : 0.5;
        float _1481 = _1473 * 0.715200006961822509765625;
        float _1483 = fma(_1477, 0.2125999927520751953125, _1481);
        float _1485 = fma(_1479, 0.072200000286102294921875, _1483);
        float _1487 = 1.0 / _1485;
        float _1489 = _1487 * (*spvDescriptorSet0.fp_c3)._m0[21].z;
        float _1491 = precise::clamp(_1489, 0.0, 1.0);
        float _1493 = fma(_1491, (*spvDescriptorSet0.fp_c3)._m0[21].y, (*spvDescriptorSet0.fp_c3)._m0[21].x);
        float _1495 = _1477 * _1493;
        float _1497 = _1473 * _1493;
        float _1499 = _1479 * _1493;
        out.m_42.x = _1495;
        out.m_42.y = _1497;
        out.m_42.z = _1499;
        out.m_42.w = 1.0;
        return main0_out_u{as_type<uint4>(out.m_42)};
    }
    bool _1501 = _100 != 0;
    bool _1503 = !_1501;
    if (!_1503)
    {
        if (_90)
        {
            _1423 = 0.0;
        }
        float _1505 = _1423;
        float _1507 = _1505;
        if (_90)
        {
            _1425 = 0.0;
        }
        float _1509 = _1425;
        float _1511 = _1509;
        if (!_90)
        {
            float _1513 = _965 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
            _1511 = _1513;
        }
        float _1515 = _1511;
        float _1517 = _1515;
        if (!_90)
        {
            float _1519 = _969 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
            _1507 = _1519;
        }
        float _1521 = _1507;
        float _1523 = _1521;
        if (!_94)
        {
            float _1525 = fma(_953, (*spvDescriptorSet0.fp_c3)._m0[1].y, _1515);
            _1517 = _1525;
        }
        float _1527 = _1517;
        if (_90)
        {
            _1427 = 0.0;
        }
        float _1529 = _1427;
        float _1531 = _1529;
        if (!_90)
        {
            float _1533 = _973 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
            _1531 = _1533;
        }
        float _1535 = _1531;
        float _1537 = _1527 * 0.715200006961822509765625;
        float _1539 = _1535;
        if (!_94)
        {
            float _1541 = fma(_937, (*spvDescriptorSet0.fp_c3)._m0[1].y, _1521);
            _1523 = _1541;
        }
        float _1543 = _1523;
        if (!_94)
        {
            float _1545 = fma(_957, (*spvDescriptorSet0.fp_c3)._m0[1].y, _1535);
            _1539 = _1545;
        }
        float _1547 = _1539;
        float _1549 = fma(_1543, 0.2125999927520751953125, _1537);
        float _1551 = fma(_1547, 0.072200000286102294921875, _1549);
        float _1553 = 1.0 / _1551;
        float _1555 = _1553 * (*spvDescriptorSet0.fp_c3)._m0[21].z;
        float _1557 = precise::clamp(_1555, 0.0, 1.0);
        float _1559 = fma(_1557, (*spvDescriptorSet0.fp_c3)._m0[21].y, (*spvDescriptorSet0.fp_c3)._m0[21].x);
        float _1561 = _1559 * _1543;
        float _1563 = _1559 * _1527;
        float _1565 = _1559 * _1547;
        out.m_42.x = _1561;
        out.m_42.y = _1563;
        out.m_42.z = _1565;
        out.m_42.w = 1.0;
        return main0_out_u{as_type<uint4>(out.m_42)};
    }
    if (!_98)
    {
        _1429 = as_type<int>(_1417);
    }
    int _1567 = _1429;
    float _1569 = as_type<float>(_1567);
    if (!_98)
    {
        _1431 = as_type<int>(_1415);
    }
    int _1571 = _1431;
    if (!_98)
    {
        _1433 = as_type<int>(_1343);
    }
    int _1573 = _1433;
    float _1575 = as_type<float>(_1573);
    if (!_98)
    {
        out.m_42.x = as_type<float>(_1571);
        out.m_42.y = as_type<float>(_1567);
        out.m_42.z = _1419;
        out.m_42.w = as_type<float>(_1573);
        return main0_out_u{as_type<uint4>(out.m_42)};
    }
    if (_90)
    {
        _1435 = 0.0;
    }
    float _1577 = _1435;
    float _1579 = _1577;
    if (_90)
    {
        _1569 = 0.0;
    }
    float _1581 = _1569;
    float _1583 = _1581;
    if (!_90)
    {
        float _1585 = _965 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
        _1583 = _1585;
    }
    float _1587 = _1583;
    float _1589 = _1587;
    if (!_90)
    {
        float _1591 = _969 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
        _1579 = _1591;
    }
    float _1593 = _1579;
    float _1595 = _1593;
    if (!_94)
    {
        float _1597 = fma(_953, (*spvDescriptorSet0.fp_c3)._m0[1].y, _1587);
        _1589 = _1597;
    }
    float _1599 = _1589;
    if (_90)
    {
        _1575 = 0.0;
    }
    float _1601 = _1575;
    float _1603 = _1601;
    if (!_90)
    {
        float _1605 = _973 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
        _1603 = _1605;
    }
    float _1607 = _1603;
    float _1609 = _1599 * 0.715200006961822509765625;
    float _1611 = _1607;
    if (!_94)
    {
        float _1613 = fma(_937, (*spvDescriptorSet0.fp_c3)._m0[1].y, _1593);
        _1595 = _1613;
    }
    float _1615 = _1595;
    if (!_94)
    {
        float _1617 = fma(_957, (*spvDescriptorSet0.fp_c3)._m0[1].y, _1607);
        _1611 = _1617;
    }
    float _1619 = _1611;
    float _1621 = fma(_1615, 0.2125999927520751953125, _1609);
    float _1623 = fma(_1619, 0.072200000286102294921875, _1621);
    float _1625 = 1.0 / _1623;
    float _1627 = _1625 * (*spvDescriptorSet0.fp_c3)._m0[21].z;
    float _1629 = precise::clamp(_1627, 0.0, 1.0);
    float _1631 = fma(_1629, (*spvDescriptorSet0.fp_c3)._m0[21].y, (*spvDescriptorSet0.fp_c3)._m0[21].x);
    float _1633 = _1631 * _1615;
    float _1635 = _1631 * _1599;
    float _1637 = _1631 * _1619;
    out.m_42.x = _1633;
    out.m_42.y = _1635;
    out.m_42.z = _1637;
    out.m_42.w = 1.0;
    return main0_out_u{as_type<uint4>(out.m_42)};
}

