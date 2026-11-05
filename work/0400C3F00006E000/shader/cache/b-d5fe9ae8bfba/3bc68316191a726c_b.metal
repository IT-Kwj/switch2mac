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
    texture2d<float> fp_t_tcb_A [[id(1)]];
    sampler fp_t_tcb_ASmplr [[id(2)]];
    texture2d_array<float> fp_t_tcb_8 [[id(3)]];
    sampler fp_t_tcb_8Smplr [[id(4)]];
    sampler fp_t_tcb_ASmplr_w [[id(5)]];
    constant dm_border_t* dm_border [[id(6)]];
};

struct main0_out
{
    float4 m_41 [[color(0)]];
};

struct main0_in
{
    float4 m_36 [[user(locn0)]];
    float4 m_38 [[user(locn1)]];
    float4 m_34 [[user(locn2)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _48 = gl_FragCoord.w;
    float _50 = in.m_34.x;
    float _52 = gl_FragCoord.w;
    float _54 = _50 * _52;
    float _56 = in.m_34.y;
    float _58 = gl_FragCoord.w;
    float _60 = _56 * _58;
    float _62 = 1.0 / _48;
    float _64 = _62 * _54;
    float _66 = _62 * _60;
    float2 _516 = float2(_64, _66);
    float _68 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_516, float2(0.0), isnan(_516))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_516, float2(0.0), isnan(_516))).x;
    float _70 = (*spvDescriptorSet0.fp_c3)._m0[7].z * (*spvDescriptorSet0.fp_c3)._m0[8].x;
    float _72 = 1.0 / _70;
    float _74 = -_68;
    float _76 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[8].w, 1.0);
    float _78 = float(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[9].x));
    float _80 = 1.0 / _76;
    float _82 = -(*spvDescriptorSet0.fp_c3)._m0[7].w;
    float _84 = fma(_80, (*spvDescriptorSet0.fp_c3)._m0[8].y, _82);
    float _86 = 1.0 / (*spvDescriptorSet0.fp_c3)._m0[8].z;
    float _88 = _84 * _72;
    float _90 = _88 * (*spvDescriptorSet0.fp_c3)._m0[8].x;
    float _92 = abs(_90);
    float _94 = log2(_92);
    float _96 = _94 * _86;
    float _98 = exp2(_96);
    float _100 = _78 * _98;
    float _102 = precise::min(_78, _100);
    float _104 = trunc(_102);
    int _107 = int(_104);
    bool _111 = _107 > 0;
    int _113 = as_type<int>(_72);
    if (!_111)
    {
        _113 = 0;
    }
    int _115 = _113;
    bool _117 = !_111;
    int _119 = _115;
    if (!_117)
    {
        float _121 = in.m_36.x;
        float _123 = gl_FragCoord.w;
        float _125 = _121 * _123;
        float _127 = float(as_type<uint>((*spvDescriptorSet0.fp_c3)._m0[16].x));
        float _129 = in.m_36.y;
        float _131 = gl_FragCoord.w;
        float _133 = _129 * _131;
        int _135 = abs(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[16].y));
        float _137 = in.m_36.z;
        float _139 = gl_FragCoord.w;
        float _141 = _137 * _139;
        float _143 = float(0u);
        float _145 = 1.0 / _127;
        float _147 = float(uint(_135));
        int _149 = ~_135;
        int _151 = _149 + 1;
        float _153 = 1.0 / _147;
        int _155 = as_type<int>(_145) + (-2);
        int _157 = ~as_type<int>((*spvDescriptorSet0.fp_c3)._m0[16].x);
        int _159 = _157 + 1;
        float _161 = as_type<float>(_155) * _143;
        int _163 = as_type<int>(_153) + (-2);
        int _165 = ~_135;
        int _167 = _165 + 1;
        float _169 = trunc(_161);
        float _171 = precise::max(_169, 0.0);
        uint _174 = uint(_171);
        float _176 = _143 * as_type<float>(_163);
        float _178 = trunc(_176);
        float _180 = precise::max(_178, 0.0);
        uint _182 = uint(_180);
        int _184 = _159 * int(_174);
        float _186 = float(uint(_184));
        int _188 = _167 * int(_182);
        float _190 = as_type<float>(_155) * _186;
        int _192 = ~as_type<int>((*spvDescriptorSet0.fp_c3)._m0[16].x);
        int _194 = _192 + 1;
        float _196 = float(uint(_188));
        float _198 = trunc(_190);
        float _200 = precise::max(_198, 0.0);
        uint _202 = uint(_200);
        float _204 = as_type<float>(_163) * _196;
        float _206 = in.m_38.z;
        float _208 = gl_FragCoord.w;
        float _210 = _206 * _208;
        float _212 = trunc(_204);
        float _214 = precise::max(_212, 0.0);
        uint _216 = uint(_214);
        int _218 = int(_174) + int(_202);
        float _220 = in.m_38.y;
        float _222 = gl_FragCoord.w;
        float _224 = _220 * _222;
        uint _226 = uint(int(uint(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[16].y)) >> uint(31)));
        int _228 = _194 * _218;
        int _230 = int(_182) + int(_216);
        bool _232 = uint(_228) >= as_type<uint>((*spvDescriptorSet0.fp_c3)._m0[16].x);
        float _234 = in.m_38.w;
        float _236 = gl_FragCoord.w;
        float _238 = _234 * _236;
        float _240 = in.m_38.x;
        float _242 = gl_FragCoord.w;
        float _244 = _240 * _242;
        int _246 = _151 * _230;
        bool _248 = !_232;
        int _250 = _248 ? 0 : (-1);
        int _252 = ~_218;
        int _254 = _252 + _250;
        int _256 = _254 + 1;
        bool _258 = uint(_246) >= uint(_135);
        float _260 = _62 * _210;
        int _262 = ~int(_226);
        int _264 = _262 + 1;
        int _266 = _256 * as_type<int>((*spvDescriptorSet0.fp_c3)._m0[16].x);
        bool _268 = !_258;
        int _270 = _268 ? 0 : (-1);
        bool _272 = 0 == as_type<int>((*spvDescriptorSet0.fp_c3)._m0[16].x);
        int _274 = ~_270;
        int _276 = _230 + _274;
        int _278 = _276 + 1;
        bool _280 = !_272;
        int _282 = _280 ? _266 : (-1);
        int _284 = _278 ^ _264;
        float _286 = float(_282);
        float _288 = _62 * _224;
        bool _290 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[16].y) == 0;
        int _292 = ~_264;
        int _294 = _292 + _284;
        int _296 = _294 + 1;
        float _298 = _62 * _133;
        float _300 = rint(_286);
        float _302 = precise::max(_300, 0.0);
        uint _304 = uint(_302);
        uint _306 = clamp(_304, 0u, 65535u);
        bool _308 = !_290;
        int _310 = _308 ? _296 : (-1);
        float _312 = _62 * _238;
        float _314 = _62 * _244;
        float _316 = _62 * _125;
        float _318 = _62 * _141;
        float _320 = float(_310);
        float _322 = 0.0;
        int _324 = 0;
        float _326 = 0.0;
        bool _328;
        float _480;
        do
        {
            float _330 = _322;
            int _332 = _324;
            float _334 = _326;
            float _336 = _330 * (*spvDescriptorSet0.fp_c3)._m0[8].x;
            float _338 = abs(_336);
            float _340 = log2(_338);
            float _342 = _340 * (*spvDescriptorSet0.fp_c3)._m0[8].z;
            float _344 = exp2(_342);
            float _346 = fma(_344, _298, _288);
            float _348 = fma(_344, _316, _314);
            float _350 = fma(_344, _318, _260);
            float _352 = _346 * (*spvDescriptorSet0.fp_c3)._m0[13].y;
            float _354 = _346 * (*spvDescriptorSet0.fp_c3)._m0[11].y;
            float _356 = fma(_348, (*spvDescriptorSet0.fp_c3)._m0[13].x, _352);
            float _358 = fma(_348, (*spvDescriptorSet0.fp_c3)._m0[11].x, _354);
            float _360 = fma(_350, (*spvDescriptorSet0.fp_c3)._m0[13].z, _356);
            float _362 = _346 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
            float _364 = _346 * (*spvDescriptorSet0.fp_c3)._m0[12].y;
            float _366 = fma(_312, (*spvDescriptorSet0.fp_c3)._m0[13].w, _360);
            float _368 = fma(_348, (*spvDescriptorSet0.fp_c3)._m0[10].x, _362);
            float _370 = fma(_348, (*spvDescriptorSet0.fp_c3)._m0[12].x, _364);
            float _372 = fma(_350, (*spvDescriptorSet0.fp_c3)._m0[11].z, _358);
            float _374 = 1.0 / _366;
            float _376 = fma(_350, (*spvDescriptorSet0.fp_c3)._m0[10].z, _368);
            float _378 = fma(_350, (*spvDescriptorSet0.fp_c3)._m0[12].z, _370);
            float _380 = fma(_312, (*spvDescriptorSet0.fp_c3)._m0[11].w, _372);
            float _382 = fma(_312, (*spvDescriptorSet0.fp_c3)._m0[10].w, _376);
            float _384 = fma(_312, (*spvDescriptorSet0.fp_c3)._m0[12].w, _378);
            float _386 = _382 * _374;
            float _388 = _380 * _374;
            float _390 = _384 * _374;
            float _392 = fma((*spvDescriptorSet0.fp_c3)._m0[15].w, -0.5, _388);
            float _394 = fma((*spvDescriptorSet0.fp_c3)._m0[15].z, -0.5, _386);
            float _396 = fma((*spvDescriptorSet0.fp_c3)._m0[15].z, 0.5, _386);
            float _398 = fma((*spvDescriptorSet0.fp_c3)._m0[15].z, 1.5, _386);
            float _400 = fma(-1.5, (*spvDescriptorSet0.fp_c3)._m0[15].z, _386);
            float _402 = fma(-1.5, (*spvDescriptorSet0.fp_c3)._m0[15].w, _388);
            float3 _1035 = float3(_400, _402, float(int(_306)));
            float3 _1039 = select(_1035, float3(0.0), isnan(_1035));
            float _404 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, _1039.xy, uint(rint(_1039.z)), _390, level(_320));
            float3 _1049 = float3(_394, _402, float(int(_306)));
            float3 _1051 = select(_1049, float3(0.0), isnan(_1049));
            float _406 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, _1051.xy, uint(rint(_1051.z)), _390, level(_320));
            float3 _1061 = float3(_396, _402, float(int(_306)));
            float3 _1063 = select(_1061, float3(0.0), isnan(_1061));
            float _408 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, _1063.xy, uint(rint(_1063.z)), _390, level(_320));
            float3 _1073 = float3(_398, _402, float(int(_306)));
            float3 _1075 = select(_1073, float3(0.0), isnan(_1073));
            float _410 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, _1075.xy, uint(rint(_1075.z)), _390, level(_320));
            float3 _1085 = float3(_400, _392, float(int(_306)));
            float3 _1087 = select(_1085, float3(0.0), isnan(_1085));
            float _412 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, _1087.xy, uint(rint(_1087.z)), _390, level(_320));
            float3 _1097 = float3(_394, _392, float(int(_306)));
            float3 _1099 = select(_1097, float3(0.0), isnan(_1097));
            float _414 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, _1099.xy, uint(rint(_1099.z)), _390, level(_320));
            float _416 = fma((*spvDescriptorSet0.fp_c3)._m0[15].w, 0.5, _388);
            float3 _1113 = float3(_396, _392, float(int(_306)));
            float3 _1115 = select(_1113, float3(0.0), isnan(_1113));
            float _418 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, _1115.xy, uint(rint(_1115.z)), _390, level(_320));
            float3 _1125 = float3(_398, _392, float(int(_306)));
            float3 _1127 = select(_1125, float3(0.0), isnan(_1125));
            float _420 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, _1127.xy, uint(rint(_1127.z)), _390, level(_320));
            float3 _1137 = float3(_400, _416, float(int(_306)));
            float3 _1139 = select(_1137, float3(0.0), isnan(_1137));
            float _422 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, _1139.xy, uint(rint(_1139.z)), _390, level(_320));
            float3 _1149 = float3(_394, _416, float(int(_306)));
            float3 _1151 = select(_1149, float3(0.0), isnan(_1149));
            float _424 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, _1151.xy, uint(rint(_1151.z)), _390, level(_320));
            float3 _1161 = float3(_396, _416, float(int(_306)));
            float3 _1163 = select(_1161, float3(0.0), isnan(_1161));
            float _426 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, _1163.xy, uint(rint(_1163.z)), _390, level(_320));
            float _428 = fma((*spvDescriptorSet0.fp_c3)._m0[15].w, 1.5, _388);
            float3 _1177 = float3(_398, _416, float(int(_306)));
            float3 _1179 = select(_1177, float3(0.0), isnan(_1177));
            float _430 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, _1179.xy, uint(rint(_1179.z)), _390, level(_320));
            float3 _1189 = float3(_400, _428, float(int(_306)));
            float3 _1191 = select(_1189, float3(0.0), isnan(_1189));
            float _432 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, _1191.xy, uint(rint(_1191.z)), _390, level(_320));
            float3 _1201 = float3(_394, _428, float(int(_306)));
            float3 _1203 = select(_1201, float3(0.0), isnan(_1201));
            float _434 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, _1203.xy, uint(rint(_1203.z)), _390, level(_320));
            float3 _1213 = float3(_396, _428, float(int(_306)));
            float3 _1215 = select(_1213, float3(0.0), isnan(_1213));
            float _436 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, _1215.xy, uint(rint(_1215.z)), _390, level(_320));
            float3 _1225 = float3(_398, _428, float(int(_306)));
            float3 _1227 = select(_1225, float3(0.0), isnan(_1225));
            float _438 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, _1227.xy, uint(rint(_1227.z)), _390, level(_320));
            int _440 = _332 + 1;
            float _442 = _330 + 1.0;
            bool _444 = _440 >= _107;
            float _446 = _404 + _406;
            float _448 = _446 + _408;
            float _450 = _448 + _410;
            float _452 = _450 + _412;
            float _454 = _452 + _414;
            float _456 = _454 + _418;
            float _458 = _456 + _420;
            float _460 = _458 + _422;
            float _462 = _460 + _424;
            float _464 = _462 + _426;
            float _466 = _464 + _430;
            float _468 = _466 + _432;
            float _470 = _468 + _434;
            float _472 = _470 + _436;
            float _474 = _472 + _438;
            float _476 = _474 * 0.0625;
            float _478 = fma(_476, (*spvDescriptorSet0.fp_c3)._m0[15].x, (*spvDescriptorSet0.fp_c3)._m0[15].y);
            _480 = fma(_478, (*spvDescriptorSet0.fp_c3)._m0[8].x, _334);
            _328 = !_444;
            _322 = _442;
            _324 = _440;
            _326 = _480;
        } while (_328);
        _119 = as_type<int>(_480);
    }
    int _482 = _119;
    out.m_41.x = as_type<float>(_482);
    out.m_41.y = as_type<float>(_482);
    out.m_41.z = as_type<float>(_482);
    return out;
}


struct main0_out_u
{
    uint4 m_41 [[color(0)]];
};

fragment main0_out_u main0_u(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _48 = gl_FragCoord.w;
    float _50 = in.m_34.x;
    float _52 = gl_FragCoord.w;
    float _54 = _50 * _52;
    float _56 = in.m_34.y;
    float _58 = gl_FragCoord.w;
    float _60 = _56 * _58;
    float _62 = 1.0 / _48;
    float _64 = _62 * _54;
    float _66 = _62 * _60;
    float2 _516 = float2(_64, _66);
    float _68 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_516, float2(0.0), isnan(_516))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_516, float2(0.0), isnan(_516))).x;
    float _70 = (*spvDescriptorSet0.fp_c3)._m0[7].z * (*spvDescriptorSet0.fp_c3)._m0[8].x;
    float _72 = 1.0 / _70;
    float _74 = -_68;
    float _76 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[8].w, 1.0);
    float _78 = float(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[9].x));
    float _80 = 1.0 / _76;
    float _82 = -(*spvDescriptorSet0.fp_c3)._m0[7].w;
    float _84 = fma(_80, (*spvDescriptorSet0.fp_c3)._m0[8].y, _82);
    float _86 = 1.0 / (*spvDescriptorSet0.fp_c3)._m0[8].z;
    float _88 = _84 * _72;
    float _90 = _88 * (*spvDescriptorSet0.fp_c3)._m0[8].x;
    float _92 = abs(_90);
    float _94 = log2(_92);
    float _96 = _94 * _86;
    float _98 = exp2(_96);
    float _100 = _78 * _98;
    float _102 = precise::min(_78, _100);
    float _104 = trunc(_102);
    int _107 = int(_104);
    bool _111 = _107 > 0;
    int _113 = as_type<int>(_72);
    if (!_111)
    {
        _113 = 0;
    }
    int _115 = _113;
    bool _117 = !_111;
    int _119 = _115;
    if (!_117)
    {
        float _121 = in.m_36.x;
        float _123 = gl_FragCoord.w;
        float _125 = _121 * _123;
        float _127 = float(as_type<uint>((*spvDescriptorSet0.fp_c3)._m0[16].x));
        float _129 = in.m_36.y;
        float _131 = gl_FragCoord.w;
        float _133 = _129 * _131;
        int _135 = abs(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[16].y));
        float _137 = in.m_36.z;
        float _139 = gl_FragCoord.w;
        float _141 = _137 * _139;
        float _143 = float(0u);
        float _145 = 1.0 / _127;
        float _147 = float(uint(_135));
        int _149 = ~_135;
        int _151 = _149 + 1;
        float _153 = 1.0 / _147;
        int _155 = as_type<int>(_145) + (-2);
        int _157 = ~as_type<int>((*spvDescriptorSet0.fp_c3)._m0[16].x);
        int _159 = _157 + 1;
        float _161 = as_type<float>(_155) * _143;
        int _163 = as_type<int>(_153) + (-2);
        int _165 = ~_135;
        int _167 = _165 + 1;
        float _169 = trunc(_161);
        float _171 = precise::max(_169, 0.0);
        uint _174 = uint(_171);
        float _176 = _143 * as_type<float>(_163);
        float _178 = trunc(_176);
        float _180 = precise::max(_178, 0.0);
        uint _182 = uint(_180);
        int _184 = _159 * int(_174);
        float _186 = float(uint(_184));
        int _188 = _167 * int(_182);
        float _190 = as_type<float>(_155) * _186;
        int _192 = ~as_type<int>((*spvDescriptorSet0.fp_c3)._m0[16].x);
        int _194 = _192 + 1;
        float _196 = float(uint(_188));
        float _198 = trunc(_190);
        float _200 = precise::max(_198, 0.0);
        uint _202 = uint(_200);
        float _204 = as_type<float>(_163) * _196;
        float _206 = in.m_38.z;
        float _208 = gl_FragCoord.w;
        float _210 = _206 * _208;
        float _212 = trunc(_204);
        float _214 = precise::max(_212, 0.0);
        uint _216 = uint(_214);
        int _218 = int(_174) + int(_202);
        float _220 = in.m_38.y;
        float _222 = gl_FragCoord.w;
        float _224 = _220 * _222;
        uint _226 = uint(int(uint(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[16].y)) >> uint(31)));
        int _228 = _194 * _218;
        int _230 = int(_182) + int(_216);
        bool _232 = uint(_228) >= as_type<uint>((*spvDescriptorSet0.fp_c3)._m0[16].x);
        float _234 = in.m_38.w;
        float _236 = gl_FragCoord.w;
        float _238 = _234 * _236;
        float _240 = in.m_38.x;
        float _242 = gl_FragCoord.w;
        float _244 = _240 * _242;
        int _246 = _151 * _230;
        bool _248 = !_232;
        int _250 = _248 ? 0 : (-1);
        int _252 = ~_218;
        int _254 = _252 + _250;
        int _256 = _254 + 1;
        bool _258 = uint(_246) >= uint(_135);
        float _260 = _62 * _210;
        int _262 = ~int(_226);
        int _264 = _262 + 1;
        int _266 = _256 * as_type<int>((*spvDescriptorSet0.fp_c3)._m0[16].x);
        bool _268 = !_258;
        int _270 = _268 ? 0 : (-1);
        bool _272 = 0 == as_type<int>((*spvDescriptorSet0.fp_c3)._m0[16].x);
        int _274 = ~_270;
        int _276 = _230 + _274;
        int _278 = _276 + 1;
        bool _280 = !_272;
        int _282 = _280 ? _266 : (-1);
        int _284 = _278 ^ _264;
        float _286 = float(_282);
        float _288 = _62 * _224;
        bool _290 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[16].y) == 0;
        int _292 = ~_264;
        int _294 = _292 + _284;
        int _296 = _294 + 1;
        float _298 = _62 * _133;
        float _300 = rint(_286);
        float _302 = precise::max(_300, 0.0);
        uint _304 = uint(_302);
        uint _306 = clamp(_304, 0u, 65535u);
        bool _308 = !_290;
        int _310 = _308 ? _296 : (-1);
        float _312 = _62 * _238;
        float _314 = _62 * _244;
        float _316 = _62 * _125;
        float _318 = _62 * _141;
        float _320 = float(_310);
        float _322 = 0.0;
        int _324 = 0;
        float _326 = 0.0;
        bool _328;
        float _480;
        do
        {
            float _330 = _322;
            int _332 = _324;
            float _334 = _326;
            float _336 = _330 * (*spvDescriptorSet0.fp_c3)._m0[8].x;
            float _338 = abs(_336);
            float _340 = log2(_338);
            float _342 = _340 * (*spvDescriptorSet0.fp_c3)._m0[8].z;
            float _344 = exp2(_342);
            float _346 = fma(_344, _298, _288);
            float _348 = fma(_344, _316, _314);
            float _350 = fma(_344, _318, _260);
            float _352 = _346 * (*spvDescriptorSet0.fp_c3)._m0[13].y;
            float _354 = _346 * (*spvDescriptorSet0.fp_c3)._m0[11].y;
            float _356 = fma(_348, (*spvDescriptorSet0.fp_c3)._m0[13].x, _352);
            float _358 = fma(_348, (*spvDescriptorSet0.fp_c3)._m0[11].x, _354);
            float _360 = fma(_350, (*spvDescriptorSet0.fp_c3)._m0[13].z, _356);
            float _362 = _346 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
            float _364 = _346 * (*spvDescriptorSet0.fp_c3)._m0[12].y;
            float _366 = fma(_312, (*spvDescriptorSet0.fp_c3)._m0[13].w, _360);
            float _368 = fma(_348, (*spvDescriptorSet0.fp_c3)._m0[10].x, _362);
            float _370 = fma(_348, (*spvDescriptorSet0.fp_c3)._m0[12].x, _364);
            float _372 = fma(_350, (*spvDescriptorSet0.fp_c3)._m0[11].z, _358);
            float _374 = 1.0 / _366;
            float _376 = fma(_350, (*spvDescriptorSet0.fp_c3)._m0[10].z, _368);
            float _378 = fma(_350, (*spvDescriptorSet0.fp_c3)._m0[12].z, _370);
            float _380 = fma(_312, (*spvDescriptorSet0.fp_c3)._m0[11].w, _372);
            float _382 = fma(_312, (*spvDescriptorSet0.fp_c3)._m0[10].w, _376);
            float _384 = fma(_312, (*spvDescriptorSet0.fp_c3)._m0[12].w, _378);
            float _386 = _382 * _374;
            float _388 = _380 * _374;
            float _390 = _384 * _374;
            float _392 = fma((*spvDescriptorSet0.fp_c3)._m0[15].w, -0.5, _388);
            float _394 = fma((*spvDescriptorSet0.fp_c3)._m0[15].z, -0.5, _386);
            float _396 = fma((*spvDescriptorSet0.fp_c3)._m0[15].z, 0.5, _386);
            float _398 = fma((*spvDescriptorSet0.fp_c3)._m0[15].z, 1.5, _386);
            float _400 = fma(-1.5, (*spvDescriptorSet0.fp_c3)._m0[15].z, _386);
            float _402 = fma(-1.5, (*spvDescriptorSet0.fp_c3)._m0[15].w, _388);
            float3 _1035 = float3(_400, _402, float(int(_306)));
            float3 _1039 = select(_1035, float3(0.0), isnan(_1035));
            float _404 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, _1039.xy, uint(rint(_1039.z)), _390, level(_320));
            float3 _1049 = float3(_394, _402, float(int(_306)));
            float3 _1051 = select(_1049, float3(0.0), isnan(_1049));
            float _406 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, _1051.xy, uint(rint(_1051.z)), _390, level(_320));
            float3 _1061 = float3(_396, _402, float(int(_306)));
            float3 _1063 = select(_1061, float3(0.0), isnan(_1061));
            float _408 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, _1063.xy, uint(rint(_1063.z)), _390, level(_320));
            float3 _1073 = float3(_398, _402, float(int(_306)));
            float3 _1075 = select(_1073, float3(0.0), isnan(_1073));
            float _410 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, _1075.xy, uint(rint(_1075.z)), _390, level(_320));
            float3 _1085 = float3(_400, _392, float(int(_306)));
            float3 _1087 = select(_1085, float3(0.0), isnan(_1085));
            float _412 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, _1087.xy, uint(rint(_1087.z)), _390, level(_320));
            float3 _1097 = float3(_394, _392, float(int(_306)));
            float3 _1099 = select(_1097, float3(0.0), isnan(_1097));
            float _414 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, _1099.xy, uint(rint(_1099.z)), _390, level(_320));
            float _416 = fma((*spvDescriptorSet0.fp_c3)._m0[15].w, 0.5, _388);
            float3 _1113 = float3(_396, _392, float(int(_306)));
            float3 _1115 = select(_1113, float3(0.0), isnan(_1113));
            float _418 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, _1115.xy, uint(rint(_1115.z)), _390, level(_320));
            float3 _1125 = float3(_398, _392, float(int(_306)));
            float3 _1127 = select(_1125, float3(0.0), isnan(_1125));
            float _420 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, _1127.xy, uint(rint(_1127.z)), _390, level(_320));
            float3 _1137 = float3(_400, _416, float(int(_306)));
            float3 _1139 = select(_1137, float3(0.0), isnan(_1137));
            float _422 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, _1139.xy, uint(rint(_1139.z)), _390, level(_320));
            float3 _1149 = float3(_394, _416, float(int(_306)));
            float3 _1151 = select(_1149, float3(0.0), isnan(_1149));
            float _424 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, _1151.xy, uint(rint(_1151.z)), _390, level(_320));
            float3 _1161 = float3(_396, _416, float(int(_306)));
            float3 _1163 = select(_1161, float3(0.0), isnan(_1161));
            float _426 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, _1163.xy, uint(rint(_1163.z)), _390, level(_320));
            float _428 = fma((*spvDescriptorSet0.fp_c3)._m0[15].w, 1.5, _388);
            float3 _1177 = float3(_398, _416, float(int(_306)));
            float3 _1179 = select(_1177, float3(0.0), isnan(_1177));
            float _430 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, _1179.xy, uint(rint(_1179.z)), _390, level(_320));
            float3 _1189 = float3(_400, _428, float(int(_306)));
            float3 _1191 = select(_1189, float3(0.0), isnan(_1189));
            float _432 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, _1191.xy, uint(rint(_1191.z)), _390, level(_320));
            float3 _1201 = float3(_394, _428, float(int(_306)));
            float3 _1203 = select(_1201, float3(0.0), isnan(_1201));
            float _434 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, _1203.xy, uint(rint(_1203.z)), _390, level(_320));
            float3 _1213 = float3(_396, _428, float(int(_306)));
            float3 _1215 = select(_1213, float3(0.0), isnan(_1213));
            float _436 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, _1215.xy, uint(rint(_1215.z)), _390, level(_320));
            float3 _1225 = float3(_398, _428, float(int(_306)));
            float3 _1227 = select(_1225, float3(0.0), isnan(_1225));
            float _438 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, _1227.xy, uint(rint(_1227.z)), _390, level(_320));
            int _440 = _332 + 1;
            float _442 = _330 + 1.0;
            bool _444 = _440 >= _107;
            float _446 = _404 + _406;
            float _448 = _446 + _408;
            float _450 = _448 + _410;
            float _452 = _450 + _412;
            float _454 = _452 + _414;
            float _456 = _454 + _418;
            float _458 = _456 + _420;
            float _460 = _458 + _422;
            float _462 = _460 + _424;
            float _464 = _462 + _426;
            float _466 = _464 + _430;
            float _468 = _466 + _432;
            float _470 = _468 + _434;
            float _472 = _470 + _436;
            float _474 = _472 + _438;
            float _476 = _474 * 0.0625;
            float _478 = fma(_476, (*spvDescriptorSet0.fp_c3)._m0[15].x, (*spvDescriptorSet0.fp_c3)._m0[15].y);
            _480 = fma(_478, (*spvDescriptorSet0.fp_c3)._m0[8].x, _334);
            _328 = !_444;
            _322 = _442;
            _324 = _440;
            _326 = _480;
        } while (_328);
        _119 = as_type<int>(_480);
    }
    int _482 = _119;
    out.m_41.x = as_type<float>(_482);
    out.m_41.y = as_type<float>(_482);
    out.m_41.z = as_type<float>(_482);
    return main0_out_u{as_type<uint4>(out.m_41)};
}

