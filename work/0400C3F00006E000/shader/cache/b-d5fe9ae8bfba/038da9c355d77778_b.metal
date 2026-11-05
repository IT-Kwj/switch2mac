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
    constant _16* fp_c3 [[id(0)]];
    constant _16* fp_c4 [[id(1)]];
    texture2d<float> fp_t_tcb_C [[id(2)]];
    sampler fp_t_tcb_CSmplr [[id(3)]];
    texture2d<float> fp_t_tcb_A [[id(4)]];
    sampler fp_t_tcb_ASmplr [[id(5)]];
    texture2d<float> fp_t_tcb_E [[id(6)]];
    sampler fp_t_tcb_ESmplr [[id(7)]];
    texturecube<float> fp_t_tcb_8 [[id(8)]];
    sampler fp_t_tcb_8Smplr [[id(9)]];
    sampler fp_t_tcb_CSmplr_w [[id(10)]];
    sampler fp_t_tcb_ASmplr_w [[id(11)]];
    sampler fp_t_tcb_ESmplr_w [[id(12)]];
    constant dm_border_t* dm_border [[id(13)]];
};

struct main0_out
{
    float4 m_43 [[color(0)]];
};

struct main0_in
{
    float4 m_40 [[user(locn0), center_no_perspective]];
    float4 m_38 [[user(locn1), center_no_perspective]];
};

static inline __attribute__((always_inline))
void _49(thread const int& _1186, thread const int& _1187, thread const int& _1188, thread const int& _1189, thread int& _1190, thread int& _1191, thread int& _1192, thread int& _1193, thread int& _1194, thread int& _1195)
{
    float _1198 = as_type<float>(_1186) + 0.0;
    bool _1200 = _1198 != 0.0;
    bool _1202 = isnan(_1198);
    bool _1204 = _1200 || _1202;
    bool _1206 = isnan(0.0);
    bool _1208 = _1204 || _1206;
    int _1210 = _1188;
    int _1212 = _1189;
    int _1214 = 0;
    int _1216 = _1208 ? (-1) : 0;
    if (!_1208)
    {
        float _1218 = as_type<float>(_1186) * 1.0;
        _1210 = as_type<int>(_1218);
    }
    int _1220 = _1210;
    bool _1222 = !_1208;
    int _1224 = _1220;
    int _1226 = _1220;
    if (!_1222)
    {
        float _1228 = as_type<float>(_1186) + 0.0;
        bool _1230 = _1228 >= 0.0;
        bool _1232 = isnan(_1228);
        bool _1234 = _1230 || _1232;
        bool _1236 = isnan(0.0);
        bool _1238 = _1234 || _1236;
        _1216 = _1238 ? (-1) : 0;
        if (!_1238)
        {
            _1224 = 2147483647;
        }
        int _1240 = _1224;
        bool _1242 = !_1238;
        int _1244 = _1240;
        _1226 = _1240;
        if (!_1242)
        {
            float _1246 = abs(as_type<float>(_1186));
            float _1248 = _1246 + 0.0;
            bool _1250 = _1248 > as_type<float>(0x7f800000u /* inf */);
            bool _1252 = isnan(_1248);
            bool _1254 = _1250 || _1252;
            bool _1256 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _1258 = _1254 || _1256;
            _1214 = 2139095040;
            _1216 = _1258 ? (-1) : 0;
            if (_1258)
            {
                float _1260 = as_type<float>(_1186) + 1.0;
                _1244 = as_type<int>(_1260);
            }
            int _1262 = _1244;
            int _1264 = _1262;
            _1226 = _1262;
            if (!_1258)
            {
                float _1266 = abs(as_type<float>(_1186));
                float _1268 = _1266 + (-0.0);
                float _1270 = 0.0 + _1268;
                bool _1272 = _1270 != as_type<float>(0x7f800000u /* inf */);
                bool _1274 = isnan(_1270);
                bool _1276 = _1272 || _1274;
                bool _1278 = isnan(as_type<float>(0x7f800000u /* inf */));
                bool _1280 = _1276 || _1278;
                _1216 = _1280 ? (-1) : 0;
                if (!_1280)
                {
                    _1264 = _1186;
                }
                int _1282 = _1264;
                bool _1284 = !_1280;
                _1226 = _1282;
                if (!_1284)
                {
                    float _1286 = as_type<float>(_1186) * 18446744073709551616.0;
                    float _1288 = rsqrt(_1286);
                    float _1290 = _1286 * _1288;
                    float _1292 = _1288 * 0.5;
                    float _1294 = -_1290;
                    float _1296 = 0.0 + _1294;
                    float _1298 = fma(_1292, _1296, 0.5);
                    float _1300 = fma(_1290, _1298, _1290);
                    float _1302 = -_1300;
                    float _1304 = 0.0 + _1302;
                    float _1306 = fma(_1300, _1304, _1286);
                    float _1308 = fma(_1292, _1306, _1300);
                    float _1310 = _1308 * 2.3283064365386962890625e-10;
                    _1226 = as_type<int>(_1310);
                    _1212 = as_type<int>(_1300);
                    _1214 = as_type<int>(_1296);
                }
            }
        }
    }
    int _1312 = _1226;
    int _1314 = _1212;
    int _1316 = _1214;
    int _1318 = _1216;
    _1190 = _1187;
    _1191 = 0;
    _1192 = _1312;
    _1193 = _1314;
    _1194 = _1316;
    _1195 = _1318;
}

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    bool _248 = false;
    float _53 = in.m_38.x;
    float _55 = in.m_38.y;
    float2 _520 = float2(_53, _55);
    float4 _58 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_520, float2(0.0), isnan(_520))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_520, float2(0.0), isnan(_520))).xyzw;
    float _60 = _58.x;
    float _62 = _58.y;
    float _64 = _58.z;
    float _66 = _58.w;
    float2 _539 = float2(_53, _55);
    float _68 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_539, float2(0.0), isnan(_539))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_539, float2(0.0), isnan(_539))).x;
    float2 _546 = float2(_66, 0.0);
    float2 _72 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_546, float2(0.0), isnan(_546))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_546, float2(0.0), isnan(_546))).xy;
    float _74 = _72.x;
    float _76 = _72.y;
    float _78 = in.m_40.y;
    float _80 = in.m_40.x;
    float _82 = in.m_40.z;
    float _84 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[10].y, (*spvDescriptorSet0.fp_c3)._m0[10].x);
    float _86 = fma(_60, 2.0, -1.0);
    float _88 = -_84;
    float _90 = _78 * _88;
    float _92 = -_84;
    float _94 = _80 * _92;
    float _96 = -_84;
    float _98 = -(*spvDescriptorSet0.fp_c4)._m0[3].z;
    float _100 = fma(_82, _96, _98);
    float _102 = -(*spvDescriptorSet0.fp_c4)._m0[3].y;
    float _104 = _90 + _102;
    float _106 = -(*spvDescriptorSet0.fp_c4)._m0[3].x;
    float _108 = _94 + _106;
    float _110 = _90 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
    float _112 = _90 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
    float _114 = _104 * _104;
    float _116 = _90 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
    float _118 = fma(_94, (*spvDescriptorSet0.fp_c3)._m0[8].x, _110);
    float _120 = fma(_108, _108, _114);
    float _122 = fma(_94, (*spvDescriptorSet0.fp_c3)._m0[7].x, _116);
    float _124 = fma(_94, (*spvDescriptorSet0.fp_c3)._m0[9].x, _112);
    float _126 = -_84;
    float _128 = fma(_126, (*spvDescriptorSet0.fp_c3)._m0[8].z, _118);
    float _130 = fma(_100, _100, _120);
    float _132 = fma(_62, 2.0, -1.0);
    float _134 = -_84;
    float _136 = fma(_134, (*spvDescriptorSet0.fp_c3)._m0[7].z, _122);
    float _138 = fma(_64, 2.0, -1.0);
    float _140 = sqrt(_130);
    float _142 = _132 * _104;
    float _144 = -_84;
    float _146 = fma(_144, (*spvDescriptorSet0.fp_c3)._m0[9].z, _124);
    float _148 = _128 + (*spvDescriptorSet0.fp_c3)._m0[8].w;
    float _150 = _136 + (*spvDescriptorSet0.fp_c3)._m0[7].w;
    float _152 = fma(_86, _108, _142);
    float _154 = _146 + (*spvDescriptorSet0.fp_c3)._m0[9].w;
    float _156 = -(*spvDescriptorSet0.fp_c4)._m0[0].y;
    float _158 = _148 + _156;
    float _160 = rsqrt(_130);
    float _162 = fma(_138, _100, _152);
    float _164 = -(*spvDescriptorSet0.fp_c4)._m0[0].x;
    float _166 = _150 + _164;
    float _168 = _158 * _158;
    float _170 = -_140;
    float _172 = fma(_170, (*spvDescriptorSet0.fp_c4)._m0[1].w, 1.0);
    float _174 = precise::clamp(_172, 0.0, 1.0);
    float _176 = -(*spvDescriptorSet0.fp_c4)._m0[0].z;
    float _178 = _154 + _176;
    float _180 = abs(_174);
    float _182 = log2(_180);
    float _184 = _160 * _162;
    float _186 = fma(_166, _166, _168);
    float _188 = -_184;
    float _190 = 0.0 + _188;
    float _192 = precise::clamp(_190, 0.0, 1.0);
    float _194 = fma(_178, _178, _186);
    float _196 = _192 + 0.001000000047497451305389404296875;
    float _198 = sqrt(_194);
    float _200 = _182 * (*spvDescriptorSet0.fp_c4)._m0[3].w;
    float _202 = abs(_196);
    float _204 = -_202;
    float _206 = _204 + 1.0;
    float _208 = fma(_196, -0.0187292993068695068359375, 0.074261002242565155029296875);
    int _210 = as_type<int>(_206) + (-218103808);
    float _212 = exp2(_200);
    float _214 = fma(_196, _208, -0.212114393711090087890625);
    bool _218 = uint(_210) >= 1920991232u;
    float _220 = fma(_196, _214, 1.570728778839111328125);
    float _222 = _198 * (*spvDescriptorSet0.fp_c4)._m0[1].w;
    bool _224 = !_218;
    float _246;
    if (!_224)
    {
        int _226 = as_type<int>(_206);
        int _228 = 1088;
        int _230 = 0;
        int _232 = 0;
        int _234;
        int _236;
        int _238;
        int _240;
        int _242;
        int _244;
        _49(_226, _228, _230, _232, _234, _236, _238, _240, _242, _244);
        _246 = as_type<float>(_238);
        _248 = true;
    }
    else
    {
        float _250 = rsqrt(_206);
        float _252 = _206 * _250;
        float _254 = _250 * 0.5;
        float _256 = -_252;
        float _258 = 0.0 + _256;
        float _260 = fma(_254, _258, 0.5);
        float _262 = fma(_252, _260, _252);
        float _264 = -_262;
        float _266 = 0.0 + _264;
        float _268 = fma(_262, _266, _206);
        float _270 = fma(_254, _268, _262);
        _246 = _270;
    }
    _248 = false;
    float _272 = _246;
    float _274 = _220 * _272;
    float _276 = abs(_166);
    float _278 = abs(_158);
    float _280 = precise::max(_276, _278);
    float _282 = _274 * 0.15915493667125701904296875;
    float _284 = abs(_178);
    float _286 = precise::max(_284, _280);
    float _288 = _282 * 6.283185482025146484375;
    float _290 = cos(_288);
    float _292 = _282 * 6.283185482025146484375;
    float _294 = sin(_292);
    float _296 = 1.0 / _290;
    float _298 = 1.0 / _286;
    float _300 = _294 * _296;
    float _302 = _300 * (*spvDescriptorSet0.fp_c4)._m0[5].z;
    float _304 = _158 * _298;
    float _306 = precise::max(_302, 0.001000000047497451305389404296875);
    float _308 = _166 * _298;
    float _310 = _178 * _298;
    float _312 = -_222;
    float _314 = fma(_312, _306, _222);
    float3 _900 = float3(_308, _304, _310);
    float _316 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_900, float3(0.0), isnan(_900)), _314);
    float _318 = in.m_40.y;
    float _320 = in.m_40.x;
    float _322 = _100 * _160;
    float _324 = -(*spvDescriptorSet0.fp_c4)._m0[4].y;
    float _326 = _78 + _324;
    float _328 = -(*spvDescriptorSet0.fp_c4)._m0[4].x;
    float _330 = _80 + _328;
    float _332 = _326 * _326;
    float _334 = fma(_330, _330, _332);
    float _336 = -_334;
    float _338 = fma(_336, (*spvDescriptorSet0.fp_c4)._m0[4].z, 1.0);
    float _340 = precise::clamp(_338, 0.0, 1.0);
    float _342 = _318 * _318;
    float _344 = fma(_320, _320, _342);
    float _346 = _344 + 1.0;
    float _348 = _160 * (*spvDescriptorSet0.fp_c4)._m0[2].w;
    float _350 = precise::clamp(_348, 0.0, 1.0);
    float _352 = -_350;
    float _354 = fma(_352, _350, 1.0);
    float _356 = rsqrt(_346);
    float _358 = sqrt(_354);
    float _360 = _318 * _356;
    float _362 = _320 * _356;
    float _364 = _82 * _356;
    float _366 = -_360;
    float _368 = fma(_104, _160, _366);
    float _370 = -_362;
    float _372 = fma(_108, _160, _370);
    float _374 = -_364;
    float _376 = _322 + _374;
    float _378 = 0.0 + _322;
    float _380 = precise::clamp(_378, 0.0, 1.0);
    float _382 = _368 * _368;
    float _384 = 0.0 + _358;
    float _386 = precise::clamp(_384, 0.0, 1.0);
    float _388 = _132 * _368;
    float _390 = -_368;
    float _392 = _360 * _390;
    float _394 = fma(_372, _372, _382);
    float _396 = fma(_386, 0.5, 0.5);
    float _398 = -_86;
    float _400 = -_388;
    float _402 = fma(_398, _372, _400);
    float _404 = -_362;
    float _406 = fma(_404, _372, _392);
    float _408 = fma(_376, _376, _394);
    float _410 = sqrt(_396);
    float _412 = -_138;
    float _414 = fma(_412, _376, _402);
    float _416 = -_360;
    float _418 = _132 * _416;
    float _420 = -_364;
    float _422 = fma(_420, _376, _406);
    float _424 = -_174;
    float _426 = _424 + 1.0;
    float _428 = -_418;
    float _430 = fma(_86, _362, _428);
    float _432 = rsqrt(_408);
    float _434 = fma(_426, _380, _174);
    float _436 = fma(_138, _364, _430);
    float _438 = _340 * _434;
    float _440 = -_184;
    float _442 = precise::min(_440, _436);
    float _444 = 1.0 / _422;
    float _446 = _432 * _414;
    float _448 = precise::clamp(_446, 0.0, 1.0);
    float _450 = -_448;
    float _452 = fma(_450, _448, 1.0);
    float _454 = precise::max(_448, _410);
    float _456 = _448 * _442;
    float _458 = _456 * 2.0;
    float _460 = -_454;
    float _462 = fma(_460, _454, 1.0);
    float _464 = sqrt(_452);
    float _466 = _458 * _444;
    float _468 = precise::clamp(_466, 0.0, 1.0);
    float _470 = _468 * _438;
    float _472 = sqrt(_462);
    float _474 = _76 * _470;
    float _476 = _464 * _472;
    float _478 = fma(_448, _454, _476);
    float _480 = precise::clamp(_478, 0.0, 1.0);
    float _482 = abs(_480);
    float _484 = log2(_482);
    float _486 = _74 * _484;
    float _488 = exp2(_486);
    float _490 = _488 * _474;
    float _492 = _212 * _316;
    float _494 = _316 * _490;
    float _496 = _192 * _492;
    float _498 = _494 * (*spvDescriptorSet0.fp_c3)._m0[12].x;
    float _500 = _496 * (*spvDescriptorSet0.fp_c3)._m0[12].x;
    float _502 = _498 * (*spvDescriptorSet0.fp_c4)._m0[2].x;
    float _504 = _500 * (*spvDescriptorSet0.fp_c4)._m0[1].x;
    float _506 = _500 * (*spvDescriptorSet0.fp_c4)._m0[1].y;
    float _508 = _500 * (*spvDescriptorSet0.fp_c4)._m0[1].z;
    out.m_43.x = _504;
    out.m_43.y = _506;
    out.m_43.z = _508;
    out.m_43.w = _502;
    return out;
}

