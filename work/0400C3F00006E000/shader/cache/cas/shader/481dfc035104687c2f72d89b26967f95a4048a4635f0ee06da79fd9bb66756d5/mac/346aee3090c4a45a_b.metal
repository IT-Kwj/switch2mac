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
    texture2d<float> fp_t_tcb_A [[id(3)]];
    sampler fp_t_tcb_ASmplr [[id(4)]];
    texture2d<float> fp_t_tcb_10 [[id(5)]];
    sampler fp_t_tcb_10Smplr [[id(6)]];
    texture2d<float> fp_t_tcb_12 [[id(7)]];
    sampler fp_t_tcb_12Smplr [[id(8)]];
    texture2d<float> fp_t_tcb_14 [[id(9)]];
    sampler fp_t_tcb_14Smplr [[id(10)]];
    texture2d<float> fp_t_tcb_E [[id(11)]];
    sampler fp_t_tcb_ESmplr [[id(12)]];
    texture2d<float> fp_t_tcb_C [[id(13)]];
    sampler fp_t_tcb_CSmplr [[id(14)]];
    texture2d<float> fp_t_tcb_16 [[id(15)]];
    sampler fp_t_tcb_16Smplr [[id(16)]];
    sampler fp_t_tcb_8Smplr_w [[id(17)]];
    sampler fp_t_tcb_ASmplr_w [[id(18)]];
    sampler fp_t_tcb_10Smplr_w [[id(19)]];
    sampler fp_t_tcb_12Smplr_w [[id(20)]];
    sampler fp_t_tcb_14Smplr_w [[id(21)]];
    sampler fp_t_tcb_ESmplr_w [[id(22)]];
    sampler fp_t_tcb_CSmplr_w [[id(23)]];
    sampler fp_t_tcb_16Smplr_w [[id(24)]];
    constant dm_border_t* dm_border [[id(25)]];
};

struct main0_out
{
    float4 m_46 [[color(0)]];
};

struct main0_in
{
    float4 m_48 [[user(locn0)]];
    float4 m_43 [[user(locn1)]];
};

static inline __attribute__((always_inline))
void _54(thread const int& _4122, thread const int& _4123, thread const int& _4124, thread const int& _4125, thread int& _4126, thread int& _4127, thread int& _4128, thread int& _4129, thread int& _4130)
{
    float _4133 = as_type<float>(_4124) + 0.0;
    bool _4135 = _4133 != 0.0;
    bool _4137 = isnan(_4133);
    bool _4139 = _4135 || _4137;
    bool _4141 = isnan(0.0);
    bool _4143 = _4139 || _4141;
    int _4145 = as_type<int>(_4133);
    int _4147 = _4123;
    int _4149 = _4143 ? (-1) : 0;
    if (!_4143)
    {
        float _4151 = as_type<float>(_4124) * 1.0;
        _4145 = as_type<int>(_4151);
    }
    int _4153 = _4145;
    bool _4155 = !_4143;
    int _4157 = _4153;
    if (!_4155)
    {
        float _4159 = as_type<float>(_4124) + 0.0;
        bool _4161 = _4159 >= 0.0;
        bool _4163 = isnan(_4159);
        bool _4165 = _4161 || _4163;
        bool _4167 = isnan(0.0);
        bool _4169 = _4165 || _4167;
        int _4171 = as_type<int>(_4159);
        _4149 = _4169 ? (-1) : 0;
        if (!_4169)
        {
            _4171 = 2147483647;
        }
        int _4173 = _4171;
        bool _4175 = !_4169;
        _4157 = _4173;
        if (!_4175)
        {
            float _4177 = abs(as_type<float>(_4124));
            float _4179 = _4177 + 0.0;
            bool _4181 = _4179 > as_type<float>(0x7f800000u /* inf */);
            bool _4183 = isnan(_4179);
            bool _4185 = _4181 || _4183;
            bool _4187 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _4189 = _4185 || _4187;
            int _4191 = as_type<int>(_4179);
            _4149 = _4189 ? (-1) : 0;
            if (_4189)
            {
                float _4193 = as_type<float>(_4124) + 1.0;
                _4191 = as_type<int>(_4193);
            }
            int _4195 = _4191;
            _4157 = _4195;
            if (!_4189)
            {
                float _4197 = abs(as_type<float>(_4124));
                float _4199 = _4197 + (-0.0);
                float _4201 = 0.0 + _4199;
                bool _4203 = _4201 != as_type<float>(0x7f800000u /* inf */);
                bool _4205 = isnan(_4201);
                bool _4207 = _4203 || _4205;
                bool _4209 = isnan(as_type<float>(0x7f800000u /* inf */));
                bool _4211 = _4207 || _4209;
                int _4213 = as_type<int>(_4201);
                _4149 = _4211 ? (-1) : 0;
                if (!_4211)
                {
                    _4213 = _4124;
                }
                int _4215 = _4213;
                bool _4217 = !_4211;
                _4157 = _4215;
                if (!_4217)
                {
                    float _4219 = as_type<float>(_4124) * 18446744073709551616.0;
                    float _4221 = rsqrt(_4219);
                    float _4223 = _4219 * _4221;
                    float _4225 = _4221 * 0.5;
                    float _4227 = -_4223;
                    float _4229 = 0.0 + _4227;
                    float _4231 = fma(_4225, _4229, 0.5);
                    float _4233 = fma(_4223, _4231, _4223);
                    float _4235 = -_4233;
                    float _4237 = 0.0 + _4235;
                    float _4239 = fma(_4233, _4237, _4219);
                    float _4241 = fma(_4225, _4239, _4233);
                    float _4243 = _4241 * 2.3283064365386962890625e-10;
                    _4157 = as_type<int>(_4243);
                    _4147 = as_type<int>(_4233);
                }
            }
        }
    }
    int _4245 = _4157;
    int _4247 = _4147;
    int _4249 = _4149;
    _4126 = _4245;
    _4127 = _4125;
    _4128 = 0;
    _4129 = _4247;
    _4130 = _4249;
}

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    bool _905 = false;
    bool _272 = false;
    float _58 = gl_FragCoord.w;
    float _60 = in.m_43.y;
    float _62 = gl_FragCoord.w;
    float _64 = _60 * _62;
    float _66 = in.m_43.x;
    float _68 = gl_FragCoord.w;
    float _70 = _66 * _68;
    float _72 = in.m_43.z;
    float _74 = gl_FragCoord.w;
    float _76 = _72 * _74;
    int _78 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 4096;
    bool _82 = _78 != 0;
    int _84 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 1;
    bool _86 = _84 != 0;
    int _88 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 8;
    bool _90 = _88 != 0;
    int _92 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 32;
    bool _94 = _92 != 0;
    int _96 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 64;
    bool _98 = _96 != 0;
    int _100 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 8192;
    bool _102 = _100 != 0;
    int _104 = int(_82);
    float _106 = 1.0 / _58;
    float _108 = _106 * _64;
    float _110 = _106 * _70;
    float _112 = _106 * _76;
    float _114 = _108 * _108;
    float _116 = fma(_110, _110, _114);
    float _118 = (*spvDescriptorSet0.fp_c3)._m0[13].w + (-220.0);
    float _120 = fma(_112, _112, _116);
    float _122 = precise::max(0.0, _118);
    float _124 = rsqrt(_120);
    float _126 = _110 * _124;
    float _128 = _112 * _124;
    float _130 = _108 * _124;
    float _132 = _126 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    float _134 = _128 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    float _136 = -_130;
    float _138 = -_122;
    float _140 = fma(_136, (*spvDescriptorSet0.fp_c3)._m0[13].z, _138);
    float _142 = _132 * _132;
    float _144 = _134 * _134;
    float _146 = _142 + _144;
    float _148 = sqrt(_146);
    bool _150 = _148 > (*spvDescriptorSet0.fp_c3)._m0[13].x;
    float _152 = _124;
    float _154 = _122;
    float _156 = _140;
    float _158 = _132;
    float _160 = _134;
    if (!_150)
    {
        _152 = _144;
    }
    float _162 = _152;
    float _164 = _162;
    if (!_150)
    {
        _154 = _142;
    }
    float _166 = _154;
    bool _168 = !_150;
    float _170 = _166;
    if (!_168)
    {
        float _172 = 1.0 / (*spvDescriptorSet0.fp_c3)._m0[13].y;
        float _174 = -(*spvDescriptorSet0.fp_c3)._m0[13].x;
        float _176 = _148 + _174;
        float _178 = _140 + (*spvDescriptorSet0.fp_c3)._m0[13].y;
        float _180 = rsqrt(_146);
        float _182 = _176 * _172;
        float _184 = _182 * 0.15915493667125701904296875;
        float _186 = _184 * 6.283185482025146484375;
        float _188 = sin(_186);
        float _190 = _184 * 6.283185482025146484375;
        float _192 = cos(_190);
        float _194 = fma(_188, _178, (*spvDescriptorSet0.fp_c3)._m0[13].x);
        float _196 = _180 * _194;
        float _198 = _192 + (-1.0);
        float _200 = _132 * _196;
        float _202 = _134 * _196;
        float _204 = _198 * (*spvDescriptorSet0.fp_c3)._m0[13].y;
        float _206 = _202 * _202;
        float _208 = fma(_140, _192, _204);
        float _210 = _200 * _200;
        _156 = _208;
        _170 = _210;
        _164 = _206;
        _158 = _200;
        _160 = _202;
    }
    float _212 = _156;
    float _214 = _170;
    float _216 = _164;
    float _218 = _158;
    float _220 = _160;
    float _222 = fma(_212, _212, _214);
    float _224 = _222 + _216;
    float _226 = rsqrt(_224);
    float _228 = _226 * _212;
    float _230 = -_228;
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
    float _270;
    if (!_250)
    {
        int _252 = 0;
        int _254 = 0;
        int _256 = as_type<int>(_238);
        int _258 = 1200;
        int _260;
        int _262;
        int _264;
        int _266;
        int _268;
        _54(_252, _254, _256, _258, _260, _262, _264, _266, _268);
        _270 = as_type<float>(_260);
        _272 = true;
    }
    else
    {
        float _274 = rsqrt(_238);
        float _276 = _238 * _274;
        float _278 = _274 * 0.5;
        float _280 = -_276;
        float _282 = 0.0 + _280;
        float _284 = fma(_278, _282, 0.5);
        float _286 = fma(_276, _284, _276);
        float _288 = -_286;
        float _290 = 0.0 + _288;
        float _292 = fma(_286, _290, _238);
        float _294 = fma(_278, _292, _286);
        _270 = _294;
    }
    _272 = false;
    float _296 = _270;
    bool _298 = _228 > 0.0;
    float _300 = _128 * _128;
    float _302 = _126 * _126;
    float _304 = _300 + _302;
    if (_298)
    {
        discard_fragment();
    }
    float _306 = rsqrt(_304);
    float _308 = _248 * _296;
    float _310 = _308 * 0.636619746685028076171875;
    float _312 = precise::clamp(_310, 0.0, 1.0);
    float _314 = -_312;
    float _316 = _314 + 1.0;
    float _318 = sqrt(_316);
    float _320 = _128 * _306;
    float _322 = _126 * _306;
    float _324 = abs(_320);
    float _326 = abs(_322);
    float _328 = precise::max(_324, _326);
    float _330 = precise::max(_328, 9.9999997473787516355514526367188e-05);
    float _332 = -_318;
    float _334 = _332 + 1.0;
    float _336 = 1.0 / _330;
    float _338 = _334 * 0.5;
    float _340 = -_336;
    float _342 = _320 * _340;
    float _344 = _322 * _336;
    float _346 = fma(_342, _338, 0.5);
    float _348 = fma(_344, _338, 0.5);
    if (_298)
    {
        out.m_46.x = 0.0;
        out.m_46.y = 0.0;
        out.m_46.z = 0.0;
        out.m_46.w = 0.0;
        return out;
    }
    float2 _2051;
    _2051.x = spvDescriptorSet0.fp_t_tcb_8.calculate_clamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_346, _348));
    _2051.y = spvDescriptorSet0.fp_t_tcb_8.calculate_unclamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_346, _348));
    float _350 = _2051.x;
    float _352 = _350 * 256.0;
    int _354 = int(_352);
    float _356 = _226 * _218;
    float _358 = _226 * _220;
    int _360 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 2;
    bool _362 = _360 != 0;
    float _364 = _356 * (*spvDescriptorSet0.fp_c3)._m0[11].x;
    int _366 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 1024;
    bool _368 = _366 != 0;
    float _370 = fma(_300, 3.0, -1.0);
    float _372 = -_130;
    float _374 = _372 + 1.0;
    float _376 = precise::clamp(_374, 0.0, 1.0);
    float _378 = -_130;
    float _380 = fma(_378, _130, 1.0);
    float _382 = precise::clamp(_380, 0.0, 1.0);
    float _384 = -_364;
    float _386 = fma(_228, (*spvDescriptorSet0.fp_c3)._m0[11].y, _384);
    float _388 = _126 * _126;
    float _390 = -_358;
    float _392 = fma(_390, (*spvDescriptorSet0.fp_c3)._m0[11].z, _386);
    float _394 = 0.88622701168060302734375 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
    float _396 = _376;
    if (_362)
    {
        float _398 = sqrt(_382);
        _396 = _398;
    }
    float _400 = _396;
    float _402 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].x;
    float _404 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
    float _406 = 0.88622701168060302734375 * (*spvDescriptorSet0.fp_c3)._m0[4].x;
    float _408 = 0.88622701168060302734375 * (*spvDescriptorSet0.fp_c3)._m0[4].z;
    float _410 = fma(_130, _402, _394);
    float _412 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _414 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[4].w;
    float _416 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
    float _418 = -_128;
    float _420 = fma(_418, _404, _410);
    float _422 = fma(_128, _404, _410);
    float _424 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
    float _426 = fma(_130, _412, _408);
    float _428 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].z;
    float _430 = fma(_130, _414, _406);
    float _432 = -_126;
    float _434 = fma(_432, _424, _420);
    float _436 = abs(_400);
    float _438 = log2(_436);
    float _440 = fma(_126, _424, _422);
    float _442 = _128 * (-3.0);
    float _444 = -_128;
    float _446 = fma(_444, _428, _430);
    float _448 = fma(_128, _428, _430);
    float _450 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].w;
    float _452 = -_128;
    float _454 = fma(_452, _416, _426);
    float _456 = fma(_128, _416, _426);
    float _458 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
    float _460 = -_128;
    float _462 = fma(_460, _442, -1.0);
    float _464 = -_126;
    float _466 = fma(_464, _450, _454);
    float _468 = fma(_126, _450, _456);
    float _470 = _126 * _128;
    float _472 = -_130;
    float _474 = _126 * _472;
    float _476 = _126 * _130;
    float _478 = -_126;
    float _480 = fma(_478, _458, _446);
    float _482 = _438 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _484 = fma(_126, _458, _448);
    float _486 = -_130;
    float _488 = fma(_486, _130, _388);
    float _490 = exp2(_482);
    float _492 = -_128;
    float _494 = _130 * _492;
    float _496 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].x;
    float _498 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
    float _500 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].z;
    float _502 = _130 * _128;
    float _504 = fma(_496, _474, _480);
    float _506 = fma(_496, _476, _484);
    float _508 = fma(_498, _474, _434);
    float _510 = fma(_498, _476, _440);
    float _512 = fma(_500, _474, _466);
    float _514 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].x;
    float _516 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].w;
    float _518 = fma(_500, _476, _468);
    float _520 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
    float _522 = _490 * (*spvDescriptorSet0.fp_c3)._m0[3].x;
    float _524 = fma(_514, _494, _508);
    float _526 = fma(_516, _502, _506);
    float _528 = fma(_514, _502, _510);
    float _530 = fma(_522, (*spvDescriptorSet0.fp_c3)._m0[12].x, (*spvDescriptorSet0.fp_c3)._m0[12].y);
    float _532 = precise::clamp(_530, 0.0, 1.0);
    float _534 = fma(_520, _502, _518);
    float _536 = fma(_516, _494, _504);
    float _538 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].z;
    float _540 = -_532;
    float _542 = _540 + 1.0;
    float _544 = fma(_520, _494, _512);
    float _546 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].w;
    float _548 = fma(_538, _470, _536);
    float _550 = abs(_542);
    float _552 = log2(_550);
    float _554 = fma(_392, 0.5, 0.5);
    float _556 = fma(_392, -0.5, 0.5);
    float _558 = fma(_546, _470, _524);
    float _560 = fma(_546, _470, _528);
    float _562 = fma(_538, _470, _526);
    float _564 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[9].x;
    float _566 = 0.2477079927921295166015625 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
    float _568 = sqrt(_556);
    float _570 = fma(_564, _470, _544);
    float _572 = fma(_564, _470, _534);
    float _574 = fma(_554, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _576 = in.m_48.x;
    float _578 = gl_FragCoord.w;
    float _580 = _576 * _578;
    float _582 = in.m_48.y;
    float _584 = gl_FragCoord.w;
    float _586 = _582 * _584;
    float _588 = fma(_566, _462, _548);
    float _590 = _552 * (*spvDescriptorSet0.fp_c3)._m0[11].w;
    float _592 = fma(_566, _370, _562);
    float _594 = 0.2477079927921295166015625 * (*spvDescriptorSet0.fp_c3)._m0[9].z;
    float _596 = 0.2477079927921295166015625 * (*spvDescriptorSet0.fp_c3)._m0[9].w;
    float _598 = fma(_554, _574, -0.212114393711090087890625);
    float _600 = exp2(_590);
    float _602 = fma(_594, _462, _558);
    float _604 = fma(_594, _370, _560);
    float _606 = fma(_554, _598, 1.570728778839111328125);
    float _608 = fma(_596, _462, _570);
    float _610 = _228 + 1.0;
    float _612 = fma(_596, _370, _572);
    float _614 = _568 * 0.636619746685028076171875;
    float _616 = 0.429042994976043701171875 * (*spvDescriptorSet0.fp_c3)._m0[10].x;
    float _618 = 0.429042994976043701171875 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
    float _620 = -_606;
    float _622 = fma(_614, _620, 1.0);
    float _624 = fma(_616, _488, _588);
    float _626 = fma(_616, _488, _592);
    float _628 = 0.429042994976043701171875 * (*spvDescriptorSet0.fp_c3)._m0[10].z;
    float _630 = -_228;
    float _632 = fma(_600, _610, _630);
    float _634 = fma(_618, _488, _602);
    float _636 = fma(_618, _488, _604);
    float _638 = fma(_628, _488, _608);
    float _640 = fma(_628, _488, _612);
    float _642 = fma(_632, 0.5, 0.5);
    float _644 = fma(_228, -0.5, 0.5);
    float _646 = _106 * _580;
    float _648 = _106 * _586;
    float _650 = float(uint(_354));
    float _652 = _650 * 0.00390625;
    float2 _2541 = float2(_346, _348);
    float4 _655 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2541, float2(0.0), isnan(_2541)), level(_652)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2541, float2(0.0), isnan(_2541)), level(_652)).xyzw;
    float _657 = _655.x;
    float _659 = _655.y;
    float _661 = _655.z;
    float _663 = _655.w;
    float2 _2560 = float2(_346, _348);
    float2 _667 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_2560, float2(0.0), isnan(_2560)), level(_652)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_2560, float2(0.0), isnan(_2560)), level(_652)).xy;
    float _669 = _667.x;
    float _671 = _667.y;
    float2 _2573 = float2(_346, _348);
    float4 _673 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_2573, float2(0.0), isnan(_2573)), level(_652)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_2573, float2(0.0), isnan(_2573)), level(_652)).xyzw;
    float _675 = _673.x;
    float _677 = _673.y;
    float _679 = _673.z;
    float _681 = _673.w;
    float2 _2590 = float2(_346, _348);
    float2 _683 = dm_bs(spvDescriptorSet0.fp_t_tcb_12.sample(spvDescriptorSet0.fp_t_tcb_12Smplr, select(_2590, float2(0.0), isnan(_2590)), level(_652)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_12, spvDescriptorSet0.fp_t_tcb_12Smplr_w, select(_2590, float2(0.0), isnan(_2590)), level(_652)).xy;
    float _685 = _683.x;
    float _687 = _683.y;
    float2 _2603 = float2(_646, _648);
    float3 _691 = dm_bs(spvDescriptorSet0.fp_t_tcb_14.sample(spvDescriptorSet0.fp_t_tcb_14Smplr, select(_2603, float2(0.0), isnan(_2603))), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_14, spvDescriptorSet0.fp_t_tcb_14Smplr_w, select(_2603, float2(0.0), isnan(_2603))).xyz;
    float _693 = _691.x;
    float _695 = _691.y;
    float _697 = _691.z;
    float2 _2617 = float2(_346, _348);
    float2 _699 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_2617, float2(0.0), isnan(_2617)), level(_652)), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_2617, float2(0.0), isnan(_2617)), level(_652)).xy;
    float _701 = _699.x;
    float _703 = _699.y;
    float2 _2630 = float2(_346, _348);
    float4 _705 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_2630, float2(0.0), isnan(_2630)), level(_652)), spvDescriptorSet0.dm_border, 6u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_2630, float2(0.0), isnan(_2630)), level(_652)).xyzw;
    float _707 = _705.x;
    float _709 = _705.y;
    float _711 = _705.z;
    float _713 = _705.w;
    float2 _2647 = float2(_622, _644);
    float3 _715 = dm_bs(spvDescriptorSet0.fp_t_tcb_16.sample(spvDescriptorSet0.fp_t_tcb_16Smplr, select(_2647, float2(0.0), isnan(_2647))), spvDescriptorSet0.dm_border, 7u, spvDescriptorSet0.fp_t_tcb_16, spvDescriptorSet0.fp_t_tcb_16Smplr_w, select(_2647, float2(0.0), isnan(_2647))).xyz;
    float _717 = _715.x;
    float _719 = _715.y;
    float _721 = _715.z;
    float2 _2661 = float2(_622, _642);
    float3 _723 = dm_bs(spvDescriptorSet0.fp_t_tcb_16.sample(spvDescriptorSet0.fp_t_tcb_16Smplr, select(_2661, float2(0.0), isnan(_2661))), spvDescriptorSet0.dm_border, 7u, spvDescriptorSet0.fp_t_tcb_16, spvDescriptorSet0.fp_t_tcb_16Smplr_w, select(_2661, float2(0.0), isnan(_2661))).xyz;
    float _725 = _723.x;
    float _727 = _723.y;
    float _729 = _723.z;
    int _731 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 256;
    bool _733 = _731 != 0;
    float _735 = _663 * _663;
    float _737 = _681 * _681;
    float _739 = _735 * _735;
    float _741 = _693 * _695;
    float _743 = _737 * _737;
    float _745 = _739 * 16.0;
    float _747 = _745 * _671;
    float _749 = _669 * _671;
    float _751 = _743 * 16.0;
    float _753 = _657 * _747;
    float _755 = _659 * _747;
    float _757 = _661 * _747;
    float _759 = -_671;
    float _761 = _759 + _687;
    float _763 = -_749;
    float _765 = fma(_685, _687, _763);
    float _767 = _751 * _687;
    float _769 = -(*spvDescriptorSet0.fp_c3)._m0[2].z;
    float _771 = _769 + 1.0;
    float _773 = fma(_761, (*spvDescriptorSet0.fp_c3)._m0[0].x, _671);
    float _775 = fma(_765, (*spvDescriptorSet0.fp_c3)._m0[0].x, _749);
    float _777 = -_755;
    float _779 = fma(_677, _767, _777);
    float _781 = -_753;
    float _783 = fma(_675, _767, _781);
    float _785 = -_757;
    float _787 = fma(_679, _767, _785);
    float _789 = precise::max(_773, 1.52587890625e-05);
    float _791 = fma(_779, (*spvDescriptorSet0.fp_c3)._m0[0].x, _755);
    float _793 = -(*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _795 = _793 + 1.0;
    float _797 = -_741;
    float _799 = _797 + 1.0;
    float _801 = fma(_783, (*spvDescriptorSet0.fp_c3)._m0[0].x, _753);
    float _803 = fma(_787, (*spvDescriptorSet0.fp_c3)._m0[0].x, _757);
    float _805 = 1.0 / _789;
    float _807 = fma(_799, _795, (*spvDescriptorSet0.fp_c3)._m0[2].y);
    float _809 = fma(_799, _771, (*spvDescriptorSet0.fp_c3)._m0[2].z);
    float _811 = -_773;
    float _813 = _811 + _703;
    float _815 = _713 * _713;
    float _817 = _701 * _809;
    float _819 = fma(_693, _813, _773);
    float _821 = _815 * _815;
    float _823 = precise::max(_819, 1.52587890625e-05);
    float _825 = _821 * 16.0;
    float _827 = _773 * _805;
    float _829 = _825 * _807;
    float _831 = 1.0 / _823;
    float _833 = _775 * _827;
    float _835 = _801 * _827;
    float _837 = _791 * _827;
    float _839 = _703 * _829;
    float _841 = -_833;
    float _843 = fma(_703, _817, _841);
    float _845 = _803 * _827;
    float _847 = _711 * _829;
    float _849 = -_835;
    float _851 = fma(_707, _839, _849);
    float _853 = fma(_693, _843, _833);
    float _855 = -_837;
    float _857 = fma(_709, _839, _855);
    float _859 = -_845;
    float _861 = fma(_703, _847, _859);
    float _863 = fma(_693, _851, _835);
    float _865 = fma(_693, _857, _837);
    float _867 = _853 * _831;
    float _869 = fma(_693, _861, _845);
    bool _871 = !_368;
    float _873 = _871 ? _867 : 0.0;
    bool _875 = !_733;
    int _877 = _733 ? (-1) : 0;
    float _879 = _873;
    int _893;
    int _895;
    int _897;
    int _899;
    int _901;
    int _903;
    if (!_875)
    {
        float _881 = _480 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _883 = _434 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _885 = _466 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _887 = _484 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _889 = _440 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _891 = _468 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        _893 = as_type<int>(_889);
        _895 = as_type<int>(_891);
        _897 = as_type<int>(_883);
        _899 = as_type<int>(_881);
        _901 = as_type<int>(_887);
        _903 = as_type<int>(_885);
        _905 = true;
    }
    else
    {
        int _907 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 128;
        bool _909 = _907 != 0;
        float _911 = _624 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _913 = _634 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _915 = _638 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _917 = _626 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _919 = _636 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _921 = _640 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        int _923 = as_type<int>(_911);
        int _925 = as_type<int>(_913);
        int _927 = as_type<int>(_915);
        int _929 = as_type<int>(_917);
        int _931 = as_type<int>(_919);
        _877 = _909 ? (-1) : 0;
        _895 = as_type<int>(_921);
        if (_909)
        {
            float _933 = _406 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
            _923 = as_type<int>(_933);
        }
        int _935 = _923;
        _899 = _935;
        if (_909)
        {
            float _937 = _394 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
            _925 = as_type<int>(_937);
        }
        int _939 = _925;
        _897 = _939;
        if (_909)
        {
            float _941 = _408 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
            _927 = as_type<int>(_941);
        }
        int _943 = _927;
        _903 = _943;
        if (_909)
        {
            _929 = _935;
        }
        int _945 = _929;
        _901 = _945;
        if (_909)
        {
            _931 = _939;
        }
        int _947 = _931;
        _893 = _947;
        if (_909)
        {
            _895 = _943;
        }
    }
    _905 = false;
    int _949 = _877;
    int _951 = _893;
    int _953 = _895;
    int _955 = _897;
    int _957 = _899;
    int _959 = _901;
    int _961 = _903;
    int _963 = 0;
    int _965 = _949;
    if (!_98)
    {
        int _967 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 4104;
        bool _969 = _967 != 0;
        _963 = _969 ? (-1) : 0;
    }
    int _971 = _963;
    float _973 = _552 * (*spvDescriptorSet0.fp_c3)._m0[12].z;
    if (_98)
    {
        _965 = -1;
    }
    int _975 = _965;
    float _977 = fma(_693, _813, _773);
    int _979 = _975;
    if (!_98)
    {
        int _981 = ~_971;
        bool _983 = !_102;
        int _985 = _981 & (_983 ? (-1) : 0);
        _979 = _985;
    }
    int _987 = _979;
    float _989 = _873 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
    bool _991 = _104 != 0;
    float _993 = exp2(_973);
    float _995 = _873 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _997 = _863 * _831;
    float _999 = _865 * _831;
    float _1001 = _869 * _831;
    float _1003 = _741 * (*spvDescriptorSet0.fp_c3)._m0[2].x;
    int _1005 = _987;
    if (_94)
    {
        _1005 = -1;
    }
    int _1007 = _1005;
    int _1009 = ~_987;
    float _1011 = (_1009 != 0) ? as_type<float>(_951) : 0.0;
    int _1013 = _1007;
    if (!_94)
    {
        bool _1015 = !_102;
        bool _1017 = _1015 && _90;
        bool _1019 = !_991;
        bool _1021 = _1017 && _1019;
        _1013 = _1021 ? (-1) : 0;
    }
    int _1023 = _1013;
    float _1025 = -_993;
    float _1027 = _1025 + 1.0;
    int _1029 = ~_987;
    float _1031 = (_1029 != 0) ? as_type<float>(_953) : 0.0;
    float _1033 = _1027 * (*spvDescriptorSet0.fp_c3)._m0[12].w;
    float _1035 = -_1033;
    float _1037 = _1035 + 1.0;
    bool _1039 = !_102;
    bool _1041 = _90 && _1039;
    float _1043 = abs(_1037);
    float _1045 = log2(_1043);
    int _1047 = ~_1023;
    float _1049 = (_1047 != 0) ? as_type<float>(_955) : 0.0;
    int _1051 = ~_1023;
    float _1053 = (_1051 != 0) ? as_type<float>(_957) : 0.0;
    int _1055 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 16;
    bool _1057 = _1055 != 0;
    bool _1059 = !_1041;
    float _1061 = _1059 ? _989 : 0.0;
    bool _1063 = !_1041;
    float _1065 = _1063 ? _995 : 0.0;
    int _1067 = ~_987;
    float _1069 = (_1067 != 0) ? as_type<float>(_959) : 0.0;
    bool _1071 = !_1057;
    float _1073 = _1065 * _1011;
    bool _1075 = !_1057;
    float _1077 = _1065 * _1069;
    bool _1079 = !_1071;
    float _1081 = _1079 ? 1.0 : (*spvDescriptorSet0.fp_c3)._m0[23].y;
    float _1083 = fma(_1049, _1061, _1073);
    bool _1085 = !_1075;
    float _1087 = _1085 ? 1.0 : (*spvDescriptorSet0.fp_c3)._m0[23].x;
    float _1089 = fma(_1053, _1061, _1077);
    int _1091 = ~_1023;
    float _1093 = (_1091 != 0) ? as_type<float>(_961) : 0.0;
    float _1095 = _1081 * _1083;
    bool _1097 = !_1057;
    float _1099 = _1087 * _1089;
    float _1101 = _1065 * _1031;
    float _1103 = _1045 * (*spvDescriptorSet0.fp_c3)._m0[3].w;
    bool _1105 = !_1097;
    float _1107 = _1105 ? 1.0 : (*spvDescriptorSet0.fp_c3)._m0[23].z;
    float _1109 = _1045 * (*spvDescriptorSet0.fp_c3)._m0[3].z;
    float _1111 = fma(_1093, _1061, _1101);
    float _1113 = _1095 * 0.715200006961822509765625;
    int _1115 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 512;
    bool _1117 = _1115 != 0;
    float _1119 = exp2(_1103);
    float _1121 = _1107 * _1111;
    float _1123 = fma(_1099, 0.2125999927520751953125, _1113);
    float _1125 = -_697;
    float _1127 = _1125 + 1.0;
    bool _1129 = !_1117;
    float _1131 = fma(_1121, 0.072200000286102294921875, _1123);
    float _1133 = exp2(_1109);
    bool _1135 = !_1117;
    float _1137 = -_1099;
    float _1139 = _1137 + _1131;
    float _1141 = -_1095;
    float _1143 = _1141 + _1131;
    bool _1145 = !_1117;
    float _1147 = -_1121;
    float _1149 = _1147 + _1131;
    float _1151 = fma(_1003, _1139, _1099);
    float _1153 = fma(_1003, _1143, _1095);
    bool _1155 = !_86;
    float _1157 = _1155 ? _1119 : 1.0;
    float _1159 = fma(_1003, _1149, _1121);
    float _1161 = _977 * _1127;
    float _1163 = _1129 ? _997 : 0.0;
    float _1165 = _873 * _1157;
    float _1167 = _1157 * _1151;
    float _1169 = _1157 * _1153;
    float _1171 = _1161 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _1173 = _1135 ? _999 : 0.0;
    bool _1175 = !_86;
    float _1177 = _1175 ? _1133 : 1.0;
    float _1179 = _1145 ? _1001 : 0.0;
    float _1181 = _90 ? _1165 : _1167;
    float _1183 = _1177 * _1163;
    float _1185 = _1177 * _1173;
    float _1187 = _1177 * _1179;
    float _1189 = _1181 * (*spvDescriptorSet0.fp_c3)._m0[28].x;
    float _1191 = _90 ? _1165 : _1169;
    float _1193 = _1165;
    float _1195 = _1183;
    float _1197 = _1157;
    int _1199 = as_type<int>(_1189);
    float _1201 = _1033;
    if (!_90)
    {
        float _1203 = _1157 * _1159;
        _1193 = _1203;
    }
    float _1205 = _1193;
    float _1207 = fma(_1183, (*spvDescriptorSet0.fp_c3)._m0[27].x, _1189);
    if (_86)
    {
        _1195 = 0.0;
    }
    float _1209 = _1195;
    float _1211 = _1191 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    float _1213 = _1205 * (*spvDescriptorSet0.fp_c3)._m0[28].z;
    float _1215 = fma(_1185, (*spvDescriptorSet0.fp_c3)._m0[27].y, _1211);
    float _1217 = fma(_1187, (*spvDescriptorSet0.fp_c3)._m0[27].z, _1213);
    float _1219 = _1211;
    float _1221 = _1213;
    float _1223 = _1209;
    if (_86)
    {
        _879 = 0.0;
    }
    float _1225 = _879;
    bool _1227 = !_86;
    float _1229 = _1227 ? _1033 : 0.0;
    float _1231 = _1225;
    if (_86)
    {
        _1197 = 0.0;
    }
    float _1233 = _1197;
    float _1235 = _1233;
    if (_86)
    {
        _1199 = as_type<int>(_1171);
    }
    int _1237 = _1199;
    int _1239 = _1237;
    int _1241 = _1237;
    if (_86)
    {
        _1219 = _1207;
    }
    float _1243 = _1219;
    float _1245 = _1243;
    float _1247 = _1243;
    if (_86)
    {
        _1221 = _1215;
    }
    float _1249 = _1221;
    float _1251 = _1249;
    float _1253 = _1249;
    if (_86)
    {
        _1201 = _1217;
    }
    float _1255 = _1201;
    float _1257 = _1255;
    float _1259 = _1255;
    if (!_86)
    {
        int _1261 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 4;
        bool _1263 = _1261 != 0;
        float _1265 = _727 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        int _1267 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 5;
        bool _1269 = _1267 != 0;
        float _1271 = _725 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _1273 = _729 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        bool _1275 = !_1269;
        float _1277 = _1275 ? _1271 : 0.0;
        bool _1279 = !_1269;
        float _1281 = _1279 ? _1265 : 0.0;
        bool _1283 = !_1269;
        float _1285 = _1283 ? _1273 : 0.0;
        float _1287 = _1229 * _1277;
        _1223 = _1287;
        if (!_1263)
        {
            _1239 = as_type<int>(_1171);
        }
        int _1289 = _1239;
        float _1291 = _1229 * _1281;
        _1231 = _1291;
        _1241 = _1289;
        if (!_1263)
        {
            _1245 = _1207;
        }
        float _1293 = _1245;
        float _1295 = _1229 * _1285;
        _1247 = _1293;
        _1235 = _1295;
        if (!_1263)
        {
            _1251 = _1215;
        }
        float _1297 = _1251;
        _1253 = _1297;
        if (!_1263)
        {
            _1257 = _1217;
        }
        float _1299 = _1257;
        bool _1301 = !_1263;
        _1259 = _1299;
        if (!_1301)
        {
            float _1303 = -_1229;
            float _1305 = _1303 + 1.0;
            float _1307 = precise::clamp(_1305, 0.0, 1.0);
            float _1309 = _1307 * _1171;
            float _1311 = precise::max(_1309, 9.9999997473787516355514526367188e-05);
            float _1313 = 1.0 / _1311;
            float _1315 = _1313 * _1171;
            float _1317 = _1207 * _1315;
            float _1319 = _1215 * _1315;
            float _1321 = _1217 * _1315;
            _1253 = _1319;
            _1231 = 0.0;
            _1241 = as_type<int>(_1309);
            _1247 = _1317;
            _1223 = 0.0;
            _1259 = _1321;
            _1235 = 0.0;
        }
    }
    float _1323 = _1253;
    float _1325 = _1231;
    int _1327 = _1241;
    float _1329 = _1247;
    float _1331 = _1223;
    float _1333 = _1259;
    float _1335 = _1235;
    int _1337 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 2048;
    bool _1339 = _1337 != 0;
    int _1341 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 16384;
    bool _1343 = _1341 != 0;
    float _1345 = _719 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _1347 = _1323 + _1325;
    float _1349 = _717 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _1351 = _721 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    bool _1353 = !_1343;
    float _1355 = _1353 ? as_type<float>(_1327) : 1.0;
    float _1357 = _1329 + _1331;
    float _1359 = _1333 + _1335;
    float _1361 = -_1355;
    float _1363 = _1361 + 1.0;
    float _1365 = abs(_1363);
    float _1367 = log2(_1365);
    float _1369 = _1367 * (*spvDescriptorSet0.fp_c3)._m0[29].z;
    float _1371 = exp2(_1369);
    float _1373 = -_1371;
    float _1375 = spvFAdd(_1373, 1.00010001659393310546875);
    float _1377 = -_1371;
    float _1379 = _1377 + 1.0;
    float _1381 = -_1355;
    float _1383 = _1381 + _1379;
    float _1385 = 1.0 / _1375;
    float _1387 = _1345 * _1383;
    float _1389 = _1349 * _1383;
    float _1391 = _1351 * _1383;
    float _1393 = fma(_1347, _1355, _1387);
    float _1395 = fma(_1357, _1355, _1389);
    float _1397 = fma(_1359, _1355, _1391);
    float _1399 = _1385 * _1393;
    float _1401 = _1385 * _1395;
    float _1403 = _1385 * _1397;
    float _1405 = _1399 * 0.715200006961822509765625;
    float _1407 = fma(_1401, 0.2125999927520751953125, _1405);
    float _1409 = fma(_1403, 0.072200000286102294921875, _1407);
    float _1411 = 1.0 / _1409;
    float _1413 = _1411 * (*spvDescriptorSet0.fp_c3)._m0[21].z;
    float _1415 = precise::clamp(_1413, 0.0, 1.0);
    float _1417 = fma(_1415, (*spvDescriptorSet0.fp_c3)._m0[21].y, (*spvDescriptorSet0.fp_c3)._m0[21].x);
    float _1419 = _1401 * _1417;
    float _1421 = _1399 * _1417;
    float _1423 = _1403 * _1417;
    bool _1425 = !_1339;
    float _1427 = _1419;
    float _1429 = _1411;
    float _1431 = _1421;
    int _1433 = as_type<int>(_1403);
    int _1435 = as_type<int>(_1421);
    float _1437 = _1419;
    float _1439 = _1411;
    if (!_1425)
    {
        bool _1441 = _1379 != 1.0;
        bool _1443 = isnan(_1379);
        bool _1445 = _1441 || _1443;
        bool _1447 = isnan(1.0);
        bool _1449 = _1445 || _1447;
        float _1451 = -_1371;
        bool _1453 = _1451 != (-1.0);
        bool _1455 = isnan(_1451);
        bool _1457 = _1453 || _1455;
        bool _1459 = isnan(-1.0);
        bool _1461 = _1457 || _1459;
        float _1463 = -_1371;
        bool _1465 = _1463 == (-1.0);
        bool _1467 = !_1449;
        bool _1469 = _1465 || _1467;
        bool _1471 = _1379 == 1.0;
        bool _1473 = _1471 && _1461;
        bool _1475 = !_1469;
        float _1477 = _1475 ? _1379 : 0.0;
        bool _1479 = !_1473;
        float _1481 = _1479 ? 0.0 : 1.0;
        float _1483 = _1469 ? 0.0 : 0.5;
        float _1485 = _1477 * 0.715200006961822509765625;
        float _1487 = fma(_1481, 0.2125999927520751953125, _1485);
        float _1489 = fma(_1483, 0.072200000286102294921875, _1487);
        float _1491 = 1.0 / _1489;
        float _1493 = _1491 * (*spvDescriptorSet0.fp_c3)._m0[21].z;
        float _1495 = precise::clamp(_1493, 0.0, 1.0);
        float _1497 = fma(_1495, (*spvDescriptorSet0.fp_c3)._m0[21].y, (*spvDescriptorSet0.fp_c3)._m0[21].x);
        float _1499 = _1481 * _1497;
        float _1501 = _1477 * _1497;
        float _1503 = _1483 * _1497;
        out.m_46.x = _1499;
        out.m_46.y = _1501;
        out.m_46.z = _1503;
        out.m_46.w = 1.0;
        return out;
    }
    bool _1505 = _104 != 0;
    bool _1507 = !_1505;
    if (!_1507)
    {
        if (_94)
        {
            _1427 = 0.0;
        }
        float _1509 = _1427;
        float _1511 = _1509;
        if (_94)
        {
            _1429 = 0.0;
        }
        float _1513 = _1429;
        float _1515 = _1513;
        if (!_94)
        {
            float _1517 = _1049 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
            _1515 = _1517;
        }
        float _1519 = _1515;
        float _1521 = _1519;
        if (!_94)
        {
            float _1523 = _1053 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
            _1511 = _1523;
        }
        float _1525 = _1511;
        float _1527 = _1525;
        if (!_98)
        {
            float _1529 = fma(_1011, (*spvDescriptorSet0.fp_c3)._m0[1].y, _1519);
            _1521 = _1529;
        }
        float _1531 = _1521;
        if (_94)
        {
            _1431 = 0.0;
        }
        float _1533 = _1431;
        float _1535 = _1533;
        if (!_94)
        {
            float _1537 = _1093 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
            _1535 = _1537;
        }
        float _1539 = _1535;
        float _1541 = _1531 * 0.715200006961822509765625;
        float _1543 = _1539;
        if (!_98)
        {
            float _1545 = fma(_1069, (*spvDescriptorSet0.fp_c3)._m0[1].y, _1525);
            _1527 = _1545;
        }
        float _1547 = _1527;
        if (!_98)
        {
            float _1549 = fma(_1031, (*spvDescriptorSet0.fp_c3)._m0[1].y, _1539);
            _1543 = _1549;
        }
        float _1551 = _1543;
        float _1553 = fma(_1547, 0.2125999927520751953125, _1541);
        float _1555 = fma(_1551, 0.072200000286102294921875, _1553);
        float _1557 = 1.0 / _1555;
        float _1559 = _1557 * (*spvDescriptorSet0.fp_c3)._m0[21].z;
        float _1561 = precise::clamp(_1559, 0.0, 1.0);
        float _1563 = fma(_1561, (*spvDescriptorSet0.fp_c3)._m0[21].y, (*spvDescriptorSet0.fp_c3)._m0[21].x);
        float _1565 = _1563 * _1547;
        float _1567 = _1563 * _1531;
        float _1569 = _1563 * _1551;
        out.m_46.x = _1565;
        out.m_46.y = _1567;
        out.m_46.z = _1569;
        out.m_46.w = 1.0;
        return out;
    }
    if (!_102)
    {
        _1433 = as_type<int>(_1421);
    }
    int _1571 = _1433;
    if (!_102)
    {
        _1435 = as_type<int>(_1423);
    }
    int _1573 = _1435;
    float _1575 = as_type<float>(_1573);
    if (!_102)
    {
        out.m_46.x = _1419;
        out.m_46.y = as_type<float>(_1571);
        out.m_46.z = as_type<float>(_1573);
        out.m_46.w = _1379;
        return out;
    }
    if (_94)
    {
        _1437 = 0.0;
    }
    float _1577 = _1437;
    float _1579 = _1577;
    if (_94)
    {
        _1439 = 0.0;
    }
    float _1581 = _1439;
    float _1583 = _1581;
    if (!_94)
    {
        float _1585 = _1049 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
        _1583 = _1585;
    }
    float _1587 = _1583;
    float _1589 = _1587;
    if (!_94)
    {
        float _1591 = _1053 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
        _1579 = _1591;
    }
    float _1593 = _1579;
    float _1595 = _1593;
    if (!_98)
    {
        float _1597 = fma(_1011, (*spvDescriptorSet0.fp_c3)._m0[1].y, _1587);
        _1589 = _1597;
    }
    float _1599 = _1589;
    if (_94)
    {
        _1575 = 0.0;
    }
    float _1601 = _1575;
    float _1603 = _1601;
    if (!_94)
    {
        float _1605 = _1093 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
        _1603 = _1605;
    }
    float _1607 = _1603;
    float _1609 = _1599 * 0.715200006961822509765625;
    float _1611 = _1607;
    if (!_98)
    {
        float _1613 = fma(_1069, (*spvDescriptorSet0.fp_c3)._m0[1].y, _1593);
        _1595 = _1613;
    }
    float _1615 = _1595;
    if (!_98)
    {
        float _1617 = fma(_1031, (*spvDescriptorSet0.fp_c3)._m0[1].y, _1607);
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
    out.m_46.x = _1633;
    out.m_46.y = _1635;
    out.m_46.z = _1637;
    out.m_46.w = 1.0;
    return out;
}


struct main0_out_u
{
    uint4 m_46 [[color(0)]];
};

fragment main0_out_u main0_u(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    bool _905 = false;
    bool _272 = false;
    float _58 = gl_FragCoord.w;
    float _60 = in.m_43.y;
    float _62 = gl_FragCoord.w;
    float _64 = _60 * _62;
    float _66 = in.m_43.x;
    float _68 = gl_FragCoord.w;
    float _70 = _66 * _68;
    float _72 = in.m_43.z;
    float _74 = gl_FragCoord.w;
    float _76 = _72 * _74;
    int _78 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 4096;
    bool _82 = _78 != 0;
    int _84 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 1;
    bool _86 = _84 != 0;
    int _88 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 8;
    bool _90 = _88 != 0;
    int _92 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 32;
    bool _94 = _92 != 0;
    int _96 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 64;
    bool _98 = _96 != 0;
    int _100 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 8192;
    bool _102 = _100 != 0;
    int _104 = int(_82);
    float _106 = 1.0 / _58;
    float _108 = _106 * _64;
    float _110 = _106 * _70;
    float _112 = _106 * _76;
    float _114 = _108 * _108;
    float _116 = fma(_110, _110, _114);
    float _118 = (*spvDescriptorSet0.fp_c3)._m0[13].w + (-220.0);
    float _120 = fma(_112, _112, _116);
    float _122 = precise::max(0.0, _118);
    float _124 = rsqrt(_120);
    float _126 = _110 * _124;
    float _128 = _112 * _124;
    float _130 = _108 * _124;
    float _132 = _126 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    float _134 = _128 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    float _136 = -_130;
    float _138 = -_122;
    float _140 = fma(_136, (*spvDescriptorSet0.fp_c3)._m0[13].z, _138);
    float _142 = _132 * _132;
    float _144 = _134 * _134;
    float _146 = _142 + _144;
    float _148 = sqrt(_146);
    bool _150 = _148 > (*spvDescriptorSet0.fp_c3)._m0[13].x;
    float _152 = _124;
    float _154 = _122;
    float _156 = _140;
    float _158 = _132;
    float _160 = _134;
    if (!_150)
    {
        _152 = _144;
    }
    float _162 = _152;
    float _164 = _162;
    if (!_150)
    {
        _154 = _142;
    }
    float _166 = _154;
    bool _168 = !_150;
    float _170 = _166;
    if (!_168)
    {
        float _172 = 1.0 / (*spvDescriptorSet0.fp_c3)._m0[13].y;
        float _174 = -(*spvDescriptorSet0.fp_c3)._m0[13].x;
        float _176 = _148 + _174;
        float _178 = _140 + (*spvDescriptorSet0.fp_c3)._m0[13].y;
        float _180 = rsqrt(_146);
        float _182 = _176 * _172;
        float _184 = _182 * 0.15915493667125701904296875;
        float _186 = _184 * 6.283185482025146484375;
        float _188 = sin(_186);
        float _190 = _184 * 6.283185482025146484375;
        float _192 = cos(_190);
        float _194 = fma(_188, _178, (*spvDescriptorSet0.fp_c3)._m0[13].x);
        float _196 = _180 * _194;
        float _198 = _192 + (-1.0);
        float _200 = _132 * _196;
        float _202 = _134 * _196;
        float _204 = _198 * (*spvDescriptorSet0.fp_c3)._m0[13].y;
        float _206 = _202 * _202;
        float _208 = fma(_140, _192, _204);
        float _210 = _200 * _200;
        _156 = _208;
        _170 = _210;
        _164 = _206;
        _158 = _200;
        _160 = _202;
    }
    float _212 = _156;
    float _214 = _170;
    float _216 = _164;
    float _218 = _158;
    float _220 = _160;
    float _222 = fma(_212, _212, _214);
    float _224 = _222 + _216;
    float _226 = rsqrt(_224);
    float _228 = _226 * _212;
    float _230 = -_228;
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
    float _270;
    if (!_250)
    {
        int _252 = 0;
        int _254 = 0;
        int _256 = as_type<int>(_238);
        int _258 = 1200;
        int _260;
        int _262;
        int _264;
        int _266;
        int _268;
        _54(_252, _254, _256, _258, _260, _262, _264, _266, _268);
        _270 = as_type<float>(_260);
        _272 = true;
    }
    else
    {
        float _274 = rsqrt(_238);
        float _276 = _238 * _274;
        float _278 = _274 * 0.5;
        float _280 = -_276;
        float _282 = 0.0 + _280;
        float _284 = fma(_278, _282, 0.5);
        float _286 = fma(_276, _284, _276);
        float _288 = -_286;
        float _290 = 0.0 + _288;
        float _292 = fma(_286, _290, _238);
        float _294 = fma(_278, _292, _286);
        _270 = _294;
    }
    _272 = false;
    float _296 = _270;
    bool _298 = _228 > 0.0;
    float _300 = _128 * _128;
    float _302 = _126 * _126;
    float _304 = _300 + _302;
    if (_298)
    {
        discard_fragment();
    }
    float _306 = rsqrt(_304);
    float _308 = _248 * _296;
    float _310 = _308 * 0.636619746685028076171875;
    float _312 = precise::clamp(_310, 0.0, 1.0);
    float _314 = -_312;
    float _316 = _314 + 1.0;
    float _318 = sqrt(_316);
    float _320 = _128 * _306;
    float _322 = _126 * _306;
    float _324 = abs(_320);
    float _326 = abs(_322);
    float _328 = precise::max(_324, _326);
    float _330 = precise::max(_328, 9.9999997473787516355514526367188e-05);
    float _332 = -_318;
    float _334 = _332 + 1.0;
    float _336 = 1.0 / _330;
    float _338 = _334 * 0.5;
    float _340 = -_336;
    float _342 = _320 * _340;
    float _344 = _322 * _336;
    float _346 = fma(_342, _338, 0.5);
    float _348 = fma(_344, _338, 0.5);
    if (_298)
    {
        out.m_46.x = 0.0;
        out.m_46.y = 0.0;
        out.m_46.z = 0.0;
        out.m_46.w = 0.0;
        return main0_out_u{as_type<uint4>(out.m_46)};
    }
    float2 _2051;
    _2051.x = spvDescriptorSet0.fp_t_tcb_8.calculate_clamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_346, _348));
    _2051.y = spvDescriptorSet0.fp_t_tcb_8.calculate_unclamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_346, _348));
    float _350 = _2051.x;
    float _352 = _350 * 256.0;
    int _354 = int(_352);
    float _356 = _226 * _218;
    float _358 = _226 * _220;
    int _360 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 2;
    bool _362 = _360 != 0;
    float _364 = _356 * (*spvDescriptorSet0.fp_c3)._m0[11].x;
    int _366 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 1024;
    bool _368 = _366 != 0;
    float _370 = fma(_300, 3.0, -1.0);
    float _372 = -_130;
    float _374 = _372 + 1.0;
    float _376 = precise::clamp(_374, 0.0, 1.0);
    float _378 = -_130;
    float _380 = fma(_378, _130, 1.0);
    float _382 = precise::clamp(_380, 0.0, 1.0);
    float _384 = -_364;
    float _386 = fma(_228, (*spvDescriptorSet0.fp_c3)._m0[11].y, _384);
    float _388 = _126 * _126;
    float _390 = -_358;
    float _392 = fma(_390, (*spvDescriptorSet0.fp_c3)._m0[11].z, _386);
    float _394 = 0.88622701168060302734375 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
    float _396 = _376;
    if (_362)
    {
        float _398 = sqrt(_382);
        _396 = _398;
    }
    float _400 = _396;
    float _402 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].x;
    float _404 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
    float _406 = 0.88622701168060302734375 * (*spvDescriptorSet0.fp_c3)._m0[4].x;
    float _408 = 0.88622701168060302734375 * (*spvDescriptorSet0.fp_c3)._m0[4].z;
    float _410 = fma(_130, _402, _394);
    float _412 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _414 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[4].w;
    float _416 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
    float _418 = -_128;
    float _420 = fma(_418, _404, _410);
    float _422 = fma(_128, _404, _410);
    float _424 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
    float _426 = fma(_130, _412, _408);
    float _428 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].z;
    float _430 = fma(_130, _414, _406);
    float _432 = -_126;
    float _434 = fma(_432, _424, _420);
    float _436 = abs(_400);
    float _438 = log2(_436);
    float _440 = fma(_126, _424, _422);
    float _442 = _128 * (-3.0);
    float _444 = -_128;
    float _446 = fma(_444, _428, _430);
    float _448 = fma(_128, _428, _430);
    float _450 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].w;
    float _452 = -_128;
    float _454 = fma(_452, _416, _426);
    float _456 = fma(_128, _416, _426);
    float _458 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
    float _460 = -_128;
    float _462 = fma(_460, _442, -1.0);
    float _464 = -_126;
    float _466 = fma(_464, _450, _454);
    float _468 = fma(_126, _450, _456);
    float _470 = _126 * _128;
    float _472 = -_130;
    float _474 = _126 * _472;
    float _476 = _126 * _130;
    float _478 = -_126;
    float _480 = fma(_478, _458, _446);
    float _482 = _438 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _484 = fma(_126, _458, _448);
    float _486 = -_130;
    float _488 = fma(_486, _130, _388);
    float _490 = exp2(_482);
    float _492 = -_128;
    float _494 = _130 * _492;
    float _496 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].x;
    float _498 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
    float _500 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].z;
    float _502 = _130 * _128;
    float _504 = fma(_496, _474, _480);
    float _506 = fma(_496, _476, _484);
    float _508 = fma(_498, _474, _434);
    float _510 = fma(_498, _476, _440);
    float _512 = fma(_500, _474, _466);
    float _514 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].x;
    float _516 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].w;
    float _518 = fma(_500, _476, _468);
    float _520 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
    float _522 = _490 * (*spvDescriptorSet0.fp_c3)._m0[3].x;
    float _524 = fma(_514, _494, _508);
    float _526 = fma(_516, _502, _506);
    float _528 = fma(_514, _502, _510);
    float _530 = fma(_522, (*spvDescriptorSet0.fp_c3)._m0[12].x, (*spvDescriptorSet0.fp_c3)._m0[12].y);
    float _532 = precise::clamp(_530, 0.0, 1.0);
    float _534 = fma(_520, _502, _518);
    float _536 = fma(_516, _494, _504);
    float _538 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].z;
    float _540 = -_532;
    float _542 = _540 + 1.0;
    float _544 = fma(_520, _494, _512);
    float _546 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].w;
    float _548 = fma(_538, _470, _536);
    float _550 = abs(_542);
    float _552 = log2(_550);
    float _554 = fma(_392, 0.5, 0.5);
    float _556 = fma(_392, -0.5, 0.5);
    float _558 = fma(_546, _470, _524);
    float _560 = fma(_546, _470, _528);
    float _562 = fma(_538, _470, _526);
    float _564 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[9].x;
    float _566 = 0.2477079927921295166015625 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
    float _568 = sqrt(_556);
    float _570 = fma(_564, _470, _544);
    float _572 = fma(_564, _470, _534);
    float _574 = fma(_554, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _576 = in.m_48.x;
    float _578 = gl_FragCoord.w;
    float _580 = _576 * _578;
    float _582 = in.m_48.y;
    float _584 = gl_FragCoord.w;
    float _586 = _582 * _584;
    float _588 = fma(_566, _462, _548);
    float _590 = _552 * (*spvDescriptorSet0.fp_c3)._m0[11].w;
    float _592 = fma(_566, _370, _562);
    float _594 = 0.2477079927921295166015625 * (*spvDescriptorSet0.fp_c3)._m0[9].z;
    float _596 = 0.2477079927921295166015625 * (*spvDescriptorSet0.fp_c3)._m0[9].w;
    float _598 = fma(_554, _574, -0.212114393711090087890625);
    float _600 = exp2(_590);
    float _602 = fma(_594, _462, _558);
    float _604 = fma(_594, _370, _560);
    float _606 = fma(_554, _598, 1.570728778839111328125);
    float _608 = fma(_596, _462, _570);
    float _610 = _228 + 1.0;
    float _612 = fma(_596, _370, _572);
    float _614 = _568 * 0.636619746685028076171875;
    float _616 = 0.429042994976043701171875 * (*spvDescriptorSet0.fp_c3)._m0[10].x;
    float _618 = 0.429042994976043701171875 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
    float _620 = -_606;
    float _622 = fma(_614, _620, 1.0);
    float _624 = fma(_616, _488, _588);
    float _626 = fma(_616, _488, _592);
    float _628 = 0.429042994976043701171875 * (*spvDescriptorSet0.fp_c3)._m0[10].z;
    float _630 = -_228;
    float _632 = fma(_600, _610, _630);
    float _634 = fma(_618, _488, _602);
    float _636 = fma(_618, _488, _604);
    float _638 = fma(_628, _488, _608);
    float _640 = fma(_628, _488, _612);
    float _642 = fma(_632, 0.5, 0.5);
    float _644 = fma(_228, -0.5, 0.5);
    float _646 = _106 * _580;
    float _648 = _106 * _586;
    float _650 = float(uint(_354));
    float _652 = _650 * 0.00390625;
    float2 _2541 = float2(_346, _348);
    float4 _655 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2541, float2(0.0), isnan(_2541)), level(_652)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2541, float2(0.0), isnan(_2541)), level(_652)).xyzw;
    float _657 = _655.x;
    float _659 = _655.y;
    float _661 = _655.z;
    float _663 = _655.w;
    float2 _2560 = float2(_346, _348);
    float2 _667 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_2560, float2(0.0), isnan(_2560)), level(_652)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_2560, float2(0.0), isnan(_2560)), level(_652)).xy;
    float _669 = _667.x;
    float _671 = _667.y;
    float2 _2573 = float2(_346, _348);
    float4 _673 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_2573, float2(0.0), isnan(_2573)), level(_652)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_2573, float2(0.0), isnan(_2573)), level(_652)).xyzw;
    float _675 = _673.x;
    float _677 = _673.y;
    float _679 = _673.z;
    float _681 = _673.w;
    float2 _2590 = float2(_346, _348);
    float2 _683 = dm_bs(spvDescriptorSet0.fp_t_tcb_12.sample(spvDescriptorSet0.fp_t_tcb_12Smplr, select(_2590, float2(0.0), isnan(_2590)), level(_652)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_12, spvDescriptorSet0.fp_t_tcb_12Smplr_w, select(_2590, float2(0.0), isnan(_2590)), level(_652)).xy;
    float _685 = _683.x;
    float _687 = _683.y;
    float2 _2603 = float2(_646, _648);
    float3 _691 = dm_bs(spvDescriptorSet0.fp_t_tcb_14.sample(spvDescriptorSet0.fp_t_tcb_14Smplr, select(_2603, float2(0.0), isnan(_2603))), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_14, spvDescriptorSet0.fp_t_tcb_14Smplr_w, select(_2603, float2(0.0), isnan(_2603))).xyz;
    float _693 = _691.x;
    float _695 = _691.y;
    float _697 = _691.z;
    float2 _2617 = float2(_346, _348);
    float2 _699 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_2617, float2(0.0), isnan(_2617)), level(_652)), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_2617, float2(0.0), isnan(_2617)), level(_652)).xy;
    float _701 = _699.x;
    float _703 = _699.y;
    float2 _2630 = float2(_346, _348);
    float4 _705 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_2630, float2(0.0), isnan(_2630)), level(_652)), spvDescriptorSet0.dm_border, 6u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_2630, float2(0.0), isnan(_2630)), level(_652)).xyzw;
    float _707 = _705.x;
    float _709 = _705.y;
    float _711 = _705.z;
    float _713 = _705.w;
    float2 _2647 = float2(_622, _644);
    float3 _715 = dm_bs(spvDescriptorSet0.fp_t_tcb_16.sample(spvDescriptorSet0.fp_t_tcb_16Smplr, select(_2647, float2(0.0), isnan(_2647))), spvDescriptorSet0.dm_border, 7u, spvDescriptorSet0.fp_t_tcb_16, spvDescriptorSet0.fp_t_tcb_16Smplr_w, select(_2647, float2(0.0), isnan(_2647))).xyz;
    float _717 = _715.x;
    float _719 = _715.y;
    float _721 = _715.z;
    float2 _2661 = float2(_622, _642);
    float3 _723 = dm_bs(spvDescriptorSet0.fp_t_tcb_16.sample(spvDescriptorSet0.fp_t_tcb_16Smplr, select(_2661, float2(0.0), isnan(_2661))), spvDescriptorSet0.dm_border, 7u, spvDescriptorSet0.fp_t_tcb_16, spvDescriptorSet0.fp_t_tcb_16Smplr_w, select(_2661, float2(0.0), isnan(_2661))).xyz;
    float _725 = _723.x;
    float _727 = _723.y;
    float _729 = _723.z;
    int _731 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 256;
    bool _733 = _731 != 0;
    float _735 = _663 * _663;
    float _737 = _681 * _681;
    float _739 = _735 * _735;
    float _741 = _693 * _695;
    float _743 = _737 * _737;
    float _745 = _739 * 16.0;
    float _747 = _745 * _671;
    float _749 = _669 * _671;
    float _751 = _743 * 16.0;
    float _753 = _657 * _747;
    float _755 = _659 * _747;
    float _757 = _661 * _747;
    float _759 = -_671;
    float _761 = _759 + _687;
    float _763 = -_749;
    float _765 = fma(_685, _687, _763);
    float _767 = _751 * _687;
    float _769 = -(*spvDescriptorSet0.fp_c3)._m0[2].z;
    float _771 = _769 + 1.0;
    float _773 = fma(_761, (*spvDescriptorSet0.fp_c3)._m0[0].x, _671);
    float _775 = fma(_765, (*spvDescriptorSet0.fp_c3)._m0[0].x, _749);
    float _777 = -_755;
    float _779 = fma(_677, _767, _777);
    float _781 = -_753;
    float _783 = fma(_675, _767, _781);
    float _785 = -_757;
    float _787 = fma(_679, _767, _785);
    float _789 = precise::max(_773, 1.52587890625e-05);
    float _791 = fma(_779, (*spvDescriptorSet0.fp_c3)._m0[0].x, _755);
    float _793 = -(*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _795 = _793 + 1.0;
    float _797 = -_741;
    float _799 = _797 + 1.0;
    float _801 = fma(_783, (*spvDescriptorSet0.fp_c3)._m0[0].x, _753);
    float _803 = fma(_787, (*spvDescriptorSet0.fp_c3)._m0[0].x, _757);
    float _805 = 1.0 / _789;
    float _807 = fma(_799, _795, (*spvDescriptorSet0.fp_c3)._m0[2].y);
    float _809 = fma(_799, _771, (*spvDescriptorSet0.fp_c3)._m0[2].z);
    float _811 = -_773;
    float _813 = _811 + _703;
    float _815 = _713 * _713;
    float _817 = _701 * _809;
    float _819 = fma(_693, _813, _773);
    float _821 = _815 * _815;
    float _823 = precise::max(_819, 1.52587890625e-05);
    float _825 = _821 * 16.0;
    float _827 = _773 * _805;
    float _829 = _825 * _807;
    float _831 = 1.0 / _823;
    float _833 = _775 * _827;
    float _835 = _801 * _827;
    float _837 = _791 * _827;
    float _839 = _703 * _829;
    float _841 = -_833;
    float _843 = fma(_703, _817, _841);
    float _845 = _803 * _827;
    float _847 = _711 * _829;
    float _849 = -_835;
    float _851 = fma(_707, _839, _849);
    float _853 = fma(_693, _843, _833);
    float _855 = -_837;
    float _857 = fma(_709, _839, _855);
    float _859 = -_845;
    float _861 = fma(_703, _847, _859);
    float _863 = fma(_693, _851, _835);
    float _865 = fma(_693, _857, _837);
    float _867 = _853 * _831;
    float _869 = fma(_693, _861, _845);
    bool _871 = !_368;
    float _873 = _871 ? _867 : 0.0;
    bool _875 = !_733;
    int _877 = _733 ? (-1) : 0;
    float _879 = _873;
    int _893;
    int _895;
    int _897;
    int _899;
    int _901;
    int _903;
    if (!_875)
    {
        float _881 = _480 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _883 = _434 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _885 = _466 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _887 = _484 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _889 = _440 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _891 = _468 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        _893 = as_type<int>(_889);
        _895 = as_type<int>(_891);
        _897 = as_type<int>(_883);
        _899 = as_type<int>(_881);
        _901 = as_type<int>(_887);
        _903 = as_type<int>(_885);
        _905 = true;
    }
    else
    {
        int _907 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 128;
        bool _909 = _907 != 0;
        float _911 = _624 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _913 = _634 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _915 = _638 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _917 = _626 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _919 = _636 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _921 = _640 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        int _923 = as_type<int>(_911);
        int _925 = as_type<int>(_913);
        int _927 = as_type<int>(_915);
        int _929 = as_type<int>(_917);
        int _931 = as_type<int>(_919);
        _877 = _909 ? (-1) : 0;
        _895 = as_type<int>(_921);
        if (_909)
        {
            float _933 = _406 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
            _923 = as_type<int>(_933);
        }
        int _935 = _923;
        _899 = _935;
        if (_909)
        {
            float _937 = _394 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
            _925 = as_type<int>(_937);
        }
        int _939 = _925;
        _897 = _939;
        if (_909)
        {
            float _941 = _408 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
            _927 = as_type<int>(_941);
        }
        int _943 = _927;
        _903 = _943;
        if (_909)
        {
            _929 = _935;
        }
        int _945 = _929;
        _901 = _945;
        if (_909)
        {
            _931 = _939;
        }
        int _947 = _931;
        _893 = _947;
        if (_909)
        {
            _895 = _943;
        }
    }
    _905 = false;
    int _949 = _877;
    int _951 = _893;
    int _953 = _895;
    int _955 = _897;
    int _957 = _899;
    int _959 = _901;
    int _961 = _903;
    int _963 = 0;
    int _965 = _949;
    if (!_98)
    {
        int _967 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 4104;
        bool _969 = _967 != 0;
        _963 = _969 ? (-1) : 0;
    }
    int _971 = _963;
    float _973 = _552 * (*spvDescriptorSet0.fp_c3)._m0[12].z;
    if (_98)
    {
        _965 = -1;
    }
    int _975 = _965;
    float _977 = fma(_693, _813, _773);
    int _979 = _975;
    if (!_98)
    {
        int _981 = ~_971;
        bool _983 = !_102;
        int _985 = _981 & (_983 ? (-1) : 0);
        _979 = _985;
    }
    int _987 = _979;
    float _989 = _873 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
    bool _991 = _104 != 0;
    float _993 = exp2(_973);
    float _995 = _873 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _997 = _863 * _831;
    float _999 = _865 * _831;
    float _1001 = _869 * _831;
    float _1003 = _741 * (*spvDescriptorSet0.fp_c3)._m0[2].x;
    int _1005 = _987;
    if (_94)
    {
        _1005 = -1;
    }
    int _1007 = _1005;
    int _1009 = ~_987;
    float _1011 = (_1009 != 0) ? as_type<float>(_951) : 0.0;
    int _1013 = _1007;
    if (!_94)
    {
        bool _1015 = !_102;
        bool _1017 = _1015 && _90;
        bool _1019 = !_991;
        bool _1021 = _1017 && _1019;
        _1013 = _1021 ? (-1) : 0;
    }
    int _1023 = _1013;
    float _1025 = -_993;
    float _1027 = _1025 + 1.0;
    int _1029 = ~_987;
    float _1031 = (_1029 != 0) ? as_type<float>(_953) : 0.0;
    float _1033 = _1027 * (*spvDescriptorSet0.fp_c3)._m0[12].w;
    float _1035 = -_1033;
    float _1037 = _1035 + 1.0;
    bool _1039 = !_102;
    bool _1041 = _90 && _1039;
    float _1043 = abs(_1037);
    float _1045 = log2(_1043);
    int _1047 = ~_1023;
    float _1049 = (_1047 != 0) ? as_type<float>(_955) : 0.0;
    int _1051 = ~_1023;
    float _1053 = (_1051 != 0) ? as_type<float>(_957) : 0.0;
    int _1055 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 16;
    bool _1057 = _1055 != 0;
    bool _1059 = !_1041;
    float _1061 = _1059 ? _989 : 0.0;
    bool _1063 = !_1041;
    float _1065 = _1063 ? _995 : 0.0;
    int _1067 = ~_987;
    float _1069 = (_1067 != 0) ? as_type<float>(_959) : 0.0;
    bool _1071 = !_1057;
    float _1073 = _1065 * _1011;
    bool _1075 = !_1057;
    float _1077 = _1065 * _1069;
    bool _1079 = !_1071;
    float _1081 = _1079 ? 1.0 : (*spvDescriptorSet0.fp_c3)._m0[23].y;
    float _1083 = fma(_1049, _1061, _1073);
    bool _1085 = !_1075;
    float _1087 = _1085 ? 1.0 : (*spvDescriptorSet0.fp_c3)._m0[23].x;
    float _1089 = fma(_1053, _1061, _1077);
    int _1091 = ~_1023;
    float _1093 = (_1091 != 0) ? as_type<float>(_961) : 0.0;
    float _1095 = _1081 * _1083;
    bool _1097 = !_1057;
    float _1099 = _1087 * _1089;
    float _1101 = _1065 * _1031;
    float _1103 = _1045 * (*spvDescriptorSet0.fp_c3)._m0[3].w;
    bool _1105 = !_1097;
    float _1107 = _1105 ? 1.0 : (*spvDescriptorSet0.fp_c3)._m0[23].z;
    float _1109 = _1045 * (*spvDescriptorSet0.fp_c3)._m0[3].z;
    float _1111 = fma(_1093, _1061, _1101);
    float _1113 = _1095 * 0.715200006961822509765625;
    int _1115 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 512;
    bool _1117 = _1115 != 0;
    float _1119 = exp2(_1103);
    float _1121 = _1107 * _1111;
    float _1123 = fma(_1099, 0.2125999927520751953125, _1113);
    float _1125 = -_697;
    float _1127 = _1125 + 1.0;
    bool _1129 = !_1117;
    float _1131 = fma(_1121, 0.072200000286102294921875, _1123);
    float _1133 = exp2(_1109);
    bool _1135 = !_1117;
    float _1137 = -_1099;
    float _1139 = _1137 + _1131;
    float _1141 = -_1095;
    float _1143 = _1141 + _1131;
    bool _1145 = !_1117;
    float _1147 = -_1121;
    float _1149 = _1147 + _1131;
    float _1151 = fma(_1003, _1139, _1099);
    float _1153 = fma(_1003, _1143, _1095);
    bool _1155 = !_86;
    float _1157 = _1155 ? _1119 : 1.0;
    float _1159 = fma(_1003, _1149, _1121);
    float _1161 = _977 * _1127;
    float _1163 = _1129 ? _997 : 0.0;
    float _1165 = _873 * _1157;
    float _1167 = _1157 * _1151;
    float _1169 = _1157 * _1153;
    float _1171 = _1161 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _1173 = _1135 ? _999 : 0.0;
    bool _1175 = !_86;
    float _1177 = _1175 ? _1133 : 1.0;
    float _1179 = _1145 ? _1001 : 0.0;
    float _1181 = _90 ? _1165 : _1167;
    float _1183 = _1177 * _1163;
    float _1185 = _1177 * _1173;
    float _1187 = _1177 * _1179;
    float _1189 = _1181 * (*spvDescriptorSet0.fp_c3)._m0[28].x;
    float _1191 = _90 ? _1165 : _1169;
    float _1193 = _1165;
    float _1195 = _1183;
    float _1197 = _1157;
    int _1199 = as_type<int>(_1189);
    float _1201 = _1033;
    if (!_90)
    {
        float _1203 = _1157 * _1159;
        _1193 = _1203;
    }
    float _1205 = _1193;
    float _1207 = fma(_1183, (*spvDescriptorSet0.fp_c3)._m0[27].x, _1189);
    if (_86)
    {
        _1195 = 0.0;
    }
    float _1209 = _1195;
    float _1211 = _1191 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    float _1213 = _1205 * (*spvDescriptorSet0.fp_c3)._m0[28].z;
    float _1215 = fma(_1185, (*spvDescriptorSet0.fp_c3)._m0[27].y, _1211);
    float _1217 = fma(_1187, (*spvDescriptorSet0.fp_c3)._m0[27].z, _1213);
    float _1219 = _1211;
    float _1221 = _1213;
    float _1223 = _1209;
    if (_86)
    {
        _879 = 0.0;
    }
    float _1225 = _879;
    bool _1227 = !_86;
    float _1229 = _1227 ? _1033 : 0.0;
    float _1231 = _1225;
    if (_86)
    {
        _1197 = 0.0;
    }
    float _1233 = _1197;
    float _1235 = _1233;
    if (_86)
    {
        _1199 = as_type<int>(_1171);
    }
    int _1237 = _1199;
    int _1239 = _1237;
    int _1241 = _1237;
    if (_86)
    {
        _1219 = _1207;
    }
    float _1243 = _1219;
    float _1245 = _1243;
    float _1247 = _1243;
    if (_86)
    {
        _1221 = _1215;
    }
    float _1249 = _1221;
    float _1251 = _1249;
    float _1253 = _1249;
    if (_86)
    {
        _1201 = _1217;
    }
    float _1255 = _1201;
    float _1257 = _1255;
    float _1259 = _1255;
    if (!_86)
    {
        int _1261 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 4;
        bool _1263 = _1261 != 0;
        float _1265 = _727 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        int _1267 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 5;
        bool _1269 = _1267 != 0;
        float _1271 = _725 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _1273 = _729 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        bool _1275 = !_1269;
        float _1277 = _1275 ? _1271 : 0.0;
        bool _1279 = !_1269;
        float _1281 = _1279 ? _1265 : 0.0;
        bool _1283 = !_1269;
        float _1285 = _1283 ? _1273 : 0.0;
        float _1287 = _1229 * _1277;
        _1223 = _1287;
        if (!_1263)
        {
            _1239 = as_type<int>(_1171);
        }
        int _1289 = _1239;
        float _1291 = _1229 * _1281;
        _1231 = _1291;
        _1241 = _1289;
        if (!_1263)
        {
            _1245 = _1207;
        }
        float _1293 = _1245;
        float _1295 = _1229 * _1285;
        _1247 = _1293;
        _1235 = _1295;
        if (!_1263)
        {
            _1251 = _1215;
        }
        float _1297 = _1251;
        _1253 = _1297;
        if (!_1263)
        {
            _1257 = _1217;
        }
        float _1299 = _1257;
        bool _1301 = !_1263;
        _1259 = _1299;
        if (!_1301)
        {
            float _1303 = -_1229;
            float _1305 = _1303 + 1.0;
            float _1307 = precise::clamp(_1305, 0.0, 1.0);
            float _1309 = _1307 * _1171;
            float _1311 = precise::max(_1309, 9.9999997473787516355514526367188e-05);
            float _1313 = 1.0 / _1311;
            float _1315 = _1313 * _1171;
            float _1317 = _1207 * _1315;
            float _1319 = _1215 * _1315;
            float _1321 = _1217 * _1315;
            _1253 = _1319;
            _1231 = 0.0;
            _1241 = as_type<int>(_1309);
            _1247 = _1317;
            _1223 = 0.0;
            _1259 = _1321;
            _1235 = 0.0;
        }
    }
    float _1323 = _1253;
    float _1325 = _1231;
    int _1327 = _1241;
    float _1329 = _1247;
    float _1331 = _1223;
    float _1333 = _1259;
    float _1335 = _1235;
    int _1337 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 2048;
    bool _1339 = _1337 != 0;
    int _1341 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 16384;
    bool _1343 = _1341 != 0;
    float _1345 = _719 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _1347 = _1323 + _1325;
    float _1349 = _717 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _1351 = _721 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    bool _1353 = !_1343;
    float _1355 = _1353 ? as_type<float>(_1327) : 1.0;
    float _1357 = _1329 + _1331;
    float _1359 = _1333 + _1335;
    float _1361 = -_1355;
    float _1363 = _1361 + 1.0;
    float _1365 = abs(_1363);
    float _1367 = log2(_1365);
    float _1369 = _1367 * (*spvDescriptorSet0.fp_c3)._m0[29].z;
    float _1371 = exp2(_1369);
    float _1373 = -_1371;
    float _1375 = spvFAdd(_1373, 1.00010001659393310546875);
    float _1377 = -_1371;
    float _1379 = _1377 + 1.0;
    float _1381 = -_1355;
    float _1383 = _1381 + _1379;
    float _1385 = 1.0 / _1375;
    float _1387 = _1345 * _1383;
    float _1389 = _1349 * _1383;
    float _1391 = _1351 * _1383;
    float _1393 = fma(_1347, _1355, _1387);
    float _1395 = fma(_1357, _1355, _1389);
    float _1397 = fma(_1359, _1355, _1391);
    float _1399 = _1385 * _1393;
    float _1401 = _1385 * _1395;
    float _1403 = _1385 * _1397;
    float _1405 = _1399 * 0.715200006961822509765625;
    float _1407 = fma(_1401, 0.2125999927520751953125, _1405);
    float _1409 = fma(_1403, 0.072200000286102294921875, _1407);
    float _1411 = 1.0 / _1409;
    float _1413 = _1411 * (*spvDescriptorSet0.fp_c3)._m0[21].z;
    float _1415 = precise::clamp(_1413, 0.0, 1.0);
    float _1417 = fma(_1415, (*spvDescriptorSet0.fp_c3)._m0[21].y, (*spvDescriptorSet0.fp_c3)._m0[21].x);
    float _1419 = _1401 * _1417;
    float _1421 = _1399 * _1417;
    float _1423 = _1403 * _1417;
    bool _1425 = !_1339;
    float _1427 = _1419;
    float _1429 = _1411;
    float _1431 = _1421;
    int _1433 = as_type<int>(_1403);
    int _1435 = as_type<int>(_1421);
    float _1437 = _1419;
    float _1439 = _1411;
    if (!_1425)
    {
        bool _1441 = _1379 != 1.0;
        bool _1443 = isnan(_1379);
        bool _1445 = _1441 || _1443;
        bool _1447 = isnan(1.0);
        bool _1449 = _1445 || _1447;
        float _1451 = -_1371;
        bool _1453 = _1451 != (-1.0);
        bool _1455 = isnan(_1451);
        bool _1457 = _1453 || _1455;
        bool _1459 = isnan(-1.0);
        bool _1461 = _1457 || _1459;
        float _1463 = -_1371;
        bool _1465 = _1463 == (-1.0);
        bool _1467 = !_1449;
        bool _1469 = _1465 || _1467;
        bool _1471 = _1379 == 1.0;
        bool _1473 = _1471 && _1461;
        bool _1475 = !_1469;
        float _1477 = _1475 ? _1379 : 0.0;
        bool _1479 = !_1473;
        float _1481 = _1479 ? 0.0 : 1.0;
        float _1483 = _1469 ? 0.0 : 0.5;
        float _1485 = _1477 * 0.715200006961822509765625;
        float _1487 = fma(_1481, 0.2125999927520751953125, _1485);
        float _1489 = fma(_1483, 0.072200000286102294921875, _1487);
        float _1491 = 1.0 / _1489;
        float _1493 = _1491 * (*spvDescriptorSet0.fp_c3)._m0[21].z;
        float _1495 = precise::clamp(_1493, 0.0, 1.0);
        float _1497 = fma(_1495, (*spvDescriptorSet0.fp_c3)._m0[21].y, (*spvDescriptorSet0.fp_c3)._m0[21].x);
        float _1499 = _1481 * _1497;
        float _1501 = _1477 * _1497;
        float _1503 = _1483 * _1497;
        out.m_46.x = _1499;
        out.m_46.y = _1501;
        out.m_46.z = _1503;
        out.m_46.w = 1.0;
        return main0_out_u{as_type<uint4>(out.m_46)};
    }
    bool _1505 = _104 != 0;
    bool _1507 = !_1505;
    if (!_1507)
    {
        if (_94)
        {
            _1427 = 0.0;
        }
        float _1509 = _1427;
        float _1511 = _1509;
        if (_94)
        {
            _1429 = 0.0;
        }
        float _1513 = _1429;
        float _1515 = _1513;
        if (!_94)
        {
            float _1517 = _1049 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
            _1515 = _1517;
        }
        float _1519 = _1515;
        float _1521 = _1519;
        if (!_94)
        {
            float _1523 = _1053 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
            _1511 = _1523;
        }
        float _1525 = _1511;
        float _1527 = _1525;
        if (!_98)
        {
            float _1529 = fma(_1011, (*spvDescriptorSet0.fp_c3)._m0[1].y, _1519);
            _1521 = _1529;
        }
        float _1531 = _1521;
        if (_94)
        {
            _1431 = 0.0;
        }
        float _1533 = _1431;
        float _1535 = _1533;
        if (!_94)
        {
            float _1537 = _1093 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
            _1535 = _1537;
        }
        float _1539 = _1535;
        float _1541 = _1531 * 0.715200006961822509765625;
        float _1543 = _1539;
        if (!_98)
        {
            float _1545 = fma(_1069, (*spvDescriptorSet0.fp_c3)._m0[1].y, _1525);
            _1527 = _1545;
        }
        float _1547 = _1527;
        if (!_98)
        {
            float _1549 = fma(_1031, (*spvDescriptorSet0.fp_c3)._m0[1].y, _1539);
            _1543 = _1549;
        }
        float _1551 = _1543;
        float _1553 = fma(_1547, 0.2125999927520751953125, _1541);
        float _1555 = fma(_1551, 0.072200000286102294921875, _1553);
        float _1557 = 1.0 / _1555;
        float _1559 = _1557 * (*spvDescriptorSet0.fp_c3)._m0[21].z;
        float _1561 = precise::clamp(_1559, 0.0, 1.0);
        float _1563 = fma(_1561, (*spvDescriptorSet0.fp_c3)._m0[21].y, (*spvDescriptorSet0.fp_c3)._m0[21].x);
        float _1565 = _1563 * _1547;
        float _1567 = _1563 * _1531;
        float _1569 = _1563 * _1551;
        out.m_46.x = _1565;
        out.m_46.y = _1567;
        out.m_46.z = _1569;
        out.m_46.w = 1.0;
        return main0_out_u{as_type<uint4>(out.m_46)};
    }
    if (!_102)
    {
        _1433 = as_type<int>(_1421);
    }
    int _1571 = _1433;
    if (!_102)
    {
        _1435 = as_type<int>(_1423);
    }
    int _1573 = _1435;
    float _1575 = as_type<float>(_1573);
    if (!_102)
    {
        out.m_46.x = _1419;
        out.m_46.y = as_type<float>(_1571);
        out.m_46.z = as_type<float>(_1573);
        out.m_46.w = _1379;
        return main0_out_u{as_type<uint4>(out.m_46)};
    }
    if (_94)
    {
        _1437 = 0.0;
    }
    float _1577 = _1437;
    float _1579 = _1577;
    if (_94)
    {
        _1439 = 0.0;
    }
    float _1581 = _1439;
    float _1583 = _1581;
    if (!_94)
    {
        float _1585 = _1049 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
        _1583 = _1585;
    }
    float _1587 = _1583;
    float _1589 = _1587;
    if (!_94)
    {
        float _1591 = _1053 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
        _1579 = _1591;
    }
    float _1593 = _1579;
    float _1595 = _1593;
    if (!_98)
    {
        float _1597 = fma(_1011, (*spvDescriptorSet0.fp_c3)._m0[1].y, _1587);
        _1589 = _1597;
    }
    float _1599 = _1589;
    if (_94)
    {
        _1575 = 0.0;
    }
    float _1601 = _1575;
    float _1603 = _1601;
    if (!_94)
    {
        float _1605 = _1093 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
        _1603 = _1605;
    }
    float _1607 = _1603;
    float _1609 = _1599 * 0.715200006961822509765625;
    float _1611 = _1607;
    if (!_98)
    {
        float _1613 = fma(_1069, (*spvDescriptorSet0.fp_c3)._m0[1].y, _1593);
        _1595 = _1613;
    }
    float _1615 = _1595;
    if (!_98)
    {
        float _1617 = fma(_1031, (*spvDescriptorSet0.fp_c3)._m0[1].y, _1607);
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
    out.m_46.x = _1633;
    out.m_46.y = _1635;
    out.m_46.z = _1637;
    out.m_46.w = 1.0;
    return main0_out_u{as_type<uint4>(out.m_46)};
}

