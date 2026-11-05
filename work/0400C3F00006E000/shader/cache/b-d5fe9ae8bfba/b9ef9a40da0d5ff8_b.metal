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
    texture2d<float> fp_t_tcb_8 [[id(1)]];
    sampler fp_t_tcb_8Smplr [[id(2)]];
    texture2d_array<float> fp_t_tcb_C [[id(3)]];
    sampler fp_t_tcb_CSmplr [[id(4)]];
    texture2d_array<float> fp_t_tcb_E [[id(5)]];
    sampler fp_t_tcb_ESmplr [[id(6)]];
    texture2d_array<float> fp_t_tcb_10 [[id(7)]];
    sampler fp_t_tcb_10Smplr [[id(8)]];
    texture2d<float> fp_t_tcb_A [[id(9)]];
    sampler fp_t_tcb_ASmplr [[id(10)]];
    sampler fp_t_tcb_8Smplr_w [[id(11)]];
    sampler fp_t_tcb_ASmplr_w [[id(12)]];
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

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    float _50 = in.m_38.x;
    float _52 = in.m_38.y;
    float2 _756 = float2(_50, _52);
    float _54 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_756, float2(0.0), isnan(_756))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_756, float2(0.0), isnan(_756))).x;
    float _56 = in.m_40.y;
    float _58 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _60 = in.m_40.x;
    float _62 = -_54;
    float _64 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _66 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[46].z, _64);
    float _68 = _66 * _56;
    float _70 = _66 * _60;
    float _72 = -_68;
    float _74 = _72 + (*spvDescriptorSet0.fp_c3)._m0[42].y;
    float _76 = -_70;
    float _78 = _76 + (*spvDescriptorSet0.fp_c3)._m0[42].x;
    float _80 = _68 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _82 = _74 * _74;
    float _84 = -_66;
    float _86 = _84 + (*spvDescriptorSet0.fp_c3)._m0[42].z;
    float _88 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[2].x, _80);
    float _90 = fma(_78, _78, _82);
    float _92 = _68 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _94 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[2].z, _88);
    float _96 = fma(_86, _86, _90);
    float _98 = _68 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _100 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[1].x, _92);
    float _102 = _94 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _104 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[3].x, _98);
    float _106 = sqrt(_96);
    float _108 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[1].z, _100);
    float _110 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[3].z, _104);
    float _112 = _108 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _114 = _110 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _116 = _68 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _118 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[0].x, _116);
    float _120 = 1.0 / _114;
    float _122 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[0].z, _118);
    bool _126 = _106 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    bool _128 = _106 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _130 = _122 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    bool _132 = !_126;
    int _135 = _132 ? 0 : 1;
    float _137 = _130 * _120;
    float _139 = _112 * _120;
    float _141 = _102 * _120;
    float _143 = precise::clamp(_141, 0.0, 1.0);
    float _145 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    int _147 = 2;
    if (!_126)
    {
        _147 = 1;
    }
    int _149 = _147;
    float _151 = _143 * _58;
    float _153 = _143 * _145;
    int _155 = _149;
    if (!_128)
    {
        _155 = _135;
    }
    int _157 = _155;
    float _159 = fma(_151, 1.5, _137);
    float _161 = fma(_153, 1.5, _139);
    float _163 = fma(_151, 0.5, _137);
    float _165 = fma(_151, -0.5, _137);
    float3 _971 = float3(_159, _161, float(0));
    float3 _975 = select(_971, float3(0.0), isnan(_971));
    float _167 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _975.xy, uint(rint(_975.z)), _143);
    float3 _982 = float3(_163, _161, float(0));
    float3 _984 = select(_982, float3(0.0), isnan(_982));
    float _169 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _984.xy, uint(rint(_984.z)), _143);
    float _171 = fma(_153, 0.5, _139);
    float3 _994 = float3(_165, _161, float(0));
    float3 _996 = select(_994, float3(0.0), isnan(_994));
    float _173 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _996.xy, uint(rint(_996.z)), _143);
    float3 _1003 = float3(_159, _171, float(0));
    float3 _1005 = select(_1003, float3(0.0), isnan(_1003));
    float _175 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1005.xy, uint(rint(_1005.z)), _143);
    float _177 = float(_157);
    float _179 = _68 * (*spvDescriptorSet0.fp_c3)._m0[19].y;
    float _181 = _68 * (*spvDescriptorSet0.fp_c3)._m0[22].y;
    float _183 = _68 * (*spvDescriptorSet0.fp_c3)._m0[21].y;
    float _185 = precise::min(_177, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _187 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[19].x, _179);
    float _189 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[22].x, _181);
    float _191 = fma(_151, -1.5, _137);
    bool _193 = _185 != 1.0;
    bool _195 = isnan(_185);
    bool _197 = _193 || _195;
    bool _199 = isnan(1.0);
    bool _201 = _197 || _199;
    float _203 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[19].z, _187);
    float _205 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[22].z, _189);
    float _207 = _68 * (*spvDescriptorSet0.fp_c3)._m0[24].y;
    bool _209 = _185 != 0.0;
    bool _211 = isnan(_185);
    bool _213 = _209 || _211;
    bool _215 = isnan(0.0);
    bool _217 = _213 || _215;
    float _219 = _203 + (*spvDescriptorSet0.fp_c3)._m0[19].w;
    float _221 = _68 * (*spvDescriptorSet0.fp_c3)._m0[20].y;
    float _223 = _68 * (*spvDescriptorSet0.fp_c3)._m0[16].y;
    float _225 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[21].x, _183);
    float _227 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[24].x, _207);
    float _229 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[20].x, _221);
    float _231 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[16].x, _223);
    float _233 = _219;
    if (_201)
    {
        float _235 = _205 + (*spvDescriptorSet0.fp_c3)._m0[22].w;
        _233 = _235;
    }
    float _237 = _233;
    float _239 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[21].z, _225);
    float3 _1133 = float3(_191, _161, float(0));
    float3 _1135 = select(_1133, float3(0.0), isnan(_1133));
    float _241 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1135.xy, uint(rint(_1135.z)), _143);
    float _243 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[24].z, _227);
    float _245 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[20].z, _229);
    float _247 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[16].z, _231);
    float _249 = _239 + (*spvDescriptorSet0.fp_c3)._m0[21].w;
    float _251 = _249;
    float _253 = _237;
    if (_201)
    {
        float _255 = _243 + (*spvDescriptorSet0.fp_c3)._m0[24].w;
        _251 = _255;
    }
    float _257 = _251;
    float3 _1172 = float3(_163, _171, float(0));
    float3 _1174 = select(_1172, float3(0.0), isnan(_1172));
    float _259 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1174.xy, uint(rint(_1174.z)), _143);
    float _261 = _245 + (*spvDescriptorSet0.fp_c3)._m0[20].w;
    float _263 = _261;
    float _265 = _257;
    if (!_217)
    {
        float _267 = _247 + (*spvDescriptorSet0.fp_c3)._m0[16].w;
        _253 = _267;
    }
    float _269 = _253;
    float _271 = fma(_153, -0.5, _139);
    float _273 = fma(_153, -1.5, _139);
    float _275 = _68 * (*spvDescriptorSet0.fp_c3)._m0[17].y;
    float _277 = _68 * (*spvDescriptorSet0.fp_c3)._m0[23].y;
    float _279 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[17].x, _275);
    float _281 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[23].x, _277);
    float _283 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[17].z, _279);
    float _285 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[23].z, _281);
    if (_201)
    {
        float _287 = _285 + (*spvDescriptorSet0.fp_c3)._m0[23].w;
        _263 = _287;
    }
    float _289 = _263;
    float _291 = _167 + _169;
    float _293 = _291 + _173;
    float3 _1248 = float3(_165, _171, float(0));
    float3 _1250 = select(_1248, float3(0.0), isnan(_1248));
    float _295 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1250.xy, uint(rint(_1250.z)), _143);
    float3 _1257 = float3(_191, _171, float(0));
    float3 _1259 = select(_1257, float3(0.0), isnan(_1257));
    float _297 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1259.xy, uint(rint(_1259.z)), _143);
    float3 _1266 = float3(_159, _271, float(0));
    float3 _1268 = select(_1266, float3(0.0), isnan(_1266));
    float _299 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1268.xy, uint(rint(_1268.z)), _143);
    float _301 = _289;
    if (!_217)
    {
        float _303 = _283 + (*spvDescriptorSet0.fp_c3)._m0[17].w;
        _301 = _303;
    }
    float _305 = _301;
    float _307 = _68 * (*spvDescriptorSet0.fp_c3)._m0[18].y;
    float _309 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].z;
    float _311 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[18].x, _307);
    float _313 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[18].z, _311);
    if (!_217)
    {
        float _315 = _313 + (*spvDescriptorSet0.fp_c3)._m0[18].w;
        _265 = _315;
    }
    float _317 = _265;
    float _319 = _293 + _241;
    float3 _1319 = float3(_163, _271, float(0));
    float3 _1321 = select(_1319, float3(0.0), isnan(_1319));
    float _321 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1321.xy, uint(rint(_1321.z)), _143);
    float _323 = _319 + _175;
    float _325 = 0.0 + _317;
    float _327 = precise::clamp(_325, 0.0, 1.0);
    float _329 = _323 + _259;
    float _331 = _329 + _295;
    float _333 = _331 + _297;
    float _335 = rint(_185);
    float _337 = precise::max(_335, 0.0);
    uint _340 = uint(_337);
    uint _342 = clamp(_340, 0u, 65535u);
    float3 _1354 = float3(_165, _271, float(0));
    float3 _1356 = select(_1354, float3(0.0), isnan(_1354));
    float _344 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1356.xy, uint(rint(_1356.z)), _143);
    float3 _1363 = float3(_191, _271, float(0));
    float3 _1365 = select(_1363, float3(0.0), isnan(_1363));
    float _346 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1365.xy, uint(rint(_1365.z)), _143);
    float3 _1372 = float3(_159, _273, float(0));
    float3 _1374 = select(_1372, float3(0.0), isnan(_1372));
    float _348 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1374.xy, uint(rint(_1374.z)), _143);
    float3 _1381 = float3(_163, _273, float(0));
    float3 _1383 = select(_1381, float3(0.0), isnan(_1381));
    float _350 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1383.xy, uint(rint(_1383.z)), _143);
    float _352 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].w;
    float _354 = _327 * _309;
    float _356 = _327 * _352;
    float _358 = fma(_354, 1.5, _269);
    float _360 = fma(_354, 0.5, _269);
    float _362 = fma(_354, -0.5, _269);
    float _364 = fma(_354, -1.5, _269);
    float _366 = fma(_356, 1.5, _305);
    float3 _1416 = float3(_165, _273, float(0));
    float3 _1418 = select(_1416, float3(0.0), isnan(_1416));
    float _368 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1418.xy, uint(rint(_1418.z)), _143);
    float3 _1427 = float3(_360, _366, float(int(_342)));
    float3 _1429 = select(_1427, float3(0.0), isnan(_1427));
    float _370 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1429.xy, uint(rint(_1429.z)), _327);
    float3 _1438 = float3(_362, _366, float(int(_342)));
    float3 _1440 = select(_1438, float3(0.0), isnan(_1438));
    float _372 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1440.xy, uint(rint(_1440.z)), _327);
    float3 _1449 = float3(_364, _366, float(int(_342)));
    float3 _1451 = select(_1449, float3(0.0), isnan(_1449));
    float _374 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1451.xy, uint(rint(_1451.z)), _327);
    float3 _1460 = float3(_358, _366, float(int(_342)));
    float3 _1462 = select(_1460, float3(0.0), isnan(_1460));
    float _376 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1462.xy, uint(rint(_1462.z)), _327);
    float3 _1469 = float3(_191, _273, float(0));
    float3 _1471 = select(_1469, float3(0.0), isnan(_1469));
    float _378 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1471.xy, uint(rint(_1471.z)), _143);
    float _380 = _333 + _299;
    float _382 = _380 + _321;
    float _384 = fma(_356, 0.5, _305);
    float _386 = _382 + _344;
    float _388 = _386 + _346;
    float _390 = _388 + _348;
    float _392 = _390 + _350;
    float _394 = _392 + _368;
    float _396 = fma(_356, -0.5, _305);
    float _398 = _376 + _370;
    float _400 = _394 + _378;
    float _402 = _398 + _372;
    float3 _1516 = float3(_358, _384, float(int(_342)));
    float3 _1518 = select(_1516, float3(0.0), isnan(_1516));
    float _404 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1518.xy, uint(rint(_1518.z)), _327);
    float _406 = _402 + _374;
    float3 _1530 = float3(_360, _384, float(int(_342)));
    float3 _1532 = select(_1530, float3(0.0), isnan(_1530));
    float _408 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1532.xy, uint(rint(_1532.z)), _327);
    float3 _1541 = float3(_362, _384, float(int(_342)));
    float3 _1543 = select(_1541, float3(0.0), isnan(_1541));
    float _410 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1543.xy, uint(rint(_1543.z)), _327);
    float3 _1552 = float3(_364, _384, float(int(_342)));
    float3 _1554 = select(_1552, float3(0.0), isnan(_1552));
    float _412 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1554.xy, uint(rint(_1554.z)), _327);
    float3 _1563 = float3(_358, _396, float(int(_342)));
    float3 _1565 = select(_1563, float3(0.0), isnan(_1563));
    float _414 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1565.xy, uint(rint(_1565.z)), _327);
    float3 _1574 = float3(_360, _396, float(int(_342)));
    float3 _1576 = select(_1574, float3(0.0), isnan(_1574));
    float _416 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1576.xy, uint(rint(_1576.z)), _327);
    float _418 = -_68;
    float _420 = _418 + (*spvDescriptorSet0.fp_c3)._m0[43].y;
    float _422 = -_70;
    float _424 = _422 + (*spvDescriptorSet0.fp_c3)._m0[43].x;
    float _426 = _68 * (*spvDescriptorSet0.fp_c3)._m0[29].y;
    float _428 = _68 * (*spvDescriptorSet0.fp_c3)._m0[30].y;
    float _430 = _420 * _420;
    float _432 = _68 * (*spvDescriptorSet0.fp_c3)._m0[27].y;
    float _434 = _68 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    float _436 = fma(_424, _424, _430);
    float _438 = -_66;
    float _440 = _438 + (*spvDescriptorSet0.fp_c3)._m0[43].z;
    float _442 = _68 * (*spvDescriptorSet0.fp_c3)._m0[26].y;
    float _444 = _68 * (*spvDescriptorSet0.fp_c3)._m0[33].y;
    float _446 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[28].x, _434);
    float _448 = fma(_440, _440, _436);
    float _450 = _68 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    float _452 = _68 * (*spvDescriptorSet0.fp_c3)._m0[32].y;
    float _454 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[26].x, _442);
    float _456 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[28].z, _446);
    float _458 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[31].x, _450);
    float _460 = sqrt(_448);
    float _462 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[30].x, _428);
    float _464 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[31].z, _458);
    float _466 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[33].x, _444);
    float _468 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[30].z, _462);
    float _470 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[33].z, _466);
    bool _472 = _460 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    bool _474 = _460 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    bool _476 = !_472;
    int _478 = _476 ? 0 : 1;
    int _480 = 2;
    if (!_472)
    {
        _480 = 1;
    }
    int _482 = _480;
    int _484 = _482;
    if (!_474)
    {
        _484 = _478;
    }
    int _486 = _484;
    float _488 = _68 * (*spvDescriptorSet0.fp_c3)._m0[25].y;
    float _490 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[25].x, _488);
    float _492 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[27].x, _432);
    float _494 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[29].x, _426);
    float _496 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[32].x, _452);
    float _498 = fma(_356, -1.5, _305);
    float _500 = _456 + (*spvDescriptorSet0.fp_c3)._m0[28].w;
    float _502 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[29].z, _494);
    float _504 = float(_486);
    float _506 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[32].z, _496);
    float _508 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[25].z, _490);
    float _510 = precise::min(_504, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    bool _512 = _510 != 1.0;
    bool _514 = isnan(_510);
    bool _516 = _512 || _514;
    bool _518 = isnan(1.0);
    bool _520 = _516 || _518;
    float _522 = _500;
    if (_520)
    {
        float _524 = _464 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
        _522 = _524;
    }
    float _526 = _522;
    float _528 = _406 + _404;
    float _530 = _502 + (*spvDescriptorSet0.fp_c3)._m0[29].w;
    float _532 = _530;
    float _534 = _526;
    if (_520)
    {
        float _536 = _506 + (*spvDescriptorSet0.fp_c3)._m0[32].w;
        _532 = _536;
    }
    float _538 = _532;
    float _540 = _528 + _408;
    float _542 = _540 + _410;
    float _544 = _542 + _412;
    float _546 = _468 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
    float _548 = _546;
    float _550 = _538;
    if (_520)
    {
        float _552 = _470 + (*spvDescriptorSet0.fp_c3)._m0[33].w;
        _548 = _552;
    }
    float _554 = _548;
    float _556 = _544 + _414;
    float _558 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[26].z, _454);
    float _560 = _556 + _416;
    float _562 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[27].z, _492);
    float3 _1858 = float3(_362, _396, float(int(_342)));
    float3 _1860 = select(_1858, float3(0.0), isnan(_1858));
    float _564 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1860.xy, uint(rint(_1860.z)), _327);
    float3 _1869 = float3(_364, _396, float(int(_342)));
    float3 _1871 = select(_1869, float3(0.0), isnan(_1869));
    float _566 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1871.xy, uint(rint(_1871.z)), _327);
    float3 _1880 = float3(_358, _498, float(int(_342)));
    float3 _1882 = select(_1880, float3(0.0), isnan(_1880));
    float _568 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1882.xy, uint(rint(_1882.z)), _327);
    float3 _1891 = float3(_360, _498, float(int(_342)));
    float3 _1893 = select(_1891, float3(0.0), isnan(_1891));
    float _570 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1893.xy, uint(rint(_1893.z)), _327);
    bool _572 = _510 != 0.0;
    bool _574 = isnan(_510);
    bool _576 = _572 || _574;
    bool _578 = isnan(0.0);
    bool _580 = _576 || _578;
    float3 _1913 = float3(_362, _498, float(int(_342)));
    float3 _1915 = select(_1913, float3(0.0), isnan(_1913));
    float _582 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1915.xy, uint(rint(_1915.z)), _327);
    float3 _1924 = float3(_364, _498, float(int(_342)));
    float3 _1926 = select(_1924, float3(0.0), isnan(_1924));
    float _584 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1926.xy, uint(rint(_1926.z)), _327);
    float _586 = -_66;
    float _588 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _590 = _586 + _588;
    float _592 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].z;
    float _594 = _590 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _596 = precise::clamp(_594, 0.0, 1.0);
    float _598 = _554;
    if (!_580)
    {
        float _600 = _558 + (*spvDescriptorSet0.fp_c3)._m0[26].w;
        _550 = _600;
    }
    float _602 = _550;
    if (!_580)
    {
        float _604 = _562 + (*spvDescriptorSet0.fp_c3)._m0[27].w;
        _598 = _604;
    }
    float _606 = _598;
    if (!_580)
    {
        float _608 = _508 + (*spvDescriptorSet0.fp_c3)._m0[25].w;
        _534 = _608;
    }
    float _610 = _534;
    float _612 = 0.0 + _606;
    float _614 = precise::clamp(_612, 0.0, 1.0);
    float _616 = _592 * _614;
    float _618 = _352 * _614;
    float _620 = fma(_616, 1.5, _610);
    float _622 = fma(_616, -1.5, _610);
    float _624 = _560 + _564;
    float _626 = fma(_616, -0.5, _610);
    float _628 = rint(_510);
    float _630 = precise::max(_628, 0.0);
    uint _632 = uint(_630);
    uint _634 = clamp(_632, 0u, 65535u);
    float _636 = _624 + _566;
    float _638 = fma(_616, 0.5, _610);
    float _640 = fma(_618, 1.5, _602);
    float _642 = _636 + _568;
    float _644 = _642 + _570;
    float _646 = fma(_618, 0.5, _602);
    float3 _2033 = float3(_638, _640, float(int(_634)));
    float3 _2035 = select(_2033, float3(0.0), isnan(_2033));
    float _648 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2035.xy, uint(rint(_2035.z)), _614);
    float3 _2044 = float3(_620, _640, float(int(_634)));
    float3 _2046 = select(_2044, float3(0.0), isnan(_2044));
    float _650 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2046.xy, uint(rint(_2046.z)), _614);
    float3 _2055 = float3(_626, _640, float(int(_634)));
    float3 _2057 = select(_2055, float3(0.0), isnan(_2055));
    float _652 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2057.xy, uint(rint(_2057.z)), _614);
    float3 _2066 = float3(_622, _640, float(int(_634)));
    float3 _2068 = select(_2066, float3(0.0), isnan(_2066));
    float _654 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2068.xy, uint(rint(_2068.z)), _614);
    float3 _2077 = float3(_620, _646, float(int(_634)));
    float3 _2079 = select(_2077, float3(0.0), isnan(_2077));
    float _656 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2079.xy, uint(rint(_2079.z)), _614);
    float3 _2088 = float3(_638, _646, float(int(_634)));
    float3 _2090 = select(_2088, float3(0.0), isnan(_2088));
    float _658 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2090.xy, uint(rint(_2090.z)), _614);
    float _660 = fma(_400, 0.0625, _596);
    float _662 = _644 + _582;
    float3 _2106 = float3(_626, _646, float(int(_634)));
    float3 _2108 = select(_2106, float3(0.0), isnan(_2106));
    float _664 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2108.xy, uint(rint(_2108.z)), _614);
    float3 _2117 = float3(_622, _646, float(int(_634)));
    float3 _2119 = select(_2117, float3(0.0), isnan(_2117));
    float _666 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2119.xy, uint(rint(_2119.z)), _614);
    float _668 = fma(_618, -0.5, _602);
    float3 _2131 = float3(_620, _668, float(int(_634)));
    float3 _2133 = select(_2131, float3(0.0), isnan(_2131));
    float _670 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2133.xy, uint(rint(_2133.z)), _614);
    float3 _2142 = float3(_638, _668, float(int(_634)));
    float3 _2144 = select(_2142, float3(0.0), isnan(_2142));
    float _672 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2144.xy, uint(rint(_2144.z)), _614);
    float3 _2153 = float3(_626, _668, float(int(_634)));
    float3 _2155 = select(_2153, float3(0.0), isnan(_2153));
    float _674 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2155.xy, uint(rint(_2155.z)), _614);
    float3 _2164 = float3(_622, _668, float(int(_634)));
    float3 _2166 = select(_2164, float3(0.0), isnan(_2164));
    float _676 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2166.xy, uint(rint(_2166.z)), _614);
    float _678 = fma(_618, -1.5, _602);
    float3 _2178 = float3(_620, _678, float(int(_634)));
    float3 _2180 = select(_2178, float3(0.0), isnan(_2178));
    float _680 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2180.xy, uint(rint(_2180.z)), _614);
    float _682 = in.m_38.x;
    float _684 = in.m_38.y;
    float3 _2193 = float3(_638, _678, float(int(_634)));
    float3 _2195 = select(_2193, float3(0.0), isnan(_2193));
    float _686 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2195.xy, uint(rint(_2195.z)), _614);
    float3 _2204 = float3(_626, _678, float(int(_634)));
    float3 _2206 = select(_2204, float3(0.0), isnan(_2204));
    float _688 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2206.xy, uint(rint(_2206.z)), _614);
    float3 _2215 = float3(_622, _678, float(int(_634)));
    float3 _2217 = select(_2215, float3(0.0), isnan(_2215));
    float _690 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2217.xy, uint(rint(_2217.z)), _614);
    float2 _2223 = float2(_682, _684);
    float _692 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_2223, float2(0.0), isnan(_2223))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_2223, float2(0.0), isnan(_2223))).x;
    float _694 = _662 + _584;
    float _696 = -_66;
    float _698 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _700 = _696 + _698;
    float _702 = _694 * 0.0625;
    float _704 = _700 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _706 = precise::clamp(_704, 0.0, 1.0);
    float _708 = _650 + _648;
    float _710 = _708 + _652;
    float _712 = _710 + _654;
    float _714 = _712 + _656;
    float _716 = _714 + _658;
    float _718 = _716 + _664;
    float _720 = _718 + _666;
    float _722 = _720 + _670;
    float _724 = _722 + _672;
    float _726 = _724 + _674;
    float _728 = _726 + _676;
    float _730 = _728 + _680;
    float _732 = _730 + _686;
    float _734 = _732 + _688;
    float _736 = _734 + _690;
    float _738 = _736 * 0.0625;
    float _740 = _738 * (*spvDescriptorSet0.fp_c3)._m0[49].w;
    float _742 = fma(_702, (*spvDescriptorSet0.fp_c3)._m0[49].z, _740);
    float _744 = _706 + _742;
    out.m_43.x = _692;
    out.m_43.y = _660;
    out.m_43.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_43.w = _744;
    return out;
}

