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
    bool _120 = false;
    bool _118 = false;
    float _48 = in.m_36.x;
    float _50 = in.m_36.y;
    float2 _444 = float2(_48, _50);
    float _52 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_444, float2(0.0), isnan(_444))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_444, float2(0.0), isnan(_444))).x;
    float _54 = in.m_38.y;
    float _56 = -_52;
    float _58 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _60 = fma(_56, (*spvDescriptorSet0.fp_c3)._m0[46].z, _58);
    float _62 = _60 * _54;
    float _64 = -_60;
    bool _68 = _64 > (*spvDescriptorSet0.fp_c3)._m0[40].x;
    float _70 = -_60;
    bool _72 = _70 > (*spvDescriptorSet0.fp_c3)._m0[39].x;
    float _74 = -_60;
    bool _76 = _74 > (*spvDescriptorSet0.fp_c3)._m0[41].x;
    bool _78 = !_68;
    int _81 = _78 ? 0 : 1;
    int _83 = 2;
    if (!_68)
    {
        _83 = 1;
    }
    int _85 = _83;
    int _87 = _85;
    if (!_72)
    {
        _87 = _81;
    }
    int _89 = _87;
    int _91 = _89 + 1;
    uint _94 = uint(_91);
    if (!_76)
    {
        _94 = uint(_89);
    }
    uint _96 = _94;
    uint _98 = min(_96, 2u);
    int _100 = int(_98) << 2;
    float _102 = in.m_38.x;
    uint _104 = uint(int(uint(_100) >> uint(2)));
    uint _106 = uint(int(uint(int(_104)) >> uint(2)));
    int _108 = int(_104) & 3;
    float _110 = (*spvDescriptorSet0.fp_c1)._m0[int(_106)][_108];
    float _112 = _60 * _102;
    bool _114 = as_type<int>(_110) == 384;
    if (!_114)
    {
        bool _116 = as_type<int>(_110) == 656;
        _118 = _116;
        if (!_118)
        {
            _120 = true;
        }
    }
    float _154;
    float _156;
    float _158;
    float _160;
    if (!_118)
    {
        if (!_120)
        {
            float _122 = _62 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
            float _124 = _62 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
            float _126 = _62 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _128 = _62 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
            float _130 = fma(_112, (*spvDescriptorSet0.fp_c3)._m0[0].x, _122);
            float _132 = fma(_112, (*spvDescriptorSet0.fp_c3)._m0[1].x, _124);
            float _134 = fma(_112, (*spvDescriptorSet0.fp_c3)._m0[2].x, _126);
            float _136 = fma(_112, (*spvDescriptorSet0.fp_c3)._m0[3].x, _128);
            float _138 = fma(_60, (*spvDescriptorSet0.fp_c3)._m0[0].z, _130);
            float _140 = fma(_60, (*spvDescriptorSet0.fp_c3)._m0[1].z, _132);
            float _142 = fma(_60, (*spvDescriptorSet0.fp_c3)._m0[2].z, _134);
            float _144 = fma(_60, (*spvDescriptorSet0.fp_c3)._m0[3].z, _136);
            float _146 = _138 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
            float _148 = _140 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
            float _150 = _142 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
            float _152 = _144 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
            _154 = _152;
            _156 = _150;
            _158 = _146;
            _160 = _148;
        }
    }
    if ((false || _120) || _118)
    {
        if ((!_120) || _118)
        {
            _118 = false;
            float _162 = _62 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
            float _164 = _62 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
            float _166 = _62 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
            float _168 = _62 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
            float _170 = fma(_112, (*spvDescriptorSet0.fp_c3)._m0[4].x, _162);
            float _172 = fma(_112, (*spvDescriptorSet0.fp_c3)._m0[5].x, _164);
            float _174 = fma(_112, (*spvDescriptorSet0.fp_c3)._m0[6].x, _166);
            float _176 = fma(_112, (*spvDescriptorSet0.fp_c3)._m0[7].x, _168);
            float _178 = fma(_60, (*spvDescriptorSet0.fp_c3)._m0[4].z, _170);
            float _180 = fma(_60, (*spvDescriptorSet0.fp_c3)._m0[5].z, _172);
            float _182 = fma(_60, (*spvDescriptorSet0.fp_c3)._m0[6].z, _174);
            float _184 = fma(_60, (*spvDescriptorSet0.fp_c3)._m0[7].z, _176);
            float _186 = _178 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
            float _188 = _180 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
            float _190 = _182 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
            float _192 = _184 + (*spvDescriptorSet0.fp_c3)._m0[7].w;
            _154 = _192;
            _156 = _190;
            _158 = _186;
            _160 = _188;
        }
        if (false || _120)
        {
            _120 = false;
            float _194 = _62 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
            float _196 = _62 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
            float _198 = _62 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
            float _200 = _62 * (*spvDescriptorSet0.fp_c3)._m0[11].y;
            float _202 = fma(_112, (*spvDescriptorSet0.fp_c3)._m0[8].x, _194);
            float _204 = fma(_112, (*spvDescriptorSet0.fp_c3)._m0[9].x, _196);
            float _206 = fma(_112, (*spvDescriptorSet0.fp_c3)._m0[10].x, _198);
            float _208 = fma(_112, (*spvDescriptorSet0.fp_c3)._m0[11].x, _200);
            float _210 = fma(_60, (*spvDescriptorSet0.fp_c3)._m0[8].z, _202);
            float _212 = fma(_60, (*spvDescriptorSet0.fp_c3)._m0[9].z, _204);
            float _214 = fma(_60, (*spvDescriptorSet0.fp_c3)._m0[10].z, _206);
            float _216 = fma(_60, (*spvDescriptorSet0.fp_c3)._m0[11].z, _208);
            float _218 = _210 + (*spvDescriptorSet0.fp_c3)._m0[8].w;
            float _220 = _212 + (*spvDescriptorSet0.fp_c3)._m0[9].w;
            float _222 = _214 + (*spvDescriptorSet0.fp_c3)._m0[10].w;
            float _224 = _216 + (*spvDescriptorSet0.fp_c3)._m0[11].w;
            _154 = _224;
            _156 = _222;
            _158 = _218;
            _160 = _220;
        }
    }
    float _226 = _154;
    float _228 = _156;
    float _230 = _158;
    float _232 = _160;
    float _234 = 1.0 / _226;
    float _236 = float(int(_96));
    float _238 = rint(_236);
    float _240 = precise::max(_238, 0.0);
    uint _242 = uint(_240);
    uint _244 = clamp(_242, 0u, 65535u);
    float _246 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _248 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _250 = _234 * _228;
    float _252 = precise::clamp(_250, 0.0, 1.0);
    float _254 = _234 * _230;
    float _256 = _234 * _232;
    float _258 = _252 * _246;
    float _260 = _252 * _248;
    float _262 = fma(_258, 0.5, _254);
    float _264 = fma(_260, 0.5, _256);
    float _266 = fma(_258, 1.5, _254);
    float _268 = fma(_258, -0.5, _254);
    float _270 = fma(_258, -1.5, _254);
    float _272 = fma(_260, 1.5, _256);
    float _274 = fma(_260, -0.5, _256);
    float3 _905 = float3(_262, _272, float(int(_244)));
    float3 _909 = select(_905, float3(0.0), isnan(_905));
    float _276 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _909.xy, uint(rint(_909.z)), _252);
    float3 _918 = float3(_266, _264, float(int(_244)));
    float3 _920 = select(_918, float3(0.0), isnan(_918));
    float _278 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _920.xy, uint(rint(_920.z)), _252);
    float3 _929 = float3(_262, _264, float(int(_244)));
    float3 _931 = select(_929, float3(0.0), isnan(_929));
    float _280 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _931.xy, uint(rint(_931.z)), _252);
    float3 _940 = float3(_268, _264, float(int(_244)));
    float3 _942 = select(_940, float3(0.0), isnan(_940));
    float _282 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _942.xy, uint(rint(_942.z)), _252);
    float3 _951 = float3(_270, _264, float(int(_244)));
    float3 _953 = select(_951, float3(0.0), isnan(_951));
    float _284 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _953.xy, uint(rint(_953.z)), _252);
    float3 _962 = float3(_266, _274, float(int(_244)));
    float3 _964 = select(_962, float3(0.0), isnan(_962));
    float _286 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _964.xy, uint(rint(_964.z)), _252);
    float3 _973 = float3(_268, _272, float(int(_244)));
    float3 _975 = select(_973, float3(0.0), isnan(_973));
    float _288 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _975.xy, uint(rint(_975.z)), _252);
    float3 _984 = float3(_270, _272, float(int(_244)));
    float3 _986 = select(_984, float3(0.0), isnan(_984));
    float _290 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _986.xy, uint(rint(_986.z)), _252);
    float3 _995 = float3(_266, _272, float(int(_244)));
    float3 _997 = select(_995, float3(0.0), isnan(_995));
    float _292 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _997.xy, uint(rint(_997.z)), _252);
    float3 _1006 = float3(_262, _274, float(int(_244)));
    float3 _1008 = select(_1006, float3(0.0), isnan(_1006));
    float _294 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1008.xy, uint(rint(_1008.z)), _252);
    float3 _1017 = float3(_268, _274, float(int(_244)));
    float3 _1019 = select(_1017, float3(0.0), isnan(_1017));
    float _296 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1019.xy, uint(rint(_1019.z)), _252);
    float3 _1028 = float3(_270, _274, float(int(_244)));
    float3 _1030 = select(_1028, float3(0.0), isnan(_1028));
    float _298 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1030.xy, uint(rint(_1030.z)), _252);
    float _300 = _62 * (*spvDescriptorSet0.fp_c3)._m0[15].y;
    float _302 = fma(_260, -1.5, _256);
    float _304 = fma(_112, (*spvDescriptorSet0.fp_c3)._m0[15].x, _300);
    float _306 = fma(_60, (*spvDescriptorSet0.fp_c3)._m0[15].z, _304);
    float _308 = _306 + (*spvDescriptorSet0.fp_c3)._m0[15].w;
    float _310 = _62 * (*spvDescriptorSet0.fp_c3)._m0[12].y;
    float _312 = _62 * (*spvDescriptorSet0.fp_c3)._m0[13].y;
    float _314 = 1.0 / _308;
    float _316 = fma(_112, (*spvDescriptorSet0.fp_c3)._m0[12].x, _310);
    float _318 = fma(_112, (*spvDescriptorSet0.fp_c3)._m0[13].x, _312);
    float _320 = fma(_60, (*spvDescriptorSet0.fp_c3)._m0[12].z, _316);
    float _322 = fma(_60, (*spvDescriptorSet0.fp_c3)._m0[13].z, _318);
    float _324 = _320 + (*spvDescriptorSet0.fp_c3)._m0[12].w;
    float _326 = _322 + (*spvDescriptorSet0.fp_c3)._m0[13].w;
    float _328 = _324 * _314;
    float _330 = _326 * _314;
    float2 _1104 = float2(_328, _330);
    float2 _334 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_1104, float2(0.0), isnan(_1104))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_1104, float2(0.0), isnan(_1104))).xy;
    float _336 = _334.x;
    float _338 = _334.y;
    float3 _1119 = float3(_266, _302, float(int(_244)));
    float3 _1121 = select(_1119, float3(0.0), isnan(_1119));
    float _340 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1121.xy, uint(rint(_1121.z)), _252);
    float3 _1130 = float3(_262, _302, float(int(_244)));
    float3 _1132 = select(_1130, float3(0.0), isnan(_1130));
    float _342 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1132.xy, uint(rint(_1132.z)), _252);
    float3 _1141 = float3(_268, _302, float(int(_244)));
    float3 _1143 = select(_1141, float3(0.0), isnan(_1141));
    float _344 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1143.xy, uint(rint(_1143.z)), _252);
    float3 _1152 = float3(_270, _302, float(int(_244)));
    float3 _1154 = select(_1152, float3(0.0), isnan(_1152));
    float _346 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1154.xy, uint(rint(_1154.z)), _252);
    float _348 = _62 * (*spvDescriptorSet0.fp_c3)._m0[14].y;
    float _350 = fma(_112, (*spvDescriptorSet0.fp_c3)._m0[14].x, _348);
    float _352 = -_60;
    float _354 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _356 = _352 + _354;
    float _358 = fma(_60, (*spvDescriptorSet0.fp_c3)._m0[14].z, _350);
    float _360 = _356 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _362 = precise::clamp(_360, 0.0, 1.0);
    float _364 = _358 + (*spvDescriptorSet0.fp_c3)._m0[14].w;
    float _366 = precise::min(_364, 1.0);
    float _368 = _292 + _276;
    float _370 = _368 + _288;
    float _372 = _370 + _290;
    float _374 = _372 + _278;
    float _376 = _374 + _280;
    float _378 = _376 + _282;
    float _380 = _378 + _284;
    float _382 = _380 + _286;
    float _384 = _382 + _294;
    float _386 = _384 + _296;
    float _388 = _386 + _298;
    float _390 = -_60;
    float _392 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _394 = _390 + _392;
    float _396 = _394 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _398 = precise::clamp(_396, 0.0, 1.0);
    float _400 = -_336;
    float _402 = fma(_400, _336, _338);
    float _404 = -_336;
    float _406 = _366 + _404;
    float _408 = fma(_406, _406, _402);
    float _410 = _388 + _340;
    bool _412 = _406 <= 0.001000000047497451305389404296875;
    float _414 = float(_412);
    float _416 = 1.0 / _408;
    float _418 = _410 + _342;
    float _420 = _418 + _344;
    float _422 = _402 * _416;
    float _424 = precise::max(_422, _414);
    float _426 = _420 + _346;
    float _428 = precise::min(_424, 1.0);
    float _430 = fma(_426, 0.0625, _362);
    float _432 = _428 + _398;
    out.m_41.x = (*spvDescriptorSet0.fp_c3)._m0[34].x;
    out.m_41.y = _430;
    out.m_41.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_41.w = _432;
    return out;
}

