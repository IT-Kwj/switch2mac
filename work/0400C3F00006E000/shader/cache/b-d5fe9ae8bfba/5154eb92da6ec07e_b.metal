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
    float4 m_38 [[user(locn0)]];
    float4 m_36 [[user(locn1)]];
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
    float2 _490 = float2(_64, _66);
    float _68 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_490, float2(0.0), isnan(_490))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_490, float2(0.0), isnan(_490))).x;
    float _70 = 1.0 / (*spvDescriptorSet0.fp_c3)._m0[8].z;
    float _72 = (*spvDescriptorSet0.fp_c3)._m0[7].z * (*spvDescriptorSet0.fp_c3)._m0[8].x;
    float _74 = 1.0 / _72;
    float _76 = -_68;
    float _78 = fma(_76, (*spvDescriptorSet0.fp_c3)._m0[8].w, 1.0);
    float _80 = float(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[9].x));
    float _82 = 1.0 / _78;
    float _84 = -(*spvDescriptorSet0.fp_c3)._m0[7].w;
    float _86 = fma(_82, (*spvDescriptorSet0.fp_c3)._m0[8].y, _84);
    float _88 = _86 * _74;
    float _90 = _88 * (*spvDescriptorSet0.fp_c3)._m0[8].x;
    float _92 = abs(_90);
    float _94 = log2(_92);
    float _96 = _94 * _70;
    float _98 = exp2(_96);
    float _100 = _80 * _98;
    float _102 = precise::min(_80, _100);
    float _104 = trunc(_102);
    int _107 = int(_104);
    bool _111 = _107 > 0;
    int _113 = as_type<int>(_80);
    if (!_111)
    {
        _113 = 0;
    }
    int _115 = _113;
    bool _117 = !_111;
    int _119 = _115;
    if (!_117)
    {
        float _121 = float(0u);
        float _123 = in.m_36.x;
        float _125 = gl_FragCoord.w;
        float _127 = _123 * _125;
        int _129 = abs(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[16].y));
        float _131 = in.m_36.z;
        float _133 = gl_FragCoord.w;
        float _135 = _131 * _133;
        float _137 = float(as_type<uint>((*spvDescriptorSet0.fp_c3)._m0[16].x));
        float _139 = in.m_38.x;
        float _141 = gl_FragCoord.w;
        float _143 = _139 * _141;
        float _145 = float(uint(_129));
        float _147 = in.m_38.y;
        float _149 = gl_FragCoord.w;
        float _151 = _147 * _149;
        int _153 = ~_129;
        int _155 = _153 + 1;
        float _157 = in.m_38.z;
        float _159 = gl_FragCoord.w;
        float _161 = _157 * _159;
        float _163 = 1.0 / _137;
        int _165 = ~_129;
        int _167 = _165 + 1;
        float _169 = 1.0 / _145;
        int _171 = as_type<int>(_163) + (-2);
        int _173 = ~as_type<int>((*spvDescriptorSet0.fp_c3)._m0[16].x);
        int _175 = _173 + 1;
        float _177 = as_type<float>(_171) * _121;
        float _179 = _62 * _127;
        int _181 = as_type<int>(_169) + (-2);
        float _183 = _62 * _135;
        float _185 = trunc(_177);
        float _187 = precise::max(_185, 0.0);
        uint _190 = uint(_187);
        float _192 = _121 * as_type<float>(_181);
        float _194 = trunc(_192);
        float _196 = precise::max(_194, 0.0);
        uint _198 = uint(_196);
        int _200 = _175 * int(_190);
        float _202 = float(uint(_200));
        int _204 = _155 * int(_198);
        float _206 = as_type<float>(_171) * _202;
        float _208 = float(uint(_204));
        float _210 = trunc(_206);
        float _212 = precise::max(_210, 0.0);
        uint _214 = uint(_212);
        float _216 = as_type<float>(_181) * _208;
        int _218 = ~as_type<int>((*spvDescriptorSet0.fp_c3)._m0[16].x);
        int _220 = _218 + 1;
        float _222 = trunc(_216);
        float _224 = precise::max(_222, 0.0);
        uint _226 = uint(_224);
        int _228 = int(_190) + int(_214);
        float _230 = in.m_36.y;
        float _232 = gl_FragCoord.w;
        float _234 = _230 * _232;
        int _236 = int(_198) + int(_226);
        int _238 = _220 * _228;
        float _240 = in.m_36.w;
        float _242 = gl_FragCoord.w;
        float _244 = _240 * _242;
        int _246 = _167 * _236;
        bool _248 = uint(_238) >= as_type<uint>((*spvDescriptorSet0.fp_c3)._m0[16].x);
        bool _250 = !_248;
        int _252 = _250 ? 0 : (-1);
        bool _254 = uint(_246) >= uint(_129);
        int _256 = ~_228;
        int _258 = _256 + _252;
        int _260 = _258 + 1;
        uint _262 = uint(int(uint(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[16].y)) >> uint(31)));
        bool _264 = !_254;
        int _266 = _264 ? 0 : (-1);
        int _268 = ~int(_262);
        int _270 = _268 + 1;
        int _272 = _260 * as_type<int>((*spvDescriptorSet0.fp_c3)._m0[16].x);
        bool _274 = 0 == as_type<int>((*spvDescriptorSet0.fp_c3)._m0[16].x);
        int _276 = ~_266;
        int _278 = _236 + _276;
        int _280 = _278 + 1;
        bool _282 = !_274;
        int _284 = _282 ? _272 : (-1);
        int _286 = _280 ^ _270;
        float _288 = float(_284);
        bool _290 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[16].y) == 0;
        float _292 = _62 * _234;
        int _294 = ~_270;
        int _296 = _294 + _286;
        int _298 = _296 + 1;
        float _300 = _62 * _244;
        float _302 = rint(_288);
        float _304 = precise::max(_302, 0.0);
        uint _306 = uint(_304);
        uint _308 = clamp(_306, 0u, 65535u);
        float _310 = _62 * _143;
        bool _312 = !_290;
        int _314 = _312 ? _298 : (-1);
        float _316 = _62 * _151;
        float _318 = _62 * _161;
        float _320 = float(_314);
        float _322 = 0.0;
        int _324 = 0;
        float _326 = 0.0;
        float _328 = 0.0;
        bool _330;
        float _454;
        do
        {
            float _332 = _322;
            int _334 = _324;
            float _336 = _326;
            float _338 = _328;
            float _340 = _332 * (*spvDescriptorSet0.fp_c3)._m0[8].x;
            float _342 = abs(_340);
            float _344 = log2(_342);
            float _346 = _344 * (*spvDescriptorSet0.fp_c3)._m0[8].z;
            float _348 = exp2(_346);
            float _350 = fma(_348, _316, _292);
            float _352 = fma(_348, _310, _179);
            float _354 = fma(_348, _318, _183);
            float _356 = _350 * (*spvDescriptorSet0.fp_c3)._m0[13].y;
            float _358 = _350 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
            float _360 = fma(_352, (*spvDescriptorSet0.fp_c3)._m0[13].x, _356);
            float _362 = fma(_352, (*spvDescriptorSet0.fp_c3)._m0[10].x, _358);
            float _364 = fma(_354, (*spvDescriptorSet0.fp_c3)._m0[13].z, _360);
            float _366 = _350 * (*spvDescriptorSet0.fp_c3)._m0[12].y;
            float _368 = _350 * (*spvDescriptorSet0.fp_c3)._m0[11].y;
            float _370 = fma(_354, (*spvDescriptorSet0.fp_c3)._m0[10].z, _362);
            float _372 = fma(_300, (*spvDescriptorSet0.fp_c3)._m0[13].w, _364);
            float _374 = fma(_352, (*spvDescriptorSet0.fp_c3)._m0[12].x, _366);
            float _376 = fma(_352, (*spvDescriptorSet0.fp_c3)._m0[11].x, _368);
            float _378 = fma(_300, (*spvDescriptorSet0.fp_c3)._m0[10].w, _370);
            float _380 = 1.0 / _372;
            float _382 = fma(_354, (*spvDescriptorSet0.fp_c3)._m0[12].z, _374);
            float _384 = fma(_354, (*spvDescriptorSet0.fp_c3)._m0[11].z, _376);
            float _386 = fma(_300, (*spvDescriptorSet0.fp_c3)._m0[12].w, _382);
            float _388 = fma(_300, (*spvDescriptorSet0.fp_c3)._m0[11].w, _384);
            float _390 = _388 * _380;
            float _392 = _386 * _380;
            float _394 = _378 * _380;
            float _396 = -(*spvDescriptorSet0.fp_c3)._m0[15].w;
            float _398 = _390 + _396;
            float _400 = -(*spvDescriptorSet0.fp_c3)._m0[15].z;
            float _402 = _394 + _400;
            float3 _994 = float3(_394, _390, float(int(_308)));
            float3 _998 = select(_994, float3(0.0), isnan(_994));
            float _404 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, _998.xy, uint(rint(_998.z)), _392, level(_320));
            float _406 = _394 + (*spvDescriptorSet0.fp_c3)._m0[15].z;
            float3 _1012 = float3(_402, _390, float(int(_308)));
            float3 _1014 = select(_1012, float3(0.0), isnan(_1012));
            float _408 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, _1014.xy, uint(rint(_1014.z)), _392, level(_320));
            float _410 = _390 + (*spvDescriptorSet0.fp_c3)._m0[15].w;
            float3 _1028 = float3(_394, _398, float(int(_308)));
            float3 _1030 = select(_1028, float3(0.0), isnan(_1028));
            float _412 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, _1030.xy, uint(rint(_1030.z)), _392, level(_320));
            float3 _1040 = float3(_406, _390, float(int(_308)));
            float3 _1042 = select(_1040, float3(0.0), isnan(_1040));
            float _414 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, _1042.xy, uint(rint(_1042.z)), _392, level(_320));
            float3 _1052 = float3(_394, _410, float(int(_308)));
            float3 _1054 = select(_1052, float3(0.0), isnan(_1052));
            float _416 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, _1054.xy, uint(rint(_1054.z)), _392, level(_320));
            float3 _1064 = float3(_402, _398, float(int(_308)));
            float3 _1066 = select(_1064, float3(0.0), isnan(_1064));
            float _418 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, _1066.xy, uint(rint(_1066.z)), _392, level(_320));
            float3 _1076 = float3(_406, _398, float(int(_308)));
            float3 _1078 = select(_1076, float3(0.0), isnan(_1076));
            float _420 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, _1078.xy, uint(rint(_1078.z)), _392, level(_320));
            float3 _1088 = float3(_402, _410, float(int(_308)));
            float3 _1090 = select(_1088, float3(0.0), isnan(_1088));
            float _422 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, _1090.xy, uint(rint(_1090.z)), _392, level(_320));
            float3 _1100 = float3(_406, _410, float(int(_308)));
            float3 _1102 = select(_1100, float3(0.0), isnan(_1100));
            float _424 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, _1102.xy, uint(rint(_1102.z)), _392, level(_320));
            int _426 = _334 + 1;
            float _428 = _332 + 1.0;
            bool _430 = _426 >= _107;
            float _432 = _404 + _336;
            float _434 = _432 + _408;
            float _436 = _434 + _412;
            float _438 = _436 + _414;
            float _440 = _438 + _416;
            float _442 = _440 + _418;
            float _444 = _442 + _420;
            float _446 = _444 + _422;
            float _448 = _446 + _424;
            float _450 = _448 * 0.111111111938953399658203125;
            float _452 = fma(_450, (*spvDescriptorSet0.fp_c3)._m0[15].x, (*spvDescriptorSet0.fp_c3)._m0[15].y);
            _454 = fma(_452, (*spvDescriptorSet0.fp_c3)._m0[8].x, _338);
            _330 = !_430;
            _322 = _428;
            _324 = _426;
            _326 = _450;
            _328 = _454;
        } while (_330);
        _119 = as_type<int>(_454);
    }
    int _456 = _119;
    out.m_41.x = as_type<float>(_456);
    out.m_41.y = as_type<float>(_456);
    out.m_41.z = as_type<float>(_456);
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
    float2 _490 = float2(_64, _66);
    float _68 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_490, float2(0.0), isnan(_490))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_490, float2(0.0), isnan(_490))).x;
    float _70 = 1.0 / (*spvDescriptorSet0.fp_c3)._m0[8].z;
    float _72 = (*spvDescriptorSet0.fp_c3)._m0[7].z * (*spvDescriptorSet0.fp_c3)._m0[8].x;
    float _74 = 1.0 / _72;
    float _76 = -_68;
    float _78 = fma(_76, (*spvDescriptorSet0.fp_c3)._m0[8].w, 1.0);
    float _80 = float(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[9].x));
    float _82 = 1.0 / _78;
    float _84 = -(*spvDescriptorSet0.fp_c3)._m0[7].w;
    float _86 = fma(_82, (*spvDescriptorSet0.fp_c3)._m0[8].y, _84);
    float _88 = _86 * _74;
    float _90 = _88 * (*spvDescriptorSet0.fp_c3)._m0[8].x;
    float _92 = abs(_90);
    float _94 = log2(_92);
    float _96 = _94 * _70;
    float _98 = exp2(_96);
    float _100 = _80 * _98;
    float _102 = precise::min(_80, _100);
    float _104 = trunc(_102);
    int _107 = int(_104);
    bool _111 = _107 > 0;
    int _113 = as_type<int>(_80);
    if (!_111)
    {
        _113 = 0;
    }
    int _115 = _113;
    bool _117 = !_111;
    int _119 = _115;
    if (!_117)
    {
        float _121 = float(0u);
        float _123 = in.m_36.x;
        float _125 = gl_FragCoord.w;
        float _127 = _123 * _125;
        int _129 = abs(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[16].y));
        float _131 = in.m_36.z;
        float _133 = gl_FragCoord.w;
        float _135 = _131 * _133;
        float _137 = float(as_type<uint>((*spvDescriptorSet0.fp_c3)._m0[16].x));
        float _139 = in.m_38.x;
        float _141 = gl_FragCoord.w;
        float _143 = _139 * _141;
        float _145 = float(uint(_129));
        float _147 = in.m_38.y;
        float _149 = gl_FragCoord.w;
        float _151 = _147 * _149;
        int _153 = ~_129;
        int _155 = _153 + 1;
        float _157 = in.m_38.z;
        float _159 = gl_FragCoord.w;
        float _161 = _157 * _159;
        float _163 = 1.0 / _137;
        int _165 = ~_129;
        int _167 = _165 + 1;
        float _169 = 1.0 / _145;
        int _171 = as_type<int>(_163) + (-2);
        int _173 = ~as_type<int>((*spvDescriptorSet0.fp_c3)._m0[16].x);
        int _175 = _173 + 1;
        float _177 = as_type<float>(_171) * _121;
        float _179 = _62 * _127;
        int _181 = as_type<int>(_169) + (-2);
        float _183 = _62 * _135;
        float _185 = trunc(_177);
        float _187 = precise::max(_185, 0.0);
        uint _190 = uint(_187);
        float _192 = _121 * as_type<float>(_181);
        float _194 = trunc(_192);
        float _196 = precise::max(_194, 0.0);
        uint _198 = uint(_196);
        int _200 = _175 * int(_190);
        float _202 = float(uint(_200));
        int _204 = _155 * int(_198);
        float _206 = as_type<float>(_171) * _202;
        float _208 = float(uint(_204));
        float _210 = trunc(_206);
        float _212 = precise::max(_210, 0.0);
        uint _214 = uint(_212);
        float _216 = as_type<float>(_181) * _208;
        int _218 = ~as_type<int>((*spvDescriptorSet0.fp_c3)._m0[16].x);
        int _220 = _218 + 1;
        float _222 = trunc(_216);
        float _224 = precise::max(_222, 0.0);
        uint _226 = uint(_224);
        int _228 = int(_190) + int(_214);
        float _230 = in.m_36.y;
        float _232 = gl_FragCoord.w;
        float _234 = _230 * _232;
        int _236 = int(_198) + int(_226);
        int _238 = _220 * _228;
        float _240 = in.m_36.w;
        float _242 = gl_FragCoord.w;
        float _244 = _240 * _242;
        int _246 = _167 * _236;
        bool _248 = uint(_238) >= as_type<uint>((*spvDescriptorSet0.fp_c3)._m0[16].x);
        bool _250 = !_248;
        int _252 = _250 ? 0 : (-1);
        bool _254 = uint(_246) >= uint(_129);
        int _256 = ~_228;
        int _258 = _256 + _252;
        int _260 = _258 + 1;
        uint _262 = uint(int(uint(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[16].y)) >> uint(31)));
        bool _264 = !_254;
        int _266 = _264 ? 0 : (-1);
        int _268 = ~int(_262);
        int _270 = _268 + 1;
        int _272 = _260 * as_type<int>((*spvDescriptorSet0.fp_c3)._m0[16].x);
        bool _274 = 0 == as_type<int>((*spvDescriptorSet0.fp_c3)._m0[16].x);
        int _276 = ~_266;
        int _278 = _236 + _276;
        int _280 = _278 + 1;
        bool _282 = !_274;
        int _284 = _282 ? _272 : (-1);
        int _286 = _280 ^ _270;
        float _288 = float(_284);
        bool _290 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[16].y) == 0;
        float _292 = _62 * _234;
        int _294 = ~_270;
        int _296 = _294 + _286;
        int _298 = _296 + 1;
        float _300 = _62 * _244;
        float _302 = rint(_288);
        float _304 = precise::max(_302, 0.0);
        uint _306 = uint(_304);
        uint _308 = clamp(_306, 0u, 65535u);
        float _310 = _62 * _143;
        bool _312 = !_290;
        int _314 = _312 ? _298 : (-1);
        float _316 = _62 * _151;
        float _318 = _62 * _161;
        float _320 = float(_314);
        float _322 = 0.0;
        int _324 = 0;
        float _326 = 0.0;
        float _328 = 0.0;
        bool _330;
        float _454;
        do
        {
            float _332 = _322;
            int _334 = _324;
            float _336 = _326;
            float _338 = _328;
            float _340 = _332 * (*spvDescriptorSet0.fp_c3)._m0[8].x;
            float _342 = abs(_340);
            float _344 = log2(_342);
            float _346 = _344 * (*spvDescriptorSet0.fp_c3)._m0[8].z;
            float _348 = exp2(_346);
            float _350 = fma(_348, _316, _292);
            float _352 = fma(_348, _310, _179);
            float _354 = fma(_348, _318, _183);
            float _356 = _350 * (*spvDescriptorSet0.fp_c3)._m0[13].y;
            float _358 = _350 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
            float _360 = fma(_352, (*spvDescriptorSet0.fp_c3)._m0[13].x, _356);
            float _362 = fma(_352, (*spvDescriptorSet0.fp_c3)._m0[10].x, _358);
            float _364 = fma(_354, (*spvDescriptorSet0.fp_c3)._m0[13].z, _360);
            float _366 = _350 * (*spvDescriptorSet0.fp_c3)._m0[12].y;
            float _368 = _350 * (*spvDescriptorSet0.fp_c3)._m0[11].y;
            float _370 = fma(_354, (*spvDescriptorSet0.fp_c3)._m0[10].z, _362);
            float _372 = fma(_300, (*spvDescriptorSet0.fp_c3)._m0[13].w, _364);
            float _374 = fma(_352, (*spvDescriptorSet0.fp_c3)._m0[12].x, _366);
            float _376 = fma(_352, (*spvDescriptorSet0.fp_c3)._m0[11].x, _368);
            float _378 = fma(_300, (*spvDescriptorSet0.fp_c3)._m0[10].w, _370);
            float _380 = 1.0 / _372;
            float _382 = fma(_354, (*spvDescriptorSet0.fp_c3)._m0[12].z, _374);
            float _384 = fma(_354, (*spvDescriptorSet0.fp_c3)._m0[11].z, _376);
            float _386 = fma(_300, (*spvDescriptorSet0.fp_c3)._m0[12].w, _382);
            float _388 = fma(_300, (*spvDescriptorSet0.fp_c3)._m0[11].w, _384);
            float _390 = _388 * _380;
            float _392 = _386 * _380;
            float _394 = _378 * _380;
            float _396 = -(*spvDescriptorSet0.fp_c3)._m0[15].w;
            float _398 = _390 + _396;
            float _400 = -(*spvDescriptorSet0.fp_c3)._m0[15].z;
            float _402 = _394 + _400;
            float3 _994 = float3(_394, _390, float(int(_308)));
            float3 _998 = select(_994, float3(0.0), isnan(_994));
            float _404 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, _998.xy, uint(rint(_998.z)), _392, level(_320));
            float _406 = _394 + (*spvDescriptorSet0.fp_c3)._m0[15].z;
            float3 _1012 = float3(_402, _390, float(int(_308)));
            float3 _1014 = select(_1012, float3(0.0), isnan(_1012));
            float _408 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, _1014.xy, uint(rint(_1014.z)), _392, level(_320));
            float _410 = _390 + (*spvDescriptorSet0.fp_c3)._m0[15].w;
            float3 _1028 = float3(_394, _398, float(int(_308)));
            float3 _1030 = select(_1028, float3(0.0), isnan(_1028));
            float _412 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, _1030.xy, uint(rint(_1030.z)), _392, level(_320));
            float3 _1040 = float3(_406, _390, float(int(_308)));
            float3 _1042 = select(_1040, float3(0.0), isnan(_1040));
            float _414 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, _1042.xy, uint(rint(_1042.z)), _392, level(_320));
            float3 _1052 = float3(_394, _410, float(int(_308)));
            float3 _1054 = select(_1052, float3(0.0), isnan(_1052));
            float _416 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, _1054.xy, uint(rint(_1054.z)), _392, level(_320));
            float3 _1064 = float3(_402, _398, float(int(_308)));
            float3 _1066 = select(_1064, float3(0.0), isnan(_1064));
            float _418 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, _1066.xy, uint(rint(_1066.z)), _392, level(_320));
            float3 _1076 = float3(_406, _398, float(int(_308)));
            float3 _1078 = select(_1076, float3(0.0), isnan(_1076));
            float _420 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, _1078.xy, uint(rint(_1078.z)), _392, level(_320));
            float3 _1088 = float3(_402, _410, float(int(_308)));
            float3 _1090 = select(_1088, float3(0.0), isnan(_1088));
            float _422 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, _1090.xy, uint(rint(_1090.z)), _392, level(_320));
            float3 _1100 = float3(_406, _410, float(int(_308)));
            float3 _1102 = select(_1100, float3(0.0), isnan(_1100));
            float _424 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, _1102.xy, uint(rint(_1102.z)), _392, level(_320));
            int _426 = _334 + 1;
            float _428 = _332 + 1.0;
            bool _430 = _426 >= _107;
            float _432 = _404 + _336;
            float _434 = _432 + _408;
            float _436 = _434 + _412;
            float _438 = _436 + _414;
            float _440 = _438 + _416;
            float _442 = _440 + _418;
            float _444 = _442 + _420;
            float _446 = _444 + _422;
            float _448 = _446 + _424;
            float _450 = _448 * 0.111111111938953399658203125;
            float _452 = fma(_450, (*spvDescriptorSet0.fp_c3)._m0[15].x, (*spvDescriptorSet0.fp_c3)._m0[15].y);
            _454 = fma(_452, (*spvDescriptorSet0.fp_c3)._m0[8].x, _338);
            _330 = !_430;
            _322 = _428;
            _324 = _426;
            _326 = _450;
            _328 = _454;
        } while (_330);
        _119 = as_type<int>(_454);
    }
    int _456 = _119;
    out.m_41.x = as_type<float>(_456);
    out.m_41.y = as_type<float>(_456);
    out.m_41.z = as_type<float>(_456);
    return main0_out_u{as_type<uint4>(out.m_41)};
}

