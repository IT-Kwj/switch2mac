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
    constant _16* fp_c1 [[id(0)]];
    constant _16* fp_c3 [[id(1)]];
    texture2d<float> fp_t_tcb_8 [[id(2)]];
    sampler fp_t_tcb_8Smplr [[id(3)]];
    texture2d_array<float> fp_t_tcb_A [[id(4)]];
    sampler fp_t_tcb_ASmplr [[id(5)]];
    texture2d<float> fp_t_tcb_C [[id(6)]];
    sampler fp_t_tcb_CSmplr [[id(7)]];
    sampler fp_t_tcb_8Smplr_w [[id(8)]];
    sampler fp_t_tcb_CSmplr_w [[id(9)]];
    constant dm_border_t* dm_border [[id(10)]];
};

struct main0_out
{
    float4 m_41 [[color(0)]];
};

struct main0_in
{
    float4 m_38 [[user(locn0), center_no_perspective]];
    float4 m_36 [[user(locn1), center_no_perspective]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    bool _124 = false;
    bool _122 = false;
    float _48 = in.m_36.x;
    float _50 = in.m_36.y;
    float2 _448 = float2(_48, _50);
    float _52 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_448, float2(0.0), isnan(_448))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_448, float2(0.0), isnan(_448))).x;
    float _54 = in.m_38.y;
    float _56 = -_52;
    float _58 = fma(_56, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _60 = 1.0 / _58;
    float _62 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _64 = _60 * _62;
    float _66 = _64 * _54;
    float _68 = -_64;
    bool _72 = _68 > (*spvDescriptorSet0.fp_c3)._m0[40].x;
    float _74 = -_64;
    bool _76 = _74 > (*spvDescriptorSet0.fp_c3)._m0[39].x;
    float _78 = -_64;
    bool _80 = _78 > (*spvDescriptorSet0.fp_c3)._m0[41].x;
    bool _82 = !_72;
    int _85 = _82 ? 0 : 1;
    int _87 = 2;
    if (!_72)
    {
        _87 = 1;
    }
    int _89 = _87;
    int _91 = _89;
    if (!_76)
    {
        _91 = _85;
    }
    int _93 = _91;
    int _95 = _93 + 1;
    uint _98 = uint(_95);
    if (!_80)
    {
        _98 = uint(_93);
    }
    uint _100 = _98;
    uint _102 = min(_100, 2u);
    int _104 = int(_102) << 2;
    float _106 = in.m_38.x;
    uint _108 = uint(int(uint(_104) >> uint(2)));
    uint _110 = uint(int(uint(int(_108)) >> uint(2)));
    int _112 = int(_108) & 3;
    float _114 = (*spvDescriptorSet0.fp_c1)._m0[int(_110)][_112];
    float _116 = _64 * _106;
    bool _118 = as_type<int>(_114) == 416;
    if (!_118)
    {
        bool _120 = as_type<int>(_114) == 688;
        _122 = _120;
        if (!_122)
        {
            _124 = true;
        }
    }
    float _158;
    float _160;
    float _162;
    float _164;
    if (!_122)
    {
        if (!_124)
        {
            float _126 = _66 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
            float _128 = _66 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
            float _130 = _66 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _132 = _66 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
            float _134 = fma(_116, (*spvDescriptorSet0.fp_c3)._m0[0].x, _126);
            float _136 = fma(_116, (*spvDescriptorSet0.fp_c3)._m0[1].x, _128);
            float _138 = fma(_116, (*spvDescriptorSet0.fp_c3)._m0[2].x, _130);
            float _140 = fma(_116, (*spvDescriptorSet0.fp_c3)._m0[3].x, _132);
            float _142 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[0].z, _134);
            float _144 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[1].z, _136);
            float _146 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[2].z, _138);
            float _148 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[3].z, _140);
            float _150 = _142 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
            float _152 = _144 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
            float _154 = _146 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
            float _156 = _148 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
            _158 = _156;
            _160 = _154;
            _162 = _150;
            _164 = _152;
        }
    }
    if ((false || _124) || _122)
    {
        if ((!_124) || _122)
        {
            _122 = false;
            float _166 = _66 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
            float _168 = _66 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
            float _170 = _66 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
            float _172 = _66 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
            float _174 = fma(_116, (*spvDescriptorSet0.fp_c3)._m0[4].x, _166);
            float _176 = fma(_116, (*spvDescriptorSet0.fp_c3)._m0[5].x, _168);
            float _178 = fma(_116, (*spvDescriptorSet0.fp_c3)._m0[6].x, _170);
            float _180 = fma(_116, (*spvDescriptorSet0.fp_c3)._m0[7].x, _172);
            float _182 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[4].z, _174);
            float _184 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[5].z, _176);
            float _186 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[6].z, _178);
            float _188 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[7].z, _180);
            float _190 = _182 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
            float _192 = _184 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
            float _194 = _186 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
            float _196 = _188 + (*spvDescriptorSet0.fp_c3)._m0[7].w;
            _158 = _196;
            _160 = _194;
            _162 = _190;
            _164 = _192;
        }
        if (false || _124)
        {
            _124 = false;
            float _198 = _66 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
            float _200 = _66 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
            float _202 = _66 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
            float _204 = _66 * (*spvDescriptorSet0.fp_c3)._m0[11].y;
            float _206 = fma(_116, (*spvDescriptorSet0.fp_c3)._m0[8].x, _198);
            float _208 = fma(_116, (*spvDescriptorSet0.fp_c3)._m0[9].x, _200);
            float _210 = fma(_116, (*spvDescriptorSet0.fp_c3)._m0[10].x, _202);
            float _212 = fma(_116, (*spvDescriptorSet0.fp_c3)._m0[11].x, _204);
            float _214 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[8].z, _206);
            float _216 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[9].z, _208);
            float _218 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[10].z, _210);
            float _220 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[11].z, _212);
            float _222 = _214 + (*spvDescriptorSet0.fp_c3)._m0[8].w;
            float _224 = _216 + (*spvDescriptorSet0.fp_c3)._m0[9].w;
            float _226 = _218 + (*spvDescriptorSet0.fp_c3)._m0[10].w;
            float _228 = _220 + (*spvDescriptorSet0.fp_c3)._m0[11].w;
            _158 = _228;
            _160 = _226;
            _162 = _222;
            _164 = _224;
        }
    }
    float _230 = _158;
    float _232 = _160;
    float _234 = _162;
    float _236 = _164;
    float _238 = 1.0 / _230;
    float _240 = float(int(_100));
    float _242 = rint(_240);
    float _244 = precise::max(_242, 0.0);
    uint _246 = uint(_244);
    uint _248 = clamp(_246, 0u, 65535u);
    float _250 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _252 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _254 = _238 * _232;
    float _256 = precise::clamp(_254, 0.0, 1.0);
    float _258 = _238 * _234;
    float _260 = _238 * _236;
    float _262 = _256 * _250;
    float _264 = _256 * _252;
    float _266 = fma(_262, 0.5, _258);
    float _268 = fma(_264, 0.5, _260);
    float _270 = fma(_262, 1.5, _258);
    float _272 = fma(_262, -0.5, _258);
    float _274 = fma(_262, -1.5, _258);
    float _276 = fma(_264, 1.5, _260);
    float _278 = fma(_264, -0.5, _260);
    float3 _913 = float3(_266, _276, float(int(_248)));
    float3 _917 = select(_913, float3(0.0), isnan(_913));
    float _280 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _917.xy, uint(rint(_917.z)), _256);
    float3 _926 = float3(_270, _268, float(int(_248)));
    float3 _928 = select(_926, float3(0.0), isnan(_926));
    float _282 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _928.xy, uint(rint(_928.z)), _256);
    float3 _937 = float3(_266, _268, float(int(_248)));
    float3 _939 = select(_937, float3(0.0), isnan(_937));
    float _284 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _939.xy, uint(rint(_939.z)), _256);
    float3 _948 = float3(_272, _268, float(int(_248)));
    float3 _950 = select(_948, float3(0.0), isnan(_948));
    float _286 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _950.xy, uint(rint(_950.z)), _256);
    float3 _959 = float3(_274, _268, float(int(_248)));
    float3 _961 = select(_959, float3(0.0), isnan(_959));
    float _288 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _961.xy, uint(rint(_961.z)), _256);
    float3 _970 = float3(_270, _278, float(int(_248)));
    float3 _972 = select(_970, float3(0.0), isnan(_970));
    float _290 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _972.xy, uint(rint(_972.z)), _256);
    float3 _981 = float3(_272, _276, float(int(_248)));
    float3 _983 = select(_981, float3(0.0), isnan(_981));
    float _292 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _983.xy, uint(rint(_983.z)), _256);
    float3 _992 = float3(_274, _276, float(int(_248)));
    float3 _994 = select(_992, float3(0.0), isnan(_992));
    float _294 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _994.xy, uint(rint(_994.z)), _256);
    float3 _1003 = float3(_270, _276, float(int(_248)));
    float3 _1005 = select(_1003, float3(0.0), isnan(_1003));
    float _296 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1005.xy, uint(rint(_1005.z)), _256);
    float3 _1014 = float3(_266, _278, float(int(_248)));
    float3 _1016 = select(_1014, float3(0.0), isnan(_1014));
    float _298 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1016.xy, uint(rint(_1016.z)), _256);
    float3 _1025 = float3(_272, _278, float(int(_248)));
    float3 _1027 = select(_1025, float3(0.0), isnan(_1025));
    float _300 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1027.xy, uint(rint(_1027.z)), _256);
    float3 _1036 = float3(_274, _278, float(int(_248)));
    float3 _1038 = select(_1036, float3(0.0), isnan(_1036));
    float _302 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1038.xy, uint(rint(_1038.z)), _256);
    float _304 = _66 * (*spvDescriptorSet0.fp_c3)._m0[15].y;
    float _306 = fma(_264, -1.5, _260);
    float _308 = fma(_116, (*spvDescriptorSet0.fp_c3)._m0[15].x, _304);
    float _310 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[15].z, _308);
    float _312 = _310 + (*spvDescriptorSet0.fp_c3)._m0[15].w;
    float _314 = _66 * (*spvDescriptorSet0.fp_c3)._m0[12].y;
    float _316 = _66 * (*spvDescriptorSet0.fp_c3)._m0[13].y;
    float _318 = 1.0 / _312;
    float _320 = fma(_116, (*spvDescriptorSet0.fp_c3)._m0[12].x, _314);
    float _322 = fma(_116, (*spvDescriptorSet0.fp_c3)._m0[13].x, _316);
    float _324 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[12].z, _320);
    float _326 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[13].z, _322);
    float _328 = _324 + (*spvDescriptorSet0.fp_c3)._m0[12].w;
    float _330 = _326 + (*spvDescriptorSet0.fp_c3)._m0[13].w;
    float _332 = _328 * _318;
    float _334 = _330 * _318;
    float2 _1112 = float2(_332, _334);
    float2 _338 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_1112, float2(0.0), isnan(_1112))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_1112, float2(0.0), isnan(_1112))).xy;
    float _340 = _338.x;
    float _342 = _338.y;
    float3 _1127 = float3(_270, _306, float(int(_248)));
    float3 _1129 = select(_1127, float3(0.0), isnan(_1127));
    float _344 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1129.xy, uint(rint(_1129.z)), _256);
    float3 _1138 = float3(_266, _306, float(int(_248)));
    float3 _1140 = select(_1138, float3(0.0), isnan(_1138));
    float _346 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1140.xy, uint(rint(_1140.z)), _256);
    float3 _1149 = float3(_272, _306, float(int(_248)));
    float3 _1151 = select(_1149, float3(0.0), isnan(_1149));
    float _348 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1151.xy, uint(rint(_1151.z)), _256);
    float3 _1160 = float3(_274, _306, float(int(_248)));
    float3 _1162 = select(_1160, float3(0.0), isnan(_1160));
    float _350 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1162.xy, uint(rint(_1162.z)), _256);
    float _352 = _66 * (*spvDescriptorSet0.fp_c3)._m0[14].y;
    float _354 = fma(_116, (*spvDescriptorSet0.fp_c3)._m0[14].x, _352);
    float _356 = -_64;
    float _358 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _360 = _356 + _358;
    float _362 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[14].z, _354);
    float _364 = _360 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _366 = precise::clamp(_364, 0.0, 1.0);
    float _368 = _362 + (*spvDescriptorSet0.fp_c3)._m0[14].w;
    float _370 = precise::min(_368, 1.0);
    float _372 = _296 + _280;
    float _374 = _372 + _292;
    float _376 = _374 + _294;
    float _378 = _376 + _282;
    float _380 = _378 + _284;
    float _382 = _380 + _286;
    float _384 = _382 + _288;
    float _386 = _384 + _290;
    float _388 = _386 + _298;
    float _390 = _388 + _300;
    float _392 = _390 + _302;
    float _394 = -_64;
    float _396 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _398 = _394 + _396;
    float _400 = _398 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _402 = precise::clamp(_400, 0.0, 1.0);
    float _404 = -_340;
    float _406 = fma(_404, _340, _342);
    float _408 = -_340;
    float _410 = _370 + _408;
    float _412 = fma(_410, _410, _406);
    float _414 = _392 + _344;
    bool _416 = _410 <= 0.001000000047497451305389404296875;
    float _418 = float(_416);
    float _420 = 1.0 / _412;
    float _422 = _414 + _346;
    float _424 = _422 + _348;
    float _426 = _406 * _420;
    float _428 = precise::max(_426, _418);
    float _430 = _424 + _350;
    float _432 = precise::min(_428, 1.0);
    float _434 = fma(_430, 0.0625, _366);
    float _436 = _432 + _402;
    out.m_41.x = (*spvDescriptorSet0.fp_c3)._m0[34].x;
    out.m_41.y = _434;
    out.m_41.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_41.w = _436;
    return out;
}

