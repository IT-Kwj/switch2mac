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
    texture2d<float> fp_t_tcb_A [[id(8)]];
    sampler fp_t_tcb_ASmplr [[id(9)]];
    sampler fp_t_tcb_8Smplr_w [[id(10)]];
    sampler fp_t_tcb_CSmplr_w [[id(11)]];
    sampler fp_t_tcb_ASmplr_w [[id(12)]];
    constant dm_border_t* dm_border [[id(13)]];
};

struct main0_out
{
    float4 m_47 [[color(0)]];
};

struct main0_in
{
    float4 m_40 [[user(locn0), center_no_perspective]];
    float4 m_44 [[user(locn1), center_no_perspective]];
    float4 m_42 [[user(locn2), center_no_perspective]];
    float4 m_38 [[user(locn3), center_no_perspective]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    bool _286 = false;
    bool _284 = false;
    float _54 = in.m_38.x;
    float _56 = in.m_38.y;
    float2 _478 = float2(_54, _56);
    float3 _60 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_478, float2(0.0), isnan(_478)), int2(0), component::x).xyw;
    float _62 = _60.x;
    float _64 = _60.y;
    float _66 = _60.z;
    float2 _495 = float2(_54, _56);
    float _68 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_495, float2(0.0), isnan(_495))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_495, float2(0.0), isnan(_495))).x;
    float _70 = in.m_40.y;
    float _72 = in.m_40.x;
    float _74 = in.m_42.y;
    float _76 = in.m_44.y;
    float _78 = in.m_42.x;
    float _80 = in.m_44.x;
    float _82 = -_62;
    float _84 = fma(_82, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _86 = -_64;
    float _88 = fma(_86, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _90 = -_66;
    float _92 = fma(_90, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _94 = 1.0 / _84;
    float _96 = 1.0 / _88;
    float _98 = 1.0 / _92;
    float _100 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _102 = _94 * _100;
    float _104 = _70 * _102;
    float _106 = _72 * _102;
    float _108 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _110 = _96 * _108;
    float _112 = -_104;
    float _114 = fma(_110, _74, _112);
    float _116 = -_106;
    float _118 = fma(_110, _78, _116);
    float _120 = -_102;
    float _122 = _120 + _110;
    float _124 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _126 = _98 * _124;
    float _128 = _114 * _114;
    float _130 = -_104;
    float _132 = fma(_126, _76, _130);
    float _134 = -_106;
    float _136 = fma(_126, _80, _134);
    float _138 = fma(_118, _118, _128);
    float _140 = -_102;
    float _142 = _140 + _126;
    float _144 = _132 * _132;
    float _146 = fma(_122, _122, _138);
    float _148 = fma(_136, _136, _144);
    float _150 = fma(_142, _142, _148);
    float _152 = rsqrt(_146);
    float _154 = rsqrt(_150);
    float _156 = -_68;
    float _158 = fma(_156, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _160 = _118 * _152;
    float _162 = _122 * _152;
    float _164 = _114 * _152;
    float _166 = 1.0 / _158;
    float _168 = _142 * _154;
    float _170 = _136 * _154;
    float _172 = _132 * _154;
    float _174 = _160 * _168;
    float _176 = _162 * _172;
    float _178 = -_174;
    float _180 = fma(_162, _170, _178);
    float _182 = _164 * _170;
    float _184 = -_176;
    float _186 = fma(_164, _168, _184);
    float _188 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _190 = _166 * _188;
    float _192 = _180 * _180;
    float _194 = -_182;
    float _196 = fma(_160, _172, _194);
    float _198 = fma(_186, _186, _192);
    float _200 = -_190;
    bool _204 = _200 > (*spvDescriptorSet0.fp_c3)._m0[40].x;
    float _206 = -_190;
    bool _208 = _206 > (*spvDescriptorSet0.fp_c3)._m0[39].x;
    float _210 = fma(_196, _196, _198);
    bool _212 = !_204;
    uint _215 = uint(_212 ? 0 : 1);
    float _217 = rsqrt(_210);
    uint _219 = 2u;
    if (!_204)
    {
        _219 = 1u;
    }
    uint _221 = _219;
    uint _223 = _221;
    if (!_208)
    {
        _223 = _215;
    }
    uint _225 = _223;
    uint _227 = min(_225, 2u);
    int _230 = int(_227) << 2;
    float _232 = _180 * _217;
    float _234 = _186 * _217;
    float _236 = _196 * _217;
    float _238 = _232 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    uint _240 = uint(int(uint(_230) >> uint(2)));
    uint _242 = uint(int(uint(int(_240)) >> uint(2)));
    int _244 = int(_240) & 3;
    float _246 = (*spvDescriptorSet0.fp_c1)._m0[int(_242)][_244];
    float _248 = fma(_234, (*spvDescriptorSet0.fp_c3)._m0[35].x, _238);
    float _250 = fma(_236, (*spvDescriptorSet0.fp_c3)._m0[35].z, _248);
    float _252 = abs(_250);
    float _254 = -_252;
    float _256 = _254 + 1.0;
    float _258 = precise::clamp(_256, 0.0, 1.0);
    float _260 = abs(_258);
    float _262 = log2(_260);
    float _264 = _262 * (*spvDescriptorSet0.fp_c3)._m0[48].z;
    float _266 = exp2(_264);
    float _268 = _266 * (*spvDescriptorSet0.fp_c3)._m0[48].y;
    float _270 = _234 * _268;
    float _272 = _232 * _268;
    float _274 = fma(_236, _268, _190);
    float _276 = fma(_190, _72, _270);
    float _278 = fma(_190, _70, _272);
    bool _280 = as_type<int>(_246) == 1344;
    if (!_280)
    {
        bool _282 = as_type<int>(_246) == 1616;
        _284 = _282;
        if (!_284)
        {
            _286 = true;
        }
    }
    float _320;
    float _322;
    float _324;
    float _326;
    if (!_284)
    {
        if (!_286)
        {
            float _288 = _278 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
            float _290 = _278 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
            float _292 = _278 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _294 = _278 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
            float _296 = fma(_276, (*spvDescriptorSet0.fp_c3)._m0[0].x, _288);
            float _298 = fma(_276, (*spvDescriptorSet0.fp_c3)._m0[1].x, _290);
            float _300 = fma(_276, (*spvDescriptorSet0.fp_c3)._m0[2].x, _292);
            float _302 = fma(_276, (*spvDescriptorSet0.fp_c3)._m0[3].x, _294);
            float _304 = fma(_274, (*spvDescriptorSet0.fp_c3)._m0[0].z, _296);
            float _306 = fma(_274, (*spvDescriptorSet0.fp_c3)._m0[1].z, _298);
            float _308 = fma(_274, (*spvDescriptorSet0.fp_c3)._m0[2].z, _300);
            float _310 = fma(_274, (*spvDescriptorSet0.fp_c3)._m0[3].z, _302);
            float _312 = _304 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
            float _314 = _306 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
            float _316 = _308 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
            float _318 = _310 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
            _320 = _318;
            _322 = _312;
            _324 = _314;
            _326 = _316;
        }
    }
    if ((false || _286) || _284)
    {
        if ((!_286) || _284)
        {
            _284 = false;
            float _328 = _278 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
            float _330 = _278 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
            float _332 = _278 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
            float _334 = _278 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
            float _336 = fma(_276, (*spvDescriptorSet0.fp_c3)._m0[4].x, _328);
            float _338 = fma(_276, (*spvDescriptorSet0.fp_c3)._m0[5].x, _330);
            float _340 = fma(_276, (*spvDescriptorSet0.fp_c3)._m0[6].x, _332);
            float _342 = fma(_276, (*spvDescriptorSet0.fp_c3)._m0[7].x, _334);
            float _344 = fma(_274, (*spvDescriptorSet0.fp_c3)._m0[4].z, _336);
            float _346 = fma(_274, (*spvDescriptorSet0.fp_c3)._m0[5].z, _338);
            float _348 = fma(_274, (*spvDescriptorSet0.fp_c3)._m0[6].z, _340);
            float _350 = fma(_274, (*spvDescriptorSet0.fp_c3)._m0[7].z, _342);
            float _352 = _344 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
            float _354 = _346 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
            float _356 = _348 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
            float _358 = _350 + (*spvDescriptorSet0.fp_c3)._m0[7].w;
            _320 = _358;
            _322 = _352;
            _324 = _354;
            _326 = _356;
        }
        if (false || _286)
        {
            _286 = false;
            float _360 = _278 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
            float _362 = _278 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
            float _364 = _278 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
            float _366 = _278 * (*spvDescriptorSet0.fp_c3)._m0[11].y;
            float _368 = fma(_276, (*spvDescriptorSet0.fp_c3)._m0[8].x, _360);
            float _370 = fma(_276, (*spvDescriptorSet0.fp_c3)._m0[9].x, _362);
            float _372 = fma(_276, (*spvDescriptorSet0.fp_c3)._m0[10].x, _364);
            float _374 = fma(_276, (*spvDescriptorSet0.fp_c3)._m0[11].x, _366);
            float _376 = fma(_274, (*spvDescriptorSet0.fp_c3)._m0[8].z, _368);
            float _378 = fma(_274, (*spvDescriptorSet0.fp_c3)._m0[9].z, _370);
            float _380 = fma(_274, (*spvDescriptorSet0.fp_c3)._m0[10].z, _372);
            float _382 = fma(_274, (*spvDescriptorSet0.fp_c3)._m0[11].z, _374);
            float _384 = _376 + (*spvDescriptorSet0.fp_c3)._m0[8].w;
            float _386 = _378 + (*spvDescriptorSet0.fp_c3)._m0[9].w;
            float _388 = _380 + (*spvDescriptorSet0.fp_c3)._m0[10].w;
            float _390 = _382 + (*spvDescriptorSet0.fp_c3)._m0[11].w;
            _320 = _390;
            _322 = _384;
            _324 = _386;
            _326 = _388;
        }
    }
    float _392 = _320;
    float _394 = _322;
    float _396 = _324;
    float _398 = _326;
    float2 _1101 = float2(_54, _56);
    float2 _402 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_1101, float2(0.0), isnan(_1101))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_1101, float2(0.0), isnan(_1101))).xy;
    float _404 = _402.x;
    float _406 = _402.y;
    float _408 = float(int(_225));
    float _410 = 1.0 / _392;
    float _412 = rint(_408);
    float _414 = precise::max(_412, 0.0);
    uint _416 = uint(_414);
    uint _418 = clamp(_416, 0u, 65535u);
    float _420 = _410 * _394;
    float _422 = _410 * _396;
    float _424 = _410 * _398;
    float _426 = precise::clamp(_424, 0.0, 1.0);
    float3 _1142 = float3(_420, _422, float(int(_418)));
    float3 _1146 = select(_1142, float3(0.0), isnan(_1142));
    float _428 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1146.xy, uint(rint(_1146.z)), _426);
    float _430 = fma(_404, 2.0, -1.0);
    float _432 = fma(_406, 2.0, -1.0);
    float _434 = _430 * (*spvDescriptorSet0.fp_c3)._m0[36].z;
    float _436 = _432 * (*spvDescriptorSet0.fp_c3)._m0[36].w;
    float _438 = fma(_434, 2.0, _54);
    float _440 = fma(_436, 2.0, _56);
    float2 _1173 = float2(_438, _440);
    float _442 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1173, float2(0.0), isnan(_1173))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1173, float2(0.0), isnan(_1173))).x;
    float _444 = -_190;
    float _446 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _448 = _444 + _446;
    float _450 = -_190;
    float _452 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _454 = _450 + _452;
    float _456 = _448 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _458 = precise::clamp(_456, 0.0, 1.0);
    float _460 = _454 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _462 = precise::clamp(_460, 0.0, 1.0);
    float _464 = fma(_266, (*spvDescriptorSet0.fp_c3)._m0[48].w, _462);
    float _466 = _428 + _458;
    out.m_47.x = _442;
    out.m_47.y = _466;
    out.m_47.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_47.w = _464;
    return out;
}

