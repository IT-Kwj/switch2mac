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
    texture2d_array<float> fp_t_tcb_E [[id(4)]];
    sampler fp_t_tcb_ESmplr [[id(5)]];
    texture2d<float> fp_t_tcb_C [[id(6)]];
    sampler fp_t_tcb_CSmplr [[id(7)]];
    texture2d<float> fp_t_tcb_10 [[id(8)]];
    sampler fp_t_tcb_10Smplr [[id(9)]];
    texture2d<float> fp_t_tcb_A [[id(10)]];
    sampler fp_t_tcb_ASmplr [[id(11)]];
    sampler fp_t_tcb_8Smplr_w [[id(12)]];
    sampler fp_t_tcb_CSmplr_w [[id(13)]];
    sampler fp_t_tcb_10Smplr_w [[id(14)]];
    sampler fp_t_tcb_ASmplr_w [[id(15)]];
    constant dm_border_t* dm_border [[id(16)]];
};

struct main0_out
{
    float4 m_45 [[color(0)]];
};

struct main0_in
{
    float4 m_42 [[user(locn0), center_no_perspective]];
    float4 m_40 [[user(locn1), center_no_perspective]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    bool _114 = false;
    bool _112 = false;
    float _52 = in.m_40.x;
    float _54 = in.m_40.y;
    float2 _458 = float2(_52, _54);
    float _56 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_458, float2(0.0), isnan(_458))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_458, float2(0.0), isnan(_458))).x;
    float _58 = in.m_42.x;
    float _60 = in.m_42.y;
    float _62 = -_56;
    float _64 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _66 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[46].z, _64);
    float _68 = _66 * _58;
    float _70 = -_66;
    bool _74 = _70 > (*spvDescriptorSet0.fp_c3)._m0[40].x;
    float _76 = _66 * _60;
    float _78 = -_66;
    bool _80 = _78 > (*spvDescriptorSet0.fp_c3)._m0[39].x;
    bool _82 = !_74;
    uint _85 = uint(_82 ? 0 : 1);
    uint _87 = 2u;
    if (!_74)
    {
        _87 = 1u;
    }
    uint _89 = _87;
    uint _91 = _89;
    if (!_80)
    {
        _91 = _85;
    }
    uint _93 = _91;
    uint _95 = min(_93, 2u);
    int _98 = int(_95) << 2;
    uint _100 = uint(int(uint(_98) >> uint(2)));
    uint _102 = uint(int(uint(int(_100)) >> uint(2)));
    int _104 = int(_100) & 3;
    float _106 = (*spvDescriptorSet0.fp_c1)._m0[int(_102)][_104];
    bool _108 = as_type<int>(_106) == 336;
    if (!_108)
    {
        bool _110 = as_type<int>(_106) == 608;
        _112 = _110;
        if (!_112)
        {
            _114 = true;
        }
    }
    float _148;
    float _150;
    float _152;
    float _154;
    if (!_112)
    {
        if (!_114)
        {
            float _116 = _76 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
            float _118 = _76 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
            float _120 = _76 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _122 = _76 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
            float _124 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[0].x, _116);
            float _126 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[1].x, _118);
            float _128 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[2].x, _120);
            float _130 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[3].x, _122);
            float _132 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[0].z, _124);
            float _134 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[1].z, _126);
            float _136 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[2].z, _128);
            float _138 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[3].z, _130);
            float _140 = _132 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
            float _142 = _134 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
            float _144 = _136 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
            float _146 = _138 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
            _148 = _146;
            _150 = _144;
            _152 = _140;
            _154 = _142;
        }
    }
    if ((false || _114) || _112)
    {
        if ((!_114) || _112)
        {
            _112 = false;
            float _156 = _76 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
            float _158 = _76 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
            float _160 = _76 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
            float _162 = _76 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
            float _164 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[4].x, _156);
            float _166 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[5].x, _158);
            float _168 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[6].x, _160);
            float _170 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[7].x, _162);
            float _172 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[4].z, _164);
            float _174 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[5].z, _166);
            float _176 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[6].z, _168);
            float _178 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[7].z, _170);
            float _180 = _172 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
            float _182 = _174 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
            float _184 = _176 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
            float _186 = _178 + (*spvDescriptorSet0.fp_c3)._m0[7].w;
            _148 = _186;
            _150 = _184;
            _152 = _180;
            _154 = _182;
        }
        if (false || _114)
        {
            _114 = false;
            float _188 = _76 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
            float _190 = _76 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
            float _192 = _76 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
            float _194 = _76 * (*spvDescriptorSet0.fp_c3)._m0[11].y;
            float _196 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[8].x, _188);
            float _198 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[9].x, _190);
            float _200 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[10].x, _192);
            float _202 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[11].x, _194);
            float _204 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[8].z, _196);
            float _206 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[9].z, _198);
            float _208 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[10].z, _200);
            float _210 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[11].z, _202);
            float _212 = _204 + (*spvDescriptorSet0.fp_c3)._m0[8].w;
            float _214 = _206 + (*spvDescriptorSet0.fp_c3)._m0[9].w;
            float _216 = _208 + (*spvDescriptorSet0.fp_c3)._m0[10].w;
            float _218 = _210 + (*spvDescriptorSet0.fp_c3)._m0[11].w;
            _148 = _218;
            _150 = _216;
            _152 = _212;
            _154 = _214;
        }
    }
    float _220 = _148;
    float _222 = _150;
    float _224 = _152;
    float _226 = _154;
    float _228 = 1.0 / _220;
    float _230 = float(int(_93));
    float _232 = rint(_230);
    float _234 = precise::max(_232, 0.0);
    uint _236 = uint(_234);
    uint _238 = clamp(_236, 0u, 65535u);
    float _240 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _242 = _228 * _222;
    float _244 = precise::clamp(_242, 0.0, 1.0);
    float _246 = _228 * _224;
    float _248 = _228 * _226;
    float _250 = _244 * _240;
    float _252 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _254 = fma(_250, 0.5, _246);
    float _256 = _244 * _252;
    float _258 = fma(_250, 1.5, _246);
    float _260 = fma(_250, -0.5, _246);
    float _262 = fma(_250, -1.5, _246);
    float _264 = fma(_256, 1.5, _248);
    float _266 = fma(_256, 0.5, _248);
    float3 _900 = float3(_254, _264, float(int(_238)));
    float3 _904 = select(_900, float3(0.0), isnan(_900));
    float _268 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _904.xy, uint(rint(_904.z)), _244);
    float3 _913 = float3(_260, _264, float(int(_238)));
    float3 _915 = select(_913, float3(0.0), isnan(_913));
    float _270 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _915.xy, uint(rint(_915.z)), _244);
    float3 _924 = float3(_262, _264, float(int(_238)));
    float3 _926 = select(_924, float3(0.0), isnan(_924));
    float _272 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _926.xy, uint(rint(_926.z)), _244);
    float3 _935 = float3(_258, _264, float(int(_238)));
    float3 _937 = select(_935, float3(0.0), isnan(_935));
    float _274 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _937.xy, uint(rint(_937.z)), _244);
    float3 _946 = float3(_258, _266, float(int(_238)));
    float3 _948 = select(_946, float3(0.0), isnan(_946));
    float _276 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _948.xy, uint(rint(_948.z)), _244);
    float3 _957 = float3(_254, _266, float(int(_238)));
    float3 _959 = select(_957, float3(0.0), isnan(_957));
    float _278 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _959.xy, uint(rint(_959.z)), _244);
    float3 _968 = float3(_260, _266, float(int(_238)));
    float3 _970 = select(_968, float3(0.0), isnan(_968));
    float _280 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _970.xy, uint(rint(_970.z)), _244);
    float3 _979 = float3(_262, _266, float(int(_238)));
    float3 _981 = select(_979, float3(0.0), isnan(_979));
    float _282 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _981.xy, uint(rint(_981.z)), _244);
    float2 _987 = float2(_52, _54);
    float2 _286 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_987, float2(0.0), isnan(_987))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_987, float2(0.0), isnan(_987))).xy;
    float _288 = _286.x;
    float _290 = _286.y;
    float _292 = fma(_256, -1.5, _248);
    float _294 = _274 + _268;
    float _296 = _294 + _270;
    float _298 = _296 + _272;
    float _300 = _298 + _276;
    float _302 = fma(_256, -0.5, _248);
    float _304 = _300 + _278;
    float3 _1023 = float3(_258, _302, float(int(_238)));
    float3 _1025 = select(_1023, float3(0.0), isnan(_1023));
    float _306 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1025.xy, uint(rint(_1025.z)), _244);
    float3 _1034 = float3(_254, _302, float(int(_238)));
    float3 _1036 = select(_1034, float3(0.0), isnan(_1034));
    float _308 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1036.xy, uint(rint(_1036.z)), _244);
    float3 _1045 = float3(_260, _302, float(int(_238)));
    float3 _1047 = select(_1045, float3(0.0), isnan(_1045));
    float _310 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1047.xy, uint(rint(_1047.z)), _244);
    float3 _1056 = float3(_262, _302, float(int(_238)));
    float3 _1058 = select(_1056, float3(0.0), isnan(_1056));
    float _312 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1058.xy, uint(rint(_1058.z)), _244);
    float _314 = _76 * (*spvDescriptorSet0.fp_c3)._m0[15].y;
    float _316 = _76 * (*spvDescriptorSet0.fp_c3)._m0[13].y;
    float _318 = _304 + _280;
    float _320 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[15].x, _314);
    float _322 = _76 * (*spvDescriptorSet0.fp_c3)._m0[12].y;
    float _324 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[15].z, _320);
    float _326 = _324 + (*spvDescriptorSet0.fp_c3)._m0[15].w;
    float _328 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[12].x, _322);
    float _330 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[13].x, _316);
    float _332 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[12].z, _328);
    float _334 = 1.0 / _326;
    float _336 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[13].z, _330);
    float _338 = _332 + (*spvDescriptorSet0.fp_c3)._m0[12].w;
    float _340 = _336 + (*spvDescriptorSet0.fp_c3)._m0[13].w;
    float _342 = fma(_288, 2.0, -1.0);
    float _344 = fma(_290, 2.0, -1.0);
    float _346 = _338 * _334;
    float _348 = _340 * _334;
    float _350 = _318 + _282;
    float _352 = _342 * (*spvDescriptorSet0.fp_c3)._m0[36].z;
    float _354 = _344 * (*spvDescriptorSet0.fp_c3)._m0[36].w;
    float2 _1150 = float2(_346, _348);
    float2 _356 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_1150, float2(0.0), isnan(_1150))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_1150, float2(0.0), isnan(_1150))).xy;
    float _358 = _356.x;
    float _360 = _356.y;
    float _362 = fma(_352, 2.0, _52);
    float _364 = fma(_354, 2.0, _54);
    float3 _1171 = float3(_258, _292, float(int(_238)));
    float3 _1173 = select(_1171, float3(0.0), isnan(_1171));
    float _366 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1173.xy, uint(rint(_1173.z)), _244);
    float3 _1182 = float3(_254, _292, float(int(_238)));
    float3 _1184 = select(_1182, float3(0.0), isnan(_1182));
    float _368 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1184.xy, uint(rint(_1184.z)), _244);
    float3 _1193 = float3(_260, _292, float(int(_238)));
    float3 _1195 = select(_1193, float3(0.0), isnan(_1193));
    float _370 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1195.xy, uint(rint(_1195.z)), _244);
    float3 _1204 = float3(_262, _292, float(int(_238)));
    float3 _1206 = select(_1204, float3(0.0), isnan(_1204));
    float _372 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1206.xy, uint(rint(_1206.z)), _244);
    float2 _1212 = float2(_362, _364);
    float _374 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1212, float2(0.0), isnan(_1212))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1212, float2(0.0), isnan(_1212))).x;
    float _376 = _76 * (*spvDescriptorSet0.fp_c3)._m0[14].y;
    float _378 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[14].x, _376);
    float _380 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[14].z, _378);
    float _382 = _380 + (*spvDescriptorSet0.fp_c3)._m0[14].w;
    float _384 = precise::min(_382, 1.0);
    float _386 = -_66;
    float _388 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _390 = _386 + _388;
    float _392 = _390 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _394 = precise::clamp(_392, 0.0, 1.0);
    float _396 = _350 + _306;
    float _398 = _396 + _308;
    float _400 = _398 + _310;
    float _402 = _400 + _312;
    float _404 = -_358;
    float _406 = fma(_404, _358, _360);
    float _408 = -_358;
    float _410 = _384 + _408;
    float _412 = fma(_410, _410, _406);
    bool _414 = _410 <= 0.001000000047497451305389404296875;
    float _416 = float(_414);
    float _418 = _402 + _366;
    float _420 = 1.0 / _412;
    float _422 = _418 + _368;
    float _424 = _422 + _370;
    float _426 = -_66;
    float _428 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _430 = _426 + _428;
    float _432 = _406 * _420;
    float _434 = _424 + _372;
    float _436 = _430 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _438 = precise::clamp(_436, 0.0, 1.0);
    float _440 = precise::max(_432, _416);
    float _442 = fma(_434, 0.0625, _394);
    float _444 = precise::min(_440, 1.0);
    float _446 = _444 + _438;
    out.m_45.x = _374;
    out.m_45.y = _442;
    out.m_45.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_45.w = _446;
    return out;
}

