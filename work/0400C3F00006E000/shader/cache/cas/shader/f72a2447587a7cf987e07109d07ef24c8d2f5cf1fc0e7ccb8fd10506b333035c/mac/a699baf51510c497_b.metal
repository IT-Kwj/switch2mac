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
    texture2d<float> fp_t_tcb_C [[id(4)]];
    sampler fp_t_tcb_CSmplr [[id(5)]];
    texture2d_array<float> fp_t_tcb_E [[id(6)]];
    sampler fp_t_tcb_ESmplr [[id(7)]];
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
    bool _118 = false;
    bool _116 = false;
    float _52 = in.m_40.x;
    float _54 = in.m_40.y;
    float2 _426 = float2(_52, _54);
    float _56 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_426, float2(0.0), isnan(_426))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_426, float2(0.0), isnan(_426))).x;
    float _58 = in.m_42.x;
    float _60 = in.m_42.y;
    float _62 = -_56;
    float _64 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _66 = 1.0 / _64;
    float _68 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _70 = _66 * _68;
    float _72 = _70 * _58;
    float _74 = -_70;
    bool _78 = _74 > (*spvDescriptorSet0.fp_c3)._m0[40].x;
    float _80 = _70 * _60;
    float _82 = -_70;
    bool _84 = _82 > (*spvDescriptorSet0.fp_c3)._m0[39].x;
    bool _86 = !_78;
    uint _89 = uint(_86 ? 0 : 1);
    uint _91 = 2u;
    if (!_78)
    {
        _91 = 1u;
    }
    uint _93 = _91;
    uint _95 = _93;
    if (!_84)
    {
        _95 = _89;
    }
    uint _97 = _95;
    uint _99 = min(_97, 2u);
    int _102 = int(_99) << 2;
    uint _104 = uint(int(uint(_102) >> uint(2)));
    uint _106 = uint(int(uint(int(_104)) >> uint(2)));
    int _108 = int(_104) & 3;
    float _110 = (*spvDescriptorSet0.fp_c1)._m0[int(_106)][_108];
    bool _112 = as_type<int>(_110) == 368;
    if (!_112)
    {
        bool _114 = as_type<int>(_110) == 640;
        _116 = _114;
        if (!_116)
        {
            _118 = true;
        }
    }
    float _152;
    float _154;
    float _156;
    float _158;
    if (!_116)
    {
        if (!_118)
        {
            float _120 = _80 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
            float _122 = _80 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
            float _124 = _80 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _126 = _80 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
            float _128 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[0].x, _120);
            float _130 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[1].x, _122);
            float _132 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[2].x, _124);
            float _134 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[3].x, _126);
            float _136 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[0].z, _128);
            float _138 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[1].z, _130);
            float _140 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[2].z, _132);
            float _142 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[3].z, _134);
            float _144 = _136 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
            float _146 = _138 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
            float _148 = _140 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
            float _150 = _142 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
            _152 = _150;
            _154 = _144;
            _156 = _148;
            _158 = _146;
        }
    }
    if ((false || _118) || _116)
    {
        if ((!_118) || _116)
        {
            _116 = false;
            float _160 = _80 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
            float _162 = _80 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
            float _164 = _80 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
            float _166 = _80 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
            float _168 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[4].x, _160);
            float _170 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[5].x, _162);
            float _172 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[6].x, _164);
            float _174 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[7].x, _166);
            float _176 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[4].z, _168);
            float _178 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[5].z, _170);
            float _180 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[6].z, _172);
            float _182 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[7].z, _174);
            float _184 = _176 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
            float _186 = _178 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
            float _188 = _180 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
            float _190 = _182 + (*spvDescriptorSet0.fp_c3)._m0[7].w;
            _152 = _190;
            _154 = _184;
            _156 = _188;
            _158 = _186;
        }
        if (false || _118)
        {
            _118 = false;
            float _192 = _80 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
            float _194 = _80 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
            float _196 = _80 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
            float _198 = _80 * (*spvDescriptorSet0.fp_c3)._m0[11].y;
            float _200 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[8].x, _192);
            float _202 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[9].x, _194);
            float _204 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[10].x, _196);
            float _206 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[11].x, _198);
            float _208 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[8].z, _200);
            float _210 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[9].z, _202);
            float _212 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[10].z, _204);
            float _214 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[11].z, _206);
            float _216 = _208 + (*spvDescriptorSet0.fp_c3)._m0[8].w;
            float _218 = _210 + (*spvDescriptorSet0.fp_c3)._m0[9].w;
            float _220 = _212 + (*spvDescriptorSet0.fp_c3)._m0[10].w;
            float _222 = _214 + (*spvDescriptorSet0.fp_c3)._m0[11].w;
            _152 = _222;
            _154 = _216;
            _156 = _220;
            _158 = _218;
        }
    }
    float _224 = _152;
    float _226 = _154;
    float _228 = _156;
    float _230 = _158;
    float2 _802 = float2(_52, _54);
    float2 _234 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_802, float2(0.0), isnan(_802))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_802, float2(0.0), isnan(_802))).xy;
    float _236 = _234.x;
    float _238 = _234.y;
    float _240 = _80 * (*spvDescriptorSet0.fp_c3)._m0[15].y;
    float _242 = float(int(_97));
    float _244 = 1.0 / _224;
    float _246 = _80 * (*spvDescriptorSet0.fp_c3)._m0[13].y;
    float _248 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[15].x, _240);
    float _250 = _80 * (*spvDescriptorSet0.fp_c3)._m0[12].y;
    float _252 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[13].x, _246);
    float _254 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[15].z, _248);
    float _256 = rint(_242);
    float _258 = precise::max(_256, 0.0);
    uint _260 = uint(_258);
    uint _262 = clamp(_260, 0u, 65535u);
    float _264 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[13].z, _252);
    float _266 = _254 + (*spvDescriptorSet0.fp_c3)._m0[15].w;
    float _268 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[12].x, _250);
    float _270 = _264 + (*spvDescriptorSet0.fp_c3)._m0[13].w;
    float _272 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[12].z, _268);
    float _274 = 1.0 / _266;
    float _276 = _244 * _226;
    float _278 = _244 * _228;
    float _280 = precise::clamp(_278, 0.0, 1.0);
    float _282 = _272 + (*spvDescriptorSet0.fp_c3)._m0[12].w;
    float _284 = _244 * _230;
    float _286 = _282 * _274;
    float _288 = _270 * _274;
    float _290 = fma(_238, 2.0, -1.0);
    float _292 = fma(_236, 2.0, -1.0);
    float _294 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _296 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _298 = _290 * (*spvDescriptorSet0.fp_c3)._m0[36].w;
    float _300 = _292 * (*spvDescriptorSet0.fp_c3)._m0[36].z;
    float _302 = fma(_280, _294, _276);
    float _304 = -_296;
    float _306 = fma(_280, _304, _284);
    float _308 = fma(_298, 2.0, _54);
    float _310 = fma(_300, 2.0, _52);
    float _312 = -_294;
    float _314 = fma(_280, _312, _276);
    float _316 = fma(_280, _296, _284);
    float3 _962 = float3(_276, _316, float(int(_262)));
    float3 _966 = select(_962, float3(0.0), isnan(_962));
    float _318 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _966.xy, uint(rint(_966.z)), _280);
    float3 _975 = float3(_302, _316, float(int(_262)));
    float3 _977 = select(_975, float3(0.0), isnan(_975));
    float _320 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _977.xy, uint(rint(_977.z)), _280);
    float3 _986 = float3(_314, _316, float(int(_262)));
    float3 _988 = select(_986, float3(0.0), isnan(_986));
    float _322 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _988.xy, uint(rint(_988.z)), _280);
    float3 _997 = float3(_302, _284, float(int(_262)));
    float3 _999 = select(_997, float3(0.0), isnan(_997));
    float _324 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _999.xy, uint(rint(_999.z)), _280);
    float3 _1008 = float3(_276, _284, float(int(_262)));
    float3 _1010 = select(_1008, float3(0.0), isnan(_1008));
    float _326 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1010.xy, uint(rint(_1010.z)), _280);
    float2 _1016 = float2(_286, _288);
    float2 _328 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_1016, float2(0.0), isnan(_1016))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_1016, float2(0.0), isnan(_1016))).xy;
    float _330 = _328.x;
    float _332 = _328.y;
    float3 _1031 = float3(_314, _284, float(int(_262)));
    float3 _1033 = select(_1031, float3(0.0), isnan(_1031));
    float _334 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1033.xy, uint(rint(_1033.z)), _280);
    float3 _1042 = float3(_302, _306, float(int(_262)));
    float3 _1044 = select(_1042, float3(0.0), isnan(_1042));
    float _336 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1044.xy, uint(rint(_1044.z)), _280);
    float3 _1053 = float3(_276, _306, float(int(_262)));
    float3 _1055 = select(_1053, float3(0.0), isnan(_1053));
    float _338 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1055.xy, uint(rint(_1055.z)), _280);
    float3 _1064 = float3(_314, _306, float(int(_262)));
    float3 _1066 = select(_1064, float3(0.0), isnan(_1064));
    float _340 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1066.xy, uint(rint(_1066.z)), _280);
    float2 _1072 = float2(_310, _308);
    float _342 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1072, float2(0.0), isnan(_1072))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1072, float2(0.0), isnan(_1072))).x;
    float _344 = _80 * (*spvDescriptorSet0.fp_c3)._m0[14].y;
    float _346 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[14].x, _344);
    float _348 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[14].z, _346);
    float _350 = _348 + (*spvDescriptorSet0.fp_c3)._m0[14].w;
    float _352 = precise::min(_350, 1.0);
    float _354 = -_70;
    float _356 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _358 = _354 + _356;
    float _360 = _358 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _362 = precise::clamp(_360, 0.0, 1.0);
    float _364 = _320 + _318;
    float _366 = _364 + _322;
    float _368 = -_330;
    float _370 = fma(_368, _330, _332);
    float _372 = -_330;
    float _374 = _352 + _372;
    float _376 = _366 + _324;
    float _378 = fma(_374, _374, _370);
    float _380 = _376 + _326;
    bool _382 = _374 <= 0.001000000047497451305389404296875;
    float _384 = float(_382);
    float _386 = 1.0 / _378;
    float _388 = _380 + _334;
    float _390 = _388 + _336;
    float _392 = _390 + _338;
    float _394 = _392 + _340;
    float _396 = _370 * _386;
    float _398 = -_70;
    float _400 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _402 = _398 + _400;
    float _404 = precise::max(_396, _384);
    float _406 = _402 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _408 = precise::clamp(_406, 0.0, 1.0);
    float _410 = precise::min(_404, 1.0);
    float _412 = fma(_394, 0.111111111938953399658203125, _408);
    float _414 = _410 + _362;
    out.m_45.x = _342;
    out.m_45.y = _412;
    out.m_45.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_45.w = _414;
    return out;
}

