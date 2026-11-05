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
    bool _110 = false;
    bool _108 = false;
    float _48 = in.m_36.x;
    float _50 = in.m_36.y;
    float2 _434 = float2(_48, _50);
    float _52 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_434, float2(0.0), isnan(_434))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_434, float2(0.0), isnan(_434))).x;
    float _54 = in.m_38.y;
    float _56 = in.m_38.x;
    float _58 = -_52;
    float _60 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _62 = fma(_58, (*spvDescriptorSet0.fp_c3)._m0[46].z, _60);
    float _64 = _62 * _56;
    float _66 = -_62;
    bool _70 = _66 > (*spvDescriptorSet0.fp_c3)._m0[40].x;
    float _72 = _62 * _54;
    float _74 = -_62;
    bool _76 = _74 > (*spvDescriptorSet0.fp_c3)._m0[39].x;
    bool _78 = !_70;
    uint _81 = uint(_78 ? 0 : 1);
    uint _83 = 2u;
    if (!_70)
    {
        _83 = 1u;
    }
    uint _85 = _83;
    uint _87 = _85;
    if (!_76)
    {
        _87 = _81;
    }
    uint _89 = _87;
    uint _91 = min(_89, 2u);
    int _94 = int(_91) << 2;
    uint _96 = uint(int(uint(_94) >> uint(2)));
    uint _98 = uint(int(uint(int(_96)) >> uint(2)));
    int _100 = int(_96) & 3;
    float _102 = (*spvDescriptorSet0.fp_c1)._m0[int(_98)][_100];
    bool _104 = as_type<int>(_102) == 336;
    if (!_104)
    {
        bool _106 = as_type<int>(_102) == 608;
        _108 = _106;
        if (!_108)
        {
            _110 = true;
        }
    }
    float _144;
    float _146;
    float _148;
    float _150;
    if (!_108)
    {
        if (!_110)
        {
            float _112 = _72 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
            float _114 = _72 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
            float _116 = _72 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _118 = _72 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
            float _120 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[0].x, _112);
            float _122 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[1].x, _114);
            float _124 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[2].x, _116);
            float _126 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[3].x, _118);
            float _128 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[0].z, _120);
            float _130 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[1].z, _122);
            float _132 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[2].z, _124);
            float _134 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[3].z, _126);
            float _136 = _128 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
            float _138 = _130 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
            float _140 = _132 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
            float _142 = _134 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
            _144 = _142;
            _146 = _140;
            _148 = _136;
            _150 = _138;
        }
    }
    if ((false || _110) || _108)
    {
        if ((!_110) || _108)
        {
            _108 = false;
            float _152 = _72 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
            float _154 = _72 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
            float _156 = _72 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
            float _158 = _72 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
            float _160 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[4].x, _152);
            float _162 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[5].x, _154);
            float _164 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[6].x, _156);
            float _166 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[7].x, _158);
            float _168 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[4].z, _160);
            float _170 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[5].z, _162);
            float _172 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[6].z, _164);
            float _174 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[7].z, _166);
            float _176 = _168 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
            float _178 = _170 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
            float _180 = _172 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
            float _182 = _174 + (*spvDescriptorSet0.fp_c3)._m0[7].w;
            _144 = _182;
            _146 = _180;
            _148 = _176;
            _150 = _178;
        }
        if (false || _110)
        {
            _110 = false;
            float _184 = _72 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
            float _186 = _72 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
            float _188 = _72 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
            float _190 = _72 * (*spvDescriptorSet0.fp_c3)._m0[11].y;
            float _192 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[8].x, _184);
            float _194 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[9].x, _186);
            float _196 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[10].x, _188);
            float _198 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[11].x, _190);
            float _200 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[8].z, _192);
            float _202 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[9].z, _194);
            float _204 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[10].z, _196);
            float _206 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[11].z, _198);
            float _208 = _200 + (*spvDescriptorSet0.fp_c3)._m0[8].w;
            float _210 = _202 + (*spvDescriptorSet0.fp_c3)._m0[9].w;
            float _212 = _204 + (*spvDescriptorSet0.fp_c3)._m0[10].w;
            float _214 = _206 + (*spvDescriptorSet0.fp_c3)._m0[11].w;
            _144 = _214;
            _146 = _212;
            _148 = _208;
            _150 = _210;
        }
    }
    float _216 = _144;
    float _218 = _146;
    float _220 = _148;
    float _222 = _150;
    float _224 = 1.0 / _216;
    float _226 = float(int(_89));
    float _228 = rint(_226);
    float _230 = precise::max(_228, 0.0);
    uint _232 = uint(_230);
    uint _234 = clamp(_232, 0u, 65535u);
    float _236 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _238 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _240 = _224 * _218;
    float _242 = precise::clamp(_240, 0.0, 1.0);
    float _244 = _224 * _220;
    float _246 = _224 * _222;
    float _248 = _242 * _236;
    float _250 = _242 * _238;
    float _252 = fma(_248, 0.5, _244);
    float _254 = fma(_250, 0.5, _246);
    float _256 = fma(_248, 1.5, _244);
    float _258 = fma(_248, -0.5, _244);
    float _260 = fma(_248, -1.5, _244);
    float _262 = fma(_250, 1.5, _246);
    float _264 = fma(_250, -0.5, _246);
    float3 _879 = float3(_252, _262, float(int(_234)));
    float3 _883 = select(_879, float3(0.0), isnan(_879));
    float _266 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _883.xy, uint(rint(_883.z)), _242);
    float3 _892 = float3(_256, _254, float(int(_234)));
    float3 _894 = select(_892, float3(0.0), isnan(_892));
    float _268 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _894.xy, uint(rint(_894.z)), _242);
    float3 _903 = float3(_252, _254, float(int(_234)));
    float3 _905 = select(_903, float3(0.0), isnan(_903));
    float _270 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _905.xy, uint(rint(_905.z)), _242);
    float3 _914 = float3(_258, _254, float(int(_234)));
    float3 _916 = select(_914, float3(0.0), isnan(_914));
    float _272 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _916.xy, uint(rint(_916.z)), _242);
    float3 _925 = float3(_260, _254, float(int(_234)));
    float3 _927 = select(_925, float3(0.0), isnan(_925));
    float _274 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _927.xy, uint(rint(_927.z)), _242);
    float3 _936 = float3(_256, _264, float(int(_234)));
    float3 _938 = select(_936, float3(0.0), isnan(_936));
    float _276 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _938.xy, uint(rint(_938.z)), _242);
    float3 _947 = float3(_258, _262, float(int(_234)));
    float3 _949 = select(_947, float3(0.0), isnan(_947));
    float _278 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _949.xy, uint(rint(_949.z)), _242);
    float3 _958 = float3(_260, _262, float(int(_234)));
    float3 _960 = select(_958, float3(0.0), isnan(_958));
    float _280 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _960.xy, uint(rint(_960.z)), _242);
    float3 _969 = float3(_256, _262, float(int(_234)));
    float3 _971 = select(_969, float3(0.0), isnan(_969));
    float _282 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _971.xy, uint(rint(_971.z)), _242);
    float3 _980 = float3(_252, _264, float(int(_234)));
    float3 _982 = select(_980, float3(0.0), isnan(_980));
    float _284 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _982.xy, uint(rint(_982.z)), _242);
    float3 _991 = float3(_258, _264, float(int(_234)));
    float3 _993 = select(_991, float3(0.0), isnan(_991));
    float _286 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _993.xy, uint(rint(_993.z)), _242);
    float3 _1002 = float3(_260, _264, float(int(_234)));
    float3 _1004 = select(_1002, float3(0.0), isnan(_1002));
    float _288 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1004.xy, uint(rint(_1004.z)), _242);
    float _290 = _72 * (*spvDescriptorSet0.fp_c3)._m0[15].y;
    float _292 = fma(_250, -1.5, _246);
    float _294 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[15].x, _290);
    float _296 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[15].z, _294);
    float _298 = _296 + (*spvDescriptorSet0.fp_c3)._m0[15].w;
    float _300 = _72 * (*spvDescriptorSet0.fp_c3)._m0[12].y;
    float _302 = _72 * (*spvDescriptorSet0.fp_c3)._m0[13].y;
    float _304 = 1.0 / _298;
    float _306 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[12].x, _300);
    float _308 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[13].x, _302);
    float _310 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[12].z, _306);
    float _312 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[13].z, _308);
    float _314 = _310 + (*spvDescriptorSet0.fp_c3)._m0[12].w;
    float _316 = _312 + (*spvDescriptorSet0.fp_c3)._m0[13].w;
    float _318 = _314 * _304;
    float _320 = _316 * _304;
    float2 _1078 = float2(_318, _320);
    float2 _324 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_1078, float2(0.0), isnan(_1078))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_1078, float2(0.0), isnan(_1078))).xy;
    float _326 = _324.x;
    float _328 = _324.y;
    float3 _1093 = float3(_256, _292, float(int(_234)));
    float3 _1095 = select(_1093, float3(0.0), isnan(_1093));
    float _330 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1095.xy, uint(rint(_1095.z)), _242);
    float3 _1104 = float3(_252, _292, float(int(_234)));
    float3 _1106 = select(_1104, float3(0.0), isnan(_1104));
    float _332 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1106.xy, uint(rint(_1106.z)), _242);
    float3 _1115 = float3(_258, _292, float(int(_234)));
    float3 _1117 = select(_1115, float3(0.0), isnan(_1115));
    float _334 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1117.xy, uint(rint(_1117.z)), _242);
    float3 _1126 = float3(_260, _292, float(int(_234)));
    float3 _1128 = select(_1126, float3(0.0), isnan(_1126));
    float _336 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1128.xy, uint(rint(_1128.z)), _242);
    float _338 = _72 * (*spvDescriptorSet0.fp_c3)._m0[14].y;
    float _340 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[14].x, _338);
    float _342 = -_62;
    float _344 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _346 = _342 + _344;
    float _348 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[14].z, _340);
    float _350 = _346 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _352 = precise::clamp(_350, 0.0, 1.0);
    float _354 = _348 + (*spvDescriptorSet0.fp_c3)._m0[14].w;
    float _356 = precise::min(_354, 1.0);
    float _358 = _282 + _266;
    float _360 = _358 + _278;
    float _362 = _360 + _280;
    float _364 = _362 + _268;
    float _366 = _364 + _270;
    float _368 = _366 + _272;
    float _370 = _368 + _274;
    float _372 = _370 + _276;
    float _374 = _372 + _284;
    float _376 = _374 + _286;
    float _378 = _376 + _288;
    float _380 = -_62;
    float _382 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _384 = _380 + _382;
    float _386 = _384 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _388 = precise::clamp(_386, 0.0, 1.0);
    float _390 = -_326;
    float _392 = fma(_390, _326, _328);
    float _394 = -_326;
    float _396 = _356 + _394;
    float _398 = fma(_396, _396, _392);
    float _400 = _378 + _330;
    bool _402 = _396 <= 0.001000000047497451305389404296875;
    float _404 = float(_402);
    float _406 = 1.0 / _398;
    float _408 = _400 + _332;
    float _410 = _408 + _334;
    float _412 = _392 * _406;
    float _414 = precise::max(_412, _404);
    float _416 = _410 + _336;
    float _418 = precise::min(_414, 1.0);
    float _420 = fma(_416, 0.0625, _352);
    float _422 = _418 + _388;
    out.m_41.x = (*spvDescriptorSet0.fp_c3)._m0[34].x;
    out.m_41.y = _420;
    out.m_41.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_41.w = _422;
    return out;
}

