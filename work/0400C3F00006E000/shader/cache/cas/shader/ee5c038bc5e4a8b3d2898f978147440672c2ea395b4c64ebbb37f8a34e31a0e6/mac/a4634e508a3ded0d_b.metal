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
    float4 m_45 [[color(1)]];
};

struct main0_in
{
    float4 m_40 [[user(locn0), center_no_perspective]];
    float4 m_38 [[user(locn1), center_no_perspective]];
};

static inline __attribute__((always_inline))
void _51(thread const int& _1191, thread const int& _1192, thread const int& _1193, thread const int& _1194, thread int& _1195, thread int& _1196, thread int& _1197, thread int& _1198, thread int& _1199, thread int& _1200)
{
    float _1203 = as_type<float>(_1191) + 0.0;
    bool _1205 = _1203 != 0.0;
    bool _1207 = isnan(_1203);
    bool _1209 = _1205 || _1207;
    bool _1211 = isnan(0.0);
    bool _1213 = _1209 || _1211;
    int _1215 = _1193;
    int _1217 = _1194;
    int _1219 = 0;
    int _1221 = _1213 ? (-1) : 0;
    if (!_1213)
    {
        float _1223 = as_type<float>(_1191) * 1.0;
        _1215 = as_type<int>(_1223);
    }
    int _1225 = _1215;
    bool _1227 = !_1213;
    int _1229 = _1225;
    int _1231 = _1225;
    if (!_1227)
    {
        float _1233 = as_type<float>(_1191) + 0.0;
        bool _1235 = _1233 >= 0.0;
        bool _1237 = isnan(_1233);
        bool _1239 = _1235 || _1237;
        bool _1241 = isnan(0.0);
        bool _1243 = _1239 || _1241;
        _1221 = _1243 ? (-1) : 0;
        if (!_1243)
        {
            _1229 = 2147483647;
        }
        int _1245 = _1229;
        bool _1247 = !_1243;
        int _1249 = _1245;
        _1231 = _1245;
        if (!_1247)
        {
            float _1251 = abs(as_type<float>(_1191));
            float _1253 = _1251 + 0.0;
            bool _1255 = _1253 > as_type<float>(0x7f800000u /* inf */);
            bool _1257 = isnan(_1253);
            bool _1259 = _1255 || _1257;
            bool _1261 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _1263 = _1259 || _1261;
            _1219 = 2139095040;
            _1221 = _1263 ? (-1) : 0;
            if (_1263)
            {
                float _1265 = as_type<float>(_1191) + 1.0;
                _1249 = as_type<int>(_1265);
            }
            int _1267 = _1249;
            int _1269 = _1267;
            _1231 = _1267;
            if (!_1263)
            {
                float _1271 = abs(as_type<float>(_1191));
                float _1273 = _1271 + (-0.0);
                float _1275 = 0.0 + _1273;
                bool _1277 = _1275 != as_type<float>(0x7f800000u /* inf */);
                bool _1279 = isnan(_1275);
                bool _1281 = _1277 || _1279;
                bool _1283 = isnan(as_type<float>(0x7f800000u /* inf */));
                bool _1285 = _1281 || _1283;
                _1221 = _1285 ? (-1) : 0;
                if (!_1285)
                {
                    _1269 = _1191;
                }
                int _1287 = _1269;
                bool _1289 = !_1285;
                _1231 = _1287;
                if (!_1289)
                {
                    float _1291 = as_type<float>(_1191) * 18446744073709551616.0;
                    float _1293 = rsqrt(_1291);
                    float _1295 = _1291 * _1293;
                    float _1297 = _1293 * 0.5;
                    float _1299 = -_1295;
                    float _1301 = 0.0 + _1299;
                    float _1303 = fma(_1297, _1301, 0.5);
                    float _1305 = fma(_1295, _1303, _1295);
                    float _1307 = -_1305;
                    float _1309 = 0.0 + _1307;
                    float _1311 = fma(_1305, _1309, _1291);
                    float _1313 = fma(_1297, _1311, _1305);
                    float _1315 = _1313 * 2.3283064365386962890625e-10;
                    _1231 = as_type<int>(_1315);
                    _1217 = as_type<int>(_1305);
                    _1219 = as_type<int>(_1301);
                }
            }
        }
    }
    int _1317 = _1231;
    int _1319 = _1217;
    int _1321 = _1219;
    int _1323 = _1221;
    _1195 = _1192;
    _1196 = 0;
    _1197 = _1317;
    _1198 = _1319;
    _1199 = _1321;
    _1200 = _1323;
}

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    bool _250 = false;
    float _55 = in.m_38.x;
    float _57 = in.m_38.y;
    float2 _522 = float2(_55, _57);
    float4 _60 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_522, float2(0.0), isnan(_522))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_522, float2(0.0), isnan(_522))).xyzw;
    float _62 = _60.x;
    float _64 = _60.y;
    float _66 = _60.z;
    float _68 = _60.w;
    float2 _541 = float2(_55, _57);
    float _70 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_541, float2(0.0), isnan(_541))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_541, float2(0.0), isnan(_541))).x;
    float2 _548 = float2(_68, 0.0);
    float2 _74 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_548, float2(0.0), isnan(_548))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_548, float2(0.0), isnan(_548))).xy;
    float _76 = _74.x;
    float _78 = _74.y;
    float _80 = in.m_40.y;
    float _82 = in.m_40.x;
    float _84 = in.m_40.z;
    float _86 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[10].y, (*spvDescriptorSet0.fp_c3)._m0[10].x);
    float _88 = fma(_64, 2.0, -1.0);
    float _90 = -_86;
    float _92 = _80 * _90;
    float _94 = -_86;
    float _96 = _82 * _94;
    float _98 = -_86;
    float _100 = -(*spvDescriptorSet0.fp_c4)._m0[3].z;
    float _102 = fma(_84, _98, _100);
    float _104 = -(*spvDescriptorSet0.fp_c4)._m0[3].y;
    float _106 = _92 + _104;
    float _108 = -(*spvDescriptorSet0.fp_c4)._m0[3].x;
    float _110 = _96 + _108;
    float _112 = _92 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
    float _114 = _92 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
    float _116 = _106 * _106;
    float _118 = _92 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
    float _120 = fma(_96, (*spvDescriptorSet0.fp_c3)._m0[8].x, _112);
    float _122 = fma(_96, (*spvDescriptorSet0.fp_c3)._m0[7].x, _114);
    float _124 = fma(_110, _110, _116);
    float _126 = fma(_96, (*spvDescriptorSet0.fp_c3)._m0[9].x, _118);
    float _128 = -_86;
    float _130 = fma(_128, (*spvDescriptorSet0.fp_c3)._m0[8].z, _120);
    float _132 = -_86;
    float _134 = fma(_132, (*spvDescriptorSet0.fp_c3)._m0[7].z, _122);
    float _136 = fma(_102, _102, _124);
    float _138 = -_86;
    float _140 = fma(_138, (*spvDescriptorSet0.fp_c3)._m0[9].z, _126);
    float _142 = fma(_62, 2.0, -1.0);
    float _144 = _88 * _106;
    float _146 = sqrt(_136);
    float _148 = fma(_66, 2.0, -1.0);
    float _150 = _130 + (*spvDescriptorSet0.fp_c3)._m0[8].w;
    float _152 = fma(_142, _110, _144);
    float _154 = _134 + (*spvDescriptorSet0.fp_c3)._m0[7].w;
    float _156 = -(*spvDescriptorSet0.fp_c4)._m0[0].y;
    float _158 = _150 + _156;
    float _160 = fma(_148, _102, _152);
    float _162 = rsqrt(_136);
    float _164 = -(*spvDescriptorSet0.fp_c4)._m0[0].x;
    float _166 = _154 + _164;
    float _168 = -_146;
    float _170 = fma(_168, (*spvDescriptorSet0.fp_c4)._m0[1].w, 1.0);
    float _172 = precise::clamp(_170, 0.0, 1.0);
    float _174 = _140 + (*spvDescriptorSet0.fp_c3)._m0[9].w;
    float _176 = _158 * _158;
    float _178 = abs(_172);
    float _180 = log2(_178);
    float _182 = -(*spvDescriptorSet0.fp_c4)._m0[0].z;
    float _184 = _174 + _182;
    float _186 = fma(_166, _166, _176);
    float _188 = _162 * _160;
    float _190 = fma(_184, _184, _186);
    float _192 = -_188;
    float _194 = 0.0 + _192;
    float _196 = precise::clamp(_194, 0.0, 1.0);
    float _198 = _196 + 0.001000000047497451305389404296875;
    float _200 = sqrt(_190);
    float _202 = _180 * (*spvDescriptorSet0.fp_c4)._m0[3].w;
    float _204 = abs(_198);
    float _206 = -_204;
    float _208 = _206 + 1.0;
    float _210 = fma(_198, -0.0187292993068695068359375, 0.074261002242565155029296875);
    int _212 = as_type<int>(_208) + (-218103808);
    float _214 = exp2(_202);
    float _216 = fma(_198, _210, -0.212114393711090087890625);
    bool _220 = uint(_212) >= 1920991232u;
    float _222 = fma(_198, _216, 1.570728778839111328125);
    float _224 = _200 * (*spvDescriptorSet0.fp_c4)._m0[1].w;
    bool _226 = !_220;
    float _248;
    if (!_226)
    {
        int _228 = as_type<int>(_208);
        int _230 = 1088;
        int _232 = 0;
        int _234 = 0;
        int _236;
        int _238;
        int _240;
        int _242;
        int _244;
        int _246;
        _51(_228, _230, _232, _234, _236, _238, _240, _242, _244, _246);
        _248 = as_type<float>(_240);
        _250 = true;
    }
    else
    {
        float _252 = rsqrt(_208);
        float _254 = _208 * _252;
        float _256 = _252 * 0.5;
        float _258 = -_254;
        float _260 = 0.0 + _258;
        float _262 = fma(_256, _260, 0.5);
        float _264 = fma(_254, _262, _254);
        float _266 = -_264;
        float _268 = 0.0 + _266;
        float _270 = fma(_264, _268, _208);
        float _272 = fma(_256, _270, _264);
        _248 = _272;
    }
    _250 = false;
    float _274 = _248;
    float _276 = _222 * _274;
    float _278 = abs(_166);
    float _280 = abs(_158);
    float _282 = precise::max(_278, _280);
    float _284 = _276 * 0.15915493667125701904296875;
    float _286 = abs(_184);
    float _288 = precise::max(_286, _282);
    float _290 = _284 * 6.283185482025146484375;
    float _292 = cos(_290);
    float _294 = _284 * 6.283185482025146484375;
    float _296 = sin(_294);
    float _298 = 1.0 / _292;
    float _300 = 1.0 / _288;
    float _302 = _296 * _298;
    float _304 = _302 * (*spvDescriptorSet0.fp_c4)._m0[5].z;
    float _306 = _158 * _300;
    float _308 = precise::max(_304, 0.001000000047497451305389404296875);
    float _310 = _166 * _300;
    float _312 = _184 * _300;
    float _314 = -_224;
    float _316 = fma(_314, _308, _224);
    float3 _902 = float3(_310, _306, _312);
    float _318 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_902, float3(0.0), isnan(_902)), _316);
    float _320 = in.m_40.y;
    float _322 = in.m_40.x;
    float _324 = _102 * _162;
    float _326 = -(*spvDescriptorSet0.fp_c4)._m0[4].y;
    float _328 = _80 + _326;
    float _330 = -(*spvDescriptorSet0.fp_c4)._m0[4].x;
    float _332 = _82 + _330;
    float _334 = _328 * _328;
    float _336 = fma(_332, _332, _334);
    float _338 = -_172;
    float _340 = _338 + 1.0;
    float _342 = _320 * _320;
    float _344 = fma(_322, _322, _342);
    float _346 = _344 + 1.0;
    float _348 = _162 * (*spvDescriptorSet0.fp_c4)._m0[2].w;
    float _350 = precise::clamp(_348, 0.0, 1.0);
    float _352 = rsqrt(_346);
    float _354 = -_350;
    float _356 = fma(_354, _350, 1.0);
    float _358 = sqrt(_356);
    float _360 = _320 * _352;
    float _362 = _322 * _352;
    float _364 = _84 * _352;
    float _366 = -_360;
    float _368 = fma(_106, _162, _366);
    float _370 = -_362;
    float _372 = fma(_110, _162, _370);
    float _374 = -_364;
    float _376 = _324 + _374;
    float _378 = 0.0 + _324;
    float _380 = precise::clamp(_378, 0.0, 1.0);
    float _382 = _368 * _368;
    float _384 = 0.0 + _358;
    float _386 = precise::clamp(_384, 0.0, 1.0);
    float _388 = fma(_340, _380, _172);
    float _390 = fma(_372, _372, _382);
    float _392 = fma(_386, 0.5, 0.5);
    float _394 = _88 * _368;
    float _396 = -_368;
    float _398 = _360 * _396;
    float _400 = fma(_376, _376, _390);
    float _402 = -_360;
    float _404 = _88 * _402;
    float _406 = -_142;
    float _408 = -_394;
    float _410 = fma(_406, _372, _408);
    float _412 = sqrt(_392);
    float _414 = -_362;
    float _416 = fma(_414, _372, _398);
    float _418 = -_404;
    float _420 = fma(_142, _362, _418);
    float _422 = -_148;
    float _424 = fma(_422, _376, _410);
    float _426 = -_364;
    float _428 = fma(_426, _376, _416);
    float _430 = fma(_148, _364, _420);
    float _432 = rsqrt(_400);
    float _434 = -_188;
    float _436 = precise::min(_434, _430);
    float _438 = -_336;
    float _440 = fma(_438, (*spvDescriptorSet0.fp_c4)._m0[4].z, 1.0);
    float _442 = precise::clamp(_440, 0.0, 1.0);
    float _444 = 1.0 / _428;
    float _446 = _442 * _388;
    float _448 = _432 * _424;
    float _450 = precise::clamp(_448, 0.0, 1.0);
    float _452 = -_450;
    float _454 = fma(_452, _450, 1.0);
    float _456 = precise::max(_450, _412);
    float _458 = _450 * _436;
    float _460 = _458 * 2.0;
    float _462 = -_456;
    float _464 = fma(_462, _456, 1.0);
    float _466 = sqrt(_454);
    float _468 = _460 * _444;
    float _470 = precise::clamp(_468, 0.0, 1.0);
    float _472 = _470 * _446;
    float _474 = sqrt(_464);
    float _476 = _78 * _472;
    float _478 = _466 * _474;
    float _480 = fma(_450, _456, _478);
    float _482 = precise::clamp(_480, 0.0, 1.0);
    float _484 = abs(_482);
    float _486 = log2(_484);
    float _488 = _76 * _486;
    float _490 = exp2(_488);
    float _492 = _490 * _476;
    float _494 = _214 * _318;
    float _496 = _318 * _492;
    float _498 = _196 * _494;
    float _500 = _496 * (*spvDescriptorSet0.fp_c4)._m0[2].x;
    float _502 = _496 * (*spvDescriptorSet0.fp_c4)._m0[2].y;
    float _504 = _496 * (*spvDescriptorSet0.fp_c4)._m0[2].z;
    float _506 = _498 * (*spvDescriptorSet0.fp_c4)._m0[1].x;
    float _508 = _498 * (*spvDescriptorSet0.fp_c4)._m0[1].y;
    float _510 = _498 * (*spvDescriptorSet0.fp_c4)._m0[1].z;
    out.m_43.x = _506;
    out.m_43.y = _508;
    out.m_43.z = _510;
    out.m_45.x = _500;
    out.m_45.y = _502;
    out.m_45.z = _504;
    return out;
}

